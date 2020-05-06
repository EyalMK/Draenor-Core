////////////////////////////////////////////////////////////////////////////////
//
// Project-Hellscream https://hellscream.org
// Copyright (C) 2018-2020 Project-Hellscream-6.2
// Discord https://discord.gg/CWCF3C9
//
////////////////////////////////////////////////////////////////////////////////

#include "ScriptMgr.h"
#include "MotionMaster.h"
#include "ScriptedCreature.h"
#include "ScriptedEscortAI.h"
#include "Player.h"


/// OOX09HL - 7806
enum eOOX
{
	// Texts
	SAY_OOX_START = 0,
	SAY_OOX_AGGRO = 1,
	SAY_OOX_AMBUSH = 2,
	SAY_OOX_AMBUSH_REPLY = 3,
	SAY_OOX_END = 4,

	// Quest
	QUEST_RESQUE_OOX_09 = 836,

	// Npcs
	NPC_MARAUDING_OWL = 7808,
	NPC_VILE_AMBUSHER = 7809,

	// Factions
	FACTION_ESCORTEE_A = 774,
	FACTION_ESCORTEE_H = 775
};

class npc_oox09hl : public CreatureScript
{
public:
	npc_oox09hl() : CreatureScript("npc_oox09hl") { }

	struct npc_oox09hlAI : public npc_escortAI
	{
		npc_oox09hlAI(Creature* creature) : npc_escortAI(creature) { }

		uint8 m_uiSummonCount;

		void Reset() override {
			if (!HasEscortState(STATE_ESCORT_ESCORTING))
				m_uiSummonCount = 0;
		}

		void EnterCombat(Unit* who) override
		{
			if (who->GetEntry() == NPC_MARAUDING_OWL || who->GetEntry() == NPC_VILE_AMBUSHER)
				return;

			Talk(SAY_OOX_AGGRO);
		}

		void JustSummoned(Creature* summoned) override
		{
			summoned->GetMotionMaster()->MovePoint(0, me->GetPositionX(), me->GetPositionY(), me->GetPositionZ());
		}

		void sQuestAccept(Player* player, Quest const* quest) override
		{
			if (quest->GetQuestId() == QUEST_RESQUE_OOX_09)
			{
				me->SetStandState(UNIT_STAND_STATE_STAND);
				me->setFaction(player->GetTeam() == ALLIANCE ? FACTION_ESCORTEE_A : FACTION_ESCORTEE_H);
				Talk(SAY_OOX_START);
				npc_escortAI::Start(false, false, player->GetGUID(), quest);
			}
		}

		void WaypointReached(uint32 waypointId) override
		{
			switch (waypointId)
			{
			case 26:
				Talk(SAY_OOX_AMBUSH);
				break;
			case 43:
				Talk(SAY_OOX_AMBUSH);
				break;
			case 64:
				Talk(SAY_OOX_END);
				if (Player* player = GetPlayerForEscort())
					player->GroupEventHappens(QUEST_RESQUE_OOX_09, me);
				break;
			}
		}

		void WaypointStart(uint32 pointId) override
		{
			switch (pointId)
			{
			case 27:
				if (m_uiSummonCount >= 3)
					break;

				for (uint8 i = 0; i < 3; ++i)
				{
					const Position src = { 147.927444f, -3851.513428f, 130.893f, 0 };
					Position dst;
					me->GetRandomPoint(src, 7.0f, dst);
					DoSummon(NPC_MARAUDING_OWL, dst, 25000, TEMPSUMMON_CORPSE_TIMED_DESPAWN);
					++m_uiSummonCount;
				}
				break;
			case 44:
				if (m_uiSummonCount >= 6)
					break;

				for (uint8 i = 0; i < 3; ++i)
				{
					const Position src = { -141.151581f, -4291.213867f, 120.130f, 0 };
					Position dst;
					me->GetRandomPoint(src, 7.0f, dst);
					me->SummonCreature(NPC_VILE_AMBUSHER, dst, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 25000);
					++m_uiSummonCount;
				}
				break;
			}
			// make sure we always have the right stand state
			me->SetStandState(UNIT_STAND_STATE_STAND);
		}
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_oox09hlAI(creature);
	}
};


/// Trained Razorbeak - 2657
enum TrainedRazorbeak
{
	QUEST_RAZORBEAKFRIENDS = 26546,
	SPELL_FEED_RAZORBEAK = 80782,
	NPC_RAZORBEAK_CREDIT = 43236
};

class npc_trained_razorbeak : public CreatureScript
{
public:
	npc_trained_razorbeak() : CreatureScript("npc_trained_razorbeak") { }


	struct npc_trained_razorbeakAI : public ScriptedAI
	{
		npc_trained_razorbeakAI(Creature* creature) : ScriptedAI(creature) {}

		void SpellHit(Unit* caster, const SpellInfo* spell) override
		{
			if (spell->Id != SPELL_FEED_RAZORBEAK)
				return;

			Player* player = caster->ToPlayer();
			if (player && player->GetQuestStatus(QUEST_RAZORBEAKFRIENDS) == QUEST_STATUS_INCOMPLETE)
				player->KilledMonsterCredit(NPC_RAZORBEAK_CREDIT);
		}

	};
	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_trained_razorbeakAI(creature);
	}
};


/// Spell Tiki Torch - 79513
enum FacesEvil
{
	NPC_MASK_BURNT_CREDIT = 42704
};

class spell_tiki_torch : public SpellScriptLoader
{
public:
	spell_tiki_torch() : SpellScriptLoader("spell_tiki_torch") { }

	class spell_tiki_torch_SpellScript : public SpellScript
	{
		PrepareSpellScript(spell_tiki_torch_SpellScript);

		void HandleScript(SpellEffIndex /*effIndex*/)
		{
			if (Player* player = GetCaster()->ToPlayer())
			{
				if (Creature* target = GetHitCreature())
				{
					player->RewardPlayerAndGroupAtEvent(NPC_MASK_BURNT_CREDIT, GetCaster());
					target->DisappearAndDie();
				}
			}
		}

		void SelectTarget(WorldObject*& target)
		{
			target = GetCaster()->FindNearestCreature(NPC_MASK_BURNT_CREDIT, 15.0f, true);
		}

		void Register() override
		{
			OnObjectTargetSelect += SpellObjectTargetSelectFn(spell_tiki_torch_SpellScript::SelectTarget, EFFECT_0, TARGET_UNIT_NEARBY_ENTRY);
			OnEffectHitTarget += SpellEffectFn(spell_tiki_torch_SpellScript::HandleScript, EFFECT_0, SPELL_EFFECT_DUMMY);
		}
	};

	SpellScript* GetSpellScript() const
	{
		return new spell_tiki_torch_SpellScript();
	}
};


/// Spell Ritual Shadra - 80469
enum RitualShadra
{
	NPC_SHADRA_NW_ALTAR_BUNNY = 43067,
	NPC_SHADRA_SW_ALTAR_BUNNY = 43068,
	NPC_SHADRA_E_ALTAR_BUNNY = 43069
};

class spell_ritual_of_shadra : public SpellScriptLoader
{
public:
	spell_ritual_of_shadra() : SpellScriptLoader("spell_ritual_of_shadra") { }

	class spell_ritual_of_shadra_SpellScript : public SpellScript
	{
		PrepareSpellScript(spell_ritual_of_shadra_SpellScript);

		void SelectTarget(WorldObject*& target)
		{
			target = GetCaster()->FindNearestCreature(NPC_SHADRA_NW_ALTAR_BUNNY, 15.0f, true);
			if (!target)
				target = GetCaster()->FindNearestCreature(NPC_SHADRA_SW_ALTAR_BUNNY, 15.0f, true);
			if (!target)
				target = GetCaster()->FindNearestCreature(NPC_SHADRA_E_ALTAR_BUNNY, 15.0f, true);
		}

		SpellCastResult CheckRequirement()
		{
			Creature* northwest = GetCaster()->FindNearestCreature(NPC_SHADRA_NW_ALTAR_BUNNY, 15.0f, true);
			Creature* southwest = GetCaster()->FindNearestCreature(NPC_SHADRA_SW_ALTAR_BUNNY, 15.0f, true);
			Creature* east = GetCaster()->FindNearestCreature(NPC_SHADRA_E_ALTAR_BUNNY, 15.0f, true);

			if (!northwest && !southwest && !east)
				return SPELL_FAILED_INCORRECT_AREA;
			return SPELL_CAST_OK;
		}

		void HandleDummy(SpellEffIndex /*effIndex*/)
		{
			Creature* hitCreature = GetHitCreature();
			Player* player = GetCaster()->ToPlayer();
			if (!hitCreature || !player)
				return;

			switch (hitCreature->GetEntry())
			{
			case NPC_SHADRA_NW_ALTAR_BUNNY:
				player->RewardPlayerAndGroupAtEvent(hitCreature->GetEntry(), GetCaster());
				break;
			case NPC_SHADRA_SW_ALTAR_BUNNY:
				player->RewardPlayerAndGroupAtEvent(hitCreature->GetEntry(), GetCaster());
				break;
			case NPC_SHADRA_E_ALTAR_BUNNY:
				player->RewardPlayerAndGroupAtEvent(hitCreature->GetEntry(), GetCaster());
				break;
			default:
				break;
			}
		}

		void Register() override
		{
			OnObjectTargetSelect += SpellObjectTargetSelectFn(spell_ritual_of_shadra_SpellScript::SelectTarget, EFFECT_0, TARGET_UNIT_NEARBY_ENTRY);
			OnEffectHitTarget += SpellEffectFn(spell_ritual_of_shadra_SpellScript::HandleDummy, EFFECT_0, SPELL_EFFECT_DUMMY);
			OnCheckCast += SpellCheckCastFn(spell_ritual_of_shadra_SpellScript::CheckRequirement);
		}
	};

	SpellScript* GetSpellScript() const
	{
		return new spell_ritual_of_shadra_SpellScript();
	}
};


#ifndef __clang_analyzer__
void AddSC_hinterlands()
{
	// Npcs
	new npc_oox09hl();
	new npc_trained_razorbeak();

	// Spells
	new spell_tiki_torch();
	new spell_ritual_of_shadra();
}
#endif

