#include "ScriptMgr.h"
#include "InstanceScript.h"
#include "scarlet_halls.h"

class instance_scarlet_halls : public InstanceMapScript
{
public:
    instance_scarlet_halls() : InstanceMapScript("instance_scarlet_halls", 1001) { }

    struct instance_scarlet_halls_InstanceMapScript: public InstanceScript
    {
        instance_scarlet_halls_InstanceMapScript(InstanceMap* map): InstanceScript(map)  { }

        void Initialize()
        {
            SetBossNumber(MAX_ENCOUNTER);

            HoundmasterBraunGUID        = 0;
            ArmsmasterHarlanGUID        = 0;
            FlameweaverKoeglerGUID      = 0;
        }

        void OnCreatureCreate(Creature* creature)
        {
            switch (creature->GetEntry())
            {
                case BOSS_HOUNDMASTER_BRAUN:
                    HoundmasterBraunGUID = creature->GetGUID();
                    break;
                case BOSS_ARMSMASTER_HARLAN:
                    ArmsmasterHarlanGUID = creature->GetGUID();
                    break;
                case BOSS_FLAMEWEAVER_KOEGLER:
                    FlameweaverKoeglerGUID = creature->GetGUID();
                    break;
            }
        }

        void OnPlayerEnter(Player* player)
        {
            if (!TeamInInstance)
                TeamInInstance = player->GetTeam();
        }

        uint32 GetData(uint32 identifier) const
        {
            if (identifier == TEAM_IN_INSTANCE)
                return TeamInInstance;

            return 0;
        }

        uint64 GetData64(uint32 identifier) const
        {
            switch (identifier)
            {
                case DATA_HOUNDMASTER_BRAUN:
                    return HoundmasterBraunGUID;
                case DATA_ARMSMASTER_HARLAN:
                    return ArmsmasterHarlanGUID;
                case DATA_FLAMEWEAVER_KOEGLER:
                    return FlameweaverKoeglerGUID;
            }
            return 0;
        }

        bool SetBossState(uint32 type, EncounterState state)
        {
            if (!InstanceScript::SetBossState(type, state))
                return false;

            switch(type)
            {
                case DATA_HOUNDMASTER_BRAUN:
                    break;
                case DATA_ARMSMASTER_HARLAN:
                    break;
                case DATA_FLAMEWEAVER_KOEGLER:
                    break;
                default:
                    break;
            }

            return true;
        }

        std::string GetSaveData()
        {
            OUT_SAVE_INST_DATA;

            std::ostringstream saveStream;
            saveStream << "S H " << GetBossSaveData();

            OUT_SAVE_INST_DATA_COMPLETE;
            return saveStream.str();
        }

        void Load(const char* str)
        {
            if (!str)
            {
                OUT_LOAD_INST_DATA_FAIL;
                return;
            }

            OUT_LOAD_INST_DATA(str);

            char dataHead1, dataHead2;

            std::istringstream loadStream(str);
            loadStream >> dataHead1 >> dataHead2;

            if (dataHead1 == 'S' && dataHead2 == 'H')
            {
                for (uint32 i = 0; i < MAX_ENCOUNTER; ++i)
                {
                    uint32 tmpState;
                    loadStream >> tmpState;
                    if (tmpState == IN_PROGRESS || tmpState > SPECIAL)
                        tmpState = NOT_STARTED;
                    SetBossState(i, EncounterState(tmpState));
                }

            }
            else
                OUT_LOAD_INST_DATA_FAIL;

            OUT_LOAD_INST_DATA_COMPLETE;
        }
        protected:
            uint32 TeamInInstance;

            uint64 HoundmasterBraunGUID;
            uint64 ArmsmasterHarlanGUID;
            uint64 FlameweaverKoeglerGUID;
    };

    InstanceScript* GetInstanceScript(InstanceMap* map) const
    {
        return new instance_scarlet_halls_InstanceMapScript(map);
    }
};

void AddSC_instance_scarlet_halls()
{
    new instance_scarlet_halls();
}