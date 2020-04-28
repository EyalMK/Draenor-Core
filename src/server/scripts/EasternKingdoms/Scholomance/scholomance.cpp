#include "ScriptPCH.h"
#include "scholomance.h"

enum Spells
{
	// Risen Guard
	SPELL_UNHOLY_BLADE = 111801,
	SPELL_IMPALE = 111813,

	// Scholomance Acolyte
	SPELL_SHADOW_BOLT = 111599,
	SPELL_SHATTER_SOUL = 111594,
	SPELL_SHATTER_SOUL_SUMMON = 111596,
	SPELL_SPIRIT_BARRAGE = 111774,
	SPELL_UNBOUND = 111772,

	// Scholomance Neophyte
	SPELL_BOUND_SERVANT = 111715,
	SPELL_NECROTIC_PACT = 111722,
	SPELL_REND_FLESH = 111762,
	SPELL_SHADOW_INCINERATION = 111752,

	SPELL_BLACK_CANDLE_DUMMY = 114473,
	SPELL_BLACK_CANDLE = 114400,
	SPELL_BLACK_CANDLE_MISSILE = 114412,
	SPELL_BLACK_CANDLE_SUMMON = 114411,

	SPELL_SUMMON_WOVEN_BODYGUARD_SCRIPT_1 = 113803,
	SPELL_SUMMON_WOVEN_BODYGUARD_SUMMON_1 = 113686,
	SPELL_SUMMON_WOVEN_BODYGUARD_SCRIPT_2 = 113820,
	SPELL_SUMMON_WOVEN_BODYGUARD_SUMMON_2 = 113821,

	// Candlestick Mage
	SPELL_FLICKERING_FLAME = 114474,
	SPELL_SKIN_LIKE_WAX = 114479,

	// Boneweaver
	SPELL_BONE_SHARDS = 113629,

	// Krastinovian Carver
	SPELL_BOILING_BLOODTHRIST = 114141,
	SPELL_BOILING_BLOODTHRIST_AOE = 114155,
	SPELL_SANGUINARIAN = 115427, // achievement

	// Bored Student
	SPELL_FIRE_BREATH_POTION = 114872,
	SPELL_SHADOW_BOLT_2 = 114859,
	SPELL_SHADOW_NOVA = 114864,

	// Professor Slate
	SPELL_POTION_OF_BRUTISH_FORCE = 114874,
	SPELL_REND = 114860,
	SPELL_TOXIC_POTION = 114873,

	// Doctor Theolen Krastionov
	SPELL_BACKHAND = 18103,
	SPELL_FRENZY = 8269,
	SPELL_REND_2 = 16509,
};

enum Adds
{
	NPC_RISEN_GUARD = 58822,
	NPC_SCHOLOMANCE_ACOLYTE = 58757,
	NPC_SHATTERED_SOUL = 58758,
	NPC_SHOLOMANCE_NEOPHYTE = 58823,
	NPC_BOUND_SERVANT = 58831,
	NPC_BRITTLE_SKELETON_1 = 59480, // summoned by 114411
	NPC_BRITTLE_SKELETON_2 = 59503,
	NPC_WOVEN_BODYGUARD_1 = 59213, // summoned by 1
	NPC_WOVEN_BODYGUARD_2 = 59242, // summoned by 2
	NPC_CANDLESTICK_MAGE = 59467,
	NPC_BONEWEAVER = 59193,
	NPC_KRASTINOVIAN_CARVER = 59368,
	NPC_FLESH_HORROR = 59359,
	NPC_BORED_STUDENT = 59614,
	NPC_PROFESSOR_SLATE = 59613,
};

enum Events
{
	// Risen Guard
	EVENT_IMPALE = 1,
	EVENT_UNHOLY_BLADE,

	// Scholomance Acolyte
	EVENT_SHADOW_BOLT,
	EVENT_SHATTER_SOUL,
	EVENT_SPIRIT_BARRAGE,
	EVENT_UNBOUND,

	// Scholomance Neophyte
	EVENT_BOUND_SERVANT,
	EVENT_NECROTIC_PACT,
	EVENT_REND_FLESH,
	EVENT_SHADOW_INCINERATION,

	// Candlestick Mage
	EVENT_FLICKERING_FLAME,
	EVENT_SKIN_LIKE_WAX,

	// Boneweaver
	EVENT_BONE_SHARDS,

	// Bored Student
	EVENT_FIRE_BREATH_POTION,
	EVENT_SHADOW_NOVA,

	// Professor Slate
	EVENT_POTION_OF_BRUTISH_FORCE,
	EVENT_REND,
	EVENT_TOXIC_POTION,

	// Doctor Theolen Krastinov
	EVENT_BACKHAND,
	EVENT_FRENZY,
};

class npc_scholomance_risen_guard : public CreatureScript
{
public:
	npc_scholomance_risen_guard() : CreatureScript("npc_scholomance_risen_guard") { }

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_scholomance_risen_guardAI(creature);
	}

	struct npc_scholomance_risen_guardAI : public ScriptedAI
	{
		npc_scholomance_risen_guardAI(Creature* creature) : ScriptedAI(creature)
		{
		}

		void Reset()
		{
			events.Reset();
		}

		void EnterCombat(Unit* who)
		{
			events.ScheduleEvent(EVENT_UNHOLY_BLADE, urand(5000, 10000));
			events.ScheduleEvent(EVENT_IMPALE, urand(3000, 10000));
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
				case EVENT_IMPALE:
					if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 0.0f, true))
						DoCast(target, SPELL_IMPALE);
					events.ScheduleEvent(EVENT_IMPALE, urand(8000, 12000));
					break;
				case EVENT_UNHOLY_BLADE:
					DoCastVictim(SPELL_UNHOLY_BLADE);
					events.ScheduleEvent(EVENT_UNHOLY_BLADE, urand(7000, 12000));
					break;
				default:
					break;
				}
			}

			DoMeleeAttackIfReady();
		}

	private:
		EventMap events;
	};
};

class npc_scholomance_scholomance_acolyte : public CreatureScript
{
public:
	npc_scholomance_scholomance_acolyte() : CreatureScript("npc_scholomance_scholomance_acolyte") { }

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_scholomance_scholomance_acolyteAI(creature);
	}

	struct npc_scholomance_scholomance_acolyteAI : public ScriptedAI
	{
		npc_scholomance_scholomance_acolyteAI(Creature* creature) : ScriptedAI(creature)
		{
		}

		void Reset()
		{
			events.Reset();
		}

		void EnterCombat(Unit* who)
		{
			events.ScheduleEvent(EVENT_SHADOW_BOLT, 100);
			events.ScheduleEvent(EVENT_UNBOUND, urand(5000, 15000));
			events.ScheduleEvent(EVENT_SHATTER_SOUL, urand(8000, 20000));
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
				case EVENT_SHADOW_BOLT:
					DoCastVictim(SPELL_SHADOW_BOLT);
					if (me->HasAura(SPELL_UNBOUND))
						events.ScheduleEvent(EVENT_SPIRIT_BARRAGE, 1500);
					else
						events.ScheduleEvent(EVENT_SHADOW_BOLT, 1500);
					break;
				case EVENT_SPIRIT_BARRAGE:
					DoCast(me, SPELL_SPIRIT_BARRAGE);
					events.ScheduleEvent(EVENT_SPIRIT_BARRAGE, 2000);
					break;
				case EVENT_SHATTER_SOUL:
					if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 0.0f, true))
						DoCast(target, SPELL_SHATTER_SOUL);
					events.ScheduleEvent(EVENT_SHATTER_SOUL, urand(20000, 30000));
					break;
				case EVENT_UNBOUND:
					DoCast(me, SPELL_UNBOUND);
					break;
				default:
					break;
				}
			}

			DoMeleeAttackIfReady();
		}

	private:
		EventMap events;
	};
};

class npc_scholomance_scholomance_neophyte : public CreatureScript
{
public:
	npc_scholomance_scholomance_neophyte() : CreatureScript("npc_scholomance_scholomance_neophyte") { }

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_scholomance_scholomance_neophyteAI(creature);
	}

	struct npc_scholomance_scholomance_neophyteAI : public ScriptedAI
	{
		npc_scholomance_scholomance_neophyteAI(Creature* creature) : ScriptedAI(creature)
		{
		}

		void Reset()
		{
			events.Reset();
		}

		void EnterCombat(Unit* who)
		{
			events.ScheduleEvent(EVENT_SHADOW_INCINERATION, 100);
			events.ScheduleEvent(EVENT_BOUND_SERVANT, urand(3000, 6000));
			events.ScheduleEvent(EVENT_REND_FLESH, urand(8000, 15000));
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
				case EVENT_SHADOW_INCINERATION:
					DoCastVictim(SPELL_SHADOW_INCINERATION);
					events.ScheduleEvent(EVENT_SHADOW_INCINERATION, 1500);
					break;
				case EVENT_BOUND_SERVANT:
					DoCast(me, SPELL_BOUND_SERVANT);
					break;
				case EVENT_NECROTIC_PACT:
					DoCast(me, SPELL_NECROTIC_PACT);
					break;
				case EVENT_REND_FLESH:
					if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 0.0f, true))
						DoCast(target, SPELL_REND_FLESH);
					events.ScheduleEvent(EVENT_REND_FLESH, urand(10000, 20000));
					break;
				default:
					break;
				}
			}

			DoMeleeAttackIfReady();
		}

	private:
		EventMap events;
	};
};

class npc_scholomance_candlestick_mage : public CreatureScript
{
public:
	npc_scholomance_candlestick_mage() : CreatureScript("npc_scholomance_candlestick_mage") { }

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_scholomance_candlestick_mageAI(creature);
	}

	struct npc_scholomance_candlestick_mageAI : public ScriptedAI
	{
		npc_scholomance_candlestick_mageAI(Creature* creature) : ScriptedAI(creature)
		{
		}

		void Reset()
		{
			events.Reset();
		}

		void EnterCombat(Unit* who)
		{
			events.ScheduleEvent(EVENT_FLICKERING_FLAME, urand(1000, 4000));
			events.ScheduleEvent(EVENT_SKIN_LIKE_WAX, urand(5000, 7000));
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
				case EVENT_FLICKERING_FLAME:
					DoCastVictim(SPELL_FLICKERING_FLAME);
					events.ScheduleEvent(EVENT_FLICKERING_FLAME, urand(1000, 4000));
					break;
				case EVENT_SKIN_LIKE_WAX:
					if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 0.0f, true, -SPELL_SKIN_LIKE_WAX))
						DoCast(target, SPELL_SKIN_LIKE_WAX);
					events.ScheduleEvent(EVENT_SKIN_LIKE_WAX, urand(8000, 10000));
					break;
				default:
					break;
				}
			}

			DoMeleeAttackIfReady();
		}

	private:
		EventMap events;
	};
};

class npc_scholomance_boneweaver : public CreatureScript
{
public:
	npc_scholomance_boneweaver() : CreatureScript("npc_scholomance_boneweaver") { }

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_scholomance_boneweaverAI(creature);
	}

	struct npc_scholomance_boneweaverAI : public ScriptedAI
	{
		npc_scholomance_boneweaverAI(Creature* creature) : ScriptedAI(creature)
		{
		}

		void Reset()
		{
			events.Reset();
			me->SetReactState(REACT_DEFENSIVE);
		}

		void EnterCombat(Unit* who)
		{
			events.ScheduleEvent(EVENT_BONE_SHARDS, urand(1000, 4000));
		}

		void JustDied(Unit* who)
		{
			if (InstanceScript* pInstance = me->GetInstanceScript())
				if (Creature* pRattlegore = sObjectAccessor->GetCreature(*me, pInstance->GetData64(DATA_RATTLEGORE)))
					pRattlegore->AI()->DoAction(1);
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
				case EVENT_BONE_SHARDS:
					DoCastVictim(SPELL_BONE_SHARDS);
					events.ScheduleEvent(EVENT_BONE_SHARDS, urand(6000, 10000));
					break;
				default:
					break;
				}
			}

			DoMeleeAttackIfReady();
		}

	private:
		EventMap events;
	};
};

class npc_scholomance_krastinovian_carver : public CreatureScript
{
public:
	npc_scholomance_krastinovian_carver() : CreatureScript("npc_scholomance_krastinovian_carver") { }

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_scholomance_krastinovian_carverAI(creature);
	}

	struct npc_scholomance_krastinovian_carverAI : public ScriptedAI
	{
		npc_scholomance_krastinovian_carverAI(Creature* creature) : ScriptedAI(creature)
		{
		}

		void Reset()
		{
			me->AddAura(SPELL_BOILING_BLOODTHRIST, me);
		}

		void JustDied(Unit* who)
		{
			if (InstanceScript* pInstance = me->GetInstanceScript())
			{
				if (Aura const* aur = me->GetAura(SPELL_BOILING_BLOODTHRIST))
					if (aur->GetStackAmount() >= 99)
						pInstance->DoUpdateAchievementCriteria(ACHIEVEMENT_CRITERIA_TYPE_BE_SPELL_TARGET2, SPELL_SANGUINARIAN, 0, 0, me);
			}

			DoCastAOE(SPELL_BOILING_BLOODTHRIST_AOE, true);
		}

		void UpdateAI(const uint32 diff)
		{
			if (!UpdateVictim())
				return;

			DoMeleeAttackIfReady();
		}
	};
};

class npc_scholomance_bored_student : public CreatureScript
{
public:
	npc_scholomance_bored_student() : CreatureScript("npc_scholomance_bored_student") { }

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_scholomance_bored_studentAI(creature);
	}

	struct npc_scholomance_bored_studentAI : public ScriptedAI
	{
		npc_scholomance_bored_studentAI(Creature* creature) : ScriptedAI(creature)
		{
		}

		void Reset()
		{
			events.Reset();
		}

		void EnterCombat(Unit* who)
		{
			events.ScheduleEvent(EVENT_SHADOW_BOLT, urand(3000, 10000));
			events.ScheduleEvent(EVENT_SHADOW_NOVA, urand(5000, 15000));
			events.ScheduleEvent(EVENT_FIRE_BREATH_POTION, urand(10000, 15000));
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
				case EVENT_SHADOW_BOLT:
					DoCastVictim(SPELL_SHADOW_BOLT_2);
					events.ScheduleEvent(EVENT_SHADOW_BOLT, urand(5000, 10000));
					break;
				case EVENT_FIRE_BREATH_POTION:
					DoCastVictim(SPELL_FIRE_BREATH_POTION);
					events.ScheduleEvent(EVENT_FIRE_BREATH_POTION, urand(10000, 15000));
					break;
				case EVENT_SHADOW_NOVA:
					if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 0, true))
						DoCast(target, SPELL_SHADOW_NOVA);
					events.ScheduleEvent(EVENT_SHADOW_NOVA, urand(10000, 15000));
					break;
				default:
					break;
				}
			}

			DoMeleeAttackIfReady();
		}

	private:
		EventMap events;
	};
};

class npc_scholomance_professor_slate : public CreatureScript
{
public:
	npc_scholomance_professor_slate() : CreatureScript("npc_scholomance_professor_slate") { }

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_scholomance_professor_slateAI(creature);
	}

	struct npc_scholomance_professor_slateAI : public ScriptedAI
	{
		npc_scholomance_professor_slateAI(Creature* creature) : ScriptedAI(creature)
		{
		}

		void Reset()
		{
			events.Reset();
		}

		void EnterCombat(Unit* who)
		{
			events.ScheduleEvent(EVENT_FIRE_BREATH_POTION, urand(3000, 6000));
			events.ScheduleEvent(EVENT_TOXIC_POTION, urand(6000, 8000));
			//events.ScheduleEvent(EVENT_POTION_OF_BRUTISH_FORCE, 10000);
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
				case EVENT_FIRE_BREATH_POTION:
					DoCastVictim(SPELL_FIRE_BREATH_POTION);
					break;
				case EVENT_TOXIC_POTION:
					if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 0.0f, true))
						DoCast(target, SPELL_TOXIC_POTION);
					break;
				case EVENT_POTION_OF_BRUTISH_FORCE:
					DoCast(me, SPELL_POTION_OF_BRUTISH_FORCE);

					events.CancelEvent(EVENT_FIRE_BREATH_POTION);
					events.CancelEvent(EVENT_TOXIC_POTION);
					events.ScheduleEvent(EVENT_REND, urand(3000, 4000));
					break;
				case EVENT_REND:
					DoCastVictim(SPELL_REND);
					events.ScheduleEvent(EVENT_REND, urand(10000, 12000));
					break;
				default:
					break;
				}
			}

			DoMeleeAttackIfReady();
		}

	private:
		EventMap events;
	};
};

enum KrastinovScriptTexts
{
	SAY_AGGRO = 0,
	SAY_DEATH = 1,
	SAY_INTRO = 2,
	SAY_SLAY = 3,
};

class npc_doctor_theolen_krastinov : public CreatureScript
{
public:
	npc_doctor_theolen_krastinov() : CreatureScript("npc_doctor_theolen_krastinov") { }

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_doctor_theolen_krastinovAI(creature);
	}

	struct npc_doctor_theolen_krastinovAI : public ScriptedAI
	{
		npc_doctor_theolen_krastinovAI(Creature* creature) : ScriptedAI(creature)
		{
			me->setActive(true);
		}

		void Reset()
		{
			events.Reset();
		}

		void IsSummonedBy(Unit* owner)
		{
			Talk(SAY_INTRO);
		}

		void EnterCombat(Unit* who)
		{
			Talk(SAY_AGGRO);

			events.ScheduleEvent(EVENT_BACKHAND, urand(3000, 7000));
			events.ScheduleEvent(EVENT_FRENZY, urand(5000, 10000));
			events.ScheduleEvent(EVENT_REND, urand(3000, 5000));
		}

		void KilledUnit(Unit* victim)
		{
			if (victim->IsPlayer())
			{
				Talk(SAY_SLAY);
			}
		}

		void JustDied(Unit* killer)
		{
			Talk(SAY_DEATH);

			events.Reset();
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
				case EVENT_BACKHAND:
					DoCastVictim(SPELL_BACKHAND);
					events.ScheduleEvent(EVENT_BACKHAND, urand(8000, 12000));
					break;
				case EVENT_FRENZY:
					DoCast(me, SPELL_FRENZY);
					break;
				case EVENT_REND:
					DoCastVictim(SPELL_REND_2);
					events.ScheduleEvent(EVENT_REND, urand(12000, 15000));
					break;
				default:
					break;
				}
			}

			DoMeleeAttackIfReady();
		}
	};
};


class spell_scholomance_boiling_bloodthrist_aoe : public SpellScriptLoader
{
public:
	spell_scholomance_boiling_bloodthrist_aoe() : SpellScriptLoader("spell_scholomance_boiling_bloodthrist_aoe") { }

	class spell_scholomance_boiling_bloodthrist_aoe_SpellScript : public SpellScript
	{
		PrepareSpellScript(spell_scholomance_boiling_bloodthrist_aoe_SpellScript);

		void HandleHit(SpellEffIndex effIndex)
		{
			if (!GetCaster() || !GetHitUnit())
				return;

			PreventHitDefaultEffect(effIndex);

			uint32 stacks = 0;
			if (Aura const* aur = GetCaster()->GetAura(SPELL_BOILING_BLOODTHRIST))
				stacks = aur->GetStackAmount();

			if (stacks > 0)
			{
				if (Aura* aur = GetHitUnit()->GetAura(SPELL_BOILING_BLOODTHRIST))
					aur->ModStackAmount(stacks);
			}
		}

		void Register()
		{
			OnEffectHitTarget += SpellEffectFn(spell_scholomance_boiling_bloodthrist_aoe_SpellScript::HandleHit, EFFECT_0, SPELL_EFFECT_FORCE_CAST);
		}
	};

	SpellScript* GetSpellScript() const
	{
		return new spell_scholomance_boiling_bloodthrist_aoe_SpellScript();
	}
};

/*enum ScholoSpells
{
	//Gandling Event Spells
	SPELL_GANDLING_CHANNEL    = 114201,
	SPELL_SKULL_GANDLING_DEAD = 126343,
	SPELL_HOVER_IDLE          = 127603, // maybe not the correct hover for Gandling
	SPELL_BONE_ARMOR_VISUAL   = 113996, // find the correct visual for Gandling
};

class mob_gandling_event : public CreatureScript
{
public:
	mob_gandling_event() : CreatureScript("mob_gandling_event") { }

	struct mob_gandling_eventAI : public ScriptedAI
	{
		mob_gandling_eventAI(Creature* creature) : ScriptedAI(creature) { }

		void Reset()
		{
			me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_NOT_SELECTABLE);
			me->SetReactState(REACT_DEFENSIVE);
		}

		void DoAction(int32 const action)
		{
		// Texts and Actions will be included soon
		}

	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new mob_gandling_eventAI (creature);
	}
};*/


void AddSC_scholomance()
{
	new npc_scholomance_risen_guard();
	new npc_scholomance_scholomance_acolyte();
	new npc_scholomance_scholomance_neophyte();
	new npc_scholomance_candlestick_mage();
	new npc_scholomance_boneweaver();
	new npc_scholomance_krastinovian_carver();
	new npc_scholomance_bored_student();
	new npc_scholomance_professor_slate();

	new npc_doctor_theolen_krastinov();             // 59369

	new spell_scholomance_boiling_bloodthrist_aoe();

	//new mob_gandling_event();
}