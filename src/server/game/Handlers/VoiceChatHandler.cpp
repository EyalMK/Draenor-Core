////////////////////////////////////////////////////////////////////////////////
//
// Project-Hellscream https://hellscream.org
// Copyright (C) 2018-2020 Project-Hellscream-6.2
// Discord https://discord.gg/CWCF3C9
//
////////////////////////////////////////////////////////////////////////////////

#include "Common.h"
#include "WorldPacket.h"
#include "WorldSession.h"
#include "Opcodes.h"
#include "Log.h"

void WorldSession::HandleVoiceSessionEnableOpcode(WorldPacket & p_Packet)
{
    p_Packet.rfinish();
}

void WorldSession::HandleChannelVoiceOnOpcode(WorldPacket & p_Packet)
{
    p_Packet.rfinish();
}

void WorldSession::HandleSetActiveVoiceChannel(WorldPacket& p_Packet)
{
    p_Packet.rfinish();
}

