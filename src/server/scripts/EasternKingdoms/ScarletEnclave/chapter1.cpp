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
#include "Vehicle.h"
#include "ObjectMgr.h"
#include "ScriptedEscortAI.h"
#include "CombatAI.h"
#include "PassiveAI.h"

uint32 race_summon[10][2] =
{
	{ 52473, 52474 },
	{ 52484, 52485 },
	{ 52475, 52479 },
	{ 52481, 52480 },
	{ 52471, 52472 },
	{ 52483, 52482 },
	{ 52459, 52458 },
	{ 52469, 52470 },
	{ 52487, 52486 },
	{ 52468, 52466 }
};

uint32 race_dk_outfit[10][2] =
{
	{ 51520, 51534 },
	{ 51543, 51544 },
	{ 51538, 51537 },
	{ 51535, 51536 },
	{ 51549, 51550 },
	{ 51547, 51548 },
	{ 51539, 51540 },
	{ 51546, 51545 },
	{ 51551, 51552 },
	{ 51541, 51542 }
};

enum eActiveModus
{
	SUMMON_TO_LIFE = 1,
	SUMMON_TO_KILL,
	KILL_INITIATE,
	DK_DRESS_INITIATE,
	DK_SEND_AWAY,
	WORK_DONE = 9,
	BORN_TO_LIFE = 1,
	BORN_TO_DIE,
};

//  28383 - Unborn Val'kyr
class npc_acherus_necromancer : public CreatureScript
{
public:
	npc_acherus_necromancer() : CreatureScript("npc_acherus_necromancer") { }

	struct npc_acherus_necromancerAI : public ScriptedAI
	{
		npc_acherus_necromancerAI(Creature* creature) : ScriptedAI(creature) { }

		uint32 m_phase;
		uint32 m_timer;
		uint8 m_command;    // 1=SummonToLife 2=SummonToKill 3=Kill 4=Dress
		uint8 m_gender;     // 0=male 1=female
		uint8 m_race;
		Position m_position;
		Creature* m_npc;    // the summoned Initiatechapter
		Creature* m_ghoul1;
		Creature* m_ghoul2;
		Creature* m_ghoul3;
		uint32 m_entry;
		uint32 m_dress;
		bool m_WorkDone;

		void Reset() override
		{
			m_phase = 0;
			m_timer = 0;
			m_npc = nullptr;
			m_ghoul1 = nullptr;
			m_ghoul2 = nullptr;
			m_ghoul3 = nullptr;
			m_entry = 0;
			m_dress = 0;
			m_command = WORK_DONE;
			m_gender = 0;
			m_race = 0;
			m_WorkDone = false;
		}

		void CreateInitiantValues()
		{
			me->GetPosition(&m_position);
			float my_angle = me->GetAngle(me);
			me->GetNearPosition(m_position, 7.7f, my_angle);
			m_position.SetOrientation(m_position.GetOrientation() + 3.14f);
			m_gender = urand(0, 1);
			m_race = urand(0, 9);
		}

		void StartAnimation(uint8 command)
		{
			m_phase = 1;
			m_command = command;
			m_timer = 200;
			m_WorkDone = false;
		}

		void UpdateAI(uint32 diff) override
		{
			if (m_timer <= diff)
			{
				m_timer = 1000;
				DoWork();
			}
			else
				m_timer -= diff;
		}

		void DoWork()
		{
			if (m_phase == 0 || m_WorkDone)
				return;

			switch (m_command)
			{
			case SUMMON_TO_LIFE:
				WorkSummonInitiate(BORN_TO_LIFE);
				break;
			case SUMMON_TO_KILL:
				WorkSummonInitiate(BORN_TO_DIE);
				break;
			case KILL_INITIATE:
				WorkKillInitiate();
				break;
			case DK_DRESS_INITIATE:
				WorkDKDressInitiate();
				break;
			case DK_SEND_AWAY:
				WorkDKSendAwayInitiate();
				break;
			}
		}

		void WorkSummonInitiate(uint8 work)
		{
			switch (m_phase)
			{
			case 1:
				m_entry = race_summon[m_race][m_gender];
				if (m_npc = me->SummonCreature(m_entry, m_position, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 70000))
				{
					m_npc->SetMaxHealth(3700);
					m_npc->SetHealth(3659);
					m_npc->SetArmor(4732);
					m_npc->AddAura(155184, m_npc);
				}

				Talk(0);
				m_timer = 2000;
				m_phase = 2;
				break;
			case 2:
				DoCast(m_npc, 84197, true);
				m_timer = 4000;
				m_phase = 4;
				break;
			case 4:
				if (IsCreatureAlive(m_npc))
				{
					m_npc->RemoveAura(155184);
					m_npc->HandleEmoteCommand(16);

					if (work == BORN_TO_DIE)
						m_npc->AI()->Talk(0);
					else
						m_npc->AI()->Talk(1);
				}
				m_timer = 6000;
				m_phase = 5;
				break;
			case 5:
				m_phase = 0;
				m_timer = 0;
				m_WorkDone = true;
				break;
			}
		}

		void WorkKillInitiate()
		{
			switch (m_phase)
			{
			case 1:
				m_timer = 1000;
				m_phase = 2;
				break;
			case 2:
				Talk(2);
				m_timer = 5000;
				m_phase = 3;
				break;
			case 3:
				Talk(1);
				me->CastSpell(me, 84012, false);
				m_timer = 2000;
				m_phase = 4;
				break;
			case 4:
				if (m_npc)
				{
					Position pos1;
					Position pos2;
					Position pos3;

					me->GetPosition(&pos1);
					m_npc->GetNearPosition(pos1, 3.0f, 0.0f);
					if (m_ghoul1 = me->SummonCreature(28405, pos1, TEMPSUMMON_TIMED_DESPAWN, 20000))
					{
						m_ghoul1->HandleEmoteCommand(449);
					}

					me->GetPosition(&pos2);
					m_npc->GetNearPosition(pos2, 3.0f, 2.095f);
					if (m_ghoul2 = me->SummonCreature(28405, pos2, TEMPSUMMON_TIMED_DESPAWN, 20000))
					{
						m_ghoul2->HandleEmoteCommand(449);
					}

					me->GetPosition(&pos3);
					m_npc->GetNearPosition(pos3, 3.0f, 4.19f);
					if (m_ghoul3 = me->SummonCreature(28405, pos3, TEMPSUMMON_TIMED_DESPAWN, 20000))
					{
						m_ghoul3->HandleEmoteCommand(449);
					}
				}

				m_timer = 500;
				m_phase = 5;
				break;
			case 5:
				if (m_npc)
				{
					m_ghoul1->Attack(m_npc, true);
					m_ghoul1->CallAssistance();
					m_ghoul2->Attack(m_npc, true);
					m_ghoul2->CallAssistance();
					m_ghoul3->Attack(m_npc, true);
					m_ghoul3->CallAssistance();
					m_npc->Attack(m_ghoul3, true);
				}

				m_timer = 500;
				m_phase = 6;
				break;
			case 6:
				if (IsCreatureDeath(m_npc))
				{
					m_phase = 7;
					m_timer = 3000;
					break;
				}
				break;
			case 7:
				if (IsCreatureAlive(m_ghoul1))
					m_ghoul1->HandleEmoteCommand(374);

				if (IsCreatureAlive(m_ghoul2))
					m_ghoul2->HandleEmoteCommand(374);

				if (IsCreatureAlive(m_ghoul3))
					m_ghoul3->HandleEmoteCommand(374);

				m_timer = 1000;
				m_phase = 8;
				break;
			case 8:
				if (IsCreatureAlive(m_ghoul1))
					m_ghoul1->DespawnOrUnsummon();

				if (IsCreatureAlive(m_ghoul2))
					m_ghoul2->DespawnOrUnsummon();

				if (IsCreatureAlive(m_ghoul3))
					m_ghoul3->DespawnOrUnsummon();

				m_phase = 0;
				m_timer = 0;
				m_WorkDone = true;
				break;
			}
		}

		void WorkDKDressInitiate()
		{
			switch (m_phase)
			{
			case 1:
				m_timer = 1000;
				m_phase = 2;
				break;
			case 2:
				Talk(3);
				if (IsCreatureAlive(m_npc))
				{
					me->CastSpell(m_npc, 171330, false);
				}
				m_timer = 4000;
				m_phase = 3;
				break;
			case 3:
				if (IsCreatureAlive(m_npc))
				{
					m_dress = race_dk_outfit[m_race][m_gender];
					m_npc->CastSpell(m_npc, m_dress, true);
				}
				m_timer = 500;
				m_phase = 4;
				break;
			case 4:
				if (IsCreatureAlive(m_npc))
				{
					m_npc->HandleEmoteCommand(0);
					m_npc->CastSpell(m_npc, 48263, true);
				}
				m_phase = 5;
				break;
			case 5:
			{
				me->HandleEmoteCommand(0);
				Position pos = me->GetHomePosition();
				me->GetMotionMaster()->MovePoint(1, pos);
				m_timer = 2000;
				m_phase = 6;
				break;
			}
			case 6:
				me->SetFacingTo(me->GetHomePosition().GetOrientation());
				m_phase = 7;
				break;
			case 7:
				m_phase = 0;
				m_timer = 0;
				m_WorkDone = true;
				break;
			}
		}

		void WorkDKSendAwayInitiate()
		{
			switch (m_phase)
			{
			case 1:
				m_phase = 2;
				m_timer = 2000;
				break;
			case 2:
				if (IsCreatureAlive(m_npc))
					m_npc->AI()->Talk(2);

				m_phase = 3;
				m_timer = 5000;
				break;
			case 3:
				if (IsCreatureAlive(m_npc))
				{
					m_npc->GetMotionMaster()->MovePath(5247300, false);
				}
				m_phase = 4;
				break;
			case 4:
				m_phase = 0;
				m_timer = 0;
				m_WorkDone = true;
				break;
			}
		}

		bool IsCreatureDeath(Creature* npc)
		{
			if (!npc)
				return true;
			if (!npc->IsInWorld())
				return true;
			return npc->isDead();
		}

		bool IsCreatureAlive(Creature* npc)
		{
			return !IsCreatureDeath(npc);
		}
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_acherus_necromancerAI(creature);
	}
};

// 28357 - Instructor Razuvious
class npc_instructor_razuvious : public CreatureScript
{
public:
	npc_instructor_razuvious() : CreatureScript("npc_instructor_razuvious") { }

	struct npc_instructor_razuviousAI : public ScriptedAI
	{
		npc_instructor_razuviousAI(Creature* creature) : ScriptedAI(creature) { }

		uint32 m_phase;
		uint32 m_timer;
		uint8 m_born_modus; // 1=born to life    2=born to kill

		void Reset() override
		{
			m_phase = 0;
			m_timer = 0;
			m_born_modus = 0;
		}

		void MovementInform(uint32 type, uint32 id) override
		{
			if (type != WAYPOINT_MOTION_TYPE)
				return;

			switch (id)
			{
			case 7:
				m_born_modus = urand(1, 2);
				m_phase = 1;
				m_timer = 200;
				break;
			case 11:
				m_born_modus = urand(1, 2);
				m_phase = 1;
				m_timer = 200;
				break;
			}
		}

		void UpdateAI(uint32 diff) override
		{
			if (m_timer <= diff)
			{
				m_timer = 1000;
				DoWork();
			}
			else
				m_timer -= diff;
		}

		void DoWork()
		{
			if (m_phase == 0 || m_born_modus == 0)
				return;

			switch (m_born_modus)
			{
			case BORN_TO_LIFE:
				VideoBornToLife();
				break;
			case BORN_TO_DIE:
				VideoBornToDie();
				break;
			}
		}

		void VideoBornToLife()
		{
			switch (m_phase)
			{
			case 1:
				if (Creature* npc = me->FindNearestCreature(28383, 10.0f))
					if (npc_acherus_necromancer::npc_acherus_necromancerAI* NpcAI = CAST_AI(npc_acherus_necromancer::npc_acherus_necromancerAI, npc->GetAI()))
					{
						NpcAI->CreateInitiantValues();
						Position pos = NpcAI->m_position;
						float angle = me->GetAngle(pos.m_positionX, pos.m_positionY);
						me->SetFacingTo(angle);
					}

				m_timer = 2000;
				m_phase = 2;
				break;
			case 2:
				Talk(5);
				m_timer = 3000;
				m_phase = 3;
				break;
			case 3:
				if (Creature* npc = me->FindNearestCreature(28383, 10.0f))
					if (npc_acherus_necromancer::npc_acherus_necromancerAI* NpcAI = CAST_AI(npc_acherus_necromancer::npc_acherus_necromancerAI, npc->GetAI()))
						NpcAI->StartAnimation(SUMMON_TO_LIFE);

				m_phase = 4;
				break;
			case 4:
				if (Creature* npc = me->FindNearestCreature(28383, 10.0f))
					if (npc_acherus_necromancer::npc_acherus_necromancerAI* NpcAI = CAST_AI(npc_acherus_necromancer::npc_acherus_necromancerAI, npc->GetAI()))
						if (NpcAI->m_WorkDone)
							m_phase = 5;
				break;
			case 5:
				Talk(3);
				m_timer = 5000;
				m_phase = 6;
				break;
			case 6:
				Talk(4);
				m_timer = 5000;
				m_phase = 7;
				break;
			case 7:
				if (Creature* npc = me->FindNearestCreature(28383, 10.0f))
					if (npc_acherus_necromancer::npc_acherus_necromancerAI* NpcAI = CAST_AI(npc_acherus_necromancer::npc_acherus_necromancerAI, npc->GetAI()))
						NpcAI->StartAnimation(DK_DRESS_INITIATE);

				m_phase = 8;
				break;
			case 8:
				if (Creature* npc = me->FindNearestCreature(28383, 10.0f))
					if (npc_acherus_necromancer::npc_acherus_necromancerAI* NpcAI = CAST_AI(npc_acherus_necromancer::npc_acherus_necromancerAI, npc->GetAI()))
						if (NpcAI->m_WorkDone)
							m_phase = 9;
				break;
			case 9:
				Talk(6);
				m_timer = 5000;
				m_phase = 10;
				break;
			case 10:
				Talk(7);
				m_timer = 5000;
				m_phase = 11;
				break;
			case 11:
				if (Creature* npc = me->FindNearestCreature(28383, 10.0f))
					if (npc_acherus_necromancer::npc_acherus_necromancerAI* NpcAI = CAST_AI(npc_acherus_necromancer::npc_acherus_necromancerAI, npc->GetAI()))
						NpcAI->StartAnimation(DK_SEND_AWAY);

				m_phase = 12;
				break;
			case 12:
				m_timer = 0;
				m_phase = 0;
				m_born_modus = 0;
				break;
			}
		}

		void VideoBornToDie()
		{
			switch (m_phase)
			{
			case 1:
				if (Creature* npc = me->FindNearestCreature(28383, 10.0f))
					if (npc_acherus_necromancer::npc_acherus_necromancerAI* NpcAI = CAST_AI(npc_acherus_necromancer::npc_acherus_necromancerAI, npc->GetAI()))
					{
						NpcAI->CreateInitiantValues();
						Position pos = NpcAI->m_position;
						float angle = me->GetAngle(pos.m_positionX, pos.m_positionY);
						me->SetFacingTo(angle);
					}

				m_timer = 2000;
				m_phase = 2;
				break;
			case 2:
				Talk(5);
				m_timer = 3000;
				m_phase = 3;
				break;
			case 3:
				if (Creature* npc = me->FindNearestCreature(28383, 10.0f))
					if (npc_acherus_necromancer::npc_acherus_necromancerAI* NpcAI = CAST_AI(npc_acherus_necromancer::npc_acherus_necromancerAI, npc->GetAI()))
						NpcAI->StartAnimation(SUMMON_TO_KILL);

				m_phase = 4;
				break;
			case 4:
				if (Creature* npc = me->FindNearestCreature(28383, 10.0f))
					if (npc_acherus_necromancer::npc_acherus_necromancerAI* NpcAI = CAST_AI(npc_acherus_necromancer::npc_acherus_necromancerAI, npc->GetAI()))
						if (NpcAI->m_WorkDone)
							m_phase = 5;
				break;
			case 5:
				Talk(0);
				m_timer = 5000;
				m_phase = 6;
				break;
			case 6:
				Talk(1);
				m_timer = 5000;
				m_phase = 7;
				break;
			case 7:
				Talk(2);
				m_timer = 5000;
				m_phase = 8;
				break;
			case 8:
				if (Creature* npc = me->FindNearestCreature(28383, 10.0f))
					if (npc_acherus_necromancer::npc_acherus_necromancerAI* NpcAI = CAST_AI(npc_acherus_necromancer::npc_acherus_necromancerAI, npc->GetAI()))
						NpcAI->StartAnimation(KILL_INITIATE);

				m_phase = 9;
				break;
			case 9:
				if (Creature* npc = me->FindNearestCreature(28383, 10.0f))
					if (npc_acherus_necromancer::npc_acherus_necromancerAI* NpcAI = CAST_AI(npc_acherus_necromancer::npc_acherus_necromancerAI, npc->GetAI()))
						if (NpcAI->m_WorkDone)
							m_phase = 10;
				break;
			case 10:
				m_timer = 0;
				m_phase = 0;
				m_born_modus = 0;
				break;
			}
		}
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_instructor_razuviousAI(creature);
	}
};

// Quest Runeforging: Preparation for Battle (12842)
class spell_rune_of_razorice : public SpellScriptLoader
{
public:
	spell_rune_of_razorice() : SpellScriptLoader("spell_rune_of_razorice") { }

	class spell_rune_of_razorice_SpellScript : public SpellScript
	{
		PrepareSpellScript(spell_rune_of_razorice_SpellScript);

		void HandleAfterCast()
		{
			Unit* l_Caster = GetCaster();
			Player* l_Player = l_Caster->ToPlayer();

			if (l_Player == nullptr)
				return;

			if (l_Player->HasQuest(12842))
			{
				l_Player->KilledMonsterCredit(28357);
			}
		}

		void Register() override
		{
			AfterCast += SpellCastFn(spell_rune_of_razorice_SpellScript::HandleAfterCast);
		}
	};

	SpellScript* GetSpellScript() const override
	{
		return new spell_rune_of_razorice_SpellScript();
	}
};

/*######
##Quest 12848
######*/

#define GCD_CAST    1

enum eDeathKnightSpells
{
    SPELL_SOUL_PRISON_CHAIN_SELF    = 54612,
    SPELL_SOUL_PRISON_CHAIN         = 54613,
    SPELL_DK_INITIATE_VISUAL        = 51519,

    SPELL_ICY_TOUCH                 = 52372,
    SPELL_PLAGUE_STRIKE             = 52373,
    SPELL_DEATH_COIL                = 52375
};

#define EVENT_ICY_TOUCH                 1
#define EVENT_PLAGUE_STRIKE             2
#define EVENT_BLOOD_STRIKE              3
#define EVENT_DEATH_COIL                4

//used by 29519, 29520, 29565, 29566, 29567 but signed for 29519
int32 say_event_start[8] =
{
    -1609000, -1609001, -1609002, -1609003,
    -1609004, -1609005, -1609006, -1609007
};

int32 say_event_attack[9] =
{
    -1609008, -1609009, -1609010, -1609011, -1609012,
    -1609013, -1609014, -1609015, -1609016
};

uint32 acherus_soul_prison[12] =
{
    191577,
    191580,
    191581,
    191582,
    191583,
    191584,
    191585,
    191586,
    191587,
    191588,
    191589,
    191590
};

uint32 acherus_unworthy_initiate[5] =
{
    29519,
    29520,
    29565,
    29566,
    29567
};

enum UnworthyInitiatePhase
{
    PHASE_CHAINED,
    PHASE_TO_EQUIP,
    PHASE_EQUIPING,
    PHASE_TO_ATTACK,
    PHASE_ATTACKING
};

class npc_unworthy_initiate : public CreatureScript
{
public:
    npc_unworthy_initiate() : CreatureScript("npc_unworthy_initiate") { }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_unworthy_initiateAI(creature);
    }

    struct npc_unworthy_initiateAI : public ScriptedAI
    {
        npc_unworthy_initiateAI(Creature* creature) : ScriptedAI(creature)
        {
            me->SetReactState(REACT_PASSIVE);
            if (!me->GetCurrentEquipmentId())
                me->SetCurrentEquipmentId(me->GetOriginalEquipmentId());
        }

        uint64 playerGUID;
        UnworthyInitiatePhase phase;
        uint32 wait_timer;
        float anchorX, anchorY;
        uint64 anchorGUID;

        EventMap events;

        void Reset()
        {
            anchorGUID = 0;
            phase = PHASE_CHAINED;
            events.Reset();
            me->setFaction(7);
            me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PC);
            me->SetUInt32Value(UNIT_FIELD_ANIM_TIER, 8);
            me->LoadEquipment(0, true);
        }

        void EnterCombat(Unit* /*who*/)
        {
            events.ScheduleEvent(EVENT_ICY_TOUCH, 1000, GCD_CAST);
            events.ScheduleEvent(EVENT_PLAGUE_STRIKE, 3000, GCD_CAST);
            events.ScheduleEvent(EVENT_BLOOD_STRIKE, 2000, GCD_CAST);
            events.ScheduleEvent(EVENT_DEATH_COIL, 5000, GCD_CAST);
        }

        void MovementInform(uint32 type, uint32 id)
        {
            if (type != POINT_MOTION_TYPE)
                return;

            if (id == 1)
            {
                wait_timer = 5000;
                me->CastSpell(me, SPELL_DK_INITIATE_VISUAL, true);

                if (Player* starter = Unit::GetPlayer(*me, playerGUID))
                    DoScriptText(say_event_attack[rand()%9], me, starter);

                phase = PHASE_TO_ATTACK;
            }
        }

        void EventStart(Creature* anchor, Player* target)
        {
            wait_timer = 5000;
            phase = PHASE_TO_EQUIP;

            me->SetUInt32Value(UNIT_FIELD_ANIM_TIER, 0);
            me->RemoveAurasDueToSpell(SPELL_SOUL_PRISON_CHAIN_SELF);
            me->RemoveAurasDueToSpell(SPELL_SOUL_PRISON_CHAIN);

            if (anchor)
            {
                float z;
                anchor->GetContactPoint(me, anchorX, anchorY, z, 1.0f);
            }

            playerGUID = target ? target->GetGUID() : 0;
            DoScriptText(say_event_start[urand(0, 7)], me, target);
        }

        void UpdateAI(const uint32 diff)
        {
            switch (phase)
            {
            case PHASE_CHAINED:
                if (!anchorGUID)
                {
                    if (Creature* anchor = me->FindNearestCreature(29521, 30))
                    {
                        anchor->AI()->SetGUID(me->GetGUID());
                        anchor->CastSpell(me, SPELL_SOUL_PRISON_CHAIN, true);
                        anchorGUID = anchor->GetGUID();
                    }
                    else
                        sLog->outError(LOG_FILTER_TSCR, "npc_unworthy_initiateAI: unable to find anchor!");

                    float dist = 99.0f;
                    GameObject* prison = NULL;

                    for (uint8 i = 0; i < 12; ++i)
                    {
                        if (GameObject* temp_prison = me->FindNearestGameObject(acherus_soul_prison[i], 30))
                        {
                            if (me->IsWithinDist(temp_prison, dist, false))
                            {
                                dist = me->GetDistance2d(temp_prison);
                                prison = temp_prison;
                            }
                        }
                    }

                    if (prison)
                        prison->ResetDoorOrButton();
                    else
                        sLog->outError(LOG_FILTER_TSCR, "npc_unworthy_initiateAI: unable to find prison!");
                }
                break;
            case PHASE_TO_EQUIP:
                if (wait_timer)
                {
                    if (wait_timer > diff)
                        wait_timer -= diff;
                    else
                    {
                        me->GetMotionMaster()->MovePoint(1, anchorX, anchorY, me->GetPositionZ());
                        //sLog->outDebug(LOG_FILTER_TSCR, "npc_unworthy_initiateAI: move to %f %f %f", anchorX, anchorY, me->GetPositionZ());
                        phase = PHASE_EQUIPING;
                        wait_timer = 0;
                    }
                }
                break;
            case PHASE_TO_ATTACK:
                if (wait_timer)
                {
                    if (wait_timer > diff)
                        wait_timer -= diff;
                    else
                    {
                        me->setFaction(14);
                        me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PC);
                        phase = PHASE_ATTACKING;

                        if (Player* target = Unit::GetPlayer(*me, playerGUID))
                            me->AI()->AttackStart(target);
                        wait_timer = 0;
                    }
                }
                break;
            case PHASE_ATTACKING:
                if (!UpdateVictim())
                    return;

                events.Update(diff);

                while (uint32 eventId = events.ExecuteEvent())
                {
                    switch (eventId)
                    {
                    case EVENT_ICY_TOUCH:
                        DoCast(me->getVictim(), SPELL_ICY_TOUCH);
                        events.DelayEvents(1000, GCD_CAST);
                        events.ScheduleEvent(EVENT_ICY_TOUCH, 5000, GCD_CAST);
                        break;
                    case EVENT_PLAGUE_STRIKE:
                        DoCast(me->getVictim(), SPELL_PLAGUE_STRIKE);
                        events.DelayEvents(1000, GCD_CAST);
                        events.ScheduleEvent(SPELL_PLAGUE_STRIKE, 5000, GCD_CAST);
                        break;
                    case EVENT_DEATH_COIL:
                        DoCast(me->getVictim(), SPELL_DEATH_COIL);
                        events.DelayEvents(1000, GCD_CAST);
                        events.ScheduleEvent(EVENT_DEATH_COIL, 5000, GCD_CAST);
                        break;
                    }
                }

                DoMeleeAttackIfReady();
                break;
            default:
                break;
            }
        }
    };
};

class npc_unworthy_initiate_anchor : public CreatureScript
{
public:
    npc_unworthy_initiate_anchor() : CreatureScript("npc_unworthy_initiate_anchor") { }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_unworthy_initiate_anchorAI(creature);
    }

    struct npc_unworthy_initiate_anchorAI : public PassiveAI
    {
        npc_unworthy_initiate_anchorAI(Creature* creature) : PassiveAI(creature), prisonerGUID(0) {}

        uint64 prisonerGUID;

        void SetGUID(uint64 guid, int32 /*id*/)
        {
            if (!prisonerGUID)
                prisonerGUID = guid;
        }

        uint64 GetGUID(int32 /*id*/)
        {
            return prisonerGUID;
        }
    };
};

class go_acherus_soul_prison : public GameObjectScript
{
public:
    go_acherus_soul_prison() : GameObjectScript("go_acherus_soul_prison") { }

    bool OnGossipHello(Player* player, GameObject* go)
    {
        if (Creature* anchor = go->FindNearestCreature(29521, 15))
            if (uint64 prisonerGUID = anchor->AI()->GetGUID())
                if (Creature* prisoner = Creature::GetCreature(*player, prisonerGUID))
                {
                    npc_unworthy_initiate::npc_unworthy_initiateAI* prisonerAI = CAST_AI(npc_unworthy_initiate::npc_unworthy_initiateAI, prisoner->AI());
                    if (prisonerAI)
                        prisonerAI->EventStart(anchor, player);
                }

        return false;
    }

};

// 28511 eye_of_acherus
class npc_eye_of_acherus : public CreatureScript
{
public:
	npc_eye_of_acherus() : CreatureScript("npc_eye_of_acherus") { }

	enum EyeOfAcherus
	{
		DISPLAYID_EYE_HUGE = 26320,
		DISPLAYID_EYE_SMALL = 25499,

		SPELL_EYE_PHASE_170 = 70889,
		SPELL_UNKNOWN_51860 = 51860,
		SPELL_EYE_VISUAL = 51892,
		SPELL_EYE_FL_BOOST_RUN = 51923,
		SPELL_EYE_FL_BOOST_FLY = 51890,
		SPELL_EYE_CONTROL = 51852,

		SAY_EYE_MOVE_START = 0,
		SAY_EYE_CONTROL = 1,

		EVENT_MOVE_START = 1,

	};

	struct npc_eye_of_acherusAI : public ScriptedAI
	{
		npc_eye_of_acherusAI(Creature* creature) : ScriptedAI(creature) { }

		EventMap m_events;
		uint64   m_playerGUID;

		void Reset()
		{
			m_playerGUID = 0;
			me->SetDisplayId(DISPLAYID_EYE_HUGE);
			me->SetHomePosition(2363.970589f, -5659.861328f, 504.316833f, 0);
			me->GetMotionMaster()->MovePoint(0, 2341.57f, -5672.8f, 538.394f);
			me->SetReactState(REACT_PASSIVE);
			me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_STUNNED);
			if (CharmInfo* info = me->GetCharmInfo())
				for (uint32 i = 0; i < 8; i++)
					info->SetActionBar(i, me->GetCreatureTemplate()->spells[i], ACT_PASSIVE);
		}

		void OnCharmed(bool /*apply*/) override { }

		void IsSummonedBy(Unit* summoner) override
		{
			if (Player* player = summoner->ToPlayer())
			{
				m_playerGUID = player->GetGUID();
				me->SetLevel(player->getLevel());
			}
		}

		void JustDied(Unit* /*pKiller*/)
		{
			if (Unit* charmer = me->GetCharmer())
			{
				charmer->RemoveAurasDueToSpell(SPELL_EYE_CONTROL);
				charmer->RemoveAura(SPELL_EYE_FL_BOOST_RUN);
			}
		}

		void MovementInform(uint32 movementType, uint32 pointId) override
		{
			if (movementType == POINT_MOTION_TYPE)
			{
				switch (pointId)
				{
					case 0:
					{
						if (Player* player = ObjectAccessor::GetPlayer(*me, m_playerGUID))
							Talk(SAY_EYE_MOVE_START);
						me->SetDisableGravity(true);
						me->SetControlled(true, UNIT_STATE_ROOT);
						m_events.ScheduleEvent(EVENT_MOVE_START, 5000);
						break;
					}
					case 1:
					{
						me->SetByteValue(UNIT_FLAG_SHEATHE, 0, SHEATH_STATE_MELEE);
						me->SetDisableGravity(false);
						me->CastSpell(me, SPELL_EYE_VISUAL, true);
						me->CastSpell(me, SPELL_EYE_FL_BOOST_FLY, true);
						if (Player* player = ObjectAccessor::GetPlayer(*me, m_playerGUID))
							Talk(SAY_EYE_CONTROL);
						break;
					}
				}
			}
		}

		void EnterEvadeMode() override { }

		void UpdateAI(uint32 diff) override
		{
			m_events.Update(diff);

			while (uint32 eventId = m_events.ExecuteEvent())
			{
				switch (eventId)
				{
					case EVENT_MOVE_START:
					{
						me->CastSpell(me, SPELL_UNKNOWN_51860, true);
						me->AddAura(SPELL_EYE_PHASE_170, me);
						me->CastSpell(me, SPELL_EYE_VISUAL, true);
						me->CastSpell(me, SPELL_EYE_FL_BOOST_RUN, true);
						me->SetControlled(false, UNIT_STATE_ROOT);
						me->GetMotionMaster()->MovePoint(1, 1824.4929f, -5928.7065f, 170.4447f);
						break;
					}
				}
			}
		}
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_eye_of_acherusAI(creature);
	}
};

/*######
## npc_death_knight_initiate
######*/

#define GOSSIP_ACCEPT_DUEL      "I challenge you, death knight!"

enum eDuelEnums
{
    SAY_DUEL_A                  = -1609080,
    SAY_DUEL_B                  = -1609081,
    SAY_DUEL_C                  = -1609082,
    SAY_DUEL_D                  = -1609083,
    SAY_DUEL_E                  = -1609084,
    SAY_DUEL_F                  = -1609085,
    SAY_DUEL_G                  = -1609086,
    SAY_DUEL_H                  = -1609087,
    SAY_DUEL_I                  = -1609088,

    SPELL_DUEL                  = 52996,
    //SPELL_DUEL_TRIGGERED        = 52990,
    SPELL_DUEL_VICTORY          = 52994,
    SPELL_DUEL_FLAG             = 52991,

    QUEST_DEATH_CHALLENGE       = 12733,
    FACTION_HOSTILE             = 2068
};

int32 m_auiRandomSay[] =
{
    SAY_DUEL_A, SAY_DUEL_B, SAY_DUEL_C, SAY_DUEL_D, SAY_DUEL_E, SAY_DUEL_F, SAY_DUEL_G, SAY_DUEL_H, SAY_DUEL_I
};

class npc_death_knight_initiate : public CreatureScript
{
public:
    npc_death_knight_initiate() : CreatureScript("npc_death_knight_initiate") { }

    bool OnGossipSelect(Player* player, Creature* creature, uint32 /*sender*/, uint32 action)
    {
        player->PlayerTalkClass->ClearMenus();
        if (action == GOSSIP_ACTION_INFO_DEF)
        {
            player->CLOSE_GOSSIP_MENU();

            if (player->isInCombat() || creature->isInCombat())
                return true;

            if (npc_death_knight_initiateAI* pInitiateAI = CAST_AI(npc_death_knight_initiate::npc_death_knight_initiateAI, creature->AI()))
            {
                if (pInitiateAI->m_bIsDuelInProgress)
                    return true;
            }

            creature->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PC);
            creature->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_UNK_15);

            int32 uiSayId = rand()% (sizeof(m_auiRandomSay)/sizeof(int32));
            DoScriptText(m_auiRandomSay[uiSayId], creature, player);

            player->CastSpell(creature, SPELL_DUEL, false);
            player->CastSpell(player, SPELL_DUEL_FLAG, true);
        }
        return true;
    }

    bool OnGossipHello(Player* player, Creature* creature)
    {
        if (player->GetQuestStatus(QUEST_DEATH_CHALLENGE) == QUEST_STATUS_INCOMPLETE && creature->IsFullHealth())
        {
            if (player->HealthBelowPct(10))
                return true;

            if (player->isInCombat() || creature->isInCombat())
                return true;

            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ACCEPT_DUEL, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF);
            player->SEND_GOSSIP_MENU(player->GetGossipTextId(creature), creature->GetGUID());
        }
        return true;
    }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_death_knight_initiateAI(creature);
    }

    struct npc_death_knight_initiateAI : public CombatAI
    {
        npc_death_knight_initiateAI(Creature* creature) : CombatAI(creature)
        {
            m_bIsDuelInProgress = false;
        }

        bool lose;
        uint64 m_uiDuelerGUID;
        uint32 m_uiDuelTimer;
        bool m_bIsDuelInProgress;

        void Reset()
        {
            lose = false;
            me->RestoreFaction();
            CombatAI::Reset();

            me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_UNK_15);

            m_uiDuelerGUID = 0;
            m_uiDuelTimer = 5000;
            m_bIsDuelInProgress = false;
        }

        void SpellHit(Unit* pCaster, const SpellInfo* pSpell)
        {
            if (!m_bIsDuelInProgress && pSpell->Id == SPELL_DUEL)
            {
                m_uiDuelerGUID = pCaster->GetGUID();
                m_bIsDuelInProgress = true;
            }
        }

       void DamageTaken(Unit* pDoneBy, uint32 &uiDamage, SpellInfo const* /*p_SpellInfo*/)
        {
            if (m_bIsDuelInProgress && pDoneBy->IsControlledByPlayer())
            {
                if (pDoneBy->GetGUID() != m_uiDuelerGUID && pDoneBy->GetOwnerGUID() != m_uiDuelerGUID) // other players cannot help
                    uiDamage = 0;
                else if (uiDamage >= me->GetHealth())
                {
                    uiDamage = 0;

                    if (!lose)
                    {
                        pDoneBy->RemoveGameObject(SPELL_DUEL_FLAG, true);
                        pDoneBy->AttackStop();
                        me->CastSpell(pDoneBy, SPELL_DUEL_VICTORY, true);
                        lose = true;
                        me->CastSpell(me, 7267, true);
                        me->RestoreFaction();
                    }
                }
            }
        }

        void UpdateAI(const uint32 uiDiff)
        {
            if (!UpdateVictim())
            {
                if (m_bIsDuelInProgress)
                {
                    if (m_uiDuelTimer <= uiDiff)
                    {
                        me->setFaction(FACTION_HOSTILE);

                        if (Unit* unit = Unit::GetUnit(*me, m_uiDuelerGUID))
                            AttackStart(unit);
                    }
                    else
                        m_uiDuelTimer -= uiDiff;
                }
                return;
            }

            if (m_bIsDuelInProgress)
            {
                if (lose)
                {
                    if (!me->HasAura(7267))
                        EnterEvadeMode();
                    return;
                }
                else if (me->getVictim() && me->getVictim()->IsPlayer() && me->getVictim()->HealthBelowPct(10))
                {
                    me->getVictim()->CastSpell(me->getVictim(), 7267, true); // beg
                    me->getVictim()->RemoveGameObject(SPELL_DUEL_FLAG, true);
                    EnterEvadeMode();
                    return;
                }
            }

            // TODO: spells

            CombatAI::UpdateAI(uiDiff);
        }
    };

};

// 28654  Dark Rider of Acherus (summoned when completing Grand Theft Palomino)
class npc_dark_rider_of_acherus : public CreatureScript
{
public:
	npc_dark_rider_of_acherus() : CreatureScript("npc_dark_rider_of_acherus") { }

	enum eDarkRiderOfAcherus
	{
		SAY_DARK_RIDER = 0,
		SPELL_DESPAWN_HORSE = 51918
	};

	struct npc_dark_rider_of_acherusAI : public ScriptedAI
	{
		npc_dark_rider_of_acherusAI(Creature* creature) : ScriptedAI(creature) { }

		void Reset()
		{
			PhaseTimer = 4000;
			Phase = 0;
			Intro = false;
			TargetGUID = 0;
		}

		void UpdateAI(uint32 diff)
		{
			if (!Intro || !TargetGUID)
				return;

			if (PhaseTimer <= diff)
			{
				switch (Phase)
				{
				case 0:
					Talk(SAY_DARK_RIDER);
					PhaseTimer = 5000;
					Phase = 1;
					break;
				case 1:
					if (Unit* target = ObjectAccessor::GetUnit(*me, TargetGUID))
						DoCast(target, SPELL_DESPAWN_HORSE, true);
					PhaseTimer = 3000;
					Phase = 2;
					break;
				case 2:
					me->SetVisible(false);
					PhaseTimer = 2000;
					Phase = 3;
					break;
				case 3:
					me->DespawnOrUnsummon();
					break;
				default:
					break;
				}
			}
			else
				PhaseTimer -= diff;
		}

		void InitDespawnHorse(Unit* who)
		{
			if (!who)
				return;

			TargetGUID = who->GetGUID();
			me->SetWalk(true);
			me->SetSpeed(MOVE_RUN, 0.4f);
			me->GetMotionMaster()->MoveChase(who);
			me->SetTarget(TargetGUID);
			Intro = true;
		}

	private:
		uint32 PhaseTimer;
		uint32 Phase;
		bool Intro;
		uint64 TargetGUID;
	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_dark_rider_of_acherusAI(creature);
	}
};

// 28782 - Acherus Deathcharger
class npc_acherus_deathcharger_28782 : public CreatureScript
{
public:
	npc_acherus_deathcharger_28782() : CreatureScript("npc_acherus_deathcharger_28782") { }

	enum e28782
	{
		QUEST_INTO_THE_REALM_OF_SHADOW = 12687,
		NPC_ACHERUS_DEATHCHARGER = 28782,
		NPC_DARK_RIDER_OF_ACHERUS = 28768,
		SPELL_SUMMON_DARK_RIDER_OF_ACHERUS = 52289,
		SPELL_DESPAWN_DARK_RIDER_OF_ACHERUS = 52294,
	};

	struct npc_acherus_deathcharger_28782AI : public ScriptedAI
	{
		npc_acherus_deathcharger_28782AI(Creature* creature) : ScriptedAI(creature) { }

		uint32 m_timer;
		uint32 m_phase;
		uint64 m_darkriderGUID;

		void Reset() override
		{
			m_timer = 1000;
			m_phase = 0;
			m_darkriderGUID = 0;
			if (me->FindNearestCreature(28653, 15.0f))
				me->DespawnOrUnsummon();
		}

		void OnSpellClick(Unit* p_Clicker) override
		{
			if (me->getFaction() == 35)
				if (Player* player = p_Clicker->ToPlayer())
					if (Vehicle* vehicle = me->GetVehicleKit())
						if (player->GetQuestStatus(QUEST_INTO_THE_REALM_OF_SHADOW) == QUEST_STATUS_INCOMPLETE)
							if (Creature* darkrider = ObjectAccessor::GetCreature(*me, m_darkriderGUID))
							{
								me->GetMotionMaster()->Initialize();
								me->SetSpeed(MOVE_RUN, 3.0f, true);
							}
		}

		void PassengerBoarded(Unit* who, int8 seatId, bool apply)
		{
			if (who->GetEntry() == NPC_DARK_RIDER_OF_ACHERUS)
			{
				m_darkriderGUID = who->GetGUID();
				if (apply)
				{
					me->RestoreFaction();
					me->RemoveFlag(UNIT_FIELD_NPC_FLAGS, UNIT_NPC_FLAG_SPELLCLICK);
					me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
					me->setFaction(2096);
				}
				else
				{
					me->SetFlag(UNIT_FIELD_NPC_FLAGS, UNIT_NPC_FLAG_SPELLCLICK);
					me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
					me->AttackStop();
					me->setFaction(35);
				}
			}
			else
				if (Player* player = who->ToPlayer())
					if (apply == false)
						me->DespawnOrUnsummon();
		}

		void UpdateAI(uint32 diff)
		{
			if (m_timer <= diff)
			{
				m_timer = 1000;
				DoWork();
			}
			else
				m_timer -= diff;

			if (!UpdateVictim())
				return;
			else
				DoMeleeAttackIfReady();
		}

		void DoWork()
		{
			Vehicle* vehicle = me->GetVehicleKit();
			if (!vehicle)
				return;
			if (vehicle->IsVehicleInUse())
				return;
			Creature* darkrider = me->FindNearestCreature(NPC_DARK_RIDER_OF_ACHERUS, 20);
			if (!darkrider)
				return;
			if (darkrider->IsMounted())
				return;
			if (darkrider->isAlive() && !darkrider->isInCombat() && vehicle->HasEmptySeat(0) && !darkrider->IsMounted())
			{
				darkrider->EnterVehicle(me, 0);
				return;
			}
		}
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_acherus_deathcharger_28782AI(creature);
	}
};

// 28909 - Dark Rider of Acherus
class npc_ros_dark_rider : public CreatureScript
{
public:
    npc_ros_dark_rider() : CreatureScript("npc_ros_dark_rider") { }

    struct npc_ros_dark_riderAI : public ScriptedAI
    {
        npc_ros_dark_riderAI(Creature* creature) : ScriptedAI(creature) {}

        void Reset()
        {
            Creature* deathcharger = me->FindNearestCreature(28782, 30);
            if (!deathcharger)
                return;

            deathcharger->RestoreFaction();
            deathcharger->RemoveFlag(UNIT_FIELD_NPC_FLAGS, UNIT_NPC_FLAG_SPELLCLICK);
            deathcharger->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);

            if (!me->GetVehicle() && deathcharger->IsVehicle() && deathcharger->GetVehicleKit()->HasEmptySeat(0))
				me->EnterVehicle(deathcharger);
        }

        void JustDied(Unit* killer)
        {
            Creature* deathcharger = me->FindNearestCreature(28782, 30);
            if (!deathcharger)
                return;

            if (killer->IsPlayer() && deathcharger->GetTypeId() == TYPEID_UNIT && deathcharger->IsVehicle())
            {
                deathcharger->SetFlag(UNIT_FIELD_NPC_FLAGS, UNIT_NPC_FLAG_SPELLCLICK);
                deathcharger->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
                deathcharger->setFaction(2096);
            }
        }
    };

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_ros_dark_riderAI(creature);
	}
};

// 28653 - Salanar the Horseman
class npc_salanar_the_horseman_28653 : public CreatureScript
{
public:
	npc_salanar_the_horseman_28653() : CreatureScript("npc_salanar_the_horseman_28653") { }

	enum Spells_Salanar
	{
		SPELL_REALM_OF_SHADOWS = 52693,
		SPELL_EFFECT_STOLEN_HORSE = 52263,
		SPELL_DELIVER_STOLEN_HORSE = 52264,
		SPELL_CALL_DARK_RIDER = 52266,
		SPELL_EFFECT_OVERTAKE = 52349
	};

	struct npc_salanar_the_horseman_28653AI : public ScriptedAI
	{
		npc_salanar_the_horseman_28653AI(Creature* creature) : ScriptedAI(creature) { }

		void SpellHit(Unit* caster, const SpellInfo* spell)
		{
			if (spell->Id == SPELL_DELIVER_STOLEN_HORSE)
			{
				if (caster->GetTypeId() == TYPEID_UNIT && caster->IsVehicle())
				{
					if (Unit* charmer = caster->GetCharmer())
					{
						if (charmer->HasAura(SPELL_EFFECT_STOLEN_HORSE))
						{
							charmer->RemoveAurasDueToSpell(SPELL_EFFECT_STOLEN_HORSE);
							caster->RemoveFlag(UNIT_FIELD_NPC_FLAGS, UNIT_NPC_FLAG_SPELLCLICK);
							caster->setFaction(35);
							DoCast(caster, SPELL_CALL_DARK_RIDER, true);
							if (Creature* Dark_Rider = me->FindNearestCreature(28654, 15))
								CAST_AI(npc_dark_rider_of_acherus::npc_dark_rider_of_acherusAI, Dark_Rider->AI())->InitDespawnHorse(caster);
						}
					}
				}
			}
		}

		void MoveInLineOfSight(Unit* who)
		{
			ScriptedAI::MoveInLineOfSight(who);

			if (who->GetTypeId() == TYPEID_UNIT && who->IsVehicle() && me->IsWithinDistInMap(who, 5.0f))
			{
				if (Unit* charmer = who->GetCharmer())
				{
					if (Player* player = charmer->ToPlayer())
					{
						// for quest Into the Realm of Shadows(12687)
						if (me->GetEntry() == 28788 && player->GetQuestStatus(12687) == QUEST_STATUS_INCOMPLETE)
						{
							player->GroupEventHappens(12687, me);
							charmer->RemoveAurasDueToSpell(SPELL_EFFECT_OVERTAKE);
							if (Creature* creature = who->ToCreature())
							{
								creature->DespawnOrUnsummon();
								//creature->Respawn(true);
							}
						}

						if (player->HasAura(SPELL_REALM_OF_SHADOWS))
							player->RemoveAurasDueToSpell(SPELL_REALM_OF_SHADOWS);
					}
				}
			}
		}
	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_salanar_the_horseman_28653AI(creature);
	}
};

// 28788 - Salanar the Horseman
class npc_salanar_the_horseman_28788 : public CreatureScript
{
public:
	npc_salanar_the_horseman_28788() : CreatureScript("npc_salanar_the_horseman_28788") { }

	enum e28788
	{
		SPELL_REALM_OF_SHADOWS = 52275,
		SPELL_DEATH_RACE_COMPLETE = 52361,
	};

	struct npc_salanar_the_horseman_28788AI : public ScriptedAI
	{
		npc_salanar_the_horseman_28788AI(Creature* creature) : ScriptedAI(creature) { }

		uint32 m_timer;
		uint32 m_phase;

		void Reset() override
		{
			m_timer = 1000;
			m_phase = 1;
			if (Player* player = me->FindNearestPlayer(10.0f))
				me->SetFacingToObject(player);
		}

		void UpdateAI(uint32 diff)
		{
			if (m_timer <= diff)
			{
				m_timer = 1000;
				DoWork();
			}
			else
				m_timer -= diff;

			if (!UpdateVictim())
				return;
			else
				DoMeleeAttackIfReady();
		}

		void DoWork()
		{
			switch (m_phase)
			{
			case 1:
				Talk(0);
				m_phase = 2;
				m_timer = 6000;
				break;
			case 2:
				if (Unit* owner = me->GetCharmerOrOwnerOrSelf())
					if (Player* player = owner->ToPlayer())
					{
						player->Dismount();
						player->RemoveAura(SPELL_REALM_OF_SHADOWS);
						player->CastSpell(player, SPELL_DEATH_RACE_COMPLETE);
						m_phase = 3;
						m_timer = 5000;
					}
				break;
			case 3:
				me->DespawnOrUnsummon();
				break;
			}
		}
	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_salanar_the_horseman_28788AI(creature);
	}
};

enum SG
{
    GHOULS = 28845,
    GHOSTS = 28846
};

// 28658 - Gothik the Harvester
class npc_dkc1_gothik : public CreatureScript
{
public:
    npc_dkc1_gothik() : CreatureScript("npc_dkc1_gothik") { }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_dkc1_gothikAI(creature);
    }

    struct npc_dkc1_gothikAI : public ScriptedAI
    {
        npc_dkc1_gothikAI(Creature* creature) : ScriptedAI(creature) {}

        void MoveInLineOfSight(Unit* who)
        {
            ScriptedAI::MoveInLineOfSight(who);

            if (who->GetEntry() == GHOULS && me->IsWithinDistInMap(who, 10.0f))
            {
                if (Unit* owner = who->GetOwner())
                {
                    if (owner->IsPlayer())
                    {
                        if (CAST_PLR(owner)->GetQuestStatus(12698) == QUEST_STATUS_INCOMPLETE)
                            CAST_CRE(who)->CastSpell(owner, 52517, true);

                        //Todo: Creatures must not be removed, but, must instead
                        //      stand next to Gothik and be commanded into the pit
                        //      and dig into the ground.
                        CAST_CRE(who)->DespawnOrUnsummon();

                        if (CAST_PLR(owner)->GetQuestStatus(12698) == QUEST_STATUS_COMPLETE)
                            owner->RemoveAllMinionsByEntry(GHOULS);
                    }
                }
            }
        }
    };

};

class npc_scarlet_ghoul : public CreatureScript
{
public:
    npc_scarlet_ghoul() : CreatureScript("npc_scarlet_ghoul") { }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_scarlet_ghoulAI(creature);
    }

    struct npc_scarlet_ghoulAI : public ScriptedAI
    {
        npc_scarlet_ghoulAI(Creature* creature) : ScriptedAI(creature)
        {
            // Ghouls should display their Birth Animation
            // Crawling out of the ground
            //DoCast(me, 35177, true);
            //me->MonsterSay("Mommy?", LANG_UNIVERSAL, 0);
            me->SetReactState(REACT_DEFENSIVE);
        }

        void FindMinions(Unit* owner)
        {
            std::list<Creature*> MinionList;
            owner->GetAllMinionsByEntry(MinionList, GHOULS);

            if (!MinionList.empty())
            {
                for (std::list<Creature*>::const_iterator itr = MinionList.begin(); itr != MinionList.end(); ++itr)
                {
                    if ((*itr)->GetOwner()->GetGUID() == me->GetOwner()->GetGUID())
                    {
                        if ((*itr)->isInCombat() && (*itr)->getAttackerForHelper())
                        {
                            AttackStart((*itr)->getAttackerForHelper());
                        }
                    }
                }
            }
        }

        void UpdateAI(const uint32 /*diff*/)
        {
            if (!me->isInCombat())
            {
                if (Unit* owner = me->GetOwner())
                {
                    Player* plrOwner = owner->ToPlayer();
                    if (plrOwner && plrOwner->isInCombat())
                    {
                        if (plrOwner->getAttackerForHelper() && plrOwner->getAttackerForHelper()->GetEntry() == GHOSTS)
                            AttackStart(plrOwner->getAttackerForHelper());
                        else
                            FindMinions(owner);
                    }
                }
            }

            if (!UpdateVictim())
                return;

            //ScriptedAI::UpdateAI(diff);
            //Check if we have a current target
            if (me->getVictim()->GetEntry() == GHOSTS)
            {
                if (me->isAttackReady())
                {
                    //If we are within range melee the target
                    if (me->IsWithinMeleeRange(me->getVictim()))
                    {
                        me->AttackerStateUpdate(me->getVictim());
                        me->resetAttackTimer();
                    }
                }
            }
        }
    };

};

/*####
## npc_scarlet_miner_cart
####*/

#define SPELL_CART_CHECK     54173
#define SPELL_CART_DRAG      52465

class npc_scarlet_miner_cart : public CreatureScript
{
public:
    npc_scarlet_miner_cart() : CreatureScript("npc_scarlet_miner_cart") { }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_scarlet_miner_cartAI(creature);
    }

    struct npc_scarlet_miner_cartAI : public PassiveAI
    {
        npc_scarlet_miner_cartAI(Creature* creature) : PassiveAI(creature), minerGUID(0)
        {
            me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PC);
            me->SetDisplayId(me->GetCreatureTemplate()->Modelid1); // Modelid2 is a horse.
        }

        uint64 minerGUID;

        void SetGUID(uint64 guid, int32 /*id*/)
        {
            minerGUID = guid;
        }

        void DoAction(const int32 /*param*/)
        {
            if (Creature* miner = Unit::GetCreature(*me, minerGUID))
            {
                me->SetWalk(false);

                //Not 100% correct, but movement is smooth. Sometimes miner walks faster
                //than normal, this speed is fast enough to keep up at those times.
                me->SetSpeed(MOVE_RUN, 1.25f);

                me->GetMotionMaster()->MoveFollow(miner, 1.0f, 0);
            }
        }

        void PassengerBoarded(Unit* /*who*/, int8 /*seatId*/, bool apply)
        {
            if (!apply)
                if (Creature* miner = Unit::GetCreature(*me, minerGUID))
                {
                    miner->DisappearAndDie();
                    me->GetPlayer(*me, me->GetCreatorGUID())->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PC);
                    me->GetPlayer(*me, me->GetCreatorGUID())->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_NPC);
                }
        }
    };

};

/*####
## npc_scarlet_miner
####*/

#define SAY_SCARLET_MINER1  "Where'd this come from? I better get this down to the ships before the foreman sees it!"
#define SAY_SCARLET_MINER2  "Now I can have a rest!"

class npc_scarlet_miner : public CreatureScript
{
public:
    npc_scarlet_miner() : CreatureScript("npc_scarlet_miner") { }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_scarlet_minerAI(creature);
    }

    struct npc_scarlet_minerAI : public npc_escortAI
    {
        npc_scarlet_minerAI(Creature* creature) : npc_escortAI(creature)
        {
            me->SetReactState(REACT_PASSIVE);
        }

        uint32 IntroTimer;
        uint32 IntroPhase;
        uint64 carGUID;

        void Reset()
        {
            carGUID = 0;
            IntroTimer = 0;
            IntroPhase = 0;
        }

        void InitWaypoint()
        {
            AddWaypoint(1, 2389.03f,     -5902.74f,     109.014f, 5000);
            AddWaypoint(2, 2341.812012f, -5900.484863f, 102.619743f);
            AddWaypoint(3, 2306.561279f, -5901.738281f, 91.792419f);
            AddWaypoint(4, 2300.098389f, -5912.618652f, 86.014885f);
            AddWaypoint(5, 2294.142090f, -5927.274414f, 75.316849f);
            AddWaypoint(6, 2286.984375f, -5944.955566f, 63.714966f);
            AddWaypoint(7, 2280.001709f, -5961.186035f, 54.228283f);
            AddWaypoint(8, 2259.389648f, -5974.197754f, 42.359348f);
            AddWaypoint(9, 2242.882812f, -5984.642578f, 32.827850f);
            AddWaypoint(10, 2217.265625f, -6028.959473f, 7.675705f);
            AddWaypoint(11, 2202.595947f, -6061.325684f, 5.882018f);
            AddWaypoint(12, 2188.974609f, -6080.866699f, 3.370027f);

            if (urand(0, 1))
            {
                AddWaypoint(13, 2176.483887f, -6110.407227f, 1.855181f);
                AddWaypoint(14, 2172.516602f, -6146.752441f, 1.074235f);
                AddWaypoint(15, 2138.918457f, -6158.920898f, 1.342926f);
                AddWaypoint(16, 2129.866699f, -6174.107910f, 4.380779f);
                AddWaypoint(17, 2117.709473f, -6193.830078f, 13.3542f, 10000);
            }
            else
            {
                AddWaypoint(13, 2184.190186f, -6166.447266f, 0.968877f);
                AddWaypoint(14, 2234.265625f, -6163.741211f, 0.916021f);
                AddWaypoint(15, 2268.071777f, -6158.750977f, 1.822252f);
                AddWaypoint(16, 2270.028320f, -6176.505859f, 6.340538f);
                AddWaypoint(17, 2271.739014f, -6195.401855f, 13.3542f, 10000);
            }
        }

        void InitCartQuest(Player* who)
        {
            carGUID = who->GetVehicleBase()->GetGUID();
            InitWaypoint();
            Start(false, false, who->GetGUID());
            SetDespawnAtFar(false);
        }

        void WaypointReached(uint32 waypointId)
        {
            switch (waypointId)
            {
                case 1:
                    if (Unit* car = Unit::GetCreature(*me, carGUID))
                    {
                        me->SetFacingToObject(car);
                    }
                    me->MonsterSay(SAY_SCARLET_MINER1, LANG_UNIVERSAL, 0);
                    SetRun(true);
                    IntroTimer = 4000;
                    IntroPhase = 1;
                    break;
                case 17:
                    if (Unit* car = Unit::GetCreature(*me, carGUID))
                    {
                        me->SetFacingToObject(car);
                        car->Relocate(car->GetPositionX(), car->GetPositionY(), me->GetPositionZ() + 1);
                        car->StopMoving();
                        car->RemoveAura(SPELL_CART_DRAG);
                        car->GetPlayer(*me, car->GetCreatorGUID())->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PC);
                         car->GetPlayer(*me, car->GetCreatorGUID())->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_NPC);
                    }
                    me->MonsterSay(SAY_SCARLET_MINER2, LANG_UNIVERSAL, 0);
                    break;
                default:
                    break;
            }
        }

        void UpdateAI(const uint32 diff)
        {
            if (IntroPhase)
            {
                if (IntroTimer <= diff)
                {
                    if (IntroPhase == 1)
                    {
                        if (Creature* car = Unit::GetCreature(*me, carGUID))
                            DoCast(car, SPELL_CART_DRAG);
                        IntroTimer = 800;
                        IntroPhase = 2;
                    }
                    else
                    {
                        if (Creature* car = Unit::GetCreature(*me, carGUID))
                            car->AI()->DoAction(0);
                        IntroPhase = 0;
                    }
                } else IntroTimer-=diff;
            }
            npc_escortAI::UpdateAI(diff);
        }
    };

};

/*######
## go_inconspicuous_mine_car
######*/

#define SPELL_CART_SUMM   52463

class go_inconspicuous_mine_car : public GameObjectScript
{
public:
    go_inconspicuous_mine_car() : GameObjectScript("go_inconspicuous_mine_car") { }

    bool OnGossipHello(Player* player, GameObject* /*go*/)
    {
        if (player->GetQuestStatus(12701) == QUEST_STATUS_INCOMPLETE)
        {
            // Hack Why Trinity Dont Support Custom Summon Location
            if (Creature* miner = player->SummonCreature(28841, 2383.869629f, -5900.312500f, 107.996086f, player->GetOrientation(), TEMPSUMMON_DEAD_DESPAWN, 1))
            {
                player->CastSpell(player, SPELL_CART_SUMM, true);
                if (Creature* car = player->GetVehicleCreatureBase())
                {
                    if (car->GetEntry() == 28817)
                    {
                        car->AI()->SetGUID(miner->GetGUID());
                        car->GetPlayer(*car, car->GetCreatorGUID())->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PC);
                        car->GetPlayer(*car, car->GetCreatorGUID())->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_NPC);
                        CAST_AI(npc_scarlet_miner::npc_scarlet_minerAI, miner->AI())->InitCartQuest(player);
                    } else sLog->outError(LOG_FILTER_TSCR, "OnGossipHello vehicle entry is not correct.");
                } else sLog->outError(LOG_FILTER_TSCR, "OnGossipHello player is not on the vehicle.");
            } else sLog->outError(LOG_FILTER_TSCR, "OnGossipHello Scarlet Miner cant be found by script.");
        }
        return true;
    }

};

// 28907  prince_valanar
class npc_prince_valanar_28907 : public CreatureScript
{
public:
	npc_prince_valanar_28907() : CreatureScript("npc_prince_valanar_28907") { }

	struct npc_prince_valanar_28907AI : public ScriptedAI
	{
		npc_prince_valanar_28907AI(Creature* creature) : ScriptedAI(creature) { }

		uint32 m_phase;
		uint32 m_timer;
		uint32 m_say;

		void Reset() override
		{
			m_phase = 0;
			m_timer = 1000;
			m_say = 0;
			me->SetWalk(true);
		}

		void UpdateAI(uint32 diff) override
		{
			if (m_timer <= diff)
			{
				DoWork();
			}
			else
				m_timer -= diff;
		}

		void DoWork()
		{
			m_phase++;
			switch (m_phase)
			{
			case 1:
				me->GetMotionMaster()->MovePoint(1, 2321.48f, -5739.86f, 153.92f);
				m_timer = 2000;
				break;
			case 2:
				me->SetFacingTo(0.7f);
				Talk(m_say);
				m_timer = urand(5000, 8000);
				break;
			case 3:
				me->GetMotionMaster()->MovePoint(1, 2319.13f, -5736.79f, 153.92f);
				m_timer = 2000;
				break;
			case 4:
				me->SetFacingTo(0.7f);
				Talk(m_say);
				m_timer = urand(5000, 8000);
				break;
			case 5:
				me->GetMotionMaster()->MovePoint(1, 2316.30f, -5733.26f, 153.92f);
				m_timer = 2000;
				break;
			case 6:
				me->SetFacingTo(0.7f);
				Talk(m_say);
				m_timer = urand(5000, 8000);
				m_phase = 0;
				break;
			}

			m_say++;
			if (m_say > 14)
				m_say = 0;
		}
	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_prince_valanar_28907AI(creature);
	}
};

#ifndef __clang_analyzer__
void AddSC_the_scarlet_enclave_c1()
{
	new npc_acherus_necromancer();
	new npc_instructor_razuvious();

	// Runeforging: Preparing for Battle
	new spell_rune_of_razorice();

    new npc_unworthy_initiate();
    new npc_unworthy_initiate_anchor();
    new go_acherus_soul_prison();

	new npc_eye_of_acherus();

    new npc_death_knight_initiate();

	// Grand Theft Palomino
	new npc_salanar_the_horseman_28653();
	new npc_dark_rider_of_acherus();

	// Into the Realm of Shadows
	new npc_ros_dark_rider();
	new npc_acherus_deathcharger_28782();
	new npc_salanar_the_horseman_28788();

	// The Gift That Keeps On Giving
    new npc_dkc1_gothik();
    new npc_scarlet_ghoul();

	// Massacre At Light's Point
    new npc_scarlet_miner();
    new npc_scarlet_miner_cart();
    new go_inconspicuous_mine_car();

	// The Will Of The Lich King
	new npc_prince_valanar_28907();
}
#endif
