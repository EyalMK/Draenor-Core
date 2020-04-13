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

#ifndef __clang_analyzer__
void AddSC_the_barrens()
{
	new npc_beaten_corpse();
	new npc_gilthares();
	new npc_taskmaster_fizzule();
    new npc_wizzlecrank_shredder();
}
#endif
