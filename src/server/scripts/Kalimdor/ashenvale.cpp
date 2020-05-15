////////////////////////////////////////////////////////////////////////////////
//
// Project-Hellscream https://hellscream.org
// Copyright (C) 2018-2020 Project-Hellscream-6.2
// Discord https://discord.gg/CWCF3C9
//
////////////////////////////////////////////////////////////////////////////////

/* ScriptData
SDName: Ashenvale
SD%Complete: 70
SDComment: Quest support: 6544, 6482
SDCategory: Ashenvale Forest
EndScriptData */


#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "ScriptedEscortAI.h"



enum ashenvale
{
	QUEST_OF_THEIR_OWN_DESIGN = 13595,
	NPC_BATHRANS_CORPSE = 33183,

	QUEST_BATHED_IN_LIGHT = 13642,
	GO_LIGHT_OF_ELUNE_AT_LAKE_FALATHIM = 194651,
	ITEM_UNBATHED_CONCOCTION = 45065,
	ITEM_BATHED_CONCOCTION = 45066,

	QUEST_RESPECT_FOR_THE_FALLEN = 13626,
	SPELL_CREATE_FEEROS_HOLY_HAMMER_COVER = 62837,
	ITEM_FEEROS_HOLY_HAMMER = 45042,
	SPELL_CREATE_THE_PURIFIERS_PRAYER_BOOK_COVER = 62839,
	ITEM_PURIFIERS_PRAYER_BOOK = 45043,

	QUEST_TREE_FRIENDS_OF_THE_FOREST = 13976,
	QUEST_IN_A_BIND = 13982,
	SPELL_BOLYUN_SEE_INVISIBILITY_1 = 65714,
	SPELL_BOLYUN_SEE_INVISIBILITY_2 = 65715,

	QUEST_CLEAR_THE_SHRINE = 13985,
	QUEST_THE_LAST_STAND = 13987,
	NPC_DEMONIC_INVADER = 34609,
	NPC_BIG_BAOBOB = 34604,

	QUEST_ASTRANAARS_BURNING = 13849,
	NPC_ASTRANAARS_BURNING_FIRE_BUNNY = 34123,
	SPELL_ASTRANAARS_BURNING_SEE_INVISIBLE_01 = 64572,
	SPELL_ASTRANAARS_BURNING_SEE_INVISIBLE_02 = 64574,
	SPELL_ASTRANAARS_BURNING_SMOKE = 64565,
	SPELL_THROW_BUCKET_OF_WATER = 64558,
	SPELL_BATHRANS_CORPSE_FIRE = 62511,


};

/// Torek - 12858
enum TorekSays
{
    SAY_READY                  = 0,
    SAY_MOVE                   = 1,
    SAY_PREPARE                = 2,
    SAY_WIN                    = 3,
    SAY_END                    = 4
};

enum TorekSpells
{
    SPELL_REND                  = 11977,
    SPELL_THUNDERCLAP           = 8078
};

enum TorekMisc
{
    QUEST_TOREK_ASSULT          = 6544,

    ENTRY_SPLINTERTREE_RAIDER   = 12859,
    ENTRY_DURIEL                = 12860,
    ENTRY_SILVERWING_SENTINEL   = 12896,
    ENTRY_SILVERWING_WARRIOR    = 12897
};

class npc_torek : public CreatureScript
{
    public:

        npc_torek() : CreatureScript("npc_torek")
        {
        }

        struct npc_torekAI : public npc_escortAI
        {
            npc_torekAI(Creature* creature) : npc_escortAI(creature) {}

            uint32 Rend_Timer;
            uint32 Thunderclap_Timer;
            bool Completed;

            void WaypointReached(uint32 waypointId)
            {
                if (Player* player = GetPlayerForEscort())
                {
                    switch (waypointId)
                    {
                        case 1:
                            Talk(SAY_MOVE, player->GetGUID());
                            break;
                        case 8:
                            Talk(SAY_PREPARE, player->GetGUID());
                            break;
                        case 19:
                            //TODO: verify location and creatures amount.
                            me->SummonCreature(ENTRY_DURIEL, 1776.73f, -2049.06f, 109.83f, 1.54f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 25000);
                            me->SummonCreature(ENTRY_SILVERWING_SENTINEL, 1774.64f, -2049.41f, 109.83f, 1.40f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 25000);
                            me->SummonCreature(ENTRY_SILVERWING_WARRIOR, 1778.73f, -2049.50f, 109.83f, 1.67f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 25000);
                            break;
                        case 20:
                            DoScriptText(SAY_WIN, me, player);
                            Completed = true;
                            player->GroupEventHappens(QUEST_TOREK_ASSULT, me);
                            break;
                        case 21:
                            Talk(SAY_END, player->GetGUID());
                            break;
                    }
                }
            }

            void Reset()
            {
                Rend_Timer = 5000;
                Thunderclap_Timer = 8000;
                Completed = false;
            }

            void EnterCombat(Unit* /*who*/)
            {
            }

            void JustSummoned(Creature* summoned)
            {
                summoned->AI()->AttackStart(me);
            }

            void UpdateAI(const uint32 diff)
            {
                npc_escortAI::UpdateAI(diff);

                if (!UpdateVictim())
                    return;

                if (Rend_Timer <= diff)
                {
                    DoCast(me->getVictim(), SPELL_REND);
                    Rend_Timer = 20000;
                }
                else
                    Rend_Timer -= diff;

                if (Thunderclap_Timer <= diff)
                {
                    DoCast(me, SPELL_THUNDERCLAP);
                    Thunderclap_Timer = 30000;
                }
                else
                    Thunderclap_Timer -= diff;
            }
        };

        CreatureAI* GetAI(Creature* creature) const
        {
            return new npc_torekAI(creature);
        }

        bool OnQuestAccept(Player* player, Creature* creature, Quest const* quest)
        {
            if (quest->GetQuestId() == QUEST_TOREK_ASSULT)
            {
                //TODO: find companions, make them follow Torek, at any time (possibly done by core/database in future?)
                creature->AI()->Talk(SAY_READY, player->GetGUID());
                creature->setFaction(113);

                if (npc_escortAI* pEscortAI = CAST_AI(npc_torekAI, creature->AI()))
                    pEscortAI->Start(true, true, player->GetGUID());
            }

            return true;
        }
};

/// Ruul Snowhoof - 12818
enum RuulSnowhoof
{
    NPC_THISTLEFUR_URSA         = 3921,
    NPC_THISTLEFUR_TOTEMIC      = 3922,
    NPC_THISTLEFUR_PATHFINDER   = 3926,

    QUEST_FREEDOM_TO_RUUL       = 6482,

    GO_CAGE                     = 178147
};

Position const RuulSnowhoofSummonsCoord[6] =
{
    {3449.218018f, -587.825073f, 174.978867f, 4.714445f},
    {3446.384521f, -587.830872f, 175.186279f, 4.714445f},
    {3444.218994f, -587.835327f, 175.380600f, 4.714445f},
    {3508.344482f, -492.024261f, 186.929031f, 4.145029f},
    {3506.265625f, -490.531006f, 186.740128f, 4.239277f},
    {3503.682373f, -489.393799f, 186.629684f, 4.349232f}
};

class npc_ruul_snowhoof : public CreatureScript
{
    public:
        npc_ruul_snowhoof() : CreatureScript("npc_ruul_snowhoof") { }

        struct npc_ruul_snowhoofAI : public npc_escortAI
        {
            npc_ruul_snowhoofAI(Creature* creature) : npc_escortAI(creature) { }

            void WaypointReached(uint32 waypointId)
            {
                Player* player = GetPlayerForEscort();
                if (!player)
                    return;

                switch (waypointId)
                {
                    case 0:
                        me->SetUInt32Value(UNIT_FIELD_ANIM_TIER, 0);
                        if (GameObject* Cage = me->FindNearestGameObject(GO_CAGE, 20))
                            Cage->SetGoState(GO_STATE_ACTIVE);
                        break;
                    case 13:
                        me->SummonCreature(NPC_THISTLEFUR_TOTEMIC, RuulSnowhoofSummonsCoord[0], TEMPSUMMON_DEAD_DESPAWN, 60000);
                        me->SummonCreature(NPC_THISTLEFUR_URSA, RuulSnowhoofSummonsCoord[1], TEMPSUMMON_DEAD_DESPAWN, 60000);
                        me->SummonCreature(NPC_THISTLEFUR_PATHFINDER, RuulSnowhoofSummonsCoord[2], TEMPSUMMON_DEAD_DESPAWN, 60000);
                        break;
                    case 19:
                        me->SummonCreature(NPC_THISTLEFUR_TOTEMIC, RuulSnowhoofSummonsCoord[3], TEMPSUMMON_DEAD_DESPAWN, 60000);
                        me->SummonCreature(NPC_THISTLEFUR_URSA, RuulSnowhoofSummonsCoord[4], TEMPSUMMON_DEAD_DESPAWN, 60000);
                        me->SummonCreature(NPC_THISTLEFUR_PATHFINDER, RuulSnowhoofSummonsCoord[5], TEMPSUMMON_DEAD_DESPAWN, 60000);
                        break;
                    case 21:
                        player->GroupEventHappens(QUEST_FREEDOM_TO_RUUL, me);
                        break;
                }
            }

            void EnterCombat(Unit* /*who*/) {}

            void Reset()
            {
                if (GameObject* Cage = me->FindNearestGameObject(GO_CAGE, 20))
                    Cage->SetGoState(GO_STATE_READY);
            }

            void JustSummoned(Creature* summoned)
            {
                summoned->AI()->AttackStart(me);
            }

            void UpdateAI(const uint32 diff)
            {
                npc_escortAI::UpdateAI(diff);
            }
        };

        CreatureAI* GetAI(Creature* creature) const
        {
            return new npc_ruul_snowhoofAI(creature);
        }

        bool OnQuestAccept(Player* player, Creature* creature, Quest const* quest)
        {
            if (quest->GetQuestId() == QUEST_FREEDOM_TO_RUUL)
            {
                creature->setFaction(113);

                if (npc_escortAI* pEscortAI = CAST_AI(npc_ruul_snowhoofAI, (creature->AI())))
                    pEscortAI->Start(true, false, player->GetGUID());
            }

            return true;
        }
};

/// Muglash - 
enum Muglash
{
    SAY_MUG_START1          = -1800054,
    SAY_MUG_START2          = -1800055,
    SAY_MUG_BRAZIER         = -1800056,
    SAY_MUG_BRAZIER_WAIT    = -1800057,
    SAY_MUG_ON_GUARD        = -1800058,
    SAY_MUG_REST            = -1800059,
    SAY_MUG_DONE            = -1800060,
    SAY_MUG_GRATITUDE       = -1800061,
    SAY_MUG_PATROL          = -1800062,
    SAY_MUG_RETURN          = -1800063,

    QUEST_VORSHA            = 6641,

    GO_NAGA_BRAZIER         = 178247,

    NPC_WRATH_RIDER         = 3713,
    NPC_WRATH_SORCERESS     = 3717,
    NPC_WRATH_RAZORTAIL     = 3712,

    NPC_WRATH_PRIESTESS     = 3944,
    NPC_WRATH_MYRMIDON      = 3711,
    NPC_WRATH_SEAWITCH      = 3715,

    NPC_VORSHA              = 12940,
    NPC_MUGLASH             = 12717
};

Position const FirstNagaCoord[3] =
{
    {3603.504150f, 1122.631104f, 1.635f, 0.0f},         // rider
    {3589.293945f, 1148.664063f, 5.565f, 0.0f},         // sorceress
    {3609.925537f, 1168.759521f, -1.168f, 0.0f}         // razortail
};

Position const SecondNagaCoord[3] =
{
    {3609.925537f, 1168.759521f, -1.168f, 0.0f},        // witch
    {3645.652100f, 1139.425415f, 1.322f, 0.0f},         // priest
    {3583.602051f, 1128.405762f, 2.347f, 0.0f}          // myrmidon
};

Position const VorshaCoord = {3633.056885f, 1172.924072f, -5.388f, 0.0f};

class npc_muglash : public CreatureScript
{
    public:
        npc_muglash() : CreatureScript("npc_muglash") { }

        struct npc_muglashAI : public npc_escortAI
        {
            npc_muglashAI(Creature* creature) : npc_escortAI(creature) { }

            uint8 WaveId;
            uint32 EventTimer;
            bool IsBrazierExtinguished;

            void JustSummoned(Creature* summoned)
            {
                summoned->AI()->AttackStart(me);
            }

            void WaypointReached(uint32 waypointId)
            {
                if (Player* player = GetPlayerForEscort())
                {
                    switch (waypointId)
                    {
                        case 0:
                            DoScriptText(SAY_MUG_START2, me, player);
                            break;
                        case 24:
                            DoScriptText(SAY_MUG_BRAZIER, me, player);

                            if (GameObject* go = GetClosestGameObjectWithEntry(me, GO_NAGA_BRAZIER, INTERACTION_DISTANCE*2))
                            {
                                go->RemoveFlag(GAMEOBJECT_FIELD_FLAGS, GO_FLAG_NOT_SELECTABLE);
                                SetEscortPaused(true);
                            }
                            break;
                        case 25:
                            DoScriptText(SAY_MUG_GRATITUDE, me);
                            player->GroupEventHappens(QUEST_VORSHA, me);
                            break;
                        case 26:
                            DoScriptText(SAY_MUG_PATROL, me);
                            break;
                        case 27:
                            DoScriptText(SAY_MUG_RETURN, me);
                            break;
                    }
                }
            }

            void EnterCombat(Unit* /*who*/)
            {
                if (Player* player = GetPlayerForEscort())
                    if (HasEscortState(STATE_ESCORT_PAUSED))
                    {
                        if (urand(0, 1))
                            DoScriptText(SAY_MUG_ON_GUARD, me, player);
                        return;
                    }
            }

            void Reset()
            {
                EventTimer = 10000;
                WaveId = 0;
                IsBrazierExtinguished = false;
            }

            void JustDied(Unit* /*killer*/)
            {
                if (HasEscortState(STATE_ESCORT_ESCORTING))
                    if (Player* player = GetPlayerForEscort())
                        player->FailQuest(QUEST_VORSHA);
            }

            void DoWaveSummon()
            {
                switch (WaveId)
                {
                    case 1:
                        me->SummonCreature(NPC_WRATH_RIDER,     FirstNagaCoord[0], TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 60000);
                        me->SummonCreature(NPC_WRATH_SORCERESS, FirstNagaCoord[1], TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 60000);
                        me->SummonCreature(NPC_WRATH_RAZORTAIL, FirstNagaCoord[2], TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 60000);
                        break;
                    case 2:
                        me->SummonCreature(NPC_WRATH_PRIESTESS, SecondNagaCoord[0], TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 60000);
                        me->SummonCreature(NPC_WRATH_MYRMIDON,  SecondNagaCoord[1], TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 60000);
                        me->SummonCreature(NPC_WRATH_SEAWITCH,  SecondNagaCoord[2], TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 60000);
                        break;
                    case 3:
                        me->SummonCreature(NPC_VORSHA, VorshaCoord, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 60000);
                        break;
                    case 4:
                        SetEscortPaused(false);
                        DoScriptText(SAY_MUG_DONE, me);
                        break;
                }
            }

            void UpdateAI(const uint32 uiDiff)
            {
                npc_escortAI::UpdateAI(uiDiff);

                if (!me->getVictim())
                {
                    if (HasEscortState(STATE_ESCORT_PAUSED) && IsBrazierExtinguished)
                    {
                        if (EventTimer < uiDiff)
                        {
                            ++WaveId;
                            DoWaveSummon();
                            EventTimer = 10000;
                        }
                        else
                            EventTimer -= uiDiff;
                    }
                    return;
                }
                DoMeleeAttackIfReady();
            }
        };

        CreatureAI* GetAI(Creature* creature) const
        {
            return new npc_muglashAI(creature);
        }

        bool OnQuestAccept(Player* player, Creature* creature, Quest const* quest)
        {
            if (quest->GetQuestId() == QUEST_VORSHA)
            {
                if (npc_muglashAI* pEscortAI = CAST_AI(npc_muglashAI, creature->AI()))
                {
                    DoScriptText(SAY_MUG_START1, creature);
                    creature->setFaction(113);

                    pEscortAI->Start(true, false, player->GetGUID());
                }
            }
            return true;
        }
};


/// Quest 13976 -  Three Friends of the Forest

/// Bolyun 1 - 3698
class npc_bolyun_1 : public CreatureScript
{
public:
	npc_bolyun_1() : CreatureScript("npc_bolyun_1") { }

	struct npc_bolyun_1AI : public ScriptedAI
	{
		npc_bolyun_1AI(Creature* creature) : ScriptedAI(creature) {}

		uint32 VisibleStatus; // 0=unknown 1=visible 2=invisible

		void ShowCreature(Player* player)
		{
			if (VisibleStatus != 1)
			{
				me->AddAura(SPELL_BOLYUN_SEE_INVISIBILITY_1, player);
				VisibleStatus = 1;
			}
		}

		void HideCreature(Player* player)
		{
			if (VisibleStatus != 2)
			{
				player->RemoveAura(SPELL_BOLYUN_SEE_INVISIBILITY_1);
				player->RemoveAuraFromStack(SPELL_BOLYUN_SEE_INVISIBILITY_1);
				VisibleStatus = 2;
			}
		}

		void Reset()
		{
			VisibleStatus = 0;
		}

		void MoveInLineOfSight(Unit* who)
		{
			if (Player* player = who->ToPlayer())
			{
				if (player->GetQuestStatus(QUEST_IN_A_BIND) != QUEST_STATUS_REWARDED)
				{
					ShowCreature(player);
					return;
				}
				HideCreature(player);
			}
		}

		bool OnQuestReward(Player* player, Creature* creature, Quest const* quest, uint32 opt)
		{
			if (quest->GetQuestId() == QUEST_IN_A_BIND)
				HideCreature(player);
			return true;
		}

	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_bolyun_1AI(creature);
	}
};

/// Bolyun 2 - 34599
class npc_bolyun_2 : public CreatureScript
{
public:
	npc_bolyun_2() : CreatureScript("npc_bolyun_2") { }

	struct npc_bolyun_2AI : public ScriptedAI
	{
		npc_bolyun_2AI(Creature* creature) : ScriptedAI(creature) {}

		uint32 VisibleStatus; // 0=unknown 1=visible 2=invisible

		void ShowCreature(Player* player)
		{
			if (VisibleStatus != 1)
			{
				me->AddAura(SPELL_BOLYUN_SEE_INVISIBILITY_2, player);
				VisibleStatus = 1;
			}
		}

		void HideCreature(Player* player)
		{
			if (VisibleStatus != 2)
			{
				player->RemoveAura(SPELL_BOLYUN_SEE_INVISIBILITY_2);
				player->RemoveAuraFromStack(SPELL_BOLYUN_SEE_INVISIBILITY_2);
				VisibleStatus = 2;
			}
		}

		void Reset()
		{
			VisibleStatus = 0;
		}

		void MoveInLineOfSight(Unit* who)
		{
			if (Player* player = who->ToPlayer())
			{
				if (player->GetQuestStatus(QUEST_IN_A_BIND) == QUEST_STATUS_REWARDED)
					ShowCreature(player);
				else
					HideCreature(player);
			}
		}

		bool OnQuestReward(Player* player, Creature* creature, Quest const* quest, uint32 opt)
		{
			if (quest->GetQuestId() == QUEST_IN_A_BIND)
				ShowCreature(player);
			return true;
		}

	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_bolyun_2AI(creature);
	}
};

/// Big Baobob - 34604
class npc_big_baobob : public CreatureScript
{
public:
	npc_big_baobob() : CreatureScript("npc_big_baobob") { }

	struct npc_big_baobobAI : public ScriptedAI
	{
		npc_big_baobobAI(Creature* creature) : ScriptedAI(creature) {}

		uint32	_timer_check_for_player;
		uint32	_timer_for_spawn_invaders;
		bool	_IsPlayerNear;

		void Reset()
		{
			_timer_check_for_player = 2000; _timer_for_spawn_invaders = 0; _IsPlayerNear = false;
		}

		void UpdateAI(uint32 diff)
		{
			if (_timer_check_for_player <= diff)
			{
				_IsPlayerNear = DoCheckForPlayer();
				_timer_check_for_player = 10000;
				if (_IsPlayerNear)
					_timer_for_spawn_invaders = 1000;
			}
			else
				_timer_check_for_player -= diff;

			if (_IsPlayerNear)
			{
				if (_timer_for_spawn_invaders <= diff)
				{
					DoSpawnInvaders();
					_timer_for_spawn_invaders = 1000;
				}
				else
					_timer_for_spawn_invaders -= diff;

			}

			if (!UpdateVictim())
				return;
			else
				DoMeleeAttackIfReady();
		}

		bool DoCheckForPlayer()
		{
			std::list<Player*> PlayerList;
			JadeCore::AnyPlayerInObjectRangeCheck checker(me, 50.0f);
			JadeCore::PlayerListSearcher<JadeCore::AnyPlayerInObjectRangeCheck> searcher(me, PlayerList, checker);
			me->VisitNearbyWorldObject(50.0, searcher);
			if (PlayerList.empty()) return false;
			for (std::list<Player*>::const_iterator itr = PlayerList.begin(); itr != PlayerList.end(); ++itr)
			{
				if (Player* player = *itr)
				{
					if (!player->GetQuestRewardStatus(QUEST_THE_LAST_STAND))
					{
						if (player->GetQuestStatus(QUEST_CLEAR_THE_SHRINE) == QUEST_STATUS_INCOMPLETE) return true;
						if (player->GetQuestStatus(QUEST_THE_LAST_STAND) == QUEST_STATUS_INCOMPLETE) return true;
						if (player->GetQuestRewardStatus(QUEST_CLEAR_THE_SHRINE)) return true;
					}
				}
			}

			return false;
		}

		void DoSpawnInvaders()
		{
			if (GetCountOfLivingInvaders() >= 4) return;
			Position pos;
			me->GetPosition(&pos);
			me->GetRandomNearPosition(pos, 30.0f);
			if (Creature* creature = me->SummonCreature(NPC_DEMONIC_INVADER, pos))
			{
				creature->GetMotionMaster()->MovePoint(0, me->GetPositionX(), me->GetPositionY(), me->GetPositionZ());
			}
		}

		uint32 GetCountOfLivingInvaders()
		{
			uint32 count = 0;
			std::list<Creature*> InvadersList;
			me->GetCreatureListWithEntryInGrid(InvadersList, NPC_DEMONIC_INVADER, 30.0f);
			if (!InvadersList.empty())
			{
				for (std::list<Creature*>::const_iterator itr = InvadersList.begin(); itr != InvadersList.end(); ++itr)
				{
					if (Creature* invader = *itr)
					{
						if (invader->isAlive()) count++;
					}
				}
			}
			return count;
		}
	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_big_baobobAI(creature);
	}
};

/// Astranaar Burning Fire Bunny - 34123
class npc_astranaar_burning_fire_bunny : public CreatureScript
{
public:
	npc_astranaar_burning_fire_bunny() : CreatureScript("npc_astranaar_burning_fire_bunny") { }

	struct npc_astranaar_burning_fire_bunnyAI : public ScriptedAI
	{
		npc_astranaar_burning_fire_bunnyAI(Creature* creature) : ScriptedAI(creature) {}

		uint32	_timer_check_for_player;
		uint32  _timer;
		uint32	_phase;
		Player*	_player;

		void Reset()
		{
			_timer_check_for_player = 2000; _phase = 0; _timer = 0;
			me->AddAura(SPELL_BATHRANS_CORPSE_FIRE, me);
		}

		void SpellHit(Unit* Hitter, SpellInfo const* spell)
		{
			_phase = 1; _player = Hitter->ToPlayer();
		}

		void UpdateAI(uint32 diff)
		{
			if (_timer_check_for_player <= diff)
			{
				DoCheckForNearPlayerWithQuest();
				_timer_check_for_player = 10000;
			}
			else
				_timer_check_for_player -= diff;

			if (_timer <= diff)
				DoWork();
			else
				_timer -= diff;

			if (!UpdateVictim())
				return;
			else
				DoMeleeAttackIfReady();
		}

		void DoCheckForNearPlayerWithQuest()
		{
			std::list<Player*> PlayerList;
			JadeCore::AnyPlayerInObjectRangeCheck checker(me, 50.0f);
			JadeCore::PlayerListSearcher<JadeCore::AnyPlayerInObjectRangeCheck> searcher(me, PlayerList, checker);
			me->VisitNearbyWorldObject(50.0, searcher);
			if (PlayerList.empty()) return;
			for (std::list<Player*>::const_iterator itr = PlayerList.begin(); itr != PlayerList.end(); ++itr)
			{
				if (Player* player = *itr)
				{
					switch (player->GetQuestStatus(QUEST_ASTRANAARS_BURNING))
					{
					case QUEST_STATUS_INCOMPLETE:
					{
						if (!player->HasAura(SPELL_ASTRANAARS_BURNING_SEE_INVISIBLE_01))
						{
							player->AddAura(SPELL_ASTRANAARS_BURNING_SEE_INVISIBLE_01, player);
						}
						break;
					}
					case QUEST_STATUS_COMPLETE:
					{
						if (player->HasAura(SPELL_ASTRANAARS_BURNING_SEE_INVISIBLE_01))
						{
							player->RemoveAura(SPELL_ASTRANAARS_BURNING_SEE_INVISIBLE_01);
							player->RemoveAuraFromStack(SPELL_ASTRANAARS_BURNING_SEE_INVISIBLE_01, player->GetGUID());
						}
						break;
					}
					}
				}
			}
		}

		void DoWork()
		{
			switch (_phase)
			{
			case 1:
			{
				me->RemoveAura(SPELL_BATHRANS_CORPSE_FIRE);
				me->AddAura(SPELL_ASTRANAARS_BURNING_SMOKE, me);
				if (_player) _player->KilledMonsterCredit(NPC_ASTRANAARS_BURNING_FIRE_BUNNY);
				_timer = 60000; _phase = 2;
				break;
			}
			case 2:
			{
				me->DespawnOrUnsummon();
				_timer = 0; _phase = 0;
				break;
			}
			}
		}
	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_astranaar_burning_fire_bunnyAI(creature);
	}
};



/// Silverwind Defender - 34621
class npc_silverwind_defender_34621 : public CreatureScript
{
public:
	npc_silverwind_defender_34621() : CreatureScript("npc_silverwind_defender_34621") { }

	enum eMisc
	{
		NPC_RAMPAGING_FURBOLG	= 34620,
		NPC_FOULWEALD_WARRIOR	= 3743,
		NPC_FOULWEALD_TOTEMIC	= 3750,
	};

	struct npc_silverwind_defender_34621AI : public ScriptedAI
	{
		npc_silverwind_defender_34621AI(Creature* creature) : ScriptedAI(creature)
		{
			me->HandleEmoteCommand(EMOTE_STATE_READY1H);
		}

		void EnterCombat(Unit* who)
		{
			me->HandleEmoteCommand(EMOTE_STATE_READY1H);
			if (who->ToPlayer())
				me->ClearUnitState(UNIT_STATE_ROOT);
			if (me->GetDistance(who) >= 5.0f) // if distance is longer than 5yrds, disable root.
				me->ClearUnitState(UNIT_STATE_ROOT);
		}

		void Reset()
		{
			me->HandleEmoteCommand(EMOTE_STATE_READY1H);
		}


		void DamageDealt(Unit* target, uint32& damage, DamageEffectType /*damageType*/)
		{
			if (target->ToCreature())
				damage = 0;
		}

		void DamageTaken(Unit* pWho, uint32& uiDamage, SpellInfo const* /*p_SpellInfo*/)
		{
			if (Creature* npc = pWho->ToCreature())
			{
				if (npc->GetEntry() == NPC_RAMPAGING_FURBOLG)
					uiDamage = 0;
				if (npc->GetEntry() == NPC_FOULWEALD_WARRIOR)
					uiDamage = 0;
				if (npc->GetEntry() == NPC_FOULWEALD_TOTEMIC)
					uiDamage = 0;
			}


			if (pWho->GetTypeId() == TYPEID_PLAYER || pWho->isPet())
			{
				if (Creature* furbolg = me->FindNearestCreature(NPC_RAMPAGING_FURBOLG, 7.5f, true))
				{
					furbolg->getThreatManager().resetAllAggro();
					furbolg->CombatStop(true);
				}
				if (Creature* furbolg = me->FindNearestCreature(NPC_FOULWEALD_WARRIOR, 7.5f, true))
				{
					furbolg->getThreatManager().resetAllAggro();
					furbolg->CombatStop(true);
				}
				if (Creature* furbolg = me->FindNearestCreature(NPC_FOULWEALD_TOTEMIC, 7.5f, true))
				{
					furbolg->getThreatManager().resetAllAggro();
					furbolg->CombatStop(true);
				}
				
				me->ClearUnitState(UNIT_STATE_ROOT);
				me->getThreatManager().resetAllAggro();
				me->GetMotionMaster()->MoveChase(pWho);
				me->AI()->AttackStart(pWho);
			}
		}


		void UpdateAI(const uint32 diff)
		{
			if (!UpdateVictim())
			{
				if (Creature* rampaging = me->FindNearestCreature(NPC_RAMPAGING_FURBOLG, 7.5f, true))
				{
					me->AI()->AttackStart(rampaging);
					me->AddUnitState(UNIT_STATE_ROOT);
				}
				if (Creature* warrior = me->FindNearestCreature(NPC_FOULWEALD_WARRIOR, 7.5f, true))
				{
					me->AI()->AttackStart(warrior);
					me->AddUnitState(UNIT_STATE_ROOT);
				}
				if (Creature* totemic = me->FindNearestCreature(NPC_FOULWEALD_TOTEMIC, 7.5f, true))
				{
					me->AI()->AttackStart(totemic);
					me->AddUnitState(UNIT_STATE_ROOT);
				}

			}
				
					

			DoMeleeAttackIfReady();
		}
	};
	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_silverwind_defender_34621AI(creature);
	}
};


/// Silverwind Conqueror - 34592
class npc_silverwind_conqueror_34592 : public CreatureScript
{
public:
	npc_silverwind_conqueror_34592() : CreatureScript("npc_silverwind_conqueror_34592") { }

	enum eMisc
	{
		NPC_RAMPAGING_FURBOLG = 34620,
		NPC_FOULWEALD_WARRIOR = 3743,
		NPC_FOULWEALD_TOTEMIC = 3750,
	};

	struct npc_silverwind_conqueror_34592AI : public ScriptedAI
	{
		npc_silverwind_conqueror_34592AI(Creature* creature) : ScriptedAI(creature)
		{
			me->HandleEmoteCommand(EMOTE_STATE_READY1H);
		}

		void EnterCombat(Unit* who)
		{
			me->HandleEmoteCommand(EMOTE_STATE_READY1H);
			if (who->ToPlayer())
				me->ClearUnitState(UNIT_STATE_ROOT);
			if (me->GetDistance(who) >= 5.0f) // if distance is longer than 5yrds, disable root.
				me->ClearUnitState(UNIT_STATE_ROOT);
		}

		void Reset()
		{
			me->HandleEmoteCommand(EMOTE_STATE_READY1H);
		}


		void DamageDealt(Unit* target, uint32& damage, DamageEffectType /*damageType*/)
		{
			if (target->ToCreature())
				damage = 0;
		}

		void DamageTaken(Unit* pWho, uint32& uiDamage, SpellInfo const* /*p_SpellInfo*/)
		{
			if (Creature* npc = pWho->ToCreature())
			{
				if (npc->GetEntry() == NPC_RAMPAGING_FURBOLG)
					uiDamage = 0;
				if (npc->GetEntry() == NPC_FOULWEALD_WARRIOR)
					uiDamage = 0;
				if (npc->GetEntry() == NPC_FOULWEALD_TOTEMIC)
					uiDamage = 0;
			}


			if (pWho->GetTypeId() == TYPEID_PLAYER || pWho->isPet())
			{
				if (Creature* furbolg = me->FindNearestCreature(NPC_RAMPAGING_FURBOLG, 7.5f, true))
				{
					furbolg->getThreatManager().resetAllAggro();
					furbolg->CombatStop(true);
				}
				if (Creature* warrior = me->FindNearestCreature(NPC_FOULWEALD_WARRIOR, 7.5f, true))
				{
					warrior->getThreatManager().resetAllAggro();
					warrior->CombatStop(true);
				}
				if (Creature* totemic = me->FindNearestCreature(NPC_FOULWEALD_TOTEMIC, 7.5f, true))
				{
					totemic->getThreatManager().resetAllAggro();
					totemic->CombatStop(true);
				}

				me->ClearUnitState(UNIT_STATE_ROOT);
				me->getThreatManager().resetAllAggro();
				me->GetMotionMaster()->MoveChase(pWho);
				me->AI()->AttackStart(pWho);
			}
		}
	};
	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_silverwind_conqueror_34592AI(creature);
	}
};


/// Foulweald NPCs - 3743, 3750, 34620
class npc_foulweald_warrior_totemic_rampaging : public CreatureScript
{
public:
	npc_foulweald_warrior_totemic_rampaging() : CreatureScript("npc_foulweald_warrior_totemic_rampaging") { }

	enum eMisc
	{
		NPC_SILVERWIND_DEFENDER	= 34621,
		NPC_SILVERWIND_CONQUEROR = 34592,
	};

	struct npc_foulweald_warrior_totemic_rampagingAI : public ScriptedAI
	{
		npc_foulweald_warrior_totemic_rampagingAI(Creature* creature) : ScriptedAI(creature)
		{
			me->HandleEmoteCommand(EMOTE_STATE_READY1H);
		}

		void EnterCombat(Unit* who)
		{
			me->HandleEmoteCommand(EMOTE_STATE_READY1H);
			if (who->ToPlayer())
				me->ClearUnitState(UNIT_STATE_ROOT);
			if (me->GetDistance(who) >= 5.0f) // if distance is longer than 5yrds, disable root.
				me->ClearUnitState(UNIT_STATE_ROOT);
		}

		void Reset()
		{
			me->HandleEmoteCommand(EMOTE_STATE_READY1H);
		}


		void DamageDealt(Unit* target, uint32& damage, DamageEffectType /*damageType*/)
		{
			if (target->ToCreature())
				damage = 0;
		}

		void DamageTaken(Unit* pWho, uint32& uiDamage, SpellInfo const* /*p_SpellInfo*/)
		{
			if (Creature* npc = pWho->ToCreature())
			{
				if (npc->GetEntry() == NPC_SILVERWIND_DEFENDER)
					uiDamage = 0;
				if (npc->GetEntry() == NPC_SILVERWIND_CONQUEROR)
					uiDamage = 0;
			}


			if (pWho->GetTypeId() == TYPEID_PLAYER || pWho->isPet())
			{
				if (Creature* conqueror = me->FindNearestCreature(NPC_SILVERWIND_CONQUEROR, 7.5f, true))
				{
					conqueror->getThreatManager().resetAllAggro();
					conqueror->CombatStop(true);
				}
				if (Creature* defender = me->FindNearestCreature(NPC_SILVERWIND_DEFENDER, 7.5f, true))
				{
					defender->getThreatManager().resetAllAggro();
					defender->CombatStop(true);
				}

				me->ClearUnitState(UNIT_STATE_ROOT);
				me->getThreatManager().resetAllAggro();
				me->GetMotionMaster()->MoveChase(pWho);
				me->AI()->AttackStart(pWho);
			}
		}


		void UpdateAI(const uint32 diff)
		{
			if (!UpdateVictim())
			{
				if (Creature* conqueror = me->FindNearestCreature(NPC_SILVERWIND_CONQUEROR, 7.5f, true))
				{
					me->AI()->AttackStart(conqueror);
					me->AddUnitState(UNIT_STATE_ROOT);
				}
				if (Creature* defender = me->FindNearestCreature(NPC_SILVERWIND_DEFENDER, 7.5f, true))
				{
					me->AI()->AttackStart(defender);
					me->AddUnitState(UNIT_STATE_ROOT);
				}
			}
			DoMeleeAttackIfReady();
		}
	};
	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_foulweald_warrior_totemic_rampagingAI(creature);
	}
};





/// Naga Brazier - 202215, 202216, 202217
class go_naga_brazier : public GameObjectScript
{
    public:
        go_naga_brazier() : GameObjectScript("go_naga_brazier") { }

        bool OnGossipHello(Player* /*player*/, GameObject* go)
        {
            if (Creature* creature = GetClosestCreatureWithEntry(go, NPC_MUGLASH, INTERACTION_DISTANCE*2))
            {
                if (npc_muglash::npc_muglashAI* pEscortAI = CAST_AI(npc_muglash::npc_muglashAI, creature->AI()))
                {
                    DoScriptText(SAY_MUG_BRAZIER_WAIT, creature);

                    pEscortAI->IsBrazierExtinguished = true;
                    return false;
                }
            }

            return true;
        }
};

/// Karang's Banner Item ID - 16972, Spell ID - 20783
enum KingoftheFoulwealdMisc
{
	GO_BANNER = 178205
};

class spell_destroy_karangs_banner : public SpellScriptLoader
{
public:
	spell_destroy_karangs_banner() : SpellScriptLoader("spell_destroy_karangs_banner") { }

	class spell_destroy_karangs_banner_SpellScript : public SpellScript
	{
		PrepareSpellScript(spell_destroy_karangs_banner_SpellScript);

		void HandleAfterCast()
		{
			if (GameObject* banner = GetCaster()->FindNearestGameObject(GO_BANNER, GetSpellInfo()->GetMaxRange(true)))
				banner->Delete();
		}

		void Register() override
		{
			AfterCast += SpellCastFn(spell_destroy_karangs_banner_SpellScript::HandleAfterCast);
		}
	};

	SpellScript* GetSpellScript() const override
	{
		return new spell_destroy_karangs_banner_SpellScript();
	}
};


/// Potion of Wildfire Item ID - 44967, Looted from Object ID -	194202, Spell ID -	62506
class spell_potion_of_wildfire : public SpellScriptLoader
{
public:
	spell_potion_of_wildfire() : SpellScriptLoader("spell_potion_of_wildfire") { }

	class spell_potion_of_wildfire_SpellScript : public SpellScript
	{
		PrepareSpellScript(spell_potion_of_wildfire_SpellScript);

		void HandleOnHit()
		{
			Player* player = GetCaster()->ToPlayer();
			if (!player) return;

			if (player->GetQuestStatus(QUEST_OF_THEIR_OWN_DESIGN) == QUEST_STATUS_INCOMPLETE)
			{
				if (Creature* creature = player->FindNearestCreature(NPC_BATHRANS_CORPSE, 10.0f, true))
				{
					player->KilledMonsterCredit(NPC_BATHRANS_CORPSE);
				}
			}
		}

		void Register()
		{
			OnHit += SpellHitFn(spell_potion_of_wildfire_SpellScript::HandleOnHit);
		}


	};

	SpellScript* GetSpellScript() const
	{
		return new spell_potion_of_wildfire_SpellScript();
	}
};

/// Unbathed Concoction Item ID - 45065, Spell ID - 62981
class spell_unbathed_concoction : public SpellScriptLoader
{
public:
	spell_unbathed_concoction() : SpellScriptLoader("spell_unbathed_concoction") { }

	class spell_unbathed_concoction_SpellScript : public SpellScript
	{
		PrepareSpellScript(spell_unbathed_concoction_SpellScript);


		void Unload()
		{
			Player* player = GetCaster()->ToPlayer();
			if (!player) return;

			if (player->GetQuestStatus(QUEST_BATHED_IN_LIGHT) == QUEST_STATUS_INCOMPLETE)
			{
				if (GameObject* go = player->FindNearestGameObject(GO_LIGHT_OF_ELUNE_AT_LAKE_FALATHIM, 10.0f))
				{
					if (player->HasItemCount(ITEM_UNBATHED_CONCOCTION, 1))
					{
						player->DestroyItemCount(ITEM_UNBATHED_CONCOCTION, 1, true);
						player->AddItem(ITEM_BATHED_CONCOCTION, 1);
					}
				}
			}
		}


		void Register() {}

	};

	SpellScript* GetSpellScript() const
	{
		return new spell_unbathed_concoction_SpellScript();
	}
};




#ifndef __clang_analyzer__
void AddSC_ashenvale()
{
	// Npcs
    new npc_torek();
    new npc_ruul_snowhoof();
    new npc_muglash();
	new npc_bolyun_1();
	new npc_bolyun_2();
	new npc_big_baobob();
	new npc_astranaar_burning_fire_bunny();
	new npc_silverwind_defender_34621();
	new npc_silverwind_conqueror_34592();
	new npc_foulweald_warrior_totemic_rampaging();

	// Game objects
    new go_naga_brazier();

	// Spells
	new spell_destroy_karangs_banner();
	new spell_potion_of_wildfire();
	new spell_unbathed_concoction();

}
#endif
