////////////////////////////////////////////////////////////////////////////////
//
// Project-Hellscream https://hellscream.org
// Copyright (C) 2018-2020 Project-Hellscream-6.2
// Discord https://discord.gg/CWCF3C9
//
////////////////////////////////////////////////////////////////////////////////

/* ScriptData
SDName: Ungoro Crater
SD%Complete: 0
SDComment: Support for Quest:
SDCategory: Ungoro Crater
EndScriptData */

/* ContentData
EndContentData */

#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "ScriptedEscortAI.h"
#include "ScriptedFollowerAI.h"

class npc_a_me_01 : public CreatureScript
{
    public:
        npc_a_me_01() : CreatureScript("npc_a_me_01")
        {
        }

        CreatureAI* GetAI(Creature* creature) const
        {
            return new npc_a_me_01AI(creature);
        }

        struct npc_a_me_01AI : public ScriptedAI
        {
            npc_a_me_01AI(Creature* creature) : ScriptedAI(creature)
            {
            }

            EventMap events;

            void Reset()
            {
                events.Reset();
            }

            void UpdateAI(const uint32 /*p_Diff*/)
            {
            }
        };
};

#ifndef __clang_analyzer__
void AddSC_ungoro_crater()
{
    new npc_a_me_01();
}
#endif
