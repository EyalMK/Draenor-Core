///////////////////////////////////////////////////////////////////////////////
///
///  MILLENIUM-STUDIO
///  Copyright 2016 Millenium-studio SARL
///  All Rights Reserved.
///
///////////////////////////////////////////////////////////////////////////////

#include "boss_archimonde_hfc.h"
#include "hellfire_citadel.h"

/// Archimonde <The Defiler> - 91331
class boss_archimonde_hfc : public CreatureScript
{
public:
	boss_archimonde_hfc() : CreatureScript("boss_archimonde_hfc") {}

	enum EquipId
	{
		EquipMace = 123973
	};

	enum eTalks
	{
		TalkIntro0 = 0,
		TalkIntro2,
		TalkAggro,
		TalkDoomfire,
		TalkDeathBrand,
		TalkShadowfelBurst,
		TalkAllureofFlames,
		Talk85,
		Talk75,
		TalkPhase2,
		TalkShackledTorment,
		TalkWroughtChaos,
		Talk55,
		TalkPhase3,
		Talk22,
		TalkNetherBanish,
		TalkSlay,
		TalkRainofChaos,
		TalkSeethingCorruption,
		TalkGrommash,
		TalkMarkoftheLegion,
		TalkSourceofChaos,
		TalkNetherAscension,
		TalkWipe,
		TalkIntro1
	};

	enum ePhases
	{
		TheDefiler,
		HandoftheLegion,
		TheTwistingNether
	};

	enum eSpells
	{
		// Intro
		IntroMovie = 189672, // Sends everyone the movie

		// Doomfire
		Doomfire = 189897, // Doomfire visual cast (We gotta make it spawn the Doomfire Spirit)
		DoomfireVisual = 188586,
		DoomfireFixate = 182879,
		DoomfireArea = 182878,
		DoomfireDebuff = 183586, // Doomfire debuff
		AllureofFlames = 183254,

		// Shadowfel Burst
		ShadowfelBurstCast = 183817,
		ShadowfelBurstDebuff = 183634,
		ShadowfelBurstSplit = 183795,
		ShadowfelBurstVisual = 189430, // AoE visual on the floor

		// Death Brand
		DeathBrand = 183828, // Both cast and debuff
		DeathBrandVisual = 187622, // Summons the add

		// Desecrate
		Desecrate = 185590,
		DesecrationPre = 191068,
		DesecrationCreate = 183969,
		DesecrationCreateBlast = 184023,
		DesecrationPush = 188614, // Deals dmg
		DesecrationRays = 184753,
		LightoftheNaaruCast = 183943, // Casted by Yrel to break the pilar
		LightoftheNaaru = 183963, // Area and debuff
		DesecrationBreakBlast = 189890,
		DesecrationBreak = 187937,
		PurifyingLight = 183962, // Casted by Yrel to make the pilars disappear
		DesecrationVanish = 190037,

		// Rain of Chaos
		RainofChaos = 182225,
		RainofChaosVisual = 190053,
		RainofChaosSummoning = 187108,
		InfernalVisual = 187111,
		Hellfire = 187078,
		EternalFlame = 187053,

		// Nether Banish
		NetherBanish = 186961, // Cast and debuff
		NetherPortal = 186951, // Nether Portal visual
		NetherTear = 189891,  // Damage debuff from Nether Portal

		// Nether Realm
		NetherBanishDebuff = 186952,
		DarkPursuit = 190018, // Movement speed 50% increased (no idea when casted)
		NetherStorm = 187254, // Something about Areatrigger
		TouchofShadows = 190050, // Casted every 20 (starting at 10)
		CollapsingVoid = 188267, // Casted when 0% hp

		// Void Star
		VoidStar = 189894, // Void star visual
		VoidStarFixate = 189895,
		VoidDetonation = 189896, // Used when reaches the target

		// Mythic
		Transformation = 190310,

		// Outro
		OutroMovie = 189790, // Sends everyone the movie
		ArchimondeBonusLoot = 188984
	};

	enum eEvents
	{
		EventCheckPlayerIntro,
		EventDoomfire,
		EventAllureofFlames,
		EventShadowfelBurst,
		EventDeathBrand,
		EventDesecrate,
		EventShackledTorment,
		EventVanguardoftheLegion,
		EventDemonicFeedback,
		EventNetherBanish,
		EventRainofChaos
	};

	enum eTimers
	{
		// Phase 1 - The Defiler
		TimerDoomfire = 6 * TimeConstants::IN_MILLISECONDS,
		TimerDoomfireCD = 44 * TimeConstants::IN_MILLISECONDS,
		TimerAllureofFlames = 30 * TimeConstants::IN_MILLISECONDS,
		TimerAllureofFlamesCD = 48 * TimeConstants::IN_MILLISECONDS,
		TimerShadowfelBurst = 43 * TimeConstants::IN_MILLISECONDS,
		TimerShadowfelBurstCD = 60 * TimeConstants::IN_MILLISECONDS,
		TimerDeathBrand = 15 * TimeConstants::IN_MILLISECONDS,
		TimerDeathBrandCD = 45 * TimeConstants::IN_MILLISECONDS,
		TimerDesecrateCD = 26 * TimeConstants::IN_MILLISECONDS,

		// Phase 2 - Hand of the Legion
		TimerShackledTorment = 27 * TimeConstants::IN_MILLISECONDS,
		TimerShackledTormentCD = 32 * TimeConstants::IN_MILLISECONDS,
		TimerVanguardoftheLegion = 30 * TimeConstants::IN_MILLISECONDS,
		TimerVanguardoftheLegionCD = 48 * TimeConstants::IN_MILLISECONDS,

		// Phase 3 - The Twisting Nether
		TimerDemonicFeedback = 35 * TimeConstants::IN_MILLISECONDS,
		TimerDemonicFeedbackCD = 37 * TimeConstants::IN_MILLISECONDS,
		TimerNetherBanish = 13 * TimeConstants::IN_MILLISECONDS,
		TimerNetherBanishCD = 61 * TimeConstants::IN_MILLISECONDS,
		TimerRainofChaos = 60 * TimeConstants::IN_MILLISECONDS,
		TimerRainofChaosCD = 60 * TimeConstants::IN_MILLISECONDS

	};

	struct boss_archimonde_hfcAI : public BossAI
	{
		boss_archimonde_hfcAI(Creature* p_Creature) : BossAI(p_Creature, eCitadelDatas::DataArchimonde)
		{
			m_Instance = p_Creature->GetInstanceScript();
			m_IntroDone = false;
		}

		InstanceScript* m_Instance;

		std::list<uint64> m_Creatures;

		EventMap m_Events;
		EventMap m_CosmeticEvents;

		bool m_Enabled;
		bool m_IntroDone;
		bool m_InCombat;

		uint8 m_PhaseID;

		bool CanRespawn() override
		{
			return false;
		}

		void Reset() override
		{
			m_InCombat = false;

			m_Events.Reset();
			m_CosmeticEvents.Reset();

			ClearDelayedOperations();

			me->RemoveAllAreasTrigger();
			summons.DespawnAll();

			PreSummonDraenorHelp();

			me->SetReactState(ReactStates::REACT_AGGRESSIVE);

			me->AddUnitState(UnitState::UNIT_STATE_IGNORE_PATHFINDING);

			SetEquipmentSlots(false, EquipMace, 0, 0);

			m_Events.SetPhase(ePhases::TheDefiler);

			me->RemoveAura(eCitadelSpells::Berserker);

			m_PhaseID = ePhases::TheDefiler;

			me->SetDisableGravity(true);

			if (!m_IntroDone)
				m_CosmeticEvents.ScheduleEvent(eEvents::EventCheckPlayerIntro, 1 * TimeConstants::IN_MILLISECONDS);

			if (m_Instance != nullptr)
			{
				m_Instance->SendEncounterUnit(EncounterFrameType::ENCOUNTER_FRAME_DISENGAGE, me);
			}
		}

		void JustReachedHome() override
		{
			Reset();
			m_Events.Reset();

			if (m_Enabled)
				Talk(eTalks::TalkWipe);

			if (m_Instance != nullptr)
				m_Instance->SendEncounterUnit(EncounterFrameType::ENCOUNTER_FRAME_DISENGAGE, me);
			    m_Instance->SetBossState(eCitadelDatas::DataArchimonde, EncounterState::FAIL);
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

			Talk(eTalks::TalkAggro);

			if (m_Instance != nullptr)
			{
				m_Instance->SendEncounterUnit(EncounterFrameType::ENCOUNTER_FRAME_ENGAGE, me, 1);
				m_Instance->SetBossState(eCitadelDatas::DataArchimonde, EncounterState::IN_PROGRESS);
			}

			m_Events.Reset();
			m_Events.SetPhase(ePhases::TheDefiler);

			m_Events.ScheduleEvent(eEvents::EventDoomfire, eTimers::TimerDoomfire, 0, ePhases::TheDefiler);
			m_Events.ScheduleEvent(eEvents::EventAllureofFlames, eTimers::TimerAllureofFlames, 0, ePhases::TheDefiler);
			m_Events.ScheduleEvent(eEvents::EventShadowfelBurst, eTimers::TimerShadowfelBurst, 0, ePhases::TheDefiler);
			m_Events.ScheduleEvent(eEvents::EventDeathBrand, eTimers::TimerDeathBrand, 0, ePhases::TheDefiler);
		}

		void EnterEvadeMode() override
		{
			me->NearTeleportTo(me->GetHomePosition());

			RemoveCombatAurasAndTriggers();

			summons.DespawnAll();

			me->InterruptNonMeleeSpells(true);

			/// Just in case, to prevent the fail Return to Home
			me->ClearUnitState(UnitState::UNIT_STATE_ROOT);
			me->ClearUnitState(UnitState::UNIT_STATE_DISTRACTED);
			me->ClearUnitState(UnitState::UNIT_STATE_STUNNED);
			
			CreatureAI::EnterEvadeMode();

			if (m_Instance != nullptr)
			{
				m_Instance->SetBossState(eCitadelDatas::DataArchimonde, EncounterState::FAIL);

				m_Instance->SendEncounterUnit(EncounterFrameType::ENCOUNTER_FRAME_DISENGAGE, me);
			}
		}

		void JustDied(Player* p_Player)
		{
			_JustDied();

			summons.DespawnAll();

			RemoveCombatAurasAndTriggers();

			if (m_Instance != nullptr)
			{
				m_Instance->SendEncounterUnit(EncounterFrameType::ENCOUNTER_FRAME_DISENGAGE, me);
				m_Instance->SetBossState(eCitadelDatas::DataArchimonde, EncounterState::DONE);

				/// Allow loots and bonus loots to be enabled/disabled with a simple reload
				if (sObjectMgr->IsDisabledEncounter(m_Instance->GetEncounterIDForBoss(me), GetDifficulty()))
					me->SetLootRecipient(nullptr);
				else
					CastSpellToPlayers(me->GetMap(), me, eSpells::ArchimondeBonusLoot, true);
			}

			if (InstanceScript* m_Instance = me->GetInstanceScript())
			{
				if (Creature* l_Archimonde = m_Instance->instance->GetCreature(m_Instance->GetData64(eCitadelDatas::DataArchimonde)))
				{
					std::list<Player*> l_ListPlayers;
					me->GetPlayerListInGrid(l_ListPlayers, 600.0f, true);
					if (!l_ListPlayers.empty())
					{
						for (Player* l_Itr : l_ListPlayers)
						{
							if (!l_Itr)
								continue;

							l_Itr->CastSpell(l_Itr, eSpells::OutroMovie, true);
						}
					}

					std::list<Creature*> l_TheBlackGate;
					me->GetCreatureListWithEntryInGrid(l_TheBlackGate, eArchimondeCreatures::TheBlackGateC, 500.0f);
					if (l_TheBlackGate.front() != nullptr)
						l_TheBlackGate.front()->AI()->DoAction(eArchimondeActions::Ending);
				}
			}
		}

		void UpdateAI(uint32 const p_Diff) override
		{
			UpdateOperations(p_Diff);

			m_CosmeticEvents.Update(p_Diff);

			switch (m_CosmeticEvents.ExecuteEvent())
			{
				case eEvents::EventCheckPlayerIntro:
				{
					DoAction(eArchimondeActions::ArchimondeIntro);

					// Gate object opening
					std::list<Creature*> l_TheBlackGate;
					me->GetCreatureListWithEntryInGrid(l_TheBlackGate, eArchimondeCreatures::TheBlackGateC, 1000.0f);
					if (l_TheBlackGate.front() != nullptr)
						l_TheBlackGate.front()->AI()->DoAction(eArchimondeActions::BlackGateIntro);

					// Guldan AI start
					std::list<Creature*> l_Guldan;
					me->GetCreatureListWithEntryInGrid(l_Guldan, eArchimondeCreatures::Guldan, 1000.0f);
					if (l_Guldan.front() != nullptr)
						l_Guldan.front()->AI()->DoAction(eArchimondeActions::GuldanIntro);
				}
			}

			if (!UpdateVictim())
				return;

			m_Events.Update(p_Diff);

			if (me->HasUnitState(UnitState::UNIT_STATE_CASTING))
				return;

			switch (m_Events.ExecuteEvent())
			{
				case eEvents::EventDoomfire:
				{
					me->CastSpell(me, eSpells::Doomfire, true);

					AddTimedDelayedOperation(1.6 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						if (Unit* l_Target = SelectRangedTarget())
						{
							Position l_Pos = *l_Target;

							l_Target->GetNearPoint(l_Pos, 0.0f, frand(5.0f, 10.0f), frand(0.0f, 2.0f * M_PI));
							me->SummonCreature(eArchimondeCreatures::DoomfireSpirit, l_Pos);
						}
					});

					m_Events.ScheduleEvent(eEvents::EventDoomfire, eTimers::TimerDoomfireCD, 0, m_PhaseID);
					break;
				}
				default:
					break;
			}

			DoMeleeAttackIfReady();
		}

		void DoAction(int32 const p_Action) override
		{
			switch (p_Action)
			{
				case eArchimondeActions::ArchimondeIntro:
				{
					if (m_IntroDone)
						break;

					m_IntroDone = true;

					if (m_Instance != nullptr)
						m_Instance->instance->SetObjectVisibility(500.0f);

					m_Instance->DoCastSpellOnPlayers(eSpells::IntroMovie);

					AddTimedDelayedOperation(60 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						Talk(eTalks::TalkIntro0);
					});

					AddTimedDelayedOperation(70 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						Talk(eTalks::TalkIntro1);
					});

					AddTimedDelayedOperation(92 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						Talk(eTalks::TalkIntro2);
					});

					break;
				}
				default:
					break;
			}
		}

		void DamageTaken(Unit* /*p_Attacker*/, uint32& p_Damage, SpellInfo const* /*p_SpellInfo*/) override
		{
			/// Don't handle last phase, it lasts until death
			if (m_PhaseID >= (eArchimondeDatas::MaxPhases - 1))
				return;

			if (me->HealthBelowPctDamaged(g_ArchimondePhaseSwitchPcts[m_PhaseID], p_Damage))
			{
				switch (m_PhaseID)
				{
				case ePhases::TheDefiler:
				{
					Talk(eTalks::TalkPhase2);

					m_Events.CancelEvent(eEvents::EventDoomfire);
					m_Events.CancelEvent(eEvents::EventShadowfelBurst);
					m_Events.CancelEvent(eEvents::EventDesecrate);

					m_Events.SetPhase(ePhases::HandoftheLegion);

					m_Events.ScheduleEvent(eEvents::EventShackledTorment, eTimers::TimerShackledTorment, 0, ePhases::HandoftheLegion);
					m_Events.ScheduleEvent(eEvents::EventVanguardoftheLegion, eTimers::TimerVanguardoftheLegionCD, 0, ePhases::HandoftheLegion);
					break;
				}
				case ePhases::HandoftheLegion:
				{
					Talk(eTalks::TalkPhase3);

					m_Events.CancelEvent(eEvents::EventAllureofFlames);
					m_Events.CancelEvent(eEvents::EventDeathBrand);

					m_Events.SetPhase(ePhases::TheTwistingNether);

					m_Events.ScheduleEvent(eEvents::EventDemonicFeedback, eTimers::TimerDemonicFeedback, 0, ePhases::TheTwistingNether);
					m_Events.ScheduleEvent(eEvents::EventNetherBanish, eTimers::TimerNetherBanishCD, 0, ePhases::TheTwistingNether);
					m_Events.ScheduleEvent(eEvents::EventRainofChaos, eTimers::TimerRainofChaos, 0, ePhases::TheTwistingNether);
					break;
				}
				default:
					break;
				}

				++m_PhaseID;
			}
		}

		void RemoveCombatAurasAndTriggers()
		{
			if (m_Instance != nullptr)
				return;

			me->DespawnCreaturesInArea(g_EntriesToDespawn, 300.0f);

			m_Instance->DoRemoveAurasDueToSpellOnPlayers(eSpells::DoomfireFixate);
			m_Instance->DoRemoveAurasDueToSpellOnPlayers(eSpells::DoomfireDebuff);
			m_Instance->DoRemoveAurasDueToSpellOnPlayers(eSpells::DeathBrand);
			m_Instance->DoRemoveAurasDueToSpellOnPlayers(eSpells::ShadowfelBurstDebuff);
			m_Instance->DoRemoveAurasDueToSpellOnPlayers(eSpells::ShadowfelBurstDebuff);
			m_Instance->DoRemoveAurasDueToSpellOnPlayers(eSpells::ShadowfelBurstDebuff);
			m_Instance->DoRemoveAurasDueToSpellOnPlayers(eSpells::ShadowfelBurstDebuff);
			m_Instance->DoRemoveAurasDueToSpellOnPlayers(eSpells::ShadowfelBurstDebuff);
			m_Instance->DoRemoveAurasDueToSpellOnPlayers(eSpells::ShadowfelBurstDebuff);
			m_Instance->DoRemoveAurasDueToSpellOnPlayers(eSpells::ShadowfelBurstDebuff);
		}

		void PreSummonDraenorHelp()
		{
			/// Khadgar, Yrel and Grommash are spawned at reset
			for (uint8 l_I = 0; l_I < eArchimondeDatas::MaxSpawnPoints; ++l_I)
			{
				if (Creature* l_Khadgar = me->SummonCreature(eArchimondeCreatures::Khadgar, g_KhadgarSpawnPos[l_I]))
				{
					uint64 l_Guid = l_Khadgar->GetGUID();
				}
				if (Creature* l_Yrel = me->SummonCreature(eArchimondeCreatures::Yrel, g_YrelSpawnPos[l_I]))
				{
					uint64 l_Guid = l_Yrel->GetGUID();
				}
				if (Creature* l_Grommash = me->SummonCreature(eArchimondeCreatures::Grommash, g_GrommashSpawnPos[l_I]))
				{
					uint64 l_Guid = l_Grommash->GetGUID();
				}
			}
		}
	};

	CreatureAI* GetAI(Creature* p_Creature) const override
	{
		return new boss_archimonde_hfcAI(p_Creature);
	}
};

/// 98232 - The Black Gate
class npc_citadel_the_black_gate : public CreatureScript
{
public:
	npc_citadel_the_black_gate() : CreatureScript("npc_citadel_the_black_gate") {}

	enum eEvents
	{

	};

	enum BlackgateMovie
	{
		MovieArchimondeDefeated = 295
	};

	enum eSpells
	{
		ActivateBlackGate = 187003,
		SceneIntro = 189672, // They affect the whole party
		SceneOutro = 189790 // They affect the whole party
	};

	struct npc_citadel_the_black_gateAI : public ScriptedAI
	{
		npc_citadel_the_black_gateAI(Creature* p_Creature) : ScriptedAI(p_Creature)
		{
			m_Instance = p_Creature->GetInstanceScript();
		}

		bool m_EndDone;
		bool m_IntroDone;

		EventMap m_Events;
		EventMap m_CosmeticEvents;

		InstanceScript* m_Instance;

		void Reset() override
		{
		}

		void DoAction(int32 const p_Action) override
		{
			switch (p_Action)
			{
				case eArchimondeActions::BlackGateIntro:
				{
					if (m_IntroDone)
						break;

					m_IntroDone = true;

					AddTimedDelayedOperation(1 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->CastSpell(me, eSpells::ActivateBlackGate, true);
					});
					break;
				}
				case eArchimondeActions::Ending:
				{
					if (m_EndDone)
						break;

					m_EndDone = true;

					std::list<Player*> PlayersInRange;
					me->GetPlayerListInGrid(PlayersInRange, 50000.0f);
					for (Player* p_Player : PlayersInRange)
					{
						p_Player->NearTeleportTo(4073.8337f, -2186.1813f, 51.147f, 4.67f);
					}
					break;
				}
				default:
					break;
			}
		}

		void UpdateAI(uint32 const p_Diff) override
		{
			UpdateOperations(p_Diff);

			m_CosmeticEvents.Update(p_Diff);

			m_Events.Update(p_Diff);

			switch (m_CosmeticEvents.ExecuteEvent())
			{
			}

			if (!UpdateVictim())
				return;

			m_Events.Update(p_Diff);
		}
	};

	CreatureAI* GetAI(Creature* p_Creature) const override
	{
		return new npc_citadel_the_black_gateAI(p_Creature);
	}
};


/// Gul'Dan - 93926
class npc_citadel_guldan : public CreatureScript
{
public:
	npc_citadel_guldan() : CreatureScript("npc_citadel_guldan") {}

	enum eEvents
	{
		EventCheckPlayerIntro,
	};

	enum eTalks
	{
		TalkIntro0,
		TalkIntro1,
		TalkIntro2
	};

	enum eMoves
	{
		GuldanChannel
	};

	enum eSpells
	{
		PortalVisual = 187028,
		ShieldVisual = 184538,
		Hover = 138092
	};

	struct npc_citadel_guldanAI : public ScriptedAI
	{
		npc_citadel_guldanAI(Creature* p_Creature) : ScriptedAI(p_Creature) 
		{
			m_Instance = p_Creature->GetInstanceScript();
		}

		bool m_IntroDone;

		EventMap m_Events;
		EventMap m_CosmeticEvents;

		InstanceScript* m_Instance;

		void Reset() override
		{
			me->SetReactState(ReactStates::REACT_PASSIVE);
			me->SetFlag(EUnitFields::UNIT_FIELD_FLAGS, eUnitFlags::UNIT_FLAG_IMMUNE_TO_PC | eUnitFlags::UNIT_FLAG_NON_ATTACKABLE | eUnitFlags::UNIT_FLAG_IMMUNE_TO_NPC);
		}

		void DoAction(int32 const p_Action) override
		{
			switch (p_Action)
			{
				case eArchimondeActions::GuldanIntro:
				{
					if (m_IntroDone)
						break;

					m_IntroDone = true;

					AddTimedDelayedOperation(35 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						Talk(eTalks::TalkIntro0);
					});
	
					AddTimedDelayedOperation(52 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						Talk(eTalks::TalkIntro1);
					});

					AddTimedDelayedOperation(85 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						Talk(eTalks::TalkIntro2);
						me->SetSpeed(UnitMoveType::MOVE_FLIGHT, 1.2f);
						me->AddUnitMovementFlag(MovementFlags::MOVEMENTFLAG_DISABLE_GRAVITY);
					});
	
					AddTimedDelayedOperation(90 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->CastSpell(me, eSpells::Hover, true);
						me->CastSpell(me, eSpells::ShieldVisual, true);
						me->GetMotionMaster()->MoveSmoothFlyPath(eMoves::GuldanChannel, g_FlyingMoves.data(), g_FlyingMoves.size());
					});

					AddTimedDelayedOperation(97 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->CastSpell(me, eSpells::PortalVisual, true);
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

			m_CosmeticEvents.Update(p_Diff);

			m_Events.Update(p_Diff);

			switch (m_CosmeticEvents.ExecuteEvent())
			{

			}

			if (!UpdateVictim())
				return;

			m_Events.Update(p_Diff);
		}
	};

	CreatureAI* GetAI(Creature* p_Creature) const override
	{
		return new npc_citadel_guldanAI(p_Creature);
	}
};

/// Archmage Khadgar - 94142
class npc_citadel_khadgar_fight : public CreatureScript
{
public:
	npc_citadel_khadgar_fight() : CreatureScript("npc_citadel_khadgar_fight") {}

	enum eEvents
	{

	};

	enum eTalks
	{

	};

	enum eMoves
	{

	};

	enum eSpells
	{
		ArcaneBlast = 189304,
		ArcaneMissiles = 189362,
		ArcaneBarrage = 189358,
		TimeWarp = 189359
	};

	struct npc_citadel_khadgar_fightAI : public ScriptedAI
	{
		npc_citadel_khadgar_fightAI(Creature* p_Creature) : ScriptedAI(p_Creature)
		{
			m_Instance = p_Creature->GetInstanceScript();
		}

		std::list<uint64> m_Creatures;

		bool HasATarget;
		bool m_DraenorHelpKhadgarDone;

		EventMap m_Events;

		InstanceScript* m_Instance;

		void Reset() override
		{
			me->SetFlag(EUnitFields::UNIT_FIELD_FLAGS, eUnitFlags::UNIT_FLAG_IMMUNE_TO_PC | eUnitFlags::UNIT_FLAG_NON_ATTACKABLE | eUnitFlags::UNIT_FLAG_IMMUNE_TO_NPC);
			HasATarget = false;
		}

		void EnterCombat(Unit* /*p_Attacker*/) override
		{

			if (m_Instance != nullptr)
				m_Instance->SendEncounterUnit(EncounterFrameType::ENCOUNTER_FRAME_ENGAGE, me, 2);

			DoZoneInCombat(me, 100.0f);
		}

		void DamageTaken(Unit* doneBy, uint32& damage, SpellInfo const*  /*p_SpellInfo*/)
		{
			if (doneBy->ToCreature())
				if (me->GetHealth() <= damage || me->GetHealthPct() <= 100.0f)
					damage = 0;
		}

		void DamageDealt(Unit* target, uint32& damage, DamageEffectType /*damageType*/)
		{
			if (target->ToCreature())
				if (target->GetHealth() <= damage || target->GetHealthPct() <= 100.0f)
					damage = 0;
		}

		void DoAction(int32 const p_Action) override
		{
			switch (p_Action)
			{
				case eArchimondeActions::DraenorHelpKhadgarStart:
				{
					if (m_DraenorHelpKhadgarDone)
					break;

					m_DraenorHelpKhadgarDone = true;

					AddTimedDelayedOperation(1 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{

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
		}
	};

	CreatureAI* GetAI(Creature* p_Creature) const override
	{
		return new npc_citadel_khadgar_fightAI(p_Creature);
	}
};

/// Exarch Yrel - 92769
class npc_citadel_yrel_fight : public CreatureScript
{
public:
	npc_citadel_yrel_fight() : CreatureScript("npc_citadel_yrel_fight") {}

	enum eEvents
	{

	};

	enum eTalks
	{

	};

	enum eMoves
	{

	};

	enum eSpells
	{
		HolySchock = 189290,
		FlashofLight = 189289,
		AvengingWrath = 189292
	};

	struct npc_citadel_yrel_fightAI : public ScriptedAI
	{
		npc_citadel_yrel_fightAI(Creature* p_Creature) : ScriptedAI(p_Creature)
		{
			m_Instance = p_Creature->GetInstanceScript();
		}

		bool HasATarget;
		bool m_DraenorHelpYrelDone;

		std::list<uint64> m_Creatures;

		EventMap m_Events;

		InstanceScript* m_Instance;

		void Reset() override
		{
			me->SetFlag(EUnitFields::UNIT_FIELD_FLAGS, eUnitFlags::UNIT_FLAG_IMMUNE_TO_PC | eUnitFlags::UNIT_FLAG_NON_ATTACKABLE | eUnitFlags::UNIT_FLAG_IMMUNE_TO_NPC);
			HasATarget = false;
		}

		void EnterCombat(Unit* /*p_Attacker*/) override
		{

			if (m_Instance != nullptr)
				m_Instance->SendEncounterUnit(EncounterFrameType::ENCOUNTER_FRAME_ENGAGE, me, 2);

			DoZoneInCombat(me, 100.0f);
		}

		void DamageTaken(Unit* doneBy, uint32& damage, SpellInfo const*  /*p_SpellInfo*/)
		{
			if (doneBy->ToCreature())
				if (me->GetHealth() <= damage || me->GetHealthPct() <= 100.0f)
					damage = 0;
		}

		void DamageDealt(Unit* target, uint32& damage, DamageEffectType /*damageType*/)
		{
			if (target->ToCreature())
				if (target->GetHealth() <= damage || target->GetHealthPct() <= 100.0f)
					damage = 0;
		}

		void DoAction(int32 const p_Action) override
		{
			switch (p_Action)
			{
				case eArchimondeActions::DraenorHelpYrelStart:
				{
					if (m_DraenorHelpYrelDone)
						break;

					m_DraenorHelpYrelDone = true;

					AddTimedDelayedOperation(1 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{

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
		}
	};

	CreatureAI* GetAI(Creature* p_Creature) const override
	{
		return new npc_citadel_yrel_fightAI(p_Creature);
	}
};

/// Grommash Hellscream - 93618
class npc_citadel_grommash_fight : public CreatureScript
{
public:
	npc_citadel_grommash_fight() : CreatureScript("npc_citadel_grommash_fight") {}

	enum eEvents
	{

	};

	enum eTalks
	{

	};

	enum eMoves
	{

	};

	enum eSpells
	{
		MortalStrike = 189301,
		DragonRoar = 189302,
		Bladestorm = 189300,
		Bloodlust = 189303,
		Jump = 190734
	};

	struct npc_citadel_grommash_fightAI : public ScriptedAI
	{
		npc_citadel_grommash_fightAI(Creature* p_Creature) : ScriptedAI(p_Creature)
		{
			m_Instance = p_Creature->GetInstanceScript();
		}

		bool HasATarget;
		bool m_DraenorHelpGrommashDone;

		std::list<uint64> m_Creatures;

		EventMap m_Events;

		InstanceScript* m_Instance;

		void Reset() override
		{
			me->SetFlag(EUnitFields::UNIT_FIELD_FLAGS, eUnitFlags::UNIT_FLAG_IMMUNE_TO_PC | eUnitFlags::UNIT_FLAG_NON_ATTACKABLE | eUnitFlags::UNIT_FLAG_IMMUNE_TO_NPC);
			HasATarget = false;
		}

		void EnterCombat(Unit* /*p_Attacker*/) override
		{

			if (m_Instance != nullptr)
				m_Instance->SendEncounterUnit(EncounterFrameType::ENCOUNTER_FRAME_ENGAGE, me, 2);

			DoZoneInCombat(me, 100.0f);
		}

		void DamageTaken(Unit* doneBy, uint32& damage, SpellInfo const*  /*p_SpellInfo*/)
		{
			if (doneBy->ToCreature())
				if (me->GetHealth() <= damage || me->GetHealthPct() <= 100.0f)
					damage = 0;
		}

		void DamageDealt(Unit* target, uint32& damage, DamageEffectType /*damageType*/)
		{
			if (target->ToCreature())
				if (target->GetHealth() <= damage || target->GetHealthPct() <= 100.0f)
					damage = 0;
		}

		void DoAction(int32 const p_Action) override
		{
			switch (p_Action)
			{
				case eArchimondeActions::DraenorHelpGrommashStart:
				{
					if (m_DraenorHelpGrommashDone)
						break;

					m_DraenorHelpGrommashDone = true;

					AddTimedDelayedOperation(1 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{

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
		}
	};

	CreatureAI* GetAI(Creature* p_Creature) const override
	{
		return new npc_citadel_grommash_fightAI(p_Creature);
	}
};

/// Doomfire Spirit - 92208
class npc_citadel_doomfire_spirit : public CreatureScript
{
public:
	npc_citadel_doomfire_spirit() : CreatureScript("npc_citadel_doomfire_spirit") { }

	enum eSpells
	{
		DoomfireVisual = 188586
	};

	struct npc_citadel_doomfire_spiritAI : public ScriptedAI
	{
		npc_citadel_doomfire_spiritAI(Creature* p_Creature) : ScriptedAI(p_Creature) { }

		void Reset() override
		{
			me->SetReactState(ReactStates::REACT_PASSIVE);

			me->CastSpell(me, eSpells::DoomfireVisual, true);
		}

		void JustSummoned(Creature* p_Summon) override
		{
			me->CastSpell(me, eSpells::DoomfireVisual, true);
		}
	};

	CreatureAI* GetAI(Creature* p_Creature) const override
	{
		return new npc_citadel_doomfire_spiritAI(p_Creature);
	}
};

/// Doomfire Stalker - 92442
class npc_citadel_doomfire_stalker : public CreatureScript
{
public:
	npc_citadel_doomfire_stalker() : CreatureScript("npc_citadel_doomfire_stalker") { }

	enum eSpells
	{
		DoomfireFixate = 182879,
		DoomfireArea = 182878
	};

	struct npc_citadel_doomfire_stalkerAI : public ScriptedAI
	{
		npc_citadel_doomfire_stalkerAI(Creature* p_Creature) : ScriptedAI(p_Creature)
		{
			m_Instance = p_Creature->GetInstanceScript();
		}

		InstanceScript* m_Instance;

		uint64 m_Target;

		void Reset() override
		{
			me->SetReactState(ReactStates::REACT_PASSIVE);

			me->AddUnitState(UnitState::UNIT_STATE_IGNORE_PATHFINDING);

			me->RemoveFlag(EUnitFields::UNIT_FIELD_FLAGS_2, eUnitFlags2::UNIT_FLAG2_REGENERATE_POWER);

			m_Target = 0;
		}

		void SpellHitTarget(Unit* p_Target, SpellInfo const* p_SpellInfo) override
		{
			if (p_Target == nullptr)
				return;

			switch (p_SpellInfo->Id)
			{
			case eSpells::DoomfireFixate:
			{
				m_Target = p_Target->GetGUID();

				DoResetThreat();
				me->AddThreat(p_Target, 1000000.0f);

				AttackStart(p_Target);

				me->ClearUnitState(UnitState::UNIT_STATE_CASTING);
				break;
			}
			default:
				break;
			}
		}

		void EnterCombat(Unit* /*p_Attacker*/) override
		{
			if (me->GetReactState() == ReactStates::REACT_PASSIVE)
				return;

			if (m_Instance != nullptr)
				m_Instance->SendEncounterUnit(EncounterFrameType::ENCOUNTER_FRAME_ENGAGE, me, 2);

			DoZoneInCombat(me, 100.0f);

			me->CastSpell(me, eSpells::DoomfireFixate, true);
		}

		void JustDied(Unit* /*p_Killer*/) override
		{
			if (m_Instance != nullptr)
				m_Instance->SendEncounterUnit(EncounterFrameType::ENCOUNTER_FRAME_DISENGAGE, me);
		}

		void UpdateAI(uint32 const p_Diff) override
		{
			UpdateOperations(p_Diff);

			if (me->HasUnitState(UnitState::UNIT_STATE_CASTING))
				return;

			if (Player* l_Target = Player::GetPlayer(*me, m_Target))
			{
				if (!l_Target->isAlive())
				{
					m_Target = 0;
					me->CastSpell(me, eSpells::DoomfireFixate, true);
					return;
				}

				if (!me->IsWithinMeleeRange(l_Target))
				{
					me->SetWalk(true);
					me->GetMotionMaster()->MovePoint(0, *l_Target);
				}
			}
		}
	};

	CreatureAI* GetAI(Creature* p_Creature) const override
	{
		return new npc_citadel_doomfire_stalkerAI(p_Creature);
	}
};

// 189358 - Arcane Barrage
class spell_citadel_arcane_barrage : public SpellScript
{
	PrepareSpellScript(spell_citadel_arcane_barrage);

	void HandleTargets(std::list<WorldObject*>& targets) 
	{
		if (targets.empty())
			return;

		Unit* Caster = GetCaster();
		if (!Caster)
			return;

		targets.remove_if([](WorldObject* target) -> bool
		{
			return target->IsPlayer() || !target->GetEntry() == 91331;
		});
	}

	void Register() override
	{
		OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_citadel_arcane_barrage::HandleTargets, EFFECT_0, TARGET_UNIT_SRC_AREA_ENTRY);
	}
};

// 189362 - Arcane Missiles
class spell_citadel_arcane_missiles : public SpellScript
{
	PrepareSpellScript(spell_citadel_arcane_missiles);

	void HandleTargets(std::list<WorldObject*>& targets)
	{
		if (targets.empty())
			return;

		Unit* Caster = GetCaster();
		if (!Caster)
			return;

		targets.remove_if([](WorldObject* target) -> bool
		{
			return target->IsPlayer() || !target->GetEntry() == 91331;
		});
	}

	void Register() override
	{
		OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_citadel_arcane_missiles::HandleTargets, EFFECT_0, TARGET_UNIT_SRC_AREA_ENTRY);
	}
};

// 189304 - Arcane Blast
class spell_citadel_arcane_blast : public SpellScript
{
	PrepareSpellScript(spell_citadel_arcane_blast);

	void HandleTargets(std::list<WorldObject*>& targets)
	{
		if (targets.empty())
			return;

		Unit* Caster = GetCaster();
		if (!Caster)
			return;

		targets.remove_if([](WorldObject* target) -> bool
		{
			return target->IsPlayer() || !target->GetEntry() == 91331;
		});
	}

	void Register() override
	{
		OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_citadel_arcane_blast::HandleTargets, EFFECT_0, TARGET_UNIT_SRC_AREA_ENTRY);
	}
};

// 189300 - Bladestorm
class spell_citadel_bladestorm : public SpellScript
{
	PrepareSpellScript(spell_citadel_bladestorm);

	void HandleTargets(std::list<WorldObject*>& targets)
	{
		if (targets.empty())
			return;

		Unit* Caster = GetCaster();
		if (!Caster)
			return;

		targets.remove_if([](WorldObject* target) -> bool
		{
			return target->IsPlayer() || !target->GetEntry() == 91331;
		});
	}

	void Register() override
	{
		OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_citadel_bladestorm::HandleTargets, EFFECT_0, TARGET_UNIT_SRC_AREA_ENTRY);
	}
};

// 189301 - Mortal Strike
class spell_citadel_mortal_strike : public SpellScript
{
	PrepareSpellScript(spell_citadel_mortal_strike);

	void HandleTargets(std::list<WorldObject*>& targets)
	{
		if (targets.empty())
			return;

		Unit* Caster = GetCaster();
		if (!Caster)
			return;

		targets.remove_if([](WorldObject* target) -> bool
		{
			return target->IsPlayer() || !target->GetEntry() == 91331;
		});
	}

	void Register() override
	{
		OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_citadel_mortal_strike::HandleTargets, EFFECT_0, TARGET_UNIT_SRC_AREA_ENTRY);
	}
};

// 189302 - Dragon Roar
class spell_citadel_dragon_roar : public SpellScript
{
	PrepareSpellScript(spell_citadel_dragon_roar);

	void HandleTargets(std::list<WorldObject*>& targets)
	{
		if (targets.empty())
			return;

		Unit* Caster = GetCaster();
		if (!Caster)
			return;

		targets.remove_if([](WorldObject* target) -> bool
		{
			return target->IsPlayer() || !target->GetEntry() == 91331;
		});
	}

	void Register() override
	{
		OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_citadel_dragon_roar::HandleTargets, EFFECT_0, TARGET_UNIT_SRC_AREA_ENTRY);
	}
};

// 189289 - Flash of Light
class spell_citadel_flash_of_light : public SpellScript
{
	PrepareSpellScript(spell_citadel_flash_of_light);

	void HandleTargets(std::list<WorldObject*>& targets)
	{
		if (targets.empty())
			return;

		Unit* Caster = GetCaster();
		if (!Caster)
			return;

		targets.remove_if([](WorldObject* target) -> bool
		{
			return target->IsPlayer() || !target->GetEntry() == 94142 || !target->GetEntry() == 92769 || !target->GetEntry() == 93618;
		});
	}

	void Register() override
	{
		OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_citadel_flash_of_light::HandleTargets, EFFECT_0, TARGET_UNIT_SRC_AREA_ENTRY);
	}
};

// 189290 - Holy Shock
class spell_citadel_holy_shock : public SpellScript
{
	PrepareSpellScript(spell_citadel_holy_shock);

	void HandleTargets(std::list<WorldObject*>& targets)
	{
		if (targets.empty())
			return;

		Unit* Caster = GetCaster();
		if (!Caster)
			return;

		targets.remove_if([](WorldObject* target) -> bool
		{
			return target->IsPlayer() || !target->GetEntry() == 91331;
		});
	}

	void Register() override
	{
		OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_citadel_holy_shock::HandleTargets, EFFECT_0, TARGET_UNIT_SRC_AREA_ENTRY);
	}
};

// 189292 - Avenging Wrath
class spell_citadel_avenging_wrath : public SpellScript
{
	PrepareSpellScript(spell_citadel_avenging_wrath);

	void Register() override
	{
	}
};

#ifndef __clang_analyzer__
void AddSC_boss_archimonde_hfc()
{
	/// Boss
	new boss_archimonde_hfc();

	/// Creatures
	new npc_citadel_doomfire_spirit();
	new npc_citadel_doomfire_stalker();

		/// Cosmetic ones
	new npc_citadel_the_black_gate();
	new npc_citadel_guldan();

	new npc_citadel_khadgar_fight();
	new npc_citadel_yrel_fight();
	new npc_citadel_grommash_fight();

	/*new npc_citadel_kirin_tor_portal_arch();
	new npc_citadel_kirin_tor_mage_arch();
	new npc_citadel_frostwolf_warrior_arch();
	new npc_citadel_karabor_vindicator_arch();*/

	/// Spells


		/// Cosmetic ones
	new spell_citadel_arcane_barrage();
	new spell_citadel_arcane_missiles();
	new spell_citadel_arcane_blast();

	new spell_citadel_bladestorm();
	new spell_citadel_dragon_roar();
	new spell_citadel_mortal_strike();

	new spell_citadel_flash_of_light();
	new spell_citadel_holy_shock();
	new spell_citadel_avenging_wrath();

	/// AreaTriggers (Spells)

	/// AreaTriggers (Area)
}
#endif