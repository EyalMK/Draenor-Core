/*
 * Copyright (C) 2011-2014 Project SkyFire <http://www.projectskyfire.org/>
 * Copyright (C) 2008-2014 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2005-2014 MaNGOS <http://getmangos.com/>
 * Copyright (C) 2006-2014 ScriptDev2 <https://github.com/scriptdev2/scriptdev2/>
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation; either version 3 of the License, or (at your
 * option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program. If not, see <http://www.gnu.org/licenses/>.
 */

/* ScriptData
SDName: Boss_jandicebarov
SD%Complete: 100
SDComment:
SDCategory: Scholomance
EndScriptData */

#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "scholomance.h"
#include "GridNotifiers.h"

enum Achievement
{
    ACHIEVEMENT_RATTLE_NO_MORE = 6394,
};
enum Events
{
    EVENT_BONE_THROW = 991,
    EVENT_SUMMON_WOVEN_BONEGUARDS = 992,
    EVENT_BONE_SPIKE = 993,
    EVENT_RATTLED = 994,
    EVENT_SOUL_FIRE_BONES = 995,
    EVENT_TERMINATE_SOUL_FLAME = 996,
};
enum Actions
{
    ACTION_TERMINATE_SOULFLAME = 1,
};


Position Boneweaverss[6] =
{
    { 282.02f, 118.15f, 113.490f, 3.160567f },
    { 282.92f, 99.88f, 113.490f, 3.105594f },
    { 282.94f, 81.00f, 113.491f, 3.125228f },
    { 240.54f, 80.76f, 113.490f, 6.277495f },
    { 239.71f, 99.41f, 113.491f, 0.022625f },
    { 240.03f, 118.07f, 113.491f, 0.014769f },
};
Position Boness[6] =
{
    { 277.25f, 117.79f, 114.369f, 3.075803f },
    { 277.14f, 99.54f, 113.726f, 3.181833f },
    { 277.27f, 80.90f, 113.738f, 3.126854f },
    { 245.32f, 80.81f, 113.600f, 6.248809f },
    { 245.39f, 100.112f, 113.869f, 6.268443f },
    { 246.01f, 117.728f, 113.715f, 6.260589f },
};


#define bonespell_interval urand(4000, 9000)
#define boneguards_interval urand(8000, 15000)
#define rattled_interval 15000
#define bonespike_interval urand(8000, 15000)
#define soul_fire_bones_interval urand(10000, 16000)

#define rattlegore_aggro "Rattlegore!"
#define rattlegore_msg "Click on a Bone Pile to protect yourself from a Bone Spike"

class boss_rattle_gore : public CreatureScript
{
public:
    boss_rattle_gore() : CreatureScript("boss_rattle_gore") { }

    struct boss_rattle_goreAI : public BossAI
    {
        boss_rattle_goreAI(Creature* creature) : BossAI(creature, DATA_RATTLE_GORE)
        {
            instance = me->GetInstanceScript();
        }

        InstanceScript* instance;
        bool hassaidwarning;
        bool achievement;

        void Reset()
        {
            _Reset();
            events.Reset();
            summons.DespawnAll();
        }
        void EnterCombat(Unit* /*who*/)
        {
            for (int i = 0; i < 6; i++)
            {
                Creature* fire = me->SummonCreature(CREATURE_SOUL_FLAME_VISUAL, Boness[i], TEMPSUMMON_MANUAL_DESPAWN);
                fire->SetReactState(REACT_PASSIVE);              
            }

            me->MonsterYell(rattlegore_aggro, LANG_UNIVERSAL, me->GetGUID());

            events.ScheduleEvent(EVENT_BONE_SPIKE, bonespike_interval);
            events.ScheduleEvent(EVENT_RATTLED, rattled_interval);
            events.ScheduleEvent(EVENT_SOUL_FIRE_BONES, soul_fire_bones_interval);
        }
        void JustDied(Unit* killer)
        {
            _JustDied();
            Talk(JUST_DIED);
            summons.DespawnAll();
            summons.DespawnEntry(CREATURE_BONE_PILE);

            instance->SetBossState(DATA_RATTLE_GORE, DONE);

            if (achievement)
            {
                Map::PlayerList const &PlList = me->GetMap()->GetPlayers();
                if (PlList.isEmpty())
                    return;
                AchievementEntry const* achievementEntry = sAchievementMgr->GetAchievement(ACHIEVEMENT_RATTLE_NO_MORE);
                for (Map::PlayerList::const_iterator i = PlList.begin(); i != PlList.end(); ++i)
                    if (Player* player = i->getSource())
                        player->CompletedAchievement(achievementEntry);
            }
        }
        void DoAction(int32 const action)
        {
            switch (action)
            {
            }
        }
        void UpdateAI(uint32 diff)
        {
            if (!UpdateVictim())
                return;
            
            events.Update(diff);

            if (uint32 eventId = events.ExecuteEvent())
            {
                switch (eventId)
                {
                case EVENT_BONE_SPIKE:
                {
                    if (hassaidwarning)
                    {
                        me->MonsterTextEmote(rattlegore_msg, LANG_UNIVERSAL, false);
                        hassaidwarning = false;
                    }

                    if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 50.0f, true))
                        me->CastSpell(target, SPELL_BONE_SPIKE);
                    events.ScheduleEvent(EVENT_BONE_SPIKE, bonespike_interval);
                    break;
                }
                case EVENT_RATTLED:
                {
                    if (me->getVictim() && me->getVictim()->IsWithinDistInMap(me, 1.5f))
                    me->CastSpell(me, SPELL_RUSTING);

                    if (me->HasAura(SPELL_RUSTING))
                    {
                        Aura* rusting = me->GetAura(SPELL_RUSTING);

                        if (rusting && rusting->GetCharges() > 4)
                        {
                            achievement = false;
                        }
                    }

                    events.ScheduleEvent(EVENT_RATTLED, rattled_interval);
                    break;
                }
                case EVENT_SOUL_FIRE_BONES:
                {
                    std::list<Creature*> soul_flame_triggers;
                    me->GetCreatureListWithEntryInGrid(soul_flame_triggers, CREATURE_SOUL_FLAME_VISUAL, 150.0F);

                    std::list<Creature*>::const_iterator it = soul_flame_triggers.begin();
                    if ((*it)->HasAura(SPELL_SOULFLAME_HANDLER))
                        soul_flame_triggers.erase(it);
                    else
                        std::advance(it, urand(0, soul_flame_triggers.size() - 1));

                    (*it)->AddAura(SPELL_SOULFLAME_HANDLER, (*it));
                    if ((*it)->GetAI())
                        (*it)->GetAI()->DoAction(ACTION_TERMINATE_SOULFLAME);
                    events.ScheduleEvent(EVENT_SOUL_FIRE_BONES, soul_fire_bones_interval);
                    break;
                }
                }
            }

            DoMeleeAttackIfReady();
        }
    };
    CreatureAI* GetAI(Creature* creature) const
    {
        return new boss_rattle_goreAI(creature);
    }
};
class mob_scholomance_boneweaver : public CreatureScript
{
public:
    mob_scholomance_boneweaver() : CreatureScript("mob_scholomance_boneweaver") { }

    struct mob_scholomance_boneweaverAI : public Scripted_NoMovementAI
    {
        mob_scholomance_boneweaverAI(Creature* creature) : Scripted_NoMovementAI(creature) { }

        void Reset()
        {
            me->CastSpell(me, SPELL_BONE_WEAVING);
        }
        void EnterCombat(Unit* who)
        {
            for (int i = 0; i <= 4; i++)
                if (Creature* trigger = me->FindNearestCreature(CREATURE_BONE_PILE, 10.0F, true))
                    me->CastSpell(trigger, SPELL_SUMMON_WOVEN_GUARDS_SINGLE);

            events.ScheduleEvent(EVENT_BONE_THROW, bonespell_interval);
            events.ScheduleEvent(EVENT_SUMMON_WOVEN_BONEGUARDS, boneguards_interval);
        }
        void JustDied(Unit* /*killer*/)
        {
            // visual segment missing
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
                case EVENT_BONE_THROW:
                    me->CastSpell(me->getVictim(), SPELL_BONE_SHARDS);
                    events.ScheduleEvent(EVENT_BONE_THROW, bonespell_interval);
                    break;
                case EVENT_SUMMON_WOVEN_BONEGUARDS:
                    if (Creature* trigger = me->FindNearestCreature(CREATURE_BONE_PILE, 10.0F, true))
                        me->CastSpell(trigger, SPELL_SUMMON_WOVEN_GUARDS_SINGLE);

                    events.ScheduleEvent(EVENT_SUMMON_WOVEN_BONEGUARDS, boneguards_interval);
                    break;
                }
            }
        }
    };

    CreatureAI* GetAI(Creature* creature) const
    {
        return new mob_scholomance_boneweaverAI(creature);
    }
};
class mob_scholomance_bone_woven : public CreatureScript
{
public:
    mob_scholomance_bone_woven() : CreatureScript("mob_scholomance_bone_woven") { }

    struct mob_scholomance_bone_wovenAI : public ScriptedAI
    {
        mob_scholomance_bone_wovenAI(Creature* creature) : ScriptedAI(creature) { }

        void Reset()
        {
            me->setFaction(16);
            if (Creature* Voss = me->FindNearestCreature(CREATURE_VOSS, 50.0f, true))
            {
                me->Attack(Voss, true);
                me->GetMotionMaster()->MovePoint(1, Voss->GetPositionX(), Voss->GetPositionY(), Voss->GetPositionZ());
            }
        }
        void EnterCombat(Unit* who)
        {
        }
        void JustDied(Unit* /*killer*/)
        {
            me->DespawnOrUnsummon();
            // visual segment missing
        }
        void UpdateAI(uint32 const diff)
        {
            if (!UpdateVictim())
                return;

            events.Update(diff);

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
        return new mob_scholomance_bone_wovenAI(creature);
    }
};
class mob_scholomance_bone_pile : public CreatureScript
{
public:
    mob_scholomance_bone_pile() : CreatureScript("mob_scholomance_bone_pile") { }

    bool OnGossipHello(Player* player, Creature* creature)
    {
        if (!player->HasAura(SPELL_BONE_ARMOR))
        {
            player->AddAura(SPELL_BONE_ARMOR, player);
            return true;
        }
    }
    struct mob_scholomance_bone_pileAI : public Scripted_NoMovementAI
    {
        mob_scholomance_bone_pileAI(Creature* creature) : Scripted_NoMovementAI(creature) { }

        void Reset()
        {
        }
        void UpdateAI(uint32 const diff)
        {
            events.Update(diff);

            if (Creature* bonestorm = me->FindNearestCreature(CREATURE_BONE_STORM_TRIGGER, 100.0F, true))
            {
                me->CastSpell(bonestorm, SPELL_BONE_COSMETIC);
            }

            if (uint32 eventId = events.ExecuteEvent())
            {
                switch (eventId)
                {
                }
            }
        }
    };

    CreatureAI* GetAI(Creature* creature) const
    {
        return new mob_scholomance_bone_pileAI(creature);
    }
};

class mob_scholomance_soul_flame : public CreatureScript
{
public:
    mob_scholomance_soul_flame() : CreatureScript("mob_scholomance_soul_flame") { }

    struct mob_scholomance_soul_flameAI : public Scripted_NoMovementAI
    {
        mob_scholomance_soul_flameAI(Creature* creature) : Scripted_NoMovementAI(creature) { }

        void Reset()
        {
            me->setFaction(16);
            me->CastSpell(me, SPELL_SOULFLAME_VISUAL);
        }
        void DoAction(int32 const action)
        {
            switch (action)
            {
            case ACTION_TERMINATE_SOULFLAME:
                events.ScheduleEvent(EVENT_TERMINATE_SOUL_FLAME, 15000);
                break;
            }
        }
        void UpdateAI(uint32 const diff)
        {
            events.Update(diff);

            if (uint32 eventId = events.ExecuteEvent())
            {
                switch (eventId)
                {
                case EVENT_TERMINATE_SOUL_FLAME:
                    me->RemoveAura(SPELL_SOULFLAME_HANDLER);
                    break;
                }
            }
        }
    };

    CreatureAI* GetAI(Creature* creature) const
    {
        return new mob_scholomance_soul_flameAI(creature);
    }
};
class mob_scholomance_voss_gandling : public CreatureScript
{
public:
    mob_scholomance_voss_gandling() : CreatureScript("mob_scholomance_voss_gandling") { }

    struct mob_scholomance_voss_gandlingAI : public Scripted_NoMovementAI
    {
        mob_scholomance_voss_gandlingAI(Creature* creature) : Scripted_NoMovementAI(creature) { }

        void Reset()
        {
        }
        void UpdateAI(uint32 const diff)
        {
            events.Update(diff);
            DoMeleeAttackIfReady();
        }
    };

    CreatureAI* GetAI(Creature* creature) const
    {
        return new mob_scholomance_voss_gandlingAI(creature);
    }
};
class spell_soul_flame : public SpellScriptLoader
{
public:
    spell_soul_flame() : SpellScriptLoader("spell_soul_flame") { }

    class spell_soul_flame_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_soul_flame_SpellScript);

        void CorrectRange(std::list<WorldObject*>& targets)
        {
            targets.clear();

            float scale = GetCaster()->GetFloatValue(OBJECT_FIELD_SCALE); // Used to be OBJECT_FIELD_SCALE_X not sure if this will work - Ely
            float MaxDist = 2.7f + scale;
            float MinDist = 0.0f;

            Map::PlayerList const& players = GetCaster()->GetMap()->GetPlayers();
            if (!players.isEmpty())
                for (Map::PlayerList::const_iterator itr = players.begin(); itr != players.end(); ++itr)
                    if (Player* player = itr->getSource())
                        if (player->GetExactDist2d(GetCaster()->GetPositionX(), GetCaster()->GetPositionY()) <= MaxDist &&
                            player->GetExactDist2d(GetCaster()->GetPositionX(), GetCaster()->GetPositionY()) >= MinDist)
                            targets.push_back(player);
        }

        void Register()
        {
            OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_soul_flame_SpellScript::CorrectRange, EFFECT_0, TARGET_UNIT_SRC_AREA_ENEMY);
        }
    };

    SpellScript* GetSpellScript() const
    {
        return new spell_soul_flame_SpellScript();
    }
};

class RemoveNonWhirlwind
{
public:
    RemoveNonWhirlwind() {}
    bool operator()(WorldObject* object)
    {
        if (object->GetEntry() != CREATURE_BONE_STORM_TRIGGER)
            return true;
        else
            return false;
    }
};
class spell_bone_visual : public SpellScriptLoader
{
public:
    spell_bone_visual() : SpellScriptLoader("spell_bone_visual") { }

    class spell_bone_visualAI : public SpellScript
    {
        PrepareSpellScript(spell_bone_visualAI);

        void CorrectTargets(std::list<WorldObject*>& targets)
        {
            if (targets.empty())
                return;

            if (!GetCaster())
                return;

            targets.remove_if(RemoveNonWhirlwind());
        }

        void Register()
        {
            OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_bone_visualAI::CorrectTargets, EFFECT_0, TARGET_UNIT_SRC_AREA_ENTRY);
        }
    };

    SpellScript* GetSpellScript() const
    {
        return new spell_bone_visualAI();
    }
};
// called by 119887
class spell_bone_spike : public SpellScriptLoader
{
public:
    spell_bone_spike() : SpellScriptLoader("spell_bone_spike") { }

    class spell_bone_spike_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_bone_spike_SpellScript);

        void RecalculateDamage(SpellEffIndex /*effIndex*/)
        {
            if (GetSpellInfo() && GetSpellInfo()->Id == 113999)
            {
                if (GetHitUnit() && GetHitUnit()->HasAura(SPELL_BONE_ARMOR))
                {
                    SetHitDamage(0);
                    GetHitUnit()->RemoveAura(SPELL_BONE_ARMOR);
                }
            }
        }

        void Register()
        {
            OnEffectHitTarget += SpellEffectFn(spell_bone_spike_SpellScript::RecalculateDamage, EFFECT_0, SPELL_EFFECT_SCHOOL_DAMAGE);
        }
    };

    SpellScript* GetSpellScript() const
    {
        return new spell_bone_spike_SpellScript();
    }
    
};
void AddSC_boss_rattlegore()
{
    new mob_scholomance_boneweaver();
    new mob_scholomance_bone_pile();
    new mob_scholomance_bone_woven();
    new mob_scholomance_soul_flame();
    new mob_scholomance_voss_gandling();
    new spell_soul_flame();
    new spell_bone_visual();
    new spell_bone_spike();
    new boss_rattle_gore();
}