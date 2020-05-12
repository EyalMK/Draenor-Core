local DGV = DugisGuideViewer
if not DGV then return end
local L = DugisLocals
local _

local WMT = DGV:RegisterModule("WorldMapTracking")
WMT.essential = true

function WMT:Initialize()
    if DugisGuideUser.excludedTrackingPoints == nil then
        DugisGuideUser.excludedTrackingPoints = {}
    end

	local trackingIndex =
	{
		["Interface\\Minimap\\Tracking\\Auctioneer"] = 1,
		["Interface\\Minimap\\Tracking\\Banker"] = 2,
		["Interface\\Minimap\\Tracking\\BattleMaster"] = 3,
		["Interface\\Minimap\\Tracking\\Class"] = 4,
		["Interface\\Minimap\\Tracking\\FlightMaster"] = 5,
		["Interface\\Minimap\\Tracking\\Food"] = 6,
		["Interface\\Minimap\\Tracking\\Innkeeper"] = 7,
		["Interface\\Minimap\\Tracking\\Mailbox"] = 8,
		["Interface\\Minimap\\Tracking\\Poisons"] = 9,
		["Interface\\Minimap\\Tracking\\Profession"] = 10,
		["Interface\\Minimap\\Tracking\\Reagents"] = 11,
		["Interface\\Minimap\\Tracking\\Repair"] = 12,
		["Interface\\Icons\\tracking_wildpet"] = 13
	}

	local trackingMap = {}
	local real_GetTrackingInfo = GetTrackingInfo
	do
		local i;
		for i=1,GetNumTrackingTypes() do
			local _,icon,_,info = real_GetTrackingInfo(i)
			
			if trackingIndex[icon] then
				trackingMap[trackingIndex[icon]] = i
			end
		end
	end
	
	local function GetTrackingInfo(id)
		if id==4 then
			return L["Class Trainer"], "Interface\\Minimap\\Tracking\\Class", DGV.chardb.ClassTrainerTrackingEnabled
		end
		return real_GetTrackingInfo(trackingMap[id])
	end

	local function UnspecifyMapName(mapName)
		if not mapName then return end
		local dropUnderscoreMapName = string.match(mapName, "[^_]*")
		if dropUnderscoreMapName~=mapName then return dropUnderscoreMapName end
	end
	WMT.UnspecifyMapName = UnspecifyMapName
	
	local function IterateTrackingTypes()
		local count = GetNumTrackingTypes();
		local id = 0
		return function()
			id = id + 1
			if id<=count then return id, GetTrackingInfo(id) end --name, texture, active, category
		end
	end

	local professionTable = setmetatable({},
	{
		__index = function(t,i)
			local spell = tonumber(i)
			local v = i
			if spell then
				v = (GetSpellInfo(i))
			end
			return L[v]
		end,
	})

	local englishProfessionTable= setmetatable(
	{
		["2259"]	= "Alchemy",
		["3100"]	= "Blacksmithing",
		["7411"]	= "Enchanting",
		["4036"]	= "Engineering",
		["45357"]	= "Inscription",
		["25229"]	= "Jewelcrafting",
		["2108"]	= "Leatherworking",
		["3908"]	= "Tailoring",
		["2575"]	= "Mining",
		["8613"]	= "Skinning",
		["2550"]	= "Cooking",
		["3273"]	= "First Aid",
		["131474"]	= "Fishing",
	},
	{__index=function(t,k) rawset(t, k, k); return k; end})

	local DataProviders = {
		--["Mailbox"] = {},
		["Vendor"] = {},
		["ClassTrainer"] = {},
		["ProfessionTrainer"] = {},
		["Banker"] = {},
		["Battlemaster"] = {},
		["Achievement"] = {},
		["RareCreature"] = {},
		["PetBattles"] = {},
	}
	WMT.DataProviders = DataProviders

	function DataProviders.IterateProviders(invariant, control)
		while true do
			local value
			control,value = next(DataProviders, control)
			if not control then return end
			if type(value)=="table" then 
				return control,value 
			end
		end
	end
	
	function DataProviders:SelectProvider(trackingType, location, ...)
		for k,v in DataProviders.IterateProviders do
			if v.ProvidesFor and v:ProvidesFor(trackingType, location, ...) then
				return v
			end
		end
	end
	
	local function ValidateTrackingType(arg, ...)
		if not DataProviders:SelectProvider(arg) and tonumber(arg)~=8 then
			DGV:DebugFormat("WorldMapTracking invalid data", "|cffff2020tracking type|r", arg, "data", (strjoin(":", ...)))
		end
	end
	
	local function ValidateNumber(arg, ...)
		if not tonumber(arg) then
			DGV:DebugFormat("WorldMapTracking invalid data", "|cffff2020number|r", arg, "data", (strjoin(":", ...)))
		end
	end
	
	local function ValidateCoords(arg, ...)
		local x,y = DGV:UnpackXY(arg)
		if not y or x>1 or y>1 then
			DGV:DebugFormat("WorldMapTracking invalid data", "|cffff2020coord|r", arg, "data", (strjoin(":", ...)))
		end
	end
	
	function DataProviders:IsTrackingEnabled(provider, trackingType, ...)
		provider = provider or self:SelectProvider(trackingType, location, ...)
		if provider and provider.IsTrackingEnabled then
			return provider:IsTrackingEnabled(trackingType, ...)
		else
			return select(3,GetTrackingInfo(trackingType))
		end
	end
	
	function DataProviders:GetTooltipText(provider, trackingType, location, ...)
		provider = provider or self:SelectProvider(trackingType, location, ...)
		if provider and provider.GetTooltipText then
			return provider:GetTooltipText(trackingType, location, ...)
		else
			return (GetTrackingInfo(trackingType))
		end
	end

	function DataProviders:ShouldShow(provider, trackingType, location, ...)
		ValidateTrackingType(trackingType, trackingType, location, ...)
		ValidateCoords(location, trackingType, location, ...)
		provider = provider or self:SelectProvider(trackingType, location, ...)
		if provider and provider.ShouldShow then
			return provider:ShouldShow(trackingType, location, ...)
		else
			return DGV:CheckRequirements(...)
		end
	end
	
	function DataProviders:GetIcon(provider, trackingType, location, ...)
		provider = provider or self:SelectProvider(trackingType, location, ...)
		if provider and provider.GetIcon then
			return provider:GetIcon(trackingType, location, ...)
		else
			return select(2,GetTrackingInfo(trackingType))
		end
	end
	
	function DataProviders:ShouldShowMinimap(provider, trackingType, location, ...)
		provider = provider or self:SelectProvider(trackingType, location, ...)
		if provider and provider.ShouldShowMinimap then
			return provider:ShouldShowMinimap(trackingType, location, ...)
		else
			return false
		end
	end
	
	function DataProviders:GetNPC(provider, trackingType, location, ...)
		provider = provider or self:SelectProvider(trackingType, location, ...)
		if provider and provider.GetNPC then
			return provider:GetNPC(trackingType, location, ...)
		else return end
	end
	
	function DataProviders:GetDetailIcon(provider, trackingType, location, ...)
		provider = provider or self:SelectProvider(trackingType, location, ...)
		if provider and provider.GetDetailIcon then
			return provider:GetDetailIcon(trackingType, location, ...)
		else return end
	end
	
	function DataProviders:GetCustomTrackingInfo(provider, trackingType, location, ...)
		provider = provider or self:SelectProvider(trackingType, location, ...)
		if provider and provider.GetCustomTrackingInfo then
			return provider:GetCustomTrackingInfo(trackingType, location, ...)
		else return end
	end

	local function GetNPCTT1(trackingType, location, npc)
		if DGV.GetLocalizedNPC then
			return DGV:GetLocalizedNPC(npc)
		end
	end

	function DataProviders.Vendor:ProvidesFor(trackingType)
		return trackingType==1 or trackingType==5 or trackingType==6  or trackingType==7 or
			trackingType==9 or trackingType==11 or trackingType==12
	end

	function DataProviders.Vendor:ShouldShow(trackingType, location, npc, subZone, ...)
		ValidateNumber(npc, trackingType, location, npc, subZone, ...)
		if not DGV:CheckRequirements(...) then return end
		local class = select(2,UnitClass("player"))
		if (trackingType==9 and class~="ROGUE") then return false end
		return true
	end

	function DGV:GetFlightMasterName(npc)
		return DataProviders.Vendor:GetTooltipText(5, nil, npc)
	end

	function DataProviders.Vendor:GetTooltipText(trackingType, ...)
		return GetNPCTT1(trackingType, ...) or (GetTrackingInfo(trackingType)) 
	end
	
	function DataProviders.Vendor:GetNPC(trackingType, location, npc)
		return npc
	end

	function DataProviders.ClassTrainer:ProvidesFor(trackingType)
		return trackingType==4
	end

	local function GetGildedNPCTooltip(guildFunc, ...)
		local tt1 = GetNPCTT1(...)
		local tt2;
		if tt1 then tt2 = "<"..guildFunc(...)..">" end
		return tt1 or guildFunc(...), tt2
	end
	
	function DataProviders.ClassTrainer:GetTooltipText(trackingType, location, npc, class, gender)
		local genderString = ""
		if gender=="F" then genderString=" Female" end
		return GetGildedNPCTooltip(
			function(trackingType, location, npc, class) return L[class.." Trainer"..genderString] end,
					trackingType, location, npc, class, gender)
	end

	function DataProviders.ClassTrainer:ShouldShow(trackingType, location, npc, class)
		ValidateNumber(npc, trackingType, location, npc, class)
		return class:lower()==select(2,UnitClass("player")):lower() and true
	end
	
	function DataProviders.ClassTrainer:GetNPC(trackingType, location, npc)
		return npc
	end
	
	function DataProviders.ClassTrainer:IsTrackingEnabled()
		return DGV.chardb.ClassTrainerTrackingEnabled
	end
	
	function DataProviders.ClassTrainer:GetIcon()
		return "Interface\\Minimap\\Tracking\\Class"
	end
	
	function DataProviders.ClassTrainer:ShouldShowMinimap()
		return true
	end

	function DataProviders.ProfessionTrainer:ProvidesFor(trackingType)
		return trackingType==10
	end
	
	function DataProviders.ProfessionTrainer:GetTooltipText(trackingType, location, npc, spell, gender)
		local genderString = ""
		if gender=="F" then genderString=" Female" end
		return GetGildedNPCTooltip(
			function(trackingType, location, npc, spell) return L[englishProfessionTable[spell].." Trainer"..genderString] end,
					trackingType, location, npc, spell)
	end
	
	function DataProviders.ProfessionTrainer:ShouldShow(trackingType, location, npc, spell, gender, ...)
		ValidateNumber(npc, trackingType, location, npc, spell, gender, ...)
		if not DGV:CheckRequirements(...) then return end
		local spellNum = tonumber(spell)
		local class = select(2,UnitClass("player"))
		if (spell=="Portal" and class~="MAGE") or
			(spell=="Pet" and class~="HUNTER")
		then return false end
		--[[if not spellNum then return true end
		local prof1, prof2 = GetProfessions()
		return (not prof1) or (not prof2) or --unchosen professions
			spellNum==2550 or spellnum==3273 or spellNum==131474 or --cooking,first aid,fishing,
			IsUsableSpell(GetSpellInfo(spellNum))]]
		return true
	end
	
	function DataProviders.ProfessionTrainer:GetNPC(trackingType, location, npc)
		return npc
	end

	function DataProviders.Banker:ProvidesFor(trackingType)
		return trackingType==2
	end
	
	function DataProviders.Banker:GetTooltipText(...)
		return GetGildedNPCTooltip(
			function(...) return L["Banker"] end, ...)
	end
	
	function DataProviders.Banker:GetNPC(trackingType, location, npc)
		return npc
	end

	function DataProviders.Battlemaster:ProvidesFor(trackingType)
		return trackingType==3
	end
	
	function DataProviders.Battlemaster:GetTooltipText(...)
		return GetGildedNPCTooltip(
			function(...) return L["Battlemaster"] end, ...)
	end
	
	function DataProviders.Battlemaster:GetNPC(trackingType, location, npc)
		return npc
	end
	
--[[	function DataProviders.Achievement:ProvidesFor(trackingType)
		return trackingType=="A"
	end
	
	function DataProviders.Achievement:GetTooltipText(trackingType, location, achievementId, criteriaIndex, extraToolTip)
		achievementId = tonumber(achievementId)
		local tt1, _, _, _, _, _, tt2 = select(2, GetAchievementInfo(achievementId))
		if tt2 then
			tt2 = format("\n|cffffffff%s", tt2)
		end
		local tt3
		criteriaIndex = tonumber(criteriaIndex)

		local achievementNum = tonumber(GetAchievementNumCriteria(achievementId))		
		
		if criteriaIndex and criteriaIndex <= achievementNum then
			tt3 = format("\n|cff9d9d9d%s", GetAchievementCriteriaInfo(achievementId, criteriaIndex))
		end
		if extraToolTip=="" then extraToolTip=nil end
		if extraToolTip then
            if extraToolTip:match("[{].*[}]") ~= nil then
                extraToolTip = string.gsub(extraToolTip, '[{}]', '')
                extraToolTip = L[extraToolTip]
            end
			extraToolTip = format("\n|cffffffff%s", extraToolTip)
		end
		return tt1, tt2, tt3,extraToolTip
	end
	
	function DataProviders.Achievement:ShouldShow(trackingType, location, achievementId, criteriaIndex, extraToolTip, questId, ...)
		ValidateNumber(achievementId, trackingType, location, achievementId, criteriaIndex, extraToolTip, questId, ...)

		questId = tonumber(questId)
		if questId and IsQuestFlaggedCompleted(questId) then return end

		achievementId = tonumber(achievementId)
		if achieveID ~= 6856 and 
			achieveID ~= 6716 and 
			achieveID ~= 6846 and 
			achieveID ~= 6754 and 
			achieveID ~= 6857 and 
			achieveID ~= 6850 and 
			achieveID ~= 6855 and 
			achieveID ~= 6847 and 
			achieveID ~= 6858 and -- Exclude lorewalker achievement 
			DGV:UserSetting(DGV_ACCOUNTWIDEACH) then -- Account Wide Achievement setting
			local completed = select(4, GetAchievementInfo(achievementId))
			if completed then return end
		end 
		criteriaIndex = tonumber(criteriaIndex)
		local criteriaNum = tonumber(GetAchievementNumCriteria(achievementId))
		if criteriaIndex and criteriaIndex <= criteriaNum and select(3, GetAchievementCriteriaInfo(achievementId, criteriaIndex)) then
			return 
		end
		return true
	end
	
	function DataProviders.Achievement:IsTrackingEnabled()
		return DGV.chardb.AchievementTrackingEnabled
	end
	
	function DataProviders.Achievement:GetIcon(trackingType, location, achievementId, criteriaIndex, extraToolTip, questId, ...)
		questId = tonumber(questId)
		if questId then
			return "Interface\\AddOns\\DugisGuideViewerZ\\Artwork\\treasure"
		else
			return "Interface\\AddOns\\DugisGuideViewerZ\\Artwork\\AchievementIcon"
		end
	end
	
	function DataProviders.Achievement:ShouldShowMinimap()
		return true
	end
	
	function DataProviders.Achievement:GetCustomTrackingInfo()
		return "Track Achievements", "Interface\\AddOns\\DugisGuideViewerZ\\Artwork\\AchievementIcon",
				function() return DGV.chardb.AchievementTrackingEnabled end,
				function(value) DGV.chardb.AchievementTrackingEnabled = value end
	end
	
	function DataProviders.RareCreature:ProvidesFor(trackingType)
		return trackingType=="R"
	end
	
	function DataProviders.RareCreature:GetTooltipText(trackingType, location, npc, extraToolTip)
		local tt1 = GetNPCTT1(trackingType, location, npc)
		if extraToolTip=="" then extraToolTip=nil end
		if extraToolTip then
			extraToolTip = format("|cffffffff%s", extraToolTip)
		end
		return tt1 or extraToolTip, tt1 and extraToolTip
	end
	
	function DataProviders.RareCreature:ShouldShow(trackingType, location, npc, extraToolTip, questId, ...)
		ValidateNumber(npc, trackingType, location, npc, extraToolTip, questId, ...)
		questId = tonumber(questId)
		if questId and IsQuestFlaggedCompleted(questId) then return end
		return true
	end
	
	function DataProviders.RareCreature:IsTrackingEnabled()
		return DGV.chardb.RareCreatureTrackingEnabled
	end
	
	function DataProviders.RareCreature:GetIcon()
		return "Interface\\AddOns\\DugisGuideViewerZ\\Artwork\\BossIcon"
	end
	
	function DataProviders.RareCreature:ShouldShowMinimap()
		return true
	end
	
	function DataProviders.RareCreature:GetNPC(trackingType, location, npc)
		return npc
	end
	
	function DataProviders.RareCreature:GetCustomTrackingInfo()
		return "Track Rare Creatures", "Interface\\AddOns\\DugisGuideViewerZ\\Artwork\\BossIcon",
				function() return DGV.chardb.RareCreatureTrackingEnabled end,
				function(value) DGV.chardb.RareCreatureTrackingEnabled = value end
	end
--]]	
	local petJournalLookup = {}
	--_G["BATTLE_PET_NAME_"..i]
	function DGV:PopulatePetJournalLookup()
		DGV:UnregisterEvent("PET_JOURNAL_LIST_UPDATE")
		DGV:DebugFormat("PopulatePetJournalLookup")
			C_PetJournal.SetFlagFilter(LE_PET_JOURNAL_FLAG_COLLECTED, true)
		C_PetJournal.SetFlagFilter(LE_PET_JOURNAL_FLAG_FAVORITES, false)
		C_PetJournal.SetFlagFilter(LE_PET_JOURNAL_FLAG_NOT_COLLECTED, true)
		C_PetJournal.AddAllPetTypesFilter()
		C_PetJournal.AddAllPetSourcesFilter()
		wipe(petJournalLookup)
		for i=1,C_PetJournal.GetNumPets(false) do
			local _,speciesID,collected,_,_,_,_,speciesName,_,familyType,creatureID,_,flavorText = 
				C_PetJournal.GetPetInfoByIndex(i)
			petJournalLookup[speciesID] = 
					string.format("%d:%s:%s:%d:%d", creatureID, speciesName, flavorText:gsub("(:)", "%%3A"), familyType, collected and 1)
		end
		DGV:RegisterEvent("PET_JOURNAL_LIST_UPDATE")
	end
	
	local lastNumPets = 0
	function DGV:PET_JOURNAL_LIST_UPDATE()
		local _, num = C_PetJournal.GetNumPets(false)
		if num~=lastNumPets then
			DGV:PopulatePetJournalLookup()
			lastNumPets = num
		end
	end
	
	function DataProviders.PetBattles:ProvidesFor(trackingType)
		return trackingType=="P"
	end
	
	function DataProviders.PetBattles:GetTooltipText(trackingType, location, speciesID, extraToolTip)
		local value = petJournalLookup[tonumber(speciesID)]
		if not value then
			DGV:DebugFormat("GetTooltipText Unknown speciesID", "speciesID", speciesID)
			return
		end
		local _, speciesName, flavorText, familyType, collected = strsplit(":", value)
		if flavorText then
			flavorText = format("\"%s\"", flavorText:gsub("(%%3A)", ":"))
		end
		if extraToolTip=="" then extraToolTip=nil end
		if extraToolTip then
			extraToolTip = format("|cffffffff%s", extraToolTip)
		end
		if familyType then
			DGV:DebugFormat("PetBattles:GetTooltipText", "familyType", familyType)
			familyType = format("|cffffffff%s", _G["BATTLE_PET_NAME_"..familyType])
		end
		if collected then
			if tonumber(collected)>0 then
				collected = format("|cff20ff20%s", L["Collected"])
			else
				collected = format("|cffff2020%s", L["Not Collected"])
			end
		end
		return speciesName, nil, familyType, collected, extraToolTip -- no flavorText for now. 
	end
	
	function DataProviders.PetBattles:ShouldShow(trackingType, location, speciesID, ...)
		ValidateNumber(speciesID, trackingType, location, speciesID, ...)
        
        if DGV:UserSetting(DGV_DISPLAYUNCOLLECTEDPETSONLY) == true then   
            local value = petJournalLookup[tonumber(speciesID)]
            if not value then
                return false
            end
            
            local _, _, _, _, collected = strsplit(":", value)
            
            return tonumber(collected)==0 
        else
            return true
        end            
	end
	
	function DataProviders.PetBattles:IsTrackingEnabled()
		return select(3,GetTrackingInfo(13))
	end
	
	function DataProviders.PetBattles:GetIcon(trackingType, location, speciesID, criteriaIndex, extraToolTip, ...)
		return DataProviders.PetBattles:GetDetailIcon(_, _, speciesID)
	end
	
	function DataProviders.PetBattles:ShouldShowMinimap()
		return false
	end
	
	function DataProviders.PetBattles:GetNPC(trackingType, location, speciesID)
		local value = petJournalLookup[tonumber(speciesID)]
		if not value then return end
		return tonumber((strsplit(":", value)))
	end
	
	function DataProviders.PetBattles:GetDetailIcon(trackingType, location, speciesID)
		if not petJournalLookup[tonumber(speciesID)] then return end
		local familyType = tonumber((select(4, strsplit(":", petJournalLookup[tonumber(speciesID)]))))
		if PET_TYPE_SUFFIX[familyType] then
			return "Interface\\PetBattles\\PetIcon-"..PET_TYPE_SUFFIX[familyType];
		else
			return "Interface\\PetBattles\\PetIcon-NO_TYPE";
		end
	end

	function DGV:UnpackXY(coord)
-- 		if not tonumber(coord) then
-- 		  DGV:DebugFormat("UnpackXY", "coord", coord, "stack", debugstack())
-- 		end
		if type(coord)=="string" then
			local xString,yString = coord:match("(%d+.%d+),(%d+%.%d+)")
			if yString then
				return tonumber(xString)/100, tonumber(yString)/100
			end
		end
		if not tonumber(coord) then return end
		local factor = 2^16
		local x,y =  floor(coord / factor) / factor, (coord % factor) / factor
		--DGV:DebugFormat("GetXY", "x", x, "y", y)
		return x,y
	end

	--local trackingStates = nil
	local trackingPoints = {}
	WMT.trackingPoints = trackingPoints
	local function UpdateTrackingFilters()
		local mapID, level = GetCurrentMapAreaID(), GetCurrentMapDungeonLevel()
		for _,point in ipairs(trackingPoints) do
			local trackingType, coord = unpack(point.args)
            local id = point.args[3]
            
            local id1 = point.args[1] or ""
            local id2 = point.args[2] or ""
            local id3 = point.args[3] or ""
            local pointKey = id1..id2..id3
              
			if 
				DataProviders:ShouldShow(point.provider, unpack(point.args)) and
				DataProviders:IsTrackingEnabled(point.provider, unpack(point.args)) and
                DugisGuideUser.excludedTrackingPoints and 
                DugisGuideUser.excludedTrackingPoints[pointKey] ~= true
			then
				if not point:IsShown() then
					local icon = DataProviders:GetIcon(point.provider, unpack(point.args))
					if trackingType == "P" then
						point.icon:SetTexture(icon)
						point.icon:SetTexCoord(0.79687500, 0.49218750, 0.50390625, 0.65625000)
					else
						point.icon:SetTexture(icon)
						point.icon:SetTexCoord(0, 1, 0, 1)
					end
					point:SetHeight(14)
					point:SetWidth(14)
					point:Show()
					if point.minimapPoint then
						point.minimapPoint.icon:SetTexture(icon)
						point.minimapPoint:SetHeight(14)
						point.minimapPoint:SetWidth(14)
						point.minimapPoint:Show()
						DugisGuideViewer:PlaceIconOnMinimap(
							point.minimapPoint, mapID, level, DGV:UnpackXY(coord))
					end
					DGV:PlaceIconOnWorldMap(WorldMapButton, point, mapID, level, DGV:UnpackXY(coord) )
				end
			else
				point:Hide()
			end
		end
	end

	hooksecurefunc("SetTracking", UpdateTrackingFilters)
	hooksecurefunc("ClearAllTracking", UpdateTrackingFilters)

	local function AddWaypoint(point)
        if DGV:IsModuleRegistered("Target") and DGV:UserSetting(DGV_TARGETBUTTON) then
			local npcId = DataProviders:GetNPC(point.provider, unpack(point.args))
			
			if npcId then
				DGV:SetNPCTarget(npcId)
				if DGV:UserSetting(DGV_TARGETBUTTONSHOW) then 
					DugisGuideViewer.Modules.Target.Frame:Show()
				end

				if DGV:IsModuleRegistered("ModelViewer") and DGV.Modules.ModelViewer.Frame and DGV.Modules.ModelViewer.Frame:IsShown() then
					DGV.Modules.ModelViewer:SetModel(npcId)
				end
			end
		end
    
		local x, y = DGV:UnpackXY(point.args[2])
		DGV:AddCustomWaypoint(
			x, y, DataProviders:GetTooltipText(point.provider, unpack(point.args)),
			GetCurrentMapAreaID(), GetCurrentMapDungeonLevel())
	end

	local function point_OnClick(self, button)
		self = self.point or self
		if button == "RightButton" then
			local menu = DGV.ArrowMenu:CreateMenu()
			DGV.ArrowMenu:CreateMenuTitle(menu,
					DataProviders:GetTooltipText(self.provider, unpack(self.args)))
			local setWay = DGV.ArrowMenu:CreateMenuItem(menu, L["Set as waypoint"])
			setWay:SetFunction(function ()
				DGV:RemoveAllWaypoints()
				AddWaypoint(self)
			end)
			local addWay = DGV.ArrowMenu:CreateMenuItem(menu, L["Add waypoint"])
			addWay:SetFunction(function () AddWaypoint(self)  end)
                 local id1 = self.args[1] or "" 
                 local id2 = self.args[2] or "" 
                 local id3 = self.args[3] or "" 
                 local pointKey = id1..id2..id3
			local removeTracking = DGV.ArrowMenu:CreateMenuItem(menu, L["Remove tracking"])
			removeTracking:SetFunction(function () 
                DugisGuideUser.excludedTrackingPoints[pointKey] = true
                WorldMapFrame_UpdateMap()
            end)
            
			local trackingTypeText = (GetTrackingInfo(self.args[1]))
			if trackingTypeText then
				local untrack = DGV.ArrowMenu:CreateMenuItem(menu,
					string.format(L["Remove %s Tracking"], trackingTypeText))
				untrack:SetFunction(function ()
					MiniMapTracking_SetTracking(nil, self.args[1], nil, false)
				end)
			end
			menu:ShowAtCursor()
		elseif button == "LeftButton" then
			if not IsShiftKeyDown() then
				DGV:RemoveAllWaypoints()
			end
			AddWaypoint(self)
		end
	end
	
	local toolTipIconTexture
	local overPoint
	local function DugisWaypointTooltip_OnShow()
		if DugisWaypointTooltipTextLeft1 and overPoint and overPoint.toolTipIcon then
			local height = DugisWaypointTooltipTextLeft1:GetHeight()
			local width = DugisWaypointTooltipTextLeft1:GetWidth()
			if not toolTipIconTexture then
				toolTipIconTexture = DugisWaypointTooltip:CreateTexture("ARTWORK")
				toolTipIconTexture:SetPoint("TOPRIGHT", -5, -5)
				toolTipIconTexture:SetWidth(height+5)
				toolTipIconTexture:SetHeight(height+5)
			end
			DugisWaypointTooltip:SetMinimumWidth(20+width+20+height)
			toolTipIconTexture:SetTexture(overPoint.toolTipIcon)
			toolTipIconTexture:SetTexCoord(0.79687500, 0.49218750, 0.50390625, 0.65625000) --temporary pet journal solution
			toolTipIconTexture:Show()
		elseif toolTipIconTexture then
			toolTipIconTexture:Hide()
		end
	end
    
    DugisWaypointTooltip.updateDugisWaypointTooltipLines = function()
        DugisWaypointTooltip:ClearLines()
        local lineIndex = 0
        LuaUtils:foreach(DugisWaypointTooltip.lines, function(line)
			if DugisGuideViewer:IsModuleLoaded("NPCJournalFrame") then 
				line = DGV.NPCJournalFrame:ReplaceSpecialTags(line, false)
			end
            if lineIndex == 0 then
                DugisWaypointTooltip:AddLine(line, nil, nil, nil, true)
            else
                DugisWaypointTooltip:AddLine(line, 1, 1, 1, true)
            end
		    
            lineIndex = lineIndex + 1
        end)
        
		DugisWaypointTooltip:HookScript("OnShow", DugisWaypointTooltip_OnShow)
		DugisWaypointTooltip:Show()
        
        DugisWaypointTooltip:SetClampedToScreen(true)
       
        local screenWidth = GetScreenWidth()
        local mapWidth = WorldMapPOIFrame:GetWidth()
        local xOffset = (screenWidth - mapWidth) / 2
        if WORLDMAP_SETTINGS.size == WORLDMAP_FULLMAP_SIZE then
            DugisWaypointTooltip:SetClampRectInsets(-xOffset - 13,0,0,-35)  
        else
            DugisWaypointTooltip:SetClampRectInsets(0,0,0,0) 
        end
    end
	
	local function AddTooltips(...)
    
        DugisWaypointTooltip.lines = {}
    
		for i=1,select("#", ...) do
            local line = (select(i, ...))
            if line == nil then
                line = ""
            end
            
            --Line processing
            line = string.gsub(line, "=COLON=",":")
            DugisWaypointTooltip.lines[#DugisWaypointTooltip.lines+1] = line
		end
        
        DugisWaypointTooltip:updateDugisWaypointTooltipLines()
	end

	local modelFrame = CreateFrame("PlayerModel", nil, DugisWaypointTooltip)
	WMT.modelFrame = modelFrame
	modelFrame:SetFrameStrata("TOOLTIP")

    DugisWaypointTooltip.updateModel = function()
        npcId = DugisWaypointTooltip.npcId
    
		if not npcId then return end
        
        
        
        if (DugisWaypointTooltip:GetWidth() < 190) then
            DugisWaypointTooltip:SetWidth(190)
        end
        
        local textHeight = DugisWaypointTooltip:GetHeight()
        DugisWaypointTooltip:SetHeight(DugisWaypointTooltip:GetWidth() + textHeight - 15)
                
        
        if UIParent:IsVisible() then
            modelFrame:SetPoint("TOPLEFT", 5, -textHeight + 5)
            modelFrame:SetPoint("BOTTOMRIGHT", -5, 5)
		else
            modelFrame:SetPoint("TOPLEFT", 5, -textHeight + 5)
            modelFrame:SetPoint("BOTTOMRIGHT", -5, 5)
		end
        

		local mv = DGV.Modules.ModelViewer
		--DGV:DebugFormat("point_OnEnter", "mv.npcDB[npcId]", mv.npcDB[npcId], "npcId", npcId)
		modelFrame:Show()
		modelFrame:ClearModel()
		if mv and mv.npcDB and mv.npcDB[npcId] then
			modelFrame:SetDisplayInfo(mv.npcDB[npcId])
		else
			modelFrame:SetCreature(npcId)
		end
		modelFrame:Show()
		if not modelFrame:GetModel() or modelFrame:GetModel()=="" then modelFrame:Hide() end    
    
    end

	local function point_OnEnter(self, button)
		if UIParent:IsVisible() then
			DugisWaypointTooltip:SetParent(UIParent)
		else
			DugisWaypointTooltip:SetParent(self)
		end

		DugisWaypointTooltip:SetOwner(self, "ANCHOR_BOTTOMLEFT")
		self = self.point or self
		overPoint = self
		DugisWaypointTooltip:SetFrameStrata("DIALOG")
    
        local texts = {DataProviders:GetTooltipText(self.provider, unpack(self.args))}
	
		local npcId = DataProviders:GetNPC(self.provider, unpack(self.args))
        
        if texts[1] == nil and npcId then
            texts[1] = "NPC "..npcId
        end
        
		AddTooltips(unpack(texts))

        DugisWaypointTooltip.npcId = npcId
        DugisWaypointTooltip:updateModel()

	end

	local function point_OnLeave(self, button)
		DugisWaypointTooltip:Hide()
		modelFrame:Hide()
		modelFrame:ClearModel()
	end
	
	local function minimapPoint_OnUpdate(self)
		local dist,x,y = DugisGuideViewer.astrolabe:GetDistanceToIcon(self)
		if not dist then
			self:Hide()
			return
		end

		if DugisGuideViewer.astrolabe:IsIconOnEdge(self) then
			self.icon:Hide()
		else
			self.icon:Show()
		end
	end

	local trackingPointPool = {}
	local minimapPointPool = {}
	local function GetCreatePoint(...)
		local point = tremove(trackingPointPool)
		if not point then
			point = CreateFrame("Button", nil, DugisMapOverlayFrame)
			point:RegisterForClicks("RightButtonUp","LeftButtonUp")
			point:SetScript("OnClick", point_OnClick)
			point:SetScript("OnEnter", point_OnEnter)
			point:SetScript("OnLeave", point_OnLeave)
			point.icon = point:CreateTexture("ARTWORK")
			point.icon:SetAllPoints()
			point.icon:Show()
		end
		point:Hide()
		point.args = {...}
		point.args[1] = tonumber(point.args[1]) or point.args[1]
		point.args[2] = tonumber(point.args[2]) or point.args[2]
		point.provider = DataProviders:SelectProvider(...)
		local icon = DataProviders:GetDetailIcon(point.provider, unpack(point.args))
		if icon then
			point.toolTipIcon = icon
		else
			point.toolTipIcon = nil
		end
		if DataProviders:ShouldShowMinimap(point.provider, unpack(point.args)) then
			local miniPoint = tremove(minimapPointPool)
			if not miniPoint then
				miniPoint = CreateFrame("Button", nil, DugisMinimapOverlayFrame)
				miniPoint:RegisterForClicks("RightButtonUp","LeftButtonUp")
				miniPoint:SetScript("OnClick", point_OnClick)
				miniPoint:SetScript("OnEnter", point_OnEnter)
				miniPoint:SetScript("OnLeave", point_OnLeave)
				miniPoint:SetScript("OnUpdate", minimapPoint_OnUpdate)
				miniPoint.icon = miniPoint:CreateTexture("ARTWORK")
				miniPoint.icon:SetAllPoints()
				miniPoint.icon:Show()
			end
			miniPoint.point = point
			miniPoint:Hide()
			point.minimapPoint = miniPoint
		end
		tinsert(trackingPoints, point)
		
		return point
	end

	local function GetDistance(point)
		local DugisArrow = DGV.Modules.DugisArrow
		--local x, y = GetXY(point.args[2])
		local x, y = DGV:UnpackXY(point[4])
		--return DGV:ComputeDistance(GetCurrentMapAreaID(), GetCurrentMapDungeonLevel(), x, y,
		--	DugisArrow.map, DugisArrow.floor, DugisArrow.pos_x, DugisArrow.pos_y)
		return DGV:ComputeDistance(point[1], point[2] or  DugisArrow.floor, x, y,
			DugisArrow.map, DugisArrow.floor, DugisArrow.pos_x, DugisArrow.pos_y)
	end
	WMT.GetDistance = GetDistance

	local function IterateZonePoints(mapName, pointData, ofType, allContinents, IterateZonePoints, dontCheckDistance)
		if not pointData then return end
		local DugisArrow = DGV.Modules.DugisArrow
		--local currentSystem =  DGV.astrolabe:GetMapInfo(DugisArrow.map)
		local currentContinent = GetCurrentMapContinent()
		local mapName,level = strsplit(":",mapName)
		local nsMapName = UnspecifyMapName(mapName)
		if nsMapName then
			if not DugisGuideUser.CurrentMapVersions or DugisGuideUser.CurrentMapVersions[nsMapName]~=mapName then return end
		end
		
		map = DGV:GetMapIDFromName(nsMapName or mapName)
		level = tonumber(level)
		if 
			currentContinent~=DGV:GetCZByMapId(map) and 
			mapName~=GetMapInfo() and
			not allContinents
		then
			return
		end
		local index = 0
		local zonePointIterator
		zonePointIterator = function()
			index = index + 1
			if not pointData[index] then return nil end
			if ofType then
				local tType = pointData[index]:match("(.-):")
				if tType~=ofType then
					return zonePointIterator()
				end
			end
			local point = {map, level, strsplit(":", pointData[index])}
			point[3] = tonumber(point[3]) or point[3]
			point[4] = tonumber(point[4]) or point[4]
--DGV:DebugFormat("IterateZonePoints", "mapName", mapName, "ShouldShow", (DataProviders:ShouldShow(nil, point[3], point[4], unpack(point, 5))), "GetDistance", (GetDistance(point)))
			if DataProviders:ShouldShow(nil, point[3], point[4], unpack(point, 5)) and
				(dontCheckDistance or GetDistance(point))
			then
				return point
			else
				return zonePointIterator()
			end
		end
		return zonePointIterator
	end
	
	local function IterateFlightPoints(invariant, control)
		while invariant do
			local data
			control,data = next(invariant,control)
			if control then
				if not data.requirements or DGV:CheckRequirements(strsplit(":", data.requirements)) then
					local point = {data.m, data.f, 5, data.coord, control}
					if DataProviders:ShouldShow(nil, point[3], point[4], unpack(point, 5)) and
						GetDistance(point)
					then
						return control, point
					end
				end
			else return end
		end
	end

	function DGV.IterateAllFindNearestPoints(ofType, allContinents, dontCheckDistance)
		local faction = UnitFactionGroup("player")

		local key, value, factionTable, factionKey, zonePointIterator, flightPointIterator, flightPointInvariant, flightPointControl
		local trackingPointTable = DugisWorldMapTrackingPoints
		local rootIterator
		rootIterator = function()
			if flightPointIterator then
				flightPointControl, value = flightPointIterator(flightPointInvariant, flightPointControl)
				if not flightPointControl then return end
				return value
			end
			if zonePointIterator then
				local tmp = zonePointIterator()
				if tmp then
					return tmp
				else
					zonePointIterator=nil
				end
			end
			if factionTable then
				factionKey, value = next(factionTable, factionKey)
				if factionKey then
					zonePointIterator = IterateZonePoints(factionKey, value, ofType, allContinents, nil, dontCheckDistance)
				else
					factionTable = nil
				end
			else
				key,value = next(trackingPointTable, key)
				if not key then 
					if trackingPointTable==DugisWorldMapTrackingPoints then 
						trackingPointTable = CollectedWorldMapTrackingPoints
						if trackingPointTable then
							return rootIterator()
						end
					end
					if ofType and ofType~="5" then return end
					local fullData = DGV.Modules.TaxiData:GetFullData()
					local continent = GetCurrentMapContinent()
					flightPointIterator, flightPointInvariant = IterateFlightPoints, fullData[continent]
				elseif key==faction then
					factionTable = value
				elseif key~="Horde" and key~="Alliance" and key~="Neutral" then
					zonePointIterator = IterateZonePoints(key, value, ofType, allContinents, nil, dontCheckDistance)
				end
			end
			return rootIterator()
		end
		return rootIterator
	end

	local function RemovePoint(point)
		local val, index
		for index, val in ipairs(trackingPoints) do
			if point == val then
				point:Hide()
				if point.minimapPoint then
					tinsert(minimapPointPool, point.minimapPoint)
					point.minimapPoint:Hide()
					point.minimapPoint = nil
				end
				tinsert(trackingPointPool, tremove(trackingPoints, index))
				return
			end
		end
	end

	local function RemoveAllPoints()
		while #trackingPoints>0 do
			local point = tremove(trackingPoints)
			point:Hide()
			if point.minimapPoint then
					tinsert(minimapPointPool, point.minimapPoint)
					point.minimapPoint:Hide()
					point.minimapPoint = nil
				end
			tinsert(trackingPointPool, point)
		end
	end

	local function AddPointData(pointData)
		if not pointData then return end
		local data
		for _,data in ipairs(pointData) do
            --Replacing colons in special tags to "=COLON=" to avoid interpreting internat ":" marks 
            data = string.gsub(data, '%(.+%)', function(textFound) 
                return string.gsub(textFound, ":", "=COLON=")
            end) 
			GetCreatePoint(strsplit(":", data))
		end
	end
	
	local function AddFlightPointData()
		local fullData = DGV.Modules.TaxiData:GetFullData()
		local continent, map, level = GetCurrentMapContinent(), GetCurrentMapAreaID(), GetCurrentMapDungeonLevel()
		if fullData and fullData[continent] then
			for npc,data in pairs(fullData[continent]) do
				local requirements = data and data.requirements
				if 
					data.m==map and 
					data.f==level and
					(not requirements or DGV:CheckRequirements(strsplit(":", requirements)))
				then
					GetCreatePoint("5", data.coord, npc)
				end
			end
		end
	end

	local function GetNearest(button)
		local shortest, shortestDist
		--for _,point in ipairs(trackingPoints) do
		--	local selected
		--	if (button.arg1 and button.arg1==point.args[4]) or button.arg1==point.args[1] then
		for point in DGV.IterateAllFindNearestPoints() do
			local selected
			if (button.arg1 and button.arg1==point[6]) or button.arg1==point[3] then
				selected = point
				local dist = GetDistance(selected)
				if dist and (not shortestDist or dist < shortestDist) then
					shortest = selected
					shortestDist = dist
				end
			end
		end
		return shortest
	end

	local function FindNearest(button)
		local DugisArrow = DGV.Modules.DugisArrow
		DGV:RemoveAllWaypoints()
		--AddWaypoint(GetNearest(button))
		local nearest = GetNearest(button)
		if nearest then
			local x, y = DGV:UnpackXY(nearest[4])
			local map, level = nearest[1], nearest[2] or DugisArrow.floor
			DGV:AddCustomWaypoint(
				x, y, DataProviders:GetTooltipText(nil, unpack(nearest, 3)),
				map, level)
		end
	end

	local function IterateDropdownLevel(level)
		local listFrame = _G["DropDownList"..level];
		local listFrameName = listFrame:GetName();
		local count = listFrame.numButtons
		local i = 0
		return function()
			i = i + 1
			if i<=count then return _G[listFrameName.."Button"..i] end
		end
	end

	local function Get_FindNearestDropDown_Initialize(baseLevel, value)
		return function (self, level)
			if level==baseLevel and UIDROPDOWNMENU_MENU_VALUE==value then
				for point in DGV.IterateAllFindNearestPoints() do
					local button
					local found = false
					local trackingType = point[3]
					local name, texture = GetTrackingInfo(trackingType)
					if name then
						for button in IterateDropdownLevel(level) do
							if name==button.value then
								found = true
								break;
							end
						end
						if not found then
							local info;
							info = Lib_UIDropDownMenu_CreateInfo();
							info.text = name
							info.func = FindNearest;
							info.icon = texture;
							info.arg1 = trackingType;
							info.isNotRadio = true;
							info.notCheckable = true
							info.keepShownOnClick = true;
							info.tCoordLeft = 0;
							info.tCoordRight = 1;
							info.tCoordTop = 0;
							info.tCoordBottom = 1;

							if trackingType==10 then
								info.icon = nil;
								info.func =  nil;
								info.notCheckable = true;
								info.keepShownOnClick = false;
								info.hasArrow = true;
							end
							--if trackingType~=5 then --skip flightmaster for now
								UIDropDownMenu_AddButton(info, level)
							--end
						end
					end
				end
			end

			if level==baseLevel+1 then
				for point in DGV.IterateAllFindNearestPoints() do
					local trackingType, _, _, spell = unpack(point, 3)
					if trackingType==10 then
						local button
						local found = false
						for button in IterateDropdownLevel(level) do
							if spell==button.arg1 then
								found = true
								break;
							end
						end
						if not found then
							local info;
							info = Lib_UIDropDownMenu_CreateInfo();
							info.text = professionTable[spell];
							--info.checked = MiniMapTrackingDropDown_IsNoTrackingActive;
							info.func = FindNearest;
							info.notCheckable = true
							info.icon = select(2, GetTrackingInfo(10));
							info.arg1 = spell;
							info.isNotRadio = true;
							info.keepShownOnClick = false;
							UIDropDownMenu_AddButton(info, level);
						end
					end
				end
			end
		end
	end

	--[[function WMT:ShowMenu(frame)
		local menu = DugisGuideViewer.ArrowMenu:CreateMenu()
		DugisGuideViewer.ArrowMenu:CreateMenuTitle(menu, L["World Map Tracking"])
		
		local filters = DugisGuideViewer.ArrowMenu:CreateMenuItem(menu, L["Set Tracking Filters..."])
		filters:SetFunction(function () ToggleDropDownMenu(1, nil, WorldMapTrackingDropDown, menu, 0, -5); end)
			
		--DGV:DebugFormat("ShowMenu", "menu:GetName", menu:GetName())
		if not WorldMapTrackingDropDown then
			CreateFrame("Frame", "WorldMapTrackingDropDown", UIParent, "Lib_UIDropDownMenuTemplate")
		end
		Lib_UIDropDownMenu_Initialize(WorldMapTrackingDropDown, TrackingDropDown_Initialize, "MENU")
		
		local nearest = DugisGuideViewer.ArrowMenu:CreateMenuItem(menu, L["Find Nearest..."])
		nearest:SetFunction(function () ToggleDropDownMenu(1, nil, FindNearestDropDown, menu, 0, -5); end)
	
		if not FindNearestDropDown then
			CreateFrame("Frame", "FindNearestDropDown", UIParent, "Lib_UIDropDownMenuTemplate")
		end
		Lib_UIDropDownMenu_Initialize(FindNearestDropDown, Get_FindNearestDropDown_Initialize(1), "MENU")

		menu:ShowAtCursor()
		
		return true
	end]]
	
	local function UpdateCurrentMapVersion()
		local currentMapName = GetMapInfo()
		local nsMapName = UnspecifyMapName(currentMapName)
		if nsMapName then
			if not DugisGuideUser.CurrentMapVersions then
				DugisGuideUser.CurrentMapVersions = {}
			end
			DugisGuideUser.CurrentMapVersions[nsMapName] = currentMapName
		end
	end

	hooksecurefunc("WorldMapFrame_UpdateMap",
		function()
			if WMT.loaded then
				WMT:UpdateTrackingMap()
				UpdateCurrentMapVersion()
			end
		end)
		
	function DGV:MINIMAP_UPDATE_TRACKING()
		WMT:UpdateTrackingMap()
	end

	function DGV:TRAINER_SHOW()
		local npcId = DGV:GuidToNpcId(UnitGUID("npc"))
		local x,y = select(3, DGV:GetPlayerPosition())
		if y then 
			local packed = DGV:PackXY(x,y)
			DGV:DebugFormat("TRAINER_SHOW", "Tracking Data", format("(type):%s:%s", packed, npcId))
		end
	end

	local orig_MiniMapTrackingDropDown_Initialize
	function WMT:Load()
		
		function WMT:UpdateTrackingMap()
			if not WMT.loaded then return end
			local mapName, level = GetMapInfo(), GetCurrentMapDungeonLevel()
			RemoveAllPoints()
			if not mapName or not DGV:UserSetting(DGV_WORLDMAPTRACKING) then return end
			AddPointData(DugisWorldMapTrackingPoints[UnitFactionGroup("player")][mapName..":"..level]);
			AddPointData(DugisWorldMapTrackingPoints[mapName])
			AddPointData(DugisWorldMapTrackingPoints[mapName..":"..level])
			if not trackingPoints[1] then
				local nsMapName = UnspecifyMapName(mapName)
				if nsMapName then
					AddPointData(DugisWorldMapTrackingPoints[UnitFactionGroup("player")][nsMapName..":"..level]);
					AddPointData(DugisWorldMapTrackingPoints[nsMapName])
					AddPointData(DugisWorldMapTrackingPoints[nsMapName..":"..level])
				end
			end
			if CollectedWorldMapTrackingPoints and CollectedWorldMapTrackingPoints[UnitFactionGroup("player")] then
				AddPointData(CollectedWorldMapTrackingPoints[UnitFactionGroup("player")][mapName..":"..level])
			end
			AddFlightPointData()
			
			UpdateTrackingFilters()
		end
	
		DGV:RegisterEvent("TRAINER_SHOW")
		--[[if not trackingStates then
			trackingStates = {}
			local id, name, texture, active, category;
			for id, name, texture, active, category in IterateTrackingTypes() do
				trackingStates[id] = active
			end
		end]]
		orig_MiniMapTrackingDropDown_Initialize = MiniMapTrackingDropDown.initialize
		MiniMapTrackingDropDown.initialize = function(self, level)
			if not WorldMapButton:IsVisible() then SetMapToCurrentZone() end
			if level==1 then
				local info;
				info = Lib_UIDropDownMenu_CreateInfo();
				info.text = L["Find Nearest"]
				info.icon = nil;
				info.arg1 = nil;
				info.isNotRadio = true;
				info.func =  nil;
				info.notCheckable = true;
				info.keepShownOnClick = false;
				info.hasArrow = true;
				info.isNotRadio = true;
				--[[info.tCoordLeft = 0;
				info.tCoordRight = 1;
				info.tCoordTop = 0;
				info.tCoordBottom = 1;]]
				UIDropDownMenu_AddButton(info, level)
			end
			if level>=2 then
				Get_FindNearestDropDown_Initialize(2, L["Find Nearest"])(info, level)
			end
			orig_MiniMapTrackingDropDown_Initialize(self, level)
			if level==2 and UIDROPDOWNMENU_MENU_VALUE==2 then --put class trainer back
				local name, texture, active= GetTrackingInfo(4);
				local info = Lib_UIDropDownMenu_CreateInfo();
				info.text = name;
				info.checked = DGV.chardb.ClassTrainerTrackingEnabled
				info.func = 
				function(self, id, unused, on)
					DGV.chardb.ClassTrainerTrackingEnabled=on
					WMT:UpdateTrackingMap()
				end
				info.icon = texture;
				--info.arg1 = id;
				info.isNotRadio = true;
				info.keepShownOnClick = true;
				info.tCoordLeft = 0;
				info.tCoordRight = 1;
				info.tCoordTop = 0;
				info.tCoordBottom = 1;
				UIDropDownMenu_AddButton(info, level)
			end
			if level==1 then
				for providerKey,provider in DataProviders.IterateProviders do
					if provider.GetCustomTrackingInfo then
						local text, icon, configAccessor, configMutator =  provider:GetCustomTrackingInfo()
						if text then
							local info;
							info = Lib_UIDropDownMenu_CreateInfo();
							info.text = L[text]
							info.icon = icon
							info.arg1 = nil;
							info.checked = configAccessor
							info.isNotRadio = true;
							info.func =  function(arg1, arg2, arg3, enabled)
								configMutator(enabled)
								WMT:UpdateTrackingMap()
							end;
							info.notCheckable = false;
							info.keepShownOnClick = true;
							info.hasArrow = false;
							UIDropDownMenu_AddButton(info, level)
						end
					end
				end
			end
		end
		--DGV:RegisterEvent("WORLD_MAP_UPDATE")
		DGV:RegisterEvent("PET_JOURNAL_LIST_UPDATE")
		DGV:RegisterEvent("MINIMAP_UPDATE_TRACKING")
		WMT:UpdateTrackingMap()
	end
	
	function WMT:Unload()
		MiniMapTrackingDropDown.initialize = orig_MiniMapTrackingDropDown_Initialize
		--DGV:UnregisterEvent("WORLD_MAP_UPDATE")
		DGV:UnregisterEvent("PET_JOURNAL_LIST_UPDATE")
		DGV:UnregisterEvent("TRAINER_SHOW")
		DGV:UnregisterEvent("MINIMAP_UPDATE_TRACKING")
	end

    local function AbandonByQuestId(questID)
        for i=1,GetNumQuestLogEntries() do 
            SelectQuestLogEntry(i)
            local AbandonQID = select(8, GetQuestLogTitle(i))
            if AbandonQID == questID then
                SetAbandonQuest()
                AbandonQuest() 
            end
        end
    end

    local pressedAbandonIndex = nil
    StaticPopupDialogs["GROUP_ABANDON_CONFIRMATION"] = {
        text = "Abandon All Quests?",
        button1 = "Yes",
        button2 = "No",
        OnHide = function()
            pressedAbandonIndex = nil
        end,
        OnAccept = function()
            local questIdsToBeAbandoned = {}
            local questLogIndex = pressedAbandonIndex + 1
            local numEntries = GetNumQuestLogEntries()
            for i = questLogIndex, numEntries do
                local _, _, _, isHeader, _, _, _, questID = GetQuestLogTitle(i)
                if isHeader then
                    break
                else
                    questIdsToBeAbandoned[#questIdsToBeAbandoned + 1] = questID
                end
            end
            LuaUtils:foreach(questIdsToBeAbandoned, function(questID)
                AbandonByQuestId(questID)
            end)
            pressedAbandonIndex = nil
        end,
        timeout = 0,
        whileDead = true,
        hideOnEscape = true,
        preferredIndex = 3,
    }

    hooksecurefunc("QuestLogQuests_Update", function(...)
        LuaUtils:foreach(QuestMapFrame.QuestsFrame.Contents.Headers, function(parentButton)
            if parentButton.abandonGroupButton == nil then
                local buttonFrame = GUIUtils:AddButton(parentButton, "", 231, 6, 28, 28, 28, 28, function(self)  
                    StaticPopupDialogs["GROUP_ABANDON_CONFIRMATION"].text = "Abandon All " .. GetQuestLogTitle(self.abandonGroupButton.questLogIndex) .. " Quests?" 
                    if pressedAbandonIndex == nil then
                        pressedAbandonIndex = self.abandonGroupButton.questLogIndex
                        StaticPopup_Show ("GROUP_ABANDON_CONFIRMATION")
                    end
                end, [[INTERFACE\BUTTONS\CancelButton-Up]], [[INTERFACE\BUTTONS\CancelButton-Down]], [[INTERFACE\BUTTONS\CancelButton-Down]])
                buttonFrame.button.abandonGroupButton =  parentButton
                parentButton.abandonGroupButton = buttonFrame
            end
            if parentButton.abandonGroupButton then
                if not DGV:UserSetting(DGV_SHOWQUESTABANDONBUTTON) then
                    parentButton.abandonGroupButton.button:Hide()
                else
                    parentButton.abandonGroupButton.button:Show()
                end
            end
        end)   
    end)
end
