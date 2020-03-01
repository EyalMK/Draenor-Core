////////////////////////////////////////////////////////////////////////////////
//
// Project-Hellscream https://hellscream.org
// Copyright (C) 2018-2020 Project-Hellscream-6.2
// Discord https://discord.gg/CWCF3C9
//
////////////////////////////////////////////////////////////////////////////////

/* ScriptData
SDName: Boss_Buru
SD%Complete: 0
SDComment: Place Holder
SDCategory: Ruins of Ahn'Qiraj
EndScriptData*/

#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "ruins_of_ahnqiraj.h"

enum Yells
{
    EMOTE_TARGET               = -1509002
};

class boss_buru : public CreatureScript
{
    public:
        boss_buru() : CreatureScript("boss_buru") { }

        struct boss_buruAI : public ScriptedAI
        {
            boss_buruAI(Creature* creature) : ScriptedAI(creature)
            {
            }
        };

        CreatureAI* GetAI(Creature* creature) const
        {
            return new boss_buruAI(creature);
        }
};

#ifndef __clang_analyzer__
void AddSC_boss_buru()
{
    new boss_buru();
}
#endif
