////////////////////////////////////////////////////////////////////////////////
//
// Project-Hellscream https://hellscream.org
// Copyright (C) 2018-2020 Project-Hellscream-6.2
// Discord https://discord.gg/CWCF3C9
//
////////////////////////////////////////////////////////////////////////////////

#pragma once

#ifndef SCRIPTING_INTERFACES_ENCOUNTER_HPP_INCLUDED
 #define SCRIPTING_INTERFACES_ENCOUNTER_HPP_INCLUDED

 #include "InterfaceBase.hpp"

/// Encounter Script Interface
class EncounterScript : public ScriptObjectImpl<false>
{
    protected:
        /// Constructor
        EncounterScript(char const* p_Name);

    public:
        /// Called when an Encounter is ended
        virtual void OnEncounterEnd(EncounterDatas const* p_EncounterDatas)
        {
            UNUSED(p_EncounterDatas);
        }
};

#endif  ///< SCRIPTING_INTERFACES_ENCOUNTER_HPP_INCLUDED
