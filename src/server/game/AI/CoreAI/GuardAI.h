////////////////////////////////////////////////////////////////////////////////
//
// Project-Hellscream https://hellscream.org
// Copyright (C) 2018-2020 Project-Hellscream-6.2
// Discord https://discord.gg/CWCF3C9
//
////////////////////////////////////////////////////////////////////////////////

#ifndef TRINITY_GUARDAI_H
#define TRINITY_GUARDAI_H

#include "ScriptedCreature.h"

class Creature;

class GuardAI : public ScriptedAI
{
    public:
        explicit GuardAI(Creature* creature);

        static int Permissible(Creature const* creature);
        bool CanSeeAlways(WorldObject const* obj);

        void EnterEvadeMode();
        void JustDied(Unit* killer);
};
#endif

