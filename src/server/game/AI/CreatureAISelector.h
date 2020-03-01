////////////////////////////////////////////////////////////////////////////////
//
// Project-Hellscream https://hellscream.org
// Copyright (C) 2018-2020 Project-Hellscream-6.2
// Discord https://discord.gg/CWCF3C9
//
////////////////////////////////////////////////////////////////////////////////

#ifndef TRINITY_CREATUREAISELECTOR_H
#define TRINITY_CREATUREAISELECTOR_H

class CreatureAI;
class Creature;
class MovementGenerator;
class GameObjectAI;
class GameObject;

namespace FactorySelector
{
    CreatureAI* selectAI(Creature*);
    MovementGenerator* selectMovementGenerator(Creature*);
    GameObjectAI* SelectGameObjectAI(GameObject*);
}
#endif

