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

enum Achievement
{
    ACHIEVEMNT_ATTENTION_TO_DETAIL = 6531,
};
enum Talk
{
    TALK_AGGRO = 0, // Ooo.. It takes some real stone to challenge the mistress of emotions.. well show me what you've got.
    TALK_DEATH = 1, // Death... hurts.. unreal.
    TALK_SLAY = 2, // Ashes.. ashes.. we all fall down! / Ooo careful not to bleed on the rog please dear!
    TALK_RESET = 3,// Better look next time...
    TALK_SPELL_01 = 4,  // Come.. try your luck!
    TALK_SPELL_02 = 5, // Feeling a bit dizzy? *giggles*
};
enum Events
{
    EVENT_WONDROUS_RAPIDITY = 900,
    EVENT_GRAVITY_FLUX = 901,
    EVENT_WHIRL_OF_ILLUSION = 902,
    EVENT_WONDROUS_RAPIDITY_SHOOT = 903,
};
enum Actions
{
    ACTION_WONDROUS_RAPIDITY = 1,
    ACTION_GRAVITY_FLUX = 2,
    ACTION_PROJECTILES_ACTIVATE = 3,
    ACTION_PROJECTILES_DISABLE = 4,
};
Position CLONES_POSITION[13] =
{
    { 309.89f, 51.99f, 113.409f, 0.0f },
    { 310.95f, 35.29f, 113.409f, 0.0f },
    { 311.02f, 22.60f, 113.409f, 0.0f },
    { 288.22f, 50.96f, 113.409f, 0.0f },
    { 278.35f, 51.11f, 113.409f, 0.0f },
    // {262.05f, 51.35f, 113.409f, 0.0f},
    { 304.12f, 35.39f, 113.408f, 0.0f },
    //{291.74f, 35.57f, 113.408f, 0.0f},
    { 280.54f, 35.74f, 113.408f, 0.0f },
    { 268.31f, 35.93f, 113.408f, 0.0f },
    //{260.36f, 36.16f, 113.407f, 0.0f},
    //{303.09f, 22.15f, 113.408f, 0.0f},
    { 291.98f, 22.26f, 113.408f, 0.0f },
    { 279.36f, 22.39f, 113.408f, 0.0f },
    { 269.18f, 22.50f, 113.408f, 0.0f },
    { 292.94f, 36.92f, 113.408f, 0.0f },
    { 269.09f, 51.41f, 113.408f, 0.0f },
    // {259.95f, 22.59f, 113.408f, 0.0f},
};

#define GRAVITY_FLUX_INTERVAL urand(6000, 10000)
#define WONDROUS_RAPIDITY_INTERVAL urand(5000, 20000)

Position GandlingPosition = { 261.30f, 119.25f, 120.95f, 4.700843f };
Position LilianVossPosition = { 261.80f, 96.26f, 113.49f, 1.599306f };
Position GandlingMovementPosition = { 261.15f, 132.01f, 113.491f, 1.559685f };
Position TeleportationTrigger = { 261.15f, 141.23f, 113.339f, 1.576623f };

#define RP_EVENT_BOSS_MSG "Defeat the Boneweavers to aid Lilian Voss!"
#define RP_EVENT_SAY_00 "My dear.. it appears we have visitors.. Friends of yours Voss?"
#define RP_EVENT_SAY_01 "You there.. make yourself useful and deal with these summoners!"
#define RP_EVENT_SAY_02 "Their death only serve to empower my summoners further! Behold!"
#define RP_EVENT_SAY_03 "You feed their souls to their brethren? You are sick."
#define RP_EVENT_SAY_04 "What's the matter, Voss, Getting tired?"
#define RP_EVENT_SAY_05 "I'll never stop hunting your kind, necromancer. NEVER."
#define RP_EVENT_SAY_06 "Isn't it beautiful? The weaving of flesh and bone and soul."
#define RP_EVENT_SAY_07 "We'll see if you revel so much in death once I've ripped out your throat!"
#define RP_EVENT_SAY_08 "You, too, are beautiful, Voss. Have you looked in a mirror recently?"
#define RP_EVENT_SAY_09 "You'll pay for your tongue!"
#define RP_EVENT_SAY_010 "My dear, you should embrace this gift that has been bestowed upon you."
#define RP_EVENT_SAY_011 "Run necromancer.. your life ends once I catch my breath."
#define RP_EVENT_SAY_012 "Come, Voss. your fate awaits you."
enum Voss
{
    SAY_01_VOSS = 1,
    SAY_02_VOSS = 2,
    SAY_03_VOSS = 3,
    SAY_04_VOSS = 4,
    SAY_05_VOSS = 5,
    SAY_06_VOSS = 6,
    SAY_07_VOSS = 7,
};
enum
{
    SAY_01_GAND = 8,
    SAY_02_GAND = 9,
    SAY_03_GAND = 10,
    SAY_04_GAND = 11,
    SAY_05_GAND = 12,
    SAY_06_GAND = 13,
    SAY_07_GAND = 14,
};
enum Spells
{
    SPELL_VISUAL_FIRE = 32993,
    SPELL_BURNING = 100397,
    SPEL_TELEPORT_VISUAL = 41232,
    SPELL_SHADOW_STEP_VISUAL = 127511,
    SPELL_BONE_ARMOR_VISUAL = 11445,
    SPELL_SOUL_RIP_VISUAL = 112058,
};
Position Boneweavers[6] =
{
    { 282.02f, 118.15f, 113.490f, 3.160567f },
    { 282.92f, 99.88f, 113.490f, 3.105594f },
    { 282.94f, 81.00f, 113.491f, 3.125228f },
    { 240.54f, 80.76f, 113.490f, 6.277495f },
    { 239.71f, 99.41f, 113.491f, 0.022625f },
    { 240.03f, 118.07f, 113.491f, 0.014769f },
};
Position Bones[6] =
{
    { 277.25f, 117.79f, 114.369f, 3.075803f },
    { 277.14f, 99.54f, 113.726f, 3.181833f },
    { 277.27f, 80.90f, 113.738f, 3.126854f },
    { 245.32f, 80.81f, 113.600f, 6.248809f },
    { 245.39f, 100.112f, 113.869f, 6.268443f },
    { 246.01f, 117.728f, 113.715f, 6.260589f },
};
class EventHandleJandiceDeathRp : public BasicEvent
{
public:
    explicit EventHandleJandiceDeathRp(Unit* unit, int value) : obj(unit), modifier(value)
    {
    }

    bool Execute(uint64 /*currTime*/, uint32 /*diff*/)
    {
        if (InstanceScript* instance = obj->GetInstanceScript())
        {
            if (Creature* Gandling = instance->instance->GetCreature(instance->GetData64(DATA_GANDLING_RP_1)))
            {
                if (Creature* Voss = instance->instance->GetCreature(instance->GetData64(DATA_VOSS_RP)))
                {
                    if (Creature* Trigger = instance->instance->GetCreature(instance->GetData64(DATA_TELEPORTER)))
                    {
                        switch (urand(0, 3))
                        {
                        case 0:
                            Gandling->CastSpell(Voss, SPELL_VISUAL_FIRE);
                            Voss->CastSpell(Voss, SPELL_BURNING);
                            break;
                        }

                        switch (modifier)
                        {
                        case 0:
                            Gandling->SetDisableGravity(true);
                            Gandling->GetMotionMaster()->MovePoint(1, GandlingPosition.GetPositionX(), GandlingPosition.GetPositionY(), GandlingPosition.GetPositionZ());
                            Gandling->CastSpell(Gandling, SPELL_BONE_ARMOR_VISUAL);
                            Gandling->CastSpell(Gandling, SPELL_SOUL_RIP_VISUAL);
                            Gandling->SetFacingToObject(Voss);

                            for (int i = 0; i < 6; i++)
                            {
                                Gandling->SummonCreature(CREATURE_BONE_PILE, Bones[i], TEMPSUMMON_MANUAL_DESPAWN);
                                Gandling->SummonCreature(CREATURE_BONE_WEAVER, Boneweavers[i], TEMPSUMMON_DEAD_DESPAWN);
                                Gandling->SummonCreature(CREATURE_BONE_WEAVING, LilianVossPosition.GetPositionX() + urand(1, 3), LilianVossPosition.GetPositionY() + urand(0.5, 4.0f), LilianVossPosition.GetPositionZ(), LilianVossPosition.GetOrientation(), TEMPSUMMON_MANUAL_DESPAWN);
                            }

                            Gandling->AI()->Talk(SAY_01_GAND);
                            obj->m_Events.AddEvent(new EventHandleJandiceDeathRp(obj, 1), obj->m_Events.CalculateTime(8000));
                            break;
                        case 1:
                            Voss->AI()->Talk(SAY_01_VOSS);
                            obj->m_Events.AddEvent(new EventHandleJandiceDeathRp(obj, 2), obj->m_Events.CalculateTime(8000));
                            break;
                        case 2:
                            Gandling->AI()->Talk(SAY_02_GAND);
                            obj->m_Events.AddEvent(new EventHandleJandiceDeathRp(obj, 3), obj->m_Events.CalculateTime(8000));
                            break;
                        case 3:
                            Voss->AI()->Talk(SAY_02_VOSS);
                            obj->m_Events.AddEvent(new EventHandleJandiceDeathRp(obj, 4), obj->m_Events.CalculateTime(8000));
                            break;
                        case 4:
                            Gandling->AI()->Talk(SAY_03_GAND);
                            obj->m_Events.AddEvent(new EventHandleJandiceDeathRp(obj, 5), obj->m_Events.CalculateTime(8000));
                            break;
                        case 5:
                            Voss->AI()->Talk(SAY_03_VOSS);
                            obj->m_Events.AddEvent(new EventHandleJandiceDeathRp(obj, 6), obj->m_Events.CalculateTime(8000));
                            break;
                        case 6:
                            Gandling->AI()->Talk(SAY_04_GAND);
                            obj->m_Events.AddEvent(new EventHandleJandiceDeathRp(obj, 7), obj->m_Events.CalculateTime(8000));
                            break;
                        case 7:
                            Voss->AI()->Talk(SAY_04_VOSS);
                            obj->m_Events.AddEvent(new EventHandleJandiceDeathRp(obj, 8), obj->m_Events.CalculateTime(8000));
                            break;
                        case 8:
                            Gandling->AI()->Talk(SAY_05_GAND);
                            obj->m_Events.AddEvent(new EventHandleJandiceDeathRp(obj, 9), obj->m_Events.CalculateTime(8000));
                            break;
                        case 9:
                            Voss->AI()->Talk(SAY_05_VOSS);
                            obj->m_Events.AddEvent(new EventHandleJandiceDeathRp(obj, 10), obj->m_Events.CalculateTime(8000));
                            break;
                        case 10:
                            Gandling->AI()->Talk(SAY_06_GAND);
                            obj->m_Events.AddEvent(new EventHandleJandiceDeathRp(obj, 11), obj->m_Events.CalculateTime(8000));
                            break;
                        case 11:
                            Voss->AI()->Talk(SAY_06_VOSS);
                            obj->m_Events.AddEvent(new EventHandleJandiceDeathRp(obj, 12), obj->m_Events.CalculateTime(8000));
                            break;
                        case 12:
                            Gandling->AI()->Talk(SAY_07_GAND);
                            Gandling->RemoveAura(SPELL_SOUL_RIP_VISUAL);

                            Gandling->SetDisableGravity(false);
                            Gandling->GetMotionMaster()->MovePoint(1, GandlingMovementPosition);

                            obj->m_Events.AddEvent(new EventHandleJandiceDeathRp(obj, 14), obj->m_Events.CalculateTime(4000));
                            obj->m_Events.AddEvent(new EventHandleJandiceDeathRp(obj, 13), obj->m_Events.CalculateTime(10000));
                            break;
                        case 13:
                            Voss->AI()->Talk(SAY_07_VOSS);
                            Gandling->GetMotionMaster()->MovePoint(1, GandlingMovementPosition);                         
                            break;
                        case 14:
                            Gandling->CastSpell(Gandling, SPEL_TELEPORT_VISUAL);
                            Gandling->NearTeleportTo(Trigger->GetPositionX(), Trigger->GetPositionY(), Trigger->GetPositionZ(), Trigger->GetOrientation());
                            Trigger->CastSpell(Trigger, SPEL_TELEPORT_VISUAL);
                            Gandling->DespawnOrUnsummon(20000);
                            Voss->GetMotionMaster()->MovePoint(1, GandlingMovementPosition);
                            obj->m_Events.AddEvent(new EventHandleJandiceDeathRp(obj, 15), obj->m_Events.CalculateTime(6000));
                            break;
                        case 15:                       
                            Voss->NearTeleportTo(Trigger->GetPositionX(), Trigger->GetPositionY(), Trigger->GetPositionZ(), Trigger->GetOrientation());
                            Trigger->CastSpell(Voss, SPELL_SHADOW_STEP_VISUAL);
                            obj->m_Events.AddEvent(new EventHandleJandiceDeathRp(obj, 16), obj->m_Events.CalculateTime(5000));
                            break;
                        case 16:
                            Voss->CastSpell(Voss, SPELL_SHADOW_STEP_VISUAL);
                            Voss->DespawnOrUnsummon(10000);
                            // summon bonestorm
                            storm = obj->SummonCreature(CREATURE_BONE_STORM_TRIGGER, LilianVossPosition, TEMPSUMMON_TIMED_DESPAWN, 12000);
                            storm->CastSpell(storm, SPELL_BONE_WHIRL_WIND_VISUAL);
                            obj->m_Events.AddEvent(new EventHandleJandiceDeathRp(obj, 17), obj->m_Events.CalculateTime(8000));
                            break;
                        case 17:
                            obj->SummonCreature(BOSS_RATTLE_GORE, LilianVossPosition, TEMPSUMMON_MANUAL_DESPAWN);
                            break;
                        }
                    }
                }
            }
        }
        return true;
    }

private:
    Creature* storm;
    Unit* obj;
    int modifier;
    int Event;
};
class boss_jandice_barov : public CreatureScript
{
public:
    boss_jandice_barov() : CreatureScript("boss_jandice_barov") { }

    struct boss_jandicebarovAI : public BossAI
    {
        boss_jandicebarovAI(Creature* creature) : BossAI(creature, DATA_BOSS_JANDICE)
        {
            instance = me->GetInstanceScript();
        }

        bool thirtythreepct;
        bool sixtythreepcts;
        bool achievement;
        int8 phase;
        int32 health;
        int32 illusionhealth;
        InstanceScript* instance;

        void Reset()
        {
            _Reset();
            events.Reset();
            summons.DespawnAll();

            Talk(TALK_RESET);

            phase = 1;
            health = 0;
            illusionhealth = 200000;

            thirtythreepct = false;
            sixtythreepcts = false;
            achievement = true;

            me->RemoveUnitMovementFlag(MOVEMENTFLAG_ROOT);
            me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_MOVE);
            me->RemoveFlag(UNIT_FIELD_FLAGS_2, UNIT_FLAG2_DISABLE_TURN);
            me->SetReactState(REACT_AGGRESSIVE);
            me->ClearUnitState(UNIT_STATE_CANNOT_AUTOATTACK);
        }
        void EnterCombat(Unit* /*who*/)
        {
            Talk(TALK_AGGRO);

            phase = 1;
            events.ScheduleEvent(EVENT_WONDROUS_RAPIDITY, urand(8000, 13000));
            events.ScheduleEvent(EVENT_GRAVITY_FLUX, urand(15000, 22000));
        }
        void SummonIllusions()
        {
            switch (urand(0, 1))
            {
            case 0:
                Talk(TALK_SPELL_01);
                break;
            case 1:
                Talk(TALK_SPELL_02);
                break;
            }

            events.CancelEvent(EVENT_WONDROUS_RAPIDITY);
            events.CancelEvent(EVENT_GRAVITY_FLUX);
            health = 0;
            health = me->GetHealth();

            phase = 2;
            me->SetMaxHealth(illusionhealth);
            me->SetHealth(illusionhealth);
            me->AddUnitMovementFlag(MOVEMENTFLAG_ROOT);
            me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_MOVE);
            me->SetFlag(UNIT_FIELD_FLAGS_2, UNIT_FLAG2_DISABLE_TURN);
            me->SetReactState(REACT_PASSIVE);
            me->AddUnitState(UNIT_STATE_CANNOT_AUTOATTACK);
            me->Attack(me->getVictim(), true);

            std::list<Position> Epos;

            for (int i = 0; i < 13; i++)
                Epos.push_back(CLONES_POSITION[i]);

            std::list<Position>::const_iterator it = Epos.begin();
            std::advance(it, urand(0, Epos.size() - 1));

            me->NearTeleportTo((*it).GetPositionX(), (*it).GetPositionY(), (*it).GetPositionZ(), (*it).GetOrientation(), true);
            Epos.erase(it);

            for (std::list<Position>::const_iterator itr = Epos.begin(); itr != Epos.end(); itr++)
            {
                Creature* clone = me->SummonCreature(CREATURE_JANDICE_ILLUSION, itr->GetPositionX(), itr->GetPositionY(), itr->GetPositionZ(), itr->GetOrientation(), TEMPSUMMON_MANUAL_DESPAWN);
                clone->AddUnitMovementFlag(MOVEMENTFLAG_ROOT);
                clone->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_MOVE);
                clone->SetFlag(UNIT_FIELD_FLAGS_2, UNIT_FLAG2_DISABLE_TURN);
                clone->SetReactState(REACT_PASSIVE);
                me->AddUnitState(UNIT_STATE_CANNOT_AUTOATTACK);

                clone->SetMaxHealth(illusionhealth);
                clone->SetHealth(illusionhealth);
            }

            me->CastSpell(me, SPELL_WHIRL_OF_ILLUSION);
        }
        void KilledUnit(Unit* who)
        {
            if (who && who->GetTypeId() == TYPEID_PLAYER)
            {
                Talk(TALK_SLAY);
            }
        }
        void JustDied(Unit* killer)
        {
            _JustDied();
            Talk(JUST_DIED);

            if (achievement)
            {
                Map::PlayerList const &PlList = me->GetMap()->GetPlayers();
                if (PlList.isEmpty())
                    return;
                AchievementEntry const* achievementEntry = sAchievementMgr->GetAchievement(ACHIEVEMNT_ATTENTION_TO_DETAIL);
                for (Map::PlayerList::const_iterator i = PlList.begin(); i != PlList.end(); ++i)
                    if (Player* player = i->getSource())
                        player->CompletedAchievement(achievementEntry);                     
            }

            instance->SetBossState(DATA_BOSS_JANDICE, DONE);

            if (killer)
            killer->m_Events.AddEvent(new EventHandleJandiceDeathRp(killer, 0), killer->m_Events.CalculateTime(3000));
        }
        void DamageTaken(Unit* /*attacker*/, uint32& damage)
        {
            if (me->HealthBelowPct(20) && phase == 2)
            {
                phase = 1;
                me->SetMaxHealth(health);
                me->SetHealth(health);
                health = 0;
                summons.DespawnAll();

                me->RemoveAura(SPELL_WHIRL_OF_ILLUSION);

                events.ScheduleEvent(EVENT_WONDROUS_RAPIDITY, urand(8000, 13000));
                events.ScheduleEvent(EVENT_GRAVITY_FLUX, urand(15000, 22000));

                me->RemoveUnitMovementFlag(MOVEMENTFLAG_ROOT);
                me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_MOVE);
                me->RemoveFlag(UNIT_FIELD_FLAGS_2, UNIT_FLAG2_DISABLE_TURN);
                me->SetReactState(REACT_AGGRESSIVE);
                me->ClearUnitState(UNIT_STATE_CANNOT_AUTOATTACK);
            }
            if (me->HealthBelowPct(63) && !sixtythreepcts && phase != 2)
            {
                sixtythreepcts = true;
                SummonIllusions();
            }
            else if (me->HealthBelowPct(33) && !thirtythreepct && phase != 2)
            {
                thirtythreepct = true;
                SummonIllusions();
            }
        }
        void DoAction(int32 const action)
        {
            switch (action)
            {
            case ACTION_PROJECTILES_ACTIVATE:
                events.ScheduleEvent(EVENT_WONDROUS_RAPIDITY_SHOOT, 1000);
                break;
            case ACTION_PROJECTILES_DISABLE:
                events.CancelEvent(EVENT_WONDROUS_RAPIDITY_SHOOT);
                break;
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
                case EVENT_WONDROUS_RAPIDITY:
                    me->CastSpell(me->getVictim(), SPELL_WONDROUS_RAPIDITY);
                    events.ScheduleEvent(EVENT_WONDROUS_RAPIDITY_SHOOT, 600);
                    events.ScheduleEvent(EVENT_WONDROUS_RAPIDITY, WONDROUS_RAPIDITY_INTERVAL);
                    break;
                case EVENT_GRAVITY_FLUX:
                    Position pos;
                    me->GetRandomNearPosition(pos, 10.0f);

                    me->SummonCreature(CREATURE_GRAVITY_FLUX, pos.GetPositionX(), pos.GetPositionY(), pos.GetPositionZ(), 0.0f, TEMPSUMMON_MANUAL_DESPAWN);
                    events.ScheduleEvent(EVENT_GRAVITY_FLUX, GRAVITY_FLUX_INTERVAL);
                    break;
                case EVENT_WONDROUS_RAPIDITY_SHOOT:
                    if (me->getVictim())
                        me->CastSpell(me->getVictim(), 114061, true);
                    else if (Player* player = me->FindNearestPlayer(20.0f, true))
                    {
                        me->CastSpell(player, 114061, true);
                    }

                    events.ScheduleEvent(EVENT_WONDROUS_RAPIDITY_SHOOT, 600);
                    break;
                }
            }

            if (phase == 1)
                DoMeleeAttackIfReady();
        }
    };
    CreatureAI* GetAI(Creature* creature) const
    {
        return new boss_jandicebarovAI(creature);
    }
};
class npc_illusion : public CreatureScript
{
public:
    npc_illusion() : CreatureScript("npc_illusion") { }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_illusionAI(creature);
    }

    struct npc_illusionAI : public Scripted_NoMovementAI
    {
        npc_illusionAI(Creature* creature) : Scripted_NoMovementAI(creature) { }

        uint32 bombtime;

        void Reset()
        {
            me->CastSpell(me, SPELL_WHIRL_OF_ILLUSION);
        }
        void JustDied(Unit* /*killer*/)
        {
            me->CastSpell(me, SPELL_FLASH_BANG);
            me->DespawnOrUnsummon(2000);

            if (InstanceScript* instance = me->GetInstanceScript())
            {
                if (Creature* jandice = instance->instance->GetCreature(instance->GetData64(DATA_BOSS_JANDICE)))
                {
                    if (boss_jandice_barov::boss_jandicebarovAI* linkAI = CAST_AI(boss_jandice_barov::boss_jandicebarovAI, jandice->GetAI()))
                    {
                        if (linkAI->achievement)
                            linkAI->achievement = false;
                    }
                }
            }
        }
    };
};

class trigger_gravity_flux : public CreatureScript
{
public:
    trigger_gravity_flux() : CreatureScript("trigger_gravity_flux") { }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new trigger_gravity_fluxAI(creature);
    }

    struct trigger_gravity_fluxAI : public Scripted_NoMovementAI
    {
        trigger_gravity_fluxAI(Creature* creature) : Scripted_NoMovementAI(creature) { }

        uint32 bombtime;

        void Reset()
        {
            bombtime = 8000;
            me->CastSpell(me, SPELL_GRAVITY_FLUX_HANDLER);
        }
        void UpdateAI(uint32 diff)
        {
            if (bombtime <= diff)
            {
                std::list<Player*> pl_list;

                me->GetPlayerListInGrid(pl_list, 3.0f);

                for (auto itr : pl_list)
                {
                    itr->CastSpell(itr, SPELL_GRAVITY_FLUX_DAMAGE);
                }
                me->DespawnOrUnsummon(2000);
                bombtime = 800000;
            }
            else
                bombtime -= diff;
        }
    };
};
class RemoveNonJandice
{
public:
    RemoveNonJandice() {}
    bool operator()(WorldObject* object)
    {
        if (object->GetEntry() != CREATURE_JANDICE_ILLUSION && object->GetEntry() != BOSS_JANDICE)
            return true;
        else
            return false;
    }
};
class spell_whirl_of_illusion : public SpellScriptLoader
{
public:
    spell_whirl_of_illusion() : SpellScriptLoader("spell_whirl_of_illusion") { }

    class spell_whirl_of_illusionAI : public SpellScript
    {
        PrepareSpellScript(spell_whirl_of_illusionAI);

        void CorrectTargets(std::list<WorldObject*>& targets)
        {
            if (targets.empty())
                return;

            if (!GetCaster())
                return;

            targets.remove_if(RemoveNonJandice());
            targets.push_back(GetCaster());
        }

        void Register()
        {
            OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_whirl_of_illusionAI::CorrectTargets, EFFECT_0, TARGET_UNIT_SRC_AREA_ENTRY);
        }
    };

    SpellScript* GetSpellScript() const
    {
        return new spell_whirl_of_illusionAI();
    }
};
class spell_wondrous_rapidity : public SpellScriptLoader
{
public:
    spell_wondrous_rapidity() : SpellScriptLoader("spell_wondrous_rapidity") { }

    class spell_wondrous_rapidity_spell_Script : public SpellScript
    {
        PrepareSpellScript(spell_wondrous_rapidity_spell_Script);
        // should initialize instead.
        void Unload()
        {
            if (GetCaster() && GetCaster()->GetAI())
            {
                GetCaster()->GetAI()->DoAction(ACTION_PROJECTILES_DISABLE);
            }
        }

        void Register()
        {
        }
    };

    SpellScript* GetSpellScript() const
    {
        return new spell_wondrous_rapidity_spell_Script();
    }
};

void AddSC_boss_jandicebarov()
{
    new boss_jandice_barov();
    new npc_illusion();
    new trigger_gravity_flux();
    new spell_whirl_of_illusion();
    new spell_wondrous_rapidity();
    //new spell_wondrous_rapidity();
}