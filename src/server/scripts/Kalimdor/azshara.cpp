////////////////////////////////////////////////////////////////////////////////
//
// Project-Hellscream https://hellscream.org
// Copyright (C) 2018-2020 Project-Hellscream-6.2
// Discord https://discord.gg/CWCF3C9
//
////////////////////////////////////////////////////////////////////////////////


#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "ScriptedGossip.h"

/// Runaway Shredder - 35111
class npc_runaway_shredder : public CreatureScript
{
public:
	npc_runaway_shredder() : CreatureScript("npc_runaway_shredder") { }

	CreatureAI* GetAI(Creature* pCreature) const
	{
		return new npc_runaway_shredderAI(pCreature);
	}

	enum eMisc
	{
		QUEST_RUNAWAY_SHREDDER	= 14129,
		SPELL_SAW_BLADE			= 32735,
	};

	struct npc_runaway_shredderAI : public ScriptedAI
	{
		npc_runaway_shredderAI(Creature *c) : ScriptedAI(c) { }

		void Reset() override
		{
			me->RemoveFlag(UNIT_FIELD_NPC_FLAGS, UNIT_NPC_FLAG_SPELLCLICK);
		}

		void EnterCombat(Unit* who) override
		{
			if (me->GetDistance(who) <= 40.0f &&  me->GetDistance(who) >= 10.0f) // 10-40 yd range
				me->CastSpell(who, SPELL_SAW_BLADE);
		}

		void DamageTaken(Unit* done_by, uint32& damage, SpellInfo const*  /*p_SpellInfo*/) override
		{
			if (Player* player = done_by->ToPlayer())
			{
				if (player->HasQuest(QUEST_RUNAWAY_SHREDDER))
				{
					if (me->HealthBelowPctDamaged(5, damage))
					{
						damage = 0;
						me->RemoveAllAuras();
						me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
						me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_ATTACKABLE_1);
						me->setFaction(35);
						me->AttackStop();
						done_by->CombatStop(true);
						me->DeleteThreatList();
						me->SetFlag(UNIT_FIELD_NPC_FLAGS, UNIT_NPC_FLAG_SPELLCLICK);
						Talk(0);
					}
				}
			  }
		}

		void UpdateAI(const uint32 /*diff*/) override
		{
			DoMeleeAttackIfReady();
		}
	};
};


void AddSC_azshara()
{
	new npc_runaway_shredder();
}
