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

/*######
## npc_aeranas
######*/

enum eAeranas
{
    SAY_SUMMON              = -1000138,
    SAY_FREE                = -1000139,

    FACTION_HOSTILE         = 16,
    FACTION_FRIENDLY        = 35,

    SPELL_ENVELOPING_WINDS  = 15535,
    SPELL_SHOCK             = 12553,

    C_AERANAS               = 17085
};

class npc_aeranas : public CreatureScript
{
public:
    npc_aeranas() : CreatureScript("npc_aeranas") { }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_aeranasAI (creature);
    }

    struct npc_aeranasAI : public ScriptedAI
    {
        npc_aeranasAI(Creature* creature) : ScriptedAI(creature) {}

        uint32 Faction_Timer;
        uint32 EnvelopingWinds_Timer;
        uint32 Shock_Timer;

        void Reset()
        {
            Faction_Timer = 8000;
            EnvelopingWinds_Timer = 9000;
            Shock_Timer = 5000;

            me->RemoveFlag(UNIT_FIELD_NPC_FLAGS, UNIT_NPC_FLAG_QUESTGIVER);
            me->setFaction(FACTION_FRIENDLY);

            DoScriptText(SAY_SUMMON, me);
        }

        void UpdateAI(const uint32 diff)
        {
            if (Faction_Timer)
            {
                if (Faction_Timer <= diff)
                {
                    me->setFaction(FACTION_HOSTILE);
                    Faction_Timer = 0;
                } else Faction_Timer -= diff;
            }

            if (!UpdateVictim())
                return;

            if (HealthBelowPct(30))
            {
                me->setFaction(FACTION_FRIENDLY);
                me->SetFlag(UNIT_FIELD_NPC_FLAGS, UNIT_NPC_FLAG_QUESTGIVER);
                me->RemoveAllAuras();
                me->DeleteThreatList();
                me->CombatStop(true);
                DoScriptText(SAY_FREE, me);
                return;
            }

            if (Shock_Timer <= diff)
            {
                DoCast(me->getVictim(), SPELL_SHOCK);
                Shock_Timer = 10000;
            } else Shock_Timer -= diff;

            if (EnvelopingWinds_Timer <= diff)
            {
                DoCast(me->getVictim(), SPELL_ENVELOPING_WINDS);
                EnvelopingWinds_Timer = 25000;
            } else EnvelopingWinds_Timer -= diff;

            DoMeleeAttackIfReady();
        }
    };
};

/*######
## npc_ancestral_wolf
######*/

enum eAncestralWolf
{
    EMOTE_WOLF_LIFT_HEAD            = -1000496,
    EMOTE_WOLF_HOWL                 = -1000497,
    SAY_WOLF_WELCOME                = -1000498,

    SPELL_ANCESTRAL_WOLF_BUFF       = 29981,

    NPC_RYGA                        = 17123
};

class npc_ancestral_wolf : public CreatureScript
{
public:
    npc_ancestral_wolf() : CreatureScript("npc_ancestral_wolf") { }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_ancestral_wolfAI(creature);
    }

    struct npc_ancestral_wolfAI : public npc_escortAI
    {
        npc_ancestral_wolfAI(Creature* creature) : npc_escortAI(creature)
        {
            if (creature->GetOwner() && creature->GetOwner()->IsPlayer())
                Start(false, false, creature->GetOwner()->GetGUID());
            else
                sLog->outError(LOG_FILTER_TSCR, "TRINITY: npc_ancestral_wolf can not obtain owner or owner is not a player.");

            creature->SetSpeed(MOVE_WALK, 1.5f);
            Reset();
        }

        Unit* pRyga;

        void Reset()
        {
            pRyga = NULL;
            DoCast(me, SPELL_ANCESTRAL_WOLF_BUFF, true);
        }

        void MoveInLineOfSight(Unit* who)
        {
            if (!pRyga && who->GetTypeId() == TYPEID_UNIT && who->GetEntry() == NPC_RYGA && me->IsWithinDistInMap(who, 15.0f))
                pRyga = who;

            npc_escortAI::MoveInLineOfSight(who);
        }

        void WaypointReached(uint32 waypointId)
        {
            switch (waypointId)
            {
                case 0:
                    DoScriptText(EMOTE_WOLF_LIFT_HEAD, me);
                    break;
                case 2:
                    DoScriptText(EMOTE_WOLF_HOWL, me);
                    break;
                case 50:
                    if (pRyga && pRyga->isAlive() && !pRyga->isInCombat())
                        DoScriptText(SAY_WOLF_WELCOME, pRyga);
                    break;
            }
        }
    };
};


/*######
## npc_naladu
######*/

#define GOSSIP_NALADU_ITEM1 "Why don't you escape?"

enum eNaladu
{
    GOSSIP_TEXTID_NALADU1   = 9788
};

class npc_naladu : public CreatureScript
{
public:
    npc_naladu() : CreatureScript("npc_naladu") { }

    bool OnGossipSelect(Player* player, Creature* creature, uint32 /*sender*/, uint32 action)
    {
        player->PlayerTalkClass->ClearMenus();
        if (action == GOSSIP_ACTION_INFO_DEF+1)
            player->SEND_GOSSIP_MENU(GOSSIP_TEXTID_NALADU1, creature->GetGUID());

        return true;
    }

    bool OnGossipHello(Player* player, Creature* creature)
    {
        if (creature->isQuestGiver())
            player->PrepareQuestMenu(creature->GetGUID());

        player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_NALADU_ITEM1, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+1);
        player->SEND_GOSSIP_MENU(player->GetGossipTextId(creature), creature->GetGUID());
        return true;
    }
};

/*######
## npc_tracy_proudwell
######*/

#define GOSSIP_TEXT_REDEEM_MARKS        "I have marks to redeem!"
#define GOSSIP_TRACY_PROUDWELL_ITEM1    "I heard that your dog Fei Fei took Klatu's prayer beads..."
#define GOSSIP_TRACY_PROUDWELL_ITEM2    "<back>"

enum eTracy
{
    GOSSIP_TEXTID_TRACY_PROUDWELL1       = 10689,
    QUEST_DIGGING_FOR_PRAYER_BEADS       = 10916
};

class npc_tracy_proudwell : public CreatureScript
{
public:
    npc_tracy_proudwell() : CreatureScript("npc_tracy_proudwell") { }

    bool OnGossipSelect(Player* player, Creature* creature, uint32 /*sender*/, uint32 action)
    {
        player->PlayerTalkClass->ClearMenus();
        switch (action)
        {
            case GOSSIP_ACTION_INFO_DEF+1:
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_TRACY_PROUDWELL_ITEM2, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 2);
                player->SEND_GOSSIP_MENU(GOSSIP_TEXTID_TRACY_PROUDWELL1, creature->GetGUID());
                break;
            case GOSSIP_ACTION_INFO_DEF+2:
                player->SEND_GOSSIP_MENU(player->GetGossipTextId(creature), creature->GetGUID());
                break;
            case GOSSIP_ACTION_TRADE:
                player->GetSession()->SendListInventory(creature->GetGUID());
                break;
        }

        return true;
    }

    bool OnGossipHello(Player* player, Creature* creature)
    {
        if (creature->isQuestGiver())
            player->PrepareQuestMenu(creature->GetGUID());

        if (creature->isVendor())
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_VENDOR, GOSSIP_TEXT_REDEEM_MARKS, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_TRADE);

        if (player->GetQuestStatus(QUEST_DIGGING_FOR_PRAYER_BEADS) == QUEST_STATUS_INCOMPLETE)
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_TRACY_PROUDWELL_ITEM1, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);

        player->SEND_GOSSIP_MENU(player->GetGossipTextId(creature), creature->GetGUID());
        return true;
    }
};

/*######
## npc_trollbane
######*/

#define GOSSIP_TROLLBANE_ITEM1      "Tell me of the Sons of Lothar."
#define GOSSIP_TROLLBANE_ITEM2      "<more>"
#define GOSSIP_TROLLBANE_ITEM3      "Tell me of your homeland."

enum eTrollbane
{
    GOSSIP_TEXTID_TROLLBANE1        = 9932,
    GOSSIP_TEXTID_TROLLBANE2        = 9933,
    GOSSIP_TEXTID_TROLLBANE3        = 8772
};

class npc_trollbane : public CreatureScript
{
public:
    npc_trollbane() : CreatureScript("npc_trollbane") { }

    bool OnGossipSelect(Player* player, Creature* creature, uint32 /*sender*/, uint32 action)
    {
        player->PlayerTalkClass->ClearMenus();
        switch (action)
        {
            case GOSSIP_ACTION_INFO_DEF+1:
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_TROLLBANE_ITEM2, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 2);
                player->SEND_GOSSIP_MENU(GOSSIP_TEXTID_TROLLBANE1, creature->GetGUID());
                break;
            case GOSSIP_ACTION_INFO_DEF+2:
                player->SEND_GOSSIP_MENU(GOSSIP_TEXTID_TROLLBANE2, creature->GetGUID());
                break;
            case GOSSIP_ACTION_INFO_DEF+3:
                player->SEND_GOSSIP_MENU(GOSSIP_TEXTID_TROLLBANE3, creature->GetGUID());
                break;
        }

        return true;
    }

    bool OnGossipHello(Player* player, Creature* creature)
    {
        if (creature->isQuestGiver())
            player->PrepareQuestMenu(creature->GetGUID());

        player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_TROLLBANE_ITEM1, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
        player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_TROLLBANE_ITEM3, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 3);
        player->SEND_GOSSIP_MENU(player->GetGossipTextId(creature), creature->GetGUID());
        return true;
    }
};

/*######
## npc_wounded_blood_elf
######*/

enum eWoundedBloodElf
{
    SAY_ELF_START               = -1000117,
    SAY_ELF_SUMMON1             = -1000118,
    SAY_ELF_RESTING             = -1000119,
    SAY_ELF_SUMMON2             = -1000120,
    SAY_ELF_COMPLETE            = -1000121,
    SAY_ELF_AGGRO               = -1000122,

    QUEST_ROAD_TO_FALCON_WATCH  = 9375
};

class npc_wounded_blood_elf : public CreatureScript
{
public:
    npc_wounded_blood_elf() : CreatureScript("npc_wounded_blood_elf") { }

    bool OnQuestAccept(Player* player, Creature* creature, Quest const* quest)
    {
        if (quest->GetQuestId() == QUEST_ROAD_TO_FALCON_WATCH)
        {
            if (npc_escortAI* pEscortAI = CAST_AI(npc_wounded_blood_elf::npc_wounded_blood_elfAI, creature->AI()))
                pEscortAI->Start(true, false, player->GetGUID());

            // Change faction so mobs attack
            creature->setFaction(775);
        }

        return true;
    }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_wounded_blood_elfAI(creature);
    }

    struct npc_wounded_blood_elfAI : public npc_escortAI
    {
        npc_wounded_blood_elfAI(Creature* creature) : npc_escortAI(creature) {}

        void WaypointReached(uint32 waypointId)
        {
            Player* player = GetPlayerForEscort();
            if (!player)
                return;

            switch (waypointId)
            {
                case 0:
                    DoScriptText(SAY_ELF_START, me, player);
                    break;
                case 9:
                    DoScriptText(SAY_ELF_SUMMON1, me, player);
                    // Spawn two Haal'eshi Talonguard
                    DoSpawnCreature(16967, -15, -15, 0, 0, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 5000);
                    DoSpawnCreature(16967, -17, -17, 0, 0, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 5000);
                    break;
                case 13:
                    DoScriptText(SAY_ELF_RESTING, me, player);
                    break;
                case 14:
                    DoScriptText(SAY_ELF_SUMMON2, me, player);
                    // Spawn two Haal'eshi Windwalker
                    DoSpawnCreature(16966, -15, -15, 0, 0, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 5000);
                    DoSpawnCreature(16966, -17, -17, 0, 0, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 5000);
                    break;
                case 27:
                    DoScriptText(SAY_ELF_COMPLETE, me, player);
                    // Award quest credit
                    player->GroupEventHappens(QUEST_ROAD_TO_FALCON_WATCH, me);
                    break;
            }
        }

        void Reset() { }

        void EnterCombat(Unit* /*who*/)
        {
            if (HasEscortState(STATE_ESCORT_ESCORTING))
                DoScriptText(SAY_ELF_AGGRO, me);
        }

        void JustSummoned(Creature* summoned)
        {
            summoned->AI()->AttackStart(me);
        }
    };
};

/*######
## npc_fel_guard_hound
######*/

enum eFelGuard
{
    SPELL_SUMMON_POO                              = 37688,

    NPC_DERANGED_HELBOAR                          = 16863
};

class npc_fel_guard_hound : public CreatureScript
{
public:
    npc_fel_guard_hound() : CreatureScript("npc_fel_guard_hound") { }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_fel_guard_houndAI(creature);
    }

    struct npc_fel_guard_houndAI : public ScriptedAI
    {
        npc_fel_guard_houndAI(Creature* creature) : ScriptedAI(creature) {}

        uint32 uiCheckTimer;
        uint64 uiHelboarGUID;

        void Reset()
        {
            uiCheckTimer = 5000; //check for creature every 5 sec
            uiHelboarGUID = 0;
        }

        void MovementInform(uint32 uiType, uint32 uiId)
        {
            if (uiType != POINT_MOTION_TYPE || uiId != 1)
                return;

            if (Creature* pHelboar = me->GetCreature(*me, uiHelboarGUID))
            {
                pHelboar->RemoveCorpse();
                DoCast(SPELL_SUMMON_POO);

                if (Player* owner = me->GetCharmerOrOwnerPlayerOrPlayerItself())
                    me->GetMotionMaster()->MoveFollow(owner, 0.0f, 0.0f);
            }
        }

        void UpdateAI(const uint32 uiDiff)
        {
            if (uiCheckTimer <= uiDiff)
            {
                if (Creature* pHelboar = me->FindNearestCreature(NPC_DERANGED_HELBOAR, 10.0f, false))
                {
                    if (pHelboar->GetGUID() != uiHelboarGUID && me->GetMotionMaster()->GetCurrentMovementGeneratorType() != POINT_MOTION_TYPE && !me->FindCurrentSpellBySpellId(SPELL_SUMMON_POO))
                    {
                        uiHelboarGUID = pHelboar->GetGUID();
                        me->GetMotionMaster()->MovePoint(1, pHelboar->GetPositionX(), pHelboar->GetPositionY(), pHelboar->GetPositionZ());
                    }
                }
                uiCheckTimer = 5000;
            }
            else
                uiCheckTimer -= uiDiff;

            if (!UpdateVictim())
                return;

            DoMeleeAttackIfReady();
        }
    };
};

enum Aledis
{
	// Quest
	QUEST_ARELIONS_SECRET = 10286,

	// Gossip Data
	ALEDIS_GOSSIP_MENU = 8081,
	ALEDIS_GOSSIP_OPTION = 0,
	ALEDIS_NPC_TEXT = 9988,

	// Texts
	SAY_CHALLENGE = 0,
	SAY_DEFEATED = 1,

	// Events
	EVENT_TALK = 1,
	EVENT_ATTACK = 2,
	EVENT_EVADE = 3,
	EVENT_FIREBALL = 4,
	EVENT_FROSTNOVA = 5,

	// Spells
	SPELL_FIREBALL = 20823,
	SPELL_FROSTNOVA = 11831
};

class npc_magister_aledis : public CreatureScript
{
public:
	npc_magister_aledis() : CreatureScript("npc_magister_aledis") { }

	bool OnGossipHello(Player* p_Player, Creature* p_Creature) override
	{
		if (p_Player->GetQuestStatus(QUEST_ARELIONS_SECRET) == QUEST_STATUS_INCOMPLETE)
		{
			p_Player->ADD_GOSSIP_ITEM_DB(ALEDIS_GOSSIP_MENU, ALEDIS_GOSSIP_OPTION, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF);
			p_Player->SEND_GOSSIP_MENU(ALEDIS_NPC_TEXT, p_Creature->GetGUID());
		}
		
		p_Player->SEND_GOSSIP_MENU(ALEDIS_NPC_TEXT, p_Creature->GetGUID());
		return true;
	}

	bool OnGossipSelect(Player* p_Player, Creature* p_Creature, uint32 /*sender*/, uint32 action) override
	{
		p_Player->PlayerTalkClass->ClearMenus();

		if (action == GOSSIP_ACTION_INFO_DEF)
		{
			p_Player->CLOSE_GOSSIP_MENU();
			p_Creature->StopMoving();
			CAST_AI(npc_magister_aledis::npc_magister_aledisAI, p_Creature->AI())->StartFight(p_Player);
		}

		return true;
	}

	struct npc_magister_aledisAI : public ScriptedAI
	{
		npc_magister_aledisAI(Creature* creature) : ScriptedAI(creature) { }

		void StartFight(Player* player)
		{
			me->Dismount();
			me->SetFacingToObject(player);
			me->RemoveFlag(UNIT_FIELD_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP);
			_playerGUID = player->GetGUID();
			_events.ScheduleEvent(EVENT_TALK, 1000);
		}

		void Reset() override
		{
			me->RestoreFaction();
			me->RemoveFlag(UNIT_FIELD_NPC_FLAGS, UNIT_NPC_FLAG_QUESTGIVER);
			me->SetFlag(UNIT_FIELD_FLAGS, UNIT_NPC_FLAG_GOSSIP);
			me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PC);
		}

		void DamageTaken(Unit* /*attacker*/, uint32& damage, SpellInfo const* /*p_SpellInfo*/) override
		{
			if (damage > me->GetHealth() || me->HealthBelowPctDamaged(20, damage))
			{
				damage = 0;

				_events.Reset();
				me->RestoreFaction();
				me->RemoveAllAuras();
				me->DeleteThreatList();
				me->CombatStop(true);
				me->SetFlag(UNIT_FIELD_NPC_FLAGS, UNIT_NPC_FLAG_QUESTGIVER);
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PC);
				Talk(SAY_DEFEATED);

				_events.ScheduleEvent(EVENT_EVADE, 1000);
			}
		}

		void UpdateAI(uint32 diff) override
		{
			_events.Update(diff);

			while (uint32 eventId = _events.ExecuteEvent())
			{
				switch (eventId)
				{
				case EVENT_TALK:
					Talk(SAY_CHALLENGE);
					_events.ScheduleEvent(EVENT_ATTACK, 2000);
					break;
				case EVENT_ATTACK:
					me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PC);
					me->setFaction(FACTION_HOSTILE);
					if (Player* player = Unit::GetPlayer(*me, _playerGUID))
						me->CombatStart(player);
					_events.ScheduleEvent(EVENT_FIREBALL, 1);
					_events.ScheduleEvent(EVENT_FROSTNOVA, 5000);
					break;
				case EVENT_FIREBALL:
					DoCast(SPELL_FIREBALL);
					_events.ScheduleEvent(EVENT_FIREBALL, 10000);
					break;
				case EVENT_FROSTNOVA:
					DoCastAOE(SPELL_FROSTNOVA);
					_events.ScheduleEvent(EVENT_FROSTNOVA, 20000);
					break;
				case EVENT_EVADE:
					EnterEvadeMode();
					break;
				}
			}

			if (!UpdateVictim())
				return;

			DoMeleeAttackIfReady();
		}

	private:
		EventMap _events;
		ObjectGuid _playerGUID;
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_magister_aledisAI(creature);
	}
};


enum ExorcismSpells
{
	// Spells
	SPELL_JULES_GOES_PRONE = 39283,
	SPELL_JULES_THREATENS_AURA = 39284,
	SPELL_JULES_GOES_UPRIGHT = 39294,
	SPELL_JULES_VOMITS_AURA = 39295,

	SPELL_BARADAS_COMMAND = 39277,
	SPELL_BARADA_FALTERS = 39278,
};

enum ExorcismTexts
{
	// All texts
	SAY_BARADA_1 = 0,
	SAY_BARADA_2 = 1,
	SAY_BARADA_3 = 2,
	SAY_BARADA_4 = 3,
	SAY_BARADA_5 = 4,
	SAY_BARADA_6 = 5,
	SAY_BARADA_7 = 6,
	SAY_BARADA_8 = 7,

	SAY_JULES_1 = 0,
	SAY_JULES_2 = 1,
	SAY_JULES_3 = 2,
	SAY_JULES_4 = 3,
	SAY_JULES_5 = 4,

	// Gossip menus
	JULES_PRE_EXORCISM	= 22431,
	JULES_POST_EXORCISM	= 22432,
};

Position const exorcismPos[11] =
{
	{ -707.123f, 2751.686f, 101.592f, 4.577416f }, //Barada Waypoint-1      0
	{ -710.731f, 2749.075f, 101.592f, 1.513286f }, //Barada Cast position   1
	{ -710.332f, 2754.394f, 102.948f, 3.207566f }, //Jules                  2
	{ -714.261f, 2747.754f, 103.391f, 0.0f },      //Jules Waypoint-1       3
	{ -713.113f, 2750.194f, 103.391f, 0.0f },      //Jules Waypoint-2       4
	{ -710.385f, 2750.896f, 103.391f, 0.0f },      //Jules Waypoint-3       5
	{ -708.309f, 2750.062f, 103.391f, 0.0f },      //Jules Waypoint-4       6
	{ -707.401f, 2747.696f, 103.391f, 0.0f },      //Jules Waypoint-5       7
	{ -708.591f, 2745.266f, 103.391f, 0.0f },      //Jules Waypoint-6       8
	{ -710.597f, 2744.035f, 103.391f, 0.0f },      //Jules Waypoint-7       9
	{ -713.089f, 2745.302f, 103.391f, 0.0f },      //Jules Waypoint-8      10
};

enum ExorcismMisc
{

	// Npcs
	NPC_DARKNESS_RELEASED = 22507,
	NPC_FOUL_PURGE = 22506,
	NPC_COLONEL_JULES = 22432,

	// Gossip
	BARADAS_GOSSIP_NPC_TEXT = 10683,
	BARADAS_GOSSIP_MENU	    = 8539,
	BARADAS_GOSSIP_OPTION   = 0,

	// Quest
	QUEST_THE_EXORCISM_OF_COLONEL_JULES = 10935,

	// Actions
	ACTION_START_EVENT = 1,
	ACTION_JULES_HOVER = 2,
	ACTION_JULES_FLIGHT = 3,
	ACTION_JULES_MOVE_HOME = 4,
	ACTION_FIND_JULES_BEGIN	= 5 // Find Jules and remove kneel and go to Jules
};

enum ExorcismEvents
{
	// Data
	EVENT_BARADAS_TALK = 1,
	EVENT_RESET = 2,

	//Colonel Jules
	EVENT_SUMMON_SKULL = 1,
};

/*######
## npc_colonel_jules
######*/

class npc_colonel_jules : public CreatureScript
{
public:
	npc_colonel_jules() : CreatureScript("npc_colonel_jules") { }

	bool OnGossipHello(Player* player, Creature* creature) override
	{
		if (CAST_AI(npc_colonel_jules::npc_colonel_julesAI, creature->AI())->success)
			player->KilledMonsterCredit(NPC_COLONEL_JULES, player->GetGUID());
			player->SEND_GOSSIP_MENU(JULES_POST_EXORCISM, creature->GetGUID());
		
		player->SEND_GOSSIP_MENU(JULES_PRE_EXORCISM, creature->GetGUID());
		return true;
	}

	struct npc_colonel_julesAI : public ScriptedAI
	{
		npc_colonel_julesAI(Creature* creature) : ScriptedAI(creature), summons(me)
		{
			Initialize();
		}

		void Initialize()
		{
			point = 3;
			wpreached = false;
			success = false;
		}

		void Reset() override
		{
			events.Reset();

			summons.DespawnAll();
			Initialize();
		}

		bool success;

		void DoAction(int32 action) override
		{
			switch (action)
			{
				case ACTION_JULES_HOVER:
					me->AddAura(SPELL_JULES_GOES_PRONE, me);
					me->AddAura(SPELL_JULES_THREATENS_AURA, me);

					me->SetCanFly(true);
					me->SetSpeed(MOVE_RUN, 0.2f);

					me->SetFacingTo(3.207566f);
					me->GetMotionMaster()->MoveJump(exorcismPos[2], 2.0f, 2.0f);

					success = false;

					events.ScheduleEvent(EVENT_SUMMON_SKULL, 10000);
					break;

				case ACTION_JULES_FLIGHT:
					me->RemoveAura(SPELL_JULES_GOES_PRONE);

					me->AddAura(SPELL_JULES_GOES_UPRIGHT, me);
					me->AddAura(SPELL_JULES_VOMITS_AURA, me);

					wpreached = true;
					me->GetMotionMaster()->MovePoint(point, exorcismPos[point]);
					break;

				case ACTION_JULES_MOVE_HOME:
					wpreached = false;
					me->SetSpeed(MOVE_RUN, 1.0f);
					me->GetMotionMaster()->MovePoint(11, exorcismPos[2]);
					events.CancelEvent(EVENT_SUMMON_SKULL);
					break;
				}
		}

		void JustSummoned(Creature* summon) override
		{
			summons.Summon(summon);
			summon->GetMotionMaster()->MoveRandom(10.0f);
		}

		void MovementInform(uint32 type, uint32 id) override
		{
			if (type != POINT_MOTION_TYPE)
				return;

			if (id < 10)
				wpreached = true;

			if (id == 8)
			{
				for (uint8 i = 0; i < 2; i++)
					DoSummon(NPC_FOUL_PURGE, exorcismPos[8]);
			}

			if (id == 10)
			{
				wpreached = true;
				point = 3;
			}
		}

		void UpdateAI(uint32 diff) override
		{
			if (wpreached)
			{
				me->GetMotionMaster()->MovePoint(point, exorcismPos[point]);
				point++;
				wpreached = false;
			}

			events.Update(diff);

			while (uint32 eventId = events.ExecuteEvent())
			{
				switch (eventId)
				{
				case EVENT_SUMMON_SKULL:
					uint8 summonCount = urand(1, 3);

					for (uint8 i = 0; i < summonCount; i++)
						me->SummonCreature(NPC_DARKNESS_RELEASED, me->GetPositionX(), me->GetPositionY(), me->GetPositionZ() + 1.5f, 0, TEMPSUMMON_MANUAL_DESPAWN);

					events.ScheduleEvent(EVENT_SUMMON_SKULL, urand(10000, 15000));
					break;
				}
			}
		}

	private:
		EventMap events;
		SummonList summons;

		uint8 point;

		bool wpreached;
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_colonel_julesAI(creature);
	}
};


/*######
## npc_barada
######*/

class npc_barada : public CreatureScript
{
public:
	npc_barada() : CreatureScript("npc_barada") { }

	bool OnGossipHello(Player* p_Player, Creature* p_Creature) override
	{
		if (p_Player->GetQuestStatus(QUEST_THE_EXORCISM_OF_COLONEL_JULES) == QUEST_STATUS_INCOMPLETE)
			p_Player->ADD_GOSSIP_ITEM_DB(BARADAS_GOSSIP_MENU, BARADAS_GOSSIP_OPTION, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF);

		p_Player->SEND_GOSSIP_MENU(BARADAS_GOSSIP_NPC_TEXT, p_Creature->GetGUID());

		return true;
	}

	bool OnGossipSelect(Player* p_Player, Creature* p_Creature, uint32 p_Sender, uint32 p_Action)
	{
		p_Player->PlayerTalkClass->ClearMenus();

		if (p_Action == GOSSIP_ACTION_INFO_DEF)
		{
			p_Player->CLOSE_GOSSIP_MENU();

			p_Creature->GetAI()->DoAction(ACTION_FIND_JULES_BEGIN);
		}

		return true;
	}

	struct npc_baradaAI : public ScriptedAI
	{
		npc_baradaAI(Creature* creature) : ScriptedAI(creature)
		{
			Initialize();
		}

		void Initialize()
		{
			step = 0;
		}

		void Reset() override
		{
			events.Reset();
			Initialize();

			playerGUID.Clear();
			me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PACIFIED);
			me->CastSpell(me, 153964); // Kneel aura
		}

		void DoAction(int32 action) override
		{
			if (action == ACTION_START_EVENT)
			{
				if (Creature* jules = me->FindNearestCreature(NPC_COLONEL_JULES, 20.0f, true))
				{
					julesGUID = jules->GetGUID();
					jules->AI()->Talk(SAY_JULES_1);
				}

				me->GetMotionMaster()->MovePoint(0, exorcismPos[1]);
				Talk(SAY_BARADA_2);

				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PACIFIED);
			}

			if (action == ACTION_FIND_JULES_BEGIN)
			{
				if (Creature* jules = me->FindNearestCreature(NPC_COLONEL_JULES, 20.0f, true))
				{
					me->RemoveAurasDueToSpell(153964); // Kneel aura
					me->SetFacingToObject(jules);
					me->AI()->Talk(SAY_BARADA_1);
					AddTimedDelayedOperation(3 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->AI()->DoAction(ACTION_START_EVENT);
					});

				}
			}
		}

		void MovementInform(uint32 type, uint32 id) override
		{
			if (type != POINT_MOTION_TYPE)
				return;

			if (id == 0)
				me->GetMotionMaster()->MovePoint(1, exorcismPos[1]);

			if (id == 1)
				events.ScheduleEvent(EVENT_BARADAS_TALK, 1000);
		}

		void JustDied(Unit* /*killer*/) override
		{
			if (Creature* jules = ObjectAccessor::GetCreature(*me, julesGUID))
			{
				jules->AI()->DoAction(ACTION_JULES_MOVE_HOME);
				jules->RemoveAllAuras();
			}
		}

		void UpdateAI(uint32 diff) override
		{
			events.Update(diff);

			while (uint32 eventId = events.ExecuteEvent())
			{
				switch (eventId)
				{
				case EVENT_BARADAS_TALK:
					switch (step)
					{
						case 0:
							me->SetFacingTo(1.513286f);

							me->CastSpell(me, 153964); // Kneel aura
							events.ScheduleEvent(EVENT_BARADAS_TALK, 1000);
							step++;
							break;
						case 1:
							DoCast(SPELL_BARADAS_COMMAND);
							events.ScheduleEvent(EVENT_BARADAS_TALK, 5000);
							step++;
							break;
						case 2:
							Talk(SAY_BARADA_3);
							events.ScheduleEvent(EVENT_BARADAS_TALK, 5000);
							step++;
							break;
						case 3:
							if (Creature* jules = ObjectAccessor::GetCreature(*me, julesGUID))
								jules->AI()->Talk(SAY_JULES_2);

							events.ScheduleEvent(EVENT_BARADAS_TALK, 18000);
							step++;
							break;
						case 4:
							DoCast(SPELL_BARADA_FALTERS);
							me->RemoveAurasDueToSpell(153964); // Kneel aura

							if (Creature* jules = ObjectAccessor::GetCreature(*me, julesGUID))
								jules->AI()->DoAction(ACTION_JULES_HOVER);

							events.ScheduleEvent(EVENT_BARADAS_TALK, 9000);
							step++;
							break;
						case 5:
							if (Creature* jules = ObjectAccessor::GetCreature(*me, julesGUID))
								jules->AI()->Talk(SAY_JULES_3);

							events.ScheduleEvent(EVENT_BARADAS_TALK, 13000);
							step++;
							break;
						case 6:
							Talk(SAY_BARADA_4);
							events.ScheduleEvent(EVENT_BARADAS_TALK, 5000);
							step++;
							break;
						case 7:
							if (Creature* jules = ObjectAccessor::GetCreature(*me, julesGUID))
								jules->AI()->Talk(SAY_JULES_3);

							events.ScheduleEvent(EVENT_BARADAS_TALK, 13000);
							step++;
							break;
						case 8:
							Talk(SAY_BARADA_5);
							events.ScheduleEvent(EVENT_BARADAS_TALK, 12000);
							step++;
							break;
						case 9:
							if (Creature* jules = ObjectAccessor::GetCreature(*me, julesGUID))
								jules->AI()->Talk(SAY_JULES_3);

							events.ScheduleEvent(EVENT_BARADAS_TALK, 13000);
							step++;
							break;
						case 10:
							Talk(SAY_BARADA_5);
							events.ScheduleEvent(EVENT_BARADAS_TALK, 5000);
							step++;
							break;
						case 11:
							if (Creature* jules = ObjectAccessor::GetCreature(*me, julesGUID))
								jules->AI()->DoAction(ACTION_JULES_FLIGHT);

							events.ScheduleEvent(EVENT_BARADAS_TALK, 10000);
							step++;
							break;
						case 12:
							if (Creature* jules = ObjectAccessor::GetCreature(*me, julesGUID))
								jules->AI()->Talk(SAY_JULES_4);

							events.ScheduleEvent(EVENT_BARADAS_TALK, 10000);
							step++;
							break;
						case 13:
							Talk(SAY_BARADA_6);
							events.ScheduleEvent(EVENT_BARADAS_TALK, 10000);
							step++;
							break;
						case 14:
							if (Creature* jules = ObjectAccessor::GetCreature(*me, julesGUID))
								jules->AI()->Talk(SAY_JULES_5);

							events.ScheduleEvent(EVENT_BARADAS_TALK, 10000);
							step++;
							break;
						case 15:
							Talk(SAY_BARADA_3);
							events.ScheduleEvent(EVENT_BARADAS_TALK, 10000);
							step++;
							break;
						case 16:
							if (Creature* jules = ObjectAccessor::GetCreature(*me, julesGUID))
								jules->AI()->Talk(SAY_JULES_4);

							events.ScheduleEvent(EVENT_BARADAS_TALK, 10000);
							step++;
							break;
						case 17:
							Talk(SAY_BARADA_7);
							events.ScheduleEvent(EVENT_BARADAS_TALK, 10000);
							step++;
							break;
						case 18:
							if (Creature* jules = ObjectAccessor::GetCreature(*me, julesGUID))
								jules->AI()->Talk(SAY_JULES_5);

							events.ScheduleEvent(EVENT_BARADAS_TALK, 10000);
							step++;
							break;
						case 19:
							Talk(SAY_BARADA_3);
							events.ScheduleEvent(EVENT_BARADAS_TALK, 10000);
							step++;
							break;
						case 20:
							if (Creature* jules = ObjectAccessor::GetCreature(*me, julesGUID))
							{
								jules->AI()->DoAction(ACTION_JULES_MOVE_HOME);
								jules->RemoveAura(SPELL_JULES_VOMITS_AURA);
							}

							events.ScheduleEvent(EVENT_BARADAS_TALK, 5000);
							step++;
							break;
						case 21:
							//End
							if (Creature* jules = ObjectAccessor::GetCreature(*me, julesGUID))
							{
								CAST_AI(npc_colonel_jules::npc_colonel_julesAI, jules->AI())->success = true;
								jules->RemoveAllAuras();
							}

							me->RemoveAura(SPELL_BARADAS_COMMAND);
							me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PACIFIED);

							Talk(SAY_BARADA_8);
							me->GetMotionMaster()->MoveTargetedHome();
							EnterEvadeMode();
							events.ScheduleEvent(EVENT_RESET, 120000);
							break;
						}
						break;
					case EVENT_RESET:
						if (Creature* jules = ObjectAccessor::GetCreature(*me, julesGUID))
							CAST_AI(npc_colonel_jules::npc_colonel_julesAI, jules->AI())->success = false;
						break;
				}
			}
		}

	private:
		EventMap events;
		uint8 step;
		ObjectGuid julesGUID;
		ObjectGuid playerGUID;
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_baradaAI(creature);
	}
};

/// Force-Commander Gorax - 19264
class npc_force_commander_gorax : public CreatureScript
{
public:
	npc_force_commander_gorax() : CreatureScript("npc_force_commander_gorax") { }
	
	enum eData
	{
		// Spell
		SPELL_SUMMON_CORPSE	= 39012,
		SPELL_INVISIBILITY	= 70414,

		// Gameobject ID
		GOBJECT_GORAX_CORPSE = 185223,
	};

	struct npc_force_commander_goraxAI : public ScriptedAI
	{
		npc_force_commander_goraxAI(Creature* creature) : ScriptedAI(creature) { }
		
		void JustDied(Unit* /*killer*/) override
		{
			
			me->CastSpell(me, SPELL_SUMMON_CORPSE, true);
			me->SetCorpseDelay(300); // 5 minutes to match the temporary summon of gameobject corpse
		}

	};

	CreatureAI* GetAI(Creature* p_Creature) const
	{
		return new npc_force_commander_goraxAI(p_Creature);
	}

};


/// Honor Hold Infernal Attack Event
enum WatchCommanderLeonus
{
	SAY_COVER = 0,
	EVENT_LEONUS_TALK = 1,
	EVENT_INFERNAL_RAIN_ATTACK = 2,
	EVENT_FEAR_CONTROLLER_CAST = 3,
	EVENT_ACTIVE_FALSE = 4,
	NPC_INFERNAL_RAIN = 18729,
	SPELL_INFERNAL_RAIN = 33814,
	NPC_FEAR_CONTROLLER = 19393,
	DATA_ACTIVE = 1,
};

/// Watch-Commander Leonus - 19392
class npc_watch_commander_leonus : public CreatureScript
{
public:
	npc_watch_commander_leonus() : CreatureScript("npc_watch_commander_leonus") { }

	struct npc_watch_commander_leonusAI : public ScriptedAI
	{
		npc_watch_commander_leonusAI(Creature* creature) : ScriptedAI(creature) { }

		void Reset() override
		{
			_events.Reset();
			_events.ScheduleEvent(EVENT_LEONUS_TALK, urand(120000, 600000));
			_events.ScheduleEvent(EVENT_INFERNAL_RAIN_ATTACK, urand(120000, 600000));
			_events.ScheduleEvent(EVENT_FEAR_CONTROLLER_CAST, urand(120000, 600000));
		}

		void SetData(uint32 /*type*/, uint32 data) override
		{
			switch (data)
			{
			case DATA_ACTIVE:
				_events.ScheduleEvent(EVENT_ACTIVE_FALSE, 1000);
				break;
			default:
				break;
			}
		}

		void UpdateAI(uint32 diff) override
		{
			_events.Update(diff);

			while (uint32 eventId = _events.ExecuteEvent())
			{
				switch (eventId)
				{
				case EVENT_LEONUS_TALK:
					Talk(SAY_COVER);
					me->HandleEmoteCommand(EMOTE_ONESHOT_SHOUT);
					break;
				case EVENT_INFERNAL_RAIN_ATTACK:
				{
					std::list<Creature*> infernalrainList;
					JadeCore::AllCreaturesOfEntryInRange checkerInfernalrain(me, NPC_INFERNAL_RAIN, 200.0f);
					JadeCore::CreatureListSearcher<JadeCore::AllCreaturesOfEntryInRange> searcherInfernal(me, infernalrainList, checkerInfernalrain);
					me->VisitNearbyObject(200.0f, searcherInfernal);

					for (Creature* infernal : infernalrainList)
						if (!infernal->IsMoving() && infernal->GetPositionZ() > 118.0f)
							infernal->AI()->SetData(DATA_ACTIVE, DATA_ACTIVE);

					break;
				}
				case EVENT_FEAR_CONTROLLER_CAST:
				{
					std::list<Creature*> fearcontrollerList;
					JadeCore::AllCreaturesOfEntryInRange checkerFear(me, NPC_FEAR_CONTROLLER, 200.0f);
					JadeCore::CreatureListSearcher<JadeCore::AllCreaturesOfEntryInRange> searcherFear(me, fearcontrollerList, checkerFear);
					me->VisitNearbyObject(200.0f, searcherFear);

					for (Creature* fearController : fearcontrollerList)
						fearController->AI()->SetData(DATA_ACTIVE, DATA_ACTIVE);

					break;
				}
				case EVENT_ACTIVE_FALSE:
					_events.ScheduleEvent(EVENT_LEONUS_TALK, 3600000);
					_events.ScheduleEvent(EVENT_INFERNAL_RAIN_ATTACK, 3600000);
					_events.ScheduleEvent(EVENT_FEAR_CONTROLLER_CAST, 3600000);
					break;
				}
			}

			if (!UpdateVictim())
				return;

			DoMeleeAttackIfReady();
		}

	private:
		EventMap _events;
	};
	CreatureAI* GetAI(Creature* p_Creature) const
	{
		return new npc_watch_commander_leonusAI(p_Creature);
	}
};

enum InfernalRainHellfire
{
	EVENT_INFERNAL_RAIN_CAST = 1,
	EVENT_INFERNAL_RAIN_STOP = 2,
	NPC_WATCH_COMMANDER_LEONUS = 19392
};

/// Infernal Rain Hellfire - 18729
class npc_infernal_rain_hellfire : public CreatureScript
{
public:
	npc_infernal_rain_hellfire() : CreatureScript("npc_infernal_rain_hellfire") { }


	struct npc_infernal_rain_hellfireAI : public ScriptedAI
	{
		npc_infernal_rain_hellfireAI(Creature* creature) : ScriptedAI(creature) { }

		void SetData(uint32 /*type*/, uint32 data) override
		{
			switch (data)
			{
			case DATA_ACTIVE:
				_events.ScheduleEvent(EVENT_INFERNAL_RAIN_CAST, urand(1000, 2000));
				_events.ScheduleEvent(EVENT_INFERNAL_RAIN_STOP, 60000);
				break;
			default:
				break;
			}
		}

		void UpdateAI(uint32 diff) override
		{
			_events.Update(diff);

			while (uint32 eventId = _events.ExecuteEvent())
			{
				switch (eventId)
				{
				case EVENT_INFERNAL_RAIN_CAST:
				{
					std::list<Creature*> infernalrainList;
					JadeCore::AllCreaturesOfEntryInRange checker(me, NPC_INFERNAL_RAIN, 200.0f);
					JadeCore::CreatureListSearcher<JadeCore::AllCreaturesOfEntryInRange> searcher(me, infernalrainList, checker);
					me->VisitNearbyObject(200.0f, searcher);

					if (!infernalrainList.empty())
					{
						Creature* random = JadeCore::Containers::SelectRandomContainerElement(infernalrainList);
						if (random->IsMoving() && random->GetPositionZ() < 118.0f)
						{
							me->CastSpell(random, SPELL_INFERNAL_RAIN, true);
						}
					}

					_events.ScheduleEvent(EVENT_INFERNAL_RAIN_CAST, urand(1000, 2000));
					break;
				}
				case EVENT_INFERNAL_RAIN_STOP:
					_events.CancelEvent(EVENT_INFERNAL_RAIN_CAST);
					if (Creature* watchcommanderLeonus = me->FindNearestCreature(NPC_WATCH_COMMANDER_LEONUS, 200))
						watchcommanderLeonus->AI()->SetData(DATA_ACTIVE, DATA_ACTIVE);

					break;
				}
			}
		}

	private:
		EventMap _events;
	};
	CreatureAI* GetAI(Creature* p_Creature) const
	{
		return new npc_infernal_rain_hellfireAI(p_Creature);
	}
};

enum fear_controller
{
	EVENT_FEAR_CAST = 1,
	EVENT_FEAR_STOP = 2,
	SPELL_FEAR = 33815 // Serverside spell
};

/// Fear Controller - 19393
class npc_fear_controller : public CreatureScript
{
public:
	npc_fear_controller() : CreatureScript("npc_fear_controller") { }


	struct npc_fear_controllerAI : public ScriptedAI
	{
		npc_fear_controllerAI(Creature* creature) : ScriptedAI(creature) { }

		void SetData(uint32 /*type*/, uint32 data) override
		{
			if (data == DATA_ACTIVE)
			{
				_events.ScheduleEvent(EVENT_FEAR_CAST, 1000);
				_events.ScheduleEvent(EVENT_FEAR_STOP, 60000);
			}
		}

		void UpdateAI(uint32 diff) override
		{
			_events.Update(diff);

			while (uint32 eventId = _events.ExecuteEvent())
			{
				switch (eventId)
				{
				case EVENT_FEAR_CAST:
					DoCastAOE(SPELL_FEAR);
					_events.RepeatEvent(10000);
					break;
				case EVENT_FEAR_STOP:
					_events.CancelEvent(EVENT_FEAR_CAST);
					break;
				}
			}
		}

	private:
		EventMap _events;
	};
	CreatureAI* GetAI(Creature* p_Creature) const
	{
		return new npc_fear_controllerAI(p_Creature);
	}
};





/*######
## go_haaleshi_altar
######*/

class go_haaleshi_altar : public GameObjectScript
{
public:
	go_haaleshi_altar() : GameObjectScript("go_haaleshi_altar") { }

	bool OnGossipHello(Player* /*player*/, GameObject* go)
	{
		go->SummonCreature(C_AERANAS, -1321.79f, 4043.80f, 116.24f, 1.25f, TEMPSUMMON_TIMED_DESPAWN, 180000);
		return false;
	}
};


/// Force Commander Gorax's Corpse - 185223
class gob_force_commander_gorax_corpse_185223 : public GameObjectScript
{
public:
	gob_force_commander_gorax_corpse_185223() : GameObjectScript("gob_force_commander_gorax_corpse_185223") { }

	struct gob_force_commander_gorax_corpse_185223AI : public GameObjectAI
	{
		gob_force_commander_gorax_corpse_185223AI(GameObject* p_GameObject) : GameObjectAI(p_GameObject) { }

		void Reset() override
		{
			go->EnableCollision(true);
		}
	};

	GameObjectAI* GetAI(GameObject* p_GameObject) const
	{
		return new gob_force_commander_gorax_corpse_185223AI(p_GameObject);
	}
};


#ifndef __clang_analyzer__
void AddSC_hellfire_peninsula()
{
	// Npcs
    new npc_aeranas();
    new npc_ancestral_wolf();
    new npc_naladu();
    new npc_tracy_proudwell();
    new npc_trollbane();
    new npc_wounded_blood_elf();
    new npc_fel_guard_hound();
	new npc_magister_aledis();
	new npc_colonel_jules();
	new npc_barada();
	new npc_force_commander_gorax();
	new npc_watch_commander_leonus();
	new npc_infernal_rain_hellfire();
	new npc_fear_controller();


	// Gameobjects
	new gob_force_commander_gorax_corpse_185223();
	new go_haaleshi_altar();
}
#endif
