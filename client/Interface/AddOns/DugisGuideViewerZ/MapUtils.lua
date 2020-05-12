local mapdata = LibStub("LibMapData-1.0-Dugi")
local astrolabe = DongleStub("Astrolabe-1.0-Dugi")
local DGV = DugisGuideViewer
DGV.astrolabe = astrolabe
DGV.mapdata = mapdata
local GetCreateTable, InitTable = DGV.GetCreateTable, DGV.InitTable
local _

--/run DGV:ShowMapData(mapId, ...)
function DGV:ShowMapData(mapId, ...)
	local tbl = {}
	local mapData = {}
	tbl[mapId] = mapData
	local numFloors = select("#", ...)
	SetMapByID(mapId)
	local _, TLx, TLy, BRx, BRy = GetCurrentMapZone();
	if ( TLx and TLy and BRx and BRy ) then
		if not ( TLx < BRx ) then
			TLx = -TLx;
			BRx = -BRx;
		end
		if not ( TLy < BRy) then
			TLy = -TLy;
			BRy = -BRy;
		end
		mapData.width = BRx - TLx
		mapData.height = BRy - TLy
		mapData.xOffset = TLx
		mapData.yOffset = TLy
	end
	if ( numFloors > 0 ) then
		for i = 1, numFloors do
			local f = select(i, ...)
			SetDungeonMapLevel(f);
			local _, TLx, TLy, BRx, BRy = GetCurrentMapDungeonLevel();
			if ( TLx and TLy and BRx and BRy ) then
				mapData[f] = {};
				if not ( TLx < BRx ) then
					TLx = -TLx;
					BRx = -BRx;
				end
				if not ( TLy < BRy) then
					TLy = -TLy;
					BRy = -BRy;
				end
				mapData[f].width = BRx - TLx
				mapData[f].height = BRy - TLy
				mapData[f].xOffset = TLx
				mapData[f].yOffset = TLy
			end
		end
	end
	DGV:DebugFormat("ShowMapData", "tbl", tbl)
end

function DGV:GetMapNameFromID(mapId)
	--return mapdata:MapLocalize(mapId) old method calling it from LibMapData
	if mapId then 
		return GetMapNameByID(mapId) -- get it from game. 
	else
		return nil
	end
end

function DGV:GetMapIDFromName(mapName)
	return mapdata:MapAreaId(mapName)
end

--[[function DGV:InitMapping( )
	DGV:initAnts()
	DGV.DugisArrow:initArrow()
end]]

function DGV:TranslateWorldMapPosition(map, floor, x, y, M, F)
	return astrolabe:TranslateWorldMapPosition(map, floor, x, y, M, F)
end

function DGV:PlaceIconOnMinimap( icon, mapID, mapFloor, x, y)
	if x and y and mapID then
		astrolabe:PlaceIconOnMinimap(icon, mapID, mapFloor, x, y)
	end
end

function DGV:GetMapID(ContToUse, ZoneToUse)
	return astrolabe:GetMapID(ContToUse, ZoneToUse)
end

-- If forcedAbsoluteX and forcedAbsoluteY are nill the absolute position of the icon will not be calculated but forcedAbsoluteX and forcedAbsoluteY will be used instead
function DGV:PlaceIconOnWorldMap( frame, icon, mapID, mapFloor, x, y, forcedAbsoluteX, forcedAbsoluteY)		
	if x and y and mapID then
		astrolabe:PlaceIconOnWorldMap(frame, icon, mapID, mapFloor, x, y, forcedAbsoluteX, forcedAbsoluteY)
	end
	
	DGV:CheckForArrowChange()
	
	if DGV.WrongInstanceFloor --[[or not DGV.WaypointsShown]] then
		icon.icon:Hide()
	else
		icon.icon:Show()
	end
end

function DGV:ComputeDistance( m1, f1, x1, y1, m2, f2, x2, y2 )
	
	return astrolabe:ComputeDistance( m1, f1, x1, y1, m2, f2, x2, y2 )
end

function DGV:IsValidDistance( m, f, x, y )
	local dist, dx, dy = DGV:GetDistanceFromPlayer(m, f, x, y)
	if dist and dx and dy then
		return true
	end
end

function DGV:GetDistanceFromPlayer(m, f, x, y)
	local pmap, pfloor, px, py = DGV:GetPlayerPosition()
	return astrolabe:ComputeDistance(pmap, pfloor, px, py, m, f, x/100, y/100) 
end

function DGV:WorldMapFrameOnShow()
	DGV:OnMapChangeUpdateArrow( )
end
WorldMapFrame:HookScript( "OnShow", DGV.WorldMapFrameOnShow )


function DGV:GetUnitPosition( unit, noMapChange )
	return astrolabe:GetUnitPosition( unit, noMapChange )
end


function DGV:GetPlayerPosition()

    local x, y = GetPlayerMapPosition("player")
    if x and y and x > 0 and y > 0 then
	local map, floor = GetCurrentMapAreaID(), GetCurrentMapDungeonLevel();
        floor = floor or self:GetDefaultFloor(map)
        return map, floor, x, y
    end

    if WorldMapFrame:IsVisible() then
        return
    end

    SetMapToCurrentZone()
    local x, y = GetPlayerMapPosition("player")

    if x <= 0 and y <= 0 then
        return
    end

    local map, floor = GetCurrentMapAreaID(), GetCurrentMapDungeonLevel();
    floor = floor or self:GetDefaultFloor(map)
    return map, floor, x, y
end

function DGV:GetPlayerMapPositionDisruptive()
	local orig_mapId, orig_level = GetCurrentMapAreaID(), GetCurrentMapDungeonLevel()
	SetMapToCurrentZone()
	local DugisArrow = DGV.Modules.DugisArrow
	local m1, f1, x1, y1 =  DGV.astrolabe:GetUnitPosition("player")
	if not m1 or m1==0 then
		m1, f1, x1, y1 = 
			DugisArrow.map, DugisArrow.floor,
			DugisArrow.pos_x, DugisArrow.pos_y
	end
	if orig_mapId~=m1 or orig_level~=f1 then
		SetMapByID(orig_mapId)
		SetDungeonMapLevel(orig_level)
	end
	return m1, f1, x1, y1
end

function DGV:GetDefaultFloor(map)
    local floors = astrolabe:GetNumFloors(map) == 0 and 0 or 1
    return floors == 0 and 0 or 1
end

local czLookup = {}
local function LookupSubzones(cIndex, zMapId, ...)
	for loopIndex=1, select("#", ...), 2 do
		local sMapId = select(loopIndex, ...)
		local sName = select(loopIndex + 1, ...)
		local sIndex = math.floor(loopIndex/2)
		czLookup[sMapId] = {cIndex, sIndex, sName, zMapId, "subzone"}
	end
end

local function LookupZones(cIndex,  ...)
	for loopIndex=1, select("#", ...), 2 do
		local zMapId = select(loopIndex, ...)
		local zName = select(loopIndex + 1, ...)
		local zIndex = math.floor(loopIndex/2)
		czLookup[zMapId] = {cIndex, zIndex, zName, nil, "zone"}
		LookupSubzones(cIndex, zMapId, GetMapSubzones(zMapId))
	end
end

local function LookupContinents(...)
	for loopIndex=1, select("#", ...), 2 do
		local cMapId = select(loopIndex, ...)
		local cName = select(loopIndex + 1, ...)
		local cIndex = math.floor(loopIndex/2) + 1
		czLookup[cMapId] = {0, cIndex, cName, nil, "continent"}
		LookupZones(cIndex, GetMapZones(cIndex))
	end
end

LookupContinents(GetMapContinents())

local function ContinentName2ContinentId(continentName, ...)
	for loopIndex=1, select("#", ...), 2 do
		local cMapId = select(loopIndex, ...)
		local cName = select(loopIndex + 1, ...)
        local cIndex = math.floor(loopIndex/2) + 1
        if cName == continentName then
            return cIndex
        end
    end
end

--zone name[:continent name]
function DGV:GetZoneIdByName(name)
	if name == "Vale of Eternal Blossoms" then return 811 end --cheap fix otherwise it returns 937 which is another map of the same name but not used. 
	if type(name)~="string" then return nil end
    
    local zoneName_continentName = LuaUtils:split(name, ":")
    local zoneName = zoneName_continentName[1]
    local continentName = nil
    local continentId = nil
    
    if zoneName_continentName[2] ~= nil then
        continentName = zoneName_continentName[2]
        continentId = ContinentName2ContinentId(continentName, GetMapContinents())
    end
    
	zoneName = zoneName:lower():trim()
    
    local resultContinent = nil
    local resultZone = nil
    local resultSubzone = nil
    
	for id, tbl in pairs(czLookup) do
		if tbl[3]:lower():trim()==zoneName then
            local cIndex = tonumber(tbl[1])
        
            if tbl[5] == "continent" then
                resultContinent = id
            end
            
            if tbl[5] == "zone" then
                if continentId == nil or continentId == cIndex then
                    resultZone = id
                end
            end
            
            if tbl[5] == "subzone" then
                if continentId == nil or continentId == cIndex then
                    resultSubzone = id
                end
            end
		end
	end
    
    --print(resultContinent, resultZone, resultSubzone)
     
    if resultZone then
        return resultZone
    end
   
    if resultSubzone then
        return resultSubzone
    end    
    
    if resultContinent then
        return resultContinent
    end
end

local function getCZ(mapId)
	local c, z 
	if czLookup[mapId] then 
		c, z = unpack(czLookup[mapId])
	end
	return c or 0, z or 0
end

function DGV:GetCZByMapId(mapId)
	return getCZ(mapId)
end

function DGV.ContinentMapIterator(invariant, control)
	while true do
		control, tbl = next(czLookup, control)
		if not control then return end
		if tbl[1]==invariant then
			return control
		end
	end
end