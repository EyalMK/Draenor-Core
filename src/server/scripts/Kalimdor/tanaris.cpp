////////////////////////////////////////////////////////////////////////////////
//
// Project-Hellscream https://hellscream.org
// Copyright (C) 2018-2020 Project-Hellscream-6.2
// Discord https://discord.gg/CWCF3C9
//
////////////////////////////////////////////////////////////////////////////////

/* ScriptData
SDName: Tanaris
SD%Complete: 80
SDComment: Quest support: 648, 10277, 10279(Special flight path).
SDCategory: Tanaris
EndScriptData */

/* ContentData
npc_custodian_of_time
npc_steward_of_time
npc_OOX17
EndContentData */

#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "ScriptedGossip.h"
#include "ScriptedEscortAI.h"
#include "ScriptedFollowerAI.h"

/*######
## npc_custodian_of_time
######*/

enum CustodianOfTime
{
    WHISPER_CUSTODIAN_1     = 0,
    WHISPER_CUSTODIAN_2     = 1,
    WHISPER_CUSTODIAN_3     = 2,
    WHISPER_CUSTODIAN_4     = 3,
    WHISPER_CUSTODIAN_5     = 4,
    WHISPER_CUSTODIAN_6     = 5,
    WHISPER_CUSTODIAN_7     = 6,
    WHISPER_CUSTODIAN_8     = 7,
    WHISPER_CUSTODIAN_9     = 8,
    WHISPER_CUSTODIAN_10    = 9,
    WHISPER_CUSTODIAN_11    = 10,
    WHISPER_CUSTODIAN_12    = 11,
    WHISPER_CUSTODIAN_13    = 12,
    WHISPER_CUSTODIAN_14    = 13
};

class npc_custodian_of_time : public CreatureScript
{
public:
    npc_custodian_of_time() : CreatureScript("npc_custodian_of_time") { }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_custodian_of_timeAI(creature);
    }

    struct npc_custodian_of_timeAI : public npc_escortAI
    {
        npc_custodian_of_timeAI(Creature* creature) : npc_escortAI(creature) {}

        void WaypointReached(uint32 waypointId)
        {
            if (Player* player = GetPlayerForEscort())
            {
                switch (waypointId)
                {
                case 0:
                    Talk(WHISPER_CUSTODIAN_1, player->GetGUID());
                    break;
                case 1:
                    Talk(WHISPER_CUSTODIAN_2, player->GetGUID());
                    break;
                case 2:
                    Talk(WHISPER_CUSTODIAN_3, player->GetGUID());
                    break;
                case 3:
                    Talk(WHISPER_CUSTODIAN_4, player->GetGUID());
                    break;
                case 5:
                    Talk(WHISPER_CUSTODIAN_5, player->GetGUID());
                    break;
                case 6:
                    Talk(WHISPER_CUSTODIAN_6, player->GetGUID());
                    break;
                case 7:
                    Talk(WHISPER_CUSTODIAN_7, player->GetGUID());
                    break;
                case 8:
                    Talk(WHISPER_CUSTODIAN_8, player->GetGUID());
                    break;
                case 9:
                    Talk(WHISPER_CUSTODIAN_9, player->GetGUID());
                    break;
                case 10:
                    Talk(WHISPER_CUSTODIAN_4, player->GetGUID());
                    break;
                case 13:
                    Talk(WHISPER_CUSTODIAN_10, player->GetGUID());
                    break;
                case 14:
                    Talk(WHISPER_CUSTODIAN_4, player->GetGUID());
                    break;
                case 16:
                    Talk(WHISPER_CUSTODIAN_11, player->GetGUID());
                    break;
                case 17:
                    Talk(WHISPER_CUSTODIAN_12, player->GetGUID());
                    break;
                case 18:
                    Talk(WHISPER_CUSTODIAN_4, player->GetGUID());
                    break;
                case 22:
                    Talk(WHISPER_CUSTODIAN_13, player->GetGUID());
                    break;
                case 23:
                    Talk(WHISPER_CUSTODIAN_4, player->GetGUID());
                    break;
                case 24:
                    Talk(WHISPER_CUSTODIAN_14, player->GetGUID());
                    DoCast(player, 34883);
                    // below here is temporary workaround, to be removed when spell works properly
                    player->AreaExploredOrEventHappens(10277);
                    break;
                }
            }
        }

        void MoveInLineOfSight(Unit* who)
        {
            if (HasEscortState(STATE_ESCORT_ESCORTING))
                return;

            if (who->IsPlayer())
            {
                if (who->HasAura(34877) && CAST_PLR(who)->GetQuestStatus(10277) == QUEST_STATUS_INCOMPLETE)
                {
                    float Radius = 10.0f;
                    if (me->IsWithinDistInMap(who, Radius))
                    {
                        Start(false, false, who->GetGUID());
                    }
                }
            }
        }

        void EnterCombat(Unit* /*who*/) {}
        void Reset() {}

        void UpdateAI(const uint32 diff)
        {
            npc_escortAI::UpdateAI(diff);
        }
    };

};

/*######
## npc_steward_of_time
######*/

#define GOSSIP_ITEM_FLIGHT  "Please take me to the master's lair."

class npc_steward_of_time : public CreatureScript
{
public:
    npc_steward_of_time() : CreatureScript("npc_steward_of_time") { }

    bool OnQuestAccept(Player* player, Creature* /*creature*/, Quest const* quest)
    {
        if (quest->GetQuestId() == 10279)                      //Quest: To The Master's Lair
            player->CastSpell(player, 34891, true);               //(Flight through Caverns)

        return false;
    }

    bool OnGossipSelect(Player* player, Creature* /*creature*/, uint32 /*sender*/, uint32 action)
    {
        player->PlayerTalkClass->ClearMenus();
        if (action == GOSSIP_ACTION_INFO_DEF + 1)
            player->CastSpell(player, 34891, true);               //(Flight through Caverns)

        return true;
    }

    bool OnGossipHello(Player* player, Creature* creature)
    {
        if (creature->isQuestGiver())
            player->PrepareQuestMenu(creature->GetGUID());

        if (player->GetQuestStatus(10279) == QUEST_STATUS_INCOMPLETE || player->GetQuestRewardStatus(10279))
        {
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ITEM_FLIGHT, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
            player->SEND_GOSSIP_MENU(9978, creature->GetGUID());
        }
        else
            player->SEND_GOSSIP_MENU(9977, creature->GetGUID());

        return true;
    }

};

/*######
## npc_OOX17
######*/

enum Npc00X17
{
    //texts are signed for 7806
    SAY_OOX_START           = -1000287,
    SAY_OOX_AGGRO1          = -1000288,
    SAY_OOX_AGGRO2          = -1000289,
    SAY_OOX_AMBUSH          = -1000290,
    SAY_OOX17_AMBUSH_REPLY  = -1000291,
    SAY_OOX_END             = -1000292,

    Q_OOX17                 = 648,
    SPAWN_FIRST             = 7803,
    SPAWN_SECOND_1          = 5617,
    SPAWN_SECOND_2          = 7805
};

class npc_OOX17 : public CreatureScript
{
public:
    npc_OOX17() : CreatureScript("npc_OOX17") { }

    bool OnQuestAccept(Player* player, Creature* creature, Quest const* quest)
    {
        if (quest->GetQuestId() == Q_OOX17)
        {
            creature->setFaction(113);
            creature->SetFullHealth();
            creature->SetUInt32Value(UNIT_FIELD_ANIM_TIER, 0);
            creature->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PC);
            DoScriptText(SAY_OOX_START, creature);

            if (npc_escortAI* pEscortAI = CAST_AI(npc_OOX17::npc_OOX17AI, creature->AI()))
                pEscortAI->Start(true, false, player->GetGUID());
        }
        return true;
    }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_OOX17AI(creature);
    }

    struct npc_OOX17AI : public npc_escortAI
    {
        npc_OOX17AI(Creature* creature) : npc_escortAI(creature) {}

        void WaypointReached(uint32 waypointId)
        {
            if (Player* player = GetPlayerForEscort())
            {
                switch (waypointId)
                {
                    case 23:
                        me->SummonCreature(SPAWN_FIRST, -8350.96f, -4445.79f, 10.10f, 6.20f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 25000);
                        me->SummonCreature(SPAWN_FIRST, -8355.96f, -4447.79f, 10.10f, 6.27f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 25000);
                        me->SummonCreature(SPAWN_FIRST, -8353.96f, -4442.79f, 10.10f, 6.08f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 25000);
                        DoScriptText(SAY_OOX_AMBUSH, me);
                        break;
                    case 56:
                        me->SummonCreature(SPAWN_SECOND_1, -7510.07f, -4795.50f, 9.35f, 6.06f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 25000);
                        me->SummonCreature(SPAWN_SECOND_2, -7515.07f, -4797.50f, 9.35f, 6.22f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 25000);
                        me->SummonCreature(SPAWN_SECOND_2, -7518.07f, -4792.50f, 9.35f, 6.22f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 25000);
                        DoScriptText(SAY_OOX_AMBUSH, me);
                        if (Unit* scoff = me->FindNearestCreature(SPAWN_SECOND_2, 30))
                            DoScriptText(SAY_OOX17_AMBUSH_REPLY, scoff);
                        break;
                    case 86:
                        DoScriptText(SAY_OOX_END, me);
                        player->GroupEventHappens(Q_OOX17, me);
                        break;
                }
            }
        }

        void Reset(){}

        void EnterCombat(Unit* /*who*/)
        {
            DoScriptText(RAND(SAY_OOX_AGGRO1, SAY_OOX_AGGRO2), me);
        }

        void JustSummoned(Creature* summoned)
        {
            summoned->AI()->AttackStart(me);
        }
    };
};

/// Dunemaul ogres - 5471, 5472, 5473, 5474, 5475
class npc_dunemaul_ogres_unchartered : public CreatureScript
{
public:
	npc_dunemaul_ogres_unchartered() : CreatureScript("npc_dunemaul_ogres_unchartered") { }

	enum eMisc
	{
		// Gossip Menus
		GOSSIP_MENU_ID	= 11093,
		GOSSIP_OPTION	= 0,
		NPC_TEXT		= 15435,

		// Quest
		QUEST_UNCHARTERED = 24955,
		KILL_CREDIT		  = 38848,
	};

	bool OnGossipSelect(Player* player, Creature* creature, uint32 /*sender*/, uint32 action)
	{
		player->PlayerTalkClass->ClearMenus();
		if (action == GOSSIP_ACTION_INFO_DEF + 1)
		{
			player->CLOSE_GOSSIP_MENU();
			player->KilledMonsterCredit(KILL_CREDIT);
			creature->SetFacingToObject(player);
			creature->AI()->Talk(1);
			creature->RemoveFlag(UNIT_FIELD_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP);
			creature->ForcedDespawn(3000);
		}
			

		return true;
	}

	bool OnGossipHello(Player* player, Creature* creature)
	{
		if (player->GetQuestStatus(QUEST_UNCHARTERED) == QUEST_STATUS_INCOMPLETE)
		{
			player->ADD_GOSSIP_ITEM_DB(GOSSIP_MENU_ID, GOSSIP_OPTION, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
			player->SEND_GOSSIP_MENU(NPC_TEXT, creature->GetGUID());
		}
		else
			player->SEND_GOSSIP_MENU(NPC_TEXT, creature->GetGUID());

		return true;
	}

};


/// Megs Dreadshredder - 38849
class npc_megs_dreadshredder_38849: public CreatureScript
{
public:
	npc_megs_dreadshredder_38849() : CreatureScript("npc_megs_dreadshredder_38849") { }

	enum eMisc
	{
		// Quest
		QUEST_UNCHARTERED	= 24955,

		// Npc
		NPC_DUNEMAUL_EMISSARY = 38856,

		// Actions
		QuestComplete		= 0,
	};

	bool OnQuestComplete(Player* player, Creature* creature, Quest const* quest) override
	{
		if (quest->GetQuestId() == QUEST_UNCHARTERED)
		{
			creature->GetAI()->DoAction(QuestComplete);
		}
		

		return true;
	}

	struct npc_megs_dreadshredder_38849AI : public ScriptedAI
	{
		npc_megs_dreadshredder_38849AI(Creature* creature) : ScriptedAI(creature) {}

		EventMap m_CosmeticEvents;
		EventMap m_Events;

		void Reset() override
		{
			m_Events.Reset();
			ClearDelayedOperations();
		}


		void UpdateAI(uint32 const p_Diff) override
		{
			UpdateOperations(p_Diff);
		}


		void DoAction(int32 const p_Action) override
		{
			switch (p_Action)
			{
				case QuestComplete:
					AddTimedDelayedOperation(0.5 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->AI()->Talk(0);
					});
					AddTimedDelayedOperation(7 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						if (Creature* ogre = me->FindNearestCreature(NPC_DUNEMAUL_EMISSARY, 10.0f, true))
							ogre->AI()->Talk(0);
					});
					AddTimedDelayedOperation(11 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->AI()->Talk(1); // Sighs
					});
					AddTimedDelayedOperation(15 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->AI()->Talk(2); // WHAT OGRE LIKE.
					});
					AddTimedDelayedOperation(20 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						if (Creature* ogre = me->FindNearestCreature(NPC_DUNEMAUL_EMISSARY, 10.0f, true))
							ogre->AI()->Talk(1); // Oh. Ogre like eat bug.
					});
					AddTimedDelayedOperation(24 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->AI()->Talk(3); // The Silithid?
					});
					break;
				default:
					break;
			}
		}

	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_megs_dreadshredder_38849AI(creature);
	}

};




/// Thunderdrome Quest Chain
enum ThunderDromeData
{
	/// Quests
	QUEST_THUNDERDROME_GRUDGE_MATCH_ALLIANCE = 25513,
	QUEST_THUNDERDROME_GRUDGE_MATCH_HORDE	 = 25591,
	QUEST_THUNDERDROME_SARINEXX				 = 25095,
	QUEST_THUNDERDROME_THE_GINORMOUS		 = 25067,
	QUEST_THUNDERDROME_ZUMONGA				 = 25094,


	/// Npcs
	NPC_DR_DEALWELL			= 39034,
	NPC_LORD_GINORMOUS		= 39075,
	NPC_ZUMONGA				= 39148,
	NPC_SARINEXX			= 39149,
	NPC_MEGS_DREADSHREDDER	= 40542,
	NPC_KELSEY_STEELSPARK	= 40876,

	/// Spells

	// Megs Deadshredder Spells
	SPELL_FLAME_WAVE			= 76735,
	SPELL_STOP_POKING_ME		= 76091,
	SPELL_SUMMON_DREADSHREDDER	= 76746,
	SPELL_FLAMETHROWER			= 76804,
	SPELL_SAWBLADE				= 76764,

	// Kelsey Steelspark Spells
	SPELL_CHAINED_SPARKS		= 76732,
	SPELL_SUMMON_STEELSPARK		= 76749,
	SPELL_FORKED_LIGHTNING		= 76843,
	SPELL_SPARK_EFFECT			= 76850,
	// Kelsey also uses Stop Poking Me

	// The Ginormus
	SPELL_SUMMON_DOGS_OF_WAR	= 73854,
	SPELL_SKULL_WHACK			= 73855,

	// Sarinexx
	SPELL_SAND_TRAP				= 83730,
	SPELL_WIDE_SLASH			= 73863,

	// Zumonga
	SPELL_HEADBUTT				= 73859,
	SPELL_TASTE_OF_BLOOD		= 73858,


	/// Actions
	ACCEPTED_THE_GINORMOUS			 = 0,
	ACCEPTED_SARINEXX				 = 1,
	ACCEPTED_ZUMONGA				 = 2,
	ACCEPTED_GRUDGE_MATCH			 = 3,


	/// Events
	START_EVENT_GINORMOUS				= 0,
	START_EVENT_SARINEXX				= 1,
	START_EVENT_ZUMONGA					= 2,
	START_EVENT_GRUDGE_MATCH			= 3,

	// Grudge Match
	EVENT_FORKED_LIGHTNING				= 4,
	EVENT_SPARK_EFFECT_CHASE			= 5,
	EVENT_FLAMETHROWER					= 6,
	EVENT_SAWBLADE						= 7,
	EVENT_CHAINED_SPARKS				= 8,
	EVENT_FLAME_WAVE					= 9,

	// The Ginormus
	EVENT_SUMMON_DOGS_OF_WAR			= 10,
	EVENT_SKULL_WHACK					= 11,
	
	// Sarinexx
	EVENT_SAND_TRAP						= 12,
	EVENT_WIDE_SLASH					= 13,

	// Zumonga
	EVENT_HEADBUTT						= 14,
	EVENT_TASTE_OF_BLOOD				= 15,



};

/// Dr.Dealwell - 39034
class npc_dr_dealwell : public CreatureScript
{
public:
	npc_dr_dealwell() : CreatureScript("npc_dr_dealwell") { }
	
	bool OnQuestAccept(Player* player, Creature* creature, Quest const* quest) override
	{
		if (quest->GetQuestId() == QUEST_THUNDERDROME_THE_GINORMOUS)
		{
			creature->GetAI()->DoAction(ACCEPTED_THE_GINORMOUS);
			creature->AI()->Talk(0, player->GetGUID()); // Into the Thunderdrome, $n! There's no getting out...
		}
		if (quest->GetQuestId() == QUEST_THUNDERDROME_SARINEXX)
		{
			creature->GetAI()->DoAction(ACCEPTED_SARINEXX);
			creature->AI()->Talk(0, player->GetGUID());
		}
		if (quest->GetQuestId() == QUEST_THUNDERDROME_ZUMONGA)
		{
			creature->GetAI()->DoAction(ACCEPTED_ZUMONGA);
			creature->AI()->Talk(0, player->GetGUID());
		}
		if (player->GetTeamId() == TEAM_ALLIANCE && quest->GetQuestId() == QUEST_THUNDERDROME_GRUDGE_MATCH_ALLIANCE)
		{
			creature->GetAI()->DoAction(ACCEPTED_GRUDGE_MATCH);
			creature->AI()->Talk(0, player->GetGUID());
		}
		if (player->GetTeamId() == TEAM_HORDE && quest->GetQuestId() == QUEST_THUNDERDROME_GRUDGE_MATCH_HORDE)
		{
			creature->GetAI()->DoAction(ACCEPTED_GRUDGE_MATCH);
			creature->AI()->Talk(0, player->GetGUID());
		}

		return true;
	}

	struct npc_dr_dealwellAI : public ScriptedAI
	{
		npc_dr_dealwellAI(Creature* creature) : ScriptedAI(creature) {}

		EventMap m_CosmeticEvents;
		EventMap m_Events;
		
		// Center of Thunderdrome arena
		Position l_Pos = { -7140.3511f, -3786.8828f, 8.9675f, 5.984621f};

		void Reset() override
		{
			m_Events.Reset();
			ClearDelayedOperations();
		}


		void UpdateAI(uint32 const p_Diff) override
		{
			UpdateOperations(p_Diff);


		}


		void DoAction(int32 const p_Action) override
		{
			switch (p_Action)
			{
				case ACCEPTED_THE_GINORMOUS:
					AddTimedDelayedOperation(7 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						Talk(1); // Any Ladies and Gentlemen...	THE GINORMUS!
					});
					AddTimedDelayedOperation(17 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->SummonCreature(NPC_LORD_GINORMOUS, l_Pos, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 180000);
					});
					break;
				case ACCEPTED_SARINEXX:
					AddTimedDelayedOperation(7 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						Talk(3); // The faint of heart... SARINEXX!
					});
					AddTimedDelayedOperation(17 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->SummonCreature(NPC_SARINEXX, l_Pos, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 180000);
					});
					break;
				case ACCEPTED_ZUMONGA:
					AddTimedDelayedOperation(7 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						Talk(5); // Our next fighter... ZUMONGA!
					});

					AddTimedDelayedOperation(17 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->SummonCreature(NPC_ZUMONGA, l_Pos, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 180000);
					});
					break;
				case ACCEPTED_GRUDGE_MATCH:
					AddTimedDelayedOperation(10 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						Creature* Kelsey = me->SummonCreature(NPC_KELSEY_STEELSPARK, l_Pos, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 180000);

						// Place Megs infront of Kelsey
						GetPositionWithDistInFront(Kelsey, 2.5f, l_Pos);
						float z = Kelsey->GetMap()->GetHeight(Kelsey->GetPhaseMask(), l_Pos.GetPositionX(), l_Pos.GetPositionY(), l_Pos.GetPositionZ());
						l_Pos.m_positionZ = z;

						Creature* Megs = me->SummonCreature(NPC_MEGS_DREADSHREDDER, l_Pos, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 180000);
					});

					break;

				default:
					break;
			}
		}

	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_dr_dealwellAI(creature);
	}

};



/// Lord Ginormus - 39075
class npc_lord_ginormus : public CreatureScript
{
public:
	npc_lord_ginormus() : CreatureScript("npc_lord_ginormus") { }

	struct npc_lord_ginormusAI : public ScriptedAI
	{
		npc_lord_ginormusAI(Creature* creature) : ScriptedAI(creature) {}


		// Center of Thunderdrome arena
		Position l_Pos = { -7140.3511f, -3786.8828f, 8.9675f, 5.984621f };

		std::list<Player*> PlayersInGrid;

		void JustSummoned(Creature* /*summoner*/)
		{
			me->GetPlayerListInGrid(PlayersInGrid, 20.0f, true);
			for (auto player : PlayersInGrid)
				if (player->GetQuestStatus(QUEST_THUNDERDROME_THE_GINORMOUS) == QUEST_STATUS_INCOMPLETE)
				{
					me->CombatStart(player, true);
					break;
				}
		}

		void EnterCombat(Unit* target) override
		{
			Talk(1); // I am gravely disappointed.
			events.ScheduleEvent(EVENT_SUMMON_DOGS_OF_WAR, urand(2000, 3000));
		}

		void KilledUnit(Unit* victim) override
		{
			if (Creature* Dealwell = me->FindNearestCreature(NPC_DR_DEALWELL, 50.0f, true))
				Dealwell->AI()->Talk(8, victim->ToPlayer()->GetGUID()); // Random text on player death
			Reset();
		}

		void JustDied(Unit* killer) override
		{
			Talk(0); // There has been too much violence...
			if (Creature* Dealwell = me->FindNearestCreature(NPC_DR_DEALWELL, 50.0f, true))
				Dealwell->AI()->Talk(2, killer->ToPlayer()->GetGUID()); // The Ginormus has fallen!
		}

		void Reset() override
		{
			events.Reset();
			me->MovePosition(l_Pos, 0.0f, 0.0f);
		}

		void UpdateAI(const uint32 diff)
		{

			UpdateOperations(diff);

			if (!UpdateVictim())
				return;

			events.Update(diff);

			if (me->HasUnitState(UNIT_STATE_CASTING))
				return;

			while (uint32 eventId = events.ExecuteEvent())
			{
				switch (eventId)
				{
				case EVENT_SUMMON_DOGS_OF_WAR:
					DoCastVictim(SPELL_SUMMON_DOGS_OF_WAR);
					events.ScheduleEvent(EVENT_SKULL_WHACK, urand(6000, 8000));
					break;
				case EVENT_SKULL_WHACK:
					DoCastVictim(SPELL_SKULL_WHACK);
					events.ScheduleEvent(EVENT_SUMMON_DOGS_OF_WAR, urand(20000, 25000));
					break;
				}
			}

			DoMeleeAttackIfReady();
		}

	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_lord_ginormusAI(creature);
	}

};


/// Sarinexx - 39149
class npc_sarinexx : public CreatureScript
{
public:
	npc_sarinexx() : CreatureScript("npc_sarinexx") { }

	struct npc_sarinexxAI : public ScriptedAI
	{
		npc_sarinexxAI(Creature* creature) : ScriptedAI(creature) {}


		// Center of Thunderdrome arena
		Position l_Pos = { -7140.3511f, -3786.8828f, 8.9675f, 5.984621f };

		std::list<Player*> PlayersInGrid;

		void JustSummoned(Creature* /*summoner*/)
		{
			me->GetPlayerListInGrid(PlayersInGrid, 20.0f, true);
			for (auto player : PlayersInGrid)
				if (player->GetQuestStatus(QUEST_THUNDERDROME_SARINEXX) == QUEST_STATUS_INCOMPLETE)
				{
					me->CombatStart(player, true);
					break;
				}
		}

		void EnterCombat(Unit* target) override
		{
			events.ScheduleEvent(EVENT_WIDE_SLASH, urand(2000, 4000));
		}

		void KilledUnit(Unit* victim) override
		{
			if (Creature* Dealwell = me->FindNearestCreature(NPC_DR_DEALWELL, 50.0f, true))
				Dealwell->AI()->Talk(8, victim->ToPlayer()->GetGUID()); // Random text on player death
			Reset();
		}

		void JustDied(Unit* killer) override
		{
			if (Creature* Dealwell = me->FindNearestCreature(NPC_DR_DEALWELL, 50.0f, true))
				Dealwell->AI()->Talk(4, killer->ToPlayer()->GetGUID()); // There's no stopping $n!...
		}

		void Reset() override
		{
			events.Reset();
			if (!me->isDead())
				me->MovePosition(l_Pos, 0.0f, 0.0f);
		}

		void UpdateAI(const uint32 diff)
		{

			UpdateOperations(diff);

			if (!UpdateVictim())
				return;

			events.Update(diff);

			if (me->HasUnitState(UNIT_STATE_CASTING))
				return;

			while (uint32 eventId = events.ExecuteEvent())
			{
				switch (eventId)
				{
				case EVENT_WIDE_SLASH:
					DoCastVictim(SPELL_WIDE_SLASH);
					events.ScheduleEvent(EVENT_SAND_TRAP, urand(7000, 8000));
					break;
				case EVENT_SAND_TRAP:
					DoCastVictim(SPELL_SAND_TRAP);
					events.ScheduleEvent(EVENT_WIDE_SLASH, urand(6000, 9000));
					break;
				}
			}

			DoMeleeAttackIfReady();
		}

	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_sarinexxAI(creature);
	}

};


/// Zumonga - 39148
class npc_zumonga : public CreatureScript
{
public:
	npc_zumonga() : CreatureScript("npc_zumonga") { }

	struct npc_zumongaAI : public ScriptedAI
	{
		npc_zumongaAI(Creature* creature) : ScriptedAI(creature) {}


		// Center of Thunderdrome arena
		Position l_Pos = { -7140.3511f, -3786.8828f, 8.9675f, 5.984621f };

		std::list<Player*> PlayersInGrid;

		void JustSummoned(Creature* /*summoner*/)
		{
			me->GetPlayerListInGrid(PlayersInGrid, 20.0f, true);
			for (auto player : PlayersInGrid)
				if (player->GetQuestStatus(QUEST_THUNDERDROME_ZUMONGA) == QUEST_STATUS_INCOMPLETE)
				{
					me->CombatStart(player, true);
					break;
				}
		}

		void EnterCombat(Unit* target) override
		{
			Talk(0); // ZUMONGA...KILL
			events.ScheduleEvent(EVENT_HEADBUTT, urand(4000, 6000));
		}

		void KilledUnit(Unit* victim) override
		{
			if (Creature* Dealwell = me->FindNearestCreature(NPC_DR_DEALWELL, 50.0f, true))
				Dealwell->AI()->Talk(8, victim->ToPlayer()->GetGUID()); // Random text on player death
			Reset();
		}

		void JustDied(Unit* killer) override
		{
			if (Creature* Dealwell = me->FindNearestCreature(NPC_DR_DEALWELL, 50.0f, true))
				Dealwell->AI()->Talk(6, killer->ToPlayer()->GetGUID()); // $n has done it again!
		}

		void Reset() override
		{
			events.Reset();
			if (!me->isDead())
				me->MovePosition(l_Pos, 0.0f, 0.0f);
		}

		void UpdateAI(const uint32 diff)
		{

			UpdateOperations(diff);

			if (!UpdateVictim())
				return;

			events.Update(diff);

			if (me->HasUnitState(UNIT_STATE_CASTING))
				return;

			while (uint32 eventId = events.ExecuteEvent())
			{
				switch (eventId)
				{
				case EVENT_HEADBUTT:
					DoCastVictim(SPELL_HEADBUTT);
					events.ScheduleEvent(EVENT_TASTE_OF_BLOOD, urand(3000, 4000));
					break;
				case EVENT_TASTE_OF_BLOOD:
					DoCastVictim(SPELL_TASTE_OF_BLOOD);
					events.ScheduleEvent(EVENT_SUMMON_DOGS_OF_WAR, urand(7000, 8000));
					break;
				}
			}

			DoMeleeAttackIfReady();
		}

	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_zumongaAI(creature);
	}

};


/// Kelsey Steelspark - 40876
class npc_kelsey_steelspark_thunderdrome : public CreatureScript
{
public:
	npc_kelsey_steelspark_thunderdrome() : CreatureScript("npc_kelsey_steelspark_thunderdrome") { }

	struct npc_kelsey_steelspark_thunderdromeAI : public ScriptedAI
	{
		npc_kelsey_steelspark_thunderdromeAI(Creature* creature) : ScriptedAI(creature) { }

		std::list<Player*> PlayersInGrid;

		void JustSummoned(Creature* /*summoner*/)
		{
			me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
			me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PACIFIED);
			me->SetSheath(SHEATH_STATE_MELEE);
			Creature* Megs = me->FindNearestCreature(NPC_MEGS_DREADSHREDDER, 10.0f, true);
			me->SetFacingToObject(Megs);
		}

		void EnterCombat(Unit* /*victim*/) override
		{
			events.ScheduleEvent(EVENT_CHAINED_SPARKS, urand(2000, 3000));
		}

		void Reset() override
		{
			events.Reset();
		}

		void DamageTaken(Unit* attacker, uint32& damage, SpellInfo const* /*p_SpellInfo*/) override
		{
			if (me->GetHealthPct() <= 30.0f)
			{
				DoCastVictim(SPELL_SUMMON_STEELSPARK, true);
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
				me->AttackStop();
				me->AI()->DoAction(0);
			}
		}
		void DoAction(int32 const p_Action) override
		{
			switch (p_Action)
			{
				case 0:
					AddTimedDelayedOperation(0 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						Talk(2); // Grrr... I was going to fight you fair and square, but you decided to bring friends. Fine! Behold the Alloy-Pounder Zero!
					});
					AddTimedDelayedOperation(3 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						Talk(3); // Let's see how all of that dynamite in your pocket likes the KS-L10 Steelspark, Megs!
					});
					AddTimedDelayedOperation(7 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						if (Creature* Megs = me->FindNearestCreature(NPC_MEGS_DREADSHREDDER, 20.0f, true))
						{
							me->CastSpell(Megs, SPELL_STOP_POKING_ME, true);
							Megs->AI()->Talk(7); // Yikes! That stings!
						}

					});
					AddTimedDelayedOperation(9 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						Creature* Megs = me->FindNearestCreature(NPC_MEGS_DREADSHREDDER, 20.0f, true);
						me->CombatStart(Megs, true);

					});
					break;

				case 1:
					AddTimedDelayedOperation(3 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						Talk(4); // You can be sure to tell Gallywix not to underestimate Gnomeregan anymore.
					});
					AddTimedDelayedOperation(7 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						Talk(5); // Until next time, Megs. Don't forget today's lesson.
						//me->MovePosition(); Need to make her move to arena doors.


						if (Creature* Dealwell = me->FindNearestCreature(NPC_DR_DEALWELL, 40.0f, true))
							Dealwell->AI()->Talk(7);

						if (Creature* Kelsey = me->FindNearestCreature(NPC_KELSEY_STEELSPARK, 10.0f, true))
						{
							me->GetPlayerListInGrid(PlayersInGrid, 20.0f, true);
							for (auto player : PlayersInGrid)
								if (player->GetQuestStatus(QUEST_THUNDERDROME_GRUDGE_MATCH_HORDE) == QUEST_STATUS_INCOMPLETE)
									player->KilledMonsterCredit(NPC_KELSEY_STEELSPARK);
							Kelsey->DespawnOrUnsummon(5000);
						}
					});

					break;

			default:
				break;
			}

		}


		void UpdateAI(const uint32 diff)
		{

			UpdateOperations(diff);

			if (!UpdateVictim())
				return;

			events.Update(diff);

			if (me->HasUnitState(UNIT_STATE_CASTING))
				return;

			while (uint32 eventId = events.ExecuteEvent())
			{
				switch (eventId)
				{
					case EVENT_CHAINED_SPARKS:
						DoCastVictim(SPELL_CHAINED_SPARKS);
						events.ScheduleEvent(EVENT_CHAINED_SPARKS, urand(4000, 6000));
						break;
				}


			}

			DoMeleeAttackIfReady();
		}

	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_kelsey_steelspark_thunderdromeAI(creature);
	}

};


/// Megs Dreadshredder - 40542
class npc_megs_dreadshredder_thunderdrome : public CreatureScript
{
public:
	npc_megs_dreadshredder_thunderdrome() : CreatureScript("npc_megs_dreadshredder_thunderdrome") { }

	struct npc_megs_dreadshredder_thunderdromeAI : public ScriptedAI
	{
		npc_megs_dreadshredder_thunderdromeAI(Creature* creature) : ScriptedAI(creature) {}


		std::list<Player*> PlayersInGrid;

		void JustSummoned(Creature* /*summoner*/)
		{
			me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
			me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PACIFIED);
			me->SetSheath(SHEATH_STATE_MELEE);
			Creature* Kelsey = me->FindNearestCreature(NPC_KELSEY_STEELSPARK, 10.0f, true);
			me->SetFacingToObject(Kelsey);


			me->AI()->DoAction(0);
		}


		void EnterCombat(Unit* /*victim*/) override
		{
			events.ScheduleEvent(EVENT_FLAME_WAVE, urand(2000, 3000));
		}


		void DamageTaken(Unit* attacker, uint32& damage, SpellInfo const* /*p_SpellInfo*/) override
		{
			if (me->GetHealthPct() <= 30.0f)
			{
				DoCastVictim(SPELL_SUMMON_DREADSHREDDER, true);
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
				me->AttackStop();
				me->AI()->DoAction(0);
			}
		}


		void DoAction(int32 const p_Action) override
		{
			switch (p_Action)
			{
				case 0:
					AddTimedDelayedOperation(2 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						Talk(0); // You've gotten in my way one too many times, gnome.
					});
					AddTimedDelayedOperation(6 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						if (Creature* Kelsey = me->FindNearestCreature(NPC_KELSEY_STEELSPARK, 10.0f, true))
						{
							Kelsey->AI()->Talk(0); // You have fully depleted my patience as well.
						}
					});
					AddTimedDelayedOperation(11 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						Talk(1); // There isn't room in this town for both of us!
					});
					AddTimedDelayedOperation(16 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						if (Creature* Kelsey = me->FindNearestCreature(NPC_KELSEY_STEELSPARK, 10.0f, true))
						{
							Kelsey->AI()->Talk(1); // I will attempt to not take undue pleasure in utterly destroying you.
						}

					});
					AddTimedDelayedOperation(21 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						Talk(2); // BRING IT, PIPSQUEAK!

						me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
						me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PACIFIED);

						if (Creature* Kelsey = me->FindNearestCreature(NPC_KELSEY_STEELSPARK, 10.0f, true))
						{
							Kelsey->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
							Kelsey->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PACIFIED);

							me->CombatStart(Kelsey);
						}
					});
					break;


				case 1:
					AddTimedDelayedOperation(0 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						Talk(3); // You think you're clever, don't you, ganging up on me like this... well, prepare to face: THE DREADSHREDDER!
					});
					AddTimedDelayedOperation(3 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						Talk(4); // You think you're all brave facing me, eh, Steelsparks?! Those pig tails won't protect you from THE DOOMSAW!
					});
					AddTimedDelayedOperation(7 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						if (Creature* Kelsey = me->FindNearestCreature(NPC_KELSEY_STEELSPARK, 20.0f, true))
						{
							me->CastSpell(Kelsey, SPELL_STOP_POKING_ME, true);
							Kelsey->AI()->Talk(6); // Ack! Not the face!
						}

					});
					AddTimedDelayedOperation(9 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						Creature* Kelsey = me->FindNearestCreature(NPC_KELSEY_STEELSPARK, 20.0f, true);
						if (Kelsey)
						{
							Kelsey->AI()->Talk(7); // Whaaaa!!!!!
							me->CastSpell(Kelsey, SPELL_SAWBLADE, true);
						}

						me->CombatStart(Kelsey, true);

					});
					break;

				case 2:
					AddTimedDelayedOperation(3 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						Talk(5); // You gave it a good shot, kid. But this is goblin turf now. I suggest you get used to it.
					});
					AddTimedDelayedOperation(7 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						Talk(6); // Ciao, babe. Let me know if you'd like to do lunch sometime. We'll work something out now that you've learned some manners.
						//me->MovePosition(); Need to make her move to arena doors.


						if (Creature* Dealwell = me->FindNearestCreature(NPC_DR_DEALWELL, 40.0f, true))
							Dealwell->AI()->Talk(7);

						if (Creature* Kelsey = me->FindNearestCreature(NPC_KELSEY_STEELSPARK, 10.0f, true))
						{
							me->GetPlayerListInGrid(PlayersInGrid, 20.0f, true);
							for (auto player : PlayersInGrid)
								if (player->GetQuestStatus(QUEST_THUNDERDROME_GRUDGE_MATCH_HORDE) == QUEST_STATUS_INCOMPLETE)
									player->KilledMonsterCredit(NPC_KELSEY_STEELSPARK);
							Kelsey->DespawnOrUnsummon(5000);
						}
					});

					break;

				default:
					break;
			}
		}


		void Reset() override
		{
			events.Reset();
		}

		void UpdateAI(const uint32 diff)
		{

			UpdateOperations(diff);

			if (!UpdateVictim())
				return;

			events.Update(diff);

			if (me->HasUnitState(UNIT_STATE_CASTING))
				return;


			while (uint32 eventId = events.ExecuteEvent())
			{
				switch (eventId)
				{
				case EVENT_FLAME_WAVE:
					DoCastVictim(SPELL_FLAME_WAVE);
					events.ScheduleEvent(EVENT_FLAME_WAVE, urand(4000, 6000));
					break;
				}


			}

			DoMeleeAttackIfReady();
		}

	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_megs_dreadshredder_thunderdromeAI(creature);
	}

};



/// Steelsparks LX-506 - 41083
class npc_steelsparks_lx_506 : public CreatureScript
{
public:
	npc_steelsparks_lx_506() : CreatureScript("npc_steelsparks_lx_506") { }

	struct npc_steelsparks_lx_506AI : public ScriptedAI
	{
		npc_steelsparks_lx_506AI(Creature* creature) : ScriptedAI(creature) {}

		// Center of Thunderdrome arena
		Position l_Pos = { -7140.3511f, -3786.8828f, 8.9675f, 5.984621f };
		Position mPos;
		std::list<Player*> PlayersInGrid;


		void JustSummoned(Creature* /*summoner*/)
		{
			me->SetSheath(SHEATH_STATE_MELEE);
			me->GetPlayerListInGrid(PlayersInGrid, 20.0f);
			for (auto player : PlayersInGrid)
				if (player->GetQuestStatus(QUEST_THUNDERDROME_GRUDGE_MATCH_HORDE) == QUEST_STATUS_INCOMPLETE)
				{
					me->CombatStart(player, true);
					break;
				}	
		}

		void EnterCombat(Unit* /*victim*/) override
		{
			events.ScheduleEvent(EVENT_FORKED_LIGHTNING, urand(3000, 4000));
		}

		void JustDied(Unit* killer) override
		{
			if (Creature* Kelsey = me->FindNearestCreature(NPC_KELSEY_STEELSPARK, 20.0f, true))
			{
				Kelsey->MovePosition(l_Pos, 0.0f, 0.0f);

				// Place Megs infront of Kelsey
				GetPositionWithDistInFront(Kelsey, 2.5f, mPos);
				float z = Kelsey->GetMap()->GetHeight(Kelsey->GetPhaseMask(), mPos.GetPositionX(), mPos.GetPositionY(), mPos.GetPositionZ());
				mPos.m_positionZ = z;

				if (Creature* Megs = me->FindNearestCreature(NPC_MEGS_DREADSHREDDER, 20.0f, true))
				{
					Megs->MovePosition(mPos, 0.0f, 0.0f);
					Megs->SetFacingToObject(Kelsey);
					Megs->AI()->DoAction(2);
				}

			}

		}


		void Reset() override
		{
			events.Reset();
			if (!me->isDead())
				me->MovePosition(l_Pos, 0.0f, 0.0f);
		}

		void UpdateAI(const uint32 diff)
		{

			UpdateOperations(diff);

			if (!UpdateVictim())
				return;

			events.Update(diff);

			if (me->HasUnitState(UNIT_STATE_CASTING))
				return;

			while (uint32 eventId = events.ExecuteEvent())
			{
				switch (eventId)
				{
					case EVENT_FORKED_LIGHTNING:
						DoCastVictim(SPELL_FORKED_LIGHTNING);
						events.ScheduleEvent(EVENT_SPARK_EFFECT_CHASE, urand(4000, 6000));
						break;
					case EVENT_SPARK_EFFECT_CHASE:
						DoCastVictim(SPELL_SPARK_EFFECT);
						events.ScheduleEvent(EVENT_FORKED_LIGHTNING, 5000);
						break;
				}

			}
			DoMeleeAttackIfReady();
		}

	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_steelsparks_lx_506AI(creature);
	}

};


/// The Dreadshredder - 41077
class npc_the_dreadshredder : public CreatureScript
{
public:
	npc_the_dreadshredder() : CreatureScript("npc_the_dreadshredder") { }

	struct npc_the_dreadshredderAI : public ScriptedAI
	{
		npc_the_dreadshredderAI(Creature* creature) : ScriptedAI(creature) {}

		// Center of Thunderdrome arena
		Position l_Pos = { -7140.3511f, -3786.8828f, 8.9675f, 5.984621f };
		Position mPos;
		std::list<Player*> PlayersInGrid;


		void JustSummoned(Creature* /*summoner*/)
		{
			me->SetSheath(SHEATH_STATE_MELEE);
			me->GetPlayerListInGrid(PlayersInGrid, 20.0f);
			for (auto player : PlayersInGrid)
				if (player->GetQuestStatus(QUEST_THUNDERDROME_GRUDGE_MATCH_ALLIANCE) == QUEST_STATUS_INCOMPLETE)
				{
					me->CombatStart(player, true);
					break;
				}
		}

		void EnterCombat(Unit* /*victim*/) override
		{
			events.ScheduleEvent(EVENT_FLAMETHROWER, urand(3000, 4000));
		}

		void JustDied(Unit* killer) override
		{
			if (Creature* Megs = me->FindNearestCreature(NPC_MEGS_DREADSHREDDER, 20.0f, true))
			{
				Megs->MovePosition(l_Pos, 0.0f, 0.0f);

				// Place Kelsey infront of Megs
				GetPositionWithDistInFront(Megs, 2.5f, mPos);
				float z = Megs->GetMap()->GetHeight(Megs->GetPhaseMask(), mPos.GetPositionX(), mPos.GetPositionY(), mPos.GetPositionZ());
				mPos.m_positionZ = z;

				if (Creature* Kelsey = me->FindNearestCreature(NPC_KELSEY_STEELSPARK, 20.0f, true))
				{
					Kelsey->MovePosition(mPos, 0.0f, 0.0f);
					Kelsey->SetFacingToObject(Kelsey);
					Kelsey->AI()->DoAction(1);
				}

			}

		}


		void Reset() override
		{
			events.Reset();
			if (!me->isDead())
				me->MovePosition(l_Pos, 0.0f, 0.0f);
		}

		void UpdateAI(const uint32 diff)
		{

			UpdateOperations(diff);

			if (!UpdateVictim())
				return;

			events.Update(diff);

			if (me->HasUnitState(UNIT_STATE_CASTING))
				return;

			while (uint32 eventId = events.ExecuteEvent())
			{
				switch (eventId)
				{
					case EVENT_FLAMETHROWER:
						DoCastVictim(SPELL_FLAMETHROWER);
						events.ScheduleEvent(EVENT_SAWBLADE, urand(4000, 6000));
						break;
					case EVENT_SAWBLADE:
						DoCastVictim(SPELL_SAWBLADE);
						events.ScheduleEvent(EVENT_FLAMETHROWER, 5000);
						break;
				}

			}
			DoMeleeAttackIfReady();
		}

	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_the_dreadshredderAI(creature);
	}

};
















/*															 Vision 1: Expedition To Uldum															*/

enum eQuest27003
{
	// Quests
	QUEST_EASY_MONEY = 27003,

	// Spells
	SPELL_DETECT_QUEST_INVIS_ZONE_5 = 86749,
	SPELL_DETECT_QUEST_INVIS_ZONE_1 = 89270,
	SPELL_SUMMON_BEAM_TARGET_BUNNY = 86942,
	SPELL_CHAINS_OF_BONDAGE_1 = 73447,
	SPELL_CHAINS_OF_BONDAGE_2 = 73448,
	SPELL_CHAINS_OF_BONDAGE_3 = 73449,
	SPELL_PLAYER_SUMMON_CAMERA = 95747,
	SPELL_SUMMON_CAMERA_BUNNY = 86792,
	SPELL_PING_CAMERA_00 = 86815,
	SPELL_PERMANENT_FEIGN_DEATH = 29266,
	SPELL_IMPRISONED = 89318,

	SPELL_SUMMON_ADARRAH = 86751,
	SPELL_SUMMON_CARAVAN = 86752,
	SPELL_SUMMON_LADY_HUMPS = 86753,
	SPELL_SUMMON_PACK_MULE = 86754,
	SPELL_SUMMON_BUDDS_CAMEL = 86755,
	SPELL_SUMMON_SAMIRS_CAMEL = 86756,
	SPELL_SUMMON_MACKS_CAMEL = 86757,
	SPELL_SUMMON_ADARRAHS_CAMEL = 86758,

	// Npcs
	NPC_ADARRAH = 46533,
	NPC_LADY_HUMPS = 46536,
	NPC_PACK_MULE = 46537,
	NPC_BUDDS_CAMEL = 46538,
	NPC_SAMIRS_CAMEL = 46540,
	NPC_MACKS_CAMEL = 46543,
	NPC_ADARRAHS_CAMEL = 46546,
	NPC_CLONED_IMAGE = 46554,
	NPC_HARNISH = 46596,
	NPC_KODO_2 = 46534,
	NPC_KURZEL_2 = 46548,
	NPC_TURGORE_2 = 46544,
	NPC_TANZAR_2 = 46547,
	NPC_HARKOR_2 = 46545,
	NPC_PLAYER_GUID = 99999,
	NPC_SAND_PUGMY = 47326,

	// Events
	EVENT_CHECK_PLAYER_IS_PRESENT = 1,
	EVENT_ADARRAH_TALK_VIDEO,
	EVENT_ADARRAH_TALK_0,
	EVENT_ADARRAH_TALK_1,
	EVENT_MOVE_ADARRAH_AROUND_PLAYER,
	EVENT_MOVE_ADARRAH_TO_CAMEL,
	EVENT_ADARRAH_MOUNT_CAMEL,
	EVENT_STARTING_CARAVAN,
	EVENT_PLAYER_MOUNT_HARNISH,
	EVENT_BUDD_SAY_AHOJ,
	EVENT_TELEPORT_TO_VIDEO2,
	EVENT_SUMMON_ACTORS_VIDEO2,
	EVENT_STARTING_VIDEO2,
	EVENT_PUGMY_TALK1,
	EVENT_IMPRISONED,
	EVENT_REMOVE_IMPRISONED,
	EVENT_PUGMY_TALK2,
	EVENT_PUGMY_GO_AWAY,

	// Actions
	ACTION_START_ADARRAH_TALK_VIDEO = 101,
	ACTION_MOVE_ADARRAH_TO_PLAYER,
	ACTION_STARTING_CARAVAN,

	MOVE_ADARRAH_TO_PLAYER = 201,
	MOVE_ADARRAH_AROUND_PLAYER,
	MOVE_ADARRAH_TO_CAMEL,

	// the blizz video creates a clone of the player, and lets this clone do some emotes.
	// Need to fix these spells. - To give to Jens.
	SPELL_INITIALIZE_ULDRUM_INTRO = 86748,
	SPELL_PLAYER_PREP = 86750,
	SPELL_SUMMON_CLONED_IMAGE = 86782, // create a empty player clone.
	SPELL_REVERSE_CAST_MIRROR_IMAGE = 86783, // Script Effect Value: 86784
	SPELL_MIRROR_IMAGE_AURA = 86784, // Script Effect Value: 41055  Value : 45206
	SPELL_COPY_WEAPON_ACK = 41054,
	SPELL_COPY_WEAPON = 41055,
	SPELL_COPY_OFF_HAND_WEAPON_ACK = 45205,
	SPELL_COPY_OFF_HAND_WEAPON = 45206,
};

/// Adarrah - 44833
class npc_adarrah_44833 : public CreatureScript
{
public:
	npc_adarrah_44833() : CreatureScript("npc_adarrah_44833") { }

	bool OnQuestAccept(Player* player, Creature* creature, Quest const* quest)
	{
		if (quest->GetQuestId() == QUEST_EASY_MONEY)
		{
			player->RemoveAura(SPELL_DETECT_QUEST_INVIS_ZONE_5);
			player->AddAura(SPELL_DETECT_QUEST_INVIS_ZONE_1, player);
			player->CastSpell(player, SPELL_SUMMON_BEAM_TARGET_BUNNY);
		}

		return false;
	}
};

/// Beam Target Bunny - 46661
class npc_beam_target_bunny_46661 : public CreatureScript
{
public:
	npc_beam_target_bunny_46661() : CreatureScript("npc_beam_target_bunny_46661") { }

	struct npc_beam_target_bunny_46661AI : public ScriptedAI
	{
		npc_beam_target_bunny_46661AI(Creature* creature) : ScriptedAI(creature) { }

		EventMap m_events;
		uint64 playerGUID;
		uint64 adarrahGUID;
		uint64 harnishGUID;
		uint64 lady_humpsGUID;
		uint64 pack_muleGUID;
		uint64 budds_camelGUID;
		uint64 samirs_camelGUID;
		uint64 macks_camelGUID;
		uint64 adarrahs_camelGUID;
		uint64 sandPugmy[5];
		uint32 sandPugmyCount;
		bool   isVideo2;

		void Reset() override
		{
			m_events.Reset();
			playerGUID = 0;
			adarrahGUID = 0;
			harnishGUID = 0;
			lady_humpsGUID = 0;
			pack_muleGUID = 0;
			budds_camelGUID = 0;
			samirs_camelGUID = 0;
			macks_camelGUID = 0;
			adarrahs_camelGUID = 0;

			for (uint32 i = 0; i < 6; i++)
				sandPugmy[i] = 0;
			sandPugmyCount = 0;

			isVideo2 = false;
		}

		void IsSummonedBy(Unit* summoner) override
		{
			if (Player* player = summoner->ToPlayer())
			{
				playerGUID = player->GetGUID();
				me->CastSpell(player, SPELL_SUMMON_ADARRAH);
				me->CastSpell(player, SPELL_SUMMON_CARAVAN);
				me->CastSpell(player, SPELL_SUMMON_LADY_HUMPS);
				me->CastSpell(player, SPELL_SUMMON_PACK_MULE);
				me->CastSpell(player, SPELL_SUMMON_BUDDS_CAMEL);
				me->CastSpell(player, SPELL_SUMMON_SAMIRS_CAMEL);
				me->CastSpell(player, SPELL_SUMMON_MACKS_CAMEL);
				me->CastSpell(player, SPELL_SUMMON_ADARRAHS_CAMEL);
				m_events.ScheduleEvent(EVENT_CHECK_PLAYER_IS_PRESENT, 10000);
			}
		}

		void JustSummoned(Creature* summon) override
		{
			switch (summon->GetEntry())
			{
			case NPC_ADARRAH:
				adarrahGUID = summon->GetGUID();
				if (Player* player = sObjectAccessor->GetPlayer(*me, playerGUID))
					summon->SetFacingToObject(player);
				break;
			case NPC_HARNISH:
				harnishGUID = summon->GetGUID();
				summon->SetWalk(true);
				summon->SetSpeed(MOVE_WALK, 0.4f);
				summon->SetFacingToObject(me);
				break;
			case NPC_LADY_HUMPS:
				lady_humpsGUID = summon->GetGUID();
				summon->SetWalk(true);
				summon->SetSpeed(MOVE_WALK, 0.4f);
				summon->SetFacingToObject(me);
				break;
			case NPC_PACK_MULE:
				pack_muleGUID = summon->GetGUID();
				summon->SetWalk(true);
				summon->SetSpeed(MOVE_WALK, 0.4f);
				summon->SetFacingToObject(me);
				break;
			case NPC_BUDDS_CAMEL:
				budds_camelGUID = summon->GetGUID();
				summon->SetWalk(true);
				summon->SetSpeed(MOVE_WALK, 0.4f);
				summon->SetFacingToObject(me);
				break;
			case NPC_SAMIRS_CAMEL:
				samirs_camelGUID = summon->GetGUID();
				summon->SetWalk(true);
				summon->SetSpeed(MOVE_WALK, 0.4f);
				summon->SetFacingToObject(me);
				break;
			case NPC_MACKS_CAMEL:
				macks_camelGUID = summon->GetGUID();
				summon->SetWalk(true);
				summon->SetSpeed(MOVE_WALK, 0.4f);
				summon->SetFacingToObject(me);
				break;
			case NPC_ADARRAHS_CAMEL:
				adarrahs_camelGUID = summon->GetGUID();
				summon->SetWalk(true);
				summon->SetSpeed(MOVE_WALK, 0.4f);
				summon->SetFacingToObject(me);
				break;
			case NPC_SAND_PUGMY:
				summon->RemoveAura(SPELL_PERMANENT_FEIGN_DEATH);
				summon->setFaction(7);
				summon->SetUInt32Value(UNIT_FIELD_FLAGS, 0);
				summon->SetUInt32Value(UNIT_FIELD_FLAGS_2, 2048);
				//summon->SetUInt32Value(UNIT_FIELD_DYNAMIC_FLAGS, 0); // Idk how to set dynamic flags to 0, will come back to this.
				sandPugmy[sandPugmyCount] = summon->GetGUID();
				sandPugmyCount += 1;
				break;
			}
			if (isVideo2)
			{
				summon->SetPhaseMask(2, true);
			}
		}

		void DoAction(int32 param) override
		{
			switch (param)
			{
			case ACTION_STARTING_CARAVAN:
			{
				m_events.ScheduleEvent(EVENT_STARTING_CARAVAN, 1000);
			}
			}
		}

		uint64 GetGUID(int32 id = 0) const
		{
			switch (id)
			{
			case NPC_ADARRAH:
				return adarrahGUID;
			case NPC_LADY_HUMPS:
				return lady_humpsGUID;
			case NPC_PACK_MULE:
				return pack_muleGUID;
			case NPC_BUDDS_CAMEL:
				return budds_camelGUID;
			case NPC_SAMIRS_CAMEL:
				return samirs_camelGUID;
			case NPC_MACKS_CAMEL:
				return macks_camelGUID;
			case NPC_HARNISH:
				return harnishGUID;
			case NPC_ADARRAHS_CAMEL:
				return adarrahs_camelGUID;
			case NPC_PLAYER_GUID:
				return playerGUID;
			}
			return 0;
		}

		void UpdateAI(uint32 diff) override
		{
			m_events.Update(diff);

			while (uint32 eventId = m_events.ExecuteEvent())
			{
				switch (eventId)
				{
				case EVENT_CHECK_PLAYER_IS_PRESENT:
				{
					bool ok = false;
					if (Player* player = sObjectAccessor->GetPlayer(*me, playerGUID))
						if (player->isAlive() && player->GetDistance2d(me) < 500.0f)
							if (player->GetQuestStatus(QUEST_EASY_MONEY) == QUEST_STATUS_INCOMPLETE)
								ok = true;

					if (ok)
						m_events.ScheduleEvent(EVENT_CHECK_PLAYER_IS_PRESENT, 5000);
					else
						DespawnCaravan();

					break;
				}
				case EVENT_STARTING_CARAVAN:
				{
					StartMovingCaravan();
					m_events.ScheduleEvent(EVENT_PLAYER_MOUNT_HARNISH, 3000);
					m_events.ScheduleEvent(EVENT_BUDD_SAY_AHOJ, 6000);
					m_events.ScheduleEvent(EVENT_TELEPORT_TO_VIDEO2, 11000);
					m_events.ScheduleEvent(EVENT_SUMMON_ACTORS_VIDEO2, 12000);
					m_events.ScheduleEvent(EVENT_STARTING_VIDEO2, 16000);
					break;
				}
				case EVENT_PLAYER_MOUNT_HARNISH:
				{
					Player* player = sObjectAccessor->GetPlayer(*me, playerGUID);
					Creature* npc = sObjectAccessor->GetCreature(*me, harnishGUID);
					if (player)
					{
						if (isVideo2)
						{
							player->AddAura(59073, player);
							player->AddAura(49416, player);
						}

						if (npc)
							player->EnterVehicle(npc, -1);
						else
							m_events.ScheduleEvent(EVENT_PLAYER_MOUNT_HARNISH, 500);
					}

					break;
				}
				case EVENT_BUDD_SAY_AHOJ:
				{
					if (Creature* budd = sObjectAccessor->GetCreature(*me, budds_camelGUID))
						budd->AI()->Talk(0);
					break;
				}
				case EVENT_TELEPORT_TO_VIDEO2:
				{
					StartTeleport();
					break;
				}
				case EVENT_SUMMON_ACTORS_VIDEO2:
				{
					SummonActorsVideo2();
					break;
				}
				case EVENT_STARTING_VIDEO2:
				{
					if (Creature* npc = sObjectAccessor->GetCreature(*me, sandPugmy[2]))
						npc->AI()->Talk(0);

					m_events.ScheduleEvent(EVENT_PUGMY_TALK1, 5000);
					break;
				}
				case EVENT_PUGMY_TALK1:
				{
					if (Creature* npc = sObjectAccessor->GetCreature(*me, sandPugmy[4]))
						npc->AI()->Talk(1);

					m_events.ScheduleEvent(EVENT_IMPRISONED, 5000);
					break;
				}
				case EVENT_IMPRISONED:
				{
					if (Player* player = sObjectAccessor->GetPlayer(*me, playerGUID))
					{
						DespawnCaravan();
						player->CastSpell(player, SPELL_IMPRISONED);
						m_events.ScheduleEvent(EVENT_REMOVE_IMPRISONED, 5000);
					}
					break;
				}
				}
			}
		}

		void DespawnCaravan()
		{
			if (Creature* npc = sObjectAccessor->GetCreature(*me, adarrahGUID))
				npc->DespawnOrUnsummon();
			if (Creature* npc = sObjectAccessor->GetCreature(*me, harnishGUID))
				npc->DespawnOrUnsummon();
			if (Creature* npc = sObjectAccessor->GetCreature(*me, lady_humpsGUID))
				npc->DespawnOrUnsummon();
			if (Creature* npc = sObjectAccessor->GetCreature(*me, pack_muleGUID))
				npc->DespawnOrUnsummon();
			if (Creature* npc = sObjectAccessor->GetCreature(*me, budds_camelGUID))
				npc->DespawnOrUnsummon();
			if (Creature* npc = sObjectAccessor->GetCreature(*me, samirs_camelGUID))
				npc->DespawnOrUnsummon();
			if (Creature* npc = sObjectAccessor->GetCreature(*me, macks_camelGUID))
				npc->DespawnOrUnsummon();
			if (Creature* npc = sObjectAccessor->GetCreature(*me, adarrahs_camelGUID))
				npc->DespawnOrUnsummon();

			adarrahGUID = 0;
			harnishGUID = 0;
			lady_humpsGUID = 0;
			pack_muleGUID = 0;
			budds_camelGUID = 0;
			samirs_camelGUID = 0;
			macks_camelGUID = 0;
			adarrahs_camelGUID = 0;

			for (uint32 i = 0; i < 6; i++)
				if (Creature* npc = sObjectAccessor->GetCreature(*me, sandPugmy[i]))
				{
					npc->DespawnOrUnsummon();
					sandPugmy[i] = 0;
				}
			sandPugmyCount = 0;
		}

		void StartMovingCaravan()
		{
			if (Creature* npc = sObjectAccessor->GetCreature(*me, harnishGUID))
			{
				Position l_Pos;
				me->GetPosition(&l_Pos);
				npc->GetMotionMaster()->MovePoint(24, l_Pos);
			}
				
			if (Creature* npc = sObjectAccessor->GetCreature(*me, lady_humpsGUID))
			{
				Position l_Pos;
				me->GetPosition(&l_Pos);
				npc->GetMotionMaster()->MovePoint(24, l_Pos);
			}
			if (Creature* npc = sObjectAccessor->GetCreature(*me, pack_muleGUID))
			{
				Position l_Pos;
				me->GetPosition(&l_Pos);
				npc->GetMotionMaster()->MovePoint(24, l_Pos);
			}
			if (Creature* npc = sObjectAccessor->GetCreature(*me, budds_camelGUID))
			{
				Position l_Pos;
				me->GetPosition(&l_Pos);
				npc->GetMotionMaster()->MovePoint(24, l_Pos);
			}
			if (Creature* npc = sObjectAccessor->GetCreature(*me, samirs_camelGUID))
			{
				Position l_Pos;
				me->GetPosition(&l_Pos);
				npc->GetMotionMaster()->MovePoint(24, l_Pos);
			}
			if (Creature* npc = sObjectAccessor->GetCreature(*me, macks_camelGUID))
			{
				Position l_Pos;
				me->GetPosition(&l_Pos);
				npc->GetMotionMaster()->MovePoint(24, l_Pos);
			}
			if (Creature* npc = sObjectAccessor->GetCreature(*me, adarrahs_camelGUID))
			{
				Position l_Pos;
				me->GetPosition(&l_Pos);
				npc->GetMotionMaster()->MovePoint(24, l_Pos);
			}
		}

		void StartTeleport()
		{
			isVideo2 = true;
			me->NearTeleportTo(-8958.0f, -1610.0f, 94.5f, 4.73f);
			DespawnCaravan();
			if (Player* player = sObjectAccessor->GetPlayer(*me, playerGUID))
				player->NearTeleportTo(-8958.0f, -1697.0f, 94.46f, 1.57f);
		}

		void SummonActorsVideo2()
		{
			me->SetPhaseMask(2, true);
			me->SummonCreature(NPC_LADY_HUMPS, -8958.0f, -1671.0f, 94.46f, 1.57f, TEMPSUMMON_TIMED_DESPAWN, 120000);
			me->SummonCreature(NPC_HARNISH, -8958.0f, -1697.0f, 94.46f, 1.57f, TEMPSUMMON_TIMED_DESPAWN, 120000);
			me->SummonCreature(NPC_PACK_MULE, -8948.0f, -1695.0f, 94.46f, 1.57f, TEMPSUMMON_TIMED_DESPAWN, 120000);
			me->SummonCreature(NPC_MACKS_CAMEL, -8948.0f, -1700.0f, 94.46f, 1.57f, TEMPSUMMON_TIMED_DESPAWN, 120000);
			me->SummonCreature(NPC_SAMIRS_CAMEL, -8948.0f, -1705.0f, 94.46f, 1.57f, TEMPSUMMON_TIMED_DESPAWN, 120000);
			me->SummonCreature(NPC_ADARRAHS_CAMEL, -8968.0f, -1697.0f, 94.46f, 1.57f, TEMPSUMMON_TIMED_DESPAWN, 120000);
			me->SummonCreature(NPC_ADARRAH, -8968.0f, -1697.0f, 94.46f, 1.57f, TEMPSUMMON_TIMED_DESPAWN, 120000);
			me->SummonCreature(NPC_BUDDS_CAMEL, -8968.0f, -1690.0f, 94.46f, 1.57f, TEMPSUMMON_TIMED_DESPAWN, 120000);

			me->SummonCreature(NPC_SAND_PUGMY, -8961.2f, -1669.1f, 94.46f, 4.57f, TEMPSUMMON_TIMED_DESPAWN, 120000);
			me->SummonCreature(NPC_SAND_PUGMY, -8955.9f, -1669.2f, 94.46f, 4.57f, TEMPSUMMON_TIMED_DESPAWN, 120000);
			me->SummonCreature(NPC_SAND_PUGMY, -8955.1f, -1707.6f, 94.46f, 1.57f, TEMPSUMMON_TIMED_DESPAWN, 120000);
			me->SummonCreature(NPC_SAND_PUGMY, -8960.0f, -1708.0f, 94.46f, 1.57f, TEMPSUMMON_TIMED_DESPAWN, 120000);
			me->SummonCreature(NPC_SAND_PUGMY, -8965.3f, -1707.3f, 94.46f, 1.57f, TEMPSUMMON_TIMED_DESPAWN, 120000);
			me->SummonCreature(NPC_SAND_PUGMY, -8963.3f, -1707.0f, 94.46f, 1.57f, TEMPSUMMON_TIMED_DESPAWN, 120000);

			m_events.ScheduleEvent(EVENT_PLAYER_MOUNT_HARNISH, 200);
		}

	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_beam_target_bunny_46661AI(creature);
	}
};

/// Adarrah - 46533
class npc_adarrah_46533 : public CreatureScript
{
public:
	npc_adarrah_46533() : CreatureScript("npc_adarrah_46533") { }

	struct npc_adarrah_46533AI : public ScriptedAI
	{
		npc_adarrah_46533AI(Creature* creature) : ScriptedAI(creature) { }

		EventMap m_events;
		uint64 target_bunnyGUID;
		float angle;

		void Reset() override
		{
			target_bunnyGUID = 0;
			angle = 0;
			m_events.Reset();
		}

		void IsSummonedBy(Unit* summoner) override
		{
			target_bunnyGUID = summoner->GetGUID();
		}

		void MovementInform(uint32 type, uint32 id)
		{
			if (type != 8)
				return;

			switch (id)
			{
			case MOVE_ADARRAH_TO_PLAYER:
			{
				m_events.ScheduleEvent(EVENT_ADARRAH_TALK_0, 25);
				break;
			}
			case MOVE_ADARRAH_AROUND_PLAYER:
			{
				m_events.ScheduleEvent(EVENT_MOVE_ADARRAH_TO_CAMEL, 25);
				break;
			}
			case MOVE_ADARRAH_TO_CAMEL:
			{
				m_events.ScheduleEvent(EVENT_ADARRAH_MOUNT_CAMEL, 25);
				break;
			}
			}
		}

		void DoAction(int32 param) override
		{
			switch (param)
			{
			case ACTION_START_ADARRAH_TALK_VIDEO:
			{
				if (Creature* bunny = sObjectAccessor->GetCreature(*me, target_bunnyGUID))
					if (Player* player = sObjectAccessor->GetPlayer(*me, bunny->GetAI()->GetGUID(NPC_PLAYER_GUID)))
					{
						angle = me->GetAngle(player->GetPositionX(), player->GetPositionY());
						Position pos;
						player->GetPosition(&pos);
						player->GetNearPosition(pos, 2.0f, angle);
						me->GetMotionMaster()->MovePoint(MOVE_ADARRAH_TO_PLAYER, pos); // Move Adarrah next to player at a distance of 2 yards.
					}
				break;
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
				case EVENT_ADARRAH_TALK_0:
				{
					Talk(0);
					if (Creature* bunny = sObjectAccessor->GetCreature(*me, target_bunnyGUID))
						if (Player* player = sObjectAccessor->GetPlayer(*me, bunny->GetAI()->GetGUID(NPC_PLAYER_GUID)))
							me->SetFacingToObject(player);
					m_events.ScheduleEvent(EVENT_ADARRAH_TALK_1, 5000);
					break;
				}
				case EVENT_ADARRAH_TALK_1:
				{
					Talk(1);
					m_events.ScheduleEvent(EVENT_MOVE_ADARRAH_AROUND_PLAYER, 5000);
					break;
				}
				case EVENT_MOVE_ADARRAH_AROUND_PLAYER:
				{
					if (Creature* bunny = sObjectAccessor->GetCreature(*me, target_bunnyGUID))
						if (Player* player = sObjectAccessor->GetPlayer(*me, bunny->GetAI()->GetGUID(NPC_PLAYER_GUID)))
						{
							float d1 = me->GetDistance2d(-8929.17f, -2262.24f);
							float d2 = me->GetDistance2d(-8928.21f, -2267.25f);
							if (d1 < d2)
								me->GetMotionMaster()->MovePoint(MOVE_ADARRAH_AROUND_PLAYER, -8929.17f, -2262.24f, 8.877f);
							else
								me->GetMotionMaster()->MovePoint(MOVE_ADARRAH_AROUND_PLAYER, -8929.17f, -2262.24f, 8.877f);
						}
					break;
				}
				case EVENT_MOVE_ADARRAH_TO_CAMEL:
				{
					if (Creature* bunny = sObjectAccessor->GetCreature(*me, target_bunnyGUID))
						if (Creature* camel = sObjectAccessor->GetCreature(*me, bunny->GetAI()->GetGUID(NPC_ADARRAHS_CAMEL)))
						{
							float angle = camel->GetAngle(me->GetPositionX(), me->GetPositionY());
							Position pos;
							camel->GetPosition(&pos);
							camel->GetNearPosition(pos, 2.0f, angle);
							me->GetMotionMaster()->MovePoint(MOVE_ADARRAH_TO_CAMEL, pos); // Make Adarrah move to camel at 2 yards distance.
						}
					break;
				}
				case EVENT_ADARRAH_MOUNT_CAMEL:
				{
					if (Creature* bunny = sObjectAccessor->GetCreature(*me, target_bunnyGUID))
						if (Creature* camel = sObjectAccessor->GetCreature(*me, bunny->GetAI()->GetGUID(NPC_ADARRAHS_CAMEL)))
						{
							me->EnterVehicle(camel, 0);
							bunny->GetAI()->DoAction(ACTION_STARTING_CARAVAN);
						}
					break;
				}
				}
			}
		}
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_adarrah_46533AI(creature);
	}
};

/// Lady Humps - 46536
class npc_lady_humps_46536 : public CreatureScript
{
public:
	npc_lady_humps_46536() : CreatureScript("npc_lady_humps_46536") { }

	struct npc_lady_humps_46536AI : public ScriptedAI
	{
		npc_lady_humps_46536AI(Creature* creature) : ScriptedAI(creature) { isStarted = false; }

		uint64 target_bunnyGUID;
		bool isStarted;

		void Reset() override
		{
			target_bunnyGUID = 0;
		}

		void IsSummonedBy(Unit* summoner) override
		{
			target_bunnyGUID = summoner->GetGUID();
		}

		void OnSpellClick(Unit* clicker) override
		{
			if (!isStarted) // if isStarted is false, proceed
				if (Player* player = clicker->ToPlayer())
					if (player->GetQuestStatus(QUEST_EASY_MONEY) == QUEST_STATUS_INCOMPLETE)
						if (Creature* bunny = sObjectAccessor->GetCreature(*me, target_bunnyGUID))
							if (Creature* adarrah = sObjectAccessor->GetCreature(*me, bunny->GetAI()->GetGUID(NPC_ADARRAH)))
							{
								adarrah->GetAI()->DoAction(ACTION_START_ADARRAH_TALK_VIDEO);
								isStarted = true;
							}
		}
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_lady_humps_46536AI(creature);
	}
};

/// Uldum Caravan Harness - 46596
class npc_uldum_caravan_harness_46596 : public CreatureScript
{
public:
	npc_uldum_caravan_harness_46596() : CreatureScript("npc_uldum_caravan_harness_46596") { }

	struct npc_uldum_caravan_harness_46596AI : public ScriptedAI
	{
		npc_uldum_caravan_harness_46596AI(Creature* creature) : ScriptedAI(creature) { }

		EventMap m_events;
		uint64 bunnyGUID;
		uint64 kodoGUID;
		uint64 kurzelGUID;
		uint64 turgoreGUID;
		uint64 tanzarGUID;
		uint64 harkorGUID;
		bool   hasChains;

		void Reset() override
		{
			m_events.Reset();
			bunnyGUID = 0;
			kodoGUID = 0;
			kurzelGUID = 0;
			turgoreGUID = 0;
			tanzarGUID = 0;
			harkorGUID = 0;
			hasChains = false;
		}

		void IsSummonedBy(Unit* summoner) override
		{
			bunnyGUID = summoner->GetGUID();
		}

		void JustSummoned(Creature* summon) override
		{
			switch (summon->GetEntry())
			{
			case NPC_KODO_2:
			{
				kodoGUID = summon->GetGUID();
				break;
			}
			case NPC_KURZEL_2:
			{
				kurzelGUID = summon->GetGUID();
				break;
			}
			case NPC_TURGORE_2:
			{
				turgoreGUID = summon->GetGUID();
				break;
			}
			case NPC_TANZAR_2:
			{
				tanzarGUID = summon->GetGUID();
				break;
			}
			case NPC_HARKOR_2:
			{
				harkorGUID = summon->GetGUID();
				break;
			}
			}
			CreateChains();
		}

		// maybe better to disable??? chains are visible in different phases and uses wrong start/end data..
		void CreateChains()
		{
			if (!hasChains)
				if (Creature* kodo = sObjectAccessor->GetCreature(*me, kodoGUID))
					if (Creature* turgore = sObjectAccessor->GetCreature(*me, turgoreGUID))
					{
						hasChains = true;
						kodo->CastSpell(turgore, SPELL_CHAINS_OF_BONDAGE_1, true);
						//turgore->CastSpell(kodo, SPELL_CHAINS_OF_BONDAGE_2, true);
						//turgore->CastSpell(kodo, SPELL_CHAINS_OF_BONDAGE_3, true);
					}
		}

	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_uldum_caravan_harness_46596AI(creature);
	}
};

// Vision 2: has same creatures as in video 1..

/*																	Vision 3																		 */

// Vision 3 Work In Progress
/// Adarrah - 46873
class npc_adarrah_46873 : public CreatureScript
{
public:
	npc_adarrah_46873() : CreatureScript("npc_adarrah_46873") { }

	struct npc_adarrah_46873AI : public ScriptedAI
	{
		npc_adarrah_46873AI(Creature* creature) : ScriptedAI(creature) { }

		EventMap m_events;

		void Reset() override
		{
			m_events.Reset();
		}

		void UpdateAI(uint32 diff) override
		{
			m_events.Update(diff);

			while (uint32 eventId = m_events.ExecuteEvent())
			{
				switch (eventId)
				{
				case EVENT_ADARRAH_TALK_0:
				{

				}
				}
			}
		}
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_adarrah_46873AI(creature);
	}
};


#ifndef __clang_analyzer__
void AddSC_tanaris()
{
	// Tanaris
    new npc_custodian_of_time();
    new npc_steward_of_time();
    new npc_OOX17();
	new npc_dunemaul_ogres_unchartered();
	new npc_megs_dreadshredder_38849();
	new npc_dr_dealwell();
	new npc_lord_ginormus();
	new npc_sarinexx();
	new npc_zumonga();
	new npc_kelsey_steelspark_thunderdrome();
	new npc_megs_dreadshredder_thunderdrome();
	new npc_steelsparks_lx_506();
	new npc_the_dreadshredder();


	// Tanaris-Uldum Campaign Expedition
	new npc_adarrah_44833();
	new npc_beam_target_bunny_46661();
	new npc_adarrah_46533();
	new npc_lady_humps_46536();
	new npc_uldum_caravan_harness_46596();
	new npc_adarrah_46873();
}
#endif
