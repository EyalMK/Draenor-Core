local DGV = DugisGuideViewer
local LFG = DGV:RegisterModule("LFG")
LFG.essential = true
local _
function LFG:Initialize()

	local GETLFGDUNGEONINFO_MISS_LIMIT = 54
	local getLFGDungeonInfoMisses
	local function IterateLFG(invariant, control)
		if not control then 
			control = 0
			getLFGDungeonInfoMisses = 0
		end
		while true do
			control = control + 1
			local name, typeID, subtypeID, minLevel, maxLevel, recLevel, minRecLevel, maxRecLevel, expansionLevel, groupID, textureFilename, difficulty, maxPlayers, description, isHoliday = GetLFGDungeonInfo(control)
			if not name then
				getLFGDungeonInfoMisses = getLFGDungeonInfoMisses + 1
				if getLFGDungeonInfoMisses==GETLFGDUNGEONINFO_MISS_LIMIT then return end
			else
				getLFGDungeonInfoMisses = 0
				if not LFGIsIDHeader(control) then
					return control, name, typeID, subtypeID, minLevel, maxLevel, recLevel, minRecLevel, maxRecLevel, expansionLevel, groupID, textureFilename, difficulty, maxPlayers, description, isHoliday
				end
			end
		end
	end
	
	local function IterateEligibleLFD(invariant, control)
		local playerLevel = UnitLevel("player")
		local name, typeID, subtypeID, minLevel, maxLevel, recLevel, minRecLevel, maxRecLevel, expansionLevel, groupID, textureFilename, difficulty, maxPlayers, description, isHoliday
	
		while true do
			control, name, typeID, subtypeID, minLevel, maxLevel, recLevel, minRecLevel, maxRecLevel, expansionLevel, groupID, textureFilename, difficulty, maxPlayers, description, isHoliday = IterateLFG(invariant, control)
			if not control then return end
			if playerLevel>=minLevel and playerLevel<=maxLevel and typeID==1 and LFGLockList and not LFGLockList[control] then
				return control, name, typeID, subtypeID, minLevel, maxLevel, recLevel, minRecLevel, maxRecLevel, expansionLevel, groupID, textureFilename, difficulty, maxPlayers, description, isHoliday
			end
		end
	end
	
	function DGV:GetLFD(mapId)
		local playerLevel = UnitLevel("player")
		for id,map in pairs(LFG.LFGMapLookup) do
			if map==mapId then
				local name, typeID, subtypeID, minLevel, maxLevel, recLevel, minRecLevel, maxRecLevel, expansionLevel, groupID, textureFilename, difficulty, maxPlayers, description, isHoliday = GetLFGDungeonInfo(id)
				if name and not LFGIsIDHeader(id) and playerLevel>=minLevel and playerLevel<=maxLevel and typeID==1 and LFGLockList and not LFGLockList[id] then
					return id, name, typeID, subtypeID, minLevel, maxLevel, recLevel, minRecLevel, maxRecLevel, expansionLevel, groupID, textureFilename, difficulty, maxPlayers, description, isHoliday
				end
			end
		end
	end
	
	function DGV:IsDungeon(mapId)
		for _,map in pairs(LFG.LFGMapLookup) do
			if map==mapId then return true end
		end
	end
	
	local function ShowPVEFrame()
		if not PVEFrame:IsShown() then
			LFDMicroButton:GetScript("OnClick")(LFDMicroButton, "LeftButton")
		end
	end
	
	local function HidePVEFrame()
		if PVEFrame:IsShown() then
			HideUIPanel(PVEFrame)
		end
	end
	
	local function ShowLFD()
		ShowPVEFrame()
		PVEFrame_ShowFrame("GroupFinderFrame")
		LFDQueueFrame_Update() --defines lists
	end
	
	local function QueueForLFD(id)
		ClearAllLFGDungeons(LE_LFG_CATEGORY_LFD);
		SetLFGDungeon(LE_LFG_CATEGORY_LFD, id);
		JoinLFG(LE_LFG_CATEGORY_LFD);
		local _, tank, heal, dps = GetLFGRoles()
		if not (tank or heal or dps) then
			ShowLFD() 
			for loopId in IterateEligibleLFD do
				LFGDungeonList_SetDungeonEnabled(loopId, loopId==id)
			end
			LFGListUpdateHeaderEnabledAndLockedStates(LFDDungeonList, LFGEnabledList, LFDHiddenByCollapseList)
			LFDQueueFrameSpecificList_Update()
		end
	end
	
	function DGV:IsLFGQueued()
		for i=1, NUM_LE_LFG_CATEGORYS do
			 if GetLFGMode(i)=="queued" then return true end
		end
	end
	
	-- IsInLFGDungeon()
	function DGV:IsLFGTeleportAvailable()
		if not IsPartyLFG() then return end
		for i=1, NUM_LE_LFG_CATEGORYS do
			if IsLFGModeActive(i) then return true end
		end
	end
	
	function DGV:LFGSelected(id)
		if DGV:IsLFGTeleportAvailable() then
			LFGTeleport()
		else
			QueueForLFD(id)
		end
	end
	
	--/dump DugisGuideViewer:TestIterateEligibleLFD()
	function DGV:TestIterateEligibleLFD()
		local tbl = {}
		for id, name in IterateEligibleLFD do
			tbl[id] = name
		end
		return tbl
	end
	
	function LFG.UpdateLFGWorldLocation(event)
		if LFG.loaded and 
			(event=="PLAYER_ENTERING_WORLD" or
			event=="GROUP_ROSTER_UPDATE" or
			event=="LFG_UPDATE" or
			event=="LFG_ROLE_CHECK_UPDATE" or
			event=="LFG_PROPOSAL_UPDATE" or
			event=="LFG_PROPOSAL_SUCCEEDED" or
			event=="LFG_PROPOSAL_SHOW" or
			event=="LFG_QUEUE_STATUS_UPDATE") and
			not IsInInstance() then
			DugisGuideUser.LFGWorldLocation = DGV.Modules.TaxiDB:GetPackedPlayerLocation()
		end
	end
	
	local function OnLFGTeleport()
		LFG.UpdateLFGWorldLocation()
	end
	
	hooksecurefunc("LFGTeleport", OnLFGTeleport)
	
	function LFG:Load()
		DGV:RegisterEvent("PLAYER_ENTERING_WORLD")
		DGV:RegisterEvent("GROUP_ROSTER_UPDATE")
		DGV:RegisterEvent("LFG_UPDATE")
		DGV:RegisterEvent("LFG_ROLE_CHECK_UPDATE")
		DGV:RegisterEvent("LFG_PROPOSAL_UPDATE")
		DGV:RegisterEvent("LFG_PROPOSAL_SUCCEEDED")
		DGV:RegisterEvent("LFG_PROPOSAL_SHOW")
		DGV:RegisterEvent("LFG_QUEUE_STATUS_UPDATE")
	
		DGV:RegisterGlobalEventHandler(LFG.UpdateLFGWorldLocation)
	end

	function LFG:Unload()
		DGV:UnregisterEvent("PLAYER_ENTERING_WORLD")
		DGV:UnregisterEvent("GROUP_ROSTER_UPDATE")
		DGV:UnregisterEvent("LFG_UPDATE")
		DGV:UnregisterEvent("LFG_ROLE_CHECK_UPDATE")
		DGV:UnregisterEvent("LFG_PROPOSAL_UPDATE")
		DGV:UnregisterEvent("LFG_PROPOSAL_SUCCEEDED")
		DGV:UnregisterEvent("LFG_PROPOSAL_SHOW")
		DGV:UnregisterEvent("LFG_QUEUE_STATUS_UPDATE")
		
		DGV:UnregisterGlobalEventHandler(LFG.UpdateLFGWorldLocation)
	end
	
	function LFG:OnModulesLoaded()
	end
	
	--[[LFG_CATEGORY_NAMES = {
		[LE_LFG_CATEGORY_LFD] = LOOKING_FOR_DUNGEON,
		[LE_LFG_CATEGORY_RF] = RAID_FINDER,
		[LE_LFG_CATEGORY_SCENARIO] = SCENARIOS,
		[LE_LFG_CATEGORY_LFR] = LOOKING_FOR_RAID,
	}]]
	--/dump LFDQueueFrameSpecificListButton2.instanceName:GetText()
	--/dump LFDQueueFrameSpecificListButton2.id
	--[[function LFG_QueueForInstanceIfEnabled(category, queueID)
		if ( not LFGIsIDHeader(queueID) and LFGEnabledList[queueID] and not LFGLockList[queueID] ) then
			SetLFGDungeon(category, queueID);
			return true;
		end
		return false;
	end]]
	--ClearAllLFGDungeons(category);
    --SetLFGDungeon(category, joinType);
    --JoinLFG(category);
	--local name, typeID, subtypeID, minLevel, maxLevel, recLevel, minRecLevel, maxRecLevel, expansionLevel, groupID, textureFilename, difficulty, maxPlayers, description, isHoliday = GetLFGDungeonInfo(value);
	
	--[[function IdentifyMissingInstancePortals()
		for id,name,typeID in IterateLFG do
			if typeID==1 and not DGV.Modules.TaxiData.InstancePortals[] then
				
			end
		end
	end]]
	
	--/run DebugMissingInstancePortals()
	function DebugMissingInstancePortals()
		for _,mapId in pairs(LFG.LFGMapLookup) do
			if not DGV.Modules.TaxiData.InstancePortals[mapId] then
				DGV:DebugFormat("DebugMissingInstancePortals", "mapId", mapId, "DGV:GetMapNameFromID(mapId)", DGV:GetMapNameFromID(mapId))
			end
		end
	end
	
	LFG.LFGMapLookup = 
	{
		749, -- [1]
		898, -- [2]
		nil, -- [3]
		680, -- [4]
		nil, -- [5]
		756, -- [6]
		nil, -- [7]
		764, -- [8]
		nil, -- [9]
		688, -- [10]
		nil, -- [11]
		690, -- [12]
		nil, -- [13]
		691, -- [14]
		nil, -- [15]
		761, -- [16]
		[241] = 533,
		[32] = 721,
		[631] = 875,
		[34] = 699,
		[136] = 797,
		[274] = 765,
		[140] = 728,
		[36] = 699,
		[286] = 728,
		[146] = 726,
		[148] = 732,
		[150] = 723,
		[302] = 767,
		[40] = 765,
		[322] = 757,
		[326] = 756,
		[330] = 721,
		[465] = 876,
		[469] = 876,
		[473] = 871,
		[178] = 722,
		[180] = 723,
		[182] = 733,
		[184] = 728,
		[186] = 726,
		[188] = 797,
		[190] = 731,
		[192] = 730,
		[303] = 753,
		[202] = 523,
		[204] = 533,
		[206] = 528,
		[208] = 526,
		[210] = 521,
		[212] = 525,
		[214] = 534,
		[216] = 530,
		[307] = 768,
		[311] = 769,
		[319] = 769,
		[323] = 753,
		[327] = 764,
		[466] = 877,
		[470] = 877,
		[474] = 874,
		[242] = 523,
		[321] = 759,
		[138] = 710,
		[38] = 699,
		[137] = 725,
		[164] = 874,
		[170] = 734,
		[172] = 730,
		[174] = 731,
		[272] = 750,
		[276] = 704,
		[20] = 760,
		[24] = 686,
		[288] = 764,
		[147] = 727,
		[149] = 722,
		[151] = 724,
		[304] = 757,
		[554] = 887,
		[312] = 747,
		[287] = 704,
		[320] = 768,
		[163] = 871,
		[218] = 522,
		[220] = 536,
		[226] = 520,
		[171] = 733,
		[173] = 729,
		[472] = 898,
		[471] = 875,
		[179] = 732,
		[181] = 724,
		[183] = 734,
		[185] = 727,
		[187] = 725,
		[189] = 710,
		[191] = 729,
		[467] = 885,
		[205] = 524,
		[324] = 767,
		[22] = 692,
		[273] = 750,
		[203] = 524,
		[26] = 750,
		[207] = 525,
		[209] = 521,
		[211] = 528,
		[213] = 526,
		[215] = 534,
		[217] = 530,
		[219] = 522,
		[221] = 536,
		[630] = 887,
		[225] = 520,
		[325] = 747,
		[519] = 885,
		[285] = 874,
		[464] = 867,
		[468] = 867,
		[30] = 704,
		[305] = 759,
		[28] = 687,
	}
	
	local function GetMapIDFromLFGName(destName)
		if DGV.guidelist["I"] then 
			for _,title in ipairs(DGV.guidelist["I"]) do
				local zone = tonumber(title:match("^(%d+)"))
				if not zone then
					zone = tonumber(DGV:GetMapIDFromName(title:match("^(.-)%s?%(")))
				end
				if not zone then
					DGV:DebugFormat("GetMapIDFromLFGName", "title", title, "zone", zone)
				end
				local blizzConversion = GetMapNameByID(zone)
				local dgvConversion = DGV:GetMapNameFromID(zone)
				if zone and 
					(destName==blizzConversion or destName=="The "..blizzConversion or "The "..destName==blizzConversion or
					destName==dgvConversion or destName=="The "..dgvConversion or "The "..destName==dgvConversion) then
					return zone
				end
			end
		end 
		return nil
	end
	
	-- /run ImportLFGMapLookup()
	function ImportLFGMapLookup()
		if not TaxiDataCollection.LFGMapLookup then TaxiDataCollection.LFGMapLookup = {} end
		wipe(TaxiDataCollection.LFGMapLookup)
		for id,name,typeID in IterateLFG do
			if typeID==1 then
				name = name:match("(.*) %- ") or name
				TaxiDataCollection.LFGMapLookup[id] = GetMapIDFromLFGName(name) or LFG.LFGMapLookup[id]
				if not TaxiDataCollection.LFGMapLookup[id] then
					DGV:DebugFormat("ImportLFGMapLookup fail", "name", name, "id", id)
				end
			end
		end
	end
end