local DGV = DugisGuideViewer
local CurrentAction, DebugPrint = CurrentAction, DGV.DebugPrint
local texture, item

local questItemFrame = DugisSecureQuestButton
local actionFrame = CreateFrame("Button", "DugisGuideViewerActionItemFrame", UIParent, "DugisSecureQuestButtonTemplate")
--actionFrame:SetNormalTexture("Interface\\AddOns\\DugisGuideViewerZ\\Artwork\\IconBorder")
actionFrame:SetPushedTexture("Interface\\Buttons\\UI-Quickslot-Depress")
actionFrame:SetHighlightTexture("Interface\\Buttons\\ButtonHilight-Square")
--questItemFrame:SetFrameStrata("LOW")
--actionFrame:SetFrameStrata("LOW")
local cooldown = CreateFrame("Cooldown", nil, actionFrame)
cooldown:SetAllPoints(actionFrame)
cooldown:Hide()
local function RefreshCooldown()
	if not item or not actionFrame:IsVisible() then return end
	local start, duration, enabled = GetItemCooldown(item)
	if enabled then
		cooldown:Show()
		cooldown:SetCooldown(start, duration)
	else cooldown:Hide() end
end
cooldown:RegisterEvent("ACTIONBAR_UPDATE_COOLDOWN")
cooldown:SetScript("OnEvent", RefreshCooldown)
actionFrame:SetScript("OnShow", RefreshCooldown)
local itemicon = actionFrame:CreateTexture(nil, "ARTWORK")
itemicon:SetWidth(28) itemicon:SetHeight(28)
itemicon:SetTexture("Interface\\Icons\\INV_Misc_Bag_08")
itemicon:SetAllPoints(actionFrame)
actionFrame:RegisterForClicks("anyUp")

local function OnClick()
	if DGV.actions and  DGV.actions[DugisGuideUser.CurrentQuestIndex] == "U" then
		DebugPrint("Detected use item")
		DGV:SetChkToComplete(DugisGuideUser.CurrentQuestIndex)
		DGV:MoveToNextQuest()	
	end
end

local function InitFrame(frame, other)
	frame:SetClampedToScreen(true);
	frame:SetHeight(26)
	frame:SetWidth(26)
	frame:SetPoint("CENTER", 0, 35)
	frame:Hide()
	frame:HookScript("OnClick", OnClick)
	frame:RegisterForDrag("LeftButton")
	frame:SetMovable(true)
	frame:SetUserPlaced(true)
	frame:SetClampedToScreen(true)
	frame:SetScript("OnDragStart", function(self)
		if not InCombatLockdown() then
			self.IsMoving = true
			self:StartMoving()
		end
	end)
	frame:SetScript("OnDragStop", function(self)
		self.IsMoving = false
		self:StopMovingOrSizing()
	end)
	frame:HookScript("OnUpdate", function(self)
		if not InCombatLockdown() and self.IsMoving then
			other:ClearAllPoints()
			other:SetPoint("LEFT", self)
			if DugisGuideViewer:IsModuleLoaded("Target") then
				DugisGuideViewer_TargetFrame:ClearAllPoints()
				DugisGuideViewer_TargetFrame:SetPoint("LEFT", self, "RIGHT", "5", "0")
			end
		end
	end)
end
InitFrame(questItemFrame, actionFrame)
InitFrame(actionFrame, questItemFrame)

local function OnEvent(self, event)
	if event == "PLAYER_REGEN_ENABLED" then
		questItemFrame:Hide()
		if texture and DGV:UserSetting(DGV_ITEMBUTTONON) then
			itemicon:SetTexture(texture)
			actionFrame:SetAttribute("type1", "item")
			actionFrame:SetAttribute("item1", "item:"..item)
			actionFrame:Show()
			texture = nil
			local key = GetBindingKey("CLICK DugisGuideViewerActionItemFrame:LeftButton") or GetBindingKey("CLICK DugisSecureQuestButton:LeftButton")
			if key then SetOverrideBindingClick(questItemFrame, true, key, "DugisGuideViewerActionItemFrame", "LeftButton") end
		else
			actionFrame:SetAttribute("item1", nil)
			actionFrame:Hide()
		end
		self:UnregisterEvent("PLAYER_REGEN_ENABLED")
	elseif event == "PLAYER_REGEN_DISABLED" then
		actionFrame:StopMovingOrSizing()
		questItemFrame:StopMovingOrSizing()
		questItemFrame.IsMoving = false
		questItemFrame.IsMoving = false
	end
end
actionFrame:SetScript("OnEvent", OnEvent)
actionFrame:RegisterEvent("PLAYER_REGEN_DISABLED")

--frame:SetFrameStrata("LOW")

function Dugi_ItemButton_OnEvent(self, event, ...)
	if ( event == "PLAYER_TARGET_CHANGED" ) then
		self.rangeTimer = -1
	elseif ( event == "BAG_UPDATE_COOLDOWN" ) then
		Dugi_Item_UpdateCooldown(self)
	end
end

function Dugi_ItemButton_OnUpdate(self, elapsed)
	local rangeTimer = self.rangeTimer
	if ( rangeTimer ) then
		rangeTimer = rangeTimer - elapsed
		if ( rangeTimer <= 0 ) then
			local link, item, charges, showItemWhenComplete = GetQuestLogSpecialItemInfo(self.questLogIndex)
			if ( not charges or charges ~= self.charges ) then
				return
			end
			local valid = IsQuestLogSpecialItemInRange(self.questLogIndex)
			if ( valid == 0 ) then
				self.range:Show()
				self.range:SetVertexColor(1.0, 0.1, 0.1)
			elseif ( valid == 1 ) then
				self.range:Show()
				self.range:SetVertexColor(0.6, 0.6, 0.6)
			else
				self.range:Hide()
			end
			rangeTimer = 0.3
		end

		self.rangeTimer = rangeTimer
	end
end

function Dugi_Item_UpdateCooldown(itemButton)
	local start, duration, enable = GetQuestLogSpecialItemCooldown(itemButton.questLogIndex)
	if ( start ) then
		CooldownFrame_SetTimer(itemButton.cooldown, start, duration, enable)
		if ( duration > 0 and enable == 0 ) then
			SetItemButtonTextureVertexColor(itemButton, 0.4, 0.4, 0.4)
		else
			SetItemButtonTextureVertexColor(itemButton, 1, 1, 1)
		end
	end
end

function DGV.SetQuestItemButtonAttributes(button, logIndex)
	button:Show()
	local link, icon, charges = GetQuestLogSpecialItemInfo(logIndex)
	local useItem = DGV:GetItemIdFromLink(link)
	local buttonName = "Dugi_ItemButton"..logIndex
	button:SetAttribute("type1", "item")
	button:SetAttribute("item1", "item:"..useItem)
	button.questLogIndex = logIndex;
	button.charges = charges;
	button.rangeTimer = -1;

	button.cooldown = CreateFrame("Cooldown", buttonName.."Cooldown", button, "CooldownFrameTemplate")
	button.cooldown:SetAllPoints()

	button.range = button:CreateFontString(buttonName.."Range", "ARTWORK", "NumberFontNormalSmallGray")
	button.range:SetSize(29, 10)
	button.range:SetJustifyH("LEFT")
	button.range:SetText("●")
	button.range:SetPoint("TOPRIGHT", button.icon, 16, -2)

	button.count = button:CreateFontString(buttonName.."Count", "BORDER", "NumberFontNormal")
	button.count:SetJustifyH("RIGHT")
	button.count:SetPoint("BOTTOMRIGHT", button.icon, -3, 2)
		
	SetItemButtonTexture(button, icon);
	SetItemButtonCount(button, charges);
	Dugi_Item_UpdateCooldown(button)
end

local function SetQuestItemFrame(logIndex, icon, charges)
	if not logIndex then return end
	if DGV:UserSetting(DGV_ITEMBUTTONON) then
		if InCombatLockdown() then 
			questItemFrame:RegisterEvent("PLAYER_REGEN_ENABLED")
			questItemFrame:SetScript("OnEvent", function(self, event)
				if event == "PLAYER_REGEN_ENABLED" then
					SetQuestItemFrame(logIndex, icon, charges)
					self:UnregisterEvent("PLAYER_REGEN_ENABLED")
				end
			end)
		else
			DGV.ItemButton = questItemFrame
			DGV.SetQuestItemButtonAttributes(questItemFrame, logIndex)
			actionFrame:Hide()
			ClearOverrideBindings(questItemFrame)
			local scale = (DugisGuideViewer:UserSetting(DGV_ITEMBUTTONSCALE)-1)/10 + 1
			questItemFrame:SetScale(scale)
		end
	end 
end

local function SetActionFrame(useitem)
	DGV.ItemButton = actionFrame
	item, texture = useitem, useitem and GetItemIcon(useitem)
	if InCombatLockdown() then 
		actionFrame:RegisterEvent("PLAYER_REGEN_ENABLED") 
	else 
		OnEvent(actionFrame, "PLAYER_REGEN_ENABLED") 
		local scale = (DugisGuideViewer:UserSetting(DGV_ITEMBUTTONSCALE)-1)/10 + 1
		actionFrame:SetScale(scale)
	end
end

function DGV:SetUseItem(index)
	--DGV:DebugFormat("SetUseItem", "stack", debugstack())
	if DGV:IsModuleLoaded("Guides") then
		local useitem = DGV.useitem[index]
		local logIndex = DGV:GetQuestLogIndexByQID(DGV.qid[index])
		local link, icon, charges, showItemWhenComplete, isComplete
		if logIndex then
			isComplete = select(6, GetQuestLogTitle(logIndex))
			link, icon, charges, showItemWhenComplete = GetQuestLogSpecialItemInfo(logIndex);
			--DebugPrint("Debug SetUseItem: logIndex="..tostring(logIndex).." DugisGuideViewer:GetItemIdFromLink(link)="..DugisGuideViewer:GetItemIdFromLink(link).." useitem="..useitem)
		end
		if not logIndex or not link or (logIndex and isComplete and not showItemWhenComplete) or 
			(useitem and DGV:GetItemIdFromLink(link)~=tonumber(useitem)) then
			SetActionFrame(useitem)
		else
			SetQuestItemFrame(logIndex, icon, charges)
		end
	end
end

function DGV:SetUseItemByQID(qid)
	if qid then
		local logIndex = DGV:GetQuestLogIndexByQID(qid)
		local link, icon, charges, showItemWhenComplete, isComplete, useitem
		local guideIndex = DGV.Modules.DugisArrow:GetFirstWaypointGuideIndex()
		if logIndex then
			isComplete = select(6, GetQuestLogTitle(logIndex))
			link, icon, charges, showItemWhenComplete = GetQuestLogSpecialItemInfo(logIndex);
			if link then
				useitem = DGV:GetItemIdFromLink(link)
			elseif DugisGuideViewer:IsModuleRegistered("Guides") and DGV.useitem then
				useitem = DGV.useitem[guideIndex]
			end
		elseif DugisGuideViewer:IsModuleRegistered("Guides") and DGV.useitem then
			useitem = DGV.useitem[guideIndex]
		end
		if not logIndex or not link or (logIndex and isComplete and not showItemWhenComplete) then
			SetActionFrame(useitem)
		else
			SetQuestItemFrame(logIndex, icon, charges)
		end
	end
end
