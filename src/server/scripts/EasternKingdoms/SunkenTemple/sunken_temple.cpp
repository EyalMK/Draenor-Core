////////////////////////////////////////////////////////////////////////////////
//
// Project-Hellscream https://hellscream.org
// Copyright (C) 2018-2020 Project-Hellscream-6.2
// Discord https://discord.gg/CWCF3C9
//
////////////////////////////////////////////////////////////////////////////////

/* ScriptData
SDName: Sunken_Temple
SD%Complete: 100
SDComment: Area Trigger + Puzzle event support
SDCategory: Sunken Temple
EndScriptData */

/* ContentData
at_malfurion_Stormrage_trigger
EndContentData */

#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "sunken_temple.h"

/*#####
# at_malfurion_Stormrage_trigger
#####*/

class at_malfurion_stormrage : public AreaTriggerScript
{
public:
    at_malfurion_stormrage() : AreaTriggerScript("at_malfurion_stormrage") { }

    bool OnTrigger(Player* player, const AreaTriggerEntry* /*at*/)
    {
		if (player->GetInstanceScript() && !player->FindNearestCreature(15362, 100.0f)) // 100 yards check - should fix issue
		{
			player->SummonCreature(15362, player->GetPositionX(), player->GetPositionY(), player->GetPositionZ(), -1.52f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 100000);
		}    
        return false;
    }

};
/*#####
# go_atalai_statue
#####*/

class go_atalai_statue : public GameObjectScript
{
public:
    go_atalai_statue() : GameObjectScript("go_atalai_statue") { }

    bool OnGossipHello(Player* player, GameObject* go)
    {
        if (InstanceScript* instance = player->GetInstanceScript())
            instance->SetData(EVENT_STATE, go->GetEntry());
        return false;
    }

};

#ifndef __clang_analyzer__
void AddSC_sunken_temple()
{
    new at_malfurion_stormrage();
    new go_atalai_statue();
}
#endif
