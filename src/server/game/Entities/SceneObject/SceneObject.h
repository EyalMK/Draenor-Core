////////////////////////////////////////////////////////////////////////////////
//
// Project-Hellscream https://hellscream.org
// Copyright (C) 2018-2020 Project-Hellscream-6.2
// Discord https://discord.gg/CWCF3C9
//
////////////////////////////////////////////////////////////////////////////////

#ifndef SCENEOBJECT_H
#define SCENEOBJECT_H

#include "Object.h"
#include "CellImpl.h"
#include "GridNotifiers.h"
#include "GridNotifiersImpl.h"
#include "Map.h"

class SceneObject : public WorldObject
{
    protected:
        SceneObject();

    public:
        virtual ~SceneObject();

        static SceneObject* CreateSceneObject(uint32 sceneId, WorldObject* spectator);
};

#endif
