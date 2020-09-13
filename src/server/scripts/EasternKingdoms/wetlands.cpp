////////////////////////////////////////////////////////////////////////////////
//
// Project-Hellscream https://hellscream.org
// Copyright (C) 2018-2020 Project-Hellscream-6.2
// Discord https://discord.gg/CWCF3C9
//
////////////////////////////////////////////////////////////////////////////////


#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "ScriptedEscortAI.h"
#include "Vehicle.h"

/*######
## npc_tapoke_slim_jahn
######*/

enum eTapokeSlim
{
    QUEST_MISSING_DIPLO_PT11    = 1249,
    FACTION_ENEMY               = 168,
    SPELL_STEALTH               = 1785,
    SPELL_CALL_FRIENDS          = 16457,                    //summons 1x friend
    NPC_SLIMS_FRIEND            = 4971,
    NPC_TAPOKE_SLIM_JAHN        = 4962
};

class npc_tapoke_slim_jahn : public CreatureScript
{
public:
    npc_tapoke_slim_jahn() : CreatureScript("npc_tapoke_slim_jahn") { }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_tapoke_slim_jahnAI(creature);
    }

    struct npc_tapoke_slim_jahnAI : public npc_escortAI
    {
        npc_tapoke_slim_jahnAI(Creature* creature) : npc_escortAI(creature) { }

        bool IsFriendSummoned;

        void Reset()
        {
            if (!HasEscortState(STATE_ESCORT_ESCORTING))
                IsFriendSummoned = false;
        }

        void WaypointReached(uint32 waypointId)
        {
            switch (waypointId)
            {
                case 2:
                    if (me->HasStealthAura())
                        me->RemoveAurasByType(SPELL_AURA_MOD_STEALTH);
                    SetRun();
                    me->setFaction(FACTION_ENEMY);
                    break;
            }
        }

        void EnterCombat(Unit* /*who*/)
        {
            if (HasEscortState(STATE_ESCORT_ESCORTING) && !IsFriendSummoned && GetPlayerForEscort())
            {
                for (uint8 i = 0; i < 3; ++i)
                    DoCast(me, SPELL_CALL_FRIENDS, true);

                IsFriendSummoned = true;
            }
        }

        void JustSummoned(Creature* summoned)
        {
            if (Player* player = GetPlayerForEscort())
                summoned->AI()->AttackStart(player);
        }

        void AttackedBy(Unit* pAttacker)
        {
            if (me->getVictim())
                return;

            if (me->IsFriendlyTo(pAttacker))
                return;

            AttackStart(pAttacker);
        }

        void DamageTaken(Unit* /*pDoneBy*/, uint32& uiDamage, SpellInfo const*  /*p_SpellInfo*/)
        {
            if (HealthBelowPct(20))
            {
                if (Player* player = GetPlayerForEscort())
                {
                    if (player->IsPlayer())
                        CAST_PLR(player)->GroupEventHappens(QUEST_MISSING_DIPLO_PT11, me);

                    uiDamage = 0;

                    me->RestoreFaction();
                    me->RemoveAllAuras();
                    me->DeleteThreatList();
                    me->CombatStop(true);

                    SetRun(false);
                }
            }
        }
    };
};

/*######
## npc_mikhail
######*/

class npc_mikhail : public CreatureScript
{
public:
    npc_mikhail() : CreatureScript("npc_mikhail") { }

    bool OnQuestAccept(Player* player, Creature* creature, const Quest* quest)
    {
        if (quest->GetQuestId() == QUEST_MISSING_DIPLO_PT11)
        {
            Creature* pSlim = creature->FindNearestCreature(NPC_TAPOKE_SLIM_JAHN, 25.0f);

            if (!pSlim)
                return false;

            if (!pSlim->HasStealthAura())
                pSlim->CastSpell(pSlim, SPELL_STEALTH, true);

            if (npc_tapoke_slim_jahn::npc_tapoke_slim_jahnAI* pEscortAI = CAST_AI(npc_tapoke_slim_jahn::npc_tapoke_slim_jahnAI, pSlim->AI()))
                pEscortAI->Start(false, false, player->GetGUID(), quest);
        }
        return false;
    }
};


enum MarshFire
{
	NPC_MARSH_FIRE = 41628,
	QUEST_FOR_PEATS_SAKE = 25939
};

/// Water Blast - 77571
class spell_water_blast : public SpellScriptLoader
{
public:
	spell_water_blast() : SpellScriptLoader("spell_water_blast") { }

	class spell_water_blast_SpellScript : public SpellScript
	{

		PrepareSpellScript(spell_water_blast_SpellScript);

		void HandleScript(SpellEffIndex /*effIndex*/)
		{
			if (!GetHitUnit() || !GetCaster()->IsPlayer() || !GetHitUnit()->ToCreature())
				return;

			GetCaster()->ToPlayer()->RewardPlayerAndGroupAtEvent(NPC_MARSH_FIRE, GetCaster());
			//GetHitUnit()->ToCreature()->DisappearAndDie();
		}

		void SelectTarget(WorldObject*& target)
		{
			target = GetCaster()->FindNearestCreature(NPC_MARSH_FIRE, 10.0f, true);
		}

		void Register() override
		{
			OnObjectTargetSelect += SpellObjectTargetSelectFn(spell_water_blast_SpellScript::SelectTarget, EFFECT_0, TARGET_UNIT_NEARBY_ENTRY);
			OnEffectHitTarget += SpellEffectFn(spell_water_blast_SpellScript::HandleScript, EFFECT_0, SPELL_EFFECT_DUMMY);
		}
	};

	SpellScript* GetSpellScript() const
	{
		return new spell_water_blast_SpellScript();
	}
};


/// Blessed Floodlily - 77571
class spell_blessed_floodlily : public SpellScriptLoader
{
public:
	spell_blessed_floodlily() : SpellScriptLoader("spell_blessed_floodlily") { }

	enum Id
	{
		QUEST_CREDIT_FIRE_BUNNY = 41628
	};

	class spell_blessed_floodlily_SpellScript : public SpellScript
	{
		PrepareSpellScript(spell_blessed_floodlily_SpellScript);

		SpellCastResult CheckCast()
		{
			if (Creature* fireBunny = GetCaster()->FindNearestCreature(QUEST_CREDIT_FIRE_BUNNY, 5.0f, true))
			{
				if (GetCaster()->GetTypeId() == TYPEID_PLAYER)
				{
					fireBunny->DespawnOrUnsummon(1);
					GetCaster()->ToPlayer()->KilledMonsterCredit(QUEST_CREDIT_FIRE_BUNNY);
					return SPELL_CAST_OK;
				}
			}
			return SPELL_CAST_OK;
		}

		void Register()
		{
			OnCheckCast += SpellCheckCastFn(spell_blessed_floodlily_SpellScript::CheckCast);
		}
	};

	SpellScript* GetSpellScript() const
	{
		return new spell_blessed_floodlily_SpellScript();
	}
};



/// Thandol Span - 5990
class Areatrigger_at_thandol_span : public AreaTriggerScript
{
public:
	Areatrigger_at_thandol_span() : AreaTriggerScript("at_thandol_span") { }

	enum Id
	{
		// Quest
		QUEST_THE_BATTLE_OF_THANDOL_SPAN = 26128,

		// Npc
		NPC_CALAMOTH_ASHBEARD = 41522,
		NPC_YORLA_DARKSNARE = 41524,
		NPC_DRUNGELD_GLOWERGLARE = 41553,
		NPC_BALGARAS_THE_FOUL = 41556,
		NPC_THARGAS_ANVILMAR = 41560
	};

	bool OnTrigger(Player* player, AreaTriggerEntry const* trigger)
	{
		if (player->isAlive())
		{
			if (player->GetQuestStatus(QUEST_THE_BATTLE_OF_THANDOL_SPAN) != QUEST_STATUS_INCOMPLETE)
				return false;

			Creature* calamothAlive = player->FindNearestCreature(NPC_CALAMOTH_ASHBEARD, 200.0f, true);
			Creature* calamothDead = player->FindNearestCreature(NPC_CALAMOTH_ASHBEARD, 200.0f, false);
			if (calamothAlive || calamothDead)
				return false;

			// Summon Enemies!
			player->SummonCreature(NPC_CALAMOTH_ASHBEARD, -2406.58f, -2503.34f, 85.19f, 3.14f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 60000);
			player->SummonCreature(NPC_YORLA_DARKSNARE, -2402.32f, -2507.35f, 86.00f, 3.14f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 60000);
			player->SummonCreature(NPC_DRUNGELD_GLOWERGLARE, -2402.33f, -2497.83f, 86.00f, 3.14f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 60000);
			player->SummonCreature(NPC_BALGARAS_THE_FOUL, -2398.67f, -2502.04f, 86.70f, 3.14f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 60000);

			// Summon Friends!
			player->SummonCreature(NPC_THARGAS_ANVILMAR, -2468.30f, -2503.15f, 78.50f, 6.26f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 60000);
			return true;
		}
		return false;
	}
};




#ifndef __clang_analyzer__
void AddSC_wetlands()
{
	/// Npcs
    new npc_tapoke_slim_jahn();
    new npc_mikhail();
	
	 
	/// Spell
	new spell_water_blast();
	new spell_blessed_floodlily();

	/// Areatriggers
	new Areatrigger_at_thandol_span();
}
#endif
