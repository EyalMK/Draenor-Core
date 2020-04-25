#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "scholomance.h"
//#include "instance_scholomance.cpp"

enum EePhases
{
    PHASE_1 = 60,
    PHASE_2 = 61,
    PHASE_D = 62,
};
enum ETalk
{
    SAY_INTRO = 0, // If you haven't come to study, I will use you to teach a lesson! (27496) yell 
    SAY_AGGRO = 1, // School is in session.. (27477) yell
    SAY_KILL = 2, // Dance.. (27497) yell
    SAY_DEAD = 3, // Class... dismissed. (27478)
};
enum EEvent
{
    EVENT_CAST_INCINERATE = 1543,
    EVENT_CAST_IMMOLATE = 1544,
    EVENT_CAST_HARSH_WORD = 1545,
    EVENT_RISE = 1546,
    EVENT_OPEN_GATE = 1547,
    EVENT_SUMMON_ZOMBIES = 1548,
};
enum EActions
{
    ACTION_ROOM_1 = 500,
    ACTION_ROOM_2 = 501,
    ACTION_ROOM_3 = 502,
};

#define riseinterval 40000
#define harshwordinterval 60000
#define immolate 14000
#define incinerate urand(4000, 6000)


Position room_1 = { 31.15f, -26.91f, 73.534f, 1.629950f };
Position room_2 = { -56.56f, 57.96f, 69.057f, 6.252017f };
Position room_3 = { 31.01f, 131.94f, 73.654f, 4.720931f };
Position startposition = { 56.01f, 58.44f, 87.128f, 3.148135f };
Position firecosmetic = { 23.17f, 57.47f, 86.590f, 0.051275f };

#define HarshWordMsg "Darkmaster gandling assigns a player a |cffff0000[Harsh Word]|cfffaeb00!"

class boss_gandling : public CreatureScript
{
public:
    boss_gandling() : CreatureScript("boss_gandling") { }

    struct boss_gandlingAI : public BossAI
    {
        boss_gandlingAI(Creature* creature) : BossAI(creature, DATA_BOSS_GANDLING)
        {
            Instance = creature->GetInstanceScript();
        }

        InstanceScript* Instance;
        Player* target_harsh_word = NULL;
        Position pos;

        void Reset()
        {
            _Reset();
            summons.DespawnAll();

            me->CastSpell(me, 21389);

            me->AddUnitMovementFlag(MOVEMENTFLAG_ROOT);
            me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_MOVE);
            me->SetFlag(UNIT_FIELD_FLAGS_2, UNIT_FLAG2_DISABLE_TURN);

            // handle fire channel
            Creature* fire_cosmetic = me->SummonCreature(CREATURE_GANDLING_FIRE_COSMETIC, firecosmetic, TEMPSUMMON_MANUAL_DESPAWN);
            fire_cosmetic->CastSpell(fire_cosmetic, SPELL_FIRE_COSMETIC);

            /*
            std::list<Player*> playerlist;
            me->GetPlayerListInGrid(playerlist, 200.0f);

            for (auto itr : playerlist)
            {
            if (itr->isDead() && itr->IsWithinDistInMap(me, 30.0f, true))
            itr->NearTeleportTo(startposition.GetPositionX(), startposition.GetPositionY(), startposition.GetPositionZ(), startposition.GetOrientation());
            }
            */
        }
        void JustReachedHome()
        {
            _JustReachedHome();

            if (instance)
                instance->SetBossState(DATA_BOSS_GANDLING, FAIL);
        }
        void EnterCombat(Unit* /*who*/)
        {
            _EnterCombat();
            Talk(SAY_AGGRO);

            summons.DespawnEntry(CREATURE_GANDLING_FIRE_COSMETIC);

            events.ScheduleEvent(EVENT_RISE, riseinterval);
            events.ScheduleEvent(EVENT_CAST_INCINERATE, incinerate);
            events.ScheduleEvent(EVENT_CAST_IMMOLATE, immolate);
            events.ScheduleEvent(EVENT_CAST_HARSH_WORD, harshwordinterval);
        }
        void JustDied(Unit* /*killer*/)
        {
            _JustDied();
            Talk(SAY_DEAD);

            instance->SetBossState(DATA_BOSS_GANDLING, DONE);
            summons.DespawnAll();
        }
        void KilledUnit(Unit* victim)
        {
            if (victim && victim->GetTypeId() == TYPEID_PLAYER)
                Talk(SAY_KILL);
        }
        void DoAction(int32 const action)
        {
            switch (action)
            {
            case ACTION_ROOM_1:
                events.ScheduleEvent(EVENT_SUMMON_ZOMBIES, 4000);
                break;
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
                case EVENT_SUMMON_ZOMBIES:
                {
                    if (target_harsh_word == NULL)
                        return;

                    for (int i = 0; i <= 4; i++)
                    {
                        target_harsh_word->GetRandomNearPosition(pos, 15.0f); // expired test subjects
                        Creature* zombies = target_harsh_word->SummonCreature(59100, pos, TEMPSUMMON_DEAD_DESPAWN);
                        zombies->Attack(target_harsh_word, true);

                        events.ScheduleEvent(EVENT_OPEN_GATE, 30000);
                    }
                    for (int i = 0; i <= 4; i++) // fresh test subjects
                    {

                        target_harsh_word->GetRandomNearPosition(pos, 15.0f);
                        Creature* zombies = target_harsh_word->SummonCreature(59099, pos, TEMPSUMMON_DEAD_DESPAWN);
                        zombies->setFaction(35);
                        zombies->CastSpell(zombies, 113280); // explosion aura
                        zombies->Attack(target_harsh_word, true);

                        events.ScheduleEvent(EVENT_OPEN_GATE, 30000);
                    }
                    break;
                }
                case EVENT_RISE:
                    me->CastSpell(me, SPELL_RISE);
                    events.ScheduleEvent(EVENT_RISE, riseinterval);
                    break;
                case EVENT_CAST_IMMOLATE:
                    if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 50.0f, true))
                        me->CastSpell(target, SPELL_IMMOLATE);
                    events.ScheduleEvent(EVENT_CAST_IMMOLATE, immolate);
                    break;
                case EVENT_CAST_INCINERATE:
                    me->CastSpell(me->getVictim(), SPELL_INCINERATE);
                    events.ScheduleEvent(EVENT_CAST_INCINERATE, incinerate);
                    break;
                case EVENT_CAST_HARSH_WORD:
                {
                    std::list<GameObject*> gobs;

                    me->GetGameObjectListWithEntryInGrid(gobs, GAME_OBJECT_DOOR, 200.0f);

                    for (auto itr : gobs)
                    {
                        itr->UseDoorOrButton();
                    }

                    if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 50.0f, true))
                    {
                        target_harsh_word = target->ToPlayer();
                        me->CastSpell(target, SPELL_HARSH_LESSON);
                        events.ScheduleEvent(EVENT_CAST_HARSH_WORD, harshwordinterval);
                    }
                    break;
                }
                case EVENT_OPEN_GATE:
                {

                    std::list<GameObject*> gobs;

                    me->GetGameObjectListWithEntryInGrid(gobs, GAME_OBJECT_DOOR, 200.0f);

                    for (auto itr : gobs)
                    {
                        itr->UseDoorOrButton(time(NULL) + 12000);
                    }
                    break;
                }

                }
                DoMeleeAttackIfReady();
            }
        }
    };

    CreatureAI* GetAI(Creature* creature) const
    {
        return new boss_gandlingAI(creature);
    }
};
/*
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (59099, 0, 0, 0, 0, 0, '113280');
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `difficulty_entry_4`, `difficulty_entry_5`, `difficulty_entry_6`, `difficulty_entry_7`, `difficulty_entry_8`, `difficulty_entry_9`, `difficulty_entry_10`, `difficulty_entry_11`, `difficulty_entry_12`, `difficulty_entry_13`, `difficulty_entry_14`, `difficulty_entry_15`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `exp_unk`, `faction_A`, `faction_H`, `faction`, `npcflag`, `npcflag2`, `unitflags2`, `speed_walk`, `speed_run`, `speed_fly`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `type_flags2`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `Health_mod`, `Mana_mod`, `Mana_mod_extra`, `Armor_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `WDBVerified`) VALUES (59099, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 44922, 44920, 44918, 44919, 'Fresh test subjects', '', '', 0, 90, 90, 4, 0, 35, 35, 35, 0, 0, 0, 1, 1.14286, 1.14286, 1, 0, 1, 2, 0, 1, 1, 2000, 2000, 4, 32768, 0, 0, 0, 0, 0, 0, 0, 1, 2, 1, 2, 4172, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 1, 5, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 'mob_scholomance_fresh_test_subject', 19342);
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (113280, 'spell_explosion');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (113312, 'spell_remove_players_explosion');

// lilian blaze fire
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (58780, 0, 0, 0, 0, 0, '111587');
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `difficulty_entry_4`, `difficulty_entry_5`, `difficulty_entry_6`, `difficulty_entry_7`, `difficulty_entry_8`, `difficulty_entry_9`, `difficulty_entry_10`, `difficulty_entry_11`, `difficulty_entry_12`, `difficulty_entry_13`, `difficulty_entry_14`, `difficulty_entry_15`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `exp_unk`, `faction_A`, `faction_H`, `faction`, `npcflag`, `npcflag2`, `unitflags2`, `speed_walk`, `speed_run`, `speed_fly`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `type_flags2`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `Health_mod`, `Mana_mod`, `Mana_mod_extra`, `Armor_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `WDBVerified`) VALUES (58780, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11686, 0, 0, 0, 'Brasier sombre', '', '', 0, 92, 92, 4, 0, 35, 35, 14, 0, 0, 0, 2, 1.71429, 1.14286, 1, 0, 1, 2, 0, 1, 1, 2000, 2000, 1, 1074790400, 0, 0, 0, 0, 0, 0, 0, 1, 2, 1, 10, 1074790400, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 111587, 111628, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 128, '', 19342);

// boneweavers skull
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `difficulty_entry_4`, `difficulty_entry_5`, `difficulty_entry_6`, `difficulty_entry_7`, `difficulty_entry_8`, `difficulty_entry_9`, `difficulty_entry_10`, `difficulty_entry_11`, `difficulty_entry_12`, `difficulty_entry_13`, `difficulty_entry_14`, `difficulty_entry_15`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `exp_unk`, `faction_A`, `faction_H`, `faction`, `npcflag`, `npcflag2`, `unitflags2`, `speed_walk`, `speed_run`, `speed_fly`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `type_flags2`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `Health_mod`, `Mana_mod`, `Mana_mod_extra`, `Armor_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `WDBVerified`) VALUES (59304, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 40678, 0, 0, 0, 'Bone Pile', '', '', 0, 90, 90, 4, 0, 35, 35, 35, 1, 1, 0, 1, 1, 1.14286, 1, 0, 1, 2, 0, 1, 1, 2000, 2000, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 1, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 113995, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 'mob_scholomance_bone_pile', 19342);
*/
// called by 113280


class mob_scholomance_fresh_test_subject : public CreatureScript
{
public:
    mob_scholomance_fresh_test_subject() : CreatureScript("mob_scholomance_fresh_test_subject") { }

    struct mob_scholomance_fresh_test_subjectAI : public ScriptedAI
    {
        mob_scholomance_fresh_test_subjectAI(Creature* creature) : ScriptedAI(creature) { }
        bool explosion; // BRAVERY

        void Reset()
        {
            explosion = false;
            me->CastSpell(me, 113280);
        }
        void UpdateAI(uint32 const diff)
        {
            events.Update(diff);

            if (!explosion && !me->HasAura(113280))
            {
                explosion = true;
               // DoCastAOE(113312);
                me->CastSpell(me, 113312, true);
                me->DespawnOrUnsummon(500);
            }
        }

    };

    CreatureAI* GetAI(Creature* creature) const
    {
        return new mob_scholomance_fresh_test_subjectAI(creature);
    }
};
/*
class RemovePlayers
{
public:
    RemovePlayers() {}
    bool operator()(WorldObject* object)
    {
        if (object && object->GetTypeId() == TYPEID_PLAYER)
            return true;
        else
            return false;
    }
};
// called by 113312
class spell_remove_players_explosion : public SpellScriptLoader
{
public:
    spell_remove_players_explosion() : SpellScriptLoader("spell_remove_players_explosion") { }

    class spell_remove_players_explosion_spell_script : public SpellScript
    {
        PrepareSpellScript(spell_remove_players_explosion_spell_script);

        void CorrectTargets(std::list<WorldObject*>& targets)
        {
            if (targets.empty())
                return;

            targets.remove_if(RemovePlayers());
        }

        void Register()
        {
            OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_remove_players_explosion_spell_script::CorrectTargets, EFFECT_0, 16);
            OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_remove_players_explosion_spell_script::CorrectTargets, EFFECT_1, 16);
        }
    };

    SpellScript* GetSpellScript() const
    {
        return new spell_remove_players_explosion_spell_script();
    }
};
*/
void AddSC_boss_gandling()
{
    new boss_gandling();
//    new spell_remove_players_explosion();
    new mob_scholomance_fresh_test_subject();
}