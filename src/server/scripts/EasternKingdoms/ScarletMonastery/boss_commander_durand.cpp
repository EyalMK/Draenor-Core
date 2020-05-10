#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "scarlet_monastery.h"

enum Spells
{
	// Durand
	SPELL_FLASH_OF_STEEL = 115629,
	SPELL_DASHING_STRIKE = 115739,

	// Whitemane
	SPELL_DEEP_SLEEP = 9256,
	SPELL_HOLY_SMITE = 114848,
	SPELL_MASS_RES = 113134,
	SPELL_SHIELD = 127399,
	SPELL_SCARLET_RES = 9232,
	SPELL_HEAL = 12039,
	SPELL_ACHIEVEMENT_SCARLET_MONASTERY = 132022,
};

enum Events
{
	EVENT_FLASH_OF_STEEL = 0,
	EVENT_DASHING_STRIKE,

	// Whitemane
	EVENT_SMITE,
	EVENT_MASS_RES,
	EVENT_SHIELD,
	EVENT_HEAL,
	EVENT_RES_DURAND
};

enum Texts
{
	SAY_INTRO_D = 0, // To think you've come so far, only to perish here. I'll honor you with clean deaths. (27529)
	SAY_AGGRO_D = 1, // My legend begins NOW! (27527)
	SAY_REZ_D = 2, // At your side, milady! (5837)
	SAY_KILLER_D1 = 3, // My blade is peerless! (27530)
	SAY_KILLER_D2 = 4, // Perfect technique! (27531)
	SAY_DEATH_D = 5, // But...my legend! (27528)

	SAY_AGGRO_W = 0, // You shall pay for this treachery! (29616)
	SAY_REZ_W = 1, // Arise, my champion! (5840)
	SAY_KILLER_W = 2, // The light has spoken! (29618)
	SAY_DEATH_W = 3, // Mograine... (29617)
};

Position altarPos = { 756.048f, 605.632f, 14.350f, 6.280777f };


class boss_inquisitor_whitemane : public CreatureScript
{
public:
	boss_inquisitor_whitemane() : CreatureScript("boss_inquisitor_whitemane") { }

	CreatureAI* GetAI(Creature* creature) const
	{
		return new boss_inquisitor_whitemaneAI(creature);
	}

	struct boss_inquisitor_whitemaneAI : public BossAI
	{
		boss_inquisitor_whitemaneAI(Creature* creature) : BossAI(creature, DATA_WHITEMANE) { }

		void Reset()
		{
			_Reset();
			ResScarlet = false;
			me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_NOT_SELECTABLE);
			me->SetReactState(REACT_DEFENSIVE);
		}

		void EnterCombat(Unit* /*who*/)
		{
			_EnterCombat();
			Talk(SAY_AGGRO_W);
			events.ScheduleEvent(EVENT_SMITE, 5000);
			events.ScheduleEvent(EVENT_SHIELD, 8000);
			events.ScheduleEvent(EVENT_HEAL, 12000);
		}

		void JustDied(Unit* /*killer*/)
		{
			_JustDied();

			if (Creature* l_Durand = instance->instance->GetCreature(instance->GetData64(DATA_DURAND)))
				if (l_Durand->isAlive())
					l_Durand->Kill(l_Durand);

			Talk(SAY_DEATH_W);
			instance->DoUpdateAchievementCriteria(ACHIEVEMENT_CRITERIA_TYPE_BE_SPELL_TARGET, Spells::SPELL_ACHIEVEMENT_SCARLET_MONASTERY);
		}

		void DamageTaken(Unit* /*attacker*/, uint32& /*damage*/)
		{
			if (!ResScarlet && !me->IsNonMeleeSpellCasted(false) && HealthBelowPct(40))
			{
				ResScarlet = true;
				DoCastAOE(SPELL_DEEP_SLEEP);
				events.ScheduleEvent(EVENT_MASS_RES, 12000);
				events.ScheduleEvent(EVENT_RES_DURAND, 1000);
			}
		}

		void KilledUnit(Unit* victim)
		{
			if (victim->GetTypeId() == TYPEID_PLAYER)
				Talk(SAY_KILLER_W);
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
				case EVENT_SMITE:
					DoCastVictim(SPELL_HOLY_SMITE);
					events.ScheduleEvent(EVENT_SMITE, urand(8 * IN_MILLISECONDS, 12 * IN_MILLISECONDS));
					break;
				case EVENT_MASS_RES:
					DoCastAOE(SPELL_MASS_RES);
					break;
				case EVENT_SHIELD:
					DoCast(me, SPELL_SHIELD);
					events.ScheduleEvent(EVENT_SHIELD, urand(15 * IN_MILLISECONDS, 25 * IN_MILLISECONDS));
					break;
				case EVENT_HEAL:
					if (Unit* target = DoSelectLowestHpFriendly(40.0f))
					{
						if (roll_chance_i(50))
							DoCast(target, SPELL_HEAL);
						else
							DoCast(me, SPELL_HEAL);
						events.ScheduleEvent(EVENT_HEAL, urand(20 * IN_MILLISECONDS, 25 * IN_MILLISECONDS));
					}
					break;
				case EVENT_RES_DURAND:
					if (Unit* durand = Unit::GetUnit(*me, instance->GetData64(DATA_DURAND)))
					{
						Talk(SAY_REZ_W);
						DoCast(durand, SPELL_SCARLET_RES);
					}
					break;
				default:
					break;
				}
			}
			DoMeleeAttackIfReady();
		}
	private:
		bool ResScarlet;
	};
};

class npc_inquisitor_whitemane_commander_durand : public CreatureScript
{
public:
	npc_inquisitor_whitemane_commander_durand() : CreatureScript("npc_inquisitor_whitemane_commander_durand") { }

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_inquisitor_whitemane_commander_durandAI(creature);
	}

	struct npc_inquisitor_whitemane_commander_durandAI : public BossAI
	{
		npc_inquisitor_whitemane_commander_durandAI(Creature* creature) : BossAI(creature, DATA_DURAND)
		{
			//ApplyAllImmunities(true); -- Need to implement this function from PandaWoW.
			m_FakeDead = false;
			me->SetReactState(REACT_DEFENSIVE);
		}

		bool m_FakeDead;

		void Reset()
		{
			events.Reset();
			me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
			me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
			me->SetStandState(UNIT_STAND_STATE_STAND);
		}

		void EnterCombat(Unit* /*who*/)
		{
			Talk(SAY_AGGRO_D);
			m_FakeDead = false;
			events.ScheduleEvent(EVENT_DASHING_STRIKE, 5000);
			events.ScheduleEvent(EVENT_FLASH_OF_STEEL, 20000);

			instance->SetBossState(DATA_WHITEMANE, IN_PROGRESS);
		}

		void JustDied(Unit* /*killer*/)
		{
			Talk(SAY_DEATH_D);
		}

		void KilledUnit(Unit* victim)
		{
			if (victim->GetTypeId() == TYPEID_PLAYER)
				Talk(RAND(SAY_KILLER_D1, SAY_KILLER_D2));
		}

		void DamageTaken(Unit* /*doneBy*/, uint32 &damage)
		{
			if (damage >= me->GetHealth())
				if (Creature* l_Whitemane = instance->instance->GetCreature(instance->GetData64(DATA_WHITEMANE)))
					if (l_Whitemane->isAlive())
					{
						l_Whitemane->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_NOT_SELECTABLE);
						l_Whitemane->GetMotionMaster()->MovePoint(0, altarPos);

						me->GetMotionMaster()->MovementExpired();
						me->GetMotionMaster()->MoveIdle();

						damage = 0;
						me->SetHealth(1);

						if (me->IsNonMeleeSpellCasted(false))
							me->InterruptNonMeleeSpells(false);

						me->ClearComboPoints();
						me->RemoveAllAuras();
						me->ClearAllReactives();

						me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
						me->SetStandState(UNIT_STAND_STATE_DEAD);

						m_FakeDead = true;
					}
		}

		void SpellHit(Unit* /*who*/, const SpellInfo* spell)
		{
			if (spell->Id == SPELL_SCARLET_RES)
			{
				m_FakeDead = false;
				Resurrected();
			}
		}

		void Resurrected()
		{
			me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
			me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
			me->SetStandState(UNIT_STAND_STATE_STAND);
			Talk(SAY_REZ_D);
		}

		void UpdateAI(uint32 const diff)
		{
			if (!UpdateVictim())
				return;

			if (m_FakeDead)
				return;

			events.Update(diff);

			if (me->HasUnitState(UNIT_STATE_CASTING))
				return;

			if (uint32 eventId = events.ExecuteEvent())
			{
				switch (eventId)
				{
				case EVENT_DASHING_STRIKE:
					DoCast(SPELL_FLASH_OF_STEEL);
					events.ScheduleEvent(EVENT_DASHING_STRIKE, 35000);
					break;
				case EVENT_FLASH_OF_STEEL:
					DoCast(SPELL_FLASH_OF_STEEL);
					events.ScheduleEvent(EVENT_FLASH_OF_STEEL, 20000);
					break;
				default:
					break;
				}
			}
			DoMeleeAttackIfReady();
		}
	};
};

void AddSC_boss_commander_durand()
{
	new boss_inquisitor_whitemane();
	new npc_inquisitor_whitemane_commander_durand();
}