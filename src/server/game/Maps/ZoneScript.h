////////////////////////////////////////////////////////////////////////////////
//
// Project-Hellscream https://hellscream.org
// Copyright (C) 2018-2020 Project-Hellscream-6.2
// Discord https://discord.gg/CWCF3C9
//
////////////////////////////////////////////////////////////////////////////////

#ifndef ZONE_SCRIPT_H_
#define ZONE_SCRIPT_H_

#include "Define.h"
#include "Common.h"
#include "Creature.h"
#include "ScriptMgr.h"

class Area;
class Creature;
class GameObject;
class Unit;
class WorldObject;
struct CreatureData;

class ZoneScript
{
    public:
        ZoneScript(const char* name) {}
		ZoneScript() {}
        virtual ~ZoneScript() {}

        virtual uint32 GetCreatureEntry(uint32 /*guidlow*/, CreatureData const* data) { return data->id; }
        virtual uint32 GetGameObjectEntry(uint32 /*guidlow*/, uint32 entry) { return entry; }

        virtual void OnCreatureCreate(Creature* /*creature*/) {}
        virtual void OnCreatureRemove(Creature* /*creature*/) {}
        virtual void OnGameObjectCreate(GameObject* /*go*/) {}
        virtual void OnGameObjectRemove(GameObject* /*go*/) {}

        virtual void OnUnitDeath(Unit* /*unit*/) {}

		// Called when a player successfully enters or exit the zone.
		virtual void OnPlayerEnterMap(Player* /*player*/) {}
		virtual void OnPlayerLeaveMap(Player* /*player*/) {}
		virtual void OnPlayerAreaUpdate(Player* /*player*/, Area* /*newAreaId*/, Area* /*oldAreaId*/) {}

        //All-purpose data storage 64 bit
        virtual uint64 GetData64(uint32 /*DataId*/) { return 0; }
        virtual void SetData64(uint32 /*DataId*/, uint64 /*value*/) {}

        //All-purpose data storage 32 bit
        virtual uint32 GetData(uint32 /*DataId*/) { return 0; }
        virtual void SetData(uint32 /*DataId*/, uint32 /*value*/) {}

        virtual void ProcessEvent(WorldObject* /*obj*/, uint32 /*eventId*/) {}
};

#endif
