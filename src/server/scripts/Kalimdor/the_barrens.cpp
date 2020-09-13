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
#include "GameObjectAI.h"
#include "GameObject.h"
#include "Player.h"
#include "Vehicle.h"
#include "VehicleDefines.h"
#include "Transport.h"
#include "TransportMgr.h"


/// PlayerScript - Quest Event Handler
class playerScript_quest_handler : public PlayerScript
{
public:
	playerScript_quest_handler() : PlayerScript("playerScript_quest_handler") { }
	
	enum eMisc
	{
		// Npcs
		NPC_BARON_LONGSHORE		= 3467,
		NPC_SOUTHSEA_CUTTHROAT	= 3383,

		// Item
		ITEM_GAZLOWES_CHEST		= 46833,

		// Action
		AttackPlayer			= 1,
	};

	void OnItemLooted(Player* p_Player, Item* p_Item) override
	{
		/// Gazlowe's Treasure Chest Quest
		if (p_Item->GetEntry() == ITEM_GAZLOWES_CHEST)
		{
			Position const BaronPos = { -1163.2906f, -3638.6038f, 95.6738f, 1.391242f };
			Position const CutthroatPos = { -1166.0581f, -3638.5015f, 95.4870f, 1.391242f };
			Position const RunPos = { -1167.9142f, -3613.9539f, 93.9095f }; // Position to run to

			Creature* Baron = p_Player->SummonCreature(NPC_BARON_LONGSHORE, BaronPos, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 60000);
			Creature* Cutthroat = p_Player->SummonCreature(NPC_SOUTHSEA_CUTTHROAT, CutthroatPos, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 60000);

			if (Baron && Cutthroat)
			{
				Baron->setFaction(14);
				Baron->AI()->Talk(1, p_Player->GetGUID()); // Hold it, $r!

				// Cutthroat follow Baron
				Cutthroat->GetMotionMaster()->MoveFollow(Baron, 1.0f, 1.0f, MOTION_SLOT_ACTIVE);
				Baron->GetMotionMaster()->MovePoint(2, RunPos);

				if (Creature* cutthroat = Baron->FindNearestCreature(NPC_SOUTHSEA_CUTTHROAT, 20.0f, true))
				{
					Baron->CombatStart(p_Player);
					cutthroat->CombatStart(p_Player);
				}
			}

		}
	}
};




/// Beaten Corpse - Mankrik's Wife
enum BeatenCorpse
{
	GOSSIP_OPTION_ID_BEATEN_CORPSE = 0,
	GOSSIP_MENU_OPTION_INSPECT_BODY = 2871
};

class npc_beaten_corpse : public CreatureScript
{
public:
	npc_beaten_corpse() : CreatureScript("npc_beaten_corpse") { }

	struct npc_beaten_corpseAI : public ScriptedAI
	{
		npc_beaten_corpseAI(Creature* creature) : ScriptedAI(creature) { }

		void sGossipSelect(Player* player, uint32 menuId, uint32 gossipListId) override
		{
			if (menuId == GOSSIP_MENU_OPTION_INSPECT_BODY && gossipListId == GOSSIP_OPTION_ID_BEATEN_CORPSE)
			{
				player->CLOSE_GOSSIP_MENU();
				player->TalkedToCreature(me->GetEntry(), me->GetGUID());
			}
		}
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_beaten_corpseAI(creature);
	}
};

/// Gilthares
enum Gilthares
{
	SAY_GIL_START = 0,
	SAY_GIL_AT_LAST = 1,
	SAY_GIL_PROCEED = 2,
	SAY_GIL_FREEBOOTERS = 3,
	SAY_GIL_AGGRO = 4,
	SAY_GIL_ALMOST = 5,
	SAY_GIL_SWEET = 6,
	SAY_GIL_FREED = 7,

	AREA_BARRENS_MERCHANT_COAST	= 391,
		
	QUEST_FREE_FROM_HOLD = 898,
	FACTION_ESCORTEE = 232    // Possibly not needed for the quest
};

class npc_gilthares : public CreatureScript
{
public:
	npc_gilthares() : CreatureScript("npc_gilthares") { }

	bool OnQuestAccept(Player* player, Creature* creature, const Quest* quest) override
	{
		if (quest->GetQuestId() == QUEST_FREE_FROM_HOLD)
		{
			creature->setFaction(FACTION_ESCORTEE);
			creature->SetStandState(UNIT_STAND_STATE_STAND);

			creature->AI()->Talk(SAY_GIL_START);

			creature->GetMotionMaster()->MovePath(346500, false); // Start Path from Waypoint_data
			if (npc_giltharesAI* pEscortAI = CAST_AI(npc_gilthares::npc_giltharesAI, creature->AI()))
				pEscortAI->Start(false, false, player->GetGUID(), quest);
		}
		return true;
	}

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_giltharesAI(creature);
	}

	struct npc_giltharesAI : public npc_escortAI
	{
		npc_giltharesAI(Creature* creature) : npc_escortAI(creature) { }

		void Reset() override { }

		void WaypointReached(uint32 waypointId) override
		{
			Player* player = GetPlayerForEscort();
			if (!player)
				return;

			switch (waypointId)
			{
			case 16:
				Talk(SAY_GIL_AT_LAST);
				break;
			case 17:
				Talk(SAY_GIL_PROCEED);
				break;
			case 18:
				Talk(SAY_GIL_FREEBOOTERS);
				break;
			case 37:
				Talk(SAY_GIL_ALMOST);
				break;
			case 47:
				Talk(SAY_GIL_SWEET);
				break;
			case 53:
				Talk(SAY_GIL_FREED);
				player->GroupEventHappens(QUEST_FREE_FROM_HOLD, me);
				break;
			}
		}

		void EnterCombat(Unit* who) override
		{
			//not always used
			if (rand32() % 4)
				return;

			//only aggro text if not player and only in this area
			if (who->GetTypeId() != TYPEID_PLAYER && me->GetAreaId() == AREA_BARRENS_MERCHANT_COAST)
			{
				// Random text from groupid 4
				Talk(SAY_GIL_AGGRO);
			}
		}
	};

};


/// Taskmaster Fizzule 
enum TaskmasterFizzule
{
	FACTION_FRIENDLY_F = 35,
	SPELL_FLARE = 10113,
	SPELL_FOLLY = 10137,
};

class npc_taskmaster_fizzule : public CreatureScript
{
public:
	npc_taskmaster_fizzule() : CreatureScript("npc_taskmaster_fizzule") { }

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_taskmaster_fizzuleAI(creature);
	}

	struct npc_taskmaster_fizzuleAI : public ScriptedAI
	{
		npc_taskmaster_fizzuleAI(Creature* creature) : ScriptedAI(creature)
		{
			Initialize();
			factionNorm = creature->getFaction();
		}

		void Initialize()
		{
			IsFriend = false;
			ResetTimer = 120000;
			FlareCount = 0;
		}

		uint32 factionNorm;
		bool IsFriend;
		uint32 ResetTimer;
		uint8 FlareCount;

		void Reset() override
		{
			Initialize();
			me->setFaction(factionNorm);
		}

		void DoFriend()
		{
			me->RemoveAllAuras();
			me->DeleteThreatList();
			me->CombatStop(true);

			me->StopMoving();
			me->GetMotionMaster()->MoveIdle();

			me->setFaction(FACTION_FRIENDLY_F);
			me->HandleEmoteCommand(EMOTE_ONESHOT_SALUTE);
		}

		void SpellHit(Unit* /*caster*/, const SpellInfo* spell) override
		{
			if (spell->Id == SPELL_FLARE || spell->Id == SPELL_FOLLY)
			{
				++FlareCount;

				if (FlareCount >= 2)
					IsFriend = true;
			}
		}

		void EnterCombat(Unit* /*who*/) override { }

		void UpdateAI(uint32 diff) override
		{
			if (IsFriend)
			{
				if (ResetTimer <= diff)
				{
					EnterEvadeMode();
					return;
				}
				else ResetTimer -= diff;
			}

			if (!UpdateVictim())
				return;

			DoMeleeAttackIfReady();
		}

		void ReceiveEmote(Player* /*player*/, uint32 emote) override
		{
			if (emote == TEXT_EMOTE_SALUTE)
			{
				if (FlareCount >= 2)
				{
					if (me->getFaction() == FACTION_FRIENDLY_F)
						return;

					DoFriend();
				}
			}
		}
	};

};


/// Wizzlecrank Shredder
enum Wizzlecrank
{
    SAY_START           = -1000298,
    SAY_STARTUP1        = -1000299,
    SAY_STARTUP2        = -1000300,
    SAY_MERCENARY       = -1000301,
    SAY_PROGRESS_1      = -1000302,
    SAY_PROGRESS_2      = -1000303,
    SAY_PROGRESS_3      = -1000304,
    SAY_END             = -1000305,

    QUEST_ESCAPE        = 863,
    FACTION_RATCHET     = 637,
    NPC_PILOT_WIZZ      = 3451,
    NPC_MERCENARY       = 3282
};

class npc_wizzlecrank_shredder : public CreatureScript
{
public:
    npc_wizzlecrank_shredder() : CreatureScript("npc_wizzlecrank_shredder") { }

    struct npc_wizzlecrank_shredderAI : public npc_escortAI
    {
        npc_wizzlecrank_shredderAI(Creature* creature) : npc_escortAI(creature)
        {
            IsPostEvent = false;
            PostEventTimer = 1000;
            PostEventCount = 0;
        }

        bool IsPostEvent;
        uint32 PostEventTimer;
        uint32 PostEventCount;

        void Reset()
        {
            if (!HasEscortState(STATE_ESCORT_ESCORTING))
            {
                if (me->getStandState() == UNIT_STAND_STATE_DEAD)
                     me->SetStandState(UNIT_STAND_STATE_STAND);

                IsPostEvent = false;
                PostEventTimer = 1000;
                PostEventCount = 0;
            }
        }

        void WaypointReached(uint32 waypointId)
        {
            switch (waypointId)
            {
                case 0:
                    DoScriptText(SAY_STARTUP1, me);
                    break;
                case 9:
                    SetRun(false);
                    break;
                case 17:
                    if (Creature* temp = me->SummonCreature(NPC_MERCENARY, 1128.489f, -3037.611f, 92.701f, 1.472f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 120000))
                    {
                        DoScriptText(SAY_MERCENARY, temp);
                        me->SummonCreature(NPC_MERCENARY, 1160.172f, -2980.168f, 97.313f, 3.690f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 120000);
                    }
                    break;
                case 24:
                    IsPostEvent = true;
                    break;
            }
        }

        void WaypointStart(uint32 PointId)
        {
            Player* player = GetPlayerForEscort();

            if (!player)
                return;

            switch (PointId)
            {
                case 9:
                    DoScriptText(SAY_STARTUP2, me, player);
                    break;
                case 18:
                    DoScriptText(SAY_PROGRESS_1, me, player);
                    SetRun();
                    break;
            }
        }

        void JustSummoned(Creature* summoned)
        {
            if (summoned->GetEntry() == NPC_PILOT_WIZZ)
                me->SetStandState(UNIT_STAND_STATE_DEAD);

            if (summoned->GetEntry() == NPC_MERCENARY)
                summoned->AI()->AttackStart(me);
        }

        void UpdateEscortAI(const uint32 Diff)
        {
            if (!UpdateVictim())
            {
                if (IsPostEvent)
                {
                    if (PostEventTimer <= Diff)
                    {
                        switch (PostEventCount)
                        {
                            case 0:
                                DoScriptText(SAY_PROGRESS_2, me);
                                break;
                            case 1:
                                DoScriptText(SAY_PROGRESS_3, me);
                                break;
                            case 2:
                                DoScriptText(SAY_END, me);
                                break;
                            case 3:
                                if (Player* player = GetPlayerForEscort())
                                {
                                    player->GroupEventHappens(QUEST_ESCAPE, me);
                                    me->SummonCreature(NPC_PILOT_WIZZ, 0.0f, 0.0f, 0.0f, 0.0f, TEMPSUMMON_TIMED_DESPAWN, 180000);
                                }
                                break;
                        }

                        ++PostEventCount;
                        PostEventTimer = 5000;
                    }
                    else
                        PostEventTimer -= Diff;
                }

                return;
            }

            DoMeleeAttackIfReady();
        }
    };

    bool OnQuestAccept(Player* player, Creature* creature, Quest const* quest)
    {
        if (quest->GetQuestId() == QUEST_ESCAPE)
        {
            creature->setFaction(FACTION_RATCHET);
            if (npc_escortAI* pEscortAI = CAST_AI(npc_wizzlecrank_shredder::npc_wizzlecrank_shredderAI, creature->AI()))
                pEscortAI->Start(true, false, player->GetGUID());
        }
        return true;
    }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_wizzlecrank_shredderAI(creature);
    }

};

class npc_muddy_tracks : public CreatureScript
{
public:
	npc_muddy_tracks() : CreatureScript("npc_muddy_tracks")
	{
	}

	enum Id
	{
		QUEST_SLUDGE_INVESTIGATION = 29087,
		CREDIT_SLUDGE_INVESTIGATION = 52166
	};

	bool OnGossipHello(Player* player, Creature* creature)
	{
		if (player->GetQuestStatus(QUEST_SLUDGE_INVESTIGATION) == QUEST_STATUS_INCOMPLETE)
		{
			player->KilledMonsterCredit(CREDIT_SLUDGE_INVESTIGATION);
			creature->AI()->Talk(0, player->GetGUID());
			creature->DespawnOrUnsummon(1);
		}
		return true;
	}


};

/// Baron Longshore - 3467
class npc_baron_longshore : public CreatureScript
{
public:
	npc_baron_longshore() : CreatureScript("npc_baron_longshore") { }

	enum eData
	{
		// Quests
		QUEST_THE_BARONS_DEMANDS	= 14046,
		QUEST_GAZLOWES_FORTUNE		= 14050,
		QUEST_FIND_BARON_LONGSHORE	= 14045,
		QUEST_MOST_UNUSUAL_MAP		= 14049,

		// Kill credit
		NPC_BARON_LONGSHORE_KILLCREDIT = 34769,

		// Gossip Menu and option
		GOSSIP_MENU_BARON = 10567,
		GOSSIP_OPTION	  = 0,
		GOSSIP_OPTION_1	  = 1,

		// Npc texts
		NPC_TEXT_BARON_1  = 14623, // No quest
		NPC_TEXT_BARON_2  = 14624, // Come on then, $r. Do ye trust me?
		NPC_TEXT_BARON_3  = 14625, // Well? Don't ye...
		NPC_TEXT_BARON_4  = 14626, // Suit yerself...

		// Action
		AttackPlayer	  = 1,
	};


	bool OnGossipHello(Player* player, Creature* creature)
	{
		if (player->HasQuest(QUEST_FIND_BARON_LONGSHORE))
		{
			if (creature->isQuestGiver())
				player->PrepareQuestMenu(creature->GetGUID());
			player->SEND_GOSSIP_MENU(NPC_TEXT_BARON_1, creature->GetGUID());
		}

		else if (player->HasQuest(QUEST_MOST_UNUSUAL_MAP))
		{
			if (creature->isQuestGiver())
				player->PrepareQuestMenu(creature->GetGUID());
			player->SEND_GOSSIP_MENU(NPC_TEXT_BARON_3, creature->GetGUID());
		}

		else if (player->GetQuestStatus(QUEST_THE_BARONS_DEMANDS) == QUEST_STATUS_INCOMPLETE)
		{
			player->ADD_GOSSIP_ITEM_DB(GOSSIP_MENU_BARON, GOSSIP_OPTION, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
			player->ADD_GOSSIP_ITEM_DB(GOSSIP_MENU_BARON, GOSSIP_OPTION_1, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 2);
			player->SEND_GOSSIP_MENU(NPC_TEXT_BARON_2, creature->GetGUID());
		}
		else {
			if (creature->isQuestGiver())
				player->PrepareQuestMenu(creature->GetGUID());
			player->SEND_GOSSIP_MENU(NPC_TEXT_BARON_1, creature->GetGUID());
		}

		return true;
	}

	bool OnGossipSelect(Player* player, Creature* creature, uint32 sender, uint32 action) override
	{
		player->PlayerTalkClass->ClearMenus();
		switch (action)
		{
			case GOSSIP_ACTION_INFO_DEF + 1:
				player->CLOSE_GOSSIP_MENU();
				player->SEND_GOSSIP_MENU(NPC_TEXT_BARON_4, creature->GetGUID());
				break;
			case GOSSIP_ACTION_INFO_DEF + 2:
				player->CLOSE_GOSSIP_MENU();
				creature->AI()->Talk(0, player->GetGUID()); // Har! Pleasure doin' business...
				player->KilledMonsterCredit(NPC_BARON_LONGSHORE_KILLCREDIT, player->GetGUID());
		}

		return true;
	}

	struct npc_baron_longshoreAI : public ScriptedAI
	{
		npc_baron_longshoreAI(Creature* p_Creature) : ScriptedAI(p_Creature) {	}

		uint64 m_PlayerGUID;

		void Reset() override
		{
			m_PlayerGUID = 0;
			if (!me->isSummon()) // Baron the Merchant Coast
				me->CastSpell(me, 104980, true); // Sit aura
		}

		void EnterCombat(Unit* who) override
		{
			if (!me->isSummon()) // Baron the Merchant Coast
				me->RemoveAurasDueToSpell(104980); // Remove sit aura
		}


		void JustDied(Unit* /*killer*/) override
		{
			if (!me->isSummon())
				me->setFaction(35);
		}

		void UpdateAI(const uint32 diff)
		{
			if (!me->isInCombat()) // If Baron at the Merchant Coast isn't in combat, cast sit spell.
				if (!me->isSummon())
					me->CastSpell(me, 104980, true); // Sit aura
		}
	};

	CreatureAI* GetAI(Creature* p_Creature) const override
	{
		return new npc_baron_longshoreAI(p_Creature);
	}

};


/// Gazlowe - 3391
class npc_gazlowe_3391 : public CreatureScript
{
public:
	npc_gazlowe_3391() : CreatureScript("npc_gazlowe_3391") { }

	enum eData
	{
		// Quest
		QUEST_UNUSUAL_MAP = 14049,

		// NPC
		NPC_GAGSPROCKET	  = 3495,

		// Texts
		GAZLOWE_TEXT_1 = 0, // Gagsprocket!
		GAGSPROCKET_TEXT_1 = 0, // Sure thing, boss.
		GAZLOWE_TEXT_2 = 1, // Thanks.

		// Action
		ActionCompletedQuest = 0,
	};

	bool OnQuestComplete(Player* p_Player, Creature* p_Creature, const Quest* p_Quest) override
	{
		if (p_Quest->GetQuestId() == QUEST_UNUSUAL_MAP)
		{
			p_Creature->GetAI()->DoAction(ActionCompletedQuest);
		}
		return false;
	}

	struct npc_gazlowe_3391AI : public ScriptedAI
	{
		npc_gazlowe_3391AI(Creature* p_Creature) : ScriptedAI(p_Creature) {}

		void Reset() override
		{
			ClearDelayedOperations();
		}


		void UpdateAI(const uint32 diff)
		{
			UpdateOperations(diff);
		}

		void DoAction(int32 const p_Action) override
		{
			switch (p_Action)
			{
				case ActionCompletedQuest:
				{
					AddTimedDelayedOperation(0.2 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->AI()->Talk(GAZLOWE_TEXT_1);
					});
					AddTimedDelayedOperation(2.5 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						if (Creature* Gagsprocket = me->FindNearestCreature(NPC_GAGSPROCKET, 10.0f, true))
							Gagsprocket->AI()->Talk(GAGSPROCKET_TEXT_1);
					});
					AddTimedDelayedOperation(3.5 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->AI()->Talk(GAZLOWE_TEXT_2);
					});
					break;
				}

			}
		}
	};

	CreatureAI* GetAI(Creature* p_Creature) const override
	{
		return new npc_gazlowe_3391AI(p_Creature);
	}

};


/// Chief Engineer Foote - 34754
class npc_chief_engineer_foote : public CreatureScript
{
public:
	npc_chief_engineer_foote() : CreatureScript("npc_chief_engineer_foote") { }

	enum eData
	{
		// Quest
		QUEST_CLUB_FOOTE = 14034,

		// NPC
		NPC_FOOTE = 34754,
		NPC_THERAMORE_DECK_HAND = 34707,
		NPC_CAROUSING_PEON = 34759,
		NPC_SASHYA = 34651,

		// Texts & gossip
		FOOTE_GOSSIP_MENU_1		= 10556,
		FOOTE_GOSSIP_MENU_2		= 10560,
		FOOTE_NPC_TEXT_1		= 14612,
		FOOTE_NPC_TEXT_2		= 14616,
		FOOTE_GOSSIP_OPTION		= 0,

		// Spell
		SPELL_CREATE_SHIP_SCHEMATICS = 66155,

		// Action
		ClubFoote = 0,
		BarFight = 1,
		SetHostileFaction = 2
	};

	bool OnGossipHello(Player* p_Player, Creature* p_Creature) override
	{
		p_Creature->HandleEmoteCommand(EMOTE_ONESHOT_WAVE_NOSHEATHE); // Wave

		if (p_Player->GetQuestStatus(QUEST_CLUB_FOOTE) == QUEST_STATUS_INCOMPLETE && p_Creature->GetHealthPct() == 100.0f) // if he's not dead, show first gossip menu
			p_Player->ADD_GOSSIP_ITEM_DB(FOOTE_GOSSIP_MENU_1, FOOTE_GOSSIP_OPTION, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF);
		if (p_Player->GetQuestStatus(QUEST_CLUB_FOOTE) == QUEST_STATUS_INCOMPLETE && p_Creature->GetHealthPct() == 0.0f) // if he's dead, show second gossip menu
			p_Player->ADD_GOSSIP_ITEM_DB(FOOTE_GOSSIP_MENU_2, FOOTE_GOSSIP_OPTION, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
			p_Player->SEND_GOSSIP_MENU(FOOTE_NPC_TEXT_2, p_Creature->GetGUID());
		if (p_Player->GetQuestStatus(QUEST_CLUB_FOOTE) == QUEST_STATUS_INCOMPLETE && p_Player->HasItemCount(46827, 1)) // if player got the item, show second gossip menu
			p_Player->SEND_GOSSIP_MENU(FOOTE_NPC_TEXT_2, p_Creature->GetGUID());

		p_Player->SEND_GOSSIP_MENU(FOOTE_NPC_TEXT_1, p_Creature->GetGUID());
		return true;
	}

	bool OnGossipSelect(Player* player, Creature* creature, uint32 /*sender*/, uint32 action) override
	{
		player->PlayerTalkClass->ClearMenus();

		if (action == GOSSIP_ACTION_INFO_DEF)
		{
			player->CLOSE_GOSSIP_MENU();
			creature->GetAI()->DoAction(ClubFoote);
			if (Creature* Sashya = player->FindNearestCreature(NPC_SASHYA, 15.0f, true))
				Sashya->AI()->Talk(0, player->GetGUID()); //  Hahaha, very nice, $n!
		}
		if (action == GOSSIP_ACTION_INFO_DEF + 1)
		{
			player->CLOSE_GOSSIP_MENU();
			player->CastSpell(player, SPELL_CREATE_SHIP_SCHEMATICS, true); // Award item
			creature->DespawnOrUnsummon(5000);
		}

		return true;
	}

	struct npc_chief_engineer_footeAI : public ScriptedAI
	{
		npc_chief_engineer_footeAI(Creature* p_Creature) : ScriptedAI(p_Creature) {}

		// Lists
		std::list<Creature*> Peons;
		std::list<Creature*> DeckHands;

		// Drink
		uint32 DrinkTimer;

		void Reset() override
		{
			DrinkTimer = 7000;
		}

		void UpdateAI(const uint32 diff)
		{
			if (me->GetHealthPct() == 100.0f) // If quest event undergoing - don't drink because ya dead
				if (DrinkTimer <= diff)
				{
					me->CastSpell(me, 162442); // Drink while sitting spell
					DrinkTimer = 7000;
				}
				else
					DrinkTimer -= diff;
		}

		void DoAction(int32 const p_Action) override
		{
			switch (p_Action)
			{
			case ClubFoote:
			{
				// Die
				me->setRegeneratingHealth(false);
				me->SetHealth(me->CountPctFromMaxHealth(0));
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_NPC);
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PC);
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_UNK_15);
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_UNK_29);
				// Gossip flag
				me->SetFlag(UNIT_FIELD_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP);


				me->AI()->DoAction(BarFight);
				break;
			}
			case BarFight:
			{
				me->GetCreatureListWithEntryInGrid(Peons, NPC_CAROUSING_PEON, 20.0f);
				me->GetCreatureListWithEntryInGrid(DeckHands, NPC_THERAMORE_DECK_HAND, 20.0f);


				for (auto peon : Peons)
				{
					if (peon->GetGUIDLow() == 265060)
						peon->GetMotionMaster()->MovePoint(0, -1044.2826, -3652.5847, 23.8791, true);
					else if (peon->GetGUIDLow() == 265059)
						peon->GetMotionMaster()->MovePoint(0, -1048.0774, -3643.3633, 23.8791, true);
				}

				for (auto hand : DeckHands)
				{
					if (hand->GetGUIDLow() == 265490)
					{
						hand->GetMotionMaster()->MovePoint(0, -1048.6938, -3654.7166, 23.8777, true);
						hand->AI()->DoAction(SetHostileFaction);
					}
					else if (hand->GetGUIDLow() == 265488)
					{
						hand->GetMotionMaster()->MovePoint(0, -1049.5637, -3642.4080, 23.8778, true);
						hand->AI()->DoAction(SetHostileFaction);
					}
				}
				break;
			}
			}
		}
	};

	CreatureAI* GetAI(Creature* p_Creature) const override
	{
		return new npc_chief_engineer_footeAI(p_Creature);
	}

};

/// Theramore Deckhand - 34707
class npc_theramore_deckhand : public CreatureScript
{
public:
	npc_theramore_deckhand() : CreatureScript("npc_theramore_deckhand") { }

	enum eData
	{
		// Quest
		QUEST_CLUB_FOOTE = 14034,

		// NPC
		NPC_THERAMORE_DECK_HAND = 34707,
		NPC_CAROUSING_PEON = 34759,

		// Action
		SetHostileFaction = 2
	};


	struct npc_theramore_deckhandAI : public ScriptedAI
	{
		npc_theramore_deckhandAI(Creature* p_Creature) : ScriptedAI(p_Creature) {}

		std::list<Creature*> Peons;

		void Reset() override
		{
			if (me->GetGUID() == 265490 || 265488)
				me->setFaction(35); // Friendly faction to horde inside Ratchet Pub
				ClearDelayedOperations();
		}

		void JustDied(Unit* killer) override
		{
			if (Creature* hand = me->FindNearestCreature(NPC_THERAMORE_DECK_HAND, 20.0f, true)) // Find alive Theramore Deckhand nearby, if none, return peons to home position
				return;
			else
			{
				me->GetCreatureListWithEntryInGrid(Peons, NPC_CAROUSING_PEON, 20.0f);
				for (auto peon : Peons)
				{
					peon->GetMotionMaster()->MoveTargetedHome();
				}
			}
			
		}

		void DoAction(int32 const p_Action) override
		{
			switch (p_Action)
			{
				case SetHostileFaction:
					AddTimedDelayedOperation(1 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						if (me->GetGUID() == 265490 || 265488)
						{
							me->setFaction(1077); // hostile faction
							if (Player* player = me->FindNearestPlayer(10.0f, true))
								me->CombatStart(player);
						}
							
					});
					break;
			}
		}

		void UpdateAI(uint32 const p_Diff)
		{
			UpdateOperations(p_Diff);
		}

	};

	CreatureAI* GetAI(Creature* p_Creature) const override
	{
		return new npc_theramore_deckhandAI(p_Creature);
	}

};



enum eMisc
{
	QUEST_THROUGH_FIRE_AND_FLAMES = 13878,
	NPC_TRAPPED_WOLF = 34285,
	NPC_CHAIN_ORIGIN = 34287,
	SPELL_CHAINED_TO_STABLES = 65072,
};

/// Trapped Wolf - 34285
class npc_trapped_wolf_34285 : public CreatureScript
{
public:
	npc_trapped_wolf_34285() : CreatureScript("npc_trapped_wolf_34285") { }

	struct npc_trapped_wolf_34285AI : public ScriptedAI
	{
		npc_trapped_wolf_34285AI(Creature* creature) : ScriptedAI(creature) { }

		uint32 m_phase;

		void Reset() override
		{
			ClearDelayedOperations();
			m_phase = 0;
			if (Creature* chain = me->FindNearestCreature(NPC_CHAIN_ORIGIN, 6.0f))
				chain->CastSpell(me, SPELL_CHAINED_TO_STABLES);
		}

		void MovementInform(uint32 type, uint32 id)
		{
			if (POINT_MOTION_TYPE && id == 3)
				me->DespawnOrUnsummon(1000);
			if (POINT_MOTION_TYPE && id == 4)
				me->DespawnOrUnsummon(1000);
			if (POINT_MOTION_TYPE && id == 5)
				me->DespawnOrUnsummon(1000);
		}

		void UpdateAI(uint32 diff) override
		{
			UpdateOperations(diff);
		}

		void DoAction(int32 param)
		{
			if (param == 1 && m_phase == 0)
			{
				Position const JumpPos1 = { 0.3669f, -3623.7881f, 27.2661f };
				Position const JumpPos2 = { -6.0912f, -3631.3662f, 27.3775f };
				Position const JumpPos3 = { -5.4593f, -3629.0918f, 27.3414f };

				Position l_Pos;
				me->GetPosition(&l_Pos);

				m_phase = 1;
				me->RemoveAura(SPELL_CHAINED_TO_STABLES);

				if (me->GetGUID() == 262550) // First wolf to the right
					me->GetMotionMaster()->MoveJump(JumpPos1, 2.0f, 2.0f);
				if (me->GetGUID() == 262549) // Second wolf to the right
					me->GetMotionMaster()->MoveJump(JumpPos2, 2.0f, 2.0f);
				if (me->GetGUID() == 262547) // First wolf to the left
					me->GetMotionMaster()->MoveJump(JumpPos3, 2.0f, 2.0f);

				AddTimedDelayedOperation(1 * TimeConstants::IN_MILLISECONDS, [this]() -> void
				{
					if (me->GetGUID() == 262550) // First wolf to the right
						me->GetMotionMaster()->MovePoint(3, 32.8923f, -3584.7568f, 27.2072f);
					if (me->GetGUID() == 262549) // Second wolf to the right
						me->GetMotionMaster()->MovePoint(4, 71.8425f, -3592.7722f, 29.5665f);
					if (me->GetGUID() == 262547) // First wolf to the left
						me->GetMotionMaster()->MovePoint(5, 24.2533f, -3606.0254f, 27.2008f);
				});
			}
		}
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_trapped_wolf_34285AI(creature);
	}
};

/// Chain Origin - 34287
class npc_chain_origin_34287 : public CreatureScript
{
public:
	npc_chain_origin_34287() : CreatureScript("npc_chain_origin_34287") { }

	struct npc_chain_origin_34287AI : public ScriptedAI
	{
		npc_chain_origin_34287AI(Creature* creature) : ScriptedAI(creature) { }

		void Reset() override
		{
			if (Creature* wolf = me->FindNearestCreature(NPC_TRAPPED_WOLF, 6.0f))
			{
				me->CastSpell(wolf, SPELL_CHAINED_TO_STABLES);
			}
		}
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_chain_origin_34287AI(creature);
	}
};

/// Wolf Chains - 195001, 195003, 195004
class go_wolf_chains : public GameObjectScript
{
public:
	go_wolf_chains() : GameObjectScript("go_wolf_chains") { }

	struct go_wolf_chainsAI : public GameObjectAI
	{
		go_wolf_chainsAI(GameObject* go) : GameObjectAI(go) { }

		bool GossipHello(Player* player) override
		{
			if (player->GetQuestStatus(QUEST_THROUGH_FIRE_AND_FLAMES) == QUEST_STATUS_INCOMPLETE)
				player->KilledMonsterCredit(NPC_TRAPPED_WOLF);

			return true;
		}
		 
		void OnStateChanged(uint32 p_State) override
		{
			if (Creature* wolf = go->FindNearestCreature(NPC_TRAPPED_WOLF, 6.0f, true))
				wolf->AI()->DoAction(1);
		}
	};

	GameObjectAI* GetAI(GameObject* go) const override
	{
		return new go_wolf_chainsAI(go);
	}
};


/// Wyneth - 34846
class npc_wyneth_34846 : public CreatureScript
{
public:
	npc_wyneth_34846() : CreatureScript("npc_wyneth_34846") { }

	enum eMisc
	{
		QUEST_VEROG_THE_DERVISH = 851,
		NPC_VEROG_THE_DERVISH = 3395,
	};

	struct npc_wyneth_34846AI : public ScriptedAI
	{
		npc_wyneth_34846AI(Creature* creature) : ScriptedAI(creature) { }

		void JustDied(Unit* killer) override
		{
			if (Player* player = killer->ToPlayer())
				if (player->GetQuestStatus(QUEST_VEROG_THE_DERVISH) == QUEST_STATUS_INCOMPLETE)
				{
					Talk(1); // Wyneth calls out for her mate!
					player->SummonCreature(NPC_VEROG_THE_DERVISH, -1192.7513f, -2784.4805f, 93.1899f, 2.026213f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 60000); // Summon Verog
				}
		}
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_wyneth_34846AI(creature);
	}
};

/// Verog the Dervish - 3395
class npc_verog_the_dervish_3395 : public CreatureScript
{
public:
	npc_verog_the_dervish_3395() : CreatureScript("npc_verog_the_dervish_3395") { }

	enum eMisc
	{
		SPELL_RUSHING_CHARGE = 6268
	};

	struct npc_verog_the_dervish_3395AI : public ScriptedAI
	{
		npc_verog_the_dervish_3395AI(Creature* creature) : ScriptedAI(creature) { }

		uint64 m_PlayerGUID;
		Position const UpHillPos = { -1208.0637f, -2746.6877f, 102.1685f, 1.708126f };

		void Reset() override
		{
			m_PlayerGUID = 0;
		}

		void IsSummonedBy(Unit* summoner) override
		{
			if (Player* player = summoner->ToPlayer())
				m_PlayerGUID = player->GetGUID();

			me->GetMotionMaster()->MovePoint(1, UpHillPos);
		}

		void EnterCombat(Unit* who) override
		{
			DoCastVictim(SPELL_RUSHING_CHARGE);
		}

		void MovementInform(uint32 type, uint32 id) override
		{
			if (type == POINT_MOTION_TYPE && id == 1)
			{
				if (Player* opponent = ObjectAccessor::GetPlayer(*me, m_PlayerGUID))
					me->CombatStart(opponent);
			}
		}
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_verog_the_dervish_3395AI(creature);
	}
};


/// ***************************** Quest: Crossroads Caravan Pickup ***************************** ///

enum CaravanPickup
{
	/// QUEST
	QUEST_CROSSROADS_CARAVAN_PICKUP = 13949,

	/// Npcs
	NPC_LEAD_CARAVAN_KODO = 34430,
	NPC_FAR_WATCH_CARAVAN_KODO = 34432,
	NPC_RIDING_SHOTGUN = 34438,
	NPC_BALGOR_WHIPSHANK = 34431,
	NPC_HALGA_BLOODEYE = 34258,
	NPC_RAZORMANE_RAIDER = 34487,
	NPC_ROCCO_WHIPSHANK_CARAVAN1_QUEST_CREDIT = 53613,

	/// Spells
	SPELL_RIDE_VEHICLE = 63316,
	SPELL_SUMMON_KODO_PART1 = 65486,
	SPELL_GENERIC_DISMOUNT_CANCEL_SHAPESHIFT = 61286,
	SPELL_CALL_A_PACK_KODO = 65494,
	SPELL_DISMOUNT_CARAVEN_KODO_CUE_PART1 = 65557,
	SPELL_RIDE_CARAVAN_KODO = 65466,
	SPELL_SUMMON_ANGRY_RAZORMANE_RAIDER = 65496,
	SPELL_QUEST_COMPLETE = 65561,


	/// Misc
	NPC_TEXT_HALGA_QUEST = 14546,
	NPC_TEXT_HALGA		 = 14545,
	GOSSIP_MENU_HALGA	 = 10514,
};

/// Razormane Raider - 34487
class npc_razormane_raider_34487 : public CreatureScript
{
public:
	npc_razormane_raider_34487() : CreatureScript("npc_razormane_raider_34487") { }

	struct npc_razormane_raider_34487AI : public ScriptedAI
	{
		npc_razormane_raider_34487AI(Creature* creature) : ScriptedAI(creature) { }

		uint32 m_phase;
		uint32 m_timer;
		float m_target;
		bool m_isRiding;
		uint64 m_kodoPackGUID;

		void Reset() override
		{
			m_phase = 0;
			m_timer = 0;
			m_isRiding = false;
			m_kodoPackGUID = 0;
			me->SetUInt32Value(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_NPC);
		}

		void SetGUID(uint64 guid, int32 id = 0)
		{
			switch (id)
			{
			case NPC_FAR_WATCH_CARAVAN_KODO:
				m_kodoPackGUID = guid;
				if (Creature* kodo2 = ObjectAccessor::GetCreature(*me, m_kodoPackGUID))
				{
					m_target = RAND(frand(4.0f, 5.2f), frand(0.9f, 2.1f));
					me->SetSpeed(MOVE_WALK, 4.1f);
					me->SetSpeed(MOVE_RUN, 4.2f);
					me->SetWalk(false);
					me->GetMotionMaster()->MoveFollow(kodo2, frand(0.1f, 1.5f), m_target);
					m_phase = 1;
					m_timer = 100;
				}
				break;
			}
		}

		void UpdateAI(uint32 diff) override
		{
			if (m_timer < diff)
			{
				m_timer = 1000;
				if (m_phase) DoWork();
			}
			else
				m_timer -= diff;

			if (!UpdateVictim())
				return;

			DoMeleeAttackIfReady();
		}

		void DoWork()
		{
			Creature* kodo2 = ObjectAccessor::GetCreature(*me, m_kodoPackGUID);
			if (!kodo2)
			{
				me->DespawnOrUnsummon(100);
				return;
			}

			m_phase++;

			if (m_phase > 7 && !m_isRiding)
			{
				me->CastSpell(kodo2, SPELL_RIDE_VEHICLE);
				m_isRiding = true;
			}
		}
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_razormane_raider_34487AI(creature);
	}
};

/// Halga Bloodeye - 34258
class npc_halga_bloodeye_34258 : public CreatureScript
{
public:
	npc_halga_bloodeye_34258() : CreatureScript("npc_halga_bloodeye_34258") { }

	bool OnGossipHello(Player* player, Creature* creature) override
	{
		if (player->GetQuestStatus(QUEST_CROSSROADS_CARAVAN_PICKUP) == QUEST_STATUS_INCOMPLETE)
		{
			player->ADD_GOSSIP_ITEM_DB(GOSSIP_MENU_HALGA, 0, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF);
			player->SEND_GOSSIP_MENU(NPC_TEXT_HALGA_QUEST, creature->GetGUID());
		}
		else {
			player->SEND_GOSSIP_MENU(NPC_TEXT_HALGA, creature->GetGUID());
		}
		return true;
	}

	bool OnGossipSelect(Player* player, Creature* creature, uint32 /*sender*/, uint32 action) override
	{
		player->PlayerTalkClass->ClearMenus();
		
		switch (action)
		{
			if (action == GOSSIP_ACTION_INFO_DEF)
			{
				player->CLOSE_GOSSIP_MENU();
				creature->HandleEmoteCommand(EMOTE_ONESHOT_WAVE_NOSHEATHE);

				if (player->GetQuestStatus(QUEST_CROSSROADS_CARAVAN_PICKUP) == QUEST_STATUS_INCOMPLETE)
				{
					creature->CastSpell(player, SPELL_SUMMON_KODO_PART1, true); // Summon Lead Caravan Kodo
					creature->CastSpell(player, SPELL_GENERIC_DISMOUNT_CANCEL_SHAPESHIFT);
					creature->GetAI()->SetGUID(player->GetGUID(), 99999);
					return true;
				}
				return false;
			}
		}
	}

	struct npc_halga_bloodeye_34258AI : public ScriptedAI
	{
		npc_halga_bloodeye_34258AI(Creature* creature) : ScriptedAI(creature) { }

		uint32 m_phase;
		uint32 m_timer;
		uint64 m_playerGUID;

		void Reset() override
		{
			m_phase = 0;
			m_timer = 0;
			m_playerGUID = 0;
		}

		void JustSummoned(Creature* summon) override
		{
			switch (summon->GetEntry())
			{
			case NPC_LEAD_CARAVAN_KODO:
				summon->AI()->SetGUID(me->GetGUID(), me->GetEntry());
				summon->AI()->SetGUID(m_playerGUID, 99999);
				break;
			}
		}

		void SetGUID(uint64 guid, int32 id = 0) override
		{
			switch (id)
			{
			case 99999:
				if (!m_playerGUID)
					m_playerGUID = guid;
				break;
			}
		}
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_halga_bloodeye_34258AI(creature);
	}
};

/// Lead Caravan Kodo - 34430
class npc_lead_caravan_kodo_34430 : public CreatureScript
{
public:
	npc_lead_caravan_kodo_34430() : CreatureScript("npc_lead_caravan_kodo_34430") { }

	struct npc_lead_caravan_kodo_34430AI : public ScriptedAI
	{
		npc_lead_caravan_kodo_34430AI(Creature* creature) : ScriptedAI(creature) { }

		uint32 m_phase;
		uint32 m_timer;
		bool m_IsArrived;
		uint64 m_halgaGUID;
		uint64 m_playerGUID;
		uint64 m_gunnerGUID;
		uint64 m_balgorGUID;
		uint64 m_kodoPackGUID;

		void Reset() override
		{
			events.Reset();
			m_phase = 1;
			m_timer = 1000;
			m_IsArrived = false;
			m_halgaGUID = 0;
			m_playerGUID = 0;
			m_gunnerGUID = 0;
			m_balgorGUID = 0;
			m_kodoPackGUID = 0;
			me->SetUInt32Value(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_NPC);
		}

		void MovementInform(uint32 type, uint32 id) override
		{
			if (POINT_MOTION_TYPE && id == 21) // After being summoned
				me->CastSpell(me, SPELL_CALL_A_PACK_KODO);
				if (Creature* halga = me->FindNearestCreature(NPC_HALGA_BLOODEYE, 30.0f, true))
				{
					halga->SetFacingToObject(me);
					if (Player* player = ObjectAccessor::GetPlayer(*me, m_playerGUID))
						halga->AI()->Talk(0, m_playerGUID);
				}
			else if (POINT_MOTION_TYPE && id == 22) // Arrival at Far Watch
			{
				me->DespawnOrUnsummon(1000);
				if (Creature* gunner = ObjectAccessor::GetCreature(*me, m_gunnerGUID))
					gunner->DespawnOrUnsummon(100);
				if (Creature* balgor = ObjectAccessor::GetCreature(*me, m_balgorGUID))
				{
					me->CastSpell(balgor, SPELL_DISMOUNT_CARAVEN_KODO_CUE_PART1);
					balgor->DespawnOrUnsummon(1000);
				}
			}
			else if (WAYPOINT_MOTION_TYPE && id == 2)
			{
				Player* player = ObjectAccessor::GetPlayer(*me, m_playerGUID);
				Creature* gunner = ObjectAccessor::GetCreature(*me, m_gunnerGUID);
				if (player && gunner)
					gunner->AI()->Talk(0, m_playerGUID); // Defend the Caravan Kodo!
			}
			else if (WAYPOINT_MOTION_TYPE && id > 4 && id < 17)
				CreateAttack();
			else if (WAYPOINT_MOTION_TYPE && id == 19)
				TargetArrived();
		}

		void JustSummoned(Creature* summon) override
		{
			switch (summon->GetEntry())
			{
			case NPC_BALGOR_WHIPSHANK:
				m_balgorGUID = summon->GetGUID();
				summon->AI()->SetGUID(me->GetGUID(), me->GetEntry());
				break;
			case NPC_FAR_WATCH_CARAVAN_KODO:
				m_kodoPackGUID = summon->GetGUID();
				summon->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_MOVE);
				break;
			case NPC_RIDING_SHOTGUN:
				m_gunnerGUID = summon->GetGUID();
				summon->AI()->SetGUID(me->GetGUID(), me->GetEntry());
				break;
			case NPC_RAZORMANE_RAIDER:
				summon->AI()->SetGUID(m_kodoPackGUID, NPC_FAR_WATCH_CARAVAN_KODO);
				break;
			}
		}

		void SetGUID(uint64 guid, int32 id = 0)
		{
			switch (id)
			{
			case NPC_HALGA_BLOODEYE:
				m_halgaGUID = guid;
				break;
			case 99999:
				if (!m_playerGUID)
					m_playerGUID = guid;
				break;
			default:
				break;
			}
		}

		uint64 GetGUID(int32 id = 0) const
		{
			switch (id)
			{
			case NPC_BALGOR_WHIPSHANK:
				return m_balgorGUID;
			case NPC_FAR_WATCH_CARAVAN_KODO:
				return m_kodoPackGUID;
			case NPC_RIDING_SHOTGUN:
				return m_gunnerGUID;
			default:
				return 0;
			}
		}

		void PassengerBoarded(Unit* passenger, int8 seatId, bool apply)
		{
			if (apply)
			{
				if (passenger->GetEntry() == NPC_RIDING_SHOTGUN)
				{
					Player* player = ObjectAccessor::GetPlayer(*me, m_playerGUID);
					Creature* kodo2 = ObjectAccessor::GetCreature(*me, m_kodoPackGUID);
					if (player && kodo2)
					{
						player->CastSpell(passenger, SPELL_RIDE_CARAVAN_KODO, true);
						kodo2->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_MOVE);
						kodo2->SetUInt32Value(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_NPC);
						kodo2->GetMotionMaster()->MoveFollow(me, 15.0f, M_PI);
						kodo2->SetWalk(true);
						me->GetMotionMaster()->MovePath(3443001, false);
					}
				}
			}
			else
			{
				if (!m_IsArrived)
					if (passenger->GetEntry() == NPC_RIDING_SHOTGUN)
					{
						me->CastSpell(me, SPELL_DISMOUNT_CARAVEN_KODO_CUE_PART1);
						me->DespawnOrUnsummon(1000);
						if (Creature* kodo2 = ObjectAccessor::GetCreature(*me, m_kodoPackGUID))
							kodo2->DespawnOrUnsummon(1000);
						if (Creature* balgor = ObjectAccessor::GetCreature(*me, m_balgorGUID))
							balgor->DespawnOrUnsummon(1000);
					}
			}
		}


		void UpdateAI(uint32 diff) override
		{
			if (m_timer < diff)
			{
				m_timer = 1000;
				if (m_phase) DoWork();
			}
			else
				m_timer -= diff;

			events.Update(diff);

			if (!UpdateVictim())
				return;				

			DoMeleeAttackIfReady();
		}

		void DoWork()
		{
			switch (m_phase)
			{
			case 1:
			{
				if (Creature* halga = me->FindNearestCreature(NPC_HALGA_BLOODEYE, 30.0f, true))
				{
					me->SummonCreature(NPC_BALGOR_WHIPSHANK, 321.8f, -3699.1f, 27.03f);
					me->SummonCreature(NPC_RIDING_SHOTGUN, 323.8f, -3697.1f, 27.03f);
					me->GetMotionMaster()->MovePoint(21, 318.54f, -3670.49f, 27.18f);
					m_phase = 2;
				}
				break;
			}
			case 2:
				break;
			case 3:
				me->GetMotionMaster()->MovePoint(22, 199.76f, -2979.85f, 91.67f);
				m_phase = 4;
				break;
			case 4:
				break;
			}
		}

		void CreateAttack()
		{
			if (Creature* gunner = ObjectAccessor::GetCreature(*me, m_gunnerGUID))
			{
				std::list<Creature*> cList;
				me->GetCreatureListWithEntryInGrid(cList, NPC_RAZORMANE_RAIDER, 40.0f);
				for (uint32 i = cList.size(); i < urand(3, 5); i++)
					me->CastSpell(gunner, SPELL_SUMMON_ANGRY_RAZORMANE_RAIDER, true);
			}
		}

		void TargetArrived()
		{
			m_IsArrived = true;
			if (Creature* balgor = ObjectAccessor::GetCreature(*me, m_balgorGUID))
				balgor->AI()->Talk(0);
			if (Player* player = ObjectAccessor::GetPlayer(*me, m_playerGUID))
			{
				player->KilledMonsterCredit(NPC_ROCCO_WHIPSHANK_CARAVAN1_QUEST_CREDIT);
				player->CastSpell(player, SPELL_QUEST_COMPLETE);
				player->ExitVehicle();
				player->CompleteQuest(QUEST_CROSSROADS_CARAVAN_PICKUP);
			}
			m_phase = 3;
			m_timer = 3000;
		}
	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_lead_caravan_kodo_34430AI(creature);
	}
};

/// Balgor Whipshank - 34431
class npc_balgor_whipshank_34431 : public CreatureScript
{
public:
	npc_balgor_whipshank_34431() : CreatureScript("npc_balgor_whipshank_34431") { }

	struct npc_balgor_whipshank_34431AI : public ScriptedAI
	{
		npc_balgor_whipshank_34431AI(Creature* creature) : ScriptedAI(creature) { }

		uint64 m_kodoLeaderGUID;

		void Reset() override
		{
			m_kodoLeaderGUID = 0;
		}

		void SetGUID(uint64 guid, int32 id = 0)
		{
			switch (id)
			{
			case NPC_LEAD_CARAVAN_KODO:
				m_kodoLeaderGUID = guid;
				if (Creature* kodo = ObjectAccessor::GetCreature(*me, guid))
					me->EnterVehicle(kodo, 0);
				break;
			case 34577:
			{
				m_kodoLeaderGUID = guid;
				if (Creature* kodo = ObjectAccessor::GetCreature(*me, guid))
					me->EnterVehicle(kodo, 0);
				break;
			}
			}
		}

		uint64 GetGUID(int32 id = 0) const
		{
			switch (id)
			{
			case NPC_LEAD_CARAVAN_KODO:
				return m_kodoLeaderGUID;
			case 34577:
				return m_kodoLeaderGUID;
			default:
				return 0;
			}
		}
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_balgor_whipshank_34431AI(creature);
	}
};

/// Vehicle Riding Shotgun - 34438
class vehicle_riding_shotgun_34438 : public VehicleScript
{
public:
	vehicle_riding_shotgun_34438() : VehicleScript("npc_riding_shotgun_34438") { }

	void OnAddPassenger(Vehicle* p_Vehicle, Unit* passenger, int8 /*seatId*/) override
	{
		passenger->SetFacingTo(M_PI);
		p_Vehicle->RelocatePassengers();
	}

	void OnRemovePassenger(Vehicle* veh, Unit* passenger) override
	{
		if (Creature* gunner = veh->GetBase()->ToCreature())
			gunner->DespawnOrUnsummon(100);
	}
};

/// Spell - Mount Caravan Kodo Cue - 65485
class spell_mount_caravan_kodo_cue_65485 : public SpellScriptLoader
{
public:
	spell_mount_caravan_kodo_cue_65485() : SpellScriptLoader("spell_mount_caravan_kodo_cue_65485") { }

	class spell_mount_caravan_kodo_cue_65485_SpellScript : public SpellScript
	{
		PrepareSpellScript(spell_mount_caravan_kodo_cue_65485_SpellScript);

		void SetMount(SpellEffIndex effIndex)
		{
			if (Unit* unit = GetCaster())
				if (Player* player = unit->ToPlayer())
					if (Creature* kodo1 = player->FindNearestCreature(NPC_LEAD_CARAVAN_KODO, 6.0f, true)) //  how to find kodo as spell target?? GetCaster and GetHitUnit are both player
						if (Creature* gunner = ObjectAccessor::GetCreature(*unit, kodo1->AI()->GetGUID(NPC_RIDING_SHOTGUN)))
						{
							kodo1->AI()->SetGUID(player->GetGUID(), 99999);
							gunner->EnterVehicle(kodo1, 1);
						}
		}

		void Register()
		{
			OnEffectHit += SpellEffectFn(spell_mount_caravan_kodo_cue_65485_SpellScript::SetMount, EFFECT_0, SPELL_EFFECT_DUMMY);
		}
	};

	SpellScript* GetSpellScript() const
	{
		return new spell_mount_caravan_kodo_cue_65485_SpellScript();
	}
};

/// ***************************** End Quest: Crossroads Caravan Delivery ***************************** ///

/// ***************************** Quests: Drag It Out Of Them & By Hook Or By Crook ***************************** ///
/// Razormane Pillager - 34503
class npc_razormane_pillager_34503 : public CreatureScript
{
public:
	npc_razormane_pillager_34503() : CreatureScript("npc_razormane_pillager_34503") { }

	enum eRazormane
	{
		QUEST_DRAG_IT_OUT_OF_THEM = 13961,
		SPELL_GROLDOM_NET = 65580,
		SPELL_SNARED_IN_NET = 65581,
		SPELL_GET_A_HOGTIED_RAZORMANE = 65599,
		SPELL_PERMANENT_FEIGN_DEATH = 29266,
		SPELL_SUMMON_HOGTIED_RAZORMANE = 65595,
		PLAYER_GUID = 99999,
	};

	bool OnGossipSelect(Player* player, Creature* creature, uint32 sender, uint32 action)
	{
		if (player->GetQuestStatus(QUEST_DRAG_IT_OUT_OF_THEM) == QUEST_STATUS_INCOMPLETE)
			if (action == 1)
			{
				Position pos;
				creature->GetPosition(&pos);
				creature->SetHomePosition(pos);
				player->CastSpell(creature, SPELL_GET_A_HOGTIED_RAZORMANE);
				creature->AI()->SetGUID(player->GetGUID(), PLAYER_GUID);
				creature->AI()->DoAction(1);
				return true;
			}

		return false;
	}

	struct npc_razormane_pillager_34503AI : public ScriptedAI
	{
		npc_razormane_pillager_34503AI(Creature* creature) : ScriptedAI(creature) { }

		uint32 m_timer;
		uint32 m_phase;
		uint64 m_playerGUID;

		void Reset() override
		{
			m_timer = 0;
			m_phase = 0;
			m_playerGUID = 0;
		}

		void SpellHit(Unit* caster, SpellInfo const* spell) override
		{
			if (spell->Id == SPELL_GROLDOM_NET)
			{
				me->setFaction(1933);
				me->SetUInt32Value(UNIT_FIELD_NPC_FLAGS, UNIT_FIELD_NPC_FLAGS);
				me->SetUInt32Value(UNIT_FIELD_FLAGS, UNIT_FLAG_RENAME || UNIT_FLAG_STUNNED || UNIT_FLAG_IN_COMBAT || UNIT_FLAG_DISABLE_MOVE);
				me->CastSpell(me, SPELL_SNARED_IN_NET, true);
				me->SetDisplayId(1344);
				Talk(1);
			}
		}

		void SetGUID(uint64 guid, int32 id = 0) override
		{
			switch (id)
			{
			case 99999:
				if (!m_playerGUID)
					m_playerGUID = guid;
				break;
			}
		}

		uint64 GetGUID(int32 id = 0) override
		{
			switch (id)
			{
			case 99999:
				return m_playerGUID;
			default:
				return 0;
			}
		}

		void DoAction(int32 param) override
		{
			switch (param)
			{
			case 1:
				m_phase = 1;
				m_timer = 1000;
				break;
			default:
				break;
			}
		}

		void DamageTaken(Unit* pWho, uint32& uiDamage, SpellInfo const*  /*p_SpellInfo*/) override
		{
			if (me->HealthBelowPct(15.0f))
			{
				me->GetMotionMaster()->MoveFleeing(pWho);
				me->AI()->Talk(0);
			}
		}

		void UpdateAI(uint32 diff)
		{
			if (m_timer < diff)
			{
				m_timer = 1000;
				if (m_phase)
					DoWork();
			}
			else
				m_timer -= diff;

			if (!UpdateVictim())
				return;
			else
				DoMeleeAttackIfReady();
		}

		void DoWork()
		{
			switch (m_phase)
			{
			case 1:
			{
				me->CastSpell(me, SPELL_PERMANENT_FEIGN_DEATH);
				if (Player* player = ObjectAccessor::GetPlayer(*me, m_playerGUID))
				{
					player->CastSpell(player, SPELL_SUMMON_HOGTIED_RAZORMANE);

				}
				m_phase = 2;
				m_timer = 50;
				break;
			}
			case 2:
			{
				if (Creature* raz = me->FindNearestCreature(34514, 10.0f))
					raz->AI()->SetGUID(m_playerGUID, PLAYER_GUID);
				me->DespawnOrUnsummon(200);
				m_phase = 0;
				m_timer = 0;
				break;
			}
			}
		}
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_razormane_pillager_34503AI(creature);
	}
};

/// Hogtied Razormane - 34514
class npc_hogtied_razormane_34514 : public CreatureScript
{
public:
	npc_hogtied_razormane_34514() : CreatureScript("npc_hogtied_razormane_34514") { }

	enum eRazormane
	{
		NPC_TOGRIK_34513 = 34513,
		QUEST_DRAG_IT_OUT_OF_THEM = 13961,
		SPELL_DEAD_SOLDIER = 45801,
		SPELL_HOGTIED_RAZORMANE_ROPE = 65596,
		SPELL_DRAGGING_A_RAZORMANE = 65601,
		SPELL_RAZORMANE_DRAGGING_AURA = 65608,
		SPELL_SUMMON_HOGTIED_RAZORMANE = 65595,
		SPELL_RAZORMANE_DRAGGING_TRIGGER = 65610,
		PLAYER_GUID = 99999,
	};

	struct npc_hogtied_razormane_34514AI : public ScriptedAI
	{
		npc_hogtied_razormane_34514AI(Creature* creature) : ScriptedAI(creature) { Initialize(); }

		uint32 m_timer;
		uint32 m_phase;
		uint64 m_playerGUID;

		void Initialize()
		{
			m_timer = 0;
			m_phase = 0;
			m_playerGUID = 0;
		}

		void IsSummonedBy(Unit* summoner) override
		{
			if (Player* player = summoner->ToPlayer())
			{
				m_playerGUID = player->GetGUID();
				me->CastSpell(me, SPELL_DEAD_SOLDIER);
				me->CastSpell(player, SPELL_DRAGGING_A_RAZORMANE);
				me->CastSpell(me, SPELL_RAZORMANE_DRAGGING_AURA, true);
				player->AddAura(SPELL_DRAGGING_A_RAZORMANE, me);
				player->AddAura(SPELL_RAZORMANE_DRAGGING_AURA, me);
				player->CastSpell(me, SPELL_HOGTIED_RAZORMANE_ROPE);
				m_phase = 1;
				m_timer = 1000;
			}
		}

		void SetGUID(uint64 guid, int32 id = 0) override
		{
			switch (id)
			{
			case PLAYER_GUID:
				if (!m_playerGUID)
					m_playerGUID = guid;
				break;
			}
		}

		uint64 GetGUID(int32 id = 0) override
		{
			switch (id)
			{
			case PLAYER_GUID:
				return m_playerGUID;
			default:
				return 0;
			}
		}

		void UpdateAI(uint32 diff)
		{
			if (m_timer < diff)
			{
				m_timer = 1000;
				if (m_phase)
					DoWork();
			}
			else
				m_timer -= diff;

			if (!UpdateVictim())
				return;
			else
				DoMeleeAttackIfReady();
		}

		void DoWork()
		{
			switch (m_phase)
			{
			case 1:
			{
				if (Player* player = ObjectAccessor::GetPlayer(*me, m_playerGUID))
					if (player->GetQuestStatus(QUEST_DRAG_IT_OUT_OF_THEM) == QUEST_STATUS_COMPLETE)
					{
						player->RemoveAura(SPELL_HOGTIED_RAZORMANE_ROPE);
						player->RemoveAura(SPELL_DRAGGING_A_RAZORMANE);
						me->DespawnOrUnsummon(0);
						m_phase = 0;
						m_timer = 0;
					}
					else
					{
						if (!me->HasAura(SPELL_HOGTIED_RAZORMANE_ROPE))
							player->CastSpell(me, SPELL_HOGTIED_RAZORMANE_ROPE);
						me->CastSpell(me, SPELL_RAZORMANE_DRAGGING_TRIGGER);
					}
				break;
			}
			}
		}
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_hogtied_razormane_34514AI(creature);
	}
};

/// Groldom's Farm Areatrigger - 5465
class at_groldoms_farm_5465 : public AreaTriggerScript
{
public:
	at_groldoms_farm_5465() : AreaTriggerScript("at_groldoms_farm_5465") { }

	enum eRazormane
	{
		QUEST_DRAG_IT_OUT_OF_THEM = 13961,
		AT_GROLDOMS_FARM = 5465,
		SPELL_DELIVER_HOGTIED_RAZORMANE = 65603,
		SPELL_SUMMON_HOGTIED_RAZORMANE = 65595,
		PLAYER_GUID = 99999,
	};

	bool OnTrigger(Player* player, const AreaTriggerEntry* at) override
	{
		if (at->ID == AT_GROLDOMS_FARM)
			if ((player->GetQuestStatus(QUEST_DRAG_IT_OUT_OF_THEM) == QUEST_STATUS_INCOMPLETE))
			{
				player->CompleteQuest(QUEST_DRAG_IT_OUT_OF_THEM);
				player->CastSpell(player, SPELL_DELIVER_HOGTIED_RAZORMANE);

			}

		return false;
	}
};


/// Togrik - 34513
class npc_togrik_34513 : public CreatureScript
{
public:
	npc_togrik_34513() : CreatureScript("npc_togrik_34513") { }

	enum eRazormane
	{
		QUEST_BY_HOOK_OR_BY_CROOK = 13963,
		NPC_CAPTURED_RAZORMANE = 34523,
		NPC_TOGRIK = 34513,
		EVENT_MAX_TIME = 1,
		DATA_MENU_ID = 99980,
		PLAYER_GUID = 99999,
		DOACTION_CREATE_CHAIN = 1,
		DOACTION_RESET = 3,
		DOACTION_GOSSIP_HELLO = 10,
		DOACTION_GOSSIP_SELECT = 11,
	};

	bool OnGossipHello(Player* player, Creature* creature)
	{
		if (player->GetQuestStatus(QUEST_BY_HOOK_OR_BY_CROOK) == QUEST_STATUS_INCOMPLETE)
		{
			creature->AI()->SetGUID(player->GetGUID(), PLAYER_GUID);
			creature->AI()->DoAction(DOACTION_GOSSIP_HELLO);
			return true;
		}
		else
		{
			player->SEND_GOSSIP_MENU(14554, creature->GetGUID());
		}

		return false;
	}

	bool OnGossipSelect(Player* player, Creature* creature, uint32 sender, uint32 action)
	{
		if (action >= 1000)
		{
			creature->AI()->SetData(DATA_MENU_ID, action);
			creature->AI()->DoAction(DOACTION_GOSSIP_SELECT);
			return true;
		}

		return false;
	}

	bool OnQuestAccept(Player* player, Creature* creature, Quest const* quest)
	{
		if (quest->GetQuestId() == QUEST_BY_HOOK_OR_BY_CROOK)
		{
			if (creature->AI()->GetData(NPC_TOGRIK) == 0)
			{
				creature->AI()->SetGUID(player->GetGUID(), PLAYER_GUID);
				creature->AI()->DoAction(1);
			}
			else
			{
				creature->AI()->DoAction(2);
			}
		}

		return false;
	}

	struct npc_togrik_34513AI : public ScriptedAI
	{
		npc_togrik_34513AI(Creature* creature) : ScriptedAI(creature) { Initialize(); }

		EventMap m_events;
		uint32   m_phase;
		uint32   m_action_id;
		uint64   m_playerGUID;
		uint64   m_razorGUID;
		uint8    m_encounter;

		void Initialize()
		{
			m_encounter = 0;
		}

		void Reset() override
		{
			m_events.Reset();
			m_phase = 0;
			m_action_id = 0;
			m_playerGUID = 0;
			m_razorGUID = 0;
		}

		void SetData(uint32 id, uint32 value)
		{
			switch (id)
			{
			case DATA_MENU_ID:
				m_action_id = value;
				break;
			}
		}

		uint32 GetData(uint32 id) override
		{
			switch (id)
			{
			case NPC_TOGRIK:
				return m_encounter;
			default:
				return 0;
			}
		}

		void SetGUID(uint64 guid, int32 id = 0) override
		{
			switch (id)
			{
			case PLAYER_GUID:
				if (!m_playerGUID)
					m_playerGUID = guid;
				break;
			}
		}

		uint64 GetGUID(int32 id = 0) override
		{
			switch (id)
			{
			case PLAYER_GUID:
				return m_playerGUID;
			default:
				return 0;
			}
		}

		void DoAction(int32 param)
		{
			switch (param)
			{
			case DOACTION_CREATE_CHAIN:
			{
				CreateRazor();
				break;
			}
			case DOACTION_RESET:
			{
				Initialize();
				Reset();
				break;
			}
			case DOACTION_GOSSIP_HELLO:
			{
				if (Player* player = ObjectAccessor::GetPlayer(*me, m_playerGUID))
				{
					player->ADD_GOSSIP_ITEM_DB(10520, 0, GOSSIP_SENDER_MAIN, 1002);
					player->SEND_GOSSIP_MENU(14554, me->GetGUID());
				}
				break;
			}
			case DOACTION_GOSSIP_SELECT:
			{
				switch (m_action_id)
				{
				case 1002:
				{
					Creature* razor = ObjectAccessor::GetCreature(*me, m_razorGUID);
					if (!razor)
					{
						CreateRazor();
					}
					break;
				}
				}
				break;
			}
			}
		}

		void UpdateAI(uint32 diff)
		{
			m_events.Update(diff);

			while (uint32 eventId = m_events.ExecuteEvent())
			{
				switch (eventId)
				{
				case EVENT_MAX_TIME:
					if (Creature* razor = ObjectAccessor::GetCreature(*me, m_razorGUID))
						razor->DespawnOrUnsummon();
					Initialize();
					Reset();
					break;
				default:
					break;
				}
			}

			if (!UpdateVictim())
				return;
			else
				DoMeleeAttackIfReady();
		}

		void CreateRazor()
		{
			m_encounter = 1;
			m_events.ScheduleEvent(EVENT_MAX_TIME, 600000);
			if (Creature* razor = me->SummonCreature(NPC_CAPTURED_RAZORMANE, 283.4774f, -3050.653f, 95.93713f, 3.490659f, TEMPSUMMON_TIMED_DESPAWN, 600000))
			{
				m_razorGUID = razor->GetGUID();
				razor->AI()->SetGUID(m_playerGUID);
				razor->AI()->DoAction(DOACTION_CREATE_CHAIN);
			}
		}
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_togrik_34513AI(creature);
	}
};

/// Captured Razormane - 34523
class npc_captured_razormane_34523 : public CreatureScript
{
public:
	npc_captured_razormane_34523() : CreatureScript("npc_captured_razormane_34523") { }

	enum eRazormane
	{
		QUEST_BY_HOOK_OR_BY_CROOK = 13963,
		NPC_DAVES_INDUSTRIAL_LIGHT_AND_MAGIC_BUNNY = 34527,
		NPC_TOGRIK = 34513,
		SPELL_COSMETIC_CHAINS = 65612,
		PLAYER_GUID = 99999,
		DATA_ACTION_ID = 99980,
		PATH_RAZORMANE = 3452301,
		DOACTION_CREATE_CHAIN = 1,
		DOACTION_RESET = 3,
		DOACTION_GOSSIP_HELLO = 10,
		DOACTION_GOSSIP_SELECT = 11,
		EVENT_SAY_END = 1,
	};

	bool OnGossipHello(Player* player, Creature* creature)
	{
		creature->AI()->SetGUID(player->GetGUID(), PLAYER_GUID);
		creature->AI()->DoAction(DOACTION_GOSSIP_HELLO);
		return true;
	}

	bool OnGossipSelect(Player* player, Creature* creature, uint32 sender, uint32 action)
	{
		creature->AI()->SetData(DATA_ACTION_ID, action);
		creature->AI()->DoAction(DOACTION_GOSSIP_SELECT);
		return true;
	}

	struct npc_captured_razormane_34523AI : public ScriptedAI
	{
		npc_captured_razormane_34523AI(Creature* creature) : ScriptedAI(creature) { }

		EventMap m_events;
		uint32   m_phase;
		uint32   m_action_id;
		uint64   m_playerGUID;
		uint64   m_bunnyGUID;
		uint64   m_togrikGUID;

		void Reset() override
		{
			m_events.Reset();
			m_phase = 0;
			m_action_id = 0;
			m_playerGUID = 0;
			m_togrikGUID = 0;

			if (Creature* bunny = me->FindNearestCreature(NPC_DAVES_INDUSTRIAL_LIGHT_AND_MAGIC_BUNNY, 25.0f))
				m_bunnyGUID = bunny->GetGUID();
			else
				m_bunnyGUID = 0;
		}

		void JustDied(Unit* /*killer*/)
		{
			if (Creature* togrik = ObjectAccessor::GetCreature(*me, m_togrikGUID))
				togrik->AI()->DoAction(DOACTION_RESET);
		}

		void SetData(uint32 id, uint32 value)
		{
			switch (id)
			{
			case DATA_ACTION_ID:
				m_action_id = value;
				break;
			}
		}

		void SetGUID(uint64 guid, int32 id = 0) override
		{
			switch (id)
			{
			case NPC_DAVES_INDUSTRIAL_LIGHT_AND_MAGIC_BUNNY:
				m_bunnyGUID = guid;
				break;
			case NPC_TOGRIK:
				m_togrikGUID = guid;
				break;
			case PLAYER_GUID:
				if (!m_playerGUID)
					m_playerGUID = guid;
				break;
			}
		}

		uint64 GetGUID(int32 id = 0) override
		{
			switch (id)
			{
			case NPC_DAVES_INDUSTRIAL_LIGHT_AND_MAGIC_BUNNY:
				return m_bunnyGUID;
			case NPC_TOGRIK:
				return m_togrikGUID;
			case PLAYER_GUID:
				return m_playerGUID;
			default:
				return 0;
			}
		}

		void DoAction(int32 param)
		{
			switch (param)
			{
			case DOACTION_CREATE_CHAIN:
			{
				me->SetUInt32Value(UNIT_FIELD_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP);
				if (Creature* bunny = ObjectAccessor::GetCreature(*me, m_bunnyGUID))
				{
					bunny->CastSpell(me, SPELL_COSMETIC_CHAINS);
					me->SetSpeed(MOVE_WALK, 0.5f);
					me->GetMotionMaster()->MovePath(PATH_RAZORMANE, true);
				}
				break;
			}
			case DOACTION_GOSSIP_HELLO:
			{
				Player* player = ObjectAccessor::GetPlayer(*me, m_playerGUID);
				if (!player)
					return;

				switch (m_phase)
				{
				case 0:
				{
					player->ADD_GOSSIP_ITEM_DB(10521, 0, GOSSIP_SENDER_MAIN, 1010);
					player->ADD_GOSSIP_ITEM_DB(10521, 1, GOSSIP_SENDER_MAIN, 1011);
					player->ADD_GOSSIP_ITEM_DB(10521, 2, GOSSIP_SENDER_MAIN, 1012);
					player->ADD_GOSSIP_ITEM_DB(10521, 3, GOSSIP_SENDER_MAIN, 1013);
					player->ADD_GOSSIP_ITEM_DB(10521, 4, GOSSIP_SENDER_MAIN, 1014);
					player->SEND_GOSSIP_MENU(14555, me->GetGUID());
					break;
				}
				case 1:
				case 2:
				case 3:
				case 4:
				case 5:
				{
					player->ADD_GOSSIP_ITEM_DB(10521, 0, GOSSIP_SENDER_MAIN, 1010);
					player->ADD_GOSSIP_ITEM_DB(10521, 1, GOSSIP_SENDER_MAIN, 1011);
					player->ADD_GOSSIP_ITEM_DB(10521, 2, GOSSIP_SENDER_MAIN, 1012);
					player->SEND_GOSSIP_MENU(14555, me->GetGUID());
					break;
				}
				}
				break;
			}
			case DOACTION_GOSSIP_SELECT:
			{
				Player* player = ObjectAccessor::GetPlayer(*me, m_playerGUID);
				if (!player)
					return;

				switch (m_action_id)
				{
				case 1010:
					player->CastSpell(me, 65618);
					break;
				case 1011:
					player->CastSpell(me, 65620);
					break;
				case 1012:
					player->CastSpell(me, 65619);
					break;
				case 1013:
					player->CastSpell(me, 65618);
					break;
				case 1014:
					player->CastSpell(me, 65621);
					break;
				}

				Talk(m_phase);
				me->HandleEmoteCommand(34);
				player->PlayerTalkClass->SendCloseGossip();
				m_phase++;

				if (m_phase >= 5)
				{
					player->KilledMonsterCredit(34529);
					m_events.RescheduleEvent(EVENT_SAY_END, 5000);
				}
				break;
			}
			}
		}

		void UpdateAI(uint32 diff)
		{
			m_events.Update(diff);

			while (uint32 eventId = m_events.ExecuteEvent())
			{
				switch (eventId)
				{
				case EVENT_SAY_END:
				{
					Talk(m_phase);
					me->DespawnOrUnsummon(10000);
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
		return new npc_captured_razormane_34523AI(creature);
	}
};

/// ***************************** End Quests: Drag It Out Of Them & By Hook Or By Crook ***************************** ///

/// ***************************** Quest: The Kodos Return ***************************** ///

enum KodosReturn
{
	/// Quest
	QUEST_THE_KODOS_RETURN = 13971,

	/// Npcs
	NPC_TORTUSK	= 34544,

	/// Spells
	SPELL_COSMETIC_STUN_PERMANENT = 54852,
};

/// Groldom's Kodo - 34547
class npc_groldom_kodo_34547 : public CreatureScript
{
public:
	npc_groldom_kodo_34547() : CreatureScript("npc_groldom_kodo_34547") { }

	bool OnQuestAccept(Player* player, Creature* creature, Quest const* quest)
	{
		if (quest->GetQuestId() == QUEST_THE_KODOS_RETURN)
		{
			creature->RemoveAura(SPELL_COSMETIC_STUN_PERMANENT);
			creature->SetByteFlag(UNIT_FIELD_ANIM_TIER, 0, UNIT_STAND_STATE_STAND);
			creature->GetMotionMaster()->MovePoint(1, 50.17f, -3129.29f, 96.67f, true);
			creature->DespawnOrUnsummon(7000);
			return true;
		}

		return false;
	}
};

/// Fez - 34543
class npc_fez_34543 : public CreatureScript
{
public:
	npc_fez_34543() : CreatureScript("npc_fez_34543") { }

	enum eFez
	{

	};

	struct npc_fez_34543AI : public ScriptedAI
	{
		npc_fez_34543AI(Creature* creature) : ScriptedAI(creature) {  }

		EventMap m_events;

		void Reset() override
		{
			m_events.Reset();
			m_events.ScheduleEvent(1, 2500);
		}

		void UpdateAI(uint32 diff)
		{
			m_events.Update(diff);

			while (uint32 eventId = m_events.ExecuteEvent())
			{
				switch (eventId)
				{
				case 1:
					m_events.ScheduleEvent(1, 2500);
					if (!me->isInCombat())
						if (Vehicle* fez = me->GetVehicleKit())
						{
							if (!fez->IsVehicleInUse())
								if (Creature* tortusk = me->FindNearestCreature(NPC_TORTUSK, 50.0f, true))
									if (!tortusk->isInCombat())
										tortusk->EnterVehicle(me, 0);
						}		
					break;
				default:
					break;
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
		return new npc_fez_34543AI(creature);
	}
};



/// Gorgal Angerscar - 34634
class npc_gorgal_angerscar_34634 : public CreatureScript
{
public:
	npc_gorgal_angerscar_34634() : CreatureScript("npc_gorgal_angerscar_34634") { }

	enum eGorgal
	{
		QUEST_KING_OF_CENTAUR_MOUNTAIN = 13995,
		NPC_GORGAL = 34634,
		NPC_KURAK = 34635,
		NPC_KOLKAR = 3275,
		EVENT_START_ANIM = 1,
		EVENT_CHECK_KOLKAR,
		EVENT_CHECK_KURAK,
		EVENT_TALK_FINISH,
		EVENT_RESET,
		SPELL_RAISE_BANNER = 65804,
	};

	bool OnQuestAccept(Player* player, Creature* creature, Quest const* quest)
	{
		if (quest->GetQuestId() == QUEST_KING_OF_CENTAUR_MOUNTAIN)
		{
			creature->AI()->DoAction(1);
			CAST_AI(npc_gorgal_angerscar_34634AI, creature->GetAI())->m_playerGUID = player->GetGUID();
		}

		return false;
	}

	struct npc_gorgal_angerscar_34634AI : public ScriptedAI
	{
		npc_gorgal_angerscar_34634AI(Creature* creature) : ScriptedAI(creature) { Initialize(); }

		EventMap m_events;
		uint64 m_kolkarGUID;
		uint64 m_kurakGUID;
		uint64 m_playerGUID;
		uint32 m_killCount;
		bool m_isAnimStarted;

		void Initialize()
		{
			m_isAnimStarted = false;
		}

		void Reset() override
		{
			if (!m_isAnimStarted)
			{
				m_events.Reset();
				m_killCount = 0;
				m_kolkarGUID = NULL;
				m_kurakGUID = NULL;
				m_playerGUID = NULL;
			}
		}

		void MovementInform(uint32 type, uint32 id)
		{
			if (type == 2 && id == 7)
			{
				me->CastSpell(me, SPELL_RAISE_BANNER);
				m_events.ScheduleEvent(EVENT_CHECK_KOLKAR, 1000);
			}
		}

		void DamageTaken(Unit* attacker, uint32& damage)
		{
			if (attacker->GetEntry() == NPC_KOLKAR || attacker->GetEntry() == NPC_KURAK)
				damage = 0;
		}

		void JustDied(Unit* /*killer*/)
		{
			m_isAnimStarted = false;
			me->DespawnOrUnsummon();
		}

		void DoAction(int32 param)
		{
			if (param == 1 && !m_isAnimStarted)
			{
				m_isAnimStarted = true;
				m_events.ScheduleEvent(EVENT_START_ANIM, 100);
				m_events.ScheduleEvent(EVENT_RESET, 300000);
			}
		}

		void UpdateAI(uint32 diff) override
		{
			m_events.Update(diff);

			while (uint32 eventId = m_events.ExecuteEvent())
			{
				switch (eventId)
				{
				case EVENT_START_ANIM:
					Talk(0);
					me->GetMotionMaster()->MovePath(1389261, false);
					break;
				case EVENT_RESET:
					m_isAnimStarted = false;
					me->DespawnOrUnsummon();
					break;
				case EVENT_CHECK_KOLKAR:
				{
					Creature* kolkar = ObjectAccessor::GetCreature(*me, m_kolkarGUID);
					if (!IsAlive(kolkar))
					{
						if (m_kolkarGUID)
							m_killCount++;
						if (m_killCount < 3)
						{
							if (kolkar = me->SummonCreature(NPC_KOLKAR, -1158.43f, -2954.45f, 93.689f, 2.61691f))
							{
								if (m_killCount == 0)
									Talk(1);
								else
									Talk(2);
								m_kolkarGUID = kolkar->GetGUID();
								kolkar->GetMotionMaster()->MoveChase(me);
							}
						}
						else
						{
							if (Creature* kurak = me->SummonCreature(NPC_KURAK, -1158.43f, -2954.45f, 93.689f, 2.61691f))
							{
								Talk(3);
								m_kurakGUID = kurak->GetGUID();
								kurak->GetMotionMaster()->MoveChase(me);
								m_events.ScheduleEvent(EVENT_CHECK_KURAK, 1000);
								break;
							}
						}
					}
					m_events.ScheduleEvent(EVENT_CHECK_KOLKAR, 1000);
					break;
				}
				case EVENT_CHECK_KURAK:
				{
					Creature* kurak = ObjectAccessor::GetCreature(*me, m_kurakGUID);
					if (IsAlive(kurak))
						m_events.ScheduleEvent(EVENT_CHECK_KURAK, 1000);
					else
					{
						Talk(4);
						if (Player* player = ObjectAccessor::GetPlayer(*me, m_playerGUID))
							player->KilledMonsterCredit(NPC_KURAK);
						m_events.ScheduleEvent(EVENT_TALK_FINISH, 5000);
					}
					break;
				}
				case EVENT_TALK_FINISH:
				{
					Talk(6);
					me->DespawnOrUnsummon(5000);
					m_isAnimStarted = false;
					break;
				}
				default:
					break;
				}
			}

			if (!UpdateVictim())
				return;
			else
				DoMeleeAttackIfReady();
		}

		bool IsAlive(Creature* npc)
		{
			if (!npc)
				return false;
			return npc->isAlive();
		}
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_gorgal_angerscar_34634AI(creature);
	}
};

/// Shoe - 34638
class npc_shoe_34638 : public CreatureScript
{
public:
	npc_shoe_34638() : CreatureScript("npc_shoe_34638") { }

	struct npc_shoe_34638AI : public ScriptedAI
	{
		npc_shoe_34638AI(Creature* creature) : ScriptedAI(creature) { }

		uint32 m_phase;
		uint32 m_timer;
		uint32 m_playerPresentCounter;

		void Reset() override
		{
			m_phase = 1;
			m_timer = 1000;
			m_playerPresentCounter = 0;
		}

		void UpdateAI(uint32 diff) override
		{
			if (m_timer < diff)
			{
				m_timer = 1000;
				if (m_phase) DoWork();
			}
			else
				m_timer -= diff;

			if (!UpdateVictim())
				return;

			DoMeleeAttackIfReady();
		}

		void DoWork()
		{
			Creature* gorgal = me->FindNearestCreature(34634, 15.0f);
			if (!gorgal)
			{
				m_playerPresentCounter = 0;
				return;
			}

			switch (m_phase)
			{
			case 1:
				if (Player* player = me->FindNearestPlayer(25.0f))
				{
					++m_playerPresentCounter;
					if (m_playerPresentCounter >= 30)
						m_phase = 2;
				}
				else
					m_playerPresentCounter = 0;

				break;
			case 2:
				Talk(0);
				m_timer = 5000;
				m_phase = 3;
				break;
			case 3:
				gorgal->AI()->Talk(5);
				m_timer = 5000;
				m_phase = 4;
				break;
			case 4:
				Talk(1);
				m_playerPresentCounter = 0;
				m_timer = 120000;
				m_phase = 0;
				break;
			}
		}
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_shoe_34638AI(creature);
	}
};


/// ***************************** End Quest: The Kodos Return ***************************** ///

/// ***************************** Quest: Crossroads Caravan Delivery ***************************** ///
/// Rocco Whipshank - 34578
class npc_rocco_whipshank_34578 : public CreatureScript
{
public:
	npc_rocco_whipshank_34578() : CreatureScript("npc_rocco_whipshank_34578") { }

	enum eRocco
	{
		/// Quest
		QUEST_CROSSROADS_CARAVAN_DELIVERY = 13975,
		
		/// Npcs
		NPC_HEAD_CARAVAN_KODO = 34577,
		NPC_BALGOR_WHIPSHANK = 34431,

		/// Spells
		SPELL_SUMMON_KODO_PART2 = 65662,
		SPELL_WORLD_GENERIC_DISMOUNT_CANCEL_SHAPESHIFT = 61286,

		/// Misc
		PLAYER_GUID = 99999,
		DATA_IS_ANUM_STARTED = 99998,
		NPC_TEXT_QUEST		= 14566,
		GOSSIP_MENU_ROCCO	= 10528,

		/// Actions
		DOACTION_RESET = 3,
		DOACTION_GOSSIP_HELLO = 10,
		DOACTION_GOSSIP_SELECT = 11,

		/// Events
		EVENT_MAX_TIME = 1,
	};

	bool OnGossipHello(Player* player, Creature* creature)
	{
		if (player->GetQuestStatus(QUEST_CROSSROADS_CARAVAN_DELIVERY) == QUEST_STATUS_INCOMPLETE)
		{
			creature->AI()->SetGUID(player->GetGUID(), PLAYER_GUID);
			creature->AI()->DoAction(DOACTION_GOSSIP_HELLO);
			return true;
		}

		return false;
	}

	bool OnGossipSelect(Player* player, Creature* creature, uint32 sender, uint32 action)
	{
		if (action == 1002)
		{
			creature->AI()->SetGUID(player->GetGUID(), PLAYER_GUID);
			creature->AI()->DoAction(DOACTION_GOSSIP_SELECT);
			player->PlayerTalkClass->SendCloseGossip();
			return true;
		}

		return false;
	}

	struct npc_rocco_whipshank_34578AI : public ScriptedAI
	{
		npc_rocco_whipshank_34578AI(Creature* creature) : ScriptedAI(creature) { }

		EventMap m_events;
		uint32   m_phase;
		uint32   m_is_anim_started;
		uint64   m_playerGUID;
		uint64   m_kodoLeader;
		uint64   m_kodoPack;

		void Reset() override
		{
			m_events.Reset();
			m_phase = 0;
			m_is_anim_started = false;
			m_playerGUID = 0;
			m_kodoLeader = 0;
			m_kodoPack = 0;
		}

		void JustSummoned(Creature* summon)
		{
			switch (summon->GetEntry())
			{
			case NPC_HEAD_CARAVAN_KODO:
				m_kodoLeader = summon->GetGUID();
				summon->AI()->SetGUID(m_playerGUID, PLAYER_GUID);
				summon->AI()->SetGUID(me->GetGUID(), me->GetEntry());
				summon->SummonCreature(NPC_BALGOR_WHIPSHANK, 220.5f, -2964.5f, 91.82f);
				break;
			default:
				printf("JustSummoned rocco: %u \n", summon->GetEntry());
				break;
			}
		}

		void SetData(uint32 id, uint32 value)
		{
			switch (id)
			{
			case DATA_IS_ANUM_STARTED:
				m_is_anim_started = value;
				break;
			}
		}

		uint32 GetData(uint32 id) override
		{
			switch (id)
			{
			case DATA_IS_ANUM_STARTED:
				return m_is_anim_started;
			default:
				return 0;
			}
		}

		void SetGUID(uint64 guid, int32 id = 0) override
		{
			switch (id)
			{
			case PLAYER_GUID:
				if (!m_playerGUID)
					m_playerGUID = guid;
				break;
			}
		}

		uint64 GetGUID(int32 id = 0) override
		{
			switch (id)
			{
			case PLAYER_GUID:
				return m_playerGUID;
			default:
				return 0;
			}
		}

		void DoAction(int32 param)
		{
			switch (param)
			{
			case DOACTION_RESET:
			{
				Reset();
				break;
			}
			case DOACTION_GOSSIP_HELLO:
			{
				if (Player* player = ObjectAccessor::GetPlayer(*me, m_playerGUID))
					if (!m_is_anim_started)
					{
						player->ADD_GOSSIP_ITEM_DB(GOSSIP_MENU_ROCCO, 0, GOSSIP_SENDER_MAIN, 1002); // Bring it on, Rocco.
						player->SEND_GOSSIP_MENU(NPC_TEXT_QUEST, me->GetGUID()); // Are you ready to do this, $n?
					}
				break;
			}
			case DOACTION_GOSSIP_SELECT:
			{
				me->HandleEmoteCommand(EMOTE_ONESHOT_WAVE_NOSHEATHE);

				if (Player* player = ObjectAccessor::GetPlayer(*me, m_playerGUID))
				{
					m_is_anim_started = true;
					m_events.ScheduleEvent(EVENT_MAX_TIME, 600000);
					me->CastSpell(player, SPELL_SUMMON_KODO_PART2);
					me->CastSpell(player, SPELL_WORLD_GENERIC_DISMOUNT_CANCEL_SHAPESHIFT);
				}
				break;
			}
			}
		}

		void UpdateAI(uint32 diff)
		{
			m_events.Update(diff);

			while (uint32 eventId = m_events.ExecuteEvent())
			{
				switch (eventId)
				{
				case EVENT_MAX_TIME:
					// delete kodoleader mm??
					if (Creature* kodoleader = ObjectAccessor::GetCreature(*me, m_kodoLeader))
						kodoleader->DespawnOrUnsummon(5000);
	
					Reset();
					break;
				default:
					break;
				}
			}

			if (!UpdateVictim())
				return;
			else
				DoMeleeAttackIfReady();
		}

		void CreateKodo()
		{

		}
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_rocco_whipshank_34578AI(creature);
	}
};

/// Head Caravan Kodo - 34577
class npc_head_caravan_kodo_34577 : public CreatureScript
{
public:
	npc_head_caravan_kodo_34577() : CreatureScript("npc_head_caravan_kodo_34577") { }

	enum eKodo
	{
		/// Quest
		QUEST_CROSSROADS_CARAVAN_DELIVERY = 13975,

		/// Npcs
		NPC_ROCCO_WHIPSHANK = 34578,
		NPC_THE_HOTSEAT = 34582,
		NPC_CROSSROADS_CARAVAN_KODO = 34576,
		NPC_BALGOR_WHIPSHANK = 34431,
		NPC_BURNING_BLADE_MOUNT = 34593,
		NPC_BURNING_BLADE_RAIDER = 34594,
		NPC_CROSSROADS_DELIVERY_CREDIT_1 = 53572,
		
		
		/// Spells
		SPELL_CALL_A_PACK_KODO2 = 65663,
		SPELL_MOUNT_UP = 65671,
		SPELL_RIDE_CARAVAN_KODO = 65466,
		SPELL_SUMMON_BURNING_BLADE_MOUNT = 65692,
		SPELL_DISMOUNT_CARAVAN_KODO_CUE_PART2 = 65695,
		SPELL_EJECT_ALL_PASSENGERS = 50630,

		/// Misc
		PLAYER_GUID = 99999,

		/// Events
		EVENT_SUMMON_CARAVAN = 1,
		EVENT_RIDE_KODO = 2,
		EVENT_START_CARAVAN = 3,

		/// Actions
		DOACTION_RESET = 3,
	};

	struct npc_head_caravan_kodo_34577AI : public ScriptedAI
	{
		npc_head_caravan_kodo_34577AI(Creature* creature) : ScriptedAI(creature) { }

		uint32 m_phase;
		EventMap m_events;
		bool m_IsArrived;
		uint64 m_playerGUID;
		uint64 m_roccoGUID;
		uint64 m_balgorGUID;
		uint64 m_kodo2GUID;
		uint64 m_hotseatGUID;

		void Reset() override
		{
			m_phase = 1;
			m_events.Reset();
			m_IsArrived = false;
			m_playerGUID = 0;
			m_roccoGUID = 0;
			m_balgorGUID = 0;
			m_kodo2GUID = 0;
			m_hotseatGUID = 0;
			me->SetUInt32Value(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_NPC);
		}

		void MovementInform(uint32 type, uint32 id) override
		{
			if (POINT_MOTION_TYPE && id == 21)
			{
				m_events.ScheduleEvent(EVENT_SUMMON_CARAVAN, 100);
			}
			if (POINT_MOTION_TYPE && id == 35)
			{
				if (Creature* balgor = ObjectAccessor::GetCreature(*me, m_balgorGUID))
					balgor->DespawnOrUnsummon(2000);
				if (Creature* kodo2 = ObjectAccessor::GetCreature(*me, m_kodo2GUID))
					kodo2->DespawnOrUnsummon(2000);
			}
			else if (WAYPOINT_MOTION_TYPE)
			{
				if (id == 1)
					Greetings();
				else if (id == 3)
					Warning1();
				else if (id == 27)
					CaravanArrived();
				else if (id > 7 && id < 25)
					CreateAttack();
			}
		}

		void JustSummoned(Creature* summon) override
		{
			switch (summon->GetEntry())
			{
			case NPC_BALGOR_WHIPSHANK:
				m_balgorGUID = summon->GetGUID();
				summon->EnterVehicle(me, 0);
				summon->SetUInt32Value(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_NPC);
				me->GetMotionMaster()->MovePoint(21, 205.1f, -2935.985f, 92.66f, true);
				break;
			case NPC_CROSSROADS_CARAVAN_KODO:
				m_kodo2GUID = summon->GetGUID();
				summon->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_MOVE || UNIT_FLAG_IMMUNE_TO_NPC);
				summon->SetWalk(false);
				break;
			case NPC_THE_HOTSEAT:
				m_hotseatGUID = summon->GetGUID();
				summon->SetUInt32Value(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_NPC);
				break;
			case NPC_BURNING_BLADE_MOUNT:
				Position pos;
				summon->GetPosition(&pos);
				if (Creature* raider = me->SummonCreature(NPC_BURNING_BLADE_RAIDER, pos, TEMPSUMMON_TIMED_DESPAWN, 300000))
				{
					raider->SetSpeed(MOVE_WALK, 3.0f, true);
					summon->SetSpeed(MOVE_WALK, 3.0f, true);
					raider->EnterVehicle(summon);
					raider->AI()->SetGUID(m_playerGUID, PLAYER_GUID);
					raider->AI()->SetGUID(m_kodo2GUID, NPC_CROSSROADS_CARAVAN_KODO);
				}
				break;
			default:
				break;
			}
		}

		void SetGUID(uint64 guid, int32 id = 0)
		{
			switch (id)
			{
			case NPC_ROCCO_WHIPSHANK:
				m_roccoGUID = guid;
				break;
			case PLAYER_GUID:
				m_playerGUID = guid;
				break;
			default:
				break;
			}
		}

		uint64 GetGUID(int32 id = 0) const
		{
			switch (id)
			{
			case NPC_ROCCO_WHIPSHANK:
				return m_roccoGUID;
			case PLAYER_GUID:
				return m_playerGUID;
			case NPC_THE_HOTSEAT:
				return m_hotseatGUID;
			default:
				return 0;
			}
		}

		void PassengerBoarded(Unit* passenger, int8 seatId, bool apply)
		{
			if (apply)
			{
				if (passenger->GetEntry() == NPC_THE_HOTSEAT)
				{
					Player* player = ObjectAccessor::GetPlayer(*me, m_playerGUID);
					Creature* hotseat = ObjectAccessor::GetCreature(*me, m_hotseatGUID);
					if (player && hotseat)
					{
						hotseat->CastSpell(player, SPELL_MOUNT_UP);
						m_events.ScheduleEvent(EVENT_RIDE_KODO, 250);
						m_events.ScheduleEvent(EVENT_START_CARAVAN, 500);
					}
				}
			}
			else
			{
				if (!m_IsArrived)
					if (passenger->GetEntry() == NPC_THE_HOTSEAT)
					{
						if (Creature* balgor = ObjectAccessor::GetCreature(*me, m_balgorGUID))
							balgor->DespawnOrUnsummon(1000);
						if (Creature* rocco = ObjectAccessor::GetCreature(*me, m_roccoGUID))
							rocco->AI()->DoAction(DOACTION_RESET);
						me->DespawnOrUnsummon(1000);
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
				case EVENT_SUMMON_CARAVAN:
					me->CastSpell(me, SPELL_CALL_A_PACK_KODO2);
					Position pos;
					me->GetPosition(&pos);
					me->SummonCreature(NPC_THE_HOTSEAT, pos);
					break;
				case EVENT_RIDE_KODO:
				{
					if (Player* player = ObjectAccessor::GetPlayer(*me, m_playerGUID))
						if (Creature* hotseat = ObjectAccessor::GetCreature(*me, m_hotseatGUID))
							player->CastSpell(hotseat, SPELL_RIDE_CARAVAN_KODO);

					break;
				}
				case EVENT_START_CARAVAN:
				{
					if (Player* player = ObjectAccessor::GetPlayer(*me, m_playerGUID))
						if (Creature* rocco = ObjectAccessor::GetCreature(*me, m_roccoGUID))
							if (Creature* kodo2 = ObjectAccessor::GetCreature(*me, m_kodo2GUID))
							{
								kodo2->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_MOVE);
								kodo2->SetUInt32Value(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_NPC);
								kodo2->GetMotionMaster()->MoveFollow(me, 15.0f, M_PI);
								kodo2->SetWalk(true);
								me->GetMotionMaster()->MovePath(3457701, false);
							}
					break;
				}
				default:
					break;
				}
			}

			if (!UpdateVictim())
				return;

			DoMeleeAttackIfReady();
		}

		void Greetings()
		{
			// Sound ID : 24676
			if (Creature* rocco = ObjectAccessor::GetCreature(*me, m_roccoGUID))
			{
				rocco->SetFacingToObject(me);
				rocco->AI()->Talk(0);
			}	
		}

		void Warning1()
		{
			if (Creature* rocco = ObjectAccessor::GetCreature(*me, m_roccoGUID))
			{
				rocco->SetFacingToObject(me);
				rocco->AI()->Talk(1);
			}
			if (Player* player = ObjectAccessor::GetPlayer(*me, m_playerGUID))
			{
				if (Creature* hotseat = ObjectAccessor::GetCreature(*me, m_hotseatGUID))
					hotseat->AI()->Talk(0, m_playerGUID);
			}	
		}

		void CreateAttack()
		{
			std::list<Creature*> cList;
			me->GetCreatureListWithEntryInGrid(cList, NPC_BURNING_BLADE_RAIDER, 50.0f);
			for (uint32 i = cList.size(); i < 5; i++)
				me->CastSpell(me, SPELL_SUMMON_BURNING_BLADE_MOUNT);
		}

		void CaravanArrived()
		{
			// ServerToClient: SMSG_PET_DISMISS_SOUND(0x1ABB) Length : 16 ConnIdx : 0 Time : 09 / 07 / 2014 07 : 27 : 46.000 Number : 392240
			// Sound ID : 1731

			m_IsArrived = true;
			if (Player* player = ObjectAccessor::GetPlayer(*me, m_playerGUID))
			{
				player->ExitVehicle();
				player->KilledMonsterCredit(NPC_CROSSROADS_DELIVERY_CREDIT_1);
				player->RemoveAura(SPELL_RIDE_CARAVAN_KODO);
				player->CompleteQuest(QUEST_CROSSROADS_CARAVAN_DELIVERY);
			}
			if (Creature* balgor = ObjectAccessor::GetCreature(*me, m_balgorGUID))
			{
				me->CastSpell(balgor, SPELL_DISMOUNT_CARAVAN_KODO_CUE_PART2);
				balgor->AI()->Talk(1, me->GetGUID());

				if (Creature* kodo2 = ObjectAccessor::GetCreature(*me, m_kodo2GUID))
				{
					Position l_Pos;
					kodo2->GetPosition(&l_Pos);
					GetPositionWithDistInFront(kodo2, 1.0f, l_Pos);
					float z = kodo2->GetMap()->GetHeight(kodo2->GetPhaseMask(), l_Pos.GetPositionX(), l_Pos.GetPositionY(), l_Pos.GetPositionZ());
					l_Pos.m_positionZ = z;

					balgor->SetWalk(true);
					balgor->GetMotionMaster()->MovePoint(35, l_Pos); // Move to Crossroads Caravan Kodo
				}
				
			}
			if (Creature* hotseat = ObjectAccessor::GetCreature(*me, m_hotseatGUID))
			{
				hotseat->CastSpell(hotseat, SPELL_EJECT_ALL_PASSENGERS);
				hotseat->DespawnOrUnsummon(100);
			}
			if (Creature* rocco = ObjectAccessor::GetCreature(*me, m_roccoGUID))
				rocco->AI()->DoAction(DOACTION_RESET);
			if (Creature* kodo2 = ObjectAccessor::GetCreature(*me, m_kodo2GUID))
				kodo2->CastSpell(kodo2, SPELL_EJECT_ALL_PASSENGERS);

			me->DespawnOrUnsummon(3000);
		}
	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_head_caravan_kodo_34577AI(creature);
	}
};

/// Vehicle - Hotseat - 34582
class vehicle_hotseat_34582 : public VehicleScript
{
public:
	vehicle_hotseat_34582() : VehicleScript("vehicle_hotseat_34582") { }

	enum eMisc
	{
		SPELL_RIDE_CARAVAN_KODO = 65466,
	};

	void OnAddPassenger(Vehicle* veh, Unit* passenger, int8 /*seatId*/)
	{
		passenger->SetFacingTo(5.14f);
		veh->RelocatePassengers();
	}

	void OnRemovePassenger(Vehicle* veh, Unit* passenger)
	{
		passenger->RemoveAura(SPELL_RIDE_CARAVAN_KODO);
		if (Creature* gunner = veh->GetBase()->ToCreature())
			gunner->DespawnOrUnsummon(100);
	}
};

/// Spell - Mount Caravan Kodo Cue Part 2 - 65669
class spell_mount_caravan_kodo_cue_part2_65669 : public SpellScriptLoader
{
public:
	spell_mount_caravan_kodo_cue_part2_65669() : SpellScriptLoader("spell_mount_caravan_kodo_cue_part2_65669") { }

	enum eSpell
	{
		NPC_HEAD_CARAVAN_KODO = 34577,
		NPC_THE_HOTSEAT = 34582,
	};

	class spell_mount_caravan_kodo_cue_part2_65669_SpellScript : public SpellScript
	{
		PrepareSpellScript(spell_mount_caravan_kodo_cue_part2_65669_SpellScript);

		void SetMount(SpellEffIndex effIndex)
		{
			if (Unit* unit = GetCaster())
				if (Player* player = unit->ToPlayer())
					if (Creature* kodo1 = player->FindNearestCreature(NPC_HEAD_CARAVAN_KODO, 6.0f)) //  how to find kodo as spell target?? GetCaster and GetHitUnit are both player
						if (Creature* hotseat = ObjectAccessor::GetCreature(*unit, kodo1->AI()->GetGUID(NPC_THE_HOTSEAT)))
							hotseat->EnterVehicle(kodo1, 1);
		}

		void Register()
		{
			OnEffectHit += SpellEffectFn(spell_mount_caravan_kodo_cue_part2_65669_SpellScript::SetMount, EFFECT_0, SPELL_EFFECT_DUMMY);
		}
	};

	SpellScript* GetSpellScript() const
	{
		return new spell_mount_caravan_kodo_cue_part2_65669_SpellScript();
	}
};

/// Vehicle - Burning Blade Mount - 34593
class vehicle_burning_blade_mount_34593 : public VehicleScript
{
public:
	vehicle_burning_blade_mount_34593() : VehicleScript("vehicle_burning_blade_mount_34593") { }

	enum eVehicle
	{
		NPC_CROSSROADS_CARAVAN_KODO = 34576,
	};

	void OnAddPassenger(Vehicle* veh, Unit* passenger, int8 /*seatId*/) override
	{
		if (Creature* mount = veh->GetBase()->ToCreature())
			if (Creature* kodo2 = mount->FindNearestCreature(NPC_CROSSROADS_CARAVAN_KODO, 50.0f))
				mount->GetMotionMaster()->MoveFollow(kodo2, frand(0.5f, 2.0f), frand(0.0f, 6.28f));
	}

	void OnRemovePassenger(Vehicle* veh, Unit* passenger) override
	{
		if (Creature* mount = veh->GetBase()->ToCreature())
		{
			mount->SetSpeed(MOVE_WALK, 0.4f, true);
			mount->GetMotionMaster()->MoveConfused();
			mount->DespawnOrUnsummon(30000);
		}
	}
};

/// Burning Blade Raider - 34594
class npc_burning_blade_raider_34594 : public CreatureScript
{
public:
	npc_burning_blade_raider_34594() : CreatureScript("npc_burning_blade_raider_34594") { }

	enum eRaider
	{
		QUEST_CROSSROADS_CARAVAN_DELIVERY = 13975,
		PLAYER_GUID = 99999,
		NPC_CROSSROADS_CARAVAN_KODO = 34576,
	};

	struct npc_burning_blade_raider_34594AI : public ScriptedAI
	{
		npc_burning_blade_raider_34594AI(Creature* creature) : ScriptedAI(creature) { }

		uint32 m_timer;
		uint64 m_playerGUID;
		uint64 m_kodo2GUID;

		void Reset()
		{
			m_timer = 3000;
			m_playerGUID = 0;
			me->LoadEquipment(1);
		}

		void SetGUID(uint64 guid, int32 id = 0)
		{
			switch (id)
			{
			case PLAYER_GUID:
				m_playerGUID = guid;
				break;
			case NPC_CROSSROADS_CARAVAN_KODO:
				m_kodo2GUID = guid;
				break;
			default:
				break;
			}
		}

		void UpdateAI(uint32 diff) override
		{
			if (m_timer < diff)
			{
				m_timer = 1000;
				if (Player* player = ObjectAccessor::GetPlayer(*me, m_playerGUID))
					if (player->GetQuestStatus(QUEST_CROSSROADS_CARAVAN_DELIVERY) == QUEST_STATUS_COMPLETE)
						me->DespawnOrUnsummon(1000);
				if (!me->IsMounted())
				{
					m_timer = 10000;
					me->SetSpeed(MOVE_WALK, 3.0f, true);
					if (Creature* kodo2 = ObjectAccessor::GetCreature(*me, m_kodo2GUID))
						me->GetMotionMaster()->MoveFollow(kodo2, 1, frand(0.0f, 6.28f));
				}
			}
			else
				m_timer -= diff;

			if (!UpdateVictim())
				return;

			DoMeleeAttackIfReady();
		}
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_burning_blade_raider_34594AI(creature);
	}
};

/// ***************************** End Quest: Crossroads Caravan Delivery ***************************** ///

/// AreaTrigger Caravan Scene - 5482 - Quest 14066
class at_caravan_scene_5482 : public AreaTriggerScript
{
public:
	at_caravan_scene_5482() : AreaTriggerScript("at_caravan_scene_5482") { }

	enum eQuest
	{
		QUEST_INVESTIGATE_THE_WRECKAGE = 14066,
		NPC_QUESTGIVER = 3464,
	};

	bool OnTrigger(Player* player, const AreaTriggerEntry* at) override
	{
		if ((player->GetQuestStatus(QUEST_INVESTIGATE_THE_WRECKAGE) == QUEST_STATUS_INCOMPLETE))
		{
			player->KilledMonsterCredit(NPC_QUESTGIVER);
		}

		return false;
	}
};

/// AreaTrigger Follow The Tracks - 5483 - Quest 869
class at_follow_the_tracks_5483 : public AreaTriggerScript
{
public:
	at_follow_the_tracks_5483() : AreaTriggerScript("at_follow_the_tracks_5483") { }

	enum eQuest
	{
		QUEST_TO_TRACK_A_THIEF = 869,
		NPC_QUESTGIVER = 3464,
	};

	bool OnTrigger(Player* player, const AreaTriggerEntry* at) override
	{
		if ((player->GetQuestStatus(QUEST_TO_TRACK_A_THIEF) == QUEST_STATUS_INCOMPLETE))
		{
			player->KilledMonsterCredit(NPC_QUESTGIVER);
		}

		return false;
	}
};


/// Sludge Beast! Quest: 29089
/// Sludge Pile - 208343
class go_sludge_pile : public GameObjectScript
{
public:
	go_sludge_pile() : GameObjectScript("go_sludge_pile") { }

	enum eMisc
	{
		QUEST_SLUDGE_BEAST  = 29089,
		NPC_SLUDGE_BEAST	= 52165,

	};

	struct go_sludge_pileAI : public GameObjectAI
	{
		go_sludge_pileAI(GameObject* go) : GameObjectAI(go) { }

		bool GossipHello(Player* player) override
		{
			if (player->GetQuestStatus(QUEST_SLUDGE_BEAST) == QUEST_STATUS_INCOMPLETE)
			{
				/// If there's no Sludge Beast nearby, only then summon it.
				/// GossipHello summons twice, once when the interaction initiates and again when the interaction ends. Gossip issue to be worked on.
				Creature* sludgebeast = player->FindNearestCreature(NPC_SLUDGE_BEAST, 50.0f, true);
				if (!sludgebeast)
					player->SummonCreature(NPC_SLUDGE_BEAST, 1062.84f, -3143.2f, 68.1349f, 2.77142f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 60000);

			}

			return true;
		}
	};

	GameObjectAI* GetAI(GameObject* go) const override
	{
		return new go_sludge_pileAI(go);
	}
};



/// Waptor Twap Scweech - 66282
class spell_waptor_twap_scweech : public SpellScriptLoader
{
public:
	spell_waptor_twap_scweech() : SpellScriptLoader("spell_waptor_twap_scweech") { }

	class spell_waptor_twap_scweech_SpellScript : public SpellScript
	{
		PrepareSpellScript(spell_waptor_twap_scweech_SpellScript);

		enum Id
		{
			// Npc
			NPC_SUNSCALE_SCYTHECLAW = 3256,
			NPC_SUNSCALE_RAVAGER = 44164
		};

		void HandleAttractRaptor()
		{
			Unit* caster = GetCaster();
			if (!caster)
				return;

			if (caster->GetTypeId() == TYPEID_UNIT && caster->ToCreature())
			{
				if (Creature* raptor = caster->FindNearestCreature(NPC_SUNSCALE_SCYTHECLAW, 35.0f, true))
					raptor->GetMotionMaster()->MoveChase(caster, 0.5f);
				else if (Creature* raptor = caster->FindNearestCreature(NPC_SUNSCALE_RAVAGER, 35.0f, true))
					raptor->GetMotionMaster()->MoveChase(caster, 0.5f);
			}
		}

		void Register()
		{
			AfterCast += SpellCastFn(spell_waptor_twap_scweech_SpellScript::HandleAttractRaptor);
		}
	};

	SpellScript* GetSpellScript() const
	{
		return new spell_waptor_twap_scweech_SpellScript();
	}
};


/// Waptor Shrink - 66284
class spell_waptor_shrink : public SpellScriptLoader
{
public:
	spell_waptor_shrink() : SpellScriptLoader("spell_waptor_shrink") { }

	class spell_waptor_shrink_SpellScript : public SpellScript
	{
		PrepareSpellScript(spell_waptor_shrink_SpellScript);

		enum Id
		{
			SPELL_TWAP_FILLED = 66286
		};

		void HandleDespawn()
		{
			Unit* caster = GetCaster();
			if (!caster)
				return;

			if (caster->GetTypeId() == TYPEID_UNIT && caster->ToCreature())
			{
				caster->CastSpell(caster, SPELL_TWAP_FILLED, true);
				caster->ToCreature()->DespawnOrUnsummon(1000);
			}
		}

		void Register()
		{
			AfterCast += SpellCastFn(spell_waptor_shrink_SpellScript::HandleDespawn);
		}
	};

	SpellScript* GetSpellScript() const
	{
		return new spell_waptor_shrink_SpellScript();
	}
};


/// Pirate Signal Horn - 66204
class spell_pirate_signal_horn : public SpellScriptLoader
{
public:
	spell_pirate_signal_horn() : SpellScriptLoader("spell_pirate_signal_horn") { }

	enum Id
	{
		// Npc
		NPC_SOUTHSEA_MUTINEER = 34790,
		NPC_TONY_TWO_TUSK = 34749
	};

	class spell_pirate_signal_horn_SpellScript : public SpellScript
	{
		PrepareSpellScript(spell_pirate_signal_horn_SpellScript);

		SpellCastResult CheckCast()
		{
			if (Unit* caster = GetCaster())
			{
				if (caster->GetMapId() == 1 && caster->GetZoneId() == 17 && caster->GetAreaId() == 720)
					return SPELL_CAST_OK;
			}
			return SPELL_FAILED_CANT_DO_THAT_RIGHT_NOW;
		}

		void HandleSummonMutineers()
		{
			if (Unit* caster = GetCaster())
			{
				caster->SummonCreature(NPC_SOUTHSEA_MUTINEER, caster->GetPositionX(), caster->GetPositionY() + 2, caster->GetPositionZ(), caster->GetOrientation(), TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 30000);
				caster->SummonCreature(NPC_SOUTHSEA_MUTINEER, caster->GetPositionX(), caster->GetPositionY() - 2, caster->GetPositionZ(), caster->GetOrientation(), TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 30000);
				caster->SummonCreature(NPC_TONY_TWO_TUSK, caster->GetPositionX() + 2, caster->GetPositionY(), caster->GetPositionZ(), caster->GetOrientation(), TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 30000);
			}
		}

		void Register()
		{
			OnCheckCast += SpellCheckCastFn(spell_pirate_signal_horn_SpellScript::CheckCast);
			AfterCast += SpellCastFn(spell_pirate_signal_horn_SpellScript::HandleSummonMutineers);
		}
	};

	SpellScript* GetSpellScript() const
	{
		return new spell_pirate_signal_horn_SpellScript();
	}
};


/// Summon Kodo Part 3 - 96566, Summon Kodo Part 4 - 96749
class spell_mount_caravan_kodo_cue_part3_part4_96566_96749 : public SpellScriptLoader
{
public:
	spell_mount_caravan_kodo_cue_part3_part4_96566_96749() : SpellScriptLoader("spell_mount_caravan_kodo_cue_part3_part4_96566_96749") { }

	enum Id
	{
		/// Npcs
		NPC_ROCCO_MORSHAN = 52220,
		NPC_NAGALA_WHIPSHANK = 52207,
		NPC_LEAD_CARAVAN_KODO = 34430,
		NPC_HEAD_CARAVAN_KODO = 34577,
		NPC_CARAVAN_CART = 52316,
		NPC_CARAVAN_KODO_MORSHAN = 52212,
		NPC_MASTER_CARAVAN_KODO = 52314,

		/// Data
		SOUND_PLAY_CALL_CARAVAN = 3980
	};

	class spell_mount_caravan_kodo_cue_part3_part4_96566_96749_SpellScript : public SpellScript
	{
		PrepareSpellScript(spell_mount_caravan_kodo_cue_part3_part4_96566_96749_SpellScript);

		SpellCastResult CheckCast()
		{
			if (Creature* leadCaravan = GetCaster()->FindNearestCreature(NPC_LEAD_CARAVAN_KODO, 30.0f, true))
			{
				if (leadCaravan->GetPhaseMask() == 1)
					return SPELL_FAILED_CANT_DO_THAT_RIGHT_NOW;
			}
			if (Creature* headCaravan = GetCaster()->FindNearestCreature(NPC_HEAD_CARAVAN_KODO, 30.0f, true))
			{
				if (headCaravan->GetPhaseMask() == 1)
					return SPELL_FAILED_CANT_DO_THAT_RIGHT_NOW;
			}
			return SPELL_CAST_OK;
		}

		void HandleSummonCaravans()
		{
			if (Unit* caster = GetCaster())
			{
				if (caster->GetTypeId() == TYPEID_PLAYER)
					return;

				caster->PlayDirectSound(SOUND_PLAY_CALL_CARAVAN);
				switch (caster->ToCreature()->GetEntry())
				{
					case NPC_ROCCO_MORSHAN:
					{
						caster->SummonCreature(NPC_CARAVAN_CART, -379.23f, -2679.30f, 95.76f, 6.18f);
						break;
					}
					case NPC_NAGALA_WHIPSHANK:
					{
						caster->SummonCreature(NPC_MASTER_CARAVAN_KODO, 315.03f, -2541.74f, 91.69f, 3.11f);
						caster->SummonCreature(NPC_CARAVAN_KODO_MORSHAN, 329.21f, -2541.01f, 91.90f, 3.20f);
						break;
					}
					default:
						break;
				}
			}
		}

		void Register()
		{
			OnCheckCast += SpellCheckCastFn(spell_mount_caravan_kodo_cue_part3_part4_96566_96749_SpellScript::CheckCast);
			AfterCast += SpellCastFn(spell_mount_caravan_kodo_cue_part3_part4_96566_96749_SpellScript::HandleSummonCaravans);
		}
	};

	SpellScript* GetSpellScript() const
	{
		return new spell_mount_caravan_kodo_cue_part3_part4_96566_96749_SpellScript();
	}
};




/// Snared In Net - 65580
class spell_snared_in_net : public SpellScriptLoader
{
public:
	spell_snared_in_net() : SpellScriptLoader("spell_snared_in_net") { }

	class spell_snared_in_net_SpellScript : public SpellScript
	{
		PrepareSpellScript(spell_snared_in_net_SpellScript);

		enum Id
		{
			SPELL_COSMETIC_CHAINS = 88964,
			SPELL_GROL_DOM_NET = 65581,
			SPELL_DRAGGING_RAZORMANE = 65601,
			SPELL_SNARE_SECONDARY = 65609
		};

		void HandleAdditionalEffect(SpellEffIndex effIndex)
		{
			if (Unit* target = GetHitUnit())
			{
				GetCaster()->CastSpell(GetCaster(), SPELL_DRAGGING_RAZORMANE, true);
				GetCaster()->CastSpell(target, SPELL_COSMETIC_CHAINS, true);
				GetCaster()->CastSpell(target, SPELL_GROL_DOM_NET, true);
				GetCaster()->RemoveAurasDueToSpell(SPELL_GROL_DOM_NET);
				target->CastSpell(target, SPELL_GROL_DOM_NET, target);
				target->SetStandState(UNIT_STAND_STATE_DEAD);
				target->GetMotionMaster()->MoveChase(GetCaster(), 2.0f, GetCaster()->GetOrientation());
				target->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PACIFIED);
			}
		}

		void Register()
		{
			OnEffectHitTarget += SpellEffectFn(spell_snared_in_net_SpellScript::HandleAdditionalEffect, EFFECT_0, SPELL_EFFECT_DUMMY);
		}
	};

	SpellScript* GetSpellScript() const
	{
		return new spell_snared_in_net_SpellScript();
	}
};


/// Snared In Net (2nd Effect) - 65609
class spell_snared_secondary_effect : public SpellScriptLoader
{
public:
	spell_snared_secondary_effect() : SpellScriptLoader("spell_snared_secondary_effect") { }

	class spell_snared_secondary_effect_SpellScript : public SpellScript
	{
		PrepareSpellScript(spell_snared_secondary_effect_SpellScript);

		enum Id
		{
			SPELL_COSMETIC_CHAINS = 88964,
			SPELL_GROL_DOM_NET = 65581
		};

		void HandleCleanup(SpellEffIndex effIndex)
		{
			if (Unit* target = GetHitUnit())
			{
				if (!target->HasAura(SPELL_GROL_DOM_NET))
					return;

				target->SetStandState(UNIT_STAND_STATE_STAND);
				target->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PACIFIED);
				target->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
				target->RemoveAurasDueToSpell(SPELL_COSMETIC_CHAINS);
				target->RemoveAurasDueToSpell(SPELL_GROL_DOM_NET);
			}
		}

		void Register()
		{
			OnEffectHitTarget += SpellEffectFn(spell_snared_secondary_effect_SpellScript::HandleCleanup, EFFECT_0, SPELL_EFFECT_APPLY_AURA);
		}
	};

	SpellScript* GetSpellScript() const
	{
		return new spell_snared_secondary_effect_SpellScript();
	}
};



/// Placing Raptor Feather - 5316
class spell_placing_raptor_feather : public SpellScriptLoader
{
public:
	spell_placing_raptor_feather() : SpellScriptLoader("spell_placing_raptor_feather") { }

	class spell_placing_raptor_feather_SpellScript : public SpellScript
	{
		PrepareSpellScript(spell_placing_raptor_feather_SpellScript);

		enum Id
		{
			// GameObject
			GO_RAPTOR_FEATHER = 195317,

			// Npc
			NPC_RAPTOR_NEST_BUNNY = 34967,

			// GUID
			GUID_NEST_RED_BUNNY = 149797,
			GUID_NEST_YELLOW_BUNNY = 149725,
			GUID_NEST_BLUE_BUNNY = 149808,

			// Credits
			CREDIT_RED_BUNNY = 34964,
			CREDIT_YELLOW_BUNNY = 34962,
			CREDIT_BLUE_BUNNY = 34963
		};

		SpellCastResult CheckCast()
		{
			if (Creature* nestBunny = GetCaster()->FindNearestCreature(NPC_RAPTOR_NEST_BUNNY, 5.0f, true))
				return SPELL_CAST_OK;
			return SPELL_FAILED_CANT_DO_THAT_RIGHT_NOW;
		}

		void HandleSpawnFeather()
		{
			Unit* caster = GetCaster();
			if (!caster)
				return;

			if (Creature* nestBunny = caster->FindNearestCreature(NPC_RAPTOR_NEST_BUNNY, 5.0f, true))
			{
				if (caster->GetTypeId() != TYPEID_PLAYER)
					return;

				switch (nestBunny->GetGUIDLow())
				{
				case GUID_NEST_RED_BUNNY:
				{
					caster->ToPlayer()->KilledMonsterCredit(CREDIT_RED_BUNNY);
					break;
				}
				case GUID_NEST_YELLOW_BUNNY:
				{
					caster->ToPlayer()->KilledMonsterCredit(CREDIT_YELLOW_BUNNY);
					break;
				}
				case GUID_NEST_BLUE_BUNNY:
				{
					caster->ToPlayer()->KilledMonsterCredit(CREDIT_BLUE_BUNNY);
					break;
				}
				default:
					break;
				}

				caster->SummonGameObject(GO_RAPTOR_FEATHER, nestBunny->GetPositionX(), nestBunny->GetPositionY(), nestBunny->GetPositionZ() - 1, nestBunny->GetOrientation(), 0, 0, 0, 0, NULL);
			}
		}

		void Register()
		{
			OnCheckCast += SpellCheckCastFn(spell_placing_raptor_feather_SpellScript::CheckCast);
			AfterCast += SpellCastFn(spell_placing_raptor_feather_SpellScript::HandleSpawnFeather);
		}
	};

	SpellScript* GetSpellScript() const
	{
		return new spell_placing_raptor_feather_SpellScript();
	}
};

#ifndef __clang_analyzer__
void AddSC_the_barrens()
{
	/// Handlers
	new playerScript_quest_handler();

	/// Scripts
	/// --- Northern Barrens Quests
	new npc_beaten_corpse();
	new npc_gilthares();
	new npc_taskmaster_fizzule();
    new npc_wizzlecrank_shredder();
	new npc_muddy_tracks();

	/// --- Quest: Far Watch Post & Crossroads Quests (Through Fire and Flames, Caravan Delivery, Pickup, Drag it out of them and By Hook or By Crook)
	/// Npcs
	/// --- Through Fires and Flames
	new npc_trapped_wolf_34285();
	new npc_chain_origin_34287();
	
	/// --- Verog the Dervish
	new npc_wyneth_34846();
	new npc_verog_the_dervish_3395();

	/// --- Crossroads Caravan Pickup & Crossroads Caravan Delivery
	new npc_halga_bloodeye_34258();
	new npc_lead_caravan_kodo_34430();
	new npc_balgor_whipshank_34431();
	new npc_razormane_raider_34487();
	new npc_rocco_whipshank_34578();
	new npc_head_caravan_kodo_34577();
	new npc_burning_blade_raider_34594();
	new vehicle_riding_shotgun_34438();
	new vehicle_hotseat_34582();
	new vehicle_burning_blade_mount_34593();

	/// --- Drag it out of them & By Hook or By Crook
	new npc_razormane_pillager_34503();
	new npc_hogtied_razormane_34514();
	new npc_togrik_34513();
	new npc_captured_razormane_34523();
	new npc_groldom_kodo_34547();
	new npc_fez_34543();


	/// --- Ratchet Quests
	new npc_baron_longshore();
	new npc_gazlowe_3391();
	new npc_chief_engineer_foote();
	new npc_theramore_deckhand();


	/// Gameobjects
	new go_wolf_chains();
	new go_sludge_pile();

	/// Spells
	new spell_mount_caravan_kodo_cue_65485();
	new spell_mount_caravan_kodo_cue_part2_65669();
	new spell_snared_in_net();
	new spell_snared_secondary_effect();
	new spell_placing_raptor_feather();
	new spell_waptor_twap_scweech();
	new spell_waptor_shrink();
	new spell_pirate_signal_horn();
	new spell_mount_caravan_kodo_cue_part3_part4_96566_96749();

	/// Areatriggers
	new at_caravan_scene_5482();
	new at_follow_the_tracks_5483();
	new at_groldoms_farm_5465();	
	
}
#endif
