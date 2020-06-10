////////////////////////////////////////////////////////////////////////////////
//
// Project-Hellscream https://hellscream.org
// Copyright (C) 2018-2020 Project-Hellscream-6.2
// Discord https://discord.gg/CWCF3C9
//
////////////////////////////////////////////////////////////////////////////////

/// *************************************  Missing Features & Bugs (To do) ************************************* ///
/*
[+] Gadgetzan
1) Gadgetzan Pathing.
2) Megs Dreadshredder and Kelsey Steelspark conversation with Noggenfogger at Gadgetzan.
3) Thunderdrome arena quest testing and fixing of the duplicate objectives (slain + defeated). -- Supposed to be defeated only.
4) Rocket Rescue quest and the butcher bot quests.
5) All NPCs with wrong behavior such as wandering, wrong gossip menus, etc...

[+] Sandsorrow Watch
1) Add final touches to the Gus Rustflutter and Chelsea Rustflutter event.
2) Find Shadow/Void visual for Mazoga during Secrets in the Oasis.
3) Fix Mazoga's Whirlwind ability.

[+] Dunemaul Compound
1) Find the drink spell for the ogres in Maul 'Em With Kindness.


[+] Lost Rigger Cove
1) Implement cannons firing at the docks, Covert Ops Hardsuits and Bilgewater Battlebruiser rushing to the docks and dying to cannons.
2) Test Southsea Taskmaster's timed actionlist (giving orders).
3) Fix Captain Dreadbeard quest and To The Ground quest.
4) Fix Gossip Menus for Megs Dreadshredder and Kelsey Steelspark.

[+] Bootlegger Outpost
1) Fix A Great Idea quest, Just Trying To Kill Some Bugs quest and A Few Good Goblins quest.
2) All NPCs with wrong behavior.

[+] Valley of the Watchers
1) Test NPCs for their behavior, specifically the dwarves.
*/



#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "ScriptedGossip.h"
#include "ScriptedEscortAI.h"
#include "ScriptedFollowerAI.h"

/// Quest Status Handler
class playerScript_tanaris_handler : public PlayerScript
{
public:
	playerScript_tanaris_handler() : PlayerScript("playerScript_tanaris_handler") { }
	
	enum eMisc
	{
		/// ******* Secrets in the Oasis ******* ///
		QUEST_SECRETS_IN_OASIS	= 25032, 
		ITEM_WET_SAND_OASIS		= 52074,
		NPC_MAZOGA				= 38968,

		/// Actions
		JustSpawned = 0,
	};

	void OnItemLooted(Player* p_Player, Item* p_Item) override
	{
		if (p_Item->GetEntry() == 52074) // Wet Sand
			if (p_Player->GetQuestStatus(QUEST_SECRETS_IN_OASIS) == QUEST_STATUS_INCOMPLETE)
			{
				Position const MazogaPos = { -7435.8999f, -2880.4500f, 8.7937f, 3.281220f };

				if (Creature* Mazoga = p_Player->SummonCreature(NPC_MAZOGA, MazogaPos, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 60000)) // Mazoga
				{
					Mazoga->LoadEquipment(1, true); // Swords - Default equipment
					Mazoga->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
					Mazoga->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PC);
					Mazoga->GetAI()->DoAction(JustSpawned);
				}
			}
	}

	void UpdatePhaseMask(Player* p_Player)
	{
		/// UPDATE PHASEMASK DEPENDING OF QUESTS
		uint32 l_PhaseMask = p_Player->GetPhaseMask();
		uint32 p_NewAreaId = p_Player->GetAreaId();

		if (p_NewAreaId == 979) // Sandsorrow Watch
		{

			if (p_Player->GetQuestStatus(25032) == QUEST_STATUS_INCOMPLETE) // Secrets in the Oasis - Mazoga betrays player.
			{
				p_Player->AddAura(49416, p_Player); // Invisibility Detection (7) - to detect Mazoga (has spell 49414)
			}
			
			if (p_Player->GetQuestStatus(25032) == QUEST_STATUS_COMPLETE || QUEST_STATUS_REWARDED) // Secrets in the Oasis - Mazoga betrays player.
			{
				p_Player->RemoveAurasDueToSpell(49416, p_Player->GetGUID()); // Remove Invisibility Detection (7) - to not see Mazoga (has spell 49414) after he betrays player.
			}

			p_Player->SetPhaseMask(l_PhaseMask, true);
		}
	}

	void OnUpdateZone(Player* p_Player, uint32 p_NewZoneId, uint32 p_OldZoneID, uint32 p_NewAreaId) override
	{
		if (p_NewAreaId == 979) // Sandsorrow Watch
		{
			uint32 l_PhaseMask = p_Player->GetPhaseMask();

			if (p_Player->GetQuestStatus(25032) == QUEST_STATUS_INCOMPLETE) // Secrets in the Oasis - Mazoga betrays player.
			{
				p_Player->AddAura(49416, p_Player); // Invisibility Detection (32) - to detect Mazoga (has spell 94224)
			}

			if (p_Player->GetQuestStatus(25032) == QUEST_STATUS_COMPLETE || QUEST_STATUS_REWARDED) // Secrets in the Oasis - Mazoga betrays player.
			{
				p_Player->RemoveAurasDueToSpell(49416, p_Player->GetGUID()); // Remove Invisibility Detection (32) - to not see Mazoga (has spell 94224) after he betrays player.
			}

			p_Player->SetPhaseMask(l_PhaseMask, true);
		}
	}

	void OnLogin(Player* p_Player) override
	{
		if (p_Player->GetZoneId() == 440) // Tanaris
			UpdatePhaseMask(p_Player);
	}

	void OnQuestAbandon(Player* p_Player, const Quest* /*p_Quest*/) override
	{
		if (p_Player->GetZoneId() == 440) // Tanaris
			UpdatePhaseMask(p_Player);
	}

	void OnQuestComplete(Player* p_Player, const Quest* p_Quest) override
	{
		if (p_Player->GetZoneId() == 440) // Tanaris
			UpdatePhaseMask(p_Player);
	}

};


/// Custodian of Time
enum CustodianOfTime
{
    WHISPER_CUSTODIAN_1     = 0,
    WHISPER_CUSTODIAN_2     = 1,
    WHISPER_CUSTODIAN_3     = 2,
    WHISPER_CUSTODIAN_4     = 3,
    WHISPER_CUSTODIAN_5     = 4,
    WHISPER_CUSTODIAN_6     = 5,
    WHISPER_CUSTODIAN_7     = 6,
    WHISPER_CUSTODIAN_8     = 7,
    WHISPER_CUSTODIAN_9     = 8,
    WHISPER_CUSTODIAN_10    = 9,
    WHISPER_CUSTODIAN_11    = 10,
    WHISPER_CUSTODIAN_12    = 11,
    WHISPER_CUSTODIAN_13    = 12,
    WHISPER_CUSTODIAN_14    = 13
};

class npc_custodian_of_time : public CreatureScript
{
public:
    npc_custodian_of_time() : CreatureScript("npc_custodian_of_time") { }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_custodian_of_timeAI(creature);
    }

    struct npc_custodian_of_timeAI : public npc_escortAI
    {
        npc_custodian_of_timeAI(Creature* creature) : npc_escortAI(creature) {}

        void WaypointReached(uint32 waypointId)
        {
            if (Player* player = GetPlayerForEscort())
            {
                switch (waypointId)
                {
                case 0:
                    Talk(WHISPER_CUSTODIAN_1, player->GetGUID());
                    break;
                case 1:
                    Talk(WHISPER_CUSTODIAN_2, player->GetGUID());
                    break;
                case 2:
                    Talk(WHISPER_CUSTODIAN_3, player->GetGUID());
                    break;
                case 3:
                    Talk(WHISPER_CUSTODIAN_4, player->GetGUID());
                    break;
                case 5:
                    Talk(WHISPER_CUSTODIAN_5, player->GetGUID());
                    break;
                case 6:
                    Talk(WHISPER_CUSTODIAN_6, player->GetGUID());
                    break;
                case 7:
                    Talk(WHISPER_CUSTODIAN_7, player->GetGUID());
                    break;
                case 8:
                    Talk(WHISPER_CUSTODIAN_8, player->GetGUID());
                    break;
                case 9:
                    Talk(WHISPER_CUSTODIAN_9, player->GetGUID());
                    break;
                case 10:
                    Talk(WHISPER_CUSTODIAN_4, player->GetGUID());
                    break;
                case 13:
                    Talk(WHISPER_CUSTODIAN_10, player->GetGUID());
                    break;
                case 14:
                    Talk(WHISPER_CUSTODIAN_4, player->GetGUID());
                    break;
                case 16:
                    Talk(WHISPER_CUSTODIAN_11, player->GetGUID());
                    break;
                case 17:
                    Talk(WHISPER_CUSTODIAN_12, player->GetGUID());
                    break;
                case 18:
                    Talk(WHISPER_CUSTODIAN_4, player->GetGUID());
                    break;
                case 22:
                    Talk(WHISPER_CUSTODIAN_13, player->GetGUID());
                    break;
                case 23:
                    Talk(WHISPER_CUSTODIAN_4, player->GetGUID());
                    break;
                case 24:
                    Talk(WHISPER_CUSTODIAN_14, player->GetGUID());
                    DoCast(player, 34883);
                    // below here is temporary workaround, to be removed when spell works properly
                    player->AreaExploredOrEventHappens(10277);
                    break;
                }
            }
        }

        void MoveInLineOfSight(Unit* who)
        {
            if (HasEscortState(STATE_ESCORT_ESCORTING))
                return;

            if (who->IsPlayer())
            {
                if (who->HasAura(34877) && CAST_PLR(who)->GetQuestStatus(10277) == QUEST_STATUS_INCOMPLETE)
                {
                    float Radius = 10.0f;
                    if (me->IsWithinDistInMap(who, Radius))
                    {
                        Start(false, false, who->GetGUID());
                    }
                }
            }
        }

        void EnterCombat(Unit* /*who*/) {}
        void Reset() {}

        void UpdateAI(const uint32 diff)
        {
            npc_escortAI::UpdateAI(diff);
        }
    };

};

/// Steward of Time
#define GOSSIP_ITEM_FLIGHT  "Please take me to the master's lair."

class npc_steward_of_time : public CreatureScript
{
public:
    npc_steward_of_time() : CreatureScript("npc_steward_of_time") { }

    bool OnQuestAccept(Player* player, Creature* /*creature*/, Quest const* quest)
    {
        if (quest->GetQuestId() == 10279)                      //Quest: To The Master's Lair
            player->CastSpell(player, 34891, true);               //(Flight through Caverns)

        return false;
    }

    bool OnGossipSelect(Player* player, Creature* /*creature*/, uint32 /*sender*/, uint32 action)
    {
        player->PlayerTalkClass->ClearMenus();
        if (action == GOSSIP_ACTION_INFO_DEF + 1)
            player->CastSpell(player, 34891, true);               //(Flight through Caverns)

        return true;
    }

    bool OnGossipHello(Player* player, Creature* creature)
    {
        if (creature->isQuestGiver())
            player->PrepareQuestMenu(creature->GetGUID());

        if (player->GetQuestStatus(10279) == QUEST_STATUS_INCOMPLETE || player->GetQuestRewardStatus(10279))
        {
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ITEM_FLIGHT, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
            player->SEND_GOSSIP_MENU(9978, creature->GetGUID());
        }
        else
            player->SEND_GOSSIP_MENU(9977, creature->GetGUID());

        return true;
    }

};



/// 00X17/
enum Npc00X17
{
    //texts are signed for 7806
    SAY_OOX_START           = -1000287,
    SAY_OOX_AGGRO1          = -1000288,
    SAY_OOX_AGGRO2          = -1000289,
    SAY_OOX_AMBUSH          = -1000290,
    SAY_OOX17_AMBUSH_REPLY  = -1000291,
    SAY_OOX_END             = -1000292,

    Q_OOX17                 = 648,
    SPAWN_FIRST             = 7803,
    SPAWN_SECOND_1          = 5617,
    SPAWN_SECOND_2          = 7805
};

class npc_OOX17 : public CreatureScript
{
public:
    npc_OOX17() : CreatureScript("npc_OOX17") { }

    bool OnQuestAccept(Player* player, Creature* creature, Quest const* quest)
    {
        if (quest->GetQuestId() == Q_OOX17)
        {
            creature->setFaction(113);
            creature->SetFullHealth();
            creature->SetUInt32Value(UNIT_FIELD_ANIM_TIER, 0);
            creature->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PC);
            DoScriptText(SAY_OOX_START, creature);

            if (npc_escortAI* pEscortAI = CAST_AI(npc_OOX17::npc_OOX17AI, creature->AI()))
                pEscortAI->Start(true, false, player->GetGUID());
        }
        return true;
    }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_OOX17AI(creature);
    }

    struct npc_OOX17AI : public npc_escortAI
    {
        npc_OOX17AI(Creature* creature) : npc_escortAI(creature) {}

        void WaypointReached(uint32 waypointId)
        {
            if (Player* player = GetPlayerForEscort())
            {
                switch (waypointId)
                {
                    case 23:
                        me->SummonCreature(SPAWN_FIRST, -8350.96f, -4445.79f, 10.10f, 6.20f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 25000);
                        me->SummonCreature(SPAWN_FIRST, -8355.96f, -4447.79f, 10.10f, 6.27f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 25000);
                        me->SummonCreature(SPAWN_FIRST, -8353.96f, -4442.79f, 10.10f, 6.08f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 25000);
                        DoScriptText(SAY_OOX_AMBUSH, me);
                        break;
                    case 56:
                        me->SummonCreature(SPAWN_SECOND_1, -7510.07f, -4795.50f, 9.35f, 6.06f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 25000);
                        me->SummonCreature(SPAWN_SECOND_2, -7515.07f, -4797.50f, 9.35f, 6.22f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 25000);
                        me->SummonCreature(SPAWN_SECOND_2, -7518.07f, -4792.50f, 9.35f, 6.22f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 25000);
                        DoScriptText(SAY_OOX_AMBUSH, me);
                        if (Unit* scoff = me->FindNearestCreature(SPAWN_SECOND_2, 30))
                            DoScriptText(SAY_OOX17_AMBUSH_REPLY, scoff);
                        break;
                    case 86:
                        DoScriptText(SAY_OOX_END, me);
                        player->GroupEventHappens(Q_OOX17, me);
                        break;
                }
            }
        }

        void Reset(){}

        void EnterCombat(Unit* /*who*/)
        {
            DoScriptText(RAND(SAY_OOX_AGGRO1, SAY_OOX_AGGRO2), me);
        }

        void JustSummoned(Creature* summoned)
        {
            summoned->AI()->AttackStart(me);
        }
    };
};

/// Dunemaul ogres - 5471, 5472, 5473, 5474, 5475
/// To Do: Find spell drink for quest Maul 'Em With Kindness event.
class npc_dunemaul_ogres_unchartered : public CreatureScript
{
public:
	npc_dunemaul_ogres_unchartered() : CreatureScript("npc_dunemaul_ogres_unchartered") { }

	enum eMisc
	{
		// Gossip Menus
		GOSSIP_MENU_ID	= 11093,
		GOSSIP_OPTION	= 0,
		NPC_TEXT		= 15435,

		// Quests
		QUEST_UNCHARTERED				= 24955,
		KILL_CREDIT						= 38848,
		QUEST_MAUL_EM_WITH_KINDNESS		= 24963,
		KILL_CREDIT_KINDNESS			= 39073,

		// NPCs
		NPC_DUNEMAUL_OGRE				= 5471,
		NPC_DUNEMAUL_ENFORCER			= 5472,
		NPC_DUNEMAUL_OGRE_MAGE			= 5473,
		NPC_DUNEMAUL_BRUTE				= 5474,
		NPC_DUNEMAUL_WARLOCK			= 5475,


		// Spells
		SPELL_THROW_MORSEL				= 73068,
		SPELL_COSMETIC_DRINK			= 70620,
		SPELL_HEROIC_STRIKE				= 25710,
		SPELL_DEMORALIZING_SHOUT		= 13730,
		SPELL_FIREBALL_BOLT				= 9053, // CastFlags: 64
		SPELL_SLOW						= 11436, // CastFlags: 1 -- Interrupt Previous
		SPELL_BLOODLUST					= 6742,
		SPELL_UPPERCUT					= 10966,
		SPELL_SHADOWBOLT				= 9613, // CastFlags: 64
		SPELL_CURSE_OF_THORNS			= 6909, // CastFlags: 1 -- Interrupt Previous

		// Actions
		HasBeenFed						= 9999,

		// Events
		EVENT_HEROIC_STRIKE				= 1,
		EVENT_CHECK_RNG_SHOUT			= 2, 
		EVENT_DEMORALIZING_SHOUT		= 3,
		EVENT_FIREBALL_BOLT				= 4,
		EVENT_SLOW						= 5,
		EVENT_BLOODLUST					= 6,
		EVENT_UPPERCUT					= 7,
		EVENT_SHADOWBOLT				= 8,
		EVENT_CURSE_OF_THORNS			= 9,
		EVENT_CHECK_RNG_CUT				= 10,
		EVENT_CHECK_RNG_STRIKE			= 11,
	};

	bool OnGossipSelect(Player* player, Creature* creature, uint32 /*sender*/, uint32 action)
	{
		player->PlayerTalkClass->ClearMenus();
		if (action == GOSSIP_ACTION_INFO_DEF + 1)
		{
			player->CLOSE_GOSSIP_MENU();
			player->KilledMonsterCredit(KILL_CREDIT);
			creature->SetFacingToObject(player);
			creature->AI()->Talk(1);
			creature->RemoveFlag(UNIT_FIELD_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP);
			creature->ForcedDespawn(3000);
		}
			

		return true;
	}

	bool OnGossipHello(Player* player, Creature* creature)
	{
		if (player->GetQuestStatus(QUEST_UNCHARTERED) == QUEST_STATUS_INCOMPLETE)
		{
			player->ADD_GOSSIP_ITEM_DB(GOSSIP_MENU_ID, GOSSIP_OPTION, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
			player->SEND_GOSSIP_MENU(NPC_TEXT, creature->GetGUID());
		}
		else
			player->SEND_GOSSIP_MENU(NPC_TEXT, creature->GetGUID());

		return true;
	}
	struct npc_dunemaul_ogres_uncharteredAI : public ScriptedAI
	{
		npc_dunemaul_ogres_uncharteredAI(Creature* creature) : ScriptedAI(creature) {}

		uint8 counter;
		bool fed;


		void Reset() override
		{
			events.Reset();
			ClearDelayedOperations();
			counter = 0;
			fed = false;
		}

		void EnterCombat(Unit* who)
		{
			switch (me->GetEntry()) // Abilities depending on entry.
				{
				case NPC_DUNEMAUL_OGRE:
					events.ScheduleEvent(EVENT_CHECK_RNG_STRIKE, urand(4000, 6000));
					break;
				case NPC_DUNEMAUL_ENFORCER:
					events.ScheduleEvent(EVENT_CHECK_RNG_SHOUT, urand(4000, 6000));
					break;
				case NPC_DUNEMAUL_OGRE_MAGE:
					events.ScheduleEvent(EVENT_FIREBALL_BOLT, 0);
					events.ScheduleEvent(EVENT_SLOW, urand(6000, 9000));
					break;
				case NPC_DUNEMAUL_BRUTE:
					events.ScheduleEvent(EVENT_CHECK_RNG_CUT, urand(4000, 6000));
					break;
				case NPC_DUNEMAUL_WARLOCK:
					events.ScheduleEvent(EVENT_SHADOWBOLT, 0);
					events.ScheduleEvent(EVENT_CURSE_OF_THORNS, urand(5000, 9000));
					break;
				default:
					break;
				}

			switch (urand(0, 4)) // 25% chance -- hackfix -- couldn't find the way to actually make it 25% probability across all of the identifiers in the 0 groupid.
			{
				case 3:
					Talk(0, who->GetGUID());
					break;
			}
		}

		void DamageTaken(Unit* doneBy, uint32& damage, SpellInfo const* /*p_SpellInfo*/) override
		{
			if (me->GetHealthPct() <= 35.0f)
			{
				if (doneBy->ToPlayer())
					if (doneBy->ToPlayer()->GetQuestStatus(QUEST_MAUL_EM_WITH_KINDNESS) == QUEST_STATUS_INCOMPLETE)
						if (counter == 0)
							Talk(3); // ready to be fed.
							counter++;
						
			
			}

			if (me->GetHealthPct() <= 30.0f && me->GetEntry() == NPC_DUNEMAUL_OGRE_MAGE)
					events.ScheduleEvent(EVENT_BLOODLUST, 0);
		}

		void SpellHit(Unit* Caster, const SpellInfo* Spell) override
		{
			Player* player = Caster->ToPlayer();

			if (player && Spell->Id == SPELL_THROW_MORSEL)
				if (player->GetQuestStatus(QUEST_MAUL_EM_WITH_KINDNESS) == QUEST_STATUS_INCOMPLETE)
					if (me->GetHealthPct() <= 35.0f && !fed)
					{
						fed = true;
						me->GetAI()->DoAction(HasBeenFed);
						player->SetTarget(0); // Clear target
						player->KilledMonsterCredit(KILL_CREDIT_KINDNESS);
					}

						

		}


		void UpdateAI(const uint32 diff) override
		{
			UpdateOperations(diff);

			if (!UpdateVictim())
				return;

			events.Update(diff);

			if (me->HasUnitState(UNIT_STATE_CASTING))
				return;

			while (uint32 eventId = events.ExecuteEvent())
			{
				switch (eventId)
				{
				case EVENT_CHECK_RNG_STRIKE: // Check Range, if it's less than 5 yrds then schedule a strike event.
					if (me->IsWithinDistInMap(me->getVictim(), 5.0f))
					{
						events.ScheduleEvent(EVENT_HEROIC_STRIKE, 0);
						break;
					}
					events.ScheduleEvent(EVENT_CHECK_RNG_STRIKE, urand(4000, 6000));
					break;

				case EVENT_CHECK_RNG_CUT: // Check Range, if it's less than 5 yrds then schedule a strike event.
					if (me->IsWithinDistInMap(me->getVictim(), 5.0f))
					{
						events.ScheduleEvent(EVENT_UPPERCUT, 0);
						break;
					}
					events.ScheduleEvent(EVENT_CHECK_RNG_CUT, urand(4000, 6000));
					break;

				case EVENT_CHECK_RNG_SHOUT: // Check Range, if it's less than 10 yrds then schedule a shout event.
					if (me->IsWithinDistInMap(me->getVictim(), 10.0f))
					{
						events.ScheduleEvent(EVENT_DEMORALIZING_SHOUT, 0);
						break;
					}
					events.ScheduleEvent(EVENT_CHECK_RNG_SHOUT, urand(4000, 6000));
					break;


				case EVENT_HEROIC_STRIKE:
					DoCastVictim(SPELL_HEROIC_STRIKE);
					events.ScheduleEvent(EVENT_CHECK_RNG_STRIKE, urand(12000, 12800));
					break;


				case EVENT_DEMORALIZING_SHOUT:
					DoCast(me, SPELL_DEMORALIZING_SHOUT, true);
					events.ScheduleEvent(EVENT_CHECK_RNG_SHOUT, urand(24000, 26000));
					break;


				case EVENT_FIREBALL_BOLT:
					DoCastVictim(SPELL_FIREBALL_BOLT);
					events.ScheduleEvent(EVENT_FIREBALL_BOLT, urand(3400, 4700));
					break;

				case EVENT_SLOW:
					if (me->HasUnitState(UNIT_STATE_CASTING))
						me->CastStop();

					DoCastVictim(SPELL_SLOW);
					events.ScheduleEvent(EVENT_SLOW, urand(18000, 19000));
					break;

				case EVENT_BLOODLUST:
					DoCast(me, SPELL_BLOODLUST, true);
					break;

				case EVENT_UPPERCUT:
					DoCastVictim(SPELL_UPPERCUT);
					events.ScheduleEvent(EVENT_CHECK_RNG_STRIKE, urand(16000, 18000));
					break;

				case EVENT_SHADOWBOLT:
					DoCastVictim(SPELL_SHADOWBOLT);
					events.ScheduleEvent(EVENT_SHADOWBOLT, urand(3400, 4700));
					break;

				case EVENT_CURSE_OF_THORNS:
					if (me->HasUnitState(UNIT_STATE_CASTING))
						me->CastStop();

					DoCastVictim(SPELL_CURSE_OF_THORNS);
					events.ScheduleEvent(EVENT_CURSE_OF_THORNS, urand(15000, 17800));
					break;
				}
			}

			DoMeleeAttackIfReady();
		}

		void DoAction(int32 const p_Action) override
		{
			switch (p_Action)
			{
				case HasBeenFed:
					AddTimedDelayedOperation(0.5 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->setFaction(35); // Friendly Faction
						me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
						me->RemoveFlag(UNIT_FIELD_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP);
						//DoCast(SPELL_COSMETIC_DRINK); -- To do: find the drink spell ID for the ogres. This one isn't working.
					});
					AddTimedDelayedOperation(3 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						Talk(2); // Me sorry! no hurt!

						float x, y, z;
						me->GetClosePoint(x, y, z, me->GetObjectSize() / 3, 20.0f);
						me->UpdateSpeed(UnitMoveType::MOVE_RUN, true);
						me->GetMotionMaster()->MovePoint(1, x, y, z);
						me->DespawnOrUnsummon(2500);
					});
					break;
			}
		}
			


	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_dunemaul_ogres_uncharteredAI(creature);
	}

};


/// Megs Dreadshredder - 38849
class npc_megs_dreadshredder_38849: public CreatureScript
{
public:
	npc_megs_dreadshredder_38849() : CreatureScript("npc_megs_dreadshredder_38849") { }

	enum eMisc
	{
		// Quest
		QUEST_UNCHARTERED	= 24955,

		// Npc
		NPC_DUNEMAUL_EMISSARY = 38856,

		// Actions
		QuestComplete		= 0,
	};

	bool OnQuestComplete(Player* player, Creature* creature, Quest const* quest) override
	{
		if (quest->GetQuestId() == QUEST_UNCHARTERED)
		{
			creature->GetAI()->DoAction(QuestComplete);
		}
		

		return true;
	}

	struct npc_megs_dreadshredder_38849AI : public ScriptedAI
	{
		npc_megs_dreadshredder_38849AI(Creature* creature) : ScriptedAI(creature) {}

		void Reset() override
		{
			ClearDelayedOperations();
		}


		void UpdateAI(uint32 const p_Diff) override
		{
			UpdateOperations(p_Diff);
		}


		void DoAction(int32 const p_Action) override
		{
			switch (p_Action)
			{
				case QuestComplete:
					AddTimedDelayedOperation(0.5 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->AI()->Talk(0);
					});
					AddTimedDelayedOperation(7 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						if (Creature* ogre = me->FindNearestCreature(NPC_DUNEMAUL_EMISSARY, 10.0f, true))
							ogre->AI()->Talk(0);
					});
					AddTimedDelayedOperation(11 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->AI()->Talk(1); // Sighs
					});
					AddTimedDelayedOperation(15 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->AI()->Talk(2); // WHAT OGRE LIKE.
					});
					AddTimedDelayedOperation(20 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						if (Creature* ogre = me->FindNearestCreature(NPC_DUNEMAUL_EMISSARY, 10.0f, true))
							ogre->AI()->Talk(1); // Oh. Ogre like eat bug.
					});
					AddTimedDelayedOperation(24 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->AI()->Talk(3); // The Silithid?
					});
					break;
				default:
					break;
			}
		}

	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_megs_dreadshredder_38849AI(creature);
	}

};




/// Mazoga - 38968 -- Secrets in the Oasis
/// To Do: Find shadow visual in StartTalk
class npc_mazoga_38968 : public CreatureScript
{
public:
	npc_mazoga_38968() : CreatureScript("npc_mazoga_38968") { }

	enum eMisc
	{
		// Quest
		QUEST_SECRETS_IN_THE_OASIS = 25032,

		// Npcs
		NPC_KILL_CREDIT_OASIS = 39159,

		// Spells
		SPELL_WHIRLWIND			= 41056,
		SPELL_WHIRLWIND_DMG		= 41057,
		SPELL_VANISH			= 35205,

		// Actions
		JustSpawned = 0,
		StartTalk	= 1,
		Escape		= 2,

		// Event
		EVENT_WHIRLWIND		= 99999,
	};

	struct npc_mazoga_38968AI : public ScriptedAI
	{
		npc_mazoga_38968AI(Creature* creature) : ScriptedAI(creature) {
			m_PlayerGUID = 0;
		}

		uint64 m_PlayerGUID;

		void Reset() override
		{
			events.Reset();
			ClearDelayedOperations();
		}

		void MovementInform(uint32 type, uint32 id) override
		{

			if (type == POINT_MOTION_TYPE && id == 1)
			{
				me->GetAI()->DoAction(StartTalk);
			}
		}

		void EnterCombat(Unit* /*p_Attacker*/) override
		{
			events.ScheduleEvent(EVENT_WHIRLWIND, urand(0, 3000));
		}

		void DamageTaken(Unit* doneBy, uint32& damage, SpellInfo const*  /*p_SpellInfo*/) override
		{
			if (doneBy->ToPlayer())
				if (me->GetHealth() <= damage || me->GetHealth() <= 1.0f)
				{
					damage = 0;
					me->GetAI()->DoAction(Escape);
				}	
		}

		void IsSummonedBy(Unit* summoner) override
		{
			if (Player* playerSummoner = summoner->ToPlayer())
			{
				m_PlayerGUID = playerSummoner->GetGUID();
			}
		}


		void DoAction(int32 const p_Action) override
		{
			switch (p_Action)
			{
				case JustSpawned:
					AddTimedDelayedOperation(0 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						if (Player* player = sObjectAccessor->GetPlayer(*me, m_PlayerGUID))
							if (player->GetQuestStatus(QUEST_SECRETS_IN_THE_OASIS) == QUEST_STATUS_INCOMPLETE)
							{
								Position l_Pos;
								player->GetPosition(&l_Pos);
								GetPositionWithDistInFront(player, 4.0f, l_Pos);

								float z = player->GetMap()->GetHeight(player->GetPhaseMask(), l_Pos.GetPositionX(), l_Pos.GetPositionY(), l_Pos.GetPositionZ());
								l_Pos.m_positionZ = z;
								me->GetMotionMaster()->MovePoint(1, l_Pos);
							}
						
					});
					break;
				case StartTalk:
					AddTimedDelayedOperation(0 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->AI()->Talk(0); // Joke's on you, mon
					});
					AddTimedDelayedOperation(7 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->AI()->Talk(1); // Now dat Sang'thraze 
					});
					AddTimedDelayedOperation(13 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->AI()->Talk(2); // Behold! Sang'thraze
						me->LoadEquipment(2, true); // Sang'thraze - Item ID 9372
						me->HandleEmoteCommand(EMOTE_STATE_READY2H);
					});
					AddTimedDelayedOperation(19 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						// Remove Flags
						me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
						me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PC);

						// Find the player that summoned the creature from the PlayerScript Handler
						if (Player* player = sObjectAccessor->GetPlayer(*me, m_PlayerGUID))
							if (player->GetQuestStatus(QUEST_SECRETS_IN_THE_OASIS) == QUEST_STATUS_INCOMPLETE)
							{
								me->HandleEmoteCommand(EMOTE_ONESHOT_NONE); // Remove emote
								me->CombatStart(player);
							}				
					});
					break;
				case Escape:
					AddTimedDelayedOperation(0 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->AI()->Talk(3); // Enough'a dis...

						if (Player* playerQuest = sObjectAccessor->GetPlayer(*me, m_PlayerGUID))
						{
							playerQuest->KilledMonsterCredit(NPC_KILL_CREDIT_OASIS);
							playerQuest->CombatStop();
						}
							
						// Flags
						me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
						me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PC);
						me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PACIFIED);

						// Stop health regeneration and remove all auras.
						me->RemoveAllAuras();
						me->setRegeneratingHealth(false);

						// Stop and root
						events.CancelEvent(EVENT_WHIRLWIND);
						me->AttackStop();
						me->HandleEmoteCommand(EMOTE_STATE_READY2H);
						if (!me->HasUnitState(UNIT_STATE_ROOT))
							me->AddUnitState(UNIT_STATE_ROOT);
					});
					AddTimedDelayedOperation(8 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->CastSpell(me, SPELL_VANISH);
						me->DespawnOrUnsummon(200);
					});
					break;
				default:
					break;
				}
		}

		void UpdateAI(const uint32 diff) override
		{
			UpdateOperations(diff);

			if (!UpdateVictim())
				return;

			events.Update(diff);

			if (me->HasUnitState(UNIT_STATE_CASTING))
				return;

			while (uint32 eventId = events.ExecuteEvent())
			{
				switch (eventId)
				{
				case EVENT_WHIRLWIND:
					DoCastVictim(SPELL_WHIRLWIND);
					events.ScheduleEvent(EVENT_WHIRLWIND, urand(6000, 8000));
					break;
				}
			}

			DoMeleeAttackIfReady();
		}

	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_mazoga_38968AI(creature);
	}

};



/// Gus Rustflutter - 40580
class npc_gus_rustflutter : public CreatureScript
{
public:
	npc_gus_rustflutter() : CreatureScript("npc_gus_rustflutter") { }

	enum eMisc
	{
		// Quest
		QUEST_IM_WITH_SCORPID = 25521,
		QUEST_GARGANTAPID	  = 25522,

		// Npc
		NPC_CHELSEA_RUSTFLUTTER = 40582,

		// Actions
		ScorpidQuestComplete	 = 0,
		GargantapidQuestComplete = 1,
		StartTalk				 = 2,
	};

	bool OnQuestComplete(Player* player, Creature* creature, Quest const* quest) override
	{
		if (quest->GetQuestId() == QUEST_IM_WITH_SCORPID)
		{
			creature->GetAI()->DoAction(ScorpidQuestComplete);
		}

		if (quest->GetQuestId() == QUEST_GARGANTAPID)
		{
			creature->GetAI()->DoAction(GargantapidQuestComplete);
		}


		return true;
	}

	struct npc_gus_rustflutterAI : public ScriptedAI
	{
		npc_gus_rustflutterAI(Creature* creature) : ScriptedAI(creature) {}

		uint32 timer;
		uint32 phase;
		bool GivenOrder;
		bool ConversationActive;

		void MoveInLineOfSight(Unit* who)
		{
			if (!who || !who->isAlive() || GivenOrder)
				return;

			if (who->ToPlayer() && me->IsWithinDistInMap(who, 15.0f))
			{
				Player* player = who->ToPlayer();
				if (player->GetQuestStatus(QUEST_GARGANTAPID) == QUEST_STATUS_INCOMPLETE || QUEST_STATUS_COMPLETE) // If the quest wasn't rewarded.
				{
					me->GetAI()->DoAction(StartTalk);
					GivenOrder = true;
					timer = 2000;
					phase++;
				}
			}
		}


		void Reset() override
		{
			ClearDelayedOperations();
			timer = 0;
			phase = 0;
			GivenOrder = false;
			ConversationActive = false;
		}


		void UpdateAI(uint32 diff) override
		{

			UpdateOperations(diff);

			if (!UpdateVictim())
			{
				if (GivenOrder)
				{

					if (timer <= diff)
					{
						switch (phase)
						{
							case 1:
								timer = 58000;
								phase++;
								break;
							case 2:
								// reset
								timer = 0;
								phase = 0;
								GivenOrder = false;
								break;
						}

					}
					else
						timer -= diff;
				}

			}
			else
				DoMeleeAttackIfReady();
		}


		void DoAction(int32 const p_Action) override
		{
			switch (p_Action)
			{
				case ScorpidQuestComplete:
				{
					if (ConversationActive)
						break;

					AddTimedDelayedOperation(0.2 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						GivenOrder = true; // Stop normal LOS conversation
						ConversationActive = true; // Prevent this conversation running once more if it's undergoing.
						me->HandleEmoteCommand(EMOTE_ONESHOT_USESTANDING);
						me->AI()->Talk(1); // Here we go
					});
					AddTimedDelayedOperation(4 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->AI()->Talk(2); // Chelsea, baby, please drink this.
					});
					AddTimedDelayedOperation(8 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						if (Creature* chelsea = me->FindNearestCreature(NPC_CHELSEA_RUSTFLUTTER, 10.0f, true))
						{
							chelsea->AI()->Talk(1); // Hmm? Okay...
							chelsea->CastSpell(chelsea, 154242, true); // Drink on ground
						}
					});
					AddTimedDelayedOperation(10 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						if (Creature* chelsea = me->FindNearestCreature(NPC_CHELSEA_RUSTFLUTTER, 10.0f, true))
						{
							chelsea->CastStop(154242); // Drink on ground
						}
					});
					AddTimedDelayedOperation(11 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						if (Creature* chelsea = me->FindNearestCreature(NPC_CHELSEA_RUSTFLUTTER, 10.0f, true))
						{
							chelsea->HandleEmoteCommand(EMOTE_ONESHOT_STAND_VAR1);
							chelsea->AI()->Talk(2); // What is this?
						}
					});
					AddTimedDelayedOperation(14 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						if (Creature* chelsea = me->FindNearestCreature(NPC_CHELSEA_RUSTFLUTTER, 10.0f, true))
						{
							chelsea->HandleEmoteCommand(EMOTE_ONESHOT_NONE);
							chelsea->RemoveAllAuras(); // Goes back to sleep
						}
						GivenOrder = false; // resume normal LOS conversation
						ConversationActive = false; // Reset conversation for the other players.
					});
					break;
				}
				case GargantapidQuestComplete:
				{
					if (ConversationActive)
						break;

					AddTimedDelayedOperation(1 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						GivenOrder = true; // Stop normal LOS conversation
						ConversationActive = true; // Prevent this conversation running once more if it's undergoing.
						me->AI()->Talk(3); // Chelsea, baby, sit up!
					});
					AddTimedDelayedOperation(6 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						if (Creature* chelsea = me->FindNearestCreature(NPC_CHELSEA_RUSTFLUTTER, 10.0f, true))
						{
							chelsea->AI()->Talk(3); // Urgh. Gus
						}
					});
					AddTimedDelayedOperation(13 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->AI()->Talk(4); // ...food poisoning?
					});
					AddTimedDelayedOperation(18 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						if (Creature* chelsea = me->FindNearestCreature(NPC_CHELSEA_RUSTFLUTTER, 10.0f, true))
							chelsea->AI()->Talk(4); // Blech! Don't even say it.
					});
					AddTimedDelayedOperation(23 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->AI()->Talk(5); // Nothing, honey.
					});
					AddTimedDelayedOperation(24 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->HandleEmoteCommand(EMOTE_ONESHOT_CRY);
					});
					AddTimedDelayedOperation(26 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->HandleEmoteCommand(EMOTE_ONESHOT_NONE);
						GivenOrder = false; // resume normal LOS conversation
						ConversationActive = false; // Reset conversation for the other players.
					});
					break;

				}
				case StartTalk:
					AddTimedDelayedOperation(0.5 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						if (Creature* chelsea = me->FindNearestCreature(NPC_CHELSEA_RUSTFLUTTER, 10.0f, true))
							chelsea->AI()->Talk(0); // Gus... you gotta...
					});
					AddTimedDelayedOperation(5.5 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->AI()->Talk(0); // Chelsea, baby, that's crazy talk!
					});
					break;
				default:
					break;
			}
		}

	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_gus_rustflutterAI(creature);
	}

};



/// ********** Lost Rigger Cove ********** ///

/// Lost Rigger Cove NPCs - Bilgewater Battlebruiser, Covert Ops Hardsuit, Southsea Swashbuckler, Southsea Pirate, Covert Ops Pounder and Rental Shredder.
class npc_lostrigger_cove_sparring : public CreatureScript
{
public:
	npc_lostrigger_cove_sparring() : CreatureScript("npc_lostrigger_cove_sparring") { }

	enum eMisc
	{
		NPC_BILGEWATER_BATTLEBRUISER = 38648,
		NPC_COVERT_OPS_HARDSUIT		 = 38646,
		NPC_SOUTHSEA_SWASHBUCKLER	 = 7858,
		NPC_SOUTHSEA_PIRATE			 = 7855,
		NPC_RENTAL_SHREDDER			 = 38650,
		NPC_COVERT_OPS_POUNDER		 = 38649,

		// Non attackable NPCs
		NPC_KELSEY_STEELSPARK		 = 38704,
		NPC_MEGS_DREADSHREDDER		 = 38703, 
	};

	struct npc_lostrigger_cove_sparringAI : public ScriptedAI
	{
		npc_lostrigger_cove_sparringAI(Creature* creature) : ScriptedAI(creature) {  }


		float m_Health;

		void EnterCombat(Unit* who) override
		{
			me->HandleEmoteCommand(EMOTE_STATE_READY1H);
			if (who->ToPlayer())
				me->ClearUnitState(UNIT_STATE_ROOT);
			if (me->GetDistance(who) >= 3.0f) // if distance is longer than 3yrds, disable root.
				me->ClearUnitState(UNIT_STATE_ROOT);
			if (me->GetDistance(who) <= 1.0f) // if distance is shorter than 1 yard, disable root (to prevent enemy being on top of each other)
				me->ClearUnitState(UNIT_STATE_ROOT);
		}

		void Reset() override
		{
			m_Health = urand(87.0f, 91.0f);

			if (me->GetEntry() == NPC_COVERT_OPS_HARDSUIT)
				if (me->FindNearestCreature(NPC_KELSEY_STEELSPARK, 4.0f, true))
				{
					me->HandleEmoteCommand(EMOTE_STATE_READY1H);
					me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PC);
					me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_NPC);
					me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
					me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PACIFIED);
				}

			if (me->GetEntry() == NPC_BILGEWATER_BATTLEBRUISER)
				if (me->FindNearestCreature(NPC_MEGS_DREADSHREDDER, 4.0f, true))
				{
					me->HandleEmoteCommand(EMOTE_STATE_READY1H);
					me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PC);
					me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_NPC);
					me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
					me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PACIFIED);
				}
		}


		void DamageTaken(Unit* pWho, uint32& uiDamage, SpellInfo const* /*p_SpellInfo*/) override
		{
			if (Creature* npc = pWho->ToCreature())
			{
				if (!npc->isPet())
					if (me->GetHealth() <= uiDamage || me->GetHealthPct() < m_Health)
						uiDamage = 0;
			}


			if (pWho->GetTypeId() == TYPEID_PLAYER || pWho->isPet())
			{
				if (Creature* battlebruiser = me->FindNearestCreature(NPC_BILGEWATER_BATTLEBRUISER, 5.0f, true))
				{
					battlebruiser->getThreatManager().resetAllAggro();
					battlebruiser->CombatStop(true);
				}
				if (Creature* hardsuit = me->FindNearestCreature(NPC_COVERT_OPS_HARDSUIT, 5.0f, true))
				{
					hardsuit->getThreatManager().resetAllAggro();
					hardsuit->CombatStop(true);
				}
				if (Creature* swashbuckler = me->FindNearestCreature(NPC_SOUTHSEA_SWASHBUCKLER, 5.0f, true))
				{
					swashbuckler->getThreatManager().resetAllAggro();
					swashbuckler->CombatStop(true);
				}
				if (Creature* pirate = me->FindNearestCreature(NPC_SOUTHSEA_PIRATE, 5.0f, true))
				{
					pirate->getThreatManager().resetAllAggro();
					pirate->CombatStop(true);
				}
				if (Creature* shredder = me->FindNearestCreature(NPC_RENTAL_SHREDDER, 5.0f, true))
				{
					shredder->getThreatManager().resetAllAggro();
					shredder->CombatStop(true);
				}
				if (Creature* pounder = me->FindNearestCreature(NPC_COVERT_OPS_POUNDER, 5.0f, true))
				{
					pounder->getThreatManager().resetAllAggro();
					pounder->CombatStop(true);
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
		return new npc_lostrigger_cove_sparringAI(creature);
	}
};






/// ********** Thunderdrome Quest Chain ********** ///
enum ThunderDromeData
{
	/// Quests
	QUEST_THUNDERDROME_GRUDGE_MATCH_ALLIANCE = 25513,
	QUEST_THUNDERDROME_GRUDGE_MATCH_HORDE	 = 25591,
	QUEST_THUNDERDROME_SARINEXX				 = 25095,
	QUEST_THUNDERDROME_THE_GINORMOUS		 = 25067,
	QUEST_THUNDERDROME_ZUMONGA				 = 25094,


	/// Npcs
	NPC_DR_DEALWELL			= 39034,
	NPC_LORD_GINORMOUS		= 39075,
	NPC_ZUMONGA				= 39148,
	NPC_SARINEXX			= 39149,
	NPC_MEGS_DREADSHREDDER	= 40542,
	NPC_KELSEY_STEELSPARK	= 40876,

	/// Spells

	// Megs Deadshredder Spells
	SPELL_FLAME_WAVE			= 76735,
	SPELL_STOP_POKING_ME		= 76091,
	SPELL_SUMMON_DREADSHREDDER	= 76746,
	SPELL_FLAMETHROWER			= 76804,
	SPELL_SAWBLADE				= 76764,

	// Kelsey Steelspark Spells
	SPELL_CHAINED_SPARKS		= 76732,
	SPELL_SUMMON_STEELSPARK		= 76749,
	SPELL_FORKED_LIGHTNING		= 76843,
	SPELL_SPARK_EFFECT			= 76850,
	// Kelsey also uses Stop Poking Me

	// The Ginormus
	SPELL_SUMMON_DOGS_OF_WAR	= 73854,
	SPELL_SKULL_WHACK			= 73855,

	// Sarinexx
	SPELL_SAND_TRAP				= 83730,
	SPELL_WIDE_SLASH			= 73863,

	// Zumonga
	SPELL_HEADBUTT				= 73859,
	SPELL_TASTE_OF_BLOOD		= 73858,


	/// Actions
	ACCEPTED_THE_GINORMOUS			 = 0,
	ACCEPTED_SARINEXX				 = 1,
	ACCEPTED_ZUMONGA				 = 2,
	ACCEPTED_GRUDGE_MATCH			 = 3,


	/// Events
	START_EVENT_GINORMOUS				= 0,
	START_EVENT_SARINEXX				= 1,
	START_EVENT_ZUMONGA					= 2,
	START_EVENT_GRUDGE_MATCH			= 3,

	// Grudge Match
	EVENT_FORKED_LIGHTNING				= 4,
	EVENT_SPARK_EFFECT_CHASE			= 5,
	EVENT_FLAMETHROWER					= 6,
	EVENT_SAWBLADE						= 7,
	EVENT_CHAINED_SPARKS				= 8,
	EVENT_FLAME_WAVE					= 9,

	// The Ginormus
	EVENT_SUMMON_DOGS_OF_WAR			= 10,
	EVENT_SKULL_WHACK					= 11,
	
	// Sarinexx
	EVENT_SAND_TRAP						= 12,
	EVENT_WIDE_SLASH					= 13,

	// Zumonga
	EVENT_HEADBUTT						= 14,
	EVENT_TASTE_OF_BLOOD				= 15,



};

/// Dr.Dealwell - 39034
class npc_dr_dealwell : public CreatureScript
{
public:
	npc_dr_dealwell() : CreatureScript("npc_dr_dealwell") { }
	
	bool OnQuestAccept(Player* player, Creature* creature, Quest const* quest) override
	{
		if (quest->GetQuestId() == QUEST_THUNDERDROME_THE_GINORMOUS)
		{
			creature->GetAI()->DoAction(ACCEPTED_THE_GINORMOUS);
			creature->AI()->Talk(0, player->GetGUID()); // Into the Thunderdrome, $n! There's no getting out...
		}
		if (quest->GetQuestId() == QUEST_THUNDERDROME_SARINEXX)
		{
			creature->GetAI()->DoAction(ACCEPTED_SARINEXX);
			creature->AI()->Talk(0, player->GetGUID());
		}
		if (quest->GetQuestId() == QUEST_THUNDERDROME_ZUMONGA)
		{
			creature->GetAI()->DoAction(ACCEPTED_ZUMONGA);
			creature->AI()->Talk(0, player->GetGUID());
		}
		if (player->GetTeamId() == TEAM_ALLIANCE && quest->GetQuestId() == QUEST_THUNDERDROME_GRUDGE_MATCH_ALLIANCE)
		{
			creature->GetAI()->DoAction(ACCEPTED_GRUDGE_MATCH);
			creature->AI()->Talk(0, player->GetGUID());
		}
		if (player->GetTeamId() == TEAM_HORDE && quest->GetQuestId() == QUEST_THUNDERDROME_GRUDGE_MATCH_HORDE)
		{
			creature->GetAI()->DoAction(ACCEPTED_GRUDGE_MATCH);
			creature->AI()->Talk(0, player->GetGUID());
		}

		return true;
	}

	struct npc_dr_dealwellAI : public ScriptedAI
	{
		npc_dr_dealwellAI(Creature* creature) : ScriptedAI(creature) {}

		EventMap m_CosmeticEvents;
		EventMap m_Events;
		
		// Center of Thunderdrome arena
		Position const l_Pos = { -7140.3511f, -3786.8828f, 8.9675f, 5.984621f};

		// Grudge Match
		Position const KelseyPos = { -7138.9697f, -3784.7754f, 8.9347f, 4.408806f };
		Position const MegsPos	 = { -7140.0200f, -3788.8853f, 8.8546f, 1.320619f };

		void Reset() override
		{
			m_Events.Reset();
			ClearDelayedOperations();
		}


		void UpdateAI(uint32 const p_Diff) override
		{
			UpdateOperations(p_Diff);


		}


		void DoAction(int32 const p_Action) override
		{
			switch (p_Action)
			{
				case ACCEPTED_THE_GINORMOUS:
					AddTimedDelayedOperation(7 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						Talk(1); // Any Ladies and Gentlemen...	THE GINORMUS!
					});
					AddTimedDelayedOperation(17 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						if (Creature* ginormous = me->SummonCreature(NPC_LORD_GINORMOUS, l_Pos, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 180000))
							ginormous->AI()->Talk(1); // There has been too much violence... 
					});
					break;
				case ACCEPTED_SARINEXX:
					AddTimedDelayedOperation(7 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						Talk(3); // The faint of heart... SARINEXX!
					});
					AddTimedDelayedOperation(17 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->SummonCreature(NPC_SARINEXX, l_Pos, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 180000);
					});
					break;
				case ACCEPTED_ZUMONGA:
					AddTimedDelayedOperation(7 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						Talk(5); // Our next fighter... ZUMONGA!
					});

					AddTimedDelayedOperation(17 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						if (Creature* zumonga = me->SummonCreature(NPC_ZUMONGA, l_Pos, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 180000))
							zumonga->AI()->Talk(0); // ZUMONGA...KILL
					});
					break;
				case ACCEPTED_GRUDGE_MATCH:
					AddTimedDelayedOperation(8 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->SummonCreature(NPC_KELSEY_STEELSPARK, KelseyPos, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 180000);
						me->SummonCreature(NPC_MEGS_DREADSHREDDER, MegsPos, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 180000);
					});

					break;

				default:
					break;
			}
		}

	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_dr_dealwellAI(creature);
	}

};



/// Lord Ginormus - 39075
class npc_lord_ginormus : public CreatureScript
{
public:
	npc_lord_ginormus() : CreatureScript("npc_lord_ginormus") { }

	struct npc_lord_ginormusAI : public ScriptedAI
	{
		npc_lord_ginormusAI(Creature* creature) : ScriptedAI(creature) {
			m_PlayerGUID = 0;
		}

		uint64 m_PlayerGUID;
		bool StartedFight = false;

		void Reset() override
		{
			events.Reset();

			if (!StartedFight)
				me->GetAI()->DoAction(START_EVENT_GINORMOUS);
			else
				return;

		}


		void EnterCombat(Unit* target) override
		{
			events.ScheduleEvent(EVENT_SUMMON_DOGS_OF_WAR, urand(2000, 3000));

			if (target->ToPlayer())
				if (target->ToPlayer()->GetQuestStatus(QUEST_THUNDERDROME_THE_GINORMOUS) == QUEST_STATUS_INCOMPLETE)
					m_PlayerGUID = target->GetGUID();

			// Might have to add pet function to retrieve owner
		}

		void KilledUnit(Unit* victim) override
		{
			if (Creature* Dealwell = me->FindNearestCreature(NPC_DR_DEALWELL, 50.0f, true))
				if (victim->ToPlayer())
					Dealwell->AI()->Talk(8, victim->ToPlayer()->GetGUID()); // Random text on player death

			if (Player* player = victim->ToPlayer())
				if (player->GetGUID() == m_PlayerGUID)
					me->ForcedDespawn(2000); // Despawn if the summoner is killed.
		}

		void JustDied(Unit* killer) override
		{
			Talk(0); // I am gravely disappointed.
			if (Creature* Dealwell = me->FindNearestCreature(NPC_DR_DEALWELL, 50.0f, true))
					Dealwell->AI()->Talk(2, m_PlayerGUID); // The Ginormus has fallen!
		}

		void DoAction(int32 const p_Action) override
		{
			switch (p_Action)
			{
			case START_EVENT_GINORMOUS:
				if (Player* player = me->FindNearestPlayer(15.0f, true))
					if (player->GetQuestStatus(QUEST_THUNDERDROME_THE_GINORMOUS) == QUEST_STATUS_INCOMPLETE)
					{
						me->CombatStart(player);
						StartedFight = true;
					}
			}
		}

		void UpdateAI(const uint32 diff)
		{

			UpdateOperations(diff);

			if (!UpdateVictim())
				return;

			events.Update(diff);

			if (me->HasUnitState(UNIT_STATE_CASTING))
				return;

			while (uint32 eventId = events.ExecuteEvent())
			{
				switch (eventId)
				{
				case EVENT_SUMMON_DOGS_OF_WAR:
					DoCastVictim(SPELL_SUMMON_DOGS_OF_WAR);
					events.ScheduleEvent(EVENT_SKULL_WHACK, urand(6000, 8000));
					break;
				case EVENT_SKULL_WHACK:
					DoCastVictim(SPELL_SKULL_WHACK);
					events.ScheduleEvent(EVENT_SUMMON_DOGS_OF_WAR, urand(20000, 25000));
					break;
				}
			}

			DoMeleeAttackIfReady();
		}

	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_lord_ginormusAI(creature);
	}

};


/// Sarinexx - 39149
class npc_sarinexx : public CreatureScript
{
public:
	npc_sarinexx() : CreatureScript("npc_sarinexx") { }

	struct npc_sarinexxAI : public ScriptedAI
	{
		npc_sarinexxAI(Creature* creature) : ScriptedAI(creature) {
			m_PlayerGUID = 0;
		}

		uint64 m_PlayerGUID;
		bool StartedFight = false;

		void Reset() override
		{
			events.Reset();

			if (!StartedFight)
				me->GetAI()->DoAction(START_EVENT_SARINEXX);
			else
				return;

		}

		void EnterCombat(Unit* target) override
		{
			events.ScheduleEvent(EVENT_WIDE_SLASH, urand(2000, 4000));

			if (target->ToPlayer())
				if (target->ToPlayer()->GetQuestStatus(QUEST_THUNDERDROME_SARINEXX) == QUEST_STATUS_INCOMPLETE)
					m_PlayerGUID = target->GetGUID();

			// Might have to add pet function to retrieve owner
		}

		void KilledUnit(Unit* victim) override
		{
			if (Creature* Dealwell = me->FindNearestCreature(NPC_DR_DEALWELL, 50.0f, true))
				if (victim->ToPlayer())
					Dealwell->AI()->Talk(8, victim->ToPlayer()->GetGUID()); // Random text on player death

			if (Player* player = victim->ToPlayer())
				if (player->GetGUID() == m_PlayerGUID)
					me->ForcedDespawn(2000); // Despawn if the summoner is killed.
		}

		void JustDied(Unit* killer) override
		{
			if (Creature* Dealwell = me->FindNearestCreature(NPC_DR_DEALWELL, 50.0f, true))
				if (killer->ToPlayer())
					Dealwell->AI()->Talk(4, m_PlayerGUID); // There's no stopping $n!...
		}

		void DoAction(int32 const p_Action) override
		{
			switch (p_Action)
			{
			case START_EVENT_SARINEXX:
				if (Player* player = me->FindNearestPlayer(15.0f, true))
					if (player->GetQuestStatus(QUEST_THUNDERDROME_SARINEXX) == QUEST_STATUS_INCOMPLETE)
					{
						me->CombatStart(player);
						StartedFight = true;
					}
			}
		}

		void UpdateAI(const uint32 diff)
		{

			UpdateOperations(diff);

			if (!UpdateVictim())
				return;

			events.Update(diff);

			if (me->HasUnitState(UNIT_STATE_CASTING))
				return;

			while (uint32 eventId = events.ExecuteEvent())
			{
				switch (eventId)
				{
				case EVENT_WIDE_SLASH:
					DoCastVictim(SPELL_WIDE_SLASH);
					events.ScheduleEvent(EVENT_SAND_TRAP, urand(7000, 8000));
					break;
				case EVENT_SAND_TRAP:
					DoCastVictim(SPELL_SAND_TRAP);
					events.ScheduleEvent(EVENT_WIDE_SLASH, urand(6000, 9000));
					break;
				}
			}

			DoMeleeAttackIfReady();
		}

	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_sarinexxAI(creature);
	}

};


/// Zumonga - 39148
class npc_zumonga : public CreatureScript
{
public:
	npc_zumonga() : CreatureScript("npc_zumonga") { }

	struct npc_zumongaAI : public ScriptedAI
	{
		npc_zumongaAI(Creature* creature) : ScriptedAI(creature) {
			m_PlayerGUID = 0;
		}

		uint64 m_PlayerGUID;
		bool StartedFight = false;


		void Reset() override
		{
			events.Reset();

			if (!StartedFight)
				me->GetAI()->DoAction(START_EVENT_ZUMONGA);
			else
				return;

		}

		void EnterCombat(Unit* target) override
		{
			events.ScheduleEvent(EVENT_HEADBUTT, urand(4000, 6000));

			if (target->ToPlayer())
				m_PlayerGUID = target->GetGUID();

			// Might have to add pet function to retrieve owner
		}


		void DoAction(int32 const p_Action) override
		{
			switch (p_Action)
			{
			case START_EVENT_ZUMONGA:
				if (Player* player = me->FindNearestPlayer(15.0f, true))
					if (player->GetQuestStatus(QUEST_THUNDERDROME_ZUMONGA) == QUEST_STATUS_INCOMPLETE)
					{
						me->CombatStart(player);
						StartedFight = true;
					}
			}
		}

		void KilledUnit(Unit* victim) override
		{
			if (Creature* Dealwell = me->FindNearestCreature(NPC_DR_DEALWELL, 50.0f, true))
				if (victim->ToPlayer())
					Dealwell->AI()->Talk(8, victim->ToPlayer()->GetGUID()); // Random text on player death

			if (Player* player = victim->ToPlayer())
				if (player->GetGUID() == m_PlayerGUID)
					me->ForcedDespawn(2000); // Despawn if the summoner is killed.
		}

		void JustDied(Unit* killer) override
		{
			if (Creature* Dealwell = me->FindNearestCreature(NPC_DR_DEALWELL, 50.0f, true))
				if (killer->ToPlayer())
					Dealwell->AI()->Talk(6, m_PlayerGUID); // $n has done it again!
		}


		void UpdateAI(const uint32 diff)
		{

			UpdateOperations(diff);

			if (!UpdateVictim())
				return;

			events.Update(diff);

			if (me->HasUnitState(UNIT_STATE_CASTING))
				return;

			while (uint32 eventId = events.ExecuteEvent())
			{
				switch (eventId)
				{
				case EVENT_HEADBUTT:
					DoCastVictim(SPELL_HEADBUTT);
					events.ScheduleEvent(EVENT_TASTE_OF_BLOOD, urand(3000, 4000));
					break;
				case EVENT_TASTE_OF_BLOOD:
					DoCastVictim(SPELL_TASTE_OF_BLOOD);
					events.ScheduleEvent(EVENT_SUMMON_DOGS_OF_WAR, urand(7000, 8000));
					break;
				}
			}

			DoMeleeAttackIfReady();
		}

	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_zumongaAI(creature);
	}

};


/// Kelsey Steelspark - 40876
class npc_kelsey_steelspark_thunderdrome : public CreatureScript
{
public:
	npc_kelsey_steelspark_thunderdrome() : CreatureScript("npc_kelsey_steelspark_thunderdrome") { }

	struct npc_kelsey_steelspark_thunderdromeAI : public ScriptedAI
	{
		npc_kelsey_steelspark_thunderdromeAI(Creature* creature) : ScriptedAI(creature) { 
			m_PlayerGUID = 0;
		}

		uint64 m_PlayerGUID;
		Position const doorPos = { -7122.5957f, -3791.7725f, 8.4699f };
		bool SteelsparkSummoned;
		bool FightStarted = false;

		void Reset() override
		{
			SteelsparkSummoned = false;
			events.Reset();

			if (!FightStarted)
			{
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_NPC);
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PC);
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PACIFIED);
				me->SetSheath(SHEATH_STATE_MELEE);
				me->HandleEmoteCommand(EMOTE_STATE_READY1H);

				if (Creature* Megs = me->FindNearestCreature(NPC_MEGS_DREADSHREDDER, 10.0f, true))
					me->SetFacingToObject(Megs);

				FightStarted = true;
			}
			else
				return;
		}

		void EnterCombat(Unit* target) override
		{
			events.ScheduleEvent(EVENT_CHAINED_SPARKS, urand(2000, 3000));

			if (target->ToPlayer())
				m_PlayerGUID = target->GetGUID();

			// Might have to add pet function to retrieve owner
		}

		void DamageTaken(Unit* attacker, uint32& damage, SpellInfo const* /*p_SpellInfo*/) override
		{

			if (attacker->ToCreature())
				if (attacker->ToCreature()->GetEntry() == NPC_MEGS_DREADSHREDDER)
					damage = 0;

			if (me->GetHealth() <= damage || me->GetHealthPct() <= 30.0f)
				if (!SteelsparkSummoned)
				{
					damage = 0;
					SteelsparkSummoned = true;
					DoCastVictim(SPELL_SUMMON_STEELSPARK, true);
					me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
					me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_NPC);
					me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PC);
					me->SetSheath(SHEATH_STATE_MELEE);
					me->HandleEmoteCommand(EMOTE_STATE_READY1H);
					me->AttackStop();
					attacker->CombatStop();
					me->AI()->DoAction(0);

				}
		}


		void DoAction(int32 const p_Action) override
		{
			switch (p_Action)
			{
				case 0:
					AddTimedDelayedOperation(0 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->AI()->Talk(2); // Grrr... I was going to fight you fair and square, but you decided to bring friends. Fine! Behold the Alloy-Pounder Zero!
					});
					AddTimedDelayedOperation(3 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->AI()->Talk(3); // Let's see how all of that dynamite in your pocket likes the KS-L10 Steelspark, Megs!
					});
					AddTimedDelayedOperation(7 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						if (Creature* Megs = me->FindNearestCreature(NPC_MEGS_DREADSHREDDER, 20.0f, true))
						{
							me->CastSpell(Megs, SPELL_STOP_POKING_ME, true);
							Megs->AI()->Talk(7); // Yikes! That stings!
							Megs->GetMotionMaster()->MoveFleeing(me);
						}

					});
					AddTimedDelayedOperation(9 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						if (Creature* Megs = me->FindNearestCreature(NPC_MEGS_DREADSHREDDER, 20.0f, true))
							me->CombatStart(Megs);

					});
					break;

				case 1:
					AddTimedDelayedOperation(3 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->AI()->Talk(4); // You can be sure to tell Gallywix not to underestimate Gnomeregan anymore.
					});
					AddTimedDelayedOperation(7 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->AI()->Talk(5); // Until next time, Megs. Don't forget today's lesson.
						me->GetMotionMaster()->MovePoint(4, doorPos);

						if (Creature* Megs = me->FindNearestCreature(NPC_MEGS_DREADSHREDDER, 20.0f, true))
							Megs->GetAI()->DoAction(3); // Kill Credit

						if (Creature* Dealwell = me->FindNearestCreature(NPC_DR_DEALWELL, 40.0f, true))
							Dealwell->AI()->Talk(7);

						
					});
					break;
				case 2:
					if (Player* player = sObjectAccessor->GetPlayer(*me, m_PlayerGUID))
						if (player->GetQuestStatus(QUEST_THUNDERDROME_GRUDGE_MATCH_HORDE) == QUEST_STATUS_INCOMPLETE)
							player->KilledMonsterCredit(NPC_KELSEY_STEELSPARK);
					break;

			default:
				break;
			}

		}

		void MovementInform(uint32 type, uint32 id) override
		{

			if (type == POINT_MOTION_TYPE && id == 4) // Door position
			{
				if (Creature* Megs = me->FindNearestCreature(NPC_MEGS_DREADSHREDDER, 20.0f))
					Megs->DespawnOrUnsummon();

				me->DespawnOrUnsummon();
			}
		}


		void UpdateAI(const uint32 diff)
		{

			UpdateOperations(diff);

			if (!UpdateVictim())
				return;

			events.Update(diff);

			if (me->HasUnitState(UNIT_STATE_CASTING))
				return;

			while (uint32 eventId = events.ExecuteEvent())
			{
				switch (eventId)
				{
					case EVENT_CHAINED_SPARKS:
						DoCastVictim(SPELL_CHAINED_SPARKS);
						events.ScheduleEvent(EVENT_CHAINED_SPARKS, urand(4000, 6000));
						break;
				}


			}

			DoMeleeAttackIfReady();
		}

	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_kelsey_steelspark_thunderdromeAI(creature);
	}

};


/// Megs Dreadshredder - 40542
class npc_megs_dreadshredder_thunderdrome : public CreatureScript
{
public:
	npc_megs_dreadshredder_thunderdrome() : CreatureScript("npc_megs_dreadshredder_thunderdrome") { }

	struct npc_megs_dreadshredder_thunderdromeAI : public ScriptedAI
	{
		npc_megs_dreadshredder_thunderdromeAI(Creature* creature) : ScriptedAI(creature) {
			m_PlayerGUID = 0;
		}


		uint64 m_PlayerGUID;
		Position const doorPos = { -7122.5957f, -3791.7725f, 8.4699f };
		bool DreadshredderSummoned;
		bool FightStarted = false;

		void Reset() override
		{
			events.Reset();
			DreadshredderSummoned = false;

			if (!FightStarted)
			{
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_NPC);
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PC);
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PACIFIED);
				me->SetSheath(SHEATH_STATE_MELEE);
				me->HandleEmoteCommand(EMOTE_STATE_READY1H);
				if (Creature* Kelsey = me->FindNearestCreature(NPC_KELSEY_STEELSPARK, 10.0f, true))
					me->SetFacingToObject(Kelsey);


				me->AI()->DoAction(0);
			}
			else
				return;
		}


		void EnterCombat(Unit* target) override
		{
			events.ScheduleEvent(EVENT_FLAME_WAVE, urand(2000, 3000));

			if (target->ToPlayer())
				m_PlayerGUID = target->GetGUID();

			// Might have to add pet function to retrieve owner
		}


		void DamageTaken(Unit* attacker, uint32& damage, SpellInfo const* /*p_SpellInfo*/) override
		{
			if (attacker->ToCreature())
				if (attacker->ToCreature()->GetEntry() == NPC_KELSEY_STEELSPARK)
					damage = 0;


			if (me->GetHealth() <= damage || me->GetHealthPct() <= 30.0f)
				if (!DreadshredderSummoned)
				{
					damage = 0;
					DreadshredderSummoned = true;
					DoCastVictim(SPELL_SUMMON_DREADSHREDDER, true);
					me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
					me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_NPC);
					me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PC);
					me->SetSheath(SHEATH_STATE_MELEE);
					me->HandleEmoteCommand(EMOTE_STATE_READY1H);
					me->AttackStop();
					attacker->CombatStop();
					me->AI()->DoAction(0);
				}
		}


		void DoAction(int32 const p_Action) override
		{
			switch (p_Action)
			{
				case 0:
					AddTimedDelayedOperation(2 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						FightStarted = true;
						me->AI()->Talk(0); // You've gotten in my way one too many times, gnome.
					});
					AddTimedDelayedOperation(6 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						if (Creature* Kelsey = me->FindNearestCreature(NPC_KELSEY_STEELSPARK, 10.0f, true))
							Kelsey->AI()->Talk(0); // You have fully depleted my patience as well.
					});
					AddTimedDelayedOperation(11 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->AI()->Talk(1); // There isn't room in this town for both of us!
					});
					AddTimedDelayedOperation(16 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						if (Creature* Kelsey = me->FindNearestCreature(NPC_KELSEY_STEELSPARK, 10.0f, true))
							Kelsey->AI()->Talk(1); // I will attempt to not take undue pleasure in utterly destroying you.
					});
					AddTimedDelayedOperation(21 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->AI()->Talk(2); // BRING IT, PIPSQUEAK!

						me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
						me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PACIFIED);
						me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_NPC);
						me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PC);

						if (Creature* Kelsey = me->FindNearestCreature(NPC_KELSEY_STEELSPARK, 10.0f, true))
						{
							Kelsey->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
							Kelsey->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PACIFIED);
							Kelsey->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_NPC);
							Kelsey->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PC);

							me->CombatStart(Kelsey);
						}
					});
					break;


				case 1:
					AddTimedDelayedOperation(0 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->AI()->Talk(3); // You think you're clever, don't you, ganging up on me like this... well, prepare to face: THE DREADSHREDDER!
					});
					AddTimedDelayedOperation(3 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->AI()->Talk(4); // You think you're all brave facing me, eh, Steelsparks?! Those pig tails won't protect you from THE DOOMSAW!
					});
					AddTimedDelayedOperation(7 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						if (Creature* Kelsey = me->FindNearestCreature(NPC_KELSEY_STEELSPARK, 20.0f, true))
						{
							me->CastSpell(Kelsey, SPELL_STOP_POKING_ME, true);
							Kelsey->AI()->Talk(6); // Ack! Not the face!
						}

					});
					AddTimedDelayedOperation(9 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						if (Creature* Kelsey = me->FindNearestCreature(NPC_KELSEY_STEELSPARK, 20.0f, true))
						{
							Kelsey->AI()->Talk(7); // Whaaaa!!!!!
							me->CastSpell(Kelsey, SPELL_SAWBLADE, true);
							Kelsey->GetMotionMaster()->MoveFleeing(me);
							me->CombatStart(Kelsey);
						}
					});
					break;

				case 2:
					AddTimedDelayedOperation(3 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->AI()->Talk(5); // You gave it a good shot, kid. But this is goblin turf now. I suggest you get used to it.
					});
					AddTimedDelayedOperation(7 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->AI()->Talk(6); // Ciao, babe. Let me know if you'd like to do lunch sometime. We'll work something out now that you've learned some manners.
						me->GetMotionMaster()->MovePoint(5, doorPos);

						if (Creature* Kelsey = me->FindNearestCreature(NPC_KELSEY_STEELSPARK, 20.0f, true))
							Kelsey->GetAI()->DoAction(2); // Kill credit

						if (Creature* Dealwell = me->FindNearestCreature(NPC_DR_DEALWELL, 40.0f, true))
							Dealwell->AI()->Talk(7);

					});

					break;
				case 3:
					if (Player* player = sObjectAccessor->GetPlayer(*me, m_PlayerGUID))
						if (player->GetQuestStatus(QUEST_THUNDERDROME_GRUDGE_MATCH_ALLIANCE) == QUEST_STATUS_INCOMPLETE)
							player->KilledMonsterCredit(NPC_MEGS_DREADSHREDDER);

				default:
					break;
			}
		}


		void MovementInform(uint32 type, uint32 id) override
		{

			if (type == POINT_MOTION_TYPE && id == 5) // Door position
			{
				if (Creature* Kelsey = me->FindNearestCreature(NPC_KELSEY_STEELSPARK, 20.0f))
					Kelsey->DespawnOrUnsummon();

				me->DespawnOrUnsummon();
			}
		}

		void UpdateAI(const uint32 diff)
		{

			UpdateOperations(diff);

			if (!UpdateVictim())
				return;

			events.Update(diff);

			if (me->HasUnitState(UNIT_STATE_CASTING))
				return;


			while (uint32 eventId = events.ExecuteEvent())
			{
				switch (eventId)
				{
				case EVENT_FLAME_WAVE:
					DoCastVictim(SPELL_FLAME_WAVE);
					events.ScheduleEvent(EVENT_FLAME_WAVE, urand(4000, 6000));
					break;
				}


			}

			DoMeleeAttackIfReady();
		}

	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_megs_dreadshredder_thunderdromeAI(creature);
	}

};



/// Steelsparks LX-506 - 41083
class npc_steelsparks_lx_506 : public CreatureScript
{
public:
	npc_steelsparks_lx_506() : CreatureScript("npc_steelsparks_lx_506") { }

	struct npc_steelsparks_lx_506AI : public ScriptedAI
	{
		npc_steelsparks_lx_506AI(Creature* creature) : ScriptedAI(creature) {}

		Position const KelseyPos = { -7138.9697f, -3784.7754f, 8.9347f, 4.408806f };


		void EnterCombat(Unit* /*victim*/) override
		{
			events.ScheduleEvent(EVENT_FORKED_LIGHTNING, urand(3000, 4000));
		}

		void JustDied(Unit* killer) override
		{
			if (Creature* Kelsey = me->FindNearestCreature(NPC_KELSEY_STEELSPARK, 20.0f, true))
			{
				Kelsey->AttackStop();

				Kelsey->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
				Kelsey->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PC);
				Kelsey->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_NPC);
				Kelsey->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PACIFIED);

				Kelsey->GetMotionMaster()->MovePoint(0, KelseyPos);

				if (Creature* Megs = me->FindNearestCreature(NPC_MEGS_DREADSHREDDER, 20.0f, true))
				{
					Megs->AttackStop();
					Megs->AI()->DoAction(2);
				}

			}

		}


		void Reset() override
		{
			events.Reset();
		}

		void UpdateAI(const uint32 diff)
		{

			UpdateOperations(diff);

			if (!UpdateVictim())
				return;

			events.Update(diff);

			if (me->HasUnitState(UNIT_STATE_CASTING))
				return;

			while (uint32 eventId = events.ExecuteEvent())
			{
				switch (eventId)
				{
					case EVENT_FORKED_LIGHTNING:
						DoCastVictim(SPELL_FORKED_LIGHTNING);
						events.ScheduleEvent(EVENT_SPARK_EFFECT_CHASE, urand(4000, 6000));
						break;
					case EVENT_SPARK_EFFECT_CHASE:
						DoCastVictim(SPELL_SPARK_EFFECT);
						events.ScheduleEvent(EVENT_FORKED_LIGHTNING, 5000);
						break;
				}

			}
			DoMeleeAttackIfReady();
		}

	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_steelsparks_lx_506AI(creature);
	}

};


/// The Dreadshredder - 41077
class npc_the_dreadshredder : public CreatureScript
{
public:
	npc_the_dreadshredder() : CreatureScript("npc_the_dreadshredder") { }

	struct npc_the_dreadshredderAI : public ScriptedAI
	{
		npc_the_dreadshredderAI(Creature* creature) : ScriptedAI(creature) {}

		Position const MegsPos = { -7140.0200f, -3788.8853f, 8.8546f, 1.320619f };

		void EnterCombat(Unit* /*victim*/) override
		{
			events.ScheduleEvent(EVENT_FLAMETHROWER, urand(3000, 4000));
		}

		void JustDied(Unit* killer) override
		{
			if (Creature* Megs = me->FindNearestCreature(NPC_MEGS_DREADSHREDDER, 20.0f, true))
			{

				Megs->AttackStop();

				Megs->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
				Megs->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PC);
				Megs->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_NPC);
				Megs->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PACIFIED);

				Megs->GetMotionMaster()->MovePoint(0, MegsPos);

				if (Creature* Kelsey = me->FindNearestCreature(NPC_KELSEY_STEELSPARK, 20.0f, true))
				{
					Kelsey->AttackStop();
					Kelsey->AI()->DoAction(1);
				}

			}

		}


		void Reset() override
		{
			events.Reset();
		}

		void UpdateAI(const uint32 diff)
		{

			UpdateOperations(diff);

			if (!UpdateVictim())
				return;

			events.Update(diff);

			if (me->HasUnitState(UNIT_STATE_CASTING))
				return;

			while (uint32 eventId = events.ExecuteEvent())
			{
				switch (eventId)
				{
					case EVENT_FLAMETHROWER:
						DoCastVictim(SPELL_FLAMETHROWER);
						events.ScheduleEvent(EVENT_SAWBLADE, urand(4000, 6000));
						break;
					case EVENT_SAWBLADE:
						DoCastVictim(SPELL_SAWBLADE);
						events.ScheduleEvent(EVENT_FLAMETHROWER, 5000);
						break;
				}

			}
			DoMeleeAttackIfReady();
		}

	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_the_dreadshredderAI(creature);
	}

};






/*															 Vision 1: Expedition To Uldum															*/




enum eQuest27003
{
	// Quests
	QUEST_EASY_MONEY = 27003,

	// Spells
	SPELL_DETECT_QUEST_INVIS_ZONE_5 = 86749,
	SPELL_DETECT_QUEST_INVIS_ZONE_1 = 89270,
	SPELL_SUMMON_BEAM_TARGET_BUNNY = 86942,
	SPELL_CHAINS_OF_BONDAGE_1 = 73447,
	SPELL_CHAINS_OF_BONDAGE_2 = 73448,
	SPELL_CHAINS_OF_BONDAGE_3 = 73449,
	SPELL_PLAYER_SUMMON_CAMERA = 95747,
	SPELL_SUMMON_CAMERA_BUNNY = 86792,
	SPELL_PING_CAMERA_00 = 86815,
	SPELL_PERMANENT_FEIGN_DEATH = 29266,
	SPELL_IMPRISONED = 89318,

	SPELL_SUMMON_ADARRAH = 86751,
	SPELL_SUMMON_CARAVAN = 86752,
	SPELL_SUMMON_LADY_HUMPS = 86753,
	SPELL_SUMMON_PACK_MULE = 86754,
	SPELL_SUMMON_BUDDS_CAMEL = 86755,
	SPELL_SUMMON_SAMIRS_CAMEL = 86756,
	SPELL_SUMMON_MACKS_CAMEL = 86757,
	SPELL_SUMMON_ADARRAHS_CAMEL = 86758,

	// Npcs
	NPC_ADARRAH = 46533,
	NPC_LADY_HUMPS = 46536,
	NPC_PACK_MULE = 46537,
	NPC_BUDDS_CAMEL = 46538,
	NPC_SAMIRS_CAMEL = 46540,
	NPC_MACKS_CAMEL = 46543,
	NPC_ADARRAHS_CAMEL = 46546,
	NPC_CLONED_IMAGE = 46554,
	NPC_HARNISH = 46596,
	NPC_KODO_2 = 46534,
	NPC_KURZEL_2 = 46548,
	NPC_TURGORE_2 = 46544,
	NPC_TANZAR_2 = 46547,
	NPC_HARKOR_2 = 46545,
	NPC_PLAYER_GUID = 99999,
	NPC_SAND_PUGMY = 47326,

	// Events
	EVENT_CHECK_PLAYER_IS_PRESENT = 1,
	EVENT_ADARRAH_TALK_VIDEO,
	EVENT_ADARRAH_TALK_0,
	EVENT_ADARRAH_TALK_1,
	EVENT_MOVE_ADARRAH_AROUND_PLAYER,
	EVENT_MOVE_ADARRAH_TO_CAMEL,
	EVENT_ADARRAH_MOUNT_CAMEL,
	EVENT_STARTING_CARAVAN,
	EVENT_PLAYER_MOUNT_HARNISH,
	EVENT_BUDD_SAY_AHOJ,
	EVENT_TELEPORT_TO_VIDEO2,
	EVENT_SUMMON_ACTORS_VIDEO2,
	EVENT_STARTING_VIDEO2,
	EVENT_PUGMY_TALK1,
	EVENT_IMPRISONED,
	EVENT_REMOVE_IMPRISONED,
	EVENT_PUGMY_TALK2,
	EVENT_PUGMY_GO_AWAY,

	// Actions
	ACTION_START_ADARRAH_TALK_VIDEO = 101,
	ACTION_MOVE_ADARRAH_TO_PLAYER,
	ACTION_STARTING_CARAVAN,

	MOVE_ADARRAH_TO_PLAYER = 201,
	MOVE_ADARRAH_AROUND_PLAYER,
	MOVE_ADARRAH_TO_CAMEL,

	// the blizz video creates a clone of the player, and lets this clone do some emotes.
	// Need to fix these spells. - To give to Jens.
	SPELL_INITIALIZE_ULDRUM_INTRO = 86748,
	SPELL_PLAYER_PREP = 86750,
	SPELL_SUMMON_CLONED_IMAGE = 86782, // create a empty player clone.
	SPELL_REVERSE_CAST_MIRROR_IMAGE = 86783, // Script Effect Value: 86784
	SPELL_MIRROR_IMAGE_AURA = 86784, // Script Effect Value: 41055  Value : 45206
	SPELL_COPY_WEAPON_ACK = 41054,
	SPELL_COPY_WEAPON = 41055,
	SPELL_COPY_OFF_HAND_WEAPON_ACK = 45205,
	SPELL_COPY_OFF_HAND_WEAPON = 45206,
};

/// Adarrah - 44833
class npc_adarrah_44833 : public CreatureScript
{
public:
	npc_adarrah_44833() : CreatureScript("npc_adarrah_44833") { }

	bool OnQuestAccept(Player* player, Creature* creature, Quest const* quest)
	{
		if (quest->GetQuestId() == QUEST_EASY_MONEY)
		{
			player->RemoveAura(SPELL_DETECT_QUEST_INVIS_ZONE_5);
			player->AddAura(SPELL_DETECT_QUEST_INVIS_ZONE_1, player);
			player->CastSpell(player, SPELL_SUMMON_BEAM_TARGET_BUNNY);
		}

		return false;
	}
};

/// Beam Target Bunny - 46661
class npc_beam_target_bunny_46661 : public CreatureScript
{
public:
	npc_beam_target_bunny_46661() : CreatureScript("npc_beam_target_bunny_46661") { }

	struct npc_beam_target_bunny_46661AI : public ScriptedAI
	{
		npc_beam_target_bunny_46661AI(Creature* creature) : ScriptedAI(creature) { }

		EventMap m_events;
		uint64 playerGUID;
		uint64 adarrahGUID;
		uint64 harnishGUID;
		uint64 lady_humpsGUID;
		uint64 pack_muleGUID;
		uint64 budds_camelGUID;
		uint64 samirs_camelGUID;
		uint64 macks_camelGUID;
		uint64 adarrahs_camelGUID;
		uint64 sandPugmy[5];
		uint32 sandPugmyCount;
		bool   isVideo2;

		void Reset() override
		{
			m_events.Reset();
			playerGUID = 0;
			adarrahGUID = 0;
			harnishGUID = 0;
			lady_humpsGUID = 0;
			pack_muleGUID = 0;
			budds_camelGUID = 0;
			samirs_camelGUID = 0;
			macks_camelGUID = 0;
			adarrahs_camelGUID = 0;

			for (uint32 i = 0; i < 6; i++)
				sandPugmy[i] = 0;
			sandPugmyCount = 0;

			isVideo2 = false;
		}

		void IsSummonedBy(Unit* summoner) override
		{
			if (Player* player = summoner->ToPlayer())
			{
				playerGUID = player->GetGUID();
				me->CastSpell(player, SPELL_SUMMON_ADARRAH);
				me->CastSpell(player, SPELL_SUMMON_CARAVAN);
				me->CastSpell(player, SPELL_SUMMON_LADY_HUMPS);
				me->CastSpell(player, SPELL_SUMMON_PACK_MULE);
				me->CastSpell(player, SPELL_SUMMON_BUDDS_CAMEL);
				me->CastSpell(player, SPELL_SUMMON_SAMIRS_CAMEL);
				me->CastSpell(player, SPELL_SUMMON_MACKS_CAMEL);
				me->CastSpell(player, SPELL_SUMMON_ADARRAHS_CAMEL);
				m_events.ScheduleEvent(EVENT_CHECK_PLAYER_IS_PRESENT, 10000);
			}
		}

		void JustSummoned(Creature* summon) override
		{
			switch (summon->GetEntry())
			{
			case NPC_ADARRAH:
				adarrahGUID = summon->GetGUID();
				if (Player* player = sObjectAccessor->GetPlayer(*me, playerGUID))
					summon->SetFacingToObject(player);
				break;
			case NPC_HARNISH:
				harnishGUID = summon->GetGUID();
				summon->SetWalk(true);
				summon->SetSpeed(MOVE_WALK, 0.4f);
				summon->SetFacingToObject(me);
				break;
			case NPC_LADY_HUMPS:
				lady_humpsGUID = summon->GetGUID();
				summon->SetWalk(true);
				summon->SetSpeed(MOVE_WALK, 0.4f);
				summon->SetFacingToObject(me);
				break;
			case NPC_PACK_MULE:
				pack_muleGUID = summon->GetGUID();
				summon->SetWalk(true);
				summon->SetSpeed(MOVE_WALK, 0.4f);
				summon->SetFacingToObject(me);
				break;
			case NPC_BUDDS_CAMEL:
				budds_camelGUID = summon->GetGUID();
				summon->SetWalk(true);
				summon->SetSpeed(MOVE_WALK, 0.4f);
				summon->SetFacingToObject(me);
				break;
			case NPC_SAMIRS_CAMEL:
				samirs_camelGUID = summon->GetGUID();
				summon->SetWalk(true);
				summon->SetSpeed(MOVE_WALK, 0.4f);
				summon->SetFacingToObject(me);
				break;
			case NPC_MACKS_CAMEL:
				macks_camelGUID = summon->GetGUID();
				summon->SetWalk(true);
				summon->SetSpeed(MOVE_WALK, 0.4f);
				summon->SetFacingToObject(me);
				break;
			case NPC_ADARRAHS_CAMEL:
				adarrahs_camelGUID = summon->GetGUID();
				summon->SetWalk(true);
				summon->SetSpeed(MOVE_WALK, 0.4f);
				summon->SetFacingToObject(me);
				break;
			case NPC_SAND_PUGMY:
				summon->RemoveAura(SPELL_PERMANENT_FEIGN_DEATH);
				summon->setFaction(7);
				summon->SetUInt32Value(UNIT_FIELD_FLAGS, 0);
				summon->SetUInt32Value(UNIT_FIELD_FLAGS_2, 2048);
				//summon->SetUInt32Value(UNIT_FIELD_DYNAMIC_FLAGS, 0); // Idk how to set dynamic flags to 0, will come back to this.
				sandPugmy[sandPugmyCount] = summon->GetGUID();
				sandPugmyCount += 1;
				break;
			}
			if (isVideo2)
			{
				summon->SetPhaseMask(2, true);
			}
		}

		void DoAction(int32 param) override
		{
			switch (param)
			{
			case ACTION_STARTING_CARAVAN:
			{
				m_events.ScheduleEvent(EVENT_STARTING_CARAVAN, 1000);
			}
			}
		}

		uint64 GetGUID(int32 id = 0) const
		{
			switch (id)
			{
			case NPC_ADARRAH:
				return adarrahGUID;
			case NPC_LADY_HUMPS:
				return lady_humpsGUID;
			case NPC_PACK_MULE:
				return pack_muleGUID;
			case NPC_BUDDS_CAMEL:
				return budds_camelGUID;
			case NPC_SAMIRS_CAMEL:
				return samirs_camelGUID;
			case NPC_MACKS_CAMEL:
				return macks_camelGUID;
			case NPC_HARNISH:
				return harnishGUID;
			case NPC_ADARRAHS_CAMEL:
				return adarrahs_camelGUID;
			case NPC_PLAYER_GUID:
				return playerGUID;
			}
			return 0;
		}

		void UpdateAI(uint32 diff) override
		{
			m_events.Update(diff);

			while (uint32 eventId = m_events.ExecuteEvent())
			{
				switch (eventId)
				{
				case EVENT_CHECK_PLAYER_IS_PRESENT:
				{
					bool ok = false;
					if (Player* player = sObjectAccessor->GetPlayer(*me, playerGUID))
						if (player->isAlive() && player->GetDistance2d(me) < 500.0f)
							if (player->GetQuestStatus(QUEST_EASY_MONEY) == QUEST_STATUS_INCOMPLETE)
								ok = true;

					if (ok)
						m_events.ScheduleEvent(EVENT_CHECK_PLAYER_IS_PRESENT, 5000);
					else
						DespawnCaravan();

					break;
				}
				case EVENT_STARTING_CARAVAN:
				{
					StartMovingCaravan();
					m_events.ScheduleEvent(EVENT_PLAYER_MOUNT_HARNISH, 3000);
					m_events.ScheduleEvent(EVENT_BUDD_SAY_AHOJ, 6000);
					m_events.ScheduleEvent(EVENT_TELEPORT_TO_VIDEO2, 11000);
					m_events.ScheduleEvent(EVENT_SUMMON_ACTORS_VIDEO2, 12000);
					m_events.ScheduleEvent(EVENT_STARTING_VIDEO2, 16000);
					break;
				}
				case EVENT_PLAYER_MOUNT_HARNISH:
				{
					Player* player = sObjectAccessor->GetPlayer(*me, playerGUID);
					Creature* npc = sObjectAccessor->GetCreature(*me, harnishGUID);
					if (player)
					{
						if (isVideo2)
						{
							player->AddAura(59073, player);
							player->AddAura(49416, player);
						}

						if (npc)
							player->EnterVehicle(npc, -1);
						else
							m_events.ScheduleEvent(EVENT_PLAYER_MOUNT_HARNISH, 500);
					}

					break;
				}
				case EVENT_BUDD_SAY_AHOJ:
				{
					if (Creature* budd = sObjectAccessor->GetCreature(*me, budds_camelGUID))
						budd->AI()->Talk(0);
					break;
				}
				case EVENT_TELEPORT_TO_VIDEO2:
				{
					StartTeleport();
					break;
				}
				case EVENT_SUMMON_ACTORS_VIDEO2:
				{
					SummonActorsVideo2();
					break;
				}
				case EVENT_STARTING_VIDEO2:
				{
					if (Creature* npc = sObjectAccessor->GetCreature(*me, sandPugmy[2]))
						npc->AI()->Talk(0);

					m_events.ScheduleEvent(EVENT_PUGMY_TALK1, 5000);
					break;
				}
				case EVENT_PUGMY_TALK1:
				{
					if (Creature* npc = sObjectAccessor->GetCreature(*me, sandPugmy[4]))
						npc->AI()->Talk(1);

					m_events.ScheduleEvent(EVENT_IMPRISONED, 5000);
					break;
				}
				case EVENT_IMPRISONED:
				{
					if (Player* player = sObjectAccessor->GetPlayer(*me, playerGUID))
					{
						DespawnCaravan();
						player->CastSpell(player, SPELL_IMPRISONED);
						m_events.ScheduleEvent(EVENT_REMOVE_IMPRISONED, 5000);
					}
					break;
				}
				}
			}
		}

		void DespawnCaravan()
		{
			if (Creature* npc = sObjectAccessor->GetCreature(*me, adarrahGUID))
				npc->DespawnOrUnsummon();
			if (Creature* npc = sObjectAccessor->GetCreature(*me, harnishGUID))
				npc->DespawnOrUnsummon();
			if (Creature* npc = sObjectAccessor->GetCreature(*me, lady_humpsGUID))
				npc->DespawnOrUnsummon();
			if (Creature* npc = sObjectAccessor->GetCreature(*me, pack_muleGUID))
				npc->DespawnOrUnsummon();
			if (Creature* npc = sObjectAccessor->GetCreature(*me, budds_camelGUID))
				npc->DespawnOrUnsummon();
			if (Creature* npc = sObjectAccessor->GetCreature(*me, samirs_camelGUID))
				npc->DespawnOrUnsummon();
			if (Creature* npc = sObjectAccessor->GetCreature(*me, macks_camelGUID))
				npc->DespawnOrUnsummon();
			if (Creature* npc = sObjectAccessor->GetCreature(*me, adarrahs_camelGUID))
				npc->DespawnOrUnsummon();

			adarrahGUID = 0;
			harnishGUID = 0;
			lady_humpsGUID = 0;
			pack_muleGUID = 0;
			budds_camelGUID = 0;
			samirs_camelGUID = 0;
			macks_camelGUID = 0;
			adarrahs_camelGUID = 0;

			for (uint32 i = 0; i < 6; i++)
				if (Creature* npc = sObjectAccessor->GetCreature(*me, sandPugmy[i]))
				{
					npc->DespawnOrUnsummon();
					sandPugmy[i] = 0;
				}
			sandPugmyCount = 0;
		}

		void StartMovingCaravan()
		{
			if (Creature* npc = sObjectAccessor->GetCreature(*me, harnishGUID))
			{
				Position l_Pos;
				me->GetPosition(&l_Pos);
				npc->GetMotionMaster()->MovePoint(24, l_Pos);
			}
				
			if (Creature* npc = sObjectAccessor->GetCreature(*me, lady_humpsGUID))
			{
				Position l_Pos;
				me->GetPosition(&l_Pos);
				npc->GetMotionMaster()->MovePoint(24, l_Pos);
			}
			if (Creature* npc = sObjectAccessor->GetCreature(*me, pack_muleGUID))
			{
				Position l_Pos;
				me->GetPosition(&l_Pos);
				npc->GetMotionMaster()->MovePoint(24, l_Pos);
			}
			if (Creature* npc = sObjectAccessor->GetCreature(*me, budds_camelGUID))
			{
				Position l_Pos;
				me->GetPosition(&l_Pos);
				npc->GetMotionMaster()->MovePoint(24, l_Pos);
			}
			if (Creature* npc = sObjectAccessor->GetCreature(*me, samirs_camelGUID))
			{
				Position l_Pos;
				me->GetPosition(&l_Pos);
				npc->GetMotionMaster()->MovePoint(24, l_Pos);
			}
			if (Creature* npc = sObjectAccessor->GetCreature(*me, macks_camelGUID))
			{
				Position l_Pos;
				me->GetPosition(&l_Pos);
				npc->GetMotionMaster()->MovePoint(24, l_Pos);
			}
			if (Creature* npc = sObjectAccessor->GetCreature(*me, adarrahs_camelGUID))
			{
				Position l_Pos;
				me->GetPosition(&l_Pos);
				npc->GetMotionMaster()->MovePoint(24, l_Pos);
			}
		}

		void StartTeleport()
		{
			isVideo2 = true;
			me->NearTeleportTo(-8958.0f, -1610.0f, 94.5f, 4.73f);
			DespawnCaravan();
			if (Player* player = sObjectAccessor->GetPlayer(*me, playerGUID))
				player->NearTeleportTo(-8958.0f, -1697.0f, 94.46f, 1.57f);
		}

		void SummonActorsVideo2()
		{
			me->SetPhaseMask(2, true);
			me->SummonCreature(NPC_LADY_HUMPS, -8958.0f, -1671.0f, 94.46f, 1.57f, TEMPSUMMON_TIMED_DESPAWN, 120000);
			me->SummonCreature(NPC_HARNISH, -8958.0f, -1697.0f, 94.46f, 1.57f, TEMPSUMMON_TIMED_DESPAWN, 120000);
			me->SummonCreature(NPC_PACK_MULE, -8948.0f, -1695.0f, 94.46f, 1.57f, TEMPSUMMON_TIMED_DESPAWN, 120000);
			me->SummonCreature(NPC_MACKS_CAMEL, -8948.0f, -1700.0f, 94.46f, 1.57f, TEMPSUMMON_TIMED_DESPAWN, 120000);
			me->SummonCreature(NPC_SAMIRS_CAMEL, -8948.0f, -1705.0f, 94.46f, 1.57f, TEMPSUMMON_TIMED_DESPAWN, 120000);
			me->SummonCreature(NPC_ADARRAHS_CAMEL, -8968.0f, -1697.0f, 94.46f, 1.57f, TEMPSUMMON_TIMED_DESPAWN, 120000);
			me->SummonCreature(NPC_ADARRAH, -8968.0f, -1697.0f, 94.46f, 1.57f, TEMPSUMMON_TIMED_DESPAWN, 120000);
			me->SummonCreature(NPC_BUDDS_CAMEL, -8968.0f, -1690.0f, 94.46f, 1.57f, TEMPSUMMON_TIMED_DESPAWN, 120000);

			me->SummonCreature(NPC_SAND_PUGMY, -8961.2f, -1669.1f, 94.46f, 4.57f, TEMPSUMMON_TIMED_DESPAWN, 120000);
			me->SummonCreature(NPC_SAND_PUGMY, -8955.9f, -1669.2f, 94.46f, 4.57f, TEMPSUMMON_TIMED_DESPAWN, 120000);
			me->SummonCreature(NPC_SAND_PUGMY, -8955.1f, -1707.6f, 94.46f, 1.57f, TEMPSUMMON_TIMED_DESPAWN, 120000);
			me->SummonCreature(NPC_SAND_PUGMY, -8960.0f, -1708.0f, 94.46f, 1.57f, TEMPSUMMON_TIMED_DESPAWN, 120000);
			me->SummonCreature(NPC_SAND_PUGMY, -8965.3f, -1707.3f, 94.46f, 1.57f, TEMPSUMMON_TIMED_DESPAWN, 120000);
			me->SummonCreature(NPC_SAND_PUGMY, -8963.3f, -1707.0f, 94.46f, 1.57f, TEMPSUMMON_TIMED_DESPAWN, 120000);

			m_events.ScheduleEvent(EVENT_PLAYER_MOUNT_HARNISH, 200);
		}

	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_beam_target_bunny_46661AI(creature);
	}
};

/// Adarrah - 46533
class npc_adarrah_46533 : public CreatureScript
{
public:
	npc_adarrah_46533() : CreatureScript("npc_adarrah_46533") { }

	struct npc_adarrah_46533AI : public ScriptedAI
	{
		npc_adarrah_46533AI(Creature* creature) : ScriptedAI(creature) { }

		EventMap m_events;
		uint64 target_bunnyGUID;
		float angle;

		void Reset() override
		{
			target_bunnyGUID = 0;
			angle = 0;
			m_events.Reset();
		}

		void IsSummonedBy(Unit* summoner) override
		{
			target_bunnyGUID = summoner->GetGUID();
		}

		void MovementInform(uint32 type, uint32 id)
		{
			if (type != 8)
				return;

			switch (id)
			{
			case MOVE_ADARRAH_TO_PLAYER:
			{
				m_events.ScheduleEvent(EVENT_ADARRAH_TALK_0, 25);
				break;
			}
			case MOVE_ADARRAH_AROUND_PLAYER:
			{
				m_events.ScheduleEvent(EVENT_MOVE_ADARRAH_TO_CAMEL, 25);
				break;
			}
			case MOVE_ADARRAH_TO_CAMEL:
			{
				m_events.ScheduleEvent(EVENT_ADARRAH_MOUNT_CAMEL, 25);
				break;
			}
			}
		}

		void DoAction(int32 param) override
		{
			switch (param)
			{
			case ACTION_START_ADARRAH_TALK_VIDEO:
			{
				if (Creature* bunny = sObjectAccessor->GetCreature(*me, target_bunnyGUID))
					if (Player* player = sObjectAccessor->GetPlayer(*me, bunny->GetAI()->GetGUID(NPC_PLAYER_GUID)))
					{
						angle = me->GetAngle(player->GetPositionX(), player->GetPositionY());
						Position pos;
						player->GetPosition(&pos);
						player->GetNearPosition(pos, 2.0f, angle);
						me->GetMotionMaster()->MovePoint(MOVE_ADARRAH_TO_PLAYER, pos); // Move Adarrah next to player at a distance of 2 yards.
					}
				break;
			}
			}
		}

		void UpdateAI(uint32 diff) override
		{
			m_events.Update(diff);

			while (uint32 eventId = m_events.ExecuteEvent())
			{
				switch (eventId)
				{
				case EVENT_ADARRAH_TALK_0:
				{
					Talk(0);
					if (Creature* bunny = sObjectAccessor->GetCreature(*me, target_bunnyGUID))
						if (Player* player = sObjectAccessor->GetPlayer(*me, bunny->GetAI()->GetGUID(NPC_PLAYER_GUID)))
							me->SetFacingToObject(player);
					m_events.ScheduleEvent(EVENT_ADARRAH_TALK_1, 5000);
					break;
				}
				case EVENT_ADARRAH_TALK_1:
				{
					Talk(1);
					m_events.ScheduleEvent(EVENT_MOVE_ADARRAH_AROUND_PLAYER, 5000);
					break;
				}
				case EVENT_MOVE_ADARRAH_AROUND_PLAYER:
				{
					if (Creature* bunny = sObjectAccessor->GetCreature(*me, target_bunnyGUID))
						if (Player* player = sObjectAccessor->GetPlayer(*me, bunny->GetAI()->GetGUID(NPC_PLAYER_GUID)))
						{
							float d1 = me->GetDistance2d(-8929.17f, -2262.24f);
							float d2 = me->GetDistance2d(-8928.21f, -2267.25f);
							if (d1 < d2)
								me->GetMotionMaster()->MovePoint(MOVE_ADARRAH_AROUND_PLAYER, -8929.17f, -2262.24f, 8.877f);
							else
								me->GetMotionMaster()->MovePoint(MOVE_ADARRAH_AROUND_PLAYER, -8929.17f, -2262.24f, 8.877f);
						}
					break;
				}
				case EVENT_MOVE_ADARRAH_TO_CAMEL:
				{
					if (Creature* bunny = sObjectAccessor->GetCreature(*me, target_bunnyGUID))
						if (Creature* camel = sObjectAccessor->GetCreature(*me, bunny->GetAI()->GetGUID(NPC_ADARRAHS_CAMEL)))
						{
							float angle = camel->GetAngle(me->GetPositionX(), me->GetPositionY());
							Position pos;
							camel->GetPosition(&pos);
							camel->GetNearPosition(pos, 2.0f, angle);
							me->GetMotionMaster()->MovePoint(MOVE_ADARRAH_TO_CAMEL, pos); // Make Adarrah move to camel at 2 yards distance.
						}
					break;
				}
				case EVENT_ADARRAH_MOUNT_CAMEL:
				{
					if (Creature* bunny = sObjectAccessor->GetCreature(*me, target_bunnyGUID))
						if (Creature* camel = sObjectAccessor->GetCreature(*me, bunny->GetAI()->GetGUID(NPC_ADARRAHS_CAMEL)))
						{
							me->EnterVehicle(camel, 0);
							bunny->GetAI()->DoAction(ACTION_STARTING_CARAVAN);
						}
					break;
				}
				}
			}
		}
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_adarrah_46533AI(creature);
	}
};

/// Lady Humps - 46536
class npc_lady_humps_46536 : public CreatureScript
{
public:
	npc_lady_humps_46536() : CreatureScript("npc_lady_humps_46536") { }

	struct npc_lady_humps_46536AI : public ScriptedAI
	{
		npc_lady_humps_46536AI(Creature* creature) : ScriptedAI(creature) { isStarted = false; }

		uint64 target_bunnyGUID;
		bool isStarted;

		void Reset() override
		{
			target_bunnyGUID = 0;
		}

		void IsSummonedBy(Unit* summoner) override
		{
			target_bunnyGUID = summoner->GetGUID();
		}

		void OnSpellClick(Unit* clicker) override
		{
			if (!isStarted) // if isStarted is false, proceed
				if (Player* player = clicker->ToPlayer())
					if (player->GetQuestStatus(QUEST_EASY_MONEY) == QUEST_STATUS_INCOMPLETE)
						if (Creature* bunny = sObjectAccessor->GetCreature(*me, target_bunnyGUID))
							if (Creature* adarrah = sObjectAccessor->GetCreature(*me, bunny->GetAI()->GetGUID(NPC_ADARRAH)))
							{
								adarrah->GetAI()->DoAction(ACTION_START_ADARRAH_TALK_VIDEO);
								isStarted = true;
							}
		}
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_lady_humps_46536AI(creature);
	}
};

/// Uldum Caravan Harness - 46596
class npc_uldum_caravan_harness_46596 : public CreatureScript
{
public:
	npc_uldum_caravan_harness_46596() : CreatureScript("npc_uldum_caravan_harness_46596") { }

	struct npc_uldum_caravan_harness_46596AI : public ScriptedAI
	{
		npc_uldum_caravan_harness_46596AI(Creature* creature) : ScriptedAI(creature) { }

		EventMap m_events;
		uint64 bunnyGUID;
		uint64 kodoGUID;
		uint64 kurzelGUID;
		uint64 turgoreGUID;
		uint64 tanzarGUID;
		uint64 harkorGUID;
		bool   hasChains;

		void Reset() override
		{
			m_events.Reset();
			bunnyGUID = 0;
			kodoGUID = 0;
			kurzelGUID = 0;
			turgoreGUID = 0;
			tanzarGUID = 0;
			harkorGUID = 0;
			hasChains = false;
		}

		void IsSummonedBy(Unit* summoner) override
		{
			bunnyGUID = summoner->GetGUID();
		}

		void JustSummoned(Creature* summon) override
		{
			switch (summon->GetEntry())
			{
			case NPC_KODO_2:
			{
				kodoGUID = summon->GetGUID();
				break;
			}
			case NPC_KURZEL_2:
			{
				kurzelGUID = summon->GetGUID();
				break;
			}
			case NPC_TURGORE_2:
			{
				turgoreGUID = summon->GetGUID();
				break;
			}
			case NPC_TANZAR_2:
			{
				tanzarGUID = summon->GetGUID();
				break;
			}
			case NPC_HARKOR_2:
			{
				harkorGUID = summon->GetGUID();
				break;
			}
			}
			CreateChains();
		}

		// maybe better to disable??? chains are visible in different phases and uses wrong start/end data..
		void CreateChains()
		{
			if (!hasChains)
				if (Creature* kodo = sObjectAccessor->GetCreature(*me, kodoGUID))
					if (Creature* turgore = sObjectAccessor->GetCreature(*me, turgoreGUID))
					{
						hasChains = true;
						kodo->CastSpell(turgore, SPELL_CHAINS_OF_BONDAGE_1, true);
						//turgore->CastSpell(kodo, SPELL_CHAINS_OF_BONDAGE_2, true);
						//turgore->CastSpell(kodo, SPELL_CHAINS_OF_BONDAGE_3, true);
					}
		}

	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_uldum_caravan_harness_46596AI(creature);
	}
};

// Vision 2: has same creatures as in video 1..

/*																	Vision 3																		 */

// Vision 3 Work In Progress
/// Adarrah - 46873
class npc_adarrah_46873 : public CreatureScript
{
public:
	npc_adarrah_46873() : CreatureScript("npc_adarrah_46873") { }

	struct npc_adarrah_46873AI : public ScriptedAI
	{
		npc_adarrah_46873AI(Creature* creature) : ScriptedAI(creature) { }

		EventMap m_events;

		void Reset() override
		{
			m_events.Reset();
		}

		void UpdateAI(uint32 diff) override
		{
			m_events.Update(diff);

			while (uint32 eventId = m_events.ExecuteEvent())
			{
				switch (eventId)
				{
				case EVENT_ADARRAH_TALK_0:
				{

				}
				}
			}
		}
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_adarrah_46873AI(creature);
	}
};


#ifndef __clang_analyzer__
void AddSC_tanaris()
{
	/// PlayerScript Handler
	new playerScript_tanaris_handler();

	/// Tanaris
    new npc_custodian_of_time();
    new npc_steward_of_time();
    new npc_OOX17();
	new npc_dunemaul_ogres_unchartered();
	new npc_megs_dreadshredder_38849();
	new npc_mazoga_38968();
	new npc_gus_rustflutter();
	new npc_lostrigger_cove_sparring();

	/// -- Thunderdrome Quests
	new npc_dr_dealwell();
	new npc_lord_ginormus();
	new npc_sarinexx();
	new npc_zumonga();
	new npc_kelsey_steelspark_thunderdrome(); // Need to test
	new npc_megs_dreadshredder_thunderdrome(); // Need to test
	new npc_steelsparks_lx_506();
	new npc_the_dreadshredder();


	/// Tanaris-Uldum Campaign Expedition
	new npc_adarrah_44833();
	new npc_beam_target_bunny_46661();
	new npc_adarrah_46533();
	new npc_lady_humps_46536();
	new npc_uldum_caravan_harness_46596();
	new npc_adarrah_46873();
}
#endif
