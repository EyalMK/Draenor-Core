GUIUtils = {}
if DugisNPCFrameDB == nil then
    DugisNPCFrameDB = {}
end
        
local DGV = DugisGuideViewer

GUIUtils.baseLevel = 10

function GUIUtils:SetBaseFrameLevel(level)
    self.baseLevel = level
end

function GUIUtils:SetNextFrameLevel(frame, extraLevel)
    self.baseLevel = self.baseLevel + 1
    
    if extraLevel then
        frame:SetFrameLevel(self.baseLevel + extraLevel)
    else
        frame:SetFrameLevel(self.baseLevel)
    end
end

GUIUtils.borderShift = 
{
     Default         = 0  
    ,BlackGold       = 3
    ,Bronze          = 1
    ,DarkWood        = 1
    ,ElvUI           = 4
    ,Eternium        = 2
    ,Gold            = 2
    ,Metal           = 2
    ,MetalRust       = 1
    ,OnePixel        = 4
    ,Stone           = 1
    ,StonePattern    = 2
    ,Thin            = 3
    ,Wood            = 1 
}

function GUIUtils:GetCurrentBorderShift()
    local border = DugisGuideViewer:UserSetting(DGV_LARGEFRAMEBORDER)
    return GUIUtils.borderShift[border]
end

function GUIUtils:AddImage(parent, x, y, width, height, totalTextureWidth, totalTextureHeight, texture)
    local imageObject = {}
    
    local frame = CreateFrame("Frame", "DragrFrame2", parent)
    frame:SetMovable(false)
    frame:EnableMouse(false)
    
    frame:SetPoint("TOPLEFT", parent, "TOPLEFT", x, y)
    frame:SetWidth(width)
    frame:SetHeight(height)
    
    self:SetNextFrameLevel(frame)
    
    local tex = frame:CreateTexture("ARTWORK")

    tex:SetTexture(texture)
    tex:SetTexCoord(0, width/totalTextureWidth, 0, height/totalTextureHeight)
    tex:SetAllPoints()

    imageObject.frame = frame
    imageObject.texture = tex
    
    return imageObject
end

function GUIUtils:AddText(parent, text, x, y, width, height, fontSize)
    local textBox = parent:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    
    textBox:SetText(text)
    --textBox:SetFont("Fonts\\FRIZQT__.TTF", fontSize)
    textBox:SetWidth(width)
    if height ~= nil then
        textBox:SetHeight(height)
    end
    textBox:SetJustifyH("LEFT")
    textBox:SetJustifyV("TOP")
    textBox:SetPoint("TOPLEFT", parent, "TOPLEFT", x, y)
    textBox:SetSpacing(2)
    
    return textBox
end


function GUIUtils:AddButtonCoord(parent, text, x, y, width, height, left, right, top, bottom, onClick, textureNormal, textureHighlight, textureDown, isClose, template)
    if textureHighlight == nil then textureHighlight = textureNormal; end
    if textureDown == nil then textureDown = textureNormal; end
   
    local buttonObject = {}
    
    buttonObject.text = text
    
    if isClose then
        template = "UIPanelCloseButton"
    end
    
    local button = CreateFrame("Button", nil, parent, template)
    button:SetPoint("TOPLEFT", parent, "TOPLEFT", x, y)
    button:SetWidth(width)
    button:SetHeight(height)

    self:SetNextFrameLevel(button)
    
    if not isClose then
        button:SetText("|cffffffff "..text.."|r", 1, 1, 1,  1, 0.5)

        button:SetNormalFontObject("GameFontNormal")

        if textureNormal and textureHighlight and textureDown then
            local ntex = button:CreateTexture()
          
            ntex:SetTexture(textureNormal)
           
            ntex:SetTexCoord(left, right, top, bottom)
            ntex:SetAllPoints()	
            button:SetNormalTexture(ntex)

            local htex = button:CreateTexture()
            htex:SetTexture(textureHighlight)
            htex:SetTexCoord(left, right, top, bottom)
            htex:SetAllPoints()
            button:SetHighlightTexture(htex)

            local ptex = button:CreateTexture()
            ptex:SetTexture(textureDown)
            ptex:SetTexCoord(left, right, top, bottom)
            ptex:SetAllPoints()
            button:SetPushedTexture(ptex)
            
        end
    end
    
    button:SetScript("OnClick", onClick)
    
    buttonObject.button = button
    
    return buttonObject
end

function GUIUtils:AddButton(parent, text, x, y, width, height, totalTextureWidth, totalTextureHeight, onClick, textureNormal, textureHighlight, textureDown, isClose)
    return self:AddButtonCoord(parent, text, x, y, width, height, 0, width/totalTextureWidth, 0, height/totalTextureHeight, onClick, textureNormal, textureHighlight, textureDown, isClose)
end

function GUIUtils:UpdateOrCreateList(parent, list, dataList, id2imageFunction, id2labelFunction, setHintWindowContentFunction, hintWndow, onHoverFunction, onLeaveFunction)
    for i, item in ipairs(list) do
        item.itemImage:Hide()
        item.itemLabel:Hide()
        item.separator:Hide()
    end

    local y = 0
    for i, id in ipairs(dataList) do
        y = (i-1) * 47 + 45
        
        local label = id2labelFunction(id)
        local icon= id2imageFunction(id)

        if label == nil then
            label = ""
        end

        if list[i] == nil then      
            list[i] = {}
            list[i].itemImage = CreateFrame("Frame", "itemImage", parent)
            self:SetNextFrameLevel(list[i].itemImage)
            list[i].itemImage:EnableMouse(false)
            list[i].spellImagetex = list[i].itemImage:CreateTexture("ARTWORK")
            list[i].itemLabel = parent:CreateFontString(nil, "OVERLAY", "GameFontNormal")
            list[i].separator = CreateFrame("Frame", "separator", parent)
            list[i].separatortex = list[i].separator:CreateTexture(nil, "BACKGROUND")
        end
        
        list[i].itemImage:Show()
        list[i].itemLabel:Show()
        
        local onEnter = function(self, motion) 
            if setHintWindowContentFunction ~= nil then
                hintWndow:Show()
                hintWndow:SetIconTexture(icon)
                setHintWindowContentFunction(icon, label, id)
                hintWndow:LocateToCursor(-100, 120)
            end
           
            if onHoverFunction then
                onHoverFunction(id)
            end
         end

        list[i].itemImage:SetScript("OnEnter", onEnter)
        list[i].itemImage:SetScript("OnLeave", function() 
            hintWndow.frame:Hide() 
            if onLeaveFunction then
                onLeaveFunction(id)
            end
        end)
        
        local itemImage = list[i].itemImage

        itemImage:SetPoint("TOPLEFT", parent, "TOPLEFT", 10, -y) 
        itemImage:SetWidth(37) 
        itemImage:SetHeight(37)
        
        local spellImagetex = list[i].spellImagetex
        spellImagetex:SetAllPoints()
        spellImagetex:SetTexture(icon)
        spellImagetex:SetTexCoord(0, 1, 0, 1)

        local itemLabel = list[i].itemLabel
        itemLabel:SetPoint("LEFT")
        itemLabel:SetWidth(225)
        itemLabel:SetHeight(55)

        itemLabel:SetFontObject(GameFontHighlightMedium)
        itemLabel:SetText(""..label.."")
        itemLabel:SetJustifyH("LEFT")

        itemLabel:SetPoint("TOPLEFT", parent, "TOPLEFT", 50, -y + 14 - 7)

        if i < #dataList then
            local separator = list[i].separator

            separator:SetPoint("TOPLEFT") 
            separator:SetWidth(199) 
            separator:SetHeight(1)
            
            separator:SetPoint("TOPLEFT", parent, "TOPLEFT", 20, -y - 42)

            local separatortex = list[i].separatortex
            separatortex:SetAllPoints()
            separatortex:SetTexture(0.2, 0.2, 0.2, 0.8)
            list[i].separator:Show()
        end 
    end
    
    parent.maxY = y
end

function GUIUtils:CreateModelFrame(parent, frameLevelShift)
    local modelFrame = CreateFrame("PlayerModel", nil, parent)

    if frameLevelShift then
        self:SetNextFrameLevel(modelFrame, frameLevelShift)
    else
        self:SetNextFrameLevel(modelFrame)
    end
    
    modelFrame:SetSize(155, 135)
    modelFrame:SetPoint("TOPLEFT", parent, "TOPLEFT", 127, 0) 

    modelFrame.title = modelFrame:CreateFontString(nil, "OVERLAY", "GameFontHighlightLarge")

    modelFrame.title:SetPoint("LEFT", -120, 0)

    modelFrame.title:SetFontObject(GameFontHighlightLarge)
    modelFrame.title:SetText("NPC Name")

    modelFrame.title:SetWidth(135)
    modelFrame.title:SetHeight(125)	
    
    function modelFrame:SetModelOrNothing(unitName, modelId)
        if modelId then
            self:SetDisplayInfo(modelId)
        elseif unitName then
            self:SetUnit(unitName)
        else
            self:SetUnit("none")
        end
    end
    
    --local debugTexture = modelFrame:CreateTexture()
    --debugTexture:SetAllPoints()
    --debugTexture:SetTexture(0.06, 0.66, 0.87, 1)    
    
    return modelFrame
end


GUIUtils.HINT_WINDOW_TEXT_WITH_ICON_MODE = 1
GUIUtils.HINT_WINDOW_TEXT_WITH_NO_ICON_MODE = 2
GUIUtils.HINT_WINDOW_NPC_MODE = 3
GUIUtils.HINT_WINDOW_IMAGE_MODE = 4

function GUIUtils:CreateHintFrame(x, y, width, height, hintTexture)
    local window = {}

    local frame = CreateFrame("Frame", "DragrFrame2", UIParent)
    
    frame:SetMovable(false)
    frame:EnableMouse(false)
    self:SetNextFrameLevel(frame, 30)
    
    frame:SetPoint("CENTER") 
    frame:SetWidth(width) 
   

    local tex = frame:CreateTexture(nil, "BACKGROUND")
    tex:SetAllPoints()
    tex:SetTexCoord(0, 259.0/256.0, 0, 256.0/256.0)
    
    window.title = self:AddText(frame, 'content', 10, -10, width - 15, nil, 14)
    window.title:SetFontObject(GameTooltipHeaderText)
    window.text = self:AddText(frame, 'content', 10, -20, width - 65, nil, 12)
    window.text:SetFontObject(GameFontNormal)
    
    local textHeight = window.text:GetHeight()

    window.icon = self:AddImage(frame, -50, 0, 45, 45, 45, 45, hintTexture)
    
    window.frame = frame
    
    frame:SetBackdrop({bgFile = "Interface\\Tooltips\\UI-Tooltip-Background", edgeFile = "Interface/Tooltips/UI-Tooltip-Border", 
                                            tile = true, tileSize = 16, edgeSize = 16, 
                                            insets = { left = 4, right = 4, top = 4, bottom = 4 }});
                                            
    frame:SetBackdropColor(0.0, 0.0, 0.2,1);
    
    window.SetIconTexture = function (self, texture)
        self.icon.texture:SetTexture(texture)
    end
    
    window.SetPos = function (self, x, y)
        self.frame:SetPoint("TOPLEFT", UIParent, "TOPLEFT", x, y)
    end
    
    window.UpdateHeight = function (self)
        if self.currentMode ~= GUIUtils.HINT_WINDOW_IMAGE_MODE then 
            local titleHeight = self.title:GetHeight()
            local textHeight = self.text:GetHeight() + 10
            self.text:SetPoint("TOPLEFT", self.frame, "TOPLEFT", 10, -titleHeight)
            if textHeight <= 20 then
                textHeight = 20
            end
            self.frame:SetHeight(textHeight + titleHeight)
        else
            
            local titleHeight = self.imageFrame:GetHeight()
            if not window.showImageInImageMode then
                titleHeight = 0
            end
            local titleWidth = self.imageFrame:GetWidth()
            self.text:SetWidth(titleWidth - 20)
            local textHeight = self.text:GetHeight() + 10
            self.text:SetPoint("TOPLEFT", self.frame, "TOPLEFT", 20, -titleHeight - 25)
            if textHeight <= 20 then
                textHeight = 20
            end
            self.frame:SetHeight(textHeight + titleHeight + 35)
            
            self.imageFrame:SetPoint("TOPLEFT",11 + GUIUtils:GetCurrentBorderShift(), -12 - GUIUtils:GetCurrentBorderShift())
        end
    end
    
    window.SetText = function (self, text)
        self.text:SetText(text)
        self:UpdateHeight()
    end
    
    window.SetTitle = function (self, text)
        self.title:SetText(text)
        self:UpdateHeight()
    end
    
    window.LocateToCursor = function (self, deltaX, deltaY)
        local x, y = GetCursorPosition()
        x = x + 190 + (deltaX or 0)
        y = -(GetScreenHeight()  - y) + (deltaY or 0)
        local h = self.frame:GetHeight()
        local w = self.frame:GetWidth()
        
        if (-y + h) > GetScreenHeight() then
            y = -GetScreenHeight() + h + 5
        end
        
        if (x + w) > GetScreenWidth() then
            x = GetScreenWidth() - w - 5
        end
        
        self:SetPos(x, y)
    end
    
    window.modelFrame = self:CreateModelFrame(frame, 30)
    
    window.modelFrame:SetSize(204, 200)
    window.modelFrame:SetPoint("TOPLEFT", frame, "TOPLEFT", 5, -40) 
    window.modelFrame.title:SetPoint("LEFT", 6, 66) 
    window.modelFrame.title:SetJustifyH("LEFT")
    window.modelFrame.title:SetJustifyV("TOP")  
    window.modelFrame.title:SetWidth(196) 
	window.modelFrame.title:SetFontObject(GameFontHighlightMedium)
    window.currentModel = ""
    window.currentModelName = ""
    
    window.imageFrame = CreateFrame("Frame",nil,frame)
   
    window.imageFrame:SetWidth(256)
    window.imageFrame:SetHeight(128)

    local texture = window.imageFrame:CreateTexture(nil,"LOW")
    texture:SetTexture([[Interface\AddOns\DugisGuideViewerZ\Artwork\guides\arathi.tga]])
    texture:SetAllPoints(window.imageFrame)
    window.imageFrame.texture = texture

    window.imageFrame:SetPoint("TOPLEFT",14,-15)
    window.imageFrame:Show()
    
	local function InitModelPos(npcId, modelFrame)
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

    window.SetModel = function (self, model, modelName, npcId)
        self.modelFrame:ClearModel() 
        self.currentModel = model
        if model then
            self.modelFrame:SetDisplayInfo(model)
        else
            self.modelFrame:SetUnit("none")
        end
        self.modelFrame.title:SetText(modelName)
        if npcId then
            InitModelPos(npcId, self.modelFrame)
        end
    end    
    
    window.currentMode = self.HINT_WINDOW_TEXT_WITH_ICON_MODE
    
    window.showImageInImageMode = true
    
    window.Show = function (self, updateFrame)
        if updateFrame then
            DugisGuideViewer:SetFrameBackdrop(self.frame, DugisGuideViewer.BACKGRND_PATH, DugisGuideViewer:GetBorderPath(), 10, 3, 11, 5)
            window.modelFrame.title:SetPoint("LEFT", 9, 56) 
            window.modelFrame:SetPoint("TOPLEFT", frame, "TOPLEFT", 5, -35)
        end

		window.imageFrame:Hide()
        
        if self.currentMode == GUIUtils.HINT_WINDOW_TEXT_WITH_ICON_MODE then
            self.title:Show()
            self.text:Show() 
            self.icon.frame:Show()  
            self.modelFrame:Hide()     
            self.modelFrame.title:Hide()             
        end
        
        if self.currentMode == GUIUtils.HINT_WINDOW_TEXT_WITH_NO_ICON_MODE then
            self.title:Show()
            self.text:Show() 
            self.icon.frame:Hide()  
            self.modelFrame:Hide()     
            self.modelFrame.title:Hide()             
        end
        
        if self.currentMode == GUIUtils.HINT_WINDOW_NPC_MODE then
            self.title:Hide()
            self.text:Hide()
            self.icon.frame:Hide()
            self.frame:SetHeight(246)
            self.modelFrame:Show()
            self.modelFrame.title:Show()   
        end
        
        if self.currentMode == GUIUtils.HINT_WINDOW_IMAGE_MODE then
            self.title:Hide()
            self.text:Show()
            self.icon.frame:Hide()
            self.frame:SetHeight(246)
            self.modelFrame:Hide()
            self.modelFrame.title:Hide()
        
            if window.showImageInImageMode then
                window.imageFrame:Show()    
            else
                window.imageFrame:Hide()
            end
            window.imageFrame:SetFrameLevel(70)
        end
        
        self.frame:Show()
    end    
    
    window.SetMode = function (self, mode)
        self.currentMode = mode
    end
    
    window.SetModeAndShow = function (self, mode)
        self.currentMode = mode
        self:Show()
    end
    

      
    return window
end

function GUIUtils:CreateScrollFrame(parent)
    local scrollFrame = {}
    scrollFrame.frame = CreateFrame("ScrollFrame", nil, parent)
    scrollFrame.frame:SetWidth(288) 
    scrollFrame.frame:SetHeight(340)
    
    self:SetNextFrameLevel(scrollFrame.frame)
   
    scrollFrame.frame:SetPoint("TOPLEFT", parent, "TOPLEFT", 10, -41)  
    

    scrollFrame.scrollBar = CreateFrame("Slider", nil, scrollFrame.frame, "UIPanelScrollBarTemplate")
    scrollFrame.scrollBar:SetPoint("TOPLEFT", parent, "TOPLEFT", 302, -61)
    scrollFrame.scrollBar:SetWidth(10) 
    scrollFrame.scrollBar:SetHeight(309)
    scrollFrame.scrollBar:SetMinMaxValues(1, 400)
    scrollFrame.scrollBar:SetValueStep(1)
    scrollFrame.scrollBar.scrollStep = 1
    scrollFrame.scrollBar:SetValue(0)
    scrollFrame.scrollBar:SetScript("OnValueChanged",
    function (self, value)
        self:GetParent():SetVerticalScroll(value)
    end)
    
    return scrollFrame
end

function GUIUtils:CreateSidebarIcon(onClickFunction)
    local function GetIconSize()
        return 30 * ((DugisGuideViewer:UserSetting(DGV_JOURNALFRAMEBUTTONSCALE)-1)/15 + 1)
    end
    
    local sidebarButtonFrame = CreateFrame("Frame", "sidebarButtonFrame", UIParent)

    self:SetNextFrameLevel(sidebarButtonFrame)
    
    --Settings / variables
    local iconSize = GetIconSize()

    local handlerSize = 5
    local newButtonX = handlerSize
    local newX = -(iconSize + handlerSize)
    local newY = -700    
    local newButtonY = 0    
    local newW = iconSize
    local newH = iconSize    
    local direction = "TOPRIGHT"
    local extraShiftX = 0
    local extraShiftY = 0
    local extraButtonShiftX = 0
    local extraButtonShiftY = 0    
    
    local extraShiftDelta = 2
    

    local sidebarButtonFrameTexture = sidebarButtonFrame:CreateTexture()
    sidebarButtonFrameTexture:SetAllPoints()
    sidebarButtonFrameTexture:SetTexture(0.06, 0.66, 0.87, 1)
    sidebarButtonFrame:SetMovable(true)
    sidebarButtonFrame:EnableMouse(true)
    sidebarButtonFrame:RegisterForDrag("LeftButton")

    local function StartDragging()
        sidebarButtonFrame.dragging = true
    end
    
    local function StopDragging()
        sidebarButtonFrame.dragging = false
    end
    
    sidebarButtonFrame:SetScript("OnMouseDown", StartDragging)
    sidebarButtonFrame:SetScript("OnMouseUp", StopDragging)
    sidebarButtonFrame:SetScript("OnDragStart", StartDragging)
    sidebarButtonFrame:SetScript("OnDragStop", StopDragging)
    
    sidebarButtonFrame:SetScript("OnEnter"
    , function() 
        sidebarButtonFrameTexture:SetTexture(0, 0.33, 0.49, 1)
    end)
    
    sidebarButtonFrame:SetScript("OnLeave"
    , function() 
        sidebarButtonFrameTexture:SetTexture(0.06, 0.66, 0.87, 1)
    end)
    
								--AddButton(parent, text, x, y, width, height, totalTextureWidth, totalTextureHeight, onClick, textureNormal, textureHighlight, textureDown, isClose)
    local sidebarButton = self:AddButton(sidebarButtonFrame, "", handlerSize, 0, iconSize, iconSize, iconSize, iconSize, function()  
        onClickFunction()
    end
    , [[Interface\EncounterJournal\UI-EJ-PortraitIcon]], [[Interface\Buttons\ButtonHilight-Square]], [[Interface\AddOns\DugisGuideViewerZ\Artwork\npcjournal_button.tga]])

    sidebarButtonFrame:Hide()
    
	sidebarButtonFrame.ResetSidebarIconPosition = function (self)
	
		newY = 0
		newX = GetScreenWidth()/2
		
	end
    
    sidebarButton.button:SetMovable(true)
    sidebarButton.button:RegisterForDrag("LeftButton")
    sidebarButton.button:SetScript("OnDragStart", StartDragging)
    sidebarButton.button:SetScript("OnDragStop", StopDragging)

    sidebarButtonFrame.RestoreSidebarIconPosition = function (self) 
        iconSize = GetIconSize()
        
        if DugisNPCFrameDB['sidebarIconLastX'] then
            self:SetPosition(DugisNPCFrameDB['sidebarIconLastX'],DugisNPCFrameDB['sidebarIconLastY'])
        else
            local x = GetScreenWidth() / 2
            newY = 0
            newX = x - iconSize/2
            direction = "TOPLEFT"
            newW = iconSize
            newH = iconSize + handlerSize  
            if DGV:UserSetting(DGV_JOURNALFRAMEBUTTONSTICKED) == true then   
                newH = iconSize
            end            
            newButtonX = 0
            newButtonY = 0
            extraShiftX = 0
            extraShiftY = -extraShiftDelta
            extraButtonShiftX = 0
            extraButtonShiftY = extraShiftDelta       
        end        
    end    
   
    function sidebarButtonFrame:SetPosition(x,y)
        DugisNPCFrameDB['sidebarIconLastX'] = x
        DugisNPCFrameDB['sidebarIconLastY'] = y
        
        local screenWidth = GetScreenWidth()
        local screenHeight = GetScreenHeight()
        

        local xN = (x/(UIParent:GetEffectiveScale()))/screenWidth
        local yN = (y/(UIParent:GetEffectiveScale()))/screenHeight

        

        x = xN * screenWidth
        y = yN * screenHeight
           
        
        iconSize = GetIconSize()        
        
        if DGV:UserSetting(DGV_JOURNALFRAMEBUTTONSTICKED) == false then
            if x>(screenWidth/2) then
                newX = -(iconSize + handlerSize)
                newY = -screenHeight + y + iconSize/2
                newButtonX = handlerSize
                newButtonY = 0
                newW = iconSize + handlerSize
                newH = iconSize 
                direction = "TOPRIGHT"
                extraShiftX = -extraShiftDelta
                extraShiftY = 0
                extraButtonShiftX  = 0
                extraButtonShiftY  = 0                
            end
            
            if x<(screenWidth/2) then
                newX = 0
                newY = -screenHeight + y + iconSize/2
                direction = "TOPLEFT"
                newButtonX = 0
                newButtonY = 0                
                newW = iconSize + handlerSize
                newH = iconSize     
                extraShiftX = extraShiftDelta
                extraShiftY = 0  
                extraButtonShiftX  = -extraShiftDelta
                extraButtonShiftY  = 0
            end
            
            if y<100 then
                newY = (iconSize + handlerSize)
                newX = x - iconSize/2
                direction = "BOTTOMLEFT"
                newButtonX = 0
                newButtonY = -handlerSize               
                newW = iconSize
                newH = iconSize + handlerSize   
                extraShiftX = 0
                extraShiftY = extraShiftDelta 
                extraButtonShiftX  = 0
                extraButtonShiftY  = 0                 
            end
            
            if y>(screenHeight-100) then
                newY = 0
                newX = x - iconSize/2
                direction = "TOPLEFT"
                newW = iconSize
                newH = iconSize + handlerSize                  
                newButtonX = 0
                newButtonY = 0
                extraShiftX = 0
                extraShiftY = -extraShiftDelta
                extraButtonShiftX = 0
                extraButtonShiftY = extraShiftDelta
            end
            
            if y<100 or  y>(screenHeight-100) then
                if newX > screenWidth - iconSize then
                    newX = screenWidth - iconSize
                end
                
                if newX < 0 then
                    newX = 0
                end                 
            end            
        else
            sidebarButtonFrame:SetClampedToScreen(true)
            newX = x - iconSize / 2--= xN * screenWidth 
            newY = -(screenHeight -y) + iconSize / 2
            direction = "TOPLEFT"
            newW = iconSize
            newH = iconSize 
            extraShiftX = 0
            extraShiftY = 0
            extraButtonShiftX = 0
            extraButtonShiftY = 0
            newButtonX = 0
            newButtonY = 0
        end
        sidebarButton.button:SetWidth(iconSize + abs(extraShiftX)) 
        sidebarButton.button:SetHeight(iconSize + abs(extraShiftY)) 
        sidebarButtonFrame:SetPoint("TOPLEFT", UIParent, direction, newX + extraShiftX, newY + extraShiftY) 
        sidebarButton.button:SetPoint("TOPLEFT", sidebarButtonFrame, "TOPLEFT", newButtonX + extraButtonShiftX, newButtonY + extraButtonShiftY)  
        
    end
    
    local function Sidebar_OnUpdate(frame, elapsed)
        local scale = UIParent:GetEffectiveScale()
        
        iconSize = GetIconSize()  
    
        local screenWidth = GetScreenWidth()
        local screenHeight = GetScreenHeight()

        if sidebarButtonFrame.dragging then
            local x, y = GetCursorPosition()
            sidebarButtonFrame:SetPosition(x, y)
        else
            sidebarButton.button:SetWidth(iconSize) 
            sidebarButton.button:SetHeight(iconSize) 
            sidebarButtonFrame:SetPoint("TOPLEFT", UIParent, direction, newX , newY) 
            sidebarButton.button:SetPoint("TOPLEFT", sidebarButtonFrame, "TOPLEFT", newButtonX, newButtonY)           
        end
        sidebarButtonFrame:SetWidth(newW) 
        sidebarButtonFrame:SetHeight(newH) 
    end

    sidebarButtonFrame:SetScript("OnUpdate", Sidebar_OnUpdate) 

    return sidebarButtonFrame
end

-- Tree Frame
-- Example nodes
-- local nodes = {
--     {nodeName="Area1", leafs = {{name="x1", data={}}, {name="x2", data={}}, {name="x3", data={}}}},
--     {nodeName="Area2", leafs = {{name="x1", data={}}, {name="x2", data={}}, {name="x3", data={}}, {name="x4", data={}}}},
--     {nodeName="Area3", leafs = {{name="x1", data={}}, {name="x2", data={}}}}
-- }
function GUIUtils:SetTreeFrameData(targetTreeFrame, treePrefix, nodes, onClickFunction)
    if targetTreeFrame.allTreeVisualNodes == nil then
        targetTreeFrame.allTreeVisualNodes = {}
    end

    LuaUtils:foreach(targetTreeFrame.allTreeVisualNodes, function(parentVisualNode, index)
        local visualLeaf = parentVisualNode.firstChild
        while visualLeaf do
            visualLeaf:Hide()
            visualLeaf = visualLeaf.nextChild
        end
        parentVisualNode:Hide()
    end)

    targetTreeFrame.allTreeVisualNodes = {}
    
    -- Creating all visual nodes and leafs
    local i = 1
    local childIndex = 1
    LuaUtils:foreach(nodes, function(nodeValue)
        local nodeName = nodeValue.nodeName
        local leafs = nodeValue.leafs
        i = i + 1
        local treeResultsNodeName = treePrefix .. "DGVTreeNode"..i

        local nodeVisualization = _G[treeResultsNodeName]
        if nodeVisualization == nil then
            nodeVisualization = CreateFrame("Button", treeResultsNodeName, targetTreeFrame, "DugisGuideTreeNodeTemplate")
            nodeVisualization.Title:SetFont(GameFontHighlightLarge:GetFont())
            nodeVisualization.TreeFrame = targetTreeFrame
        end
        
        targetTreeFrame.allTreeVisualNodes[#targetTreeFrame.allTreeVisualNodes + 1] = nodeVisualization

        local separatedLocationName = LuaUtils:separateCamelCase(nodeName)
        nodeVisualization.Title:SetText(separatedLocationName)
        nodeVisualization:Show()
        
        nodeVisualization:SetParent(targetTreeFrame)
        nodeVisualization:SetPoint("TOPLEFT", targetTreeFrame, "TOPLEFT", 25, -14 * i - 12 )
        
        local previousChild = nil
        LuaUtils:foreach(leafs, function(leaf, index)
            local leafName = leaf.name
        
            childIndex = childIndex + 1
            local treeResultsLeafName = treePrefix .. "DGVTreeLeaf" .. childIndex
            
            visualLeaf = _G[treeResultsLeafName]

            if visualLeaf == nil then
                -- visualLeaf = targetTreeFrame:CreateFontString("OVERLAY", treeResultsLeafName, "GameFontHighlight")
                visualLeaf = CreateFrame("Button", treeResultsNodeName, targetTreeFrame, "DugisGuideTreeLeafTemplate")
                visualLeaf.Text:SetNonSpaceWrap(true)
                visualLeaf:Show()
                _G[treeResultsLeafName] = visualLeaf
            end
            
            visualLeaf.Text:SetText(leafName..' |T'.."Interface\\AddOns\\DugisGuideViewerZ\\Artwork\\waypoint_16.tga"..':11:11:0:0|t ')
            
            visualLeaf:SetScript("OnClick", onClickFunction)
            
            visualLeaf:SetParent(targetTreeFrame)
            visualLeaf.nextChild = nil
            visualLeaf.leafData = leaf
            
            if previousChild then
                previousChild.nextChild = visualLeaf
            end
            
            if index == 1 then
                nodeVisualization.firstChild = visualLeaf
            end
            
            previousChild = visualLeaf
        end)
    end)  
end


---------------------------
------- TREE STRUCTURE ----
------- parentNode --------
-- expanded
-- firstChild

----- visualChild ---------
-- nextChild
---------------------------
function GUIUtils:UpdateTreeVisualization(targetTreeFrame)
    local currentYOffset = 0
    
    if targetTreeFrame.allTreeVisualNodes == nil then
        targetTreeFrame.allTreeVisualNodes = {}
    end        
    
    LuaUtils:foreach(targetTreeFrame.allTreeVisualNodes, function(visualParentNode)
        local visualChild = visualParentNode.firstChild
        
        if visualParentNode.expanded then
            visualParentNode:SetNormalTexture("Interface\\Buttons\\UI-MinusButton-Up")
        else
            visualParentNode:SetNormalTexture("Interface\\Buttons\\UI-PlusButton-Up")
        end               
        
        visualParentNode:SetPoint("TOPLEFT", targetTreeFrame, "TOPLEFT", -5, -currentYOffset)
        while visualChild do
            if visualParentNode.expanded then
                currentYOffset = currentYOffset + 20
                visualChild:SetPoint("TOPLEFT", targetTreeFrame, "TOPLEFT", 15, -currentYOffset - 2)
                visualChild:Show()
            else
                visualChild:Hide()
            end
            
            visualChild = visualChild.nextChild
        end
        
        currentYOffset = currentYOffset + 20
    end)
    
    targetTreeFrame.height = currentYOffset
end

