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
#include "ObjectMgr.h"
#include "ScriptMgr.h"
#include "World.h"
#include "PetAI.h"
#include "PassiveAI.h"
#include "CombatAI.h"
#include "GameEventMgr.h"
#include "GridNotifiers.h"
#include "GridNotifiersImpl.h"
#include "Cell.h"
#include "CellImpl.h"
#include "SpellAuras.h"
#include "Vehicle.h"
#include "MotionMaster.h"
#include "ObjectAccessor.h"
#include "GameEventMgr.h"
#include "CreatureGroups.h"
#include "Player.h"
#include "SpellScript.h"

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
	NPC_FROSTMANE_SCOUT = 41175,
	NPC_FROSTMANE_SCAVENGER = 41146,
	NPC_KHARANOS_MOUNTAINEER = 41181,
	NPC_KHARANOS_RIFLEMAN	 = 41182,

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


/// Quest Status Handler
class playerScript_coldridge_valley_handler : public PlayerScript
{
public:
	playerScript_coldridge_valley_handler() : PlayerScript("playerScript_coldridge_valley_handler") { }

	enum eMisc
	{
		/// ******* Coldridge Valley Tunnel ******* ///
		QUEST_FOLLOW_THAT_GYRO_COPTER				= 24491,
		SPELL_FOLLOW_THAT_GYRO_COPTER_QUEST_START	= 70047,
	};

	void UpdatePhaseMask(Player* p_Player)
	{
		/// UPDATE PHASEMASK DEPENDING OF QUESTS
		uint32 l_PhaseMask = p_Player->GetPhaseMask();
		uint32 p_NewAreaId = p_Player->GetAreaId();

		if (p_NewAreaId == 132) // Coldridge Valley
		{
			if (p_Player->GetQuestStatus(QUEST_FOLLOW_THAT_GYRO_COPTER) == QUEST_STATUS_INCOMPLETE) // Milo Geartwinge Arrival
			{
				p_Player->AddAura(SPELL_FOLLOW_THAT_GYRO_COPTER_QUEST_START, p_Player); // Invisibility Detection
			}

			p_Player->SetPhaseMask(l_PhaseMask, true);
		}
	}

	void OnUpdateZone(Player* p_Player, uint32 p_NewZoneId, uint32 p_OldZoneID, uint32 p_NewAreaId) override
	{
		if (p_NewAreaId == 132) // Coldridge Valley
		{
			uint32 l_PhaseMask = p_Player->GetPhaseMask();

			if (p_Player->GetQuestStatus(QUEST_FOLLOW_THAT_GYRO_COPTER) == QUEST_STATUS_INCOMPLETE) // Milo Geartwinge Arrival
			{
				p_Player->AddAura(SPELL_FOLLOW_THAT_GYRO_COPTER_QUEST_START, p_Player); // Invisibility Detection
			}

			p_Player->SetPhaseMask(l_PhaseMask, true);
		}
	}

	void OnLogin(Player* p_Player) override
	{
		if (p_Player->GetZoneId() == 6176) // Coldridge Valley
			UpdatePhaseMask(p_Player);
	}

	void OnQuestAbandon(Player* p_Player, const Quest* /*p_Quest*/) override
	{
		if (p_Player->GetZoneId() == 6176) // Coldridge Valley
			UpdatePhaseMask(p_Player);
	}

	void OnQuestComplete(Player* p_Player, const Quest* p_Quest) override
	{
		if (p_Player->GetZoneId() == 6176) // Coldridge Valley
			UpdatePhaseMask(p_Player);
	}

};


/// Joren Ironstock - 37081
//class npc_joren_ironstock : public CreatureScript
//{
//public:
//	npc_joren_ironstock() : CreatureScript("npc_joren_ironstock") { }
//
//	CreatureAI* GetAI(Creature* creature) const override
//	{
//		return new npc_joren_ironstockAI(creature);
//	}
//
//	enum eMisc
//	{
//		EVENT_SUMMON_INVADERS = 0,
//	};
//
//	struct npc_joren_ironstockAI : public ScriptedAI
//	{
//		npc_joren_ironstockAI(Creature* creature) : ScriptedAI(creature) {}
//
//		uint32 invaders;
//		uint64 rockjawTarget;
//
//		// Positions for Rockjaw Invaders
//		Position const spawnPts[7] =
//		{
//			{ -6257.2813f, 328.7897f, 382.1249f },
//			{ -6257.2900f, 337.4182f, 381.6851f },
//			{ -6257.5322f, 345.7486f, 381.7038f },
//			{ -6260.5698f, 358.6521f, 383.6841f },
//			{ -6248.7549f, 371.9600f, 383.7324f },
//			{ -6201.4927f, 334.7021f, 390.3081f },
//			{ -6209.2056f, 308.1535f, 388.2065f }
//		};
//
//		void Reset() override
//		{
//			rockjawTarget = 0;
//			me->SetSheath(SHEATH_STATE_MELEE);
//			me->setRegeneratingHealth(true);
//		}
//		
//
//		void EnterCombat(Unit * who) override
//		{
//			Talk(urand(0, 2)); // Random aggro text
//			if (!me->HasUnitState(UNIT_STATE_ROOT))
//				me->AddUnitState(UNIT_STATE_ROOT);
//		}
//
//		void DamageTaken(Unit* doneBy, uint32& damage, SpellInfo const* /*p_SpellInfo*/) override
//		{
//			if (doneBy->ToCreature()->GetEntry() == NPC_ROCKJAW_INVADER)
//					damage = 0;
//		}
//
//		void DamageDealt(Unit* target, uint32& damage, DamageEffectType /*damageType*/) override
//		{
//			if (target->ToCreature()->GetEntry() == NPC_ROCKJAW_INVADER)
//					damage = 0;
//		}
//
//		void UpdateAI(uint32 diff) override
//		{
//
//			if (!UpdateVictim())
//			{
//				Creature* rjInvader = me->FindNearestCreature(NPC_ROCKSAW_INVADER, 5.0f, true);
//				if (rjInvader)
//				{
//					rjInvader->getThreatManager().addThreat(me, 1000000.0f);
//					me->AI()->AttackStart(rjInvader);
//				}	
//				else {
					/// <<<< This is a hackfix, Joren is supposed to summon each invader at its spawnPt if it's killed after about 10 seconds.
//
					/// <<<<<<<<<<<<<<<<<< IMPORTANT -- The invaders keep trying to get to home position and eventually they do and the server crashes. Disabled until a fix is found <<<<<<<<<<<<<<
//					for (uint8 i = 0; i < 7; ++i)
//					{
//						if (Creature* invader = me->SummonCreature(NPC_ROCKJAW_INVADER, spawnPts[i], TEMPSUMMON_DEAD_DESPAWN))
//						{
//							invader->AI()->AttackStart(me);
//							/// 3rd Summon is the main target
//							if (invader->GetHomePosition() == spawnPts[3])
//							{
//								invader->getThreatManager().addThreat(me, 1000000.0f);
//								me->AI()->AttackStart(invader);
//							}
//						}
//					}
//				}
//				
//			}
//				
//			DoMeleeAttackIfReady();
//
//		}
//	};
//};

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

		void EnterCombat(Unit * who)
		{
			me->AddUnitState(UNIT_STATE_ROOT);
			me->HandleEmoteCommand(EMOTE_STATE_READY1H);
		}

		void Reset()
		{
			me->HandleEmoteCommand(EMOTE_STATE_READY1H);
		}


		void DamageTaken(Unit* doneBy, uint32& damage, SpellInfo const* /*p_SpellInfo*/) override
		{
			if (doneBy->ToCreature()->GetEntry() == NPC_ROCKJAW_INVADER)
				if (me->GetHealth() <= damage || me->GetHealthPct() <= 87.0f)
					damage = 0;
		}

		void DamageDealt(Unit* target, uint32& damage, DamageEffectType /*damageType*/) override
		{
			if (target->ToCreature()->GetEntry() == NPC_ROCKJAW_INVADER)
				if (target->GetHealth() <= damage || target->GetHealthPct() <= 91.0f)
					damage = 0;
		}


		void UpdateAI(const uint32 diff)
		{
			if (!UpdateVictim())
				if (Creature* invader = me->FindNearestCreature(NPC_ROCKJAW_INVADER, 6.0f, true))
					me->AI()->AttackStart(invader);

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

		void DamageDealt(Unit* target, uint32& damage, DamageEffectType /*damageType*/)
		{
			if (target->ToCreature())
					damage = 0;
		}

		void DamageTaken(Unit* pWho, uint32& uiDamage, SpellInfo const* /*p_SpellInfo*/)
		{
			if (Creature* npc = pWho->ToCreature())
			{
				if (npc->GetEntry() == NPC_COLDRIDGE_DEFENDER)
					uiDamage = 0;
				if (npc->GetEntry() == NPC_JOREN_IRONSTOCK)
					uiDamage = 0;
			}
				

			if (pWho->GetTypeId() == TYPEID_PLAYER || pWho->isPet())
			{
				if (Creature* guard = me->FindNearestCreature(NPC_COLDRIDGE_DEFENDER, 5.0f, true))
				{
					guard->getThreatManager().resetAllAggro();
					guard->CombatStop(true);
				}
				if (Creature* joren = me->FindNearestCreature(NPC_JOREN_IRONSTOCK, 7.5f, true))
				{
					joren->getThreatManager().resetAllAggro();
					joren->CombatStop(true);
				}

				me->getThreatManager().resetAllAggro();
				me->GetMotionMaster()->MoveChase(pWho);
				me->AI()->AttackStart(pWho);
			}
		}

		void UpdateAI(const uint32 diff)
		{
			if (!UpdateVictim())
				/*if (me->isSummon())
					if (Creature* joren = me->FindNearestCreature(NPC_JOREN_IRONSTOCK, 75.0f, true))
					{
						me->SetTarget(joren->GetGUID());
						me->AI()->AttackStart(joren);
					}*/
						
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
					me->SetHealth(me->CountPctFromMaxHealth(80.0f));
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
					if (Creature* joren = me->FindNearestCreature(NPC_JOREN_IRONSTOCK, 250.0f, true))
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

		void DamageTaken(Unit* Hitter, uint32& Damage, SpellInfo const* /*p_SpellInfo*/) override
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

	SPELL_SEE_COLDRIGE_TUNNEL_ROCKS_SEE_QUEST_INVIS_1 = 70042, /// <<<< Triggered by SPELL_A_TRIP_TO_IRONFORGE_QUEST_COMPLETE - 70046
	SPELL_SEE_MILO_GEARTWINGE_SEE_QUEST_INVIS_2 = 70044, /// <<<< Triggered by Follow That Gyro-Copter - Quest Start - 70047
	SPELL_MILO_GEARTWINGE_INVISIBILITY_QUEST_INVIS_2 = 70045,
	SPELL_A_TRIP_TO_IRONFORGE_QUEST_COMPLETE = 70046,
	SPELL_FOLLOW_THAT_GYRO_COPTER_QUEST_START = 70047,
};

/// Hands Springsprocket - 6782
class npc_hands_springsprocket : public CreatureScript
{
public:
	npc_hands_springsprocket() : CreatureScript("npc_hands_springsprocket") { }

	enum eMisc
	{
		// Gameobject
		GOBJECT_COLDRIDGE_BOULDER_TUNNEL = 201711,

		// Spell
		SPELL_SIGNAL_FLARE	= 70048,

		// Actions
		ActionFlare			= 0,
		ActionBoulder		= 1,

		// Gossip Menu
		SPRINGSPROCKET_NPC_TEXT_HEY	  = 15145,
		SPRINGSPROCKET_NPC_TEXT_ROCKS = 15141,

	};



	bool OnGossipHello(Player* p_Player, Creature* p_Creature)
	{
		p_Player->PrepareQuestMenu(p_Creature->GetGUID());

		if (p_Player->GetQuestStatus(QUEST_A_TRIP_TO_IRONFORGE) == QUEST_STATUS_REWARDED)
			p_Player->SEND_GOSSIP_MENU(SPRINGSPROCKET_NPC_TEXT_ROCKS, p_Creature->GetGUID());

		p_Player->SEND_GOSSIP_MENU(SPRINGSPROCKET_NPC_TEXT_HEY, p_Creature->GetGUID());
		return true;
	}


	bool OnQuestReward(Player* player, Creature* creature, Quest const* quest, uint32 /*opt*/)
	{
		/// <<<< -- IMPORTANT -- This spell triggers two effects: 1) invisibilityType Misc 8 detection (Milo and the Gyro down near Joren) 2) InvisibilityType Misc 7 detection (boulder ID 201711)
		/// <<<< Since gameobjects have no template_addon in the DB and it hasn't been implemented yet. No option but to not create the gameobject spawn at all.
		if (quest->GetQuestId() == QUEST_A_TRIP_TO_IRONFORGE)
			creature->AI()->DoAction(ActionBoulder);
			player->CastSpell(player, SPELL_A_TRIP_TO_IRONFORGE_QUEST_COMPLETE, true);

		return true;
	}

	bool OnQuestAccept(Player* player, Creature* creature, Quest const* quest)
	{
		if (quest->GetQuestId() == QUEST_FOLLOW_THAT_GYRO_COPTER)
			if (!player->HasAura(SPELL_SEE_MILO_GEARTWINGE_SEE_QUEST_INVIS_2))
				creature->AI()->Talk(1, player->GetGUID());
				creature->AI()->DoAction(ActionFlare);
				player->CastSpell(player, SPELL_FOLLOW_THAT_GYRO_COPTER_QUEST_START, true);

		return true;
	}

	struct npc_hands_springsprocketAI : public ScriptedAI
	{
		npc_hands_springsprocketAI(Creature* creature) : ScriptedAI(creature) {	}

		void Reset()
		{
			ClearDelayedOperations();
		}

		void UpdateAI(uint32 const p_Diff)
		{
			UpdateOperations(p_Diff);
		}

		void DoAction(int32 const p_Action) override
		{
			switch (p_Action)
			{
				case ActionFlare:
					AddTimedDelayedOperation(1.5 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						DoCast(SPELL_SIGNAL_FLARE);
					});
					AddTimedDelayedOperation(3.5 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						Talk(2);
					});
					break;

			}
		}

	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_hands_springsprocketAI(creature);
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
			me->setRegeneratingHealth(false);
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
				{
					player->KilledMonsterCredit(QUEST_KILL_CREDIT);
					switch (urand(0, 2))
					{
						case 0: me->MonsterSay("Right on! Could use a beer, now!", LANG_UNIVERSAL, 0); break;
						case 1: me->MonsterSay("Thanks, lad!", LANG_UNIVERSAL, 0); break;
						case 2: me->MonsterSay("Wow! Suddenly feelin' me power comin' back!", LANG_UNIVERSAL, 0); break;
						default: break;
					}
					me->SetStandState(UNIT_STAND_STATE_STAND);
					me->HandleEmoteCommand(EMOTE_ONESHOT_CHEER);
				}
					
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
					me->setRegeneratingHealth(false);
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
	SPELL_RIDE_MILOS_GYRO = 70036,
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
					me->GetMotionMaster()->MoveSmoothFlyPath(0, g_kharanosPath.data(), g_kharanosPath.size(), false);
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
	NPC_OBSERVATION_BOT				= 41052,

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
					creature->SetFacingToObject(player);
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
				AddTimedDelayedOperation(1 * TimeConstants::IN_MILLISECONDS, [this]() -> void
				{
					Talk(0);
				});
				AddTimedDelayedOperation(2 * TimeConstants::IN_MILLISECONDS, [this]() -> void
				{
					me->HandleEmoteCommand(EMOTE_ONESHOT_SALUTE);

				});
				AddTimedDelayedOperation(6 * TimeConstants::IN_MILLISECONDS, [this]() -> void
				{
					me->HandleEmoteCommand(EMOTE_ONESHOT_USESTANDING);
				});
				AddTimedDelayedOperation(8 * TimeConstants::IN_MILLISECONDS, [this]() -> void
				{
					Position l_Pos;
					me->GetPosition(&l_Pos);
					GetPositionWithDistInFront(me, 2.5f, l_Pos);
					float z = me->GetMap()->GetHeight(me->GetPhaseMask(), l_Pos.GetPositionX(), l_Pos.GetPositionY(), l_Pos.GetPositionZ());
					l_Pos.m_positionZ = z;

					if (Creature* AlarmBot = me->SummonCreature(NPC_OBSERVATION_BOT, l_Pos, TEMPSUMMON_TIMED_DESPAWN, 30000))
						me->SetFacingToObject(AlarmBot);

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
				creature->SetFacingToObject(player);
				creature->AI()->DoAction(0);
				player->KilledMonsterCredit(40994);
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
				AddTimedDelayedOperation(1 * TimeConstants::IN_MILLISECONDS, [this]() -> void
				{
					Talk(0);
				});
				AddTimedDelayedOperation(2 * TimeConstants::IN_MILLISECONDS, [this]() -> void
				{
					me->HandleEmoteCommand(EMOTE_ONESHOT_SALUTE);

				});
				AddTimedDelayedOperation(6 * TimeConstants::IN_MILLISECONDS, [this]() -> void
				{
					me->HandleEmoteCommand(EMOTE_ONESHOT_USESTANDING);
				});
				AddTimedDelayedOperation(8 * TimeConstants::IN_MILLISECONDS, [this]() -> void
				{
					Position l_Pos;
					me->GetPosition(&l_Pos);
					GetPositionWithDistInFront(me, 2.5f, l_Pos);
					float z = me->GetMap()->GetHeight(me->GetPhaseMask(), l_Pos.GetPositionX(), l_Pos.GetPositionY(), l_Pos.GetPositionZ());
					l_Pos.m_positionZ = z;

					if (Creature* AlarmBot = me->SummonCreature(NPC_OBSERVATION_BOT, l_Pos, TEMPSUMMON_TIMED_DESPAWN, 30000))
						me->SetFacingToObject(AlarmBot);
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
				creature->SetFacingToObject(player);
				creature->AI()->DoAction(0);
				player->KilledMonsterCredit(41056);
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
				AddTimedDelayedOperation(1 * TimeConstants::IN_MILLISECONDS, [this]() -> void
				{
					Talk(0);
				});
				AddTimedDelayedOperation(2 * TimeConstants::IN_MILLISECONDS, [this]() -> void
				{
					me->HandleEmoteCommand(EMOTE_ONESHOT_SALUTE);

				});
				AddTimedDelayedOperation(6 * TimeConstants::IN_MILLISECONDS, [this]() -> void
				{
					me->HandleEmoteCommand(EMOTE_ONESHOT_USESTANDING);
				});
				AddTimedDelayedOperation(8 * TimeConstants::IN_MILLISECONDS, [this]() -> void
				{
					Position l_Pos;
					me->GetPosition(&l_Pos);
					GetPositionWithDistInFront(me, 2.5f, l_Pos);
					float z = me->GetMap()->GetHeight(me->GetPhaseMask(), l_Pos.GetPositionX(), l_Pos.GetPositionY(), l_Pos.GetPositionZ());
					l_Pos.m_positionZ = z;

					if (Creature* AlarmBot = me->SummonCreature(NPC_OBSERVATION_BOT, l_Pos, TEMPSUMMON_TIMED_DESPAWN, 30000))
						me->SetFacingToObject(AlarmBot);
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

		// Spell
		SPELL_BURN_CONST_TOTEM		= 77314,  
		SPELL_CONST_TOTEM_AURA		= 77311,

		// Action
		SetFree						= 0,

		
	};

	struct npc_constriction_totemAI : public ScriptedAI
	{
		npc_constriction_totemAI(Creature* creature) : ScriptedAI(creature) {	}

		bool MountaineerFreed;
		Creature* MyMountaineer;
		uint32 CastTimer;

		void Reset()
		{
			ClearDelayedOperations();

			if (Creature* Mountaineer = me->FindNearestCreature(NPC_KHARANOS_MOUNTAINEER, 8.0f, true))
			{
				if (!Mountaineer->HasAura(SPELL_CONST_TOTEM_AURA))
				{
					MyMountaineer = Mountaineer;
					me->AddAura(SPELL_CONST_TOTEM_AURA, Mountaineer);
				}
			}
			else MyMountaineer = NULL;
			MountaineerFreed = false;
			CastTimer = 2000;
		}

		void DoAction(int32 const p_Action) override
		{
			switch (p_Action)
			{
				case SetFree:
				{
					AddTimedDelayedOperation(1 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						if (Creature* Mountaineer = me->FindNearestCreature(NPC_KHARANOS_MOUNTAINEER, 8.0f, true))
							if (Mountaineer->HasAura(SPELL_CONST_TOTEM_AURA))
							{
								Mountaineer->RemoveAurasDueToSpell(SPELL_CONST_TOTEM_AURA);
								Mountaineer->AI()->Talk(0, me->GetGUID());
								Mountaineer->AI()->Talk(1, me->GetGUID());
							}
					});

					AddTimedDelayedOperation(2.5 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						if (Creature* Mountaineer = me->FindNearestCreature(NPC_KHARANOS_MOUNTAINEER, 8.0f, true))
						{
							me->ForcedDespawn();
							float x, y, z;
							Mountaineer->GetClosePoint(x, y, z, Mountaineer->GetObjectSize() / 3, 5.0f);
							Mountaineer->GetMotionMaster()->MovePoint(1, x, y, z);
							Mountaineer->DespawnOrUnsummon(5000);
							
						}
					});

					break;
				}
				default:
					break;
			}
		}

		void UpdateAI(uint32 const diff)
		{
			UpdateOperations(diff);

			if (CastTimer <= diff)
			{
				if (!MyMountaineer)
				{
					if (Creature* Mountaineer = me->FindNearestCreature(NPC_KHARANOS_MOUNTAINEER, 8.0f, true))
					{
						if (!Mountaineer->HasAura(SPELL_CONST_TOTEM_AURA))
						{
							MyMountaineer = Mountaineer;
							me->AddAura(SPELL_CONST_TOTEM_AURA, Mountaineer);
							CastTimer = -1;
						}
						else CastTimer = 2000;
					}
					else CastTimer = 2000;
				}
				else CastTimer = -1;
			}
			else CastTimer -= diff;
		}
	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_constriction_totemAI(creature);
	}
};


/// Kharanos Mountaineer - 41181
class npc_kharanos_mountaineer_41181 : public CreatureScript
{
public:
	npc_kharanos_mountaineer_41181() : CreatureScript("npc_kharanos_mountaineer_41181") { }

	struct npc_kharanos_mountaineer_41181AI : public ScriptedAI
	{
		npc_kharanos_mountaineer_41181AI(Creature* creature) : ScriptedAI(creature)
		{
			me->HandleEmoteCommand(EMOTE_STATE_READY1H);
		}

		uint32 uiSayCombatTimer;

		void EnterCombat(Unit* who)
		{
			me->ClearUnitState(UNIT_STATE_ROOT);
			uiSayCombatTimer = urand(10000, 190000);
		}

		void Reset()
		{
			me->AddUnitState(UNIT_STATE_ROOT);
			me->HandleEmoteCommand(EMOTE_STATE_READY1H);
		}


		void DamageTaken(Unit* doneBy, uint32& damage, SpellInfo const* /*p_SpellInfo*/) override
		{
			if (doneBy->ToCreature()->GetEntry() == (NPC_FROSTMANE_SCOUT || NPC_FROSTMANE_SCAVENGER))
				if (me->GetHealth() <= damage || me->GetHealthPct() <= 87.0f)
					damage = 0;
		}

		void DamageDealt(Unit* target, uint32& damage, DamageEffectType /*damageType*/) override
		{
			if (target->ToCreature()->GetEntry() == (NPC_FROSTMANE_SCOUT || NPC_FROSTMANE_SCAVENGER))
				if (target->GetHealth() <= damage || target->GetHealthPct() <= 91.0f)
					damage = 0;
		}


		void UpdateAI(const uint32 diff)
		{
			if (uiSayCombatTimer <= diff)
			{
				switch (urand(0, 2))
				{
				case 0: me->MonsterSay("Take 'em down!", LANG_UNIVERSAL, 0); break;
				case 1: me->MonsterSay("Time ta' crack some troll skulls!", LANG_UNIVERSAL, 0); break;
				case 2: me->MonsterSay("Push 'em back!", LANG_UNIVERSAL, 0); break;
				default: break;
				}
				uiSayCombatTimer = urand(10000, 250000);
			}
			else uiSayCombatTimer -= diff;

			if (!UpdateVictim())
				if (Creature* scout = me->FindNearestCreature(NPC_FROSTMANE_SCOUT, 5.0f, true))
					me->AI()->AttackStart(scout);
				if (Creature* scavenger = me->FindNearestCreature(NPC_FROSTMANE_SCAVENGER, 5.0f, true))
					me->AI()->AttackStart(scavenger);

				

			DoMeleeAttackIfReady();
		}
	};
	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_kharanos_mountaineer_41181AI(creature);
	}
};


/// Kharanos Rifleman - 41182
class npc_kharanos_rifleman_41182 : public CreatureScript
{
public:
	npc_kharanos_rifleman_41182() : CreatureScript("npc_kharanos_rifleman_41182") { }

	struct npc_kharanos_rifleman_41182AI : public ScriptedAI
	{
		npc_kharanos_rifleman_41182AI(Creature* creature) : ScriptedAI(creature)
		{
			me->HandleEmoteCommand(EMOTE_STATE_READYRIFLE);
		}

		void EnterCombat(Unit* who)
		{
			me->ClearUnitState(UNIT_STATE_ROOT);
		}

		void Reset()
		{
			me->AddUnitState(UNIT_STATE_ROOT);
			me->HandleEmoteCommand(EMOTE_STATE_READYRIFLE);
		}


		void DamageTaken(Unit* doneBy, uint32& damage, SpellInfo const* /*p_SpellInfo*/) override
		{
			if (doneBy->ToCreature()->GetEntry() == (NPC_FROSTMANE_SCOUT || NPC_FROSTMANE_SCAVENGER))
				if (me->GetHealth() <= damage || me->GetHealthPct() <= 87.0f)
					damage = 0;
		}

		void DamageDealt(Unit* target, uint32& damage, DamageEffectType /*damageType*/) override
		{
			if (target->ToCreature()->GetEntry() == (NPC_FROSTMANE_SCOUT || NPC_FROSTMANE_SCAVENGER))
				if (target->GetHealth() <= damage || target->GetHealthPct() <= 91.0f)
					damage = 0;
		}


		void UpdateAI(const uint32 diff)
		{
			if (!UpdateVictim())
				if (Creature* scout = me->FindNearestCreature(NPC_FROSTMANE_SCOUT, 5.0f, true))
				{
					me->Attack(scout, false);
					me->CombatStart(scout);
				}
					
				if (Creature* scout = me->FindNearestCreature(NPC_FROSTMANE_SCAVENGER, 5.0f, true))
				{
					me->Attack(scout, false);
					me->CombatStart(scout);
				}
					

			DoMeleeAttackIfReady();
		}
	};
	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_kharanos_rifleman_41182AI(creature);
	}
};

/// Frostmane Scout - 41175
class npc_frostmane_scout_41175 : public CreatureScript
{
public:
	npc_frostmane_scout_41175() : CreatureScript("npc_frostmane_scout_41175") { }

	struct npc_frostmane_scout_41175AI : public ScriptedAI
	{
		npc_frostmane_scout_41175AI(Creature* creature) : ScriptedAI(creature)
		{
			me->HandleEmoteCommand(EMOTE_STATE_READY1H);
		}

		uint32 uiSayCombatTimer;

		void EnterCombat(Unit* who)
		{
			me->HandleEmoteCommand(EMOTE_STATE_READY1H);
			me->ClearUnitState(UNIT_STATE_ROOT);
			uiSayCombatTimer = urand(10000, 190000);
		}

		void Reset()
		{
			me->AddUnitState(UNIT_STATE_ROOT);
			me->HandleEmoteCommand(EMOTE_STATE_READY1H);
		}


		void DamageDealt(Unit* target, uint32& damage, DamageEffectType /*damageType*/)
		{
			if (target->ToCreature())
				damage = 0;
		}

		void DamageTaken(Unit* pWho, uint32& uiDamage, SpellInfo const* /*p_SpellInfo*/)
		{
			if (Creature* npc = pWho->ToCreature())
			{
				if (npc->GetEntry() == NPC_KHARANOS_MOUNTAINEER)
					uiDamage = 0;
				if (npc->GetEntry() == NPC_KHARANOS_RIFLEMAN)
					uiDamage = 0;
			}


			if (pWho->GetTypeId() == TYPEID_PLAYER || pWho->isPet())
			{
				if (Creature* mountaineer = me->FindNearestCreature(NPC_KHARANOS_MOUNTAINEER, 10.0f, true))
				{
					mountaineer->getThreatManager().resetAllAggro();
					mountaineer->CombatStop(true);
				}
				if (Creature* rifleman = me->FindNearestCreature(NPC_KHARANOS_RIFLEMAN, 10.0f, true))
				{
					rifleman->getThreatManager().resetAllAggro();
					rifleman->CombatStop(true);
				}

				me->getThreatManager().resetAllAggro();
				me->GetMotionMaster()->MoveChase(pWho);
				me->AI()->AttackStart(pWho);
			}
		}


		void UpdateAI(const uint32 diff)
		{

			if (uiSayCombatTimer <= diff)
			{
				switch (urand(0, 3))
				{
				case 0: me->MonsterSay("I gonna make you into mojo!", LANG_UNIVERSAL, 0); break;
				case 1: me->MonsterSay("Killing you be easy.", LANG_UNIVERSAL, 0); break;
				case 2: me->MonsterSay("My weapon be thirsty!", LANG_UNIVERSAL, 0); break;
				case 3: me->MonsterSay("You be dead soon!", LANG_UNIVERSAL, 0); break;
				default: break;
				}
				uiSayCombatTimer = urand(10000, 250000);
			}
			else uiSayCombatTimer -= diff;

			if (!UpdateVictim())
				if (Creature* mountaineer = me->FindNearestCreature(NPC_KHARANOS_MOUNTAINEER, 10.0f, true))
					me->AI()->AttackStart(mountaineer);
					me->AddUnitState(UNIT_STATE_ROOT);
				if (Creature* rifleman = me->FindNearestCreature(NPC_KHARANOS_RIFLEMAN, 10.0f, true))
					me->AI()->AttackStart(rifleman);
					me->AddUnitState(UNIT_STATE_ROOT);

			DoMeleeAttackIfReady();
		}
	};
	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_frostmane_scout_41175AI(creature);
	}
};


class npc_repaired_mechano_tank : public CreatureScript
{
public:
	npc_repaired_mechano_tank() : CreatureScript("npc_repaired_mechano_tank") { }

	struct npc_repaired_mechano_tankAI : ScriptedAI
	{
		npc_repaired_mechano_tankAI(Creature* creature) : ScriptedAI(creature)
		{
			SetCombatMovement(false);
		}

		void SpellHit(Unit* caster, SpellInfo const* spell) {
			//Get the player who cast the spell
			if (Player* p = caster->ToPlayer()) {
				//Get the id of the spell 
				if (spell->Id == 79751) {
					//if player has that quest incomplete
					if (p->GetQuestStatus(26333) == QUEST_STATUS_INCOMPLETE) {
						//reward the monster
						Quest const* qInfo = sObjectMgr->GetQuestTemplate(26333);
						if (qInfo)
						{
							p->KilledMonsterCredit(42224);
							me->DisappearAndDie();
						}
					}
				}
			}
		}

	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_repaired_mechano_tankAI(creature);
	}
};




/// Spell - Low Health: 76143
class spell_low_health : public SpellScriptLoader
{
public:
	spell_low_health() : SpellScriptLoader("spell_low_health") { }

	class spell_low_health_SpellScript : public SpellScript
	{
		PrepareSpellScript(spell_low_health_SpellScript);

		void HandleDummyEffect(SpellEffIndex /*eff*/)
		{
			if (Creature* target = GetHitCreature())
			{
				target->setRegeneratingHealth(false);
				target->SetHealth(target->CountPctFromMaxHealth(13.0f)); // Retail value
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


class item_paint : public ItemScript
{
public:
	item_paint() : ItemScript("item_paint") {}

	bool OnUse(Player* player, Item* /*item*/, SpellCastTargets const& targets) override
	{
		if (Creature* c = player->FindNearestCreature(42291, 5.0f, true)) {
			if (c->GetEntry() == 42291) {
				if (player->GetQuestStatus(26342) == QUEST_STATUS_INCOMPLETE) {
					Quest const* qInfo = sObjectMgr->GetQuestTemplate(26342);
					player->KilledMonsterCredit(42796);
					c->DisappearAndDie();
				}
			}
		}
		return true;
	}
};

class item_techno_granade : public ItemScript
{
public:
	item_techno_granade() : ItemScript("item_techno_granade") {}

	bool OnUse(Player* player, Item* /*item*/, SpellCastTargets const& /*targets*/) override
	{
		player->CastSpell(player->getVictim(), 79751);
		return true;
	}
};


class item_orbit : public ItemScript
{
public:
	item_orbit() : ItemScript("item_orbit") {}

	bool OnUse(Player* player, Item* /*item*/, SpellCastTargets const& targets) override
	{
		if (Creature* c = player->FindNearestCreature(42839, 10.0f, true)) {
			if (player->GetQuestStatus(26364) == QUEST_STATUS_INCOMPLETE) {
				Quest const* qInfo = sObjectMgr->GetQuestTemplate(26364);
				player->KilledMonsterCredit(42860);
				c->DisappearAndDie();
			}
		}
		return true;
	}
};


#ifndef __clang_analyzer__
void AddSC_dun_morogh_coldridge_valley()
{
	/// PlayerScript
	new playerScript_coldridge_valley_handler();

	/// Npcs
	//new npc_joren_ironstock();
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
	new npc_kharanos_mountaineer_41181();
	new npc_kharanos_rifleman_41182();
	new npc_frostmane_scout_41175();
	new npc_repaired_mechano_tank();

	/// Spells
	new spell_low_health();

	/// Items
	new item_paint();
	new item_techno_granade();
	new item_orbit();
}
#endif
