////////////////////////////////////////////////////////////////////////////////
//
// Project-Hellscream https://hellscream.org
// Copyright (C) 2018-2020 Project-Hellscream-6.2
// Discord https://discord.gg/CWCF3C9
//
////////////////////////////////////////////////////////////////////////////////

/* ScriptData
SDName: Darkshore
SD%Complete: 0
SDComment: Quest support:
SDCategory: Darkshore
EndScriptData */

/* ContentData
EndContentData */

#include "Player.h"
#include "SpellInfo.h"
#include "Vehicle.h"
#include "WorldSession.h"
#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "ScriptedGossip.h"
#include "ScriptedEscortAI.h"
#include "ScriptedFollowerAI.h"

class npc_prospector_remtravel : public CreatureScript
{
    public:
        npc_prospector_remtravel() : CreatureScript("npc_prospector_remtravel")
        {
        }

        CreatureAI* GetAI(Creature* creature) const
        {
            return new npc_prospector_remtravelAI(creature);
        }

        struct npc_prospector_remtravelAI : public ScriptedAI
        {
            npc_prospector_remtravelAI(Creature* creature) : ScriptedAI(creature)
            {
            }

            EventMap events;

            void Reset()
            {
                events.Reset();
            }

            void UpdateAI(const uint32 /*p_Diff*/)
            {
            }
        };
};


/// Gershala Nightwhisper - 32911 
class npc_gershala_nightwhisper_32911 : public CreatureScript
{
public:
	npc_gershala_nightwhisper_32911() : CreatureScript("npc_gershala_nightwhisper_32911") { }

	enum eQuest
	{
		QUEST_THE_LAST_WAVE_OF_SURVIVORS = 13518,
		NPC_GERSHALA_NIGHTWHISPER = 32911,
		PLAYER_GUID = 99999,
		NPC_RESCUE_SENTINEL = 32969,
		ACTION_START_RESCUE = 101,
	};

	bool OnGossipHello(Player* player, Creature* creature) override
	{
		creature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_STUNNED);
		if (player->GetQuestStatus(QUEST_THE_LAST_WAVE_OF_SURVIVORS) == QUEST_STATUS_INCOMPLETE)
			if (!player->GetReqKillOrCastCurrentCount(QUEST_THE_LAST_WAVE_OF_SURVIVORS, NPC_GERSHALA_NIGHTWHISPER))
				if (Creature* npc = creature->SummonCreature(NPC_RESCUE_SENTINEL, 7422.14f, 151.08f, 1.70f, 0.328f, TEMPSUMMON_TIMED_DESPAWN, 120000))
				{
					player->SEND_GOSSIP_MENU(14300, creature->GetGUID());
					player->KilledMonsterCredit(NPC_GERSHALA_NIGHTWHISPER);
					npc->setFaction(35);
					npc->GetAI()->SetGUID(creature->GetGUID(), NPC_GERSHALA_NIGHTWHISPER);
					npc->GetAI()->SetGUID(player->GetGUID(), PLAYER_GUID);
					npc->GetAI()->DoAction(ACTION_START_RESCUE);
					return true;
				}

		return false;
	}
};

/// Cerellean Whiteclaw - 33093 
class npc_cerellean_whiteclaw_33093 : public CreatureScript
{
public:
	npc_cerellean_whiteclaw_33093() : CreatureScript("npc_cerellean_whiteclaw_33093") { }

	enum eQuest
	{
		QUEST_THE_LAST_WAVE_OF_SURVIVORS = 13518,
		NPC_CERELLEAN_WHITECLAW = 33093,
		PLAYER_GUID = 99999,
		NPC_RESCUE_SENTINEL = 32969,
		ACTION_START_RESCUE = 101,
	};

	bool OnGossipHello(Player* player, Creature* creature) override
	{
		creature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_STUNNED);
		if (player->GetQuestStatus(QUEST_THE_LAST_WAVE_OF_SURVIVORS) == QUEST_STATUS_INCOMPLETE)
			if (!player->GetReqKillOrCastCurrentCount(QUEST_THE_LAST_WAVE_OF_SURVIVORS, NPC_CERELLEAN_WHITECLAW))
				if (Creature* npc = creature->SummonCreature(NPC_RESCUE_SENTINEL, 7375.88f, 113.33f, 12.38f, 1.865f, TEMPSUMMON_TIMED_DESPAWN, 120000))
				{
					player->SEND_GOSSIP_MENU(14297, creature->GetGUID());
					player->KilledMonsterCredit(NPC_CERELLEAN_WHITECLAW);
					npc->setFaction(35);
					npc->GetAI()->SetGUID(creature->GetGUID(), NPC_CERELLEAN_WHITECLAW);
					npc->GetAI()->SetGUID(player->GetGUID(), PLAYER_GUID);
					npc->GetAI()->DoAction(ACTION_START_RESCUE);
					return true;
				}

		return false;
	}
};

/// Volcor - 33094 
class npc_volcor_33094 : public CreatureScript
{
public:
	npc_volcor_33094() : CreatureScript("npc_volcor_33094") { }

	enum eQuest
	{
		QUEST_THE_LAST_WAVE_OF_SURVIVORS = 13518,
		NPC_VOLCOR = 33094,
		PLAYER_GUID = 99999,
		NPC_RESCUE_SENTINEL = 32969,
		ACTION_START_RESCUE = 101,
	};

	bool OnGossipHello(Player* player, Creature* creature) override
	{
		creature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_STUNNED);
		if (player->GetQuestStatus(QUEST_THE_LAST_WAVE_OF_SURVIVORS) == QUEST_STATUS_INCOMPLETE)
			if (!player->GetReqKillOrCastCurrentCount(QUEST_THE_LAST_WAVE_OF_SURVIVORS, NPC_VOLCOR))
				if (Creature* npc = creature->SummonCreature(NPC_RESCUE_SENTINEL, 7431.35f, 87.78f, 2.16f, 1.212f, TEMPSUMMON_TIMED_DESPAWN, 120000))
				{
					player->SEND_GOSSIP_MENU(14298, creature->GetGUID());
					player->KilledMonsterCredit(NPC_VOLCOR);
					npc->setFaction(35);
					npc->GetAI()->SetGUID(creature->GetGUID(), NPC_VOLCOR);
					npc->GetAI()->SetGUID(player->GetGUID(), PLAYER_GUID);
					npc->GetAI()->DoAction(ACTION_START_RESCUE);
					return true;
				}

		return false;
	}
};

/// Shaldyn - 33095 
class npc_shaldyn_33095 : public CreatureScript
{
public:
	npc_shaldyn_33095() : CreatureScript("npc_shaldyn_33095") { }

	enum eQuest
	{
		QUEST_THE_LAST_WAVE_OF_SURVIVORS = 13518,
		NPC_SHALDYN = 33095,
		PLAYER_GUID = 99999,
		NPC_RESCUE_SENTINEL = 32969,
		ACTION_START_RESCUE = 101,
	};

	bool OnGossipHello(Player* player, Creature* creature) override
	{
		creature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_STUNNED);
		if (player->GetQuestStatus(QUEST_THE_LAST_WAVE_OF_SURVIVORS) == QUEST_STATUS_INCOMPLETE)
			if (!player->GetReqKillOrCastCurrentCount(QUEST_THE_LAST_WAVE_OF_SURVIVORS, NPC_SHALDYN))
				if (Creature* npc = creature->SummonCreature(NPC_RESCUE_SENTINEL, 7289.61f, 215.36f, 0.53f, 1.299f, TEMPSUMMON_TIMED_DESPAWN, 120000))
				{
					player->SEND_GOSSIP_MENU(14299, creature->GetGUID());
					player->KilledMonsterCredit(NPC_SHALDYN);
					npc->setFaction(35);
					npc->GetAI()->SetGUID(creature->GetGUID(), NPC_SHALDYN);
					npc->GetAI()->SetGUID(player->GetGUID(), PLAYER_GUID);
					npc->GetAI()->DoAction(ACTION_START_RESCUE);
					return true;
				}

		return false;
	}
};

/// Lordanel Sentinel (Rescue) - 32969
class npc_lordanel_sentinel_32969 : public CreatureScript
{
public:
	npc_lordanel_sentinel_32969() : CreatureScript("npc_lordanel_sentinel_32969") { }

	enum eRescue
	{
		QUEST_THE_LAST_WAVE_OF_SURVIVORS = 13518,
		NPC_GERSHALA_NIGHTWHISPER = 32911,
		NPC_CERELLEAN_WHITECLAW = 33093,
		NPC_VOLCOR = 33094,
		NPC_SHALDYN = 33095,
		PLAYER_GUID = 99999,
		NPC_RESCUE_SENTINEL = 32969,
		NPC_FLYING_MOUNT = 43751,
		NPC_RIDING_MOUNT = 33358,
		ACTION_START_RESCUE = 101,
		EVENT_MOVE_RESCUE = 101,
		EVENT_UNMOUNT_1,
		EVENT_SAY_0,
		EVENT_SAY_1,
		EVENT_DESPAWN_1,
		EVENT_DESPAWN_2,
		EVENT_DESPAWN_3,
		MOVE_SENTINEL_TO_RESCUE = 101,
	};

	struct npc_lordanel_sentinel_32969AI : public ScriptedAI
	{
		npc_lordanel_sentinel_32969AI(Creature* creature) : ScriptedAI(creature) { }

		EventMap m_events;
		uint64   m_npc_to_rescueGUID;
		uint64   m_playerGUID;
		uint64   m_mountGUID;
		uint64   m_sentinelGUID;
		bool     m_isFlying;
		bool     m_isRiding;
		uint32   m_say0;
		uint32   m_say1;

		void Reset() override
		{
			m_events.Reset();
			m_npc_to_rescueGUID = NULL;
			m_playerGUID = NULL;
			m_mountGUID = NULL;
			m_sentinelGUID = NULL;
			m_isFlying = false;
			m_isRiding = false;
			m_say0 = 0;
			m_say1 = 0;
		}

		void SetGUID(uint64 guid, int32 id = 0)
		{
			switch (id)
			{
			case PLAYER_GUID:
			{
				m_playerGUID = guid;
				break;
			}
			case NPC_CERELLEAN_WHITECLAW:
			{
				m_say0 = 0;
				m_say1 = 1;
				m_npc_to_rescueGUID = guid;
				break;
			}
			case NPC_GERSHALA_NIGHTWHISPER:
			{
				m_say0 = 2;
				m_say1 = 3;
				m_npc_to_rescueGUID = guid;
				m_isFlying = true;
				break;
			}
			case NPC_SHALDYN:
			{
				m_say0 = 4;
				m_say1 = 5;
				m_npc_to_rescueGUID = guid;
				m_isFlying = true;
				break;
			}
			case NPC_VOLCOR:
			{
				m_say0 = 6;
				m_say1 = 7;
				m_npc_to_rescueGUID = guid;
				m_isRiding = true;
				break;
			}
			}
		}

		void DoAction(int32 param) override
		{
			switch (param)
			{
			case ACTION_START_RESCUE:
			{
				m_sentinelGUID = me->GetGUID();
				m_events.ScheduleEvent(EVENT_MOVE_RESCUE, 1000);
			}
			}
		}

		void UpdateAI(uint32 diff) override
		{
			m_events.Update(diff);

			while (uint32 eventId = m_events.ExecuteEvent())
			{
				switch (eventId)
				{
				case EVENT_MOVE_RESCUE:
				{
					Creature* mount = NULL;
					if (m_isFlying)
					{
						Position pos;
						me->GetPosition(&pos);
						pos.m_positionZ += 3.0f;
						if (mount = me->SummonCreature(NPC_FLYING_MOUNT, pos, TEMPSUMMON_TIMED_DESPAWN, 100000))
						{
							mount->setFaction(35);
							m_mountGUID = mount->GetGUID();
							me->EnterVehicle(mount);
						}
					}
					else if (m_isRiding)
					{
						Position pos;
						me->GetPosition(&pos);
						if (mount = me->SummonCreature(NPC_RIDING_MOUNT, pos, TEMPSUMMON_TIMED_DESPAWN, 100000))
						{
							mount->setFaction(35);
							m_mountGUID = mount->GetGUID();
							me->EnterVehicle(mount);
						}
					}
					else
						mount = me;

					if (Creature* npc = sObjectAccessor->GetCreature(*me, m_npc_to_rescueGUID))
						if (Player* player = sObjectAccessor->GetPlayer(*me, m_playerGUID))
						{
							float angle = npc->GetAngle(mount->GetPositionX(), mount->GetPositionY());
							Position pos;
							npc->GetNearPosition(pos, 2.0f, angle);
							if (m_isFlying)
								pos.m_positionZ += 2.0f;
							mount->GetMotionMaster()->MovePoint(MOVE_SENTINEL_TO_RESCUE, pos);
						}
					m_events.ScheduleEvent(EVENT_UNMOUNT_1, 4500);
					break;
				}
				case EVENT_UNMOUNT_1:
				{
					if (m_isFlying || m_isRiding)
						if (Creature* npc = sObjectAccessor->GetCreature(*me, m_mountGUID))
						{
							me->ExitVehicle();
							npc->DespawnOrUnsummon(250);
						}

					m_events.ScheduleEvent(EVENT_SAY_0, 500);
					break;
				}
				case EVENT_SAY_0:
				{
					Talk(m_say0);
					m_events.ScheduleEvent(EVENT_SAY_1, 5000);
					break;
				}
				case EVENT_SAY_1:
				{
					Talk(m_say1);
					m_events.ScheduleEvent(EVENT_DESPAWN_1, 5000);
					break;
				}
				case EVENT_DESPAWN_1:
				{
					me->DespawnOrUnsummon(500);
					break;
				}
				}
			}
		}
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_lordanel_sentinel_32969AI(creature);
	}
};

#ifndef __clang_analyzer__
void AddSC_darkshore()
{
	/// Npcs
    new npc_prospector_remtravel();

	/// --- The Last Wave of Survivors
	new npc_gershala_nightwhisper_32911();
	new npc_cerellean_whiteclaw_33093();
	new npc_volcor_33094();
	new npc_shaldyn_33095();
	new npc_lordanel_sentinel_32969();
}
#endif
