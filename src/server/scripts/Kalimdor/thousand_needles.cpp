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
#include "CreatureAI.h"


/// Heartrazor - 47486
enum heartrazorActions
{
	ACTION_DIED = 1
};

class npc_heartrazor : public CreatureScript
{
public:
	npc_heartrazor() : CreatureScript("npc_heartrazor") { }

	struct npc_heartrazorAI : public ScriptedAI
	{
		npc_heartrazorAI(Creature* creature) : ScriptedAI(creature) { subduerCounter = 0; }

		enum Id
		{
			// Credit
			QUEST_CREDIT_RELEASE_HEARTRAZOR = 47486,

			// Quest
			QUEST_ENTRY_RELEASE_HEARTRAZOR = 28088
		};

		void Reset()
		{
			subduerCounter = 0;
		}

		void DoAction(int32 action)
		{
			switch (action)
			{
			case ACTION_DIED:
			{
				subduerCounter++;
				if (subduerCounter >= 4)
				{
					me->SetWalk(false);
					me->GetMotionMaster()->MovePoint(0, -5117.07f, -1222.02f, 55.06f, false);
					subduerCounter = 0;
					std::list<Unit*> targets;
					JadeCore::AnyUnitInObjectRangeCheck u_check(me, 150.0f);
					JadeCore::UnitListSearcher<JadeCore::AnyUnitInObjectRangeCheck> searcher(me, targets, u_check);
					me->VisitNearbyObject(150.0f, searcher);
					for (std::list<Unit*>::const_iterator itr = targets.begin(); itr != targets.end(); ++itr)
					{
						Player* nearestPlayer = (*itr)->ToPlayer();
						if (!nearestPlayer)
							continue;

						if (nearestPlayer->GetQuestStatus(QUEST_ENTRY_RELEASE_HEARTRAZOR) == QUEST_STATUS_INCOMPLETE)
							nearestPlayer->KilledMonsterCredit(QUEST_CREDIT_RELEASE_HEARTRAZOR);
					}
					me->DespawnOrUnsummon(8000);
				}
				break;
			}
			default:
				break;
			}
		}

	private:
		uint8 subduerCounter;
	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_heartrazorAI(creature);
	}
};

/// Twilight Subduer - 47487
class npc_twilight_subduer : public CreatureScript
{
public:
	npc_twilight_subduer() : CreatureScript("npc_twilight_subduer") { }

	struct npc_twilight_subduerAI : public ScriptedAI
	{
		npc_twilight_subduerAI(Creature* creature) : ScriptedAI(creature) { }

		enum Id
		{
			NPC_ENTRY_HEARTRAZOR = 47486,
			SPELL_VISUAL_BLUE_CHAIN = 41535,
		};

		void Reset() override
		{
			if (Creature* heartrazor = me->FindNearestCreature(NPC_ENTRY_HEARTRAZOR, 60.0f, true))
				if (!heartrazor->HasAura(SPELL_VISUAL_BLUE_CHAIN))
					me->CastSpell(heartrazor, SPELL_VISUAL_BLUE_CHAIN, true);
		}

		void JustDied(Unit* /*victim*/) override
		{
			if (Creature* heartrazor = me->FindNearestCreature(NPC_ENTRY_HEARTRAZOR, 60.0f, true))
			{
				heartrazor->RemoveAurasDueToSpell(SPELL_VISUAL_BLUE_CHAIN);
				heartrazor->AI()->DoAction(ACTION_DIED);
			}
		}

	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_twilight_subduerAI(creature);
	}
};


/// The Rattle Of Bones - 45463
class npc_rattle_of_bones : public CreatureScript
{
public:
	npc_rattle_of_bones() : CreatureScript("npc_rattle_of_bones") { }

	enum eMisc
	{
		/// Npcs
		NPC_THE_WRIT_OF_HISTORY = 45466,
		NPC_THE_DRUMS_OF_WAR	= 45468,
		NPC_ARIKARA				= 45446,

		/// Spells
		SPELL_RATTLE			= 84949,
		SPELL_EXPLOSION			= 97032,

		/// Misc
		WAYPATH_RATTLE			= 4546300,
	};

	struct npc_rattle_of_bonesAI : public ScriptedAI
	{
		npc_rattle_of_bonesAI(Creature* creature) : ScriptedAI(creature) { }

		uint64 m_PlayerGUID;

		void Reset() override
		{
			m_PlayerGUID = 0;
			ClearDelayedOperations();
		}

		void IsSummonedBy(Unit* summoner) override
		{
			if (Player* player = summoner->ToPlayer())
			{
				m_PlayerGUID = player->GetGUID();
				me->SetSpeed(UnitMoveType::MOVE_RUN, 2.0f, true);
				me->GetMotionMaster()->MovePath(WAYPATH_RATTLE, false);
				me->CastSpell(me, SPELL_RATTLE);

				AddTimedDelayedOperation(10 * TimeConstants::IN_MILLISECONDS, [this]() -> void
				{
					if (Player* player = ObjectAccessor::GetPlayer(*me, m_PlayerGUID))
					{
						Creature* writ = me->FindNearestCreature(NPC_THE_WRIT_OF_HISTORY, 100.0f, true);
						Creature* drums = me->FindNearestCreature(NPC_THE_DRUMS_OF_WAR, 100.0f, true);
						if (writ && drums)
						{
							me->CastSpell(me, SPELL_EXPLOSION);
							writ->CastSpell(writ, SPELL_EXPLOSION);
							drums->CastSpell(drums, SPELL_EXPLOSION);
						}

						player->SummonCreature(NPC_ARIKARA, -5004.63f, -2107.96f, 83.78f, 5.02f, TEMPSUMMON_MANUAL_DESPAWN, 60000);
					}
				});

			}
		}

		void UpdateAI(uint32 const diff) override
		{
			UpdateOperations(diff);
		}

	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_rattle_of_bonesAI(creature);
	}
};


/// Arikara - 45446
// To do: make Arikara fly away at the end, make Arikara summon the spirit and cast the shield -  implement Feralas Sentinel's creature text for when the spirit spawns
class npc_arikara : public CreatureScript
{
public:
	npc_arikara() : CreatureScript("npc_arikara") { }

	enum eMisc
	{
		Surrender = 0,
		NPC_KILL_CREDIT = 45447,
		QUEST_INVOKING_A = 27329,
		QUEST_INVOKING_H = 27330,
	};

	struct npc_arikaraAI : public ScriptedAI
	{
		npc_arikaraAI(Creature* creature) : ScriptedAI(creature) { }

		uint64 m_PlayerGUID;

		void Reset() override
		{
			m_PlayerGUID = 0;
			ClearDelayedOperations();
			me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_PACIFIED | UNIT_FLAG_IMMUNE_TO_PC | UNIT_FLAG_IMMUNE_TO_NPC);
		}

		void IsSummonedBy(Unit* summoner) override
		{
			if (Player* player = summoner->ToPlayer())
			{
				m_PlayerGUID = player->GetGUID();
				TalkWithDelay(1000, 0, m_PlayerGUID);

				AddTimedDelayedOperation(2 * TimeConstants::IN_MILLISECONDS, [this]() -> void
				{
					if (Player* player = ObjectAccessor::GetPlayer(*me, m_PlayerGUID))
					{
						me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_PACIFIED | UNIT_FLAG_IMMUNE_TO_PC | UNIT_FLAG_IMMUNE_TO_NPC);
						me->CombatStart(player);
					}
				});

			}
		}

		void DamageTaken(Unit* doneBy, uint32& damage, SpellInfo const*  /*p_SpellInfo*/) override
		{
			if (doneBy->ToPlayer())
				if (me->GetHealth() <= damage || me->GetHealthPct() <= 1.0f)
				{
					damage = 0;
					me->GetAI()->DoAction(Surrender);
				}
		}

		void DoAction(int32 const p_Action) override
		{
			switch (p_Action)
			{
				case Surrender:
				{
					me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_PACIFIED | UNIT_FLAG_IMMUNE_TO_PC | UNIT_FLAG_IMMUNE_TO_NPC);
					me->RemoveAllAuras();
					me->setRegeneratingHealth(false);
					me->AttackStop();

					me->GetMotionMaster()->MoveTargetedHome();

					if (Player* player = ObjectAccessor::GetPlayer(*me, m_PlayerGUID))
					{
						player->CombatStop();

						if (player->GetQuestStatus(QUEST_INVOKING_A || QUEST_INVOKING_H) == QUEST_STATUS_INCOMPLETE)
							player->KilledMonsterCredit(NPC_KILL_CREDIT);
					}
					break;
				}
			}
		}

		void MovementInform(uint32 type, uint32 id) override
		{

			if (type == HOME_MOTION_TYPE)
			{
				me->AI()->TalkWithDelay(500, 1, m_PlayerGUID);
				me->AI()->TalkWithDelay(3000, 2, m_PlayerGUID);
				me->AI()->TalkWithDelay(3000, 3, m_PlayerGUID);
				me->DespawnOrUnsummon(9000);
				// Todo: make it fly away.
			}
		}

		void UpdateAI(uint32 const diff) override
		{
			UpdateOperations(diff);
		}

	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_arikaraAI(creature);
	}
};


enum heartrazorQuest
{
	QUEST_THE_TWILIGHT_SKYMASTER = 28098,
	SPELL_SUMMON_HEARTRAZOR = 88591,
	SPELL_SUMMON_HEARTRAZOR_2 = 88592
};

/// Heartrazor - 47503
class npc_heartrazor_wp : public CreatureScript
{
public:
	npc_heartrazor_wp() : CreatureScript("npc_heartrazor_wp") { }

	bool OnGossipHello(Player* player, Creature* creature)
	{
		if (player->GetQuestStatus(QUEST_THE_TWILIGHT_SKYMASTER) == QUEST_STATUS_INCOMPLETE)
		{
			player->CastSpell(player, SPELL_SUMMON_HEARTRAZOR, true);
			return true;
		}
		return false;
	}
};

/// Lord Raymond George - 45707
class npc_heartrazor_wp_return : public CreatureScript
{
public:
	npc_heartrazor_wp_return() : CreatureScript("npc_heartrazor_wp_return") { }

	bool OnGossipHello(Player* player, Creature* creature)
	{
		if (player->GetQuestStatus(QUEST_THE_TWILIGHT_SKYMASTER) == QUEST_STATUS_COMPLETE)
		{
			player->CastSpell(player, SPELL_SUMMON_HEARTRAZOR_2, true);
			return true;
		}
		return false;
	}
};



/// Horn Mouthpiece - 203248
class go_horn_mouthpiece : public GameObjectScript
{
public:
	go_horn_mouthpiece() : GameObjectScript("go_horn_mouthpiece") { }

	enum eMisc
	{
		QUEST_GO_BLOW_THAT_HORN_A = 25813,
		QUEST_GO_BLOW_THAT_HORN_H = 25814,
		NPC_WHRRRL = 41334,
		SOUND_SUMMON = 7234,
	};

	bool OnGossipHello(Player* player, GameObject* go)
	{
		if (player->GetQuestStatus(25813) == QUEST_STATUS_INCOMPLETE || player->GetQuestStatus(25814) == QUEST_STATUS_INCOMPLETE)
		{
			player->PlayDirectSound(SOUND_SUMMON);
			Creature* Whrrrl = player->FindNearestCreature(NPC_WHRRRL, 200.0f, true);
			if (!Whrrrl)
				player->SummonCreature(NPC_WHRRRL, -5302.14f, -4378.71f, 140.14f, 2.85f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 60000);
			return false;
		}
		return true;
	}
};

/// Ajamon's Portal to Tirth's Haunt - 207073
class go_ajamon_portal_start : public GameObjectScript
{
public:
	go_ajamon_portal_start() : GameObjectScript("go_ajamon_portal_start") { }

	bool OnGossipHello(Player* player, GameObject* go)
	{
		if (player->GetQuestStatus(25704) == QUEST_STATUS_INCOMPLETE)
		{
			player->CastSpell(player, 52096, true);
			player->TeleportTo(1, -6668.65f, -4220.67f, 86.12f, 1.42f);
			return true;
		}
		return false;
	}
};

/// Ajamon's Portal to the Southsea Holdfast - 207078
class go_ajamon_portal_return : public GameObjectScript
{
public:
	go_ajamon_portal_return() : GameObjectScript("go_ajamon_portal_return") { }

	bool OnGossipHello(Player* player, GameObject* go)
	{
		if (player->GetQuestStatus(25704) == QUEST_STATUS_INCOMPLETE || player->GetQuestStatus(25704) == QUEST_STATUS_COMPLETE)
		{
			player->CastSpell(player, 52096, true);
			player->TeleportTo(1, -6086.65f, -4700.21f, 93.57f, 1.85f);
			return true;
		}
		return false;
	}
};

#ifndef __clang_analyzer__
void AddSC_thousand_needles()
{
	/// Npcs
	new npc_heartrazor();
	new npc_twilight_subduer();
	new npc_rattle_of_bones();
	new npc_arikara();
	new npc_heartrazor_wp();
	new npc_heartrazor_wp_return();

	/// Objects
	new go_horn_mouthpiece();
	new go_ajamon_portal_return();
	new go_ajamon_portal_start();
}
#endif
