#include "ScriptPCH.h"
#include "scholomance.h"

enum ScriptTexts
{
	SAY_AGGRO = 0,
	SAY_DEATH = 1,
	SAY_INTRO = 2,
	SAY_KILL = 3,
};

enum Spells
{
	SPELL_HARSH_LESSON = 113395,
	SPELL_IMMOLATE = 113141,
	SPELL_RISE = 113143,
	SPELL_INCINERATE = 113136,

	// Trash
	SPELL_EXPLOSIVE_PAIN = 113312
};

enum Events
{
	EVENT_INCINERATE = 1,
	EVENT_LESSON,
	EVENT_RISE,
	EVENT_IMMOLATE
};

enum Actions
{
	ACTION_GANDLING_INTRO = 1
};

class boss_darkmaster_gandling : public CreatureScript
{
public:
	boss_darkmaster_gandling() : CreatureScript("boss_darkmaster_gandling") { }

	CreatureAI* GetAI(Creature* creature) const
	{
		return new boss_darkmaster_gandlingAI(creature);
	}

	struct boss_darkmaster_gandlingAI : public BossAI
	{
		boss_darkmaster_gandlingAI(Creature* creature) : BossAI(creature, DATA_GANDLING)
		{
			me->ApplySpellImmune(0, IMMUNITY_EFFECT, SPELL_EFFECT_KNOCK_BACK, true);
			me->ApplySpellImmune(0, IMMUNITY_EFFECT, SPELL_EFFECT_KNOCK_BACK_DEST, true);
			me->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_GRIP, true);
			me->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_STUN, true);
			me->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_FEAR, true);
			me->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_ROOT, true);
			me->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_FREEZE, true);
			me->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_POLYMORPH, true);
			me->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_HORROR, true);
			me->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_SAPPED, true);
			me->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_CHARM, true);
			me->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_DISORIENTED, true);
			me->ApplySpellImmune(0, IMMUNITY_STATE, SPELL_AURA_MOD_CONFUSE, true);

			me->setActive(true);

			intro = false;
		}

		void Reset()
		{
			_Reset();

			SetEquipmentSlots(false, 82859, 0, 0);
		}

		void EnterCombat(Unit* /*who*/)
		{
			Talk(SAY_AGGRO);
			events.ScheduleEvent(EVENT_INCINERATE, 500);
			events.ScheduleEvent(EVENT_RISE, 17000);

			DoZoneInCombat();
			instance->SetBossState(DATA_GANDLING, IN_PROGRESS);
		}

		void MoveInLineOfSight(Unit* who)
		{
			if (!intro && me->GetDistance(who) <= 25.0f)
			{
				intro = true;
				Talk(SAY_INTRO);
			}
		}

		void KilledUnit(Unit* victim)
		{
			if (victim->GetTypeId() == TYPEID_PLAYER)
			{
				Talk(SAY_KILL);
			}
		}

		void JustDied(Unit* /*killer*/)
		{
			_JustDied();
			Talk(SAY_DEATH);
		}

		void UpdateAI(uint32 const diff)
		{
			if (!UpdateVictim())
				return;

			events.Update(diff);

			if (me->HasUnitState(UNIT_STATE_CASTING))
				return;

			if (uint32 eventId = events.ExecuteEvent())
			{
				switch (eventId)
				{
				case EVENT_INCINERATE:
					DoCastVictim(SPELL_INCINERATE);
					events.ScheduleEvent(EVENT_INCINERATE, 2 * IN_MILLISECONDS);
					break;
				case EVENT_RISE:
					DoCast(SPELL_RISE);
					events.ScheduleEvent(EVENT_RISE, 60 * IN_MILLISECONDS);
					events.ScheduleEvent(EVENT_IMMOLATE, 29 * IN_MILLISECONDS);
					events.ScheduleEvent(EVENT_LESSON, 27 * IN_MILLISECONDS);
					break;
				case EVENT_LESSON:
					DoCast(SPELL_HARSH_LESSON);
					break;
				case EVENT_IMMOLATE:
					DoCastVictim(SPELL_IMMOLATE);
					break;
				default:
					break;
				}
			}
		}

	private:

		bool intro;
	};
};

void AddSC_boss_darkmaster_gandling()
{
	new boss_darkmaster_gandling();
}