////////////////////////////////////////////////////////////////////////////////
///
///  MILLENIUM-STUDIO
///  Copyright 2016 Millenium-studio SARL
///  All Rights Reserved.
///
////////////////////////////////////////////////////////////////////////////////

#include "hellfire_citadel.h"

enum eArchimondeActions
{
	BlackGateIntro,
	GuldanIntro,
	ArchimondeIntro,
	DraenorHelpKhadgarStart,
	DraenorHelpYrelStart,
	DraenorHelpGrommashStart,
	ArchimondeEngaged,
	ArchimondeDisengaged,
	ArchimondeStartP2,
	ArchimondeStartP3,
	Ending,
};

enum eArchimondeCreatures
{
	// Draenor Help
	Khadgar = 94142,
	Yrel = 92769,
	Grommash = 93618,

	// Intro
	TheBlackGateC = 98232,
	Guldan = 93926,
	/*Kazrogal = 95280,
	Anetheron = 95408,
	Azgalor = 95282,*/

	// Phase 1 - The Defiler
	DoomfireSpirit = 92208,
	DoomfireStalker = 92442,
	HellfireDeathCaller = 92740,
	Desecration = 92781,
	ShackledSoul = 93382,

	// Phase 2 - Hand of the Legion
	FelborneOverfiend = 93615,
	Dreadstalker = 93616,

	// Phase 3 - The Twisting Nether
	// NetherPortal = ,
	ShadowedNetherwalker = 94695,
	VoidStar = 95775,
	// NetherStorm = ,
	InfernalDoombringer = 94412
};

enum eArchimondeObjects
{
	TheBlackGateO = 243504
};

enum eArchimondeDatas
{
	/// Counters
	MaxPhases = 3,
	/// Gul'dan flight path
	MaxFlyingMoves = 3,
	/// Draenor Help
	MaxSpawnPoints = 1,
	/// After fight
	MaxPortals = 5,
	MaxMagus = 20,
	MaxVindicator = 20,
	MaxWarrior = 20,
	DataTheBlackGate
};

static std::vector<uint32> g_EntriesToDespawn =
{
	eArchimondeCreatures::DoomfireSpirit,
	eArchimondeCreatures::DoomfireStalker,
	eArchimondeCreatures::HellfireDeathCaller,
	eArchimondeCreatures::Desecration,
	eArchimondeCreatures::ShackledSoul,
	eArchimondeCreatures::FelborneOverfiend,
	eArchimondeCreatures::Dreadstalker,
	eArchimondeCreatures::ShadowedNetherwalker,
	eArchimondeCreatures::VoidStar,
	eArchimondeCreatures::InfernalDoombringer,
	eArchimondeCreatures::Khadgar,
	eArchimondeCreatures::Yrel,
	eArchimondeCreatures::Grommash,
	//eArchimondeCreatures::NetherStorm,
	//eArchimondeCreatures::NetherPortal
};

static std::array<G3D::Vector3, eArchimondeDatas::MaxFlyingMoves> g_FlyingMoves =
{
	{
		{ 4077.423f, -2277.330f, 73.7404f },
		{ 4067.119f, -2282.021f, 86.1433f },
		{ 4068.361f, -2293.746f, 95.5625f }
	}
};

static std::array<Position const, eArchimondeDatas::MaxSpawnPoints> g_KhadgarSpawnPos =
{
	{
		{ 4066.8352f, -2127.9689f, 51.14758f, 4.743704f }
	}
};

static std::array<Position const, eArchimondeDatas::MaxSpawnPoints> g_YrelSpawnPos =
{
	{
		{ 4059.1799f, -2124.4499f, 51.147999f, 4.71745f }
	}
};

static std::array<Position const, eArchimondeDatas::MaxSpawnPoints> g_GrommashSpawnPos =
{
	{
		{ 4074.4799f, -2124.3798f, 51.1479f, 4.71745f }
	}
};

static std::array<int32, eArchimondeDatas::MaxPhases> g_ArchimondePhaseSwitchPcts =
{
	70, 40, 0
};

static std::array<Position, eArchimondeDatas::MaxMagus> g_MagusSpawnPos =
{
	{
		{ 4109.6220f, -2219.2143f, 51.1470f, 0.334737f },
		{ 4117.0537f, -2202.9101f, 51.1470f, 5.483027f },
		{ 4137.8515f, -2209.5109f, 51.1470f, 3.64914f  },
		{ 4130.3896f, -2228.9650f, 51.1470f, 2.235423f },

	}
};

static std::array<Position, eArchimondeDatas::MaxPortals> g_PortalSpawnPos =
{
	{
		{ 4122.0024f, -2218.8002f, 51.1470f, 2.31789f  },
		{ 4129.5629f, -2179.2678f, 51.1486f, 1.430388f },
		{ 4063.1242f, -2120.9489f, 51.1483f, 1.61103f  },
		{ 3997.1542f, -2200.3369f, 51.1480f, 3.311417f },
		{ 4001.4145f, -2232.0561f, 51.1480f, 3.130775f },
	}
};

/*static std::array<Position const, eBlackhandDatas::MaxStoragePortcullis> g_SiegemakerSpawnPos =
{
	{
		{ 633.0486f, 3544.559f, 605.4095f, 3.895919f },
		{ 636.4879f, 3446.691f, 605.3715f, 2.560644f },
		{ 541.1111f, 3572.627f, 605.4115f, 5.075389f },
		{ 541.0052f, 3414.282f, 605.3871f, 1.160939f }
	}
};

Position const g_SlagWrapSpawnPos = { 568.623f, 3494.82f, 741.598f, 3.14159f };
Position const g_StartP2JumpPos = { 573.3621f, 3494.884f, 741.6487f, 2.767612f };
Position const g_SecondFloorJumpPos = { 565.961f, 3497.788f, 604.376f, 3.045664f };
Position const g_ThirdFloorJumpPos = { 565.9606f, 3500.114f, 511.844f, 4.094417f };

static std::vector<std::vector<Position>> g_IronSoldierSpawnPos =
{
	{
		{ 570.4011f, 3432.209f, 619.0685f, 1.566986f },
		{ 567.7239f, 3432.484f, 619.0663f, 1.560594f },
		{ 570.3489f, 3433.858f, 619.0632f, 1.540382f },
		{ 567.9739f, 3434.096f, 619.0582f, 1.181206f },
		{ 568.2691f, 3436.276f, 619.0471f, 3.086635f },
		{ 570.4601f, 3436.267f, 619.0514f, 0.015996f }
	},
	{
		{ 565.3420f, 3557.065f, 619.1151f, 4.825490f },
		{ 568.2864f, 3557.542f, 619.1151f, 5.177013f },
		{ 568.6406f, 3555.532f, 619.1151f, 3.549165f },
		{ 565.5417f, 3555.420f, 619.1151f, 5.998235f },
		{ 569.0278f, 3553.868f, 619.1151f, 2.592803f },
		{ 565.9254f, 3553.486f, 619.1151f, 1.683925f }
	}*/

