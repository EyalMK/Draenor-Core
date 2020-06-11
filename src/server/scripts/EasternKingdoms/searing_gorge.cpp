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


/// Quest: Rise, Obsidion - 28056
enum eMoves
{
	MaxLathoricMoves = 4,
};

static std::array<G3D::Vector3, eMoves::MaxLathoricMoves> g_LathoricMoves =
{
	{
		{ -6465.23f, -1268.51f, 180.673f },
		{ -6469.58f, -1266.06f, 180.597f },
		{ -6473.7f, -1260.24f, 180.473f  },
		{ -6476.37f, -1252.35f, 180.332f }
	}
};

/// Lathorick the Black - 8391
class npc_lathorick_the_black : public CreatureScript
{
public:
	npc_lathorick_the_black() : CreatureScript("npc_lathorick_the_black") { }

	enum eData
	{
		// Quest
		QUEST_RISE_OBSIDION = 28056,

		// NPCs
		NPC_OBSIDION = 8400,

		// Events & spells
		SPELL_SHADOW_BOLT = 9613,
		EVENT_SHADOW_BOLT = 0,
	};


	struct npc_lathorick_the_blackAI : public ScriptedAI
	{
		npc_lathorick_the_blackAI(Creature* p_Creature) : ScriptedAI(p_Creature) {	}

		EventMap m_events;

		void Reset() override
		{
			m_events.Reset();
			ClearDelayedOperations();
		}

		void EnterCombat(Unit* victim) override
		{
			m_events.ScheduleEvent(EVENT_SHADOW_BOLT, urand(3000, 4000));
		}

		void MovementInform(uint32 type, uint32 id) override
		{

			if (type == EFFECT_MOTION_TYPE && id == 4) // Last waypoint
			{
				if (Creature* Obsidion = me->FindNearestCreature(NPC_OBSIDION, 40.0f))
				{
					Talk(1); // Fools. Obsidion! Rise...
					me->setFaction(54); // Hostile faction
					Obsidion->setFaction(54); // To assist Lathorick

					// Flags
					Obsidion->SetStandState(UNIT_STAND_STATE_STAND);
					Obsidion->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_NPC);
					Obsidion->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PC);
					Obsidion->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_UNK_15);
					Obsidion->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
					Obsidion->RemoveFlag(UNIT_FIELD_FLAGS_2, UNIT_FLAG2_FEIGN_DEATH);

					Obsidion->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IN_COMBAT);

					// Move Obsidion to Position and attack player
					Obsidion->GetMotionMaster()->MovePoint(0, -6476.454f, -1249.35f, 180.2865f);

					// Prevent crash if player is stealthed 
					if (Player* player = me->FindNearestPlayer(10.0f, true))
					{
						me->CombatStart(player);
						Obsidion->CombatStart(player);
					}
						
				}
				
			}
		}

		void UpdateAI(uint32 diff) override
		{

			UpdateOperations(diff);

			if (!UpdateVictim())
				return;

			m_events.Update(diff);

			if (me->HasUnitState(UNIT_STATE_CASTING))
				return;

			if (uint32 eventId = m_events.ExecuteEvent())
			{
				switch (eventId)
				{
				case EVENT_SHADOW_BOLT:
					DoCastVictim(SPELL_SHADOW_BOLT);
					m_events.ScheduleEvent(EVENT_SHADOW_BOLT, urand(3400, 4700));
					break;
				default:
					break;
				}
			}

			DoMeleeAttackIfReady();
		}

	};

	CreatureAI* GetAI(Creature* p_Creature) const override
	{
		return new npc_lathorick_the_blackAI(p_Creature);
	}
};


/// Obsidion - 8400
class npc_obsidion : public CreatureScript
{
public:
	npc_obsidion() : CreatureScript("npc_obsidion") { }

	enum eData
	{
		// NPCs
		NPC_OBSIDION = 8400,

		// Events & spells
		SPELL_FLAME_BLAST = 84165,
		EVENT_FLAME_BLAST = 0,
	};


	struct npc_obsidionAI : public ScriptedAI
	{
		npc_obsidionAI(Creature* p_Creature) : ScriptedAI(p_Creature) {	}

		EventMap m_events;

		void Reset() override
		{
			m_events.Reset();
			ClearDelayedOperations();
		}

		void EnterCombat(Unit* victim) override
		{
			m_events.ScheduleEvent(EVENT_FLAME_BLAST, urand(2000, 3000));
		}

		void UpdateAI(const uint32 diff)
		{

			UpdateOperations(diff);

			if (!UpdateVictim())
				return;

			m_events.Update(diff);

			if (me->HasUnitState(UNIT_STATE_CASTING))
				return;

			if (uint32 eventId = m_events.ExecuteEvent())
			{
				switch (eventId)
				{
				case EVENT_FLAME_BLAST:
					DoCastVictim(SPELL_FLAME_BLAST);
					m_events.ScheduleEvent(EVENT_FLAME_BLAST, urand(18000, 21000));
					break;
				default:
					break;
				}
			}

			DoMeleeAttackIfReady();
		}

	};

	CreatureAI* GetAI(Creature* p_Creature) const override
	{
		return new npc_obsidionAI(p_Creature);
	}
};


class go_altar_of_suntara : public GameObjectScript
{
public:
	go_altar_of_suntara() : GameObjectScript("go_altar_of_suntara") { }

	enum eMisc
	{
		// Quest
		QUEST_RISE_OBSIDION = 28056,

		// NPC
		NPC_LATHORIC		= 8391,

		// Gossip
		GOSSIP_MENU			= 1282,
		NPC_TEXT			= 1918,
		GOSSIP_OPTION		= 0,
	};

	Position LathoricSpawn = { -6460.42f, -1267.61f, 180.784f, 3.0249f };

	bool OnGossipHello(Player* player, GameObject* go)
	{
		if (player->GetQuestStatus(QUEST_RISE_OBSIDION) == QUEST_STATUS_INCOMPLETE)
			player->ADD_GOSSIP_ITEM_DB(GOSSIP_MENU, GOSSIP_OPTION, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF);
			player->SEND_GOSSIP_MENU(NPC_TEXT, go->GetGUID());
		return true;
	}

	bool OnGossipSelect(Player* p_Player, GameObject* p_GameObject, uint32 p_Sender, uint32 p_Action)
	{
		p_Player->PlayerTalkClass->ClearMenus();
		if (p_Action == GOSSIP_ACTION_INFO_DEF)
		{
			p_Player->CLOSE_GOSSIP_MENU();
			if (Creature* lathoric = p_Player->SummonCreature(NPC_LATHORIC, LathoricSpawn, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 120000))
			{
				lathoric->AI()->Talk(0); // You are here to stop the Archduke?
				lathoric->GetMotionMaster()->MoveSmoothPath(MaxLathoricMoves, g_LathoricMoves.data(), g_LathoricMoves.size(), true);
			}	
		}

		return true;
	}
};


void AddSC_searing_gorge()
{
	/// Rise, Obsidion [Q]
	new npc_lathorick_the_black();
	new npc_obsidion();
	new go_altar_of_suntara();


}