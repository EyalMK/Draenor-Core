////////////////////////////////////////////////////////////////////////////////
//
//  MILLENIUM-STUDIO
//  Copyright 2016 Millenium-studio SARL
//  All Rights Reserved.
//
////////////////////////////////////////////////////////////////////////////////

#ifndef TALADOR_H
#define TALADOR_H

namespace TaladorQuests
{
	enum
	{

	};
}

namespace TaladorLegendaryPhases
{
	enum
	{
		NormalPhase					= 1,
		GaronaImprisoned			= 2,

	};
}

namespace TaladorLegendaryNpcs
{
	enum
	{
		KhadgarBase					= 83823,
		CordanaBase					= 83929,
		GaronaStabber				= 999999, // Not yet
		JainaBase					= 999998, // Not yet
		GaronaBase					= 86926,
		KhadgarInfiltrating			= 90233,
		GaronaInfiltrating			= 90237,
		GaronaPet					= 90138,
	};
}

namespace TaladorLegendaryQuests
{
	enum
	{
		// Chapter 1: Call of the Archmage
		CallOfTheArchmage			= 35988,
		SpiresOfTheBetrayer			= 36157,
		KhadgarsTask				= 35989, // [First ring]
		EyesOfTheArchmage			= 35994,
		FugitiveDragon				= 36000,
		TheDragonsTale				= 36206,
		TarnishedBronze				= 35995, // [Achievement reward]
		PowerUnleashed				= 36004, // [Ring upgrade]

		// Chapter 2: Gul'Dan Strikes Back
		EmpiresFall					= 35997,
		LegacyOfTheSorceressKings	= 35998,
		TheScryingGame				= 36005,
		HunterHunted				= 36006, // [Achievement reward]
		TouchOfTheKirinTor			= 36007, // [Ring upgrade]

		// Chapter 3: The Foundry Falls
		MightOfTheElementalLords	= 36013, // [Achievement reward]
		ReversePiracy				= 36012,
		HeartOfTheFury				= 36009,
		FlamebendersTome			= 36010,
		TheUnbrokenCircle			= 36016, // [Ring upgrade]

		// Chapter 4: Darkness Incarnate
		BlackhandsSecret			= 36014, // Follow up from Reverse Piracy, Heart of the Fury and Flamebenders Tome
		PrisonerOfTheMind			= 36017,
		OrbOfDominion				= 37834,
		TheShadowWar				= 37835, // GUI show-up from going close to the place where Orb of Dominion is done
		BreakingBadness				= 37836,
		ToGuldan					= 37964,
		AnInsideJob					= 37837,
		MyGarona					= 37838,

		// Requires Shipyard and Hellfire Citadel progression
		TheFinalAssault				= 37841,
		CommandOfTheSeas			= 39057,
		MasterVSCommander			= 39697,
		WeDontNeedNoLibraryCard		= 39000, 
		CookingTheBooks				= 39003, // Only show up when the last two are done

		LightBeWithYou				= 37839, // [Ring upgrade and alliance achievement reward]
		DraenorsBlessing			= 37840, // [Ring upgrade and horde achievement reward]

		DarknessIncarnate			= 39004
	};
}

namespace TaladorLegendaryQuestsSceneObjects
{
	enum
	{
		KhadgarsTaskH				= 1027,
		KhadgarsTaskA				= 977,
		EyesOfTheArchmage			= 997,
		PrisonerOfTheMind			= 1013,
		BreakingBadness				= 1384,
		AnInsideJob					= 270
	};
}

#endif
