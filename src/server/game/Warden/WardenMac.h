////////////////////////////////////////////////////////////////////////////////
//
// Project-Hellscream https://hellscream.org
// Copyright (C) 2018-2020 Project-Hellscream-6.2
// Discord https://discord.gg/CWCF3C9
//
////////////////////////////////////////////////////////////////////////////////

#ifndef _WARDEN_MAC_H
#define _WARDEN_MAC_H

#include "Cryptography/ARC4.h"
#include "Common.h"
#include "Cryptography/BigNumber.h"
#include "ByteBuffer.h"
#include "Warden.h"

class WorldSession;
class Warden;

class WardenMac : public Warden
{
    public:
        WardenMac();
        ~WardenMac();

        void Init(WorldSession* session, BigNumber* k);
        ClientWardenModule* GetModuleForClient();
        void InitializeModule();
        void RequestHash();
        void HandleHashResult(ByteBuffer& buff);
        void RequestData();
        void HandleData(ByteBuffer& buff);
};

#endif
