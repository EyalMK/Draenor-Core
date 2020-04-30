////////////////////////////////////////////////////////////////////////////////
//
// Project-Hellscream https://hellscream.org
// Copyright (C) 2018-2020 Project-Hellscream-6.2
// Discord https://discord.gg/CWCF3C9
//
////////////////////////////////////////////////////////////////////////////////

#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "ScriptedGossip.h"
#include "ScriptedEscortAI.h"
#include "ObjectMgr.h"
#include "ScriptMgr.h"
#include "World.h"
#include "PetAI.h"
#include "PassiveAI.h"
#include "CombatAI.h"
#include "GameEventMgr.h"
#include "GridNotifiers.h"
#include "GridNotifiersImpl.h"
#include "Cell.h"
#include "CellImpl.h"
#include "SpellAuras.h"
#include "Vehicle.h"
#include "Player.h"
#include "SpellScript.h"

enum Northshire
{
	NPC_BLACKROCK_BATTLE_WORG = 49871,
	NPC_STORMWIND_INFANTRY = 49869,

	NPC_BROTHER_PAXTON = 951,

	NPC_INJURED_SOLDIER_DUMMY = 50378,

	SPELL_SPYING = 92857,
	SPELL_SNEAKING = 93046,
	SPELL_SPYGLASS = 80676,

	SPELL_RENEW = 93094,
	SPELL_PRAYER_OF_HEALING = 93091,
	SPELL_FORTITUDE = 13864,
	SPELL_PENANCE = 186723,
	SPELL_FLASH_HEAL = 17843,

	SPELL_RENEWEDLIFE = 93097,

	ACTION_HEAL = 1,
	EVENT_HEALED_1 = 1,
	EVENT_HEALED_2 = 2,
};

/// Stormwind Infantry - 49869
class npc_stormwind_infantry : public CreatureScript
{
public:
	npc_stormwind_infantry() : CreatureScript("npc_stormwind_infantry") { }

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_stormwind_infantryAI(creature);
	}

	struct npc_stormwind_infantryAI : public ScriptedAI
	{
		npc_stormwind_infantryAI(Creature* creature) : ScriptedAI(creature) {}

		uint32 uiSayNormalTimer;
		uint32 uiSayCombatTimer;
		uint32 uiCombatTimer;
		uint32 waitTime;
		uint64 wolfTarget;


		bool Continue;
		 
		void Reset() override
		{
			wolfTarget = 0;
			me->SetSheath(SHEATH_STATE_MELEE);
			me->setRegeneratingHealth(true);
		}

		void EnterCombat(Unit * who) override
		{
			if (!me->HasUnitState(UNIT_STATE_ROOT))
				me->AddUnitState(UNIT_STATE_ROOT);
		}

		void DamageTaken(Unit* doneBy, uint32& damage)
		{
			if (doneBy->ToCreature())
				if (me->GetHealth() <= damage || me->GetHealthPct() <= 87.0f)
					damage = 0;
		}

		void DamageDealt(Unit* target, uint32& damage, DamageEffectType /*damageType*/) override
		{
			if (target->ToCreature())
				if (target->GetHealth() <= damage || target->GetHealthPct() <= 91.0f)
					damage = 0;
		}

		void UpdateAI(uint32 diff) override
		{
			DoMeleeAttackIfReady();

			if (wolfTarget != 0)
			{
				if (Creature* wolf = Unit::GetCreature(*me, wolfTarget))
				{
					if (wolf->isAlive())
					{
						if (me->getVictim() != wolf)
						{
							me->getThreatManager().addThreat(wolf, 1000000.0f);
							wolf->getThreatManager().addThreat(me, 1000000.0f);
							me->Attack(wolf, true);
						}
					}
					else
					{
						me->AttackStop();
						wolf->DespawnOrUnsummon();
						wolfTarget = 0;
						
					}
				}
			}
			else
			{
				Position wolfPos;
				me->GetPosition(&wolfPos);
				GetPositionWithDistInFront(me, 2.5f, wolfPos);

				float z = me->GetMap()->GetHeight(me->GetPhaseMask(), wolfPos.GetPositionX(), wolfPos.GetPositionY(), wolfPos.GetPositionZ());
				wolfPos.m_positionZ = z;
				
				if (Creature* wolf = me->SummonCreature(NPC_BLACKROCK_BATTLE_WORG, wolfPos))
				{
					me->getThreatManager().addThreat(wolf, 1000000.0f);
					wolf->getThreatManager().addThreat(me, 1000000.0f);
					AttackStart(wolf);
					wolf->SetFacingToObject(me);
					wolfTarget = wolf->GetGUID();
				}
			}

		}
	};
};


/// Blackrock Worg - 49871
class npc_blackrock_battle_worg : public CreatureScript 
{
public:
	npc_blackrock_battle_worg() : CreatureScript("npc_blackrock_battle_worg") { }

	struct npc_blackrock_battle_worgAI : public ScriptedAI 
	{
		npc_blackrock_battle_worgAI(Creature *c) : ScriptedAI(c) { }

		uint32 m_minHealth;
		uint32 guardTarget;

		void Reset() 
		{
			m_minHealth = 91.0f;
		}
		
		void UpdateAI(uint32 diff)
		{
			DoMeleeAttackIfReady();

			if (guardTarget != 0)
			{
				if (Creature* guard = Unit::GetCreature(*me, guardTarget))
				{
					if (guard->isAlive())
					{
						if (me->getVictim() != guard)
						{
							me->getThreatManager().addThreat(guard, 1000000.0f);
							guard->getThreatManager().addThreat(me, 1000000.0f);
							me->Attack(guard, true);
						}
					}
					else
					{
						me->AttackStop();
						guardTarget = 0;

					}
				}
			}
			else
			{
				if (Creature* guard = me->FindNearestCreature(NPC_BLACKROCK_BATTLE_WORG, 5.0f, true))
				{
					me->getThreatManager().addThreat(guard, 1000000.0f);
					guard->getThreatManager().addThreat(me, 1000000.0f);
					AttackStart(guard);
					guard->SetFacingToObject(me);
					guardTarget = guard->GetGUID();
				}
			}
		}
	

		void DamageDealt(Unit* target, uint32& damage, DamageEffectType damageType)
		{
			if (target->ToCreature())
				if (target->GetHealth() <= damage || target->GetHealthPct() <= 87.0f)
					damage = 0;
		}

		void DamageTaken(Unit* pWho, uint32& uiDamage)
		{
			if (Creature* npc = pWho->ToCreature())
				if (npc->GetEntry() == NPC_STORMWIND_INFANTRY)
					uiDamage = 0;

			if (pWho->GetTypeId() == TYPEID_PLAYER || pWho->isPet())
			{
				if (Creature* guard = me->FindNearestCreature(NPC_STORMWIND_INFANTRY, 5.0f, true))
				{
					guard->getThreatManager().resetAllAggro();
					guard->CombatStop(true);
				}

				me->getThreatManager().resetAllAggro();
				me->GetMotionMaster()->MoveChase(pWho);
				me->AI()->AttackStart(pWho);
			}
		}

	};

	CreatureAI* GetAI(Creature* pCreature) const
	{
		return new npc_blackrock_battle_worgAI(pCreature);
	}
};


/// Injured Stormwind Infantry - 50047
#define SPELL_HEAL          93072

class npc_injured_stormwind_soldier : public CreatureScript
{
public:
	npc_injured_stormwind_soldier() : CreatureScript("npc_injured_stormwind_soldier") { }

	enum eActions
	{
		ActionHeal = 0
	};

	/* enum eQuests
	{
		Quest_Fear_no_Evil_1 = 28806,
		Quest_Fear_no_Evil_2 = 28808,
		Quest_Fear_no_Evil_3 = 28809,
		Quest_Fear_no_Evil_4 = 28810,
		Quest_Fear_no_Evil_5 = 28811,
		Quest_Fear_no_Evil_6 = 28812,
		Quest_Fear_no_Evil_7 = 28813,
		Quest_Fear_no_Evil_8 = 29082
	}; */



	struct npc_injured_stormwind_soldierAI : public ScriptedAI
	{
		npc_injured_stormwind_soldierAI(Creature* creature) : ScriptedAI(creature) 
		{ 
			m_PlayerGuid = 0;
		}

		EventMap m_CosmeticEvents;
		EventMap m_Events;
		uint64 m_PlayerGuid;
		

		void Reset()
		{
			ClearDelayedOperations();
			m_Events.Reset();
			me->SetFlag(UNIT_FIELD_NPC_FLAGS, UNIT_NPC_FLAG_SPELLCLICK);
			me->SetByteFlag(UNIT_FIELD_ANIM_TIER, 0, UNIT_STAND_STATE_DEAD);
			me->SetHealth(me->CountPctFromMaxHealth(30.0f));
			me->setRegeneratingHealth(false);
		}

		void OnSpellClick(Unit* clicker) override
		{

			// Need to rework this - currently any player can trigger the DoAction even if said player doesn't have quest.
			// Tested with OR statements inside an if statement as well as a for loop - both don't work
			// Suspected issue is clicker Unit and the functions it has.
			m_PlayerGuid = clicker->GetGUID();

			me->RemoveFlag(UNIT_FIELD_NPC_FLAGS, UNIT_NPC_FLAG_SPELLCLICK);
			me->CastSpell(me, SPELL_RENEWEDLIFE, true);
			DoAction(eActions::ActionHeal);

		}

		void DoAction(int32 const p_Action) override
		{
			switch (p_Action)
			{
				case eActions::ActionHeal:
				{
					AddTimedDelayedOperation(0.3 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->SetHealth(me->CountPctFromMaxHealth(80.0f));
					});

					AddTimedDelayedOperation(1.5 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->RemoveByteFlag(UNIT_FIELD_ANIM_TIER, 0, UNIT_STAND_STATE_DEAD);			
					});

					AddTimedDelayedOperation(2 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						if (m_PlayerGuid)
						{
							if (Player* l_Player = me->GetPlayer(*me, m_PlayerGuid))
							{
								me->SetFacingToObject(l_Player);
								l_Player->KilledMonsterCredit(50047);
							}
						}
					});

					AddTimedDelayedOperation(2.5 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						Talk(0);
						me->HandleEmoteCommand(EMOTE_ONESHOT_SALUTE);
					});

					AddTimedDelayedOperation(4 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->GetMotionMaster()->MovePoint(0, -8914.525f, -133.963f, 80.534f);
					});

					AddTimedDelayedOperation(10 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->DespawnOrUnsummon();
					});

				break;
				}
			default:
				break;
			}
		}

		void UpdateAI(uint32 const p_Diff)
		{
			UpdateOperations(p_Diff);

			m_Events.Update(p_Diff);

			switch (m_Events.ExecuteEvent())
			{
			}
		}
	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_injured_stormwind_soldierAI(creature);
	}
};



/// Blackrock Invader - 42937
class npc_blackrock_invader : public CreatureScript 
{
public:
	npc_blackrock_invader() : CreatureScript("npc_blackrock_invader") { }

	struct npc_blackrock_invaderAI : public ScriptedAI 
	{
		npc_blackrock_invaderAI(Creature *c) : ScriptedAI(c) { }

		void EnterCombat(Unit * who) 
		{
			Talk(0);
		}

		void UpdateAI(const uint32 diff)
		{
			if (!UpdateVictim())
				return;

			me->GetMotionMaster()->MoveRandom(5.0f);

			DoMeleeAttackIfReady();
		}
	};

	CreatureAI* GetAI(Creature* pCreature) const
	{
		return new npc_blackrock_invaderAI(pCreature);
	}
};


/// Goblin Assassin - 50039
class npc_goblin_assassin : public CreatureScript 
{
public:
	npc_goblin_assassin() : CreatureScript("npc_goblin_assassin") {	}

	struct npc_goblin_assassinAI : public ScriptedAI 
	{
		npc_goblin_assassinAI(Creature *c) : ScriptedAI(c) 
		{
			if (!me->isInCombat() && !me->HasAura(SPELL_SPYING))
				DoCast(SPELL_SNEAKING);
		}

		void EnterCombat(Unit * who) 
		{
			Talk(urand(0,1 ));
		}

		void UpdateAI(const uint32 diff) 
		{
			if (!UpdateVictim())
				return;

			DoMeleeAttackIfReady();
		}
	};

	CreatureAI* GetAI(Creature* pCreature) const
	{
		return new npc_goblin_assassinAI(pCreature);
	}
};



/// Wounded Trainee - 44564
class npc_wounded_trainee : public CreatureScript
{
public:
	npc_wounded_trainee() : CreatureScript("npc_wounded_trainee") {	}

	struct npc_wounded_traineeAI : public ScriptedAI
	{
		npc_wounded_traineeAI(Creature *p_Creature) : ScriptedAI(p_Creature) { }
		
		uint32 HealedTimer; 

		void Reset()
		{
			me->SetHealth(me->CountPctFromMaxHealth(43.0f));
			me->setRegeneratingHealth(false);
			HealedTimer = 15000;
		}

		void UpdateAI(const uint32 diff)
		{			

			if (me->GetHealthPct() > 43.0f)
				if (HealedTimer <= diff)
				{
					Reset();
					HealedTimer = 15000;
				}
				else
					HealedTimer -= diff;
		}
	};

	CreatureAI* GetAI(Creature* p_Creature) const
	{
		return new npc_wounded_traineeAI(p_Creature);
	}
};


/// Marshal Mcbride - 197
enum Marshal
{
	QUEST_REPORT_TO_GOLDSHIRE = 54,
	SAY_DISMISSED = 0
};

class npc_marshal_mcbride : public CreatureScript
{
public:
	npc_marshal_mcbride() : CreatureScript("npc_marshal_mcbride") { }

	bool OnQuestAccept(Player* player, Creature* creature, Quest const* quest)
	{
		if (quest->GetQuestId() == QUEST_REPORT_TO_GOLDSHIRE)
		{
			creature->AI()->Talk(SAY_DISMISSED, player->GetGUID());
		}
		return true;
	}

};

/// Training Dummy Starting Zones - 44171, 44548, 44820, 44937 & 42328
enum eTrainingDummySpells
{
    SPELL_CHARGE			= 100,
    SPELL_AUTORITE			= 105361, // OnDamage - Paladins
    SPELL_ASSURE			= 56641,
    SPELL_EVISCERATION		= 2098,
    SPELL_SHADOW_WORD_PAIN  = 589,
    SPELL_NOVA				= 122,
    SPELL_CORRUPTION_1		= 172,
    SPELL_CORRUPTION_2		= 87389,
    SPELL_CORRUPTION_3		= 131740,
    SPELL_TIGER_PALM		= 100787
};

class npc_training_dummy_start_zones : public CreatureScript
{
public:
    npc_training_dummy_start_zones() : CreatureScript("npc_training_dummy_start_zones") { }

    struct npc_training_dummy_start_zonesAI : Scripted_NoMovementAI
    {
        npc_training_dummy_start_zonesAI(Creature* creature) : Scripted_NoMovementAI(creature)
        {}

        uint32 resetTimer;

        void Reset()
        {
            me->SetControlled(true, UNIT_STATE_STUNNED); //disable rotate
			me->ApplySpellImmune(0, IMMUNITY_EFFECT, SPELL_EFFECT_KNOCK_BACK, true);

            resetTimer = 5000;
        }

        void EnterEvadeMode()
        {
            if (!_EnterEvadeMode())
                return;

            Reset();
        }

        void MoveInLineOfSight(Unit* p_Who)
        {
            if (!me->IsWithinDistInMap(p_Who, 20.0f) && p_Who->isInCombat())
            {
                me->RemoveAllAurasByCaster(p_Who->GetGUID());
                me->getHostileRefManager().deleteReference(p_Who);
            }
        }

        void DamageTaken(Unit* doneBy, uint32& damage, SpellInfo const*  /*p_SpellInfo*/)
        {
            resetTimer = 5000;
            damage = 0;

            if (doneBy->HasAura(SPELL_AUTORITE))
                if (doneBy->ToPlayer())
                    doneBy->ToPlayer()->KilledMonsterCredit(44175, 0);

            me->SetInCombatWith(doneBy);
            doneBy->SetInCombatWith(me);
        }

        void EnterCombat(Unit* /*who*/)
        {
            return;
        }

        void SpellHit(Unit* Caster, const SpellInfo* Spell)
        {
            switch (Spell->Id)
            {
                case SPELL_CHARGE:
                case SPELL_ASSURE:
                case SPELL_EVISCERATION:
				case SPELL_SHADOW_WORD_PAIN:
                case SPELL_NOVA:
                case SPELL_CORRUPTION_1:
                case SPELL_CORRUPTION_2:
                case SPELL_CORRUPTION_3:
                case SPELL_TIGER_PALM:
                    if (Caster->ToPlayer())
                        Caster->ToPlayer()->KilledMonsterCredit(44175, 0);
                    break;
                default:
                    break;
            }
        }

        void UpdateAI(uint32 const diff)
        {
            if (!UpdateVictim())
                return;

            if (!me->HasUnitState(UNIT_STATE_STUNNED))
                me->SetControlled(true, UNIT_STATE_STUNNED);

            if (resetTimer <= diff)
            {
                EnterEvadeMode();
                resetTimer = 5000;
            }
            else
                resetTimer -= diff;
        }
    };

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_training_dummy_start_zonesAI(creature);
    }
};

/// Marshal Dughan - 240
class npc_marshal_dughan : public CreatureScript
{
public:
	npc_marshal_dughan() : CreatureScript("npc_marshal_dughan") { }

	enum eActions
	{
		SelectGossip = 0
	};

	bool OnGossipHello(Player* p_Player, Creature* p_Creature)
	{
		p_Player->PrepareQuestMenu(p_Creature->GetGUID());

		if (p_Player->GetQuestStatus(35))
		{
			p_Player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "I wish to ride the Stormwind gryphon, sir.", GOSSIP_SENDER_MAIN, eActions::SelectGossip);
		}

		p_Player->SEND_GOSSIP_MENU(16211, p_Creature->GetGUID());

		return true;
	}

	bool OnGossipSelect(Player* p_Player, Creature* p_Creature, uint32 /*p_Sender*/, uint32 p_Action) override
	{
		switch (p_Action)
		{
			case eActions::SelectGossip: // I wish to ride the Stormwind Gryphon, sir.
			{
				if (p_Player->GetQuestStatus(35))
				{
					Position l_Pos;
					p_Player->GetPosition(&l_Pos);

					if (Creature* l_Creature = p_Player->SummonCreature(42260, l_Pos))
					{
						l_Creature->GetAI()->DoAction(0);
					}
				}
				break;
			}
		default:
			break;
		}

		p_Player->PlayerTalkClass->ClearMenus();
		p_Player->PlayerTalkClass->SendCloseGossip();

		return true;
	}

	struct npc_marshal_dughanAI : public ScriptedAI
	{
		npc_marshal_dughanAI(Creature* p_Creature) : ScriptedAI(p_Creature) { }
	};

	CreatureAI* GetAI(Creature* p_Creature) const override
	{
		return new npc_marshal_dughanAI(p_Creature);
	}
};

/// Stormwind Gryphon - 42260
/// Used to be Stormwind Charger - changed due to issues with movement for ground mount.
enum eMovepointsData
{
	MaxStormwindChargerMoves = 19
};

static std::array<G3D::Vector3, eMovepointsData::MaxStormwindChargerMoves> g_StormwindChargerMoves =
{
	{
		{ -9472.65f, 64.87f, 71.095f   },
		{ -9488.76f, 65.68f, 71.019f   },
		{ -9499.33f, 45.78f, 70.828f   },
		{ -9544.13f, -47.17f, 71.672f  },
		{ -9552.60f, -132.82f, 72.394f },
		{ -9573.70f, -159.34f, 72.569f },
		{ -9619.31f, -305.55f, 72.359f },
		{ -9617.16f, -408.72f, 72.105f },
		{ -9606.15f, -440.79f, 72.488f },
		{ -9590.33f, -487.42f, 72.738f },
		{ -9615.00f, -540.68f, 69.344f },
		{ -9625.86f, -634.08f, 66.309f },
		{ -9645.11f, -675.84f, 63.514f },
		{ -9656.27f, -726.09f, 59.377f },
		{ -9646.74f, -798.64f, 58.495f },
		{ -9584.79f, -877.63f, 58.836f },
		{ -9589.34f, -933.82f, 58.544f },
		{ -9619.54f, -979.84f, 58.692f },
		{ -9619.13f, -1031.14f, 39.681f }
	}
};

class npc_stormwind_gryphon : public CreatureScript
{
public:
	npc_stormwind_gryphon() : CreatureScript("npc_stormwind_gryphon") {}

	enum eActions
	{
		StartPath = 0,
		EndPath =  1
	};

	enum eMoves
	{
		StartQuestMove = 0
	};

	struct npc_stormwind_gryphonAI : public ScriptedAI
	{
		npc_stormwind_gryphonAI(Creature* creature) : ScriptedAI(creature)
		{
			m_PlayerGuid = 0;
		}

		uint64 m_PlayerGuid;

		void Reset() override
		{
			me->SetSpeed(UnitMoveType::MOVE_FLIGHT, 3.0f, true);

			ClearDelayedOperations();
		}

		void IsSummonedBy(Unit* p_Summoner) override
		{
			m_PlayerGuid = p_Summoner->GetGUID();
		}

		void DoAction(int32 const p_Action) override
		{
			switch (p_Action)
			{
				case eActions::StartPath:
				{
					AddTimedDelayedOperation(0 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						if (Player* p_Player = sObjectAccessor->GetPlayer(*me, m_PlayerGuid))
						{
							me->HandleEmoteCommand(553); // Special emote
						}
					});

					AddTimedDelayedOperation(0.5 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						if (Player* p_Player = sObjectAccessor->GetPlayer(*me, m_PlayerGuid))
						{
							me->CastSpell(p_Player, 59119); // ride vehicle
							p_Player->EnterVehicle(me);
						}
					});

					AddTimedDelayedOperation(1 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						if (Player* p_Player = sObjectAccessor->GetPlayer(*me, m_PlayerGuid))
						{
							me->GetMotionMaster()->MoveSmoothFlyPath(eMoves::StartQuestMove, g_StormwindChargerMoves.data(), g_StormwindChargerMoves.size(), false);
						}
					});

					AddTimedDelayedOperation(36 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->GetAI()->DoAction(eActions::EndPath);
					});
				break;
				}

				case eActions::EndPath:
				{
					AddTimedDelayedOperation(0.5 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->HandleEmoteCommand(553); // Special emote
						me->GetVehicleKit()->RemoveAllPassengers();
					});

					AddTimedDelayedOperation(1.5 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->DespawnOrUnsummon();
					});
					break;
				}
			default:
				break;
			}
		}

		void UpdateAI(uint32 const p_Diff) override
		{
			UpdateOperations(p_Diff);
		}
	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_stormwind_gryphonAI(creature);
	}
};

/// Hogger - 448
enum Spells
{
	SPELL_EATING = 87351,
	SPELL_VICIOUS_SLICE = 87337,
	SPELL_SUMMON_MINIONS = 87366,
	SPELL_SIMPLY_TELEPORT = 64446,
};

class npc_hogger : public CreatureScript
{
public:
	npc_hogger() : CreatureScript("npc_hogger") { }

	struct npc_hoggerAI : public ScriptedAI
	{
		uint8 phase;

		uint32 m_uiViciousSliceTimer;
		uint32 m_uiSummonMinions;
		uint32 m_uiPhaseTimer;
		uint32 m_uiDespawnTimer;

		uint64 GeneralGUID;
		uint64 Mage1GUID;
		uint64 Mage2GUID;
		uint64 Raga1GUID;
		uint64 Raga2GUID;
		uint64 PlayerGUID;

		bool bSay;
		bool bSay2;
		bool bSay3;
		bool Summon;
		bool bSummoned;
		bool bSummoned3;
		bool bGo1;
		bool bCasted;
		bool Credit;

		npc_hoggerAI(Creature *c) : ScriptedAI(c) {}

		void Reset()
		{
			me->RestoreFaction();
			me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);

			m_uiViciousSliceTimer = 8000;
			m_uiSummonMinions = 15000;
			m_uiPhaseTimer = 0;
			m_uiDespawnTimer = 500;

			phase = 0;
			GeneralGUID = 0;
			Mage1GUID = 0;
			Mage2GUID = 0;
			Raga1GUID = 0;
			Raga2GUID = 0;
			PlayerGUID = 0;

			Summon = false;
			bSay = false;
			bCasted = false;
			bSay2 = false;
			bSay3 = false;
			bSummoned = false;
			bSummoned3 = false;
			bGo1 = false;
			Credit = false;
		}

		void JustDied(Unit* /*killer*/)
		{
			me->RestoreFaction();
		}

		void AttackedBy(Unit* pAttacker)
		{
			if (me->getVictim() || me->IsFriendlyTo(pAttacker))
				return;

			AttackStart(pAttacker);
		}

		void MovementInform(uint32 type, uint32 id)
		{
			if (id == 0)
			{
				DoCast(me, SPELL_EATING);
			}
		}

		void UpdateAI(const uint32 diff)
		{
			ScriptedAI::UpdateAI(diff);

			DoMeleeAttackIfReady();

			if (m_uiViciousSliceTimer <= diff)
			{
				DoCast(me->getVictim(), SPELL_VICIOUS_SLICE);
				m_uiViciousSliceTimer = 10000;
			}
			else
				m_uiViciousSliceTimer -= diff;

			if (HealthBelowPct(50))
			{
				if (!bSummoned)
				{
					DoCast(me->getVictim(), SPELL_SUMMON_MINIONS);
					bSummoned = true;
				}
				if (!bSay)
				{
					me->MonsterYell("Yipe! Help Hogger", 0, NULL);
					bSay = true;
				}
			}

			if (HealthBelowPct(35))
			{
				if (!bSay2)
				{
					me->MonsterTextEmote("Hogger is eating! Stop him!", NULL, true);
					bSay2 = true;
				}
				if (!bGo1)
				{
					me->AttackStop();
					me->SetReactState(REACT_PASSIVE);
					me->GetMotionMaster()->MovePoint(0, -10142.081f, 671.773f, 36.014f);
					bGo1 = true;
				}
			}

			if (HealthBelowPct(10))
			{
				if (!bSummoned3)
				{
					if (!bSay3)
					{
						me->MonsterYell("No hurt Hogger!", 0, NULL);
						bSay3 = true;
					}

					me->CombatStop(true);
					me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);

					Creature* General = me->SummonCreature(46942, -10133.275f, 663.244f, 35.964616f, 2.45f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 180000);
					GeneralGUID = General->GetGUID();

					Creature* Mage1 = me->SummonCreature(46941, -10129.976f, 667.982f, 35.67f, 2.85f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 180000);
					Mage1GUID = Mage1->GetGUID();

					Creature* Mage2 = me->SummonCreature(46940, -10137.671f, 659.926f, 35.971f, 2.051f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 180000);
					Mage2GUID = Mage2->GetGUID();

					Creature* Raga1 = me->SummonCreature(46943, -10133.339f, 660.087f, 35.971f, 2.26f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 180000);
					Raga1GUID = Raga1->GetGUID();

					Creature* Raga2 = me->SummonCreature(42413, -10129.461f, 663.180f, 35.9491f, 2.37f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 180000);
					Raga2GUID = Raga2->GetGUID();

					Summon = true;

					m_uiPhaseTimer = 1500;
					phase = 1;
				}

				if (Summon)
				{
					Creature* General = Unit::GetCreature(*me, GeneralGUID);
					Creature* Raga2 = Unit::GetCreature(*me, Raga2GUID);
					Creature* Raga1 = Unit::GetCreature(*me, Raga1GUID);
					Creature* Mage2 = Unit::GetCreature(*me, Mage2GUID);
					Creature* Mage1 = Unit::GetCreature(*me, Mage1GUID);

					if (!bCasted)
					{
						General->CastSpell(General, 64446, true);
						Raga2->CastSpell(Raga2, 64446, true);
						Raga1->CastSpell(Raga1, 64446, true);
						Mage2->CastSpell(Raga2, 64446, true);
						Mage1->CastSpell(Raga1, 64446, true);
						bCasted = true;
					}

					bSummoned3 = true;
					me->SetSpeed(MOVE_RUN, 1.0f);
				}
			}

			if (bCasted)
			{
				if (m_uiPhaseTimer <= diff)
				{
					Creature* General = Unit::GetCreature(*me, GeneralGUID);
					Creature* Raga2 = Unit::GetCreature(*me, Raga2GUID);
					Creature* Raga1 = Unit::GetCreature(*me, Raga1GUID);
					Creature* Mage2 = Unit::GetCreature(*me, Mage2GUID);
					Creature* Mage1 = Unit::GetCreature(*me, Mage1GUID);

					switch (phase)
					{

					case 1: me->GetMotionMaster()->MovePoint(1, -10141.054f, 670.719f, 35.9569f); m_uiPhaseTimer = 3000; phase = 2; break;
					case 2: General->MonsterYell("Hold your blade, adventurer!", 0, NULL); m_uiPhaseTimer = 2500; phase = 3; break;
					case 3: Raga1->MonsterSay("WoW!", 0, NULL); m_uiPhaseTimer = 1500; phase = 4; break;
					case 4: Raga2->MonsterSay("General Jonathan Marcus!", 0, NULL); m_uiPhaseTimer = 1500; phase = 5; break;
					case 5:
					{
						if (Creature* General = Unit::GetCreature(*me, GeneralGUID))
						{
							General->MonsterSay("This beast leads the Riverpaw gnoll gang and may be the key to ending gnoll aggression in Elwynn!", 0, NULL);
							General->AddUnitMovementFlag(MOVEMENTFLAG_WALKING);
							General->GetMotionMaster()->MovePoint(0, -10137.162f, 667.919f, 35.937f);
							m_uiPhaseTimer = 3000;
						}
						phase = 6;
					} break;
					case 6: me->MonsterSay("Grrr...", 0, NULL); m_uiPhaseTimer = 4000; phase = 7; break;
					case 7:
					{
						General->HandleEmoteCommand(EMOTE_ONESHOT_POINT);
						m_uiPhaseTimer = 4500;
						phase = 8;
					} break;

					case 8: General->MonsterSay("We're taking him into custody in the name of King Varian Wrynn.", 0, NULL); m_uiPhaseTimer = 4000; phase = 9; break;
					case 9: me->MonsterSay("Nooooo...", 0, NULL); m_uiPhaseTimer = 4000; phase = 10; break;
					case 10: General->MonsterSay("Take us to the Stockades, Andromath.", 0, NULL); m_uiPhaseTimer = 4000; phase = 11; break;
						General->SetOrientation(6.08f);
					case 11:
					{
						General->CastSpell(General, 64446, true);
						Raga1->CastSpell(Raga1, 64446, true);
						Raga2->CastSpell(Raga2, 64446, true);
						Mage1->CastSpell(Mage1, 64446, true);
						Mage2->CastSpell(Mage2, 64446, true);
						me->CastSpell(me, 64446, true);

						General->DespawnOrUnsummon(500);
						Raga1->DespawnOrUnsummon(500);
						Raga2->DespawnOrUnsummon(500);
						Mage1->DespawnOrUnsummon(500);
						Mage2->DespawnOrUnsummon(500);
						me->DespawnOrUnsummon(500);

						std::list<Player*> PlayersInRange;
						me->GetPlayerListInGrid(PlayersInRange, 35.0f);

						for (std::list<Player*>::const_iterator itr = PlayersInRange.begin(); itr != PlayersInRange.end(); ++itr)
							(*itr)->KilledMonsterCredit(448, NULL);

						phase = 0;
					} break;
					default: break;
					}
				}
				else m_uiPhaseTimer -= diff;
			}
			if (me->GetHealth() <= 1)
			{
				if (m_uiDespawnTimer <= diff)
				{
					me->CombatStop(true);
					me->AttackStop();
					me->ClearAllReactives();
					me->DeleteThreatList();
					me->SetHealth(me->GetMaxHealth());
				}
				else m_uiDespawnTimer -= diff;
			}
		}
		void DamageTaken(Unit* done_by, uint32 & damage)
		{
			if (PlayerGUID == 0)
			{
				if (Player *pPlayer = done_by->ToPlayer())
				{
					PlayerGUID = pPlayer->GetGUID();
				}
			}

			if (me->GetHealth() <= damage)
			{
				damage = me->GetHealth() - 1;

				if (Credit == false)
				{
					me->RemoveAllAuras();
					me->CombatStop(true);
					me->AttackStop();
					me->ClearAllReactives();
					me->DeleteThreatList();

				}Credit = true;
			}
		}
	};

	CreatureAI* GetAI(Creature* pCreature) const
	{
		return new npc_hoggerAI(pCreature);
	}
};

/// Spell - Quest Extinguishing Hope - 26391
#define SPELL_VISUAL_EXTINGUISHER   96028

class spell_quest_extincteur: public SpellScriptLoader
{
    public:
        spell_quest_extincteur() : SpellScriptLoader("spell_quest_extincteur") { }

        class spell_quest_extincteur_AuraScript : public AuraScript
        {
            PrepareAuraScript(spell_quest_extincteur_AuraScript)

            void OnApply(AuraEffect const* /*aurEff*/, AuraEffectHandleModes /*mode*/)
            {
                if (GetCaster())
                    GetCaster()->AddAura(SPELL_VISUAL_EXTINGUISHER, GetCaster());
            }

            void OnPeriodic(AuraEffect const* /*aurEff*/)
            {
                if (!GetCaster())
                    return;

                if (Creature* fire = GetCaster()->FindNearestCreature(42940, 5.0f, true))
                {
                    if (Player* player = GetCaster()->ToPlayer())
                        player->KilledMonsterCredit(42940, 0);

                    fire->ForcedDespawn();
                }
            }

            void OnRemove(AuraEffect const*, AuraEffectHandleModes)
            {
                if (GetCaster())
                    GetCaster()->RemoveAurasDueToSpell(SPELL_VISUAL_EXTINGUISHER);
            }

            void Register()
            {
                OnEffectApply += AuraEffectApplyFn(spell_quest_extincteur_AuraScript::OnApply, EFFECT_0, SPELL_AURA_PERIODIC_TRIGGER_SPELL, AURA_EFFECT_HANDLE_REAL);
                OnEffectPeriodic += AuraEffectPeriodicFn(spell_quest_extincteur_AuraScript::OnPeriodic, EFFECT_0, SPELL_AURA_PERIODIC_TRIGGER_SPELL);
                OnEffectRemove += AuraEffectRemoveFn(spell_quest_extincteur_AuraScript::OnRemove, EFFECT_0, SPELL_AURA_PERIODIC_TRIGGER_SPELL, AURA_EFFECT_HANDLE_REAL);
            }
        };

        AuraScript* GetAuraScript() const
        {
            return new spell_quest_extincteur_AuraScript();
        }
};



/// Henze Faulk - 6172
enum eHenzeFaulkData
{
	SAY_HEAL = -1000187,
};

class npc_henze_faulk : public CreatureScript
{
public:
	npc_henze_faulk() : CreatureScript("npc_henze_faulk") { }

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_henze_faulkAI(creature);
	}

	struct npc_henze_faulkAI : public ScriptedAI
	{
		uint32 lifeTimer;
		bool spellHit;

		npc_henze_faulkAI(Creature* creature) : ScriptedAI(creature) {}

		void Reset()
		{
			lifeTimer = 120000;
			me->SetUInt32Value(UNIT_FIELD_NPC_FLAGS, UNIT_DYNFLAG_DEAD);
			me->SetStandState(UNIT_STAND_STATE_DEAD);   // lay down
			spellHit = false;
		}

		void EnterCombat(Unit* /*who*/)
		{
		}

		void MoveInLineOfSight(Unit* /*who*/)
		{
		}

		void UpdateAI(const uint32 diff)
		{
			if (me->IsStandState())
			{
				if (lifeTimer <= diff)
				{
					EnterEvadeMode();
					return;
				}
				else
					lifeTimer -= diff;
			}
		}

		void SpellHit(Unit* /*Hitter*/, const SpellEntry* Spellkind)
		{
			if (Spellkind->Id == 8593 && !spellHit)
			{
				DoCast(me, 32343);
				me->SetStandState(UNIT_STAND_STATE_STAND);
				me->SetUInt32Value(UNIT_FIELD_NPC_FLAGS, 0);
				//me->RemoveAllAuras();
				DoScriptText(SAY_HEAL, me);
				spellHit = true;
			}
		}
	};
};

#ifndef __clang_analyzer__
void AddSC_elwyn_forest()
{
	/// Northshire
    new npc_stormwind_infantry();
	new npc_blackrock_battle_worg();
    new npc_injured_stormwind_soldier();
    new npc_training_dummy_start_zones();
	new npc_blackrock_invader();
	new npc_goblin_assassin();
	new npc_wounded_trainee();
	new spell_quest_extincteur();

	/// Replaced by SmartAI
	//new npc_brother_paxton();
	//new npc_blackrock_spy();

	/// Goldshire
	new npc_stormwind_gryphon();
	new	npc_marshal_dughan();

	new npc_hogger();

	new npc_henze_faulk();
}
#endif
