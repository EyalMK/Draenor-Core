////////////////////////////////////////////////////////////////////////////////
//
// Project-Hellscream https://hellscream.org
// Copyright (C) 2018-2020 Project-Hellscream-6.2
// Discord https://discord.gg/CWCF3C9
//
////////////////////////////////////////////////////////////////////////////////

/* ScriptData
SDName: Burning_Steppes
SD%Complete: 0
SDComment:
SDCategory: Burning Steppes
EndScriptData */


#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "ScriptedGossip.h"


/// Chiseled Golem - 48037
class npc_chiseled_golem : public CreatureScript
{
public:
	npc_chiseled_golem() : CreatureScript("npc_chiseled_golem") { }

	enum eData
	{
		// Quest
		QUEST_GOLEM_TRAINING = 28227,

		// Gossip Menu
		GOLEM_GOSSIP_MENU	= 12381,
		GOLEM_GOSSIP_OPTION	= 0,
		GOLEM_NPC_TEXT		= 17405,

		// Spells
		SPELL_BATTLE_READY		= 89353,
		SPELL_FLAME_BLAST		= 91313,
		SPELL_HEAVE				= 91314,
		SPELL_PERFECTLY_TUNED	= 89355,
		SPELL_WELL_HONED		= 89352,
		SPELL_COSMETIC_STUN		= 73566,

		// Events
		EVENT_FLAME_BLAST		= 0,
		EVENT_HEAVE				= 1
	};

	enum eActions
	{
		StartFight 		 = 0,
		RegenerateHealth = 1,
		RestartFight	 = 2,
		EndTraining		 = 3
	};

	bool OnGossipHello(Player* p_Player, Creature* p_Creature)
	{
		if (p_Player->GetQuestStatus(QUEST_GOLEM_TRAINING) == QUEST_STATUS_INCOMPLETE)
		{
			p_Player->ADD_GOSSIP_ITEM_DB(GOLEM_GOSSIP_MENU, GOLEM_GOSSIP_OPTION, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF);
			p_Player->SEND_GOSSIP_MENU(GOLEM_NPC_TEXT, p_Creature->GetGUID());
		}
		p_Player->SEND_GOSSIP_MENU(GOLEM_NPC_TEXT, p_Creature->GetGUID());
		return true;
	}

	bool OnGossipSelect(Player* p_Player, Creature* p_Creature, uint32 /*sender*/, uint32 action)
	{

		if (action == GOSSIP_ACTION_INFO_DEF)
		{
			p_Creature->AI()->DoAction(StartFight);
		}

		p_Player->PlayerTalkClass->ClearMenus();
		p_Player->PlayerTalkClass->SendCloseGossip();
		return true;
	}

	struct npc_chiseled_golemAI : public ScriptedAI
	{
		npc_chiseled_golemAI(Creature* p_Creature) : ScriptedAI(p_Creature) {
			TrainingComplete = 0;
		}

		uint32 TrainingComplete;


		void Reset() override
		{	
			events.Reset();
			ClearDelayedOperations(); // Clear operations
		}

		void EnterCombat(Unit* /*who*/) override
		{
			me->SetWalk(true);
			if (TrainingComplete == 1)
				events.ScheduleEvent(EVENT_HEAVE, urand(2000, 3000)); // learns ability after first round
			else if (TrainingComplete == 2)
				events.ScheduleEvent(EVENT_FLAME_BLAST, urand(1000, 3000)); // learns ability after second round
			
			
		}

		

		void KilledUnit(Unit* victim) override // If player that has the quest dies to the golem, reset the faction
		{
			if (victim->GetTypeId() == TYPEID_PLAYER && victim->ToPlayer()->GetTeamId() == TEAM_ALLIANCE)
				me->setFaction(35); // Default faction
				me->StopMoving(); // Golem shouldn't be moving by default
				Reset();
		}

		void JustDied(Unit* victim) override // reset faction on death
		{
			me->setFaction(35); // Default faction
			me->StopMoving(); // Golem shouldn't be moving by default
			Reset();
		}

		void UpdateAI(const uint32 diff)
		{

			UpdateOperations(diff);

			if (!UpdateVictim())
				return;

			events.Update(diff);

			if (me->HasUnitState(UNIT_STATE_CASTING))
				return;

			if (uint32 eventId = events.ExecuteEvent())
			{
				switch (eventId)
				{
					case EVENT_FLAME_BLAST:
						DoCastVictim(SPELL_FLAME_BLAST);
						events.ScheduleEvent(EVENT_HEAVE, urand(3000, 4000)); // uses the two abilities on third round
						break;
					case EVENT_HEAVE:
						DoCastVictim(SPELL_HEAVE);
						break;	
					default:
						break;
				}
			};

			DoMeleeAttackIfReady();
		}


		void DamageTaken(Unit* done_by, uint32 &damage, SpellInfo const*  /*p_SpellInfo*/)
		{
			if (done_by->ToPlayer() && done_by->ToPlayer()->HasQuest(QUEST_GOLEM_TRAINING)) // The functions run only if the damage is done by player whom has the quest
			{
				if (me->GetHealthPct() <= 1.0f || damage > me->GetHealth())
				{
					damage = 0;
					me->RemoveAllAurasByCaster(done_by->ToPlayer()->GetGUID()); // Remove all auras done by player
					TrainingComplete = TrainingComplete + 1;

					if (TrainingComplete < 3)
					{
						me->AI()->DoAction(RegenerateHealth);
					}	
					else if (TrainingComplete == 3)
						me->AI()->DoAction(EndTraining);
					
				}
			}
		}

		void DoAction(int32 const p_Action) override
		{
			switch (p_Action)
			{
				case StartFight:
				{
					AddTimedDelayedOperation(0 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->setFaction(103); // Hostile Faction
					});
					AddTimedDelayedOperation(0.2 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						Player* m_PlayerGuid = me->FindNearestPlayer(10.0f, true);
						if (m_PlayerGuid->GetQuestStatus(QUEST_GOLEM_TRAINING) == QUEST_STATUS_INCOMPLETE)
							me->CombatStart(m_PlayerGuid, true);
					});
					break;
				}

				case RegenerateHealth:
				{
						AddTimedDelayedOperation(0 * TimeConstants::IN_MILLISECONDS, [this]() -> void
						{
							Talk(0); // Random Text: Battle result: embarrasing failure || Beatdown received || Pummeling received || Defeated. Shame level: High.
							me->CastSpell(me, SPELL_COSMETIC_STUN); // Stun cosmetic

							me->setFaction(35); // Default faction to stop attacking
							me->canWalk() == false;

							me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PC); // Immune to nearby players and npcs
							me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_NPC);
							me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE); // Not attackable flag
							me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE); // Not selectable flag

						});

						// couldn't find a spell to heal this motherfucker - biggest hackfix of the year
						AddTimedDelayedOperation(1.5 * TimeConstants::IN_MILLISECONDS, [this]() -> void
						{
							me->SetHealth(me->CountPctFromMaxHealth(25.0f));
						});
						AddTimedDelayedOperation(2.5 * TimeConstants::IN_MILLISECONDS, [this]() -> void
						{
							me->SetHealth(me->CountPctFromMaxHealth(50.0f));
						});
						AddTimedDelayedOperation(3.5 * TimeConstants::IN_MILLISECONDS, [this]() -> void
						{
							me->SetHealth(me->CountPctFromMaxHealth(75.0f));
						});
						AddTimedDelayedOperation(5 * TimeConstants::IN_MILLISECONDS, [this]() -> void
						{
							me->SetHealth(me->CountPctFromMaxHealth(100.0f));
							me->AI()->DoAction(RestartFight);
						});

						break;
					
				}

				case RestartFight:
				{

					Talk(1); // Self-training complete!
					me->RemoveAurasDueToSpell(SPELL_COSMETIC_STUN); // Remove stun cosmetic

					me->setFaction(103); // Hostile faction to start attacking
					me->canWalk() == true;

					me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PC); // Remove immunity
					me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_NPC);
					me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE); // Remove not attackable flag
					me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE); // Remove Not selectable flag

					Player* m_PlayerGuid = me->FindNearestPlayer(10.0f, true);
					if (m_PlayerGuid->GetQuestStatus(QUEST_GOLEM_TRAINING) == QUEST_STATUS_INCOMPLETE)
						me->CombatStart(m_PlayerGuid, true);

					if (TrainingComplete == 1)
					{
						me->RemoveAurasDueToSpell(SPELL_WELL_HONED);
						me->RemoveAurasDueToSpell(SPELL_BATTLE_READY);
						me->RemoveAurasDueToSpell(SPELL_PERFECTLY_TUNED);
						me->CastSpell(me, SPELL_WELL_HONED); // Cast Spell Well Honed after first training run
					}
					else if (TrainingComplete == 2)
					{
						me->RemoveAurasDueToSpell(SPELL_WELL_HONED);
						me->RemoveAurasDueToSpell(SPELL_BATTLE_READY);
						me->RemoveAurasDueToSpell(SPELL_PERFECTLY_TUNED);
						me->CastSpell(me, SPELL_BATTLE_READY); // Cast Spell Battle Ready after second training run
					}
					break;
				}
					
				case EndTraining:
				{
					AddTimedDelayedOperation(0 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						
						Talk(2); // Training level sufficient.
						me->CastSpell(me, SPELL_PERFECTLY_TUNED); // Cast spell Perfectly Tuned
						
						me->setFaction(35); // Default faction to stop attacking
						me->canWalk() == false;

						me->SetHealth(me->CountPctFromMaxHealth(1.0f)); // Set health 1 out of max health
						me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PC); // Remove Non-attackable flag
						me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_NPC);
						me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE); // Remove not attackable flag	
						me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE); // Not selectable flag

						Unit* GetHitUnit = me->getVictim();
						if (GetHitUnit->GetTypeId() == TYPEID_PLAYER)
							me->RemoveAllAurasByCaster(GetHitUnit->ToPlayer()->GetGUID()); // Remove all auras done by player
							if (GetHitUnit->ToPlayer()->GetQuestStatus(QUEST_GOLEM_TRAINING) == QUEST_STATUS_INCOMPLETE)
								GetHitUnit->ToPlayer()->KilledMonsterCredit(48037, GetHitUnit->ToPlayer()->GetGUID()); // Award Player kill credit

					});
					AddTimedDelayedOperation(5 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						TrainingComplete = 0;
						me->DespawnOrUnsummon(); // Despawn
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
		return new npc_chiseled_golemAI(p_Creature);
	}
};

void AddSC_burning_steppes()
{
	new npc_chiseled_golem();
}
