#include "ScriptPCH.h"
#include "MoveSpline.h"
#include "MoveSplineInit.h"
#include "scarlet_monastery.h"

enum Says
{
	SAY_AGGRO = 0,
	SAY_DEFEAT = 1,
	SAY_SPELL = 2,
	SAY_SLAY = 3,
	SAY_DEATH = 4,
	SAY_LAUGH = 5,
};

enum Entry
{
	HH_MOUNTED = 23682,
	HH_DISMOUNTED = 23800,
	HEAD = 23775,
	PULSING_PUMPKIN = 23694,
	PUMPKIN_FIEND = 23545,
	HELPER = 23686,
	WISP_INVIS = 24034
};

enum Spells
{
	SPELL_CLEAVE = 42587,
	SPELL_CONFLAGRATION = 42380,       //Phase 2, can't find real spell(Dim Fire?)
 // SPELL_CONFL_SPEED           = 22587,       //8% increase speed, value 22587 from SPELL_CONFLAGRATION mains that spell?
 SPELL_SUMMON_PUMPKIN = 42394,

 SPELL_WHIRLWIND = 43116,
 SPELL_IMMUNE = 42556,
 SPELL_BODY_REGEN = 42403,
 SPELL_CONFUSE = 43105,

 SPELL_FLYING_HEAD = 42399,       //visual flying head
 SPELL_HEAD = 42413,       //visual buff, "head"
 SPELL_HEAD_IS_DEAD = 42428,       //at killing head, Phase 3

 SPELL_PUMPKIN_AURA = 42280,
 SPELL_PUMPKIN_AURA_GREEN = 42294,
 SPELL_SQUASH_SOUL = 42514,
 SPELL_SPROUTING = 42281,
 SPELL_SPROUT_BODY = 42285,

 //Effects
 SPELL_RHYME_BIG = 42909,
 // SPELL_RHYME_SMALL           = 42910,
 SPELL_HEAD_SPEAKS = 43129,
 SPELL_HEAD_LANDS = 42400,
 SPELL_BODY_FLAME = 42074,
 SPELL_HEAD_FLAME = 42971,
 // SPELL_ENRAGE_VISUAL         = 42438,       // he uses this spell?
 SPELL_WISP_BLUE = 42821,
 SPELL_WISP_FLIGHT_PORT = 42818,
 // SPELL_WISP_INVIS            = 42823,
 SPELL_SMOKE = 42355,
 SPELL_DEATH = 42566,      //not correct spell
 SPELL_JACK_O_LANTERNED = 44185,
};

enum Events
{
	EVENT_WHIRLWIND = 1,
	EVENT_FLEEING = 2,
};

enum Misc
{
	DATA_PHASE = 1,
	DATA_CONTINUE = 2,
	DATA_START = 3,
};

#define MAX_FLIGHT_POS 6

static Position flightPos[] =
{
	{1090.870483f, 612.514648f, 1.707436f, 0.037064f},
	{1117.401978f, 619.834412f, 13.614512f, 0.269193f},
	{1119.229858f, 639.365356f, 17.885136f, 1.478707f},
	{1097.532959f, 647.212891f, 13.598148f, 2.825667f},
	{1079.051025f, 641.184570f, 5.833526f, 3.607579f},
	{1073.474121f, 629.921692f, 0.767164f, 4.499441f}
};

//static const char* Text[]=
//{
//    "Horseman rise...",
//    "Your time is nigh...",
//    "You felt death once...",
//    "Now, know demise!"
//};

#define EMOTE_LAUGHS    "Headless Horseman laughs"  // needs assigned to db.

class mob_wisp_invis : public CreatureScript
{
public:
	mob_wisp_invis() : CreatureScript("mob_wisp_invis") { }

	CreatureAI* GetAI(Creature* creature) const
	{
		return new mob_wisp_invisAI(creature);
	}

	struct mob_wisp_invisAI : public ScriptedAI
	{
		mob_wisp_invisAI(Creature* creature) : ScriptedAI(creature)
		{
			Creaturetype = delay = spell = spell2 = 0;
		}

		uint32 Creaturetype;
		uint32 delay;
		uint32 spell;
		uint32 spell2;
		void Reset() {}
		void EnterCombat(Unit* /*who*/) {}
		void SetType(uint32 _type)
		{
			switch (Creaturetype = _type)
			{
			case 1:
				spell = SPELL_PUMPKIN_AURA_GREEN;
				break;
			case 2:
				delay = 15000;
				spell = SPELL_BODY_FLAME;
				spell2 = SPELL_DEATH;
				break;
			case 3:
				delay = 15000;
				spell = SPELL_SMOKE;
				break;
			case 4:
				delay = 7000;
				spell2 = SPELL_WISP_BLUE;
				break;
			}
			if (spell)
				DoCast(me, spell);
		}

		void SpellHit(Unit* /*caster*/, const SpellInfo* spell)
		{
			if (spell->Id == SPELL_WISP_FLIGHT_PORT && Creaturetype == 4)
				me->SetDisplayId(2027);
		}

		void MoveInLineOfSight(Unit* who)
		{
			if (!who || Creaturetype != 1 || !who->isTargetableForAttack())
				return;

			if (me->IsWithinDist(who, 0.1f, false) && !who->HasAura(SPELL_SQUASH_SOUL))
				DoCast(who, SPELL_SQUASH_SOUL);
		}

		void UpdateAI(const uint32 diff)
		{
			if (delay)
			{
				if (delay <= diff)
				{
					me->RemoveAurasDueToSpell(SPELL_SMOKE);
					if (spell2)
						DoCast(me, spell2);
					delay = 0;
				}
				else delay -= diff;
			}
		}
	};
};

class npc_headless_horseman_head : public CreatureScript
{
public:
	npc_headless_horseman_head() : CreatureScript("npc_headless_horseman_head") { }

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_headless_horseman_headAI(creature);
	}

	struct npc_headless_horseman_headAI : public ScriptedAI
	{
		npc_headless_horseman_headAI(Creature* creature) : ScriptedAI(creature)
		{
			me->SetReactState(REACT_PASSIVE);
			pInstance = creature->GetInstanceScript();
			phase = 0;
		}

		void Reset()
		{
			phase = 0;
			events.Reset();
			me->SetFloatValue(UNIT_FIELD_COMBAT_REACH, 5);
			me->SetFloatValue(UNIT_FIELD_BOUNDING_RADIUS, 5);
			me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_IMMUNE_TO_PC);
			DoCast(me, SPELL_HEAD, true);
		}

		void SetData(uint32 type, uint32 data)
		{
			if (type == DATA_PHASE)
				phase = data;

			switch (phase)
			{
			case 2:
				me->SetHealth(me->CountPctFromMaxHealth(67));
				break;
			case 3:
				me->SetHealth(me->CountPctFromMaxHealth(33));
				break;
			}
		}

		void DamageTaken(Unit* /*done_by*/, uint32 &damage)
		{
			switch (phase)
			{
			case 1:
				if (me->HealthBelowPctDamaged(67, damage))
				{
					if (Creature* pHorseman = sObjectAccessor->GetCreature(*me, pInstance->GetData64(DATA_HORSEMAN)))
						pHorseman->AI()->DoAction(DATA_CONTINUE);

					me->RemoveAllAuras();
					me->DespawnOrUnsummon();
				}
				break;
			case 2:
				if (me->HealthBelowPctDamaged(33, damage))
				{
					if (Creature* pHorseman = sObjectAccessor->GetCreature(*me, pInstance->GetData64(DATA_HORSEMAN)))
						pHorseman->AI()->DoAction(DATA_CONTINUE);

					me->RemoveAllAuras();
					me->DespawnOrUnsummon();
				}
				break;
			case 3: // Don't know why this was commented out.
				/*if (damage >= me->GetHealth())
				{
					if (Creature* pHorseman = sObjectAccessor->GetCreature(*me, pInstance->GetData64(DATA_HORSEMAN)))
						pHorseman->AI()->DoAction(DATA_CONTINUE);

					me->RemoveAllAuras();
					DoCast(me, SPELL_HEAD_IS_DEAD);
					me->DespawnOrUnsummon(100);
				}*/
				break;
			}
		}

		void JustDied(Unit* /*killer*/)
		{
			if (phase != 3)
				return;

			if (Creature* pHorseman = sObjectAccessor->GetCreature(*me, pInstance->GetData64(DATA_HORSEMAN)))
				pHorseman->AI()->DoAction(DATA_CONTINUE);

			me->RemoveAllAuras();
			DoCast(me, SPELL_HEAD_IS_DEAD);
			me->DespawnOrUnsummon(100);
		}

		void UpdateAI(const uint32 diff)
		{
			events.Update(diff);

			if (uint32 eventId = events.ExecuteEvent())
			{
				if (eventId == EVENT_FLEEING)
				{
					if (me->getVictim())
					{
						//me->GetMotionMaster()->Clear(false);
						//me->GetMotionMaster()->MoveFleeing(me->getVictim());
					}
					events.ScheduleEvent(EVENT_FLEEING, urand(2000, 3000));
				}
			}
		}

	private:
		uint32 phase;
		EventMap events;
		InstanceScript* pInstance;

	};
};

class boss_headless_horseman : public CreatureScript
{
public:
	boss_headless_horseman() : CreatureScript("boss_headless_horseman") { }

	CreatureAI* GetAI(Creature* creature) const
	{
		return new boss_headless_horsemanAI(creature);
	}

	struct boss_headless_horsemanAI : public ScriptedAI
	{
		boss_headless_horsemanAI(Creature* creature) : ScriptedAI(creature), summonList(creature)
		{
			instance = creature->GetInstanceScript();
			me->SetReactState(REACT_PASSIVE);
		}

		InstanceScript* instance;

		uint32 phase;
		uint64 headGUID;
		bool hasHead;
		SummonList summonList;
		uint8 currentPoint;

		void Reset()
		{
			me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_IMMUNE_TO_PC);
			phase = 1;
			headGUID = 0;
			currentPoint = 0;
			hasHead = true;
			DoCast(me, SPELL_HEAD, true);
		}

		void JustReachedHome()
		{
			instance->SetData(DATA_HORSEMAN_EVENT, NOT_STARTED);
			me->DespawnOrUnsummon(100);
		}

		void MovementInform(uint32 type, uint32 data)
		{
			if (type == POINT_MOTION_TYPE)
			{
				switch (data)
				{
				case 5:
					me->StopMoving();
					me->SetCanFly(false);
					me->SetDisableGravity(false);
					me->SetSpeed(MOVE_RUN, 1.4f);
					me->SetSpeed(MOVE_WALK, 1.4f);
					me->SetReactState(REACT_AGGRESSIVE);
					me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_IMMUNE_TO_PC);
					DoZoneInCombat();
					break;
				case 0:
				case 1:
				case 2:
				case 3:
				case 4:
					currentPoint++;
					me->StopMoving();
					me->GetMotionMaster()->MovePoint(currentPoint, flightPos[currentPoint]);
					break;

				}
			}
		}

		void KilledUnit(Unit* player)
		{
			if (player->GetTypeId() == TYPEID_PLAYER)
			{
				Talk(SAY_SLAY);
			}
		}

		void JustDied(Unit* /*killer*/)
		{
			Talk(SAY_DEATH);

			events.Reset();
			summonList.DespawnAll();

			if (instance)
				instance->SetData(DATA_HORSEMAN_EVENT, DONE);

			Map::PlayerList const& players = me->GetMap()->GetPlayers();
			if (!players.isEmpty())
				for (Map::PlayerList::const_iterator i = players.begin(); i != players.end(); ++i)
					if (Player* player = i->getSource())
						if (player->IsAtGroupRewardDistance(me))
							sLFGMgr->RewardDungeonDoneFor(285, player);
		}

		void DoAction(const int32 action)
		{
			switch (action)
			{
			case DATA_START:
			{
				DoCast(me, SPELL_RHYME_BIG, true);

				me->SetCanFly(true);
				me->SetDisableGravity(true);
				me->SetReactState(REACT_PASSIVE);
				me->SetSpeed(MOVE_RUN, 4.0f);
				me->SetSpeed(MOVE_WALK, 4.0f);
				me->SetSpeed(MOVE_FLIGHT, 4.0f);
				currentPoint++;
				me->GetMotionMaster()->MovePoint(currentPoint, flightPos[currentPoint]);
				Talk(SAY_AGGRO);
				break;
			}
			case DATA_CONTINUE:
				if (phase < 3)
				{
					hasHead = true;
					events.Reset();
					me->InterruptNonMeleeSpells(true);
					me->RemoveAllAuras();
					me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
					DoCast(me, SPELL_HEAD_LANDS, true);
					DoCast(me, SPELL_HEAD, true);
					phase++;
				}
				else
				{
					if (Unit* victim = me->getVictim())
						victim->Kill(me);
				}
				break;
			}
		}

		void DamageTaken(Unit* /*done_by*/, uint32 &damage)
		{
			if (damage >= me->GetHealth() && hasHead)
			{
				Talk(SAY_DEFEAT);
				hasHead = false;
				events.Reset();
				damage = 0;
				me->RemoveAllAuras();
				me->InterruptNonMeleeSpells(false);
				DoCast(me, SPELL_IMMUNE, true);
				DoCast(me, SPELL_BODY_REGEN, true);
				DoCast(me, SPELL_CONFUSE, false);

				events.ScheduleEvent(EVENT_WHIRLWIND, urand(4000, 8000));

				if (Creature* pHead = me->SummonCreature(HEAD, me->GetPositionX() + float(rand() % 6), me->GetPositionY() + float(rand() % 6), me->GetPositionZ() + 5.0f, 0, TEMPSUMMON_DEAD_DESPAWN, 0))
				{
					pHead->AI()->SetData(DATA_PHASE, phase);
					pHead->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
					//Head->CastSpell(Head, SPELL_HEAD_INVIS, false);
					headGUID = pHead->GetGUID();
					DoCast(pHead, SPELL_FLYING_HEAD, true);
				}
			}
		}

		void JustSummoned(Creature* summon)
		{
			summonList.Summon(summon);

			if (me->isInCombat())
				DoZoneInCombat(summon);
		}

		void SummonedCreatureDespawn(Creature* summon)
		{
			summonList.Despawn(summon);
		}

		void UpdateAI(const uint32 diff)
		{
			if (!UpdateVictim())
				return;

			events.Update(diff);

			if (me->HasUnitState(UNIT_STATE_CASTING))
				return;

			if (uint32 eventId = events.ExecuteEvent())
			{
				switch (eventId)
				{
				case EVENT_WHIRLWIND:
					me->RemoveAurasDueToSpell(SPELL_CONFUSE);
					DoCast(me, SPELL_WHIRLWIND, true);
					DoCast(me, SPELL_CONFUSE);
					events.ScheduleEvent(EVENT_WHIRLWIND, urand(4000, 8000));
					break;
				}
			}

			DoMeleeAttackIfReady();


			//    else
			//    {
			//        if (regen <= diff)
			//        {
			//            regen = 1000;                   //"body calls head"
			//            if (me->IsFullHealth() && !returned)
			//            {
			//                if (Phase > 1)
			//                    --Phase;
			//                else
			//                    Phase = 1;
			//                Creature* Head = Unit::GetCreature((*me), headGUID);
			//                if (Head && Head->isAlive())
			//                {
			//                    CAST_AI(mob_head::mob_headAI, Head->AI())->Phase = Phase;
			//                    CAST_AI(mob_head::mob_headAI, Head->AI())->Disappear();
			//                }
			//                return;
			//            }
			//        }
			//        else regen -= diff;

			//        if (whirlwind <= diff)
			//        {
			//            whirlwind = urand(4000, 8000);
			//            if (urand(0, 1))
			//            {
			//                me->RemoveAurasDueToSpell(SPELL_CONFUSE);
			//                DoCast(me, SPELL_WHIRLWIND, true);
			//                DoCast(me, SPELL_CONFUSE);
			//            }
			//            else
			//                me->RemoveAurasDueToSpell(SPELL_WHIRLWIND);
			//        }
			//        else whirlwind -= diff;
			//    }
		}
	};
};

class mob_pulsing_pumpkin : public CreatureScript
{
public:
	mob_pulsing_pumpkin() : CreatureScript("mob_pulsing_pumpkin") { }

	CreatureAI* GetAI(Creature* creature) const
	{
		return new mob_pulsing_pumpkinAI(creature);
	}

	struct mob_pulsing_pumpkinAI : public ScriptedAI
	{
		mob_pulsing_pumpkinAI(Creature* creature) : ScriptedAI(creature) {}

		bool sprouted;
		uint64 debuffGUID;

		void Reset()
		{
			float x, y, z;
			me->GetPosition(x, y, z);   //this visual aura some under ground
			me->SetPosition(x, y, z + 0.35f, 0.0f);
			Despawn();
			Creature* debuff = DoSpawnCreature(HELPER, 0, 0, 0, 0, TEMPSUMMON_TIMED_OR_CORPSE_DESPAWN, 14500);
			if (debuff)
			{
				debuff->SetDisplayId(me->GetDisplayId());
				debuff->CastSpell(debuff, SPELL_PUMPKIN_AURA_GREEN, false);
				CAST_AI(mob_wisp_invis::mob_wisp_invisAI, debuff->AI())->SetType(1);
				debuffGUID = debuff->GetGUID();
			}
			sprouted = false;
			DoCast(me, SPELL_PUMPKIN_AURA, true);
			DoCast(me, SPELL_SPROUTING);
			me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_STUNNED);
		}

		void EnterCombat(Unit* /*who*/) {}

		void SpellHit(Unit* /*caster*/, const SpellInfo* spell)
		{
			if (spell->Id == SPELL_SPROUTING)
			{
				sprouted = true;
				me->RemoveAllAuras();
				me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_STUNNED);
				DoCast(me, SPELL_SPROUT_BODY, true);
				me->UpdateEntry(PUMPKIN_FIEND);
				DoStartMovement(me->getVictim());
			}
		}

		void Despawn()
		{
			if (!debuffGUID)
				return;

			Unit* debuff = Unit::GetUnit(*me, debuffGUID);
			if (debuff)
			{
				debuff->SetVisible(false);
				debuffGUID = 0;
			}
		}

		void JustDied(Unit* /*killer*/)
		{
			if (!sprouted)
				Despawn();
		}

		void MoveInLineOfSight(Unit* who)
		{
			if (!who || !me->IsValidAttackTarget(who) || me->getVictim())
				return;

			me->AddThreat(who, 0.0f);
			if (sprouted)
				DoStartMovement(who);
		}

		void UpdateAI(const uint32 /*diff*/)
		{
			if (sprouted && UpdateVictim())
				DoMeleeAttackIfReady();
		}
	};
};

class go_loosely_turned_soil : public GameObjectScript
{
public:
	go_loosely_turned_soil() : GameObjectScript("go_loosely_turned_soil") { }

	bool OnGossipHello(Player* player, GameObject* soil)
	{
		InstanceScript* instance = player->GetInstanceScript();
		if (instance)
		{
			if (instance->GetData(DATA_HORSEMAN_EVENT) != NOT_STARTED)
				return true;
			instance->SetData(DATA_HORSEMAN_EVENT, IN_PROGRESS);
		}
		/*  if (soil->GetGoType() == GAMEOBJECT_TYPE_QUESTGIVER && player->getLevel() > 64)
			{
				player->PrepareQuestMenu(soil->GetGUID());
				player->SendPreparedQuest(soil->GetGUID());
			}
			if (player->GetQuestStatus(11405) == QUEST_STATUS_INCOMPLETE && player->getLevel() > 64)
			{ */
		player->AreaExploredOrEventHappens(11405);
		//if (Creature* horseman = soil->SummonCreature(HH_MOUNTED, FlightPoint[20].x, FlightPoint[20].y, FlightPoint[20].z, 0, TEMPSUMMON_MANUAL_DESPAWN, 0))
		//{
		//    CAST_AI(boss_headless_horseman::boss_headless_horsemanAI, horseman->AI())->PlayerGUID = player->GetGUID();
		//    CAST_AI(boss_headless_horseman::boss_headless_horsemanAI, horseman->AI())->FlyMode();
		//}
	//}

		if (Creature* pHeadless = soil->SummonCreature(HH_MOUNTED, flightPos[0].GetPositionX(), flightPos[0].GetPositionY(), flightPos[0].GetPositionZ(), flightPos[0].GetOrientation(), TEMPSUMMON_MANUAL_DESPAWN, 0))
		{
			pHeadless->AI()->DoAction(DATA_START);
		}

		return true;
	}
};

void AddSC_boss_headless_horseman()
{
	new boss_headless_horseman();
	new npc_headless_horseman_head();
	new mob_pulsing_pumpkin();
	new mob_wisp_invis();
	new go_loosely_turned_soil();
}