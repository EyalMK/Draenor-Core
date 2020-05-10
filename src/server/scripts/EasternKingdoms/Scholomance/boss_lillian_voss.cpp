#include "ScriptPCH.h"
#include "scholomance.h"

enum ScriptTextsLilian
{
	SAY_LILIAN_INTRO_1 = 1,
	SAY_LILIAN_AGGRO = 2,
	SAY_LILIAN_SOUL_RIP = 0,
};

enum ScriptTextsGandling
{
	SAY_GANDLING_INTRO_1 = 7,
	SAY_GANDLING_INTRO_2 = 8,
	SAY_GANDLING_75 = 13,
	SAY_GANDLING_50 = 12,
	SAY_GANDLING_SOUL = 9,
	SAY_GANDLING_REANIMATE = 15,
};

enum Spells
{
	SPELL_SHADOW_SHIV_AOE = 111776,
	SPELL_SHADOW_SHIV_VEHICLE = 111773,
	SPELL_SHADOW_SHIV_DMG = 111775,

	SPELL_DEATHS_GRASP = 111570,
	SPELL_DEATHS_GRASP_JUMP = 111573,

	SPELL_DARK_BLAZE = 111585,
	SPELL_DARK_BLAZE_SUMMON = 111609,
	SPELL_DARK_BLAZE_AURA = 111587,
	SPELL_DARK_BLAZE_DMG = 111628,

	SPELL_LILIAN_INTRO_BEAM_LEFT = 114194,
	SPELL_LILIAN_INTRO_BEAM_RIGHT = 114199,
	SPELL_LILIAN_INTRO_BEAM_CENTER = 114200,
	SPELL_COSMETIC_SOUL_RIP_1 = 112057,
	SPELL_COSMETIC_SOUL_RIP_2 = 112058,

	SPELL_SUMMON_LILIANS_SOUL = 112063,

	SPELL_LILIAN_RECOMBINE_COSMETIC = 111687,

	SPELL_UNLEASH_ANGUISH = 111649,
	SPELL_FIXATE_ANGER = 115350,
	SPELL_BLAZING_SOUL = 111642,

	// Darkmaster Gandling
	SPELL_IMPROVED_BONE_SHIELD = 113865,
	SPELL_INTRO_CHANNEL = 114201,
	SPELL_REANIMATE_CORPSE = 114262,
};

enum Events
{
	EVENT_DEATHS_GRASP = 1,
	EVENT_SHADOW_SHIV,
	EVENT_DARK_BLAZE,
	EVENT_SOUL_RIP,
	EVENT_FALL,
	EVENT_MOVE,
	EVENT_BLAZING_SOUL,
	EVENT_FIXATE_ANGER,

	EVENT_RESURECT,
	EVENT_START_PHASE3,

	EVENT_GANDLING_INTRO_1,
	EVENT_GANDLING_INTRO_2,
	EVENT_GANDLING_INTRO_3,
	EVENT_GANDLING_INTRO_4,
};

enum Actions
{
	ACTION_START_EVENT = 1,
	ACTION_REANIMATE,
};

enum Points
{
	POINT_SOUL_RIP = 1,
	POINT_JUMP,
};

enum Adds
{
	NPC_DARK_BLAZE = 58780,
};

const Position centerPos[2] =
{
	{200.845f, 83.903f, 107.762f, 0.0f },
	{200.845f, 83.903f, 112.762f, 0.0f }
};

const Position gadlingPos = { 217.45f, 69.82f, 108.24f, 2.47f };

class boss_lilian_voss : public CreatureScript
{
public:
	boss_lilian_voss() : CreatureScript("boss_lilian_voss") { }

	CreatureAI* GetAI(Creature* creature) const
	{
		return new boss_lilian_vossAI(creature);
	}

	struct boss_lilian_vossAI : public BossAI
	{
		boss_lilian_vossAI(Creature* creature) : BossAI(creature, DATA_LILLIAN_VOSS)
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

			phase = 0;
		}

		void Reset()
		{
			_Reset();
			me->RemoveAllDynObjects();

			if (instance->GetData(DATA_LILIAN_ENTRANCE) == DONE)
			{
				me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_IMMUNE_TO_PC);
				me->SetReactState(REACT_DEFENSIVE);
			}
			else
			{
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_IMMUNE_TO_PC);
				me->SetReactState(REACT_PASSIVE);
			}

			phase = 0;

			soulphase = false;
			me->RemoveFlag(UNIT_FIELD_FLAGS_2, UNIT_FLAG2_FEIGN_DEATH);

			me->SetDisableGravity(false);
			me->SetSpeed(MOVE_RUN, 1.14286f);
			me->SetSpeed(MOVE_FLIGHT, 1.14286f);
			//me->SetHover(false);

			SetEquipmentSlots(false, 50732, 50732, 0);
		}

		void EnterCombat(Unit* /*who*/)
		{
			Talk(SAY_LILIAN_AGGRO);

			// Create dynobject
			//me->CastSpell(me->GetPositionX(), me->GetPositionY(), me->GetPositionZ(), SPELL_SHADOW_SHIV_AOE, true);

			phase = 0;

			events.ScheduleEvent(EVENT_DEATHS_GRASP, 30000);
			events.ScheduleEvent(EVENT_SHADOW_SHIV, 12000);

			DoZoneInCombat();
			instance->SetBossState(DATA_LILLIAN_VOSS, IN_PROGRESS);
		}

		void DamageTaken(Unit* /*attacker*/, uint32& damage)
		{
			if (me->GetHealthPct() <= 75.0f && phase == 0)
			{
				phase = 1;
				if (Creature* pGadling = sObjectAccessor->GetCreature(*me, instance->GetData64(DATA_GANDLING_EVENT)))
					pGadling->AI()->Talk(SAY_GANDLING_75);
			}
			else if (me->GetHealthPct() <= 50.0f && phase == 1)
			{
				phase = 2;

				me->RemoveAllAuras();
				events.CancelEvent(EVENT_SHADOW_SHIV);
				events.CancelEvent(EVENT_DEATHS_GRASP);
				me->AttackStop();
				me->SetReactState(REACT_PASSIVE);
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_IMMUNE_TO_PC);

				if (Creature* pGadling = sObjectAccessor->GetCreature(*me, instance->GetData64(DATA_GANDLING_EVENT)))
				{
					pGadling->AI()->Talk(SAY_GANDLING_50);
					//pGadling->CastSpell(me, SPELL_LILIAN_INTRO_BEAM_LEFT, true);
					//pGadling->CastSpell(me, SPELL_LILIAN_INTRO_BEAM_RIGHT, true);
					pGadling->CastSpell(me, SPELL_LILIAN_INTRO_BEAM_CENTER, true);
				}

				me->AddAura(SPELL_COSMETIC_SOUL_RIP_2, me);

				me->SetDisableGravity(true);
				me->SetSpeed(MOVE_RUN, 0.3f);
				me->SetSpeed(MOVE_FLIGHT, 0.3f);

				me->GetMotionMaster()->MovePoint(POINT_SOUL_RIP, centerPos[1]);
			}
			else if (damage >= me->GetHealth() && phase == 2)
			{
				damage = 0;

				me->RemoveAllAuras();
				me->RemoveAllAttackers();
				me->AttackStop();
				me->SetReactState(REACT_PASSIVE);
				me->InterruptNonMeleeSpells(true);

				EndEncounter();
			}
		}

		void MovementInform(uint32 type, uint32 id)
		{
			if (type == POINT_MOTION_TYPE)
			{
				if (id == POINT_SOUL_RIP)
				{
					Talk(SAY_LILIAN_SOUL_RIP);
					events.ScheduleEvent(EVENT_SOUL_RIP, 7000);
				}
			}

			if (id == POINT_JUMP)
			{
				DoCastAOE(SPELL_SHADOW_SHIV_DMG, true);
			}
		}

		void DoAction(int32 const action)
		{
			if (action == ACTION_REANIMATE)
			{
				me->RemoveFlag(UNIT_FIELD_FLAGS_2, UNIT_FLAG2_FEIGN_DEATH);
				me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_IMMUNE_TO_PC);
				me->SetReactState(REACT_AGGRESSIVE);

				events.ScheduleEvent(EVENT_DEATHS_GRASP, 30000);
				events.ScheduleEvent(EVENT_SHADOW_SHIV, 12000);
			}
		}

		void UpdateAI(uint32 const diff)
		{
			if (!UpdateVictim())
				return;

			events.Update(diff);

			if (me->HasUnitState(UNIT_STATE_CASTING))
				return;

			if (uint32 eventId = events.ExecuteEvent())
			{
				switch (eventId)
				{
				case EVENT_DEATHS_GRASP:
					DoCastVictim(SPELL_DEATHS_GRASP, false);
					events.ScheduleEvent(EVENT_DEATHS_GRASP, 34000);
					events.ScheduleEvent(EVENT_DARK_BLAZE, 4000);
					break;
				case EVENT_SHADOW_SHIV:
					if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 0.0f, true))
					{
						DoCast(target, SPELL_SHADOW_SHIV_VEHICLE);
					}
					events.ScheduleEvent(EVENT_SHADOW_SHIV, 13000);
					break;
				case EVENT_DARK_BLAZE:
					DoCastAOE(SPELL_DARK_BLAZE);
					break;
				case EVENT_SOUL_RIP:
					if (Creature* pGadling = sObjectAccessor->GetCreature(*me, instance->GetData64(DATA_GANDLING_EVENT)))
					{
						pGadling->AI()->Talk(SAY_GANDLING_SOUL);
					}
					DoCast(me, SPELL_SUMMON_LILIANS_SOUL);
					events.ScheduleEvent(EVENT_FALL, 2000);
					break;
				case EVENT_FALL:
					me->RemoveAura(SPELL_LILIAN_INTRO_BEAM_LEFT);
					me->RemoveAura(SPELL_LILIAN_INTRO_BEAM_RIGHT);
					me->RemoveAura(SPELL_LILIAN_INTRO_BEAM_CENTER);
					me->SetFlag(UNIT_FIELD_FLAGS_2, UNIT_FLAG2_FEIGN_DEATH);
					me->GetMotionMaster()->MoveFall();
					me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_IMMUNE_TO_PC);
					break;
				default:
					break;
				}
			}
			DoMeleeAttackIfReady();
		}
	private:

		uint8 phase;

		bool soulphase;

		void EndEncounter()
		{
			events.Reset();
			summons.DespawnAll();
			me->RemoveAllDynObjects();

			if (Creature* pGadling = sObjectAccessor->GetCreature(*me, instance->GetData64(DATA_GANDLING_EVENT)))
				pGadling->DespawnOrUnsummon();

			me->setFaction(35);

			if (IsHeroic())
			{
				instance->DoRespawnGameObject(instance->GetData64(DATA_COFFER_OF_FORGOTTEN_SOULS_HEROIC));
			}
			else
			{
				instance->DoRespawnGameObject(instance->GetData64(DATA_COFFER_OF_FORGOTTEN_SOULS));
			}
		}
	};
};

class npc_lilian_voss_lilians_soul : public CreatureScript
{
public:
	npc_lilian_voss_lilians_soul() : CreatureScript("npc_lilian_voss_lilians_soul") { }

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_lilian_voss_lilians_soulAI(creature);
	}

	struct npc_lilian_voss_lilians_soulAI : public BossAI
	{
		npc_lilian_voss_lilians_soulAI(Creature* creature) : BossAI(creature, DATA_LILLIAN_VOSS_SOUL)
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

			pInstance = creature->GetInstanceScript();

			isPhase = false;
		}

		void Reset()
		{
			me->SetReactState(REACT_PASSIVE);
			me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_NOT_SELECTABLE);
			me->SetDisableGravity(true);

			me->AddAura(SPELL_UNLEASH_ANGUISH, me);

			me->SetSpeed(MOVE_RUN, 0.5f);

			isPhase = false;
		}

		void IsSummonedBy(Unit* owner)
		{
			me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_NOT_SELECTABLE);
			events.ScheduleEvent(EVENT_MOVE, 2000);
		}

		void DamageTaken(Unit* /*who*/, uint32& damage)
		{
			if (damage >= me->GetHealth())
			{
				damage = 0;

				if (!isPhase)
				{
					isPhase = true;
					me->RemoveAllAuras();
					me->InterruptNonMeleeSpells(true);
					me->RemoveAllAttackers();
					me->AttackStop();
					me->SetReactState(REACT_PASSIVE);
					events.CancelEvent(EVENT_BLAZING_SOUL);
					events.CancelEvent(EVENT_FIXATE_ANGER);
					me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_NOT_SELECTABLE);

					events.ScheduleEvent(EVENT_MOVE, 5000);

					if (Creature* pGandling = sObjectAccessor->GetCreature(*me, instance->GetData64(DATA_GANDLING_EVENT)))
					{
						pGandling->AI()->Talk(SAY_GANDLING_REANIMATE);
						pGandling->CastSpell(pGandling, SPELL_REANIMATE_CORPSE);
					}
				}
			}
		}

		void UpdateAI(uint32 const diff)
		{
			if (!UpdateVictim())
				return;

			events.Update(diff);

			if (me->HasUnitState(UNIT_STATE_CASTING))
				return;

			if (uint32 eventId = events.ExecuteEvent())
			{
				switch (eventId)
				{
				case EVENT_MOVE:
					me->SetReactState(REACT_AGGRESSIVE);
					if (!isPhase)
						me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_NOT_SELECTABLE);
					me->SetDisableGravity(false);

					events.ScheduleEvent(EVENT_BLAZING_SOUL, urand(2000, 3000));
					events.ScheduleEvent(EVENT_FIXATE_ANGER, urand(3000, 4000));
					break;
				case EVENT_BLAZING_SOUL:
					DoCastAOE(SPELL_BLAZING_SOUL);
					events.ScheduleEvent(EVENT_BLAZING_SOUL, urand(6000, 7000));
					break;
				case EVENT_FIXATE_ANGER:
					if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 0.0f, true))
						DoCast(target, SPELL_FIXATE_ANGER);

					events.ScheduleEvent(EVENT_FIXATE_ANGER, 10000);
					break;
				default:
					break;
				}
			}
			DoMeleeAttackIfReady();
		}

	private:

		InstanceScript* pInstance;
		EventMap events;
		bool isPhase;
	};
};


class npc_lilian_voss_lilian_darkmaster_gandling : public CreatureScript
{
public:
	npc_lilian_voss_lilian_darkmaster_gandling() : CreatureScript("npc_lilian_voss_lilian_darkmaster_gandling") { }

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_lilian_voss_lilian_darkmaster_gandlingAI(creature);
	}

	struct npc_lilian_voss_lilian_darkmaster_gandlingAI : public Scripted_NoMovementAI
	{
		npc_lilian_voss_lilian_darkmaster_gandlingAI(Creature* creature) : Scripted_NoMovementAI(creature)
		{
			pInstance = creature->GetInstanceScript();
			me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_IMMUNE_TO_PC);
			me->SetReactState(REACT_PASSIVE);
			me->setActive(true);
			intro = false;
		}

		void Reset()
		{
			me->AddAura(SPELL_IMPROVED_BONE_SHIELD, me);
			me->AddAura(SPELL_INTRO_CHANNEL, me);
		}

		void DoAction(const int32 action)
		{
			if (action == ACTION_START_EVENT)
			{
				if (!intro)
				{
					intro = true;
					events.ScheduleEvent(EVENT_GANDLING_INTRO_1, 1000);
				}
			}
		}

		void UpdateAI(uint32 const diff)
		{
			if (!pInstance)
				return;

			events.Update(diff);

			if (me->HasUnitState(UNIT_STATE_CASTING))
				return;

			if (uint32 eventId = events.ExecuteEvent())
			{
				switch (eventId)
				{
				case EVENT_GANDLING_INTRO_1:
					Talk(SAY_GANDLING_INTRO_1);
					if (Creature* pLilian = sObjectAccessor->GetCreature(*me, pInstance->GetData64(DATA_LILLIAN_VOSS)))
					{
						pLilian->CastSpell(pLilian, SPELL_COSMETIC_SOUL_RIP_1, true);
					}
					events.ScheduleEvent(EVENT_GANDLING_INTRO_2, 10000);
					break;
				case EVENT_GANDLING_INTRO_2:
					if (Creature* pLilian = sObjectAccessor->GetCreature(*me, pInstance->GetData64(DATA_LILLIAN_VOSS)))
						pLilian->AI()->Talk(SAY_LILIAN_INTRO_1);
					events.ScheduleEvent(EVENT_GANDLING_INTRO_3, 5000);
					break;
				case EVENT_GANDLING_INTRO_3:
					Talk(SAY_GANDLING_INTRO_2);
					events.ScheduleEvent(EVENT_GANDLING_INTRO_4, 5000);
					break;
				case EVENT_GANDLING_INTRO_4:
					if (Creature* pLilian = sObjectAccessor->GetCreature(*me, pInstance->GetData64(DATA_LILLIAN_VOSS)))
					{
						pLilian->RemoveAura(SPELL_COSMETIC_SOUL_RIP_1);
						pLilian->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_IMMUNE_TO_PC);
						pLilian->SetReactState(REACT_DEFENSIVE);
					}
					break;
				default:
					break;
				}
			}
		}

	private:

		EventMap events;
		InstanceScript* pInstance;
		bool intro;
	};
};

class npc_lilian_voss_dark_blaze : public CreatureScript
{
public:
	npc_lilian_voss_dark_blaze() : CreatureScript("npc_lilian_voss_dark_blaze") { }

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_lilian_voss_dark_blazeAI(creature);
	}

	struct npc_lilian_voss_dark_blazeAI : public Scripted_NoMovementAI
	{
		npc_lilian_voss_dark_blazeAI(Creature* creature) : Scripted_NoMovementAI(creature)
		{
			me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_IMMUNE_TO_PC);
			me->SetReactState(REACT_PASSIVE);
		}

		void Reset()
		{
			me->AddAura(SPELL_DARK_BLAZE_AURA, me);
		}

		void EnterCombat(Unit* who)
		{
			DoZoneInCombat();
		}
	};
};

class spell_lilian_voss_deaths_grasp : public SpellScriptLoader
{
public:
	spell_lilian_voss_deaths_grasp() : SpellScriptLoader("spell_lilian_voss_deaths_grasp") { }

	class spell_lilian_voss_deaths_grasp_SpellScript : public SpellScript
	{
		PrepareSpellScript(spell_lilian_voss_deaths_grasp_SpellScript);

		void HandleScript(SpellEffIndex effIndex)
		{
			GetHitUnit()->CastSpell(GetCaster(), SPELL_DEATHS_GRASP_JUMP, true);
		}

		void Register()
		{
			OnEffectHitTarget += SpellEffectFn(spell_lilian_voss_deaths_grasp_SpellScript::HandleScript, EFFECT_0, SPELL_EFFECT_SCRIPT_EFFECT);
		}
	};

	SpellScript* GetSpellScript() const
	{
		return new spell_lilian_voss_deaths_grasp_SpellScript();
	}
};

class spell_lilian_voss_shadow_shiv_vehicle : public SpellScriptLoader
{
public:
	spell_lilian_voss_shadow_shiv_vehicle() : SpellScriptLoader("spell_lilian_voss_shadow_shiv_vehicle") { }

	class spell_lilian_voss_shadow_shiv_vehicle_SpellScript : public SpellScript
	{
		PrepareSpellScript(spell_lilian_voss_shadow_shiv_vehicle_SpellScript);

		void HandleScript(SpellEffIndex effIndex)
		{
			if (!GetCaster() || !GetHitUnit())
				return;

			PreventHitDefaultEffect(effIndex);

			GetCaster()->GetMotionMaster()->MoveJump(GetHitUnit()->GetPositionX(), GetHitUnit()->GetPositionY(), GetHitUnit()->GetPositionZ(), 40.0f, 20.0f, 10.0f, POINT_JUMP);
		}

		void Register()
		{
			OnEffectHitTarget += SpellEffectFn(spell_lilian_voss_shadow_shiv_vehicle_SpellScript::HandleScript, EFFECT_0, SPELL_EFFECT_APPLY_AURA);
		}
	};

	SpellScript* GetSpellScript() const
	{
		return new spell_lilian_voss_shadow_shiv_vehicle_SpellScript();
	}
};

class spell_lilian_voss_reanimate_corpse : public SpellScriptLoader
{
public:
	spell_lilian_voss_reanimate_corpse() : SpellScriptLoader("spell_lilian_voss_reanimate_corpse") { }

	class spell_lilian_voss_reanimate_corpse_SpellScript : public SpellScript
	{
		PrepareSpellScript(spell_lilian_voss_reanimate_corpse_SpellScript);

		void HandleScript()
		{
			if (!GetHitUnit())
				return;

			if (Creature* pLilian = GetHitUnit()->ToCreature())
				pLilian->AI()->DoAction(ACTION_REANIMATE);
		}

		void Register()
		{
			OnHit += SpellHitFn(spell_lilian_voss_reanimate_corpse_SpellScript::HandleScript);
		}
	};

	SpellScript* GetSpellScript() const
	{
		return new spell_lilian_voss_reanimate_corpse_SpellScript();
	}
};

class at_lilian_voss : public AreaTriggerScript
{
public:
	at_lilian_voss() : AreaTriggerScript("at_lilian_voss") { }

	bool OnTrigger(Player* player, AreaTriggerEntry const* /*areaTrigger*/, bool p_Enter)
	{
		if (InstanceScript* pInstance = player->GetInstanceScript())
		{
			if (pInstance->GetData(DATA_LILIAN_ENTRANCE) == NOT_STARTED)
			{
				pInstance->SetData(DATA_LILIAN_ENTRANCE, DONE);

				if (Creature* pGandling = sObjectAccessor->GetCreature(*player, pInstance->GetData64(DATA_GANDLING_EVENT)))
					pGandling->AI()->DoAction(ACTION_START_EVENT);
			}
		}

		return true;
	}
};

void AddSC_boss_lillian_voss()
{
	new boss_lilian_voss();
	new npc_lilian_voss_lilians_soul();
	new npc_lilian_voss_lilian_darkmaster_gandling();
	new npc_lilian_voss_dark_blaze();
	new spell_lilian_voss_deaths_grasp();
	new spell_lilian_voss_shadow_shiv_vehicle();
	new spell_lilian_voss_reanimate_corpse();
	new at_lilian_voss();
}