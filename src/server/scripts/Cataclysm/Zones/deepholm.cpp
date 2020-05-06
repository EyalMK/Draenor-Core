#include "ScriptPCH.h"

enum CreatureIds
{
    NPC_AEONAXX = 50062,
};

class boss_aeonaxx : public CreatureScript
{
public:
    boss_aeonaxx() : CreatureScript("boss_aeonaxx") { }

    CreatureAI* GetAI(Creature* pCreature) const
    {
        return new boss_aeonaxxAI(pCreature);
    }

    struct boss_aeonaxxAI : public ScriptedAI
    {
        boss_aeonaxxAI(Creature* pCreature) : ScriptedAI(pCreature)
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

        void UpdateAI(const uint32 /*diff*/)
        {
            if (!UpdateVictim())
                return;

            DoMeleeAttackIfReady();
        }
    };
};

enum Xariona
{
	SPELL_TWILIGHT_BREATH = 93544,
	SPELL_UNLEASHED_MAGIC = 93556,
	SPELL_TWILIGHT_FISSURE = 93546,
	SPELL_TWILIGHT_ZONE = 93553,
	SPELL_TWILIGHT_BUFFET = 93551,

	EVENT_TWILIGHT_BUFFET = 1,
	EVENT_TWILIGHT_FISSURE = 2,
	EVENT_TWILIGHT_ZONE = 3,
	EVENT_UNLEASHED_MAGIC = 4,

};

class npc_xariona : public CreatureScript
{
public:
	npc_xariona() : CreatureScript("npc_xariona") { }

	struct npc_xarionaAI : public ScriptedAI
	{
		npc_xarionaAI(Creature* creature) : ScriptedAI(creature) {}

		EventMap events;

		void Reset() override
		{
			events.Reset();
		}

		void EnterCombat(Unit* /*Ent*/) override
		{
			events.ScheduleEvent(EVENT_TWILIGHT_BUFFET, 20000);
			events.ScheduleEvent(EVENT_TWILIGHT_FISSURE, 23000);
			events.ScheduleEvent(EVENT_TWILIGHT_ZONE, 30000);
			events.ScheduleEvent(EVENT_UNLEASHED_MAGIC, 66000);
		}

		void UpdateAI(uint32 diff) override
		{

			if (!UpdateVictim())
				return;

			events.Update(diff);

			while (uint32 eventId = events.ExecuteEvent())
			{
				switch (eventId)
				{
				case EVENT_TWILIGHT_BUFFET:
					if (SelectTarget(SELECT_TARGET_RANDOM, 0))
						DoCast(SPELL_TWILIGHT_BUFFET);
					events.ScheduleEvent(EVENT_TWILIGHT_BUFFET, 20000);
					break;
				case EVENT_TWILIGHT_FISSURE:
					if (SelectTarget(SELECT_TARGET_RANDOM, 0))
						DoCast(SPELL_TWILIGHT_FISSURE);
					events.ScheduleEvent(EVENT_TWILIGHT_FISSURE, 23000);
					break;
				case EVENT_TWILIGHT_ZONE:
					if (SelectTarget(SELECT_TARGET_RANDOM, 0))
						DoCast(me, SPELL_TWILIGHT_ZONE);
					events.ScheduleEvent(EVENT_TWILIGHT_ZONE, 30000);
					break;
				case EVENT_UNLEASHED_MAGIC:
					if (SelectTarget(SELECT_TARGET_RANDOM, 0))
					{
						DoCast(SPELL_TWILIGHT_BREATH);
						DoCast(SPELL_UNLEASHED_MAGIC);
					}
					events.ScheduleEvent(EVENT_UNLEASHED_MAGIC, 66000);
					break;
				default:
					break;
				}
			}

			DoMeleeAttackIfReady();
		}
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_xarionaAI(creature);
	}
};


#include "ScriptMgr.h"
#include "ScriptedFollowerAI.h"

class npc_elemental_energy_quest : public CreatureScript
{
public:
	npc_elemental_energy_quest() : CreatureScript("npc_elemental_energy_quest") { }

	struct npc_elemental_energy_questAI : public ScriptedAI
	{
		npc_elemental_energy_questAI(Creature* creature) : ScriptedAI(creature) { }

		void JustDied(Unit* /*who*/) override
		{
			if (Creature * totem = GetClosestCreatureWithEntry(me, 45088, 25.0f))
			{
				//if(Player * plr = totem->GetCharmerOrOwnerPlayerOrPlayerItself())
				totem->CastSpell(totem, 84170, true);
			}
		}
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_elemental_energy_questAI(creature);
	}
};

class npc_imposing_confrontation_quest : public CreatureScript
{
public:
	npc_imposing_confrontation_quest() : CreatureScript("npc_imposing_confrontation_quest") { }

	struct npc_imposing_confrontation_questAI : public ScriptedAI
	{
		npc_imposing_confrontation_questAI(Creature* creature) : ScriptedAI(creature) { Reset(); }

		bool eventStarted;
		uint8 phase;
		int32 phaseTimer;
		ObjectGuid initiator;

		void Reset() override
		{
			eventStarted = false;
			phase = 0;
			phaseTimer = 0;
			initiator = ObjectGuid::Empty;
		}

		void SpellHit(Unit* caster, const SpellInfo* spell) override
		{
			if (spell->Id == 79715)
			{
				caster->Say("Boden the Imposing. I come on behalf of the Earthen Ring. We wish your kind no harm. We seek to repair the rift between our worlds. Why do you attack us?", LANG_UNIVERSAL);
				eventStarted = true;
				phaseTimer = 7000;
				initiator = caster->GetGUID();
				me->GetMotionMaster()->MoveIdle();
				me->SetFacingToObject(caster);
			}
		}

		void UpdateAI(uint32 diff) override
		{
			if (eventStarted)
			{
				if ((phaseTimer -= diff) <= 0)
					switch (phase++)
					{
					case 0:
						me->Yell("Hah! Did you mistake me for Diamant ? Or perhaps some other whimpering, compliant, stone trogg who cares?", LANG_UNIVERSAL);
						phaseTimer = 9000;
						break;
					case 1:
						me->Yell("If you seek peace, relinquish the World Pillar and leave Deepholm. This is our realm. Your only welcome here shall be found underneath my stone foot.", LANG_UNIVERSAL);
						phaseTimer = 13000;
						break;
					case 2:
						if (Player * player = ObjectAccessor::GetPlayer(*me, initiator))
						{
							me->CastSpell(player, 79843, true);
							me->GetMotionMaster()->InitDefault();
						}
						Reset();
						break;
					}
			}
		}
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_imposing_confrontation_questAI(creature);
	}
};



/// Lodestone Elemental - 43258
class npc_lodestone_elemental : public CreatureScript
{
public:
	npc_lodestone() : CreatureScript("npc_lodestone") { }

	enum eData
	{
		// Spells
		DEPLETED_TOTEM_KILLCREDIT = 45091,
		SPELL_ENERGY_CAPTURE	  = 84163,

		// NPCs
		NPC_DEPLETED_TOTEM = 45088,

		// Quest
		QUEST_ELEMENTAL_ENERGY = 27136,
	};

	struct npc_lodestoneAI : public ScriptedAI
	{
		npc_lodestoneAI(Creature* creature) : ScriptedAI(creature) { }

		void JustDied(Unit* killer) override
		{
			if (Player* player = killer->ToPlayer())
			{
				if (player->GetQuestStatus(QUEST_ELEMENTAL_ENERGY) == QUEST_STATUS_INCOMPLETE)
				{
					if (Creature* totem = me->FindNearestCreature(NPC_DEPLETED_TOTEM, 20.0f, true))
					{
						totem->CastSpell(totem, SPELL_ENERGY_CAPTURE, true);
						player->KilledMonsterCredit(DEPLETED_TOTEM_KILLCREDIT);
					}
				}
			}
		}
	};

	CreatureAI* GetAI(Creature *creature) const
	{
		return new npc_lodestoneAI(creature);
	}
};

/// Slain Crewmember - 42747 & 42757
class npc_slaincrewmember : public CreatureScript
{
public:
	npc_slaincrewmember() : CreatureScript("npc_slaincrewmember") { }
	// Todo - Move to creature texts.
	#define CREW_SAY_1 "They poisoned our supplies... we had cultists onboard all along..."
	#define CREW_SAY_2 "Everyone started dropping like flies... everyone who ate the rations."
	#define CREW_SAY_3 "They tricked us into ambushing the Horde gunship... but why?"
	#define CREW_SAY_4 "I heard them praying to their dark gods as everything went black... the Twilight's Hammer did this!"
	#define CREW_SAY_5 "Twilight scum! You did this to us!"

	struct npc_slaincrewmemberAI : public ScriptedAI
	{
		npc_slaincrewmemberAI(Creature* creature) : ScriptedAI(creature) { }

		ObjectGuid playerGUID;
		bool QuestInProgress;
		uint32 sayTimer;

		void Reset() override
		{
			playerGUID = ObjectGuid::Empty;
			QuestInProgress = false;
			sayTimer = 3000;
		}

		void SetGuidData(uint32 Id, ObjectGuid Value) override
		{
			switch (Id)
			{
				case 1: // Set the GUID of the player
				{
					playerGUID = Value;
					QuestInProgress = true;
					break;
				}
			}
		}
		void UpdateAI(uint32 diff) override
		{
			if (!QuestInProgress)
				return;

			Player* player = ObjectAccessor::GetPlayer(*me, playerGUID);

			if (!player)
				return;

			if (sayTimer <= diff)
			{
				switch (RAND(0, 1, 2, 3, 4))
				{
					case 0:
						me->Say(CREW_SAY_1, LANG_UNIVERSAL);
						player->KilledMonsterCredit(42758);
						QuestInProgress = false;
						break;
					case 1:
						me->Say(CREW_SAY_2, LANG_UNIVERSAL);
						player->KilledMonsterCredit(42758);
						QuestInProgress = false;
						break;
					case 2:
						me->Say(CREW_SAY_3, LANG_UNIVERSAL);
						player->KilledMonsterCredit(42758);
						QuestInProgress = false;
						break;
					case 3:
						me->Say(CREW_SAY_4, LANG_UNIVERSAL);
						player->KilledMonsterCredit(42758);
						QuestInProgress = false;
						break;
					case 4:
						me->Say(CREW_SAY_5, LANG_UNIVERSAL);
						me->setFaction(14);
						me->AddThreat(player, 53.0f);
						me->AI()->AttackStart(player);
						QuestInProgress = false;
						break;
				}
			}
			else sayTimer -= diff;
		}
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_slaincrewmemberAI(creature);
	}
};



/// Boden the Imposing - 42741 => Quest Imposing Confronation - 26315
class npc_boden_the_imposing : public CreatureScript
{
public:
	npc_boden_the_imposing() : CreatureScript("npc_boden_the_imposing") { }

	enum eFlint
	{
		QUEST_TAKE_HIM_TO_THE_EARTHCALLER = 26413,
		NPC_YEVAA = 42573,
	};

	enum eBoden
	{
		QUEST_IMPOSING_CONFRONTATION = 26315,
		SPELL_EARTHEN_RING_PROCLAMATION = 79715,
		SPELL_IMPOSING_CONFRONTATION_CREDIT = 79843,
	};

	struct npc_boden_the_imposingAI : public ScriptedAI
	{
		npc_boden_the_imposingAI(Creature* creature) : ScriptedAI(creature), DialogNumber(0), SpeakPlayer(NULL) {}

		uint16 DialogNumber;
		uint64 uiProcessDialog;
		Unit* SpeakPlayer;

		void SpellHit(Unit* Caster, const SpellInfo* Spell) override
		{
			if (Spell->Id != SPELL_EARTHEN_RING_PROCLAMATION || Caster->ToPlayer()->GetQuestStatus(QUEST_TAKE_HIM_TO_THE_EARTHCALLER) == QUEST_STATUS_INCOMPLETE)
				return;

			Caster->ToPlayer()->Say("Boden the Imposing. I come on behalf of the Earthen Ring. We wish your kind no harm. We seek to repair the rift between our worlds. Why do you attack us?", LANG_UNIVERSAL);

			DialogNumber = 1;
			uiProcessDialog = 2000;

			SpeakPlayer = Caster;
		}

		void UpdateAI(uint32 diff) override
		{
			if (DialogNumber == 0)
				return;

			if (uiProcessDialog <= diff)
			{
				switch (DialogNumber)
				{

				case 1:
					me->Yell("Hah! Did you mistake me for Diamant, $r? Or perhaps some other whimpering, complaint stone trogg who cares?", LANG_UNIVERSAL, 0);
					uiProcessDialog = 4000;
					break;

				case 2:
					me->Yell("If you seek peace, relinquish the World Pillar and leave Deepholm. This is our realm. Your only welcome here shall be found underneath my stone foot.", LANG_UNIVERSAL, 0);
					uiProcessDialog = 1200;
					break;

				case 3:
					if (SpeakPlayer)
						me->CastSpell(SpeakPlayer, SPELL_IMPOSING_CONFRONTATION_CREDIT, true);
					break;
				}

				if (DialogNumber != 3)
				{
					DialogNumber++;
				}
				else
					DialogNumber = 0;

			}
			else uiProcessDialog -= diff;
		}
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_boden_the_imposingAI(creature);
	}

};


/// Ricket Ticker - 49823 => Quest Underground Economy - 27048
class npc_ricket_ticker : public CreatureScript
{
public:
	npc_ricket_ticker() : CreatureScript("npc_ricket_ticker") { }

	enum eRicketTicker
	{
		SPELL_EXPLODE = 91981,

		NPC_DEEP_CELESTITE_BUNNY = 49865,
		NPC_DEEP_AMETHYST_BUNNY = 49866,
		NPC_DEEP_GRANAT_BUNNY = 49867,
		NPC_DEEP_ALABASTER_BUNNY = 49824,

		ITEM_DEEP_CELESTITE_CRYSTAL = 65507,
		ITEM_DEEP_AMETHYST_CRYSTAL = 65508,
		ITEM_DEEP_GRANAT_CRYSTAL = 65510,
		ITEM_DEEP_ALABASTER_CRYSTAL = 65504,
	};

	struct npc_ricket_tickerAI : public ScriptedAI
	{
		npc_ricket_tickerAI(Creature* creature) : ScriptedAI(creature), uiExplode(0) { }

		uint32 uiExplode;
		Player* player;

		void Reset() override
		{
			uiExplode = 0;
		}

		void IsSummonedBy(Unit* summoner) override
		{
			uiExplode = 3500;
			player = summoner->ToPlayer();
		}

		void UpdateAI(uint32 diff) override
		{
			if (uiExplode == 0)
				return;

			if (uiExplode <= diff)
			{
				DoCastAOE(SPELL_EXPLODE, true);

				// Checks weather a Deep Crystal is in Range
				if (me->FindNearestCreature(NPC_DEEP_CELESTITE_BUNNY, 7.0f, true))
					player->AddItem(ITEM_DEEP_CELESTITE_CRYSTAL, 1);

				if (me->FindNearestCreature(NPC_DEEP_AMETHYST_BUNNY, 7.0f, true))
					player->AddItem(ITEM_DEEP_AMETHYST_CRYSTAL, 1);

				if (me->FindNearestCreature(NPC_DEEP_GRANAT_BUNNY, 7.0f, true))
					player->AddItem(ITEM_DEEP_GRANAT_CRYSTAL, 1);

				if (me->FindNearestCreature(NPC_DEEP_ALABASTER_BUNNY, 7.0f, true))
					player->AddItem(ITEM_DEEP_ALABASTER_CRYSTAL, 1);

				me->DespawnOrUnsummon();

			}
			else uiExplode -= diff;
		}
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_ricket_tickerAI(creature);
	}

};



/// Stonefather's Banner - 43163
class npc_stonefathers_banner : public CreatureScript
{
public:
	npc_stonefathers_banner() : CreatureScript("npc_stonefathers_banner") { }

	enum eBanner
	{
		NPC_STONEHEART_DEFENDER = 43138,
		SPELL_BUFF_OF_THE_STONEFATHER = 80668,
	};

	struct npc_stonefathers_bannerAI : public ScriptedAI
	{
		npc_stonefathers_bannerAI(Creature* creature) : ScriptedAI(creature) {}

		void Reset() override
		{
			me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_REMOVE_CLIENT_CONTROL | UNIT_FLAG_NOT_SELECTABLE);
		}

		void IsSummonedBy(Unit* summoner) override
		{
			std::list<Creature*> creatures;
			GetCreatureListWithEntryInGrid(creatures, me, NPC_STONEHEART_DEFENDER, 10.0f); // Blizzlike range

			if (creatures.empty())
				return;

			for (std::list<Creature*>::iterator iter = creatures.begin(); iter != creatures.end(); ++iter)
				if (!(*iter)->HasAura(SPELL_BUFF_OF_THE_STONEFATHER))
				{
					(*iter)->CastSpell((*iter), SPELL_BUFF_OF_THE_STONEFATHER, true);
					summoner->ToPlayer()->KilledMonsterCredit(NPC_STONEHEART_DEFENDER);
				}
		}
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_stonefathers_bannerAI(creature);
	}
};



enum Haethen
{
	SPELL_EARTHBOLT = 83799,
	SPELL_AIRBOLT = 83791,
	SPELL_SLOW = 18266,
	SPELL_FIREBOLT = 83794,
	SPELL_WATERBOLT = 83795,

	EVENT_EARTHBOLT = 1,
	EVENT_AIRBOLT = 2,
	EVENT_SLOW = 3,
	EVENT_FIREBOLT = 4,
	EVENT_WATERBOLT = 5,

	SAY_AGGRO = 1, // You will be destroyed!
	SAY_INTRO = 0, /// Not sure what this is - according to Wow gamepedia it might be a long text he says as a part of some quest.
	SAY_AIR = 3, // What?! You're immune to my air magic?
	SAY_FIRE = 2, // My firebolt is useless! No matter you smug little insect. I will still destroy you!
	SAY_WATER = 4, // You're immune to my water spell! How can this be?

};

/// Haethen Kaul - 44835
class npc_haethen_kaul : public CreatureScript
{
	enum
	{
		DELAY_SAY_HAETHEN_KAUL = 20000
	};

public:
	npc_haethen_kaul() : CreatureScript("npc_haethen_kaul") { }

	struct npc_haethen_kaulAI : public ScriptedAI
	{
		npc_haethen_kaulAI(Creature* creature) : ScriptedAI(creature) {}

		EventMap events;
		uint32 tSay; // Time left for say
		uint32 cSay; // Current Say

		void Reset() override
		{
			events.Reset();
			tSay = DELAY_SAY_HAETHEN_KAUL; // Reset timer
			cSay = 1;                      // Start from 1
		}

		void EnterCombat(Unit* /*Ent*/) override
		{
			Talk(SAY_AGGRO);
			DoCast(SPELL_EARTHBOLT);

			events.ScheduleEvent(EVENT_EARTHBOLT, urand(5000, 10000));
			events.ScheduleEvent(EVENT_AIRBOLT, urand(10000, 11000));
			events.ScheduleEvent(EVENT_SLOW, urand(10000, 11000));
			events.ScheduleEvent(EVENT_FIREBOLT, urand(10000, 11000));
			events.ScheduleEvent(EVENT_WATERBOLT, 1000);
		}

		void UpdateAI(uint32 diff) override
		{

			// No target (OoC)
			if (!me->GetVictim())
			{
				//Timed say
				if (tSay <= diff)
				{
					switch (cSay)
					{
						case 1:
							Talk(SAY_INTRO);
							cSay++;
							break;
						case 2:
							Talk(SAY_INTRO);
							cSay = 1; // Reset to
							break;
					}

					tSay = DELAY_SAY_HAETHEN_KAUL; // Reset the timer
				}
				else
				{
					tSay -= diff;
				}
				return;
			}

			if (!UpdateVictim())
				return;

			if (me->HasUnitState(UNIT_STATE_CASTING))
				return;

			events.Update(diff);

			while (uint32 eventId = events.ExecuteEvent())
			{
				switch (eventId)
				{
				case EVENT_EARTHBOLT:
					if (SelectTarget(SELECT_TARGET_RANDOM, 0))
						DoCast(SPELL_EARTHBOLT);
					events.ScheduleEvent(EVENT_EARTHBOLT, 1500);
					break;

				case EVENT_AIRBOLT:
					if (SelectTarget(SELECT_TARGET_RANDOM, 0))
						DoCast(SPELL_AIRBOLT);
					Talk(SAY_AIR);
					events.ScheduleEvent(EVENT_AIRBOLT, 11000);
					break;

				case EVENT_SLOW:
					DoCast(SPELL_SLOW);
					events.ScheduleEvent(EVENT_SLOW, urand(111000, 113000));
					break;

				case EVENT_FIREBOLT:
					if (SelectTarget(SELECT_TARGET_RANDOM, 0))
						DoCast(SPELL_FIREBOLT);
					Talk(SAY_FIRE);
					events.ScheduleEvent(EVENT_FIREBOLT, 11000);
					break;

				case EVENT_WATERBOLT:
					if (SelectTarget(SELECT_TARGET_RANDOM, 0))
						DoCast(SPELL_WATERBOLT);
					Talk(SAY_WATER);
					events.ScheduleEvent(EVENT_WATERBOLT, 11000);
					break;

				default:
					break;
				}
			}

			DoMeleeAttackIfReady();
		}
	};
	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_haethen_kaulAI(creature);
	}
};

/// Spell: Kill All Constructs - 65109
class spell_deepholm_kill_all_constructs : public SpellScriptLoader
{
public:
	spell_deepholm_kill_all_constructs() : SpellScriptLoader("spell_deepholm_kill_all_constructs") { }


	class spell_deepholm_kill_all_constructs_SpellScript : public SpellScript
	{
		PrepareSpellScript(spell_deepholm_kill_all_constructs_SpellScript)

			void HandleDummy()
		{
			if (!GetCaster())
				return;

			if (Player* player = GetCaster()->ToPlayer())
			{
				if (player->GetQuestStatus(26762) == QUEST_STATUS_INCOMPLETE) // Reactivate the Constructs Quest
					player->KilledMonsterCredit(43984, 0);
			}
		}

		void Register()
		{
			AfterCast += SpellCastFn(spell_deepholm_kill_all_constructs_SpellScript::HandleDummy);
		}
	};

	SpellScript* GetSpellScript() const
	{
		return new spell_deepholm_kill_all_constructs_SpellScript();
	}
};


/// Twilight Gate Credit and Elemental Gate Credit - 44930 & 44931
class spell_gate_block_the_gates : public SpellScriptLoader
{
public:
	spell_gate_block_the_gates() : SpellScriptLoader("spell_gate_block_the_gates") { }

	enum eData
	{
		// Quest
		QUEST_BLOCK_THE_GATES = 26861,

		// Kill credits
		TWILIGHT_GATE_CREDIT  = 44930,
		ELEMENTAL_GATE_CREDIT = 44931,
	};

	class spell_gate_block_the_gates_SpellScript : public SpellScript
	{
		PrepareSpellScript(spell_gate_block_the_gates_SpellScript);

		void HandleDummy(SpellEffIndex /*effIndex*/) override
		{
			if (Creature* unitTarget = GetHitCreature())
			{
				if (Player* player = GetCaster()->ToPlayer())
				{
					if (player->GetQuestStatus(QUEST_BLOCK_THE_GATES) == QUEST_STATUS_INCOMPLETE)
					{
						switch (unitTarget->GetEntry())
						{
							case TWILIGHT_GATE_CREDIT:
								player->KilledMonsterCredit(TWILIGHT_GATE_CREDIT);
								break;
							case ELEMENTAL_GATE_CREDIT:
								player->KilledMonsterCredit(ELEMENTAL_GATE_CREDIT);
								break;
							default:
								break;
						}
					}
				}
			}
		}

		void Register() override
		{
			OnEffectHitTarget += SpellEffectFn(spell_gate_block_the_gates_SpellScript::HandleDummy, EFFECT_0, SPELL_EFFECT_DUMMY);
		}
	};

	SpellScript* GetSpellScript() const override
	{
		return new spell_gate_block_the_gates_SpellScript();
	}
};

/// Not sure on which ID to apply this - check in DB.
class AreaTrigger_at_deepholm_flyover : public AreaTriggerScript
{
public:
	AreaTrigger_at_deepholm_flyover() : AreaTriggerScript("at_deepholm_flyover") {}

	enum eData
	{
		QUEST_FLY_OVER_A = 27006,
		QUEST_FLY_OVER_H = 27008,
		NPC_GENERIC_TRIGGER = 44839,
	};

	bool OnTrigger(Player* player, AreaTriggerEntry const* /*trigger*/, bool /*entered*/) override
	{
		if (player->GetQuestStatus(QUEST_FLY_OVER_A) == QUEST_STATUS_INCOMPLETE)
		{
			if (Creature* trigger = player->FindNearestCreature(NPC_GENERIC_TRIGGER, 25.0f))
				player->KilledMonsterCredit(NPC_GENERIC_TRIGGER, trigger->GetGUID());
		}
		return true;

		if (player->GetQuestStatus(QUEST_FLY_OVER_H) == QUEST_STATUS_INCOMPLETE)
		{
			if (Creature* trigger = player->FindNearestCreature(NPC_GENERIC_TRIGGER, 25.0f))
				player->KilledMonsterCredit(NPC_GENERIC_TRIGGER, trigger->GetGUID());
		}
		return true;
	}
};


#ifndef __clang_analyzer__
void AddSC_deepholm()
{
	// Rares and bosses
    new boss_aeonaxx();
	new npc_xariona();
	

	// Mobs
	new npc_elemental_energy_quest();
	new npc_imposing_confrontation_quest();
	new npc_lodestone_elemental();
	new npc_slaincrewmember();
	new npc_boden_the_imposing();
	new npc_ricket_ticker();
	new npc_stonefathers_banner();
	new npc_haethen_kaul();

	// Spells
    new spell_deepholm_kill_all_constructs();
	new spell_gate_block_the_gates();
	new AreaTrigger_at_deepholm_flyover();
}
#endif
