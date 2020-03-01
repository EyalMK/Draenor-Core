////////////////////////////////////////////////////////////////////////////////
//
// Project-Hellscream https://hellscream.org
// Copyright (C) 2018-2020 Project-Hellscream-6.2
// Discord https://discord.gg/CWCF3C9
//
////////////////////////////////////////////////////////////////////////////////

#ifndef __SIGNAL_HANDLER_H__
#define __SIGNAL_HANDLER_H__

#include <ace/Event_Handler.h>

namespace JadeCore
{

/// Handle termination signals
class SignalHandler : public ACE_Event_Handler
{
    public:
        int handle_signal(int SigNum, siginfo_t* = NULL, ucontext_t* = NULL)
        {
            HandleSignal(SigNum);
            return 0;
        }
        virtual void HandleSignal(int /*SigNum*/) {};
};

}

#endif /* __SIGNAL_HANDLER_H__ */
