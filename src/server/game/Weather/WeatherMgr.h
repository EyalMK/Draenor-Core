////////////////////////////////////////////////////////////////////////////////
//
// Project-Hellscream https://hellscream.org
// Copyright (C) 2018-2020 Project-Hellscream-6.2
// Discord https://discord.gg/CWCF3C9
//
////////////////////////////////////////////////////////////////////////////////

/// \addtogroup world
/// @{
/// \file

#ifndef __WEATHERMGR_H
#define __WEATHERMGR_H

#include "Define.h"

class Weather;
class Player;

namespace WeatherMgr
{
    void LoadWeatherData();

    Weather* FindWeather(uint32 id);
    Weather* AddWeather(uint32 zone_id);
    void RemoveWeather(uint32 zone_id);

    void SendFineWeatherUpdateToPlayer(Player* player);

    void Update(uint32 diff);
}

#endif
