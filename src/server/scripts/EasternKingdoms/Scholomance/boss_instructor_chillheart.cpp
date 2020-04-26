#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "scholomance.h"
#include "instance_scholomance.cpp"

/*
NORMAL ONLY FOR LOWBIES
HEROIC FOR LEVEL 90

DON'T FORGET THAT5
*FARTS
*/

enum ePhases
{
    PHASE_1 = 60,
    PHASE_2 = 61,
    PHASE_D = 62,
};
enum Spells
{
    // ICE WAVE
    SPELL_ICE_WAVE_BUFF = 105265, // aura for triggers
    SPELL_ICE_WAVE_EVENT_START = 111854, // cast spell to display for players
    SPELL_ICE_WAVE_DAMAGE = 105314, // modify it for normal, heroics and lowbies
};
enum Talk
{
    SAY_INTRO     = 0, // Class.. is now in session. (29455) yell 
    SAY_AGGRO     = 1, // Class dismissed! (29455) yell
    SAY_KILL      = 2, // Perhaps you should've studied more.. (29461 // 29462) yell
    SAY_EVENT_01  = 3, // Your soul cannot withstand my power (29457)
    SAY_EVENT_02  = 4, // I can never die... (29458)
    SAY_EVENT_03  = 5, // You've learned... nothing. (29459)
    SAY_DEAD = 6, // This... cannot... be! (29456)
};
enum Event
{
    EVENT_SUMMON_ICE_WALL = 10,
    EVENT_MOVEMENT_START = 11,
    EVENT_MOVEMENT_STOP = 12,
    EVENT_SUMMON_BOOKS = 13,
    EVENT_FRIGID_SPAWN = 14,
    EVENT_TOUCH_OF_THE_GRAVE = 15,
    EVENT_SPELL_WRACK_SOUL = 16,
    EVENT_ICE_WRATH = 17,
    EVENT_FIRE = 18,
    EVENT_ARCANE = 19,
    EVENT_PRE_ARCANE = 20,
    EVENT_SHADOW = 21,

};
enum Actions
{
    ACTION_PHASE_2 = 63,
    ACTION_WIPE = 64,
    ACTION_SAY_INTRO = 66,
    ACTION_DEATH = 67,
};

Position preadd[3] =
{
    { 200.30f, 30.67f, 118.961f, 4.724240f },
    { 211.29f, 21.61f, 118.626f, 3.141664f },
    { 187.77f, 21.11f, 118.845f, 0.035404f },
};

Position IceWallSpawn = { 193.41f, -18.68f, 119.225f, 1.452457 };

Position IceWallBlockage[2] = 
{
    {157.25f, 42.24f, 119.224f, 4.729829f},
    {240.51f, 42.12f, 119.228f, 4.675471f}, 
};
Position IceWallTarget = { 195.75f, 40.31f, 119.225f, 4.668602f };
Position bossposition = {200.83f, 11.01f, 119.224f, 1.607877f};
Position phylacterypos = {200.46f, 21.95f, 118.482f, 4.862535f};

// Timers
#define EVENT_SHADOW_INTERVAL 5000
#define EVENT_PRE_ARCANE_INTERVAL 10000
#define EVENT_ARCANE_BOMB 6000
#define EVENT_ARCANE_INTERVAL 5000
#define EVENT_FIRE_INTERVAL 5000
#define ICE_WRATH 20000
#define WRACK_SOUL 8000
#define TOUCH_OF_THE_GRAVE 0
#define FRIGID_SPAWN 12000
#define STOP_INTERVAL 6000
#define MOVEMENT_INTERVAL 500
#define MONSTER_TEXT_EMOTE_ICE_WALL "A deadly wave of ice begins to sweep across the room!"
#define MONSTER_TEXT_EMOTE_PHASE_2 "Instructor Chillheart soul escapes to her phylactery. Destroy it!"


#define ORIENTATION_BLOCKAGE 4.733140
#define ORIENTATION_MOVE 1.595474

class first_iron_door : public GameObjectScript
{
public:
first_iron_door() : GameObjectScript("first_iron_door") { }

    bool OnGossipHello(Player* player, GameObject* gobject)
    {
        if (InstanceScript* instance = gobject->GetInstanceScript())
        {
            if (Creature* chill = instance->instance->GetCreature(instance->GetData64(DATA_BOSS_CHILLBORN)))
                chill->AI()->Talk(SAY_INTRO);

                gobject->UseDoorOrButton();
                return true;
        }
        // always open gate incase server restart and it closes in itself so boss won't resay the sentence
        return true;
    }
};

class boss_chillheart : public CreatureScript
{
    public:
        boss_chillheart() : CreatureScript("boss_chillheart") { }

        struct boss_chillheartAI : public BossAI
        {
            boss_chillheartAI(Creature* creature) : BossAI(creature, DATA_BOSS_CHILLBORN)
            {
                Instance = creature->GetInstanceScript();
                Reset();
            }

            InstanceScript* Instance;
            std::list<Creature*> creaturesingrid;
            int32 entry = 0;
            bool hasescaped;
            int8 phase;

            void Reset()
            {
                _Reset();
                summons.DespawnAll();
                SummonAdds();
                me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
                me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
                me->RemoveUnitMovementFlag(MOVEMENTFLAG_ROOT);

                me->SetDisplayId(40301); // original display
                me->GetMotionMaster()->Clear();

                hasescaped = false;
                events.SetPhase(PHASE_1);
                phase = PHASE_1;
                me->CastSpell(me, SPELL_DARK_CHANNELING_VISUAL);

                if (!me->FindNearestCreature(CREATURE_PHYLACTERY_TRIGGER, 100.0f, true))
                    me->SummonCreature(CREATURE_PHYLACTERY_TRIGGER, phylacterypos, TEMPSUMMON_MANUAL_DESPAWN);

                me->SetReactState(REACT_PASSIVE);
         
                if (!me->FindNearestCreature(CREATURE_ICE_WALL_DEST, 200.0f, true))
                {
                    Creature* ice_wall_dest = me->SummonCreature(CREATURE_ICE_WALL_DEST, IceWallTarget.GetPositionX(), IceWallTarget.GetPositionY(), IceWallTarget.GetPositionZ(), IceWallTarget.GetOrientation(), TEMPSUMMON_MANUAL_DESPAWN);
                    ice_wall_dest->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
                    ice_wall_dest->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
                    ice_wall_dest->AddUnitMovementFlag(MOVEMENTFLAG_ROOT);
                    ice_wall_dest->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_MOVE);
                    ice_wall_dest->SetFlag(UNIT_FIELD_FLAGS_2, UNIT_FLAG2_DISABLE_TURN);
                    ice_wall_dest->setFaction(35);
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
            void SummonAdds()
            {
                if (phase == PHASE_2)
                    return;

                // Handle Phyl spawn.
                if (Creature* trigger = me->FindNearestCreature(CREATURE_PHYLACTERY_TRIGGER, 100.0f, true))
                    me->SummonCreature(CREATURE_PHYLACTERY, trigger->GetPositionX(), trigger->GetPositionY(), trigger->GetPositionZ(), trigger->GetOrientation(), TEMPSUMMON_MANUAL_DESPAWN);

                // Handle adds spawn.
                for (int i = 0; i <= 2; i++)
                {
                    entry = 0;
                    switch (urand(0, 1))
                    {
                    case 0:
                        entry = CREATURE_ACOLYTE;
                        break;
                    case 1:
                        entry = CREATURE_NEPHOLYTE;
                        break;
                    }
                    Creature* Add = me->SummonCreature(entry, preadd[i].GetPositionX(), preadd[i].GetPositionY(), preadd[i].GetPositionZ(), preadd[i].GetOrientation(), TEMPSUMMON_MANUAL_DESPAWN);

                    if (Add)
                    {
                        // visuals
                        Add->AddAura(SPELL_VISUAL_STRANGULATE_EMOTE, Add); // STRANGULATE

                        if (Creature* trigger = me->FindNearestCreature(CREATURE_PHYLACTERY, 100.0f, true))
                        {
                            Add->AddAura(SPELL_SHADOW_FORM_VISUAL, Add);
                            trigger->CastSpell(Add, SPELL_DRAIN_SOUL_VISUAL);
                            me->CastSpell(trigger, SPELL_DRAIN_SOUL_VISUAL);
                        }
                    }
                }              
              }
            void JustReachedHome()
            {
                _JustReachedHome();
                //summons.DespawnAll();
                summons.DespawnEntry(CREATURE_ICE_WALL);
           
                if (instance)
                    instance->SetBossState(DATA_BOSS_CHILLBORN, FAIL);
            }
            void EnterCombat(Unit* /*who*/)
            {
                _EnterCombat();
                Talk(SAY_AGGRO);

                events.Reset();
                //summons.DespawnAll();

                me->MonsterTextEmote(MONSTER_TEXT_EMOTE_ICE_WALL, me->GetGUID(), false);
                // Spawn ice triggers
                me->CastSpell(me, SPELL_ICE_WAVE_EVENT_START, true);
                events.ScheduleEvent(EVENT_SUMMON_ICE_WALL, 4000, 0, PHASE_1); // ice wall

				/// AnyCreatureInObjectRangeCheck doesn't exist in WoDCore need to check what to incorporate
              //  JadeCore::AnyCreatureInObjectRangeCheck check(me, 30.0F);
              //  JadeCore::CreatureListSearcher<JadeCore::AnyCreatureInObjectRangeCheck> searcher(me, creaturesingrid, check);
               // me->VisitNearbyObject(30.0F, searcher);

                if (!creaturesingrid.empty())
                {
                    for (std::list<Creature*>::const_iterator itr = creaturesingrid.begin(); itr != creaturesingrid.end(); itr++)
                    {
                        if ((*itr) && (*itr)->IsInWorld() && (*itr)->isAlive())
                            (*itr)->RemoveAura(SPELL_DRAIN_SOUL_VISUAL);
                    }
                }

                events.ScheduleEvent(EVENT_FRIGID_SPAWN, FRIGID_SPAWN, 0, PHASE_1);
                events.ScheduleEvent(EVENT_ICE_WRATH, ICE_WRATH, 0, PHASE_1);
                if (instance->instance->IsHeroic())
                    events.ScheduleEvent(EVENT_SPELL_WRACK_SOUL, WRACK_SOUL, 0,PHASE_1);

                // Summon blockages
                for (int i = 0; i <= 1; i++)
                { 
                    me->SummonGameObject(GAME_OBJECT_GHOST_GATE, IceWallBlockage[i].GetPositionX(), IceWallBlockage[i].GetPositionY(), IceWallBlockage[i].GetPositionZ(), ORIENTATION_BLOCKAGE, 0, 0, 0, 0, 0);
                    Creature* blockage = me->SummonCreature(CREATURE_ICE_WALL_BLOCKAGE, IceWallBlockage[i].GetPositionX(), IceWallBlockage[i].GetPositionY(), IceWallBlockage[i].GetPositionZ(), ORIENTATION_BLOCKAGE, TEMPSUMMON_MANUAL_DESPAWN);
                }
                std::list<Creature*> livingaddlist;

                me->GetCreatureListWithEntryInGrid(livingaddlist, CREATURE_ACOLYTE, 100.0f);
                me->GetCreatureListWithEntryInGrid(livingaddlist, CREATURE_NEPHOLYTE, 100.0f);

                if (livingaddlist.empty())
                    return;

                for (auto itr : livingaddlist)
                {
                    itr->CastSpell(me, SPELL_SUMMON_BOOKS, true); // hacing fixing the visual
                }
            }
            void JustDied(Unit* /*killer*/)
            {
                _JustDied();  
                Talk(SAY_DEAD);

                DespawnCreaturesInArea(CREATURE_BOOK, me);
                instance->SetBossState(DATA_BOSS_CHILLBORN, DONE);

                summons.DespawnAll();
            }
            void KilledUnit(Unit* victim)
            {
                if (victim && victim->GetTypeId() == TYPEID_PLAYER)
                me->Say(SAY_KILL, LANG_UNIVERSAL, me->GetGUID());
            }
            void DamageTaken(Unit* /*attacker*/, uint32& damage)
            {
                if (phase == PHASE_1)
                {
                    // boss starts passive and turns hostile upon damage
                    if (me->GetReactState() == REACT_PASSIVE)
                        me->SetReactState(REACT_AGGRESSIVE);

                    if (me->HealthBelowPct(5) && !hasescaped && me->GetAI())
                    {
                        hasescaped = true;
                        me->GetAI()->DoAction(ACTION_PHASE_2);
                    }
                }
            }
            void DoAction(int32 const action)
            {
                switch (action)
                {
                    case ACTION_DEATH:
                    {
                        summons.DespawnAll();
                        DespawnCreaturesInArea(CREATURE_BOOK, me);
                        break;
                    }
                    case ACTION_SAY_INTRO:
                    {
                        Talk(SAY_INTRO);
                        break;
                    }     
                    case ACTION_PHASE_2:
                    {
                       // if (Creature* phylactery = me->FindNearestCreature(CREATURE_PHYLACTERY, 100.0f, true))
                          me->CastSpell(me, SPELL_SUMMON_BOOKS, true);

                          events.CancelEvent(EVENT_FRIGID_SPAWN);
                          events.CancelEvent(EVENT_ICE_WRATH);
     
                         me->MonsterTextEmote(MONSTER_TEXT_EMOTE_PHASE_2, me->GetGUID(), true);

                        me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
                        me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
                        me->AddUnitMovementFlag(MOVEMENTFLAG_ROOT);
                        me->SetReactState(REACT_PASSIVE);

                        me->AddUnitState(UNIT_STATE_CANNOT_AUTOATTACK);
                        
                        if (Creature* trigger_phy = me->FindNearestCreature(CREATURE_PHYLACTERY_TRIGGER, 100.0f, true))
                        {
                            me->NearTeleportTo(trigger_phy->GetPositionX(), trigger_phy->GetPositionY(), trigger_phy->GetPositionZ(), me->GetOrientation());
                            me->RemoveAllAuras();
                            trigger_phy->CastSpell(trigger_phy, SPELL_PHYLACTERY_FILL);
                        }
                        if (Creature* phy = me->FindNearestCreature(CREATURE_PHYLACTERY, 100.0f, true))
                        {
                            phy->setFaction(16);
                        }

                        Talk(SAY_EVENT_02);

                        summons.DespawnEntry(CREATURE_ICE_WALL);
                        events.SetPhase(PHASE_2);
                        phase = PHASE_2;            
                        me->SetDisplayId(11686); // invis
                        break;
                    }
                }
            }
            void UpdateAI(uint32 const diff)
            {
                if(!UpdateVictim())
                    return;

                events.Update(diff);     

                if (me->HasUnitState(UNIT_STATE_CASTING) && phase != 2)
                    return;

                if (!me->HasAura(SPELL_TOUCH_OF_THE_GRAVE))
                    me->CastSpell(me, SPELL_TOUCH_OF_THE_GRAVE);

                if(uint32 eventId = events.ExecuteEvent())
                {
                    switch(eventId)
                    {
                        case EVENT_SUMMON_ICE_WALL:
                        {
                            me->SummonCreature(CREATURE_ICE_WALL, IceWallSpawn.GetPositionX(), IceWallSpawn.GetPositionY(), IceWallSpawn.GetPositionZ(), IceWallSpawn.GetOrientation(), TEMPSUMMON_MANUAL_DESPAWN);
                            break;
                        }
                        case EVENT_SPELL_WRACK_SOUL:
                        {
                            if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 50.0f, true))
                                me->CastSpell(target, SPELL_WRACK_SOUL);
                            break;
                        }
                        case EVENT_FRIGID_SPAWN:
                        {
                            Position pos;

                            if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 50.0f, true))
                                target->GetPosition(&pos);

                            if (Creature* frigid_spawn_Trigger = me->SummonCreature(CREATRUE_FRIGID_GRASP, pos.GetPositionX(), pos.GetPositionY(), pos.GetPositionZ(), pos.GetOrientation(), TEMPSUMMON_TIMED_DESPAWN, 4000))
                            {
                                frigid_spawn_Trigger->CastSpell(frigid_spawn_Trigger, SPELL_FRIGID_GRASP);

                                frigid_spawn_Trigger->AddUnitMovementFlag(MOVEMENTFLAG_ROOT);
                                frigid_spawn_Trigger->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_MOVE);
                                frigid_spawn_Trigger->SetFlag(UNIT_FIELD_FLAGS_2, UNIT_FLAG2_DISABLE_TURN);
                                frigid_spawn_Trigger->SetReactState(REACT_PASSIVE);

                                frigid_spawn_Trigger->setFaction(16);
                            }

                            events.ScheduleEvent(EVENT_FRIGID_SPAWN, FRIGID_SPAWN, 0, PHASE_1);
                            break;
                        }
                        case EVENT_ICE_WRATH:
                        {
                            if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 50.0f, true))
                            {
                                me->CastSpell(target, SPELL_ICE_WRATH);
                                
                                if (target->HasAura(SPELL_ICE_WRATH_DAMAGE))
                                {
                                    Aura* aura = target->GetAura(SPELL_ICE_WRATH_DAMAGE);

                                    if (aura)
                                    {
                                        aura->SetDuration(10 * IN_MILLISECONDS);
                                    }
                                }
                            }

                            events.ScheduleEvent(EVENT_ICE_WRATH, ICE_WRATH, 0, PHASE_1);
                            break;
                        }

                    }
                }
                DoMeleeAttackIfReady();
            }
        private:
            bool soulphase;
        };

        CreatureAI* GetAI(Creature* creature) const
        {
            return new boss_chillheartAI(creature);
        }
};
class trigger_ice_wall_move : public CreatureScript
{
public:
    trigger_ice_wall_move() : CreatureScript("trigger_ice_wall_move") { }

    struct trigger_ice_wallAI : public ScriptedAI
    {
        trigger_ice_wallAI(Creature* creature) : ScriptedAI(creature)
        {
            Instance = creature->GetInstanceScript();
        }

        InstanceScript* Instance;

        void Reset()
        {
            me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
            me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
            me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_NPC);
            me->GetMotionMaster()->Clear();
            me->SetReactState(REACT_PASSIVE);
       
            me->SetFacingTo(ORIENTATION_BLOCKAGE);
            me->CastSpell(me, SPELL_ICE_WALL_BOSS_FIGHT);
            events.ScheduleEvent(50, 6000);
        }
        void UpdateAI(uint32 const diff)
        {
            events.Update(diff);

            if (uint32 eventId = events.ExecuteEvent())
            {
                switch (eventId)
                {
                    case 50:
                        if (Creature* targethome = me->FindNearestCreature(CREATURE_ICE_WALL_DEST, 200.0f, true))
                        me->GetMotionMaster()->MovePoint(1, targethome->GetPositionX(), targethome->GetPositionY(), targethome->GetPositionZ());  

                        events.ScheduleEvent(51, 1000);
                        break; 
                   case 51:  
                       me->GetMotionMaster()->MovePoint(1, me->GetPositionX(), me->GetPositionY(), me->GetPositionZ());
                           
                        Creature* trigger_drop = me->SummonCreature(CREATURE_ICE_WALL_DROP, me->GetPositionX(), me->GetPositionY(), me->GetPositionZ(), ORIENTATION_MOVE, TEMPSUMMON_TIMED_DESPAWN, 6000);
                        trigger_drop->CastSpell(trigger_drop, SPELL_ICE_WALL_BOSS_FIGHT);
                        

                        me->AddUnitMovementFlag(MOVEMENTFLAG_ROOT);
                        me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_MOVE);
                        me->SetFlag(UNIT_FIELD_FLAGS_2, UNIT_FLAG2_DISABLE_TURN);
                        events.ScheduleEvent(50, 6000);
                       break;
                }
            }
        }
    };

    CreatureAI* GetAI(Creature* creature) const
    {
        return new trigger_ice_wallAI(creature);
    }
};

class trigger_ice_wall_blockage : public CreatureScript
{
public:
    trigger_ice_wall_blockage() : CreatureScript("trigger_ice_wall_blockage") { }

    struct trigger_ice_wall_blockageAI : public Scripted_NoMovementAI
    {
        trigger_ice_wall_blockageAI(Creature* creature) : Scripted_NoMovementAI(creature)
        {
            Instance = creature->GetInstanceScript();
        }

        InstanceScript* Instance;

        void Reset()
        {
            me->AddUnitMovementFlag(MOVEMENTFLAG_ROOT);
            me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_MOVE);
            me->SetFlag(UNIT_FIELD_FLAGS_2, UNIT_FLAG2_DISABLE_TURN);
            me->CastSpell(me, SPELL_ICE_WALL_BOSS_BLOCKAGE);

            if (Aura* aur = me->GetAura(SPELL_ICE_WALL_BOSS_BLOCKAGE))
                aur->SetDuration(90000000);
        }
        void UpdateAI(uint32 const diff)
        {
            if (!UpdateVictim())
                return;

            events.Update(diff);
        }
    private:
        EventMap events;
    };

    CreatureAI* GetAI(Creature* creature) const
    {
        return new trigger_ice_wall_blockageAI(creature);
    }
};

class trigger_ice_wall_drop : public CreatureScript
{
public:
    trigger_ice_wall_drop() : CreatureScript("trigger_ice_wall_blockage") { }

    struct trigger_ice_wall_dropAI : public ScriptedAI
    {
        trigger_ice_wall_dropAI(Creature* creature) : ScriptedAI(creature)
        {
            Instance = creature->GetInstanceScript();
        }

        InstanceScript* Instance;

        void Reset()
        {
            me->CastSpell(me, SPELL_ICE_WALL_BOSS_FIGHT);
            me->AddUnitMovementFlag(MOVEMENTFLAG_ROOT);
            me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_MOVE);
            me->SetFlag(UNIT_FIELD_FLAGS_2, UNIT_FLAG2_DISABLE_TURN);
            me->CastSpell(me, SPELL_ICE_WALL_BOSS_BLOCKAGE);

            if (Aura* aur = me->GetAura(SPELL_ICE_WALL_BOSS_BLOCKAGE))
                aur->SetDuration(90000000);
        }
        void UpdateAI(uint32 const diff)
        {
            if (!UpdateVictim())
                return;

            events.Update(diff);
        }
    private:
        EventMap events;
    };

    CreatureAI* GetAI(Creature* creature) const
    {
        return new trigger_ice_wall_dropAI(creature);
    }
};
class trigger_book : public CreatureScript
{
public:
    trigger_book() : CreatureScript("trigger_book") { }

    struct trigger_bookAI : public CreatureAI
    {
        trigger_bookAI(Creature* creature) : CreatureAI(creature)
        {
            Instance = creature->GetInstanceScript();
        }

        InstanceScript* Instance;

        void Reset()
        {
            me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
            me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
            me->GetMotionMaster()->Clear();
            me->setFaction(16);

            switch (urand(0, 2))
            {
            case 0:
                events.ScheduleEvent(EVENT_FIRE, EVENT_FIRE_INTERVAL);
                break;
            case 1:
                events.ScheduleEvent(EVENT_ARCANE, EVENT_ARCANE_INTERVAL);
                break;
            case 2:
                events.ScheduleEvent(EVENT_SHADOW, EVENT_SHADOW_INTERVAL);
                break;
            }

            me->SetSpeed(MOVE_RUN, 0.5f);
            events.ScheduleEvent(EVENT_MOVEMENT_START, 1000);
        }
        void UpdateAI(uint32 const diff)
        {
            events.Update(diff);
         
            if (!me->IsMoving() && !me->HasUnitState(UNIT_STATE_CASTING) && !me->HasAura(SPELL_ARCANE_BOMB_VISUAL_MOVING_RITUAL))
                events.ScheduleEvent(EVENT_MOVEMENT_START, 7000);

            if (me->GetSpeed(MOVE_RUN) > 0.5)
                me->SetSpeed(MOVE_RUN, 0.5f);

            me->SetDisableGravity(true);

            if (uint32 eventId = events.ExecuteEvent())
            {
                switch (eventId)
                {
                case EVENT_MOVEMENT_START:
                    Position pos;

                    me->GetRandomNearPosition(pos, 50.0f);//me->GetMotionMaster()->MoveRandom(50.0f);

                    me->GetMotionMaster()->MovePoint(1, pos.GetPositionX(), pos.GetPositionY(), 124.243f);
                    break;
                case EVENT_ARCANE:
                    me->CastSpell(me, SPELL_ARCANE_BOMB_CAST_HANDLER);

                    me->RemoveAura(SPELL_ARCANE_BOMB_VISUAL_MOVING_RITUAL); 
                      
                    me->RemoveUnitMovementFlag(MOVEMENTFLAG_ROOT);
                    me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_MOVE);

                    events.ScheduleEvent(EVENT_MOVEMENT_START, 4000);
                    events.ScheduleEvent(EVENT_PRE_ARCANE, EVENT_ARCANE_INTERVAL);
                    break;
                case EVENT_PRE_ARCANE:
                    me->SetUnitMovementFlags(MOVEMENTFLAG_ROOT);
                    me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_MOVE);

                    me->SetDisplayId(CREATURE_THE_ARNARCHIST_ARCANIST_DISPLAY);

                    me->CastSpell(me, SPELL_ARCANE_BOMB_VISUAL_MOVING_RITUAL);
                    events.ScheduleEvent(EVENT_ARCANE, EVENT_PRE_ARCANE_INTERVAL);
                    break;
                case EVENT_FIRE:
                    me->CastSpell(me, SPELL_FIRE_TOME);

                    me->SetDisplayId(CREATURE_ANTONIAS_SELF_HELP_GUIDE_TO_STANDING_IN_FIRE_DISPLAY);
                    break;
                case EVENT_SHADOW:
                    if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 100.0f, true))
                        me->CastSpell(target, SPELL_SHADOW_BOLT_BOOK, true);

                    me->SetDisplayId(CREATURE_WANDERS_COLOSSAL_BOOK_OF_SHADOW_PUPPETS_DISPLAY);
     
                    events.ScheduleEvent(EVENT_SHADOW, EVENT_SHADOW_INTERVAL);
                    break;
                }
            }
        }
    private:
        EventMap events;
    };

    CreatureAI* GetAI(Creature* creature) const
    {
        return new trigger_bookAI(creature);
    }
};

class creature_phylactry : public CreatureScript
{
public:
    creature_phylactry() : CreatureScript("creature_phylactry") { }

    struct creature_phylactryAI : public Scripted_NoMovementAI
    {
        creature_phylactryAI(Creature* creature) : Scripted_NoMovementAI(creature)
        {
            Instance = creature->GetInstanceScript();
        }

        InstanceScript* Instance;

        void Reset()
        {
            me->AddUnitMovementFlag(MOVEMENTFLAG_ROOT);
            me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_MOVE);
            me->SetFlag(UNIT_FIELD_FLAGS_2, UNIT_FLAG2_DISABLE_TURN);
            me->SetReactState(REACT_PASSIVE);
            me->setFaction(35);
        }
        void JustDied(Unit* killer)
        {
           // if (Creature* boss = me->FindNearestCreature(BOSS_CHILLHEART, 200.0f, true))
           // {
           // if (Creature* boss = Instance->instance->GetCreature(Instance->GetData64(BOSS_CHILLHEART)))
           // {
            if (TempSummon* tempo = me->ToTempSummon())
            {
                if (Creature* boss = tempo->GetSummoner()->ToCreature())
                {
                    me->Kill(boss);
                    boss->DespawnOrUnsummon(6000);
                    if (boss->GetAI())
                        boss->GetAI()->DoAction(ACTION_DEATH);
                }
            }
        }
        void UpdateAI(uint32 const diff)
        {
            if (!UpdateVictim())
                return;

            events.Update(diff);
        }
    private:
        EventMap events;
    };

    CreatureAI* GetAI(Creature* creature) const
    {
        return new creature_phylactryAI(creature);
    }
};
class trigger_arcane_bomb : public CreatureScript
{
public:
    trigger_arcane_bomb() : CreatureScript("trigger_arcane_bomb") { }

    struct trigger_arcane_bombAI : public Scripted_NoMovementAI
    {
        trigger_arcane_bombAI(Creature* creature) : Scripted_NoMovementAI(creature)
        {
            Instance = creature->GetInstanceScript();
        }

        InstanceScript* Instance;

        void Reset()
        {
            me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
            me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
            me->GetMotionMaster()->Clear();
            me->SetReactState(REACT_PASSIVE);
            me->setFaction(16);

            me->CastSpell(me, SPELL_ARCANE_BOMB_VISUAL_TURNING_RITUAL);

            events.ScheduleEvent(EVENT_ARCANE, EVENT_ARCANE_BOMB);
        }
        void UpdateAI(uint32 const diff)
        {
            events.Update(diff);

            if (uint32 eventId = events.ExecuteEvent())
            {
                switch (eventId)
                {
                case EVENT_ARCANE:
                    me->CastSpell(me, SPELL_ARCANE_BOMB_EXPLOSION);
                    me->DespawnOrUnsummon(2000);
                    break;
                }
            }
        }
    private:
        EventMap events;
    };

    CreatureAI* GetAI(Creature* creature) const
    {
        return new trigger_arcane_bombAI(creature);
    }
};
class bDropNonPlayers
{
public:
    explicit bDropNonPlayers(WorldObject* _caster) : caster(_caster) { }
    bool operator() (WorldObject* unit)
    {
        if (unit->GetTypeId() == TYPEID_PLAYER)
            return false;

        return true;
    }
private:
    WorldObject* caster;
};

class spell_frigid_grasp : public SpellScriptLoader
{
public:
    spell_frigid_grasp() : SpellScriptLoader("spell_frigid_grasp") { }

    class spell_frigid_grasp_spellscript : public SpellScript
    {
        PrepareSpellScript(spell_frigid_grasp_spellscript);

        void CheckTargetCount(std::list<WorldObject*>& targets)
        {
            if (targets.empty())
                return;

            if (!GetCaster())
                return;

            targets.remove_if(bDropNonPlayers(GetCaster()));
        }
        void Register()
        {
            OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_frigid_grasp_spellscript::CheckTargetCount, EFFECT_0, TARGET_UNIT_DEST_AREA_ENEMY);
        }
    };

    SpellScript* GetSpellScript() const
    {
        return new spell_frigid_grasp_spellscript();
    }
};

class aura_wrack_soul : public SpellScriptLoader
{
public:
    aura_wrack_soul() : SpellScriptLoader("aura_wrack_soul") { }

    class aura_wrack_soul_script : public AuraScript
    {
        PrepareAuraScript(aura_wrack_soul_script)

            void OnRemove(const AuraEffect* aurEff, AuraEffectHandleModes mode)
            {
                if (Unit* caster = GetCaster())
                {
                    if (Player* target = GetTarget()->ToPlayer())
                    {
                        target->CastSpell(target, SPELL_WRACK_SOUL_UNKNOWN); // dummy
                    }
                }
            }

            void Register()
            {
                OnEffectRemove += AuraEffectRemoveFn(aura_wrack_soul_script::OnRemove, EFFECT_0, SPELL_AURA_PERIODIC_DAMAGE, AURA_EFFECT_HANDLE_REAL);
            }
        };

        AuraScript* GetAuraScript() const
        {
            return new aura_wrack_soul_script();
        }
    };

// Cosmetic, also responsible for book summoning
class spell_wrack_soul : public SpellScriptLoader
{
public:
    spell_wrack_soul() : SpellScriptLoader("spell_wrack_soul") { }

    class spell_wrack_soul_spell_script : public SpellScript
    {
        PrepareSpellScript(spell_wrack_soul_spell_script);

        void CheckTargetCount(std::list<WorldObject*>& targets)
        {
            if (targets.empty())
                return;

            if (!GetCaster())
                return;

            targets.remove(GetCaster());
        }
        void HandleDummy(SpellEffIndex effIndex)
        {
            PreventHitDefaultEffect(effIndex);

            if (GetExplTargetUnit() && GetCaster())
            {
                GetExplTargetUnit()->AddAura(111631, GetExplTargetUnit());
            }
        }

        void Register()
        {
            OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_wrack_soul_spell_script::CheckTargetCount, EFFECT_0, TARGET_UNIT_SRC_AREA_PARTY);
            OnEffectHitTarget += SpellEffectFn(spell_wrack_soul_spell_script::HandleDummy, EFFECT_0, SPELL_EFFECT_DUMMY);
        }
    };

    SpellScript* GetSpellScript() const
    {
        return new spell_wrack_soul_spell_script();
    }
};

class spell_burn_tome : public SpellScriptLoader
{
public:
    spell_burn_tome() : SpellScriptLoader("spell_burn_tome") { }

    class spell_burn_tome_aura_script : public AuraScript
    {
        PrepareAuraScript(spell_burn_tome_aura_script);

        void DamagePeriodTimer(AuraEffect* aurEff)
        {
            if (GetCaster())
            {
                std::list<Player*> pl_list;

                GetPlayerListInGrid(pl_list, GetCaster(), 5.0f /*radius*/);

                for (auto itr : pl_list)
                {
                    if (!itr->HasAura(SPELL_FIRE_BURN))
                        itr->CastSpell(itr, SPELL_FIRE_BURN);
                }
            }
        }

        void Register()
        {
            OnEffectUpdatePeriodic += AuraEffectUpdatePeriodicFn(spell_burn_tome_aura_script::DamagePeriodTimer, EFFECT_0, SPELL_AURA_PERIODIC_TRIGGER_SPELL);
        }
    };

    AuraScript* GetAuraScript() const
    {
        return new spell_burn_tome_aura_script();
    }
};
// Cosmetic, also responsible for book summoning
class spell_summon_books : public SpellScriptLoader
{
public:
    spell_summon_books() : SpellScriptLoader("spell_summon_books") { }

    class spell_summon_books_spell_script : public SpellScript
    {
        PrepareSpellScript(spell_summon_books_spell_script);

        void CheckTargetCount(std::list<WorldObject*>& targets)
        {
            if (targets.empty())
                return;

            if (!GetCaster())
                return;

            if (InstanceScript* Instance = GetCaster()->GetInstanceScript())
            {
                // include a hack for visuals.
                if (GetCaster()->GetEntry() == BOSS_CHILLHEART || GetCaster()->GetTypeId() == TYPEID_PLAYER)
                {
                    targets.clear();

                    std::list<Creature*> book_summon_triggers;

                    GetCaster()->GetCreatureListWithEntryInGrid(book_summon_triggers, CREATURE_BOOK_TRIGGER_TARGET, 150.0f);

                    if (book_summon_triggers.empty())
                        return;

                    for (auto itr : book_summon_triggers)
                    {
                        targets.push_back(itr);
                    }
                }
                else
                {
                    targets.clear();

                    // if (Creature* chillheart = GetCaster()->FindNearestCreature(BOSS_CHILLHEART, 100.0f, true))
                    if (Creature* boss = Instance->instance->GetCreature(Instance->GetData64(DATA_BOSS_CHILLBORN)))
                        targets.push_back(boss);
                }
            }
        }
        void HandleDummy(SpellEffIndex effIndex)
        {
            PreventHitDefaultEffect(effIndex);
            
            if (GetHitUnit() && GetCaster()) 
            {
                if (GetCaster()->GetEntry() == CREATURE_ACOLYTE || GetCaster()->GetEntry() == CREATURE_NEPHOLYTE)
                    GetHitUnit()->Kill(GetCaster());

                if (GetHitUnit()->GetEntry() != BOSS_CHILLHEART)
                Creature* book = GetCaster()->SummonCreature(CREATURE_BOOK, GetHitUnit()->GetPositionX(), GetHitUnit()->GetPositionY(), GetHitUnit()->GetPositionZ(), GetHitUnit()->GetOrientation(), TEMPSUMMON_MANUAL_DESPAWN);
            }
        }

        void Register()
        {
            OnEffectHitTarget += SpellEffectFn(spell_summon_books_spell_script::HandleDummy, EFFECT_0, SPELL_EFFECT_DUMMY);
            OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_summon_books_spell_script::CheckTargetCount, EFFECT_0, TARGET_UNIT_SRC_AREA_ENTRY);
        }
    };

    SpellScript* GetSpellScript() const
    {
        return new spell_summon_books_spell_script();
    }
};
class spell_arcane_bomb : public SpellScriptLoader
{
public:
    spell_arcane_bomb() : SpellScriptLoader("spell_arcane_bomb") { }

    class spell_arcane_bomb_spell_script : public SpellScript
    {
        PrepareSpellScript(spell_arcane_bomb_spell_script);

        void HandleForceCast(SpellEffIndex /*effIndex*/)
        {
            if (GetCaster())
            {
                if (GetCaster()->HasAura(SPELL_ARCANE_BOMB_VISUAL_MOVING_RITUAL))
                    GetCaster()->RemoveAura(SPELL_ARCANE_BOMB_VISUAL_MOVING_RITUAL);

                GetCaster()->CastSpell(GetCaster(), SPELL_ARCANE_BOMB_SUMMON, true);
            }
        }

        void Register()
        {
            OnEffectHitTarget += SpellEffectFn(spell_arcane_bomb_spell_script::HandleForceCast, EFFECT_0, SPELL_EFFECT_FORCE_CAST);
        }

    };
    SpellScript* GetSpellScript() const
    {
        return new spell_arcane_bomb_spell_script();
    }
};

void AddSC_boss_chillheartAI()
{
    // boss
    new boss_chillheart();
    new creature_phylactry();
    // gob
    new first_iron_door();
    // spells
    new spell_frigid_grasp();
    new spell_wrack_soul();
    new spell_burn_tome();
    new spell_arcane_bomb();
    new spell_summon_books();
    new aura_wrack_soul();
    // triggers
    new trigger_ice_wall_drop();
    new trigger_arcane_bomb();
    new trigger_ice_wall_blockage();
    new trigger_ice_wall_move();
    new trigger_book();
}