local DGV = DugisGuideViewer
if not DGV then return end
local L = DugisLocals

local Taxi = DGV:RegisterModule("Taxi")
Taxi.essential = true
local _

local B = LibStub("LibBabble-SubZone-3.0")
local BR = B:GetReverseLookupTable()
local BF = LibStub("LibBabble-Faction-3.0")
local BFR = BF:GetReverseLookupTable()
local GetSpellBookItemInfo, GetSpellInfo, IsUsableSpell, GetSpellCooldown, GetItemCount = 
	GetSpellBookItemInfo, GetSpellInfo, IsUsableSpell, GetSpellCooldown, GetItemCount
local select = select
local QueueInvocation, strformat, RegisterReaction, RegisterFunctionReaction, RegisterMemberFunctionReaction, RegisterStopwatchReaction, TryGetCacheReaction, ListContains, PackStrings = 
		DGV.QueueInvocation, string.format, DGV.RegisterReaction, DGV.RegisterFunctionReaction, DGV.RegisterMemberFunctionReaction, DGV.RegisterStopwatchReaction, DGV.TryGetCacheReaction, DGV.ListContains, DGV.PackStrings
local InitTable, BeginAutoroutine, InterruptAutoroutine, YieldAutoroutine, tPool, DoOutOfCombat, GetRunningAutoroutine = 
	DGV.InitTable, DGV.BeginAutoroutine, DGV.InterruptAutoroutine, DGV.YieldAutoroutine, DGV.tPool, DGV.DoOutOfCombat, DGV.GetRunningAutoroutine

function Taxi:Initialize()
	local pm, pf, px, py
	local TaxiData = DGV.Modules.TaxiData
	
	local RouteBuilders = {
		Character = {"Character"},
		BoundTeleport = {"BoundTeleport"},
		UnboundTeleport = {"UnboundTeleport"},
		ZenPilgrimageReturn = {"ZenPilgrimageReturn"},
		StaticPortals = {"StaticPortals"},
		Boats = {"Boats"},
		FlightMaster = {"FlightMaster"},
		FlightHop = {"FlightHop"},
		LocalPortals = {"LocalPortals"},
		InstancePortals = {"InstancePortals"},
		InstanceExit = {"InstanceExit"}
	}
	Taxi.RouteBuilders = RouteBuilders
	
	local function GetCreateTable(...)
		return DGV.GetCreateTable(...):BindToAutoroutineLifetime(tPool)
	end
	local function PoolRoute(route)
		for _, subRoute in ipairs(route) do
			if type(subRoute)=="table" and subRoute.parentRoute==route then
				PoolRoute(subRoute)
			end
		end
		tPool(route:TryReleaseLifetime(PoolRoute))
	end
	
	local function GetCreateRoute(builder, currentBest, parentRoute)
		local route = DGV.GetCreateTable()
		route.parentRoute = parentRoute
		route.currentBest = currentBest
		route.builder = builder
		return route:BindToAutoroutineLifetime(PoolRoute)
	end
	
	local function IsBestEstimate(route, otherRoute, ...)
		local est = route.builder:Estimate(route)
		for i=1,select("#", ...) do
			local routeArg = select(i,...)
			est = est + routeArg.builder:Estimate(routeArg)
		end
		return otherRoute.builder:Estimate(otherRoute)
				> est --and est<upperBound
	end

	--local upperBound = 2000
	local function IsBest(route, ...)
		local isBest = false
		if not route.currentBest or route.currentBest==route then 
			isBest = true
		elseif route.builder.IsBest then
			isBest = route.builder:IsBest(route)
		else
			isBest = IsBestEstimate(route, route.currentBest, ...)
		end
		return isBest and 
			(not route.parentRoute or 
				IsBest(route.parentRoute, route, ...))
	end
	
	--[[local function CrossProduct(x1, y1, x2, y2)
		return x1*y2 - x2*y1
	end
	
	local function VectorAdd(x1, y1, x2, y2)
		return x1 + x2, y1 + y2
	end
	
	local function VectorSubtract(x1, y1, x2, y2)
		return VectorAdd(x1, y1, x2*-1, y2*-1)
	end
	
	local epsilon = 10e-6
	local function CheckIntersection(x1, y1, x2, y2, x3, y3, x4, y4)
		local px,py = x1, y1
		local rx,ry = VectorSubtract(x2, y2, x1, y1)
		local qx,qy = x3,y3
		local sx,sy = VectorSubtract(x4, y4, x3, y3)
		local rsCross = CrossProduct(rx, ry, sx, sy)
		if rsCross <= epsilon and rsCross >= -1 * epsilon then --parallel
			return false
		end
		
		local qMinPx,qMinPy = VectorSubtract(qx, qy, px, py)
		local t = CrossProduct(qMinPx,qMinPy,sx,sy)/rsCross
		local u = CrossProduct(qMinPx,qMinPy,rx,ry)/rsCross
		if u>0 and u<=1 and t>0 and t<=1 then
			return true
		else
			return false
		end
	end]]
	
	local function GetAngle(x1, y1, x2, y2, x3, y3)
		local ax = x1 - x2
		local ay = y1 - y2
		
		local bx = x3 - x2
		local by = y3 - y2
		
		local aLen = math.sqrt(ax^2 + ay^2)
		local bLen = math.sqrt(bx^2 + by^2)
		
		local dotProduct = ax * bx + ay * by
		return math.acos(dotProduct / (aLen * bLen))
	end
	
	local function CoordsToAngle(m1, f1, x1, y1, mData, fData, selectedX, selectedY, m2, f2, x2, y2)
		local xTrans,yTrans = DGV:TranslateWorldMapPosition(
				mData, fData, selectedX, selectedY, m1, f1)
		xTrans,yTrans = DGV.Modules.Ants:ClampLine(xTrans,yTrans,x1,y1)
		
		local xDest,yDest = DGV:TranslateWorldMapPosition(
			m2, f2, x2, y2, m1, f1)
		xDest,yDest = DGV.Modules.Ants:ClampLine(xDest,yDest,x1,y1)
		
		return GetAngle(xTrans, yTrans, x1, y1, xDest, yDest)
	end
	
	local function GetSmallestAngle(m1, f1, x1, y1, mData, fData, pointData, m2, f2, x2, y2)
		local shortestX, shortestY, shortestDist, shortestData
		if type(pointData)=="number" then
			local selectedX,selectedY = DGV:UnpackXY(pointData)
			return selectedX, selectedY, CoordsToAngle(m1, f1, x1, y1, mData, fData, selectedX, selectedY, m2, f2, x2, y2)
		end
		local data = GetCreateTable(strsplit("|", pointData))
		for i=1,#(data) do
			local firstCoords = strmatch(data[i], "([^%-]*)%-?")
			local selectedX,selectedY = DGV:UnpackXY(firstCoords)
			local angle = CoordsToAngle(m1, f1, x1, y1, mData, fData, selectedX, selectedY, m2, f2, x2, y2)
			if angle and (not shortestDist or angle < shortestDist) then
				shortestX,shortestY,shortestData = selectedX,selectedY,data[i]
				shortestDist = angle
			end
		end
		tPool(data)
		return shortestX,shortestY,shortestDist,shortestData
	end
	
	local function CheckRequirements(requirementsStart, ...)
		local pass = true
		for i=requirementsStart,select("#", ...),2 do
			local reqType, req = select(i, ...)
			if reqType=="lvl" then
				pass = pass and UnitLevel("player")>=tonumber(req)
			elseif reqType=="qid" then
				local qids = GetCreateTable(strsplit(",", req))
				for _,v in ipairs(qids) do
					pass = pass and IsQuestFlaggedCompleted(tonumber(v))
				end
				tPool(qids)
			elseif reqType=="nqid" then
				if IsQuestFlaggedCompleted(tonumber(req)) then return end
			elseif reqType=="fac" then
				pass = pass and UnitFactionGroup("player")==req
			elseif reqType=="rep" then
				local standing,fac = strmatch(req, "^(%d+)%.(.*)$", 1)
				pass = false

				for j=1,GetNumFactions() do
					local name, _, standingId = GetFactionInfo(j)
					if name and standingId and 
						name==BFR[fac] and standingId>=tonumber(standing)
					then
						pass = true
						break
					end
				end
			elseif reqType=="cls" then
				pass = pass and select(2, UnitClass("player"))==req
			elseif reqType=="map" then
				pass = pass and pm==tonumber(req)
			end
		end
		if pass then return ... end
	end
	
	function DGV:CheckRequirements(...)
		if select("#", ...)==0 then return true end
		return CheckRequirements(1, ...)
	end
	
	local function QuickPathExists(contData, m1, m2, ...)
		if m1==m2 then return true end
		if not contData then return end
		if not contData[m1] then return end
		local requirements = contData[m2] and contData[m2].requirements
		if requirements and not CheckRequirements(1, strsplit(":", requirements)) 
		then 
			return 
		end
		if contData[m1][m2] then return true end
		for m in pairs(contData[m1]) do
			if m~="requirements" then
				if not ListContains(m, ...) and 
					QuickPathExists(contData, m, m2, m1, ...)
				then return true end
			end
		end
	end
	
	local function CorrectMouseOverZoneFloor(m, x, y)
		local curMap = GetCurrentMapAreaID()
		if m==curMap then
			local actualZoneName = UpdateMapHighlight(x,y)
			if actualZoneName then
				m = DGV:GetZoneIdByName(actualZoneName)
				local f = 0
				if m==321 or m==504 then --orgrimmar or dalaran is the only map i know of w/0 a floor 0
					f=1
				end
				return m,f
			end
		end
	end
	
	local function HasBreadCrumb(data)
		if not data then return end
		if not strmatch(data, "-") then return
		else return true end
	end
	
	local function UnpackBreadCrumb(data)
		local steps = GetCreateTable(strsplit("-", data))
		local pointData
		for i=2,#steps do
			if not pointData then
				pointData = GetCreateTable()
			end
			local m, f, xy, cue = strsplit(":", steps[i])
			local x,y = DGV:UnpackXY(xy)
			pointData:InsertList(tonumber(m), tonumber(f), x, y, cue)
		end
		tPool(steps)
		if not pointData then return end
		return tPool(pointData)
	end
	
	local function sortFunc(a,b)
		return a[5]<b[5]
	end
	local function BacktrackCharacterPath(contData, m1, f1, x1, y1, mTrans, fTrans, m2, f2, x2, y2, ...)
		if not contData or not x1 then return end
		if not mTrans then 
			mTrans = m1 
			fTrans = f1
		end
		local transKey
		if mTrans==m2 then  --destination map reached
			if fTrans==f2 then --destination floor reached
				return m2, f2, x2, y2
			end
			transKey = (fTrans==0 and mTrans) or mTrans..":"..fTrans
			if not contData[transKey] then --no entry for source floor
				if not contData[mTrans] then return end --no entry for source map
				return m2, f2, x2, y2 --legacy data support
			end
			local destTransKey = (f2==0 and mTrans) or mTrans..":"..f2
			if not contData[destTransKey] then --no entry for destination floor.  This is likely because we have no trans for it or it doesn not exist.  Fail gracefully.
				return m2, f2, x2, y2 --legacy data support
			end
		end
		if not transKey then
			transKey = (fTrans==0 and mTrans) or mTrans..":"..fTrans
		end
		if not contData[transKey] then return end
			local distTable = GetCreateTable()
			
			for mZoneData,data in pairs(contData[transKey]) do
				local destinationFound = distTable[1] and distTable[1][1]==m2 and distTable[1][2]==f2
				local requirements = contData[mZoneData] and contData[mZoneData].requirements
				if mZoneData~="requirements" and 
					(not requirements or 
					CheckRequirements(1, strsplit(":", requirements))) 
				then
					local mZone, fZone
					if type(mZoneData)=="number" then
						mZone = mZoneData
						fZone = 0
					else
						mZone, fZone = strsplit(":", mZoneData)
						mZone = tonumber(mZone)
						fZone = (fZone and tonumber(fZone)) or 0
					end
					local contains = false
					for i=1,select("#",...),2 do --don't include traversed zones
						local mPrev, fPrev = select(i,...)
						if mZone==mPrev and fZone==fPrev then
							contains = true
							break
						end
					end
					if mZone==m2 and fZone==f2 and not destinationFound then --if we find destination transitions, accept no others
						while(#(distTable) > 0) do
							tPool(tremove(distTable))
						end
					end
					if not contains and (mZone==m2 or not destinationFound) then
						tinsert(distTable, 
							GetCreateTable(mZone, fZone,
							GetSmallestAngle(m1, f1, x1, y1, mTrans, fTrans, data, m2, f2, x2, y2)))
					end
				end
			end
			if #(distTable)==0 then
				tPool(distTable)
				return
			end
			table.sort(distTable,sortFunc)
--DGV:DebugFormat("BacktrackCharacterPath", "transKey", transKey, "#distTable", #distTable, "last caller", (...) and (...)..":"..select(2,...), "original caller", (...) and (select(select("#", ...) - 1,...)..":"..(select(select("#", ...),...))) , "num callers", (...) and select("#", ...)/4)
			local recursiveResult
			local resultX,resultY,resultBreadCrumb
			for _,dataTbl in ipairs(distTable) do
				recursiveResult = GetCreateTable(BacktrackCharacterPath(contData, 
					mTrans, fTrans, dataTbl[3], dataTbl[4], 
					dataTbl[1], dataTbl[2], m2, f2, x2, y2, m1, f1 or 0, mTrans, fTrans or 0, ...))
				if #(recursiveResult)==0 then
					tPool(recursiveResult)
				else
					resultX,resultY,_,resultBreadCrumb = select(3,unpack(dataTbl))
					break
				end
				YieldAutoroutine()
			end
			
			for _,dataTbl in ipairs(distTable) do
				tPool(dataTbl)
			end
			tPool(distTable)
			if not resultY or #(recursiveResult)<4 then
				tPool(recursiveResult)
				return
			end
			if HasBreadCrumb(resultBreadCrumb) then
				recursiveResult:PrependList(UnpackBreadCrumb(resultBreadCrumb))
			end
--DGV:DebugFormat("BacktrackCharacterPath", "mTrans", mTrans, "fTrans", fTrans, "resultX", resultX, "resultY", resultY, "recursiveResult", recursiveResult)
			return mTrans,fTrans,resultX,resultY,nil,tPool(recursiveResult) 
		--end
	end

	local baseSpeed = 7
	local multTravelForm = 1.4
	local multCheetahGhostWolf = 1.3
	local multMountPathfinding1 = 1.05
	local multMountUpOaPH1MountPathfinding2 = 1.1
	local multNormLand = 1.6
	local multSwiftLand = 2
	local multNormFlying = 2.5
	local multEpicFlying = 3.8
	local multMasterFlying = 4.1
	local multFootPathfinding1 = 1.04
	local multFootPathfinding2 = 1.08
	local multPoJ1 = 1.08
	local multPoJ2 = 1.15
	local multCrusaderOaPH2 = 1.2
	local spellMountUp = 78633
	local spellApprenticeRiding = 33388
	local spellJourneymanRiding = 33391
	local spellExpertRiding = 34090
	local spellArtisanRiding = 34091
	local spellMasterRiding = 90265
	local spellFlightForm = 33943
	local spellSwiftFlightForm = 40120
	local spellTravelForm = 783
	local spellCheetah = 5118
	local spellGhostWolf = 2645
	local spellPathfinding1 = 19559
	local spellPathfinding2 = 19560
	local spellOaPH1 = 51983
	local spellOaPH2 = 51986
	local spellPoJ1 = 26022
	local spellPoJ2 = 26023
	local spellCrusader = 32223
	
	local orig_GetSpellBookItemInfo = GetSpellBookItemInfo
	local function GetSpellBookItemInfo(slot)
		if slot then
			return orig_GetSpellBookItemInfo(slot)
		end
	end
	local function GetFootBonusMultiplier()
		if GetSpellBookItemInfo(GetSpellInfo(spellTravelForm)) then
			return multTravelForm
		elseif GetSpellBookItemInfo(GetSpellInfo(spellCheetah)) or
			GetSpellBookItemInfo(GetSpellInfo(spellGhostWolf))
		then
			if GetSpellBookItemInfo(GetSpellInfo(spellPathfinding2)) then
				return multCheetahGhostWolf * multFootPathfinding2
			elseif GetSpellBookItemInfo(GetSpellInfo(spellPathfinding1)) then
				return multCheetahGhostWolf * multFootPathfinding1
			end
			return multCheetahGhostWolf
		elseif GetSpellBookItemInfo(GetSpellInfo(spellPoJ2)) then
			return multPoJ2
		elseif GetSpellBookItemInfo(GetSpellInfo(spellPoJ1)) then
			return multPoJ1
		end
		return 1
	end
	local function GetMountedBonusMultiplier()
		if DGV:UserSetting(DGV_TAXIFLIGHTMASTERS)=="Always" then
			return 1
		end
		if GetSpellBookItemInfo(GetSpellInfo(spellCrusader)) or
			GetSpellBookItemInfo(GetSpellInfo(spellOaPH2))
		then
			return multCrusaderOaPH2
		elseif GetSpellBookItemInfo(GetSpellInfo(spellPoJ2)) then
			return multPoJ2
		elseif GetSpellBookItemInfo(GetSpellInfo(spellMountUp)) or
			GetSpellBookItemInfo(GetSpellInfo(spellOaPH1)) or
			GetSpellBookItemInfo(GetSpellInfo(spellPathfinding2))
		then
			return multMountUpOaPH1MountPathfinding2

		elseif GetSpellBookItemInfo(GetSpellInfo(spellPoJ1)) then
			return multPoJ1
		elseif GetSpellBookItemInfo(GetSpellInfo(spellPathfinding1)) then
			return multMountPathfinding1
		end
		return 1
	end
	
	local function GetFlightMultiplier()
		local flyingMult = 0
		if GetSpellBookItemInfo(GetSpellInfo(spellMasterRiding)) then
			flyingMult = multMasterFlying
		elseif
			GetSpellBookItemInfo(GetSpellInfo(spellArtisanRiding)) or
		        GetSpellBookItemInfo(GetSpellInfo(spellSwiftFlightForm))
		then
			flyingMult = multEpicFlying
		elseif GetSpellBookItemInfo(GetSpellInfo(spellExpertRiding)) or
			GetSpellBookItemInfo(GetSpellInfo(spellFlightForm))
		then
		             flyingMult = multNormFlying
		else
			return 0
		end
		if DGV:UserSetting(DGV_TAXIFLIGHTMASTERS)=="Always" then
			flyingMult = 1
		end
		return flyingMult * GetMountedBonusMultiplier()
	end
	local function GetLandMultiplier()
		local landMult = 0
		if GetSpellBookItemInfo(GetSpellInfo(spellJourneymanRiding)) then
			landMult = multSwiftLand
		elseif GetSpellBookItemInfo(GetSpellInfo(spellApprenticeRiding)) then
			landMult = multNormLand
		else
			return 0
		end
		if DGV:UserSetting(DGV_TAXIFLIGHTMASTERS)=="Always" then
			landMult = 1
		end
		return landMult * GetMountedBonusMultiplier()

	end

	local kalimdor = 1
	local easternKingdoms = 2
	local outland = 3
	local northrend = 4
	local theMaelstrom = 5
	local pandaria = 6
	local draenor = 7
	local groundedMaps = {499, 463, 462, 480, 476, 464, 471, 708, 709, 795, 928, 951}
	local spellFlightMastersLicense = 90267
	local spellColdWeatherFlying = 54197
	local spellWisdomOfTheFourWinds = 115913
	local draenorPathFinderAchievement = select(4, GetAchievementInfo(10018))	
	function IsFlyableMapId(mapId)
		local result = true
		local c = DGV:GetCZByMapId(mapId)
		if (c==kalimdor or c==easternKingdoms or c==theMaelstrom) and not
			GetSpellBookItemInfo(GetSpellInfo(spellFlightMastersLicense))
		then result = false
		elseif c==northrend and not GetSpellBookItemInfo(GetSpellInfo(spellColdWeatherFlying))
		then result = false
		elseif c==pandaria and not GetSpellBookItemInfo(GetSpellInfo(spellWisdomOfTheFourWinds))
		then result = false 
		elseif c==draenor and (draenorPathFinderAchievement ~= true)
		then result = false end
		if tContains(groundedMaps, mapId) then result=false end
		if DGV:IsDungeon(mapId) then result=false end
		return result
	end
	
	local movementCache = {}
	local groundedCache = {}
	function Taxi:ResetMovementCache()
		wipe(movementCache)
		wipe(groundedCache)
	end
	
	local function SetMovementCharacteristics(mapId, f)
		local cacheKey = mapId
		if f and f~=0 then
			cacheKey = mapId..":"..f
		end
		if movementCache[cacheKey] then
			return movementCache[cacheKey], groundedCache[cacheKey]
		else
			local grounded = true
			local movementSpeed
			local flyingMult = GetFlightMultiplier()
			local landMult = GetLandMultiplier()
			local nzOpenWorldFloor = TaxiData.NonZeroOpenWorldFloors[mapId]
			local isOpenWorldFloor = f==0 or not f or f==nzOpenWorldFloor
			if IsFlyableMapId(mapId) and flyingMult>0 and isOpenWorldFloor then
				grounded = nil
				movementSpeed = baseSpeed * flyingMult
			elseif landMult>0 then
				movementSpeed = baseSpeed * landMult
			else
				movementSpeed = baseSpeed * GetFootBonusMultiplier()
			end
			movementCache[cacheKey] = movementSpeed
			groundedCache[cacheKey] = grounded
			return movementSpeed, grounded
		end
	end
	
	function RouteBuilders.Character.Iterate(best, parentRoute, m1, f1, x1, y1, m2, f2, x2, y2, lastRoute)
		if lastRoute then return end
		local c1,c2 = (DGV:GetCZByMapId(m1)), DGV:GetCZByMapId(m2)
		if c1==c2 then
			local route = RouteBuilders.Character:Build(
				best, parentRoute, c1, m1, f1, x1, y1, m2, f2, x2, y2)
			if route then
				return route
			end
		end
	end
	
	local checkRoute = {builder = RouteBuilders.Character}
	local function DirectRouteEvaluatesBest(best, parentRoute, ...)
		checkRoute.parentRoute = parentRoute
		checkRoute.currentBest = best
		checkRoute.grounded = false
		checkRoute.estimate = 0
		for i=1, select("#", ...), 2 do
			local distance = select(i, ...)
			local speed = select(i+1, ...)
			checkRoute.estimate = checkRoute.estimate + distance / speed
		end
		return IsBest(checkRoute) and (not parentRoute or IsBest(parentRoute, checkRoute))
	end
	
	function RouteBuilders.Character:Build(best, parentRoute, c, m1, f1, x1, y1, m2, f2, x2, y2)
		--DGV:DebugFormat("Character:Build", "x2", x2, "y2", y2)
		--DGV:DebugFormat("Character:Build", "m1", m1, "m2", m2, "stack", debugstack())
		local movementSpeed,grounded = SetMovementCharacteristics(m1, f1)
		grounded = grounded or select(2,SetMovementCharacteristics(m2, f2))
		--DGV:DebugFormat("Character:Build ComputeDistance", "args", {m1, f1 , x1, y1, m2, f2, x2, y2})
		local dist, dx, dy= DGV:ComputeDistance(m1, f1 , x1, y1, m2, f2, x2, y2)
		if not dist or not dx or not dy then
			return
		end
		
		local contData = (TaxiDataCollection.ZoneTransData or TaxiData.ZoneTransData)[c]
		
		if m1 == 678 or m1 == 611 then 
			contData = TaxiData.ZoneTransData[2] --hack to force use Eastern Kingdom data for Gilneas
		end 
		
		if not DirectRouteEvaluatesBest(best, parentRoute, dist, movementSpeed) then
			return
		end --GetCreateRoute is expensive so do this first
		
		if grounded and not QuickPathExists(contData, m1, m2) then
			return
		end
		
		local route = GetCreateRoute(self, best, parentRoute)
		route.movementSpeed,route.grounded = movementSpeed,grounded
		route:InsertList(c, m1, f1 or 0, x1, y1, m2, f2 or 0, x2, y2)
		route.distance = dist
		
		return route
	end
	
	local function SumDistances(...)
		local sum = 0
		local lastM, lastF, lastX, lastY = ...
		for i=5,select("#", ...),5 do
			local m,f,x,y,cue = select(i, ...)
			if lastY then
				sum = sum + DGV:ComputeDistance(m, f, x, y, lastM, lastF, lastX, lastY)
			end
			lastM,lastF,lastX,lastY = m,f,x,y
		end
		return sum
	end

	function RouteBuilders.Character:Estimate(route)
		if route.estimate then return route.estimate end
		if route.grounded then
			local contData = (TaxiDataCollection.ZoneTransData or TaxiData.ZoneTransData)[route[1]]
			local _, m1, f1, x1, y1 = unpack(route)
			if m1 == 678 or m1 == 611 then 
				contData = TaxiData.ZoneTransData[2] --hack to force use Eastern Kingdom data for Gilneas
			end 
			route.estimate = SumDistances(m1, f1, x1, y1,
					BacktrackCharacterPath(contData, 
						m1, f1, x1, y1, nil, nil, select(6, unpack(route))))
				/route.movementSpeed
		else
			route.estimate = route.distance / route.movementSpeed
		end
		return route.estimate
	end
	
	local function AddCharacterPoints(description, ...)
		local point
		for i=1,select("#", ...),5 do
			local m,f,x,y,cue = select(i, ...)
			point = DGV:AddRouteWaypoint(m, f, x, y, description, cue)
		end
		return point
	end

	function RouteBuilders.Character:AddWaypoint(route, description)
		local contData = (TaxiDataCollection.ZoneTransData or TaxiData.ZoneTransData)[route[1]]
		if route.grounded then
			local _, m1, f1, x1, y1 = unpack(route)
			local m2, f2, x2, y2 = select(6, route:Unpack())
			if m1 == 678 or m1 == 611 then 
				contData = TaxiData.ZoneTransData[2] --hack to force use Eastern Kingdom data for Gilneas
			end 
			local walkRoute = AddCharacterPoints(description,
					BacktrackCharacterPath(contData, 
						m1, f1, x1, y1, nil, nil, m2, f2, x2, y2))
			if walkRoute then return walkRoute end
			DGV:DebugFormat("Character:AddWaypoint failed to find walking route for the following coordinates.  Check zone transitions.", "m1", m1, "f1", f1, "x1", x1, "y1", y1, "m2", m2, "f2", f2, "x2", x2, "y2", y2)
			return AddCharacterPoints(description, m2, f2, x2, y2)
		else
			return AddCharacterPoints(description, select(6, route:Unpack()))
		end
	end
	
	local baseMultFlightMaster = 4.33
	local spellRideLikeTheWind = 117983
	local multRideLikeTheWind = 1.25
	local function GetFlightPathMultiplier()
		local flyingMult = baseMultFlightMaster
		if GetSpellBookItemInfo(GetSpellInfo(spellRideLikeTheWind)) then
			flyingMult = flyingMult * multRideLikeTheWind
		end
		return flyingMult
	end

	function RouteBuilders.FlightHop:Build(continent, npc1, npc2)
		local fullData = TaxiData:GetFullData()
		local npcTbl1, npcTbl2 = fullData[continent][npc1], fullData[continent][npc2]
		local npc1x,npc1y = DGV:UnpackXY(npcTbl1.coord)
		local npc2x,npc2y = DGV:UnpackXY(npcTbl2.coord)
		local dist, dx, dy= DGV:ComputeDistance(
			npcTbl1.m, npcTbl1.f , npc1x, npc1y,
			npcTbl2.m, npcTbl2.f , npc2x, npc2y)
		if not dist or not dx or not dy then
			return
		end
		local route = GetCreateRoute(self)
		route.x2, route.y2, route.m2, route.f2 = npc2x, npc2y, npcTbl2.m, npcTbl2.f
		route.distance = dist
		route.builder = self
		route.movementSpeed = GetFlightPathMultiplier()*baseSpeed
		route.npc2 = npc2
		return route
	end

	function RouteBuilders.FlightHop:Estimate(route)
		if route.estimate then return route.estimate end
		route.estimate = route.distance/route.movementSpeed
		return route.estimate
	end

	function RouteBuilders.FlightHop:AddWaypoint(route, description)
		description = L["Fly to"].." "..description
		return DGV:AddRouteWaypoint(
			route.m2, route.f2, route.x2, route.y2, description)
	end
	
	local function tInsort(t, item, compareFunc)
		for i=1,#(t)+1 do
			if not t[i] or (compareFunc and compareFunc(item, t[i])) or (not compareFunc and item<t[i]) then
				tinsert(t, i, item)
				return
			end
		end
	end
	
	local function GetDistances(m, f, x, y, routes, fullContinent)
		local distances,npcLookup = GetCreateTable(), GetCreateTable()
		for id, data in pairs(routes) do
			data = (data.m and data or fullContinent[id]) or data
			if data.m then
				local dist = DGV:ComputeDistance(m, f, x, y, 
					data.m, data.f, DGV:UnpackXY(data.coord))
				if not dist then
					DGV:DebugFormat("GetDistances not dist", "m", m, "data.m", data.m)
				else
					npcLookup[dist] = id
					tInsort(distances, dist)
				end
			end
		end
		return distances, npcLookup
	end
	
	local function nextOrderedPair(t, lastKey)
		local nextKey
		local lastValue = lastKey and t[lastKey]
		for k,v in pairs(t) do
			if not lastKey or k~=lastKey then
				if (not lastValue or v>=lastValue) and (not nextKey or v<=t[nextKey]) then
					nextKey = k
				end
			end
		end
		return nextKey, nextKey and t[nextKey]
	end
	
	local function IterateOrderedDictionary(t)
		return nextOrderedPair, t
	end
	
	local function ValidatePath(c, isRoot, ...)
		local fullData = TaxiData:GetFullData()
		for i=1,select("#",...) do
			local id = tonumber((select(i,...)))
			--	DGV:DebugFormat("ValidatePath", "id", id, "DugisFlightmasterDataTable[c]~=nil", DugisFlightmasterDataTable[c]~=nil, "(select(i,...))", (select(i,...)))
			if not id or
				not fullData[c] or
				not fullData[c][id]
			then
				return
			end
			local DugisArrow = DGV.Modules.DugisArrow
			local cPlayer = DGV:GetCZByMapId(DGV.Modules.DugisArrow.map)
			if (not DugisFlightmasterDataTable or
				not DugisFlightmasterDataTable[c]) and
				(cPlayer==c or isRoot) 
			then return true end
			if not DugisFlightmasterDataTable or
				not DugisFlightmasterDataTable[c] or
				not DugisFlightmasterDataTable[c][id]
			then
				return
			end
		end
		return true
	end
	
	local allowHeadCandidates = 3
	local allowTailCandidates = 3
	local countFmIters = 0
	local function FlightMasterRouteBuildSelector(best, parentRoute, c, m1, f1, x1, y1, m2, f2, x2, y2, t)
		if not t or not t[c] then return end
		
		local route
		--for i=1,100 do
-- 		if not best and (not parentRoute or not parentRoute.currentBest) then
  			--countFmIters = countFmIters+1
  			--DGV:DebugFormat("FlightMasterRouteBuildSelector", "countFmIters", countFmIters)
--  		end
		
		local isRoot = not parentRoute
		local fullData = TaxiData:GetFullData()
		local headDistances,headNPCs = GetDistances(m1, f1, x1, y1, t[c], fullData[c])
		local tailDistances,tailNPCs = GetDistances(m2, f2, x2, y2, t[c], fullData[c])
		--if false then
		local lastAllowedHead
		local allowedHeads = 0
		local head, tail
		local tailRoutes = wipe(GetCreateTable())
		local flightSpeed = GetFlightPathMultiplier()*baseSpeed
		for i=1,#headDistances do
			local startDist = headDistances[i]
			if allowedHeads>=allowHeadCandidates then
				break 
			end
			
			if head then 
				PoolRoute(head)
				head = nil
				tail = nil
			end
			local startId = headNPCs[startDist]
			if ValidatePath(c, isRoot, startId) then
				if lastAllowedHead~=startId then
					lastAllowedHead = startId
					allowedHeads = allowedHeads + 1
				end
				
				if DirectRouteEvaluatesBest(best, parentRoute, startDist, flightSpeed) then
					local data = t[c][startId]
					local lastAllowedTail
					local allowedTails = 0
					for j=1,#tailDistances do
						local endDist = tailDistances[j]
						if allowedTails>=allowTailCandidates then
							allowedTails = 0
							break
						end
						
						local endId = tailNPCs[endDist]
						if ValidatePath(c, isRoot, startId, endId) then
							if lastAllowedTail~=endId then
								lastAllowedTail = endId
								allowedTails = allowedTails + 1
							end
							
							local directMatch = data.direct and
									(strmatch(data.direct, format(":%d",endId)) or 
									strmatch(data.direct, format("%d:",endId)) or
									tonumber(data.direct)==endId)
							local hopTable
							if directMatch then
								hopTable = GetCreateTable(endId)
							else
								for _, hops in ipairs(data) do
									local hopMatch = strmatch(hops, format(":%d$",endId))
									if hopMatch then
										hopTable = GetCreateTable(strsplit(":", hops))
										if not ValidatePath(c, isRoot, startId, unpack(hopTable)) then
											tPool(hopTable)
											hopTable = nil
										end
										break
									end
								end
							end
							if hopTable then
								tail = tailRoutes[endId]
								if not tail or (not head and tail~="nilTail") then
									local mStart,fStart,xStart,yStart,
										mEnd,fEnd,xEnd,yEnd
									
									if head then
										mStart,fStart,xStart,yStart = unpack(head,6)
	-- 									if not mStart then
	-- 										DGV:DebugFormat("FlightMasterRouteBuildSelector", "head[6]", head[6], "head in pool", tContains(routePool, head))
	-- 									end
									else
										local npcTbl = fullData[c][startId]
										local npcx,npcy = DGV:UnpackXY(npcTbl.coord)
										mStart,fStart,xStart,yStart = npcTbl.m, npcTbl.f, npcx, npcy
									end
									
									if tail then
										mEnd,fEnd,xEnd,yEnd = unpack(tail,2)
									else
										local npcTbl = fullData[c][endId]
										local npcx,npcy = DGV:UnpackXY(npcTbl.coord)
										mEnd,fEnd,xEnd,yEnd = npcTbl.m, npcTbl.f, npcx, npcy
									end
									
									local abDist = DGV:ComputeDistance(
										mStart,fStart,xStart,yStart, 
										mEnd,fEnd,xEnd,yEnd)
	-- 								DGV:DebugFormat("FlightMasterRouteBuildSelector", "mStart", mStart, "mEnd", mEnd)
									if DirectRouteEvaluatesBest(best, parentRoute, 
										startDist, (SetMovementCharacteristics(mStart, fStart)),
										endDist, (SetMovementCharacteristics(mEnd, fEnd)),
										abDist, flightSpeed)
									then
										if not head then
											head = RouteBuilders.Character:Build(best, nil, c, 
												m1, f1, x1, y1, 
												mStart,fStart,xStart,yStart)
										end
									
										if not tail then
											tail = RouteBuilders.Character:Build(
												best, nil, c, 
												mEnd,fEnd,xEnd,yEnd, 
												m2, f2, x2, y2)
										end
									end
								end
								if not tail then
									tailRoutes[endId] = "nilTail"
								else
									tailRoutes[endId] = tail
								end
								--DGV:DebugFormat("FlightMasterRouteBuildSelector", "tailRoutes", tailRoutes)
								--return
								if tail=="nilTail" then
									tail = nil
								end
								if not head then
									tPool(hopTable)
									break 
								end
								if tail then
									route = RouteBuilders.FlightMaster:Build(
										best, parentRoute, c, m1, f1, x1, y1, 
										m2, f2, x2, y2,
										head, tail, startId, unpack(hopTable))
									if route then
										--PoolRoute(route)
										--route = nil
										allowedHeads = allowHeadCandidates
										allowedTails = allowTailCandidates
										tPool(hopTable)
										break
									end
								end
								tPool(hopTable)
							end
						end
						YieldAutoroutine()
					end
				end
			end
		end
		if head and not head.parentRoute then PoolRoute(head) end
		--if tail then PoolRoute(tail) end
		for _,tr in pairs(tailRoutes) do
			if tr~="nilTail" and not tr.parentRoute then
				PoolRoute(tr)
			end
		end
		tPool(tailRoutes)
		--end
		tPool(headDistances)
		tPool(headNPCs)
		tPool(tailDistances)
		tPool(tailNPCs)
		--end
		return route
	end
	
	function RouteBuilders.FlightMaster.Iterate(best, parentRoute, m1, f1, x1, y1, m2, f2, x2, y2, lastRoute, c, tableSelect)
		if not lastRoute then
			c = DGV:GetCZByMapId(m1)
			local c2 = DGV:GetCZByMapId(m2)
			if c~=c2 then return end
			
			--Quick Failure Opportunity: best is better than a direct flight betweeen points
			local dist, dx, dy= DGV:ComputeDistance(m1, f1 , x1, y1, m2, f2 , x2, y2)
			if not dist or not dx or not dy then
				return
			end
			local flightSpeed = GetFlightPathMultiplier()*baseSpeed
			if not DirectRouteEvaluatesBest(
				best, parentRoute, dist, flightSpeed)
			then
				return
			end
		end
		
		if not tableSelect then
			tableSelect = 1
			local route = FlightMasterRouteBuildSelector(best, parentRoute, c, m1, f1, x1, y1, m2, f2, x2, y2, TaxiData:GetFullData())
			if route then
				return route, c, tableSelect
			end
		end
		if tableSelect == 1 then
			tableSelect = 2
			local route = FlightMasterRouteBuildSelector(best, parentRoute, c, m1, f1, x1, y1, m2, f2, x2, y2, DugisFlightmasterDataTable)
			if route then
				return route, c, tableSelect
			end
		end
	end

	function RouteBuilders.FlightMaster:Build(best, parentRoute, c, m1, f1, x1, y1, m2, f2, x2, y2, head, tail, ...)
		--DGV:DebugFormat("FlightMaster:Build", "hasBest", best~=nil)
		--DGV:DebugFormat("FlightMaster:Build", "c", c)
		if not ValidatePath(c, not parentRoute, ...) then return end
		--DGV:DebugFormat("FlightMaster:Build", "#(routes)", #(routes))
		local fullData = TaxiData:GetFullData()
		local headId = tonumber((select(1,...)))
		
		if fullData[c][headId].requirements and not CheckRequirements(1, strsplit(":", fullData[c][headId].requirements))  then return end
		
		local route = GetCreateRoute(self, best, parentRoute)
		route.headId = headId
		tinsert(route, head)
		--DGV:DebugFormat("FlightMaster:Build add head")

		route.tailId = tonumber(select(select("#",...), ...))
		npcTbl = fullData[c][route.tailId]
		tinsert(route, tail)
		--DGV:DebugFormat("FlightMaster:Build add tail")
		route.tailMap = npcTbl.m
		--DGV:DebugFormat("FlightMaster:Build", "tail", tail, "best", best)
		
		for i=2,select("#",...) do
			--DGV:DebugFormat("FlightMaster:Build add mid")
			local lastId = tonumber((select(i-1,...)))
			local id = tonumber((select(i,...)))
			local hop = RouteBuilders.FlightHop:Build(c, lastId, id)
			if hop then
				--DGV:DebugFormat("FlightMaster:Build add mid")
				hop.parentRoute = route
				tinsert(route, #(route), hop)
				route.estimate = nil
			end
			if not hop and IsBest(route) then
				PoolRoute(route)
				--DGV:DebugFormat("FlightMaster:Build mid end", "#(routes)", #(routes))
				return
			end
		end
		--DGV:DebugFormat("FlightMaster:Build success", "#(routes)", #(routes), "#(route)", #(route))
-- 		if true then
-- 			PoolRoute(route)
-- 			return
-- 		end
		head.parentRoute = route
		tail.parentRoute = route
		route.m2, route.f2, route.x2, route.y2, route.c = m2, f2, x2, y2, c
		return route
	end

	function RouteBuilders.FlightMaster:Estimate(route)
		if route.estimate then return route.estimate end
		local estimate = 0
		for _, subRoute in ipairs(route) do
			estimate = estimate + subRoute.builder:Estimate(subRoute)
		end
		route.estimate = estimate
		return estimate
	end

	function RouteBuilders.FlightMaster:AddWaypoint(route, description)
		local headRoute = route[1]
		if not DugisFlightmasterDataTable or 
			not DugisFlightmasterDataTable[route.c] 
		then
			local chDesc = format(L["Talk to %s to get flight master data."], 
				DGV:GetFlightMasterName(route.headId))
			local point = headRoute.builder:AddWaypoint(headRoute, chDesc)
			point.flightMasterID = route.headId
			local routeToRecalculate = DGV.Modules.TaxiDB.routeToRecalculate
			routeToRecalculate.m = route.m2
			routeToRecalculate.f = route.f2
			routeToRecalculate.x = route.x2
			routeToRecalculate.y = route.y2
			routeToRecalculate.c = route.c
			routeToRecalculate.desc = description
			return
		end
		
		local mapName = DGV:GetMapNameFromID(route.tailMap)
		local chDesc = format(L["Talk to %s and fly to %s"], 
			DGV:GetFlightMasterName(route.headId), mapName)
		--headRoute.builder:AddWaypoint(headRoute, chDesc)
		local lastHopRoute = route[#(route)-1]
		local headRouteWaypoint = headRoute.builder:AddWaypoint(headRoute, chDesc)
		headRouteWaypoint.flightMasterID = route.tailId
		lastHopRoute.builder:AddWaypoint(lastHopRoute, string.format("%s, %s",
				DGV:GetFlightMasterName(route.tailId), mapName))
		local tailRoute = route[#(route)]
		return tailRoute.builder:AddWaypoint(tailRoute, description)
	end

	local cachedBindLocation = {}
	local potentialBindLocation
	function DGV:CONFIRM_BINDER(event, newLocation)
		wipe(cachedBindLocation)
		potentialBindLocation = newLocation
	end
	
	local function LoadBindLocationToCache(locationName)
		if (not TaxiDataCollection.BindLocations) or (not TaxiDataCollection.BindLocations[locationName]) then return end
		local mString, fString, xyString = strsplit(":", TaxiDataCollection.BindLocations[locationName])
		cachedBindLocation.m = tonumber(mString)
		cachedBindLocation.f = tonumber(fString)
		cachedBindLocation.x, cachedBindLocation.y = DGV:UnpackXY(xyString)
		return true
	end
	
	local function GetUsefulBindLocation()
		if cachedBindLocation.m then	--get cached value
			return 
				cachedBindLocation.m, 
				cachedBindLocation.f, 
				cachedBindLocation.x, 
				cachedBindLocation.y
		elseif LoadBindLocationToCache(GetBindLocation()) then	--attempt to populate from global bind location table
			return GetUsefulBindLocation()
		end
		local bindLocation = GetBindLocation()
		
		local maps = DugisWorldMapTrackingPoints[UnitFactionGroup("player")]
		for mapKey, mapValue in pairs(maps) do --iterate inkeepers
			local m,f = strsplit(":",mapKey)
			for index=1,#(mapValue) do
				local tt,loc,id,sub = strsplit(":", mapValue[index])
				if tonumber(tt)==7 then
					if sub==BR[bindLocation] then
						local x,y = DGV:UnpackXY(loc)
						m, f = tonumber(DGV:GetMapIDFromName(m)), tonumber(f)
						cachedBindLocation.m = m
						cachedBindLocation.f = f
						cachedBindLocation.x = x
						cachedBindLocation.y = y
						return m,f,x,y
					end
				end
			end
			--YieldAutoroutine()
		end
	end
	
	hooksecurefunc("ConfirmBinder", function()
		if potentialBindLocation==GetBindLocation() then
			if not TaxiDataCollection.BindLocations then TaxiDataCollection.BindLocations = {} end
			if not TaxiDataCollection.BindLocations[potentialBindLocation] then
				TaxiDataCollection.BindLocations[potentialBindLocation] = DGV.Modules.TaxiDB:GetPackedPlayerLocation()
			end
			LoadBindLocationToCache(potentialBindLocation)
		end
	end)
	
	local function GetUsableItem(itemId)
		return GetItemCount(itemId)~=0 and
			GetItemCooldown(itemId)==0 and
			itemId
	end
	
	function RouteBuilders.BoundTeleport.Iterate(best, parentRoute, m1, f1, x1, y1, m2, f2, x2, y2, lastRoute)
		if lastRoute then return end
		local route = RouteBuilders.BoundTeleport:Build(
			best, parentRoute, m1, f1, x1, y1, m2, f2, x2, y2)
		if route then
			return route
		end
	end

	local itemHearthstone = 6948
	local itemSoR1 = 37118
	local itemSoR2 = 44314
	local itemSoR3 = 44315
	local itemInnkeepersDaughter = 64488
	local itemRubySlippers = 28585
	local itemEtherealPortal = 54452
	local spellAstralRecall = 556
	function RouteBuilders.BoundTeleport:Build(best, parentRoute, m1, f1, x1, y1, m2, f2, x2, y2)
		--DGV:DebugFormat("BoundTeleport:Build", "m1", m1, "f1", f1,"x1", x1, "y1", y1, "m2", m2, "f2", f2, "x2",  x2, "y2", y2)
		local mBound,fBound,xBound,yBound = GetUsefulBindLocation()
		if not mBound then return end
		local route = GetCreateRoute(self, best, parentRoute)
		route.builder = self
		route.m, route.f, route.x, route.y = mBound,fBound,xBound,yBound
		
		local astralFixation
		
		if select(2,UnitClass("player")) == "SHAMAN" then
			for i=1, NUM_GLYPH_SLOTS do 
				glyphSpell = select(4, GetGlyphSocketInfo(i))
				if glyphSpell == 147787 then 
					astralFixation = true --Glyph of Astral Fixation
				end
			end
		end
		
		if 
			GetSpellBookItemInfo(GetSpellInfo(spellAstralRecall)) and
			GetSpellCooldown(spellAstralRecall)==0 and
			not astralFixation
		then
			route.spell = spellAstralRecall
		else
			route.item = GetUsableItem(itemInnkeepersDaughter) or
					GetUsableItem(itemEtherealPortal) or
					GetUsableItem(itemHearthstone) or
					(UnitLevel("player") <= 40 and GetUsableItem(itemSoR1)) or
					(UnitLevel("player") <= 70 and GetUsableItem(itemSoR2)) or
					(UnitLevel("player") <= 80 and GetUsableItem(itemSoR3))
		end
		if not route.spell and not route.item then
			PoolRoute(route)
			return
		end
		route.tail = Taxi:GetBestRoute(route,
				mBound,fBound,xBound,yBound, m2, f2, x2, y2, 
				RouteBuilders.UnboundTeleport,
				RouteBuilders.BoundTeleport,
				RouteBuilders.ZenPilgrimageReturn,
				RouteBuilders.InstanceExit,
				RouteBuilders.StaticPortals,
				RouteBuilders.Boats)
		if not route.tail then
			PoolRoute(route)
			return
		else
			tinsert(route, route.tail)
		end
		return route
	end
	
	local hearthCast = 10
	local innkeepersDaughterCast = 3
	local loadConstant = 5
	local penaltyConstant = 20
	function RouteBuilders.BoundTeleport:Estimate(route)
		local cast = (route.item == itemInnkeepersDaughter and innkeepersDaughterCast) or 
			hearthCast
		local tailEst = (route.tail and route.tail.builder:Estimate(route.tail)) or 0
		return tailEst + cast + loadConstant + penaltyConstant
	end

	function RouteBuilders.BoundTeleport:AddWaypoint(route, description)
		local descriptionHead = L["Hearth to"]
		if route.item then
			if route.item~=itemHearthstone then
				descriptionHead = L["Use"].." "..select(2, GetItemInfo(route.item))
			end
			DGV:AddRouteWaypointWithItem(
				route.m, route.f, route.x, route.y, 
				descriptionHead.." "..GetBindLocation(),
				route.item)
		elseif route.spell then
			descriptionHead = L["Use"].." "..(GetSpellLink(route.spell))
			DGV:AddRouteWaypointWithSpell(
				route.m, route.f, route.x, route.y, 
				descriptionHead.." "..GetBindLocation(),
				route.spell)
		end
		return route.tail.builder:AddWaypoint(route.tail, description)
	end
	
	function RouteBuilders.UnboundTeleport.Iterate(prevBest, parentRoute, m1, f1, x1, y1, m2, f2, x2, y2, lastRoute, key, chunk)
		local c2 = DGV:GetCZByMapId(m2)
		if c2==0 then return end
		while true do
			if not chunk then --check for chunk containing additional record(s)
				local multData
				--without this workaround there is an exception related to bonus objectives
                if TaxiData.UnboundTeleportData[c2] == nil then
                    return
                end				
				key, chunk = next(TaxiData.UnboundTeleportData[c2], key)
			end
			if chunk then
				local data
				data, chunk = strsplit("/", chunk, 2)
                local keyValue = key
                keyValue = string.gsub(keyValue, ":.*", "") 
                keyValue = tonumber(keyValue)
				local telBuild = RouteBuilders.UnboundTeleport:Build(
					prevBest, parentRoute,
					m1, f1, x1, y1, m2, f2, x2, y2, keyValue, data)
				if telBuild then
					return telBuild, key, chunk
				end
			else
				return
			end
		end
	end
		
	function RouteBuilders.UnboundTeleport:Build(best, parentRoute, m1, f1, x1, y1, m2, f2, x2, y2, portId, data)
		local spellIdString,mapIdString,floorString,locString = CheckRequirements(5, strsplit(":", data))
		if not locString then return end
		local mPort,fPort,xPort,yPort = tonumber(mapIdString), tonumber(floorString), 
			DGV:UnpackXY(locString)
		
		local route = GetCreateRoute(self, best, parentRoute)
		route.builder = self
		route.m, route.f, route.x, route.y = mPort,fPort,xPort,yPort
		local spellId = tonumber(spellIdString)
		
		local astralFixation
		
		if select(2,UnitClass("player")) == "SHAMAN" then
			for i=1, NUM_GLYPH_SLOTS do 
				glyphSpell = select(4, GetGlyphSocketInfo(i))
				if glyphSpell == 147787 then 
					astralFixation = true --Glyph of Astral Fixation
				end
			end
		end
		
		if portId==spellId then
			if spellId == spellAstralRecall and
			not astralFixation then
				PoolRoute(route)
				return
			end	
			if not GetSpellBookItemInfo(GetSpellInfo(portId)) or GetSpellCooldown(portId)~=0 then
				PoolRoute(route)
				return
			end
			route.spell = portId
		else
			if GetItemCount(portId)==0 or GetItemCooldown(portId)~=0 then
				PoolRoute(route)
				return
			end
			route.item = portId	
		end
		route.tail = Taxi:GetBestRoute(route,
			mPort,fPort,xPort,yPort, m2, f2, x2, y2, 
			RouteBuilders.UnboundTeleport,
			RouteBuilders.BoundTeleport,
			RouteBuilders.ZenPilgrimageReturn,
			RouteBuilders.StaticPortals,
			RouteBuilders.InstanceExit,
			RouteBuilders.Boats)
		if not route.tail then
			PoolRoute(route)
			return
		else
			tinsert(route, route.tail)
		end
		return route
	end
	
	local ubtPenalty = penaltyConstant - 10
	function RouteBuilders.UnboundTeleport:Estimate(route)
		--DGV:DebugFormat("UnboundTeleport:Estimate ORG", "route.spell", route.spell)
		local est = route.estimate
		if not est then
			local tailEst = (route.tail and route.tail.builder:Estimate(route.tail)) or 0
			est = tailEst + 10 + loadConstant + ubtPenalty
			if tailEst~=0 then
				route.estimate = est
			end
		end
		return est
	end

	function RouteBuilders.UnboundTeleport:AddWaypoint(route, description)
		local useDescription
		if route.item and select(2, GetItemInfo(route.item)) then
			useDescription = L["Use"].." "..select(2, GetItemInfo(route.item))
			DGV:AddRouteWaypointWithItem(
				route.m, route.f, route.x, route.y, useDescription,
				route.item)
		elseif route.spell and GetSpellLink(route.spell) then
			useDescription = L["Use"].." "..(GetSpellLink(route.spell))
			DGV:AddRouteWaypointWithSpell(
				route.m, route.f, route.x, route.y, useDescription,
				route.spell)
		end
		return route.tail.builder:AddWaypoint(route.tail, description)
	end
	
	function DGV:UNIT_SPELLCAST_START(event, unit, spellName, spellRank, lineIdCounter, spellId)
		if unit=="player" and spellId==126892 then
			if not DugisGuideUser.ZenPilgrimageReturnPoint then DugisGuideUser.ZenPilgrimageReturnPoint = {} end
			pt = DugisGuideUser.ZenPilgrimageReturnPoint
			pt.m, pt.f, pt.x, pt.y = DGV:GetPlayerMapPositionDisruptive()
		end
	end
	
	function RouteBuilders.ZenPilgrimageReturn.Iterate(best, parentRoute, m1, f1, x1, y1, m2, f2, x2, y2, lastRoute)
		if lastRoute then return end
		local route = RouteBuilders.ZenPilgrimageReturn:Build(
			best, parentRoute, m1, f1, x1, y1, m2, f2, x2, y2)
		if route then
			return route
		end
	end
	
	function RouteBuilders.ZenPilgrimageReturn:Build(best, parentRoute, m1, f1, x1, y1, m2, f2, x2, y2)
		if not UnitBuff("player", GetSpellInfo(126895)) 
			or not DugisGuideUser.ZenPilgrimageReturnPoint 
			or not DugisGuideUser.ZenPilgrimageReturnPoint.m 
		then return end
		
		local route = GetCreateRoute(self, best, parentRoute)
		route.builder = self
		local pt = DugisGuideUser.ZenPilgrimageReturnPoint
		route.m, route.f, route.x, route.y = pt.m, pt.f, pt.x, pt.y
		route.spell = 126895
		
		
		route.tail = Taxi:GetBestRoute(route,
			pt.m, pt.f, pt.x, pt.y, m2, f2, x2, y2, 
			RouteBuilders.UnboundTeleport,
			RouteBuilders.BoundTeleport,
			RouteBuilders.ZenPilgrimageReturn,
			RouteBuilders.StaticPortals,
			RouteBuilders.InstanceExit,
			RouteBuilders.Boats)
		if not route.tail then
			PoolRoute(route)
			return
		else
			tinsert(route, route.tail)
		end
		return route
	end
	RouteBuilders.ZenPilgrimageReturn.Estimate = RouteBuilders.UnboundTeleport.Estimate
	RouteBuilders.ZenPilgrimageReturn.AddWaypoint = RouteBuilders.UnboundTeleport.AddWaypoint
		
	local routeStackLimit = 6
	local function CheckStackLoop(parentRoute, comparison, hop)
		if not hop then hop=1 end
		if hop>routeStackLimit then return true end
		if not parentRoute then return end
		if parentRoute.mPort==comparison or parentRoute.data==comparison then
			return true
		end
		if not parentRoute.parentRoute then return end
		return CheckStackLoop(parentRoute.parentRoute, comparison, hop+1)
	end
	
	local function ReturnAllParentRoutes(route)
		if not route.parentRoute then return end
		return route.parentRoute, ReturnAllParentRoutes(route.parentRoute)
	end
	
	function RouteBuilders.InstanceExit.Iterate(prevBest, parentRoute, m1, f1, x1, y1, m2, f2, x2, y2, lastRoute, control)
		--if IsInInstance() then 
			if not control then control = 0 end
			control = control + 1
			if m1~=m2 then
				if IsInLFGDungeon() and DGV:IsLFGTeleportAvailable() and DugisGuideUser.LFGWorldLocation and control==1 then
					return RouteBuilders.InstanceExit:Build(prevBest, parentRoute, m1, f1, x1, y1, m2, f2, x2, y2), control
				elseif not (IsInLFGDungeon() and DGV:IsLFGTeleportAvailable()) then
					local multData, data = TaxiData.InstancePortals[m1]
					if multData then
						data = select(control, strsplit("/", multData))
					end
					if data then
						local portBuild = RouteBuilders.InstanceExit:Build(prevBest, parentRoute, m1, f1, x1, y1, m2, f2, x2, y2, data)
						if portBuild then 
							return portBuild, control
						else
							return RouteBuilders.InstanceExit.Iterate(prevBest, parentRoute, m1, f1, x1, y1, m2, f2, x2, y2, lastRoute, control)
						end
					end
				end
			end
		--end
	end
	
	function RouteBuilders.InstanceExit:Build(best, parentRoute, m1, f1, x1, y1, m2, f2, x2, y2, data)
		local sourceMapIdString,sourceFloorString,sourceLocString,
			destMapIdString,destFloorString,destLocString,
			mSource,fSource,xSouce,ySource
		if data then
			destMapIdString, destFloorString, destLocString, sourceMapIdString, sourceFloorString, sourceLocString 
				= CheckRequirements(7, strsplit(":", data))
			if not sourceLocString  then return end
			mSource,fSource,xSouce,ySource =
				tonumber(sourceMapIdString), tonumber(sourceFloorString),
				DGV:UnpackXY(sourceLocString)
			if mSource~=m1 then return end
			fSource = fSource or f1
		else
			destMapIdString, destFloorString, destLocString = strsplit(":", DugisGuideUser.LFGWorldLocation)
		end
		
		local mPort,fPort,xPort,yPort = 
			tonumber(destMapIdString), tonumber(destFloorString), 
			DGV:UnpackXY(destLocString)
		
		local route = GetCreateRoute(self, best, parentRoute)
		route.builder = self
		route.mPort, route.fPort, route.xPort, route.yPort,
		route.mSource, route.fSource, route.xSouce, route.ySource = 
			mPort, fPort, xPort, yPort,
			mSource, fSource, xSouce, ySource
			
		if mSource then
			route.head = RouteBuilders.Character:Build(best, route, 0, m1, f1, x1, x2, mSource, fSource, xSouce, ySource)
			if not route.head then
				PoolRoute(route)
				return
			else
				tinsert(route, route.head)
			end
		end
			
		route.tail = Taxi:GetBestRoute(route,
			mPort,fPort,xPort,yPort, m2, f2, x2, y2,
			RouteBuilders.UnboundTeleport,
			RouteBuilders.BoundTeleport,
			RouteBuilders.ZenPilgrimageReturn,
			RouteBuilders.InstanceExit)
		if route.tail then
			tinsert(route, route.tail)
		else
			PoolRoute(route)
			return
		end
		
		return route
	end
	
	function RouteBuilders.InstanceExit:AddWaypoint(route, description)
		if route.head then
			return RouteBuilders.StaticPortals.AddWaypoint(self, route, description)
		else
			local lfgTelDesc = string.format(
				L["Use the LFG Teleport to %s"], 
				DGV:GetMapNameFromID(route.mPort))
			DGV:AddLFGTeleportWaypoint(route.mPort, route.fPort,
				route.xPort, route.yPort, lfgTelDesc)
			return route.tail.builder:AddWaypoint(route.tail, description)
		end
	end
	
	function RouteBuilders.InstancePortals.Iterate(prevBest, parentRoute, m1, f1, x1, y1, m2, f2, x2, y2, lastRoute, control)
		if not control then control = 0 end
		control = control + 1
		local multData, data = TaxiData.InstancePortals[m2]
		if m1~=m2 and multData then
			data = select(control, strsplit("/", multData))
		end
		if not data then return	end
		
		local portBuild = RouteBuilders.InstancePortals:Build(prevBest, parentRoute, m1, f1, x1, y1, m2, f2, x2, y2, data)
		if portBuild then 
			return portBuild, control
		else
			return RouteBuilders.InstancePortals.Iterate(prevBest, parentRoute, m1, f1, x1, y1, m2, f2, x2, y2, lastRoute, control)
		end
	end
	
	function RouteBuilders.InstancePortals:Build(best, parentRoute, m1, f1, x1, y1, m2, f2, x2, y2, data)
		local sourceMapIdString,sourceFloorString,sourceLocString,
			destMapIdString,destFloorString,destLocString = 
				CheckRequirements(7, strsplit(":", data))
		if not destLocString then return end
		
		local mSource,fSource,xSouce,ySource =
			tonumber(sourceMapIdString), tonumber(sourceFloorString),
			DGV:UnpackXY(sourceLocString)
			
		local fPort,xPort,yPort = 
			tonumber(destFloorString), 
			DGV:UnpackXY(destLocString)
		
		local route = GetCreateRoute(self, best, parentRoute)
		route.builder = self
		route.mSource, route.fSource, route.xSouce, route.ySource,
			route.mPort, route.fPort, route.xPort, route.yPort = 
			mSource, fSource, xSouce, ySource,
			m2, fPort, xPort, yPort
			
		route.tail = RouteBuilders.Character:Build(nil, route, 0, m2,fPort,xPort,yPort, m2, f2, x2, y2)

		if route.tail then
			tinsert(route, route.tail)
		end
		if not route.tail or not IsBest(route)
		then
			PoolRoute(route)
			return
		end
		
		route.head = Taxi:GetBestRoute(route,
			m1, f1, x1, y1, mSource, fSource, xSouce, ySource)
		
		if not route.head then
			PoolRoute(route)
			return
		else
			tinsert(route, route.head)
		end
		
		return route
	end
	
	function RouteBuilders.InstancePortals:IsBest(route)
		if route.currentBest.builder==RouteBuilders.InstancePortals and route.tail then
			local f2 = route.tail[7]
			if f2 == 0 then f2 = 1 end
			if route.currentBest.fPort~=f2 and route.fPort==f2 then return true end
			return IsBestEstimate(route.tail, route.currentBest.tail)
		else
			return IsBestEstimate(route, route.currentBest)
		end
	end
	
	local function LocalPortalSort(item1 , item2)
		return item1[1]<item2[1]
	end
	
	function RouteBuilders.LocalPortals.Iterate(prevBest, parentRoute, m1, f1, x1, y1, m2, f2, x2, y2, lastRoute)
		local dataTable, c1, c2 = TaxiData.LocalPortalData, (DGV:GetCZByMapId(m1)), DGV:GetCZByMapId(m2)
		if lastRoute or c1~=c2 or not dataTable[c2] then return end
		local validPortals = GetCreateTable()
		for _, data in ipairs(dataTable[c2]) do
			local spellIdString,sourceMapIdString,sourceFloorString,sourceLocString,
				destMapIdString,destFloorString,destLocString = 
				CheckRequirements(8, strsplit(":", data))
			if destLocString and not CheckStackLoop(parentRoute, data) then
				local mPort, fPort, xPort, yPort = tonumber(destMapIdString), tonumber(destFloorString), DGV:UnpackXY(destLocString)
				local tailDist = DGV:ComputeDistance(mPort, fPort, xPort, yPort, m2, f2, x2, y2)
				if tailDist then
					tInsort(validPortals, GetCreateTable(tailDist, data, spellIdString,sourceMapIdString,sourceFloorString,sourceLocString, mPort, fPort, xPort, yPort), LocalPortalSort)
				end
			end
		end
		local portBuild
		for _, portData in ipairs(validPortals) do
			if not portBuild then
				portBuild = RouteBuilders.LocalPortals:Build(prevBest, parentRoute, m1, f1, x1, y1, c2, m2, f2, x2, y2, portData)
			end
			tPool(portData)
		end
		tPool(validPortals)
		if portBuild then
			return portBuild
		end
	end
	
	function RouteBuilders.StaticPortals.Iterate(prevBest, parentRoute, m1, f1, x1, y1, m2, f2, x2, y2, lastRoute, control, c2)
		local dataTable = TaxiData.StaticPortalData
		if not c2 then
			c2 = DGV:GetCZByMapId(m2)
		end
		if not control then control = 0 end
		control = control + 1
		local data = dataTable[c2] and dataTable[c2][control]
		if not data then return	end
		local portBuild = RouteBuilders.StaticPortals:Build(
			prevBest, parentRoute, 
			m1, f1, x1, y1, c2, m2, f2, x2, y2, data)
		if portBuild then 
			return portBuild, control, c2
		else
			return RouteBuilders.StaticPortals.Iterate(prevBest, parentRoute, m1, f1, x1, y1, m2, f2, x2, y2, lastRoute, control, c2)
		end
	end
	
	function RouteBuilders.LocalPortals:Build(best, parentRoute, m1, f1, x1, y1, c2, m2, f2, x2, y2, data)
		local _, original_data, spellIdString,sourceMapIdString,sourceFloorString,sourceLocString, mPort, fPort, xPort, yPort = 
			unpack(data)
		
		local mSource,fSource,xSouce,ySource =
			tonumber(sourceMapIdString), tonumber(sourceFloorString),
			DGV:UnpackXY(sourceLocString)
			
		local cSource = DGV:GetCZByMapId(mSource)
		
		local route = GetCreateRoute(self, best, parentRoute)
		route.builder = self
		route.mSource, route.fSource, route.xSouce, route.ySource,
			route.mPort, route.fPort, route.xPort, route.yPort = 
			mSource, fSource, xSouce, ySource,
			mPort, fPort, xPort, yPort
		route.data = original_data

		route.tail = Taxi:GetBestRoute(route,
			mPort,fPort,xPort,yPort, m2, f2, x2, y2,
			RouteBuilders.UnboundTeleport,
			RouteBuilders.BoundTeleport,
			RouteBuilders.ZenPilgrimageReturn,
			RouteBuilders.LocalPortals,
			RouteBuilders.StaticPortals,
			RouteBuilders.InstanceExit,
			RouteBuilders.Boats)

		if route.tail then
			tinsert(route, route.tail)
		end
		if not route.tail
			or not IsBest(route)
		then
			PoolRoute(route)
			return
		end
		
		route.head = Taxi:GetBestRoute(route,
			m1, f1, x1, y1, mSource, fSource, xSouce, ySource,
			RouteBuilders.UnboundTeleport,
			RouteBuilders.BoundTeleport,
			RouteBuilders.ZenPilgrimageReturn,
			RouteBuilders.StaticPortals,
			--RouteBuilders.LocalPortals,
			RouteBuilders.Boats)
			
		
		if not route.head then
			PoolRoute(route)
			return
		else
			tinsert(route, route.head)
		end
		
		route.spell = tonumber(spellIdString)
		return route
	end
	
	function RouteBuilders.StaticPortals:Build(best, parentRoute, m1, f1, x1, y1, c2, m2, f2, x2, y2, data)
		local spellIdString,sourceMapIdString,sourceFloorString,sourceLocString,
			destMapIdString,destFloorString,destLocString = 
				CheckRequirements(8, strsplit(":", data))
		if not destLocString then return end
		
		local mPort = tonumber(destMapIdString)
		if CheckStackLoop(parentRoute, mPort) then return end
		
		local mSource,fSource,xSouce,ySource =
			tonumber(sourceMapIdString), tonumber(sourceFloorString),
			DGV:UnpackXY(sourceLocString)
			
		local cSource = DGV:GetCZByMapId(mSource)
		if cSource==c2 then return end
			
		local fPort,xPort,yPort = 
			tonumber(destFloorString), 
			DGV:UnpackXY(destLocString)
		
		local route = GetCreateRoute(self, best, parentRoute)
		route.builder = self
		route.mSource, route.fSource, route.xSouce, route.ySource,
			route.mPort, route.fPort, route.xPort, route.yPort = 
			mSource, fSource, xSouce, ySource,
			mPort, fPort, xPort, yPort
		
		route.tail = Taxi:GetBestRoute(route,
			mPort,fPort,xPort,yPort, m2, f2, x2, y2,
			RouteBuilders.UnboundTeleport,
			RouteBuilders.BoundTeleport,
			RouteBuilders.ZenPilgrimageReturn,
			RouteBuilders.StaticPortals,
			RouteBuilders.InstanceExit,
			RouteBuilders.Boats)

		if route.tail then
			tinsert(route, route.tail)
		end
		if not route.tail
			or not IsBest(route)
		then
			PoolRoute(route)
			return
		end
		
		route.head = Taxi:GetBestRoute(route,
			m1, f1, x1, y1, mSource, fSource, xSouce, ySource)
		
		if not route.head then
			PoolRoute(route)
			return
		else
			tinsert(route, route.head)
		end
		
		route.spell = tonumber(spellIdString)
		return route
	end
	
	function RouteBuilders.StaticPortals:Estimate(route)
		local est = route.estimate
		if not est then
			local headEst = (route.head and route.head.builder:Estimate(route.head)) or 0
			local tailEst = (route.tail and route.tail.builder:Estimate(route.tail)) or 0
			est = headEst + tailEst + loadConstant
			if headEst~=0 and tailEst~=0 then
				route.estimate = est
			end
		end
		return est
	end
	RouteBuilders.LocalPortals.Estimate = RouteBuilders.StaticPortals.Estimate
	RouteBuilders.InstancePortals.Estimate = RouteBuilders.StaticPortals.Estimate
	RouteBuilders.InstanceExit.Estimate = RouteBuilders.StaticPortals.Estimate
	
	function RouteBuilders.StaticPortals:AddWaypoint(route, description)
		local portDesc = string.format(
			L["%s Portal in %s"], 
			DGV:GetMapNameFromID(route.mPort),
			DGV:GetMapNameFromID(route.mSource))
		route.head.builder:AddWaypoint(route.head, portDesc)
		
		if route.spell then
			DGV:AddRouteWaypointWithSpellRequirement(route.mSource, route.fSource,
			route.xSouce, route.ySource,
			L["Use"].." "..portDesc, route.spell)
		elseif route.mSource==route.mPort then
			DGV:AddRouteWaypointWithNoTrigger(route.mSource, route.fSource,
				route.xSouce, route.ySource,
				L["Use"].." "..portDesc)
			DGV:AddRouteWaypoint(route.mPort, route.fPort,
				route.xPort, route.yPort,
				L["Use"].." "..portDesc)
		else
			DGV:AddRouteWaypointWithDestinationTrigger(route.mSource, route.fSource,
				route.xSouce, route.ySource,
				L["Use"].." "..portDesc, route.mPort)
		end
		return route.tail.builder:AddWaypoint(route.tail, description)
	end
	RouteBuilders.InstancePortals.AddWaypoint = RouteBuilders.StaticPortals.AddWaypoint
	RouteBuilders.LocalPortals.AddWaypoint = RouteBuilders.StaticPortals.AddWaypoint
	
	function RouteBuilders.Boats.Iterate(prevBest, parentRoute, m1, f1, x1, y1, m2, f2, x2, y2, lastRoute, control, continentZoom, c1, c2)
		if not c1 then
			c1,c2 = (DGV:GetCZByMapId(m1)), DGV:GetCZByMapId(m2)
		end
		if c1==0 or c2==0 then return end
		
		if not control then control=0;continentZoom=0 end
		control = control+1

        --without this workaround there is an exception related to bonus objectives
        if TaxiData.BoatData[c2] == nil then
            return
        end
		
		local data = TaxiData.BoatData[c2][control]
		
		if not data then
			if continentZoom==0 then
				control = 0
				continentZoom = 1
				return RouteBuilders.Boats.Iterate(prevBest, parentRoute, m1, f1, x1, y1, m2, f2, x2, y2, lastRoute, control, continentZoom, c1, c2)
			else
				return
			end
		end
		local sourceMapId = tonumber(strmatch(data, "(%d*):"))
		local cSource = DGV:GetCZByMapId(sourceMapId)
		if (continentZoom==0 and cSource==c1) or (continentZoom==1 and cSource~=c1) then
			local portBuild = RouteBuilders.Boats:Build(
				prevBest, parentRoute, 
				c1, m1, f1, x1, y1, m2, f2, x2, y2, data)
			if portBuild then
				return portBuild, control, continentZoom, c1, c2
			end
		end
		return RouteBuilders.Boats.Iterate(prevBest, parentRoute, m1, f1, x1, y1, m2, f2, x2, y2, lastRoute, control, continentZoom, c1, c2)
	end
	
	function RouteBuilders.Boats:Build(best, parentRoute, c1, m1, f1, x1, y1, m2, f2, x2, y2, data)
		local sourceMapIdString,sourceFloorString,sourceLocString,
			destMapIdString,destFloorString,destLocString,waitString,engVehicle = 
			CheckRequirements(9, strsplit(":", data))
		if not engVehicle then return end
		
		local mPort = tonumber(destMapIdString)
		--if CheckStackLoop(parentRoute, mPort) then return end
		
		local mSource,fSource,xSouce,ySource =
			tonumber(sourceMapIdString), tonumber(sourceFloorString),
			DGV:UnpackXY(sourceLocString)
		local cSource =  DGV:GetCZByMapId(mSource)
		if cSource==DGV:GetCZByMapId(mPort) and (cSource~=c1 or cSource~=DGV:GetCZByMapId(m2)) then return end
		--if cSource~=c1 then return end
		local fPort,xPort,yPort = 
			tonumber(destFloorString), 
			DGV:UnpackXY(destLocString)
		
		if CheckStackLoop(parentRoute, mPort) then return end
		
		local route = GetCreateRoute(self, best, parentRoute)
		route.builder = self
		route.engVehicle = engVehicle
		route.wait = tonumber(waitString)
		route.mSource, route.fSource, route.xSouce, route.ySource,
			route.mPort, route.fPort, route.xPort, route.yPort = 
			mSource, fSource, xSouce, ySource,
			mPort, fPort, xPort, yPort
			
		if not IsBest(route) then
			--DGV:DebugFormat("Boats:Build eliminated")
			PoolRoute(route)
			return
		end
			
		route.tail = Taxi:GetBestRoute(route,
			mPort,fPort,xPort,yPort, m2, f2, x2, y2,
			RouteBuilders.UnboundTeleport,
			RouteBuilders.BoundTeleport,
			RouteBuilders.ZenPilgrimageReturn,
			RouteBuilders.StaticPortals,
			RouteBuilders.InstanceExit,
			RouteBuilders.Boats)
		if route.tail then
			tinsert(route, route.tail)
		end
		if not route.tail
			or not IsBest(route)
		then
			PoolRoute(route)
			return
		end

		route.head = Taxi:GetBestRoute(route,
			m1, f1, x1, y1, mSource, fSource, xSouce, ySource)
		if not route.head then
			PoolRoute(route)
			return
		else
			tinsert(route, route.head)
		end
		
		return route
	end
	
	function RouteBuilders.Boats:Estimate(route)
		local est = route.estimate
		if not est then
			local headEst = (route.head and route.head.builder:Estimate(route.head)) or 0
			local tailEst = (route.tail and route.tail.builder:Estimate(route.tail)) or 0
			est = headEst + tailEst + route.wait
			if headEst~=0 and tailEst~=0 then
				route.estimate = est
			end
		end
		return est
	end

	function RouteBuilders.Boats:AddWaypoint(route, description)
		local locVehicle = L[route.engVehicle]
		local boatDesc = string.format(
			L["%s %s in %s"], 
			DGV:GetMapNameFromID(route.mPort),
			locVehicle,
			DGV:GetMapNameFromID(route.mSource))
		route.head.builder:AddWaypoint(route.head, boatDesc)
		
		if route.mSource==route.mPort then
			DGV:AddRouteWaypointWithNoTrigger(route.mSource, route.fSource,
				route.xSouce, route.ySource,
				L["Use"].." "..locVehicle)
			DGV:AddRouteWaypoint(route.mPort, route.fPort,
				route.xPort, route.yPort,
				L["Use"].." "..locVehicle)		
		else
			DGV:AddRouteWaypointWithDestinationTrigger(route.mSource, route.fSource,
				route.xSouce, route.ySource, 
				L["Take"].." "..boatDesc, route.mPort)
		end
		return route.tail.builder:AddWaypoint(route.tail, description)
	end
	
	local order = {
		"Character",
		"InstancePortals",
		"InstanceExit",
		"FlightMaster",
		"LocalPortals",
		"BoundTeleport",
		"UnboundTeleport",
		"ZenPilgrimageReturn",
		"StaticPortals",
		"Boats",
	}
	
	--local gbrCount = 0
	function Taxi:GetBestRoute(parentRoute, m1, f1, x1, y1, m2, f2, x2, y2, ...)
		local best
		local dontIterate = GetCreateTable(...)
		local builder =  nil
	
		for _,builderKey in ipairs(order) do
			builder = RouteBuilders[builderKey]
			if builder.Iterate and not tContains(dontIterate, builder) and
				not (builder==RouteBuilders.FlightMaster and DGV:UserSetting(DGV_TAXIFLIGHTMASTERS)=="Never")
			then
				local iteratorData = GetCreateTable()
				
--DGV:DebugFormat("GetBestRoute", "iter", iter, "invariant", invariant, "control", control)
				while true do
					iteratorData:SetList(builder.Iterate(best, parentRoute, m1, f1, x1, y1, m2, f2, x2, y2, iteratorData:Unpack()))
					local route = iteratorData[1]
					if not route then break end
					route.currentBest = best
					if not best then best = route
					elseif IsBest(route) then
						PoolRoute(best)
						best = route
					else
						PoolRoute(route)
					end
					YieldAutoroutine()
				end
				tPool(iteratorData)
			end
		end
		tPool(dontIterate)
		return best
	end
	
	local encapsulatedZones = 
	{
-- 		[864] = 30,
-- 		[866] = 27,
-- 		[888] = 41,
-- 		[889] = 4,
-- 		[890] = 9,
-- 		[891] = 4,
-- 		[892] = 20,
-- 		[893] = 462,
-- 		[894] = 464,
-- 		[895] = 27,
		[27] = "866:895",
		[30] = 864,
		[41] = 888,
		[4] = "889:891",
		[20] = 892,
		[462] = 893,
		[464] = 894,
		[9] = 890,
	}
		
	local function CheckBoundsOfTranslation(m1, f1, x1, y1, m2, f2)
		local chkX, chkY = DGV:TranslateWorldMapPosition(m1, f1, x1, y1, m2, f2)
		if chkX and chkY and 
			chkX>=0 and chkX<=1 and 
			chkY>=0 and chkY <=1 
		then return m2, f2, chkX, chkY
		else return end
	end
	
	local function CheckEncapsulatedZones(playerM, m, f, x, y)
		if f~=0 then return m, f, x, y end
		local encMs = encapsulatedZones[m]
		local encM = tonumber(encMs)
		if encM then
			if encM==playerM then
				local chkM, chkF, chkX, chkY = CheckBoundsOfTranslation(m, f, x, y, encM, 0)
				if chkM then return chkM, chkF, chkX, chkY end
			end
		elseif encMs then
			local encs = GetCreateTable(strsplit(":", encMs))
			for _, encM in ipairs(encs) do
				local m2, f2, x2, y2 = tonumber(encM)
				if m2==playerM then
					m2, f2, x2, y2 =  CheckBoundsOfTranslation(m, f, x, y, m2, 0)
					if m2 then
						m, f, x, y = m2, f2, x2, y2
						break
					end
				end
			end
			tPool(encs)
		end
		return m, f, x, y
	end

	function DGV:SetSmartWaypoint(mapID, mapFloor, x, y, desc, originMap, originFloor, originX, originY)
		originX, originY = originX and originX/100, originY and originY/100
		if not mapID then mapID = GetCurrentMapAreaID() end
		if not mapFloor then
			mapFloor = (mapID==321 and 1) or (mapID==504 and 1) or 0 --again with Orgrimmar or Dalaran
		end
		
		pm, pf, px, py =  DGV:GetPlayerMapPositionDisruptive()
		if not pm then return end
		mapID, mapFloor, x, y = CheckEncapsulatedZones(pm, mapID, mapFloor, x/100, y/100)
		
		local corpseM, corpseF, corpseX, corpseY = DGV.Modules.Corpse:GetPosition()
		if not originMap then
			if corpseM and DGV:UserSetting(DGV_SHOWCORPSEARROW) then
				originMap, originFloor, originX, originY = corpseM, corpseF, corpseX, corpseY
			else
				originMap, originFloor, originX, originY = pm, pf, px, py
			end
		end
		
		local route = Taxi:GetBestRoute(nil, originMap, originFloor, originX, originY, mapID, mapFloor, x, y)
		if not route then
			--DGV:DebugFormat("SetSmartWaypoint", "route", route)
			return
		end
		if corpseM and DGV:UserSetting(DGV_SHOWCORPSEARROW) then
			DGV:AddCorpseWaypoint(corpseM, corpseF, corpseX, corpseY, L["My Corpse"])
		end
		local point = route.builder:AddWaypoint(route, desc)
		PoolRoute(route)
		return point
	end
	
	function DGV:SPELLS_CHANGED()
		Taxi:ResetMovementCache()
	end

	function Taxi:Load()
		DGV:RegisterEvent("SPELLS_CHANGED")
		DGV:RegisterEvent("CONFIRM_BINDER")
		DGV:RegisterEvent("UNIT_SPELLCAST_START")
	end
	
	function Taxi:Unload()
		DGV:UnregisterEvent("SPELLS_CHANGED")
		DGV:UnregisterEvent("CONFIRM_BINDER")
		DGV:UnregisterEvent("UNIT_SPELLCAST_START")
	end
	
	local function GetMapIDFromDungeonName(destName)
		for key in pairs(TaxiData.InstancePortals) do
			if destName==GetMapNameByID(key) then
				return key
			end
		end
	end
end
