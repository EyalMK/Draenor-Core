////////////////////////////////////////////////////////////////////////////////
//
// Project-Hellscream https://hellscream.org
// Copyright (C) 2018-2020 Project-Hellscream-6.2
// Discord https://discord.gg/CWCF3C9
//
////////////////////////////////////////////////////////////////////////////////

#ifndef APPENDERDB_H
#define APPENDERDB_H

#include "Appender.h"

class AppenderDB: public Appender
{
    public:
        AppenderDB(uint8 _id, std::string const& _name, LogLevel level, uint8 realmId);
        ~AppenderDB();
        void setEnable(bool enable);

    private:
        uint8 realm;
        bool enable;
        void _write(LogMessage& message);
};

#endif
