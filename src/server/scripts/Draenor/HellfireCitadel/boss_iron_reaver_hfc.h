///////////////////////////////////////////////////////////////////////////////
///
///  MILLENIUM-STUDIO
///  Copyright 2016 Millenium-studio SARL
///  All Rights Reserved.
///
///////////////////////////////////////////////////////////////////////////////

#include "hellfire_citadel.h"

enum eIronReaverDatas
{
	MaxRegenCyclesP1 = 3,
	MaxIronReaverIntroMoves = 2,
};

/// Regens every second, 1 power, then 2 power, then 1 power, 4 power every 3 seconds
static std::array<int32, eIronReaverDatas::MaxRegenCyclesP1> g_IronReaverRegenCyclesP1 =
{
	1, 2, 1
};

static std::array<G3D::Vector3, eIronReaverDatas::MaxIronReaverIntroMoves> g_IronReaverIntroMoves =
{
	{
		{ 3941.8650f, -535.1536f, 50.4674f },
		{ 3953.0466f, -639.5525f, 50.4674f }
	}
};

Position const g_FloorJumpPos = { 3953.0466f, -639.5525f, 30.8865f, 4.908996f };

Position const g_MidPos = { 3953.0466f, -639.5525f, 50.4674f, 4.908996f };