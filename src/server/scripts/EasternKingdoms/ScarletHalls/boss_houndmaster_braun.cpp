#include "ScriptPCH.h"
#include "scarlet_halls.h"

enum Texts
{
	SAY_DOGS = 0,
	SAY_RAGE = 2,
	SAY_DEATH_1 = 3,
	SAY_DEATH_2 = 4,
	SAY_DOG_KILLED = 5,
	SAY_AGGRO = 6,
	SAY_WIPE = 7,
	SAY_KILL = 8,
};

enum Spells
{
	SPELL_BLOODY_RAGE = 116140,
	SPELL_CALL_DOG = 114259,

	SPELL_PIERCING_THROW = 114004,
	SPELL_PIERCING_THROW_DUMMY = 114017,
	SPELL_PIERCING_THROW_DMG = 114020,
	SPELL_PIERCING_THROW_AOE = 114021, // targetting

	SPELL_DEATH_BLOSSOM_JUMP = 114241,
	SPELL_DEATH_BLOSSOM_DMG = 114242,

	SPELL_BLOODY_MESS = 114056,
	SPELL_BLOODY_MESS_DUMMY = 114084,

	SPELL_DOG_LEAP_BOSS = 122929,
	SPELL_HOUNDMASTER_BRAUN_EATEN = 122916,
};

enum Events
{
	EVENT_CLOSE_DOOR = 1,
	EVENT_ATTACK_HOUNDMASTER,
	EVENT_HOUNDMASTER_DEATH,
	EVENT_PIERCING_THROW,
	EVENT_DEATH_BLOSSOM,
};

enum Timers
{
	TIMER_CLOSE_DOOR = 3 * IN_MILLISECONDS,
	TIMER_PIERCING_THROW_FIRST = 7 * IN_MILLISECONDS,
	TIMER_PIERCING_THROW = 14 * IN_MILLISECONDS,
};

enum Actions
{
	ACTION_ACTIVATE_DOG = 1,
	ACTION_ATTACK_HOUNDMASTER,
};

enum eData
{
	DATA_HOUND_ACTIVATED = 1,
	DATA_HOUND_KILLED,
};

#define DOGS_COUNT 12
#define DOGS_FIRST_COUNT 9
const Position obedientHoundPos[DOGS_COUNT] =
{
	{1025.91f, 511.129f, 13.4883f, 3.18734f},
	{1025.97f, 509.871f, 13.4883f, 3.18734f},
	{1026.05f, 508.262f, 13.4883f, 3.18734f},
	{1005.01f, 495.922f, 13.4886f, 1.54367f},
	{1007.03f, 498.193f, 13.3783f, 1.54367f},
	{1003.56f, 498.287f, 13.3465f, 1.54367f},
	{1012.15f, 530.723f, 13.4887f, 4.62025f},
	{1013.6f, 530.838f, 13.4887f, 4.62025f},
	{1014.91f, 530.717f, 13.4887f, 4.62025f},
	// last 3 dogs close the 'door' if the encounter is started
	{ 991.761f, 519.f, 13.488f, 6.262798f },
	{ 991.724f, 517.511f, 13.488f, 6.262798f },
	{ 991.894f, 515.835f, 13.488f, 6.262798f }
};

class HoundCheckPredicate
{
public:
	HoundCheckPredicate(Unit* searcher) : _searcher(searcher) {}

	bool operator()(uint64 guid)
	{
		if (GUID_ENPART(guid) != NPC_OBEDIENT_HOUND)
			return false;

		Creature* pDog = _searcher->GetCreature(*_searcher, guid);
		if (!pDog || pDog->AI()->GetData(DATA_HOUND_ACTIVATED) != 0)
			return false;

		return true;
	}

private:
	Unit* _searcher;
};

class boss_houndmaster_braun : public CreatureScript
{
public:
	boss_houndmaster_braun() : CreatureScript("boss_houndmaster_braun") { }

	CreatureAI* GetAI(Creature* creature) const
	{
		return new boss_houndmaster_braunAI(creature);
	}

	struct boss_houndmaster_braunAI : public BossAI
	{
		boss_houndmaster_braunAI(Creature* creature) : BossAI(creature, DATA_HOUNDMASTER_BRAUN)
		{
			//ApplyAllImmunities(true); -- Need to look into this function from PandaWoW
		}

		void Reset() override
		{
			_Reset();

			me->SetReactState(REACT_DEFENSIVE);

			m_ReleaseDogsCount = 0;
			m_IsHoundKilled = false;

			InitializeDogs();
		}

		void EnterCombat(Unit* /*who*/) override
		{
			Talk(SAY_AGGRO);

			events.ScheduleEvent(EVENT_CLOSE_DOOR, TIMER_CLOSE_DOOR);
			events.ScheduleEvent(EVENT_PIERCING_THROW, TIMER_PIERCING_THROW_FIRST);
		}

		void JustDied(Unit* /*killer*/) override
		{
			_JustDied();
		}

		void KilledUnit(Unit* victim) override
		{
			if (victim && victim->IsPlayer())
			{
				Talk(SAY_KILL);
			}
		}

		void DamageTaken(Unit* done_by, uint32 &damage, SpellInfo const*  /*p_SpellInfo*/) override
		{
			if (m_ReleaseDogsCount == 6)
			{
				damage = 0;
			}
		}

		uint32 GetData(uint32 type) override
		{
			if (type == DATA_HOUND_KILLED)
			{
				return m_IsHoundKilled ? 1 : 0;
			}

			return 0;
		}

		void EnterEvadeMode() override
		{
			Talk(SAY_WIPE);

			BossAI::EnterEvadeMode();
		}

		void SummonedCreatureDies(Creature* summon, Unit* killer) override
		{
			if (summon->GetEntry() == NPC_OBEDIENT_HOUND)
			{
				Talk(SAY_DOG_KILLED);

				m_IsHoundKilled = true;
			}

			BossAI::SummonedCreatureDies(summon, killer);
		}

		void UpdateAI(uint32 const diff) override
		{
			if (!UpdateVictim())
				return;

			events.Update(diff);

			UpdateReleaseDogs();

			if (me->HasUnitState(UNIT_STATE_CASTING))
				return;

			if (uint32 eventId = events.ExecuteEvent())
			{
				ExecuteEvent(eventId);
			}

			DoMeleeAttackIfReady();
		}

	private:

		void InitializeDogs()
		{
			for (uint8 i = 0; i < DOGS_FIRST_COUNT; ++i)
			{
				me->SummonCreature(NPC_OBEDIENT_HOUND, obedientHoundPos[i]);
			}
		}

		void ExecuteEvent(const uint32 eventId) override
		{
			switch (eventId)
			{
			case EVENT_CLOSE_DOOR:
				DoCloseDoor();
				break;
			case EVENT_ATTACK_HOUNDMASTER:
				DogsAttackHoundmaster();
				break;
			case EVENT_HOUNDMASTER_DEATH:
				HoundmasterDeath();
				break;
			case EVENT_PIERCING_THROW:
				if (urand(0, 1))
				{
					DoPiercingThrow();
				}
				else
				{
					DoDeathBlossom();
				}
				events.ScheduleEvent(EVENT_PIERCING_THROW, TIMER_PIERCING_THROW);
				break;
			default:
				break;
			}
		}

		void UpdateReleaseDogs()
		{
			if (m_ReleaseDogsCount == 0 && me->GetHealthPct() <= 90.f)
			{
				m_ReleaseDogsCount = 1;
				Talk(SAY_DOGS);
				ReleaseDog();
			}
			else if (m_ReleaseDogsCount == 1 && me->GetHealthPct() <= 80.f)
			{
				m_ReleaseDogsCount = 2;
				ReleaseDog();
			}
			else if (m_ReleaseDogsCount == 2 && me->GetHealthPct() <= 70.f)
			{
				m_ReleaseDogsCount = 3;
				ReleaseDog();
			}
			else if (m_ReleaseDogsCount == 3 && me->GetHealthPct() <= 60.f)
			{
				m_ReleaseDogsCount = 4;
				ReleaseDog();
			}
			else if (m_ReleaseDogsCount == 4 && me->GetHealthPct() <= 50.f)
			{
				m_ReleaseDogsCount = 5;
				DoBloodyRage();
			}
			else if (m_ReleaseDogsCount == 5 && me->GetHealthPct() < 10.f)
			{
				m_ReleaseDogsCount = 6;
				HoundmasterLowHealth();
			}
		}

		void ReleaseDog()
		{
			HoundCheckPredicate pred(me);
			summons.DoAction(ACTION_ACTIVATE_DOG, pred, 1);
		}

		void HoundmasterLowHealth()
		{
			Talk(SAY_DEATH_1);

			events.ScheduleEvent(EVENT_ATTACK_HOUNDMASTER, 5000);
		}

		void DogsAttackHoundmaster()
		{
			Talk(SAY_DEATH_2);

			HoundCheckPredicate pred(me);
			summons.DoAction(ACTION_ATTACK_HOUNDMASTER, pred);

			events.ScheduleEvent(EVENT_HOUNDMASTER_DEATH, 10000);
		}

		void HoundmasterDeath()
		{
			if (Unit* killer = SelectTarget(SELECT_TARGET_RANDOM, 0, 0.0f, true))
			{
				killer->Kill(me);
			}
		}

		void DoCloseDoor()
		{
			for (uint8 i = DOGS_FIRST_COUNT; i < DOGS_COUNT; ++i)
			{
				me->SummonCreature(NPC_OBEDIENT_HOUND, obedientHoundPos[i]);
			}
		}

		void DoBloodyRage()
		{
			Talk(SAY_RAGE);

			DoCast(me, SPELL_BLOODY_RAGE, true);
		}

		void DoPiercingThrow()
		{
			DoCastAOE(SPELL_PIERCING_THROW_AOE);
		}

		void DoDeathBlossom()
		{
			//DoCastAOE(SPELL_DEATH_BLOSSOM_JUMP);
		}

	private:

		uint8 m_ReleaseDogsCount;
		bool m_IsHoundKilled;
	};
};

class npc_houndmaster_braun_obedient_hound : public CreatureScript
{
public:
	npc_houndmaster_braun_obedient_hound() : CreatureScript("npc_houndmaster_braun_obedient_hound") { }

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_houndmaster_braun_obedient_houndAI(creature);
	}

	struct npc_houndmaster_braun_obedient_houndAI : public ScriptedAI
	{
		npc_houndmaster_braun_obedient_houndAI(Creature* creature) : ScriptedAI(creature)
		{
			me->SetReactState(REACT_PASSIVE);
			me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_IMMUNE_TO_PC);
		}

		void Reset() override
		{
			events.Reset();

			m_IsHoundActivated = false;
		}

		void EnterCombat(Unit* /*who*/) override
		{

		}

		uint32 GetData(uint32 type) override
		{
			if (type == DATA_HOUND_ACTIVATED)
			{
				return m_IsHoundActivated ? 1 : 0;
			}

			return 0;
		}

		void DoAction(int32 const action) override
		{
			switch (action)
			{
			case ACTION_ACTIVATE_DOG:
				HandleActivateDog();
				break;
			case ACTION_ATTACK_HOUNDMASTER:
				HandleAttackHoundmaster();
				break;
			}
		}

		void UpdateAI(const uint32 diff) override
		{
			if (!UpdateVictim())
				return;

			DoMeleeAttackIfReady();
		}

	private:

		void HandleActivateDog()
		{
			me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_IMMUNE_TO_PC);
			me->SetReactState(REACT_AGGRESSIVE);
			DoZoneInCombat(me);

			m_IsHoundActivated = true;
		}

		void HandleAttackHoundmaster()
		{
			if (Creature* pHoundmaster = GetHoundmaster())
			{
				//me->Attack(pHoundmaster, true);
				DoCast(pHoundmaster, SPELL_DOG_LEAP_BOSS);
			}

			m_IsHoundActivated = true;
		}

		Creature* GetHoundmaster()
		{
			if (InstanceScript* pInstance = me->GetInstanceScript())
			{
				return pInstance->instance->GetCreature(pInstance->GetData64(DATA_HOUNDMASTER_BRAUN));
			}

			return NULL;
		}

	private:

		bool m_IsHoundActivated;

	};
};

class spell_houndmaster_braun_piercing_throw_aoe : public SpellScriptLoader
{
public:
	spell_houndmaster_braun_piercing_throw_aoe() : SpellScriptLoader("spell_houndmaster_braun_piercing_throw_aoe") { }

	class spell_houndmaster_braun_piercing_throw_aoe_SpellScript : public SpellScript
	{
		PrepareSpellScript(spell_houndmaster_braun_piercing_throw_aoe_SpellScript);

		void FilterTargets(std::list<WorldObject*>& targets)
		{
			JadeCore::Containers::RandomResizeList(targets, 1);
		}

		void HandleHitTarget(SpellEffIndex effIndex)
		{
			if (!GetCaster() || !GetHitUnit())
				return;

			GetCaster()->CastSpell(GetHitUnit(), SPELL_PIERCING_THROW, false);
		}

		void Register()
		{
			OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_houndmaster_braun_piercing_throw_aoe_SpellScript::FilterTargets, EFFECT_0, TARGET_UNIT_SRC_AREA_ENEMY);
			OnEffectHitTarget += SpellEffectFn(spell_houndmaster_braun_piercing_throw_aoe_SpellScript::HandleHitTarget, EFFECT_0, SPELL_EFFECT_DUMMY);
		}
	};

	SpellScript* GetSpellScript() const
	{
		return new spell_houndmaster_braun_piercing_throw_aoe_SpellScript();
	}
};

class spell_houndmaster_braun_piercing_throw : public SpellScriptLoader
{
public:
	spell_houndmaster_braun_piercing_throw() : SpellScriptLoader("spell_houndmaster_braun_piercing_throw") { }

	class spell_houndmaster_braun_piercing_throw_AuraScript : public AuraScript
	{
		PrepareAuraScript(spell_houndmaster_braun_piercing_throw_AuraScript);

		void HandleEffectPeriodic1(AuraEffect const* aurEff)
		{
			PreventDefaultAction();

			if (!GetCaster() || !GetUnitOwner())
				return;

			GetCaster()->CastSpell(GetUnitOwner(), SPELL_PIERCING_THROW_DUMMY, true);
		}

		void HandleEffectPeriodic2(AuraEffect const* aurEff)
		{
			PreventDefaultAction();

			if (!GetCaster() || !GetUnitOwner())
				return;

			GetCaster()->CastSpell(GetUnitOwner(), SPELL_PIERCING_THROW_DMG, true);
		}

		void Register()
		{
			OnEffectPeriodic += AuraEffectPeriodicFn(spell_houndmaster_braun_piercing_throw_AuraScript::HandleEffectPeriodic1, EFFECT_1, SPELL_AURA_PERIODIC_TRIGGER_SPELL);
			OnEffectPeriodic += AuraEffectPeriodicFn(spell_houndmaster_braun_piercing_throw_AuraScript::HandleEffectPeriodic2, EFFECT_2, SPELL_AURA_PERIODIC_TRIGGER_SPELL);
		}
	};

	AuraScript* GetAuraScript() const
	{
		return new spell_houndmaster_braun_piercing_throw_AuraScript();
	}
};

class spell_houndmaster_braun_piercing_throw_dmg : public SpellScriptLoader
{
public:
	spell_houndmaster_braun_piercing_throw_dmg() : SpellScriptLoader("spell_houndmaster_braun_piercing_throw_dmg") { }

	class spell_houndmaster_braun_piercing_throw_dmg_SpellScript : public SpellScript
	{
		PrepareSpellScript(spell_houndmaster_braun_piercing_throw_dmg_SpellScript);

		void FilterTargets(std::list<WorldObject*>& targets)
		{
			if (!GetCaster())
				return;

			targets.remove_if([&](WorldObject* obj) -> bool
			{
				return !obj->IsPlayer() || !GetCaster()->HasInLine(obj, 1.f);
			});
		}

		void Register()
		{
			OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_houndmaster_braun_piercing_throw_dmg_SpellScript::FilterTargets, EFFECT_0, TARGET_UNIT_CONE_ENEMY_24);
			OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_houndmaster_braun_piercing_throw_dmg_SpellScript::FilterTargets, EFFECT_1, TARGET_UNIT_CONE_ENEMY_24);
		}
	};

	SpellScript* GetSpellScript() const
	{
		return new spell_houndmaster_braun_piercing_throw_dmg_SpellScript();
	}
};

class spell_houndmaster_braun_death_blossom_jump : public SpellScriptLoader
{
public:
	spell_houndmaster_braun_death_blossom_jump() : SpellScriptLoader("spell_houndmaster_braun_death_blossom_jump") { }

	class spell_houndmaster_braun_death_blossom_jump_SpellScript : public SpellScript
	{
		PrepareSpellScript(spell_houndmaster_braun_death_blossom_jump_SpellScript);

		void FilterTargets(std::list<WorldObject*>& targets)
		{
			JadeCore::Containers::RandomResizeList(targets, 1);
		}

		void Register()
		{
			OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_houndmaster_braun_death_blossom_jump_SpellScript::FilterTargets, EFFECT_0, TARGET_UNIT_SRC_AREA_ENEMY);
		}
	};

	SpellScript* GetSpellScript() const
	{
		return new spell_houndmaster_braun_death_blossom_jump_SpellScript();
	}
};

class achievement_humane_society : public AchievementCriteriaScript
{
public:
	achievement_humane_society() : AchievementCriteriaScript("achievement_humane_society") { }

	bool OnCheck(Player* source, Unit* target) override
	{
		if (Creature* pHoundmaster = target->ToCreature())
		{
			if (pHoundmaster->AI()->GetData(DATA_HOUND_KILLED) == 0)
				return true;
		}

		return false;
	}
};

void AddSC_boss_houndmaster_braun()
{
	new boss_houndmaster_braun();                       // 59303
	new npc_houndmaster_braun_obedient_hound();         // 59309

	new spell_houndmaster_braun_piercing_throw_aoe();   // 114021
	new spell_houndmaster_braun_piercing_throw();       // 114004
	new spell_houndmaster_braun_piercing_throw_dmg();   // 114020
	new spell_houndmaster_braun_death_blossom_jump();   // 114241

	new achievement_humane_society();                   // 20983
}