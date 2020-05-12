--JU

local DGV = DugisGuideViewer
if not DGV then return end

local SF = DGV:RegisterModule("StickyFrame")
local DebugPrint = DGV.DebugPrint

local _
--DGV.StickyFrame = SF
function SF:Initialize()
	SF.StickyQuests = {} --StickyQuests[stickyrow] = mainFrameRow
	SF.revStickyQuests = {} --revStickyQuests[mainFrameRow] = stickyrow
	
	local MAX_QUESTS = 10
	
	
	--
	-- Local Functions
	--
	local function _GetStickyAnchor(index, row)
		local anchorY = (row:GetHeight() * (index-1)) + 20
		return "TOPLEFT", SF.Frame, "TOPLEFT", 0, -anchorY
	end
	
	local function ChkOnClick(button, event)
		local stickyIndex = tonumber(button:GetName():match("DGV_SFRow(%d*)"))
		local guideIndex = SF.StickyQuests[stickyIndex]
		local mainFrameChkButton = _G["DGVRow"..guideIndex.."Chk"]
		
		DugisGuideViewer_CheckButton_OnEvent(mainFrameChkButton, event)
	end
	
	local function OnClick(button, event)
		
		local questIndex = tonumber(button:GetName():match("DGV_SFRow(%d*)"))
		--DebugPrint("###"..button:GetName().."questIndex:"..questIndex)
		if event == "LeftButton" and IsShiftKeyDown() then
			if SF.StickyQuests[questIndex] then --Remove row
				SF:RemoveRow(questIndex)
				DGV:UpdateStickyFrame( )
			end
		end
	end
	
	local function OnEnter(button, event)
		if DGV:UserSetting(DGV_STICKYFRAMESHOWDESCRIPTIONS) then return end
		if not SF.Tooltip then
			SF.Tooltip = CreateFrame( "GameTooltip", "StickyFrameTooltip", nil, "GameTooltipTemplate" )
		end
		local stickyIndex = tonumber(button:GetName():match("DGV_SFRow(%d*)"))
		local guideIndex = SF.StickyQuests[stickyIndex]
		--if guideIndex then DebugPrint("guideIndex="..guideIndex) end
		--if stickyIndex then DebugPrint("stickyIndex="..stickyIndex) end
		local DGV_SmallFrameFontSize = DGV:GetDB(DGV_SMALLFRAMEFONTSIZE)
		local filename, _, _  = _G["DGVRow1"].Name:GetFont()		
		
		if guideIndex then
			local mainFrameRow = _G["DGVRow"..guideIndex]
			
			SF.Tooltip:SetFrameStrata("TOOLTIP")
			SF.Tooltip:SetOwner(SF.Frame, "ANCHOR_TOPLEFT")
			SF.Tooltip:SetParent(SF.Frame)
			StickyFrameTooltipTextLeft1:SetFont(filename, DGV_SmallFrameFontSize)
			StickyFrameTooltipTextLeft2:SetFont(filename, DGV_SmallFrameFontSize)
			SF.Tooltip:AddLine("|cffffd200"..(mainFrameRow.Name:GetText() or "").."|r", 1, 1, 1, true)
			SF.Tooltip:AddLine(" ", 1, 1, 1, true)
			SF.Tooltip:AddLine(mainFrameRow.Desc:GetText(), 1, 1, 1, true)
			SF.Tooltip:Show()
		end
	end
	
	local function OnLeave(button, event)
		if SF.Tooltip then
			SF.Tooltip:Hide()
		end
	end
	
	local function OnDragStop(button, event)
		local point, relativeTo, relativePoint, xOfs, yOfs = SF.Frame:GetPoint()
		local db = DGV.chardb.StickyFrame
		
		db.pos_x = xOfs
		db.pos_y = yOfs
		db.relativePoint = relativePoint
	end
	
	local function WaypointButtonOnClick(button, event)
		local stickyIndex = tonumber(button:GetName():match("DGV_SFRow(%d*)"))
		local guideIndex = SF.StickyQuests[stickyIndex]
		DebugPrint("guideIndex="..guideIndex)
		DGV:MapCurrentObjective(guideIndex)
		DGV:SafeSetMapQuestId(DugisGuideViewer.qid[guideIndex]);
	end

	local function ModelButtonOnClick(button, event)
		local stickyIndex = tonumber(button:GetName():match("DGV_SFRow(%d*)"))
		local guideIndex = SF.StickyQuests[stickyIndex]
		DebugPrint("guideIndex="..guideIndex)
		DGV:ShowModel(guideIndex)
	end

	local function _GetNumStickyRows()
		return #SF.StickyQuests
	end

	function SF:AddRow(rowInfo)
		--DebugPrint("rowInfo.name"..rowInfo:GetName())--..rowInfo.Name:GetText())

		local questIndex = tonumber(rowInfo:GetName():match("DGVRow(%d*)"))

		if not tContains(SF.StickyQuests, questIndex) and _GetNumStickyRows() < MAX_QUESTS then

			local rowNum = (_GetNumStickyRows() + 1 )
			local row = _G["DGV_SFRow"..rowNum]
			if not row then
				row = CreateFrame("FRAME", "DGV_SFRow"..rowNum, SF.Frame, "DugisSmallFrameTemplate")
			end

			--Override small frame template values
			--row:SetMovable(false)
			DGV:SetFrameBackdrop(DGV.Modules.StickyFrame.Frame, "Interface\\DialogFrame\\UI-DialogBox-Gold-Background", DGV:GetBorderPath(), 10, 4, 12, 5)
			row:SetScript("OnMouseDown", OnClick)
			row:SetScript("OnEnter", OnEnter)
			row:SetScript("OnLeave", OnLeave)
			row.Chk:SetScript("OnClick", ChkOnClick)
			row:SetSize(SF.Frame:GetWidth() , 30)
			row:ClearAllPoints()
			row:SetPoint(_GetStickyAnchor(questIndex, row))
			row:SetParent(SF.Frame)
			--row:EnableMouse()
			row:RegisterForDrag("LeftButton")
			                    row:SetMovable(true)
			                   row:SetScript("OnDragStart", function(self) self:GetParent():StartMoving()end)
			row:SetScript("OnDragStop",  function(self) self:GetParent():StopMovingOrSizing() OnDragStop() end)

			row:Show()

			row.Waypoint:SetScript("OnClick", WaypointButtonOnClick)
			row.ModelButton:SetScript("OnClick", ModelButtonOnClick)
            row.ModelButton:ClearAllPoints()
            row.ModelButton:SetPoint("TOP", row.Chk, "LEFT", 245, 10)
			row.Text:SetWidth(SF.Frame:GetWidth() - 90)
			row.Text:SetWordWrap(false)

			table.insert(SF.StickyQuests, questIndex)
			SF.revStickyQuests[questIndex] = rowNum

			SF.Frame:SetHeight((row:GetHeight( ) * rowNum) + 20)
            
            row.Desc:SetWidth(row.Desc:GetWidth())
            local descHeight = row.Desc:GetHeight()
            row:SetSize(SF.Frame:GetWidth() , 35 + descHeight)            

			DGV:UpdateStickyFrame( )
		end
	end

	function SF:RemoveRow(index)
		local stickyFrameRow 	= _G["DGV_SFRow".._GetNumStickyRows()]
		DebugPrint("Remove: "..(_G["DGV_SFRow"..index.."Text"]:GetText() or ""))
		stickyFrameRow.Text:SetText("")
		stickyFrameRow.Chk:Hide()
		stickyFrameRow.Waypoint:Hide()
		stickyFrameRow.Icon:Hide()
		stickyFrameRow.ModelButton:Hide()
		stickyFrameRow:Hide()
		SF.Frame:SetHeight( (stickyFrameRow:GetHeight( ) * (_GetNumStickyRows()-1) ) + 20 )
		table.remove(SF.StickyQuests, index)

		SF.revStickyQuests[index] = nil

		local questIndex, stickyIndex
		for stickyIndex, questIndex in ipairs(SF.revStickyQuests) do
			SF.revStickyQuests[questIndex] = stickyIndex
		end
	end

	function SF:Load()
		if not SF.Frame then
			SF.Frame = CreateFrame("Frame","DGV_StickyFrame", UIParent)

			SF.Frame:SetSize(OBJECTIVE_TRACKER_LINE_WIDTH + 38, 45)
			SF.Frame:EnableMouse(true)
			SF.Frame:RegisterForDrag("LeftButton")
			SF.Frame:SetMovable(true)
			SF.Frame:SetScript("OnUpdate", OnUpdate)

			SF.Frame:ClearAllPoints()

			local db = DGV.chardb.StickyFrame
			SF.Frame:SetPoint(db.relativePoint, db.pos_x, db.pos_y)
			--SF.Frame:SetPoint("TOPRIGHT", DugisSmallFrame, "BOTTOMRIGHT", 0, 0)
			SF.Frame:SetClampedToScreen(true)
			SF.Frame:Hide()
		end

		if _GetNumStickyRows() > 0 then
			SF.Frame:Show()
		end

		function DGV:UpdateStickyFrame( )
			if not SF.Frame then return end
			
			if #SF.StickyQuests > 0 and DGV:UserSetting(DGV_STICKYFRAME) then
				SF.Frame:Show()
				local questIndex, stickyIndex
                local deltaY = 0
				local DGV_SmallFrameFontSize = DGV:GetDB(DGV_SMALLFRAMEFONTSIZE)
				local filename, _, _  = _G["DGVRow1"].Name:GetFont()				
				
				for stickyIndex, questIndex in ipairs(SF.StickyQuests) do
					--DebugPrint("questIndex:"..questIndex.." stickyIndex:"..stickyIndex)
					local mainFrameRow 		= _G["DGVRow"..questIndex]
					local stickyFrameRow 	= _G["DGV_SFRow"..stickyIndex]
					
					if stickyFrameRow then
                        if DGV:UserSetting(DGV_STICKYFRAMESHOWDESCRIPTIONS) then
                            stickyFrameRow.Desc:SetText(mainFrameRow.Desc:GetText())
							stickyFrameRow.Desc:SetFont(filename, DGV_SmallFrameFontSize - 1)
                            stickyFrameRow.Desc:Show()	
                            stickyFrameRow.Desc:SetPoint("TOP", stickyFrameRow.Text, "BOTTOM", 0, -8)
                            stickyFrameRow.Desc:SetWidth(stickyFrameRow.Desc:GetWidth())
                            local descHeight = stickyFrameRow.Desc:GetHeight()
                            stickyFrameRow:SetSize(SF.Frame:GetWidth() , 35 + descHeight)
                            
                            local text = stickyFrameRow.Desc:GetText()
                            
                            if text == nil then
                                text = ""
                            end
                         
                            if stickyFrameRow.htmlDesc == nil then
                                stickyFrameRow.htmlDesc = CreateFrame("SimpleHTML",nil, stickyFrameRow)
                                stickyFrameRow.htmlDesc:SetFontObject(stickyFrameRow.Desc:GetFontObject())
                                stickyFrameRow.htmlDesc:SetWidth(stickyFrameRow.Desc:GetWidth())
                                stickyFrameRow.htmlDesc:SetPoint("LEFT", stickyFrameRow, "LEFT", 16, 0)    
                                stickyFrameRow.htmlDesc:SetPoint("TOP", stickyFrameRow.Text, "BOTTOM", 0, -8)    
                                stickyFrameRow.htmlDesc:SetPoint("RIGHT", stickyFrameRow.Text, "RIGHT", -16, 0)    
                                
                                stickyFrameRow.htmlDesc:Show()   
                         
                                stickyFrameRow.htmlDesc:SetScript("OnHyperlinkClick", DugisGuideViewer.NPCJournalFrame.OnHyperlinkClick) 
                                stickyFrameRow.htmlDesc:SetScript("OnHyperlinkEnter", function(self, linkData, link, button)
                                    DugisGuideViewer.NPCJournalFrame.OnHyperlinkEnter(self, linkData, link, button, false, true)
                                end) 
                                stickyFrameRow.htmlDesc:SetScript("OnHyperlinkLeave", DugisGuideViewer.NPCJournalFrame.OnHyperlinkLeave) 
                                stickyFrameRow.Desc.isHtml = true
                                
                                stickyFrameRow.Desc.GetStringHeight = function()
                                    local height = stickyFrameRow.htmlDesc:GetContentHeight()
                                    return height + 10
                                end
                                
                                stickyFrameRow.Desc.GetStringWidth = function()
                                    return stickyFrameRow.htmlDesc:GetWidth()
                                end                
                            else
                                stickyFrameRow.htmlDesc:Show()
                            end
                            stickyFrameRow.htmlDesc:SetFont(filename, DGV_SmallFrameFontSize - 1)
                            text = string.gsub(text, "\n", "<br/>")
                            text = string.gsub(text, "&", "&amp;")
                            stickyFrameRow.htmlDesc:SetText('<html><body><p align="left">'..text..'</p></body></html>')    
                            stickyFrameRow.Desc:Hide()    
                        else
                            stickyFrameRow.Desc:Hide()	
                            stickyFrameRow:SetSize(SF.Frame:GetWidth() , 30)
                        end
                        
						stickyFrameRow.Text:SetText(mainFrameRow.Name:GetText())
						stickyFrameRow.Text:SetFont(filename, DGV_SmallFrameFontSize)
						stickyFrameRow.Text:SetTextColor(mainFrameRow.Name:GetTextColor())
						stickyFrameRow.Chk:SetChecked(mainFrameRow.Chk:GetChecked())
						
						if mainFrameRow.Chk:IsEnabled() then stickyFrameRow.Chk:Enable() else stickyFrameRow.Chk:Disable()  end
						stickyFrameRow.Chk:Show()
						
						if DGV:HasCoord(questIndex) then 
							stickyFrameRow.Waypoint:Enable()
							stickyFrameRow.Waypoint:Show()
							stickyFrameRow.Text:SetPoint("LEFT", 65, 0)
							stickyFrameRow.Chk:SetPoint("RIGHT", stickyFrameRow.Waypoint, "LEFT", 5, 0)		
						else 
							stickyFrameRow.Waypoint:Disable()
							stickyFrameRow.Waypoint:Hide()
							stickyFrameRow.Text:SetPoint("LEFT", 51, 0)
							stickyFrameRow.Chk:SetPoint("RIGHT", stickyFrameRow.Icon, "LEFT", 0, 0)							
						end
						if DGV:HasModel(questIndex) then
							stickyFrameRow.ModelButton:Show()
							stickyFrameRow.ModelButton.GuideIndex = questIndex
						else
							stickyFrameRow.ModelButton:Hide()
						end
						--DGV.ModelViewer:RefreshButtonPushedState(stickyFrameRow.ModelButton)
						stickyFrameRow.Waypoint:Show()
						
						--stickyFrameRow.Icon:SetNormalTexture(mainFrameRow.Button:GetNormalTexture())
						stickyFrameRow.Icon:SetNormalTexture(DGV:getIcon(DGV.actions[questIndex], questIndex))
						stickyFrameRow.Icon:Show()
						stickyFrameRow.Icon:SetPoint("RIGHT", stickyFrameRow.Text, "LEFT", 0, -1)

                        local currentHeight = stickyFrameRow:GetHeight()              
						stickyFrameRow:SetPoint("TOPLEFT", SF.Frame, "TOPLEFT", 0, -(deltaY + 20))
                        
                        deltaY = deltaY + currentHeight
					end
				end

                SF.Frame:SetHeight(deltaY + 20)                 
			else
				SF.Frame:Hide()
			end

		end

		function DGV:ClearStickyFrame( )
			local index, guideIndex
			
			for index, guideIndex in ipairs(SF.StickyQuests) do
				local stickyFrameRow = _G["DGV_SFRow"..index]
				stickyFrameRow.Text:SetText("")
				stickyFrameRow.Chk:Hide()
				stickyFrameRow.Waypoint:Hide()
				stickyFrameRow.Icon:Hide()
				stickyFrameRow.ModelButton:Hide()
				stickyFrameRow:Hide()
			end
			
			SF.Frame:Hide()
			SF.StickyQuests = {}
			SF.revStickyQuests = {}
		end
	end

	function SF:Unload()
		SF.Frame:Hide()
	end
end
