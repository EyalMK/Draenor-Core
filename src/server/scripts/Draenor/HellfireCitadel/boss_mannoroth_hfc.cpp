///////////////////////////////////////////////////////////////////////////////
///
///  MILLENIUM-STUDIO
///  Copyright 2016 Millenium-studio SARL
///  All Rights Reserved.
///
///////////////////////////////////////////////////////////////////////////////

#include "boss_mannoroth_hfc.h"

/// Mannoroth <The Destroyer> - 91349
class boss_mannoroth_hfc : public CreatureScript
{
public:
	boss_mannoroth_hfc() : CreatureScript("boss_mannoroth_hfc") {}

	enum eActions
	{
		RedSpire,
		PurpleSpire,
		GreenSpire,
		ActionAppear,
		ActionStartPhase2,

		ActionFelImplosion,
		ActionCurseoftheLegion
	};

	enum eTalks
	{
		TalkPhase2,
		TalkPhase3,
		TalkPhase4,
		TalkPhase4b,
		TalkSlay = 14,
		TalkDeath = 15,
		TalkWipe
	};

	enum ePhases
	{
		TheLegionsMight = 1,     // Phase 1 lasts until the three Fel Iron Summoners are killed.
		TheResurrection,         // Phase 2 lasts from 100 % to 65 %.
		TruePower,               // Phase 3 lasts from 65 % to 30 %.
		Empowerment,             // Phase 4 lasts from 30 % to death.
	};

	enum eMoves
	{
		MoveTank = 1
	};

	enum eSpells
	{
		// Generic
		GreenPower = 182274,
		MannorothBlood = 182168, // Areatrigger
		TransformP2 = 186966,
		TransformP3 = 182263,
		TransformP4 = 185690,
		SkyboxPart4 = 188781, // Must add as aura
		MannorothBonusLoot = 188983,

		// Glaive Combo
		GlaiveCombo = 181354,
		GlaiveThrustCast = 183377,
		GlaiveThrust = 181358,
		MassiveBlastCast = 183376,
		MassiveBlast = 181359,

		// Fel Hellstorm
		FelHellstormCast = 181557,

		// Felseeker
		Felseeker = 181735,
		Felseeker1 = 181793,
		Felseeker2 = 181792,
		Felseeker3 = 181738,

		// Mannoroth's Gaze
		MannorothGazeCast = 181597, // Cast and debuff
		MannorothGazeDmg = 181617,

		// Empowered Glaive Combo
		EmpoweredGlaiveCombo = 187347,
		EmpoweredGlaiveThrustCast = 185831,
		EmpoweredGlaiveThrust = 185847,
		EmpoweredMassiveBlastCast = 185830,
		EmpoweredMassiveBlast = 185826,
		EmpoweredMassiveBlastWaveVisual = 185821, // Three of these, areatriggers
		EmpoweredMassiveBlastWave = 189424, // Dmg and knockback
		EmpoweredMassiveBlastStun = 191581
	};

	enum eEvents
	{
		// Phase 1
		EventCurseoftheLegion,
		EventFelImplosion,
		EventInferno,

		// Start Phase 2
		EventForm2,
		EventAttackable2,
		EventAggresive2,
		EventTalk2,

		// Phase 2 and 3
		EventGlaiveCombo,
		EventGlaiveThrust,
		EventGlaiveThrustDmg,
		EventMassiveBlast,
		EventMassiveBlastDmg,
		EventFelHellstorm,
		EventMannorothGaze,
		EventFelseeker,

		// Start Phase 3
		EventForm3,
		EventAggresive3,
		EventTalk3,

		// Addition to phase 3
		EventShadowForce,

		// Start Phase 4
		EventTalk4,
		EventForm4,
		EventAggresive4,

		// Phase 4
		EventEmpoweredGlaiveCombo,
		EventEmpoweredGlaiveThrust,
		EventEmpoweredGlaiveThrustDmg,
		EventEmpoweredMassiveBlast,
		EventEmpoweredMassiveBlastDmg,
		EventEmpoweredFelHellstorm,
		EventEmpoweredMannorothGaze,
		EventEmpoweredFelseeker,
		EventEmpoweredShadowForce,

		// Generic
		EventBerserker,
		EventRegenerateEnergy
	};

	enum eDatas
	{
		SummonerKilled
	};

	struct boss_mannoroth_hfcAI : public BossAI
	{
		boss_mannoroth_hfcAI(Creature* p_Creature) : BossAI(p_Creature, eCitadelDatas::DataMannoroth)
		{
			m_Instance = p_Creature->GetInstanceScript();
		}

		InstanceScript* m_Instance;

		EventMap m_Events;
		EventMap m_CosmeticEvents;

		uint8 m_SummonerKilled;
		uint8 m_RegenCycle;

		bool m_Paused;
		bool m_Phase2;
		bool m_Phase3;
		bool m_Phase4;
		bool m_PhaseID;

		void Reset() override
		{
			ClearDelayedOperations();
			m_Events.Reset();
			m_CosmeticEvents.Reset();

			_Reset();

			m_SummonerKilled = 0;
			m_Paused = true;
			m_Phase2 = false;
			m_Phase3 = false;
			m_Phase4 = false;

			m_RegenCycle = 1;

			m_Events.SetPhase(ePhases::TheLegionsMight);

			me->SetDisplayId(63958);

			me->DespawnCreaturesInArea(eCitadelCreatures::FelSummoner, 1000.0f);
			me->DespawnCreaturesInArea(eCitadelCreatures::GuldanMann, 1000.0f);

			me->RemoveAreaTrigger(eSpells::MannorothBlood);

			DespawnGameObjects(eMannorothObjects::FelSpireRed, 1000.0f);
			DespawnGameObjects(eMannorothObjects::FelSpirePurple, 1000.0f);
			DespawnGameObjects(eMannorothObjects::FelSpireGreen, 1000.0f);

			me->RemoveAura(eCitadelSpells::Berserker);

			me->SummonCreature(eCitadelCreatures::FelSummoner, g_FelIronSummonerRedSpawnPos);
			me->SummonCreature(eCitadelCreatures::FelSummoner, g_FelIronSummonerPurpleSpawnPos);
			me->SummonCreature(eCitadelCreatures::FelSummoner, g_FelIronSummonerGreenSpawnPos);
			me->SummonCreature(eCitadelCreatures::GuldanMann, g_GuldanRestPos);

			me->CastSpell(me, eSpells::MannorothBlood, true);

			me->SummonGameObject(eMannorothObjects::FelSpireRed, -2982.46f, -198.141f, 593.122f, 4.88718f, 0.0f, 0.0f, 0.0f, 0.0f, 0);
			me->SummonGameObject(eMannorothObjects::FelSpirePurple, -3097.97f, -300.221f, 593.122f, 0.447109f, 0.0f, 0.0f, 0.0f, 0.0f, 0);
			me->SummonGameObject(eMannorothObjects::FelSpireGreen, -2935.77f, -370.696f, 593.122f, 2.64391f, 0.0f, 0.0f, 0.0f, 0.0f, 0);

			me->SetFlag(EUnitFields::UNIT_FIELD_FLAGS, eUnitFlags::UNIT_FLAG_IMMUNE_TO_PC);
			me->SetFlag(EUnitFields::UNIT_FIELD_FLAGS_2, eUnitFlags2::UNIT_FLAG2_UNK12);

			me->SetReactState(ReactStates::REACT_PASSIVE);

			me->RemoveFlag(EUnitFields::UNIT_FIELD_FLAGS_2, eUnitFlags2::UNIT_FLAG2_REGENERATE_POWER);

			me->setPowerType(Powers::POWER_ENERGY);
			me->SetMaxPower(Powers::POWER_ENERGY, 100);
			me->SetPower(Powers::POWER_ENERGY, 33);
			me->AddAura(eSpells::GreenPower, me);

			me->ApplySpellImmune(0, SpellImmunity::IMMUNITY_EFFECT, SpellEffects::SPELL_EFFECT_INTERRUPT_CAST, true);
			me->ApplySpellImmune(0, SpellImmunity::IMMUNITY_EFFECT, SpellEffects::SPELL_EFFECT_KNOCK_BACK, true);
			me->ApplySpellImmune(0, SpellImmunity::IMMUNITY_EFFECT, SpellEffects::SPELL_EFFECT_KNOCK_BACK_DEST, true);

			me->ApplySpellImmune(0, SpellImmunity::IMMUNITY_MECHANIC, Mechanics::MECHANIC_SILENCE, true);
			me->ApplySpellImmune(0, SpellImmunity::IMMUNITY_MECHANIC, Mechanics::MECHANIC_FEAR, true);
			me->ApplySpellImmune(0, SpellImmunity::IMMUNITY_MECHANIC, Mechanics::MECHANIC_STUN, true);
			me->ApplySpellImmune(0, SpellImmunity::IMMUNITY_MECHANIC, Mechanics::MECHANIC_SLEEP, true);
			me->ApplySpellImmune(0, SpellImmunity::IMMUNITY_MECHANIC, Mechanics::MECHANIC_CHARM, true);
			me->ApplySpellImmune(0, SpellImmunity::IMMUNITY_MECHANIC, Mechanics::MECHANIC_SAPPED, true);
			me->ApplySpellImmune(0, SpellImmunity::IMMUNITY_MECHANIC, Mechanics::MECHANIC_HORROR, true);
			me->ApplySpellImmune(0, SpellImmunity::IMMUNITY_MECHANIC, Mechanics::MECHANIC_POLYMORPH, true);
			me->ApplySpellImmune(0, SpellImmunity::IMMUNITY_MECHANIC, Mechanics::MECHANIC_DISORIENTED, true);
			me->ApplySpellImmune(0, SpellImmunity::IMMUNITY_MECHANIC, Mechanics::MECHANIC_FREEZE, true);

			if (m_Instance != nullptr)
			{
				m_Instance->instance->SetObjectVisibility(500.0f);

				m_Instance->SendEncounterUnit(EncounterFrameType::ENCOUNTER_FRAME_DISENGAGE, me, 1);

				m_Instance->SetBossState(eCitadelDatas::DataMannoroth, EncounterState::NOT_STARTED);
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

		void EnterEvadeMode() override
		{
			summons.DespawnAll();

			m_Events.Reset();
			m_CosmeticEvents.Reset();

			CreatureAI::EnterEvadeMode();

			me->InterruptNonMeleeSpells(true);

			me->ClearAllUnitState();

			if (m_Instance != nullptr)
			{
				m_Instance->SendEncounterUnit(EncounterFrameType::ENCOUNTER_FRAME_DISENGAGE, me, 1);

				ResetTheEncounter(me, m_Instance);
			}

			me->StopMoving();

			me->NearTeleportTo(me->GetHomePosition());

			JustReachedHome();
		}

		void JustReachedHome() override
		{
			if (m_Instance != nullptr)
				m_Instance->SendEncounterUnit(EncounterFrameType::ENCOUNTER_FRAME_DISENGAGE, me, 1);
		}

		void EnterCombat(Unit* p_Attacker) override
		{
			_EnterCombat();

			me->SetWalk(false);

			m_Events.ScheduleEvent(eEvents::EventCurseoftheLegion, 10 * TimeConstants::IN_MILLISECONDS, 0, ePhases::TheLegionsMight);
			m_Events.ScheduleEvent(eEvents::EventFelImplosion, 4 * TimeConstants::IN_MILLISECONDS, 0, ePhases::TheLegionsMight);
			//m_Events.ScheduleEvent(eEvents::EventInferno, 20 * TimeConstants::IN_MILLISECONDS, 0, ePhases::TheLegionsMight);

			if (IsMythic())
			{
				std::list<Creature*> l_GuldanList;
				me->GetCreatureListWithEntryInGrid(l_GuldanList, eCitadelCreatures::GuldanMann, 1000.0f);

				for (Creature* l_Guldan : l_GuldanList)
				{
					if (l_Guldan->IsAIEnabled)
						l_Guldan->AI()->DoAction(eActions::RedSpire);
				}
			}

			if (m_Instance != nullptr)
			{
				m_Instance->SetBossState(eCitadelDatas::DataMannoroth, EncounterState::IN_PROGRESS);

				m_Events.SetPhase(ePhases::TheLegionsMight);
			}
		}

		void KilledUnit(Unit* p_Who) override
		{
			if (!p_Who->IsPlayer())
				return;

			Talk(eTalks::TalkSlay);
		}

		void RegeneratePower(Powers p_Power, int32& p_Value)
		{
			/// Regens manually
			p_Value = 0;
		}

		void SetPower(Powers p_Power, int32 p_Value) override
		{
			if (p_Power != Powers::POWER_ENERGY || m_Instance == nullptr)
				return;

			if (m_Paused)
				return;

			if (p_Value >= 100)
			{
				switch (m_PhaseID)
				{
					case ePhases::Empowerment:
					{
						if (!m_Events.HasEvent(eEvents::EventEmpoweredMannorothGaze))
							m_Events.ScheduleEvent(eEvents::EventEmpoweredMannorothGaze, 1 * TimeConstants::IN_MILLISECONDS, ePhases::Empowerment);
						break;
					}
					default:
					{
						if (!m_Events.HasEvent(eEvents::EventMannorothGaze))
							m_Events.ScheduleEvent(eEvents::EventMannorothGaze, 1 * TimeConstants::IN_MILLISECONDS);
						break;
					}
				}
			}
		}

		uint32 GetData(uint32 p_ID) override
		{
			switch (p_ID)
			{
			case eDatas::SummonerKilled:
				return (uint32)m_SummonerKilled;
			default:
				break;
			}

			return 0;
		}

		void SetData(uint32 p_ID, uint32 /*p_Value*/) override
		{
			switch (p_ID)
			{
				case eDatas::SummonerKilled:
				{
					++m_SummonerKilled;

					if (m_SummonerKilled == eCitadelDatas::MaxSummoners)
					{
						me->AI()->DoAction(eActions::ActionStartPhase2);
					}
					break;
				}
			default:
				break;
			}
		}

		void MovementInform(uint32 p_Type, uint32 p_ID) override
		{
			if (p_Type != MovementGeneratorType::POINT_MOTION_TYPE &&
				p_Type != MovementGeneratorType::EFFECT_MOTION_TYPE)
				return;

			switch (p_ID)
			{
				case eMoves::MoveTank:
			default:
				break;
			}
		}

		void DoAction(int32 const p_Action) override
		{
			switch (p_Action)
			{
				case eActions::ActionStartPhase2:
				{
					m_Events.SetPhase(ePhases::TheResurrection);

					++m_PhaseID;

					m_Phase2 = true;

					m_Paused = true;

					if (!IsMythic())
					{
						std::list<Creature*> l_GuldanList;
						me->GetCreatureListWithEntryInGrid(l_GuldanList, eCitadelCreatures::GuldanMann, 1000.0f);

						for (Creature* l_Guldan : l_GuldanList)
						{
							if (l_Guldan->IsAIEnabled)
								l_Guldan->AI()->DoAction(eActions::RedSpire);
						}
					}

					if (!IsMythic())
					{
						m_Events.ScheduleEvent(eEvents::EventForm2, 10000);
						m_Events.ScheduleEvent(eEvents::EventAttackable2, 19000);
						m_Events.ScheduleEvent(eEvents::EventAggresive2, 21000);
						m_Events.ScheduleEvent(eEvents::EventTalk2, 28000);
					}

					if (IsMythic())
					{
						m_Events.ScheduleEvent(eEvents::EventForm2, 4000);
						m_Events.ScheduleEvent(eEvents::EventAttackable2, 13000);
						m_Events.ScheduleEvent(eEvents::EventAggresive2, 15000);
						m_Events.ScheduleEvent(eEvents::EventTalk2, 23000);
					}
				break;
				}
			default:
				break;
			}
		}

		void UpdateAI(uint32 const p_Diff) override
		{
			if (m_Instance)
			{
				if (m_Instance->IsWipe())
				{
					me->GetMotionMaster()->MoveTargetedHome();
					return;
				}
			}

			m_CosmeticEvents.Update(p_Diff);

			switch (m_CosmeticEvents.ExecuteEvent())
			{
				case eEvents::EventRegenerateEnergy:
				{
					int32 l_Power = 0;

					switch (m_PhaseID)
					{
						case ePhases::TheLegionsMight:
						{
							l_Power = g_MannorothRegenCyclesP1[m_RegenCycle++];

							if (m_RegenCycle >= eMannorothDatas::MaxRegenCyclesP1)
								m_RegenCycle = 0;

							break;
						}
						case ePhases::TruePower:
						{
							l_Power = g_MannorothRegenCyclesP1[m_RegenCycle++];

							if (m_RegenCycle >= eMannorothDatas::MaxRegenCyclesP1)
								m_RegenCycle = 0;

							break;
						}
						case ePhases::Empowerment:
						{
							l_Power = 4;
							break;
						}
						default:
							break;
					}

					me->ModifyPower(Powers::POWER_ENERGY, l_Power);

					m_CosmeticEvents.ScheduleEvent(eEvents::EventRegenerateEnergy, 1000);
					break;
				}
			default:
				break;
			}

			m_Events.Update(p_Diff);

			if (me->HasUnitState(UnitState::UNIT_STATE_CASTING))
				return;

			if (me->HasReactState(ReactStates::REACT_AGGRESSIVE))
			{
				if (Player* l_Target = SelectMainTank())
				{
					if (!me->IsWithinMeleeRange(l_Target))
						me->GetMotionMaster()->MovePoint(eMoves::MoveTank, *l_Target);
				}
			}

			switch (m_Events.ExecuteEvent())
			{
				// TRANSITIONS
				case eEvents::EventForm2:
				{
					me->AddAura(eSpells::TransformP2, me);
					SetEquipmentSlots(false, 124378, 0, 0);
					break;
				}
				case eEvents::EventAttackable2:
				{
					me->RemoveAreaTrigger(eSpells::MannorothBlood);

					me->RemoveFlag(EUnitFields::UNIT_FIELD_FLAGS, eUnitFlags::UNIT_FLAG_IMMUNE_TO_PC);
					me->RemoveFlag(EUnitFields::UNIT_FIELD_FLAGS_2, eUnitFlags2::UNIT_FLAG2_UNK12);

					m_Instance->SendEncounterUnit(EncounterFrameType::ENCOUNTER_FRAME_ENGAGE, me, 1);

					if (!IsMythic())
					{
						m_Events.ScheduleEvent(eEvents::EventFelImplosion, 15 * TimeConstants::IN_MILLISECONDS, 0, ePhases::TheResurrection);
						m_Events.ScheduleEvent(eEvents::EventInferno, 20 * TimeConstants::IN_MILLISECONDS, 0, ePhases::TheResurrection);
					}

					if (IsMythic())
					{
						m_Events.ScheduleEvent(eEvents::EventCurseoftheLegion, 10 * TimeConstants::IN_MILLISECONDS, 0, ePhases::TheResurrection);
						m_Events.ScheduleEvent(eEvents::EventFelImplosion, 15 * TimeConstants::IN_MILLISECONDS, 0, ePhases::TheResurrection);
						//m_Events.ScheduleEvent(eEvents::EventInferno, 20 * TimeConstants::IN_MILLISECONDS, 0, ePhases::TheResurrection);
					}

					m_Events.ScheduleEvent(eEvents::EventGlaiveCombo, 15 * TimeConstants::IN_MILLISECONDS, 0, ePhases::TheResurrection);
					m_Events.ScheduleEvent(eEvents::EventFelHellstorm, 20 * TimeConstants::IN_MILLISECONDS, 0, ePhases::TheResurrection);
					m_Events.ScheduleEvent(eEvents::EventFelseeker, 30 * TimeConstants::IN_MILLISECONDS, 0, ePhases::TheResurrection);
					break;
				}
				case eEvents::EventAggresive2:
				{
					me->SetReactState(ReactStates::REACT_AGGRESSIVE);

					m_Paused = false;
					
					m_CosmeticEvents.Reset();
					m_CosmeticEvents.ScheduleEvent(eEvents::EventRegenerateEnergy, 1000);

					if (Player* l_Tank = SelectMainTank())
					{
						me->GetMotionMaster()->MoveChase(l_Tank);
						AttackStart(l_Tank);
					}
					break;
				}
				case eEvents::EventTalk2:
				{
					Talk(eTalks::TalkPhase2);
					break;
				}
				case eEvents::EventForm3:
				{
					me->AddAura(eSpells::TransformP3, me);

					me->SetReactState(ReactStates::REACT_PASSIVE);
					me->AttackStop();

					if (!IsMythic())
					{
						m_Events.ScheduleEvent(eEvents::EventInferno, 20 * TimeConstants::IN_MILLISECONDS, 0, ePhases::TruePower);
					}

					if (IsMythic())
					{
						m_Events.ScheduleEvent(eEvents::EventFelImplosion, 15 * TimeConstants::IN_MILLISECONDS, 0, ePhases::TruePower);
						m_Events.ScheduleEvent(eEvents::EventInferno, 20 * TimeConstants::IN_MILLISECONDS, 0, ePhases::TruePower);
					}

					m_Events.ScheduleEvent(eEvents::EventGlaiveCombo, 42 * TimeConstants::IN_MILLISECONDS, 0, ePhases::TruePower);
					m_Events.ScheduleEvent(eEvents::EventFelHellstorm, 25 * TimeConstants::IN_MILLISECONDS, 0, ePhases::TruePower);
					m_Events.ScheduleEvent(eEvents::EventFelseeker, 40 * TimeConstants::IN_MILLISECONDS, 0, ePhases::TruePower);
					m_Events.ScheduleEvent(eEvents::EventShadowForce, 65 * TimeConstants::IN_MILLISECONDS, 0, ePhases::TruePower);
					break;
				}
				case eEvents::EventAggresive3:
				{
					me->SetReactState(ReactStates::REACT_AGGRESSIVE);

					m_Paused = false;

					me->SetPower(Powers::POWER_ALTERNATE_POWER, 45);

					m_CosmeticEvents.Reset();
					m_CosmeticEvents.ScheduleEvent(eEvents::EventRegenerateEnergy, 1000);

					if (Player* l_Tank = SelectMainTank())
					{
						me->GetMotionMaster()->MoveChase(l_Tank);
						AttackStart(l_Tank);
					}
					break;
				}
				case eEvents::EventTalk3:
				{
					Talk(eTalks::TalkPhase3);
					break;
				}
				case eEvents::EventForm4:
				{
					me->AddAura(eSpells::TransformP4, me);

					me->SetReactState(ReactStates::REACT_PASSIVE);
					me->AttackStop();

					if (IsMythic())
					{
						m_Events.ScheduleEvent(eEvents::EventFelImplosion, 15 * TimeConstants::IN_MILLISECONDS, 0, ePhases::Empowerment);
					}

					m_Events.ScheduleEvent(eEvents::EventEmpoweredGlaiveCombo, 35 * TimeConstants::IN_MILLISECONDS, 0, ePhases::Empowerment);
					m_Events.ScheduleEvent(eEvents::EventEmpoweredFelHellstorm, 25 * TimeConstants::IN_MILLISECONDS, 0, ePhases::Empowerment);
					m_Events.ScheduleEvent(eEvents::EventEmpoweredFelseeker, 40 * TimeConstants::IN_MILLISECONDS, 0, ePhases::Empowerment);
					m_Events.ScheduleEvent(eEvents::EventEmpoweredShadowForce, 65 * TimeConstants::IN_MILLISECONDS, 0, ePhases::Empowerment);
					break;
				}
				case eEvents::EventAggresive4:
				{
					DoCastAOE(eSpells::SkyboxPart4, true);

					me->SetReactState(ReactStates::REACT_AGGRESSIVE);

					m_Paused = false;

					me->SetPower(Powers::POWER_ALTERNATE_POWER, 70);

					m_CosmeticEvents.Reset();
					m_CosmeticEvents.ScheduleEvent(eEvents::EventRegenerateEnergy, 1000);

					if (Player* l_Tank = SelectMainTank())
					{
						me->GetMotionMaster()->MoveChase(l_Tank);
						AttackStart(l_Tank);
					}
					break;
				}
				case eEvents::EventTalk4:
				{
					Talk(eTalks::TalkPhase4b);
					break;
				}

				// Generic
				case eEvents::EventCurseoftheLegion:
				{
					std::list<Creature*> l_FelRedSpireList;
					me->GetCreatureListWithEntryInGrid(l_FelRedSpireList, eCitadelCreatures::FelRedSpire, 1000.0f);

					for (Creature* l_FelRedSpire : l_FelRedSpireList)
					{
						l_FelRedSpire->AI()->DoAction(eActions::ActionCurseoftheLegion);
					}

					m_Events.ScheduleEvent(eEvents::EventCurseoftheLegion, 65000);
					break;
				}
				case eEvents::EventFelImplosion:
				{
					std::list<Creature*> l_FelGreenSpireList;
					me->GetCreatureListWithEntryInGrid(l_FelGreenSpireList, eCitadelCreatures::FelPurpleSpire, 1000.0f);

					for (Creature* l_FelGreenSpire : l_FelGreenSpireList)
					{
						l_FelGreenSpire->AI()->DoAction(eActions::ActionFelImplosion);
					}

					m_Events.ScheduleEvent(eEvents::EventFelImplosion, 12000);
					break;
				}


				// Phase 2
				case eEvents::EventGlaiveCombo:
				{
					if (Unit* target = SelectTarget(SELECT_TARGET_TOPAGGRO))
					{
						me->CastSpell(target, eSpells::GlaiveCombo, true);

						m_Events.ScheduleEvent(eEvents::EventGlaiveThrust, 200);
						m_Events.ScheduleEvent(eEvents::EventMassiveBlast, 1400);
						m_Events.ScheduleEvent(eEvents::EventGlaiveThrust, 2600);
					}

					m_Events.ScheduleEvent(eEvents::EventGlaiveCombo, 15000);
					break;
				}
				case eEvents::EventGlaiveThrust:
				{
					if (Unit* target = SelectTarget(SELECT_TARGET_TOPAGGRO))
						me->CastSpell(target, eSpells::GlaiveThrustCast, false);

					m_Events.ScheduleEvent(eEvents::EventGlaiveThrustDmg, 1100);
					break;
				}
				case eEvents::EventGlaiveThrustDmg:
				{
					if (Unit* target = SelectTarget(SELECT_TARGET_TOPAGGRO))
						me->CastSpell(target, eSpells::GlaiveThrust, true);
					break;
				}
				case eEvents::EventMassiveBlast:
				{
					if (Unit* target = SelectTarget(SELECT_TARGET_TOPAGGRO))
						me->CastSpell(target, eSpells::MassiveBlastCast, false);

						m_Events.ScheduleEvent(eEvents::EventMassiveBlastDmg, 1100);
					break;
				}
				case eEvents::EventMassiveBlastDmg:
				{
					if (Unit* target = SelectTarget(SELECT_TARGET_TOPAGGRO))
					{
						me->CastSpell(target, eSpells::MassiveBlast, true);
						me->CastSpell(target, 149204, true); // Knockback
					}
					break;
				}
				case eEvents::EventMannorothGaze:
				{
					me->CastSpell(me, eSpells::MannorothGazeCast, false);

					me->SetPower(Powers::POWER_ALTERNATE_POWER, 0);

					AddTimedDelayedOperation(2.1 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						std::list<Unit*> l_TargetList;

						JadeCore::AnyUnfriendlyUnitInObjectRangeCheck l_Check(me, me, 1500.0f);
						JadeCore::UnitListSearcher<JadeCore::AnyUnfriendlyUnitInObjectRangeCheck> l_Searcher(me, l_TargetList, l_Check);
						me->VisitNearbyObject(150.0f, l_Searcher);

						std::set<uint64> l_Targets;

						for (Unit* l_Iter : l_TargetList)
						{
							l_Targets.insert(l_Iter->GetGUID());

							me->AddAura(eSpells::MannorothGazeCast, l_Iter);
						}
					});
				break;
				}

				// Phase 3


				// Phase 4
				case eEvents::EventEmpoweredGlaiveCombo:
				{
					if (Unit* target = SelectTarget(SELECT_TARGET_TOPAGGRO))
					{
						me->CastSpell(target, eSpells::EmpoweredGlaiveCombo, true);

						m_Events.ScheduleEvent(eEvents::EventEmpoweredGlaiveThrust, 200);
						m_Events.ScheduleEvent(eEvents::EventEmpoweredMassiveBlast, 1400);
						m_Events.ScheduleEvent(eEvents::EventEmpoweredGlaiveThrust, 2600);
					}

					m_Events.ScheduleEvent(eEvents::EventEmpoweredGlaiveCombo, 15000);
					break;
				}
				case eEvents::EventEmpoweredGlaiveThrust:
				{
					if (Unit* target = SelectTarget(SELECT_TARGET_TOPAGGRO))
						me->CastSpell(target, eSpells::EmpoweredGlaiveThrustCast, false);

					m_Events.ScheduleEvent(eEvents::EventEmpoweredGlaiveThrustDmg, 1100);
					break;
				}
				case eEvents::EventEmpoweredGlaiveThrustDmg:
				{
					if (Unit* target = SelectTarget(SELECT_TARGET_TOPAGGRO))
						me->CastSpell(target, eSpells::EmpoweredGlaiveThrust, true);
					break;
				}
				case eEvents::EventEmpoweredMassiveBlast:
				{
					if (Unit* target = SelectTarget(SELECT_TARGET_TOPAGGRO))
					{
						me->CastSpell(target, eSpells::EmpoweredMassiveBlastCast, false);

						if (IsMythic())
						me->CastSpell(target, eSpells::EmpoweredMassiveBlastStun, true);

						Position l_Pos = *target;

						target->GetNearPoint(l_Pos, 0.0f, frand(5.0f, 10.0f), frand(0.0f, 2.0f * M_PI));
						me->SummonCreature(eCitadelCreatures::MassiveBlastWave, l_Pos);

						target->GetNearPoint(l_Pos, 0.0f, frand(5.0f, 10.0f), frand(0.0f, 1.0f * M_PI));
						me->SummonCreature(eCitadelCreatures::MassiveBlastWave, l_Pos);

						target->GetNearPoint(l_Pos, 0.0f, frand(5.0f, 10.0f), frand(0.0f, 3.0f * M_PI));
						me->SummonCreature(eCitadelCreatures::MassiveBlastWave, l_Pos);
					}

					m_Events.ScheduleEvent(eEvents::EventEmpoweredMassiveBlastDmg, 1100);
					break;
				}
				case eEvents::EventEmpoweredMassiveBlastDmg:
				{
					if (Unit* target = SelectTarget(SELECT_TARGET_TOPAGGRO))
					{
						me->CastSpell(target, eSpells::EmpoweredMassiveBlast, true);
						me->CastSpell(target, 149204, true); // Knockback
					}
					break;
				}
			default:
				break;
			}

			DoMeleeAttackIfReady();
		}

		void DamageTaken(Unit* /*p_Attacker*/, uint32& p_Damage, SpellInfo const* /*p_SpellInfo*/) override
		{
			if (me->GetHealthPct() <= 75 && !m_Phase3)
			{
				m_Events.SetPhase(ePhases::TruePower);

				m_Phase3 = true;

				m_Paused = true;

				std::list<Creature*> l_GuldanList;
				me->GetCreatureListWithEntryInGrid(l_GuldanList, eCitadelCreatures::GuldanMann, 1000.0f);

				for (Creature* l_Guldan : l_GuldanList)
				{
					if (l_Guldan->IsAIEnabled)
						l_Guldan->AI()->DoAction(eActions::PurpleSpire);
				}

				m_CosmeticEvents.CancelEvent(eEvents::EventRegenerateEnergy);

				m_Events.CancelEvent(eEvents::EventFelImplosion);
				m_Events.CancelEvent(eEvents::EventInferno);

				m_Events.CancelEvent(eEvents::EventGlaiveCombo);
				m_Events.CancelEvent(eEvents::EventFelHellstorm);
				m_Events.CancelEvent(eEvents::EventMannorothGaze);
				m_Events.CancelEvent(eEvents::EventFelseeker);

				m_Events.ScheduleEvent(eEvents::EventForm3, 9000);
				m_Events.ScheduleEvent(eEvents::EventAggresive3, 18000);
				m_Events.ScheduleEvent(eEvents::EventTalk3, 26000);
			}

			if (me->GetHealthPct() <= 30 && !m_Phase4)
			{
				m_Events.SetPhase(ePhases::Empowerment);

				m_Phase4 = true;

				m_Paused = true;

				std::list<Creature*> l_GuldanList;
				me->GetCreatureListWithEntryInGrid(l_GuldanList, eCitadelCreatures::GuldanMann, 1000.0f);

				for (Creature* l_Guldan : l_GuldanList)
				{
					if (l_Guldan->IsAIEnabled)
						l_Guldan->AI()->DoAction(eActions::GreenSpire);
				}

				Talk(eTalks::TalkPhase4);

				m_Events.CancelEvent(eEvents::EventInferno);

				m_Events.CancelEvent(eEvents::EventGlaiveCombo);
				m_Events.CancelEvent(eEvents::EventFelHellstorm);
				m_Events.CancelEvent(eEvents::EventMannorothGaze);
				m_Events.CancelEvent(eEvents::EventFelseeker);
				m_Events.CancelEvent(eEvents::EventShadowForce);

				m_CosmeticEvents.CancelEvent(eEvents::EventRegenerateEnergy);

				m_Events.ScheduleEvent(eEvents::EventForm4, 10000);
				m_Events.ScheduleEvent(eEvents::EventAggresive4, 16000);
				m_Events.ScheduleEvent(eEvents::EventTalk4, 23200);
			}
		}

		/*void ScheduleThirdPhase()
		{
			m_Events.SetPhase(ePhases::TruePower);

			m_Phase3 = true;

			m_Paused = true;

			std::list<Creature*> l_GuldanList;
			me->GetCreatureListWithEntryInGrid(l_GuldanList, eCitadelCreatures::GuldanMann, 1000.0f);

			for (Creature* l_Guldan : l_GuldanList)
			{
				if (l_Guldan->IsAIEnabled)
					l_Guldan->AI()->DoAction(eActions::PurpleSpire);
			}

			m_CosmeticEvents.CancelEvent(eEvents::EventRegenerateEnergy);

			m_Events.CancelEvent(eEvents::EventFelImplosion);
			m_Events.CancelEvent(eEvents::EventInferno);

			m_Events.CancelEvent(eEvents::EventGlaiveCombo);
			m_Events.CancelEvent(eEvents::EventFelHellstorm);
			m_Events.CancelEvent(eEvents::EventMannorothGaze);
			m_Events.CancelEvent(eEvents::EventFelseeker);

			m_Events.ScheduleEvent(eEvents::EventForm3, 11000);
			m_Events.ScheduleEvent(eEvents::EventAggresive3, 21000);
			m_Events.ScheduleEvent(eEvents::EventTalk3, 29000);
		}

		void ScheduleFourthPhase()
		{
			m_Events.SetPhase(ePhases::Empowerment);

			m_Phase4 = true;

			m_Paused = true;

			std::list<Creature*> l_GuldanList;
			me->GetCreatureListWithEntryInGrid(l_GuldanList, eCitadelCreatures::GuldanMann, 1000.0f);

			for (Creature* l_Guldan : l_GuldanList)
			{
				if (l_Guldan->IsAIEnabled)
					l_Guldan->AI()->DoAction(eActions::GreenSpire);
			}

			Talk(eTalks::TalkPhase4);

			m_Events.CancelEvent(eEvents::EventInferno);

			m_Events.CancelEvent(eEvents::EventGlaiveCombo);
			m_Events.CancelEvent(eEvents::EventFelHellstorm);
			m_Events.CancelEvent(eEvents::EventMannorothGaze);
			m_Events.CancelEvent(eEvents::EventFelseeker);
			m_Events.CancelEvent(eEvents::EventShadowForce);

			m_CosmeticEvents.CancelEvent(eEvents::EventRegenerateEnergy);

			m_Events.ScheduleEvent(eEvents::EventForm4, 10000);
			m_Events.ScheduleEvent(eEvents::EventAggresive4, 16000);
			m_Events.ScheduleEvent(eEvents::EventTalk4, 23200);
		}*/

		void JustDied(Player* p_Player)
		{
			Talk(eTalks::TalkDeath);

			_JustDied();

			std::list<Creature*> l_KhadgarList;
			me->GetCreatureListWithEntryInGrid(l_KhadgarList, eCitadelCreatures::KhadgarMann, 1000.0f);

			for (Creature* l_Khadgar : l_KhadgarList)
			{
				l_Khadgar->AI()->DoAction(eActions::ActionAppear);
			}

			if (m_Instance != nullptr)
			{
				m_Instance->SendEncounterUnit(EncounterFrameType::ENCOUNTER_FRAME_DISENGAGE, me, 1);

				m_Instance->SetBossState(eCitadelDatas::DataMannoroth, EncounterState::DONE);

				Map::PlayerList const& playerList = m_Instance->instance->GetPlayers();
				if (!playerList.isEmpty())
				{
					for (Map::PlayerList::const_iterator itr = playerList.begin(); itr != playerList.end(); ++itr)
					{
						if (Player* player = itr->getSource())
						{
							if (player->isGameMaster())
								continue;

							if (player->isAlive())
							{
								player->CombatStop();
								player->CombatStopWithPets(true);
							}
						}
					}
				}

				/// Allow loots and bonus loots to be enabled/disabled with a simple reload
				if (sObjectMgr->IsDisabledEncounter(m_Instance->GetEncounterIDForBoss(me), GetDifficulty()))
					me->SetLootRecipient(nullptr);
				else
					CastSpellToPlayers(me->GetMap(), me, eSpells::MannorothBonusLoot, true);
			}
		}
	};

	CreatureAI* GetAI(Creature* p_Creature) const override
	{
		return new boss_mannoroth_hfcAI(p_Creature);
	}
};

/// Fel Iron Summoner - 91305
class boss_fel_iron_summoner : public CreatureScript
{
public:
	boss_fel_iron_summoner() : CreatureScript("boss_fel_iron_summoner") {}

	enum eSpells
	{
		VisualGreen = 182212,
		VisualRed = 185147,
		VisualPurple = 185175,
		BeamVisualMythic = 186648 // Only used in mythic
	};

	enum eTalks
	{
		TalkAggro
	};

	enum eEvents
	{
		EventCurseoftheLegion,
		EventFelImplosion,
		EventInferno
	};

	enum eActions
	{
		ActionSummonerKilled,
		ActionStartPhase2,
		ActionBeamMythic
	};

	enum eDatas
	{
		SummonerKilled
	};

	struct boss_fel_iron_summonerAI : public BossAI
	{
		boss_fel_iron_summonerAI(Creature* p_Creature) : BossAI(p_Creature, eCitadelDatas::DataFelIronSummoner)
		{
			m_Instance = p_Creature->GetInstanceScript();
		}

		InstanceScript* m_Instance;

		EventMap m_Events;
		EventMap m_CosmeticEvents;

		bool m_FightStarted;

		uint8 m_SummonerKilled;

		void Reset() override
		{
			m_FightStarted = false;

			_Reset();

			m_SummonerKilled = 0;

			me->SetReactState(ReactStates::REACT_PASSIVE);

			me->ApplySpellImmune(0, SpellImmunity::IMMUNITY_EFFECT, SpellEffects::SPELL_EFFECT_INTERRUPT_CAST, true);
			me->ApplySpellImmune(0, SpellImmunity::IMMUNITY_EFFECT, SpellEffects::SPELL_EFFECT_KNOCK_BACK, true);
			me->ApplySpellImmune(0, SpellImmunity::IMMUNITY_EFFECT, SpellEffects::SPELL_EFFECT_KNOCK_BACK_DEST, true);

			me->ApplySpellImmune(0, SpellImmunity::IMMUNITY_MECHANIC, Mechanics::MECHANIC_SILENCE, true);
			me->ApplySpellImmune(0, SpellImmunity::IMMUNITY_MECHANIC, Mechanics::MECHANIC_FEAR, true);
			me->ApplySpellImmune(0, SpellImmunity::IMMUNITY_MECHANIC, Mechanics::MECHANIC_STUN, true);
			me->ApplySpellImmune(0, SpellImmunity::IMMUNITY_MECHANIC, Mechanics::MECHANIC_SLEEP, true);
			me->ApplySpellImmune(0, SpellImmunity::IMMUNITY_MECHANIC, Mechanics::MECHANIC_CHARM, true);
			me->ApplySpellImmune(0, SpellImmunity::IMMUNITY_MECHANIC, Mechanics::MECHANIC_SAPPED, true);
			me->ApplySpellImmune(0, SpellImmunity::IMMUNITY_MECHANIC, Mechanics::MECHANIC_HORROR, true);
			me->ApplySpellImmune(0, SpellImmunity::IMMUNITY_MECHANIC, Mechanics::MECHANIC_POLYMORPH, true);
			me->ApplySpellImmune(0, SpellImmunity::IMMUNITY_MECHANIC, Mechanics::MECHANIC_DISORIENTED, true);
			me->ApplySpellImmune(0, SpellImmunity::IMMUNITY_MECHANIC, Mechanics::MECHANIC_FREEZE, true);
		}

		void DoAction(int32 const p_Action) override
		{
			switch (p_Action)
			{
				case eActions::ActionSummonerKilled:
				{
					++m_SummonerKilled;

					if (m_SummonerKilled == eCitadelDatas::MaxSummoners)
					{
						if (m_Instance != nullptr)
						{
							if (Creature* l_Mannoroth = Creature::GetCreature(*me, m_Instance->GetData64(eCitadelCreatures::BossMannoroth)))
							{
								if (l_Mannoroth->IsAIEnabled)
									l_Mannoroth->AI()->DoAction(eActions::ActionStartPhase2);
							}
						}
					}

					break;
				}

				case eActions::ActionBeamMythic:
				{
					AddTimedDelayedOperation(1 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->CastSpell(me, eSpells::BeamVisualMythic, true);
					});

					AddTimedDelayedOperation(2 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->Kill(me);
					});
				}
			}
		}

		void EnterCombat(Unit* p_Attacker) override
		{
			if (m_FightStarted)
				return;

			m_FightStarted = true;

			if (WorldObject* l_Spire = GetClosestGameObjectWithEntry(me, eMannorothObjects::FelSpireRed, 50.0f))
			{
				me->CastSpell(me, eSpells::VisualRed, false);

				m_Events.ScheduleEvent(eEvents::EventCurseoftheLegion, 65 * TimeConstants::IN_MILLISECONDS, 0);
			}

			else if (WorldObject* l_Spire = GetClosestGameObjectWithEntry(me, eMannorothObjects::FelSpirePurple, 50.0f))
			{
				me->CastSpell(me, eSpells::VisualPurple, false);

				m_Events.ScheduleEvent(eEvents::EventFelImplosion, 10 * TimeConstants::IN_MILLISECONDS, 0);
			}

			else
			{
				me->CastSpell(me, eSpells::VisualGreen, false);

				if (!IsMythic())
				{
					Talk(eTalks::TalkAggro);
				}

				m_Events.ScheduleEvent(eEvents::EventInferno, 18 * TimeConstants::IN_MILLISECONDS, 0);
			}

			if (m_Instance != nullptr)
			{
				m_Instance->SendEncounterUnit(EncounterFrameType::ENCOUNTER_FRAME_ENGAGE, me, 2);

				CallAddsInCombat(p_Attacker);

				StartTheEncounter(me, p_Attacker, m_Instance);
			}
		}

		void JustReachedHome() override
		{
			if (m_Instance != nullptr)
			{
				m_Instance->SendEncounterUnit(EncounterFrameType::ENCOUNTER_FRAME_DISENGAGE, me);
			}
		}

		void JustDied(Unit* /*p_Killer*/) override
		{
			if (m_Instance != nullptr)
			{
				m_Instance->SendEncounterUnit(EncounterFrameType::ENCOUNTER_FRAME_DISENGAGE, me);

				if (Creature* l_Mannoroth = Creature::GetCreature(*me, m_Instance->GetData64(eCitadelCreatures::BossMannoroth)))
				{
					if (l_Mannoroth->IsAIEnabled)
					{
						l_Mannoroth->AI()->SetData(eDatas::SummonerKilled, 0);
					}
				}
			}
		}

		void UpdateAI(uint32 const p_Diff) override
		{
			UpdateOperations(p_Diff);

			if (!UpdateVictim() || (m_Instance != nullptr && m_Instance->IsWipe()))
				return;

			m_CosmeticEvents.Update(p_Diff);

			switch (m_CosmeticEvents.ExecuteEvent())
			{

			}

			m_Events.Update(p_Diff);

			if (me->HasUnitState(UnitState::UNIT_STATE_CASTING))
				return;

			switch (m_Events.ExecuteEvent())
			{
			default:
				break;
			}

			DoMeleeAttackIfReady();
		}

		void CallAddsInCombat(Unit* p_Attacker)
		{
			std::list<Creature*> SummonerList;
			me->GetCreatureListWithEntryInGrid(SummonerList, eCitadelCreatures::FelSummoner, 1000.0f);

			for (Creature* l_FelIronSummoner : SummonerList)
			{
				if (l_FelIronSummoner->IsAIEnabled && !l_FelIronSummoner->isInCombat())
				{
					if (l_FelIronSummoner->GetEntry() != eCitadelCreatures::FelSummoner)
						l_FelIronSummoner->AI()->AttackStart(p_Attacker);
					else
						l_FelIronSummoner->SetInCombatWithZone();
				}
			}

			std::list<Creature*> Boss;
			me->GetCreatureListWithEntryInGrid(Boss, eCitadelCreatures::BossMannoroth, 1000.0f);

			for (Creature* l_Mannoroth : Boss)
			{
				if (l_Mannoroth->IsAIEnabled && !l_Mannoroth->isInCombat())
				{
					if (l_Mannoroth->GetEntry() != eCitadelCreatures::BossMannoroth)
						l_Mannoroth->AI()->AttackStart(p_Attacker);
					else
						l_Mannoroth->SetInCombatWithZone();
				}
			}

			std::list<Creature*> l_Guldan;
			me->GetCreatureListWithEntryInGrid(l_Guldan, eCitadelCreatures::GuldanMann, 1000.0f);

			for (Creature* l_Guldan : l_Guldan)
			{
				if (l_Guldan->IsAIEnabled && !l_Guldan->isInCombat())
				{
					if (l_Guldan->GetEntry() != eCitadelCreatures::GuldanMann)
						l_Guldan->AI()->AttackStart(p_Attacker);
					else
						l_Guldan->SetInCombatWithZone();
				}
			}

			std::list<Creature*> l_RedSpireList;
			me->GetCreatureListWithEntryInGrid(l_RedSpireList, eCitadelCreatures::FelRedSpire, 1000.0f);

			for (Creature* l_RedSpire : l_RedSpireList)
			{
				if (l_RedSpire->IsAIEnabled && !l_RedSpire->isInCombat())
				{
					if (l_RedSpire->GetEntry() != eCitadelCreatures::FelRedSpire)
						l_RedSpire->AI()->AttackStart(p_Attacker);
					else
						l_RedSpire->SetInCombatWithZone();
				}
			}

			std::list<Creature*> l_PurpleSpireList;
			me->GetCreatureListWithEntryInGrid(l_PurpleSpireList, eCitadelCreatures::FelPurpleSpire, 1000.0f);

			for (Creature* l_PurpleSpire : l_PurpleSpireList)
			{
				if (l_PurpleSpire->IsAIEnabled && !l_PurpleSpire->isInCombat())
				{
					if (l_PurpleSpire->GetEntry() != eCitadelCreatures::FelPurpleSpire)
						l_PurpleSpire->AI()->AttackStart(p_Attacker);
					else
						l_PurpleSpire->SetInCombatWithZone();
				}
			}
		}
	};

	CreatureAI* GetAI(Creature* p_Creature) const override
	{
		return new boss_fel_iron_summonerAI(p_Creature);
	}
};

/// Gul'Dan - 91326
class npc_citadel_guldan_mann : public CreatureScript
{
public:
	npc_citadel_guldan_mann() : CreatureScript("npc_citadel_guldan_mann") {}

	enum eMiscs
	{
		InvisDisplay = 11686,
		GuldanDisplay = 62403
	};

	enum eActions
	{
		RedSpire,
		PurpleSpire,
		GreenSpire,
		ActionBeam,
		ActionPhase2,
		ActionBeamMythic
	};

	enum eTalks
	{
		TalkRed = 0,
		TalkRise,
		TalkPurple,
		TalkGreen,
		TalkGreenb,
		TalkAppear,
		TalkEmpower = 6,
		TalkWipe = 7,
		TalkRedMythic = 8
	};

	enum eSpells
	{
		ShieldVisual = 184538,
		Hover = 138092,
		EmpowerVisual = 185257,
		EmpowerVisualPerma = 187028,
		FireVisual = 182224,
		DrainSummoners = 186632, // ???????
		ActivateSpire = 188611, // The spire is a gameobject
		BeamVisualOnBoss = 182259,

	};

	struct npc_citadel_guldan_mannAI : public ScriptedAI
	{
		npc_citadel_guldan_mannAI(Creature* p_Creature) : ScriptedAI(p_Creature)
		{
			m_Instance = p_Creature->GetInstanceScript();
		}

		bool m_RedDone;
		bool m_PurpleDone;
		bool m_GreenDone;

		bool m_FightStarted;

		EventMap m_Events;
		EventMap m_CosmeticEvents;

		InstanceScript* m_Instance;

		void Reset() override
		{
			me->SetReactState(ReactStates::REACT_PASSIVE);
			me->SetFlag(EUnitFields::UNIT_FIELD_FLAGS, eUnitFlags::UNIT_FLAG_IMMUNE_TO_PC | eUnitFlags::UNIT_FLAG_NON_ATTACKABLE);

			me->CastSpell(me, eSpells::Hover, true);
			me->SetDisableGravity(true);
			me->SetDisplayId(eMiscs::InvisDisplay);
			me->RemoveAura(eSpells::ShieldVisual);

			ClearDelayedOperations();

			m_RedDone = false;
			m_PurpleDone = false;
			m_GreenDone = false;

			if (m_Instance != nullptr)
			{

			}
		}

		void EnterCombat(Unit* /*p_Attacker*/) override
		{

		}

		void DoAction(int32 const p_Action) override
		{
			switch (p_Action)
			{
				case eActions::RedSpire:
				{
					if (m_RedDone)
						return;

					me->AddAura(eSpells::ShieldVisual, me);
					me->SetDisplayId(eMiscs::GuldanDisplay);

					AddTimedDelayedOperation(0.5 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						if (!IsMythic())
						{
							Talk(eTalks::TalkRed);
						}

						if (IsMythic())
						{
							Talk(eTalks::TalkRedMythic);
						}

						me->NearTeleportTo(g_GuldanRedPos);
					});

					AddTimedDelayedOperation(1 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						Talk(eTalks::TalkAppear, TextRange::TEXT_RANGE_MAP);
					});

					AddTimedDelayedOperation(1.5 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						if (!IsMythic())
						{
							me->CastSpell(me, eSpells::EmpowerVisual, false);
						}

						if (IsMythic())
						{
							me->CastSpell(me, eSpells::EmpowerVisualPerma, false);
						}
					});

					AddTimedDelayedOperation(8 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						if (!IsMythic())
						{
							std::list<Creature*> l_RedSpireList;
							me->GetCreatureListWithEntryInGrid(l_RedSpireList, eCitadelCreatures::FelRedSpire, 1000.0f);

							for (Creature* l_RedSpire : l_RedSpireList)
							{
								l_RedSpire->AI()->DoAction(eActions::ActionBeam);
							}
						}

						if (IsMythic())
						{
							std::list<Creature*> l_SummonerList;
							me->GetCreatureListWithEntryInGrid(l_SummonerList, eCitadelCreatures::FelSummoner, 1000.0f);

							for (Creature* l_Summoner : l_SummonerList)
							{
								if (l_Summoner->IsAIEnabled)
									l_Summoner->AI()->DoAction(eActions::ActionBeamMythic);
							}
						}
					});

					AddTimedDelayedOperation(9 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						if (!IsMythic())
						{
							me->CastSpell(me, eSpells::ActivateSpire, false);
						}
					});

					AddTimedDelayedOperation(12 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						if (!IsMythic())
						{
							Talk(eTalks::TalkRise);
						}
					});

					AddTimedDelayedOperation(13 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						if (!IsMythic())
						{
							me->NearTeleportTo(g_GuldanRestPos);
							me->RemoveAura(eSpells::FireVisual);
						}
					});

					AddTimedDelayedOperation(13.5 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						if (!IsMythic())
						{
							me->CastSpell(me, eSpells::FireVisual, false);
						}

						m_RedDone = true;
					});
					break;
				}

				case eActions::PurpleSpire:
				{
					if (m_PurpleDone)
						return;

					AddTimedDelayedOperation(1 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						Talk(eTalks::TalkPurple);
						me->NearTeleportTo(g_GuldanPurplePos);
					});

					AddTimedDelayedOperation(1.5 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						Talk(eTalks::TalkEmpower, TextRange::TEXT_RANGE_MAP);

						if (!IsMythic())
						{
							me->CastSpell(me, eSpells::EmpowerVisual, false);
						}

						if (IsMythic())
						{
							me->CastSpell(me, eSpells::EmpowerVisualPerma, false);
						}
					});

					AddTimedDelayedOperation(8 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						if (!IsMythic())
						{
							std::list<Creature*> l_PurpleSpireList;
							me->GetCreatureListWithEntryInGrid(l_PurpleSpireList, eCitadelCreatures::FelPurpleSpire, 1000.0f);

							for (Creature* l_PurpleSpire : l_PurpleSpireList)
							{
								l_PurpleSpire->AI()->DoAction(eActions::ActionBeam);
							}
						}
					});

					AddTimedDelayedOperation(9 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						if (!IsMythic())
						{
							me->CastSpell(me, eSpells::ActivateSpire, false);
						}
					});

					AddTimedDelayedOperation(12 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						if (!IsMythic())
						{
							me->NearTeleportTo(g_GuldanRestPos);
							me->RemoveAura(eSpells::FireVisual);
						}
					});

					AddTimedDelayedOperation(13.5 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						if (!IsMythic())
						{
							me->CastSpell(me, eSpells::FireVisual, false);
						}

						m_PurpleDone = true;
					});
					break;
				}

				case eActions::GreenSpire:
				{
					if (m_GreenDone)
						return;

					AddTimedDelayedOperation(1 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->NearTeleportTo(g_GuldanGreenPos);
					});

					AddTimedDelayedOperation(1.5 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						Talk(eTalks::TalkEmpower, TextRange::TEXT_RANGE_MAP);

						if (!IsMythic())
						{
							me->CastSpell(me, eSpells::EmpowerVisual, false);
						}

						if (IsMythic())
						{
							me->CastSpell(me, eSpells::EmpowerVisualPerma, false);
						}
					});

					AddTimedDelayedOperation(8.2 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						Talk(eTalks::TalkGreen);
					});

					AddTimedDelayedOperation(9 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						if (!IsMythic())
						{
							std::list<Creature*> l_GreenSpireList;
							me->GetCreatureListWithEntryInGrid(l_GreenSpireList, eCitadelCreatures::FelGreenSpire, 1000.0f);

							for (Creature* l_GreenSpire : l_GreenSpireList)
							{
								l_GreenSpire->AI()->DoAction(eActions::ActionBeam);
							}
						}
					});

					AddTimedDelayedOperation(10 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						if (!IsMythic())
						{
							me->CastSpell(me, eSpells::ActivateSpire, false);
						}
					});

					AddTimedDelayedOperation(12 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						if (!IsMythic())
						{
							me->NearTeleportTo(g_GuldanRestPos);
							me->RemoveAura(eSpells::FireVisual);
						}
					});

					AddTimedDelayedOperation(13.5 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						if (!IsMythic())
						{
							me->CastSpell(me, eSpells::FireVisual, false);
						}
					});

					AddTimedDelayedOperation(35.2 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						Talk(eTalks::TalkGreenb);
					});

					AddTimedDelayedOperation(44 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->SetVisible(false);

						m_GreenDone = true;
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

			switch (m_CosmeticEvents.ExecuteEvent())
			{

			}

			if (!UpdateVictim())
				return;

			m_Events.Update(p_Diff);

			switch (m_Events.ExecuteEvent())
			{

			}
		}
	};

	CreatureAI* GetAI(Creature* p_Creature) const override
	{
		return new npc_citadel_guldan_mannAI(p_Creature);
	}
};

/// Fel Red Spire - 95851
class npc_citadel_fel_red_spire_mann : public CreatureScript
{
public:
	npc_citadel_fel_red_spire_mann() : CreatureScript("npc_citadel_fel_red_spire_mann") {}

	enum eActions
	{
		ActionBeam = 1,
		ActionCurseoftheLegion
	};

	enum eSpells
	{
		BeamVisualOnBoss = 182259,
		CurseoftheLegion = 181275,
		SpawnDoomLord = 181276
	};

	enum eTalks
	{
		TalkCurseoftheLegion = 17
	};

	struct npc_citadel_fel_red_spire_mannAI : public ScriptedAI
	{
		npc_citadel_fel_red_spire_mannAI(Creature* p_Creature) : ScriptedAI(p_Creature)
		{
			m_Instance = p_Creature->GetInstanceScript();
		}

		InstanceScript* m_Instance;

		void Reset() override
		{
			me->SetReactState(ReactStates::REACT_PASSIVE);
			me->SetFlag(EUnitFields::UNIT_FIELD_FLAGS, eUnitFlags::UNIT_FLAG_IMMUNE_TO_PC | eUnitFlags::UNIT_FLAG_NON_ATTACKABLE);

			me->SetDisableGravity(true);
			me->SetDisplayId(11686);

			me->AI()->CanTargetOutOfLOS();

			me->CombatStop();
			me->CombatStopWithPets();
		}

		void EnterCombat(Unit* /*p_Attacker*/) override
		{

		}

		void DoAction(int32 const p_Action) override
		{
			switch (p_Action)
			{
				case eActions::ActionBeam:
				{
					me->SetOrientation(eCitadelCreatures::BossMannoroth);
					me->CastSpell(eCitadelCreatures::BossMannoroth, eSpells::BeamVisualOnBoss, true);
					break;
				}
				case eActions::ActionCurseoftheLegion:
				{
					std::list<Unit*> l_TargetList;

					JadeCore::AnyUnfriendlyUnitInObjectRangeCheck l_Check(me, me, 1500.0f);
					JadeCore::UnitListSearcher<JadeCore::AnyUnfriendlyUnitInObjectRangeCheck> l_Searcher(me, l_TargetList, l_Check);
					me->VisitNearbyObject(500.0f, l_Searcher);

					std::set<uint64> l_Targets;

					for (Unit* l_Iter : l_TargetList)
					{
						l_Targets.insert(l_Iter->GetGUID());

						me->CastSpell(l_Iter, eSpells::CurseoftheLegion, true);
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
		}

		void SpellHitTarget(Unit* p_Target, SpellInfo const* p_SpellInfo) override
		{
			if (p_Target == nullptr)
				return;

			if (p_SpellInfo->Id == eSpells::CurseoftheLegion)
			{
				if (InstanceScript* l_Instance = me->GetInstanceScript())
				{
					std::list<Creature*> l_Mannoroth;
					me->GetCreatureListWithEntryInGrid(l_Mannoroth, eCitadelCreatures::BossMannoroth, 1000.0f);
					if (l_Mannoroth.front() != nullptr)
						l_Mannoroth.front()->AI()->Talk(eTalks::TalkCurseoftheLegion, p_Target->GetGUID(), TextRange::TEXT_RANGE_ZONE);
				}
			}
		}
	};

	CreatureAI* GetAI(Creature* p_Creature) const override
	{
		return new npc_citadel_fel_red_spire_mannAI(p_Creature);
	}
};

/// Fel Purple Spire - 464544
class npc_citadel_fel_purple_spire_mann : public CreatureScript
{
public:
	npc_citadel_fel_purple_spire_mann() : CreatureScript("npc_citadel_fel_purple_spire_mann") {}

	enum eActions
	{
		ActionBeam = 1,
		ActionFelImplosion
	};

	enum eSpells
	{
		BeamVisualOnBoss = 182259,
		FelImplosion = 181254
	};

	struct npc_citadel_fel_purple_spire_mannAI : public ScriptedAI
	{
		npc_citadel_fel_purple_spire_mannAI(Creature* p_Creature) : ScriptedAI(p_Creature)
		{
			m_Instance = p_Creature->GetInstanceScript();
		}

		InstanceScript* m_Instance;

		void Reset() override
		{
			me->SetReactState(ReactStates::REACT_PASSIVE);
			me->SetFlag(EUnitFields::UNIT_FIELD_FLAGS, eUnitFlags::UNIT_FLAG_IMMUNE_TO_PC | eUnitFlags::UNIT_FLAG_NON_ATTACKABLE);

			me->SetDisableGravity(true);
			me->SetDisplayId(11686);

			me->AI()->CanTargetOutOfLOS();

			me->CombatStop();
			me->CombatStopWithPets();
		}

		void EnterCombat(Unit* /*p_Attacker*/) override
		{

		}

		void DoAction(int32 const p_Action) override
		{
			switch (p_Action)
			{
				case eActions::ActionBeam:
				{
					me->SetOrientation(eCitadelCreatures::BossMannoroth);
					me->CastSpell(eCitadelCreatures::BossMannoroth, eSpells::BeamVisualOnBoss, true);
					break;
				}
				case eActions::ActionFelImplosion:
				{
					std::list<Unit*> l_TargetList;

					JadeCore::AnyUnfriendlyUnitInObjectRangeCheck l_Check(me, me, 1500.0f);
					JadeCore::UnitListSearcher<JadeCore::AnyUnfriendlyUnitInObjectRangeCheck> l_Searcher(me, l_TargetList, l_Check);
					me->VisitNearbyObject(500.0f, l_Searcher);

					std::set<uint64> l_Targets;

					for (Unit* l_Iter : l_TargetList)
					{
						l_Targets.insert(l_Iter->GetGUID());

						me->CastSpell(l_Iter, eSpells::FelImplosion, true);
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
		}
	};

	CreatureAI* GetAI(Creature* p_Creature) const override
	{
		return new npc_citadel_fel_purple_spire_mannAI(p_Creature);
	}
};

/// Fel Green Spire - 464545
class npc_citadel_fel_green_spire_mann : public CreatureScript
{
public:
	npc_citadel_fel_green_spire_mann() : CreatureScript("npc_citadel_fel_green_spire_mann") {}

	enum eActions
	{
		ActionBeam = 1,
		ActionFelImplosion
	};

	enum eSpells
	{
		BeamVisualOnBoss = 182259,
		FelImplosion = 181254
	};

	struct npc_citadel_fel_green_spire_mannAI : public ScriptedAI
	{
		npc_citadel_fel_green_spire_mannAI(Creature* p_Creature) : ScriptedAI(p_Creature)
		{
			m_Instance = p_Creature->GetInstanceScript();
		}

		InstanceScript* m_Instance;

		void Reset() override
		{
			me->SetReactState(ReactStates::REACT_PASSIVE);
			me->SetFlag(EUnitFields::UNIT_FIELD_FLAGS, eUnitFlags::UNIT_FLAG_IMMUNE_TO_PC | eUnitFlags::UNIT_FLAG_NON_ATTACKABLE);

			me->SetDisableGravity(true);
			me->SetDisplayId(11686);

			me->AI()->CanTargetOutOfLOS();

			me->CombatStop();
			me->CombatStopWithPets();
		}

		void EnterCombat(Unit* /*p_Attacker*/) override
		{

		}

		void DoAction(int32 const p_Action) override
		{
			switch (p_Action)
			{
			case eActions::ActionBeam:
			{
				me->SetOrientation(eCitadelCreatures::BossMannoroth);
				me->CastSpell(eCitadelCreatures::BossMannoroth, eSpells::BeamVisualOnBoss, true);
				break;
			}
			case eActions::ActionFelImplosion:
			{
				std::list<Unit*> l_TargetList;

				JadeCore::AnyUnfriendlyUnitInObjectRangeCheck l_Check(me, me, 1500.0f);
				JadeCore::UnitListSearcher<JadeCore::AnyUnfriendlyUnitInObjectRangeCheck> l_Searcher(me, l_TargetList, l_Check);
				me->VisitNearbyObject(500.0f, l_Searcher);

				std::set<uint64> l_Targets;

				for (Unit* l_Iter : l_TargetList)
				{
					l_Targets.insert(l_Iter->GetGUID());

					me->CastSpell(l_Iter, eSpells::FelImplosion, true);
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
		}
	};

	CreatureAI* GetAI(Creature* p_Creature) const override
	{
		return new npc_citadel_fel_green_spire_mannAI(p_Creature);
	}
};

/// Doom Lord - 91241
class npc_citadel_doom_lord_mann : public CreatureScript
{
public:
	npc_citadel_doom_lord_mann() : CreatureScript("npc_citadel_doom_lord_mann") {}

	enum eSpells
	{
		DoomSpikeAura = 181116, // While having this aura (invisible), melee attacks add the aura
		DoomSpikeDamage = 181122, // Casted when expired, look for stacks, then multiply when the effect expires
		DoomSpikeArea = 186526, // Only mythic, the damage is done in AoE

		MarkofDoom = 181099, // Cast, aura and circle
		MarkEruption = 181102, // Casted if target is damaged
		Doomed = 183610, // Casted if Mark of Doom expires

		ShadowBoltVolley = 181126
	};

	struct npc_citadel_doom_lord_mannAI : public ScriptedAI
	{
		npc_citadel_doom_lord_mannAI(Creature* p_Creature) : ScriptedAI(p_Creature)
		{
			m_Instance = p_Creature->GetInstanceScript();
		}

		std::list<uint64> m_Creatures;

		EventMap m_Events;
		EventMap m_CosmeticEvents;

		InstanceScript* m_Instance;

		void Reset() override
		{
			if (m_Instance != nullptr)
			{
				m_Instance->SendEncounterUnit(EncounterFrameType::ENCOUNTER_FRAME_DISENGAGE, me);
			}
		}

		void EnterCombat(Unit* /*p_Attacker*/) override
		{
			if (m_Instance != nullptr)
				m_Instance->SendEncounterUnit(EncounterFrameType::ENCOUNTER_FRAME_ENGAGE, me, 3);
		}

		void DoAction(int32 const p_Action) override
		{
			switch (p_Action)
			{

			default:
				break;
			}
		}

		void UpdateAI(uint32 const p_Diff) override
		{
			UpdateOperations(p_Diff);

			m_CosmeticEvents.Update(p_Diff);

			switch (m_CosmeticEvents.ExecuteEvent())
			{

			}
		}
	};

	CreatureAI* GetAI(Creature* p_Creature) const override
	{
		return new npc_citadel_doom_lord_mannAI(p_Creature);
	}
};

/// Fel Imp - 91259
class npc_citadel_fel_imp_mann : public CreatureScript
{
public:
	npc_citadel_fel_imp_mann() : CreatureScript("npc_citadel_fel_imp_mann") {}

	enum eEvents
	{
		EventRegenerateMana,
		EventFelBlast,
		EventCheckMana
	};

	enum eSpells
	{
		FelBlast = 181132,
		PhaseBlink = 181138
	};

	enum eTimers
	{
		TimerRegenerateMana = 1 * TimeConstants::IN_MILLISECONDS,
	};

	enum ePhases
	{
		TheLegionsMight = 1,
		TheResurrection,
		TruePower,
		Empowerment
	};

	struct npc_citadel_fel_imp_mannAI : public ScriptedAI
	{
		npc_citadel_fel_imp_mannAI(Creature* p_Creature) : ScriptedAI(p_Creature)
		{
			m_Instance = p_Creature->GetInstanceScript();
		}

		std::list<uint64> m_Creatures;

		EventMap m_Events;
		EventMap m_CosmeticEvents;

		InstanceScript* m_Instance;

		bool m_PhaseID;

		void Reset() override
		{
			me->SetReactState(ReactStates::REACT_AGGRESSIVE);

			me->RemoveFlag(EUnitFields::UNIT_FIELD_FLAGS_2, eUnitFlags2::UNIT_FLAG2_REGENERATE_POWER);
			me->setPowerType(Powers::POWER_MANA);
			me->SetMaxPower(Powers::POWER_MANA, 100);
			me->SetPower(Powers::POWER_MANA, 50);

			if (m_Instance != nullptr)
			{
				m_Instance->SendEncounterUnit(EncounterFrameType::ENCOUNTER_FRAME_DISENGAGE, me);
			}
		}

		void EnterCombat(Unit* /*p_Attacker*/) override
		{
			if (m_Instance != nullptr)
				m_Instance->SendEncounterUnit(EncounterFrameType::ENCOUNTER_FRAME_ENGAGE, me, 3);

			m_CosmeticEvents.ScheduleEvent(eEvents::EventRegenerateMana, eTimers::TimerRegenerateMana);

			m_Events.ScheduleEvent(eEvents::EventFelBlast, 2.5 * TimeConstants::IN_MILLISECONDS);
			m_Events.ScheduleEvent(eEvents::EventCheckMana, 1 * TimeConstants::IN_MILLISECONDS);
		}

		void DoAction(int32 const p_Action) override
		{
			switch (p_Action)
			{

			default:
				break;
			}
		}

		void UpdateAI(uint32 const p_Diff) override
		{
			UpdateOperations(p_Diff);

			m_CosmeticEvents.Update(p_Diff);

			m_Events.Update(p_Diff);

			if (me->HasUnitState(UnitState::UNIT_STATE_CASTING))
				return;

			switch (m_CosmeticEvents.ExecuteEvent())
			{
			case eEvents::EventRegenerateMana:
			{
				int32 l_Power = 0;

				switch (m_PhaseID)
				{
				case ePhases::TheLegionsMight:
				{
					l_Power = 3;
					break;
				}
				case ePhases::TheResurrection:
				{
					l_Power = 3;
					break;
				}

				default:
					break;
				}

				me->ModifyPower(Powers::POWER_MANA, l_Power);

				m_CosmeticEvents.ScheduleEvent(eEvents::EventRegenerateMana, eTimers::TimerRegenerateMana);
				break;
			}

			default:
				break;
			}

			switch (m_Events.ExecuteEvent())
			{
			case eEvents::EventFelBlast:
			{
				std::list<Player*> l_TargetList;
				float l_Radius = 80.0f;

				if (l_TargetList.empty())
					return;

				for (Player* l_Iter : l_TargetList)
				{
					me->CastSpell(l_Iter, eSpells::FelBlast, false);
					m_Events.ScheduleEvent(eEvents::EventFelBlast, 2.5 * TimeConstants::IN_MILLISECONDS);
				}
				break;
			}

			case eEvents::EventCheckMana:
			{
				if (me->GetPower(POWER_MANA) >= 75)
					me->AddAura(181138, me); // Energize Visual

				if (me->GetPower(POWER_MANA) >= me->GetMaxPower(POWER_MANA))
				{
					me->CastSpell(me, PhaseBlink, false);

					me->SetPower(POWER_MANA, 0);
					me->SetInt32Value(UNIT_FIELD_POWER, 0);
				}

				events.ScheduleEvent(eEvents::EventCheckMana, 1000);
				break;
			}

			default:
				break;
			}

			DoMeleeAttackIfReady();
		}
	};

	CreatureAI* GetAI(Creature* p_Creature) const override
	{
		return new npc_citadel_fel_imp_mannAI(p_Creature);
	}
};

/// Dread Infernal - 91270
class npc_citadel_dread_infernal_mann : public CreatureScript
{
public:
	npc_citadel_dread_infernal_mann() : CreatureScript("npc_citadel_dread_infernal_mann") {}

	enum eSpells
	{
		Broken = 180551,

		Transform = 181188,
		TargetFelStreak = 181190,
		DamageAndFire = 181193
	};

	struct npc_citadel_dread_infernal_mannAI : public ScriptedAI
	{
		npc_citadel_dread_infernal_mannAI(Creature* p_Creature) : ScriptedAI(p_Creature)
		{
			m_Instance = p_Creature->GetInstanceScript();
		}

		std::list<uint64> m_Creatures;

		EventMap m_Events;
		EventMap m_CosmeticEvents;

		InstanceScript* m_Instance;

		void Reset() override
		{
			me->AddAura(eSpells::Broken, me);

			if (m_Instance != nullptr)
			{
				m_Instance->SendEncounterUnit(EncounterFrameType::ENCOUNTER_FRAME_DISENGAGE, me);
			}
		}

		void EnterCombat(Unit* /*p_Attacker*/) override
		{
			if (m_Instance != nullptr)
				m_Instance->SendEncounterUnit(EncounterFrameType::ENCOUNTER_FRAME_ENGAGE, me, 3);
		}

		void DoAction(int32 const p_Action) override
		{
			switch (p_Action)
			{

			default:
				break;
			}
		}

		void UpdateAI(uint32 const p_Diff) override
		{
			UpdateOperations(p_Diff);

			m_CosmeticEvents.Update(p_Diff);

			switch (m_CosmeticEvents.ExecuteEvent())
			{

			}
		}
	};

	CreatureAI* GetAI(Creature* p_Creature) const override
	{
		return new npc_citadel_dread_infernal_mannAI(p_Creature);
	}
};

/// Massive Blast Wave - 454533
class npc_citadel_massive_blast_wave : public CreatureScript
{
public:
	npc_citadel_massive_blast_wave() : CreatureScript("npc_citadel_massive_blast_wave") { }

	enum Constants
	{
		DamageDelay = 1 * IN_MILLISECONDS, ///< Delay between damage cast (and self-snare check)
		HeightMaxStep = 2  ///< Maximum step
	};

	enum eSpells
	{
		WaveVisual = 185821,
		EmpoweredMassiveBlast = 189424, // Knockback and dmg
	};

	struct npc_citadel_massive_blast_waveAI : public ScriptedAI
	{
		uint32 m_DamageTimer;
		bool m_KeepMoving;
		float m_Orientation;
		float m_RotCos;
		float m_RotSin;
		Position m_StartPosition;
		std::vector<Position> m_PathPoints;
		uint32 m_PathPosition;

		npc_citadel_massive_blast_waveAI(Creature* p_Creature) : ScriptedAI(p_Creature)
		{
			m_KeepMoving = true;
			m_Orientation = me->GetOrientation();
			m_RotCos = std::cos(m_Orientation);
			m_RotSin = std::sin(m_Orientation);

			m_StartPosition = *me;
			m_StartPosition.m_positionZ += me->GetFloatValue(UNIT_FIELD_HOVER_HEIGHT);

			float l_MaxStep = float(Constants::HeightMaxStep);
			static int s_StepCount = 200;

			for (int l_I = 0; l_I < s_StepCount; ++l_I)
			{
				float l_Distance = float(l_I);

				Position l_Point;
				l_Point.m_positionX = m_StartPosition.m_positionX + (m_RotCos * l_Distance);
				l_Point.m_positionY = m_StartPosition.m_positionY + (m_RotSin * l_Distance);
				l_Point.m_positionZ = me->GetMap()->GetHeight(l_Point.m_positionX, l_Point.m_positionY, MAX_HEIGHT) + me->GetFloatValue(UNIT_FIELD_HOVER_HEIGHT);

				Position l_Origin;
				if (l_I > 1)
					l_Origin = m_PathPoints[l_I - 1];
				else
					l_Origin = m_StartPosition;

				float l_Diff = std::abs(l_Origin.m_positionZ - l_Point.m_positionZ);

				if (l_Diff > l_MaxStep)
					break;

				m_PathPoints.push_back(l_Point);
			}

			m_PathPosition = 0;

			if (!m_PathPoints.empty())
				me->GetMotionMaster()->MovePoint(1, m_PathPoints[m_PathPosition], false);
		}

		/// Called at waypoint reached or PointMovement end
		void MovementInform(uint32 p_Type, uint32 p_ID) override
		{
			if (p_Type == POINT_MOTION_TYPE && p_ID == 1)
			{
				m_PathPosition++;

				if (m_PathPosition < m_PathPoints.size())
					me->GetMotionMaster()->MovePoint(1, m_PathPoints[m_PathPosition], false);
			}
		}

		void EnterEvadeMode() override
		{
			///< No evade mode
		}

		void JustSummoned(Creature* p_Summon) override
		{
			DoZoneInCombat();

			me->SetDisableGravity(true);
			me->SetDisplayId(11686);
			me->SetReactState(ReactStates::REACT_PASSIVE);

			me->CastSpell(me, eSpells::WaveVisual, true);
		}

		void UpdateAI(const uint32 p_Diff) override
		{
			events.Update(p_Diff);

			m_DamageTimer += p_Diff;

			if (m_DamageTimer > Constants::DamageDelay)
			{
				const float l_MaxRadius = 8.0f; ///< Spell radius

				/// Find all the enemies in range
				std::list<Unit*> l_Targets;

				JadeCore::AnyUnfriendlyUnitInObjectRangeCheck l_Check(me, me, l_MaxRadius);
				JadeCore::UnitListSearcher<JadeCore::AnyUnfriendlyUnitInObjectRangeCheck> l_Searcher(me, l_Targets, l_Check);
				me->VisitNearbyObject(l_MaxRadius, l_Searcher);

				for (Unit* l_Target : l_Targets)
				{
					if (l_Target->isAlive() && me->GetExactDistSq(l_Target) < l_MaxRadius * l_MaxRadius && me->IsWithinLOSInMap(l_Target) && me->IsValidAttackTarget(l_Target))
					{
						me->CastSpell(l_Target, EmpoweredMassiveBlast, true);
					}
				}
			}

			Unit* l_DamageCaster = me;
			if (Unit* l_Owner = me->GetOwner())
				l_DamageCaster = l_Owner;

			m_DamageTimer -= Constants::DamageDelay;
		}
	};

	CreatureAI* GetAI(Creature* p_Creature) const
	{
		return new npc_citadel_massive_blast_waveAI(p_Creature);
	}
};

/// Archmage Khadgar - 95659
class npc_citadel_khadgar_mann : public CreatureScript
{
public:
	npc_citadel_khadgar_mann() : CreatureScript("npc_citadel_khadgar_mann") {}

	enum eTalks
	{
		Cosmetic1 = 0,
		Cosmetic2 = 1
	};

	enum eActions
	{
		ActionAppear = 1
	};

	enum eSpells
	{
		ArcaneChannel = 189654,
		TeleportVisual = 64446,
		ArcaneMissile = 176583,
		ArcaneBase = 158012
	};

	struct npc_citadel_khadgar_mannAI : public ScriptedAI
	{
		npc_citadel_khadgar_mannAI(Creature* p_Creature) : ScriptedAI(p_Creature)
		{
			m_Instance = p_Creature->GetInstanceScript();
		}

		EventMap m_Events;
		EventMap m_CosmeticEvents;

		InstanceScript* m_Instance;

		void Reset() override
		{
			me->SetFlag(EUnitFields::UNIT_FIELD_FLAGS, eUnitFlags::UNIT_FLAG_NON_ATTACKABLE);
			me->SetSpeed(UnitMoveType::MOVE_WALK, 1.0f, true);
			me->SetCanFly(false);
			me->SetVisible(false);
		}

		void DoAction(int32 const p_Action) override
		{
			switch (p_Action)
			{
				case eActions::ActionAppear:
				{
					AddTimedDelayedOperation(3 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->SetWalk(true);
						me->SetSpeed(UnitMoveType::MOVE_WALK, 1.0f, true);
						me->SetVisible(true);
						me->CastSpell(me, eSpells::TeleportVisual, true);
					});

					AddTimedDelayedOperation(6 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						Talk(eTalks::Cosmetic1);
					});

					AddTimedDelayedOperation(10 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->GetMotionMaster()->MovePoint(1, -2984.538f, -292.411f, 606.2307f);
					});

					AddTimedDelayedOperation(16 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						Talk(eTalks::Cosmetic2);
						me->CastSpell(me, eSpells::ArcaneChannel, true);
					});

					AddTimedDelayedOperation(21 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->SummonCreature(eCitadelCreatures::PortalMann, -2998.476f, -291.874f, 606.2305f);
					});

					AddTimedDelayedOperation(23 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->RemoveAura(eSpells::ArcaneChannel);
						me->GetMotionMaster()->MovePoint(1, -2998.476f, -291.874f, 606.2305f);
					});

					AddTimedDelayedOperation(26 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->CastSpell(me, eSpells::TeleportVisual, true);
					});

					AddTimedDelayedOperation(27.5 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->SetVisible(false);
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

			switch (m_CosmeticEvents.ExecuteEvent())
			{

			}
		}
	};

	CreatureAI* GetAI(Creature* p_Creature) const override
	{
		return new npc_citadel_khadgar_mannAI(p_Creature);
	}
};

/// Khadgar's Portal - 95699
class npc_citadel_khadgar_portal_mann : public CreatureScript
{
public:
	npc_citadel_khadgar_portal_mann() : CreatureScript("npc_citadel_khadgar_portal_mann") {}

	enum eSpells
	{
		PortalVisual = 190813,
		Teleport = 189669
	};

	struct npc_citadel_khadgar_portal_mannAI : public ScriptedAI
	{
		npc_citadel_khadgar_portal_mannAI(Creature* p_Creature) : ScriptedAI(p_Creature)
		{
			m_Instance = p_Creature->GetInstanceScript();
		}

		InstanceScript* m_Instance;

		void Reset() override
		{
			me->SetFlag(EUnitFields::UNIT_FIELD_FLAGS, eUnitFlags::UNIT_FLAG_NON_ATTACKABLE);

			me->SetFlag(EUnitFields::UNIT_FIELD_NPC_FLAGS, NPCFlags::UNIT_NPC_FLAG_SPELLCLICK);

			me->SetUInt32Value(EUnitFields::UNIT_FIELD_INTERACT_SPELL_ID, eSpells::Teleport);

			me->CastSpell(me, eSpells::PortalVisual, true);
		}

		void DoAction(int32 const p_Action) override
		{
			switch (p_Action)
			{

			default:
				break;
			}
		}

		void UpdateAI(uint32 const p_Diff) override
		{
			UpdateOperations(p_Diff);
		}

		void OnSpellClick(Unit* p_Clicker) override
		{
			if (p_Clicker->HasAura(eSpells::Teleport))
				return;

			p_Clicker->CastSpell(p_Clicker, eSpells::Teleport, true);
		}
	};

	CreatureAI* GetAI(Creature* p_Creature) const override
	{
		return new npc_citadel_khadgar_portal_mannAI(p_Creature);
	}
};

/// Curse of the Legion - 181275
class spell_citadel_curse_of_the_legion : public SpellScriptLoader
{
public:
	spell_citadel_curse_of_the_legion() : SpellScriptLoader("spell_citadel_curse_of_the_legion") { }

	class spell_citadel_curse_of_the_legion_AuraScript : public AuraScript
	{
		PrepareAuraScript(spell_citadel_curse_of_the_legion_AuraScript)

		void OnTick(AuraEffect const* /*p_AurEff*/)
		{
			if (Unit* l_Caster = GetCaster())
			{
				if (Unit* l_Target = GetTarget())
				{
					uint32 l_TriggerID = GetSpellInfo()->Effects[EFFECT_0].TriggerSpell;
					l_Caster->CastSpell(l_Target, l_TriggerID, true);

					l_Caster->CastSpell(l_Target, 183325, true); // Spawn Doom Lord
				}
			}
		}

		void Register() override
		{
			OnEffectPeriodic += AuraEffectPeriodicFn(spell_citadel_curse_of_the_legion_AuraScript::OnTick, EFFECT_0, SPELL_AURA_PERIODIC_DUMMY);
		}
	};

	AuraScript* GetAuraScript() const override
	{
		return new spell_citadel_curse_of_the_legion_AuraScript();
	}
};

/// Mannoroth's Gaze - 181597
class spell_citadel_mannoroth_gaze : public SpellScriptLoader
{
public:
	spell_citadel_mannoroth_gaze() : SpellScriptLoader("spell_citadel_mannoroth_gaze") { }

	class spell_citadel_mannoroth_gaze_AuraScript : public AuraScript
	{
		PrepareAuraScript(spell_citadel_mannoroth_gaze_AuraScript)

		void AfterHit(AuraEffect const* /*p_AurEff*/)
		{
			if (Unit* l_Caster = GetCaster())
			{
				if (Unit* l_Target = GetTarget())
				{
					l_Caster->CastSpell(l_Target, 181617, true); // Damage
				}
		}
	}

		void Register() override
		{
			OnEffectPeriodic += AuraEffectPeriodicFn(spell_citadel_mannoroth_gaze_AuraScript::AfterHit, EFFECT_0, SPELL_AURA_PERIODIC_DUMMY);
		}
	};

	AuraScript* GetAuraScript() const override
	{
		return new spell_citadel_mannoroth_gaze_AuraScript();
	}
};

/// Mannoroth's Gaze Damage - 181617
class spell_citadel_mannoroth_gaze_damage : public SpellScriptLoader
{
public:
	spell_citadel_mannoroth_gaze_damage() : SpellScriptLoader("spell_citadel_mannoroth_gaze_damage") { }

	class spell_citadel_mannoroth_gaze_damage_SpellScript : public SpellScript
	{
		PrepareSpellScript(spell_citadel_mannoroth_gaze_damage_SpellScript)

			uint8 m_TargetCount;

		bool Load() override
		{
			m_TargetCount = 0;
			return true;
		}

		void CorrectTargets(std::list<WorldObject*>& p_Targets)
		{
			m_TargetCount = (uint8)p_Targets.size();
		}

		void HandleDamage(SpellEffIndex /*p_EffIndex*/)
		{
			if (m_TargetCount)
				SetHitDamage(GetHitDamage() / m_TargetCount);
		}

		void Register() override
		{
			OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_citadel_mannoroth_gaze_damage_SpellScript::CorrectTargets, EFFECT_0, TARGET_UNIT_CONE_ENEMY_104);
			OnEffectHitTarget += SpellEffectFn(spell_citadel_mannoroth_gaze_damage_SpellScript::HandleDamage, EFFECT_0, SPELL_EFFECT_SCHOOL_DAMAGE);
		}
	};

	SpellScript* GetSpellScript() const override
	{
		return new spell_citadel_mannoroth_gaze_damage_SpellScript();
	}
};

// 189669 - Teleport from Mannoroth to Black Gate
class spell_citadel_teleport_mann_to_blackgate : public SpellScript
{
	PrepareSpellScript(spell_citadel_teleport_mann_to_blackgate);

	enum eMoves
	{
		FlytoBlackGate
	};

	enum eSpells
	{
		TeleportVisual = 64446,
		Teleport = 189669
	};

	EventMap m_Events;
	EventMap m_CosmeticEvents;

	void OnSpellHit()
	{
		if (Unit* l_Caster = GetCaster())
		{
			l_Caster->SetSpeed(UnitMoveType::MOVE_FLIGHT, 5.0f, true);
			l_Caster->GetMotionMaster()->MoveSmoothFlyPath(eMoves::FlytoBlackGate, g_FlyingEnd.data(), g_FlyingEnd.size());
		}
	}

	void WaypointReached(uint32 waypointId)
	{
		switch (waypointId)
		{
			case 3:
			{
				Unit* l_Caster;

				l_Caster->NearTeleportTo(4065.62f, -2114.83f, 51.148f, 4.71745f);
				l_Caster->SetCanFly(false);
				l_Caster->RemoveAurasDueToSpell(eSpells::Teleport);
				l_Caster->CastSpell(l_Caster, eSpells::TeleportVisual, true); // Teleport visual
			}
		}
	}

	void Register() override
	{
		OnHit += SpellHitFn(spell_citadel_teleport_mann_to_blackgate::OnSpellHit);
	}
};

// 185256 - Spire Channel 5s triggered
class spell_citadel_spire_channel : public SpellScriptLoader
{
public:

	spell_citadel_spire_channel() : SpellScriptLoader("spell_citadel_spire_channel") { }

	class spell_citadel_spire_channel_SpellScript : public SpellScript
	{
		PrepareSpellScript(spell_citadel_spire_channel_SpellScript);

		std::list<WorldObject*> m_RealList;

		void CorrectTargets(std::list<WorldObject*>& p_Targets)
		{
			if (p_Targets.empty())
				return;

			if (Unit* l_Caster = GetCaster())
			{
				for (WorldObject* l_Target : p_Targets)
				{
					if (l_Target->GetEntry() == eCitadelCreatures::ChannelTarget)
						m_RealList.push_back(l_Target);
				}

				p_Targets.clear();
				for (WorldObject* l_Itr : m_RealList)
				{
					p_Targets.push_back(l_Itr);
				}
			}
		}

		void Register() override
		{
			OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_citadel_spire_channel_SpellScript::CorrectTargets, SpellEffIndex::EFFECT_0, Targets::TARGET_UNIT_NEARBY_ENTRY);
		}
	};

	SpellScript* GetSpellScript() const override
	{
		return new spell_citadel_spire_channel_SpellScript();
	}
};

// 187029 - Spire Channel Perma triggered
class spell_citadel_spire_channel_perma : public SpellScriptLoader
{
public:

	spell_citadel_spire_channel_perma() : SpellScriptLoader("spell_citadel_spire_channel_perma") { }

	class spell_citadel_spire_channel_perma_SpellScript : public SpellScript
	{
		PrepareSpellScript(spell_citadel_spire_channel_perma_SpellScript);

		std::list<WorldObject*> m_RealList;

		void CorrectTargets(std::list<WorldObject*>& p_Targets)
		{
			if (p_Targets.empty())
				return;

			if (Unit* l_Caster = GetCaster())
			{
				for (WorldObject* l_Target : p_Targets)
				{
					if (l_Target->GetEntry() == eCitadelCreatures::ChannelTarget)
						m_RealList.push_back(l_Target);
				}

				p_Targets.clear();
				for (WorldObject* l_Itr : m_RealList)
				{
					p_Targets.push_back(l_Itr);
				}
			}
		}

		void Register() override
		{
			OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_citadel_spire_channel_perma_SpellScript::CorrectTargets, SpellEffIndex::EFFECT_0, Targets::TARGET_UNIT_NEARBY_ENTRY);
		}
	};

	SpellScript* GetSpellScript() const override
	{
		return new spell_citadel_spire_channel_perma_SpellScript();
	}
};

// 182259 - Beam Visual from Spire to boss
class spell_citadel_spire_beam : public SpellScriptLoader
{
public:

	spell_citadel_spire_beam() : SpellScriptLoader("spell_citadel_spire_beam") { }

	class spell_citadel_spire_beam_SpellScript : public SpellScript
	{
		PrepareSpellScript(spell_citadel_spire_beam_SpellScript);

		std::list<WorldObject*> m_RealList;

		void CorrectTargets(std::list<WorldObject*>& p_Targets)
		{
			if (p_Targets.empty())
				return;

			if (Unit* l_Caster = GetCaster())
			{
				for (WorldObject* l_Target : p_Targets)
				{
					if (l_Target->GetEntry() == eCitadelCreatures::BossMannoroth)
						m_RealList.push_back(l_Target);
				}

				p_Targets.clear();
				for (WorldObject* l_Itr : m_RealList)
				{
					p_Targets.push_back(l_Itr);
				}
			}
		}

		void Register() override
		{
			OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_citadel_spire_beam_SpellScript::CorrectTargets, SpellEffIndex::EFFECT_0, Targets::TARGET_UNIT_NEARBY_ENTRY);
		}
	};

	SpellScript* GetSpellScript() const override
	{
		return new spell_citadel_spire_beam_SpellScript();
	}
};

// 186648 - Mythic Beam Visual from Fel Summoner to boss
class spell_citadel_summoner_beam : public SpellScriptLoader
{
public:

	spell_citadel_summoner_beam() : SpellScriptLoader("spell_citadel_summoner_beam") { }

	class spell_citadel_summoner_beam_SpellScript : public SpellScript
	{
		PrepareSpellScript(spell_citadel_summoner_beam_SpellScript);

		std::list<WorldObject*> m_RealList;

		void CorrectTargets(std::list<WorldObject*>& p_Targets)
		{
			if (p_Targets.empty())
				return;

			if (Unit* l_Caster = GetCaster())
			{
				for (WorldObject* l_Target : p_Targets)
				{
					if (l_Target->GetEntry() == eCitadelCreatures::BossMannoroth)
						m_RealList.push_back(l_Target);
				}

				p_Targets.clear();
				for (WorldObject* l_Itr : m_RealList)
				{
					p_Targets.push_back(l_Itr);
				}
			}
		}

		void Register() override
		{
			OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_citadel_summoner_beam_SpellScript::CorrectTargets, SpellEffIndex::EFFECT_0, Targets::TARGET_UNIT_NEARBY_ENTRY);
		}
	};

	SpellScript* GetSpellScript() const override
	{
		return new spell_citadel_summoner_beam_SpellScript();
	}
};

/// Blood of Mannoroth - 182168
class areatrigger_citadel_mannoroth_blood : public AreaTriggerEntityScript
{
public:
	areatrigger_citadel_mannoroth_blood() : AreaTriggerEntityScript("areatrigger_citadel_mannoroth_blood") { }

	enum eSpell
	{
		MannorothBloodDoT = 182171
	};

	std::set<uint64> m_AffectedPlayers;

	void OnCreate(AreaTrigger* p_AreaTrigger) override
	{
		uint32 l_Duration = 10080 * TimeConstants::MINUTE;

		p_AreaTrigger->SetDuration(l_Duration);
	}

	void OnUpdate(AreaTrigger* p_AreaTrigger, uint32 /*p_Time*/) override
	{
		if (Unit* l_Caster = p_AreaTrigger->GetCaster())
		{
			std::list<Unit*> l_TargetList;
			float l_Radius = 40.0f;

			JadeCore::AnyUnfriendlyUnitInObjectRangeCheck l_Check(p_AreaTrigger, l_Caster, l_Radius);
			JadeCore::UnitListSearcher<JadeCore::AnyUnfriendlyUnitInObjectRangeCheck> l_Searcher(p_AreaTrigger, l_TargetList, l_Check);
			p_AreaTrigger->VisitNearbyObject(l_Radius, l_Searcher);

			std::set<uint64> l_Targets;

			for (Unit* l_Iter : l_TargetList)
			{
				l_Targets.insert(l_Iter->GetGUID());

				if (!l_Iter->HasAura(eSpell::MannorothBloodDoT))
				{
					m_AffectedPlayers.insert(l_Iter->GetGUID());
					l_Iter->CastSpell(l_Iter, eSpell::MannorothBloodDoT, true);
				}
			}

			for (std::set<uint64>::iterator l_Iter = m_AffectedPlayers.begin(); l_Iter != m_AffectedPlayers.end();)
			{
				if (l_Targets.find((*l_Iter)) != l_Targets.end())
				{
					++l_Iter;
					continue;
				}

				if (Unit* l_Unit = Unit::GetUnit(*l_Caster, (*l_Iter)))
				{
					l_Iter = m_AffectedPlayers.erase(l_Iter);
					l_Unit->RemoveAura(eSpell::MannorothBloodDoT);

					continue;
				}

				++l_Iter;
			}
		}
	}

	void OnRemove(AreaTrigger* p_AreaTrigger, uint32 /*p_Time*/) override
	{
		if (Unit* l_Caster = p_AreaTrigger->GetCaster())
		{
			for (uint64 l_Guid : m_AffectedPlayers)
			{
				if (Unit* l_Unit = Unit::GetUnit(*l_Caster, l_Guid))
					l_Unit->RemoveAura(eSpell::MannorothBloodDoT);
			}
		}
	}

	AreaTriggerEntityScript* GetAI() const override
	{
		return new areatrigger_citadel_mannoroth_blood();
	}
};

/// Mannoroth Platform Fix - 600000
class go_citadel_mannoroth_platform_fix : public GameObjectScript
{
public:
	go_citadel_mannoroth_platform_fix() : GameObjectScript("go_citadel_mannoroth_platform_fix") { }

	struct go_citadel_mannoroth_platform_fixAI : public GameObjectAI
	{
		go_citadel_mannoroth_platform_fixAI(GameObject* p_GameObject) : GameObjectAI(p_GameObject) { }

		bool ScriptedCollide(float p_X, float p_Y, float p_Z, float* p_OutZ /*= nullptr*/) const override
		{
			float const l_Radius = 70.0f;

			float l_PlatformXCenter = go->m_positionX + 353.0f;
			float l_PlatformYCenter = go->m_positionY - 53.0f;

			float l_PlatformZMin = go->m_positionZ + 280.0f;
			float l_PlatformZMax = go->m_positionZ + 300.0f;

			bool l_IsInRadius = sqrt(std::pow(l_PlatformXCenter - p_X, 2) + std::pow(l_PlatformYCenter - p_Y, 2)) <= l_Radius;
			bool l_IsInHeightRange = p_Z >= l_PlatformZMin && p_Z <= l_PlatformZMax;

			GameObjectDestructibleState l_State = go->GetDestructibleState();

			if (l_IsInRadius && l_IsInHeightRange && l_State == GameObjectDestructibleState::GO_DESTRUCTIBLE_DAMAGED)
			{
				float l_ThisFloorHeight = go->m_positionZ + 283.0f;
				float l_ThisFloorHeightMin = go->m_positionZ + 275.0f;

				if (p_Z >= l_ThisFloorHeightMin)
				{
					if (p_OutZ)
						*p_OutZ = l_ThisFloorHeight;

					return true;
				}
			}

			return false;
		}
	};

	GameObjectAI* GetAI(GameObject* p_GameObject) const override
	{
		return new go_citadel_mannoroth_platform_fixAI(p_GameObject);
	}
};

#ifndef __clang_analyzer__
void AddSC_boss_mannoroth_hfc()
{
	/// Boss
	new boss_mannoroth_hfc();
	new boss_fel_iron_summoner();

	/// Creatures
	new npc_citadel_doom_lord_mann();
	new npc_citadel_fel_imp_mann();
	new npc_citadel_dread_infernal_mann();
	new npc_citadel_massive_blast_wave();

	/// Cosmetic ones
	new npc_citadel_guldan_mann();
	new npc_citadel_khadgar_mann();
	new npc_citadel_fel_red_spire_mann();
	new npc_citadel_fel_purple_spire_mann();
	new npc_citadel_fel_green_spire_mann();
	new npc_citadel_khadgar_portal_mann();

	/// Spells
	new spell_citadel_spire_channel();
	new spell_citadel_spire_channel_perma();
	new spell_citadel_spire_beam();
	new spell_citadel_summoner_beam();

	new spell_citadel_teleport_mann_to_blackgate();

	new spell_citadel_curse_of_the_legion();

	/// Areatriggers
	new areatrigger_citadel_mannoroth_blood();

	/// Objects
	new go_citadel_mannoroth_platform_fix();
}
#endif