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
	NPC_GORGROND_THE_TANK							= 77224, // The Tank at Highpass

	// Alliance Quest NPCs
	NPC_GORGROND_RANGARI_RAJESS						= 81013, // Rangari Rajess - Quest: Rescue Rangari [questId: 35050]
	NPC_GORGROND_RANGARI_KOLAAN						= 81018, // Rangari Kolaan - Quest: Rescue Rangari [questId: 35050]
	NPC_GORGROND_RANGARI_JONAA						= 81020, // Rangari Jonaa  - Quest: Rescue Rangari [questId: 35050]



	// Hostile NPCs
	NPC_GORGROND_IYU_WILDWOODWASH					= 78819,	// Iyu at Wildwood Wash
	NPC_GORGROND_HARVESTER_OMMRU					= 84373,	// Harvester Ommru at Naielle's Watch
	
	NPC_GUID_GORGROND_FALLEN_RANGARI				= 1440173, // Fallen Rangari at Naielle's Watch inside cave

	NPC_GUID_GORGROND_PODLING_NIBBLER1				= 1440336, // Podling Nibbler near Rangari Rajess
	NPC_GUID_GORGROND_PODLING_NIBBLER2				= 1440307, // Podling Nibbler near Rangari Rajess
	NPC_GUID_GORGROND_PODLING_NIBBLER3				= 1440302, // Podling Nibbler near Rangari Rajess
	NPC_GUID_GORGROND_PODLING_NIBBLER4				= 1440317, // Podling Nibbler near Rangari Rajess
	NPC_GUID_GORGROND_PODLING_NIBBLER5				= 1440320, // Podling Nibbler near Rangari Rajess

	NPC_GUID_GORGROND_PODLING_SCAVENGER1			= 1440417, // Podling Scavenger near Rangari Jonaa
	NPC_GUID_GORGROND_PODLING_SCAVENGER2			= 1440420, // Podling Scavenger near Rangari Jonaa
	NPC_GUID_GORGROND_PODLING_SCAVENGER3			= 1440424, // Podling Scavenger near Rangari Jonaa
	NPC_GUID_GORGROND_PODLING_SCAVENGER4			= 1440422, // Podling Scavenger near Rangari Jonaa

	NPC_GUID_GORGROND_PODLING_SCAVENGER5			= 1440289, // Podling Scavenger near Rangari Kolaan
	NPC_GUID_GORGROND_PODLING_SCAVENGER6			= 1440288, // Podling Scavenger near Rangari Kolaan
	NPC_GUID_GORGROND_PODLING_SCAVENGER7			= 1440287, // Podling Scavenger near Rangari Kolaan

	NPC_GUID_GORGROND_PODLING_SCAVENGER8			= 1440248, // Podling Scavenger near tank @ Naielle's Watch
	NPC_GUID_GORGROND_PODLING_SCAVENGER9			= 1440246, // Podling Scavenger near tank @ Naielle's Watch
	NPC_GUID_GORGROND_PODLING_SCAVENGER10			= 1440247, // Podling Scavenger near tank @ Naielle's Watch

	NPC_GUID_GORGROND_GOREN_GOUGER1					= 1443391, // Goren Gouger near Highpass
	NPC_GUID_GORGROND_GOREN_GOUGER2					= 1443397, // Goren Gouger near Highpass
	NPC_GUID_GORGROND_GOREN_GOUGER3					= 1443401, // Goren Gouger near Highpass
	NPC_GUID_GORGROND_GOREN_GOUGER4					= 1443410, // Goren Gouger near Highpass

	NPC_GUID_GORGROND_INFESTED_VINEWARDEN1			= 1440783, // Infested Vinewarden near Highpass
	NPC_GUID_GORGROND_INFESTED_VINEWARDEN2			= 1443399, // Infested Vinewarden near Highpass

	NPC_GUID_GORGROND_BOTANI_GREENSWORN1			= 1440772, // Botani Greensworn near Highpass
	NPC_GUID_GORGROND_BOTANI_GREENSWORN2			= 1440799, // Botani Greensworn near Highpass
	NPC_GUID_GORGROND_BOTANI_GREENSWORN3			= 1440793, // Botani Greensworn near Highpass

	NPC_GUID_GORGROND_GRONN_ROCKTHROWER				= 1443388, // Gronn Rockthrower near Highpass

	NPC_GUID_GORGROND_MANDRAGORA_LIFEDRINKER		= 1440773, // Mandragora Lifedrinker near Highpass

	NPC_GUID_GORGROND_GRONNLING_BONEBREAKER1		= 1440776, // Gronnling Bonebreaker near Highpass
	NPC_GUID_GORGROND_GRONNLING_BONEBREAKER2		= 1440798, // Gronnling Bonebreaker near Highpass

	NPC_GUID_GORGROND_GROMKAR_GRUNT1				= 1440316, // Grom'kar Grunt near Rangari Rajess
	NPC_GUID_GORGROND_GROMKAR_GRUNT2				= 1443417, // Grom'kar Grunt near Highpass

	NPC_GUID_GORGROND_GROMKAR_SHIELDBEARER1			= 1443411, // Grom'kar Shieldbearer near Highpass
	NPC_GUID_GORGROND_GROMKAR_SHIELDBEARER2			= 1443413, // Grom'kar Shieldbearer near Highpass


};


Position const l_TankPos = { 6349.152832f, 547.547607f, 92.671135f, 2.191502f }; // The Tank's position at spawn

enum eMovepointsData
{
	TankMoves	= 6
};


static std::array<G3D::Vector3, eMovepointsData::TankMoves> g_TankMoves =
{
	{
		{6314.098633f, 584.162659f, 94.048492f},
		{6313.224609f, 617.917542f, 97.349167f},
		{6292.179199f, 657.041321f, 109.406609f},
		{6290.183594f, 676.543701f, 113.991241f},
		{6297.629883f, 688.538086f, 116.037689f},
		{6301.392090f, 691.053528f, 116.589493f}
	}
};


enum eCreatureTexts
{
	// Template: CREATURE_TEXT_NAME_QUEST_START/END					= {groupId}

	// Alliance NPCs Creature Texts
	CREATURE_TEXT_YREL_WELCOME_TO_GORGROND_START					= 0,
	CREATURE_TEXT_YREL_DREW_AGGROCULTURE							= 1,
	CREATURE_TEXT_VINDICATOR_MARAAD_SECRETS_OF_GORGROND				= 0,
	CREATURE_TEXT_VINDICATOR_MARAAD_WELCOME_TO_GORGROND_START		= 1,
	CREATURE_TEXT_RANGARI_DKAAN_WELCOME_TO_GORGROND_START			= 0,
	CREATURE_TEXT_RANGARI_KAALYA_DREW_AGGROCULTURE					= 0,
	CREATURE_TEXT_THAELIN_DARKANVIL_AGGROCULTURE_START				= 0,
	CREATURE_TEXT_GLIRIN_LOST_MOLE_MACHINES							= 0,


	// Hostile NPCs Creature Texts
	CREATURE_TEXT_HARVESTER_OMMRU_AGGRO								= 0,
	CREATURE_TEXT_FUNGUS_COVERED_SHAMBLER_AGGRO						= 0
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

