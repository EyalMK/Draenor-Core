////////////////////////////////////////////////////////////////////////////////
//
//  MILLENIUM-STUDIO
//  Copyright 2016 Millenium-studio SARL
//  All Rights Reserved.
//
////////////////////////////////////////////////////////////////////////////////


#ifndef DRAENOR_SHADOWMOON_VALLEY_H
#define DRAENOR_SHADOWMOON_VALLEY_H


enum eQuests
{
	QuestStepThreeProphet		= 34575,
	QuestFindingAFoothold		= 34582,
	QuestForTheAlliance			= 34583,
	QuestLookingForLumber		= 34584,
	QuestRavenousRavens			= 34616,
	QuestEstablishYourGarrison  = 34586,
	QuestPaleMoonlight			= 35174,
	QuestShipSalvage			= 35166,
	QuestQianaMoonshadow		= 34646,
	QuestDelegatingOnDraenor	= 34692,
	QuestAHerosWelcome			= 33075,
	QuestMigrantWorkers			= 34778,
};


enum eCreature
{
	NpcVelenEventide = 79206,
	NpcYrelEventide = 79219,
	NpcYrelSummon = 79656,
	NpcKhadgarEventide = 79216,
	NpcMaraadEventide = 79218,
	NpcVelenLunarfall = 79241,
	NpcMaraadLunarfall = 79470,
	NpcKhadgarLunarfall = 79242,
	JuicyMushroomA = 78902,
	JuicyMushroomB = 78903,
	JuicyMushroomC = 78904
};

enum eAreas
{
	AreaEventideLanding = 7173
};

enum eGameObjects
{

};

enum ePhases
{
	PhaseBase = 0x0000001,

	/// AREA 7760 (Eventide Landing)
	PhaseBeforeGoingBase		= 0x0000002,

	/// AREA 7078 (Lunarfall)
	PhaseFirstTimeBase			= 0x0000004,
	PhaseNpcSummoned			= 0x0000008,
	PhaseRavenQuestCompleted	= 0x0000010,
	PhaseTreeQuestCompleted		= 0x0000016
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
	MaxVelenMoves = 14,
	MaxYrelMoves = 14,
	MaxMaraadMoves = 14,
	MaxKhadgarMoves = 8,
	MaxLunarfall1 = 3,
	MaxLunarfall2 = 3,
	MaxBrightstone = 5,
	MaxBaronAlexstone = 4,
	MaxShelly = 3,
	MaxJarrod = 3,
	MaxDwarf = 3,
	MaxStarfall1 = 3,
	MaxStarfall2 = 3,
	MaxThorn = 5,
	MaxHuman = 5,
	MaxForeman = 4,
	MaxPackmule = 5,
	MaxLumberjack = 8,
	MaxLumberjackGo = 4,
	MaxStormwindCharger1Moves = 7
};

static std::array<G3D::Vector3, eMovepointsData::MaxVelenMoves> g_VelenMoves =
{
	{
		{ 2285.47f, 498.666f, 11.179f },
		{ 2246.74f, 511.281f, 17.436f },
		{ 2213.81f, 485.680f, 19.235f },
		{ 2192.85f, 494.852f, 20.282f },
		{ 2179.35f, 475.454f, 19.370f },
		{ 2160.54f, 425.743f, 16.468f },
		{ 2106.98f, 430.783f, 19.602f },
		{ 2060.30f, 433.924f, 32.206f },
		{ 1986.57f, 447.605f, 61.786f },
		{ 1939.39f, 434.839f, 73.518f },
		{ 1913.16f, 398.210f, 84.907f },
		{ 1907.27f, 372.948f, 89.555f },
		{ 1905.44f, 338.319f, 87.961f },
		{ 1929.18f, 334.369f, 89.061f }
	}
};

static std::array<G3D::Vector3, eMovepointsData::MaxYrelMoves> g_YrelMoves =
{
	{
		{ 2285.47f, 498.666f, 11.179f },
		{ 2246.74f, 511.281f, 17.436f },
		{ 2213.81f, 485.680f, 19.235f },
		{ 2192.85f, 494.852f, 20.282f },
		{ 2179.35f, 475.454f, 19.370f },
		{ 2160.54f, 425.743f, 16.468f },
		{ 2106.98f, 430.783f, 19.602f },
		{ 2060.30f, 433.924f, 32.206f },
		{ 1986.57f, 447.605f, 61.786f },
		{ 1939.39f, 434.839f, 73.518f },
		{ 1913.16f, 398.210f, 84.907f },
		{ 1907.27f, 372.948f, 89.555f },
		{ 1905.44f, 338.319f, 87.961f },
		{ 1928.17f, 331.390f, 89.194f }
	}
};

static std::array<G3D::Vector3, eMovepointsData::MaxMaraadMoves> g_MaraadMoves =
{
	{
		{ 2285.47f, 498.666f, 11.179f },
		{ 2246.74f, 511.281f, 17.436f },
		{ 2213.81f, 485.680f, 19.235f },
		{ 2192.85f, 494.852f, 20.282f },
		{ 2179.35f, 475.454f, 19.370f },
		{ 2160.54f, 425.743f, 16.468f },
		{ 2106.98f, 430.783f, 19.602f },
		{ 2060.30f, 433.924f, 32.206f },
		{ 1986.57f, 447.605f, 61.786f },
		{ 1939.39f, 434.839f, 73.518f },
		{ 1918.38f, 408.908f, 82.147f },
		{ 1913.16f, 398.210f, 84.907f },
		{ 1924.10f, 370.395f, 88.561f },
		{ 1935.21f, 339.734f, 88.965f }
	}
};

static std::array<G3D::Vector3, eMovepointsData::MaxKhadgarMoves> g_KhadgarMoves =
{
	{
		{ 2294.50f, 472.349f, 49.315f  },
		{ 2239.88f, 505.235f, 57.756f  },
		{ 2121.82f, 454.399f, 76.726f  },
		{ 2014.69f, 449.873f, 81.194f  },
		{ 1923.04f, 449.579f, 120.345f },
		{ 1911.51f, 397.002f, 115.995f },
		{ 1955.58f, 359.063f, 105.998f },
		{ 1943.91f, 339.194f, 88.932f  }
	}
};

static std::array<G3D::Vector3, eMovepointsData::MaxLunarfall1> g_Lunarfall1Moves =
{
	{
		{ 1955.89f, 310.895f, 90.097f },
		{ 1943.04f, 303.586f, 90.294f },
		{ 1935.57f, 314.040f, 89.276f }
	}
};

static std::array<G3D::Vector3, eMovepointsData::MaxLunarfall2> g_Lunarfall2Moves =
{
	{
		{ 1952.51f, 316.891f, 89.512f },
		{ 1944.96f, 315.760f, 89.143f },
		{ 1943.26f, 322.779f, 88.966f }
	}
};

static std::array<G3D::Vector3, eMovepointsData::MaxBrightstone> g_BrightstoneMoves =
{
	{
		{ 1953.20f, 316.921f, 89.550f },
		{ 1974.56f, 322.405f, 89.698f },
		{ 1974.47f, 334.153f, 89.131f },
		{ 1949.49f, 339.980f, 88.709f },
		{ 1952.47f, 343.437f, 88.567f }
	}
};

static std::array<G3D::Vector3, eMovepointsData::MaxBaronAlexstone> g_BarosAlexstoneMoves =
{
	{
		{ 1943.24f, 332.458f, 88.964f },
		{ 1931.93f, 328.608f, 89.022f },
		{ 1934.92f, 317.188f, 89.169f },
		{ 1935.96f, 320.856f, 90.009f }
	}
};

static std::array<G3D::Vector3, eMovepointsData::MaxShelly> g_ShellyMoves =
{
	{
		{ 1955.98f, 343.756f, 88.753f },
		{ 1962.44f, 343.451f, 88.864f },
		{ 1958.80f, 343.756f, 88.753f }
	}
};

static std::array<G3D::Vector3, eMovepointsData::MaxJarrod> g_JarrodMoves =
{
	{
		{ 1952.61f, 336.055f, 88.838f },
		{ 1953.88f, 348.786f, 88.810f },
		{ 1955.39f, 346.614f, 88.731f }
	}
};

static std::array<G3D::Vector3, eMovepointsData::MaxDwarf> g_DwarfMoves =
{
	{
		{ 1939.29f, 331.321f, 88.964f },
		{ 1954.31f, 335.358f, 88.858f },
		{ 1956.03f, 340.439f, 88.680f }
	}
};

static std::array<G3D::Vector3, eMovepointsData::MaxStarfall1> g_Starfall0SentinelMoves =
{
	{
		{ 1950.63f, 300.483f, 90.418f },
		{ 1923.18f, 307.781f, 90.123f },
		{ 1908.96f, 305.000f, 88.836f }
	}
};

static std::array<G3D::Vector3, eMovepointsData::MaxStarfall2> g_Starfall1SentinelMoves =
{
	{
		{ 1913.42f, 324.316f, 89.424f },
		{ 1915.46f, 311.620f, 89.741f },
		{ 1907.68f, 311.268f, 88.996f }
	}
};

static std::array<G3D::Vector3, eMovepointsData::MaxThorn> g_ThornMoves =
{
	{
		{ 1932.88f, 336.211f, 88.965f },
		{ 1917.96f, 340.938f, 88.371f },
		{ 1921.73f, 316.874f, 89.937f },
		{ 1915.79f, 301.474f, 89.553f },
		{ 1911.28f, 299.380f, 89.047f }
	}
};

static std::array<G3D::Vector3, eMovepointsData::MaxHuman> g_HumanMoves =
{
	{
		{ 1931.73f, 337.024f, 88.964f },
		{ 1935.02f, 343.847f, 88.964f },
		{ 1944.35f, 352.452f, 88.588f },
		{ 1940.00f, 354.836f, 88.584f },
		{ 1939.68f, 354.520f, 88.553f }
	}
};

static std::array<G3D::Vector3, eMovepointsData::MaxForeman> g_ForemanMoves =
{
	{
		{ 1934.71f, 329.638f, 88.967f },
		{ 1923.29f, 343.921f, 88.484f },
		{ 1924.69f, 361.838f, 88.680f },
		{ 1933.26f, 360.309f, 88.649f }
	}
};

static std::array<G3D::Vector3, eMovepointsData::MaxPackmule> g_PackmuleMoves =
{
	{
		{ 1934.71f, 329.638f, 88.967f },
		{ 1923.29f, 343.921f, 88.484f },
		{ 1924.69f, 361.838f, 88.680f },
		{ 1935.70f, 363.605f, 88.839f },
		{ 1935.92f, 359.859f, 88.743f }
	}
};

static std::array<G3D::Vector3, eMovepointsData::MaxLumberjack> g_Lumberjack0Moves =
{
	{
		{ 1861.80f, 172.569f, 79.815f },
		{ 1872.15f, 210.712f, 77.871f },
		{ 1848.59f, 237.329f, 77.864f },
		{ 1860.44f, 279.928f, 77.140f },
		{ 1870.76f, 307.778f, 82.251f },
		{ 1897.99f, 338.437f, 86.837f },
		{ 1917.71f, 347.670f, 88.078f },
		{ 1917.04f, 355.691f, 89.126f }
	}
};

static std::array<G3D::Vector3, eMovepointsData::MaxLumberjack> g_Lumberjack1Moves =
{
	{
		{ 1885.86f, 230.107f, 77.344f },
		{ 1883.93f, 240.874f, 77.824f },
		{ 1859.91f, 269.681f, 77.803f },
		{ 1860.44f, 279.928f, 77.140f },
		{ 1870.76f, 307.778f, 82.251f },
		{ 1897.99f, 338.437f, 86.837f },
		{ 1917.71f, 347.670f, 88.078f },
		{ 1917.04f, 355.691f, 89.126f }
	}
};

static std::array<G3D::Vector3, eMovepointsData::MaxLumberjack> g_Lumberjack2Moves =
{
	{
		{ 1828.60f, 216.069f, 73.036f },
		{ 1851.65f, 230.671f, 77.353f },
		{ 1856.08f, 263.092f, 78.210f },
		{ 1860.44f, 279.928f, 77.140f },
		{ 1870.76f, 307.778f, 82.251f },
		{ 1897.99f, 338.437f, 86.837f },
		{ 1917.71f, 347.670f, 88.078f },
		{ 1917.04f, 355.691f, 89.126f }
	}
};

static std::array<G3D::Vector3, eMovepointsData::MaxLumberjack> g_Lumberjack3Moves =
{
	{
		{ 1797.38f, 295.237f, 77.275f },
		{ 1840.37f, 264.635f, 78.199f },
		{ 1857.44f, 264.775f, 78.117f },
		{ 1860.44f, 279.928f, 77.140f },
		{ 1870.76f, 307.778f, 82.251f },
		{ 1897.99f, 338.437f, 86.837f },
		{ 1917.71f, 347.670f, 88.078f },
		{ 1917.04f, 355.691f, 89.126f }
	}
};

static std::array<G3D::Vector3, eMovepointsData::MaxLumberjackGo> g_LumberjackGoMoves =
{
	{
		{ 1923.23f, 350.034f, 88.216f },
		{ 1931.92f, 352.180f, 88.522f },
		{ 1945.75f, 344.199f, 88.572f },
		{ 1960.27f, 320.974f, 89.385f }
	}
};

static std::array<G3D::Vector3, eMovepointsData::MaxStormwindCharger1Moves> g_StormwindCharger1Moves =
{
	{
		{ 1891.95f, 244.045f, 118.181f },
		{ 1939.28f, 346.429f, 116.204f },
		{ 1974.98f, 382.252f, 112.687f },
		{ 1992.15f, 441.485f, 85.741f  },
		{ 2127.17f, 447.206f, 50.431f  },
		{ 2233.85f, 507.924f, 39.108f  },
		{ 2302.42f, 501.619f, 8.834f   }
	}
};


#endif