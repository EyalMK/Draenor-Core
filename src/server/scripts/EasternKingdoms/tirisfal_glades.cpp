/*
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation; either version 2 of the License, or (at your
 * option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program. If not, see <http://www.gnu.org/licenses/>.
 */

#include "Vehicle.h"
#include "ScriptedEscortAI.h"

 /// Agatha - 49044
class npc_agatha_49044 : public CreatureScript
{
public:
	npc_agatha_49044() : CreatureScript("npc_agatha_49044") { }

	uint64 m_PlayerGuid;

	enum eAction
	{
		StartQuest	 = 0
	};

	enum eData
	{
		QUEST_FRESH_OUT_OF_THE_GRAVE	= 24959,
		SPELL_REVIVE_COSMETIC			= 73524,
		SPELL_RIGOR_MORTIS				= 73523
	};

	bool OnQuestAccept(Player* p_Player, Creature* p_Creature, Quest const* p_Quest) override
	{
		if (p_Quest->GetQuestId() == QUEST_FRESH_OUT_OF_THE_GRAVE) // Fresh out of the Grave
		{
			p_Creature->GetAI()->DoAction(eAction::StartQuest);
			m_PlayerGuid = p_Player->GetGUID();
		}

		return true;
	}

	bool OnQuestAbandon(Player* p_Player, Creature* p_Creature, Quest const* p_Quest)
	{
		if (p_Quest->GetQuestId() == QUEST_FRESH_OUT_OF_THE_GRAVE) // Fresh out of the Grave
		{
			// Teleport Player to start coordinates
			p_Creature->GetAI()->DoAction(eAction::StartQuest);
			m_PlayerGuid = p_Player->GetGUID();
		}

		return true;
	}

	struct npc_agatha_49044AI : public ScriptedAI
	{
		npc_agatha_49044AI(Creature * creature) : ScriptedAI(creature) 
		{ 
			m_PlayerGuid = 0;
		}

		EventMap m_events;
		uint64 m_PlayerGuid;

		void Reset()  override
		{
			ClearDelayedOperations();
		}

		void DoAction(int32 const p_Action) override
		{
			switch (p_Action)
			{
				case eAction::StartQuest:
				{
					
					// Rigor Mortis is removed automatically by a PlayerScript in spell_generic.cpp
					AddTimedDelayedOperation(0.2 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						if (m_PlayerGuid)
						{
							if (Player* l_Player = me->GetPlayer(*me, m_PlayerGuid))
							{
								me->CastSpell(l_Player, SPELL_REVIVE_COSMETIC, false);
							}
						}
					});
					break;
				}
			default:
				break;
			}
		}

		void UpdateAI(uint32 p_Diff) override
		{
			UpdateOperations(p_Diff);
		}
	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_agatha_49044AI(creature);
	}
};

 /// Aradne - 50372
class npc_aradne_50372 : public CreatureScript
{
public:
	npc_aradne_50372() : CreatureScript("npc_aradne_50372") { }

	enum eAradne
	{
		SPELL_RAISE_UNDEAD			= 93446,
		NPC_DEATHKNELL_GRAVE_TARGET = 50373,
		EVENT_RISE_DEAD				= 901,
		EVENT_START_TALK,
		EVENT_START_WALK,
	};

	enum eActions
	{
		Answer = 0
	};

	struct npc_aradne_50372AI : public ScriptedAI
	{
		npc_aradne_50372AI(Creature * creature) : ScriptedAI(creature) { }

		EventMap m_events;

		bool CanWalk;

		void Reset() override
		{
			CanWalk = true;
			me->GetMotionMaster()->MovePath(5037200, true); // Aradne Path
		}

		void MovementInform(uint32 type, uint32 id) override
		{

			if (type == WAYPOINT_MOTION_TYPE)
			{
				switch (id)
				{
					case 2:
					case 4:
					case 18:
					case 25:
						if (Creature* GraveTarget = me->FindNearestCreature(NPC_DEATHKNELL_GRAVE_TARGET, 5.0f))
							me->SetFacingToObject(GraveTarget);

						CanWalk = false;
						m_events.ScheduleEvent(EVENT_RISE_DEAD, 100);
						break;
				}
				
			}
		}

		void DoAction(int32 const p_Action) override
		{
			switch (p_Action)
			{
				case eActions::Answer:
				{
					Talk(1); // You are returned to life.
					break;
				}
			default:
				break;
			}
		}

		void UpdateAI(uint32 diff) override
		{
			m_events.Update(diff);

			while (uint32 eventId = m_events.ExecuteEvent())
			{
				switch (eventId)
				{
					case EVENT_RISE_DEAD:
						if (Creature* npc = me->FindNearestCreature(NPC_DEATHKNELL_GRAVE_TARGET, 2.0f))
							npc->CastSpell(npc, SPELL_RAISE_UNDEAD, true);

						m_events.ScheduleEvent(EVENT_START_TALK, 500);
						m_events.ScheduleEvent(EVENT_START_WALK, 3000);
						break;
					case EVENT_START_TALK:
						Talk(0); // Text after summon - rise, waken, you are returned to life, etc...
						break;
					case EVENT_START_WALK:
						CanWalk = true;
						break;
				}
			}
		}
	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_aradne_50372AI(creature);
	}
};

/// Deathknell Grave Target - 50373
class npc_deathknell_grave_target : public CreatureScript
{
public:
	npc_deathknell_grave_target() : CreatureScript("npc_deathknell_grave_target") { }

	enum eRisenDead
	{
		NPC_RISEN_RECRUIT		= 50374,
		SPELL_DIRT_EXPLOSION	= 89199,
		SPELL_CHURNING_DIRT		= 92788,
		SPELL_RISE_UNDEAD		= 93446
	};

	enum eActions
	{
		StartEvent = 1,
	};

	struct npc_deathknell_grave_targetAI : public ScriptedAI
	{
		npc_deathknell_grave_targetAI(Creature * creature) : ScriptedAI(creature) {}

		void Reset()  override
		{
			ClearDelayedOperations();
		}

		void SpellHit(Unit* caster, SpellInfo const* spell)
		{
			if (spell->Id == SPELL_RISE_UNDEAD)
			{
				me->GetAI()->DoAction(eActions::StartEvent);
			}
		}

		void DoAction(int32 const p_Action) override
		{
			switch (p_Action)
			{
				case eActions::StartEvent:
				{
					AddTimedDelayedOperation(0.5 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->CastSpell(me, SPELL_CHURNING_DIRT, false);
					});

					AddTimedDelayedOperation(1.5 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						Position l_Pos;
						me->GetPosition(&l_Pos);

						if (Creature* npc = me->SummonCreature(NPC_RISEN_RECRUIT, l_Pos, TEMPSUMMON_TIMED_DESPAWN, 30000))
						{
							npc->GetAI()->DoCast(SPELL_DIRT_EXPLOSION);
						}
					});

					AddTimedDelayedOperation(2 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->RemoveAllAuras();
					});

					break;
				}
			default:
				break;
			}
		}

		void UpdateAI(uint32 const p_Diff) override
		{
			UpdateOperations(p_Diff);
		}
	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_deathknell_grave_targetAI(creature);
	}
};

/// Risen Dead - 50374
class npc_risen_dead : public CreatureScript
{
public:
	npc_risen_dead() : CreatureScript("npc_risen_dead") { }

	enum eAction
	{
		Answer = 0
	};

	enum eNpc
	{
		NPC_ARADNE		 = 50372,
		SPELL_ENRAGE	 = 44427,
		EVENT_START_ANIM = 901,
		EVENT_SHOW_DEAD,
		EVENT_SHOW_LIFE,
		EVENT_SHOW_RUNNING,
		EVENT_SHOW_DEAD1,
		EVENT_SHOW_DEAD2,
		EVENT_SHOW_DEAD3,
		EVENT_SHOW_LIFE1,
		EVENT_SHOW_LIFE2,
		EVENT_SHOW_LIFE3,
		EVENT_SHOW_RUNNING1,
		EVENT_SHOW_RUNNING2,
		EVENT_SHOW_RUNNING3,
	};

	struct npc_risen_deadAI : public ScriptedAI
	{
		npc_risen_deadAI(Creature* p_Creature) : ScriptedAI(p_Creature) {}

		EventMap m_events;
		uint32 m_WishToBeDead;

		void Reset() override
		{
			m_WishToBeDead = urand(0, 100);
			m_events.RescheduleEvent(EVENT_START_ANIM, 1000);
		}

		void UpdateAI(uint32 diff) override
		{
			m_events.Update(diff);

			while (uint32 eventId = m_events.ExecuteEvent())
			{
				switch (eventId)
				{
					case EVENT_START_ANIM:
						if (m_WishToBeDead < 33)
							m_events.ScheduleEvent(EVENT_SHOW_DEAD, 1000);
						else if (m_WishToBeDead < 66)
							m_events.ScheduleEvent(EVENT_SHOW_LIFE, 1000);
						else
							m_events.ScheduleEvent(EVENT_SHOW_RUNNING, 1000);
						break;
					case EVENT_SHOW_DEAD:
						me->HandleEmoteCommand(EMOTE_ONESHOT_QUESTION);
						m_events.ScheduleEvent(EVENT_SHOW_DEAD1, 100);
						break;
					case EVENT_SHOW_DEAD1:
						Talk(2); // What's happening to me?
						m_events.ScheduleEvent(EVENT_SHOW_DEAD2, 4000);
						break;
					case EVENT_SHOW_DEAD2:
						Talk(0); // I never asked for this 
						m_events.ScheduleEvent(EVENT_SHOW_DEAD3, 3000);
						break;
					case EVENT_SHOW_DEAD3:
						Talk(4); // commits suicide
						me->Kill(me);
						break;

					case EVENT_SHOW_LIFE:
						me->HandleEmoteCommand(EMOTE_ONESHOT_QUESTION);
						m_events.ScheduleEvent(EVENT_SHOW_LIFE1, 100);
						break;
					case EVENT_SHOW_LIFE1:
					{
						Talk(5); // Life answers 
						m_events.ScheduleEvent(EVENT_SHOW_LIFE2, 6000);

						std::list<Creature*> l_Aradne;
						me->GetCreatureListWithEntryInGrid(l_Aradne, NPC_ARADNE, 5.0f);
						if (l_Aradne.front() != nullptr)
							l_Aradne.front()->AI()->DoAction(Answer); // Answer

						break;
					}
					case EVENT_SHOW_LIFE2:
						Talk(6); // If the Banshee Queen...
						m_events.ScheduleEvent(EVENT_SHOW_LIFE3, 3000);
						break;
					case EVENT_SHOW_LIFE3:
						Talk(7); // Walks off towards the barracks.
						me->GetMotionMaster()->MovePath(5037400, false); // Risen Dead Path 1 in waypoint_data
						break;
					case EVENT_SHOW_RUNNING:
						me->HandleEmoteCommand(EMOTE_ONESHOT_QUESTION);
						m_events.ScheduleEvent(EVENT_SHOW_RUNNING1, 100);
						break;
					case EVENT_SHOW_RUNNING1:
						Talk(2); // What's happening to me? 
						m_events.ScheduleEvent(EVENT_SHOW_RUNNING2, 4000);
						break;
					case EVENT_SHOW_RUNNING2:
						Talk(0); // I never asked for this!
						m_events.ScheduleEvent(EVENT_SHOW_RUNNING3, 3000);
						break;
					case EVENT_SHOW_RUNNING3:
						me->CastSpell(me, SPELL_ENRAGE, true);
						Talk(1); // enrages and transforms into a mindless zombie
						me->HandleEmoteCommand(EMOTE_ONESHOT_CRY);
						me->GetMotionMaster()->MovePath(5037401, false); // Risen Dead Path 2 in waypoint_data
						break;
					}
				}
		}
	};

	CreatureAI* GetAI(Creature* pCreature) const
	{
		return new npc_risen_deadAI(pCreature);
	}
};

/// Undertaker Mordo - 1568
class npc_undertaker_mordo : public CreatureScript
{
public:
	npc_undertaker_mordo() : CreatureScript("npc_undertaker_mordo") { }

	enum eData
	{
		QUEST_THE_SHADOW_GRAVE				= 28608,
		SPELL_SUMMON_DARNELL_SHADOW_GRAVE	= 91576,
		SPELL_RISEN_DEAD_TRANSFORM			= 93460,
		NPC_DEATHKNELL_GRAVE_TARGET			= 50373,
		NPC_RISEN_DEAD						= 50414,
		EVENT_START_ANIM					= 901,
		EVENT_MASTER_RESET,
		EVENT_START_TALK,
		EVENT_ANIM_PART_01,
		EVENT_ANIM_PART_02,
		EVENT_ANIM_PART_03,
		EVENT_ANIM_PART_04,
		EVENT_ANIM_PART_05,
		EVENT_ANIM_PART_06,
		EVENT_ANIM_PART_07,
		EVENT_ANIM_PART_08,
		EVENT_ANIM_PART_09,
		EVENT_ANIM_PART_10,
	};

	bool OnQuestAccept(Player* p_Player, Creature* p_Creature, Quest const* p_Quest)
	{
		if (!p_Player->HasQuest(QUEST_THE_SHADOW_GRAVE))
			if (p_Quest->GetQuestId() == QUEST_THE_SHADOW_GRAVE)
				p_Player->CastSpell(p_Player, SPELL_SUMMON_DARNELL_SHADOW_GRAVE);

		return false;
	}

	struct npc_undertaker_mordoAI : public ScriptedAI
	{
		npc_undertaker_mordoAI(Creature* p_Creature) : ScriptedAI(p_Creature) { }

		EventMap m_events;
		uint64   m_targetGUID;

		void Reset()  override
		{
			m_targetGUID = 0;
			m_events.RescheduleEvent(EVENT_START_ANIM, urand(60000, 80000));
			m_events.RescheduleEvent(EVENT_MASTER_RESET, 160000);
		}

		void UpdateAI(uint32 diff) override
		{
			Creature* p_Creature;

			m_events.Update(diff);

			while (uint32 eventId = m_events.ExecuteEvent())
			{
				switch (eventId)
				{
					case EVENT_START_ANIM:
					{
						if (Creature* npc_trigger = me->FindNearestCreature(NPC_DEATHKNELL_GRAVE_TARGET, 20.0f))
						{
							Position pos1;
							npc_trigger->GetPosition(&pos1);

							if (Creature* target = me->SummonCreature(NPC_RISEN_DEAD, pos1, TEMPSUMMON_TIMED_DESPAWN, 40000))
							{
								Position pos;

								m_targetGUID = target->GetGUID();
								me->GetNearPosition(pos, 1.5f, 0.3f);

								target->GetMotionMaster()->MovePoint(0, pos, true);
								m_events.ScheduleEvent(EVENT_START_TALK, 2000);
							}
							break;
						}
					}
					case EVENT_MASTER_RESET:
						Reset();
						break;
					case EVENT_START_TALK:
					{
						Talk(0); // Let's see, I just saw a corpse with a jaw...
						m_events.ScheduleEvent(EVENT_ANIM_PART_01, 3000);
						//m_events.RescheduleEvent(EVENT_MASTER_RESET, 150000);
						break;
					}
					case EVENT_ANIM_PART_01:
					{
						if (Creature* target = Unit::GetCreature(*me, m_targetGUID))
						{
							target->SetByteFlag(UNIT_FIELD_ANIM_TIER, 0, UNIT_STAND_STATE_KNEEL);
							target->SetFacingToObject(me);
							m_events.ScheduleEvent(EVENT_ANIM_PART_02, 750);
						}
						break;
					}
					case EVENT_ANIM_PART_02:
					{
						me->HandleEmoteCommand(EMOTE_STATE_USE_STANDING);
						m_events.ScheduleEvent(EVENT_ANIM_PART_03, 6000);
						break;
					}
					case EVENT_ANIM_PART_03:
					{
						me->HandleEmoteCommand(EMOTE_ONESHOT_NONE);
						m_events.ScheduleEvent(EVENT_ANIM_PART_04, 750);
						break;
					}
					case EVENT_ANIM_PART_04:
					{
						me->HandleEmoteCommand(EMOTE_ONESHOT_POINT);
						m_events.ScheduleEvent(EVENT_ANIM_PART_05, 2500);
						break;
					}
					case EVENT_ANIM_PART_05:
					{
						Talk(1); // That should do the job
						m_events.ScheduleEvent(EVENT_ANIM_PART_06, 250);
						break;
					}
					case EVENT_ANIM_PART_06:
					{
						if (Creature* target = Unit::GetCreature(*me, m_targetGUID))
						{
							target->AddAura(SPELL_RISEN_DEAD_TRANSFORM, target);
							target->CastSpell(target, SPELL_RISEN_DEAD_TRANSFORM);
							target->SetDisplayId(36775);
							target->SetByteFlag(UNIT_FIELD_ANIM_TIER, 0, UNIT_STAND_STATE_STAND);
							m_events.ScheduleEvent(EVENT_ANIM_PART_07, 2500);
						}
						break;
					}
					case EVENT_ANIM_PART_07:
					{
						if (Creature* target = Unit::GetCreature(*me, m_targetGUID))
						{
							target->HandleEmoteCommand(EMOTE_ONESHOT_TALK);
							target->AI()->Talk(0); // T-thank you, Undert-t-taker
							m_events.ScheduleEvent(EVENT_ANIM_PART_08, 3750);
						}
						break;
					}
					case EVENT_ANIM_PART_08:
					{
						if (Creature* target = Unit::GetCreature(*me, m_targetGUID))
						{
							target->HandleEmoteCommand(EMOTE_ONESHOT_SALUTE);
							m_events.ScheduleEvent(EVENT_ANIM_PART_09, 2500);
						}
						break;
					}
					case EVENT_ANIM_PART_09:
					{
						if (Creature* target = Unit::GetCreature(*me, m_targetGUID))
						{
							target->GetMotionMaster()->MovePath(5041401, false); // Risen Dead Path
							m_events.ScheduleEvent(EVENT_ANIM_PART_10, 20000);
							m_events.RescheduleEvent(EVENT_START_ANIM, urand(50000, 70000));
							m_events.RescheduleEvent(EVENT_MASTER_RESET, 150000);
						}
						break;
					}
					case EVENT_ANIM_PART_10:
					{
						if (Creature* target = Unit::GetCreature(*me, m_targetGUID))
						{
							target->DespawnOrUnsummon();
						}
						break;
					}
				}
			}
		}
	};

	CreatureAI* GetAI(Creature* pCreature) const
	{
		return new npc_undertaker_mordoAI(pCreature);
	}
};

/// Darnell - 49141
class npc_darnell_49141 : public CreatureScript
{
public:
	npc_darnell_49141() : CreatureScript("npc_darnell_49141") { }

	enum ePlaceDescription
	{
		Unknown = 0,
		Outsite,
		Entrance,
		Stairs1,
		Stairs2,
		Ground,
	};

	enum eData
	{
		QUEST_THE_SHADOW_GRAVE		= 28608,
		ITEM_CORPSE_STITCHING_TWINE	= 64581,
		ITEM_THICK_EMBALMING_FLUID	= 64582
	};

	struct npc_darnell_49141AI : public ScriptedAI
	{
		npc_darnell_49141AI(Creature* p_Creature) : ScriptedAI(p_Creature) {}

		void Reset()  override
		{
			m_timer = urand(30000, 45000);
			m_phase = 0;
			m_modus = 0;

			if (Unit* npc = me->GetCharmerOrOwner())
				if (m_player = npc->ToPlayer())
					if (m_player->GetQuestStatus(QUEST_THE_SHADOW_GRAVE) == QUEST_STATUS_INCOMPLETE)
					{
						m_modus = 1;
						m_phase = 1;
						m_timer = 1000;
						m_counter = 0;
						m_path = 0;
						m_FoundGround = false;
						m_ItemsFound = false;
						m_player->GetPosition(&m_OldPosition);
						m_player->GetPosition(&m_player_pos);
						m_player_area = m_player->GetAreaId();
						Talk(0); // Greetings
					}
		}

		void MovementInform(uint32 type, uint32 id) override
		{
			if (!CheckPlayerValid())
				return;

			if (type == POINT_MOTION_TYPE)
				m_arrived = true;
		}

		void MoveInLineOfSight(Unit* who) override
		{
			if (who->GetGUID() != m_player->GetGUID())
				return;

			who->GetPosition(&m_OldPosition);
			m_player_area = who->GetAreaId();

			if (m_modus == 1 && me->GetMotionMaster()->GetCurrentMovementGeneratorType() != FOLLOW_MOTION_TYPE)
				if (m_arrived)
					if (me->GetDistance(m_player) < 4.0f)
						me->GetMotionMaster()->MoveFollow(m_player, 0.0f, 0.0f);
		}

		void UpdateAI(uint32 diff) override
		{
			if (!CheckPlayerValid())
				return;

			if (m_timer <= diff)
			{
				m_timer = 1000;
				DoWork();
			}
			else m_timer -= diff;
		}

		void DoWork()
		{
			if (m_FoundGround)
			{
				SearchOnGround();
				return;
			}

			switch (GetPlaceDescription())
			{
			case ePlaceDescription::Outsite:
				InviteToFollow();
				break;
			case ePlaceDescription::Entrance:
				InviteToFollowDeeper1();
				break;
			case ePlaceDescription::Stairs1:
				InviteToFollowDeeper2();
				break;
			case ePlaceDescription::Stairs2:
				InviteToFollowToGround();
				break;
			case ePlaceDescription::Ground:
				SearchOnGround();
				break;
			}
		}

		void InviteToFollow()
		{
			m_counter++;
			if (GetMovedPlayerDistance() > 1.0f)
				m_counter = 0;

			if (m_counter >= 10)
			{
				Talk(1); // The shadow grave is in this direction.
				me->GetMotionMaster()->MovePoint(1, 1665.368896f, 1662.722656f, 141.850983f);
				m_path = 1;
				m_arrived = false;
				m_counter = 0;
			}
		}

		void InviteToFollowDeeper1()
		{
			m_counter++;
			if (GetMovedPlayerDistance() > 1.0f)
				m_counter = 0;

			if (m_counter >= 10)
			{
				Talk(2); // This way!
				me->GetMotionMaster()->MovePoint(2, 1642.761963f, 1662.547729f, 132.477753f);
				m_path = 2;
				m_arrived = false;
				m_counter = 0;
			}
		}

		void InviteToFollowDeeper2()
		{
			m_counter++;
			if (GetMovedPlayerDistance() > 1.0f)
				m_counter = 0;

			if (m_counter >= 10)
			{
				Talk(2); // This way!
				me->GetMotionMaster()->MovePoint(3, 1642.498779f, 1677.809937f, 126.932129f);
				m_path = 3;
				m_arrived = false;
				m_counter = 0;
			}
		}

		void InviteToFollowToGround()
		{
			m_counter++;
			if (GetMovedPlayerDistance() > 1.0f)
				m_counter = 0;

			if (m_counter >= 10)
			{
				Talk(2); // This way!
				me->GetMotionMaster()->MovePoint(4, 1656.714478f, 1678.538330f, 120.718788f);
				m_path = 4;
				m_arrived = false;
				m_counter = 0;
			}
		}

		void SearchOnGround()
		{
			if (CheckPlayerFoundItems())
			{
				if (m_ItemsFound == false)
				{
					m_ItemsFound = true;
					Talk(5); // Nice work, you've found them
					m_timer = 10000;
					return;
				}
				else
				{
					//me->DespawnOrUnsummon(0);
					return;
				}
			}


			switch (m_modus)
			{
			case 2:
				MoveToCenter();
				break;
			case 3: // Move to a random corner
				MoveToRandomCorner();
				break;
			case 4: // Say random text
				SearchingOnCorner();
				break;
			case 5: // Player found items
				break;
			default:
				m_modus = 2;
				break;
			}
		}

		void MoveToCenter()
		{
			if (m_path != 8)
			{
				me->GetMotionMaster()->MovePoint(8, 1664.128052f, 1679.201294f, 120.530205f);
				m_arrived = false;
				m_path = 8;
			}
			else if (m_arrived == false)
			{
			}
			else
			{
				m_modus = 3;
			}
		}

		void MoveToRandomCorner()
		{
			if (m_path == 8)
			{
				switch (urand(1, 4))
				{
				case 1:
					me->GetMotionMaster()->MovePoint(4, 1663.849609f, 1694.495239f, 120.719284f);
					m_arrived = false;
					m_path = 4;
					break;
				case 2:
					me->GetMotionMaster()->MovePoint(5, 1672.939331f, 1668.029541f, 120.719307f);
					m_arrived = false;
					m_path = 5;
					break;
				case 3:
					me->GetMotionMaster()->MovePoint(6, 1656.963379f, 1667.456299f, 120.719093f);
					m_arrived = false;
					m_path = 6;
					break;
				case 4:
					me->GetMotionMaster()->MovePoint(7, 1656.098999f, 1688.312866f, 120.719093f);
					m_arrived = false;
					m_path = 7;
					break;
				}
			}
			else if (m_arrived == false)
			{
			}
			else
			{
				m_modus = 4;
			}
		}

		void SearchingOnCorner()
		{
			Talk(urand(3, 4));
			m_timer = 6000;
			m_modus = 2;
		}

		bool CheckPlayerFoundItems()
		{
			if (m_player->HasItemCount(ITEM_THICK_EMBALMING_FLUID) && m_player->HasItemCount(ITEM_CORPSE_STITCHING_TWINE))
				return true;

			return false;
		}

		bool CheckPlayerValid()
		{
			if (!m_player->IsInWorld() ||
				m_player->isDead() ||
				m_player->GetQuestStatus(QUEST_THE_SHADOW_GRAVE) != QUEST_STATUS_INCOMPLETE ||
				(m_player->GetAreaId() != 5692 && m_player->GetAreaId() != 2117)) // Deathknell area id
			{
				me->DespawnOrUnsummon(); return false;
			}

			return true;
		}

		ePlaceDescription GetPlaceDescription()
		{
			switch (m_player_area)
			{
			case 5692:
				return ePlaceDescription::Outsite;
			case 2117:
			{
				if (m_player_pos.GetPositionZ() < 123.0)
				{
					m_FoundGround = true;
					return ePlaceDescription::Ground;
				}

				if (m_player_pos.GetPositionZ() < 127.0)
					return ePlaceDescription::Stairs2;

				if (m_player_pos.GetPositionZ() < 133.0)
					return ePlaceDescription::Stairs1;

				return ePlaceDescription::Entrance;
			}
			default:
				return ePlaceDescription::Unknown;
			}
		}

		float GetMovedPlayerDistance()
		{
			float dist = m_player->GetDistance(m_OldPosition);
			m_player->GetPosition(&m_OldPosition);
			return dist;
		}

	private:
		bool m_arrived;
		uint32 m_counter;
		Position m_OldPosition;
		Position m_player_pos;
		uint32 m_player_area;
		uint8 m_path;
		uint8 m_modus;
		uint32 m_timer;
		uint32 m_phase;
		Player* m_player;
		bool m_FoundGround;
		bool m_ItemsFound;
	};

	CreatureAI* GetAI(Creature* pCreature) const
	{
		return new npc_darnell_49141AI(pCreature);
	}
};





/// Mindless Zombie - 1501
class npc_mindless_zombie : public CreatureScript
{
public:
	npc_mindless_zombie() : CreatureScript("npc_mindless_zombie") { }


	enum eSpells
	{
		SPELL_ENRAGE = 44427
	};

	struct npc_mindless_zombieAI : public ScriptedAI
	{
		npc_mindless_zombieAI(Creature *c) : ScriptedAI(c) { }

		uint32 Timer;
		uint32 Step;

		void Reset()
		{
			me->RemoveAllAuras();
			Timer = urand(20000, 45000);
		}

		void UpdateAI(const uint32 diff)
		{
			if (!me->isInCombat()) // Check if not in combat
			{
				if (Timer <= diff)
				{
					Timer = urand(18000, 43000); // Change timer before calling function in order to reset it.
					Crazed();
				}
				else Timer -= diff;
			}
			DoMeleeAttackIfReady();
		}

		void Crazed()
		{
			if (Player* p_Player = me->FindNearestPlayer(15.0f, true))
			{
				me->SetFacingToObject(p_Player);
				me->CastSpell(me, SPELL_ENRAGE, true);
				me->SetWalk(false); // Activate Run
				me->GetMotionMaster()->MovePoint(0, p_Player->GetPositionX(), p_Player->GetPositionY(), p_Player->GetPositionZ());
			}
		}
	};

	CreatureAI* GetAI(Creature* pCreature) const
	{
		return new npc_mindless_zombieAI(pCreature);
	}
};


/// Deathguard Saltain - 1740
class npc_deathguard_saltain : public CreatureScript
{
public:
	npc_deathguard_saltain() : CreatureScript("npc_deathguard_saltain") { }

	bool OnQuestAccept(Player* player, Creature* /*creature*/, Quest const* quest)
	{
		if (quest->GetQuestId() == 26800)
		{
			player->CastSpell(player, 91938);
		}

		return false;
	}

	bool OnQuestReward(Player* player, Creature* creature, Quest const* quest, uint32 /*opt*/)
	{
		switch (quest->GetQuestId())
		{
		case 26800:
		{
			if (Creature* darnell = GetDarnell(player))
				if (Vehicle* npc = darnell->GetVehicleKit())
				{
					npc->RemoveAllPassengers();
					darnell->DespawnOrUnsummon(1000);
				}

			break;
		}
		}
		return false;
	}

	Creature* GetDarnell(Player* player)
	{
		for (Unit::ControlList::const_iterator itr = player->m_Controlled.begin(); itr != player->m_Controlled.end(); ++itr)
			if ((*itr)->GetEntry() == 49337)
				return (*itr)->ToCreature();

		return nullptr;
	}
};

/// Darnell - 49337
class npc_darnell_49337 : public CreatureScript
{
public:
	npc_darnell_49337() : CreatureScript("npc_darnell_49337") { }

	enum eQuest
	{
		NPC_SCARLET_CORPSE_49340 = 49340,
	};

	struct npc_darnell_49337AI : public VehicleAI
	{
		npc_darnell_49337AI(Creature *c) : VehicleAI(c) { }

		uint8 m_seat;
		uint64 m_scarletGUID;

		void Reset()  override
		{
			m_seat = 0;
			m_scarletGUID = 0;
		}

		void PassengerBoarded(Unit* passenger, int8 seatId, bool apply) override
		{
			if (!apply)
				if (Creature* scarlet = passenger->ToCreature())
				{
					scarlet->SetDisableGravity(false);
					scarlet->DespawnOrUnsummon(500);
				}
		}

		void SetGUID(uint64 guid, int32 id) override
		{
			switch (id)
			{
			case NPC_SCARLET_CORPSE_49340:
			{
				m_scarletGUID = guid;
				break;
			}
			}
		}

		void DoAction(int32 param) override
		{
			if (param == 1)
				if (Creature* scarlet = ObjectAccessor::GetCreature(*me, m_scarletGUID))
				{
					me->CastSpell(scarlet, 91945, true);
					scarlet->AddAura(46598, scarlet);
					scarlet->SetDisableGravity(true);
					scarlet->EnterVehicle(me, m_seat);
					m_seat++;
					me->CastSpell(scarlet, 91935, true);
				}
		}
	};

	CreatureAI* GetAI(Creature* pCreature) const
	{
		return new npc_darnell_49337AI(pCreature);
	}
};

/// Scarlet Corpse - 49340
class npc_scarlet_corpse_49340 : public CreatureScript
{
public:
	npc_scarlet_corpse_49340() : CreatureScript("npc_scarlet_corpse_49340") { }

	struct npc_scarlet_corpse_49340AI : public ScriptedAI
	{
		npc_scarlet_corpse_49340AI(Creature *c) : ScriptedAI(c) {}

		void SpellHit(Unit* caster, SpellInfo const* spell) override
		{
			if (Player* player = caster->ToPlayer())
				if (player->GetQuestStatus(26800) == QUEST_STATUS_INCOMPLETE)
					if (Creature* darnell = GetDarnell(player))
					{
						darnell->AI()->SetGUID(me->GetGUID(), me->GetEntry());
						darnell->AI()->DoAction(1);
					}
		}

		Creature* GetDarnell(Player* player)
		{
			for (Unit::ControlList::const_iterator itr = player->m_Controlled.begin(); itr != player->m_Controlled.end(); ++itr)
				if ((*itr)->GetEntry() == 49337)
					return (*itr)->ToCreature();

			return nullptr;
		}
	};

	CreatureAI* GetAI(Creature* pCreature) const
	{
		return new npc_scarlet_corpse_49340AI(pCreature);
	}
};

/// Lilian Voss - 38910
class npc_lilian_voss_38910 : public CreatureScript
{
public:
	npc_lilian_voss_38910() : CreatureScript("npc_lilian_voss_38910") { }

	bool OnGossipSelect(Player* player, Creature* creature, uint32 sender, uint32 action) override
	{
		uint32 id = player->PlayerTalkClass->GetGossipMenu().GetMenuId();
		if (player->GetReqKillOrCastCurrentCount(24961, 38910) == 0)
			if (player->GetQuestStatus(24961) == QUEST_STATUS_INCOMPLETE && id == 15486)
			{
				player->PlayerTalkClass->SendCloseGossip();
				CAST_AI(npc_lilian_voss_38910AI, creature->AI())->StartAnim(player);
				return false;
			}

		return false;
	}

	struct npc_lilian_voss_38910AI : public ScriptedAI
	{
		npc_lilian_voss_38910AI(Creature *c) : ScriptedAI(c) { }

		uint32 m_timer;
		uint32 m_phase;
		Player* m_player;

		void Reset()  override
		{
			m_timer = 0;
			m_phase = 0;
			m_player = nullptr;
		}

		void StartAnim(Player* player)
		{
			if (!m_phase)
			{
				m_player = player;
				m_phase = 1;
				m_timer = 100;
			}
		}

		void UpdateAI(uint32 diff) override
		{
			if (m_timer <= diff)
			{
				m_timer = 1000;
				DoWork();
			}
			else m_timer -= diff;
		}

		void DoWork()
		{
			switch (m_phase)
			{
			case 1:

				m_timer = 2000;
				m_phase = 2;
				break;
			case 2:
				Talk(0);
				if (m_player)
					m_player->KilledMonsterCredit(38910);

				m_timer = 5000;
				m_phase = 3;
				break;
			case 3:
				me->GetMotionMaster()->MovePath(3891001, false);
				m_timer = 10000;
				m_phase = 4;
				break;
			case 4:
				me->DespawnOrUnsummon();
				m_timer = 0;
				m_phase = 0;
				break;
			}
		}
	};

	CreatureAI* GetAI(Creature* pCreature) const
	{
		return new npc_lilian_voss_38910AI(pCreature);
	}
};

/// Rotbrain Berserker - 49422: Fight
class npc_rotbrain_berserker : public CreatureScript
{
public:
	npc_rotbrain_berserker() : CreatureScript("npc_rotbrain_berserker") { }

	struct npc_rotbrain_berserkerAI : public ScriptedAI
	{
		npc_rotbrain_berserkerAI(Creature *c) : ScriptedAI(c) { }

		uint32 m_timer;
		uint32 m_phase;
		float m_health;

		void Reset()  override
		{
			m_timer = 1000;
			m_phase = 0;
			m_health = frand(60.0f, 95.0f);
		}

		void DamageTaken(Unit* attacker, uint32& damage, SpellInfo const*  /*p_SpellInfo*/) override
		{
			if (attacker->GetEntry() == 49428 && me->GetHealthPct() < m_health)
				damage = 0;
		}

		void UpdateAI(uint32 diff) override
		{
			if (m_timer <= diff)
			{
				m_timer = 1000;
				DoWork();
			}
			else m_timer -= diff;

			if (UpdateVictim())
				DoMeleeAttackIfReady();
		}

		void DoWork()
		{
			if (me->isInCombat())
				return;

			if (Creature* guard = me->FindNearestCreature(49428, 4.0f, true))
			{
				me->Attack(guard, true);
				guard->Attack(me, true);
			}
		}
	};

	CreatureAI* GetAI(Creature* pCreature) const
	{
		return new npc_rotbrain_berserkerAI(pCreature);
	}
};

/// Rotbrain Magus - 49423: Fight
class npc_rotbrain_magus : public CreatureScript
{
public:
	npc_rotbrain_magus() : CreatureScript("npc_rotbrain_magus") { }

	struct npc_rotbrain_magusAI : public ScriptedAI
	{
		npc_rotbrain_magusAI(Creature *c) : ScriptedAI(c) { }

		uint32 m_timer;
		uint32 m_phase;
		float m_health;

		void Reset()  override
		{
			m_timer = 1000;
			m_phase = 0;
			m_health = frand(60.0f, 95.0f);
		}

		void DamageTaken(Unit* attacker, uint32& damage, SpellInfo const*  /*p_SpellInfo*/) override
		{
			if (attacker->GetEntry() == 49428 && me->GetHealthPct() < m_health)
				damage = 0;
		}

		void UpdateAI(uint32 diff) override
		{
			if (m_timer <= diff)
			{
				m_timer = 1000;
				DoWork();
			}
			else m_timer -= diff;

			if (UpdateVictim())
				DoMeleeAttackIfReady();
		}

		void DoWork()
		{
			if (me->isInCombat())
				return;

			if (Creature* guard = me->FindNearestCreature(49428, 4.0f, true))
			{
				me->Attack(guard, true);
				guard->Attack(me, true);
			}
		}
	};

	CreatureAI* GetAI(Creature* pCreature) const
	{
		return new npc_rotbrain_magusAI(pCreature);
	}
};

/// Marshal Redpath - 49424: Fight
class npc_marshal_redpath : public CreatureScript
{
public:
	npc_marshal_redpath() : CreatureScript("npc_marshal_redpath") { }

	struct npc_marshal_redpathAI : public ScriptedAI
	{
		npc_marshal_redpathAI(Creature *c) : ScriptedAI(c) { }

		uint32 m_timer;
		uint32 m_phase;
		float m_health;

		void Reset()  override
		{
			m_timer = 1000;
			m_phase = 0;
			m_health = frand(60.0f, 95.0f);
		}

		void DamageTaken(Unit* attacker, uint32& damage, SpellInfo const*  /*p_SpellInfo*/) override
		{
			if (attacker->GetEntry() == 49428 && me->GetHealthPct() < m_health)
				damage = 0;
		}

		void UpdateAI(uint32 diff) override
		{
			if (m_timer <= diff)
			{
				m_timer = 1000;
				DoWork();
			}
			else m_timer -= diff;

			if (UpdateVictim())
				DoMeleeAttackIfReady();
		}

		void DoWork()
		{
			if (me->isInCombat())
				return;

			if (Creature* guard = me->FindNearestCreature(49428, 4.0f, true))
			{
				me->Attack(guard, true);
				guard->Attack(me, true);
			}
		}
	};

	CreatureAI* GetAI(Creature* pCreature) const
	{
		return new npc_marshal_redpathAI(pCreature);
	}
};

/// Deathguard Protector - 49428: Fight
class npc_deathguard_protector : public CreatureScript
{
public:
	npc_deathguard_protector() : CreatureScript("npc_deathguard_protector") { }

	struct npc_deathguard_protectorAI : public ScriptedAI
	{
		npc_deathguard_protectorAI(Creature *c) : ScriptedAI(c) { }

		uint32 m_timer;
		uint32 m_phase;
		float m_health;

		void Reset()  override
		{
			m_timer = 1000;
			m_phase = 0;
			m_health = frand(60.0f, 95.0f);
		}

		void DamageTaken(Unit* attacker, uint32& damage, SpellInfo const*  /*p_SpellInfo*/) override
		{
			if ((attacker->GetEntry() == 49422 || attacker->GetEntry() == 49423 || attacker->GetEntry() == 49424) && me->GetHealthPct() < m_health)
				damage = 0;
		}

		void UpdateAI(uint32 diff) override
		{
			if (m_timer <= diff)
			{
				m_timer = 1000;
				DoWork();
			}
			else m_timer -= diff;

			if (UpdateVictim())
				DoMeleeAttackIfReady();
		}

		void DoWork()
		{

		}
	};

	CreatureAI* GetAI(Creature* pCreature) const
	{
		return new npc_deathguard_protectorAI(pCreature);
	}
};

/// Vile Fin Puddlejumper - 1543
class npc_vile_fin_puddlejumper_1543 : public CreatureScript
{
public:
	npc_vile_fin_puddlejumper_1543() : CreatureScript("npc_vile_fin_puddlejumper_1543") { }

	enum eNPC
	{
		SPELL_MURLOC_LEACH = 73108,
		SPELL_SUMMON_PUDDLEJUMPER = 73110,
		SPELL_VILE_FIN_GUARDIAN_AURA = 94266,
	};

	struct npc_vile_fin_puddlejumper_1543AI : public ScriptedAI
	{
		npc_vile_fin_puddlejumper_1543AI(Creature* creature) : ScriptedAI(creature) { }

		uint64 m_playerGUID;

		void Reset()  override
		{
			uint64 m_playerGUID = 0;
		}

		void DamageTaken(Unit* attacker, uint32& damage)
		{
			if (Player* player = attacker->ToPlayer())
				if (me->GetHealthPct() <= 15.0f)
				{
					Talk(0);
					me->GetMotionMaster()->MoveIdle();
					me->GetMotionMaster()->MoveFleeing(player);
				}
		}
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_vile_fin_puddlejumper_1543AI(creature);
	}
};

/// Vile Fin Minor Oracle - 1544
class npc_vile_fin_minor_oracle_1544 : public CreatureScript
{
public:
	npc_vile_fin_minor_oracle_1544() : CreatureScript("npc_vile_fin_minor_oracle_1544") { }

	enum eNPC
	{
		SPELL_MURLOC_LEACH = 73108,
		SPELL_SUMMON_ORACLE = 73434,
		SPELL_VILE_FIN_GUARDIAN_AURA = 94266,
	};

	struct npc_vile_fin_minor_oracle_1544AI : public ScriptedAI
	{
		npc_vile_fin_minor_oracle_1544AI(Creature* creature) : ScriptedAI(creature) { }

		uint64 m_playerGUID;

		void Reset()  override
		{
			uint64 m_playerGUID = 0;
		}

		void DamageTaken(Unit* attacker, uint32& damage)
		{
			if (Player* player = attacker->ToPlayer())
				if (me->GetHealthPct() <= 15.0f)
				{
					Talk(0);
					me->GetMotionMaster()->MoveIdle();
					me->GetMotionMaster()->MoveFleeing(player);
				}
		}
	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_vile_fin_minor_oracle_1544AI(creature);
	}
};

/// Spell: Murloc Leash - 73108
class spell_murloc_leash_73108 : public SpellScriptLoader
{
public:
	spell_murloc_leash_73108() : SpellScriptLoader("spell_murloc_leash_73108") { }

	enum eSpell
	{
		NPC_CAPTURED_PUDDLEJUMPER = 38923,
		NPC_CAPTURED_ORACLE = 39078,
		NPC_PUDDLEJUMPER = 1543,
		NPC_MINOR_ORACLE = 1544,
		SPELL_SUMMON_PUDDLEJUMPER = 73110,
		SPELL_SUMMON_ORACLE = 73434,
	};

	class spell_murloc_leash_73108_SpellScript : public SpellScript
	{
		PrepareSpellScript(spell_murloc_leash_73108_SpellScript);

		SpellCastResult CheckRequirement()
		{
			std::list<uint32>targets;
			targets.push_back(NPC_CAPTURED_PUDDLEJUMPER);
			targets.push_back(NPC_CAPTURED_ORACLE);

			if (Player* player = GetCaster()->ToPlayer())
			{
				std::list<Creature*> npcs;
				for (auto itr : targets)
				{
					Creature* creature = player->FindNearestCreature(itr, 10.0f, true);
					if (creature)
						npcs.push_back(creature);
				}
				if (npcs.size() > 0)
					return SPELL_FAILED_CANT_DO_THAT_RIGHT_NOW;
			}

			if (Unit* unit = GetExplTargetUnit())
				if (unit->GetEntry() == NPC_PUDDLEJUMPER || unit->GetEntry() == NPC_MINOR_ORACLE)
				{
					if (unit->GetHealthPct() < 80.0f)
						return SPELL_CAST_OK;
				}
				else
					return SPELL_FAILED_BAD_TARGETS;

			return SPELL_FAILED_CANT_DO_THAT_RIGHT_NOW;
		}

		void CheckTarget(WorldObject*& target)
		{
			if (Creature* npc = target->ToCreature())
				if (npc->GetEntry() == NPC_PUDDLEJUMPER || npc->GetEntry() == NPC_MINOR_ORACLE)
					if (npc->GetHealthPct() < 80.0f)
						return;
			target = nullptr;
		}

		void ApplyBeforeCast()
		{
			if (Player* player = GetCaster()->ToPlayer())
				if (Unit* unit = GetExplTargetUnit())
					if (Creature* npc = unit->ToCreature())
					{
						if (npc->GetEntry() == NPC_PUDDLEJUMPER)
							player->CastSpell(player, SPELL_SUMMON_PUDDLEJUMPER);
						else if (npc->GetEntry() == NPC_MINOR_ORACLE)
							player->CastSpell(player, SPELL_SUMMON_ORACLE);
						npc->DespawnOrUnsummon(1);
					}
		}

		void Register()
		{
			BeforeCast += SpellCastFn(spell_murloc_leash_73108_SpellScript::ApplyBeforeCast);
			OnCheckCast += SpellCheckCastFn(spell_murloc_leash_73108_SpellScript::CheckRequirement);
			OnObjectTargetSelect += SpellObjectTargetSelectFn(spell_murloc_leash_73108_SpellScript::CheckTarget, EFFECT_0, TARGET_UNIT_TARGET_ANY);
		}
	};

	SpellScript* GetSpellScript() const
	{
		return new spell_murloc_leash_73108_SpellScript();
	}
};

/// Captured Vile Fin Puddlejumper - 38923
class npc_captured_vile_fin_puddlejumper_38923 : public CreatureScript
{
public:
	npc_captured_vile_fin_puddlejumper_38923() : CreatureScript("npc_captured_vile_fin_puddlejumper_38923") { }

	enum eNPC
	{
		NPC_CAPTURE_MURLOC_CREDIT = 38923,
		SPELL_VILE_FIN_GUARDIAN_AURA = 94266,
		EVENT_CHECK_PLAYER = 101,
	};

	struct npc_captured_vile_fin_puddlejumper_38923AI : public ScriptedAI
	{
		npc_captured_vile_fin_puddlejumper_38923AI(Creature* creature) : ScriptedAI(creature) { }

		EventMap m_events;
		uint64 m_playerGUID;

		void Reset()  override
		{
			m_events.Reset();
			m_events.ScheduleEvent(EVENT_CHECK_PLAYER, 1000);
			uint64 m_playerGUID = 0;
		}

		void IsSummonedBy(Unit* summoner) override
		{
			if (Player* player = summoner->ToPlayer())
			{
				m_playerGUID = player->GetGUID();
				player->KilledMonsterCredit(NPC_CAPTURE_MURLOC_CREDIT);
				me->GetMotionMaster()->MoveFollow(player, 4.0f, 3.14f);
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PC | UNIT_FLAG_IMMUNE_TO_NPC);
			}
		}
	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_captured_vile_fin_puddlejumper_38923AI(creature);
	}
};

/// Captured Vile Fin Minor Oracle - 39078
class npc_captured_vile_fin_minor_oracle_39078 : public CreatureScript
{
public:
	npc_captured_vile_fin_minor_oracle_39078() : CreatureScript("npc_captured_vile_fin_minor_oracle_39078") { }

	enum eNPC
	{
		NPC_CAPTURE_MURLOC_CREDIT = 38923,
		SPELL_VILE_FIN_GUARDIAN_AURA = 94266,
		EVENT_CHECK_PLAYER = 101,
	};

	struct npc_captured_vile_fin_minor_oracle_39078AI : public ScriptedAI
	{
		npc_captured_vile_fin_minor_oracle_39078AI(Creature* creature) : ScriptedAI(creature) { }

		EventMap m_events;
		uint64 m_playerGUID;

		void Reset()  override
		{
			m_events.Reset();
			m_events.ScheduleEvent(EVENT_CHECK_PLAYER, 1000);
			uint64 m_playerGUID = 0;
		}

		void IsSummonedBy(Unit* summoner) override
		{
			if (Player* player = summoner->ToPlayer())
			{
				m_playerGUID = player->GetGUID();
				player->KilledMonsterCredit(NPC_CAPTURE_MURLOC_CREDIT);
				me->GetMotionMaster()->MoveFollow(player, 4.0f, 3.14f);
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PC | UNIT_FLAG_IMMUNE_TO_NPC);
			}
		}
	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_captured_vile_fin_minor_oracle_39078AI(creature);
	}
};

/// Sedrick Calston - 38925
class npc_sedrick_calston_38925 : public CreatureScript
{
public:
	npc_sedrick_calston_38925() : CreatureScript("npc_sedrick_calston_38925") { }

	enum eNPC
	{
		NPC_CAPTURED_PUDDLEJUMPER = 38923,
		NPC_CAPTURED_ORACLE = 39078,
		NPC_CAPTURE_MURLOC_CREDIT = 38923,
		NPC_DELIVERED_MURLOC_CREDIT = 38887,
		QUEST_EVER_SO_LONELY = 24974,
		SPELL_VILE_FIN_GUARDIAN_AURA = 94266,
		EVENT_CHECK_PLAYER = 101,
	};

	struct npc_sedrick_calston_38925AI : public ScriptedAI
	{
		npc_sedrick_calston_38925AI(Creature* creature) : ScriptedAI(creature) { }

		EventMap m_events;

		void Reset() override
		{
			m_events.Reset();
			m_events.ScheduleEvent(EVENT_CHECK_PLAYER, 1000);
		}

		void UpdateAI(uint32 diff) override
		{
			m_events.Update(diff);

			while (uint32 eventId = m_events.ExecuteEvent())
			{
				switch (eventId)
				{
				case EVENT_CHECK_PLAYER:
				{
					if (Player* player = me->FindNearestPlayer(7.0f))
						if (player->GetQuestStatus(QUEST_EVER_SO_LONELY) == QUEST_STATUS_INCOMPLETE)
							if (player->GetReqKillOrCastCurrentCount(QUEST_EVER_SO_LONELY, NPC_CAPTURE_MURLOC_CREDIT) > 0)
							{
								std::list<uint32>targets;
								targets.push_back(NPC_CAPTURED_PUDDLEJUMPER);
								targets.push_back(NPC_CAPTURED_ORACLE);

								std::list<Creature*> npcs;
								for (auto itr : targets)
								{
									Creature* creature = player->FindNearestCreature(itr, 10.0f, true);
									if (creature)
										npcs.push_back(creature);
								}

								if (npcs.size() > 0)
								{
									player->RemoveAura(SPELL_VILE_FIN_GUARDIAN_AURA);
									player->KilledMonsterCredit(NPC_DELIVERED_MURLOC_CREDIT);

									for (std::list<Creature*>::iterator itr = npcs.begin(); itr != npcs.end(); ++itr)
										(*itr)->DespawnOrUnsummon(1);
								}
							}

					m_events.ScheduleEvent(EVENT_CHECK_PLAYER, 1000);
					break;
				}
				}
			}

			if (!UpdateVictim())
				return;
			else
				DoMeleeAttackIfReady();
		}
	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_sedrick_calston_38925AI(creature);
	}
};



/// Quest: The Grasp Weakens
/// Shadow Priestess Malia - 39117

enum eMoves
{
	MaxMaliaMovesUpstairs = 7,
	MaxMaliaMovesDownstairs = 6,
};

static std::array<G3D::Vector3, eMoves::MaxMaliaMovesUpstairs> g_MaliaUpstairsMoves =
{
	{
		{ 2242.7346f, 232.5853f, 34.5100f },
		{ 2239.8813f, 232.0589f, 35.0564f },
		{ 2236.0791f, 230.8876f, 37.8736f },
		{ 2233.6135f, 230.2802f, 38.2311f },
		{ 2234.5481f, 227.9291f, 38.2307f },
		{ 2235.6494f, 225.7424f, 38.2285f },
		{ 2243.6428f, 228.1870f, 41.8121f }
	}
};

static std::array<G3D::Vector3, eMoves::MaxMaliaMovesDownstairs> g_MaliaDownstairsMoves =
{
	{
		{ 2239.9856f, 227.4472f, 40.5082f },
		{ 2235.3118f, 226.0666f, 38.2310f },
		{ 2234.1028f, 230.0383f, 38.2217f },
		{ 2238.0427f, 231.7776f, 36.3362f },
		{ 2241.3320f, 233.3963f, 34.5099f },
		{ 2242.28f, 230.375f, 34.5098f	  }
	}
};

class npc_shadow_priestess_malia_39117 : public CreatureScript
{
public:
	npc_shadow_priestess_malia_39117() : CreatureScript("npc_shadow_priestess_malia_39117") { }

	enum eData
	{
		// Quest
		QUEST_THE_GRASP_WEAKENS = 25006,

		// Npcs
		NPC_SPIRIT_OF_DEVLIN_AGAMAND_38980 = 38980,
		NPC_SHADOW_OF_AGAMAND_38981 = 38981,
		NPC_SHADOW_OF_AGAMAND_38983 = 38983,

		// Data
		PLAYER_GUID = 99999,

		// Waypoints in Waypoint_data
		WAYPOINT_UPSTAIRS = 3702201,
		WAYPOINT_DOWNSTAIRS = 3702202,

		// Actions and events
		ACTION_START_ANIM = 100,
		EVENT_CHECK_MASTERRESET = 101,
		EVENT_START_ANIM,
		EVENT_ANIM,

		// Gossip Menu
		MALIA_GOSSIP_MENU		= 11156,
		MALIA_GOSSIP_OPTION		= 0,
		MALIA_NPC_TEXT_NO_QUEST	= 15526,
		MALIA_NPC_TEXT_QUEST	= 15527,


	};

	bool OnGossipHello(Player* player, Creature* creature)
	{
		if (player->GetQuestStatus(QUEST_THE_GRASP_WEAKENS) == QUEST_STATUS_INCOMPLETE)
		{
			player->ADD_GOSSIP_ITEM_DB(MALIA_GOSSIP_MENU, MALIA_GOSSIP_OPTION, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
			player->SEND_GOSSIP_MENU(MALIA_NPC_TEXT_QUEST, creature->GetGUID());
			return true;
		}
		player->SEND_GOSSIP_MENU(MALIA_NPC_TEXT_NO_QUEST, creature->GetGUID());
		return true;
	}

	bool OnGossipSelect(Player* player, Creature* creature, uint32 sender, uint32 action) override
	{
		switch (action)
		{
		case GOSSIP_ACTION_INFO_DEF + 1:
			creature->AI()->SetGUID(player->GetGUID(), PLAYER_GUID);
			creature->AI()->DoAction(ACTION_START_ANIM);
			break;
		}
		player->CLOSE_GOSSIP_MENU();

		return true;
	}

	struct npc_shadow_priestess_malia_39117AI : public ScriptedAI
	{
		npc_shadow_priestess_malia_39117AI(Creature* creature) : ScriptedAI(creature) { }

		EventMap m_events;
		uint64   m_playerGUID;
		uint64   m_spiritAgamand;
		uint64   m_shadowAgamand1;
		uint64   m_shadowAgamand2;
		bool     m_animStarted;
		uint32   m_phase;
		uint32   m_sayPriestess;
		uint32   m_sayAgamand;

		void Reset() override
		{
			m_events.Reset();
			m_playerGUID = 0;
			m_spiritAgamand = 0;
			m_shadowAgamand1 = 0;
			m_shadowAgamand2 = 0;
			m_animStarted = 0;
			m_phase = 0;
			m_sayPriestess = 0;
			m_sayAgamand = 0;
		}

		void JustSummoned(Creature* summon) override
		{
			switch (summon->GetEntry())
			{
				case NPC_SPIRIT_OF_DEVLIN_AGAMAND_38980: // Spirit of Devlin
				{
					m_spiritAgamand = summon->GetGUID();
					break;
				}
				case NPC_SHADOW_OF_AGAMAND_38981: // Shadow of Devlin - Attacker
				{
					m_shadowAgamand1 = summon->GetGUID();
					summon->SetReactState(REACT_AGGRESSIVE);
					summon->SetWalk(true);
					if (Player* player = sObjectAccessor->GetPlayer(*me, m_playerGUID))
						summon->Attack(player, true);
					break;
				}
				case NPC_SHADOW_OF_AGAMAND_38983: // Shadow of Devlin - Passive
				{
					m_shadowAgamand2 = summon->GetGUID();
					summon->SetReactState(REACT_PASSIVE);
					summon->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE); // Can't select Passive
					summon->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_NPC); // Don't assist Shadow of Devlin - Attacker
					break;
				}
			}
		}

		void SummonedCreatureDies(Creature* summon, Unit* killer) override
		{
			if (summon->GetGUID() == m_shadowAgamand1) // Shadow of Devlin - Attacker
				if (killer->GetGUID() == m_playerGUID)
					m_events.ScheduleEvent(EVENT_ANIM + 7, 4000);
		}

		void MovementInform(uint32 type, uint32 id) override
		{

			if (type == EFFECT_MOTION_TYPE && id == MaxMaliaMovesUpstairs)
			{
				me->SetFacingTo(6.260189f);
				m_events.ScheduleEvent(EVENT_ANIM + 2, 1000);
			}
			if (type == EFFECT_MOTION_TYPE && id == MaxMaliaMovesDownstairs)
			{
				if (Creature* shadow = sObjectAccessor->GetCreature(*me, m_shadowAgamand2))
					shadow->DespawnOrUnsummon(1); // Despawn Shadow of Devlin - Passive
				me->SetFacingTo(0.383972f);
				me->Respawn(true, true, 1000);
				Reset();
			}	
		}

		void SetGUID(uint64 guid, int32 id) override
		{
			switch (id)
			{
				case PLAYER_GUID:
				{
					m_playerGUID = guid;
					break;
				}
			}
		}

		void DoAction(int32 param) override
		{
			if (!m_animStarted && param == ACTION_START_ANIM)
			{
				m_animStarted = true;
				m_events.ScheduleEvent(EVENT_START_ANIM, 500);
			}
		}

		void UpdateAI(uint32 diff) override
		{
			m_events.Update(diff);

			while (uint32 eventId = m_events.ExecuteEvent())
			{
				switch (eventId)
				{
					case EVENT_CHECK_MASTERRESET: // Reset event by despawning NPC
					{
						me->DespawnOrUnsummon(1);
						break;
					}
					case EVENT_START_ANIM: // Start the event (triggered by gossip selection)
					{
						me->RemoveFlag(UNIT_FIELD_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP);
						Talk(m_sayPriestess); // Talk (0) - Very well. Follow me.
						m_sayPriestess++; // Next line will be Talk(1)
						m_events.ScheduleEvent(EVENT_ANIM + 1, 2000); // Schedule event to start waypath
						m_events.ScheduleEvent(EVENT_CHECK_MASTERRESET, 120000); // Schedule event to despawn and reset event (whole event will take 2 minutes)
						break;
					}
					case EVENT_ANIM + 1:
					{
						m_phase = 1;
						me->GetMotionMaster()->MoveSmoothPath(MaxMaliaMovesUpstairs, g_MaliaUpstairsMoves.data(), g_MaliaUpstairsMoves.size(), true); // Path
						break;
					}
					case EVENT_ANIM + 2: // Priestess talk(1)
					{
						Talk(m_sayPriestess); // Talk(1) - Now it is time for us to begin
						m_sayPriestess++; // Next line will be Talk(2)
						if (m_sayPriestess < 5) // If didn't say all lines, keep talking, on 4th line (5th is not played here), move on to next event
							m_events.ScheduleEvent(EVENT_ANIM + 2, 4000);
						else
							m_events.ScheduleEvent(EVENT_ANIM + 3, 3000);
						break;
					}
					case EVENT_ANIM + 3:
					{
						me->SummonCreature(NPC_SPIRIT_OF_DEVLIN_AGAMAND_38980, 2247.13f, 228.04f, 44.2511f, 1.95477f, TEMPSUMMON_TIMED_DESPAWN, 120000); // Summon creature temporarily
						m_events.ScheduleEvent(EVENT_ANIM + 4, 2000); 
						break;
					}
					case EVENT_ANIM + 4: // Devlin tells the story
					{
						if (Creature* agamand = sObjectAccessor->GetCreature(*me, m_spiritAgamand))
							agamand->AI()->Talk(m_sayAgamand); // Talk(0) - What's going on here?
							m_sayAgamand++;
						if (m_sayAgamand < 7) // Keep talking till variable is 6 - Talk(0) up to Talk(6) - All lines - when the counter is done, the next event will be scheduled.
							m_events.ScheduleEvent(EVENT_ANIM + 4, 3000);
						else
							m_events.ScheduleEvent(EVENT_ANIM + 5, 1000); // Final line is DIE, YOU WRETCHES! and then next event is triggered
						break;
					}
					case EVENT_ANIM + 5:
					{
						me->SummonCreature(NPC_SHADOW_OF_AGAMAND_38981, 2247.13f, 228.04f, 44.2511f, 1.95477f, TEMPSUMMON_TIMED_DESPAWN, 60000); // Shadow of Devlin - Attacker
						me->SummonCreature(NPC_SHADOW_OF_AGAMAND_38983, 2247.13f, 228.04f, 44.2511f, 1.95477f, TEMPSUMMON_TIMED_DESPAWN, 60000); // Shadow of Devlin - Passive
						m_events.ScheduleEvent(EVENT_ANIM + 6, 2000);
						break;
					}
					case EVENT_ANIM + 6:
					{
						if (Creature* ShadowPassive = me->FindNearestCreature(NPC_SHADOW_OF_AGAMAND_38983, 10.0f, true))
							ShadowPassive->DespawnOrUnsummon(); // Despawn Shadow of Devlin Passive
						if (Creature* agamand = sObjectAccessor->GetCreature(*me, m_spiritAgamand))
							agamand->DespawnOrUnsummon(); // Despawn Devlin Agamand and keep the Shadows of Agamand.
						break;
					}
					case EVENT_ANIM + 7:
					{
						Talk(m_sayPriestess); // Talk(5) - I better return to my post...
						m_phase = 2;
						me->GetMotionMaster()->MoveSmoothPath(MaxMaliaMovesDownstairs, g_MaliaDownstairsMoves.data(), g_MaliaDownstairsMoves.size(), true); // Path 2
						break;
					}
				}
			}

			if (!UpdateVictim())
				return;
			else
				DoMeleeAttackIfReady();
		}
	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_shadow_priestess_malia_39117AI(creature);
	}
};


/// Lilian Voss - 39038
class npc_lilian_voss_39038 : public CreatureScript
{
public:
	npc_lilian_voss_39038() : CreatureScript("npc_lilian_voss_39038") { }

	enum eNPC
	{
		QUEST_A_DAUGHTERS_EMBRACE = 25046,
		NPC_BENEDICTUS = 39097,
		NPC_BENEDICTUS_CREDIT = 39098,
		NPC_BODYGUARD = 1660,
		NPC_MELRACHE = 1665,
		NPC_SCARLET_FRIAR = 1538,
		NPC_SCARLET_NEOPHYTE = 1539,
		NPC_SCARLET_VANGUARD = 1540,
		SPELL_SHADOWY_AURA = 73304,
		SPELL_LILIANS_BRAIN_BURST = 73307,
		SPELL_LILIANS_SHADOW_HOP = 73308,
		SPELL_LILIANS_DEATH_GRIP = 73309,
		SPELL_STRANGULATE = 78037,
		EVENT_CD_73308 = 101,
		EVENT_CD_73309,
		EVENT_CHECK_ATTACK,
		EVENT_CHECK_FATHER_SEQUENCE,
		EVENT_START_FATHER_SEQUENCE,
		EVENT_TALK_PART,
	};

	struct npc_lilian_voss_39038AI : public ScriptedAI
	{
		npc_lilian_voss_39038AI(Creature* creature) : ScriptedAI(creature) { Initialize(); }

		EventMap m_events;
		uint64 m_playerGUID;
		uint64 m_fatherGUID;
		bool   cd_73308, cd_73309;
		std::list<uint32>m_targets;
		std::list<uint32>m_father;
		bool m_fatherSequence1;

		void Initialize()
		{
			m_events.Reset();
			m_playerGUID = 0;
			m_fatherGUID = 0;
			cd_73308 = false;
			cd_73309 = false;
			m_targets.push_back(NPC_SCARLET_FRIAR);
			m_targets.push_back(NPC_SCARLET_NEOPHYTE);
			m_targets.push_back(NPC_SCARLET_VANGUARD);
			m_father.push_back(NPC_BODYGUARD);
			m_father.push_back(NPC_MELRACHE);
			m_father.push_back(NPC_BENEDICTUS);
			m_fatherSequence1 = false;
			m_events.ScheduleEvent(EVENT_CHECK_FATHER_SEQUENCE, 1000);
			m_events.ScheduleEvent(EVENT_CHECK_ATTACK, 1000);
		}

		void Reset() override
		{
			if (Player* player = sObjectAccessor->GetPlayer(*me, m_playerGUID))
			{
				me->SetSpeed(UnitMoveType::MOVE_RUN, player->GetSpeedRate(UnitMoveType::MOVE_RUN), true); // Set speed same as player's
				me->GetMotionMaster()->MoveFollow(player, 2.0f, 3.14f);
			}	
			me->SetReactState(REACT_DEFENSIVE);
		}

		void IsSummonedBy(Unit* summoner) override
		{
			if (Player* player = summoner->ToPlayer())
			{
				m_playerGUID = player->GetGUID();
				me->GetMotionMaster()->MoveFollow(player, 4.0f, 3.14f);
			}
		}

		void EnterCombat(Unit* victim)
		{
			uint8 rol = urand(0, 100);
			std::list<Creature*> npcs;
			for (auto itr : m_targets)
			{
				Creature* creature = me->FindNearestCreature(itr, 30.0f, true);
				if (creature)
					npcs.push_back(creature);
			}
			if (!cd_73309 && npcs.size() > 4)
				CastSpell_LiliansDeathGrip();
			else
				if (!cd_73308 && rol < 90)
					if (Creature* target = victim->ToCreature())
						CastSpell_LiliansShadowHop(target);
		}

		void KilledUnit(Unit* victim)
		{
			if (victim->GetCreatureType() == CREATURE_TYPE_HUMANOID)
				me->AddAura(SPELL_SHADOWY_AURA, victim);

		}

		void UpdateAI(uint32 diff) override
		{
			m_events.Update(diff);

			while (uint32 eventId = m_events.ExecuteEvent())
			{
				switch (eventId)
				{
					case EVENT_CD_73308:
					{
						cd_73308 = false;
						break;
					}
					case EVENT_CD_73309:
					{
						cd_73309 = false;
						break;
					}
					case EVENT_CHECK_ATTACK: // Check spell cds and targets, if both are good to go - cast spell on them.
					{
						if (!cd_73309 && !cd_73308)
							if (Player* player = sObjectAccessor->GetPlayer(*me, m_playerGUID))
								if (player->isInCombat())
									if (me->isInCombat())
									{
										if (Unit* unit = me->SelectVictim())
											if (Creature* target = unit->ToCreature())
												if (target->GetEntry() == NPC_SCARLET_FRIAR || target->GetEntry() == NPC_SCARLET_NEOPHYTE || target->GetEntry() == NPC_SCARLET_VANGUARD)
													CastSpell_LiliansShadowHop(target);
									}
								

						m_events.ScheduleEvent(EVENT_CHECK_ATTACK, 1000);
						break;
					}
					case EVENT_CHECK_FATHER_SEQUENCE: // Check if Benedictus is around in order to start the event and talk sequence.
					{
						std::list<Creature*> m_guard;
						for (auto itr : m_father)
						{
							Creature* creature = me->FindNearestCreature(itr, 30.0f, true);
							if (creature)
								m_guard.push_back(creature);
						}

						if (m_guard.size() > 0)
							for (std::list<Creature*>::iterator itr = m_guard.begin(); itr != m_guard.end(); ++itr)
								(*itr)->SetReactState(REACT_PASSIVE);

						Creature* father = me->FindNearestCreature(NPC_BENEDICTUS, 20.0f, true);
						Creature* Melrache = me->FindNearestCreature(NPC_MELRACHE, 20.0f, true);
						Creature* Bodyguard = me->FindNearestCreature(NPC_BODYGUARD, 20.0f, true);

						if (father)
						{
							me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PC | UNIT_FLAG_IMMUNE_TO_NPC);
							father->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE && UNIT_FLAG_IMMUNE_TO_NPC); // To ensure Benedictus won't aggro
							m_fatherGUID = father->GetGUID();
							m_events.ScheduleEvent(EVENT_START_FATHER_SEQUENCE, 200);

							if (Melrache)
								Melrache->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE && UNIT_FLAG_IMMUNE_TO_NPC);
							if (Bodyguard)
								Bodyguard->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE && UNIT_FLAG_IMMUNE_TO_NPC);
						}
						else
							m_events.ScheduleEvent(EVENT_CHECK_FATHER_SEQUENCE, 1000);

						break;
					}
					case EVENT_START_FATHER_SEQUENCE:
					{
						Talk(0); // Father!
						me->GetMotionMaster()->Clear(); // Stop following player

						me->SetWalk(true);
						me->GetMotionMaster()->MovePath(3903801, false); // Implemented in DB
						m_events.ScheduleEvent(EVENT_TALK_PART + 1, 3000);
						break;
					}
					case EVENT_TALK_PART + 1:
					{
						if (Creature* father = sObjectAccessor->GetCreature(*me, m_fatherGUID))
						{
							me->SetFacingToObject(father);
							father->AI()->Talk(0); // Lilian... you're... it's so nice to see you well.
						}
						m_events.ScheduleEvent(EVENT_TALK_PART + 2, 5000);
						break;
					}
					case EVENT_TALK_PART + 2:
					{
						Talk(1); // Shut up.
						m_events.ScheduleEvent(EVENT_TALK_PART + 3, 3000);
						break;
					}
					case EVENT_TALK_PART + 3:
					{
						Creature* Melrache = me->FindNearestCreature(NPC_MELRACHE, 20.0f, true);
						if (Melrache)
							me->CastSpell(Melrache, SPELL_LILIANS_SHADOW_HOP, true);

						m_events.ScheduleEvent(EVENT_TALK_PART + 4, 1000);
						break;
					}
					case EVENT_TALK_PART + 4:
					{
						Creature* Bodyguard = me->FindNearestCreature(NPC_BODYGUARD, 20.0f, true);
						if (Bodyguard)
							me->CastSpell(Bodyguard, SPELL_LILIANS_SHADOW_HOP, true);

						if (!m_fatherSequence1)
						{
							m_events.ScheduleEvent(EVENT_TALK_PART + 5, 1000);
							m_fatherSequence1 = true;
						}
						break;

					}
					case EVENT_TALK_PART + 5:
					{

						if (Creature* father = sObjectAccessor->GetCreature(*me, m_fatherGUID))
							me->SetFacingToObject(father);
						Talk(2); // You raised me to be a killer. How am I doing, daddy?
						m_events.ScheduleEvent(EVENT_TALK_PART + 6, 4000);
						break;
					}
					case EVENT_TALK_PART + 6:
					{
						if (Creature* father = sObjectAccessor->GetCreature(*me, m_fatherGUID))
							father->AI()->Talk(1); // I... ah...
						m_events.ScheduleEvent(EVENT_TALK_PART + 7, 2000);
						break;
					}
					case EVENT_TALK_PART + 7:
					{
						Talk(3); // But wait... I remember now.
						m_events.ScheduleEvent(EVENT_TALK_PART + 8, 4000);
						break;
					}
					case EVENT_TALK_PART + 8:
					{
						if (Creature* father = sObjectAccessor->GetCreature(*me, m_fatherGUID))
							father->AI()->Talk(2); // Lilian, I  ...
						m_events.ScheduleEvent(EVENT_TALK_PART + 9, 1000);
						break;
					}
					case EVENT_TALK_PART + 9:
					{
						me->HandleEmoteCommand(EMOTE_ONESHOT_ROAR);
						Talk(4); // Then again, why kill myself...
						m_events.ScheduleEvent(EVENT_TALK_PART + 10, 3000);
						break;
					}
					case EVENT_TALK_PART + 10:
					{
						if (Player* player = sObjectAccessor->GetPlayer(*me, m_playerGUID))
						{
							player->KilledMonsterCredit(NPC_BENEDICTUS_CREDIT);
						}

						if (Creature* father = sObjectAccessor->GetCreature(*me, m_fatherGUID))
						{
							father->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE && UNIT_FLAG_IMMUNE_TO_NPC);

							me->CastSpell(father, SPELL_LILIANS_SHADOW_HOP, true); // SpellScript is made to kill the target after effect is over unless it is Benedictus.
							father->CastSpell(father, SPELL_STRANGULATE, true);
							m_events.ScheduleEvent(EVENT_TALK_PART + 11, 1000);
						}
						break;
					}
					case EVENT_TALK_PART + 11:
					{
						if (Creature* father = sObjectAccessor->GetCreature(*me, m_fatherGUID))
						{
							me->SetDisableGravity(true);
							me->GetMotionMaster()->MoveJump(3084.2200, -551.0807, 139.7045, 10.0f, 20.0f, 3.887897); // Jump Point 1 on wall
							father->GetMotionMaster()->MoveJump(3084.0496, -551.2206, 139.2565, 10.0f, 20.0f, 3.887897); // Jump Point 1 on wall
							
						}
						m_events.ScheduleEvent(EVENT_TALK_PART + 12, 2500);
						break;
					}
					case EVENT_TALK_PART + 12:
					{
						if (Creature* father = sObjectAccessor->GetCreature(*me, m_fatherGUID))
						{
							me->GetMotionMaster()->MoveJump(3071.0488, -566.4577, 140.2362, 10.0f, 20.0f, 1.021084); // Jump Point 2 on wall
							father->GetMotionMaster()->MoveJump(3071.0684, -566.4397, 139.5825, 10.0f, 20.0f, 1.021084); // Jump Point 2 on wall
						}
						
						m_events.ScheduleEvent(EVENT_TALK_PART + 13, 4000);
						break;
					}
					case EVENT_TALK_PART + 13:
					{
						if (Creature* father = sObjectAccessor->GetCreature(*me, m_fatherGUID))
						{
							me->GetMotionMaster()->Clear();
							father->GetMotionMaster()->Clear();

							me->GetMotionMaster()->MoveFall(0);
							father->GetMotionMaster()->MoveFall(0);

							me->RemoveUnitMovementFlag(MOVEMENTFLAG_DISABLE_GRAVITY);
							father->RemoveUnitMovementFlag(MOVEMENTFLAG_DISABLE_GRAVITY);
							me->SetCanFly(false);
							father->SetCanFly(false);

							me->CastSpell(father, SPELL_LILIANS_BRAIN_BURST, true); // Kill Benedictus
						}	

						m_events.ScheduleEvent(EVENT_TALK_PART + 14, 1500);
						break;
							
					}
					case EVENT_TALK_PART + 14:
					{
						if (Creature* father = sObjectAccessor->GetCreature(*me, m_fatherGUID))
						{
							me->Kill(father);
							me->AddAura(SPELL_SHADOWY_AURA, father);
						}
						m_events.ScheduleEvent(EVENT_TALK_PART + 15, 5000);
						break;
					}
					case EVENT_TALK_PART + 15:
					{
						me->SetSpeed(UnitMoveType::MOVE_RUN, 1.0f, true);
						me->GetMotionMaster()->MovePath(3903803, false); // Exit tower
						m_events.ScheduleEvent(EVENT_TALK_PART + 16, 7000);
						break;
					}
					case EVENT_TALK_PART + 16:
					{
						me->DespawnOrUnsummon(1);
						break;
					}
						
				}
			}
			if (!UpdateVictim())
				return;
			else
				DoMeleeAttackIfReady();
		}

		void CastSpell_LiliansDeathGrip()
		{
			me->CastSpell(me->GetPositionX(), me->GetPositionY(), me->GetPositionZ(), SPELL_LILIANS_DEATH_GRIP, true);
			m_events.ScheduleEvent(EVENT_CD_73309, 10000);
			cd_73309 = true;
		}

		void CastSpell_LiliansShadowHop(Creature* target)
		{
			me->CastSpell(target, SPELL_LILIANS_SHADOW_HOP, true);
			m_events.ScheduleEvent(EVENT_CD_73308, 5000);
			cd_73308 = true;
		}
	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_lilian_voss_39038AI(creature);
	}
};

/// Spell: Lilian's Brain Burst 73307
class spell_lilians_brain_burst_73307 : public SpellScriptLoader
{
public:
	spell_lilians_brain_burst_73307() : SpellScriptLoader("spell_lilians_brain_burst_73307") { }

	class spell_lilians_brain_burst_73307_AuraScript : public AuraScript
	{
		PrepareAuraScript(spell_lilians_brain_burst_73307_AuraScript);

		void OnApply(AuraEffect const* /*aurEff*/, AuraEffectHandleModes /*mode*/)
		{
			if (!GetCaster() || !GetTarget())
				return;

			GetCaster()->Kill(GetTarget());
		}

		void Register() override
		{
			OnEffectApply += AuraEffectApplyFn(spell_lilians_brain_burst_73307_AuraScript::OnApply, EFFECT_1, SPELL_AURA_DUMMY, AURA_EFFECT_HANDLE_REAL);
		}
	};

	AuraScript* GetAuraScript() const
	{
		return new spell_lilians_brain_burst_73307_AuraScript();
	}
};

/// Spell: Lilian's Shadow Hop 73308
class spell_lilians_shadow_hop_73308 : public SpellScriptLoader
{
public:
	spell_lilians_shadow_hop_73308() : SpellScriptLoader("spell_lilians_shadow_hop_73308") { }

	enum Spells
	{
		SPELL_LILIANS_BRAIN_BURST = 73307,
	};

	class spell_lilians_shadow_hop_73308_AuraScript : public AuraScript
	{
		PrepareAuraScript(spell_lilians_shadow_hop_73308_AuraScript);

		void OnRemove(AuraEffect const* /*aurEff*/, AuraEffectHandleModes /*mode*/)
		{
			if (!GetCaster() || !GetTarget())
				return;

			if (GetTarget()->ToCreature()->GetEntry() != 39097) // If Benedictus, don't kill
				GetCaster()->CastSpell(GetTarget(), SPELL_LILIANS_BRAIN_BURST, true);
		}

		void Register() override
		{
			OnEffectRemove += AuraEffectRemoveFn(spell_lilians_shadow_hop_73308_AuraScript::OnRemove, EFFECT_0, SPELL_AURA_CONTROL_VEHICLE, AURA_EFFECT_HANDLE_REAL_OR_REAPPLY_MASK);
		}
	};

	AuraScript* GetAuraScript() const
	{
		return new spell_lilians_shadow_hop_73308_AuraScript();
	}
};

/// Spell: Lilian's Death Grip 73309
class spell_lilians_death_grip_73309 : public SpellScriptLoader
{
public:
	spell_lilians_death_grip_73309() : SpellScriptLoader("spell_lilians_death_grip_73309") { }

	class spell_lilians_death_grip_73309_AuraScript : public AuraScript
	{
		PrepareAuraScript(spell_lilians_death_grip_73309_AuraScript);

		void OnApply(AuraEffect const* /*aurEff*/, AuraEffectHandleModes /*mode*/)
		{
			if (Unit* owner = GetOwner()->ToUnit())
				if (Unit* target = GetTarget())
				{
					target->JumpTo(owner, 15.0f);
					target->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_STUNNED | UNIT_FLAG_DISABLE_MOVE);
				}
		}

		void OnRemove(AuraEffect const* /*aurEff*/, AuraEffectHandleModes /*mode*/)
		{
			if (Unit* owner = GetOwner()->ToUnit())
				if (Unit* target = GetTarget())
					owner->Kill(target);
		}

		void Register() override
		{
			OnEffectApply += AuraEffectApplyFn(spell_lilians_death_grip_73309_AuraScript::OnApply, EFFECT_1, SPELL_AURA_DUMMY, AURA_EFFECT_HANDLE_REAL);
			AfterEffectRemove += AuraEffectRemoveFn(spell_lilians_death_grip_73309_AuraScript::OnRemove, EFFECT_1, SPELL_AURA_DUMMY, AURA_EFFECT_HANDLE_REAL);
		}
	};

	AuraScript* GetAuraScript() const
	{
		return new spell_lilians_death_grip_73309_AuraScript();
	}
};


void AddSC_tirisfal_glades()
{
	new npc_agatha_49044();
	new npc_aradne_50372();
	new npc_deathknell_grave_target();
	new npc_risen_dead();
	new npc_undertaker_mordo();
	new npc_darnell_49141();
	new npc_mindless_zombie();
	new npc_deathguard_saltain();
	new npc_scarlet_corpse_49340();
	new npc_darnell_49337();
	new npc_lilian_voss_38910();
	new npc_rotbrain_berserker();
	new npc_rotbrain_magus();
	new npc_marshal_redpath();
	new npc_deathguard_protector();
	new npc_vile_fin_puddlejumper_1543();
	new npc_vile_fin_minor_oracle_1544();
	new spell_murloc_leash_73108();
	new npc_captured_vile_fin_puddlejumper_38923();
	new npc_captured_vile_fin_minor_oracle_39078();
	new npc_sedrick_calston_38925();
	new npc_shadow_priestess_malia_39117();
	new npc_lilian_voss_39038();
	new spell_lilians_brain_burst_73307();
	new spell_lilians_shadow_hop_73308();
	new spell_lilians_death_grip_73309();
}