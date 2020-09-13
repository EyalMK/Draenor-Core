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



/// Blackrock War Kodo - 48111
class npc_blackrock_war_kodo : public CreatureScript
{
public:
	npc_blackrock_war_kodo() : CreatureScript("npc_blackrock_war_kodo") { }

	enum eData
	{
		/// Quest
		QUEST_KODOCALLER_HORN = 28252,

		/// Npcs
		NPC_BLACKROCK_KODO = 48111,
		NPC_KILL_CREDIT	   = 48112,

		/// Spells
		SPELL_KODO_STOMP	  = 6266,
		SPELL_HORN_OF_CALLERS = 89477, // triggered by item ID: 63356

		// Events
		EVENT_STOMP				= 0,
		EVENT_CHECK_STOMP_DIST  = 1,
	};

	struct npc_blackrock_war_kodoAI : public ScriptedAI
	{
		npc_blackrock_war_kodoAI(Creature* p_Creature) : ScriptedAI(p_Creature) {
			m_PlayerGUID = 0;
		}

		float randHealth;
		uint64 m_PlayerGUID;

		void Reset() override
		{
			randHealth = urand(50.0f, 55.0f);
			events.Reset();
		}

		void EnterCombat(Unit* /*who*/) override
		{
			events.ScheduleEvent(EVENT_STOMP, urand(2000, 3000));
		}

		void SpellHit(Unit* Caster, SpellInfo const* spell) override
		{
			if (spell->Id == SPELL_HORN_OF_CALLERS)
				if (Player* player = Caster->ToPlayer())
					if (player->GetQuestStatus(QUEST_KODOCALLER_HORN) == QUEST_STATUS_INCOMPLETE)
					{
						m_PlayerGUID = player->GetGUID();

						int32 FightOrNoFight = urand(1, 2);
						switch (FightOrNoFight)
						{
							case 1:
							{
								if (Player* player = ObjectAccessor::GetPlayer(*me, m_PlayerGUID))
									player->KilledMonsterCredit(NPC_BLACKROCK_KODO);

								/// Move forward 10 yards
								float x, y, z;
								me->GetClosePoint(x, y, z, me->GetObjectSize() / 3, 10.0f);
								me->GetMotionMaster()->MovePoint(1, x, y, z);
								me->DespawnOrUnsummon(5000);
								break;
							}
							case 2:
							{
								/// Find player, hostile + attack
								if (Player* player = ObjectAccessor::GetPlayer(*me, m_PlayerGUID))
								{
									me->setFaction(14); // Hostile faction
									me->CombatStart(player);
								}
								break;
							}
						}
					}
		}

		void DamageTaken(Unit* doneBy, uint32& damage, SpellInfo const*  /*p_SpellInfo*/) override
		{
			if (me->getFaction() == 14)
			{
				if (doneBy->ToPlayer())
					if (me->GetHealth() <= damage || me->GetHealthPct() <= randHealth)
					{
						/// Make friendly + give kill credit
						damage = 0;
						me->setFaction(35); // Friendly faction
						me->AttackStop();

						if (Player* player = ObjectAccessor::GetPlayer(*me, m_PlayerGUID))
						{
							player->CombatStop();
							player->KilledMonsterCredit(NPC_BLACKROCK_KODO);
						}

						/// Move forward 10 yards
						float x, y, z;
						me->GetClosePoint(x, y, z, me->GetObjectSize() / 3, 10.0f);
						me->GetMotionMaster()->MovePoint(1, x, y, z);
						me->DespawnOrUnsummon(5000);
					}
			}
		}


		void UpdateAI(const uint32 diff)
		{

			if (!UpdateVictim())
				return;

			events.Update(diff);

			if (me->HasUnitState(UNIT_STATE_CASTING))
				return;

			if (uint32 eventId = events.ExecuteEvent())
			{
				switch (eventId)
				{

				case EVENT_CHECK_STOMP_DIST: // Check Range, if it's less than 8 yrds then schedule a stomp event.
					if (me->IsWithinDistInMap(me->getVictim(), 8.0f))
					{
						events.ScheduleEvent(EVENT_STOMP, 0);
						break;
					}
					events.ScheduleEvent(EVENT_CHECK_STOMP_DIST, urand(4000, 6000));
					break;

				case EVENT_STOMP:
					DoCastVictim(SPELL_KODO_STOMP);
					events.ScheduleEvent(EVENT_STOMP, urand(15000, 25000));
					break;
				}
			};

			DoMeleeAttackIfReady();
		}
	};

	CreatureAI* GetAI(Creature* p_Creature) const override
	{
		return new npc_blackrock_war_kodoAI(p_Creature);
	}
};




enum DisguiseSpells
{
	SPELL_DISGUISE_FIREGUT_OGRE_M = 89255,
	SPELL_DISGUISE_FIREGUT_OGRE_F = 89256,
	SPELL_DISGUISE_GOBLIN_MERC_M = 89257,
	SPELL_DISGUISE_GOBLIN_MERC_F = 89258,
	SPELL_DISGUISE_SMOLDERTHORN_M = 89259,
	SPELL_DISGUISE_SMOLDERTHORN_F = 89260,
	SPELL_DISGUISE_BLACKROCK_ORC_M = 89253,
	SPELL_DISGUISE_BLACKROCK_ORC_F = 89254
};



/// Blackrock Disguise - 89261
class spell_blackrock_disguise : public SpellScriptLoader
{
public:
	spell_blackrock_disguise() : SpellScriptLoader("spell_blackrock_disguise") { }

	class spell_blackrock_disguise_SpellScript : public SpellScript
	{
		PrepareSpellScript(spell_blackrock_disguise_SpellScript);

		void HandleCastDisguise()
		{
			if (Unit* caster = GetCaster())
			{
				uint8 gender = caster->getGender();
				if (gender == GENDER_MALE)
				{
					switch (caster->getRace())
					{
					case RACE_HUMAN:
					case RACE_DWARF:
					case RACE_UNDEAD_PLAYER:
					{
						caster->CastSpell(caster, SPELL_DISGUISE_FIREGUT_OGRE_M, true);
						break;
					}
					case RACE_GNOME:
					case RACE_GOBLIN:
					{
						caster->CastSpell(caster, SPELL_DISGUISE_GOBLIN_MERC_M, true);
						break;
					}
					case RACE_NIGHTELF:
					case RACE_BLOODELF:
					case RACE_TROLL:
					{
						caster->CastSpell(caster, SPELL_DISGUISE_SMOLDERTHORN_M, true);
						break;
					}
					case RACE_DRAENEI:
					case RACE_WORGEN:
					case RACE_ORC:
					case RACE_TAUREN:
					{
						caster->CastSpell(caster, SPELL_DISGUISE_BLACKROCK_ORC_M, true);
						break;
					}
					default:
						break;
					}
				}
				else
				{
					switch (caster->getRace())
					{
					case RACE_HUMAN:
					case RACE_DWARF:
					case RACE_UNDEAD_PLAYER:
					{
						caster->CastSpell(caster, SPELL_DISGUISE_FIREGUT_OGRE_F, true);
						break;
					}
					case RACE_GNOME:
					case RACE_GOBLIN:
					{
						caster->CastSpell(caster, SPELL_DISGUISE_GOBLIN_MERC_F, true);
						break;
					}
					case RACE_NIGHTELF:
					case RACE_BLOODELF:
					case RACE_TROLL:
					{
						caster->CastSpell(caster, SPELL_DISGUISE_SMOLDERTHORN_F, true);
						break;
					}
					case RACE_DRAENEI:
					case RACE_WORGEN:
					case RACE_ORC:
					case RACE_TAUREN:
					{
						caster->CastSpell(caster, SPELL_DISGUISE_BLACKROCK_ORC_F, true);
						break;
					}
					default:
						break;
					}
				}
			}
		}

		void Register()
		{
			AfterCast += SpellCastFn(spell_blackrock_disguise_SpellScript::HandleCastDisguise);
		}
	};

	SpellScript* GetSpellScript() const
	{
		return new spell_blackrock_disguise_SpellScript();
	}
};

/// Razor Sharp Scorpid Barb - 89447
class spell_razor_sharp_scorpid_barb : public SpellScriptLoader
{
public:
	spell_razor_sharp_scorpid_barb() : SpellScriptLoader("spell_razor_sharp_scorpid_barb") { }

	enum Id
	{
		// Npc
		NPC_VOODOOIST_TIMAN = 48100,
		NPC_GORLOP = 9176,
		NPC_WORGMISTRESS_OTHANA = 48099
	};

	class spell_razor_sharp_scorpid_barb_SpellScript : public SpellScript
	{
		PrepareSpellScript(spell_razor_sharp_scorpid_barb_SpellScript);

		SpellCastResult CheckCast()
		{
			if (GetCaster()->GetTypeId() == TYPEID_PLAYER)
			{
				if (Creature* voodooistTiman = GetCaster()->FindNearestCreature(NPC_VOODOOIST_TIMAN, 7.0f))
				{
					voodooistTiman->Kill(voodooistTiman, false);
					GetCaster()->ToPlayer()->KilledMonsterCredit(NPC_VOODOOIST_TIMAN);
					return SPELL_CAST_OK;
				}
				if (Creature* npcGorlop = GetCaster()->FindNearestCreature(NPC_GORLOP, 7.0f))
				{
					npcGorlop->Kill(npcGorlop, false);
					GetCaster()->ToPlayer()->KilledMonsterCredit(NPC_GORLOP);
					return SPELL_CAST_OK;
				}
				if (Creature* worgmistressOthana = GetCaster()->FindNearestCreature(NPC_WORGMISTRESS_OTHANA, 7.0f))
				{
					worgmistressOthana->Kill(worgmistressOthana, false);
					GetCaster()->ToPlayer()->KilledMonsterCredit(NPC_WORGMISTRESS_OTHANA);
					return SPELL_CAST_OK;
				}
			}

			return SPELL_FAILED_BAD_TARGETS;
		}

		void Register()
		{
			OnCheckCast += SpellCheckCastFn(spell_razor_sharp_scorpid_barb_SpellScript::CheckCast);
		}
	};

	SpellScript* GetSpellScript() const
	{
		return new spell_razor_sharp_scorpid_barb_SpellScript();
	}
};

/// Worgsaw - 89776
class spell_worgsaw : public SpellScriptLoader
{
public:
	spell_worgsaw() : SpellScriptLoader("spell_worgsaw") { }

	enum Id
	{
		// Npc
		NPC_GIANT_EMBER_WORG = 9697
	};

	class spell_worgsaw_SpellScript : public SpellScript
	{
		PrepareSpellScript(spell_worgsaw_SpellScript);

		SpellCastResult CheckCast()
		{
			if (Creature* giantEmberWorg = GetCaster()->FindNearestCreature(NPC_GIANT_EMBER_WORG, 5.0f, false))
			{
				giantEmberWorg->DespawnOrUnsummon(3000);
				return SPELL_CAST_OK;
			}
			return SPELL_FAILED_TARGET_AURASTATE;
		}

		void Register()
		{
			OnCheckCast += SpellCheckCastFn(spell_worgsaw_SpellScript::CheckCast);
		}
	};

	SpellScript* GetSpellScript() const
	{
		return new spell_worgsaw_SpellScript();
	}
};


/// Remove Blackrock Disguise - 90365
class spell_remove_blackrock_disguise : public SpellScriptLoader
{
public:
	spell_remove_blackrock_disguise() : SpellScriptLoader("spell_remove_blackrock_disguise") { }

	enum Id
	{
		NPC_ENTRY_KEESHAN_03 = 48346
	};

	class spell_remove_blackrock_disguise_SpellScript : public SpellScript
	{
		PrepareSpellScript(spell_remove_blackrock_disguise_SpellScript);

		void HandleCleanupAll()
		{
			if (Unit* caster = GetCaster())
			{
				std::list<Unit*> targets;
				JadeCore::AnyFriendlyUnitInObjectRangeCheck u_check(caster, caster, 300.0f);
				JadeCore::UnitListSearcher<JadeCore::AnyFriendlyUnitInObjectRangeCheck> searcher(caster, targets, u_check);
				caster->VisitNearbyObject(300.0f, searcher);
				for (std::list<Unit*>::const_iterator itr = targets.begin(); itr != targets.end(); ++itr)
				{
					if ((*itr) && (*itr)->isSummon() && (*itr)->ToTempSummon()->GetCharmerOrOwner() == caster)
					{
						switch ((*itr)->ToTempSummon()->GetEntry())
						{
						case NPC_ENTRY_KEESHAN_03:
						{
							(*itr)->ToTempSummon()->DespawnOrUnsummon(1);
							break;
						}
						default:
							break;
						}
					}
				}
			}
		}

		void Register()
		{
			AfterCast += SpellCastFn(spell_remove_blackrock_disguise_SpellScript::HandleCleanupAll);
		}
	};

	SpellScript* GetSpellScript() const
	{
		return new spell_remove_blackrock_disguise_SpellScript();
	}
};


void AddSC_burning_steppes()
{
	/// Npcs
	new npc_chiseled_golem();
	new npc_blackrock_war_kodo();


	/// Spells
	new spell_blackrock_disguise();
	new spell_razor_sharp_scorpid_barb();
	new spell_worgsaw();
	new spell_remove_blackrock_disguise();
}
