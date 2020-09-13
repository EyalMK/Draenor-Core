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


/// Rainbow Bunny - 67247
class npc_rainbow_bunny : public CreatureScript
{
public:
	npc_rainbow_bunny() : CreatureScript("npc_rainbow_bunny") { }

	enum eData
	{
		/// Quests
		QUEST_OPEN_THEIR_EYES = 28288,

		/// Npcs
		NPC_JADEFIRE_IMP = 47369,
		NPC_KILL_CREDIT	 = 48227,

		/// Spells
		SPELL_TERRIFYING_RAINBOW = 88509, // Triggers 89620

		/// Event
		EVENT_CHECK_IMP = 0,
	};


	struct npc_rainbow_bunnyAI : public ScriptedAI
	{
		npc_rainbow_bunnyAI(Creature* p_Creature) : ScriptedAI(p_Creature) {
			m_PlayerGuid = 0;
		}

		EventMap m_CosmeticEvents;
		EventMap m_Events;
		uint64 m_PlayerGuid;

		void Reset() override
		{
			// Reset Events
			m_Events.Reset();
			ClearDelayedOperations();

			// Check for Players
			m_CosmeticEvents.ScheduleEvent(EVENT_CHECK_IMP, 0.5 * TimeConstants::IN_MILLISECONDS);
		}

		void IsSummonedBy(Unit* summoner) override
		{
			if (Player* player = summoner->ToPlayer())
				if (player->GetQuestStatus(QUEST_OPEN_THEIR_EYES) == QUEST_STATUS_INCOMPLETE)
					m_PlayerGuid = player->GetGUID();
		}

		void UpdateAI(const uint32 p_Diff) override
		{

			UpdateOperations(p_Diff);

			m_Events.Update(p_Diff);

			m_CosmeticEvents.Update(p_Diff);

			switch (m_Events.ExecuteEvent()) {}

			switch (m_CosmeticEvents.ExecuteEvent())
			{
			case EVENT_CHECK_IMP:
			{
				/// Place JadeFire Imps inside a list
				std::list<Creature*> ImpsInRange;
				me->GetCreatureListWithEntryInGrid(ImpsInRange, NPC_JADEFIRE_IMP, 7.0f);

				/// Iterate the list and check if the iteration has the fear aura, if not, it'll cast fear and make the iteration yell - and then, it's going the player who summoned the rainbow kill credit.
				for (std::list<Creature*>::const_iterator itr = ImpsInRange.begin(); itr != ImpsInRange.end(); ++itr)
				{
					if (!(*itr)->HasAura(SPELL_TERRIFYING_RAINBOW))
					{
						(*itr)->CastSpell((*itr), SPELL_TERRIFYING_RAINBOW, true);
						(*itr)->AI()->Talk(0);
						(*itr)->DespawnOrUnsummon(5000);

						if (Player* player = ObjectAccessor::GetPlayer(*me, m_PlayerGuid))
							player->KilledMonsterCredit(NPC_KILL_CREDIT);
					}
				}
			}
			}
		}
	};

	CreatureAI* GetAI(Creature* p_Creature) const override
	{
		return new npc_rainbow_bunnyAI(p_Creature);
	}

};



/// Impsy - 47339
// Not Final - Check Todos at the end of the script in SpellHit.
class npc_impsy_47339 : public CreatureScript
{
public:
	npc_impsy_47339() : CreatureScript("npc_impsy_47339") { }

	enum eMisc
	{
		/// Quest
		QUEST_DO_IMP_POSSIBLE = 28000,

		/// Npcs
		NPC_KILL_CREDIT = 47365,

		/// Spells
		SPELL_ENCHANTED_IMP_SACK = 88354,
		SPELL_ENCHANTED_SACK_CAPTURED = 88330,
	};

	struct npc_impsy_47339AI : public ScriptedAI
	{
		npc_impsy_47339AI(Creature* creature) : ScriptedAI(creature) {
			m_PlayerGUID = 0;
		}

		uint64 m_PlayerGUID;
		uint8 counter;

		void Reset() override
		{
			counter = 0;
		}

		void EnterCombat(Unit* p_Attacker) override
		{
			me->AI()->Talk(0);

			if (Player* player = p_Attacker->ToPlayer())
				if (player->GetQuestStatus(QUEST_DO_IMP_POSSIBLE) == QUEST_STATUS_INCOMPLETE)
					m_PlayerGUID = player->GetGUID();
		}

		void DamageTaken(Unit* doneBy, uint32& damage, SpellInfo const*  /*p_SpellInfo*/) override
		{
			if (Player* player = doneBy->ToPlayer())
			{
				if (player->GetQuestStatus(QUEST_DO_IMP_POSSIBLE) == QUEST_STATUS_INCOMPLETE)
				{
					if (me->GetHealth() <= damage || me->GetHealth() <= 20.0f)
					{
						damage = 0;
						if (counter == 0)
						{
							me->AI()->Talk(1);
							me->AI()->Talk(2);
							counter++;
						}
					}
				}
				else
				{
					if (me->GetHealth() <= damage || me->GetHealth() <= 1.0f)
						damage = 0;
				}
			}
		}

		void SpellHit(Unit* Caster, SpellInfo const* spell) override
		{
			if (spell->Id == SPELL_ENCHANTED_IMP_SACK)
			{
				if (me->GetHealth() <= 20.0f)
				{
					me->DespawnOrUnsummon(500);
					if (Player* player = ObjectAccessor::GetPlayer(*me, m_PlayerGUID))
					{
						player->KilledMonsterCredit(NPC_KILL_CREDIT);
						player->CastSpell(player, SPELL_ENCHANTED_SACK_CAPTURED, true);
						// Find how to apply the bag on the player's equipment - probably a spell that summons the Impsy Bunny npc
						// Schedule events for Impsy to talk (the bag)
						// Fix invisibility detection for the Impsy near the npc, the one that appears when the quest is turned in.
					}
				}
			}
		}

	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_impsy_47339AI(creature);
	}

};


void AddSC_felwood()
{
	new npc_rainbow_bunny();
	new npc_impsy_47339();
}
