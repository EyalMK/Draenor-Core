////////////////////////////////////////////////////////////////////////////////
//
//  MILLENIUM-STUDIO
//  Copyright 2016 Millenium-studio SARL
//  All Rights Reserved.
//
////////////////////////////////////////////////////////////////////////////////

#ifndef HELLFIRE_CITADEL_HPP
#define HELLFIRE_CITADEL_HPP

# include "InstanceScript.h"
# include "ScriptedCosmeticAI.hpp"
# include "ScriptedCreature.h"
# include "ScriptMgr.h"
# include "ScriptUtils.h"
# include "Cell.h"
# include "CellImpl.h"
# include "GridNotifiers.h"
# include "GridNotifiersImpl.h"
# include "Vehicle.h"
# include "GameObjectAI.h"
# include "Group.h"
# include "MoveSplineInit.h"
# include "CreatureTextMgr.h"

// About HP scaling, in DB, Health_mod for Exp 5 (1 = 109k HP)

static void CastSpellToPlayers(Map* p_Map, Unit* p_Caster, uint32 p_SpellID, bool p_Triggered)
{
	if (p_Map == nullptr)
		return;

	Map::PlayerList const& l_Players = p_Map->GetPlayers();
	for (Map::PlayerList::const_iterator l_Iter = l_Players.begin(); l_Iter != l_Players.end(); ++l_Iter)
	{
		if (Player* l_Player = l_Iter->getSource())
		{
			if (p_Caster != nullptr)
				p_Caster->CastSpell(l_Player, p_SpellID, p_Triggered);
			else
				l_Player->CastSpell(l_Player, p_SpellID, p_Triggered);
		}
	}
}

static void DespawnCreaturesInArea(uint32 p_Entry, WorldObject* p_WorldObject)
{
	std::list<Creature*> l_Creatures;
	GetCreatureListWithEntryInGrid(l_Creatures, p_WorldObject, p_Entry, p_WorldObject->GetMap()->GetVisibilityRange());

	for (Creature* l_Iter : l_Creatures)
		l_Iter->DespawnOrUnsummon();
}

enum eCitadelZones
{
	MapHellfireCitadel = 1448,

};

enum eCitadelCreatures
{
	/// Hellbreach - Part 1

	/// Hellfire Assault
	BossMartak = 95068,

	/// Iron Reaver
	BossReaver = 90284,

	/// Kormrok
	BossKormrok = 90776,

	/// Halls of Blood - Part 2

	/// Hellfire High Council
	BossGurtogg = 92146,
	BossDia = 92144,
	BossJubeithos = 92142,

	/// Kilrogg Deadeye
	BossKilrogg = 90378,

	/// Gorefiend
	BossGorefiend = 91809,

	/// Bastion of Shadows - Part 3

	/// Shadow-Lord Iskar
	BossIskar = 90316,

	/// Socrethar the Eternal
	BossSocrethar = 92330,

	/// Tyrant Velhari
	BossVelhari = 93439,

	/// Destructor's Rise - Part 4

	/// Fel Lord Zakuun
	BossZakuun = 89890,

	/// Xhul'horac
	BossXhulhorac = 93068,

	/// Mannoroth
	BossMannoroth = 91349,
	FelSummoner = 91305,
	MassiveBlastWave = 454533,

	FelRedSpire = 95851,
	FelPurpleSpire = 464544,
	FelGreenSpire = 464545,

	GuldanMann = 91326,
	ChannelTarget = 94928,

	DoomLord = 91241,
	FelImp = 91259,
	DreadInfernal = 91270,

	KhadgarMann = 95659,
	PortalMann = 95699,

	/// The Black Gate - Part 5

	/// Archimonde
	Anetheron = 95408,
	Kazrogal = 95280,
	Azgalor = 95282,
	AchievementStalker = 80831,
	BossArchimonde = 91331
};

enum eCitadelGameObjects
{
	/// Hellbreach - Part 1
	ReinforcedHellfireDoor = 242464,

	/// Halls of Blood - Part 2

	/// Bastion of Shadows - Part 3

	/// Destructor's Rise - Part 4
	MannorothPlatformFix = 700000,

	/// The Black Gate - Part 5
	DarkPortalFireWall = 241485
};

enum eCitadelDatas
{
	/// Bosses
	DataMartak,
	DataReaver,
	DataKormrok,
	DataCouncil,
	DataKilrogg,
	DataGorefiend,
	DataIskar,
	DataSocrethar,
	DataVelhari,
	DataZakuun,
	DataXhulhorac,
	DataMannoroth,
	DataArchimonde,
	MaxBossData,

	/// Other boss datas
	DataFelIronSummoner = eCitadelDatas::MaxBossData,

	/// Some define datas
	FriendlyFaction = 35,

	// Counters

	// Hellfire High Council
	CouncilCount = 3,
	// Mannoroth
	MaxSummoners = 3
};

enum eCitadelSpells
{
	Berserker = 26662
};

enum eCitadelAchievements
{
	AchievementArchimondeEdge = 10045,
	AchievementArchimondeMythic = 10043,
	AchievementArchimondeCurve = 10044,
	AchievementArchimondeNormal = 10019
};

enum eCitadelCriterias
{

};

enum eCitadelWorldState
{

};

enum eCitadelVisuals
{

};

enum eCitadelDungeons
{
	Hellbreach = 982,
	HallsofBlood = 983,
	BastionofShadows = 984,
	DestructorRise = 985,
	BlackGate = 986
};

static std::array<uint32, eCitadelDatas::CouncilCount> g_CouncilEntries =
{
	eCitadelCreatures::BossGurtogg,
	eCitadelCreatures::BossDia,
	eCitadelCreatures::BossJubeithos
};

#endif