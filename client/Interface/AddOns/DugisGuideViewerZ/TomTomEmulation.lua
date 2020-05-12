local DGV = DugisGuideViewer
local TomTomEmulation = DGV:RegisterModule("TomTomEmulation")

TomTomEmulation.essential = true

TomTomEmulation.frame = CreateFrame("FRAME", "DugisGuideViewerZ_TomTomEventsFrame");
TomTomEmulation.frame:RegisterEvent("VARIABLES_LOADED");
TomTomEmulation.lmd = LibStub("LibMapData-1.0-Dugi")

TomTomEmulation.nameToMapId = {}

TomTomEmulation.MapExists = function(mapName)
    return TomTomEmulation.nameToMapId[mapName] ~= nil
end

local wrongseparator = "(%d)" .. (tonumber("1.1") and "," or ".") .. "(%d)"
local rightseparator =   "%1" .. (tonumber("1.1") and "." or ",") .. "%2"

TomTomEmulation.Split = function(inputstr, sep)
    if sep == nil then
            sep = "%s"
    end
    t={} ; i=1
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
            t[i] = str
            i = i + 1
    end
    return t
end


local function AddWaypoint(self, x, y, desc, persistent, minimap, world, silent)
    
    if DGV:UserSetting(DGV_TOMTOMEMULATION) ~= true then
        return
    end
    
    local c,z = GetCurrentMapContinent(), GetCurrentMapZone()

    if not c or not z or c < 1 then
        return {0, 0, x/100, y/100, title = desc}
    end

    return self:AddZWaypoint(c, z, x, y, desc, persistent, minimap, world, nil, silent)
    
end


local function AddZWaypoint(self, c, z, x, y, desc, persistent, minimap, world, callbacks, silent, crazy)

    if DGV:UserSetting(DGV_TOMTOMEMULATION) ~= true then
        return
    end
    
    local mapId, floor = DGV.astrolabe:GetMapID(c, z)
    
    if not mapId then
        return {0, 0, x/100, y/100, title = desc}
    end    

    return self:AddMFWaypoint(mapId, floor, x/100, y/100, {
        title = desc,
        persistent = persistent,
        minimap = minimap,
        world = world,
        callbacks = callbacks,
        silent = silent,
        crazy = crazy,
    })
end


local function SetCustomWaypoint(self, c, z, x, y, callback, minimap, world, silent)
    
    if DGV:UserSetting(DGV_TOMTOMEMULATION) ~= true then
        return
    end
    
    return self:AddZWaypoint(c, z, x, y, nil, false, minimap, world, callback, silent)
    
end


local function SetCustomMFWaypoint(self, m, f, x, y, opts)
    
    if DGV:UserSetting(DGV_TOMTOMEMULATION) ~= true then
        return
    end
    
    opts = opts or {}
    opts.persistent = false

    return self:AddMFWaypoint(m, f, x, y, opts)
    
end


local function WaypointExists(x, y, m, f, desc)

    if DGV:UserSetting(DGV_TOMTOMEMULATION) ~= true then
        return
    end
    
    if DugisArrowGlobal.waypoints ~= nil then
    
        for _, waypoint in pairs(DugisArrowGlobal.waypoints) do
     
            if waypoint.x/100 == tonumber(x) and  waypoint.y/100 == tonumber(y) and waypoint.map == tonumber(m) and waypoint.floor == tonumber(f) and waypoint.desc == desc then
                return true
            end
           
        end
    end
    
    return false
end

local function SetCrazyArrow(waypoint)

    if waypoint ~= nil then
        DugisArrowGlobal:setArrow( waypoint.map, waypoint.floor, waypoint.x, waypoint.y, waypoint.desc, waypoint )
    end

end

local function AddMFWaypoint(self, m, f, x, y, opts)
       
    if DGV:UserSetting(DGV_TOMTOMEMULATION) ~= true then
        return
    end

    opts = opts or {}

    opts.title = opts.title or "TomTom Waypoint"

    local exists = WaypointExists(x, y, m, f, opts.title) 

    if not exists then

        local zoneName = GetMapNameByID(m)
        local mapId = DugisGuideViewer:GetZoneIdByName(zoneName)

        local waypoint = DGV:AddRouteWaypointWithNoTrigger(mapId, f or 0, x, y, opts.title)
        SetCrazyArrow(DugisArrowGlobal:getFirstWaypoint())

    end
    
    --TomTom addon returns this structure from the AddMFWaypoint function. Fix for: "#119 Make tomtom emulation work with WoW-Pro addon"
    local uid = {m, f, x, y, title = opts.title}

    return uid
end


local function RemoveWaypoint(waypoint)

    if DGV:UserSetting(DGV_TOMTOMEMULATION) ~= true or DugisArrowGlobal.waypoints == nil then
        return
    end
    
    DugisArrowGlobal:RemoveWaypoint(waypoint)	
    
end


local function GetClosestWaypoint()

    local closestWaypoint = DugisArrowGlobal:getFirstWaypoint()
    
    if closestWaypoint ~= nil then
    
        local closestDistance = DGV:GetDistanceFromPlayer(closestWaypoint.map, closestWaypoint.floor, closestWaypoint.x, closestWaypoint.y)
        
        for _, waypoint in pairs(DugisArrowGlobal.waypoints) do
            local dist = DGV:GetDistanceFromPlayer(waypoint.map, waypoint.floor, waypoint.x, waypoint.y)
            
            if dist < closestDistance  then
                closestWaypoint = waypoint
                closestDistance = dist
            end
           
        end
        
        return closestWaypoint
    end

end

local function CWay()

    if not DGV:GuideOn() then
        return 
    end
    
    local waypoint = GetClosestWaypoint()
    SetCrazyArrow(waypoint)
    
end


local function ShowMessage(message)

    (SELECTED_CHAT_FRAME or DEFAULT_CHAT_FRAME):AddMessage(message)
    
end

local function usage()
    ShowMessage("|cffffd200Dugi|r |cff11ff11TomTom Emulation|r /way |cff11ff11Usage:|r")
    ShowMessage("|cff11ff11/way <x> <y> [desc]|r - Adds a waypoint at x,y with descrtiption desc")
    ShowMessage("|cff11ff11/way <zone> <x> <y> [desc]|r - Adds a waypoint at x,y in zone with description desc")
    ShowMessage("|cff11ff11/way reset all|r - Resets all waypoints")
    ShowMessage("|cff11ff11/way reset <zone>|r - Resets all waypoints in zone")
    ShowMessage("|cff11ff11/way list|r - Lists active waypoints in current zone")
end

local function HandlerWay(msg, editbox)
	msg = msg:gsub("(%d)[%.,] (%d)", "%1 %2"):gsub(wrongseparator, rightseparator)

    if not DGV:GuideOn() then
        return 
    end
    
    local map, fl, xCurr, yCurr = DGV:GetPlayerPosition()
  
    local args = TomTomEmulation.Split(msg, " ")

    
    if tonumber(args[1]) ~= nil then
    
        local x = tonumber(args[1])
        local y = tonumber(args[2])

        if args[3] == nil then
            --/way 14.78 23.9
            if x ~= nil and y ~= nil then
                local waypoint = DGV:AddRouteWaypointWithNoTrigger(map, fl or 0, x/100, y/100, "TomTom Waypoint")
                SetCrazyArrow(DugisArrowGlobal:getFirstWaypoint())
            else
                usage()
            end
        else
            --/way 14.78 23.90 This is a waypoint!
            x = tonumber(table.remove(args, 1))
            y = tonumber(table.remove(args, 1))

            if x ~= nil and y ~= nil then
                local description = table.concat(args, " ")
                local waypoint = DGV:AddRouteWaypointWithNoTrigger(map, fl or 0, x/100, y/100, description)
                SetCrazyArrow(DugisArrowGlobal:getFirstWaypoint())
            else   
                usage()
            end
        end
    else
        if args[1] ~= nil then
            if args[1] == "reset" then
            
                if args[2] == "all" then
                    --/way reset all //  	Remove ALL current waypoints 
                    DGV:RemoveAllWaypoints()
                else
                    --/way reset Nagrand
                    table.remove(args, 1)
                    local zoneName = table.concat(args, " ")
                   
                    if TomTomEmulation.MapExists(zoneName) then
                        DGV:RemoveAllWaypointsFromZone(zoneName)
                        CWay()
                    else
                        ShowMessage("Map "..zoneName.." doesn't exist")
                    end
              
                end
            else
            
                if args[1] == "list" then
                    for _, waypoint in pairs(DugisArrowGlobal.waypoints) do
                        local name = DGV:GetMapNameFromID(waypoint.map)
                        local desc =  waypoint.desc
                        local x =  waypoint.x
                        local y =  waypoint.y
                        print("Waypoint:",x,",",y," ",desc, ", Map:", name)
                    end  
                else
                    local zoneEnd = nil
                    for idx = 1, #args do
                        local arg = args[idx]
                        if tonumber(arg) then
                            -- We've encountered a number, so the zone name must have
                            -- ended at the prior arg
                            zoneEnd = idx - 1
                        break
                        end
                    end
                    
                    
                    if zoneEnd then
						fl = 0 -- default map floor
                        local mapAndDescription = (args[zoneEnd + 3] ~= nil)

                        --/way Shadowmoon Valley:Outland 50 60  Some description
                        if mapAndDescription then
                            local zoneName = table.concat(args, " ", 1, zoneEnd)
                            for idx = 1, zoneEnd do
                                table.remove(args, 1)
                            end
                            local x = tonumber(table.remove(args, 1))
                            local y = tonumber(table.remove(args, 1))
                            
                            local desc = table.concat(args, " ")

                            local zone_continent = TomTomEmulation.Split(zoneName, ":")
                              
                            if x ~= nil and y ~= nil and desc ~= nil and zoneName ~= nil and zone_continent[1] ~= nil then
                                if TomTomEmulation.MapExists(zone_continent[1]) then
                                    local waypoint = DGV:AddCustomRouteWaypoint(x/100, y/100, desc, zoneName, fl or 0)
                                    SetCrazyArrow(DugisArrowGlobal:getFirstWaypoint())
                                else
                                    ShowMessage("Map "..zoneName.." doesn't exist")
                                end    
                            else
                                usage()
                            end
                        else
                            --/way Shadowmoon Valley:Outland 50 60
                            local y = tonumber(table.remove(args, table.getn(args)))
                            local x = tonumber(table.remove(args, table.getn(args)))
                            
                            local zoneName = table.concat(args, " ")
                            
                            local zone_continent = TomTomEmulation.Split(zoneName, ":")
                            
                            --DGV:AddCustomRouteWaypoint(x/100, y/100, zoneName, fl)
                            if x ~= nil and y ~= nil and zoneName ~= nil and zone_continent[1] ~= nil then
                                if TomTomEmulation.MapExists(zone_continent[1]) then   
                                    local waypoint = DGV:AddCustomRouteWaypoint(x/100, y/100, "TomTom waypoint", zoneName, fl or 0)
                                    SetCrazyArrow(DugisArrowGlobal:getFirstWaypoint())                                    
                                else
                                    ShowMessage("Map "..zoneName.." doesn't exist")
                                end   
                            else
                                usage()
                            end
                        end
                    else
                        usage()
                    end
                end
            end
        else
            usage()
        end
    end

end


local function HandlerWayB(msg, editbox)

    if not DGV:GuideOn() then
        return 
    end
    
    local map, fl, xCurr, yCurr = DGV:GetPlayerPosition()
    local waypoint = DGV:AddRouteWaypointWithNoTrigger(map, fl or 0, xCurr, yCurr, "TomTom Waypoint")
    SetCrazyArrow(DugisArrowGlobal:getFirstWaypoint())
           
end


local function HandlerCway(msg, editbox)

    if not DGV:GuideOn() then
        return 
    end

    CWay()
           
end


local function StartTomTomEmulation()

    if not TomTom and DugisGuideViewer.chardb.GuideOn == true and DGV:UserSetting(DGV_TOMTOMEMULATION) == true then
        --TomTom functions emulation:
		local tom = {}
		TomTom = tom
		tom["version"] = "v40200"
		tom["AddWaypoint"] = AddWaypoint
		tom["AddZWaypoint"] = AddZWaypoint
		tom["SetCustomWaypoint"] = SetCustomWaypoint
		tom["SetCustomMFWaypoint"] = SetCustomMFWaypoint
		tom["AddMFWaypoint"] = AddMFWaypoint
		tom["RemoveWaypoint"] = RemoveWaypoint
		tom["SetCrazyArrow"] = SetCrazyArrow
        
        tom["DugisGuide-emulation"] = true
       
        --TomTom commands emulation:
        SLASH_WAY1 = '/way';
        SLASH_TWAY1 = "/tway"
        SLASH_TOMTOM_WAY1 = "/tomtomway"
        
        SLASH_WAYB1 = '/wayb';
        SLASH_WAYBACK1 = '/wayback';
        SLASH_CWAY1 = '/cway';
        SLASH_CLOSESTWAY1 = '/closestway';


        SlashCmdList["WAY"] = HandlerWay; 
        SlashCmdList["TWAY"] = HandlerWay; 
        SlashCmdList["TOMTOM_WAY"] = HandlerWay; 
        SlashCmdList["WAYB"] = HandlerWayB; 
        SlashCmdList["WAYBACK"] = HandlerWayB; 
        SlashCmdList["CWAY"] = HandlerCway; 
        SlashCmdList["CLOSESTWAY"] = HandlerCway; 
        
        TomTom.db = {profile = {arrow = {}, persistence = {cleardistance = 10}}}
    end

end

local function UnregisterChatCommand(shortId, commandNoBackSlash)

    SlashCmdList[commandNoBackSlash] = nil
    _G["SLASH_" .. shortId .. "1"] = nil
    hash_SlashCmdList["/" .. commandNoBackSlash:upper()] = nil
    
end
    
local function StopTomTomEmulation()

    if TomTom and TomTom["DugisGuide-emulation"] then 
    
        TomTom = nil;
        
        UnregisterChatCommand("WAY", "way")
        UnregisterChatCommand("TWAY", "tway")
        UnregisterChatCommand("TOMTOM_WAY", "tomtomway")
        UnregisterChatCommand("WAYB", "wayb")
        UnregisterChatCommand("WAYBACK", "wayback")
        UnregisterChatCommand("CWAY", "cway")
        UnregisterChatCommand("CLOSESTWAY", "closestway") 
        
    end

end


function TomTomEmulation:Initialize()

    TomTomEmulation.mapIds = TomTomEmulation.lmd:GetAllMapIDs()
    
    for idx, mapId in ipairs(TomTomEmulation.mapIds) do
        local mapName = GetMapNameByID(mapId)
        TomTomEmulation.nameToMapId[mapName] = mapId
    end

    function TomTomEmulation:Load()

        if DGV:UserSetting(DGV_TOMTOMEMULATION) then
            StartTomTomEmulation()
        else
            StopTomTomEmulation() 
        end
        
    end
    
    function TomTomEmulation:Unload()

    end      
        
end

local function EventHandler(self, event, ...)

       StartTomTomEmulation()
       
end

TomTomEmulation.frame:SetScript("OnEvent", EventHandler);