////////////////////////////////////////////////////////////////////////////////
//
// Project-Hellscream https://hellscream.org
// Copyright (C) 2018-2020 Project-Hellscream-6.2
// Discord https://discord.gg/CWCF3C9
//
////////////////////////////////////////////////////////////////////////////////

#include "LogOperation.h"
#include "Logger.h"

LogOperation::~LogOperation()
{
    delete msg;
}

int LogOperation::call()
{
    if (logger && msg)
        logger->write(*msg);
    return 0;
}
