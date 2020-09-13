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

/// Quest: Goggle Boggle - 26050
enum eEnums
{
	SAY_PROGRESS_1 = 0,
	SAY_PROGRESS_2 = 1,
	SAY_PROGRESS_3 = 2,
	EMOTE_PROGRESS_4 = 3,
	SAY_AGGRO = 4,
	SAY_PROGRESS_5 = 5,
	SAY_PROGRESS_6 = 6,
	SAY_PROGRESS_7 = 7,
	EMOTE_PROGRESS_8 = 8,
	SAY_PROGRESS_9 = 9,

	QUEST_GOGGLE_BOGGLE = 26050,
	MOB_VENGEFUL_SURGE = 2776
};

/// Professor Phizzlethorpe - 2768
class npc_professor_phizzlethorpe : public CreatureScript
{
public:

	npc_professor_phizzlethorpe() : CreatureScript("npc_professor_phizzlethorpe") {}

	struct npc_professor_phizzlethorpeAI : public npc_escortAI
	{
		npc_professor_phizzlethorpeAI(Creature* creature) : npc_escortAI(creature) {}

		void WaypointReached(uint32 PointId)
		{
			Player* player = GetPlayerForEscort();

			if (!player)
				return;

			switch (PointId)
			{
			case 4:Talk(SAY_PROGRESS_2); break;
			case 5:Talk(SAY_PROGRESS_3); break;
			case 8:Talk(EMOTE_PROGRESS_4); break;
			case 9:
			{
				me->SummonCreature(MOB_VENGEFUL_SURGE, -2052.96f, -2142.49f, 20.15f, 1.0f, TEMPSUMMON_CORPSE_DESPAWN, 0);
				me->SummonCreature(MOB_VENGEFUL_SURGE, -2052.96f, -2142.49f, 20.15f, 1.0f, TEMPSUMMON_CORPSE_DESPAWN, 0);
				break;
			}
			case 10:Talk(SAY_PROGRESS_5); break;
			case 11:
				Talk(SAY_PROGRESS_6);
				SetRun();
				break;
			case 19:Talk(SAY_PROGRESS_7); break;
			case 20:
				Talk(EMOTE_PROGRESS_8);
				Talk(SAY_PROGRESS_9);
				if (player)
					CAST_PLR(player)->KilledMonsterCredit(me->GetEntry());
				break;
			}
		}

		void JustSummoned(Creature* summoned)
		{
			summoned->AI()->AttackStart(me);
		}

		void EnterCombat(Unit* /*who*/)
		{
			Talk(SAY_AGGRO);
		}

		void UpdateAI(const uint32 diff)
		{
			npc_escortAI::UpdateAI(diff);
		}
	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_professor_phizzlethorpeAI(creature);
	}

	bool OnQuestAccept(Player* player, Creature* creature, Quest const* quest)
	{
		if (quest->GetQuestId() == QUEST_GOGGLE_BOGGLE)
		{
			creature->AI()->Talk(SAY_PROGRESS_1);
			if (npc_escortAI* escortAI = CAST_AI(npc_professor_phizzlethorpeAI, (creature->AI())))
				escortAI->Start(false, false, player->GetGUID(), quest);

			creature->setFaction(113);
		}
		return true;
	}
};

/// Quest: Death From Below - 26628
float VictimsWaves[3][5] =
{
	{2775, -2144.64f, -1985.12f, 11.74f, 5.54f},
	{2775, -2148.25f, -1990.27f, 13.60f, 5.76f},
	{2775, -2140.80f, -1980.00f, 11.46f, 5.51f}
};

enum eShakes
{
	QUEST_DEATH_FROM_BELOW = 26628
};

/// Shakes O'Breen - 2610
class npc_shakes : public CreatureScript
{
public:
	npc_shakes() : CreatureScript("npc_shakes") { }

	bool OnQuestAccept(Player* pPlayer, Creature* pCreature, Quest const *pQuest)
	{
		if (pQuest->GetQuestId() == QUEST_DEATH_FROM_BELOW)
		{
			if (!(CAST_AI(npc_shakes::npc_shakesAI, pCreature->AI())->EventStarted))
			{
				CAST_AI(npc_shakes::npc_shakesAI, pCreature->AI())->EventStarted = true;
				CAST_AI(npc_shakes::npc_shakesAI, pCreature->AI())->PlayerGUID = pPlayer->GetGUID();
			}

		}return true;
	}

	CreatureAI* GetAI(Creature* pCreature) const
	{
		return new npc_shakesAI(pCreature);
	}

	struct npc_shakesAI : public ScriptedAI
	{
		npc_shakesAI(Creature* creature) : ScriptedAI(creature) {}

		uint8 Phase;
		uint32 EventTimer;
		uint64 PlayerGUID;
		bool EventStarted;
		bool Say;

		void Reset()
		{
			EventStarted = false;
			Say = false;
			EventTimer = 1000;
			Phase = 0;
			PlayerGUID = 0;
			me->GetMotionMaster()->MoveTargetedHome();
		}
		void DamageTaken(Unit * pWho, uint32 &uiDamage)
		{
			if (pWho->GetEntry() == 2775)
			{
				me->AI()->AttackStart(pWho);
			}
		}

		void SummonInvaders()
		{
			for (int i = 0; i < 3; i++)
			{
				me->SummonCreature(VictimsWaves[i][1], VictimsWaves[i][2], VictimsWaves[i][3], VictimsWaves[i][4], VictimsWaves[i][5], TEMPSUMMON_CORPSE_DESPAWN, 0);
			}
		}

		void UpdateAI(const uint32 diff)
		{
			if (EventStarted)
			{
				if (EventTimer < diff)
				{
					if (Player* pPlayer = me->GetPlayer(*me, PlayerGUID))
					{
						switch (Phase)
						{
						case 0: me->MonsterYell("All hands to battle stations! Naga incoming!", 0, 0); EventTimer = 15000; Phase++; break;
						case 1: SummonInvaders(); EventTimer = 1000; Phase++; break;
						case 2:
						{
							if (Creature* Naga = me->FindNearestCreature(2775, 100.0f, true))
							{
								if (!Say)
								{
									Naga->MonsterYell("You've plundered our treasures too long. Prepare to meet your watery grave!", 0, 0);
									Say = true;
								}
							}
							EventTimer = 15000;
							Phase++;
						}break;
						case 3: me->MonsterSay("If we can just hold them now, I am sure we will be in the clear.", 0, 0); EventTimer = 20000; Phase++; break;
						case 4: SummonInvaders(); EventTimer = 10000; Phase++; break;
						case 5:
						{
							if (Creature* Naga = me->FindNearestCreature(2775, 100.0f, true))
								Naga->MonsterYell("Nothing will stop us! You will die!", 0, 0);

							Phase++;
							EventTimer = 5000;
						}break;
						case 6:
						{
							std::list<Creature*> NagaList;
							me->GetCreatureListWithEntryInGrid(NagaList, 2775, 60.0f);
							if (NagaList.empty())
							{
								Phase++;
								EventTimer = 2000;
							}
						}break;
						case 7:
						{
							if (pPlayer)
								pPlayer->KilledMonsterCredit(me->GetEntry());
							
							Reset();
						}break;
						default: break;
						}
					}
				}
				else EventTimer -= diff;
			}
			DoMeleeAttackIfReady();
		}
	};
};

/// Daggerspine Marauder - 2775
class npc_daggerspine : public CreatureScript
{
public:
	npc_daggerspine() : CreatureScript("npc_daggerspine") { }

	CreatureAI* GetAI(Creature* pCreature) const
	{
		return new npc_daggerspineAI(pCreature);
	}

	struct npc_daggerspineAI : public ScriptedAI
	{
		npc_daggerspineAI(Creature *c) : ScriptedAI(c) {}

		void Reset()
		{
			if (Creature* Shakes = me->FindNearestCreature(2610, 100.0f, true))
			{
				me->Attack(Shakes, true);
				me->SetReactState(REACT_AGGRESSIVE);
				me->GetMotionMaster()->MoveCharge(Shakes->GetPositionX(), Shakes->GetPositionY(), Shakes->GetPositionZ(), 5);
			}
		}

		void UpdateAI(const uint32 diff)
		{
			DoMeleeAttackIfReady();
		}
	};
};



/// Quest: Kinelory Strikes - 26116
enum eKinelory
{
	SAY_START = 0,
	SAY_POINT_1 = 1,
	SAY_ON_AGGRO = 2,
	SAY_PROFESOR = 3,
	SAY_HOUSE_1 = 4,
	SAY_HOUSE_2 = 5,
	SAY_HOUSE_3 = 6,
	SAY_END = 7,

	QUEST_KINELORY_STRIKES = 26116,
	NPC_HAMMERFALL_GRUNT = 2619
};

/// Kinelory - 2713
class npc_kinelory : public CreatureScript
{
public:

	npc_kinelory() : CreatureScript("npc_kinelory") {}

	struct npc_kineloryAI : public npc_escortAI
	{
		npc_kineloryAI(Creature *c) : npc_escortAI(c) {}

		void Reset()
		{
			me->SetRespawnTime(10);
		}
		void WaypointReached(uint32 uiPointId)
		{
			Player* pPlayer = GetPlayerForEscort();

			if (!pPlayer)
				return;

			switch (uiPointId)
			{
			case 9:Talk(SAY_POINT_1); break;
			case 10:
			{
				me->SummonCreature(NPC_HAMMERFALL_GRUNT, -1459.62f, -3019.78f, 11.8f, 5.08f, TEMPSUMMON_CORPSE_DESPAWN, 0);
				me->SummonCreature(NPC_HAMMERFALL_GRUNT, -1471.77f, -3032.95f, 12.39f, 6.03f, TEMPSUMMON_CORPSE_DESPAWN, 0);
				break;
			}
			case 11:
			{
				me->SummonCreature(NPC_HAMMERFALL_GRUNT, -1517.95f, -3023.16f, 12.93f, 4.79f, TEMPSUMMON_CORPSE_DESPAWN, 0);
				me->SummonCreature(NPC_HAMMERFALL_GRUNT, -1522.69f, -3023.90f, 12.45f, 5.12f, TEMPSUMMON_CORPSE_DESPAWN, 0);
				break;
			}
			case 13:
			{
				if (Creature* Jorell = me->FindNearestCreature(2733, 8.0f, true))
				{
					Jorell->MonsterSay("You will never stop the Forsaken, Kinelory. The Dark Lady shall make you suffer.", 0, 0);
				}
				break;
			}
			case 14:Talk(SAY_HOUSE_1); break;
			case 15:Talk(SAY_HOUSE_2); break;
			case 16:Talk(SAY_HOUSE_3); break;
			case 17:SetRun(); break;
			case 27:
				Talk(SAY_END);
				if (pPlayer)
					CAST_PLR(pPlayer)->KilledMonsterCredit(me->GetEntry());
				Reset();
				break;
			}
		}

		void JustSummoned(Creature* pSummoned)
		{
			pSummoned->AI()->AttackStart(me);
		}

		void EnterCombat(Unit* /*pWho*/)
		{
			Talk(SAY_ON_AGGRO);
		}

		void UpdateAI(const uint32 diff)
		{
			npc_escortAI::UpdateAI(diff);
		}
	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_kineloryAI(creature);
	}

	bool OnQuestAccept(Player* player, Creature* creature, Quest const* quest)
	{
		if (quest->GetQuestId() == QUEST_KINELORY_STRIKES)
		{
			creature->AI()->Talk(SAY_START);
			if (npc_escortAI* pEscortAI = CAST_AI(npc_kineloryAI, (creature->AI())))
				pEscortAI->Start(false, false, player->GetGUID(), quest);
		}
		return true;
	}
};


#ifndef __clang_analyzer__
void AddSC_arathi_highlands()
{
	/// Npcs
    new npc_professor_phizzlethorpe();
	new npc_shakes();
	new npc_daggerspine();
	new npc_kinelory();
}
#endif
