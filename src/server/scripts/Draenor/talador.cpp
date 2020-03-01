////////////////////////////////////////////////////////////////////////////////
//
// Project-Hellscream https://hellscream.org
//  Copyright 2015 Millenium-studio SARL
// Discord https://discord.gg/CWCF3C9
//
////////////////////////////////////////////////////////////////////////////////

#include "ScriptPCH.h"
#include "ObjectMgr.h"
#include "GameObjectAI.h"
#include "Language.h"
#include "Vehicle.h"
#include "talador.h"

/// Warlock Soulstealer - 79482
class npc_talador_warlock_soulstealer : public CreatureScript
{
    enum
    {
        WarlockSoulstealer              = 79482,
        DraeneiSpirit                   = 79478,
        KillCredit_RescueDraeneiSpirits = 79499,
        TormentedSoul                   = 160508
    };

    public:
        npc_talador_warlock_soulstealer() : CreatureScript("npc_talador_warlock_soulstealer") { }

        struct npc_talador_warlock_soulstealerAI : public ScriptedAI
        {
            npc_talador_warlock_soulstealerAI(Creature* p_Creature) : ScriptedAI(p_Creature) { }

            /// Called when the creature is killed
            void JustDied(Unit* p_Killer) override
            {
                Player* l_PlayerKiller = nullptr;

                if (p_Killer->IsPlayer())
                    l_PlayerKiller = p_Killer->ToPlayer();
                else if (p_Killer->IsVehicle())
                {
                    Unit* l_Passenger = p_Killer->GetVehicleKit()->GetPassenger(0);

                    if (l_Passenger && l_Passenger->IsPlayer())
                        l_PlayerKiller = l_Passenger->ToPlayer();
                }

                if (l_PlayerKiller)
                {
                    std::list<Unit*> l_NearCreatures;
                    JadeCore::AllCreaturesOfEntryInRange l_UCheck(me, DraeneiSpirit, 15.0f);
                    JadeCore::UnitListSearcher<JadeCore::AllCreaturesOfEntryInRange> l_Searcher(me, l_NearCreatures, l_UCheck);
                    me->VisitNearbyObject(15.0f, l_Searcher);

                    for (Unit* l_Unit : l_NearCreatures)
                    {
                        if (l_Unit->HasAura(TormentedSoul))
                        {
                            l_Unit->RemoveAura(TormentedSoul);
                            l_Unit->GetMotionMaster()->MoveFleeing(me, 5 * TimeConstants::IN_MILLISECONDS);
                            l_Unit->ToCreature()->DespawnOrUnsummon(5 * TimeConstants::IN_MILLISECONDS);
                            l_PlayerKiller->KilledMonsterCredit(KillCredit_RescueDraeneiSpirits);
                        }
                    }
                }
            }
        };

        CreatureAI* GetAI(Creature* p_Creature) const override
        {
            return new npc_talador_warlock_soulstealerAI(p_Creature);
        }
};

/// Zorka's Void Gate - 79520
class npc_talador_zorkas_void_gate : public CreatureScript
{
    enum
    {
        BonusObjectiveZorkraFall = 34660,
        ZorkaVoidGate = 79520
    };

    public:
        npc_talador_zorkas_void_gate() : CreatureScript("npc_talador_zorkas_void_gate") { }

        struct npc_talador_zorkas_void_gateAI : public ScriptedAI
        {
            npc_talador_zorkas_void_gateAI(Creature* p_Creature) : ScriptedAI(p_Creature) { }

            void OnSpellClick(Unit* p_Unit) override
            {
                if (p_Unit->IsPlayer() && p_Unit->ToPlayer()->HasQuest(BonusObjectiveZorkraFall))
                {
                    p_Unit->ToPlayer()->KilledMonsterCredit(ZorkaVoidGate);
                    me->DespawnOrUnsummon(0);
                }
            }
        };

        CreatureAI* GetAI(Creature* p_Creature) const override
        {
            return new npc_talador_zorkas_void_gateAI(p_Creature);
        }
};

/// Cordana Felsong - 83929
class npc_talador_cordana_felsong : public CreatureScript
{
public:
	npc_talador_cordana_felsong() : CreatureScript("npc_talador_cordana_felsong") { }

	enum eTalks
	{
		Talk1 = 0,
		Talk2 = 1,
		Talk3 = 2,
		Talk4 = 3
	};

	enum eActions
	{
		PreFinishQuest1 = 0,
		StartQuest1	    = 1,
		StartQuest2	    = 2,
		PreFinishQuest2 = 3
	};

	enum eEvents
	{
		EventCheckPlayer1 = 0,
		EventCheckPlayer2 = 1,
		EventCheckPlayer3 = 2,
		EventCheckPlayer4 = 3
	};

	struct npc_talador_cordana_felsongAI : public ScriptedAI
	{
		npc_talador_cordana_felsongAI(Creature* p_Creature) : ScriptedAI(p_Creature)
		{
			m_PreFinishQuest1	= false;
			m_StartQuest1		= false;
			m_StartQuest2		= false;
			m_PreFinishQuest2   = false;
		}

		bool m_PreFinishQuest1;
		bool m_StartQuest1;
		bool m_StartQuest2;
		bool m_PreFinishQuest2;

		EventMap m_CosmeticEvents;
		EventMap m_Events;

		void Reset() override
		{
			m_Events.Reset();
			ClearDelayedOperations();

			m_CosmeticEvents.ScheduleEvent(eEvents::EventCheckPlayer1, 0.5 * TimeConstants::IN_MILLISECONDS);
			m_CosmeticEvents.ScheduleEvent(eEvents::EventCheckPlayer2, 0.5 * TimeConstants::IN_MILLISECONDS);
			m_CosmeticEvents.ScheduleEvent(eEvents::EventCheckPlayer3, 0.5 * TimeConstants::IN_MILLISECONDS);
			m_CosmeticEvents.ScheduleEvent(eEvents::EventCheckPlayer4, 0.5 * TimeConstants::IN_MILLISECONDS);
		}

		void DoAction(int32 const p_Action) override
		{
			switch (p_Action)
			{
				case eActions::PreFinishQuest1:
				{
					if (m_PreFinishQuest1)
						return;

					m_PreFinishQuest1 = true;

					m_CosmeticEvents.CancelEvent(eEvents::EventCheckPlayer1);

					AddTimedDelayedOperation(0.2 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						Talk(eTalks::Talk1);
					});

					AddTimedDelayedOperation(20 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						m_CosmeticEvents.ScheduleEvent(eEvents::EventCheckPlayer1, 0.5 * TimeConstants::IN_MILLISECONDS);
						m_PreFinishQuest1 = false;
					});
					break;
				}
				case eActions::StartQuest1:
				{
					if (m_StartQuest1)
						return;

					m_StartQuest1 = true;

					m_CosmeticEvents.CancelEvent(eEvents::EventCheckPlayer2);

					AddTimedDelayedOperation(1 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						Talk(eTalks::Talk2);
						me->HandleEmoteCommand(1);
					});

					AddTimedDelayedOperation(20 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						m_CosmeticEvents.ScheduleEvent(eEvents::EventCheckPlayer2, 0.5 * TimeConstants::IN_MILLISECONDS);
						m_StartQuest1 = false;
					});
					break;
				}
				case eActions::StartQuest2:
				{
					if (m_StartQuest2)
						return;

					m_StartQuest2 = true;

					m_CosmeticEvents.CancelEvent(eEvents::EventCheckPlayer2);

					AddTimedDelayedOperation(1 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						Talk(eTalks::Talk3);
						me->HandleEmoteCommand(1);
					});

					AddTimedDelayedOperation(20 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						m_CosmeticEvents.ScheduleEvent(eEvents::EventCheckPlayer2, 0.5 * TimeConstants::IN_MILLISECONDS);
						m_StartQuest2 = false;
					});
					break;
				}
				case eActions::PreFinishQuest2:
				{
					if (m_PreFinishQuest2)
						return;

					m_PreFinishQuest2 = true;

					m_CosmeticEvents.CancelEvent(eEvents::EventCheckPlayer1);

					AddTimedDelayedOperation(0.2 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						Talk(eTalks::Talk4);
					});

					AddTimedDelayedOperation(20 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						m_CosmeticEvents.ScheduleEvent(eEvents::EventCheckPlayer4, 0.5 * TimeConstants::IN_MILLISECONDS);
						m_PreFinishQuest2 = false;
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

			m_Events.Update(p_Diff);

			m_CosmeticEvents.Update(p_Diff);

			switch (m_Events.ExecuteEvent())
			{
			}

			switch (m_CosmeticEvents.ExecuteEvent())
			{
				case eEvents::EventCheckPlayer1:
				{
					std::list<Player*> PlayersInRange;
					me->GetPlayerListInGrid(PlayersInRange, 10.0f);
					for (Player* p_Player : PlayersInRange)

					if (p_Player->GetQuestStatus(TaladorLegendaryQuests::CallOfTheArchmage) == QUEST_STATUS_COMPLETE)
					{
						DoAction(eActions::PreFinishQuest1);
					}
				}
				case eEvents::EventCheckPlayer2:
				{
					std::list<Player*> PlayersInRange;
					me->GetPlayerListInGrid(PlayersInRange, 5.0f);
					for (Player* p_Player : PlayersInRange)

					if (p_Player->GetQuestStatus(TaladorLegendaryQuests::SpiresOfTheBetrayer) == QUEST_STATUS_INCOMPLETE)
					{
						DoAction(eActions::StartQuest1);
					}
				}
				case eEvents::EventCheckPlayer3:
				{
					std::list<Player*> PlayersInRange;
					me->GetPlayerListInGrid(PlayersInRange, 5.0f);
					for (Player* p_Player : PlayersInRange)

						if (p_Player->GetQuestStatus(TaladorLegendaryQuests::OrbOfDominion) == QUEST_STATUS_INCOMPLETE)
						{
							DoAction(eActions::StartQuest2);
						}
				}
				case eEvents::EventCheckPlayer4:
				{
					std::list<Player*> PlayersInRange;
					me->GetPlayerListInGrid(PlayersInRange, 10.0f);
					for (Player* p_Player : PlayersInRange)

						if (p_Player->GetQuestStatus(TaladorLegendaryQuests::OrbOfDominion) == QUEST_STATUS_COMPLETE)
						{
							DoAction(eActions::PreFinishQuest2);
						}
				}
			}
		}
	};

	CreatureAI* GetAI(Creature* p_Creature) const override
	{
		return new npc_talador_cordana_felsongAI(p_Creature);
	}
};

/// Archmage Khadgar - 83823
class npc_talador_archmage_khadgar : public CreatureScript
{
public:
	npc_talador_archmage_khadgar() : CreatureScript("npc_talador_archmage_khadgar") { }

	enum eTalks
	{
		TalkIntro1				= 0,
		TalkIntro2				= 1,
	};

	enum eGossip
	{
		MainGossip				= 838230,
		RingTextID				= 838231
	};

	enum eActions
	{
		FinishKhadgarsTask		= 0,
		SelectRings				= 1001,
		SelectKhadgarsTask		= 1002,
		SelectEyesOfTheArchmage	= 1003,
		SelectPrisonerOfTheMind = 1005,
		SelectBreakingBadness	= 1006,
	};

	bool OnGossipHello(Player* p_Player, Creature* p_Creature) override
	{
		p_Player->PrepareGossipMenu(p_Creature, eGossip::MainGossip, true);

		if (p_Player->GetQuestStatus(TaladorLegendaryQuests::KhadgarsTask) == QUEST_STATUS_REWARDED)
		{
			p_Player->PrepareQuestMenu(p_Creature->GetGUID());

			p_Player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Where can I replace my ring or acquire another?", GOSSIP_SENDER_MAIN, eActions::SelectRings);
		}

		if (p_Player->GetQuestStatus(TaladorLegendaryQuests::KhadgarsTask) == QUEST_STATUS_INCOMPLETE)
		{
			p_Player->PrepareQuestMenu(p_Creature->GetGUID());

			p_Player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "What's the plan, Khadgar?", GOSSIP_SENDER_MAIN, eActions::SelectKhadgarsTask);
		}

		if (p_Player->GetQuestStatus(TaladorLegendaryQuests::EyesOfTheArchmage) == QUEST_STATUS_INCOMPLETE)
		{
			p_Player->PrepareQuestMenu(p_Creature->GetGUID());

			p_Player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "I'm ready. Start casting!", GOSSIP_SENDER_MAIN, eActions::SelectEyesOfTheArchmage);
		}

		if (p_Player->GetQuestStatus(TaladorLegendaryQuests::PrisonerOfTheMind) == QUEST_STATUS_INCOMPLETE)
		{
			p_Player->PrepareQuestMenu(p_Creature->GetGUID());

			p_Player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "I am ready. Let's free Garona's mind!", GOSSIP_SENDER_MAIN, eActions::SelectPrisonerOfTheMind);
		}

		if (p_Player->GetQuestStatus(TaladorLegendaryQuests::BreakingBadness) == QUEST_STATUS_INCOMPLETE)
		{
			p_Player->PrepareQuestMenu(p_Creature->GetGUID());

			p_Player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Let's try this again. For Garona!", GOSSIP_SENDER_MAIN, eActions::SelectBreakingBadness);
		}

		p_Player->SEND_GOSSIP_MENU(eGossip::MainGossip, p_Creature->GetGUID());
		return true;
	}

	bool OnGossipSelect(Player* p_Player, Creature* p_Creature, uint32 /*p_Sender*/, uint32 p_Action) override
	{
		Position l_Pos;
		p_Creature->GetPosition(&l_Pos);

		p_Player->PlayerTalkClass->ClearMenus();
		p_Player->PlayerTalkClass->SendCloseGossip();

		switch (p_Action)
		{
			case eActions::SelectRings: // Where can I replace my ring or acquire another?
			{
				p_Player->SEND_GOSSIP_MENU(eGossip::RingTextID, p_Creature->GetGUID());
				break;
			}
			case eActions::SelectKhadgarsTask: // What's the plan, Khadgar?
			{
				if (p_Player->GetTeamId() == TEAM_ALLIANCE)
				{
					p_Player->PlayScene(TaladorLegendaryQuestsSceneObjects::KhadgarsTaskA, p_Player);

					p_Creature->AI()->DoAction(eActions::FinishKhadgarsTask);
				}

				else if (p_Player->GetTeamId() == TEAM_HORDE)
				{
					p_Player->PlayScene(TaladorLegendaryQuestsSceneObjects::KhadgarsTaskH, p_Player);
				}
				break;
			}
			case eActions::SelectEyesOfTheArchmage: // I'm ready. Start casting!
			{
				p_Player->PlayScene(TaladorLegendaryQuestsSceneObjects::EyesOfTheArchmage, p_Player);
				break;
			}
			case eActions::SelectPrisonerOfTheMind: // I am ready. Let's free Garona's mind!
			{
				p_Player->PlayScene(TaladorLegendaryQuestsSceneObjects::PrisonerOfTheMind, p_Player);
				break;
			}
			case eActions::SelectBreakingBadness: // Let's try this again. For Garona!
			{
				p_Player->PlayScene(TaladorLegendaryQuestsSceneObjects::BreakingBadness, p_Player);
				break;
			}

			default:
				break;
		}

		return true;
	}

	bool OnQuestAccept(Player* p_Player, Creature* p_Creature, Quest const* p_Quest) override
	{
		if (p_Quest->GetQuestId() == TaladorLegendaryQuests::SpiresOfTheBetrayer)
		{
			p_Creature->AI()->Talk(eTalks::TalkIntro1);
		}

		return true;
	}

	struct npc_talador_archmage_khadgarAI : public ScriptedAI
	{
		npc_talador_archmage_khadgarAI(Creature* p_Creature) : ScriptedAI(p_Creature) { }

		EventMap m_CosmeticEvents;
		EventMap m_Events;

		void Reset() override
		{
			m_Events.Reset();
			ClearDelayedOperations();
		}

		void DoAction(int32 const p_Action) override
		{
			switch (p_Action)
			{
				case eActions::FinishKhadgarsTask:
				{
					AddTimedDelayedOperation(144 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->SetPhaseMask(1, true);
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

			m_Events.Update(p_Diff);

			m_CosmeticEvents.Update(p_Diff);

			switch (m_Events.ExecuteEvent())
			{
			}

			switch (m_CosmeticEvents.ExecuteEvent())
			{
			}
		}
	};

	CreatureAI* GetAI(Creature* p_Creature) const override
	{
		return new npc_talador_archmage_khadgarAI(p_Creature);
	}
};

/// Zooti Fizzlefurry - 86949
class npc_talador_zooti_fizzlefury : public CreatureScript
{
public:
	npc_talador_zooti_fizzlefury() : CreatureScript("npc_talador_zooti_fizzlefury") { }

	struct npc_talador_zooti_fizzlefuryAI : public ScriptedAI
	{
		npc_talador_zooti_fizzlefuryAI(Creature* p_Creature) : ScriptedAI(p_Creature) { }

	};

	CreatureAI* GetAI(Creature* p_Creature) const override
	{
		return new npc_talador_zooti_fizzlefuryAI(p_Creature);
	}
};

/// Archmage Khadgar <An Inside Job> - 90233
class npc_talador_archmage_khadgar_infiltrating : public CreatureScript
{
public:
	npc_talador_archmage_khadgar_infiltrating() : CreatureScript("npc_talador_archmage_khadgar_infiltrating") { }

	enum eTalks
	{
		TalkQuestAccept1 = 0,
		TalkQuestAccept2 = 1,
		TalkEndQuest	 = 6,
	};

	enum eActions
	{
		StartQuest = 0,
	};

	bool OnQuestAccept(Player* p_Player, Creature* p_Creature, Quest const* p_Quest) override
	{
		if (p_Quest->GetQuestId() == TaladorLegendaryQuests::AnInsideJob)
		{
			p_Creature->AI()->DoAction(eActions::StartQuest);
		}

		return true;
	}

	bool OnQuestComplete(Player* p_Player, Creature* p_Creature, Quest const* p_Quest) override
	{
		if (p_Quest->GetQuestId() == TaladorLegendaryQuests::AnInsideJob)
		{
			p_Creature->AI()->Talk(eTalks::TalkEndQuest);
		}

		return true;
	}

	struct npc_talador_archmage_khadgar_infiltratingAI : public ScriptedAI
	{
		npc_talador_archmage_khadgar_infiltratingAI(Creature* p_Creature) : ScriptedAI(p_Creature) { }

		EventMap m_CosmeticEvents;
		EventMap m_Events;

		void Reset() override
		{
			m_Events.Reset();
			ClearDelayedOperations();
		}

		void DoAction(int32 const p_Action) override
		{
			switch (p_Action)
			{
			case eActions::StartQuest:
			{
				AddTimedDelayedOperation(0 * TimeConstants::IN_MILLISECONDS, [this]() -> void
				{
					me->SendPetTalk(eTalks::TalkQuestAccept1);
				});

				AddTimedDelayedOperation(3.5 * TimeConstants::IN_MILLISECONDS, [this]() -> void
				{
					me->SendPetTalk(eTalks::TalkQuestAccept2);
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

			m_Events.Update(p_Diff);

			m_CosmeticEvents.Update(p_Diff);

			switch (m_Events.ExecuteEvent())
			{
			}

			switch (m_CosmeticEvents.ExecuteEvent())
			{
			}
		}
	};

	CreatureAI* GetAI(Creature* p_Creature) const override
	{
		return new npc_talador_archmage_khadgar_infiltratingAI(p_Creature);
	}
};

/// Garona Halforcen <An Inside Job> - 90237
class npc_talador_garona_halforcen_infiltrating : public CreatureScript
{
public:
	npc_talador_garona_halforcen_infiltrating() : CreatureScript("npc_talador_garona_halforcen_infiltrating") { }

	enum eTalks
	{
		TalkEndQuest = 0,
	};

	bool OnQuestComplete(Player* p_Player, Creature* p_Creature, Quest const* p_Quest) override
	{
		if (p_Quest->GetQuestId() == TaladorLegendaryQuests::AnInsideJob)
		{
			p_Creature->AI()->Talk(eTalks::TalkEndQuest);
		}

		return true;
	}

	struct npc_talador_garona_halforcen_infiltratingAI : public ScriptedAI
	{
		npc_talador_garona_halforcen_infiltratingAI(Creature* p_Creature) : ScriptedAI(p_Creature) { }

		EventMap m_CosmeticEvents;
		EventMap m_Events;

		void Reset() override
		{
			m_Events.Reset();
			ClearDelayedOperations();
		}

		void UpdateAI(uint32 const p_Diff) override
		{
			UpdateOperations(p_Diff);

			m_Events.Update(p_Diff);

			m_CosmeticEvents.Update(p_Diff);

			switch (m_Events.ExecuteEvent())
			{
			}

			switch (m_CosmeticEvents.ExecuteEvent())
			{
			}
		}
	};

	CreatureAI* GetAI(Creature* p_Creature) const override
	{
		return new npc_talador_garona_halforcen_infiltratingAI(p_Creature);
	}
};

/// Garona Halforcen <An Inside Job> - 90138
class npc_talador_garona_halforcen_pet : public CreatureScript
{
public:
	npc_talador_garona_halforcen_pet() : CreatureScript("npc_talador_garona_halforcen_pet") { }

	enum eTalks
	{
		
	};

	struct npc_talador_garona_halforcen_petAI : public ScriptedAI
	{
		npc_talador_garona_halforcen_petAI(Creature* p_Creature) : ScriptedAI(p_Creature) { }

		EventMap m_CosmeticEvents;
		EventMap m_Events;

		void Reset() override
		{
			m_Events.Reset();
			ClearDelayedOperations();
		}

		void UpdateAI(uint32 const p_Diff) override
		{
			UpdateOperations(p_Diff);

			m_Events.Update(p_Diff);

			m_CosmeticEvents.Update(p_Diff);

			switch (m_Events.ExecuteEvent())
			{
			}

			switch (m_CosmeticEvents.ExecuteEvent())
			{
			}
		}
	};

	CreatureAI* GetAI(Creature* p_Creature) const override
	{
		return new npc_talador_garona_halforcen_petAI(p_Creature);
	}
};

/// Khadgar's Task Alliance Scene - 977
class scene_khadgars_task_alliance : public SceneScript
{
public:
	scene_khadgars_task_alliance() : SceneScript("scene_khadgars_task_alliance") { }

	void OnSceneComplete(Player* p_Player, uint32 p_SceneInstanceId) override
	{
		uint32 l_PhaseMask = p_Player->GetPhaseMask();
		l_PhaseMask |= TaladorLegendaryPhases::NormalPhase;
		p_Player->SetPhaseMask(l_PhaseMask, true);

		p_Player->CastSpell(p_Player, 167842, true); // Kill Credit
	}
};

/// Khadgar's Task Horde Scene - 1027
class scene_khadgars_task_horde : public SceneScript
{
public:
	scene_khadgars_task_horde() : SceneScript("scene_khadgars_task_horde") { }

	void OnSceneComplete(Player* p_Player, uint32 p_SceneInstanceId) override
	{
		uint32 l_PhaseMask = p_Player->GetPhaseMask();
		l_PhaseMask |= TaladorLegendaryPhases::NormalPhase;
		p_Player->SetPhaseMask(l_PhaseMask, true);

		p_Player->CastSpell(p_Player, 167842, true); // Kill Credit
	}
};

/// Eyes of the Archmage Scene - 997
class scene_eyes_of_the_archmage : public SceneScript
{
public:
	scene_eyes_of_the_archmage() : SceneScript("scene_eyes_of_the_archmage") { }

	void OnSceneComplete(Player* p_Player, uint32 p_SceneInstanceId) override
	{
		uint32 l_PhaseMask = p_Player->GetPhaseMask();
		l_PhaseMask |= TaladorLegendaryPhases::NormalPhase;
		p_Player->SetPhaseMask(l_PhaseMask, true);

		p_Player->CastSpell(p_Player, 169319, true); // Kill Credit
	}
};

/// Passive Scene Object
class playerScript_quests_custom_gestion_talador : public PlayerScript
{
public:
	playerScript_quests_custom_gestion_talador() : PlayerScript("playerScript_quests_custom_gestion_talador") { }

	void OnQuestComplete(Player* p_Player, Quest const* p_Quest, const uint32 diff)
	{
		if (p_Quest->GetQuestId() == TaladorLegendaryQuests::AnInsideJob)
		{
			p_Player->AddMovieDelayedTeleport(270, 1116, 4161.8467f, 1814.5323f, 121.3816f, 5.763592f);
		}
	}
};

class spell_talador_beam_cosmetic : public SpellScriptLoader
{
public:

	spell_talador_beam_cosmetic() : SpellScriptLoader("spell_talador_beam_cosmetic") { }

	class spell_talador_beam_cosmetic_SpellScript : public SpellScript
	{
		PrepareSpellScript(spell_talador_beam_cosmetic_SpellScript);

		std::list<WorldObject*> m_RealList;

		void CorrectTargets(std::list<WorldObject*>& p_Targets)
		{
			if (p_Targets.empty())
				return;

			if (Unit* l_Caster = GetCaster())
			{
				for (WorldObject* l_Target : p_Targets)
				{
					if (l_Target->GetEntry() == 546381)
						m_RealList.push_back(l_Target);
				}

				p_Targets.clear();
				for (WorldObject* l_Itr : m_RealList)
				{
					p_Targets.push_back(l_Itr);
				}
			}
		}

		void Register() override
		{
			OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_talador_beam_cosmetic_SpellScript::CorrectTargets, SpellEffIndex::EFFECT_0, Targets::TARGET_UNIT_NEARBY_ENTRY);
		}
	};

	SpellScript* GetSpellScript() const override
	{
		return new spell_talador_beam_cosmetic_SpellScript();
	}
};

void AddSC_talador()
{
    /// Npcs
    new npc_talador_warlock_soulstealer();
    new npc_talador_zorkas_void_gate();

	/// Zangarra
	new npc_talador_cordana_felsong();
	new npc_talador_archmage_khadgar();
	new npc_talador_zooti_fizzlefury();

	// Scenes
	new scene_khadgars_task_horde();
	new scene_khadgars_task_alliance();
	new scene_eyes_of_the_archmage();

	// An Inside Job Quest
	new npc_talador_archmage_khadgar_infiltrating();
	new npc_talador_garona_halforcen_infiltrating();
	new npc_talador_garona_halforcen_pet();
	new playerScript_quests_custom_gestion_talador();

	/// Spells
	new spell_talador_beam_cosmetic();
}