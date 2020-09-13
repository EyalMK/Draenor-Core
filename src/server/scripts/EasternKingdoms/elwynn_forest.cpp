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
#include "MotionMaster.h"
#include "ObjectAccessor.h"
#include "GameEventMgr.h"
#include "CreatureGroups.h"
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

		void DamageTaken(Unit* doneBy, uint32& damage, SpellInfo const*  /*p_SpellInfo*/) override
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
							me->AI()->AttackStart(wolf);
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
				GetPositionWithDistInFront(me, 15.0f, wolfPos);

				float z = me->GetMap()->GetHeight(me->GetPhaseMask(), wolfPos.GetPositionX(), wolfPos.GetPositionY(), wolfPos.GetPositionZ());
				wolfPos.m_positionZ = z;
				
				if (Creature* wolf = me->SummonCreature(NPC_BLACKROCK_BATTLE_WORG, wolfPos))
				{
					me->getThreatManager().addThreat(wolf, 1000000.0f);
					wolf->getThreatManager().addThreat(me, 1000000.0f);
					me->AI()->AttackStart(wolf);
					wolf->AI()->AttackStart(me);
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
		uint64 guardTarget;

		void Reset() 
		{
			m_minHealth = 91.0f;
			guardTarget = 0;
		}

		void IsSummonedBy(Unit* summoner) override
		{
			if (summoner->ToCreature()->GetEntry() == NPC_STORMWIND_INFANTRY)
				guardTarget = summoner->ToCreature()->GetGUID();
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
							me->AI()->AttackStart(guard);
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
				if (me->isSummon())
				{
					me->DespawnOrUnsummon();
				}
			}
		}
	

		void DamageDealt(Unit* target, uint32& damage, DamageEffectType /*damageType*/) override
		{
			if (target->ToCreature())
				if (target->GetHealth() <= damage || target->GetHealthPct() <= 87.0f)
					damage = 0;
		}

		void DamageTaken(Unit* pWho, uint32& uiDamage, SpellInfo const*  /*p_SpellInfo*/) override
		{
			if (Creature* npc = pWho->ToCreature())
				if (npc->GetEntry() == NPC_STORMWIND_INFANTRY)
					uiDamage = 0;

			if (pWho->GetTypeId() == TYPEID_PLAYER || pWho->isPet())
			{
				if (Creature* guard = me->FindNearestCreature(NPC_STORMWIND_INFANTRY, 16.0f, true))
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

	enum eQuests
	{
		Quest_Fear_no_Evil_1 = 28806,
		Quest_Fear_no_Evil_2 = 28808,
		Quest_Fear_no_Evil_3 = 28809,
		Quest_Fear_no_Evil_4 = 28810,
		Quest_Fear_no_Evil_5 = 28811,
		Quest_Fear_no_Evil_6 = 28812,
		Quest_Fear_no_Evil_7 = 28813,
		Quest_Fear_no_Evil_8 = 29082
	};

	struct npc_injured_stormwind_soldierAI : public ScriptedAI
	{
		npc_injured_stormwind_soldierAI(Creature* creature) : ScriptedAI(creature) 
		{ 
			m_PlayerGuid = 0;
		}

		EventMap m_CosmeticEvents;
		EventMap m_Events;
		uint64 m_PlayerGuid;
		float randHealth = urand(30.0f, 45.0f);

		std::list<uint32> Quests;
		

		void Reset()
		{
			ClearDelayedOperations();
			m_Events.Reset();

			Quests.push_back(28806);
			Quests.push_back(28808);
			Quests.push_back(28809);
			Quests.push_back(28810);
			Quests.push_back(28811);
			Quests.push_back(28812);
			Quests.push_back(28813);
			Quests.push_back(29082);

			me->SetFlag(UNIT_FIELD_NPC_FLAGS, UNIT_NPC_FLAG_SPELLCLICK);
			me->SetByteFlag(UNIT_FIELD_ANIM_TIER, 0, UNIT_STAND_STATE_DEAD);
			me->SetHealth(me->CountPctFromMaxHealth(randHealth));
			me->setRegeneratingHealth(false);
		}

		void OnSpellClick(Unit* clicker) override
		{

			for (auto quest : Quests)
			{
				if (clicker->ToPlayer()->GetQuestStatus(quest) == QUEST_STATUS_INCOMPLETE)
				{
					m_PlayerGuid = clicker->GetGUID();

					me->RemoveFlag(UNIT_FIELD_NPC_FLAGS, UNIT_NPC_FLAG_SPELLCLICK);
					me->CastSpell(me, SPELL_RENEWEDLIFE, true);
					DoAction(eActions::ActionHeal);
					break;
				}
				
				return;
			}
				

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
						if (m_PlayerGuid)
						{
							Talk(0, m_PlayerGuid);
							me->HandleEmoteCommand(EMOTE_ONESHOT_SALUTE);
						}
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

/// <<<< Needs to be disabled. Could be done easily though SmartAI - wandering: UPDATE `creature` SET `spawndist`=5, `MovementType`=1 WHERE `id`=42937; & on event enter combat, Talk(0)
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

        void SpellHit(Unit* Caster, const SpellInfo* Spell) override
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

	enum eData
	{
		// Quest
		QUEST_FURTHER_CONCERNS	= 35,

		// NPCs
		NPC_STORMWIND_CHARGER	= 42260,

		// Spells
		SPELL_RIDE_VEHICLE		= 59119,

		// Gossip Menu
		DUGHAN_GOSSIP_MENU_ID	= 11611,
		DUGHAN_GOSSIP_OPTION	= 0,
		DUGHAN_NPC_TEXT			= 16211,
	};

	bool OnGossipHello(Player* p_Player, Creature* p_Creature)
	{
		p_Player->PrepareQuestMenu(p_Creature->GetGUID());

		if (p_Player->GetQuestStatus(QUEST_FURTHER_CONCERNS))
			p_Player->ADD_GOSSIP_ITEM_DB(DUGHAN_GOSSIP_MENU_ID, DUGHAN_GOSSIP_OPTION, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF);

		p_Player->SEND_GOSSIP_MENU(DUGHAN_NPC_TEXT, p_Creature->GetGUID());

		return true;
	}

	bool OnGossipSelect(Player* p_Player, Creature* p_Creature, uint32 /*p_Sender*/, uint32 p_Action) override
	{
		switch (p_Action)
		{
			case GOSSIP_ACTION_INFO_DEF: // I wish to ride the Stormwind Charger, sir.
			{
				Position l_Pos;
				p_Player->GetPosition(&l_Pos);
				GetPositionWithDistInFront(p_Player, 2.5f, l_Pos);

				float z = p_Player->GetMap()->GetHeight(p_Player->GetPhaseMask(), l_Pos.GetPositionX(), l_Pos.GetPositionY(), l_Pos.GetPositionZ());
				l_Pos.m_positionZ = z;

				if (Creature* Charger = p_Player->SummonCreature(NPC_STORMWIND_CHARGER, l_Pos))
				{
					p_Player->CastSpell(Charger, SPELL_RIDE_VEHICLE);
					p_Player->EnterVehicle(Charger);
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

/// Further Concerns - Quest ID: 35
enum eData
{

	// Quest
	QUEST_FURTHER_CONCERNS = 35,

	// Events
	EVENT_PLAY_MOUNT_ANIMATION = 1,
	EVENT_START_RIDING = 2,
	EVENT_EJECT_PASSENGER = 3,
	EVENT_DESPAWN = 4,

	// Path Data
	POINT_BRIDGE = 39,
	MaxStormwindChargerMoves = 39,

	// Sound Ids
	SOUND_ID_MOUNTSPECIAL = 4066,

	// Spells
	SPELL_RIDE_VEHICLE = 59119,
};

/// Stormwind Gryphon - 42260
class npc_stormwind_charger : public CreatureScript
{
public:
	npc_stormwind_charger() : CreatureScript("npc_stormwind_charger") {}


	struct npc_stormwind_chargerAI : public ScriptedAI
	{
		npc_stormwind_chargerAI(Creature* creature) : ScriptedAI(creature) { }

		void PassengerBoarded(Unit* passenger, int8 /*seatId*/, bool apply) override
		{
			if (!passenger->IsPlayer())
				return;

			me->PlayDirectSound(SOUND_ID_MOUNTSPECIAL, passenger->ToPlayer());

			if (apply)
			{
				me->SetControlled(true, UNIT_STATE_ROOT);
				_events.ScheduleEvent(EVENT_PLAY_MOUNT_ANIMATION, 200);
			}
		}

		// Make mount despawn on eject

		void UpdateAI(uint32 diff) override
		{
			_events.Update(diff);
			while (uint32 eventId = _events.ExecuteEvent())
			{
				switch (eventId)
				{
				case EVENT_PLAY_MOUNT_ANIMATION:
					me->HandleEmoteCommand(EMOTE_ONESHOT_MOUNTSELFSPECIAL);
					_events.ScheduleEvent(EVENT_START_RIDING, 1200);
					break;
				case EVENT_START_RIDING:
					me->SetSpeed(UnitMoveType::MOVE_RUN, 2.2f, true);
					me->GetMotionMaster()->MovePath(4226000, false); // Implemented in waypoint_data
					break;
				case EVENT_EJECT_PASSENGER:
					me->HandleEmoteCommand(EMOTE_ONESHOT_MOUNTSELFSPECIAL);
					me->GetVehicleKit()->RemoveAllPassengers();
					_events.ScheduleEvent(EVENT_DESPAWN, 2000);
					break;
				case EVENT_DESPAWN:
					me->DespawnOrUnsummon();
					break;
				default:
					break;
				}
			}
		}

		void MovementInform(uint32 motionType, uint32 pointId) override
		{
			if (motionType == EFFECT_MOTION_TYPE && pointId == POINT_BRIDGE)
				_events.ScheduleEvent(EVENT_EJECT_PASSENGER, 2000);
		}

	private:
		EventMap _events;

	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_stormwind_chargerAI(creature);
	}

};


enum COG_Paths
{
	STORMWIND_PATH = 80500,
	GOLDSHIRE_PATH = 80501,
	WOODS_PATH = 80502,
	HOUSE_PATH = 80503,
	LISA_PATH = 80700
};

enum COG_Waypoints
{
	STORMWIND_WAYPOINT = 57,
	GOLDSHIRE_WAYPOINT = 32,
	WOODS_WAYPOINT = 22,
	HOUSE_WAYPOINT = 35,
	LISA_WAYPOINT = 4
};

enum COG_Sounds
{
	BANSHEE_DEATH = 1171,
	BANSHEEPREAGGRO = 1172,
	CTHUN_YOU_WILL_DIE = 8585,
	CTHUN_DEATH_IS_CLOSE = 8580,
	HUMAN_FEMALE_EMOTE_CRY = 6916,
	GHOSTDEATH = 3416
};

enum COG_Creatures
{
	NPC_DANA = 804,
	NPC_CAMERON = 805,
	NPC_JOHN = 806,
	NPC_LISA = 807,
	NPC_AARON = 810,
	NPC_JOSE = 811
};

enum COG_Events
{
	EVENT_WP_START_GOLDSHIRE = 1,
	EVENT_WP_START_WOODS = 2,
	EVENT_WP_START_HOUSE = 3,
	EVENT_WP_START_LISA = 4,
	EVENT_PLAY_SOUNDS = 5,
	EVENT_BEGIN_EVENT = 6
};

enum COG_GameEvent
{
	GAME_EVENT_CHILDEREN_OF_GOLDSHIRE = 76
};

class npc_cameron : public CreatureScript
{
public:
	npc_cameron() : CreatureScript("npc_cameron") { }

	struct npc_cameronAI : public ScriptedAI
	{
		npc_cameronAI(Creature* creature) : ScriptedAI(creature)
		{
			_started = false;
		}

		static uint32 SoundPicker()
		{
			return RAND(
				BANSHEE_DEATH,
				BANSHEEPREAGGRO,
				CTHUN_YOU_WILL_DIE,
				CTHUN_DEATH_IS_CLOSE,
				HUMAN_FEMALE_EMOTE_CRY,
				GHOSTDEATH
			);
		}

		void MoveTheChildren()
		{
			std::vector<Position> MovePosPositions =
			{
				{ -9373.521f, -67.71767f, 69.201965f, 1.117011f },
				{ -9374.94f, -62.51654f, 69.201965f, 5.201081f },
				{ -9371.013f, -71.20811f, 69.201965f, 1.937315f },
				{ -9368.419f, -66.47543f, 69.201965f, 3.141593f },
				{ -9372.376f, -65.49946f, 69.201965f, 4.206244f },
				{ -9377.477f, -67.8297f, 69.201965f, 0.296706f }
			};

			JadeCore::Containers::SelectRandomContainerElement(MovePosPositions);

			// first we break formation because children will need to move on their own now
			for (auto guid : _childrenGUIDs)
				if (Creature* child = ObjectAccessor::GetCreature(*me, guid))
					if (child->GetFormation())
						child->GetFormation()->RemoveMember(child);

			// Move each child to an random position
						for (uint32 i = 0; i < _childrenGUIDs.size(); ++i)
						{
							if (Creature* children = ObjectAccessor::GetCreature(*me, i))
							{
								children->SetWalk(true);
								children->GetMotionMaster()->MovePoint(0, MovePosPositions[i], true);
								children->SetFacingTo(MovePosPositions[i].GetOrientation());
							}
						}
			me->SetWalk(true);
			me->GetMotionMaster()->MovePoint(0, MovePosPositions.back(), true);
			me->SetFacingTo(MovePosPositions.back().GetOrientation());
		}

		void WaypointReached(uint32 waypointId, uint32 pathId)
		{
			switch (pathId)
			{
			case STORMWIND_PATH:
			{
				if (waypointId == STORMWIND_WAYPOINT)
				{
					me->GetMotionMaster()->MoveRandom(10.f);
					_events.ScheduleEvent(EVENT_WP_START_GOLDSHIRE, 11 * 60000);
				}

				break;
			}
			case GOLDSHIRE_PATH:
			{
				if (waypointId == GOLDSHIRE_WAYPOINT)
				{
					me->GetMotionMaster()->MoveRandom(10.f);
					_events.ScheduleEvent(EVENT_WP_START_WOODS, 15 * 60000);
				}
				break;
			}
			case WOODS_PATH:
			{
				if (waypointId == WOODS_WAYPOINT)
				{
					me->GetMotionMaster()->MoveRandom(10.f);
					_events.ScheduleEvent(EVENT_WP_START_HOUSE, 6 * 60000);
					_events.ScheduleEvent(EVENT_WP_START_LISA, 2000);
				}

				break;
			}
			case HOUSE_PATH:
			{
				if (waypointId == HOUSE_WAYPOINT)
				{
					// Move childeren at last point 
					MoveTheChildren();

					// After 30 seconds a random sound should play
					_events.ScheduleEvent(EVENT_PLAY_SOUNDS, 30000);
				}
				break;
			}
			}
		}

		void sOnGameEvent(bool start, uint16 eventId) override
		{
			if (start && eventId == GAME_EVENT_CHILDEREN_OF_GOLDSHIRE)
			{
				// Start event at 7 am
				// Begin pathing
				_events.ScheduleEvent(EVENT_BEGIN_EVENT, 2000);
				_started = true;
			}
			else if (!start && eventId == GAME_EVENT_CHILDEREN_OF_GOLDSHIRE)
			{
				// Reset event at 8 am
				_started = false;
				_events.Reset();
			}
		}
		void UpdateAI(uint32 diff) override
		{
			if (!_started)
				return;

			_events.Update(diff);

			while (uint32 eventId = _events.ExecuteEvent())
			{
				switch (eventId)
				{
				case EVENT_WP_START_GOLDSHIRE:
					me->GetMotionMaster()->MovePath(GOLDSHIRE_PATH, false);
					break;
				case EVENT_WP_START_WOODS:
					me->GetMotionMaster()->MovePath(WOODS_PATH, false);
					break;
				case EVENT_WP_START_HOUSE:
					me->GetMotionMaster()->MovePath(HOUSE_PATH, false);
					break;
				case EVENT_WP_START_LISA:
					for (uint32 i = 0; i < _childrenGUIDs.size(); ++i)
					{
						if (Creature* lisa = ObjectAccessor::GetCreature(*me, i))
						{
							if (lisa->GetEntry() == NPC_LISA)
							{
								lisa->GetMotionMaster()->MovePath(LISA_PATH, false);
								break;
							}
						}
					}
					break;
				case EVENT_PLAY_SOUNDS:
					me->PlayDistanceSound(me, SoundPicker());
					break;
				case EVENT_BEGIN_EVENT:
				{
					_childrenGUIDs.clear();

					// Get all childeren's guid's.
					if (Creature* dana = me->FindNearestCreature(NPC_DANA, 25.0f))
						_childrenGUIDs.push_back(dana->GetGUID());

					if (Creature* john = me->FindNearestCreature(NPC_JOHN, 25.0f))
						_childrenGUIDs.push_back(john->GetGUID());

					if (Creature* lisa = me->FindNearestCreature(NPC_LISA, 25.0f))
						_childrenGUIDs.push_back(lisa->GetGUID());

					if (Creature* aaron = me->FindNearestCreature(NPC_AARON, 25.0f))
						_childrenGUIDs.push_back(aaron->GetGUID());

					if (Creature* jose = me->FindNearestCreature(NPC_JOSE, 25.0f))
						_childrenGUIDs.push_back(jose->GetGUID());

					// If Formation was disbanded, remake.
					if (!me->GetFormation()->isFormed())
						for (auto guid : _childrenGUIDs)
							if (Creature* child = ObjectAccessor::GetCreature(*me, guid))
								child->SearchFormation();

					// Start movement
					me->GetMotionMaster()->MovePath(STORMWIND_PATH, false);

					break;
				}
				default:
					break;
				}
			}
		}

	private:
		EventMap _events;
		bool _started;
		std::list<uint64> _childrenGUIDs;
	};
	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_cameronAI(creature);
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
#define SPELL_VISUAL_EXTINGUISHER   80208
#define NPC_VINEYARD_BUNNY 42940
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

                if (Creature* fire = GetCaster()->FindNearestCreature(NPC_VINEYARD_BUNNY, 5.0f, true))
                {
                    if (Player* player = GetCaster()->ToPlayer())
                        player->KilledMonsterCredit(NPC_VINEYARD_BUNNY);

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


/// Supervisor Raelen - 44564
class npc_supervisor_raelen : public CreatureScript
{
public:
	npc_supervisor_raelen() : CreatureScript("npc_supervisor_raelen") {	}

	enum eMisc
	{
		NPC_EASTVALE_PEASANT	= 11328,
		EVENT_RESET_ORDER		= 0,
	};

	struct npc_supervisor_raelenAI : public ScriptedAI
	{
		npc_supervisor_raelenAI(Creature *p_Creature) : ScriptedAI(p_Creature) {	}

		uint32 timer;
		uint32 phase;
		Creature* peasant;
		bool GivenOrder;

		void Reset()
		{
			timer = 0;
			phase = 0;
			GivenOrder = false;
		}

		void UpdateAI(uint32 diff) override
		{
			if (!UpdateVictim())
			{
				if (GivenOrder)
				{
					
					if (timer <= diff)
					{
						switch (phase)
						{
							case 1:
								timer = 10000;
								phase++;
								break;
							case 2:
								// reset
								timer = 0;
								phase = 0;
								GivenOrder = false;
								break;
						}
						
					}
					else
						timer -= diff;
				}

			}
			else
				DoMeleeAttackIfReady();
		}

		void MoveInLineOfSight(Unit* who)
		{
			if (!who || !who->isAlive() || GivenOrder)
				return;

			if (who->ToCreature() && me->IsWithinDistInMap(who, 2.0f))
			{
				peasant = who->ToCreature();
				if (peasant->GetEntry() == NPC_EASTVALE_PEASANT)
				{
					Talk(0, who->ToCreature()->GetGUID());
					GivenOrder = true;
					timer = 2000;
					phase++;
				}
			}
		}

	};

	CreatureAI* GetAI(Creature* p_Creature) const
	{
		return new npc_supervisor_raelenAI(p_Creature);
	}
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

	/// Goldshire
	new	npc_marshal_dughan();
	new npc_stormwind_charger();
	new npc_cameron();

	/// Elwynn Forest
	new npc_hogger();
	new npc_supervisor_raelen();
}
#endif