////////////////////////////////////////////////////////////////////////////////
//
// Project-Hellscream https://hellscream.org
// Copyright (C) 2018-2020 Project-Hellscream-6.2
// Discord https://discord.gg/CWCF3C9
//
////////////////////////////////////////////////////////////////////////////////

/* ScriptData
SDName: Duskwood
SD%Complete: 100
SDComment: Quest Support:8735
SDCategory: Duskwood
EndScriptData */

#include "ScriptMgr.h"
#include "ScriptedCreature.h"

enum Yells
{
    YELL_TWILIGHTCORRUPTOR_RESPAWN                                  = 0,
    YELL_TWILIGHTCORRUPTOR_AGGRO                                    = 1,
    YELL_TWILIGHTCORRUPTOR_KILL                                     = 2
};


/*######
# at_twilight_grove
######*/

class at_twilight_grove : public AreaTriggerScript
{
public:
    at_twilight_grove() : AreaTriggerScript("at_twilight_grove") { }

    bool OnTrigger(Player* player, const AreaTriggerEntry* /*at*/)
    {
        if (player->HasQuestForItem(21149))
        {
            if (Unit* TCorrupter = player->SummonCreature(15625, -10328.16f, -489.57f, 49.95f, 0, TEMPSUMMON_MANUAL_DESPAWN, 60000))
            {
                TCorrupter->setFaction(14);
                TCorrupter->SetMaxHealth(832750);
            }
            if (Creature* CorrupterSpeaker = player->SummonCreature(1, player->GetPositionX(), player->GetPositionY(), player->GetPositionZ()-1, 0, TEMPSUMMON_TIMED_DESPAWN, 15000))
            {
                CorrupterSpeaker->SetName("Twilight Corrupter");
                CorrupterSpeaker->SetVisible(true);
                CorrupterSpeaker->AI()->Talk(YELL_TWILIGHTCORRUPTOR_RESPAWN, player->GetGUID());
            }
        }
        return false;
    };
};

/*######
# boss_twilight_corrupter
######*/

#define SPELL_SOUL_CORRUPTION 25805
#define SPELL_CREATURE_OF_NIGHTMARE 25806
#define SPELL_LEVEL_UP 24312

class boss_twilight_corrupter : public CreatureScript
{
public:
    boss_twilight_corrupter() : CreatureScript("boss_twilight_corrupter") { }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new boss_twilight_corrupterAI (creature);
    }

    struct boss_twilight_corrupterAI : public ScriptedAI
    {
        boss_twilight_corrupterAI(Creature* creature) : ScriptedAI(creature) {}

        uint32 SoulCorruption_Timer;
        uint32 CreatureOfNightmare_Timer;
        uint8 KillCount;

        void Reset()
        {
            SoulCorruption_Timer = 15000;
            CreatureOfNightmare_Timer = 30000;
            KillCount = 0;
        }
        void EnterCombat(Unit* /*who*/)
        {
            Talk(YELL_TWILIGHTCORRUPTOR_AGGRO);
        }

        void KilledUnit(Unit* victim)
        {
            if (victim->IsPlayer())
            {
                ++KillCount;
                Talk(YELL_TWILIGHTCORRUPTOR_KILL, victim->GetGUID());

                if (KillCount == 3)
                {
                    DoCast(me, SPELL_LEVEL_UP, true);
                    KillCount = 0;
                }
            }
        }

        void UpdateAI(const uint32 diff)
        {
            if (!UpdateVictim())
                return;
            if (SoulCorruption_Timer <= diff)
            {
                DoCast(me->getVictim(), SPELL_SOUL_CORRUPTION);
                SoulCorruption_Timer = rand()%4000+15000; //gotta confirm Timers
            } else SoulCorruption_Timer-=diff;

            if (CreatureOfNightmare_Timer <= diff)
            {
                DoCast(me->getVictim(), SPELL_CREATURE_OF_NIGHTMARE);
                CreatureOfNightmare_Timer = 45000; //gotta confirm Timers
            } else CreatureOfNightmare_Timer-=diff;
            DoMeleeAttackIfReady();
        };
    };
};


enum SpellSummonStalvanData
{
	NPC_STALVAN = 315,
	NPC_TOBIAS = 43453,
	NPC_WORGEN_TOBIAS = 43797,

	DISPLAYID_WORGEN_TOBIAS = 33508,
	QUEST_MISTMANTLES_REVENGE = 26674,
};

const Position stalvanPosition = { -10371.72f, -1251.92f, 35.99339f };
const Position stalvanDestination = { -10369.932617f, -1253.7677f, 35.909294f };
const float stalvanOrientation = 5.532694f;

const uint8 tobiasPositionsCount = 4;
const Position tobiasPositions[tobiasPositionsCount] = {
	{ -10351.5f, -1256.7f, 34.8566f },
{ -10357.5f, -1256.8f, 35.3863f },
{ -10363.5f, -1257.0f, 35.9107f },
{ -10365.8f, -1255.7f, 35.9098f }
};

const float tobiasOrientation = 3.168259f;

enum StalvanData
{
	SPELL_WORGEN_TRANSFORMATION = 81908,

	EVENT_STALVAN_STEP_1 = 1,
	EVENT_STALVAN_STEP_2 = 2,
	EVENT_STALVAN_STEP_3 = 3,
	EVENT_STALVAN_STEP_4 = 4,
	EVENT_STALVAN_STEP_5 = 5,
	EVENT_STALVAN_STEP_6 = 6,

	EVENT_TOBIAS_STEP_1 = 7,
	EVENT_TOBIAS_STEP_2 = 8,
	EVENT_TOBIAS_STEP_3 = 9,
	EVENT_TOBIAS_STEP_4 = 10,

	SAY_00 = 0,
	SAY_01 = 1,
	SAY_02 = 2,
	SAY_03 = 3,
	SAY_04 = 4,
	SAY_05 = 5,
	SAY_06 = 6,
};

class npc_stalvan : public CreatureScript
{
public:
	npc_stalvan() : CreatureScript("npc_stalvan") { }

	struct npc_stalvanAI : public ScriptedAI
	{
		npc_stalvanAI(Creature* creature) : ScriptedAI(creature)
		{
		}

		void Reset() override
		{
			_events.Reset();
			_events.ScheduleEvent(EVENT_STALVAN_STEP_1, 3000);
			_events.ScheduleEvent(EVENT_STALVAN_STEP_2, 8000);
			_events.ScheduleEvent(EVENT_STALVAN_STEP_3, 15000);
			_events.ScheduleEvent(EVENT_STALVAN_STEP_4, 23000);
			_events.ScheduleEvent(EVENT_STALVAN_STEP_5, 26000);
			_events.ScheduleEvent(EVENT_STALVAN_STEP_6, 32000);

			_events.ScheduleEvent(EVENT_TOBIAS_STEP_1, 5000);
			_events.ScheduleEvent(EVENT_TOBIAS_STEP_2, 9000);
			_events.ScheduleEvent(EVENT_TOBIAS_STEP_3, 16000);
			_events.ScheduleEvent(EVENT_TOBIAS_STEP_4, 27000);
		}

		void JustDied(Unit* /*killer*/) override
		{
			Talk(SAY_06);
			GetTobias()->AI()->Talk(SAY_04);
			GetTobias()->DespawnOrUnsummon(4000);
		}

		Creature* GetTobias()
		{
			if (Creature* tobias = me->FindNearestCreature(NPC_TOBIAS, 30, true))
				return tobias;

			return me->FindNearestCreature(NPC_WORGEN_TOBIAS, 30, true);
		}

		void UpdateAI(uint32 diff) override
		{
			_events.Update(diff);

			while (uint32 eventId = _events.ExecuteEvent())
			{
				switch (eventId)
				{
				case EVENT_STALVAN_STEP_1:
					me->SetWalk(true);
					me->SetSpeed(MOVE_WALK, 2.5);
					me->GetMotionMaster()->MovePoint(0, stalvanDestination, true);
					Talk(SAY_00);
					break;

				case EVENT_STALVAN_STEP_2:
					Talk(SAY_01);
					break;

				case EVENT_STALVAN_STEP_3:
					Talk(SAY_02);
					break;

				case EVENT_STALVAN_STEP_4:
					Talk(SAY_03);
					break;

				case EVENT_STALVAN_STEP_5:
					Talk(SAY_04);
					break;

				case EVENT_STALVAN_STEP_6:
					Talk(SAY_05);
					break;

				case EVENT_TOBIAS_STEP_1:
					GetTobias()->SetFacingToObject(me);
					me->SetFacingToObject(GetTobias());
					GetTobias()->AI()->Talk(SAY_00);
					break;

				case EVENT_TOBIAS_STEP_2:
					GetTobias()->AI()->Talk(SAY_01);
					break;

				case EVENT_TOBIAS_STEP_3:
					GetTobias()->AI()->Talk(SAY_02);
					break;

				case EVENT_TOBIAS_STEP_4:
					GetTobias()->CastSpell(GetTobias(), SPELL_WORGEN_TRANSFORMATION, true);
					GetTobias()->SetReactState(REACT_AGGRESSIVE);

					me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_IMMUNE_TO_PC);
					me->AddThreat(GetTobias(), 10.f);
					GetTobias()->AddThreat(me, 10.f);
					GetTobias()->SetInCombatWith(me);

					if (me->Attack(GetTobias(), true))
						me->GetMotionMaster()->MoveChase(GetTobias());

					if (GetTobias()->Attack(me, true))
						GetTobias()->GetMotionMaster()->MoveChase(me);

					me->SetReactState(REACT_AGGRESSIVE);

					GetTobias()->AI()->Talk(SAY_03);
					break;

				default:
					break;
				}
			}

			if (!UpdateVictim())
				return;

			DoMeleeAttackIfReady();
		}

	private:
		EventMap _events;
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_stalvanAI(creature);
	}
};

enum SoothingIncenseCloudData
{
	EVENT_SELECT_TARGET = 1,
	NPC_FORLORN_SPIRIT = 43923,
	NPC_FORLORN_SPIRIT_KILLCREDIT = 43930,
};

class npc_soothing_incense_cloud : public CreatureScript
{
public:
	npc_soothing_incense_cloud() : CreatureScript("npc_soothing_incense_cloud") { }

	struct npc_soothing_incense_cloudAI : public ScriptedAI
	{
		npc_soothing_incense_cloudAI(Creature* creature) : ScriptedAI(creature)
		{
		}

		void Reset() override
		{
			_events.Reset();
			_events.ScheduleEvent(EVENT_SELECT_TARGET, 500);
		}

		Player* GetOwner()
		{
			return me->ToTempSummon()->GetSummoner()->ToPlayer();
		}

		void SelectTargets()
		{
			me->GetCreatureListWithEntryInGrid(_selectedTargets, NPC_FORLORN_SPIRIT, 5.f);
		}

		void KillSelectedCreaturesAndRewardPlayer()
		{
			for (auto creature : _selectedTargets)
			{
				if (!creature->isAlive())
					continue;

				GetOwner()->RewardPlayerAndGroupAtEvent(NPC_FORLORN_SPIRIT_KILLCREDIT, GetOwner());
				creature->DisappearAndDie();
			}
		}

		void UpdateAI(uint32 diff) override
		{
			_events.Update(diff);

			while (uint32 eventId = _events.ExecuteEvent())
			{
				switch (eventId)
				{
				case EVENT_SELECT_TARGET:
					SelectTargets();
					KillSelectedCreaturesAndRewardPlayer();
					break;
				}
			}
		}

	private:
		EventMap _events;
		std::list<Creature*> _selectedTargets;
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_soothing_incense_cloudAI(creature);
	}
};

enum MorbentFel
{
	SPELL_SACRED_CLEANSING = 82130,
	NPC_WEAKENED_MORBENT_FEL = 43762,
	NPC_MORBENT_FEL = 43761
};

class spell_sacred_cleansing : public SpellScript
{
	PrepareSpellScript(spell_sacred_cleansing);

	void SelectTarget(WorldObject*& target)
	{
		target = GetCaster()->FindNearestCreature(NPC_MORBENT_FEL, 15.0f, true);
	}

	SpellCastResult CheckRequirement()
	{
		Creature* fel = GetCaster()->FindNearestCreature(NPC_MORBENT_FEL, 15.0f, true);

		if (!fel)
			return SPELL_FAILED_INCORRECT_AREA;
		return SPELL_CAST_OK;
	}

	void HandleDummy(SpellEffIndex /*effIndex*/)
	{
		Unit* hitUnit = GetHitUnit();
		if (!hitUnit || !GetCaster()->IsPlayer())
			return;

		if (Creature* target = hitUnit->ToCreature())
		{
			switch (target->GetEntry())
			{
			case NPC_MORBENT_FEL:
				Position l_Pos;
				target->GetPosition(&l_Pos);

				GetCaster()->SummonCreature(NPC_WEAKENED_MORBENT_FEL, l_Pos);
				target->DespawnOrUnsummon();
				break;

			default:
				break;
			}
		}
	}

	void Register() override
	{
		OnObjectTargetSelect += SpellObjectTargetSelectFn(spell_sacred_cleansing::SelectTarget, EFFECT_0, TARGET_UNIT_NEARBY_ENTRY);
		OnEffectHitTarget += SpellEffectFn(spell_sacred_cleansing::HandleDummy, EFFECT_0, SPELL_EFFECT_DUMMY);
		OnCheckCast += SpellCheckCastFn(spell_sacred_cleansing::CheckRequirement);
	}
};

class spell_summon_stalvan : public SpellScript
{
	PrepareSpellScript(spell_summon_stalvan);

	bool IsEventRunning()
	{
		return GetCaster()->FindNearestCreature(NPC_STALVAN, 20, true) != nullptr;
	}

	SpellCastResult CheckRequirement()
	{
		return SPELL_CAST_OK;
	}

	void HandleSendEvent(SpellEffIndex /*effIndex*/)
	{
		if (GetCaster()->GetTypeId() != TYPEID_PLAYER)
			return;

		if (GetCaster()->ToPlayer()->GetQuestStatus(QUEST_MISTMANTLES_REVENGE) != QUEST_STATUS_INCOMPLETE)
			return;

		if (IsEventRunning())
			return;

		SummonStalvan();
		SummonTobias();
	}

	void SummonStalvan()
	{
		if (TempSummon* stalvan = GetCaster()->SummonCreature(NPC_STALVAN, stalvanPosition))
		{
			stalvan->SetFacingTo(stalvanOrientation);
			stalvan->SetReactState(REACT_PASSIVE);
		}
	}

	void SummonTobias()
	{
		if (TempSummon* tobias = GetCaster()->SummonCreature(NPC_TOBIAS, tobiasPositions[0]))
		{
			tobias->RemoveFlag(UNIT_FIELD_NPC_FLAGS, UNIT_NPC_FLAG_QUESTGIVER | UNIT_NPC_FLAG_GOSSIP);
			tobias->SetWalk(true);
			tobias->SetSpeed(MOVE_WALK, 3.5);
			tobias->GetMotionMaster()->MovePoint(0, tobiasPositions[3], true);
			tobias->SetReactState(REACT_PASSIVE);
		}
	}

	void Register() override
	{
		OnEffectHit += SpellEffectFn(spell_summon_stalvan::HandleSendEvent, EFFECT_0, SPELL_EFFECT_SEND_EVENT);
		OnCheckCast += SpellCheckCastFn(spell_summon_stalvan::CheckRequirement);
	}

};

class npc_ebenlocke : public CreatureScript
{
public:
	npc_ebenlocke() : CreatureScript("npc_ebenlocke") { }

	enum Data
	{
		QUEST_EMBALMERS_REVENGE = 26727,
		NPC_STITCHES = 43862,
		ACTION_START_EVENT = 1
	};

	bool OnQuestAccept(Player* player, Creature* creature, Quest const* quest) override
	{
		switch (quest->GetQuestId())
		{
		case QUEST_EMBALMERS_REVENGE:
			creature->AI()->SetGUID(player->GetGUID());
			creature->AI()->DoAction(ACTION_START_EVENT);
			break;
		}

		return true;
	}

	struct npc_ebenlockeAI : public ScriptedAI
	{
		npc_ebenlockeAI(Creature* creature) : ScriptedAI(creature) { }

		ObjectGuid PlayerGUID;
		uint32 SummonTimer;

		bool bSummoned;

		void Reset() override
		{
			bSummoned = false;
			SummonTimer = 2000;
		}

		void SetGUID(ObjectGuid guid, int32 /*id*/)
		{
			PlayerGUID = guid;
		}

		void DoAction(int32 action) override
		{
			switch (action)
			{
			case ACTION_START_EVENT:
				SummonTimer = 2000;
				break;
			}
		}

		void SummonSpawns()
		{
			if (!bSummoned)
			{
				if (Creature* stitches = me->SummonCreature(NPC_STITCHES, -10553.90f, -1171.27f, 27.8604f, 1.48514f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 90000, true))
					bSummoned = true;
			}
		}

		void UpdateAI(uint32 diff) override
		{
			if (SummonTimer < diff)
			{

				if (Player* player = ObjectAccessor::GetPlayer(*me, PlayerGUID))
				{
					SummonSpawns();
				}
			}
			else SummonTimer -= diff;
		}

	private:
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_ebenlockeAI(creature);
	}
};

#ifndef __clang_analyzer__
void AddSC_duskwood()
{
    new boss_twilight_corrupter();
    new at_twilight_grove();

	new spell_summon_stalvan();
	new npc_stalvan();
	new npc_soothing_incense_cloud();
	new spell_sacred_cleansing();
	new npc_ebenlocke();
}
#endif
