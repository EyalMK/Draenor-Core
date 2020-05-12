

local DGV = DugisGuideViewer
local L, LocalizePrint = DugisLocals, DGV.LocalizePrint
-- Hidden scanning tooltip
local i
do
	local tquests = {}

	local fTGSTt = CreateFrame( "GameTooltip", "DugisScanningTooltip", nil, "GameTooltipTemplate" )
	function DugisGuideViewer:TranslateQuests()
		local questid, action, i
		local fails = 0
		local locquest, questpartnum, questPart
		fTGSTt:SetOwner( WorldFrame, "ANCHOR_NONE" )

		tquests = DugisGuideViewer.quests1
		
		if DugisGuideViewer.Localize == 0 then return fails end
		
		for i,_ in pairs(tquests) do
			action			= DGV.actions[i]
			questPart 		= DGV:ReturnTag("QIDP", i)
			questid 		= DGV:ReturnTag("QID", i)
			
			if questPart and strmatch(action, "[NK]") then --Localize Quest Objective 
				locquest = DGV:TranslateQuestObjective(i)
				if locquest then tquests[i] = locquest end
			elseif strmatch(action, "[ACT]") then --Localize quest title
				
    	    	if questid then
					fTGSTt:ClearLines()
					fTGSTt:SetHyperlink("quest:"..questid)
					if fTGSTt:IsShown() then
						locquest = DugisScanningTooltipTextLeft1:GetText() 
						if locquest then
							questpartnum 	= tquests[i]:match(L.PART_MATCH)
							if questpartnum then locquest = locquest.." ("..L.PART_TEXT.." "..questpartnum..")" end
							tquests[i] = locquest
						else 				
							fails = fails + 1
						end
					else
						fails = fails + 1
					end
				end
			else --Localize zone name 
				locquest = DGV:localize(tquests[i], "ZONE")  
				if locquest then tquests[i] = locquest end
			end
		end
		DGV.quests1L = tquests

		return fails
	end
	
	function DugisGuideViewer:TranslateQuestObjective(guideIndex)
		if DGV.Localize == 0 or GetLocale() == "frFR" then return end
		local questid 		= DGV:ReturnTag("QID", guideIndex)
		local questStep 	= DGV:ReturnTag("QIDP", guideIndex)
		local action 		= DGV.actions[guideIndex]
		local lineNum
		local lineStart 	= 5	
		
		if questid and questStep and strmatch(action, "[NCK]") then
			fTGSTt:ClearLines()
			fTGSTt:SetHyperlink("quest:"..questid)

			if fTGSTt:IsShown() then
				local numLines = fTGSTt:NumLines()
				if numLines then 
					for lineNum = 1, numLines do
						if _G["DugisScanningTooltipTextLeft"..lineNum]:GetText() == QUEST_TOOLTIP_REQUIREMENTS then
							lineStart = lineNum; break
						end
					end
					--DebugPrint("linestart="..lineStart)
					local locquest
					if _G["DugisScanningTooltipTextLeft"..(questStep + lineStart)] then
						locquest = _G["DugisScanningTooltipTextLeft"..(questStep + lineStart)]:GetText()
					end 
					if locquest then	
						--DebugPrint("English:"..DGV.quests1[guideIndex].." Spanish:"..locquest.." LineStart:"..lineStart); fTGSTt:Show(); fTGSTt:SetPoint("CENTER")
						if locquest:match("(-%s)") then locquest =  locquest:match("-%s(.*)") end 
						if locquest:match("(%sx%s%d)") then locquest =  locquest:match("(.*)%sx%s%d") end				
						if locquest and (DGV:ReturnTag("T", guideIndex)) then return "["..locquest.."]" 
							else return locquest
						end
					end
				end
			end
		end
	end
end

-- Background quest's tooltip scanning
do
	local fTGBgScan = CreateFrame( "Frame", "DugisBackgroundScan" )
	local TicksCounter = 0
	local Reiterations = 0

	function fTGBgScan:OnUpdate( Elapsed )
		TicksCounter = TicksCounter + Elapsed;
		if DugisGuideViewer:IsModuleLoaded("Guides") then
			if ( TicksCounter > 2 ) then
				TicksCounter = 0;
				Reiterations = Reiterations + 1
				local fails = DugisGuideViewer:TranslateQuests()
				if fails == 0 then 
					fTGBgScan:Hide() 
					for i =1 , #DugisGuideViewer.actions do 
						DugisGuideViewer:SetQuestText(i)
					end

					DugisGuideViewer.UpdateSmallFrame()
				end
				
				LocalizePrint ( "Translating guide:  Try:"..Reiterations.."Fails".. fails)
				if Reiterations > 9 then
					fTGBgScan:Hide()
					Reiterations = 0
				end
			end
		end
	end

	fTGBgScan:SetScript( "OnUpdate", fTGBgScan.OnUpdate );
	fTGBgScan:Hide()

	function DugisGuideViewer:QuestsBackgroundTranslator()
		fTGBgScan:Show()
	end
end

--English to local
--[[
function DugisGuideViewer:GuideTitleTranslator(GuideTitle)
	
	if DugisGuideViewer.Localize == 1 and GuideTitle then
		local _, _, guidetitle, guidetitlelevels = GuideTitle:find("(.+)(%s%([%d%-]+.+%))")
		if guidetitle then DebugPrint("guidetitle:"..guidetitle) end
		if guidetitlelevels then DebugPrint("guidetitlelevels:"..guidetitlelevels) end
		if DugisGuideViewer.BZL[guidetitle] then
			guidetitle = DugisGuideViewer.BZL[guidetitle]
            return guidetitle..guidetitlelevels			
		end
	end
	LocalizePrint("ERROR localizing"..GuideTitle)
	return GuideTitle
end
--]]
--local to English
function DugisGuideViewer:RevGuideTitleTranslator(GuideTitle)
	
	if DugisGuideViewer.Localize == 1 and GuideTitle then
		local _, _, guidetitle, guidetitlelevels = GuideTitle:find("(.+)(%s%([%d%-]+.+%))")
		--if guidetitle then DebugPrint("G:"..guidetitle) end
		
		if DugisGuideViewer.RBZL[guidetitle] then
			guidetitle = DugisGuideViewer.RBZL[guidetitle]
            return guidetitle..guidetitlelevels			
		end
	end
	LocalizePrint("ERROR localizing"..GuideTitle)
	return GuideTitle
end

--local BZ, BZL, RBZL, BC, BCL, RBCL, BR, BRL, RBRL
if (LibStub("LibBabble-SubZone-3.0", true) == nil or LibStub("LibBabble-Class-3.0", true) == nil or LibStub("LibBabble-Race-3.0", true) == nil) and (DugisGuideViewer.Localize == 1) then
	LocalizePrint("ERROR: Localization requires LibBabble-SubZone-3.0, LibBabble-Class-3.0 and LibBabble-Race-3.0 to work properly")	
end
if DugisGuideViewer.Localize == 1 then 
	if LibStub("LibBabble-SubZone-3.0") then
	DugisGuideViewer.BZ = LibStub("LibBabble-SubZone-3.0") 
	DugisGuideViewer.BZL = DugisGuideViewer.BZ:GetUnstrictLookupTable()
	DugisGuideViewer.RBZL = DugisGuideViewer.BZ:GetReverseLookupTable()
	LocalizePrint("LibBabble-SubZone-3.0")
	end
	if LibStub("LibBabble-Class-3.0") then
	DugisGuideViewer.BC = LibStub("LibBabble-Class-3.0") 
	DugisGuideViewer.BCL = DugisGuideViewer.BC:GetUnstrictLookupTable()	
	DugisGuideViewer.RBCL = DugisGuideViewer.BC:GetReverseLookupTable()	
	LocalizePrint("Loaded LibBabble-Class-3.0")
	end
	if LibStub("LibBabble-Race-3.0") then
	DugisGuideViewer.BR = LibStub("LibBabble-Race-3.0") 
	DugisGuideViewer.BRL = DugisGuideViewer.BR:GetUnstrictLookupTable()
	DugisGuideViewer.RBRL = DugisGuideViewer.BR:GetReverseLookupTable()
	LocalizePrint("Loaded LibBabble-Race-3.0")
	end
end

local function tchelper(first, rest)
	return first:upper()..rest:lower()
end

--English to native. Returns all lowercase
function DugisGuideViewer:localize(arg, ltype)
local translation

	if DugisGuideViewer.Localize == 0 then return arg end
	
	if ltype == "ZONE" then 
		
		if DugisGuideViewer.BZ then
			translation = DugisGuideViewer.BZL[arg] 
		end
	
	elseif ltype == "CLASS" then
		if DugisGuideViewer.BC then 
			if UnitSex("player") == 3 then --female
				translation = DugisGuideViewer.BCL[string.upper(arg)] 
				if translation == nil then translation =  DugisGuideViewer.BCL[arg] end
			else
				translation = DugisGuideViewer.BCL[arg] 
			end
		end
	elseif ltype == "RACE" then
		if DugisGuideViewer.BR then 
			if UnitSex("player") == 3 then
				translation = DugisGuideViewer.BRL[string.upper(arg)] 
				if translation == nil then translation = DugisGuideViewer.BRL[arg] end
			else
				translation = DugisGuideViewer.BRL[arg] 
			end
		end		
	elseif ltype == "GUIDE" then
		translation = DugisGuideViewer:GuideTitleTranslator(arg)
	
	end
	
	if translation == nil  then 
		translation = arg 
		LocalizePrint("ERROR: during localization of:"..arg.."*")
	end
	return translation
end

--native to English 
function DugisGuideViewer:revlocalize(arg, ltype)
local translation

	if DugisGuideViewer.Localize == 0 then return arg end

	if --[[
		ltype == "ZONE" then 
		if DugisGuideViewer.BZ then
			translation = DugisGuideViewer.RBZL[arg] 
	
		end
	elseif --]]ltype == "CLASS" then
		if DugisGuideViewer.BC then 
			if UnitSex("player") == 3 then --female
				translation = DugisGuideViewer.RBCL[arg]
				if translation then translation =translation:gsub("(%a)([%w_']*)", tchelper) end
			else
				translation = DugisGuideViewer.RBCL[arg] 
			end
		end
	elseif ltype == "RACE" then
		if DugisGuideViewer.BR then
			if UnitSex("player") == 3 then --female
				translation = DugisGuideViewer.RBRL[arg] 
				if translation then translation =translation:gsub("(%a)([%w_']*)", tchelper) end
			else
				translation = DugisGuideViewer.RBRL[arg] 	
			end
		end
	--[[	
	elseif ltype == "GUIDE" then
		translation = DugisGuideViewer:RevGuideTitleTranslator(arg)
	--]]
	end
	
	if translation == nil then 
		translation = arg 
		LocalizePrint("ERROR: during reverse localization of:"..arg.."*")
	end
	return translation
end



--local to English
--[[
function DugisGuideViewer:ReverseLocalize()
	local key, val
	DugisRevLocals = {}
	for key, val in pairs(DugisLocals) do
		DugisRevLocals[val] = key
	end
end 
--]]
function DugisGuideViewer:GetLocalizedNPC(npcId)
	if DGV.Localize ~= 0 then 
		local npcName = DugisNPCs[tonumber(npcId)]
		
		if npcName then 
			local match1, match2 = npcName:match("([^|]*)|?([^|]*)")
			if match2=="" then match2 = nil end
			return match2 or match1
		end
	end
	
	local npcNameEn = DugisNPCsEn[tonumber(npcId)]
	
	if npcNameEn then 
		local match1, match2 = npcNameEn:match("([^|]*)|?([^|]*)")
		if match2=="" then match2 = nil end
		return match2 or match1
	end
end