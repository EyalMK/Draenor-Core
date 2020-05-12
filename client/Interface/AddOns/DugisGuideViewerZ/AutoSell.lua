local MOD = DugisGuideViewer
local AutoSell = MOD:RegisterModule("AutoSell")
AutoSell.essential = true
local _
function AutoSell:Initialize()
	function MOD:MERCHANT_SHOW (event)
		if DugisGuideViewer:UserSetting(DGV_AUTOSELL) then
			local total = 0
			for bagId = 0,4 do
				for slot = 1,GetContainerNumSlots(bagId) do
					local link = GetContainerItemLink(bagId,slot)
					if link then
						if string.find(link,"|cff9d9d9d") then
							local merchantPrice =  select(11, GetItemInfo(link))
							local _, stackSize = GetContainerItemInfo(bagId, slot)
							if merchantPrice and merchantPrice > 0 then
								total = total + merchantPrice * stackSize
								UseContainerItem(bagId,slot)
							end
						end
					end
				end
			end
			if total > 0 then
				DEFAULT_CHAT_FRAME:AddMessage(string.format("|cff11ff11Dugi Guides: |rGrey quality items sold for %s", GetCoinTextureString(total)))
			end
		end
	end

	function AutoSell:Load()
		MOD:RegisterEvent('MERCHANT_SHOW')
	end

	function AutoSell:Unload()
		MOD:UnregisterEvent('MERCHANT_SHOW')
	end
end