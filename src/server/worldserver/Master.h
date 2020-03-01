////////////////////////////////////////////////////////////////////////////////
//
// Project-Hellscream https://hellscream.org
// Copyright (C) 2018-2020 Project-Hellscream-6.2
// Discord https://discord.gg/CWCF3C9
//
////////////////////////////////////////////////////////////////////////////////

/// \addtogroup Trinityd
/// @{
/// \file

#ifndef _MASTER_H
#define _MASTER_H

#include "Common.h"

/// Start the server
class Master
{
    public:
        Master();
        ~Master();
        int Run();

    private:
        bool _StartDB();
        void _StopDB();

        void ClearOnlineAccounts();
        void ExecutePendingRequests();
};

#define sMaster ACE_Singleton<Master, ACE_Null_Mutex>::instance()
#endif
/// @}
