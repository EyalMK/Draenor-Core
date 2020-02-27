#ifndef TANAAN_JUNGLE_100_H
#define TANAAN_JUNGLE_100_H

namespace Tanaan100Zones
{
	enum
	{
		MapDraenor				 = 1116,
		MapTanaanJungle100Hub	 = 1464,
		MapTanaanJungle100NoHubs = 1465,
		MapHellfireCitadel		 = 1448,

		ZoneTanaanJungle100		 = 6723
	};
}

namespace Tanaan100Phases
{
	enum
	{
		PhaseBase	= 0x00000001, /// This is the phase when you already have your hub set
		PhaseNoHub  = 0x20000000, /// This is the phase when you first enter Tanaan without an hub
		PhaseHorde	= 0x00000200, /// At the starting point, we see horde npcs
		PhaseAlly	= 0x00000080  /// At the starting point, we see ally npcs
	};
}

namespace Tanaan100SceneObjects
{
	enum
	{
		SceneHordeHub = 1406,
		SceneAllyHub  = 1405
	};
}

namespace Tanaan100Quests
{
	enum
	{
		TheAssaultBaseHorde = 37935,
		TheAssaultBaseAlly  = 38445
	};
}

namespace Tanaan100KillCredits
{
	enum
	{
		CreditFlagBase		= 90374,
		CreditFollowMatumba = 90375,
		CreditFollowNaielle = 91932
	};
}

namespace Tanaan100QuestObjectives
{
	enum
	{
		ObjFollowMutumba = 400000,
		ObjFlagBaseHorde = 400001,
		ObjFollowNaielle = 400002,
		ObjFlagBaseAlly  = 400003,
	};
}

namespace Tanaan100Datas
{
	enum
	{
		HealthScalingCoeff = 10,
		DamageScalingCoeff = 1
	};
}

namespace Tanaan100Creatures
{
	enum
	{
		NpcMutumba				= 90238,
		NpcDraka				= 90481,
		NpcVolmarShadowHunter	= 90988,
		NpcVolmarGrunt1			= 90987,
		NpcVolmarGrunt2			= 95601,

		NpcTriggerHub			= 60145,
		NPC_TWISTED_REFLECTION  = 86524
	};
}

enum eMovepointsData
{
	MaxDrakaMoves1	 = 2,
	MaxDrakaMoves2	 = 2,
	MaxMutumbaMoves  = 7,
	MaxSHMoves1		 = 12,
	MaxSHMoves2		 = 10,
	MaxSHMoves3		 = 12
};

static std::array<G3D::Vector3, eMovepointsData::MaxDrakaMoves1> g_DrakaMoves1 =
{
	{
		{ 4327.2148f, -1524.8704f, 88.0243f },
		{ 4326.0864f, -1524.1312f, 88.0243f }
	}
};

static std::array<G3D::Vector3, eMovepointsData::MaxDrakaMoves2> g_DrakaMoves2 =
{
	{
		{ 4326.0864f, -1524.1312f, 88.0243f },
		{ 4327.2148f, -1524.8704f, 88.0243f }
	}
};

static std::array<G3D::Vector3, eMovepointsData::MaxMutumbaMoves> g_MutumbaMoves =
{
	{
		{ 4140.50f, -1535.82f, 50.460f },
		{ 4155.66f, -1475.48f, 53.765f },
		{ 4180.58f, -1458.91f, 58.550f },
		{ 4198.67f, -1454.82f, 65.238f },
		{ 4214.49f, -1450.33f, 69.170f },
		{ 4240.91f, -1458.41f, 77.775f },
		{ 4283.86f, -1487.85f, 80.328f }
	}
};

static std::array<G3D::Vector3, eMovepointsData::MaxSHMoves1> g_MSHMoves1 =
{
	{
		{ 4199.1338f, -1443.8170f, 67.9030f },
		{ 4214.7056f, -1447.1168f, 68.9085f },
		{ 4221.3921f, -1454.5458f, 71.9016f },
		{ 4246.6870f, -1458.4767f, 78.1921f },
		{ 4222.9321f, -1453.4609f, 72.2518f },
		{ 4211.4077f, -1446.0630f, 68.5285f },
		{ 4182.9678f, -1458.3136f, 59.0764f },
		{ 4171.5166f, -1466.1787f, 57.3317f },
		{ 4184.0596f, -1457.8839f, 59.3566f },
		{ 4200.9600f, -1451.3870f, 66.3215f },
		{ 4201.1172f, -1444.9998f, 67.4893f },
		{ 4190.1514f, -1443.7013f, 68.2678f }
	}
};

static std::array<G3D::Vector3, eMovepointsData::MaxSHMoves2> g_MSHMoves2 =
{
	{
		{ 4269.3750f, -1447.5773f, 74.7494f },
		{ 4285.1885f, -1448.4231f, 74.5812f },
		{ 4307.4517f, -1436.9205f, 71.1337f },
		{ 4315.3271f, -1443.5371f, 71.0930f },
		{ 4315.6357f, -1442.9799f, 71.0676f },
		{ 4307.4517f, -1436.9205f, 71.1337f },
		{ 4285.1885f, -1448.4231f, 74.5812f },
		{ 4269.3750f, -1447.5773f, 74.7494f },
		{ 4266.8467f, -1443.5220f, 74.5661f },
		{ 4268.0640f, -1444.1272f, 74.5752f }
	}
};

#endif