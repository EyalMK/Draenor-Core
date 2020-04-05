////////////////////////////////////////////////////////////////////////////////
//
// Project-Hellscream https://hellscream.org
// Copyright (C) 2018-2020 Project-Hellscream-6.2
// Discord https://discord.gg/CWCF3C9
//
////////////////////////////////////////////////////////////////////////////////

/* ScriptData
SDName: Blasted_Lands
SD%Complete: 90
SDComment: Quest support: 3628. Teleporter to Rise of the Defiler missing group support.
SDCategory: Blasted Lands
EndScriptData */

/* ContentData
npc_deathly_usher
EndContentData */

#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "ScriptedGossip.h"
#include "MapManager.h"
#include "../Draenor/TanaanIntro/tanaan_jungle.h"

// Zone 4
class zone_blasted_lands : public ZoneScript
{
public:
	zone_blasted_lands() : ZoneScript("zone_blasted_lands") {}

	enum eSpell
	{
		TimeTravelling = 176111
	};

	enum eMaps
	{
		NewBlastedLands = 1190,
		EasternKingdoms = 0
	};

	void OnPlayerEnterMap(Player* p_Player) override
	{
		if (p_Player->getLevel() < 90 && !p_Player->HasAura(eSpell::TimeTravelling))
		{
			p_Player->AddAura(eSpell::TimeTravelling, p_Player);
			p_Player->SeamlessTeleportToMap(eMaps::EasternKingdoms);
		}

		if (p_Player->getLevel() >= 90)
		{
			if (!p_Player->HasAura(eSpell::TimeTravelling))
			{
				p_Player->SeamlessTeleportToMap(eMaps::NewBlastedLands);
			}

			if (p_Player->HasAura(eSpell::TimeTravelling))
			{
				p_Player->SeamlessTeleportToMap(eMaps::EasternKingdoms);
			}
		}
	}

	void OnPlayerLeaveMap(Player* p_Player) override
	{
		if (p_Player->GetMapId() == eMaps::NewBlastedLands)
			p_Player->SeamlessTeleportToMap(eMaps::EasternKingdoms);
	}
};

/// Zidormi - 88206
class npc_blasted_lands_zidormi : public CreatureScript
{
public:
	npc_blasted_lands_zidormi() : CreatureScript("npc_blasted_lands_zidormi") { }

	enum eSpell
	{
		TimeTravelling = 176111
	};

	enum eGossips
	{
		TraveledGossip = 88207,
		BaseGossip = 88206
	};

	enum eMaps
	{
		NewBlastedLands = 1190,
		EasternKingdoms = 0
	};

	bool OnGossipHello(Player* p_Player, Creature* p_Creature) override
	{
		p_Player->PlayerTalkClass->ClearMenus();
		p_Player->TalkedToCreature(p_Creature->GetEntry(), p_Creature->GetGUID());
		p_Player->PrepareGossipMenu(p_Creature, p_Player->HasAura(eSpell::TimeTravelling) ? eGossips::TraveledGossip : eGossips::BaseGossip, true);
		p_Player->SendPreparedGossip(p_Creature);
		return true;
	}

	struct npc_blasted_lands_zidormiAI : public ScriptedAI
	{
		npc_blasted_lands_zidormiAI(Creature* p_Creature) : ScriptedAI(p_Creature) { }

		void sGossipSelect(Player* p_Player, uint32 /*p_Sender*/, uint32 /*p_Action*/) override
		{
			if (p_Player->HasAura(eSpell::TimeTravelling))
			{
				p_Player->RemoveAura(eSpell::TimeTravelling);
				p_Player->CastSpell(p_Player, 129809, true); // Fade black

				p_Player->SeamlessTeleportToMap(eMaps::NewBlastedLands);
			}
			else
			{
				p_Player->CastSpell(p_Player, eSpell::TimeTravelling, true);

				p_Player->SeamlessTeleportToMap(eMaps::EasternKingdoms);
			}

			p_Player->PlayerTalkClass->SendCloseGossip();
		}
	};

	CreatureAI* GetAI(Creature* p_Creature) const override
	{
		return new npc_blasted_lands_zidormiAI(p_Creature);
	}
};

/// Archmage Khadgar - 78423
class npc_archmage_khadgar_darkportal : public CreatureScript
{
public:
	npc_archmage_khadgar_darkportal() : CreatureScript("npc_archmage_khadgar_darkportal") { }

	enum eGossips
	{
		BaseGossip = 78423
	};

	enum eActions
	{
		SelectGossip = 1001,
	};

	bool OnGossipHello(Player* p_Player, Creature* p_Creature)
	{
		p_Player->PrepareQuestMenu(p_Creature->GetGUID());

		if (p_Player->GetQuestStatus(34398) == QUEST_STATUS_INCOMPLETE || p_Player->GetQuestStatus(36881) == QUEST_STATUS_INCOMPLETE)
		{
			p_Player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "FOR AZEROTH!", GOSSIP_SENDER_MAIN, eActions::SelectGossip);
		}

		p_Player->SEND_GOSSIP_MENU(eGossips::BaseGossip, p_Creature->GetGUID());
		return true;
	}

	bool OnGossipSelect(Player* p_Player, Creature* p_Creature, uint32 /*p_Sender*/, uint32 p_Action) override
	{
		switch (p_Action)
		{
			case eActions::SelectGossip: // FOR AZEROTH!
			{
				if (p_Player->GetQuestStatus(34398) != QUEST_STATUS_REWARDED || p_Player->GetQuestStatus(36881) != QUEST_STATUS_REWARDED)
				{
					p_Player->AddMovieDelayedTeleport(199, 1265, 4066.7370f, -2381.9917f, 94.858f, 2.90f);
					p_Player->SendMovieStart(TanaanMovies::MovieEnterPortal);
					p_Player->KilledMonsterCredit(78419);
				}
			break;
			}
		default:
			break;
		}

		p_Player->PlayerTalkClass->ClearMenus();
		p_Player->PlayerTalkClass->SendCloseGossip();
		return true;
	}

	struct npc_archmage_khadgar_darkportalAI : public ScriptedAI
	{
		npc_archmage_khadgar_darkportalAI(Creature* p_Creature) : ScriptedAI(p_Creature) { }
	};

	CreatureAI* GetAI(Creature* p_Creature) const override
	{
		return new npc_archmage_khadgar_darkportalAI(p_Creature);
	}
};

/*######
## npc_deathly_usher
######*/

#define GOSSIP_ITEM_USHER "I would like to visit the Rise of the Defiler."

#define SPELL_TELEPORT_SINGLE           12885
#define SPELL_TELEPORT_SINGLE_IN_GROUP  13142
#define SPELL_TELEPORT_GROUP            27686

#define QUEST_START_DRAENOR             36881

class npc_deathly_usher : public CreatureScript
{
public:
    npc_deathly_usher() : CreatureScript("npc_deathly_usher") { }

    bool OnGossipSelect(Player* player, Creature* creature, uint32 /*sender*/, uint32 action)
    {
        player->PlayerTalkClass->ClearMenus();
        if (action == GOSSIP_ACTION_INFO_DEF)
        {
            player->CLOSE_GOSSIP_MENU();
            creature->CastSpell(player, SPELL_TELEPORT_SINGLE, true);
        }

        return true;
    }

    bool OnGossipHello(Player* player, Creature* creature)
    {
        if (player->GetQuestStatus(3628) == QUEST_STATUS_INCOMPLETE && player->HasItemCount(10757))
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ITEM_USHER, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF);

        player->SEND_GOSSIP_MENU(player->GetGossipTextId(creature), creature->GetGUID());

        return true;
    }
};

/// OLDWorld Trigger (DO NOT DELETE) - 15384
class npc_world_invisible_trigger : public CreatureScript
{
    public:
        npc_world_invisible_trigger() : CreatureScript("npc_world_invisible_trigger") { }

        struct npc_world_invisible_triggerAI : public ScriptedAI
        {
            npc_world_invisible_triggerAI(Creature* p_Creature) : ScriptedAI(p_Creature) { }

            uint32 m_CheckPlayerTimer;

            void Reset()
            {
                if (me->GetMapId() == 1190) // new blasted lands map id
                    m_CheckPlayerTimer = 1000;
                else
                    m_CheckPlayerTimer = 0;
            }

            void UpdateAI(uint32 const p_Diff)
            {
                if (m_CheckPlayerTimer)
                {
                    if (m_CheckPlayerTimer <= p_Diff)
                    {
                        m_CheckPlayerTimer = 1000;

                        std::list<Player*> l_PlayerList;
                        me->GetPlayerListInGrid(l_PlayerList, 15.0f);

                        for (Player* l_Player : l_PlayerList)
                        {
                            if (l_Player->getLevel() < 90 || l_Player->isGameMaster())
                                continue;

                            /// If Quest suit isn't done, tp to tanaan. If done, tp to faction respective Staging Area.
                            if (l_Player->GetQuestStatus(34446) != QUEST_STATUS_REWARDED)
                                l_Player->TeleportTo(1265, 4066.7370f, -2381.9917f, 94.858f, 2.90f);
                            else
                            {
                                switch (l_Player->GetTeamId())
                                {
                                    case TEAM_ALLIANCE:
                                        l_Player->TeleportTo(1116, 3779.889f, -3888.14063f, 31.6778469f, 2.65f);
                                        break;
                                    case TEAM_HORDE:
                                        l_Player->TeleportTo(1116, 5200.19f, -3910.11f, 1.30844f, 0.588f);
                                        break;
                                    default:
                                        break;
                                }
                            }
                        }
                    }
                    else
                        m_CheckPlayerTimer -= p_Diff;
                }
            }
        };

        CreatureAI* GetAI(Creature* p_Creature) const
        {
            return new npc_world_invisible_triggerAI(p_Creature);
        }
};

/// Vindicator Maraad - 82270
class npc_vindicator_maraad_beachphase : public CreatureScript
{
public:
	npc_vindicator_maraad_beachphase() : CreatureScript("npc_vindicator_maraad_beachphase") { }

	enum eQuests
	{
		Quest_AttackoftheIronHorde		= 35460,
		Quest_UnderSiege				= 35462,
		Quest_SubversiveScouts			= 35463,
		Quest_InvestigatingtheInvasion	= 36307
	};

	enum eCreatureTexts
	{
		CREATURE_TEXT_ATTACKIRONHORDE_START	 = 0,
		CREATURE_TEXT_SUBVERSIVESCOUT_START	 = 1,
		CREATURE_TEXT_SUBVERSIVESCOUT_END	 = 2,
		CREATURE_TEXT_UNDERSIEGE_START		 = 3,
		CREATURE_TEXT_UNDERSIEGE_END		 = 4,
	};


	bool OnQuestAccept(Player* p_Player, Creature* p_Creature, const Quest* p_Quest)
	{

		if (p_Quest->GetQuestId() == eQuests::Quest_AttackoftheIronHorde)
			p_Creature->AI()->Talk(eCreatureTexts::CREATURE_TEXT_ATTACKIRONHORDE_START);

		if (p_Quest->GetQuestId() == eQuests::Quest_SubversiveScouts)
			p_Creature->AI()->Talk(eCreatureTexts::CREATURE_TEXT_SUBVERSIVESCOUT_START);

		if (p_Quest->GetQuestId() == eQuests::Quest_UnderSiege)
			p_Creature->AI()->Talk(eCreatureTexts::CREATURE_TEXT_UNDERSIEGE_START);
		
		return false;
	}

	bool OnQuestComplete(Player* p_Player, Creature* p_Creature, const Quest* p_Quest) override
	{
		
		if (p_Quest->GetQuestId() == eQuests::Quest_SubversiveScouts)
			p_Creature->AI()->Talk(eCreatureTexts::CREATURE_TEXT_SUBVERSIVESCOUT_END);

		if (p_Quest->GetQuestId() == eQuests::Quest_UnderSiege)
			p_Creature->AI()->Talk(eCreatureTexts::CREATURE_TEXT_UNDERSIEGE_END);

		return false;

	}

	struct npc_vindicator_maraad_beachphaseAI : public ScriptedAI
	{
		npc_vindicator_maraad_beachphaseAI(Creature* p_Creature) : ScriptedAI(p_Creature) { }

	};

	CreatureAI* GetAI(Creature* p_Creature) const override
	{
		return new npc_vindicator_maraad_beachphaseAI(p_Creature);
	}
};


/// Bodrick Grey - 85213
class npc_bodrick_grey_beachphase : public CreatureScript
{
public:
	npc_bodrick_grey_beachphase() : CreatureScript("npc_bodrick_grey_beachphase") { }

	enum eQuests
	{
		Quest_PeekingIntoThePortal	 = 36379,
		Quest_EndingExecutions		 = 35464
	};

	enum eCreatureTexts
	{
		CREATURE_TEXT_PEEKINGPORTAL_START	 = 0,
		CREATURE_TEXT_PEEKINGPORTAL_END		 = 1,
		CREATURE_TEXT_ENDINGEXECUTIONS_START = 2,
		CREATURE_TEXT_ENDINGEXECUTIONS_END	 = 3
	};


	bool OnQuestAccept(Player* p_Player, Creature* p_Creature, const Quest* p_Quest)
	{
		if (p_Quest->GetQuestId() == eQuests::Quest_PeekingIntoThePortal)
			p_Creature->AI()->Talk(eCreatureTexts::CREATURE_TEXT_PEEKINGPORTAL_START);


		if (p_Quest->GetQuestId() == eQuests::Quest_EndingExecutions)
			p_Creature->AI()->Talk(eCreatureTexts::CREATURE_TEXT_ENDINGEXECUTIONS_START);

		return false;
	}

	bool OnQuestComplete(Player* p_Player, Creature* p_Creature, const Quest* p_Quest) override
	{

		if (p_Quest->GetQuestId() == eQuests::Quest_PeekingIntoThePortal)
			p_Creature->AI()->Talk(eCreatureTexts::CREATURE_TEXT_PEEKINGPORTAL_END);

		if (p_Quest->GetQuestId() == eQuests::Quest_EndingExecutions)
			p_Creature->AI()->Talk(eCreatureTexts::CREATURE_TEXT_ENDINGEXECUTIONS_END);

		return false;

	}

	struct npc_bodrick_grey_beachphaseAI : public ScriptedAI
	{
		npc_bodrick_grey_beachphaseAI(Creature* p_Creature) : ScriptedAI(p_Creature) { }

	};

	CreatureAI* GetAI(Creature* p_Creature) const override
	{
		return new npc_bodrick_grey_beachphaseAI(p_Creature);
	}
};

/// Ironmarch Scout - 76886
class npc_ironmarch_scout : public CreatureScript
{
public:
	npc_ironmarch_scout() : CreatureScript("npc_ironmarch_scout") { }

	enum eData
	{
		spellStealth = 86603
	};

	struct npc_ironmarch_scoutAI : public ScriptedAI
	{
		npc_ironmarch_scoutAI(Creature* p_Creature) : ScriptedAI(p_Creature) { }

		void EnterCombat(Unit* /*who*/)
		{
			me->RemoveAura(spellStealth, me->GetGUID());
		}
		
		// Rest of functions are made in SmartAI in the DB

	};

	CreatureAI* GetAI(Creature* p_Creature) const override
	{
		return new npc_ironmarch_scoutAI(p_Creature);
	}
};


/// Ironmarch Executioner - 82774
class npc_ironmarch_executioner : public CreatureScript
{
public:
	npc_ironmarch_executioner() : CreatureScript("npc_ironmarch_executioner") { }

	enum eAction
	{
		actionSaved	 = 0
	};

	enum eData
	{
		NPC_NETHERGARDE_PRISONER  = 82504
	};

	struct npc_ironmarch_executionerAI : public ScriptedAI
	{
		npc_ironmarch_executionerAI(Creature* p_Creature) : ScriptedAI(p_Creature) { }

		void OnDeath(Creature* p_Creature)
		{
			if (p_Creature->isDead() == true)
			{
				if (Creature* prisoner = p_Creature->FindNearestCreature(eData::NPC_NETHERGARDE_PRISONER, 5.0f, true))
				{
					prisoner->GetAI()->DoAction(eAction::actionSaved);
				}

			}
		}
				
	};


	CreatureAI* GetAI(Creature* p_Creature) const override
	{
		return new npc_ironmarch_executionerAI(p_Creature);
	}
};

/// Nethergarde Prisoner - 82504
class npc_nethergarde_prisoner : public CreatureScript
{
public:
	npc_nethergarde_prisoner() : CreatureScript("npc_nethergarde_prisoner") { }

	enum eAction
	{
		actionSaved = 0
	};

	enum eData
	{
		NPC_IRONMARCH_EXECUTIONER = 82774
	};

	struct npc_nethergarde_prisonerAI : public ScriptedAI
	{
		npc_nethergarde_prisonerAI(Creature* p_Creature) : ScriptedAI(p_Creature) { }

		void Reset() {
			me->CastSpell(me, 153964); // Kneel aura
		}


		void DoAction(int32 const p_Action) override
		{
			switch (p_Action)
			{
			case eAction::actionSaved:
			{
				AddTimedDelayedOperation(0 * TimeConstants::IN_MILLISECONDS, [this]() -> void
				{
					Talk(urand(0, 2));
					me->RemoveAura(153964);
				});


				AddTimedDelayedOperation(0.2 * TimeConstants::IN_MILLISECONDS, [this]() -> void
				{
					me->GetMotionMaster()->MoveRandom(20.0f);
				});

				AddTimedDelayedOperation(4 * TimeConstants::IN_MILLISECONDS, [this]() -> void
				{
					me->DespawnOrUnsummon();
				});

				break;
			}
			default:
				break;
			}
		}

	};

	CreatureAI* GetAI(Creature* p_Creature) const override
	{
		return new npc_nethergarde_prisonerAI(p_Creature);
	}
};

/// Nethergarde Defender - 41158
class npc_nethergarde_defender : public CreatureScript
{
public:
	npc_nethergarde_defender() : CreatureScript("npc_nethergarde_defender") { }

	enum eData
	{
		NewBlastedLandsMapId = 1190
	};

	struct npc_nethergarde_defenderAI : public ScriptedAI
	{
		npc_nethergarde_defenderAI(Creature* p_Creature) : ScriptedAI(p_Creature) { }

		
		void Reset(Creature* p_Creature)
		{
			
			if (me->GetMapId() == eData::NewBlastedLandsMapId)
			{
				me->SetByteFlag(UNIT_FIELD_ANIM_TIER, 0, UNIT_STAND_STATE_DEAD);
				me->SetHealth(me->CountPctFromMaxHealth(0));
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_NPC);
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PC);
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_UNK_15);
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_UNK_29);
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_UNK_16);
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
			}
			else {
				// empty
			}
		}
	};

	CreatureAI* GetAI(Creature* p_Creature) const override
	{
		return new npc_nethergarde_defenderAI(p_Creature);
	}
};




#ifndef __clang_analyzer__
void AddSC_blasted_lands()
{
	new npc_blasted_lands_zidormi();
	new npc_archmage_khadgar_darkportal();
    new npc_world_invisible_trigger();
	new npc_deathly_usher();
	new npc_vindicator_maraad_beachphase();
	new npc_bodrick_grey_beachphase();
	new npc_ironmarch_scout();
	new npc_ironmarch_executioner();
	new npc_nethergarde_prisoner();
	new npc_nethergarde_defender();
}
#endif
