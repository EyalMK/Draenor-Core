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

/// ***********************	[Quest] - Embalmer's Revenge - 26727 *********************** ///
/// Blaze - 43918 (Fires at Darkshire during Embalmer's Revenge)
class npc_blaze_darkshire : public CreatureScript
{
public:
	npc_blaze_darkshire() : CreatureScript("npc_blaze_darkshire") { }

	enum eMisc
	{
		SPELL_BLAZE_PERIODIC_TRIGGER = 82182
	};

	struct npc_blaze_darkshireAI : public ScriptedAI
	{
		npc_blaze_darkshireAI(Creature* creature) : ScriptedAI(creature) {}

		void Reset()
		{
			me->CastSpell(me, SPELL_BLAZE_PERIODIC_TRIGGER, true);
		}
	};

	CreatureAI* GetAI(Creature* pCreature) const
	{
		return new npc_blaze_darkshireAI(pCreature);
	}
};

/// Lord Ello Ebenlocke - 263
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

		uint64 PlayerGUID;
		uint32 SummonTimer;

		bool bSummoned;

		void Reset() override
		{
			bSummoned = false;
			SummonTimer = 2000;
		}

		void SetGUID(uint64 guid, int32 /*id*/)
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
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_ebenlockeAI(creature);
	}
};

enum eStitches
{
	/// Quest
	QUEST_EMBALMERS_REVENGE = 26727,

	/// Npcs
	NPC_NIGHT_WATCH_GUARD = 43903,

	/// Spells
	SPELL_AURA_OF_ROT = 3106,
};

/// Stitches - 43862
class npc_stitches : public CreatureScript
{
public:
	npc_stitches() : CreatureScript("npc_stitches") { }

	CreatureAI* GetAI(Creature* pCreature) const
	{
		return new npc_stitchesAI(pCreature);
	}

	struct npc_stitchesAI : public ScriptedAI
	{
		npc_stitchesAI(Creature *c) : ScriptedAI(c) {}

		uint32 Timer;

		void Reset()
		{
			me->SetRespawnTime(10000);
			Timer = 5000;
		}
		void DamageTaken(Unit * pWho, uint32 &uiDamage, SpellInfo const*  /*p_SpellInfo*/) override
		{
			if (pWho->GetTypeId() == TYPEID_PLAYER)
			{
				me->getThreatManager().resetAllAggro();
				pWho->AddThreat(me, 100000.0f);
				me->AddThreat(pWho, 100000.0f);
				me->AI()->AttackStart(pWho);
			}
			else if (pWho->isPet() || pWho->isGuardian())
			{
				me->getThreatManager().resetAllAggro();
				me->AddThreat(pWho, 100000.0f);
				me->AI()->AttackStart(pWho);
			}
			else uiDamage = 0;
		}
		void DamageDealt(Unit* target, uint32& damage, DamageEffectType damageType) override
		{
			if (target->GetEntry() == NPC_NIGHT_WATCH_GUARD)
				damage = 0;
		}
		void JustDied(Unit* /*pKiller*/) override
		{
			me->DespawnOrUnsummon(4000);
			me->SetRespawnTime(10);
		}
		void UpdateAI(const uint32 diff)
		{
			if (me->isAlive() && !me->isInCombat())
				if (Creature* enemy = me->FindNearestCreature(NPC_NIGHT_WATCH_GUARD, 16.0f, true))
					me->AI()->AttackStart(enemy);

			if (!UpdateVictim())
				return;

			DoMeleeAttackIfReady();

			if (me->HasReactState(REACT_AGGRESSIVE) && Timer <= diff)
			{
				DoCastVictim(SPELL_AURA_OF_ROT, false);
				Timer = 5000;
			}
			else Timer -= diff;

		}
	};
};

enum eGuard
{
	/// Npcs
	NPC_STITCHES = 43862,
};

/// Night Watch Guard - 43903
class npc_nightwatch_guard : public CreatureScript
{
public:
	npc_nightwatch_guard() : CreatureScript("npc_nightwatch_guard") { }

	CreatureAI* GetAI(Creature* pCreature) const
	{
		return new npc_nightwatch_guardAI(pCreature);
	}

	struct npc_nightwatch_guardAI : public ScriptedAI
	{
		npc_nightwatch_guardAI(Creature *c) : ScriptedAI(c) {}

		void Reset() { }

		void DamageTaken(Unit * pWho, uint32 &uiDamage, SpellInfo const*  /*p_SpellInfo*/) override
		{
			if (pWho->GetTypeId() == TYPEID_PLAYER)
			{
				me->getThreatManager().resetAllAggro();
				pWho->AddThreat(me, 100000.0f);
				me->AddThreat(pWho, 100000.0f);
				me->AI()->AttackStart(pWho);
			}
			else if (pWho->isPet())
			{
				me->getThreatManager().resetAllAggro();
				me->AddThreat(pWho, 100000.0f);
				me->AI()->AttackStart(pWho);
			}
			else uiDamage = 0;
		}
		void DamageDealt(Unit* target, uint32& damage, DamageEffectType damageType) override
		{
			if (target->GetEntry() == NPC_STITCHES)
				damage = 0;
		}
		void JustDied(Unit* /*pKiller*/) override
		{
			me->SetRespawnTime(10000);
		}
		void UpdateAI(const uint32 diff)
		{
			if (me->isAlive() && !me->isInCombat())
				if (Creature* stitches = me->FindNearestCreature(NPC_STITCHES, 16.0f, true))
					me->AI()->AttackStart(stitches);

			if (!UpdateVictim())
				return;

			DoMeleeAttackIfReady();
		}
	};
};



/// ***********************	[Quest] - The Yorgen Worgen - 26717 *********************** ///
enum YorgenWorgen
{
	/// Quest
	QUEST_YORGEN_WORGEN = 26717,

	/// Npc
	NPC_LURKING_WORGEN = 43799,

	/// Spells
	SPELL_STUNNING_POUNCE_A = 81957
};

/// Lurking Worgen - 43799
class npc_lurking_worgen : public CreatureScript
{
public:
	npc_lurking_worgen() : CreatureScript("npc_lurking_worgen") { }

	CreatureAI* GetAI(Creature* pCreature) const
	{
		return new npc_lurking_worgenAI(pCreature);
	}

	struct npc_lurking_worgenAI : public ScriptedAI
	{
		npc_lurking_worgenAI(Creature *c) : ScriptedAI(c) {
			m_PlayerGUID = 0;
		}

		uint8 Phase;
		uint32 StunningPounceTimer;
		uint64 m_PlayerGUID;

		void Reset() override
		{
			ClearDelayedOperations();
			Phase = 0;
			StunningPounceTimer = 0;
		}

		void IsSummonedBy(Unit* summoner) override
		{
			if (summoner->ToPlayer())
				m_PlayerGUID = summoner->ToPlayer()->GetGUID();
		}

		void DoAction(int32 const p_Action) override
		{
			switch (p_Action)
			{
				case 0:
					if (m_PlayerGUID)
					{
						if (Player* l_Player = me->GetPlayer(*me, m_PlayerGUID))
						{
							Position l_Pos;
							l_Player->GetPosition(&l_Pos);
							me->GetMotionMaster()->MoveJump(l_Pos, 3.0f, 3.0f);

							AddTimedDelayedOperation(0.5 * TimeConstants::IN_MILLISECONDS, [this]() -> void
							{
								me->GetAI()->DoAction(1);
							});
						}
					}
					break;
				case 1:
					if (Player* l_Player = me->GetPlayer(*me, m_PlayerGUID))
					{
						me->CastSpell(l_Player, SPELL_STUNNING_POUNCE_A, true);
						me->GetMotionMaster()->MoveCharge(-11124.71f, -499.84f, 34.95f, 8.0f);
						me->DespawnOrUnsummon(5000);
					}
					break;
			}
		}
			 
		void UpdateAI(uint32 uiDiff) override
		{
			UpdateOperations(uiDiff);
		}
	};
};


/// ***********************	[Quest] - A Curse We Cannot Lift - 26720 *********************** ///
enum PotWorgen
{
	/// Quest
	QUEST_A_CURSE_WE_CANNOT_LIFT = 26720,

	/// Spells
	SPELL_LURKING_WORGEN_KILL_CREDIT = 43860,
	SPELL_STUNNING_POUNCE = 81957,
	SPELL_HARRIS_AMPULE = 82058 // Used by item ID: 60206
};

/// Lurking Worgen - 43814
class npc_lurking_worgen_curse : public CreatureScript
{
public:
	npc_lurking_worgen_curse() : CreatureScript("npc_lurking_worgen_curse") { }

	CreatureAI* GetAI(Creature* pCreature) const
	{
		return new npc_lurking_worgen_curseAI(pCreature);
	}

	struct npc_lurking_worgen_curseAI : public ScriptedAI
	{
		npc_lurking_worgen_curseAI(Creature* creature) : ScriptedAI(creature) {}

		bool bCast;
		bool bSay;

		void Reset()
		{
			bSay = false;
			bCast = false;
			me->SetRespawnTime(10000);
			me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_MOVE);
			me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PACIFIED);
			me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
		}

		void SpellHit(Unit* caster, const SpellInfo* pSpell) override
		{
			if (pSpell->Id == SPELL_HARRIS_AMPULE && HealthBelowPct(25.0f) && caster->ToPlayer()->GetQuestStatus(QUEST_A_CURSE_WE_CANNOT_LIFT) == QUEST_STATUS_INCOMPLETE)
			{
				if (!bSay)
				{
					caster->ToPlayer()->KilledMonsterCredit(SPELL_LURKING_WORGEN_KILL_CREDIT);
					caster->CombatStop();

					me->MonsterTextEmote("The worgen stares and hesitates!", 0, true);
					me->SetReactState(REACT_PASSIVE);
					me->AttackStop();
					me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_MOVE);
					me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PACIFIED);
					me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);

					me->DespawnOrUnsummon(5000);

					bSay = true;
				}
			}
		}


		void MoveInLineOfSight(Unit* who) override
		{
			if (!who || !who->isAlive())
				return;

			if (who->ToPlayer() && me->IsWithinDistInMap(who, 10.0f))
			{
				Player* player = who->ToPlayer();
				if (player->GetQuestStatus(QUEST_A_CURSE_WE_CANNOT_LIFT) == QUEST_STATUS_INCOMPLETE)
				{
					if (!bCast)
					{
						// Player's position
						Position JumpPos;
						player->GetPosition(&JumpPos);

						me->GetMotionMaster()->MoveJump(JumpPos, 3.0f, 3.0f);
						me->CastSpell(player, SPELL_STUNNING_POUNCE, true);

						me->Attack(player, true);
						bCast = true;
					}
				}
			}
		}
	};
};


/// ***********************	[Quest] - Cry For The Moon - 26760 *********************** ///
enum eCryMoon
{
	/// Quest
	QUEST_CRY_FOR_THE_MOON = 26760,

	/// Npcs
	NPC_OLIVER_HARRIS = 43858, //This is the summend one
	NPC_JITTERS = 43859,
	NPC_LUR_WORGEN = 43950,

	/// Spells
	SPELL_INVISIBILITY_7 = 82288,
	SPELL_INVISIBILITY_8 = 82289,
	SPELL_KILL_CREDIT = 82286, // Regain Quest Invis Detection and give Kill Credit (43969)

	SPELL_CHOKING_JITTERS = 82262, // Not used
	SPELL_CHOKED_BY_SVEN = 82266, // Not used
	SPELL_EJECT_PASSENGERS = 65785, // Not used
	SPELL_SUMMON_OLIVER_HARRIS = 82055 // Not Used
};

/// Oliver Harris - 43730
class npc_oliver_harris : public CreatureScript
{
public:
	npc_oliver_harris() : CreatureScript("npc_oliver_harris") { }

	CreatureAI* GetAI(Creature* pCreature) const
	{
		return new npc_oliver_harrisAI(pCreature);
	}

	bool OnQuestAccept(Player* pPlayer, Creature* pCreature, Quest const *pQuest)
	{
		if (pQuest->GetQuestId() == QUEST_CRY_FOR_THE_MOON)
		{
			pPlayer->RemoveAurasDueToSpell(SPELL_INVISIBILITY_7);
			pPlayer->RemoveAurasDueToSpell(SPELL_INVISIBILITY_8);
			CAST_AI(npc_oliver_harris::npc_oliver_harrisAI, pCreature->AI())->PlayerGUID = pPlayer->GetGUID();

			if (!pPlayer->FindNearestCreature(NPC_OLIVER_HARRIS, 20.0f, true))
			{
				pPlayer->SummonCreature(NPC_JITTERS, -10748.52f, 333.62f, 37.46f, 5.37f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 90000);
				pPlayer->SummonCreature(NPC_OLIVER_HARRIS, -10752.87f, 338.19f, 37.294f, 5.48f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 90000); //This is the summoned Oliver Harris
				pPlayer->SummonCreature(NPC_LUR_WORGEN, -10747.40f, 332.28f, 37.74f, 4.48f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 90000);
			}
		}
		return true;
	}

	struct npc_oliver_harrisAI : public ScriptedAI
	{
		npc_oliver_harrisAI(Creature* creature) : ScriptedAI(creature) {}

		uint8 Phase;
		uint32 TalkEventTimer;
		uint64 PlayerGUID;
		uint64 Harris;

		void Reset()
		{
			Phase = 0;
			TalkEventTimer = 2000;
		}

		void UpdateAI(const uint32 diff)
		{
			if (TalkEventTimer <= diff)
			{
				if (Player* pPlayer = me->GetPlayer(*me, PlayerGUID))
					if (Creature* Jitters = me->FindNearestCreature(NPC_JITTERS, 20.0f, true))
						if (Creature* Worgen = me->FindNearestCreature(NPC_LUR_WORGEN, 20.0f, true))
							if (Creature* Harris = me->FindNearestCreature(NPC_OLIVER_HARRIS, 20.0f, true))
							{
								switch (Phase)
								{
								case 0: Harris->GetMotionMaster()->MovePoint(0, -10745.14f, 331.53f, 37.86f); Jitters->HandleEmoteCommand(EMOTE_STATE_USE_STANDING); TalkEventTimer = 4000; Phase++; break;
								case 1: Harris->MonsterSay("Here we go...", 0, 0); Harris->SetFacingToObject(Worgen); Harris->HandleEmoteCommand(EMOTE_ONESHOT_TALK_NO_SHEATHE); TalkEventTimer = 3500; Phase++; break;
								case 2: Harris->MonsterSay("It's working. Hold him still, Jitters.", 0, 0); Harris->HandleEmoteCommand(EMOTE_ONESHOT_ATTACKOFFPIERCE); TalkEventTimer = 2500; Phase++; break;
								case 3: Jitters->MonsterSay("I...I can't", 0, 0); TalkEventTimer = 2000; Phase++; break;
								case 4: Worgen->MonsterSay("Jitters...", 0, 0); TalkEventTimer = 1000; Phase++; break;
								case 5: Harris->MonsterSay("Damn it, Jitters. I said HOLD!", 0, 0); Harris->HandleEmoteCommand(EMOTE_ONESHOT_EXCLAMATION); TalkEventTimer = 3000; Phase++; break;
								case 6: Worgen->MonsterYell("JITTERS!", 0, 0); Worgen->HandleEmoteCommand(EMOTE_ONESHOT_BATTLEROAR); Worgen->SetOrientation(2.3997f); /* Check if this is supposed to be Jitters*/ TalkEventTimer = 4000; Phase++; break;
								case 7: Worgen->MonsterSay("I remember now...it's all your fault!", 0, 0); Worgen->HandleEmoteCommand(EMOTE_STATE_HOLD_BOW); Jitters->HandleEmoteCommand(EMOTE_STATE_STRANGULATE2); TalkEventTimer = 4500; Phase++; break;
								case 8: Worgen->MonsterSay("You brought the worgen to Duskwood! You led the Dark Riders to my farm, and hid while they murdered my family!", 0, 0); TalkEventTimer = 4500; Phase++; break;
								case 9: Worgen->MonsterYell("Every speak of suffering in my life is YOUR PATHETIC FAULT! I SHOULD KILL YOU!", 0, 0); TalkEventTimer = 9000; Phase++; break;
								case 10: Harris->MonsterSay("Letting him go is the only thing that's going to separateyou from the beasts now, my friend.", 0, 0); TalkEventTimer = 1500; Phase++; break;
								case 11: Worgen->MonsterSay("You've got a lot to make up for, Jitters. I won't give you the easy way out.", 0, 0); TalkEventTimer = 2000; Phase++; break;
								case 12: Worgen->GetMotionMaster()->MovePoint(1, -10761.66f, 338.77f, 37.82f); TalkEventTimer = 6000; Worgen->HandleEmoteCommand(EMOTE_ONESHOT_NONE); Jitters->HandleEmoteCommand(EMOTE_ONESHOT_NONE); Phase++; break;
								case 13: Worgen->SetFacingToObject(Jitters); Harris->GetMotionMaster()->MoveTargetedHome(); TalkEventTimer = 3000; Phase++; break;
								case 14: Jitters->DespawnOrUnsummon(); Harris->DespawnOrUnsummon(); Worgen->DespawnOrUnsummon(); pPlayer->CastSpell(pPlayer, SPELL_INVISIBILITY_7, true); pPlayer->CastSpell(pPlayer, SPELL_INVISIBILITY_8, true); pPlayer->CastSpell(pPlayer, SPELL_KILL_CREDIT, true);
									break;
								default: break;
								}
							}
			}
			else TalkEventTimer -= diff;
		}
	};
};


/// ***********************	[Quest] - Soothing Spirits - 26777 *********************** ///
enum SoothingIncenseCloudData
{
	EVENT_SELECT_TARGET = 1,
	NPC_FORLORN_SPIRIT = 43923,
	NPC_FORLORN_SPIRIT_KILLCREDIT = 43930,
};

/// Soothing Incense Cloud - 43925
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


/// ***********************	[Quest] - Mistmantle's Revenge - 26674 *********************** ///
enum SpellSummonStalvanData
{
	/// Npcs
	NPC_STALVAN = 315,
	NPC_TOBIAS = 43453,
	NPC_WORGEN_TOBIAS = 43797,

	/// Display ID - Misc
	DISPLAYID_WORGEN_TOBIAS = 33508,

	/// Quest
	QUEST_MISTMANTLES_REVENGE = 26674,
};

const Position stalvanPosition = { -10371.72f, -1251.92f, 35.99339f };
const Position stalvanDestination = { -10369.932617f, -1253.7677f, 35.909294f };

const float stalvanOrientation = 5.532694f;
const float tobiasOrientation = 3.168259f;

const uint8 tobiasPositionsCount = 4;
const Position tobiasPositions[tobiasPositionsCount] = {
	{ -10351.5f, -1256.7f, 34.8566f },
	{ -10357.5f, -1256.8f, 35.3863f },
	{ -10363.5f, -1257.0f, 35.9107f },
	{ -10365.8f, -1255.7f, 35.9098f }
};

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

/// Stalvan Mistmantle - 315
class npc_stalvan_mistmantle : public CreatureScript
{
public:
	npc_stalvan_mistmantle() : CreatureScript("npc_stalvan_mistmantle") { }

	struct npc_stalvan_mistmantleAI : public ScriptedAI
	{
		npc_stalvan_mistmantleAI(Creature* creature) : ScriptedAI(creature) {}

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
			if (Creature* tobias = ObjectAccessor::GetCreature(*me, GetTobias()))
			{
				Talk(SAY_06, tobias->GetGUID());
				tobias->AI()->Talk(SAY_04);
				tobias->GetMotionMaster()->MoveCharge(-10351.5f, -1256.7f, 34.8566f, 3.0f); // Need to get a farther point and add a delayed operation
				tobias->DespawnOrUnsummon(2000);
			}
		}

		uint64 GetTobias()
		{
			if (Creature* tobias = me->FindNearestCreature(NPC_TOBIAS, 30, true))
				return tobias->GetGUID();

			return me->FindNearestCreature(NPC_WORGEN_TOBIAS, 30, true)->GetGUID();
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
					Talk(SAY_00, GetTobias());
					break;

				case EVENT_STALVAN_STEP_2:
					Talk(SAY_01, GetTobias());
					break;

				case EVENT_STALVAN_STEP_3:
					Talk(SAY_02, GetTobias());
					break;

				case EVENT_STALVAN_STEP_4:
					Talk(SAY_03, GetTobias());
					break;

				case EVENT_STALVAN_STEP_5:
					Talk(SAY_04, GetTobias());
					break;

				case EVENT_STALVAN_STEP_6:
					Talk(SAY_05, GetTobias());
					break;

				case EVENT_TOBIAS_STEP_1:
					if (Creature* tobias = ObjectAccessor::GetCreature(*me, GetTobias()))
					{
						tobias->SetFacingToObject(me);
						me->SetFacingToObject(tobias);
						tobias->AI()->Talk(SAY_00, me->GetGUID());
					}
					break;

				case EVENT_TOBIAS_STEP_2:
					if (Creature* tobias = ObjectAccessor::GetCreature(*me, GetTobias()))
						tobias->AI()->Talk(SAY_01, me->GetGUID());
					break;

				case EVENT_TOBIAS_STEP_3:
					if (Creature* tobias = ObjectAccessor::GetCreature(*me, GetTobias()))
						tobias->AI()->Talk(SAY_02, me->GetGUID());
					break;

				case EVENT_TOBIAS_STEP_4:
					if (Creature* tobias = ObjectAccessor::GetCreature(*me, GetTobias()))
					{
						tobias->CastSpell(tobias, SPELL_WORGEN_TRANSFORMATION, true);
						tobias->SetReactState(REACT_AGGRESSIVE);

						me->RemoveFlag(UNIT_FIELD_FLAGS, (UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_IMMUNE_TO_PC));
						me->AddThreat(tobias, 10.f);
						tobias->AddThreat(me, 10.f);
						tobias->SetInCombatWith(me);

						if (me->Attack(tobias, true))
							me->GetMotionMaster()->MoveChase(tobias);

						if (tobias->Attack(me, true))
							tobias->GetMotionMaster()->MoveChase(me);

						me->SetReactState(REACT_AGGRESSIVE);

						tobias->AI()->Talk(SAY_03, tobias->GetOwnerGUID());
					}
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
		return new npc_stalvan_mistmantleAI(creature);
	}
};



/// Call Stalvan - 82029
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


/// ***********************	[Quest] - Morent's Bane - 26754 *********************** ///
enum MorbentFel
{
	/// Spells
	SPELL_SACRED_CLEANSING = 82130,

	/// Npcs
	NPC_WEAKENED_MORBENT_FEL = 43762,
	NPC_MORBENT_FEL = 43761
};

/// Sacred Cleansing - 82130
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


/// ***********************	[Quest] - The Yorgen Worgen - 26717 *********************** ///
/// Mound of Loose Dirt - 204777
class go_mound_dirt : public GameObjectScript
{
public:
	go_mound_dirt() : GameObjectScript("go_mound_dirt") { }

	bool OnGossipHello(Player *pPlayer, GameObject *pGO)
	{
		if (pPlayer->GetQuestStatus(QUEST_YORGEN_WORGEN) == QUEST_STATUS_INCOMPLETE)
			if (!pPlayer->FindNearestCreature(NPC_LURKING_WORGEN, 50.0f, true)) // If another Lurking Worgen has been summoned then don't summon another one.
				pPlayer->SummonCreature(NPC_LURKING_WORGEN, -11127.5f, -518.42f, 35.25f, 0.43f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 20000);
		return true;
	}
};



#ifndef __clang_analyzer__
void AddSC_duskwood()
{
	/// Boss
    new boss_twilight_corrupter();
    new at_twilight_grove();

	/// Npcs
	new npc_blaze_darkshire();
	new npc_ebenlocke();
	new npc_stitches();
	new npc_nightwatch_guard();
	new npc_lurking_worgen();
	new npc_lurking_worgen_curse();
	new npc_oliver_harris();
	new npc_soothing_incense_cloud();
	new npc_stalvan_mistmantle();

	/// Spells
	new spell_sacred_cleansing();
	new spell_summon_stalvan();

	/// Gameobjects
	new go_mound_dirt();
}
#endif
