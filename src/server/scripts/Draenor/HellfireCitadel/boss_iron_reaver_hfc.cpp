///////////////////////////////////////////////////////////////////////////////
///
///  MILLENIUM-STUDIO
///  Copyright 2016 Millenium-studio SARL
///  All Rights Reserved.
///
///////////////////////////////////////////////////////////////////////////////

#include "boss_iron_reaver_hfc.h"
#include "hellfire_citadel.h"

/*
hover -> stand 164126 
*/

/// Iron Reaver - 90284
class boss_iron_reaver_hfc : public CreatureScript
{
public:
	boss_iron_reaver_hfc() : CreatureScript("boss_iron_reaver_hfc") {}

	enum eTalks
	{
		TalkIntro			= 0,
		TalkAggro			= 1,
		TalkSlay			= 2,
		TalkWipe			= 3,
		TalkDeath			= 4
	};

	enum ePhases
	{
		GroundOperation		= 0,
		AirOperation		= 1
	};

	enum eSpells
	{
		CosmeticDeactivated			= 186246,
		CosmeticBarrage				= 186274, // It must trigger the missiles yet
		CosmeticCastUnstableOrb		= 187172, // Casted on walls to create them
		CosmeticUnstableOrb			= 185250,

		AirPhase					= 186443,
		GroundPhase					= 181923,

		// Falling Slam (cosmetic)
		CosmeticSlamCast			= 186449,
		CosmeticSlamDmg				= 186445,

		// Immolation
		ImmolationCast				= 179896,
		ImmolationMissile			= 182048,
		ImmolationDebuff			= 182074,
		ImmolationTrigger			= 182075,

		// Barrage
		BarrageCast					= 185282,
		BarrageDmg					= 185284,

		// Pounding
		PoundingCast				= 182020,

		// Falling Slam
		SlamCast					= 182066,
		SlamDmg						= 182370,

		IronReaverBonusLoot			= 188973
	};

	enum eCosmeticEvents
	{
		EventActivate = 0,
	};

	enum eEvents
	{
		EventRegenerateEnergy = 1
	};

	enum eTimers
	{

	};

	enum eMoves
	{
		IntroMove = 0
	};

	enum eActions
	{
		Activate = 0
	};

	struct boss_iron_reaver_hfcAI : public BossAI
	{
		boss_iron_reaver_hfcAI(Creature* p_Creature) : BossAI(p_Creature, eCitadelDatas::DataReaver)
		{
			m_Instance = p_Creature->GetInstanceScript();
			m_Intro = false;
			m_Paused = false;
		}

		InstanceScript* m_Instance;

		std::list<uint64> m_Creatures;

		EventMap m_Events;
		EventMap m_CosmeticEvents;

		uint8 m_PhaseID;
		uint8 m_RegenCycle;

		bool m_Intro;
		bool m_Paused;

		void Reset() override
		{
			m_Events.Reset();
			m_CosmeticEvents.Reset();

			ClearDelayedOperations();

			me->RemoveAllAreasTrigger();
			summons.DespawnAll();

			me->SetReactState(ReactStates::REACT_AGGRESSIVE);

			_Reset();

			me->setPowerType(Powers::POWER_RAGE);
			me->SetMaxPower(Powers::POWER_RAGE, 100);
			me->SetPower(Powers::POWER_RAGE, 0);

			m_RegenCycle = 1;

			me->RemoveFlag(EUnitFields::UNIT_FIELD_FLAGS_2, eUnitFlags2::UNIT_FLAG2_REGENERATE_POWER);

			m_Events.SetPhase(ePhases::GroundOperation);

			me->RemoveAura(eCitadelSpells::Berserker);
			
			if (m_Intro == true)
			{
				me->HandleEmoteCommand(333);
			}

			if (m_Intro == false)
			{
				me->SetDisableGravity(true);
				me->AddAura(eSpells::CosmeticDeactivated, me);
			}

			m_PhaseID = ePhases::GroundOperation;

			if (m_Instance != nullptr)
			{
				m_Instance->SendEncounterUnit(EncounterFrameType::ENCOUNTER_FRAME_DISENGAGE, me);
			}
		}

		void DespawnGameObjects(uint32 entry, float distance)
		{
			std::list<GameObject*> gameobjects;
			GetGameObjectListWithEntryInGrid(gameobjects, me, entry, distance);

			if (gameobjects.empty())
				return;

			for (std::list<GameObject*>::iterator iter = gameobjects.begin(); iter != gameobjects.end(); ++iter)
				(*iter)->RemoveFromWorld();
		}

		void JustReachedHome() override
		{
			Reset();
			m_Events.Reset();

			DespawnGameObjects(242365, 600.0f);
			DespawnGameObjects(242364, 600.0f);

			Talk(eTalks::TalkWipe);

			if (m_Instance != nullptr)
				m_Instance->SendEncounterUnit(EncounterFrameType::ENCOUNTER_FRAME_DISENGAGE, me);

			m_Instance->SetBossState(eCitadelDatas::DataReaver, EncounterState::FAIL);
		}

		void KilledUnit(Unit* p_Who) override
		{
			if (!p_Who->IsPlayer())
				return;

			Talk(eTalks::TalkSlay);
		}

		void EnterCombat(Unit* /*p_Attacker*/) override
		{
			_EnterCombat();

			me->SetWalk(false);

			ClearDelayedOperations();

			me->CastSpell(me, eSpells::CosmeticCastUnstableOrb, false);

			Talk(eTalks::TalkAggro);

			AddTimedDelayedOperation(4 * TimeConstants::IN_MILLISECONDS, [this]() -> void
			{
				me->SummonGameObject(242365, 4051.5f, -723.789f, 39.5595f, 4.70284f, 0.0f, 0.0f, 0.0f, 0.0f, 0); // Summon left
				me->SummonGameObject(242364, 3990.67f, -725.45f, 33.6644f, 1.62371f, 0.0f, 0.0f, 0.0f, 0.0f, 0); // Summon left center
				me->SummonGameObject(242364, 3951.63f, -727.518f, 33.1712f, 1.62371f, 0.0f, 0.0f, 0.0f, 0.0f, 0); // Summon right center
				me->SummonGameObject(242365, 3879.25f, -728.536f, 37.5222f, 4.72246f, 0.0f, 0.0f, 0.0f, 0.0f, 0); // Summon right
			});

			if (m_Instance != nullptr)
			{
				m_Instance->SendEncounterUnit(EncounterFrameType::ENCOUNTER_FRAME_ENGAGE, me, 1);
				m_Instance->SetBossState(eCitadelDatas::DataReaver, EncounterState::IN_PROGRESS);
			}

			m_CosmeticEvents.ScheduleEvent(eEvents::EventRegenerateEnergy, 1000);
		}

		void JustDied(Player* p_Player)
		{
			_JustDied();

			Talk(eTalks::TalkDeath);

			summons.DespawnAll();

			DespawnGameObjects(242365, 600.0f);
			DespawnGameObjects(242364, 600.0f);

			RemoveCombatAurasAndTriggers();

			if (m_Instance != nullptr)
			{
				m_Instance->SendEncounterUnit(EncounterFrameType::ENCOUNTER_FRAME_DISENGAGE, me);
				m_Instance->SetBossState(eCitadelDatas::DataReaver, EncounterState::DONE);

				/// Allow loots and bonus loots to be enabled/disabled with a simple reload
				if (sObjectMgr->IsDisabledEncounter(m_Instance->GetEncounterIDForBoss(me), GetDifficulty()))
					me->SetLootRecipient(nullptr);
				else
					CastSpellToPlayers(me->GetMap(), me, eSpells::IronReaverBonusLoot, true);
			}
		}

		bool OnTaunt(Unit* /*p_Taunter*/) override
		{
			return !m_Paused;
		}

		void RegeneratePower(Powers p_Power, int32& p_Value)
		{
			/// Regens manually
			p_Value = 0;
		}

		void UpdateAI(uint32 const p_Diff) override
		{
			UpdateOperations(p_Diff);
			m_CosmeticEvents.Update(p_Diff);
			m_Events.Update(p_Diff);

			switch (m_CosmeticEvents.ExecuteEvent())
			{
				case eEvents::EventRegenerateEnergy:
				{
					int32 l_Power = 0;

					switch (m_PhaseID)
					{
						case ePhases::GroundOperation:
						{
							l_Power = g_IronReaverRegenCyclesP1[m_RegenCycle++];

							if (m_RegenCycle >= eIronReaverDatas::MaxRegenCyclesP1)
								m_RegenCycle = 0;

							break;
						}
						case ePhases::AirOperation:
						{
							l_Power = 0;
							break;
						}
					default:
						break;
					}

					me->ModifyPower(Powers::POWER_RAGE, l_Power);

					m_CosmeticEvents.ScheduleEvent(eEvents::EventRegenerateEnergy, 1000);
					break;
				}
			default:
				break;
			}

			if (!UpdateVictim())
				return;

			if (me->HasUnitState(UnitState::UNIT_STATE_CASTING))
				return;

			switch (m_Events.ExecuteEvent())
			{
				
			default:
				break;
			}

			DoMeleeAttackIfReady();
		}

		void DoAction(int32 const p_Action) override
		{
			switch (p_Action)
			{
				case eActions::Activate:
				{
					if (m_Intro)
						return;

					m_Paused = true;
					m_Intro = true;

					AddTimedDelayedOperation(0 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						if (GameObject* l_Door = GameObject::GetGameObject(*me, m_Instance->GetData64(eCitadelGameObjects::ReinforcedHellfireDoor)))
							l_Door->SetGoState(GOState::GO_STATE_ACTIVE_ALTERNATIVE);

						me->SetDisableGravity(true);
						me->SetReactState(ReactStates::REACT_PASSIVE);
						me->SetFlag(EUnitFields::UNIT_FIELD_FLAGS_2, eUnitFlags2::UNIT_FLAG2_UNK12); // NOT TARGETABLE

						// 3941.7290, -452.9753, 10.1180 (this is the point where the he comes from the elevator) 

						me->SetSpeed(UnitMoveType::MOVE_RUN, 0.4f, true);
						me->GetMotionMaster()->MovePoint(1, 3941.7290f, -452.9760f, 37.1992f, false);
					});

					AddTimedDelayedOperation(10 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->RemoveFlag(EUnitFields::UNIT_FIELD_FLAGS_2, eUnitFlags2::UNIT_FLAG2_UNK12);
						me->RemoveAura(eSpells::CosmeticDeactivated); // Activate
						me->SetDisableGravity(false);
					});

					AddTimedDelayedOperation(14 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->HandleEmoteCommand(333);
					});

					AddTimedDelayedOperation(14.5 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->SetSpeed(UnitMoveType::MOVE_RUN, 1.0f, true);
						me->GetMotionMaster()->MovePoint(1, 3942.3887f, -532.9827f, 36.8767f, false);
					});

					AddTimedDelayedOperation(16 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						Talk(eTalks::TalkIntro);
					});

					AddTimedDelayedOperation(17 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->CastSpell(me, eSpells::CosmeticBarrage, false);
					});

					AddTimedDelayedOperation(26.5 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->SetOrientation(4.857939f);
						// channel center
					});

					AddTimedDelayedOperation(28.5 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->SetOrientation(5.415565f);
						// channel left
					});

					AddTimedDelayedOperation(30.5 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->SetOrientation(4.182491f);
						//channel right
					});

					AddTimedDelayedOperation(32.5 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->SetOrientation(4.857939f);
						// channel cannons
					});

					AddTimedDelayedOperation(35 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->SetDisableGravity(true);
						me->SetCanFly(true);
						me->CastSpell(me, eSpells::AirPhase);
						me->SetSpeed(UnitMoveType::MOVE_FLIGHT, 3.0f, true);
					});

					AddTimedDelayedOperation(35.5 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						// me->GetMotionMaster()->MoveSmoothFlyPath(eMoves::IntroMove, g_IronReaverIntroMoves.data(), g_IronReaverIntroMoves.size()); // Move front
						me->GetMotionMaster()->MoveSmoothFlyPath(0, g_MidPos); // Move front
					});

					AddTimedDelayedOperation(40 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->CastSpell(me, eSpells::CosmeticSlamCast, false);
					});

					AddTimedDelayedOperation(41.5 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->SetDisableGravity(false);
						me->SetCanFly(false);
						me->RemoveAura(eSpells::AirPhase);
						me->CastSpell(me, eSpells::GroundPhase, true);
						me->CastSpell(g_FloorJumpPos, eSpells::CosmeticSlamDmg, false);
						me->SetHomePosition(g_FloorJumpPos);
					});

					AddTimedDelayedOperation(42 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->SetSpeed(UnitMoveType::MOVE_RUN, 3.0f, true);
						me->SetReactState(ReactStates::REACT_AGGRESSIVE);
						me->HandleEmoteCommand(333);
						m_Paused = false;
					});
					break;
				}
			default:
				break;
			}
		}

		void RemoveCombatAurasAndTriggers()
		{
			if (m_Instance != nullptr)
				return;
		}

		void OnSpellCasted(SpellInfo const* p_SpellInfo) override
		{
			switch (p_SpellInfo->Id)
			{
				case eSpells::CosmeticCastUnstableOrb:
				{
					// Left
					me->CastSpell(500000, 182095, false);
					me->CastSpell(500000, 182095, false);
					me->CastSpell(500000, 182095, false);
					me->CastSpell(500000, 182095, false);
					me->CastSpell(500000, 182095, false);
					me->CastSpell(500000, 182095, false);

					// Left center
					me->CastSpell(500001, 182095, false);
					me->CastSpell(500001, 182095, false);
					me->CastSpell(500001, 182095, false);
					me->CastSpell(500001, 182095, false);
					me->CastSpell(500001, 182095, false);
					me->CastSpell(500001, 182095, false);

					// Right center
					me->CastSpell(500002, 182095, false);
					me->CastSpell(500002, 182095, false);
					me->CastSpell(500002, 182095, false);
					me->CastSpell(500002, 182095, false);
					me->CastSpell(500002, 182095, false);
					me->CastSpell(500002, 182095, false);

					// Right
					me->CastSpell(500003, 182095, false);
					me->CastSpell(500003, 182095, false);
					me->CastSpell(500003, 182095, false);
					me->CastSpell(500003, 182095, false);
					me->CastSpell(500003, 182095, false);
					me->CastSpell(500003, 182095, false);
				}
			}
		}
	};

	CreatureAI* GetAI(Creature* p_Creature) const override
	{
		return new boss_iron_reaver_hfcAI(p_Creature);
	}
};

/// HFC Trigger - 400000
class npc_hfc_trigger : public CreatureScript
{
public:
	npc_hfc_trigger() : CreatureScript("npc_hfc_trigger") { }

	enum eActions
	{
		Activate = 0
	};

	bool OnGossipHello(Player* p_Player, Creature* p_Creature)
	{
		p_Player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Activate Iron Reaver.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
		p_Player->SEND_GOSSIP_MENU(1, p_Creature->GetGUID());

		return true;
	}

	bool OnGossipSelect(Player* p_Player, Creature* p_Creature, uint32 /*sender*/, uint32 p_Action) override
	{
		if (p_Action == GOSSIP_ACTION_INFO_DEF + 1)
		{
			p_Creature->CastSpell(p_Creature, 28730, true);

			p_Creature->Say(400000, 0, 0);

			std::list<Creature*> l_ReaverList;
			p_Creature->GetCreatureListWithEntryInGrid(l_ReaverList, eCitadelCreatures::BossReaver, 1000.0f);

			for (Creature* l_Reaver : l_ReaverList)
			{
				if (l_Reaver->IsAIEnabled)
					l_Reaver->AI()->DoAction(eActions::Activate);
			}

			p_Player->PlayerTalkClass->SendCloseGossip();
		}

		return true;
	}
};

#ifndef __clang_analyzer__
void AddSC_boss_iron_reaver_hfc()
{
	/// Boss
	new boss_iron_reaver_hfc();

	/// Creatures
	new npc_hfc_trigger();

			/// Cosmetic ones

	/// Spells

			/// Cosmetic ones

	/// AreaTriggers (Spells)

	/// AreaTriggers (Area)
}
#endif