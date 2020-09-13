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

/*######
## npcs_dithers_and_arbington
######*/

#define GOSSIP_HDA1 "What does the Felstone Field Cauldron need?"
#define GOSSIP_HDA2 "What does the Dalson's Tears Cauldron need?"
#define GOSSIP_HDA3 "What does the Writhing Haunt Cauldron need?"
#define GOSSIP_HDA4 "What does the Gahrron's Withering Cauldron need?"

#define GOSSIP_SDA1 "Thanks, i need a Vitreous Focuser"

class npcs_dithers_and_arbington : public CreatureScript
{
public:
    npcs_dithers_and_arbington() : CreatureScript("npcs_dithers_and_arbington") { }

    bool OnGossipSelect(Player* player, Creature* creature, uint32 /*sender*/, uint32 action)
    {
        player->PlayerTalkClass->ClearMenus();
        switch (action)
        {
            case GOSSIP_ACTION_TRADE:
                player->GetSession()->SendListInventory(creature->GetGUID());
                break;
            case GOSSIP_ACTION_INFO_DEF+1:
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_SDA1, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+5);
                player->SEND_GOSSIP_MENU(3980, creature->GetGUID());
                break;
            case GOSSIP_ACTION_INFO_DEF+2:
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_SDA1, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+5);
                player->SEND_GOSSIP_MENU(3981, creature->GetGUID());
                break;
            case GOSSIP_ACTION_INFO_DEF+3:
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_SDA1, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+5);
                player->SEND_GOSSIP_MENU(3982, creature->GetGUID());
                break;
            case GOSSIP_ACTION_INFO_DEF+4:
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_SDA1, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+5);
                player->SEND_GOSSIP_MENU(3983, creature->GetGUID());
                break;
            case GOSSIP_ACTION_INFO_DEF+5:
                player->CLOSE_GOSSIP_MENU();
                creature->CastSpell(player, 17529, false);
                break;
        }
        return true;
    }

    bool OnGossipHello(Player* player, Creature* creature)
    {
        if (creature->isQuestGiver())
            player->PrepareQuestMenu(creature->GetGUID());

        if (creature->isVendor())
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_VENDOR, GOSSIP_TEXT_BROWSE_GOODS, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_TRADE);

        if (player->GetQuestRewardStatus(5237) || player->GetQuestRewardStatus(5238))
        {
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_HDA1, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+1);
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_HDA2, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+2);
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_HDA3, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+3);
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_HDA4, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+4);
            player->SEND_GOSSIP_MENU(3985, creature->GetGUID());
        }
        else
            player->SEND_GOSSIP_MENU(player->GetGossipTextId(creature), creature->GetGUID());

        return true;
    }
};

/*######
## npc_myranda_the_hag
######*/

enum eMyranda
{
    QUEST_SUBTERFUGE        = 5862,
    QUEST_IN_DREAMS         = 5944,
    SPELL_SCARLET_ILLUSION  = 17961
};

#define GOSSIP_ITEM_ILLUSION    "I am ready for the illusion, Myranda."

class npc_myranda_the_hag : public CreatureScript
{
public:
    npc_myranda_the_hag() : CreatureScript("npc_myranda_the_hag") { }

    bool OnGossipSelect(Player* player, Creature* /*creature*/, uint32 /*sender*/, uint32 action)
    {
        player->PlayerTalkClass->ClearMenus();
        if (action == GOSSIP_ACTION_INFO_DEF + 1)
        {
            player->CLOSE_GOSSIP_MENU();
            player->CastSpell(player, SPELL_SCARLET_ILLUSION, false);
        }
        return true;
    }

    bool OnGossipHello(Player* player, Creature* creature)
    {
        if (creature->isQuestGiver())
            player->PrepareQuestMenu(creature->GetGUID());

        if (player->GetQuestStatus(QUEST_SUBTERFUGE) == QUEST_STATUS_COMPLETE &&
            !player->GetQuestRewardStatus(QUEST_IN_DREAMS) && !player->HasAura(SPELL_SCARLET_ILLUSION))
        {
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ITEM_ILLUSION, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
            player->SEND_GOSSIP_MENU(4773, creature->GetGUID());
            return true;
        }
        else
            player->SEND_GOSSIP_MENU(player->GetGossipTextId(creature), creature->GetGUID());

        return true;
    }
};

/*######
## npc_the_scourge_cauldron
######*/

class npc_the_scourge_cauldron : public CreatureScript
{
public:
    npc_the_scourge_cauldron() : CreatureScript("npc_the_scourge_cauldron") { }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_the_scourge_cauldronAI (creature);
    }

    struct npc_the_scourge_cauldronAI : public ScriptedAI
    {
        npc_the_scourge_cauldronAI(Creature* creature) : ScriptedAI(creature) {}

        void Reset() {}

        void EnterCombat(Unit* /*who*/) {}

        void DoDie()
        {
            //summoner dies here
            me->DealDamage(me, me->GetHealth(), NULL, DIRECT_DAMAGE, SPELL_SCHOOL_MASK_NORMAL, NULL, false);
            //override any database `spawntimesecs` to prevent duplicated summons
            uint32 rTime = me->GetRespawnDelay();
            if (rTime<600)
                me->SetRespawnDelay(600);
        }

        void MoveInLineOfSight(Unit* who)
        {
            if (!who || who->GetTypeId() != TYPEID_PLAYER)
                return;

            if (who->IsPlayer())
            {
                switch (me->GetAreaId())
                {
                    case 199:                                   //felstone
                        if (CAST_PLR(who)->GetQuestStatus(5216) == QUEST_STATUS_INCOMPLETE ||
                            CAST_PLR(who)->GetQuestStatus(5229) == QUEST_STATUS_INCOMPLETE)
                        {
                            me->SummonCreature(11075, 0.0f, 0.0f, 0.0f, 0.0f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 600000);
                            DoDie();
                        }
                        break;
                    case 200:                                   //dalson
                        if (CAST_PLR(who)->GetQuestStatus(5219) == QUEST_STATUS_INCOMPLETE ||
                            CAST_PLR(who)->GetQuestStatus(5231) == QUEST_STATUS_INCOMPLETE)
                        {
                            me->SummonCreature(11077, 0.0f, 0.0f, 0.0f, 0.0f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 600000);
                            DoDie();
                        }
                        break;
                    case 201:                                   //gahrron
                        if (CAST_PLR(who)->GetQuestStatus(5225) == QUEST_STATUS_INCOMPLETE ||
                            CAST_PLR(who)->GetQuestStatus(5235) == QUEST_STATUS_INCOMPLETE)
                        {
                            me->SummonCreature(11078, 0.0f, 0.0f, 0.0f, 0.0f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 600000);
                            DoDie();
                        }
                        break;
                    case 202:                                   //writhing
                        if (CAST_PLR(who)->GetQuestStatus(5222) == QUEST_STATUS_INCOMPLETE ||
                            CAST_PLR(who)->GetQuestStatus(5233) == QUEST_STATUS_INCOMPLETE)
                        {
                            me->SummonCreature(11076, 0.0f, 0.0f, 0.0f, 0.0f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 600000);
                            DoDie();
                        }
                        break;
                }
            }
        }
    };
};

/*######
##    npcs_andorhal_tower
######*/

enum eAndorhalTower
{
    GO_BEACON_TORCH                             = 176093
};

class npc_andorhal_tower : public CreatureScript
{
public:
    npc_andorhal_tower() : CreatureScript("npc_andorhal_tower") { }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_andorhal_towerAI (creature);
    }

    struct npc_andorhal_towerAI : public Scripted_NoMovementAI
    {
        npc_andorhal_towerAI(Creature* creature) : Scripted_NoMovementAI(creature) {}

        void MoveInLineOfSight(Unit* who)
        {
            if (!who || who->GetTypeId() != TYPEID_PLAYER)
                return;

            if (me->FindNearestGameObject(GO_BEACON_TORCH, 10.0f))
                CAST_PLR(who)->KilledMonsterCredit(me->GetEntry(), me->GetGUID());
        }
    };
};

/*######
##  npc_anchorite_truuen
######*/

enum eTruuen
{
    NPC_GHOST_UTHER             = 17233,
    NPC_THEL_DANIS              = 1854,
    NPC_GHOUL                   = 1791,      //ambush

    QUEST_TOMB_LIGHTBRINGER     = 9446,

    SAY_WP_0                    = -1800064,  //Beware! We are attacked!
    SAY_WP_1                    = -1800065,  //It must be the purity of the Mark of the Lightbringer that is drawing forth the Scourge to attack us. We must proceed with caution lest we be overwhelmed!
    SAY_WP_2                    = -1800066,  //This land truly needs to be cleansed by the Light! Let us continue on to the tomb. It isn't far now...
    SAY_WP_3                    = -1800067,  //Be welcome, friends!
    SAY_WP_4                    = -1800068,  //Thank you for coming here in remembrance of me. Your efforts in recovering that symbol, while unnecessary, are certainly touching to an old man's heart.
    SAY_WP_5                    = -1800069,  //Please, rise my friend. Keep the Blessing as a symbol of the strength of the Light and how heroes long gone might once again rise in each of us to inspire.
    SAY_WP_6                    = -1800070   //Thank you my friend for making this possible. This is a day that I shall never forget! I think I will stay a while. Please return to High Priestess MacDonnell at the camp. I know that she'll be keenly interested to know of what has transpired here.
};

class npc_anchorite_truuen : public CreatureScript
{
public:
    npc_anchorite_truuen() : CreatureScript("npc_anchorite_truuen") { }

    bool OnQuestAccept(Player* player, Creature* creature, Quest const* quest)
    {
        npc_escortAI* pEscortAI = CAST_AI(npc_anchorite_truuen::npc_anchorite_truuenAI, creature->AI());

        if (quest->GetQuestId() == QUEST_TOMB_LIGHTBRINGER)
            pEscortAI->Start(true, true, player->GetGUID());
        return false;
    }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_anchorite_truuenAI(creature);
    }

    struct npc_anchorite_truuenAI : public npc_escortAI
    {
        npc_anchorite_truuenAI(Creature* creature) : npc_escortAI(creature) { }

        uint32 m_uiChatTimer;

        uint64 UghostGUID;
        uint64 TheldanisGUID;

        Creature* Ughost;
        Creature* Theldanis;

        void Reset()
        {
            m_uiChatTimer = 7000;
        }

        void JustSummoned(Creature* summoned)
        {
            if (summoned->GetEntry() == NPC_GHOUL)
                summoned->AI()->AttackStart(me);
        }

        void WaypointReached(uint32 waypointId)
        {
            Player* player = GetPlayerForEscort();

            switch (waypointId)
            {
                case 8:
                    DoScriptText(SAY_WP_0, me);
                    me->SummonCreature(NPC_GHOUL, me->GetPositionX()+7.0f, me->GetPositionY()+7.0f, me->GetPositionZ(), 0.0f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 90000);
                    me->SummonCreature(NPC_GHOUL, me->GetPositionX()+5.0f, me->GetPositionY()+5.0f, me->GetPositionZ(), 0.0f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 90000);
                    break;
                case 9:
                    DoScriptText(SAY_WP_1, me);
                    break;
                case 14:
                    me->SummonCreature(NPC_GHOUL, me->GetPositionX()+7.0f, me->GetPositionY()+7.0f, me->GetPositionZ(), 0.0f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 90000);
                    me->SummonCreature(NPC_GHOUL, me->GetPositionX()+5.0f, me->GetPositionY()+5.0f, me->GetPositionZ(), 0.0f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 90000);
                    me->SummonCreature(NPC_GHOUL, me->GetPositionX()+10.0f, me->GetPositionY()+10.0f, me->GetPositionZ(), 0.0f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 90000);
                    me->SummonCreature(NPC_GHOUL, me->GetPositionX()+8.0f, me->GetPositionY()+8.0f, me->GetPositionZ(), 0.0f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 90000);
                    break;
                case 15:
                    DoScriptText(SAY_WP_2, me);
                case 21:
                    Theldanis = GetClosestCreatureWithEntry(me, NPC_THEL_DANIS, 150);
                    DoScriptText(SAY_WP_3, Theldanis);
                    break;
                case 22:
                    break;
                case 23:
                    Ughost = me->SummonCreature(NPC_GHOST_UTHER, 971.86f, -1825.42f, 81.99f, 0.0f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 30000);
                    Ughost->SetDisableGravity(true);
                    DoScriptText(SAY_WP_4, Ughost, me);
                    m_uiChatTimer = 4000;
                    break;
                case 24:
                    DoScriptText(SAY_WP_5, Ughost, me);
                    m_uiChatTimer = 4000;
                    break;
                case 25:
                    DoScriptText(SAY_WP_6, Ughost, me);
                    m_uiChatTimer = 4000;
                    break;
                case 26:
                    if (player)
                        player->GroupEventHappens(QUEST_TOMB_LIGHTBRINGER, me);
                    break;
            }
        }

        void EnterCombat(Unit* /*who*/){}

         void JustDied(Unit* /*killer*/)
        {
            if (Player* player = GetPlayerForEscort())
                player->FailQuest(QUEST_TOMB_LIGHTBRINGER);
        }

        void UpdateAI(const uint32 uiDiff)
        {
            npc_escortAI::UpdateAI(uiDiff);
            DoMeleeAttackIfReady();
            if (HasEscortState(STATE_ESCORT_ESCORTING))
                m_uiChatTimer = 6000;
        }
    };
};


/* QUESTS
http://www.wowhead.com/quest=26953
http://www.wowhead.com/quest=26954
*/
enum KikiSpellsAndEntries
{
	/// Spells
	SPELL_AQUATIC_FORM = 83085,
	SPELL_BEAR_FORM = 83093,
	SPELL_CAT_FORM = 83452,
	SPELL_MOONKIN_FORM = 82815,
	SPELL_MARK_OF_THE_WILD = 83872,
	SPELL_POUNCE = 83453,
	SPELL_REJUV = 12160,
	SPELL_WRATH_FAKE = 83874,
	SPELL_WRATH = 83457,  // Does no damage although it's the correct one.
	SPELL_MOONFIRE = 83091,
	SPELL_BEAR_SWIPE = 89591,  // Needs fixing, does too much damage.
	
	/// Npc
	NPC_ZIKI_BEAR = 44555,

	/// Texts
	SPEECH_ITBURNS = -1799989,
	SPEECH_MEOW = -1799987,
	SPEECH_RAWR = -1799990,
	SPEECH_OW = -1799988,  // Not used, random yell?
	SPEECH_YOUCH = -1799999,   // Not used, random yell?
	SPEECH_CUTITOUT = -1799998,   // Not used, random yell?
	SPEECH_SHAPESHIFT_BEAR = -1799996,
	SPEECH_INCONTROL = -1799997,
	SPEECH_SHAPESHIFT_CAT = -1799995,
	SPEECH_SHAPESHIFT_FISH = -1799994,
	SPEECH_NUNDGE = -1799993,
	SPEECH_LEAP = -1799992,
	SPEECH_POUNCE = -1799991,

	/// Kill credit
	KIKI_KILL_CREDIT = 44777

	/*
	full list of possible quotes
	need info on where / when and timing on all these.......
	Zen'Kiki says: A little help here...
	Zen'Kiki says: Alright, here I go!
	Zen'Kiki says: Am I hitting him?
	Zen'Kiki says: Attack!
	Zen'Kiki says: Can Zen'Kiki get a little nudge?
	Zen'Kiki says: Cut it out!
	Zen'Kiki says: De tauren says that she'll teach me to heal if we do a good job! Let's go, mon!
	Zen'Kiki says: Get back over here, mon!
	Zen'Kiki says: Get over here, you coward!
	Zen'Kiki says: Haha!
	Zen'Kiki says: Here comes Zen'Kiki!
	Zen'Kiki says: Hey, that tickles, mon!
	Zen'Kiki says: I got dis one!
	Zen'Kiki says: I seem to be... stuck...
	Zen'Kiki says: I'll get him!
	Zen'Kiki says: It burns like the moon!
	Zen'Kiki says: It burns!
	Zen'Kiki says: Leap!
	Zen'Kiki says: Maul! Swipe! MANGLE!
	Zen'Kiki says: Meow!
	Zen'Kiki says: No, hit me! Over here, mon!
	Zen'Kiki says: Oof!
	Zen'Kiki says: Ouch!
	Zen'Kiki says: Ow, mon!
	Zen'Kiki says: Pounce!
	Zen'Kiki says: Quit yer pokin', mon!
	Zen'Kiki says: Rawr!
	Zen'Kiki says: Rawr!!
	Zen'Kiki says: Ready to go, mon!
	Zen'Kiki says: Shapeshift! Get ready for de moonfire!
	Zen'Kiki says: Shapeshift! Get ready to taste my claws!
	Zen'Kiki says: Shapeshift! Here come de moonfire!
	Zen'Kiki says: Shapeshift! Here it comes, mon!
	Zen'Kiki says: Shapeshift! Oh no! Not again...
	Zen'Kiki says: Shapeshift! Over here, mon!
	Zen'Kiki says: Shapeshift! Time for bear form!
	Zen'Kiki says: Shapeshift! Time for cat form!
	Zen'Kiki says: Shapeshift! Try to swim away now, mon!
	Zen'Kiki says: Shapeshift! Uh oh... wait a minute here...
	Zen'Kiki says: Shapeshift! Zen'Kiki will absorb de damage!
	Zen'Kiki says: Shapeshift! Zen'Kiki's ready to pounce!
	Zen'Kiki says: Stop dat!
	Zen'Kiki says: This isn't right.
	Zen'Kiki says: Why you guys upside down?
	Zen'Kiki says: You just let Zen'Kiki know when you're ready! I'll bring one of these birds down for ya!
	Zen'Kiki says: Yowch!
	Zen'Kiki says: Zen'Kiki is in control!
	Zen'Kiki says: Zen'kiki's real sorry about this.
	*/
};

/// Zen'kiki - 44904
class npc_zenkiki : public CreatureScript
{
public:
	npc_zenkiki() : CreatureScript("npc_zenkiki") { }

	struct npc_zenkikiAI : public ScriptedAI
	{
		npc_zenkikiAI(Creature* creature) : ScriptedAI(creature) {}

		uint32 uiAttackTimer;
		uint32 uiFormTmer;
		uint32 uiInvistimer;
		uint32 FormReset;
		bool hasform;
		bool donecat;
		bool donebear;
		bool donefish;
		bool donemookin;
		bool saynudge;
		bool hasshapeshifted;
		bool Talked = false;

		void Reset()
		{
			uiAttackTimer = 1500;
			uiFormTmer = 3500;
			uiInvistimer = 10000;
			FormReset = 12000;
			hasform = false;
			donecat = false;
			donebear = false;
			donefish = false;
			donemookin = false;
			saynudge = false;
			hasshapeshifted = false;
			//DoCast(me,SPELL_MARK_OF_THE_WILD);
			me->GetMotionMaster()->MoveFollow(me->GetOwner()->ToPlayer(), 1.0f, 0);
			me->CombatStop();
			me->SetDisplayId(33878); // Back to Zen'Kiki Model
			me->RemoveAllAuras();
			if (me->GetOwner()->ToPlayer()->GetQuestStatus(26953) == QUEST_STATUS_COMPLETE && me->GetOwner()->ToPlayer()->GetQuestStatus(26954) == QUEST_STATUS_COMPLETE)
			{
				me->DisappearAndDie();
			}
			if (!Talked) // Doesn't reset through Reset() - Called once, when Zen'kiki is spawned.
			{
				me->MonsterSay("Ready to go, mon!", LANG_UNIVERSAL, 0);
				Talked = true;
			}
		}

		void EnterCombat(Unit* /*who*/)
		{
		}

		void SpellHit(Unit *caster, const SpellEntry *spell)
		{
			// QUEST SUPPORT http://www.wowhead.com/quest=26954
			// To Do: The Bunny 
			if (spell->Id == 84290) // Spell is cast from Bunny to Zen'kiki
			{
				// Summon the Diseased Hawks
				me->SummonCreature(44481, me->getVictim()->GetPositionX() + (urand(10, 45)), me->getVictim()->GetPositionY() + (urand(10, 45)), me->getVictim()->GetPositionZ() + (urand(10, 25)), 0, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 2000);
				me->SummonCreature(44481, me->getVictim()->GetPositionX() + (urand(10, 45)), me->getVictim()->GetPositionY() + (urand(10, 45)), me->getVictim()->GetPositionZ() + (urand(10, 25)), 0, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 2000);
				me->SummonCreature(44481, me->getVictim()->GetPositionX() + (urand(10, 45)), me->getVictim()->GetPositionY() + (urand(10, 45)), me->getVictim()->GetPositionZ() + (urand(10, 25)), 0, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 2000);
				me->SummonCreature(44481, me->getVictim()->GetPositionX() + (urand(10, 45)), me->getVictim()->GetPositionY() + (urand(10, 45)), me->getVictim()->GetPositionZ() + (urand(10, 25)), 0, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 2000);
				me->SummonCreature(44481, me->getVictim()->GetPositionX() + (urand(10, 45)), me->getVictim()->GetPositionY() + (urand(10, 45)), me->getVictim()->GetPositionZ() + (urand(10, 25)), 0, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 2000);
				me->SummonCreature(44481, me->getVictim()->GetPositionX() + (urand(10, 45)), me->getVictim()->GetPositionY() + (urand(10, 45)), me->getVictim()->GetPositionZ() + (urand(10, 25)), 0, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 2000);
				me->SummonCreature(44481, me->getVictim()->GetPositionX() + (urand(10, 45)), me->getVictim()->GetPositionY() + (urand(10, 45)), me->getVictim()->GetPositionZ() + (urand(10, 25)), 0, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 2000);
			}

			if (spell->Id == 82816) // Moonfire Spam
			{
				int32 textchance = urand(1, 4);
				switch (textchance)
				{
				case 1:
					me->Say(SPEECH_ITBURNS, LANG_UNIVERSAL, NULL);
					break;
				case 2:
					me->Say(SPEECH_OW, LANG_UNIVERSAL, NULL);
					break;
				case 3:
					me->Say(SPEECH_CUTITOUT, LANG_UNIVERSAL, NULL);
					break;
				case 4:
					me->Say(SPEECH_YOUCH, LANG_UNIVERSAL, NULL);
					break;
				}
			}
		}

		void EnterEvadeMode()
		{
			Reset();
		}

		void KilledUnit(Unit* victim)
		{
		}

		void UpdateAI(const uint32 uiDiff)
		{
			if (!UpdateVictim())
				return;

			// When Zen'kiki's target is 30% HP or less Zen will kill it giving credit to player
			if (me->getVictim()->GetHealthPct() <= 30.0f)
			{
				if (me->getVictim()->GetTypeId() == TYPEID_UNIT)
					switch (me->getVictim()->GetEntry())
					{
						case 44482:
						case 1187:
						case 1822:
						case 1824:
							me->GetOwner()->ToPlayer()->KilledMonsterCredit(KIKI_KILL_CREDIT, 0);
							break;
					}
			}

			if (!hasshapeshifted)
			{
				if (uiFormTmer <= uiDiff && !hasform)
				{

					hasform = true;
					uiFormTmer = 9000;
					int32 rand_eff = urand(1, 4);
					switch (rand_eff)
					{
					case 1:
						if (!donefish)
						{
							DoCast(me, SPELL_AQUATIC_FORM, true);
							me->Say(SPEECH_SHAPESHIFT_FISH, LANG_UNIVERSAL, NULL);
							hasshapeshifted = true;
						}
						break;
					case 2:
						if (!donebear)
						{
							DoCast(me, SPELL_BEAR_FORM, true);
							me->SetDisplayId(707); // Bear model id
							me->Say(SPEECH_SHAPESHIFT_BEAR, LANG_UNIVERSAL, NULL);
							hasshapeshifted = true;
						}
						break;
					case 3:
						if (!donecat)
						{
							DoCast(me, SPELL_CAT_FORM, true);
							me->Say(SPEECH_SHAPESHIFT_CAT, LANG_UNIVERSAL, NULL);
							hasshapeshifted = true;
						}
						break;
					case 4:
						if (!donemookin)
						{
							DoCast(me, SPELL_MOONKIN_FORM, true);
							hasshapeshifted = true;
						}
						break;
					}
				}
				else uiFormTmer -= uiDiff;
			}


			if (uiAttackTimer <= uiDiff)
			{
				uiAttackTimer = 3500;
				if (me->HasAura(SPELL_AQUATIC_FORM))
				{
					//To do: make appear upside down and flop around
					me->SetOrientation(urand(1, 6));
					if (!saynudge)
					{
						saynudge = true;
						me->Say(SPEECH_NUNDGE, LANG_UNIVERSAL, NULL);
					}
				}

				if (me->HasAura(SPELL_BEAR_FORM))
				{
					// Face different directions and attack nothing and say Rawr
					me->Say(SPEECH_RAWR, LANG_UNIVERSAL, NULL);
					if (Creature *pZikiBear = me->FindNearestCreature(NPC_ZIKI_BEAR, 15.0f, true))
					{
						pZikiBear->SetOrientation(urand(1, 6));
						DoCast(me, SPELL_BEAR_SWIPE, true);
					}
				}

				if (me->HasAura(SPELL_CAT_FORM))
				{
					DoCast(me, SPELL_POUNCE, true);
					int32 textchance = urand(1, 4);
					switch (textchance)
					{
					case 1:
						me->Say(SPEECH_MEOW, LANG_UNIVERSAL, NULL);
						break;
					case 2:
						me->Say(SPEECH_LEAP, LANG_UNIVERSAL, NULL);
						break;
					case 3:
						me->Say(SPEECH_RAWR, LANG_UNIVERSAL, NULL);
						break;
					case 4:
						me->Say(SPEECH_POUNCE, LANG_UNIVERSAL, NULL);
						break;
					}
					uiAttackTimer = 2000;
					DoStartNoMovement(me->getVictim());
				}

				if (me->HasAura(SPELL_MOONKIN_FORM))
				{
					me->CastSpell(me, SPELL_MOONFIRE, true);	
					uiAttackTimer = 5000;
				}
			}
			else uiAttackTimer -= uiDiff;

			if (FormReset <= uiDiff && hasform)
			{
				hasform = false;
				me->RemoveAurasDueToSpell(SPELL_AQUATIC_FORM);
				me->RemoveAurasDueToSpell(SPELL_BEAR_FORM);
				me->RemoveAurasDueToSpell(SPELL_CAT_FORM);
				me->RemoveAurasDueToSpell(SPELL_MOONKIN_FORM);
				DoStartMovement(me->getVictim());
				AttackStart(me->getVictim());

				Creature *pZikiBear = me->FindNearestCreature(NPC_ZIKI_BEAR, 15.0f, true);
				if (pZikiBear)
				{
					pZikiBear->DisappearAndDie();
					me->SetDisplayId(33878); // Back to Zen'Kiki Model
					me->RemoveAllAuras();
				}
				me->Say(SPEECH_INCONTROL, LANG_UNIVERSAL, NULL);
				FormReset = 30000;
			}
			else FormReset -= uiDiff;

			if (!hasform || me->HasAura(SPELL_MOONKIN_FORM))
				DoSpellAttackIfReady(SPELL_WRATH);
		}
	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_zenkikiAI(creature);
	}
};



/// Quest: 26955 - Zen'kiki and the Cultists
enum eCultistCage
{
	/// Quest
	QUEST_ZEN_CULTISTS = 26955,

	/// Npcs
	NPC_CAGED_BEAR = 44902,
	NPC_ZENKIKI = 44904,

	/// Spells
	SPELL_PLAGUEBEAR_FREED = 83813,
};

/// Captive Plaguebear - 44902
class npc_captive_plaguebear : public CreatureScript
{
public:
	npc_captive_plaguebear() : CreatureScript("npc_captive_plaguebear") { }

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_captive_plaguebearAI(creature);
	}

	struct npc_captive_plaguebearAI : public ScriptedAI
	{
		npc_captive_plaguebearAI(Creature* creature) : ScriptedAI(creature) {}

		uint64 m_PlayerGUID;

		void Reset()
		{
			m_PlayerGUID = 0;
		}

		void MovementInform(uint32 type, uint32 id) override
		{

			if (type == POINT_MOTION_TYPE && id == 1)
			{
				if (Creature* zenkiki = me->FindNearestCreature(NPC_ZENKIKI, 50.0f, true))
				{
					zenkiki->CastSpell(me, SPELL_PLAGUEBEAR_FREED, true);

					// Kill credit
					m_PlayerGUID = zenkiki->GetOwnerGUID();
					if (Player* player = ObjectAccessor::GetPlayer(*me, m_PlayerGUID))
						if (player->GetQuestStatus(QUEST_ZEN_CULTISTS) == QUEST_STATUS_INCOMPLETE)
							player->KilledMonsterCredit(NPC_CAGED_BEAR);
				}		
			}
		}

		void SpellHit(Unit* Caster, SpellInfo const* spell) override
		{
			if (spell->Id == SPELL_PLAGUEBEAR_FREED)
			{
				/// Move 15 yards
				float x, y, z;
				me->GetClosePoint(x, y, z, me->GetObjectSize() / 3, 15.0f);
				me->GetMotionMaster()->MovePoint(1, x, y, z);
				me->DespawnOrUnsummon(7000);
			}
		}

	};
};


/// Cultist Cage - 207428 & 205160
class go_cultist_cage : public GameObjectScript
{
public:
	go_cultist_cage() :
		GameObjectScript("go_cultist_cage")
	{
	}

	bool OnGossipHello(Player* pPlayer, GameObject *pGO)
	{
		if (Creature* pCagedBear = pGO->FindNearestCreature(NPC_CAGED_BEAR, 8.0f, true))
		{
			pGO->SetGoState(GO_STATE_ACTIVE);

			/// Move 5 yards
			float x, y, z;
			pCagedBear->GetClosePoint(x, y, z, pCagedBear->GetObjectSize() / 3, 5.0f);
			pCagedBear->GetMotionMaster()->MovePoint(1, x, y, z);	
		}

		return true;
	}
};



#ifndef __clang_analyzer__
void AddSC_western_plaguelands()
{
	/// Npcs
    new npcs_dithers_and_arbington();
    new npc_myranda_the_hag();
    new npc_the_scourge_cauldron();
    new npc_andorhal_tower();
    new npc_anchorite_truuen();
	new npc_zenkiki();
	new npc_captive_plaguebear();

	/// Object
	new go_cultist_cage();
}
#endif
