#include "ScriptPCH.h"
#include "scarlet_monastery.h"

enum ScriptTexts
{
	SAY_AGGRO = 0,
	SAY_DEATH = 1,
	SAY_RESET = 2,
	SAY_KILL = 3,
};

enum Spells
{
	SPELL_BLAZING_FISTS = 114807,
	SPELL_BLAZING_FISTS_DMG = 114808,

	SPELL_FLYING_KICK = 114487,
	SPELL_FIRESTORM_KICK = 113764,

	SPELL_RISING_FLAME = 114435,
	SPELL_RISING_FLAME_AURA = 114410,

	SPELL_SCORCHED_EARTH = 114460,
	SPELL_SCORCHED_EARTH_SUMMON = 114463,
	SPELL_SCORCHED_EARTH_AURA = 114464,
	SPELL_SCORCHED_EARTH_DMG = 114465,
};

enum Events
{
	EVENT_BLAZING_FISTS = 1,
	EVENT_FLYING_KICK,
	EVENT_RISING_FLAME,
	EVENT_FIRESTORM_KICK,
	EVENT_SCORCHED_EARTH,
};

enum Adds
{
	NPC_SCORCHED_EARTH = 59507,
};

class boss_brother_korloff : public CreatureScript
{
public:
	boss_brother_korloff() : CreatureScript("boss_brother_korloff") { }

	CreatureAI* GetAI(Creature* creature) const
	{
		return new boss_brother_korloffAI(creature);
	}

	struct boss_brother_korloffAI : public BossAI
	{
		boss_brother_korloffAI(Creature* creature) : BossAI(creature, DATA_KORLOFF)
		{
			me->ApplySpellImmune(0, IMMUNITY_EFFECT, SPELL_EFFECT_KNOCK_BACK, true);
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
		}

		void Reset()
		{
			_Reset();
			Talk(SAY_RESET);

			scorchedEarth = false;
		}

		void EnterCombat(Unit* /*who*/)
		{
			Talk(SAY_AGGRO);
			events.ScheduleEvent(EVENT_FIRESTORM_KICK, 10000);
			events.ScheduleEvent(EVENT_BLAZING_FISTS, 20500);
			events.ScheduleEvent(EVENT_RISING_FLAME, 1000);
		}

		void JustDied(Unit* /*killer*/)
		{
			_JustDied();
			Talk(SAY_DEATH);
		}

		void KilledUnit(Unit* victim)
		{
			if (victim->GetTypeId() == TYPEID_PLAYER)
				Talk(SAY_KILL);
		}

		void MovementInform(uint32 type, uint32 id)
		{
			if (id == EVENT_JUMP)
			{
				events.ScheduleEvent(EVENT_FIRESTORM_KICK, 100);
			}
		}

		void UpdateAI(uint32 const diff)
		{
			if (!UpdateVictim())
				return;

			events.Update(diff);

			if (me->HasUnitState(UNIT_STATE_CASTING))
				return;

			if (me->GetHealthPct() <= 50.0f && !scorchedEarth)
			{
				scorchedEarth = true;
				me->AddAura(SPELL_SCORCHED_EARTH, me);
				events.ScheduleEvent(EVENT_SCORCHED_EARTH, 1000);
				return;
			}

			if (uint32 eventId = events.ExecuteEvent())
			{
				switch (eventId)
				{
				case EVENT_FLYING_KICK:
					if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 40.0f, true))
						DoCast(target, SPELL_FLYING_KICK);
					events.ScheduleEvent(EVENT_FLYING_KICK, 25000);
					break;
				case EVENT_FIRESTORM_KICK:
					DoCast(me, SPELL_FIRESTORM_KICK);
					break;
				case EVENT_BLAZING_FISTS:
					DoCastVictim(SPELL_BLAZING_FISTS);
					events.ScheduleEvent(EVENT_BLAZING_FISTS, 30000);
					break;
				case EVENT_RISING_FLAME:
				{
					int8 pct = int8((100.f - me->GetHealthPct()) / 10.0f);
					if (pct > 0)
					{
						if (Aura* aur = me->GetAura(SPELL_RISING_FLAME_AURA))
						{
							aur->ModStackAmount(pct - aur->GetStackAmount());
						}
						else
						{
							if (Aura* aur = me->AddAura(SPELL_RISING_FLAME_AURA, me))
								aur->SetStackAmount(pct);
						}
					}
					events.ScheduleEvent(EVENT_RISING_FLAME, 1000);
					break;
				}
				case EVENT_SCORCHED_EARTH:
					DoCast(me, SPELL_SCORCHED_EARTH_SUMMON);
					events.ScheduleEvent(EVENT_SCORCHED_EARTH, urand(8000, 12000));
					break;
				default:
					break;
				}
			}
			DoMeleeAttackIfReady();
		}
	private:
		bool scorchedEarth;
	};
};

class npc_brother_korloff_scorched_earth : public CreatureScript
{
public:
	npc_brother_korloff_scorched_earth() : CreatureScript("npc_brother_korloff_scorched_earth") {}

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_brother_korloff_scorched_earthAI(creature);
	}

	struct npc_brother_korloff_scorched_earthAI : public Scripted_NoMovementAI
	{
		npc_brother_korloff_scorched_earthAI(Creature* creature) : Scripted_NoMovementAI(creature)
		{
			me->SetReactState(REACT_PASSIVE);
			me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_IMMUNE_TO_PC);
		}

		void Reset()
		{
			me->AddAura(SPELL_SCORCHED_EARTH_AURA, me);
		}

		void UpdateAI(const uint32 diff)
		{

		}
	};
};

void AddSC_boss_brother_korloff()
{
	new boss_brother_korloff();
	new npc_brother_korloff_scorched_earth();
}