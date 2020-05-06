////////////////////////////////////////////////////////////////////////////////
//
// Project-Hellscream https://hellscream.org
// Copyright (C) 2018-2020 Project-Hellscream-6.2
// Discord https://discord.gg/CWCF3C9
//
////////////////////////////////////////////////////////////////////////////////

/* ScriptData
SDName: Boss_Ragnaros
SD%Complete: 100
SDComment: Revamped by Teleqraph
SDCategory: Molten Core
EndScriptData */

#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "molten_core.h"

enum Texts
{
	SAY_ARRIVAL1_RAG	= 1,
	SAY_ARRIVAL3_RAG	= 2,
	SAY_ARRIVAL5_RAG	= 3,
    SAY_REINFORCEMENTS1 = 5,
    SAY_REINFORCEMENTS2 = 6,
    SAY_HAND            = 7,
    SAY_WRATH           = 8,
    SAY_KILL            = 9,
    SAY_MAGMABURST      = 10
};

enum Spells
{
	SPELL_EMERGE				= 50142,
	SPELL_SUBMERGE				= 100312,
    SPELL_HAND_OF_RAGNAROS      = 19780,
    SPELL_WRATH_OF_RAGNAROS     = 20566,
    SPELL_LAVA_BURST            = 21158,
    SPELL_MAGMA_BLAST           = 20565,                   // Ranged attack
    SPELL_SONS_OF_FLAME_DUMMY   = 21108,                   // Server side effect
    SPELL_MELT_WEAPON           = 21388,
    SPELL_ELEMENTAL_FIRE        = 20564,
    SPELL_ERRUPTION             = 17731
};

enum Events
{
    EVENT_ERUPTION          = 1,
    EVENT_WRATH_OF_RAGNAROS = 2,
    EVENT_HAND_OF_RAGNAROS  = 3,
    EVENT_LAVA_BURST        = 4,
    EVENT_ELEMENTAL_FIRE    = 5,
    EVENT_MAGMA_BLAST       = 6,
    EVENT_SUBMERGE          = 7,

    EVENT_INTRO_1           = 8,
    EVENT_INTRO_2           = 9,
    EVENT_INTRO_3           = 10,
    EVENT_INTRO_4           = 11,
    EVENT_INTRO_5           = 12
};

class boss_ragnaros : public CreatureScript
{
    public:
        boss_ragnaros() : CreatureScript("boss_ragnaros") { }

        struct boss_ragnarosAI : public BossAI
        {
            boss_ragnarosAI(Creature* creature) : BossAI(creature, BOSS_RAGNAROS)
            {
                _introState = 0;
                me->SetReactState(REACT_PASSIVE);
                me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
				me->AddAura(SPELL_SUBMERGE, me);
				me->SetDisableGravity(true);
				me->SetCanFly(true);
            }

            void Reset()
            {
                BossAI::Reset();
                _emergeTimer = 90000;
                _hasYelledMagmaBurst = false;
                _hasSubmergedOnce = false;
                _isBanished = false;
                me->SetUInt32Value(UNIT_FIELD_EMOTE_STATE, 0);
            }

            void EnterCombat(Unit* victim)
            {
                BossAI::EnterCombat(victim);
                events.ScheduleEvent(EVENT_ERUPTION, 15000);
                events.ScheduleEvent(EVENT_WRATH_OF_RAGNAROS, 30000);
                events.ScheduleEvent(EVENT_HAND_OF_RAGNAROS, 25000);
                events.ScheduleEvent(EVENT_LAVA_BURST, 10000);
                events.ScheduleEvent(EVENT_ELEMENTAL_FIRE, 3000);
                events.ScheduleEvent(EVENT_MAGMA_BLAST, 2000);
                events.ScheduleEvent(EVENT_SUBMERGE, 180000);
            }

			void KilledUnit(Unit* who)
			{
				if (who && who->GetTypeId() == TYPEID_PLAYER)
					if (urand(0, 99) < 25)
						Talk(SAY_KILL);
			}

            void UpdateAI(const uint32 diff)
            {
                if (_introState != 2)
                {
                    if (!_introState)
                    {
						DoCast(me, SPELL_EMERGE, true);
						me->RemoveAura(SPELL_SUBMERGE);
                        events.ScheduleEvent(EVENT_INTRO_1, 4000);
                        events.ScheduleEvent(EVENT_INTRO_2, 23000);
                        events.ScheduleEvent(EVENT_INTRO_3, 42000);
                        events.ScheduleEvent(EVENT_INTRO_4, 43000);
                        events.ScheduleEvent(EVENT_INTRO_5, 53000);
                        _introState = 1;
                    }

                    events.Update(diff);

                    while (uint32 eventId = events.ExecuteEvent())
                    {
                        switch (eventId)
                        {
                        case EVENT_INTRO_1:
							Talk(SAY_ARRIVAL1_RAG);
                            break;
                        case EVENT_INTRO_2:
							Talk(SAY_ARRIVAL3_RAG);
                            break;
                        case EVENT_INTRO_3:
                            me->HandleEmoteCommand(EMOTE_ONESHOT_ATTACK1H);
                            break;
                        case EVENT_INTRO_4:
							Talk(SAY_ARRIVAL5_RAG);
                            if (instance)
                                if (Creature* executus = Unit::GetCreature(*me, instance->GetData64(BOSS_MAJORDOMO_EXECUTUS)))
                                    me->Kill(executus);
                            break;
                        case EVENT_INTRO_5:
                            me->SetReactState(REACT_AGGRESSIVE);
                            me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
							me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_MOVE);
                            _introState = 2;
                            break;
                        default:
                            break;
                        }
                    }
                }
                else
                {
                    if (instance)
                    {
                        if (_isBanished && ((_emergeTimer <= diff) || (instance->GetData(DATA_RAGNAROS_ADDS)) > 8))
                        {
                            //Become unbanished again
                            me->SetReactState(REACT_AGGRESSIVE);
                            me->setFaction(14);
                            me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
							me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_MOVE);
                            me->SetUInt32Value(UNIT_FIELD_EMOTE_STATE, 0);
							me->RemoveAura(SPELL_SUBMERGE);
							DoCast(me, SPELL_EMERGE, true);
                            if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0))
                                AttackStart(target);
                            instance->SetData(DATA_RAGNAROS_ADDS, 0);

                            _isBanished = false;
                        }
                        else if (_isBanished)
                        {
                            _emergeTimer -= diff;
                            //Do nothing while banished
                            return;
                        }
                    }

                    if (!UpdateVictim())
                        return;

                    events.Update(diff);

                    while (uint32 eventId = events.ExecuteEvent())
                    {
                        switch (eventId)
                        {
                            case EVENT_ERUPTION:
                                DoCastVictim(SPELL_ERRUPTION);
                                events.ScheduleEvent(EVENT_ERUPTION, urand(20000, 45000));
                                break;
                            case EVENT_WRATH_OF_RAGNAROS:
                                DoCastVictim(SPELL_WRATH_OF_RAGNAROS);
                                if (urand(0, 1))
									Talk(SAY_WRATH);
                                events.ScheduleEvent(EVENT_WRATH_OF_RAGNAROS, 25000);
                                break;
                            case EVENT_HAND_OF_RAGNAROS:
                                DoCast(me, SPELL_HAND_OF_RAGNAROS);
                                if (urand(0, 1))
									Talk(SAY_HAND);
                                events.ScheduleEvent(EVENT_HAND_OF_RAGNAROS, 20000);
                                break;
                            case EVENT_LAVA_BURST:
                                DoCastVictim(SPELL_LAVA_BURST);
                                events.ScheduleEvent(EVENT_LAVA_BURST, 10000);
                                break;
                            case EVENT_ELEMENTAL_FIRE:
                                DoCastVictim(SPELL_ELEMENTAL_FIRE);
                                events.ScheduleEvent(EVENT_ELEMENTAL_FIRE, urand(10000, 14000));
                                break;
                            case EVENT_MAGMA_BLAST:
                                if (!me->IsWithinMeleeRange(me->getVictim()))
                                {
									DoCastVictim(SPELL_MAGMA_BLAST);

                                    if (!_hasYelledMagmaBurst)
                                    {
                                        Talk(SAY_MAGMABURST);
                                        _hasYelledMagmaBurst = true;
                                    }
                                }
                                events.ScheduleEvent(EVENT_MAGMA_BLAST, 2500);
                                break;
                            case EVENT_SUBMERGE:
                            {
                                if (instance && !_isBanished)
                                {
                                    //Creature spawning and ragnaros becomming unattackable
                                    //is not very well supported in the core //no it really isnt
                                    //so added normaly spawning and banish workaround and attack again after 90 secs.
                                    me->AttackStop();
                                    DoResetThreat();
                                    me->SetReactState(REACT_PASSIVE);
                                    me->InterruptNonMeleeSpells(false);
                                    me->setFaction(35);
                                    me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
									me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_MOVE);
									DoCast(me, SPELL_SUBMERGE, true);
                                    instance->SetData(DATA_RAGNAROS_ADDS, 0);

                                    if (!_hasSubmergedOnce)
                                    {
                                        Talk(SAY_REINFORCEMENTS1);

                                        // summon 8 elementals
                                        for (uint8 i = 0; i < 8; ++i)
                                            if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0))
                                                if (Creature* summoned = me->SummonCreature(12143, target->GetPositionX(), target->GetPositionY(), target->GetPositionZ(), 0.0f, TEMPSUMMON_TIMED_OR_CORPSE_DESPAWN, 900000))
                                                    summoned->AI()->AttackStart(target);

                                        _hasSubmergedOnce = true;
                                        _isBanished = true;
                                        _emergeTimer = 90000;

                                    }
                                    else
                                    {
										Talk(SAY_REINFORCEMENTS2);

                                        for (uint8 i = 0; i < 8; ++i)
                                            if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0))
                                                if (Creature* summoned = me->SummonCreature(12143, target->GetPositionX(), target->GetPositionY(), target->GetPositionZ(), 0.0f, TEMPSUMMON_TIMED_OR_CORPSE_DESPAWN, 900000))
                                                    summoned->AI()->AttackStart(target);

                                        _isBanished = true;
                                        _emergeTimer = 90000;
                                    }
                                }
                                events.ScheduleEvent(EVENT_SUBMERGE, 180000);
                                break;
                            }
                            default:
                                break;
                        }
                    }

                    DoMeleeAttackIfReady();
                }
            }

        private:
            uint32 _emergeTimer;
            uint8 _introState;
            bool _hasYelledMagmaBurst;
            bool _hasSubmergedOnce;
            bool _isBanished;
        };

        CreatureAI* GetAI(Creature* creature) const
        {
            return new boss_ragnarosAI(creature);
        }
};

class mob_son_of_flame : public CreatureScript
{
    public:
        mob_son_of_flame() : CreatureScript("mob_SonOfFlame") { }

        struct mob_son_of_flameAI : public ScriptedAI //didnt work correctly in EAI for me...
        {
            mob_son_of_flameAI(Creature* creature) : ScriptedAI(creature)
            {
                instance = me->GetInstanceScript();
            }

            void JustDied(Unit* /*killer*/)
            {
                if (instance)
                    instance->SetData(DATA_RAGNAROS_ADDS, 1);
            }

            void UpdateAI(const uint32 /*diff*/)
            {
                if (!UpdateVictim())
                    return;

                DoMeleeAttackIfReady();
            }

        private:
            InstanceScript* instance;
        };

        CreatureAI* GetAI(Creature* creature) const
        {
            return new mob_son_of_flameAI(creature);
        }
};

#ifndef __clang_analyzer__
void AddSC_boss_ragnaros()
{
    new boss_ragnaros();
    new mob_son_of_flame();
}
#endif
