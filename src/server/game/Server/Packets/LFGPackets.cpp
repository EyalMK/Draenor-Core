/*
 * Copyright (C) 2008-2016 TrinityCore <http://www.trinitycore.org/>
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation; either version 2 of the License, or (at your
 * option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program. If not, see <http://www.gnu.org/licenses/>.
 */

#include "LFGPackets.h"

void WorldPackets::LFG::DFJoin::Read()
{
    QueueAsGroup = _worldPacket.ReadBit();
    CommentLength = _worldPacket.ReadBits(8);
    _worldPacket >> PartyIndex;
    _worldPacket >> Roles;
    _worldPacket >> SlotCount;

    for (int i = 0; i < 3; ++i)
        _worldPacket.read_skip<uint32>();
    
    Comment = _worldPacket.ReadString(CommentLength);

    Slots.resize(SlotCount);
    for (uint32& slot : Slots)
        _worldPacket >> slot;
}

void WorldPackets::LFG::DFLeave::Read()
{
    _worldPacket >> Ticket;
}

void WorldPackets::LFG::DFProposalResponse::Read()
{
    _worldPacket >> Ticket;
    _worldPacket >> InstanceID;
    _worldPacket >> ProposalID;
    Accepted = _worldPacket.ReadBit();
}

void WorldPackets::LFG::DFSetRoles::Read()
{
    _worldPacket >> RolesDesired;
    _worldPacket >> PartyIndex;
}

void WorldPackets::LFG::DFBootPlayerVote::Read()
{
    Vote = _worldPacket.ReadBit();
}

void WorldPackets::LFG::DFTeleport::Read()
{
    TeleportOut = _worldPacket.ReadBit();
}

void WorldPackets::LFG::DFGetSystemInfo::Read()
{
    Player = _worldPacket.ReadBit();
    _worldPacket >> PartyIndex;
}

void WorldPackets::LFG::DFGetJoinStatus::Read()
{
}

ByteBuffer& operator<<(ByteBuffer& data, WorldPackets::LFG::LFGBlackListSlot const& lfgBlackListSlot)
{
    data << uint32(lfgBlackListSlot.Slot);
    data << uint32(lfgBlackListSlot.Reason);
    data << uint32(lfgBlackListSlot.SubReason1);
    data << uint32(lfgBlackListSlot.SubReason2);

    return data;
}

ByteBuffer& operator<<(ByteBuffer& data, WorldPackets::LFG::LFGBlackList const& blackList)
{
    data.WriteBit(blackList.PlayerGuid.is_initialized());
    data << uint32(blackList.Slots.size());
    if (blackList.PlayerGuid)
        data << *blackList.PlayerGuid;

    for (WorldPackets::LFG::LFGBlackListSlot const& slot : blackList.Slots)
        data << slot;

    return data;
}

ByteBuffer& operator<<(ByteBuffer& data, WorldPackets::LFG::LfgPlayerQuestRewardItem const& playerQuestRewardItem)
{
    data << uint32(playerQuestRewardItem.ItemID);
    data << uint32(playerQuestRewardItem.Quantity);

    return data;
}

ByteBuffer& operator<<(ByteBuffer& data, WorldPackets::LFG::LfgPlayerQuestRewardCurrency const& playerQuestRewardCurrency)
{
    data << uint32(playerQuestRewardCurrency.CurrencyID);
    data << uint32(playerQuestRewardCurrency.Quantity);

    return data;
}

ByteBuffer& operator<<(ByteBuffer& data, WorldPackets::LFG::LfgPlayerQuestReward const& playerQuestReward)
{
    data << uint32(playerQuestReward.Mask);
    data << uint32(playerQuestReward.RewardMoney);
    data << uint32(playerQuestReward.RewardXP);
    data << uint32(playerQuestReward.Item.size());
    data << uint32(playerQuestReward.Currency.size());
    data << uint32(playerQuestReward.BonusCurrency.size());

    for (WorldPackets::LFG::LfgPlayerQuestRewardItem const& item : playerQuestReward.Item)
        data << item;

    for (WorldPackets::LFG::LfgPlayerQuestRewardCurrency const& currency : playerQuestReward.Currency)
        data << currency;

    for (WorldPackets::LFG::LfgPlayerQuestRewardCurrency const& bonusCurrency : playerQuestReward.BonusCurrency)
        data << bonusCurrency;
    
    data.WriteBit(playerQuestReward.RewardSpellID.is_initialized());
    if (playerQuestReward.RewardSpellID)
        data << uint32(*playerQuestReward.RewardSpellID);

    return data;
}

ByteBuffer& operator<<(ByteBuffer& data, WorldPackets::LFG::LfgPlayerDungeonInfo const& playerDungeonInfo)
{
    data << uint32(playerDungeonInfo.Slot);
    data << uint32(playerDungeonInfo.CompletionQuantity);
    data << uint32(playerDungeonInfo.CompletionLimit);
    data << uint32(playerDungeonInfo.CompletionCurrencyID);
    data << uint32(playerDungeonInfo.SpecificQuantity);
    data << uint32(playerDungeonInfo.SpecificLimit);
    data << uint32(playerDungeonInfo.OverallQuantity);
    data << uint32(playerDungeonInfo.OverallLimit);
    data << uint32(playerDungeonInfo.PurseWeeklyQuantity);
    data << uint32(playerDungeonInfo.PurseWeeklyLimit);
    data << uint32(playerDungeonInfo.PurseQuantity);
    data << uint32(playerDungeonInfo.PurseLimit);
    data << uint32(playerDungeonInfo.Quantity);
    data << uint32(playerDungeonInfo.CompletedMask);

    data << uint32(playerDungeonInfo.ShortageReward.size());
    data << playerDungeonInfo.Rewards;
    for (WorldPackets::LFG::LfgPlayerQuestReward const& shortageReward : playerDungeonInfo.ShortageReward)
        data << shortageReward;

    data.WriteBit(playerDungeonInfo.FirstReward);
    data.WriteBit(playerDungeonInfo.ShortageEligible);
    data.FlushBits();
    
    return data;
}

WorldPacket const* WorldPackets::LFG::LfgPlayerInfo::Write()
{
    _worldPacket << uint32(Dungeon.size());
    _worldPacket << BlackList;
    for (LfgPlayerDungeonInfo const& playerDungeonInfo : Dungeon)
        _worldPacket << playerDungeonInfo;

    return &_worldPacket;
}

WorldPacket const* WorldPackets::LFG::LfgPartyInfo::Write()
{
    _worldPacket << uint32(Players.size());
    for (WorldPackets::LFG::LFGBlackList const& player : Players)
        _worldPacket << player;

    return &_worldPacket;
}

WorldPacket const* WorldPackets::LFG::LfgUpdateStatus::Write()
{
    _worldPacket << Ticket;
    _worldPacket << uint8(SubType);
    _worldPacket << uint8(Reason);

    for (int i = 0; i < 3; ++i)
        _worldPacket << uint8(0);

    _worldPacket << uint32(Slots.size());
    _worldPacket << uint32(RequestedRoles);
    _worldPacket << uint32(SuspendedPlayers.size());

    for (uint32 slot : Slots)
        _worldPacket << uint32(slot);
    
    for (ObjectGuid const& suspendedPlayer : SuspendedPlayers)
        _worldPacket << suspendedPlayer;
    
    _worldPacket.WriteBit(NotifyUI);
    _worldPacket.WriteBit(IsParty);
    _worldPacket.WriteBit(Joined);
    _worldPacket.WriteBit(LfgJoined);
    _worldPacket.WriteBit(Queued);
    _worldPacket.WriteBits(Comment.size(), 8);
    _worldPacket.FlushBits();
    _worldPacket.WriteString(Comment);

    return &_worldPacket;
}

WorldPacket const* WorldPackets::LFG::RoleChosen::Write()
{
    _worldPacket << Player;
    _worldPacket << uint32(RoleMask);
    _worldPacket.WriteBit(Accepted);
    _worldPacket.FlushBits();

    return &_worldPacket;
}

ByteBuffer& operator<<(ByteBuffer& data, WorldPackets::LFG::LFGRoleCheckUpdateMember const& lfgRoleCheckUpdateMember)
{
    data << lfgRoleCheckUpdateMember.Guid;
    data << uint32(lfgRoleCheckUpdateMember.RolesDesired);
    data << uint8(lfgRoleCheckUpdateMember.Level);
    data.WriteBit(lfgRoleCheckUpdateMember.RoleCheckComplete);
    data.FlushBits();

    return data;
}

WorldPacket const* WorldPackets::LFG::LFGRoleCheckUpdate::Write()
{
    _worldPacket << uint8(PartyIndex);
    _worldPacket << uint8(RoleCheckStatus);
    _worldPacket << uint32(JoinSlots.size());
    _worldPacket << uint64(BGQueueID);
    _worldPacket << uint32(GroupFinderActivityID);
    _worldPacket << uint32(Members.size());

    for (uint32 slot : JoinSlots)
        _worldPacket << uint32(slot);

    for (LFGRoleCheckUpdateMember const& member : Members)
        _worldPacket << member;

    _worldPacket.WriteBit(IsBeginning);
    _worldPacket.WriteBit(IsRequeue);
    _worldPacket.FlushBits();

    return &_worldPacket;
}

WorldPacket const* WorldPackets::LFG::LfgJoinResult::Write()
{
    _worldPacket << Ticket;
    _worldPacket << uint8(Result);
    _worldPacket << uint8(ResultDetail);
    _worldPacket << uint32(BlackList.size());

    for (LFGBlackList const& blackList : BlackList)
        _worldPacket << blackList;

    return &_worldPacket;
}

WorldPacket const* WorldPackets::LFG::LfgQueueStatus::Write()
{
    _worldPacket << Ticket;
    _worldPacket << uint32(Slot);
    _worldPacket << uint32(AvgWaitTimeMe);
    _worldPacket << uint32(AvgWaitTime);

    for (uint32 i = 0; i < 3; ++i)
    {
        _worldPacket << int32(AvgWaitTimeByRole[i]);
        _worldPacket << uint8(LastNeeded[i]);
    }

    _worldPacket << uint32(QueuedTime);

    return &_worldPacket;
}

ByteBuffer& operator<<(ByteBuffer& data, WorldPackets::LFG::LfgPlayerRewards const& lfgPlayerRewards)
{
    data << uint32(lfgPlayerRewards.RewardId);
    data << uint32(lfgPlayerRewards.Quantity);
    data << uint32(lfgPlayerRewards.BonusQuantity);
    data.WriteBit(lfgPlayerRewards.IsCurrency);
    data.FlushBits();

    return data;
}

WorldPacket const* WorldPackets::LFG::LfgPlayerReward::Write()
{
    _worldPacket << uint32(QueuedSlot);
    _worldPacket << uint32(ActualSlot);
    _worldPacket << uint32(RewardMoney);
    _worldPacket << uint32(AddedXP);
    _worldPacket << uint32(Rewards.size());

    for (LfgPlayerRewards const& reward : Rewards)
        _worldPacket << reward;

    return &_worldPacket;
}

WorldPacket const* WorldPackets::LFG::LfgBootPlayer::Write()
{
    _worldPacket.WriteBit(VoteInProgress);
    _worldPacket.WriteBit(VotePassed);
    _worldPacket.WriteBit(MyVoteCompleted);
    _worldPacket.WriteBit(MyVote);
    _worldPacket.WriteBits(Reason.length(), 8);
    _worldPacket.FlushBits();
    _worldPacket << Target;
    _worldPacket << uint32(TotalVotes);
    _worldPacket << uint32(BootVotes);
    _worldPacket << uint32(TimeLeft);
    _worldPacket << uint32(VotesNeeded);
    _worldPacket.WriteString(Reason);

    return &_worldPacket;
}

ByteBuffer& operator<<(ByteBuffer& data, WorldPackets::LFG::LfgProposalUpdatePlayer const& lfgProposalUpdatePlayer)
{
    data << uint32(lfgProposalUpdatePlayer.Roles);
    data.WriteBit(lfgProposalUpdatePlayer.Me);
    data.WriteBit(lfgProposalUpdatePlayer.SameParty);
    data.WriteBit(lfgProposalUpdatePlayer.MyParty);
    data.WriteBit(lfgProposalUpdatePlayer.Responded);
    data.WriteBit(lfgProposalUpdatePlayer.Accepted);
    data.FlushBits();

    return data;
}

WorldPacket const* WorldPackets::LFG::LfgProposalUpdate::Write()
{
    _worldPacket << Ticket;
    _worldPacket << uint64(InstanceID);
    _worldPacket << uint32(ProposalID);
    _worldPacket << uint32(Slot);
    _worldPacket << uint8(State);
    _worldPacket << uint32(CompletedMask);
    _worldPacket << uint32(Players.size());
    for (LfgProposalUpdatePlayer const& player : Players)
        _worldPacket << player;
    _worldPacket.WriteBit(ValidCompletedMask);
    _worldPacket.WriteBit(ProposalSilent);
    _worldPacket.FlushBits();

    return &_worldPacket;
}

WorldPacket const* WorldPackets::LFG::LfgOfferContinue::Write()
{
    _worldPacket << uint32(Slot);

    return &_worldPacket;
}

WorldPacket const* WorldPackets::LFG::LfgTeleportDenied::Write()
{
    _worldPacket.WriteBits(Reason, 4);
    _worldPacket.FlushBits();

    return &_worldPacket;
}