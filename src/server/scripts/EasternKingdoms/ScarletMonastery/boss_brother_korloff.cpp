#include "ScriptPCH.h"
#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "scarlet_monastery.h"

// Firestormcharge should be work better | scorched earth will be done soon

enum Spells
{
    SPELL_BLAZING_FISTS    = 114807,
    SPELL_FIRESTORM_KICK   = 113764,
    SPELL_FIRESTORM_CHARGE = 114487,
    SPELL_RISING_FLAME     = 114435,
    SPELL_SCORCHED_EARTH   = 114460,

    SPELL_SCOR_EARTH_DUMMY = 114463,
    SPELL_FIRE_AURA        = 114464,

    // Debuffs
    SPELL_BURNING_MAN      = 125844,
    SPELL_BURNING_MAN_FIRE = 125852
};

enum Events
{
    EVENT_BLAZING_FISTS = 0,
    EVENT_FIRESTORM_KICK,
    EVENT_RISING_FLAME,
    EVENT_FIRESTORM_CHARGE
};

enum Texts
{
    SAY_AGGRO    = 0,
    SAY_KILLER_1 = 1,
    SAY_KILLER_2 = 2,
    SAY_RESET    = 3,
    SAY_DEATH    = 4
};

class boss_brother_korloff : public CreatureScript
{
    public:
        boss_brother_korloff() : CreatureScript("boss_brother_korloff") { }

        struct boss_brother_korloffAI : public BossAI
        {
            boss_brother_korloffAI(Creature* creature) : BossAI(creature, DATA_KORLOFF) { }

            void Reset()
            {
                _Reset();
                ScorchedEarth = false;
                Talk(SAY_RESET);
                instance->DoRemoveAurasDueToSpellOnPlayers(SPELL_BURNING_MAN);
                instance->DoRemoveAurasDueToSpellOnPlayers(SPELL_BURNING_MAN_FIRE);
            }

            void EnterCombat(Unit* /*who*/)
            {
                _EnterCombat();
                Talk(SAY_AGGRO);
                events.ScheduleEvent(EVENT_FIRESTORM_CHARGE, 10000);
                events.ScheduleEvent(EVENT_BLAZING_FISTS, 25000);
            }

            void JustDied(Unit* /*killer*/)
            {
                _JustDied();
                Talk(SAY_DEATH);
                instance->DoRemoveAurasDueToSpellOnPlayers(SPELL_BURNING_MAN);
                instance->DoRemoveAurasDueToSpellOnPlayers(SPELL_BURNING_MAN_FIRE);
            }

            void KilledUnit(Unit* victim)
            {
                if (victim->GetTypeId() == TYPEID_PLAYER)
                    Talk(RAND(SAY_KILLER_1, SAY_KILLER_2));
            }

            void DamageTaken(Unit* /*attacker*/, uint32& /*damage*/)
            {
                if(!ScorchedEarth && !me->IsNonMeleeSpellCasted(false) && HealthBelowPct(50))
                {
                    ScorchedEarth = true;
                    DoCast(me, SPELL_SCORCHED_EARTH);
                    DoCast(me, SPELL_RISING_FLAME);
                }
            }

            void UpdateAI(uint32 const diff)
            {
                if(!UpdateVictim())
                    return;

                events.Update(diff);

                if(me->HasUnitState(UNIT_STATE_CASTING))
                    return;

                if(uint32 eventId = events.ExecuteEvent())
                {
                    switch(eventId)
                    {
                        case EVENT_FIRESTORM_CHARGE:
                            if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 40.0f, true))
                            {
                                DoCast(target, SPELL_FIRESTORM_CHARGE);
                                events.ScheduleEvent(EVENT_FIRESTORM_KICK, 1500);
                                events.ScheduleEvent(EVENT_FIRESTORM_CHARGE, 30*IN_MILLISECONDS);
                            }
                            break;
                        case EVENT_FIRESTORM_KICK:
                            DoCast(me, SPELL_FIRESTORM_KICK);
                            break;
                        case EVENT_BLAZING_FISTS:
                            DoCastVictim(SPELL_BLAZING_FISTS);
                            events.ScheduleEvent(EVENT_BLAZING_FISTS, 25000);
                            break;
                        default:
                            break;
                    }
                }
                DoMeleeAttackIfReady();
            }
        private:
            bool ScorchedEarth;
        };

        CreatureAI* GetAI(Creature* creature) const
        {
            return new boss_brother_korloffAI(creature);
        }
};

class spell_scorched_earth : public SpellScriptLoader
{
    public:
        spell_scorched_earth() : SpellScriptLoader("spell_scorched_earth") { }

        class spell_scorched_earth_AuraScript : public AuraScript
        {
            PrepareAuraScript(spell_scorched_earth_AuraScript);

            bool Validate(SpellInfo const* /*spell*/)
            {
                if (!sSpellMgr->GetSpellInfo(SPELL_SCORCHED_EARTH))
                    return false;
                return true;
            }

            void HandleTriggerSpell(const AuraEffect* aurEff)
            {
                PreventDefaultAction();
                Unit* caster = GetCaster();
                caster->CastSpell(caster, SPELL_SCOR_EARTH_DUMMY, false);
            }

            void Register()
            {
                OnEffectPeriodic += AuraEffectPeriodicFn(spell_scorched_earth_AuraScript::HandleTriggerSpell, EFFECT_0, SPELL_AURA_PERIODIC_TRIGGER_SPELL);
            }
        };

        AuraScript* GetAuraScript() const
        {
            return new spell_scorched_earth_AuraScript();
        }
};

void AddSC_boss_brother_korloff()
{
    new boss_brother_korloff();
    new spell_scorched_earth();
}