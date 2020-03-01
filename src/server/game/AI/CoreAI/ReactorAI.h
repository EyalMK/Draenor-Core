////////////////////////////////////////////////////////////////////////////////
//
// Project-Hellscream https://hellscream.org
// Copyright (C) 2018-2020 Project-Hellscream-6.2
// Discord https://discord.gg/CWCF3C9
//
////////////////////////////////////////////////////////////////////////////////

#ifndef TRINITY_REACTORAI_H
#define TRINITY_REACTORAI_H

#include "CombatAI.h"

class Unit;

class ReactorAI : public AggressorAI
{
    public:

        explicit ReactorAI(Creature* c) : AggressorAI(c) {}

        void MoveInLineOfSight(Unit*) {};

        static int Permissible(const Creature*);
};
#endif

