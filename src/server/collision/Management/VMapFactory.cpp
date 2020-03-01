////////////////////////////////////////////////////////////////////////////////
//
// Project-Hellscream https://hellscream.org
// Copyright (C) 2018-2020 Project-Hellscream-6.2
// Discord https://discord.gg/CWCF3C9
//
////////////////////////////////////////////////////////////////////////////////

#include "VMapFactory.h"
#include "VMapManager2.h"

namespace VMAP
{
    IVMapManager* gVMapManager = NULL;

    //===============================================
    // just return the instance
    IVMapManager* VMapFactory::createOrGetVMapManager()
    {
        if (gVMapManager == 0)
            gVMapManager= new VMapManager2();                // should be taken from config ... Please change if you like :-)
        return gVMapManager;
    }

    //===============================================
    // delete all internal data structures
    void VMapFactory::clear()
    {
        delete gVMapManager;
        gVMapManager = NULL;
    }
}
