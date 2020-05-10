////////////////////////////////////////////////////////////////////////////////
//
// Project-Hellscream https://hellscream.org
// Copyright (C) 2018-2020 Project-Hellscream-6.2
// Discord https://discord.gg/CWCF3C9
//
////////////////////////////////////////////////////////////////////////////////

#include "ScriptMgr.h"
#include "CombatAI.h"
#include "MotionMaster.h"
#include "MoveSplineInit.h"
#include "ObjectAccessor.h"
#include "Player.h"
#include "ScriptedCreature.h"
#include "SpellInfo.h"
#include "SpellScript.h"
#include "TemporarySummon.h"

enum zone_coldridge_valley
{
	/// Npcs
	NPC_ROCKSAW_INVADER = 37070,
	NPC_WOUNDED_COLDRIDGE_MOUNTAINEER_KILL_CREDIT = 37079,
	NPC_WOUNDED_COLDRIDGE_MOUNTAINEER = 37080,
	NPC_COLDRIDGE_DEFENDER = 37177,
	NPC_ROCKJAW_SCAVENGER = 37105,
	NPC_SOOTHSAYER_SHIKALA = 37108,
	NPC_SOOTHSAYER_RIKKARI = 37173,
	NPC_SOOTHSAYER_MIRIMKOA = 37174,
	NPC_TROLLING_FOR_INFORMATION_KILL_CREDIT_BUNNY_SE = 37109,
	NPC_TROLLING_FOR_INFORMATION_KILL_CREDIT_BUNNY_SW = 37110,
	NPC_TROLLING_FOR_INFORMATION_KILL_CREDIT_BUNNY_W = 37111,
	NPC_JOREN_IRONSTOCK = 37081,
	NPC_ROCKJAW_INVADER = 37070,

	/// Spells
	SPELL_HEAL_WOUNDED_MOUNTAINEER = 69855,
	SPELL_THROW_PRICELESS_ARTIFACT = 69897,
	SPELL_LOW_HEALTH			   = 76143,

	/// Quests and Items
	QUEST_AID_FOR_THE_WOUNDED = 24471,
	QUEST_TROLLING_FOR_INFORMATION = 24489,
	QUEST_MAKE_HAY_WHILE_THE_SUN_SHINES = 24486,
	ITEM_PRICELESS_ROCKJAW_ARTIFACT = 49751,

};


enum WoundedColdridgeMountaineer
{
	
	SAY_THANK_PLAYER = 0,
	EVENT_TURN_TO_PLAYER = 1,
	EVENT_THANK_PLAYER = 2,
	EVENT_MOVE_TO_SAFETY = 3
};


/// Joren Ironstock - 37081
class npc_joren_ironstock : public CreatureScript
{
public:
	npc_joren_ironstock() : CreatureScript("npc_joren_ironstock") { }

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_joren_ironstockAI(creature);
	}

	struct npc_joren_ironstockAI : public ScriptedAI
	{
		npc_joren_ironstockAI(Creature* creature) : ScriptedAI(creature) {}

		uint32 invaders;
		uint64 rockjawTarget;


		bool Continue;

		void Reset() override
		{
			invaders = 0;
			rockjawTarget = 0;
			me->SetSheath(SHEATH_STATE_MELEE);
			me->setRegeneratingHealth(true);
		}

		void EnterCombat(Unit * who) override
		{
			Talk(urand(0, 2)); // Random aggro text
			if (!me->HasUnitState(UNIT_STATE_ROOT))
				me->AddUnitState(UNIT_STATE_ROOT);
		}

		void DamageTaken(Unit* doneBy, uint32& damage)
		{
			if (doneBy->ToCreature())
					damage = 0;
		}

		void UpdateAI(uint32 diff) override
		{
			DoMeleeAttackIfReady();

			if (rockjawTarget != 0)
			{
				if (Creature* invader = Unit::GetCreature(*me, rockjawTarget))
				{
					if (invader->isAlive())
					{
						if (me->getVictim() != invader)
						{
							me->getThreatManager().addThreat(invader, 1000000.0f);
							invader->getThreatManager().addThreat(me, 1000000.0f);
							me->Attack(invader, true);
						}
					}
					else
					{
						me->AttackStop();
						invader->DespawnOrUnsummon();
						rockjawTarget = 0;
						invaders = 0;

					}
				}
			}
			else
			{
				for (uint8 i = 0; i < 5; ++i) // Summon invaders 5 times
				{
					Position source;
					Position destination;
					// Get Joren's source destination and get the position in front of Joren by 50 yards. Bind it to destination.
					me->GetPosition(&source);
					GetPositionWithDistInFront(me, 75.0f, destination);
					// Summon each time at a random close position
					float z = me->GetMap()->GetHeight(me->GetPhaseMask(), destination.GetPositionX() + urand(2, 5), destination.GetPositionY() + urand(2, 5), destination.GetPositionZ());
					destination.m_positionZ = z;

					if (Creature* invader = me->SummonCreature(NPC_ROCKJAW_INVADER, destination))
					{
						invader->GetMotionMaster()->MoveChase(me, 55.0f);
						AttackStart(invader);
						invader->SetFacingToObject(me);
						rockjawTarget = invader->GetGUID();
					}
				}
			}

		}
	};
};

/// Coldridge Defender - 37177
class npc_coldridge_defender : public CreatureScript
{
public:
	npc_coldridge_defender() : CreatureScript("npc_coldridge_defender") { }

	struct npc_coldridge_defenderAI : public ScriptedAI
	{
		npc_coldridge_defenderAI(Creature* creature) : ScriptedAI(creature)
		{
			me->HandleEmoteCommand(EMOTE_STATE_READY1H);
		}

		EventMap events;

		void EnterCombat(Unit * who)
		{
			me->AddUnitState(UNIT_STATE_ROOT);
			me->HandleEmoteCommand(EMOTE_STATE_READY1H);
		}

		void Reset()
		{
			me->HandleEmoteCommand(EMOTE_STATE_READY1H);
		}

		void DamageTaken(Unit* attacker, uint32& damage)
		{
			if (attacker->GetEntry() == NPC_ROCKJAW_INVADER && ((me->GetHealth() - damage) <= me->GetHealth() / 2))
				return;
		}

		void UpdateAI(const uint32 diff)
		{
			DoMeleeAttackIfReady();
		}
	};
	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_coldridge_defenderAI(creature);
	}
};

/// Rockjaw Invader - 37070
class npc_rockjaw_invader : public CreatureScript
{
public:
	npc_rockjaw_invader() : CreatureScript("npc_rockjaw_invader") { }

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_rockjaw_invaderAI(creature);
	}

	struct npc_rockjaw_invaderAI : public ScriptedAI
	{
		npc_rockjaw_invaderAI(Creature* creature) : ScriptedAI(creature) { }

		void DamageTaken(Unit* who, uint32& damage)
		{
			if (who->GetEntry() == NPC_COLDRIDGE_DEFENDER && ((me->GetHealth() - damage) <= me->GetHealth() / 2))
				return;

			if (who->GetTypeId() == TYPEID_PLAYER || who->isPet())
			{
				if (Creature* guard = me->FindNearestCreature(NPC_COLDRIDGE_DEFENDER, 6.0f, true))
				{
					guard->getThreatManager().resetAllAggro();
					guard->CombatStop(true);
				}

				me->getThreatManager().resetAllAggro();
				me->GetMotionMaster()->MoveChase(who);
				me->AI()->AttackStart(who);
			}
		}

		void UpdateAI(const uint32 diff)
		{
			if (!UpdateVictim())
				if (Creature* guard = me->FindNearestCreature(NPC_COLDRIDGE_DEFENDER, 6.0f, true))
					me->AI()->AttackStart(guard);

			DoMeleeAttackIfReady();
		}
	};
};


/// Wounded Coldridge Mountaineer - 37080
class npc_wounded_coldridge_mountaineer : public CreatureScript
{
public:
	npc_wounded_coldridge_mountaineer() : CreatureScript("npc_wounded_coldridge_mountaineer") { }

	struct npc_wounded_coldridge_mountaineerAI : public ScriptedAI
	{
		npc_wounded_coldridge_mountaineerAI(Creature* creature) : ScriptedAI(creature), _tapped(false) { }

		void Reset() override
		{
			_events.Reset();
			me->CastSpell(me, SPELL_LOW_HEALTH);
			me->SetByteFlag(UNIT_FIELD_ANIM_TIER, 0, UNIT_STAND_STATE_KNEEL);
			_tapped = false;
		}

		void SpellHit(Unit* caster, SpellInfo const* spell) override
		{
			if (_tapped)
				return;

			if (spell->Id == SPELL_HEAL_WOUNDED_MOUNTAINEER)
			{
				if (caster->GetTypeId() == TYPEID_PLAYER)
				{
					_tapped = true;
					_playerGUID = caster->GetGUID();
					me->RemoveByteFlag(UNIT_FIELD_ANIM_TIER, 0, UNIT_STAND_STATE_KNEEL);
					me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_NPC);
					me->SetStandState(UNIT_STAND_STATE_STAND);
					_events.ScheduleEvent(EVENT_TURN_TO_PLAYER, 2000);
				}
			}
		}

		void UpdateAI(uint32 diff) override
		{
			if (!_tapped)
				return;

			_events.Update(diff);

			while (uint32 eventId = _events.ExecuteEvent())
			{
				switch (eventId)
				{
				case EVENT_TURN_TO_PLAYER:
					me->SetFacingToObject(ObjectAccessor::GetUnit(*me, _playerGUID));
					_events.ScheduleEvent(EVENT_THANK_PLAYER, 1000);
					break;
				case EVENT_THANK_PLAYER:
					Talk(SAY_THANK_PLAYER, _playerGUID);
					_events.ScheduleEvent(EVENT_MOVE_TO_SAFETY, 5000);
					break;
				case EVENT_MOVE_TO_SAFETY:
					if (Creature* joren = me->FindNearestCreature(NPC_JOREN_IRONSTOCK, 75.0f, true))
					{
						Position l_Pos;
						joren->GetPosition(&l_Pos);
						me->GetMotionMaster()->MovePoint(0, l_Pos, true);
					}

					me->DespawnOrUnsummon(5000);
					break;
				default:
					break;
				}
			}
		}
	private:
		EventMap _events;
		ObjectGuid _playerGUID;
		bool _tapped;
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_wounded_coldridge_mountaineerAI(creature);
	}
};

/// Rockjaw Scavenger - 37105
class npc_rockjaw_scavenger : public CreatureScript
{
public:
	npc_rockjaw_scavenger() : CreatureScript("npc_rockjaw_scavenger") { }

	struct npc_rockjaw_scavengerAI : public ScriptedAI
	{
		npc_rockjaw_scavengerAI(Creature *creature) : ScriptedAI(creature)
		{
			_hasCasted = false;
		}

		bool _hasCasted;

		void DamageTaken(Unit* Hitter, uint32& Damage)
		{
			if (Player* player = Hitter->ToPlayer())
				if (player->GetQuestStatus(QUEST_MAKE_HAY_WHILE_THE_SUN_SHINES) == QUEST_STATUS_INCOMPLETE)
					if (!_hasCasted)
						if (me->GetDistance(player) >= 5.0f && me->GetDistance(player) <= 15.0f)
							switch (urand(0, 3)) // 33% chance
							{
							case 2:
								me->CastSpell(player, SPELL_THROW_PRICELESS_ARTIFACT, true);
								player->AddItem(ITEM_PRICELESS_ROCKJAW_ARTIFACT, 1);
								_hasCasted = true;
							}

		}

		void UpdateAI(uint32 diff)
		{
			if (!UpdateVictim())
				return;

			DoMeleeAttackIfReady();
		}
	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_rockjaw_scavengerAI(creature);
	}
};


/// Soothsayer Shikala - 37108
class npc_soothsayer_shikala : public CreatureScript
{
public:
	npc_soothsayer_shikala() : CreatureScript("npc_soothsayer_shikala") { }

	struct npc_soothsayer_shikalaAI : public ScriptedAI
	{
		npc_soothsayer_shikalaAI(Creature *c) : ScriptedAI(c) { }

		uint32 timer;
		uint32 phase;
		bool TalkSequenceIsStarted;
		Player* player;

		void Reset()
		{
			timer = 0;
			TalkSequenceIsStarted = false;
			phase = 0;
		}

		void MoveInLineOfSight(Unit* who)
		{
			if (!who || !who->isAlive() || TalkSequenceIsStarted)
				return;

			if (who->GetTypeId() == TYPEID_PLAYER && me->IsWithinDistInMap(who, 10.0f))
			{
				player = who->ToPlayer();
				if (player)
				{
					if (player->GetQuestStatus(QUEST_TROLLING_FOR_INFORMATION) == QUEST_STATUS_INCOMPLETE)
					{
						TalkSequenceIsStarted = true;
						timer = 2000;
						phase++;
					}
				}
			}
		}

		void UpdateAI(uint32 diff)
		{
			if (!UpdateVictim())
			{
				if (TalkSequenceIsStarted)
				{
					if (!player)
					{
						timer = 0;
						phase = 0;
						TalkSequenceIsStarted = false;
						return;
					}
					if (timer <= diff)
					{
						switch (phase)
						{
						case 1:
						{
							Talk(0);
							timer = 5000;
							phase++;
							break;
						}
						case 2:
						{
							Talk(1);
							timer = 5000;
							phase++;
							break;
						}
						case 3:
						{
							Talk(2);
							timer = 5000;
							phase++;
							break;
						}
						case 4:
						{
							player->KilledMonsterCredit(NPC_TROLLING_FOR_INFORMATION_KILL_CREDIT_BUNNY_SE, 0);
							timer = 120000;
							phase++; // cooldown
							break;
						}
						case 5:
						{
							timer = 0;
							phase = 0;
							TalkSequenceIsStarted = false;
							break;
						}
						}
					}
					else
						timer -= diff;

					if (!me->IsInRange(player, 0.0f, 15.0f))
					{
						timer = 0;
						phase = 0;
						TalkSequenceIsStarted = false; // if player gone away, delete cooldown
					}
				}

			}
			else
				DoMeleeAttackIfReady();

		}
	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_soothsayer_shikalaAI(creature);
	}
};

/// Soothsayer Rikkari - 37173
class npc_soothsayer_rikkari : public CreatureScript
{
public:
	npc_soothsayer_rikkari() : CreatureScript("npc_soothsayer_rikkari") { }

	struct npc_soothsayer_rikkariAI : public ScriptedAI
	{
		npc_soothsayer_rikkariAI(Creature *c) : ScriptedAI(c) { }

		uint32 timer;
		uint32 phase;
		bool TalkSequenceIsStarted;
		Player* player;

		void Reset()
		{
			timer = 0;
			TalkSequenceIsStarted = false;
			phase = 0;
		}

		void MoveInLineOfSight(Unit* who)
		{
			if (!who || !who->isAlive() || TalkSequenceIsStarted)
				return;

			if (who->GetTypeId() == TYPEID_PLAYER && me->IsWithinDistInMap(who, 10.0f))
			{
				player = who->ToPlayer();
				if (player)
				{
					if (player->GetQuestStatus(QUEST_TROLLING_FOR_INFORMATION) == QUEST_STATUS_INCOMPLETE)
					{
						TalkSequenceIsStarted = true;
						timer = 2000;
						phase++;
					}
				}
			}
		}

		void UpdateAI(uint32 diff)
		{
			if (!UpdateVictim())
			{
				if (TalkSequenceIsStarted)
				{
					if (!player)
					{
						timer = 0;
						phase = 0;
						TalkSequenceIsStarted = false;
						return;
					}
					if (timer <= diff)
					{
						switch (phase)
						{
						case 1:
						{
							Talk(0);
							timer = 5000;
							phase++;
							break;
						}
						case 2:
						{
							Talk(1);
							timer = 5000;
							phase++;
							break;
						}
						case 3:
						{
							Talk(2);
							timer = 5000;
							phase++;
							break;
						}
						case 4:
						{
							player->KilledMonsterCredit(NPC_TROLLING_FOR_INFORMATION_KILL_CREDIT_BUNNY_SW, 0);
							timer = 120000; phase++; // cooldown                                                                                                          
							break;
						}
						case 5:
						{
							timer = 0;
							phase = 0;
							TalkSequenceIsStarted = false;
							break;
						}
						}
					}
					else
						timer -= diff;

					if (!me->IsInRange(player, 0.0f, 15.0f))
					{
						timer = 0;
						phase = 0;
						TalkSequenceIsStarted = false; // if player gone away, delete cooldown
					}
				}

			}
			else
				DoMeleeAttackIfReady();

		}
	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_soothsayer_rikkariAI(creature);
	}
};

/// Soothsayer Mirimkoa - 37174
class npc_soothsayer_mirimkoa : public CreatureScript
{
public:
	npc_soothsayer_mirimkoa() : CreatureScript("npc_soothsayer_mirimkoa") { }

	struct npc_soothsayer_mirimkoaAI : public ScriptedAI
	{
		npc_soothsayer_mirimkoaAI(Creature *c) : ScriptedAI(c) { }

		uint32 timer;
		uint32 phase;
		bool TalkSequenceIsStarted;
		Player* player;

		void Reset()
		{
			timer = 0;
			TalkSequenceIsStarted = false;
			phase = 0;
		}

		void MoveInLineOfSight(Unit* who)
		{
			if (!who || !who->isAlive() || TalkSequenceIsStarted)
				return;

			if (who->GetTypeId() == TYPEID_PLAYER && me->IsWithinDistInMap(who, 10.0f))
			{
				player = who->ToPlayer();
				if (player)
				{
					if (player->GetQuestStatus(QUEST_TROLLING_FOR_INFORMATION) == QUEST_STATUS_INCOMPLETE)
					{
						TalkSequenceIsStarted = true;
						timer = 2000;
						phase++;
					}
				}
			}
		}

		void UpdateAI(uint32 diff)
		{
			if (!UpdateVictim())
			{
				if (TalkSequenceIsStarted)
				{
					if (!player)
					{
						timer = 0;
						phase = 0;
						TalkSequenceIsStarted = false;
						return;
					}
					if (timer <= diff)
					{
						switch (phase)
						{
						case 1:
						{
							Talk(0);
							timer = 5000;
							phase++;
							break;
						}
						case 2:
						{
							Talk(1);
							timer = 5000;
							phase++;
							break;
						}
						case 3:
						{
							Talk(2);
							timer = 5000;
							phase++;
							break;
						}
						case 4:
						{
							player->KilledMonsterCredit(NPC_TROLLING_FOR_INFORMATION_KILL_CREDIT_BUNNY_W, 0);
							timer = 120000; phase++; // cooldown                                                                                      
							break;
						}
						case 5:
						{
							timer = 0;
							phase = 0;
							TalkSequenceIsStarted = false;
							break;
						}
						}
					}
					else
						timer -= diff;

					if (!me->IsInRange(player, 0.0f, 15.0f))
					{
						timer = 0;
						phase = 0;
						TalkSequenceIsStarted = false; // if player gone away, delete cooldown
					}
				}

			}
			else
				DoMeleeAttackIfReady();

		}
	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_soothsayer_mirimkoaAI(creature);
	}
};


/// Quest: Follow that Gyro-Copter! - 24491
enum eQuest24491
{
	QUEST_A_TRIP_TO_IRONFORGE = 24490,
	QUEST_FOLLOW_THAT_GYRO_COPTER = 24491,

	NPC_HANDS_SPRINGSPROCKET = 6782,

	SPELL_SEE_COLDRIGE_TUNNEL_ROCKS_SEE_QUEST_INVIS_1 = 70042,
	SPELL_SEE_MILO_GEARTWINGE_SEE_QUEST_INVIS_2 = 70044,
	SPELL_MILO_GEARTWINGE_INVISIBILITY_QUEST_INVIS_2 = 70045,
	SPELL_A_TRIP_TO_IRONFORGE_QUEST_COMPLETE = 70046,
};

/// Hands Springsprocket - 6782
class npc_hands_springsprocket : public CreatureScript
{
public:
	npc_hands_springsprocket() : CreatureScript("npc_hands_springsprocket") { }

	bool OnQuestReward(Player* player, Creature* creature, Quest const* quest, uint32 /*opt*/)
	{
		if (quest->GetQuestId() == QUEST_A_TRIP_TO_IRONFORGE)
			creature->AI()->Talk(0, player->GetGUID());
			player->CastSpell(player, SPELL_A_TRIP_TO_IRONFORGE_QUEST_COMPLETE, true);

		return true;
	}

	bool OnQuestAccept(Player* player, Creature* creature, Quest const* quest)
	{
		if (quest->GetQuestId() == QUEST_FOLLOW_THAT_GYRO_COPTER)
			if (!player->HasAura(SPELL_SEE_MILO_GEARTWINGE_SEE_QUEST_INVIS_2))
			{
				player->CastSpell(player, SPELL_SEE_MILO_GEARTWINGE_SEE_QUEST_INVIS_2, true);
			}

		return true;
	}
};


/// Wounded Militia - 44405
enum WoundedMilita
{
	QUEST_KILL_CREDIT = 44175,
	SPELL_FLASH_HEAL = 2061,
	EVENT_RESET_HEALTH = 4
};

class npc_wounded_milita : public CreatureScript
{
public:
	npc_wounded_milita() : CreatureScript("npc_wounded_milita") { }

	struct npc_wounded_militaAI : public ScriptedAI
	{
		npc_wounded_militaAI(Creature* creature) : ScriptedAI(creature)
		{
			Initialize();
		}

		void Initialize()
		{
			_hitBySpell = false;
			_percentHP = urand(15, 55);
		}

		void Reset() override
		{
			Initialize();
			me->SetHealth(me->CountPctFromMaxHealth(_percentHP));
		}

		void SpellHit(Unit* caster, SpellInfo const* spell) override
		{
			if (!_hitBySpell)
			{
				_hitBySpell = true;
				_events.ScheduleEvent(EVENT_RESET_HEALTH, 30000);
			}

			if (spell->Id == SPELL_FLASH_HEAL)
				if (Player* player = caster->ToPlayer())
					player->KilledMonsterCredit(QUEST_KILL_CREDIT);
		}

		void UpdateAI(uint32 diff) override
		{
			if (!_hitBySpell)
				return;

			_events.Update(diff);

			while (uint32 eventId = _events.ExecuteEvent())
			{
				switch (eventId)
				{
				case EVENT_RESET_HEALTH:
					me->SetHealth(me->CountPctFromMaxHealth(_percentHP));
					_hitBySpell = false;
					break;
				default:
					break;
				}
			}
		}
	private:
		EventMap _events;
		uint8 _percentHP;
		bool _hitBySpell;
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_wounded_militaAI(creature);
	}
};

/// Milo's Gyro - 37198
enum MilosGyro
{
	NPC_MILO = 37518,
	SPELL_RIDE_VEHICLE_HARD_CODED = 46598,
	SPELL_EJECT_ALL_PASSENGERS = 50630,
	SAY_MILO_FLIGHT_1 = 0,
	SAY_MILO_FLIGHT_2 = 1,
	SAY_MILO_FLIGHT_3 = 2,
	SAY_MILO_FLIGHT_4 = 3,
	SAY_MILO_FLIGHT_5 = 4,
	SAY_MILO_FLIGHT_6 = 5,
	SAY_MILO_FLIGHT_7 = 6,
	EVENT_START_PATH = 5,
	EVENT_MILO_SAY_0 = 6,
	EVENT_MILO_SAY_1 = 7,
	EVENT_MILO_SAY_2 = 8,
	EVENT_MILO_SAY_3 = 9,
	EVENT_MILO_SAY_4 = 10,
	EVENT_MILO_SAY_5 = 11,
	EVENT_MILO_SAY_6 = 12,
	EVENT_MILO_DESPAWN = 13
};

enum eMoves
{
	pathSize = 24
};

static std::array<G3D::Vector3, eMoves::pathSize> g_kharanosPath =
{
	{
		{ -6247.328f, 299.5365f, 390.266f   },
		{ -6247.328f, 299.5365f, 390.266f   },
		{ -6250.934f, 283.5417f, 393.46f    },
		{ -6253.335f, 252.7066f, 403.0702f  },
		{ -6257.292f, 217.4167f, 424.3807f  },
		{ -6224.2f,   159.9861f, 447.0882f  },
		{ -6133.597f, 164.3177f, 491.0316f  },
		{ -6084.236f, 183.375f, 508.5401f   },
		{ -6020.382f, 179.5052f, 521.5396f  },
		{ -5973.592f, 161.7396f, 521.5396f  },
		{ -5953.665f, 151.6111f, 514.5687f  },
		{ -5911.031f, 146.4462f, 482.1806f  },
		{ -5886.389f, 124.125f, 445.6252f   },
		{ -5852.08f,  55.80903f, 406.7922f  },
		{ -5880.707f, 12.59028f, 406.7922f  },
		{ -5927.887f, -74.02257f, 406.7922f },
		{ -5988.436f, -152.0174f, 425.6251f },
		{ -6015.274f, -279.467f, 449.528f   },
		{ -5936.465f, -454.1875f, 449.528f  },
		{ -5862.575f, -468.0504f, 444.3899f },
		{ -5783.58f,  -458.6042f, 432.5026f },
		{ -5652.707f, -463.4427f, 415.0308f },
		{ -5603.897f, -466.3438f, 409.8931f },
		{ -5566.957f, -472.5642f, 399.0056f }
	}
	
};

class npc_milos_gyro : public CreatureScript
{
public:
	npc_milos_gyro() : CreatureScript("npc_milos_gyro") { }

	struct npc_milos_gyro_AI : public VehicleAI
	{
		npc_milos_gyro_AI(Creature* creature) : VehicleAI(creature), _waitBeforePath(true) { }

		void Reset() override
		{
			_events.Reset();
			_miloGUID.Clear();
			_waitBeforePath = true;
		}

		void PassengerBoarded(Unit* passenger, int8 /*seatId*/, bool apply) override
		{
			if (apply && passenger->GetTypeId() == TYPEID_PLAYER)
			{
				Position l_Pos;
				me->GetPosition(&l_Pos);
				if (Creature* milo = passenger->SummonCreature(NPC_MILO, l_Pos, TEMPSUMMON_CORPSE_DESPAWN, 0))
				{
					_waitBeforePath = false;
					_miloGUID = milo->GetGUID();
					milo->CastSpell(me, SPELL_RIDE_VEHICLE_HARD_CODED);
					_events.ScheduleEvent(EVENT_START_PATH, 1000);
				}
			}
		}

		void MovementInform(uint32 type, uint32 pointId) override
		{
			if (type == EFFECT_MOTION_TYPE && pointId == pathSize)
				_events.ScheduleEvent(EVENT_MILO_DESPAWN, 1000);
		}

		void UpdateAI(uint32 diff) override
		{
			if (_waitBeforePath)
				return;

			_events.Update(diff);

			if (me->HasUnitState(UNIT_STATE_CASTING))
				return;

			while (uint32 eventId = _events.ExecuteEvent())
			{
				switch (eventId)
				{
				case EVENT_START_PATH:
					me->GetMotionMaster()->MoveSmoothPath(pathSize, g_kharanosPath.data(), g_kharanosPath.size(), false, true);
					_events.ScheduleEvent(EVENT_MILO_SAY_0, 5000);
					break;
				case EVENT_MILO_SAY_0:
					if (Creature* milo = ObjectAccessor::GetCreature(*me, _miloGUID))
						milo->AI()->Talk(SAY_MILO_FLIGHT_1, _miloGUID);
					_events.ScheduleEvent(EVENT_MILO_SAY_1, 6000);
					break;
				case EVENT_MILO_SAY_1:
					if (Creature* milo = ObjectAccessor::GetCreature(*me, _miloGUID))
						milo->AI()->Talk(SAY_MILO_FLIGHT_2, _miloGUID);
					_events.ScheduleEvent(EVENT_MILO_SAY_2, 11000);
					break;
				case EVENT_MILO_SAY_2:
					if (Creature* milo = ObjectAccessor::GetCreature(*me, _miloGUID))
						milo->AI()->Talk(SAY_MILO_FLIGHT_3, _miloGUID);
					_events.ScheduleEvent(EVENT_MILO_SAY_3, 11000);
					break;
				case EVENT_MILO_SAY_3:
					if (Creature* milo = ObjectAccessor::GetCreature(*me, _miloGUID))
						milo->AI()->Talk(SAY_MILO_FLIGHT_4, _miloGUID);
					_events.ScheduleEvent(EVENT_MILO_SAY_4, 18000);
					break;
				case EVENT_MILO_SAY_4:
					if (Creature* milo = ObjectAccessor::GetCreature(*me, _miloGUID))
						milo->AI()->Talk(SAY_MILO_FLIGHT_5, _miloGUID);
					_events.ScheduleEvent(EVENT_MILO_SAY_5, 11000);
					break;
				case EVENT_MILO_SAY_5:
					if (Creature* milo = ObjectAccessor::GetCreature(*me, _miloGUID))
						milo->AI()->Talk(SAY_MILO_FLIGHT_6, _miloGUID);
					_events.ScheduleEvent(EVENT_MILO_SAY_6, 14000);
					break;
				case EVENT_MILO_SAY_6:
					if (Creature* milo = ObjectAccessor::GetCreature(*me, _miloGUID))
						milo->AI()->Talk(SAY_MILO_FLIGHT_7, _miloGUID);
					break;
				case EVENT_MILO_DESPAWN:
					me->RemoveAllAuras();
					if (Creature* milo = ObjectAccessor::GetCreature(*me, _miloGUID))
						milo->DespawnOrUnsummon();
					_waitBeforePath = true;
					break;
				default:
					break;
				}
			}
		}
	private:
		EventMap _events;
		ObjectGuid _miloGUID;
		bool _waitBeforePath;
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_milos_gyro_AI(creature);
	}
};


enum eMiscQuest
{
	QUEST_FORCED_TO_WATCH_FROM_AFAR	= 313,
	SPELL_SUMMON_ALARM_BOT			= 23004, // Wrong ID, couldn't find the spell that summons the official bot

	// Gossips
	GOSSIP_MENU_DUNSTAN	= 11455,
	GOSSIP_MENU_LEWIN	= 11456,
	GOSSIP_MENU_VALGRUM = 11457,

	GOSSIP_OPTION		= 0,

	NPC_TEXT_DUNSTAN	= 15972,
	NPC_TEXT_LEWIN		= 15973,
	NPC_TEXT_VALGRUM	= 15974,
};

/// Mountaineer Dunstan - 40991
class npc_mountaineer_dunstan : public CreatureScript
{
public:
	npc_mountaineer_dunstan() : CreatureScript("npc_mountaineer_dunstan") { }

	bool OnGossipHello(Player* p_Player, Creature* p_Creature) override
	{
		if (p_Player->GetQuestStatus(QUEST_FORCED_TO_WATCH_FROM_AFAR) == QUEST_STATUS_INCOMPLETE)
		{
			p_Player->ADD_GOSSIP_ITEM_DB(GOSSIP_MENU_DUNSTAN, GOSSIP_OPTION, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF);
			p_Player->SEND_GOSSIP_MENU(NPC_TEXT_DUNSTAN, p_Creature->GetGUID());
		}

		p_Player->SEND_GOSSIP_MENU(NPC_TEXT_DUNSTAN, p_Creature->GetGUID());

		return true;
	}

	bool OnGossipSelect(Player* player, Creature* creature, uint32 /*sender*/, uint32 action) override
	{
		switch (action)
		{
			case GOSSIP_ACTION_INFO_DEF:
			{
				if (player->GetQuestStatus(QUEST_FORCED_TO_WATCH_FROM_AFAR) == QUEST_STATUS_INCOMPLETE)
				{
					creature->AI()->DoAction(0);
					player->KilledMonsterCredit(40991);
					player->CLOSE_GOSSIP_MENU();
				}
			}
		}

		player->PlayerTalkClass->ClearMenus();
		player->PlayerTalkClass->SendCloseGossip();
		return true;
	}

	struct npc_mountaineer_dunstanAI : public ScriptedAI
	{
		npc_mountaineer_dunstanAI(Creature* creature) : ScriptedAI(creature) {	}


		void Reset()
		{
			ClearDelayedOperations();
		}

		void DoAction(int32 const p_Action) override
		{
			switch (p_Action)
			{
			case 0:
				AddTimedDelayedOperation(0.5 * TimeConstants::IN_MILLISECONDS, [this]() -> void
				{
					Talk(0);

				});
				AddTimedDelayedOperation(1 * TimeConstants::IN_MILLISECONDS, [this]() -> void
				{
					me->HandleEmoteCommand(EMOTE_ONESHOT_SALUTE);

				});
				AddTimedDelayedOperation(2.5 * TimeConstants::IN_MILLISECONDS, [this]() -> void
				{
					me->HandleEmoteCommand(EMOTE_STATE_USESTANDING);
				});
				AddTimedDelayedOperation(5 * TimeConstants::IN_MILLISECONDS, [this]() -> void
				{
					DoCast(SPELL_SUMMON_ALARM_BOT);
				});
				break;
			}
		}

		void UpdateAI(uint32 const p_Diff)
		{
			UpdateOperations(p_Diff);
		}
	};
	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_mountaineer_dunstanAI(creature);
	}
};

/// Mountaineer Lewin - 40994
class npc_mountaineer_lewin : public CreatureScript
{
public:
	npc_mountaineer_lewin() : CreatureScript("npc_mountaineer_lewin") { }

	bool OnGossipHello(Player* p_Player, Creature* p_Creature) override
	{
		if (p_Player->GetQuestStatus(QUEST_FORCED_TO_WATCH_FROM_AFAR) == QUEST_STATUS_INCOMPLETE)
		{
			p_Player->ADD_GOSSIP_ITEM_DB(GOSSIP_MENU_LEWIN, GOSSIP_OPTION, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF);
			p_Player->SEND_GOSSIP_MENU(NPC_TEXT_LEWIN, p_Creature->GetGUID());
		}

		p_Player->SEND_GOSSIP_MENU(NPC_TEXT_LEWIN, p_Creature->GetGUID());

		return true;
	}

	bool OnGossipSelect(Player* player, Creature* creature, uint32 /*sender*/, uint32 action) override
	{
		switch (action)
		{
		case GOSSIP_ACTION_INFO_DEF:
		{
			if (player->GetQuestStatus(QUEST_FORCED_TO_WATCH_FROM_AFAR) == QUEST_STATUS_INCOMPLETE)
			{
				creature->AI()->DoAction(0);
				player->KilledMonsterCredit(40991);
				player->CLOSE_GOSSIP_MENU();
			}
		}
		}

		player->PlayerTalkClass->ClearMenus();
		player->PlayerTalkClass->SendCloseGossip();
		return true;
	}

	struct npc_mountaineer_lewinAI : public ScriptedAI
	{
		npc_mountaineer_lewinAI(Creature* creature) : ScriptedAI(creature) {	}


		void Reset()
		{
			ClearDelayedOperations();
		}

		void DoAction(int32 const p_Action) override
		{
			switch (p_Action)
			{
			case 0:
				AddTimedDelayedOperation(0.5 * TimeConstants::IN_MILLISECONDS, [this]() -> void
				{
					Talk(0);

				});
				AddTimedDelayedOperation(1 * TimeConstants::IN_MILLISECONDS, [this]() -> void
				{
					me->HandleEmoteCommand(EMOTE_ONESHOT_SALUTE);

				});
				AddTimedDelayedOperation(2.5 * TimeConstants::IN_MILLISECONDS, [this]() -> void
				{
					me->HandleEmoteCommand(EMOTE_STATE_USESTANDING);
				});
				AddTimedDelayedOperation(5 * TimeConstants::IN_MILLISECONDS, [this]() -> void
				{
					DoCast(SPELL_SUMMON_ALARM_BOT);
				});
				break;
			}
		}

		void UpdateAI(uint32 const p_Diff)
		{
			UpdateOperations(p_Diff);
		}
	};
	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_mountaineer_lewinAI(creature);
	}
};

/// Mountaineer Valgrum - 41056
class npc_mountaineer_valgrum : public CreatureScript
{
public:
	npc_mountaineer_valgrum() : CreatureScript("npc_mountaineer_valgrum") { }

	bool OnGossipHello(Player* p_Player, Creature* p_Creature) override
	{
		if (p_Player->GetQuestStatus(QUEST_FORCED_TO_WATCH_FROM_AFAR) == QUEST_STATUS_INCOMPLETE)
		{
			p_Player->ADD_GOSSIP_ITEM_DB(GOSSIP_MENU_VALGRUM, GOSSIP_OPTION, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF);
			p_Player->SEND_GOSSIP_MENU(NPC_TEXT_VALGRUM, p_Creature->GetGUID());
		}
		
		p_Player->SEND_GOSSIP_MENU(NPC_TEXT_VALGRUM, p_Creature->GetGUID());

		return true;
	}

	bool OnGossipSelect(Player* player, Creature* creature, uint32 /*sender*/, uint32 action) override
	{
		switch (action)
		{
		case GOSSIP_ACTION_INFO_DEF:
		{
			if (player->GetQuestStatus(QUEST_FORCED_TO_WATCH_FROM_AFAR) == QUEST_STATUS_INCOMPLETE)
			{
				creature->AI()->DoAction(0);
				player->KilledMonsterCredit(40991);
				player->CLOSE_GOSSIP_MENU();
			}
		}
		}

		player->PlayerTalkClass->ClearMenus();
		player->PlayerTalkClass->SendCloseGossip();
		return true;
	}

	struct npc_mountaineer_valgrumAI : public ScriptedAI
	{
		npc_mountaineer_valgrumAI(Creature* creature) : ScriptedAI(creature) {	}


		void Reset()
		{
			ClearDelayedOperations();
		}

		void DoAction(int32 const p_Action) override
		{
			switch (p_Action)
			{
			case 0:
				AddTimedDelayedOperation(0.5 * TimeConstants::IN_MILLISECONDS, [this]() -> void
				{
					Talk(0);
					
				});
				AddTimedDelayedOperation(1 * TimeConstants::IN_MILLISECONDS, [this]() -> void
				{
					me->HandleEmoteCommand(EMOTE_ONESHOT_SALUTE);
					
				});
				AddTimedDelayedOperation(2.5 * TimeConstants::IN_MILLISECONDS, [this]() -> void
				{
					me->HandleEmoteCommand(EMOTE_STATE_USESTANDING);
				});
				AddTimedDelayedOperation(5 * TimeConstants::IN_MILLISECONDS, [this]() -> void
				{
					DoCast(SPELL_SUMMON_ALARM_BOT);
				});
				break;
			}
		}

		void UpdateAI(uint32 const p_Diff)
		{
			UpdateOperations(p_Diff);
		}
	};
	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_mountaineer_valgrumAI(creature);
	}
};



/// Constriction Totem - 41202
class npc_constriction_totem : public CreatureScript
{
public:
	npc_constriction_totem() : CreatureScript("npc_constriction_totem") { }
	
	enum eMisc
	{
		// Quest
		QUEST_PUSHING_FORWARD		= 25792,

		// Npcs
		NPC_KHARANOS_MOUNTAINEER	= 41237,

		// Misc
		SPELL_BURN_CONST_TOTEM		= 77314,  /// <-- Instead of making a spell script and return an error if it's cast on the wrong entry: I scripted it to kill this entry and put in a condition to only be used on this creature.
		SPELL_CONST_TOTEM_AURA		= 77311,
		ActionDeath					= 0

		
	};

	struct npc_constriction_totemAI : public ScriptedAI
	{
		npc_constriction_totemAI(Creature* creature) : ScriptedAI(creature) {
			MountaineerGUID = 0;
		}

		uint64 MountaineerGUID;
		void Reset()
		{
			ClearDelayedOperations();

			if (Creature* kharanosMountaineer = me->FindNearestCreature(NPC_KHARANOS_MOUNTAINEER, 7.0f, true))
			{
				MountaineerGUID = kharanosMountaineer->GetGUID();
				me->CastSpell(kharanosMountaineer, SPELL_CONST_TOTEM_AURA, true);
			}
		}

		void SpellHit(Unit* Caster, const SpellInfo* Spell) override
		{
			if (Caster->ToPlayer() && Caster->ToPlayer()->GetQuestStatus(QUEST_PUSHING_FORWARD) == QUEST_STATUS_INCOMPLETE)
				if (Spell->Id == SPELL_BURN_CONST_TOTEM)
					me->AI()->DoAction(ActionDeath);
			return;
		}

		void DoAction(int32 const p_Action) override
		{
			switch (p_Action)
			{
				case 0:
					AddTimedDelayedOperation(0.2 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->DisappearAndDie(); // Kill credit

					});
					AddTimedDelayedOperation(1 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						if (Creature* kharanosMountaineer = sObjectAccessor->GetCreature(*me, MountaineerGUID))
						{
							kharanosMountaineer->RemoveAurasDueToSpell(SPELL_CONST_TOTEM_AURA);
							kharanosMountaineer->AI()->Talk(0, me->GetGUID()); /// <-- From sniffs, apparently the receiver is the constriction totem.
							kharanosMountaineer->AI()->Talk(1, me->GetGUID());
						}
							
					});
					AddTimedDelayedOperation(3 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						if (Creature* kharanosMountaineer = sObjectAccessor->GetCreature(*me, MountaineerGUID))
						{
							kharanosMountaineer->GetMotionMaster()->MoveRandom(10.0f);
						}
					});
					AddTimedDelayedOperation(6 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						if (Creature* kharanosMountaineer = sObjectAccessor->GetCreature(*me, MountaineerGUID))
						{
							kharanosMountaineer->DespawnOrUnsummon();
						}
					});
					break;
			}
		}

		void UpdateAI(uint32 const p_Diff)
		{
			UpdateOperations(p_Diff);
		}
	};
	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_constriction_totemAI(creature);
	}
};




/// Spell - Low Health: 76143
class spell_low_health : public SpellScriptLoader
{
public:
	spell_low_health() : SpellScriptLoader("spell_low_health") { }

	class spell_low_health_SpellScript : public SpellScript
	{
		float randHealth = urand(10, 20);

		PrepareSpellScript(spell_low_health_SpellScript);

		void HandleDummyEffect(SpellEffIndex /*eff*/)
		{
			if (Creature* target = GetHitCreature())
			{
				target->setRegeneratingHealth(false);
				target->SetHealth(target->CountPctFromMaxHealth(randHealth));
			}
		}

		void Register() override
		{
			OnEffectHitTarget += SpellEffectFn(spell_low_health_SpellScript::HandleDummyEffect, EFFECT_0, SPELL_EFFECT_APPLY_AURA);
		}
	};

	SpellScript* GetSpellScript() const override
	{
		return new spell_low_health_SpellScript();
	}
};


#ifndef __clang_analyzer__
void AddSC_dun_morogh_area_coldridge_valley()
{
	/// Npcs
	new npc_joren_ironstock();
	new npc_coldridge_defender();
	new npc_rockjaw_invader();
	new npc_rockjaw_scavenger();
	new npc_soothsayer_shikala();
	new npc_soothsayer_rikkari();
	new npc_soothsayer_mirimkoa();
	new npc_hands_springsprocket();
	new npc_wounded_coldridge_mountaineer();
	new npc_wounded_milita();
	new npc_milos_gyro();
	new npc_mountaineer_dunstan();
	new npc_mountaineer_lewin();
	new npc_mountaineer_valgrum();
	new npc_constriction_totem();

	/// Spells
	new spell_low_health();
}
#endif
