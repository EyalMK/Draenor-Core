////////////////////////////////////////////////////////////////////////////////
//
// Project-Hellscream https://hellscream.org
// Copyright (C) 2018-2020 Project-Hellscream-6.2
// Discord https://discord.gg/CWCF3C9
//
////////////////////////////////////////////////////////////////////////////////

/* ScriptData
SDName: Boss_Ossirian
SD%Complete: 0
SDComment: Place holder
SDCategory: Ruins of Ahn'Qiraj
EndScriptData */

#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "ruins_of_ahnqiraj.h"

enum Yells
{
    SAY_SURPREME2   = -1509019,
    SAY_SURPREME3   = -1509020,
    SAY_RAND_INTRO1 = -1509021,
    SAY_RAND_INTRO2 = -1509022,
    SAY_RAND_INTRO3 = -1509023,
    SAY_RAND_INTRO4 = -1509024,                            //possibly old?
    SAY_AGGRO       = -1509025,
    SAY_SLAY        = -1509026,
    SAY_DEATH       = -1509027
};

class boss_ossirian : public CreatureScript
{
    public:
        boss_ossirian() : CreatureScript("boss_ossirian") { }

        struct boss_ossirianAI : public ScriptedAI
        {
            boss_ossirianAI(Creature* creature) : ScriptedAI(creature)
            {
            }
        };

        CreatureAI* GetAI(Creature* creature) const
        {
            return new boss_ossirianAI (creature);
        }
};

#ifndef __clang_analyzer__
void AddSC_boss_ossirian()
{
    new boss_ossirian();
}
#endif
