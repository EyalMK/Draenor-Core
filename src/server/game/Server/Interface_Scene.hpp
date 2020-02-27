////////////////////////////////////////////////////////////////////////////////
//
//  MILLENIUM-STUDIO
//  Copyright 2016 Millenium-studio SARL
//  All Rights Reserved.
//
////////////////////////////////////////////////////////////////////////////////
#pragma once
#ifndef SCRIPTING_INTERFACES_SCENE_HPP_INCLUDED
#define SCRIPTING_INTERFACES_SCENE_HPP_INCLUDED

#include "InterfaceBase.hpp"

/// Guild Script Interface
class GuildScript : public ScriptObjectImpl<false>
{
protected:
	/// Constructor
	/// @p_Name : Script name
	GuildScript(const char * p_Name);

public:


};

#endif  ///< SCRIPTING_INTERFACES_SCENE_HPP_INCLUDED
