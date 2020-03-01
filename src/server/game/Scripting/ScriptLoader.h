////////////////////////////////////////////////////////////////////////////////
//
// Project-Hellscream https://hellscream.org
// Copyright (C) 2018-2020 Project-Hellscream-6.2
// Discord https://discord.gg/CWCF3C9
//
////////////////////////////////////////////////////////////////////////////////

#ifndef SC_SCRIPTLOADER_H
#define SC_SCRIPTLOADER_H

void AddScripts();
void AddWorldScripts();
void AddSpellScripts();
#ifndef CROSS
void AddCommandScripts();
#endif /* not CROSS */
void AddWorldScripts();
#ifdef CROSS
void AddCommandScripts();
#endif /* CROSS */
void AddEasternKingdomsScripts();
void AddKalimdorScripts();
void AddOutlandScripts();
void AddNorthrendScripts();
void AddPandarieScripts();
void AddDraenorScripts();
void AddBattlegroundScripts();
void AddOutdoorPvPScripts();
void AddCustomScripts();
#ifndef CROSS
void AddBattlePayScripts();
#endif /* not CROSS */

#endif
