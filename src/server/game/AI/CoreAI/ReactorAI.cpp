////////////////////////////////////////////////////////////////////////////////
//
// Project-Hellscream https://hellscream.org
// Copyright (C) 2018-2020 Project-Hellscream-6.2
// Discord https://discord.gg/CWCF3C9
//
////////////////////////////////////////////////////////////////////////////////

#include "ByteBuffer.h"
#include "ReactorAI.h"
#include "Errors.h"
#include "Log.h"
#include "ObjectAccessor.h"
#include "CreatureAIImpl.h"

// #define REACTOR_VISIBLE_RANGE (26.46f) - It has not any use at all

int ReactorAI::Permissible(const Creature* creature)
{
    if (creature->isCivilian() || creature->IsNeutralToAll())
        return PERMIT_BASE_REACTIVE;

    return PERMIT_BASE_NO;
}
