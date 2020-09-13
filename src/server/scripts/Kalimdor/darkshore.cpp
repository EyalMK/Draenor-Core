////////////////////////////////////////////////////////////////////////////////
//
// Project-Hellscream https://hellscream.org
// Copyright (C) 2018-2020 Project-Hellscream-6.2
// Discord https://discord.gg/CWCF3C9
//
////////////////////////////////////////////////////////////////////////////////

#include "Player.h"
#include "SpellInfo.h"
#include "Vehicle.h"
#include "WorldSession.h"
#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "ScriptedGossip.h"
#include "ScriptedEscortAI.h"
#include "ScriptedFollowerAI.h"



/// Darkscale Priestess - 34415
class npc_darkscale_priestess : public CreatureScript
{
public:
	npc_darkscale_priestess() : CreatureScript("npc_darkscale_priestess") { }

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_darkscale_priestessAI(creature);
	}

	struct npc_darkscale_priestessAI : public ScriptedAI
	{
		npc_darkscale_priestessAI(Creature* creature) : ScriptedAI(creature) {}

		enum Id
		{
			/// Npcs
			NPC_DARKSCALE_PRIESTESS = 34415,
			NPC_QUEEN_AZSHARA = 34416,

			/// Spells
			SPELL_FROSTBOLT = 9672,
			SPELL_FROST_NOVA = 75062,

			/// Timers
			TIMER_QUEEN_DESPAWN = 60000,
			TIMER_CAST_FROSTBOLT = 4000,
			TIMER_CAST_FROST_NOVA = 9500
		};

		void Reset()
		{
			timerFrostBolt = TIMER_CAST_FROSTBOLT;
			timerFrostNova = TIMER_CAST_FROST_NOVA;
		}

		void JustDied(Unit* /*victim*/)
		{
			Unit* darkscalePriestess = me->FindNearestCreature(NPC_DARKSCALE_PRIESTESS, 200.0f, true);
			if (!darkscalePriestess)
				me->SummonCreature(NPC_QUEEN_AZSHARA, 4598.72f, 889.15f, 40.71f, 2.39f);
		}

		void UpdateAI(uint32 diff)
		{
			if (!UpdateVictim())
				return;

			if (Unit* target = me->getVictim())
			{
				if (timerFrostBolt <= diff)
				{
					DoCast(target, SPELL_FROSTBOLT);
					timerFrostBolt = TIMER_CAST_FROSTBOLT;
				}
				else
					timerFrostBolt -= diff;

				if (timerFrostNova <= diff)
				{
					if (me->IsInRange(target, 0.5f, 0.10f, false))
						DoCast(target, SPELL_FROST_NOVA);
					timerFrostNova = TIMER_CAST_FROST_NOVA;
				}
				else
					timerFrostNova -= diff;
			}

			DoMeleeAttackIfReady();
		}

	private:
		uint16 timerFrostBolt;
		uint16 timerFrostNova;

	};
};

/// Gershala Nightwhisper - 32911 
class npc_gershala_nightwhisper_32911 : public CreatureScript
{
public:
	npc_gershala_nightwhisper_32911() : CreatureScript("npc_gershala_nightwhisper_32911") { }

	enum eQuest
	{
		QUEST_THE_LAST_WAVE_OF_SURVIVORS = 13518,
		NPC_GERSHALA_NIGHTWHISPER = 32911,
		PLAYER_GUID = 99999,
		NPC_RESCUE_SENTINEL = 32969,
		ACTION_START_RESCUE = 101,
	};

	bool OnGossipHello(Player* player, Creature* creature) override
	{
		creature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_STUNNED);
		if (player->GetQuestStatus(QUEST_THE_LAST_WAVE_OF_SURVIVORS) == QUEST_STATUS_INCOMPLETE)
			if (!player->GetReqKillOrCastCurrentCount(QUEST_THE_LAST_WAVE_OF_SURVIVORS, NPC_GERSHALA_NIGHTWHISPER))
				if (Creature* npc = creature->SummonCreature(NPC_RESCUE_SENTINEL, 7422.14f, 151.08f, 1.70f, 0.328f, TEMPSUMMON_TIMED_DESPAWN, 120000))
				{
					player->SEND_GOSSIP_MENU(14300, creature->GetGUID());
					player->KilledMonsterCredit(NPC_GERSHALA_NIGHTWHISPER);
					npc->setFaction(35);
					npc->GetAI()->SetGUID(creature->GetGUID(), NPC_GERSHALA_NIGHTWHISPER);
					npc->GetAI()->SetGUID(player->GetGUID(), PLAYER_GUID);
					npc->GetAI()->DoAction(ACTION_START_RESCUE);
					return true;
				}

		return false;
	}
};

/// Cerellean Whiteclaw - 33093 
class npc_cerellean_whiteclaw_33093 : public CreatureScript
{
public:
	npc_cerellean_whiteclaw_33093() : CreatureScript("npc_cerellean_whiteclaw_33093") { }

	enum eQuest
	{
		QUEST_THE_LAST_WAVE_OF_SURVIVORS = 13518,
		NPC_CERELLEAN_WHITECLAW = 33093,
		PLAYER_GUID = 99999,
		NPC_RESCUE_SENTINEL = 32969,
		ACTION_START_RESCUE = 101,
	};

	bool OnGossipHello(Player* player, Creature* creature) override
	{
		creature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_STUNNED);
		if (player->GetQuestStatus(QUEST_THE_LAST_WAVE_OF_SURVIVORS) == QUEST_STATUS_INCOMPLETE)
			if (!player->GetReqKillOrCastCurrentCount(QUEST_THE_LAST_WAVE_OF_SURVIVORS, NPC_CERELLEAN_WHITECLAW))
				if (Creature* npc = creature->SummonCreature(NPC_RESCUE_SENTINEL, 7375.88f, 113.33f, 12.38f, 1.865f, TEMPSUMMON_TIMED_DESPAWN, 120000))
				{
					player->SEND_GOSSIP_MENU(14297, creature->GetGUID());
					player->KilledMonsterCredit(NPC_CERELLEAN_WHITECLAW);
					npc->setFaction(35);
					npc->GetAI()->SetGUID(creature->GetGUID(), NPC_CERELLEAN_WHITECLAW);
					npc->GetAI()->SetGUID(player->GetGUID(), PLAYER_GUID);
					npc->GetAI()->DoAction(ACTION_START_RESCUE);
					return true;
				}

		return false;
	}
};

/// Volcor - 33094 
class npc_volcor_33094 : public CreatureScript
{
public:
	npc_volcor_33094() : CreatureScript("npc_volcor_33094") { }

	enum eQuest
	{
		QUEST_THE_LAST_WAVE_OF_SURVIVORS = 13518,
		NPC_VOLCOR = 33094,
		PLAYER_GUID = 99999,
		NPC_RESCUE_SENTINEL = 32969,
		ACTION_START_RESCUE = 101,
	};

	bool OnGossipHello(Player* player, Creature* creature) override
	{
		creature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_STUNNED);
		if (player->GetQuestStatus(QUEST_THE_LAST_WAVE_OF_SURVIVORS) == QUEST_STATUS_INCOMPLETE)
			if (!player->GetReqKillOrCastCurrentCount(QUEST_THE_LAST_WAVE_OF_SURVIVORS, NPC_VOLCOR))
				if (Creature* npc = creature->SummonCreature(NPC_RESCUE_SENTINEL, 7431.35f, 87.78f, 2.16f, 1.212f, TEMPSUMMON_TIMED_DESPAWN, 120000))
				{
					player->SEND_GOSSIP_MENU(14298, creature->GetGUID());
					player->KilledMonsterCredit(NPC_VOLCOR);
					npc->setFaction(35);
					npc->GetAI()->SetGUID(creature->GetGUID(), NPC_VOLCOR);
					npc->GetAI()->SetGUID(player->GetGUID(), PLAYER_GUID);
					npc->GetAI()->DoAction(ACTION_START_RESCUE);
					return true;
				}

		return false;
	}
};

/// Shaldyn - 33095 
class npc_shaldyn_33095 : public CreatureScript
{
public:
	npc_shaldyn_33095() : CreatureScript("npc_shaldyn_33095") { }

	enum eQuest
	{
		QUEST_THE_LAST_WAVE_OF_SURVIVORS = 13518,
		NPC_SHALDYN = 33095,
		PLAYER_GUID = 99999,
		NPC_RESCUE_SENTINEL = 32969,
		ACTION_START_RESCUE = 101,
	};

	bool OnGossipHello(Player* player, Creature* creature) override
	{
		creature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_STUNNED);
		if (player->GetQuestStatus(QUEST_THE_LAST_WAVE_OF_SURVIVORS) == QUEST_STATUS_INCOMPLETE)
			if (!player->GetReqKillOrCastCurrentCount(QUEST_THE_LAST_WAVE_OF_SURVIVORS, NPC_SHALDYN))
				if (Creature* npc = creature->SummonCreature(NPC_RESCUE_SENTINEL, 7289.61f, 215.36f, 0.53f, 1.299f, TEMPSUMMON_TIMED_DESPAWN, 120000))
				{
					player->SEND_GOSSIP_MENU(14299, creature->GetGUID());
					player->KilledMonsterCredit(NPC_SHALDYN);
					npc->setFaction(35);
					npc->GetAI()->SetGUID(creature->GetGUID(), NPC_SHALDYN);
					npc->GetAI()->SetGUID(player->GetGUID(), PLAYER_GUID);
					npc->GetAI()->DoAction(ACTION_START_RESCUE);
					return true;
				}

		return false;
	}
};

/// Lordanel Sentinel (Rescue) - 32969
class npc_lordanel_sentinel_32969 : public CreatureScript
{
public:
	npc_lordanel_sentinel_32969() : CreatureScript("npc_lordanel_sentinel_32969") { }

	enum eRescue
	{
		QUEST_THE_LAST_WAVE_OF_SURVIVORS = 13518,
		NPC_GERSHALA_NIGHTWHISPER = 32911,
		NPC_CERELLEAN_WHITECLAW = 33093,
		NPC_VOLCOR = 33094,
		NPC_SHALDYN = 33095,
		PLAYER_GUID = 99999,
		NPC_RESCUE_SENTINEL = 32969,
		NPC_FLYING_MOUNT = 43751,
		NPC_RIDING_MOUNT = 33358,
		ACTION_START_RESCUE = 101,
		EVENT_MOVE_RESCUE = 101,
		EVENT_UNMOUNT_1,
		EVENT_SAY_0,
		EVENT_SAY_1,
		EVENT_DESPAWN_1,
		EVENT_DESPAWN_2,
		EVENT_DESPAWN_3,
		MOVE_SENTINEL_TO_RESCUE = 101,
	};

	struct npc_lordanel_sentinel_32969AI : public ScriptedAI
	{
		npc_lordanel_sentinel_32969AI(Creature* creature) : ScriptedAI(creature) { }

		EventMap m_events;
		uint64   m_npc_to_rescueGUID;
		uint64   m_playerGUID;
		uint64   m_mountGUID;
		uint64   m_sentinelGUID;
		bool     m_isFlying;
		bool     m_isRiding;
		uint32   m_say0;
		uint32   m_say1;

		void Reset() override
		{
			m_events.Reset();
			m_npc_to_rescueGUID = NULL;
			m_playerGUID = NULL;
			m_mountGUID = NULL;
			m_sentinelGUID = NULL;
			m_isFlying = false;
			m_isRiding = false;
			m_say0 = 0;
			m_say1 = 0;
		}

		void SetGUID(uint64 guid, int32 id = 0)
		{
			switch (id)
			{
			case PLAYER_GUID:
			{
				m_playerGUID = guid;
				break;
			}
			case NPC_CERELLEAN_WHITECLAW:
			{
				m_say0 = 0;
				m_say1 = 1;
				m_npc_to_rescueGUID = guid;
				break;
			}
			case NPC_GERSHALA_NIGHTWHISPER:
			{
				m_say0 = 2;
				m_say1 = 3;
				m_npc_to_rescueGUID = guid;
				m_isFlying = true;
				break;
			}
			case NPC_SHALDYN:
			{
				m_say0 = 4;
				m_say1 = 5;
				m_npc_to_rescueGUID = guid;
				m_isFlying = true;
				break;
			}
			case NPC_VOLCOR:
			{
				m_say0 = 6;
				m_say1 = 7;
				m_npc_to_rescueGUID = guid;
				m_isRiding = true;
				break;
			}
			}
		}

		void DoAction(int32 param) override
		{
			switch (param)
			{
			case ACTION_START_RESCUE:
			{
				m_sentinelGUID = me->GetGUID();
				m_events.ScheduleEvent(EVENT_MOVE_RESCUE, 1000);
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
				case EVENT_MOVE_RESCUE:
				{
					Creature* mount = NULL;
					if (m_isFlying)
					{
						Position pos;
						me->GetPosition(&pos);
						pos.m_positionZ += 3.0f;
						if (mount = me->SummonCreature(NPC_FLYING_MOUNT, pos, TEMPSUMMON_TIMED_DESPAWN, 100000))
						{
							mount->setFaction(35);
							m_mountGUID = mount->GetGUID();
							me->EnterVehicle(mount);
						}
					}
					else if (m_isRiding)
					{
						Position pos;
						me->GetPosition(&pos);
						if (mount = me->SummonCreature(NPC_RIDING_MOUNT, pos, TEMPSUMMON_TIMED_DESPAWN, 100000))
						{
							mount->setFaction(35);
							m_mountGUID = mount->GetGUID();
							me->EnterVehicle(mount);
						}
					}
					else
						mount = me;

					if (Creature* npc = sObjectAccessor->GetCreature(*me, m_npc_to_rescueGUID))
						if (Player* player = sObjectAccessor->GetPlayer(*me, m_playerGUID))
						{
							float angle = npc->GetAngle(mount->GetPositionX(), mount->GetPositionY());
							Position pos;
							npc->GetNearPosition(pos, 2.0f, angle);
							if (m_isFlying)
								pos.m_positionZ += 2.0f;
							mount->GetMotionMaster()->MovePoint(MOVE_SENTINEL_TO_RESCUE, pos);
						}
					m_events.ScheduleEvent(EVENT_UNMOUNT_1, 4500);
					break;
				}
				case EVENT_UNMOUNT_1:
				{
					if (m_isFlying || m_isRiding)
						if (Creature* npc = sObjectAccessor->GetCreature(*me, m_mountGUID))
						{
							me->ExitVehicle();
							npc->DespawnOrUnsummon(250);
						}

					m_events.ScheduleEvent(EVENT_SAY_0, 500);
					break;
				}
				case EVENT_SAY_0:
				{
					Talk(m_say0);
					m_events.ScheduleEvent(EVENT_SAY_1, 5000);
					break;
				}
				case EVENT_SAY_1:
				{
					Talk(m_say1);
					m_events.ScheduleEvent(EVENT_DESPAWN_1, 5000);
					break;
				}
				case EVENT_DESPAWN_1:
				{
					me->DespawnOrUnsummon(500);
					break;
				}
				}
			}
		}
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_lordanel_sentinel_32969AI(creature);
	}
};


/// Shattertusk Structures - 33913
class npc_shattertusk_trigger : public CreatureScript
{
public:
	npc_shattertusk_trigger() : CreatureScript("npc_shattertusk_trigger") { }

	CreatureAI* GetAI(Creature* pCreature) const
	{
		return new npc_shattertusk_triggerAI(pCreature);
	}

	enum eMisc
	{
		SPELL_MOONSURGE = 63996,
		SPELL_MOONSURGE_KNOCKBACK = 64043,

		NPC_SHATTERSPER_STRUCTURES = 33913,
	};

	struct npc_shattertusk_triggerAI : public ScriptedAI
	{
		npc_shattertusk_triggerAI(Creature *c) : ScriptedAI(c) {}

		void SpellHit(Unit *caster, const SpellInfo *spell) override
		{
			if (spell->Id == SPELL_MOONSURGE)
			{
				if (me->HasAura(SPELL_MOONSURGE_KNOCKBACK))
					return;

				me->AddAura(SPELL_MOONSURGE_KNOCKBACK, me);
				TriggerList(me);

				if (caster->IsVehicle())
					if (Unit* player = caster->GetVehicleKit()->GetPassenger(0))
						player->ToPlayer()->KilledMonsterCredit(NPC_SHATTERSPER_STRUCTURES, 0);

			}
		}

		void TriggerList(Unit* me)
		{
			me->FindNearestCreature(NPC_SHATTERSPER_STRUCTURES, 20.0f);

			std::list<Creature*> pTriggerList;
			JadeCore::AllCreaturesOfEntryInRange checker(me, NPC_SHATTERSPER_STRUCTURES, 20.0f);
			JadeCore::CreatureListSearcher<JadeCore::AllCreaturesOfEntryInRange> searcher(me, pTriggerList, checker);
			me->VisitNearbyObject(20.0f, searcher);

			if (pTriggerList.empty())
				return;

			std::list<Creature*>::iterator itr = pTriggerList.begin();
			uint32 rnd = rand() % pTriggerList.size();

			for (uint32 i = 0; i < rnd; ++i)
				++itr;

			(*itr)->AddAura(SPELL_MOONSURGE_KNOCKBACK, (*itr));
		}
	};
};



/// Vengeful Protector - 43742
class npc_vengeful_protector_43742 : public CreatureScript
{
public:
	npc_vengeful_protector_43742() : CreatureScript("npc_vengeful_protector_43742") { }

	CreatureAI* GetAI(Creature* pCreature) const
	{
		return new npc_vengeful_protector_43742AI(pCreature);
	}
	
	enum eMisc
	{
		QUEST_ROCK_LOBSTER = 13514,
		SPELL_SUMMON_POSSESSED_PROTECTOR = 64602,
	};

	struct npc_vengeful_protector_43742AI : public ScriptedAI
	{
		npc_vengeful_protector_43742AI(Creature *c) : ScriptedAI(c) {}

		void OnSpellClick(Unit* clicker) override
		{
			// If clicker is player and has the quest and it's incomplete, summon the possessed vengeful protector.
			if (Player* player = clicker->ToPlayer())
			{
				if (player->GetQuestStatus(QUEST_ROCK_LOBSTER) == QUEST_STATUS_INCOMPLETE)
				{
					player->CastSpell(player, SPELL_SUMMON_POSSESSED_PROTECTOR, true);
				}
			}
		}
	};
};





/// Absorb Fire - 62430
class spell_absorb_fire_soothing_totem : public SpellScriptLoader
{
public:
	spell_absorb_fire_soothing_totem() : SpellScriptLoader("spell_absorb_fire_soothing_totem") { }

	class spell_absorb_fire_soothing_totem_SpellScript : public SpellScript
	{
		PrepareSpellScript(spell_absorb_fire_soothing_totem_SpellScript);

		enum Id
		{
			NPC_UNBOUND_FIRE_ELEMENTAL = 32999,
			SPELL_FIRE_ABSORB = 65348
		};

		SpellCastResult CheckCast()
		{
			if (Unit* caster = GetCaster())
			{
				if (Creature* unboundFireElemental = caster->FindNearestCreature(NPC_UNBOUND_FIRE_ELEMENTAL, 8.0f, false))
				{
					if (!unboundFireElemental->HasAura(SPELL_FIRE_ABSORB))
						return SPELL_FAILED_CANT_DO_THAT_RIGHT_NOW;
					else
					{
						unboundFireElemental->RemoveAurasDueToSpell(SPELL_FIRE_ABSORB);
						return SPELL_CAST_OK;
					}
				}
			}
			return SPELL_FAILED_CANT_DO_THAT_RIGHT_NOW;
		}

		void Register()
		{
			OnCheckCast += SpellCheckCastFn(spell_absorb_fire_soothing_totem_SpellScript::CheckCast);
		}
	};

	SpellScript* GetSpellScript() const
	{
		return new spell_absorb_fire_soothing_totem_SpellScript();
	}
};


/// Blessed Herb Bundle - 62092
class spell_blessed_herb_bundle_furbolg : public SpellScriptLoader
{
public:
	spell_blessed_herb_bundle_furbolg() : SpellScriptLoader("spell_blessed_herb_bundle_furbolg") { }

	class spell_blessed_herb_bundle_furbolg_SpellScript : public SpellScript
	{
		PrepareSpellScript(spell_blessed_herb_bundle_furbolg_SpellScript);

		enum Id
		{
			NPC_CORRUPTED_BLACKWOOD = 33044
		};

		SpellCastResult CheckCast()
		{
			if (Unit* caster = GetCaster())
			{
				if (Unit* target = GetExplTargetUnit())
				{
					if (target->GetTypeId() != TYPEID_PLAYER)
					{
						if (target->ToCreature()->GetEntry() == NPC_CORRUPTED_BLACKWOOD)
							return SPELL_CAST_OK;
					}
				}
			}
			return SPELL_FAILED_BAD_TARGETS;
		}

		void HandleSummonCorruption()
		{
			if (Unit* caster = GetCaster())
			{
				if (Unit* target = GetExplTargetUnit())
				{
					if (target->GetTypeId() != TYPEID_PLAYER)
					{
						if (target->ToCreature()->GetEntry() == NPC_CORRUPTED_BLACKWOOD)
							caster->Kill(target, false);
					}
				}
			}
		}

		void Register()
		{
			OnCheckCast += SpellCheckCastFn(spell_blessed_herb_bundle_furbolg_SpellScript::CheckCast);
			AfterCast += SpellCastFn(spell_blessed_herb_bundle_furbolg_SpellScript::HandleSummonCorruption);
		}
	};

	SpellScript* GetSpellScript() const
	{
		return new spell_blessed_herb_bundle_furbolg_SpellScript();
	}
};


/// Ping for Artifacts - 65300
class spell_ping_for_artifacts : public SpellScriptLoader
{
public:
	spell_ping_for_artifacts() : SpellScriptLoader("spell_ping_for_artifacts") { }

	enum Id
	{
		GO_AUBERDINE_MOONWELL = 174795,
	};

	class spell_ping_for_artifacts_SpellScript : public SpellScript
	{
		PrepareSpellScript(spell_ping_for_artifacts_SpellScript);

		SpellCastResult CheckCast()
		{
			if (GetCaster()->GetZoneId() == 148 && GetCaster()->GetAreaId() == 450)
				return SPELL_CAST_OK;
			return SPELL_FAILED_NOT_HERE;
		}

		void Register()
		{
			OnCheckCast += SpellCheckCastFn(spell_ping_for_artifacts_SpellScript::CheckCast);
		}
	};

	SpellScript* GetSpellScript() const
	{
		return new spell_ping_for_artifacts_SpellScript();
	}
};


/// Constructing - 65273
class spell_constructing : public SpellScriptLoader
{
public:
	spell_constructing() : SpellScriptLoader("spell_constructing") { }

	enum Id
	{
		SPELL_CONSTRUCTING = 65275
	};

	class spell_constructing_SpellScript : public SpellScript
	{
		PrepareSpellScript(spell_constructing_SpellScript);

		void HandleBuildHut()
		{
			if (Unit* caster = GetCaster())
			{
				if (caster->GetTypeId() != TYPEID_PLAYER)
					return;

				caster->CastSpell(caster, SPELL_CONSTRUCTING, false);
			}
			return;
		}

		void Register()
		{
			OnCast += SpellCastFn(spell_constructing_SpellScript::HandleBuildHut);
		}
	};

	SpellScript* GetSpellScript() const
	{
		return new spell_constructing_SpellScript();
	}
};

/// Constructing Spawning - 65275
class spell_constructing_spawning : public SpellScriptLoader
{
public:
	spell_constructing_spawning() : SpellScriptLoader("spell_constructing_spawning") { }

	enum Id
	{
		GO_GREYMIST_MURLOC_HUT_1 = 195044,
		GO_GREYMIST_MURLOC_HUT_2 = 195045,
		GO_MURLOC_BUILD_SITE = 195043
	};

	class spell_constructing_spawning_SpellScript : public SpellScript
	{
		PrepareSpellScript(spell_constructing_spawning_SpellScript);

		void HandleSpawnHut()
		{
			if (Unit* caster = GetCaster())
			{
				if (caster->GetTypeId() != TYPEID_PLAYER)
					return;

				GameObject* murlocHut1 = caster->FindNearestGameObject(GO_GREYMIST_MURLOC_HUT_1, 50.0f);
				GameObject* murlocHut2 = caster->FindNearestGameObject(GO_GREYMIST_MURLOC_HUT_2, 50.0f);

				if (murlocHut1)
					murlocHut1->RemoveFromWorld();

				for (int i = 0; i < 2; i++)
				{
					if (murlocHut2)
						murlocHut2->RemoveFromWorld();
				}

				if (GameObject* murlocSite = caster->FindNearestGameObject(GO_MURLOC_BUILD_SITE, 20.0f))
					murlocSite->SummonGameObject(GO_GREYMIST_MURLOC_HUT_1, 4690.67f, 695.279f, 1.15692f, 3.927f, 0, 0, 0, 0, 40);
			}
		}

		void Register()
		{
			OnCast += SpellCastFn(spell_constructing_spawning_SpellScript::HandleSpawnHut);
		}
	};

	SpellScript* GetSpellScript() const
	{
		return new spell_constructing_spawning_SpellScript();
	}
};


/// Frenzied Cyclone Braciers - 62081
class spell_frenzied_cyclone_braciers : public SpellScriptLoader
{
public:
	spell_frenzied_cyclone_braciers() : SpellScriptLoader("spell_frenzied_cyclone_braciers") { }

	enum Id
	{
		GO_AUBERDINE_MOONWELL = 174795,
	};

	class spell_frenzied_cyclone_braciers_SpellScript : public SpellScript
	{
		PrepareSpellScript(spell_frenzied_cyclone_braciers_SpellScript);

		SpellCastResult CheckCast()
		{
			GameObject* auberdineMoonwell = GetCaster()->FindNearestGameObject(GO_AUBERDINE_MOONWELL, 5.0f);
			if (auberdineMoonwell)
				return SPELL_CAST_OK;
			return SPELL_FAILED_NOT_HERE;
		}

		void Register()
		{
			OnCheckCast += SpellCheckCastFn(spell_frenzied_cyclone_braciers_SpellScript::CheckCast);
		}
	};

	SpellScript* GetSpellScript() const
	{
		return new spell_frenzied_cyclone_braciers_SpellScript();
	}
};

/// Elune Presence - 62517
class spell_elune_presence : public SpellScriptLoader
{
public:
	spell_elune_presence() : SpellScriptLoader("spell_elune_presence") { }

	enum Id
	{
		NPC_ENRAGED_TIDAL_SPIRIT = 32890
	};

	class spell_elune_presence_SpellScript : public SpellScript
	{
		PrepareSpellScript(spell_elune_presence_SpellScript);

		SpellCastResult CheckCast()
		{
			Creature* tidalSpirit = GetCaster()->FindNearestCreature(NPC_ENRAGED_TIDAL_SPIRIT, 1.0f, false);
			if (tidalSpirit)
			{
				tidalSpirit->DespawnOrUnsummon(6000);
				return SPELL_CAST_OK;
			}
			return SPELL_FAILED_NOT_HERE;
		}

		void Register()
		{
			OnCheckCast += SpellCheckCastFn(spell_elune_presence_SpellScript::CheckCast);
		}
	};

	SpellScript* GetSpellScript() const
	{
		return new spell_elune_presence_SpellScript();
	}
};


/// Torch Shatterspear Supplies - 62624
class spell_torch_shatterspear_supplies : public SpellScriptLoader
{
public:
	spell_torch_shatterspear_supplies() : SpellScriptLoader("spell_torch_shatterspear_supplies") { }

	enum Id
	{
		NPC_SUPPLIES_TRIGGER = 33056,
		SPELL_SHATTERSPEAR_BUFF = 62624
	};

	class spell_torch_shatterspear_supplies_SpellScript : public SpellScript
	{
		PrepareSpellScript(spell_torch_shatterspear_supplies_SpellScript);

		SpellCastResult CheckCast()
		{
			Creature* suppliesTrigger = GetCaster()->FindNearestCreature(NPC_SUPPLIES_TRIGGER, 5.0f);
			if (suppliesTrigger && !suppliesTrigger->HasAura(SPELL_SHATTERSPEAR_BUFF))
				return SPELL_CAST_OK;
			return SPELL_FAILED_NOT_HERE;
		}

		void HandleBurnSupplies()
		{
			if (Unit* caster = GetCaster())
			{
				if (caster->GetTypeId() != TYPEID_PLAYER)
					return;

				if (Creature* supplies = caster->FindNearestCreature(NPC_SUPPLIES_TRIGGER, 5.0f))
				{
					supplies->AddAura(SPELL_SHATTERSPEAR_BUFF, supplies);
					caster->ToPlayer()->KilledMonsterCredit(NPC_SUPPLIES_TRIGGER);
				}
			}
			return;
		}

		void Register()
		{
			OnCheckCast += SpellCheckCastFn(spell_torch_shatterspear_supplies_SpellScript::CheckCast);
			OnCast += SpellCastFn(spell_torch_shatterspear_supplies_SpellScript::HandleBurnSupplies);
		}
	};

	SpellScript* GetSpellScript() const
	{
		return new spell_torch_shatterspear_supplies_SpellScript();
	}
};

/// Disrupting the Artifact - 65207
class spell_disrupting_the_artifact : public SpellScriptLoader
{
public:
	spell_disrupting_the_artifact() : SpellScriptLoader("spell_disrupting_the_artifact") { }

	enum Id
	{
		GO_DEVOURING_ARTIFACT = 195057
	};

	class spell_disrupting_the_artifact_SpellScript : public SpellScript
	{
		PrepareSpellScript(spell_disrupting_the_artifact_SpellScript);

		SpellCastResult CheckCast()
		{
			if (GameObject* devouringArtifact = GetCaster()->FindNearestGameObject(GO_DEVOURING_ARTIFACT, 50.0f))
				return SPELL_CAST_OK;
			return SPELL_FAILED_NOT_HERE;
		}

		void Register()
		{
			OnCheckCast += SpellCheckCastFn(spell_disrupting_the_artifact_SpellScript::CheckCast);
		}
	};

	SpellScript* GetSpellScript() const
	{
		return new spell_disrupting_the_artifact_SpellScript();
	}
};


/// Petrified Root - 64306
class spell_petrified_root : public SpellScriptLoader
{
public:
	spell_petrified_root() : SpellScriptLoader("spell_petrified_root") { }

	enum Id
	{
		NPC_DARKSCALE_SCOUT = 33206,
		QUEST_CREDIT_ENT = 34010
	};

	class spell_petrified_root_SpellScript : public SpellScript
	{
		PrepareSpellScript(spell_petrified_root_SpellScript);

		SpellCastResult CheckCast()
		{
			Creature* darkscaleScout = GetCaster()->FindNearestCreature(NPC_DARKSCALE_SCOUT, 0.5f, false);
			if (darkscaleScout)
				return SPELL_CAST_OK;
			return SPELL_FAILED_NOT_HERE;
		}

		void HandleSummonEnt(SpellEffIndex effIndex)
		{
			if (Unit* caster = GetCaster())
			{
				if (caster->GetTypeId() != TYPEID_PLAYER)
					return;

				if (Creature* darkscaleScout = GetCaster()->FindNearestCreature(NPC_DARKSCALE_SCOUT, 0.5f, false))
				{
					caster->ToPlayer()->KilledMonsterCredit(QUEST_CREDIT_ENT);
					darkscaleScout->DespawnOrUnsummon(1);
				}
			}
		}

		void Register()
		{
			OnCheckCast += SpellCheckCastFn(spell_petrified_root_SpellScript::CheckCast);
			OnEffectHit += SpellEffectFn(spell_petrified_root_SpellScript::HandleSummonEnt, EFFECT_0, SPELL_EFFECT_DUMMY);
		}
	};

	SpellScript* GetSpellScript() const
	{
		return new spell_petrified_root_SpellScript();
	}
};


/// Shattershield Arrow - 64550
class spell_shattershield_arrow : public SpellScriptLoader
{
public:
	spell_shattershield_arrow() : SpellScriptLoader("spell_shattershield_arrow") { }

	enum Id
	{
		NPC_JORKIL_THE_SOULRIPPER = 32862,
		SPELL_AEGIS_OF_THE_SHATTERSPEAR = 64549
	};

	class spell_shattershield_arrow_SpellScript : public SpellScript
	{
		PrepareSpellScript(spell_shattershield_arrow_SpellScript);

		void HandleRemover(SpellEffIndex effIndex)
		{
			if (!GetCaster())
				return;

			if (Unit* target = GetCaster()->FindNearestCreature(NPC_JORKIL_THE_SOULRIPPER, 100.0f, true))
			{
				target->Attack(GetCaster(), true);
				target->RemoveAurasDueToSpell(SPELL_AEGIS_OF_THE_SHATTERSPEAR);
			}
		}

		void Register()
		{
			OnEffectHitTarget += SpellEffectFn(spell_shattershield_arrow_SpellScript::HandleRemover, EFFECT_0, SPELL_EFFECT_DUMMY);
		}
	};

	SpellScript* GetSpellScript() const
	{
		return new spell_shattershield_arrow_SpellScript();
	}
};


/// Horn of the Ancients - 80230
class spell_horn_of_the_ancients : public SpellScriptLoader
{
public:
	spell_horn_of_the_ancients() : SpellScriptLoader("spell_horn_of_the_ancients") { }

	enum Id
	{
		/// Zone IDs
		ID_AREA_MASTER_GLAIVE = 449,
		ID_ZONE_DARKSHORE = 148,

		/// Npcs
		NPC_AWAKENED_ANCIENT = 34486,
		NPC_AVATAR_OF_SOGGOTH = 34485
	};

	class spell_horn_of_the_ancients_SpellScript : public SpellScript
	{
		PrepareSpellScript(spell_horn_of_the_ancients_SpellScript);

		SpellCastResult CheckCast()
		{
			if (GetCaster()->GetZoneId() == ID_ZONE_DARKSHORE && GetCaster()->GetAreaId() == ID_AREA_MASTER_GLAIVE)
				return SPELL_CAST_OK;
			return SPELL_FAILED_NOT_HERE;
		}

		void HandleSpawns()
		{
			if (Unit* caster = GetCaster())
			{
				caster->SummonCreature(NPC_AWAKENED_ANCIENT, caster->GetPositionX(), caster->GetPositionY() + 4, caster->GetPositionZ(), caster->GetOrientation(), TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 30);
				caster->SummonCreature(NPC_AWAKENED_ANCIENT, caster->GetPositionX(), caster->GetPositionY() + 6, caster->GetPositionZ(), caster->GetOrientation(), TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 30);
				caster->SummonCreature(NPC_AWAKENED_ANCIENT, caster->GetPositionX(), caster->GetPositionY() - 4, caster->GetPositionZ(), caster->GetOrientation(), TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 30);
				caster->SummonCreature(NPC_AWAKENED_ANCIENT, caster->GetPositionX(), caster->GetPositionY() - 6, caster->GetPositionZ(), caster->GetOrientation(), TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 30);
				caster->SummonCreature(NPC_AVATAR_OF_SOGGOTH, caster->GetPositionX() + 6, caster->GetPositionY(), caster->GetPositionZ(), caster->GetOrientation(), TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 30);
			}
		}

		void Register()
		{
			OnCheckCast += SpellCheckCastFn(spell_horn_of_the_ancients_SpellScript::CheckCast);
			AfterCast += SpellCastFn(spell_horn_of_the_ancients_SpellScript::HandleSpawns);
		}
	};

	SpellScript* GetSpellScript() const
	{
		return new spell_horn_of_the_ancients_SpellScript();
	}
};



#ifndef __clang_analyzer__
void AddSC_darkshore()
{
	/// Npcs
    new npc_darkscale_priestess();

	/// --- The Last Wave of Survivors
	new npc_gershala_nightwhisper_32911();
	new npc_cerellean_whiteclaw_33093();
	new npc_volcor_33094();
	new npc_shaldyn_33095();
	new npc_lordanel_sentinel_32969();

	/// --- The Ancients' Ire
	new npc_vengeful_protector_43742();
	new npc_shattertusk_trigger();


	/// Spells
	new spell_absorb_fire_soothing_totem();
	new spell_blessed_herb_bundle_furbolg();
	new spell_ping_for_artifacts();
	new spell_constructing();
	new spell_constructing_spawning();
	new spell_frenzied_cyclone_braciers();
	new spell_elune_presence();
	new spell_torch_shatterspear_supplies();
	new spell_disrupting_the_artifact();
	new spell_petrified_root();
	new spell_shattershield_arrow();
	new spell_horn_of_the_ancients();
}
#endif
