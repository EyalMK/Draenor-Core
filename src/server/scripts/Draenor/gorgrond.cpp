////////////////////////////////////////////////////////////////////////////////
//
// Project-Hellscream https://hellscream.org
// Copyright (C) 2018-2020 Project-Hellscream-6.2
// Discord https://discord.gg/CWCF3C9
//
////////////////////////////////////////////////////////////////////////////////


#include "Gorgrond.hpp"

#include "ScriptPCH.h"
#include "ScriptedEscortAI.h"
#include "ScriptedCreature.h"
#include "ObjectMgr.h"
#include "GameObjectAI.h"
#include "Language.h"
#include "NPCHandler.h"
#include "PhaseMgr.h"
#include "Common.h"

/// Tarlna the Ageless - 81535
class boss_tarlna_the_ageless : public CreatureScript
{
public:
	boss_tarlna_the_ageless() : CreatureScript("boss_tarlna_the_ageless") { }

	enum eDatas
	{
		MainHandEquipID = 118056,
		MaxGiantLasherSpawns = 15,
		HealthScalingCoeff = 10,
		DamageScalingCoeff = 1
	};

	enum eSpells
	{
		SouthshoreMobScalingAura = 169704,
		SpellColossalBlow = 175973,
		SpellSavageVines = 176001,   ///< Trigger 176004 after 8s
		SpellGrowUntamedMandragora = 176013,   ///< Missile 176014 on random destination
		SpellGenesisMissile = 175975,   ///< Missile 175980 on random destination (summon Giant Lasher)
		SpellGenesis = 175979    ///< Trigger 175978 after 6s -> SPELL_EFFECT_226 on TARGET_UNIT_SRC_AREA_ENTRY miscA = 422409
	};

	enum eEvents
	{
		EventColossalBlow = 1,
		EventSavageVines,
		EventGrowUntamedMandragora,
		EventGenesis
	};

	struct boss_tarlna_the_agelessAI : public ScriptedAI
	{
		boss_tarlna_the_agelessAI(Creature* p_Creature) : ScriptedAI(p_Creature) { }

		EventMap m_Events;

		void Reset()
		{
			m_Events.Reset();

			me->RemoveAura(eSpells::SouthshoreMobScalingAura);

			summons.DespawnAll();

			SetEquipmentSlots(false, eDatas::MainHandEquipID);
		}

		void JustDied(Unit* /*p_Killer*/)
		{
			summons.DespawnAll();
		}

		void EnterCombat(Unit*)
		{
			me->CastSpell(me, eSpells::SouthshoreMobScalingAura, true);
			m_Events.ScheduleEvent(eEvents::EventColossalBlow, 14 * TimeConstants::IN_MILLISECONDS);
			m_Events.ScheduleEvent(eEvents::EventSavageVines, 7 * TimeConstants::IN_MILLISECONDS);
			m_Events.ScheduleEvent(eEvents::EventGrowUntamedMandragora, 18 * TimeConstants::IN_MILLISECONDS);
			m_Events.ScheduleEvent(eEvents::EventGenesis, 20 * TimeConstants::IN_MILLISECONDS);
		}

		void UpdateAI(uint32 const p_Diff)
		{
			if (!UpdateVictim())
				return;

			if (me->GetDistance(me->GetHomePosition()) >= 100.0f)
			{
				EnterEvadeMode();
				return;
			}

			HandleHealthAndDamageScaling();

			m_Events.Update(p_Diff);

			if (me->HasUnitState(UnitState::UNIT_STATE_CASTING))
				return;

			switch (m_Events.ExecuteEvent())
			{
			case eEvents::EventColossalBlow:
			{
				if (Unit* l_Target = SelectTarget(SelectAggroTarget::SELECT_TARGET_RANDOM))
				{
					me->SetFacingTo(me->GetAngle(l_Target));
					me->CastSpell(l_Target, eSpells::SpellColossalBlow, false);
				}

				m_Events.ScheduleEvent(eEvents::EventColossalBlow, 60 * TimeConstants::IN_MILLISECONDS);
				break;
			}
			case eEvents::EventSavageVines:
			{
				if (Unit* l_Target = SelectTarget(SelectAggroTarget::SELECT_TARGET_TOPAGGRO))
				{
					me->SetFacingTo(me->GetAngle(l_Target));
					me->CastSpell(l_Target, eSpells::SpellSavageVines, false);
				}

				m_Events.ScheduleEvent(eEvents::EventSavageVines, 20 * TimeConstants::IN_MILLISECONDS);
				break;
			}
			case eEvents::EventGrowUntamedMandragora:
			{
				me->CastSpell(me, eSpells::SpellGrowUntamedMandragora, true);
				m_Events.ScheduleEvent(eEvents::EventGrowUntamedMandragora, 30 * TimeConstants::IN_MILLISECONDS);
				break;
			}
			case eEvents::EventGenesis:
			{
				me->MonsterTextEmote(TrinityStrings::LangWarnGenesis, 0, true);
				SummonGiantLashers(eDatas::MaxGiantLasherSpawns);

				if (Unit* l_Target = SelectTarget(SelectAggroTarget::SELECT_TARGET_TOPAGGRO))
				{
					me->SetFacingTo(me->GetAngle(l_Target));
					me->CastSpell(l_Target, eSpells::SpellGenesis, false);
				}

				m_Events.ScheduleEvent(eEvents::EventGenesis, 45 * TimeConstants::IN_MILLISECONDS);
				break;
			}
			default:
				break;
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

			if (Aura* l_Scaling = me->GetAura(eSpells::SouthshoreMobScalingAura))
			{
				if (AuraEffect* l_Damage = l_Scaling->GetEffect(EFFECT_0))
				{
					if ((eDatas::DamageScalingCoeff * l_Count) != l_Damage->GetAmount())
						l_Damage->ChangeAmount(eDatas::DamageScalingCoeff * l_Count);
				}

				if (AuraEffect* l_Health = l_Scaling->GetEffect(EFFECT_1))
				{
					if ((eDatas::HealthScalingCoeff * l_Count) != l_Health->GetAmount())
						l_Health->ChangeAmount(eDatas::HealthScalingCoeff * l_Count);
				}
			}
		}

		void SummonGiantLashers(uint32 p_Count)
		{
			for (uint32 l_I = 0; l_I < p_Count; ++l_I)
				me->CastSpell(me, eSpells::SpellGenesisMissile, true);
		}
	};

	CreatureAI* GetAI(Creature* p_Creature) const
	{
		return new boss_tarlna_the_agelessAI(p_Creature);
	}
};

/// Drov the Ruiner - 81252
class boss_drov_the_ruiner : public CreatureScript
{
public:
	boss_drov_the_ruiner() : CreatureScript("boss_drov_the_ruiner") { }

	enum eDatas
	{
		HealthScalingCoeff = 10,
		DamageScalingCoeff = 1,
		RumblingGoren = 88106,
		FrenziedGoren = 88119
	};

	enum eSpells
	{
		SouthshoreMobScalingAura = 169704,
		SpellColossalSlam = 175791,   ///< Damaging in front cone
		SpellGigaSmash = 175953,   ///< Damaging all ennemies
		SpellCallOfEarth = 175827,   ///< Periodic trigger 172911 -> launchs 175835 missile (summon and AoE damage)
		GorenEmergeSearcher = 175911,   ///< Triggers 175915
		GorenEmerge = 175912
	};

	enum eEvents
	{
		EventColossalSlam = 1,
		EventCallOfEarth,
		EventGigaSmash
	};

	enum eAction
	{
		ActionGorenSubmerge
	};

	struct boss_drov_the_ruinerAI : public ScriptedAI
	{
		boss_drov_the_ruinerAI(Creature* p_Creature) : ScriptedAI(p_Creature) { }

		EventMap m_Events;

		std::list<uint64> m_GorenList;

		void Reset() override
		{
			m_Events.Reset();

			summons.DespawnAll();
			m_GorenList.clear();

			me->RemoveAura(eSpells::SouthshoreMobScalingAura);
		}

		void JustDied(Unit* /*p_Killer*/) override
		{
			summons.DespawnAll();
			m_GorenList.clear();
		}

		void JustSummoned(Creature* p_Summoned) override
		{
			summons.Summon(p_Summoned);

			if (p_Summoned->GetEntry() == eDatas::RumblingGoren)
				m_GorenList.push_back(p_Summoned->GetGUID());
			else if (p_Summoned->GetEntry() == eDatas::FrenziedGoren)
			{
				if (Unit* l_Target = SelectTarget(SelectAggroTarget::SELECT_TARGET_RANDOM))
					p_Summoned->AI()->AttackStart(l_Target);
			}
		}

		void EnterCombat(Unit*) override
		{
			me->CastSpell(me, eSpells::SouthshoreMobScalingAura, true);
			m_Events.ScheduleEvent(eEvents::EventColossalSlam, 6000);
			m_Events.ScheduleEvent(eEvents::EventCallOfEarth, 18000);
			m_Events.ScheduleEvent(eEvents::EventGigaSmash, 13000);
		}

		void SpellHitTarget(Unit* p_Target, SpellInfo const* p_SpellInfo) override
		{
			if (p_Target == nullptr)
				return;

			if (p_SpellInfo->Id == eSpells::GorenEmergeSearcher)
				me->CastSpell(p_Target, eSpells::GorenEmerge, true);
		}

		void DoAction(int32 const p_Action) override
		{
			if (p_Action == eAction::ActionGorenSubmerge)
			{
				me->CastSpell(me, eSpells::GorenEmergeSearcher, true);

				for (uint64 l_Guid : m_GorenList)
				{
					if (Creature* l_Goren = Creature::GetCreature(*me, l_Guid))
						l_Goren->AI()->DoAction(eAction::ActionGorenSubmerge);
				}
			}
		}

		void UpdateAI(uint32 const p_Diff) override
		{
			if (!UpdateVictim())
				return;

			if (me->GetDistance(me->GetHomePosition()) >= 100.0f)
			{
				EnterEvadeMode();
				return;
			}

			HandleHealthAndDamageScaling();

			m_Events.Update(p_Diff);

			if (me->HasUnitState(UnitState::UNIT_STATE_CASTING))
				return;

			switch (m_Events.ExecuteEvent())
			{
			case eEvents::EventColossalSlam:
				if (Unit* l_Target = SelectTarget(SelectAggroTarget::SELECT_TARGET_RANDOM))
					me->SetFacingTo(me->GetAngle(l_Target));
				me->CastSpell(me, eSpells::SpellColossalSlam, false);
				m_Events.ScheduleEvent(eEvents::EventColossalSlam, 20000);
				break;
			case eEvents::EventCallOfEarth:
				me->CastSpell(me, eSpells::SpellCallOfEarth, false);
				m_Events.ScheduleEvent(eEvents::EventCallOfEarth, 90000);
				break;
			case eEvents::EventGigaSmash:
				me->CastSpell(me, eSpells::SpellGigaSmash, true);
				m_Events.ScheduleEvent(eEvents::EventGigaSmash, 25000);
				break;
			default:
				break;
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

			if (Aura* l_Scaling = me->GetAura(eSpells::SouthshoreMobScalingAura))
			{
				if (AuraEffect* l_Damage = l_Scaling->GetEffect(EFFECT_0))
				{
					if ((eDatas::DamageScalingCoeff * l_Count) != l_Damage->GetAmount())
						l_Damage->ChangeAmount(eDatas::DamageScalingCoeff * l_Count);
				}

				if (AuraEffect* l_Health = l_Scaling->GetEffect(EFFECT_1))
				{
					if ((eDatas::HealthScalingCoeff * l_Count) != l_Health->GetAmount())
						l_Health->ChangeAmount(eDatas::HealthScalingCoeff * l_Count);
				}
			}
		}
	};

	CreatureAI* GetAI(Creature* p_Creature) const
	{
		return new boss_drov_the_ruinerAI(p_Creature);
	}
};

/// Untamed Mandragora - 88150
class npc_untamed_mandragora : public CreatureScript
{
public:
	npc_untamed_mandragora() : CreatureScript("npc_untamed_mandragora") { }

	enum eSpells
	{
		SpellNoxiousSpitAT = 176035
	};

	enum eEvents
	{
		EventNoxiousSpit = 1
	};

	struct npc_untamed_mandragoraAI : public CreatureAI
	{
		npc_untamed_mandragoraAI(Creature* p_Creature) : CreatureAI(p_Creature) { }

		EventMap m_Events;

		void Reset()
		{
			m_Events.Reset();

			me->RemoveAllAreasTrigger();
		}

		void EnterCombat(Unit* /*p_Attacker*/)
		{
			m_Events.ScheduleEvent(eEvents::EventNoxiousSpit, 8 * TimeConstants::IN_MILLISECONDS);
		}

		void UpdateAI(const uint32 p_Diff)
		{
			if (!UpdateVictim())
				return;

			if (me->HasUnitState(UnitState::UNIT_STATE_CASTING))
				return;

			m_Events.Update(p_Diff);

			switch (m_Events.ExecuteEvent())
			{
			case eEvents::EventNoxiousSpit:
				if (Unit* l_Target = SelectTarget(SelectAggroTarget::SELECT_TARGET_RANDOM))
					me->CastSpell(l_Target, eSpells::SpellNoxiousSpitAT, true);
				m_Events.ScheduleEvent(eEvents::EventNoxiousSpit, 8 * TimeConstants::IN_MILLISECONDS);
				break;
			default:
				break;
			}

			DoMeleeAttackIfReady();
		}
	};

	CreatureAI* GetAI(Creature* p_Creature) const
	{
		return new npc_untamed_mandragoraAI(p_Creature);
	}
};

/// Giant Lasher - 88142
class npc_giant_lasher : public CreatureScript
{
public:
	npc_giant_lasher() : CreatureScript("npc_giant_lasher") { }

	enum eSpells
	{
		SpellGenesisAura = 175977,  ///< SPELL_AURA_395 -> AreaTrigger
		SpellGenesisAwake = 175978,
		SpellSubmerged = 175123,
		SpellLasherVenom = 176000
	};

	struct npc_giant_lasherAI : public CreatureAI
	{
		npc_giant_lasherAI(Creature* p_Creature) : CreatureAI(p_Creature)
		{
			m_CheckPlayerTimer = 0;
		}

		uint32 m_CheckPlayerTimer;

		void Reset()
		{
			m_CheckPlayerTimer = 500;

			me->SetReactState(ReactStates::REACT_PASSIVE);
			me->SetFlag(EUnitFields::UNIT_FIELD_FLAGS, eUnitFlags::UNIT_FLAG_NON_ATTACKABLE);
			me->CastSpell(me, eSpells::SpellGenesisAura, true);
			me->CastSpell(me, eSpells::SpellSubmerged, true);
		}

		void SpellHit(Unit* /*p_Caster*/, SpellInfo const* p_SpellInfo)
		{
			if (p_SpellInfo->Id == eSpells::SpellGenesisAwake)
			{
				m_CheckPlayerTimer = 0;

				me->SetReactState(ReactStates::REACT_AGGRESSIVE);
				me->RemoveFlag(EUnitFields::UNIT_FIELD_FLAGS, eUnitFlags::UNIT_FLAG_NON_ATTACKABLE);
				me->RemoveAura(eSpells::SpellGenesisAura);
				me->RemoveAura(eSpells::SpellSubmerged);
			}
		}

		void UpdateAI(uint32 const p_Diff)
		{
			if (me->HasAura(eSpells::SpellGenesisAura))
			{
				CheckNearPlayers(p_Diff);
				return;
			}

			if (!UpdateVictim())
				return;

			if (me->HasUnitState(UnitState::UNIT_STATE_CASTING))
				return;

			/// No melee attack
			if (Unit* l_Target = SelectTarget(SelectAggroTarget::SELECT_TARGET_RANDOM))
				me->CastSpell(l_Target, eSpells::SpellLasherVenom, false);
		}

		void CheckNearPlayers(uint32 const p_Diff)
		{
			if (!m_CheckPlayerTimer)
				return;

			if (m_CheckPlayerTimer <= p_Diff)
			{
				if (Player* l_Player = me->SelectNearestPlayerNotGM(5.0f))
					me->DespawnOrUnsummon();

				m_CheckPlayerTimer = 500;
			}
			else
				m_CheckPlayerTimer -= p_Diff;
		}
	};

	CreatureAI* GetAI(Creature* p_Creature) const
	{
		return new npc_giant_lasherAI(p_Creature);
	}
};

/// Rumbling Goren - 88106
class npc_drov_rumbling_goren : public CreatureScript
{
public:
	npc_drov_rumbling_goren() : CreatureScript("npc_drov_rumbling_goren") { }

	enum eAction
	{
		ActionGorenSubmerge
	};

	enum eSpells
	{
		GrownGorenSubmerge = 175258,
		ShreddingCharge = 175923,
		CrushingChargeDmg = 175920
	};

	enum eEvents
	{
		EventCheckPlayer = 1,
		EventMove
	};

	struct npc_drov_rumbling_gorenAI : public CreatureAI
	{
		npc_drov_rumbling_gorenAI(Creature* p_Creature) : CreatureAI(p_Creature) { }

		EventMap m_Events;

		void Reset() override
		{
			m_Events.Reset();

			me->SetReactState(ReactStates::REACT_PASSIVE);
			me->SetFlag(EUnitFields::UNIT_FIELD_FLAGS, eUnitFlags::UNIT_FLAG_NOT_SELECTABLE | eUnitFlags::UNIT_FLAG_NON_ATTACKABLE);
			me->CastSpell(me, eSpells::ShreddingCharge, true);

			me->SetSpeed(MOVE_RUN, 4.0f);
			me->SetSpeed(MOVE_WALK, 4.0f);

			m_Events.ScheduleEvent(eEvents::EventCheckPlayer, 1000);
			m_Events.ScheduleEvent(eEvents::EventMove, 1000);
		}

		void DoAction(int32 const p_Action) override
		{
			if (p_Action == eAction::ActionGorenSubmerge)
			{
				me->GetMotionMaster()->Clear();
				me->RemoveAura(eSpells::ShreddingCharge);
				me->CastSpell(me, eSpells::GrownGorenSubmerge, false);
				me->DespawnOrUnsummon(8000);
				m_Events.CancelEvent(eEvents::EventCheckPlayer);
			}
		}

		void UpdateAI(uint32 const p_Diff) override
		{
			m_Events.Update(p_Diff);

			switch (m_Events.ExecuteEvent())
			{
			case eEvents::EventCheckPlayer:
			{
				std::list<Unit*> l_TargetList;
				float l_Radius = 4.0f;

				JadeCore::AnyUnfriendlyUnitInObjectRangeCheck l_Check(me, me, l_Radius);
				JadeCore::UnitListSearcher<JadeCore::AnyUnfriendlyUnitInObjectRangeCheck> l_Searcher(me, l_TargetList, l_Check);
				me->VisitNearbyObject(l_Radius, l_Searcher);

				for (Unit* l_Unit : l_TargetList)
					me->CastSpell(l_Unit, eSpells::CrushingChargeDmg, true);

				m_Events.ScheduleEvent(eEvents::EventCheckPlayer, 1000);
				break;
			}
			case eEvents::EventMove:
				me->GetMotionMaster()->Clear();
				me->GetMotionMaster()->MoveRandom(50.0f);
				break;
			default:
				break;
			}
		}
	};

	CreatureAI* GetAI(Creature* p_Creature) const
	{
		return new npc_drov_rumbling_gorenAI(p_Creature);
	}
};

/// Frenzied Rumbler - 88119
class npc_drov_frenzied_rumbler : public CreatureScript
{
public:
	npc_drov_frenzied_rumbler() : CreatureScript("npc_drov_frenzied_rumbler") { }

	enum eSpell
	{
		SpellAcidBreath = 175915
	};

	enum eEvent
	{
		EventAcidBreath = 1
	};

	struct npc_drov_frenzied_rumblerAI : public CreatureAI
	{
		npc_drov_frenzied_rumblerAI(Creature* p_Creature) : CreatureAI(p_Creature) { }

		EventMap m_Events;

		void Reset() override
		{
			m_Events.Reset();
		}

		void EnterCombat(Unit* /*p_Attacker*/) override
		{
			m_Events.ScheduleEvent(eEvent::EventAcidBreath, 5000);
		}

		void UpdateAI(uint32 const p_Diff) override
		{
			if (!UpdateVictim())
				return;

			m_Events.Update(p_Diff);

			if (me->HasUnitState(UnitState::UNIT_STATE_CASTING))
				return;

			switch (m_Events.ExecuteEvent())
			{
			case eEvent::EventAcidBreath:
				if (Unit* l_Target = SelectTarget(SelectAggroTarget::SELECT_TARGET_TOPAGGRO))
					me->CastSpell(l_Target, eSpell::SpellAcidBreath, true);
				m_Events.ScheduleEvent(eEvent::EventAcidBreath, 7500);
				break;
			default:
				break;
			}

			DoMeleeAttackIfReady();
		}
	};

	CreatureAI* GetAI(Creature* p_Creature) const
	{
		return new npc_drov_frenzied_rumblerAI(p_Creature);
	}
};

/// Call of Earth - 175827
class spell_drov_call_of_earth : public SpellScriptLoader
{
public:
	spell_drov_call_of_earth() : SpellScriptLoader("spell_drov_call_of_earth") { }

	class spell_drov_call_of_earth_AuraScript : public AuraScript
	{
		PrepareAuraScript(spell_drov_call_of_earth_AuraScript)

			enum eAction
		{
			ActionGorenSubmerge
		};

		void OnTick(AuraEffect const* p_AurEff)
		{
			if (GetDuration() <= (GetMaxDuration() / 2))
				return;

			if (Unit* l_Caster = GetCaster())
				l_Caster->CastSpell(l_Caster, p_AurEff->GetAmount(), true);
		}

		void OnRemove(AuraEffect const* /*p_AurEff*/, AuraEffectHandleModes /*p_Mode*/)
		{
			if (!GetCaster())
				return;

			if (Creature* l_Drov = GetCaster()->ToCreature())
			{
				if (l_Drov->AI())
					l_Drov->AI()->DoAction(eAction::ActionGorenSubmerge);
			}
		}

		void Register() override
		{
			OnEffectPeriodic += AuraEffectPeriodicFn(spell_drov_call_of_earth_AuraScript::OnTick, EFFECT_0, SPELL_AURA_PERIODIC_TRIGGER_SPELL);
			OnEffectPeriodic += AuraEffectPeriodicFn(spell_drov_call_of_earth_AuraScript::OnTick, EFFECT_1, SPELL_AURA_PERIODIC_TRIGGER_SPELL);
			OnEffectRemove += AuraEffectRemoveFn(spell_drov_call_of_earth_AuraScript::OnRemove, EFFECT_0, SPELL_AURA_PERIODIC_TRIGGER_SPELL, AURA_EFFECT_HANDLE_REAL);
		}
	};

	AuraScript* GetAuraScript() const
	{
		return new spell_drov_call_of_earth_AuraScript();
	}
};

/// Colossal Slam - 175791
class spell_drov_colossal_slam : public SpellScriptLoader
{
public:
	spell_drov_colossal_slam() : SpellScriptLoader("spell_drov_colossal_slam") { }

	class spell_drov_colossal_slam_SpellScript : public SpellScript
	{
		PrepareSpellScript(spell_drov_colossal_slam_SpellScript)

			enum eSpell
		{
			ColossalSlamAoE = 175793,
			TargetRestrict = 24228
		};

		void CorrectTargets(std::list<WorldObject*>& p_Targets)
		{
			if (p_Targets.empty())
				return;

			SpellTargetRestrictionsEntry const* l_Restriction = sSpellTargetRestrictionsStore.LookupEntry(eSpell::TargetRestrict);
			if (l_Restriction == nullptr)
				return;

			Unit* l_Caster = GetCaster();
			if (l_Caster == nullptr)
				return;

			float l_Radius = GetSpellInfo()->Effects[0].CalcRadius(l_Caster);
			p_Targets.remove_if([l_Radius, l_Caster, l_Restriction](WorldObject* p_Object) -> bool
			{
				if (p_Object == nullptr)
					return true;

				if (!p_Object->IsInAxe(l_Caster, l_Restriction->Width, l_Radius))
					return true;

				return false;
			});
		}

		void HandleAfterCast()
		{
			if (Unit* l_Caster = GetCaster())
				l_Caster->CastSpell(l_Caster, eSpell::ColossalSlamAoE, true);
		}

		void Register() override
		{
			OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_drov_colossal_slam_SpellScript::CorrectTargets, EFFECT_0, TARGET_UNIT_CONE_ENEMY_129);
			OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_drov_colossal_slam_SpellScript::CorrectTargets, EFFECT_1, TARGET_UNIT_CONE_ENEMY_129);
			AfterCast += SpellCastFn(spell_drov_colossal_slam_SpellScript::HandleAfterCast);
		}
	};

	SpellScript* GetSpellScript() const
	{
		return new spell_drov_colossal_slam_SpellScript();
	}
};

/// Acid Breath - 175915
class spell_drov_acid_breath : public SpellScriptLoader
{
public:
	spell_drov_acid_breath() : SpellScriptLoader("spell_drov_acid_breath") { }

	class spell_drov_acid_breath_SpellScript : public SpellScript
	{
		PrepareSpellScript(spell_drov_acid_breath_SpellScript)

			enum eSpell
		{
			TargetRestrict = 24267
		};

		void CorrectTargets(std::list<WorldObject*>& p_Targets)
		{
			if (p_Targets.empty())
				return;

			SpellTargetRestrictionsEntry const* l_Restriction = sSpellTargetRestrictionsStore.LookupEntry(eSpell::TargetRestrict);
			if (l_Restriction == nullptr)
				return;

			Unit* l_Caster = GetCaster();
			if (l_Caster == nullptr)
				return;

			float l_Angle = 2 * M_PI / 360 * l_Restriction->ConeAngle;
			p_Targets.remove_if([l_Caster, l_Angle](WorldObject* p_Object) -> bool
			{
				if (p_Object == nullptr)
					return true;

				if (!p_Object->isInFront(l_Caster, l_Angle))
					return true;

				return false;
			});
		}

		void Register() override
		{
			OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_drov_acid_breath_SpellScript::CorrectTargets, EFFECT_0, TARGET_UNIT_CONE_ENEMY_104);
			OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_drov_acid_breath_SpellScript::CorrectTargets, EFFECT_1, TARGET_UNIT_CONE_ENEMY_104);
		}
	};

	SpellScript* GetSpellScript() const
	{
		return new spell_drov_acid_breath_SpellScript();
	}
};

/// Noxious Spit - 176035
class areatrigger_tarlna_noxious_spit : public AreaTriggerEntityScript
{
public:
	areatrigger_tarlna_noxious_spit() : AreaTriggerEntityScript("areatrigger_tarlna_noxious_spit") { }

	enum Spells
	{
		SpellNoxiousSpitDot = 176037
	};

	void OnUpdate(AreaTrigger* p_AreaTrigger, uint32 /*p_Time*/)
	{
		if (p_AreaTrigger->GetCaster() == nullptr)
			return;

		std::list<Unit*> l_TargetList;
		float l_Radius = 4.0f;

		JadeCore::AnyUnfriendlyUnitInObjectRangeCheck l_Check(p_AreaTrigger, p_AreaTrigger->GetCaster(), l_Radius);
		JadeCore::UnitListSearcher<JadeCore::AnyUnfriendlyUnitInObjectRangeCheck> l_Searcher(p_AreaTrigger, l_TargetList, l_Check);
		p_AreaTrigger->VisitNearbyObject(l_Radius, l_Searcher);

		for (Unit* l_Unit : l_TargetList)
		{
			if (l_Unit->GetDistance(p_AreaTrigger) > l_Radius)
				continue;

			p_AreaTrigger->GetCaster()->CastSpell(l_Unit, Spells::SpellNoxiousSpitDot, true);
		}
	}

	AreaTriggerEntityScript* GetAI() const
	{
		return new areatrigger_tarlna_noxious_spit();
	}
};

/// Punt Podling - 174732
class spell_quest_gorgrond_punt_podling : public SpellScriptLoader
{
	enum
	{
		ThornyLeafling = 85809,
		PodlingPuntCredit = 85815
	};

public:
	/// Constructor
	spell_quest_gorgrond_punt_podling() : SpellScriptLoader("spell_quest_gorgrond_punt_podling") { }

	class spell_quest_gorgrond_punt_podling_SpellScript : public SpellScript
	{
		PrepareSpellScript(spell_quest_gorgrond_punt_podling_SpellScript);

		void HandleDummy(SpellEffIndex /*p_EffIndex*/)
		{
			Unit* l_Caster = GetCaster();
			Unit* l_Target = GetHitUnit();

			if (l_Caster && l_Target && l_Caster->IsPlayer())
			{
				if (l_Target->GetEntry() == ThornyLeafling)
				{
					l_Caster->ToPlayer()->KilledMonsterCredit(PodlingPuntCredit);
					l_Target->ToCreature()->DespawnOrUnsummon(3 * TimeConstants::IN_MILLISECONDS);
				}
			}
		}

		/// Register all effect
		void Register() override
		{
			OnEffectHitTarget += SpellEffectFn(spell_quest_gorgrond_punt_podling_SpellScript::HandleDummy, EFFECT_1, SPELL_EFFECT_DUMMY);
		}
	};

	/// Get spell script
	SpellScript* GetSpellScript() const override
	{
		return new spell_quest_gorgrond_punt_podling_SpellScript();
	}
};

/// Frenzied Rumbler - 88119
class npc_gorgrond_goren_egg : public CreatureScript
{
public:
	npc_gorgrond_goren_egg() : CreatureScript("npc_gorgrond_goren_egg") { }

	struct npc_gorgrond_goren_eggAI : public CreatureAI
	{
		uint32 m_Timer;

		npc_gorgrond_goren_eggAI(Creature* p_Creature) : CreatureAI(p_Creature), m_Timer(0) { }

		void UpdateAI(uint32 const p_Diff) override
		{
			m_Timer += p_Diff;

			if (m_Timer >= 500)
			{
				Player* l_Player = me->FindNearestPlayer(MIN_MELEE_REACH, true);

				if (l_Player)
				{
					l_Player->KilledMonsterCredit(me->GetEntry());

					TempSummon* l_Summon = me->SummonCreature(0, *me, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 5 * TimeConstants::IN_MILLISECONDS);

					if (l_Summon)
						l_Summon->Attack(l_Player, true);

					me->DespawnOrUnsummon(0);
				}

				m_Timer = 0;
			}
		}
	};

	CreatureAI* GetAI(Creature* p_Creature) const
	{
		return new npc_gorgrond_goren_eggAI(p_Creature);
	}
};

/// Ancient Ogre Hoard Jar - 233296
class go_gorgrond_ancient_ogre_hoard_jar : public GameObjectScript
{
public:
	/// Constructor
	go_gorgrond_ancient_ogre_hoard_jar() : GameObjectScript("go_gorgrond_ancient_ogre_hoard_jar") { }

	struct go_gorgrond_ancient_ogre_hoard_jarAI : public GameObjectAI
	{
		/// Constructor
		go_gorgrond_ancient_ogre_hoard_jarAI(GameObject* p_GameObject) : GameObjectAI(p_GameObject) { }

		/// Called when a player opens a gossip dialog with the GameObject.
		/// @p_Player     : Source player instance
		bool GossipHello(Player* p_Player) override
		{
			if (p_Player)
				p_Player->KilledMonsterCredit(83467);

			return false;
		}
	};

	/// Called when a GameObjectAI object is needed for the GameObject.
	/// @p_GameObject : GameObject instance
	GameObjectAI* GetAI(GameObject* p_GameObject) const override
	{
		return new go_gorgrond_ancient_ogre_hoard_jarAI(p_GameObject);
	}
};

/// Burn Ancient Corpse - 170769
class spell_quest_gorgrond_burn_ancient_corpse : public SpellScriptLoader
{
	enum
	{
		AncientSeedbearer = 85524,
	};

public:
	/// Constructor
	spell_quest_gorgrond_burn_ancient_corpse() : SpellScriptLoader("spell_quest_gorgrond_burn_ancient_corpse") { }

	class spell_quest_gorgrond_burn_ancient_corpse_SpellScript : public SpellScript
	{
		PrepareSpellScript(spell_quest_gorgrond_burn_ancient_corpse_SpellScript);

		void HandleDummy(SpellEffIndex /*p_EffIndex*/)
		{
			Unit* l_Caster = GetCaster();
			Unit* l_Target = GetHitUnit();

			if (l_Caster && l_Target && l_Caster->IsPlayer())
			{
				if (l_Target->GetEntry() == AncientSeedbearer)
					l_Target->ToCreature()->DespawnOrUnsummon(0);
			}
		}

		/// Register all effect
		void Register() override
		{
			OnEffectHitTarget += SpellEffectFn(spell_quest_gorgrond_burn_ancient_corpse_SpellScript::HandleDummy, EFFECT_0, SPELL_EFFECT_DUMMY);
		}
	};

	/// Get spell script
	SpellScript* GetSpellScript() const override
	{
		return new spell_quest_gorgrond_burn_ancient_corpse_SpellScript();
	}
};

/// Toxic Slimemold - 85732
class npc_gorgrond_toxic_slimemold : public CreatureScript
{
public:
	npc_gorgrond_toxic_slimemold() : CreatureScript("npc_gorgrond_toxic_slimemold") { }

	struct npc_gorgrond_toxic_slimemoldAI : public CreatureAI
	{
		uint32 m_Timer;

		npc_gorgrond_toxic_slimemoldAI(Creature* p_Creature) : CreatureAI(p_Creature), m_Timer(0) { }

		void UpdateAI(uint32 const p_Diff) override
		{
			m_Timer += p_Diff;

			if (m_Timer >= 500)
			{
				Player* l_Player = me->FindNearestPlayer(MIN_MELEE_REACH, true);

				if (l_Player)
				{
					l_Player->KilledMonsterCredit(me->GetEntry());
					me->DespawnOrUnsummon(0);
				}

				m_Timer = 0;
			}
		}
	};

	CreatureAI* GetAI(Creature* p_Creature) const override
	{
		return new npc_gorgrond_toxic_slimemoldAI(p_Creature);
	}
};

/// Pollen pod - 233296
class go_gorgrond_pollen_pod : public GameObjectScript
{
	enum
	{
		LastPhase = 0x80000000,
		InvisibleDisplayID = 11686
	};

public:
	/// Constructor
	go_gorgrond_pollen_pod() : GameObjectScript("go_gorgrond_pollen_pod") { }

	struct go_gorgrond_pollen_podAI : public GameObjectAI
	{
		/// Constructor
		go_gorgrond_pollen_podAI(GameObject* p_GameObject)
			: GameObjectAI(p_GameObject), m_Used(false)
		{
			m_OriginalScale = go->GetFloatValue(EObjectFields::OBJECT_FIELD_SCALE);
			m_OriginalDisplayID = go->GetDisplayId();
			m_OriginalPhase = go->GetPhaseMask();
		}

		void UpdateAI(uint32 p_Diff) override
		{
			UpdateOperations(p_Diff);
		}

		/// Called when a player opens a gossip dialog with the GameObject.
		/// @p_Player     : Source player instance
		bool GossipHello(Player* p_Player) override
		{
			if (m_Used)
				return true;

			m_Used = true;

			uint64 l_PlayerGUID = p_Player->GetGUID();

			AddTimedDelayedOperation(3 * TimeConstants::IN_MILLISECONDS, [this, l_PlayerGUID]()
			{
				go->SetObjectScale(0.01f);
				go->SetDisplayId(InvisibleDisplayID);
				go->SetPhaseMask(LastPhase, true);

				if (Player* l_Player = HashMapHolder<Player>::Find(l_PlayerGUID))
					l_Player->QuestObjectiveSatisfy(go->GetEntry(), 1, QUEST_OBJECTIVE_TYPE_GO, go->GetGUID());
			});
			AddTimedDelayedOperation(60 * TimeConstants::IN_MILLISECONDS, [this]()
			{
				go->SetPhaseMask(m_OriginalPhase, true);
				go->SetObjectScale(m_OriginalScale);
				go->SetDisplayId(m_OriginalDisplayID);
				m_Used = false;
			});

			return false;
		}

		bool m_Used;
		float m_OriginalScale;
		uint32 m_OriginalDisplayID;
		uint32 m_OriginalPhase;
	};

	/// Called when a GameObjectAI object is needed for the GameObject.
	/// @p_GameObject : GameObject instance
	GameObjectAI* GetAI(GameObject* p_GameObject) const override
	{
		return new go_gorgrond_pollen_podAI(p_GameObject);
	}
};

/// Keg of Grog - 235916
class go_gorgrond_keg_of_grog : public GameObjectScript
{
	enum
	{
		LastPhase = 0x80000000,
		InvisibleDisplayID = 11686
	};

public:
	/// Constructor
	go_gorgrond_keg_of_grog() : GameObjectScript("go_gorgrond_keg_of_grog") { }

	struct go_gorgrond_keg_of_grogAI : public GameObjectAI
	{
		/// Constructor
		go_gorgrond_keg_of_grogAI(GameObject* p_GameObject)
			: GameObjectAI(p_GameObject), m_Used(false)
		{
			m_OriginalScale = go->GetFloatValue(EObjectFields::OBJECT_FIELD_SCALE);
			m_OriginalDisplayID = go->GetDisplayId();
			m_OriginalPhase = go->GetPhaseMask();
		}

		void UpdateAI(uint32 p_Diff) override
		{
			UpdateOperations(p_Diff);
		}

		/// Called when a player opens a gossip dialog with the GameObject.
		/// @p_Player     : Source player instance
		bool GossipHello(Player* p_Player) override
		{
			if (m_Used)
				return true;

			m_Used = true;

			uint64 l_PlayerGUID = p_Player->GetGUID();

			AddTimedDelayedOperation(2 * TimeConstants::IN_MILLISECONDS, [this, l_PlayerGUID]()
			{
				go->SetObjectScale(0.01f);
				go->SetDisplayId(InvisibleDisplayID);
				go->SetPhaseMask(LastPhase, true);

				if (Player* l_Player = HashMapHolder<Player>::Find(l_PlayerGUID))
					l_Player->QuestObjectiveSatisfy(go->GetEntry(), 1, QUEST_OBJECTIVE_TYPE_GO, go->GetGUID());
			});
			AddTimedDelayedOperation(60 * TimeConstants::IN_MILLISECONDS, [this]()
			{
				go->SetPhaseMask(m_OriginalPhase, true);
				go->SetObjectScale(m_OriginalScale);
				go->SetDisplayId(m_OriginalDisplayID);
				m_Used = false;
			});

			return false;
		}

		bool m_Used;
		float m_OriginalScale;
		uint32 m_OriginalDisplayID;
		uint32 m_OriginalPhase;
	};

	/// Called when a GameObjectAI object is needed for the GameObject.
	/// @p_GameObject : GameObject instance
	GameObjectAI* GetAI(GameObject* p_GameObject) const override
	{
		return new go_gorgrond_keg_of_grogAI(p_GameObject);
	}
};

/// Toxic Slimemold - 85732
class npc_quest_frightened_spirit : public CreatureScript
{
	enum
	{
		SpellVisual = 167012,
		KillCredit = 88819
	};
public:
	npc_quest_frightened_spirit() : CreatureScript("npc_quest_frightened_spirit") { }

	struct npc_quest_frightened_spiritAI : public ScriptedAI
	{
		bool m_Locked;

		npc_quest_frightened_spiritAI(Creature* p_Creature) : ScriptedAI(p_Creature) { }

		void Reset() override
		{
			ScriptedAI::Reset();
			me->SetCanFly(false);
			me->SetDisableGravity(false);
			me->SetWalk(true);
			me->GetMotionMaster()->MoveRandom();
			m_Locked = false;
		}

		void UpdateAI(uint32 const p_Diff) override
		{
			ScriptedAI::UpdateAI(p_Diff);
			UpdateOperations(p_Diff);
		}

		virtual void sGossipHello(Player* p_Player) override
		{
			if (m_Locked)
				return;

			m_Locked = true;

			p_Player->CLOSE_GOSSIP_MENU();
			uint64 l_PlayedGUID = p_Player->GetGUID();

			me->GetMotionMaster()->Clear();
			me->SetCanFly(true);
			me->SetDisableGravity(true);
			me->CastSpell(me, SpellVisual, TRIGGERED_FULL_MASK);

			AddTimedDelayedOperation(1 * TimeConstants::IN_MILLISECONDS, [this, l_PlayedGUID]() -> void
			{
				if (Player* l_Player = HashMapHolder<Player>::Find(l_PlayedGUID))
					l_Player->KilledMonsterCredit(KillCredit);
			});
			AddTimedDelayedOperation(2 * TimeConstants::IN_MILLISECONDS, [this]() -> void
			{
				me->DespawnOrUnsummon(0);
			});
		}
	};

	CreatureAI* GetAI(Creature* p_Creature) const override
	{
		return new npc_quest_frightened_spiritAI(p_Creature);
	}
};

/// QUEST 35050: Rescue Rangari
/// Rangari Kolaan - 81018
class npc_gorgrond_rangari_kolaan : public CreatureScript
{
public:
	npc_gorgrond_rangari_kolaan() : CreatureScript("npc_gorgrond_rangari_kolaan") { }

	CreatureAI* GetAI(Creature* p_Creature) const
	{
		return new npc_gorgrond_rangari_kolaanAI(p_Creature);
	}


	bool OnGossipHello(Player* p_Player, Creature* p_Creature)
	{
		if (p_Player->HasQuest(eQuests::Quest_RescueRangari) && p_Player->GetQuestObjectiveCounter(273398) != 1 && p_Player->GetQuestStatus(eQuests::Quest_RescueRangari) == QUEST_STATUS_INCOMPLETE)
		{
				p_Player->ADD_GOSSIP_ITEM_DB(eGossipMenus::RANGARI_KOLAAN_Menu_RescueRangari, eGossipOptions::RANGARI_KOLAAN_RescueRangari, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF);
				p_Player->SEND_GOSSIP_MENU(eNpcTexts::RANGARI_KOLAAN_TEXT_RESCUE_RANGARI, p_Creature->GetGUID());
		}
				p_Player->SEND_GOSSIP_MENU(eNpcTexts::RANGARI_KOLAAN_TEXT_RESCUE_RANGARI , p_Creature->GetGUID());
				return true;
	}


	bool OnGossipSelect(Player* p_Player, Creature* p_Creature, uint32 /*sender*/, uint32 action)
	{
		if (action == GOSSIP_ACTION_INFO_DEF && p_Player->GetQuestObjectiveCounter(273398) != 1)
		{
			p_Creature->AI()->Talk(0);
			p_Player->QuestObjectiveSatisfy(eCreatures::NPC_GORGROND_RANGARI_KOLAAN, 1, QUEST_OBJECTIVE_TYPE_NPC_INTERACT, p_Player->GetGUID());
		}

		p_Player->PlayerTalkClass->ClearMenus();
		p_Player->PlayerTalkClass->SendCloseGossip();
		return true;
	}



	struct npc_gorgrond_rangari_kolaanAI : public ScriptedAI
	{
		npc_gorgrond_rangari_kolaanAI(Creature* creature) : ScriptedAI(creature) { }

		void Reset() { }
		void UpdateAI(const uint32 /*p_Diff*/) { }

	};


};

/// Rangari Rajess - 81013
class npc_gorgrond_rangari_rajess : public CreatureScript
{
public:
	npc_gorgrond_rangari_rajess() : CreatureScript("npc_gorgrond_rangari_rajess") { }

	CreatureAI* GetAI(Creature* p_Creature) const
	{
		return new npc_gorgrond_rangari_rajessAI(p_Creature);
	}


	bool OnGossipHello(Player* p_Player, Creature* p_Creature)
	{
		if (p_Player->HasQuest(eQuests::Quest_RescueRangari) && p_Player->GetQuestObjectiveCounter(273399) != 1 && p_Player->GetQuestStatus(eQuests::Quest_RescueRangari) == QUEST_STATUS_INCOMPLETE)
		{
			p_Player->ADD_GOSSIP_ITEM_DB(eGossipMenus::RANGARI_RAJESS_Menu_RescueRangari, eGossipOptions::RANGARI_RAJESS_RescueRangari, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF);
			p_Player->SEND_GOSSIP_MENU(eNpcTexts::RANGARI_RAJESS_TEXT_RESCUE_RANGARI, p_Creature->GetGUID());
		}
			p_Player->SEND_GOSSIP_MENU(eNpcTexts::RANGARI_RAJESS_TEXT_RESCUE_RANGARI, p_Creature->GetGUID());
			return true;

	}


	bool OnGossipSelect(Player* p_Player, Creature* p_Creature, uint32 /*sender*/, uint32 action)
	{
		if (action == GOSSIP_ACTION_INFO_DEF && p_Player->GetQuestObjectiveCounter(273399) != 1)
		{
			p_Creature->AI()->Talk(0);
			p_Player->QuestObjectiveSatisfy(eCreatures::NPC_GORGROND_RANGARI_RAJESS, 1, QUEST_OBJECTIVE_TYPE_NPC_INTERACT, p_Player->GetGUID());
		}
			p_Player->PlayerTalkClass->ClearMenus();
			p_Player->PlayerTalkClass->SendCloseGossip();
			return true;
	}



	struct npc_gorgrond_rangari_rajessAI : public ScriptedAI
	{
		npc_gorgrond_rangari_rajessAI(Creature* creature) : ScriptedAI(creature) { }

		void Reset() { }
		void UpdateAI(const uint32 /*p_Diff*/) { }

	};


};

/// Rangari Jonaa - 81020
class npc_gorgrond_rangari_jonaa : public CreatureScript
{
public:
	npc_gorgrond_rangari_jonaa() : CreatureScript("npc_gorgrond_rangari_jonaa") { }

	CreatureAI* GetAI(Creature* p_Creature) const
	{
		return new npc_gorgrond_rangari_jonaaAI(p_Creature);
	}


	bool OnGossipHello(Player* p_Player, Creature* p_Creature)
	{
		if (p_Player->HasQuest(eQuests::Quest_RescueRangari) && p_Player->GetQuestObjectiveCounter(273400) != 1 && p_Player->GetQuestStatus(eQuests::Quest_RescueRangari) == QUEST_STATUS_INCOMPLETE)
		{
			p_Player->ADD_GOSSIP_ITEM_DB(eGossipMenus::RANGARI_JONAA_Menu_RescueRangari, eGossipOptions::RANGARI_JONAA_RescueRangari, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF);
			p_Player->SEND_GOSSIP_MENU(eNpcTexts::RANGARI_JONAA_TEXT_RESCUE_RANGARI, p_Creature->GetGUID());
		}
			p_Player->SEND_GOSSIP_MENU(eNpcTexts::RANGARI_JONAA_TEXT_RESCUE_RANGARI, p_Creature->GetGUID());
			return true;
	}


	bool OnGossipSelect(Player* p_Player, Creature* p_Creature, uint32 /*sender*/, uint32 action)
	{

		if (action == GOSSIP_ACTION_INFO_DEF && p_Player->GetQuestObjectiveCounter(273400) != 1)
		{
			p_Creature->AI()->Talk(0);
			p_Player->QuestObjectiveSatisfy(eCreatures::NPC_GORGROND_RANGARI_JONAA, 1, QUEST_OBJECTIVE_TYPE_NPC_INTERACT, p_Player->GetGUID());
		}
			p_Player->PlayerTalkClass->ClearMenus();
			p_Player->PlayerTalkClass->SendCloseGossip();
			return true;
	}



	struct npc_gorgrond_rangari_jonaaAI : public ScriptedAI
	{
		npc_gorgrond_rangari_jonaaAI(Creature* creature) : ScriptedAI(creature) { }

		void Reset() { }
		void UpdateAI(const uint32 /*p_Diff*/) { }

	};


};

/// Fallen Rangari - 84663
class npc_gorgrond_fallen_rangari : public CreatureScript
{
public:
	npc_gorgrond_fallen_rangari() : CreatureScript("npc_gorgrond_fallen_rangari") { }

	CreatureAI* GetAI(Creature* p_Creature) const
	{
		return new npc_gorgrond_fallen_rangariAI(p_Creature);
	}

	struct npc_gorgrond_fallen_rangariAI : public ScriptedAI
	{
		npc_gorgrond_fallen_rangariAI(Creature* creature) : ScriptedAI(creature) { }

		
		void Reset() {


			if (me->GetGUIDLow() == eCreatures::NPC_GUID_GORGROND_FALLEN_RANGARI)
			{
				me->setRegeneratingHealth(false);
				me->SetHealth(me->CountPctFromMaxHealth(45));
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_NPC);
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PC);
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_UNK_15);
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_UNK_16);
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
				me->HandleEmoteCommand(EMOTE_STATE_KNEEL);
				me->RemoveFlag(UNIT_FIELD_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP);
				me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_UNK_29);
				me->RemoveFlag(UNIT_FIELD_FLAGS_2, UNIT_FLAG2_FEIGN_DEATH);
			}
			else {
				me->setRegeneratingHealth(false);
				me->SetHealth(me->CountPctFromMaxHealth(0));
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_NPC);
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PC);
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_UNK_15);
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_UNK_29);
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_UNK_16);
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
				me->RemoveFlag(UNIT_FIELD_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP);
			}
			
		}
		void UpdateAI(const uint32 /*p_Diff*/) { }

	};


};


/// Dead Rangari - 80809
class npc_gorgrond_dead_rangari : public CreatureScript
{
public:
	npc_gorgrond_dead_rangari() : CreatureScript("npc_gorgrond_dead_rangari") { }

	CreatureAI* GetAI(Creature* p_Creature) const
	{
		return new npc_gorgrond_dead_rangariAI(p_Creature);
	}

	struct npc_gorgrond_dead_rangariAI : public ScriptedAI
	{
		npc_gorgrond_dead_rangariAI(Creature* creature) : ScriptedAI(creature) { }


		void Reset() {
				me->setRegeneratingHealth(false);
				me->SetHealth(me->CountPctFromMaxHealth(0));
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_NPC);
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PC);
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_UNK_15);
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_UNK_29);
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_UNK_16);
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
				me->RemoveFlag(UNIT_FIELD_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP);
		}


		void UpdateAI(const uint32 /*p_Diff*/) { }

	};


};

/// Rangari Elekk - 84867
class npc_gorgrond_rangari_elekk : public CreatureScript
{
public:
	npc_gorgrond_rangari_elekk() : CreatureScript("npc_gorgrond_rangari_elekk") { }

	CreatureAI* GetAI(Creature* p_Creature) const
	{
		return new npc_gorgrond_rangari_elekkAI(p_Creature);
	}

	struct npc_gorgrond_rangari_elekkAI : public ScriptedAI
	{
		npc_gorgrond_rangari_elekkAI(Creature* creature) : ScriptedAI(creature) { }


		void Reset() {
			me->setRegeneratingHealth(false);
			me->SetHealth(me->CountPctFromMaxHealth(0));
			me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_NPC);
			me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PC);
			me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_UNK_15);
			me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_UNK_29);
			me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_UNK_16);
			me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
			me->RemoveFlag(UNIT_FIELD_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP);
		}

		void UpdateAI(const uint32 /*p_Diff*/) { }

	};


};

/// Goren Gouger - 82387
class npc_gorgrond_goren_gouger : public CreatureScript
{
public:
	npc_gorgrond_goren_gouger() : CreatureScript("npc_gorgrond_goren_gouger") { }

	CreatureAI* GetAI(Creature* p_Creature) const
	{
		return new npc_gorgrond_goren_gougerAI(p_Creature);
	}

	struct npc_gorgrond_goren_gougerAI : public ScriptedAI
	{
		npc_gorgrond_goren_gougerAI(Creature* creature) : ScriptedAI(creature) { }


		void Reset() {

			if (me->GetGUIDLow() == eCreatures::NPC_GUID_GORGROND_GOREN_GOUGER1 || me->GetGUIDLow() == eCreatures::NPC_GUID_GORGROND_GOREN_GOUGER2 || me->GetGUIDLow() == eCreatures::NPC_GUID_GORGROND_GOREN_GOUGER3 || me->GetGUIDLow() == eCreatures::NPC_GUID_GORGROND_GOREN_GOUGER4)
			{
				me->setRegeneratingHealth(false);
				me->SetHealth(me->CountPctFromMaxHealth(0));
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_NPC);
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PC);
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_UNK_15);
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_UNK_29);
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_UNK_16);
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
				me->RemoveFlag(UNIT_FIELD_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP);
			}
		}
			

		void UpdateAI(const uint32 /*p_Diff*/) { }

	};


};

/// Infested Vinewarden - 82394
class npc_gorgrond_infested_vinewarden : public CreatureScript
{
public:
	npc_gorgrond_infested_vinewarden() : CreatureScript("npc_gorgrond_infested_vinewarden") { }

	CreatureAI* GetAI(Creature* p_Creature) const
	{
		return new npc_gorgrond_infested_vinewardenAI(p_Creature);
	}

	struct npc_gorgrond_infested_vinewardenAI : public ScriptedAI
	{
		npc_gorgrond_infested_vinewardenAI(Creature* creature) : ScriptedAI(creature) { }


		void Reset() {

			if (me->GetGUIDLow() == eCreatures::NPC_GUID_GORGROND_INFESTED_VINEWARDEN1 || me->GetGUIDLow() == eCreatures::NPC_GUID_GORGROND_INFESTED_VINEWARDEN2)
			{
				me->setRegeneratingHealth(false);
				me->SetHealth(me->CountPctFromMaxHealth(0));
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_NPC);
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PC);
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_UNK_15);
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_UNK_29);
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_UNK_16);
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
				me->RemoveFlag(UNIT_FIELD_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP);
			}
		}


		void UpdateAI(const uint32 /*p_Diff*/) { }

	};


};

/// Botani Greensworn - 82393
class npc_gorgrond_botani_greensworn : public CreatureScript
{
public:
	npc_gorgrond_botani_greensworn() : CreatureScript("npc_gorgrond_botani_greensworn") { }

	CreatureAI* GetAI(Creature* p_Creature) const
	{
		return new npc_gorgrond_botani_greenswornAI(p_Creature);
	}

	struct npc_gorgrond_botani_greenswornAI : public ScriptedAI
	{
		npc_gorgrond_botani_greenswornAI(Creature* creature) : ScriptedAI(creature) { }


		void Reset() {

			if (me->GetGUIDLow() == eCreatures::NPC_GUID_GORGROND_BOTANI_GREENSWORN1 || me->GetGUIDLow() == eCreatures::NPC_GUID_GORGROND_BOTANI_GREENSWORN2 || me->GetGUIDLow() == eCreatures::NPC_GUID_GORGROND_BOTANI_GREENSWORN3)
			{
				me->setRegeneratingHealth(false);
				me->SetHealth(me->CountPctFromMaxHealth(0));
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_NPC);
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PC);
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_UNK_15);
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_UNK_29);
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_UNK_16);
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
				me->RemoveFlag(UNIT_FIELD_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP);
			}
		}


		void UpdateAI(const uint32 /*p_Diff*/) { }

	};


};

/// Gronn Rockthrower - 82388
class npc_gorgrond_gronn_rockthrower : public CreatureScript
{
public:
	npc_gorgrond_gronn_rockthrower() : CreatureScript("npc_gorgrond_gronn_rockthrower") { }

	CreatureAI* GetAI(Creature* p_Creature) const
	{
		return new npc_gorgrond_gronn_rockthrowerAI(p_Creature);
	}

	struct npc_gorgrond_gronn_rockthrowerAI : public ScriptedAI
	{
		npc_gorgrond_gronn_rockthrowerAI(Creature* creature) : ScriptedAI(creature) { }


		void Reset() {

			if (me->GetGUIDLow() == eCreatures::NPC_GUID_GORGROND_GRONN_ROCKTHROWER)
			{
				me->setRegeneratingHealth(false);
				me->SetHealth(me->CountPctFromMaxHealth(0));
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_NPC);
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PC);
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_UNK_15);
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_UNK_29);
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_UNK_16);
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
				me->RemoveFlag(UNIT_FIELD_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP);
			}
		}


		void UpdateAI(const uint32 /*p_Diff*/) { }

	};


};

/// Mandragora Lifedrinker - 82396
class npc_gorgrond_mandragora_lifedrinker : public CreatureScript
{
public:
	npc_gorgrond_mandragora_lifedrinker() : CreatureScript("npc_gorgrond_mandragora_lifedrinker") { }

	CreatureAI* GetAI(Creature* p_Creature) const
	{
		return new npc_gorgrond_mandragora_lifedrinkerAI(p_Creature);
	}

	struct npc_gorgrond_mandragora_lifedrinkerAI : public ScriptedAI
	{
		npc_gorgrond_mandragora_lifedrinkerAI(Creature* creature) : ScriptedAI(creature) { }


		void Reset() {

			if (me->GetGUIDLow() == eCreatures::NPC_GUID_GORGROND_MANDRAGORA_LIFEDRINKER)
			{
				me->setRegeneratingHealth(false);
				me->SetHealth(me->CountPctFromMaxHealth(0));
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_NPC);
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PC);
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_UNK_15);
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_UNK_29);
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_UNK_16);
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
				me->RemoveFlag(UNIT_FIELD_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP);
			}
		}


		void UpdateAI(const uint32 /*p_Diff*/) { }

	};


};

/// Gronnling Bonebreaker - 82390
class npc_gorgrond_gronnling_bonebreaker : public CreatureScript
{
public:
	npc_gorgrond_gronnling_bonebreaker() : CreatureScript("npc_gorgrond_gronnling_bonebreaker") { }

	CreatureAI* GetAI(Creature* p_Creature) const
	{
		return new npc_gorgrond_gronnling_bonebreakerAI(p_Creature);
	}

	struct npc_gorgrond_gronnling_bonebreakerAI : public ScriptedAI
	{
		npc_gorgrond_gronnling_bonebreakerAI(Creature* creature) : ScriptedAI(creature) { }


		void Reset() {

			if (me->GetGUIDLow() == eCreatures::NPC_GUID_GORGROND_GRONNLING_BONEBREAKER1 || me->GetGUIDLow() == eCreatures::NPC_GUID_GORGROND_GRONNLING_BONEBREAKER2)
			{
				me->setRegeneratingHealth(false);
				me->SetHealth(me->CountPctFromMaxHealth(0));
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_NPC);
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PC);
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_UNK_15);
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_UNK_29);
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_UNK_16);
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
				me->RemoveFlag(UNIT_FIELD_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP);
			}
		}


		void UpdateAI(const uint32 /*p_Diff*/) { }

	};


};


/// Podling Nibbler - 84549
class npc_gorgrond_podling_nibbler : public CreatureScript
{
public:
	npc_gorgrond_podling_nibbler() : CreatureScript("npc_gorgrond_podling_nibbler") { }

	CreatureAI* GetAI(Creature* p_Creature) const
	{
		return new npc_gorgrond_podling_nibblerAI(p_Creature);
	}

	struct npc_gorgrond_podling_nibblerAI : public ScriptedAI
	{
		npc_gorgrond_podling_nibblerAI(Creature* creature) : ScriptedAI(creature) { }


		void Reset() {
			if (me->GetGUIDLow() == eCreatures::NPC_GUID_GORGROND_PODLING_NIBBLER1 || me->GetGUIDLow() == eCreatures::NPC_GUID_GORGROND_PODLING_NIBBLER2 || me->GetGUIDLow() == eCreatures::NPC_GUID_GORGROND_PODLING_NIBBLER3 || me->GetGUIDLow() == eCreatures::NPC_GUID_GORGROND_PODLING_NIBBLER4 || me->GetGUIDLow() == eCreatures::NPC_GUID_GORGROND_PODLING_NIBBLER5) {
				me->setRegeneratingHealth(false);
				me->SetHealth(me->CountPctFromMaxHealth(0));
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_NPC);
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PC);
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_UNK_15);
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_UNK_29);
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_MOVE);
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_UNK_16);
				me->RemoveFlag(UNIT_FIELD_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP);
				me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PET_IN_COMBAT);
				me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IN_COMBAT);
			}
				
		}
		

		void UpdateAI(const uint32 /*p_Diff*/) { }

	};


};



/// Stonemaul Guard - 75819
class npc_gorgrond_stonemaul_guard : public CreatureScript
{
public:
	npc_gorgrond_stonemaul_guard() : CreatureScript("npc_gorgrond_stonemaul_guard") { }

	CreatureAI* GetAI(Creature* p_Creature) const
	{
		return new npc_gorgrond_stonemaul_guardAI(p_Creature);
	}

	struct npc_gorgrond_stonemaul_guardAI : public ScriptedAI
	{
		npc_gorgrond_stonemaul_guardAI(Creature* creature) : ScriptedAI(creature) { }


		void Reset() {
				me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_NPC);
				me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PC);
				me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_UNK_15);
				me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_UNK_29);
				me->RemoveFlag(UNIT_FIELD_FLAGS_2, UNIT_FLAG2_FEIGN_DEATH);
		}

		void UpdateAI(const uint32 /*p_Diff*/) { }

	};


};

/// Podling Scavenger - 84402
class npc_gorgrond_podling_scavenger : public CreatureScript
{
public:
	npc_gorgrond_podling_scavenger() : CreatureScript("npc_gorgrond_podling_scavenger") { }

	CreatureAI* GetAI(Creature* p_Creature) const
	{
		return new npc_gorgrond_podling_scavengerAI(p_Creature);
	}

	struct npc_gorgrond_podling_scavengerAI : public ScriptedAI
	{
		npc_gorgrond_podling_scavengerAI(Creature* creature) : ScriptedAI(creature) { }


		void Reset() {
			if (me->GetGUIDLow() == eCreatures::NPC_GUID_GORGROND_PODLING_SCAVENGER1 || me->GetGUIDLow() == eCreatures::NPC_GUID_GORGROND_PODLING_SCAVENGER2 || me->GetGUIDLow() == eCreatures::NPC_GUID_GORGROND_PODLING_SCAVENGER3 || me->GetGUIDLow() == eCreatures::NPC_GUID_GORGROND_PODLING_SCAVENGER4 || me->GetGUIDLow() == eCreatures::NPC_GUID_GORGROND_PODLING_SCAVENGER5 || me->GetGUIDLow() == eCreatures::NPC_GUID_GORGROND_PODLING_SCAVENGER6 || me->GetGUIDLow() == eCreatures::NPC_GUID_GORGROND_PODLING_SCAVENGER7 || me->GetGUIDLow() == eCreatures::NPC_GUID_GORGROND_PODLING_SCAVENGER8 || me->GetGUIDLow() == eCreatures::NPC_GUID_GORGROND_PODLING_SCAVENGER9 || me->GetGUIDLow() == eCreatures::NPC_GUID_GORGROND_PODLING_SCAVENGER10)
			{
				me->setRegeneratingHealth(false);
				me->SetHealth(me->CountPctFromMaxHealth(0));
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_NPC);
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PC);
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_UNK_15);
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_UNK_29);
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_MOVE);
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_UNK_16);
				me->RemoveFlag(UNIT_FIELD_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP);
				me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PET_IN_COMBAT);
				me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IN_COMBAT);
			}
			else {
				me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_NPC);
				me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PC);
				me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_UNK_15);
				me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_UNK_29);
				me->RemoveFlag(UNIT_FIELD_FLAGS_2, UNIT_FLAG2_FEIGN_DEATH);


				// To do - the npcs don't attack the player, need to fix
			}	
		}

		void UpdateAI(const uint32 /*p_Diff*/) { }

	};


};

/// Podling Scavenger @ Naielle's Watch - 88479
class npc_gorgrond_podling_scavenger_naielleswatch : public CreatureScript
{
public:
	npc_gorgrond_podling_scavenger_naielleswatch() : CreatureScript("npc_gorgrond_podling_scavenger_naielleswatch") { }

	CreatureAI* GetAI(Creature* p_Creature) const
	{
		return new npc_gorgrond_podling_scavenger_naielleswatchAI(p_Creature);
	}

	struct npc_gorgrond_podling_scavenger_naielleswatchAI : public ScriptedAI
	{
		npc_gorgrond_podling_scavenger_naielleswatchAI(Creature* creature) : ScriptedAI(creature) { }


		void Reset() {

			me->setRegeneratingHealth(false);
			me->SetHealth(me->CountPctFromMaxHealth(0));
			me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_NPC);
			me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PC);
			me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
			me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_MOVE);
			me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_UNK_16);
			me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_NPC_FLAG_GOSSIP);
		}
		
		void UpdateAI(const uint32 /*p_Diff*/) { }

	};


};

/// Grom'kar Grunt Near Rajess and Highpass - 85266
class npc_gorgrond_gromkar_grunt : public CreatureScript
{
public:
	npc_gorgrond_gromkar_grunt() : CreatureScript("npc_gorgrond_gromkar_grunt_rajess") { }

	CreatureAI* GetAI(Creature* p_Creature) const
	{
		return new npc_gorgrond_gromkar_gruntAI(p_Creature);
	}

	struct npc_gorgrond_gromkar_gruntAI : public ScriptedAI
	{
		npc_gorgrond_gromkar_gruntAI(Creature* creature) : ScriptedAI(creature) { }

		

		void Reset() {
			if (me->GetGUIDLow() == eCreatures::NPC_GUID_GORGROND_GROMKAR_GRUNT1 || me->GetGUIDLow() == eCreatures::NPC_GUID_GORGROND_GROMKAR_GRUNT2) {
				me->setRegeneratingHealth(false);
				me->SetHealth(me->CountPctFromMaxHealth(0));
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_NPC);
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PC);
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_MOVE);
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_UNK_16);
				me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_NPC_FLAG_GOSSIP);
			}
		}
		
		void UpdateAI(const uint32 /*p_Diff*/) { }

	};


};

/// Grom'kar Shieldbearer Near Highpass - 85267
class npc_gorgrond_gromkar_shieldbearer : public CreatureScript
{
public:
	npc_gorgrond_gromkar_shieldbearer() : CreatureScript("npc_gorgrond_gromkar_shieldbearer") { }

	CreatureAI* GetAI(Creature* p_Creature) const
	{
		return new npc_gorgrond_gromkar_shieldbearerAI(p_Creature);
	}

	struct npc_gorgrond_gromkar_shieldbearerAI : public ScriptedAI
	{
		npc_gorgrond_gromkar_shieldbearerAI(Creature* creature) : ScriptedAI(creature) { }



		void Reset() {
			if (me->GetGUIDLow() == eCreatures::NPC_GUID_GORGROND_GROMKAR_SHIELDBEARER1 || me->GetGUIDLow() == eCreatures::NPC_GUID_GORGROND_GROMKAR_SHIELDBEARER2) {
				me->setRegeneratingHealth(false);
				me->SetHealth(me->CountPctFromMaxHealth(0));
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_NPC);
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PC);
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_MOVE);
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_UNK_16);
				me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_NPC_FLAG_GOSSIP);
			}
		}

		void UpdateAI(const uint32 /*p_Diff*/) { }

	};


};

/// Fungus Covered Shambler @ Crimson Fen - 80721
class npc_gorgrond_fungus_covered_shambler : public CreatureScript
{
public:
	npc_gorgrond_fungus_covered_shambler() : CreatureScript("npc_gorgrond_fungus_covered_shambler") { }

	CreatureAI* GetAI(Creature* p_Creature) const
	{
		return new npc_gorgrond_fungus_covered_shamblerAI(p_Creature);
	}


	struct npc_gorgrond_fungus_covered_shamblerAI : public ScriptedAI
	{
		npc_gorgrond_fungus_covered_shamblerAI(Creature* creature) : ScriptedAI(creature) {	}

		void EnterCombat(Unit* who) override
		{
			Talk(eCreatureTexts::CREATURE_TEXT_FUNGUS_COVERED_SHAMBLER_AGGRO);
		}

		void Reset() { }
		void UpdateAI(uint32 const p_Diff) { }
	};
};



/// Showing "Mercy" - 170792
class spell_quest_gorgrond_showing_mercy_peon : public SpellScriptLoader
{
	enum
	{
		Grom_karPeon = 85540,
	};

public:
	/// Constructor
	spell_quest_gorgrond_showing_mercy_peon() : SpellScriptLoader("spell_quest_gorgrond_showing_mercy_peon") { }

	class spell_quest_gorgrond_showing_mercy_peon_SpellScript : public SpellScript
	{
		PrepareSpellScript(spell_quest_gorgrond_showing_mercy_peon_SpellScript);

		void HandleDummy(SpellEffIndex /*p_EffIndex*/)
		{
			Unit* l_Caster = GetCaster();
			Unit* l_Target = GetHitUnit();

			if (l_Caster && l_Target && l_Caster->IsPlayer())
			{
				if (l_Target->GetEntry() == Grom_karPeon)
					l_Target->ToCreature()->DespawnOrUnsummon(0);
			}
		}

		/// Register all effect
		void Register() override
		{
			OnEffectHitTarget += SpellEffectFn(spell_quest_gorgrond_showing_mercy_peon_SpellScript::HandleDummy, EFFECT_0, SPELL_EFFECT_DUMMY);
		}
	};

	/// Get spell script
	SpellScript* GetSpellScript() const override
	{
		return new spell_quest_gorgrond_showing_mercy_peon_SpellScript();
	}
};



/// Yrel @ Wildwood Wash - 80978
class npc_gorgrond_yrel_wildwoodwash : public CreatureScript
{
public:
	npc_gorgrond_yrel_wildwoodwash() : CreatureScript("npc_gorgrond_yrel_wildwoodwash") { }

	enum eAction
	{
		StartWelcomeToGorgrond = 1,
		DrewAggroCulture = 0,
		EventCheckPlayer = 0
	};


	bool OnQuestAccept(Player* p_Player, Creature* p_Creature, const Quest* p_Quest)
	{
		if (p_Quest->GetQuestId() == eQuests::Quest_WelcometoGorgrond)
		{
			p_Creature->AI()->Talk(eCreatureTexts::CREATURE_TEXT_YREL_WELCOME_TO_GORGROND_START);

			if (Creature* Maraad = p_Creature->FindNearestCreature(eCreatures::NPC_GORGROND_VINDICATOR_MARAAD_PHASE_1, 7.5f, true))
			{
				Maraad->GetAI()->DoAction(eAction::StartWelcomeToGorgrond);
			}
		}
		return true;
	}

	struct npc_gorgrond_yrel_wildwoodwashAI : public ScriptedAI
	{
		npc_gorgrond_yrel_wildwoodwashAI(Creature* creature) : ScriptedAI(creature) {
			m_PreCompletingIDrewAggroCulture = false;
		}

		bool m_PreCompletingIDrewAggroCulture;

		EventMap m_CosmeticEvents;
		EventMap m_Events;

		void Reset()
		{
			m_Events.Reset();
			ClearDelayedOperations();

			m_CosmeticEvents.ScheduleEvent(EventCheckPlayer, 0.5 * TimeConstants::IN_MILLISECONDS);

		}

		void UpdateAI(uint32 const p_Diff) override
		{
			UpdateOperations(p_Diff);

			m_Events.Update(p_Diff);

			m_CosmeticEvents.Update(p_Diff);

			switch (m_Events.ExecuteEvent()) {}

			switch (m_CosmeticEvents.ExecuteEvent())
			{
					case EventCheckPlayer:
					{
						std::list<Player*> PlayersInRange;
						me->GetPlayerListInGrid(PlayersInRange, 10.0f);

						for (std::list<Player*>::const_iterator itr = PlayersInRange.begin(); itr != PlayersInRange.end(); ++itr)
						{
							if ((*itr)->HasQuest(eQuests::Quest_IDrewAggroCulture) && (*itr)->GetQuestStatus(Quest_IDrewAggroCulture) == QUEST_STATUS_COMPLETE) {
									me->AI()->DoAction(eAction::DrewAggroCulture);
							}
						}
					}
			}
		}

		void DoAction(int32 const p_Action)
		{
			switch (p_Action)
			{
			case eAction::DrewAggroCulture:
					{
						if (m_PreCompletingIDrewAggroCulture)
							return;

						m_PreCompletingIDrewAggroCulture = true;

						m_CosmeticEvents.CancelEvent(EventCheckPlayer);

						AddTimedDelayedOperation(2 * TimeConstants::IN_MILLISECONDS, [this]() -> void
						{
							Talk(eCreatureTexts::CREATURE_TEXT_YREL_DREW_AGGROCULTURE);
						});

						AddTimedDelayedOperation(60 * TimeConstants::IN_MILLISECONDS, [this]() -> void
						{
							m_CosmeticEvents.ScheduleEvent(EventCheckPlayer, 0.5 * TimeConstants::IN_MILLISECONDS);
							m_PreCompletingIDrewAggroCulture = false;
						});
						break;
					}
			}
		}
	};

	CreatureAI* GetAI(Creature* p_Creature) const
	{
		return new npc_gorgrond_yrel_wildwoodwashAI(p_Creature);
	}

};

/// Rangari Kaalya @ Wildwood Wash - 80987
class npc_gorgrond_rangari_kaalya_wildwoodwash : public CreatureScript
{
public:
	npc_gorgrond_rangari_kaalya_wildwoodwash() : CreatureScript("npc_gorgrond_rangari_kaalya_wildwoodwash") { }

	CreatureAI* GetAI(Creature* p_Creature) const
	{
		return new npc_gorgrond_rangari_kaalya_wildwoodwashAI(p_Creature);
	}

	enum eAction {
		DrewAggroCulture	 = 0,
		EventCheckPlayer	 = 0
	};


	struct npc_gorgrond_rangari_kaalya_wildwoodwashAI : public ScriptedAI
	{
		npc_gorgrond_rangari_kaalya_wildwoodwashAI(Creature* creature) : ScriptedAI(creature) {
			m_PreCompletingIDrewAggroCulture = false;
		}


		bool m_PreCompletingIDrewAggroCulture;

		EventMap m_CosmeticEvents;
		EventMap m_Events;

		void Reset()
		{
			m_Events.Reset();
			ClearDelayedOperations();

			m_CosmeticEvents.ScheduleEvent(EventCheckPlayer, 0.5 * TimeConstants::IN_MILLISECONDS);

		}

		void UpdateAI(uint32 const p_Diff) override
		{
			UpdateOperations(p_Diff);

			m_Events.Update(p_Diff);

			m_CosmeticEvents.Update(p_Diff);

			switch (m_Events.ExecuteEvent()) {}

			switch (m_CosmeticEvents.ExecuteEvent())
			{
			case EventCheckPlayer:
			{
				std::list<Player*> PlayersInRange;
				me->GetPlayerListInGrid(PlayersInRange, 10.0f);

				for (std::list<Player*>::const_iterator itr = PlayersInRange.begin(); itr != PlayersInRange.end(); ++itr)
				{
					if ((*itr)->HasQuest(eQuests::Quest_IDrewAggroCulture) && (*itr)->GetQuestStatus(Quest_IDrewAggroCulture) == QUEST_STATUS_COMPLETE) {
						me->AI()->DoAction(eAction::DrewAggroCulture);
					}
				}
			}
			}
		}

		void DoAction(int32 const p_Action)
		{
			switch (p_Action)
			{
				case eAction::DrewAggroCulture:
					{
						if (m_PreCompletingIDrewAggroCulture)
							return;

						m_PreCompletingIDrewAggroCulture = true;

						m_CosmeticEvents.CancelEvent(EventCheckPlayer);

						AddTimedDelayedOperation(9 * TimeConstants::IN_MILLISECONDS, [this]() -> void
						{
							Talk(eCreatureTexts::CREATURE_TEXT_RANGARI_KAALYA_DREW_AGGROCULTURE);
						});


						AddTimedDelayedOperation(60 * TimeConstants::IN_MILLISECONDS, [this]() -> void
						{
							m_CosmeticEvents.ScheduleEvent(EventCheckPlayer, 0.5 * TimeConstants::IN_MILLISECONDS);
							m_PreCompletingIDrewAggroCulture = false;
						});
						break;
					}
			}
		}
	};
};

/// Harvester Ommru @ Naielle's Watch - 84373
class npc_gorgrond_harvester_ommru : public CreatureScript
{
public:
	npc_gorgrond_harvester_ommru() : CreatureScript("npc_gorgrond_harvester_ommru") { }

	CreatureAI* GetAI(Creature* p_Creature) const
	{
		return new npc_gorgrond_harvester_ommruAI(p_Creature);
	}


	struct npc_gorgrond_harvester_ommruAI : public ScriptedAI
	{
		npc_gorgrond_harvester_ommruAI(Creature* creature) : ScriptedAI(creature) {	}

		void EnterCombat(Unit* who) override
		{
			Talk(eCreatureTexts::CREATURE_TEXT_HARVESTER_OMMRU_AGGRO);
		}	

		void Reset() { }
		void UpdateAI(uint32 const p_Diff) { }
	};
};



/// Vindicator Maraad @ Wildwood Wash - 75127
class npc_gorgrond_vindicator_maraad_wildwoodwash : public CreatureScript
{
public:
	npc_gorgrond_vindicator_maraad_wildwoodwash() : CreatureScript("npc_gorgrond_vindicator_maraad_wildwoodwash") { }

	CreatureAI* GetAI(Creature* p_Creature) const
	{
		return new npc_gorgrond_vindicator_maraad_wildwoodwashAI(p_Creature);
	}

	enum eAction {
		PreCompletingSecretsOfGorgrond = 0,
		StartWelcomeToGorgrond = 1,
		EventCheckPlayer = 0
	};


	struct npc_gorgrond_vindicator_maraad_wildwoodwashAI : public ScriptedAI
	{
		npc_gorgrond_vindicator_maraad_wildwoodwashAI(Creature* creature) : ScriptedAI(creature) {
			m_PreCompletingSecretsOfGorgrond = false;
		}

		bool m_PreCompletingSecretsOfGorgrond;

		EventMap m_CosmeticEvents;
		EventMap m_Events;

		void Reset()
		{
			m_Events.Reset();
			ClearDelayedOperations();

			m_CosmeticEvents.ScheduleEvent(EventCheckPlayer, 0.5 * TimeConstants::IN_MILLISECONDS);

		}

		void DoAction(int32 const p_Action)
		{
			switch (p_Action)
			{
			case PreCompletingSecretsOfGorgrond:
				{
					if (m_PreCompletingSecretsOfGorgrond)
						return;

					m_PreCompletingSecretsOfGorgrond = true;

					m_CosmeticEvents.CancelEvent(EventCheckPlayer);

					AddTimedDelayedOperation(0.2 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						Talk(eCreatureTexts::CREATURE_TEXT_VINDICATOR_MARAAD_SECRETS_OF_GORGROND);
					});

					AddTimedDelayedOperation(20 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						m_CosmeticEvents.ScheduleEvent(EventCheckPlayer, 0.5 * TimeConstants::IN_MILLISECONDS);
						m_PreCompletingSecretsOfGorgrond = false;
					});
					break;
				}
			case StartWelcomeToGorgrond:
				{

					AddTimedDelayedOperation(4.5 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->AI()->Talk(eCreatureTexts::CREATURE_TEXT_VINDICATOR_MARAAD_WELCOME_TO_GORGROND_START);
					});

					break;
				}
			}
		}

		void UpdateAI(uint32 const p_Diff) override
		{
			UpdateOperations(p_Diff);

			m_Events.Update(p_Diff);

			m_CosmeticEvents.Update(p_Diff);

			switch (m_Events.ExecuteEvent()) {}

			switch (m_CosmeticEvents.ExecuteEvent())
			{
			case EventCheckPlayer:
				{
					std::list<Player*> PlayersInRange;
					me->GetPlayerListInGrid(PlayersInRange, 10.0f);
					for (Player* p_Player : PlayersInRange)

						if (p_Player->HasQuest(eQuests::Quest_SecretsOfGorgrond1) && p_Player->GetQuestStatus(eQuests::Quest_SecretsOfGorgrond1) == QUEST_STATUS_COMPLETE)
						{
							DoAction(PreCompletingSecretsOfGorgrond);

						}
						else if (p_Player->HasQuest(eQuests::Quest_SecretsOfGorgrond2) && p_Player->GetQuestStatus(eQuests::Quest_SecretsOfGorgrond2) == QUEST_STATUS_COMPLETE ) {

							DoAction(PreCompletingSecretsOfGorgrond);

						}
						else if (p_Player->HasQuest(eQuests::Quest_SecretsOfGorgrond3) && p_Player->GetQuestStatus(eQuests::Quest_SecretsOfGorgrond3) == QUEST_STATUS_COMPLETE) {

							DoAction(PreCompletingSecretsOfGorgrond);
						}
				}
			};
		};
	};
};

/// Rangari D'kaan @ Naielle's Watch - 80921
class npc_gorgrond_rangari_dkaan_naielleswatch : public CreatureScript
{
public:
	npc_gorgrond_rangari_dkaan_naielleswatch() : CreatureScript("npc_gorgrond_rangari_dkaan_naielleswatch") { }

	struct npc_gorgrond_rangari_dkaan_naielleswatchAI : public ScriptedAI
	{
		npc_gorgrond_rangari_dkaan_naielleswatchAI(Creature* creature) : ScriptedAI(creature) {}

		void Reset() { }

		void UpdateAI(const uint32 /*uiDiff*/)
		{

			std::list<Player*> PlayersInRange;
			me->GetPlayerListInGrid(PlayersInRange, 5.0f);

			for (std::list<Player*>::const_iterator itr = PlayersInRange.begin(); itr != PlayersInRange.end(); ++itr)
			{
				if ((*itr)->HasQuest(eQuests::Quest_WelcometoGorgrond) && (*itr)->GetQuestObjectiveCounter(273393) != 1) {
					me->AI()->Talk(eCreatureTexts::CREATURE_TEXT_RANGARI_DKAAN_WELCOME_TO_GORGROND_START);
					(*itr)->QuestObjectiveSatisfy(eCreatures::NPC_GORGROND_RANGARI_DKAAN_PHASE_1, 1, QUEST_OBJECTIVE_TYPE_NPC, (*itr)->GetGUID());
				}
					
			}
		}
	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_gorgrond_rangari_dkaan_naielleswatchAI(creature);
	}
};


/// Glirin - 84766
class npc_gorgrond_glirin : public CreatureScript
{
public:
	npc_gorgrond_glirin() : CreatureScript("npc_gorgrond_glirin") { }


	enum eAction {
		PreCompletingLostMoleMachines = 0, // Talk action
		LostMoleMachines = 1, // The Tank spawn action
		EventCheckPlayer = 0
	};

	bool OnGossipHello(Player* p_Player, Creature* p_Creature)
	{
		if (p_Player->HasQuest(eQuests::Quest_LostMoleMachines) && p_Player->GetQuestObjectiveCounter(274504) != 1)
		{
			p_Player->QuestObjectiveSatisfy(eCreatures::NPC_GORGROND_GLIRIN, 1, QUEST_OBJECTIVE_TYPE_NPC_INTERACT, p_Player->GetGUID());
			p_Player->ADD_GOSSIP_ITEM_DB(eGossipMenus::GLIRIN_Menu_LostMole_Machines, eGossipOptions::GLIRIN_LostMole_Machines, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF);
			p_Player->SEND_GOSSIP_MENU(eNpcTexts::GLIRIN_TEXT_LOST_MOLE_MACHINES, p_Creature->GetGUID());
			if (Creature* l_Tank = p_Player->SummonCreature(eCreatures::NPC_GORGROND_THE_TANK, l_TankPos))
			{
				l_Tank->GetAI()->DoAction(eAction::LostMoleMachines);
			}

		} else if (p_Player->HasQuest(eQuests::Quest_LostMoleMachines) && p_Player->GetQuestObjectiveCounter(274529) != 1 && p_Player->GetQuestObjectiveCounter(274504) == 1)
		{
			p_Player->ADD_GOSSIP_ITEM_DB(eGossipMenus::GLIRIN_Menu_LostMole_Machines, eGossipOptions::GLIRIN_LostMole_Machines, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF);
			p_Player->SEND_GOSSIP_MENU(eNpcTexts::GLIRIN_TEXT_LOST_MOLE_MACHINES, p_Creature->GetGUID());
		}
			p_Player->SEND_GOSSIP_MENU(eNpcTexts::GLIRIN_TEXT_LOST_MOLE_MACHINES, p_Creature->GetGUID());
			return true;
	}


	bool OnGossipSelect(Player* p_Player, Creature* p_Creature, uint32 /*sender*/, uint32 action)
	{

		if (action == GOSSIP_ACTION_INFO_DEF && p_Player->GetQuestObjectiveCounter(274529) != 1)
		{
			// Doesn't actually do anything. When the first objective is completed upon interacting with the NPC, the tank automatically spawns and gives kill credit upon despawning at waypoint reached.
		}
			p_Player->PlayerTalkClass->ClearMenus();
			p_Player->PlayerTalkClass->SendCloseGossip();
			return true;
	}





	struct npc_gorgrond_glirinAI : public ScriptedAI
	{
		npc_gorgrond_glirinAI(Creature* creature) : ScriptedAI(creature) {
			m_PreCompletingLostMoleMachines = false;
		}

		bool m_PreCompletingLostMoleMachines;

		EventMap m_CosmeticEvents;
		EventMap m_Events;

		void Reset()
		{
			m_Events.Reset();
			ClearDelayedOperations();

			m_CosmeticEvents.ScheduleEvent(EventCheckPlayer, 0.5 * TimeConstants::IN_MILLISECONDS);

		}


		void DoAction(int32 const p_Action)
		{
			switch (p_Action)
			{
			case PreCompletingLostMoleMachines:
			{
				if (m_PreCompletingLostMoleMachines)
					return;

				m_PreCompletingLostMoleMachines = true;

				m_CosmeticEvents.CancelEvent(EventCheckPlayer);

				AddTimedDelayedOperation(0.2 * TimeConstants::IN_MILLISECONDS, [this]() -> void
				{
					Talk(eCreatureTexts::CREATURE_TEXT_GLIRIN_LOST_MOLE_MACHINES);
				});

				AddTimedDelayedOperation(20 * TimeConstants::IN_MILLISECONDS, [this]() -> void
				{
					m_CosmeticEvents.ScheduleEvent(EventCheckPlayer, 0.5 * TimeConstants::IN_MILLISECONDS);
					m_PreCompletingLostMoleMachines = false;
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

			m_Events.Update(p_Diff);

			m_CosmeticEvents.Update(p_Diff);

			switch (m_Events.ExecuteEvent()) {}

			switch (m_CosmeticEvents.ExecuteEvent())
			{
				case EventCheckPlayer:
					std::list<Player*> PlayersInRange;
					me->GetPlayerListInGrid(PlayersInRange, 10.0f);
					for (Player* p_Player : PlayersInRange)
						if (p_Player->HasQuest(eQuests::Quest_LostMoleMachines) && p_Player->GetQuestObjectiveCounter(274504) != 1)
						{
							DoAction(PreCompletingLostMoleMachines);
						}
			}
					
		}

	};


	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_gorgrond_glirinAI(creature);
	}
};



class npc_gorgrond_thetank_highpass : public CreatureScript
{
public:
	npc_gorgrond_thetank_highpass() : CreatureScript("npc_gorgrond_thetank_highpass") { }

	enum eAction {
		LostMoleMachines = 1
	};

	struct npc_gorgrond_thetank_highpassAI : public ScriptedAI
	{
		npc_gorgrond_thetank_highpassAI(Creature* creature) : ScriptedAI(creature)
		{
			m_PlayerGUID = 0;
		}

		uint64 m_PlayerGUID;

		void Reset() override
		{
			ClearDelayedOperations();

			m_PlayerGUID = 0;
		}

		void IsSummonedBy(Unit* p_Summoner) override
		{
			m_PlayerGUID = p_Summoner->GetGUID();
		}

		void DoAction(int32 const p_Action) override
		{
			switch (p_Action)
			{
			case eAction::LostMoleMachines:
				{

					me->SetSpeed(UnitMoveType::MOVE_RUN, 3.0f, true);

					AddTimedDelayedOperation(0 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->GetMotionMaster()->MoveSmoothPath(0, g_TankMoves.data(), g_TankMoves.size(), false);
						// Not taking off after spawning, need to check why
					});

					//AddTimedDelayedOperation(6 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					//{
						// Need to activate Barrier Stone (ID: 234206) at 3rd waypoint.

					//});

					AddTimedDelayedOperation(7.5 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->SetFacingTo(1.745233);
						me->GetMotionMaster()->MovePoint(0, 6303.126465f, 704.853699f, 115.673759f, false);
					});


					AddTimedDelayedOperation(8.5 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						if (m_PlayerGUID)
						{
							if (Player* p_Player = me->GetPlayer(*me, m_PlayerGUID))
							{
								if (p_Player->HasQuest(eQuests::Quest_LostMoleMachines))
									p_Player->CompleteQuest(eQuests::Quest_LostMoleMachines, false);
							}
						}
					});

					AddTimedDelayedOperation(10 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->DespawnOrUnsummon();

						// change phasemask of tank, 74959 
						// change phasemask of npcs near tank
					});

					break;
				}
			default:
				break;
			}
		}
	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_gorgrond_thetank_highpassAI(creature);
	}
};



class npc_gorgrond_iyu_wildwoodwash : public CreatureScript
{
public:
	npc_gorgrond_iyu_wildwoodwash() : CreatureScript("npc_gorgrond_iyu_wildwoodwash") { }

	enum eAction {
		WelcomeToGorgrondScout = 0
	};

	struct npc_gorgrond_iyu_wildwoodwashAI : public ScriptedAI
	{
		npc_gorgrond_iyu_wildwoodwashAI(Creature* creature) : ScriptedAI(creature)
		{
			m_PlayerGUID = 0;
		}

		uint64 m_PlayerGUID;

		
		void Reset() override
		{
			ClearDelayedOperations();

			m_PlayerGUID = 0;
		}


		void UpdateAI(const uint32 p_Diff) override
		{
			std::list<Player*> PlayersInRange;
			me->GetPlayerListInGrid(PlayersInRange, 50.0f);

			for (std::list<Player*>::const_iterator itr = PlayersInRange.begin(); itr != PlayersInRange.end(); ++itr)
			{
				if ((*itr)->HasQuest(eQuests::Quest_WelcometoGorgrond) && (*itr)->GetQuestObjectiveCounter(273370) != 1) {
					me->AI()->DoAction(eAction::WelcomeToGorgrondScout);
				}

			}
		}
		void IsSummonedBy(Unit* p_Summoner) override
		{
			m_PlayerGUID = p_Summoner->GetGUID();
		}

		void DoAction(int32 const p_Action) override
		{
			switch (p_Action)
			{
			case eAction::WelcomeToGorgrondScout:
			{

				// Creature* l_Iyu = p_Player->SummonCreature(eCreatures::NPC_GORGROND_, l_TankPos)
				// Must spawn in the player's phase - players who see the main npcs in a different phase are not supposed to see Iyu during this quest.
				// throw tank - https://www.wowhead.com/npc=75218/kill-credit-laughing-skull-nuke
				// turn and start path
				// despawn

				break;
			}
			default:
				break;
			}
		}
	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_gorgrond_iyu_wildwoodwashAI(creature);
	}
};


/// Naielle's Watch Cave Entrance Bunny @ Wildwood Wash - 84864
class npc_gorgrond_naielleswatch_bunny : public CreatureScript
{
public:
	npc_gorgrond_naielleswatch_bunny() : CreatureScript("npc_gorgrond_naielleswatch_bunny") { }


	struct npc_gorgrond_naielleswatch_bunnyAI : public ScriptedAI
	{
		npc_gorgrond_naielleswatch_bunnyAI(Creature* creature) : ScriptedAI(creature) { }

		void UpdateAI(const uint32 /*uiDiff*/)
		{

			std::list<Player*> PlayersInRange;
			me->GetPlayerListInGrid(PlayersInRange, 10.0f);

			for (std::list<Player*>::const_iterator itr = PlayersInRange.begin(); itr != PlayersInRange.end(); ++itr)
			{
				if ((*itr)->HasQuest(eQuests::Quest_AHarvesterHasCome) && (*itr)->GetQuestObjectiveCounter(273415) == 1) {
					// New phase for Maraad, Yrel, D'kaan and Kaalya.
				}

			}
		}

		void Reset() { }
	};

	CreatureAI* GetAI(Creature* p_Creature) const
	{
		return new npc_gorgrond_naielleswatch_bunnyAI(p_Creature);
	}

};


#ifndef __clang_analyzer__
void AddSC_gorgrond()
{
	/// Bosses
	new boss_tarlna_the_ageless();
	new boss_drov_the_ruiner();

	/// Npcs
	new npc_untamed_mandragora();
	new npc_giant_lasher();
	new npc_drov_rumbling_goren();
	new npc_drov_frenzied_rumbler();
	new npc_gorgrond_goren_egg();
	new npc_gorgrond_toxic_slimemold();
	new npc_quest_frightened_spirit();
	new npc_gorgrond_rangari_rajess();
	new npc_gorgrond_rangari_kolaan();
	new npc_gorgrond_rangari_jonaa();
	new npc_gorgrond_fallen_rangari();
	new npc_gorgrond_dead_rangari();
	new npc_gorgrond_rangari_elekk();
	new npc_gorgrond_goren_gouger();
	new npc_gorgrond_infested_vinewarden();
	new npc_gorgrond_botani_greensworn();
	new npc_gorgrond_gronn_rockthrower();
	new npc_gorgrond_mandragora_lifedrinker();
	new npc_gorgrond_gronnling_bonebreaker();
	new npc_gorgrond_podling_nibbler();
	new npc_gorgrond_stonemaul_guard();
	new npc_gorgrond_podling_scavenger();
	new npc_gorgrond_podling_scavenger_naielleswatch();
	new npc_gorgrond_gromkar_grunt();
	new npc_gorgrond_gromkar_shieldbearer();
	new npc_gorgrond_fungus_covered_shambler();
	new npc_gorgrond_yrel_wildwoodwash();
	new npc_gorgrond_rangari_kaalya_wildwoodwash();
	new npc_gorgrond_harvester_ommru();
	new npc_gorgrond_vindicator_maraad_wildwoodwash();
	new npc_gorgrond_rangari_dkaan_naielleswatch();
	new npc_gorgrond_glirin();
	new npc_gorgrond_thetank_highpass();
	//new npc_gorgrond_iyu_wildwoodwash();
	new npc_gorgrond_naielleswatch_bunny();

	/// Spells
	new spell_drov_call_of_earth();
	new spell_drov_colossal_slam();
	new spell_drov_acid_breath();
	new spell_quest_gorgrond_punt_podling();
	new spell_quest_gorgrond_burn_ancient_corpse();
	new spell_quest_gorgrond_showing_mercy_peon();

	/// Areatriggers
	new areatrigger_tarlna_noxious_spit();

	/// GameObjects
	new go_gorgrond_ancient_ogre_hoard_jar();
	new go_gorgrond_pollen_pod();
	new go_gorgrond_keg_of_grog();
}
#endif