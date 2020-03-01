////////////////////////////////////////////////////////////////////////////////
//
// Project-Hellscream https://hellscream.org
// Copyright (C) 2018-2020 Project-Hellscream-6.2
// Discord https://discord.gg/CWCF3C9
//
////////////////////////////////////////////////////////////////////////////////


#ifndef DRAENOR_SHADOWMOON_VALLEY_H
#define DRAENOR_SHADOWMOON_VALLEY_H


enum eQuests
{
	QuestStepThreeProphet	= 34575,
	QuestFindingAFoothold	= 34582,
	QuestForTheAlliance		= 34583,
	QuestLookingForLumber	= 34584,
	QuestRavenousRavens		= 34616,
};


enum eCreature
{
	NpcVelenEventide		= 79206,
	NpcYrelEventide			= 79219,
	NpcYrelSummon			= 79656,
	NpcKhadgarEventide		= 79216,
	NpcMaraadEventide		= 79218,
	NpcVelenLunarfall		= 79241,
	NpcMaraadLunarfall		= 79470,
	NpcKhadgarLunarfall		= 79242,
    JuicyMushroomA			= 78902,
    JuicyMushroomB			= 78903,
    JuicyMushroomC			= 78904
};

enum eGameObjects
{

};

enum ePhases
{
    PhaseBase					= 0x0000001,

    /// AREA 7760 (Eventide Landing)
    PhaseBeforeGoingBase		= 0x0000002,

	/// AREA 7078 (Lunarfall)
	PhaseFirstTimeBase			= 0x0000004,
	PhaseNpcSummoned			= 0x0000008,
	PhaseRavenQuestCompleted	= 0x0000010,
};


enum eSpells
{
     Squeezing = 159303
};

Position const l_VelenPos = { 2298.30f, 461.837f, 8.595f, 5.0183f };
Position const l_YrelPos = { 2306.12f, 457.556f, 6.897f, 2.7464f };
Position const l_MaraadPos = { 2305.87f, 461.453f, 7.347f, 3.1989f };
Position const l_KhadgarPos = { 2298.34f, 455.197f, 8.322f, 1.7591f };

enum eMovepointsData
{
	MaxVelenMoves	= 8,
	MaxYrelMoves	= 8,
	MaxMaraadMoves  = 8,
	MaxKhadgarMoves = 4,
	MaxStarfall1	= 2,
	MaxStarfall2	= 2,
};

static std::array<G3D::Vector3, eMovepointsData::MaxVelenMoves> g_VelenMoves =
{
	{
		{ 2246.21f, 508.297f, 16.834f },
		{ 2192.95f, 491.553f, 19.415f },
		{ 2078.66f, 436.013f, 25.914f },
		{ 1984.86f, 443.627f, 61.829f },
		{ 1944.74f, 432.978f, 72.407f },
		{ 1918.38f, 408.908f, 82.147f },
		{ 1905.44f, 338.319f, 87.961f },
		{ 1929.18f, 334.369f, 89.061f }
	}
};

static std::array<G3D::Vector3, eMovepointsData::MaxYrelMoves> g_YrelMoves =
{
	{
		{ 2246.21f, 508.297f, 16.834f },
		{ 2192.95f, 491.553f, 19.415f },
		{ 2078.66f, 436.013f, 25.914f },
		{ 1984.86f, 443.627f, 61.829f },
		{ 1944.74f, 432.978f, 72.407f },
		{ 1918.38f, 408.908f, 82.147f },
		{ 1905.44f, 338.319f, 87.961f },
		{ 1928.17f, 331.390f, 89.194f }
	}
};

static std::array<G3D::Vector3, eMovepointsData::MaxMaraadMoves> g_MaraadMoves =
{
	{
		{ 2246.21f, 508.297f, 16.834f },
		{ 2192.95f, 491.553f, 19.415f },
		{ 2078.66f, 436.013f, 25.914f },
		{ 1984.86f, 443.627f, 61.829f },
		{ 1944.74f, 432.978f, 72.407f },
		{ 1918.38f, 408.908f, 82.147f },
		{ 1924.10f, 370.395f, 88.561f },
		{ 1935.21f, 339.734f, 88.965f }
	}
};

static std::array<G3D::Vector3, eMovepointsData::MaxKhadgarMoves> g_KhadgarMoves =
{
	{
		{ 2238.90f, 512.691f, 40.254f },
		{ 2121.82f, 454.399f, 50.726f },
		{ 2014.69f, 449.873f, 91.194f },
		{ 1973.69f, 368.706f, 101.245f }
	}
};

static std::array<G3D::Vector3, eMovepointsData::MaxStarfall1> g_Starfall1Moves =
{
	{
		{ 1937.24f, 331.744f, 88.965f },
		{ 1907.69f, 311.268f, 88.996f }
	}
};

static std::array<G3D::Vector3, eMovepointsData::MaxStarfall2> g_Starfall2Moves =
{
	{
		{ 1937.24f, 331.744f, 88.965f },
		{ 1909.02f, 305.058f, 88.846f }
	}
};

#endif

