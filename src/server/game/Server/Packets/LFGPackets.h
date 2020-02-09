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

#ifndef LFGPackets_h__
#define LFGPackets_h__

#include "LFGPacketsCommon.h"
#include "LFGMgr.h"
#include "ObjectGuid.h"

namespace WorldPackets
{
    namespace LFG
    {
        class DFJoin : public ClientPacket
        {
        public:
            DFJoin(WorldPacket&& packet) : ClientPacket(CMSG_DF_JOIN, std::move(packet)) { }

            void Read() override;

            bool QueueAsGroup = false;
            uint8 PartyIndex = 0;
            uint32 Roles = 0;
            
            uint32 SlotCount = 0;
            std::vector<uint32> Slots;
            
            uint8 CommentLength = 0;
            std::string Comment = "";
        };

        class DFLeave : public ClientPacket
        {
        public:
            DFLeave(WorldPacket&& packet) : ClientPacket(CMSG_DF_LEAVE, std::move(packet)) { }

            void Read() override;

            RideTicket Ticket;
        };

        class DFProposalResponse final : public ClientPacket
        {
        public:
            DFProposalResponse(WorldPacket&& packet) : ClientPacket(CMSG_DF_PROPOSAL_RESPONSE, std::move(packet)) { }

            void Read() override;

            RideTicket Ticket;
            uint64 InstanceID = 0;
            uint32 ProposalID = 0;
            bool Accepted = false;
        };

        class DFSetRoles : public ClientPacket
        {
        public:
            DFSetRoles(WorldPacket&& packet) : ClientPacket(CMSG_DF_SET_ROLES, std::move(packet)) { }

            void Read() override;

            uint32 RolesDesired = 0;
            uint8 PartyIndex = 0;
        };

        class DFBootPlayerVote : public ClientPacket
        {
        public:
            DFBootPlayerVote(WorldPacket&& packet) : ClientPacket(CMSG_DF_BOOT_PLAYER_VOTE, std::move(packet)) { }

            void Read() override;

            bool Vote = false;
        };

        class DFTeleport final : public ClientPacket
        {
        public:
            DFTeleport(WorldPacket&& packet) : ClientPacket(CMSG_DF_TELEPORT, std::move(packet)) { }

            void Read() override;

            bool TeleportOut = false;
        };

        class DFGetJoinStatus final : public ClientPacket
        {
        public:
            DFGetJoinStatus(WorldPacket&& packet) : ClientPacket(CMSG_DF_GET_JOIN_STATUS, std::move(packet)) { }

            void Read() override;
        };

        struct LFGBlackListSlot
        {
            LFGBlackListSlot() { }
            LFGBlackListSlot(uint32 slot, uint32 reason, int32 subReason1, int32 subReason2) : Slot(slot), Reason(reason), SubReason1(subReason1), SubReason2(subReason2) { }

            uint32 Slot = 0;
            uint32 Reason = 0;
            uint32 SubReason1 = 0;
            uint32 SubReason2 = 0;
        };

        struct LFGBlackList
        {
            Optional<ObjectGuid> PlayerGuid;
            std::vector<LFGBlackListSlot> Slots;
        };

        struct LfgPlayerQuestRewardItem 
        {
            LfgPlayerQuestRewardItem() { }
            LfgPlayerQuestRewardItem(int32 itemId, int32 quantity) : ItemID(itemId), Quantity(quantity) { }

            uint32 ItemID = 0;
            uint32 Quantity = 0;
        };

        struct LfgPlayerQuestRewardCurrency
        {
            LfgPlayerQuestRewardCurrency() { }
            LfgPlayerQuestRewardCurrency(int32 currencyID, int32 quantity) : CurrencyID(currencyID), Quantity(quantity) { }

            uint32 CurrencyID = 0;
            uint32 Quantity = 0;
        };

        struct LfgPlayerQuestReward
        {
            uint32 Mask = 0;
            uint32 RewardMoney = 0;
            uint32 RewardXP = 0;
            std::vector<LfgPlayerQuestRewardItem> Item;
            std::vector<LfgPlayerQuestRewardCurrency> Currency;
            std::vector<LfgPlayerQuestRewardCurrency> BonusCurrency;
            Optional<uint32> RewardSpellID;
        };

        struct LfgPlayerDungeonInfo
        {
            uint32 Slot = 0;
            uint32 CompletionQuantity = 0;
            uint32 CompletionLimit = 0;
            uint32 CompletionCurrencyID = 0;
            uint32 SpecificQuantity = 0;
            uint32 SpecificLimit = 0;
            uint32 OverallQuantity = 0;
            uint32 OverallLimit = 0;
            uint32 PurseWeeklyQuantity = 0;
            uint32 PurseWeeklyLimit = 0;
            uint32 PurseQuantity = 0;
            uint32 PurseLimit = 0;
            uint32 Quantity = 0;
            uint32 CompletedMask = 0;
            bool FirstReward = false;
            bool ShortageEligible = false;
            LfgPlayerQuestReward Rewards;
            std::vector<LfgPlayerQuestReward> ShortageReward;
        };

        class DFGetSystemInfo final : public ClientPacket
        {
        public:
            DFGetSystemInfo(WorldPacket&& packet) : ClientPacket(CMSG_DF_GET_SYSTEM_INFO, std::move(packet)) { }

            void Read() override;

            uint8 PartyIndex = 0;
            bool Player = false;
        };

        class LfgPlayerInfo final : public ServerPacket
        {
        public:
            LfgPlayerInfo() : ServerPacket(SMSG_LFG_PLAYER_INFO) { }

            WorldPacket const* Write() override;

            ObjectGuid RequesterGuid;
            LFGBlackList BlackList;
            std::vector<LfgPlayerDungeonInfo> Dungeon;
        };

        class LfgPartyInfo final : public ServerPacket
        {
        public:
            LfgPartyInfo() : ServerPacket(SMSG_LFG_PARTY_INFO) { }

            WorldPacket const* Write() override;

            std::vector<LFGBlackList> Players;
        };

        class LfgUpdateStatus final : public ServerPacket
        {
        public:
            LfgUpdateStatus() : ServerPacket(SMSG_LFG_UPDATE_STATUS) { }

            WorldPacket const* Write() override;

            RideTicket Ticket;
            uint8 SubType = 0;
            uint8 Reason = 0;
            ObjectGuid PlayerGuid;
            std::vector<uint32> Slots;
            uint32 RequestedRoles = 0;
            std::vector<ObjectGuid> SuspendedPlayers;
            bool NotifyUI = false;
            bool IsParty = false;
            bool Joined = false;
            bool LfgJoined = false;
            bool Queued = false;
            std::string Comment = "";
        };

        class RoleChosen final : public ServerPacket
        {
        public:
            RoleChosen() : ServerPacket(SMSG_ROLE_CHOSEN) { }

            WorldPacket const* Write() override;

            ObjectGuid Player;
            uint32 RoleMask = 0;
            bool Accepted = false;
        };

        struct LFGRoleCheckUpdateMember
        {
            LFGRoleCheckUpdateMember() { }
            LFGRoleCheckUpdateMember(ObjectGuid guid, uint32 rolesDesired, uint8 level, bool roleCheckComplete)
                : Guid(guid), RolesDesired(rolesDesired), Level(level), RoleCheckComplete(roleCheckComplete) { }

            ObjectGuid Guid;
            uint32 RolesDesired = 0;
            uint8 Level = 0;
            bool RoleCheckComplete = false;
        };

        class LFGRoleCheckUpdate final : public ServerPacket
        {
        public:
            LFGRoleCheckUpdate() : ServerPacket(SMSG_LFG_ROLE_CHECK_UPDATE) { }

            WorldPacket const* Write() override;

            uint8 PartyIndex = 0;
            uint8 RoleCheckStatus = 0;
            std::vector<uint32> JoinSlots;
            uint64 BGQueueID = 0;
            uint32 GroupFinderActivityID = 0;
            std::vector<LFGRoleCheckUpdateMember> Members;
            bool IsBeginning = false;
            bool IsRequeue = false;
        };

        class LfgJoinResult final : public ServerPacket
        {
        public:
            LfgJoinResult() : ServerPacket(SMSG_LFG_JOIN_RESULT) { }

            WorldPacket const* Write() override;

            RideTicket Ticket;
            uint8 Result = 0;
            uint8 ResultDetail = 0;
            std::vector<LFGBlackList> BlackList;
        };

        class LfgQueueStatus final : public ServerPacket
        {
        public:
            LfgQueueStatus() : ServerPacket(SMSG_LFG_QUEUE_STATUS, 50) { }

            WorldPacket const* Write() override;

            RideTicket Ticket;
            uint32 Slot = 0;
            uint32 AvgWaitTimeMe = 0;
            uint32 AvgWaitTime = 0;
            int32 AvgWaitTimeByRole[3] = { };
            uint8 LastNeeded[3] = { };
            uint32 QueuedTime = 0;
        };

        struct LfgPlayerRewards
        {
            LfgPlayerRewards() { }
            LfgPlayerRewards(uint32 id, uint32 quantity, uint32 bonusQuantity, bool isCurrency)
                : RewardId(id), Quantity(quantity), BonusQuantity(bonusQuantity), IsCurrency(isCurrency) { }
            
            uint32 RewardId = 0;
            uint32 Quantity = 0;
            uint32 BonusQuantity = 0;
            bool IsCurrency;
        };

        class LfgPlayerReward final : public ServerPacket
        {
        public:
            LfgPlayerReward() : ServerPacket(SMSG_LFG_PLAYER_REWARD) { }

            WorldPacket const* Write() override;

            uint32 QueuedSlot = 0;
            uint32 ActualSlot = 0;
            uint32 RewardMoney = 0;
            uint32 AddedXP = 0;
            std::vector<LfgPlayerRewards> Rewards;
        };

        class LfgBootPlayer final : public ServerPacket
        {
        public:
            LfgBootPlayer() : ServerPacket(SMSG_LFG_BOOT_PLAYER) { }

            WorldPacket const* Write() override;

            bool VoteInProgress = false;
            bool VotePassed = false;
            bool MyVoteCompleted = false;
            bool MyVote = false;
            ObjectGuid Target;
            uint32 TotalVotes = 0;
            uint32 BootVotes = 0;
            uint32 TimeLeft = 0;
            uint32 VotesNeeded = 0;
            std::string Reason;
        };

        struct LfgProposalUpdatePlayer
        {
            uint32 Roles = 0;
            bool Me = false;
            bool SameParty = false;
            bool MyParty = false;
            bool Responded = false;
            bool Accepted = false;
        };

        class LfgProposalUpdate final : public ServerPacket
        {
        public:
            LfgProposalUpdate() : ServerPacket(SMSG_LFG_PROPOSAL_UPDATE) { }

            WorldPacket const* Write() override;

            RideTicket Ticket;
            uint64 InstanceID = 0;
            uint32 ProposalID = 0;
            uint32 Slot = 0;
            uint8 State = 0;
            uint32 CompletedMask = 0;
            std::vector<LfgProposalUpdatePlayer> Players;
            bool ValidCompletedMask = false;
            bool ProposalSilent = false;
        };

        class LfgDisabled final : public ServerPacket
        {
        public:
            LfgDisabled() : ServerPacket(SMSG_LFG_DISABLED, 0) { }

            WorldPacket const* Write() override { return &_worldPacket; }
        };

        class LfgOfferContinue final : public ServerPacket
        {
        public:
            LfgOfferContinue(uint32 slot) : ServerPacket(SMSG_LFG_OFFER_CONTINUE), Slot(slot) { }

            WorldPacket const* Write() override;

            uint32 Slot = 0;
        };

        class LfgTeleportDenied final : public ServerPacket
        {
        public:
            LfgTeleportDenied(lfg::LfgTeleportError reason) : ServerPacket(SMSG_LFG_TELEPORT_DENIED, 1), Reason(reason) { }

            WorldPacket const* Write() override;

            lfg::LfgTeleportError Reason;
        };
    }
}

#endif // LFGPackets_h__
