////////////////////////////////////////////////////////////////////////////////
//
// Project-Hellscream https://hellscream.org
// Copyright (C) 2018-2020 Project-Hellscream-6.2
// Discord https://discord.gg/CWCF3C9
//
////////////////////////////////////////////////////////////////////////////////

/* ScriptData
SDName: Npc_Innkeeper
SDAuthor: Teleqraph
SD%Complete: 95%
SDComment: There are a few missing locales, plus I'm unsure about the Korean and Chinese translations.
SDCategory: NPCs
EndScriptData */

#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "ScriptedGossip.h"
#include "GameEventMgr.h"

#define HALLOWEEN_EVENTID       12
#define SPELL_TRICK_OR_TREATED  24755
#define SPELL_TREAT             24715

#define LOCALE_TRICK_OR_TREAT_0 "Trick or Treat!"
#define LOCALE_TRICK_OR_TREAT_1 "트릭이나치료。"
#define LOCALE_TRICK_OR_TREAT_2 "Des bonbons ou des blagues!"
#define LOCALE_TRICK_OR_TREAT_3 "Süßes oder Saures!"
#define LOCALE_TRICK_OR_TREAT_4 "不给糖就捣蛋。"
#define LOCALE_TRICK_OR_TREAT_5 "不给糖就捣蛋。"
#define LOCALE_TRICK_OR_TREAT_6 "¡Truco o trato!"
#define LOCALE_TRICK_OR_TREAT_7 "¡Truco o trato!"
#define LOCALE_TRICK_OR_TREAT_8 "Kошелек или жизнь."
#define LOCALE_TRICK_OR_TREAT_9 "Doces ou travessuras."
#define LOCALE_TRICK_OR_TREAT_10 "Dolcetto o scherzetto."

#define LOCALE_INNKEEPER_0 "Make this inn your home."
#define LOCALE_INNKEEPER_1 "Make this inn your home."
#define LOCALE_INNKEEPER_2 "Faítes de cette auberge votre foyer."
#define LOCALE_INNKEEPER_3 "Ich möchte dieses Gasthaus zu meinem Heimatort machen."
#define LOCALE_INNKEEPER_4 "Make this inn your home."
#define LOCALE_INNKEEPER_5 "Make this inn your home."
#define LOCALE_INNKEEPER_6 "Fija tu hogar en esta taberna."
#define LOCALE_INNKEEPER_7 "Fija tu hogar en esta taberna."
#define LOCALE_INNKEEPER_8 "Make this inn your home."
#define LOCALE_INNKEEPER_9 "Faça desta estalagem seu lar."
#define LOCALE_INNKEEPER_10 "Rendi questo luogo la mia dimora."

class npc_innkeeper : public CreatureScript
{
public:
    npc_innkeeper() : CreatureScript("npc_innkeeper") { }

    bool OnGossipHello(Player* player, Creature* creature)
    {
        if (IsEventActive(HALLOWEEN_EVENTID) && !player->HasAura(SPELL_TRICK_OR_TREATED))
        {
            const char* localizedEntry;
            switch (player->GetSession()->GetSessionDbcLocale())
            {
				case LOCALE_enUS: 
					localizedEntry = LOCALE_TRICK_OR_TREAT_0; 
					break;
				case LOCALE_koKR:
					localizedEntry = LOCALE_TRICK_OR_TREAT_1;
					break;
                case LOCALE_frFR: 
					localizedEntry = LOCALE_TRICK_OR_TREAT_2; 
					break;
                case LOCALE_deDE: 
					localizedEntry = LOCALE_TRICK_OR_TREAT_3; 
					break;
				case LOCALE_zhCN:
					localizedEntry = LOCALE_TRICK_OR_TREAT_4;
					break;
				case LOCALE_zhTW:
					localizedEntry = LOCALE_TRICK_OR_TREAT_5;
					break;
                case LOCALE_esES: 
					localizedEntry = LOCALE_TRICK_OR_TREAT_6; 
					break;
				case LOCALE_esMX:
					localizedEntry = LOCALE_TRICK_OR_TREAT_7;
					break;
				case LOCALE_ruRU:
					localizedEntry = LOCALE_TRICK_OR_TREAT_8;
					break;
				case LOCALE_ptPT:
					localizedEntry = LOCALE_TRICK_OR_TREAT_9;
					break;
				case LOCALE_itIT:
					localizedEntry = LOCALE_TRICK_OR_TREAT_10;
					break;
				default: 
					localizedEntry = LOCALE_TRICK_OR_TREAT_0; 
					break;
            }
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, localizedEntry, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+HALLOWEEN_EVENTID);
        }

        if (creature->isQuestGiver())
            player->PrepareQuestMenu(creature->GetGUID());

        if (creature->isVendor())
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_VENDOR, GOSSIP_TEXT_BROWSE_GOODS, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_TRADE);

        if (creature->isInnkeeper())
        {
            const char* localizedEntry;
            switch (player->GetSession()->GetSessionDbcLocale())
            {
			case LOCALE_enUS:
				localizedEntry = LOCALE_INNKEEPER_0;
				break;
			case LOCALE_koKR:
				localizedEntry = LOCALE_INNKEEPER_1;
				break;
			case LOCALE_frFR:
				localizedEntry = LOCALE_INNKEEPER_2;
				break;
			case LOCALE_deDE:
				localizedEntry = LOCALE_INNKEEPER_3;
				break;
			case LOCALE_zhCN:
				localizedEntry = LOCALE_INNKEEPER_4;
				break;
			case LOCALE_zhTW:
				localizedEntry = LOCALE_INNKEEPER_5;
				break;
			case LOCALE_esES:
				localizedEntry = LOCALE_INNKEEPER_6;
				break;
			case LOCALE_esMX:
				localizedEntry = LOCALE_INNKEEPER_7;
				break;
			case LOCALE_ruRU:
				localizedEntry = LOCALE_INNKEEPER_8;
				break;
			case LOCALE_ptPT:
				localizedEntry = LOCALE_INNKEEPER_9;
				break;
			case LOCALE_itIT:
				localizedEntry = LOCALE_INNKEEPER_10;
				break;
			default:
				localizedEntry = LOCALE_INNKEEPER_0;
				break;
            }
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_INTERACT_1, localizedEntry, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INN);
        }

        player->TalkedToCreature(creature->GetEntry(), creature->GetGUID());
        player->SEND_GOSSIP_MENU(player->GetGossipTextId(creature), creature->GetGUID());
        return true;
    }

    bool OnGossipSelect(Player* player, Creature* creature, uint32 /*sender*/, uint32 action)
    {
        player->PlayerTalkClass->ClearMenus();
        if (action == GOSSIP_ACTION_INFO_DEF+HALLOWEEN_EVENTID && IsEventActive(HALLOWEEN_EVENTID) && !player->HasAura(SPELL_TRICK_OR_TREATED))
        {
            player->CastSpell(player, SPELL_TRICK_OR_TREATED, true);

            if (urand(0, 1))
                player->CastSpell(player, SPELL_TREAT, true);
            else
            {
                uint32 trickspell = 0;
                switch (urand(0, 13))
                {
                    case 0: trickspell = 24753; break; // cannot cast, random 30sec
                    case 1: trickspell = 24713; break; // lepper gnome costume
                    case 2: trickspell = 24735; break; // male ghost costume
                    case 3: trickspell = 24736; break; // female ghostcostume
                    case 4: trickspell = 24710; break; // male ninja costume
                    case 5: trickspell = 24711; break; // female ninja costume
                    case 6: trickspell = 24708; break; // male pirate costume
                    case 7: trickspell = 24709; break; // female pirate costume
                    case 8: trickspell = 24723; break; // skeleton costume
                    case 9: trickspell = 24753; break; // Trick
                    case 10: trickspell = 24924; break; // Hallow's End Candy
                    case 11: trickspell = 24925; break; // Hallow's End Candy
                    case 12: trickspell = 24926; break; // Hallow's End Candy
                    case 13: trickspell = 24927; break; // Hallow's End Candy
                }
                player->CastSpell(player, trickspell, true);
            }
            player->CLOSE_GOSSIP_MENU();
            return true;
        }

        player->CLOSE_GOSSIP_MENU();

        switch (action)
        {
            case GOSSIP_ACTION_TRADE: player->GetSession()->SendListInventory(creature->GetGUID()); break;
            case GOSSIP_ACTION_INN: player->SetBindPoint(creature->GetGUID()); break;
        }
        return true;
    }
};

#ifndef __clang_analyzer__
void AddSC_npc_innkeeper()
{
    new npc_innkeeper;
}
#endif
