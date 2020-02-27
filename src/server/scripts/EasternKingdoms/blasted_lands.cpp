////////////////////////////////////////////////////////////////////////////////
//
//  MILLENIUM-STUDIO
//  Copyright 2016 Millenium-studio SARL
//  All Rights Reserved.
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

/// Archmage Khadgar - 76643
class npc_archmage_khadgar_gossip : public CreatureScript
{
public:
	npc_archmage_khadgar_gossip() : CreatureScript("npc_archmage_khadgar_gossip") { }

	enum eGossips
	{
		BaseGossip = 76643
	};

	enum eActions
	{
		SelectGossip = 1001,
	};

	bool OnGossipHello(Player* p_Player, Creature* p_Creature)
	{
		p_Player->PrepareQuestMenu(p_Creature->GetGUID());

		if (p_Player->GetQuestStatus(34398) == QUEST_STATUS_INCOMPLETE)
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
				if (p_Player->GetQuestStatus(34398) != QUEST_STATUS_REWARDED)
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

	struct npc_archmage_khadgar_gossipAI : public ScriptedAI
	{
		npc_archmage_khadgar_gossipAI(Creature* p_Creature) : ScriptedAI(p_Creature) { }
	};

	CreatureAI* GetAI(Creature* p_Creature) const override
	{
		return new npc_archmage_khadgar_gossipAI(p_Creature);
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
                if (me->GetMapId() == 1190)
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

#ifndef __clang_analyzer__
void AddSC_blasted_lands()
{
	new npc_blasted_lands_zidormi();
	new npc_archmage_khadgar_gossip();
    new npc_world_invisible_trigger();
	new npc_deathly_usher();
}
#endif
