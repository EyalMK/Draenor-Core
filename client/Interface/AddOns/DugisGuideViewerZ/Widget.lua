local DGV = DugisGuideViewer
if not DGV then return end
local L, DebugPrint = DugisLocals, DGV.DebugPrint

local function SettingsTooltip_OnEnter(self, event)
	local DGVsettings = DGV.chardb
	local setting = DGVsettings[self.optionsIndex]
	if setting and setting.tooltip and setting.tooltip ~= "\"\"" then
		GameTooltip:SetOwner( self, "ANCHOR_BOTTOMLEFT")
		GameTooltip:AddLine(L[DGVsettings[self.optionsIndex].tooltip], 1, 1, 1, 1, true)
		GameTooltip:Show()
		GameTooltip:ClearAllPoints()
		GameTooltip:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 25, 0)
	end
end

local function SettingsTooltip_OnLeave(self, event)
	GameTooltip:Hide()
end

--Create a dropdown menu and dropdown label
--@param dropdownName: Object Name
--@param frame: Parent Frame
--@param labelText: Text to be displayed above dropdown
--@param optionsIndex: Database index number
--@param func: Function to call when dropdown used
function DGV:CreateDropdown(dropdownName, frame, labelText, optionsIndex, func, optionalListFunc)
	assert(type(dropdownName) == "string", "dropdownName must be a string")
	assert(frame:GetObjectType() == "Frame" , "No frame passed")
	--assert(type(labelText) == "string", "labelText must be a string")
	--assert(type(optionsIndex) == "number", "optionsIndex must be a number")
	assert(type(func) == "function", "func must be a func")	
	local frameWidth = 0
	local dropdown = CreateFrame("Frame", dropdownName, frame, "Lib_UIDropDownMenuTemplate")
	dropdown:SetFrameStrata("FULLSCREEN_DIALOG")
	dropdown:SetPoint("CENTER")
	dropdown.optionsIndex = optionsIndex
	dropdown:SetScript("OnEnter", SettingsTooltip_OnEnter)
	dropdown:SetScript("OnLeave", SettingsTooltip_OnLeave)
	
	dropdown.initFunc = function() 
			local indx, value
			local options = (optionalListFunc and optionalListFunc()) or DGV:GetDB(optionsIndex, "options")
			for indx, value in pairs(options) do
				local info = Lib_UIDropDownMenu_CreateInfo()
				if type(value)=="table" then
					info.text 	= L[value.text]
					info.value   = value.value or value.text 
					info.colorCode = value.colorCode
				else
					info.text = L[value]
					info.value = value
				end
				info.func = func
				
				Lib_UIDropDownMenu_AddButton(info)
				local fontWidth = DGV:GetFontWidth(info.text, "GameFontHighlightSmall")
				if fontWidth > frameWidth then frameWidth = fontWidth end
			end	
		end
	Lib_UIDropDownMenu_Initialize(dropdown, dropdown.initFunc)

	if optionsIndex then
		Lib_UIDropDownMenu_SetSelectedValue(dropdown, DGV:UserSetting(optionsIndex))
	end
	Lib_UIDropDownMenu_SetWidth(dropdown, frameWidth+25, 0) 
	
	if labelText then
		local dropdown_text = dropdown:CreateFontString(dropdownName.."Title", "ARTWORK", "GameFontHighlight")
		dropdown_text:SetText(L[labelText])
		dropdown_text:SetPoint("BOTTOMLEFT", dropdown, "TOPLEFT", "17", "5")
	end
	
	return dropdown
end

function DugisGuideViewer:CreateSlider(sliderName, frame, labelText, optionsIndex, minimun, maximum, step, default, minLabel, maxLabel, onValueChanged, toolTip, orientation)
	local slider = CreateFrame("Slider", sliderName, frame, "OptionsSliderTemplate")
	slider:SetOrientation(orientation or "HORIZONTAL")
	if toolTip then
		slider.tooltipText = L[toolTip]
	end
	getglobal(slider:GetName() .. 'Low'):SetText(L[minLabel])
	getglobal(slider:GetName() .. 'High'):SetText(L[maxLabel])
	
	slider:SetMinMaxValues(minimun, maximum)
	slider:SetValueStep(step)
	DebugPrint("Debug CreateSlider: DugisGuideViewer.chardb[optionsIndex]="..tostring(DugisGuideViewer.chardb[optionsIndex]))
	local initValue = DugisGuideViewer:GetDB(optionsIndex) or default
	slider:SetValue(initValue)
	getglobal(slider:GetName() .. 'Text'):SetText(L[labelText]:format(initValue))
	slider:SetScript("OnValueChanged", 
		function(self)
			local value = self:GetValue()
			DugisGuideViewer:SetDB(value, optionsIndex)
			getglobal(self:GetName() .. 'Text'):SetText(L[labelText]:format(value))
			if onValueChanged then
				onValueChanged()
			end
		end)
	slider.optionsIndex = optionsIndex
	slider:SetScript("OnEnter", SettingsTooltip_OnEnter)
	slider:SetScript("OnLeave", SettingsTooltip_OnLeave)
	slider:Show()
	return slider
end

function DugisGuideViewer:CreateButton(buttonName, frame, labelText, func)
	local button = CreateFrame("Button", "DGV_ApplyMacroButton", frame, "UIPanelButtonTemplate")
	
	local buttext = L[labelText]
	local fontwidth = DugisGuideViewer:GetFontWidth(buttext, "GameFontHighlight")
	button:SetText(buttext)
	button:SetWidth(fontwidth + 30)
	button:SetHeight(22)	
	button:RegisterForClicks("LeftButtonUP")
	button:SetScript("OnClick", func )
	button:Show()
	
	return button
end
