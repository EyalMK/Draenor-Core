local DGV = DugisGuideViewer
if not DGV then return end

local Search = DGV:RegisterModule("Search")

function Search:Initialize()

	DGV.Search = Search

	local L = DugisLocals
	local NUM_SEARCH_ROWS = 0

	local globalMode = false
	local function OnTextChanged(self, event, onCurrentGuideTab)
		local SearchMode
		
        if not onCurrentGuideTab then
            if globalMode then
                DGV.Guides:UpdateSearch()
                return
            end
		end	
		
		if self:GetNumLetters() == 0 then --Empty Search Box	
			SearchMode = nil
		else
			SearchMode = true
		end
		if DGV.CurrentTitle ~= nil then
			DGV:PopulateObjectives(DGV.CurrentTitle, SearchMode)
			DGV:SetQuestsState()
			_G["DGVRow"..DugisGuideUser.CurrentQuestIndex]:SetNormalTexture("Interface\\AddOns\\DugisGuideViewerZ\\Artwork\\highlight.tga")
		end
		--DGV:ClearStickyFrame()
        DGV:UpdateStickyFrame()
	end

	function Search:InSearchResults(questIndexOrHeading, guideTitle)
		local searchKey
		if DGV_SearchBox:GetNumLetters() > 1 then
			searchKey = strupper( DGV_SearchBox:GetText() )
		end
		if not searchKey or searchKey=="" then return end
		
		if guideTitle then
-- 			DGV:DebugFormat("InSearchResults", "arg1", strupper(questIndexOrHeading), 
-- 					"arg2", strupper(guideTitle), 
-- 					"result", strupper(questIndexOrHeading):match(searchKey) or 
-- 				strupper(guideTitle):match(searchKey))
		
			return 
				strupper(questIndexOrHeading):match(searchKey) or 
				strupper(guideTitle):match(searchKey)
		end
		
		local title = strupper( DGV.quests1L[questIndexOrHeading] )
		local desc = strupper( DGV.quests2[questIndexOrHeading] )
		
		if --[[Search.searchDescChk:GetChecked() and]] desc:match( searchKey ) then
			return true
		end
		
		if --[[Search.searchTitleChk:GetChecked() and]] title:match( searchKey ) then
			return true
		end
	end

	function Search:Hide()
		if DGV_SearchBox then
		DGV_SearchBox:Hide() --[[DGV_SearchTitle:Hide() DGV_SearchDesc:Hide()]] DGV_SearchString:Hide()
		end
	end

	function Search:Show(global)
		local wasGlobal = globalMode
		globalMode = global
		if DGV_SearchBox then
			DGV_SearchString:ClearAllPoints()
			DGV_SearchString:SetPoint("TOPLEFT", DugisReloadButton, "TOPRIGHT", 4, 0)
			DGV_SearchString:SetHeight(24)
			DGV_SearchBox:SetSize("100", "25")
			DGV_SearchBox:Show() --[[DGV_SearchTitle:Show() DGV_SearchDesc:Show()]] DGV_SearchString:Show()	
		end
		
		DGV_SearchString:SetFont("Fonts\\FRIZQT__.TTF", 10)
		DGV_SearchString:SetText(L["Search"])
		DGV_SearchBox:SetPoint("LEFT", DGV_SearchString, "RIGHT", 5, 0)
		if wasGlobal~=globalMode then
			Search:ClearText()
		end
	end
	
	function Search:ShowGlobal()
		self:Show(true)
		globalMode = true
		DGV_SearchString:ClearAllPoints()
		DGV_SearchString:SetPoint("TOPRIGHT", DugisMain, -220-15-25-4-7, 0)
		DGV_SearchString:SetHeight(44)
		DGV_SearchBox:SetSize("220", "25")
		-- DGV_SearchDesc:Hide()
		-- DGV_SearchTitle:Hide()
		
		DGV_SearchString:SetFont("Fonts\\MORPHEUS.ttf", 24)
		DGV_SearchString:SetText(L["Search Guides"])
		DGV_SearchBox:SetPoint("LEFT", DGV_SearchString, "RIGHT", 15, 0)
	end
		
	function Search:Init()
		--if 1 then return end
		local searchString = DGV_SearchString
		if not searchString then
			searchString = DugisMain:CreateFontString("DGV_SearchString","ARTWORK", "GameFontNormalSmall")
			searchString:SetJustifyV("MIDDLE")
		end
		searchString:SetPoint("LEFT", DugisReloadButton, "RIGHT", 4, -1)
		searchString:SetText(L["Search"])
		
		local searchBox = DGV_SearchBox
		if not searchBox then
			searchBox = CreateFrame("EditBox", "DGV_SearchBox", DugisMain, "InputBoxTemplate")
		end
		searchBox:SetAutoFocus(false)
		searchBox:SetSize("100", "25")
		searchBox:SetPoint("LEFT", searchString, "RIGHT", 5, 0)
		searchBox:SetScript("OnLoad", function(self) self:SetAutoFocus(false) end)
		searchBox:SetScript("OnEscapePressed", function(self) self:SetAutoFocus(false) self:ClearFocus() end)
        
        searchDelayTimer = nil
        
		searchBox:SetScript("OnTextChanged", function(self, event)
            if DugisMainCurrentGuideTab:GetButtonState() == "DISABLED" then
                OnTextChanged(self, event, true)
                return
            end
        
            if _G["searchThread"] ~= nil then
                DGV_SearchBox:SetText(searchingPattern)
                return
            end    
        
            if not event then
                return
            end
            
            if _G["searchThread"] ~= nil then
                return
            end
        
            if searchDelayTimer then
                searchDelayTimer:Cancel()
                searchDelayTimer = nil
            end
            
            DGVSearchFrame:Hide()
            
            searchDelayTimer = C_Timer.NewTicker(1, function()
                if DGV_SearchBox:GetNumLetters() > 1 then
                   SearchingInfoText:Show()
                    DugisSearchProgressIcon:Show()
                    DGV_SearchBox:SetAlpha(0.0)
                    DugisMainRightScrollFrame.bar:SetEnabled(false)
                else
                    SearchingInfoText:Hide()
                    DugisSearchProgressIcon:Hide()
                end
                
                SearchingInfoText:SetText(L["Searching for"] .. ": " .. DGV_SearchBox:GetText() .. "..")

                OnTextChanged(self, event)
                if searchDelayTimer then
                    searchDelayTimer:Cancel()
                    searchDelayTimer = nil
                end
            end) 

        end)

		searchBox:Show()
		searchString:Show()
		
		--[[Search.searchTitleChk = DGV_SearchTitle
		if not Search.searchTitleChk then
			Search.searchTitleChk = CreateFrame("CheckButton",  "DGV_SearchTitle", DugisMain, "UICheckButtonTemplate")
		end
		Search.searchTitleChk:SetSize("20", "20")
		Search.searchTitleChk:SetChecked(true)
		Search.searchTitleChk:SetPoint("LEFT", DGV_SearchBox, "RIGHT")
		_G[Search.searchTitleChk:GetName().."Text"]:SetText(L["Title"])
		
		Search.searchDescChk = DGV_SearchDesc
		if not Search.searchDescChk then
			Search.searchDescChk = CreateFrame("CheckButton",  "DGV_SearchDesc", DugisMain, "UICheckButtonTemplate")
		end
		Search.searchDescChk:SetSize("20", "20")
		Search.searchDescChk:SetChecked(true)
		Search.searchDescChk:SetPoint("LEFT", _G[Search.searchTitleChk:GetName().."Text"], "RIGHT")	
		_G[Search.searchDescChk:GetName().."Text"]:SetText(L["Description"])]]

	end
		
	function Search:ClearText()
		DGV_SearchBox:SetText("")
	end
	
	function Search:Load()
		Search:Init()
	end
	
	function Search:Unload()
		Search:Hide()
	end
end