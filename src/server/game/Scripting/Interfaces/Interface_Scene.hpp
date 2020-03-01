////////////////////////////////////////////////////////////////////////////////
//
// Project-Hellscream https://hellscream.org
// Copyright (C) 2018-2020 Project-Hellscream-6.2
// Discord https://discord.gg/CWCF3C9
//
////////////////////////////////////////////////////////////////////////////////

#ifndef SCRIPTING_INTERFACES_SCENE_HPP_INCLUDED
#define SCRIPTING_INTERFACES_SCENE_HPP_INCLUDED

#include "InterfaceBase.hpp"

/// Guild Script Interface
class SceneScript : public ScriptObjectImpl<false>
{
	protected:
		/// Constructor
		/// @p_Name : Script name
		SceneScript(const char * p_Name);

	public:
		/// Called when a player starts a scene
	   /// @p_Player          : Player instance
	   /// @p_SceneInstanceID : Standalone scene instance ID
		virtual void OnSceneStart(Player* p_Player, uint32 p_SceneInstanceID)
		{
			UNUSED(p_Player);
			UNUSED(p_SceneInstanceID);
		}

		/// Called when a player receive a scene triggered event
		/// @p_Player          : Player instance
		/// @p_SceneInstanceID : Standalone scene instance ID
		/// @p_Event           : Event string received from client
		virtual void OnSceneTriggerEvent(Player* p_Player, uint32 p_SceneInstanceID, std::string p_Event)
		{
			UNUSED(p_Player);
			UNUSED(p_SceneInstanceID);
			UNUSED(p_Event);
		}

		/// Called when a player cancels some scene
		/// @p_Player          : Player instance
		/// @p_SceneInstanceID : Standalone scene instance ID
		virtual void OnSceneCancel(Player* p_Player, uint32 p_SceneInstanceID)
		{
			UNUSED(p_Player);
			UNUSED(p_SceneInstanceID);
		}

		/// Called when a player completes a scene
		/// @p_Player          : Player instance
		/// @p_SceneInstanceID : Standalone scene instance ID
		virtual void OnSceneComplete(Player* p_Player, uint32 p_SceneInstanceID)
		{
			UNUSED(p_Player);
			UNUSED(p_SceneInstanceID);
		}

		/// Called when a scene is either cancelled or completed
		/// @p_Player          : Player instance
		/// @p_SceneInstanceID : Standalone scene instance ID
		virtual void OnSceneEnd(Player* p_Player, uint32 p_SceneInstanceID)
		{
			UNUSED(p_Player);
			UNUSED(p_SceneInstanceID);
		}
};

#endif  ///< SCRIPTING_INTERFACES_SCENE_HPP_INCLUDED
