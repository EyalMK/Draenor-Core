////////////////////////////////////////////////////////////////////////////////
//
// Project-Hellscream https://hellscream.org
// Copyright (C) 2018-2020 Project-Hellscream-6.2
// Discord https://discord.gg/CWCF3C9
//
////////////////////////////////////////////////////////////////////////////////

#ifndef CONFIG_H
#define CONFIG_H

#include "Common.h"

namespace ConfigMgr
{
    bool Load(const char *file = NULL);

    std::string GetStringDefault(const char* name, const std::string& def);
    bool GetBoolDefault(const char* name, bool def);
    int GetIntDefault(const char* name, int def);
    float GetFloatDefault(const char* name, float def);

    const std::string & GetFilename();
}

#endif
