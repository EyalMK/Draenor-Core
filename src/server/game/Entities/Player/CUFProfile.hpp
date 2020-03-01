/// By Artamedes
#pragma once

/// Shared
#include "ByteBuffer.h"
#include "Define.h"

namespace CUF
{
    struct JamCliCUFProfile
    {
        std::string Name;                                 ///< Offset 0x0000 Type _MJVTBL_STRING
        uint16      FrameHeight;                          ///< Offset 0x0080 Type _MJVTBL_UINT16
        uint16      FrameWidth;                           ///< Offset 0x0082 Type _MJVTBL_UINT16
        uint8       SortBy;                               ///< Offset 0x0084 Type _MJVTBL_UINT8
        uint8       HealthText;                           ///< Offset 0x0085 Type _MJVTBL_UINT8
        bool        KeepGroupsTogether;                   ///< Offset 0x0086 Type _MJVTBL_BOOL
        bool        DisplayPets;                          ///< Offset 0x0087 Type _MJVTBL_BOOL
        bool        DisplayMainTankAndAssist;             ///< Offset 0x0088 Type _MJVTBL_BOOL
        bool        DisplayHealPrediction;                ///< Offset 0x0089 Type _MJVTBL_BOOL
        bool        DisplayAggroHighlight;                ///< Offset 0x008A Type _MJVTBL_BOOL
        bool        DisplayOnlyDispellableDebuffs;        ///< Offset 0x008B Type _MJVTBL_BOOL
        bool        DisplayPowerBar;                      ///< Offset 0x008C Type _MJVTBL_BOOL
        bool        DisplayBorder;                        ///< Offset 0x008D Type _MJVTBL_BOOL
        bool        UseClassColors;                       ///< Offset 0x008E Type _MJVTBL_BOOL
        bool        HorizontalGroups;                     ///< Offset 0x008F Type _MJVTBL_BOOL
        bool        DisplayNonBossDebuffs;                ///< Offset 0x0090 Type _MJVTBL_BOOL
        bool        DynamicPosition;                      ///< Offset 0x0091 Type _MJVTBL_BOOL
        uint8       TopPoint;                             ///< Offset 0x0092 Type _MJVTBL_UINT8
        uint8       BottomPoint;                          ///< Offset 0x0093 Type _MJVTBL_UINT8
        uint8       LeftPoint;                            ///< Offset 0x0094 Type _MJVTBL_UINT8
        uint16      TopOffset;                            ///< Offset 0x0096 Type _MJVTBL_UINT16
        uint16      BottomOffset;                         ///< Offset 0x0098 Type _MJVTBL_UINT16
        uint16      LeftOffset;                           ///< Offset 0x009A Type _MJVTBL_UINT16
        bool        Locked;                               ///< Offset 0x009C Type _MJVTBL_BOOL
        bool        Shown;                                ///< Offset 0x009D Type _MJVTBL_BOOL
        bool        AutoActivate2Players;                 ///< Offset 0x009E Type _MJVTBL_BOOL
        bool        AutoActivate3Players;                 ///< Offset 0x009F Type _MJVTBL_BOOL
        bool        AutoActivate5Players;                 ///< Offset 0x00A0 Type _MJVTBL_BOOL
        bool        AutoActivate10Players;                ///< Offset 0x00A1 Type _MJVTBL_BOOL
        bool        AutoActivate15Players;                ///< Offset 0x00A2 Type _MJVTBL_BOOL
        bool        AutoActivate25Players;                ///< Offset 0x00A3 Type _MJVTBL_BOOL
        bool        AutoActivate40Players;                ///< Offset 0x00A4 Type _MJVTBL_BOOL
        bool        AutoActivateSpec1;                    ///< Offset 0x00A5 Type _MJVTBL_BOOL
        bool        AutoActivateSpec2;                    ///< Offset 0x00A6 Type _MJVTBL_BOOL
        bool        AutoActivatePvP;                      ///< Offset 0x00A7 Type _MJVTBL_BOOL
        bool        AutoActivatePvE;                      ///< Offset 0x00A8 Type _MJVTBL_BOOL
    };

    ByteBuffer& operator<<(ByteBuffer& p_Data, JamCliCUFProfile const& p_Profile);
}