////////////////////////////////////////////////////////////////////////////////
//
// Project-Hellscream https://hellscream.org
// Copyright (C) 2018-2020 Project-Hellscream-6.2
// Discord https://discord.gg/CWCF3C9
//
////////////////////////////////////////////////////////////////////////////////

#include "MMapFactory.h"
#include "Config.h"

namespace MMAP
{
    // ######################## MMapFactory ########################
    // our global singleton copy
    MMapManager* g_MMapManager = NULL;

    MMapManager* MMapFactory::createOrGetMMapManager()
    {
        if (g_MMapManager == NULL)
            g_MMapManager = new MMapManager();

        return g_MMapManager;
    }

    void MMapFactory::clear()
    {
        if (g_MMapManager)
        {
            delete g_MMapManager;
            g_MMapManager = NULL;
        }
    }
}
