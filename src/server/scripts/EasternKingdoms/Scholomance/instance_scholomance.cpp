#include "ScriptMgr.h"
#include "InstanceScript.h"
#include "scholomance.h"

// placeholder for chillheart: on death (113685) | boss back to box (111256), icechill dmg (105265) | channel before combat 122499

class instance_scholomance : public InstanceMapScript
{
public:
    instance_scholomance() : InstanceMapScript("instance_scholomance", 1007) { }

    struct instance_scholomance_InstanceMapScript: public InstanceScript
    {
        instance_scholomance_InstanceMapScript(InstanceMap* map): InstanceScript(map)  { }

        uint64 chillheardguid;
        uint64 jandiceguid;
        uint64 rattlegoreguid;
        uint64 vossguid;
        uint64 gandlingguid;
        uint64 vossrpguid;
        uint64 vosssoulguid;
 


        uint64 teleporterguid;
        uint64 gandlignrp1;
        uint64 gandlingrp2;
        uint64 vosscontroller;

        uint64 ChillHeartDoorGUID;
        uint64 RattleGoreDoorGUID;
        uint64 RattleToLilianDoorGUID;
        uint64 LilianVossDoorGUID;
        uint64 LilianVossChestDoorGUID;
        uint64 ProfessorDoorGuid;
        
        // bools
        bool hasopenfirstdoor;

        void Initialize()
        {
            SetBossNumber(5);
            // bosses
            chillheardguid = 0;
            jandiceguid = 0;
            rattlegoreguid = 0;
            vossguid = 0;
            gandlingguid = 0;
            vosssoulguid = 0;

            // triggers
            teleporterguid = 0;
            gandlignrp1 = 0;
            gandlingrp2 = 0;
            vosscontroller = 0;
        
            // gobs
            ChillHeartDoorGUID = 0;
            RattleGoreDoorGUID = 0;
            LilianVossDoorGUID = 0;
            RattleToLilianDoorGUID = 0;
            LilianVossChestDoorGUID = 0;
            ProfessorDoorGuid = 0;


            hasopenfirstdoor = false; 
        }
        void OnCreatureCreate(Creature* creature)
        {
            switch (creature->GetEntry())
            {
            case BOSS_CHILLHEART:
                chillheardguid = creature->GetGUID();
                break;
            case BOSS_JANDICE_2:
                jandiceguid = creature->GetGUID();
                break;
            case BOSS_RATTLE_GORE:
                rattlegoreguid = creature->GetGUID();
                break;
            case BOSS_VOSS:
                vossguid = creature->GetGUID();
                break;
            case BOSS_GANDLING:
                gandlingguid = creature->GetGUID();
                break;
            case CREATURE_VOSS:
                vossrpguid = creature->GetGUID();
                break;
            case BOSS_VOSS_SOUL:
                vosssoulguid = creature->GetGUID();
                break;
            case CREATURE_GANDLING:
                gandlignrp1 = creature->GetGUID();
                break;
            case CREATURE_GANDLING_2:
                gandlingrp2 = creature->GetGUID();
                break;
            case CREATURE_TELEPORT_TRIGGER:
                teleporterguid = creature->GetGUID();
                break;  
            case CREATURE_CONTROLLER_LILIAN_VOSS:
                vosscontroller = creature->GetGUID();
                break;
            default:
                break;
            }
        }
        void OnUnitDeath(Unit* unit)
        {
            Creature* creature = unit->ToCreature();
            if (!creature)
                return;

            switch (creature->GetEntry())
            {
            case BOSS_CHILLHEART:
                if (GameObject* door = instance->GetGameObject(ChillHeartDoorGUID))
                    door->UseDoorOrButton();
                break;       
            case BOSS_JANDICE_2:
                if (GameObject* door = instance->GetGameObject(RattleGoreDoorGUID))
                    door->UseDoorOrButton();
                break;
            case BOSS_RATTLE_GORE:
                if (GameObject* door = instance->GetGameObject(RattleToLilianDoorGUID))
                    door->UseDoorOrButton();
                break;
            case BOSS_VOSS:
                if (GameObject* door = instance->GetGameObject(ProfessorDoorGuid))
                    door->UseDoorOrButton();
                break;
            default:
                break;
            }
        }
        void OnGameObjectCreate(GameObject* go)
        {
            switch (go->GetEntry())
            {
            case GAME_OBJECT_RATTLE_GORE_GATE:  
                AddDoor(go, true);
                RattleGoreDoorGUID = go->GetGUID();
                break;
            case GAME_OBJECT_DOOR_LILIAN_VOSS:
                AddDoor(go, true);
                LilianVossDoorGUID = go->GetGUID();
                break;        
            case GAME_OBJECT_CHILL_HEART_IRON_GATE:
                AddDoor(go, true);
                ChillHeartDoorGUID = go->GetGUID();
                break;
            case GAME_OBJECT_LILIAN_CHEST_DOOR:
                LilianVossChestDoorGUID = go->GetGUID();
                break;
            case GAME_OBJECT_RATTLE_GORE_GATE_TO_BUTCHERY:
                RattleToLilianDoorGUID = go->GetGUID();
                break;
            case GAME_OBJECT_PROFESSOR_DOOR:
                ProfessorDoorGuid = go->GetGUID();
                break;
            default:
                break;
            }
        }
        void OnGameObjectRemove(GameObject* go)
        {
            switch (go->GetEntry())
            {
                break;
            default:
                break;
            }
        }
        uint32 GetData(uint32 type)
        {
            switch (type)
            {
            default:
                break;
            }

            return 0;
        }
        uint64 GetData64(uint32 type)
        {
            switch (type)
            {
            case DATA_BOSS_CHILLBORN:
                return chillheardguid;
                break;
            case DATA_BOSS_JANDICE:
                return jandiceguid;
                break;
            case DATA_RATTLE_GORE:
                return rattlegoreguid;
                break;
            case DATA_LILLIAN_VOSS:
                return vossguid;
                break;
            case DATA_BOSS_GANDLING:
                return gandlingguid;
                break;
            case DATA_LILLIAN_VOSS_SOUL:
                return vosssoulguid;
                break;
            case DATA_VOSS_RP:
                return vossrpguid;
                break;
            case DATA_GANDLING_RP_1:
                return gandlignrp1;
                break;
            case DATA_GANDLING_RP_2:
                return gandlingrp2;
                break;
            case DATA_TELEPORTER:
                return teleporterguid;
                break;   
            case DATA_LILIAN_CONTROLLER:
                return vosscontroller;
                break;
            }
            return 0;
        }
        bool SetBossState(uint32 type, EncounterState state)
        {
            if (!InstanceScript::SetBossState(type, state))
                return false;

            switch (type)
            {
                case DATA_LILLIAN_VOSS:
                {
                    if (state == DONE)
                    {
                        if (GameObject* door = instance->GetGameObject(LilianVossDoorGUID))
                        {
                            door->Delete();
                        }
                        if (GameObject* chestdoor = instance->GetGameObject(LilianVossChestDoorGUID))
                        {
                            chestdoor->UseDoorOrButton();
                        }
                    }
                    break;
                }
                    /*
                case DATA_BOSS_JANDICE:
                {
                    if (state == DONE)
                    {
                        if (GameObject* door = instance->GetGameObject(RattleGoreDoorGUID))
                        {
                            door->UseDoorOrButton();
                        }
                    }
                }
                */
            }
            return true;
        }
        bool IsWipe()
        {
            Map::PlayerList const& PlayerList = instance->GetPlayers();

            if (PlayerList.isEmpty())
            {
                return true;
            }

            return false;
        }

        protected:
            EventMap Events;
            
    };

    InstanceScript* GetInstanceScript(InstanceMap* map) const
    {
        return new instance_scholomance_InstanceMapScript(map);
    }
};

void AddSC_instance_scholomance()
{
    new instance_scholomance();
}