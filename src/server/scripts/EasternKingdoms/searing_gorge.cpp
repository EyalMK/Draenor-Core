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
		}

		void JustSummoned(Creature* /*summoner*/) override
		{
			Talk(0); // You are here to stop the Archduke?
			me->GetMotionMaster()->MovePath(839100, false); // Path 8391 * 100 in waypoint_data
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
					Obsidion->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IN_COMBAT);

					Obsidion->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_NPC);
					Obsidion->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PC);
					Obsidion->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_UNK_15);
					Obsidion->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_UNK_29);
					Obsidion->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_UNK_16);
					Obsidion->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);

					// Attack nearest player
					Player* player = me->FindNearestPlayer(10.0f, true);
					me->CombatStart(player, true);
					Obsidion->CombatStart(player);
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
					case EVENT_SHADOW_BOLT:
					{
						DoCastVictim(SPELL_SHADOW_BOLT, true);
						m_events.ScheduleEvent(EVENT_SHADOW_BOLT, urand(3400, 4700));
						break;
					}
				}
			}
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
			me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_NPC);
			me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PC);
			me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_UNK_15);
			me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_UNK_29);
			me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_UNK_16);
			me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
		}

		void EnterCombat(Unit* victim) override
		{
			m_events.ScheduleEvent(EVENT_FLAME_BLAST, urand(3000, 4000));
		}


		void UpdateAI(uint32 diff) override
		{
			m_events.Update(diff);

			while (uint32 eventId = m_events.ExecuteEvent())
			{
				switch (eventId)
				{
					case EVENT_FLAME_BLAST:
					{
						DoCastVictim(SPELL_FLAME_BLAST, true);
						m_events.ScheduleEvent(EVENT_FLAME_BLAST, urand(20000, 21000));
						break;
					}
				}
			}
		}

	};

	CreatureAI* GetAI(Creature* p_Creature) const override
	{
		return new npc_obsidionAI(p_Creature);
	}
};

void AddSC_searing_gorge()
{
	new npc_lathorick_the_black();
	new npc_obsidion();
}