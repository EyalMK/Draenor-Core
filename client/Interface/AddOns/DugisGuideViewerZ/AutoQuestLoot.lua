local DGV = DugisGuideViewer
local AutoQuestLoot = DGV:RegisterModule("AutoQuestLoot")
AutoQuestLoot.essential = true
local _
function AutoQuestLoot:Initialize()
	function DGV:LOOT_OPENED ()
		if GetCVar("AutoLootDefault") == "1" or not DGV:UserSetting(DGV_AUTOQUESTITEMLOOT) then return end
		for slot=1,GetNumLootItems() do
		end--GetQuestLogItemLink
		
		for questIndex = 1,GetNumQuestLogEntries() do
			for boardIndex = 1,GetNumQuestLeaderBoards(questIndex) do
				local leaderboardTxt, boardItemType, isDone = 
					GetQuestLogLeaderBoard(boardIndex,questIndex)
				if not isDone and boardItemType=="item" then
					local i, j, numItems, numNeeded, itemName  = 
						string.find(leaderboardTxt, "([%d]+)%s*/%s*([%d]+)%s*(.*)%s*")
					if itemName then
						for lootIndex = 1,GetNumLootItems() do
							local _, lootName = GetLootSlotInfo(lootIndex)
							if lootName==itemName then
								LootSlot(lootIndex)
							end
						end
					end
				end
			end
		end
		for lootIndex = 1,GetNumLootItems() do
			local lootIcon, lootName = GetLootSlotInfo(lootIndex)
			if lootIcon then
				local coinMatch = tonumber(lootIcon:match("Interface\\Icons\\INV_Misc_Coin_(%d+)"))
				if coinMatch and coinMatch<=6 then
					LootSlot(lootIndex)
				end
			end
		end
	end
	
	function AutoQuestLoot:Load()
		DGV:RegisterEvent('LOOT_OPENED')
	end

	function AutoQuestLoot:Unload()
		DGV:UnregisterEvent('LOOT_OPENED')
	end
end