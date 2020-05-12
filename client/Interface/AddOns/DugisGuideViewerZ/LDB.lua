local DGV = DugisGuideViewer
if not DGV then return end

local LDB = {}
DGV.LDB = LDB

local dugiLDB = LibStub("LibDataBroker-1.1"):NewDataObject("Dugi", {
	type = "data source",
	launcher = true,
	text = "Dugi Guides",
	icon = DGV.ARTWORK_PATH.."iconbutton",
	tooltipTitle = "Dugi Guides Viewer",
	tooltipTextFunction = "Dugi_GetTooltipText",
	OnClick = function(self, button) 
		if button == "LeftButton" then
			DGV:ToggleOnOff() 
		elseif button == "RightButton" then
			if DugisMain:IsVisible() == 1 then
				DugisGuideViewer:HideLargeWindow()
			else
				--UIFrameFadeIn(DugisMainframe, 0.5, 0, 1)
				--UIFrameFadeIn(Dugis, 0.5, 0, 1)
				DugisGuideViewer:ShowLargeWindow()
			end
		end
	end,
})

function Dugi_GetTooltipText()
	return "Toggle on and off"
end

function LDB:SetIconStatus(iconName)
	dugiLDB.icon = iconName
end