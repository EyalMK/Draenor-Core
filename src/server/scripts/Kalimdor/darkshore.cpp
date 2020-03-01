////////////////////////////////////////////////////////////////////////////////
//
// Project-Hellscream https://hellscream.org
// Copyright (C) 2018-2020 Project-Hellscream-6.2
// Discord https://discord.gg/CWCF3C9
//
////////////////////////////////////////////////////////////////////////////////

/* ScriptData
SDName: Darkshore
SD%Complete: 0
SDComment: Quest support:
SDCategory: Darkshore
EndScriptData */

/* ContentData
EndContentData */

#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "ScriptedGossip.h"
#include "ScriptedEscortAI.h"
#include "ScriptedFollowerAI.h"

class npc_prospector_remtravel : public CreatureScript
{
    public:
        npc_prospector_remtravel() : CreatureScript("npc_prospector_remtravel")
        {
        }

        CreatureAI* GetAI(Creature* creature) const
        {
            return new npc_prospector_remtravelAI(creature);
        }

        struct npc_prospector_remtravelAI : public ScriptedAI
        {
            npc_prospector_remtravelAI(Creature* creature) : ScriptedAI(creature)
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
void AddSC_darkshore()
{
    new npc_prospector_remtravel();
}
#endif
