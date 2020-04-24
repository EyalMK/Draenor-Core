#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "scarlet_monastery.h"

enum Spells
{
    SPELL_EVICT_SOUL     = 115297,
    SPELL_RAISE_FALLEN   = 115139,
    SPELL_SPIRIT_GALE    = 115289,
    SPELL_SUMMON_SPIRITS = 115147,

    // Trash
    SPELL_MIND_ROT       = 115144
};

enum Events
{
    EVENT_RAISE_FALLEN = 0,
    EVENT_SPIRIT_GALE,
    EVENT_SUMMON_SPIRITS,
    EVENT_EVICT_SOUL,
    EVENT_START_COMBAT
};

enum Texts
{
    SAY_INTRO       = 0, // My endless agony shall be yours, as well! (27832)
    SAY_AGGRO       = 1, // We hunger for vengeance! (27829)
    SAY_RISE_FALLEN = 2, // No rest...for the angry dead! (27831)
    SAY_SUM_SPIRIT  = 3, // Claim a body, and wreak terrible vengeance! (27835)
    SAY_EVICT_SOUL  = 4, // Seek out a vessel...and return! (27834)
    SAY_KILLER      = 5, // More, more souls! (27833)
    SAY_DEATH       = 6  // Can this be...the end, at last...? (27830)
};

class boss_thalnos_the_soulrender : public CreatureScript
{
    public:
        boss_thalnos_the_soulrender() : CreatureScript("boss_thalnos_the_soulrender") { }

        struct boss_thalnos_the_soulrenderAI : public BossAI
        {
            boss_thalnos_the_soulrenderAI(Creature* creature) : BossAI(creature, DATA_THALNOS) { }

            void Reset()
            {
                _Reset();
                intro = false;
            }

            void EnterCombat(Unit* /*who*/)
            {
                _EnterCombat();
                events.ScheduleEvent(EVENT_START_COMBAT, 6000);
                events.ScheduleEvent(EVENT_SPIRIT_GALE, 10000);
                events.ScheduleEvent(EVENT_SUMMON_SPIRITS, 45000);
                events.ScheduleEvent(EVENT_EVICT_SOUL, 20000);
            }

            void MoveInLineOfSight(Unit* who)
            {
                if (who && who->GetTypeId() == TYPEID_PLAYER && me->IsValidAttackTarget(who))

                if (!intro && me->IsWithinDistInMap(who, 30.0f))
                {
                    intro = true;
                    Talk(SAY_INTRO);
                    ScriptedAI::MoveInLineOfSight(who);

                    if (Player* player = me->SelectNearestPlayer(30.0f))
                        DoCast(player, SPELL_SPIRIT_GALE);
                }
            }

            void JustDied(Unit* /*killer*/)
            {
                _JustDied();
                Talk(SAY_DEATH);
            }

            void KilledUnit(Unit* victim)
            {
                if (victim->GetTypeId() == TYPEID_PLAYER)
                    Talk(SAY_KILLER);
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
                        case EVENT_START_COMBAT:
                            Talk(SAY_AGGRO);
                            events.ScheduleEvent(EVENT_RAISE_FALLEN, 1*IN_MILLISECONDS);
                            break;
                        case EVENT_RAISE_FALLEN:
                            Talk(SAY_RISE_FALLEN);
                            DoCast(me, SPELL_RAISE_FALLEN);
                            events.ScheduleEvent(EVENT_RAISE_FALLEN, 60*IN_MILLISECONDS);
                            break;
                        case EVENT_SPIRIT_GALE:
                            Talk(SAY_SUM_SPIRIT);
                            DoCastVictim(SPELL_SPIRIT_GALE);
                            events.ScheduleEvent(EVENT_SPIRIT_GALE, urand(15*IN_MILLISECONDS, 30*IN_MILLISECONDS));
                            break;
                        case EVENT_SUMMON_SPIRITS:
                            Talk(SAY_SUM_SPIRIT);
                            DoCast(me, SPELL_SUMMON_SPIRITS);
                            events.ScheduleEvent(EVENT_SUMMON_SPIRITS, urand(55*IN_MILLISECONDS, 1*MINUTE*IN_MILLISECONDS));
                            break;
                        case EVENT_EVICT_SOUL:
                            Talk(SAY_EVICT_SOUL);
                            DoCast(SPELL_EVICT_SOUL);
                            events.ScheduleEvent(EVENT_EVICT_SOUL, urand(30*IN_MILLISECONDS, 50*IN_MILLISECONDS));
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
            return new boss_thalnos_the_soulrenderAI(creature);
        }
};

void AddSC_boss_thalnos_the_soulrender()
{
    new boss_thalnos_the_soulrender();
}