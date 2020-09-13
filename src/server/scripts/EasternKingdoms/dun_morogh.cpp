////////////////////////////////////////////////////////////////////////////////
//
// Project-Hellscream https://hellscream.org
// Copyright (C) 2018-2020 Project-Hellscream-6.2
// Discord https://discord.gg/CWCF3C9
//
////////////////////////////////////////////////////////////////////////////////

#include "ScriptedGossip.h"
#include "GossipDef.h"
#include "ScriptedEscortAI.h"
#include "Vehicle.h"

enum RandomQuests
{
	SAY_CONTAMINATION_START = 0,
	SAY_CONTAMINATION_3 = 1,
	SAY_CONTAMINATION_OVERLOAD = 2,
	SAY_MINDLESS_LEPER = 0,
	SAY_HARD_TIME = 0,
	SAY_MULTIBOT_0 = 0,
	SAY_MULTIBOT_1 = 1,
	SAY_MULTIBOT_2 = 2,
	SAY_MULTIBOT_3 = 3,

	SAY_UGH_NOT_THIS = 0,
	SAY_OH_NO = 1,

	QUEST_PINNED_DOWN = 27670,
	QUEST_STAGING_IN_BREWNALL = 26339,
	QUEST_JOB_FOR_BOT = 26205,
};

class DistanceSelector
{
public:
	DistanceSelector(Unit* source, uint32 const distance) : _source(source), _distance(distance) {}

	bool operator()(Creature* creature)
	{
		return _source->GetDistance(creature) > _distance;
	}

private:
	Unit* _source;
	uint32 const _distance;
};


/// Survivor - 46268
class npc_gnomeregan_survivor : public CreatureScript
{
public:
    npc_gnomeregan_survivor() : CreatureScript("npc_gnomeregan_survivor") { }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_gnomeregan_survivorAI (creature);
    }

	enum eMisc
	{
		/// Quest
		QUEST_SEE_TO_THE_SURVIVORS	= 27671,

		/// Npcs
		NPC_GNOMEREGAN_SURVIVOR		= 46268,

		/// Spells
		SPELL_TELEPORT_AWAY			= 83369,
		SPELL_TELEPORT_BEACON		= 86264, // Triggered by item ID: 62057
	};

    struct npc_gnomeregan_survivorAI : public ScriptedAI
    {
        npc_gnomeregan_survivorAI(Creature* creature) : ScriptedAI(creature) {}
        
        void Reset() override
		{
			// Temporary
			me->HandleEmoteCommand(EMOTE_STATE_COWER);
			me->AddUnitState(UNIT_STATE_ROOT);
		}

        void SpellHit(Unit* Caster, const SpellInfo* Spell)
        {
            if (Spell->Id == SPELL_TELEPORT_BEACON)
            {
                if (Player* player = Caster->ToPlayer())
					if (player->GetQuestStatus(QUEST_SEE_TO_THE_SURVIVORS) == QUEST_STATUS_INCOMPLETE)
					{
						player->KilledMonsterCredit(NPC_GNOMEREGAN_SURVIVOR);
						player->CastSpell(me, SPELL_TELEPORT_AWAY, true);
						me->ForcedDespawn(1000);
						me->SetRespawnDelay(15);
					}
            }
        }
    };
};

/*######
## npc_flying_target_machin
######*/

class npc_flying_target_machin : public CreatureScript
{
public:
    npc_flying_target_machin() : CreatureScript("npc_flying_target_machin") { }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_flying_target_machinAI (creature);
    }

    struct npc_flying_target_machinAI : public ScriptedAI
    {
        npc_flying_target_machinAI(Creature* creature) : ScriptedAI(creature) {}

        void Reset()
        {
            me->SetSpeed(MOVE_FLIGHT, 0.5f);
        }

        void EnterCombat(Unit* /*who*/)
        {
            return;
        }
    };
};

/*######
## npc_carvo_blastbolt
######*/

#define QUEST_WITHDRAW_TO_THE_LOADING_ROOM  28169
#define NPC_IMUN_AGENT                      47836

class npc_carvo_blastbolt : public CreatureScript
{
public:
    npc_carvo_blastbolt() : CreatureScript("npc_carvo_blastbolt") { }

    bool OnQuestAccept(Player* player, Creature* creature, Quest const* quest)
    {
        if (quest->GetQuestId() == QUEST_WITHDRAW_TO_THE_LOADING_ROOM)
            Creature * imunAgent = creature->SummonCreature(NPC_IMUN_AGENT, -4985.93f, 776.91f, 288.48f, 3.06f, TEMPSUMMON_MANUAL_DESPAWN, 0, player->GetGUID());

        return true;
    }
};

/*######
## npc_imun_agent_escort
######*/

class npc_imun_agent_escort : public CreatureScript
{
public:
    npc_imun_agent_escort() : CreatureScript("npc_imun_agent_escort") { }

    struct npc_imun_agent_escortAI : public npc_escortAI
    {
        npc_imun_agent_escortAI(Creature* creature) : npc_escortAI(creature){}

        uint32 IntroTimer;

        void Reset()
        {
            IntroTimer = 2500;
            SetEscortPaused(true);
        }

        void WaypointReached(uint32 /*waypointId*/)
        {
            /*if (waypointId == 10)
                Playemote garde a vous*/
        }

        void UpdateAI(const uint32 diff)
        {
            if (IntroTimer)
            {
                if (IntroTimer <= diff)
                {
                    IntroTimer = 0;
                    Start(false, false);
                }
                else
                    IntroTimer -= diff;
            }

            npc_escortAI::UpdateAI(diff);
        }
    };

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_imun_agent_escortAI(creature);
    }
};

/*######
## npc_sanitron500
######*/

/*
 *  @Npc   : Sanitron 500 (46185)
 *  @Quest : Decontamination (27635)
 *  @Descr : Board the Sanitron 500 to begin the decontamination process.
 */
enum eSanitron
{
	SPELL_CANNON_BURST = 86080,
	SPELL_DECONTAMINATE_STAGE_1 = 86075,
	SPELL_DECONTAMINATE_STAGE_2 = 86086,
	SPELL_IRRADIATE = 80653,

	SPELL_EXPLOSION = 30934,

	QUEST_DECONTAMINATION = 27635,

	NPC_DECONTAMINATION_BUNNY = 46165,
	NPC_CLEAN_CANNON = 46208,
	NPC_SAFE_TECHNICAN = 46230
};

class npc_sanitron500 : public CreatureScript
{
public:
	npc_sanitron500() : CreatureScript("npc_sanitron500") {}

	bool OnGossipHello(Player* pPlayer, Creature* pCreature)
	{
		QuestStatus status = pPlayer->GetQuestStatus(QUEST_DECONTAMINATION);
		if (status == QUEST_STATUS_INCOMPLETE)
		{
			pPlayer->HandleEmoteCommand(0);
			Vehicle *vehicle = pCreature->GetVehicleKit();
			pPlayer->EnterVehicle(pCreature->ToUnit(), 0);
			pCreature->MonsterSay("Commencing decontamination sequence...", LANG_UNIVERSAL, 0);
		}
		return true;
	}

	struct npc_sanitron500AI : public ScriptedAI
	{
		npc_sanitron500AI(Creature* pCreature) : ScriptedAI(pCreature), vehicle(pCreature->GetVehicleKit())
		{
			assert(vehicle);
		}

		Vehicle *vehicle;
		Unit* Technician;
		Creature::Unit* Bunny[4];
		Creature::Unit* Cannon[4];
		std::list<Unit*> targets;
		uint32 uiTimer;
		uint32 uiRespawnTimer;
		uint8 uiPhase;

		void Reset()
		{
			uiTimer = 0;
			uiRespawnTimer = 6000;
			uiPhase = 0;
		}

		Unit* unit(uint32 entry, uint32 range, bool alive)
		{
			if (Unit* unit = me->FindNearestCreature(entry, float(range), alive))
				if (Unit* unit2 = Unit::GetCreature(*me, unit->GetGUID()))
					return unit2;
		}

		void GetTargets()
		{
			JadeCore::AnyUnitInObjectRangeCheck u_check(me, 100.0f);
			JadeCore::UnitListSearcher<JadeCore::AnyUnitInObjectRangeCheck> searcher(me, targets, u_check);
			me->VisitNearbyObject(100.0f, searcher);
			if (!targets.empty())
				for (std::list<Unit*>::const_iterator iter = targets.begin(); iter != targets.end(); ++iter)
				{
					if ((*iter)->GetTypeId() != TYPEID_PLAYER)
					{
						switch ((*iter)->GetEntry())
						{
						case 46230:
							if ((*iter)->GetDistance2d(-5165.209961f, 713.809021f) <= 1)
								Technician = (*iter);
							break;
						case 46165:
							if ((*iter)->GetDistance2d(-5164.919922f, 723.890991f) <= 1)
								Bunny[0] = (*iter);
							if ((*iter)->GetDistance2d(-5182.560059f, 726.656982f) <= 1)
								Bunny[1] = (*iter);
							if ((*iter)->GetDistance2d(-5166.350098f, 706.336975f) <= 1)
								Bunny[2] = (*iter);
							if ((*iter)->GetDistance2d(-5184.040039f, 708.405029f) <= 1)
								Bunny[3] = (*iter);
							break;
						case 46208:
							if ((*iter)->GetDistance2d(-5164.209961f, 719.267029f) <= 1)
								Cannon[0] = (*iter);
							if ((*iter)->GetDistance2d(-5165.000000f, 709.453979f) <= 1)
								Cannon[1] = (*iter);
							if ((*iter)->GetDistance2d(-5183.830078f, 722.093994f) <= 1)
								Cannon[2] = (*iter);
							if ((*iter)->GetDistance2d(-5184.470215f, 712.554993f) <= 1)
								Cannon[3] = (*iter);
							break;
						}
					}
				}
		}

		void UpdateAI(const uint32 diff)
		{
			if (!vehicle->HasEmptySeat(0))
				if (uiTimer <= diff)
				{
					switch (uiPhase)
					{
					case 0: me->GetMotionMaster()->MovePoint(1, -5173.34f, 730.11f, 294.25f);
						GetTargets();
						++uiPhase;
						uiTimer = 5500;
						break;
					case 1:
						if (Bunny[0] && Bunny[1])
						{
							Bunny[0]->CastSpell(me, SPELL_DECONTAMINATE_STAGE_1, true);
							Bunny[1]->CastSpell(me, SPELL_DECONTAMINATE_STAGE_1, true);
						}
						++uiPhase;
						uiTimer = 5000;
						break;
					case 2:
						if (Cannon[0] && Cannon[1] && Cannon[2] && Cannon[3])
						{
							me->GetMotionMaster()->MovePoint(2, -5173.72f, 725.7f, 294.03f);
							Cannon[0]->CastSpell(me, SPELL_CANNON_BURST, true);
							Cannon[1]->CastSpell(me, SPELL_CANNON_BURST, true);
							Cannon[2]->CastSpell(me, SPELL_CANNON_BURST, true);
							Cannon[3]->CastSpell(me, SPELL_CANNON_BURST, true);
						}
						++uiPhase;
						uiTimer = 2000;
						break;
					case 3:
						if (Technician)
							me->GetMotionMaster()->MovePoint(3, -5174.57f, 716.45f, 289.53f);
						Technician->MonsterSay("Ugh! Not this again! I'm asking for a new station next expedition...", LANG_UNIVERSAL, 0);
						++uiPhase;
						uiTimer = 8000;
						break;
					case 4:
						if (Bunny[2] && Bunny[3])
						{
							me->GetMotionMaster()->MovePoint(4, -5175.04f, 707.2f, 294.4f);
							Bunny[2]->CastSpell(me, SPELL_DECONTAMINATE_STAGE_2, true);
							Bunny[3]->CastSpell(me, SPELL_DECONTAMINATE_STAGE_2, true);
						}
						++uiPhase;
						uiTimer = 1000;
						break;
					case 5:
						if (vehicle->GetPassenger(0))
							if (Player* player = vehicle->GetPassenger(0)->ToPlayer())
								player->CompleteQuest(QUEST_DECONTAMINATION);
						me->MonsterSay("Decontamination complete. Standby for delivery.", LANG_UNIVERSAL, 0);
						me->GetMotionMaster()->MovePoint(5, -5175.61f, 700.38f, 290.89f);
						++uiPhase;
						uiTimer = 3000;
						break;
					case 6:
						me->MonsterSay("Warning, system overload. Malfunction imminent!", LANG_UNIVERSAL, 0);
						me->CastSpell(me, SPELL_EXPLOSION);
						++uiPhase;
						uiTimer = 1000;
						break;
					case 7:
						me->SetCanFly(false);
						vehicle->GetPassenger(0)->RemoveAurasDueToSpell(SPELL_IRRADIATE);
						vehicle->RemoveAllPassengers();
						me->setDeathState(JUST_DIED);
						++uiPhase;
						uiTimer = 0;
						break;
					}
				}
				else uiTimer -= diff;
		}
	};

	CreatureAI *GetAI(Creature *pCreature) const
	{
		return new npc_sanitron500AI(pCreature);
	}
};

/*######
## npc_canon_propre
######*/

class npc_canon_propre : public CreatureScript
{
public:
    npc_canon_propre() : CreatureScript("npc_canon_propre") { }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_canon_propreAI (creature);
    }

    struct npc_canon_propreAI : public ScriptedAI
    {
        npc_canon_propreAI(Creature* creature) : ScriptedAI(creature) {}

        bool hasPassenger;

        void Reset()
        {
            hasPassenger = false;
        }

        void UpdateAI(const uint32 /*p_Diff*/)
        {
            if (hasPassenger)
                return;

            if (Creature* imunAgent = me->FindNearestCreature(45847, 10.0f))
            {
                if (me->GetVehicleKit())
                {
                    hasPassenger = true;
                    me->GetVehicleKit()->AddPassenger(imunAgent);
                }
            }
        }
    };
};

/*######
## npc_carvo_blastbolt
######*/

#define GOSSIP_TEXT "Envoyez moi a la surface, Torben !"

class npc_gnomeregan_torben : public CreatureScript
{
public:
    npc_gnomeregan_torben() : CreatureScript("npc_gnomeregan_torben") { }

    bool OnGossipHello(Player* player, Creature* creature)
    {
        player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_TEXT, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
        player->SEND_GOSSIP_MENU(1, creature->GetGUID());

        return true;
    }

    bool OnGossipSelect(Player* player, Creature* /*creature*/, uint32 /*sender*/, uint32 action)
    {
        player->PlayerTalkClass->ClearMenus();
        if (action == GOSSIP_ACTION_INFO_DEF+1)
        {
            player->TeleportTo(0, -5201.58f, 477.98f, 388.47f, 5.13f);
            player->PlayerTalkClass->SendCloseGossip();
        }
        return true;
    }
};

/*######
## npc_gnomeregan_recrue
######*/

class npc_gnomeregan_recrue : public CreatureScript
{
public:
    npc_gnomeregan_recrue() : CreatureScript("npc_gnomeregan_recrue") { }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_gnomeregan_recrueAI (creature);
    }

    struct npc_gnomeregan_recrueAI : public ScriptedAI
    {
        npc_gnomeregan_recrueAI(Creature* creature) : ScriptedAI(creature) {}

        bool hasTarget;

        void Reset()
        {
            hasTarget = false;
        }

        void DamageTaken(Unit* doneBy, uint32& damage, SpellInfo const*  /*p_SpellInfo*/)
        {
            if (doneBy->ToCreature())
                if (me->GetHealth() <= damage || me->GetHealthPct() <= 80.0f)
                    damage = 0;
        }

        void DamageDealt(Unit* target, uint32& damage, DamageEffectType /*damageType*/)
        {
            if (target->ToCreature())
                if (target->GetHealth() <= damage || target->GetHealthPct() <= 70.0f)
                    damage = 0;
        }

        void UpdateAI(const uint32 /*p_Diff*/)
        {
            if (hasTarget)
            {
                DoMeleeAttackIfReady();
                return;
            }

            float x = 0, y = 0;
            GetPositionWithDistInOrientation(me, 2.5f, me->GetOrientation(), x, y);

            if (Creature* LivingInfection = me->SummonCreature(42185, x, y, me->GetPositionZ()))
            {
                LivingInfection->setFaction(16);
                LivingInfection->SetFacingToObject(me);
                LivingInfection->Attack(me, true);
                hasTarget = true;
            }
        }
    };
};




/// Jarvi Shadowstep - 42353
class npc_jarvi_shadowstep_42353 : public CreatureScript
{
public:
	npc_jarvi_shadowstep_42353() : CreatureScript("npc_jarvi_shadowstep_42353") { }

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_jarvi_shadowstep_42353AI(creature);
	}
	
	enum eMisc
	{
		/// Quest
		QUEST_DOWN_WITH_CRUSHCOG	= 26364,

		/// Npcs
		NPC_HIGH_TINKER_MEKKATORQUE = 42849,
		NPC_MOUNTAINEER_STONEGRIND  = 42852,
		NPC_GNOMEREGAN_INFANTRY		= 42316,
		NPC_MOUNTAINEER				= 13076,

		/// Action
		START_EVENT					= 0,

		/// Data
		DATA_EVENT_STARTER_GUID		= 1,
	};

	bool OnQuestReward(Player* p_Player, Creature* p_Creature, const Quest* p_Quest, uint32 p_Option)
	{
		if (p_Quest->GetQuestId() == QUEST_DOWN_WITH_CRUSHCOG)
		{
			p_Creature->AI()->SetGUID(p_Player->GetGUID(), DATA_EVENT_STARTER_GUID); // Save Player's guid
			p_Creature->SetFacingTo(1.650729f); // Face the infantry npcs
			p_Creature->AI()->TalkWithDelay(500, 0, p_Player->GetGUID()); // $n, along with High Tinker...
			p_Creature->AI()->DoAction(1);
		}

		return true;
	}

	struct npc_jarvi_shadowstep_42353AI : public ScriptedAI
	{
		npc_jarvi_shadowstep_42353AI(Creature* creature) : ScriptedAI(creature) {
			m_PlayerGUID = 0;
		}

		bool EventInPlace;
		uint64 m_PlayerGUID;

		Position const TinkerPos = { -5365.7651f, 302.1639f, 394.2236f, 2.841277f };
		Position const TinkerPosFinal = { -5374.6313f, 304.6849f, 393.8332f, 2.769020f };

		Position const StoneGrindPos = { -5377.5859f, 296.4573f, 393.6351f, 2.278931f };
		Position const StoneGrindPosFinal = { -5386.3340f, 306.4055f, 394.0372f, 2.216100f };

		/// On reward quest, if event is running do nothing.
		void Reset()
		{
			ClearDelayedOperations();
			EventInPlace = false;
		}

		void SetGUID(uint64 guid, int32 type) override
		{
			switch (type)
			{
			case DATA_EVENT_STARTER_GUID:
				m_PlayerGUID = guid;
				break;
			default:
				break;
			}
		}

		void DoAction(int32 const p_Action) override
		{
			switch (p_Action)
			{
				case START_EVENT:
				{
					if (EventInPlace) // if event is running, break.
						break;

					EventInPlace = true; // if event wasn't running, it is now.

					AddTimedDelayedOperation(1 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						if (Creature* Tinker = me->SummonCreature(NPC_HIGH_TINKER_MEKKATORQUE, TinkerPos, TEMPSUMMON_TIMED_DESPAWN, 30000))
						{
							Tinker->SetWalk(true);
							Tinker->GetMotionMaster()->MovePoint(1, TinkerPosFinal);
							Tinker->AI()->TalkWithDelay(6000, 5); // Razlo Crushcog is no more!
							Tinker->DespawnOrUnsummon(21000);
						}
						if (Creature* StoneGrind = me->SummonCreature(NPC_MOUNTAINEER_STONEGRIND, StoneGrindPos, TEMPSUMMON_TIMED_DESPAWN, 30000))
						{
							StoneGrind->SetWalk(true);
							StoneGrind->GetMotionMaster()->MovePoint(1, StoneGrindPosFinal);
							StoneGrind->DespawnOrUnsummon(23000);
						}

						if (Creature* mountaineer = me->FindNearestCreature(NPC_MOUNTAINEER, 10.0f, true))
							mountaineer->AI()->TalkWithDelay(12000, 0); // I'll drink to that!

						if (Creature* infantry1 = me->FindNearestCreature(NPC_GNOMEREGAN_INFANTRY, 10.0f, true))
						{
							if (Creature* infantry2 = infantry1->FindNearestCreature(NPC_GNOMEREGAN_INFANTRY, 10.0f, true))
								infantry2->AI()->TalkWithDelay(8000, 0); // Victory at last!
							
							infantry1->AI()->TalkWithDelay(8000, 1, m_PlayerGUID); // Three cheers for $n
						}

						me->AI()->TalkWithDelay(10000, 1); // The victorious heroes...
					});

					AddTimedDelayedOperation(6 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						if (Creature* StoneGrind = me->FindNearestCreature(NPC_MOUNTAINEER_STONEGRIND, 15.0f, true))
							StoneGrind->SetFacingToObject(me);
					});
					AddTimedDelayedOperation(8 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						// Cheer
						std::list<Creature*> MountaineersAndInfantry;
						me->GetCreatureListWithEntryInGrid(MountaineersAndInfantry, NPC_GNOMEREGAN_INFANTRY, 15.0f);
						me->GetCreatureListWithEntryInGrid(MountaineersAndInfantry, NPC_MOUNTAINEER, 15.0f);
						me->GetCreatureListWithEntryInGrid(MountaineersAndInfantry, NPC_MOUNTAINEER_STONEGRIND, 15.0f);

						for (auto itr : MountaineersAndInfantry)
							itr->HandleEmoteCommand(EMOTE_ONESHOT_CHEER);
					});
					
					AddTimedDelayedOperation(10 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						// Cheer
						std::list<Creature*> MountaineersAndInfantry;
						me->GetCreatureListWithEntryInGrid(MountaineersAndInfantry, NPC_GNOMEREGAN_INFANTRY, 15.0f);
						me->GetCreatureListWithEntryInGrid(MountaineersAndInfantry, NPC_MOUNTAINEER, 15.0f);

						for (auto itr : MountaineersAndInfantry)
							itr->HandleEmoteCommand(EMOTE_ONESHOT_CHEER);
					});

					AddTimedDelayedOperation(25 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->SetFacingTo(5.32325f); // Reset orientation
						me->AI()->Reset();
					});
					break;
				}
			}
		}

		void UpdateAI(uint32 const p_Diff)
		{
			UpdateOperations(p_Diff);
		}

	};
};

#ifndef __clang_analyzer__
void AddSC_dun_morogh()
{
    new npc_gnomeregan_survivor();
    new npc_flying_target_machin();
    new npc_carvo_blastbolt();
    new npc_imun_agent_escort();
    new npc_sanitron500();
    new npc_canon_propre();
    new npc_gnomeregan_torben();
    new npc_gnomeregan_recrue();
	new npc_jarvi_shadowstep_42353();
}
#endif
