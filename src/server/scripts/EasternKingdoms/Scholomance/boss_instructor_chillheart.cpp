#include "ScriptPCH.h"
#include "scholomance.h"
#include "Cell.h"
#include "CellImpl.h"
#include "GridNotifiers.h"
#include "GridNotifiersImpl.h"

enum ScriptTexts
{
	SAY_AGGRO = 0,
	SAY_DEATH = 1,
	SAY_EVENT_1 = 2, // ice wall
	SAY_EVENT_2 = 3, // phylactery
	SAY_EVENT_3 = 4, // wipe
	SAY_INTRO = 5,
	SAY_KILL = 6,
};

enum Spells
{
	SPELL_ICE_WALL = 111854,
	SPELL_ICE_WAVE_1 = 122443,
	SPELL_ICE_WAVE_2 = 122449,
	SPELL_ICE_WAVE_3 = 122450,
	SPELL_ICE_WAVE_4 = 122451,
	SPELL_ICE_WAVE_AREA = 122482,
	SPELL_ICE_WAVE_KILL = 111231,

	SPELL_ICE_WRATH = 111610,
	SPELL_ICE_WRATH_DMG = 111616,

	SPELL_TOUCH_OF_THE_GRAVE = 111606,
	SPELL_TOUCH_OF_THE_GRAVE_DMG = 111224,

	SPELL_FRIGID_GRASP_AOE = 111209,
	SPELL_FRIGID_GRASP_SUMMON = 111856,
	SPELL_FRIGID_GRASP = 111239,
	SPELL_FRIGID_GRASP_DMG = 114886,

	SPELL_WRACK_SOUL = 111631,
	SPELL_WRACK_SOUL_AOE = 111637,

	SPELL_PHYLACTERY_FILLED = 111256,
	SPELL_FILL_PHYLACTERY = 111441,
	SPELL_PHYLACTERY_DESTROYED = 113685,

	SPELL_SHADOW_VISUAL = 122499, // intro

	SPELL_SUMMON_BOOKS = 111669,

	SPELL_SHADOW_BOLT = 113809,
	SPELL_FIRE_TOME = 111574,
	SPELL_ARCANE_BOMB = 113852,
	SPELL_ARCANE_BOMB_SUMMON = 113854,
	SPELL_ARCANE_BOMB_AURA = 113848,
	SPELL_ARCANE_BOMB_DMG = 113854,

};

enum Events
{
	EVENT_ICE_WRATH = 1,
	EVENT_TOUCH_OF_THE_GRAVE,
	EVENT_FRIGID_GRASP,
	EVENT_WRACK_SOUL,
	EVENT_ICE_WALL,
	EVENT_CHECK_PLAYERS,
	EVENT_MOVE,
	EVENT_SHADOW_BOLT,
	EVENT_ARCANE_BOMB,
	EVENT_FIRE_TOME,
};

enum Adds
{
	NPC_FRIGID_GRASP = 58640,
	NPC_PHYLACTERY_VEHICLE = 58662,
	NPC_WANDERS_BOOK = 59227, // Wanders Colossal Book of Shadow Puppets
	NPC_ANTONIDAS_BOOK = 66240, // Antonidas' Self Help Guide to Standing in Fire
	NPC_ANARCHIST_BOOK = 59707, // The Anarchist Arcanist
	NPC_ARCANE_BOMB = 58753,
};

enum Points
{
	POINT_BOOK = 1,
};

enum Actions
{
	ACTION_BOOK = 1,
	ACTION_FILL_PHYLACTERY = 2,
};

const Position phylacteryPos = { 200.227f, 21.6613f, 118.483f, 4.77471f };

const Position icewallPos = { 200.0f, -24.73f, 119.23f, 1.58f };

const Position bookPos[9] =
{
	{170.510162f, 27.925192f, 119.224541f, 4.741239f},
	{171.385620f, 16.306259f, 119.224541f, 4.820650f},
	{175.592041f, 4.014863f, 119.224541f, 5.254359f},
	{186.924820f, -3.136549f, 119.225807f, 6.164551f},
	{199.733475f, -3.594049f, 119.225807f, 0.037136f},
	{209.181076f, -3.150469f, 119.225807f, 0.067679f},
	{221.516052f, 4.042144f, 119.225807f, 0.831261f},
	{225.652557f, 13.018204f, 119.236877f, 1.478779f},
	{226.224121f, 25.539381f, 119.239227f, 1.717017f}
};

class boss_instructor_chillheart : public CreatureScript
{
public:
	boss_instructor_chillheart() : CreatureScript("boss_instructor_chillheart") { }

	CreatureAI* GetAI(Creature* creature) const
	{
		return new boss_instructor_chillheartAI(creature);
	}

	struct boss_instructor_chillheartAI : public BossAI
	{
		boss_instructor_chillheartAI(Creature* creature) : BossAI(creature, DATA_JANDICE_BAROV)
		{
			me->ApplySpellImmune(0, IMMUNITY_EFFECT, SPELL_EFFECT_KNOCK_BACK, true);
			me->ApplySpellImmune(0, IMMUNITY_EFFECT, SPELL_EFFECT_KNOCK_BACK_DEST, true);
			me->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_GRIP, true);
			me->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_STUN, true);
			me->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_FEAR, true);
			me->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_ROOT, true);
			me->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_FREEZE, true);
			me->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_POLYMORPH, true);
			me->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_HORROR, true);
			me->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_SAPPED, true);
			me->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_CHARM, true);
			me->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_DISORIENTED, true);
			me->ApplySpellImmune(0, IMMUNITY_STATE, SPELL_AURA_MOD_CONFUSE, true);

			me->setActive(true);

			currentWave = 0;

			intro = false;
		}

		std::list<Creature*> ArcaneBombs;

		void Reset()
		{
			_Reset();

			me->GetCreatureListWithEntryInGrid(ArcaneBombs, NPC_ARCANE_BOMB, 100.0f);
			
			for (auto bomb : ArcaneBombs)
				bomb->ForcedDespawn(0);

			me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_IMMUNE_TO_PC);
			me->SetReactState(REACT_AGGRESSIVE);
			me->SetVisible(true);

			me->SummonCreature(NPC_PHYLACTERY, phylacteryPos);
			if (Creature* pStalker = me->SummonCreature(NPC_PHYLACTERY_VEHICLE, phylacteryPos))
				DoCast(pStalker, SPELL_SHADOW_VISUAL);

			for (uint8 i = 0; i < 3; ++i)
			{
				me->SummonCreature(NPC_ANARCHIST_BOOK, bookPos[i * 3]);
				me->SummonCreature(NPC_ANTONIDAS_BOOK, bookPos[(i * 3) + 1]);
				me->SummonCreature(NPC_WANDERS_BOOK, bookPos[(i * 3) + 2]);
			}

			currentWave = 0;
			phase = 0;
		}

		void MoveInLineOfSight(Unit* who)
		{
			if (me->GetDistance(who) <= 60.0f && !intro)
			{
				intro = true;
				Talk(SAY_INTRO);
			}

			BossAI::MoveInLineOfSight(who);
		}

		void EnterCombat(Unit* /*who*/)
		{
			Talk(SAY_AGGRO);

			DoCast(SPELL_ICE_WALL);

			events.ScheduleEvent(EVENT_TOUCH_OF_THE_GRAVE, urand(10000, 20000));
			events.ScheduleEvent(EVENT_ICE_WRATH, urand(5000, 15000));
			events.ScheduleEvent(EVENT_FRIGID_GRASP, urand(8000, 15000));
			if (IsHeroic())
			{
				events.ScheduleEvent(EVENT_WRACK_SOUL, urand(3000, 8000));
			}
		}

		void SpellHit(Unit* who, const SpellInfo* spellInfo)
		{
			if (spellInfo->Id == SPELL_ICE_WALL)
			{
				currentWave = 0;
				events.ScheduleEvent(EVENT_ICE_WALL, 100);
				events.ScheduleEvent(EVENT_CHECK_PLAYERS, 100);

				Talk(SAY_EVENT_1);
			}
		}

		void JustDied(Unit* /*killer*/)
		{
			Talk(SAY_DEATH);
			//_JustDied();
			events.Reset();
			summons.DespawnEntry(NPC_ANARCHIST_BOOK);
			summons.DespawnEntry(NPC_ANTONIDAS_BOOK);
			summons.DespawnEntry(NPC_WANDERS_BOOK);
			
			// Despawn Arcane Bombs
			me->GetCreatureListWithEntryInGrid(ArcaneBombs, NPC_ARCANE_BOMB, 100.0f);
			for (auto bomb : ArcaneBombs)
				bomb->ForcedDespawn(0);

			summons.DespawnEntry(NPC_FRIGID_GRASP);
			summons.DespawnEntry(WORLD_TRIGGER);
			if (instance)
			{
				instance->SetBossState(DATA_INSTRUCTOR_CHILLHEART, DONE);
				instance->SaveToDB();
			}
		}

		void KilledUnit(Unit* victim)
		{
			if (victim->GetTypeId() == TYPEID_PLAYER)
			{
				Talk(SAY_KILL);
			}
		}

		void JustReachedHome()
		{
			Talk(SAY_EVENT_3);

			BossAI::JustReachedHome();
		}

		void DamageTaken(Unit* who, uint32& damage)
		{
			if (me->GetHealth() <= damage && phase == 0)
			{
				damage = 0;

				if (phase == 0)
				{
					phase = 1;

					Talk(SAY_EVENT_2);

					me->AttackStop();
					me->SetReactState(REACT_PASSIVE);

					events.CancelEvent(EVENT_ICE_WRATH);
					events.CancelEvent(EVENT_TOUCH_OF_THE_GRAVE);
					events.CancelEvent(EVENT_FRIGID_GRASP);
					events.CancelEvent(EVENT_WRACK_SOUL);
					events.CancelEvent(EVENT_ICE_WALL);
					events.CancelEvent(EVENT_CHECK_PLAYERS);

					summons.DespawnEntry(WORLD_TRIGGER);

					me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_IMMUNE_TO_PC);
					me->RemoveAllAuras();
					me->SetReactState(REACT_PASSIVE);

					if (Creature* pPhylactery = me->FindNearestCreature(NPC_PHYLACTERY, 300.0f))
					{
						DoCast(pPhylactery, SPELL_FILL_PHYLACTERY, true);
					}

					me->SetVisible(false);
				}
			}
		}

		void UpdateAI(uint32 const diff)
		{
			if (!UpdateVictim())
				return;

			if (me->GetPositionY() < -23.0f || me->GetPositionY() > 42.0f)
			{
				EnterEvadeMode();
				return;
			}

			events.Update(diff);

			if (me->HasUnitState(UNIT_STATE_CASTING))
				return;

			if (uint32 eventId = events.ExecuteEvent())
			{
				switch (eventId)
				{
				case EVENT_ICE_WALL:
				{
					float posY = icewallPos.GetPositionY() + (currentWave * 3.5f);
					if (Creature* pStalker = me->SummonCreature(WORLD_TRIGGER, icewallPos.GetPositionX(), posY, icewallPos.GetPositionZ(), icewallPos.GetOrientation()))
						pStalker->CastSpell(pStalker, SPELL_ICE_WAVE_1, true);

					currentWave++;
					if (posY <= 42.0f)
						events.ScheduleEvent(EVENT_ICE_WALL, 5000);
					break;
				}
				case EVENT_CHECK_PLAYERS:
				{
					KillPlayersWithWave();
					events.ScheduleEvent(EVENT_CHECK_PLAYERS, 1000);
					break;
				}
				case EVENT_ICE_WRATH:
					DoCastAOE(SPELL_ICE_WRATH);
					events.ScheduleEvent(EVENT_ICE_WRATH, urand(14000, 17000));
					break;
				case EVENT_TOUCH_OF_THE_GRAVE:
					DoCast(me, SPELL_TOUCH_OF_THE_GRAVE);
					events.ScheduleEvent(EVENT_TOUCH_OF_THE_GRAVE, urand(25000, 28000));
					break;
				case EVENT_FRIGID_GRASP:
					DoCastAOE(SPELL_FRIGID_GRASP_AOE);
					events.ScheduleEvent(EVENT_FRIGID_GRASP, urand(15000, 25000));
					break;
				case EVENT_WRACK_SOUL:
					if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 0.0f, true))
						DoCast(target, SPELL_WRACK_SOUL);
					break;
				default:
					break;
				}
			}
			DoMeleeAttackIfReady();
		}

	private:

		uint8 phase;
		uint8 currentWave;
		bool intro;

		void KillPlayersWithWave()
		{
			float posY = icewallPos.GetPositionY() + (currentWave * 3.5f);
			std::list<Player*> players;
			me->GetPlayerListInGrid(players, 300.0f); // TODO: adjuste searche range
			for (std::list<Player*>::const_iterator itr = players.begin(); itr != players.end(); ++itr)
			{
				if (Player* player = (*itr))
				{
					if (player->GetPositionY() < (posY + 1.0f))
					{
						player->CastSpell(player, SPELL_ICE_WAVE_KILL, true);
					}
				}

			}
		}

	};
};

class npc_instructor_chillheart_phylactery : public CreatureScript
{
public:
	npc_instructor_chillheart_phylactery() : CreatureScript("npc_instructor_chillheart_phylactery") { }

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_instructor_chillheart_phylacteryAI(creature);
	}

	struct npc_instructor_chillheart_phylacteryAI : public Scripted_NoMovementAI
	{
		npc_instructor_chillheart_phylacteryAI(Creature* creature) : Scripted_NoMovementAI(creature)
		{
			me->ApplySpellImmune(0, IMMUNITY_EFFECT, SPELL_EFFECT_KNOCK_BACK, true);
			me->ApplySpellImmune(0, IMMUNITY_EFFECT, SPELL_EFFECT_KNOCK_BACK_DEST, true);
			me->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_GRIP, true);
			me->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_STUN, true);
			me->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_FEAR, true);
			me->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_ROOT, true);
			me->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_FREEZE, true);
			me->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_POLYMORPH, true);
			me->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_HORROR, true);
			me->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_SAPPED, true);
			me->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_CHARM, true);
			me->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_DISORIENTED, true);
			me->ApplySpellImmune(0, IMMUNITY_STATE, SPELL_AURA_MOD_CONFUSE, true);

			me->setActive(true);
		}

		void Reset()
		{
			me->SetReactState(REACT_PASSIVE);
			me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_IMMUNE_TO_PC);
		}

		void DoAction(const int32 action)
		{
			if (action == ACTION_FILL_PHYLACTERY)
			{
				me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_IMMUNE_TO_PC);
				me->AddAura(SPELL_PHYLACTERY_FILLED, me);
				DoCastAOE(SPELL_SUMMON_BOOKS, true);
			}
		}

		void JustDied(Unit* who)
		{
			if (InstanceScript* pInstance = me->GetInstanceScript())
				if (Creature* pChillheart = sObjectAccessor->GetCreature(*me, pInstance->GetData64(DATA_INSTRUCTOR_CHILLHEART)))
					pChillheart->Kill(pChillheart);

			DoCast(me, SPELL_PHYLACTERY_DESTROYED, true);
		}

		void UpdateAI(uint32 const diff)
		{
		}

	private:

	};
};

class npc_instructor_chillheart_frigid_grasp : public CreatureScript
{
public:
	npc_instructor_chillheart_frigid_grasp() : CreatureScript("npc_instructor_chillheart_frigid_grasp") { }

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_instructor_chillheart_frigid_graspAI(creature);
	}

	struct npc_instructor_chillheart_frigid_graspAI : public Scripted_NoMovementAI
	{
		npc_instructor_chillheart_frigid_graspAI(Creature* creature) : Scripted_NoMovementAI(creature)
		{
			me->setActive(true);
			me->SetReactState(REACT_PASSIVE);
		}

		void Reset()
		{
			me->AddAura(SPELL_FRIGID_GRASP, me);
		}

		void IsSummonedBy(Unit* owner)
		{
			DoZoneInCombat();
		}
	};
};

class npc_instructor_chillheart_book : public CreatureScript
{
public:
	npc_instructor_chillheart_book() : CreatureScript("npc_instructor_chillheart_book") { }

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_instructor_chillheart_bookAI(creature);
	}

	struct npc_instructor_chillheart_bookAI : public Scripted_NoMovementAI
	{
		npc_instructor_chillheart_bookAI(Creature* creature) : Scripted_NoMovementAI(creature)
		{
			me->setActive(true);
			me->SetReactState(REACT_PASSIVE);
		}

		void Reset()
		{
			me->SetDisplayId(11686);
			events.Reset();
			me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_IMMUNE_TO_PC);
		}


		void DoAction(const int32 action)
		{
			if (action == ACTION_BOOK)
			{
				me->SetDisplayId(me->GetNativeDisplayId());
				me->SetCanFly(true);
				me->SetDisableGravity(true);
				DoZoneInCombat();
				events.ScheduleEvent(EVENT_MOVE, 100);

				if (me->GetEntry() == NPC_ANARCHIST_BOOK)
				{
					events.ScheduleEvent(EVENT_ARCANE_BOMB, urand(2000, 5000));
				}
				else if (me->GetEntry() == NPC_ANTONIDAS_BOOK)
				{
					events.ScheduleEvent(EVENT_FIRE_TOME, 1000);
				}
				else if (me->GetEntry() == NPC_WANDERS_BOOK)
				{
					events.ScheduleEvent(EVENT_SHADOW_BOLT, urand(1000, 3000));
				}
			}
		}

		void MovementInform(uint32 type, uint32 id)
		{
			if (type == POINT_MOTION_TYPE)
			{
				if (id == POINT_BOOK)
					events.ScheduleEvent(EVENT_MOVE, 100);
			}
		}

		void JustSummoned(Creature* summon)
		{
			if (summon->GetEntry() == NPC_ARCANE_BOMB)
				DoCast(summon, SPELL_ARCANE_BOMB, true);
		}

		void UpdateAI(const uint32 diff)
		{
			events.Update(diff);

			if (me->HasUnitState(UNIT_STATE_CASTING))
				return;

			if (uint32 eventId = events.ExecuteEvent())
			{
				switch (eventId)
				{
				case EVENT_MOVE:
				{
					Position pos;
					if (GetRandomPos(pos))
					{
						me->GetMotionMaster()->MovePoint(POINT_BOOK, pos);
					}
					break;
				}
				case EVENT_SHADOW_BOLT:
					if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 0, true))
						DoCast(target, SPELL_SHADOW_BOLT);
					events.ScheduleEvent(EVENT_SHADOW_BOLT, urand(3000, 5000));
					break;
				case EVENT_FIRE_TOME:
					DoCast(me, SPELL_FIRE_TOME);
					break;
				case EVENT_ARCANE_BOMB:
				{
					Position pos;
					me->GetPosition(&pos);
					pos.m_positionZ = me->GetMap()->GetHeight(me->GetPhaseMask(), pos.m_positionX, pos.m_positionY, pos.m_positionZ, true, 500.0f);
					me->CastSpell(pos.GetPositionX(), pos.GetPositionY(), pos.GetPositionZ(), SPELL_ARCANE_BOMB_SUMMON, true);
					events.ScheduleEvent(EVENT_ARCANE_BOMB, urand(4000, 7000));
					break;
				}
				}
			}
		}

	private:

		EventMap events;

		bool GetRandomPos(Position& pos)
		{
			if (Creature* pPhylactery = me->FindNearestCreature(NPC_PHYLACTERY, 100.0f))
			{
				pPhylactery->GetRandomNearPosition(pos, 30.0f);
				pos.m_positionZ += 8.0f;
				return true;
			}

			return false;
		}

	};
};

class npc_instructor_chillheart_arcane_bomb : public CreatureScript
{
public:
	npc_instructor_chillheart_arcane_bomb() : CreatureScript("npc_instructor_chillheart_arcane_bomb") { }

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_instructor_chillheart_arcane_bombAI(creature);
	}

	struct npc_instructor_chillheart_arcane_bombAI : public Scripted_NoMovementAI
	{
		npc_instructor_chillheart_arcane_bombAI(Creature* creature) : Scripted_NoMovementAI(creature)
		{
			me->SetReactState(REACT_PASSIVE);
		}

		void Reset()
		{
			me->AddAura(SPELL_ARCANE_BOMB_AURA, me);
		}

		void IsSummonedBy(Unit* owner)
		{
			events.ScheduleEvent(EVENT_ARCANE_BOMB, 7000);
		}

		void UpdateAI(const uint32 diff)
		{
			events.Update(diff);

			if (uint32 eventId = events.ExecuteEvent())
			{
				if (eventId == EVENT_ARCANE_BOMB)
				{
					DoCastAOE(SPELL_ARCANE_BOMB_DMG, true);
					me->DespawnOrUnsummon(500);
				}
			}
		}

	private:

		EventMap events;
	};
};

class spell_instructor_chillheart_wrack_soul : public SpellScriptLoader
{
public:
	spell_instructor_chillheart_wrack_soul() : SpellScriptLoader("spell_instructor_chillheart_wrack_soul") { }

	class spell_instructor_chillheart_wrack_soul_AuraScript : public AuraScript
	{
		PrepareAuraScript(spell_instructor_chillheart_wrack_soul_AuraScript);

		void OnRemove(AuraEffect const* /*aurEff*/, AuraEffectHandleModes /*mode*/)
		{
			if (!GetTarget())
				return;

			if (InstanceScript* pInstance = GetTarget()->GetInstanceScript())
				if (pInstance->GetBossState(DATA_INSTRUCTOR_CHILLHEART) == IN_PROGRESS)
					GetTarget()->CastSpell(GetTarget(), SPELL_WRACK_SOUL_AOE, true);
		}
		void Register()
		{
			OnEffectRemove += AuraEffectRemoveFn(spell_instructor_chillheart_wrack_soul_AuraScript::OnRemove, EFFECT_0, SPELL_AURA_PERIODIC_DAMAGE, AURA_EFFECT_HANDLE_REAL);
		}
	};

	AuraScript* GetAuraScript() const
	{
		return new spell_instructor_chillheart_wrack_soul_AuraScript();
	}
};


class spell_instructor_chillheart_wrack_soul_aoe : public SpellScriptLoader
{
public:
	spell_instructor_chillheart_wrack_soul_aoe() : SpellScriptLoader("spell_instructor_chillheart_wrack_soul_aoe") { }

	class spell_instructor_chillheart_wrack_soul_aoe_SpellScript : public SpellScript
	{
		PrepareSpellScript(spell_instructor_chillheart_wrack_soul_aoe_SpellScript);

		void FilterTargets(std::list<WorldObject*>& targets)
		{
			if (targets.size() > 1)
			{
				JadeCore::Containers::RandomResizeList(targets, 1);
			}
		}

		void HandleDummy(SpellEffIndex effIndex)
		{
			if (!GetHitUnit())
				return;

			if (Creature* pChillheart = GetHitUnit()->FindNearestCreature(NPC_INSTRUCTOR_CHILLHEART, 200.0f))
				pChillheart->AddAura(SPELL_WRACK_SOUL, GetHitUnit());
		}

		void Register()
		{
			OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_instructor_chillheart_wrack_soul_aoe_SpellScript::FilterTargets, EFFECT_0, TARGET_UNIT_SRC_AREA_PARTY);
			OnEffectHitTarget += SpellEffectFn(spell_instructor_chillheart_wrack_soul_aoe_SpellScript::HandleDummy, EFFECT_0, SPELL_EFFECT_DUMMY);
		}

	private:

	};

	SpellScript* GetSpellScript() const
	{
		return new spell_instructor_chillheart_wrack_soul_aoe_SpellScript();
	}
};

class spell_instructor_chillheart_wrack_summon_books : public SpellScriptLoader
{
public:
	spell_instructor_chillheart_wrack_summon_books() : SpellScriptLoader("spell_instructor_chillheart_wrack_summon_books") { }

	class spell_instructor_chillheart_wrack_summon_books_SpellScript : public SpellScript
	{
		PrepareSpellScript(spell_instructor_chillheart_wrack_summon_books_SpellScript);

		void HandleDummy()
		{
			if (!GetHitUnit())
				return;

			if (Creature* pBook = GetHitUnit()->ToCreature())
			{
				pBook->AI()->DoAction(ACTION_BOOK);
			}
		}

		void Register()
		{
			OnHit += SpellHitFn(spell_instructor_chillheart_wrack_summon_books_SpellScript::HandleDummy);
		}

	private:

	};

	SpellScript* GetSpellScript() const
	{
		return new spell_instructor_chillheart_wrack_summon_books_SpellScript();
	}
};

class spell_instructor_chillheart_fill_phylactery : public SpellScriptLoader
{
public:
	spell_instructor_chillheart_fill_phylactery() : SpellScriptLoader("spell_instructor_chillheart_fill_phylactery") { }

	class spell_instructor_chillheart_fill_phylactery_SpellScript : public SpellScript
	{
		PrepareSpellScript(spell_instructor_chillheart_fill_phylactery_SpellScript);

		void HandleDummy()
		{
			if (!GetHitUnit())
				return;

			if (Creature* pPhylactery = GetHitUnit()->ToCreature())
			{
				pPhylactery->AI()->DoAction(ACTION_FILL_PHYLACTERY);
			}
		}

		void Register()
		{
			OnHit += SpellHitFn(spell_instructor_chillheart_fill_phylactery_SpellScript::HandleDummy);
		}

	private:

	};

	SpellScript* GetSpellScript() const
	{
		return new spell_instructor_chillheart_fill_phylactery_SpellScript();
	}
};

class spell_instructor_chillheart_burn : public SpellScriptLoader
{
public:
	spell_instructor_chillheart_burn() : SpellScriptLoader("spell_instructor_chillheart_burn") { }

	class spell_instructor_chillheart_burn_SpellScript : public SpellScript
	{
		PrepareSpellScript(spell_instructor_chillheart_burn_SpellScript);

		void FilterTargets(std::list<WorldObject*>& targets)
		{
			if (!GetCaster())
				return;

			targets.clear();

			std::list<Unit*> newtargets;
			JadeCore::AnyUnfriendlyNoTotemUnitInObjectRangeCheck u_check(GetCaster(), GetCaster(), 10.0f);
			JadeCore::UnitListSearcher<JadeCore::AnyUnfriendlyNoTotemUnitInObjectRangeCheck> searcher(GetCaster(), newtargets, u_check);
			GetCaster()->VisitNearbyObject(10.0f, searcher);

			for (std::list<Unit*>::const_iterator itr = newtargets.begin(); itr != newtargets.end(); ++itr)
				if (GetCaster()->GetDistance2d((*itr)) <= 2.0f)
					targets.push_back((*itr));
		}

		void Register()
		{
			OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_instructor_chillheart_burn_SpellScript::FilterTargets, EFFECT_0, TARGET_UNIT_CONE_ENEMY_129);
		}

	private:

	};

	SpellScript* GetSpellScript() const
	{
		return new spell_instructor_chillheart_burn_SpellScript();
	}
};

void AddSC_boss_instructor_chillheart()
{
	new boss_instructor_chillheart();
	new npc_instructor_chillheart_phylactery();
	new npc_instructor_chillheart_frigid_grasp();
	new npc_instructor_chillheart_book();
	new npc_instructor_chillheart_arcane_bomb();
	new spell_instructor_chillheart_wrack_soul();
	new spell_instructor_chillheart_wrack_soul_aoe();
	new spell_instructor_chillheart_wrack_summon_books();
	new spell_instructor_chillheart_fill_phylactery();
	new spell_instructor_chillheart_burn();
}