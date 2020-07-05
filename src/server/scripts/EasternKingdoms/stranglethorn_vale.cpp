////////////////////////////////////////////////////////////////////////////////
//
// Project-Hellscream https://hellscream.org
// Copyright (C) 2018-2020 Project-Hellscream-6.2
// Discord https://discord.gg/CWCF3C9
//
////////////////////////////////////////////////////////////////////////////////


#include "ScriptMgr.h"
#include "Player.h"
#include "ScriptedCreature.h"
#include "SpellInfo.h"
#include "ScriptMgr.h"
#include "ScriptedEscortAI.h"
#include "ScriptedGossip.h"


enum eStrangleThorn
{
	NPC_ZANZIL_THE_OUTCAST = 43245,
	NPC_SHADE_OF_THE_HEXER = 43246, // Jin'do

	SPELL_WINGS_OF_HIREEK = 80789,                          // (28) Summon (43241) (90) Kill Credit(43252)
	SPELL_FORCE_SUMON_WINGS_OF_HIREEK_AND_CREDIT = 80814,   // (77) Script Effect Value: 80789  (134) Kill Credit 2 (43252) 
	SPELL_BD_RIDE_BAT = 80791,                              // (6) Apply Aura #236: Control Vehicle 
	SPELL_BD_FORCECAST_SUMMON_TROLLS = 80813,               // (140) Force Cast (Summon Zanzil (43245) (64) Trigger Spell (Summon Jin'do))
	SPELL_BD_REVERSE_CAST_RIDE_BAT = 80792,                 // (77) Script Effect  Value: 80791
	SPELL_BD_WINGS_OF_HIREEK_COSMETIC_1 = 80802,
	SPELL_BD_WINGS_OF_HIREEK_COSMETIC_2 = 80805,

	PLAYER_GUID = 99991,
	EVENT_MASTER_RESET = 101,
	EVENT_TALK_PART_00,
	EVENT_TALK_PART_01,
	EVENT_TALK_PART_02,
	EVENT_TALK_PART_03,
	EVENT_TALK_PART_04,
	EVENT_TALK_PART_05,
	EVENT_TALK_PART_06,
	EVENT_TALK_PART_07,
	EVENT_TALK_PART_08,
	EVENT_TALK_PART_09,
	EVENT_TALK_PART_10,
	EVENT_START_ANIM,
	EVENT_END_ANIM,
};


/*######
## mob_yenniku
######*/

class mob_yenniku : public CreatureScript
{
public:
    mob_yenniku() : CreatureScript("mob_yenniku") { }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new mob_yennikuAI (creature);
    }

    struct mob_yennikuAI : public ScriptedAI
    {
        mob_yennikuAI(Creature* creature) : ScriptedAI(creature)
        {
            bReset = false;
        }

        uint32 Reset_Timer;
        bool bReset;

        void Reset()
        {
            Reset_Timer = 0;
            me->SetUInt32Value(UNIT_FIELD_EMOTE_STATE, EMOTE_STATE_NONE);
        }

        void SpellHit(Unit* caster, const SpellInfo* spell)
        {
            if (caster->IsPlayer())
            {
                                                                //Yenniku's Release
                if (!bReset && CAST_PLR(caster)->GetQuestStatus(592) == QUEST_STATUS_INCOMPLETE && spell->Id == 3607)
                {
                    me->SetUInt32Value(UNIT_FIELD_EMOTE_STATE, EMOTE_STATE_STUN);
                    me->CombatStop();                   //stop combat
                    me->DeleteThreatList();             //unsure of this
                    me->setFaction(83);                 //horde generic

                    bReset = true;
                    Reset_Timer = 60000;
                }
            }
            return;
        }

        void EnterCombat(Unit* /*who*/) {}

        void UpdateAI(const uint32 diff)
        {
            if (bReset)
            {
                if (Reset_Timer <= diff)
                {
                    EnterEvadeMode();
                    bReset = false;
                    me->setFaction(28);                     //troll, bloodscalp
                    return;
                }
                else Reset_Timer -= diff;

                if (me->isInCombat() && me->getVictim())
                {
                    if (me->getVictim()->IsPlayer())
                    {
                        Unit* victim = me->getVictim();
                        if (CAST_PLR(victim)->GetTeam() == HORDE)
                        {
                            me->CombatStop();
                            me->DeleteThreatList();
                        }
                    }
                }
             }

            //Return since we have no target
            if (!UpdateVictim())
                return;

            DoMeleeAttackIfReady();
        }
    };
};

/// Bossy - 43505
class npc_bossy_43505 : public CreatureScript
{
public:
	npc_bossy_43505() : CreatureScript("npc_bossy_43505") { }

	enum eQuest
	{
		QUEST_LOOKS_LIKE_A_TAUREN_PIRATE_TO_ME = 26630,
		ITEM_COW_HEAD = 59147,
		SPELL_BOSSYS_SACRIFICE = 81311,
	};

	bool OnGossipHello(Player* player, Creature* creature) override
	{
		if (player->GetQuestStatus(QUEST_LOOKS_LIKE_A_TAUREN_PIRATE_TO_ME) == QUEST_STATUS_INCOMPLETE)
			if (player->GetItemCount(ITEM_COW_HEAD) == 0)
			{
				player->ADD_GOSSIP_ITEM_DB(11741, 0, GOSSIP_SENDER_MAIN, 1001);
				player->ADD_GOSSIP_ITEM_DB(11741, 1, GOSSIP_SENDER_MAIN, 1002);
				player->SEND_GOSSIP_MENU(RAND(16437, 16438), creature->GetGUID());
			}
		return true;
	}

	bool OnGossipSelect(Player* player, Creature* creature, uint32 sender, uint32 action) override
	{
		if (player->GetQuestStatus(QUEST_LOOKS_LIKE_A_TAUREN_PIRATE_TO_ME) == QUEST_STATUS_INCOMPLETE)
			if (player->GetItemCount(ITEM_COW_HEAD) == 0)
			{
				switch (action)
				{
				case 1001:
				{
					player->PlayerTalkClass->ClearMenus();
					player->ADD_GOSSIP_ITEM_DB(11742, 0, GOSSIP_SENDER_MAIN, 1003);
					player->ADD_GOSSIP_ITEM_DB(11742, 1, GOSSIP_SENDER_MAIN, 1004);
					player->SEND_GOSSIP_MENU(16439, creature->GetGUID());
					break;
				}
				case 1002:
				{
					// say muuhhh ???
					player->PlayerTalkClass->SendCloseGossip();
					break;
				}
				case 1003:
				{
					// kill
					creature->CastSpell(creature, SPELL_BOSSYS_SACRIFICE, true);
					player->AddItem(ITEM_COW_HEAD, 1);
					player->PlayerTalkClass->SendCloseGossip();
					break;
				}
				case 1004:
				{
					// exit
					player->PlayerTalkClass->SendCloseGossip();
					break;
				}
				}
				return true;
			}

		return false;
	}

};

/// Narkk - 2663
class npc_narkk_2663 : public CreatureScript
{
public:
	npc_narkk_2663() : CreatureScript("npc_narkk_2663") { }

	enum eQuest
	{
		QUEST_LOOKS_LIKE_A_TAUREN_PIRATE_TO_ME = 26630,
		ITEM_OVERSIZED_PIRATE_HAT = 59148,
	};

	bool OnGossipHello(Player* player, Creature* creature) override
	{
		if (player->GetQuestStatus(QUEST_LOOKS_LIKE_A_TAUREN_PIRATE_TO_ME) == QUEST_STATUS_INCOMPLETE)
			if (player->GetItemCount(ITEM_OVERSIZED_PIRATE_HAT) == 0)
			{
				player->ADD_GOSSIP_ITEM_DB(11743, 0, GOSSIP_SENDER_MAIN, 1001);
				player->ADD_GOSSIP_ITEM_DB(50045, 0, GOSSIP_SENDER_MAIN, 1002);
				player->SEND_GOSSIP_MENU(16440, creature->GetGUID());
				return true;
			}

		return false;
	}

	bool OnGossipSelect(Player* player, Creature* creature, uint32 sender, uint32 action) override
	{
		if (player->GetQuestStatus(QUEST_LOOKS_LIKE_A_TAUREN_PIRATE_TO_ME) == QUEST_STATUS_INCOMPLETE)
			if (player->GetItemCount(ITEM_OVERSIZED_PIRATE_HAT) == 0)
			{
				switch (action)
				{
				case 1001:
				{
					player->PlayerTalkClass->SendCloseGossip();
					creature->AI()->Talk(0);
					player->AddItem(ITEM_OVERSIZED_PIRATE_HAT, 1);
					break;
				}
				case 1002:
				{
					player->GetSession()->SendListInventory(creature->GetGUID());
					break;
				}
				}
			}

		return false;
	}

};

// 2663
class npc_fleet_master_seahorn_2487 : public CreatureScript
{
public:
	npc_fleet_master_seahorn_2487() : CreatureScript("npc_fleet_master_seahorn_2487") { }

	enum eQuest
	{
		QUEST_LOOKS_LIKE_A_TAUREN_PIRATE_TO_ME = 26630,
		ITEM_COW_HEAD = 59147,
		ITEM_OVERSIZED_PIRATE_HAT = 59148,
		NPC_SEAHORNS_HEAD = 43506,
		NPC_BARON_REVILGAZ = 2496,

		ACTION_CAST_HEAD_VIDEO = 1,

		EVENT_CAST_HEAD_VIDEO = 1,
		EVENT_CAST_HEAD_BUG,

		playerGUID = 99999,
	};

	bool OnGossipHello(Player* player, Creature* creature) override
	{
		player->PrepareQuestMenu(creature->GetGUID());
		if (player->GetQuestStatus(QUEST_LOOKS_LIKE_A_TAUREN_PIRATE_TO_ME) == QUEST_STATUS_INCOMPLETE)
			if (player->GetItemCount(ITEM_OVERSIZED_PIRATE_HAT) && player->GetItemCount(ITEM_COW_HEAD))
			{
				player->ADD_GOSSIP_ITEM_DB(50046, 0, GOSSIP_SENDER_MAIN, 1001);
				player->SEND_GOSSIP_MENU(16441, creature->GetGUID());
				return true;
			}

		return false;
	}

	bool OnGossipSelect(Player* player, Creature* creature, uint32 sender, uint32 action) override
	{
		if (player->GetQuestStatus(QUEST_LOOKS_LIKE_A_TAUREN_PIRATE_TO_ME) == QUEST_STATUS_INCOMPLETE)
			if (player->GetItemCount(ITEM_OVERSIZED_PIRATE_HAT) && player->GetItemCount(ITEM_COW_HEAD))
			{
				switch (action)
				{
				case 1001:
				{
					player->PlayerTalkClass->ClearMenus();
					player->ADD_GOSSIP_ITEM_DB(11745, 0, GOSSIP_SENDER_MAIN, 1002);
					player->SEND_GOSSIP_MENU(16442, creature->GetGUID());
					break;
				}
				case 1002:
				{
					player->PlayerTalkClass->SendCloseGossip();
					creature->AI()->Talk(0);
					creature->GetAI()->DoAction(ACTION_CAST_HEAD_VIDEO);
					creature->GetAI()->SetGUID(player->GetGUID(), playerGUID);
					break;
				}
				}
				return true;
			}

		return false;
	}

	bool OnQuestReward(Player* player, Creature* creature, Quest const* quest, uint32 /*opt*/)
	{
		if (player->GetQuestStatus(QUEST_LOOKS_LIKE_A_TAUREN_PIRATE_TO_ME) == QUEST_STATUS_INCOMPLETE)
			if (quest->GetQuestId() == QUEST_LOOKS_LIKE_A_TAUREN_PIRATE_TO_ME)
				creature->AI()->Talk(2);

		return false;
	}

	struct npc_fleet_master_seahorn_2487AI : public ScriptedAI
	{
		npc_fleet_master_seahorn_2487AI(Creature* creature) : ScriptedAI(creature) { }

		EventMap m_events;
		uint64 m_playerGUID;
		uint64 m_baronGUID;
		uint64 m_headGUID;

		void Reset() override
		{
			m_events.Reset();
			m_playerGUID = NULL;
			m_baronGUID = NULL;
			m_headGUID = NULL;
		}

		void DoAction(int32 param)
		{
			switch (param)
			{
			case ACTION_CAST_HEAD_VIDEO:
			{
				m_events.ScheduleEvent(EVENT_CAST_HEAD_VIDEO, 25);
				break;
			}
			}
		}

		void SetGUID(uint64 guid, int32 id)
		{
			switch (id)
			{
			case playerGUID:
			{
				m_playerGUID = guid;
				break;
			}
			}
		}

		void UpdateAI(uint32 diff) override
		{
			m_events.Update(diff);

			while (uint32 eventId = m_events.ExecuteEvent())
			{
				switch (eventId)
				{
				case EVENT_CAST_HEAD_VIDEO:
				{
					if (Creature* head = me->SummonCreature(NPC_SEAHORNS_HEAD, -14443.48f, 485.88f, 28.74f, 3.001957f, TEMPSUMMON_TIMED_DESPAWN, 15000))
						m_headGUID = head->GetGUID();
					if (Creature* npc = me->FindNearestCreature(NPC_BARON_REVILGAZ, 15.0f))
					{
						m_baronGUID = npc->GetGUID();
						me->SetFacingToObject(npc);
					}
					m_events.ScheduleEvent(2, 3000);
					break;
				}
				case 2:
				{
					if (Creature* head = sObjectAccessor->GetCreature(*me, m_headGUID))
					{
						me->HandleEmoteCommand(EMOTE_ONESHOT_KICK);
						head->GetMotionMaster()->MoveJump(-14440.13f, 484.35f, 28.80f, 10.0f, 10.0f);
					}
					m_events.ScheduleEvent(3, 3000);
					break;
				}
				case 3:
				{
					if (Creature* baron = sObjectAccessor->GetCreature(*me, m_baronGUID))
						if (Creature* head = sObjectAccessor->GetCreature(*me, m_headGUID))
						{
							baron->HandleEmoteCommand(EMOTE_ONESHOT_KICK);
							head->GetMotionMaster()->MoveJump(-14443.48f, 485.88f, 28.74f, 10.0f, 10.0f);
						}
					m_events.ScheduleEvent(4, 3000);
					break;
				}
				case 4:
				{
					if (Creature* head = sObjectAccessor->GetCreature(*me, m_headGUID))
					{
						me->HandleEmoteCommand(EMOTE_ONESHOT_KICK);
						head->GetMotionMaster()->MoveJump(-14440.13f, 484.35f, 28.80f, 10.0f, 10.0f);
					}
					m_events.ScheduleEvent(5, 3000);
					break;
				}
				case 5:
				{
					if (Creature* baron = sObjectAccessor->GetCreature(*me, m_baronGUID))
						if (Creature* head = sObjectAccessor->GetCreature(*me, m_headGUID))
						{
							baron->HandleEmoteCommand(EMOTE_ONESHOT_KICK);
							head->GetMotionMaster()->MoveJump(-14443.48f, 485.88f, 28.74f, 10.0f, 10.0f);
						}
					m_events.ScheduleEvent(6, 3000);
					break;
				}
				case 6:
				{
					Talk(1);
					if (Creature* head = sObjectAccessor->GetCreature(*me, m_headGUID))
						head->DespawnOrUnsummon();
					if (Player* player = sObjectAccessor->GetPlayer(*me, m_playerGUID))
					{
						player->KilledMonsterCredit(2487);
						player->CompleteQuest(QUEST_LOOKS_LIKE_A_TAUREN_PIRATE_TO_ME);
					}
					break;
				}
				}
			}
		}
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_fleet_master_seahorn_2487AI(creature);
	}
};

class npc_osborn_obnoticus : public CreatureScript
{
public:
	npc_osborn_obnoticus() : CreatureScript("npc_osborn_obnoticus") { }

	enum Data
	{
		QUEST_A_PHYSICAL_SPECIMEN = 26747,
		NPC_BLOODLORD_MANDOKIR = 42790
	};

	bool OnQuestReward(Player* player, Creature* /*creature*/, Quest const* quest, uint32 /*opt*/) override
	{
		switch (quest->GetQuestId())
		{
		case QUEST_A_PHYSICAL_SPECIMEN:
			player->SummonCreature(NPC_BLOODLORD_MANDOKIR, -11306.80f, -194.917f, 75.3878f, 2.92012f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 90000, true);
			break;
		default:
			break;
		}

		return true;
	}
};

class npc_bloodlord_mandokir : public CreatureScript
{
public:
	npc_bloodlord_mandokir() : CreatureScript("npc_bloodlord_mandokir") { }

	enum Data
	{
		QUEST_BLOODLORD_MANDOKIR = 26748
	};

	bool OnQuestReward(Player* /*player*/, Creature* creature, Quest const* quest, uint32 /*opt*/) override
	{
		switch (quest->GetQuestId())
		{
		case QUEST_BLOODLORD_MANDOKIR:
			creature->DespawnOrUnsummon();
			break;
		default:
			break;
		}

		return true;
	}
};


/// Wings of Hireek - 43241
class npc_wings_of_hireek_43241 : public CreatureScript
{
public:
	npc_wings_of_hireek_43241() : CreatureScript("npc_wings_of_hireek_43241") { }

	enum eNPC
	{
	};

	struct npc_wings_of_hireek_43241AI : public ScriptedAI
	{
		npc_wings_of_hireek_43241AI(Creature* creature) : ScriptedAI(creature) { Initialize(); }

		EventMap m_events;
		uint64   m_playerGUID;
		uint64   m_jindoGUID;
		uint64   m_zanzilGUID;
		Position pos;

		void Initialize()
		{
			m_playerGUID = 0;
			m_jindoGUID = 0;
			m_zanzilGUID = 0;
		}

		void Reset() override
		{
		}

		void IsSummonedBy(Unit* summoner) override
		{
			if (Player* player = summoner->ToPlayer())
			{
				pos;
				player->GetPosition(&pos);
				m_playerGUID = player->GetGUID();
				player->CastSpell(me, SPELL_BD_RIDE_BAT, true);
				me->GetMotionMaster()->MovePath(4324101, false);
			}
		}

		void MovementInform(uint32 type, uint32 id) override
		{
			if (type == WAYPOINT_MOTION_TYPE)
				switch (id)
				{
				case 14:
					m_events.ScheduleEvent(EVENT_START_ANIM, 100);
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
				case EVENT_START_ANIM:
					me->CastSpell(me, SPELL_BD_FORCECAST_SUMMON_TROLLS);
					m_events.ScheduleEvent(EVENT_TALK_PART_00, 2000);
					break;
				case EVENT_TALK_PART_00:
					if (!m_zanzilGUID)
						if (Creature* zanzil = me->FindNearestCreature(NPC_ZANZIL_THE_OUTCAST, 25.0f))
							m_zanzilGUID = zanzil->GetGUID();
					if (!m_jindoGUID)
						if (Creature* jindo = me->FindNearestCreature(NPC_SHADE_OF_THE_HEXER, 40.0f))
						{
							m_jindoGUID = jindo->GetGUID();
							jindo->GetMotionMaster()->MovePoint(1024, -13665.07f, -307.34f, 8.176f);
						}

					if (Creature* zanzil = ObjectAccessor::GetCreature(*me, m_zanzilGUID))
						zanzil->AI()->Talk(1);
					m_events.ScheduleEvent(EVENT_TALK_PART_01, 6000);
					break;
				case EVENT_TALK_PART_01:
					if (Creature* zanzil = ObjectAccessor::GetCreature(*me, m_zanzilGUID))
						zanzil->AI()->Talk(2);
					m_events.ScheduleEvent(EVENT_TALK_PART_02, 6000);
					break;
				case EVENT_TALK_PART_02:
					if (Creature* zanzil = ObjectAccessor::GetCreature(*me, m_zanzilGUID))
						if (Creature* jindo = ObjectAccessor::GetCreature(*me, m_jindoGUID))
						{
							jindo->SetFacingToObject(zanzil);
							jindo->AI()->Talk(1);
						}
					m_events.ScheduleEvent(EVENT_TALK_PART_03, 6000);
					break;
				case EVENT_TALK_PART_03:
					if (Creature* jindo = ObjectAccessor::GetCreature(*me, m_jindoGUID))
						jindo->AI()->Talk(2);
					m_events.ScheduleEvent(EVENT_TALK_PART_04, 6000);
					break;
				case EVENT_TALK_PART_04:
					if (Creature* zanzil = ObjectAccessor::GetCreature(*me, m_zanzilGUID))
						zanzil->AI()->Talk(3);
					m_events.ScheduleEvent(EVENT_TALK_PART_05, 6000);
					break;
				case EVENT_TALK_PART_05:
					if (Creature* jindo = ObjectAccessor::GetCreature(*me, m_jindoGUID))
						jindo->AI()->Talk(3);
					m_events.ScheduleEvent(EVENT_TALK_PART_06, 6000);
					break;
				case EVENT_TALK_PART_06:
					if (Creature* jindo = ObjectAccessor::GetCreature(*me, m_jindoGUID))
						jindo->AI()->Talk(4);
					m_events.ScheduleEvent(EVENT_TALK_PART_07, 6000);
					break;
				case EVENT_TALK_PART_07:
					if (Creature* zanzil = ObjectAccessor::GetCreature(*me, m_zanzilGUID))
						zanzil->AI()->Talk(4);
					m_events.ScheduleEvent(EVENT_TALK_PART_08, 6000);
					break;
				case EVENT_TALK_PART_08:
					if (Creature* zanzil = ObjectAccessor::GetCreature(*me, m_zanzilGUID))
						zanzil->AI()->Talk(5);
					if (Player* player = ObjectAccessor::GetPlayer(*me, m_playerGUID))
						player->KilledMonsterCredit(43245);
					m_events.ScheduleEvent(EVENT_TALK_PART_09, 3000);
					break;
				case EVENT_TALK_PART_09:
					if (Player* player = ObjectAccessor::GetPlayer(*me, m_playerGUID))
						player->CastSpell(player, SPELL_BD_REVERSE_CAST_RIDE_BAT, true);
					m_events.ScheduleEvent(EVENT_TALK_PART_10, 3000);
					break;
				case EVENT_TALK_PART_10:
					if (Creature* zanzil = ObjectAccessor::GetCreature(*me, m_zanzilGUID))
						zanzil->DespawnOrUnsummon(100);
					if (Creature* jindo = ObjectAccessor::GetCreature(*me, m_jindoGUID))
						jindo->DespawnOrUnsummon(100);
					m_events.ScheduleEvent(EVENT_END_ANIM, 100);
					break;
				case EVENT_END_ANIM:
					if (Player* player = ObjectAccessor::GetPlayer(*me, m_playerGUID))
						player->NearTeleportTo(pos.m_positionX, pos.m_positionY, pos.m_positionZ, pos.m_orientation);
					me->DespawnOrUnsummon(10);
					break;
				}
			}
		}
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_wings_of_hireek_43241AI(creature);
	}
};




enum AltarNaias
{
	NPC_NAIAS = 17207
};

class spell_summon_naias : public SpellScript
{
	PrepareSpellScript(spell_summon_naias);

	void HandleSendEvent(SpellEffIndex /*effIndex*/)
	{
		if (GetCaster()->IsPlayer())
			GetCaster()->SummonCreature(NPC_NAIAS, -12130.5000, 958.9940, 4.87148, 5.02655);
	}

	void Register() override
	{
		OnEffectHit += SpellEffectFn(spell_summon_naias::HandleSendEvent, EFFECT_0, SPELL_EFFECT_SEND_EVENT);
	}
};


/// Totem of Hireek - 204361
class go_totem_of_hireek_204361 : public GameObjectScript
{
public:
	go_totem_of_hireek_204361() : GameObjectScript("go_totem_of_hireek_204361") { }

	bool OnGossipSelect(Player* player, GameObject* go, uint32 sender, uint32 action) override
	{
		if (player->GetQuestStatus(26550) == QUEST_STATUS_INCOMPLETE || player->GetQuestStatus(26809) == QUEST_STATUS_INCOMPLETE)
		{
			player->CastSpell(player, SPELL_WINGS_OF_HIREEK, true);
			player->CLOSE_GOSSIP_MENU();
			return true;
		}

		return false;
	}
};


#ifndef __clang_analyzer__
void AddSC_stranglethorn_vale()
{
	/// Npcs
    new mob_yenniku();
	new npc_bossy_43505();
	new npc_narkk_2663();
	new npc_fleet_master_seahorn_2487();
	new npc_osborn_obnoticus();
	new npc_bloodlord_mandokir();
	new npc_wings_of_hireek_43241();

	/// Spells
	new spell_summon_naias();

	/// Objects
	new go_totem_of_hireek_204361();

}
#endif
