/// By Artamedes
#include "CUFProfile.hpp"

ByteBuffer& CUF::operator<<(ByteBuffer& p_Data, JamCliCUFProfile const& p_Profile)
{
    p_Data.WriteBits(p_Profile.Name.size(), 7);
    p_Data.WriteBit(p_Profile.KeepGroupsTogether);
    p_Data.WriteBit(p_Profile.DisplayPets);
    p_Data.WriteBit(p_Profile.DisplayMainTankAndAssist);
    p_Data.WriteBit(p_Profile.DisplayHealPrediction);
    p_Data.WriteBit(p_Profile.DisplayAggroHighlight);
    p_Data.WriteBit(p_Profile.DisplayOnlyDispellableDebuffs);
    p_Data.WriteBit(p_Profile.DisplayPowerBar);
    p_Data.WriteBit(p_Profile.DisplayBorder);
    p_Data.WriteBit(p_Profile.UseClassColors);
    p_Data.WriteBit(p_Profile.HorizontalGroups);
    p_Data.WriteBit(p_Profile.DisplayNonBossDebuffs);
    p_Data.WriteBit(p_Profile.DynamicPosition);
    p_Data.WriteBit(p_Profile.Locked);
    p_Data.WriteBit(p_Profile.Shown);
    p_Data.WriteBit(p_Profile.AutoActivate2Players);
    p_Data.WriteBit(p_Profile.AutoActivate3Players);
    p_Data.WriteBit(p_Profile.AutoActivate5Players);
    p_Data.WriteBit(p_Profile.AutoActivate10Players);
    p_Data.WriteBit(p_Profile.AutoActivate15Players);
    p_Data.WriteBit(p_Profile.AutoActivate25Players);
    p_Data.WriteBit(p_Profile.AutoActivate40Players);
    p_Data.WriteBit(p_Profile.AutoActivateSpec1);
    p_Data.WriteBit(p_Profile.AutoActivateSpec2);
    p_Data.WriteBit(p_Profile.AutoActivatePvP);
    p_Data.WriteBit(p_Profile.AutoActivatePvE);

    p_Data.FlushBits();

    p_Data << uint16(p_Profile.FrameHeight);
    p_Data << uint16(p_Profile.FrameWidth);
    p_Data << uint8(p_Profile.SortBy);
    p_Data << uint8(p_Profile.HealthText);
    p_Data << uint8(p_Profile.TopPoint);
    p_Data << uint8(p_Profile.BottomPoint);
    p_Data << uint8(p_Profile.LeftPoint);
    p_Data << uint16(p_Profile.TopOffset);
    p_Data << uint16(p_Profile.BottomOffset);
    p_Data << uint16(p_Profile.LeftOffset);

    p_Data.WriteString(p_Profile.Name);

    return p_Data;
}
