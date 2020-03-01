////////////////////////////////////////////////////////////////////////////////
//
// Project-Hellscream https://hellscream.org
// Copyright (C) 2018-2020 Project-Hellscream-6.2
// Discord https://discord.gg/CWCF3C9
//
////////////////////////////////////////////////////////////////////////////////

#include "AnticheatScripts.h"
#include "AnticheatMgr.h"

AnticheatScripts::AnticheatScripts(): PlayerScript("AnticheatScripts") {}

void AnticheatScripts::OnLogout(Player* player)
{
    sAnticheatMgr->HandlePlayerLogout(player);
}

void AnticheatScripts::OnLogin(Player* player)
{
    sAnticheatMgr->HandlePlayerLogin(player);
}
