local DGV = DugisGuideViewer
if not DGV then return end

local Ants = DGV:RegisterModule("Ants")
Ants.essential = true
local _
local DebugPrint = DGV.DebugPrint

function Ants:Initialize()
	DGV.Ants = Ants

	Ants.ant_dots = {}
	Ants.miniant_dots= {}
	Ants.ant_phase = 0.0
	Ants.ant_cleared = true

	function Ants:Debugz()
		local dot
		DebugPrint("***********Debug***************")
		DebugPrint("MiniMap dots:")
		for _, dot in pairs(self.miniant_dots) do
			local point, relativeTo, relativePoint, xOffset, yOffset = dot:GetPoint(1)
			DebugPrint("point:"..point.."relativeTo"..relativeTo:GetName().."relativePoint"..relativePoint.."xOffset"..xOffset.."yOffset"..yOffset)
		end
		DebugPrint("Map dots:")
		for _, dot in pairs(self.ant_dots) do
			local point, relativeTo, relativePoint, xOffset, yOffset = dot:GetPoint(1)
			DebugPrint("point:"..point.."relativeTo"..relativeTo:GetName().."relativePoint"..relativePoint.."xOffset"..xOffset.."yOffset"..yOffset)
		end

		DebugPrint("***********End Debug***************")
	end



	---------------------------------------------------------------------------------------------
	-- Ant Trail Functions
	---------------------------------------------------------------------------------------------
	function Ants:ClampLine(x1, y1, x2, y2)
	
		if x1 and y1 and x2 and y2 --[[and x1~=x2 and y1~=y2]] then
			if y1 > 1 and y2 > 1 then return end
			if x1 > 1 and x2 > 1 then return end
			if y1 < 0 and y2 < 0 then return end
			if x1 < 0 and x2 < 0 then return end
			
			local x_div, y_div = (x2-x1), (y2-y1)
			local x_0 = y1-x1/x_div*y_div
			local x_1 = y1+(1-x1)/x_div*y_div
			local y_0 = x1-y1/y_div*x_div
			local y_1 = x1+(1-y1)/y_div*x_div

			if y1 < 0 then
				x1 = y_0
				y1 = 0
			end

			if y2 < 0 then
				x2 = y_0
				y2 = 0
			end

			if y1 > 1 then
				x1 = y_1
				y1 = 1
			end

			if y2 > 1 then
				x2 = y_1
				y2 = 1
			end

			if x1 < 0 then
				y1 = x_0
				x1 = 0
			end

			if x2 < 0 then
				y2 = x_0
				x2 = 0
			end

			if x1 > 1 then
				y1 = x_1
				x1 = 1
			end

			if x2 > 1 then
				y2 = x_1
				x2 = 1
			end

			if x1 >= 0 and x2 >= 0 and y1 >= 0 and y2 >= 0 and x1 <= 1 and x2 <= 1 and y1 <= 1 and y2 <= 1 then
				return x1, y1, x2, y2
			end
		end
	end

	function Ants:ClearAntTrail()

		if not self.ant_cleared then
			for index, dot in ipairs(self.ant_dots) do
				dot:ClearAllPoints()
				dot:Hide()
			end

			for index, dot in ipairs(self.miniant_dots) do
				dot:ClearAllPoints()
				dot:Hide()
			end
		end
	end

	local function CreateDotTexture(parent, dim)

		local icon = parent:CreateTexture()
		icon:SetTexture(DugisGuideViewer:UserSetting(DGV_ANTCOLOR))
		icon:ClearAllPoints()
		icon:SetDrawLayer("ARTWORK")
		icon:SetBlendMode("BLEND")
		icon:SetWidth(8)
		icon:SetHeight(8)
		icon:Show()

		return icon
	end
	
	local function SetWaypointDotTextureAlpha(waypoint, dot, f)
		dot:SetAlpha((waypoint.floor~=f and .35) or 0.90)
	end
	
	Ants.miniant_points = {}
	
	if not AntUpdateDelay then
		AntUpdateDelay = CreateFrame("Frame")
		AntUpdateDelay:Hide()
	end
	
	function Ants:UpdateAntTrailDot(delay, func)
		AntUpdateDelay.func = func
		AntUpdateDelay.delay = delay
		AntUpdateDelay:Show()
		ChangeAntTrailColor = true
	end
	
	AntUpdateDelay:SetScript("OnUpdate", function(self, elapsed)
		self.delay = self.delay - elapsed
		if self.delay <= 0 then
			self:Hide()
			ChangeAntTrailColor = false
		end
end)

	function Ants:UpdateAntTrail(elapsed)

		local self = Ants
		local index, objective

		if DGV.DugisArrow.waypoints and not DugisGuideViewer.carboniteloaded then

			-- Clear Ant Trail
			Ants:ClearAntTrail()
			Ants.ant_cleared = false;

			-- Update Phase
			Ants.ant_phase = Ants.ant_phase + elapsed + 0.005
			while Ants.ant_phase > 1 do Ants.ant_phase = Ants.ant_phase - 1 end
			local remainder = self.ant_phase
			local mm_remainder = self.ant_phase

			-- Minimap Initialization
			local out2 = 1
			local mw, mh = DGV.DugisArrow.minimap_overlay:GetWidth(), DGV.DugisArrow.minimap_overlay:GetHeight()

			-- World Map Info
			local w, h = DGV.DugisArrow.map_overlay:GetWidth(), -DGV.DugisArrow.map_overlay:GetHeight()
			local c, z, m, f = GetCurrentMapContinent(), GetCurrentMapZone(), GetCurrentMapAreaID(), GetCurrentMapDungeonLevel()
			if c and c == 0 then m = 0 end
			local out = 1

			-- Get Player Position
			local last_x, last_y = DugisGuideViewer:TranslateWorldMapPosition(DGV.DugisArrow.map, DGV.DugisArrow.floor, DGV.DugisArrow.pos_x, DGV.DugisArrow.pos_y, m, f)
			local last_mx, last_my = mw/2, -mh/2

			-- Draw Trails To Each Objective
			for index, objective in ipairs(DGV.DugisArrow.waypoints) do
				local new_x, new_y = DugisGuideViewer:TranslateWorldMapPosition(objective.map, objective.floor, objective.x/100, objective.y/100, m, f)
				if new_x ~= last_x and new_y ~= last_y then
					local x1, y1, x2, y2 = Ants:ClampLine(last_x, last_y, new_x, new_y)
					last_x, last_y = new_x, new_y

					--Minimap
					local mx2, my2 = Ants:GetIconCoordinate(objective)
					local mx1, my1 = last_mx or 0, last_my or 0
					last_mx, last_my = mx2, my2

					if x1 --[[and x1~=x2 and y1~=y2]] then
						local len = math.sqrt((x1-x2)*(x1-x2)*16/9+(y1-y2)*(y1-y2))
						local interval = .025/len
						local p = remainder*interval

						if DugisGuideViewer:UserSetting(DGV_SHOWANTS) and not DugisGuideViewer.WrongInstanceFloor and len > 0.0001 then

							-- World Map
							if WorldMapFrame:IsVisible() then
								while p < 1 do
									local dot = self.ant_dots[out]
									if not dot or ChangeAntTrailColor == true then
										-- Create New Dot
										dot = CreateDotTexture(DGV.DugisArrow.map_overlay)
										dot:SetDrawLayer("BACKGROUND")
										self.ant_dots[out] = dot
									end
									SetWaypointDotTextureAlpha(objective, dot, f)
									dot:Show();
									dot:ClearAllPoints()
									dot:SetPoint("CENTER", DGV.DugisArrow.map_overlay, "TOPLEFT", x1*w*(1-p)+x2*w*p, y1*h*(1-p)+y2*h*p)
									out = out + 1
									p = p + interval
								end
							end
							remainder = (p-1)/interval

							if mx2 then
								local mlen = math.sqrt( (mx1-mx2)*(mx1-mx2) + (my1-my2)*(my1-my2) )
								local mm_interval = 15/mlen
								local mm_p = mm_remainder*mm_interval
								while mm_p < 1 do
									--[[
									local x, y
									x = mx1*(1-mm_p)+mx2*mm_p;y = my1*(1-mm_p)+my2*mm_p
									DebugPrint("mm_p="..mm_p.." mx1="..mx1.." my1="..my1.." mx2="..mx2.." my2="..my2.." last_mx="..last_mx.." last_my="..last_my.."len="..mlen.."x:"..x.."y:"..y)
									--]]

									-- Minimap
									local minimapdot = self.miniant_dots[out2]
									if not minimapdot or ChangeAntTrailColor == true then
										-- Create New Dot
										minimapdot = CreateDotTexture(DGV.DugisArrow.minimap_overlay)
										minimapdot:SetDrawLayer("BACKGROUND")
										self.miniant_dots[out2] = minimapdot
									end
									SetWaypointDotTextureAlpha(objective, minimapdot, f)
									minimapdot:Show()
									minimapdot:ClearAllPoints()
									minimapdot:SetPoint("CENTER", DGV.DugisArrow.minimap_overlay, "TOPLEFT", mx1*(1-mm_p)+mx2*mm_p, my1*(1-mm_p)+my2*mm_p)
									out2 = out2 + 1
									mm_p = mm_p + mm_interval
								end
								mm_remainder = (mm_p-1)/mm_interval
							end
						end
					end
				end
			end
		else
			-- Clear Ant Trail
			self:ClearAntTrail()
			self.ant_cleared = true
		end
	end

	function Ants:GetIconCoordinate(objective)
		--[[
		if DugisGuideViewer:UserSetting("TomTomArrow") then
			local title = unpack(objective.tomtom[5]).title
			DebugPrint("TITLE:"..title)
		else

		end
		--]]
		--local dist = TomTom:GetDistanceToWaypoint(objective.tomtom)
		--DebugPrint("dist="..dist)
		--if objective.minimap:IsShown() then DebugPrint("is shown") else DebugPrint("NOT shown") end
		local _, _, _, x, y = objective.minimap:GetPoint()
		if x and y then
			return x+DGV.DugisArrow.minimap_overlay:GetWidth()/2, y-DGV.DugisArrow.minimap_overlay:GetHeight()/2
		end
	end

	function Ants:Load()
	end

	function Ants:Unload()
	end
end
