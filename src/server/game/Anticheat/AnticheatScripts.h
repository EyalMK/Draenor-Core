////////////////////////////////////////////////////////////////////////////////
//
// Project-Hellscream https://hellscream.org
// Copyright (C) 2018-2020 Project-Hellscream-6.2
// Discord https://discord.gg/CWCF3C9
//
////////////////////////////////////////////////////////////////////////////////

#ifndef SC_ACSCRIPTS_H
#define SC_ACSCRIPTS_H

#include "ScriptPCH.h"

class AnticheatScripts : public PlayerScript
{
    public:
        AnticheatScripts();

        void OnLogout(Player* player);
        void OnLogin(Player* player);
};

#endif
