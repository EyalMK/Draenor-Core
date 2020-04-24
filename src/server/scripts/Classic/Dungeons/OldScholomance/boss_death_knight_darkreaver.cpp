////////////////////////////////////////////////////////////////////////////////
//
// Project-Hellscream https://hellscream.org
// Copyright (C) 2018-2020 Project-Hellscream-6.2
// Discord https://discord.gg/CWCF3C9
//
////////////////////////////////////////////////////////////////////////////////

/* ScriptData
SDName: Boss_Death_knight_darkreaver
SD%Complete: 100
SDComment:
SDCategory: Scholomance
EndScriptData */

#include "ScriptMgr.h"
#include "ScriptedCreature.h"

class boss_death_knight_darkreaver : public CreatureScript
{
public:
    boss_death_knight_darkreaver() : CreatureScript("boss_death_knight_darkreaver") { }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new boss_death_knight_darkreaverAI (creature);
    }

    struct boss_death_knight_darkreaverAI : public ScriptedAI
    {
        boss_death_knight_darkreaverAI(Creature* creature) : ScriptedAI(creature) {}

        void Reset()
        {
        }

        void DamageTaken(Unit* /*done_by*/, uint32 &damage, SpellInfo const* /*p_SpellInfo*/)
        {
            if (me->GetHealth() <= damage)
                DoCast(me, 23261, true);   //Summon Darkreaver's Fallen Charger
        }

        void EnterCombat(Unit* /*who*/)
        {
        }
    };

};

#ifndef __clang_analyzer__
void AddSC_boss_death_knight_darkreaver()
{
    new boss_death_knight_darkreaver();
}
#endif
