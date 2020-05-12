--[[
Name: Astrolabe
Revision: $Rev: 160 $
$Date: 2012-12-09 18:33:30 -0500 (Sun, 09 Dec 2012) $
Author(s): Esamynn (esamynn at wowinterface.com)
Inspired By: Gatherer by Norganna
             MapLibrary by Kristofer Karlsson (krka at kth.se)
Documentation: http://wiki.esamynn.org/Astrolabe
SVN: http://svn.esamynn.org/astrolabe/
Description:
	This is a library for the World of Warcraft UI system to place
	icons accurately on both the Minimap and on Worldmaps.  
	This library also manages and updates the position of Minimap icons 
	automatically.  

Copyright (C) 2006-2012 James Carrothers

License:
	This library is free software; you can redistribute it and/or
	modify it under the terms of the GNU Lesser General Public
	License as published by the Free Software Foundation; either
	version 2.1 of the License, or (at your option) any later version.

	This library is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
	Lesser General Public License for more details.

	You should have received a copy of the GNU Lesser General Public
	License along with this library; if not, write to the Free Software
	Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA

Note:
	This library's source code is specifically designed to work with
	World of Warcraft's interpreted AddOn system.  You have an implicit
	licence to use this library with these facilities since that is its
	designated purpose as per:
	http://www.fsf.org/licensing/licenses/gpl-faq.html#InterpreterIncompat
]]

-- WARNING!!!
-- DO NOT MAKE CHANGES TO THIS LIBRARY WITHOUT FIRST CHANGING THE LIBRARY_VERSION_MAJOR
-- STRING (to something unique) OR ELSE YOU MAY BREAK OTHER ADDONS THAT USE THIS LIBRARY!!!
ASTROLABE_VERBOSE = false
local LIBRARY_VERSION_MAJOR = "Astrolabe-1.0-Dugi"
local LIBRARY_VERSION_MINOR = tonumber(string.match("$Revision: 160 $", "(%d+)") or 1)

if not DongleStub then error(LIBRARY_VERSION_MAJOR .. " requires DongleStub.") end
if not DongleStub:IsNewerVersion(LIBRARY_VERSION_MAJOR, LIBRARY_VERSION_MINOR) then return end

local Astrolabe = {};
local _

-- define local variables for Data Tables (defined at the end of this file)
local WorldMapSize, MicroDungeonSize, MinimapSize, ValidMinimapShapes, zeroData, AlternateAreas

function Astrolabe:GetVersion()
	return LIBRARY_VERSION_MAJOR, LIBRARY_VERSION_MINOR;
end


--------------------------------------------------------------------------------------------------------------
-- Config Constants
--------------------------------------------------------------------------------------------------------------

local configConstants = { 
	MinimapUpdateMultiplier = true, 
}

-- this constant is multiplied by the current framerate to determine
-- how many icons are updated each frame
Astrolabe.MinimapUpdateMultiplier = 1;


--------------------------------------------------------------------------------------------------------------
-- Working Tables
--------------------------------------------------------------------------------------------------------------

Astrolabe.LastPlayerPosition = { 0, 0, 0, 0 };
Astrolabe.MinimapIcons = {};
Astrolabe.IconAssociations = {};
Astrolabe.IconsOnEdge = {};
Astrolabe.IconsOnEdge_GroupChangeCallbacks = {};
Astrolabe.TargetMinimapChanged_Callbacks = {};

Astrolabe.MinimapIconCount = 0
Astrolabe.ForceNextUpdate = false;
Astrolabe.IconsOnEdgeChanged = false;
Astrolabe.DefaultEdgeRangeMultiplier = 1;
Astrolabe.EdgeRangeMultiplier = {};
setmetatable(Astrolabe.EdgeRangeMultiplier,
	{
		__index = function(t,k)
			local d = Astrolabe.DefaultEdgeRangeMultiplier; -- this works because we always update the Astrolabe local variable
			if ( type(k) == "table" ) then t[k] = d; end;
			return d;
		end
	}
);

-- This variable indicates whether we know of a visible World Map or not.  
-- The state of this variable is controlled by the AstrolabeMapMonitor library.  
Astrolabe.WorldMapVisible = false;

local AddedOrUpdatedIcons = {}
local MinimapIconsMetatable = { __index = AddedOrUpdatedIcons }


--------------------------------------------------------------------------------------------------------------
-- Local Pointers for often used API functions
--------------------------------------------------------------------------------------------------------------

local twoPi = math.pi * 2;
local atan2 = math.atan2;
local sin = math.sin;
local cos = math.cos;
local abs = math.abs;
local sqrt = math.sqrt;
local min = math.min
local max = math.max
local yield = coroutine.yield
local next = next
local GetFramerate = GetFramerate
local band = bit.band
local issecurevariable = issecurevariable

local real_GetCurrentMapAreaID = GetCurrentMapAreaID
local function GetCurrentMapAreaID()
	local id = real_GetCurrentMapAreaID();
	if ( id < 0 and GetCurrentMapContinent() == WORLDMAP_WORLD_ID ) then
		return 0;
	end
	return id;
end


--------------------------------------------------------------------------------------------------------------
-- Internal Utility Functions
--------------------------------------------------------------------------------------------------------------

local function assert(level,condition,message)
	if not condition then
		error(message,level)
	end
end

local function argcheck(value, num, ...)
	assert(1, type(num) == "number", "Bad argument #2 to 'argcheck' (number expected, got " .. type(level) .. ")")
	
	for i=1,select("#", ...) do
		if type(value) == select(i, ...) then return end
	end
	
	local types = strjoin(", ", ...)
	local name = string.match(debugstack(2,2,0), ": in function [`<](.-)['>]")
	error(string.format("Bad argument #%d to 'Astrolabe.%s' (%s expected, got %s)", num, name, types, type(value)), 3)
end

local function tryGetMicroDungeonFloor(system, areaID, f)
	if MicroDungeonSize[system][f].parent==areaID then
		return MicroDungeonSize[system][f]
	elseif AlternateAreas[areaID] then
		for _,m in ipairs(AlternateAreas[areaID]) do
			local md = WorldMapSize[m] and 
				WorldMapSize[m].system and 
				MicroDungeonSize[WorldMapSize[m].system]
			if md and md[f] and md[f].parent==m then
				return md[f]
			end
		end
	end
	return MicroDungeonSize[system][f]
end

local function getFloorData(areaID, mapData, f)
	if f==mapData.firstFloor then
		mapData = rawget(mapData, f) or mapData
	elseif f~=0 then
		mapData = rawget(mapData, f) or tryGetMicroDungeonFloor(mapData.originSystem, areaID, f)
	end
	return mapData
end

local function getSystemPosition( areaID, mapData, f, x, y )
	mapData = getFloorData(areaID, mapData, f)
	x = x * mapData.width + mapData.xOffset;
	y = y * mapData.height + mapData.yOffset;
	return x, y;
end

local function printError( ... )
	if ( ASTROLABE_VERBOSE) then
		print(...)
	end
end


--------------------------------------------------------------------------------------------------------------
-- General Utility Functions
--------------------------------------------------------------------------------------------------------------

function Astrolabe:ComputeDistance( m1, f1, x1, y1, m2, f2, x2, y2 )
	--[[
	argcheck(m1, 2, "number");
	assert(3, m1 >= 0, "ComputeDistance: Illegal map id to m1: "..m1);
	argcheck(f1, 3, "number", "nil");
	argcheck(x1, 4, "number");
	argcheck(y1, 5, "number");
	argcheck(m2, 6, "number");
	assert(3, m2 >= 0, "ComputeDistance: Illegal map id to m2: "..m2);
	argcheck(f2, 7, "number", "nil");
	argcheck(x2, 8, "number");
	argcheck(y2, 9, "number");
	--]]
	
	if not ( m1 and m2 and x1 and x2 ) then return end;

	f1 = f1 or min(#WorldMapSize[m1], 1);
	f2 = f2 or min(#WorldMapSize[m2], 1);
	
	local dist, xDelta, yDelta;
	if ( m1 == m2 and f1 == f2 ) then
		-- points in the same zone on the same floor
		local mapData = WorldMapSize[m1];
		mapData = getFloorData(m1, mapData, f1)
		xDelta = (x2 - x1) * mapData.width;
		yDelta = (y2 - y1) * mapData.height;
	
	else
		local map1 = WorldMapSize[m1];
		local map2 = WorldMapSize[m2];
		if map1 and map2 and( map1.system == map2.system ) then
			-- points within the same system (continent)
			x1, y1 = getSystemPosition(m1, map1, f1, x1, y1);
			x2, y2 = getSystemPosition(m2,map2, f2, x2, y2);
			xDelta = (x2 - x1);
			yDelta = (y2 - y1);
		
		elseif map1 and map2 then
			local s1 = map1.system;
			local s2 = map2.system;
			if ( (m1==0 or WorldMapSize[0][s1]) and (m2==0 or WorldMapSize[0][s2]) ) then
				x1, y1 = getSystemPosition(m1, map1, f1, x1, y1);
				x2, y2 = getSystemPosition(m1, map2, f2, x2, y2);
				if ( m1 ~= 0 ) then
					-- translate up from system 1
					local cont1 = WorldMapSize[0][s1];
					x1 = (x1 - cont1.xOffset) * cont1.scale;
					y1 = (y1 - cont1.yOffset) * cont1.scale;
				end
				if ( m2 ~= 0 ) then
					-- translate up from system 2
					local cont2 = WorldMapSize[0][s2];
					x2 = (x2 - cont2.xOffset) * cont2.scale;
					y2 = (y2 - cont2.yOffset) * cont2.scale; 
				end
				
				xDelta = x2 - x1;
				yDelta = y2 - y1;
			end
		
		end
	
	end
	if ( xDelta and yDelta ) then
		dist = sqrt(xDelta*xDelta + yDelta*yDelta);
	end
	return dist, xDelta, yDelta;
end

function Astrolabe:TranslateWorldMapPosition( M, F, xPos, yPos, nM, nF )
	--[[
	argcheck(M, 2, "number");
	argcheck(F, 3, "number", "nil");
	argcheck(xPos, 4, "number");
	argcheck(yPos, 5, "number");
	argcheck(nM, 6, "number");
	argcheck(nF, 7, "number", "nil");
	--]]
	
	if not ( M and nM ) then return end;
	F = F or min(#WorldMapSize[M], 1);
	nF = nF or min(#WorldMapSize[nM], 1);
	if ( nM < 0 ) then
		return;
	end
	
	local mapData;
	if ( M == nM and F == nF ) then
		return xPos, yPos;
	
	else
		local map = WorldMapSize[M];
		local nMap = WorldMapSize[nM];
		if ( map.system == nMap.system ) then
			-- points within the same system (continent)
			xPos, yPos = getSystemPosition(M, map, F, xPos, yPos);
			mapData = getFloorData(nM, WorldMapSize[nM], nF)
		
		else
			-- different continents, same world
			local S = map.system;
			local nS = nMap.system;
			if ( (M==0 or WorldMapSize[0][S]) and (nM==0 or WorldMapSize[0][nS]) ) then
				mapData = WorldMapSize[M];
				xPos, yPos = getSystemPosition(M, mapData, F, xPos, yPos);
				if ( M ~= 0 ) then
					-- translate up to world map if we aren't there already
					local cont = WorldMapSize[0][S];
					xPos = (xPos - cont.xOffset) * cont.scale;
					yPos = (yPos - cont.yOffset) * cont.scale;
					mapData = WorldMapSize[0];
				end
				if ( nM ~= 0 ) then
					-- translate down to the new continent
					local nCont = WorldMapSize[0][nS];
					xPos = (xPos / nCont.scale) + nCont.xOffset;
					yPos = (yPos / nCont.scale) + nCont.yOffset;
					mapData = getFloorData(nM, WorldMapSize[nM], nF)
				end
			
			else
				return;
			end
		
		end
		-- need to account for the offset in the new system so we can
		-- correctly translate into 0-1 style coordinates
		xPos = xPos - mapData.xOffset;
		yPos = yPos - mapData.yOffset;
	
	end
	
	return (xPos / mapData.width), (yPos / mapData.height);
end

--*****************************************************************************
-- This function will do its utmost to retrieve some sort of valid position 
-- for the specified unit, including changing the current map zoom (if needed).  
-- Map Zoom is returned to its previous setting before this function returns.  
--*****************************************************************************
function Astrolabe:GetUnitPosition( unit, noMapChange )
	local x, y = GetPlayerMapPosition(unit);
	if ( x <= 0 and y <= 0 ) then
		if ( noMapChange ) then
			-- no valid position on the current map, and we aren't allowed
			-- to change map zoom, so return
			return;
		end
		local lastMapID, lastFloor = GetCurrentMapAreaID(), GetCurrentMapDungeonLevel();
		SetMapToCurrentZone();
		x, y = GetPlayerMapPosition(unit);
		if ( x <= 0 and y <= 0 ) then
			-- attempt to zoom out once - logic copied from WorldMapZoomOutButton_OnClick()
				if ( ZoomOut() ) then
					-- do nothing
				elseif ( GetCurrentMapZone() ~= WORLDMAP_WORLD_ID ) then
					SetMapZoom(GetCurrentMapContinent());
				else
					SetMapZoom(WORLDMAP_WORLD_ID);
				end
			x, y = GetPlayerMapPosition(unit);
			if ( x <= 0 and y <= 0 ) then
				-- we are in an instance without a map or otherwise off map
				return;
			end
		end
		local M, F = GetCurrentMapAreaID(), GetCurrentMapDungeonLevel();
		if ( M ~= lastMapID or F ~= lastFloor ) then
			-- set map zoom back to what it was before
			SetMapByID(lastMapID);
			SetDungeonMapLevel(lastFloor);
		end
		return M, F, x, y;
	end
	return GetCurrentMapAreaID(), GetCurrentMapDungeonLevel(), x, y;
end

--*****************************************************************************
-- This function will do its utmost to retrieve some sort of valid position 
-- for the specified unit, including changing the current map zoom (if needed).  
-- However, if a monitored WorldMapFrame (See AstrolabeMapMonitor.lua) is 
-- visible, then will simply return nil if the current zoom does not provide 
-- a valid position for the player unit.  Map Zoom is NOT returned to its previous 
-- setting before this function returns, in order to provide better performance.  
--*****************************************************************************
function Astrolabe:GetCurrentPlayerPosition()
	local x, y = GetPlayerMapPosition("player");
	if ( x <= 0 and y <= 0 ) then
		if ( self.WorldMapVisible ) then
			-- we know there is a visible world map, so don't cause 
			-- WORLD_MAP_UPDATE events by changing map zoom
			return;
		end
		SetMapToCurrentZone();
		x, y = GetPlayerMapPosition("player");
		if ( x <= 0 and y <= 0 ) then
			-- attempt to zoom out once - logic copied from WorldMapZoomOutButton_OnClick()
				if ( ZoomOut() ) then
					-- do nothing
				elseif ( GetCurrentMapZone() ~= WORLDMAP_WORLD_ID ) then
					SetMapZoom(GetCurrentMapContinent());
				else
					SetMapZoom(WORLDMAP_WORLD_ID);
				end
			x, y = GetPlayerMapPosition("player");
			if ( x <= 0 and y <= 0 ) then
				-- we are in an instance without a map or otherwise off map
				return;
			end
		end
	end
	return GetCurrentMapAreaID(), GetCurrentMapDungeonLevel(), x, y;
end

function Astrolabe:GetMapID(continent, zone)
	zone = zone or 0;
	local ret = self.ContinentList[continent];
	if ( ret ) then
		return ret[zone];
	end
	if ( continent == 0 and zone == 0 ) then
		return 0;
	end
end

function Astrolabe:GetNumFloors( mapID )
	if ( type(mapID) == "number" ) then
		local mapData = WorldMapSize[mapID]
		return #mapData
	end
end

function Astrolabe:GetMapInfo( mapID, mapFloor )
	argcheck(mapID, 2, "number");
	assert(3, mapID >= 0, "GetMapInfo: Illegal map id to mapID: "..mapID);
	argcheck(mapFloor, 3, "number", "nil");
	
	mapFloor = mapFloor or min(#WorldMapSize[mapID], 1);
	local mapData = WorldMapSize[mapID];
	local system, systemParent = mapData.system, WorldMapSize[0][mapData.system] and true or false
	mapData = getFloorData(mapID, mapData, mapFloor)
	if ( mapData ~= zeroData ) then
		return system, systemParent, mapData.width, mapData.height, mapData.xOffset, mapData.yOffset;
	end
end

function Astrolabe:GetMapFilename( mapID )
	local mapData = self.HarvestedMapData[mapID]
	if ( mapData ) then
		return mapData.mapName
	end
end


--------------------------------------------------------------------------------------------------------------
-- Working Table Cache System
--------------------------------------------------------------------------------------------------------------

local tableCache = {};
tableCache["__mode"] = "v";
setmetatable(tableCache, tableCache);

local function GetWorkingTable( icon )
	if ( tableCache[icon] ) then
		return tableCache[icon];
	else
		local T = {};
		tableCache[icon] = T;
		return T;
	end
end


--------------------------------------------------------------------------------------------------------------
-- Minimap Icon Placement
--------------------------------------------------------------------------------------------------------------

--*****************************************************************************
-- local variables specifically for use in this section
--*****************************************************************************
local minimapRotationEnabled = false;
local minimapShape = false;

local minimapRotationOffset = GetPlayerFacing();


local function placeIconOnMinimap( minimap, minimapZoom, mapWidth, mapHeight, icon, dist, xDist, yDist, edgeRangeMultiplier )
	local mapDiameter;
	if ( Astrolabe.minimapOutside ) then
		mapDiameter = MinimapSize.outdoor[minimapZoom];
	else
		mapDiameter = MinimapSize.indoor[minimapZoom];
	end
	local mapRadius = mapDiameter * edgeRangeMultiplier / 2;
	local xScale = mapDiameter / mapWidth;
	local yScale = mapDiameter / mapHeight;
	local iconDiameter = ((icon:GetWidth() / 2) + 3) * xScale;
	local iconOnEdge = nil;
	local isRound = true;
	
	if ( minimapRotationEnabled ) then
		local sinTheta = sin(minimapRotationOffset)
		local cosTheta = cos(minimapRotationOffset)
		--[[
		Math Note
		The math that is acutally going on in the next 3 lines is:
			local dx, dy = xDist, -yDist
			xDist = (dx * cosTheta) + (dy * sinTheta)
			yDist = -((-dx * sinTheta) + (dy * cosTheta))
		
		This is because the origin for map coordinates is the top left corner
		of the map, not the bottom left, and so we have to reverse the vertical 
		distance when doing the our rotation, and then reverse the result vertical 
		distance because this rotation formula gives us a result with the origin based 
		in the bottom left corner (of the (+, +) quadrant).  
		The actual code is a simplification of the above.  
		]]
		local dx, dy = xDist, yDist
		xDist = (dx * cosTheta) - (dy * sinTheta)
		yDist = (dx * sinTheta) + (dy * cosTheta)
	end
	
	if ( minimapShape and not (xDist == 0 or yDist == 0) ) then
		isRound = (xDist < 0) and 1 or 3;
		if ( yDist < 0 ) then
			isRound = minimapShape[isRound];
		else
			isRound = minimapShape[isRound + 1];
		end
	end
	
	-- for non-circular portions of the Minimap edge
	if not ( isRound ) then
		dist = max(abs(xDist), abs(yDist))
	end

	if ( (dist + iconDiameter) > mapRadius ) then
		-- position along the outside of the Minimap
		iconOnEdge = true;
		local factor = (mapRadius - iconDiameter) / dist;
		xDist = xDist * factor;
		yDist = yDist * factor;
	end
	
	if ( Astrolabe.IconsOnEdge[icon] ~= iconOnEdge ) then
		Astrolabe.IconsOnEdge[icon] = iconOnEdge;
		Astrolabe.IconsOnEdgeChanged = true;
	end
	
	icon:ClearAllPoints();
	icon:SetPoint("CENTER", minimap, "CENTER", xDist/xScale, -yDist/yScale);
end

function Astrolabe:PlaceIconOnMinimap( icon, mapID, mapFloor, xPos, yPos )
	-- check argument types
	argcheck(icon, 2, "table");
	assert(3, icon.SetPoint and icon.ClearAllPoints and icon.GetWidth, "Usage Message");
	argcheck(mapID, 3, "number");
	argcheck(mapFloor, 4, "number", "nil");
	argcheck(xPos, 5, "number");
	argcheck(yPos, 6, "number");
	
	-- if the positining system is currently active, just use the player position used by the last incremental (or full) update
	-- otherwise, make sure we base our calculations off of the most recent player position (if one is available)
	local lM, lF, lx, ly;
	if ( self.processingFrame:IsShown() ) then
		lM, lF, lx, ly = unpack(self.LastPlayerPosition);
	else
		lM, lF, lx, ly = self:GetCurrentPlayerPosition();
		if ( lM and lM >= 0 ) then
			local lastPosition = self.LastPlayerPosition;
			lastPosition[1] = lM;
			lastPosition[2] = lF;
			lastPosition[3] = lx;
			lastPosition[4] = ly;
		else
			lM, lF, lx, ly = unpack(self.LastPlayerPosition);
		end
	end
	
	local dist, xDist, yDist = self:ComputeDistance(lM, lF, lx, ly, mapID, mapFloor, xPos, yPos);
	if not ( dist ) then
		--icon's position has no meaningful position relative to the player's current location
		return -1;
	end
	
	local iconData = GetWorkingTable(icon);
	if ( self.MinimapIcons[icon] ) then
		self.MinimapIcons[icon] = nil;
	else
		self.MinimapIconCount = self.MinimapIconCount + 1
	end
	
	AddedOrUpdatedIcons[icon] = iconData
	iconData.mapID = mapID;
	iconData.mapFloor = mapFloor;
	iconData.xPos = xPos;
	iconData.yPos = yPos;
	iconData.dist = dist;
	iconData.xDist = xDist;
	iconData.yDist = yDist;
	
	minimapRotationEnabled = GetCVar("rotateMinimap") ~= "0"
	if ( minimapRotationEnabled ) then
		minimapRotationOffset = GetPlayerFacing();
	end
	
	-- check Minimap Shape
	minimapShape = GetMinimapShape and ValidMinimapShapes[GetMinimapShape()];
	
	-- place the icon on the Minimap and :Show() it
	local map = self.Minimap
	placeIconOnMinimap(map, map:GetZoom(), map:GetWidth(), map:GetHeight(), icon, dist, xDist, yDist, self.EdgeRangeMultiplier[icon]);
	-- re-parent the icon if necessary
	if ( icon.GetParent and icon.SetParent ) then
		local iconParent = icon:GetParent()
		if ( iconParent) then
			if ( iconParent == map ) then
				-- do nothing
			elseif ( iconParent:IsObjectType("Minimap") ) then
				icon:SetParent(map);
			else
				 -- just in case our icon has an ancestor inbetween it and the Minimap
				iconParent = iconParent:GetParent()
				if ( iconParent and iconParent ~= map and iconParent:IsObjectType("Minimap") ) then
					iconParent:SetParent(map);
				end
			end
		end
	end
	icon:Show()
	
	-- We know this icon's position is valid, so we need to make sure the icon placement system is active.  
	self.processingFrame:Show()
	
	return 0;
end

function Astrolabe:RemoveIconFromMinimap( icon )
	if not ( self.MinimapIcons[icon] ) then
		return 1;
	end
	AddedOrUpdatedIcons[icon] = nil
	self.MinimapIcons[icon] = nil;
	self.IconsOnEdge[icon] = nil;
	icon:Hide();
	
	local MinimapIconCount = self.MinimapIconCount - 1
	if ( MinimapIconCount <= 0 ) then
		-- no icons left to manage
		self.processingFrame:Hide()
		MinimapIconCount = 0 -- because I'm paranoid
	end
	self.MinimapIconCount = MinimapIconCount
	
	return 0;
end

function Astrolabe:RemoveAllMinimapIcons( assocName )
	argcheck(assocName, 2, "string", "nil");
	if ( assocName == nil ) then -- remove all icons
		self:DumpNewIconsCache();
		local MinimapIcons = self.MinimapIcons;
		local IconsOnEdge = self.IconsOnEdge;
		for icon, data in pairs(MinimapIcons) do
			MinimapIcons[icon] = nil;
			IconsOnEdge[icon] = nil;
			icon:Hide();
		end
		self.MinimapIconCount = 0;
		self.processingFrame:Hide();
	
	else -- remove just icons that match the specified association
		for icon, iconAssoc in pairs(self.IconAssociations) do
			if ( iconAssoc == assocName ) then
				self:RemoveIconFromMinimap(icon)
			end
		end
	
	end
end

local lastZoom; -- to remember the last seen Minimap zoom level

-- local variables to track the status of the two update coroutines
local fullUpdateInProgress = true
local resetIncrementalUpdate = false
local resetFullUpdate = false

-- Incremental Update Code
do
	-- local variables to track the incremental update coroutine
	local incrementalUpdateCrashed = true
	local incrementalUpdateThread
	
	local function UpdateMinimapIconPositions( self )
		-- cache a reference to EdgeRangeMultiplier, for performance
		local EdgeRangeMultiplier = self.EdgeRangeMultiplier;
		yield()
		
		while ( true ) do
			self:DumpNewIconsCache() -- put new/updated icons into the main datacache
			
			resetIncrementalUpdate = false -- by definition, the incremental update is reset if it is here
			
			local M, F, x, y = self:GetCurrentPlayerPosition();
			if ( M and M >= 0 ) then
				local Minimap = Astrolabe.Minimap;
				local lastPosition = self.LastPlayerPosition;
				local lM, lF, lx, ly = unpack(lastPosition);
				
				minimapRotationEnabled = GetCVar("rotateMinimap") ~= "0"
				if ( minimapRotationEnabled ) then
					minimapRotationOffset = GetPlayerFacing();
				end
				
				-- check current frame rate
				local numPerCycle = min(50, GetFramerate() * (self.MinimapUpdateMultiplier or 1))
				
				-- check Minimap Shape
				minimapShape = GetMinimapShape and ValidMinimapShapes[GetMinimapShape()];
				
				if ( lM == M and lF == F and lx == x and ly == y ) then
					-- player has not moved since the last update
					if ( lastZoom ~= Minimap:GetZoom() or self.ForceNextUpdate or minimapRotationEnabled ) then
						local currentZoom = Minimap:GetZoom();
						lastZoom = currentZoom;
						local mapWidth = Minimap:GetWidth();
						local mapHeight = Minimap:GetHeight();
						numPerCycle = numPerCycle * 2
						local count = 0
						for icon, data in pairs(self.MinimapIcons) do
							placeIconOnMinimap(Minimap, currentZoom, mapWidth, mapHeight, icon, data.dist, data.xDist, data.yDist, EdgeRangeMultiplier[icon]);
							
							count = count + 1
							if ( count > numPerCycle ) then
								count = 0
								yield()
								-- check if the incremental update cycle needs to be reset 
								-- because a full update has been run
								if ( resetIncrementalUpdate ) then
									break;
								end
							end
						end
						self.ForceNextUpdate = false;
					end
				else
					local dist, xDelta, yDelta = self:ComputeDistance(lM, lF, lx, ly, M, F, x, y);
					if ( dist ) then
						local currentZoom = Minimap:GetZoom();
						lastZoom = currentZoom;
						local mapWidth = Minimap:GetWidth();
						local mapHeight = Minimap:GetHeight();
						local count = 0
						for icon, data in pairs(self.MinimapIcons) do
							local xDist = data.xDist - xDelta;
							local yDist = data.yDist - yDelta;
							local dist = sqrt(xDist*xDist + yDist*yDist);
							placeIconOnMinimap(Minimap, currentZoom, mapWidth, mapHeight, icon, dist, xDist, yDist, EdgeRangeMultiplier[icon]);
							
							data.dist = dist;
							data.xDist = xDist;
							data.yDist = yDist;
							
							count = count + 1
							if ( count >= numPerCycle ) then
								count = 0
								yield()
								-- check if the incremental update cycle needs to be reset 
								-- because a full update has been run
								if ( resetIncrementalUpdate ) then
									break;
								end
							end
						end
						if not ( resetIncrementalUpdate ) then
							lastPosition[1] = M;
							lastPosition[2] = F;
							lastPosition[3] = x;
							lastPosition[4] = y;
						end
					else
						self:RemoveAllMinimapIcons()
						lastPosition[1] = M;
						lastPosition[2] = F;
						lastPosition[3] = x;
						lastPosition[4] = y;
					end
				end
			else
				if not ( self.WorldMapVisible ) then
					self.processingFrame:Hide();
				end
			end
			
			-- if we've been reset, then we want to start the new cycle immediately
			if not ( resetIncrementalUpdate ) then
				yield()
			end
		end
	end
	
	function Astrolabe:UpdateMinimapIconPositions()
		if ( fullUpdateInProgress ) then
			-- if we're in the middle a a full update, we want to finish that first
			self:CalculateMinimapIconPositions()
		else
			if ( incrementalUpdateCrashed ) then
				incrementalUpdateThread = coroutine.wrap(UpdateMinimapIconPositions)
				incrementalUpdateThread(self) --initialize the thread
			end
			incrementalUpdateCrashed = true
			incrementalUpdateThread()
			incrementalUpdateCrashed = false
		end
	end
end

-- Full Update Code
do
	-- local variables to track the full update coroutine
	local fullUpdateCrashed = true
	local fullUpdateThread
	
	local function CalculateMinimapIconPositions( self )
		-- cache a reference to EdgeRangeMultiplier, for performance
		local EdgeRangeMultiplier = self.EdgeRangeMultiplier;
		yield()
		
		while ( true ) do
			self:DumpNewIconsCache() -- put new/updated icons into the main datacache
			
			resetFullUpdate = false -- by definition, the full update is reset if it is here
			fullUpdateInProgress = true -- set the flag the says a full update is in progress
			
			local M, F, x, y = self:GetCurrentPlayerPosition();
			if ( M and M >= 0 ) then
				local Minimap = Astrolabe.Minimap;
				minimapRotationEnabled = GetCVar("rotateMinimap") ~= "0"
				if ( minimapRotationEnabled ) then
					minimapRotationOffset = GetPlayerFacing();
				end
				
				-- check current frame rate
				local numPerCycle = GetFramerate() * (self.MinimapUpdateMultiplier or 1) * 2
				
				-- check Minimap Shape
				minimapShape = GetMinimapShape and ValidMinimapShapes[GetMinimapShape()];
				
				local currentZoom = Minimap:GetZoom();
				lastZoom = currentZoom;
				local mapWidth = Minimap:GetWidth();
				local mapHeight = Minimap:GetHeight();
				local count = 0
				for icon, data in pairs(self.MinimapIcons) do
					local dist, xDist, yDist = self:ComputeDistance(M, F, x, y, data.mapID, data.mapFloor, data.xPos, data.yPos);
					if ( dist ) then
						placeIconOnMinimap(Minimap, currentZoom, mapWidth, mapHeight, icon, dist, xDist, yDist, EdgeRangeMultiplier[icon]);
						
						data.dist = dist;
						data.xDist = xDist;
						data.yDist = yDist;
					else
						self:RemoveIconFromMinimap(icon)
					end
					
					count = count + 1
					if ( count >= numPerCycle ) then
						count = 0
						yield()
						-- check if we need to restart due to the full update being reset
						if ( resetFullUpdate ) then
							break;
						end
					end
				end
				
				if not ( resetFullUpdate ) then
					local lastPosition = self.LastPlayerPosition;
					lastPosition[1] = M;
					lastPosition[2] = F;
					lastPosition[3] = x;
					lastPosition[4] = y;
					
					resetIncrementalUpdate = true
				end
			else
				if not ( self.WorldMapVisible ) then
					self.processingFrame:Hide();
				end
			end
			
			-- if we've been reset, then we want to start the new cycle immediately
			if not ( resetFullUpdate ) then
				fullUpdateInProgress = false
				yield()
			end
		end
	end
	
	function Astrolabe:CalculateMinimapIconPositions( reset )
		if ( fullUpdateCrashed ) then
			fullUpdateThread = coroutine.wrap(CalculateMinimapIconPositions)
			fullUpdateThread(self) --initialize the thread
		elseif ( reset ) then
			resetFullUpdate = true
		end
		fullUpdateCrashed = true
		fullUpdateThread()
		fullUpdateCrashed = false
		
		-- return result flag
		if ( fullUpdateInProgress ) then
			return 1 -- full update started, but did not complete on this cycle
		
		else
			if ( resetIncrementalUpdate ) then
				return 0 -- update completed
			else
				return -1 -- full update did no occur for some reason
			end
		
		end
	end
end

function Astrolabe:GetDistanceToIcon( icon )
	local data = self.MinimapIcons[icon];
	if ( data ) then
		return data.dist, data.xDist, data.yDist;
	end
end

function Astrolabe:IsIconOnEdge( icon )
	return self.IconsOnEdge[icon];
end

function Astrolabe:GetDirectionToIcon( icon )
	local data = self.MinimapIcons[icon];
	if ( data ) then
		local dir = atan2(data.xDist, -(data.yDist))
		if ( dir > 0 ) then
			return twoPi - dir;
		else
			return -dir;
		end
	end
end

function Astrolabe:AssociateIcon( icon, assocName )
	argcheck(icon, 2, "table");
	argcheck(assocName, 3, "string", "nil");
	self.IconAssociations[icon] = assocName;
	self.EdgeRangeMultiplier[icon] = self.EdgeRangeMultiplier[assocName]; -- update the icon's edge multiplier
	self.ForceNextUpdate = true; -- force a redraw
end

function Astrolabe:GetIconAssociation( icon )
	return self.IconAssociations[icon];
end

function Astrolabe:SetEdgeRangeMultiplier( multiplier, assocName )
	argcheck(multiplier, 2, "number", "nil");
	argcheck(assocName, 3, "string", "nil");
	assert(3, (multiplier or assocName), "Astrolabe:SetEdgeRangeMultiplier( multiplier, [assocName] ) - at least one argument must be specificed");
	assert(3, (not multiplier or multiplier > 0), "Astrolabe:SetEdgeRangeMultiplier( multiplier, [assocName] ) - mutliplier must be greater than zero");
	
	local EdgeRangeMultiplier = self.EdgeRangeMultiplier;
	local IconAssociations = self.IconAssociations;
	if ( assocName == nil ) then
		-- set the default multiplier
		self.DefaultEdgeRangeMultiplier = multiplier;
		for icon in pairs(EdgeRangeMultiplier) do
			local iconAssoc = IconAssociations[icon];
			if ( type(icon) == "table" and (not iconAssoc or rawget(EdgeRangeMultiplier, iconAssoc) == nil) ) then
				EdgeRangeMultiplier[icon] = multiplier;
			end
		end
	else
		-- set the multiplier for specific icons
		EdgeRangeMultiplier[assocName] = multiplier;
		for icon, iconAssoc in pairs(IconAssociations) do
			if ( iconAssoc == assocName ) then
				EdgeRangeMultiplier[icon] = multiplier;
			end
		end
	end
	self.ForceNextUpdate = true; -- force a redraw
end

function Astrolabe:GetEdgeRangeMultiplier( assocOrIcon )
	argcheck(assocOrIcon, 2, "table", "string", "nil");
	return rawget(self.EdgeRangeMultiplier, assocOrIcon) or self.DefaultEdgeRangeMultiplier;
end

function Astrolabe:Register_OnEdgeChanged_Callback( func, ident )
	argcheck(func, 2, "function");
	self.IconsOnEdge_GroupChangeCallbacks[func] = ident;
end

function Astrolabe:SetTargetMinimap( newMinimap )
	if ( newMinimap == self.Minimap ) then
		return; -- no change
	end
	argcheck(newMinimap, 2, "table");
	assert(3, issecurevariable(newMinimap, 0), "Astrolabe:SetTargetMinimap( newMinimap ) - argument is not a Minimap");
	assert(3, newMinimap.IsObjectType, "Astrolabe:SetTargetMinimap( newMinimap ) - argument is not a Minimap");
	assert(3, type(newMinimap.IsObjectType) == "function", "Astrolabe:SetTargetMinimap( newMinimap ) - argument is not a Minimap");
	assert(3, newMinimap:IsObjectType("Minimap"), "Astrolabe:SetTargetMinimap( newMinimap ) - argument is not a Minimap");
	
	local oldMinimap = self.Minimap;
	self.processingFrame:SetParent(newMinimap);
	self.Minimap = newMinimap;
	self:CalculateMinimapIconPositions(true); -- re-anchor all currently managed icons
	-- re-parent all currently managed icons
	for icon, data in pairs(self.MinimapIcons) do
		if ( icon.GetParent and icon.SetParent ) then
			if ( icon:GetParent() == oldMinimap ) then
				icon:SetParent(newMinimap);
			elseif ( icon:GetParent() and icon:GetParent():GetParent() == oldMinimap ) then -- just incase our icons have an ancestor inbetween them and the Minimap
				icon:GetParent():SetParent(newMinimap);
			end
		end
	end
	
	for func in pairs(self.TargetMinimapChanged_Callbacks) do
		pcall(func);
	end
end

function Astrolabe:Register_TargetMinimapChanged_Callback( func, ident )
	-- check argument types
	argcheck(func, 2, "function");
	
	self.TargetMinimapChanged_Callbacks[func] = ident;
end

--*****************************************************************************
-- INTERNAL USE ONLY PLEASE!!!
-- Calling this function at the wrong time can cause errors
--*****************************************************************************
function Astrolabe:DumpNewIconsCache()
	local MinimapIcons = self.MinimapIcons
	for icon, data in pairs(AddedOrUpdatedIcons) do
		MinimapIcons[icon] = data
		AddedOrUpdatedIcons[icon] = nil
	end
	-- we now need to restart any updates that were in progress
	resetIncrementalUpdate = true
	resetFullUpdate = true
end


--------------------------------------------------------------------------------------------------------------
-- World Map Icon Placement
--------------------------------------------------------------------------------------------------------------

-- If forcedAbsoluteX and forcedAbsoluteY are nill the absolute position of the icon will not be calculated but forcedAbsoluteX and forcedAbsoluteY will be used instead
function Astrolabe:PlaceIconOnWorldMap( worldMapFrame, icon, mapID, mapFloor, xPos, yPos, forcedAbsoluteX, forcedAbsoluteY)
	-- check argument types
	argcheck(worldMapFrame, 2, "table");
	assert(3, worldMapFrame.GetWidth and worldMapFrame.GetHeight, "Usage Message");
	argcheck(icon, 3, "table");
	assert(3, icon.SetPoint and icon.ClearAllPoints, "Usage Message");
	argcheck(mapID, 4, "number");
	argcheck(mapFloor, 5, "number", "nil");
	argcheck(xPos, 6, "number");
	argcheck(yPos, 7, "number");
	
	local M, F = GetCurrentMapAreaID(), GetCurrentMapDungeonLevel();
	local nX, nY 
	
    if forcedAbsoluteX ~= nil and forcedAbsoluteY ~= nil then
        nX, nY = forcedAbsoluteX, forcedAbsoluteY
    else
        nX, nY = self:TranslateWorldMapPosition(mapID, mapFloor, xPos, yPos, M, F);
    end
    
	-- anchor and :Show() the icon if it is within the boundry of the current map, :Hide() it otherwise
	if ( nX and nY and (0 < nX and nX <= 1) and (0 < nY and nY <= 1) ) then
		icon:ClearAllPoints();
		icon:SetPoint("CENTER", worldMapFrame, "TOPLEFT", nX * worldMapFrame:GetWidth(), -nY * worldMapFrame:GetHeight());
		icon:Show();
	else
		icon:Hide();
	end
	return nX, nY;
end


--------------------------------------------------------------------------------------------------------------
-- Handler Scripts
--------------------------------------------------------------------------------------------------------------

function Astrolabe:OnEvent( frame, event )
	if ( event == "MINIMAP_UPDATE_ZOOM" ) then
		-- update minimap zoom scale
		local Minimap = self.Minimap;
		local curZoom = Minimap:GetZoom();
		if ( GetCVar("minimapZoom") == GetCVar("minimapInsideZoom") ) then
			if ( curZoom < 2 ) then
				Minimap:SetZoom(curZoom + 1);
			else
				Minimap:SetZoom(curZoom - 1);
			end
		end
		if ( GetCVar("minimapZoom")+0 == Minimap:GetZoom() ) then
			self.minimapOutside = true;
		else
			self.minimapOutside = false;
		end
		Minimap:SetZoom(curZoom);
		
		-- re-calculate all Minimap Icon positions
		if ( frame:IsVisible() ) then
			self:CalculateMinimapIconPositions(true);
		end
	
	elseif ( event == "PLAYER_LEAVING_WORLD" ) then
		frame:Hide(); -- yes, I know this is redunant
		self:RemoveAllMinimapIcons(); --dump all minimap icons
		-- TODO: when I uncouple the point buffer from Minimap drawing,
		--       I should consider updating LastPlayerPosition here
	
	elseif ( event == "PLAYER_ENTERING_WORLD" ) then
		frame:Show();
		if not ( frame:IsVisible() ) then
			-- do the minimap recalculation anyways if the OnShow script didn't execute
			-- this is done to ensure the accuracy of information about icons that were 
			-- inserted while the Player was in the process of zoning
			self:CalculateMinimapIconPositions(true);
		end
	
	elseif ( event == "ZONE_CHANGED_NEW_AREA" ) then
		frame:Hide();
		frame:Show();
	
	end
end

function Astrolabe:OnUpdate( frame, elapsed )
	-- on-edge group changed call-backs
	if ( self.IconsOnEdgeChanged ) then
		self.IconsOnEdgeChanged = false;
		for func in pairs(self.IconsOnEdge_GroupChangeCallbacks) do
			pcall(func);
		end
	end
	
	self:UpdateMinimapIconPositions();
end

function Astrolabe:OnShow( frame )
	-- set the world map to a zoom with a valid player position
	if not ( self.WorldMapVisible ) then
		SetMapToCurrentZone();
	end
	local M, F = Astrolabe:GetCurrentPlayerPosition();
	if not ( M and M >= 0 ) then
		frame:Hide();
		return
	end
	
	-- re-calculate minimap icon positions (if needed)
	if ( next(self.MinimapIcons) ) then
		self:CalculateMinimapIconPositions(true);
	else
		-- needed so that the cycle doesn't overwrite an updated LastPlayerPosition
		resetIncrementalUpdate = true;
	end
	
	if ( self.MinimapIconCount <= 0 ) then
		-- no icons left to manage
		frame:Hide();
	end
end

function Astrolabe:OnHide( frame )
	-- dump the new icons cache here
	-- a full update will performed the next time processing is re-actived
	self:DumpNewIconsCache()
end

-- called by AstrolabMapMonitor when all world maps are hidden
function Astrolabe:AllWorldMapsHidden()
	if ( IsLoggedIn() ) then
		self.processingFrame:Hide();
		self.processingFrame:Show();
	end
end


--------------------------------------------------------------------------------------------------------------
-- Library Registration
--------------------------------------------------------------------------------------------------------------

local HARVESTED_DATA_VERSION = 3; -- increment this when the format of the harvested data has to change
local function harvestMapData( HarvestedMapData )
	local mapData = {}
	local mapName = GetMapInfo();
	local mapID = GetCurrentMapAreaID();
	local numFloors, firstFloor = GetNumDungeonMapLevels();
	mapData.mapName = mapName;
	mapData.cont = (GetCurrentMapContinent()) or -100;
	mapData.zone = (GetCurrentMapZone()) or -100;
	mapData.numFloors = numFloors;
	mapData.firstFloor = firstFloor
	local _, TLx, TLy, BRx, BRy = GetCurrentMapZone();
	if ( TLx and TLy and BRx and BRy and (TLx~=0 or TLy~=0 or BRx~=0 or BRy~=0) ) then
		mapData[0] = {};
		mapData[0].TLx = TLx;
		mapData[0].TLy = TLy;
		mapData[0].BRx = BRx;
		mapData[0].BRy = BRy;
	end
	if ( not mapData[0] and numFloors == 0 and (GetCurrentMapDungeonLevel()) == 1 ) then
		numFloors = 1;
		mapData.hiddenFloor = true;
	end
	if ( numFloors > 0 ) then
		for f = 1, numFloors do
			SetDungeonMapLevel(f);
			local _, TLx, TLy, BRx, BRy = GetCurrentMapDungeonLevel();
			if ( TLx and TLy and BRx and BRy ) then
				mapData[f] = {};
				mapData[f].TLx = TLx;
				mapData[f].TLy = TLy;
				mapData[f].BRx = BRx;
				mapData[f].BRy = BRy;
			end
		end
	end

	HarvestedMapData[mapID] = mapData;
end

local function SkipFirstInCouplet(...)
	local ret = {}
	for i=2, select("#", ...), 2 do
		tinsert(ret, (select(i, ...)))
	end
	return ret
end

local function activate( newInstance, oldInstance )
	if ( oldInstance ) then -- this is an upgrade activate
		-- print upgrade debug info
		local _, oldVersion = oldInstance:GetVersion();
		printError("Upgrading "..LIBRARY_VERSION_MAJOR.." from version "..oldVersion.." to version "..LIBRARY_VERSION_MINOR);
		
		if ( oldInstance.DumpNewIconsCache ) then
			oldInstance:DumpNewIconsCache()
		end
		for k, v in pairs(oldInstance) do
			if ( type(v) ~= "function" and (not configConstants[k]) ) then
				newInstance[k] = v;
			end
		end
		-- sync up the current MinimapIconCount value
		local iconCount = 0
		for _ in pairs(newInstance.MinimapIcons) do
			iconCount = iconCount + 1
		end
		newInstance.MinimapIconCount = iconCount
		
		-- explicity carry over our Minimap reference, or create it if we don't already have one
		newInstance.Minimap = oldInstance.Minimap or _G.Minimap
		
		Astrolabe = oldInstance;
	else
		newInstance.Minimap = _G.Minimap
		local frame = CreateFrame("Frame");
		newInstance.processingFrame = frame;
	end
	configConstants = nil -- we don't need this anymore
	
	if not ( oldInstance and oldInstance.HarvestedMapData.VERSION == HARVESTED_DATA_VERSION ) then
		newInstance.HarvestedMapData = { VERSION = HARVESTED_DATA_VERSION };
		local HarvestedMapData = newInstance.HarvestedMapData;
		
		newInstance.ContinentList = SkipFirstInCouplet(GetMapContinents());
		for C in pairs(newInstance.ContinentList) do
			local zones = SkipFirstInCouplet(GetMapZones(C));
			newInstance.ContinentList[C] = zones;
			SetMapZoom(C, 0);
			zones[0] = GetCurrentMapAreaID();
			harvestMapData(HarvestedMapData);
			for Z in ipairs(zones) do
				SetMapZoom(C, Z);
				zones[Z] = GetCurrentMapAreaID();
				harvestMapData(HarvestedMapData);
			end
		end
		
		for _, id in ipairs(GetAreaMaps()) do
			if not ( HarvestedMapData[id] ) then
				if ( SetMapByID(id) ) then
					local area = GetCurrentMapAreaID();
					if area~=id and (not AlternateAreas[area] or not tContains(AlternateAreas, id)) then
						if not AlternateAreas[area] then
							AlternateAreas[area] = {}
						end
						tinsert(AlternateAreas[area], id)
					end
					harvestMapData(HarvestedMapData);
				end
			end
		end
	end
	
	local Minimap = newInstance.Minimap
	local frame = newInstance.processingFrame;
	frame:Hide();
	frame:SetParent(Minimap);
	frame:UnregisterAllEvents();
	frame:RegisterEvent("MINIMAP_UPDATE_ZOOM");
	frame:RegisterEvent("PLAYER_LEAVING_WORLD");
	frame:RegisterEvent("PLAYER_ENTERING_WORLD");
	frame:RegisterEvent("ZONE_CHANGED_NEW_AREA");
	frame:SetScript("OnEvent",
		function( frame, event, ... )
			Astrolabe:OnEvent(frame, event, ...);
		end
	);
	frame:SetScript("OnUpdate",
		function( frame, elapsed )
			Astrolabe:OnUpdate(frame, elapsed);
		end
	);
	frame:SetScript("OnShow",
		function( frame )
			Astrolabe:OnShow(frame);
		end
	);
	frame:SetScript("OnHide",
		function( frame )
			Astrolabe:OnHide(frame);
		end
	);
	
	setmetatable(Astrolabe.MinimapIcons, MinimapIconsMetatable)
end

AlternateAreas = {}

DongleStub:Register(Astrolabe, activate)


--------------------------------------------------------------------------------------------------------------
-- Data
--------------------------------------------------------------------------------------------------------------

-- diameter of the Minimap in game yards at
-- the various possible zoom levels
MinimapSize = {
	indoor = {
		[0] = 300, -- scale
		[1] = 240, -- 1.25
		[2] = 180, -- 5/3
		[3] = 120, -- 2.5
		[4] = 80,  -- 3.75
		[5] = 50,  -- 6
	},
	outdoor = {
		[0] = 466 + 2/3, -- scale
		[1] = 400,       -- 7/6
		[2] = 333 + 1/3, -- 1.4
		[3] = 266 + 2/6, -- 1.75
		[4] = 200,       -- 7/3
		[5] = 133 + 1/3, -- 3.5
	},
}

ValidMinimapShapes = {
	-- { upper-left, lower-left, upper-right, lower-right }
	["SQUARE"]                = { false, false, false, false },
	["CORNER-TOPLEFT"]        = { true,  false, false, false },
	["CORNER-TOPRIGHT"]       = { false, false, true,  false },
	["CORNER-BOTTOMLEFT"]     = { false, true,  false, false },
	["CORNER-BOTTOMRIGHT"]    = { false, false, false, true },
	["SIDE-LEFT"]             = { true,  true,  false, false },
	["SIDE-RIGHT"]            = { false, false, true,  true },
	["SIDE-TOP"]              = { true,  false, true,  false },
	["SIDE-BOTTOM"]           = { false, true,  false, true },
	["TRICORNER-TOPLEFT"]     = { true,  true,  true,  false },
	["TRICORNER-TOPRIGHT"]    = { true,  false, true,  true },
	["TRICORNER-BOTTOMLEFT"]  = { true,  true,  false, true },
	["TRICORNER-BOTTOMRIGHT"] = { false, true,  true,  true },
}

-- distances across and offsets of the world maps
-- in game yards
WorldMapSize = {
	nil, -- [1]
	nil, -- [2]
	nil, -- [3]
	{
		["firstFloor"] = 0,
		["system"] = 1,
		["yOffset"] = -1808.32995605469,
		["height"] = 3525,
		["originSystem"] = 1,
		["xOffset"] = 1962.5,
		["width"] = 5287.5,
	}, -- [4]
	nil, -- [5]
	nil, -- [6]
	nil, -- [7]
	nil, -- [8]
	{
		["firstFloor"] = 0,
		["system"] = 1,
		["yOffset"] = 168.75,
		["height"] = 3633.33325195313,
		["originSystem"] = 1,
		["xOffset"] = -2204.16650390625,
		["width"] = 5449.99975585938,
	}, -- [9]
	nil, -- [10]
	{
		["firstFloor"] = 0,
		["system"] = 1,
		["yOffset"] = -1810.41662597656,
		["height"] = 3831.24987792969,
		["originSystem"] = 1,
		["xOffset"] = -202.08332824707,
		["width"] = 5745.83332824707,
	}, -- [11]
	nil, -- [12]
	{
		["firstFloor"] = 0,
		["system"] = 1,
		["yOffset"] = -12799.900390625,
		["height"] = 24533.2001953125,
		["originSystem"] = 1,
		["xOffset"] = -17066.599609375,
		["width"] = 36799.798828125,
	}, -- [13]
	{
		["firstFloor"] = 0,
		["system"] = 0,
		["yOffset"] = -11176.34375,
		["height"] = 27149.6875,
		["originSystem"] = 0,
		["xOffset"] = -18171.970703125,
		["width"] = 40741.181640625,
	}, -- [14]
	nil, -- [15]
	{
		["firstFloor"] = 0,
		["system"] = 0,
		["yOffset"] = 141.666656494141,
		["height"] = 2318.74984741211,
		["originSystem"] = 0,
		["xOffset"] = 1127.08325195313,
		["width"] = 3477.08325195313,
	}, -- [16]
	{
		["firstFloor"] = 0,
		["system"] = 0,
		["yOffset"] = 5854.16650390625,
		["height"] = 2045.8330078125,
		["originSystem"] = 0,
		["xOffset"] = 1902.08325195313,
		["width"] = 3070.83325195313,
	}, -- [17]
	nil, -- [18]
	{
		["firstFloor"] = 0,
		["system"] = 0,
		["yOffset"] = 10583.3330078125,
		["height"] = 2441.666015625,
		["originSystem"] = 0,
		["xOffset"] = 1193.75,
		["width"] = 3662.5,
	}, -- [19]
	{
		["firstFloor"] = 0,
		["system"] = 0,
		["yOffset"] = -3837.49975585938,
		["height"] = 3012.49981689453,
		["originSystem"] = 0,
		["xOffset"] = -3033.33325195313,
		["width"] = 4518.74987792969,
	}, -- [20]
	{
		["firstFloor"] = 0,
		["system"] = 0,
		["yOffset"] = -1666.66662597656,
		["height"] = 2799.99987792969,
		["originSystem"] = 0,
		["xOffset"] = -3449.99975585938,
		["width"] = 4199.99975585938,
	}, -- [21]
	{
		["firstFloor"] = 0,
		["system"] = 0,
		["yOffset"] = -3366.66650390625,
		["height"] = 2866.66653442383,
		["originSystem"] = 0,
		["xOffset"] = -416.666656494141,
		["width"] = 4299.99990844727,
	}, -- [22]
	{
		["firstFloor"] = 0,
		["system"] = 0,
		["yOffset"] = -3704.16650390625,
		["height"] = 2687.49987792969,
		["originSystem"] = 0,
		["xOffset"] = 2287.5,
		["width"] = 4031.25,
	}, -- [23]
	{
		["firstFloor"] = 0,
		["system"] = 0,
		["yOffset"] = -1481.25,
		["height"] = 3241.66662597656,
		["originSystem"] = 0,
		["xOffset"] = -1849.99987792969,
		["width"] = 4862.49987792969,
	}, -- [24]
	nil, -- [25]
	{
		["firstFloor"] = 0,
		["system"] = 0,
		["yOffset"] = -1466.66662597656,
		["height"] = 2566.66662597656,
		["originSystem"] = 0,
		["xOffset"] = 1575,
		["width"] = 3850,
	}, -- [26]
	{
		["firstFloor"] = 0,
		["system"] = 0,
		["yOffset"] = 3941.66650390625,
		["height"] = 3264.5830078125,
		["originSystem"] = 0,
		["xOffset"] = -2137.5,
		["width"] = 4897.91650390625,
	}, -- [27]
	{
		["firstFloor"] = 0,
		["system"] = 0,
		["yOffset"] = 6100,
		["height"] = 1487.49951171875,
		["originSystem"] = 0,
		["xOffset"] = 322.916656494141,
		["width"] = 2231.24984741211,
	}, -- [28]
	{
		["firstFloor"] = 0,
		["system"] = 0,
		["yOffset"] = 6985.41650390625,
		["height"] = 2099.99951171875,
		["originSystem"] = 0,
		["xOffset"] = 464.583312988281,
		["width"] = 3152.08319091797,
	}, -- [29]
	{
		["firstFloor"] = 0,
		["system"] = 0,
		["yOffset"] = 7939.5830078125,
		["height"] = 2314.5830078125,
		["originSystem"] = 0,
		["xOffset"] = -1535.41662597656,
		["width"] = 3470.83325195313,
	}, -- [30]
	nil, -- [31]
	{
		["firstFloor"] = 0,
		["system"] = 0,
		["yOffset"] = 9866.666015625,
		["height"] = 1666.6669921875,
		["originSystem"] = 0,
		["xOffset"] = 833.333312988281,
		["width"] = 2499.99993896484,
	}, -- [32]
	[0] = {
		{
			["xOffset"] = -10311.71318,
			["scale"] = 0.56089997291565,
			["yOffset"] = -19819.33898,
		}, -- [1]
		[0] = {
			["xOffset"] = -48226.86993,
			["scale"] = 0.56300002336502,
			["yOffset"] = -16433.90283,
		},
		["xOffset"] = 0,
		["system"] = -1,
		[870] = {
			["xOffset"] = -27693.71178,
			["scale"] = 0.65140002965927,
			["yOffset"] = -29720.0585,
		},
		["height"] = 22266.74312,
		[571] = {
			["xOffset"] = -29750.89905,
			["scale"] = 0.5949000120163,
			["yOffset"] = -11454.50802,
		},
		["yOffset"] = 0,
		["width"] = 33400.121,
	},
	[758] = {
		{
			["height"] = 718.889984130859,
			["yOffset"] = 180.957000732422,
			["xOffset"] = 106.435508728027,
			["width"] = 1078.33499908447,
		}, -- [1]
		{
			["height"] = 518.894958496094,
			["yOffset"] = 770.955017089844,
			["xOffset"] = 256.427001953125,
			["width"] = 778.343017578125,
		}, -- [2]
		{
			["height"] = 694.894958496094,
			["yOffset"] = 707.955017089844,
			["xOffset"] = 224.927993774414,
			["width"] = 1042.34202575684,
		}, -- [3]
		["firstFloor"] = 1,
		["originSystem"] = 671,
		["system"] = 671,
	},
	[886] = {
		["firstFloor"] = 0,
		["system"] = 996,
		["yOffset"] = 789.583984375,
		["height"] = 468.75,
		["originSystem"] = 996,
		["xOffset"] = 2497.916015625,
		["width"] = 702.083984375,
	},
	[759] = {
		{
			["height"] = 1021.16730546951,
			["yOffset"] = -2.99726152420044,
			["xOffset"] = -1226.96997070313,
			["width"] = 1531.7509765625,
		}, -- [1]
		{
			["height"] = 848.503425598145,
			["yOffset"] = 86.3315963745117,
			["xOffset"] = -157.464996337891,
			["width"] = 1272.75503540039,
		}, -- [2]
		{
			["height"] = 752.512664794922,
			["yOffset"] = 132.327667236328,
			["xOffset"] = -725.474975585938,
			["width"] = 1128.76898193359,
		}, -- [3]
		["firstFloor"] = 1,
		["originSystem"] = 644,
		["system"] = 644,
	},
	[887] = {
		{
			["height"] = 677.083984375,
			["yOffset"] = -2029.1669921875,
			["xOffset"] = -5762.5,
			["width"] = 1014.583984375,
		}, -- [1]
		{
			["height"] = 193.340087890625,
			["yOffset"] = -1631.67004394531,
			["xOffset"] = -5300.0048828125,
			["width"] = 290.009765625,
		}, -- [2]
		{
			["height"] = 193.340087890625,
			["yOffset"] = -1631.67004394531,
			["xOffset"] = -5300.0048828125,
			["width"] = 290.009765625,
		}, -- [3]
		["firstFloor"] = 1,
		["originSystem"] = 1011,
		["system"] = 1011,
	},
	[760] = {
		{
			["yOffset"] = -2682.5500488281,
			["height"] = 472.69995117188,
			["xOffset"] = -1279.9399414063,
			["width"] = 709.04895019531,
			["floorName"] = "Razorfen Downs",
		}, -- [1]
		["firstFloor"] = 1,
		["system"] = 129,
		["yOffset"] = -3266.66650390625,
		["height"] = 2266.66656494141,
		["originSystem"] = 129,
		["xOffset"] = -2766.66650390625,
		["width"] = 3399.99981689453,
	},
	[888] = {
		["firstFloor"] = 0,
		["system"] = 1,
		["yOffset"] = -11033.3330078125,
		["height"] = 966.6669921875,
		["originSystem"] = 1,
		["xOffset"] = -1491.6669921875,
		["width"] = 1450.0009765625,
	},
	[761] = {
		["firstFloor"] = 1,
		["system"] = 47,
		["yOffset"] = -2733.33325195313,
		["height"] = 1200,
		["originSystem"] = 47,
		["xOffset"] = -2766.66650390625,
		["width"] = 1799.99987792969,
	},
	[889] = {
		["firstFloor"] = 0,
		["system"] = 1,
		["yOffset"] = 0,
		["height"] = 900,
		["originSystem"] = 1,
		["xOffset"] = 3641.666015625,
		["width"] = 1350,
	},
	[762] = {
		{
			["height"] = 413.32275390625,
			["yOffset"] = -2030.18139648438,
			["xOffset"] = -1567.96997070313,
			["width"] = 619.983947753906,
		}, -- [1]
		{
			["height"] = 213.460494995117,
			["yOffset"] = -307.365997314453,
			["xOffset"] = 162.272994995117,
			["width"] = 320.190994262695,
		}, -- [2]
		{
			["height"] = 408.4599609375,
			["yOffset"] = -2009.09997558594,
			["xOffset"] = -50.2725982666016,
			["width"] = 612.69660949707,
		}, -- [3]
		{
			["height"] = 468.86669921875,
			["yOffset"] = -1281.29040527344,
			["xOffset"] = -1743.98999023438,
			["width"] = 703.300048828125,
		}, -- [4]
		["firstFloor"] = 1,
		["originSystem"] = 189,
		["system"] = 189,
	},
	[890] = {
		["firstFloor"] = 0,
		["system"] = 1,
		["yOffset"] = 2577.083984375,
		["height"] = 1177.08203125,
		["originSystem"] = 1,
		["xOffset"] = -233.333984375,
		["width"] = 1766.66796875,
	},
	[382] = {
		["firstFloor"] = 0,
		["system"] = 0,
		["yOffset"] = -1877.9453125,
		["height"] = 640.104125976563,
		["originSystem"] = 0,
		["xOffset"] = -873.192626953125,
		["width"] = 959.375030517578,
	},
	[891] = {
		["firstFloor"] = 0,
		["system"] = 1,
		["yOffset"] = 525,
		["height"] = 1204.166015625,
		["originSystem"] = 1,
		["xOffset"] = 4491.666015625,
		["width"] = 1806.25,
	},
	[510] = {
		["firstFloor"] = 0,
		["system"] = 571,
		["yOffset"] = -6502.0830078125,
		["height"] = 1814.5830078125,
		["originSystem"] = 571,
		["xOffset"] = -1443.75,
		["width"] = 2722.91662597656,
	},
	[40] = {
		["firstFloor"] = 0,
		["system"] = 0,
		["yOffset"] = 2147.91650390625,
		["height"] = 2756.25,
		["originSystem"] = 0,
		["xOffset"] = 389.583312988281,
		["width"] = 4135.41668701172,
	},
	[764] = {
		{
			["height"] = 234.953392028809,
			["yOffset"] = 84.9296035766602,
			["xOffset"] = -2356.19995117188,
			["width"] = 352.430053710938,
		}, -- [1]
		{
			["height"] = 141.61799621582,
			["yOffset"] = 161.59700012207,
			["xOffset"] = -2359.9833984375,
			["width"] = 212.4267578125,
		}, -- [2]
		{
			["height"] = 101.619964599609,
			["yOffset"] = 91.5960693359375,
			["xOffset"] = -2256.19995117188,
			["width"] = 152.429931640625,
		}, -- [3]
		{
			["height"] = 101.624694824219,
			["yOffset"] = 91.5903015136719,
			["xOffset"] = -2256.19995117188,
			["width"] = 152.429931640625,
		}, -- [4]
		{
			["height"] = 101.624694824219,
			["yOffset"] = 91.5903015136719,
			["xOffset"] = -2256.19995117188,
			["width"] = 152.429931640625,
		}, -- [5]
		{
			["height"] = 132.286628723145,
			["yOffset"] = 50.259391784668,
			["xOffset"] = -2279.19995117188,
			["width"] = 198.429931640625,
		}, -- [6]
		{
			["height"] = 181.619964599609,
			["yOffset"] = 96.5960693359375,
			["xOffset"] = -2296.19995117188,
			["width"] = 272.429931640625,
		}, -- [7]
		["firstFloor"] = 1,
		["originSystem"] = 33,
		["system"] = 33,
	},
	[892] = {
		["firstFloor"] = 0,
		["system"] = 0,
		["yOffset"] = -2270.8330078125,
		["height"] = 727.0830078125,
		["originSystem"] = 0,
		["xOffset"] = -2147.9169921875,
		["width"] = 1089.583984375,
	},
	[765] = {
		{
			["height"] = 470.47998046875,
			["yOffset"] = -3809.44995117188,
			["xOffset"] = 2911.9599609375,
			["width"] = 705.719970703125,
		}, -- [1]
		{
			["height"] = 670.480224609375,
			["yOffset"] = -4169.4501953125,
			["xOffset"] = 2961.95971679688,
			["width"] = 1005.72045898438,
		}, -- [2]
		["firstFloor"] = 1,
		["originSystem"] = 329,
		["system"] = 329,
	},
	[893] = {
		["firstFloor"] = 0,
		["system"] = 0,
		["yOffset"] = -8433.3330078125,
		["height"] = 1066.6669921875,
		["originSystem"] = 530,
		["xOffset"] = 2983.333984375,
		["width"] = 1600,
	},
	[766] = {
		{
			["height"] = 1851.6962890625,
			["yOffset"] = 7659.287109375,
			["xOffset"] = -2915.6201171875,
			["width"] = 2777.54411315918,
		}, -- [1]
		{
			["height"] = 651.70654296875,
			["yOffset"] = 8051.79638671875,
			["xOffset"] = -2515.6298828125,
			["width"] = 977.559936523438,
		}, -- [2]
		{
			["height"] = 385.0400390625,
			["yOffset"] = 8335.1298828125,
			["xOffset"] = -2315.6298828125,
			["width"] = 577.56005859375,
		}, -- [3]
		["firstFloor"] = 1,
		["originSystem"] = 531,
		["system"] = 531,
	},
	[894] = {
		["firstFloor"] = 0,
		["system"] = 1,
		["yOffset"] = -6529.1669921875,
		["height"] = 1212.5,
		["originSystem"] = 530,
		["xOffset"] = -4785.41796875,
		["width"] = 1818.75,
	},
	[767] = {
		{
			["height"] = 665.447998046875,
			["yOffset"] = 14,
			["xOffset"] = -1307.06994628906,
			["width"] = 998.171936035156,
		}, -- [1]
		{
			["height"] = 665.447998046875,
			["yOffset"] = -336,
			["xOffset"] = -1307.06994628906,
			["width"] = 998.171936035156,
		}, -- [2]
		["firstFloor"] = 1,
		["originSystem"] = 643,
		["system"] = 643,
	},
	[895] = {
		["firstFloor"] = 0,
		["system"] = 0,
		["yOffset"] = 4727.083984375,
		["height"] = 1233.33203125,
		["originSystem"] = 0,
		["xOffset"] = -1206.25,
		["width"] = 1850,
	},
	[512] = {
		["firstFloor"] = 0,
		["system"] = 607,
		["yOffset"] = -1883.33325195313,
		["height"] = 1162.49993896484,
		["originSystem"] = 607,
		["xOffset"] = -787.5,
		["width"] = 1743.74993896484,
	},
	[640] = {
		["firstFloor"] = 0,
		["system"] = 646,
		["yOffset"] = -2795.83325195313,
		["height"] = 3399.99987792969,
		["originSystem"] = 646,
		["xOffset"] = -3052.08325195313,
		["width"] = 5099.99987792969,
	},
	[768] = {
		{
			["yOffset"] = -1675.5699462891,
			["height"] = 878.08697509766,
			["xOffset"] = -1701.25,
			["width"] = 1317.1289978027,
			["floorName"] = "The Stonecore",
		}, -- [1]
		["firstFloor"] = 1,
		["system"] = 725,
		["yOffset"] = -2200,
		["height"] = 2266.66666412354,
		["originSystem"] = 725,
		["xOffset"] = -2766.66650390625,
		["width"] = 3399.99981689453,
	},
	[896] = {
		{
			["height"] = 458.33984375,
			["yOffset"] = -4194.169921875,
			["xOffset"] = -1562.50036621094,
			["width"] = 687.509765625,
		}, -- [1]
		{
			["height"] = 288.33984375,
			["yOffset"] = -4376.669921875,
			["xOffset"] = -1677.5048828125,
			["width"] = 432.509765625,
		}, -- [2]
		{
			["height"] = 500,
			["yOffset"] = -4280,
			["xOffset"] = -2065,
			["width"] = 750,
		}, -- [3]
		["firstFloor"] = 1,
		["originSystem"] = 1008,
		["system"] = 1008,
	},
	[321] = {
		{
			["height"] = 1159.58349609375,
			["yOffset"] = -2486.66674804688,
			["xOffset"] = 3506.35400390625,
			["width"] = 1739.375,
		}, -- [1]
		{
			["height"] = 241.390014648438,
			["yOffset"] = -1932.27001953125,
			["xOffset"] = 4163.97021484375,
			["width"] = 362.08984375,
		}, -- [2]
		["firstFloor"] = 1,
		["originSystem"] = 1,
		["system"] = 1,
	},
	[769] = {
		["firstFloor"] = 1,
		["system"] = 657,
		["yOffset"] = -600,
		["height"] = 2800,
		["originSystem"] = 657,
		["xOffset"] = -2366.66650390625,
		["width"] = 4199.99975585938,
	},
	[897] = {
		{
			["height"] = 466.666748046875,
			["yOffset"] = 1966.66674804688,
			["xOffset"] = -700,
			["width"] = 700,
		}, -- [1]
		{
			["height"] = 960.0029296875,
			["yOffset"] = 1769.99853515625,
			["xOffset"] = -1430.01000976563,
			["width"] = 1440.00438022614,
		}, -- [2]
		["firstFloor"] = 1,
		["originSystem"] = 1009,
		["system"] = 1009,
	},
	[161] = {
		["firstFloor"] = 0,
		["system"] = 1,
		["yOffset"] = 5770.8330078125,
		["height"] = 4808.3330078125,
		["originSystem"] = 1,
		["xOffset"] = 62.4999961853027,
		["width"] = 7212.49951553345,
	},
	[898] = {
		{
			["height"] = 166.668014526367,
			["yOffset"] = -301.3330078125,
			["xOffset"] = -170.501007080078,
			["width"] = 250.002006530762,
		}, -- [1]
		{
			["height"] = 296.66690826416,
			["yOffset"] = -340.3330078125,
			["xOffset"] = -315.000183105469,
			["width"] = 445.000366210938,
		}, -- [2]
		{
			["height"] = 175,
			["yOffset"] = -87.5,
			["xOffset"] = -188.75,
			["width"] = 262.5,
		}, -- [3]
		{
			["height"] = 175,
			["yOffset"] = -87.5,
			["xOffset"] = -188.75,
			["width"] = 262.5,
		}, -- [4]
		["firstFloor"] = 1,
		["originSystem"] = 1007,
		["system"] = 1007,
	},
	[899] = {
		["firstFloor"] = 1,
		["system"] = 1148,
		["yOffset"] = -4008.3330078125,
		["height"] = 504.166015625,
		["originSystem"] = 1148,
		["xOffset"] = -902.0830078125,
		["width"] = 756.2490234375,
	},
	[772] = {
		["firstFloor"] = 0,
		["system"] = 1,
		["yOffset"] = 8033.3330078125,
		["height"] = 2700,
		["originSystem"] = 1,
		["xOffset"] = -3891.66650390625,
		["width"] = 4049.99983215332,
	},
	[900] = {
		{
			["height"] = 430,
			["yOffset"] = -970,
			["xOffset"] = -2767.5,
			["width"] = 645,
		}, -- [1]
		{
			["height"] = 223.6669921875,
			["yOffset"] = -830,
			["xOffset"] = -2517.75024414063,
			["width"] = 335.50048828125,
		}, -- [2]
		["firstFloor"] = 1,
		["originSystem"] = 1030,
		["system"] = 1030,
	},
	[81] = {
		["firstFloor"] = 0,
		["system"] = 1,
		["yOffset"] = -3404.16650390625,
		["height"] = 3933.33312988281,
		["originSystem"] = 1,
		["xOffset"] = -3902.08325195313,
		["width"] = 5899.99987792969,
	},
	[773] = {
		["firstFloor"] = 1,
		["system"] = 754,
		["yOffset"] = -600,
		["height"] = 1733.33325195313,
		["originSystem"] = 754,
		["xOffset"] = -2100,
		["width"] = 2599.99996948242,
	},
	[775] = {
		["firstFloor"] = 0,
		["system"] = 534,
		["yOffset"] = -6145.8330078125,
		["height"] = 1666.66650390625,
		["originSystem"] = 534,
		["xOffset"] = 1525,
		["width"] = 2499.99975585938,
	},
	[903] = {
		{
			["height"] = 146,
			["yOffset"] = -1770.5,
			["xOffset"] = -1043.5,
			["width"] = 219,
		}, -- [1]
		{
			["height"] = 172.666748046875,
			["yOffset"] = -1808.83337402344,
			["xOffset"] = -1063.5,
			["width"] = 259,
		}, -- [2]
		["firstFloor"] = 1,
		["originSystem"] = 870,
		["system"] = 870,
	},
	[520] = {
		{
			["height"] = 734.1875,
			["yOffset"] = -798.263000488281,
			["xOffset"] = -393.212005615234,
			["width"] = 1101.2809753418,
		}, -- [1]
		["firstFloor"] = 1,
		["system"] = 576,
		["yOffset"] = -798.263000488281,
		["height"] = 734.1875,
		["originSystem"] = 576,
		["xOffset"] = -393.212005615234,
		["width"] = 1101.2809753418,
	},
	[776] = {
		{
			["height"] = 350,
			["yOffset"] = -337.5,
			["xOffset"] = -475,
			["width"] = 525,
		}, -- [1]
		["firstFloor"] = 1,
		["system"] = 565,
		["yOffset"] = -337.5,
		["height"] = 350,
		["originSystem"] = 565,
		["xOffset"] = -475,
		["width"] = 525,
	},
	[521] = {
		{
			["height"] = 1216.66650390625,
			["yOffset"] = -2297.91650390625,
			["xOffset"] = -2152.08325195313,
			["width"] = 1824.99993896484,
		}, -- [1]
		{
			["height"] = 750.199951171875,
			["yOffset"] = -2641.9599609375,
			["xOffset"] = -1856.35998535156,
			["width"] = 1125.29998779297,
		}, -- [2]
		["firstFloor"] = 1,
		["originSystem"] = 595,
		["system"] = 595,
	},
	[905] = {
		{
			["height"] = 173.333984375,
			["yOffset"] = -899.6669921875,
			["xOffset"] = -375.00048828125,
			["width"] = 260.0009765625,
		}, -- [1]
		{
			["height"] = 173.333984375,
			["yOffset"] = -899.6669921875,
			["xOffset"] = -375.00048828125,
			["width"] = 260.0009765625,
		}, -- [2]
		["firstFloor"] = 3,
		["originSystem"] = 870,
		["system"] = 870,
	},
	[522] = {
		["firstFloor"] = 1,
		["system"] = 619,
		["yOffset"] = -849.999938964844,
		["height"] = 647.916610717774,
		["originSystem"] = 619,
		["xOffset"] = 233.33332824707,
		["width"] = 972.91667175293,
	},
	[906] = {
		["firstFloor"] = 0,
		["system"] = 1000,
		["yOffset"] = 3468.75,
		["height"] = 706.25,
		["originSystem"] = 1000,
		["xOffset"] = 3979.166015625,
		["width"] = 1058.333984375,
	},
	[523] = {
		{
			["height"] = 489.721500396729,
			["yOffset"] = -515.388000488281,
			["xOffset"] = -424.174987792969,
			["width"] = 734.580993652344,
		}, -- [1]
		{
			["height"] = 320.720293045044,
			["yOffset"] = -304.386993408203,
			["xOffset"] = -242.925003051758,
			["width"] = 481.081008911133,
		}, -- [2]
		{
			["height"] = 491.054512023926,
			["yOffset"] = -415.721008300781,
			["xOffset"] = -225.675003051758,
			["width"] = 736.581008911133,
		}, -- [3]
		["firstFloor"] = 1,
		["originSystem"] = 574,
		["system"] = 574,
	},
	[779] = {
		{
			["height"] = 370.666694641113,
			["yOffset"] = -255.333343505859,
			["xOffset"] = -385.5,
			["width"] = 556,
		}, -- [1]
		["firstFloor"] = 1,
		["system"] = 544,
		["yOffset"] = -255.333343505859,
		["height"] = 370.666694641113,
		["originSystem"] = 544,
		["xOffset"] = -385.5,
		["width"] = 556,
	},
	[524] = {
		{
			["height"] = 365.957015991211,
			["yOffset"] = -552.877014160156,
			["xOffset"] = 148.623001098633,
			["width"] = 548.936019897461,
		}, -- [1]
		{
			["height"] = 504.119003295898,
			["yOffset"] = -661.9580078125,
			["xOffset"] = -8.6219596862793,
			["width"] = 756.179943084717,
		}, -- [2]
		["firstFloor"] = 1,
		["originSystem"] = 575,
		["system"] = 575,
	},
	[41] = {
		["firstFloor"] = 0,
		["system"] = 1,
		["yOffset"] = -11847.916015625,
		["height"] = 3916.66650390625,
		["originSystem"] = 1,
		["xOffset"] = -4235.41650390625,
		["width"] = 5874.99975585938,
	},
	[780] = {
		{
			["height"] = 1050.00201416016,
			["yOffset"] = -650.002014160156,
			["xOffset"] = -212.502487182617,
			["width"] = 1575.00297546387,
		}, -- [1]
		["firstFloor"] = 1,
		["system"] = 548,
		["yOffset"] = -650.002014160156,
		["height"] = 1050.00201416016,
		["originSystem"] = 548,
		["xOffset"] = -212.502487182617,
		["width"] = 1575.00297546387,
	},
	[525] = {
		{
			["height"] = 377.489990234375,
			["yOffset"] = -1534.5400390625,
			["xOffset"] = -283.686004638672,
			["width"] = 566.235015869141,
		}, -- [1]
		{
			["height"] = 472.160034179688,
			["yOffset"] = -1431.88000488281,
			["xOffset"] = -169.688003540039,
			["width"] = 708.237014770508,
		}, -- [2]
		["firstFloor"] = 1,
		["originSystem"] = 602,
		["system"] = 602,
	},
	[781] = {
		["firstFloor"] = 0,
		["system"] = 568,
		["yOffset"] = -568.75,
		["height"] = 845.833312988281,
		["originSystem"] = 568,
		["xOffset"] = -1852.08325195313,
		["width"] = 1268.74993896484,
	},
	[526] = {
		{
			["yOffset"] = -1375.9100341797,
			["height"] = 613.46606445313,
			["xOffset"] = -1126.5200195313,
			["width"] = 920.1960144043,
			["floorName"] = "Halls of Stone",
		}, -- [1]
		["firstFloor"] = 1,
		["system"] = 599,
		["yOffset"] = -2200,
		["height"] = 2266.66666412354,
		["originSystem"] = 599,
		["xOffset"] = -2766.66650390625,
		["width"] = 3399.99981689453,
	},
	[782] = {
		{
			["height"] = 1050,
			["yOffset"] = -950,
			["xOffset"] = -787.5,
			["width"] = 1575,
		}, -- [1]
		["firstFloor"] = 1,
		["system"] = 550,
		["yOffset"] = -950,
		["height"] = 1050,
		["originSystem"] = 550,
		["xOffset"] = -787.5,
		["width"] = 1575,
	},
	[910] = {
		["width"] = 4687.5009765625,
		["xOffset"] = -2947.9169921875,
		["yOffset"] = 110.41602325439,
		["height"] = 3124.9999923706,
		["system"] = 1062,
	},
	[527] = {
		["firstFloor"] = 1,
		["system"] = 616,
		["yOffset"] = -2200,
		["height"] = 2266.66666412354,
		["originSystem"] = 616,
		["xOffset"] = -2766.66650390625,
		["width"] = 3399.99981689453,
	},
	[911] = {
		["firstFloor"] = 0,
		["system"] = 1103,
		["yOffset"] = 587.5,
		["height"] = 745.833984375,
		["originSystem"] = 1103,
		["xOffset"] = 314.583984375,
		["width"] = 1118.75,
	},
	[528] = {
		{
			["height"] = 343.138977050781,
			["yOffset"] = -1220.2099609375,
			["xOffset"] = -1301.9599609375,
			["width"] = 514.706970214844,
		}, -- [1]
		{
			["height"] = 443.138977050781,
			["yOffset"] = -1370.2099609375,
			["xOffset"] = -1376.9599609375,
			["width"] = 664.706970214844,
		}, -- [2]
		{
			["height"] = 343.138977050781,
			["yOffset"] = -1270.2099609375,
			["xOffset"] = -1301.9599609375,
			["width"] = 514.706970214844,
		}, -- [3]
		{
			["height"] = 196.46728515625,
			["yOffset"] = -1186.8701171875,
			["xOffset"] = -1191.9599609375,
			["width"] = 294.700988769531,
		}, -- [4]
		["firstFloor"] = 1,
		["originSystem"] = 578,
		["system"] = 578,
	},
	[912] = {
		["firstFloor"] = 0,
		["system"] = 1104,
		["yOffset"] = 891.666015625,
		["height"] = 1229.16796875,
		["originSystem"] = 1104,
		["xOffset"] = -1931.25,
		["width"] = 1845.833984375,
	},
	[529] = {
		{
			["height"] = 2191.66662597656,
			["yOffset"] = -1168.75,
			["xOffset"] = -1583.33325195313,
			["width"] = 3287.49987792969,
		}, -- [1]
		{
			["height"] = 446.300048828125,
			["yOffset"] = -1839.01000976563,
			["xOffset"] = -224.216003417969,
			["width"] = 669.450988769531,
		}, -- [2]
		{
			["height"] = 885.639892578125,
			["yOffset"] = -2564.67993164063,
			["xOffset"] = -653.721008300781,
			["width"] = 1328.46099853516,
		}, -- [3]
		{
			["height"] = 607,
			["yOffset"] = -2219,
			["xOffset"] = -594.75,
			["width"] = 910.5,
		}, -- [4]
		{
			["height"] = 1046.30004882813,
			["yOffset"] = -3168.830078125,
			["xOffset"] = -3254.44995117188,
			["width"] = 1569.4599609375,
		}, -- [5]
		{
			["height"] = 412.97998046875,
			["yOffset"] = -2247.75,
			["xOffset"] = -309.454986572266,
			["width"] = 619.468994140625,
		}, -- [6]
		["firstFloor"] = 1,
		["originSystem"] = 603,
		["system"] = 603,
	},
	[530] = {
		["firstFloor"] = 1,
		["system"] = 604,
		["yOffset"] = -2122.91650390625,
		["height"] = 762.499877929688,
		["originSystem"] = 604,
		["xOffset"] = -1310.41662597656,
		["width"] = 1143.74996948242,
	},
	[914] = {
		["firstFloor"] = 1,
		["system"] = 1095,
		["yOffset"] = -1689.5830078125,
		["height"] = 1195.8330078125,
		["originSystem"] = 1095,
		["xOffset"] = -812.5,
		["width"] = 1793.75,
	},
	[531] = {
		["firstFloor"] = 0,
		["system"] = 615,
		["yOffset"] = -3616.66650390625,
		["height"] = 775,
		["originSystem"] = 615,
		["xOffset"] = -1133.33325195313,
		["width"] = 1162.49991798401,
	},
	[532] = {
		["firstFloor"] = 1,
		["system"] = 624,
		["yOffset"] = -600,
		["height"] = 1733.33325195313,
		["originSystem"] = 624,
		["xOffset"] = -1033.33325195313,
		["width"] = 2599.99987792969,
	},
	[533] = {
		{
			["height"] = 501.983001708984,
			["yOffset"] = -794.125,
			["xOffset"] = -722.973999023438,
			["width"] = 752.973999023438,
		}, -- [1]
		{
			["height"] = 195.315979003906,
			["yOffset"] = -645.789978027344,
			["xOffset"] = -692.973999023438,
			["width"] = 292.973999023438,
		}, -- [2]
		{
			["height"] = 245,
			["yOffset"] = -640,
			["xOffset"] = -829.625,
			["width"] = 367.5,
		}, -- [3]
		["firstFloor"] = 1,
		["originSystem"] = 601,
		["system"] = 601,
	},
	[789] = {
		{
			["height"] = 604.166625976563,
			["yOffset"] = -2012.49987792969,
			["xOffset"] = -1206.25,
			["width"] = 906.25,
		}, -- [1]
		{
			["height"] = 310,
			["yOffset"] = -1890,
			["xOffset"] = -842.5,
			["width"] = 465,
		}, -- [2]
		["firstFloor"] = 1,
		["originSystem"] = 580,
		["system"] = 580,
	},
	[534] = {
		{
			["height"] = 413.293991088867,
			["yOffset"] = 182.565994262695,
			["xOffset"] = 307.069000244141,
			["width"] = 619.941009521484,
		}, -- [1]
		{
			["height"] = 413.293991088867,
			["yOffset"] = 182.565994262695,
			["xOffset"] = 382.069000244141,
			["width"] = 619.941009521484,
		}, -- [2]
		["firstFloor"] = 1,
		["originSystem"] = 600,
		["system"] = 600,
	},
	[535] = {
		{
			["height"] = 729.219970703125,
			["yOffset"] = -3615.830078125,
			["xOffset"] = 2640.27001953125,
			["width"] = 1093.830078125,
		}, -- [1]
		{
			["height"] = 729.219970703125,
			["yOffset"] = -3615.830078125,
			["xOffset"] = 3140.27001953125,
			["width"] = 1093.830078125,
		}, -- [2]
		{
			["height"] = 800,
			["yOffset"] = -3136,
			["xOffset"] = 2587,
			["width"] = 1200,
		}, -- [3]
		{
			["height"] = 800.219970703125,
			["yOffset"] = -3136.830078125,
			["xOffset"] = 3087.02001953125,
			["width"] = 1200.330078125,
		}, -- [4]
		{
			["height"] = 1379.8798828125,
			["yOffset"] = -3691.21997070313,
			["xOffset"] = 2330.28002929687,
			["width"] = 2069.80981445313,
		}, -- [5]
		{
			["height"] = 437.2900390625,
			["yOffset"] = -3816.5400390625,
			["xOffset"] = 4866.35009765625,
			["width"] = 655.93994140625,
		}, -- [6]
		["firstFloor"] = 1,
		["originSystem"] = 533,
		["system"] = 533,
	},
	[919] = {
		{
			["height"] = 522.9169921875,
			["yOffset"] = -950,
			["xOffset"] = -1150,
			["width"] = 783.3330078125,
		}, -- [1]
		{
			["height"] = 834.8330078125,
			["yOffset"] = -594.8330078125,
			["xOffset"] = -1276.11999511719,
			["width"] = 1252.24949455261,
		}, -- [2]
		{
			["height"] = 650,
			["yOffset"] = -1030,
			["xOffset"] = -799,
			["width"] = 975,
		}, -- [3]
		{
			["height"] = 670,
			["yOffset"] = -1070,
			["xOffset"] = -814,
			["width"] = 1005,
		}, -- [4]
		{
			["height"] = 293.333984375,
			["yOffset"] = -636.6669921875,
			["xOffset"] = -575.00048828125,
			["width"] = 440.0009765625,
		}, -- [5]
		{
			["height"] = 446.666687011719,
			["yOffset"] = -1110.83032226563,
			["xOffset"] = -600,
			["width"] = 670,
		}, -- [6]
		{
			["height"] = 470,
			["yOffset"] = -920,
			["xOffset"] = -637.5,
			["width"] = 705,
		}, -- [7]
		{
			["height"] = 236.666625976563,
			["yOffset"] = -843.333312988281,
			["xOffset"] = -492.5,
			["width"] = 355,
		}, -- [8]
		["firstFloor"] = 1,
		["originSystem"] = 1112,
		["system"] = 1112,
	},
	[536] = {
		["firstFloor"] = 1,
		["system"] = 608,
		["yOffset"] = -2006.24987792969,
		["height"] = 256.25,
		["originSystem"] = 608,
		["xOffset"] = -983.333312988281,
		["width"] = 383.333312988281,
	},
	[920] = {
		["firstFloor"] = 0,
		["system"] = 1102,
		["yOffset"] = 1352.083984375,
		["height"] = 1554.166015625,
		["originSystem"] = 1102,
		["xOffset"] = -3125,
		["width"] = 2331.25,
	},
	[793] = {
		["firstFloor"] = 0,
		["system"] = 859,
		["yOffset"] = 11225,
		["height"] = 1414.5830078125,
		["originSystem"] = 859,
		["xOffset"] = 612.5,
		["width"] = 2120.83325195313,
	},
	[461] = {
		["firstFloor"] = 0,
		["system"] = 529,
		["yOffset"] = -1508.33325195313,
		["height"] = 1170.83325195313,
		["originSystem"] = 529,
		["xOffset"] = -1858.33325195313,
		["width"] = 1756.24992370605,
	},
	[922] = {
		{
			["height"] = 208,
			["yOffset"] = -95.5,
			["xOffset"] = -2623.5,
			["width"] = 312,
		}, -- [1]
		{
			["height"] = 123.33332824707,
			["yOffset"] = 49.6246795654297,
			["xOffset"] = -2593.5,
			["width"] = 185,
		}, -- [2]
		["firstFloor"] = 1,
		["originSystem"] = 369,
		["system"] = 369,
	},
	[539] = {
		["firstFloor"] = 0,
		["system"] = 638,
		["yOffset"] = 533.333312988281,
		["height"] = 2097.91668701172,
		["originSystem"] = 638,
		["xOffset"] = -3439.58325195313,
		["width"] = 3145.83325195313,
	},
	[795] = {
		["firstFloor"] = 0,
		["system"] = 861,
		["yOffset"] = -1702.08325195313,
		["height"] = 793.749938964844,
		["originSystem"] = 861,
		["xOffset"] = -933.333312988281,
		["width"] = 1189.58331298828,
	},
	[462] = {
		["firstFloor"] = 0,
		["system"] = 0,
		["yOffset"] = -8641.666015625,
		["height"] = 3283.3330078125,
		["originSystem"] = 530,
		["xOffset"] = 2087.5,
		["width"] = 4925,
	},
	[34] = {
		["firstFloor"] = 0,
		["system"] = 0,
		["yOffset"] = 9716.666015625,
		["height"] = 1800,
		["originSystem"] = 0,
		["xOffset"] = -833.333312988281,
		["width"] = 2699.99993896484,
	},
	[42] = {
		["firstFloor"] = 0,
		["system"] = 1,
		["yOffset"] = -8222.916015625,
		["height"] = 4310.41625976563,
		["originSystem"] = 1,
		["xOffset"] = -3016.66650390625,
		["width"] = 6464.5830078125,
	},
	[796] = {
		{
			["height"] = 522.916625976563,
			["yOffset"] = -949.999938964844,
			["xOffset"] = -1150,
			["width"] = 783.333343505859,
		}, -- [1]
		{
			["height"] = 834.8330078125,
			["yOffset"] = -594.8330078125,
			["xOffset"] = -1276.1201171875,
			["width"] = 1252.24957847595,
		}, -- [2]
		{
			["height"] = 650,
			["yOffset"] = -1030,
			["xOffset"] = -799,
			["width"] = 975,
		}, -- [3]
		{
			["height"] = 670,
			["yOffset"] = -1070,
			["xOffset"] = -814,
			["width"] = 1005,
		}, -- [4]
		{
			["height"] = 293.333984375,
			["yOffset"] = -636.6669921875,
			["xOffset"] = -575.00048828125,
			["width"] = 440.0009765625,
		}, -- [5]
		{
			["height"] = 446.666687011719,
			["yOffset"] = -1110.83032226563,
			["xOffset"] = -600,
			["width"] = 670,
		}, -- [6]
		{
			["height"] = 470,
			["yOffset"] = -920,
			["xOffset"] = -637.5,
			["width"] = 705,
		}, -- [7]
		{
			["height"] = 236.666625976563,
			["yOffset"] = -843.333312988281,
			["xOffset"] = -492.5,
			["width"] = 355,
		}, -- [8]
		["firstFloor"] = 1,
		["originSystem"] = 564,
		["system"] = 564,
	},
	[924] = {
		{
			["height"] = 553.34375,
			["yOffset"] = -6066.671875,
			["xOffset"] = -1052.51000976563,
			["width"] = 830.015014648438,
		}, -- [1]
		{
			["height"] = 375.48974609375,
			["yOffset"] = -5975.33984375,
			["xOffset"] = -915.875305175781,
			["width"] = 563.234619140625,
		}, -- [2]
		["firstFloor"] = 1,
		["originSystem"] = 1106,
		["system"] = 1106,
	},
	[541] = {
		["firstFloor"] = 0,
		["system"] = 571,
		["yOffset"] = -10781.25,
		["height"] = 2452.083984375,
		["originSystem"] = 571,
		["xOffset"] = -2797.91650390625,
		["width"] = 3677.08312988281,
	},
	[797] = {
		["firstFloor"] = 1,
		["system"] = 543,
		["yOffset"] = 1041.66662597656,
		["height"] = 437.5,
		["originSystem"] = 543,
		["xOffset"] = -1935.41662597656,
		["width"] = 658.333374023438,
	},
	[925] = {
		["firstFloor"] = 1,
		["system"] = 1043,
		["yOffset"] = -2110.4169921875,
		["height"] = 156.25,
		["originSystem"] = 1043,
		["xOffset"] = 4639.583984375,
		["width"] = 233.33203125,
	},
	[542] = {
		["firstFloor"] = 1,
		["system"] = 650,
		["yOffset"] = -2200,
		["height"] = 1733.33334350586,
		["originSystem"] = 650,
		["xOffset"] = -2100,
		["width"] = 2599.99996948242,
	},
	[798] = {
		{
			["height"] = 353.555969238281,
			["yOffset"] = -325.760131835938,
			["xOffset"] = -226.108001708984,
			["width"] = 530.334014892578,
		}, -- [1]
		{
			["height"] = 353.555992126465,
			["yOffset"] = -325.760101318359,
			["xOffset"] = -226.108001708984,
			["width"] = 530.334014892578,
		}, -- [2]
		["firstFloor"] = 1,
		["originSystem"] = 585,
		["system"] = 585,
	},
	[543] = {
		{
			["height"] = 246.657989501953,
			["yOffset"] = -693.018981933594,
			["xOffset"] = -328.730987548828,
			["width"] = 369.986186981201,
		}, -- [1]
		{
			["height"] = 493.330017089844,
			["yOffset"] = -926.35400390625,
			["xOffset"] = -528.736022949219,
			["width"] = 739.996017456055,
		}, -- [2]
		["firstFloor"] = 1,
		["originSystem"] = 649,
		["system"] = 649,
	},
	[799] = {
		{
			["height"] = 366.69921875,
			["yOffset"] = 10822.900390625,
			["xOffset"] = 1674.9755859375,
			["width"] = 550.048828125,
		}, -- [1]
		{
			["height"] = 171.90625,
			["yOffset"] = 11017.0966796875,
			["xOffset"] = 1823.56005859375,
			["width"] = 257.85986328125,
		}, -- [2]
		{
			["height"] = 230.099609375,
			["yOffset"] = 10836.2001953125,
			["xOffset"] = 1787.42529296875,
			["width"] = 345.1494140625,
		}, -- [3]
		{
			["height"] = 346.69921875,
			["yOffset"] = 10772.900390625,
			["xOffset"] = 1669.9755859375,
			["width"] = 520.048828125,
		}, -- [4]
		{
			["height"] = 156.099609375,
			["yOffset"] = 10813.2001953125,
			["xOffset"] = 1698.43005371094,
			["width"] = 234.14990234375,
		}, -- [5]
		{
			["height"] = 387.69921875,
			["yOffset"] = 10802.900390625,
			["xOffset"] = 1624.2255859375,
			["width"] = 581.548828125,
		}, -- [6]
		{
			["height"] = 127.69921875,
			["yOffset"] = 10987.900390625,
			["xOffset"] = 1875.2255859375,
			["width"] = 191.548828125,
		}, -- [7]
		{
			["height"] = 92.900390625,
			["yOffset"] = 11012.2998046875,
			["xOffset"] = 1898.32971191406,
			["width"] = 139.3505859375,
		}, -- [8]
		{
			["height"] = 506.69921875,
			["yOffset"] = 10952.900390625,
			["xOffset"] = 1509.9755859375,
			["width"] = 760.048828125,
		}, -- [9]
		{
			["height"] = 300.166015625,
			["yOffset"] = 11086.1669921875,
			["xOffset"] = 1589.88000488281,
			["width"] = 450.25,
		}, -- [10]
		{
			["height"] = 180.69921875,
			["yOffset"] = 11104.400390625,
			["xOffset"] = 1554.47998046875,
			["width"] = 271.050048828125,
		}, -- [11]
		{
			["height"] = 396.69921875,
			["yOffset"] = 11047.900390625,
			["xOffset"] = 1587.4755859375,
			["width"] = 595.048828125,
		}, -- [12]
		{
			["height"] = 352.69921875,
			["yOffset"] = 10986.400390625,
			["xOffset"] = 1433.9755859375,
			["width"] = 529.048828125,
		}, -- [13]
		{
			["height"] = 163.5,
			["yOffset"] = 10979.5,
			["xOffset"] = 1787.38000488281,
			["width"] = 245.25,
		}, -- [14]
		{
			["height"] = 140.765625,
			["yOffset"] = 10972.8671875,
			["xOffset"] = 1813.93005371094,
			["width"] = 211.14990234375,
		}, -- [15]
		{
			["height"] = 67.5,
			["yOffset"] = 11029.5,
			["xOffset"] = 1918.88000488281,
			["width"] = 101.25,
		}, -- [16]
		{
			["height"] = 227.5,
			["yOffset"] = 10874.5,
			["xOffset"] = 1813.8798828125,
			["width"] = 341.25,
		}, -- [17]
		["firstFloor"] = 1,
		["originSystem"] = 532,
		["system"] = 532,
	},
	[464] = {
		["firstFloor"] = 0,
		["system"] = 1,
		["yOffset"] = -7339.5830078125,
		["height"] = 2714.5830078125,
		["originSystem"] = 530,
		["xOffset"] = -7100,
		["width"] = 4070.8330078125,
	},
	[544] = {
		["firstFloor"] = 0,
		["system"] = 648,
		["yOffset"] = -2881.25,
		["height"] = 3010.41665649414,
		["originSystem"] = 648,
		["xOffset"] = -4383.3330078125,
		["width"] = 4514.5830078125,
	},
	[800] = {
		{
			["height"] = 1058.3332824707,
			["yOffset"] = -424.999969482422,
			["xOffset"] = -718.75,
			["width"] = 1587.49993896484,
		}, -- [1]
		{
			["height"] = 250,
			["yOffset"] = -593.75,
			["xOffset"] = -677.0830078125,
			["width"] = 375,
		}, -- [2]
		{
			["height"] = 960,
			["yOffset"] = -1225,
			["xOffset"] = -670,
			["width"] = 1440,
		}, -- [3]
		["firstFloor"] = 1,
		["originSystem"] = 720,
		["system"] = 720,
	},
	[928] = {
		["firstFloor"] = 0,
		["system"] = 870,
		["yOffset"] = -7303.916015625,
		["height"] = 2756.25,
		["originSystem"] = 1064,
		["xOffset"] = -8203.166015625,
		["width"] = 4135.416015625,
	},
	[545] = {
		["firstFloor"] = 1,
		["system"] = 654,
		["yOffset"] = 533.333312988281,
		["height"] = 2097.91668701172,
		["originSystem"] = 654,
		["xOffset"] = -3439.58325195313,
		["width"] = 3145.83325195313,
	},
	[673] = {
		["firstFloor"] = 0,
		["system"] = 0,
		["yOffset"] = 12516.666015625,
		["height"] = 2631.25,
		["originSystem"] = 0,
		["xOffset"] = -2108.33325195313,
		["width"] = 3945.83312988281,
	},
	[401] = {
		["firstFloor"] = 0,
		["system"] = 30,
		["yOffset"] = -1085.41662597656,
		["height"] = 2824.99987792969,
		["originSystem"] = 30,
		["xOffset"] = -1781.24987792969,
		["width"] = 4237.49987792969,
	},
	[929] = {
		["firstFloor"] = 0,
		["system"] = 870,
		["yOffset"] = -6697.916015625,
		["height"] = 1191.666015625,
		["originSystem"] = 870,
		["xOffset"] = -2004.1669921875,
		["width"] = 1787.5009765625,
	},
	[201] = {
		["firstFloor"] = 0,
		["system"] = 1,
		["yOffset"] = 5966.66650390625,
		["height"] = 2466.66650390625,
		["originSystem"] = 1,
		["xOffset"] = -533.333312988281,
		["width"] = 3699.99981689453,
	},
	[930] = {
		{
			["height"] = 856.6669921875,
			["yOffset"] = -6113.33349609375,
			["xOffset"] = -7027.5,
			["width"] = 1285,
		}, -- [1]
		{
			["height"] = 1033.33984375,
			["yOffset"] = -6246.669921875,
			["xOffset"] = -6175.0048828125,
			["width"] = 1550.009765625,
		}, -- [2]
		{
			["height"] = 686.6669921875,
			["yOffset"] = -6605.83349609375,
			["xOffset"] = -5245,
			["width"] = 1030,
		}, -- [3]
		{
			["height"] = 394.18701171875,
			["yOffset"] = -6312.87353515625,
			["xOffset"] = -4609.64013671875,
			["width"] = 591.280029296875,
		}, -- [4]
		{
			["height"] = 686.6669921875,
			["yOffset"] = -6128.33349609375,
			["xOffset"] = -5245,
			["width"] = 1030,
		}, -- [5]
		{
			["height"] = 606.6669921875,
			["yOffset"] = -6402.83349609375,
			["xOffset"] = -4950,
			["width"] = 910,
		}, -- [6]
		{
			["height"] = 540,
			["yOffset"] = -5985,
			["xOffset"] = -4505,
			["width"] = 810,
		}, -- [7]
		{
			["height"] = 411.6669921875,
			["yOffset"] = -5733.33349609375,
			["xOffset"] = -4978.75,
			["width"] = 617.5,
		}, -- [8]
		["firstFloor"] = 1,
		["originSystem"] = 1098,
		["system"] = 1098,
	},
	[803] = {
		{
			["height"] = 734.189697265625,
			["yOffset"] = -4361.009765625,
			["xOffset"] = -7757.89208984375,
			["width"] = 1101.2841796875,
		}, -- [1]
		["firstFloor"] = 1,
		["system"] = 951,
		["yOffset"] = -4361.009765625,
		["height"] = 734.189697265625,
		["originSystem"] = 951,
		["xOffset"] = -7757.89208984375,
		["width"] = 1101.2841796875,
	},
	[466] = {
		["firstFloor"] = 0,
		["system"] = 530,
		["yOffset"] = -5821.359375,
		["height"] = 11642.71875,
		["originSystem"] = 530,
		["xOffset"] = -12996.0390625,
		["width"] = 17464.078125,
	},
	[677] = {
		["firstFloor"] = 0,
		["system"] = 728,
		["yOffset"] = 1306.25,
		["height"] = 593.749877929688,
		["originSystem"] = 728,
		["xOffset"] = -1933.33325195313,
		["width"] = 889.583251953125,
	},
	[101] = {
		["firstFloor"] = 0,
		["system"] = 1,
		["yOffset"] = -452.083312988281,
		["height"] = 2997.91656494141,
		["originSystem"] = 1,
		["xOffset"] = -4233.3330078125,
		["width"] = 4495.8330078125,
	},
	[467] = {
		["firstFloor"] = 0,
		["system"] = 530,
		["yOffset"] = -1935.41662597656,
		["height"] = 3352.08325195313,
		["originSystem"] = 530,
		["xOffset"] = -9475,
		["width"] = 5027.08349609375,
	},
	[678] = {
		{
			["yOffset"] = 980,
			["microName"] = "EmberstoneMine",
			["height"] = 280,
			["xOffset"] = -1140,
			["width"] = 420,
			["floorName"] = "Emberstone Mine",
		}, -- [1]
		{
			["microName"] = "GreymaneManor",
			["height"] = 166.97998046875,
			["yOffset"] = 1500.0100097656,
			["xOffset"] = -2710.2348632813,
			["width"] = 250.4697265625,
		}, -- [2]
		{
			["microName"] = "GreymaneManor",
			["height"] = 186.97998046875,
			["yOffset"] = 1480.0100097656,
			["xOffset"] = -2725.2348632813,
			["width"] = 280.4697265625,
		}, -- [3]
		["firstFloor"] = 1,
		["system"] = 654,
		["yOffset"] = 533.333312988281,
		["height"] = 2097.91668701172,
		["originSystem"] = 654,
		["xOffset"] = -3439.58325195313,
		["width"] = 3145.83325195313,
	},
	[806] = {
		["firstFloor"] = 0,
		["system"] = 870,
		["yOffset"] = -3652.0830078125,
		["height"] = 4654.1669921875,
		["originSystem"] = 870,
		["xOffset"] = -1452.0830078125,
		["width"] = 6983.3330078125,
	},
	[934] = {
		{
			["height"] = 1021.6667175293,
			["yOffset"] = -355.833343505859,
			["xOffset"] = -1632.5,
			["width"] = 1532.5,
		}, -- [1]
		["firstFloor"] = 1,
		["system"] = 1135,
		["yOffset"] = -355.833343505859,
		["height"] = 1021.6667175293,
		["originSystem"] = 1135,
		["xOffset"] = -1632.5,
		["width"] = 1532.5,
	},
	[679] = {
		["firstFloor"] = 1,
		["system"] = 654,
		["yOffset"] = 533.333312988281,
		["height"] = 2097.91668701172,
		["originSystem"] = 654,
		["xOffset"] = -3439.58325195313,
		["width"] = 3145.83325195313,
	},
	[807] = {
		["firstFloor"] = 0,
		["system"] = 870,
		["yOffset"] = -1095.8330078125,
		["height"] = 2616.6669921875,
		["originSystem"] = 870,
		["xOffset"] = -2679.1669921875,
		["width"] = 3925.0009765625,
	},
	[935] = {
		["firstFloor"] = 0,
		["system"] = 1105,
		["yOffset"] = -189.583984375,
		["height"] = 722.91796875,
		["originSystem"] = 1105,
		["xOffset"] = -1068.75,
		["width"] = 1083.333984375,
	},
	[680] = {
		{
			["height"] = 492.576202392578,
			["yOffset"] = -39.6231994628906,
			["xOffset"] = -452.871002197266,
			["width"] = 738.864013671875,
		}, -- [1]
		["firstFloor"] = 1,
		["system"] = 389,
		["yOffset"] = -39.6231994628906,
		["height"] = 492.576202392578,
		["originSystem"] = 389,
		["xOffset"] = -452.871002197266,
		["width"] = 738.864013671875,
	},
	[808] = {
		["firstFloor"] = 0,
		["system"] = 860,
		["yOffset"] = -1785.4169921875,
		["height"] = 1779.1669921875,
		["originSystem"] = 860,
		["xOffset"] = -4979.166015625,
		["width"] = 2670.8330078125,
	},
	[341] = {
		["firstFloor"] = 0,
		["system"] = 0,
		["yOffset"] = 4569.2412109375,
		["height"] = 527.6044921875,
		["originSystem"] = 0,
		["xOffset"] = 713.591369628906,
		["width"] = 790.625061035156,
	},
	[809] = {
		["firstFloor"] = 0,
		["system"] = 870,
		["yOffset"] = -5618.75,
		["height"] = 4172.9169921875,
		["originSystem"] = 870,
		["xOffset"] = -4839.5830078125,
		["width"] = 6258.3330078125,
	},
	[937] = {
		["firstFloor"] = 1,
		["system"] = 1144,
		["yOffset"] = -1310.4169921875,
		["height"] = 504.1669921875,
		["originSystem"] = 1144,
		["xOffset"] = -1239.5830078125,
		["width"] = 758.3330078125,
	},
	[810] = {
		["firstFloor"] = 0,
		["system"] = 870,
		["yOffset"] = -4558.3330078125,
		["height"] = 3829.166015625,
		["originSystem"] = 870,
		["xOffset"] = -7079.166015625,
		["width"] = 5743.7490234375,
	},
	[938] = {
		["firstFloor"] = 1,
		["system"] = 1131,
		["yOffset"] = -2200,
		["height"] = 1200,
		["originSystem"] = 1131,
		["xOffset"] = -1966.6669921875,
		["width"] = 1800.0009765625,
	},
	[811] = {
		["firstFloor"] = 0,
		["system"] = 870,
		["yOffset"] = -1947.9169921875,
		["height"] = 1687.5009765625,
		["originSystem"] = 870,
		["xOffset"] = -2481.25,
		["width"] = 2533.333984375,
	},
	[939] = {
		["firstFloor"] = 0,
		["system"] = 1130,
		["yOffset"] = 4904.166015625,
		["height"] = 556.25,
		["originSystem"] = 1130,
		["xOffset"] = -145.833984375,
		["width"] = 833.333984375,
	},
	[35] = {
		["firstFloor"] = 0,
		["system"] = 0,
		["yOffset"] = 4487.5,
		["height"] = 1839.5830078125,
		["originSystem"] = 0,
		["xOffset"] = 1993.74987792969,
		["width"] = 2758.33312988281,
	},
	[43] = {
		["firstFloor"] = 0,
		["system"] = 1,
		["yOffset"] = -4672.91650390625,
		["height"] = 3843.74987792969,
		["originSystem"] = 1,
		["xOffset"] = -1699.99987792969,
		["width"] = 5766.66638183594,
	},
	[940] = {
		["firstFloor"] = 0,
		["system"] = 1099,
		["yOffset"] = -2560.4169921875,
		["height"] = 464.583984375,
		["originSystem"] = 1099,
		["xOffset"] = 3818.75,
		["width"] = 697.916015625,
	},
	[685] = {
		["firstFloor"] = 0,
		["system"] = 0,
		["yOffset"] = 1306.25,
		["height"] = 593.749877929688,
		["originSystem"] = 0,
		["xOffset"] = -1933.33325195313,
		["width"] = 889.583251953125,
	},
	[813] = {
		["firstFloor"] = 0,
		["system"] = 968,
		["yOffset"] = -2918.75,
		["height"] = 1514.58337402344,
		["originSystem"] = 968,
		["xOffset"] = -2660.41650390625,
		["width"] = 2270.83319091797,
	},
	[941] = {
		{
			["yOffset"] = -7006.669921875,
			["microName"] = "BladespireFortress",
			["height"] = 483.33984375,
			["xOffset"] = -6162.5048828125,
			["width"] = 725.009765625,
			["floorName"] = "Bladespire Fortress",
		}, -- [1]
		{
			["yOffset"] = -6960.669921875,
			["microName"] = "BladespireFortress",
			["height"] = 423.33984375,
			["xOffset"] = -6115.0048828125,
			["width"] = 635.009765625,
			["floorName"] = "Bladespire Courtyard",
		}, -- [2]
		{
			["yOffset"] = -6950,
			["microName"] = "BladespireFortress",
			["height"] = 240,
			["xOffset"] = -6005,
			["width"] = 360,
			["floorName"] = "Bladespire Throne",
		}, -- [3]
		{
			["yOffset"] = -6950,
			["microName"] = "BladespireFortress",
			["height"] = 410,
			["xOffset"] = -6131,
			["width"] = 615,
			["floorName"] = "Sootstained Mines",
		}, -- [4]
		nil, -- [5]
		{
			["yOffset"] = -5770,
			["microName"] = "ThunderlordCityInterior",
			["height"] = 295,
			["xOffset"] = -3738.75,
			["width"] = 442.5,
			["floorName"] = "Grom'gar",
		}, -- [6]
		{
			["yOffset"] = -7200,
			["microName"] = "TheSavageCrag",
			["height"] = 550,
			["xOffset"] = -4972.5,
			["width"] = 825,
			["floorName"] = "The Savage Crag",
		}, -- [7]
		{
			["yOffset"] = -7200,
			["microName"] = "TheSavageCrag",
			["height"] = 550,
			["xOffset"] = -4972.5,
			["width"] = 825,
			["floorName"] = "Grulloc's Lair",
		}, -- [8]
		{
			["yOffset"] = -7610,
			["microName"] = "FrostbiteHollowInterrior",
			["height"] = 250,
			["xOffset"] = -3612.5,
			["width"] = 375,
			["floorName"] = "Snowfall Alcove",
		}, -- [9]
		["firstFloor"] = 0,
		["system"] = 1116,
		["xOffset"] = -7506.25,
		["yOffset"] = -8275,
		["height"] = 4077.080078125,
		["originSystem"] = 1116,
		["width"] = 6114.57995605469,
	},
	[686] = {
		["firstFloor"] = 0,
		["system"] = 209,
		["yOffset"] = -2052.08325195313,
		["height"] = 922.916625976563,
		["originSystem"] = 209,
		["xOffset"] = -1624.99987792969,
		["width"] = 1383.33322143555,
	},
	[687] = {
		{
			["height"] = 463.352981567383,
			["yOffset"] = 255.166000366211,
			["xOffset"] = -442.757995605469,
			["width"] = 695.028991699219,
		}, -- [1]
		["firstFloor"] = 1,
		["system"] = 109,
		["yOffset"] = 255.166000366211,
		["height"] = 463.352981567383,
		["originSystem"] = 109,
		["xOffset"] = -442.757995605469,
		["width"] = 695.028991699219,
	},
	[688] = {
		{
			["height"] = 589.479972839356,
			["yOffset"] = 87.6669998168945,
			["xOffset"] = -502.924011230469,
			["width"] = 884.220001220703,
		}, -- [1]
		{
			["height"] = 589.480010986328,
			["yOffset"] = 337.666961669922,
			["xOffset"] = -302.924011230469,
			["width"] = 884.220031738281,
		}, -- [2]
		{
			["height"] = 189.482666015625,
			["yOffset"] = 687.665649414063,
			["xOffset"] = -2.92600011825562,
			["width"] = 284.224004268646,
		}, -- [3]
		["firstFloor"] = 1,
		["originSystem"] = 48,
		["system"] = 48,
	},
	[816] = {
		["firstFloor"] = 0,
		["system"] = 939,
		["yOffset"] = -3766.66650390625,
		["height"] = 833.333251953125,
		["originSystem"] = 939,
		["xOffset"] = 4650,
		["width"] = 1252.0830078125,
	},
	[281] = {
		["firstFloor"] = 0,
		["system"] = 1,
		["yOffset"] = -8793.75,
		["height"] = 4100,
		["originSystem"] = 1,
		["xOffset"] = 991.666625976563,
		["width"] = 6149.99987792969,
	},
	[689] = {
		["firstFloor"] = 0,
		["system"] = 0,
		["yOffset"] = 10964.5830078125,
		["height"] = 4368.75,
		["originSystem"] = 0,
		["xOffset"] = -2977.08325195313,
		["width"] = 6552.0830078125,
	},
	[473] = {
		["firstFloor"] = 0,
		["system"] = 530,
		["yOffset"] = 1947.91662597656,
		["height"] = 3666.66638183594,
		["originSystem"] = 530,
		["xOffset"] = -4225,
		["width"] = 5500,
	},
	[141] = {
		["firstFloor"] = 0,
		["system"] = 1,
		["yOffset"] = 2033.333984375,
		["height"] = 3500,
		["originSystem"] = 1,
		["xOffset"] = 975,
		["width"] = 5250,
	},
	[690] = {
		{
			["height"] = 252.102495193481,
			["yOffset"] = -220.632995605469,
			["xOffset"] = -189.822006225586,
			["width"] = 378.15299987793,
		}, -- [1]
		["firstFloor"] = 1,
		["system"] = 34,
		["yOffset"] = -220.632995605469,
		["height"] = 252.102495193481,
		["originSystem"] = 34,
		["xOffset"] = -189.822006225586,
		["width"] = 378.15299987793,
	},
	[946] = {
		[13] = {
			["yOffset"] = -1965,
			["microName"] = "TombofLights",
			["height"] = 350,
			["xOffset"] = -2487.5,
			["width"] = 525,
			["floorName"] = "Tomb of Lights",
		},
		[14] = {
			["yOffset"] = -2365,
			["microName"] = "TombofSouls",
			["height"] = 360,
			["xOffset"] = -3632.5,
			["width"] = 540,
			["floorName"] = "Tomb of Souls",
		},
		[30] = {
			["height"] = 350,
			["microName"] = "TheBreachedOssuary",
			["width"] = 525,
			["xOffset"] = -3287.5,
			["yOffset"] = -2050,
		},		
		["xOffset"] = -5833.330078125,
		["originSystem"] = 1116,
		["width"] = 5962.49607849121,
		["firstFloor"] = 0,
		["height"] = 3975.00393676758,
		["system"] = 1116,
		["yOffset"] = -4429.169921875,
	},
	[691] = {
		{
			["height"] = 513.111999511719,
			["yOffset"] = 180.888000488281,
			["xOffset"] = -491.89599609375,
			["width"] = 769.667999267578,
		}, -- [1]
		{
			["height"] = 513.111999511719,
			["yOffset"] = 200.888000488281,
			["xOffset"] = -691.89599609375,
			["width"] = 769.667999267578,
		}, -- [2]
		{
			["height"] = 579.778015136719,
			["yOffset"] = 387.554992675781,
			["xOffset"] = -741.89599609375,
			["width"] = 869.667999267578,
		}, -- [3]
		{
			["height"] = 579.779998779297,
			["yOffset"] = 357.553985595703,
			["xOffset"] = -942.669006347656,
			["width"] = 869.669708251953,
		}, -- [4]
		["firstFloor"] = 1,
		["originSystem"] = 90,
		["system"] = 90,
	},
	[819] = {
		{
			["height"] = 2029.16650390625,
			["yOffset"] = -5327.0830078125,
			["xOffset"] = -1791.66662597656,
			["width"] = 3043.74987792969,
		}, -- [1]
		{
			["height"] = 250,
			["yOffset"] = -3675,
			["xOffset"] = -450,
			["width"] = 375,
		}, -- [2]
		["firstFloor"] = 1,
		["originSystem"] = 940,
		["system"] = 940,
	},
	[947] = {
		["firstFloor"] = 0,
		["system"] = 1116,
		[15] = {
			["microName"] = "BloodthornCave",
			["height"] = 231,
			["yOffset"] = -1261.75,
			["xOffset"] = -930.25,
			["width"] = 346.5,
		},
		["yOffset"] = -2660.419921875,
		["height"] = 4466.669921875,
		["originSystem"] = 1116,
		["xOffset"] = -2268.75,
		["width"] = 6700,
	},
	[692] = {
		{
			["height"] = 595.778991699219,
			["yOffset"] = -204.305999755859,
			["xOffset"] = -645.119018554688,
			["width"] = 893.668014526367,
		}, -- [1]
		{
			["height"] = 328.380493164063,
			["yOffset"] = -270.606994628906,
			["xOffset"] = -545.119018554688,
			["width"] = 492.570419311523,
		}, -- [2]
		["firstFloor"] = 1,
		["originSystem"] = 70,
		["system"] = 70,
	},
	[820] = {
		{
			["height"] = 2197.91650390625,
			["yOffset"] = -4697.91650390625,
			["xOffset"] = -2260.41650390625,
			["width"] = 3295.83312988281,
		}, -- [1]
		{
			["height"] = 375,
			["yOffset"] = -3293.75,
			["xOffset"] = -793.75,
			["width"] = 562.5,
		}, -- [2]
		{
			["height"] = 577.080322265625,
			["yOffset"] = -4077.080078125,
			["xOffset"] = -1400.51879882813,
			["width"] = 865.620544433594,
		}, -- [3]
		{
			["height"] = 316.66650390625,
			["yOffset"] = -4545.83154296875,
			["xOffset"] = -1656.25,
			["width"] = 475,
		}, -- [4]
		{
			["height"] = 464.58984375,
			["yOffset"] = -3035.419921875,
			["xOffset"] = -406.775390625,
			["width"] = 696.884765625,
		}, -- [5]
		{
			["height"] = 302.08984375,
			["yOffset"] = -4272.919921875,
			["xOffset"] = 193.223999023438,
			["width"] = 453.135009765625,
		}, -- [6]
		["firstFloor"] = 1,
		["originSystem"] = 938,
		["system"] = 938,
	},
	[948] = {
		["firstFloor"] = 0,
		["system"] = 1116,
		["yOffset"] = -1383.32995605469,
		["height"] = 4039.57995605469,
		["originSystem"] = 1116,
		["xOffset"] = -4681.25,
		["width"] = 6060.42004394531,
	},
	[949] = {
		["xOffset"] = -5066.669921875,
		["originSystem"] = 1116,
		["width"] = 8177.08984375,
		[17] = {
			["yOffset"] = -4495,
			["microName"] = "MoirasReach",
			["height"] = 165,
			["xOffset"] = -1261.25,
			["width"] = 247.5,
			["floorName"] = "The Armory",
		},
		[18] = {
			["yOffset"] = -7165,
			["microName"] = "FissureOfFury",
			["height"] = 215,
			["xOffset"] = -1736.25,
			["width"] = 322.5,
			["floorName"] = "Fissure of Fury",
		},
		[19] = {
			["yOffset"] = -7215,
			["microName"] = "FissureOfFury",
			["height"] = 265,
			["xOffset"] = -1773.25,
			["width"] = 397.5,
			["floorName"] = "Heart of Fury",
		},
		["system"] = 1116,
		["height"] = 5450,
		["yOffset"] = -9589.580078125,
		["firstFloor"] = 0,
		[16] = {
			["yOffset"] = -4498.75,
			["microName"] = "MoirasReach",
			["height"] = 172.5,
			["xOffset"] = -1266.8800048828,
			["width"] = 258.75,
			["floorName"] = "Moira's Bastion",
		},
		[20] = {
			["floorName"] = "Cragplume Crater",
			["height"] = 226.6669921875,
			["microName"] = "CragplumeCauldron",
			["width"] = 340,
			["xOffset"] = -925,
			["yOffset"] = -6725.8334960938,
		},		
		[21] = {
			["floorName"] = "Cragplume Depths",
			["height"] = 313.33984375,
			["microName"] = "CragplumeCauldron",
			["width"] = 470.01000976563,
			["xOffset"] = -995.00500488281,
			["yOffset"] = -6784.169921875,
		},		
	},
	[950] = {
		["xOffset"] = -9308.330078125,
		["originSystem"] = 1116,
		["width"] = 5675,
		["firstFloor"] = 0,
		[10] = {
			["yOffset"] = -2880,
			["microName"] = "TheMastersCavern",
			["height"] = 370,
			["xOffset"] = -4450,
			["width"] = 555,
			["floorName"] = "The Master's Cavern",
		},
		["system"] = 1116,
		[11] = {
			["yOffset"] = -3235.419921875,
			["microName"] = "StonecragGorge",
			["height"] = 245.83984375,
			["xOffset"] = -5550.0048828125,
			["width"] = 368.759765625,
			["floorName"] = "Stonecrag Gorge",
		},
		["yOffset"] = -4922.919921875,
		[12] = {
			["yOffset"] = -2722.5,
			["microName"] = "ShadowfallCanyon",
			["height"] = 400,
			["xOffset"] = -6675,
			["width"] = 600,
			["floorName"] = "The Underpale",
		},
		["height"] = 3783.33996582031,
	},
	[823] = {
		["firstFloor"] = 0,
		["system"] = 974,
		["yOffset"] = 3322.91650390625,
		["height"] = 1239.58349609375,
		["originSystem"] = 974,
		["xOffset"] = -7268.74951171875,
		["width"] = 1858.3330078125,
	},
	[951] = {
		["firstFloor"] = 0,
		["system"] = 870,
		["yOffset"] = -233.333984375,
		["height"] = 1600,
		["originSystem"] = 870,
		["xOffset"] = 4083.333984375,
		["width"] = 2400,
	},
	[696] = {
		{
			["height"] = 843.19906616211,
			["yOffset"] = -1303.06005859375,
			["xOffset"] = 130.759994506836,
			["width"] = 1264.80006408691,
		}, -- [1]
		["firstFloor"] = 1,
		["system"] = 409,
		["yOffset"] = -1303.06005859375,
		["height"] = 843.19906616211,
		["originSystem"] = 409,
		["xOffset"] = 130.759994506836,
		["width"] = 1264.80006408691,
	},
	[824] = {
		{
			["height"] = 2063.06518554688,
			["yOffset"] = 565.0927734375,
			["xOffset"] = 833.5927734375,
			["width"] = 3106.70849609375,
		}, -- [1]
		{
			["height"] = 265,
			["yOffset"] = 1625,
			["xOffset"] = 1716.25,
			["width"] = 397.5,
		}, -- [2]
		{
			["height"] = 285,
			["yOffset"] = 1625,
			["xOffset"] = 2834.5,
			["width"] = 427.5,
		}, -- [3]
		{
			["height"] = 123.466796875,
			["yOffset"] = -13651.7333984375,
			["xOffset"] = -13709.099609375,
			["width"] = 185.19921875,
		}, -- [4]
		{
			["height"] = 1,
			["yOffset"] = -1,
			["xOffset"] = -1.25,
			["width"] = 1.5,
		}, -- [5]
		{
			["height"] = 1,
			["yOffset"] = -1,
			["xOffset"] = -1.25,
			["width"] = 1.5,
		}, -- [6]
		{
			["height"] = 738.900390625,
			["yOffset"] = 11516,
			["xOffset"] = -12535.42578125,
			["width"] = 1108.3515625,
		}, -- [7]
		["firstFloor"] = 1,
		["originSystem"] = 967,
		["system"] = 967,
	},
	[697] = {
		["firstFloor"] = 0,
		["system"] = 309,
		["yOffset"] = 11308.3330078125,
		["height"] = 1252.0830078125,
		["originSystem"] = 309,
		["xOffset"] = 693.75,
		["width"] = 1877.08325195313,
	},
	[477] = {
		["firstFloor"] = 0,
		["system"] = 530,
		["yOffset"] = -41.6666641235352,
		["height"] = 3683.33316802979,
		["originSystem"] = 530,
		["xOffset"] = -10295.8330078125,
		["width"] = 5525,
	},
	[699] = {
		{
			["height"] = 850,
			["yOffset"] = -1050,
			["xOffset"] = -887.5,
			["width"] = 1275,
		}, -- [1]
		{
			["height"] = 350,
			["yOffset"] = -200,
			["xOffset"] = -650,
			["width"] = 525,
		}, -- [2]
		{
			["height"] = 325,
			["yOffset"] = -175,
			["xOffset"] = -718.75,
			["width"] = 487.5,
		}, -- [3]
		{
			["height"] = 500,
			["yOffset"] = -250,
			["xOffset"] = -1075,
			["width"] = 750,
		}, -- [4]
		{
			["height"] = 533.333999633789,
			["yOffset"] = -251.667007446289,
			["xOffset"] = 99.9991989135742,
			["width"] = 800.000801086426,
		}, -- [5]
		{
			["height"] = 650,
			["yOffset"] = -450,
			["xOffset"] = -112.5,
			["width"] = 975,
		}, -- [6]
		["firstFloor"] = 1,
		["originSystem"] = 429,
		["system"] = 429,
	},
	[478] = {
		["firstFloor"] = 0,
		["system"] = 530,
		["yOffset"] = 999.999938964844,
		["height"] = 3600.00006103516,
		["originSystem"] = 530,
		["xOffset"] = -7083.3330078125,
		["width"] = 5399.99975585938,
	},
	[36] = {
		["firstFloor"] = 0,
		["system"] = 0,
		["yOffset"] = 8514.5830078125,
		["height"] = 1712.5,
		["originSystem"] = 0,
		["xOffset"] = 1479.16662597656,
		["width"] = 2568.74987792969,
	},
	[700] = {
		["firstFloor"] = 0,
		["system"] = 0,
		["yOffset"] = 2156.25,
		["height"] = 3514.5830078125,
		["originSystem"] = 0,
		["xOffset"] = 2437.5,
		["width"] = 5270.8330078125,
	},
	[479] = {
		["firstFloor"] = 0,
		["system"] = 530,
		["yOffset"] = -5456.25,
		["height"] = 3716.66674804688,
		["originSystem"] = 530,
		["xOffset"] = -5483.3330078125,
		["width"] = 5574.99967193604,
	},
	[480] = {
		["firstFloor"] = 0,
		["system"] = 0,
		["yOffset"] = -7753.708984375,
		["height"] = 806.7705078125,
		["originSystem"] = 530,
		["xOffset"] = 4000.75,
		["width"] = 1211.45849609375,
	},
	[704] = {
		{
			["height"] = 938.040756225586,
			["yOffset"] = -1186.68041992188,
			["xOffset"] = -522.336975097656,
			["width"] = 1407.06097412109,
		}, -- [1]
		{
			["height"] = 1004.70742797852,
			["yOffset"] = -1500.01025390625,
			["xOffset"] = -572.336975097656,
			["width"] = 1507.06097412109,
		}, -- [2]
		["firstFloor"] = 1,
		["originSystem"] = 230,
		["system"] = 230,
	},
	[481] = {
		["firstFloor"] = 0,
		["system"] = 530,
		["yOffset"] = 1473.95446777344,
		["height"] = 870.833374023438,
		["originSystem"] = 530,
		["xOffset"] = -6135.2587890625,
		["width"] = 1306.25,
	},
	[962] = {
		["firstFloor"] = 0,
		["system"] = 1116,
		["yOffset"] = -11193,
		["height"] = 15157.1875,
		["originSystem"] = 1116,
		["xOffset"] = -12242.34375,
		["width"] = 22735.7822265625,
	},
	[482] = {
		["firstFloor"] = 0,
		["system"] = 566,
		["yOffset"] = -2918.75,
		["height"] = 1514.58337402344,
		["originSystem"] = 566,
		["xOffset"] = -2660.41650390625,
		["width"] = 2270.83319091797,
	},
	[708] = {
		["firstFloor"] = 0,
		["system"] = 0,
		["yOffset"] = 2160.41662597656,
		["height"] = 1343.75,
		["originSystem"] = 732,
		["xOffset"] = -4810.41662597656,
		["width"] = 2014.58329248428,
	},
	[964] = {
		["firstFloor"] = 1,
		["system"] = 1175,
		["yOffset"] = -2600,
		["height"] = 858.3330078125,
		["originSystem"] = 1175,
		["xOffset"] = -439.583984375,
		["width"] = 1287.5,
	},
	[709] = {
		["firstFloor"] = 0,
		["system"] = 0,
		["yOffset"] = 1222.91668701172,
		["height"] = 1224.99993896484,
		["originSystem"] = 732,
		["xOffset"] = -5212.5,
		["width"] = 1837.5,
	},
	[121] = {
		["firstFloor"] = 0,
		["system"] = 1,
		["yOffset"] = 2366.66650390625,
		["height"] = 4633.3330078125,
		["originSystem"] = 1,
		["xOffset"] = -5441.66650390625,
		["width"] = 6949.99975585938,
	},
	[710] = {
		{
			["height"] = 709.164993286133,
			["yOffset"] = -617.4169921875,
			["xOffset"] = -631.108215332031,
			["width"] = 1063.74746704102,
		}, -- [1]
		["firstFloor"] = 1,
		["system"] = 540,
		["yOffset"] = -617.4169921875,
		["height"] = 709.164993286133,
		["originSystem"] = 540,
		["xOffset"] = -631.108215332031,
		["width"] = 1063.74746704102,
	},
	[969] = {
		{
			["height"] = 439.166748046875,
			["yOffset"] = -2019.58337402344,
			["xOffset"] = -318.993988037109,
			["width"] = 658.75,
		}, -- [1]
		{
			["height"] = 550,
			["yOffset"] = -2117.5,
			["xOffset"] = 200,
			["width"] = 825,
		}, -- [2]
		{
			["height"] = 166.666748046875,
			["yOffset"] = -1790.83337402344,
			["xOffset"] = 700,
			["width"] = 250,
		}, -- [3]
		["firstFloor"] = 1,
		["originSystem"] = 1176,
		["system"] = 1176,
	},
	[970] = {
		{
			["microName"] = "UmbralMines",
			["height"] = 303.1728515625,
			["yOffset"] = -4663.1713867188,
			["xOffset"] = 2265.6201171875,
			["width"] = 454.759765625,
		}, -- [1]
		["firstFloor"] = 0,
		["system"] = 1265,
		["yOffset"] = -4841.669921875,
		["height"] = 1606.25,
		["originSystem"] = 1265,
		["xOffset"] = 1054.17004394531,
		["width"] = 2408.32995605469,
	},
	[486] = {
		["firstFloor"] = 0,
		["system"] = 571,
		["yOffset"] = -4897.91650390625,
		["height"] = 3843.74987792969,
		["originSystem"] = 571,
		["xOffset"] = -8570.8330078125,
		["width"] = 5764.5830078125,
	},
	[37] = {
		["firstFloor"] = 0,
		["system"] = 0,
		["yOffset"] = 11016.666015625,
		["height"] = 2733.3330078125,
		["originSystem"] = 0,
		["xOffset"] = -1743.74987792969,
		["width"] = 4099.99987792969,
	},
	[61] = {
		["firstFloor"] = 0,
		["system"] = 1,
		["yOffset"] = 3966.66650390625,
		["height"] = 2933.3330078125,
		["originSystem"] = 1,
		["xOffset"] = 433.333312988281,
		["width"] = 4399.99969482422,
	},
	[717] = {
		["firstFloor"] = 0,
		["system"] = 509,
		["yOffset"] = 8233.3330078125,
		["height"] = 1675,
		["originSystem"] = 509,
		["xOffset"] = -3035.41650390625,
		["width"] = 2512.49987792969,
	},
	[973] = {
		["yOffset"] = -2091.6669921875,
		["xOffset"] = -545.833984375,
		["height"] = 456.25,
		["parent"] = 962,
		["originSystem"] = 1116,
		["width"] = 683.333984375,
		["system"] = 1116,
	},
	[718] = {
		{
			["height"] = 322.078788757324,
			["yOffset"] = -98.2457962036133,
			["xOffset"] = -111.383003234863,
			["width"] = 483.117988586426,
		}, -- [1]
		["firstFloor"] = 1,
		["system"] = 249,
		["yOffset"] = -98.2457962036133,
		["height"] = 322.078788757324,
		["originSystem"] = 249,
		["xOffset"] = -111.383003234863,
		["width"] = 483.117988586426,
	},
	[974] = {
		["yOffset"] = -2091.6669921875,
		["xOffset"] = -545.833984375,
		["height"] = 456.25,
		["parent"] = 962,
		["originSystem"] = 1116,
		["width"] = 683.333984375,
		["system"] = 1116,
	},
	[488] = {
		["firstFloor"] = 0,
		["system"] = 571,
		["yOffset"] = -5575,
		["height"] = 3739.58337402344,
		["originSystem"] = 571,
		["xOffset"] = -3627.08325195313,
		["width"] = 5608.33312988281,
	},
	[720] = {
		["firstFloor"] = 0,
		["system"] = 1,
		["yOffset"] = 8029.16650390625,
		["height"] = 4129.16650390625,
		["originSystem"] = 1,
		["xOffset"] = -2441.66650390625,
		["width"] = 6193.74975585938,
	},
	[976] = {
		[26] = {
			["microName"] = "FrostwallMine1",
			["height"] = 260,
			["yOffset"] = -5616,
			["xOffset"] = -4695,
			["width"] = 390,
		},
		[27] = {
			["microName"] = "FrostwallMine2",
			["height"] = 260,
			["yOffset"] = -5616,
			["xOffset"] = -4695,
			["width"] = 390,
		},
		["parent"] = 962,
		["originSystem"] = 1116,
		["system"] = 1116,
		["firstFloor"] = 0,
		["height"] = 468.75,
		["yOffset"] = -5814.5830078125,
		["xOffset"] = -4885.416015625,
		["width"] = 702.0830078125,
	},
	[721] = {
		{
			["height"] = 591.226013183594,
			["yOffset"] = -304.398010253906,
			["xOffset"] = -10.5869998931885,
			["width"] = 886.839014053345,
		}, -- [1]
		{
			["height"] = 591.226013183594,
			["yOffset"] = -304.398010253906,
			["xOffset"] = -10.5869998931885,
			["width"] = 886.839014053345,
		}, -- [2]
		{
			["height"] = 591.226013183594,
			["yOffset"] = -304.398010253906,
			["xOffset"] = -10.5869998931885,
			["width"] = 886.839014053345,
		}, -- [3]
		{
			["height"] = 591.226013183594,
			["yOffset"] = -304.398010253906,
			["xOffset"] = -10.5869998931885,
			["width"] = 886.839014053345,
		}, -- [4]
		{
			["height"] = 591.226013183594,
			["yOffset"] = -304.398010253906,
			["xOffset"] = -10.5869998931885,
			["width"] = 886.839014053345,
		}, -- [5]
		{
			["height"] = 591.226013183594,
			["yOffset"] = -304.398010253906,
			["xOffset"] = -10.5869998931885,
			["width"] = 886.839014053345,
		}, -- [6]
		["firstFloor"] = 1,
		["originSystem"] = 229,
		["system"] = 229,
	},
	[722] = {
		{
			["height"] = 495.026992797852,
			["yOffset"] = -354.950988769531,
			["xOffset"] = -327.557220458984,
			["width"] = 742.540435791016,
		}, -- [1]
		{
			["height"] = 545.026992797852,
			["yOffset"] = -334.950988769531,
			["xOffset"] = -215.057250976563,
			["width"] = 817.540466308594,
		}, -- [2]
		["firstFloor"] = 1,
		["originSystem"] = 558,
		["system"] = 558,
	},
	[978] = {
		["firstFloor"] = 0,
		["system"] = 1116,
		["yOffset"] = -5577.080078125,
		["height"] = 2081.25,
		["originSystem"] = 1116,
		["xOffset"] = 2672.919921875,
		["width"] = 3122.91015625,
	},
	[723] = {
		{
			["height"] = 468.996994018555,
			["yOffset"] = -173.654006958008,
			["xOffset"] = -515.797241210938,
			["width"] = 703.495483398438,
		}, -- [1]
		{
			["height"] = 468.996994018555,
			["yOffset"] = -173.654006958008,
			["xOffset"] = -515.797241210938,
			["width"] = 703.495483398438,
		}, -- [2]
		["firstFloor"] = 1,
		["originSystem"] = 556,
		["system"] = 556,
	},
	[851] = {
		["firstFloor"] = 0,
		["system"] = 999,
		["yOffset"] = 3468.75,
		["height"] = 706.25,
		["originSystem"] = 999,
		["xOffset"] = 3979.166015625,
		["width"] = 1058.333984375,
	},
	[490] = {
		["firstFloor"] = 0,
		["system"] = 571,
		["yOffset"] = -5516.66650390625,
		["height"] = 3499.99987792969,
		["originSystem"] = 571,
		["xOffset"] = 1110.41662597656,
		["width"] = 5249.99987792969,
	},
	[724] = {
		{
			["height"] = 561.014888763428,
			["yOffset"] = -62.7969017028809,
			["xOffset"] = -185.079177856445,
			["width"] = 841.522354125977,
		}, -- [1]
		["firstFloor"] = 1,
		["system"] = 555,
		["yOffset"] = -62.7969017028809,
		["height"] = 561.014888763428,
		["originSystem"] = 555,
		["xOffset"] = -185.079177856445,
		["width"] = 841.522354125977,
	},
	[980] = {
		["firstFloor"] = 0,
		["yOffset"] = -5814.5830078125,
		["xOffset"] = -4885.416015625,
		["height"] = 468.75,
		["parent"] = 962,
		["originSystem"] = 1116,
		["width"] = 702.0830078125,
		["system"] = 1116,
	},
	[725] = {
		{
			["height"] = 669.012687683106,
			["yOffset"] = -603.135986328125,
			["xOffset"] = -498.989013671875,
			["width"] = 1003.51901245117,
		}, -- [1]
		["firstFloor"] = 1,
		["system"] = 542,
		["yOffset"] = -603.135986328125,
		["height"] = 669.012687683106,
		["originSystem"] = 542,
		["xOffset"] = -498.989013671875,
		["width"] = 1003.51901245117,
	},
	[491] = {
		["firstFloor"] = 0,
		["system"] = 571,
		["yOffset"] = -3116.66650390625,
		["height"] = 4031.24981689453,
		["originSystem"] = 571,
		["xOffset"] = 1397.91662597656,
		["width"] = 6045.83288574219,
	},
	[726] = {
		{
			["height"] = 596.613357543945,
			["yOffset"] = -423.735168457031,
			["xOffset"] = -240.977005004883,
			["width"] = 894.919998168945,
		}, -- [1]
		["firstFloor"] = 1,
		["system"] = 546,
		["yOffset"] = -423.735168457031,
		["height"] = 596.613357543945,
		["originSystem"] = 546,
		["xOffset"] = -240.977005004883,
		["width"] = 894.919998168945,
	},
	[982] = {
		["firstFloor"] = 0,
		["yOffset"] = -5814.5830078125,
		["xOffset"] = -4885.416015625,
		["height"] = 468.75,
		["parent"] = 962,
		["originSystem"] = 1116,
		["width"] = 702.0830078125,
		["system"] = 1116,
	},
	[727] = {
		{
			["height"] = 584.509414672852,

			["yOffset"] = -158.56721496582,
			["xOffset"] = -160.022003173828,
			["width"] = 876.76400756836,
		}, -- [1]
		{
			["height"] = 584.509414672852,
			["yOffset"] = -158.56721496582,
			["xOffset"] = -160.022003173828,
			["width"] = 876.76400756836,
		}, -- [2]
		["firstFloor"] = 1,
		["originSystem"] = 545,
		["system"] = 545,
	},
	[492] = {
		["firstFloor"] = 0,
		["system"] = 571,
		["yOffset"] = -9427.0830078125,
		["height"] = 4181.25,
		["originSystem"] = 571,
		["xOffset"] = -5443.75,
		["width"] = 6270.83331298828,
	},
	[728] = {
		{
			["height"] = 593.3720703125,
			["yOffset"] = -201.720031738281,
			["xOffset"] = -53.9341011047363,
			["width"] = 890.058124542236,
		}, -- [1]
		["firstFloor"] = 1,
		["system"] = 547,
		["yOffset"] = -201.720031738281,
		["height"] = 593.3720703125,
		["originSystem"] = 547,
		["xOffset"] = -53.9341011047363,
		["width"] = 890.058124542236,
	},
	[856] = {
		["firstFloor"] = 0,
		["system"] = 998,
		["yOffset"] = -2083.3330078125,
		["height"] = 560.416015625,
		["originSystem"] = 998,
		["xOffset"] = -1743.75,
		["width"] = 839.5830078125,
	},
	[984] = {
		["firstFloor"] = 1,
		["system"] = 1182,
		["yOffset"] = -2733.3330078125,
		["height"] = 2266.6669921875,
		["originSystem"] = 1182,
		["xOffset"] = -4633.3330078125,
		["width"] = 3400,
	},
	[601] = {
		["firstFloor"] = 1,
		["system"] = 632,
		["yOffset"] = -6466.66650390625,
		["height"] = 7599.99975585938,
		["originSystem"] = 632,
		["xOffset"] = -7033.3330078125,
		["width"] = 11399.9995117188,
	},
	[729] = {
		{
			["height"] = 504.934997558594,
			["yOffset"] = -248.024993896484,
			["xOffset"] = -649.753234863281,
			["width"] = 757.402481079102,
		}, -- [1]
		["firstFloor"] = 1,
		["system"] = 553,
		["yOffset"] = -248.024993896484,
		["height"] = 504.934997558594,
		["originSystem"] = 553,
		["xOffset"] = -649.753234863281,
		["width"] = 757.402481079102,
	},
	[857] = {
		["firstFloor"] = 0,
		["system"] = 870,
		["yOffset"] = 110.416023254395,
		["height"] = 3124.99999237061,
		["originSystem"] = 870,
		["xOffset"] = -2947.9169921875,
		["width"] = 4687.5009765625,
	},
	[493] = {
		["firstFloor"] = 0,
		["system"] = 571,
		["yOffset"] = -7287.49951171875,
		["height"] = 2904.16650390625,
		["originSystem"] = 571,
		["xOffset"] = -6929.16650390625,
		["width"] = 4356.25,
	},
	[602] = {
		["firstFloor"] = 0,
		["system"] = 658,
		["yOffset"] = -1256.25,
		["height"] = 1022.91667175293,
		["originSystem"] = 658,
		["xOffset"] = -839.583312988281,
		["width"] = 1533.33331298828,
	},
	[730] = {
		{
			["height"] = 450.825401306152,
			["yOffset"] = -349.986206054688,
			["xOffset"] = -334.4580078125,
			["width"] = 676.238006591797,
		}, -- [1]
		{
			["height"] = 450.825366973877,
			["yOffset"] = -412.986022949219,
			["xOffset"] = -334.4580078125,
			["width"] = 676.238006591797,
		}, -- [2]
		["firstFloor"] = 1,
		["originSystem"] = 554,
		["system"] = 554,
	},
	[858] = {
		["firstFloor"] = 0,
		["system"] = 870,
		["yOffset"] = -1416.6669921875,
		["height"] = 3568.7509765625,
		["originSystem"] = 870,
		["xOffset"] = -6139.5830078125,
		["width"] = 5352.0830078125,
	},
	[986] = {
		["firstFloor"] = 0,
		["system"] = 1207,
		["yOffset"] = -4333.3330078125,
		["height"] = 1733.3330078125,
		["originSystem"] = 1207,
		["xOffset"] = -4766.666015625,
		["width"] = 2599.9990234375,
	},
	[603] = {
		["firstFloor"] = 1,
		["system"] = 668,
		["yOffset"] = -6466.66650390625,
		["height"] = 8666.66650390625,
		["originSystem"] = 668,
		["xOffset"] = -7033.3330078125,
		["width"] = 12999.9995117188,
	},
	[731] = {
		{
			["height"] = 459.789352416992,
			["yOffset"] = -384.365020751953,
			["xOffset"] = -284.579010009766,
			["width"] = 689.684020996094,
		}, -- [1]
		{
			["height"] = 364.032012939453,
			["yOffset"] = -408.032012939453,
			["xOffset"] = -300.761016845703,
			["width"] = 546.048049926758,
		}, -- [2]
		{
			["height"] = 424.456024169922,
			["yOffset"] = -575.289001464844,
			["xOffset"] = -214.078994750977,
			["width"] = 636.684005737305,
		}, -- [3]
		["firstFloor"] = 1,
		["originSystem"] = 552,
		["system"] = 552,
	},
	[987] = {
		["firstFloor"] = 1,
		["system"] = 1195,
		["yOffset"] = -7533.3330078125,
		["height"] = 1200,
		["originSystem"] = 1195,
		["xOffset"] = -100,
		["width"] = 1800,
	},
	[38] = {
		["firstFloor"] = 0,
		["system"] = 0,
		["yOffset"] = 9535.416015625,
		["height"] = 1672.9169921875,
		["originSystem"] = 0,
		["xOffset"] = 2081.25,
		["width"] = 2508.3330078125,
	},
	[732] = {
		{
			["height"] = 548.856811523438,
			["yOffset"] = -90.07080078125,
			["xOffset"] = -276.93408203125,
			["width"] = 823.28515625,
		}, -- [1]
		["firstFloor"] = 1,
		["system"] = 557,
		["yOffset"] = -90.07080078125,
		["height"] = 548.856811523438,
		["originSystem"] = 557,
		["xOffset"] = -276.93408203125,
		["width"] = 823.28515625,
	},
	[860] = {
		["firstFloor"] = 1,
		["system"] = 727,
		["yOffset"] = -1495.8330078125,
		["height"] = 1499.9990234375,
		["originSystem"] = 727,
		["xOffset"] = -1320.8330078125,
		["width"] = 2249.9990234375,
	},
	[988] = {
		{
			["height"] = 625.166638374329,
			["yOffset"] = -611.3330078125,
			["xOffset"] = -3938.75,
			["width"] = 937.75,
		}, -- [1]
		{
			["height"] = 535,
			["yOffset"] = -485,
			["xOffset"] = -3901.25,
			["width"] = 802.5,
		}, -- [2]
		{
			["height"] = 375,
			["yOffset"] = -455,
			["xOffset"] = -3659.75,
			["width"] = 562.5,
		}, -- [3]
		{
			["height"] = 459.173980712891,
			["yOffset"] = -682.086975097656,
			["xOffset"] = -3628.13037109375,
			["width"] = 688.7607421875,
		}, -- [4]
		{
			["height"] = 300.413970947266,
			["yOffset"] = -674.581970214844,
			["xOffset"] = -3713.810546875,
			["width"] = 450.62109375,
		}, -- [5]
		["firstFloor"] = 1,
		["originSystem"] = 1205,
		["system"] = 1205,
	},
	[605] = {
		["firstFloor"] = 0,
		["system"] = 648,
		["yOffset"] = 7731.24951171875,
		["height"] = 900.00048828125,
		["originSystem"] = 648,
		["xOffset"] = -2129.16650390625,
		["width"] = 1352.08319091797,
	},
	[733] = {
		["firstFloor"] = 0,
		["system"] = 269,
		["yOffset"] = 1500,
		["height"] = 725,
		["originSystem"] = 269,
		["xOffset"] = -7649.99951171875,
		["width"] = 1087.5,
	},
	[495] = {
		["firstFloor"] = 0,
		["system"] = 571,
		["yOffset"] = -10197.916015625,
		["height"] = 4741.666015625,
		["originSystem"] = 571,
		["xOffset"] = -1841.66662597656,
		["width"] = 7112.49963378906,
	},
	[606] = {
		["firstFloor"] = 0,
		["system"] = 1,
		["yOffset"] = -6195.8330078125,
		["height"] = 2831.24975585938,
		["originSystem"] = 1,
		["xOffset"] = 929.166625976563,
		["width"] = 4245.83337402344,
	},
	[734] = {
		["firstFloor"] = 0,
		["system"] = 560,
		["yOffset"] = -3127.08325195313,
		["height"] = 1554.16662597656,
		["originSystem"] = 560,
		["xOffset"] = -1854.16662597656,
		["width"] = 2331.24993896484,
	},
	[862] = {
		["firstFloor"] = 0,
		["system"] = 870,
		["yOffset"] = -6679.16015625,
		["height"] = 10343.5400390625,
		["originSystem"] = 870,
		["xOffset"] = -8752.8603515625,
		["width"] = 15515.3002929688,
	},
	[607] = {
		["firstFloor"] = 0,
		["system"] = 1,
		["yOffset"] = -204.166656494141,
		["height"] = 4941.66665649414,
		["originSystem"] = 1,
		["xOffset"] = -1356.25,
		["width"] = 7412.5,
	},
	[496] = {
		["firstFloor"] = 0,
		["system"] = 571,
		["yOffset"] = -7668.74951171875,
		["height"] = 3329.16650390625,
		["originSystem"] = 571,
		["xOffset"] = 600,
		["width"] = 4993.75,
	},
	[736] = {
		["firstFloor"] = 0,
		["system"] = 761,
		["yOffset"] = -1604.16662597656,
		["height"] = 868.75,
		["originSystem"] = 761,
		["xOffset"] = -1745.83325195313,
		["width"] = 1302.0832824707,
	},
	[864] = {
		["firstFloor"] = 0,
		["system"] = 0,
		["yOffset"] = 8570.83203125,
		["height"] = 645.833984375,
		["originSystem"] = 0,
		["xOffset"] = -187.5,
		["width"] = 968.75,
	},
	[609] = {
		["firstFloor"] = 0,
		["system"] = 724,
		["yOffset"] = -3429.16650390625,
		["height"] = 502.083251953125,
		["originSystem"] = 724,
		["xOffset"] = -902.083312988281,
		["width"] = 752.083312988281,
	},
	[737] = {
		["firstFloor"] = 0,
		["system"] = 730,
		["yOffset"] = -1370.83325195313,
		["height"] = 1033.33325195313,
		["originSystem"] = 730,
		["xOffset"] = -1556.25,
		["width"] = 1550,
	},
	[993] = {
		{
			["height"] = 212.5,
			["yOffset"] = -1806.25,
			["xOffset"] = -1784.38000488281,
			["width"] = 318.75,
		}, -- [1]
		{
			["height"] = 212.5,
			["yOffset"] = -1806.25,
			["xOffset"] = -1784.38000488281,
			["width"] = 318.75,
		}, -- [2]
		{
			["height"] = 180,
			["yOffset"] = -1740,
			["xOffset"] = -1775,
			["width"] = 270,
		}, -- [3]
		{
			["height"] = 196.666748046875,
			["yOffset"] = -1748.33337402344,
			["xOffset"] = -2035,
			["width"] = 295,
		}, -- [4]
		["firstFloor"] = 1,
		["originSystem"] = 1208,
		["system"] = 1208,
	},
	[610] = {
		["firstFloor"] = 0,
		["system"] = 0,
		["yOffset"] = 4018.74975585938,
		["height"] = 1868.75024414063,
		["originSystem"] = 0,
		["xOffset"] = -5070.8330078125,
		["width"] = 2802.0830078125,
	},
	[866] = {
		["firstFloor"] = 0,
		["system"] = 0,
		["yOffset"] = 5962.5,
		["height"] = 643.75,
		["originSystem"] = 0,
		["xOffset"] = -979.1669921875,
		["width"] = 964.5830078125,
	},
	[994] = {
		{
			["height"] = 937.5,
			["yOffset"] = -4254.1669921875,
			["xOffset"] = -8468.75,
			["width"] = 1406.25,
		}, -- [1]
		{
			["height"] = 165,
			["yOffset"] = -3545,
			["xOffset"] = -7693.75,
			["width"] = 247.5,
		}, -- [2]
		{
			["height"] = 266.66650390625,
			["yOffset"] = -3603.33325195313,
			["xOffset"] = -7775,
			["width"] = 400,
		}, -- [3]
		{
			["height"] = 440,
			["yOffset"] = -4195,
			["xOffset"] = -8855.3095703125,
			["width"] = 660,
		}, -- [4]
		{
			["height"] = 625,
			["yOffset"] = -4350,
			["xOffset"] = -8993.75,
			["width"] = 937.5,
		}, -- [5]
		{
			["height"] = 575,
			["yOffset"] = -4350,
			["xOffset"] = -8981.25,
			["width"] = 862.5,
		}, -- [6]
		["firstFloor"] = 1,
		["originSystem"] = 1228,
		["system"] = 1228,
	},
	[611] = {
		["firstFloor"] = 1,
		["system"] = 654,
		["yOffset"] = 1306.25,
		["height"] = 593.749877929688,
		["originSystem"] = 654,
		["xOffset"] = -1933.33325195313,
		["width"] = 889.583251953125,
	},
	[867] = {
		{
			["height"] = 366.666687011719,
			["yOffset"] = -1118.33032226563,
			["xOffset"] = 2315,
			["width"] = 550,
		}, -- [1]
		{
			["height"] = 132,
			["yOffset"] = -920.5,
			["xOffset"] = 2378.5,
			["width"] = 198,
		}, -- [2]
		["firstFloor"] = 1,
		["originSystem"] = 960,
		["system"] = 960,
	},
	[995] = {
		{
			["height"] = 591.226013183594,
			["yOffset"] = -304.398010253906,
			["xOffset"] = -10.5869998931885,
			["width"] = 886.839014053345,
		}, -- [1]
		{
			["height"] = 591.226013183594,
			["yOffset"] = -304.398010253906,
			["xOffset"] = -10.5869998931885,
			["width"] = 886.839014053345,
		}, -- [2]
		{
			["height"] = 591.226013183594,
			["yOffset"] = -304.398010253906,
			["xOffset"] = -10.5869998931885,
			["width"] = 886.839014053345,
		}, -- [3]
		["firstFloor"] = 1,
		["originSystem"] = 1358,
		["system"] = 1358,
	},
	[613] = {
		["firstFloor"] = 0,
		["system"] = 0,
		["yOffset"] = 3720.83325195313,
		["height"] = 4631.24975585938,
		["originSystem"] = 0,
		["xOffset"] = -8754.166015625,
		["width"] = 6945.83276367188,
	},
	[499] = {
		["firstFloor"] = 0,
		["system"] = 0,
		["yOffset"] = -11168.7490234375,
		["height"] = 2218.7490234375,
		["originSystem"] = 530,
		["xOffset"] = 2902.0830078125,
		["width"] = 3327.0830078125,
	},
	[614] = {
		["firstFloor"] = 0,
		["system"] = 0,
		["yOffset"] = 4906.25,
		["height"] = 2716.66650390625,
		["originSystem"] = 0,
		["xOffset"] = -8233.3330078125,
		["width"] = 4075,
	},
	[241] = {
		["firstFloor"] = 0,
		["system"] = 1,
		["yOffset"] = -8491.666015625,
		["height"] = 1539.5830078125,
		["originSystem"] = 1,
		["xOffset"] = 1381.25,
		["width"] = 2308.33325195313,
	},
	[615] = {
		["firstFloor"] = 0,
		["system"] = 0,
		["yOffset"] = 4756.25,
		["height"] = 3233.3330078125,
		["originSystem"] = 0,
		["xOffset"] = -6681.24951171875,
		["width"] = 4849.99963378906,
	},
	[885] = {
		{
			["height"] = 490,
			["yOffset"] = 3870,
			["xOffset"] = 2317.5,
			["width"] = 735,
		}, -- [1]
		{
			["height"] = 360,
			["yOffset"] = 4125,
			["xOffset"] = 2365,
			["width"] = 540,
		}, -- [2]
		{
			["height"] = 498.33984375,
			["yOffset"] = 4278.330078125,
			["xOffset"] = 2311.2451171875,
			["width"] = 747.509765625,
		}, -- [3]
		["firstFloor"] = 1,
		["originSystem"] = 994,
		["system"] = 994,
	},
	[871] = {
		{
			["height"] = 310,
			["yOffset"] = -1100,
			["xOffset"] = -767.5,
			["width"] = 465,
		}, -- [1]
		{
			["height"] = 312,
			["yOffset"] = -1347.5,
			["xOffset"] = -733,
			["width"] = 468,
		}, -- [2]
		["firstFloor"] = 1,
		["originSystem"] = 1001,
		["system"] = 1001,
	},
	[604] = {
		{
			["height"] = 903.647033691406,
			["yOffset"] = -138.807006835938,
			["xOffset"] = -2739.80004882813,
			["width"] = 1355.47009277344,
		}, -- [1]
		{
			["height"] = 711.333690643311,
			["yOffset"] = 43.3333015441895,
			["xOffset"] = -2698,
			["width"] = 1067,
		}, -- [2]
		{
			["height"] = 130.315002441406,
			["yOffset"] = 449.997985839844,
			["xOffset"] = -2311.80004882813,
			["width"] = 195.469970703125,
		}, -- [3]
		{
			["height"] = 515.810302734375,
			["yOffset"] = -4528.22021484375,
			["xOffset"] = -2767.28002929688,
			["width"] = 773.710083007813,
		}, -- [4]
		{
			["height"] = 765.820068359375,
			["yOffset"] = -4768.22998046875,
			["xOffset"] = -3364.80004882813,
			["width"] = 1148.73999023438,
		}, -- [5]
		{
			["height"] = 249.1298828125,
			["yOffset"] = -4704.8798828125,
			["xOffset"] = -2960.28002929688,
			["width"] = 373.7099609375,
		}, -- [6]
		{
			["height"] = 195.507019042969,
			["yOffset"] = -605.799011230469,
			["xOffset"] = 1978.2900390625,
			["width"] = 293.260009765625,
		}, -- [7]
		{
			["height"] = 165.287994384766,
			["yOffset"] = -579.39599609375,
			["xOffset"] = 2400.330078125,
			["width"] = 247.929931640625,
		}, -- [8]
		["firstFloor"] = 1,
		["originSystem"] = 631,
		["system"] = 631,
	},
	[540] = {
		["firstFloor"] = 0,
		["system"] = 628,
		["yOffset"] = -1708.33325195313,
		["height"] = 1766.66658401489,
		["originSystem"] = 628,
		["xOffset"] = -525,
		["width"] = 2650,
	},
	[463] = {
		["firstFloor"] = 0,
		["system"] = 0,
		["yOffset"] = -5866.666015625,
		["height"] = 2199.99951171875,
		["originSystem"] = 530,
		["xOffset"] = 2883.3330078125,
		["width"] = 3300,
	},
	[465] = {
		["firstFloor"] = 0,
		["system"] = 530,
		["yOffset"] = -1481.25,
		["height"] = 3443.74987792969,
		["originSystem"] = 530,
		["xOffset"] = -5539.5830078125,
		["width"] = 5164.5830078125,
	},
	[301] = {
		["firstFloor"] = 0,
		["system"] = 0,
		["yOffset"] = 7995.8330078125,
		["height"] = 1158.3330078125,
		["originSystem"] = 0,
		["xOffset"] = -1722.91662597656,
		["width"] = 1737.499958992,
	},
	[989] = {
		{
			["height"] = 528.338012695313,
			["yOffset"] = -1367.98999023438,
			["xOffset"] = -2227.12353515625,
			["width"] = 792.506958007813,
		}, -- [1]
		{
			["height"] = 225.0009765625,
			["yOffset"] = -1166.31994628906,
			["xOffset"] = -1945.87072753906,
			["width"] = 337.50146484375,
		}, -- [2]
		["firstFloor"] = 1,
		["originSystem"] = 1209,
		["system"] = 1209,
	},
	[955] = {
		["firstFloor"] = 0,
		["system"] = 1161,
		["yOffset"] = -233.333984375,
		["height"] = 1600,
		["originSystem"] = 1161,
		["xOffset"] = 4083.333984375,
		["width"] = 2400,
	},
	[873] = {
		["firstFloor"] = 0,
		["system"] = 870,
		["yOffset"] = -1689.5830078125,
		["height"] = 1195.8330078125,
		["originSystem"] = 870,
		["xOffset"] = -812.5,
		["width"] = 1793.75,
	},
	[501] = {
		["firstFloor"] = 0,
		["system"] = 571,
		["yOffset"] = -5716.66650390625,
		["height"] = 1983.33325195313,
		["originSystem"] = 571,
		["xOffset"] = -4329.16650390625,
		["width"] = 2974.99987792969,
	},
	[945] = {
		["firstFloor"] = 0,
		["system"] = 1116,
		["yOffset"] = -5760.419921875,
		["height"] = 3325,
		["originSystem"] = 1116,
		["xOffset"] = -1506.25,
		["width"] = 4987.5,
	},
	[475] = {
		["firstFloor"] = 0,
		["system"] = 530,
		["yOffset"] = -4408.3330078125,
		["height"] = 3616.66638183594,
		["originSystem"] = 530,
		["xOffset"] = -8845.8330078125,
		["width"] = 5424.99975585938,
	},
	[874] = {
		{
			["height"] = 228.679992675781,
			["yOffset"] = -1229.33996582031,
			["xOffset"] = -772.010009765625,
			["width"] = 343.02001953125,
		}, -- [1]
		{
			["height"] = 400,
			["yOffset"] = -1060,
			["xOffset"] = -900.5,
			["width"] = 600,
		}, -- [2]
		["firstFloor"] = 1,
		["originSystem"] = 1004,
		["system"] = 1004,
	},
	[485] = {
		["firstFloor"] = 0,
		["system"] = 571,
		["yOffset"] = -10593.375,
		["height"] = 11834.2650146484,
		["originSystem"] = 571,
		["xOffset"] = -9217.15234375,
		["width"] = 17751.3984375,
	},
	[261] = {
		["firstFloor"] = 0,
		["system"] = 1,
		["yOffset"] = 5872.91650390625,
		["height"] = 2706.24951171875,
		["originSystem"] = 1,
		["xOffset"] = -2983.33325195313,
		["width"] = 4058.33325195313,
	},
	[747] = {
		["firstFloor"] = 0,
		["system"] = 755,
		["yOffset"] = 10591.666015625,
		["height"] = 647.9169921875,
		["originSystem"] = 755,
		["xOffset"] = 1004.16662597656,
		["width"] = 970.833251953125,
	},
	[875] = {
		{
			["height"] = 866.666687011719,
			["yOffset"] = -1483.33032226563,
			["xOffset"] = -2905,
			["width"] = 1300,
		}, -- [1]
		{
			["height"] = 148.3466796875,
			["yOffset"] = -1271.67333984375,
			["xOffset"] = -2413.76000976563,
			["width"] = 222.52001953125,
		}, -- [2]
		["firstFloor"] = 1,
		["originSystem"] = 962,
		["system"] = 962,
	},
	[502] = {
		["firstFloor"] = 0,
		["system"] = 609,
		["yOffset"] = -3087.5,
		["height"] = 2108.33337402344,
		["originSystem"] = 609,
		["xOffset"] = 4047.91650390625,
		["width"] = 3162.5,
	},
	[39] = {
		["firstFloor"] = 0,
		["system"] = 0,
		["yOffset"] = 9400,
		["height"] = 2333.3330078125,
		["originSystem"] = 0,
		["xOffset"] = -3016.66650390625,
		["width"] = 3499.99981689453,
	},
	[476] = {
		["firstFloor"] = 0,
		["system"] = 1,
		["yOffset"] = -9374.99969482422,
		["height"] = 2174.99993896484,
		["originSystem"] = 530,
		["xOffset"] = -7525,
		["width"] = 3262.4990234375,
	},
	[876] = {
		{
			["height"] = 173.333984375,
			["yOffset"] = 663.3330078125,
			["xOffset"] = -1472.50048828125,
			["width"] = 260.0009765625,
		}, -- [1]
		{
			["height"] = 173.333984375,
			["yOffset"] = 663.3330078125,
			["xOffset"] = -1472.50048828125,
			["width"] = 260.0009765625,
		}, -- [2]
		{
			["height"] = 226.666625976563,
			["yOffset"] = 591.666687011719,
			["xOffset"] = -1387.5,
			["width"] = 340,
		}, -- [3]
		{
			["height"] = 153.333984375,
			["yOffset"] = 623.3330078125,
			["xOffset"] = -1275.00048828125,
			["width"] = 230.0009765625,
		}, -- [4]
		["firstFloor"] = 1,
		["originSystem"] = 961,
		["system"] = 961,
	},
	[933] = {
		["firstFloor"] = 0,
		["system"] = 1126,
		["yOffset"] = -8147.916015625,
		["height"] = 2756.25,
		["originSystem"] = 1126,
		["xOffset"] = -7654.166015625,
		["width"] = 4135.416015625,
	},
	[684] = {
		["firstFloor"] = 0,
		["system"] = 0,
		["yOffset"] = 533.333312988281,
		["height"] = 2097.91668701172,
		["originSystem"] = 0,
		["xOffset"] = -3439.58325195313,
		["width"] = 3145.83325195313,
	},
	[749] = {
		{
			["height"] = 624.316665649414,
			["yOffset"] = -214.170333862305,
			["xOffset"] = -560.528991699219,
			["width"] = 936.475006103516,
		}, -- [1]
		["firstFloor"] = 1,
		["system"] = 43,
		["yOffset"] = -214.170333862305,
		["height"] = 624.316665649414,
		["originSystem"] = 43,
		["xOffset"] = -560.528991699219,
		["width"] = 936.475006103516,
	},
	[877] = {
		{
			["height"] = 708.333984375,
			["yOffset"] = -4210.4169921875,
			["xOffset"] = -3362.5,
			["width"] = 1062.5,
		}, -- [1]
		{
			["height"] = 206.66650390625,
			["yOffset"] = -3773.33325195313,
			["xOffset"] = -2815,
			["width"] = 310,
		}, -- [2]
		{
			["height"] = 140,
			["yOffset"] = -3750,
			["xOffset"] = -3142.5,
			["width"] = 210,
		}, -- [3]
		{
			["height"] = 260,
			["yOffset"] = -4155,
			["xOffset"] = -3090,
			["width"] = 390,
		}, -- [4]
		["firstFloor"] = 1,
		["originSystem"] = 959,
		["system"] = 959,
	},
	[471] = {
		["firstFloor"] = 0,
		["system"] = 1,
		["yOffset"] = -6523.64965820313,
		["height"] = 704.687744140625,
		["originSystem"] = 530,
		["xOffset"] = -6533.6328125,
		["width"] = 1056.7705078125,
	},
	[763] = {
		{
			["height"] = 213.36499786377,
			["yOffset"] = -317.697998046875,
			["xOffset"] = -251.410003662109,
			["width"] = 320.048904418945,
		}, -- [1]
		{
			["height"] = 293.366405487061,
			["yOffset"] = -337.699005126953,
			["xOffset"] = -311.410003662109,
			["width"] = 440.049011230469,
		}, -- [2]
		{
			["height"] = 273.385799407959,
			["yOffset"] = -307.707000732422,
			["xOffset"] = -296.438995361328,
			["width"] = 410.077995300293,
		}, -- [3]
		{
			["height"] = 354.028198242188,
			["yOffset"] = -287.707000732422,
			["xOffset"] = -356.920013427734,
			["width"] = 531.042007446289,
		}, -- [4]
		["firstFloor"] = 1,
		["originSystem"] = 289,
		["system"] = 289,
	},
	[750] = {
		{
			["height"] = 650,
			["yOffset"] = -1200,
			["xOffset"] = -147.5,
			["width"] = 975,
		}, -- [1]
		{
			["height"] = 1091.66600036621,
			["yOffset"] = -883.3330078125,
			["xOffset"] = -478.75,
			["width"] = 1637.5,
		}, -- [2]
		["firstFloor"] = 1,
		["originSystem"] = 349,
		["system"] = 349,
	},
	[878] = {
		["firstFloor"] = 0,
		["system"] = 1005,
		["yOffset"] = -2389.5830078125,
		["height"] = 312.5,
		["originSystem"] = 1005,
		["xOffset"] = 875,
		["width"] = 468.75,
	},
	[362] = {
		["firstFloor"] = 0,
		["system"] = 1,
		["yOffset"] = 849.999938964844,
		["height"] = 695.833312988281,
		["originSystem"] = 1,
		["xOffset"] = -516.666625976563,
		["width"] = 1043.74993896484,
	},
	[181] = {
		["firstFloor"] = 0,
		["system"] = 1,
		["yOffset"] = -5381.25,
		["height"] = 3677.08337402344,
		["originSystem"] = 1,
		["xOffset"] = 3372.91650390625,
		["width"] = 5514.58349609375,
	},
	[751] = {
		["firstFloor"] = 0,
		["originSystem"] = -1,
		["system"] = -1,
	},
	[879] = {
		["firstFloor"] = 0,
		["system"] = 1014,
		["yOffset"] = -4168.75,
		["height"] = 485.4169921875,
		["originSystem"] = 1014,
		["xOffset"] = -2102.0830078125,
		["width"] = 729.166015625,
	},
	[504] = {
		{
			["height"] = 553.33984375,
			["yOffset"] = -6066.669921875,
			["xOffset"] = -1052.51000976563,
			["width"] = 830.015014648438,
		}, -- [1]
		{
			["height"] = 375.48974609375,
			["yOffset"] = -5975.33984375,
			["xOffset"] = -915.869995117188,
			["width"] = 563.223999023438,
		}, -- [2]
		["firstFloor"] = 1,
		["originSystem"] = 571,
		["system"] = 571,
	},
	[182] = {
		["firstFloor"] = 0,
		["system"] = 1,
		["yOffset"] = -7237.49951171875,
		["height"] = 4041.66625976563,
		["originSystem"] = 1,
		["xOffset"] = -1797.91662597656,
		["width"] = 6062.49963378906,
	},
	[752] = {
		["firstFloor"] = 1,
		["system"] = 757,
		["yOffset"] = -1133.33325195313,
		["height"] = 1733.33325195313,
		["originSystem"] = 757,
		["xOffset"] = -2633.33325195313,
		["width"] = 2599.99991989136,
	},
	[880] = {
		["firstFloor"] = 0,
		["system"] = 870,
		["yOffset"] = -2372.9169921875,
		["height"] = 616.6669921875,
		["originSystem"] = 870,
		["xOffset"] = 1397.916015625,
		["width"] = 925,
	},
	[1008] = {
		{
			["height"] = 945.833984375,
			["yOffset"] = -956.25,
			["xOffset"] = -2354.1669921875,
			["width"] = 1418.75,
		}, -- [1]
		{
			["height"] = 304.170043945313,
			["yOffset"] = -1160.42004394531,
			["xOffset"] = 1018.74743652344,
			["width"] = 456.255126953125,
		}, -- [2]
		["firstFloor"] = 1,
		["originSystem"] = 1279,
		["system"] = 1279,
	},
	[381] = {
		["firstFloor"] = 0,
		["system"] = 1,
		["yOffset"] = -10464.5830078125,
		["height"] = 1027.0830078125,
		["originSystem"] = 1,
		["xOffset"] = -3187.5,
		["width"] = 1539.58337402344,
	},
	[753] = {
		{
			["height"] = 679.672319412232,
			["yOffset"] = -686.338989257813,
			["xOffset"] = -1459.43994140625,
			["width"] = 1019.50793457031,
		}, -- [1]
		{
			["height"] = 679.672319412232,
			["yOffset"] = -686.338989257813,
			["xOffset"] = -1259.43994140625,
			["width"] = 1019.50793457031,
		}, -- [2]
		["firstFloor"] = 1,
		["originSystem"] = 645,
		["system"] = 645,
	},
	[881] = {
		["firstFloor"] = 0,
		["system"] = 1035,
		["yOffset"] = -2083.3330078125,
		["height"] = 560.416015625,
		["originSystem"] = 1035,
		["xOffset"] = -1743.75,
		["width"] = 839.5830078125,
	},
	[1009] = {
		["firstFloor"] = 0,
		["system"] = 1116,
		["yOffset"] = -3908.3330078125,
		["height"] = 458.3330078125,
		["originSystem"] = 1116,
		["xOffset"] = 3625,
		["width"] = 687.5,
	},
	[626] = {
		["firstFloor"] = 0,
		["system"] = 726,
		["yOffset"] = -2266.66650390625,
		["height"] = 810.41650390625,
		["originSystem"] = 726,
		["xOffset"] = -931.249938964844,
		["width"] = 1214.58325195313,
	},
	[754] = {
		{
			["height"] = 566.462341070175,
			["yOffset"] = 0.999634027481079,
			["xOffset"] = -174.108993530273,
			["width"] = 849.69401550293,
		}, -- [1]
		{
			["height"] = 666.462005615234,
			["yOffset"] = -359,
			["xOffset"] = -249.108993530273,
			["width"] = 999.692977905274,
		}, -- [2]
		["firstFloor"] = 1,
		["originSystem"] = 669,
		["system"] = 669,
	},
	[882] = {
		["firstFloor"] = 0,
		["system"] = 1048,
		["yOffset"] = 2564.583984375,
		["height"] = 604.166015625,
		["originSystem"] = 1048,
		["xOffset"] = -1220.8330078125,
		["width"] = 906.2490234375,
	},
	[1010] = {
		["firstFloor"] = 0,
		["system"] = 1280,
		["yOffset"] = -2977.0830078125,
		["height"] = 1445.8330078125,
		["originSystem"] = 1280,
		["xOffset"] = -1995.8330078125,
		["width"] = 2168.7490234375,
	},
	[983] = {
		["firstFloor"] = 0,
		["system"] = 1277,
		["yOffset"] = -1264.5830078125,
		["height"] = 1354.1669921875,
		["originSystem"] = 1277,
		["xOffset"] = 1608.333984375,
		["width"] = 2031.25,
	},
	[755] = {
		{
			["height"] = 332.94970703125,
			["yOffset"] = 7394.1201171875,
			["xOffset"] = 844.622009277344,
			["width"] = 499.428039550781,
		}, -- [1]
		{
			["height"] = 432.94970703125,
			["yOffset"] = 7344.1201171875,
			["xOffset"] = 729.622985839844,
			["width"] = 649.427062988281,
		}, -- [2]
		{
			["height"] = 432.94970703125,
			["yOffset"] = 7324.1201171875,
			["xOffset"] = 719.622985839844,
			["width"] = 649.427062988281,
		}, -- [3]
		{
			["height"] = 432.94970703125,
			["yOffset"] = 7204.1201171875,
			["xOffset"] = 769.622985839844,
			["width"] = 649.427062988281,
		}, -- [4]
		["firstFloor"] = 1,
		["originSystem"] = 469,
		["system"] = 469,
	},
	[883] = {
		["firstFloor"] = 0,
		["system"] = 1050,
		["yOffset"] = 252.083984375,
		["height"] = 1789.58203125,
		["originSystem"] = 1050,
		["xOffset"] = -5616.666015625,
		["width"] = 2683.3330078125,
	},
	[1011] = {
		["firstFloor"] = 0,
		["system"] = 1116,
		["yOffset"] = -5541.666015625,
		["height"] = 533.3330078125,
		["originSystem"] = 1116,
		["xOffset"] = 3589.583984375,
		["width"] = 800,
	},
	[971] = {
		[24] = {
			["microName"] = "LunarfallMine2",
			["height"] = 250,
			["yOffset"] = -2056,
			["xOffset"] = -344,
			["width"] = 375,
		},
		["parent"] = 962,
		["originSystem"] = 1116,
		["system"] = 1116,
		["yOffset"] = -2091.6669921875,
		["height"] = 456.25,
		["xOffset"] = -545.833984375,
		[23] = {
			["microName"] = "LunarfallMine1",
			["height"] = 250,
			["yOffset"] = -2056,
			["xOffset"] = -344,
			["width"] = 375,
		},
		["width"] = 683.333984375,
	},
	[756] = {
		{
			["height"] = 372.842502593994,
			["yOffset"] = -35.3334999084473,
			["xOffset"] = 237.358001708984,
			["width"] = 559.264007568359,
		}, -- [1]
		{
			["height"] = 332.842300415039,
			["yOffset"] = -65.3332977294922,
			["xOffset"] = 517.356994628906,
			["width"] = 499.263000488281,
		}, -- [2]
		["firstFloor"] = 1,
		["originSystem"] = 36,
		["system"] = 36,
	},
	[884] = {
		["firstFloor"] = 0,
		["system"] = 1051,
		["yOffset"] = -2216.6669921875,
		["height"] = 647.9169921875,
		["originSystem"] = 1051,
		["xOffset"] = -747.9169921875,
		["width"] = 970.8330078125,
	},
	[975] = {
		["yOffset"] = -2091.6669921875,
		["xOffset"] = -545.833984375,
		["height"] = 456.25,
		["parent"] = 962,
		["originSystem"] = 1116,
		["width"] = 683.333984375,
		["system"] = 1116,
	},
	[981] = {
		["firstFloor"] = 0,
		["yOffset"] = -5814.5830078125,
		["xOffset"] = -4885.416015625,
		["height"] = 468.75,
		["parent"] = 962,
		["originSystem"] = 1116,
		["width"] = 702.0830078125,
		["system"] = 1116,
	},
	[757] = {
		{
			["yOffset"] = 301.62200927734,
			["height"] = 579.36499023438,
			["xOffset"] = 83.732597351074,
			["width"] = 869.0474319458,
			["floorName"] = "Grim Batol",
		}, -- [1]
		["firstFloor"] = 1,
		["system"] = 670,
		["yOffset"] = -600,
		["height"] = 2266.66662597656,
		["originSystem"] = 670,
		["xOffset"] = -1166.66662597656,
		["width"] = 3399.99987792969,
	},
	[443] = {
		["firstFloor"] = 0,
		["system"] = 489,
		["yOffset"] = -1627.08325195313,
		["height"] = 764.583312988281,
		["originSystem"] = 489,
		["xOffset"] = -2041.66662597656,
		["width"] = 1145.83331298828,

	},
	[953] = {
		{
			["height"] = 504.1669921875,
			["yOffset"] = -1310.4169921875,
			["xOffset"] = -1239.5830078125,
			["width"] = 758.3330078125,
		}, -- [1]
		{
			["height"] = 633.34326171875,
			["yOffset"] = -1729.17163085938,
			["xOffset"] = -1150.01000976563,
			["width"] = 950.015014648438,
		}, -- [2]
		{
			["height"] = 375,
			["yOffset"] = -1000,
			["xOffset"] = -1278.75,
			["width"] = 562.5,
		}, -- [3]
		{
			["height"] = 761.113220214844,
			["yOffset"] = -1654.5166015625,
			["xOffset"] = 4020.830078125,
			["width"] = 1141.669921875,
		}, -- [4]
		{
			["height"] = 806.25,
			["yOffset"] = -2125,
			["xOffset"] = 3789.583984375,
			["width"] = 1210.416015625,
		}, -- [5]
		{
			["height"] = 241.393188476563,
			["yOffset"] = -1932.27160644531,
			["xOffset"] = 4163.97021484375,
			["width"] = 362.08984375,
		}, -- [6]
		{
			["height"] = 400,
			["yOffset"] = -1900,
			["xOffset"] = 4237.5,
			["width"] = 600,
		}, -- [7]
		{
			["height"] = 590,
			["yOffset"] = -2165,
			["xOffset"] = 4582.5,
			["width"] = 885,
		}, -- [8]
		{
			["height"] = 806.666748046875,
			["yOffset"] = -1865.83337402344,
			["xOffset"] = 4490,
			["width"] = 1210,
		}, -- [9]
		{
			["height"] = 430.000122070313,
			["yOffset"] = -2157.080078125,
			["xOffset"] = 5230,
			["width"] = 645,
		}, -- [10]
		{
			["height"] = 590,
			["yOffset"] = -1790,
			["xOffset"] = 5082.5,
			["width"] = 885,
		}, -- [11]
		{
			["height"] = 315,
			["yOffset"] = -1275,
			["xOffset"] = 5403.75,
			["width"] = 472.5,
		}, -- [12]
		{
			["height"] = 553.337036132813,
			["yOffset"] = -1204.17004394531,
			["xOffset"] = 5179.9970703125,
			["width"] = 830.005859375,
		}, -- [13]
		{
			["height"] = 230,
			["yOffset"] = -1215,
			["xOffset"] = 5222.5,
			["width"] = 345,
		}, -- [14]
		{
			["height"] = 175,
			["yOffset"] = -1150,
			["xOffset"] = 5709.1298828125,
			["width"] = 262.5,
		}, -- [15]
		["firstFloor"] = 1,
		["originSystem"] = 1136,
		["system"] = 1136,
	},
}

MicroDungeonSize = {
	{
		nil, -- [1]
		{
			["parent"] = 41,
			["height"] = 320,
			["yOffset"] = -11035,
			["xOffset"] = -1140,
			["width"] = 480,
		}, -- [2]
		{
			["parent"] = 41,
			["height"] = 186.400390625,
			["yOffset"] = -10211.7001953125,
			["xOffset"] = -1249.80029296875,
			["width"] = 279.6005859375,
		}, -- [3]
		{
			["parent"] = 41,
			["height"] = 153.33984375,
			["yOffset"] = -9881.669921875,
			["xOffset"] = -1685.0048828125,
			["width"] = 230.009765625,
		}, -- [4]
		{
			["parent"] = 41,
			["height"] = 253.33984375,
			["yOffset"] = -9931.669921875,
			["xOffset"] = -1735.0048828125,
			["width"] = 380.009765625,
		}, -- [5]
		{
			["parent"] = 9,
			["height"] = 233.33984375,
			["yOffset"] = 2263.330078125,
			["xOffset"] = -580.005004882813,
			["width"] = 350.010009765625,
		}, -- [6]
		{
			["parent"] = 9,
			["height"] = 494,
			["yOffset"] = 1436,
			["xOffset"] = 818,
			["width"] = 741,
		}, -- [7]
		{
			["parent"] = 4,
			["height"] = 177.333340644836,
			["yOffset"] = -5.50033283233643,
			["xOffset"] = 4166.5,
			["width"] = 266,
		}, -- [8]
		{
			["parent"] = 4,
			["height"] = 248.333984375,
			["yOffset"] = 576.3330078125,
			["xOffset"] = 5366.24951171875,
			["width"] = 372.5009765625,
		}, -- [9]
		{
			["parent"] = 4,
			["height"] = 83.3339996337891,
			["yOffset"] = 203.332992553711,
			["xOffset"] = 5052.49951171875,
			["width"] = 125.0009765625,
		}, -- [10]
		{
			["parent"] = 4,
			["height"] = 83.3339996337891,
			["yOffset"] = 203.332992553711,
			["xOffset"] = 5052.49951171875,
			["width"] = 125.0009765625,
		}, -- [11]
		{
			["parent"] = 4,
			["height"] = 180,
			["yOffset"] = -1580.5,
			["xOffset"] = 4629,
			["width"] = 270,
		}, -- [12]
		{
			["parent"] = 261,
			["height"] = 168.33984375,
			["yOffset"] = 6183.330078125,
			["xOffset"] = -161.255004882813,
			["width"] = 252.509902954102,
		}, -- [13]
		{
			["parent"] = 201,
			["height"] = 255,
			["yOffset"] = 7930,
			["xOffset"] = 983.75,
			["width"] = 382.5,
		}, -- [14]
		{
			["parent"] = 161,
			["height"] = 500,
			["yOffset"] = 7640,
			["xOffset"] = 2190,
			["width"] = 750,
		}, -- [15]
		{
			["parent"] = 161,
			["height"] = 590,
			["yOffset"] = 8900,
			["xOffset"] = 3612.5,
			["width"] = 885,
		}, -- [16]
		{
			["parent"] = 161,
			["height"] = 738.33984375,
			["yOffset"] = 7955.830078125,
			["xOffset"] = 4163.7451171875,
			["width"] = 1107.509765625,
		}, -- [17]
		{
			["parent"] = 161,
			["height"] = 870.66650390625,
			["yOffset"] = 8036.66650390625,
			["xOffset"] = 3707.5,
			["width"] = 1306,
		}, -- [18]
		{
			["parent"] = 4,
			["height"] = 172,
			["yOffset"] = -971.25,
			["xOffset"] = 4622.5,
			["width"] = 258,
		}, -- [19]
		{
			["parent"] = 11,
			["height"] = 380,
			["yOffset"] = 490,
			["xOffset"] = 1902.5,
			["width"] = 570,
		}, -- [20]
		{
			["parent"] = 101,
			["height"] = 400,
			["yOffset"] = 1250,
			["xOffset"] = -3085.5,
			["width"] = 600,
		}, -- [21]
		{
			["parent"] = 101,
			["height"] = 373.3466796875,
			["yOffset"] = 1092.32666015625,
			["xOffset"] = -3165.01000976563,
			["width"] = 560.02001953125,
		}, -- [22]
	}, -- [1]
	[1062] = {
		{
			["parent"] = 910,
			["height"] = 175,
			["yOffset"] = 575,
			["xOffset"] = 731.875,
			["width"] = 262.5,
		}, -- [1]
		{
			["parent"] = 910,
			["height"] = 335.000732421875,
			["yOffset"] = 549.999633789063,
			["xOffset"] = 632.968994140625,
			["width"] = 502.5009765625,
		}, -- [2]
		{
			["parent"] = 910,
			["height"] = 141.666015625,
			["yOffset"] = 621.6669921875,
			["xOffset"] = 796.870971679688,
			["width"] = 212.4990234375,
		}, -- [3]
	},
	[730] = {
	},
	[571] = {
	},
	[648] = {
	},
	[530] = {
		{
			["parent"] = 463,
			["height"] = 200,
			["yOffset"] = -5310,
			["xOffset"] = 4780,
			["width"] = 300,
		}, -- [1]
		{
			["parent"] = 464,
			["height"] = 250,
			["yOffset"] = -5493.3330078125,
			["xOffset"] = -6231,
			["width"] = 375,
		}, -- [2]
		{
			["parent"] = 464,
			["height"] = 316.66015625,
			["yOffset"] = -7124.1630859375,
			["xOffset"] = -5352.4453125,
			["width"] = 474.990234375,
		}, -- [3]
	},
	[1064] = {
		{
			["parent"] = 928,
			["height"] = 320,
			["yOffset"] = -6686,
			["xOffset"] = -6321.5,
			["width"] = 480,
		}, -- [1]
		{
			["parent"] = 928,
			["height"] = 241.3330078125,
			["yOffset"] = -6397.33154296875,
			["xOffset"] = -5880,
			["width"] = 362,
		}, -- [2]
	},
	[870] = {
		{
			["parent"] = 811,
			["height"] = 146,
			["yOffset"] = -1770.5,
			["xOffset"] = -1043.5,
			["width"] = 219,
		}, -- [1]
		{
			["parent"] = 811,
			["height"] = 172.666748046875,
			["yOffset"] = -1808.83337402344,
			["xOffset"] = -1063.5,
			["width"] = 259,
		}, -- [2]
		{
			["parent"] = 811,
			["height"] = 173.333984375,
			["yOffset"] = -899.6669921875,
			["xOffset"] = -375.00048828125,
			["width"] = 260.0009765625,
		}, -- [3]
		{
			["parent"] = 811,
			["height"] = 210,
			["yOffset"] = -903.75,
			["xOffset"] = -402.5,
			["width"] = 315,
		}, -- [4]
		{
			["parent"] = 809,
			["height"] = 595,
			["yOffset"] = -1735,
			["xOffset"] = -478.75,
			["width"] = 892.5,
		}, -- [5]
		{
			["parent"] = 806,
			["height"] = 118.666748046875,
			["yOffset"] = -2341.00341796875,
			["xOffset"] = 1610,
			["width"] = 178,
		}, -- [6]
		{
			["parent"] = 806,
			["height"] = 275,
			["yOffset"] = -2435,
			["xOffset"] = 1468.75,
			["width"] = 412.5,
		}, -- [7]
		{
			["parent"] = 809,
			["height"] = 333.36181640625,
			["yOffset"] = -3721.68090820313,
			["xOffset"] = -1492.52001953125,
			["width"] = 500.043029785156,
		}, -- [8]
		{
			["parent"] = 809,
			["height"] = 131.68017578125,
			["yOffset"] = -2588.34008789063,
			["xOffset"] = -276.260131835938,
			["width"] = 197.52025604248,
		}, -- [9]
		{
			["parent"] = 809,
			["height"] = 130,
			["yOffset"] = -3174.5,
			["xOffset"] = -1847,
			["width"] = 195,
		}, -- [10]
		{
			["parent"] = 809,
			["height"] = 156.66650390625,
			["yOffset"] = -2653.33325195313,
			["xOffset"] = -1665,
			["width"] = 235,
		}, -- [11]
		{
			["parent"] = 809,
			["height"] = 177,
			["yOffset"] = -2649,
			["xOffset"] = -1680.25,
			["width"] = 265.5,
		}, -- [12]
		{
			["parent"] = 810,
			["height"] = 325,
			["yOffset"] = -2425,
			["xOffset"] = -5256.25,
			["width"] = 487.5,
		}, -- [13]
		{
			["parent"] = 807,
			["height"] = 251.6669921875,
			["yOffset"] = -726.6669921875,
			["xOffset"] = -1428.75024414063,
			["width"] = 377.50048828125,
		}, -- [14]
		{
			["parent"] = 806,
			["height"] = 220,
			["yOffset"] = -2220,
			["xOffset"] = 2322.5,
			["width"] = 330,
		}, -- [15]
		{
			["parent"] = 806,
			["height"] = 211.66650390625,
			["yOffset"] = -2463.33325195313,
			["xOffset"] = 2291.25,
			["width"] = 317.5,
		}, -- [16]
		{
			["parent"] = 809,
			["height"] = 310,
			["yOffset"] = -3835,
			["xOffset"] = -1945,
			["width"] = 465,
		}, -- [17]
		{
			["parent"] = 811,
			["height"] = 420,
			["yOffset"] = -1900,
			["xOffset"] = -2272.5,
			["width"] = 630,
		}, -- [18]
		{
			["parent"] = 811,
			["height"] = 240,
			["yOffset"] = -1850,
			["xOffset"] = -2115,
			["width"] = 360,
		}, -- [19]
		[22] = {
			["width"] = 412.5,
			["parent"] = 862,
			["xOffset"] = 4943.75,
			["height"] = 275,
			["yOffset"] = 187.5,
		},
	},
	[646] = {
	},
	[0] = {
		{
			["parent"] = 30,
			["height"] = 160,
			["yOffset"] = 9700,
			["xOffset"] = -281.75,
			["width"] = 240,
		}, -- [1]
		{
			["parent"] = 30,
			["height"] = 170,
			["yOffset"] = 9710,
			["xOffset"] = -289.25,
			["width"] = 255,
		}, -- [2]
		{
			["parent"] = 30,
			["height"] = 186,
			["yOffset"] = 8500,
			["xOffset"] = 27,
			["width"] = 279,
		}, -- [3]
		{
			["parent"] = 39,
			["height"] = 175,
			["yOffset"] = 10430,
			["xOffset"] = -2096.25,
			["width"] = 262.5,
		}, -- [4]
		{
			["parent"] = 39,
			["height"] = 184.666015625,
			["yOffset"] = 9798.6669921875,
			["xOffset"] = -1570.5,
			["width"] = 277,
		}, -- [5]
		{
			["parent"] = 27,
			["height"] = 220,
			["yOffset"] = 6020,
			["xOffset"] = -245,
			["width"] = 330,
		}, -- [6]
		{
			["parent"] = 27,
			["height"] = 337,
			["yOffset"] = 5313,
			["xOffset"] = -32.75,
			["width"] = 505.5,
		}, -- [7]
		{
			["parent"] = 27,
			["height"] = 130,
			["yOffset"] = 5470,
			["xOffset"] = -779,
			["width"] = 195,
		}, -- [8]
		{
			["parent"] = 27,
			["height"] = 177.66015625,
			["yOffset"] = 6445.669921875,
			["xOffset"] = -508.2451171875,
			["width"] = 266.490234375,
		}, -- [9]
		{
			["parent"] = 27,
			["height"] = 380,
			["yOffset"] = 4862.5,
			["xOffset"] = -1070,
			["width"] = 570,
		}, -- [10]
		{
			["parent"] = 27,
			["height"] = 249.33984375,
			["yOffset"] = 5486.830078125,
			["xOffset"] = 1542.9951171875,
			["width"] = 374.009765625,
		}, -- [11]
		{
			["parent"] = 20,
			["height"] = 146.666748046875,
			["yOffset"] = -2123.33349609375,
			["xOffset"] = -2020,
			["width"] = 220,
		}, -- [12]
		{
			["parent"] = 20,
			["height"] = 136.66015625,
			["yOffset"] = -2948.830078125,
			["xOffset"] = 660.0048828125,
			["width"] = 204.990234375,
		}, -- [13]
		{
			["parent"] = 29,
			["height"] = 475,
			["yOffset"] = 7325,
			["xOffset"] = 761.25,
			["width"] = 712.5,
		}, -- [14]
		{
			["parent"] = 29,
			["height"] = 170,
			["yOffset"] = 7480,
			["xOffset"] = 1145,
			["width"] = 255,
		}, -- [15]
		{
			["parent"] = 28,
			["height"] = 506.6826171875,
			["yOffset"] = 7086.65869140625,
			["xOffset"] = 627.486022949219,
			["width"] = 760.023986816406,
		}, -- [16]
		{
			["parent"] = 39,
			["height"] = 300,
			["yOffset"] = 11055,
			["xOffset"] = -1792.5,
			["width"] = 450,
		}, -- [17]
		{
			["parent"] = 17,
			["height"] = 375,
			["yOffset"] = 5955,
			["xOffset"] = 2748.75,
			["width"] = 562.5,
		}, -- [18]
		{
			["parent"] = 30,
			["height"] = 215.5,
			["yOffset"] = 8985,
			["xOffset"] = 445.875,
			["width"] = 323.25,
		}, -- [19]
	},
	[1116] = {
	},
}
-- MDS = MicroDungeonSize
-- WMS = WorldMapSize
-- AA = AlternateAreas

--------------------------------------------------------------------------------------------------------------
-- Internal Data Table Setup
--------------------------------------------------------------------------------------------------------------

-- Map Data API Flag Fields --

-- GetAreaMapInfo - flags
local WORLDMAPAREA_DEFAULT_DUNGEON_FLOOR_IS_TERRAIN = 0x00000004
local WORLDMAPAREA_VIRTUAL_CONTINENT = 0x00000008

-- GetDungeonMapInfo - flags
local DUNGEONMAP_MICRO_DUNGEON = 0x00000001


-- Zero Data Table
-- Used to prevent runtime Lua errors due to missing data

local function zeroDataFunc(tbl, key)
	if ( type(key) == "number" ) then
		return zeroData;
	else
		return rawget(zeroData, key);
	end
end

zeroData = { xOffset = 0, height = 1, yOffset = 0, width = 1, __index = zeroDataFunc };
setmetatable(zeroData, zeroData);

-- get data on useful transforms
local TRANSFORMS = {}
for _, ID in ipairs(GetWorldMapTransforms()) do
	local terrainMapID, newTerrainMapID, _, _, transformMinY, transformMaxY, transformMinX, transformMaxX, offsetY, offsetX = GetWorldMapTransformInfo(ID)
	if ( offsetX ~= 0 or offsetY ~= 0 ) then
		TRANSFORMS[ID] = {
			terrainMapID = terrainMapID,
			newTerrainMapID = newTerrainMapID,
			BRy = -transformMinY,
			TLy = -transformMaxY,
			BRx = -transformMinX,
			TLx = -transformMaxX,
			offsetY = offsetY,
			offsetX = offsetX,
		}
	end
end

--remove this temporarily
local harvestedDataVersion = Astrolabe.HarvestedMapData.VERSION
Astrolabe.HarvestedMapData.VERSION = nil

for mapID, harvestedData in pairs(Astrolabe.HarvestedMapData) do
	local terrainMapID, _, _, _, _, _, _, _, _, flags = GetAreaMapInfo(mapID)
	local originSystem = terrainMapID;
	local mapData = WorldMapSize[mapID];
	if not ( mapData ) then mapData = {}; end
	mapData.firstFloor = harvestedData.firstFloor
	if ( harvestedData.numFloors > 0 or harvestedData.hiddenFloor ) then
		for f, harvData in pairs(harvestedData) do
			if ( type(f) == "number" and f > 0 ) then
				if not ( mapData[f] ) then
					mapData[f] = {};
				end
				local floorData = mapData[f]
				local TLx, TLy, BRx, BRy = -harvData.BRx, -harvData.BRy, -harvData.TLx, -harvData.TLy
				if not ( TLx < BRx ) then
						printError("Bad x-axis Orientation (Floor): ", mapID, f, TLx, BRx);
					end
					if not ( TLy < BRy) then
						printError("Bad y-axis Orientation (Floor): ", mapID, f, TLy, BRy);
					end
				if not ( floorData.width ) then
					floorData.width = BRx - TLx
				end
				if not ( floorData.height ) then
					floorData.height = BRy - TLy
				end
				if not ( floorData.xOffset ) then
					floorData.xOffset = TLx
				end
				if not ( floorData.yOffset ) then
					floorData.yOffset = TLy
				end
			end
		end
		for f = 1, harvestedData.numFloors do
			if not ( mapData[f] ) then
				if ( f == 1 and harvestedData[0] and harvestedData[0].TLx and harvestedData[0].TLy and harvestedData[0].BRx and harvestedData[0].BRy and
				  band(flags, WORLDMAPAREA_DEFAULT_DUNGEON_FLOOR_IS_TERRAIN) == WORLDMAPAREA_DEFAULT_DUNGEON_FLOOR_IS_TERRAIN ) then
					-- handle dungeon maps which use zone level data for the first floor
					mapData[f] = {};
					local floorData = mapData[f]
					local harvData = harvestedData[0]
					local TLx, TLy, BRx, BRy = -harvData.TLx, -harvData.TLy, -harvData.BRx, -harvData.BRy
					if not ( TLx < BRx ) then
						printError("Bad x-axis Orientation (Floor from Zone): ", mapID, f, TLx, BRx);
					end
					if not ( TLy < BRy) then
						printError("Bad y-axis Orientation (Floor from Zone): ", mapID, f, TLy, BRy);
					end
					floorData.width = BRx - TLx
					floorData.height = BRy - TLy
					floorData.xOffset = TLx
					floorData.yOffset = TLy
				else
					printError(("Astrolabe is missing data for %s [%d], floor %d."):format(harvestedData.mapName, mapID, f));
				end
			end
		end
		if ( harvestedData.hiddenFloor ) then
			mapData.width = mapData[1].width
			mapData.height = mapData[1].height
			mapData.xOffset = mapData[1].xOffset
			mapData.yOffset = mapData[1].yOffset
		end
	
	else
		local harvData = harvestedData[0]
		if ( harvData ~= nil ) then
			local TLx, TLy, BRx, BRy = -harvData.TLx, -harvData.TLy, -harvData.BRx, -harvData.BRy
			-- apply any necessary transforms
			for transformID, transformData in pairs(TRANSFORMS) do
				if ( transformData.terrainMapID == terrainMapID ) then
					if ( (transformData.TLx < TLx and BRx < transformData.BRx) and (transformData.TLy < TLy and BRy < transformData.BRy) ) then
						TLx = TLx - transformData.offsetX;
						BRx = BRx - transformData.offsetX;
						BRy = BRy - transformData.offsetY;
						TLy = TLy - transformData.offsetY;
						terrainMapID = transformData.newTerrainMapID;
						break;
					end
				end
			end
			if not ( TLx==0 and TLy==0 and BRx==0 and BRy==0 ) then
				if not ( TLx < BRx ) then
					printError("Bad x-axis Orientation (Zone): ", mapID, TLx, BRx);
				end
				if not ( TLy < BRy) then
					printError("Bad y-axis Orientation (Zone): ", mapID, TLy, BRy);
				end
			end
			if not ( mapData.width ) then
				mapData.width = BRx - TLx
			end
			if not ( mapData.height ) then
				mapData.height = BRy - TLy
			end
			if not ( mapData.xOffset ) then
				mapData.xOffset = TLx
			end
			if not ( mapData.yOffset ) then
				mapData.yOffset = TLy
			end
		else
			if ( mapID == 751 ) then -- okay, this is Maelstrom continent
			else
				printError("Astrolabe harvested a map with no data at all: ", mapID)
			end
		end
	
	end
	
	-- if we don't have any data, we're gonna use zeroData, but we also need to 
	-- setup the system and systemParent IDs so things don't get confused
	if not ( next(mapData, nil) ) then
		mapData = { xOffset = 0, height = 1, yOffset = 0, width = 1 };
		-- if this is an outside continent level or world map then throw up an extra warning
		if ( harvestedData.cont > 0 and harvestedData.zone == 0 and not (band(flags, WORLDMAPAREA_VIRTUAL_CONTINENT) == WORLDMAPAREA_VIRTUAL_CONTINENT) ) then


			printError(("Astrolabe is missing data for world map %s [%d] (%d, %d)."):format(harvestedData.mapName, mapID, harvestedData.cont, harvestedData.zone));
		end
	end
	
	if not ( mapData.originSystem ) then
		mapData.originSystem = originSystem;
	end
	
	-- store the data in the WorldMapSize DB
	WorldMapSize[mapID] = mapData;
	
	
	if ( mapData and mapData ~= zeroData ) then
		-- setup system IDs
		if not ( mapData.system ) then
			mapData.system = terrainMapID;
		end
		
		-- determine terrainMapID for micro-dungeons
		if ( harvestedData.cont > 0 and harvestedData.zone > 0 and not MicroDungeonSize[terrainMapID] ) then
			MicroDungeonSize[terrainMapID] = {}
		end
		
		setmetatable(mapData, zeroData);
	end
end

-- put the version back
Astrolabe.HarvestedMapData.VERSION = harvestedDataVersion

-- function DebugPrintAstrolabeDungeonMaps()
	-- for _, ID in ipairs(GetDungeonMaps()) do
		-- local floorIndex, minX, maxX, minY, maxY, terrainMapID, parentWorldMapID, flags = GetDungeonMapInfo(ID)
		-- print("ID", ID, "parentWorldMapID", parentWorldMapID, "terrainMapID", terrainMapID, "floorIndex", floorIndex, "flags", flags)
	-- end
-- end

-- function DebugGetDungeonMapTable(id)
	-- local floorIndex, minX, maxX, minY, maxY, terrainMapID, parentWorldMapID, flags = GetDungeonMapInfo(id)
	-- local TLx, TLy, BRx, BRy = -maxX, -maxY, -minX, -minY
	-- return terrainMapID, floorIndex, {
			-- width = BRx - TLx,
			-- height = BRy - TLy,
			-- xOffset = TLx,
			-- yOffset = TLy,
			-- parent = parentWorldMapID
		-- }
-- end

-- micro dungeons
for _, ID in ipairs(GetDungeonMaps()) do
	local floorIndex, minX, maxX, minY, maxY, terrainMapID, parentWorldMapID, flags = GetDungeonMapInfo(ID);
	if ( band(flags, DUNGEONMAP_MICRO_DUNGEON) == DUNGEONMAP_MICRO_DUNGEON or parentWorldMapID==928) then --DG TODO:Revisit after Isle of Thunder goes live.  Required because flags==0 for microdungeon system (1064).
		local TLx, TLy, BRx, BRy = -maxX, -maxY, -minX, -minY
		-- apply any necessary transforms
		local transformApplied = false
		for transformID, transformData in pairs(TRANSFORMS) do
			if ( transformData.terrainMapID == terrainMapID ) then
				if ( (transformData.TLx < TLx and BRx < transformData.BRx) and (transformData.TLy < TLy and BRy < transformData.BRy) ) then
					TLx = TLx - transformData.offsetX;
					BRx = BRx - transformData.offsetX;
					BRy = BRy - transformData.offsetY;
					TLy = TLy - transformData.offsetY;
					transformApplied = true;
					break;
				end
			end
		end
		if ( MicroDungeonSize[terrainMapID] ) then
			-- only consider systems that can have micro dungeons
			if ( MicroDungeonSize[terrainMapID][floorIndex] ) then
				printError("Astrolabe detected a duplicate microdungeon floor!", terrainMapID, ID);
			end
			MicroDungeonSize[terrainMapID][floorIndex] = {
				width = BRx - TLx,
				height = BRy - TLy,
				xOffset = TLx,
				yOffset = TLy,
			parent = parentWorldMapID
			};
		end
	end
end

-- done with Transforms data
TRANSFORMS = nil

for _, data in pairs(MicroDungeonSize) do
	setmetatable(data, zeroData);
end
setmetatable(MicroDungeonSize, zeroData);

-- make sure we don't have any EXTRA data hanging around
for mapID, mapData in pairs(WorldMapSize) do
	if ( mapID ~= 0 and getmetatable(mapData) ~= zeroData ) then
		printError("Astrolabe has hard coded data for an invalid map ID", mapID);
	end
end

setmetatable(WorldMapSize, zeroData); -- setup the metatable so that invalid map IDs don't cause Lua errors

-- register this library with AstrolabeMapMonitor, this will cause a full update if PLAYER_LOGIN has already fired
local AstrolabeMapMonitor = DongleStub("AstrolabeMapMonitor");
AstrolabeMapMonitor:RegisterAstrolabeLibrary(Astrolabe, LIBRARY_VERSION_MAJOR);