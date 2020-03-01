////////////////////////////////////////////////////////////////////////////////
///
///  MILLENIUM-STUDIO
///  Copyright 2016 Millenium-studio SARL
///  All Rights Reserved.
///
////////////////////////////////////////////////////////////////////////////////

# include "hellfire_citadel.h"

enum eMannorothObjects
{
	MannorothBlood = 400017,
	FelSpireRed = 242570,
	FelSpirePurple = 242323,
	FelSpireGreen = 242569
};

enum eMannorothActions
{
	StartPhase2
};

enum eMannorothDatas
{
	// Fel Iron Summoners
	MaxSpawnPoints = 1,
	// Khadgar flight path
	MaxFlyingMoves = 3,
	// Khadgar ground path
	MaxGroundMoves = 1,
	// Player flight path
	MaxEndMoves = 3,
	// Phases
	MaxPhases = 4,
	MaxRegenCyclesP1 = 5
};

void StartTheEncounter(Creature* p_Source, Unit* p_Target, InstanceScript* p_Instance)
{
	if (p_Source == nullptr || p_Target == nullptr || p_Instance == nullptr)
		return;

	uint32 l_Entry = (p_Source->GetEntry() == eCitadelCreatures::BossMannoroth) ? eCitadelCreatures::FelSummoner : eCitadelCreatures::BossMannoroth;
	if (Creature* l_Other = Creature::GetCreature(*p_Source, p_Instance->GetData64(l_Entry)))
	{
		if (l_Other->IsAIEnabled && !l_Other->isInCombat())
			l_Other->SetInCombatWith(p_Target);
	}
}

void ResetTheEncounter(Creature* p_Source, InstanceScript* p_Instance)
{
	if (p_Source == nullptr || p_Instance == nullptr)
		return;

	uint32 l_Entry = (p_Source->GetEntry() == eCitadelCreatures::BossMannoroth) ? eCitadelCreatures::FelSummoner : eCitadelCreatures::BossMannoroth;
	if (Creature* l_Other = Creature::GetCreature(*p_Source, p_Instance->GetData64(l_Entry)))
	{
		if (l_Other->isDead())
		{
			l_Other->Respawn();
			l_Other->GetMotionMaster()->MoveTargetedHome();
		}
		else if (!l_Other->HasUnitState(UnitState::UNIT_STATE_EVADE) && l_Other->IsAIEnabled)
			l_Other->AI()->EnterEvadeMode();
	}
}

static std::array<G3D::Vector3, eMannorothDatas::MaxFlyingMoves> g_FlyingMoves =
{
	{
		{ -2849.427f, -292.643f, 605.9604f },
		{ -2923.657f, -292.631f, 621.1083f },
		{ -2971.359f, -292.571f, 606.2308f }
	}
};

static std::array<G3D::Vector3, eMannorothDatas::MaxEndMoves> g_FlyingEnd =
{
	{
		{ -2971.359f, -292.571f, 606.2308f },
		{ -2923.657f, -292.631f, 621.1083f },
		{ -2749.427f, -292.643f, 570.9604f },
	}
};

static std::vector<uint32> g_EntriesToDespawn =
{
	eCitadelCreatures::DoomLord,
	eCitadelCreatures::FelImp,
	eCitadelCreatures::DreadInfernal
};

/// Regens every second, 3 power, then 3 power, then 4 power, 10 power every 3 seconds
static std::array<int32, eMannorothDatas::MaxRegenCyclesP1> g_MannorothRegenCyclesP1 =
{
	3, 3, 4
};

Position const g_GuldanRedPos = { -2988.5510f, -226.4503f, 635.6118f, 1.3080f    };
Position const g_GuldanPurplePos = { -3065.3415f, -300.0372f, 635.6118f, 1.3990f };
Position const g_GuldanGreenPos = { -2965.6733f, -337.8967f, 635.6118f, 5.4124f  };
Position const g_GuldanRestPos = { -3034.9990f, -359.2541f, 635.6118f, 2.1708f   };

Position const g_FelIronSummonerRedSpawnPos = { -2987.3251f, -230.8034f, 606.2845f, 1.284561f };
Position const g_FelIronSummonerPurpleSpawnPos = { -3062.5588f, -299.2189f, 606.2307f, 3.248869f };
Position const g_FelIronSummonerGreenSpawnPos = { -2962.3632f, -343.1627f, 606.4561f, 5.361589f };