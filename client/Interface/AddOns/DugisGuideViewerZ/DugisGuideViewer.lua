--[[ 
===============================================================
Dugi Guides Addon License Agreement

Copyright (c) 2010-2015 Dugi Guides LTD
All rights reserved.

File Source: http://www.ultimatewowguide.com 
Author Name: Fransisco Brevoort
Email: support@ultimatewowguide.com

The contents of this addon, excluding third-party resources, are
copyrighted to its author with all rights reserved, under United
States copyright law and various international treaties.

In particular, please note that you may not distribute this addon in
any form, with or without modifications, including as part of a
compilation, without prior written permission from its author.

The author of this addon hereby grants you the following rights:

1. You may use this addon for private use only.

2. You may make modifications to this addon for private use only.

All rights not explicitly addressed in this license are reserved by
the copyright holder.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
  "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
  A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
  THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
]]


--Preserving original functions from being overridden
GetMapOverlayInfo_original = GetMapOverlayInfo
GetNumMapOverlays_original = GetNumMapOverlays

--DugisCharacterCache initialization
if not DugisCharacterCache then
    DugisCharacterCache = {}
end

local _
DugisGuideViewer = {
	events = {},
	globalHandlers = {},
	eventFrame = CreateFrame("Frame"),
	RegisterEvent = function(self, event, method)
		self.eventFrame:RegisterEvent(event)
		if self.events[event] then
			local existingRegistration = self.events[event]
			if type(existingRegistration)~="table" then
				if existingRegistration==method then return end
				self.events[event] = self.GetCreateTable(existingRegistration, method or event)
			else
				for _,exItem in existingRegistration:IPairs() do
					if exItem==method then return end
				end
				existingRegistration:Insert(method or event)
			end
		else
			self.events[event] = method or event
		end
	end,
	UnregisterEvent = function(self, event, method)
		local existingRegistration = self.events[event]
		if existingRegistration and type(existingRegistration)=="table" then
			assert(#existingRegistration>1)
			method = method or event
			existingRegistration:RemoveFirst(method)
			if #existingRegistration==1 then
				self.events[event] = existingRegistration[1]
				existingRegistration:Pool()
			end
			return
		end
		self.eventFrame:UnregisterEvent(event)
		self.events[event] = nil
	end,
	version = GetAddOnMetadata("DugisGuideViewer", "Version"),
	RegisterGlobalEventHandler = function(self, method)
		self.globalHandlers[method] = true
	end,
	UnregisterGlobalEventHandler = function(self, method)
		self.globalHandlers[method] = nil
	end,
}
local DugisGuideViewer = DugisGuideViewer

local savablePositionsFrameNames = {
     "DugisMainBorder"
    ,"DugisRecordFrame"
    --,"DugisSecureQuestButton"
    -- ,"DugisGuideViewerActionItemFrame"
    ,"DugisArrowFrame"
    ,"DugisGuideViewer_TargetFrame"
	,"DugisWatchBackground"
	,"DugisSmallFrameContainer"
	,"ObjectiveTrackerFrameHandlerFrame"
	,"DugisGuideViewer_ModelViewer"
	,"DugisOnOffButton"
}

DugisGuideViewer.eventFrame:SetScript("OnEvent", function(self, event, ...)
	local entry = DugisGuideViewer.events[event]
	--if DugisGuideViewer.DebugFormat then DugisGuideViewer:DebugFormat("OnEvent", "event", event) end
	if type(entry)=="table" then
		for _,method in entry:IPairs() do
			if method and DugisGuideViewer[method] then
				DugisGuideViewer[method](DugisGuideViewer, event, ...)
			end
		end
	else
		if entry and DugisGuideViewer[entry] then
			DugisGuideViewer[entry](DugisGuideViewer, event, ...)
		end
	end
	for method in pairs(DugisGuideViewer.globalHandlers) do

		method(event, ...)
	end
end)

DugisGuideViewer:RegisterEvent("ADDON_LOADED")

DugisGuideUser = {
	QuestState = {}, --Tristate either skipped (x), finished (check) or neither (empty)
	turnedinquests = {},
	toskip = {},
	Debug = {},
}

local FirstTime = 1
local L = DugisLocals

if GetLocale() == "enUS" then
	DugisGuideViewer.Localize = 0
else
	DugisGuideViewer.Localize = 1
	
end

--local LastGuideNumRows = 0
local Debug = 0 --Print Debug Messages
local Localize = 0	--Print Localization Error messages
local SettingsRevision = 8

DugisGuideViewer.Debug = Debug and Debug>0 and 1 or nil
DugisGuideViewer.ARTWORK_PATH = "Interface\\AddOns\\DugisGuideViewerZ\\Artwork\\"
DugisGuideViewer.BACKGRND_PATH = "Interface\\DialogFrame\\UI-DialogBox-Background"
DugisGuideViewer.EDGE_PATH = "Interface\\DialogFrame\\UI-DialogBox-Border"

BINDING_HEADER_DUGI = "Dugi Guides"
_G["BINDING_NAME_CLICK DugisGuideViewer_TargetFrame:RightButton"] = L["Target Button"]
_G["BINDING_NAME_CLICK DugisSecureQuestButton:LeftButton"] = L["Floating Item Button"]

local function LocalizePrint(message)
	if Localize == 1 then
		print(message)
	end
end
DugisGuideViewer.LocalizePrint = LocalizePrint

local function DebugPrint(message)
	if Debug == 1 then
		print(message)
	end
end
DugisGuideViewer.DebugPrint = DebugPrint

local function LoadSettings()
	local self = DugisGuideViewer
	--Settings Page Checkboxes
	DGV_QUESTLEVELON = 1
	DGV_LOCKSMALLFRAME = 2
	DGV_LOCKLARGEFRAME = 3
	DGV_WAYPOINTSON = 4
	DGV_ITEMBUTTONON = 5
	DGV_ENABLEQW = 6
	DGV_DUGIARROW = 7
	DGV_SHOWCORPSEARROW = 8
	DGV_CLASSICARROW = 9
	DGV_CARBONITEARROW = 10
	DGV_TOMTOMARROW = 11
	DGV_SHOWANTS = 12
	DGV_AUTOQUESTACCEPT = 13
	DGV_DISPLAYCOORDINATES = 14
	DGV_AUTOQUESTACCEPTALL = 15
	DGV_AUTOSELL = 16
	DGV_REMOVEMAPFOG = 17
	DGV_SMALLFRAMEBORDER = 18
	DGV_TARGETBUTTON = 19
	DGV_TARGETBUTTONSHOW = 20
	DGV_SHOWONOFF = 21
	DGV_STICKYFRAME = 22
    DGV_STICKYFRAMESHOWDESCRIPTIONS = 23
	--DGV_AUTOSTICK = 25
	DGV_DISPLAYMAPCOORDINATES = 24
	DGV_ENABLEMODELDB = 25
	DGV_ENABLENPCNAMEDB = 26
	DGV_ENABLEQUESTLEVELDB = 27
	DGV_ANCHOREDSMALLFRAME = 28
	DGV_QUESTCOLORON = 29
	DGV_MAPPREVIEWHIDEBORDER = 30
	DGV_UNLOADMODULES = 31
	DGV_FIXEDWIDTHSMALL = 32
	DGV_MOVEWATCHFRAME = 33
	DGV_WATCHFRAMEBORDER = 34
	DGV_WORLDMAPTRACKING = 35
	DGV_AUTOQUESTTURNIN = 36
	DGV_ACCOUNTWIDEACH = 37
	DGV_EMBEDDEDTOOLTIP = 38
	DGV_OBJECTIVECOUNTER = 39
	DGV_MULTISTEPMODE = 40
	DGV_FIXEDWIDEFRAME = 41
	DGV_AUTOEQUIPSMARTSET = 42
	DGV_SHOWAUTOEQUIPPROMPT = 43
	DGV_DISABLEWATCHFRAMEMOD = 44	
	DGV_AUTOREPAIR = 45
	DGV_AUTOREPAIRGUILD = 46
	DGV_HIGHLIGHTSTEPONENTER = 47
	DGV_MANUALWAYPOINT = 48
	DGV_TOMTOMEMULATION = 49
	DGV_LOCKMODELFRAME = 50
	DGV_JOURNALFRAME = 51
	DGV_JOURNALFRAMEBUTTONSTICKED = 52
	DGV_GUIDESUGGESTMODE = 53	
	DGV_FISHINGPOLE = 54
	DGV_COOKINGITEM = 55
	DGV_WATCHLOCALQUEST = 56
    DGV_AUTOFLIGHTPATHSELECT = 57
	DGV_TARGETTOOLTIP = 58
	DGV_USETAXISYSTEM = 59
	DGV_SHOWQUESTABANDONBUTTON = 60
	DGV_SUGGESTTRINKET = 61	
	DGV_DISPLAYALLSTATS = 62	
	DGV_DISPLAYGUIDESPROGRESS = 63	
	DGV_DISPLAYGUIDESPROGRESSTEXT = 64	
	DGV_AUTOQUESTITEMLOOT = 65
	DGV_DISPLAYUNCOLLECTEDPETSONLY = 66
	DGV_DAILYITEM = 67
	DGV_BLINKMINIMAPICONS = 68
    DGV_ENABLEDGEARFINDER = 69
	DGV_INCLUDE_DUNG_NORMAL = 70
	DGV_INCLUDE_DUNG_HEROIC = 71
	DGV_INCLUDE_DUNG_MYTHIC = 72
	DGV_INCLUDE_DUNG_TIMEWALKING = 73
    
	DGV_INCLUDE_RAIDS_RAIDFINDER = 74
	DGV_INCLUDE_RAIDS_NORMAL = 75
	DGV_INCLUDE_RAIDS_HEROIC = 76
	DGV_INCLUDE_RAIDS_MYTHIC = 77
    
    DGV_GEARS_FROM_QUEST_GUIDES = 78
    

    
	--Sliders
	DGV_MINIBLOBQUALITY = 200
	DGV_SHOWTOOLTIP = 201
	DGV_RECORDSIZE = 202
	DGV_MAPPREVIEWDURATION = 203
	DGV_SMALLFRAMEFONTSIZE = 204
	DGV_TARGETBUTTONSCALE = 205
	DGV_ITEMBUTTONSCALE = 206
	DGV_JOURNALFRAMEBUTTONSCALE = 207
	
	--Dropdowns
	DGV_GUIDEDIFFICULTY = 100
	DGV_SMALLFRAMETRANSITION = 101
	DGV_LARGEFRAMEBORDER = 102
	DGV_STEPCOMPLETESOUND = 103
	DGV_ANTCOLOR = 104
	DGV_TAXIFLIGHTMASTERS = 109
	DGV_GASTATCAPLEVELDIFFERENCE = 111
	DGV_SMALLFRAMEDOCKING = 112
	DGV_WEAPONPREF = 113
		
	--DGV_MINIBLOBS = 104
	DGV_TOOLTIPANCHOR = 105
	DGV_MAPPREVIEWPOIS = 106
	DGV_QUESTCOMPLETESOUND = 107
	DGV_DISPLAYPRESET = 108
	DGV_GASMARTSETTARGET = 110
	
	--Custom
	DGV_TARGETBUTTONCUSTOM = 300
	DGV_PROFILECUSTOM = 301
	DGV_GAWINCRITERIACUSTOM = 302

	local defaults = {
		profile = {
			char = {
				settings = {
					QuestRecordTable = {},
                    framePositions = {},
					QuestRecordEnabled = true,
					ModelViewer = {	pos_x = 300, pos_y = 45, relativePoint="CENTER"},
					StickyFrame = {	pos_x = 485, pos_y = 130, relativePoint="CENTER"},
					FirstTime = true,
					EssentialsMode = 0,
					SettingsRevision = 0,
					WatchFrameSnapped = true,
					GuideOn = true,
					sz = 78, --Num check boxes
					[DGV_QUESTLEVELON]			= { category = "Other",	text = "Display Quest Level", 	checked = false,	tooltip = "Show the quest level on the large and small frames", module = "Guides"},
					[DGV_QUESTCOLORON] 		= { category = "Other",	text = "Color Code Quest", 	checked = true,		tooltip = "Color code quest against your character's level", module = "Guides"},
					[DGV_LOCKSMALLFRAME] 		= { category = "Frames",	text = "Lock Small Frame", 	checked = false,	tooltip = "Lock small frame into place", module = "SmallFrame"},
					[DGV_MOVEWATCHFRAME] 		= { category = "Frames",	text = "Move Objective Tracker", showOnRightColumn = true, checked = false,	tooltip = "Allow movement of the watch frame, not available if other incompatible addons are loaded.", module = "DugisWatchFrame"},
					[DGV_ANCHOREDSMALLFRAME] 	= { category = "Display",	text = "Anchored Small Frame", 	checked = true,	tooltip = "Allow a fixed Anchored Small Frame that will integrate with the Objective Tracker", module = "SmallFrame"},
					[DGV_LOCKLARGEFRAME] 		= { category = "Frames",	text = "Lock Large Frame", 	checked = false,	tooltip = "Lock large frame into place", module = "Guides"},
					[DGV_WAYPOINTSON]			= { category = "Waypoints",	text = "Automatic Waypoints", 	checked = true,		tooltip = "Automatically map waypoints from the Small Frame or from the Objective Tracker in essential mode",},
					[DGV_ITEMBUTTONON] 		= { category = "Questing",	text = "Floating Item Button",		checked = true,		tooltip = "Shows a small window to click when an item is needed for a quest",},
					[DGV_ENABLEQW] 			= { category = "Display",	text = "Automatic Quest Matching", checked = false,		tooltip = "Disable Blizzard's Automatic Quest Tracking feature and use Dugi Automatic Quest Matching feature which will sync your Objective tracker with the current guide", },
					[DGV_DUGIARROW]			= { category = "Waypoints",	text = "Show Dugi Arrow",	checked = true,		tooltip = "Show Dugis waypoint arrow",},
					[DGV_SHOWCORPSEARROW]		= { category = "Waypoints",	text = "Show Corpse Arrow",	checked = true,		tooltip = "Show the corpse arrow to direct you to your body", indent = true},
					[DGV_CLASSICARROW]			= { category = "Waypoints",	text = "Classic Arrow",		checked = true,		tooltip = "Switch between modern and classic arrow icons", indent = true,},
					[DGV_CARBONITEARROW] 		= { category = "Waypoints",	text = "Use Carbonite Arrow",	checked = true,	tooltip = "Use the Carbonite arrow instead of the built in arrow"},
					[DGV_TOMTOMARROW] 		= { category = "Waypoints",	text = "Use TomTom Arrow", 	checked = false,	tooltip = "Use the TomTom arrow instead of the built in arrow"},
					[DGV_SHOWANTS] 			= { category = "Waypoints",	text = "Show Ant Trail",	checked = true,		tooltip = "Display ant trail between waypoints on the world map",},
					[DGV_AUTOQUESTACCEPT] 		= { category = "Questing",	text = "Auto Quest Accept",	checked = false,	tooltip = "Automatically accept quests from NPCs. Disable with shift",},
					[DGV_AUTOQUESTACCEPTALL]	= { category = "Questing",	text = "Only Quests in Current Guide",	checked = true,	tooltip = "Auto quest accept feature will only accept quests in current guide", indent = true, module = "Guides"},							
					[DGV_AUTOQUESTTURNIN]	= { category = "Questing",	text = "Auto Quest Turn in",	checked = false,	tooltip = "Automatically turn in quests from NPCs. Disable with shift"},							
					[DGV_AUTOSELL]         		= { category = "Other",		text = "Auto Sell Greys",    	checked = true,    	tooltip = "Automatically sell grey quality items to merchant NPCs",},
					[DGV_AUTOREPAIR]			= { category = "Other",		text = "Auto Repair",    		checked = false,    tooltip = "Automatically repair all damaged equipment at repair NPC",},
					[DGV_AUTOFLIGHTPATHSELECT]			= { category = "Waypoints",	showOnRightColumn = true,	text = "Auto Select Flight Path",	checked = false,	tooltip = "Automatically select the suggested flight path after opening the flightmaster map",},
					[DGV_USETAXISYSTEM]			= { category = "Waypoints",	showOnRightColumn = true,	text = "Use Taxi System",	checked = true,	tooltip = "Taxi system will find the fastest route to get to your destination with the use of portals, teleports, vehicles etc. Disabling this option will give you a direct waypoint instead.",},
					[DGV_AUTOREPAIRGUILD]		= { category = "Other",		text = "Use Guild Bank",    	checked = false,   	tooltip = "Use guild funds when repairing automatically", indent=true,},
					[DGV_GUIDESUGGESTMODE] 		= { category = "Questing",	text = "Guide Suggest Mode",	checked = true,		tooltip = "Suggest guides for your player on level up", module = "Guides"},
					[DGV_SMALLFRAMEBORDER] 		= { category = "Borders",	text = "Small Frame Border",	checked = true,		tooltip = "Use the same border that is selected for the large frame", module = "SmallFrame"},
					[DGV_WATCHFRAMEBORDER] 		= { category = "Borders",	text = "Objective Tracker Frame Border",	checked = true,		tooltip = "Add a border for the Objective Tracker Frame", module = "DugisWatchFrame"},
					[DGV_REMOVEMAPFOG]     		= { category = "Maps",		text = "Remove Map Fog",  	checked = true,    	tooltip = "View undiscovered areas of the world map, type /reload in your chat box after change of settings",},
					[DGV_HIGHLIGHTSTEPONENTER]	= { category = "Tooltip",	text = "Highlight Guide Steps",	checked = true,	tooltip = "Guide step text color intensifies when moused over", module = "SmallFrame"},
					[DGV_DISPLAYCOORDINATES]	= { category = "Tooltip",	text = "Tooltip Coordinates",	checked = false,	tooltip = "Show destination coordinates in the status frame tooltip", module = "Guides"},
					[DGV_TARGETBUTTON] 		= { category = "Target",	text = "Target Button",		checked = true,		tooltip = "Target the NPC needed for the quest step", module = "Target"},
					[DGV_TARGETBUTTONSHOW]		= { category = "Target",	text = "Show Target Button",	checked = true,		tooltip = "Show target button frame", indent = "true", module = "Target"},
					[DGV_SHOWONOFF]			= { category = "Frames",	text = "Show DG Icon Button",	checked = true,		tooltip = "Show the On/Off button which enables or disables the guide", },
					[DGV_STICKYFRAME]			= { category = "Frames",	text = "Enable Sticky Frame",	checked = true,		tooltip = "Shift click a quest step to track in the frame", module = "StickyFrame" },
                    [DGV_STICKYFRAMESHOWDESCRIPTIONS]			= { category = "Frames",	text = "Sticky Frame Step Description",	checked = true,		tooltip = "Show step descriptions in the Sticky Frame", module = "StickyFrame" },
					--[DGV_AUTOSTICK] 		= { category = "Other",		text = "Auto Stick", 		checked = true,		tooltip = "This feature will automatically add 'as you go...' step into sticky frame",},
					[DGV_DISPLAYMAPCOORDINATES] 	= { category = "Maps",		text = "Map Coordinates",  	checked = true,    	tooltip = "Show Player and Mouse coordinates at the bottom of the map.",},
					[DGV_WORLDMAPTRACKING] 		= { category = "Maps",		text = "World Map Tracking",  	checked = true,    	tooltip = "Add minimap tracking icons on the world map.",},
					[DGV_DISPLAYUNCOLLECTEDPETSONLY] 		= { category = "Maps",		text = "Hide Collected Pets",  	checked = true,    	tooltip = "Hide collected pets in world map tracking with Extra Tracking Module", module = "Guides"},
					[DGV_BLINKMINIMAPICONS] 		= { category = "Maps",		text = "Blink Minimap Resource Nodes",  	checked = false,    	tooltip = "Resource nodes for gathering profession will blink in your minimap to make it easier to notice"},
					[DGV_ENABLEMODELDB]		= { category = "Hide",	text = "Model Database",	checked = true,		tooltip = "Allows model viewer to function", module = "NpcsF"},
					[DGV_ENABLENPCNAMEDB]		= { category = "Memory",	text = "NPC Name Database",	checked = true,		tooltip = "Provides localized NPC names. Required for target button.", module = "Disabled"},
					[DGV_ENABLEQUESTLEVELDB]		= { category = "Memory",	text = "Quest Level Database",	checked = true,		tooltip = "Shows minimum level required for quests.\n\nAlso used for color coding the quests.", module = "ReqLevel"},
					[DGV_UNLOADMODULES]		= { category = "Memory",	text = "Unload Modules",	checked = false,	tooltip = "Unloading modules will allow the addon to run on low memory setting in Essential Mode but will require a UI reload to return back to normal. ", module = "Guides"},
					[DGV_MAPPREVIEWHIDEBORDER]	= { category = "Map Preview",	text = "Hide Border",		checked = true,		tooltip = "Hides the minimized map border when map preview is on.",},
					[DGV_AUTOQUESTITEMLOOT]	= { category = "Questing",	text = "Auto Quest Item Loot",	checked = true,		tooltip = "Automatically loot quest items.",},
					[DGV_ACCOUNTWIDEACH]		= { category = "Other",text = "Account Wide Achievement",	checked = true,		tooltip = "Detects account wide achievements completion.", module = "Guides"},
					[DGV_EMBEDDEDTOOLTIP]		= { category = "Display",	text = "Embedded Tooltip",	checked = true,	tooltip = "Displays tooltip information under guide step", module = "Guides"},
					[DGV_FIXEDWIDTHSMALL]		= { category = "Display",	text = "Fixed Width Small Frame",	checked = true,	tooltip = "Floating Small Frame won't adjust size horizontally and remain the same width as the Objective Tracker.", module = "Guides"},
					[DGV_OBJECTIVECOUNTER]		= { category = "Display",	text = "Show Quest Objectives",	checked = true,		tooltip = "Display quest objectives in small/anchored frame instead of the watch frame", module = "Guides"},
					[DGV_MULTISTEPMODE]		= { category = "Display",	text = "Multi-step Mode",	checked = true,	tooltip = "Allow status frame to show all currently relevant quests.", module = "Guides"},
					[DGV_FIXEDWIDEFRAME]		= { category = "Display",	text = "Wider Objective Tracker",	checked = false,	tooltip = "Increases the width of the Objective tracker", module = "Hide"},
					[DGV_AUTOEQUIPSMARTSET]		= { category = "Gear Set",		text = "Auto Equip Smart Set",	checked = true,		tooltip = "Automatically maintain the best item for each slot as player level, active spec and inventory changes occur.", module = "GearAdvisor"},
					[DGV_SHOWAUTOEQUIPPROMPT]	= { category = "Gear Set",		text = "Show Auto Equip Prompt",checked = true,		tooltip = "Display a prompt to verify before committing auto equip changes", module = "GearAdvisor"},
					[DGV_DISABLEWATCHFRAMEMOD]	= { category = "Frames",		text = "Lock Objective Tracker", showOnRightColumn = true, indent = true, checked = true,		tooltip = "Lock the objective tracker frame.", module = "DugisWatchFrame"},
					[DGV_MANUALWAYPOINT]		= { category = "Waypoints",		text = "Manual Waypoints",checked = true,		tooltip = "Enable user placed waypoints on the world map by pressing Ctrl + Right click or Shift + Right click to link them together, disable this option if the hotkey conflict with another addon",},
					[DGV_TOMTOMEMULATION]		= { category = "Waypoints",		text = "TomTom Addon Emulation",checked = true,		tooltip = "Enable /way commands and compatibility with other addons that use TomTom addon (eg LightHeaded)",},					
					[DGV_LOCKMODELFRAME]		= { category = "Frames", text = "Lock Model Frame",  checked = true,  tooltip = "Lock model viewer frame into place", module = "ModelViewer"},
					[DGV_JOURNALFRAME]			= { category = "Frames",		text = "NPC Journal Button", checked = true,		tooltip = "Enable NPC Journal Frame", module = "NPCJournalFrame"},					
                    [DGV_JOURNALFRAMEBUTTONSTICKED]			= { category = "Frames",		text = "Floating NPC Journal Button", checked = false, tooltip = "Allow NPC Journal to float anywhere on the screen", indent=true, module = "NPCJournalFrame"},	
					[DGV_FISHINGPOLE]			= { category = "Gear Set",		text = "Ignore Fishing Items", checked = true, tooltip = "Don't suggest to replace fishing pole or items with +fishing stats if equipped", module = "GearAdvisor"},					
					[DGV_COOKINGITEM]			= { category = "Gear Set",		text = "Ignore Cooking Items", checked = true, tooltip = "Don't suggest to replace items with +cooking stats if equipped", module = "GearAdvisor"},
					[DGV_DAILYITEM]			= { category = "Gear Set",		text = "Ignore Daily Quest Items", checked = true, tooltip = "Don't suggest to replace quest items for completing daily quest", module = "GearAdvisor"},
					[DGV_WATCHLOCALQUEST]			= { category = "Questing",		text = "Auto Watch Local Quests", checked = false, tooltip = "Automatically remove non-local (not in current map) quests and add local quest to the objective tracker. This will trigger during a zone change event"},
					[DGV_TARGETBUTTONCUSTOM]	= { category = "Target",	text = "Customize Macro",		checked = false,	tooltip = "Customize Target Macro", module = "Target", indent = true, editBox = "",},
					[DGV_TARGETTOOLTIP]			= { category = "Target",		text = "Target Button Tooltip", checked = true, tooltip = "Display a tooltip for the target button to display the target name and model", indent = true, module = "Target"},						

					[DGV_GAWINCRITERIACUSTOM] = {category = "Gear Scoring", text = "Loot Suggestion Priority", tooltip = "Determines how gear should be scored, in order of greatest to least importance.", module = "GearAdvisor",
						options = {
							"Active Talent Specialization",
							"Inactive Talent Specialization",
							"Highest Vendor Price"
						}
					},
					
					[DGV_GASTATCAPLEVELDIFFERENCE] = {category = "Gear Scoring", text = "Stat Cap Level Difference", tooltip = "Player/Target level difference. Used in determining caps for hit and expertise.", module = "Hide",
						checked = 2,
						options = {
							{	text = "Even (PvP)", value = 0, },
							{	text = "+1", value = 1, },
							{	text = "+2 (Heroic Dungeon)", value = 2, },
							{	text = "+3 (Raid)", value = 3, },
						}
					},
					
					[DGV_GASMARTSETTARGET] = {category = "Gear Set", text = "Smart Gear Set", tooltip = "Determines which scoring configuration should be used to equip gear with Dugi Smart Set.", module = "GearAdvisor",
						checked = "Active Talent Specialization",
						options = {}
					},

					[DGV_GUIDEDIFFICULTY]		= { category = "Questing",	text = "Leveling Mode",			checked = "Normal", module = "Guides",
						options = {
							{	text = "Easy", colorCode = GREEN_FONT_COLOR_CODE, },
							{	text = "Normal", colorCode = YELLOW_FONT_COLOR_CODE, },
							{	text = "Hard", colorCode = ORANGE_FONT_COLOR_CODE, },
						}
					},
					[DGV_SMALLFRAMETRANSITION] 	= { category = "Borders",		text = "Small Frame Effect",	checked = "Flash", module = "SmallFrame",
						options = {
							{	text = "Flash", },
							{	text = "Scroll", },
						}
					},
					[DGV_LARGEFRAMEBORDER] 		= { category = "Borders",		text = "Borders",	checked = "BlackGold",
						options = {
							{	text = "Default", },
							{	text = "BlackGold", },
							{	text = "Bronze", },
							{	text = "DarkWood", },
							{	text = "ElvUI", },
							{	text = "Eternium", },
							{	text = "Gold", },
							{	text = "Metal", },
							{	text = "MetalRust", },
							{	text = "OnePixel", },
							{	text = "Stone", },
							{	text = "StonePattern", },
							{	text = "Thin", },
							{	text = "Wood", },
						}
					},
					[DGV_STEPCOMPLETESOUND]		= { category = "Questing",	text = "Step Complete Sound", checked = "Sound\\Interface\\MapPing.ogg", module = "Guides",
						options = {
							{	text = "None", 			value	= nil },
							{	text = "Map Ping", 		value = [[Sound\Interface\MapPing.ogg]]},
							{	text = "Window Close", 		value = [[Sound\Interface\AuctionWindowClose.ogg]]},
							{	text = "Window Open", 		value = [[Sound\Interface\AuctionWindowOpen.ogg]]},
							{	text = "Boat Docked", 		value = [[Sound\Doodad\BoatDockedWarning.ogg]]},
							{	text = "Bell Toll Alliance", 	value = [[Sound\Doodad\BellTollAlliance.ogg]]},
							{	text = "Bell Toll Horde",	value = [[Sound\Doodad\BellTollHorde.ogg]]},
							{	text = "Explosion",		value = [[Sound\Doodad\Hellfire_Raid_FX_Explosion05.ogg]]},
							{	text = "Shing!",		value = [[Sound\Doodad\PortcullisActive_Closed.ogg]]},
							{	text = "Wham!",			value = [[Sound\Doodad\PVP_Lordaeron_Door_Open.ogg]]},
							{	text = "Simon Chime",		value = [[Sound\Doodad\SimonGame_LargeBlueTree.ogg]]},
							{	text = "War Drums",		value = [[Sound\Event Sounds\Event_wardrum_ogre.ogg]]},
							{	text = "Humm",			value = [[Sound\Spells\SimonGame_Visual_GameStart.ogg]]},
							{	text = "Short Circuit",		value = [[Sound\Spells\SimonGame_Visual_BadPress.ogg]]},
						}
					},
					[DGV_ANTCOLOR]		= { category = "Waypoints",	text = "Ant Trail Color", checked = "Interface\\COMMON\\Indicator-Green",

						options = {
							{	text = "Gray", colorCode = GRAY_FONT_COLOR_CODE,	value	= [[Interface\COMMON\Indicator-Gray]] },
							{	text = "Green",  colorCode = GREEN_FONT_COLOR_CODE,	value = [[Interface\COMMON\Indicator-Green]]},
							{	text = "Red", colorCode = RED_FONT_COLOR_CODE,	value = [[Interface\COMMON\Indicator-Red]]},
							{	text = "Yellow", colorCode = YELLOW_FONT_COLOR_CODE,	value = [[Interface\COMMON\Indicator-Yellow]]},
						}
					},
					[DGV_TAXIFLIGHTMASTERS]		= { category = "Waypoints",	text = "Use Flightmasters", checked = "Auto",
						options = {
							{	text = "Auto", colorCode = GREEN_FONT_COLOR_CODE, value = "Auto" },
							{	text = "Always", colorCode = YELLOW_FONT_COLOR_CODE, value = "Always" },
							{	text = "Never", colorCode = RED_FONT_COLOR_CODE, value = "Never" },
						}
					},						
					[DGV_QUESTCOMPLETESOUND]		= { category = "Questing",	text = "Quest Complete Sound", checked = "Sound\\Creature\\Peon\\PeonBuildingComplete1.ogg", module = "DugisWatchFrame",
						options = {
							{	text = "None", 			value	= nil },
							{	text = "Default", 		value = [[Sound\Creature\Peon\PeonBuildingComplete1.ogg]]},
							{	text = "Troll Male", 		value = [[Sound\Character\Troll\TrollVocalMale\TrollMaleCongratulations01.ogg]]},
							{	text = "Troll Female",		value = [[Sound\Character\Troll\TrollVocalFemale\TrollFemaleCongratulations01.ogg]]},
							{	text = "Tauren Male",		value = [[Sound\Creature\Tauren\TaurenYes3.ogg]]},
							{	text = "Tauren Female",		value = [[Sound\Character\Tauren\TaurenVocalFemale\TaurenFemaleCongratulations01.ogg]]},
							{	text = "Undead Male",		value = [[Sound\Character\Scourge\ScourgeVocalMale\UndeadMaleCongratulations02.ogg]]},
							{	text = "Undead Female",		value = [[Sound\Character\Scourge\ScourgeVocalFemale\UndeadFemaleCongratulations01.ogg]]},
							{	text = "Orc Male",		value = [[Sound\Character\Orc\OrcVocalMale\OrcMaleCongratulations02.ogg]]},
							{	text = "Orc Female",		value = [[Sound\Character\Orc\OrcVocalFemale\OrcFemaleCongratulations01.ogg]]},
							{	text = "NightElf Female",	value = [[Sound\Character\NightElf\NightElfVocalFemale\NightElfFemaleCongratulations02.ogg]]},
							{	text = "NightElf Male",		value = [[Sound\Character\NightElf\NightElfVocalMale\NightElfMaleCongratulations01.ogg]]},
							{	text = "Human Female",		value = [[Sound\Character\Human\HumanVocalFemale\HumanFemaleCongratulations01.ogg]]},
							{	text = "Human Male",		value = [[Sound\Character\Human\HumanVocalMale\HumanMaleCongratulations01.ogg]]},
							{	text = "Gnome Male",		value = [[Sound\Character\Gnome\GnomeVocalMale\GnomeMaleCongratulations03.ogg]]},
							{	text = "Gnome Female",		value = [[Sound\Character\Gnome\GnomeVocalFemale\GnomeFemaleCongratulations01.ogg]]},
							{	text = "Dwarf Male",		value = [[Sound\Character\Dwarf\DwarfVocalMale\DwarfMaleCongratulations04.ogg]]},
							{	text = "Dwarf Female",		value = [[Sound\Character\Dwarf\DwarfVocalFemale\DwarfFemaleCongratulations01.ogg]]},
							{	text = "Draenei Male",		value = [[Sound\Character\Draenei\DraeneiMaleCongratulations02.ogg]]},
							{	text = "Draenei Female",	value = [[Sound\Character\Draenei\DraeneiFemaleCongratulations03.ogg]]},
							{	text = "BloodElf Female",	value = [[Sound\Character\BloodElf\BloodElfFemaleCongratulations03.ogg]]},
							{	text = "BloodElf Male",		value = [[Sound\Character\BloodElf\BloodElfMaleCongratulations02.ogg]]},
							{	text = "Worgen Male",		value = [[Sound\Character\PCWorgenMale\VO_PCWorgenMale_Congratulations01.ogg]]},
							{	text = "Worgen Female",		value = [[Sound\Character\PCWorgenFemale\VO_PCWorgenFemale_Congratulations01.ogg]]},
							{	text = "Goblin Male",		value = [[Sound\Character\PCGoblinMale\VO_PCGoblinMale_Congratulations01.ogg]]},
							{	text = "Goblin Female",		value = [[Sound\Character\PCGoblinFemale\VO_PCGoblinFemale_Congratulations01.ogg]]},
							{	text = "Pandaren Male",		value = [[Sound\Character\PCPandarenMale\VO_PCPandarenMale_Congratulations02.ogg]]},
							{	text = "Pandaren Female",		value = [[Sound\Character\PCPandarenFemale\VO_PCPandarenFemale_Congratulations02.ogg]]},						
						}
					},
					[DGV_TOOLTIPANCHOR]			= {category = "Tooltip",	text = "Tooltip Anchor", checked = "Default", module = "SmallFrame",
						options = {



							{	text = "Default", },
							{	text = "Bottom", },
							{	text = "Top", },
							{	text = "Left", },
							{	text = "Right", },
							{	text = "Bottom Left", },
							{	text = "Bottom Right", },
							{	text = "Top Left", },
							{	text = "Top Right", },
						}
					},
					[DGV_MAPPREVIEWPOIS]			= {category = "Map Preview",	text = "Quest Objectives", checked = "Single Quest",
						options = {
							{	text = "All Available Quests", },
							{	text = "All Tracked Quests", },
							{	text = "Single Quest", },
						}
					},
					[DGV_DISPLAYPRESET]			= {category = "Display",	text = "Recommended Preset Settings", checked = "Multi-step - Anchored", module = "SmallFrame",
						options = {
							{	text = "Minimal", },
							{	text = "Minimal - No Borders", },
							{	text = "Standard", },
							{	text = "Standard - Anchored", },
							{	text = "Multi-step", },
							{	text = "Multi-step - Anchored", },							
						}
					},
					[DGV_SMALLFRAMEDOCKING] = {category = "Frames", text = "Small Frame Behavior", checked = "Auto", module = "SmallFrame",
						tooltip = "Decides how the Small Frame will expand when it is not anchored inside the Watch Frame.",
						options = {
							{ text = "Auto", },
							{ text = "Relative to Watch Frame", },
							{ text = "Expand Down", },
							{ text = "Expand Up", },
							{ text = "Expand in Both Directions", },
						}
					},
					[DGV_WEAPONPREF]		= { category = "Gear Set",	text = "Weapon Preference", checked = "Auto", module = "GearAdvisor",
						tooltip = "Choose how gear advisor will decide which weapon to equip in the main hand and off hand slot when dual wielding. Auto option will decide based on the class and spec.",
						options = {
							{	text = "Auto", },
							{	text = "Fast / Slow", },
							{	text = "Slow / Fast", },
							{	text = "Never Swap", },							
						}
					},						
					[DGV_MINIBLOBQUALITY]		= { category = "Maps",	text = "Minimap Blob Quality",	checked = 0 },
					[DGV_SHOWTOOLTIP]			= { category = "Tooltip",	text = "Auto Tooltip (%.1fs)", checked = 5, module = "SmallFrame", tooltip ="Amount of time the Tooltip will remain in view from the last mouse over on small frame" },
					[DGV_MAPPREVIEWDURATION]	= {	category = "Map Preview",	text = "Duration (%.1fs)", checked = 5, tooltip = "Amount of time the Map Preview should remain in view (zero to disable).  Enabling this feature will automatically set the world map to windowed mode on reload." },
					[DGV_SMALLFRAMEFONTSIZE]	= {	category = "Display",	text = "Small Frame Font Size (%.1f)", checked = 12, module = "SmallFrame", tooltip = "Size of the font in the Small Frame." },
                    [DGV_DISPLAYGUIDESPROGRESS] 	= { category = "Display",	text = "Show Progress Bar", 	checked = true,	tooltip = "Show Progress Bar", module = "SmallFrame"},
                    [DGV_DISPLAYGUIDESPROGRESSTEXT] 	= { category = "Display",	text = "Show % text", 	checked = true, indent=true,	tooltip = "Show % text", module = "SmallFrame"},
                    [DGV_TARGETBUTTONSCALE]	    = {	category = "Target",	text = "Target Button Size (%.1f)", checked = 1, module = "Target", tooltip = "Size of the target button." },
					[DGV_ITEMBUTTONSCALE]	    = {	category = "Questing",	text = "Item Button Size (%.1f)",showOnRightColumn = true, checked = 1, tooltip = "Size of the item button." },
                    [DGV_SHOWQUESTABANDONBUTTON]			= { category = "Questing",	showOnRightColumn = true,	text = "Abandon Quests Button",	checked = true,	tooltip = "Mass abandon quests button in your quest log to automatically abandon all quests by their category or zone",},
                    [DGV_SUGGESTTRINKET]			= { category = "Gear Set",	showOnRightColumn = true,	text = "Suggest Trinkets",	checked = true,	tooltip = "A trinket is scored by its stats and item level but not the 'use' or special effect which can make the trinket suggestion inaccurate.\n\nUnticking this setting will disable the trinkets suggestion.",},					
                    
                    [DGV_ENABLEDGEARFINDER]			= { category = "Gear Finder",	showOnRightColumn = false,	text = "Enabled Gear Finder",	checked = true,	tooltip = "Gear Finder",},					
                      
                    [DGV_INCLUDE_DUNG_NORMAL]		= { category = "Gear Finder",	showOnRightColumn = false,	text = "Normal",	    checked = true,     tooltip = "",},					
                    [DGV_INCLUDE_DUNG_HEROIC]		= { category = "Gear Finder",	showOnRightColumn = false,	text = "Heroic",	    checked = false,     tooltip = "",},					
                    [DGV_INCLUDE_DUNG_MYTHIC]		= { category = "Gear Finder",	showOnRightColumn = false,	text = "Mythic",	    checked = false,     tooltip = "",},					
                    [DGV_INCLUDE_DUNG_TIMEWALKING]	= { category = "Gear Finder",	showOnRightColumn = false,	text = "Timewalking",	checked = false,     tooltip = "",},					
                    [DGV_INCLUDE_RAIDS_RAIDFINDER]	= { category = "Gear Finder",	showOnRightColumn = false,	text = "Raid Finder",	checked = false,     tooltip = "",},					
                    [DGV_INCLUDE_RAIDS_NORMAL]		= { category = "Gear Finder",	showOnRightColumn = false,	text = "Normal",	    checked = false,  	tooltip = "",},					
                    [DGV_INCLUDE_RAIDS_HEROIC]		= { category = "Gear Finder",	showOnRightColumn = false,	text = "Heroic",	    checked = false,  	tooltip = "",},					
                    [DGV_INCLUDE_RAIDS_MYTHIC]		= { category = "Gear Finder",	showOnRightColumn = false,	text = "Mythic",	    checked = false,  	tooltip = "",},					
                    
                    [DGV_GEARS_FROM_QUEST_GUIDES]		= { category = "Gear Finder",	showOnRightColumn = true,	text = "Search gears from Quest Guides",	    checked = true,  	tooltip = "",},					
                    
                    [DGV_DISPLAYALLSTATS]			= { category = "Gear Scoring",	showOnRightColumn = false,	text = "Display All Stats",	checked = false,	tooltip = "Display unused stats for gear scoring",},					
                  
                    [DGV_JOURNALFRAMEBUTTONSCALE]	    = {	category = "Frames",	text = "NPC Journal Button Size (%.1f)", checked = 4, module = "SmallFrame", tooltip = "Size of the NPC Journal Frame button." },
					[DGV_RECORDSIZE]			= { checked = 50 },
				},
			},
		}
	}
	self.db 		= LibStub("AceDB-3.0"):New("DugisGuideViewerProfiles", defaults)
	self.chardb		= self.db.profile.char.settings
	self.db.RegisterCallback(self, "OnProfileChanged", "ProfileChanged")
	self.db.RegisterCallback(self, "OnProfileCopied", "ProfileChanged")
	self.db.RegisterCallback(self, "OnProfileReset", "ProfileChanged")
end

function DugisGuideViewer:GuideOn()
	return DugisGuideViewer.chardb.GuideOn
end

function DugisGuideViewer:ProfileChanged()
	self.chardb = self.db.profile.char.settings
	self:ForceAllSettingsTreeCategories()
	self:SettingFrameChkOnClick()
    DugisGuideViewer:RestoreFramesPositions()
	--After dugi fix in the copper mode DelayUpdate is not available (clocking it: #128)
    if DugisGuideViewer.Modules.DugisWatchFrame.DelayUpdate then
        DugisGuideViewer.Modules.DugisWatchFrame:DelayUpdate()
    end
end

local function Dugi_Fix()
	CurrentTitle = nil
	DugisGuideViewer.CurrentTitle = nil
	DugisGuideUser.CurrentQuestIndex = nil
	CurrentQuestName = nil
	DugisGuideUser = (DugisGuideUser and wipe(DugisGuideUser)) or  {}
	DugisGuideUser.toskip = {}
	DugisGuideUser.QuestState = {}
	DugisGuideUser.turnedinquests = {}
	DugisGuideUser.removedQuests = {}
	DugisFlightmasterDataTable = {}
	DugisGuideViewerDB = nil
	DugisGuideViewer:ClearScreen()
	DugisGuideViewer.chardb.QuestRecordTable.framePositions = {}
	DugisGuideUser.SkipSaveFramesPosition = true	
end

local function ResetDB()
	local essentials = DugisGuideViewer.chardb.EssentialsMode
	local rev = DugisGuideViewer.chardb.SettingsRevision
	local guid = DugisGuideUser.CharacterGUID
	Dugi_Fix()
	LoadSettings()
	DugisGuideViewer.chardb.FirstTime = true
	DugisGuideUser.CharacterGUID = UnitGUID("player") or guid or "PRIOR_RESET"
	DugisGuideViewer.chardb.SettingsRevision = SettingsRevision
	DugisGuideViewer.chardb.EssentialsMode = essentials
end

local CATEGORY_TREE
function DugisGuideViewer:OnInitialize()
	DugisGuideViewer.Debug = DugisGuideViewer.Debug or DugisGuideUser.DebugOn
	self:RegisterEvent("PLAYER_LOGIN");
	self:RegisterEvent("ZONE_CHANGED");
	self:RegisterEvent("ZONE_CHANGED_NEW_AREA");
	self:RegisterEvent("CHAT_MSG_SYSTEM");
	self:RegisterEvent("QUEST_ACCEPTED")
	self:RegisterEvent("QUEST_WATCH_UPDATE")
	self:RegisterEvent("QUEST_LOG_UPDATE")
	self:RegisterEvent("QUEST_AUTOCOMPLETE")
	self:RegisterEvent("QUEST_DETAIL")
	self:RegisterEvent("QUEST_COMPLETE")	
	self:RegisterEvent("UI_INFO_MESSAGE")
	--self:RegisterEvent("QUEST_QUERY_COMPLETE")
	self:RegisterEvent("ZONE_CHANGED_INDOORS")
	self:RegisterEvent("MINIMAP_UPDATE_ZOOM")	
	self:RegisterEvent("CHAT_MSG_LOOT")
	self:RegisterEvent("ACHIEVEMENT_EARNED")
	self:RegisterEvent("CRITERIA_UPDATE")
	self:RegisterEvent("TRADE_SKILL_UPDATE")
	self:RegisterEvent("PLAYER_LEVEL_UP")
	self:RegisterEvent("PLAYER_LOGOUT")
    self:RegisterEvent("PLAYER_LEAVING_WORLD")
	self:RegisterEvent("PET_BATTLE_OPENING_START")
	self:RegisterEvent("QUEST_WATCH_LIST_CHANGED")
	self:RegisterEvent("GARRISON_MISSION_NPC_OPENED")
	
	CATEGORY_TREE = { 

		{ value = "Search Locations", 	text = L["Search Locations"], 	icon = nil },
		{ value = "Questing", 	text = L["Questing"], 	icon = nil },
		{ value = "Waypoints", 	text = L["Waypoints"], icon = nil },
		{ value = "Display", 	text = L["Display"], 	icon = nil },
		{ value = "Borders", 	text = L["Borders"], 	icon = nil },
		{ value = "Frames", 	text = L["Frames"], 	icon = nil },
		{ value = "Maps", 		text = L["Maps"], 		icon = nil },
		{ value = "Map Preview",text = L["Map Preview"],icon = nil },
		{ value = "Target",		text = L["Target Button"],	icon = nil },
		{ value = "Tooltip", 	text = L["Tooltip"], 	icon = nil },
		{ value = "Gear Set",		text = L["Gear Set"],		icon = nil },		
		{ value = "Gear Scoring",		text = L["Gear Scoring"],		icon = nil },
		{ value = "Gear Finder",		text = L["Gear Finder"].."|TInterface\\OptionsFrame\\UI-OptionsFrame-NewFeatureIcon:0:0:0:-1|t",		icon = nil },
		{ value = "Memory", 	text = L["Memory"], 	icon = nil },
		{ value = "Other", 		text = L["Other"], 	icon = nil },
		{ value = "Profiles", 	text = L["Profiles"] },
	}

	if not DugisGuideViewer:IsModuleRegistered("Guides") then tremove(CATEGORY_TREE, 14) end --Memory will be empty
    if not DugisGearFinder or not DugisGearFinder.allGearIds then tremove(CATEGORY_TREE, 13) end --Gear Finder 
	if not DugisGuideViewer:IsModuleRegistered("Guides") then tremove(CATEGORY_TREE, 10) end --Tooltip

	if not DugisGuideViewer:IsModuleRegistered("Target") then tremove(CATEGORY_TREE, 9) end --Target
	if not DugisGuideViewer:IsModuleRegistered("Guides") then tremove(CATEGORY_TREE, 4) end --Display
	
	LoadSettings()
	if DugisGuideViewerDB and DugisGuideViewerDB.char then --migrate old user data
		local settings = DugisGuideViewerDB.char[self.db.keys.profile] and DugisGuideViewerDB.char[self.db.keys.profile].settings
		if settings and settings.SettingsRevision==self.chardb.SettingsRevision then
			for k, v in pairs(settings) do
				self.db.profile.char.settings[k] = v
			end
		end
		DugisGuideViewerDB = nil
	end
	if self.chardb.SettingsRevision~=SettingsRevision then
		DugisGuideViewer:DebugFormat("resetting self.chardb.settings.SettingsRevision", "revision", self.chardb.SettingsRevision)
		ResetDB()
		self.chardb.SettingsRevision=SettingsRevision;
	end
	if not DugisGuideViewer:IsModuleRegistered("Guides") then
		self.chardb.EssentialsMode = 1
	end
	--self:InitMapping( )
	DugisGuideViewer:UpdateMainFrame()
end

function DugisGuideViewer:initAnts()
	local addon
	
	DugisGuideViewer.carboniteloaded = nil
	DugisGuideViewer.tomtomloaded = nil
	DugisGuideViewer.sexymaploaded = nil
	DugisGuideViewer.nuiloaded = nil
	DugisGuideViewer.tukuiloaded = nil
	DugisGuideViewer.elvuiloaded = nil
	DugisGuideViewer.shestakuiloaded = nil
	DugisGuideViewer.mapsterloaded = nil
	DugisGuideViewer.armoryloaded = nil
	DugisGuideViewer.outfitterloaded = nil
	DugisGuideViewer.arkinventoryloaded = nil
	DugisGuideViewer.zygorloaded = nil

	for addon=1, GetNumAddOns() do
		local name, _, _, enabled = GetAddOnInfo(addon)
		local loaded = IsAddOnLoaded(addon)
		
		if name == "Carbonite" and loaded then DugisGuideViewer.carboniteloaded = true 
		elseif name == "TomTom" and loaded then DugisGuideViewer.tomtomloaded = true
--		elseif name == "SexyMap" and loaded then DugisGuideViewer.sexymaploaded = true
		elseif name == "nUI" and loaded then DugisGuideViewer.nuiloaded = true
		elseif name == "Tukui" and loaded then DugisGuideViewer.tukuiloaded = true
--		elseif name == "ElvUI" and loaded then DugisGuideViewer.elvuiloaded = true
		elseif name == "LUI" and loaded then DugisGuideViewer.elvuiloaded = true
		elseif name == "ShestakUI" and loaded then DugisGuideViewer.shestakuiloaded = true
		elseif name == "Mapster" and loaded then DugisGuideViewer.mapsterloaded = true
		elseif name == "Armory" and loaded then DugisGuideViewer.armoryloaded = true
		elseif name == "Outfitter" and loaded then DugisGuideViewer.outfitterloaded = true
		elseif name == "Wholly" and loaded then DugisGuideViewer.whollyloaded = true
		elseif name == "ArkInventory" and loaded then DugisGuideViewer.arkinventoryloaded = true 
		elseif name == "ZygorGuidesViewer" and loaded then DugisGuideViewer.zygorloaded = true end
	end
	
	--if DugisGuideViewer.tomtomloaded then TomTom.profile.persistence.cleardistance = 0 end
end

function DugisGuideViewer:GetFontWidth(text, fonttype)
	local font = fonttype or "GameFontNormal"

	if not DugisFW then CreateFrame( "GameTooltip", "DugisFW" ) end
	local frame = DugisFW
	local fontstring = frame:CreateFontString("tmpfontstr","ARTWORK", font)
	fontstring:SetText(text)
	local fontwidth = fontstring:GetStringWidth()
	return fontwidth
end

function DugisGuideViewer:PrintTable( tbl )
	local key, val, val2
	
	DebugPrint("Table Contents:")
	
	if not tbl then DebugPrint("Table Empty") return end
	
	for key, val in pairs(tbl) do
		if type(val) == "table" then
			for _, val2 in pairs(val) do
				self:PrintBoolTbl(key,val2)
			end
		else
			self:PrintBoolTbl(key,val)
		end
	end
end

function DugisGuideViewer:PrintBoolTbl(key, val)
	local printstr = "key: "
	if type(key) == "boolean" then
		if key == true then printstr = printstr.."true" else printstr = printstr.."false" end
	else

		printstr = printstr..key
	end
	
	printstr = printstr.." val: "
	if type(val) == "boolean" then
		if val == true then printstr = printstr.."true" else printstr = printstr.."false" end
	else
		printstr = printstr..val
	end
	
	DebugPrint(printstr)
end

function DugisGuideViewer:RestoreFramesPositions()
    if DugisGuideViewer.chardb.QuestRecordTable.framePositions then
        LuaUtils:foreach(savablePositionsFrameNames, function(frameName)
            local framePosition = DugisGuideViewer.chardb.QuestRecordTable.framePositions[frameName]
            if framePosition then
                local frame = _G[frameName]
                if frame then
                    frame:ClearAllPoints( )
                    if framePosition.point then
                        frame:SetPoint(framePosition.point, framePosition.relativeTo, framePosition.relativePoint, framePosition.xOfs, framePosition.yOfs)
                    end
                end
            end
        end)
    end
end

function DugisGuideViewer:OnLoad()
	--DugisGuideViewer.Target:Init( )
	--DugisGuideViewer.chardb.GuideOn = true
	--DugisGuideViewer.StickyFrame:Init( )
	
	self:SetAllBorders()
	DugisGuideViewer:SetMemoryOptions()

	DugisGuideViewer:SetEssentialsOnCancelReload()
	DugisGuideViewer.chardb.GuideOn = DugisGuideViewer:GuideOn() and DugisGuideViewer:ReloadModules()
	DugisGuideViewer:SettingFrameChkOnClick(_, true)
	
	if ((DugisGuideViewer.carboniteloaded and Nx.Quest) or DugisGuideViewer.sexymaploaded or DugisGuideViewer.nuiloaded or DugisGuideViewer.elvuiloaded or DugisGuideViewer.tukuiloaded or DugisGuideViewer.shestakuiloaded) then 
		DugisGuideViewer:SetDB(false, DGV_ANCHOREDSMALLFRAME)

		DugisGuideViewer:SetDB(false, DGV_WATCHFRAMEBORDER)
		--DugisGuideViewer:SetDB(false, DGV_MOVEWATCHFRAME)
		DugisGuideViewer:UpdateCompletionVisuals()
	end

	collectgarbage()
	DugisGuideViewer:UpdateIconStatus()
	--if DugisGuideViewer.GuideOn and DugisGuideViewer.chardb.EssentialsMode ~= 1 then DelayandMoveToNextQuest(3) end
	if DugisGuideViewer:IsModuleLoaded("DugisWatchFrame") and self:UserSetting(DGV_DISABLEWATCHFRAMEMOD) then
		DugisGuideViewer.Modules.DugisWatchFrame:DelayUpdate()
	end
	DugisGuideViewer:RefreshQuestWatch()
	DugisGuideUser.PetBattleOn = false
	
	if DugisGuideViewer:UserSetting(DGV_ENABLENPCNAMEDB) == false then
		DugisGuideViewer:SetDB(true, DGV_ENABLENPCNAMEDB)
	end
    
    DugisGuideViewer:RestoreFramesPositions()
    
    --bugfix #128 Fix unclickable DG icon bug
    if DugisOnOffButton:GetTop() == nil then
        DugisOnOffButton:ClearAllPoints();
        DugisOnOffButton:SetPoint("TOPLEFT", "Minimap", "TOPLEFT", -13, -20)
    end
end

function DugisGuideViewer:SetMemoryOptions()
	--[[if not DugisGuideViewer:UserSetting(DGV_ENABLEMODELDB) then 
		--table.wipe(self.ModelViewer.npcDB)
		--table.wipe(self.ModelViewer.objDB)
		--self.ModelViewer.npcDB = {}

		--self.ModelViewer.objDB = {}
		--DebugPrint("#Wipe Objects")
		DugisGuideViewer.UnloadModule("NpcsF")
		DugisGuideViewer.UnloadModule("ObjectsF")
		DugisGuideViewer.UnloadModule("NpcsT")
		DugisGuideViewer.UnloadModule("ObjectsT")
		DugisGuideViewer.UnloadModule("ModelViewer")
	elseif DugisGuideViewer.GuideOn then
		DugisGuideViewer:LoadModule("ModelViewer")
		DugisGuideViewer.LoadModule("NpcsF")
		DugisGuideViewer.LoadModule("ObjectsF")
		DugisGuideViewer.LoadModule("NpcsT")
		DugisGuideViewer.LoadModule("ObjectsT")
	end
	
	if not DugisGuideViewer:UserSetting(DGV_ENABLENPCNAMEDB) then 
		--table.wipe(DugisNPCs)
		DugisNPCs = {}
		DebugPrint("#Wipe NPC table")
	end
	
	if not DugisGuideViewer:UserSetting(DGV_ENABLEQUESTLEVELDB) then
		--table.wipe(self.ReqLevel)
		self.ReqLevel = {}
		DebugPrint("#Wipe ReqLevel table")
	end]]
	
	collectgarbage()
end

local function Disable(frame)
	if frame then 
		--DebugPrint("frame type:"..frame:GetObjectType())
		if frame:GetObjectType() == "CheckButton" then
			frame:SetChecked(false)
			frame.Text:SetTextColor(0.5, 0.5, 0.5)
		end
		frame:Disable() 
	end
end

local function Enable(frame)
	if frame then
		if frame:GetObjectType() == "CheckButton" then
			frame.Text:SetTextColor(1, 1, 1) 
		end
		frame:Enable() 
	end
end

local profileCache = {}
local profileList = {}
local function getProfileList(noCurrent, noDefaults)
	wipe(profileList)
	if not noDefaults then
		profileList[1] = L["Default"]
		profileList[2] = DugisGuideViewer.db.keys.char
		profileList[3] = tinsert(profileList, DugisGuideViewer.db.keys.realm)
		profileList[4] = UnitClass("player")
	end
	
	wipe(profileCache)
	DugisGuideViewer.db:GetProfiles(profileCache)
	for _,v in ipairs(profileCache) do
		if not tContains(profileList, v) then
			tinsert(profileList, v)
		end
	end
	
	if noCurrent then
		for i,v in ipairs(profileList) do
			if v==DugisGuideViewer.db.keys.profile then
				tremove(profileList, i)
				break
			end
		end
	end
	
	return profileList
end

local function SetUseItem(index)
	DugisGuideViewer:SetUseItem(index)
end

local function SetUseItemByQID(questId)
	DugisGuideViewer:SetUseItemByQID(questId)
end

function DugisGuideViewer:UpdateOrderedListView(optionIndex, ...)
	local SettingsDB = 	DugisGuideViewer.chardb
	local container = _G["DGV_OrderedListContainer"..optionIndex]
	local height = 16*#SettingsDB[optionIndex].options
	if height==0 then height=1 end
	container:SetHeight(height)
	local lastShown
	for i=1,select("#", ...) do
		local option = SettingsDB[optionIndex].options[i]
		local child = select(i, ...)
		if option then
			if type(option)=="string" then
				child.text:SetText(L[option])
			else
				local _, specName = GetSpecializationInfo(option)
				child.text:SetText(specName)
			end
			child:Show()
			lastShown = child
		else
			child:Hide()
		end
	end
	return lastShown
end

local gearScoringCriteria = {}
local function GetGearScoringCriteria()
	wipe(gearScoringCriteria)
	for _, option in ipairs(DugisGuideViewer.chardb[DGV_GASMARTSETTARGET].options) do
		if option~="None" then
			tinsert(gearScoringCriteria, option)
		end
	end
	tinsert(gearScoringCriteria, "Highest Vendor Price")
	for _,option in ipairs(DugisGuideViewer.chardb[DGV_GAWINCRITERIACUSTOM].options) do
		local index = DugisGuideViewer.tIndexOfFirst(gearScoringCriteria, option)
		if index then tremove(gearScoringCriteria, index) end
	end
	return gearScoringCriteria
end

local AceGUI = LibStub("AceGUI-3.0")
local function GetSettingsCategoryFrame(category, parent)
	local self = DugisGuideViewer
	local frameName = string.format("DGV_%sCategoryFrame", category)
	local frame = _G[frameName]
	if not frame then



		frame =  CreateFrame("Frame", frameName, parent)
		frame:SetAllPoints(parent)
	
		local fontstring = frame:CreateFontString(nil,"ARTWORK", "GameFontNormalLarge")
		fontstring:SetText(L[category])
		fontstring:SetPoint("TOPLEFT", frame, "TOPLEFT", 16, -16)
	end
	
	local SettingsDB = 	DugisGuideViewer.chardb
	local top = -40
    local topRightColumn = -40
	for SettingNum = 1, SettingsDB.sz do
		if SettingsDB[SettingNum].category==category
			and(not DugisGuideViewer:GetDB(SettingNum, "module") 
			or DugisGuideViewer:IsModuleRegistered(DugisGuideViewer:GetDB(SettingNum, "module")))
		then
			local chkBoxName = "DGV.ChkBox"..SettingNum
			local chkBox = _G[chkBoxName]
			if not chkBox then

				chkBox = CreateFrame("CheckButton", chkBoxName, frame, "InterfaceOptionsCheckButtonTemplate")
                
                local topValue = top
                local xShift = 0
                
                if SettingsDB[SettingNum].showOnRightColumn then
                    --Extra y shifts
                    if SettingNum == DGV_SUGGESTTRINKET then
                        topRightColumn = topRightColumn + 15
                    end     
                
                    xShift = 300
                    
                    if SettingNum == DGV_DISPLAYALLSTATS then
                       -- topRightColumn = topRightColumn + 25
                       -- xShift = 285
                    end
                    
                    topValue = topRightColumn
                    
                    topRightColumn = topRightColumn - chkBox:GetHeight()
                    
				else
                    top = top - chkBox:GetHeight()
                end
                
				if SettingsDB[SettingNum].indent then
					chkBox:SetPoint("TOPLEFT", frame, "TOPLEFT", 40 + xShift, topValue)
				else
					chkBox:SetPoint("TOPLEFT", frame, "TOPLEFT", 16 + xShift, topValue)
				end
				chkBox.Text:SetText(L[SettingsDB[SettingNum].text])
				chkBox:SetHitRectInsets(0, 0, 0, 0)
				chkBox:RegisterForClicks("LeftButtonDown")
				chkBox:SetScript("OnClick", function() DugisGuideViewer:SettingFrameChkOnClick (chkBox) 	   end)
				chkBox:SetScript("OnEnter", function() DugisGuideViewer:SettingsTooltip_OnEnter(chkBox, event) end)
				chkBox:SetScript("OnLeave", function() DugisGuideViewer:SettingsTooltip_OnLeave(chkBox, event) end)
                
                --Extra separators/labels
                if SettingNum == DGV_ENABLEDGEARFINDER then
                    local fontstring = frame:CreateFontString("DugisGearScoringLabel","ARTWORK", "GameFontHighlightLeft")
                    fontstring:SetText("Search gears from dungeon guides:")
                    fontstring:SetPoint("TOPLEFT", frame, "TOPLEFT", 18 + xShift, top - 16)
                    top = top - fontstring:GetStringHeight() - 20
                end
                
                if SettingNum == DGV_INCLUDE_DUNG_TIMEWALKING then
                    local fontstring = frame:CreateFontString("DugisGearScoringLabel","ARTWORK", "GameFontHighlightLeft")
                    fontstring:SetText("Search gears from raid guides:")
                    fontstring:SetPoint("TOPLEFT", frame, "TOPLEFT", 18 + xShift, top - 5)
                    top = top - fontstring:GetStringHeight() - 10
                end                
                
			end
			chkBox:SetChecked(SettingsDB[SettingNum].checked)
		end
	end
	
	--Customize macro edit box
	if SettingsDB[DGV_TARGETBUTTONCUSTOM].category==category
		and(not DugisGuideViewer:GetDB(DGV_TARGETBUTTONCUSTOM, "module")
		or DugisGuideViewer:IsModuleRegistered(DugisGuideViewer:GetDB(DGV_TARGETBUTTONCUSTOM, "module")))
	then
		local macroFrame = _G["DGV.MacroFrame"]
		local textBox =  _G["DGV.InputBox"..DGV_TARGETBUTTONCUSTOM]
		local chkBox =  _G["DGV.ChkBox"..DGV_TARGETBUTTONCUSTOM]
		if not macroFrame then
			macroFrame = CreateFrame("Frame", "DGV.MacroFrame", frame)
			textBox = CreateFrame("EditBox", "DGV.InputBox"..DGV_TARGETBUTTONCUSTOM,  macroFrame, "InputBoxTemplate")
			chkBox = CreateFrame("CheckButton", "DGV.ChkBox"..DGV_TARGETBUTTONCUSTOM, frame, "InterfaceOptionsCheckButtonTemplate")
			if SettingsDB[DGV_TARGETBUTTONCUSTOM].indent then
				chkBox:SetPoint("TOPLEFT", frame, "TOPLEFT", 40, top)
			else
				chkBox:SetPoint("TOPLEFT", frame, "TOPLEFT", 16, top)
			end
			chkBox.Text:SetText(L[SettingsDB[DGV_TARGETBUTTONCUSTOM].text])
			chkBox:SetHitRectInsets(0, -200, 0, 0)
			chkBox:RegisterForClicks("LeftButtonDown")
			chkBox:SetScript("OnClick", function() DugisGuideViewer:SettingFrameChkOnClick (chkBox)	   end)
			chkBox:SetScript("OnEnter", function() DugisGuideViewer:SettingsTooltip_OnEnter(chkBox, event) end)
			chkBox:SetScript("OnLeave", function() DugisGuideViewer:SettingsTooltip_OnLeave(chkBox, event) end)

			top = top - chkBox:GetHeight()

			macroFrame:SetSize(260, 90)
			macroFrame:SetPoint("TOPLEFT", frame, "TOPLEFT", 40, top)
			DugisGuideViewer:SetFrameBackdrop(macroFrame, "Interface\\Tooltips\\UI-Tooltip-Background", "Interface\\Tooltips\\UI-Tooltip-Border", 5, 5, 5, 5)
			macroFrame:SetBackdropBorderColor(TOOLTIP_DEFAULT_COLOR.r, TOOLTIP_DEFAULT_COLOR.g, TOOLTIP_DEFAULT_COLOR.b);
			macroFrame:SetBackdropColor(TOOLTIP_DEFAULT_BACKGROUND_COLOR.r, TOOLTIP_DEFAULT_BACKGROUND_COLOR.g, TOOLTIP_DEFAULT_BACKGROUND_COLOR.b);

			textBox:SetMultiLine(true)
			textBox:SetSize(260, 90)
			textBox:SetAutoFocus(false)
			textBox:ClearAllPoints( )
			textBox:SetPoint("TOPLEFT", macroFrame, "TOPLEFT", 10, -10)
			textBox:SetPoint("BOTTOMRIGHT", macroFrame, "BOTTOMRIGHT", -10, -10)
			textBox:SetMaxLetters(215)
			local filename, _, _ = textBox:GetFont()
			textBox:SetFont(filename, 11)
			textBox.Left:SetTexture(nil)
			textBox.Middle:SetTexture(nil)
			textBox.Right:SetTexture(nil)
			
			textBox:Show()
			
			top = top - macroFrame:GetHeight()
			
			local button = DugisGuideViewer:CreateButton("DGV_ApplyMacroButton", frame, "Apply", function() DugisGuideViewer.Modules.Target:CustomizeMacro() end)
			button:SetPoint("TOPLEFT", frame, "TOPLEFT", 40, top-3)
			local right = button:GetWidth()
			
			button = DugisGuideViewer:CreateButton("DGV_ResetMacroButton", frame, "Default", function() DugisGuideViewer.Modules.Target:ResetMacro() end)
			button:SetPoint("TOPLEFT", frame, "TOPLEFT", 40 + right, top-3)
			local right2 = button:GetWidth()
			
			button = DugisGuideViewer:CreateButton("DGV_ClearMacroButton", frame, "Clear", function() DugisGuideViewer.Modules.Target:ClearMacro() end)

			button:SetPoint("TOPLEFT", frame, "TOPLEFT", 40 + right + right2, top-3)

			
			top = top-3-button:GetHeight()
		end
		
		chkBox:SetChecked(SettingsDB[DGV_TARGETBUTTONCUSTOM].checked)
		textBox:SetText(self.chardb[DGV_TARGETBUTTONCUSTOM].editBox)
	end
	
	--Reset GA Blacklist Button
	if category=="Gear Set" and not DGV_ResetGABlacklistButton then
		local button = CreateFrame("Button", "DGV_ResetGABlacklistButton", frame, "UIPanelButtonTemplate")
		local btnText = L["Reset Ban List"]
		local fontwidth = DugisGuideViewer:GetFontWidth(btnText, "GameFontHighlight")
		button:SetText(btnText)
		button:SetWidth(fontwidth + 30)
		button:SetHeight(22)
		button:SetPoint("TOPLEFT", frame, "TOPLEFT", 16, top-3)
		top = top-3-button:GetHeight()
		button:RegisterForClicks("LeftButtonUP")
		button:SetScript("OnClick", 
			function() 
				if self.chardb.GA_Blacklist then
					wipe(self.chardb.GA_Blacklist)
					self.Modules.GearAdvisor.AutoEquipSmartSet(nil, true, true)
				end
			end)
	end
	
	--custom new profile
	if category=="Profiles" then
		local profileFrame = _G["DGV.CustomProfileFrame"]
		local textBox =  _G["DGV.InputBox"..DGV_PROFILECUSTOM]
		if not profileFrame then
			profileFrame = CreateFrame("Frame", "DGV.CustomProfileFrame", frame)
			profileFrame:SetPoint("TOPLEFT", frame, "TOPLEFT", 22, top)
			profileFrame:SetPoint("RIGHT")
			
			-- new profile
			textBox = CreateFrame("EditBox", "DGV.InputBox"..DGV_PROFILECUSTOM,  profileFrame, "InputBoxTemplate")
			local newButton = DugisGuideViewer:CreateButton("DGV_NewProfileButton", profileFrame, L["OK"], function() DugisGuideViewer.db:SetProfile(textBox:GetText()) end)
			textBox:SetMultiLine(false)
			textBox:SetSize(200, 15)
			textBox:SetAutoFocus(false)
			textBox:ClearAllPoints( )
			textBox:SetPoint("BOTTOMLEFT", 3, 0)
			newButton:SetPoint("LEFT", textBox, "RIGHT", 3)
			newButton:SetWidth(50)
			newButton:Show()
			textBox:Show()
			
			local dropdown_text = textBox:CreateFontString("DGV_CustomProfileFrameTitle", "ARTWORK", "GameFontHighlight")
			dropdown_text:SetText(L["New Profile"])
			dropdown_text:SetPoint("BOTTOMLEFT", textBox, "TOPLEFT", -5, 7)
			profileFrame:SetHeight(22+dropdown_text:GetHeight())
			
			top = top - 5 - profileFrame:GetHeight()
		end
		
		textBox:SetText(self.db.keys.profile)
	end
	
	--Weapon Preference Dropdown
	if SettingsDB[DGV_WEAPONPREF].category==category and not DGV_WeaponPreference then
		top = top - 24
		local dropdown = self:CreateDropdown("DGV_WeaponPreference", frame, SettingsDB[DGV_WEAPONPREF].text, DGV_WEAPONPREF, self.WeaponPreference_OnClick)
		dropdown:SetPoint("TOPLEFT", frame, "TOPLEFT", 3, top)
		top = top-dropdown:GetHeight()
	end
	if DGV_WeaponPreference then
		Lib_UIDropDownMenu_Initialize(DGV_WeaponPreference, DGV_WeaponPreference.initFunc)
		Lib_UIDropDownMenu_SetSelectedValue(DGV_WeaponPreference, DugisGuideViewer:UserSetting(DGV_WEAPONPREF))
	end			
	
	--Smart Set Target Configuration Dropdown
	wipe(SettingsDB[DGV_GASMARTSETTARGET].options)
	local targetOptions = SettingsDB[DGV_GASMARTSETTARGET].options
	tinsert(targetOptions, "None")
	tinsert(targetOptions, "Active Talent Specialization")
	--tinsert(targetOptions, L["%s (PvP)"]:format("Active Talent Specialization"))
	if GetSpecialization(false, false, 2) then
		tinsert(targetOptions, "Inactive Talent Specialization")
		--tinsert(targetOptions, L["%s (PvP)"]:format("Inactive Talent Specialization"))
	end
	for specNum=1,GetNumSpecializations() do
		tinsert(targetOptions, (select(2,GetSpecializationInfo(specNum))))
		--tinsert(targetOptions, L["%s (PvP)"]:format(select(2,GetSpecializationInfo(specNum))))
	end
	if SettingsDB[DGV_GASMARTSETTARGET].category==category  and not DGV_GASmartSetTargetDropdown then
		top = top - 24
		local dropdown = self:CreateDropdown("DGV_GASmartSetTargetDropdown", frame, SettingsDB[DGV_GASMARTSETTARGET].text, DGV_GASMARTSETTARGET, self.GASmartSetTargetDropdown_OnClick)
		dropdown:SetPoint("TOPLEFT", frame, "TOPLEFT", 3, top)
		top = top-dropdown:GetHeight()
	end
	if DGV_GASmartSetTargetDropdown then

		Lib_UIDropDownMenu_Initialize(DGV_GASmartSetTargetDropdown, DGV_GASmartSetTargetDropdown.initFunc)
		Lib_UIDropDownMenu_SetSelectedValue(DGV_GASmartSetTargetDropdown, DugisGuideViewer:UserSetting(DGV_GASMARTSETTARGET))
	end
	
	--Equip Set button

	if category=="Gear Set" and not DGV_EquipSetButton then
		local button = CreateFrame("Button", "DGV_EquipSetButton", frame, "UIPanelButtonTemplate")
		local btnText = L["Equip Set"]
		local fontwidth = DugisGuideViewer:GetFontWidth(btnText, "GameFontHighlight")
		button:SetText(btnText)
		button:SetWidth(fontwidth + 30)
		button:SetHeight(22)
		button:SetPoint("TOPLEFT", frame, "TOPLEFT", 16, top-3)
		top = top-3-button:GetHeight()
		--button:SetPoint("TOPLEFT", "DGV.ChkBox6", "BOTTOMLEFT", "0", "-3")
		button:RegisterForClicks("LeftButtonUP")
		button:SetScript("OnClick", function() DugisGuideViewer.Modules.GearAdvisor.AutoEquipSmartSet(nil, true, true) end)
	end
	
	--Stat Cap Level Difference Dropdown
	if SettingsDB[DGV_GASTATCAPLEVELDIFFERENCE].category==category
		and(not DugisGuideViewer:GetDB(DGV_GASTATCAPLEVELDIFFERENCE, "module")
		or DugisGuideViewer:IsModuleRegistered(DugisGuideViewer:GetDB(DGV_GASTATCAPLEVELDIFFERENCE, "module")))
		and not DGV_StatCapLevelDifferenceDropdown
	then
		top = top - 24
		local dropdown = self:CreateDropdown("DGV_StatCapLevelDifferenceDropdown", frame, "Stat Cap Level Difference", DGV_GASTATCAPLEVELDIFFERENCE, self.StatCapLevelDifferenceDropdown_OnClick)
		dropdown:SetPoint("TOPLEFT", frame, "TOPLEFT", 3, top)
		top = top-dropdown:GetHeight()
	end
	if DGV_StatCapLevelDifferenceDropdown then
		Lib_UIDropDownMenu_Initialize(DGV_StatCapLevelDifferenceDropdown, DGV_StatCapLevelDifferenceDropdown.initFunc)
		Lib_UIDropDownMenu_SetSelectedValue(DGV_StatCapLevelDifferenceDropdown, DugisGuideViewer:UserSetting(DGV_GASTATCAPLEVELDIFFERENCE))
	end
	
	if SettingsDB[DGV_GAWINCRITERIACUSTOM].category==category and not DugisGearScoringLabel then
		top = top - 5
        local deltaY = 10
		local fontstring = frame:CreateFontString("DugisGearScoringLabel","ARTWORK", "GameFontNormalLarge")
		fontstring:SetText(SettingsDB[DGV_GAWINCRITERIACUSTOM].text)
		fontstring:SetPoint("TOPLEFT", frame, "TOPLEFT", 16, -175 - deltaY, top)
		fontstring:SetJustifyV("TOP")
		top = top - fontstring:GetStringHeight() - 5
		
		local orderedListContainer = CreateFrame("Frame", "DGV_OrderedListContainer"..DGV_GAWINCRITERIACUSTOM, frame)
		orderedListContainer.optionIndex = DGV_GAWINCRITERIACUSTOM
		orderedListContainer:SetPoint("TOPLEFT", frame, "TOPLEFT", 27, -195 - deltaY, top)
		orderedListContainer:SetPoint("RIGHT", frame, "RIGHT", -10, -195)
		orderedListContainer:SetFrameLevel(1)
		local lastListItem
		for i=1,5+GetNumSpecializations()*2 do
			local listItem = CreateFrame("Frame", nil, orderedListContainer, "DugisOrderedListItemTemplate")
			listItem:SetID(i)
			if lastListItem then
				listItem:SetPoint("TOP", lastListItem, "BOTTOM")
			else
				listItem:SetPoint("TOP", orderedListContainer)
			end
			lastListItem = listItem
		end
		local lastShown = DugisGuideViewer:UpdateOrderedListView(DGV_GAWINCRITERIACUSTOM, orderedListContainer:GetChildren())
		top = top - orderedListContainer:GetHeight() - 5
		
		local addString = frame:CreateFontString("DugisGearScoringAddLabel","ARTWORK", "GameFontNormal")
		addString:SetText(L["Add"])
		addString:SetWidth(addString:GetStringWidth())
		addString:SetHeight(40)
		addString:SetPoint("TOPLEFT", orderedListContainer, "BOTTOMLEFT")
		
		local dropdown = self:CreateDropdown(
				"DugisGearScoringDropdown", 
				frame, 
				nil, 
				nil, 
				function(button)
					local options = DugisGuideViewer.chardb[DGV_GAWINCRITERIACUSTOM].options
					if not tContains(options, button.value) then
						local indexOfFalse = DugisGuideViewer.tIndexOfFirst(options, false)
						if indexOfFalse then
							options[indexOfFalse] = button.value
						else
							tinsert(options, button.value)
						end
						DugisGuideViewer:UpdateOrderedListView(DGV_GAWINCRITERIACUSTOM, orderedListContainer:GetChildren())
					end
				end, 
				function() 
					return GetGearScoringCriteria() 
				end)
		dropdown:SetPoint("LEFT", addString, "RIGHT", -10)
	end
    
    local function GetSelectedClassIdentifier()
        local result = ""
        LuaUtils:foreach(DugisGuideViewer.defaultLevelingSpec, function(info, key)
            if DugisGuideViewer.Modules.GearAdvisor.selectedClassIndex == info.orderIndex then
                result = key 
            end
        end)
        return result
    end
        
    local function TryToSetCurrentClass()
        local localizedClass, englishClass, classIndex = UnitClass("player")
        local classIndex = 1
        LuaUtils:foreach(DugisGuideViewer.defaultLevelingSpec, function(info, key)
            if key == englishClass then
                classIndex = info.orderIndex
            end
        end)
        
        Lib_UIDropDownMenu_Initialize(DugisGearWeightsClassDropdown, DugisGearWeightsClassDropdown.initFunc)
        Lib_UIDropDownMenu_SetSelectedID(DugisGearWeightsClassDropdown, classIndex)  
        DugisGuideViewer.Modules.GearAdvisor.selectedClassIndex = classIndex 
    end         
        
    local function TryToSetCurrentSpecialization()
        local localizedClass, englishClass, classIndex = UnitClass("player")
        local currentSpec = GetSpecialization()
        if currentSpec == nil or GetSelectedClassIdentifier() ~= englishClass then
            currentSpec = 1
        end
        
        Lib_UIDropDownMenu_Initialize(DugisGearWeightsSpecializationDropdown, DugisGearWeightsSpecializationDropdown.initFunc)
        Lib_UIDropDownMenu_SetSelectedID(DugisGearWeightsSpecializationDropdown, currentSpec)  
             
        DugisGuideViewer.Modules.GearAdvisor.selectedSpecIndex = currentSpec
    end 
    
    
    local function UpdateSettingsSearchHeight()
        local _max = SettingsSearchTreeFrame.height - 200
        
        if _max < 1 then
            _max = 1
        end
        
        SettingsSearchScroll.scrollBar:SetMinMaxValues(1, _max) 
    end
        
    if category == "Search Locations" and not DugisGearWeightsClassDropdownLabel then
        if not SettingsSearchScroll then
            SettingsSearchScroll = GUIUtils:CreateScrollFrame(frame)
                        
            SettingsSearchScroll.frame:SetWidth(388) 
            SettingsSearchScroll.scrollBar:SetPoint("TOPLEFT", parent, "TOPLEFT", 570, -52)
            SettingsSearchScroll.scrollBar:SetWidth(30)
            SettingsSearchScroll.scrollBar:Hide()
            
            
            
            SettingsSearchScroll.frame:EnableMouseWheel(true)
            SettingsSearchScroll.frame:SetScript("OnMouseWheel", function(self, delta)
                SettingsSearchScroll.scrollBar:SetValue(SettingsSearchScroll.scrollBar:GetValue() - delta * 24)  
            end)     
            
        end
        
        if SettingsSearchTreeFrame == nil then
            CreateFrame("Frame", "SettingsSearchTreeFrame", SettingsSearchScroll.frame)
        end
        
        if not SettingsSearch_SearchBox then
            CreateFrame("EditBox", "SettingsSearch_SearchBox", frame, "InputBoxTemplate")
        end
        
        SettingsSearch_SearchBox:SetAutoFocus(false)
        SettingsSearch_SearchBox:SetSize("150", "25")
        SettingsSearch_SearchBox:SetPoint("TOPLEFT", frame, "TOPLEFT", 180, -10)
        SettingsSearch_SearchBox:SetScript("OnLoad", function(self)  end)
        SettingsSearch_SearchBox:SetScript("OnEscapePressed", function(self) self:SetAutoFocus(false) self:ClearFocus() end)
        SettingsSearch_SearchBox:SetScript("OnTextChanged", function() 
            if SettingsSearch_SearchBox:GetNumLetters() > 1 then
                local nodes = DugisGuideViewer:GetLocationsAndPortalsByText(SettingsSearch_SearchBox:GetText())
                
                --Passing data to tree frame       
                GUIUtils:SetTreeFrameData(SettingsSearchTreeFrame, "SettingMenu", nodes, function(self)
                    DugisGuideViewer:RemoveAllWaypoints()
                    local data = self.leafData.data
                    if data.isPortal == true then
                        DugisGuideViewer:AddCustomWaypoint(data.x, data.y, "Portal " .. data.mapName, data.mapId, data.f)      
                    else
                        local mapId = DugisGuideViewer:GetMapIDFromName(data.zone)
                        DugisGuideViewer:AddCustomWaypoint(data.x / 100, data.y / 100, data.subzoneName, mapId, 0)      
                    end
					SettingsSearch_SearchBox:SetAutoFocus(false)
					SettingsSearch_SearchBox:ClearFocus()
                end)  
                
                GUIUtils:UpdateTreeVisualization(SettingsSearchTreeFrame)
                
                UpdateSettingsSearchHeight()
                
                if SettingsSearchTreeFrame.height > 200 then
                    SettingsSearchScroll.scrollBar:Show()
                else
                    SettingsSearchScroll.scrollBar:Hide()
                end
                SettingsSearchTreeFrame:Show() 
            else
                if SettingsSearchTreeFrame then
                    SettingsSearchTreeFrame:Hide()
                end
            end
        end)
        SettingsSearch_SearchBox:Show()
        
        SettingsSearchTreeFrame:Show() 
        SettingsSearchTreeFrame:SetParent(SettingsSearchScroll.frame)
        SettingsSearchTreeFrame:SetWidth(368)
        SettingsSearchTreeFrame:SetHeight(64)
        
        SettingsSearchTreeFrame.onNodeClick = function()
            UpdateSettingsSearchHeight()
        end
        
        SettingsSearchScroll.frame:SetHeight(291)
        SettingsSearchScroll.scrollBar:SetHeight(261)
        
        SettingsSearchTreeFrame:SetPoint("TOPLEFT", SettingsSearchScroll.frame, "TOPLEFT", 0, 0)
         
        SettingsSearchScroll.frame.content = SettingsSearchTreeFrame
        SettingsSearchScroll.frame:SetScrollChild(SettingsSearchTreeFrame)             
    end
    
    if category == "Gear Scoring" and not DugisGearWeightsClassDropdownLabel then
		top = -70

		local classDropDownLabel = frame:CreateFontString("DugisGearWeightsClassDropdownLabel","ARTWORK", "GameFontNormal")
		classDropDownLabel:SetText(L["Class"])
		classDropDownLabel:SetWidth(classDropDownLabel:GetStringWidth())
		classDropDownLabel:SetHeight(40)
		classDropDownLabel:SetPoint("TOPLEFT", frame, "TOPLEFT", 16, top)
        
		local dropdown = self:CreateDropdown(
				"DugisGearWeightsClassDropdown", 
				frame, 
				nil, 
				nil, 
				function(button)
                    Lib_UIDropDownMenu_Initialize(DugisGearWeightsClassDropdown, DugisGearWeightsClassDropdown.initFunc)
                    Lib_UIDropDownMenu_SetSelectedValue(DugisGearWeightsClassDropdown, button.value)
                    DugisGuideViewer.Modules.GearAdvisor.selectedClassIndex = Lib_UIDropDownMenu_GetSelectedID(DugisGearWeightsClassDropdown)
                    TryToSetCurrentSpecialization()
                    DugisGuideViewer.Modules.GearAdvisor:UpdateWeightsTextboxes()
				end, 
				function() 
                    local classesForDropDown = 
                    {
                        {["text"] = "Deathknight",["value"] = "Deathknight"} ,
                        {["text"] = "Monk" ,      ["value"] = "Monk"   },
                        {["text"] = "Warrior" ,   ["value"] = "Warrior" },
                        {["text"] = "Paladin" ,   ["value"] = "Paladin" },
                        {["text"] = "Druid" ,     ["value"] = "Druid"  },
                        {["text"] = "Rogue" ,     ["value"] = "Rogue"  },
                        {["text"] = "Shaman" ,    ["value"] = "Shaman" },
                        {["text"] = "Hunter" ,    ["value"] = "Hunter" },
                        {["text"] = "Mage" ,      ["value"] = "Mage"   },
                        {["text"] = "Priest" ,    ["value"] = "Priest" },
                        {["text"] = "Warlock" ,    ["value"] = "Warlock" }
                    }                    
					return classesForDropDown

				end)
		dropdown:SetPoint("LEFT", classDropDownLabel, "RIGHT", -10)
        
        TryToSetCurrentClass()        
        
        top = top - 40       

        local specizlizationDropDownLabel = frame:CreateFontString("DugisGearWeightsSpecializationDropdownLabel","ARTWORK", "GameFontNormal")
		specizlizationDropDownLabel:SetText(L["Specialization"])
		specizlizationDropDownLabel:SetWidth(specizlizationDropDownLabel:GetStringWidth())
		specizlizationDropDownLabel:SetHeight(40)
		specizlizationDropDownLabel:SetPoint("TOPLEFT", frame, "TOPLEFT", 16, top)
        
        function IsSpecializationAvaliable(specIndex)
            return DugisGuideViewer.Modules.GearAdvisor:SpecExists(specIndex)
        end
        
		dropdown = self:CreateDropdown(
            "DugisGearWeightsSpecializationDropdown", 
            frame, 
            nil, 
            nil, 
            function(button)
                Lib_UIDropDownMenu_SetSelectedValue(DugisGearWeightsSpecializationDropdown, button.value)
                DugisGuideViewer.Modules.GearAdvisor.selectedSpecIndex = Lib_UIDropDownMenu_GetSelectedID(DugisGearWeightsSpecializationDropdown)
                DugisGuideViewer.Modules.GearAdvisor:UpdateWeightsTextboxes()
            end, 
            function() 
                local specializationNames = {}
                
                local class = DugisGuideViewer.Modules.GearAdvisor:GetCurrentSelectedClassIdentifier()
                local specializations = DugisGuideViewer.Modules.GearAdvisor.classIdentifier2SpecializationsMap[class]                
                LuaUtils:foreach(specializations, function(specialization)
                    local name =  specialization["name"]
                    specializationNames[#specializationNames + 1] = name
                end)
                
                Lib_UIDropDownMenu_SetWidth(DugisGearWeightsSpecializationDropdown, 100,0)
                return specializationNames
		end)
        
		dropdown:SetPoint("LEFT", specizlizationDropDownLabel, "RIGHT", -10)        
          
        top = top - 40
        
        local weightsTop = 10
        
        local scrollFrame = GUIUtils:CreateScrollFrame(frame)
        
		scrollFrame.frame:EnableMouseWheel(true)
		scrollFrame.frame:SetScript("OnMouseWheel", function(self, delta)
			DugisGuideViewer.Modules.GearAdvisor.scrollFrame.scrollBar:SetValue(DugisGuideViewer.Modules.GearAdvisor.scrollFrame.scrollBar:GetValue() - delta * 24)  
		end)          
        
        scrollFrame.frame:SetPoint("TOPLEFT", frame,"TOPLEFT", 300, -44)
        
        scrollFrame.scrollBar:SetHeight(250)
        scrollFrame.scrollBar:ClearAllPoints()
        scrollFrame.scrollBar:SetPoint("TOPLEFT", frame, "TOPLEFT", 552, -57)
        
        local content = CreateFrame("Frame", nil, scrollFrame.frame)
        content:ClearAllPoints()
        content:SetSize(528, 440)
        scrollFrame.frame:SetHeight(273)
        
        local texture = content:CreateTexture()
        
        content:Show()
        
        LuaUtils:loop(28, function(item)
            local weightLabel = content:CreateFontString("GA_TextWeight"..item,"ARTWORK", "GameFontNormal")
            weightLabel:SetText(L["Weight"]..item)
            weightLabel:SetWidth(150)
            weightLabel:SetHeight(40)
            weightLabel:ClearAllPoints( )
            weightLabel:SetPoint("TOPLEFT", content, "TOPLEFT", 6, weightsTop)
            weightLabel:SetJustifyH("LEFT")
            weightLabel:Hide()
        
            -- new profile
            local textBox = CreateFrame("EditBox", "GA_EditBoxWeight"..item,  content, "InputBoxTemplate")
            textBox:SetMultiLine(false)
            textBox:SetSize(50, 15)
            textBox:SetAutoFocus(false)
            textBox:ClearAllPoints( )
            textBox:SetPoint("TOPLEFT",weightLabel,"TOPLEFT", 160, -12)
            textBox:Hide()
            textBox:SetText("0.4") 
            weightsTop = weightsTop - 22            
        end)
        
        scrollFrame.frame.content = content
		scrollFrame.frame:SetScrollChild(content) 
      
        DugisGuideViewer.Modules.GearAdvisor.scrollFrame = scrollFrame
      
		local button = CreateFrame("Button", "GA_ResetWeightsButton", frame, "UIPanelButtonTemplate")
		local btnText = L["Reset Scores"]
		local fontwidth = DugisGuideViewer:GetFontWidth(btnText, "GameFontHighlight")
		button:SetText(btnText)
		button:SetWidth(fontwidth + 30)
		button:SetHeight(22)
		button:SetPoint("TOPLEFT", frame, "TOPLEFT", 16, top-3)
		button:RegisterForClicks("LeftButtonUP")
		button:SetScript("OnClick", function() 
            DugisGuideViewer.Modules.GearAdvisor:ResetWeights()
		end)		
        
        button = CreateFrame("Button", "GA_ApplyWeightsButton", frame, "UIPanelButtonTemplate")
		local btnText = L["Apply"]
		local fontwidth = DugisGuideViewer:GetFontWidth(btnText, "GameFontHighlight")
		button:SetText(btnText)
		button:SetWidth(fontwidth + 30)
		button:SetHeight(22)
		button:SetPoint("TOPLEFT", frame, "TOPLEFT", 146, top-3)
		top = top-3-button:GetHeight()
		button:RegisterForClicks("LeftButtonUP")
		button:SetScript("OnClick", function() 
            DugisGuideViewer.Modules.GearAdvisor:ApplyWeights()
		end)
	end
    
    if category == "Gear Scoring" then
        if DugisGearWeightsClassDropdownLabel then
            TryToSetCurrentClass()
            TryToSetCurrentSpecialization()
            DugisGuideViewer.Modules.GearAdvisor:UpdateWeightsTextboxes()    
        end
    end
    
    
		
	--Disable Ant Trail option

	if DugisGuideViewer.carboniteloaded and SettingsDB[DGV_SHOWANTS].category==category then
		local ChkBox = _G["DGV.ChkBox"..DGV_SHOWANTS]

		--ChkBox:SetChecked(false)
		ChkBox:Disable()
		ChkBox.Text:SetTextColor(0.5, 0.5, 0.5)
	
	elseif SettingsDB[DGV_CARBONITEARROW].category==category then
		local ChkBox = _G["DGV.ChkBox"..DGV_CARBONITEARROW]

		--ChkBox:SetChecked(false)
		ChkBox:Disable()
		ChkBox.Text:SetTextColor(0.5, 0.5, 0.5) 	
	end

	if not DugisGuideViewer.tomtomloaded and SettingsDB[DGV_TOMTOMARROW].category==category  then
		local ChkBox = _G["DGV.ChkBox"..DGV_TOMTOMARROW]		

		--ChkBox:SetChecked(false)
		ChkBox:Disable() 
		ChkBox.Text:SetTextColor(0.5, 0.5, 0.5) 		
	end
	
	if DugisGuideViewer.tomtomloaded and SettingsDB[DGV_TOMTOMEMULATION].category==category  then
		local ChkBox = _G["DGV.ChkBox"..DGV_TOMTOMEMULATION]		

		--ChkBox:SetChecked(false)
		ChkBox:Disable() 
		ChkBox.Text:SetTextColor(0.5, 0.5, 0.5) 		
	end	
	
	if (DugisGuideViewer.tomtomloaded or DugisGuideViewer.mapsterloaded) and SettingsDB[DGV_DISPLAYMAPCOORDINATES].category==category  then
		local ChkBox = _G["DGV.ChkBox"..DGV_DISPLAYMAPCOORDINATES]		

		ChkBox:SetChecked(false)
		ChkBox:Disable() 
		ChkBox.Text:SetTextColor(0.5, 0.5, 0.5) 		
	end	

	if ((DugisGuideViewer.carboniteloaded and Nx.Quest) or DugisGuideViewer.sexymaploaded or DugisGuideViewer.nuiloaded or DugisGuideViewer.elvuiloaded or DugisGuideViewer.tukuiloaded or DugisGuideViewer.shestakuiloaded) and SettingsDB[DGV_MOVEWATCHFRAME].category==category then
		DugisGuideViewer:SetDB(false, DGV_MOVEWATCHFRAME)
		Disable(_G["DGV.ChkBox"..DGV_MOVEWATCHFRAME]) 		

		DugisGuideViewer:SetDB(false, DGV_DISABLEWATCHFRAMEMOD)
		Disable(_G["DGV.ChkBox"..DGV_DISABLEWATCHFRAMEMOD])
	elseif SettingsDB[DGV_MOVEWATCHFRAME].category==category and not self:UserSetting(DGV_MOVEWATCHFRAME) then
		Disable(_G["DGV.ChkBox"..DGV_DISABLEWATCHFRAMEMOD])
	elseif SettingsDB[DGV_MOVEWATCHFRAME].category==category and self:UserSetting(DGV_MOVEWATCHFRAME) then
		Enable(_G["DGV.ChkBox"..DGV_DISABLEWATCHFRAMEMOD])		
	end
	
	if ((DugisGuideViewer.carboniteloaded and Nx.Quest) or DugisGuideViewer.sexymaploaded or DugisGuideViewer.nuiloaded or DugisGuideViewer.elvuiloaded or DugisGuideViewer.tukuiloaded or DugisGuideViewer.shestakuiloaded) and SettingsDB[DGV_WATCHFRAMEBORDER].category==category  then
		local ChkBox = _G["DGV.ChkBox"..DGV_WATCHFRAMEBORDER]		

		ChkBox:SetChecked(false)
		ChkBox:Disable() 
		ChkBox.Text:SetTextColor(0.5, 0.5, 0.5) 		
	end		
	
	if SettingsDB[DGV_ANCHOREDSMALLFRAME].category==category then
		local ChkBox = _G["DGV.ChkBox"..DGV_ANCHOREDSMALLFRAME]
		if not ((DugisGuideViewer.carboniteloaded and Nx.Quest) or DugisGuideViewer.sexymaploaded or DugisGuideViewer.nuiloaded or DugisGuideViewer.elvuiloaded or DugisGuideViewer.tukuiloaded or DugisGuideViewer.shestakuiloaded)
		then
			Enable(ChkBox)
		else
			Disable(ChkBox)
		end
	end
	
	if not DugisGuideViewer:UserSetting(DGV_AUTOREPAIR) then
		DugisGuideViewer:SetDB(false, DGV_AUTOREPAIRGUILD)
		local Chk = _G["DGV.ChkBox"..DGV_AUTOREPAIRGUILD]
		Disable(Chk)
	else
		local Chk = _G["DGV.ChkBox"..DGV_AUTOREPAIRGUILD]
		Enable(Chk)
	end
	
	--Reset Frames Position Button
	if category=="Frames" and not DGV_ResetFramesButton then

		local button = CreateFrame("Button", "DGV_ResetFramesButton", frame, "UIPanelButtonTemplate")
		local btnText = L["Reset Frames Position"]
		local fontwidth = DugisGuideViewer:GetFontWidth(btnText, "GameFontHighlight")
		button:SetText(btnText)
		button:SetWidth(fontwidth + 30)
		button:SetHeight(22)
		button:SetPoint("TOPLEFT", frame, "TOPLEFT", 16, top-3)
		top = top-3-button:GetHeight()
		--button:SetPoint("TOPLEFT", "DGV.ChkBox6", "BOTTOMLEFT", "0", "-3")
		button:RegisterForClicks("LeftButtonUP")
		button:SetScript("OnClick", function() DugisGuideViewer:InitFramePositions() end)
	end	
    
	--Reset Tracking Points
	if category=="Maps" and not DGV_ResetTrackingPointsButton and DugisGuideViewer:IsModuleRegistered("Guides") then

		local button = CreateFrame("Button", "DGV_ResetTrackingPointsButton", frame, "UIPanelButtonTemplate")
		local btnText = L["Reset Tracking Points"]
		local fontwidth = DugisGuideViewer:GetFontWidth(btnText, "GameFontHighlight")
		button:SetText(btnText)
		button:SetWidth(fontwidth + 30)
		button:SetHeight(22)
		button:SetPoint("TOPLEFT", frame, "TOPLEFT", 16, top-3)
		top = top-3-button:GetHeight()
		--button:SetPoint("TOPLEFT", "DGV.ChkBox6", "BOTTOMLEFT", "0", "-3")
		button:RegisterForClicks("LeftButtonUP")
		button:SetScript("OnClick", function() 
            DugisGuideUser.excludedTrackingPoints = {}
            WorldMapFrame_UpdateMap()
        end)
	end
	
	--Reset Profile Button
	if category=="Profiles" and not DGV_ResetProfileButton then
		local button = CreateFrame("Button", "DGV_ResetProfileButton", frame, "UIPanelButtonTemplate")
		local btnText = L["Reset Profile"]
		local fontwidth = DugisGuideViewer:GetFontWidth(btnText, "GameFontHighlight")
		button:SetText(btnText)
		button:SetWidth(fontwidth + 30)
		button:SetHeight(22)
		button:SetPoint("TOPLEFT", frame, "TOPLEFT", 16, top-3)
		top = top-3-button:GetHeight()
		--button:SetPoint("TOPLEFT", "DGV.ChkBox6", "BOTTOMLEFT", "0", "-3")
		button:RegisterForClicks("LeftButtonUP")
		button:SetScript("OnClick", function() 
			DugisGuideViewer.db:ResetProfile()
		end)
	end
	
	--Memory settings Apply button
	if category=="Memory" and not DGV_MemoryApplyButton and DugisGuideViewer:IsModuleRegistered("Guides") then
		local button = CreateFrame("Button", "DGV_MemoryApplyButton", frame, "UIPanelButtonTemplate")
		local btnText = L["Apply Memory Settings"]
		local fontwidth = DugisGuideViewer:GetFontWidth(btnText, "GameFontHighlight")
		button:SetText(btnText)
		button:SetWidth(fontwidth + 30)
		button:SetHeight(22)
		button:SetPoint("TOPLEFT", frame, "TOPLEFT", 16, top-3)
		top = top-3-button:GetHeight()
		button:RegisterForClicks("LeftButtonUP")
		button:SetScript("OnClick", function() DugisGuideViewer:ReloadModules() end)
	end
	
	--[[--Memory settings Garbage Collect
	if category=="Memory" then
		local button = CreateFrame("Button", "DGV_CollectGarbageButton", frame, "UIPanelButtonTemplate")
		local btnText = L["Collect Garbage"]
		local fontwidth = DugisGuideViewer:GetFontWidth(btnText, "GameFontHighlight")
		button:SetText(btnText)
		button:SetWidth(fontwidth + 30)
		button:SetHeight(22)
		button:SetPoint("TOPLEFT", frame, "TOPLEFT", 16, top-3)
		top = top-3-button:GetHeight()
		button:RegisterForClicks("LeftButtonUP")
		button:SetScript("OnClick", function() collectgarbage() end)
	end]]

	top = top - 24
	--Guide Suggest Difficulty Dropdown
	if SettingsDB[DGV_GUIDEDIFFICULTY].category==category
		and(not DugisGuideViewer:GetDB(DGV_GUIDEDIFFICULTY, "module")
		or DugisGuideViewer:IsModuleRegistered(DugisGuideViewer:GetDB(DGV_GUIDEDIFFICULTY, "module")))
		and not DGV_GuideSuggestDropdown
	then
		local dropdown = self:CreateDropdown("DGV_GuideSuggestDropdown", frame, "Leveling Mode", DGV_GUIDEDIFFICULTY, self.GuideSuggestDropDown_OnClick)
		dropdown:SetPoint("TOPLEFT", frame, "TOPLEFT", 3, top)
		--top = top-22-dropdown:GetHeight()
	end
	if DGV_GuideSuggestDropdown then
		Lib_UIDropDownMenu_Initialize(DGV_GuideSuggestDropdown, DGV_GuideSuggestDropdown.initFunc)
		Lib_UIDropDownMenu_SetSelectedValue(DGV_GuideSuggestDropdown, DugisGuideViewer:UserSetting(DGV_GUIDEDIFFICULTY))
	end
	
	--Status Frame Effect Dropdown
	if SettingsDB[DGV_SMALLFRAMETRANSITION].category==category 
		and(not DugisGuideViewer:GetDB(DGV_SMALLFRAMETRANSITION, "module") 
		or DugisGuideViewer:IsModuleRegistered(DugisGuideViewer:GetDB(DGV_SMALLFRAMETRANSITION, "module")))
		and not DGV_StatusFrameEffectDropdown
	then
		local dropdown = self:CreateDropdown("DGV_StatusFrameEffectDropdown", frame, "Small Frame Effect", DGV_SMALLFRAMETRANSITION, self.StatusFrameEffectDropDown_OnClick)
		dropdown:SetPoint("TOPLEFT", frame, "TOPLEFT", 3, top)
	end
	if DGV_StatusFrameEffectDropdown then
		Lib_UIDropDownMenu_Initialize(DGV_StatusFrameEffectDropdown, DGV_StatusFrameEffectDropdown.initFunc)
		Lib_UIDropDownMenu_SetSelectedValue(DGV_StatusFrameEffectDropdown, DugisGuideViewer:UserSetting(DGV_SMALLFRAMETRANSITION))
	end

	--Large Frame Border  Dropdown
	if SettingsDB[DGV_LARGEFRAMEBORDER].category==category  and not DGV_LargeFrameBorderDropdown then
		local dropdown = self:CreateDropdown("DGV_LargeFrameBorderDropdown", frame, "Borders", DGV_LARGEFRAMEBORDER, self.LargeFrameBorderDropdown_OnClick)
		local left = 3
		if DGV_StatusFrameEffectDropdownTitle then left = DGV_StatusFrameEffectDropdownTitle:GetWidth() + 20 end
		dropdown:SetPoint("TOPLEFT", frame, "TOPLEFT", left, top)
		top = top-22-dropdown:GetHeight()
	end
	if DGV_LargeFrameBorderDropdown then
		Lib_UIDropDownMenu_Initialize(DGV_LargeFrameBorderDropdown, DGV_LargeFrameBorderDropdown.initFunc)
		Lib_UIDropDownMenu_SetSelectedValue(DGV_LargeFrameBorderDropdown, DugisGuideViewer:UserSetting(DGV_LARGEFRAMEBORDER))
	end
	
	--Step Complete Sound Dropdown
	if SettingsDB[DGV_STEPCOMPLETESOUND].category==category
		and(not DugisGuideViewer:GetDB(DGV_STEPCOMPLETESOUND, "module")
		or DugisGuideViewer:IsModuleRegistered(DugisGuideViewer:GetDB(DGV_STEPCOMPLETESOUND, "module")))
		and not DGV_StepCompleteSoundDropdown
	then
		local dropdown = self:CreateDropdown("DGV_StepCompleteSoundDropdown", frame, "Step Complete Sound", DGV_STEPCOMPLETESOUND, self.StepCompleteSoundDropdown_OnClick)
		local left = 3
		if DGV_GuideSuggestDropdownTitle then left = DGV_GuideSuggestDropdownTitle:GetWidth() + 20 end
		dropdown:SetPoint("TOPLEFT", frame, "TOPLEFT", left, top)
		top = top-22-dropdown:GetHeight()
	elseif SettingsDB[DGV_STEPCOMPLETESOUND].category==category and DGV_GuideSuggestDropdown then
		top = top-22-DGV_GuideSuggestDropdown:GetHeight()
	end
	if DGV_StepCompleteSoundDropdown then
		Lib_UIDropDownMenu_Initialize(DGV_StepCompleteSoundDropdown, DGV_StepCompleteSoundDropdown.initFunc)
		Lib_UIDropDownMenu_SetSelectedValue(DGV_StepCompleteSoundDropdown, DugisGuideViewer:UserSetting(DGV_STEPCOMPLETESOUND))
	end

	--Ant Trail Color Dropdown
	if SettingsDB[DGV_ANTCOLOR].category==category and not DGV_AntColorDropdown then
		local dropdown = self:CreateDropdown("DGV_AntColorDropdown", frame, "Ant Trail Color", DGV_ANTCOLOR, self.AntColorDropdown_OnClick)
		dropdown:SetPoint("TOPLEFT", frame, "TOPLEFT", 3, top)
	end
	if DGV_AntColorDropdown then
		Lib_UIDropDownMenu_Initialize(DGV_AntColorDropdown, DGV_AntColorDropdown.initFunc)
		Lib_UIDropDownMenu_SetSelectedValue(DGV_AntColorDropdown, DugisGuideViewer:UserSetting(DGV_ANTCOLOR))
	end
	
	--Flightmaster Handling Dropdown
	if SettingsDB[DGV_TAXIFLIGHTMASTERS].category==category and not DGV_TaxiFlightmasterDropdown then
		local dropdown = self:CreateDropdown("DGV_TaxiFlightmasterDropdown", frame, "Use Flightmasters", DGV_TAXIFLIGHTMASTERS, self.TaxiFlightmasterDropdown_OnClick)
		local left = 3
		if DGV_AntColorDropdownTitle then left = DGV_AntColorDropdownTitle:GetWidth() + 20 end
		dropdown:SetPoint("TOPLEFT", frame, "TOPLEFT", left, top)
		top = top-22-dropdown:GetHeight()
	end
	if DGV_TaxiFlightmasterDropdown then
		Lib_UIDropDownMenu_Initialize(DGV_TaxiFlightmasterDropdown, DGV_TaxiFlightmasterDropdown.initFunc)
		Lib_UIDropDownMenu_SetSelectedValue(DGV_TaxiFlightmasterDropdown, DugisGuideViewer:UserSetting(DGV_TAXIFLIGHTMASTERS))
	end	

	--Quest Complete Sound Dropdown
	if SettingsDB[DGV_QUESTCOMPLETESOUND].category==category
		and(not DugisGuideViewer:GetDB(DGV_QUESTCOMPLETESOUND, "module")
		or DugisGuideViewer:IsModuleRegistered(DugisGuideViewer:GetDB(DGV_QUESTCOMPLETESOUND, "module")))
		and not DGV_QuestCompleteSoundDropdown
	then
		local dropdown = self:CreateDropdown("DGV_QuestCompleteSoundDropdown", frame, "Quest Complete Sound", DGV_QUESTCOMPLETESOUND, self.QuestCompleteSoundDropdown_OnClick)
		dropdown:SetPoint("TOPLEFT", frame, "TOPLEFT", 3, top)
		top = top-22-dropdown:GetHeight()
	end
	if DGV_QuestCompleteSoundDropdown then
		Lib_UIDropDownMenu_Initialize(DGV_QuestCompleteSoundDropdown, DGV_QuestCompleteSoundDropdown.initFunc)
		Lib_UIDropDownMenu_SetSelectedValue(DGV_QuestCompleteSoundDropdown, DugisGuideViewer:UserSetting(DGV_QUESTCOMPLETESOUND))
	end
	
	--Tooltip Anchor
	if SettingsDB[DGV_TOOLTIPANCHOR].category==category  and not DGV_TooltipAnchorDropdown then
		local dropdown = self:CreateDropdown("DGV_TooltipAnchorDropdown", frame, "Tooltip Anchor", DGV_TOOLTIPANCHOR, self.TooltipAnchorDropdown_OnClick)
		dropdown:SetPoint("TOPLEFT", frame, "TOPLEFT", 3, top)
		top = top-22-dropdown:GetHeight()
	end
	if DGV_TooltipAnchorDropdown then
		Lib_UIDropDownMenu_Initialize(DGV_TooltipAnchorDropdown, DGV_TooltipAnchorDropdown.initFunc)
		Lib_UIDropDownMenu_SetSelectedValue(DGV_TooltipAnchorDropdown, DugisGuideViewer:UserSetting(DGV_TOOLTIPANCHOR))
	end
	
	--Map Preview POIs
	if SettingsDB[DGV_MAPPREVIEWPOIS].category==category and not DGV_MapPreviewPOIsDropdown then
		local dropdown = self:CreateDropdown("DGV_MapPreviewPOIsDropdown", frame, "Preview Quest Objectives", DGV_MAPPREVIEWPOIS, self.MapPreviewPOIsDropdown_OnClick)
		dropdown:SetPoint("TOPLEFT", frame, "TOPLEFT", 3, top)
		top = top-22-dropdown:GetHeight()
	end
	if DGV_MapPreviewPOIsDropdown then
		Lib_UIDropDownMenu_Initialize(DGV_MapPreviewPOIsDropdown, DGV_MapPreviewPOIsDropdown.initFunc)
		Lib_UIDropDownMenu_SetSelectedValue(DGV_MapPreviewPOIsDropdown, DugisGuideViewer:UserSetting(DGV_MAPPREVIEWPOIS))
	end

	if DugisGuideViewer:IsModuleRegistered("SmallFrame") and SettingsDB[DGV_DISPLAYPRESET].category==category and not DGV_DisplayPresetDropdown then
		local dropdown = self:CreateDropdown("DGV_DisplayPresetDropdown", frame, "Recommended Preset Settings", DGV_DISPLAYPRESET, self.DisplayPresetDropdown_OnClick)
		dropdown:SetPoint("TOPLEFT", frame, "TOPLEFT", 3, top)
		top = top-22-dropdown:GetHeight()
	end
	if DugisGuideViewer:IsModuleRegistered("SmallFrame") and DGV_DisplayPresetDropdown then
		Lib_UIDropDownMenu_Initialize(DGV_DisplayPresetDropdown, DGV_DisplayPresetDropdown.initFunc)
		Lib_UIDropDownMenu_SetSelectedValue(DGV_DisplayPresetDropdown, DugisGuideViewer:UserSetting(DGV_DISPLAYPRESET))
	end
	
	if DugisGuideViewer:IsModuleRegistered("SmallFrame") and SettingsDB[DGV_SMALLFRAMEDOCKING].category==category and not DGV_SmallFrameDockingDropdown then
		local dropdown = self:CreateDropdown("DGV_SmallFrameDockingDropdown", frame, SettingsDB[DGV_SMALLFRAMEDOCKING].text, DGV_SMALLFRAMEDOCKING, self.SmallFrameDockingDropdown_OnClick)

		dropdown:SetPoint("TOPLEFT", frame, "TOPLEFT", 3, top)
		top = top-22-dropdown:GetHeight()
	end
	if DugisGuideViewer:IsModuleRegistered("SmallFrame") and DGV_SmallFrameDockingDropdown then
		Lib_UIDropDownMenu_Initialize(DGV_SmallFrameDockingDropdown, DGV_SmallFrameDockingDropdown.initFunc)
		Lib_UIDropDownMenu_SetSelectedValue(DGV_SmallFrameDockingDropdown, DugisGuideViewer:UserSetting(DGV_SMALLFRAMEDOCKING))
	end
	
	-- select profile
	if category=="Profiles" then
		local dropdown = DGV_SelectProfileDropdown
		if not dropdown then
			dropdown = self:CreateDropdown(
				"DGV_SelectProfileDropdown", 
				frame, 
				"Existing Profiles", 
				nil, 
				function(button) 
					DugisGuideViewer.db:SetProfile(button.value)
				end, 
				function() return getProfileList() end)
			dropdown:SetPoint("TOPLEFT", 3, top)
			top = top-22-dropdown:GetHeight()
		end
		Lib_UIDropDownMenu_SetSelectedValue(DGV_SelectProfileDropdown, DugisGuideViewer.db.keys.profile)
	end

	
	-- copy from profile
	if category=="Profiles" then
		local dropdown = DGV_CopyProfileDropdown
		if not dropdown then
			dropdown = self:CreateDropdown(
				"DGV_CopyProfileDropdown", 
				frame, 
				"Copy From", 
				nil, 
				function(button)
					DugisGuideViewer.db:CopyProfile(button.value)
				end, 
				function() return getProfileList(true, true) end)
			dropdown:SetPoint("TOPLEFT", 3, top)
			top = top-22-dropdown:GetHeight()
		end
	end
	
	-- delete a profile
	if category=="Profiles" then
		local dropdown = DGV_DeleteProfileDropdown
		if not dropdown then
			dropdown = self:CreateDropdown(
				"DGV_DeleteProfileDropdown", 
				frame, 
				"Delete a Profile", 
				nil, 
				function(button)
					DugisGuideViewer.db:DeleteProfile(button.value)
				end, 
				function() return getProfileList(true, true) end)
			dropdown:SetPoint("TOPLEFT", 3, top)
			top = top-22-dropdown:GetHeight()
		end
	end
	
	--Show Tooltip Slider
	if SettingsDB[DGV_SHOWTOOLTIP].category==category and not DGV_ShowTooltipSlider and DugisGuideViewer:IsModuleLoaded("SmallFrame") then
		local slider = self:CreateSlider("DGV_ShowTooltipSlider", frame, SettingsDB[DGV_SHOWTOOLTIP].text, 
			DGV_SHOWTOOLTIP, 0, 30, 1, 5, "0", "30", function() DugisGuideViewer:ShowAutoTooltip() end)
		slider:SetPoint("TOPLEFT", frame, "TOPLEFT", 23, top)
		top = top-30-slider:GetHeight()
	end
	if DGV_ShowTooltipSlider then
		DGV_ShowTooltipSlider:SetValue(DugisGuideViewer:GetDB(DGV_SHOWTOOLTIP) or 5)
	end
	
	--DGV_SMALLFRAMEFONTSIZE
	if SettingsDB[DGV_SMALLFRAMEFONTSIZE].category==category and not DGV_SmallFrameFontSize then
		local slider = self:CreateSlider("DGV_SmallFrameFontSize", frame, SettingsDB[DGV_SMALLFRAMEFONTSIZE].text, 
			DGV_SMALLFRAMEFONTSIZE, 10, 20, 1, 8, "10", "20")
		slider:HookScript("OnMouseUp", function()
			if DugisGuideViewer:IsModuleLoaded("SmallFrame") then
				DugisGuideViewer:UpdateSmallFrame()
                DugisGuideViewer.Modules.DugisWatchFrame:DelayUpdate()
			end
		end)
		top = -57
		slider:SetPoint("TOPLEFT", frame, "TOPLEFT", 350, top)
		top = top-35-slider:GetHeight()
	end
	if DGV_SmallFrameFontSize and DugisGuideViewer:IsModuleLoaded("SmallFrame") then
		DGV_SmallFrameFontSize:SetValue(DugisGuideViewer:GetDB(DGV_SMALLFRAMEFONTSIZE) or 5)
	end
    
	--DGV_TARGETBUTTONSCALE
	if SettingsDB[DGV_TARGETBUTTONSCALE].category==category and not DGV_TargetButtonScale then
		local slider = self:CreateSlider("DGV_TargetButtonScale", frame, SettingsDB[DGV_TARGETBUTTONSCALE].text, 
			DGV_TARGETBUTTONSCALE, 1, 10, 1, 1, "1", "10")
		slider:HookScript("OnMouseUp", function()
			if DugisGuideViewer:IsModuleLoaded("Target") then
				DugisGuideViewer:FinalizeTarget()
			end
		end)
		top = -57
		slider:SetPoint("TOPLEFT", frame, "TOPLEFT", 350, top)
		top = top-35-slider:GetHeight()
	end
	if DGV_TargetButtonScale and DugisGuideViewer:IsModuleLoaded("Target") then
		DGV_TargetButtonScale:SetValue(DugisGuideViewer:GetDB(DGV_TARGETBUTTONSCALE) or 5)
	
	end
	
	--DGV_ITEMBUTTONSCALE
	if SettingsDB[DGV_ITEMBUTTONSCALE].category==category and not DGV_ItemButtonScale then
		local slider = self:CreateSlider("DGV_ItemButtonScale", frame, SettingsDB[DGV_ITEMBUTTONSCALE].text, 
			DGV_ITEMBUTTONSCALE, 1, 10, 1, 1, "1", "10")
		slider:HookScript("OnMouseUp", function()
			if DugisGuideViewer:IsModuleLoaded("Guides") then
				DugisGuideViewer.DoOutOfCombat(SetUseItem, DugisGuideUser.CurrentQuestIndex)
			elseif DugisGuideViewer:IsModuleLoaded("DugisArrow") then
				local questId = DugisGuideViewer.DugisArrow:GetFirstWaypointQuestId()
				DugisGuideViewer.DoOutOfCombat(SetUseItemByQID, questId)
			end
		end)
		top = -92
		slider:SetPoint("TOPLEFT", frame, "TOPLEFT", 325, top)
		top = top-30-slider:GetHeight()
	end
	if DGV_ItemButtonScale then
		DGV_ItemButtonScale:SetValue(DugisGuideViewer:GetDB(DGV_ITEMBUTTONSCALE) or 5)
	end	
    
    local old_DGV_JOURNALFRAMEBUTTONSCALE = DugisGuideViewer:UserSetting(DGV_JOURNALFRAMEBUTTONSCALE)
    --DGV_JOURNALFRAMEBUTTONSCALE
	if SettingsDB[DGV_JOURNALFRAMEBUTTONSCALE].category==category and not DGV_JournalframeButtonScale and DugisGuideViewer:IsModuleLoaded("NPCJournalFrame") then
		local slider = self:CreateSlider("DGV_JournalframeButtonScale", frame, SettingsDB[DGV_JOURNALFRAMEBUTTONSCALE].text, 
			DGV_JOURNALFRAMEBUTTONSCALE, 1, 10, 1, 4, "1", "10", function()
                if old_DGV_JOURNALFRAMEBUTTONSCALE ~= DugisGuideViewer:UserSetting(DGV_JOURNALFRAMEBUTTONSCALE) then
                    DugisGuideViewer.NPCJournalFrame.sidebarButtonFrame:RestoreSidebarIconPosition()
                    old_DGV_JOURNALFRAMEBUTTONSCALE = DugisGuideViewer:UserSetting(DGV_JOURNALFRAMEBUTTONSCALE)
                end
            end)
		top = -117
		slider:SetPoint("TOPLEFT", frame, "TOPLEFT", 350, top)
		top = top-30-slider:GetHeight()
	end
	if DGV_JournalframeButtonScale then
		DGV_JournalframeButtonScale:SetValue(DugisGuideViewer:GetDB(DGV_JOURNALFRAMEBUTTONSCALE) or 4)
	end	    
	
	--Map Preview Slider
	if SettingsDB[DGV_MAPPREVIEWDURATION].category==category and not DGV_MapPreviewSlider then
		local slider = self:CreateSlider("DGV_MapPreviewSlider", frame, SettingsDB[DGV_MAPPREVIEWDURATION].text, 
			DGV_MAPPREVIEWDURATION, 0, 30, 1, 10, "0", "30")
		slider:HookScript("OnMouseUp", function()
			if DugisGuideViewer:IsModuleLoaded("MapPreview") then
				DugisGuideViewer.MapPreview:ConfigChanged()
			end
		end)
		slider:SetPoint("TOPLEFT", frame, "TOPLEFT", 23, top)
		if DugisGuideViewer.carboniteloaded then
			_G[slider:GetName() .. 'Text']:SetTextColor(0.5, 0.5, 0.5)
			_G[slider:GetName() .. 'Low']:SetTextColor(0.5, 0.5, 0.5)
			_G[slider:GetName() .. 'High']:SetTextColor(0.5, 0.5, 0.5)
			slider:Disable()
		end
		top = top-30-slider:GetHeight()
	end
	if DGV_MapPreviewSlider then
		DGV_MapPreviewSlider:SetValue(DugisGuideViewer:GetDB(DGV_MAPPREVIEWDURATION) or 1)
	end
	
	if SettingsDB[DGV_BLINKMINIMAPICONS].category==category and DugisGuideViewer.zygorloaded then
		Disable(_G["DGV.ChkBox"..DGV_BLINKMINIMAPICONS])
	end
	
	return frame
end

local function IterateReturns(...)
		local i, tbl = 0, {...}
		return function ()
			i = i + 1
			if i <= #(tbl) then return tbl[i] end
		end
	end

function DugisGuideViewer:CreateSettingsTree(parent)
	if DugisGuideViewer.SettingsTree then
		DugisGuideViewer.SettingsTree.frame:ClearAllPoints()
		DugisGuideViewer.SettingsTree.frame:Hide()
		AceGUI:Release(DugisGuideViewer.SettingsTree)
	end
	settingsMenuTreeGroup = AceGUI:Create("TreeGroup")
	settingsMenuTreeGroup:SetTree(CATEGORY_TREE)		
	settingsMenuTreeGroup:EnableButtonTooltips(false)
	--settingsMenuTreeGroup.frame:SetBackdrop(nil);
	settingsMenuTreeGroup.frame:SetParent(parent)
	settingsMenuTreeGroup.treeframe:SetBackdropColor(0,0,0,0);
	settingsMenuTreeGroup.border:SetBackdropColor(0,0,0,0);
	settingsMenuTreeGroup.frame:SetPoint("TOPLEFT", parent, "TOPLEFT", 12, 0)
	settingsMenuTreeGroup.frame:SetPoint("BOTTOMRIGHT", parent, "BOTTOMRIGHT", 0, 12)
				
	settingsMenuTreeGroup:SetCallback("OnGroupSelected", function(group, event, value)
		for child in IterateReturns(settingsMenuTreeGroup.border:GetChildren()) do
			child:Hide()
		end
		GetSettingsCategoryFrame(value, settingsMenuTreeGroup.border):Show()

	end)
	settingsMenuTreeGroup:SelectByValue(CATEGORY_TREE[1].value)
	settingsMenuTreeGroup.frame:Show()
	settingsMenuTreeGroup.frame:GetScript("OnSizeChanged")(settingsMenuTreeGroup.frame)
	DugisGuideViewer.SettingsTree = settingsMenuTreeGroup;
    
    UpdateLeftMenu()    
end

function DugisGuideViewer:ForceAllSettingsTreeCategories()
	for _,node in ipairs(CATEGORY_TREE) do
        if DugisGuideViewer.SettingsTree then
            GetSettingsCategoryFrame(node.value, DugisGuideViewer.SettingsTree.border):Hide()
        end
	end
	local tree = DugisGuideViewer.SettingsTree
    if not tree then
        return
    end
	local status = tree.status or tree.localstatus
	tree:SelectByValue(status.selected)
end

--Weapon Preference Dropdown
function DugisGuideViewer.WeaponPreference_OnClick(button)
	Lib_UIDropDownMenu_SetSelectedValue(DGV_WeaponPreference, button.value )
	DugisGuideViewer:SetDB(button.value, DGV_WEAPONPREF)
end

--Smart Set Target Dropdown
function DugisGuideViewer.GASmartSetTargetDropdown_OnClick(button)
	Lib_UIDropDownMenu_SetSelectedValue(DGV_GASmartSetTargetDropdown, button.value )
	DugisGuideViewer:SetDB(button.value, DGV_GASMARTSETTARGET)
end

--StatCapLevelDifferenceDropdown
function DugisGuideViewer.StatCapLevelDifferenceDropdown_OnClick(button)
	Lib_UIDropDownMenu_SetSelectedValue(DGV_StatCapLevelDifferenceDropdown, button.value )
	DugisGuideViewer:SetDB(button.value, DGV_GASTATCAPLEVELDIFFERENCE)
	DugisGuideViewer.Modules.GearAdvisor.ResetCalculateScoreCache()
end


--Guide Suggest Dropdown
function DugisGuideViewer.GuideSuggestDropDown_OnClick(button)
	--Lib_UIDropDownMenu_SetSelectedID(DGV_GuideSuggestDropdown, button:GetID() )
	Lib_UIDropDownMenu_SetSelectedValue(DGV_GuideSuggestDropdown, button.value )
	
	DugisGuideViewer:SetDB(button.value, DGV_GUIDEDIFFICULTY)
	DebugPrint("button.value"..button.value.."button.id"..button:GetID())
	if DugisGuideViewer:IsModuleLoaded("Guides") then DugisGuideViewer:TabTextRefresh() end
end

--Status Frame Effect dropdown
function DugisGuideViewer.StatusFrameEffectDropDown_OnClick(button)
	Lib_UIDropDownMenu_SetSelectedID(DGV_StatusFrameEffectDropdown, button:GetID() )
	DugisGuideViewer:SetDB(button.value, DGV_SMALLFRAMETRANSITION)
	
	local options = DugisGuideViewer:GetDB(DGV_SMALLFRAMETRANSITION, "options")
	if button.value == options[1].text then
		--UIFrameFadeIn(DugisSmallFrame, 0.8, 0, 1)
		DugisGuideViewer.Modules.SmallFrame:PlayFlashAnimation( )
		DugisGuideViewer.Modules.DugisWatchFrame:PlayFlashAnimation( )
	elseif button.value == options[2].text then
		DugisGuideViewer.Modules.SmallFrame:StartFrameTransition( )
	end
end

function DugisGuideViewer:SetFrameBackdrop(frame, bgFile, edgeFile, left, right, top, bottom, edgeSize)
	if not frame then return end
	if not bgFile and not edgeFile then
		frame:SetBackdrop(nil)
	else
		frame:SetBackdrop( { 
			bgFile = bgFile, 
			edgeFile = edgeFile, tile = true, tileSize = 32, edgeSize = edgeSize or 32, 
			insets = { left = left, right = right, top = top, bottom = bottom }
		})
	end
end

function DugisGuideViewer:GetBorderPath()
	return self.ARTWORK_PATH.."Border-"..DugisGuideViewer:UserSetting(DGV_LARGEFRAMEBORDER)
end

function DugisGuideViewer:SetAllBorders( )
	self:SetSmallFrameBorder( )
	self:SetFrameBackdrop(DugisMainBorder, DugisGuideViewer.chardb.EssentialsMode>0 and self.BACKGRND_PATH, self:GetBorderPath(), 10, 3, 11, 5)
	if DugisGuideViewer:IsModuleLoaded("ModelViewer") then
		self:SetFrameBackdrop(self.Modules.ModelViewer.Frame, self.BACKGRND_PATH, self:GetBorderPath(), 10, 4, 12, 5)
	end
	self:SetFrameBackdrop(DugisGuideSuggestFrame,  self.BACKGRND_PATH, self:GetBorderPath(), 10, 4, 12, 5)
	self:SetFrameBackdrop(DugisEquipPromptFrame,  self.BACKGRND_PATH, self:GetBorderPath(), 10, 4, 12, 5)
	if DugisGuideViewer:IsModuleLoaded("StickyFrame") then
		self:SetFrameBackdrop(self.Modules.StickyFrame.Frame, "Interface\\DialogFrame\\UI-DialogBox-Gold-Background", self:GetBorderPath(), 10, 4, 12, 5)
	end
	self:SetFrameBackdrop(DugisRecordFrame,  self.BACKGRND_PATH, self:GetBorderPath(), 10, 4, 12, 5)
    if GearFinderExtraItemsFrame then
        self:SetFrameBackdrop(GearFinderExtraItemsFrame,  self.BACKGRND_PATH, self:GetBorderPath(), 10, 4, 12, 5)
    end   
    
    if GearFinderTooltipFrame then
        self:SetFrameBackdrop(GearFinderTooltipFrame,  self.BACKGRND_PATH, self:GetBorderPath(), 10, 4, 12, 5)
    end
end

function DugisGuideViewer:SetSmallFrameBorder( )
	--Use same border as large frame
	if DugisGuideViewer:UserSetting(DGV_SMALLFRAMEBORDER) 
	then
		self:SetFrameBackdrop(DugisSmallFrameContainer, self.BACKGRND_PATH, self:GetBorderPath(), 10, 4, 12, 5)
	else
		self:SetFrameBackdrop(DugisSmallFrameContainer, nil)
	end
end

function DugisGuideViewer:DisplayPreset()
	if DugisGuideViewer:GetDB(DGV_DISPLAYPRESET)=="Minimal - No Borders" then 
		DugisGuideViewer:SetDB(false, DGV_ANCHOREDSMALLFRAME)
		_G["DGV.ChkBox"..DGV_ANCHOREDSMALLFRAME]:SetChecked(false)
		DugisGuideViewer:SetDB(true, DGV_ENABLEQW)
		_G["DGV.ChkBox"..DGV_ENABLEQW]:SetChecked(true)
		DugisGuideViewer:SetDB(false, DGV_MULTISTEPMODE)
		_G["DGV.ChkBox"..DGV_MULTISTEPMODE]:SetChecked(false)
		DugisGuideViewer:SetDB(false, DGV_OBJECTIVECOUNTER)
		_G["DGV.ChkBox"..DGV_OBJECTIVECOUNTER]:SetChecked(false)
		DugisGuideViewer:SetDB(false, DGV_SMALLFRAMEBORDER)						
		DugisGuideViewer:SetDB(false, DGV_WATCHFRAMEBORDER)
		DugisGuideViewer:SetDB(false, DGV_EMBEDDEDTOOLTIP)
		_G["DGV.ChkBox"..DGV_EMBEDDEDTOOLTIP]:SetChecked(false)
		DugisGuideViewer:SetDB(false, DGV_FIXEDWIDTHSMALL)
		_G["DGV.ChkBox"..DGV_FIXEDWIDTHSMALL]:SetChecked(false)
		DugisGuideViewer:SetDB("Scroll", DGV_SMALLFRAMETRANSITION)
	elseif DugisGuideViewer:GetDB(DGV_DISPLAYPRESET)=="Minimal" then 
		DugisGuideViewer:SetDB(false, DGV_ANCHOREDSMALLFRAME)
		_G["DGV.ChkBox"..DGV_ANCHOREDSMALLFRAME]:SetChecked(false)
		DugisGuideViewer:SetDB(true, DGV_ENABLEQW)
		_G["DGV.ChkBox"..DGV_ENABLEQW]:SetChecked(true)
		DugisGuideViewer:SetDB(false, DGV_MULTISTEPMODE)
		_G["DGV.ChkBox"..DGV_MULTISTEPMODE]:SetChecked(false)
		DugisGuideViewer:SetDB(false, DGV_OBJECTIVECOUNTER)
		_G["DGV.ChkBox"..DGV_OBJECTIVECOUNTER]:SetChecked(false)
		DugisGuideViewer:SetDB(true, DGV_SMALLFRAMEBORDER)				
		DugisGuideViewer:SetDB(true, DGV_WATCHFRAMEBORDER)
		DugisGuideViewer:SetDB(false, DGV_EMBEDDEDTOOLTIP)
		_G["DGV.ChkBox"..DGV_EMBEDDEDTOOLTIP]:SetChecked(false)
		DugisGuideViewer:SetDB(false, DGV_FIXEDWIDTHSMALL)
		_G["DGV.ChkBox"..DGV_FIXEDWIDTHSMALL]:SetChecked(false)
		DugisGuideViewer:SetDB("Scroll", DGV_SMALLFRAMETRANSITION)
	elseif DugisGuideViewer:GetDB(DGV_DISPLAYPRESET)=="Standard" then 
		DugisGuideViewer:SetDB(false, DGV_ANCHOREDSMALLFRAME)
		_G["DGV.ChkBox"..DGV_ANCHOREDSMALLFRAME]:SetChecked(false)
		DugisGuideViewer:SetDB(true, DGV_ENABLEQW)
		_G["DGV.ChkBox"..DGV_ENABLEQW]:SetChecked(true)
		DugisGuideViewer:SetDB(false, DGV_MULTISTEPMODE)
		_G["DGV.ChkBox"..DGV_MULTISTEPMODE]:SetChecked(false)
		DugisGuideViewer:SetDB(false, DGV_OBJECTIVECOUNTER)
		_G["DGV.ChkBox"..DGV_OBJECTIVECOUNTER]:SetChecked(false)
		DugisGuideViewer:SetDB(true, DGV_SMALLFRAMEBORDER)						
		DugisGuideViewer:SetDB(true, DGV_WATCHFRAMEBORDER)
		DugisGuideViewer:SetDB(true, DGV_EMBEDDEDTOOLTIP)
		_G["DGV.ChkBox"..DGV_EMBEDDEDTOOLTIP]:SetChecked(true)
		DugisGuideViewer:SetDB(true, DGV_FIXEDWIDTHSMALL)
		_G["DGV.ChkBox"..DGV_FIXEDWIDTHSMALL]:SetChecked(true)	
		DugisGuideViewer:SetDB("Flash", DGV_SMALLFRAMETRANSITION)
	elseif DugisGuideViewer:GetDB(DGV_DISPLAYPRESET)=="Standard - Anchored" then 
		DugisGuideViewer:SetDB(true, DGV_ANCHOREDSMALLFRAME)
		_G["DGV.ChkBox"..DGV_ANCHOREDSMALLFRAME]:SetChecked(true)
		DugisGuideViewer:SetDB(true, DGV_ENABLEQW)
		_G["DGV.ChkBox"..DGV_ENABLEQW]:SetChecked(true)
		DugisGuideViewer:SetDB(false, DGV_MULTISTEPMODE)
		_G["DGV.ChkBox"..DGV_MULTISTEPMODE]:SetChecked(false)
		DugisGuideViewer:SetDB(false, DGV_OBJECTIVECOUNTER)
		_G["DGV.ChkBox"..DGV_OBJECTIVECOUNTER]:SetChecked(false)
		DugisGuideViewer:SetDB(true, DGV_SMALLFRAMEBORDER)						
		DugisGuideViewer:SetDB(true, DGV_WATCHFRAMEBORDER)
		DugisGuideViewer:SetDB(true, DGV_EMBEDDEDTOOLTIP)
		_G["DGV.ChkBox"..DGV_EMBEDDEDTOOLTIP]:SetChecked(true)
		DugisGuideViewer:SetDB(true, DGV_FIXEDWIDTHSMALL)
		_G["DGV.ChkBox"..DGV_FIXEDWIDTHSMALL]:SetChecked(true)	
		DugisGuideViewer:SetDB("Flash", DGV_SMALLFRAMETRANSITION)
	elseif DugisGuideViewer:GetDB(DGV_DISPLAYPRESET)=="Multi-step" then 
		DugisGuideViewer:SetDB(false, DGV_ANCHOREDSMALLFRAME)
		_G["DGV.ChkBox"..DGV_ANCHOREDSMALLFRAME]:SetChecked(false)
		DugisGuideViewer:SetDB(true, DGV_ENABLEQW)
		_G["DGV.ChkBox"..DGV_ENABLEQW]:SetChecked(false)
		DugisGuideViewer:SetDB(true, DGV_MULTISTEPMODE)
		_G["DGV.ChkBox"..DGV_MULTISTEPMODE]:SetChecked(true)
		DugisGuideViewer:SetDB(true, DGV_OBJECTIVECOUNTER)
		_G["DGV.ChkBox"..DGV_OBJECTIVECOUNTER]:SetChecked(true)
		DugisGuideViewer:SetDB(true, DGV_SMALLFRAMEBORDER)						
		DugisGuideViewer:SetDB(true, DGV_WATCHFRAMEBORDER)
		DugisGuideViewer:SetDB(true, DGV_EMBEDDEDTOOLTIP)
		_G["DGV.ChkBox"..DGV_EMBEDDEDTOOLTIP]:SetChecked(true)
		DugisGuideViewer:SetDB(true, DGV_FIXEDWIDTHSMALL)
		_G["DGV.ChkBox"..DGV_FIXEDWIDTHSMALL]:SetChecked(true)	
		DugisGuideViewer:SetDB("Flash", DGV_SMALLFRAMETRANSITION)
	elseif DugisGuideViewer:GetDB(DGV_DISPLAYPRESET)=="Multi-step - Anchored" then 
		DugisGuideViewer:SetDB(true, DGV_ANCHOREDSMALLFRAME)
		_G["DGV.ChkBox"..DGV_ANCHOREDSMALLFRAME]:SetChecked(true)
		DugisGuideViewer:SetDB(true, DGV_ENABLEQW)
		_G["DGV.ChkBox"..DGV_ENABLEQW]:SetChecked(false)
		DugisGuideViewer:SetDB(true, DGV_MULTISTEPMODE)
		_G["DGV.ChkBox"..DGV_MULTISTEPMODE]:SetChecked(true)
		DugisGuideViewer:SetDB(true, DGV_OBJECTIVECOUNTER)
		_G["DGV.ChkBox"..DGV_OBJECTIVECOUNTER]:SetChecked(true)
		DugisGuideViewer:SetDB(true, DGV_SMALLFRAMEBORDER)						
		DugisGuideViewer:SetDB(true, DGV_WATCHFRAMEBORDER)
		DugisGuideViewer:SetDB(true, DGV_EMBEDDEDTOOLTIP)
		_G["DGV.ChkBox"..DGV_EMBEDDEDTOOLTIP]:SetChecked(true)
		DugisGuideViewer:SetDB(true, DGV_FIXEDWIDTHSMALL)
		_G["DGV.ChkBox"..DGV_FIXEDWIDTHSMALL]:SetChecked(true)	
		DugisGuideViewer:SetDB("Flash", DGV_SMALLFRAMETRANSITION)				
	end
	DugisGuideViewer:RefreshQuestWatch()
	DugisGuideViewer:UpdateSmallFrame()
end

function DugisGuideViewer:QUEST_ACCEPTED(self, event, qid)
	if not DugisGuideViewer:IsModuleLoaded("Guides") or not DugisGuideViewer:GuideOn() then return end
	local logindex = DugisGuideViewer:GetQuestLogIndexByQID(qid)
	if ( AUTO_QUEST_WATCH == "0" and GetNumQuestWatches() < MAX_WATCHABLE_QUESTS and DugisGuideViewer:UserSetting(DGV_ENABLEQW)) then
		if DugisGuideViewer.chardb.EssentialsMode ~= 1 then 
			if DugisGuideViewer:UserSetting(DGV_OBJECTIVECOUNTER) and qid and not DugisGuideUser.removedQuests[qid] then 

				AddQuestWatch(logindex) -- this is to make quest appear when player first accepted the quest even with blizzard AUTO_QUEST_WATCH off.
				DugisGuideViewer.Modules.DugisWatchFrame:DelayUpdate()
			end
		elseif DugisGuideViewer.chardb.EssentialsMode == 1 then
			AddQuestWatch(logindex);
			DugisGuideViewer.Modules.DugisWatchFrame:DelayUpdate()
		end
	end
end

function DugisGuideViewer:QUEST_WATCH_UPDATE(arg1, arg2, arg3, arg4)
	if not DugisGuideViewer:IsModuleLoaded("Guides") or not DugisGuideViewer:GuideOn() then return end


	local qid = DugisGuideViewer:GetQIDByLogIndex(arg2)
	if ( AUTO_QUEST_WATCH == "0" and GetNumQuestLeaderBoards(arg2) > 0 and GetNumQuestWatches() < MAX_WATCHABLE_QUESTS and DugisGuideViewer:UserSetting(DGV_ENABLEQW)) then
		if DugisGuideViewer.chardb.EssentialsMode ~= 1 then 
			if DugisGuideViewer:UserSetting(DGV_OBJECTIVECOUNTER) and qid and not DugisGuideUser.removedQuests[qid] then 
				AddQuestWatch(arg2,MAX_QUEST_WATCH_TIME);
				DugisGuideViewer.Modules.DugisWatchFrame:DelayUpdate();
			end
		elseif DugisGuideViewer.chardb.EssentialsMode == 1 then
			AddQuestWatch(arg2,MAX_QUEST_WATCH_TIME);
			DugisGuideViewer.Modules.DugisWatchFrame:DelayUpdate()
		end
	end
end

function DugisGuideViewer:QUEST_WATCH_LIST_CHANGED()
	if DugisGuideViewer:GuideOn() then
		if DugisGuideViewer:IsModuleLoaded("DugisArrow") then
			DugisGuideViewer.DugisArrow:OnQuestLogChanged()
		end
		
		if DugisGuideViewer:GetDB(DGV_WAYPOINTSON) and DugisGuideViewer.chardb.EssentialsMode == 1 and DugisGuideViewer:IsModuleLoaded("QuestPOI") then 
			DugisGuideViewer.Modules.QuestPOI:ObjectivesChangedDelay(3)
		end
	end	
end

function DugisGuideViewer:RefreshQuestWatch()
	if self:UserSetting(DGV_ENABLEQW) and DugisGuideViewer.chardb.EssentialsMode ~= 1 and DugisGuideViewer:IsModuleLoaded("Guides") and DugisGuideViewer.GuideOn() then
		if AUTO_QUEST_WATCH == "1" then
			SetCVar("autoQuestWatch", 0, InterfaceOptionsObjectivesPanelAutoQuestTracking.event)
			AUTO_QUEST_WATCH = "0"
			InterfaceOptionsObjectivesPanelAutoQuestTracking:SetChecked(false)
			InterfaceOptionsPanel_CheckButton_Update(InterfaceOptionsObjectivesPanelAutoQuestTracking)
		end
		if DugisGuideViewer.chardb.EssentialsMode ~= 1 then 
			DugisGuideViewer:WatchQuest() 
		end
	end
	
	if self:UserSetting(DGV_ENABLEQW) and DugisGuideViewer.chardb.EssentialsMode == 1 and AUTO_QUEST_WATCH == "0" then
		SetCVar("autoQuestWatch", 1, InterfaceOptionsObjectivesPanelAutoQuestTracking.event)
		AUTO_QUEST_WATCH = "1"
		InterfaceOptionsObjectivesPanelAutoQuestTracking:SetChecked(true)
		InterfaceOptionsPanel_CheckButton_Update(InterfaceOptionsObjectivesPanelAutoQuestTracking)
	end
end 

--Large Frame Border Dropdown
function DugisGuideViewer.LargeFrameBorderDropdown_OnClick(button)
	Lib_UIDropDownMenu_SetSelectedID(DGV_LargeFrameBorderDropdown, button:GetID() )
	DugisGuideViewer:SetDB(button.value, DGV_LARGEFRAMEBORDER)
	DugisGuideViewer:SetAllBorders( )
	DugisGuideViewer.Modules.DugisWatchFrame:DelayUpdate()
	if DugisGuideViewer.NPCJournalFrame then DugisGuideViewer.NPCJournalFrame:UpdateBorders() end
end

--Step Complete Sound Dropdown
function DugisGuideViewer.StepCompleteSoundDropdown_OnClick(button)
	Lib_UIDropDownMenu_SetSelectedID(DGV_StepCompleteSoundDropdown, button:GetID() )
	DebugPrint("Debug StepCompleteSoundDropdown_OnClick: button.text="..button.value)
	DugisGuideViewer:SetDB(button.value, DGV_STEPCOMPLETESOUND)
	--DugisGuideViewer:SetDB(button.value, DGV_STEPCOMPLETESOUND, "value")
	DebugPrint("Debug StepCompleteSoundDropdown_OnClick: DugisGuideViewer:GetDB(DGV_STEPCOMPLETESOUND)="..DugisGuideViewer:GetDB(DGV_STEPCOMPLETESOUND))
	PlaySoundFile(DugisGuideViewer:GetDB(DGV_STEPCOMPLETESOUND))
end

--Ant Trail Color Dropdown

function DugisGuideViewer.AntColorDropdown_OnClick(button)
	Lib_UIDropDownMenu_SetSelectedID(DGV_AntColorDropdown, button:GetID() )
	DugisGuideViewer:SetDB(button.value, DGV_ANTCOLOR)
	DugisGuideViewer.Ants:UpdateAntTrailDot(10)
end

--Flightmaster Handling Dropdown
function DugisGuideViewer.TaxiFlightmasterDropdown_OnClick(button)
	Lib_UIDropDownMenu_SetSelectedID(DGV_TaxiFlightmasterDropdown, button:GetID() )
	DugisGuideViewer:SetDB(button.value, DGV_TAXIFLIGHTMASTERS)
	if DugisGuideViewer.Modules.Taxi and DugisGuideViewer.Modules.Taxi.ResetMovementCache then
		DugisGuideViewer.Modules.Taxi:ResetMovementCache()
	end
end

--Quest Complete Sound Dropdown
function DugisGuideViewer.QuestCompleteSoundDropdown_OnClick(button)
	Lib_UIDropDownMenu_SetSelectedID(DGV_QuestCompleteSoundDropdown, button:GetID() )
	DebugPrint("Debug QuestCompleteSoundDropdown_OnClick: button.text="..button.value)
	DugisGuideViewer:SetDB(button.value, DGV_QUESTCOMPLETESOUND)
	--DugisGuideViewer:SetDB(button.value, DGV_STEPCOMPLETESOUND, "value")
	DebugPrint("Debug QuestCompleteSoundDropdown_OnClick: DugisGuideViewer:GetDB(DGV_QUESTCOMPLETESOUND)="..DugisGuideViewer:GetDB(DGV_QUESTCOMPLETESOUND))
	PlaySoundFile(DugisGuideViewer:GetDB(DGV_QUESTCOMPLETESOUND))
end

function DugisGuideViewer.TooltipAnchorDropdown_OnClick(button)
	Lib_UIDropDownMenu_SetSelectedID(DGV_TooltipAnchorDropdown, button:GetID() )
	DugisGuideViewer:SetDB(button.value, DGV_TOOLTIPANCHOR)
	DugisGuideViewer:UpdateCompletionVisuals()
end

function DugisGuideViewer.MapPreviewPOIsDropdown_OnClick(button)
	Lib_UIDropDownMenu_SetSelectedID(DGV_MapPreviewPOIsDropdown, button:GetID() )
	DugisGuideViewer:SetDB(button.value, DGV_MAPPREVIEWPOIS)
	DugisGuideViewer.MapPreview:ConfigChanged()
end

function DugisGuideViewer.DisplayPresetDropdown_OnClick(button)
	Lib_UIDropDownMenu_SetSelectedID(DGV_DisplayPresetDropdown, button:GetID() )
	DugisGuideViewer:SetDB(button.value, DGV_DISPLAYPRESET)
	DugisGuideViewer:DisplayPreset()
end

function DugisGuideViewer.SmallFrameDockingDropdown_OnClick(button)
	Lib_UIDropDownMenu_SetSelectedID(DGV_SmallFrameDockingDropdown, button:GetID() )
	DugisGuideViewer:SetDB(button.value, DGV_SMALLFRAMEDOCKING)
	DugisGuideViewer.Modules.SmallFrame:SetDockingMode()
end

-- 
-- Database
--
function DugisGuideViewer:GetDB(key, field)
	if not DugisGuideViewer.chardb[key] then
		DebugPrint("key:"..key.." does not exist in database")
		return
	end
	
	if field then
		local func = loadstring("return DugisGuideViewer.chardb["..tostring(key).."]."..field)
		return func()
	else
		return DugisGuideViewer.chardb[key].checked
	end
end

function DugisGuideViewer:SetDB(value, key, field)
	if not DugisGuideViewer.chardb[key] then
		DebugPrint("key:"..key.." does not exist in database")
		return
	end
	
	if field then 
		local func = loadstring("DugisGuideViewer.chardb["..tostring(key).."]."..field.."="..tostring(value))
		--DebugPrint("func="..func)
		func()
	else
		--DebugPrint("DugisGuideViewer.chardb["..key.."].checked ="..value)
		DugisGuideViewer.chardb[key].checked = value
	end
end

function DugisGuideViewer:UserSetting(name)

	local settings = self.chardb
	
	if not settings[name] then 
		DebugPrint("Error: UserSetting"..name.." not found")
	end

	return self:GetDB(name)--settings[name].checked
end

--Minimap icons blinking
local MinimapIconsDark = nil
local ticker
local function MinimapIconsBlink()
	if DugisGuideViewer:UserSetting(DGV_BLINKMINIMAPICONS) == false and ticker then
		ticker:Cancel()
		ticker = nil
		Minimap:SetBlipTexture("INTERFACE\\MINIMAP\\OBJECTICONS")
		return
	end
	if MinimapIconsDark then
        if MinimapIconsDark then
            Minimap:SetBlipTexture("INTERFACE\\MINIMAP\\OBJECTICONS")
        end
	else
		Minimap:SetBlipTexture("Interface\\AddOns\\DugisGuideViewerZ\\Artwork\\ObjectIconsDark.blp")
	end
    MinimapIconsDark = not MinimapIconsDark
end

local function StartMinimapTicker()
	ticker = C_Timer.NewTicker(0.2, function() MinimapIconsBlink() end) 
end 

CreateFrame("FRAME","MinimapBlinkerFrame")

--Trick to prevent spoiled texture change
local textureObjectIcons = MinimapBlinkerFrame:CreateTexture("textureObjectIcons","OVERLAY") 
textureObjectIcons:SetTexture("Interface\\MINIMAP\\ObjectIcons") 
textureObjectIcons:SetNonBlocking(true) 
textureObjectIcons:Hide()
local textureObjectIconsDark = MinimapBlinkerFrame:CreateTexture("textureObjectIconsDark","OVERLAY")
textureObjectIconsDark:SetTexture("Interface\\AddOns\\DugisGuideViewerZ\\Artwork\\ObjectIconsDark.blp") 
textureObjectIconsDark:SetNonBlocking(true) 
textureObjectIconsDark:Hide()

function DugisGuideViewer:SettingFrameChkOnClick(box, skip)
	local i, boxindex
	local NPCJournalFrame = DugisGuideViewer.NPCJournalFrame
	--local DGVsettings = self.chardb
	
	if box then
		_, _, boxindex = box:GetName():find("DGV.ChkBox([%d]*)")
		boxindex = tonumber(boxindex)
	end
	
	--Save to DB
	for i = 1, self.chardb.sz do
		if _G["DGV.ChkBox"..i] then
		if _G["DGV.ChkBox"..i]:GetChecked() then self.chardb[i].checked = true else self.chardb[i].checked = false end
		end
	end
	if _G["DGV.ChkBox"..DGV_TARGETBUTTONCUSTOM] then
		if _G["DGV.ChkBox"..DGV_TARGETBUTTONCUSTOM]:GetChecked() then 
			self.chardb[DGV_TARGETBUTTONCUSTOM].checked = true 
		else 
			self.chardb[DGV_TARGETBUTTONCUSTOM].checked = false 
		end
	end
	

	if not DugisGuideViewer:UserSetting(DGV_ENABLEQUESTLEVELDB) then
		DugisGuideViewer:SetDB(false, DGV_QUESTLEVELON)
		local Chk = _G["DGV.ChkBox"..DGV_QUESTLEVELON]
		Disable(Chk)
	else
		local Chk = _G["DGV.ChkBox"..DGV_QUESTLEVELON]
		Enable(Chk)
	end
	
	if not DugisGuideViewer:UserSetting(DGV_AUTOREPAIR) then
		DugisGuideViewer:SetDB(false, DGV_AUTOREPAIRGUILD)
		local Chk = _G["DGV.ChkBox"..DGV_AUTOREPAIRGUILD]
		Disable(Chk)
	else
		local Chk = _G["DGV.ChkBox"..DGV_AUTOREPAIRGUILD]
		Enable(Chk)
	end
	
	--Quest Level On
	if boxindex == DGV_QUESTLEVELON then
		if DugisGuideViewer:UserSetting(DGV_QUESTLEVELON) and DugisGuideViewer:GuideOn() and DugisGuideViewer.chardb.EssentialsMode ~= 1 then
			DugisGuideViewer:ViewFrameUpdate()
			DugisGuideViewer:UpdateSmallFrame()
		elseif DugisGuideViewer:GuideOn() and DugisGuideViewer.chardb.EssentialsMode ~= 1 then
			DugisGuideViewer:ViewFrameUpdate()
			DugisGuideViewer:UpdateSmallFrame()
		end
	end
	
	--Color Code On
	if boxindex == DGV_QUESTCOLORON then
		if DugisGuideViewer:UserSetting(DGV_QUESTCOLORON) and DugisGuideViewer:GuideOn() and DugisGuideViewer.chardb.EssentialsMode ~= 1 then
			DugisGuideViewer:ViewFrameUpdate()
			DugisGuideViewer:UpdateSmallFrame()
		elseif DugisGuideViewer:GuideOn() and DugisGuideViewer.chardb.EssentialsMode ~= 1 then
			DugisGuideViewer:ViewFrameUpdate()
			DugisGuideViewer:UpdateSmallFrame()
		end
	end
		
	--Large Frame Lock
	if DugisGuideViewer:UserSetting(DGV_LOCKLARGEFRAME) then 
		DugisMainBorder:EnableMouse(false)
		DugisMainBorder:SetMovable(false)
	else
		DugisMainBorder:EnableMouse(true)
		DugisMainBorder:SetMovable(true)
	end
	
	--Model Viewer Frame Lock
	if DugisGuideViewer:UserSetting(DGV_LOCKMODELFRAME) and DugisGuideViewer:IsModuleLoaded("ModelViewer") then 
		DugisGuideViewer.Modules.ModelViewer.Frame:SetMovable(false)
		DugisGuideViewer.Modules.ModelViewer.Frame:EnableMouse(false)
	elseif DugisGuideViewer:IsModuleLoaded("ModelViewer") then
		DugisGuideViewer.Modules.ModelViewer.Frame:SetMovable(true)
		DugisGuideViewer.Modules.ModelViewer.Frame:EnableMouse(true)
	end	
		
	if DugisGuideViewer:UserSetting(DGV_ITEMBUTTONON) then
		DugisGuideViewer.DoOutOfCombat(SetUseItem, DugisGuideUser.CurrentQuestIndex)
	else
		DugisGuideViewerActionItemFrame:Hide()		
		DugisSecureQuestButton:Hide()
	end
	
	if boxindex == DGV_ENABLEMODELDB then
		DugisGuideViewer:UpdateSmallFrame()
	end	
    
	if  LuaUtils:isInTable(boxindex, {
        DGV_INCLUDE_DUNG_NORMAL,
        DGV_INCLUDE_DUNG_HEROIC,
        DGV_INCLUDE_DUNG_MYTHIC,
        DGV_INCLUDE_DUNG_TIMEWALKING,
        DGV_INCLUDE_RAIDS_RAIDFINDER,
        DGV_INCLUDE_RAIDS_NORMAL,
        DGV_INCLUDE_RAIDS_HEROIC,
        DGV_INCLUDE_RAIDS_MYTHIC,
        DGV_GEARS_FROM_QUEST_GUIDES
    }) then
        GearFinderSettingsChanged = true
	end
	
	if not self:UserSetting(DGV_ENABLENPCNAMEDB) then
		DugisGuideViewer:SetDB(false, DGV_TARGETBUTTON)
		--self.Target:Disable()
		local ChkBox = _G["DGV.ChkBox"..DGV_TARGETBUTTON]
		Disable(ChkBox)
	else
		local ChkBox = _G["DGV.ChkBox"..DGV_TARGETBUTTON]
		Enable(ChkBox)
	end

	
	if DugisGuideViewer:UserSetting(DGV_TARGETBUTTON) then
		DugisGuideViewer:SetTarget(DugisGuideUser.CurrentQuestIndex)
		
		local ChkBox = _G["DGV.ChkBox"..DGV_TARGETBUTTONSHOW]
		local ChkBox2 = _G["DGV.ChkBox"..DGV_TARGETBUTTONCUSTOM]
		local ChkBox3 = _G["DGV.ChkBox"..DGV_TARGETTOOLTIP]
		Enable(ChkBox)
		Enable(ChkBox2)
		Enable(ChkBox3)
	else
		local ChkBox = _G["DGV.ChkBox"..DGV_TARGETBUTTONSHOW]
		local ChkBox2 = _G["DGV.ChkBox"..DGV_TARGETBUTTONCUSTOM]
		local ChkBox3 = _G["DGV.ChkBox"..DGV_TARGETTOOLTIP]
		Disable(ChkBox)
		Disable(ChkBox2)
		Disable(ChkBox3)		
	end

	if DugisGuideViewer:IsModuleLoaded("Target") then
-- 		if DugisGuideViewer:UserSetting(DGV_TARGETBUTTONSHOW) then
-- 			DugisGuideViewer.Modules.Target.Frame:Show()
-- 		else
-- 			DugisGuideViewer.Modules.Target.Frame:Hide()
-- 		end
		DugisGuideViewer:FinalizeTarget()
	end
	
	if self:UserSetting(DGV_TARGETBUTTONCUSTOM) then
		local inputBox = _G["DGV.InputBox"..DGV_TARGETBUTTONCUSTOM]
		Enable(inputBox)
	else
		local inputBox = _G["DGV.InputBox"..DGV_TARGETBUTTONCUSTOM]
		Disable(inputBox)
	end
	
	if self:UserSetting(DGV_SHOWONOFF) then
		DugisOnOffButton:Show()
	else
		DugisOnOffButton:Hide()
	end

	if self:UserSetting(DGV_ENABLEQW) ~= DugisGuideUser.EnableQWStatus then
		DugisGuideViewer:RefreshQuestWatch()
		DugisGuideUser.EnableQWStatus = self:UserSetting(DGV_ENABLEQW)
	elseif DugisGuideViewer:IsModuleLoaded("Guides") and DugisGuideViewer:GuideOn() and DugisGuideViewer.chardb.EssentialsMode ~= 1 then 
		DugisGuideViewer:WatchQuest() 
	end
	
	if self:UserSetting(DGV_FIXEDWIDEFRAME) then
		--SetCVar( "watchFrameWidth", 1, InterfaceOptionsObjectivesPanelWatchFrameWidth.event);
		--InterfaceOptionsObjectivesPanelWatchFrameWidth:SetChecked(true)
		--InterfaceOptionsPanel_CheckButton_Update(InterfaceOptionsObjectivesPanelWatchFrameWidth)	
		--WatchFrame_SetWidth(GetCVar("watchFrameWidth"))
	else
		--SetCVar( "watchFrameWidth", 0, InterfaceOptionsObjectivesPanelWatchFrameWidth.event);
		--InterfaceOptionsObjectivesPanelWatchFrameWidth:SetChecked(false)
		--InterfaceOptionsPanel_CheckButton_Update(InterfaceOptionsObjectivesPanelWatchFrameWidth)	
		--WatchFrame_SetWidth(GetCVar("watchFrameWidth"))
	end
    
    if NPCJournalFrame and NPCJournalFrame.Enable then
        if self:UserSetting(DGV_JOURNALFRAME) then
            NPCJournalFrame:Enable()
        else
            NPCJournalFrame:Disable()
        end
    end
    
	if DugisGuideViewer:IsModuleLoaded("DugisArrow") then
		if self:UserSetting(DGV_DUGIARROW) then
			if self.Modules.DugisArrow and self.Modules.DugisArrow:getNumWaypoints()>0 then DugisArrowFrame:Show() end
			Enable(_G["DGV.ChkBox"..DGV_SHOWCORPSEARROW])
			Enable(_G["DGV.ChkBox"..DGV_CLASSICARROW])
		else
			Disable(_G["DGV.ChkBox"..DGV_SHOWCORPSEARROW])
			Disable(_G["DGV.ChkBox"..DGV_CLASSICARROW])
			DugisArrowFrame:Hide()
		end
		DugisGuideViewer.DugisArrow:setArrowTexture( )
	end

	if not self:UserSetting(DGV_WATCHFRAMEBORDER) and DugisGuideViewer:IsModuleLoaded("DugisWatchFrame") and self:UserSetting(DGV_DISABLEWATCHFRAMEMOD) then
		DugisGuideViewer.Modules.DugisWatchFrame:Reset()
	end		
	
	if boxindex == DGV_WATCHFRAMEBORDER then
		DugisGuideViewer.Modules.DugisWatchFrame:DelayUpdate()
	end
	
	if boxindex == DGV_TOMTOMARROW or boxindex == DGV_CARBONITEARROW then
		DebugPrint("Switch arrow type")
		self:RemoveAllWaypoints()
		if DugisGuideViewer:GuideOn() and DugisGuideViewer.chardb.EssentialsMode ~= 1 then
			self:MapCurrentObjective()
		end
	end

	DugisGuideViewer:UpdateStickyFrame( )
	if DugisGuideViewer:IsModuleLoaded("SmallFrame")  then
		DugisGuideViewer:SetSmallFrameBorder( )
		DugisGuideViewer.Modules.SmallFrame:ResetFloating()
		DugisGuideViewer:ShowAutoTooltip()
		DugisGuideViewer:UpdateSmallFrame()
	end


	DugisGuideViewer.Modules.WorldMapTracking:UpdateTrackingMap()
    
    --OnObjectiveTracker_Update on DGV_MULTISTEPMODE and DGV_ANCHOREDSMALLFRAME and DGV_EMBEDDEDTOOLTIP and DGV_OBJECTIVECOUNTER
	if boxindex == DGV_MULTISTEPMODE or boxindex ==  DGV_ANCHOREDSMALLFRAME or boxindex == DGV_EMBEDDEDTOOLTIP or boxindex == DGV_OBJECTIVECOUNTER then
		DugisGuideViewer.Modules.DugisWatchFrame:DelayUpdate()
		DugisGuideViewer.Modules.ModelViewer:Finalize()
	end    
    
    if boxindex ==  DGV_ANCHOREDSMALLFRAME then
        UpdateProgressBarPosition()
    end   
    
    if boxindex ==  DGV_DISPLAYGUIDESPROGRESS then
        UpdateProgressBarPosition()
       
        local Chk = _G["DGV.ChkBox"..DGV_DISPLAYGUIDESPROGRESSTEXT]
        if DugisGuideViewer:UserSetting(DGV_DISPLAYGUIDESPROGRESS) then
            Enable(Chk)
        else
            Disable(Chk)
        end
    end    
    
    if boxindex ==  DGV_DISPLAYGUIDESPROGRESSTEXT then
       UpdateProgressBarPosition()
    end
    
    if boxindex == DGV_STICKYFRAMESHOWDESCRIPTIONS then
		DugisGuideViewer:UpdateStickyFrame( )
	end   
    
    if boxindex == DGV_JOURNALFRAMEBUTTONSTICKED then
		DugisGuideViewer.NPCJournalFrame.sidebarButtonFrame:RestoreSidebarIconPosition()
	end   

    if boxindex == DGV_DISPLAYALLSTATS then
        DugisGuideViewer.Modules.GearAdvisor:UpdateWeightsTextboxes()
	end  
    
    if boxindex == DGV_ENABLEDGEARFINDER then
        if not DugisGuideViewer:UserSetting(DGV_ENABLEDGEARFINDER) then
            HideUIPanel(CharacterFrame)
        else
            InitializeGearFinder(true)            
        end
	end      

    if boxindex == DGV_MOVEWATCHFRAME then
		if not self:UserSetting(DGV_MOVEWATCHFRAME) then
			Disable(_G["DGV.ChkBox"..DGV_DISABLEWATCHFRAMEMOD])
		else
			Enable(_G["DGV.ChkBox"..DGV_DISABLEWATCHFRAMEMOD])
		end
		DugisGuideViewer.Modules.DugisWatchFrame:UpdateWatchFrameMovable()
		DugisGuideViewer.Modules.DugisWatchFrame:DelayUpdate()
	end  
	
	if boxindex == DGV_DISABLEWATCHFRAMEMOD then
		DugisGuideViewer.Modules.DugisWatchFrame:UpdateWatchFrameMovable()
	end   
	
	if self:UserSetting(DGV_BLINKMINIMAPICONS) and not DugisGuideViewer.zygorloaded then
		StartMinimapTicker()
	end 
end

function DugisGuideViewer:SettingsTooltip_OnEnter(chk, event)
	local _, _, boxindex = chk:GetName():find("DGV.ChkBox([%d]*)")
	boxindex = tonumber(boxindex)
	
	local DGVsettings = self.chardb
		
	if DGVsettings[boxindex].tooltip ~= "\"\"" then
		GameTooltip:SetOwner( chk, "ANCHOR_BOTTOMLEFT")
		GameTooltip:AddLine(L[DGVsettings[boxindex].tooltip], 1, 1, 1, 1, true)
		GameTooltip:Show()
		GameTooltip:ClearAllPoints()
		GameTooltip:SetPoint("BOTTOMLEFT", chk, "TOPLEFT", 25, 0)
	end
end

function DugisGuideViewer:SettingsTooltip_OnLeave(self, event)
	GameTooltip:Hide()
end

function DugisGuideViewer:RegisterData(uniqueDataName, getDataFunction)
    if not self.datas then
        self.datas = {}
    end

    self.datas[uniqueDataName] = getDataFunction
end   

function DugisGuideViewer:GetData(uniqueDataName)
    if self.datas and self.datas[uniqueDataName] then
        return self.datas[uniqueDataName]()
    end
    return ""
end     
     

local function ToggleConfig()
	if DugisMainBorder:IsVisible() then
		DugisGuideViewer:HideLargeWindow()
	elseif DugisGuideViewer:GuideOn() then
		--UIFrameFadeIn(DugisMainframe, 0.5, 0, 1)
		--UIFrameFadeIn(Dugis, 0.5, 0, 1)
		DugisGuideViewer:ShowLargeWindow()
	end
    local NPCJournalFrame = DugisGuideViewer.NPCJournalFrame
    if NPCJournalFrame and NPCJournalFrame.Update then
        NPCJournalFrame:Update()
    end
end

SLASH_DG1 = "/dugi"
SlashCmdList["DG"] = function(msg)	
	if msg == "" then 				-- "/dg" command
		print("|cff11ff11/dugi way xx xx - |rPlace waypoint in current zone.")
		print("|cff11ff11/dugi fix - |rReset all Saved Variable setting.")
		print("|cff11ff11/dugi reset - |rReset all frame position.")
		print("|cff11ff11/dugi on - |rEnable Dugi Addon.")
		print("|cff11ff11/dugi off - |rDisable Dugi Addon.")
		print("|cff11ff11/dugi config - |rDisplay settings menu.")
	elseif msg  == "on" then
		DugisGuideViewer:TurnOn()
		DugisGuideViewer:UpdateIconStatus()
	elseif msg  == "off" then
		DugisGuideViewer:TurnOff()
		DugisGuideViewer:UpdateIconStatus()
	elseif msg  == "config" then
		ToggleConfig()
	elseif msg  == "reset" then 	--"/dg reset" command
		print("|cff11ff11" .. "Dugi: Frame Reset" )
		DugisGuideViewer:InitFramePositions()
	elseif msg == "fix" then
		print("|cff11ff11" .. "Dugi: Cleared Saved Variables" )
		ResetDB()
		DugisGuideViewer:InitFramePositions()
		DugisGuideViewer:ShowReloadUi()
        DugisGuideViewer.db:ResetProfile()
		--DugisGuideViewer:ReloadModules()
	elseif msg == "dgr" then
		DugisGuideViewer:ShowRecord()
	elseif msg == "dgr limit" then
		DugisGuideViewer:ToggleRecordLimit()
	elseif string.find(msg, "dgr ")==1 then
		DugisGuideViewer:RecordNote(string.sub(msg, 5))	
	elseif string.find(msg, "way ")==1 then
		local x,y,zone = string.sub(msg, 5):match("%s*([%d.]+)[,%s]+([%d.]+)%s*(.*)")
		if zone == "" then zone = GetCurrentMapAreaID() end
		if x and y then
			DugisGuideViewer:AddManualWaypoint(tonumber(x)/100, tonumber(y)/100, zone)
		end
	elseif msg == "way" then		
		local zone, mapFloor, x, y = DugisGuideViewer:GetPlayerPosition()
		DugisGuideViewer:AddManualWaypoint(x, y, zone, mapFloor)
	end
end

function DugisGuideViewer:RemoveParen(text)
	if text then
		local _, _, noparen = text:find("([^%(]*)")
		noparen = noparen:trim()
		
		return noparen
	end
end


function DugisGuideViewer:OnOff_OnClick(self, event)
	if event == "LeftButton" then
		DugisGuideViewer:ToggleOnOff()
	elseif event == "RightButton" then
		ToggleConfig()
	end
end

local function SaveFramesPositions()
	if DugisGuideUser.SkipSaveFramesPosition then return end
    if DugisGuideViewer.chardb.QuestRecordTable.framePositions == nil then
        DugisGuideViewer.chardb.QuestRecordTable.framePositions = {}
    end
    LuaUtils:foreach(savablePositionsFrameNames, function(frameName)
        local framePosition = DugisGuideViewer.chardb.QuestRecordTable.framePositions[frameName]
        if framePosition == nil then
            DugisGuideViewer.chardb.QuestRecordTable.framePositions[frameName] = {}
            framePosition = DugisGuideViewer.chardb.QuestRecordTable.framePositions[frameName]
        end
        local frame = _G[frameName]
		if frame then 
			framePosition.point, framePosition.relativeTo, framePosition.relativePoint, framePosition.xOfs, framePosition.yOfs = frame:GetPoint()
			if framePosition.relativeTo then
				framePosition.relativeTo = framePosition.relativeTo:GetName()
			end
		end 
    end)
end

function UpdateLeftMenu()
    if not settingsMenuTreeGroup then return end
	if DugisGuideViewer.chardb.EssentialsMode ~= 1 then
        if settingsMenuTreeGroup.tree[1].value == "Search Locations" then
            tremove(settingsMenuTreeGroup.tree,1)
        end
        
        if settingsMenuTreeGroup.localstatus.selected == "Search Locations" then
            settingsMenuTreeGroup:SetSelected(settingsMenuTreeGroup.tree[1].value)
        end
    else
        if settingsMenuTreeGroup.tree[1].value ~= "Search Locations" then
            tinsert(settingsMenuTreeGroup.tree,1, { value = "Search Locations", text = L["Search Locations"], icon = nil })
        end
    end                
    
    settingsMenuTreeGroup:RefreshTree() 
end

function DugisGuideViewer:ToggleOnOff()
	if InCombatLockdown() then return end
	if DugisGuideViewer:GuideOn() and DugisGuideViewer.chardb.EssentialsMode == 0 then
		SaveFramesPositions()
		DugisGuideViewer:TurnOnEssentials()
		DugisGuideViewer:RefreshQuestWatch()
	elseif DugisGuideViewer:GuideOn() then
		DugisGuideViewer:TurnOff()
	else
		DugisGuideViewer.chardb.EssentialsMode = 0
		DugisGuideViewer:TurnOn()
		--DugisGuideViewer:SettingFrameChkOnClick()
	end
	DugisGuideViewer:UpdateIconStatus()
    
   UpdateLeftMenu()
end

function DugisGuideViewer:TurnOnEssentials()
	--In the copper mode RemoveAllWaypoints is not available (clocking it: #128)
    if DugisGuideViewer.RemoveAllWaypoints then
        DugisGuideViewer:RemoveAllWaypoints()
    end
	DugisGuideViewer.chardb.GuideOn = true
	DugisGuideViewer.chardb.EssentialsMode = 1
	DugisGuideViewer:ReloadModules()
	--DugisGuideViewer:SettingFrameChkOnClick()
	DugisGuideViewer:UpdateIconStatus()
	if DugisGuideViewer:UserSetting(DGV_WATCHFRAMEBORDER) and DugisGuideViewer.Modules.DugisWatchFrame.WatchBackground then 
		DugisGuideViewer.Modules.DugisWatchFrame.WatchBackground:ClearAllPoints()
	end
	DugisGuideViewer.Modules.DugisWatchFrame:DelayUpdate()
	for i=1, 6 do 
		local itembutton = _G["DugisSmallFrameStatus"..i.."Item"]
		if itembutton then 
			DugisGuideViewer.DoOutOfCombat(itembutton.Hide, itembutton)
		end
	end
	if DugisSecureQuestButton then
		DugisSecureQuestButton:Hide()			
	end
	DugisGuideViewer:CreateSettingsTree(DugisMainBorder)
	if DugisGuideViewer.Modules.Target.Frame then DugisGuideViewer.Modules.Target.Frame:Hide() end
	DugisGuideViewer.Modules.QuestPOI:ObjectivesChangedDelay(3)
end

function DugisGuideViewer:TurnOff()
	if not DugisGuideViewer:GuideOn() then return end
	print("|cff11ff11" .. "Dugi Guides Off" )
	DugisGuideViewer.chardb.GuideOn = false
	DugisGuideViewer.eventFrame:UnregisterAllEvents()
	DugisGuideViewer:HideLargeWindow()
	-- if DugisGuideViewer.ModelViewer.Frame then  --not created when memory setting is restricted
	--	DugisGuideViewer.ModelViewer.Frame:Hide()
	-- end
	--DugisSmallFrameLogo:Hide()
	--DugisGuideViewer.Canvas:Hide()
	--DugisGuideViewer.DugisArrow:Disable()
	--DugisGuideViewer.Target:Disable( )
	--DugisGuideViewer.StickyFrame:Disable()
	--DugisGuideViewer.SmallFrame:Disable()
	if DugisSecureQuestButton then DugisSecureQuestButton:Hide() end
	DugisGuideViewer:ReloadModules()
end

function DugisGuideViewer:TurnOn()
	if DugisGuideViewer:GuideOn() then return end
	if WorldMapFrame:IsShown() then HideUIPanel(WorldMapFrame) end
	print("|cff11ff11" .. "Dugi Guides On" )
	if not DugisGuideViewer:IsModuleRegistered("Guides") then
		DugisGuideViewer.chardb.EssentialsMode = 1
	end
	DugisGuideViewer.chardb.GuideOn = true
	DugisGuideViewer:OnInitialize()	
	--DugisGuideViewer.ModelViewer:ShowCurrentModel()
	--DugisSmallFrameLogo:Show()
	--DugisGuideViewer.Canvas:Show()
	--DugisGuideViewer.DugisArrow:Enable()
	--DugisGuideViewer.Target:Enable( )
	--DugisGuideViewer.StickyFrame:Enable()
	--DugisGuideViewer.SmallFrame:Enable()
	DugisGuideViewer:SetEssentialsOnCancelReload()
	DugisGuideViewer.chardb.GuideOn = DugisGuideViewer:ReloadModules()
	if DugisGuideViewer:GuideOn() and DugisGuideViewer.chardb.EssentialsMode ~= 1 then DugisGuideViewer:MoveToNextQuest() end
	--DugisGuideViewer:ShowLargeWindow()
	if DugisGuideViewer:UserSetting(DGV_WATCHFRAMEBORDER) and DugisGuideViewer.Modules.DugisWatchFrame.WatchBackground then 
		DugisGuideViewer.Modules.DugisWatchFrame.WatchBackground:ClearAllPoints()
	end
	DugisGuideViewer.Modules.DugisWatchFrame:DelayUpdate()		
	DugisGuideViewer:RefreshQuestWatch()	
end

if not DugisGuideViewerDelayFrame then
	DugisGuideViewerDelayFrame = CreateFrame("Frame")
	DugisGuideViewerDelayFrame:Hide()
end

if not DugisGuideViewerDelayFrameTwo then
	DugisGuideViewerDelayFrameTwo = CreateFrame("Frame")
	DugisGuideViewerDelayFrameTwo:Hide()
end

function DugisGuideViewer.DelayandMoveToNextQuest(delay, reload, func)
	if DugisGuideViewerDelayFrame:IsShown() then return end
	DugisGuideViewerDelayFrame.func = func
	DugisGuideViewerDelayFrame.delay = delay
	DugisGuideViewerDelayFrame.reload = reload
	DugisGuideViewerDelayFrame:Show()
end

function DugisGuideViewer.DelayandSetMapToCurrentZone(delay, func)
	if DugisGuideViewerDelayFrameTwo:IsShown() then return end
	DugisGuideViewerDelayFrameTwo.func = func
	DugisGuideViewerDelayFrameTwo.delay = delay
	DugisGuideViewerDelayFrameTwo:Show()
end

DugisGuideViewerDelayFrame:SetScript("OnUpdate", function(self, elapsed)
	self.delay = self.delay - elapsed
	if self.delay <= 0 then
		self:Hide()
		if DugisGuideViewer:GuideOn() and DugisGuideViewer.chardb.EssentialsMode ~= 1 then
			DugisGuideViewer:MoveToNextQuest(DugisGuideViewer:FindNextUnchecked())
			DugisGuideViewer:DisplayViewTab(CurrentTitle, true) --reload again for icons to appear.
		end
	end
end)

DugisGuideViewerDelayFrameTwo:SetScript("OnUpdate", function(self, elapsed)
	self.delay = self.delay - elapsed
	if self.delay <= 0 then
		self:Hide()
		SetMapToCurrentZone()
	end
end)
			

--Occurs BEFORE QuestFrameCompleteQuestButton OnClick (works with questguru, doesn't work with carbonite)
function Dugis_RewardComplete_Click()
	DebugPrint("QuestRewardCompleteButton_OnClick")
	if IsAddOnLoaded("QuestGuru") and DugisGuideViewer:isValidGuide(CurrentTitle) == true then
		DugisGuideViewer:CompleteQuest()
	end
end
hooksecurefunc("QuestRewardCompleteButton_OnClick", Dugis_RewardComplete_Click);

--Occurs AFTER QuestFrameCompleteQuestButton OnClick (doesn't work with questguru, works with carbonite)
QuestFrameCompleteQuestButton:HookScript("OnClick", function(...)
	DebugPrint("QuestFrameCompleteQuestButton")
	if not IsAddOnLoaded("QuestGuru") and DugisGuideViewer:isValidGuide(CurrentTitle) == true then
		DugisGuideViewer:CompleteQuest()
	end
end)

function DugisGuideViewer:OnDragStart(frame)
  if not self:UserSetting(DGV_LOCKSMALLFRAME) then
    frame:StartMoving();
    frame.isMoving = true;
  end
end

function DugisGuideViewer:OnDragStop(self)
  self:StopMovingOrSizing();
  self.isMoving = false;
end

function DugisGuideViewer:WayPoint_OnClick(frame)
	DugisGuideUser.PreviewPointx = nil
	DugisGuideUser.PreviewPointy = nil	
	local rowNum = frame:GetParent().guideIndex
	if not rowNum then
		_, _, rowNum = frame:GetName():find("DGVRow([^ ]*)WayPoint")
		rowNum = tonumber(rowNum)
	end
	DugisGuideViewer:MapCurrentObjective(rowNum, true)
	DugisGuideViewer:ShowAutoTooltip()
	DugisGuideViewer:SafeSetMapQuestId(DugisGuideViewer.qid[rowNum]);
	--if not DugisGuideViewer:IsPlayerAtBlizzardDestination() then DugisGuideViewer.MapPreview:FadeInMap() end
    
    --[[local waypointAutoroutine = DugisGuideViewer.GetRunningAutoroutine("SetSmartWaypoint")
    if waypointAutoroutine then
        waypointAutoroutine.onCompletion = function()
         HideNonWaypointPOIs()
        end
    else
        HideNonWaypointPOIs()
    end]] -- this hijack can interrupt multiple waypoints placement fix later 
    --HideNonWaypointPOIs()
end

function DugisGuideViewer:Button_OnEnter(frame)
	if CurrentTitle == nil then return end
	local rowNum = frame:GetParent().guideIndex
	if not rowNum then
		_, _, rowNum = frame:GetName():find("DGVRow([^ ]*)Button")
		rowNum = tonumber(rowNum)
	end
	if not rowNum then return end
	id = self.visualRows[rowNum].Button.tag_id
	tagType = self.visualRows[rowNum].Button.tagType
	GameTooltip:SetOwner(frame, "ANCHOR_LEFT")
	if tagType == "item" then
	  	GameTooltip:SetItemByID(id)
	elseif tagType == "spell" then
		GameTooltip:SetSpellByID(id)
	elseif tagType == "aid" then
		GameTooltip:SetAchievementByID(id)
	elseif tagType == "qid" then
		GameTooltip:SetHyperlink(("quest:%s"):format(tostring(id)))	
	end
end

function DugisGuideViewer:HideLargeWindow()	
	DugisMainBorder:Hide()
	--Dugis:Hide()
	PlaySound("igCharacterInfoClose")
end

function DugisGuideViewer_Close_ButtonClick()
	DugisGuideViewer:HideLargeWindow()
	--DugisSmallFrameLogo:Hide()
end

--[[
function DugisGuideViewer:MinimizeDungeonMap()
	DGV_DungeonFrame:Hide()
	DugisSmallFrameMaximize:Show()
end
--]]
-- 
-- Events
--

local function PetJournalShowEvent()
    LuaUtils:foreach(PetJournal.listScroll.buttons, function(parentButton)
        if parentButton.journalFrameButton == nil then
            local sidebarButton = GUIUtils:AddButton(parentButton, "", 180, -11, 20, 20, 20, 20, function(self)  
                local petId = select(4, C_PetJournal.GetPetInfoBySpeciesID(self.journalFrameButton.speciesID))
                DugisGuideViewer.NPCJournalFrame:SetGuideData("Pets", petId, true)
            end
            , [[Interface\EncounterJournal\UI-EJ-PortraitIcon]], [[Interface\Buttons\ButtonHilight-Square]], [[Interface\AddOns\DugisGuideViewerZ\Artwork\npcjournal_button.tga]])
        
            sidebarButton.button.journalFrameButton =  parentButton
            parentButton.journalFrameButton = sidebarButton
        end
    end)
end

local function MountJournalShowEvent()
    LuaUtils:foreach(MountJournal.ListScrollFrame.buttons, function(parentButton)
        if parentButton.journalFrameButton == nil then
            local sidebarButton = GUIUtils:AddButton(parentButton, "", 180, -11, 20, 20, 20, 20, function(self)  
                DugisGuideViewer.NPCJournalFrame:SetGuideData("Mounts", self.journalFrameButton.spellID, true)
            end
            , [[Interface\EncounterJournal\UI-EJ-PortraitIcon]], [[Interface\Buttons\ButtonHilight-Square]], [[Interface\AddOns\DugisGuideViewerZ\Artwork\npcjournal_button.tga]])
        
            sidebarButton.button.journalFrameButton =  parentButton
            parentButton.journalFrameButton = sidebarButton
        end
    end)
end

local function FollowersShowEvent()
  LuaUtils:foreach(GarrisonMissionFrame.FollowerList.listScroll.buttons, function(parentButton)
      if parentButton.journalFrameButton == nil then
          local sidebarButton = GUIUtils:AddButton(parentButton, "", 230, -15, 20, 20, 20, 20, function(self)  
              local followerID = self.journalFrameButton.info.followerID
			  if type(followerID) ~= "number" then
			  	followerID = tonumber(self.journalFrameButton.info.garrFollowerID, 16) 
			end
              DugisGuideViewer.NPCJournalFrame:SetGuideData("Followers", followerID, true)
              DugisGuideViewer.NPCJournalFrame.mainFrame:SetFrameStrata("HIGH")
          end , [[Interface\EncounterJournal\UI-EJ-PortraitIcon]], [[Interface\Buttons\ButtonHilight-Square]], [[Interface\AddOns\DugisGuideViewerZ\Artwork\npcjournal_button.tga]])
      
          sidebarButton.button:SetFrameStrata("HIGH")
          sidebarButton.button:SetAlpha(0.9);
      
          sidebarButton.button.journalFrameButton =  parentButton
          parentButton.journalFrameButton = sidebarButton
      end
		if GarrisonMissionFrame.selectedTab==1 then	
			parentButton.journalFrameButton.button:Hide()
		else
			parentButton.journalFrameButton.button:Show()
		end	  
  end)    
end

local function FollowersHideEvent()
    if DugisGuideViewer.NPCJournalFrame.mainFrame then DugisGuideViewer.NPCJournalFrame.mainFrame:SetFrameStrata("MEDIUM") end
end

local followerJournalParentShowEventFirstTime = true

local function FollowerJournalParentShowEvent()
    if followerJournalParentShowEventFirstTime then
        hooksecurefunc(GarrisonMissionFrame.FollowerList, "Show", function() 
              FollowersShowEvent()
        end)
        hooksecurefunc(GarrisonMissionFrame.FollowerList, "Hide", function() 
              FollowersHideEvent()
        end)
        hooksecurefunc(GarrisonMissionFrame.FollowerTab, "Show", function() 
              FollowersShowEvent()
        end)		
        followerJournalParentShowEventFirstTime = false
    end
end


local petJournalParentShowEventFirstTime = true

local function PetJournalParentShowEvent()
    if petJournalParentShowEventFirstTime then
        if MountJournal:IsShown() then
            MountJournalShowEvent()
        end
        
        if PetJournal:IsShown() then
            PetJournalShowEvent()
        end

        hooksecurefunc(MountJournal, "SetShown", function() 
              MountJournalShowEvent()
        end)
        
        hooksecurefunc(PetJournal, "SetShown", function() 
              PetJournalShowEvent()
        end)

        petJournalParentShowEventFirstTime = false
    end
end


function DugisGuideViewer:PLAYER_LOGIN()
	if DugisGuideUser.SkipSaveFramesPosition then DugisGuideUser.SkipSaveFramesPosition = nil end
	local guid = UnitGUID("player")
	if DugisGuideUser.CharacterGUID == "PRIOR_RESET" then DugisGuideUser.CharacterGUID = guid end
	if DugisGuideUser.CharacterGUID and DugisGuideUser.CharacterGUID~=guid then
		print("|cff11ff11Dugi Guides: |rNew character detected. Wiping settings.")
		ResetDB()
		self.chardb.EssentialsMode = 1
		self:ReloadModules()
		self:SettingFrameChkOnClick()
	end
	
	--QueryQuestsCompleted()
	DugisGuideViewer:InitializeMapOverlays()
	DugisGuideViewer:InitializeQuestPOI()
    DugisGuideViewer:initAnts()
    
	hooksecurefunc("ToggleCollectionsJournal", function() 
        if CollectionsJournal:IsShown() and self:UserSetting(DGV_JOURNALFRAME) and DugisGuideViewer:IsModuleRegistered("PetDataModule") then
             PetJournalParentShowEvent()
        end
    end)
    

    
end

function DugisGuideViewer:GARRISON_MISSION_NPC_OPENED( )
	if DugisGuideViewer:IsModuleRegistered("FollowerDataModule") then
	    FollowerJournalParentShowEvent()
	end
end

function DugisGuideViewer:PLAYER_LOGOUT( )
    SaveFramesPositions()
end

function DugisGuideViewer:PLAYER_LEAVING_WORLD( )
    SaveFramesPositions()
end

function DugisGuideViewer:ZONE_CHANGED()
	self:Zone_OnEvent()
	DugisGuideViewer:WatchLocalQuest()
end

function DugisGuideViewer:ZONE_CHANGED_NEW_AREA()
	self:Zone_OnEvent()
	DugisGuideViewer.OnMapChangeUpdateArrow()
	--DugisGuideViewer.DugisArrow:Show()
end

function DugisGuideViewer:ZONE_CHANGED_INDOORS()
	self:Zone_OnEvent()
end

function DugisGuideViewer:MINIMAP_UPDATE_ZOOM() --MINIMAP_UPDATE_ZOOM is only event that seems to trigger when entering a mic
	DugisGuideViewer.DelayandSetMapToCurrentZone(0.5) -- This is needed to update map floor for micro dungeons
	-- the delay is is also needed because SetMapToCurrentZone() on MINIMAP_UPDATE_ZOOM doesn't work straight away.
end


function DugisGuideViewer:QUEST_DETAIL()
	DugisGuideViewer:OnQuestDetail()
end

function DugisGuideViewer:QUEST_AUTOCOMPLETE(...)
	DugisGuideViewer:OnAutoComplete(...)
	DugisGuideViewer:UpdateCompletionVisuals()
end

function DugisGuideViewer:QUEST_COMPLETE()
	DugisGuideViewer:OnQuestComplete()
	DugisGuideViewer:UpdateCompletionVisuals()
end

local function OnQuestObjectivesComplete()
	DugisGuideViewer:PlayCompletionSound(DGV_QUESTCOMPLETESOUND)
	DugisGuideViewer:UpdateCompletionVisuals()
end

local completedLogQuests,lastCompletedLogQuests = nil, {}
function DugisGuideViewer:QUEST_LOG_UPDATE()
	DugisGuideViewer:UpdateRecord()
	--PATCH: If I call OnLoad from PLAYER_LOGIN, 
	--GetNumQuestLogEntries == 0 when it is not.
	--Value seems to be stable after initial QLU event
	if FirstTime then  
		FirstTime = nil
		DugisGuideViewer:OnLoad()

	else
		DugisGuideViewer:UpdateMainFrame()
		local i
		lastCompletedLogQuests, completedLogQuests = completedLogQuests, lastCompletedLogQuests
		wipe(completedLogQuests)
		for i=1,GetNumQuestLogEntries() do
			local link = GetQuestLink(i)
			local qid = link and tonumber(link:match("|Hquest:(%d+):"))
			if qid then
				local title, _, _, _, _, questFinished = GetQuestLogTitle(i)
				local n = GetNumQuestLeaderBoards(i)
				if n>1 then
					for j=1,n do
						local text, objtype, finished = GetQuestLogLeaderBoard(j, i)
						if not finished then
							questFinished = false
						end
					end
				end
				--DugisGuideViewer:DebugFormat("QUEST_LOG_UPDATE", "qid", qid, "title", title, "questFinished", questFinished, "lastCompletedLogQuests", lastCompletedLogQuests)

				if lastCompletedLogQuests and questFinished and not tContains(lastCompletedLogQuests, qid) then
					OnQuestObjectivesComplete()

					tinsert(completedLogQuests, qid)
				elseif questFinished then
					tinsert(completedLogQuests, qid)
				end
			end
		end
		if not lastCompletedLogQuests then lastCompletedLogQuests = {} end
	end

	if DugisGuideViewer:GuideOn() then
		if DugisGuideViewer:IsModuleLoaded("DugisArrow") then
			DugisGuideViewer.DugisArrow:OnQuestLogChanged()
		end
		
		if DugisGuideViewer:GetDB(DGV_WAYPOINTSON) and DugisGuideViewer.chardb.EssentialsMode == 1 and DugisGuideViewer:IsModuleLoaded("QuestPOI") then 
			DugisGuideViewer.Modules.QuestPOI:ObjectivesChangedDelay(3)
		end
		
		if DugisGuideViewer.chardb.EssentialsMode ~= 1 and DugisGuideViewer:UserSetting(DGV_SHOWCORPSEARROW) and UnitIsDeadOrGhost("player") then
			DugisGuideViewer.Modules.QuestPOI:ObjectivesChangedDelay(3)
		end
	end
end

function DugisGuideViewer:TRADE_SKILL_UPDATE()
	DugisGuideViewer:UpdateProfessions()
end

function DugisGuideViewer:ACHIEVEMENT_EARNED()
	DugisGuideViewer:UpdateAchieveFrame()
end

function DugisGuideViewer:ADDON_LOADED(event, addon)
	if addon == "DugisGuideViewerZ" then
		self:UnregisterEvent("ADDON_LOADED")
		DugisGuideViewer:OnInitialize()
		if DugisGuideViewer:GetDB(DGV_MAPPREVIEWDURATION) > 0 then
			SetCVar("miniWorldMap", 1)
		end
	end

end

function DugisGuideViewer:UpdateIconStatus()
	local icon = DugisGuideViewer.ARTWORK_PATH.."iconbutton"
	if DugisGuideViewer:GuideOn() and DugisGuideViewer.chardb.EssentialsMode == 1 then
		icon = DugisGuideViewer.ARTWORK_PATH.."iconbutton_s"
	elseif not DugisGuideViewer:GuideOn() then
		icon = DugisGuideViewer.ARTWORK_PATH.."iconbutton_c"
	end
	DugisOnOffButton:SetNormalTexture(icon)
	if DugisGuideViewer.LDB then
		DugisGuideViewer.LDB:SetIconStatus(icon)
	end
end

function DugisGuideViewer:GetQuestLogIndexByQID(qid)
	local i
	for i=1,GetNumQuestLogEntries() do
		local qid2 = select(8, GetQuestLogTitle(i))
		if qid2 == qid then return i end
	end
end

function DugisGuideViewer:WatchLocalQuest()
	if not DugisGuideViewer:UserSetting(DGV_WATCHLOCALQUEST) then return end
	local i
	for i=1,GetNumQuestLogEntries() do
		local hasLocalPOI = select(12, GetQuestLogTitle(i))
		if hasLocalPOI and not IsQuestWatched(i) then 
			AddQuestWatch(i)
		elseif not hasLocalPOI and IsQuestWatched(i) then
			RemoveQuestWatch(i)
		end
	end
end

function DugisGuideViewer:GetCarboniteQuestLogIndexByQID(qid)
	if not Nx.Quest then return end
	if not Nx.Quest.CurQ then return end
	local i
	for i=1,40 do
		if Nx.Quest.CurQ[i] then
			local curq = Nx.Quest.CurQ[i];
			local qid2 = curq.QId;
			if qid2 == qid then return i end
		end
	end
end

function DugisGuideViewer:GetItemIdFromLink(link)
	--|cff9d9d9d|Hitem:7073:0:0:0:0:0:0:0:80:0|h[Broken Fang]|h|r
	return tonumber(link:match(".+|Hitem:([^:]+):.+"))
end

function DugisGuideViewer:InitFramePositions()
	if DugisGuideViewer:IsModuleLoaded("StickyFrame") then
		self.Modules.StickyFrame.Frame:ClearAllPoints()
		self.Modules.StickyFrame.Frame:SetPoint("CENTER", 225, 180)
	end

	if DugisGuideViewer:IsModuleLoaded("NPCJournalFrame") then 
		sidebarButtonFrame.ResetSidebarIconPosition() 
	end
	
	DugisMainBorder:ClearAllPoints()
	DugisMainBorder:SetPoint("CENTER", 0, 0)
	
	if DugisGuideViewer:IsModuleLoaded("DugisWatchFrame") then
		DugisGuideViewer.Modules.DugisWatchFrame:Reset()
	end

	DugisGuideViewerActionItemFrame:ClearAllPoints()
	DugisSecureQuestButton:ClearAllPoints()
	DugisOnOffButton:ClearAllPoints()
	DugisGuideViewerActionItemFrame:SetPoint("BOTTOM", DugisArrowFrame, "TOP", 10, 4)
	DugisSecureQuestButton:SetPoint("BOTTOM", DugisArrowFrame, "TOP", 10, 4)
	DugisOnOffButton:SetPoint("BOTTOM", DugisArrowFrame, "TOP", -19, 0)

	local actionShown = DugisGuideViewerActionItemFrame:IsShown()
	local questShown = DugisSecureQuestButton:IsShown()
	DugisGuideViewerActionItemFrame:Show()
	DugisSecureQuestButton:Show()

	if not actionShown then
		DugisGuideViewerActionItemFrame:Hide()
	end
	if not questShown then
		DugisSecureQuestButton:Hide()
	end
	
	if DugisGuideViewer:IsModuleLoaded("ModelViewer") then
		DugisGuideViewer.Modules.ModelViewer:ResetPosition() 
	end

	if DugisGuideViewer:IsModuleLoaded("Target") then
		self.Modules.Target.Frame:ClearAllPoints()
		self.Modules.Target.Frame:SetPoint("LEFT", "DugisGuideViewerActionItemFrame", "RIGHT", "5", "0")
		self.Modules.Target.Frame:SetPoint("LEFT", "DugisSecureQuestButton", "RIGHT", "5", "0")
	end

	if DugisGuideViewer:IsModuleLoaded("DugisArrow") then
		DugisGuideViewer.DugisArrow:ResetPosition()
	end
    
	if DugisGuideViewer:IsModuleLoaded("DugisWatchFrame") then
	    DugisGuideViewer.Modules.DugisWatchFrame:ResetWatchFrameMovable()
	end
end

local function getQuestIndexByQuestName(name)
	local i
	local numq, _ = GetNumQuestLogEntries()
	for i=1,numq do
		local title, _, _, isHeader = GetQuestLogTitle(i)
		if not isHeader then
			if name == title then
				return i
			end

		end
	end
end

function DugisGuideViewer:GetQIDFromQuestName(name)
	local logindx = getQuestIndexByQuestName(name)
	local qid
	if logindx then
		qid = select(8, GetQuestLogTitle(logindx))
	end
	return qid
end

function DugisGuideViewer:CreateFlashFrame(parent)
	local frame = CreateFrame("Frame", nil, parent)
	frame:Hide()
	local texture = frame:CreateTexture()
	texture:SetAllPoints(frame)
	texture:SetTexture(1, 1, 1, 0.2)
	frame:SetBackdrop( { bgFile = nil, edgeFile = DugisGuideViewer.ARTWORK_PATH.."Border-Flash.tga", tile = true, tileSize = 32, edgeSize = 10, insets = { 0, 0, 0, 0 } })
	
	local flashGroup = parent:CreateAnimationGroup()
	local flash = flashGroup:CreateAnimation("Alpha")

	--SmallFrame:ResetFloating()

	flash:SetDuration(0.4)
	flash:SetSmoothing("OUT")
	flash:SetScript("OnUpdate", function(self)
		local back = frame
		--DebugPrint("progress="..progress)
		local progress = 1 - self:GetSmoothProgress()
		back:SetAlpha(progress)

		if progress == 0 then
			--if progress >= 0.25 then
			flash:Stop()
		end

		if flash:IsPlaying() then
			back:Show()
		elseif flash:IsStopped() then
			back:Hide()
		end
	end)

	frame:ClearAllPoints()

	frame:SetPoint("CENTER", parent, 1, -1)
	return flashGroup, flash, frame
end

function DugisGuideViewer:UpdateCompletionVisuals()
	if DugisGuideViewer:IsModuleRegistered("SmallFrame") and DugisGuideViewer:IsModuleRegistered("DugisWatchFrame") and DugisGuideViewer:GuideOn() then 
		DugisGuideViewer:UpdateSmallFrame()
		DugisGuideViewer.Modules.DugisWatchFrame:DelayUpdate()
		DugisGuideViewer.Modules.DugisWatchFrame:PlayDelayedFlashAnimation()
	end
end

function DugisGuideViewer:CollapseCurrentGuide()
    DugisGuideUser.showLeftMenuForCurrentGuide = true
end

function DugisGuideViewer:ExpandCurrentGuide()
    DugisGuideUser.showLeftMenuForCurrentGuide = false
end

function DugisGuideViewer:ToggleCurrentGuide()
   if DugisGuideUser.showLeftMenuForCurrentGuide then
        DugisGuideViewer:ExpandCurrentGuide()
   else
        DugisGuideViewer:CollapseCurrentGuide()
   end
   DugisGuideViewer:UpdateCurrentGuideExpanded()
end

local SCROLL_BACKGROUND = "Interface\\AddOns\\DugisGuideViewerZ\\Artwork\\bg_home.tga"
local SCROLLESS_BACKGROUND = "Interface\\AddOns\\DugisGuideViewerZ\\Artwork\\bg_currentguide.tga"

function DugisGuideViewer:UpdateCurrentGuideExpanded()
    if DugisGuideUser.showLeftMenuForCurrentGuide == nil then
        DugisGuideUser.showLeftMenuForCurrentGuide = true
    end
    
    local shouldShowExpandButton = (DugisMainCurrentGuideTab:GetButtonState() == "DISABLED" and DugisGuideViewer.CurrentTitle ~= nil)

    if not shouldShowExpandButton then
        CurrentGuideExpandButton:Hide()
        
        if DugisGuideViewer.currentTabText == "Settings" then
            DugisMainRightFrameHost:SetPoint("TOPLEFT", DugisMain, -9, -49)
            DugisMainBorder.bg:SetTexture(SCROLLESS_BACKGROUND)
            DugisMainLeftScrollFrame.bar:Hide()
        end

        return
    else
        CurrentGuideExpandButton:Show()
    end
    
    if DugisGuideViewer.visualRows == nil or DugisGuideViewer.visualRows[DugisGuideUser.CurrentQuestIndex] == nil then
        return
    end    

    local highlightedRowTexture = DugisGuideViewer.visualRows[DugisGuideUser.CurrentQuestIndex]:GetNormalTexture();
    
    if DugisGuideUser.showLeftMenuForCurrentGuide then
        DugisMainBorder.bg:SetTexture(SCROLL_BACKGROUND)
        DugisMainLeftScrollFrame:Show()
        DugisMainLeftScrollFrame.bar:Show()
        DugisMainRightFrameHost:SetPoint("TOPLEFT", DugisMain, 395 - 15, -44)
        CurrentGuideExpandButton:SetPoint("BOTTOMLEFT", DugisMainRightFrameHost, -92 + 30, -1)
        CurrentGuideExpandButton:SetNormalTexture("Interface\\Buttons\\UI-SpellbookIcon-PrevPage-Up");
        CurrentGuideExpandButton:SetPushedTexture("Interface\\Buttons\\UI-SpellbookIcon-PrevPage-Down");
        CurrentGuideExpandButton:SetDisabledTexture("Interface\\Buttons\\UI-SpellbookIcon-PrevPage-Disabled");
        if highlightedRowTexture then
            highlightedRowTexture:SetTexCoord(0, 2, 0, 1)
        end
    else
        DugisMainBorder.bg:SetTexture(SCROLLESS_BACKGROUND)
        DugisMainLeftScrollFrame:Hide()
        DugisMainRightFrameHost:SetPoint("TOPLEFT", DugisMain, 8, -44)
        DugisMainLeftScrollFrame:Hide()
        CurrentGuideExpandButton:SetNormalTexture("Interface\\Buttons\\UI-SpellbookIcon-NextPage-Up");
        CurrentGuideExpandButton:SetPushedTexture("Interface\\Buttons\\UI-SpellbookIcon-NextPage-Down");
        CurrentGuideExpandButton:SetDisabledTexture("Interface\\Buttons\\UI-SpellbookIcon-NextPage-Disabled");
        CurrentGuideExpandButton:SetPoint("BOTTOMLEFT", DugisMainRightFrameHost, 280 + 30 , -1)
        if highlightedRowTexture then
            highlightedRowTexture:SetTexCoord(0, 1, 0, 1)
        end
    end
end

local lastTime = GetTime()
function DugisGuideViewer:PlayCompletionSound(soundSetting)
	local now = GetTime()
	--DugisGuideViewer:DebugFormat("PlayCompletionSound", "lastTime", lastTime, "now", now, "sound", DugisGuideViewer:GetDB(soundSetting))
	if now-lastTime > 2 then
		PlaySoundFile(DugisGuideViewer:GetDB(soundSetting))
	end
	lastTime = now
end

local lastCUFire
function DugisGuideViewer:CRITERIA_UPDATE()
	local elapsed = GetTime()
	if lastCUFire==elapsed then return end
	lastCUFire = elapsed
	DugisGuideViewer:Guide_CRITERIA_UPDATE()
end


function DugisGuideViewer.TableAppend(t, ...)
	local n = select("#", ...)
	for i=1,n do
		tinsert(t, (select(i, ...)))
	end
end

function DugisGuideViewer:PET_BATTLE_OPENING_START()
	DugisGuideUser.PetBattleOn = true
	if self:UserSetting(DGV_SHOWONOFF) == true then	DugisOnOffButton:Hide() end
	if DugisGuideViewer:GuideOn() then 
		--DugisGuideViewer:TurnOff()
		if DugisGuideViewer:IsModuleLoaded("SmallFrame") and (not ObjectiveTrackerFrame.collapsed or not DugisGuideViewer:UserSetting(DGV_ANCHOREDSMALLFRAME)) then 
			DugisGuideViewer.Modules.SmallFrame.Frame:Hide()
		end
		if DugisGuideViewer:IsModuleLoaded("DugisArrow") and DugisGuideViewer.Modules.DugisArrow.waypoints then
			DugisArrowFrame:Hide()
		end	
		if DugisGuideViewer:IsModuleLoaded("Target") and DugisGuideViewer.CurrentTitle then
			DugisGuideViewer.Modules.Target.Frame:Hide()
			DugisGuideViewerActionItemFrame:Hide()
			DugisSecureQuestButton:Hide()			
		end
		if DugisGuideViewer:IsModuleLoaded("ModelViewer") then
			DugisGuideViewer.Modules.ModelViewer.Frame:Hide()
		end
		DugisGuideViewer:UpdateIconStatus()
	end
	DugisGuideViewer:RegisterEvent("PET_BATTLE_OVER")
end

function DugisGuideViewer:PET_BATTLE_OVER()
	DugisGuideUser.PetBattleOn = false
	if self:UserSetting(DGV_SHOWONOFF) then	DugisOnOffButton:Show() end
	if DugisGuideViewer:GuideOn() then
		if DugisGuideViewer:IsModuleLoaded("SmallFrame") and (not ObjectiveTrackerFrame.collapsed or not DugisGuideViewer:UserSetting(DGV_ANCHOREDSMALLFRAME)) then
			DugisGuideViewer.Modules.SmallFrame.Frame:Show()
		end
		if DugisGuideViewer:IsModuleLoaded("DugisArrow") and DugisGuideViewer.Modules.DugisArrow.waypoints and DugisGuideViewer:UserSetting(DGV_DUGIARROW) then
			DugisArrowFrame:Show()
		end

		if DugisGuideViewer:IsModuleLoaded("Target") and DugisGuideViewer.CurrentTitle then
			DugisGuideViewer:FinalizeTarget()		
		end
		if DugisGuideViewer:IsModuleLoaded("ModelViewer") then
			DugisGuideViewer.Modules.ModelViewer:Finalize()
		end		
		--DugisGuideViewer:TurnOn()
		DugisGuideViewer:UpdateIconStatus()
	end
	DugisGuideViewer:UnregisterEvent("PET_BATTLE_OVER")
end

--2656
--/script DugisGuideViewer:isLearnedSpell(2656)
function DugisGuideViewer:isLearnedSpell(spellIdToCheck)
    local allButtons = {}
    allButtons[1] = PrimaryProfession1.button1
    allButtons[2] = PrimaryProfession1.button2    
    allButtons[3] = PrimaryProfession2.button1
    allButtons[4] = PrimaryProfession2.button2
    allButtons[5] = SecondaryProfession1.button1
    allButtons[6] = SecondaryProfession1.button2    
    allButtons[7] = SecondaryProfession2.button1
    allButtons[8] = SecondaryProfession2.button2    
    allButtons[9] = SecondaryProfession3.button1
    allButtons[10] = SecondaryProfession3.button2    
    allButtons[11] = SecondaryProfession4.button1
    allButtons[12] = SecondaryProfession4.button2
    
    local isLearned = false
    
    LuaUtils:foreach(allButtons, function(button)
        local parent =  button:GetParent()
        if parent ~= nil then
            local spellIndex = button:GetID() + (parent.spellOffset or 0)
            local texture = GetSpellBookItemTexture(spellIndex, SpellBookFrame.bookType)
            local spellName, subSpellName = GetSpellBookItemName(spellIndex, SpellBookFrame.bookType)
            local skillType, spellId = GetSpellBookItemInfo(spellIndex, SpellBookFrame.bookType) --or GetSpellBookItemInfo(spellName)
            local name, rank, icon, castingTime, minRange, maxRange, spellID = GetSpellInfo(spellId)
            local isShown = button:IsShown()
            if tonumber(spellId) == tonumber(spellIdToCheck) and isShown then
                isLearned = true
            end
        end
        
    end)
    print(isLearned)
    return isLearned
end

--Returns structure for SetTreeFrameData
function DugisGuideViewer:GetLocationsAndPortalsByText(text)
    local nodes = {}
    
    local achevementsByLocation = searchAchievementWaypointsByMapName(text)   
    LuaUtils:foreach(achevementsByLocation, function(coordinates, areaName)
        local mapId = self:GetMapIDFromName(areaName)
        local localizedMapName =  GetMapNameByID(mapId)
        
        nodes[#nodes+1] = {nodeName = DugisLocals["Locations in"].. " " .. (localizedMapName or areaName), leafs = {}}
        LuaUtils:foreach(coordinates, function(value)
            local leafs = nodes[#nodes].leafs
            leafs[#leafs + 1] = {name = value.subzoneName or "", data = value}
        end)
    end)
    
    --Searching for portals
    local portalNodeAlreadyAdded = false
    for mapId, value in pairs(self.Modules.TaxiData.InstancePortals) do
       local id_coord_aId_critIndex = LuaUtils:split(value, ":")
       local coordinates = id_coord_aId_critIndex[2]
        
       local destMapIdString, destFloorString, destLocString, sourceMapIdString, sourceFloorString, sourceLocString = strsplit(":", value)
       local mPort,fPort,xPort,yPort =  tonumber(destMapIdString), tonumber(destFloorString),  self:UnpackXY(destLocString)
    
       local mapName = GetMapNameByID(mapId)
       local searchKey = strupper(text)
       
       if strupper(mapName):match(searchKey) then
           if not portalNodeAlreadyAdded then
               nodes[#nodes+1] = {nodeName = DugisLocals["Instance Portal"], leafs = {}}
           end
           portalNodeAlreadyAdded = true
           
           local leafs = nodes[#nodes].leafs
           leafs[#leafs + 1] = {name = mapName, data = {mapName = mapName, x=xPort, y=yPort, mapId = mapId, f = fPort, isPortal = true}}
       end
    end
    
    return nodes
end



    
    
