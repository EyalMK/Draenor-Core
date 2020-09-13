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
#include "ScriptPCH.h"
#include "Vehicle.h"
#include "CreatureAI.h"
#include "GameObject.h"


/* Automatic rescheduling if creature is already casting */
#define RESCHEDULE_IF_CASTING if (me->HasUnitState(UNIT_STATE_CASTING)) { events.ScheduleEvent(eventId, 1); break; }


class npc_th_anduinn_wrynn : public CreatureScript
{
public:
	npc_th_anduinn_wrynn() : CreatureScript("npc_th_anduinn_wrynn")
	{
	}

	enum questId
	{
		QUEST_THE_USUAL_SUSPECTS = 26997,
		QUEST_UNHOLY_COW = 27060
	};

	bool OnQuestReward(Player* player, Creature* creature, Quest const* quest, uint32 opt)
	{
		if (quest->GetQuestId() == QUEST_UNHOLY_COW)
		{
			creature->AI()->Talk(10, player->GetGUID());
			return true;
		}
		return true;
	}

	struct npc_th_anduinn_wrynnAI : public ScriptedAI
	{
		npc_th_anduinn_wrynnAI(Creature* creature) : ScriptedAI(creature)
		{
			playerOwner = NULL;
		}

		EventMap events;

		enum eventId
		{
			EVENT_CHECK_AREA_BEFORE_FOLLOW = 1,
			EVENT_CHECK_FOR_MOUNT,
			EVENT_CHECK_FOR_OWNER,
			EVENT_CHECK_WORKERS,
			EVENT_MOVE_AMBUSH,
			EVENT_START_AMBUSH,
			EVENT_HEAL_OWNER,
			EVENT_SUMMON_AMBUSHER,
			EVENT_COMPLETE,
			EVENT_MOVE_EXAMINATE,
			EVENT_FINISH_EXAMINATING,
			EVENT_CHECK_QUEST
		};

		enum mountId
		{
			MOUNT_ANDUIN_STEED = 33819,
			MOUNT_ANDUIN_GRYPHON = 33805
		};

		enum pointIid
		{
			POINT_OWNER = 1,
			POINT_ALTAR,
			POINT_AMBUSH,
			POINT_EXAMINATE_1,
			POINT_EXAMINATE_2
		};

		enum spellId
		{
			SPELL_GRILLING = 83577,
			SPELL_WORKER_PACIFIED = 6462,
			SPELL_ROOTED_GRILLING = 93960,
			SPELL_PW_SHIELD = 83842,
			SPELL_FLASH_HEAL = 83844,
			SPELL_TWILIGHT_STRIKER = 83836
		};

		enum npcId
		{
			NPC_ENTRY_WORKER = 29152
		};

		enum actionId
		{
			ACTION_PREPARE_TO_AMBUSH = 1,
			ACTION_MOVE_AMBUSH,
			ACTION_EXAMINATE
		};

		enum creditId
		{
			QUEST_CREDIT_AMBUSH = 44910,
			QUEST_CREDIT_PAPERS = 44921
		};

		enum questId
		{
			QUEST_EXPERT_OPINION = 28807
		};

		void IsSummonedBy(Unit* owner)
		{
			if (owner->GetTypeId() != TYPEID_PLAYER)
				return;

			me->SetSeerGUID(owner->GetGUID());
			playerOwner = owner;
			events.ScheduleEvent(EVENT_CHECK_AREA_BEFORE_FOLLOW, 2000);
			events.ScheduleEvent(EVENT_CHECK_FOR_MOUNT, 1000);
			events.ScheduleEvent(EVENT_CHECK_FOR_OWNER, 2000);
			events.ScheduleEvent(EVENT_CHECK_WORKERS, 2000);

			me->SetCanFly(false);
			me->SetDisableGravity(false);
			me->SetHover(false);
			ground = true;
			air = false;
			ambush = false;
			investigating = false;
		};

		void MovementInform(uint32 type, uint32 pointId)
		{
			switch (pointId)
			{
			case POINT_OWNER:
			{
				events.ScheduleEvent(EVENT_CHECK_FOR_MOUNT, 1250);
				events.ScheduleEvent(EVENT_CHECK_AREA_BEFORE_FOLLOW, 1500);
				break;
			}
			case POINT_ALTAR:
			{
				me->Dismount();
				me->SetWalk(true);
				TalkWithDelay(1000, 4);
				events.ScheduleEvent(EVENT_MOVE_AMBUSH, 100);
				break;
			}
			case POINT_AMBUSH:
			{
				me->SetControlled(true, UNIT_STATE_ROOT);
				TalkWithDelay(1500, 5);
				if (Unit* owner = me->ToTempSummon()->GetSummoner())
				{
					me->SetFacingToObject(owner);
					TalkWithDelay(11000, 6, owner->GetGUID());
				}
				TalkWithDelay(27500, 7);
				TalkWithDelay(44000, 8);
				events.ScheduleEvent(EVENT_START_AMBUSH, 11000);
				break;
			}
			case POINT_EXAMINATE_1:
			{
				if (investigating == false)
					break;

				Talk(11);
				events.ScheduleEvent(EVENT_MOVE_EXAMINATE, 6000);
				me->SetWalk(true);
				break;
			}
			case POINT_EXAMINATE_2:
			{
				if (investigating == false)
					break;

				Talk(12);
				me->HandleEmoteCommand(EMOTE_STATE_USE_STANDING);
				me->SetFacingTo(2.31f);
				me->SetControlled(true, UNIT_STATE_ROOT);
				events.ScheduleEvent(EVENT_FINISH_EXAMINATING, 8500);
				break;
			}
			default:
				break;
			}
		}

		void DamageTaken(Unit* attacker, uint32& damage)
		{
			if (attacker->GetTypeId() == TYPEID_UNIT)
				damage = urand(550, 974);
		}

		void DoAction(int32 action)
		{
			switch (action)
			{
			case ACTION_PREPARE_TO_AMBUSH:
			{
				if (ambush == false && me->GetPhaseMask() & 4096)
				{
					ambush = true;
					me->GetMotionMaster()->Clear();
					me->GetMotionMaster()->MovementExpired(false);
					me->SetWalk(true);
					me->GetMotionMaster()->MovePoint(POINT_ALTAR, -8048.34f, 950.91f, 79.23f);
					break;
				}
			}
			case ACTION_MOVE_AMBUSH:
			{
				me->GetMotionMaster()->MovementExpired(false);
				me->GetMotionMaster()->MovePoint(POINT_AMBUSH, -8046.52f, 965.96f, 80.27f);
				break;
			}
			case ACTION_EXAMINATE:
			{
				if (investigating == false)
				{
					investigating = true;
					me->GetMotionMaster()->Clear();
					me->GetMotionMaster()->MovementExpired(false);
					me->SetWalk(false);
					me->GetMotionMaster()->MovePoint(POINT_EXAMINATE_1, -8714.76f, 324.08f, 122.11f);
				}
				break;
			}
			default:
				break;
			}
		}

		void UpdateAI(uint32 diff)
		{
			events.Update(diff);

			while (uint32 eventId = events.ExecuteEvent())
			{
				switch (eventId)
				{
				case EVENT_CHECK_AREA_BEFORE_FOLLOW:
				{
					if (playerOwner && playerOwner != NULL && playerOwner->IsInWorld())
					{
						if (playerOwner->GetDistance2d(me) > 8)
						{
							me->GetMotionMaster()->MoveFollow(playerOwner, 3.0f, 0);
							Talk(3, playerOwner->GetGUID());
							events.CancelEvent(EVENT_CHECK_AREA_BEFORE_FOLLOW);
							break;
						}
					}
					events.RescheduleEvent(EVENT_CHECK_AREA_BEFORE_FOLLOW, 2000);
					break;
				}
				case EVENT_CHECK_FOR_MOUNT:
				{
					if (playerOwner && playerOwner != NULL && playerOwner->IsInWorld())
					{
						if (playerOwner->IsMounted())
						{
							if (playerOwner->IsFlying() && ground == true && ambush == false && investigating == false)
							{
								me->SetWalk(false);
								me->AddUnitState(UNIT_STATE_IGNORE_PATHFINDING);
								me->Mount(MOUNT_ANDUIN_GRYPHON);
								me->SetSpeed(MOVE_RUN, 7.0f, true);
								me->SetSpeed(MOVE_FLIGHT, 7.0f, true);
								me->SetCanFly(true);
								me->SetDisableGravity(true);
								me->SetHover(true);
								ground = false;
								air = true;
							}
							if (!playerOwner->IsFlying() && (air == true || ground == true) && ambush == false && investigating == false)
							{
								me->ClearUnitState(UNIT_STATE_IGNORE_PATHFINDING);
								me->Mount(MOUNT_ANDUIN_STEED);
								me->SetDisableGravity(false);
								me->SetCanFly(false);
								me->SetHover(false);
								air = false;
								ground = true;
							}
						}
						else
						{
							me->ClearUnitState(UNIT_STATE_IGNORE_PATHFINDING);

							if (ambush == true || investigating == true)
							{
								events.RescheduleEvent(EVENT_CHECK_FOR_MOUNT, 1000);
								break;
							}

							if (ground == true)
							{
								if (me->IsMounted())
									me->Dismount();

								me->SetCanFly(false);
								me->SetDisableGravity(false);
								me->SetHover(false);
								ground = true;
								air = false;
								events.RescheduleEvent(EVENT_CHECK_FOR_MOUNT, 1000);
								break;
							}
							else
							{
								if (me->GetPositionZ() != playerOwner->GetPositionZ() && me->IsFlying() && air == true && !playerOwner->IsFlying() && !playerOwner->HasUnitMovementFlag(MOVEMENTFLAG_FALLING))
								{
									me->GetMotionMaster()->Clear();
									me->GetMotionMaster()->MoveJump(playerOwner->GetPositionX(), playerOwner->GetPositionY(), playerOwner->GetPositionZ(), 12.5f, 12.5f, POINT_OWNER);
									events.CancelEvent(EVENT_CHECK_FOR_MOUNT);
									ground = true;
									break;
								}
							}
						}

						events.RescheduleEvent(EVENT_CHECK_FOR_MOUNT, 1000);
					}
					break;
				}
				case EVENT_CHECK_FOR_OWNER:
				{
					if (ambush == true || investigating == true)
					{
						events.RescheduleEvent(EVENT_CHECK_FOR_OWNER, 1000);
						break;
					}

					if (playerOwner && playerOwner != NULL)
					{
						if (playerOwner->GetMapId() != me->GetMapId())
						{
							me->DespawnOrUnsummon(1);
							break;
						}
					}
					events.RescheduleEvent(EVENT_CHECK_FOR_OWNER, 1000);
					break;
				}
				case EVENT_CHECK_WORKERS:
				{
					if (ambush == true || investigating == true)
					{
						events.RescheduleEvent(EVENT_CHECK_WORKERS, 2000);
						break;
					}

					if (playerOwner && playerOwner != NULL)
					{
						if (playerOwner->ToPlayer()->GetQuestStatus(QUEST_THE_USUAL_SUSPECTS) == QUEST_STATUS_INCOMPLETE)
						{
							if (Creature* worker = playerOwner->FindNearestCreature(NPC_ENTRY_WORKER, 6.0f, true))
							{
								if (worker->HasAura(SPELL_WORKER_PACIFIED))
								{
									events.RescheduleEvent(EVENT_CHECK_WORKERS, 2000);
									break;
								}
								if (playerOwner->isInFront(worker))
								{
									worker->AddAura(SPELL_WORKER_PACIFIED, worker);
									playerOwner->CastSpell(playerOwner, SPELL_ROOTED_GRILLING, true);
									playerOwner->CastSpell(playerOwner, SPELL_GRILLING);
									worker->SetControlled(true, UNIT_STATE_ROOT);
									worker->SetFacingToObject(playerOwner);
									worker->AI()->TalkWithDelay(2500, 0);
									playerOwner->ToPlayer()->KilledMonsterCredit(44827);
									worker->GetMotionMaster()->Clear();
									worker->HandleEmoteCommand(EMOTE_STATE_COWER);
									worker->DespawnOrUnsummon(10000);
									if (roll_chance_f(15.0f))
										TalkWithDelay(7500, 1);
								}
							}
						}
					}
					events.RescheduleEvent(EVENT_CHECK_WORKERS, 2000);
					break;
				}
				case EVENT_MOVE_AMBUSH:
				{
					DoAction(ACTION_MOVE_AMBUSH);
					events.CancelEvent(EVENT_MOVE_AMBUSH);
					break;
				}
				case EVENT_START_AMBUSH:
				{
					DoCast(me, SPELL_PW_SHIELD, true);
					DoCast(me, SPELL_TWILIGHT_STRIKER, true);
					events.ScheduleEvent(EVENT_HEAL_OWNER, 3000);
					events.ScheduleEvent(EVENT_SUMMON_AMBUSHER, 16500);
					events.ScheduleEvent(EVENT_COMPLETE, 65000);
					events.CancelEvent(EVENT_START_AMBUSH);
					break;
				}
				case EVENT_HEAL_OWNER:
				{
					if (Unit* owner = me->ToTempSummon()->GetSummoner())
					{
						if (!owner->isInCombat())
						{
							events.RescheduleEvent(EVENT_HEAL_OWNER, urand(5000, 6000));
							break;
						}

						if (me->GetHealth() < me->GetHealthPct() * 0.85f)
							DoCast(me, SPELL_FLASH_HEAL);
						else
							DoCast(owner, SPELL_FLASH_HEAL);
					}
					events.RescheduleEvent(EVENT_HEAL_OWNER, urand(5000, 6000));
					break;
				}
				case EVENT_SUMMON_AMBUSHER:
				{
					DoCast(me, SPELL_PW_SHIELD, true);
					DoCast(me, SPELL_TWILIGHT_STRIKER, true);
					events.RescheduleEvent(EVENT_SUMMON_AMBUSHER, 16500);
					break;
				}
				case EVENT_COMPLETE:
				{
					events.CancelEvent(EVENT_COMPLETE);
					events.CancelEvent(EVENT_HEAL_OWNER);
					events.CancelEvent(EVENT_SUMMON_AMBUSHER);
					if (Unit* owner = me->ToTempSummon()->GetCharmerOrOwner())
					{
						owner->ToPlayer()->KilledMonsterCredit(QUEST_CREDIT_AMBUSH);
						TalkWithDelay(500, 9, owner->GetGUID());
						me->SetControlled(false, UNIT_STATE_ROOT);
						me->GetMotionMaster()->MoveFollow(owner, 3.0f, 0);
						me->RemoveAurasDueToSpell(SPELL_PW_SHIELD);
					}
					ambush = false;
					break;
				}
				case EVENT_MOVE_EXAMINATE:
				{
					me->GetMotionMaster()->MovementExpired(false);
					me->GetMotionMaster()->MovePoint(POINT_EXAMINATE_2, -8714.82f, 328.82f, 122.10f);
					events.CancelEvent(EVENT_MOVE_EXAMINATE);
					break;
				}
				case EVENT_FINISH_EXAMINATING:
				{
					if (Unit* owner = me->ToTempSummon()->GetCharmerOrOwner())
					{
						owner->ToPlayer()->KilledMonsterCredit(QUEST_CREDIT_PAPERS);
						TalkWithDelay(500, 13, owner->GetGUID());
						me->SetWalk(false);
						me->SetFacingToObject(owner);
						events.ScheduleEvent(EVENT_CHECK_QUEST, 2000);
					}
					me->HandleEmoteCommand(EMOTE_STATE_NONE);
					me->SetStandState(EMOTE_STATE_STAND);
					events.CancelEvent(EVENT_FINISH_EXAMINATING);
					break;
				}
				case EVENT_CHECK_QUEST:
				{
					if (Unit* owner = me->ToTempSummon()->GetCharmerOrOwner())
					{
						if (owner->GetTypeId() == TYPEID_PLAYER)
						{
							if (owner->ToPlayer()->GetQuestStatus(QUEST_EXPERT_OPINION) == QUEST_STATUS_REWARDED)
							{
								me->DespawnOrUnsummon(1);
								events.CancelEvent(EVENT_CHECK_QUEST);
								break;
							}
						}
					}
					events.RescheduleEvent(EVENT_CHECK_QUEST, 2000);
					break;
				}
				default:
					break;
				}
			}

			DoMeleeAttackIfReady();
		}

	protected:
		Unit* playerOwner;
		bool ground;
		bool air;
		bool ambush;
		bool investigating;
	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_th_anduinn_wrynnAI(creature);
	}
};

class areatrigger_th_stormwind_graves : public AreaTriggerScript
{
public:
	areatrigger_th_stormwind_graves() : AreaTriggerScript("at_stormwind_graves")
	{
	}

	enum npcId
	{
		NPC_ANDUIN_WRYNN = 44293
	};

	enum questId
	{
		QUEST_RALLYING_THE_FLEET = 26975
	};

	bool OnTrigger(Player* player, AreaTriggerEntry const* trigger)
	{
		if (player->isAlive() && player->GetQuestStatus(QUEST_RALLYING_THE_FLEET) == QUEST_STATUS_INCOMPLETE)
		{
			std::list<Creature*> creatures;
			GetCreatureListWithEntryInGrid(creatures, player, NPC_ANDUIN_WRYNN, 85.0f);
			if (creatures.empty())
				return false;

			for (std::list<Creature*>::iterator iter = creatures.begin(); iter != creatures.end(); ++iter)
			{
				if ((*iter)->ToTempSummon() && (*iter)->ToTempSummon()->GetSummoner() == player)
					player->CompleteQuest(QUEST_RALLYING_THE_FLEET);
			}
		}
		return false;
	}
};

class areatrigger_th_wollerton_stead : public AreaTriggerScript
{
public:
	areatrigger_th_wollerton_stead() : AreaTriggerScript("areatrigger_th_wollerton_stead")
	{
	}

	enum npcId
	{
		NPC_ANDUIN_WRYNN = 44293
	};

	enum questId
	{
		QUEST_PEASANT_PROBLEMS = 27044
	};

	bool OnTrigger(Player* player, AreaTriggerEntry const* trigger)
	{
		if (player->isAlive() && player->GetQuestStatus(QUEST_PEASANT_PROBLEMS) == QUEST_STATUS_INCOMPLETE)
		{
			std::list<Creature*> creatures;
			GetCreatureListWithEntryInGrid(creatures, player, NPC_ANDUIN_WRYNN, 85.0f);
			if (creatures.empty())
				return false;

			for (std::list<Creature*>::iterator iter = creatures.begin(); iter != creatures.end(); ++iter)
			{
				if ((*iter)->ToTempSummon() && (*iter)->ToTempSummon()->GetSummoner() == player)
					player->CompleteQuest(QUEST_PEASANT_PROBLEMS);
			}
		}
		return false;
	}
};

class areatrigger_th_crime_scene : public AreaTriggerScript
{
public:
	areatrigger_th_crime_scene() : AreaTriggerScript("areatrigger_th_crime_scene")
	{
	}

	enum npcId
	{
		NPC_ANDUIN_WRYNN = 44293,
		NPC_CULT_SITE = 50253
	};

	enum questId
	{
		QUEST_UNHOLY_COW = 27060
	};

	enum creditId
	{
		QUEST_CREDIT_CRIME_SCENE_DISCOVERED = 44909
	};

	bool OnTrigger(Player* player, AreaTriggerEntry const* trigger)
	{
		if (player->isAlive() && player->GetQuestStatus(QUEST_UNHOLY_COW) == QUEST_STATUS_INCOMPLETE)
		{
			std::list<Creature*> creatures;
			GetCreatureListWithEntryInGrid(creatures, player, NPC_ANDUIN_WRYNN, 85.0f);
			if (creatures.empty())
				return false;

			for (std::list<Creature*>::iterator iter = creatures.begin(); iter != creatures.end(); ++iter)
			{
				if ((*iter)->ToTempSummon() && (*iter)->ToTempSummon()->GetSummoner() == player)
				{
					player->KilledMonsterCredit(QUEST_CREDIT_CRIME_SCENE_DISCOVERED);
					(*iter)->AI()->DoAction(1);
				}
			}
		}
		return false;
	}
};

class npc_th_twilight_striker : public CreatureScript
{
public:
	npc_th_twilight_striker() : CreatureScript("npc_th_twilight_striker")
	{
	}

	struct npc_th_twilight_strikerAI : public ScriptedAI
	{
		npc_th_twilight_strikerAI(Creature* creature) : ScriptedAI(creature)
		{
		}

		EventMap events;

		enum eventId
		{
			EVENT_JUMP_TO = 1,
			EVENT_DEADLY_POISON,
			EVENT_SINISTER_STRIKE
		};

		enum spellId
		{
			SPELL_DEADLY_POISON = 3583,
			SPELL_SINISTER_STRIKE = 14873
		};

		void IsSummonedBy(Unit* summoner)
		{
			AttackStart(summoner);
			me->GetMotionMaster()->MoveJump(-8052.62f + 3, 958.88f - 3, 79.33f, 14.5f, 14.5f);
		}

		void EnterCombat(Unit* /*who*/)
		{
			events.ScheduleEvent(EVENT_DEADLY_POISON, 2000);
			events.ScheduleEvent(EVENT_SINISTER_STRIKE, 2200);
		}

		void UpdateAI(uint32 diff)
		{
			if (!UpdateVictim())
				return;

			events.Update(diff);

			while (uint32 eventId = events.ExecuteEvent())
			{
				switch (eventId)
				{
				case EVENT_DEADLY_POISON:
				{
					if (Unit* victim = me->getVictim())
					{
						if (!victim->HasAura(SPELL_DEADLY_POISON))
							DoCastVictim(SPELL_DEADLY_POISON, true);
					}
					events.RescheduleEvent(EVENT_DEADLY_POISON, 16000);
					break;
				}
				case EVENT_SINISTER_STRIKE:
				{
					DoCastVictim(SPELL_SINISTER_STRIKE, true);
					events.RescheduleEvent(EVENT_SINISTER_STRIKE, urand(3500, 5000));
					break;
				}
				default:
					break;
				}
			}

			DoMeleeAttackIfReady();
		}
	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_th_twilight_strikerAI(creature);
	}
};

class areatrigger_th_si7 : public AreaTriggerScript
{
public:
	areatrigger_th_si7() : AreaTriggerScript("areatrigger_th_si7")
	{
	}

	enum npcId
	{
		NPC_ANDUIN_WRYNN = 44293
	};

	enum questId
	{
		QUEST_HES_HOLDING_OUT_ON_US = 27064
	};

	bool OnTrigger(Player* player, AreaTriggerEntry const* trigger)
	{
		if (player->isAlive() && player->GetQuestStatus(QUEST_HES_HOLDING_OUT_ON_US) == QUEST_STATUS_INCOMPLETE)
		{
			std::list<Creature*> creatures;
			GetCreatureListWithEntryInGrid(creatures, player, NPC_ANDUIN_WRYNN, 85.0f);
			if (creatures.empty())
				return false;

			for (std::list<Creature*>::iterator iter = creatures.begin(); iter != creatures.end(); ++iter)
			{
				if ((*iter)->ToTempSummon() && (*iter)->ToTempSummon()->GetSummoner() == player)
					(*iter)->AI()->DoAction(3);
			}
		}
		return false;
	}
};

class npc_th_the_black_bishop : public CreatureScript
{
public:
	npc_th_the_black_bishop() : CreatureScript("npc_th_the_black_bishop")
	{
	}

	struct npc_th_the_black_bishopAI : public ScriptedAI
	{
		npc_th_the_black_bishopAI(Creature* creature) : ScriptedAI(creature)
		{
		}

		EventMap events;

		enum eventId
		{
			EVENT_MIND_BLAST = 1,
			EVENT_PENANCE,
			EVENT_SHIELD,
			EVENT_DIAGONAL_SLIDE,
			EVENT_CHECK_HP
		};

		enum spellId
		{
			SPELL_AIR_SHIELD = 84018,
			SPELL_DIAGONAL_SLIDE = 83991,
			SPELL_INNER_FIRE = 48168,
			SPELL_MIND_BLAST = 13860,
			SPELL_PENANCE = 54518,
			SPELL_POWER_WORD_SHIELD = 11974,
			SPELL_SLIDE_EFFECT = 83995
		};

		enum goId
		{
			GO_BISHOP_SHIELD = 205199
		};

		void Reset()
		{
			me->SetControlled(false, UNIT_STATE_ROOT);
			if (me->isAlive())
			{
				if (GameObject* airWall = me->FindNearestGameObject(GO_BISHOP_SHIELD, 150.0f))
				{
					if (airWall->GetGoState() == GO_STATE_ACTIVE)
						airWall->SetGoState(GO_STATE_READY);
				}
			}
		}

		void SpellHit(Unit* /*caster*/, SpellInfo const* spell)
		{
			switch (spell->Id)
			{
			case SPELL_SLIDE_EFFECT:
			{
				me->SetControlled(false, UNIT_STATE_ROOT);
				if (teleportCount == 0 || teleportCount == 2 || teleportCount == 4)
					me->NearTeleportTo(-8494.87f, 836.64f, 72.70f, 0.07f);
				if (teleportCount == 1 || teleportCount == 3 || teleportCount == 5)
					me->NearTeleportTo(-8466.56f, 841.64f, 72.70f, 3.11f);
				teleportCount++;
				me->SetControlled(true, UNIT_STATE_ROOT);
				break;
			}
			default:
				break;
			}
		}

		void JustDied(Unit* /*killer*/)
		{
			Talk(2);
			if (GameObject* airWall = me->FindNearestGameObject(GO_BISHOP_SHIELD, 150.0f))
			{
				if (airWall->GetGoState() == GO_STATE_READY)
					airWall->SetGoState(GO_STATE_ACTIVE);
			}
		}

		void EnterCombat(Unit* /*who*/)
		{
			events.Reset();

			Talk(4);
			teleportCount = 0;
			DoCast(me, SPELL_AIR_SHIELD, true);
			if (me->HasAura(SPELL_INNER_FIRE))
				DoCast(me, SPELL_INNER_FIRE, true);

			events.ScheduleEvent(EVENT_SHIELD, 1);
			events.ScheduleEvent(EVENT_MIND_BLAST, 1000);
			events.ScheduleEvent(EVENT_PENANCE, 4000);
			events.ScheduleEvent(EVENT_DIAGONAL_SLIDE, 12500);
			events.ScheduleEvent(EVENT_CHECK_HP, 1000);
		}

		void UpdateAI(uint32 diff)
		{
			if (!UpdateVictim())
				return;

			events.Update(diff);

			while (uint32 eventId = events.ExecuteEvent())
			{
				switch (eventId)
				{
				case EVENT_SHIELD:
				{
					RESCHEDULE_IF_CASTING;
					DoCast(me, SPELL_POWER_WORD_SHIELD);
					events.RescheduleEvent(EVENT_SHIELD, 12000);
					break;
				}
				case EVENT_MIND_BLAST:
				{
					RESCHEDULE_IF_CASTING;
					DoCastVictim(SPELL_MIND_BLAST);
					events.RescheduleEvent(EVENT_MIND_BLAST, urand(5000, 7500));
					break;
				}
				case EVENT_PENANCE:
				{
					RESCHEDULE_IF_CASTING;
					if (roll_chance_f(20))
						Talk(1);
					DoCastVictim(SPELL_PENANCE);
					events.RescheduleEvent(EVENT_PENANCE, urand(5000, 7500));
					break;
				}
				case EVENT_DIAGONAL_SLIDE:
				{
					RESCHEDULE_IF_CASTING;
					if (teleportCount > 5)
					{
						events.CancelEvent(EVENT_DIAGONAL_SLIDE);
						break;
					}
					Talk(3);
					DoCast(me, SPELL_DIAGONAL_SLIDE);
					me->CastWithDelay(500, me, SPELL_SLIDE_EFFECT, true);
					events.RescheduleEvent(EVENT_DIAGONAL_SLIDE, 16500);
					break;
				}
				case EVENT_CHECK_HP:
				{
					if (me->GetHealth() < me->GetMaxHealth() * 0.35f)
					{
						Talk(5);
						teleportCount = 0;
						DoCast(me, SPELL_DIAGONAL_SLIDE);
						me->CastWithDelay(500, me, SPELL_SLIDE_EFFECT, true);
						events.CancelEvent(EVENT_CHECK_HP);
						break;
					}
					events.RescheduleEvent(EVENT_CHECK_HP, 1000);
					break;
				}
				default:
					break;
				}
			}

			DoMeleeAttackIfReady();
		}

	protected:
		uint8 teleportCount;
	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_th_the_black_bishopAI(creature);
	}
};

class npc_th_major_samuelson : public CreatureScript
{
public:
	npc_th_major_samuelson() : CreatureScript("npc_th_major_samuelson")
	{
	}

	enum questId
	{
		QUEST_A_VILLAIN_UNMASKED = 27106
	};

	enum creditId
	{
		QUEST_CREDIT_VILLAIN = 44979
	};

	enum npcId
	{
		NPC_BEAM_TRIGGER = 38821,
		NPC_STORMWIND_ROYAL_GUARD = 1756,
		NPC_GENN_GREYMANE = 45253,
		NPC_ANDUIN_WRYNN = 1747,
		NPC_KING_VARIAN_WRYNN = 29611
	};

#define GOSSIP_TEXT_EVENT "It's over, Samuelson. We know who you are and I put a stop to your little cathedral scheme."

	bool OnGossipSelect(Player* player, Creature* creature, uint32 sender, uint32 action)
	{
		if (action == 0)
		{
			if (player->GetQuestStatus(QUEST_A_VILLAIN_UNMASKED) == QUEST_STATUS_INCOMPLETE)
			{
				player->KilledMonsterCredit(QUEST_CREDIT_VILLAIN);
				player->CLOSE_GOSSIP_MENU();
				player->SetPhaseMask(16384, true);
				player->AddAura(60191, player);
				// Samuelson
				player->SummonCreature(creature->GetEntry(), creature->GetPositionX(), creature->GetPositionY(), creature->GetPositionZ(), creature->GetOrientation(), TEMPSUMMON_MANUAL_DESPAWN, 600000);
				// Guards
				player->SummonCreature(NPC_STORMWIND_ROYAL_GUARD, -8378.75f, 262.14f, 155.42f, 4.99f, TEMPSUMMON_MANUAL_DESPAWN, 600000);
				player->SummonCreature(NPC_STORMWIND_ROYAL_GUARD, -8366.23f, 260.37f, 155.42f, 4.18f, TEMPSUMMON_MANUAL_DESPAWN, 600000);
				player->SummonCreature(NPC_STORMWIND_ROYAL_GUARD, -8358.45f, 250.55f, 155.42f, 3.40f, TEMPSUMMON_MANUAL_DESPAWN, 600000);
				player->SummonCreature(NPC_STORMWIND_ROYAL_GUARD, -8356.73f, 239.53f, 155.83f, 2.61f, TEMPSUMMON_MANUAL_DESPAWN, 600000);
				player->SummonCreature(NPC_STORMWIND_ROYAL_GUARD, -8388.80f, 254.20f, 155.42f, 5.79f, TEMPSUMMON_MANUAL_DESPAWN, 600000);
				player->SummonCreature(NPC_STORMWIND_ROYAL_GUARD, -8390.05f, 241.51f, 155.42f, 0.29f, TEMPSUMMON_MANUAL_DESPAWN, 600000);
				player->SummonCreature(NPC_STORMWIND_ROYAL_GUARD, -8382.08f, 231.65f, 155.42f, 1.08f, TEMPSUMMON_MANUAL_DESPAWN, 600000);
				player->SummonCreature(NPC_STORMWIND_ROYAL_GUARD, -8371.58f, 227.68f, 155.87f, 1.85f, TEMPSUMMON_MANUAL_DESPAWN, 600000);
				// Genn Greymane
				player->SummonCreature(NPC_GENN_GREYMANE, -8364.92f, 230.89f, 157.07f, 2.26f, TEMPSUMMON_MANUAL_DESPAWN, 600000);
				// King Varian Wrynn
				player->SummonCreature(NPC_KING_VARIAN_WRYNN, -8363.05f, 232.23f, 157.07f, 2.23f, TEMPSUMMON_MANUAL_DESPAWN, 600000);
				// Anduin Wrynn
				player->SummonCreature(NPC_ANDUIN_WRYNN, -8361.36f, 233.56f, 157.07f, 2.26f, TEMPSUMMON_MANUAL_DESPAWN, 600000);
				// Beam Triggers
				player->SummonCreature(NPC_BEAM_TRIGGER, -8388.66f, 265.10f, 190.82f, 5.21f, TEMPSUMMON_MANUAL_DESPAWN, 600000);
				player->SummonCreature(NPC_BEAM_TRIGGER, -8367.75f, 267.59f, 177.38f, 4.55f, TEMPSUMMON_MANUAL_DESPAWN, 600000);
				player->SummonCreature(NPC_BEAM_TRIGGER, -8355.71f, 251.80f, 160.73f, 3.05f, TEMPSUMMON_MANUAL_DESPAWN, 600000);
				player->SummonCreature(NPC_BEAM_TRIGGER, -8352.49f, 240.13f, 177.28f, 3.00f, TEMPSUMMON_MANUAL_DESPAWN, 600000);
				player->SummonCreature(NPC_BEAM_TRIGGER, -8377.04f, 225.99f, 167.88f, 1.48f, TEMPSUMMON_MANUAL_DESPAWN, 600000);
				player->SummonCreature(NPC_BEAM_TRIGGER, -8390.28f, 228.73f, 177.48f, 0.87f, TEMPSUMMON_MANUAL_DESPAWN, 600000);
				player->SummonCreature(NPC_BEAM_TRIGGER, -8396.49f, 249.09f, 171.03f, 6.26f, TEMPSUMMON_MANUAL_DESPAWN, 600000);
			}
		}
		return true;
	}

	bool OnGossipHello(Player* player, Creature* creature)
	{
		if (player->GetQuestStatus(QUEST_A_VILLAIN_UNMASKED) == QUEST_STATUS_INCOMPLETE)
		{
			player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_TEXT_EVENT, 0, 0);
			player->SEND_GOSSIP_MENU(player->GetGossipTextId(creature), creature->GetGUID());
			return true;
		}
		return false;
	}

	struct npc_th_major_samuelsonAI : public ScriptedAI
	{
		npc_th_major_samuelsonAI(Creature* creature) : ScriptedAI(creature)
		{
		}

		EventMap events;

		enum eventId
		{
			EVENT_ENABLE_TRIGGERS = 1,
			EVENT_EMOTE_DAGGER,
			EVENT_ADJUST_FACING,
			EVENT_JUMP_ON_KING,
			EVENT_ANDUIN,
			EVENT_FAKE_ATTACK,
			EVENT_KING_ATTACK,
			EVENT_PREPARE_TRANSFORM,
			EVENT_CHAOS_SLAM,
			EVENT_SHADOW_CRASH
		};

		enum spellId
		{
			SPELL_CHAOS_SLAM = 84108,
			SPELL_SHADOW_CRASH = 75903,
			SPELL_TWILIGHT_IMPUNITY = 82548,
			SPELL_PURPLE_BEAM = 82545,
			SPELL_PW_SHIELD = 83842,
			SPELL_PW_SHIELD_2 = 11647,
			SPELL_UNMASKED = 89425,
			SPELL_TWILIGHT_EXPLOSION = 84207     // TODO: Check for correct explosion visual effect (like poison vomit etc...)
		};

		enum actionId
		{
			ACTION_INIT_EVENT = 1
		};

		enum pointId
		{
			POINT_KING = 1,
			POINT_TRANSFORM,
			POINT_UP,
			POINT_GROUND
		};

		enum npcId
		{
			NPC_ANDUIN = 1747,
			NPC_KING = 29611
		};

		void IsSummonedBy(Unit* owner)
		{
			me->RemoveFlag(UNIT_FIELD_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP | UNIT_NPC_FLAG_QUESTGIVER);
			owner->AddAura(60191, me);
			DoAction(ACTION_INIT_EVENT);
		}

		void DoAction(int32 action)
		{
			switch (action)
			{
			case ACTION_INIT_EVENT:
			{
				me->HandleEmoteCommand(EMOTE_STATE_HOLD_JOUST);
				TalkWithDelay(2000, 3);
				events.ScheduleEvent(EVENT_EMOTE_DAGGER, 6000);
				TalkWithDelay(9000, 2);
				break;
			}
			default:
				break;
			}
		};

		void CheckForBeams()
		{
			std::list<Creature*> creatures;
			GetCreatureListWithEntryInGrid(creatures, me, NPC_BEAM_TRIGGER, 200.0f);
			if (creatures.empty())
				return;

			for (std::list<Creature*>::iterator iter = creatures.begin(); iter != creatures.end(); ++iter)
			{
				if ((*iter)->GetPhaseMask() != me->GetPhaseMask())
					continue;

				(*iter)->CastSpell(me, SPELL_PURPLE_BEAM, true);
			}
		};

		void DamageTaken(Unit* attacker, uint32& damage)
		{
			if (attacker->GetTypeId() == TYPEID_UNIT)
				damage = urand(250, 700);
		}

		void SpellHit(Unit* /*caster*/, SpellInfo const* spell)
		{
			switch (spell->Id)
			{
			case SPELL_PURPLE_BEAM:
			{
				me->HandleEmoteCommand(EMOTE_ONESHOT_ROAR);
				me->GetMotionMaster()->MovementExpired(false);
				me->GetMotionMaster()->MoveJump(me->GetPositionX(), me->GetPositionY(), 163.87f, 1.0f, 3.0f, POINT_UP);
				me->CastWithDelay(3000, me, SPELL_TWILIGHT_IMPUNITY, true);
				break;
			}
			case SPELL_UNMASKED:
			{
				me->GetMotionMaster()->MovementExpired(false);
				me->GetMotionMaster()->MoveJump(me->GetPositionX(), me->GetPositionY(), 155.34f, 16.0f, 16.0f, POINT_GROUND);
				me->setFaction(14);
				me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_NOT_ATTACKABLE_1);
				me->RemoveAurasDueToSpell(SPELL_TWILIGHT_IMPUNITY);
				break;
			}
			default:
				break;
			}
		}

		void JustDied(Unit* /*killer*/)
		{
			Talk(1);
			events.Reset();
			if (me->ToTempSummon())
			{
				if (Unit* owner = me->ToTempSummon()->GetSummoner())
				{
					if (owner->GetTypeId() == TYPEID_PLAYER)
						owner->ToPlayer()->KilledMonsterCredit(me->GetEntry());
				}
			}
		}

		void EnterCombat(Unit* /*who*/)
		{
			events.ScheduleEvent(EVENT_CHAOS_SLAM, 4000);
			events.ScheduleEvent(EVENT_SHADOW_CRASH, urand(2000, 6000));
		}

		void MovementInform(uint32 type, uint32 pointId)
		{
			switch (pointId)
			{
			case POINT_TRANSFORM:
			{
				me->SetFacingTo(5.40f);
				CheckForBeams();
				TalkWithDelay(1000, 0);
				break;
			}
			case POINT_UP:
			{
				me->SetCanFly(true);
				me->SetDisableGravity(true);
				me->CastWithDelay(9000, me, SPELL_UNMASKED);
				me->CastWithDelay(8800, me, SPELL_TWILIGHT_EXPLOSION, true);    // TODO: This is not correct, we need the spell from retail
				break;
			}
			case POINT_GROUND:
			{
				me->SetCanFly(false);
				me->SetDisableGravity(false);
				me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_NPC | UNIT_FLAG_IMMUNE_TO_PC);
				if (me->ToTempSummon())
				{
					if (Unit* owner = me->ToTempSummon()->GetCharmerOrOwner())
						AttackStart(owner);
				}
				break;
			}
			default:
				break;
			}
		}

		void UpdateAI(uint32 diff)
		{
			events.Update(diff);

			while (uint32 eventId = events.ExecuteEvent())
			{
				switch (eventId)
				{
				case EVENT_EMOTE_DAGGER:
				{
					me->MonsterTextEmote("Major Samuelson suddenly draws out a hidden dagger!", 0, 0);
					events.ScheduleEvent(EVENT_ANDUIN, 4500);
					events.ScheduleEvent(EVENT_ADJUST_FACING, 4500);
					events.ScheduleEvent(EVENT_JUMP_ON_KING, 5000);
					events.CancelEvent(EVENT_EMOTE_DAGGER);
					// TODO: Equip the special hidden dagger
					break;
				}
				case EVENT_ADJUST_FACING:
				{
					me->SetFacingTo(5.40f);
					events.CancelEvent(EVENT_ADJUST_FACING);
					break;
				}
				case EVENT_JUMP_ON_KING:
				{
					me->HandleEmoteCommand(EMOTE_ONESHOT_READY1H);
					me->GetMotionMaster()->MoveJump(-8363.45f, 234.51f, 156.99f, 13.0f, 13.0f, POINT_KING);
					events.CancelEvent(EVENT_JUMP_ON_KING);
					break;
				}
				case EVENT_ANDUIN:
				{
					if (Creature* anduin = me->FindNearestCreature(NPC_ANDUIN, 100.0f))
					{
						anduin->MonsterSay("Father, watch out!", 0, 0);
						anduin->MonsterTextEmote("Anduin Wrynn protects his father with Power Word: Shield", 0, 0);
						if (Creature* king = anduin->FindNearestCreature(NPC_KING, 100.0f))
						{
							anduin->CastSpell(anduin, SPELL_PW_SHIELD, true);
							king->AddAura(SPELL_PW_SHIELD_2, king);
						}
					}
					events.ScheduleEvent(EVENT_FAKE_ATTACK, 2500);
					events.CancelEvent(EVENT_ANDUIN);
					break;
				}
				case EVENT_FAKE_ATTACK:
				{
					me->HandleEmoteCommand(EMOTE_ONESHOT_ATTACK1H);
					events.ScheduleEvent(EVENT_KING_ATTACK, 1000);
					events.ScheduleEvent(EVENT_PREPARE_TRANSFORM, 1200);
					events.CancelEvent(EVENT_FAKE_ATTACK);
					break;
				}
				case EVENT_KING_ATTACK:
				{
					if (Creature* king = me->FindNearestCreature(NPC_KING, 100.0f))
						king->HandleEmoteCommand(EMOTE_ONESHOT_ATTACK1H);
					events.CancelEvent(EVENT_KING_ATTACK);
					break;
				}
				case EVENT_PREPARE_TRANSFORM:
				{
					me->GetMotionMaster()->MovementExpired(false);
					me->GetMotionMaster()->MoveJump(-8372.96f, 245.52f, 155.34f, 13.0f, 13.0f, POINT_TRANSFORM);
					events.CancelEvent(EVENT_PREPARE_TRANSFORM);
					break;
				}
				case EVENT_SHADOW_CRASH:
				{
					if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 100, false))
						DoCast(target, SPELL_SHADOW_CRASH);
					events.RescheduleEvent(EVENT_SHADOW_CRASH, 3000, 7000);
					break;
				}
				case EVENT_CHAOS_SLAM:
				{
					DoCast(SPELL_CHAOS_SLAM);
					events.RescheduleEvent(EVENT_CHAOS_SLAM, 15000, 25000);
					break;
				}
				default:
					break;
				}
			}

			DoMeleeAttackIfReady();
		}
	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_th_major_samuelsonAI(creature);
	}
};

class npc_th_seaplane_trigger : public CreatureScript
{
public:
	npc_th_seaplane_trigger() : CreatureScript("npc_th_seaplane_trigger")
	{
	}

	enum questId
	{
		QUEST_TWILIGHT_SHORES = 28832
	};

	enum spellId
	{
		SPELL_SUMMON_SEAPLANE = 93320
	};

	bool OnGossipHello(Player* player, Creature* creature)
	{
		if (player->GetQuestStatus(QUEST_TWILIGHT_SHORES) == QUEST_STATUS_COMPLETE)
		{
			player->CastSpell(player, SPELL_SUMMON_SEAPLANE, true);
			return true;
		}
		return true;
	}
};

class npc_th_flintlocke_seaplane : public CreatureScript
{
public:
	npc_th_flintlocke_seaplane() : CreatureScript("npc_th_flintlocke_seaplane")
	{
	}

	enum actionId
	{
		ACTION_WP_START = 1
	};

	enum eventId
	{
		EVENT_TALK_FARGO = 1,
		EVENT_DISMOUNT_AND_TELEPORT,
		EVENT_SEARCH_FOR_OWNER,
		EVENT_FOCUS_PLANE,
		EVENT_FOCUS_FARGO,
		EVENT_DO_FINISH
	};

	enum spellId
	{
		SPELL_AFTER_MARKET_BURNERS = 93346,
		SPELL_EXPLOSION_1 = 88309,
		SPELL_EXPLOSION_2 = 88310,
		SPELL_FADE_TO_BLACK = 94198,
		SPELL_TP_TWILIGHT_HIGHLANDS = 93390,
		SPELL_CAMERA_CHANNELING = 88552,
		SPELL_UNIQUE_PHASING = 60191,
		SPELL_QUEST_INVISIBILITY_DETECTION_1 = 49416
	};

	enum npcId
	{
		NPC_FARGO_FLINTLOCKE = 44806,
		NPC_CRASHED_SEAPLANE = 50300,
		NPC_FARGO_CRASHED = 49252
	};

	struct npc_th_flintlocke_seaplaneAI : public npc_escortAI
	{
		npc_th_flintlocke_seaplaneAI(Creature* creature) : npc_escortAI(creature)
		{
		}

		EventMap events;

		void OnCharmed(bool apply)
		{
		}

		void IsSummonedBy(Unit* owner)
		{
			// Twilight Highlands
			if (me->GetZoneId() == 4922)
			{
				owner->AddAura(SPELL_UNIQUE_PHASING, me);
				owner->AddAura(SPELL_UNIQUE_PHASING, owner);
				me->SetDisplayId(17188);
				me->SetPhaseMask(2, true);
				events.ScheduleEvent(EVENT_SEARCH_FOR_OWNER, 200);
			}
			else
			{
				wpInProgress = false;
				me->SetWalk(false);
			}
		}

		void EnterEvadeMode()
		{
		}

		void PassengerBoarded(Unit* passenger, int8 seatId, bool apply)
		{
			if (apply && passenger->GetTypeId() == TYPEID_PLAYER && seatId == 0)
			{
				if (wpInProgress == false)
				{
					DoAction(ACTION_WP_START);
					wpInProgress = true;
				}
			}
		}

		void WaypointReached(uint32 point)
		{
			switch (point)
			{
			case 4: // Fall
			{
				if (Unit* passenger = me->GetVehicleKit()->GetPassenger(1))
					passenger->ToCreature()->AI()->TalkWithDelay(2000, 1);
				DoCast(me, SPELL_EXPLOSION_1, true);
				DoCast(me, SPELL_EXPLOSION_2, true);
				break;
			}
			case 7: // Preparation for Boost
			{
				if (Unit* passenger = me->GetVehicleKit()->GetPassenger(1))
				{
					passenger->ToCreature()->AI()->Talk(3);
					passenger->ToCreature()->AI()->TalkWithDelay(10000, 4);
				}
				break;
			}
			case 9: // Boost
			{
				me->CastWithDelay(500, me, SPELL_AFTER_MARKET_BURNERS);
				if (Unit* passenger = me->GetVehicleKit()->GetPassenger(0))
				{
					passenger->ChangeSeat(2, false);
					passenger->CastWithDelay(8000, passenger, SPELL_FADE_TO_BLACK, true);
				}
				me->SetSpeed(MOVE_FLIGHT, 4.0f, true);
				me->SetSpeed(MOVE_RUN, 4.0f, true);
				events.ScheduleEvent(EVENT_DISMOUNT_AND_TELEPORT, 13000);
				break;
			}
			default:
				break;
			}
		}

		void DoAction(int32 action)
		{
			switch (action)
			{
			case ACTION_WP_START:
			{
				Start(false, true, NULL, NULL, false, true);
				me->SetSpeed(MOVE_FLIGHT, 3.0f, true);
				me->SetSpeed(MOVE_RUN, 3.0f, true);
				events.ScheduleEvent(EVENT_TALK_FARGO, 3000);
				SetDespawnAtEnd(true);
				break;
			}
			default:
				break;
			}
		}

		void UpdateAI(uint32 diff)
		{
			npc_escortAI::UpdateAI(diff);
			events.Update(diff);

			while (uint32 eventId = events.ExecuteEvent())
			{
				switch (eventId)
				{
				case EVENT_TALK_FARGO:
				{
					if (Unit* passenger = me->GetVehicleKit()->GetPassenger(1))
						passenger->ToCreature()->AI()->Talk(0);
					events.CancelEvent(EVENT_TALK_FARGO);
					break;
				}
				case EVENT_DISMOUNT_AND_TELEPORT:
				{
					if (Unit* passenger = me->GetVehicleKit()->GetPassenger(2))
					{
						passenger->CastWithDelay(200, passenger, SPELL_TP_TWILIGHT_HIGHLANDS, true);
						passenger->SummonCreature(me->GetEntry(), -4947.77f, -6707.56f, 14.73f, 5.34f, TEMPSUMMON_MANUAL_DESPAWN, 300000);
						me->GetVehicleKit()->RemoveAllPassengers();
					}
					events.CancelEvent(EVENT_DISMOUNT_AND_TELEPORT);
					break;
				}
				case EVENT_SEARCH_FOR_OWNER:
				{
					// Remove Fargo
					if (Unit* passenger = me->GetVehicleKit()->GetPassenger(1))
						passenger->ExitVehicle();

					if (me->ToTempSummon())
					{
						if (Unit* owner = me->ToTempSummon()->GetSummoner())
						{
							if (me->GetDistance(owner) < 15)
							{
								owner->AddAura(SPELL_QUEST_INVISIBILITY_DETECTION_1, owner);
								me->AddAura(SPELL_QUEST_INVISIBILITY_DETECTION_1, me);
								owner->EnterVehicle(me, 3);
								events.ScheduleEvent(EVENT_FOCUS_PLANE, 2000);
								events.CancelEvent(EVENT_SEARCH_FOR_OWNER);
								break;
							}
						}
					}

					events.RescheduleEvent(EVENT_SEARCH_FOR_OWNER, 200);
					break;
				}
				case EVENT_FOCUS_PLANE:
				{
					events.ScheduleEvent(EVENT_FOCUS_FARGO, 5000);
					events.CancelEvent(EVENT_FOCUS_PLANE);
					break;
				}
				case EVENT_FOCUS_FARGO:
				{
					if (Creature* fargo = me->FindNearestCreature(NPC_FARGO_CRASHED, 300.0f, true))
					{
						me->CastStop();
						me->CastSpell(fargo, SPELL_CAMERA_CHANNELING, true);
						fargo->AI()->TalkWithDelay(2000, 0);
					}
					events.ScheduleEvent(EVENT_DO_FINISH, 8000);
					events.CancelEvent(EVENT_FOCUS_FARGO);
					break;
				}
				case EVENT_DO_FINISH:
				{
					if (me->ToTempSummon())
					{
						if (Unit* owner = me->ToTempSummon()->GetSummoner())
							owner->RemoveAurasDueToSpell(SPELL_UNIQUE_PHASING);
					}
					me->GetVehicleKit()->RemoveAllPassengers();
					events.CancelEvent(EVENT_DO_FINISH);
					break;
				}
				default:
					break;
				}
			}
		}

	protected:
		bool wpInProgress;
	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_th_flintlocke_seaplaneAI(creature);
	}
};


class go_th_a_portal_to_twilight_highlands : public GameObjectScript
{
public:
	go_th_a_portal_to_twilight_highlands() : GameObjectScript("go_th_a_portal_to_twilight_highlands")
	{
	}

	enum questId
	{
		QUEST_THE_WAY_IS_OPEN = 27545
	};

	bool OnGossipHello(Player* player, GameObject* go)
	{
		if (player->GetQuestStatus(QUEST_THE_WAY_IS_OPEN) == QUEST_STATUS_REWARDED)
			return false;
		return true;
	}
};

void AddSC_stormwind_city()
{
	/// Npcs
	new npc_th_anduinn_wrynn();
	new npc_th_twilight_striker();
	new npc_th_the_black_bishop();
	new npc_th_major_samuelson();
	new npc_th_seaplane_trigger();
	new npc_th_flintlocke_seaplane();

	/// Areatriggers
	new areatrigger_th_si7();
	new areatrigger_th_stormwind_graves();
	new areatrigger_th_wollerton_stead();
	new areatrigger_th_crime_scene();

	/// Objects
	new go_th_a_portal_to_twilight_highlands();
}
