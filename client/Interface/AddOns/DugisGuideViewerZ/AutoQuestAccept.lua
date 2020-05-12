-- Adapted from idQuestAutomation
local DGV = DugisGuideViewer
local AQA = DGV:RegisterModule("AutoQuestAccept")
AQA.essential = true
local _

function AQA:Initialize()
	AQA.completed_quests = {}
	AQA.incomplete_quests = {}	
	local RegisterReaction, DebugPrint = DGV.RegisterReaction, DGV.DebugPrint

	function AQA:canAutomate ()
		local target
		
		local guid = UnitGUID("target")
		if guid then
			target = DGV:GuidToNpcId(guid)
		else 
			target = 1
		end 
		
		local questId = GetQuestID()

		if IsShiftKeyDown() then
			return false
		elseif target ~= 45400 and 
			target ~= 64395 and
			target ~= 18166 and
			target ~= 87391 and
			target ~= 88570 and			
			target ~= 20235
			then
			if DGV:IsModuleLoaded("Guides") and DugisGuideViewer:UserSetting(DGV_AUTOQUESTACCEPTALL) and questId then
				local index = DGV:GetGuideIndexByQID(questId, "T") or DGV:GetGuideIndexByQID(questId, "A")
				if questId and index and DGV:GetQuestState(index) == "U" then
					return true
				else 
					return false
				end
			else
				return true
			end
		else
			return false		
		end
	end

	function AQA:strip_text (text)
		if not text then return end
		text = text:gsub('|c%x%x%x%x%x%x%x%x(.-)|r','%1')
		text = text:gsub('%[.*%]%s*','')
		text = text:gsub('(.+) %(.+%)', '%1')
		text = text:trim()
		return text
	end

	local function QUEST_PROGRESS ()
		DebugPrint("###QUEST_PROGRESS")
		if not self:canAutomate() then return end
		if not DugisGuideViewer:UserSetting(DGV_AUTOQUESTTURNIN) then return end
		if IsQuestCompletable() then
			CompleteQuest()
		end
	end

	local function QUEST_LOG_UPDATE ()
		DebugPrint("###QUEST_LOG_UPDATE")
		if not self:canAutomate() then return end
		--if not DugisGuideViewer:UserSetting(DGV_AUTOQUESTTURNIN) then return end
		local start_entry = GetQuestLogSelection()
		local num_entries = GetNumQuestLogEntries()
		local title
		local is_complete
		local no_objectives

		self.completed_quests = {}
		self.incomplete_quests = {}

		if num_entries > 0 then
		for i = 1, num_entries do
			SelectQuestLogEntry(i)
			title, _, _, _, _, is_complete = GetQuestLogTitle(i)
			no_objectives = GetNumQuestLeaderBoards(i) == 0
			if title then
				if is_complete or no_objectives then
				 self.completed_quests[title] = true
				else
				  self.incomplete_quests[title] = true
				end
			end
		end
		end

		SelectQuestLogEntry(start_entry)
	end

	local function GOSSIP_SHOW()
		DebugPrint("###GOSSIP_SHOW")
		if WorldMapFrame:IsShown() then HideUIPanel(WorldMapFrame) end
		if not self:canAutomate() then return end
		
		local button
		local text
		local i
		
		for i = 1, GetNumGossipAvailableQuests() do
		button = _G['GossipTitleButton' .. i]
			if button:IsVisible() then
			  text = self:strip_text(button:GetText())
				if button.type == 'Available' and DugisGuideViewer:UserSetting(DGV_AUTOQUESTACCEPT) then
					button:Click()
				elseif button.type == 'Active' and DugisGuideViewer:UserSetting(DGV_AUTOQUESTTURNIN) then
					if self.completed_quests[text] then
						button:Click()
					end
				end
			end
		end
	end

	local function QUEST_DETAIL ()
		DebugPrint("###QUEST_DETAIL")
		if WorldMapFrame:IsShown() then HideUIPanel(WorldMapFrame) end
		if not self:canAutomate() then return end
		if not DugisGuideViewer:UserSetting(DGV_AUTOQUESTACCEPT) then return end		
		QuestInfoDescriptionText:SetAlphaGradient(0, math.huge)
		if ( QuestGetAutoAccept() ) then
			CloseQuest()
		else
			AcceptQuest()
		end
	end

	local function QUEST_COMPLETE ()
		DebugPrint("###QUEST_COMPLETE")
		if WorldMapFrame:IsShown() then HideUIPanel(WorldMapFrame) end
		if not self:canAutomate() then return end
		if not DugisGuideViewer:UserSetting(DGV_AUTOQUESTTURNIN) then return end
		if GetNumQuestChoices() <= 1 then
			GetQuestReward(GetNumQuestChoices()) --Completes the quest with the specified quest reward. 
			DugisGuideViewer:CompleteQuest()
		end
	end


	local function QUEST_GREETING ()
		DebugPrint("###QUEST_GREETING")
		if WorldMapFrame:IsShown() then HideUIPanel(WorldMapFrame) end
		if not self:canAutomate() then return end
		
		local button
		local text
		local i
		
		for i = 1, GetNumAvailableQuests() do
			button = _G['QuestTitleButton' .. i]
			if button:IsVisible() then
				text = self:strip_text(button:GetText())
				if self.completed_quests[text] and DugisGuideViewer:UserSetting(DGV_AUTOQUESTTURNIN) then
					button:Click()
				elseif not self.incomplete_quests[text] then
					button:Click()
				end
			end
		end
	end

	local gossipReaction, questCompleteReaction, questDetailReaction, questGreetingReaction, questLogReaction, questProgressReaction
	function AQA:Load( )
		gossipReaction = RegisterReaction('GOSSIP_SHOW', nil, GOSSIP_SHOW) --Fired when you talk to an npc, lists quests
		questCompleteReaction = RegisterReaction('QUEST_COMPLETE', nil, QUEST_COMPLETE) --Fired after the player hits the "Continue" button in the quest-information page, before the "Complete Quest" button.
		questDetailReaction = RegisterReaction('QUEST_DETAIL', nil, QUEST_DETAIL) --Fired when the player is given a more detailed view of his quest.
		questGreetingReaction = RegisterReaction('QUEST_GREETING', nil, QUEST_GREETING) --Fired when talking to an NPC that offers or accepts more than one quest, i.e. has more than one active or available quest. turn in and accept
		questLogReaction = RegisterReaction('QUEST_LOG_UPDATE', nil, QUEST_LOG_UPDATE)
		questProgressReaction = RegisterReaction('QUEST_PROGRESS', nil, QUEST_PROGRESS)--Fired when a player is talking to an NPC about the status of a quest and has not yet clicked the complete button.
	end

	function AQA:Unload( )
		gossipReaction:Dispose()
		questCompleteReaction:Dispose()
		questDetailReaction:Dispose()
		questGreetingReaction:Dispose()
		questLogReaction:Dispose()
		questProgressReaction:Dispose()
	end
end