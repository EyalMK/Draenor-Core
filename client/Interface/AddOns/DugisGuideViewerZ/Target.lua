local DGV = DugisGuideViewer
if not DGV then return end

local MV, DebugPrint = DugisGuideViewer.Modules.ModelViewer, DGV.DebugPrint
local Target = DGV:RegisterModule("Target")
--DGV.Target = Target

function Target:ShouldLoad()
	return DGV:UserSetting(DGV_TARGETBUTTON) and DugisGuideViewer.GuideOn()
end

function Target:Initialize()

	--Updates target button's size
	local function UpdateTargetButtonSize()
		local DGV_TargetButtonSize = 23 + (DGV:GetDB(DGV_TARGETBUTTONSCALE) * 3);
		Target.Frame:SetSize(DGV_TargetButtonSize, DGV_TargetButtonSize)
	end

	--Make target macro
	local function OnEvent(self, event)
		if event=="PLAYER_REGEN_ENABLED" then
			if DGV:UserSetting(DGV_TARGETBUTTON) and #Target.npcIds>0 then

				Target.numNPCs = #Target.npcIds
				
				if DGV:IsModelDataOn() then 
					Target.npcIndex = MV.data.modelPage 
				else 
					if not Target.npcIndex or Target.npcIndex >= Target.numNPCs then Target.npcIndex = 0 end Target.npcIndex = Target.npcIndex + 1
				end

				Target.macroName = "DugisMacro"
				Target.macroIcon = 203
				Target.npc = DGV:GetLocalizedNPC(Target.npcIds[Target.npcIndex])
				Target.macroBody = "/cleartarget\n/tar "..(Target.npc or "").."\n/run DugisGuideViewer:FinalizeTarget()\n"
				--DebugPrint("macroTarget= "..Target.macroBody)
				if DGV:UserSetting(DGV_TARGETBUTTONCUSTOM) then
					Target.macroBody = Target.macroBody..(Target.customMacro or "")
				else
					--Target.macroBody = Target.macroBody.."\n/script local icon; if UnitIsFriend(\"player\", \"target\") then icon = \"1\" else icon = \"8\" end;"
					--Target.macroBody = Target.macroBody.."if not GetRaidTargetIndex(\"target\") then SetRaidTarget(\"target\", icon) end "
					Target.macroBody = Target.macroBody..Target.DefaultMacro
				end

				--local macroIndex = Target:CreateMacro( )
				--if macroIndex then
					Target.Frame:SetAttribute("type", "macro")
					Target.Frame:SetAttribute("macrotext", Target.macroBody)
					if DGV:UserSetting(DGV_TARGETBUTTONSHOW) then Target.Frame:Show() end
				--end
				
				UpdateTargetButtonSize()
				
			else
				Target.Frame:SetAttribute("macro", nil)
				Target.Frame:Hide()
			end

			self:UnregisterEvent("PLAYER_REGEN_ENABLED")
		elseif event == "PLAYER_REGEN_DISABLED" then
			Target.Frame:StopMovingOrSizing()
			Target.Frame.IsMoving = false
		end
	end
    
    local modelFrame = GUIUtils:CreateModelFrame(GameTooltip, 30)
    modelFrame:SetSize(140, 180)
    modelFrame:SetPoint("TOPLEFT", GameTooltip, "TOPLEFT", 10, -20) 
    modelFrame:Hide()
    
	function InitModelPos(npcId)
		modelFrame.posX = 0
		modelFrame.posY = 0
		modelFrame:SetPosition(0, 0, 0)
        local progdir = 0
        local prog = 0
        
        local modelId = tonumber(npcId)

        local transformation1 = DGV.ObjectModelsExtra[modelId]
        local transformation2  = DGV.DisplayModelsExtra[modelId]
        local transformation3  = DGV.NPCModelsExtra[modelId]
        
        local transformation = transformation1 or transformation2 or transformation3 or {}
        local viewer = modelFrame
        
        viewer:SetCamDistanceScale(1)
        viewer:SetPortraitZoom(0)
        local curfacing = 0
     
        if transformation then
            local modelScale = transformation.scale and max(transformation.scale,0.01) or 1.01
            viewer:SetModelScale(modelScale)
            viewer:SetPosition(transformation.cx or 0,transformation.cy or 0,(transformation.cz or 0))

            if transformation.cam then viewer:SetCamera(transformation.cam) else viewer:RefreshCamera() end
            viewer:SetCamDistanceScale(transformation.camscale and max(transformation.camscale,0.01) or 1.01)
            if transformation.portrait and transformation.portrait>0 then viewer:SetPortraitZoom(transformation.portrait) end
            curfacing = (transformation.facing or 0) / 57.30       
        end
        
        if transformation and transformation.facing then
            viewer:SetFacing(curfacing)   
        end     
            
	end    
    
    function SetModel(npcId)
        modelFrame:Show()
        GameTooltip:SetMinimumWidth(140)
        modelFrame.title:Hide()
		local mv = DGV.Modules.ModelViewer
		modelFrame:Show()
		modelFrame:ClearModel()
		if mv and mv.npcDB and mv.npcDB[npcId] then
			modelFrame:SetDisplayInfo(mv.npcDB[npcId])
		else
			modelFrame:SetCreature(npcId)
		end
        
        InitModelPos(npcId)
    end

	function Target:ShowTooltip( )
        GameTooltip:SetOwner(Target.Frame, "ANCHOR_RIGHT", 0, 0)            
        GameTooltip:ClearLines() 
        local npcName = DGV:GetLocalizedNPC(Target.npcIds[Target.npcIndex])

        if npcName == nil then
            npcName = ""
        end
		
		local filename, _, _ = GameTooltipTextLeft1:GetFont()
		GameTooltipTextLeft1:SetFont(filename, 12)

        GameTooltip:AddLine("|cffffffff/target|r " .. npcName, nil, nil, nil, true)
        LuaUtils:loop(12, function(i)
            GameTooltip:AddLine(" ")
        end)
        SetModel(Target.npcIds[1])
        GameTooltip:Show()     
    end
    
	function Target:HideTooltip( )
        GameTooltip:ClearLines() 
        GameTooltip:Hide()  
        modelFrame:Hide()
    end
    
	function Target:CreateFrame( )
		if Target.Frame then return end
		Target.Frame = CreateFrame("Button", "DugisGuideViewer_TargetFrame", UIParent, "SecureActionButtonTemplate")
		Target.Frame:SetClampedToScreen(true);
		--Target.Frame:SetFrameStrata("LOW");
		UpdateTargetButtonSize()
		--Target.Frame:SetPoint("LEFT", "DugisSecureQuestButton", "RIGHT", "5", "0")
		Target.Frame:SetPoint("LEFT", "DugisGuideViewerActionItemFrame", "RIGHT", "5", "0")
		Target.Frame:SetScript("OnUpdate", function(self, elapsed) Target:OnUpdate(self, elapsed) end)
		Target.Frame:SetScript("OnEvent", OnEvent)
		Target.Frame:HookScript("OnClick", DGV.FinalizeTarget)

		Target.Frame:SetNormalTexture("Interface\\AddOns\\DugisGuideViewerZ\\Artwork\\IconBorder")
		Target.Frame:SetPushedTexture("Interface\\Buttons\\UI-Quickslot-Depress")
		Target.Frame:SetHighlightTexture("Interface\\Buttons\\ButtonHilight-Square")
		Target.Frame:RegisterForClicks("anyUp")
		Target.Frame:RegisterForDrag("LeftButton")
		Target.Frame:SetMovable(true)
		Target.Frame:SetUserPlaced(true)
        
        Target.Frame:SetScript("OnEnter", function()    
			if DGV:UserSetting(DGV_TARGETTOOLTIP) then 
          	  Target:ShowTooltip( )    
			end
        end)
        
        Target.Frame:SetScript("OnLeave", function()
            if DGV:UserSetting(DGV_TARGETTOOLTIP) then 
				Target:HideTooltip( )     
			end
        end)
        
		Target.Frame:SetScript("OnDragStart", function(frame)
			if not InCombatLockdown() then
				frame:StartMoving();
				frame.IsMoving = true
			end
		end)
		Target.Frame:SetScript("OnDragStop", function(frame)
			frame:StopMovingOrSizing()
			frame.IsMoving = false
		end)

		Target.Frame.icon = Target.Frame:CreateTexture(nil, "BORDER")
		Target.Frame.icon:SetTexture("Interface\\Icons\\Ability_Hunter_SniperShot")
		Target.Frame.icon:SetSize("28", "28")
		Target.Frame.icon:SetAllPoints(Target.Frame)
	end
   
    -- duration (duration factor):  1 - standard duration , 2 - 2 x longer, 0.5 - 2 x slower
    function Target:PlayAnimation(alpha, duration, loopAnimationDurationSec) --/script DugisGuideViewer.Modules.Target:PlayAnimation(1, 0.5)
        if duration == nil then
            duration = 1
        end
    
        if alpha == nil then
            alpha = 1
        end
        
        if loopAnimationDurationSec == nil then
            loopAnimationDurationSec = 4
        end
        
        if Target.animation == nil then
            Target.animation = CreateFrame("Frame", "TMW_ActionButtonOverlay" .. 1, Target.Frame, "ActionBarButtonSpellActivationAlert")
        end
        
        local animations = {DugisGuideViewer.Modules.Target.animation.animIn:GetAnimations()}
        for i=1, #animations do
            if animations[i].origDuration == nil then
                animations[i].origDuration = animations[i]:GetDuration()
            end
            animations[i]:SetDuration(duration * animations[i].origDuration)
        end
        
        Target.animation:SetAlpha(alpha)
		Target.animation:ClearAllPoints();
		Target.animation:SetPoint("TOPLEFT", Target.Frame, "TOPLEFT", -5, 5);
		Target.animation:SetPoint("BOTTOMRIGHT", Target.Frame, "BOTTOMRIGHT", 5, -5);
        Target.animation:Show()
        Target.animation.animIn:Play();
        Target.animation.startTime = GetTime()
        Target.animation.duration = loopAnimationDurationSec
        Target.animation:HookScript("OnUpdate", function(self, elapsed)
            if (GetTime() - Target.animation.startTime) >= Target.animation.duration then
                Target.animation.animIn:Stop()
                Target.animation:Hide()
            end
        end)
    end
    
	local function AddNPCs(...)
		for i=1, select("#", ...) do
			local singleVal = select(i, ...)
			table.insert(Target.npcIds, singleVal)
		end
	end

	function Target:AddIndexNPCs(questIndex)
		AddNPCs(DGV:ReturnTag("NPC", questIndex))
	end
    
    function Target:SetIndexNPCs(npcId)
		AddNPCs(npcId)
	end

	function Target:CreateMacro( )

		if InCombatLockdown() then return end

		local index = GetMacroIndexByName(Target.macroName)
		--Macro does not exist, create it
		if index == 0 then
			index = nil
			local numAcctMacros, numCharMacros = GetNumMacros()

			--Character Macro
			if numCharMacros < (MAX_CHARACTER_MACROS or 18) then
				index = CreateMacro(Target.macroName, Target.macroIcon, Target.macroBody, 1)
			end

			--General Macro
			if not index and numAcctMacros < (MAX_ACCOUNT_MACROS or 36) then
				DebugPrint("Character Macros full, trying general area")
				index = CreateMacro(Target.macroName, Target.macroIcon, Target.macroBody)
			end
		else
			EditMacro(index, Target.macroName, Target.macroIcon, Target.macroBody)
		end

		if not index then
			DebugPrint("Create Macro Failed")
		end
		return index
	end


	function Target:CustomizeMacro()
		local inputBox = _G["DGV.InputBox"..DGV_TARGETBUTTONCUSTOM]

		Target.customMacro = inputBox:GetText()
		DGV.chardb[DGV_TARGETBUTTONCUSTOM].editBox = inputBox:GetText()
		DGV:SetTarget(DugisGuideUser.CurrentQuestIndex)
	end

	function Target:ResetMacro( )
		Target.customMacro = Target.DefaultMacro
		DGV.chardb[DGV_TARGETBUTTONCUSTOM].editBox = Target.DefaultMacro
		_G["DGV.InputBox"..DGV_TARGETBUTTONCUSTOM]:SetText(Target.DefaultMacro)
		_G["DGV.InputBox"..DGV_TARGETBUTTONCUSTOM]:SetCursorPosition(0)
		DGV:SetTarget(DugisGuideUser.CurrentQuestIndex)
	end

	function Target:ClearMacro( )
		DGV.chardb[DGV_TARGETBUTTONCUSTOM].editBox = ""
		_G["DGV.InputBox"..DGV_TARGETBUTTONCUSTOM]:SetText("")
		_G["DGV.InputBox"..DGV_TARGETBUTTONCUSTOM]:SetCursorPosition(0)
	end

	--Sticky frames target and item button
	function Target:OnUpdate(self, elapsed)
		if not InCombatLockdown() and self.IsMoving then
			DugisGuideViewerActionItemFrame:ClearAllPoints()
			DugisGuideViewerActionItemFrame:SetPoint("RIGHT", self, "LEFT", "-5", "0")
			DugisSecureQuestButton:ClearAllPoints()
			DugisSecureQuestButton:SetPoint("RIGHT", self, "LEFT", "-5", "0")
		end
	end

	Target.npcIds = {}
	Target:CreateFrame( )
	Target.customMacro = DGV.chardb[DGV_TARGETBUTTONCUSTOM].editBox
	
	Target.DefaultMacro = "/run DugisGuideViewer:MarkTarget()"

	function Target:Load()
		--Target.Frame:Show( )

		Target.Frame:RegisterEvent("PLAYER_REGEN_DISABLED")
		function DGV:FinalizeTarget()
			if InCombatLockdown() then
				Target.Frame:RegisterEvent("PLAYER_REGEN_ENABLED")
			else
				OnEvent(Target.Frame, "PLAYER_REGEN_ENABLED")
			end
		end
		DGV:FinalizeTarget()

		function DGV:SetTarget(questIndex)
			local sameNpc = nil
			if Target.npcIds[1] == select(1, DGV:ReturnTag("NPC", questIndex)) then sameNpc = true end
			
			DGV:WipeTargetNPCs()
			Target:AddIndexNPCs(questIndex)
			DGV:FinalizeTarget()
    
            if Target.lastSetQuestIndex ~= questIndex and not sameNpc then
                if Target.Frame:IsShown() then
                    Target:PlayAnimation(0.3, 1, 2)
                else
                    Target:PlayAnimation(1, 1, 5)
                end
            end
            Target.lastSetQuestIndex = questIndex
		end
        
        function DGV:SetNPCTarget(npcId)
			local sameNpc = nil
			if Target.npcIds[1] == npcId then sameNpc = true end		
		
			DGV:WipeTargetNPCs()
			Target:SetIndexNPCs(npcId)
			DGV:FinalizeTarget()
			
            if not sameNpc then
                if Target.Frame:IsShown() then
                    Target:PlayAnimation(0.3, 1, 2)
                else
                    Target:PlayAnimation(1, 1, 5)
                end
            end			
		end

		function DGV:WipeTargetNPCs()
			wipe(Target.npcIds)
		end
		
		function DGV:MarkTarget()
			if not GetRaidTargetIndex("target") then 
				if UnitIsFriend("player", "target") then 
					SetRaidTarget("target", "1") 
				else 
					SetRaidTarget("target", "8") 
				end 
			end
		end 
	end

	function Target:Unload()
		DGV:FinalizeTarget()
		Target.Frame:UnregisterEvent("PLAYER_REGEN_DISABLED")
		Target.Frame:Hide( )
	end
end






