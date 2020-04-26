#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "scholomance.h"


enum Spells
{
    // Lilian
    SPELL_SHADOW_SHIV     = 111775,
    SPELL_DEATHS_GRASP    = 111570,
    SPELL_GRASP_GRIP      = 111573,
    SPELL_DARK_BLAZE      = 111585,

    // Misc
    SPELL_SOUL_COSMETIC   = 112057,
    SPELL_SUMMON_SOUL     = 112063,
    SPELL_COMBINE_VISUAL  = 111687,
    SPELL_GANDLING_VISUAL = 114200,

    // Lilians Soul
    SPELL_UNLEASH_ANGUISH = 111649,
    SPELL_FIXATE_ANGER    = 115350
};

enum TalkVoss
{
    SAY_INTRO     = 0, // I...wont let you... (29464) yell
    SAY_AGGRO     = 1, // I cant...fight him... (29465) normal talk
    SAY_SOUL_BURN = 2, // It burns...my soul...it burns!!! (29468) yell
    SAY_EXTRACT   = 3, // END IT! NOW! Before he can... (29463) yell
    SAY_DONE      = 4, // DIE, NECROMANCER!(29466) yell
    SAY_DEATH     = 5, // Leave me... to die.. alone.. please..
};
enum TalkGandling
{
    SAY_1 = 208, // Did you forget girl.. I'm the dark master! I command the undead (27486)
    SAY_2 = 200, // Now turn your lovely runeblade on our lovely guests, and fetch me their bones! (27487)
    SAY_3 = 201, // Your soul is mine! (27488)
    SAY_4 = 202, // I can feel her will breaking! Her soul burns so brightly.
    SAY_5 = 203, // Now, Lilian. It is time for you transformation.
    SAY_6 = 204, // Why let a perfectly good corpse go to a waste.
    SAY_7 = 205, // How intriguing, her spirit will not relinquish its grasp on this world.
    SAY_8 = 206, // What?!
    SAY_9 = 207, // The bones! you wretch!
    SAY_10 = 209, // How does it feel Voss? to watch them hack your mortal body to pieces..
};
enum Events
{
    EVENT_DEATHS_GRASP = 10,
    EVENT_SHADOW_SHIV = 11,
    EVENT_DARK_BLAZE = 12,
    EVENT_TAKE_SOUL = 13,
    EVENT_EXTRACT_SOUL = 14,
    EVENT_FAKE_DEATH = 15,
    EVENT_START_PHASE2 = 16,
    EVENT_FOCUS_PLAYER = 17,
    EVENT_RESURECT = 18,
    EVENT_START_PHASE3 = 19,
    EVENT_TALK = 20,
    EVENT_TALK2 = 21,
    EVENT_TALK3 = 22,
    EVENT_TALK4 = 23,
    EVENT_TALK5 = 24,
    EVENT_TALK6 = 25,
    EVENT_TALK7 = 26,
    EVENT_DONE = 30,
    EVENT_DONE_2 = 31,
    EVENT_DONE_3 = 32,
    EVENT_SAY_BURN = 33,
    EVENT_SOUL_STEAL = 34,
    EVENT_SOUL_STEAL2 = 35,
    EVENT_SOUL_STEAL3 = 36,
};
enum Actions
{
    ACTION_START_PHASE2 = 100,
    ACTION_RESURECT     = 200,
    ACTION_TALK_75_PCT = 2010,
    ACTION_GO_HOSTILE = 2020,
    ACTION_DONE = 2030,
};

Position MoveCenterPos = { 200.845f, 83.903f, 107.762f, 5.495520 };
Position MoveCenterPosHigh = { 200.845f, 83.903f, 110.534f, 5.495520 };
Position SoulBackwards = {197.80f, 86.37f, 110.533f, 5.599334f};
Position TalkingSkull = {202.91f, 102.03f, 108.232f, 4.816155f};
Position Gandlingescape = {177.53f, 74.41f, 108.233f, 3.107697f};
Position SkullMove = {187.46f, 88.07f, 108.038f};
Position ChestPosition = {168.68f, 99.04f, 108.247f, 6.236352f};

#define soulmsg_prephase3 "Lilian's soul fades into the spirit realm! It can no longer be harmed!"
#define soul_fixates "Lilian's Soul fixates on %s"
#define skullend "Stop him! forgot about her!"

class controller_lilian_voss : public CreatureScript
{
public:
    controller_lilian_voss() : CreatureScript("controller_lilian_voss") { }

    struct controller_lilian_vossAI : public ScriptedAI
    {
        controller_lilian_vossAI(Creature* creature) : ScriptedAI(creature)
        {
            instance = creature->GetInstanceScript();
        }

        InstanceScript* instance;
        bool eventstarted;

        void Reset()
        {
            eventstarted = false;
            me->CastSpell(me, SPELL_TALKING_SKULL);
        }
        void DoAction(int32 const action)
        {
            switch (action)
            {
            case ACTION_START_PHASE2:
                events.ScheduleEvent(EVENT_TALK6, 1000);
                break;
            case ACTION_TALK_75_PCT:
                events.ScheduleEvent(EVENT_TALK5, 1000);
                break;
            case ACTION_DONE:
                events.ScheduleEvent(EVENT_DONE, 3000);
                break;
            }
        }
        void MoveInLineOfSight(Unit* who)
        {
            if (who && who->IsInWorld() && who->GetTypeId() == TYPEID_PLAYER && !eventstarted && me->IsWithinDistInMap(who, 15.0f))
            {
                eventstarted = true;
                events.ScheduleEvent(EVENT_TALK, 8000);
            }
        }
        void DespawnCreaturesInArea(uint32 entry, WorldObject* object)
        {
            std::list<Creature*> creatures;
            GetCreatureListWithEntryInGrid(creatures, object, entry, 300.0f);
            if (creatures.empty())
                return;

            for (std::list<Creature*>::iterator iter = creatures.begin(); iter != creatures.end(); ++iter)
                (*iter)->DespawnOrUnsummon();
        }
        void UpdateAI(uint32 const diff)
        {
            events.Update(diff);

            if (Creature* voss = instance->instance->GetCreature(instance->GetData64(DATA_LILLIAN_VOSS)))
            {
                if (Creature* gandling = instance->instance->GetCreature(instance->GetData64(DATA_GANDLING_RP_2)))
                {
                    if (!gandling->HasAura(SPELL_BONE_ARMOR_2))
                        gandling->AddAura(SPELL_BONE_ARMOR_2, gandling);

                    if (uint32 eventId = events.ExecuteEvent())
                    {
                        switch (eventId)
                        {
                        case EVENT_TALK:
                            gandling->CastSpell(voss, SPELL_DRAIN_SOUL_VISUAL);
                            me->GetMotionMaster()->MovePoint(1, TalkingSkull); // move the talking skull
                            gandling->CastSpell(gandling, SPELL_GANDLING_INTRO_CHANNEL);
                            gandling->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_NOT_SELECTABLE);
                            voss->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_NOT_SELECTABLE);
                            voss->SetDisableGravity(true);
                            voss->SetHover(true);
                            gandling->SetDisableGravity(true);
                            gandling->SetHover(true);
                            voss->GetMotionMaster()->MovePoint(1, MoveCenterPosHigh.GetPositionX(), MoveCenterPosHigh.GetPositionY(), MoveCenterPosHigh.GetPositionZ());
                            gandling->CastSpell(voss, SPELL_CHAIN_LILIAN_VOSS);
                            gandling->AI()->Talk(SAY_1);
                            events.ScheduleEvent(EVENT_TALK2, 7000);
                            break;
                        case EVENT_TALK2:                      
                            voss->AI()->Talk(SAY_INTRO);
                            voss->CastSpell(voss, SPELL_LILIAN_KNEEL);
                            voss->GetMotionMaster()->MovePoint(1, MoveCenterPos);
                            voss->RemoveAura(SPELL_CHAIN_LILIAN_VOSS);
                            voss->SetDisableGravity(false);
                            events.ScheduleEvent(EVENT_TALK3, 7000);
                            break;
                        case EVENT_TALK3:                              
                            gandling->AI()->Talk(SAY_2);
                            events.ScheduleEvent(EVENT_TALK4, 8000);
                            break;                            
                        case EVENT_TALK4:
                            voss->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_NOT_SELECTABLE);
                            voss->RemoveAura(SPELL_DRAIN_SOUL_VISUAL);
                            voss->RemoveAura(112058);
                            voss->setFaction(16);
                            break;                            
                        case EVENT_TALK5:
                            gandling->AI()->Talk(SAY_10);
                            break;
                        case EVENT_TALK6:
                            gandling->CastSpell(voss, SPELL_DRAIN_SOUL_VISUAL);
                            gandling->CastSpell(voss, SPELL_CHAIN_LILIAN_VOSS);
                            voss->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
                            voss->AttackStop();
                            gandling->AI()->Talk(SAY_5);
                            voss->SetHover(true);
                            voss->SetSpeed(MOVE_FLIGHT, 0.1f);
                            voss->NearTeleportTo(MoveCenterPosHigh.GetPositionX(), MoveCenterPosHigh.GetPositionY(), MoveCenterPosHigh.GetPositionZ(), MoveCenterPosHigh.GetOrientation());
                            voss->SetFacingToObject(gandling);
                            //voss->getThreatManager().resetAllAggro();
                            events.ScheduleEvent(EVENT_TALK7, 10000);
                            break;
                        case EVENT_TALK7:
                            voss->AI()->Talk(SAY_EXTRACT);
                            voss->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
                            if (voss->GetAI())
                                voss->GetAI()->DoAction(ACTION_RESURECT);
                            break;
                        case EVENT_DONE:
                            gandling->SetDisableGravity(false);
                            gandling->SetHover(false);
                            gandling->RemoveAllAuras();
                            gandling->GetMotionMaster()->MovePoint(1, Gandlingescape);
                            gandling->AI()->Talk(SAY_9);

                            me->MonsterYell(skullend, LANG_UNIVERSAL, me->GetGUID());
                            me->GetMotionMaster()->MovePoint(1, SkullMove);
                            events.ScheduleEvent(EVENT_DONE_2, 7000);
                            break;
                        case EVENT_DONE_2:
                            gandling->CastSpell(gandling, SPELL_TELEPORT_MISC);
                            gandling->DespawnOrUnsummon(2000);
                            break;
                        case EVENT_DONE_3:
                            voss->AI()->Talk(SAY_DEATH);
                            voss->CastSpell(voss, SPELL_LILIAN_KNEEL);
                            summons.DespawnAll();
                            DespawnCreaturesInArea(CREATURE_LILIAN_SOUL, me);
                            break;
                        default:
                            break;
                        }
                    }
                }
            }
        }
    private:
        bool soulphase;
    };

    CreatureAI* GetAI(Creature* creature) const
    {
        return new controller_lilian_vossAI(creature);
    }
};
class boss_lillian_voss : public CreatureScript
{
    public:
        boss_lillian_voss() : CreatureScript("boss_lillian_voss") { }

        struct boss_lillian_vossAI : public BossAI
        {
            boss_lillian_vossAI(Creature* creature) : BossAI(creature, DATA_LILLIAN_VOSS)
            {
                Instance = creature->GetInstanceScript();
            }

            InstanceScript* Instance;

            bool hassaid75pct;

            void Reset()
            {
                _Reset();
                soulphase = false;
                me->RemoveFlag(UNIT_FIELD_FLAGS_2, UNIT_FLAG2_FEIGN_DEATH);
                me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_NOT_SELECTABLE);
                me->SetDisableGravity(true);
                me->SetHover(true);
                me->CastSpell(me, 112058);
               
                me->SetReactState(REACT_DEFENSIVE);         
                hassaid75pct = false;
            }
            void EnterCombat(Unit* who)
            {
                _EnterCombat();
                Talk(SAY_AGGRO);
                me->RemoveAura(SPELL_LILIAN_KNEEL);
                events.ScheduleEvent(EVENT_DEATHS_GRASP, 5000);
                events.ScheduleEvent(EVENT_SHADOW_SHIV, 18000);
            }
            void JustDied(Unit* killer)
            {
                _JustDied();

                me->SetHealth(me->GetMaxHealth());
                me->SetReactState(REACT_PASSIVE);
                me->setFaction(35);
                Talk(SAY_DONE);

                if (Creature* soul = instance->instance->GetCreature(instance->GetData64(DATA_LILLIAN_VOSS_SOUL)))
                {
                    soul->GetMotionMaster()->MoveJump(MoveCenterPos.GetPositionX(), MoveCenterPos.GetPositionY(), MoveCenterPos.GetPositionZ(), 10.0f, 6.0f, MoveCenterPos.GetOrientation());
                    me->GetMotionMaster()->MoveJump(MoveCenterPos.GetPositionX(), MoveCenterPos.GetPositionY(), MoveCenterPos.GetPositionZ(), 10.0f, 6.0f, MoveCenterPos.GetOrientation());

                    soul->DespawnOrUnsummon(4000);

                    if (Creature* Gandling = instance->instance->GetCreature(instance->GetData64(DATA_GANDLING_RP_2)))
                        Gandling->AI()->Talk(SAY_8);
                }

                if (Creature* controller = instance->instance->GetCreature(instance->GetData64(DATA_LILIAN_CONTROLLER)))
                        controller->GetAI()->DoAction(ACTION_DONE);

                // HANDLE LOOT
                if (me->GetMap()->IsHeroic())
                    me->SummonGameObject(GAME_OBJECT_CHEST_OF_FORGOTTEN_HEROIC, ChestPosition.GetPositionX(), ChestPosition.GetPositionY(), ChestPosition.GetPositionZ(), ChestPosition.GetOrientation(), 0, 0, 0, 0, 0);
                else
                    me->SummonGameObject(GAME_OBJECT_CHEST_OF_FORGOTTEN_NORMAL, ChestPosition.GetPositionX(), ChestPosition.GetPositionY(), ChestPosition.GetPositionZ(), ChestPosition.GetOrientation(), 0, 0, 0, 0, 0);

                instance->SetBossState(DATA_LILLIAN_VOSS, DONE);
            }
            void KilledUnit(Unit* victim)
            {
            }
            void DespawnCreaturesInArea(uint32 entry, WorldObject* object)
            {
                std::list<Creature*> creatures;
                GetCreatureListWithEntryInGrid(creatures, object, entry, 300.0f);
                if (creatures.empty())
                    return;

                for (std::list<Creature*>::iterator iter = creatures.begin(); iter != creatures.end(); ++iter)
                    (*iter)->DespawnOrUnsummon();
            }
            void DamageTaken(Unit* attacker, uint32& damage)
            {
                if (HealthBelowPct(75) && !hassaid75pct)
                {
                    hassaid75pct = true;
                    if (me->GetAI())

                        if (Creature* Gandling = instance->instance->GetCreature(instance->GetData64(DATA_GANDLING_RP_2)))
                            Gandling->AI()->Talk(SAY_4);
                }
                if(!soulphase && !me->IsNonMeleeSpellCasted(false) && HealthBelowPct(60))
                {
                    soulphase = true;
                    me->AttackStop();
                    DoCast(me, SPELL_SOUL_COSMETIC);
                    me->SetReactState(REACT_PASSIVE);
                    me->SetDisableGravity(true);
                    me->GetMotionMaster()->MovePoint(0, MoveCenterPos);

                    events.CancelEvent(EVENT_DEATHS_GRASP);
                    events.CancelEvent(EVENT_SHADOW_SHIV);

                    if (Creature* controller = instance->instance->GetCreature(instance->GetData64(DATA_LILIAN_CONTROLLER)))
                        if (controller->GetAI())
                            controller->GetAI()->DoAction(ACTION_START_PHASE2);

                    events.ScheduleEvent(EVENT_TAKE_SOUL, 9000);
                }
             }
            void DoAction(int32 const action)
            {
                if (action == ACTION_RESURECT)
                {
                    /*
                    me->RemoveFlag(UNIT_FIELD_FLAGS_2, UNIT_FLAG2_FEIGN_DEATH);
                    me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_NOT_SELECTABLE);
                    */

                        soul = me->SummonCreature(CREATURE_LILIAN_SOUL, me->GetPositionX(), me->GetPositionY(), me->GetPositionZ(), TEMPSUMMON_MANUAL_DESPAWN);
                        soul->SetDisableGravity(true);
                        soul->SetHover(true);                 

                        me->SetDisableGravity(true);
                        soul->CastSpell(soul, SPELL_LILIAN_VOSS_SOUL_PAIN);
                        me->CastSpell(soul, SPELL_BEAM_SOUL_BACK);
                        events.ScheduleEvent(EVENT_SOUL_STEAL, 1000);
                    
                }
            }
            void UpdateAI(uint32 const diff)
            {
                events.Update(diff);

                if(uint32 eventId = events.ExecuteEvent())
                {
                    switch(eventId)
                    {
                        case EVENT_DEATHS_GRASP:
                            DoCastVictim(SPELL_DEATHS_GRASP, false);
                            events.ScheduleEvent(EVENT_DEATHS_GRASP, 20000);
                            events.ScheduleEvent(EVENT_DARK_BLAZE, 3300);
                            break;
                        case EVENT_SHADOW_SHIV:
                            DoCastVictim(SPELL_SHADOW_SHIV);
                            events.ScheduleEvent(EVENT_SHADOW_SHIV, 20000);
                            break;
                        case EVENT_DARK_BLAZE:
                            Talk(SAY_SOUL_BURN);
                            DoCastAOE(SPELL_DARK_BLAZE);
                            break;
                        case EVENT_EXTRACT_SOUL:
                           // DoCast(me, SPELL_SUMMON_SOUL);
                            events.ScheduleEvent(EVENT_FAKE_DEATH, 8000);
                            break;
                        case EVENT_SOUL_STEAL:
                            soul->GetMotionMaster()->MoveBackward(0, SoulBackwards.GetPositionX(), SoulBackwards.GetPositionY(), SoulBackwards.GetPositionZ(), 0.4f);
                            events.ScheduleEvent(EVENT_SOUL_STEAL2, 7000);
                            break;
                        case EVENT_SOUL_STEAL2:
                            me->RemoveAura(SPELL_DRAIN_SOUL_VISUAL);
                            me->CastSpell(me, SPELL_SHADOW_EXPLOSION);
                            soul->CastSpell(soul, SPELL_SHADOW_EXPLOSION);
                            events.ScheduleEvent(EVENT_SOUL_STEAL3, 5000);
                            break;
                        case EVENT_SOUL_STEAL3:
                            if (Creature* Gandling = instance->instance->GetCreature(instance->GetData64(DATA_GANDLING_RP_2)))
                                Gandling->AI()->Talk(SAY_3); // YOUR SOUL IS MINE!

                            if (Creature* soul_2 = me->FindNearestCreature(CREATURE_LILIAN_SOUL, 100.0f, true))
                            {              
                                me->NearTeleportTo(me->GetPositionX(), me->GetPositionY(), MoveCenterPos.GetPositionZ(), me->GetOrientation());
                                soul_2->RemoveAllAuras();
                                soul_2->RemoveFlag(UNIT_FIELD_FLAGS_2, UNIT_FLAG2_FEIGN_DEATH);
                                soul_2->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_NOT_SELECTABLE);
                                soul_2->SetReactState(REACT_AGGRESSIVE);
                                soul_2->MonsterSay("...", LANG_UNIVERSAL, soul->GetGUID());
                                soul_2->CastSpell(soul_2, SPELL_EMOTE_POINT);
                                soul_2->setFaction(16);
                            }                     

                            me->SetFlag(UNIT_FIELD_FLAGS_2, UNIT_FLAG2_FEIGN_DEATH);
                            me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_NOT_SELECTABLE);
                            break;
                        default:
                            break;
                    }
                }
                DoMeleeAttackIfReady();
            }
        private:
            bool soulphase;
            Creature* soul;
        };

        CreatureAI* GetAI(Creature* creature) const
        {
            return new boss_lillian_vossAI(creature);
        }
};

class boss_lillian_voss_soul : public CreatureScript
{
public:
    boss_lillian_voss_soul() : CreatureScript("boss_lillian_voss_soul") { }

    struct boss_lillian_voss_soulAI : public BossAI
    {
        boss_lillian_voss_soulAI(Creature* creature) : BossAI(creature, DATA_LILLIAN_VOSS_SOUL)
        {
            Instance = creature->GetInstanceScript();
        }

        InstanceScript* Instance;

        void Reset()
        {
            me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_NOT_SELECTABLE);
            me->setFaction(35);
            me->SetReactState(REACT_PASSIVE);
//            me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_NOT_SELECTABLE);
        }
        void DoAction(int32 const action) // will be included soon (needs correct retail infos)
        {
            if (action == ACTION_GO_HOSTILE)
            {
                me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_NOT_SELECTABLE);
                me->setFaction(16);
                me->SetReactState(REACT_AGGRESSIVE);
            }
        }
        void EnterCombat(Unit* who)
        {
            _EnterCombat();
            me->SetSpeed(MOVE_RUN, 0.5f, true);
            me->SetDisableGravity(false);
            me->SetHover(false);
            me->RemoveUnitMovementFlag(MOVEMENTFLAG_ROOT);
            me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_MOVE);
            me->RemoveFlag(UNIT_FIELD_FLAGS_2, UNIT_FLAG2_DISABLE_TURN);
            events.ScheduleEvent(EVENT_FOCUS_PLAYER, 3000);

            me->RemoveAllAuras();
            me->CastSpell(me, SPELL_UNLEASH_ANGUISH);
        }
        void ResurectVoss()
        {
            if (Instance)
            {
                if (Creature* Lilian = instance->instance->GetCreature(instance->GetData64(DATA_LILLIAN_VOSS)))
                {
                    Lilian->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_NOT_SELECTABLE);
                    Lilian->RemoveFlag(UNIT_FIELD_FLAGS_2, UNIT_FLAG2_FEIGN_DEATH);
                    Lilian->CastSpell(Lilian, SPELL_DEATHS_GRASP);
                    events.ScheduleEvent(EVENT_SAY_BURN, 4000);
                    Lilian->AI()->Talk(SAY_SOUL_BURN);
                    Lilian->SetReactState(REACT_AGGRESSIVE);

                    if (Creature* gandling = me->FindNearestCreature(CREATURE_GANDLING_2, 100.0f, true))
                    gandling->AI()->Talk(SAY_7);    
                }
            }
        }
        void JustDied(Unit* killer)
        {
            me->SetHealth(me->GetMaxHealth());
            me->RemoveAllAuras();
          //  me->GetMotionMaster()->MovePoint(0, MoveCenterPos);
            me->RemoveAllAttackers();
            me->AttackStop();
            me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_NOT_SELECTABLE);
            me->InterruptNonMeleeSpells(true);
            ResurectVoss();
            me->setFaction(16);
            me->SetReactState(REACT_AGGRESSIVE);

            if (Player* player = me->FindNearestPlayer(5.0))
                me->Attack(player, true);

            if (Creature* lilian = me->FindNearestCreature(BOSS_VOSS, 100.0F, true))
            {
                lilian->RemoveAllAuras();
                lilian->SetDisableGravity(false);
                lilian->SetHover(false);
            }
            if (Creature* gandling = me->FindNearestCreature(CREATURE_GANDLING_2, 50.0f, true))
                gandling->AI()->Talk(SAY_6);
        }
        void UpdateAI(uint32 const diff)
        {
            if(!UpdateVictim())
                return;

            events.Update(diff);

            if(me->HasUnitState(UNIT_STATE_CASTING))
                return;

            if (!me->HasAura(SPELL_UNLEASH_ANGUISH))
                me->AddAura(SPELL_UNLEASH_ANGUISH, me);

            if(uint32 eventId = events.ExecuteEvent())
            {
                switch(eventId)
                {
                    case EVENT_SAY_BURN:
                        if (Creature* Lilian = instance->instance->GetCreature(instance->GetData64(DATA_LILLIAN_VOSS)))
                            Lilian->AI()->Talk(SAY_SOUL_BURN);
                    break;
                    case EVENT_FOCUS_PLAYER: // spellscript required (soon)
                        if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 50.0f, true))
                        {
                            me->AddAura(SPELL_FIXATE_ANGER, target);
                            me->Attack(target, true);
                            DoModifyThreatPercent(target, -99);
                        }
                        events.ScheduleEvent(EVENT_FOCUS_PLAYER, 10000);
                        break;
                    case EVENT_START_PHASE3:
                        me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_NOT_SELECTABLE);
                        me->SetReactState(REACT_AGGRESSIVE);
                        DoCast(me, SPELL_UNLEASH_ANGUISH);
                        ResurectVoss();
                        break;
                    default:
                        break;
                }
            }
            DoMeleeAttackIfReady();
        }
    };

    CreatureAI* GetAI(Creature* creature) const
    {
        return new boss_lillian_voss_soulAI (creature);
    }
};
class spell_lillian_grip : public SpellScriptLoader
{
    public:
        spell_lillian_grip() : SpellScriptLoader("spell_lillian_grip") { }

        class spell_lillian_grip_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_lillian_grip_SpellScript);

            bool Validate(SpellInfo const* spell)
            {
                if (!sSpellMgr->GetSpellInfo(SPELL_GRASP_GRIP))
                    return false;
                return true;
            }

            void HandleScript(SpellEffIndex effIndex)
            {
                PreventHitDefaultEffect(effIndex);
                GetHitUnit()->CastSpell(GetCaster(), SPELL_GRASP_GRIP, true);
            }

            void Register()
            {
                OnEffectHitTarget += SpellEffectFn(spell_lillian_grip_SpellScript::HandleScript, EFFECT_0, SPELL_EFFECT_SCRIPT_EFFECT);
            }
        };

        SpellScript* GetSpellScript() const
        {
            return new spell_lillian_grip_SpellScript();
        }
};

class ObjectNonPlayer
{
public:
    ObjectNonPlayer() {}
    bool operator()(WorldObject* object)
    {
        if (object->GetTypeId() != TYPEID_PLAYER)
            return true;
        else
            return false;
    }
};
class spell_blazing_soul : public SpellScriptLoader
{
public:
    spell_blazing_soul() : SpellScriptLoader("spell_blazing_soul") { }

    class spell_blazing_soul_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_blazing_soul_SpellScript);

        void CorrectTargets(std::list<WorldObject*>& targets)
        {
            if (targets.empty())
                return;

            targets.remove_if(ObjectNonPlayer());
        }

        void Register()
        {
            OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_blazing_soul_SpellScript::CorrectTargets, EFFECT_0, TARGET_UNIT_SRC_AREA_ENEMY);
        }
    };

    SpellScript* GetSpellScript() const
    {
        return new spell_blazing_soul_SpellScript();
    }
};
void AddSC_boss_lillian_voss()
{
    new controller_lilian_voss();
    new boss_lillian_voss();
    new boss_lillian_voss_soul();
    new spell_lillian_grip();
    new spell_blazing_soul();
}