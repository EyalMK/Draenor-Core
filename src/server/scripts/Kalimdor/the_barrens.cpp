////////////////////////////////////////////////////////////////////////////////
//
// Project-Hellscream https://hellscream.org
// Copyright (C) 2018-2020 Project-Hellscream-6.2
// Discord https://discord.gg/CWCF3C9
//
////////////////////////////////////////////////////////////////////////////////

/* ScriptData
SDName: The_Barrens
SD%Complete: 90
SDComment: Quest support: 863
SDCategory: Barrens
EndScriptData */

/* ContentData
npc_wizzlecrank_shredder
EndContentData */

#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "ScriptedGossip.h"
#include "ScriptedEscortAI.h"

class playerScript_quest_status_handler : public PlayerScript
{
public:
	playerScript_quest_status_handler() : PlayerScript("playerScript_quest_status_handler") { }

	void OnQuestComplete(Player* p_Player, const Quest* p_Quest) override
	{
		if (p_Quest->GetQuestId() == 14050) // Gazlowe's Fortune
			if (p_Player->GetQuestStatus(14050) == QUEST_STATUS_COMPLETE)
			{
				Position posBaron = { -1163.2906f, -3638.6038f, 95.6738f };
				p_Player->SummonCreature(3467, posBaron, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 120000); // Baron Longshore

				Position posCutThroat = { -1166.0581f, -3638.5015f, 95.4870f };
				p_Player->SummonCreature(3383, posCutThroat, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 120000); // Southsea Cutthroat
			}	
	}
};




/*######
## npc_beaten_corpse
######*/

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
		npc_beaten_corpseAI(Creature* creature) : ScriptedAI(creature)
		{
		}

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

/*######
# npc_gilthares
######*/

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

/*######
## npc_taskmaster_fizzule
######*/

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


/*#####
## npc_wizzlecrank_shredder
#####*/

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
		QUEST_THE_BARONS_DEMANDS = 14046,
		QUEST_GAZLOWES_FORTUNE	 = 14050,

		// Kill credit
		NPC_BARON_LONGSHORE_KILLCREDIT = 34769,

		// Gossip Menu and option
		GOSSIP_MENU_BARON = 10567,
		GOSSIP_OPTION	  = 0,
		GOSSIP_OPTION_1	  = 1,

		// Npc texts
		NPC_TEXT_BARON_1  = 14623, // no quest
		NPC_TEXT_BARON_2  = 14624, // After freeing
		NPC_TEXT_BARON_3  = 14625, // Well? Don't ye...
		NPC_TEXT_BARON_4  = 14626, // Suit yerself...
	};


	bool OnGossipHello(Player* player, Creature* creature)
	{
		if (player->GetQuestStatus(QUEST_THE_BARONS_DEMANDS) == QUEST_STATUS_INCOMPLETE)
		{
			player->ADD_GOSSIP_ITEM_DB(GOSSIP_MENU_BARON, GOSSIP_OPTION, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
			player->ADD_GOSSIP_ITEM_DB(GOSSIP_MENU_BARON, GOSSIP_OPTION_1, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 2);
			player->SEND_GOSSIP_MENU(NPC_TEXT_BARON_2, creature->GetGUID());
			return true;
		}
		player->SEND_GOSSIP_MENU(NPC_TEXT_BARON_1, creature->GetGUID());
		return true;
	}

	bool OnGossipSelect(Player* player, Creature* creature, uint32 sender, uint32 action) override
	{
		switch (action)
		{
			case GOSSIP_ACTION_INFO_DEF + 1:
				player->SEND_GOSSIP_MENU(NPC_TEXT_BARON_4, creature->GetGUID());
				break;
			case GOSSIP_ACTION_INFO_DEF + 2:
				creature->AI()->Talk(0); // Har! Pleasure doin' business...
				player->KilledMonsterCredit(NPC_BARON_LONGSHORE_KILLCREDIT, player->GetGUID());
		}
		player->CLOSE_GOSSIP_MENU();

		return true;
	}

	struct npc_baron_longshoreAI : public ScriptedAI
	{
		npc_baron_longshoreAI(Creature* p_Creature) : ScriptedAI(p_Creature) {}

		void JustSummoned(Creature* summon) override
		{
			if (summon->ToTempSummon())
			{
				summon->setFaction(103); // Hostile Faction
			}
		}

		void IsSummonedBy(Unit* summoner) override
		{
			if (Player* player = summoner->ToPlayer())
			{
				if (player->GetQuestStatus(QUEST_GAZLOWES_FORTUNE) == QUEST_STATUS_COMPLETE)
					me->CombatStart(player, true);
			}
		}

		void JustDied(Unit* /*killer*/) override
		{
			me->setFaction(35);
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
			Creature* Gagsprocket = p_Creature->FindNearestCreature(NPC_GAGSPROCKET, 20.0f, true);
			if (Gagsprocket)
			{
				p_Creature->GetAI()->DoAction(ActionCompletedQuest);
			}
		}
		return false;
	}

	struct npc_gazlowe_3391AI : public ScriptedAI
	{
		npc_gazlowe_3391AI(Creature* p_Creature) : ScriptedAI(p_Creature) {}

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
						Creature* Gagsprocket = me->FindNearestCreature(NPC_GAGSPROCKET, 20.0f, true);
						if (Gagsprocket)
							Gagsprocket->AI()->Talk(GAGSPROCKET_TEXT_1);
					});
					AddTimedDelayedOperation(3.5 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->AI()->Talk(GAZLOWE_TEXT_2);
					});

					ClearDelayedOperations();
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

#ifndef __clang_analyzer__
void AddSC_the_barrens()
{
	new npc_beaten_corpse();
	new npc_gilthares();
	new npc_taskmaster_fizzule();
    new npc_wizzlecrank_shredder();
	new npc_baron_longshore();
	new npc_gazlowe_3391();
}
#endif
