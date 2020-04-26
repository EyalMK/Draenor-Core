#include "ScriptPCH.h"
#include "sunken_temple.h"

// Dreamscythe, Weaver, Hazzas, Morphaz has same spells

enum Spells
{
	// Warden of the Dream
	SPELL_ACID_BREATH = 12533,
	SPELL_WING_FLAP = 11019,

	// Avatar of Hakkar
	SPELL_CAUSE_INSANITY = 12888,
	SPELL_CURSE_OF_TONGUES = 12889,
	SPELL_LASH = 31286,

	// Jammalan The Prophet
	SPELL_HEALING_WAVE = 12492,
	SPELL_EARTHGRAB_TOTEM = 8376,
	SPELL_EARTHGRAB_TOTEM_AURA = 8378,
	SPELL_EARTHGRAB = 8377,
	SPELL_FLAMESTRIKE = 12468,
	SPELL_HEX_OF_JAMMALAN = 12480,

	// Ogom The Wretched
	SPELL_SHADOW_BOLT = 12471,
	SPELL_CURSE_OF_WEAKNESS = 12493,
	SPELL_SHADOW_WORD_PAIN = 11639,

	// Shade of Eranikus
	SPELL_DEEP_SLUMBER = 12890,
	SPELL_THRASH = 3391,
	SPELL_WAR_STOMP = 11876,
	//SPELL_ACID_BREATH         = 12533,
};

enum Events
{
	// Warden of the Dream
	EVENT_ACID_BREATH = 1,
	EVENT_WING_FLAP,

	// Avatar of Hakkar
	EVENT_CAUSE_INSANITY,
	EVENT_CURSE_OF_TONGUES,
	EVENT_LASH,

	// Jammalan The Prophet
	EVENT_HEALING_WAVE,
	EVENT_EARTHGRAB_TOTEM,
	EVENT_FLAMESTRIKE,
	EVENT_HEX_OF_JAMMALAN,

	// Ogom The Wretched
	EVENT_SHADOW_BOLT,
	EVENT_CURSE_OF_WEAKNESS,
	EVENT_SHADOW_WORD_PAIN,

	// Shade of Eranikus
	EVENT_DEEP_SLUMBER,
	EVENT_THRASH,
	EVENT_WAR_STOMP,
};


class npc_warden_of_the_dream : public CreatureScript
{
public:
	npc_warden_of_the_dream() : CreatureScript("npc_warden_of_the_dream") { }

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_warden_of_the_dream_AI(creature);
	}

	struct npc_warden_of_the_dream_AI : public ScriptedAI
	{
		npc_warden_of_the_dream_AI(Creature* creature) : ScriptedAI(creature) { }

		void Reset()
		{
			events.Reset();
		}

		void EnterCombat(Unit* who)
		{
			events.ScheduleEvent(EVENT_ACID_BREATH, urand(3000, 6000));
			events.ScheduleEvent(EVENT_WING_FLAP, urand(5000, 10000));
		}

		void JustDied(Unit* who)
		{
			events.Reset();
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
				case EVENT_ACID_BREATH:
					DoCastVictim(SPELL_ACID_BREATH);
					events.ScheduleEvent(EVENT_ACID_BREATH, urand(7000, 15000));
					break;
				case EVENT_WING_FLAP:
					DoCastVictim(SPELL_WING_FLAP);
					events.ScheduleEvent(EVENT_WING_FLAP, urand(15000, 18000));
					break;
				default:
					break;
				}
			}

			DoMeleeAttackIfReady();
		}
	};
};

class npc_avatar_of_hakkar : public CreatureScript
{
public:
	npc_avatar_of_hakkar() : CreatureScript("npc_avatar_of_hakkar") { }

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_avatar_of_hakkar_AI(creature);
	}

	struct npc_avatar_of_hakkar_AI : public ScriptedAI
	{
		npc_avatar_of_hakkar_AI(Creature* creature) : ScriptedAI(creature) { }

		void Reset()
		{
			events.Reset();
		}

		void EnterCombat(Unit* who)
		{
			events.ScheduleEvent(EVENT_CAUSE_INSANITY, urand(8000, 10000));
			events.ScheduleEvent(EVENT_CURSE_OF_TONGUES, urand(3000, 6000));
			events.ScheduleEvent(EVENT_LASH, urand(5000, 6000));
		}

		void JustDied(Unit* who)
		{
			events.Reset();
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
				case EVENT_CAUSE_INSANITY:
					if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 1, 0.0f, true))
						DoCast(target, SPELL_CAUSE_INSANITY);
					events.ScheduleEvent(EVENT_CAUSE_INSANITY, urand(19000, 22000));
					break;
				case EVENT_CURSE_OF_TONGUES:
					if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 0.0f, true))
						DoCast(target, SPELL_CURSE_OF_TONGUES);
					events.ScheduleEvent(EVENT_CURSE_OF_TONGUES, urand(12000, 15000));
					break;
				case EVENT_LASH:
					DoCastVictim(SPELL_LASH);
					events.ScheduleEvent(EVENT_LASH, urand(8000, 12000));
					break;
				default:
					break;
				}
			}

			DoMeleeAttackIfReady();
		}
	};
};

class npc_jammalan_the_prophet : public CreatureScript
{
public:
	npc_jammalan_the_prophet() : CreatureScript("npc_jammalan_the_prophet") { }

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_jammalan_the_prophet_AI(creature);
	}

	struct npc_jammalan_the_prophet_AI : public ScriptedAI
	{
		npc_jammalan_the_prophet_AI(Creature* creature) : ScriptedAI(creature) { }

		void Reset()
		{
			events.Reset();
		}

		void EnterCombat(Unit* who)
		{
			events.ScheduleEvent(EVENT_HEALING_WAVE, urand(6000, 12000));
			events.ScheduleEvent(EVENT_FLAMESTRIKE, urand(7000, 10000));
			events.ScheduleEvent(EVENT_EARTHGRAB_TOTEM, urand(3000, 8000));
			events.ScheduleEvent(EVENT_HEX_OF_JAMMALAN, urand(10000, 12000));
		}

		void JustDied(Unit* who)
		{
			events.Reset();
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
				case EVENT_HEALING_WAVE:
					if (Unit* target = DoSelectLowestHpFriendly(20.0f))
						DoCast(target, SPELL_HEALING_WAVE);
					events.ScheduleEvent(EVENT_HEALING_WAVE, urand(8000, 10000));
					break;
				case EVENT_FLAMESTRIKE:
					if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 0.0f, true))
						DoCast(target, SPELL_FLAMESTRIKE);
					events.ScheduleEvent(EVENT_FLAMESTRIKE, urand(12000, 17000));
					break;
				case EVENT_EARTHGRAB_TOTEM:
					DoCast(me, SPELL_EARTHGRAB_TOTEM);
					events.ScheduleEvent(EVENT_EARTHGRAB_TOTEM, urand(25000, 30000));
					break;
				case EVENT_HEX_OF_JAMMALAN:
					if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 1, 0.0f, true))
						DoCast(target, SPELL_HEX_OF_JAMMALAN);
					events.ScheduleEvent(EVENT_HEX_OF_JAMMALAN, urand(15000, 20000));
					break;
				default:
					break;
				}
			}

			DoMeleeAttackIfReady();
		}
	};
};

class npc_jammalan_the_prophet_earthgrab_totem : public CreatureScript
{
public:
	npc_jammalan_the_prophet_earthgrab_totem() : CreatureScript("npc_jammalan_the_prophet_earthgrab_totem") { }

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_jammalan_the_prophet_earthgrab_totem_AI(creature);
	}

	struct npc_jammalan_the_prophet_earthgrab_totem_AI : public Scripted_NoMovementAI
	{
		npc_jammalan_the_prophet_earthgrab_totem_AI(Creature* creature) : Scripted_NoMovementAI(creature) { }

		void IsSummonedBy(Unit* owner) override
		{
			me->AddAura(SPELL_EARTHGRAB_TOTEM_AURA, me);
		}

		void UpdateAI(uint32 const diff)
		{
		}
	};
};

class npc_ogom_the_wretched : public CreatureScript
{
public:
	npc_ogom_the_wretched() : CreatureScript("npc_ogom_the_wretched") { }

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_ogom_the_wretched_AI(creature);
	}

	struct npc_ogom_the_wretched_AI : public ScriptedAI
	{
		npc_ogom_the_wretched_AI(Creature* creature) : ScriptedAI(creature) { }

		void Reset()
		{
			events.Reset();
		}

		void EnterCombat(Unit* who)
		{
			events.ScheduleEvent(EVENT_CURSE_OF_WEAKNESS, urand(4000, 8000));
			events.ScheduleEvent(EVENT_SHADOW_BOLT, 1000);
			events.ScheduleEvent(EVENT_SHADOW_WORD_PAIN, urand(3000, 7000));
		}

		void JustDied(Unit* who)
		{
			events.Reset();
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
				case EVENT_SHADOW_BOLT:
					DoCastVictim(SPELL_SHADOW_BOLT);
					events.ScheduleEvent(EVENT_SHADOW_BOLT, 3000);
					break;
				case EVENT_CURSE_OF_WEAKNESS:
					if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 0.0f, true))
						DoCast(target, SPELL_CURSE_OF_WEAKNESS);
					events.ScheduleEvent(EVENT_CURSE_OF_WEAKNESS, urand(10000, 15000));
					break;
				case EVENT_SHADOW_WORD_PAIN:
					if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 0.0f, true))
						DoCast(target, SPELL_SHADOW_WORD_PAIN);
					events.ScheduleEvent(EVENT_SHADOW_WORD_PAIN, urand(8000, 15000));
					break;
				default:
					break;
				}
			}

			DoMeleeAttackIfReady();
		}
	};
};

class npc_shade_of_eranikus : public CreatureScript
{
public:
	npc_shade_of_eranikus() : CreatureScript("npc_shade_of_eranikus") { }

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_shade_of_eranikus_AI(creature);
	}

	struct npc_shade_of_eranikus_AI : public ScriptedAI
	{
		npc_shade_of_eranikus_AI(Creature* creature) : ScriptedAI(creature) { }

		void Reset()
		{
			events.Reset();
		}

		void EnterCombat(Unit* who)
		{
			events.ScheduleEvent(EVENT_ACID_BREATH, urand(5000, 10000));
			events.ScheduleEvent(EVENT_WAR_STOMP, urand(8000, 12000));
			events.ScheduleEvent(EVENT_DEEP_SLUMBER, urand(5000, 9000));
			events.ScheduleEvent(EVENT_THRASH, urand(2000, 10000));
		}

		void JustDied(Unit* who)
		{
			events.Reset();
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
				case EVENT_DEEP_SLUMBER:
					if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 1, 0.0f, true))
						DoCast(target, SPELL_DEEP_SLUMBER);
					events.ScheduleEvent(EVENT_DEEP_SLUMBER, urand(10000, 15000));
					break;
				case EVENT_ACID_BREATH:
					DoCastVictim(SPELL_ACID_BREATH);
					events.ScheduleEvent(EVENT_ACID_BREATH, urand(8000, 12000));
					break;
				case EVENT_THRASH:
					DoCast(me, SPELL_THRASH);
					events.ScheduleEvent(EVENT_THRASH, urand(10000, 15000));
					break;
				case EVENT_WAR_STOMP:
					DoCastAOE(SPELL_WAR_STOMP);
					events.ScheduleEvent(EVENT_WAR_STOMP, urand(15000, 20000));
					break;
				default:
					break;
				}
			}

			DoMeleeAttackIfReady();
		}
	};
};

void AddSC_sunken_temple()
{
	new npc_warden_of_the_dream();
	new npc_avatar_of_hakkar();
	new npc_jammalan_the_prophet();
	new npc_ogom_the_wretched();
	new npc_jammalan_the_prophet_earthgrab_totem();
	new npc_shade_of_eranikus();
}
