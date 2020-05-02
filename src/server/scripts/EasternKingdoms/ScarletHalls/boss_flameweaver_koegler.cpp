#include "ScriptPCH.h"
#include "scarlet_halls.h"

enum ScriptedTexts
{
	SAY_AGGRO = 0,
	SAY_DEATH = 1,
	SAY_INTRO = 2,
	SAY_KILL = 3,
	SAY_DRAGON_BREATH = 4,
};

enum Spells
{
	SPELL_PYROBLAST = 113690,
	SPELL_FIREBALL_VOLLEY = 113691,
	SPELL_QUICKENED_MIND = 113682,
	SPELL_GREATER_DRAGONS_BREATH = 113641,
	SPELL_GREATER_DRAGONS_BREATH_DMG = 113653,
	SPELL_GREATER_DRAGONS_BREATH_DUMMY = 113657,

	SPELL_BOOK_BURNER_AOE = 113366,
	SPELL_BOOK_BURNER = 113364,
	SPELL_BURNING_BOOKS = 113616,
	SPELL_BURNING_BOOKS_DMG = 113620,

	SPELL_TELEPORT = 113626
};

enum Events
{
	EVENT_PYROBLAST = 1,
	EVENT_FIREBALL_VOLLEY,
	EVENT_QUICKENED_MIND,
	EVENT_GREATER_DRAGONS_BREATH,

	EVENT_BURNING_BOOKS,
	EVENT_TELEPORT,
	EVENT_DRAGON_BREATH_INTRO
};

enum Timers
{
	TIMER_PYROBLAST_FIRST = 5 * IN_MILLISECONDS,
	TIMER_PYROBLAST = 6 * IN_MILLISECONDS,
	TIMER_FIREBALL_VOLLEY_FIRST = 15 * IN_MILLISECONDS,
	TIMER_FIREBALL_VOLLEY = 30 * IN_MILLISECONDS,
	TIMER_QUICKENED_MIND_FIRST = 9 * IN_MILLISECONDS,
	TIMER_QUICKENED_MIND = 30 * IN_MILLISECONDS,
	TIMER_GREATER_DRAGONS_BREATH_FIRST = 9 * IN_MILLISECONDS,
	TIMER_GREATER_DRAGONS_BREATH = 30 * IN_MILLISECONDS,
};

enum Adds
{
	NPC_DRAGON_BREATH_TARGET = 59198,
};

enum Actions
{
	ACTION_FLAMEWEAVER_KOEGLER_INTRO = 1,
};

#define DRAGON_BREATH_POSITION_COUNT 4
const Position dragonBreathPos[DRAGON_BREATH_POSITION_COUNT] =
{
	{1284.621704f, 549.195923f, 12.834718f, 6.175966f},
	{1297.670044f, 536.281494f, 12.827723f, 0.885434f},
	{1314.020874f, 550.135437f, 12.831744f, 3.130361f},
	{1299.557861f, 563.362366f, 12.821470f, 3.090657f}
};

class boss_flameweaver_koegler : public CreatureScript
{
public:
	boss_flameweaver_koegler() : CreatureScript("boss_flameweaver_koegler") { }

	CreatureAI* GetAI(Creature* creature) const
	{
		return new boss_flameweaver_koeglerAI(creature);
	}

	struct boss_flameweaver_koeglerAI : public BossAI
	{
		boss_flameweaver_koeglerAI(Creature* creature) : BossAI(creature, DATA_FLAMEWEAVER_KOEGLER)
		{
			//ApplyAllImmunities(true); -- Need to look into this function from PandaWoW
			me->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_INTERRUPT, false);

			m_IsIntroDone = false;
		}

		void Reset() override
		{
			_Reset();

			me->SetReactState(REACT_DEFENSIVE);
		}

		void EnterCombat(Unit* /*who*/) override
		{
			Talk(SAY_AGGRO);

			events.ScheduleEvent(EVENT_PYROBLAST, TIMER_PYROBLAST_FIRST);
			events.ScheduleEvent(EVENT_FIREBALL_VOLLEY, TIMER_FIREBALL_VOLLEY_FIRST);
			events.ScheduleEvent(EVENT_QUICKENED_MIND, TIMER_QUICKENED_MIND_FIRST);
			events.ScheduleEvent(EVENT_GREATER_DRAGONS_BREATH, TIMER_GREATER_DRAGONS_BREATH_FIRST);

			m_IsIntroDone = true;

			DoZoneInCombat();
			instance->SetBossState(DATA_FLAMEWEAVER_KOEGLER, IN_PROGRESS);
		}

		void KilledUnit(Unit* victim) override
		{
			if (victim && victim->IsPlayer())
			{
				Talk(SAY_KILL);
			}
		}

		void DoAction(const int32 action) override
		{
			if (action == ACTION_FLAMEWEAVER_KOEGLER_INTRO)
			{
				HandleIntro();
			}
		}

		void JustDied(Unit* /*killer*/) override
		{
			_JustDied();
			Talk(SAY_DEATH);
		}

		void UpdateAI(uint32 const diff) override
		{
			if (!UpdateVictim())
				return;

			events.Update(diff);

			if (me->HasUnitState(UNIT_STATE_CASTING))
				return;

			if (uint32 eventId = events.ExecuteEvent())
			{
				ExecuteEvent(eventId);
			}

			DoMeleeAttackIfReady();
		}

	private:

		void ExecuteEvent(const uint32 eventId) override
		{
			switch (eventId)
			{
			case EVENT_PYROBLAST:
				DoPyroblast();
				events.ScheduleEvent(EVENT_PYROBLAST, TIMER_PYROBLAST);
				break;
			case EVENT_FIREBALL_VOLLEY:
				DoFireballVolley();
				events.ScheduleEvent(EVENT_FIREBALL_VOLLEY, TIMER_FIREBALL_VOLLEY);
				break;
			case EVENT_QUICKENED_MIND:
				DoQuickenedMind();
				events.ScheduleEvent(EVENT_QUICKENED_MIND, TIMER_QUICKENED_MIND);
				break;
			case EVENT_GREATER_DRAGONS_BREATH:
				DoGreaterDragonsBreath();
				events.ScheduleEvent(EVENT_GREATER_DRAGONS_BREATH, TIMER_GREATER_DRAGONS_BREATH);
				break;
				/*case EVENT_BURNING_BOOKS:
					DoCast(SPELL_BOOK_BURNER);
					events.ScheduleEvent(EVENT_BURNING_BOOKS, 30000); // should be 30sec after the first one
					break;
				case EVENT_TELEPORT:
					DoCast(SPELL_TELEPORT);
					me->SendMovementFlagUpdate();
					me->SetTarget(0);
					me->StopMoving();
					events.ScheduleEvent(EVENT_TELEPORT, 45000);
					events.ScheduleEvent(EVENT_DRAGON_BREATH, 1000);*/
				break;
			default:
				break;
			}
		}

		void HandleIntro()
		{
			if (m_IsIntroDone)
				return;

			m_IsIntroDone = true;

			Talk(SAY_INTRO);
		}

		void DoPyroblast()
		{
			TryCastWithQuickenedMind(me->getVictim(), SPELL_PYROBLAST);
		}

		void DoFireballVolley()
		{
			TryCastWithQuickenedMind(me, SPELL_FIREBALL_VOLLEY);
		}

		void DoQuickenedMind()
		{
			DoCast(me, SPELL_QUICKENED_MIND);
		}

		void TryCastWithQuickenedMind(Unit* target, uint32 spellId)
		{
			if (me->HasAura(SPELL_QUICKENED_MIND))
			{
				me->CastCustomSpell(spellId, SPELLVALUE_INSTANT_CAST, true, target, false);
				me->RemoveAuraFromStack(SPELL_QUICKENED_MIND);
			}
			else
			{
				DoCast(target, spellId);
			}
		}

		void DoGreaterDragonsBreath()
		{
			uint8 index = urand(0, DRAGON_BREATH_POSITION_COUNT);
			if (Creature* pTarget = me->SummonCreature(NPC_DRAGON_BREATH_TARGET, dragonBreathPos[index], TEMPSUMMON_TIMED_DESPAWN, 30000))
			{
				me->SetOrientation(me->GetAngle(pTarget));
				me->SetFacingToObject(pTarget);
				DoCast(pTarget, SPELL_GREATER_DRAGONS_BREATH);
			}
		}

	private:

		bool m_IsIntroDone;
	};
};

class mob_book_case : public CreatureScript
{
public:
	mob_book_case() : CreatureScript("mob_book_case") { }

	struct mob_book_caseAI : public ScriptedAI
	{
		mob_book_caseAI(Creature* creature) : ScriptedAI(creature) { }

		void Reset() { }

		void EnterCombat(Unit* /*who*/) { }

		void SpellHit(Unit* caster, SpellInfo const* spell)
		{
			if (spell->Id == SPELL_BOOK_BURNER)
			{
				DoCast(me, SPELL_BURNING_BOOKS);
			}
		}
	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new mob_book_caseAI(creature);
	}
};

class spell_flameweaver_koegler_greater_dragons_breath : public SpellScriptLoader
{
public:
	spell_flameweaver_koegler_greater_dragons_breath() : SpellScriptLoader("spell_flameweaver_koegler_greater_dragons_breath") { }

	class spell_flameweaver_koegler_greater_dragons_breath_AuraScript : public AuraScript
	{
		PrepareAuraScript(spell_flameweaver_koegler_greater_dragons_breath_AuraScript);

		void HandleEffectPeriodic0(AuraEffect const* aurEff)
		{
			PreventDefaultAction();

			if (!GetCaster() || !GetUnitOwner())
				return;

			GetCaster()->CastSpell(GetUnitOwner(), SPELL_GREATER_DRAGONS_BREATH_DMG, true);
		}

		void HandleEffectPeriodic1(AuraEffect const* aurEff)
		{
			PreventDefaultAction();

			if (!GetCaster() || !GetUnitOwner())
				return;

			GetCaster()->CastSpell(GetUnitOwner(), SPELL_GREATER_DRAGONS_BREATH_DUMMY, true);
		}

		void Register()
		{
			OnEffectPeriodic += AuraEffectPeriodicFn(spell_flameweaver_koegler_greater_dragons_breath_AuraScript::HandleEffectPeriodic0, EFFECT_0, SPELL_AURA_PERIODIC_TRIGGER_SPELL);
			OnEffectPeriodic += AuraEffectPeriodicFn(spell_flameweaver_koegler_greater_dragons_breath_AuraScript::HandleEffectPeriodic1, EFFECT_1, SPELL_AURA_PERIODIC_TRIGGER_SPELL);
		}
	};

	AuraScript* GetAuraScript() const
	{
		return new spell_flameweaver_koegler_greater_dragons_breath_AuraScript();
	}
};

class at_flameweaver_koegler : public AreaTriggerScript
{
public:

	at_flameweaver_koegler()
		: AreaTriggerScript("at_flameweaver_koegler")
	{
	}

	void OnEnter(Player* p_Player, AreaTriggerEntry const* /*p_AreaTrigger*/) override
	{

		if (Creature* pKoegler = GetFlameweaverKoegler(p_Player))
		{
			pKoegler->AI()->DoAction(ACTION_FLAMEWEAVER_KOEGLER_INTRO);
		}
	}

private:

	Creature* GetFlameweaverKoegler(WorldObject* searcher)
	{
		if (InstanceScript* pInstance = searcher->GetInstanceScript())
		{
			return pInstance->instance->GetCreature(pInstance->GetData64(DATA_FLAMEWEAVER_KOEGLER));
		}

		return NULL;
	}
};

void AddSC_boss_flameweaver_koegler()
{
	new boss_flameweaver_koegler();     // 59150
	new mob_book_case(); // 59155

	new spell_flameweaver_koegler_greater_dragons_breath(); // 113641

	new at_flameweaver_koegler();       // 8317
}