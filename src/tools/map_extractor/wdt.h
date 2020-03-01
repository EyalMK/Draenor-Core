////////////////////////////////////////////////////////////////////////////////
//
// Project-Hellscream https://hellscream.org
// Copyright (C) 2018-2020 Project-Hellscream-6.2
// Discord https://discord.gg/CWCF3C9
//
////////////////////////////////////////////////////////////////////////////////

#ifndef WDT_H
#define WDT_H
#include "loadlib.h"

//**************************************************************************************
// WDT file class and structures
//**************************************************************************************
#define WDT_MAP_SIZE 64

#pragma pack(push, 1)


class wdt_MAIN
{
    union
    {
        uint32 fcc;
        char   fcc_txt[4];
    };
public:
    uint32 size;

    struct adtData
    {
        uint32 flag;
        uint32 data1;
    } adt_list[64][64];
};

#pragma pack(pop)

#endif
