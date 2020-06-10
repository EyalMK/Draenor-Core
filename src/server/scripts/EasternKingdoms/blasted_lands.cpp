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

/// Phase handler
class playerScript_old_blasted_lands_phase_handler : public PlayerScript
{
public:
	playerScript_old_blasted_lands_phase_handler() : PlayerScript("playerScript_old_blasted_lands_phase_handler") { }

	void UpdatePhaseMask(Player* p_Player)
	{
		/// UPDATE PHASEMASK DEPENDING OF QUESTS
		uint32 l_PhaseMask = p_Player->GetPhaseMask();
		uint32 p_NewAreaId = p_Player->GetAreaId();

		if (p_NewAreaId == 1440) // Serpent's Coil
		{
			if (p_Player->GetQuestStatus(26157) == QUEST_STATUS_COMPLETE || QUEST_STATUS_REWARDED) // Kasim Sharim quest
			{
				l_PhaseMask |= 2; // Loramus inside cave
			}

			if (p_Player->GetQuestStatus(26163) == QUEST_STATUS_REWARDED) // Time is short
			{
				l_PhaseMask &= ~2; // Loramus not inside cave - set phase back to 1
			}

			if (p_Player->GetQuestStatus(26162) == QUEST_STATUS_COMPLETE || QUEST_STATUS_REWARDED) // Altar of the Storms
			{
				l_PhaseMask |= 2; // Loramus inside cave
			}

			


			p_Player->SetPhaseMask(l_PhaseMask, true);
		}
	}

	void OnUpdateZone(Player* p_Player, uint32 p_NewZoneId, uint32 p_OldZoneID, uint32 p_NewAreaId) override
	{
		if (p_NewAreaId == 1440) // Serpent's Coil
		{
			uint32 l_PhaseMask = p_Player->GetPhaseMask();

			if (p_Player->GetQuestStatus(26157) == QUEST_STATUS_COMPLETE || QUEST_STATUS_REWARDED) // Kasim Sharim quest
			{
				l_PhaseMask |= 2; // Loramus inside cave
			}

			if (p_Player->GetQuestStatus(26163) == QUEST_STATUS_COMPLETE || QUEST_STATUS_REWARDED) // Time is short
			{
				l_PhaseMask == 1; // Loramus not inside cave
			}

			if (p_Player->GetQuestStatus(26162) == QUEST_STATUS_COMPLETE || QUEST_STATUS_REWARDED) // Altar of the Storms
			{
				l_PhaseMask |= 2; // Loramus inside cave
			}

			
			p_Player->SetPhaseMask(l_PhaseMask, true);
		}
	}

	void OnLogin(Player* p_Player) override
	{
		if (p_Player->GetZoneId() == 4)
			UpdatePhaseMask(p_Player);
	}

	void OnQuestAbandon(Player* p_Player, const Quest* /*p_Quest*/) override
	{
		if (p_Player->GetZoneId() == 4)
			UpdatePhaseMask(p_Player);
	}

	void OnQuestComplete(Player* p_Player, const Quest* p_Quest) override
	{
		if (p_Player->GetZoneId() == 4)
			UpdatePhaseMask(p_Player);
	}
};



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



/// Deathly Usher - 8816
#define GOSSIP_ITEM_USHER "I wish to face the Defiler."

class npc_deathly_usher : public CreatureScript
{
public:
    npc_deathly_usher() : CreatureScript("npc_deathly_usher") { }

	enum eData
	{
		// Spell
		SPELL_TELEPORT_SINGLE			= 12885,

		// Quests
		HORDE_DEMON_QUEST				= 25701,
		ALLIANCE_DEMON_QUEST			= 26171,

		// Provided Item
		ITEM_STONE_KNIFE				= 56012
	};

	bool OnGossipHello(Player* p_Player, Creature* p_Creature) override
	{
		if (p_Player->GetTeamId() == TEAM_ALLIANCE && p_Player->GetQuestStatus(ALLIANCE_DEMON_QUEST) == QUEST_STATUS_INCOMPLETE && p_Player->HasItemCount(ITEM_STONE_KNIFE))
				p_Player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ITEM_USHER, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF);

		if (p_Player->GetTeamId() == TEAM_HORDE && p_Player->GetQuestStatus(HORDE_DEMON_QUEST) == QUEST_STATUS_INCOMPLETE && p_Player->HasItemCount(ITEM_STONE_KNIFE))
				p_Player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ITEM_USHER, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF);

		p_Player->SEND_GOSSIP_MENU(p_Player->GetGossipTextId(p_Creature), p_Creature->GetGUID());

		return true;
	}

    bool OnGossipSelect(Player* player, Creature* creature, uint32 /*sender*/, uint32 action) override
    {
        player->PlayerTalkClass->ClearMenus();

        if (action == GOSSIP_ACTION_INFO_DEF)
        {
            player->CLOSE_GOSSIP_MENU();
            creature->CastSpell(player, SPELL_TELEPORT_SINGLE, true);
        }

        return true;
    }

   
};


/// Loramus Thalipedes - 41297
class npc_loramus_thalipedes : public CreatureScript
{
public:
	npc_loramus_thalipedes() : CreatureScript("npc_loramus_thalipedes") { }

	enum eData
	{

		// Npcs
		NPC_RAZELIKH_DEMON	=	41280,
		NPC_LORAMUS_THE_DEFILED	= 41292,

		// Spells
		SPELL_TELEPORT_SINGLE = 12885,
		SPELL_DEMONS_RESOLVE  = 77371,

		// Quests
		HORDE_DEMON_QUEST = 25701,
		ALLIANCE_DEMON_QUEST = 26171,

		// Provided Item
		ITEM_STONE_KNIFE = 56012,

		// Event
		EVENT_CHECK_PLAYER	=	0
	};

	enum eActions
	{
		StartEvent = 0,
		BeforeDeath = 1,
		Transformation = 2,
		TheDefiledSummoned = 3,
		EndDeath = 4,
		EndQuestAndDeath = 5
	};

	struct npc_loramus_thalipedesAI : public ScriptedAI
	{
		npc_loramus_thalipedesAI(Creature* p_Creature) : ScriptedAI(p_Creature) {
			m_Quest = false;
		}

		bool m_Quest;
		EventMap m_CosmeticEvents;
		EventMap m_Events;

		void Reset() override
		{
			m_Events.Reset();
			ClearDelayedOperations();
			m_CosmeticEvents.ScheduleEvent(EVENT_CHECK_PLAYER, 1 * TimeConstants::IN_MILLISECONDS);
		}

		void UpdateAI(uint32 const p_Diff) override
		{
			UpdateOperations(p_Diff);

			m_Events.Update(p_Diff);

			m_CosmeticEvents.Update(p_Diff);

			switch (m_Events.ExecuteEvent()) {}

			switch (m_CosmeticEvents.ExecuteEvent())
			{
				case EVENT_CHECK_PLAYER:
				{
					std::list<Player*> l_PlayerList;
					me->GetPlayerListInGrid(l_PlayerList, 5.0f);

					for (Player* p_Player : l_PlayerList)

						if (p_Player->HasQuest(ALLIANCE_DEMON_QUEST) || p_Player->HasQuest(HORDE_DEMON_QUEST))
						{
							if (Creature* razelikh = me->FindNearestCreature(NPC_RAZELIKH_DEMON, 10.0f, true))
							{
								// Buff
								if (!p_Player->HasAura(SPELL_DEMONS_RESOLVE))
									me->CastSpell(p_Player, SPELL_DEMONS_RESOLVE);
								me->AI()->DoAction(StartEvent);
							}
						}
				}
			}
		}


		void DoAction(int32 const p_Action) override
		{
			switch (p_Action)
			{
				case StartEvent:
				{
					if (m_Quest)
						return;

					m_Quest = true;

					m_CosmeticEvents.CancelEvent(EVENT_CHECK_PLAYER);


					AddTimedDelayedOperation(0.5 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						Talk(0); // Demon! I have returned..
						me->HandleEmoteCommand(EMOTE_ONESHOT_TALK);
					});


					AddTimedDelayedOperation(4.5 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						Talk(1); // Death has not erased my memory.
						me->HandleEmoteCommand(EMOTE_ONESHOT_TALK);
					});

					AddTimedDelayedOperation(9 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						Talk(2); // RAKH'LIKH!
						me->HandleEmoteCommand(EMOTE_ONESHOT_TALK);

						if (Creature* razelikh = me->FindNearestCreature(NPC_RAZELIKH_DEMON, 15.0f, true))
						{
							razelikh->GetAI()->DoAction(StartEvent);
						}
					});

					break;
				}

				case BeforeDeath:
					AddTimedDelayedOperation(0 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->getThreatManager().resetAllAggro();
						me->AttackStop();
					});

					break;
			
				case Transformation:

					AddTimedDelayedOperation(1.5 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						if (Player* player = me->FindNearestPlayer(20.0f, true))
						{
							me->SetFacingToObject(player);
							Position l_Pos;
							me->GetPosition(&l_Pos);

							if (Creature* loramus_the_defiled = me->SummonCreature(NPC_LORAMUS_THE_DEFILED, l_Pos, TEMPSUMMON_MANUAL_DESPAWN))
							{
								loramus_the_defiled->GetAI()->DoAction(TheDefiledSummoned);
								me->DespawnOrUnsummon();
							}
						
						}
						else {
							Reset();
						}
					
					});

					break;

				default:
					break;
				}
			}
	};

	
	CreatureAI* GetAI(Creature* p_Creature) const override
	{
		return new npc_loramus_thalipedesAI(p_Creature);
	}
};



/// Razelikh the Defiler - 41280
class npc_razelikh_the_defiler : public CreatureScript
{
public:
	npc_razelikh_the_defiler() : CreatureScript("npc_razelikh_the_defiler") { }

	enum eData
	{

		// Npcs
		NPC_LORAMUS_THALIPEDES		= 41279,
		NPC_DEFILED_FELHOUND		= 41290,
		NPC_RAZELIKH_THE_DEFILER	= 41280,

		// Spell
		SPELL_TELEPORT_SINGLE = 12885,
		SPELL_RITUAL_BEAM	  = 104158,
		SPELL_COSMETIC_STUN	  = 73566,

		// Quests
		HORDE_DEMON_QUEST = 25701,
		ALLIANCE_DEMON_QUEST = 26171,

		// Provided Item
		ITEM_STONE_KNIFE = 56012
	};

	enum eActions
	{
		StartEvent = 0,
		BeforeDeath = 1,
		Transformation = 2,
		TheDefiledSummoned = 3,
		EndDeath = 4,
		EndQuestAndDeath = 5
	};

	struct npc_razelikh_the_defilerAI : public ScriptedAI
	{
		npc_razelikh_the_defilerAI(Creature* p_Creature) : ScriptedAI(p_Creature) { }

		Player* l_Target;

		void Reset() override
		{
			ClearDelayedOperations();
			l_Target = nullptr;
		}


		void UpdateAI(uint32 const p_Diff) override
		{
			UpdateOperations(p_Diff);
		}

		void DoAction(int32 const p_Action) override
		{
			switch (p_Action)
			{
			case StartEvent:
			{
				AddTimedDelayedOperation(0.5 * TimeConstants::IN_MILLISECONDS, [this]() -> void
				{
					Talk(0); // Fool of a demon hunter
					me->SetReactState(REACT_AGGRESSIVE);
					me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_NPC);
					me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PC);
					if (l_Target = me->FindNearestPlayer(20.0f, true));
						me->CombatStart(l_Target, true);
				});

				/// Spells are in scripted in SmartAI

				break;
			}

			case BeforeDeath:
			{
				AddTimedDelayedOperation(0 * TimeConstants::IN_MILLISECONDS, [this]() -> void
				{
					// Set flags
					me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_NPC);
					me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PC);
					me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_UNK_6);
					me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_UNK_15);

					Talk(1); // Enough games!

					// Despawn Felhound
					if (Creature* Felhound = me->FindNearestCreature(NPC_DEFILED_FELHOUND, 20.0f))
					{
						Felhound->DespawnOrUnsummon();
					}


					if (Creature* loramus = me->FindNearestCreature(NPC_LORAMUS_THALIPEDES, 20.0f))
					{
						me->SetFacingToObject(loramus);
						me->CastSpell(loramus->GetEntry(), SPELL_RITUAL_BEAM, true);
						me->CastSpell(loramus->GetEntry(), SPELL_COSMETIC_STUN, true);

						loramus->GetAI()->DoAction(BeforeDeath);
					}

				});

				AddTimedDelayedOperation(3 * TimeConstants::IN_MILLISECONDS, [this]() -> void
				{
					Talk(2); // What's this? Loramus...
					
				});

				AddTimedDelayedOperation(6 * TimeConstants::IN_MILLISECONDS, [this]() -> void
				{
					Talk(3); // You must feel it already then...

				});

				AddTimedDelayedOperation(9 * TimeConstants::IN_MILLISECONDS, [this]() -> void
				{
					Talk(4); // Allow me to speed up the process a bit!

				});

				AddTimedDelayedOperation(12 * TimeConstants::IN_MILLISECONDS, [this]() -> void
				{
					
					if (Creature* loramus = me->FindNearestCreature(NPC_LORAMUS_THALIPEDES, 15.0f))
					{
						me->setDeathState(JUST_DIED); // Die
						me->CastStop(SPELL_RITUAL_BEAM); // Stop casting beam spell
						l_Target->QuestObjectiveSatisfy(NPC_RAZELIKH_THE_DEFILER, 1, QUEST_OBJECTIVE_TYPE_NPC, l_Target->GetGUID());

						loramus->RemoveAurasDueToSpell(SPELL_COSMETIC_STUN); // Remove Stun cosmetic
						loramus->GetAI()->DoAction(Transformation); // Transform Phase
					}

				});

				break;
			}
			default:
				break;
			}
		}


		void DamageTaken(Unit* done_by, uint32 &damage, SpellInfo const*  /*p_SpellInfo*/) override
		{
			if (me->GetHealthPct() <= 25.0f)
			{
				me->AttackStop(); // Stop attacking
				me->getThreatManager().resetAllAggro(); // Clear Aggro
				me->AI()->DoAction(BeforeDeath);
			}
		}


	};
	CreatureAI* GetAI(Creature* p_Creature) const override
	{
		return new npc_razelikh_the_defilerAI(p_Creature);
	}
	
};

/// Loramus the Defiled - 41292
class npc_loramus_the_defiled : public CreatureScript
{
public:
	npc_loramus_the_defiled() : CreatureScript("npc_loramus_the_defiled") { }

	enum eData
	{

		// Npcs
		NPC_LORAMUS_THALIPEDES	= 41279,
		NPC_DEFILED_FELHOUND	= 41290,
		NPC_LORAMUS_THE_DEFILED	= 41292,

		// Spell
		SPELL_TELEPORT_SINGLE = 12885,
		SPELL_RITUAL_BEAM = 104158,
		SPELL_COSMETIC_STUN = 73566,
		SPELL_DEATH			= 41220,
		SPELL_KNIFE			= 77380,

		// Quests
		HORDE_DEMON_QUEST = 25701,
		ALLIANCE_DEMON_QUEST = 26171,

		// Provided Item
		ITEM_STONE_KNIFE = 56012
	};

	enum eActions
	{
		StartEvent			= 0,
		BeforeDeath			= 1,
		Transformation		= 2,
		TheDefiledSummoned	= 3,
		EndDeath			= 4,
		EndQuestAndDeath	= 5
	};

	struct npc_loramus_the_defiledAI : public ScriptedAI
	{
		npc_loramus_the_defiledAI(Creature* p_Creature) : ScriptedAI(p_Creature) { }

		Player* l_Target;

		void SpellHit(Unit* /*who*/, SpellInfo const* spellInfo) override
		{
			if (spellInfo->Id == SPELL_KNIFE)
				if (me->GetHealth() == 1.0f)
					me->AI()->DoAction(EndQuestAndDeath);
		}


		void DamageTaken(Unit* done_by, uint32 &damage, SpellInfo const*  /*p_SpellInfo*/) override
		{

			if (me->GetHealthPct() == 25.0f)
				Talk(3); // Lok zenn Za enkil refir mordanas lok zenn

			if (me->GetHealth() == 1.0f || damage > me->GetHealth())
			{
				damage = 0;
				me->AI()->DoAction(EndDeath);
			}
		}

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
				case EndDeath:
				{
					AddTimedDelayedOperation(0 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->RemoveAllAuras();
						DoCast(me, SPELL_DEATH);
						me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
						me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_NPC);
						me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PC);
						me->CombatStop(true);
						Talk(1); // Quickly! Use the knife on me!
					});
					break;
				}

				case TheDefiledSummoned:
				{
					Talk(0); // Now, heroes!
					l_Target = me->FindNearestPlayer(20.0f, true);

					if (l_Target->HasQuest(ALLIANCE_DEMON_QUEST) || l_Target->HasQuest(HORDE_DEMON_QUEST))
						me->CombatStart(l_Target, true);

					break;
				}
				case EndQuestAndDeath:
				{
					AddTimedDelayedOperation(0.5 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						l_Target->QuestObjectiveSatisfy(NPC_LORAMUS_THE_DEFILED, 1, QUEST_OBJECTIVE_TYPE_NPC, l_Target->GetGUID());
						Talk(2); // It is done. Leave me here, then.
					});

					AddTimedDelayedOperation(3.5 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->RemoveAurasDueToSpell(SPELL_DEATH);
						// Missing Green Blowup effect spell - Couldn't find - not a priority.
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
		return new npc_loramus_the_defiledAI(p_Creature);
	}
};


/// Kasim Sharim - 42298
class npc_kasim_sharim : public CreatureScript
{
public:
	npc_kasim_sharim() : CreatureScript("npc_kasim_sharim") { }

	enum eData
	{
		// Gossip Menu
		KASIM_GOSSIP_MENU	 = 11613,
		KASIM_GOSSIP_OPTION	 = 0,
		KASIM_GOSSIP_OPTION2 = 1,
		KASIM_NPC_TEXT		 = 16214,

		// Quests
		QUEST_BLOOD_RITUAL	= 26160,
		QUEST_FINAL_RITUAL	= 26170,
		QUEST_TIME_IS_SHORT	= 26163,

		// Spells
		SPELL_BLOOD_RITUAL	= 77573,
	};

	enum eActions
	{
		BEGIN_BLOOD_RITUAL	= 0,
		BEGIN_FINAL_RITUAL	= 1
	};

	bool OnQuestAccept(Player* p_Player, Creature* p_Creature, Quest* p_Quest)
	{
		if (p_Quest->GetQuestId() == QUEST_TIME_IS_SHORT)
			p_Creature->AI()->Talk(4); // Quickly, <name>! We haven't much time
	}

	bool OnGossipHello(Player* p_Player, Creature* p_Creature) override
	{
		if (p_Player->GetQuestStatus(QUEST_BLOOD_RITUAL) == QUEST_STATUS_INCOMPLETE)
		{
			p_Player->ADD_GOSSIP_ITEM_DB(KASIM_GOSSIP_MENU, KASIM_GOSSIP_OPTION, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF);
			p_Player->SEND_GOSSIP_MENU(KASIM_NPC_TEXT, p_Creature->GetGUID());
		}

		else if (p_Player->GetQuestStatus(QUEST_FINAL_RITUAL) == QUEST_STATUS_INCOMPLETE)
		{
			p_Player->ADD_GOSSIP_ITEM_DB(KASIM_GOSSIP_MENU, KASIM_GOSSIP_OPTION2, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
			p_Player->SEND_GOSSIP_MENU(KASIM_NPC_TEXT, p_Creature->GetGUID());
		}
		else {
			if (p_Creature->isQuestGiver())
				p_Player->PrepareQuestMenu(p_Creature->GetGUID());
			p_Player->SEND_GOSSIP_MENU(KASIM_NPC_TEXT, p_Creature->GetGUID());
		}
		return true;
	}

	bool OnGossipSelect(Player* p_Player, Creature* p_Creature, uint32 /*sender*/, uint32 action) override
	{
		p_Player->PlayerTalkClass->ClearMenus();

		if (action == GOSSIP_ACTION_INFO_DEF)
		{
			p_Creature->AI()->DoAction(BEGIN_BLOOD_RITUAL); // Begin the ritual
			p_Player->CLOSE_GOSSIP_MENU();
			p_Player->QuestObjectiveSatisfy(42298, 1, QUEST_OBJECTIVE_TYPE_NPC_INTERACT, p_Player->GetGUID());
		}

		if (action == GOSSIP_ACTION_INFO_DEF + 1)
		{
			p_Creature->AI()->DoAction(BEGIN_FINAL_RITUAL); // Begin the ritual
			p_Player->CLOSE_GOSSIP_MENU();
			p_Player->QuestObjectiveSatisfy(42298, 1, QUEST_OBJECTIVE_TYPE_NPC_INTERACT, p_Player->GetGUID());
		}

		return true;
	}

	struct npc_kasim_sharimAI : public ScriptedAI
	{
		npc_kasim_sharimAI(Creature* p_Creature) : ScriptedAI(p_Creature) { }


		void UpdateAI(const uint32 p_Diff) override
		{
			UpdateOperations(p_Diff);
		}
		void Reset() override
		{
			ClearDelayedOperations();
		}

		void DoAction(int32 const p_Action) override
		{
			switch (p_Action)
			{
				case BEGIN_BLOOD_RITUAL:
					{
						AddTimedDelayedOperation(0.5 * TimeConstants::IN_MILLISECONDS, [this]() -> void
						{
							Talk(0); // Very well. Stand back...	
						});

						AddTimedDelayedOperation(2 * TimeConstants::IN_MILLISECONDS, [this]() -> void
						{
							me->CastSpell(me, SPELL_BLOOD_RITUAL, true);
						});

						AddTimedDelayedOperation(6 * TimeConstants::IN_MILLISECONDS, [this]() -> void
						{
							Talk(1); // The blood ritual is complete...
						});
						break;
					}
				case BEGIN_FINAL_RITUAL:
					{
						AddTimedDelayedOperation(0.5 * TimeConstants::IN_MILLISECONDS, [this]() -> void
						{
							Talk(2); // With the power within the amulets of Razelikh...
						});

						AddTimedDelayedOperation(3.5 * TimeConstants::IN_MILLISECONDS, [this]() -> void
						{
							Talk(3); // ... I bind you to his lair!
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
		return new npc_kasim_sharimAI(p_Creature);
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




/*														 /// New Blasted Lands Scripts ///																		*/

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


/// "Stitches" Solderbolt - 76108
class npc_stitches_solderbolt : public CreatureScript
{
public:
	npc_stitches_solderbolt() : CreatureScript("npc_stitches_solderbolt") { }


	enum eMisc
	{
		FirstWP	= 0,
		SecWP	= 1,
		ThirdWP	= 2,
	};


	struct npc_stitches_solderboltAI : public ScriptedAI
	{
		npc_stitches_solderboltAI(Creature* p_Creature) : ScriptedAI(p_Creature) {
		
			me->GetMotionMaster()->MovePath(76108 * 100, true);

		}

		void UpdateAI(uint32 p_Diff) override
		{
			UpdateOperations(p_Diff);
		}

		void MovementInform(uint32 type, uint32 id) override
		{

			if (type == EFFECT_MOTION_TYPE && id == 1)
			{
				me->GetAI()->DoAction(1);
			}
			if (type == EFFECT_MOTION_TYPE && id == 2)
			{
				me->GetAI()->DoAction(2);
			}
		}


		void DoAction(int32 const p_Action) override
		{
			switch (p_Action)
			{
				case 1:
				{
					AddTimedDelayedOperation(0 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->SetFacingTo(2.683312f);
					});

					AddTimedDelayedOperation(0.5 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->CastSpell(me, 153964); // Kneel aura
					});

					AddTimedDelayedOperation(1 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->CastSpell(me, 94355); // First aid visual spell
					});

					AddTimedDelayedOperation(6 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->CastSpell(me, 94355); // First aid visual spell
					});

					AddTimedDelayedOperation(12.5 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->RemoveAura(153964); // Kneel aura
					});
					break;
				}
				case 2:
				{
					AddTimedDelayedOperation(0.2 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->SetFacingTo(5.169490f);
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
		return new npc_stitches_solderboltAI(p_Creature);
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

		void EnterCombat(Unit* /*who*/) override
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
		actionSaved	 = 0,
		actionKilled = 1,
	};

	enum eData
	{
		NPC_NETHERGARDE_PRISONER  = 82504
	};

	struct npc_ironmarch_executionerAI : public ScriptedAI
	{
		npc_ironmarch_executionerAI(Creature* p_Creature) : ScriptedAI(p_Creature) { }

		std::list<Creature*> PrisonersNearby;

		void JustDied(Unit* killer) override
		{
			me->GetAI()->DoAction(actionKilled);
		}
		void DoAction(int32 const p_Action) override
		{
			switch (p_Action)
			{
				case eAction::actionKilled:
				{
					me->GetCreatureListWithEntryInGrid(PrisonersNearby, eData::NPC_NETHERGARDE_PRISONER, 10.0f);
					for (std::list<Creature*>::const_iterator itr = PrisonersNearby.begin(); itr != PrisonersNearby.end(); ++itr)
					{
						(*itr)->AI()->Talk(urand(0, 2));
						break; // Break when first iteration talks - when there are two prisoners, only one is supposed to talk.
					}

					for (std::list<Creature*>::const_iterator itr = PrisonersNearby.begin(); itr != PrisonersNearby.end(); ++itr)
					{
						(*itr)->GetAI()->DoAction(eAction::actionSaved);
					}
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

		void Reset() override
		{
			me->CastSpell(me, 153964); // Kneel aura
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
			case eAction::actionSaved:
			{
				AddTimedDelayedOperation(0.2 * TimeConstants::IN_MILLISECONDS, [this]() -> void
				{
					me->RemoveAurasDueToSpell(153964); // Remove kneel
				});


				AddTimedDelayedOperation(1 * TimeConstants::IN_MILLISECONDS, [this]() -> void
				{
					float x, y, z;
					me->GetClosePoint(x, y, z, me->GetObjectSize() / 3, 10.0f);
					me->GetMotionMaster()->MovePoint(1, x, y, z);
					me->DespawnOrUnsummon(5000);
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

		
		void Reset() override
		{
			
			if (me->GetMapId() == eData::NewBlastedLandsMapId)
			{
				me->setRegeneratingHealth(false);
				me->SetHealth(me->CountPctFromMaxHealth(0));
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_NPC);
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PC);
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_UNK_15);
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_UNK_29);
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_UNK_16);
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
			}
		}
	};

	CreatureAI* GetAI(Creature* p_Creature) const override
	{
		return new npc_nethergarde_defenderAI(p_Creature);
	}
};

/// Wounded Marine
class npc_wounded_marine : public CreatureScript
{
public:
	npc_wounded_marine() : CreatureScript("npc_wounded_marine") { }


	struct npc_wounded_marineAI : public ScriptedAI
	{
		npc_wounded_marineAI(Creature* p_Creature) : ScriptedAI(p_Creature) { }


		void Reset() override
		{
			if (me->GetGUIDLow() == 10124397 || me->GetGUIDLow() == 10124405 || me->GetGUIDLow() == 10124446) // Wounded Marines standing next to the 2 sailors
			{
				me->SetHealth(me->CountPctFromMaxHealth(65));
				me->setRegeneratingHealth(false);
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PACIFIED);
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_MOVE);
			}
			else
			{
				me->setRegeneratingHealth(false);
				me->SetHealth(me->CountPctFromMaxHealth(10));
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PACIFIED);
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_MOVE);
			}	
		}
	};

	CreatureAI* GetAI(Creature* p_Creature) const override
	{
		return new npc_wounded_marineAI(p_Creature);
	}
};




#ifndef __clang_analyzer__
void AddSC_blasted_lands()
{
	/// Phase Handlers
	new playerScript_old_blasted_lands_phase_handler();

	/// Old Blasted Lands Scripts
	new npc_blasted_lands_zidormi();
	new npc_deathly_usher();
	new npc_loramus_the_defiled();
	new npc_razelikh_the_defiler();
	new npc_loramus_thalipedes();
	new npc_kasim_sharim();
	
	/// New Blasted Lands Scripts
	new npc_archmage_khadgar_darkportal();
	new npc_world_invisible_trigger();
	new npc_vindicator_maraad_beachphase();
	new npc_bodrick_grey_beachphase();
	new npc_stitches_solderbolt();
	new npc_ironmarch_scout();
	new npc_ironmarch_executioner();
	new npc_nethergarde_prisoner();
	new npc_nethergarde_defender();
	new npc_wounded_marine();
}
#endif
