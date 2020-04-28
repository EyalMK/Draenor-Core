#include "ScriptPCH.h"
#include "scholomance.h"

// 113865 - gandling
// 113647 // bone weav
// 114231 - lillian cosmetic eyes
// 114057 soul flame visual

enum ScriptTexts
{
	SAY_AGGRO = 0,
};

enum Spells
{
	SPELL_BONE_WHIRLWIND = 114079,

	SPELL_RUSTING = 113763,
	SPELL_RUSTING_AURA = 113765,
	SPELL_BONE_SPIKE = 113999,

	SPELL_SOULFLAME = 114007,
	SPELL_SOULFLAME_DMG = 114009,
	SPELL_SOULFLAME_VISUAL = 114057,

	SPELL_BONE_ARMOR = 113996,
};

enum Events
{
	EVENT_SOULFLAME = 1,
	EVENT_BONE_SPIKE,
	EVENT_INTRO,
	EVENT_INTRO_1,
};

enum Actions
{
	ACTION_INTRO_RATTLEGORE = 1
};

enum Adds
{
	NPC_SOULFLAME = 59316,
	NPC_BONE_PILE = 59304,
};

const Position bonepilePos[6] =
{
	{276.793091f, 99.967239f, 113.726151f, 1.665531f},

	{276.503754f, 117.604439f, 114.303345f, 1.586118f},

	{246.722977f, 117.852592f, 113.728531f, 3.504235f},

	{246.668045f, 101.072517f, 114.031090f, 4.719858f},

	{246.814392f, 81.480064f, 113.744370f, 4.719858f},

	{276.381165f, 80.856049f, 113.728592f, 0.480017f}
};

class boss_rattlegore : public CreatureScript
{
public:
	boss_rattlegore() : CreatureScript("boss_rattlegore") { }

	CreatureAI* GetAI(Creature* creature) const
	{
		return new boss_rattlegoreAI(creature);
	}

	struct boss_rattlegoreAI : public BossAI
	{
		boss_rattlegoreAI(Creature* creature) : BossAI(creature, DATA_RATTLEGORE)
		{
			me->ApplySpellImmune(0, IMMUNITY_EFFECT, SPELL_EFFECT_KNOCK_BACK, true);
			me->ApplySpellImmune(0, IMMUNITY_EFFECT, SPELL_EFFECT_KNOCK_BACK_DEST, true);
			me->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_GRIP, true);
			me->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_STUN, true);
			me->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_FEAR, true);
			me->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_ROOT, true);
			me->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_FREEZE, true);
			me->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_POLYMORPH, true);
			me->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_HORROR, true);
			me->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_SAPPED, true);
			me->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_CHARM, true);
			me->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_DISORIENTED, true);
			me->ApplySpellImmune(0, IMMUNITY_STATE, SPELL_AURA_MOD_CONFUSE, true);

			me->setActive(true);

			summoners = 0;
			isIntro = false;
		}

		void Reset()
		{
			_Reset();

			if (instance->GetData(DATA_RATTLEGORE_EVENT) == DONE)
			{
				me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_IMMUNE_TO_PC);
				me->SetDisplayId(me->GetNativeDisplayId());
				me->SetReactState(REACT_AGGRESSIVE);
			}
			else
			{
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_IMMUNE_TO_PC);
				me->SetReactState(REACT_PASSIVE);
				me->SetDisplayId(11686);
			}

			instance->DoRemoveAurasDueToSpellOnPlayers(SPELL_BONE_ARMOR);

			achievement = true;
		}

		void EnterCombat(Unit* /*who*/)
		{
			Talk(SAY_AGGRO);

			for (uint8 i = 0; i < 6; ++i)
			{
				me->SummonCreature(NPC_BONE_PILE, bonepilePos[i]);
				me->SummonCreature(NPC_SOULFLAME, bonepilePos[i]);
			}

			me->AddAura(SPELL_RUSTING, me);

			events.ScheduleEvent(EVENT_BONE_SPIKE, 8000);
			events.ScheduleEvent(EVENT_SOULFLAME, urand(1000, 3000));

			DoZoneInCombat();
			instance->SetBossState(DATA_RATTLEGORE, IN_PROGRESS);
		}

		void DoAction(int32 const action)
		{
			switch (action)
			{
			case ACTION_INTRO_RATTLEGORE: // there is a special summon spell, needs to be sniffed from retail

				if (instance->GetData(DATA_RATTLEGORE_EVENT) != IN_PROGRESS)
					break;

				summoners++;
				if (summoners >= 6)
				{
					instance->SetData(DATA_RATTLEGORE_EVENT, DONE);
					DoCast(me, SPELL_BONE_WHIRLWIND);
					events.ScheduleEvent(EVENT_INTRO, 2000);
					isIntro = true;
				}
				break;
			default:
				break;
			}
		}

		void JustDied(Unit* /*killer*/)
		{
			_JustDied();

			instance->DoRemoveAurasDueToSpellOnPlayers(SPELL_BONE_ARMOR);

			TrySpawnDoctorKrastinov();
		}

		bool AllowAchievement()
		{
			return achievement;
		}

		void UpdateAI(uint32 const diff)
		{
			if (!isIntro && !UpdateVictim())
				return;

			if (me->GetPositionY() < 61.0f || me->GetPositionY() > 134.0f)
			{
				EnterEvadeMode();
				return;
			}

			events.Update(diff);

			if (me->HasUnitState(UNIT_STATE_CASTING))
				return;

			if (achievement)
			{
				if (Aura const* aur = me->GetAura(SPELL_RUSTING_AURA))
					if (aur->GetStackAmount() > 5)
						achievement = false;
			}

			if (uint32 eventId = events.ExecuteEvent())
			{
				switch (eventId)
				{
				case EVENT_INTRO:
					me->SetDisplayId(me->GetNativeDisplayId());
					events.ScheduleEvent(EVENT_INTRO_1, 4000);
					break;
				case EVENT_INTRO_1:
					isIntro = false;
					me->RemoveAura(SPELL_BONE_WHIRLWIND);
					me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_IMMUNE_TO_PC);
					me->SetReactState(REACT_AGGRESSIVE);
					break;
				case EVENT_BONE_SPIKE:
				{
					Unit* target = NULL;
					target = SelectTarget(SELECT_TARGET_RANDOM, 1, 0.0f, true);
					if (!target)
						target = SelectTarget(SELECT_TARGET_RANDOM, 0, 0.0f, true);
					if (target)
						DoCast(target, SPELL_BONE_SPIKE);
					events.ScheduleEvent(EVENT_BONE_SPIKE, 8000);
					break;
				}
				case EVENT_SOULFLAME:
				{
					std::list<Creature*> creatures;
					std::list<Creature*> newcreatures;
					me->GetCreatureListWithEntryInGrid(creatures, NPC_SOULFLAME, 200.0f); // TODO: adjuste searche range
					for (std::list<Creature*>::const_iterator itr = creatures.begin(); itr != creatures.end(); ++itr)
					{
						if ((*itr)->HasAura(SPELL_SOULFLAME))
						{
							(*itr)->RemoveAura(SPELL_SOULFLAME);
						}
						else
						{
							if (newcreatures.size() < 2)
								newcreatures.push_back((*itr));
						}
					}

					for (std::list<Creature*>::const_iterator itr = newcreatures.begin(); itr != newcreatures.end(); ++itr)
					{
						(*itr)->AddAura(SPELL_SOULFLAME, (*itr));
					}

					events.ScheduleEvent(EVENT_SOULFLAME, urand(7000, 10000));
					break;
				}
				default:
					break;
				}
			}
			DoMeleeAttackIfReady();
		}

	private:

		void TrySpawnDoctorKrastinov()
		{
			if (IsHeroic())
			{
				if (roll_chance_i(DOCTOR_THEOLEN_KRASTINOV_CHANCE))
				{
					if (Creature* pKrastinov = me->GetMap()->SummonCreature(NPC_DOCTOR_THEOLEN_KRASTINOV, krastinovPos))
					{
						// we don't make owner in 'summoncreature'
						// so 'issummonedby' is not called
						// do it manually
						pKrastinov->AI()->IsSummonedBy(me);
					}
				}
			}
		}

	private:

		bool isIntro;
		uint8 summoners;
		bool achievement;
	};
};

class npc_rattlegore_soulflame : public CreatureScript
{
public:
	npc_rattlegore_soulflame() : CreatureScript("npc_rattlegore_soulflame") { }

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_rattlegore_soulflameAI(creature);
	}

	struct npc_rattlegore_soulflameAI : public Scripted_NoMovementAI
	{
		npc_rattlegore_soulflameAI(Creature* creature) : Scripted_NoMovementAI(creature)
		{
			me->SetReactState(REACT_PASSIVE);
			me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_IMMUNE_TO_PC);
		}

		void Reset()
		{
			me->AddAura(SPELL_SOULFLAME_VISUAL, me);
		}
	};
};

class npc_rattlegore_bone_pile : public CreatureScript
{
public:
	npc_rattlegore_bone_pile() : CreatureScript("npc_rattlegore_bone_pile") { }

	bool OnGossipHello(Player* player, Creature* creature)
	{
		player->CastSpell(player, SPELL_BONE_ARMOR, true);

		return true;
	}
};

class spell_rattlegore_soul_flame_dmg : public SpellScriptLoader
{
public:
	spell_rattlegore_soul_flame_dmg() : SpellScriptLoader("spell_rattlegore_soul_flame_dmg") { }

	class spell_rattlegore_soul_flame_dmg_SpellScript : public SpellScript
	{
		PrepareSpellScript(spell_rattlegore_soul_flame_dmg_SpellScript);

		void ScaleRange(std::list<WorldObject*>& targets)
		{
			targets.remove_if(ExactDistanceCheck(GetCaster(), GetCaster()->GetFloatValue(OBJECT_FIELD_SCALE)));
		}

		void Register()
		{
			OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_rattlegore_soul_flame_dmg_SpellScript::ScaleRange, EFFECT_0, TARGET_UNIT_SRC_AREA_ENEMY);
		}

	private:

		class ExactDistanceCheck
		{
		public:
			ExactDistanceCheck(Unit* source, float dist) : _source(source), _dist(dist) {}

			bool operator()(WorldObject* unit) const
			{
				return _source->GetExactDist2d(unit) > _dist;
			}

		private:
			Unit* _source;
			float _dist;
		};
	};

	SpellScript* GetSpellScript() const
	{
		return new spell_rattlegore_soul_flame_dmg_SpellScript();
	}
};

class spell_rattlegore_bone_armor : public SpellScriptLoader
{
public:
	spell_rattlegore_bone_armor() : SpellScriptLoader("spell_rattlegore_bone_armor") { }

	class spell_rattlegore_bone_armor_AuraScript : public AuraScript
	{
		PrepareAuraScript(spell_rattlegore_bone_armor_AuraScript);

		void HandleAbsorb(AuraEffect* aurEff, DamageInfo& dmgInfo, uint32& absorbAmount)
		{
			if (dmgInfo.GetSpellInfo() && dmgInfo.GetSpellInfo()->Id == SPELL_BONE_SPIKE)
			{
				absorbAmount = dmgInfo.GetDamage();
			}
			else
			{
				PreventDefaultAction();
			}
		}

		void Register()
		{
			OnEffectAbsorb += AuraEffectAbsorbFn(spell_rattlegore_bone_armor_AuraScript::HandleAbsorb, EFFECT_0, SPELL_AURA_SCHOOL_ABSORB);
		}
	};

	AuraScript* GetAuraScript() const
	{
		return new spell_rattlegore_bone_armor_AuraScript();
	}
};

class at_rattlegore : public AreaTriggerScript
{
public:
	at_rattlegore() : AreaTriggerScript("at_rattlegore") { }

	bool OnTrigger(Player* player, AreaTriggerEntry const* /*areaTrigger*/, bool p_Enter)
	{
		if (InstanceScript* pInstance = player->GetInstanceScript())
		{
			if (pInstance->GetData(DATA_RATTLEGORE_EVENT) == NOT_STARTED)
			{
				pInstance->SetData(DATA_RATTLEGORE_EVENT, IN_PROGRESS);
			}
		}

		return true;
	}
};

typedef boss_rattlegore::boss_rattlegoreAI RattlegorelAI;

class achievement_rattle_no_more : public AchievementCriteriaScript
{
public:
	achievement_rattle_no_more() : AchievementCriteriaScript("achievement_rattle_no_more") { }

	bool OnCheck(Player* source, Unit* target)
	{
		if (!target)
			return false;

		if (RattlegorelAI* rattlegorelAI = CAST_AI(RattlegorelAI, target->GetAI()))
			return rattlegorelAI->AllowAchievement();

		return false;
	}
};

void AddSC_boss_rattlegore()
{
	new boss_rattlegore();
	new npc_rattlegore_soulflame();         // 59316
	new npc_rattlegore_bone_pile();         // 59304
	new spell_rattlegore_soul_flame_dmg();
	new spell_rattlegore_bone_armor();
	new at_rattlegore();
	new achievement_rattle_no_more();
}