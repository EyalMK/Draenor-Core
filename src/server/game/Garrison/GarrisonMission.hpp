////////////////////////////////////////////////////////////////////////////////
//
// Project-Hellscream https://hellscream.org
// Copyright (C) 2018-2020 Project-Hellscream-6.2
// Discord https://discord.gg/CWCF3C9
//
////////////////////////////////////////////////////////////////////////////////
#ifndef GARRISON_MISSION_HPP_GARRISON
#ifndef CROSS
#define GARRISON_MISSION_HPP_GARRISON

#include "GarrisonMgrConstants.hpp"

namespace MS { namespace Garrison
{
    /// Garrison mission
    struct GarrisonMission
    {
        uint32 DatabaseID;          ///< Mission DB ID
        uint32 MissionID;           ///< Mission ID (GarrMission.db2)
        uint32 OfferTime;           ///< Offer time
        uint32 OfferMaxDuration;    ///< Offer max duration
        uint32 StartTime;           ///< Start time
        Mission::State State;  ///< Mission state
    };

}   ///< namespace Garrison
}   ///< namespace MS

#endif  ///< GARRISON_MISSION_HPP_GARRISON
#endif
