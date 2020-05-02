#include "ScriptPCH.h"
#include "scarlet_halls.h"

enum Texts
{
	SAY_AGGRO = 2,
	SAY_CALL_GUARDS = 0,
	SAY_KILL = 3,
	SAY_DEATH = 1,
	SAY_CALL = 4,
};

enum Spells
{
	SPELL_BERSERKER_RAGE = 111221,
	SPELL_BERSERKER_RAGE_AURA = 111220,

	SPELL_DRAGONS_REACH = 111217,

	SPELL_HEROIC_LEAP = 111219,
	SPELL_HEROIC_LEAP_DMG = 111218,

	SPELL_BLADES_OF_LIGHT = 111216,
	SPELL_BLADES_OF_LIGHT_AOE = 111394,
	SPELL_BLADES_OF_LIGHT_DMG = 111215,
	SPELL_BLADES_OF_LIGHT_VEHICLE = 112955,

	SPELL_CALL_REINFORSMENTS_1 = 111755,
	SPELL_CALL_REINFORSMENTS_2 = 111756,

	SPELL_HEAVY_ARMOR = 113959,
	SPELL_UNARMORED_1 = 113969,
	SPELL_UNARMORED_2 = 113970,
	SPELL_UNARMORED_DEBUFF = 112920,

	SPELL_MOSH_PIT = 115674, // achievement
};

enum Events
{
	EVENT_DRAGONS_REACH = 1,
	EVENT_HEROIC_LEAP,
	EVENT_BLADES_OF_LIGHT_STOP,
	EVENT_STOP_MOVE,
	EVENT_REINFORCEMENTS,
};

enum Timers
{
	TIMER_DRAGONS_REACH = 7 * IN_MILLISECONDS,
	TIMER_HEROIC_LEAP_FIRST = 40 * IN_MILLISECONDS,
	TIMER_HEROIC_LEAP = 30 * IN_MILLISECONDS,
	TIMER_BLADES_OF_LIGHT_DURATION = 20 * IN_MILLISECONDS,
	TIMER_REINFORCEMENTS = 20 * IN_MILLISECONDS,
};

enum Adds
{
	NPC_SCARLET_DEFENDER_2 = 58998,
};

enum eDatas
{
	DATA_MOSH_PIT = 1,
};

#define MOSH_PIT_TARGET_COUNT 8

const Position centerPos = { 1206.77f, 443.738f, 0.987947f, 3.20916f };

class boss_armsmaster_harlan : public CreatureScript
{
public:
	boss_armsmaster_harlan() : CreatureScript("boss_armsmaster_harlan") { }

	CreatureAI* GetAI(Creature* creature) const
	{
		return new boss_armsmaster_harlanAI(creature);
	}

	struct boss_armsmaster_harlanAI : public BossAI
	{
		boss_armsmaster_harlanAI(Creature* creature) : BossAI(creature, DATA_ARMSMASTER_HARLAN)
		{
			//ApplyAllImmunities(true); -- Need to look into this function from PandaWoW
		}

		void Reset()
		{
			_Reset();

			me->SetReactState(REACT_AGGRESSIVE);

			m_IsInRage = false;
			m_EvadeCheckTimer = 1000;
			m_MoshPitDone = false;
		}

		void EnterCombat(Unit* /*who*/) override
		{
			Talk(SAY_AGGRO);

			events.ScheduleEvent(EVENT_DRAGONS_REACH, TIMER_DRAGONS_REACH);
			events.ScheduleEvent(EVENT_HEROIC_LEAP, TIMER_HEROIC_LEAP);
			events.ScheduleEvent(EVENT_REINFORCEMENTS, TIMER_REINFORCEMENTS);

			// Need to understand what this achievement is and why this CONDITION_UNK3 is missing/if it has been renamed.
			//instance->DoResetAchievementCriteria(ACHIEVEMENT_CRITERIA_TYPE_BE_SPELL_TARGET2, ACHIEVEMENT_CRITERIA_CONDITION_UNK3, 31142);

			instance->SetBossState(DATA_ARMSMASTER_HARLAN, IN_PROGRESS);
			DoZoneInCombat();
		}

		void SetData(uint32 type, uint32 data) override
		{
			if (type == DATA_MOSH_PIT && data == DONE)
			{
				HandleMoshPit();
			}
		}

		void KilledUnit(Unit* victim) override
		{
			if (victim && victim->IsPlayer())
			{
				Talk(SAY_KILL);
			}
		}

		void MovementInform(uint32 type, uint32 id) override
		{
			if (type == EFFECT_MOTION_TYPE && id == EVENT_JUMP)
			{
				me->GetMotionMaster()->MovementExpired(false);
				DoBladesOfLight();
			}
		}

		void JustDied(Unit* /*killer*/) override
		{
			_JustDied();

			Talk(SAY_DEATH);
		}

		void UpdateAI(uint32 const diff) override
		{
			if (!UpdateVictim())
				return;

			events.Update(diff);

			if (CheckEvade(diff))
				return;

			if (me->HasUnitState(UNIT_STATE_CASTING))
				return;

			if (uint32 eventId = events.ExecuteEvent())
			{
				ExecuteEvent(eventId);
			}

			DoMeleeAttackIfReady();
		}

	private:

		void ExecuteEvent(const uint32 eventId) override
		{
			switch (eventId)
			{
			case EVENT_DRAGONS_REACH:
				DoDragonsReach();
				events.ScheduleEvent(EVENT_DRAGONS_REACH, TIMER_DRAGONS_REACH);
				break;
			case EVENT_REINFORCEMENTS:
				DoCallReinforcements();
				events.ScheduleEvent(EVENT_REINFORCEMENTS, TIMER_REINFORCEMENTS);
				break;
			case EVENT_HEROIC_LEAP:
				DoHeroicLeap();
				break;
			case EVENT_BLADES_OF_LIGHT_STOP:
				DoStopBladesOfLight();
				break;
			default:
				break;
			}
		}

		void UpdateRage()
		{
			if (m_IsInRage)
				return;

			if (!m_IsInRage && me->GetHealthPct() <= 50.f)
			{
				m_IsInRage = true;

				DoCast(me, SPELL_BERSERKER_RAGE, true);
			}
		}

		bool CheckEvade(const uint32 diff)
		{
			if (m_EvadeCheckTimer <= diff)
			{
				m_EvadeCheckTimer = 1000;

				if (me->GetExactDist(me->GetHomePosition().GetPositionX(), me->GetHomePosition().GetPositionY(), me->GetHomePosition().GetPositionZ()) >= 23.f)
				{
					EnterEvadeMode();
					return true;
				}
			}
			else
			{
				m_EvadeCheckTimer -= diff;
			}

			return false;
		}

		void DoDragonsReach()
		{
			DoCastVictim(SPELL_DRAGONS_REACH);
		}

		void DoCallReinforcements()
		{
			Talk(SAY_CALL);

			DoCast(me, SPELL_CALL_REINFORSMENTS_1, true);
		}

		void DoHeroicLeap()
		{
			me->SetReactState(REACT_PASSIVE);
			me->AttackStop();

			events.CancelEvent(EVENT_DRAGONS_REACH);
			events.CancelEvent(EVENT_REINFORCEMENTS);

			// There is a bug in movement handlers
			// if a creature is at the jump pos, it doesn't jump and doesn't call 'MovementInform'
			if (me->GetExactDist(&centerPos) >= 3.f)
			{
				DoCast(SPELL_HEROIC_LEAP);
			}
			else
			{
				DoBladesOfLight();
			}
		}

		void DoBladesOfLight()
		{
			DoCast(me, SPELL_BLADES_OF_LIGHT);

			events.ScheduleEvent(EVENT_BLADES_OF_LIGHT_STOP, TIMER_BLADES_OF_LIGHT_DURATION);
		}

		void DoStopBladesOfLight()
		{
			me->RemoveAura(SPELL_BLADES_OF_LIGHT);

			events.ScheduleEvent(EVENT_DRAGONS_REACH, TIMER_DRAGONS_REACH);
			events.ScheduleEvent(EVENT_REINFORCEMENTS, TIMER_REINFORCEMENTS);
			events.ScheduleEvent(EVENT_HEROIC_LEAP, TIMER_HEROIC_LEAP);

			me->SetReactState(REACT_AGGRESSIVE);
		}

		void HandleMoshPit()
		{
			if (m_MoshPitDone)
				return;

			m_MoshPitDone = true;

			instance->DoUpdateAchievementCriteria(ACHIEVEMENT_CRITERIA_TYPE_BE_SPELL_TARGET2, SPELL_MOSH_PIT);
		}

	private:

		bool m_IsInRage;
		uint32 m_EvadeCheckTimer;
		bool m_MoshPitDone;
	};
};

class npc_armsmaster_harlan_scarlet_defender : public CreatureScript
{
public:
	npc_armsmaster_harlan_scarlet_defender() : CreatureScript("npc_armsmaster_harlan_scarlet_defender") {}

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_armsmaster_harlan_scarlet_defenderAI(creature);
	}

	struct npc_armsmaster_harlan_scarlet_defenderAI : public ScriptedAI
	{
		npc_armsmaster_harlan_scarlet_defenderAI(Creature* creature) : ScriptedAI(creature)
		{

		}

		void Reset() override
		{
			DoCast(me, SPELL_HEAVY_ARMOR, true);
		}

		void JustDied(Unit* who) override
		{
			me->DespawnOrUnsummon(3000);
		}

		void UpdateAI(const uint32 diff)
		{
			if (!UpdateVictim())
				return;

			DoMeleeAttackIfReady();
		}

	private:

	};
};

class spell_armsmaster_harlan_blades_of_light_aoe : public SpellScriptLoader
{
public:
	spell_armsmaster_harlan_blades_of_light_aoe() : SpellScriptLoader("spell_armsmaster_harlan_blades_of_light_aoe") { }

	class spell_armsmaster_harlan_blades_of_light_aoe_SpellScript : public SpellScript
	{
		PrepareSpellScript(spell_armsmaster_harlan_blades_of_light_aoe_SpellScript);

		void FilterTargets(std::list<WorldObject*>& targets)
		{
			targets.remove_if([](WorldObject* target) -> bool
			{
				Unit* unitTarget = target->ToUnit();
				if (!unitTarget)
					return true;

				bool isPlayer = unitTarget->IsPlayer();

				bool isCreature = unitTarget->GetEntry() == NPC_SCARLET_DEFENDER_2 &&
					(unitTarget->HasAura(SPELL_UNARMORED_1) || unitTarget->HasAura(SPELL_UNARMORED_2));

				if (!isPlayer && !isCreature)
					return true;

				return false;
			});


			if (targets.size() >= MOSH_PIT_TARGET_COUNT)
			{
				if (GetCaster())
				{
					if (Creature* pCreature = GetCaster()->ToCreature())
					{
						pCreature->AI()->SetData(DATA_MOSH_PIT, DONE);
					}
				}
			}
		}

		void HandleHitTarget(SpellEffIndex effIndex)
		{
			if (!GetCaster() || !GetHitUnit())
				return;

			GetCaster()->CastSpell(GetHitUnit(), SPELL_BLADES_OF_LIGHT_DMG, true);
		}

		void Register()
		{
			OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_armsmaster_harlan_blades_of_light_aoe_SpellScript::FilterTargets, EFFECT_0, TARGET_UNIT_SRC_AREA_ENTRY);
			OnEffectHitTarget += SpellEffectFn(spell_armsmaster_harlan_blades_of_light_aoe_SpellScript::HandleHitTarget, EFFECT_0, SPELL_EFFECT_DUMMY);
		}
	};

	SpellScript* GetSpellScript() const override
	{
		return new spell_armsmaster_harlan_blades_of_light_aoe_SpellScript();
	}
};

class spell_armsmaster_harlan_heavy_armor : public SpellScriptLoader
{
public:
	spell_armsmaster_harlan_heavy_armor() : SpellScriptLoader("spell_armsmaster_harlan_heavy_armor") { }

	class spell_armsmaster_harlan_heavy_armor_AuraScript : public AuraScript
	{
		PrepareAuraScript(spell_armsmaster_harlan_heavy_armor_AuraScript);

		void HandleRemove(AuraEffect const* /*aurEff*/, AuraEffectHandleModes /*mode*/)
		{
			if (!GetUnitOwner())
				return;

			GetUnitOwner()->CastSpell(GetUnitOwner(), SPELL_UNARMORED_1, true);
			GetUnitOwner()->CastSpell(GetUnitOwner(), SPELL_UNARMORED_DEBUFF, true);
		}

		void Register()
		{
			OnEffectRemove += AuraEffectRemoveFn(spell_armsmaster_harlan_heavy_armor_AuraScript::HandleRemove, EFFECT_1, SPELL_AURA_SCHOOL_ABSORB, AURA_EFFECT_HANDLE_REAL);
		}
	};

	AuraScript* GetAuraScript() const override
	{
		return new spell_armsmaster_harlan_heavy_armor_AuraScript();
	}
};

void AddSC_boss_armsmaster_harlan()
{
	new boss_armsmaster_harlan();                   // 58632
	new npc_armsmaster_harlan_scarlet_defender();   // 58998

	new spell_armsmaster_harlan_blades_of_light_aoe();  // 111394
	new spell_armsmaster_harlan_heavy_armor();          // 113959
}