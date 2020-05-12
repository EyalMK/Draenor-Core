local DGV = DugisGuideViewer
if not DGV then return end

local WMTCollection, WMT, L = DGV:RegisterModule("WMTCollection"), DGV.Modules.WorldMapTracking, DugisLocals
local BC = LibStub("LibBabble-Class-3.0")
local BCR = BC:GetReverseLookupTable()
WMTCollection.essential = true
local _
local mailReaction, auctionReaction, bankReaction, battlemasterReaction, trainerReaction, vendorReaction, confirmBindReaction, dataTooltip

function WMTCollection:Initialize()
	if not CollectedWorldMapTrackingPoints then
		CollectedWorldMapTrackingPoints = {}
	end
	local collectedPoints = CollectedWorldMapTrackingPoints
	local playerFaction = UnitFactionGroup("player")
	if not collectedPoints[playerFaction] then
		collectedPoints[playerFaction] = {}
	end

	function WMTCollection:Load()
	
		local function GetCoords()
			return select(3, DGV:GetPlayerPosition())
		end
		
		if DugisGuideUser.TakeNames and DugisGuideUser.DugisNPCsEn then
			DugisNPCsEn = DugisGuideUser.DugisNPCsEn
		elseif DugisGuideUser.TakeNames and not DugisGuideUser.DugisNPCsEn then
			DugisGuideUser.DugisNPCsEn = DugisNPCsEn
			DugisGuideUser.DugisNPCsEnDiff = {}
		end
		local function GetUnitId(unit)
			local id = DGV:GuidToNpcId(UnitGUID(unit))
			if DugisGuideUser.TakeNames and DugisGuideUser.DugisNPCsEn then
				if not DugisGuideUser.DugisNPCsEn[id] then
					local name = GetUnitName(unit, false)
					DugisGuideUser.DugisNPCsEn[id] = name
					DugisGuideUser.DugisNPCsEnDiff[id] = name
				end
			end
			return id
		end
	
		local function GetNpcId()
			return GetUnitId("npc")
		end
	
		local function GetUnitSex(unit)
			return (UnitSex(unit)==3 and "F") or "M"
		end
		
		local function GetNpcSex()
			return GetUnitSex("npc")
		end
		
		local function QueryTooltipForGuild(query)
			dataTooltip:ClearLines()
			dataTooltip:SetUnit("npc")
			local text = dataTooltip.left[2]:GetText()
			if text then
				return text:match(query)
			end
		end
		
		local function IsReagentVendor()
			for i=1,GetMerchantNumItems() do
				local itemLink = GetMerchantItemLink(i)
				if itemLink and DGV:GetItemIdFromLink(itemLink)==64670 then return true end -- Vanishing Powder
			end
		end
		
		local function IsFoodVendor()
			for i=1,GetMerchantNumItems() do
				local itemLink = GetMerchantItemLink(i)
				if itemLink then 
					local itemID = DGV:GetItemIdFromLink(itemLink)
					if itemID then
						dataTooltip:ClearLines()
						dataTooltip:SetItemByID(itemID)
						local text = dataTooltip.left[2]:GetText()
						if text then
							if text:match(L["Use: Restores [%d/,/.]+ health"]) then return true end
						end
					end
				end
			end
		end
		
		local function SearchPoint(pointTable, trackingType, x, y, npc)
			if not pointTable then return end
			for _,point in ipairs(pointTable) do
				local pointTrackingTypeString, pointCoords, pointNpc = strsplit(":", point)
				if trackingType==tonumber(pointTrackingTypeString) and npc==tonumber(pointNpc) then
					if npc then return true end
					local m, f = GetCurrentMapAreaID(), GetCurrentMapDungeonLevel()
					if DGV:ComputeDistance(m, f , x, y, m, f, DGV:UnpackXY(pointCoords)) < 20 then return true end
				end
			end
		end
		
		local function PointExists(mapName, level, trackingType, x, y, npc)
			local mapKey = mapName..":"..level
			local found = SearchPoint(collectedPoints[playerFaction][mapKey], trackingType, x, y, npc)
			if found then return true end
			found = SearchPoint(DugisWorldMapTrackingPoints[playerFaction][mapKey], trackingType, x, y, npc)
			if found then return true end
			local nsMapName = WMT.UnspecifyMapName(mapName)
			if nsMapName then
				found = SearchPoint(DugisWorldMapTrackingPoints[playerFaction][nsMapName..":"..level], trackingType, x, y, npc)
			end
			if found then return true end
			if level==0 then
				found = SearchPoint(DugisWorldMapTrackingPoints[playerFaction][mapName], trackingType, x, y, npc)
				if found then return true end
				found = SearchPoint(DugisWorldMapTrackingPoints[mapName], trackingType, x, y, npc)
				if found then return true end
				if nsMapName then
					found = SearchPoint(DugisWorldMapTrackingPoints[playerFaction][nsMapName], trackingType, x, y, npc)
					if found then return true end
					found = SearchPoint(DugisWorldMapTrackingPoints[nsMapName], trackingType, x, y, npc)
					if found then return true end
				end
			end
		end
		
		local function CreateIfNew(trackingType, npcId, ...)
			if npcId then npcId = tonumber(npcId) end
			if npcId and npcId == 32639 -- Traveler Tundra Alliance
			or npcId == 32638 -- Traveler Tundra Alliance
			or npcId == 32641 -- Traveler Tundra Horde
			or npcId == 32642 -- Traveler Tundra Horde
			or npcId == 24780 -- Field Repair Bot
			or npcId == 29561 -- Scrapbot
			or npcId == 49040 -- Jeeves
			or npcId == 77789 -- Blingtron 5000
			or npcId == 43929 -- Blingtron 4000
			or npcId == 36613 -- Gobber
			or npcId == 77894 -- Walter
			or npcId == 33238 -- Argent Squire
			or npcId == 33239 -- Argent Gruntling
			or npcId == 33239 -- Argent Gruntling
			or npcId == 95141 -- Sassy Imp
			or npcId == 95142 -- Sassy Imp
			or npcId == 95144 -- Sassy Imp
			or npcId == 95146 -- Sassy Imp
			or npcId == 49586 -- Guild Page Alliance
			or npcId == 49587 -- Guide Herald Alliance
			or npcId == 49588 -- Guild Page Horde 
			or npcId == 49590 -- Guide Herald Horde	
			or npcId == 82656 -- Tormmok
			or npcId == 62822 -- Grand Expedition Yak
			or npcId == 64515 -- Grand Expedition Yak
			then return end
			local x,y = GetCoords()
			local mapName, level = GetMapInfo(), GetCurrentMapDungeonLevel()
			if not PointExists(mapName, level, trackingType, x, y, ...) then
				local mapKey = mapName..":"..level
				if not collectedPoints[playerFaction][mapKey] then
					collectedPoints[playerFaction][mapKey] = {}
				end
				tinsert(collectedPoints[playerFaction][mapKey], strjoin(":", trackingType, DGV:PackXY(x, y), npcId, ...))
			end
		end
		
		local function MailOpen()
			--CreateIfNew(8)
		end
		
		local function AuctionOpen()
			CreateIfNew(1, GetNpcId(), "", GetNpcSex())
		end
		
		local function BankOpen()
			CreateIfNew(2, GetNpcId(), "", GetNpcSex())
		end
		
		local function BattlemasterPredicate()
			return QueryTooltipForGuild(L["Battlemaster"])
		end
		
		local function BattlemasterOpen()
			CreateIfNew(3, GetNpcId(), "", GetNpcSex())
		end
		
		local function CreateIfTrainsService(serviceItemIdOrIcon, spellOrName)
			for i=1,GetNumTrainerServices() do
				local itemLink = GetTrainerServiceItemLink(i)
				if 
					(itemLink and DGV:GetItemIdFromLink(itemLink)==serviceItemIdOrIcon) or
					serviceItemIdOrIcon==GetTrainerServiceIcon(i)
				then
					CreateIfNew(10, GetNpcId(), spellOrName, GetNpcSex())
					return true
				end
			end
		end
		
		local function TrainerOpen()
			local trainerTypeMatch = QueryTooltipForGuild(L["([^%s]+) Trainer"])
			trainerTypeMatch = trainerTypeMatch or QueryTooltipForGuild(L["([^%s]+) Trainer Female"])
			
			--classes
			local englishClassTrainerTypeMatch = BCR[trainerTypeMatch]
			for i = 1, GetNumClasses() do
				if GetClassInfo(i)==trainerTypeMatch then
					CreateIfNew(4, GetNpcId(), englishClassTrainerTypeMatch, GetNpcSex())
					return
				end
			end
			
			--trades & other
			if CreateIfTrainsService(2581, "3273") then return end --First Aid
			if CreateIfTrainsService(2841, "2575") then return end --Mining
			if CreateIfTrainsService(4359, "4036") then return end --Engineering
			if CreateIfTrainsService(2852, "3100") then return end --Blacksmithing
			if CreateIfTrainsService(2303, "2108") then return end --Leatherworking
			if CreateIfTrainsService("Interface\\Icons\\Spell_Arcane_PortalDalaran", "Portal") then return end
			if CreateIfTrainsService("Interface\\Icons\\INV_Misc_Pelt_Wolf_01", "8613") then return end --Skinning
			if CreateIfTrainsService("INTERFACE\\ICONS\\trade_archaeology", "Archaeology") then return end
			if CreateIfTrainsService("Interface\\Icons\\Spell_Nature_Swiftness", "Riding") then return end
			if CreateIfTrainsService(21932, "25229") then return end --Jewelcrafting
			if CreateIfTrainsService(2576, "3908") then return end --Tailoring
			if CreateIfTrainsService(3382, "2259") then return end --Alchemy
			if CreateIfTrainsService(11289, "7411") then return end --Enchanting
			if CreateIfTrainsService(39469, "45357") then return end --Inscription
			if CreateIfTrainsService(30816, "2550") then return end --Cooking
			if CreateIfTrainsService("Interface\\Icons\\Trade_Fishing", "131474") then return end --Fishing
		end
		
		local function VendorOpen()
			if CanMerchantRepair() then
				CreateIfNew(12, GetNpcId(), "", GetNpcSex())
			elseif IsReagentVendor() then
				CreateIfNew(11, GetNpcId(), "", GetNpcSex())
			elseif IsFoodVendor() then
				CreateIfNew(6, GetNpcId(), "", GetNpcSex())
			end
		end
		
		--To collect innkeeper data; stand on the innkeeper, click or choose bind gossip option.  You can cancel the bind.
		local function ConfirmBind(reaction, event, newHome)
			CreateIfNew(7,  GetUnitId("target"), newHome, GetUnitSex("target"))
		end
		
		mailReaction = DGV.RegisterReaction("MAIL_SHOW")
			:WithAction(MailOpen)
		auctionReaction = DGV.RegisterReaction("AUCTION_HOUSE_SHOW")
			:WithAction(AuctionOpen)
		bankReaction = DGV.RegisterReaction("BANKFRAME_OPENED")
			:WithAction(BankOpen)
		battlemasterReaction = DGV.RegisterReaction("GOSSIP_SHOW", BattlemasterPredicate, BattlemasterOpen)
		trainerReaction = DGV.RegisterReaction("TRAINER_SHOW")
			:WithAction(TrainerOpen)
		vendorReaction = DGV.RegisterReaction("MERCHANT_SHOW")
			:WithAction(VendorOpen)
		confirmBindReaction = DGV.RegisterReaction("CONFIRM_BINDER")
			:WithAction(ConfirmBind)
	end
	
	function WMTCollection:Unload()
		mailReaction:Dispose()
		mailReaction = nil
		auctionReaction:Dispose()
		auctionReaction = nil
		bankReaction:Dispose()
		bankReaction = nil
		battlemasterReaction:Dispose()
		battlemasterReaction = nil
		trainerReaction:Dispose()
		trainerReaction = nil
		vendorReaction:Dispose()
		vendorReaction = nil
		confirmBindReaction:Dispose()
		confirmBindReaction = nil
	end
	
	dataTooltip = CreateFrame("GameTooltip")
	dataTooltip:SetOwner(UIParent, "ANCHOR_NONE")
	dataTooltip.left = {}
	dataTooltip.right = {}
	for i = 1, 30 do
		dataTooltip.left[i] = dataTooltip:CreateFontString()
		dataTooltip.left[i]:SetFontObject(GameFontNormal)
		dataTooltip.right[i] = dataTooltip:CreateFontString()
		dataTooltip.right[i]:SetFontObject(GameFontNormal)
		dataTooltip:AddFontStrings(dataTooltip.left[i], dataTooltip.right[i])
	end
end