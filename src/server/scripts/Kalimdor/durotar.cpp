////////////////////////////////////////////////////////////////////////////////
//
// Project-Hellscream https://hellscream.org
// Copyright (C) 2018-2020 Project-Hellscream-6.2
// Discord https://discord.gg/CWCF3C9
//
////////////////////////////////////////////////////////////////////////////////


#include "MapManager.h"
#include "GameObject.h"
#include "GameObjectAI.h"
#include "ObjectMgr.h"
#include "Player.h"
#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "ScriptedEscortAI.h"
#include "SpellScript.h"
#include "Transport.h"
#include "TransportMgr.h"
#include "Vehicle.h"


/// PlayerScript Handler - Durotar
class playerScript_durotar_handler : public PlayerScript
{
public:
	playerScript_durotar_handler() : PlayerScript("playerScript_durotar_handler") { }

	void OnQuestAbandon(Player* p_Player, const Quest* p_Quest) override
	{
		switch (p_Quest->GetQuestId())
		{
			case 25924:
				p_Player->RemoveAura(59074);
				break;
		}
	}
};




enum VoodooSpells
{
    SPELL_BREW      = 16712, // Special Brew
    SPELL_GHOSTLY   = 16713, // Ghostly
    SPELL_HEX1      = 16707, // Hex
    SPELL_HEX2      = 16708, // Hex
    SPELL_HEX3      = 16709, // Hex
    SPELL_GROW      = 16711, // Grow
    SPELL_LAUNCH    = 16716, // Launch (Whee!)
};

/// Darkspear Jailor - 39062
enum ejailor
{
	// Texts
	SAY_JAILOR_1 = 0,
	SAY_SPITESCALE_1 = 1,
	GOSSIP_MENU_JAILOR = 10974,
	GOSSIP_OPTION_JAILOR = 0,
	NPC_TEXT_JAILOR = 15251,

	// Npcs
	NPC_DARKSPEAR_JAILOR = 39062,
	NPC_SPITESCALE_SCOUT = 38142,
	GOBJECT_CAGE = 201968,


	// Quests
	QUEST_PROVING_PIT_WARLOCK = 26276,
	QUEST_PROVING_PIT_DRUID = 24768,
	QUEST_PROVING_PIT_WARRIOR = 24642,
	QUEST_PROVING_PIT_PRIEST = 24786,
	QUEST_PROVING_PIT_HUNTER = 24780,
	QUEST_PROVING_PIT_ROGUE = 24774,
	QUEST_PROVING_PIT_SHAMAN = 24762,
	QUEST_PROVING_PIT_MAGE = 24754,
	QUEST_PROVING_PIT_MONK = 31161,
};

float fNodeJailorPosition[2][3][3] =
{
	{
		{-1132.875366f, -5425.658203f, 13.308554f},
		{-1134.783813f, -5416.551270f, 13.269002f},
		{-1132.472046f, -5424.702637f, 13.225397f},
	},
	{
		{-1159.829956f, -5519.570313f, 12.126601f},
		{-1153.379028f, -5518.994629f, 11.996062f},
		{-1159.829956f, -5519.570313f, 12.126601f},
	},
};

float fNodeNagaPosition[2][3] =
{
	{-1146.220581f, -5417.623047f, 10.597669f},
	{-1150.114380f, -5527.809082f,  8.105021f},
};

class npc_jailor : public CreatureScript
{
public:
	npc_jailor() : CreatureScript("npc_jailor") { }

	bool OnGossipHello(Player* Player, Creature* Creature)
	{
		if (CAST_AI(npc_jailor::npc_jailorAI, Creature->AI())->uiStart == false)
		{
			Player->PrepareGossipMenu(Creature);
			/// Proving Pit quests
			if (Player->GetQuestStatus(QUEST_PROVING_PIT_PRIEST) == QUEST_STATUS_INCOMPLETE || Player->GetQuestStatus(QUEST_PROVING_PIT_MAGE) == QUEST_STATUS_INCOMPLETE ||
				Player->GetQuestStatus(QUEST_PROVING_PIT_SHAMAN) == QUEST_STATUS_INCOMPLETE || Player->GetQuestStatus(QUEST_PROVING_PIT_ROGUE) == QUEST_STATUS_INCOMPLETE ||
				Player->GetQuestStatus(QUEST_PROVING_PIT_WARLOCK) == QUEST_STATUS_INCOMPLETE || Player->GetQuestStatus(QUEST_PROVING_PIT_WARRIOR) == QUEST_STATUS_INCOMPLETE ||
				Player->GetQuestStatus(QUEST_PROVING_PIT_DRUID) == QUEST_STATUS_INCOMPLETE || Player->GetQuestStatus(QUEST_PROVING_PIT_HUNTER) == QUEST_STATUS_INCOMPLETE ||
				Player->GetQuestStatus(QUEST_PROVING_PIT_MONK) == QUEST_STATUS_INCOMPLETE)
			{
				Player->ADD_GOSSIP_ITEM_DB(GOSSIP_MENU_JAILOR, GOSSIP_OPTION_JAILOR, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
			}
		}

		Player->SEND_GOSSIP_MENU(NPC_TEXT_JAILOR, Creature->GetGUID());

		return true;
	}

	bool OnGossipSelect(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
	{
		pPlayer->PlayerTalkClass->ClearMenus();
		if (uiAction == GOSSIP_ACTION_INFO_DEF + 1)
		{
			uint8 Phase = 1;
			if (pCreature->GetDistance(-1143.18f, -5429.95f, 13.97f) < 20)
				Phase = 0;

			CAST_AI(npc_jailor::npc_jailorAI, pCreature->AI())->Phase = Phase;
			pCreature->AI()->Talk(SAY_JAILOR_1); // Get in the pit

			pPlayer->KilledMonsterCredit(pCreature->GetEntry(), 0);
			pPlayer->CLOSE_GOSSIP_MENU();
		}
		return true;
	}

	CreatureAI* GetAI(Creature* pCreature) const
	{
		return new npc_jailorAI(pCreature);
	}

	struct npc_jailorAI : public ScriptedAI
	{
		npc_jailorAI(Creature* pCreature) : ScriptedAI(pCreature) {}

		uint8 Phase;
		uint8 uiNode;
		uint32 uiTimer;
		bool uiStart;

		void Reset()
		{
			GameObject* pCage = me->FindNearestGameObject(GOBJECT_CAGE, 20.0f);
			pCage->Respawn();
			pCage->SetGoState(GO_STATE_READY);
			Phase = 5;
			uiNode = 0;
			uiTimer = 2000;
			uiStart = false;
		}

		void UpdateAI(const uint32 uiDiff)
		{
			if (me->isInCombat())
				return;

			if (Phase != 5)
			{
				uiStart = true;
				if (uiTimer <= uiDiff)
				{
					GoToTheNextNode();
					uiTimer = 2500;
					switch (uiNode)
					{
					case 1:
						uiTimer = 5000;
						uiNode++;
						break;
					case 3:
						uiTimer = 120000;
						uiNode++;
						break;
					case 4:
						if (Creature* pNaga = me->FindNearestCreature(NPC_SPITESCALE_SCOUT, 30.0f))
						{
							pNaga->SetReactState(REACT_PASSIVE);
							pNaga->setFaction(634);
							pNaga->GetMotionMaster()->MoveTargetedHome();
						}
						uiTimer = 4000;
						uiNode++;
						break;
					case 5:
						if (GameObject*pCage = me->FindNearestGameObject(GOBJECT_CAGE, 30.0f))
						{
							pCage->Respawn();
							pCage->SetGoState(GO_STATE_READY);
						}
						uiNode = 0;
						Phase = 5;
						uiStart = false;
						uiTimer = 2000;
					default:
						uiNode++;
						break;
					}
				}
				else
					uiTimer -= uiDiff;
			}
		}

		void GoToTheNextNode()
		{
			if (uiNode >= 3)
				me->GetMotionMaster()->MoveTargetedHome();
			else
				me->GetMotionMaster()->MoveCharge(fNodeJailorPosition[Phase][uiNode][0], fNodeJailorPosition[Phase][uiNode][1], fNodeJailorPosition[Phase][uiNode][2], 5);
		}

		void MovementInform(uint32 uiType, uint32 uiPointId)
		{
			if (uiType != POINT_MOTION_TYPE)
				return;

			if (uiNode == 2)
			{
				if (GameObject*pCage = me->FindNearestGameObject(GOBJECT_CAGE, 15.0f))
				{
					pCage->SetGoType(GAMEOBJECT_TYPE_BUTTON);
					pCage->UseDoorOrButton();
				}
				if (Creature* pNaga = me->FindNearestCreature(NPC_SPITESCALE_SCOUT, 15.0f))
				{
					pNaga->SetReactState(REACT_AGGRESSIVE);
					pNaga->setFaction(14);
					pNaga->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PC | UNIT_FLAG_NOT_ATTACKABLE_1 | UNIT_FLAG_NON_ATTACKABLE);
					pNaga->AI()->Talk(SAY_SPITESCALE_1); // They sssend you to your death
					pNaga->GetMotionMaster()->MoveCharge(fNodeNagaPosition[Phase][0], fNodeNagaPosition[Phase][1], fNodeNagaPosition[Phase][2], 5);
				}
			}
		}
	};
};


/// Swiftclaw - 37989
enum eSwiftclaw
{
	SPELL_RIDE_VEHICLE_1 = 52391,
	SPELL_RIDE_VEHICLE_2 = 70925,

	NPC_RUNNING_SWIFTCLAW	 = 37989,
	NPC_NEARBY_RAPTOR		 = 38987,
	NPC_CONTROLLED_SWIFTCLAW = 38002,
};

class npc_swiftclaw : public CreatureScript
{
public:
	npc_swiftclaw() : CreatureScript("npc_swiftclaw") { }

	CreatureAI* GetAI(Creature* pCreature) const
	{
		return new npc_swiftclawAI(pCreature);
	}

	struct npc_swiftclawAI : public ScriptedAI
	{
		npc_swiftclawAI(Creature* pCreature) : ScriptedAI(pCreature) {}

		void Reset()
		{
			if (Unit* owner = me->ToCreature()->GetCharmerOrOwner())
				if (owner->GetTypeId() == TYPEID_PLAYER)
				{
					owner->CastSpell(me, SPELL_RIDE_VEHICLE_1, true);
					me->ToTempSummon()->GetSummoner()->GetGUID();
					me->SetFlag(UNIT_FIELD_NPC_FLAGS, UNIT_NPC_FLAG_SPELLCLICK);
					me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
				}
				else
					me->DespawnOrUnsummon();
		}

		void OnCharmed(bool /*apply*/) { }

		void PassengerBoarded(Unit * who, int8 /*seatId*/, bool apply)
		{
			if (Player * pWho = who->ToPlayer())
			{
				me->SetFlag(UNIT_FIELD_FLAGS_2, UNIT_FLAG2_FORCE_MOVEMENT);
				pWho->KilledMonsterCredit(NPC_RUNNING_SWIFTCLAW, 0);
			}
		}

		void MoveInLineOfSight(Unit* who)
		{
			if (me->FindNearestCreature(NPC_NEARBY_RAPTOR, 5.0f, true))
			{
				if (Player * pWho = who->ToPlayer())
				{
					pWho->KilledMonsterCredit(NPC_CONTROLLED_SWIFTCLAW, 0);
				}
				me->DespawnOrUnsummon();
			}
		}
	};
};

/// Swiftclaw2 - 38002
class npc_swiftclaw2 : public CreatureScript
{
public:
	npc_swiftclaw2() : CreatureScript("npc_swiftclaw2") { }

	CreatureAI* GetAI(Creature* pCreature) const
	{
		return new  npc_swiftclaw2AI(pCreature);
	}

	enum eData
	{
		// Data
		NPC_SWIFTCLAW_2 = 38002,
		SPELL_RAPTOR_ROPE = 70927,
		SAY_SWIFTCLAW_1	  = 0,
	};
	struct npc_swiftclaw2AI : public ScriptedAI
	{
		npc_swiftclaw2AI(Creature* pCreature) : ScriptedAI(pCreature) { }

		void SpellHit(Unit* hitter, const SpellInfo* spell)
		{
			if (!hitter || !spell)
				return;

			if (spell->Id != SPELL_RAPTOR_ROPE)
				return;
			hitter->SummonCreature(NPC_SWIFTCLAW_2, hitter->GetPositionX(), hitter->GetPositionY(), hitter->GetPositionZ(), 0, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 100000);
			Talk(SAY_SWIFTCLAW_1); /// Swiftclaw isn't stopping. Steer him...
			me->DespawnOrUnsummon();

		}

	};
};



/// **************************** Durotar Scripts **************************** ///
enum eDurotar
{
	/// Misc
	AREA_HORDE_374 = 374,
	AREA_ALLIANCE_4411 = 4411,

	/// Actions
	ACTION_CREATE_NAZGRIM = 1000,
	ACTION_CREATE_VANGUARD = 1001,
	ACTION_IS_SHIP_VISIBLE_ALLOWED = 1003,
	ACTION_START_ANIM_01,
	ACTION_START_ANIM_02,
	ACTION_START_WALK_01,

	/// Events
	EVENT_SET_ACTIVE_TO_FALSE = 101,
	EVENT_START_ANIM,
	EVENT_START_ANIM_01,
	EVENT_START_ANIM_03,
	EVENT_START_WALK_01,
	EVENT_START_WALK_02,
	EVENT_START_WALK_03,
	EVENT_START_WALK_04,
	EVENT_TALK_PART_00,
	EVENT_TALK_PART_01,
	EVENT_TALK_PART_02,
	EVENT_TALK_PART_03,
	EVENT_TALK_PART_04,
	EVENT_TALK_PART_05,
	EVENT_TALK_PART_06,
	EVENT_TALK_PART_07,
	EVENT_TALK_PART_08,
	EVENT_TALK_PART_09,
	EVENT_TALK_PART_10,
	EVENT_TALK_PART_11,
	EVENT_TALK_PART_12,
	EVENT_TALK_PART_13,
	EVENT_TALK_PART_14,
	EVENT_TALK_PART_15,
	EVENT_TALK_PART_16,
	EVENT_TALK_PART_17,
	EVENT_TALK_PART_18,
	EVENT_TALK_PART_19,
	EVENT_TALK_PART_20,
	EVENT_TALK_PART_21,


	/// Gameobjects
	GO_SHIP_TO_VASHJIR_197195 = 197195,
	GO_SHIP_TO_VASHJIR_203466 = 203466,

	/// Npcs
	NPC_CAPTAIN_TAYLOR = 42103,
	NPC_STORMWIND_SOLDIER = 99980,
	NPC_STORMWIND_SOLDIER_42021 = 42021,
	NPC_STORMWIND_SOLDIER_42022 = 42022,
	NPC_STORMWIND_RECRUIT_42059 = 42059,
	NPC_STORMWIND_RECRUIT_42095 = 42095,
	NPC_STORMWIND_RECRUIT_42096 = 42096,
	NPC_HELLSCREAMS_VANGUARD = 43090,
	NPC_LEGIONNAIRE_NAZGRIM = 43100,
	NPC_SHIP_TO_VASHJIR_PHASE_CASTER_BUNNY_40559 = 40559,
	NPC_TOTALLY_GENERIC_BUNNY_PHASE_2 = 43091,

	/// Spells
	SPELL_QUEST_GENERIC_ZONE_SPECIFIC_02 = 59074,
	SPELL_QUEST_ZONE_SPECIFIC_02 = 78644,

	/// Quests
	QUEST_CALL_OF_DUTY_HORDE = 25924,
	QUEST_CALL_OF_DUTY_ALLIANCE = 14482,
};

enum eNpcVanGuard // List of database guids of all creature involved bridge/ship to vashjir : Horde
{ // No creatures exist on ship only on Durotar Bridge - need to check guids, missing spawns, etc...
	eVanGuardAA = 999990,
	eVanGuardAB = 999991,
	eVanGuardBA = 999992,
	eVanGuardBB = 999993,
	eVanGuardBC = 999994,
	eVanGuardCA = 999995,
	eVanGuardCB = 999996,
	eVanGuardDA = 999997,
	eVanGuardNaz = 999998, // Nazgrim? Either 205141 (Ship) or 205148 (Durotar Bridge)
};


enum LazyPeonYells
{
	SAY_SPELL_HIT = -1000600 // Ow! OK, I''ll get back to work, $n!'
};

enum LazyPeon
{
	QUEST_LAZY_PEONS = 25134,
	GO_LUMBERPILE = 175784,
	SPELL_BUFF_SLEEP = 17743,
	SPELL_AWAKEN_PEON = 19938
};

class npc_lazy_peon : public CreatureScript
{
public:
	npc_lazy_peon() : CreatureScript("npc_lazy_peon") { }

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_lazy_peonAI(creature);
	}

	struct npc_lazy_peonAI : public ScriptedAI
	{
		npc_lazy_peonAI(Creature* creature) : ScriptedAI(creature) {}

		uint64 PlayerGUID;

		uint32 RebuffTimer;
		bool work;

		void Reset()
		{
			PlayerGUID = 0;
			RebuffTimer = 0;
			work = false;
		}

		void MovementInform(uint32 /*type*/, uint32 id)
		{
			if (id == 1)
				work = true;
		}

		void SpellHit(Unit* caster, const SpellInfo* spell)
		{
			if (spell->Id == SPELL_AWAKEN_PEON && caster->IsPlayer()
				&& CAST_PLR(caster)->GetQuestStatus(QUEST_LAZY_PEONS) == QUEST_STATUS_INCOMPLETE)
			{
				caster->ToPlayer()->KilledMonsterCredit(me->GetEntry(), me->GetGUID());
				DoScriptText(SAY_SPELL_HIT, me, caster);
				me->RemoveAllAuras();
				if (GameObject* Lumberpile = me->FindNearestGameObject(GO_LUMBERPILE, 20))
					me->GetMotionMaster()->MovePoint(1, Lumberpile->GetPositionX() - 1, Lumberpile->GetPositionY(), Lumberpile->GetPositionZ());
			}
		}

		void UpdateAI(const uint32 Diff)
		{
			if (work == true)
				me->HandleEmoteCommand(EMOTE_ONESHOT_WORK_CHOPWOOD);
			if (RebuffTimer <= Diff)
			{
				DoCast(me, SPELL_BUFF_SLEEP);
				RebuffTimer = 300000; //Rebuff agian in 5 minutes
			}
			else
				RebuffTimer -= Diff;
			if (!UpdateVictim())
				return;
			DoMeleeAttackIfReady();
		}
	};
};

/// Shin Stonepillar - 39380
class npc_shin_stonepillar_39380 : public CreatureScript
{
public:
	npc_shin_stonepillar_39380() : CreatureScript("npc_shin_stonepillar_39380") { }

	enum eNPC
	{
		/// Quest
		QUEST_THE_KODO_AND_THE_WOLF = 25205,

		/// Misc
		PLAYER_GUID = 99999,
		
		/// Spells
		SPELL_SUMMON_THE_WOLF = 73840,
		SPELL_QUEST_INVIS_KODO_AND_THE_WOLF = 73919,
		SPELL_SEE_QUEST_INVIS_01 = 73426,

	};

	bool OnGossipHello(Player* player, Creature* creature) override
	{
		if (player->GetQuestStatus(QUEST_THE_KODO_AND_THE_WOLF) == QUEST_STATUS_INCOMPLETE)
		{
			player->PrepareQuestMenu(creature->GetGUID());
			player->ADD_GOSSIP_ITEM_DB(11209, 0, GOSSIP_SENDER_MAIN, 1001);
			player->SEND_GOSSIP_MENU(11209, creature->GetGUID());
			return true;
		}
		player->SEND_GOSSIP_MENU(11209, creature->GetGUID());
		return true;
	}

	bool OnGossipSelect(Player* player, Creature* creature, uint32 sender, uint32 action) override
	{
		if (action == 1001)
		{
			player->CastSpell(player, SPELL_SUMMON_THE_WOLF);
			player->CastSpell(player, SPELL_SEE_QUEST_INVIS_01);
			player->CLOSE_GOSSIP_MENU();
			return true;
		}

		return false;
	}
};

/// The Wolf - 39364
class npc_the_wolf_39364 : public CreatureScript
{
public:
	npc_the_wolf_39364() : CreatureScript("npc_the_wolf_39364") { }

	enum eNPC
	{
		NPC_SHIN_STONEPILLAR = 39380,
		NPC_KODO = 39365,
		SPELL_HUNTING = 73841,
		SPELL_STUN_WOLF = 73866,
		SPELL_RUMBLING_HOOVES = 73868,
		SPELL_PLAYER_SWITCHES_SEATS = 82959,
		SPELL_PERMANENT_FEIGN_DEATH = 29266,
		SPELL_QUEST_INVIS_KODO_AND_THE_WOLF = 73919,
		SPELL_SEE_QUEST_INVIS_01 = 73426,
		PHASE_START_TO_EAST = 0,
		PHASE_SEARCHING_FOR_KODO,
		PHASE_WAITING_FOR_EAT,
		EVENT_CHECK_POSITION,
		EVENT_CHECK_KODOS,
		EVENT_TALK_SEARCHING,
		EVENT_KODOS_FIGHTING,
		EVENT_TRY_EAT_KODO,
	};

	struct npc_the_wolf_39364_AI : public VehicleAI
	{
		npc_the_wolf_39364_AI(Creature* creature) : VehicleAI(creature) { }

		EventMap m_events;
		uint64   m_playerGUID;
		uint64   m_shinGUID;
		uint64   m_kodo1GUID, m_kodo2GUID;
		uint8    m_phase;

		void Reset() override
		{
			m_events.Reset();
			m_events.ScheduleEvent(EVENT_CHECK_POSITION, 1000);
			m_phase = PHASE_START_TO_EAST;
			m_playerGUID = NULL;
			m_shinGUID = NULL;
			m_kodo1GUID = NULL;
			m_kodo2GUID = NULL;
			FindShinStonepillar();
		}

		void IsSummonedBy(Unit* summoner) override
		{
			if (Player* player = summoner->ToPlayer())
				m_playerGUID = player->GetGUID();
		}

		void PassengerBoarded(Unit* passenger, int8 /*seatId*/, bool apply) override
		{
			if (Player* player = passenger->ToPlayer())
				if (apply)
					m_playerGUID = player->GetGUID();
				else
					m_playerGUID = NULL;

			FindShinStonepillar();
		}

		void UpdateAI(uint32 diff) override
		{
			m_events.Update(diff);

			while (uint32 eventId = m_events.ExecuteEvent())
			{
				switch (eventId)
				{
				case EVENT_CHECK_POSITION:
				{
					switch (m_phase)
					{
					case PHASE_START_TO_EAST:
					{
						if (Creature* shin = sObjectAccessor->GetCreature(*me, m_shinGUID))
							if (shin->GetDistance2d(me) < 10.0f)
								m_phase = PHASE_START_TO_EAST;
							else
							{
								if (Player* player = sObjectAccessor->GetPlayer(*me, m_playerGUID))
									Talk(0, m_playerGUID);

								m_phase = PHASE_SEARCHING_FOR_KODO;
								me->AddAura(SPELL_HUNTING, me);
								m_events.ScheduleEvent(EVENT_TALK_SEARCHING, urand(5000, 7000));
								m_events.ScheduleEvent(EVENT_CHECK_KODOS, 1000);
							}
						break;
					}
					case PHASE_SEARCHING_FOR_KODO:
					{
						if (Creature* shin = sObjectAccessor->GetCreature(*me, m_shinGUID))
							if (shin->GetDistance2d(me) < 10.0f)
								m_phase = PHASE_START_TO_EAST;

						if (Creature* kodo = sObjectAccessor->GetCreature(*me, m_kodo1GUID))
							if (kodo->GetDistance2d(me) < 20)
							{
								m_phase = PHASE_WAITING_FOR_EAT;
								m_events.Reset();
								m_events.ScheduleEvent(EVENT_TRY_EAT_KODO, 100);
								return;
							}
						break;
					}
					}
					m_events.ScheduleEvent(EVENT_CHECK_POSITION, 1000);
					break;
				}
				case EVENT_TALK_SEARCHING:
				{
					if (Player* player = sObjectAccessor->GetPlayer(*me, m_playerGUID))
						Talk(4, m_playerGUID);
					m_events.ScheduleEvent(EVENT_TALK_SEARCHING, urand(5000, 7000));
					break;
				}
				case EVENT_CHECK_KODOS:
				{
					if (!m_kodo1GUID || !m_kodo2GUID)
					{
						std::list<Creature*> kodos;
						me->GetCreatureListWithEntryInGrid(kodos, NPC_KODO, 100.0f);

						if (kodos.size() == 2)
						{
							std::list<Creature*>::iterator itr = kodos.begin();
							m_kodo1GUID = (*itr)->GetGUID();
							itr++;
							m_kodo2GUID = (*itr)->GetGUID();
						}
						m_events.ScheduleEvent(EVENT_CHECK_KODOS, 1000);
					}
					else
						m_events.ScheduleEvent(EVENT_KODOS_FIGHTING, urand(2000, 4000));

					break;
				}
				case EVENT_KODOS_FIGHTING:
				{
					if (Creature* kodo1 = sObjectAccessor->GetCreature(*me, m_kodo1GUID))
						if (Creature* kodo2 = sObjectAccessor->GetCreature(*me, m_kodo2GUID))
						{
							kodo1->HandleEmoteCommand(EMOTE_ONESHOT_ATTACK_UNARMED);
							kodo2->HandleEmoteCommand(EMOTE_ONESHOT_WOUND);
						}

					m_events.ScheduleEvent(EVENT_KODOS_FIGHTING, urand(2000, 4000));
					break;
				}
				case EVENT_TRY_EAT_KODO:
				{
					if (Player* player = sObjectAccessor->GetPlayer(*me, m_playerGUID))
						Talk(1, m_playerGUID);
					me->SetControlled(true, UNIT_STATE_ROOT);
					me->GetMotionMaster()->Clear();
					m_events.ScheduleEvent(EVENT_TRY_EAT_KODO + 1, 2000);
					break;
				}
				case EVENT_TRY_EAT_KODO + 1:
				{
					if (Creature* kodo1 = sObjectAccessor->GetCreature(*me, m_kodo1GUID))
						kodo1->HandleEmoteCommand(EMOTE_ONESHOT_SPELL_CAST);
					if (Creature* kodo2 = sObjectAccessor->GetCreature(*me, m_kodo2GUID))
						kodo2->HandleEmoteCommand(EMOTE_ONESHOT_WOUND_CRITICAL);

					m_events.ScheduleEvent(EVENT_TRY_EAT_KODO + 2, 4000);
					break;
				}
				case EVENT_TRY_EAT_KODO + 2:
				{
					if (Creature* kodo1 = sObjectAccessor->GetCreature(*me, m_kodo1GUID))
						if (Creature* kodo2 = sObjectAccessor->GetCreature(*me, m_kodo2GUID))
						{
							kodo1->HandleEmoteCommand(EMOTE_ONESHOT_SPELL_CAST);
							kodo1->Kill(kodo2);
						}

					if (Player* player = sObjectAccessor->GetPlayer(*me, m_playerGUID))
						Talk(2, m_playerGUID);

					m_events.ScheduleEvent(EVENT_TRY_EAT_KODO + 3, 2000);
					break;
				}
				case EVENT_TRY_EAT_KODO + 3:
				{
					Position pos;
					if (Creature* kodo = sObjectAccessor->GetCreature(*me, m_kodo2GUID))
					{
						Position l_Pos;
						kodo->GetNearPosition(l_Pos, 3.0f, kodo->GetAngle(me));

						me->SetSpeed(MOVE_WALK, 0.7f, true);
						me->GetMotionMaster()->MovePoint(1234, l_Pos);
					}

					m_events.ScheduleEvent(EVENT_TRY_EAT_KODO + 4, 4000);
					break;
				}
				case EVENT_TRY_EAT_KODO + 4:
				{
					m_events.Reset();
					if (Player* player = sObjectAccessor->GetPlayer(*me, m_playerGUID))
						Talk(3, m_playerGUID);

					if (Creature* kodo = sObjectAccessor->GetCreature(*me, m_kodo1GUID))
					{
						kodo->CastSpell(me, SPELL_STUN_WOLF);
						me->SetFlag(UNIT_FIELD_FLAGS_2, UNIT_FLAG2_DISABLE_TURN);
						kodo->CastSpell(me->GetPositionX(), me->GetPositionY(), me->GetPositionZ(), SPELL_RUMBLING_HOOVES, true);
						kodo->CastSpell(me, SPELL_PLAYER_SWITCHES_SEATS, true);
					}

					m_events.ScheduleEvent(EVENT_TRY_EAT_KODO + 5, 3000);
					break;
				}
				case EVENT_TRY_EAT_KODO + 5:
				{
					if (Player* player = sObjectAccessor->GetPlayer(*me, m_playerGUID))
						player->KilledMonsterCredit(NPC_KODO);

					m_events.ScheduleEvent(EVENT_TRY_EAT_KODO + 6, 6000);
					break;
				}
				case EVENT_TRY_EAT_KODO + 6:
				{
					me->DespawnOrUnsummon(200);

					if (Player* player = sObjectAccessor->GetPlayer(*me, m_playerGUID))
					{
						player->RemoveAura(SPELL_SEE_QUEST_INVIS_01);
						player->NearTeleportTo(1287.98f, -4336.36f, 34.0345f, 3.176133f);
					}
					break;
				}
				}
			}
		}

		void FindShinStonepillar()
		{
			if (m_shinGUID)
				return;

			if (Creature* shin = me->FindNearestCreature(NPC_SHIN_STONEPILLAR, 10.0f))
				m_shinGUID = shin->GetGUID();
		}
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_the_wolf_39364_AI(creature);
	}
};

/// The Kodo - 39365
class npc_the_kodo_39365 : public CreatureScript
{
public:
	npc_the_kodo_39365() : CreatureScript("npc_the_kodo_39365") { }

	enum eNPC
	{
		SPELL_QUEST_INVIS_KODO_AND_THE_WOLF = 73919,
	};

	struct npc_the_kodo_39365AI : public ScriptedAI
	{
		npc_the_kodo_39365AI(Creature* creature) : ScriptedAI(creature) {}

		void Reset() override
		{
			me->AddAura(SPELL_QUEST_INVIS_KODO_AND_THE_WOLF, me);
		}
	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_the_kodo_39365AI(creature);
	}
};


/// Drowned Thunder Lizard - 39464
class npc_drowned_thunder_lizard_39464 : public CreatureScript
{
public:
	npc_drowned_thunder_lizard_39464() : CreatureScript("npc_drowned_thunder_lizard_39464") { }

	enum eQuest
	{
		QUEST_THUNDER_DOWN_UNDER = 25236,
		NPC_THUNDER_LIZARD = 39464,
		NPC_HULKING_ORCISH_LABORER = 39465,
		SPELL_ATTACH_TETHER = 73945,
		SPELL_LIFT_DROWNED_THUNDER_LIZARD_TARGET = 73950,
		SPELL_LIFT_DROWNED_THUNDER_LIZARD = 73951,
		SPELL_LIGHTNING_DISCHARGE = 73958,
		EVENT_WAIT_ON_HULK = 101,
		EVENT_LIGHTNING_DISCHARGE,
		EVENT_LIFT_DROWNED_THUNDER_LIZARD_TARGET1,
		EVENT_LIFT_DROWNED_THUNDER_LIZARD_TARGET2,
		EVENT_RESET_FOR_HULK,
	};

	struct npc_drowned_thunder_lizard_39464AI : public ScriptedAI
	{
		npc_drowned_thunder_lizard_39464AI(Creature* creature) : ScriptedAI(creature) { Initialize(); }

		EventMap m_events;
		uint64   m_hulkGUID;
		uint64   m_playerGUID;
		bool m_isWorking;
		std::list<Position> m_hulkList;


		/// Positions for the orcs
		Position const Pos1 = { 761.681519f, -4114.352539f, 27.533762f, 1.669859f };
		Position const Pos2 = { 789.240173f, -4105.788574f, 26.680470f, 1.956528f };
		Position const Pos3 = { 843.065918f, -4059.360596f, 27.911030f, 2.596630f };
		Position const Pos4 = { 769.185669f, -4030.059082f, 26.620789f, 4.336287f };
		Position const Pos5 = { 868.856018f, -4027.161377f, 32.579823f, 3.539107f };
		Position const Pos6 = { 885.622131f, -4024.350342f, 33.658619f, 6.154483f };
		Position const Pos7 = { 921.469360f, -4034.692871f, 36.609566f, 0.256142f };
		Position const Pos8 = { 961.751343f, -4070.507324f, 23.249489f, 2.918641f };
		Position const Pos9 = { 945.061340f, -4078.592041f, 27.331806f, 0.558519f };
		Position const Pos10 = { 941.900757f, -4121.144043f, 23.914780f, 5.867807f };
		Position const Pos11 = { 899.980408f, -4170.012207f, 24.881603f, 1.709126f };
		Position const Pos12 = { 965.486877f, -4204.474121f, 22.279196f, 3.095355f };
		Position const Pos13 = { 940.573730f, -4231.450195f, 20.181242f, 5.592918f };
		Position const Pos14 = { 905.344482f, -4176.950195f, 26.277588f, 0.307187f };
		Position const Pos15 = { 972.444702f, -4222.325684f, 22.747892f, 3.550868f };
		Position const Pos16 = { 801.102844f, -4089.484619f, 25.795090f, 4.882112f };
		Position const Pos17 = { 810.994995f, -4087.808594f, 25.023535f, 5.612078f };
		Position const Pos18 = { 829.534973f, -4022.998779f, 20.646587f, 4.626402f };

		void Initialize()
		{
			m_hulkGUID = NULL;
			m_playerGUID = NULL;
			FillHulkPositionList();
		}

		void Reset() override
		{
			m_events.Reset();
			m_events.ScheduleEvent(EVENT_LIGHTNING_DISCHARGE, urand(20000, 60000));
			m_isWorking = false;
		}

		void OnSpellClick(Unit* clicker) override
		{
			if (!m_isWorking)
				if (Player* player = clicker->ToPlayer())
					if (player->GetQuestStatus(QUEST_THUNDER_DOWN_UNDER) == QUEST_STATUS_INCOMPLETE)
					{
						m_isWorking = true;
						m_playerGUID = player->GetGUID();
						m_events.ScheduleEvent(EVENT_WAIT_ON_HULK, 250);
						m_events.ScheduleEvent(EVENT_RESET_FOR_HULK, 10000);
					}
		}

		void UpdateAI(uint32 diff) override
		{
			m_events.Update(diff);

			while (uint32 eventId = m_events.ExecuteEvent())
			{
				switch (eventId)
				{
				case EVENT_LIGHTNING_DISCHARGE:
				{
					me->CastSpell(me, SPELL_LIGHTNING_DISCHARGE);
					m_events.ScheduleEvent(EVENT_LIGHTNING_DISCHARGE, urand(30000, 60000));
					break;
				}
				case EVENT_WAIT_ON_HULK:
				{
					if (Creature* hulk = me->FindNearestCreature(NPC_HULKING_ORCISH_LABORER, 15.0f))
					{
						m_hulkGUID = hulk->GetGUID();
						Position pos;
						hulk->GetPosition(&pos);
						FindBestHulkPosition(pos);
						hulk->NearTeleportTo(pos.m_positionX, pos.m_positionY, pos.m_positionZ, pos.m_orientation, true);
						m_events.ScheduleEvent(EVENT_LIFT_DROWNED_THUNDER_LIZARD_TARGET1, 25);
					}
					else
						m_events.ScheduleEvent(EVENT_WAIT_ON_HULK, 100);

					break;
				}
				case EVENT_LIFT_DROWNED_THUNDER_LIZARD_TARGET1:
				{
					if (Player* player = sObjectAccessor->GetPlayer(*me, m_playerGUID))
						if (Creature* hulk = sObjectAccessor->GetCreature(*me, m_hulkGUID))
						{
							hulk->CastSpell(me, SPELL_LIFT_DROWNED_THUNDER_LIZARD, true);
							hulk->CastSpell(hulk, SPELL_LIFT_DROWNED_THUNDER_LIZARD_TARGET, true);
						}

					m_events.ScheduleEvent(EVENT_LIFT_DROWNED_THUNDER_LIZARD_TARGET2, 2000);
					break;
				}
				case EVENT_LIFT_DROWNED_THUNDER_LIZARD_TARGET2:
				{
					if (Player* player = sObjectAccessor->GetPlayer(*me, m_playerGUID))
						if (Creature* hulk = sObjectAccessor->GetCreature(*me, m_hulkGUID))
						{
							Position pos;
							me->GetPosition(&pos);
							pos.m_positionZ = 12.0f;
							me->SetCanFly(true);
							me->SetDisableGravity(true);
							me->SetByteValue(UNIT_FIELD_ANIM_TIER, 3, UNIT_BYTE1_FLAG_ALWAYS_STAND | UNIT_BYTE1_FLAG_HOVER);
							me->SetSpeed(MOVE_RUN, 0.15f, true);
							me->GetMotionMaster()->MoveTakeoff(101, pos);
							me->DespawnOrUnsummon(10000);
							hulk->DespawnOrUnsummon(10000);
						}
					break;
				}
				case EVENT_RESET_FOR_HULK:
				{
					Reset();
					break;
				}
				}
			}
		}

		Position FindBestHulkPosition(Position pos)
		{
			float dist = 500.0f;
			Position newPos;
			for (std::list<Position>::iterator itr = m_hulkList.begin(); itr != m_hulkList.end(); ++itr)
			{
				Position p = (*itr);
				float d = p.GetExactDist2d(pos.m_positionX, pos.m_positionY);
				if (d < dist)
				{
					dist = d;
					newPos = p;
				}
			}
			return newPos;
		}

		void FillHulkPositionList()
		{
			m_hulkList.clear();
			m_hulkList.push_back(Pos1);
			m_hulkList.push_back(Pos2);
			m_hulkList.push_back(Pos3);
			m_hulkList.push_back(Pos4);
			m_hulkList.push_back(Pos5);
			m_hulkList.push_back(Pos6);
			m_hulkList.push_back(Pos7);
			m_hulkList.push_back(Pos8);
			m_hulkList.push_back(Pos9);
			m_hulkList.push_back(Pos10);
			m_hulkList.push_back(Pos11);
			m_hulkList.push_back(Pos12);
			m_hulkList.push_back(Pos13);
			m_hulkList.push_back(Pos14);
			m_hulkList.push_back(Pos15);
			m_hulkList.push_back(Pos16);
			m_hulkList.push_back(Pos17);
			m_hulkList.push_back(Pos18);
		}
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_drowned_thunder_lizard_39464AI(creature);
	}
};


/// Commander Thorak - 41621
class npc_commander_thorak_41621 : public CreatureScript
{
public:
	npc_commander_thorak_41621() : CreatureScript("npc_commander_thorak_41621") { }

	bool OnQuestAccept(Player* player, Creature* /*creature*/, Quest const* quest) override
	{
		switch (quest->GetQuestId())
		{
		case QUEST_CALL_OF_DUTY_HORDE:
			player->CastSpell(player, SPELL_QUEST_GENERIC_ZONE_SPECIFIC_02, true);
			break;
		}
		return false;
	}
};

/// ************************** [Start] Quest: Call of Duty ************************** ///

/* 32520 bunny (!!! ally & horde !!!), as commander outside ship, check for player near and active quest...
first starting the animation on bridge... then let guards go upto ship. there spawns new version of them and at last, the AI of each ship is started, to do furter communication */
class npc_totally_generic_bunny_all_phase_32520 : public CreatureScript
{
public:
	npc_totally_generic_bunny_all_phase_32520() : CreatureScript("npc_totally_generic_bunny_all_phase_32520") { }

	struct npc_totally_generic_bunny_all_phase_32520AI : public ScriptedAI
	{
		npc_totally_generic_bunny_all_phase_32520AI(Creature* creature) : ScriptedAI(creature) { Initialize(); }

		EventMap m_events;
		bool     m_playerNearFlag;
		uint32   m_areaId;
		uint64   m_vashjirShipGUID;
		uint32   m_lastShipEventId;
		uint32   m_animState;                   // 0=not started 1=started 2=talk started 3=nazgrim anim 4=ship boarding 5=map1 6=map0
		uint64   m_commanderGUID;
		std::map<uint32, uint64> m_guardsGUID;  // dbGuid, GUID 

		void Initialize()
		{
			m_playerNearFlag = false;
			m_vashjirShipGUID = 0;
			m_areaId = 0;
			m_lastShipEventId = 0;
			m_animState = 0;
			m_commanderGUID = 0;
		}

		void Reset() override
		{
			switch (me->GetAreaId())
			{
			case AREA_ALLIANCE_4411:
			case AREA_HORDE_374:
				if (abs(me->GetPositionZ() - 30.00427f) < 1.0f)
					m_areaId = me->GetAreaId();
				break;
			}
		}

		void MoveInLineOfSight(Unit* who) override
		{
			if (Player* player = who->ToPlayer())
				if (m_areaId == AREA_ALLIANCE_4411 || m_areaId == AREA_HORDE_374)
				{
					me->setActive(true);
					m_events.RescheduleEvent(EVENT_SET_ACTIVE_TO_FALSE, 10 * MINUTE * 1000);
				}

			if (!m_vashjirShipGUID || m_commanderGUID || m_guardsGUID.size() < 8)
				FindAllMembersWorldwide();
		}

		uint32 GetData(uint32 id = 0) override
		{
			switch (id)
			{
			case ACTION_IS_SHIP_VISIBLE_ALLOWED:
			{
				bool _ok = PlayerWithActiveQuestIsNear();
				if (m_commanderGUID == 0)
					_ok = false;
				if (m_guardsGUID.size() < 8)
					_ok = false;
				if (m_areaId == AREA_HORDE_374 && m_animState < 2)
					_ok = false;
				else if (m_areaId == AREA_ALLIANCE_4411 && m_animState < 12)
					_ok = false;

				return (uint32)(_ok);
			}
			case 1:
				return m_lastShipEventId;
			case 2:
				return m_animState;
			}
			return 0;
		}

		void DoAction(int32 param) override
		{
			if (param > 22500 && param < 27000)
				m_lastShipEventId = param;

			if (m_areaId == AREA_HORDE_374)
				HandleDoActionHorde(param);
			else if (m_areaId == AREA_ALLIANCE_4411)
				HandleDoActionAlliance(param);
		}

		void UpdateAI(uint32 diff) override
		{
			m_events.Update(diff);

			while (uint32 eventId = m_events.ExecuteEvent())
			{
				if (m_areaId == AREA_HORDE_374)
					HandleUpdateAIHorde(eventId);
				else if (m_areaId == AREA_ALLIANCE_4411)
					HandleUpdateAIAlliance(eventId);

				switch (eventId)
				{
				case EVENT_SET_ACTIVE_TO_FALSE:
					if (PlayerWithActiveQuestIsNear())
					{
						me->setActive(true);
						m_events.RescheduleEvent(EVENT_SET_ACTIVE_TO_FALSE, 10 * MINUTE * 1000);
					}
					else
						me->setActive(false);
					break;
				}
			}

			if (!UpdateVictim())
				return;
			else
				DoMeleeAttackIfReady();
		}

		bool PlayerWithActiveQuestIsNear() const
		{
			std::list<Player*> pList;
			me->GetPlayerListInGrid(pList, 100.0f);
			for (auto player : pList)
			{
				Position pos;
				player->GetPosition(&pos);
				if (pos.GetExactDist(me) < 100.0f)
					if (m_areaId == AREA_HORDE_374 && player->GetQuestStatus(QUEST_CALL_OF_DUTY_HORDE) == QUEST_STATUS_INCOMPLETE)
						return true;
					else if (m_areaId == AREA_ALLIANCE_4411 && player->GetQuestStatus(QUEST_CALL_OF_DUTY_ALLIANCE) == QUEST_STATUS_INCOMPLETE)
						return true;
			}
			return false;
		}

		GameObject* FindGameObjectWorldwide(uint32 entry)
		{
			TRINITY_READ_GUARD(HashMapHolder<GameObject>::LockType, *HashMapHolder<GameObject>::GetLock());
			HashMapHolder<GameObject>::MapType const& m = ObjectAccessor::GetGameObjects();
			for (HashMapHolder<GameObject>::MapType::const_iterator iter = m.begin(); iter != m.end(); ++iter)
				if (GameObject* ship = iter->second->ToGameObject())
					if (ship->IsInWorld())
						if (ship->GetEntry() == entry)
							return ship;

			return nullptr;
		}

		void FindAllMembersWorldwide()
		{
			if (m_areaId == AREA_HORDE_374)
			{
				if (!m_vashjirShipGUID)
					if (GameObject* ship = FindGameObjectWorldwide(GO_SHIP_TO_VASHJIR_203466))
					{
						m_vashjirShipGUID = ship->GetGUID();
						ship->AI()->SetGUID(me->GetGUID(), me->GetEntry());
					}
				if (!m_commanderGUID || m_guardsGUID.size() < 8)
				{
					std::list<Creature*> cList;
					m_guardsGUID.clear();
					m_commanderGUID = 0;

					if (m_areaId == AREA_HORDE_374)
					{
						cList = me->FindAllCreaturesInRange(75.0f);
						for (auto npc : cList)
							switch (npc->GetEntry())
							{
							case NPC_HELLSCREAMS_VANGUARD:
								m_guardsGUID.insert(std::pair<uint32, uint64>(npc->GetDBTableGUIDLow(), npc->GetGUID())); // npc->AI()->GetData(NPC_HELLSCREAMS_VANGUARD)
								break;
							case NPC_LEGIONNAIRE_NAZGRIM:
								m_commanderGUID = npc->GetGUID();
								break;
							}
					}
				}
			}
			else if (m_areaId == AREA_ALLIANCE_4411)
			{
				if (!m_vashjirShipGUID)
					if (GameObject* ship = FindGameObjectWorldwide(GO_SHIP_TO_VASHJIR_197195))
					{
						m_vashjirShipGUID = ship->GetGUID();
						ship->AI()->SetGUID(me->GetGUID(), me->GetEntry());
					}
				if (!m_commanderGUID || m_guardsGUID.size() < 8)
				{
					std::list<Creature*> cList;
					m_guardsGUID.clear();
					m_commanderGUID = 0;

					cList = me->FindAllCreaturesInRange(75.0f);
					for (auto npc : cList)
						switch (npc->GetEntry())
						{
						case NPC_STORMWIND_SOLDIER_42021:
						case NPC_STORMWIND_SOLDIER_42022:
						case NPC_STORMWIND_RECRUIT_42059:
						case NPC_STORMWIND_RECRUIT_42095:
						case NPC_STORMWIND_RECRUIT_42096:
							m_guardsGUID.insert(std::pair<uint32, uint64>(npc->GetDBTableGUIDLow(), npc->GetGUID())); // npc->AI()->GetData(NPC_STORMWIND_SOLDIER)
							break;
						case NPC_CAPTAIN_TAYLOR:
							m_commanderGUID = npc->GetGUID();
							break;
						}
				}
			}
		}

		Creature* GetStoredCreature(uint32 dbGuid)
		{
			if (m_guardsGUID.find(dbGuid) == m_guardsGUID.end())
				return nullptr;

			if (uint64 guid = m_guardsGUID[dbGuid])
				if (Creature* npc = sObjectAccessor->GetCreature(*me, guid))
					return npc;

			return nullptr;
		}

		/* Horde */

		void TryStartAnimHorde()
		{

			FindAllMembersWorldwide();

			if (m_animState != 0)
				return;

			if (!PlayerWithActiveQuestIsNear())
				return;

			if (m_guardsGUID.size() < 8)
				return;

			if (!m_commanderGUID)
				return;

			switch (m_lastShipEventId)
			{
			case 25489:
			case 25448:
			case 25428:
				m_animState = 1; // we can start the anim on next ship event
				m_events.ScheduleEvent(EVENT_START_ANIM, 1000);
				break;
			default:
				return;
			}
		}

		void HandleDoActionHorde(int32 param)
		{
			TryStartAnimHorde();

			switch (param) //Part: Horde ship eventIds
			{
			case 25448:
				break;
			case 25428:
				break;
			case 26605: // ship teleport to map 1
				if (m_animState == 1)
				{
					m_animState = 2;
					m_events.ScheduleEvent(EVENT_START_ANIM_01, 30000);
				}
				else
					m_animState = 0;
				break;
			case 25447: // inside curve, before bridge                
				break;
			case 25445: // arrive bridge
				if (m_animState == 3)
				{
					if (Creature* npc = sObjectAccessor->GetCreature(*me, m_commanderGUID))
					{
						npc->AI()->SetGUID(m_vashjirShipGUID, GO_SHIP_TO_VASHJIR_203466);
						npc->AI()->DoAction(ACTION_START_ANIM_02);
						m_animState = 4;
					}
					for (auto guid : m_guardsGUID)
						if (Creature* npc = sObjectAccessor->GetCreature(*me, guid.second))
						{
							npc->AI()->SetGUID(m_vashjirShipGUID, GO_SHIP_TO_VASHJIR_203466);
							npc->AI()->DoAction(ACTION_START_WALK_01);
						}
				}
				break;
			case 26515: // departure horde bridge.. now ship are the commander
				if (m_animState == 4)
				{
					m_animState = 5;
				}
				break;
			case 25467:
				break;
			case 25446:
				break;
			case 25452: // teleport to map 0
			{
				if (m_animState == 5)
				{
					if (Creature* npc = sObjectAccessor->GetCreature(*me, m_commanderGUID))
						if (npc->isDead())
							npc->Respawn(true);
					for (auto guid : m_guardsGUID)
						if (Creature* npc = sObjectAccessor->GetCreature(*me, guid.second))
							if (npc->isDead())
								npc->Respawn(true);
				}
				m_animState = 0;
				break;
			}
			}
		}

		void HandleUpdateAIHorde(uint32 eventId)
		{
			switch (eventId)
			{
			case EVENT_START_ANIM_01:
			{
				if (Creature* nazgrim = sObjectAccessor->GetCreature(*me, m_commanderGUID))
				{
					m_animState = 3;
					nazgrim->AI()->SetGUID(m_vashjirShipGUID, GO_SHIP_TO_VASHJIR_203466);
					nazgrim->AI()->DoAction(ACTION_START_ANIM_01);
				}
				break;
			}
			}

			switch (m_animState)
			{
			case 1:
			case 2:  // m_animState = 1 + 2 = talk started
				HordeAnimation_smalltalk(eventId);
				break;
			}
		}

		void HordeAnimation_smalltalk(uint32 eventId)
		{
			switch (eventId)
			{
			case EVENT_START_ANIM: // smalltalk between soldier
			{
				if (Creature* npc = GetStoredCreature(eVanGuardCA))
					npc->AI()->Talk(1);

				m_events.ScheduleEvent(EVENT_TALK_PART_00, 8000);
				break;
			}
			case EVENT_TALK_PART_00:
			{
				if (Creature* npc = GetStoredCreature(eVanGuardCA))
					npc->AI()->Talk(2);

				m_events.ScheduleEvent(EVENT_TALK_PART_01, 9000);
				break;
			}
			case EVENT_TALK_PART_01:
			{
				if (Creature* npc = GetStoredCreature(eVanGuardCB))
					npc->AI()->Talk(3);

				m_events.ScheduleEvent(EVENT_TALK_PART_02, 6000);
				break;
			}
			case EVENT_TALK_PART_02:
			{
				if (Creature* npc = GetStoredCreature(eVanGuardCB))
					npc->AI()->Talk(4);

				m_events.ScheduleEvent(EVENT_TALK_PART_03, 9000);
				break;
			}
			case EVENT_TALK_PART_03:
			{
				if (Creature* npc = GetStoredCreature(eVanGuardCB))
					npc->AI()->Talk(5);

				m_events.ScheduleEvent(EVENT_TALK_PART_04, 6000);
				break;
			}
			case EVENT_TALK_PART_04:
			{
				if (Creature* npc = GetStoredCreature(eVanGuardCB))
					npc->AI()->Talk(6);

				m_events.ScheduleEvent(EVENT_TALK_PART_05, 20000);
				break;
			}
			case EVENT_TALK_PART_05:
			{
				if (Creature* npc = GetStoredCreature(eVanGuardAA))
					npc->AI()->Talk(7);

				m_events.ScheduleEvent(EVENT_TALK_PART_06, 6000);
				break;
			}
			case EVENT_TALK_PART_06:
			{
				if (Creature* npc = GetStoredCreature(eVanGuardAA))
					npc->AI()->Talk(8);

				m_events.ScheduleEvent(EVENT_TALK_PART_07, 9000);
				break;
			}
			case EVENT_TALK_PART_07:
			{
				if (Creature* npc = GetStoredCreature(eVanGuardAB))
					npc->AI()->Talk(17);

				m_events.ScheduleEvent(EVENT_TALK_PART_08, 20000);
				break;
			}
			case EVENT_TALK_PART_08:
			{
				if (Creature* npc = GetStoredCreature(eVanGuardBA))
					npc->AI()->Talk(9);

				m_events.ScheduleEvent(EVENT_TALK_PART_09, 6000);
				break;
			}
			case EVENT_TALK_PART_09:
			{
				if (Creature* npc = GetStoredCreature(eVanGuardBA))
					npc->AI()->Talk(10);

				m_events.ScheduleEvent(EVENT_TALK_PART_10, 6000);
				break;
			}
			case EVENT_TALK_PART_10:
			{
				if (Creature* npc = GetStoredCreature(eVanGuardBB))
					npc->AI()->Talk(11);

				m_events.ScheduleEvent(EVENT_TALK_PART_11, 6000);
				break;
			}
			case EVENT_TALK_PART_11:
			{
				if (Creature* npc = GetStoredCreature(eVanGuardBB))
					npc->AI()->Talk(12);

				m_events.ScheduleEvent(EVENT_TALK_PART_12, 8000);
				break;
			}
			case EVENT_TALK_PART_12:
			{
				if (Creature* npc = GetStoredCreature(eVanGuardBA))
					npc->AI()->Talk(13);

				m_events.ScheduleEvent(EVENT_TALK_PART_13, 9000);
				break;
			}
			case EVENT_TALK_PART_13:
			{
				if (Creature* npc = GetStoredCreature(eVanGuardBA))
					npc->AI()->Talk(14);

				m_events.ScheduleEvent(EVENT_TALK_PART_14, 7000);
				break;
			}
			case EVENT_TALK_PART_14:
			{
				if (Creature* npc = GetStoredCreature(eVanGuardBA))
					npc->AI()->Talk(15);

				m_events.ScheduleEvent(EVENT_TALK_PART_15, 8000);
				break;
			}
			case EVENT_TALK_PART_15:
			{
				if (Creature* npc = GetStoredCreature(eVanGuardBB))
					npc->AI()->Talk(16);

				m_events.ScheduleEvent(EVENT_TALK_PART_16, 8000);
				break;
			}
			case EVENT_TALK_PART_16:
			{
				if (Creature* npc = GetStoredCreature(eVanGuardBC))
					npc->AI()->Talk(18);

				m_events.ScheduleEvent(EVENT_TALK_PART_17, 20000);
				break;
			}
			case EVENT_TALK_PART_17:
			{
				if (Creature* npc = GetStoredCreature(eVanGuardAA))
					npc->AI()->Talk(19);

				m_events.ScheduleEvent(EVENT_TALK_PART_18, 6000);
				break;
			}

			case EVENT_TALK_PART_18:
			{
				if (Creature* npc = GetStoredCreature(eVanGuardAB))
					npc->AI()->Talk(20);

				m_events.ScheduleEvent(EVENT_TALK_PART_19, 6000);
				break;
			}
			case EVENT_TALK_PART_19:
			{
				if (Creature* npc = GetStoredCreature(eVanGuardAA))
					npc->AI()->Talk(21);

				m_events.ScheduleEvent(EVENT_TALK_PART_20, 11000);
				break;
			}
			case EVENT_TALK_PART_20:
			{
				if (Creature* npc = GetStoredCreature(eVanGuardAA))
					npc->AI()->Talk(22);

				m_events.ScheduleEvent(EVENT_TALK_PART_21, 8000);
				break;
			}
			case EVENT_TALK_PART_21:
			{
				m_events.Reset();
				break;
			}
			}
		}

		/*  Alliance */

		void TryStartAnimAlliance()
		{
			if (m_animState != 0)
				return;

			if (!PlayerWithActiveQuestIsNear())
				return;

			if (m_guardsGUID.size() < 8)
				return;

			if (!m_commanderGUID)
				return;

			switch (m_lastShipEventId)
			{
			case 25769:
				m_animState = 1; // we can start the anim on next ship event
				m_events.ScheduleEvent(EVENT_START_ANIM, 1000);
				break;
			default:
				return;
			}
		}

		void HandleDoActionAlliance(int32 param)
		{
			TryStartAnimAlliance();
			printf("Alliance Ship EventID: %u \n", param);
			switch (param) // alliance
			{
			case 25769:
				printf("Abfahrt: Tritt mehrfach auf.. \n");
				if (m_animState == 11)
				{
					m_animState = 12;
					m_events.ScheduleEvent(EVENT_START_ANIM_03, 30000);
				}
				else
					m_animState = 10;
				break;
				break;
			case 24015:  // we are 15 sec. arrived on brigge
				printf("Alliance Ship 15 sec after arrive bridge \n");
				break;
			case 24986:  // we are started from bridge 15 sec before
				printf("");
				break;
			case 24009:  // big see
				printf("");
				break;
			case 25075:  // big see
				printf("");
				break;
			case 24014:  // we can see the shipwreck, 25 sec before stop on wreck..
				printf("");
				break;
			case 22520:  // we are fighting vs tentakles, 35 sec before starting to position to teleport
				printf("");
				break;
			case 24036:  // this events never fires..
				printf("");
				break;
			}
		}

		void HandleUpdateAIAlliance(uint32 eventId)
		{
			switch (eventId)
			{
			case EVENT_START_ANIM_01:
			{
				printf("");
				break;
			}
			}

			switch (m_animState)
			{
			case 1:
			case 2:  // m_animState = 1 + 2 = talk started
				AllianceAnimation_smalltalk(eventId);
				break;
			}
		}

		void AllianceAnimation_smalltalk(uint32 eventId)
		{
			switch (eventId)
			{
			case EVENT_START_ANIM: // smalltalk between soldier
			{

				m_events.ScheduleEvent(EVENT_START_ANIM, 1000);
				break;
			}
			}
		}
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_totally_generic_bunny_all_phase_32520AI(creature);
	}
};

/// Legionnaire Nazgrim - 43100 - Two Nazgrim spawns - One on bridge and a new one spawned when he enters the ship
class npc_legionnaire_nazgrim_43100 : public CreatureScript
{
public:
	npc_legionnaire_nazgrim_43100() : CreatureScript("npc_legionnaire_nazgrim_43100") { }

	struct npc_legionnaire_nazgrim_43100AI : public ScriptedAI
	{
		npc_legionnaire_nazgrim_43100AI(Creature* creature) : ScriptedAI(creature) { Initialize(); }

		EventMap m_events;
		uint64   m_vashjirShipGUID;
		uint32   m_path;
		Position m_hordePosNazA, m_hordePosNazB, m_hordePosNazC;

		void Initialize()
		{
			m_vashjirShipGUID = 0;
			m_path = 0;
			Position const m_hordePosNazA = { 1439.42f, -5009.48f, 11.64f }; // bridge: talk pos
			Position const m_hordePosNazB = { 1441.87f, -5025.65f, 12.20f, 4.825f }; // ship: first pos
			Position const m_hordePosNazC = { 1450.60f, -5028.54f, 12.05f, 3.951f }; // ship: home pos
		}

		void MovementInform(uint32 type, uint32 id) override
		{
			if (type == POINT_MOTION_TYPE)
				switch (id)
				{
				case 1024:
					m_events.ScheduleEvent(EVENT_TALK_PART_00, 10);
					break;
				case 1025:
					m_events.ScheduleEvent(EVENT_START_WALK_02, 10);
					break;
				case 1026:
					m_events.ScheduleEvent(EVENT_START_WALK_03, 10);
					break;
				}
		}

		void SetGUID(uint64 guid, int32 id) override
		{
			switch (id)
			{
			case GO_SHIP_TO_VASHJIR_203466:
			{
				m_vashjirShipGUID = guid;
				break;
			}
			}
		}

		void DoAction(int32 param) override
		{
			switch (param)
			{
			case ACTION_START_ANIM_01: // walk to talk-point, and start to talk..
				me->SetWalk(true);
				me->GetMotionMaster()->MovePoint(1024, m_hordePosNazA);
				break;
			case ACTION_START_ANIM_02: // walk to ship.. and to home..
				me->SetWalk(true);
				me->GetMotionMaster()->MovePoint(1025, m_hordePosNazB, false);
				break;
			case ACTION_CREATE_NAZGRIM:
				// some neccassary init after spawn new passenger nazgrim on ship
				break;
			}
		}

		void UpdateAI(uint32 diff) override
		{
			m_events.Update(diff);

			while (uint32 eventId = m_events.ExecuteEvent())
			{
				switch (eventId)
				{
				case EVENT_TALK_PART_00:
					Talk(1);
					m_events.ScheduleEvent(EVENT_TALK_PART_01, 6000);
					break;
				case EVENT_TALK_PART_01:
					Talk(2);
					m_events.ScheduleEvent(EVENT_TALK_PART_02, 8000);
					break;
				case EVENT_TALK_PART_02:
					Talk(3);
					break;
				case EVENT_START_WALK_02: // walk to home
					me->SetWalk(true);
					me->GetMotionMaster()->MovePoint(1026, m_hordePosNazC, false);
					break;
				case EVENT_START_WALK_03: // set facing to center, send to ship: create passenger nazgrim
				{
					me->DespawnOrUnsummon(200);
					if (GameObject* go = sObjectAccessor->GetGameObject(*me, m_vashjirShipGUID))
					{
						me->SetFacingTo(3.5f);
						go->AI()->SetGUID(me->GetGUID(), me->GetEntry());
					}
					break;
				}
				}
			}

			if (!UpdateVictim())
				return;
			else
				DoMeleeAttackIfReady();
		}
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_legionnaire_nazgrim_43100AI(creature);
	}
};

/// Hellscream's Vanguard - 43090 - Two Vanguard Spawns: One on bridge and a new one spawned when entered the ship
class npc_hellscreams_vanguard_43090 : public CreatureScript
{
public:
	npc_hellscreams_vanguard_43090() : CreatureScript("npc_hellscreams_vanguard_43090") { }

	struct npc_hellscreams_vanguard_43090AI : public ScriptedAI
	{
		npc_hellscreams_vanguard_43090AI(Creature* creature) : ScriptedAI(creature) { Initialize(); }

		EventMap m_events;
		Position m_hordeShipPosA, m_hordeShipPosB;
		uint64   m_vashjirShipGUID;
		uint32   m_guardIndex;
		std::map<uint32, Position>m_guardHomePos;

		void Initialize()
		{
			Position const m_hordeShipPosA = { 1439.79f, -5015.64f, 12.12f, 4.825f };  // pos on bridge
			Position const m_hordeShipPosB = { 1441.87f, -5025.65f, 12.20f, 4.825f };  // first pos ship

			Position const m_VanGuardAA = { 1451.11f, -5041.84f, 12.02f, 1.563f };
			Position const m_VanGuardAB = { 1445.82f, -5043.93f, 12.03f, 1.563f };
			Position const m_VanGuardBA = { 1440.38f, -5043.80f, 12.08f, 1.539f };
			Position const m_VanGuardBB = { 1435.82f, -5045.21f, 12.13f, 1.586f };
			Position const m_VanGuardBC = { 1429.85f, -5029.32f, 12.20f, 4.889f };
			Position const m_VanGuardCA = { 1435.38f, -5028.59f, 12.11f, 5.172f };

			m_guardHomePos.insert(std::pair<uint32, Position>(eVanGuardAA, m_VanGuardAA));
			m_guardHomePos.insert(std::pair<uint32, Position>(eVanGuardAB, m_VanGuardAB));
			m_guardHomePos.insert(std::pair<uint32, Position>(eVanGuardBA, m_VanGuardBA));
			m_guardHomePos.insert(std::pair<uint32, Position>(eVanGuardBB, m_VanGuardBB));
			m_guardHomePos.insert(std::pair<uint32, Position>(eVanGuardBC, m_VanGuardBC));
			m_guardHomePos.insert(std::pair<uint32, Position>(eVanGuardCA, m_VanGuardCA));
			m_vashjirShipGUID = 0;
			m_guardIndex = 0;
		}

		void Reset() override
		{
		}

		void MovementInform(uint32 type, uint32 id) override
		{
			if (type == POINT_MOTION_TYPE)
				switch (id)
				{
				case 1024:
					m_events.ScheduleEvent(EVENT_START_WALK_02, 10);
					break;
				case 1025:
					m_events.ScheduleEvent(EVENT_START_WALK_03, 10);
					break;
				case 1026:
					m_events.ScheduleEvent(EVENT_START_WALK_04, 10);
					break;
				}
		}

		void SetGUID(uint64 guid, int32 id) override
		{
			switch (id)
			{
			case GO_SHIP_TO_VASHJIR_203466:
			{
				m_vashjirShipGUID = guid;
				break;
			}
			}
		}

		void SetData(uint32 id, uint32 value) override
		{
			return;

			switch (id)
			{
			case NPC_HELLSCREAMS_VANGUARD:
				m_guardIndex = value;
				break;
			}

		}

		uint32 GetData(uint32 id = 0) override
		{
			switch (id)
			{
				case NPC_HELLSCREAMS_VANGUARD:
					return m_guardIndex;
			}
			return 0;
		}

		void DoAction(int32 param) override
		{
			switch (param)
			{
			case ACTION_START_WALK_01:
				m_events.ScheduleEvent(EVENT_START_WALK_01, urand(2000, 4000));
				break;
			case ACTION_CREATE_VANGUARD:
				// some neccassary init after spawn new passenger vangard on ship
				break;
			}
		}

		void UpdateAI(uint32 diff) override
		{
			m_events.Update(diff);

			while (uint32 eventId = m_events.ExecuteEvent())
			{
				switch (eventId)
				{
				case EVENT_START_WALK_01: // walk to bridge-center, ship entry
					me->SetWalk(true);
					me->GetMotionMaster()->MovePoint(1024, m_hordeShipPosA);
					break;
				case EVENT_START_WALK_02: // walk to first pos on ship,
					me->SetWalk(true);
					me->GetMotionMaster()->MovePoint(1025, m_hordeShipPosB, false);
					break;
				case EVENT_START_WALK_03:
				{
					if (m_guardHomePos.find(me->GetDBTableGUIDLow()) == m_guardHomePos.end())
						me->DespawnOrUnsummon(10);
					else
						me->GetMotionMaster()->MovePoint(1026, m_guardHomePos[me->GetDBTableGUIDLow()], false);
					break;
				}
				case EVENT_START_WALK_04:
				{
					me->DespawnOrUnsummon(200);
					if (GameObject* go = sObjectAccessor->GetGameObject(*me, m_vashjirShipGUID))
					{
						Position pos;
						me->GetPosition(&pos);
						if (pos.m_positionY > 0)
							me->SetFacingTo(5.1f);
						else
							me->SetFacingTo(1.5f);
						me->SetTransportHomePosition(me->GetTransportPosition());
						go->AI()->SetGUID(me->GetGUID(), me->GetDBTableGUIDLow());
					}
					break;
				}
				}
			}

			if (!UpdateVictim())
				return;
			else
				DoMeleeAttackIfReady();
		}

		float GetGlobalOrientation(float transportOrientation)
		{
			if (GameObject* go = sObjectAccessor->GetGameObject(*me, m_vashjirShipGUID))
				if (Transport* transport = go->ToTransport())
				{
					float x, y, z, o;
					me->GetPosition(x, y, z, o);
					transport->CalculatePassengerPosition(x, y, z, o);
					return o;
				}
			return 0;
		}
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_hellscreams_vanguard_43090AI(creature);
	}
};

/// Gameobject - Ship to Vash'Jir - 203466 (Horde)
class go_ship_to_vashjir_203466 : public GameObjectScript
{
public:
	go_ship_to_vashjir_203466() : GameObjectScript("go_ship_to_vashjir_203466") {}

	struct go_ship_to_vashjir_203466AI : public GameObjectAI
	{
		go_ship_to_vashjir_203466AI(GameObject* go) : GameObjectAI(go) { }

		EventMap m_events;
		uint64   m_bunnyBridgeGUID;
		uint64   m_nazgrimShipGUID;
		std::map<uint32, uint64> m_vanGuardShipGUID;

		void InitializeShip()
		{
			m_nazgrimShipGUID = 0;
			m_vanGuardShipGUID.clear();
		}

		void Reset()
		{
			m_bunnyBridgeGUID = 0;
			InitializeShip();
		}

		void EventInform(uint32 eventId)
		{
			if (m_bunnyBridgeGUID)
				if (Creature* bunny = FindCreatureWorldwide(m_bunnyBridgeGUID))
					bunny->AI()->DoAction(eventId);

			switch (eventId)
			{
			case 26605: // teleport to map 1
				break;
			case 25447:
			{
				// delete all guards from ship                
				std::list<uint64> pList;
				if (Transport* transport = go->ToTransport())
				{
					transport->RemoveNpcPassenger(m_nazgrimShipGUID);
					for (auto guid : m_vanGuardShipGUID)
						transport->RemoveNpcPassenger(guid.second);
				}
				m_nazgrimShipGUID = 0;
				m_vanGuardShipGUID.clear();
				break;
			}
			case 25445: // arrive bridge
				break;
			case 26515: // departure from bridge..
				m_events.Reset();
				break;
			case 25467:
				break;
			case 25446:
				break;
			case 25452: // teleport to map 0
				break;
			case 25489:
				break;
			case 25448:
				break;
			case 25428:
				break;
			}
		}

		void SetGUID(const uint64& guid, int32 id = 0) override
		{
			switch (id)
			{
			case 32520: // horde bunny controller outside ship
				m_bunnyBridgeGUID = guid;
				break;
			case eVanGuardNaz:
			case NPC_LEGIONNAIRE_NAZGRIM:
				if (Transport* transport = go->ToTransport())
					if (Creature* nazgrimOld = sObjectAccessor->GetCreature(*go, guid))
					{
						float x, y, z, o;
						nazgrimOld->GetPosition(x, y, z, o);
						transport->CalculatePassengerOffset(x, y, z, o);
						uint32 _mapId = transport->GetMoTransportMapId();
						if (Creature* nazgrim = CreateCreatureAsPassenger(NPC_LEGIONNAIRE_NAZGRIM, _mapId, x, y, z, o))
						{
							m_nazgrimShipGUID = nazgrim->GetGUID();
							nazgrim->AI()->SetGUID(go->GetGUID(), go->GetEntry());
							nazgrim->AI()->DoAction(ACTION_CREATE_NAZGRIM);
						}
					}
				break;
			case eVanGuardAA:
			case eVanGuardAB:
			case eVanGuardBA:
			case eVanGuardBB:
			case eVanGuardBC:
			case eVanGuardCA:
			case eVanGuardCB:
			case eVanGuardDA:
			case NPC_HELLSCREAMS_VANGUARD:
				if (Transport* transport = go->ToTransport())
					if (Creature* old = sObjectAccessor->GetCreature(*go, guid))
					{
						float x, y, z, o;
						old->GetPosition(x, y, z, o);
						transport->CalculatePassengerOffset(x, y, z, o);
						(y < 0.0f) ? o = 1.5f : o = 4.9f;
						uint32 _mapId = transport->GetMoTransportMapId();
						if (Creature* guard = CreateCreatureAsPassenger(NPC_HELLSCREAMS_VANGUARD, _mapId, x, y, z, o))
						{
							m_vanGuardShipGUID.insert(std::pair<uint32, uint64>(guard->GetDBTableGUIDLow(), guard->GetGUID()));
							guard->AI()->SetGUID(go->GetGUID(), go->GetEntry());
							guard->AI()->DoAction(ACTION_CREATE_VANGUARD);
						}
					}
				break;
			}
		}

		void UpdateAI(uint32 diff) override
		{
			m_events.Update(diff);

			while (uint32 eventId = m_events.ExecuteEvent())
			{
				switch (eventId)
				{
				case 0:
					break;
				}
			}
		}

		Creature* FindCreatureWorldwide(uint64 guid)
		{
			if (Creature* cr = HashMapHolder<Creature>::Find(guid))
				return cr;

			return nullptr;
		}

		bool IsPassengerPlayerBoarded()
		{
			if (Transport* transport = go->ToTransport())
			{
				std::set<WorldObject*> pList = transport->GetPassengers();
				if (!pList.empty())
					return true;
			}
			return false;
		}

		GameObject* CreateGameObjectAsPassenger(uint32 entry, uint32 map, float x, float y, float z, float o)
		{
			if (Transport* transport = go->ToTransport())
				if (uint32 guid = sObjectMgr->GenerateLowGuid(HIGHGUID_GAMEOBJECT))
				{
					GameObjectData& data = sObjectMgr->NewGOData(guid);
					data.id = entry;
					data.mapid = map;
					data.phaseMask = 1;
					data.spawnMask = 1;
					data.posX = x;
					data.posY = y;
					data.posZ = z;
					data.orientation = o;
					GameObject* g = transport->CreateGOPassenger(guid, &data);
					sObjectMgr->AddGameobjectToGrid(guid, &data);
					return g;
				}
		}

		Creature* CreateCreatureAsPassenger(uint32 entry, uint32 map, float x, float y, float z, float o)
		{
			if (Transport* transport = go->ToTransport())
				if (uint32 guid = sObjectMgr->GenerateLowGuid(HIGHGUID_UNIT))
				{
					CreatureData& data = sObjectMgr->NewOrExistCreatureData(guid);
					data.id = entry;
					data.mapid = map;
					data.phaseMask = 1;
					data.spawnMask = 1;
					data.posX = x;
					data.posY = y;
					data.posZ = z;
					data.orientation = o;
					Creature* c = transport->CreateNPCPassenger(guid, &data);
					sObjectMgr->AddCreatureToGrid(guid, &data);
					return c;
				}
			return nullptr;
		}
	};

	GameObjectAI* GetAI(GameObject* go) const
	{
		return new go_ship_to_vashjir_203466AI(go);
	}
};

/* End Quest: Call of Duty.. */



/// Voodoo - 17009
class spell_voodoo : public SpellScriptLoader
{
public:
	spell_voodoo() : SpellScriptLoader("spell_voodoo") {}

	class spell_voodoo_SpellScript : public SpellScript
	{
		PrepareSpellScript(spell_voodoo_SpellScript)

			bool Validate(SpellInfo const* /*spell*/)
		{
			if (!sSpellMgr->GetSpellInfo(SPELL_BREW) || !sSpellMgr->GetSpellInfo(SPELL_GHOSTLY) ||
				!sSpellMgr->GetSpellInfo(SPELL_HEX1) || !sSpellMgr->GetSpellInfo(SPELL_HEX2) ||
				!sSpellMgr->GetSpellInfo(SPELL_HEX3) || !sSpellMgr->GetSpellInfo(SPELL_GROW) ||
				!sSpellMgr->GetSpellInfo(SPELL_LAUNCH))
				return false;
			return true;
		}

		void HandleDummy(SpellEffIndex /*effIndex*/)
		{
			uint32 spellid = RAND(SPELL_BREW, SPELL_GHOSTLY, RAND(SPELL_HEX1, SPELL_HEX2, SPELL_HEX3), SPELL_GROW, SPELL_LAUNCH);
			if (Unit* target = GetHitUnit())
				GetCaster()->CastSpell(target, spellid, false);
		}

		void Register()
		{
			OnEffectHitTarget += SpellEffectFn(spell_voodoo_SpellScript::HandleDummy, EFFECT_0, SPELL_EFFECT_DUMMY);
		}
	};

	SpellScript* GetSpellScript() const
	{
		return new spell_voodoo_SpellScript();
	}
};

/// Rumbling Hooves - 73868
class spell_rumbling_hooves_73868 : public SpellScriptLoader
{
public:
	spell_rumbling_hooves_73868() : SpellScriptLoader("spell_rumbling_hooves_73868") { }

	enum eSpell
	{
		NPC_THE_WOLF = 39364,
	};

	class IsEntry
	{
	public:
		explicit IsEntry(uint32 entry) : _entry(entry) { }

		bool operator()(WorldObject* obj) const
		{
			if (Creature* target = obj->ToCreature())
				return target->GetEntry() == _entry;

			return true;
		}

	private:
		uint32 _entry;
	};

	class spell_rumbling_hooves_73868_SpellScript : public SpellScript
	{
		PrepareSpellScript(spell_rumbling_hooves_73868_SpellScript);

		void FilterTargets(std::list<WorldObject*>& targets)
		{
			targets.remove_if(IsEntry(GetCaster()->GetEntry()));
		}

		void Register()
		{
			OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_rumbling_hooves_73868_SpellScript::FilterTargets, EFFECT_0, TARGET_UNIT_DEST_AREA_ENTRY);
		}
	};

	SpellScript* GetSpellScript() const
	{
		return new spell_rumbling_hooves_73868_SpellScript();
	}
};


/// Golden Stonefish Kill Spell - 80962
class spell_kill_golden_stonefish_80962 : public SpellScriptLoader
{
public:
	spell_kill_golden_stonefish_80962() : SpellScriptLoader("spell_kill_golden_stonefish_80962") { }

	enum eSpell
	{
		NPC_GOLDEN_STONEFISH = 43331,
	};

	class spell_kill_golden_stonefish_80962_SpellScript : public SpellScript
	{
		PrepareSpellScript(spell_kill_golden_stonefish_80962_SpellScript);

		void SelectTarget(std::list<WorldObject*>& targets)
		{
			std::list<WorldObject*> list;
			for (std::list<WorldObject*>::iterator itr = targets.begin(); itr != targets.end(); ++itr)
				if ((*itr)->ToCreature() && (*itr)->GetEntry() == NPC_GOLDEN_STONEFISH)
					list.push_back((*itr));

			targets = list;
		}

		void Register() override
		{
			OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_kill_golden_stonefish_80962_SpellScript::SelectTarget, EFFECT_0, TARGET_UNIT_SRC_AREA_ENTRY);
		}
	};

	SpellScript* GetSpellScript() const override
	{
		return new spell_kill_golden_stonefish_80962_SpellScript();
	}
};



#ifndef __clang_analyzer__
void AddSC_durotar()
{
	/// PlayerScript Handler
	new playerScript_durotar_handler();

	/// Echo Isles Npcs
	new npc_jailor();
	new npc_swiftclaw();
	new npc_swiftclaw2();

	/// Durotar Npcs
    new npc_lazy_peon();
	new npc_shin_stonepillar_39380();
	new npc_the_wolf_39364();
	new npc_the_kodo_39365();
	new npc_drowned_thunder_lizard_39464();

	/// Vash'jir Campaign
	new npc_commander_thorak_41621();
	new npc_totally_generic_bunny_all_phase_32520();
	new npc_legionnaire_nazgrim_43100();
	new npc_hellscreams_vanguard_43090();
	new go_ship_to_vashjir_203466();

	/// Spells
	new spell_voodoo();
	new spell_rumbling_hooves_73868();
	new spell_kill_golden_stonefish_80962();
}
#endif
