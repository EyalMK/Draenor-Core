////////////////////////////////////////////////////////////////////////////////
//
// Project-Hellscream https://hellscream.org
// Copyright (C) 2018-2020 Project-Hellscream-6.2
// Discord https://discord.gg/CWCF3C9
//
////////////////////////////////////////////////////////////////////////////////

#include "ScriptMgr.h"
#include "CombatAI.h"
#include "Player.h"
#include "ScriptedCreature.h"
#include "MotionMaster.h"
#include "ObjectAccessor.h"
#include "SpellInfo.h"
#include "SpellScript.h"
#include "TemporarySummon.h"

enum DumpyKeeshan
{
	NPC_BIGEARL = 43248,

	EventCheckEarl = 1,

	SPELL_APPLY_QUEST_INVIS_ZONE_3 = 80815, // Used by npc's in Lakeshire Inn
	SPELL_APPLY_QUEST_INVIS_ZONE_4 = 80816  // Used by npc's in Lakeshire Inn
};

/*######
# npc_dumpy_and_keeshan "Used by entries 43249 and 43184"
######*/

class npc_dumpy_and_keeshan : public CreatureScript
{
public:
	npc_dumpy_and_keeshan() : CreatureScript("npc_dumpy_and_keeshan") { }

	struct npc_dumpy_and_keeshanAI : public ScriptedAI
	{
		npc_dumpy_and_keeshanAI(Creature* creature) : ScriptedAI(creature) {
			m_Repeat = false;
		}

		EventMap m_CosmeticEvents;
		EventMap m_Events;

		bool m_Repeat;

		void Reset() override
		{
			m_Events.Reset();
			ClearDelayedOperations();

			m_CosmeticEvents.ScheduleEvent(EventCheckEarl, 0.5 * TimeConstants::IN_MILLISECONDS);

		}

		void DamageTaken(Unit* who, uint32& damage, SpellInfo const*  /*p_SpellInfo*/) override
		{
			if (who->GetTypeId() == TYPEID_UNIT && me->HealthBelowPctDamaged(82, damage))
				damage = 0;
		}

		void UpdateAI(uint32 p_Diff) override
		{
			UpdateOperations(p_Diff);
			m_Events.Update(p_Diff);
			m_CosmeticEvents.Update(p_Diff);


			switch (m_Events.ExecuteEvent()) {}

			switch (m_CosmeticEvents.ExecuteEvent())
			{
			case EventCheckEarl:
			{
				std::list<Creature*> bigEarlList;
				me->GetCreatureListWithEntryInGrid(bigEarlList, NPC_BIGEARL, 5.0f);

				for (Creature* bigEarl : bigEarlList)
					if ((bigEarl->HasAura(SPELL_APPLY_QUEST_INVIS_ZONE_3) && me->HasAura(SPELL_APPLY_QUEST_INVIS_ZONE_3))
						|| (bigEarl->HasAura(SPELL_APPLY_QUEST_INVIS_ZONE_4) && me->HasAura(SPELL_APPLY_QUEST_INVIS_ZONE_4)))
						AttackStart(bigEarl);

				if (!me->isInCombat())
					m_CosmeticEvents.RepeatEvent(500);
				m_Repeat = true;
			}
			}

			DoMeleeAttackIfReady();
		}
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_dumpy_and_keeshanAI(creature);
	}
};

/*######
# npc_big_earl "Used by entry 43248"
######*/

class npc_big_earl : public CreatureScript
{
public:
	npc_big_earl() : CreatureScript("npc_big_earl") { }

	struct npc_big_earlAI : public ScriptedAI
	{
		npc_big_earlAI(Creature* creature) : ScriptedAI(creature) { }

		void DamageTaken(Unit* who, uint32& damage, SpellInfo const*  /*p_SpellInfo*/) override
		{
			if (who->GetTypeId() == TYPEID_UNIT && me->HealthBelowPctDamaged(82, damage))
				damage = 0;
		}

		void UpdateAI(uint32 /*diff*/) override
		{
			DoMeleeAttackIfReady();
		}
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_big_earlAI(creature);
	}
};

/*######
# npc_bridge_worker_alex "Used by entry 653" "Script not fully complete.  Needs scripting added for move rock will be updated in future."
######*/

enum BridgeWorkerAlex
{
	EVENT_STORE_GUIDS = 1,
	EVENT_OSLOW_SAY = 2,
	EVENT_ALEX_SAY = 3,
	EVENT_WORKERS_SAY = 4,
	EVENT_ALEX_SAY_PUSH = 5,
	EVENT_MATTHEW_SAY = 6,

	NPC_OSLOW = 341,
	NPC_TRENT = 648,
	NPC_DIMITRI = 649,
	NPC_JESS = 650,
	NPC_DANIEL = 651,
	NPC_MATTHEW = 652,

	SAY_OSLOW = 0,
	SAY_ALEX_PUT = 0,
	SAY_ALEX_HEAVE = 1,
	SAY_ALEX_DAMN = 2,
	SAY_ALEX_HANGON = 3,
	SAY_ALEX_PUSH = 4,
	SAY_WORKERS_HO = 0,
	SAY_MATTHEW_IM_PUSHING = 1
};

class npc_bridge_worker_alex : public CreatureScript
{
public:
	npc_bridge_worker_alex() : CreatureScript("npc_bridge_worker_alex") { }

	struct npc_bridge_worker_alexAI : public ScriptedAI
	{
		npc_bridge_worker_alexAI(Creature* creature) : ScriptedAI(creature) { }

		void Reset() override
		{
			_events.Reset();
			_oslowGUID.Clear();
			_trentGUID.Clear();
			_dimitriGUID.Clear();
			_jessGUID.Clear();
			_danielGUID.Clear();
			_matthewGUID.Clear();
			_events.ScheduleEvent(EVENT_STORE_GUIDS, 5000);
			_events.ScheduleEvent(EVENT_OSLOW_SAY, urand(40000, 50000));
			_events.ScheduleEvent(EVENT_ALEX_SAY, urand(22000, 30000));
		}

		void UpdateAI(uint32 diff) override
		{
			_events.Update(diff);

			if (!UpdateVictim())
			{
				while (uint32 eventId = _events.ExecuteEvent())
				{
					switch (eventId)
					{
					case EVENT_STORE_GUIDS:
						if (Creature* oslow = me->FindNearestCreature(NPC_OSLOW, 5.0f, true))
							_oslowGUID = oslow->GetGUID();
						if (Creature* trent = me->FindNearestCreature(NPC_TRENT, 5.0f, true))
							_trentGUID = trent->GetGUID();
						if (Creature* dimitri = me->FindNearestCreature(NPC_DIMITRI, 5.0f, true))
							_dimitriGUID = dimitri->GetGUID();
						if (Creature* jess = me->FindNearestCreature(NPC_JESS, 5.0f, true))
							_jessGUID = jess->GetGUID();
						if (Creature* daniel = me->FindNearestCreature(NPC_DANIEL, 5.0f, true))
							_danielGUID = daniel->GetGUID();
						if (Creature* matthew = me->FindNearestCreature(NPC_MATTHEW, 5.0f, true))
							_matthewGUID = matthew->GetGUID();
						break;
					case EVENT_OSLOW_SAY:
						if (Creature* oslow = ObjectAccessor::GetCreature(*me, _oslowGUID))
							oslow->AI()->Talk(SAY_OSLOW);
						_events.RepeatEvent(urand(40000, 50000));
						break;
					case EVENT_ALEX_SAY:
						switch (urand(0, 3))
						{
						case 0:
							Talk(SAY_ALEX_PUT);
							break;
						case 1:
							Talk(SAY_ALEX_HEAVE);
							_events.ScheduleEvent(EVENT_WORKERS_SAY, 2000);
							break;
						case 2:
							Talk(SAY_ALEX_DAMN);
							_events.ScheduleEvent(EVENT_ALEX_SAY_PUSH, 4000);
							break;
						case 3:
							Talk(SAY_ALEX_HANGON);
							break;
						}
						_events.RepeatEvent(urand(22000, 30000));
						break;
					case EVENT_WORKERS_SAY:
						if (Creature* trent = ObjectAccessor::GetCreature(*me, _trentGUID))
							trent->AI()->Talk(SAY_WORKERS_HO);
						if (Creature* dimitri = ObjectAccessor::GetCreature(*me, _dimitriGUID))
							dimitri->AI()->Talk(SAY_WORKERS_HO);
						if (Creature* jess = ObjectAccessor::GetCreature(*me, _jessGUID))
							jess->AI()->Talk(SAY_WORKERS_HO);
						if (Creature* daniel = ObjectAccessor::GetCreature(*me, _danielGUID))
							daniel->AI()->Talk(SAY_WORKERS_HO);
						if (Creature* matthew = ObjectAccessor::GetCreature(*me, _matthewGUID))
							matthew->AI()->Talk(SAY_WORKERS_HO);
						break;
					case EVENT_ALEX_SAY_PUSH:
						Talk(SAY_ALEX_PUSH);
						_events.ScheduleEvent(EVENT_MATTHEW_SAY, 4000);
						break;
					case EVENT_MATTHEW_SAY:
						if (Creature* matthew = ObjectAccessor::GetCreature(*me, _matthewGUID))
							matthew->AI()->Talk(SAY_MATTHEW_IM_PUSHING);
						break;
					default:
						break;
					}
				}
			}
			DoMeleeAttackIfReady();
		}

	private:
		EventMap _events;
		ObjectGuid _oslowGUID;
		ObjectGuid _trentGUID;
		ObjectGuid _dimitriGUID;
		ObjectGuid _jessGUID;
		ObjectGuid _danielGUID;
		ObjectGuid _matthewGUID;
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_bridge_worker_alexAI(creature);
	}
};

/*######
# npc_redridge_citizen "Used by entries 43222 and 43247"
######*/

enum RedridgeCitizen
{
	EVENT_DETERMINE_EVENT = 7,     // Determine where npc is located by aura
	EVENT_PLAYEMOTE = 8,     // Used by npc's in Lakeshire Inn
	EVENT_SAY_TEXT = 9,     // Used by npc's in Lakeshire Townhall
	EVENT_LEAVE_TOWNHALL = 10,    // Used by npc's in Lakeshire Townhall

	EMOTE_ONESHOTCHEER = 4,
	EMOTE_ONESHOTROAR = 15,
	EMOTE_ONESHOTSHOT = 22,
	EMOTE_ONESHOTPOINT = 25,
	EMOTE_ONESHOTBATTLEROAR = 53,
	EMOTE_ONESHOTNO = 274,

	SAY_IN_TOWNHALL = 0,     // Used by npc's in Lakeshire Townhall
	SAY_LEAVE_TOWNHALL = 1,     // Used by npc's in Lakeshire Townhall

	SPELL_APPLY_QUEST_INVIS_ZONE_19 = 82099  // Used by npc's in Lakeshire Townhall
};

const uint32 Emote[6] =
{
	EMOTE_ONESHOTCHEER,
	EMOTE_ONESHOTROAR,
	EMOTE_ONESHOTSHOT,
	EMOTE_ONESHOTPOINT,
	EMOTE_ONESHOTBATTLEROAR,
	EMOTE_ONESHOTNO
};

uint32 const MaxTownhallPathMoves = 8;
static std::array<G3D::Vector3, MaxTownhallPathMoves> g_TownhallPath =
{
	{
		{ -9221.39f, -2198.45f, 66.34846f },
		{ -9221.39f, -2198.45f, 66.34846f },
		{ -9226.39f, -2196.45f, 66.34846f },
		{ -9231.64f, -2196.45f, 65.34846f },
		{ -9231.39f, -2205.45f, 66.34846f },
		{ -9231.64f, -2210.45f, 66.34846f },
		{ -9244.14f, -2211.20f, 66.34846f },
		{ -9255.31f, -2211.62f, 63.93340f }
	}
};

class npc_redridge_citizen : public CreatureScript
{
public:
	npc_redridge_citizen() : CreatureScript("npc_redridge_citizen") { }

	struct npc_redridge_citizenAI : public ScriptedAI
	{
		npc_redridge_citizenAI(Creature* creature) : ScriptedAI(creature) { }

		void Reset() override
		{
			_events.Reset();
			_events.ScheduleEvent(EVENT_DETERMINE_EVENT, 2000);
			me->SetDisplayId(me->GetCreatureTemplate()->GetRandomValidModelId());
		}

		void UpdateAI(uint32 diff) override
		{
			_events.Update(diff);

			if (!UpdateVictim())
			{
				while (uint32 eventId = _events.ExecuteEvent())
				{
					switch (eventId)
					{
					case EVENT_DETERMINE_EVENT: // Determine where npc is located
						if (me->HasAura(SPELL_APPLY_QUEST_INVIS_ZONE_3) || me->HasAura(SPELL_APPLY_QUEST_INVIS_ZONE_4))  // Lakeshire Inn
							_events.ScheduleEvent(EVENT_PLAYEMOTE, urand(5000, 15000));
						else if (me->HasAura(SPELL_APPLY_QUEST_INVIS_ZONE_19)) // Lakeshire Townhall
							_events.ScheduleEvent(EVENT_SAY_TEXT, urand(5000, 30000));
						break;
					case EVENT_PLAYEMOTE:
						me->HandleEmoteCommand(Emote[urand(0, 5)]);
						_events.ScheduleEvent(EVENT_PLAYEMOTE, urand(10000, 25000));
						break;
					case EVENT_SAY_TEXT:
						if (roll_chance_i(3))
						{
							Talk(SAY_LEAVE_TOWNHALL);
							_events.ScheduleEvent(EVENT_LEAVE_TOWNHALL, 2000);
							break;
						}
						if (roll_chance_i(30))
							Talk(SAY_IN_TOWNHALL);
						_events.RepeatEvent(30000);
						break;
					case EVENT_LEAVE_TOWNHALL:
						me->GetMotionMaster()->MoveSmoothPath(MaxTownhallPathMoves, g_TownhallPath.data(), g_TownhallPath.size(), true, false);
						me->DespawnOrUnsummon(30000);
						break;
					default:
						break;
					}
				}
			}
			DoMeleeAttackIfReady();
		}
	private:
		EventMap _events;
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_redridge_citizenAI(creature);
	}
};

uint32 const MaxBoatMoves = 2;
static std::array<G3D::Vector3, MaxBoatMoves> g_BoatPath =
{
	{
		{ -9356.31f, -2414.29f, 69.6370f },
		{ -9425.49f, -2836.49f, 69.9875f }
	}
};


class npc_keeshan_riverboat : public CreatureScript
{
public:
	npc_keeshan_riverboat() : CreatureScript("npc_keeshan_riverboat") { }


	struct npc_keeshan_riverboatAI : public VehicleAI
	{
		npc_keeshan_riverboatAI(Creature* creature) : VehicleAI(creature) { }

		void Reset() override
		{
			me->GetMotionMaster()->MoveSmoothPath(MaxBoatMoves, g_BoatPath.data(), g_BoatPath.size(), false, true);
			me->DespawnOrUnsummon(22000);
		}
	};

	CreatureAI* GetAI(Creature* pCreature) const
	{
		return new npc_keeshan_riverboatAI(pCreature);
	}
};

enum BlackrockTower
{
	QUEST_TO_WIN_A_WAR = 26651,
	NPC_BLACKROCK_TOWER = 43590,
	NPC_MUNITIONS_DUMP = 43589,
};

class npc_blackrock_tower : public CreatureScript
{
public:
	npc_blackrock_tower() : CreatureScript("npc_blackrock_tower") { }

	struct npc_blackrock_towerAI : public ScriptedAI
	{
		npc_blackrock_towerAI(Creature* creature) : ScriptedAI(creature) {}

		void MoveInLineOfSight(Unit* who) override
		{
			ScriptedAI::MoveInLineOfSight(who);

			if (who->IsPlayer() && who->ToPlayer()->GetQuestStatus(QUEST_TO_WIN_A_WAR) == QUEST_STATUS_INCOMPLETE)
				who->ToPlayer()->KilledMonsterCredit(NPC_BLACKROCK_TOWER);
		}
	};
	CreatureAI* GetAI(Creature* pCreature) const
	{
		return new npc_blackrock_towerAI(pCreature);
	}
};

class npc_munitions_dump : public CreatureScript
{
public:
	npc_munitions_dump() : CreatureScript("npc_munitions_dump") { }

	struct npc_munitions_dumpAI : public ScriptedAI
	{
		npc_munitions_dumpAI(Creature* creature) : ScriptedAI(creature) {}

		void MoveInLineOfSight(Unit* who) override
		{
			ScriptedAI::MoveInLineOfSight(who);

			if (who->IsPlayer() && who->ToPlayer()->GetQuestStatus(QUEST_TO_WIN_A_WAR) == QUEST_STATUS_INCOMPLETE)
				who->ToPlayer()->KilledMonsterCredit(NPC_MUNITIONS_DUMP);
		}
	};

	CreatureAI* GetAI(Creature* pCreature) const
	{
		return new npc_munitions_dumpAI(pCreature);
	}
};

void AddSC_redridge_mountains()
{
	new npc_big_earl();
	new npc_dumpy_and_keeshan();
	new npc_bridge_worker_alex();
	new npc_redridge_citizen();
	new npc_keeshan_riverboat();
	new npc_blackrock_tower();
	new npc_munitions_dump();
}