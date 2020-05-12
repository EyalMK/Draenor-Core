local WATCHFRAME_INITIAL_OFFSET = 0;
local WATCHFRAME_TYPE_OFFSET = 10;
 
local WATCHFRAMELINES_FONTSPACING = 0;

local WATCHFRAME_SETLINES_NUMLINES = 5;  

local WATCHFRAME_ITEM_WIDTH = 33;

local _

--//////////////////////////////////////////


local DGV = DugisGuideViewer
if not DGV then return end

local SmallFrame = DGV:RegisterModule("SmallFrame")--, "Guides")
DGV.SmallFrame = SmallFrame

SmallFrame.Frame = CreateFrame("Frame", "DugisSmallFrameContainer", UIParent)
DugisSmallFrame = SmallFrame.Frame
SmallFrame.Frame:SetHeight(52)
SmallFrame.Frame:SetMovable(true)
SmallFrame.Frame:SetPoint("CENTER", 0, 220)
--SmallFrame.Frame:SetClampedToScreen(true)
--The following is required to maintain positioning through guide states
SmallFrame.Frame:SetWidth(1)
SmallFrame.Frame:Show()
SmallFrame.Frame:Hide()

--sizing constants
local FLOATING_CONTAINER_TOP_PADDING = 24
local FLOATING_CONTAINER_BOTTOM_PADDING = 15
local FLOATING_STATUS_FRAME_TEXT_DESC_PADDING = 7
local FLOATING_STATUS_FRAME_DESC_OBJECTIVES_PADDING = 3
local ANCHORED_CONTAINER_TOP_PADDING = 10
local ANCHORED_CONTAINER_BOTTOM_PADDING = -2
local ANCHORED_STATUS_FRAME_TEXT_DESC_PADDING = 7
local ANCHORED_STATUS_FRAME_DESC_OBJECTIVES_PADDING = 3

local DBMUpdate

SmallFrame.PlayFlashAnimation_frameCounter = 5

-- 2 Frames delay for flash effect. Without the delay the size of the parent frame is cached and the flash effect is not displayed correctly (is using the old size)
local function SmallFrame_OnUpdate()
    if SmallFrame.PlayFlashAnimation_frameCounter < 10 then
        SmallFrame.PlayFlashAnimation_frameCounter = SmallFrame.PlayFlashAnimation_frameCounter + 1
    end
     
    if SmallFrame.PlayFlashAnimation_frameCounter == 2 then
        LuaUtils:Delay(0.05, function()
            DugisGuideViewer.Modules.DugisWatchFrame:PlayFlashAnimation()
        end)
    end
end

SmallFrame.Frame:SetScript("OnUpdate", SmallFrame_OnUpdate) 

function SmallFrame:Initialize()
	if SmallFrame.initialized then return end
	SmallFrame.initialized = true
			
	local L = DugisLocals

	local oldFrameSize = 0
	local oldTextSize = 0 
	local newFrameSize = 0
	local newTextSize = 0
	local flashGroup, flash
	
	local function IsFloating()
		return (not DugisGuideViewer:UserSetting(DGV_ANCHOREDSMALLFRAME)) or (DugisGuideViewer.carboniteloaded and Nx.Quest) or DugisGuideViewer.sexymaploaded or DugisGuideViewer.nuiloaded or not SmallFrame.loaded
	end
    
    SmallFrame.IsFloating = IsFloating
	
	local function IsTooltipEmbedded()
		return DGV:UserSetting(DGV_EMBEDDEDTOOLTIP)
	end
	
	local function IsFixedWidth()
		return DGV:UserSetting(DGV_FIXEDWIDTHSMALL)
	end
	
	local function ShowObjectives()
		return DGV:UserSetting(DGV_OBJECTIVECOUNTER)
	end
	
	local function MultistepMode()
		return DGV:UserSetting(DGV_MULTISTEPMODE)
	end
	
	local statusFrames = UIFrameCache:New("FRAME", "DugisSmallFrameStatus", SmallFrame.Frame, "DugisSmallFrameTemplate")
	function SmallFrame.IterateActiveStatusFrames(invariant, control)
		return next(statusFrames.usedFrames, control)
	end
	
	local function ClearAllStatusFrames()
		while #statusFrames.usedFrames>0 do
			local frame = tremove(statusFrames.usedFrames)
			tinsert(statusFrames.frames, 1, frame)
			frame:Hide()
			if frame.ItemButton then 
				DGV.DoOutOfCombat(frame.ItemButton.Hide, frame.ItemButton)
			end					
		end
	end
	
	local function StatusFrame_InitPoints(frame)
		frame:ClearAllPoints()
		local index = #statusFrames.usedFrames
		if index==1 then
			if IsFloating() then
				frame:SetPoint("TOPLEFT", 0, -FLOATING_CONTAINER_TOP_PADDING)
			else
				frame:SetPoint("TOPLEFT", 0, -ANCHORED_CONTAINER_TOP_PADDING)
			end
		else
			frame:SetPoint("TOPLEFT", statusFrames.usedFrames[index-1], "BOTTOMLEFT", 0, -10)
		end
	end
	
	local function StatusFrame_GetCreate()
		local frame = statusFrames:GetFrame()
		frame:SetParent(SmallFrame.Frame)
		if not frame.objectiveLines then
			frame.objectiveLines = UIFrameCache:New("FRAME", frame:GetName().."ObjectiveLine", frame.Objectives, "ObjectiveTrackerLineTemplate")
			frame:RegisterForDrag("LeftButton")
			frame:HookScript("OnDragStart", SmallFrame.OnDragStart)
			frame:HookScript("OnDragStop", SmallFrame.OnDragStop)
		end
		frame:Show()
		StatusFrame_InitPoints(frame)
		return frame
	end
	
	local function StatusFrame_ClearAllObjectiveLines(frame)
		while #frame.objectiveLines.usedFrames>0 do
			local line = tremove(frame.objectiveLines.usedFrames)
			tinsert(frame.objectiveLines.frames, line)
			line:Hide()
		end
		if frame.ItemButton then 
			DGV.DoOutOfCombat(frame.ItemButton.Hide, frame.ItemButton)
		end		
	end
	
	local function StatusFrame_Reset(frame)
		frame:Hide()
		frame.guideIndex = nil
		StatusFrame_ClearAllObjectiveLines(frame)
	end
	
	function StatusFrame_GetNonTextWidth(frame)
		local _, _, _, xOfs, yOfs = frame.Text:GetPoint(2)
		local modelButtonWidth
		
		if (frame.guideIndex == DugisGuideUser.CurrentQuestIndex) and DGV:HasModel(frame.guideIndex ) then modelButtonWidth = frame.ModelButton:GetWidth( ) + 9 else modelButtonWidth = 7 end
		return xOfs + modelButtonWidth
	end
	
	function StatusFrame_GetSmartWidth(frame)
		local _, _, _, xOfs, yOfs = frame.Chk:GetPoint()
		local modelButtonWidth
		frame:SetHeight(1000)
		frame:SetWidth(1000)
		if (frame.guideIndex == DugisGuideUser.CurrentQuestIndex) and DGV:HasModel(frame.guideIndex) then modelButtonWidth = frame.ModelButton:GetWidth( ) else modelButtonWidth = 7 end
		local textWidth = frame.Text:GetStringWidth() + 13
		local descWidth = math.min(frame.Desc:GetStringWidth() + 26, 300)
		local width = textWidth + frame.Waypoint:GetWidth() + frame.Icon:GetWidth() + frame.Chk:GetWidth() + modelButtonWidth + xOfs
		return math.max(width, descWidth), textWidth
	end

	local function StatusFrame_GetDesiredWidth(frame)
		local width
		if not IsFloating() then
			width = SmallFrame.Frame:GetWidth()
		elseif IsFixedWidth() then
			width = OBJECTIVE_TRACKER_LINE_WIDTH + 40
		else
			return StatusFrame_GetSmartWidth(frame)
		end
		return width, width - StatusFrame_GetNonTextWidth(frame)
	end
	
	local function StatusFrame_GetObjectivesHeight(frame)
		local count = 0
		for _,line in ipairs(frame.objectiveLines.usedFrames) do
			count = count + line:GetHeight()
		end
		if count>0 and frame.ItemButton then
			return math.max(count, (WATCHFRAME_ITEM_WIDTH-5))
		elseif count>0 then 
			return math.max(count, 15) --mininum objective height
		else
			return count
		end
	end
	
	local function StatusFrame_MeasureHeight(frame)
		if not IsFloating() then
			local hasObjectives = #frame.objectiveLines.usedFrames>0
            local height = frame.Text:GetStringHeight() +
				(IsTooltipEmbedded() and ANCHORED_STATUS_FRAME_TEXT_DESC_PADDING or 2) +
				frame.Desc:GetStringHeight() +
				(hasObjectives and ANCHORED_STATUS_FRAME_DESC_OBJECTIVES_PADDING or 0) +
				StatusFrame_GetObjectivesHeight(frame)
            
            local extraHeight = 0
            
            if not IsTooltipEmbedded() and not ShowObjectives() then
                extraHeight = 10
            end
            
			return height + extraHeight
		else
			local hasObjectives = #frame.objectiveLines.usedFrames>0
            local height = frame.Text:GetStringHeight() +
				(IsTooltipEmbedded() and FLOATING_STATUS_FRAME_TEXT_DESC_PADDING or 2) +
				frame.Desc:GetStringHeight() +
				(hasObjectives and FLOATING_STATUS_FRAME_DESC_OBJECTIVES_PADDING or 0) +
				StatusFrame_GetObjectivesHeight(frame)
            
			return height
				
		end
	end
	
	local function StatusFrame_GetCreateObjectiveLine (frame)
		local line = frame.objectiveLines:GetFrame()
		--line:Reset()
		line:Show()
		line:ClearAllPoints()
		return line
	end
	
	local function StatusFrame_SetCurrentWidth(frame, frameWidth, textWidth)
		frame:SetWidth(frameWidth)
		if textWidth then
			frame.Text:SetWidth(textWidth)
			frame.Objectives:SetWidth(frame.Objectives:GetWidth())
			frame.Desc:SetWidth(frame.Desc:GetWidth()) --so GetStringHeight works properly
		end
	end
	

	local function UpdateFontSize(frame)
		local DGV_SmallFrameFontSize = DGV:GetDB(DGV_SMALLFRAMEFONTSIZE)
		local filename, _, _ = frame.Text:GetFont() -- needed so that it doesn't overwrite font style when using other addons. 
		frame.Desc:SetFont(filename, DGV_SmallFrameFontSize - 1)
		frame.Text:SetFont(filename, DGV_SmallFrameFontSize)

		if frame.objectiveLines and frame.objectiveLines.usedFrames then
			for _, line in ipairs(frame.objectiveLines.usedFrames) do
				line.Text:SetFont(filename, DGV_SmallFrameFontSize)
			end
		end
	end
	
	
	local function StatusFrame_Layout(frame)
		if not IsFloating() then
			--setcharacteristics
			frame.Text:SetMaxLines(3)
			frame.Text:SetWordWrap(true)
			frame.Text:SetNonSpaceWrap(true)


		 
			UpdateFontSize(frame)

			--get desired width
			oldFrameSize, oldTextSize  = StatusFrame_GetDesiredWidth(frame)
			newFrameSize, newTextSize = oldFrameSize, oldTextSize
			
			--set desired width
			StatusFrame_SetCurrentWidth(frame, newFrameSize, newTextSize)

			--set padding values
			frame.Desc:SetPoint("TOP", frame.Text, "BOTTOM", 0, -ANCHORED_STATUS_FRAME_TEXT_DESC_PADDING)
			
			--measure height
			--set height
			frame:SetHeight(StatusFrame_MeasureHeight(frame))
		else
			if IsFixedWidth() then
				--setcharacteristics
				frame.Text:SetMaxLines(2)
				frame.Text:SetWordWrap(true)
				frame.Text:SetNonSpaceWrap(true)
				
				--get desired width
				oldFrameSize, oldTextSize = StatusFrame_GetDesiredWidth(frame)
				newFrameSize, newTextSize = oldFrameSize, oldTextSize
				
				--set desired width
				StatusFrame_SetCurrentWidth(frame, newFrameSize, newTextSize)
			else
				--setcharacteristics
				frame.Text:SetMaxLines(0)
				frame.Text:SetWordWrap(false)
				frame.Text:SetNonSpaceWrap(false)
				
				--get desired width
				StatusFrame_SetCurrentWidth(frame, StatusFrame_GetDesiredWidth(frame))
			end
			
			--set padding values
			frame.Desc:SetPoint("TOP", frame.Text, "BOTTOM", 0, -FLOATING_STATUS_FRAME_TEXT_DESC_PADDING)
			
			--measure height
			--set height
			frame:SetHeight(StatusFrame_MeasureHeight(frame))
		end
	end
	
	local function StatusFrame_GetDescriptionText(frame)
		local name = "DGVRow"..frame.guideIndex.."Desc"
		local text = _G[name]
		local descriptionText = text:GetText()
		
		--[[
		if descriptionText and not DugisGuideViewer:GetDB(DGV_DISPLAYCOORDINATES) then
			descriptionText = string.gsub(descriptionText, "%([%d,.%s]*%)[,%s]*", "")
		end]]-- Not needed. PopulateObjectives function does this first. 
			
		if descriptionText and not string.match(descriptionText, "|Hitem") and string.match(descriptionText, "item:%d") then --ReplaceSpecialTags for items if it didn't get converted yet on load. 
			if DGV.NPCJournalFrame then 
				descriptionText = DGV.NPCJournalFrame:ReplaceSpecialTags(descriptionText, true)
			end
		end
		
		return descriptionText
	end
	--[[
	local function ColorIsConstant(constant, r, g, b)
		return constant.r==r and constant.g==g and constant.b==b
	end
	
	local function DefaultDimColorComponent(component)
		return component*.80
	end
	
	local function GetDimColor(rOrTable, g, b, a)
		local r
		if type(rOrTable)=="table" then
			r, g, b, a = rOrTable.r, rOrTable.g, rOrTable.b, 1
		else
			r = rOrTable
		end
		if ColorIsConstant(RED_FONT_COLOR, r, g, b) then
			return DIM_RED_FONT_COLOR.r, DIM_RED_FONT_COLOR.g, DIM_RED_FONT_COLOR.b, a
		elseif ColorIsConstant(NORMAL_FONT_COLOR, r, g, b) then
			return 0.75, 0.61, 0, a
		elseif ColorIsConstant(HIGHLIGHT_FONT_COLOR, r, g, b) then
			return .8, .8, .8, a
		else
			return 
				DefaultDimColorComponent(r),
				DefaultDimColorComponent(g),
				DefaultDimColorComponent(b),
				a
		end
	end
	
	local function SetTextColorAndIntensity(fontString, color, highlight, forceDim)
		if highlight or (not DGV:UserSetting(DGV_HIGHLIGHTSTEPONENTER) and not forceDim) then
			fontString:SetTextColor(color.r, color.g, color.b)
		else
			fontString:SetTextColor(GetDimColor(color))
		end
	end--]]

	local function SetTextColorAndIntensity(fontString, color, highlight, forceDim)
		fontString:SetTextColor(color.r, color.g, color.b)
		if highlight or (not DGV:UserSetting(DGV_HIGHLIGHTSTEPONENTER) and not forceDim) then
			fontString:SetAlpha(1)
		else
			fontString:SetAlpha(0.8)
		end
	end	
	
	local function SetTextColors(frame, onEnter)
		local guideIndex = frame.guideIndex
		if guideIndex and DGV.actions[guideIndex] then
			local level = DGV:GetQuestLevel(DGV.qid[guideIndex])
			local questpart = DGV:ReturnTag("QIDP", guideIndex)
			if IsTooltipEmbedded() then
				SetTextColorAndIntensity(frame.Desc, HIGHLIGHT_FONT_COLOR, onEnter)
			end
			local color  = DGV:GetQuestDiffColor(guideIndex)

			if not (
			(strmatch(DGV.actions[guideIndex], "[ACT]") and color and DGV:UserSetting(DGV_QUESTCOLORON)) or (questpart and color and strmatch(DGV.actions[guideIndex], "[NK]") and DGV:UserSetting(DGV_QUESTCOLORON)) 	--set difficulty color on A/C/T actions
			)	
			then
				color = NORMAL_FONT_COLOR
			end
			SetTextColorAndIntensity(frame.Text, color, onEnter)
			if frame.objectiveLines and frame.objectiveLines.usedFrames then
				for _, line in ipairs(frame.objectiveLines.usedFrames) do
					SetTextColorAndIntensity(line.Text, HIGHLIGHT_FONT_COLOR, onEnter, true)
				end
			end
		else 
			SetTextColorAndIntensity(frame.Text, NORMAL_FONT_COLOR, onEnter)
		end
	end
	
	local function SetPointAbsolute(region, point, relativeRegion, relativeRegionAbsoluteX, relativeRegionAbsoluteY, offsetX, offsetY)
		local absoluteY = relativeRegionAbsoluteY and relativeRegionAbsoluteY + offsetY
		local absoluteX = relativeRegionAbsoluteX and relativeRegionAbsoluteX + offsetX
		region:ClearAllPoints()
		region:SetScale(relativeRegion:GetEffectiveScale())
		if IsFloating() then
			region:SetPoint(point, UIParent, "BOTTOMLEFT", absoluteX - 4, absoluteY)
		else
			region:SetPoint(point, UIParent, "BOTTOMLEFT", absoluteX, absoluteY)
		end
		region:SetFrameStrata(relativeRegion:GetFrameStrata())
		region:SetFrameLevel(relativeRegion:GetFrameLevel())
	end
	
	local function MoveItemButtonPredicate(reaction, frame)
		local val = frame:IsShown() and frame.ItemButton and frame.ItemButton:IsShown()
		if not val then
			reaction:Dispose()
			frame.moveItemButtonReaction = nil
			return
		end
		return true
	end
	
	local function MoveItemButton(reaction, frame)
		if InCombatLockdown() then return end
		SetPointAbsolute(frame.ItemButton, "TOPRIGHT", frame.Objectives, frame.Objectives:GetRight(), frame.Objectives:GetTop(), 10, -2)
	end
	
	local function SetObjectiveItem(frame, questIndex)
		local itemButton = frame.ItemButton
		if ( not itemButton ) then
			itemButton = CreateFrame("BUTTON", frame:GetName().."Item", nil, "DugisSecureQuestButtonTemplate");
		end
		DGV.SetQuestItemButtonAttributes(itemButton, questIndex)				
		
		if not frame.moveItemButtonReaction then
			frame.moveItemButtonReaction = DGV.RegisterStopwatchReaction(.1, MoveItemButtonPredicate, MoveItemButton, frame)
		end
		frame.ItemButton = itemButton;
		itemButton:Show()
	end
	
	local function StatusFrame_Populate(frame, guideIndex)
		frame.guideIndex = guideIndex
		frame.Chk:SetChecked(false)
		if guideIndex and DGV.actions[guideIndex] then
			local level = DGV:GetQuestLevel(DGV.qid[guideIndex])
			local qName = DGV.quests1L[guideIndex]
			local questpart = DGV:ReturnTag("QIDP", guideIndex)
			
			if (level and strmatch(DGV.actions[guideIndex], "[ACT]") and DGV:UserSetting(DGV_QUESTLEVELON)) or (level and questpart and strmatch(DGV.actions[guideIndex], "[NK]") and DGV:UserSetting(DGV_QUESTLEVELON)) then qName = "["..level.."] "..qName end

			qName = DGV.NPCJournalFrame:ReplaceSpecialTags(qName, true, guideIndex, true)
			frame.Icon:SetNormalTexture(DGV.visualRows[guideIndex].Button.validTexture)	
		
			frame.Icon:SetSize(22, 22)
			frame.Icon:SetPoint("RIGHT", frame.Text, "LEFT", -2.5, 0)

			frame.Text:SetText(qName)
			frame.Text:SetPoint("LEFT", 65, 0)
			if IsTooltipEmbedded() then
				frame.Desc:SetText(StatusFrame_GetDescriptionText(frame))
				frame.Desc:Show()		
			else
				frame.Desc:SetText("")
				frame.Desc:Hide()
			end
            
            if not frame.Desc.isHtml then
                frame.Desc:Hide()
            end
            
            if frame.htmlDesc == nil then
                frame.htmlDesc = CreateFrame("SimpleHTML",nil, frame)

                frame.htmlDesc:SetFontObject(frame.Desc:GetFontObject())
                frame.htmlDesc:SetWidth(222)
                frame.htmlDesc:SetHeight(50)
                frame.htmlDesc:SetPoint("LEFT", frame, "LEFT", 16, 0)    
                frame.htmlDesc:SetPoint("TOP", frame.Text, "BOTTOM", 0, -8)    
                frame.htmlDesc:SetPoint("RIGHT", frame, "RIGHT", -16, 0)    
                
                local text = frame.Desc:GetText()
                
                if text == nil then
                    text = ""
                end
                
                frame.htmlDesc:SetText('<html><body><p align="left">'..text..'<br/><br/></p></body></html>')     
                frame.htmlDesc:Show()   

                frame.htmlDesc:SetScript("OnHyperlinkClick", DugisGuideViewer.NPCJournalFrame.OnHyperlinkClick) 
                frame.htmlDesc:SetScript("OnHyperlinkEnter", function(self, linkData, link, button)
                    DugisGuideViewer.NPCJournalFrame.OnHyperlinkEnter(self, linkData, link, button, true)
                end) 
                frame.htmlDesc:SetScript("OnHyperlinkLeave", DugisGuideViewer.NPCJournalFrame.OnHyperlinkLeave) 
                frame.Desc = frame.htmlDesc
                frame.Desc.isHtml = true
                
                frame.Desc.GetStringHeight = function()
                    local height = frame.htmlDesc:GetContentHeight()
                    if height ~= nil and height < 10 then
                        height = 10
                    end					
                    return height
                end
                
                frame.Desc.GetStringWidth = function()
                    return frame.htmlDesc:GetWidth()
                end                
             end
			
			local havePOIwaypoint
			
			if DGV:ReturnTag("POI", guideIndex) then 
				local qid = DGV.qid[guideIndex]
				local _, posX, posY, objective = QuestPOIGetIconInfo(qid)
				if posX then 
					havePOIwaypoint = true
				end
			end
			
			if DGV:HasCoord(guideIndex) or havePOIwaypoint then 
				frame.Waypoint:Enable()
				frame.Waypoint:Show()
				frame.Text:SetPoint("LEFT", 65, 0)
				frame.Chk:SetPoint("RIGHT", frame.Waypoint, "LEFT", 5, 0)				
			else 
				frame.Waypoint:Disable() 
				frame.Waypoint:Hide()
				frame.Text:SetPoint("LEFT", 51, 0)
				frame.Chk:SetPoint("RIGHT", frame.Icon, "LEFT", 0, 0)
			end
			if (guideIndex == DugisGuideUser.CurrentQuestIndex) and DGV:HasModel(guideIndex) then frame.ModelButton:Show() else frame.ModelButton:Hide() end
			if DGV:ReturnTag("NT") then 
				frame.Chk:Disable()
				frame.Chk:Hide()
			else 
				frame.Chk:Enable()
				frame.Chk:Show()
			end
			

			SetTextColors(frame)
			
			StatusFrame_ClearAllObjectiveLines(frame)
			local qid = DGV.qid[guideIndex]
			local lastLine

			if qid and ShowObjectives() and strmatch(DGV.actions[guideIndex], "[CNK]") and not DGV:ReturnTag("V", guideIndex) and (DGV:getIcon(DGV.actions[guideIndex], guideIndex) ~= "Interface\\Minimap\\TRACKING\\Profession" or DGV:ReturnTag("AYG", guideIndex)) and not DugisGuideUser.shownObjectives[qid] then
				DugisGuideUser.shownObjectives[qid] = true -- prevents repeat display of the same objectives
				
				local questIndex = GetQuestLogIndexByID(DGV.qid[guideIndex])
				local _, _, _, _, _, isComplete, isDaily, questID, startEvent = GetQuestLogTitle(questIndex);
				local questWatched = IsQuestWatched(questIndex)
				
				local questFailed = false;
				local numObjectives = GetNumQuestLeaderBoards(questIndex);
				if ( isComplete and isComplete < 0 ) then
					isComplete = false;
					questFailed = true;
				elseif ( numObjectives == 0 and not startEvent ) then
					isComplete = true;      
				end		
				
				if not isComplete and not questFailed then
					local link, item, charges, showItemWhenComplete = GetQuestLogSpecialItemInfo(questIndex);
                    local y = 0
					for i = 1, numObjectives do
						local text, objectiveType, finished = GetQuestLogLeaderBoard(i, questIndex)
						if (text ) then

							--text = ReverseQuestObjective(text, objectiveType) 
							local line = StatusFrame_GetCreateObjectiveLine(frame)
							--Blizzard random WatchFrame_SetLine bug fix (hopefully) 
                            
                            if finished then
                                line.Dash:SetText("|TInterface\\Scenarios\\ScenarioIcon-Check:16:16:-2|t")
                            else
                                line.Dash:SetText("- ")
                            end
							
                            line.Text:SetText(text)
                            
							if not WATCHFRAME_SETLINES_NUMLINES then WATCHFRAME_SETLINES_NUMLINES = 0 end							
							--WatchFrame_SetLine(line, lastLine, WATCHFRAMELINES_FONTSPACING, false, text, 1);
						
							local itemWidth = 0
							if item then
								itemWidth = WATCHFRAME_ITEM_WIDTH;
							end
							
							local DGV_SmallFrameFontSize = DGV:GetDB(DGV_SMALLFRAMEFONTSIZE)
							local filename, _, _ = line.Text:GetFont()
							line.Text:SetFont(filename, DGV_SmallFrameFontSize)

							line.Text:SetWidth(line:GetWidth()-line.Dash:GetWidth()-itemWidth)
                            local lineHeight = line.Text:GetStringHeight()+WATCHFRAMELINES_FONTSPACING+3
							line:SetHeight(lineHeight)

                            --if not lastLine then
                            line:SetPoint("RIGHT")

                            if finished then
                                line:SetPoint("LEFT", -8, 0)
                            else
                                line:SetPoint("LEFT", 1, 0)
                            end
                        
							line:SetPoint("TOP", WATCHFRAMELINES_FONTSPACING, -(y))
							--end 
   
                            y = y + lineHeight                            

							lastLine = line
						end
					end
					
					if ( item and (not isComplete or showItemWhenComplete) ) then
						DGV.DoOutOfCombat(SetObjectiveItem, frame, questIndex)
					end
				end
			end
			frame.Objectives:SetHeight(StatusFrame_GetObjectivesHeight(frame))
		end
	end
	
	function DGV:UNIT_QUEST_LOG_CHANGED()
		DGV:UpdateSmallFrame()
	end

	function SmallFrame:AnchorSmallFrame (anchor)
		SmallFrame.Frame:RegisterForDrag(nil)
		SmallFrame.Frame:ClearAllPoints()	
		SmallFrame.Frame:SetBackdrop(nil)

		SmallFrame.Frame:SetPoint("TOPRIGHT", anchor, "BOTTOMRIGHT", 10, -WATCHFRAME_INITIAL_OFFSET)
		SmallFrame.Frame:SetPoint("LEFT", anchor, "LEFT", -30, -30);
		
		--loop and layout
		for _,frame in SmallFrame.IterateActiveStatusFrames do
			StatusFrame_Layout(frame)
		end

		if #statusFrames.usedFrames>0 and statusFrames.usedFrames[#statusFrames.usedFrames]:GetBottom() then --GetBottom() nil check needed to stop messy error during petbattle
			SmallFrame.Frame:SetHeight(
				statusFrames.usedFrames[1]:GetTop()	-	
				statusFrames.usedFrames[#statusFrames.usedFrames]:GetBottom() +
				ANCHORED_CONTAINER_TOP_PADDING +
				ANCHORED_CONTAINER_BOTTOM_PADDING)
		end
		-- move to an animation
		if SmallFrame.FlashFrame then
			SmallFrame.FlashFrame:ClearAllPoints()	
			SmallFrame.FlashFrame:SetPoint("CENTER", DGV.Modules.DugisWatchFrame.WatchBackground, 0, -1)
		end
		return SmallFrame.Frame, SmallFrame.Frame:GetWidth(), 1, 0; 
	end

	function SmallFrame:SetDockingMode()
		if IsFloating()	then
			local frame = SmallFrame.Frame
			--frame:ClearAllPoints()
			local setting = DGV:UserSetting(DGV_SMALLFRAMEDOCKING)
			local uiParentWidth, uiParentHeight = UIParent:GetWidth(), UIParent:GetHeight()
			local centerX, centerY = frame:GetCenter()
			if not centerX then return end --init
			local isHigh = centerY>(uiParentHeight/2)
			local isRight = centerX>(uiParentWidth/2)
			local xValue
			if isRight then
				xValue = frame:GetRight() - uiParentWidth
			else
				xValue = frame:GetLeft()
			end
			frame:ClearAllPoints()
			if setting=="Relative to Watch Frame" and DugisWatchBackground:IsShown() then
				local anchorFrame = DugisWatchBackground
				local top, bottom, left, right = frame:GetTop(), frame:GetBottom(), frame:GetLeft(), frame:GetRight()
				local wfTop, wfBottom, wfLeft, wfRight = anchorFrame:GetTop(), anchorFrame:GetBottom(), anchorFrame:GetLeft(), anchorFrame:GetRight()
				local sharedWidth, sharedHeight = math.min(right, wfRight) - math.max(left, wfLeft), math.min(top, wfTop) - math.max(bottom, wfBottom)
				local sharedSide = math.max(sharedHeight, sharedWidth)
				sharedSide = sharedSide>0 and sharedSide
				local topDifference, bottomDifference, rightDifference, leftDifference = 
					top-wfBottom, bottom-wfTop, right-wfLeft, left-wfRight
				local dockSide
				if sharedSide then
					if sharedSide==sharedWidth then
						if math.abs(topDifference)<=math.abs(bottomDifference) then
							dockSide = "TOP"
						else
							dockSide = "BOTTOM"
						end
					else
						if math.abs(rightDifference)<=math.abs(leftDifference) then
							dockSide = "RIGHT"
						else
							dockSide = "LEFT"
						end
					end
				end
				if not dockSide then
					local minDifference = math.min(math.abs(topDifference), math.abs(bottomDifference), math.abs(rightDifference), math.abs(leftDifference))
					if minDifference==math.abs(topDifference) then
						dockSide = "TOP"
					elseif minDifference==math.abs(bottomDifference) then
						dockSide = "BOTTOM"
					elseif minDifference==math.abs(rightDifference) then
						dockSide = "RIGHT"
					elseif minDifference==math.abs(leftDifference) then
						dockSide = "LEFT"
					end
				end
				anchorFrame:ClearAllPoints()
				if dockSide=="TOP" then
					local side = isRight and "RIGHT" or "LEFT"
					frame:SetPoint(dockSide..side, anchorFrame, "BOTTOM"..side, isRight and (right-wfRight) or (left-wfLeft), topDifference)
				elseif dockSide=="BOTTOM" then
					local side = isRight and "RIGHT" or "LEFT"
					frame:SetPoint(dockSide..side, anchorFrame, "TOP"..side, isRight and (right-wfRight) or (left-wfLeft), bottomDifference)
				elseif dockSide=="RIGHT" then
					local side = isHigh and "TOP" or "BOTTOM"
					frame:SetPoint(side..dockSide, anchorFrame, side.."LEFT", rightDifference, isHigh and (top-wfTop) or (bottom-wfBottom))
				elseif dockSide=="LEFT" then
					local side = isHigh and "TOP" or "BOTTOM"
					frame:SetPoint(side..dockSide, anchorFrame, side.."RIGHT", leftDifference, isHigh and (top-wfTop) or (bottom-wfBottom))
				end
			elseif setting=="Relative to Watch Frame" then
				frame:SetPoint("TOP"..(isRight and "RIGHT" or "LEFT"), xValue, frame:GetTop() - uiParentHeight)
			elseif (setting=="Auto" and isHigh) or setting=="Expand Down" then
				frame:SetPoint("TOP"..(isRight and "RIGHT" or "LEFT"), xValue, frame:GetTop() - uiParentHeight)
			elseif (setting=="Auto" and not isHigh) or setting=="Expand Up" then
				frame:SetPoint("BOTTOM"..(isRight and "RIGHT" or "LEFT"), xValue, frame:GetBottom())
			elseif setting=="Expand in Both Directions" then
				frame:SetPoint(isRight and "RIGHT" or "LEFT", xValue, centerY-uiParentHeight/2)
			end
		end		
	end
	
	function SmallFrame:Reset()
		if IsFloating()	then
			SmallFrame.Frame:ClearAllPoints()	
			SmallFrame.Frame:SetPoint("CENTER", 0, 220)
			SmallFrame:SetDockingMode()
		end
		SmallFrame:ResetFloating()
	end

	local function UnsnapFromWatchFrame()
		if DGV:UserSetting(DGV_SMALLFRAMEDOCKING)=="Relative to Watch Frame" then return end
		local pointIndex
		for pointIndex=1, SmallFrame.Frame:GetNumPoints() do
			local _, relativeTo = SmallFrame.Frame:GetPoint(pointIndex)
			if relativeTo==ObjectiveTrackerFrame then
				SmallFrame.Frame:RegisterForDrag("LeftButton")
				SmallFrame.Frame:ClearAllPoints()	
				SmallFrame.Frame:SetPoint("CENTER", 0, 220)
				SmallFrame:SetDockingMode()
				--newFrameSize, newTextSize = SmallFrame:GetCurrentWidth( )
				break;
			end
		end
	end

	function SmallFrame:ResetFloating()
		if IsFloating() or
			not DugisGuideViewer:GuideOn()
		then
			UnsnapFromWatchFrame()
			
			--loop and layout
			oldFrameSize, oldTextSize = newFrameSize, newTextSize
			local maxWidth, maxTextWidth = 0,0
			for _,frame in SmallFrame.IterateActiveStatusFrames do
				StatusFrame_Layout(frame)
				maxWidth = math.max(maxWidth, frame:GetWidth())
				maxTextWidth = math.max(maxTextWidth, frame.Text:GetStringWidth())
			end
			for _,frame in SmallFrame.IterateActiveStatusFrames do
				StatusFrame_SetCurrentWidth(frame, maxWidth)
			end
			SmallFrame.Frame:SetWidth(maxWidth - 2)
			newFrameSize, newTextSize = maxWidth, maxTextWidth
			if #statusFrames.usedFrames>0 and statusFrames.usedFrames[#statusFrames.usedFrames]:GetBottom() then --GetBottom() nil check needed to stop messy error during petbattle
				SmallFrame.Frame:SetHeight(
					statusFrames.usedFrames[1]:GetTop() -
					statusFrames.usedFrames[#statusFrames.usedFrames]:GetBottom() +
					FLOATING_CONTAINER_BOTTOM_PADDING +
					FLOATING_CONTAINER_TOP_PADDING)
			end
			
			DugisGuideViewer:SetSmallFrameBorder()
			
			-- move to an animation
			if SmallFrame.FlashFrame then
				SmallFrame.FlashFrame:ClearAllPoints()	
				SmallFrame.FlashFrame:SetPoint("CENTER", SmallFrame.Frame, 1, -1)
			end
			--DGV.Modules.DugisWatchFrame:RemoveObjectiveHandler(WatchFrame_DisplaySmallFrame)
		else
			--DGV.Modules.DugisWatchFrame:AddObjectiveHandler(WatchFrame_DisplaySmallFrame)
		end
		DugisGuideViewer.Modules.DugisWatchFrame:DelayUpdate()
	end

	--[[
	local function PLAYER_REGEN_ENABLED(self)
		
			
		self:UnregisterEvent("PLAYER_REGEN_ENABLED")
	end
	--]]

	function SmallFrame:OnClick(self, button)
		name = self:GetName()
		
		if button == "RightButton" then
			if DugisMainBorder:IsVisible() then
				DugisGuideViewer:HideLargeWindow()
			else
				--UIFrameFadeIn(DugisMainframe, 0.5, 0, 1)
				--UIFrameFadeIn(Dugis, 0.5, 0, 1)
				DugisGuideViewer:ShowLargeWindow()
			end
		elseif button == "LeftButton" and IsShiftKeyDown() then
			local row = _G["DGVRow"..self.guideIndex]
			DugisGuideViewer.Modules.StickyFrame:AddRow(row)
		elseif button == "LeftButton" and DGV.actions and DGV.actions[self.guideIndex] and strmatch(DGV.actions[self.guideIndex], "[CNKT]") then 
			local qid = DGV.qid[self.guideIndex]
			if qid then
				local questIndex = GetQuestLogIndexByID(qid)
				if questIndex > 0 then 
					QuestLogPopupDetailFrame_Show( questIndex );
				end
			end
		end
	end
	
	--Called possibly in combat
	function SmallFrame:PopulateSmallFrame()
		if not DGV:isValidGuide(CurrentTitle) then
			if not CurrentTitle and #statusFrames.usedFrames==1 then
				StatusFrame_InitPoints(statusFrames.usedFrames[1])
			end
			return
		end
		
		local checkmoved = DugisGuideUser.NextQuestIndex -- check if NextQuestIndex has changed
		
		ClearAllStatusFrames()
 		if MultistepMode() and not DGV:ReturnTag("NT", DugisGuideUser.CurrentQuestIndex) then
 			local maxstep = 0
			local total = 6
			
			if DGV:ReturnTag("SID", DugisGuideUser.CurrentQuestIndex) or DGV:ReturnTag("SID", DugisGuideUser.CurrentQuestIndex + 1 ) then 
				total = 2
			end
			
 			for guideIndex in DGV.IterateRelevantSteps do				
 				maxstep = maxstep + 1
 				if maxstep <= total then 
 					StatusFrame_Populate(StatusFrame_GetCreate(), guideIndex)
 				end
				if maxstep == 2 and not DGV:ReturnTag("AYG", guideIndex) then 
					DugisGuideUser.NextQuestIndex = guideIndex
				elseif DGV:ReturnTag("AYG", DugisGuideUser.CurrentQuestIndex + 1) then 
					DugisGuideUser.NextQuestIndex = DugisGuideUser.CurrentQuestIndex
				end
			end
		elseif DGV:ReturnTag("AYG", DugisGuideUser.CurrentQuestIndex) and not DGV:ReturnTag("NT", DugisGuideUser.CurrentQuestIndex) then -- AYG to make As you go step stick. 
			local maxstep = 0
			for guideIndex in DGV.IterateRelevantSteps do				
				maxstep = maxstep + 1
				if maxstep <= 2 then 
					StatusFrame_Populate(StatusFrame_GetCreate(), guideIndex)
				end
				if maxstep == 2 and not DGV:ReturnTag("AYG", guideIndex) then 
					DugisGuideUser.NextQuestIndex = guideIndex
				elseif DGV:ReturnTag("AYG", DugisGuideUser.CurrentQuestIndex + 1) then
					DugisGuideUser.NextQuestIndex = DugisGuideUser.CurrentQuestIndex
				end
 			end
 		else
 			StatusFrame_Populate(StatusFrame_GetCreate(), DugisGuideUser.CurrentQuestIndex)
 		end	
	end
	
	function SmallFrame:CheckButton_OnEvent(self, event)
		local guideIndex = self:GetParent().guideIndex
		if DugisGuideUser.CurrentQuestIndex then --If a guide is loaded
			if DGV:ReturnTag("NT", guideIndex) then
				self.Chk:SetChecked(false)
			elseif guideIndex==DugisGuideUser.CurrentQuestIndex and guideIndex == DGV:GetLastGuideNumRows() then--LastGuideNumRows then
				--self.Chk:SetChecked(false)
				DugisGuideViewer:LoadNextGuide()
			else
				DugisGuideViewer:SetChkToComplete(guideIndex)
				if guideIndex then
					DGV.DelayandMoveToNextQuest(0.2)
				end
			end
		end
	end

	local autoTooltipFadeTime = math.huge
	local function ResetAutoTooltip()
		if SmallFrameTooltip then SmallFrameTooltip:SetAlpha(1) end
		autoTooltipFadeTime = math.huge
	end

	local function UpdateAutoTooltip()
		local toEnd = autoTooltipFadeTime-GetTime()
		if toEnd <= 0 then 
			SmallFrameTooltip:Hide()
			ResetAutoTooltip()
		elseif toEnd <= 3 then 
			SmallFrameTooltip:SetAlpha(toEnd/3) 
		end
	end

	local tooltip = CreateFrame( "GameTooltip", "SmallFrameTooltip", nil, "GameTooltipTemplate" ); 
	function SetTooltipOnUpdate(self, event)
		if 
			DugisGuideViewer:isValidGuide(CurrentTitle) == true and 
			DugisGuideUser.CurrentQuestIndex and
			not IsTooltipEmbedded()
		then

			local statusFrameTooltipText = StatusFrame_GetDescriptionText(self)
			local filename, _, _ = SmallFrameTooltipTextLeft1:GetFont() -- needed so that it doesn't overwrite font style when using other addons. 
			
			tooltip:SetOwner(self)
			tooltip:SetFrameStrata("TOOLTIP") 
			tooltip:SetParent(UIParent)
			SmallFrameTooltipTextLeft1:SetFont(filename, 12)
			tooltip:SetPadding(5)
			tooltip:AddLine(statusFrameTooltipText, 1, 1, 1, 1,true)
			tooltip:Show()

			local ttwidth, ttheight, fwidth, fheight, pad = DugisGuideViewer:GetToolTipSize(tooltip)

			tooltip:ClearAllPoints()
			local anchorPoint = strupper(DugisGuideViewer:GetDB(DGV_TOOLTIPANCHOR)):gsub("%s", "")
			if anchorPoint=="DEFAULT" and IsFloating() then
				anchorPoint = "LEFT"
			elseif anchorPoint=="DEFAULT" then
				anchorPoint = "LEFT"
			end
			
			local toolAnchorPoint 	= ""
			toolAnchorPoint = toolAnchorPoint..((anchorPoint:find("BOTTOM.*") and "TOP") or "")
			toolAnchorPoint	= toolAnchorPoint..((anchorPoint:find("TOP.*") and "BOTTOM") or "")
			toolAnchorPoint = toolAnchorPoint..((anchorPoint:find("^RIGHT") and "LEFT") or "")
			toolAnchorPoint = toolAnchorPoint..((anchorPoint:find("^LEFT") and "RIGHT") or "")
			toolAnchorPoint = toolAnchorPoint..((anchorPoint:find(".+LEFT") and "LEFT") or "")
			toolAnchorPoint = toolAnchorPoint..((anchorPoint:find(".+RIGHT") and "RIGHT") or "")
			
			
			tooltip:SetPoint(toolAnchorPoint, self, anchorPoint, 0, 0)
			ResetAutoTooltip()
		end
	end
	
	function SmallFrame:OnEnter(self, event)
		SetTooltipOnUpdate(self, event)
		SetTextColors(self, true)
	end
	
	function SmallFrame:OnLeave(self, event)
		DGV:ShowAutoTooltip(self)
		SetTextColors(self)
	end
	
	function SmallFrame:OnDragStart()
		if not IsFloating() then
			--DGV:WatchFrameOnDragStart()
		elseif not DGV:UserSetting(DGV_LOCKSMALLFRAME) then
			SmallFrame.Frame:StartMoving();
			SmallFrame.Frame.isMoving = true;
		end
	end

	function SmallFrame:OnDragStop()
		if not IsFloating() then
			--DGV:WatchFrameOnDragStop()
		else
			SmallFrame.Frame:StopMovingOrSizing();
			SmallFrame.Frame.isMoving = false;
			SmallFrame:SetDockingMode()
		end
	end	
	
	function DugisGuideViewer:ShowAutoTooltip(frame)
		frame = frame or DugisSmallFrameStatus1
		if not frame then return end
		--if 1 then return end
		if DugisGuideViewer:GetDB(DGV_SHOWTOOLTIP)==0 or (DGV.actions[frame.guideIndex] and strmatch(DugisGuideViewer.actions[frame.guideIndex], "[CNK]")==nil) or DGV:UserSetting(DGV_EMBEDDEDTOOLTIP) then
			if tooltip then tooltip:Hide() end
			ResetAutoTooltip()
			return 
		end
		SetTooltipOnUpdate(frame)
		autoTooltipFadeTime = GetTime() + DugisGuideViewer:GetDB(DGV_SHOWTOOLTIP) + 3
		--SmallFrameTooltip:Show()
		tooltip:SetScript("OnUpdate", UpdateAutoTooltip)
	end
	
	function SmallFrame:PlayFlashAnimation( )
		if not SmallFrame.FlashFrame then
			flashGroup, flash, SmallFrame.FlashFrame = DGV:CreateFlashFrame(SmallFrame.Frame)
			SmallFrame:ResetFloating()
		end
		
		if IsFloating() and DGV:UserSetting(DGV_SMALLFRAMEBORDER) then
			SmallFrame.FlashFrame:Show()
			SmallFrame.FlashFrame:SetWidth(SmallFrame.Frame:GetWidth() - 15)
			SmallFrame.FlashFrame:SetHeight(SmallFrame.Frame:GetHeight() - 18)
			flashGroup:Play()
		else
			SmallFrame.FlashFrame:Hide()
		end
	end
    
    function UpdateProgressBarPosition()
        SmallFrameProgressBar:ClearAllPoints()
        if DugisGuideViewer:UserSetting(DGV_ANCHOREDSMALLFRAME) then
            SmallFrameProgressBar:SetPoint("TOPLEFT", 108, 18)
        else
            SmallFrameProgressBar:SetPoint("TOPLEFT", 9, 8)
        end
        
        if (DugisGuideViewer:UserSetting(DGV_DISPLAYGUIDESPROGRESS)) then
            SmallFrameProgressBar:Show()
        else
            SmallFrameProgressBar:Hide()
        end  
        
        if (DugisGuideViewer:UserSetting(DGV_DISPLAYGUIDESPROGRESSTEXT)) then
            SmallFrameProgressBarText:Show()
        else
            SmallFrameProgressBarText:Hide()
        end
    end

	local TransitionFont = nil
	local SmallFrameTransition = nil
	SmallFrame.Load = function()
        if _G["SmallFrameProgressBar"] == nil then
            CreateFrame("StatusBar", "SmallFrameProgressBar", SmallFrame.Frame, "DugisProgressBarTemplate")
            
            SmallFrameProgressBar:SetScript("OnEnter", function()
                if not DugisGuideViewer:UserSetting(DGV_DISPLAYGUIDESPROGRESSTEXT) then
                    SmallFrameProgressBarText:Show()
                end
            end)
                    
            SmallFrameProgressBar:SetScript("OnLeave", function()
                if not DugisGuideViewer:UserSetting(DGV_DISPLAYGUIDESPROGRESSTEXT) then
                    SmallFrameProgressBarText:Hide()
                end
            end)
        end
        
        UpdateProgressBarPosition()
    
		DGV:RegisterEvent("UNIT_QUEST_LOG_CHANGED")
		if SmallFrame.loaded then return end
		SmallFrame.loaded = true
		
		if DugisSmallFrameTransition then SmallFrameTransition = DugisSmallFrameTransition else
			SmallFrameTransition = CreateFrame("Frame", "DugisSmallFrameTransition", UIParent)
			SmallFrameTransition:SetHeight(32)
			SmallFrameTransition:SetWidth(100)
		end
		SmallFrameTransition:Show()

		
		if SmallFrameTransitionFont then TransitionFont = SmallFrameTransitionFont else
			TransitionFont = SmallFrameTransition:CreateFontString("SmallFrameTransitionFont", "ARTWORK", "GameFontNormal")
			TransitionFont:SetPoint("LEFT")
		end
		--TransitionFont:Show()

		local smallElapsed = 1.5
		local watchElapsed = -1
		local suspendFrameTransition = nil
		SmallFrameTransition:SetScript("OnUpdate", function(self, el)
			smallElapsed = smallElapsed + el

			if smallElapsed > 1 then
				for _,frame in SmallFrame.IterateActiveStatusFrames do
					StatusFrame_SetCurrentWidth(frame, newFrameSize, newTextSize)
				end
				SmallFrame.Frame:SetWidth(newFrameSize - 2)
			else
				self:SetPoint("LEFT", DugisSmallFrameStatus1.Icon, "RIGHT", 0, smallElapsed*40)
				self:SetAlpha(1-smallElapsed)
				local w1 = oldFrameSize + (newFrameSize-oldFrameSize)*smallElapsed
				local w2 = oldTextSize + (newTextSize-oldTextSize)*smallElapsed
				SmallFrame.Frame:SetWidth(w1)
				for _,frame in SmallFrame.IterateActiveStatusFrames do
					StatusFrame_SetCurrentWidth(frame, w1, w2)
				end
			end
			
			if watchElapsed < 0 and smallElapsed > 1 then
				self:Hide()
				self:SetAlpha(0)
			end
		end)

		--[[function SmallFrame:StartWatchFrameTransition( )
			if suspendFrameTransition then return end

			watchElapsed = 0
			--SmallFrameTransition:SetAlpha(1)
			SmallFrameTransition:Show()
		end]]

		function SmallFrame:StartFrameTransition( )
			if not DugisSmallFrameStatus1 then return end
			--SmallFrame:StartWatchFrameTransition()
			local fontObj = DugisSmallFrameStatus1.Text:GetFontObject()
			local textR, textG, textB = DugisSmallFrameStatus1.Text:GetTextColor()
			
			SmallFrameTransitionFont:SetFontObject(fontObj)

			SmallFrameTransitionFont:SetTextColor(textR, textG, textB)
			SmallFrameTransitionFont:SetText(DugisSmallFrameStatus1.Text:GetText())
			SmallFrameTransition:SetPoint("LEFT", DugisSmallFrameStatus1.Icon, "RIGHT", 0, 0)
			
			smallElapsed = 0
			SmallFrameTransition:SetAlpha(1)
			SmallFrameTransition:Show()
		end
		
		function SmallFrame:Init( )
			--SmallFrame.Frame = DugisSmallFrame
			--SmallFrame.Frame:SetScript("OnEvent", PLAYER_REGEN_ENABLED)
			--SmallFrame.Frame.Text:SetWordWrap(false)
		end
		
		function SmallFrame:Enable()
			SmallFrame.Frame:Show()
			SmallFrameTransition:Show()
			SmallFrameTooltip:Show()
			SmallFrame:ResetFloating()
		end

		function SmallFrame:Disable()
			SmallFrame.Frame:Hide()
			SmallFrameTransition:Hide()
			SmallFrameTooltip:Hide()
			SmallFrame:ResetFloating()
		end
		


		function DGV:LoadInitialView(text, texture, desc)
			ClearAllStatusFrames()
			
			local frame = StatusFrame_GetCreate()
			frame.guideIndex = nil
			frame.Chk:SetChecked(false)
			frame.Desc:SetText(desc)
			frame.Desc:SetPoint("LEFT", 42, 0)
			--frame.Desc:Hide()
			frame.Text:SetText(text)
			frame.Text:SetPoint("LEFT", 42, 0)
			frame.Icon:SetNormalTexture(texture)
			frame.Icon:SetSize(28, 28)
			frame.Icon:SetPoint("RIGHT", frame.Text, "LEFT", -1, -8)
			frame.Waypoint:Disable()
			frame.Waypoint:Hide()
			frame.ModelButton:Hide()
			frame.Chk:Disable()
			frame.Chk:Hide()
			frame.Text:SetTextColor(NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b, 1)
			StatusFrame_ClearAllObjectiveLines(frame)
			frame.Objectives:SetHeight(0)
			if frame.ItemButton then
				frame.ItemButton:Hide()
			end
		end
		
		function DGV:UpdateSmallFrame()
			--DGV:DebugFormat("UpdateSmallFrame")
			SmallFrame.Frame:Show()
			SmallFrame:OnDragStop()
			if DGV:UserSetting(DGV_SMALLFRAMETRANSITION) == L["Scroll"] then
				--oldFrameSize, oldTextSize = SmallFrame:GetCurrentWidth( )
				if not MultistepMode() then SmallFrame:StartFrameTransition( ) end
				SmallFrame:PopulateSmallFrame( )
				--newFrameSize, newTextSize = SmallFrame:GetCurrentWidth( )
				--UIFrameFadeIn(SmallFrame.Frame.Text, 0.8, 0, 1)
				SmallFrame:ResetFloating()
			else
				SmallFrame:PopulateSmallFrame( )
				--newFrameSize, newTextSize = SmallFrame:GetCurrentWidth( )
				--SmallFrame:SetCurrentWidth(newFrameSize, newTextSize)
				--UIFrameFadeIn(SmallFrame.Frame, 0.8, 0, 1)
				SmallFrame:ResetFloating()
				SmallFrame:PlayFlashAnimation( )	
			end

			DugisGuideViewer:ShowAutoTooltip()
			DugisGuideUser.shownObjectives = {}
            UpdateProgressBarPosition()
		end

		function DGV:OnWatchFrameUpdate()
			--if InCombatLockdown() then return end		
			if DGV.Modules.DugisWatchFrame:ShouldModWatchFrame() and
				not ObjectiveTrackerFrame.collapsed and
				not DBMUpdate
			then
				SmallFrame.Frame:Show()		
			else
				SmallFrameTooltip:Hide()
				if not IsFloating() then
					SmallFrame.Frame:Hide()
				end
			end
		end
		
		function DGV:OnDBMUpdate()
			if DBM.Options.HideObjectivesFrame and 
			ObjectiveTrackerFrame:IsVisible() and 
			DGV.Modules.DugisWatchFrame:ShouldModWatchFrame() and
			not ObjectiveTrackerFrame.collapsed and 
			DBMUpdate 
			then
				SmallFrame.Frame:Show()
				DBMUpdate = false
			elseif DBM.Options.HideObjectivesFrame and 
				not ObjectiveTrackerFrame:IsVisible() 
			then
				SmallFrameTooltip:Hide()
				if not IsFloating() then
					SmallFrame.Frame:Hide()
					DBMUpdate = true 
				end		
			end
		end
		
		SmallFrame:Init()
		SmallFrame:Enable()
	end
	SmallFrame.Unload = function()
		DGV:UnregisterEvent("UNIT_QUEST_LOG_CHANGED")
		if not SmallFrame.loaded then return end
		SmallFrame.loaded = false
		--SmallFrame:Reset()
		SmallFrame:Disable()
		SmallFrame.Frame:Hide()
		SmallFrameTransition = nil
	end
end