////////////////////////////////////////////////////////////////////////////////
//
//  MILLENIUM-STUDIO
//  Copyright 2016 Millenium-studio SARL
//  All Rights Reserved.
//
////////////////////////////////////////////////////////////////////////////////

#include "ScriptPCH.h"
#include "ScriptedEscortAI.h"
#include "draenor_shadowmoon_valley.hpp"
#include "GameObjectAI.h"
#include "NPCHandler.h"
#include "Vehicle.h"
#include "PhaseMgr.h"
#include "Common.h"

/* When you first arrive Shadowmoon, the player must be set in phase 3, since the questgiver and actors are in phase 2 and the player 
   must be able to see both phase 1 and 2. On getting the first quest, we remove phase 2, so the questgiver and actors aren't
   seen by the player anymore.*/

   /// Passive Scene Object
class playerScript_shadowmoon_phase_handler : public PlayerScript
{
public:
	playerScript_shadowmoon_phase_handler() : PlayerScript("playerScript_shadowmoon_phase_handler") { }

	void UpdatePhaseMask(Player* p_Player)
	{
		if (p_Player->GetZoneId() == 6719) // Shadowmoon Valley
		{
			/// UPDATE PHASEMASK DEPENDING OF QUESTS
			uint32 l_PhaseMask = p_Player->GetPhaseMask();

			if (p_Player->GetQuestStatus(eQuests::QuestStepThreeProphet) == QUEST_STATUS_COMPLETE || QUEST_STATUS_REWARDED)
			{
				l_PhaseMask == 3;
			}

			if (p_Player->GetQuestStatus(eQuests::QuestFindingAFoothold) == QUEST_STATUS_COMPLETE)
			{
				l_PhaseMask == 5;
			}

			if (p_Player->GetQuestStatus(eQuests::QuestForTheAlliance) == QUEST_STATUS_COMPLETE || QUEST_STATUS_REWARDED)
			{
				l_PhaseMask == 13;
			}

			if (p_Player->GetQuestStatus(eQuests::QuestLookingForLumber && QuestRavenousRavens) == QUEST_STATUS_COMPLETE)
			{
				l_PhaseMask == 29;
			}

			p_Player->SetPhaseMask(l_PhaseMask, true);
		}
	}

	void OnQuestComplete(Player* p_Player, const Quest* p_Quest) override
	{
		if (p_Player->GetZoneId() == 6719) // Shadowmoon Valley
		{
			uint32 l_PhaseMask = p_Player->GetPhaseMask();

			if (p_Quest->GetQuestId() == eQuests::QuestStepThreeProphet)
			{
				l_PhaseMask |= ePhases::PhaseBeforeGoingBase;
			}

			if (p_Quest->GetQuestId() == eQuests::QuestFindingAFoothold)
			{
				l_PhaseMask |= ePhases::PhaseFirstTimeBase;
			}

			if (p_Quest->GetQuestId() == eQuests::QuestForTheAlliance)
			{
				l_PhaseMask |= ePhases::PhaseNpcSummoned;
			}

			if (p_Quest->GetQuestId() == eQuests::QuestLookingForLumber && QuestRavenousRavens)
			{
				l_PhaseMask |= ePhases::PhaseRavenQuestCompleted;
			}

			p_Player->SetPhaseMask(l_PhaseMask, true);
		}
	}

	void OnQuestReward(Player* p_Player, const Quest* p_Quest) override
	{
		if (p_Player->GetZoneId() == 6719) // Shadowmoon Valley
		{
			uint32 l_PhaseMask = p_Player->GetPhaseMask();

			if (p_Quest->GetQuestId() == eQuests::QuestStepThreeProphet)
			{
				l_PhaseMask |= ePhases::PhaseBeforeGoingBase;
			}

			if (p_Quest->GetQuestId() == eQuests::QuestForTheAlliance)
			{
				l_PhaseMask |= ePhases::PhaseNpcSummoned;
			}

			p_Player->SetPhaseMask(l_PhaseMask, true);
		}
	}
};

/// 79206 - Prophet Velen
class shadowmoon_prophet_velen_eventide_questgiver : public CreatureScript
{
    public:
        shadowmoon_prophet_velen_eventide_questgiver() : CreatureScript("shadowmoon_prophet_velen_eventide_questgiver") { }

		enum eAction
		{
			StartFindingAFoothold = 0
		};

        bool OnQuestAccept(Player* p_Player, Creature* p_Creature, const Quest* p_Quest) override
        {
            if (p_Quest->GetQuestId() == eQuests::QuestFindingAFoothold)
            {
				uint32 l_PhaseMask = p_Player->GetPhaseMask();

				l_PhaseMask = ePhases::PhaseBase;

				if (Creature* l_Velen = p_Player->SummonCreature(eCreature::NpcVelenEventide, l_VelenPos))
				{
					l_Velen->GetAI()->DoAction(eAction::StartFindingAFoothold);
				}

				if (Creature* l_Yrel = p_Player->SummonCreature(eCreature::NpcYrelEventide, l_YrelPos))
				{
					l_Yrel->GetAI()->DoAction(eAction::StartFindingAFoothold);
				}

				if (Creature* l_Maraad = p_Player->SummonCreature(eCreature::NpcMaraadEventide, l_MaraadPos))
				{
					l_Maraad->GetAI()->DoAction(eAction::StartFindingAFoothold);
				}

				if (Creature* l_Khadgar = p_Player->SummonCreature(eCreature::NpcKhadgarEventide, l_KhadgarPos))
				{
					l_Khadgar->GetAI()->DoAction(eAction::StartFindingAFoothold);
				}

                p_Player->SetPhaseMask(l_PhaseMask, true);
            }

            return true;
        }

		struct shadowmoon_prophet_velen_eventide_questgiverAI : public ScriptedAI
		{
			shadowmoon_prophet_velen_eventide_questgiverAI(Creature* creature) : ScriptedAI(creature)
			{
				m_PlayerGuid	= 0;
			}

			bool EventStarted;

			uint64 m_PlayerGuid;

			void Reset() override
			{
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
					case eAction::StartFindingAFoothold:
					{
						AddTimedDelayedOperation(0 * TimeConstants::IN_MILLISECONDS, [this]() -> void
						{
							me->RemoveFlag(UNIT_FIELD_NPC_FLAGS, UNIT_NPC_FLAG_QUESTGIVER);

							me->SetWalk(true);

							me->GetMotionMaster()->MovePoint(0, 2301.7163f, 460.1557f, 7.8610f, false);
						});

						AddTimedDelayedOperation(7 * TimeConstants::IN_MILLISECONDS, [this]() -> void
						{
							me->AI()->Talk(0);
						});

						AddTimedDelayedOperation(14 * TimeConstants::IN_MILLISECONDS, [this]() -> void
						{
							me->SetWalk(false);
							me->SetSpeed(UnitMoveType::MOVE_RUN, 1.8f, true);

							me->Mount(59341);
						});

						AddTimedDelayedOperation(15 * TimeConstants::IN_MILLISECONDS, [this]() -> void
						{
							me->GetMotionMaster()->MoveSmoothPath(0, g_VelenMoves.data(), g_VelenMoves.size(), false);
						});

						AddTimedDelayedOperation(30 * TimeConstants::IN_MILLISECONDS, [this]() -> void
						{
							me->AI()->Talk(1);
						});

						AddTimedDelayedOperation(53 * TimeConstants::IN_MILLISECONDS, [this]() -> void
						{
							me->AI()->Talk(2);
						});

						AddTimedDelayedOperation(57 * TimeConstants::IN_MILLISECONDS, [this]() -> void
						{
							me->SetSpeed(UnitMoveType::MOVE_RUN, 1.0f, true);
							me->SetWalk(true);

							me->Dismount();
						});

						AddTimedDelayedOperation(59 * TimeConstants::IN_MILLISECONDS, [this]() -> void
						{
							if (m_PlayerGuid)
							{
								if (Player* l_Player = me->GetPlayer(*me, m_PlayerGuid))
								{
									if (l_Player->HasQuest(eQuests::QuestFindingAFoothold))
										l_Player->CompleteQuest(eQuests::QuestFindingAFoothold);
								}
							}
						});

						AddTimedDelayedOperation(60 * TimeConstants::IN_MILLISECONDS, [this]() -> void
						{
							me->DespawnOrUnsummon();
						});

						break;
					}
				default:
					break;
				}
			}

			void UpdateAI(const uint32 p_Diff) override
			{
				UpdateOperations(p_Diff);
			}
		};

		CreatureAI* GetAI(Creature* creature) const
		{
			return new shadowmoon_prophet_velen_eventide_questgiverAI(creature);
		}

};

/// 79219 - Yrel
class shadowmoon_yrel_eventide : public CreatureScript
{
public:
	shadowmoon_yrel_eventide() : CreatureScript("shadowmoon_yrel_eventide") { }

	enum eAction
	{
		StartFindingAFoothold = 0
	};

	enum eMoves
	{
		StartQuestMove = 0
	};

	struct shadowmoon_yrel_eventideAI : public ScriptedAI
	{
		shadowmoon_yrel_eventideAI(Creature* creature) : ScriptedAI(creature)
		{
			m_PlayerGuid = 0;
		}

		uint64 m_PlayerGuid;

		void Reset() override
		{
			ClearDelayedOperations();

			m_PlayerGuid = 0;
		}

		void IsSummonedBy(Unit* p_Summoner) override
		{
			m_PlayerGuid = p_Summoner->GetGUID();
		}

		void DoAction(int32 const p_Action) override
		{
			switch (p_Action)
			{
				case eAction::StartFindingAFoothold:
				{
					Player* p_Player;
					Creature* p_Creature;
				
					me->SetSpeed(UnitMoveType::MOVE_RUN, 1.8f, true);

					AddTimedDelayedOperation(0 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->SetWalk(true);

						me->GetMotionMaster()->MovePoint(0, 2304.2285f, 458.3234f, 7.2519f, false);

						me->AI()->Talk(0);
					});

					AddTimedDelayedOperation(4 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->GetMotionMaster()->MoveBackward(1, 2306.1201f, 457.556f, 6.81435f, 1.0f);
					});

					AddTimedDelayedOperation(15 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->SetWalk(false);
						me->SetSpeed(UnitMoveType::MOVE_RUN, 1.8f, true);

						me->Mount(59341);
					});

					AddTimedDelayedOperation(16.5 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->GetMotionMaster()->MoveSmoothPath(eMoves::StartQuestMove, g_YrelMoves.data(), g_YrelMoves.size(), false);
					});

					AddTimedDelayedOperation(57 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->SetSpeed(UnitMoveType::MOVE_RUN, 1.0f, true);
						me->SetWalk(true);
						me->Dismount();
					});

					AddTimedDelayedOperation(60 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->DespawnOrUnsummon();
					});

					break;
				}
			default:
				break;
			}
		}

		void UpdateAI(const uint32 p_Diff) override
		{
			UpdateOperations(p_Diff);
		}
	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new shadowmoon_yrel_eventideAI(creature);
	}

};

/// 79218 - Maraad
class shadowmoon_maraad_eventide : public CreatureScript
{
public:
	shadowmoon_maraad_eventide() : CreatureScript("shadowmoon_maraad_eventide") { }

	enum eAction
	{
		StartFindingAFoothold = 0
	};

	struct shadowmoon_maraad_eventideAI : public ScriptedAI
	{
		shadowmoon_maraad_eventideAI(Creature* creature) : ScriptedAI(creature)
		{
			m_PlayerGuid = 0;
		}

		uint64 m_PlayerGuid;

		void Reset() override
		{
			ClearDelayedOperations();

			m_PlayerGuid = 0;
		}

		void IsSummonedBy(Unit* p_Summoner) override
		{
			m_PlayerGuid = p_Summoner->GetGUID();
		}

		void DoAction(int32 const p_Action) override
		{
			switch (p_Action)
			{
			case eAction::StartFindingAFoothold:
			{
				Player* p_Player;
				Creature* p_Creature;

				AddTimedDelayedOperation(14.5 * TimeConstants::IN_MILLISECONDS, [this]() -> void
				{
					me->SetSpeed(UnitMoveType::MOVE_RUN, 1.8f, true);

					me->Mount(59341);
				});

				AddTimedDelayedOperation(18 * TimeConstants::IN_MILLISECONDS, [this]() -> void
				{
					me->AI()->Talk(0);
				});

				AddTimedDelayedOperation(15 * TimeConstants::IN_MILLISECONDS, [this]() -> void
				{
					me->GetMotionMaster()->MoveSmoothPath(0, g_MaraadMoves.data(), g_MaraadMoves.size(), false);
				});

				AddTimedDelayedOperation(52 * TimeConstants::IN_MILLISECONDS, [this]() -> void
				{
					me->Dismount();

					me->SetSpeed(UnitMoveType::MOVE_RUN, 1.0f, true);
					me->SetWalk(true);
				});

				AddTimedDelayedOperation(60 * TimeConstants::IN_MILLISECONDS, [this]() -> void
				{
					me->DespawnOrUnsummon();
				});

				break;
			}
			default:
				break;
			}
		}

		void UpdateAI(const uint32 p_Diff) override
		{
			UpdateOperations(p_Diff);
		}
	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new shadowmoon_maraad_eventideAI(creature);
	}
};

/// 79216 - Khadgar
class shadowmoon_khadgar_eventide : public CreatureScript
{
public:
	shadowmoon_khadgar_eventide() : CreatureScript("shadowmoon_khadgar_eventide") { }

	enum eAction
	{
		StartFindingAFoothold = 0
	};

	struct shadowmoon_khadgar_eventideAI : public ScriptedAI
	{
		shadowmoon_khadgar_eventideAI(Creature* creature) : ScriptedAI(creature)
		{
			m_PlayerGuid = 0;
		}

		uint64 m_PlayerGuid;

		void Reset() override
		{
			ClearDelayedOperations();

			m_PlayerGuid = 0;
		}

		void IsSummonedBy(Unit* p_Summoner) override
		{
			m_PlayerGuid = p_Summoner->GetGUID();
		}

		void DoAction(int32 const p_Action) override
		{
			switch (p_Action)
			{
			case eAction::StartFindingAFoothold:
			{
				Player* p_Player;
				Creature* p_Creature;

				AddTimedDelayedOperation(12.5 * TimeConstants::IN_MILLISECONDS, [this]() -> void
				{
					me->CastSpell(me, 165291, false);

					me->SetSpeed(UnitMoveType::MOVE_FLIGHT, 2.2f, true);
					me->SetDisableGravity(true);
					me->SetCanFly(true);
				});

				AddTimedDelayedOperation(13 * TimeConstants::IN_MILLISECONDS, [this]() -> void
				{
					me->GetMotionMaster()->MoveSmoothFlyPath(0, g_KhadgarMoves.data(), g_KhadgarMoves.size(), false);
				});

				AddTimedDelayedOperation(35 * TimeConstants::IN_MILLISECONDS, [this]() -> void
				{
					me->DespawnOrUnsummon();
				});

				break;
			}
			default:
				break;
			}
		}

		void UpdateAI(const uint32 p_Diff) override
		{
			UpdateOperations(p_Diff);
		}
	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new shadowmoon_khadgar_eventideAI(creature);
	}

};

/// 79470 - Maraad (Lunarfall)
class shadowmoon_maraad_lunarfall : public CreatureScript
{
public:
	shadowmoon_maraad_lunarfall() : CreatureScript("shadowmoon_maraad_lunarfall") { }

	enum eAction
	{
		StartForTheAlliance = 0
	};

	bool OnQuestAccept(Player* p_Player, Creature* p_Creature, const Quest* p_Quest) override
	{
		if (p_Quest->GetQuestId() == eQuests::QuestForTheAlliance)
		{
			p_Player->SummonGameObject(230280, 1939.56f, 321.934f, 88.9668f, 1.85479f, 0.0f, 0.0f, 0.0f, 0.0f, 0);

			p_Creature->AI()->DoAction(0);

			if (Creature* l_Velen = p_Creature->FindNearestCreature(79241, 20.0f, true))
			{
				l_Velen->AI()->DoAction(0);
			}
		}

		return true;
	}

	struct shadowmoon_maraad_lunarfallAI : public ScriptedAI
	{
		shadowmoon_maraad_lunarfallAI(Creature* creature) : ScriptedAI(creature) { }

		void Reset() override
		{
			ClearDelayedOperations();
		}

		void DoAction(int32 const p_Action) override
		{
			switch (p_Action)
			{
				case eAction::StartForTheAlliance:
				{
					AddTimedDelayedOperation(0 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->AI()->Talk(0);
					});

					AddTimedDelayedOperation(18 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->AI()->Talk(1);
					});

					break;
				}
			default:
				break;
			}
		}

		void UpdateAI(const uint32 p_Diff) override
		{
			UpdateOperations(p_Diff);
		}
	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new shadowmoon_maraad_lunarfallAI(creature);
	}

};

/// 230280 - Alliance Banner
class gob_alliance_banner_230280 : public GameObjectScript
{
public:
	gob_alliance_banner_230280() : GameObjectScript("gob_alliance_banner_230280") { }

	enum eAction
	{
		Despawn = 0,
	};

	bool OnGossipHello(Player* p_Player, GameObject* p_GameObject) override
	{
		if (p_Player->GetQuestStatus(eQuests::QuestForTheAlliance) == QUEST_STATUS_INCOMPLETE)
		{
			p_Player->CastSpell(p_Player, 81003, true);
			p_Player->CastSpell(p_Player, 169457, false);

			if (Creature* khadgar = p_Player->SummonCreature(82125, 1943.91f, 339.194f, 89.015f, 4.354f, TEMPSUMMON_MANUAL_DESPAWN, 0))
			{
				khadgar->AI()->DoAction(0);
			}

			p_GameObject->AI()->DoAction(eAction::Despawn);
		}

		return true;
	}

	struct gob_alliance_banner_230280AI : public GameObjectAI
	{
		gob_alliance_banner_230280AI(GameObject* p_GameObject) : GameObjectAI(p_GameObject) { }

		void Reset() override
		{
			ClearDelayedOperations();
		}

		void DoAction(int32 const p_Action) override
		{
			switch (p_Action)
			{
				case eAction::Despawn:
				{
					AddTimedDelayedOperation(0 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						go->SetFlag(GAMEOBJECT_FIELD_FLAGS, GO_FLAG_NOT_SELECTABLE);
					});

					AddTimedDelayedOperation(38 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						go->Delete();
					});

					break;
				}
			default:
				break;
			}
		}

		void UpdateAI(const uint32 p_Diff) override
		{
			UpdateOperations(p_Diff);
		}
	};

	GameObjectAI* GetAI(GameObject* p_GameObject) const
	{
		return new gob_alliance_banner_230280AI(p_GameObject);
	}
};

/// 79241 - Velen (Lunarfall)
class shadowmoon_velen_lunarfall : public CreatureScript
{
public:
	shadowmoon_velen_lunarfall() : CreatureScript("shadowmoon_velen_lunarfall") { }

	struct shadowmoon_maraad_lunarfallAI : public ScriptedAI
	{
		shadowmoon_maraad_lunarfallAI(Creature* creature) : ScriptedAI(creature) { }

		uint64 m_PlayerGuid;

		void Reset() override
		{
			ClearDelayedOperations();
		}

		void DoAction(int32 const p_Action) override
		{
			switch (p_Action)
			{
				case 0:
				{
					AddTimedDelayedOperation(12 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->AI()->Talk(0);
					});

					break;
				}
			default:
				break;
			}
		}

		void UpdateAI(const uint32 p_Diff) override
		{
			UpdateOperations(p_Diff);
		}
	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new shadowmoon_maraad_lunarfallAI(creature);
	}

};

/// 82125 - Khadgar
class shadowmoon_khadgar_lunarfall : public CreatureScript
{
public:
	shadowmoon_khadgar_lunarfall() : CreatureScript("shadowmoon_khadgar_lunarfall") {}

	struct shadowmoon_khadgar_lunarfallAI : public ScriptedAI
	{
		shadowmoon_khadgar_lunarfallAI(Creature* creature) : ScriptedAI(creature) 
		{
			PlayerGUID = 0;
		}

		enum eAction
		{
			StartForTheAlliance = 0
		};

		uint8 Phase;
		uint32 EntryTime;
		uint64 PlayerGUID;

		uint64 CordanaGUID;
		uint64 PortalGUID;

		uint64 Guard1GUID;
		uint64 Guard2GUID;
		uint64 Starfall1GUID;
		uint64 Starfall2GUID;
		uint64 BrightstoneGUID;
		uint64 Laborer1GUID;
		uint64 LieutenantGUID;
		uint64 ShellyGUID;
		uint64 JarrodGUID;
		uint64 PippersGUID;
		uint64 Laborer2GUID;
		uint64 ZipfizzleGUID;
		uint64 PackmuleGUID;
		uint64 BarosGUID;

		bool bSummoned;

		void Reset()
		{
			ClearDelayedOperations();

			Phase = 0;
			EntryTime = 1000;

			CordanaGUID = 0;
			PortalGUID = 0;

			Guard1GUID = 0;
			Guard2GUID = 0;
			Starfall1GUID = 0;
			Starfall2GUID = 0;
			BrightstoneGUID = 0;
			Laborer1GUID = 0;
			LieutenantGUID = 0;
			ShellyGUID = 0;
			JarrodGUID = 0;
			PippersGUID = 0;
			Laborer2GUID = 0;
			ZipfizzleGUID = 0;
			PackmuleGUID = 0;
			BarosGUID = 0;

			bSummoned = false;
		}

		void IsSummonedBy(Unit* p_Summoner) override
		{
			PlayerGUID = p_Summoner->GetGUID();
		}

		void PartySummoned()
		{
			if (!bSummoned)
			{
				if (Creature* cordana = me->SummonCreature(79706, 1969.4899f, 340.9649f, 89.0431f, 3.5268f, TEMPSUMMON_MANUAL_DESPAWN, 0))
				if (Creature* portal = me->SummonCreature(79429, 1949.07f, 329.047f, 88.9664f, 3.5268f, TEMPSUMMON_MANUAL_DESPAWN, 0))
				{
					PortalGUID = portal->GetGUID();
					CordanaGUID = cordana->GetGUID();
					cordana->SetVisible(false);
				}
			}
		}

		void DoAction(int32 const p_Action) override
		{
			switch (p_Action)
			{
				case eAction::StartForTheAlliance:
				{
					AddTimedDelayedOperation(0 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->CastSpell(me, 135586, false);

						me->SetWalk(true);
					});

					AddTimedDelayedOperation(1 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->GetMotionMaster()->MovePoint(0, 1946.86f, 334.151f, 88.9551f, false);
					});

					AddTimedDelayedOperation(2 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->AI()->Talk(0);
					});

					AddTimedDelayedOperation(3.5 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->CastSpell(me, 189654, false);
					});

					AddTimedDelayedOperation(5.5 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						PartySummoned();
					});

					AddTimedDelayedOperation(7.5 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						bSummoned = true;
						EntryTime = 250;
					});
					break;
				}
			default:
				break;
			}
		}

		void UpdateAI(const uint32 p_Diff) override
		{
			UpdateOperations(p_Diff);

			if (EntryTime <= p_Diff)
			{
				if (bSummoned)
				{
					if (Creature* cordana = me->GetCreature(*me, CordanaGUID))
					if (Creature* portal = me->GetCreature(*me, PortalGUID))
					{
						switch (Phase)
						{
							case 0:
							{
								cordana->SetVisible(true);
								cordana->CastSpell(cordana, 51908, false);
								EntryTime = 1000;
								Phase++;
								break;
							}
							case 1:
							{
								me->SummonCreature(79394, 1949.07f, 329.047f, 88.9664f, 2.38f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 27000);
								EntryTime = 1000;
								Phase++;
								break;
							}
							case 2:
							{
								me->SummonCreature(79422, 1949.07f, 329.047f, 88.9664f, 2.38f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 26000);
								EntryTime = 2000;
								Phase++;
								break;
							}
							case 3:
							{
								if (Creature* starfall1 = me->SummonCreature(82154, 1949.07f, 329.047f, 88.9664f, 2.38f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 24000))
								{
									starfall1->AI()->DoAction(0);
								}
								if (Creature* starfall2 = me->SummonCreature(821540, 1949.07f, 329.047f, 88.9664f, 2.38f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 24000))
								{
									starfall2->AI()->DoAction(0);
								}
								EntryTime = 2000;
								Phase++;
								break;
							}
							case 4:
							{
								me->SummonCreature(82150, 1949.07f, 329.047f, 88.9664f, 2.38f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 22000);
								EntryTime = 2000;
								Phase++;
								break;
							}
							case 5:
							{
								me->SummonCreature(82149, 1949.07f, 329.047f, 88.9664f, 2.38f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 20000);
								EntryTime = 2000;
								Phase++;
								break;
							}
							case 6:
							{
								me->SummonCreature(82152, 1949.07f, 329.047f, 88.9664f, 2.38f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 18000);
								EntryTime = 2000;
								Phase++;
								break;
							}
							case 7:
							{
								me->SummonCreature(79622, 1949.07f, 329.047f, 88.9664f, 2.38f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 16000);
								EntryTime = 1000;
								Phase++;
								break;
							}
							case 8:
							{
								me->SummonCreature(79624, 1949.07f, 329.047f, 88.9664f, 2.38f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 15000);
								EntryTime = 1000;
								Phase++;
								break;
							}
							case 9:
							{
								me->SummonCreature(82148, 1949.07f, 329.047f, 88.9664f, 2.38f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 14000);
								EntryTime = 2000;
								Phase++;
								break;
							}
							case 10:
							{
								me->SummonCreature(82151, 1949.07f, 329.047f, 88.9664f, 2.38f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 12000);
								EntryTime = 2000;
								Phase++;
								break;
							}
							case 11:
							{
								me->SummonCreature(82098, 1949.07f, 329.047f, 88.9664f, 2.38f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 10000);
								EntryTime = 1000;
								Phase++;
								break;
							}
							case 12:
							{
								me->SummonCreature(82099, 1949.07f, 329.047f, 88.9664f, 2.38f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 8000);
								EntryTime = 2000;
								Phase++;
								break;
							}
							case 13:
							{
								me->SummonCreature(79436, 1949.07f, 329.047f, 88.9664f, 2.38f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 6000);
								EntryTime = 1000;
								Phase++;
								break;
							}
							case 14:
							{
								me->CastStop();
								portal->SetVisible(false);
								EntryTime = 500;
								Phase++;
								break;
							}
							case 15:
							{
								me->GetMotionMaster()->MovePoint(1, 1943.910f, 339.194f, 89.015f, false);
								EntryTime = 2500;
								Phase++;
								break;
							}
							case 16:
							{
								me->SetOrientation(4.303131f);
								EntryTime = 500;
								Phase++;
								break;
							}
							case 17:
							{
								if (PlayerGUID)
								{
									if (Player* l_Player = me->GetPlayer(*me, PlayerGUID))
									{
										if (l_Player->HasQuest(eQuests::QuestForTheAlliance))
											l_Player->QuestObjectiveSatisfy(273766, 1, QUEST_OBJECTIVE_TYPE_NPC, l_Player->GetGUID());
									}
								}

								EntryTime = 100;
								Phase++;
								break;
							}
							case 18:
							{
								me->DespawnOrUnsummon();
								portal->DespawnOrUnsummon();
								cordana->DespawnOrUnsummon();

								Phase = 0;
								break;
							}
							break;
						default:
							break;
						}
					}
				}
			}
			else EntryTime -= p_Diff;
		}
	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new shadowmoon_khadgar_lunarfallAI(creature);
	}
};

/// 79422 - Lunarfall 1 Guard
class shadowmoon_lunarfall1_guard : public CreatureScript
{
public:
	shadowmoon_lunarfall1_guard() : CreatureScript("shadowmoon_lunarfall1_guard") { }

	enum eAction
	{
		StartForTheAlliance = 0
	};

	struct shadowmoon_lunarfall1_guardAI : public ScriptedAI
	{
		shadowmoon_lunarfall1_guardAI(Creature* creature) : ScriptedAI(creature) { }

		void Reset() override
		{
			ClearDelayedOperations();
		}

		void DoAction(int32 const p_Action) override
		{
			switch (p_Action)
			{
				case eAction::StartForTheAlliance:
				{
					AddTimedDelayedOperation(0 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->SetWalk(false);

						me->GetMotionMaster()->MoveSmoothPath(0, g_Starfall1Moves.data(), g_Starfall1Moves.size(), false);
					});
					break;
				}
			default:
				break;
			}
		}

		void UpdateAI(const uint32 p_Diff) override
		{
			UpdateOperations(p_Diff);
		}
	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new shadowmoon_lunarfall1_guardAI(creature);
	}

};

/// 794220 - Lunarfall 2 Guard
class shadowmoon_lunarfall2_guard : public CreatureScript
{
public:
	shadowmoon_lunarfall2_guard() : CreatureScript("shadowmoon_lunarfall2_guard") { }

	enum eAction
	{
		StartForTheAlliance = 0
	};

	struct shadowmoon_lunarfall2_guardAI : public ScriptedAI
	{
		shadowmoon_lunarfall2_guardAI(Creature* creature) : ScriptedAI(creature) { }

		void Reset() override
		{
			ClearDelayedOperations();
		}

		void DoAction(int32 const p_Action) override
		{
			switch (p_Action)
			{
			case eAction::StartForTheAlliance:
			{
				AddTimedDelayedOperation(0 * TimeConstants::IN_MILLISECONDS, [this]() -> void
				{
					me->SetWalk(false);

					me->GetMotionMaster()->MoveSmoothPath(0, g_Starfall2Moves.data(), g_Starfall2Moves.size(), false);
				});
				break;
			}
			default:
				break;
			}
		}

		void UpdateAI(const uint32 p_Diff) override
		{
			UpdateOperations(p_Diff);
		}
	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new shadowmoon_lunarfall2_guardAI(creature);
	}

};

/// 230335 - Alliance Tree Marking
class gob_alliance_tree_marking_230335 : public GameObjectScript
{
public:
	gob_alliance_tree_marking_230335() : GameObjectScript("gob_alliance_tree_marking_230335") { }

	bool OnGossipHello(Player* p_Player, GameObject* p_GameObject) override
	{
		if (p_Player->GetQuestStatus(eQuests::QuestLookingForLumber) == QUEST_STATUS_INCOMPLETE)
		{
			p_Player->QuestObjectiveSatisfy(272854, 1, QUEST_OBJECTIVE_TYPE_GO, p_Player->GetGUID());
		}

		return true;
	}

	struct gob_alliance_tree_marking_230335AI : public GameObjectAI
	{
		gob_alliance_tree_marking_230335AI(GameObject* p_GameObject) : GameObjectAI(p_GameObject) { }

		void Reset() override
		{
			
		}
	};

	GameObjectAI* GetAI(GameObject* p_GameObject) const
	{
		return new gob_alliance_tree_marking_230335AI(p_GameObject);
	}
};

/// Squeezing - 159303
class spell_quest_shadowmoon_squeezing : public SpellScriptLoader
{
    enum
    {
        KillCredit = 74249
    };

    public:
        /// Constructor
        spell_quest_shadowmoon_squeezing() : SpellScriptLoader("spell_quest_shadowmoon_squeezing") { }

        class spell_quest_shadowmoon_squeezing_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_quest_shadowmoon_squeezing_SpellScript);

            void HandleDummy(SpellEffIndex /*p_EffIndex*/)
            {
                Unit* l_Caster = GetCaster();
                Unit* l_Target = GetHitUnit();

                if (l_Caster && l_Target && l_Caster->IsPlayer())
                {
                    if (   l_Target->GetEntry() == eCreature::JuicyMushroomA
                        || l_Target->GetEntry() == eCreature::JuicyMushroomB
                        || l_Target->GetEntry() == eCreature::JuicyMushroomC)
                    {
                        l_Caster->ToPlayer()->KilledMonsterCredit(KillCredit);
                        l_Target->ToCreature()->DespawnOrUnsummon();
                    }
                }
            }

            /// Register all effect
            void Register() override
            {
                OnEffectHitTarget += SpellEffectFn(spell_quest_shadowmoon_squeezing_SpellScript::HandleDummy, EFFECT_0, SPELL_EFFECT_DUMMY);
            }
        };

        /// Get spell script
        SpellScript* GetSpellScript() const override
        {
            return new spell_quest_shadowmoon_squeezing_SpellScript();
        }
};

void AddSC_draenor_shadowmoon_valley()
{
	// Phase
	new playerScript_shadowmoon_phase_handler();

	// NPCs
	new shadowmoon_prophet_velen_eventide_questgiver();
	new shadowmoon_yrel_eventide();
	new shadowmoon_maraad_eventide();
	new shadowmoon_khadgar_eventide();

	new shadowmoon_maraad_lunarfall();
	new shadowmoon_velen_lunarfall();
	new shadowmoon_khadgar_lunarfall();
	new shadowmoon_lunarfall1_guard();
	new shadowmoon_lunarfall2_guard();

	// Objects
	new gob_alliance_banner_230280();
	new gob_alliance_tree_marking_230335();

    new spell_quest_shadowmoon_squeezing();
}
