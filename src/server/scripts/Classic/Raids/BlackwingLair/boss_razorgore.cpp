////////////////////////////////////////////////////////////////////////////////
//
// Project-Hellscream https://hellscream.org
// Copyright (C) 2018-2020 Project-Hellscream-6.2
// Discord https://discord.gg/CWCF3C9
//
////////////////////////////////////////////////////////////////////////////////

/* ScriptData
SDName: Boss_Razorgore
SD%Complete: 80
SDComment: Needs additional review. Phase 1 NYI (Grethok the Controller)
SDCategory: Blackwing Lair
EndScriptData */

#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "SpellScript.h"
#include "blackwing_lair.h"
#include "Player.h"

//Razorgore Phase 2 Script

enum Say
{
	SAY_EGGS_BROKEN1 = 0,
	SAY_EGGS_BROKEN2 = 1,
	SAY_EGGS_BROKEN3 = 2,
	SAY_DEATH = 3,
};

enum Spells
{

	SPELL_MINDCONTROL = 42013,
	SPELL_CHANNEL = 45537,
	SPELL_EGG_DESTROY = 19873,

	SPELL_CLEAVE = 22540,
	SPELL_WARSTOMP = 24375,
	SPELL_FIREBALLVOLLEY = 22425,
	SPELL_CONFLAGRATION = 23023
};

class boss_razorgore : public CreatureScript
{
public:
	boss_razorgore() : CreatureScript("boss_razorgore") { }

	CreatureAI* GetAI(Creature* creature) const
	{
		return new boss_razorgoreAI(creature);
	}

	struct boss_razorgoreAI : public ScriptedAI
	{
		boss_razorgoreAI(Creature* creature) : ScriptedAI(creature) {}

		uint32 Cleave_Timer;
		uint32 WarStomp_Timer;
		uint32 FireballVolley_Timer;
		uint32 Conflagration_Timer;

		void Reset()
		{
			Cleave_Timer = 15000;                               //These times are probably wrong
			WarStomp_Timer = 35000;
			FireballVolley_Timer = 7000;
			Conflagration_Timer = 12000;
		}

		void EnterCombat(Unit* /*who*/)
		{
			DoZoneInCombat();
		}

		void JustDied(Unit* /*killer*/)
		{
			DoScriptText(SAY_DEATH, me);
		}

		void UpdateAI(const uint32 diff)
		{
			if (!UpdateVictim())
				return;

			//Cleave_Timer
			if (Cleave_Timer <= diff)
			{
				DoCast(me->getVictim(), SPELL_CLEAVE);
				Cleave_Timer = urand(7000, 10000);
			}
			else Cleave_Timer -= diff;

			//WarStomp_Timer
			if (WarStomp_Timer <= diff)
			{
				DoCast(me->getVictim(), SPELL_WARSTOMP);
				WarStomp_Timer = urand(15000, 25000);
			}
			else WarStomp_Timer -= diff;

			//FireballVolley_Timer
			if (FireballVolley_Timer <= diff)
			{
				DoCast(me->getVictim(), SPELL_FIREBALLVOLLEY);
				FireballVolley_Timer = urand(12000, 15000);
			}
			else FireballVolley_Timer -= diff;

			//Conflagration_Timer
			if (Conflagration_Timer <= diff)
			{
				DoCast(me->getVictim(), SPELL_CONFLAGRATION);
				//We will remove this threat reduction and add an aura check.

				//if (DoGetThreat(me->getVictim()))
				//DoModifyThreatPercent(me->getVictim(), -50);

				Conflagration_Timer = 12000;
			}
			else Conflagration_Timer -= diff;

			// Aura Check. If the gamer is affected by confliguration we attack a random gamer.
			if (me->getVictim() && me->getVictim()->HasAura(SPELL_CONFLAGRATION))
				if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 1, 100, true))
					me->TauntApply(target);

			DoMeleeAttackIfReady();
		}
	};
};

class go_orb_of_domination : public GameObjectScript
{
public:
	go_orb_of_domination() : GameObjectScript("go_orb_of_domination") { }

	bool OnGossipHello(Player* player, GameObject* go) override
	{
		if (InstanceScript* instance = go->GetInstanceScript())
			if (instance->GetData(DATA_EGG_EVENT) != DONE)
				if (Creature* razor = Unit::GetCreature(*go, instance ? instance->GetData64(DATA_RAZORGORE_THE_UNTAMED) : 0))
				{
					razor->Attack(player, true);
					player->CastSpell(razor, SPELL_MINDCONTROL);
				}
		return true;
	}
};


class spell_egg_event : public SpellScriptLoader
{
public:
	spell_egg_event() : SpellScriptLoader("spell_egg_event") { }

	class spell_egg_eventSpellScript : public SpellScript
	{
		//PrepareSpellScript(spell_egg_eventSpellScript);

		void HandleOnHit()
		{
			if (InstanceScript* instance = GetCaster()->GetInstanceScript())
				instance->SetData(DATA_EGG_EVENT, SPECIAL);
		}

		void Register() override
		{
			//	OnHit += SpellHitFn(spell_egg_eventSpellScript::HandleOnHit);
		}
	};

	SpellScript* GetSpellScript() const override
	{
		return new spell_egg_eventSpellScript();
	}
};

#ifndef __clang_analyzer__
void AddSC_boss_razorgore()
{
	new boss_razorgore();
	new go_orb_of_domination();
	new spell_egg_event();

}
#endif

