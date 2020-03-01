////////////////////////////////////////////////////////////////////////////////
//
// Project-Hellscream https://hellscream.org
// Copyright (C) 2018-2020 Project-Hellscream-6.2
// Discord https://discord.gg/CWCF3C9
//
////////////////////////////////////////////////////////////////////////////////

#ifndef TRINITY_PACKETLOG_H
#define TRINITY_PACKETLOG_H

#include "Common.h"

enum Direction
{
    CLIENT_TO_SERVER,
    SERVER_TO_CLIENT
};

class WorldPacket;

class PacketLog
{
    friend class ACE_Singleton<PacketLog, ACE_Thread_Mutex>;

    private:
        PacketLog();
        ~PacketLog();

    public:
        void Initialize();
        bool CanLogPacket() const { return (_file != NULL); }
        void LogPacket(WorldPacket const& packet, Direction direction);

    private:
        FILE* _file;
};

#define sPacketLog ACE_Singleton<PacketLog, ACE_Thread_Mutex>::instance()
#endif
