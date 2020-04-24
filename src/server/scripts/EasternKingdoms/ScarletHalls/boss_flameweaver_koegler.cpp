#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "scarlet_halls.h"

enum Spells
{
    SPELL_BOOK_BURNER     = 113364,
    SPELL_BURNING_BOOKS   = 113616, // Aura stay for 30 seconds
    SPELL_FIREBALL_VOLLEY = 113691,
    SPELL_DRAGON_BREATH   = 113641,
    SPELL_PYROBLAST       = 113690,
    SPELL_QUICKENED_MIND  = 113682,
    SPELL_TELEPORT        = 113626
};

enum Talk
{
    SAY_INTRO           = 0, // Everything must burn. None shall know of the Scarlet Crusade's shame!
    SAY_AGGRO           = 1, // You, too, shall be charred to ash!
    SAY_DRAGON_BREATH_1 = 2, // Breath of the Dragon!
    SAY_DRAGON_BREATH_2 = 3, // Purged by fire!
    SAY_KILLER_1        = 4, // Burn, BURN!
    SAY_KILLER_2        = 5, // Die in a fire!
    SAY_DEATH           = 6  //  My fire...has gone out.
};

enum Events
{
    EVENT_BURNING_BOOKS,
    EVENT_TELEPORT,
    EVENT_DRAGON_BREATH,
    EVENT_QUICK_MIND,
    EVENT_FIREBALL,
    EVENT_PYROBLAST,
    EVENT_DRAGON_BREATH_INTRO
};

class boss_flameweaver_koegler : public CreatureScript
{
    public:
        boss_flameweaver_koegler() : CreatureScript("boss_flameweaver_koegler") { }

        struct boss_flameweaver_koeglerAI : public BossAI
        {
            boss_flameweaver_koeglerAI(Creature* creature) : BossAI(creature, DATA_FLAMEWEAVER_KOEGLER) { }

            void Reset()
            {
                _Reset();
                intro = false;
                me->SetReactState(REACT_DEFENSIVE);
            }

            void EnterCombat(Unit* /*who*/)
            {
                _EnterCombat();
                Talk(SAY_AGGRO);
                events.ScheduleEvent(EVENT_BURNING_BOOKS, 30000);
                events.ScheduleEvent(EVENT_QUICK_MIND, 15000);
                events.ScheduleEvent(EVENT_TELEPORT, 38000);
                events.ScheduleEvent(EVENT_FIREBALL, 5000);
                events.ScheduleEvent(EVENT_PYROBLAST, 20000);
            }

            void JustDied(Unit* /*killer*/)
            {
                _JustDied();
                Talk(SAY_DEATH);
            }

            void KilledUnit(Unit* victim)
            {
                if (victim->GetTypeId() == TYPEID_PLAYER)
                    Talk(RAND(SAY_KILLER_1, SAY_KILLER_2));
            }

            void MoveInLineOfSight(Unit* who)
            {
                if (who && who->GetTypeId() == TYPEID_PLAYER && me->IsValidAttackTarget(who))

                if (!intro && me->IsWithinDistInMap(who, 25))
                {
                    intro = true;
                    Talk(SAY_INTRO);
                    ScriptedAI::MoveInLineOfSight(who);
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
                        case EVENT_BURNING_BOOKS:
                            DoCast(SPELL_BOOK_BURNER);
                            events.ScheduleEvent(EVENT_BURNING_BOOKS, 30000); // should be 30sec after the first one
                            break;
                        case EVENT_TELEPORT:
                            DoCast(SPELL_TELEPORT);
                            me->UpdateMovementFlags();
                            me->SetTarget(0);
                            me->StopMoving();
                            events.ScheduleEvent(EVENT_TELEPORT, 45000);
                            events.ScheduleEvent(EVENT_DRAGON_BREATH, 1000);
                            break;
                        case EVENT_DRAGON_BREATH:
                            Talk(RAND(SAY_DRAGON_BREATH_1, SAY_DRAGON_BREATH_2));
                            DoCast(SPELL_DRAGON_BREATH);
                            events.ScheduleEvent(EVENT_QUICK_MIND, 11000);
                            break;
                        case EVENT_QUICK_MIND:
                            AttackStart(me->getVictim());
                            me->SetReactState(REACT_AGGRESSIVE);
                            DoCast(me, SPELL_QUICKENED_MIND);
                            break;
                        case EVENT_FIREBALL:
                            DoCastVictim(SPELL_FIREBALL_VOLLEY);
                            events.ScheduleEvent(EVENT_FIREBALL, 15000);
                            break;
                        case EVENT_PYROBLAST:
                            DoCastVictim(SPELL_PYROBLAST);
                            events.ScheduleEvent(EVENT_PYROBLAST, urand (25000, 35000));
                            break;
                        default:
                            break;
                    }
                }
                DoMeleeAttackIfReady();
            }
            private:
                bool intro;
        };

        CreatureAI* GetAI(Creature* creature) const
        {
            return new boss_flameweaver_koeglerAI(creature);
        }
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
        return new mob_book_caseAI (creature);
    }
};

void AddSC_boss_flameweaver_koegler()
{
    new boss_flameweaver_koegler();
    new mob_book_case();
}