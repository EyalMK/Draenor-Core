#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "scholomance.h"

enum ScholoEvents
{
    // Neophyte
    EVENT_CAST_REND_FLESH = 100,
    EVENT_CAST_SHADOW_INCINERATION = 101,

    // acolyte
    EVENT_CAST_SPIRIT_BARRAGE = 102,
    EVENT_CAST_UNBOUND = 103,
    EVENT_CAST_SHADOW_BOLT = 104,
    EVENT_CAST_SHATTER_SOUL = 105,

    // Risen Guard
    EVENT_IMPALE = 106,
    EVENT_UNHOLY_WEAPON = 107,

    // Candleflickring mages
    EVENT_FLICKERING_FLAME = 108,
    EVENT_SKIN_LIKE_WAX = 109,

    // Bored Student
    EVENT_FIRE_BREATH = 110,
    EVENT_SHADOW_NOVA = 111,

    // Professor Slate
    EVENT_TOXIC_POTION = 112,
    EVENT_POTION_BRUTE_FORCE = 113,
    EVENT_BRUTISH_FORCE = 114,
};

// Neophyte
#define REND_FLESH_INTERVAL urand(10000, 16000)
#define SHADOW_INCINERATION_INTERVAL 6500
// Acolyte
//#define UNBOUND_INTERVAL 
#define SHADOW_BOLT_INTERVAL 6000
#define SHATTER_SOUL_INTERVAL urand(14000, 20000)

#define EVENT_UNHOLY_WEAPON_INTERVAL urand(20000, 26000)
#define EVENT_IMPALE_INTERVAL urand(6000, 14000)

#define EVENT_FLICKERING_FLAME_INTERVAL urand(6000, 14000)
#define EVENT_SKIN_LIKE_WAX_INTERVAL 10000
#define firebreathinterval urand(8000, 30000)
#define toxicinterval urand(5000, 20000)
#define brutishforceinterval 25000
#define shadowbreathinterval urand(5000, 25000)



/*
CALLED BY:
ALL THE SPELLS IN THE DUNGEON
*/
// damage handling - heroics / normal
class spell_scholomance_spells_damage : public SpellScriptLoader
{
public:
    spell_scholomance_spells_damage() : SpellScriptLoader("spell_instructor_chillheart_spspell_scholomance_spells_damageells_damage") { }

    class spell_scholomance_spells_damage_Sp : public SpellScript
    {
        PrepareSpellScript(spell_scholomance_spells_damage_Sp);

        void HandleDamage(SpellEffIndex /*effIndex*/)
        {
            if (!GetCaster() || !GetHitUnit())
                return;

            if (InstanceScript* instance = GetCaster()->GetInstanceScript())
            {
                if (!instance->instance->IsHeroic())
                {
                    switch (GetSpellInfo()->Id)
                    {
                        /*
                        WRONG SCALE UP INSTEAD
                        */
                        // Instructor
                        // books
                    case 120027:
                    case 113859:
                    case 113809:
                        SetHitDamage(25000);
                        break;
                    case 111224: // touch of the grave
                        SetHitDamage(3000);
                        break;
                    case 111631: // wrack soul
                        SetHitDamage(15000);
                        break;
                    case 114886: // Frigid grasp
                        SetHitDamage(75000);
                        break;
                    case 111616: // ice wrath
                        SetHitDamage(15000);
                        break;
                        // Jandice Barov
                    case 114061: // wondrous rapidity
                        SetHitDamage(75000);
                        break;
                    case 114038: // gravity flux
                        SetHitDamage(100000);
                        break;
                    case 113775: // whirl of illusion
                        SetHitDamage(20000);
                        break;
                    case 113999: // bone spike
                        SetHitDamage(150000);
                        break;
                    case 114009: // soulflame
                        SetHitDamage(80000);
                        break;
                    case 111775: // shadow shiv
                        SetHitDamage(60000);
                        break;
                    case 111585: // dark blaze
                        SetHitDamage(10000);
                        break;
                    case 111642: // blazing soul
                        SetHitDamage(15000);
                        break;
                    case 113136: // incinerate
                    case 113141 : // immolate
                        SetHitDamage(35000);
                        break;
                    }
                }
            }
        }

        void Register()
        {
            OnEffectHitTarget += SpellEffectFn(spell_scholomance_spells_damage_Sp::HandleDamage, EFFECT_0, SPELL_EFFECT_SCHOOL_DAMAGE);
        }

    };
    SpellScript* GetSpellScript() const
    {
        return new spell_scholomance_spells_damage_Sp();
    }
};


class mob_scholomance_acolyte : public CreatureScript
{
public:
    mob_scholomance_acolyte() : CreatureScript("mob_scholomance_acolyte") { }

    struct mob_scholomance_acolyteAI : public ScriptedAI
    {
        mob_scholomance_acolyteAI(Creature* creature) : ScriptedAI(creature) { }

        void Reset()
        {
            me->AddAura(SPELL_SHADOW_FORM_VISUAL, me);
            me->SetReactState(REACT_DEFENSIVE);
        }
        void EnterCombat(Unit* who)
        {
            if (me->HasAura(SPELL_VISUAL_STRANGULATE_EMOTE))
                me->RemoveAura(SPELL_VISUAL_STRANGULATE_EMOTE);

            events.ScheduleEvent(EVENT_CAST_SHADOW_BOLT, SHADOW_BOLT_INTERVAL);
            events.ScheduleEvent(EVENT_CAST_SHATTER_SOUL, SHATTER_SOUL_INTERVAL);
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
                case EVENT_CAST_SHADOW_BOLT:
                    if (Unit* target = me->getVictim())
                        me->CastSpell(target, SPELL_SHADOW_BOLT);

                    events.ScheduleEvent(EVENT_CAST_SHADOW_BOLT, SHADOW_BOLT_INTERVAL);
                    break;
                case EVENT_CAST_SHATTER_SOUL:
                    if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 50.0F, true))
                        me->CastSpell(target, SPELL_SHATTER_SOUL);

                    events.ScheduleEvent(EVENT_CAST_SHATTER_SOUL, SHATTER_SOUL_INTERVAL);
                    break;
                }
            }
        }

    };

    CreatureAI* GetAI(Creature* creature) const
    {
        return new mob_scholomance_acolyteAI(creature);
    }
};
class mob_scholomance_neophyte : public CreatureScript
{
public:
    mob_scholomance_neophyte() : CreatureScript("mob_scholomance_neophyte") { }

    struct mob_scholomance_neophyteAI : public ScriptedAI
    {
        mob_scholomance_neophyteAI(Creature* creature) : ScriptedAI(creature) { }

        void EnterCombat(Unit* who)
        {
            if (me->HasAura(SPELL_VISUAL_STRANGULATE_EMOTE))
                me->RemoveAura(SPELL_VISUAL_STRANGULATE_EMOTE);

            if (me->HasAura(SPELL_SHADOW_FORM_VISUAL))
                me->RemoveAura(SPELL_SHADOW_FORM_VISUAL);

            me->SetReactState(REACT_DEFENSIVE);

            events.ScheduleEvent(EVENT_CAST_REND_FLESH, REND_FLESH_INTERVAL);
            events.ScheduleEvent(EVENT_CAST_SHADOW_INCINERATION, SHADOW_INCINERATION_INTERVAL);
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
                case EVENT_CAST_REND_FLESH:
                    if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 50.0F, true))
                        me->CastSpell(target, SPELL_REND_FLESH_HIGH_LEVEL);

                    events.ScheduleEvent(EVENT_CAST_REND_FLESH, REND_FLESH_INTERVAL);
                    break;
                case EVENT_CAST_SHADOW_INCINERATION:
                    if (Unit* target = me->getVictim())
                        me->CastSpell(target, SPELL_SHADOW_INCINERATION);

                    events.ScheduleEvent(EVENT_CAST_SHADOW_INCINERATION, SHADOW_INCINERATION_INTERVAL);
                    break;
                }
            }
        }

    };

    CreatureAI* GetAI(Creature* creature) const
    {
        return new mob_scholomance_neophyteAI(creature);
    }
};
class mob_scholomance_risen_guard : public CreatureScript
{
public:
    mob_scholomance_risen_guard() : CreatureScript("mob_scholomance_risen_guard") { }

    struct mob_risen_guardAI : public ScriptedAI
    {
        mob_risen_guardAI(Creature* creature) : ScriptedAI(creature) { }

        void EnterCombat(Unit* who)
        {
            events.ScheduleEvent(EVENT_IMPALE, EVENT_IMPALE_INTERVAL);
            events.ScheduleEvent(EVENT_UNHOLY_WEAPON, EVENT_UNHOLY_WEAPON_INTERVAL);
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
                case EVENT_IMPALE:
                    if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 50.0F, true))
                        me->CastSpell(target, SPELL_IMPALE);

                    events.ScheduleEvent(EVENT_IMPALE, EVENT_IMPALE_INTERVAL);
                    break;
                case EVENT_UNHOLY_WEAPON:
                    if (Unit* target = me->getVictim())
                        me->CastSpell(target, SPELL_UNHOLY_WEAPON);

                    events.ScheduleEvent(EVENT_UNHOLY_WEAPON, EVENT_UNHOLY_WEAPON_INTERVAL);
                    break;
                }
            }

            DoMeleeAttackIfReady();
        }

    };

    CreatureAI* GetAI(Creature* creature) const
    {
        return new mob_risen_guardAI(creature);
    }
};
class mob_shatter_soul_fragment : public CreatureScript
{
public:
    mob_shatter_soul_fragment() : CreatureScript("mob_shatter_soul_fragment") { }

    struct mob_shatter_soul_fragmentAI : public ScriptedAI
    {
        mob_shatter_soul_fragmentAI(Creature* creature) : ScriptedAI(creature) { }

        void Reset()
        {
            me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
            me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
            
            me->setFaction(16);

            me->DespawnOrUnsummon(4000);
         }
        void EnterCombat(Unit* who)
        {
            if (Unit* target = me->getVictim())
                me->CastSpell(target, SPELL_SPIRIT_BARRAGE);
        }
    };

    CreatureAI* GetAI(Creature* creature) const
    {
        return new mob_shatter_soul_fragmentAI(creature);
    }
};
// second sanctum
class mob_scholomance_dark_candle : public CreatureScript
{
public:
    mob_scholomance_dark_candle() : CreatureScript("mob_scholomance_dark_candle") { }

    struct mob_scholomance_dark_candleAI : public Scripted_NoMovementAI
    {
        mob_scholomance_dark_candleAI(Creature* creature) : Scripted_NoMovementAI(creature) { }
        bool hasexplode;

        void Reset()
        {
            hasexplode = false;
            me->CastSpell(me, SPELL_SUMMON_BLACK_CANDLE);
            me->CastSpell(me, SPELL_BLACK_CANDLE_SPELL);
        }
        void EnterCombat(Unit* who)
        {

        }
        void UpdateAI(uint32 const diff)
        {
        }
    };

    CreatureAI* GetAI(Creature* creature) const
    {
        return new mob_scholomance_dark_candleAI(creature);
    }
};

class mob_scholomance_candlestick_mage : public CreatureScript
{
public:
    mob_scholomance_candlestick_mage() : CreatureScript("mob_scholomance_candlestick_mage") { }

    struct mob_scholomance_candlestick_mageAI : public ScriptedAI
    {
        mob_scholomance_candlestick_mageAI(Creature* creature) : ScriptedAI(creature) { }

        void Reset()
        {
            if (Creature* candle = me->FindNearestCreature(CREATURE_TRIGGER_CANDLE, 30.0f, true))
            { 
                me->SetFacingToObject(candle);      
                me->CastSpell(me, SPELL_TWILING_CHANNEL);
            }
        }
        void EnterCombat(Unit* who)
        {   
            events.ScheduleEvent(EVENT_FLICKERING_FLAME, EVENT_FLICKERING_FLAME_INTERVAL);
            events.ScheduleEvent(EVENT_SKIN_LIKE_WAX, EVENT_SKIN_LIKE_WAX_INTERVAL);
        }
        void JustDied(Unit* /*killer*/)
        {
            if (Creature* candle = me->FindNearestCreature(CREATURE_TRIGGER_CANDLE, 10.0f, true))
            {
                if (me->FindNearestCreature(CREATURE_CANDLESTICK_MAGE, 10.0f, false))
                {
                    candle->RemoveAura(SPELL_SUMMON_BLACK_CANDLE);
                    candle->RemoveAura(SPELL_BLACK_CANDLE_SPELL);
                }
            }
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
                case EVENT_FLICKERING_FLAME:
                    me->CastSpell(me->getVictim(), SPELL_FLICKERING_FLAME);

                    events.ScheduleEvent(EVENT_FLICKERING_FLAME, EVENT_FLICKERING_FLAME_INTERVAL);
                    break;
                case EVENT_SKIN_LIKE_WAX:
                    if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 50.0F, true))
                        me->CastSpell(target, SPELL_SKIN_LIKE_WAX);

                    events.ScheduleEvent(EVENT_SKIN_LIKE_WAX, EVENT_SKIN_LIKE_WAX_INTERVAL);
                    break;
                }
            }
        }

    };

    CreatureAI* GetAI(Creature* creature) const
    {
        return new mob_scholomance_candlestick_mageAI(creature);
    }
};
class mob_scholomance_skull_state : public CreatureScript
{
public:
    mob_scholomance_skull_state() : CreatureScript("mob_scholomance_skull_state") { }

    struct mob_scholomance_skull_stateAI : public Scripted_NoMovementAI
    {
        mob_scholomance_skull_stateAI(Creature* creature) : Scripted_NoMovementAI(creature) { }

        void Reset()
        {
            me->CastSpell(me, SPELL_TALKING_SKULL);
        }
    };

    CreatureAI* GetAI(Creature* creature) const
    {
        return new mob_scholomance_skull_stateAI(creature);
    }
};
class mob_scholomance_krastinoc_carvers : public CreatureScript
{
public:
    mob_scholomance_krastinoc_carvers() : CreatureScript("mob_scholomance_krastinoc_carvers") { }

    struct mob_scholomance_krastinoc_carversAI : public ScriptedAI
    {
        mob_scholomance_krastinoc_carversAI(Creature* creature) : ScriptedAI(creature) { }

        void Reset()
        {
            switch (urand(0, 5))
            {
            case 0:
                me->CastSpell(me, 124064); // book
                break;
            }

            me->CastSpell(me, SPELL_BOLIDING_BLOODTHIRST);
        }
        void EnterCombat(Unit* who)
        {
            switch (urand(0, 3))
            {
            case 0:
                me->MonsterYell("blood blood blood BLOOD BLOOD!", LANG_UNIVERSAL, me->GetGUID());
                break;
            case 1:
                me->MonsterYell("More Blood!", LANG_UNIVERSAL, me->GetGUID());
                break;
            case 2:
                me->MonsterYell("blood blood blood BLOOD BLOOD!", LANG_UNIVERSAL, me->GetGUID());
                break;
            }
        }
        void JustDied(Unit* /*killer*/)
        {
            switch (urand(0, 1))
            {
            case 0:
                me->MonsterYell("The scent of blood.. so delicious", LANG_UNIVERSAL, me->GetGUID());
                break;
            }

            std::list<Creature*> Krastinov;

            me->GetCreatureListWithEntryInGrid(Krastinov, CREATURE_KRASTINOV_CARVER, 10.0f /*?*/);
            
            for (auto itr : Krastinov)
            {
                if (itr->isAlive())
                if (itr->GetAura(SPELL_BOLIDING_BLOODTHIRST))
                {
					Aura* aura = itr->GetAura(SPELL_BOLIDING_BLOODTHIRST);

                    aura->SetStackAmount(aura->GetStackAmount() + 1);
                }
            }
            
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
                }
            }

            DoMeleeAttackIfReady();
        }

    };

    CreatureAI* GetAI(Creature* creature) const
    {
        return new mob_scholomance_krastinoc_carversAI(creature);
    }
};
class mob_scholomance_flesh_horror : public CreatureScript
{
public:
    mob_scholomance_flesh_horror() : CreatureScript("mob_scholomance_flesh_horror") { }

    struct mob_scholomance_flesh_horrorAI : public ScriptedAI
    {
        mob_scholomance_flesh_horrorAI(Creature* creature) : ScriptedAI(creature) { }

        void Reset()
        {
            summons.DespawnAll();

            Position pos;

            me->GetRandomNearPosition(pos, 8.0f);

            graft4 = me->SummonCreature(CREATURE_MEAT_GRAFT, pos, TEMPSUMMON_MANUAL_DESPAWN);
            graft3 = me->SummonCreature(CREATURE_MEAT_GRAFT, pos, TEMPSUMMON_MANUAL_DESPAWN);
            graft2 = me->SummonCreature(CREATURE_MEAT_GRAFT, pos, TEMPSUMMON_MANUAL_DESPAWN);
            graft = me->SummonCreature(CREATURE_MEAT_GRAFT, pos, TEMPSUMMON_MANUAL_DESPAWN);

            graft->CastSpell(me, 83487);
            graft2->CastSpell(me, 83487);
            graft3->CastSpell(me, 83487);
            graft4->CastSpell(me, 83487);

            graft->SetReactState(REACT_PASSIVE);
            graft2->SetReactState(REACT_PASSIVE);
            graft3->SetReactState(REACT_PASSIVE);
            graft4->SetReactState(REACT_PASSIVE);
            graft->AddUnitState(UNIT_STATE_CANNOT_AUTOATTACK);
            graft2->AddUnitState(UNIT_STATE_CANNOT_AUTOATTACK);
            graft3->AddUnitState(UNIT_STATE_CANNOT_AUTOATTACK);
            graft4->AddUnitState(UNIT_STATE_CANNOT_AUTOATTACK);

            graft4->GetMotionMaster()->MoveFollow(me, 2, 20, MOTION_SLOT_ACTIVE);
            graft3->GetMotionMaster()->MoveFollow(me, 4.0f, 55, MOTION_SLOT_ACTIVE);
            graft2->GetMotionMaster()->MoveFollow(me, 9.0f, 180, MOTION_SLOT_ACTIVE);
            graft->GetMotionMaster()->MoveFollow(me, 6.0, 335, MOTION_SLOT_ACTIVE);
        }
        void EnterCombat(Unit* who)
        {
        }
        void JustDied(Unit* /*killer*/)
        {
            summons.DespawnAll();
        }
        void UpdateAI(uint32 const diff)
        {
            if (!UpdateVictim())
                return;

            events.Update(diff);

            if (graft == NULL ||  graft2 == NULL  || graft3 == NULL | graft4 == NULL)
                return;

            graft->CastSpell(me, 83487);
            graft2->CastSpell(me, 83487);
            graft3->CastSpell(me, 83487);
            graft4->CastSpell(me, 83487);
            
            if (me->GetHealthPct() < 95 && graft != NULL && graft->isAlive())
            {
                graft->CastSpell(me, 114176);
            }
            if (graft->isDead() && graft2->isDead() && graft3->isDead() && graft4->isDead())
            {
                me->Kill(me);
                me->DespawnOrUnsummon(10000);
            }
            DoMeleeAttackIfReady();
        }
    private:
        Creature* graft;
        Creature* graft2;
        Creature* graft3;
        Creature* graft4;
    };

    CreatureAI* GetAI(Creature* creature) const
    {
        return new mob_scholomance_flesh_horrorAI(creature);
    }
};
class mob_scholomance_bored_student : public CreatureScript
{
public:
    mob_scholomance_bored_student() : CreatureScript("mob_scholomance_bored_student") { }

    struct mob_scholomance_bored_studentAI : public ScriptedAI
    {
        mob_scholomance_bored_studentAI(Creature* creature) : ScriptedAI(creature) { }

        void Reset()
        {
        }
        void EnterCombat(Unit* who)
        {
            events.ScheduleEvent(EVENT_SHADOW_NOVA, firebreathinterval);
            events.ScheduleEvent(EVENT_FIRE_BREATH, shadowbreathinterval);
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
                case EVENT_SHADOW_NOVA:
                    me->CastSpell(me->getVictim(), SPELL_SHADOW_NOVA_BORED_STUDENT);
                    events.ScheduleEvent(EVENT_SHADOW_NOVA, shadowbreathinterval);
                    break;
                case EVENT_FIRE_BREATH:
                    me->CastSpell(me->getVictim(), SPELL_FIRE_BREATH_POTION_BORED_STUDENT);
                    events.ScheduleEvent(EVENT_FIRE_BREATH, firebreathinterval);
                    break;
                }
            }

            DoMeleeAttackIfReady();
        }

    };

    CreatureAI* GetAI(Creature* creature) const
    {
        return new mob_scholomance_bored_studentAI(creature);
    }
};
class mob_scholomance_professor : public CreatureScript
{
public:
    mob_scholomance_professor() : CreatureScript("mob_scholomance_professor") { }

    struct mob_scholomance_professorAI : public ScriptedAI
    {
        mob_scholomance_professorAI(Creature* creature) : ScriptedAI(creature) { }

        void Reset()
        {
        }
        void EnterCombat(Unit* who)
        {
            events.ScheduleEvent(EVENT_BRUTISH_FORCE, brutishforceinterval);
            events.ScheduleEvent(EVENT_TOXIC_POTION, toxicinterval);
            events.ScheduleEvent(EVENT_FIRE_BREATH, firebreathinterval);
        }
        void UpdateAI(uint32 const diff)
        {
            if (!UpdateVictim())
            {
                switch (urand(0, 20))
                {
                case 0:
                    me->CastSpell(me, 79506); // emote talk
                    break;
                }
            }

            if (!UpdateVictim())
                return;

            events.Update(diff);

            if (me->HasUnitState(UNIT_STATE_CASTING))
                return;

            if (uint32 eventId = events.ExecuteEvent())
            {
                switch (eventId)
                {
                case EVENT_FIRE_BREATH:
                    me->CastSpell(me->getVictim(), SPELL_FIRE_BREATH_POTION_BORED_STUDENT);
                    events.ScheduleEvent(EVENT_FIRE_BREATH, firebreathinterval);
                    break;
                case EVENT_TOXIC_POTION:
                    if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 50.0f, true))
                        me->CastSpell(target, SPELL_TOXIC_POTION);
                    events.ScheduleEvent(EVENT_FIRE_BREATH, toxicinterval);
                    break;
                case EVENT_BRUTISH_FORCE:
                    me->CastSpell(me, SPELL_POTION_OF_BRUTISH_FORCE);
                    events.ScheduleEvent(EVENT_BRUTISH_FORCE, brutishforceinterval);
                    break;
                }
            }
            DoMeleeAttackIfReady();
        }

    };

    CreatureAI* GetAI(Creature* creature) const
    {
        return new mob_scholomance_professorAI(creature);
    }
};
// called by 114411
class spell_candle_summon : public SpellScriptLoader
{
public:
    spell_candle_summon() : SpellScriptLoader("spell_candle_summon") { }

    class spell_candle_summon_spell_script : public SpellScript
    {
        PrepareSpellScript(spell_candle_summon_spell_script);

        void HandleAfterCastSummon()
        {
            if (!GetCaster())
                return;
            Player* player = GetCaster()->ToPlayer();
            if (!player)
                return;
            std::list<Creature*> Mushroom_List;

            player->GetCreatureListWithEntryInGrid(Mushroom_List, 59480, 16.0f);

            if (Mushroom_List.size() >= 6)
            {
                Mushroom_List.back()->ToTempSummon()->UnSummon();
            }
        }
        void Register() override
        {
            AfterCast += SpellCastFn(spell_candle_summon_spell_script::HandleAfterCastSummon);
        }
    };
    SpellScript* GetSpellScript() const override
    {
        return new spell_candle_summon_spell_script();
    }
};
class hack_fixing_lock_doors : public GameObjectScript
{
public:
    hack_fixing_lock_doors() : GameObjectScript("hack_fixing_lock_doors") { }

    bool OnGossipHello(Player* player, GameObject* gobject)
    {
        return false;
    }
};

void AddSC_scholomance()
{
    // mobs
    new mob_scholomance_candlestick_mage();
    new mob_scholomance_dark_candle();
    new mob_shatter_soul_fragment();
    new mob_scholomance_neophyte();
    new mob_scholomance_acolyte();
    new mob_scholomance_risen_guard();
    new mob_scholomance_skull_state();
    new mob_scholomance_flesh_horror();
    new mob_scholomance_krastinoc_carvers();
    new mob_scholomance_professor();
    new mob_scholomance_bored_student();
    // gobs
    new hack_fixing_lock_doors();
    // spells
    new spell_scholomance_spells_damage();
    new spell_candle_summon();
}