////////////////////////////////////////////////////////////////////////////////
//
// Project-Hellscream https://hellscream.org
// Copyright (C) 2018-2020 Project-Hellscream-6.2
// Discord https://discord.gg/CWCF3C9
//
////////////////////////////////////////////////////////////////////////////////

#ifndef __TRINITY_VEHICLEDEFINES_H
#define __TRINITY_VEHICLEDEFINES_H

#include "Define.h"
#include "Common.h"

struct VehicleSeatEntry;

enum PowerType
{
};

enum VehicleFlags
{
    VEHICLE_FLAG_NO_STRAFE                       = 0x00000001,           // Sets MOVEFLAG2_NO_STRAFE
    VEHICLE_FLAG_NO_JUMPING                      = 0x00000002,           // Sets MOVEFLAG2_NO_JUMPING
    VEHICLE_FLAG_FULLSPEEDTURNING                = 0x00000004,           // Sets MOVEFLAG2_FULLSPEEDTURNING
    VEHICLE_FLAG_UNK1                            = 0x00000008,
    VEHICLE_FLAG_ALLOW_PITCHING                  = 0x00000010,           // Sets MOVEFLAG2_ALLOW_PITCHING
    VEHICLE_FLAG_FULLSPEEDPITCHING               = 0x00000020,           // Sets MOVEFLAG2_FULLSPEEDPITCHING
    VEHICLE_FLAG_CUSTOM_PITCH                    = 0x00000040,           // If set use pitchMin and pitchMax from DBC, otherwise pitchMin = -pi/2, pitchMax = pi/2
    VEHICLE_FLAG_UNK2                            = 0x00000080,
    VEHICLE_FLAG_UNK3                            = 0x00000100,
    VEHICLE_FLAG_UNK4                            = 0x00000200,           // Vehicle is accessory?
    VEHICLE_FLAG_ADJUST_AIM_ANGLE                = 0x00000400,           // Lua_IsVehicleAimAngleAdjustable
    VEHICLE_FLAG_ADJUST_AIM_POWER                = 0x00000800,           // Lua_IsVehicleAimPowerAdjustable
    VEHICLE_FLAG_UNK5                            = 0x00001000,
    VEHICLE_FLAG_UNK6                            = 0x00002000,
    VEHICLE_FLAG_UNK7                            = 0x00004000,
    VEHICLE_FLAG_UNK8                            = 0x00008000,
    VEHICLE_FLAG_UNK9                            = 0x00010000,
    VEHICLE_FLAG_UNK10                           = 0x00020000,
    VEHICLE_FLAG_UNK11                           = 0x00040000,
    VEHICLE_FLAG_UNK12                           = 0x00080000,
    VEHICLE_FLAG_UNK13                           = 0x00100000,
    VEHICLE_FLAG_UNK14                           = 0x00200000,
    VEHICLE_FLAG_DISABLE_SWITCH                  = 0x00400000,            // Can't change seats, VEHICLE_ID = 335 chopper https://github.com/mangosthree/server/commit/f890eef81a7d66826dba41864e17ed287f7084ac
    VEHICLE_FLAG_UNK15                           = 0x00800000,
    VEHICLE_FLAG_UNK16                           = 0x01000000,
    VEHICLE_FLAG_UNK17                           = 0x02000000,
    VEHICLE_FLAG_UNK18                           = 0x04000000,
    VEHICLE_FLAG_UNK19                           = 0x08000000,
    VEHICLE_FLAG_BATTLEFIELD_ICON                = 0x10000000,
    VEHICLE_FLAG_UNK21                           = 0x20000000,
    VEHICLE_FLAG_UNK22                           = 0x40000000,
    VEHICLE_FLAG_UNK23                           = 0x80000000,
};

enum VehicleSpells
{
    VEHICLE_SPELL_RIDE_HARDCODED                 = 46598,
    VEHICLE_SPELL_PARACHUTE                      = 45472
};

struct VehicleSeat
{
    explicit VehicleSeat(VehicleSeatEntry const* seatInfo) : SeatInfo(seatInfo), Passenger(0) {}
    VehicleSeatEntry const* SeatInfo;
    uint64 Passenger;
};

struct VehicleAccessory
{
    VehicleAccessory(uint32 entry, int8 seatId, bool isMinion, uint8 summonType, uint32 summonTime) :
        AccessoryEntry(entry), IsMinion(isMinion), SummonTime(summonTime), SeatId(seatId), SummonedType(summonType) {}
    uint32 AccessoryEntry;
    uint32 IsMinion;
    uint32 SummonTime;
    int8 SeatId;
    uint8 SummonedType;
};

typedef std::vector<VehicleAccessory> VehicleAccessoryList;
typedef std::map<uint32, VehicleAccessoryList> VehicleAccessoryContainer;
typedef std::map<int8, VehicleSeat> SeatMap;

class TransportBase
{
    public:
        /// This method transforms supplied transport offsets into global coordinates
        virtual void CalculatePassengerPosition(float& x, float& y, float& z, float& o) = 0;

        /// This method transforms supplied global coordinates into local offsets
        virtual void CalculatePassengerOffset(float& x, float& y, float& z, float& o) = 0;
};
#endif
