/*
* Copyright (C) 2019-2019 AtonementProject <https://github.com/Atonement-6.2.3/>
*
* This program is free software; you can redistribute it and/or modify it
* under the terms of the GNU General Public License as published by the
* Free Software Foundation; either version 2 of the License, or (at your
* option) any later version.
*
* This program is distributed in the hope that it will be useful, but WITHOUT
* ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
* FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
* more details.
*
* You should have received a copy of the GNU General Public License along
* with this program. If not, see <http://www.gnu.org/licenses/>.
*/

#include "AreaTrigger.h"
#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "ScriptedGossip.h"
#include "SpellAuras.h"
#include "SpellAuraEffects.h"
#include "SpellScript.h"
#include "MapManager.h"
#include "MotionMaster.h"
#include "Player.h"
#include "PhaseMgr.h"
#include "Unit.h"
#include "Vehicle.h"
#include "ZoneScript.h"
#include "Tanaan_jungle_100.h"
#include "Common.h"
#include "GuardAI.h"

/*
181065 - See shadowraiders
181066 - See shadowraiders
180809 Cosmetic - Orc Male Carrying Iron Horde Crate 01
180808 Cosmetic - Orc Male Carrying Iron Horde Crate 01

162368 -> Cosmetic Added currency orcs in garrison

160886 - missile sound

180044 Conversation - Mutumba Attracts Player
180049 Conversation - Mutumba At Hub
180051 Summon Mutumba To Run To Hub

*/
/// Tanaan Jungle Map - 1464
class map_tanaan_jungle_100 : public WorldMapScript
{
public:
	map_tanaan_jungle_100() : WorldMapScript("map_tanaan_jungle_100", Tanaan100Zones::MapTanaanJungle100Hub) { }

	void OnPlayerEnter(Map* p_Map, Player* p_Player) override
	{ 
		p_Map->SetObjectVisibility(300.0f); 
	}
};

// Passive Scene Object
class playerScript_map_shift_100 : public PlayerScript
{
public:
	playerScript_map_shift_100() : PlayerScript("playerScript_map_shift_100") { }

	std::map<uint64, uint32> m_PlayerSceneFirstInstanceId;

	void OnQuestComplete(Player* p_Player, const Quest* p_Quest) override
	{
		if ((p_Player && p_Quest && p_Quest->GetQuestId() == Tanaan100Quests::TheAssaultBaseHorde) || (p_Player && p_Quest && p_Quest->GetQuestId() == Tanaan100Quests::TheAssaultBaseAlly))
		{
			if (m_PlayerSceneFirstInstanceId.find(p_Player->GetGUID()) != m_PlayerSceneFirstInstanceId.end())
				p_Player->CancelStandaloneScene(m_PlayerSceneFirstInstanceId[p_Player->GetGUID()]);
		}
	}

	void OnSceneCancel(Player* p_Player, uint32 p_sceneInstanceId) override
	{
		if (p_sceneInstanceId == m_PlayerSceneFirstInstanceId[p_Player->GetGUID()])
		{
			p_Player->TeleportTo(1464, 4276.0381f, -1483.7352f, 80.2444f, 3.046f);

			std::set<uint32> l_PhaseId, l_Terrainswap, l_InactiveTerrainSwap;
			l_Terrainswap.insert((uint32)Tanaan100Zones::MapTanaanJungle100Hub);
			l_InactiveTerrainSwap.insert((uint32)Tanaan100Zones::MapTanaanJungle100Hub);
			p_Player->GetSession()->SendSetPhaseShift(l_PhaseId, l_Terrainswap, l_InactiveTerrainSwap);
		}
	}

	void OnQuestAbandon(Player* p_Player, const Quest* p_Quest) override
	{
		if ((p_Player && p_Quest && p_Quest->GetQuestId() == Tanaan100Quests::TheAssaultBaseHorde) || (p_Player && p_Quest && p_Quest->GetQuestId() == Tanaan100Quests::TheAssaultBaseAlly))
		{
			if (m_PlayerSceneFirstInstanceId.find(p_Player->GetGUID()) != m_PlayerSceneFirstInstanceId.end())
				p_Player->CancelStandaloneScene(m_PlayerSceneFirstInstanceId[p_Player->GetGUID()]);
		}
	}

	void OnSceneTriggerEvent(Player* p_Player, uint32 p_SceneInstanceID, std::string p_Event) override
	{
		bool l_HasFirstScript = std::count_if(m_PlayerSceneFirstInstanceId.begin(), m_PlayerSceneFirstInstanceId.end(), [p_SceneInstanceID](const std::pair<uint64, uint32> &p_Pair) -> bool
		{
			return p_Pair.second == p_SceneInstanceID;
		});

		if (l_HasFirstScript)
		{
			Position l_Pos;
			p_Player->GetPosition(&l_Pos);

			if (p_Event == "Phase")
			{
				p_Player->TeleportTo(1464, 4276.0381f, -1483.7352f, 80.2444f, 3.046f);

				std::set<uint32> l_PhaseId, l_Terrainswap, l_InactiveTerrainSwap;
				l_Terrainswap.insert((uint32)Tanaan100Zones::MapTanaanJungle100Hub);
				l_InactiveTerrainSwap.insert((uint32)Tanaan100Zones::MapTanaanJungle100Hub);
				p_Player->GetSession()->SendSetPhaseShift(l_PhaseId, l_Terrainswap, l_InactiveTerrainSwap);
			}
		}
	}
};
playerScript_map_shift_100* g_MapShiftPlayerScript = nullptr;

/// Passive Scene Object
class playerScript_quests_custom_gestion_100 : public PlayerScript
{
public:
	playerScript_quests_custom_gestion_100() : PlayerScript("playerScript_quests_custom_gestion_100") { }

	void OnQuestComplete(Player* p_Player, Quest const* p_Quest, const uint32 diff)
	{
		if (p_Quest->GetQuestId() == Tanaan100Quests::TheAssaultBaseHorde)
		{
			p_Player->PlayScene(Tanaan100SceneObjects::SceneHordeHub, p_Player);

			p_Player->TeleportTo(1464, 4285.3145f, -1482.4917f, 79.9617f, 2.0f, 0);

			std::set<uint32> l_PhaseId, l_Terrainswap, l_InactiveTerrainSwap;
			l_Terrainswap.insert((uint32)Tanaan100Zones::MapTanaanJungle100Hub);
			l_InactiveTerrainSwap.insert((uint32)Tanaan100Zones::MapTanaanJungle100Hub);
			p_Player->GetSession()->SendSetPhaseShift(l_PhaseId, l_Terrainswap, l_InactiveTerrainSwap);

		}
		else if (p_Quest->GetQuestId() == Tanaan100Quests::TheAssaultBaseAlly)
		{
			p_Player->PlayScene(Tanaan100SceneObjects::SceneAllyHub, p_Player);
		}
	}
};

/// 998030 - Alliance Banner
class gob_alliance_banner : public GameObjectScript
{
public:
	gob_alliance_banner() : GameObjectScript("gob_alliance_banner") { }

	bool OnGossipHello(Player* p_Player, GameObject* p_GameObject) override
	{
		if (p_Player->GetQuestStatus(Tanaan100Quests::TheAssaultBaseAlly) == QUEST_STATUS_INCOMPLETE && p_Player->GetQuestObjectiveCounter(Tanaan100QuestObjectives::ObjFlagBaseAlly) < 1)
		{
			uint32 l_PhaseMask = p_Player->GetPhaseMask();
			l_PhaseMask &= ~Tanaan100Phases::PhaseBase;
			p_Player->SetPhaseMask(l_PhaseMask, true);

			p_Player->QuestObjectiveSatisfy(Tanaan100KillCredits::CreditFlagBase, 1, QUEST_OBJECTIVE_TYPE_NPC, p_Player->GetGUID());
			p_Player->CastSpell(p_Player, 189584, false); // Fade out and hub creation
			p_Player->PlayScene(Tanaan100SceneObjects::SceneAllyHub, p_Player);
			p_Player->SetPhaseMask(l_PhaseMask, true);
		}

		return true;
	}
};

/// 998031 - Horde Banner
class gob_horde_banner : public GameObjectScript
{
	public:
		gob_horde_banner() : GameObjectScript("gob_horde_banner") { }

		bool OnGossipHello(Player* p_Player, GameObject* p_GameObject) override
		{
			if (p_Player->GetQuestStatus(Tanaan100Quests::TheAssaultBaseHorde) == QUEST_STATUS_INCOMPLETE)
			{
				p_Player->QuestObjectiveSatisfy(Tanaan100QuestObjectives::ObjFlagBaseHorde, 1, QUEST_OBJECTIVE_TYPE_NPC, p_Player->GetGUID());
			}

			return true;
		}
};

// Shadow Hunter Mutumba - 90238
class npc_shadow_hunter_mutumba : public CreatureScript
{
public:
	npc_shadow_hunter_mutumba() : CreatureScript("npc_shadow_hunter_mutumba") {}

	enum eTalks
	{
		Talk1 = 0,
		Talk2 = 1
	};

	enum eActions
	{
		StartQuest = 1
	};

	enum eData
	{
		MountID = 14584
	};

	enum eMoves
	{
		StartQuestMove = 0
	};

	bool OnQuestAccept(Player* p_Player, Creature* p_Creature, Quest const* p_Quest) override
	{
		if (p_Quest->GetQuestId() == Tanaan100Quests::TheAssaultBaseHorde)
		{
			Position l_Pos;
			p_Creature->GetPosition(&l_Pos);

			if (Creature* l_Creature = p_Player->SummonCreature(Tanaan100Creatures::NpcMutumba, l_Pos))
			{
				l_Creature->GetAI()->DoAction(eActions::StartQuest);
			}

			uint32 l_PhaseMask = p_Player->GetPhaseMask();
			l_PhaseMask &= ~Tanaan100Phases::PhaseNoHub;
			p_Player->SetPhaseMask(l_PhaseMask, true);

			std::set<uint32> l_PhaseId, l_Terrainswap, l_InactiveTerrainSwap;
			l_Terrainswap.insert((uint32)Tanaan100Zones::MapTanaanJungle100NoHubs);
			l_InactiveTerrainSwap.insert((uint32)Tanaan100Zones::MapTanaanJungle100NoHubs);
			p_Player->GetSession()->SendSetPhaseShift(l_PhaseId, l_Terrainswap, l_InactiveTerrainSwap);

			p_Creature->AddAura(178606, p_Creature); // Invisibility towards the player
		}

		return true;
	}

	struct npc_shadow_hunter_mutumbaAI : public ScriptedAI
	{
		npc_shadow_hunter_mutumbaAI(Creature* creature) : ScriptedAI(creature)
		{
			m_PlayerGuid = 0;
		}

		EventMap m_Events;
		uint64 m_PlayerGuid;

		void Reset() override
		{
			me->SetFlag(UNIT_FIELD_NPC_FLAGS, UNIT_NPC_FLAG_QUESTGIVER);
			me->AddAura(188439, me); // Stealth

			m_Events.Reset();

			ClearDelayedOperations();
		}

		void IsSummonedBy(Unit* p_Summoner) override
		{
			m_PlayerGuid = p_Summoner->GetGUID();
		}

		void DoAction(int32 const p_Action) override
		{
			switch (p_Action)
			{
				case eActions::StartQuest:
				{
					me->SetSpeed(UnitMoveType::MOVE_RUN, 1.8f, true);
					me->RemoveFlag(UNIT_FIELD_NPC_FLAGS, UNIT_NPC_FLAG_QUESTGIVER);
					me->RemoveFlag(UNIT_FIELD_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP);
					me->RemoveAura(188439); // Remove Stealth

					AddTimedDelayedOperation(0.3 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->Mount(14344); // Mount up
						Talk(eTalks::Talk1);
					});

					AddTimedDelayedOperation(1.5 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->GetMotionMaster()->MoveSmoothPath(eMoves::StartQuestMove, g_MutumbaMoves.data(), g_MutumbaMoves.size(), false);
					});

					AddTimedDelayedOperation(21.5 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->Dismount();
					});

					AddTimedDelayedOperation(22 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						if (m_PlayerGuid)
						{
							if (Player* l_Player = me->GetPlayer(*me, m_PlayerGuid))
							{
								me->SetFacingToObject(l_Player);
								me->SummonGameObject(998031, 4288.4673f, -1486.1240f, 79.9857f, 2.269098f, 0.0f, 0.0f, 0.0f, 0.0f, 0); // Summon banner
							}
						}
					});

					AddTimedDelayedOperation(23 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						if (m_PlayerGuid)
						{
							if (Player* l_Player = me->GetPlayer(*me, m_PlayerGuid))
							{
								Talk(eTalks::Talk2);

								if (l_Player->HasQuest(Tanaan100Quests::TheAssaultBaseHorde))
									l_Player->QuestObjectiveSatisfy(Tanaan100KillCredits::CreditFollowMatumba, 1, QUEST_OBJECTIVE_TYPE_NPC, l_Player->GetGUID());
							}
						}
					});

					AddTimedDelayedOperation(40 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->DespawnOrUnsummon();
					});

					break;
				}
				default:
					break;
			}
		}

		void UpdateAI(uint32 const p_Diff) override
		{
			UpdateOperations(p_Diff);

			m_Events.Update(p_Diff);

			switch (m_Events.ExecuteEvent())
			{
			}
		}
	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_shadow_hunter_mutumbaAI(creature);
	}
};

// Draka (Hud) - 90481
class npc_draka_hud : public CreatureScript
{
public:
	npc_draka_hud() : CreatureScript("npc_draka_hud") {}

	enum eTalks
	{
		Talk1 = 0
	};

	enum eActions
	{
		FinishQuest		= 0,
		PreFinishQuest  = 1
	};

	enum eMoves
	{
		FinishQuestMove		= 0,
		PreFinishQuestMove  = 1
	};

	enum eEvents
	{
		EventCheckPlayer1 = 0,
		EventCheckPlayer2 = 1,
	};

	struct npc_draka_hudAI : public ScriptedAI
	{
		npc_draka_hudAI(Creature* creature) : ScriptedAI(creature)
		{
			m_PlayerGuid = 0;
			m_FinishQuest = false;
			m_PreFinishQuest = false;
		}

		bool m_FinishQuest;
		bool m_PreFinishQuest;

		EventMap m_CosmeticEvents;
		EventMap m_Events;
		uint64 m_PlayerGuid;

		void Reset() override
		{
			me->SetFlag(UNIT_FIELD_NPC_FLAGS, UNIT_NPC_FLAG_QUESTGIVER);
			me->SetFlag(UNIT_FIELD_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP);

			m_Events.Reset();
			ClearDelayedOperations();

			m_CosmeticEvents.ScheduleEvent(eEvents::EventCheckPlayer1, 0.5 * TimeConstants::IN_MILLISECONDS);
			m_CosmeticEvents.ScheduleEvent(eEvents::EventCheckPlayer2, 0.5 * TimeConstants::IN_MILLISECONDS);
		}

		void DoAction(int32 const p_Action) override
		{
			switch (p_Action)
			{
				case eActions::FinishQuest:
				{
					if (m_FinishQuest)
						return;

					m_FinishQuest = true;

					me->RemoveFlag(UNIT_FIELD_NPC_FLAGS, UNIT_NPC_FLAG_QUESTGIVER);
					me->RemoveFlag(UNIT_FIELD_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP);

					m_CosmeticEvents.CancelEvent(eEvents::EventCheckPlayer1);

					AddTimedDelayedOperation(0.3 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						Talk(eTalks::Talk1);
						me->HandleEmoteCommand(113);
					});

					AddTimedDelayedOperation(1.5 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->GetMotionMaster()->MoveSmoothPath(eMoves::FinishQuestMove, g_DrakaMoves1.data(), g_DrakaMoves1.size(), true);
					});

					AddTimedDelayedOperation(4 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->SetFacingTo(1.738828f);
						me->SetFlag(UNIT_FIELD_NPC_FLAGS, UNIT_NPC_FLAG_QUESTGIVER);
						me->SetFlag(UNIT_FIELD_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP);
						me->GetHomePosition();
					});

					AddTimedDelayedOperation(40 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						m_CosmeticEvents.ScheduleEvent(eEvents::EventCheckPlayer1, 0.5 * TimeConstants::IN_MILLISECONDS);
						m_FinishQuest = false;
					});
				break;
				}

				case eActions::PreFinishQuest:
				{
					if (m_PreFinishQuest)
						return;

					m_PreFinishQuest = true;

					m_CosmeticEvents.CancelEvent(eEvents::EventCheckPlayer2);

					AddTimedDelayedOperation(0 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->GetMotionMaster()->MoveSmoothPath(eMoves::PreFinishQuestMove, g_DrakaMoves2.data(), g_DrakaMoves2.size(), true);
					});

					AddTimedDelayedOperation(2.5 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->SetFacingTo(1.738828f);
					});

					AddTimedDelayedOperation(35 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						m_CosmeticEvents.ScheduleEvent(eEvents::EventCheckPlayer2, 0.5 * TimeConstants::IN_MILLISECONDS);
						m_PreFinishQuest = false;
					});
				break;
				}
			default:
				break;
			}
		}

		void UpdateAI(uint32 const p_Diff) override
		{
			UpdateOperations(p_Diff);

			m_Events.Update(p_Diff);

			m_CosmeticEvents.Update(p_Diff);

			switch (m_Events.ExecuteEvent())
			{
			}

			switch (m_CosmeticEvents.ExecuteEvent())
			{
				case eEvents::EventCheckPlayer1:
				{
					std::list<Player*> PlayersInRange;
					me->GetPlayerListInGrid(PlayersInRange, 10.0f);
					for (Player* p_Player : PlayersInRange)

					if (p_Player->GetQuestStatus(Tanaan100Quests::TheAssaultBaseHorde) == QUEST_STATUS_COMPLETE)
					{
						DoAction(eActions::FinishQuest);
					}
				}

				case eEvents::EventCheckPlayer2:
				{
					std::list<Player*> PlayersInRange;
					me->GetPlayerListInGrid(PlayersInRange, 60.0f);
					for (Player* p_Player : PlayersInRange)

					if (p_Player->GetQuestStatus(Tanaan100Quests::TheAssaultBaseHorde) == QUEST_STATUS_COMPLETE)
					{
						DoAction(eActions::PreFinishQuest);
					}
				}
			}
		}
	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_draka_hudAI(creature);
	}
};

// Vol'mar Shadow Hunter
class npc_volmar_shadow_hunter : public CreatureScript
{
public:
	npc_volmar_shadow_hunter() : CreatureScript("npc_volmar_shadow_hunter") { }

	enum eMoves
	{
		SH1 = 0,
		SH2 = 1,
		SH3 = 2
	};

	struct npc_volmar_shadow_hunterAI : public GuardAI
	{
		npc_volmar_shadow_hunterAI(Creature* creature) : GuardAI(creature) {}

		void Reset()
		{
			if (me->GetGUID() == 11659371)
				me->GetMotionMaster()->MoveSmoothPath(eMoves::SH1, g_MSHMoves1.data(), g_MSHMoves1.size(), true);

			if (me->GetGUID() == 11659367)
				me->GetMotionMaster()->MoveSmoothPath(eMoves::SH2, g_MSHMoves2.data(), g_MSHMoves2.size(), true);

			globalCooldown = 0;
			buffTimer = 0;
		}

		void EnterCombat(Unit* who)
		{
		}

		void UpdateAI(const uint32 diff)
		{
			//Always decrease our global cooldown first
			if (globalCooldown > diff)
				globalCooldown -= diff;
			else
				globalCooldown = 0;

			//Buff timer (only buff when we are alive and not in combat
			if (me->isAlive() && !me->isInCombat())
			{
				if (buffTimer <= diff)
				{
					//Find a spell that targets friendly and applies an aura (these are generally buffs)
					SpellInfo const* info = SelectSpell(me, 0, 0, SELECT_TARGET_ANY_FRIEND, 0, 0, 0, 0, SELECT_EFFECT_AURA);

					if (info && !globalCooldown)
					{
						//Cast the buff spell
						DoCast(me, info->Id);

						//Set our global cooldown
						globalCooldown = 5000;

						//Set our timer to 10 minutes before rebuff
						buffTimer = 600000;
					}                                                   //Try again in 30 seconds
					else buffTimer = 30000;
				}
				else buffTimer -= diff;
			}

			//Return since we have no target
			if (!UpdateVictim())
				return;

			// Make sure our attack is ready and we aren't currently casting
			if (me->isAttackReady() && !me->IsNonMeleeSpellCasted(false) && me->getVictim())
			{
				//If we are within range melee the target
				if (me->IsWithinMeleeRange(me->getVictim()))
				{
					bool healing = false;
					SpellInfo const* info = NULL;

					//Select a healing spell if less than 30% hp
					if (me->HealthBelowPct(30))
						info = SelectSpell(me, 0, 0, SELECT_TARGET_ANY_FRIEND, 0, 0, 0, 0, SELECT_EFFECT_HEALING);

					//No healing spell available, select a hostile spell
					if (info)
						healing = true;
					else
						info = SelectSpell(me->getVictim(), 0, 0, SELECT_TARGET_ANY_ENEMY, 0, 0, 0, 0, SELECT_EFFECT_DONTCARE);

					//20% chance to replace our white hit with a spell
					if (info && urand(0, 99) < 20 && !globalCooldown)
					{
						//Cast the spell
						if (healing)
							DoCast(me, info->Id);
						else
							DoCast(me->getVictim(), info->Id);

						//Set our global cooldown
						globalCooldown = 5000;
					}
					else
						me->AttackerStateUpdate(me->getVictim());

					me->resetAttackTimer();
				}
			}
			else if (me->getVictim())
			{
				//Only run this code if we aren't already casting
				if (!me->IsNonMeleeSpellCasted(false))
				{
					bool healing = false;
					SpellInfo const* info = NULL;

					//Select a healing spell if less than 30% hp ONLY 33% of the time
					if (me->HealthBelowPct(30) && 33 > urand(0, 99))
						info = SelectSpell(me, 0, 0, SELECT_TARGET_ANY_FRIEND, 0, 0, 0, 0, SELECT_EFFECT_HEALING);

					//No healing spell available, See if we can cast a ranged spell (Range must be greater than ATTACK_DISTANCE)
					if (info)
						healing = true;
					else
						info = SelectSpell(me->getVictim(), 0, 0, SELECT_TARGET_ANY_ENEMY, 0, 0, NOMINAL_MELEE_RANGE, 0, SELECT_EFFECT_DONTCARE);

					//Found a spell, check if we arn't on cooldown
					if (info && !globalCooldown)
					{
						//If we are currently moving stop us and set the movement generator
						if (me->GetMotionMaster()->GetCurrentMovementGeneratorType() != IDLE_MOTION_TYPE)
						{
							me->GetMotionMaster()->Clear(false);
							me->GetMotionMaster()->MoveIdle();
						}

						//Cast spell
						if (healing)
							DoCast(me, info->Id);
						else
							DoCast(me->getVictim(), info->Id);

						//Set our global cooldown
						globalCooldown = 5000;
					}                                               //If no spells available and we arn't moving run to target
					else if (me->GetMotionMaster()->GetCurrentMovementGeneratorType() != CHASE_MOTION_TYPE)
					{
						//Cancel our current spell and then mutate new movement generator
						me->InterruptNonMeleeSpells(false);
						me->GetMotionMaster()->Clear(false);
						me->GetMotionMaster()->MoveChase(me->getVictim());
					}
				}
			}

			DoMeleeAttackIfReady();
		}

		void DoReplyToTextEmote(uint32 emote)
		{
			switch (emote)
			{
				case TEXT_EMOTE_WAVE:
					me->HandleEmoteCommand(EMOTE_ONESHOT_WAVE);
					break;

				case TEXT_EMOTE_SALUTE:
					me->HandleEmoteCommand(EMOTE_ONESHOT_SALUTE);
					break;
			}
		}

		void ReceiveEmote(Player* player, uint32 textEmote)
		{
			switch (me->GetEntry())
			{
				case Tanaan100Creatures::NpcVolmarShadowHunter:
					break;
			default:
				return;
			}

			if (!me->IsFriendlyTo(player))
				return;

			DoReplyToTextEmote(textEmote);
		}

	private:
		uint32 globalCooldown;
		uint32 buffTimer;
	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_volmar_shadow_hunterAI(creature);
	}
};

// Vol'mar Grunt
class npc_volmar_grunt : public CreatureScript
{
public:
	npc_volmar_grunt() : CreatureScript("npc_volmar_grunt") { }

	struct npc_volmar_gruntAI : public GuardAI
	{
		npc_volmar_gruntAI(Creature* creature) : GuardAI(creature) {}

		void Reset()
		{
			globalCooldown = 0;
			buffTimer = 0;
		}

		void EnterCombat(Unit* who)
		{
		}

		void UpdateAI(const uint32 diff)
		{
			//Always decrease our global cooldown first
			if (globalCooldown > diff)
				globalCooldown -= diff;
			else
				globalCooldown = 0;

			//Buff timer (only buff when we are alive and not in combat
			if (me->isAlive() && !me->isInCombat())
			{
				if (buffTimer <= diff)
				{
					//Find a spell that targets friendly and applies an aura (these are generally buffs)
					SpellInfo const* info = SelectSpell(me, 0, 0, SELECT_TARGET_ANY_FRIEND, 0, 0, 0, 0, SELECT_EFFECT_AURA);

					if (info && !globalCooldown)
					{
						//Cast the buff spell
						DoCast(me, info->Id);

						//Set our global cooldown
						globalCooldown = 5000;

						//Set our timer to 10 minutes before rebuff
						buffTimer = 600000;
					}                                                   //Try again in 30 seconds
					else buffTimer = 30000;
				}
				else buffTimer -= diff;
			}

			//Return since we have no target
			if (!UpdateVictim())
				return;

			// Make sure our attack is ready and we aren't currently casting
			if (me->isAttackReady() && !me->IsNonMeleeSpellCasted(false) && me->getVictim())
			{
				//If we are within range melee the target
				if (me->IsWithinMeleeRange(me->getVictim()))
				{
					bool healing = false;
					SpellInfo const* info = NULL;

					//Select a healing spell if less than 30% hp
					if (me->HealthBelowPct(30))
						info = SelectSpell(me, 0, 0, SELECT_TARGET_ANY_FRIEND, 0, 0, 0, 0, SELECT_EFFECT_HEALING);

					//No healing spell available, select a hostile spell
					if (info)
						healing = true;
					else
						info = SelectSpell(me->getVictim(), 0, 0, SELECT_TARGET_ANY_ENEMY, 0, 0, 0, 0, SELECT_EFFECT_DONTCARE);

					//20% chance to replace our white hit with a spell
					if (info && urand(0, 99) < 20 && !globalCooldown)
					{
						//Cast the spell
						if (healing)
							DoCast(me, info->Id);
						else
							DoCast(me->getVictim(), info->Id);

						//Set our global cooldown
						globalCooldown = 5000;
					}
					else
						me->AttackerStateUpdate(me->getVictim());

					me->resetAttackTimer();
				}
			}
			else if (me->getVictim())
			{
				//Only run this code if we aren't already casting
				if (!me->IsNonMeleeSpellCasted(false))
				{
					bool healing = false;
					SpellInfo const* info = NULL;

					//Select a healing spell if less than 30% hp ONLY 33% of the time
					if (me->HealthBelowPct(30) && 33 > urand(0, 99))
						info = SelectSpell(me, 0, 0, SELECT_TARGET_ANY_FRIEND, 0, 0, 0, 0, SELECT_EFFECT_HEALING);

					//No healing spell available, See if we can cast a ranged spell (Range must be greater than ATTACK_DISTANCE)
					if (info)
						healing = true;
					else
						info = SelectSpell(me->getVictim(), 0, 0, SELECT_TARGET_ANY_ENEMY, 0, 0, NOMINAL_MELEE_RANGE, 0, SELECT_EFFECT_DONTCARE);

					//Found a spell, check if we arn't on cooldown
					if (info && !globalCooldown)
					{
						//If we are currently moving stop us and set the movement generator
						if (me->GetMotionMaster()->GetCurrentMovementGeneratorType() != IDLE_MOTION_TYPE)
						{
							me->GetMotionMaster()->Clear(false);
							me->GetMotionMaster()->MoveIdle();
						}

						//Cast spell
						if (healing)
							DoCast(me, info->Id);
						else
							DoCast(me->getVictim(), info->Id);

						//Set our global cooldown
						globalCooldown = 5000;
					}                                               //If no spells available and we arn't moving run to target
					else if (me->GetMotionMaster()->GetCurrentMovementGeneratorType() != CHASE_MOTION_TYPE)
					{
						//Cancel our current spell and then mutate new movement generator
						me->InterruptNonMeleeSpells(false);
						me->GetMotionMaster()->Clear(false);
						me->GetMotionMaster()->MoveChase(me->getVictim());
					}
				}
			}

			DoMeleeAttackIfReady();
		}

		void DoReplyToTextEmote(uint32 emote)
		{
			switch (emote)
			{
			case TEXT_EMOTE_WAVE:
				me->HandleEmoteCommand(EMOTE_ONESHOT_WAVE);
				break;

			case TEXT_EMOTE_SALUTE:
				me->HandleEmoteCommand(EMOTE_ONESHOT_SALUTE);
				break;
			}
		}

		void ReceiveEmote(Player* player, uint32 textEmote)
		{
			switch (me->GetEntry())
			{
			case Tanaan100Creatures::NpcVolmarGrunt1:
			case Tanaan100Creatures::NpcVolmarGrunt2:
				break;
			default:
				return;
			}

			if (!me->IsFriendlyTo(player))
				return;

			DoReplyToTextEmote(textEmote);
		}

	private:
		uint32 globalCooldown;
		uint32 buffTimer;
	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_volmar_gruntAI(creature);
	}
};

// Teleporter into Hellfire Citadel - 435634
class npc_teleporter_into_hfc : public CreatureScript
{
public:
	npc_teleporter_into_hfc() : CreatureScript("npc_teleporter_into_hfc") {}

	enum eEvents
	{
		EventCheckPlayer
	};

	enum eTeleporterActions
	{
		TeleportPlayer
	};

	struct npc_teleporter_into_hfcAI : public ScriptedAI
	{
		npc_teleporter_into_hfcAI(Creature* creature) : ScriptedAI(creature) {}

		EventMap m_CosmeticEvents;

		void Reset() override
		{
			m_CosmeticEvents.ScheduleEvent(eEvents::EventCheckPlayer, 1 * TimeConstants::IN_MILLISECONDS);
		}

		void DoAction(int32 const p_Action) override
		{
			switch (p_Action)
			{
				case eTeleporterActions::TeleportPlayer:
				{

				}
			}
		}

		void UpdateAI(uint32 const p_Diff)
		{
			UpdateOperations(p_Diff);

			m_CosmeticEvents.Update(p_Diff);

			switch (m_CosmeticEvents.ExecuteEvent())
			{
				case eEvents::EventCheckPlayer:
				{
					std::list<Player*> PlayersInRange;
					me->GetPlayerListInGrid(PlayersInRange, 5.0f);
					for (Player* p_Player : PlayersInRange)
						p_Player->TeleportTo(1448, 3976.81f, -760.645f, 35.5159f, 103.849f);
				}
			}
		}
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_teleporter_into_hfcAI(creature);
	}
};

// Teleporter into Tanaan - 435635
class npc_teleporter_into_tanaan : public CreatureScript
{
public:
	npc_teleporter_into_tanaan() : CreatureScript("npc_teleporter_into_tanaan") {}

	enum eEvents
	{
		EventCheckPlayer
	};

	enum eTeleporterActions
	{
		TeleportPlayer
	};

	struct npc_teleporter_into_tanaanAI : public ScriptedAI
	{
		npc_teleporter_into_tanaanAI(Creature* creature) : ScriptedAI(creature) {}

		EventMap m_CosmeticEvents;

		void Reset() override
		{
			m_CosmeticEvents.ScheduleEvent(eEvents::EventCheckPlayer, 1 * TimeConstants::IN_MILLISECONDS);
		}

		void DoAction(int32 const p_Action) override
		{
			switch (p_Action)
			{
			case eTeleporterActions::TeleportPlayer:
			{

			}
			}
		}

		void UpdateAI(uint32 const p_Diff)
		{
			UpdateOperations(p_Diff);

			m_CosmeticEvents.Update(p_Diff);

			switch (m_CosmeticEvents.ExecuteEvent())
			{
				case eEvents::EventCheckPlayer:
				{
					std::list<Player*> PlayersInRange;
					me->GetPlayerListInGrid(PlayersInRange, 5.0f);
					for (Player* p_Player : PlayersInRange)
						p_Player->TeleportTo(1464, 4068.29f, -705.557f, 2.46293f, 293.219f);
				}
			}
		}
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_teleporter_into_tanaanAI(creature);
	}
};

/// Fel Sludge - 188520
class spell_tanaan_fel_sludge : public AuraScript
{
	PrepareAuraScript(spell_tanaan_fel_sludge);

	void OnTick(AuraEffect const* aurEff)
	{
		if (Unit* target = GetTarget())
			if (aurEff->GetBase()->GetStackAmount() >= 10)
				target->Kill(target, true);
	}

	void Register() override
	{
		OnEffectPeriodic += AuraEffectPeriodicFn(spell_tanaan_fel_sludge::OnTick, EFFECT_2, SPELL_AURA_PERIODIC_DUMMY);
	}
};

class npc_terrorfist : public CreatureScript
{
public:
	npc_terrorfist() : CreatureScript("npc_terrorfist") { }

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_terrorfistAI(creature);
	}

	struct npc_terrorfistAI : public ScriptedAI
	{
		npc_terrorfistAI(Creature* creature) : ScriptedAI(creature) { }

		enum TerrorfistSpells
		{
			SpellSmash = 172679,
			SpellEnrage = 32714
		};

		void EnterCombat(Unit* /*victim*/) override
		{
			/*me->GetScheduler().Schedule(Seconds(13), [this](TaskContext context)
			{
				me->CastSpell(me, SpellSmash, false);
				context.Repeat(Seconds(13));
			});

			me->GetScheduler().Schedule(Seconds(30), [this](TaskContext context)
			{
				me->AddAura(SpellEnrage, me);
				context.Repeat(Seconds(30));
			});*/
		}
	};
};

class npc_vengeance : public CreatureScript
{
public:
	npc_vengeance() : CreatureScript("npc_vengeance") { }

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_vengeanceAI(creature);
	}

	struct npc_vengeanceAI : public ScriptedAI
	{
		npc_vengeanceAI(Creature* creature) : ScriptedAI(creature) { }

		enum VengeanceSpells
		{
			SpellEnvelopingShadows = 170178,
			SpellShadowInfusion = 170180
		};

		void EnterCombat(Unit* /*victim*/) override
		{
			/*me->GetScheduler().Schedule(Seconds(17), [this](TaskContext context)
			{
				me->CastSpell(me, SpellEnvelopingShadows, false);
				context.Repeat(Seconds(17));
			});

			me->GetScheduler().Schedule(Seconds(14), [this](TaskContext context)
			{
				me->CastSpell(me, SpellShadowInfusion, false);
				context.Repeat(Seconds(14));
			});*/
		}
	};
};

class npc_deathtalon : public CreatureScript
{
public:
	npc_deathtalon() : CreatureScript("npc_deathtalon") { }

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_deathtalonAI(creature);
	}

	struct npc_deathtalonAI : public ScriptedAI
	{
		npc_deathtalonAI(Creature* creature) : ScriptedAI(creature) { }

		enum DeathtalonSpells
		{
			SpellHeadbutt = 158546,
			SpellQuills = 158564,
			SpellPierce = 158560,
			SpellScreech = 167367
		};

		void EnterCombat(Unit* /*victim*/) override
		{
			/*me->GetScheduler().Schedule(Seconds(40), [this](TaskContext context)
			{
				me->CastSpell(me, SpellHeadbutt, false);
				context.Repeat(Seconds(40));
			});

			me->GetScheduler().Schedule(Seconds(20), [this](TaskContext context)
			{
				me->CastSpell(me, SpellQuills, false);
				context.Repeat(Seconds(60));
			});

			me->GetScheduler().Schedule(Seconds(15), [this](TaskContext context)
			{
				me->CastSpell(me, SpellPierce, false);
				context.Repeat(Seconds(30));
			});

			me->GetScheduler().Schedule(Seconds(5), [this](TaskContext context)
			{
				me->CastSpell(me, SpellScreech, false);
				context.Repeat(Seconds(90), Seconds(100));
			});*/
		}
	};
};

/*struct at_deathtalon_screech : AreaTriggerAI
{
	at_deathtalon_screech(AreaTrigger* areatrigger) : AreaTriggerAI(areatrigger) { }

	enum eSpells
	{
		SPELL_SCREECH_DAMAGE = 158558
	};

	void OnUnitEnter(Unit* unit) override
	{
		if (Unit* caster = at->GetCaster())
			if (caster != unit)
				caster->CastSpell(unit, SPELL_SCREECH_DAMAGE, true);
	}
};*/

/// Quills - 158564
class spell_deathtalon_quills : public AuraScript
{
	PrepareAuraScript(spell_deathtalon_quills);

	enum
	{
		SPELL_QUILLS_DAMAGE = 158567
	};

	void OnTick(AuraEffect const* /*aurEff*/)
	{
		if (Unit* caster = GetCaster())
			caster->CastSpell(caster, SPELL_QUILLS_DAMAGE, true);
	}

	void Register() override
	{
		OnEffectPeriodic += AuraEffectPeriodicFn(spell_deathtalon_quills::OnTick, EFFECT_0, SPELL_AURA_PERIODIC_DUMMY);
	}
};

class npc_doomroller : public CreatureScript
{
public:
	npc_doomroller() : CreatureScript("npc_doomroller") { }

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_doomrollerAI(creature);
	}

	enum eNpcs
	{
		NPC_DRIVER = 94807,
		NPC_PASSENGER = 95062
	};

	struct npc_doomrollerAI : public ScriptedAI
	{
		npc_doomrollerAI(Creature* creature) : ScriptedAI(creature) { }

		enum DoomrollerSpells
		{
			SpellSiegeNova = 188579,
		};

		void Reset() override
		{
			me->setFaction(14);

			me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
			me->GetMotionMaster()->MovePoint(1, 4092.80f, -760.21f, 2.89f, false);

			/*if (Vehicle* meVehicle = me->GetVehicleKit())
			{
				meVehicle->AddPassenger(me, NPC_PASSENGER, 0);
				meVehicle->AddPassenger(me, NPC_PASSENGER, 2);
				meVehicle->AddPassenger(me, NPC_PASSENGER, 3);
				meVehicle->AddPassenger(me, NPC_PASSENGER, 5);
				meVehicle->AddPassenger(me, NPC_DRIVER, 7);
			}*/
		}

		/*void MovementInform(uint32 type, uint32 point) override
		{
			if (type == POINT_MOTION_TYPE && point == 1)
			{
				me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
				me->SetHomePosition(me->GetPosition());
			}
		}*/

		void EnterCombat(Unit* /*victim*/) override
		{
			/*me->GetScheduler().Schedule(Seconds(40), [this](TaskContext context)
			{
				me->CastSpell(me, SpellSiegeNova, false);
				context.Repeat(Seconds(40));
			});*/
		}
	};
};

// Supreme Lord Kazzak - 94015
class boss_supreme_lord_kazzak : public CreatureScript
{
public:
	boss_supreme_lord_kazzak() : CreatureScript("boss_supreme_lord_kazzak") { }

	enum Texts
	{
		SAY_INTRO = 0,
		SAY_AGGRO = 1,
		SAY_DEATH = 2,
		SAY_KILL = 3,
		SAY_SPELL = 4,
		SAY_FIRE = 5
	};

	enum Creatures
	{
		NPC_TWISTED_REFLECTION = 94172
	};

	enum eDatas
	{
		HealthScalingCoeff = 10,
		DamageScalingCoeff = 1
	};

	enum Spells
	{
		SPELL_FEL_BREATH = 187664,
		SPELL_MARK_OF_KAZZAK = 187667,
		SPELL_MARK_OF_KAZZAK_TRIGGER = 187671,
		SPELL_SUPREME_DOOM = 187466,
		SPELL_TWISTED_REFLECTION = 187702,
		SPELL_TWISTED_REFLECTION_SUMMON = 187703
	};

	enum Events
	{
		EVENT_FEL_BREATH = 1,
		EVENT_MARK_OF_KAZZAK = 2,
		EVENT_SUPREME_DOOM = 3,
		EVENT_TWISTED_REFLECTION = 4
	};

	struct boss_supreme_lord_kazzakAI : public ScriptedAI
	{
		boss_supreme_lord_kazzakAI(Creature* p_Creature) : ScriptedAI(p_Creature) { }

		EventMap m_Events;

		void Reset()
		{
			m_Events.Reset();
			m_Events.ScheduleEvent(EVENT_FEL_BREATH, urand(20000, 22000));
			m_Events.ScheduleEvent(EVENT_MARK_OF_KAZZAK, urand(13000, 15000));
			m_Events.ScheduleEvent(EVENT_SUPREME_DOOM, urand(50000, 52000));

			me->setFaction(14);

			summons.DespawnAll();
		}

		void JustRespawned()
		{
			Talk(SAY_INTRO);
		}

		void JustDied(Unit* _Killer)
		{
			Talk(SAY_DEATH);
			summons.DespawnAll();
		}

		void EnterCombat(Unit*)
		{
			Talk(SAY_AGGRO);
			me->SetHomePosition(*me);

			m_Events.ScheduleEvent(EVENT_FEL_BREATH, urand(10000, 12000));
			m_Events.ScheduleEvent(EVENT_MARK_OF_KAZZAK, urand(4000, 5000));
			m_Events.ScheduleEvent(EVENT_SUPREME_DOOM, urand(50000, 52000));
		}

		void KilledUnit(Unit* victim)
		{
			// When Kazzak kills a player (not pets/totems), he regens some health
			if (victim->GetTypeId() != TYPEID_PLAYER)
				return;

			Talk(SAY_KILL);
		}

		void JustSummoned(Creature* summon)
		{
			switch (summon->GetEntry())
			{
			case NPC_TWISTED_REFLECTION:
			{
				summon->SetReactState(REACT_PASSIVE);
				float x, y, z;
				summon->GetClosePoint(x, y, z, me->GetObjectSize() / 3, 100.0f);
				summon->GetMotionMaster()->MovePoint(1, x, y, z);
				summon->DespawnOrUnsummon(40000);
				break;
			}
			default:
				break;
			}
		}

		void EnterEvadeMode() override
		{
			CreatureAI::EnterEvadeMode();
			summons.DespawnAll();
			me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_MOVE);
			me->ClearUnitState(UNIT_STATE_ROOT);
			m_Events.Reset();

			std::list<Creature*> l_CreatureList;
			GetCreatureListWithEntryInGrid(l_CreatureList, me, Tanaan100Creatures::NPC_TWISTED_REFLECTION, 200.0f);

			for (Creature* l_Creature : l_CreatureList)
				l_Creature->DespawnOrUnsummon();

			me->GetMotionMaster()->MoveTargetedHome();
		}

		void UpdateAI(uint32 const p_Diff)
		{
			if (!UpdateVictim())
				return;

			if (me->GetDistance(me->GetHomePosition()) >= 80.0f)
			{
				EnterEvadeMode();
				return;
			}

			HandleHealthAndDamageScaling();

			m_Events.Update(p_Diff);

			if (me->HasUnitState(UnitState::UNIT_STATE_CASTING))
				return;

			while (uint32 eventId = m_Events.ExecuteEvent())
			{
				switch (eventId)
				{
				case EVENT_FEL_BREATH:
					DoCastVictim(SPELL_FEL_BREATH);
					m_Events.ScheduleEvent(EVENT_FEL_BREATH, urand(20000, 22000));					
					break;
				case EVENT_MARK_OF_KAZZAK:
					if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 0.0f, true))
						DoCast(target, SPELL_MARK_OF_KAZZAK);
						m_Events.ScheduleEvent(EVENT_MARK_OF_KAZZAK, urand(13000, 15000));
					break;
				case EVENT_SUPREME_DOOM:
					DoCast(SPELL_SUPREME_DOOM);
					m_Events.ScheduleEvent(EVENT_SUPREME_DOOM, urand(50000, 52000));
					break;
				case EVENT_TWISTED_REFLECTION:
					if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 80.0f, true))
						DoCast(target, SPELL_TWISTED_REFLECTION_SUMMON);
					break;
				default:
					break;
				}
			}

			DoMeleeAttackIfReady();
		}

		void HandleHealthAndDamageScaling()
		{
			std::list<HostileReference*> l_ThreatList = me->getThreatManager().getThreatList();
			uint32 l_Count = (uint32)std::count_if(l_ThreatList.begin(), l_ThreatList.end(), [this](HostileReference* p_HostileRef) -> bool
			{
				Unit* l_Unit = Unit::GetUnit(*me, p_HostileRef->getUnitGuid());
				return l_Unit && l_Unit->GetTypeId() == TypeID::TYPEID_PLAYER;
			});
		}
	};

	CreatureAI* GetAI(Creature* p_Creature) const
	{
		return new boss_supreme_lord_kazzakAI(p_Creature);
	}
};

// Twisted Reflection - 94712
class npc_twisted_reflection : public CreatureScript
{
public:
	npc_twisted_reflection() : CreatureScript("npc_twisted_reflection") {}
	
	struct npc_twisted_reflectionAI : public ScriptedAI
	{
		npc_twisted_reflectionAI(Creature* p_Creature) : ScriptedAI(p_Creature) { }

		EventMap m_Events;

		void Reset()
		{
			me->setFaction(14);
			me->CastSpell(me, 187709, true); // Green effect
			me->CastSpell(me, 102288, true); // Copy model
		}

		void IsSummonedBy(Unit* p_Owner) override
		{
			me->setFaction(14);
			me->SetReactState(ReactStates::REACT_PASSIVE);
			me->SetSpeed(MOVE_WALK, 0.65f, true);
			me->SetSpeed(MOVE_RUN, 0.65f, true);

			me->CastSpell(me, 187709, true); // Green effect
			me->CastSpell(me, 102288, true); // Copy model
		}
	};

	CreatureAI* GetAI(Creature* p_Creature) const
	{
		return new npc_twisted_reflectionAI(p_Creature);
	}
};

#ifndef __clang_analyzer__
void AddSC_tanaan_jungle_100()
{
	new map_tanaan_jungle_100();
	// new playerScript_enter_tanaan();
	g_MapShiftPlayerScript = new playerScript_map_shift_100();
	new playerScript_quests_custom_gestion_100();

	new npc_shadow_hunter_mutumba();
	new npc_draka_hud();

	new npc_volmar_grunt();
	new npc_volmar_shadow_hunter();

	new npc_teleporter_into_hfc();
	new npc_teleporter_into_tanaan();

	new npc_terrorfist();
	new npc_vengeance();
	new npc_doomroller();
	new npc_deathtalon();

	new boss_supreme_lord_kazzak();
	new npc_twisted_reflection();

	/*RegisterAreaTriggerAI(at_deathtalon_screech);
	RegisterAuraScript(spell_deathtalon_quills);*/
}
#endif
