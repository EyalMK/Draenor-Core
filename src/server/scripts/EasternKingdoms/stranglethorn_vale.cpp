////////////////////////////////////////////////////////////////////////////////
//
// Project-Hellscream https://hellscream.org
// Copyright (C) 2018-2020 Project-Hellscream-6.2
// Discord https://discord.gg/CWCF3C9
//
////////////////////////////////////////////////////////////////////////////////


#include "ScriptMgr.h"
#include "Player.h"
#include "ScriptedCreature.h"
#include "SpellInfo.h"
#include "ScriptMgr.h"
#include "ScriptedEscortAI.h"
#include "ScriptedGossip.h"

/*######
## mob_yenniku
######*/

class mob_yenniku : public CreatureScript
{
public:
    mob_yenniku() : CreatureScript("mob_yenniku") { }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new mob_yennikuAI (creature);
    }

    struct mob_yennikuAI : public ScriptedAI
    {
        mob_yennikuAI(Creature* creature) : ScriptedAI(creature)
        {
            bReset = false;
        }

        uint32 Reset_Timer;
        bool bReset;

        void Reset()
        {
            Reset_Timer = 0;
            me->SetUInt32Value(UNIT_FIELD_EMOTE_STATE, EMOTE_STATE_NONE);
        }

        void SpellHit(Unit* caster, const SpellInfo* spell)
        {
            if (caster->IsPlayer())
            {
                                                                //Yenniku's Release
                if (!bReset && CAST_PLR(caster)->GetQuestStatus(592) == QUEST_STATUS_INCOMPLETE && spell->Id == 3607)
                {
                    me->SetUInt32Value(UNIT_FIELD_EMOTE_STATE, EMOTE_STATE_STUN);
                    me->CombatStop();                   //stop combat
                    me->DeleteThreatList();             //unsure of this
                    me->setFaction(83);                 //horde generic

                    bReset = true;
                    Reset_Timer = 60000;
                }
            }
            return;
        }

        void EnterCombat(Unit* /*who*/) {}

        void UpdateAI(const uint32 diff)
        {
            if (bReset)
            {
                if (Reset_Timer <= diff)
                {
                    EnterEvadeMode();
                    bReset = false;
                    me->setFaction(28);                     //troll, bloodscalp
                    return;
                }
                else Reset_Timer -= diff;

                if (me->isInCombat() && me->getVictim())
                {
                    if (me->getVictim()->IsPlayer())
                    {
                        Unit* victim = me->getVictim();
                        if (CAST_PLR(victim)->GetTeam() == HORDE)
                        {
                            me->CombatStop();
                            me->DeleteThreatList();
                        }
                    }
                }
             }

            //Return since we have no target
            if (!UpdateVictim())
                return;

            DoMeleeAttackIfReady();
        }
    };
};

#define QUEST_TAUREN_PIRATE     26630
#define GOSSIP_CHOICE_1 "Bossy, I need to ask something great of you. I need to cut off your head to prove my loyalty to the Bloodsail Buccaneers, so they will allow me to infiltrate their ranks and hopefully discover their true intentions. Booty Bay needs you, Bossy... now more than ever."
#define GOSSIP_CHOICE_2 "Moo."
#define GOSSIP_CHOICE_3 "<Do the deed.>"
#define GOSSIP_CHOICE_4 "<Chicken out.>"

class mob_bossy : public CreatureScript
{
public:
    mob_bossy() : CreatureScript("mob_bossy") { }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new mob_bossyAI (creature);
    }

    bool OnGossipHello(Player* player, Creature* creature)
        {
            if (player->GetQuestStatus(QUEST_TAUREN_PIRATE) == QUEST_STATUS_INCOMPLETE)
            {
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_CHOICE_1, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_CHOICE_2, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 2);
                player->SEND_GOSSIP_MENU(2, creature->GetGUID());
            }

            return true;
        }

    bool OnGossipSelect(Player* player, Creature* creature, uint32 /*sender*/, uint32 action)
    {
        player->PlayerTalkClass->ClearMenus();

        switch (action)
        {
            case GOSSIP_ACTION_INFO_DEF + 1:
                if (player->GetQuestStatus(QUEST_TAUREN_PIRATE) == QUEST_STATUS_INCOMPLETE)
                {
                    player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_CHOICE_3, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 3);
                    player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_CHOICE_4, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 4);
                    player->SEND_GOSSIP_MENU(2, creature->GetGUID());
                }
                break;
            case GOSSIP_ACTION_INFO_DEF +3:
                player->CLOSE_GOSSIP_MENU();
                if (player->GetQuestStatus(QUEST_TAUREN_PIRATE) == QUEST_STATUS_INCOMPLETE)
                {
                    creature->CastSpell(player, 81311, true);
                }
                break;
            default:
                player->CLOSE_GOSSIP_MENU();
                break;
        }

        return true;
    }

    struct mob_bossyAI : public ScriptedAI
    {
        mob_bossyAI(Creature* creature) : ScriptedAI(creature)
        {
        }

        void Reset()
        {
        }

        void UpdateAI(const uint32 /*p_Diff*/)
        {
        }
    };
};

#define GOSSIP_CHOICE_5 "I need an extra-large pirate hat. Seahorn's orders."

class mob_narkk : public CreatureScript
{
public:
    mob_narkk() : CreatureScript("mob_narkk") { }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new mob_narkkAI (creature);
    }

    bool OnGossipHello(Player* player, Creature* creature)
        {
            if (player->GetQuestStatus(QUEST_TAUREN_PIRATE) == QUEST_STATUS_INCOMPLETE)
            {
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_CHOICE_5, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
                player->SEND_GOSSIP_MENU(2, creature->GetGUID());
            }
            return true;
        }

    bool OnGossipSelect(Player* player, Creature* creature, uint32 /*sender*/, uint32 action)
    {
        player->PlayerTalkClass->ClearMenus();

        switch (action)
        {
            case GOSSIP_ACTION_INFO_DEF + 1:
                if (player->GetQuestStatus(QUEST_TAUREN_PIRATE) == QUEST_STATUS_INCOMPLETE)
                {
                    creature->CastSpell(player, 81315, true);
                }
                break;
            default:
                player->CLOSE_GOSSIP_MENU();
                break;
        }

        return true;
    }

    struct mob_narkkAI : public ScriptedAI
    {
        mob_narkkAI(Creature* creature) : ScriptedAI(creature)
        {
        }

        void Reset()
        {
        }

        void UpdateAI(const uint32 /*p_Diff*/)
        {
        }
    };
};

#define GOSSIP_CHOICE_6 "Do you have the items I asked you?"

class mob_fleet_master_seahorn : public CreatureScript
{
public:
    mob_fleet_master_seahorn() : CreatureScript("mob_fleet_master_seahorn") { }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new mob_fleet_master_seahornAI (creature);
    }

    bool OnGossipSelect(Player* player, Creature* /*creature*/, uint32 /*sender*/, uint32 action)
    {
        player->PlayerTalkClass->ClearMenus();

        switch (action)
        {
            case 1:
                if (player->HasItemCount(59148, 1) && player->HasItemCount(59147, 1))
                {
                    if (player->GetQuestStatus(QUEST_TAUREN_PIRATE) == QUEST_STATUS_INCOMPLETE)
                    {
                        player->KilledMonsterCredit(2487, 0);
                    }
                }
                break;
            default:
                player->CLOSE_GOSSIP_MENU();
                break;
        }

        return true;
    }

    struct mob_fleet_master_seahornAI : public ScriptedAI
    {
        mob_fleet_master_seahornAI(Creature* creature) : ScriptedAI(creature)
        {
        }

        void Reset()
        {
        }

        void UpdateAI(const uint32 /*p_Diff*/)
        {
        }
    };
};

class npc_osborn_obnoticus : public CreatureScript
{
public:
	npc_osborn_obnoticus() : CreatureScript("npc_osborn_obnoticus") { }

	enum Data
	{
		QUEST_A_PHYSICAL_SPECIMEN = 26747,
		NPC_BLOODLORD_MANDOKIR = 42790
	};

	bool OnQuestReward(Player* player, Creature* /*creature*/, Quest const* quest, uint32 /*opt*/) override
	{
		switch (quest->GetQuestId())
		{
		case QUEST_A_PHYSICAL_SPECIMEN:
			player->SummonCreature(NPC_BLOODLORD_MANDOKIR, -11306.80f, -194.917f, 75.3878f, 2.92012f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 90000, true);
			break;
		default:
			break;
		}

		return true;
	}
};

class npc_bloodlord_mandokir : public CreatureScript
{
public:
	npc_bloodlord_mandokir() : CreatureScript("npc_bloodlord_mandokir") { }

	enum Data
	{
		QUEST_BLOODLORD_MANDOKIR = 26748
	};

	bool OnQuestReward(Player* /*player*/, Creature* creature, Quest const* quest, uint32 /*opt*/) override
	{
		switch (quest->GetQuestId())
		{
		case QUEST_BLOODLORD_MANDOKIR:
			creature->DespawnOrUnsummon();
			break;
		default:
			break;
		}

		return true;
	}
};



enum AltarNaias
{
	NPC_NAIAS = 17207
};

class spell_summon_naias : public SpellScript
{
	PrepareSpellScript(spell_summon_naias);

	void HandleSendEvent(SpellEffIndex /*effIndex*/)
	{
		if (GetCaster()->IsPlayer())
			GetCaster()->SummonCreature(NPC_NAIAS, -12130.5000, 958.9940, 4.87148, 5.02655);
	}

	void Register() override
	{
		OnEffectHit += SpellEffectFn(spell_summon_naias::HandleSendEvent, EFFECT_0, SPELL_EFFECT_SEND_EVENT);
	}
};


#ifndef __clang_analyzer__
void AddSC_stranglethorn_vale()
{
    new mob_yenniku();
    new mob_bossy();
    new mob_narkk();
    new mob_fleet_master_seahorn();
	new npc_osborn_obnoticus();
	new npc_bloodlord_mandokir();

	new spell_summon_naias();

}
#endif
