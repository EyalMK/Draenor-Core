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
#include "ScriptedEscortAI.h"
#include "GameObjectAI.h"
#include "NPCHandler.h"
#include "Vehicle.h"
#include "PhaseMgr.h"
#include "Common.h"
#include "ObjectMgr.h"
#include "World.h"
#include "PetAI.h"
#include "PassiveAI.h"
#include "CombatAI.h"
#include "GameEventMgr.h"
#include "GridNotifiers.h"
#include "GridNotifiersImpl.h"
#include "Cell.h"
#include "CellImpl.h"
#include "Battleground.h"
#include "Group.h"
#include "SpellAuras.h"
#include "Vehicle.h"
#include "Player.h"
#include "SpellScript.h"
#include "MapManager.h"
#include "Chat.h"
#include "Pet.h"
#include "ScriptPCH.h"



/// ????? - Hellscream Beta Teleporter
/// No SQL commit with this script, must stay in Beta.
/*
INSERT INTO `creature_template` (`entry`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `femaleName`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `exp_req`, `faction`, `npcflag`, `npcflag2`, `speed_walk`, `speed_run`, `speed_fly`, `scale`, `rank`, `dmgschool`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `baseVariance`, `rangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `WorldEffectID`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `type_flags2`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `Health_mod`, `Mana_mod`, `Mana_mod_extra`, `Armor_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `TrackingQuestID`, `VignetteID`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `BuildVerified`) VALUES('4050924','0','0','18720','0','0','0','Hellscream Teleporter','','Help Test All Content','','0','100','100','6','0','35','1','0','1','1.14286','1.14286','1','0','0','1','0','0','1','1','1','518','0','0','0','0','0','0','0','0','0','10','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','1','1','1','1','1','0','0','0','0','0','0','0','0','0','0','1','0','0','0','npc_hellscream_teleporter','1');
INSERT INTO `trinity_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `content_loc9`, `content_loc10`) VALUES (124097, 'Visit the Hellscream Teleporter to debug the new content!', NULL, 'Visit the Hellscream Teleporter to debug the new content!', 'Visit the Hellscream Teleporter to debug the new content!', NULL, NULL, 'Visit the Hellscream Teleporter to debug the new content!', NULL, 'Visit the Hellscream Teleporter to debug the new content!', NULL, NULL);
*/
class npc_hellscream_zg : public CreatureScript
{
public:
	npc_hellscream_zg() : CreatureScript("npc_hellscream_zg")
	{
	}

	enum eActions
	{
		SelectWodstart = 1001,
		TpAloneWodstart = 1002,
		TpGroupWodstart = 1003,


	};

	enum Destinations
	{
		DestinationWodstart = 1


	};

	void TeleportPlayer(Player* p_Player, uint8 p_Destination)
	{
		switch (p_Destination)
		{
		case Destinations::DestinationWodstart:
			p_Player->TeleportTo(309, -11916.2f, -1291.51f, 85.3973f, 4.70451f);
			break;

		}
	}

	void TeleportGroup(Player* p_Player, uint8 p_Destination)
	{
		std::list<Unit*> l_PlayerList;
		p_Player->GetPartyMembers(l_PlayerList);

		for (Unit* l_GroupMember : l_PlayerList)
		{
			if (l_GroupMember->IsPlayer())
			{
				switch (p_Destination)
				{
				case Destinations::DestinationWodstart:
					TeleportPlayer(l_GroupMember->ToPlayer(), Destinations::DestinationWodstart);
					break;


				}
			}
		}
	}

	bool OnGossipHello(Player* p_Player, Creature* p_Creature) override
	{
		p_Player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "[ZG] Teleport me, please.", GOSSIP_SENDER_MAIN, eActions::SelectWodstart);
		p_Player->SEND_GOSSIP_MENU(1, p_Creature->GetGUID());

		return true;
	}

	bool OnGossipSelect(Player* p_Player, Creature* p_Creature, uint32 /*p_Sender*/, uint32 p_Action) override
	{
		p_Player->PlayerTalkClass->ClearMenus();
		p_Player->PlayerTalkClass->SendCloseGossip();

		switch (p_Action)
		{
		case eActions::SelectWodstart:
			p_Player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "I want to teleport to [ZG] alone.", GOSSIP_SENDER_MAIN, eActions::TpAloneWodstart);
			p_Player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "I want to teleport to [ZG] with my group.", GOSSIP_SENDER_MAIN, eActions::TpGroupWodstart);
			p_Player->SEND_GOSSIP_MENU(1, p_Creature->GetGUID());
			break;

		case eActions::TpAloneWodstart:
			TeleportPlayer(p_Player, Destinations::DestinationWodstart);
			break;
		case eActions::TpGroupWodstart:
			TeleportPlayer(p_Player, Destinations::DestinationWodstart);
			break;
		}

		return true;
	}

	struct npc_hellscream_zgAI : public ScriptedAI
	{
		npc_hellscream_zgAI(Creature* creature) : ScriptedAI(creature)
		{
			//  m_YellTimer = 300 * IN_MILLISECONDS;
		}

		//   uint32 m_YellTimer;

		void UpdateAI(uint32 const p_Diff) override
		{
			//if (m_YellTimer)
			// {
			//if (m_YellTimer <= p_Diff)
			// {

			// me->YellToZone(124097, LANG_UNIVERSAL, 0);
			//  m_YellTimer = 300 * IN_MILLISECONDS;
			// }
			// else
			//  m_YellTimer -= p_Diff;
			// }
		}
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_hellscream_zgAI(creature);
	}
};

class npc_hellscream_ffa : public CreatureScript
{
public:
	npc_hellscream_ffa() : CreatureScript("npc_hellscream_ffa")
	{
	}

	enum eActions
	{
		SelectWodstart = 1001,
		Selectffa = 1002,
		TpAloneWodstart = 1003,
		TpGroupWodstart = 1004,
		TpAloneffa = 1005,
		TpGroupffa = 1006,


	};

	enum Destinations
	{
		DestinationWodstart = 1,
		Destinationffa = 2


	};

	void TeleportPlayer(Player* p_Player, uint8 p_Destination)
	{
		switch (p_Destination)
		{
		case Destinations::DestinationWodstart:
			p_Player->TeleportTo(1116, 4186.56f, 8574.43f, 572.57f, 3.08191f);
			break;
		case Destinations::Destinationffa:
			p_Player->TeleportTo(0, -14599.00f, -237.766f, 24.85f, 2.43732f);
			break;

		}
	}

	void TeleportGroup(Player* p_Player, uint8 p_Destination)
	{
		std::list<Unit*> l_PlayerList;
		p_Player->GetPartyMembers(l_PlayerList);

		for (Unit* l_GroupMember : l_PlayerList)
		{
			if (l_GroupMember->IsPlayer())
			{
				switch (p_Destination)
				{
				case Destinations::DestinationWodstart:
					TeleportPlayer(l_GroupMember->ToPlayer(), Destinations::DestinationWodstart);
					break;
				case Destinations::Destinationffa:
					TeleportPlayer(l_GroupMember->ToPlayer(), Destinations::Destinationffa);
					break;


				}
			}
		}
	}

	bool OnGossipHello(Player* p_Player, Creature* p_Creature) override
	{
		p_Player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "[PvP-Mall] Teleport me, please.", GOSSIP_SENDER_MAIN, eActions::SelectWodstart);
		p_Player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "[FFA-Zone] Teleport me, please.", GOSSIP_SENDER_MAIN, eActions::Selectffa);
		p_Player->SEND_GOSSIP_MENU(1, p_Creature->GetGUID());

		return true;
	}

	bool OnGossipSelect(Player* p_Player, Creature* p_Creature, uint32 /*p_Sender*/, uint32 p_Action) override
	{
		p_Player->PlayerTalkClass->ClearMenus();
		p_Player->PlayerTalkClass->SendCloseGossip();

		switch (p_Action)
		{
		case eActions::SelectWodstart:
			p_Player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "I want to teleport to PvP-Mall alone.", GOSSIP_SENDER_MAIN, eActions::TpAloneWodstart);
			p_Player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "I want to teleport to PvP-Mall with my group.", GOSSIP_SENDER_MAIN, eActions::TpGroupWodstart);
			p_Player->SEND_GOSSIP_MENU(1, p_Creature->GetGUID());
			break;

		case eActions::TpAloneWodstart:
			TeleportPlayer(p_Player, Destinations::DestinationWodstart);
			break;
		case eActions::TpGroupWodstart:
			TeleportPlayer(p_Player, Destinations::DestinationWodstart);
			break;
		case eActions::Selectffa:
			p_Player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "I want to teleport to FFA-Zone alone.", GOSSIP_SENDER_MAIN, eActions::TpAloneffa);
			p_Player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "I want to teleport to FFA-Zone with my group.", GOSSIP_SENDER_MAIN, eActions::TpGroupffa);
			p_Player->SEND_GOSSIP_MENU(1, p_Creature->GetGUID());
			break;

		case eActions::TpAloneffa:
			TeleportPlayer(p_Player, Destinations::Destinationffa);
			break;
		case eActions::TpGroupffa:
			TeleportPlayer(p_Player, Destinations::Destinationffa);
			break;
		}

		return true;
	}

	struct npc_hellscream_ffaAI : public ScriptedAI
	{
		npc_hellscream_ffaAI(Creature* creature) : ScriptedAI(creature)
		{
			//  m_YellTimer = 300 * IN_MILLISECONDS;
		}

		//   uint32 m_YellTimer;

		void UpdateAI(uint32 const p_Diff) override
		{
			//if (m_YellTimer)
			// {
			//if (m_YellTimer <= p_Diff)
			// {

			// me->YellToZone(124097, LANG_UNIVERSAL, 0);
			//  m_YellTimer = 300 * IN_MILLISECONDS;
			// }
			// else
			//  m_YellTimer -= p_Diff;
			// }
		}
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_hellscream_ffaAI(creature);
	}
};

class npc_hellscream_teleporter : public CreatureScript
{
public:
	npc_hellscream_teleporter() : CreatureScript("npc_hellscream_teleporter")
	{
	}

	enum eActions
	{
		SelectWodstart = 1001,
		TpAloneWodstart = 1002,
		TpGroupWodstart = 1003,


	};

	enum Destinations
	{
		DestinationWodstart = 1


	};

	void TeleportPlayer(Player* p_Player, uint8 p_Destination)
	{
		switch (p_Destination)
		{
		case Destinations::DestinationWodstart:
			p_Player->TeleportTo(229, 89.8652f, -318.885f, 65.4642f, 0.0279307f);
			break;

		}
	}

	void TeleportGroup(Player* p_Player, uint8 p_Destination)
	{
		std::list<Unit*> l_PlayerList;
		p_Player->GetPartyMembers(l_PlayerList);

		for (Unit* l_GroupMember : l_PlayerList)
		{
			if (l_GroupMember->IsPlayer())
			{
				switch (p_Destination)
				{
				case Destinations::DestinationWodstart:
					TeleportPlayer(l_GroupMember->ToPlayer(), Destinations::DestinationWodstart);
					break;


				}
			}
		}
	}

	bool OnGossipHello(Player* p_Player, Creature* p_Creature) override
	{
		p_Player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "[Dungeon] Upper Blackrock Spire, please.", GOSSIP_SENDER_MAIN, eActions::SelectWodstart);
		p_Player->SEND_GOSSIP_MENU(1, p_Creature->GetGUID());

		return true;
	}

	bool OnGossipSelect(Player* p_Player, Creature* p_Creature, uint32 /*p_Sender*/, uint32 p_Action) override
	{
		p_Player->PlayerTalkClass->ClearMenus();
		p_Player->PlayerTalkClass->SendCloseGossip();

		switch (p_Action)
		{
		case eActions::SelectWodstart:
			p_Player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "I want to teleport to Upper Blackrock Spire alone.", GOSSIP_SENDER_MAIN, eActions::TpAloneWodstart);
			p_Player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "I want to teleport to Upper Blackrock Spire with my group.", GOSSIP_SENDER_MAIN, eActions::TpGroupWodstart);
			p_Player->SEND_GOSSIP_MENU(1, p_Creature->GetGUID());
			break;

		case eActions::TpAloneWodstart:
			TeleportPlayer(p_Player, Destinations::DestinationWodstart);
			break;
		case eActions::TpGroupWodstart:
			TeleportPlayer(p_Player, Destinations::DestinationWodstart);
			break;
		}

		return true;
	}

	struct npc_hellscream_teleporterAI : public ScriptedAI
	{
		npc_hellscream_teleporterAI(Creature* creature) : ScriptedAI(creature)
		{
			//  m_YellTimer = 300 * IN_MILLISECONDS;
		}

		//   uint32 m_YellTimer;

		void UpdateAI(uint32 const p_Diff) override
		{
			//if (m_YellTimer)
			// {
			//if (m_YellTimer <= p_Diff)
			// {

			// me->YellToZone(124097, LANG_UNIVERSAL, 0);
			//  m_YellTimer = 300 * IN_MILLISECONDS;
			// }
			// else
			//  m_YellTimer -= p_Diff;
			// }
		}
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_hellscream_teleporterAI(creature);
	}
};

enum eHighmaulDests
{
	DestinationKargath,
	DestinationButcher,
	DestinationBrackenspore,
	DestinationTectus,
	DestinationTwinOgron,
	DestinationKoragh,
	DestinationMargok,
	MaxHighmaulDests
};

Position const g_HighmaulDests[eHighmaulDests::MaxHighmaulDests] =
{
	{ 3475.60f, 7590.64f, 55.30f, 4.062f }, ///< Kargath
	{ 3698.73f, 7601.06f, 30.03f, 1.178f }, ///< Butcher
	{ 3983.92f, 7742.95f, 5.009f, 0.019f }, ///< Brackenspore
	{ 3492.97f, 7907.10f, 68.40f, 0.679f }, ///< Tectus
	{ 3923.18f, 8310.01f, 322.1f, 0.836f }, ///< Twin Ogron
	{ 3864.26f, 8554.24f, 367.6f, 0.903f }, ///< Ko'ragh
	{ 4067.41f, 8582.56f, 572.6f, 3.084f }  ///< Imperator Mar'gok
};

/// This class is used to activate tests for Highmaul
class HighmaulTestEnable : public BasicEvent
{
	enum eHighmaulData
	{
		TestsActivated = 1
	};

public:
	HighmaulTestEnable(uint64 p_Guid) : BasicEvent(), m_Guid(p_Guid) { }
	virtual ~HighmaulTestEnable() {}

	virtual bool Execute(uint64 /*p_EndTime*/, uint32 /*p_Time*/)
	{
		if (Player* l_Player = HashMapHolder<Player>::Find(m_Guid))
		{
			if (InstanceScript* l_Highmaul = l_Player->GetInstanceScript())
			{
				if (l_Highmaul->GetData(eHighmaulData::TestsActivated))
					return false;

				l_Highmaul->SetData(eHighmaulData::TestsActivated, true);
			}
		}

		return true;
	}

	virtual void Abort(uint64 /*p_EndTime*/) { }

private:
	uint64 m_Guid;
};

class npc_pve_tests_manager : public CreatureScript
{
public:
	npc_pve_tests_manager() : CreatureScript("npc_pve_tests_manager") { }

	enum eActions
	{
		/// Gossip select
		/// Highmaul
		SelectHighmaul = 1000,
		SelectKargath = 1001,
		SelectButcher = 1002,
		SelectBrackenspore = 1003,
		SelectTectus = 1004,
		SelectTwinOgron = 1005,
		SelectKoragh = 1006,
		SelectMargok = 1007,
		/// Blackrock Foundry
		SelectBlackrock = 1008,
		SelectBRFAlone = 1009,
		SelectBRFGroup = 1010,
		/// Boss select
		/// Highmaul
		KargathGroup = 10001,
		ButcherGroup = 10002,
		BrackensporeGroup = 10003,
		TectusGroup = 10004,
		TwinOgronGroup = 10005,
		KoraghGroup = 10006,
		MargokGroup = 10007
	};

	enum eData
	{
		HighmaulMapID = 1228
	};

	bool OnGossipHello(Player* p_Player, Creature* p_Creature) override
	{
		p_Player->ADD_GOSSIP_ITEM(GOSSIP_ICON_BATTLE, "I want to do some tests in Highmaul.", GOSSIP_SENDER_MAIN, eActions::SelectHighmaul);
		p_Player->ADD_GOSSIP_ITEM(GOSSIP_ICON_BATTLE, "I want to do some tests in Blackrock Foundry.", GOSSIP_SENDER_MAIN, eActions::SelectBlackrock);
		p_Player->SEND_GOSSIP_MENU(1, p_Creature->GetGUID());
		return true;
	}

	bool OnGossipSelect(Player* p_Player, Creature* p_Creature, uint32 /*p_Sender*/, uint32 p_Action) override
	{
		p_Player->PlayerTalkClass->ClearMenus();
		p_Player->PlayerTalkClass->SendCloseGossip();

		if (!p_Creature->IsAIEnabled)
			return true;

		npc_pve_tests_manager::npc_pve_tests_managerAI* l_AI = CAST_AI(npc_pve_tests_manager::npc_pve_tests_managerAI, p_Creature->GetAI());
		if (l_AI == nullptr)
			return true;

		switch (p_Action)
		{
		case eActions::SelectHighmaul:
			p_Player->ADD_GOSSIP_ITEM(GOSSIP_ICON_BATTLE, "I want to fight against Kargath Bladefist.", GOSSIP_SENDER_MAIN, eActions::SelectKargath);
			p_Player->ADD_GOSSIP_ITEM(GOSSIP_ICON_BATTLE, "I want to fight against The Butcher.", GOSSIP_SENDER_MAIN, eActions::SelectButcher);
			p_Player->ADD_GOSSIP_ITEM(GOSSIP_ICON_BATTLE, "I want to fight against Brackenspore.", GOSSIP_SENDER_MAIN, eActions::SelectBrackenspore);
			p_Player->ADD_GOSSIP_ITEM(GOSSIP_ICON_BATTLE, "I want to fight against Tectus.", GOSSIP_SENDER_MAIN, eActions::SelectTectus);
			p_Player->ADD_GOSSIP_ITEM(GOSSIP_ICON_BATTLE, "I want to fight against the Twin Ogron.", GOSSIP_SENDER_MAIN, eActions::SelectTwinOgron);
			p_Player->ADD_GOSSIP_ITEM(GOSSIP_ICON_BATTLE, "I want to fight against Ko'ragh.", GOSSIP_SENDER_MAIN, eActions::SelectKoragh);
			p_Player->ADD_GOSSIP_ITEM(GOSSIP_ICON_BATTLE, "I want to fight against Imperator Mar'gok.", GOSSIP_SENDER_MAIN, eActions::SelectMargok);
			p_Player->SEND_GOSSIP_MENU(1, p_Creature->GetGUID());
			break;
		case eActions::SelectKargath:
			p_Player->ADD_GOSSIP_ITEM(GOSSIP_ICON_BATTLE, "I want to fight Kargath Bladefist with my group.", GOSSIP_SENDER_MAIN, eActions::KargathGroup);
			p_Player->SEND_GOSSIP_MENU(1, p_Creature->GetGUID());
			break;
		case eActions::SelectButcher:
			p_Player->ADD_GOSSIP_ITEM(GOSSIP_ICON_BATTLE, "I want to fight The Butcher with my group.", GOSSIP_SENDER_MAIN, eActions::ButcherGroup);
			p_Player->SEND_GOSSIP_MENU(1, p_Creature->GetGUID());
			break;
		case eActions::SelectBrackenspore:
			p_Player->ADD_GOSSIP_ITEM(GOSSIP_ICON_BATTLE, "I want to fight Brackenspore with my group.", GOSSIP_SENDER_MAIN, eActions::BrackensporeGroup);
			p_Player->SEND_GOSSIP_MENU(1, p_Creature->GetGUID());
			break;
		case eActions::SelectTectus:
			p_Player->ADD_GOSSIP_ITEM(GOSSIP_ICON_BATTLE, "I want to fight Tectus with my group.", GOSSIP_SENDER_MAIN, eActions::TectusGroup);
			p_Player->SEND_GOSSIP_MENU(1, p_Creature->GetGUID());
			break;
		case eActions::SelectTwinOgron:
			p_Player->ADD_GOSSIP_ITEM(GOSSIP_ICON_BATTLE, "I want to fight the Twin Ogron with my group.", GOSSIP_SENDER_MAIN, eActions::TwinOgronGroup);
			p_Player->SEND_GOSSIP_MENU(1, p_Creature->GetGUID());
			break;
		case eActions::SelectKoragh:
			p_Player->ADD_GOSSIP_ITEM(GOSSIP_ICON_BATTLE, "I want to fight Ko'ragh with my group.", GOSSIP_SENDER_MAIN, eActions::KoraghGroup);
			p_Player->SEND_GOSSIP_MENU(1, p_Creature->GetGUID());
			break;
		case eActions::SelectMargok:
			p_Player->ADD_GOSSIP_ITEM(GOSSIP_ICON_BATTLE, "I want to fight Imperator Mar'gok with my group.", GOSSIP_SENDER_MAIN, eActions::MargokGroup);
			p_Player->SEND_GOSSIP_MENU(1, p_Creature->GetGUID());
			break;
		case eActions::SelectBlackrock:
			p_Player->ADD_GOSSIP_ITEM(GOSSIP_ICON_BATTLE, "I want to be teleported to Blackrock Foundry alone.", GOSSIP_SENDER_MAIN, eActions::SelectBRFAlone);
			p_Player->ADD_GOSSIP_ITEM(GOSSIP_ICON_BATTLE, "I want to be teleported to Blackrock Foundry with my group.", GOSSIP_SENDER_MAIN, eActions::SelectBRFGroup);
			p_Player->SEND_GOSSIP_MENU(1, p_Creature->GetGUID());
			break;
		case eActions::KargathGroup:
			l_AI->TeleportGroup(p_Player, eHighmaulDests::DestinationKargath);
			break;
		case eActions::ButcherGroup:
			l_AI->TeleportGroup(p_Player, eHighmaulDests::DestinationButcher);
			break;
		case eActions::BrackensporeGroup:
			l_AI->TeleportGroup(p_Player, eHighmaulDests::DestinationBrackenspore);
			break;
		case eActions::TectusGroup:
			l_AI->TeleportGroup(p_Player, eHighmaulDests::DestinationTectus);
			break;
		case eActions::TwinOgronGroup:
			l_AI->TeleportGroup(p_Player, eHighmaulDests::DestinationTwinOgron);
			break;
		case eActions::KoraghGroup:
			l_AI->TeleportGroup(p_Player, eHighmaulDests::DestinationKoragh);
			break;
		case eActions::MargokGroup:
			l_AI->TeleportGroup(p_Player, eHighmaulDests::DestinationMargok);
			break;
		case eActions::SelectBRFAlone:
			p_Player->TeleportTo(1116, 8084.64f, 855.51f, 34.3623f, 6.037f);
			break;
		case eActions::SelectBRFGroup:
			l_AI->TeleportGroup(p_Player, 8084.64f, 855.51f, 34.3623f, 6.037f);
			break;
		default:
			break;
		}

		return true;
	}

	struct npc_pve_tests_managerAI : public ScriptedAI
	{
		npc_pve_tests_managerAI(Creature* p_Creature) : ScriptedAI(p_Creature)
		{
			m_YellTimer = 300 * IN_MILLISECONDS;
		}

		uint32 m_YellTimer;

		void UpdateAI(uint32 const p_Diff) override
		{
			if (m_YellTimer)
			{
				if (m_YellTimer <= p_Diff)
				{
					/// "Hey $N, come to me in your faction capital, to access fastly our last testable content ! Newest raids, boss, get directly teleported to the destination you are looking for."
					me->YellToZone(TrinityStrings::WarnRaidTests, LANG_UNIVERSAL, 0);
					m_YellTimer = 300 * IN_MILLISECONDS;
				}
				else
					m_YellTimer -= p_Diff;
			}
		}

		void TeleportPlayer(Player* p_Player, uint8 p_Destination)
		{
			if (p_Destination >= eHighmaulDests::MaxHighmaulDests)
				return;

			/// This will prevent players to be re-teleported depending on bosses states
			p_Player->BeginSummon();
			p_Player->TeleportTo(eData::HighmaulMapID, g_HighmaulDests[p_Destination]);

			p_Player->m_Events.AddEvent(new HighmaulTestEnable(p_Player->GetGUID()), 3 * TimeConstants::IN_MILLISECONDS);
		}

		void TeleportGroup(Player* p_Player, uint8 p_Destination)
		{
			if (p_Player->GetGroup() == nullptr)
			{
				me->MonsterSay("Sorry, but you must be in a raid group to test this boss.", LANG_UNIVERSAL, 0);
				return;
			}

			std::list<Unit*> l_PlayerList;
			p_Player->GetRaidMembers(l_PlayerList);

			for (Unit* l_GroupMember : l_PlayerList)
			{
				if (l_GroupMember->GetTypeId() == TypeID::TYPEID_PLAYER)
					TeleportPlayer(l_GroupMember->ToPlayer(), p_Destination);
			}
		}

		void TeleportGroup(Player* p_Player, float p_X, float p_Y, float p_Z, float p_O)
		{
			if (p_Player->GetGroup() == nullptr)
			{
				me->MonsterSay("Sorry, but you must be in a raid group to test this boss.", LANG_UNIVERSAL, 0);
				return;
			}

			std::list<Unit*> l_PlayerList;
			p_Player->GetRaidMembers(l_PlayerList);

			for (Unit* l_GroupMember : l_PlayerList)
			{
				if (l_GroupMember->GetTypeId() == TypeID::TYPEID_PLAYER)
					l_GroupMember->ToPlayer()->TeleportTo(1116, p_X, p_Y, p_Z, p_O);
			}
		}
	};

	CreatureAI* GetAI(Creature* p_Creature) const override
	{
		return new npc_pve_tests_managerAI(p_Creature);
	}
};

/// Warlords of draenor intro? - NPC
class npc_hellscream_booster : public CreatureScript
{
public:
	npc_hellscream_booster() : CreatureScript("npc_hellscream_booster") { }

	enum eOptions
	{
		LevelUp,
		FullEquipment
	};

	enum eItems
	{
		HexweaveBag = 114821,
		TomeOfTheClearMind = 79249,
		ReinsOfTheIllidariFelstalker = 118515
	};

	enum eMenuIDs
	{
		MenuBaseLevel = 179317,
		MenuBaseStuff = 179318,
		MenuUnable = 179319
	};

	enum eTalks
	{
		TalkSpec,
		TalkError,
		TalkNoSpace,
		TalkStuffOK,
		TalkLevelOK
	};

	enum eVisual
	{
		MountID = 29344
	};

	bool OnGossipHello(Player* p_Player, Creature* p_Creature) override
	{
		// if (!p_Player->GetSession()->HasServiceFlags(ServiceFlags::Season2Gold) &&
		//    !p_Player->GetSession()->HasServiceFlags(ServiceFlags::Season2Item))
		{
			p_Player->PlayerTalkClass->ClearMenus();
			p_Player->SEND_GOSSIP_MENU(eMenuIDs::MenuUnable, p_Creature->GetGUID());

			p_Player->ADD_GOSSIP_ITEM_DB(eMenuIDs::MenuBaseLevel, 0, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
			p_Player->SEND_GOSSIP_MENU(eMenuIDs::MenuBaseLevel, p_Creature->GetGUID());

		}

		return true;
	}

	struct npc_hellscream_boosterAI : public ScriptedAI
	{
		npc_hellscream_boosterAI(Creature* p_Creature) : ScriptedAI(p_Creature) { }

		void Reset() override
		{
			me->SetUInt32Value(EUnitFields::UNIT_FIELD_MOUNT_DISPLAY_ID, eVisual::MountID);

			me->SetReactState(ReactStates::REACT_PASSIVE);
		}

		void sGossipSelect(Player* p_Player, uint32 /*p_MenuID*/, uint32 /*p_Action*/) override
		{
			//  if (p_Player->GetSession()->HasServiceFlags(ServiceFlags::Season2Gold))
			{
				/// Player doesn't have enough space
				if (p_Player->GetBagsFreeSlots() < 6)
				{
					Talk(eTalks::TalkNoSpace, p_Player->GetGUID());
					p_Player->PlayerTalkClass->SendCloseGossip();
					return;
				}

				p_Player->GiveLevel(MAX_LEVEL);
				p_Player->ModifyMoney(100000 * MoneyConstants::GOLD);
				p_Player->TeleportTo(1, -8452.49f, -4202.24f, -211.992f, 4.38f);

				p_Player->AddItem(eItems::HexweaveBag, 4);
				p_Player->AddItem(eItems::TomeOfTheClearMind, 200);
				p_Player->AddItem(eItems::ReinsOfTheIllidariFelstalker, 1);

				//p_Player->GetSession()->UnsetServiceFlags(ServiceFlags::Season2Gold);
				Talk(eTalks::TalkLevelOK, p_Player->GetGUID());
				Talk(eTalks::TalkStuffOK, p_Player->GetGUID());
				p_Player->PlayerTalkClass->SendCloseGossip();
			}
			{
				if (!p_Player->GetSpecializationId())
				{
					Talk(eTalks::TalkSpec, p_Player->GetGUID());
					p_Player->PlayerTalkClass->SendCloseGossip();
					return;
				}

				if (!GiveFullPvPEquipment(p_Player))
				{
					p_Player->PlayerTalkClass->SendCloseGossip();
					return;
				}

				//p_Player->GetSession()->UnsetServiceFlags(ServiceFlags::Season2Item);
				//Talk(eTalks::TalkStuffOK, p_Player->GetGUID());
			}

			p_Player->PlayerTalkClass->SendCloseGossip();
		}

		bool GiveFullPvPEquipment(Player* p_Player)
		{
			LootStore& l_LootStore = LootTemplates_Creature;
			LootTemplate const* l_LootTemplate = l_LootStore.GetLootFor(me->GetCreatureTemplate()->lootid);
			if (l_LootTemplate == nullptr)
			{
				Talk(eTalks::TalkError, p_Player->GetGUID());
				return false;
			}

			std::list<ItemTemplate const*>      l_LootTable;
			std::vector<std::vector<uint32>>    l_Items;
			std::set<uint32>                    l_ItemsToAdd;

			l_LootTemplate->FillAutoAssignationLoot(l_LootTable, p_Player, false);

			uint32 l_SpecID = p_Player->GetSpecializationId();
			uint32 l_ItemCount = 0;

			l_Items.resize(InventoryType::MAX_INVTYPE);

			/// Fill possible equipment for each slots
			for (uint8 l_Iter = 0; l_Iter < InventoryType::MAX_INVTYPE; ++l_Iter)
			{
				l_Items[l_Iter].clear();

				for (ItemTemplate const* l_Template : l_LootTable)
				{
					if (l_Template->InventoryType != l_Iter)
						continue;

					if (p_Player->CanUseItem(l_Template) != InventoryResult::EQUIP_ERR_OK)
						continue;

					if (!l_Template->HasSpec((SpecIndex)l_SpecID, p_Player->getLevel()))
						continue;

					l_Items[l_Iter].push_back(l_Template->ItemId);
				}

				std::random_shuffle(l_Items[l_Iter].begin(), l_Items[l_Iter].end());
			}

			for (uint8 l_Iter = 0; l_Iter < InventoryType::MAX_INVTYPE; ++l_Iter)
			{
				uint8 l_Count = 1;

				switch (l_Iter)
				{
				case InventoryType::INVTYPE_FINGER:
				case InventoryType::INVTYPE_TRINKET:
				case InventoryType::INVTYPE_WEAPON:
					l_Count++;
					break;
				default:
					break;
				}

				for (uint32 l_Item : l_Items[l_Iter])
				{
					if (!l_Count)
						break;

					if (l_ItemsToAdd.find(l_Item) != l_ItemsToAdd.end())
						continue;

					l_ItemsToAdd.insert(l_Item);
					--l_Count;
					++l_ItemCount;
				}
			}

			/// Player doesn't have enough space
			if (p_Player->GetBagsFreeSlots() < l_ItemCount)
			{
				Talk(eTalks::TalkNoSpace, p_Player->GetGUID());
				return false;
			}

			for (uint32 l_Item : l_ItemsToAdd)
				p_Player->AddItem(l_Item, 1);

			return true;
		}
	};

	CreatureAI* GetAI(Creature* p_Creature) const override
	{
		return new npc_hellscream_boosterAI(p_Creature);
	}
};

class npc_fun_gold_vendor : public CreatureScript
{
public:
	npc_fun_gold_vendor() : CreatureScript("npc_fun_gold_vendor") { }

	bool OnGossipHello(Player* p_Player, Creature* p_Creature) override
	{
		p_Player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Give me 50 000 golds! ", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
		p_Player->SEND_GOSSIP_MENU(DEFAULT_GOSSIP_MESSAGE, p_Creature->GetGUID());
		return true;
	}

	struct npc_fun_gold_vendorAI : public ScriptedAI
	{
		npc_fun_gold_vendorAI(Creature* p_Creature) : ScriptedAI(p_Creature) { }

		void sGossipSelect(Player* p_Player, uint32 p_MenuID, uint32 p_Action) override
		{
			p_Player->ModifyMoney(50000 * MoneyConstants::GOLD);
			p_Player->PlayerTalkClass->SendCloseGossip();
		}
	};

	CreatureAI * GetAI(Creature* p_Creature) const override
	{
		return new npc_fun_gold_vendorAI(p_Creature);
	}
};

class npc_fun_transmo_vendor : public CreatureScript
{
public:
	npc_fun_transmo_vendor()
		: CreatureScript("npc_fun_transmo_vendor")
	{
	}

	/// Called when a player opens a gossip dialog with the creature.
	/// @p_Player   : Source player instance
	/// @p_Creature : Target creature instance
	bool OnGossipHello(Player* p_Player, Creature* p_Creature) override
	{
		static const uint8 l_VendorClass[] = {
			CLASS_DEATH_KNIGHT,
			CLASS_DRUID,
			CLASS_HUNTER,
			CLASS_MAGE,
			CLASS_MONK,
			CLASS_PALADIN,
			CLASS_PRIEST,
			CLASS_ROGUE,
			CLASS_SHAMAN,
			CLASS_WARLOCK,
			CLASS_WARRIOR,
		};

		uint8 l_ClassOffset = p_Creature->GetEntry() - 900003;

		if ((l_ClassOffset >= 0 && l_ClassOffset < sizeof(l_VendorClass) && l_VendorClass[l_ClassOffset] == p_Player->getClass()) || p_Player->isGameMaster())
		{
			p_Player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "PvP Transmog", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
			p_Player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "PvE Transmog", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 2);
		}

		p_Player->SEND_GOSSIP_MENU(DEFAULT_GOSSIP_MESSAGE, p_Creature->GetGUID());
		return true;
	}
	/// Called when a player selects a gossip item in the creature's gossip menu.
	/// @p_Player   : Source player instance
	/// @p_Creature : Target creature instance
	/// @p_Sender   : Sender menu
	/// @p_Action   : Action
	virtual bool OnGossipSelect(Player* p_Player, Creature* p_Creature, uint32 p_Sender, uint32 p_Action)
	{
		p_Player->PlayerTalkClass->SendCloseGossip();
		p_Player->GetSession()->SendListInventory(p_Creature->GetGUID(), p_Action == (GOSSIP_ACTION_INFO_DEF + 2), true);
		return false;
	}

};

class npc_legendary_transmogrificator : public CreatureScript
{
public:
	npc_legendary_transmogrificator() : CreatureScript("npc_legendary_transmogrificator") { }

	bool OnGossipHello(Player* player, Creature* creature)
	{
		if (player->getLevel() < 19)
		{
			player->SEND_GOSSIP_MENU(DEFAULT_GOSSIP_MESSAGE, creature->GetGUID());
			return true;
		}

		WorldSession* session = player->GetSession();
		for (uint8 slot = EQUIPMENT_SLOT_START; slot < EQUIPMENT_SLOT_TABARD; slot++) // EQUIPMENT_SLOT_END
		{
			if (Item* newItem = player->GetItemByPos(INVENTORY_SLOT_BAG_0, slot))
			{
				uint32 quality = newItem->GetTemplate()->Quality;
				if (quality == ITEM_QUALITY_UNCOMMON || quality == ITEM_QUALITY_RARE || quality == ITEM_QUALITY_EPIC || quality == ITEM_QUALITY_HEIRLOOM || quality == ITEM_QUALITY_LEGENDARY)
				{
					if (const char* slotName = GetSlotName(slot, session))
						player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, slotName, EQUIPMENT_SLOT_END, slot);
				}
			}
		}
		player->ADD_GOSSIP_ITEM_EXTENDED(GOSSIP_ICON_INTERACT_1, session->GetTrinityString(LANG_OPTION_REMOVE_ALL), EQUIPMENT_SLOT_END + 2, 0, session->GetTrinityString(LANG_POPUP_REMOVE_ALL), 0, false);
		player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TALK, session->GetTrinityString(LANG_OPTION_UPDATE_MENU), EQUIPMENT_SLOT_END + 1, 0);
		player->SEND_GOSSIP_MENU(DEFAULT_GOSSIP_MESSAGE, creature->GetGUID());
		return true;
	}

	bool OnGossipSelect(Player* player, Creature* creature, uint32 sender, uint32 uiAction)
	{
		WorldSession* session = player->GetSession();
		player->PlayerTalkClass->ClearMenus();
		switch (sender)
		{
		case EQUIPMENT_SLOT_END: // Show items you can use
		{
			if (Item* oldItem = player->GetItemByPos(INVENTORY_SLOT_BAG_0, uiAction))
			{
				uint32 lowGUID = player->GetGUIDLow();
				_items[lowGUID].clear();
				uint32 limit = 0;
				for (uint8 i = INVENTORY_SLOT_ITEM_START; i < INVENTORY_SLOT_ITEM_END; i++)
				{
					if (limit > 30)
						break;
					if (Item* newItem = player->GetItemByPos(INVENTORY_SLOT_BAG_0, i))
					{
						uint32 display = newItem->GetTemplate()->DisplayInfoID;

						if (Item::CanTransmogrifyItemWithItem(oldItem->GetTemplate(), newItem->GetTemplate()))
						{
							if (_items[lowGUID].find(display) == _items[lowGUID].end())
							{
								limit++;
								_items[lowGUID][display] = newItem;
								player->ADD_GOSSIP_ITEM_EXTENDED(GOSSIP_ICON_INTERACT_1, GetItemName(newItem, session), uiAction, display, session->GetTrinityString(LANG_POPUP_TRANSMOGRIFY) + GetItemName(newItem, session), GetFakePrice(oldItem), false);
							}
						}
					}
				}

				for (uint8 i = INVENTORY_SLOT_BAG_START; i < INVENTORY_SLOT_BAG_END; i++)
				{
					if (Bag* bag = player->GetBagByPos(i))
					{
						for (uint32 j = 0; j < bag->GetBagSize(); j++)
						{
							if (limit > 30)
								break;
							if (Item* newItem = player->GetItemByPos(i, j))
							{
								uint32 display = newItem->GetTemplate()->DisplayInfoID;
								if (Item::CanTransmogrifyItemWithItem(oldItem->GetTemplate(), newItem->GetTemplate()))
								{
									if (_items[lowGUID].find(display) == _items[lowGUID].end())
									{
										limit++;
										_items[lowGUID][display] = newItem;
										player->ADD_GOSSIP_ITEM_EXTENDED(GOSSIP_ICON_INTERACT_1, GetItemName(newItem, session), uiAction, display, session->GetTrinityString(LANG_POPUP_TRANSMOGRIFY) + GetItemName(newItem, session), GetFakePrice(oldItem), false);
									}
								}
							}
						}
					}
				}

				char popup[250];
				snprintf(popup, 250, session->GetTrinityString(LANG_POPUP_REMOVE_ONE), GetSlotName(uiAction, session));
				player->ADD_GOSSIP_ITEM_EXTENDED(GOSSIP_ICON_INTERACT_1, session->GetTrinityString(LANG_OPTION_REMOVE_ONE), EQUIPMENT_SLOT_END + 3, uiAction, popup, 0, false);
				player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TALK, session->GetTrinityString(LANG_OPTION_BACK), EQUIPMENT_SLOT_END + 1, 0);
				player->SEND_GOSSIP_MENU(DEFAULT_GOSSIP_MESSAGE, creature->GetGUID());
			}
			else
				OnGossipHello(player, creature);

			break;
		}
		case EQUIPMENT_SLOT_END + 1: // Back
		{
			OnGossipHello(player, creature);

			break;
		}
		case EQUIPMENT_SLOT_END + 2: // Remove Transmogrifications
		{
			bool removed = false;
			for (uint8 Slot = EQUIPMENT_SLOT_START; Slot < EQUIPMENT_SLOT_END; Slot++)
			{
				if (Item* newItem = player->GetItemByPos(INVENTORY_SLOT_BAG_0, Slot))
				{
					if (newItem->GetModifier(eItemModifiers::TransmogItemID) != 0 && !removed)
					{
						newItem->SetModifier(eItemModifiers::TransmogItemID, 0);
						player->SetVisibleItemSlot(uiAction, newItem);

						removed = true;
					}
				}
			}
			if (removed)
			{
				ChatHandler(session).PSendSysMessage(session->GetTrinityString(LANG_REM_TRANSMOGRIFICATIONS_ITEMS));
				player->PlayDirectSound(3337);
			}
			else
				session->SendNotification(session->GetTrinityString(LANG_ERR_NO_TRANSMOGRIFICATIONS));

			OnGossipHello(player, creature);

			break;
		}
		case EQUIPMENT_SLOT_END + 3: // Remove Transmogrification from single item
		{
			if (Item* newItem = player->GetItemByPos(INVENTORY_SLOT_BAG_0, uiAction))
			{
				if (newItem->GetModifier(eItemModifiers::TransmogItemID) != 0)
				{
					newItem->SetModifier(eItemModifiers::TransmogItemID, 0);
					player->SetVisibleItemSlot(uiAction, newItem);

					ChatHandler(session).PSendSysMessage(session->GetTrinityString(LANG_REM_TRANSMOGRIFICATION_ITEM), GetSlotName(uiAction, session));
					player->PlayDirectSound(3337);
				}
				else
					session->SendNotification(session->GetTrinityString(LANG_ERR_NO_TRANSMOGRIFICATION), GetSlotName(uiAction, session));
			}

			OnGossipSelect(player, creature, EQUIPMENT_SLOT_END, uiAction);

			break;
		}
		default: // Transmogrify
		{
			uint32 lowGUID = player->GetGUIDLow();
			if (Item* oldItem = player->GetItemByPos(INVENTORY_SLOT_BAG_0, sender))
			{
				if (_items[lowGUID].find(uiAction) != _items[lowGUID].end() && _items[lowGUID][uiAction]->IsInWorld())
				{
					Item* newItem = _items[lowGUID][uiAction];
					if (newItem->GetOwnerGUID() == player->GetGUID() && (newItem->IsInBag() || newItem->GetBagSlot() == INVENTORY_SLOT_BAG_0)
						&& Item::CanTransmogrifyItemWithItem(oldItem->GetTemplate(), newItem->GetTemplate()))
					{
						player->ModifyMoney(-1 * GetFakePrice(oldItem)); // take cost

						oldItem->SetModifier(eItemModifiers::TransmogItemID, newItem->GetEntry());
						player->SetVisibleItemSlot(sender, oldItem);

						oldItem->UpdatePlayedTime(player);

						oldItem->SetOwnerGUID(player->GetGUID());
						oldItem->SetNotRefundable(player);
						oldItem->ClearSoulboundTradeable(player);

						if (newItem != nullptr)
						{
							if (newItem->GetTemplate()->Bonding == BIND_WHEN_EQUIPED || newItem->GetTemplate()->Bonding == BIND_WHEN_USE)
								newItem->SetBinding(true);

							newItem->SetOwnerGUID(player->GetGUID());
							newItem->SetNotRefundable(player);
							newItem->ClearSoulboundTradeable(player);
							newItem->SetState(ITEM_CHANGED, player);
						}

						oldItem->SetState(ITEM_CHANGED, player);

						player->PlayDirectSound(3337);

						ChatHandler(session).PSendSysMessage(session->GetTrinityString(LANG_ITEM_TRANSMOGRIFIED), GetSlotName(sender, session));
					}
					else
						session->SendNotification(session->GetTrinityString(LANG_ERR_NO_ITEM_SUITABLE));
				}
				else
					session->SendNotification(session->GetTrinityString(LANG_ERR_NO_ITEM_EXISTS));
			}
			else
				session->SendNotification(session->GetTrinityString(LANG_ERR_EQUIP_SLOT_EMPTY));

			_items[lowGUID].clear();
			OnGossipSelect(player, creature, EQUIPMENT_SLOT_END, sender);

			break;
		}
		}
		return true;
	}

private:
	std::map<uint64, std::map<uint32, Item*> > _items; // _items[lowGUID][DISPLAY] = item

	const char * GetSlotName(uint8 slot, WorldSession* session)
	{
		switch (slot)
		{
		case EQUIPMENT_SLOT_HEAD: return session->GetTrinityString(LANG_SLOT_NAME_HEAD);
		case EQUIPMENT_SLOT_SHOULDERS: return session->GetTrinityString(LANG_SLOT_NAME_SHOULDERS);
		case EQUIPMENT_SLOT_BODY: return session->GetTrinityString(LANG_SLOT_NAME_BODY);
		case EQUIPMENT_SLOT_CHEST: return session->GetTrinityString(LANG_SLOT_NAME_CHEST);
		case EQUIPMENT_SLOT_WAIST: return session->GetTrinityString(LANG_SLOT_NAME_WAIST);
		case EQUIPMENT_SLOT_LEGS: return session->GetTrinityString(LANG_SLOT_NAME_LEGS);
		case EQUIPMENT_SLOT_FEET: return session->GetTrinityString(LANG_SLOT_NAME_FEET);
		case EQUIPMENT_SLOT_WRISTS: return session->GetTrinityString(LANG_SLOT_NAME_WRISTS);
		case EQUIPMENT_SLOT_HANDS: return session->GetTrinityString(LANG_SLOT_NAME_HANDS);
		case EQUIPMENT_SLOT_BACK: return session->GetTrinityString(LANG_SLOT_NAME_BACK);
		case EQUIPMENT_SLOT_MAINHAND: return session->GetTrinityString(LANG_SLOT_NAME_MAINHAND);
		case EQUIPMENT_SLOT_OFFHAND: return session->GetTrinityString(LANG_SLOT_NAME_OFFHAND);
		case EQUIPMENT_SLOT_RANGED: return session->GetTrinityString(LANG_SLOT_NAME_RANGED);
		case EQUIPMENT_SLOT_TABARD: return session->GetTrinityString(LANG_SLOT_NAME_TABARD);
		default: return NULL;
		}
	}

	std::string GetItemName(Item* item, WorldSession* session)
	{
		std::string name = item->GetTemplate()->Name1->Get(session->GetSessionDbLocaleIndex());
		return name;
	}

	int32 GetFakePrice(Item* item)
	{
		return item->GetTemplate()->ItemLevel * 12.5f * GOLD;
	}
};


/// Boris <Loyalty Point> - 250000
class npc_loyalty_point : public CreatureScript
{
public:
	npc_loyalty_point() : CreatureScript("npc_loyalty_point") { }

	enum eMenuIDs
	{
		GiveLoyaltyPoint = 92007,
		AlreadyEarnPoint = 92008
	};

	bool OnGossipHello(Player* p_Player, Creature* p_Creature) override
	{
		if (!p_Player)
			return false;

		WorldSession* l_Session = p_Player->GetSession();
		time_t l_NowTime = time(nullptr);

		time_t l_LastClaimTime = l_Session->GetLastClaim();

		auto l_Time = localtime(&l_NowTime);
		struct tm l_Now = *l_Time;
		auto l_LastClaim = localtime(&l_LastClaimTime);

		/// If now is a different day than the last event reset day, then clear event history
		if (l_LastClaim->tm_year != l_Now.tm_year || l_LastClaim->tm_mday != l_Now.tm_mday || l_LastClaim->tm_mon != l_Now.tm_mon)
		{
			uint32 l_Points = 5;

			if (l_Session->GetLastBan() < (time(nullptr) - (MONTH * 6)))
				l_Points += 2;

			if (l_Session->HaveAlreadyPurchasePoints())
				l_Points += 1;

			if (l_Session->IsEmailValidated())
				l_Points += 1;

			if (l_Session->GetActivityDays() > 13)
				l_Points += 1;

			if (l_Session->GetActivityDays() > 59)
				l_Points += 1;

			if (l_Session->GetActivityDays() > 179)
				l_Points += 1;

			if (l_Session->GetActivityDays() > 359)
				l_Points += 1;

			l_Session->AddLoyaltyPoints(l_Points, "NPC Daily reward");
			l_Session->SetLastClaim(time(nullptr));

			PreparedStatement* l_Statement = LoginDatabase.GetPreparedStatement(LOGIN_REP_ACC_LOYALTY);
			l_Statement->setUInt32(0, l_Session->GetAccountId());
			l_Statement->setUInt32(1, l_Session->GetLastClaim());
			l_Statement->setUInt32(2, l_Session->GetLastEventReset());
			LoginDatabase.Execute(l_Statement);

			p_Player->PlayerTalkClass->ClearMenus();
			p_Player->SEND_GOSSIP_MENU(eMenuIDs::GiveLoyaltyPoint, p_Creature->GetGUID());
			return true;
		}

		p_Player->SEND_GOSSIP_MENU(eMenuIDs::AlreadyEarnPoint, p_Creature->GetGUID());
		return true;
	}
};

class Npc_Beastmaster : public CreatureScript
{
public:
	Npc_Beastmaster() : CreatureScript("Npc_Beastmaster") { }

	void CreatePet(Player *player, Creature * m_creature, uint32 entry) {

		if (player->getClass() != CLASS_HUNTER) {
			player->PlayerTalkClass->SendCloseGossip();
			return;
		}

		if (player->GetPet()) {
			m_creature->MonsterWhisper("First you must drop your Pet!", player->GetGUID());
			m_creature->MonsterWhisper("First you must drop your Pet!", player->GetGUID(), true);
			player->PlayerTalkClass->SendCloseGossip();
			return;
		}

		Creature *creatureTarget = m_creature->SummonCreature(entry, player->GetPositionX(), player->GetPositionY() + 2, player->GetPositionZ(), player->GetOrientation(), TEMPSUMMON_CORPSE_TIMED_DESPAWN, 500);
		if (!creatureTarget) return;

		Pet* pet = player->CreateTamedPetFrom(creatureTarget, 0);
		if (!pet) return;

		// kill original creature
		creatureTarget->setDeathState(JUST_DIED);
		creatureTarget->RemoveCorpse();
		creatureTarget->SetHealth(0);                       // just for nice GM-mode view


															// prepare visual effect for levelup
		pet->SetUInt32Value(UNIT_FIELD_LEVEL, player->getLevel() - 1);
		pet->GetMap()->AddToMap(pet->ToCreature());
		// visual effect for levelup
		pet->SetUInt32Value(UNIT_FIELD_LEVEL, player->getLevel());

		pet->GetCharmInfo()->SetPetNumber(sObjectMgr->GeneratePetNumber(), true);
		if (!pet->InitStatsForLevel(player->getLevel()))
			sLog->outInfo(LOG_FILTER_PETS, "Pet Create fail: no init stats for entry %u", entry);

		pet->UpdateAllStats();

		// caster have pet now
		// caster have pet now
		player->SetMinion(pet, true, player->getSlotForNewPet());

		pet->SavePetToDB(PET_SLOT_ACTUAL_PET_SLOT);
		player->PetSpellInitialize();

		//end
		player->PlayerTalkClass->SendCloseGossip();
		m_creature->MonsterWhisper("Pet added. You might want to feed it and name it somehow.", player->GetGUID());
		m_creature->MonsterWhisper("Pet added. You might want to feed it and name it somehow.", player->GetGUID(), true);
	}


	bool OnGossipHello(Player *player, Creature * m_creature)
	{

		if (player->getClass() != CLASS_HUNTER)
		{
			m_creature->MonsterWhisper("You are not a Hunter!", player->GetGUID(), true);
			return true;
		}
		player->ADD_GOSSIP_ITEM(4, "Get a New Pet.", GOSSIP_SENDER_MAIN, 30);
		if (player->CanTameExoticPets())
		{
			player->ADD_GOSSIP_ITEM(4, "Get a New Exotic Pet.", GOSSIP_SENDER_MAIN, 50);
		}
		player->ADD_GOSSIP_ITEM(5, "Close Beastmaster Window.", GOSSIP_SENDER_MAIN, 150);
		player->SEND_GOSSIP_MENU(1, m_creature->GetGUID());
		return true;
	}

	bool OnGossipSelect(Player *player, Creature * m_creature, uint32 sender, uint32 action)
	{
		player->PlayerTalkClass->ClearMenus();
		switch (action)
		{

		case 100:
			player->ADD_GOSSIP_ITEM(4, "Get new pet from here PFFGamer!", GOSSIP_SENDER_MAIN, 30);
			if (player->CanTameExoticPets())
			{
				player->ADD_GOSSIP_ITEM(4, "Get a New Exotic Pet from here PFFGamer!", GOSSIP_SENDER_MAIN, 50);
			}
			player->ADD_GOSSIP_ITEM(2, "Take me to the Stable.", GOSSIP_SENDER_MAIN, GOSSIP_OPTION_STABLEPET);
			player->ADD_GOSSIP_ITEM(6, "Sell me some Food for my Pet.", GOSSIP_SENDER_MAIN, GOSSIP_OPTION_VENDOR);
			player->ADD_GOSSIP_ITEM(5, "Close Beastmaster Window.", GOSSIP_SENDER_MAIN, 150);
			player->SEND_GOSSIP_MENU(1, m_creature->GetGUID());
			break;

		case 30:
			player->ADD_GOSSIP_ITEM(2, "<- Back to Main Menu.", GOSSIP_SENDER_MAIN, 100);
			player->ADD_GOSSIP_ITEM(4, "Next Page. ->", GOSSIP_SENDER_MAIN, 31);
			player->ADD_GOSSIP_ITEM(6, "Bat.", GOSSIP_SENDER_MAIN, 18);
			player->ADD_GOSSIP_ITEM(6, "Bear.", GOSSIP_SENDER_MAIN, 1);
			player->ADD_GOSSIP_ITEM(6, "Boar.", GOSSIP_SENDER_MAIN, 2);
			player->ADD_GOSSIP_ITEM(6, "Cat.", GOSSIP_SENDER_MAIN, 4);
			player->ADD_GOSSIP_ITEM(6, "Carrion Bird.", GOSSIP_SENDER_MAIN, 5);
			player->ADD_GOSSIP_ITEM(6, "Crab.", GOSSIP_SENDER_MAIN, 6);
			player->ADD_GOSSIP_ITEM(6, "Crocolisk.", GOSSIP_SENDER_MAIN, 7);
			player->ADD_GOSSIP_ITEM(6, "Dragonhawk.", GOSSIP_SENDER_MAIN, 17);
			player->ADD_GOSSIP_ITEM(6, "Gorilla.", GOSSIP_SENDER_MAIN, 8);
			player->ADD_GOSSIP_ITEM(6, "Hound.", GOSSIP_SENDER_MAIN, 9);
			player->ADD_GOSSIP_ITEM(6, "Hyena.", GOSSIP_SENDER_MAIN, 10);
			player->ADD_GOSSIP_ITEM(6, "Moth.", GOSSIP_SENDER_MAIN, 11);
			player->ADD_GOSSIP_ITEM(6, "Owl.", GOSSIP_SENDER_MAIN, 12);
			player->SEND_GOSSIP_MENU(1, m_creature->GetGUID());
			break;

		case 31:
			player->ADD_GOSSIP_ITEM(2, "<- Back to Main Menu.", GOSSIP_SENDER_MAIN, 30);
			player->ADD_GOSSIP_ITEM(4, "<- Previous Page.", GOSSIP_SENDER_MAIN, 30);
			player->ADD_GOSSIP_ITEM(6, "Raptor.", GOSSIP_SENDER_MAIN, 20);
			player->ADD_GOSSIP_ITEM(6, "Ravager.", GOSSIP_SENDER_MAIN, 19);
			player->ADD_GOSSIP_ITEM(6, "Strider.", GOSSIP_SENDER_MAIN, 13);
			player->ADD_GOSSIP_ITEM(6, "Scorpid.", GOSSIP_SENDER_MAIN, 414);
			player->ADD_GOSSIP_ITEM(6, "Spider.", GOSSIP_SENDER_MAIN, 16);
			player->ADD_GOSSIP_ITEM(6, "Serpent.", GOSSIP_SENDER_MAIN, 21);
			player->ADD_GOSSIP_ITEM(6, "Turtle.", GOSSIP_SENDER_MAIN, 15);
			player->ADD_GOSSIP_ITEM(6, "Wasp.", GOSSIP_SENDER_MAIN, 93);
			player->SEND_GOSSIP_MENU(1, m_creature->GetGUID());
			break;

		case 50:
			player->ADD_GOSSIP_ITEM(2, "<- Back to Main Menu.", GOSSIP_SENDER_MAIN, 100);
			player->ADD_GOSSIP_ITEM(2, "<- Get a New Normal Pet.", GOSSIP_SENDER_MAIN, 100);
			player->ADD_GOSSIP_ITEM(6, "Chimaera.", GOSSIP_SENDER_MAIN, 51);
			player->ADD_GOSSIP_ITEM(6, "Core Hound.", GOSSIP_SENDER_MAIN, 52);
			player->ADD_GOSSIP_ITEM(6, "Devilsaur.", GOSSIP_SENDER_MAIN, 53);
			player->ADD_GOSSIP_ITEM(6, "Rhino.", GOSSIP_SENDER_MAIN, 54);
			player->ADD_GOSSIP_ITEM(6, "Silithid.", GOSSIP_SENDER_MAIN, 55);
			player->ADD_GOSSIP_ITEM(6, "Worm.", GOSSIP_SENDER_MAIN, 56);
			player->ADD_GOSSIP_ITEM(6, "Loque'nahak.", GOSSIP_SENDER_MAIN, 57);
			player->ADD_GOSSIP_ITEM(6, "Skoll.", GOSSIP_SENDER_MAIN, 58);
			player->ADD_GOSSIP_ITEM(6, "Gondria.", GOSSIP_SENDER_MAIN, 59);
			player->SEND_GOSSIP_MENU(1, m_creature->GetGUID());
			break;

		case GOSSIP_OPTION_STABLEPET:
			player->GetSession()->SendStablePet(m_creature->GetGUID());
			break;
		case GOSSIP_OPTION_VENDOR:
			player->GetSession()->SendListInventory(m_creature->GetGUID());
			break;
		case 51: //chimera
			CreatePet(player, m_creature, 21879);
			break;
		case 52: //core hound
			CreatePet(player, m_creature, 21108);
			break;
		case 53: //Devilsaur
			CreatePet(player, m_creature, 20931);
			break;
		case 54: //rhino
			CreatePet(player, m_creature, 30445);
			break;
		case 55: //silithid
			CreatePet(player, m_creature, 5460);
			break;
		case 56: //Worm
			CreatePet(player, m_creature, 30148);
			break;
		case 57: //Loque'nahak
			CreatePet(player, m_creature, 32517);
			break;
		case 58: //Skoll
			CreatePet(player, m_creature, 35189);
			break;
		case 59: //Gondria
			CreatePet(player, m_creature, 33776);
			break;
		case 16: //Spider
			CreatePet(player, m_creature, 2349);
			break;
		case 17: //Dragonhawk
			CreatePet(player, m_creature, 27946);
			break;
		case 18: //Bat
			CreatePet(player, m_creature, 28233);
			break;
		case 19: //Ravager
			CreatePet(player, m_creature, 17199);
			break;
		case 20: //Raptor
			CreatePet(player, m_creature, 14821);
			break;
		case 21: //Serpent
			CreatePet(player, m_creature, 28358);
			break;
		case 1: //bear
			CreatePet(player, m_creature, 29319);
			break;
		case 2: //Boar
			CreatePet(player, m_creature, 29996);
			break;
		case 93: //Bug
			CreatePet(player, m_creature, 28085);
			break;
		case 4: //cat
			CreatePet(player, m_creature, 28097);
			break;
		case 5: //carrion
			CreatePet(player, m_creature, 26838);
			break;
		case 6: //crab
			CreatePet(player, m_creature, 24478);
			break;
		case 7: //crocolisk
			CreatePet(player, m_creature, 1417);
			break;
		case 8: //gorila
			CreatePet(player, m_creature, 28213);
			break;
		case 9: //hound
			CreatePet(player, m_creature, 29452);
			break;
		case 10: //hynea
			CreatePet(player, m_creature, 13036);
			break;
		case 11: //Moth
			CreatePet(player, m_creature, 27421);
			break;
		case 12: //owl
			CreatePet(player, m_creature, 23136);
			break;
		case 13: //strider
			CreatePet(player, m_creature, 22807);
			break;
		case 414: //scorpid
			CreatePet(player, m_creature, 9698);
			break;
		case 15: //turtle
			CreatePet(player, m_creature, 25482);
			break;
		case 150:
		{

		}
		}
		return true;
	}
};

#include "ScriptPCH.h"

class Reset_OnDuelEnd : public PlayerScript
{
public:
	Reset_OnDuelEnd() : PlayerScript("Reset_OnDuelEnd") {}

	void OnDuelEnd(Player *winner, Player *looser, DuelCompleteType type)
	{
		// Resets Players 1
		winner->RemoveArenaSpellCooldowns();
		winner->SetHealth(winner->GetMaxHealth());
		winner->SetPower(winner->getPowerType(), winner->GetMaxPower(winner->getPowerType()));
		// Resets Player 2
		looser->RemoveArenaSpellCooldowns();
		looser->SetHealth(looser->GetMaxHealth());
		looser->SetPower(looser->getPowerType(), looser->GetMaxPower(looser->getPowerType()));
		//   }
	}
};

// Set USE_TOKEN to 1 if you want to have it use tokens in place of gold
#define USE_TOKEN 	1
#define TOKEN_ID	40752

struct BloodMoneyInfo
{
	uint64 guid;
	uint32 amount;
	bool accepted;
};

typedef std::list<BloodMoneyInfo> BloodMoneyList;
typedef std::map<uint64, BloodMoneyList> BloodMoney;
static BloodMoney m_bloodMoney;

bool HasBloodMoneyChallenger(uint64 playerGUID)
{
	return m_bloodMoney.find(playerGUID) != m_bloodMoney.end();
}

bool HasBloodMoneyChallenger(uint64 targetGUID, uint64 playerGUID)
{
	if (!HasBloodMoneyChallenger(targetGUID))
		return false;
	BloodMoneyList bml = m_bloodMoney[targetGUID];
	for (BloodMoneyList::const_iterator itr = bml.begin(); itr != bml.end(); ++itr)
		if (itr->guid == playerGUID)
			return true;
	return false;
}

void AddBloodMoneyEntry(uint64 targetGUID, uint64 playerGUID, uint32 amount)
{
	BloodMoneyInfo bmi;
	bmi.guid = playerGUID;
	bmi.amount = amount;
	bmi.accepted = false;
	m_bloodMoney[targetGUID].push_back(bmi);
}

void RemoveBloodMoneyEntry(uint64 targetGUID, uint64 playerGUID)
{
	if (!HasBloodMoneyChallenger(targetGUID, playerGUID))
		return;
	BloodMoneyList &list = m_bloodMoney[targetGUID];
	BloodMoneyList::iterator itr;
	for (itr = list.begin(); itr != list.begin(); ++itr)
		if (itr->guid == playerGUID)
			break;
	list.erase(itr);
}

void SetChallengeAccepted(uint64 targetGUID, uint64 playerGUID)
{
	if (!HasBloodMoneyChallenger(targetGUID, playerGUID))
		return;
	BloodMoneyList &list = m_bloodMoney[targetGUID];
	BloodMoneyList::iterator itr;
	for (itr = list.begin(); itr != list.end(); ++itr)
	{
		if (itr->guid == playerGUID)
		{
			itr->accepted = true;
			break;
		}
	}
}

class npc_blood_money : public CreatureScript
{
public:
	npc_blood_money() : CreatureScript("npc_blood_money") {}

	bool OnGossipHello(Player * player, Creature * creature)
	{
		player->PlayerTalkClass->ClearMenus();
		player->ADD_GOSSIP_ITEM(GOSSIP_ICON_BATTLE, "Stake a Player with [Emblem of Heroism]", 11, 1000);
		if (HasBloodMoneyChallenger(player->GetGUID()))
		{
			BloodMoneyList list = m_bloodMoney[player->GetGUID()];
			for (BloodMoneyList::const_iterator itr = list.begin(); itr != list.end(); ++itr)
			{
				char msg[50];

				if (Player* plr = Player::GetPlayer(*player, itr->guid))
				{
					if (USE_TOKEN)
					{
						sprintf(msg, "Accept %s's Challenge of %d tokens", plr->GetName(), itr->amount);
						player->ADD_GOSSIP_ITEM(GOSSIP_ICON_INTERACT_1, msg, GOSSIP_SENDER_MAIN, itr->guid);
						sprintf(msg, "Decline %s's Challenge of %d tokens", plr->GetName(), itr->amount);
						player->ADD_GOSSIP_ITEM(GOSSIP_ICON_INTERACT_1, msg, GOSSIP_SENDER_INFO, itr->guid);
					}
					else
					{
						sprintf(msg, "Accept %s's Challenge of %dg", plr->GetName(), itr->amount / 10000);
						player->ADD_GOSSIP_ITEM(GOSSIP_ICON_INTERACT_1, msg, GOSSIP_SENDER_MAIN, itr->guid);
						sprintf(msg, "Decline %s's Challenge of %dg", plr->GetName(), itr->amount / 10000);
						player->ADD_GOSSIP_ITEM(GOSSIP_ICON_INTERACT_1, msg, GOSSIP_SENDER_INFO, itr->guid);
					}

				}
			}
		}
		player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Nevermind", GOSSIP_SENDER_MAIN, 1);

		player->SEND_GOSSIP_MENU(80025, creature->GetGUID());

		return true;
	}

	bool OnGossipSelect(Player * player, Creature * creature, uint32 uiSender, uint32 uiAction)
	{
		player->PlayerTalkClass->ClearMenus();
		if (uiAction == 1)
		{
			player->CLOSE_GOSSIP_MENU();
			return true;
		}
		switch (uiSender)
		{
		case GOSSIP_SENDER_MAIN:
			if (Player* target = Player::GetPlayer(*player, uiAction))
			{
				SetChallengeAccepted(player->GetGUID(), target->GetGUID());
				char msg[60];
				sprintf(msg, "%s has accepted your challenge!", player->GetName());
				creature->MonsterWhisper(msg, target->GetGUID(), true);
				player->CLOSE_GOSSIP_MENU();
			}
			break;
		case GOSSIP_SENDER_INFO:
			if (Player* target = Player::GetPlayer(*player, uiAction))
			{
				char msg[60];
				sprintf(msg, "%s has declined your challenge!", player->GetName());
				creature->MonsterWhisper(msg, target->GetGUID(), true);
				RemoveBloodMoneyEntry(player->GetGUID(), uiAction);
				OnGossipHello(player, creature);
			}
			break;
		case 11:
			if (USE_TOKEN)
			{
				player->ADD_GOSSIP_ITEM_EXTENDED(GOSSIP_ICON_MONEY_BAG, "Stake 5 [Emblem of Heroism]", GOSSIP_SENDER_MAIN, 5, "Type in the player's name", 0, true);
				player->ADD_GOSSIP_ITEM_EXTENDED(GOSSIP_ICON_MONEY_BAG, "Stake 10 [Emblem of Heroism]", GOSSIP_SENDER_MAIN, 10, "Type in the player's name", 0, true);
				player->ADD_GOSSIP_ITEM_EXTENDED(GOSSIP_ICON_MONEY_BAG, "Stake 15 [Emblem of Heroism]", GOSSIP_SENDER_MAIN, 15, "Type in the player's name", 0, true);
				player->ADD_GOSSIP_ITEM_EXTENDED(GOSSIP_ICON_MONEY_BAG, "Stake 25 [Emblem of Heroism]", GOSSIP_SENDER_MAIN, 25, "Type in the player's name", 0, true);
				player->ADD_GOSSIP_ITEM_EXTENDED(GOSSIP_ICON_MONEY_BAG, "Stake 50 [Emblem of Heroism]", GOSSIP_SENDER_MAIN, 50, "Type in the player's name", 0, true);
				player->ADD_GOSSIP_ITEM_EXTENDED(GOSSIP_ICON_MONEY_BAG, "Stake 100 [Emblem of Heroism]", GOSSIP_SENDER_MAIN, 100, "Type in the player's name", 0, true);
				player->ADD_GOSSIP_ITEM_EXTENDED(GOSSIP_ICON_MONEY_BAG, "Stake 150 [Emblem of Heroism]", GOSSIP_SENDER_MAIN, 150, "Type in the player's name", 0, true);
				player->ADD_GOSSIP_ITEM_EXTENDED(GOSSIP_ICON_MONEY_BAG, "Stake 200 [Emblem of Heroism]", GOSSIP_SENDER_MAIN, 200, "Type in the player's name", 0, true);
				player->ADD_GOSSIP_ITEM_EXTENDED(GOSSIP_ICON_MONEY_BAG, "Stake 250 [Emblem of Heroism]", GOSSIP_SENDER_MAIN, 250, "Type in the player's name", 0, true);
				player->ADD_GOSSIP_ITEM_EXTENDED(GOSSIP_ICON_MONEY_BAG, "Stake 500 [Emblem of Heroism]", GOSSIP_SENDER_MAIN, 500, "Type in the player's name", 0, true);
			}
			else
			{
				player->ADD_GOSSIP_ITEM_EXTENDED(GOSSIP_ICON_MONEY_BAG, "Bet 5g", GOSSIP_SENDER_MAIN, 5, "Type in the player's name", 0, true);
				player->ADD_GOSSIP_ITEM_EXTENDED(GOSSIP_ICON_MONEY_BAG, "Bet 10g", GOSSIP_SENDER_MAIN, 10, "Type in the player's name", 0, true);
				player->ADD_GOSSIP_ITEM_EXTENDED(GOSSIP_ICON_MONEY_BAG, "Bet 15g", GOSSIP_SENDER_MAIN, 15, "Type in the player's name", 0, true);
				player->ADD_GOSSIP_ITEM_EXTENDED(GOSSIP_ICON_MONEY_BAG, "Bet 25g", GOSSIP_SENDER_MAIN, 25, "Type in the player's name", 0, true);
				player->ADD_GOSSIP_ITEM_EXTENDED(GOSSIP_ICON_MONEY_BAG, "Bet 50g", GOSSIP_SENDER_MAIN, 50, "Type in the player's name", 0, true);
				player->ADD_GOSSIP_ITEM_EXTENDED(GOSSIP_ICON_MONEY_BAG, "Bet 100g", GOSSIP_SENDER_MAIN, 100, "Type in the player's name", 0, true);
				player->ADD_GOSSIP_ITEM_EXTENDED(GOSSIP_ICON_MONEY_BAG, "Bet 150g", GOSSIP_SENDER_MAIN, 150, "Type in the player's name", 0, true);
				player->ADD_GOSSIP_ITEM_EXTENDED(GOSSIP_ICON_MONEY_BAG, "Bet 200g", GOSSIP_SENDER_MAIN, 200, "Type in the player's name", 0, true);
				player->ADD_GOSSIP_ITEM_EXTENDED(GOSSIP_ICON_MONEY_BAG, "Bet 250g", GOSSIP_SENDER_MAIN, 250, "Type in the player's name", 0, true);
				player->ADD_GOSSIP_ITEM_EXTENDED(GOSSIP_ICON_MONEY_BAG, "Bet 500g", GOSSIP_SENDER_MAIN, 500, "Type in the player's name", 0, true);
			}

			player->SEND_GOSSIP_MENU(80025, creature->GetGUID());
			break;
		}
		return true;
	}

	bool OnGossipSelectCode(Player* player, Creature* creature, uint32 sender, uint32 action, const char* code)
	{
		if (player->GetName() == code)
		{
			ChatHandler(player->GetSession()).PSendSysMessage("|cff800C0C[Hellscream Staking] |cffFFFFFFNow why would you want to challenge yourself?");
			return false;
		}
		if (uint64 targetGUID = sObjectMgr->GetPlayerGUIDByName(code))
		{
			if (Player* target = Player::GetPlayer(*player, targetGUID))
			{
				if (target->GetZoneId() == player->GetZoneId())
				{
					if (USE_TOKEN)
					{
						if (target->GetItemCount(TOKEN_ID) < action)
						{
							ChatHandler(player->GetSession()).PSendSysMessage("|cff800C0C[Hellscream Staking] |cffFFFFFFThat player does not have enough tokens to make the bet!");
							player->CLOSE_GOSSIP_MENU();
							return false;
						}
						if (player->GetItemCount(TOKEN_ID) < action)
						{
							ChatHandler(player->GetSession()).PSendSysMessage("|cff800C0C[Hellscream Staking] |cffFFFFFFYou do not have enough tokens to make the bet!");
							player->CLOSE_GOSSIP_MENU();
							return false;
						}

						bool found = false;
						if (HasBloodMoneyChallenger(player->GetGUID()))
						{
							BloodMoneyList list = m_bloodMoney[player->GetGUID()];
							for (BloodMoneyList::const_iterator itr = list.begin(); itr != list.end(); ++itr)
								if (itr->guid == target->GetGUID())
									found = true;
						}
						if (!found)
						{
							if (!HasBloodMoneyChallenger(target->GetGUID(), player->GetGUID()))
							{
								AddBloodMoneyEntry(target->GetGUID(), player->GetGUID(), action);
								char msg[60];
								sprintf(msg, "%n has requested a Blood Money duel with you!", player->GetName());
								creature->MonsterWhisper(msg, target->GetGUID(), true);
							}
							else
								ChatHandler(target->GetSession()).PSendSysMessage("|cff800C0C[Hellscream Staking] |cffFFFFFFYou cannot request a duel with the same person!");
						}
						else
							ChatHandler(player->GetSession()).PSendSysMessage("|cff800C0C[Hellscream Staking] |cffFFFFFFYou cannot request a duel with somebody that has challenged you!");
						player->CLOSE_GOSSIP_MENU();
						return true;
					}
					else
					{
						uint32 money = action * 10000;
						if (target->GetMoney() < money)
						{
							ChatHandler(player->GetSession()).PSendSysMessage("|cff800C0C[Hellscream Staking] |cffFFFFFFThat player does not have enough money to make the bet!");
							player->CLOSE_GOSSIP_MENU();
							return false;
						}
						if (player->GetMoney() < money)
						{
							ChatHandler(player->GetSession()).PSendSysMessage("|cff800C0C[Hellscream Staking] |cffFFFFFFYou do not have enough money to make the bet!");
							player->CLOSE_GOSSIP_MENU();
							return false;
						}

						bool found = false;
						if (HasBloodMoneyChallenger(player->GetGUID()))
						{
							BloodMoneyList list = m_bloodMoney[player->GetGUID()];
							for (BloodMoneyList::const_iterator itr = list.begin(); itr != list.end(); ++itr)
								if (itr->guid == target->GetGUID())
									found = true;
						}
						if (!found)
						{
							if (!HasBloodMoneyChallenger(target->GetGUID(), player->GetGUID()))
							{
								AddBloodMoneyEntry(target->GetGUID(), player->GetGUID(), money);
								char msg[60];
								sprintf(msg, "%s has requested a Blood Money duel with you!", player->GetName());
								creature->MonsterWhisper(msg, target->GetGUID(), true);
							}
							else
								ChatHandler(target->GetSession()).PSendSysMessage("|cff800C0C[Hellscream Staking] |cffFFFFFFYou cannot request a duel with the same person!");
						}
						else
							ChatHandler(player->GetSession()).PSendSysMessage("|cff800C0C[Hellscream Staking] |cffFFFFFFYou cannot request a duel with somebody that has challenged you!");
						player->CLOSE_GOSSIP_MENU();
						return true;
					}

				}
				else
				{
					ChatHandler(player->GetSession()).PSendSysMessage("|cff800C0C[Hellscream Staking] |cffFFFFFFThat player is not in your zone!");
					player->CLOSE_GOSSIP_MENU();
					return false;
				}
			}
			else
			{
				ChatHandler(player->GetSession()).PSendSysMessage("|cff800C0C[Hellscream Staking] |cffFFFFFFThat player was not found!");
				player->CLOSE_GOSSIP_MENU();
				return false;
			}
		}
		else
		{
			ChatHandler(player->GetSession()).PSendSysMessage("|cff800C0C[Hellscream Staking] |cffFFFFFFThat player was not found!");
			player->CLOSE_GOSSIP_MENU();
			return false;
		}
		player->CLOSE_GOSSIP_MENU();
		return true;
	}

};

class BloodMoneyReward : public PlayerScript
{
public:
	BloodMoneyReward() : PlayerScript("BloodMoneyReward") {}

	void OnDuelEnd(Player* winner, Player* loser, DuelCompleteType type)
	{
		if (type == DUEL_INTERRUPTED)
			return;
		if (HasBloodMoneyChallenger(winner->GetGUID()) || HasBloodMoneyChallenger(loser->GetGUID()))
		{
			BloodMoneyList list1 = m_bloodMoney[winner->GetGUID()];
			BloodMoneyList list2 = m_bloodMoney[loser->GetGUID()];

			BloodMoneyList::const_iterator itr;
			for (itr = list1.begin(); itr != list1.end(); ++itr)
			{
				if (itr->guid == loser->GetGUID() && itr->accepted)
				{
					if (USE_TOKEN)
					{
						if (loser->GetItemCount(TOKEN_ID) > itr->amount)
						{
							winner->AddItem(TOKEN_ID, itr->amount);
							ChatHandler(winner->GetSession()).PSendSysMessage("|cff800C0C[Hellscream Staking] |cffFFFFFFCongratulations on winning %d tokens!", itr->amount);
							Item* item = loser->GetItemByEntry(TOKEN_ID);
							loser->DestroyItemCount(TOKEN_ID, itr->amount, true);
							RemoveBloodMoneyEntry(winner->GetGUID(), itr->guid);
						}
						else
						{
							ChatHandler(winner->GetSession()).PSendSysMessage("|cff800C0C[Hellscream Staking] |cffFFFFFFSorry, but your opponent did not have enough tokens to pay off the bet");
							ChatHandler(loser->GetSession()).PSendSysMessage("|cff800C0C[Hellscream Staking] |cffFFFFFFYou did not have enough tokens to pay off the bet!");
						}
						return;
					}
					else
					{
						if (loser->GetMoney() > itr->amount)
						{
							winner->ModifyMoney(itr->amount);
							ChatHandler(winner->GetSession()).PSendSysMessage("|cff800C0C[Hellscream Staking] |cffFFFFFFCongratulations on winning %dg!", itr->amount / 10000);
							loser->ModifyMoney((int32)(-itr->amount));
							RemoveBloodMoneyEntry(winner->GetGUID(), itr->guid);
						}
						else
						{
							ChatHandler(winner->GetSession()).PSendSysMessage("|cff800C0C[Hellscream Staking] |cffFFFFFFSorry, but your opponent did not have enough money to pay off the bet");
							ChatHandler(loser->GetSession()).PSendSysMessage("|cff800C0C[Hellscream Staking] |cffFFFFFFYou did not have enough money to pay off the bet!");
						}
						return;
					}
				}
			}
			for (itr = list2.begin(); itr != list2.end(); ++itr)
			{
				if (itr->guid == winner->GetGUID() && itr->accepted)
				{
					if (USE_TOKEN)
					{
						if (loser->GetItemCount(TOKEN_ID) > itr->amount)
						{
							winner->AddItem(TOKEN_ID, itr->amount);
							ChatHandler(winner->GetSession()).PSendSysMessage("|cff800C0C[Hellscream Staking] |cffFFFFFFCongratulations on winning %d tokens!", itr->amount);
							Item* item = loser->GetItemByEntry(TOKEN_ID);
							loser->DestroyItemCount(TOKEN_ID, itr->amount, true);
							RemoveBloodMoneyEntry(loser->GetGUID(), itr->guid);
						}
						else
						{
							ChatHandler(winner->GetSession()).PSendSysMessage("|cff800C0C[Hellscream Staking] |cffFFFFFFSorry, but your opponent did not have enough tokens to pay off the bet");
							ChatHandler(loser->GetSession()).PSendSysMessage("|cff800C0C[Hellscream Staking] |cffFFFFFFYou did not have enough tokens to pay off the bet!");
						}
						return;
					}
					else
					{
						if (loser->GetMoney() > itr->amount)
						{
							winner->ModifyMoney(itr->amount);
							ChatHandler(winner->GetSession()).PSendSysMessage("|cff800C0C[Hellscream Staking] |cffFFFFFFCongratulations on winning %dg!", itr->amount / 10000);
							loser->ModifyMoney((int32)(-itr->amount));
							RemoveBloodMoneyEntry(loser->GetGUID(), itr->guid);
						}
						else
						{
							ChatHandler(winner->GetSession()).PSendSysMessage("|cff800C0C[Hellscream Staking] |cffFFFFFFSorry, but your opponent did not have enough money to pay off the bet");
							ChatHandler(loser->GetSession()).PSendSysMessage("|cff800C0C[Hellscream Staking] |cffFFFFFFYou did not have enough money to pay off the bet!");
						}
						return;
					}
				}
			}

		}
	}
};

float Version = 2.50f; //Don't touch this.
bool PvPSystemEnabled = true; //Set to false if you want to disable the PvP System
bool OnlyInBattlegrounds = false; //Set to true if you want to enable this only in battlegrounds.
bool LooseTokenOnPvPDeath = true; //Set to true if you want the victim to loose tokens when the victim dies.
int32 AmountOfItemsYouWantTheVictimToLoose = 1; //Amount of items you want the victim to loose when victim dies.
bool AddTokenOnPvPKill = true; //Set to false if you don't want the killer to be rewarded.
int32 ItemReward = 40752; //The ItemID of the reward.
int32 AmountOfRewardsOnKillStreak[12] = { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2 }; //With how many items you want to reward the killer when he slays the victim.
int32 HowManyTimesYouWantTheKillerToGetAwardedForKillingTheSameVictim = 15; //Name speaks for It self.
const int32 KillerStreak15 = 15;
const int32 KillerStreak20 = 20;
const int32 KillerStreak30 = 30;
const int32 KillerStreak40 = 35;
const int32 KillerStreak50 = 40;
const int32 KillerStreak60 = 45;
const int32 KillerStreak70 = 50;
const int32 KillerStreak80 = 55;
const int32 KillerStreak90 = 60;
const int32 KillerStreak100 = 65;
const int32 KillerStreak110 = 70;
const int32 KillerStreak120 = 75;
const int32 KillerStreak130 = 80;
const int32 KillerStreak140 = 85;
int32 KillStreaks[14] = { KillerStreak15, KillerStreak20, KillerStreak30, KillerStreak40, KillerStreak50, KillerStreak60, KillerStreak70, KillerStreak80, KillerStreak90, KillerStreak100, KillerStreak110, KillerStreak120 ,KillerStreak130, KillerStreak140 };
///////////////////////////////////////////////////////////////////
///////////////////////      END      ////////////////////////////
/////////////////////////////////////////////////////////////////


struct SystemInfo
{
	uint32 KillStreak;
	uint32 LastGUIDKill;
	uint8 KillCount;
};

static std::map<uint32, SystemInfo> KillingStreak;

class System_OnPVPKill : public PlayerScript
{
public:
	System_OnPVPKill() : PlayerScript("System_OnPVPKill") {}


	void OnPVPKill(Player *pKiller, Player *pVictim)
	{
		if (PvPSystemEnabled == false)
		{
			return;
		}
		else if (PvPSystemEnabled == true)
		{
			uint32 kGUID;
			uint32 vGUID;
			char msg[500];
			kGUID = pKiller->GetGUID();
			vGUID = pVictim->GetGUID();
			if (kGUID == vGUID)
			{
				return;
			}

			if (KillingStreak[kGUID].LastGUIDKill == vGUID)
			{
				KillingStreak[kGUID].KillCount++;
				KillingStreak[vGUID].KillCount = 1;
				pKiller->AddItem(ItemReward, 1);
				if (LooseTokenOnPvPDeath == true)
					pVictim->DestroyItemCount(ItemReward, AmountOfItemsYouWantTheVictimToLoose, true, false);
			}
			if (KillingStreak[kGUID].LastGUIDKill != vGUID)
			{
				KillingStreak[kGUID].KillCount = 1;
				KillingStreak[vGUID].KillCount = 1;
			}

			if (KillingStreak[kGUID].KillCount == HowManyTimesYouWantTheKillerToGetAwardedForKillingTheSameVictim)
			{
				return;
			}

			if (OnlyInBattlegrounds == true)
			{
				if (!pKiller->GetMap()->IsBattleground())
					return;
			}

			KillingStreak[kGUID].KillStreak++;
			KillingStreak[vGUID].KillStreak = 0;
			KillingStreak[kGUID].LastGUIDKill = vGUID;
			KillingStreak[vGUID].LastGUIDKill = 0;
			if (AddTokenOnPvPKill == true)
				pKiller->AddItem(ItemReward, 1);
			if (LooseTokenOnPvPDeath == true)
				pVictim->DestroyItemCount(ItemReward, AmountOfItemsYouWantTheVictimToLoose, true, false);

			switch (KillingStreak[kGUID].KillStreak)
			{



			case KillerStreak15:
				sprintf(msg, "[Hellscream Kill Streaks] -RANK-(1) - Beware of %s the Criminal who destroyed %s and is warming up with a 15 person killing spree. Rising to the top!", pKiller->GetName(), pVictim->GetName(), KillStreaks[1]);
				sWorld->SendWorldText(LANG_SYSTEMMESSAGE, msg);
				pKiller->AddItem(ItemReward, AmountOfRewardsOnKillStreak[1]);
				pKiller->CastSpell(pKiller, 11010, true);
				break;

			case KillerStreak20:
				sprintf(msg, "[Hellscream Kill Streaks] -RANK-(2) - Avoid %s the Insane who dismembered %s and is on fire with a 20 person killing spree. Inspired by death..", pKiller->GetName(), pVictim->GetName(), KillStreaks[2]);
				sWorld->SendWorldText(LANG_SYSTEMMESSAGE, msg);
				pKiller->AddItem(ItemReward, AmountOfRewardsOnKillStreak[1]);
				pKiller->CastSpell(pKiller, 70571, true);
				break;

			case KillerStreak30:
				sprintf(msg, "[Hellscream Kill Streaks] -RANK-(3) - Watch out! %s the Maniac has slain %s and is on a crazed 30 person killing spree. Full of comtempt!", pKiller->GetName(), pVictim->GetName(), KillStreaks[3]);
				sWorld->SendWorldText(LANG_SYSTEMMESSAGE, msg);
				pKiller->AddItem(ItemReward, AmountOfRewardsOnKillStreak[1]);
				pKiller->CastSpell(pKiller, 69861, true);
				break;

			case KillerStreak40:
				sprintf(msg, "[Hellscream Kill Streaks] -RANK-(4) - Caution! %s the Serial Killer has massacred %s and is on a 35 person killing spree. Focused on the path.", pKiller->GetName(), pVictim->GetName(), KillStreaks[4]);
				sWorld->SendWorldText(LANG_SYSTEMMESSAGE, msg);
				pKiller->AddItem(ItemReward, AmountOfRewardsOnKillStreak[1]);
				pKiller->CastSpell(pKiller, 47335, true);
				break;

			case KillerStreak50:
				sprintf(msg, "[Hellscream Kill Streaks] -RANK-(5) - Fate steps aside as %s the Unmerciful has relinquished %s to the heavens and is on a 40 person killing spree. Demonic intentions", pKiller->GetName(), pVictim->GetName(), KillStreaks[5]);
				sWorld->SendWorldText(LANG_SYSTEMMESSAGE, msg);
				pKiller->AddItem(ItemReward, AmountOfRewardsOnKillStreak[1]);
				pKiller->CastSpell(pKiller, 60342, true);
				break;

			case KillerStreak60:
				sprintf(msg, "[Hellscream Kill Streaks] -RANK-(6) - Attention! %s the Ender has absolved %s and is on a 45 person killing spree. Halfway to the highest of Ken", pKiller->GetName(), pVictim->GetName(), KillStreaks[6]);
				sWorld->SendWorldText(LANG_SYSTEMMESSAGE, msg);
				pKiller->AddItem(ItemReward, AmountOfRewardsOnKillStreak[1]);
				pKiller->CastSpell(pKiller, 62398, true);
				break;

			case KillerStreak70:
				sprintf(msg, "[Hellscream Kill Streaks] -RANK-(7) - Be wary! %s the Gravedigger has buried %s and is raging with a 50 person killing spree. Working the late night shift!", pKiller->GetName(), pVictim->GetName(), KillStreaks[7]);
				sWorld->SendWorldText(LANG_SYSTEMMESSAGE, msg);
				pKiller->AddItem(ItemReward, AmountOfRewardsOnKillStreak[1]);
				pKiller->CastSpell(pKiller, 51929, true);
				break;

			case KillerStreak80:
				sprintf(msg, "[Hellscream Kill Streaks] -RANK-(8) - Like clockwork, %s the Mastermind has tactfully removed %s from battle and is on fire with a 55 person killing spree. Motivated by the one.", pKiller->GetName(), pVictim->GetName(), KillStreaks[8]);
				sWorld->SendWorldText(LANG_SYSTEMMESSAGE, msg);
				pKiller->AddItem(ItemReward, AmountOfRewardsOnKillStreak[1]);
				pKiller->CastSpell(pKiller, 63660, true);
				break;

			case KillerStreak90:
				sprintf(msg, "[Hellscream Kill Streaks] -RANK-(9) - Concealed in the Shadows, %s the Assassinhas slain %s and is on a 60 person killing spree. Seeking revenge for the past.", pKiller->GetName(), pVictim->GetName(), KillStreaks[9]);
				sWorld->SendWorldText(LANG_SYSTEMMESSAGE, msg);
				pKiller->AddItem(ItemReward, AmountOfRewardsOnKillStreak[1]);
				pKiller->CastSpell(pKiller, 43776, true);
				break;

			case KillerStreak100:
				sprintf(msg, "[Hellscream Kill Streaks] -RANK-(10) - Tossing the carcass aside, %s the Bloodletter has devoured %s and is on a 65 person killing spree. Hell walks among the living.", pKiller->GetName(), pVictim->GetName(), KillStreaks[10]);
				sWorld->SendWorldText(LANG_SYSTEMMESSAGE, msg);
				pKiller->AddItem(ItemReward, AmountOfRewardsOnKillStreak[1]);
				pKiller->CastSpell(pKiller, 41969, true);
				break;

			case KillerStreak110:
				sprintf(msg, "[Hellscream Kill Streaks] -RANK-(11) - Cower before %s the Unstoppable who has slain %s and is on a rampaging 70 person killing spree. Second in command to only one!", pKiller->GetName(), pVictim->GetName(), KillStreaks[11]);
				sWorld->SendWorldText(LANG_SYSTEMMESSAGE, msg);
				pKiller->AddItem(ItemReward, AmountOfRewardsOnKillStreak[1]);
				pKiller->CastSpell(pKiller, 19883, true);
				break;

			case KillerStreak120:
				sprintf(msg, "[Hellscream Kill Streaks] -RANK-(12) - Fear %s the Conqueror; who has annihilated yet another victim, %s, and is on a 75 person killing spree. UnMatched by all, can no one stop them?", pKiller->GetName(), pVictim->GetName(), KillStreaks[12]);
				sWorld->SendWorldText(LANG_SYSTEMMESSAGE, msg);
				pKiller->AddItem(ItemReward, AmountOfRewardsOnKillStreak[1]);
				pKiller->CastSpell(pKiller, 72726, true);
				break;

			case KillerStreak130:
				sprintf(msg, "[Hellscream Kill Streaks] -RANK-(13) - Fear %s the Conqueror; who has annihilated yet another victim, %s, and is on a 80 person killing spree. UnMatched by all, can no one stop them?", pKiller->GetName(), pVictim->GetName(), KillStreaks[12]);
				sWorld->SendWorldText(LANG_SYSTEMMESSAGE, msg);
				pKiller->AddItem(ItemReward, AmountOfRewardsOnKillStreak[1]);
				pKiller->CastSpell(pKiller, 11009, true);
				break;

			case KillerStreak140:
				sprintf(msg, "[Hellscream Kill Streaks] -RANK-(14) - Fear %s the Conqueror; who has annihilated yet another victim, %s, and is on a 85 person killing spree. UnMatched by all, can no one stop them?", pKiller->GetName(), pVictim->GetName(), KillStreaks[12]);
				sWorld->SendWorldText(LANG_SYSTEMMESSAGE, msg);
				pKiller->AddItem(ItemReward, AmountOfRewardsOnKillStreak[2]);
				pKiller->CastSpell(pKiller, 42828, true);
				break;





			}
		}


	}
};


class Anti_Advertising : public PlayerScript
{
public:
	Anti_Advertising() : PlayerScript("Anti_Advertising") { }

	bool CheckMessage(Player* player, std::string& msg)
	{
		const char* checks[] = {
			"http:",
			".com",
			".net",
			".org",
			".eu",
			".fr",
			".bg",
			".info",
			".br",
			"https:",
			"www.",
			"no-ip",
			".zapto",
			".biz",
			".servegame",
			".ru",
			".gg",
		};
		const int checksize = sizeof(checks) / sizeof(*checks);

		std::string checkmsg = msg;
		checkmsg.erase(remove_if(checkmsg.begin(), checkmsg.end(), isspace), checkmsg.end());
		std::transform(checkmsg.begin(), checkmsg.end(), checkmsg.begin(), ::tolower);

		if (player->GetSession()->GetSecurity() <= SEC_PLAYER)
		{
			for (int i = 0; i < checksize; ++i)
			{
				if (checkmsg.find(checks[i]) != std::string::npos)
				{
					msg = "";
					ChatHandler(player->GetSession()).PSendSysMessage("Links or Advertisements are not allowed on the Project Hellscream.");
					PreparedStatement * mt = LoginDatabase.GetPreparedStatement(LOGIN_UPD_MUTE_TIME);
					int64 muteTime = time(NULL) + 180;
					player->GetSession()->m_muteTime = muteTime;
					mt->setInt64(0, muteTime);
					return false;
				}
			}
		}

		return true;
	};

	void OnChat(Player* player, uint32 /*type*/, uint32 lang, std::string& msg) override
	{
		if (!CheckMessage(player, msg))
			return;
	}

	void OnChat(Player* player, uint32 /*type*/, uint32 lang, std::string& msg, Player* /*receiver*/) override
	{
		if (!CheckMessage(player, msg))
			return;
	}

	void OnChat(Player* player, uint32 /*type*/, uint32 lang, std::string& msg, Group* /*group*/) override
	{
		if (!CheckMessage(player, msg))
			return;
	}

	void OnChat(Player* player, uint32 /*type*/, uint32 lang, std::string& msg, Guild* /*guild*/) override
	{
		if (!CheckMessage(player, msg))
			return;
	}

	void OnChat(Player* player, uint32 /*type*/, uint32 lang, std::string& msg, Channel* /*channel*/) override
	{
		if (!CheckMessage(player, msg))
			return;
	}
};

struct ReportsInfo
{
	uint32 Times;
};
static std::map<uint32, ReportsInfo> reportTimes;

class ClearTimes : public BasicEvent
{
public:
	ClearTimes() {}

	bool Execute(uint64 /*time*/, uint32 /*diff*/)
	{
		reportTimes.clear();
		return true;
	}
};

class Anti_Farming : PlayerScript
{
public:
	Anti_Farming() : PlayerScript("Anti_Farming") { }

	void OnPVPKill(Player* killer, Player* victim)
	{
		if (killer->GetGUID() == victim->GetGUID())
			return;

		if (killer->GetSession()->GetRemoteAddress() == victim->GetSession()->GetRemoteAddress())
		{
			uint32 key = killer->GetGUID();

			killer->m_Events.AddEvent(new ClearTimes(), killer->m_Events.CalculateTime(60000));
			reportTimes[key].Times++;

			switch (reportTimes[key].Times)
			{
			case 3:
				ChatHandler(killer->GetSession()).PSendSysMessage("[AntiFarming] :: 1/3 to punish.");
				break;
			case 4:
				ChatHandler(killer->GetSession()).PSendSysMessage("[AntiFarming] :: 2/3 to punish.");
				break;
			case 5:
				sWorld->BanCharacter(killer->GetName(), "1d", "Farming", "[AntiFarming]");
				break;
			}
		}

	}
};


class player_assistant : public CreatureScript
{
public:
	player_assistant() : CreatureScript("player_assistant") { }

	bool OnGossipHello(Player* pPlayer, Creature* pCreature)
	{
		if (pPlayer->isInCombat())
		{
			pPlayer->GetSession()->SendNotification("You are in combat");
			return false;
		}
		//pPlayer->GetSession()->SendNotification("Welcome to the Player Hellscream Trainer!");
		pPlayer->ADD_GOSSIP_ITEM(5, "Learn Needed Reputation", GOSSIP_SENDER_MAIN, 4);
		pPlayer->ADD_GOSSIP_ITEM(5, "Learn Dual-Spec", GOSSIP_SENDER_MAIN, 2);
		pPlayer->ADD_GOSSIP_ITEM(5, "Unlearn Dual-Spec", GOSSIP_SENDER_MAIN, 1);
		pPlayer->ADD_GOSSIP_ITEM(5, "Unlearn Talents", GOSSIP_SENDER_MAIN, 3);
		pPlayer->SEND_GOSSIP_MENU(907, pCreature->GetGUID());
		return true;
	}

	bool OnGossipSelect(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
	{
		pPlayer->PlayerTalkClass->ClearMenus();

		switch (uiAction)
		{
		case 1:
		{
			pPlayer->CLOSE_GOSSIP_MENU();
			pPlayer->ResetSpec(pPlayer->GetGUID());
			pPlayer->MonsterWhisper("Your Dual-Specialization have been reset.", pPlayer->GetGUID());
		}break;
		case 2:
		{
			pPlayer->CLOSE_GOSSIP_MENU();
			pPlayer->CastSpell(pPlayer, 63680, false);
			pPlayer->CastSpell(pPlayer, 63624, false);
			pPlayer->MonsterWhisper("Added Dual Talent Specialization.", pPlayer->GetGUID());
		}break;
		case 3:
		{
			pPlayer->CLOSE_GOSSIP_MENU();
			pPlayer->SendTalentWipeConfirm(pPlayer->GetGUID(), true);
			pPlayer->MonsterWhisper("Your Talents have been reset.", pPlayer->GetGUID());
		}break;
		case 4:
		{
			pPlayer->CLOSE_GOSSIP_MENU();
			pPlayer->GetReputationMgr().SetReputation(sFactionStore.LookupEntry(1682), 42999);
			pPlayer->GetReputationMgr().SetReputation(sFactionStore.LookupEntry(1681), 42999);
			pPlayer->MonsterWhisper("Your Reputation's have been added.", pPlayer->GetGUID());
		}break;
		}
		pPlayer->CLOSE_GOSSIP_MENU();
		return true;
	}

};




#ifndef __clang_analyzer__
void AddSC_npc_custom()
{
	new npc_hellscream_teleporter();
	new npc_hellscream_zg();
	new player_assistant();
	new Anti_Advertising();
	new Anti_Farming();
	new Npc_Beastmaster();
	//new System_OnPVPKill();
	//new Reset_OnDuelEnd;
	//new BloodMoneyReward();
	//new npc_blood_money();
	new npc_hellscream_ffa();
	new npc_pve_tests_manager();
	new npc_hellscream_booster();
	new npc_fun_gold_vendor();
	new npc_fun_transmo_vendor();
	new npc_legendary_transmogrificator();
	new npc_loyalty_point();
}
#endif
