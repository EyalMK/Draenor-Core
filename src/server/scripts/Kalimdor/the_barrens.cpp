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

				if (Creature* cutthroat = Baron->FindNearestCreature(3383, 20.0f, true))
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



#ifndef __clang_analyzer__
void AddSC_the_barrens()
{
	/// Handlers
	new playerScript_quest_handler();

	/// Scripts
	new npc_beaten_corpse();
	new npc_gilthares();
	new npc_taskmaster_fizzule();
    new npc_wizzlecrank_shredder();
	new npc_baron_longshore();
	new npc_gazlowe_3391();
	new npc_chief_engineer_foote();
	new npc_theramore_deckhand();
}
#endif
