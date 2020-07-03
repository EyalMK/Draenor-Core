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

/// Phase Handler
class playerScript_shadowmoon_phase_handler : public PlayerScript
{
public:
	playerScript_shadowmoon_phase_handler() : PlayerScript("playerScript_shadowmoon_phase_handler") { }

	void UpdatePhaseMask(Player* p_Player)
	{
		uint32 l_PhaseMask = p_Player->GetPhaseMask();

		if (p_Player->GetZoneId() == 6719) // Shadowmoon Valley
		{
			if (p_Player->GetQuestStatus(eQuests::QuestStepThreeProphet) == QUEST_STATUS_COMPLETE || QUEST_STATUS_REWARDED) // 2
			{
				l_PhaseMask == 3;
			}

			if (p_Player->GetQuestStatus(eQuests::QuestFindingAFoothold) == QUEST_STATUS_COMPLETE) // 4
			{
				l_PhaseMask == 5;
			}

			if (p_Player->GetQuestStatus(eQuests::QuestForTheAlliance) == QUEST_STATUS_COMPLETE || QUEST_STATUS_REWARDED) // 4+8
			{
				l_PhaseMask == 13;
			}

			if (p_Player->GetQuestStatus(eQuests::QuestLookingForLumber) == QUEST_STATUS_COMPLETE || QUEST_STATUS_REWARDED) // 16
			{
				l_PhaseMask |= 16;
			}

			if (p_Player->GetQuestStatus(eQuests::QuestRavenousRavens) == QUEST_STATUS_COMPLETE || QUEST_STATUS_REWARDED) // 32
			{
				l_PhaseMask |= 32;
			}
		}

		p_Player->SetPhaseMask(l_PhaseMask, true);
	}

	void OnUpdateZone(Player* p_Player, uint32 p_NewZoneID, uint32 p_OldZoneID, uint32 p_NewAreaID) override
	{
		if (p_OldZoneID == 6719 && p_NewAreaID == 7173)
		{
			if (p_Player->GetQuestStatus(eQuests::QuestPaleMoonlight) == QUEST_STATUS_INCOMPLETE || QUEST_STATUS_COMPLETE)
				p_Player->SetPhaseMask(4, true);
			else if (p_Player->GetQuestStatus(eQuests::QuestShipSalvage) == QUEST_STATUS_INCOMPLETE || QUEST_STATUS_COMPLETE)
				p_Player->SetPhaseMask(4, true);
			else
				p_Player->GetPhaseMask();
		}
	}

	void OnLogin(Player* p_Player) override
	{
		if (p_Player->GetZoneId() == 6719) // Shadowmoon Valley
			UpdatePhaseMask(p_Player);
	}

	void OnQuestAccept(Player * p_Player, const Quest * p_Quest) override
	{
		if (p_Player->GetZoneId() == 6719) // Shadowmoon Valley
			UpdatePhaseMask(p_Player);
	}

	void OnQuestAbandon(Player* p_Player, const Quest* /*p_Quest*/) override
	{
		if (p_Player->GetZoneId() == 6719) // Shadowmoon Valley
			UpdatePhaseMask(p_Player);
	}

	void OnQuestComplete(Player* p_Player, const Quest* p_Quest) override
	{
		if (p_Player->GetZoneId() == 6719) // Shadowmoon Valley
			UpdatePhaseMask(p_Player);
	}

	void OnQuestReward(Player* p_Player, const Quest* p_Quest) override
	{
		if (p_Player->GetZoneId() == 6719) // Shadowmoon Valley
			UpdatePhaseMask(p_Player);
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
			m_PlayerGuid = 0;
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

				AddTimedDelayedOperation(56 * TimeConstants::IN_MILLISECONDS, [this]() -> void
				{
					me->AI()->Talk(2);
				});

				AddTimedDelayedOperation(62.5 * TimeConstants::IN_MILLISECONDS, [this]() -> void
				{
					me->SetSpeed(UnitMoveType::MOVE_RUN, 1.0f, true);
					me->SetWalk(true);

					me->Dismount();
				});

				AddTimedDelayedOperation(65 * TimeConstants::IN_MILLISECONDS, [this]() -> void
				{
					if (m_PlayerGuid)
					{
						if (Player* l_Player = me->GetPlayer(*me, m_PlayerGuid))
						{
							if (l_Player->HasQuest(eQuests::QuestFindingAFoothold))
								l_Player->QuestObjectiveSatisfy(79697, 1);
							l_Player->CompleteQuest(eQuests::QuestFindingAFoothold, false);
						}
					}
				});

				AddTimedDelayedOperation(66 * TimeConstants::IN_MILLISECONDS, [this]() -> void
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

				AddTimedDelayedOperation(18 * TimeConstants::IN_MILLISECONDS, [this]() -> void
				{
					me->GetMotionMaster()->MoveSmoothPath(eMoves::StartQuestMove, g_YrelMoves.data(), g_YrelMoves.size(), false);
				});

				AddTimedDelayedOperation(65 * TimeConstants::IN_MILLISECONDS, [this]() -> void
				{
					me->SetSpeed(UnitMoveType::MOVE_RUN, 1.0f, true);
					me->SetWalk(true);
					me->Dismount();
				});

				AddTimedDelayedOperation(66 * TimeConstants::IN_MILLISECONDS, [this]() -> void
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

				AddTimedDelayedOperation(16.5 * TimeConstants::IN_MILLISECONDS, [this]() -> void
				{
					me->GetMotionMaster()->MoveSmoothPath(0, g_MaraadMoves.data(), g_MaraadMoves.size(), false);
				});

				AddTimedDelayedOperation(61 * TimeConstants::IN_MILLISECONDS, [this]() -> void
				{
					me->Dismount();

					me->SetSpeed(UnitMoveType::MOVE_RUN, 1.0f, true);
					me->SetWalk(true);
				});

				AddTimedDelayedOperation(65 * TimeConstants::IN_MILLISECONDS, [this]() -> void
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

					me->SetSpeed(UnitMoveType::MOVE_FLIGHT, 3.0f, true);
					me->SetDisableGravity(true);
					me->SetCanFly(true);
				});

				AddTimedDelayedOperation(13 * TimeConstants::IN_MILLISECONDS, [this]() -> void
				{
					me->GetMotionMaster()->MoveSmoothPath(0, g_KhadgarMoves.data(), g_KhadgarMoves.size(), false, true);
				});

				AddTimedDelayedOperation(65 * TimeConstants::IN_MILLISECONDS, [this]() -> void
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
					go->SummonCreature(235344, 1939.54f, 321.950f, 88.967f, 1.880487f, TEMPSUMMON_MANUAL_DESPAWN, 0);
				});

				AddTimedDelayedOperation(45 * TimeConstants::IN_MILLISECONDS, [this]() -> void
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

/// 82125 - Khadgar (lunarfall)
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
						cordana->CastSpell(cordana, 142479, true); // kneel
						cordana->CastSpell(cordana, 165900, true); // touch of elune
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
								cordana->CastSpell(cordana, 154797, true); // shadowstep
								EntryTime = 1000;
								Phase++;
								break;
							}
							case 1:
							{
								if (Creature* guard1 = me->SummonCreature(79394, 1949.07f, 329.047f, 88.9664f, 2.38f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 37000))
								{
									guard1->AI()->DoAction(0);
								}
								EntryTime = 1000;
								Phase++;
								break;
							}
							case 2:
							{
								if (Creature* guard2 = me->SummonCreature(79422, 1949.07f, 329.047f, 88.9664f, 2.38f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 36000))
								{
									guard2->AI()->DoAction(0);
								}
								cordana->RemoveAura(142479); // kneel
								cordana->RemoveAura(165900); // touch of elune
								EntryTime = 2000;
								Phase++;
								break;
							}
							case 3:
							{
								if (Creature* sentinel1 = me->SummonCreature(82154, 1949.07f, 329.047f, 88.9664f, 2.38f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 34000))
								{
									sentinel1->AI()->DoAction(0);
								}
								if (Creature* sentinel2 = me->SummonCreature(82154, 1949.07f, 329.047f, 88.9664f, 2.38f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 34000))
								{
									sentinel2->AI()->DoAction(1);
								}
								EntryTime = 2000;
								Phase++;
								break;
							}
							case 4:
							{
								if (Creature* brightstone = me->SummonCreature(82150, 1949.07f, 329.047f, 88.9664f, 2.38f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 32000))
								{
									brightstone->AI()->DoAction(0);
								}
								EntryTime = 2000;
								Phase++;
								break;
							}
							case 5:
							{
								if (Creature* human = me->SummonCreature(82149, 1949.07f, 329.047f, 88.9664f, 2.38f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 30000))
								{
									human->AI()->DoAction(0);
								}
								EntryTime = 2000;
								Phase++;
								break;
							}
							case 6:
							{
								if (Creature* thorn = me->SummonCreature(82152, 1949.07f, 329.047f, 88.9664f, 2.38f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 28000))
								{
									thorn->AI()->DoAction(0);
								}
								EntryTime = 2000;
								Phase++;
								break;
							}
							case 7:
							{
								if (Creature* shelly = me->SummonCreature(79622, 1949.07f, 329.047f, 88.9664f, 2.38f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 26000))
								{
									shelly->AI()->DoAction(0);
								}
								if (Creature* jarrod = me->SummonCreature(79624, 1949.07f, 329.047f, 88.9664f, 2.38f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 26000))
								{
									jarrod->AI()->DoAction(0);
								}
								if (Creature* dwarf = me->SummonCreature(82151, 1949.07f, 329.047f, 88.9664f, 2.38f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 26000))
								{
									dwarf->AI()->DoAction(0);
								}
								EntryTime = 2000;
								Phase++;
								break;
							}
							case 8:
							{
								me->SummonCreature(82148, 1949.07f, 329.047f, 88.9664f, 2.38f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 24000);
								EntryTime = 2000;
								Phase++;
								break;
							}
							case 9:
							{
								if (Creature* foreman = me->SummonCreature(82098, 1949.07f, 329.047f, 88.9664f, 2.38f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 20000))
								{
									foreman->AI()->DoAction(0);
								}
								EntryTime = 1000;
								Phase++;
								break;
							}
							case 10:
							{
								if (Creature* packmule = me->SummonCreature(82099, 1949.07f, 329.047f, 88.9664f, 2.38f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 18000))
								{
									packmule->AI()->DoAction(0);
								}
								EntryTime = 2000;
								Phase++;
								break;
							}
							case 11:
							{
								if (Creature* baros = me->SummonCreature(79436, 1949.07f, 329.047f, 88.9664f, 2.38f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 18000))
								{
									baros->AI()->DoAction(0);
								}
								EntryTime = 1000;
								Phase++;
								break;
							}
							case 12:
							{
								me->CastStop();
								portal->SetVisible(false);
								EntryTime = 500;
								Phase++;
								break;
							}
							case 13:
							{
								me->GetMotionMaster()->MovePoint(1, 1943.910f, 339.194f, 89.015f, false);
								EntryTime = 3500;
								Phase++;
								break;
							}
							case 14:
							{
								me->SetFacingTo(4.303131f);
								EntryTime = 10500;
								Phase++;
								break;
							}
							case 15:
							{
								if (PlayerGUID)
								{
									if (Player* l_Player = me->GetPlayer(*me, PlayerGUID))
									{
										if (l_Player->HasQuest(eQuests::QuestForTheAlliance))
											l_Player->QuestObjectiveSatisfy(79433, 1);
										l_Player->CompleteQuest(eQuests::QuestForTheAlliance, false);
									}
								}

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

/// 79394 - Lunarfall 1 Guard
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
					me->GetMotionMaster()->MoveSmoothPath(0, g_Lunarfall1Moves.data(), g_Lunarfall1Moves.size(), false);
				});

				AddTimedDelayedOperation(5 * TimeConstants::IN_MILLISECONDS, [this]() -> void
				{
					me->SetFacingTo(1.71554f);
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

/// 79422 - Lunarfall 2 Guard
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
					me->GetMotionMaster()->MoveSmoothPath(0, g_Lunarfall2Moves.data(), g_Lunarfall2Moves.size(), false);
				});

				AddTimedDelayedOperation(3 * TimeConstants::IN_MILLISECONDS, [this]() -> void
				{
					me->SetFacingTo(1.71554f);
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

/// 82150 - Assistant Brightstone
class shadowmoon_assistant_brightstone : public CreatureScript
{
public:
	shadowmoon_assistant_brightstone() : CreatureScript("shadowmoon_assistant_brightstone") { }

	enum eAction
	{
		StartForTheAlliance = 0
	};

	struct shadowmoon_assistant_brightstoneAI : public ScriptedAI
	{
		shadowmoon_assistant_brightstoneAI(Creature* creature) : ScriptedAI(creature) { }

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
					me->GetMotionMaster()->MoveSmoothPath(0, g_BrightstoneMoves.data(), g_BrightstoneMoves.size(), true);
				});

				AddTimedDelayedOperation(29 * TimeConstants::IN_MILLISECONDS, [this]() -> void
				{
					me->CastSpell(me, 162443, true); // Sitting
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
		return new shadowmoon_assistant_brightstoneAI(creature);
	}

};

/// 79436 - Baros Alexstone
class shadowmoon_baros_alexstone : public CreatureScript
{
public:
	shadowmoon_baros_alexstone() : CreatureScript("shadowmoon_baros_alexstone") { }

	enum eAction
	{
		StartForTheAlliance = 0,
	};

	struct shadowmoon_baros_alexstoneAI : public ScriptedAI
	{
		shadowmoon_baros_alexstoneAI(Creature* creature) : ScriptedAI(creature) { }

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
					me->GetMotionMaster()->MoveSmoothPath(0, g_BarosAlexstoneMoves.data(), g_BarosAlexstoneMoves.size(), true);
				});

				AddTimedDelayedOperation(0.5 * TimeConstants::IN_MILLISECONDS, [this]() -> void
				{
					me->AI()->Talk(0);
				});

				AddTimedDelayedOperation(14 * TimeConstants::IN_MILLISECONDS, [this]() -> void
				{
					me->SetFacingTo(1.022766f);
					me->HandleEmoteCommand(483);
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
		return new shadowmoon_baros_alexstoneAI(creature);
	}

};

/// 79622 - Shelly Hamby
class shadowmoon_shelly_hamby : public CreatureScript
{
public:
	shadowmoon_shelly_hamby() : CreatureScript("shadowmoon_shelly_hamby") { }

	enum eAction
	{
		StartForTheAlliance = 0,
	};

	struct shadowmoon_shelly_hambyAI : public ScriptedAI
	{
		shadowmoon_shelly_hambyAI(Creature* creature) : ScriptedAI(creature) { }

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
					me->GetMotionMaster()->MoveSmoothPath(0, g_ShellyMoves.data(), g_ShellyMoves.size(), true);
				});

				AddTimedDelayedOperation(12.5 * TimeConstants::IN_MILLISECONDS, [this]() -> void
				{
					me->HandleEmoteCommand(586);
				});

				AddTimedDelayedOperation(15.5 * TimeConstants::IN_MILLISECONDS, [this]() -> void
				{
					me->CastSpell(me, 162443, true); // Sitting
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
		return new shadowmoon_shelly_hambyAI(creature);
	}

};

/// 79624 - Jarrod Hamby
class shadowmoon_jarrod_hamby : public CreatureScript
{
public:
	shadowmoon_jarrod_hamby() : CreatureScript("shadowmoon_jarrod_hamby") { }

	enum eAction
	{
		StartForTheAlliance = 0,
	};

	struct shadowmoon_jarrod_hambyAI : public ScriptedAI
	{
		shadowmoon_jarrod_hambyAI(Creature* creature) : ScriptedAI(creature) { }

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
					me->CastSpell(me, 156784, true); // Carrying wood
					me->GetMotionMaster()->MoveSmoothPath(0, g_JarrodMoves.data(), g_JarrodMoves.size(), true);
				});

				AddTimedDelayedOperation(10 * TimeConstants::IN_MILLISECONDS, [this]() -> void
				{
					me->HandleEmoteCommand(550); // Kneel
					me->RemoveAura(156784); // Remove wood
				});

				AddTimedDelayedOperation(10.5 * TimeConstants::IN_MILLISECONDS, [this]() -> void
				{
					me->SummonGameObject(230365, 1955.64f, 343.562f, 88.666f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0); // Summon wood
				});

				AddTimedDelayedOperation(12.5 * TimeConstants::IN_MILLISECONDS, [this]() -> void
				{
					me->SetFacingTo(4.65684f);
					me->HandleEmoteCommand(586);
				});

				AddTimedDelayedOperation(14.5 * TimeConstants::IN_MILLISECONDS, [this]() -> void
				{
					std::list<GameObject*> wood;
					GetClosestGameObjectWithEntry(me, 230365, 3.0f);

					for (GameObject* wood : wood)
						wood->RemoveFromWorld();

					me->SummonGameObject(253434, 1955.64f, 343.562f, 88.666f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0); // Summon campfire
				});

				AddTimedDelayedOperation(15.5 * TimeConstants::IN_MILLISECONDS, [this]() -> void
				{
					me->CastSpell(me, 162443, true); // Sitting
				});

				AddTimedDelayedOperation(18.5 * TimeConstants::IN_MILLISECONDS, [this]() -> void
				{
					std::list<GameObject*> campfire;
					GetClosestGameObjectWithEntry(me, 253434, 3.0f);

					for (GameObject* campfire : campfire)
						campfire->RemoveFromWorld();
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
		return new shadowmoon_jarrod_hambyAI(creature);
	}

};

/// 82151 - Dwarf Laborer
class shadowmoon_dwarf_laborer : public CreatureScript
{
public:
	shadowmoon_dwarf_laborer() : CreatureScript("shadowmoon_dwarf_laborer") { }

	enum eAction
	{
		StartForTheAlliance = 0,
	};

	struct shadowmoon_dwarf_laborerAI : public ScriptedAI
	{
		shadowmoon_dwarf_laborerAI(Creature* creature) : ScriptedAI(creature) { }

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
					me->CastSpell(me, 165284, true); // Carrying wood
					me->GetMotionMaster()->MoveSmoothPath(0, g_DwarfMoves.data(), g_DwarfMoves.size(), true);
				});

				AddTimedDelayedOperation(8 * TimeConstants::IN_MILLISECONDS, [this]() -> void
				{
					me->HandleEmoteCommand(550); // Kneel
					me->RemoveAura(165284); // Remove wood
				});

				AddTimedDelayedOperation(12.5 * TimeConstants::IN_MILLISECONDS, [this]() -> void
				{
					me->SetFacingTo(1.664478f);
					me->HandleEmoteCommand(586);
				});

				AddTimedDelayedOperation(15.5 * TimeConstants::IN_MILLISECONDS, [this]() -> void
				{
					me->CastSpell(me, 162443, true); // Sitting
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
		return new shadowmoon_dwarf_laborerAI(creature);
	}

};

/// 82154 - Starfall Sentinel
class shadowmoon_starfall1_sentinel : public CreatureScript
{
public:
	shadowmoon_starfall1_sentinel() : CreatureScript("shadowmoon_starfall1_sentinel") { }

	enum eAction
	{
		StartForTheAlliance0 = 0,
		StartForTheAlliance1 = 1
	};

	struct shadowmoon_starfall1_sentinelAI : public ScriptedAI
	{
		shadowmoon_starfall1_sentinelAI(Creature* creature) : ScriptedAI(creature) { }

		void Reset() override
		{
			ClearDelayedOperations();
		}

		void DoAction(int32 const p_Action) override
		{
			switch (p_Action)
			{
			case eAction::StartForTheAlliance0:
			{
				AddTimedDelayedOperation(0 * TimeConstants::IN_MILLISECONDS, [this]() -> void
				{
					me->GetMotionMaster()->MoveSmoothPath(0, g_Starfall0SentinelMoves.data(), g_Starfall0SentinelMoves.size(), false);
				});

				AddTimedDelayedOperation(8 * TimeConstants::IN_MILLISECONDS, [this]() -> void
				{
					me->HandleEmoteCommand(376);
				});
				break;
			}
			case eAction::StartForTheAlliance1:
			{
				AddTimedDelayedOperation(0 * TimeConstants::IN_MILLISECONDS, [this]() -> void
				{
					me->GetMotionMaster()->MoveSmoothPath(0, g_Starfall1SentinelMoves.data(), g_Starfall1SentinelMoves.size(), false);
				});

				AddTimedDelayedOperation(8 * TimeConstants::IN_MILLISECONDS, [this]() -> void
				{
					me->HandleEmoteCommand(384);
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
		return new shadowmoon_starfall1_sentinelAI(creature);
	}

};

/// 82152 - Lieutenant Thorn
class shadowmoon_lieutenant_thorn : public CreatureScript
{
public:
	shadowmoon_lieutenant_thorn() : CreatureScript("shadowmoon_lieutenant_thorn") { }

	enum eAction
	{
		StartForTheAlliance = 0
	};

	struct shadowmoon_lieutenant_thornAI : public ScriptedAI
	{
		shadowmoon_lieutenant_thornAI(Creature* creature) : ScriptedAI(creature) { }

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
					me->GetMotionMaster()->MoveSmoothPath(0, g_ThornMoves.data(), g_ThornMoves.size(), false);
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
		return new shadowmoon_lieutenant_thornAI(creature);
	}

};

/// 82149 - Human Laborer
class shadowmoon_human_laborer : public CreatureScript
{
public:
	shadowmoon_human_laborer() : CreatureScript("shadowmoon_human_laborer") { }

	enum eAction
	{
		StartForTheAlliance = 0
	};

	struct shadowmoon_human_laborerAI : public ScriptedAI
	{
		shadowmoon_human_laborerAI(Creature* creature) : ScriptedAI(creature) { }

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
					me->GetMotionMaster()->MoveSmoothPath(0, g_HumanMoves.data(), g_HumanMoves.size(), true);
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
		return new shadowmoon_human_laborerAI(creature);
	}

};

/// 82098 - Foreman Zipfizzle
class shadowmoon_foreman_zipfizzle : public CreatureScript
{
public:
	shadowmoon_foreman_zipfizzle() : CreatureScript("shadowmoon_foreman_zipfizzle") { }

	enum eAction
	{
		StartForTheAlliance = 0
	};

	struct shadowmoon_foreman_zipfizzleAI : public ScriptedAI
	{
		shadowmoon_foreman_zipfizzleAI(Creature* creature) : ScriptedAI(creature) { }

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
					me->GetMotionMaster()->MoveSmoothPath(0, g_ForemanMoves.data(), g_ForemanMoves.size(), true);
				});

				AddTimedDelayedOperation(1 * TimeConstants::IN_MILLISECONDS, [this]() -> void
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
		return new shadowmoon_foreman_zipfizzleAI(creature);
	}

};

/// 82099 - Garrison Packmule
class shadowmoon_packmule : public CreatureScript
{
public:
	shadowmoon_packmule() : CreatureScript("shadowmoon_packmule") { }

	enum eAction
	{
		StartForTheAlliance = 0
	};

	struct shadowmoon_packmuleAI : public ScriptedAI
	{
		shadowmoon_packmuleAI(Creature* creature) : ScriptedAI(creature) { }

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
					me->GetMotionMaster()->MoveSmoothPath(0, g_PackmuleMoves.data(), g_PackmuleMoves.size(), true);
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
		return new shadowmoon_packmuleAI(creature);
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

/// 334320 - Lumberjack Summoner 0
class shadowmoon_lumberjack_summoner0 : public CreatureScript
{
public:
	shadowmoon_lumberjack_summoner0() : CreatureScript("shadowmoon_lumberjack_summoner0") {}

	enum eEvents
	{
		Every40
	};

	struct shadowmoon_lumberjack_summoner0AI : public ScriptedAI
	{
		shadowmoon_lumberjack_summoner0AI(Creature* creature) : ScriptedAI(creature) {}

		EventMap m_CosmeticEvents;

		void Reset() override
		{
			m_CosmeticEvents.ScheduleEvent(eEvents::Every40, 36.5 * TimeConstants::IN_MILLISECONDS);
		}

		void UpdateAI(uint32 const p_Diff)
		{
			UpdateOperations(p_Diff);

			m_CosmeticEvents.Update(p_Diff);

			switch (m_CosmeticEvents.ExecuteEvent())
			{
			case eEvents::Every40:
			{
				AddTimedDelayedOperation(36.5 * TimeConstants::IN_MILLISECONDS, [this]() -> void
				{
					if (Creature* lumberjack = me->SummonCreature(79255, 1876.62f, 155.773f, 81.149f, 2.44779f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 60000))
					{
						lumberjack->AI()->DoAction(0);
					}
				});
			}
			}
		}
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new shadowmoon_lumberjack_summoner0AI(creature);
	}
};

/// 334321 - Lumberjack Summoner 1
class shadowmoon_lumberjack_summoner1 : public CreatureScript
{
public:
	shadowmoon_lumberjack_summoner1() : CreatureScript("shadowmoon_lumberjack_summoner1") {}

	enum eEvents
	{
		Every40
	};

	struct shadowmoon_lumberjack_summoner1AI : public ScriptedAI
	{
		shadowmoon_lumberjack_summoner1AI(Creature* creature) : ScriptedAI(creature) {}

		EventMap m_CosmeticEvents;

		void Reset() override
		{
			m_CosmeticEvents.ScheduleEvent(eEvents::Every40, 36.5 * TimeConstants::IN_MILLISECONDS);
		}

		void UpdateAI(uint32 const p_Diff)
		{
			UpdateOperations(p_Diff);

			m_CosmeticEvents.Update(p_Diff);

			switch (m_CosmeticEvents.ExecuteEvent())
			{
			case eEvents::Every40:
			{
				AddTimedDelayedOperation(36.5 * TimeConstants::IN_MILLISECONDS, [this]() -> void
				{
					if (Creature* lumberjack = me->SummonCreature(79255, 1910.03f, 220.645f, 76.746f, 2.64022f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 60000))
					{
						lumberjack->AI()->DoAction(1);
					}
				});
			}
			}
		}
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new shadowmoon_lumberjack_summoner1AI(creature);
	}
};

/// 334322 - Lumberjack Summoner 2
class shadowmoon_lumberjack_summoner2 : public CreatureScript
{
public:
	shadowmoon_lumberjack_summoner2() : CreatureScript("shadowmoon_lumberjack_summoner2") {}

	enum eEvents
	{
		Every40
	};

	struct shadowmoon_lumberjack_summoner2AI : public ScriptedAI
	{
		shadowmoon_lumberjack_summoner2AI(Creature* creature) : ScriptedAI(creature) {}

		EventMap m_CosmeticEvents;

		void Reset() override
		{
			m_CosmeticEvents.ScheduleEvent(eEvents::Every40, 36.5 * TimeConstants::IN_MILLISECONDS);
		}

		void UpdateAI(uint32 const p_Diff)
		{
			UpdateOperations(p_Diff);

			m_CosmeticEvents.Update(p_Diff);

			switch (m_CosmeticEvents.ExecuteEvent())
			{
			case eEvents::Every40:
			{
				AddTimedDelayedOperation(36.5 * TimeConstants::IN_MILLISECONDS, [this]() -> void
				{
					if (Creature* lumberjack = me->SummonCreature(79255, 1774.31f, 279.247f, 76.989f, 0.480363f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 60000))
					{
						lumberjack->AI()->DoAction(2);
					}
				});
			}
			}
		}
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new shadowmoon_lumberjack_summoner2AI(creature);
	}
};

/// 334323 - Lumberjack Summoner 3
class shadowmoon_lumberjack_summoner3 : public CreatureScript
{
public:
	shadowmoon_lumberjack_summoner3() : CreatureScript("shadowmoon_lumberjack_summoner3") {}

	enum eEvents
	{
		Every40
	};

	struct shadowmoon_lumberjack_summoner3AI : public ScriptedAI
	{
		shadowmoon_lumberjack_summoner3AI(Creature* creature) : ScriptedAI(creature) {}

		EventMap m_CosmeticEvents;

		void Reset() override
		{
			m_CosmeticEvents.ScheduleEvent(eEvents::Every40, 36.5 * TimeConstants::IN_MILLISECONDS);
		}

		void UpdateAI(uint32 const p_Diff)
		{
			UpdateOperations(p_Diff);

			m_CosmeticEvents.Update(p_Diff);

			switch (m_CosmeticEvents.ExecuteEvent())
			{
			case eEvents::Every40:
			{
				AddTimedDelayedOperation(36.5 * TimeConstants::IN_MILLISECONDS, [this]() -> void
				{
					if (Creature* lumberjack = me->SummonCreature(79255, 1832.55f, 205.811f, 73.047f, 1.33252f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 60000))
					{
						lumberjack->AI()->DoAction(3);
					}
				});
			}
			}
		}
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new shadowmoon_lumberjack_summoner3AI(creature);
	}
};

/// 79255 - Lumberjack
class shadowmoon_lumberjack : public CreatureScript
{
public:
	shadowmoon_lumberjack() : CreatureScript("shadowmoon_lumberjack") { }

	enum eAction
	{
		BringLumber0 = 0,
		BringLumber1 = 1,
		BringLumber2 = 2,
		BringLumber3 = 3,
	};

	struct shadowmoon_lumberjackAI : public ScriptedAI
	{
		shadowmoon_lumberjackAI(Creature* creature) : ScriptedAI(creature) { }

		void Reset() override
		{
			ClearDelayedOperations();
		}

		void DoAction(int32 const p_Action) override
		{
			switch (p_Action)
			{
			case eAction::BringLumber0:
			{
				AddTimedDelayedOperation(0 * TimeConstants::IN_MILLISECONDS, [this]() -> void
				{
					me->CastSpell(me, 156784, true); // Carrying wood
					me->GetMotionMaster()->MoveSmoothPath(0, g_Lumberjack0Moves.data(), g_Lumberjack0Moves.size(), true);
				});

				AddTimedDelayedOperation(35 * TimeConstants::IN_MILLISECONDS, [this]() -> void
				{
					me->HandleEmoteCommand(550); // Kneel
					me->RemoveAura(156784); // Remove wood
				});

				AddTimedDelayedOperation(36.5 * TimeConstants::IN_MILLISECONDS, [this]() -> void
				{
					me->GetMotionMaster()->MoveSmoothPath(0, g_LumberjackGoMoves.data(), g_LumberjackGoMoves.size(), true);
				});
				break;
			}
			case eAction::BringLumber1:
			{
				AddTimedDelayedOperation(0 * TimeConstants::IN_MILLISECONDS, [this]() -> void
				{
					me->CastSpell(me, 156784, true); // Carrying wood
					me->GetMotionMaster()->MoveSmoothPath(0, g_Lumberjack1Moves.data(), g_Lumberjack1Moves.size(), true);
				});

				AddTimedDelayedOperation(35 * TimeConstants::IN_MILLISECONDS, [this]() -> void
				{
					me->HandleEmoteCommand(550); // Kneel
					me->RemoveAura(156784); // Remove wood
				});

				AddTimedDelayedOperation(36.5 * TimeConstants::IN_MILLISECONDS, [this]() -> void
				{
					me->GetMotionMaster()->MoveSmoothPath(0, g_LumberjackGoMoves.data(), g_LumberjackGoMoves.size(), true);
				});
				break;
			}
			case eAction::BringLumber2:
			{
				AddTimedDelayedOperation(0 * TimeConstants::IN_MILLISECONDS, [this]() -> void
				{
					me->CastSpell(me, 156784, true); // Carrying wood
					me->GetMotionMaster()->MoveSmoothPath(0, g_Lumberjack2Moves.data(), g_Lumberjack2Moves.size(), true);
				});

				AddTimedDelayedOperation(35 * TimeConstants::IN_MILLISECONDS, [this]() -> void
				{
					me->HandleEmoteCommand(550); // Kneel
					me->RemoveAura(156784); // Remove wood
				});

				AddTimedDelayedOperation(36.5 * TimeConstants::IN_MILLISECONDS, [this]() -> void
				{
					me->GetMotionMaster()->MoveSmoothPath(0, g_LumberjackGoMoves.data(), g_LumberjackGoMoves.size(), true);
				});
				break;
			}
			case eAction::BringLumber3:
			{
				AddTimedDelayedOperation(0 * TimeConstants::IN_MILLISECONDS, [this]() -> void
				{
					me->CastSpell(me, 156784, true); // Carrying wood
					me->GetMotionMaster()->MoveSmoothPath(0, g_Lumberjack3Moves.data(), g_Lumberjack3Moves.size(), true);
				});

				AddTimedDelayedOperation(35 * TimeConstants::IN_MILLISECONDS, [this]() -> void
				{
					me->HandleEmoteCommand(550); // Kneel
					me->RemoveAura(156784); // Remove wood
				});

				AddTimedDelayedOperation(36.5 * TimeConstants::IN_MILLISECONDS, [this]() -> void
				{
					me->GetMotionMaster()->MoveSmoothPath(0, g_LumberjackGoMoves.data(), g_LumberjackGoMoves.size(), true);
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
		return new shadowmoon_lumberjackAI(creature);
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
				if (l_Target->GetEntry() == eCreature::JuicyMushroomA
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

/// 76386 - Yrel (A Hero's Welcome)
class shadowmoon_yrel_welcome : public CreatureScript
{
public:
	shadowmoon_yrel_welcome() : CreatureScript("shadowmoon_yrel_welcome") { }

	enum eAction
	{
		StartFindingAFoothold = 0
	};

	enum eMoves
	{
		StartQuestMove = 0
	};

	struct shadowmoon_yrel_welcomeAI : public ScriptedAI
	{
		shadowmoon_yrel_welcomeAI(Creature* creature) : ScriptedAI(creature)
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
		return new shadowmoon_yrel_welcomeAI(creature);
	}

};

void AddSC_draenor_shadowmoon_valley()
{
	/// ---- To Do: Swap inaccurate Smart Scripts for these ones: https://github.com/AshamaneProject/AshamaneCore/blob/master/src/server/scripts/Draenor/zone_shadowmoon_dreanor.cpp
	/// Phase Handler
	new playerScript_shadowmoon_phase_handler();

	/// Npcs
	
	/// Eventide Beach
	new shadowmoon_prophet_velen_eventide_questgiver();
	new shadowmoon_yrel_eventide();
	new shadowmoon_maraad_eventide();
	new shadowmoon_khadgar_eventide();

	/// Lunarfall (Pre-Garrison)
	new shadowmoon_maraad_lunarfall();
	new shadowmoon_velen_lunarfall();
	new shadowmoon_khadgar_lunarfall();
	new shadowmoon_lunarfall1_guard();
	new shadowmoon_lunarfall2_guard();
	new shadowmoon_assistant_brightstone();
	new shadowmoon_baros_alexstone();
	new shadowmoon_shelly_hamby();
	new shadowmoon_jarrod_hamby();
	new shadowmoon_human_laborer();
	new shadowmoon_dwarf_laborer();
	new shadowmoon_starfall1_sentinel();
	new shadowmoon_lieutenant_thorn();
	new shadowmoon_foreman_zipfizzle();
	new shadowmoon_packmule();
	new shadowmoon_lumberjack_summoner0();
	new shadowmoon_lumberjack_summoner1();
	new shadowmoon_lumberjack_summoner2();
	new shadowmoon_lumberjack_summoner3();
	new shadowmoon_lumberjack();

	/// Embaari Village
	new shadowmoon_yrel_welcome();

	/// Objects
	
	/// Lunarfall (Pre-Garrison)
	new gob_alliance_banner_230280();
	new gob_alliance_tree_marking_230335();

	/// Shadowmoon Valley World Quest
	new spell_quest_shadowmoon_squeezing();
}