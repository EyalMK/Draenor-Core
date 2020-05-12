local DGV = DugisGuideViewer
if not DGV then return end
local _

local MV = DGV:RegisterModule("ModelViewer")
local DebugPrint = DGV.DebugPrint


function MV:ShouldLoad()
	return DGV:UserSetting(DGV_ENABLEMODELDB) --or DGV_ENABLENPCNAMEDB
		and DGV.chardb.EssentialsMode<1
		and DugisGuideViewer.GuideOn()
end

function MV:Initialize()
	local modelPool = nil
	
	local function OnDragStop(self, button)
		self:StopMovingOrSizing()
		local point, relativeTo, relativePoint, xOfs, yOfs = MV.Frame:GetPoint()
		DGV.chardb.ModelViewer.pos_x = xOfs
		DGV.chardb.ModelViewer.pos_y = yOfs	
		DGV.chardb.ModelViewer.relativePoint = relativePoint
		MV.Frame.moving = false
	end

	local function OnDragStart(self, button)
		MV.Frame.moving = true
		self:StartMoving()
	end
    
    function MV:UpdateLastPageChangeTime()
        MV.lastModelPageChangeTime = GetTime()
    end

	local function ToggleModelPage(direction)
		if not MV:ShouldLoad() then return end
		if direction then 
			MV.slideshowOn = nil
		else 
			MV.slideshowOn = true 
		end
		local modelId, modelPage, modelType, numModels, failed
			
		--No obj or npc tag
		if not MV.data.models or #MV.data.models==0 then
			MV:HideModel()
			return
		end
		
		if direction == "backwards" then
			MV.data.modelPage = MV.data.modelPage - 1 
		else 
			MV.data.modelPage = MV.data.modelPage + 1
            
            if MV.data.modelPage > #MV.data.models then
                MV.data.modelPage = 1
            end
		end
        
        MV:UpdateLastPageChangeTime()

		numModels 	= #MV.data.models
		modelPage 	= MV.data.modelPage
		modelId 	= MV.data.models[modelPage].modelId
		modelType 	= MV.data.models[modelPage].modelType
        MV.Frame.model.modelId = modelId
			
		--DebugPrint("modelPage="..modelPage.." modelId="..modelId.." modelType="..modelType)
		MV.Frame:Show()
		--MV.Frame.model:ClearModel()
		if modelType == "NPC" and MV.npcDB[modelId] then
			MV.Frame.model:SetDisplayInfo(MV.npcDB[modelId])
			MV.Frame.model.title:SetText(DGV:GetLocalizedNPC(modelId))
		elseif modelType == "OBJ" and MV.objDB[modelId] then
			MV.Frame.model:SetModel(MV.objDB[modelId]..".m2")
			MV.Frame.model.title:SetText("")
		elseif modelType == "NPC" and not self.npcDB[modelId] then
			MV.Frame.model:SetCreature(modelId)
			MV.Frame.model.title:SetText(DGV:GetLocalizedNPC(modelId))
			
			DebugPrint("[MV] Error: Display Id missing from db try SetCreature")
			if not MV.Frame.model:GetModel() then
				DebugPrint("[MV] Error: SetCreature failed")
				failed = true
			else
				DebugPrint("[MV]: SetCreature success")
			end
		else
			failed = true
		end
		
		if failed then --Error
			if modelType == "NPC" and not MV.npcDB[modelId] then DebugPrint("[MV] Error : npc ID:"..modelId.." display ID missing from db") end
			if modelType == "OBJ" and not MV.objDB[modelId] then DebugPrint("[MV] Error : object ID:"..modelId.." path missing from db") end
			MV:HideModel()
		else
			MV.Frame.model:SetRotation(0) 
			MV.Frame.model:SetPortraitZoom(0)
			MV:InitModelPos()
		end
			
		--Page navigation
		if numModels == 1 then
			MV.Frame.scrollTitle:Hide()
			MV.Frame.scrollLeft:Hide()
			MV.Frame.scrollRight:Hide()
		else
			MV.Frame.scrollTitle:Show()
			MV.Frame.scrollLeft:Show()
			MV.Frame.scrollRight:Show()
			
			if modelPage > 1 and modelPage < numModels then 
				MV.Frame.scrollLeft:Enable()
				MV.Frame.scrollRight:Enable()
			elseif numModels > 1 and modelPage < numModels then
				MV.Frame.scrollLeft:Disable()
				MV.Frame.scrollRight:Enable()
			elseif numModels > 1 and modelPage > 1 then	
				MV.Frame.scrollLeft:Enable()
				MV.Frame.scrollRight:Disable()
			else
				MV.Frame.scrollLeft:Disable()
				MV.Frame.scrollRight:Disable()
			end
			MV.Frame.scrollTitle:SetText(modelPage.." of "..numModels)
		end
		DGV:FinalizeTarget()	
	end
    

    --Slideshow configuration
    
	MV.slideshowOn = true
    MV.slideshowIntervalSec = 5
    MV.lastModelPageChangeTime = GetTime()
    MV.slideEffectOn = false
    MV.slideEffectDuration = 0.3
    MV.slideEffectDeltaY = - 0.4
    MV.slideEffectDeltaZ = - 0.4
    MV.slideEffectDeltaScale = 0.3
    MV.slideEffectDeltaAlpha = 0.8
        
    local function SlideShowUpdate(self)
        if not MV.slideshowOn then return end
		self:SetAlpha(1)
        
        if #MV.data.models > 1 then
            if (GetTime() - MV.lastModelPageChangeTime) > MV.slideshowIntervalSec then
                ToggleModelPage()
            end
            
            --SlideShow effect
            if MV.slideEffectOn then
                if (GetTime() - MV.lastModelPageChangeTime) > (MV.slideshowIntervalSec - MV.slideEffectDuration) then
                
                    local slideEffectTime = (GetTime() - MV.lastModelPageChangeTime) - (MV.slideshowIntervalSec - MV.slideEffectDuration)
                    local normalizedSlideEffectTime = slideEffectTime / MV.slideEffectDuration
                   
                    MV.Frame.model:SetPosition(MV.baseSlideAnimationX
                    , MV.baseSlideAnimationY + MV.slideEffectDeltaY * normalizedSlideEffectTime
                    , MV.baseSlideAnimationZ + MV.slideEffectDeltaZ * normalizedSlideEffectTime)
               
                    self:SetModelScale(MV.baseSlideAnimationScale + normalizedSlideEffectTime * MV.slideEffectDeltaScale);
                    self:SetAlpha(1 - normalizedSlideEffectTime * MV.slideEffectDeltaAlpha)
                else
                    MV.baseSlideAnimationX, MV.baseSlideAnimationY, MV.baseSlideAnimationZ = self:GetPosition()
                    MV.baseSlideAnimationScale = self:GetModelScale()
                end
            end
        end
    end

	local function On_Model_OnUpdate(self, ...)
        SlideShowUpdate(self)
		
        if ( self.panning ) then
			local modelScale = self:GetModelScale();
			local cursorX, cursorY = GetCursorPosition();
			local scale = UIParent:GetEffectiveScale();
			ModelPanningFrame:SetPoint("BOTTOMLEFT", cursorX / scale - 16, cursorY / scale - 16); -- half the texture size to center it on the cursor
			-- settings
			--[[local settings;
			local hasAlternateForm, inAlternateForm = HasAlternateForm();
			if ( hasAlternateForm and inAlternateForm ) then
				settings = ModelSettings[playerRaceSex.."Alt"];
			else
				settings = ModelSettings[playerRaceSex];
			end]]

			local zoom = self.zoomLevel or self.minZoom;
			zoom = 1 + zoom - self.minZoom; -- want 1 at minimum zoom

			-- Panning should require roughly the same mouse movement regardless of zoom level so the model moves at the same rate as the cursor
			-- This formula more or less works for all zoom levels, found via trial and error
			local transformationRatio = --[[settings.panValue]]40 * 2 ^ (zoom * 2) * scale / modelScale;

			local dx = (cursorX - self.cursorX) / transformationRatio;
			local dy = (cursorY - self.cursorY) / transformationRatio;
			local cameraY = self.cameraY + dx;
			local cameraZ = self.cameraZ + dy;
			-- bounds
			scale = scale * modelScale;
			--[[local maxCameraY = settings.panMaxRight * scale;
			cameraY = min(cameraY, maxCameraY);
			local minCameraY = settings.panMaxLeft * scale;
			cameraY = max(cameraY, minCameraY);
			local maxCameraZ = settings.panMaxTop * scale;
			cameraZ = min(cameraZ, maxCameraZ);
			local minCameraZ = settings.panMaxBottom * scale;
			cameraZ = max(cameraZ, minCameraZ);]]

			self:SetPosition(self.cameraX, cameraY, cameraZ);
		end
	end

	local function On_Model_OnMouseWheel(self, delta, maxZoom, minZoom)
		maxZoom = MODELFRAME_MAX_ZOOM
		minZoom = -2;
		local zoomLevel = self.zoomLevel or 0;
		zoomLevel = zoomLevel + delta * MODELFRAME_ZOOM_STEP;
		zoomLevel = min(zoomLevel, maxZoom);
		zoomLevel = max(zoomLevel, minZoom);
		self:SetPortraitZoom(zoomLevel);
		self.zoomLevel = zoomLevel;
	end

	function MV:CreateFrame()
		if MV.Frame or not DGV:UserSetting(DGV_ENABLEMODELDB) then return end
		if DugisGuideViewer_ModelViewer then 
			MV.Frame = DugisGuideViewer_ModelViewer
		else
			MV.Frame = CreateFrame("FRAME","DugisGuideViewer_ModelViewer", UIParent)

			MV.Frame:SetClampedToScreen(true);
			MV.Frame:SetSize(165, 220)
			--MV.Frame:SetPoint("TOPRIGHT", DugisSmallFrame, "BOTTOMRIGHT", -220, 0)
			
			MV.Frame:EnableMouse(true)
			MV.Frame:RegisterForDrag("LeftButton")
			MV.Frame:SetMovable()
			MV.Frame:SetScript("OnDragStart", MV.Frame.StartMoving) 
			MV.Frame:SetScript("OnDragStop", OnDragStop)
			MV.Frame:SetScript("OnUpdate", MV.OnUpdate )	
            --JU            
			--MV.Frame:SetUserPlaced(true)
			MV.Frame.model = CreateFrame("PlayerModel", "DugisGuideViewer_ModelViewer_Model", MV.Frame, "ModelWithControlsTemplate")
			MV.Frame.model:SetSize(149, 200)
			MV.Frame.model:SetPoint("CENTER", 2, -3)	
			MV.Frame.model:EnableMouseWheel(true)
			MV.Frame.model:SetScript("OnMouseWheel", function(self, delta) MV:OnMouseWheel(self, delta ) end)
			MV.Frame.model:HookScript("OnUpdate", On_Model_OnUpdate)
			
			MV.Frame.model:SetScript("OnMouseDown", function() if not DGV:UserSetting(DGV_LOCKMODELFRAME) then MV.Frame.StartMoving(MV.Frame) end end)
			MV.Frame.model:SetScript("OnMouseUp", function() if not DGV:UserSetting(DGV_LOCKMODELFRAME) then OnDragStop(MV.Frame) end end)
			
			MV.Frame.model:SetScript("OnMouseWheel", On_Model_OnMouseWheel);
			DugisGuideViewer_ModelViewer_ModelControlFrameZoomInButton:SetScript("OnClick", function()
				On_Model_OnMouseWheel(MV.Frame.model, 1);
				PlaySound("igInventoryRotateCharacter");
			end)
			DugisGuideViewer_ModelViewer_ModelControlFrameZoomOutButton:SetScript("OnClick", function()
				On_Model_OnMouseWheel(MV.Frame.model, -1);
				PlaySound("igInventoryRotateCharacter");
			end)
			
			MV.Frame.model.title = MV.Frame.model:CreateFontString(MV.Frame.model:GetName().."_Title","OVERLAY","GameFontNormalSmall")
			MV.Frame.model.title:SetPoint("BOTTOM", MV.Frame, 0, 28)
			MV.Frame.model.title:SetSize(130, 25)
			MV.Frame.model.title:SetJustifyH("CENTER")
			
			MV.Frame.close = CreateFrame("Button", "DugisGuideViewer_ModelViewer_Close", MV.Frame, "UIPanelCloseButton")
			MV.Frame.close:SetSize(20,20)
			MV.Frame.close:SetFrameLevel(3)
			MV.Frame.close:SetPoint("TOPRIGHT", MV.Frame, "TOPRIGHT", -9, -8)
			MV.Frame.close:SetScript("OnClick", function() 
			MV:HideModel()  
			DugisGuideUser.ModelDataOn = false
			if DugisSmallFrameStatus1ModelButton then DugisSmallFrameStatus1ModelButton:SetButtonState("NORMAL") end
			end)
			
			--[[MV.Frame.rotateLeft = CreateFrame("Button", "DugisGuideViewer_ModelViewer_ModelRotateLeftButton", MV.Frame.model, "UIPanelCloseButton")
			MV.Frame.rotateLeft:SetSize(25, 25)
			MV.Frame.rotateLeft:SetPoint("TOPLEFT", MV.Frame, "TOPLEFT", 12, -12)
			MV.Frame.rotateLeft:SetNormalTexture("Interface\\Buttons\\UI-RotationLeft-Button-Up")
			MV.Frame.rotateLeft:SetPushedTexture("Interface\\Buttons\\UI-RotationLeft-Button-Down")
			MV.Frame.rotateLeft:SetHighlightTexture("Interface\\Buttons\\ButtonHilight-Round")
			MV.Frame.rotateLeft:RegisterForClicks("LeftButtonDown")
			MV.Frame.rotateLeft:SetScript("OnClick", function() MV:RotateModel("left") end)
			
			MV.Frame.rotateRight = CreateFrame("Button", "DugisGuideViewer_ModelViewer_ModelRotateRightButton", MV.Frame.model, "UIPanelCloseButton")
			MV.Frame.rotateRight:SetSize(25, 25)
			MV.Frame.rotateRight:SetPoint("LEFT", MV.Frame.rotateLeft, "RIGHT", 0, 0)
			MV.Frame.rotateRight:SetNormalTexture("Interface\\Buttons\\UI-RotationRight-Button-Up")
			MV.Frame.rotateRight:SetPushedTexture("Interface\\Buttons\\UI-RotationRight-Button-Down")
			MV.Frame.rotateRight:SetHighlightTexture("Interface\\Buttons\\ButtonHilight-Round")
			MV.Frame.rotateRight:SetScript("OnClick", function() MV:RotateModel("right") end)]]
			
			MV.Frame.scrollLeft = CreateFrame("Button", MV.Frame:GetName().."_ScrollLeft", MV.Frame.model)
			MV.Frame.scrollLeft:SetSize(22, 22)
			MV.Frame.scrollLeft:SetPoint("BOTTOM", MV.Frame, "BOTTOM", -30, 11)
			MV.Frame.scrollLeft:SetNormalTexture("Interface\\Buttons\\UI-SpellbookIcon-PrevPage-Up")
			MV.Frame.scrollLeft:SetPushedTexture("Interface\\Buttons\\UI-SpellbookIcon-PrevPage-Down")
			MV.Frame.scrollLeft:SetDisabledTexture("Interface\\Buttons\\UI-SpellbookIcon-PrevPage-Disabled")	
			MV.Frame.scrollLeft:SetHighlightTexture("Interface\\Buttons\\UI-Common-MouseHilight")
			MV.Frame.scrollLeft:SetScript("OnClick", function() ToggleModelPage("backwards") end )
			
			MV.Frame.scrollTitle = MV.Frame.model:CreateFontString(MV.Frame:GetName().."_Title","OVERLAY","GameFontNormalSmall")
			MV.Frame.scrollTitle:SetPoint("LEFT", MV.Frame.scrollLeft, "RIGHT", 0, 0)
			MV.Frame.scrollTitle:SetJustifyH("CENTER")
			
			MV.Frame.scrollRight = CreateFrame("Button", MV.Frame:GetName().."_ScrollRight", MV.Frame.model)
			MV.Frame.scrollRight:SetSize(22, 22)
			MV.Frame.scrollRight:SetPoint("LEFT", MV.Frame.scrollTitle, "RIGHT", 0, 0)
			MV.Frame.scrollRight:SetNormalTexture("Interface\\Buttons\\UI-SpellbookIcon-NextPage-Up")
			MV.Frame.scrollRight:SetPushedTexture("Interface\\Buttons\\UI-SpellbookIcon-NextPage-Down")
			MV.Frame.scrollRight:SetDisabledTexture("Interface\\Buttons\\UI-SpellbookIcon-NextPage-Disabled")
			MV.Frame.scrollRight:SetHighlightTexture("Interface\\Buttons\\UI-Common-MouseHilight")
			MV.Frame.scrollRight:SetScript("OnClick", function() ToggleModelPage("forwards") end)
		end
		
		--Init	
		Model_OnLoad(MV.Frame.model)
		MV:HideModel()
	end

	local function IterateIndexModels(guideIndex, delegate)
		local mode = DGV:HasModel(guideIndex)
		if not mode then return end
		--DGV:DebugFormat("IterateIndexModels", "mode", mode)
		if mode:find("NPC") then
			local tags = { DGV:ReturnTag("NPC", guideIndex) }
			for _, val in pairs(tags) do
				delegate(val, "NPC")
			end	
		end
		
		if mode:find("OBJ") then
			local tags = { DGV:ReturnTag("OBJ", guideIndex) }
			for _, val in pairs(tags) do
				delegate(val, "OBJ")
			end		
		end
	end

	local function GetIndexButtonPushedState(guideIndex)
		if not MV.Frame:IsShown() then return false end
		local allIndexModelsContained = nil
		IterateIndexModels(guideIndex, function(modelId, modelType)
			local modelContained = false
			if MV.data.models then
				for i, model in ipairs(MV.data.models) do
					if model.modelId==modelId and model.modelType==modelType then
						modelContained = true
					end
				end
			end
			allIndexModelsContained = allIndexModelsContained or modelContained
		end)
		return allIndexModelsContained
	end

	function MV:Finalize()
		ToggleModelPage()
		
		if DGV.chardb.ModelViewer.pos_x == false then
			if  DGV.SmallFrame.IsFloating() then
				MV.Frame:SetPoint("TOPRIGHT", "DugisSmallFrameContainer", "TOPLEFT")
			else 
				MV.Frame:SetPoint("TOPRIGHT", "DugisWatchBackground", "TOPLEFT")
			end
		elseif not MV.Frame.moving then
			MV.Frame:SetPoint(DGV.chardb.ModelViewer.relativePoint, DGV.chardb.ModelViewer.pos_x, DGV.chardb.ModelViewer.pos_y)
		end
		-- ModelViewerChanged()
	end

	--Used for toggle on/off guide viewer
	function MV:ShowCurrentModel( )	
		if MV.data.models and #MV.data.models~=0 then
			MV.Frame:Show()
		end	
	end

	function MV:HideModel()
		if MV.Frame then
			MV.Frame.model.title:SetText("")
			MV.Frame.model:ClearModel()
			MV.Frame:Hide()
			--ModelViewerChanged()
		end
	end


	local function AddModel(modelId, modelType)
		if not MV.data.models then MV.data.models = {} end
		local model = table.remove(modelPool) or {}
		model.modelId = modelId
		model.modelType = modelType
		table.insert(MV.data.models, model)
		--DGV:DebugFormat("AddModel", "#MV.data.models", #MV.data.models)
	end

	local function RemoveModel(modelId, modelType)
		for i, model in ipairs(MV.data.models) do
			if model.modelId==modelId and model.modelType==modelType then
				table.insert(modelPool, table.remove(MV.data.models, i))
			end
		end
	end
    
    local function RemoveAllModels()
		for i, model in ipairs(MV.data.models) do
			table.insert(modelPool, table.remove(MV.data.models, i))
		end
	end
    
    function MV:SetModel(modelId)
        RemoveAllModels()
		AddModel(modelId, "NPC")
        MV:ShowCurrentModel( )	
        ToggleModelPage(true)
	end

	function MV:AddIndexModels(guideIndex)
		--DGV:DebugFormat("AddIndexModels", "guideIndex", guideIndex)
		IterateIndexModels(guideIndex, AddModel)
	end

	function MV:RemoveIndexModels(guideIndex)
		IterateIndexModels(guideIndex, RemoveModel)
		if not MV.data.models or #MV.data.models==0 then MV:HideModel() end
	end

	function MV:InitModelForQuest(...)
		local mode, val
		DGV:WipeModels()
		
		if select("#", ...)==0 then
			MV:InitModelForQuest(DugisGuideUser.CurrentQuestIndex)
			return
		end
		
		for i=1, select("#", ...) do
			MV:AddIndexModels(select(i, ...))
		end
		
		--[[
		for indx, value in pairs(ids) do
			DebugPrint("val:"..value.modelId.." modelType:"..value.modelType)
		end	
		--]]
				
		--MV.data.models = ids
	end

	--[[function MV:RotateModel(direction)
		if direction == "left" then
			Model_RotateRight(MV.Frame.model, 0.3)
		else
			Model_RotateLeft(MV.Frame.model, 0.3)
		end 
	end]]

	function MV:InitModelPos()
		MV.Frame.model.posX = 0
		MV.Frame.model.posY = 0
		MV.Frame.model:SetPosition(0, 0, 0)
        local progdir = 0
        local prog = 0
        
        local modelId = tonumber(MV.Frame.model.modelId)

        local transformation1 = DGV.ObjectModelsExtra[modelId]
        local transformation2  = DGV.DisplayModelsExtra[modelId]
        local transformation3  = DGV.NPCModelsExtra[modelId]
        
        local transformation = transformation1 or transformation2 or transformation3 or {}
        local viewer = MV.Frame.model
        
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

	function MV.OnUpdate(self, elapsedTime) 
		--DebugPrint("elapsedTime="..elapsedTime.."self:"..self.model:GetName())
		Model_OnUpdate(self.model, elapsedTime)--, rotationsPerSecond)
	end

	function MV:OnMouseWheel( self, delta )
		if IsShiftKeyDown() then
			MV:MoveModelTopBottom(self, delta)
		elseif IsAltKeyDown() then
			MV:MoveModelLeftRight(self, delta)
		else
			Model_OnMouseWheel(self, delta)
		end
	end

	function MV:MoveModelLeftRight(self, delta)
		local max = 10
		local min = -10
		self.posX = self.posX + delta*0.15
		if (self.posX > max) then
			self.posX = max
		end
		if (min > self.posX) then
			self.posX = min
		end
		self:SetPosition(0, self.posX, self.posY)
	end

	function MV:MoveModelTopBottom(self, delta)
		local max = 10
		local min = -10
		self.posY = self.posY + delta*0.15
		if (self.posY > max) then
			self.posY = max
		end
		if (min > self.posY) then
			self.posY = min
		end
		self:SetPosition(0, self.posX, self.posY)
	end

	function MV:ModelButton_OnClick(self, button, down)
		--if MV.data.on then DebugPrint("ON") else DebugPrint("OFF") end
		local guideIndex  = self.GuideIndex or DugisGuideUser.CurrentQuestIndex
		--DGV:DebugFormat("ModelButton_OnClick", "guideIndex", guideIndex)
		if not MV.Frame then return end
		--DGV:DebugFormat("ModelButton_OnClick", "GetIndexButtonPushedState(guideIndex)", GetIndexButtonPushedState(guideIndex))
		if GetIndexButtonPushedState(guideIndex) then
			MV:RemoveIndexModels(guideIndex)
		else
			--DGV:DebugFormat("ModelButton_OnClick ShowModel", "guideIndex", guideIndex)
			DGV:ShowModel(guideIndex)
		end
		if DugisGuideUser.ModelDataOn == true then
			DugisGuideUser.ModelDataOn = false
			MV:HideModel()
			self:SetButtonState("NORMAL")
		elseif DugisGuideUser.ModelDataOn == false then
			DugisGuideUser.ModelDataOn = true
			DGV:ShowModel()
			self:SetButtonState("PUSHED", 1)
		end
	end
	
	function MV:Load()
		if not MV.objDB then MV.objDB = {} end
		if not MV.npcDB then MV.npcDB = {} end
		MV.data  = {}
		modelPool = {}
		MV:CreateFrame()
		MV:UpdateLastPageChangeTime()
        
		function DGV:HasModel( questIndex )
			local tag 
			if not DGV:UserSetting(DGV_ENABLEMODELDB) then
				return 
			end
			if DGV:ReturnTag("NPC", questIndex) then
				tag = "NPC"
			end
			if DGV:ReturnTag("OBJ", questIndex) then  
				tag = (tag or "").."OBJ"
			end
			return tag
		end
		
		function DGV:IsModelDataOn()
			if DugisGuideUser.ModelDataOn == nil and DugisGuideViewer.CurrentTitle then 
				DugisGuideUser.ModelDataOn = true 
			end 
			if DugisGuideUser.ModelDataOn == true and DugisSmallFrameStatus1ModelButton then DugisSmallFrameStatus1ModelButton:SetButtonState("PUSHED", 1) end
			return DugisGuideUser.ModelDataOn
		end
		
		function DGV:ShowModel(...)
			MV:InitModelForQuest(...)
			MV:Finalize()
		end

		function DGV:WipeModels()
			MV.data.modelPage = 0
			if not MV.data.models then return end
			while #MV.data.models~=0 do
				table.insert(modelPool, table.remove(MV.data.models))
			end
		end

		function MV:RegisterObjects(objFunc)
			if not DGV:UserSetting(DGV_ENABLEMODELDB) then return end
			local safetyCount = 0
			local lineStart, lineEnd, objID, objPath
			
			lineEnd = 0
			lineStart = 0
			while (lineStart and safetyCount < 8000) do
				lineStart, lineEnd, objID, objPath = strfind( objFunc(), "(%d*)\t(.-)\n", lineEnd + 1 )
				if objID and objPath then
					self.objDB[objID] = objPath
				end
				safetyCount = safetyCount + 1
			end
		end
		
		function MV:RegisterNPCs(npcFunc)
			if not DGV:UserSetting(DGV_ENABLEMODELDB) then return end
			local safetyCount = 0
			local lineStart, lineEnd, npcID, displayID
			
			lineEnd = 0
			lineStart = 0
			while (lineStart and safetyCount < 48000) do
				lineStart, lineEnd, npcID, displayID = strfind( npcFunc(), "(%d*)\t(.-)\n", lineEnd + 1 )
				if npcID and displayID then
					self.npcDB[npcID] = displayID
				end
				safetyCount = safetyCount + 1
			end
		end
	end
	
	function MV:Unload()
		if DGV:UserSetting(DGV_UNLOADMODULES) or not DGV:UserSetting(DGV_ENABLEMODELDB) then -- or DGV_ENABLENPCNAMEDB
			MV.objDB = nil
			MV.npcDB = nil
		end
		MV.data.models = nil
		MV.data  = nil
		modelPool = nil
		MV:HideModel()
	end
	
	function MV:OnModulesLoaded()
		MV:ShowCurrentModel()
		DGV:SetAllBorders()
	end
	
	function MV:ResetPosition()
		MV.Frame:ClearAllPoints()
		if  DGV.SmallFrame.IsFloating() then
		    MV.Frame:SetPoint("TOPRIGHT", "DugisSmallFrameContainer", "TOPLEFT")
		else 
			MV.Frame:SetPoint("TOPRIGHT", "DugisWatchBackground", "TOPLEFT")
		end
		DGV.chardb.ModelViewer.pos_x = false
   end
end

--DGV.ModelViewer = MV