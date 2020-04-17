////////////////////////////////////////////////////////////////////////////////
//
// Project-Hellscream https://hellscream.org
// Copyright (C) 2018-2020 Project-Hellscream-6.2
// Discord https://discord.gg/CWCF3C9
//
////////////////////////////////////////////////////////////////////////////////

/* ScriptData
SDName: Teldrassil
SD%Complete: 100
SDComment: Quest support: 938
SDCategory: Teldrassil
EndScriptData */

/* ContentData
npc_mist
EndContentData */

#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "ScriptedFollowerAI.h"

/*####
# npc_mist
####*/

enum Mist
{
    SAY_AT_HOME             = -1000323,
    EMOTE_AT_HOME           = -1000324,
    QUEST_MIST              = 938,
    NPC_ARYNIA              = 3519,
    FACTION_DARNASSUS       = 79
};

class npc_mist : public CreatureScript
{
public:
    npc_mist() : CreatureScript("npc_mist") { }

    bool OnQuestAccept(Player* player, Creature* creature, Quest const* quest)
    {
        if (quest->GetQuestId() == QUEST_MIST)
            if (npc_mistAI* pMistAI = CAST_AI(npc_mist::npc_mistAI, creature->AI()))
                pMistAI->StartFollow(player, FACTION_DARNASSUS, quest);

        return true;
    }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_mistAI(creature);
    }

    struct npc_mistAI : public FollowerAI
    {
        npc_mistAI(Creature* creature) : FollowerAI(creature) { }

        void Reset() { }

        void MoveInLineOfSight(Unit* who)
        {
            FollowerAI::MoveInLineOfSight(who);

            if (!me->getVictim() && !HasFollowState(STATE_FOLLOW_COMPLETE) && who->GetEntry() == NPC_ARYNIA)
            {
                if (me->IsWithinDistInMap(who, 10.0f))
                {
                    DoScriptText(SAY_AT_HOME, who);
                    DoComplete();
                }
            }
        }

        void DoComplete()
        {
            DoScriptText(EMOTE_AT_HOME, me);

            Player* player = GetLeaderForFollower();
            if (player && player->GetQuestStatus(QUEST_MIST) == QUEST_STATUS_INCOMPLETE)
                player->GroupEventHappens(QUEST_MIST, me);

            //The follow is over (and for later development, run off to the woods before really end)
            SetFollowComplete();
        }

    };

};


/// Moonwell Bunny - 34575
class npc_moonwell_bunny : public CreatureScript
{
public:
	npc_moonwell_bunny() : CreatureScript("npc_moonwell_bunny") { }

	enum eData
	{
		// Quests
		QUEST_CROWN_OF_AZEROTH		= 28729,
		QUEST_PASSING_AWARENESS		= 28731,
		QUEST_REFUSAL_OF_ASPECTS	= 929,
		QUEST_BURDEN_OF_KALDOREI	= 7383,
		QUEST_COMING_DAWN			= 933,

		// Npcs
		NPC_SHADE_OF_KALDOREI_SHADOWGLEN  = 34574,
		NPC_SHADE_OF_KALDOREI_DOLANAAR	  = 34586,
		NPC_SHADE_OF_KALDOREI_STARBREEZE  = 34583,
		NPC_SHADE_OF_KALDOREI_ORACLEGLADE = 34584,
		NPC_SHADE_OF_KALDOREI_ARLITHRIEN  = 34585,

		// AreaIds
		AREAID_SHADOWGLEN  = 188,
		AREAID_DOLANAAR	   = 186,
		AREAID_STARBREEZE  = 260,
		AREAID_ORACLEGLADE = 264,
		AREAID_ARLITHRIEN  = 478,

		// Event
		EVENT_CHECK_PLAYER = 0,

		// Actions
		CHECK_FOR_SHADE = 0,
		SUMMON_SHADE_OF_KALDOREI = 1,

	};


	struct npc_moonwell_bunnyAI : public ScriptedAI
	{
		npc_moonwell_bunnyAI(Creature* p_Creature) : ScriptedAI(p_Creature) { }

		EventMap m_CosmeticEvents;
		EventMap m_Events;

		// Lists
		std::list<Player*> PlayersInRange;
		std::list<uint32> Quests;
		std::list<uint32> ShadesOfKaldorei;
		
		// Positions of Shades
		Position const l_ShadeShadowGlen  = {	10702.7f, 761.221f, 1322.88f, 3.0f	};
		Position const l_ShadeDolanaar	  = {	9735.41f, 963.216f, 1295.47f, 6.0f	};
		Position const l_ShadeStarbreeze  = {	9866.76f, 591.828f, 1302.09f, 3.7194f };
		Position const l_ShadeOracleGlade = {	10669.2f, 1855.89f, 1325.84f, 2.8f	};
		Position const l_ShadeArlithrien  = {	9556.4941f, 1648.8970f, 1300.9762f, 1.735402f };

		void Reset()
		{
			// Push Quest IDs into list
			Quests.push_back(QUEST_CROWN_OF_AZEROTH);
			Quests.push_back(QUEST_PASSING_AWARENESS);
			Quests.push_back(QUEST_REFUSAL_OF_ASPECTS);
			Quests.push_back(QUEST_BURDEN_OF_KALDOREI);
			Quests.push_back(QUEST_COMING_DAWN);

			// Push Npc IDs into list
			ShadesOfKaldorei.push_back(NPC_SHADE_OF_KALDOREI_SHADOWGLEN);
			ShadesOfKaldorei.push_back(NPC_SHADE_OF_KALDOREI_DOLANAAR);
			ShadesOfKaldorei.push_back(NPC_SHADE_OF_KALDOREI_STARBREEZE);
			ShadesOfKaldorei.push_back(NPC_SHADE_OF_KALDOREI_ORACLEGLADE);
			ShadesOfKaldorei.push_back(NPC_SHADE_OF_KALDOREI_ARLITHRIEN);

			// Reset Events
			m_Events.Reset();
			ClearDelayedOperations();

			// Check for Players
			m_CosmeticEvents.ScheduleEvent(EVENT_CHECK_PLAYER, 1 * TimeConstants::IN_MILLISECONDS);

		}


		void DoAction(int32 const p_Action)
		{
			switch (p_Action)
			{
				case CHECK_FOR_SHADE:
				{
					for (uint32 Shade : ShadesOfKaldorei)
						if (me->FindNearestCreature(Shade, 10.0f, true))
							break; // If Shade is found, break loop - event ongoing

					m_CosmeticEvents.ScheduleEvent(SUMMON_SHADE_OF_KALDOREI, 0.2 * TimeConstants::IN_MILLISECONDS); // Else summon shade
					break;
				}
				default:
					break;
			}
		}

		void UpdateAI(const uint32 p_Diff) override
		{

			UpdateOperations(p_Diff);

			m_Events.Update(p_Diff);

			m_CosmeticEvents.Update(p_Diff);

			switch (m_Events.ExecuteEvent()) {}

			switch (m_CosmeticEvents.ExecuteEvent())
			{
				case EVENT_CHECK_PLAYER:
				
					me->GetPlayerListInGrid(PlayersInRange, 10.0f);
					for (Player* p_Player : PlayersInRange)
						for (uint32 Quest : Quests)
							if (p_Player->GetQuestStatus(Quest) == QUEST_STATUS_INCOMPLETE)
							{
								DoAction(CHECK_FOR_SHADE);
							}
					break;
				case SUMMON_SHADE_OF_KALDOREI:						
						// Creature texts and events are handled in SmartAI
						if (me->GetAreaId() == AREAID_SHADOWGLEN)
							Creature* Shade = me->SummonCreature(NPC_SHADE_OF_KALDOREI_SHADOWGLEN, l_ShadeShadowGlen, TEMPSUMMON_MANUAL_DESPAWN); 
						if (me->GetAreaId() == AREAID_DOLANAAR)
							Creature* Shade = me->SummonCreature(NPC_SHADE_OF_KALDOREI_DOLANAAR, l_ShadeDolanaar, TEMPSUMMON_MANUAL_DESPAWN);
						if (me->GetAreaId() == AREAID_STARBREEZE)
							Creature* Shade = me->SummonCreature(NPC_SHADE_OF_KALDOREI_STARBREEZE, l_ShadeStarbreeze, TEMPSUMMON_MANUAL_DESPAWN);
						if (me->GetAreaId() == AREAID_ORACLEGLADE)
							Creature* Shade = me->SummonCreature(NPC_SHADE_OF_KALDOREI_ORACLEGLADE, l_ShadeOracleGlade, TEMPSUMMON_MANUAL_DESPAWN);
						if (me->GetAreaId() == AREAID_ARLITHRIEN)
							Creature* Shade = me->SummonCreature(NPC_SHADE_OF_KALDOREI_ARLITHRIEN, l_ShadeArlithrien, TEMPSUMMON_MANUAL_DESPAWN);
						break;

			}

		}
	
	};

	CreatureAI* GetAI(Creature* p_Creature) const override
	{
		return new npc_moonwell_bunnyAI(p_Creature);
	}

};

#ifndef __clang_analyzer__
void AddSC_teldrassil()
{
    new npc_mist();
	new npc_moonwell_bunny();
}
#endif
