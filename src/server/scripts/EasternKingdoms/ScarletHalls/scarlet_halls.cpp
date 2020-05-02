#include "ScriptPCH.h"
#include "scarlet_halls.h"
#include "SpellAuraEffects.h"

enum ScriptedTexts
{
	SAY_COMMANDER_LINDON_AGGRO = 0,
	SOUND_COMMANDER_LINDON_DEATH = 28161,
	SAY_COMMANDER_LINDON_KILL = 2,
};

enum Spells
{
	// Starving Hound
	SPELL_HUNGRY_DOG = 111582,
	SPELL_HUNGRY_DOG_DMG = 111589,

	// Scarlet Myrmidon
	SPELL_BERSERKER_RAGE = 128231,
	SPELL_WHIRLWIND = 84147,

	// Scarlet Scourge Hewer
	SPELL_HOLY_INQUISITION = 111341,
	SPELL_SEAL_OF_BLOOD = 111351,

	// Scarlet Evangelist
	SPELL_FANATICISM = 111376,
	SPELL_HOLY_FIRE = 128232, // 17140 ?
	SPELL_HOLY_SMITE = 128233, // 9734 ?
	SPELL_SURRENDER_HEALTH = 111398,

	// Scarlet Defender
	SPELL_COMMANDING_SHOUT = 80983,
	SPELL_SHIELD_BARRIER = 111324,
	SPELL_DISARM = 6713,

	// Scarlet Evoker
	SPELL_FIREBALL = 128249,
	SPELL_FLAMESTRIKE = 111667,
	SPELL_CAUTERIZE_THE_WOUND = 111601,
	SPELL_CAUTERIZE_THE_WOUND_DMG = 111632,

	// Scarlet Treasurer
	SPELL_TOSS_STATUE = 114022,

	// Scarlet Hall Guardian
	SPELL_SLASH_ARMOR = 114011,
	SPELL_JOLT = 114000,

	// Scarlet Pupil
	SPELL_BEATDOWN = 114184,

	// Scarlet Scholar
	SPELL_FIREBALL_2 = 114183,
	SPELL_FIREBALL_VOLLEY = 114182,
	SPELL_SCARLET_PROTECTION = 114185,
	SPELL_SCARLET_PROTECTION_AURA = 114219,

};

enum Actions
{
	ACTION_COMMANDER_LINDON_START = 1,
};

class npc_scarlet_halls_vigilant_watchman : public CreatureScript
{
public:
	npc_scarlet_halls_vigilant_watchman() : CreatureScript("npc_scarlet_halls_vigilant_watchman") {}

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_scarlet_halls_vigilant_watchmanAI(creature);
	}

	struct npc_scarlet_halls_vigilant_watchmanAI : public ScriptedAI
	{
		npc_scarlet_halls_vigilant_watchmanAI(Creature* creature) : ScriptedAI(creature)
		{
		}

	private:

	};
};

class npc_scarlet_halls_starving_hound : public CreatureScript
{
	enum LocalEvents
	{
		EVENT_HUNGRY_DOG = 1,
	};

	enum LocalTimers
	{
		TIMER_HUNGRY_DOG_FIRST_MIN = 3 * IN_MILLISECONDS,
		TIMER_HUNGRY_DOG_FIRST_MAX = 20 * IN_MILLISECONDS,
		TIMER_HUNGRY_DOG = 40 * IN_MILLISECONDS,
	};

public:
	npc_scarlet_halls_starving_hound() : CreatureScript("npc_scarlet_halls_starving_hound") {}

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_scarlet_halls_starving_houndAI(creature);
	}

	struct npc_scarlet_halls_starving_houndAI : public ScriptedAI
	{
		npc_scarlet_halls_starving_houndAI(Creature* creature) : ScriptedAI(creature)
		{

		}

		void Reset() override
		{
			events.Reset();
		}

		void EnterCombat(Unit* who) override
		{
			events.ScheduleEvent(EVENT_HUNGRY_DOG, urand(TIMER_HUNGRY_DOG_FIRST_MIN, TIMER_HUNGRY_DOG_FIRST_MAX));
		}

		void JustDied(Unit* who) override
		{
			events.Reset();
		}

		void UpdateAI(const uint32 diff)
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

		void ExecuteEvent(const uint32 eventId)
		{
			switch (eventId)
			{
			case EVENT_HUNGRY_DOG:
				DoHungryDog();
				events.ScheduleEvent(EVENT_HUNGRY_DOG, TIMER_HUNGRY_DOG);
				break;
			}
		}

		void DoHungryDog()
		{
			DoCastVictim(SPELL_HUNGRY_DOG);
		}
	};
};

class npc_scarlet_halls_angry_hound : public CreatureScript
{
public:
	npc_scarlet_halls_angry_hound() : CreatureScript("npc_scarlet_halls_angry_hound") {}

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_scarlet_halls_angry_houndAI(creature);
	}

	struct npc_scarlet_halls_angry_houndAI : public ScriptedAI
	{
		npc_scarlet_halls_angry_houndAI(Creature* creature) : ScriptedAI(creature)
		{
			me->SetReactState(REACT_DEFENSIVE);
		}

	private:

	};
};

class npc_scarlet_halls_commander_lindon : public CreatureScript
{
public:
	npc_scarlet_halls_commander_lindon() : CreatureScript("npc_scarlet_halls_commander_lindon") {}

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_scarlet_halls_commander_lindonAI(creature);
	}

	struct npc_scarlet_halls_commander_lindonAI : public ScriptedAI
	{
		npc_scarlet_halls_commander_lindonAI(Creature* creature) : ScriptedAI(creature),
			m_IsActivated(false)
		{
		}

		void DoAction(const int32 action) override
		{
			if (action == ACTION_COMMANDER_LINDON_START)
			{
				Activate();
			}
		}

		void KilledUnit(Unit* victim) override
		{
			if (victim && victim->IsPlayer())
			{
				Talk(SAY_COMMANDER_LINDON_KILL);
			}
		}

		void JustDied(Unit* who) override
		{
			DoPlaySoundToSet(who, SOUND_COMMANDER_LINDON_DEATH);
		}

	private:

		void Activate()
		{
			if (!me->isAlive())
				return;

			if (m_IsActivated)
				return;

			m_IsActivated = true;

			Talk(SAY_COMMANDER_LINDON_AGGRO);
		}

		bool m_IsActivated;

	};
};

class npc_scarlet_halls_scarlet_myrmidon : public CreatureScript
{
	enum LocalEvents
	{
		EVENT_COMMANDING_SHOUT = 1,
		EVENT_SHIELD_BARRIER,
		EVENT_DISARM,
	};

	enum LocalTimers
	{
		TIMER_COMMANDING_SHOUT = 1 * IN_MILLISECONDS,
		TIMER_SHIELD_BARRIER_MIN = 5 * IN_MILLISECONDS,
		TIMER_SHIELD_BARRIER_MAX = 15 * IN_MILLISECONDS,
		TIMER_DISARM_FIRST = 7 * IN_MILLISECONDS,
		TIMER_DISARM = 20 * IN_MILLISECONDS,
	};

public:
	npc_scarlet_halls_scarlet_myrmidon() : CreatureScript("npc_scarlet_halls_scarlet_myrmidon") {}

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_scarlet_halls_scarlet_myrmidonAI(creature);
	}

	struct npc_scarlet_halls_scarlet_myrmidonAI : public ScriptedAI
	{
		npc_scarlet_halls_scarlet_myrmidonAI(Creature* creature) : ScriptedAI(creature)
		{

		}

		void Reset() override
		{
			events.Reset();
		}

		void EnterCombat(Unit* who) override
		{
			events.ScheduleEvent(EVENT_COMMANDING_SHOUT, TIMER_COMMANDING_SHOUT);
			events.ScheduleEvent(EVENT_SHIELD_BARRIER, urand(TIMER_SHIELD_BARRIER_MIN, TIMER_SHIELD_BARRIER_MAX));
			events.ScheduleEvent(EVENT_DISARM, TIMER_DISARM_FIRST);
		}

		void JustDied(Unit* who) override
		{
			events.Reset();
		}

		void UpdateAI(const uint32 diff)
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

		void ExecuteEvent(const uint32 eventId)
		{
			switch (eventId)
			{
			case EVENT_COMMANDING_SHOUT:
				DoCommandingShout();
				break;
			case EVENT_SHIELD_BARRIER:
				DoShieldBarrier();
				break;
			case EVENT_DISARM:
				DoDisarm();
				events.ScheduleEvent(EVENT_DISARM, TIMER_DISARM);
				break;
			}
		}

		void DoCommandingShout()
		{
			DoCastAOE(SPELL_COMMANDING_SHOUT);
		}

		void DoShieldBarrier()
		{
			DoCast(me, SPELL_SHIELD_BARRIER);
		}

		void DoDisarm()
		{
			DoCastVictim(SPELL_DISARM);
		}

	private:

	};
};

class npc_scarlet_halls_scarlet_scourge_hewer : public CreatureScript
{
	enum LocalEvents
	{
		EVENT_HOLY_INQUISITION = 1,
		EVENT_SEAL_OF_BLOOD,
	};

	enum LocalTimers
	{
		TIMER_SEAL_OF_BLOOD = 1 * IN_MILLISECONDS,
		TIMER_HOLY_INQUISITION_FIRST = 5 * IN_MILLISECONDS,
		TIMER_HOLY_INQUISITION = 30 * IN_MILLISECONDS,
	};

public:
	npc_scarlet_halls_scarlet_scourge_hewer() : CreatureScript("npc_scarlet_halls_scarlet_scourge_hewer") {}

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_scarlet_halls_scarlet_scourge_hewerAI(creature);
	}

	struct npc_scarlet_halls_scarlet_scourge_hewerAI : public ScriptedAI
	{
		npc_scarlet_halls_scarlet_scourge_hewerAI(Creature* creature) : ScriptedAI(creature)
		{

		}

		void Reset() override
		{
			events.Reset();
		}

		void EnterCombat(Unit* who) override
		{
			events.ScheduleEvent(EVENT_SEAL_OF_BLOOD, TIMER_SEAL_OF_BLOOD);
			events.ScheduleEvent(EVENT_HOLY_INQUISITION, TIMER_HOLY_INQUISITION_FIRST);
		}

		void JustDied(Unit* who) override
		{
			events.Reset();
		}

		void UpdateAI(const uint32 diff)
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

		void ExecuteEvent(const uint32 eventId)
		{
			switch (eventId)
			{
			case EVENT_SEAL_OF_BLOOD:
				DoSealOfBlood();
				break;
			case EVENT_HOLY_INQUISITION:
				DoHolyInquisition();
				events.ScheduleEvent(EVENT_HOLY_INQUISITION, TIMER_HOLY_INQUISITION);
				break;
			}
		}

		void DoSealOfBlood()
		{
			DoCastAOE(SPELL_SEAL_OF_BLOOD);
		}

		void DoHolyInquisition()
		{
			DoCast(me, SPELL_HOLY_INQUISITION);
		}

	private:

	};
};

class npc_scarlet_halls_scarlet_evangelist : public CreatureScript
{
	enum LocalEvents
	{
		EVENT_FANATICISM = 1,
		EVENT_HOLY_FIRE,
		EVENT_HOLY_SMITE,
		EVENT_SURRENDER_HEALTH,
	};

	enum LocalTimers
	{
		TIMER_FANATICISM_FIRST = 8 * IN_MILLISECONDS,
		TIMER_FANATICISM = 30 * IN_MILLISECONDS,
		TIMER_HOLY_FIRE_FIRST = 10 * IN_MILLISECONDS,
		TIMER_HOLY_FIRE = 20 * IN_MILLISECONDS,
		TIMER_HOLY_SMITE = 2500,
		TIMER_SURRENDER_HEALTH_FIRST = 20 * IN_MILLISECONDS,
		TIMER_SURRENDER_HEALTH = 30 * IN_MILLISECONDS,
	};

public:
	npc_scarlet_halls_scarlet_evangelist() : CreatureScript("npc_scarlet_halls_scarlet_evangelist") {}

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_scarlet_halls_scarlet_evangelistAI(creature);
	}

	struct npc_scarlet_halls_scarlet_evangelistAI : public ScriptedAI
	{
		npc_scarlet_halls_scarlet_evangelistAI(Creature* creature) : ScriptedAI(creature)
		{

		}

		void Reset() override
		{
			events.Reset();
		}

		void EnterCombat(Unit* who) override
		{
			events.ScheduleEvent(EVENT_HOLY_SMITE, TIMER_HOLY_SMITE);
			events.ScheduleEvent(EVENT_HOLY_FIRE, TIMER_HOLY_FIRE_FIRST);
			events.ScheduleEvent(EVENT_FANATICISM, TIMER_FANATICISM_FIRST);
			events.ScheduleEvent(EVENT_SURRENDER_HEALTH, TIMER_SURRENDER_HEALTH_FIRST);
		}

		void JustDied(Unit* who) override
		{
			events.Reset();
		}

		void UpdateAI(const uint32 diff)
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

		void ExecuteEvent(const uint32 eventId)
		{
			switch (eventId)
			{
			case EVENT_HOLY_SMITE:
				DoHolySmite();
				events.ScheduleEvent(EVENT_HOLY_SMITE, TIMER_HOLY_SMITE);
				break;
			case EVENT_HOLY_FIRE:
				DoHolyFire();
				events.ScheduleEvent(EVENT_HOLY_FIRE, TIMER_HOLY_FIRE);
				break;
			case EVENT_FANATICISM:
				DoFanaticism();
				events.ScheduleEvent(EVENT_FANATICISM, TIMER_FANATICISM);
				break;
			case EVENT_SURRENDER_HEALTH:
				DoSurrenderHealth();
				events.ScheduleEvent(EVENT_SURRENDER_HEALTH, TIMER_SURRENDER_HEALTH);
				break;
			}
		}

		void DoHolySmite()
		{
			DoCastVictim(SPELL_HOLY_SMITE);
		}

		void DoHolyFire()
		{
			DoCastVictim(SPELL_HOLY_FIRE);
		}

		void DoFanaticism()
		{
			DoCast(me, SPELL_FANATICISM);
		}

		void DoSurrenderHealth()
		{
			if (Unit* target = me->SelectNearbyAlly(me, 30.0f, true))
				DoCast(target, SPELL_SURRENDER_HEALTH);
		}

	private:

	};
};

class npc_scarlet_halls_scarlet_cannoneer : public CreatureScript
{
public:
	npc_scarlet_halls_scarlet_cannoneer() : CreatureScript("npc_scarlet_halls_scarlet_cannoneer") {}

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_scarlet_halls_scarlet_cannoneerAI(creature);
	}

	struct npc_scarlet_halls_scarlet_cannoneerAI : public ScriptedAI
	{
		npc_scarlet_halls_scarlet_cannoneerAI(Creature* creature) : ScriptedAI(creature)
		{
			me->SetReactState(REACT_DEFENSIVE);
		}

	};
};

class npc_scarlet_halls_scarlet_defender : public CreatureScript
{
	enum LocalEvents
	{
		EVENT_COMMANDING_SHOUT = 1,
		EVENT_SHIELD_BARRIER,
		EVENT_DISARM,
	};

	enum LocalTimers
	{
		TIMER_COMMANDING_SHOUT = 1 * IN_MILLISECONDS,
		TIMER_SHIELD_BARRIER_MIN = 5 * IN_MILLISECONDS,
		TIMER_SHIELD_BARRIER_MAX = 15 * IN_MILLISECONDS,
		TIMER_DISARM_FIRST = 7 * IN_MILLISECONDS,
		TIMER_DISARM = 20 * IN_MILLISECONDS,
	};

public:
	npc_scarlet_halls_scarlet_defender() : CreatureScript("npc_scarlet_halls_scarlet_defender") {}

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_scarlet_halls_scarlet_defenderAI(creature);
	}

	struct npc_scarlet_halls_scarlet_defenderAI : public ScriptedAI
	{
		npc_scarlet_halls_scarlet_defenderAI(Creature* creature) : ScriptedAI(creature)
		{

		}

		void Reset() override
		{
			events.Reset();
		}

		void EnterCombat(Unit* who) override
		{
			events.ScheduleEvent(EVENT_COMMANDING_SHOUT, TIMER_COMMANDING_SHOUT);
			events.ScheduleEvent(EVENT_SHIELD_BARRIER, urand(TIMER_SHIELD_BARRIER_MIN, TIMER_SHIELD_BARRIER_MAX));
			events.ScheduleEvent(EVENT_DISARM, TIMER_DISARM_FIRST);
		}

		void JustDied(Unit* who) override
		{
			events.Reset();
		}

		void UpdateAI(const uint32 diff)
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

		void ExecuteEvent(const uint32 eventId)
		{
			switch (eventId)
			{
			case EVENT_COMMANDING_SHOUT:
				DoCommandingShout();
				break;
			case EVENT_SHIELD_BARRIER:
				DoShieldBarrier();
				break;
			case EVENT_DISARM:
				DoDisarm();
				events.ScheduleEvent(EVENT_DISARM, TIMER_DISARM);
				break;
			}
		}

		void DoCommandingShout()
		{
			DoCastAOE(SPELL_COMMANDING_SHOUT);
		}

		void DoShieldBarrier()
		{
			DoCast(me, SPELL_SHIELD_BARRIER);
		}

		void DoDisarm()
		{
			DoCastVictim(SPELL_DISARM);
		}

	private:

	};
};

class npc_scarlet_halls_scarlet_evoker : public CreatureScript
{
	enum LocalEvents
	{
		EVENT_FIREBALL = 1,
		EVENT_FLAMESTRIKE,
		EVENT_CAUTERIZE_THE_WOUND,
	};

	enum LocalTimers
	{
		TIMER_FIREBALL_FIRST = 1 * IN_MILLISECONDS,
		TIMER_FIREBALL = 3 * IN_MILLISECONDS,
		TIMER_FLAMESTRIKE_FIRST = 7 * IN_MILLISECONDS,
		TIMER_FLAMESTRIKE = 15 * IN_MILLISECONDS,
		TIMER_CAUTERIZE_THE_WOUND = 20 * IN_MILLISECONDS,
	};

public:
	npc_scarlet_halls_scarlet_evoker() : CreatureScript("npc_scarlet_halls_scarlet_evoker") {}

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_scarlet_halls_scarlet_evokerAI(creature);
	}

	struct npc_scarlet_halls_scarlet_evokerAI : public ScriptedAI
	{
		npc_scarlet_halls_scarlet_evokerAI(Creature* creature) : ScriptedAI(creature)
		{

		}

		void Reset() override
		{
			events.Reset();
		}

		void EnterCombat(Unit* who) override
		{
			events.ScheduleEvent(EVENT_FIREBALL, TIMER_FIREBALL_FIRST);
			events.ScheduleEvent(EVENT_FLAMESTRIKE, TIMER_FLAMESTRIKE_FIRST);
			events.ScheduleEvent(EVENT_CAUTERIZE_THE_WOUND, TIMER_CAUTERIZE_THE_WOUND);
		}

		void JustDied(Unit* who) override
		{
			events.Reset();
		}

		void UpdateAI(const uint32 diff)
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

		void ExecuteEvent(const uint32 eventId)
		{
			switch (eventId)
			{
			case EVENT_FIREBALL:
				DoFireBall();
				events.ScheduleEvent(EVENT_FIREBALL, TIMER_FIREBALL);
				break;
			case EVENT_FLAMESTRIKE:
				DoFlameStrike();
				events.ScheduleEvent(EVENT_FLAMESTRIKE, TIMER_FLAMESTRIKE);
				break;
			case EVENT_CAUTERIZE_THE_WOUND:
				DoCauterizeTheWound();
				events.ScheduleEvent(EVENT_CAUTERIZE_THE_WOUND, TIMER_CAUTERIZE_THE_WOUND);
				break;
			}
		}

		void DoFireBall()
		{
			DoCastVictim(SPELL_FIREBALL);
		}

		void DoFlameStrike()
		{
			DoCastVictim(SPELL_FLAMESTRIKE);
		}

		void DoCauterizeTheWound()
		{
			if (Unit* target = me->SelectNearbyAlly(me, 30.0f, true))
				DoCast(target, SPELL_CAUTERIZE_THE_WOUND);
		}

	private:

	};
};

class npc_scarlet_halls_scarlet_treasurer : public CreatureScript
{
	enum LocalEvents
	{
		EVENT_TOSS_STATUE = 1,
	};

	enum LocalTimers
	{
		TIMER_TOSS_STATUE_FIRST = 5 * IN_MILLISECONDS,
		TIMER_TOSS_STATUE = 15 * IN_MILLISECONDS,
	};

public:
	npc_scarlet_halls_scarlet_treasurer() : CreatureScript("npc_scarlet_halls_scarlet_treasurer") {}

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_scarlet_halls_scarlet_treasurerAI(creature);
	}

	struct npc_scarlet_halls_scarlet_treasurerAI : public ScriptedAI
	{
		npc_scarlet_halls_scarlet_treasurerAI(Creature* creature) : ScriptedAI(creature)
		{

		}

		void Reset() override
		{
			events.Reset();
		}

		void EnterCombat(Unit* who) override
		{
			events.ScheduleEvent(EVENT_TOSS_STATUE, TIMER_TOSS_STATUE_FIRST);
		}

		void JustDied(Unit* who) override
		{
			events.Reset();
		}

		void UpdateAI(const uint32 diff)
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

		void ExecuteEvent(const uint32 eventId)
		{
			switch (eventId)
			{
			case EVENT_TOSS_STATUE:
				DoTossStatue();
				events.ScheduleEvent(EVENT_TOSS_STATUE, TIMER_TOSS_STATUE);
				break;
			}
		}

		void DoTossStatue()
		{
			if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 0.0f, true))
			{
				DoCast(target, SPELL_TOSS_STATUE);
			}
		}

	private:

	};
};

class npc_scarlet_halls_scarlet_hall_guardian : public CreatureScript
{
	enum LocalEvents
	{
		EVENT_SLASH_ARMOR = 1,
		EVENT_JOLT,
	};

	enum LocalTimers
	{
		TIMER_SLASH_ARMOR_FIRST = 5 * IN_MILLISECONDS,
		TIMER_SLASH_ARMOR = 8 * IN_MILLISECONDS,
		TIMER_JOLT_FIRST = 8 * IN_MILLISECONDS,
		TIMER_JOLT = 10 * IN_MILLISECONDS,
	};

public:
	npc_scarlet_halls_scarlet_hall_guardian() : CreatureScript("npc_scarlet_halls_scarlet_hall_guardian") {}

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_scarlet_halls_scarlet_hall_guardianAI(creature);
	}

	struct npc_scarlet_halls_scarlet_hall_guardianAI : public ScriptedAI
	{
		npc_scarlet_halls_scarlet_hall_guardianAI(Creature* creature) : ScriptedAI(creature)
		{

		}

		void Reset() override
		{
			events.Reset();
		}

		void EnterCombat(Unit* who) override
		{
			events.ScheduleEvent(EVENT_SLASH_ARMOR, TIMER_SLASH_ARMOR_FIRST);
			events.ScheduleEvent(EVENT_JOLT, TIMER_JOLT_FIRST);
		}

		void JustDied(Unit* who) override
		{
			events.Reset();
		}

		void UpdateAI(const uint32 diff)
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

		void ExecuteEvent(const uint32 eventId)
		{
			switch (eventId)
			{
			case EVENT_SLASH_ARMOR:
				DoSlashArmor();
				events.ScheduleEvent(EVENT_SLASH_ARMOR, TIMER_SLASH_ARMOR);
				break;
			case EVENT_JOLT:
				DoJolt();
				events.ScheduleEvent(EVENT_JOLT, TIMER_JOLT);
				break;
			}
		}

		void DoSlashArmor()
		{
			DoCastVictim(SPELL_SLASH_ARMOR);
		}

		void DoJolt()
		{
			if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 0.0f, true))
			{
				DoCast(target, SPELL_JOLT);
			}
		}

	private:

	};
};

class npc_scarlet_halls_scarlet_pupil : public CreatureScript
{
	enum LocalEvents
	{
		EVENT_BEATDOWN = 1,
	};

	enum LocalTimers
	{
		TIMER_BEATDOWN = 5 * IN_MILLISECONDS,
	};

public:
	npc_scarlet_halls_scarlet_pupil() : CreatureScript("npc_scarlet_halls_scarlet_pupil") {}

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_scarlet_halls_scarlet_pupilAI(creature);
	}

	struct npc_scarlet_halls_scarlet_pupilAI : public ScriptedAI
	{
		npc_scarlet_halls_scarlet_pupilAI(Creature* creature) : ScriptedAI(creature)
		{

		}

		void Reset() override
		{
			events.Reset();
		}

		void EnterCombat(Unit* who) override
		{
			events.ScheduleEvent(EVENT_BEATDOWN, TIMER_BEATDOWN);
		}

		void JustDied(Unit* who) override
		{
			events.Reset();
		}

		void UpdateAI(const uint32 diff)
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

		void ExecuteEvent(const uint32 eventId)
		{
			switch (eventId)
			{
			case EVENT_BEATDOWN:
				DoBeatDown();
				events.ScheduleEvent(EVENT_BEATDOWN, TIMER_BEATDOWN);
				break;
			}
		}

		void DoBeatDown()
		{
			DoCastVictim(SPELL_BEATDOWN);
		}

	private:

	};
};

class npc_scarlet_halls_scarlet_scholar : public CreatureScript
{
	enum LocalEvents
	{
		EVENT_FIREBALL = 1,
		EVENT_FIREBALL_VOLLEY,
		EVENT_SCARLET_PROTECTION,
	};

	enum LocalTimers
	{
		TIMER_FIREBALL_FIRST = 1 * IN_MILLISECONDS,
		TIMER_FIREBALL = 2500,
		TIMER_FIREBALL_VOLLEY_FIRST = 9 * IN_MILLISECONDS,
		TIMER_FIREBALL_VOLLEY = 20 * IN_MILLISECONDS,
		TIMER_SCARLET_PROTECTION_FIRST = 15 * IN_MILLISECONDS,
		TIMER_SCARLET_PROTECTION = 60 * IN_MILLISECONDS,
	};

public:
	npc_scarlet_halls_scarlet_scholar() : CreatureScript("npc_scarlet_halls_scarlet_scholar") {}

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_scarlet_halls_scarlet_scholarAI(creature);
	}

	struct npc_scarlet_halls_scarlet_scholarAI : public ScriptedAI
	{
		npc_scarlet_halls_scarlet_scholarAI(Creature* creature) : ScriptedAI(creature)
		{

		}

		void Reset() override
		{
			events.Reset();
		}

		void EnterCombat(Unit* who) override
		{
			events.ScheduleEvent(EVENT_FIREBALL, TIMER_FIREBALL_FIRST);
			events.ScheduleEvent(EVENT_FIREBALL_VOLLEY, TIMER_FIREBALL_VOLLEY_FIRST);
			events.ScheduleEvent(EVENT_SCARLET_PROTECTION, TIMER_SCARLET_PROTECTION_FIRST);
		}

		void JustDied(Unit* who) override
		{
			events.Reset();
		}

		void UpdateAI(const uint32 diff)
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

		void ExecuteEvent(const uint32 eventId)
		{
			switch (eventId)
			{
			case EVENT_FIREBALL:
				DoFireBall();
				events.ScheduleEvent(EVENT_FIREBALL, TIMER_FIREBALL);
				break;
			case EVENT_FIREBALL_VOLLEY:
				DoFireBallVolley();
				events.ScheduleEvent(EVENT_FIREBALL_VOLLEY, TIMER_FIREBALL_VOLLEY);
				break;
			case EVENT_SCARLET_PROTECTION:
				DoScarletProtection();
				events.ScheduleEvent(EVENT_SCARLET_PROTECTION, TIMER_SCARLET_PROTECTION);
				break;
			}
		}

		void DoFireBall()
		{
			DoCastVictim(SPELL_FIREBALL_2);
		}

		void DoFireBallVolley()
		{
			DoCastAOE(SPELL_FIREBALL_VOLLEY);
		}

		void DoScarletProtection()
		{
			DoCast(me, SPELL_SCARLET_PROTECTION);
		}

	private:

	};
};

class spell_scarlet_halls_cauterize_the_wound : public SpellScriptLoader
{
public:
	spell_scarlet_halls_cauterize_the_wound() : SpellScriptLoader("spell_scarlet_halls_cauterize_the_wound") { }

	class spell_scarlet_halls_cauterize_the_wound_SpellScript : public SpellScript
	{
		PrepareSpellScript(spell_scarlet_halls_cauterize_the_wound_SpellScript);

		void HandleBeforeHit()
		{
			if (!GetCaster() || !GetHitUnit())
				return;

			Unit::AuraEffectList auras = GetHitUnit()->GetAuraEffectsByMechanic(MECHANIC_BLEED);
			if (auras.empty())
				return;

			int32 bleedAmount = 0;
			for (Unit::AuraEffectList::const_iterator itrAura = auras.begin(); itrAura != auras.end(); ++itrAura)
			{
				bleedAmount += ((*itrAura)->GetAmount());
			}

			if (bleedAmount > 0)
			{
				GetCaster()->CastCustomSpell(GetHitUnit(), SPELL_CAUTERIZE_THE_WOUND_DMG, &bleedAmount, NULL, NULL, true);
			}
		}

		void Register()
		{
			BeforeHit += SpellHitFn(spell_scarlet_halls_cauterize_the_wound_SpellScript::HandleBeforeHit);
		}
	};

	SpellScript* GetSpellScript() const override
	{
		return new spell_scarlet_halls_cauterize_the_wound_SpellScript();
	}
};

class at_commander_lindon : public AreaTriggerScript
{
public:

	at_commander_lindon()
		: AreaTriggerScript("at_commander_lindon")
	{
	}

	void OnEnter(Player* player, AreaTriggerEntry const* /*trigger*/) override
	{

		if (Creature* pLindon = GetCommanderLindon(player))
		{
			pLindon->AI()->DoAction(ACTION_COMMANDER_LINDON_START);
		}

	}

private:

	Creature* GetCommanderLindon(WorldObject* searcher)
	{
		if (InstanceScript* pInstance = searcher->GetInstanceScript())
		{
			return pInstance->instance->GetCreature(pInstance->GetData64(DATA_COMMANDER_LINDON));
		}

		return NULL;
	}
};

void AddSC_scarlet_halls()
{
	new npc_scarlet_halls_vigilant_watchman();      // 58898
	new npc_scarlet_halls_starving_hound();         // 58876
	new npc_scarlet_halls_angry_hound();            // 58674
	new npc_scarlet_halls_commander_lindon();       // 59191
	new npc_scarlet_halls_scarlet_myrmidon();       // 58683
	new npc_scarlet_halls_scarlet_scourge_hewer();  // 58684
	new npc_scarlet_halls_scarlet_evangelist();     // 58685
	new npc_scarlet_halls_scarlet_cannoneer();      // 59293
	new npc_scarlet_halls_scarlet_defender();       // 58676
	new npc_scarlet_halls_scarlet_evoker();         // 58756
	new npc_scarlet_halls_scarlet_treasurer();      // 59241
	new npc_scarlet_halls_scarlet_hall_guardian();  // 59240
	new npc_scarlet_halls_scarlet_pupil();          // 59373
	new npc_scarlet_halls_scarlet_scholar();        // 59372

	new spell_scarlet_halls_cauterize_the_wound();  // 111601

	new at_commander_lindon();                      // 7532
}