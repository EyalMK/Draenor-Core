////////////////////////////////////////////////////////////////////////////////
//
// Project-Hellscream https://hellscream.org
// Copyright (C) 2018-2020 Project-Hellscream-6.2
// Discord https://discord.gg/CWCF3C9
//
////////////////////////////////////////////////////////////////////////////////
#pragma once
#ifndef SCRIPTING_INTERFACES_SPELL_HPP_INCLUDED
#define SCRIPTING_INTERFACES_SPELL_HPP_INCLUDED

#include "InterfaceBase.hpp"

/// Spell script interface
class SpellScriptLoader : public ScriptObjectImpl<true>
{
    protected:
        /// Constructor
        /// @p_Name : Script name
        SpellScriptLoader(const char * p_Name);

    public:
        /// Should return a fully valid SpellScript pointer.
        virtual SpellScript* GetSpellScript() const
        {
            return nullptr;
        }
        /// Should return a fully valid AuraScript pointer.
        virtual AuraScript* GetAuraScript() const
        {
            return nullptr;
        }

};

#endif  ///< SCRIPTING_INTERFACES_SPELL_HPP_INCLUDED
