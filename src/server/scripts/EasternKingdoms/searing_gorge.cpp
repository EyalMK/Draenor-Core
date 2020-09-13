////////////////////////////////////////////////////////////////////////////////
//
// Project-Hellscream https://hellscream.org
// Copyright (C) 2018-2020 Project-Hellscream-6.2
// Discord https://discord.gg/CWCF3C9
//
////////////////////////////////////////////////////////////////////////////////

#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "ScriptedGossip.h"


/// Quest: Rise, Obsidion - 28056
enum eMoves
{
	MaxLathoricMoves = 4,
};

static std::array<G3D::Vector3, eMoves::MaxLathoricMoves> g_LathoricMoves =
{
	{
		{ -6465.23f, -1268.51f, 180.673f },
		{ -6469.58f, -1266.06f, 180.597f },
		{ -6473.7f, -1260.24f, 180.473f  },
		{ -6476.37f, -1252.35f, 180.332f }
	}
};

/// Lathorick the Black - 8391
class npc_lathorick_the_black : public CreatureScript
{
public:
	npc_lathorick_the_black() : CreatureScript("npc_lathorick_the_black") { }

	enum eMisc
	{
		// Quest
		QUEST_RISE_OBSIDION = 28056,

		// NPCs
		NPC_OBSIDION		= 8400,

		// Events & spells
		SPELL_SHADOW_BOLT	= 9613,
		EVENT_SHADOW_BOLT	= 1,
	};


	struct npc_lathorick_the_blackAI : public ScriptedAI
	{
		npc_lathorick_the_blackAI(Creature* p_Creature) : ScriptedAI(p_Creature) {	}

		uint64 m_PlayerGUID;

		void Reset() override
		{
			m_PlayerGUID = 0;
		}

		void IsSummonedBy(Unit* summoner) override
		{
			if (Player* player = summoner->ToPlayer())
				m_PlayerGUID = player->GetGUID();
		}

		void MovementInform(uint32 type, uint32 id) override
		{
			if (type == EFFECT_MOTION_TYPE && id == 4) // Last waypoint
			{
				Position l_Pos;
				me->GetPosition(&l_Pos);
				me->SetHomePosition(l_Pos); // Last waypoint is home position

				if (Creature* Obsidion = me->FindNearestCreature(NPC_OBSIDION, 40.0f))
				{
					Talk(1); // Fools. Obsidion! Rise...
					me->setFaction(54); // Hostile faction
					Obsidion->setFaction(54); // To assist Lathorick

					// Prevent crash if player is stealthed 
					if (Player* player = ObjectAccessor::GetPlayer(*me, m_PlayerGUID))
					{
						me->CombatStart(player);
						Obsidion->CombatStart(player);
					}					
				}
			}
		}
	};

	CreatureAI* GetAI(Creature* p_Creature) const override
	{
		return new npc_lathorick_the_blackAI(p_Creature);
	}
};

/// Altar of Suntara
class go_altar_of_suntara : public GameObjectScript
{
public:
	go_altar_of_suntara() : GameObjectScript("go_altar_of_suntara") { }

	enum eMisc
	{
		// Quest
		QUEST_RISE_OBSIDION = 28056,

		// NPC
		NPC_LATHORIC		= 8391,

		// Gossip
		GOSSIP_MENU			= 1282,
		NPC_TEXT			= 1918,
		GOSSIP_OPTION		= 0,
	};

	Position LathoricSpawn = { -6460.42f, -1267.61f, 180.784f, 3.0249f };

	bool OnGossipHello(Player* player, GameObject* go)
	{
		if (player->GetQuestStatus(QUEST_RISE_OBSIDION) == QUEST_STATUS_INCOMPLETE)
		{
			if (player->FindNearestCreature(NPC_LATHORIC, 100.0f, true)) // if another Lathoric exists, don't show gossip option.
			{
				player->SEND_GOSSIP_MENU(NPC_TEXT, go->GetGUID());
			}
			else
			{
				player->ADD_GOSSIP_ITEM_DB(GOSSIP_MENU, GOSSIP_OPTION, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF);
				player->SEND_GOSSIP_MENU(NPC_TEXT, go->GetGUID());
			}
			return true;
		}
	}

	bool OnGossipSelect(Player* p_Player, GameObject* p_GameObject, uint32 p_Sender, uint32 p_Action)
	{
		p_Player->PlayerTalkClass->ClearMenus();
		if (p_Action == GOSSIP_ACTION_INFO_DEF)
		{
			p_Player->CLOSE_GOSSIP_MENU();
			if (Creature* lathoric = p_Player->SummonCreature(NPC_LATHORIC, LathoricSpawn, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 60000))
			{
				lathoric->AI()->Talk(0); // You are here to stop the Archduke?
				lathoric->GetMotionMaster()->MoveSmoothPath(MaxLathoricMoves, g_LathoricMoves.data(), g_LathoricMoves.size(), true);
			}	
		}

		return true;
	}
};

/// Consecrated Tripetricine - 88547
class spell_consecrated_tripetricine : public SpellScriptLoader
{
public:
	spell_consecrated_tripetricine() : SpellScriptLoader("spell_consecrated_tripetricine") { }

	enum Id
	{
		// Npc
		NPC_ARCHDUKE_CALCINDER = 47462
	};

	class spell_consecrated_tripetricine_SpellScript : public SpellScript
	{
		PrepareSpellScript(spell_consecrated_tripetricine_SpellScript);

		SpellCastResult CheckCast()
		{
			if (Creature* archdukeCalcinder = GetCaster()->FindNearestCreature(NPC_ARCHDUKE_CALCINDER, 20.0f))
			{
				// Allow cast only if Calcinder HP are under of equal to 50%!
				if (archdukeCalcinder->GetHealthPct() <= 50)
					return SPELL_CAST_OK;
			}
			return SPELL_FAILED_TARGET_AURASTATE;
		}

		void Register()
		{
			OnCheckCast += SpellCheckCastFn(spell_consecrated_tripetricine_SpellScript::CheckCast);
		}
	};

	SpellScript* GetSpellScript() const
	{
		return new spell_consecrated_tripetricine_SpellScript();
	}
};


void AddSC_searing_gorge()
{
	/// Rise, Obsidion [Q] -- Obsidion is done through SmartAI
	new npc_lathorick_the_black();
	new go_altar_of_suntara();


	/// Spells
	new spell_consecrated_tripetricine();
}