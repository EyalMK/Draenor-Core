local DGV = DugisGuideViewer
local BBW = DGV:RegisterModule("BossButtonWorkaround")
BBW.essential = true

function BBW:Initialize()
	-- hooksecurefunc("SetMapByID", function(id)
		-- local cont = DGV:GetCZByMapId(id)
		-- if cont==0 then
			-- cont = GetCurrentMapContinent()
			-- if cont==-1 then 
				-- SetMapToCurrentZone()
				-- return 
			-- end --prevent TheWanderingIsles issue
		-- end
		-- SetMapZoom(cont, GetCurrentMapZone()) --prevent green map in mini dungeons
	-- end)
	
	-- hooksecurefunc("SetDungeonMapLevel", function(f) --doesn't work for world minidungeons
		-- if f==GetCurrentMapDungeonLevel() then return end
		-- local m = GetCurrentMapAreaID()
		-- SetMapToCurrentZone()
		-- local playerMap,playerFloor = GetCurrentMapAreaID(), GetCurrentMapDungeonLevel()
		-- if playerMap==m and playerFloor==f then return end
		-- SetMapByID(m)
	-- end)
	
	function DGV:SafeMapUpdate()
		if WorldMapFrame:IsShown() then
			-- RefreshWorldMap()  currently bugged
			-- WorldMapFrame_Update() -- taints UseSpecialQuestLogItem()
		end
	end
	
	function DGV:SafeSetMapQuestId(qid)
		if qid then 
			SetSuperTrackedQuestID(qid)
			--WorldMapFrame_OnUserChangedSuperTrackedQuest(qid)
			DGV:SafeMapUpdate()
		end 
	end
	
	function BBW:Load()
	end
	
	function BBW:Unload()
	end
end