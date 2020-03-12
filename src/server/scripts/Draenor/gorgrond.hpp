////////////////////////////////////////////////////////////////////////////////
//
// Project-Hellscream https://hellscream.org
// Copyright (C) 2018-2020 Project-Hellscream-6.2
// Discord https://discord.gg/CWCF3C9
//
////////////////////////////////////////////////////////////////////////////////


#ifndef GORGROND_H
#define GORGROND_H


enum eQuests
{
	// Template: Quest_X_Y_Z		= {questId}

	// Alliance Quests
	Quest_SecretsOfGorgrond1		= 33533, // Need to fix - Click to complete before interacting with flight master thus breaking it.
	Quest_SecretsOfGorgrond2		= 35556, // Need to fix - interacting with Dungar Longdrink doesn't satisfy the objective
	Quest_SecretsOfGorgrond3		= 36632, // Need to fix - Click to complete upon interacting with flight master.
	Quest_WelcometoGorgrond			= 35033,
	Quest_AHarvesterHasCome			= 35065,
	Quest_IDrewAggroCulture			= 35828,
	Quest_HeDrewAggroCulture		= 36595,
	Quest_WakeOfTheGenesaur			= 35834,
	Quest_RescueRangari				= 35050,
	Quest_LostMoleMachines			= 35055,
	Quest_WeNeedAnOutpost			= 35063
};


enum eCreatures
{
	// Template: NPC_GORGROND_NAME_PHASE			= {entry}

	// Alliance NPCs
	NPC_GORGROND_RANGARI_DKAAN_PHASE_1				= 80921, // Rangari D'kaan at Naielle's Watch
	NPC_GORGROND_YREL_PHASE_1						= 80978, // Yrel at Wildwood Wash, near Naielle's Watch (on the road) and Highpass
	NPC_GORGROND_VINDICATOR_MARAAD_PHASE_1			= 75127, // Maraad at Wildwood Wash, near Naielle's Watch (on the road) and Highpass
	NPC_GORGROND_RANGARI_DKAAN_PHASE_2				= 75146, // Rangari D'kaan near Naielle's Watch (on the road) and Highpass
	NPC_GORGROND_THAELIN_DARKANVIL_1				= 80874, // Thaelin at Naielle's Watch, starts quest ID 35828
	NPC_GORGROND_THAELIN_DARKANVIL_2				= 75136, // Thaelin near Naielle's Watch (on the road) and Highpass
	NPC_GORGROND_RANGARI_KAALYA_PHASE_1				= 80922, // Rangari Kaalya at Naielle's Watch
	NPC_GORGROND_RANGARI_KAALYA_PHASE_2				= 80987, // Rangari Kaalya near Naielle's Watch (on the road)
	NPC_GORGROND_GLIRIN								= 84766, // Glirin at Highpass near the mole machine

	// Alliance Quest NPCs
	NPC_GORGROND_RANGARI_RAJESS						= 81013, // Rangari Rajess - Quest: Rescue Rangari [questId: 35050]
	NPC_GORGROND_RANGARI_KOLAAN						= 81018, // Rangari Kolaan - Quest: Rescue Rangari [questId: 35050]
	NPC_GORGROND_RANGARI_JONAA						= 81020, // Rangari Jonaa  - Quest: Rescue Rangari [questId: 35050]



	// Hostile NPCs
	NPC_GUID_GORGROND_PODLING_NIBBLER1				= 1440336, // Podling Nibbler near Rangari Rajess
	NPC_GUID_GORGROND_PODLING_NIBBLER2				= 1440307, // Podling Nibbler near Rangari Rajess
	NPC_GUID_GORGROND_PODLING_NIBBLER3				= 1440302, // Podling Nibbler near Rangari Rajess
	NPC_GUID_GORGROND_PODLING_NIBBLER4				= 1440317, // Podling Nibbler near Rangari Rajess
	NPC_GUID_GORGROND_PODLING_NIBBLER5				= 1440320, // Podling Nibbler near Rangari Rajess

	NPC_GUID_GORGROND_GROMKAR_GRUNT					= 1440316  // Grom'kar Grunt near Rangari Rajess

};


enum eCreatureTexts
{
	// Template: CREATURE_TEXT_NAME_QUEST_START/END					= {groupId}

	// Alliance NPCs Creature Texts
	CREATURE_TEXT_YREL_WELCOME_TO_GORGROND_START					= 0,
	CREATURE_TEXT_YREL_HARVESTER_END								= 1,
	CREATURE_TEXT_VINDICATOR_MARAAD_SECRETS_OF_GORGROND				= 0,
	CREATURE_TEXT_VINDICATOR_MARAAD_WELCOME_TO_GORGROND_START		= 1,
	CREATURE_TEXT_RANGARI_DKAAN_WELCOME_TO_GORGROND_START			= 0,
	CREATURE_TEXT_RANGARI_KAALYA_HARVESTER_END						= 0,
	CREATURE_TEXT_THAELIN_DARKANVIL_AGGROCULTURE_START				= 0,
	CREATURE_TEXT_GLIRIN_LOST_MOLE_MACHINES							= 0
};


enum eNpcTexts
{
		// Template: NPC_TEXT_NAME_X								= {npc_text->Id || gossip_menu->text_Id}

		// Alliance NPCs - NPC Texts
		RANGARI_KOLAAN_TEXT_RESCUE_RANGARI							= 83163,
		RANGARI_RAJESS_TEXT_RESCUE_RANGARI							= 83160,
		RANGARI_JONAA_TEXT_RESCUE_RANGARI							= 83170,
		GLIRIN_TEXT_LOST_MOLE_MACHINES								= 86395
		
};

enum eGossipMenus
{
		// Template: NPC_GossipMenu_X								= {gossip_menu->entry}
		
		// Alliance NPCs - Gossip Menus
		RANGARI_KOLAAN_Menu_RescueRangari							= 16539,
		RANGARI_RAJESS_Menu_RescueRangari							= 16538,
		RANGARI_JONAA_Menu_RescueRangari							= 16542,
		GLIRIN_Menu_LostMole_Machines								= 16895
};


enum eGossipOptions
{
		// Template: NPC_GossipOption/Quest_X						= {gossip_menu_option->Id}
		
		// Alliance NPCs - Gossip Options
		RANGARI_RAJESS_RescueRangari								= 0, // menu_id - 16538 - D'kaan is coming with help.
		RANGARI_KOLAAN_RescueRangari								= 0, // menu_id - 16539 - D'kaan is coming with help.
		RANGARI_JONAA_RescueRangari									= 0, // menu_id - 16542 - D'kaan is coming with help.
		GLIRIN_LostMole_Machines									= 0  // menu_id - 16895	- Thaelin is on his way soon.
		
};


enum eGameObjects
{
	// Template: GOBJECT_X_Y_Z				= {entry}
};

enum ePhases
{
	// Template: Phase_X_Y_Z		= {phaseId}
};


enum eSpells
{
	// Template: Spell_X_Y_Z		= {spellId}
};


#endif

