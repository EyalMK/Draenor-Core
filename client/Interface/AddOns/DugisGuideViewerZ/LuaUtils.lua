-------------------------- LUA UTILS ---------------------------
LuaUtils = {}

function LuaUtils:split(pString, pPattern)
    local Table = {}
    local fpat = "(.-)" .. pPattern
    local last_end = 1
    local s, e, cap = pString:find(fpat, 1)
    
    while s do
        if s ~= 1 or cap ~= "" then
            table.insert(Table, cap)
        end
        last_end = e + 1
        s, e, cap = pString:find(fpat, last_end)
    end
    
    if last_end <= #pString then
        cap = pString:sub(last_end)
        table.insert(Table, cap)
    end
    
    return Table
end

function LuaUtils:separateCamelCase(aString)
    aString = aString:gsub( "(%l)(%u)", "%1 %2" )
    aString = aString:gsub( "(%u)(%u)(%l)", "%1 %2%3" )
    local result = ""
    
    aString:gsub( "%a+", function(item) 
        result = result..item.." "
    end)
    
    return LuaUtils:trim(result)
end

function LuaUtils:trim(text)
    return text:gsub("^%s*(.-)%s*$", "%1")
end

function LuaUtils:crop(text, length)
    return string.sub(text, 1, length)
end

function LuaUtils:IsNilOrEmpty(text)
    return text == nil or self:trim(text) == ""
end

function LuaUtils:matchString(input, pattern)
    local val = input:match(pattern)
    
    if val == nil then
        val = ""
    end
    
    return val
end

--Breaks in case func returns "break" string
function LuaUtils:foreach(items, func)
    local index = 1
    for key, value in pairs (items) do
      local result = func(value, key, index)
      if result == "break" then return end
      index = index + 1
    end 
end

function LuaUtils:loop(times, func, unpackResults)
    local results = {}
    for i = 1, times do
      results[i] = func(i)
    end 
    if unpackResults ~= true then
        return results
    else
        return unpack(results)
    end
end

function LuaUtils:loopAndUnpack(times, func)
    return self:loop(times, func, true)
end

function LuaUtils:isInTable(item, tbl)
    for key, value in pairs(tbl) do
        if value == item then return key end
    end
    return false
end


function LuaUtils:dumpVar ( t )
    local print_r_cache={}
    local function sub_print_r(t,indent)
        if (print_r_cache[tostring(t)]) then
        print(indent.."*"..tostring(t))
        else
            print_r_cache[tostring(t)]=true
            if (type(t)=="table") then
                for pos,val in pairs(t) do
                    if (type(val)=="table") then
                        print(indent.."["..pos.."] => "..tostring(t).." {")
                        sub_print_r(val,indent..string.rep(" ",string.len(pos)+8))
                        print(indent..string.rep(" ",string.len(pos)+6).."}")
                    else
                        print(indent.."["..pos.."] => "..tostring(val))
                    end
                end
            else
                print(indent..tostring(t))
            end
        end
    end
    sub_print_r(t," ")
end      
 
LuaUtils.Profiler = {}
LuaUtils.Profiler.Counters = {}
LuaUtils.Profiler.Sums = {}

--Label is optional if you don't have nested timers
function LuaUtils.Profiler:Start(label)
    if label then
      --  print("START: ", label)
        LuaUtils.Profiler.Counters[label] = debugprofilestop()
    else
        debugprofilestart()
    end
    
    LuaUtils.Profiler.Sums[label] = 0
end

function LuaUtils.Profiler:PeriodStart(label)
    LuaUtils.Profiler.Counters[label] = debugprofilestop()
end

function LuaUtils.Profiler:PeriodEnd(label)
    LuaUtils.Profiler.Sums[label] = LuaUtils.Profiler.Sums[label] + (debugprofilestop() - LuaUtils.Profiler.Counters[label])
end

function LuaUtils.Profiler:Stop(label)
    if LuaUtils.Profiler.Counters[label] then
       -- print(label, " FINISHED. Duration: ", debugprofilestop() - LuaUtils.Profiler.Counters[label], "ms")
    else
       -- print(label, " FINISHED. Duration: ", debugprofilestop(), "ms")
    end
end

function LuaUtils.Profiler:StopSum(label)
     print(label, " SUM: ", LuaUtils.Profiler.Sums[label])
end

function IsFrameVisible(frameName)
    return _G[frameName]~= nil and _G[frameName]:IsVisible()
end

dugisThreads = {}

-- threadThrottle (if == 1 then one execution per second)
function LuaUtils:CreateThread(threadName, threadFunction, onEnd, resumeAmountPerFrame, threadThrottle)

    threadName = "thread_"..threadName

	local threadFrame = CreateFrame("Frame")
	local threadCounter = 0
    
    if threadThrottle == nil then
        threadThrottle = 0.01
    end  
    
    if resumeAmountPerFrame == nil then
        resumeAmountPerFrame = 40
    end
    
	threadFrame:SetScript("OnUpdate" , function(self, elapsed)
		threadCounter = threadCounter + elapsed
		if threadCounter >= threadThrottle then
			threadCounter = threadCounter - threadThrottle
            
            if dugisThreads[threadName] ~= nil then
                if coroutine.status(dugisThreads[threadName]) ~= "dead" then
                    for i=1, resumeAmountPerFrame do
                        local result, message = coroutine.resume(dugisThreads[threadName])
                        local status = coroutine.status(dugisThreads[threadName])
                        --[[if status=="dead" then
                            print("DEAD", result, message)
                            --assert(false, message)
                        --    debug.traceback()
                        end]]
                    end
                else
                    if onEnd then
                        onEnd()
                    end
                    dugisThreads[threadName] = nil
                end
            end
		end
	end) 

    dugisThreads[threadName] = coroutine.create(threadFunction)
end

function LuaUtils:ThreadInProgress(threadName)
    threadName = "thread_"..threadName
    return dugisThreads[threadName]~=nil
end

function LuaUtils:clone(orig)
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in next, orig, nil do
            copy[LuaUtils:clone(orig_key)] = LuaUtils:clone(orig_value)
        end
        setmetatable(copy, LuaUtils:clone(getmetatable(orig)))
    else -- number, string, boolean, etc
        copy = orig
    end
    return copy
end

function LuaUtils:Delay(timeSec, function_)
    C_Timer.After(timeSec, function_)
end

table.filter = function(t, filterIter)
  if not t then
    return t
  end
  local out = {}

  for k, v in pairs(t) do
    if filterIter(v, k, t) then out[k] = v end
  end

  return out
end

function LuaUtils:WaitForCombatEnd()
    if not UnitAffectingCombat("player") then
        return
    end
    
    for i = 1, 1000 do
        if UnitAffectingCombat("player") then
            coroutine.yield()
        end
    end
end

--Export functions

--/run ExportDungeonsInfo()
function ExportDungeonsInfo()
    DataExport = {} 
    DataExport.A = "dungeonId;name; typeID; subtypeID; minLevel; maxLevel; recLevel; minRecLevel; maxRecLevel; expansionLevel; groupID; textureFilename; difficulty; maxPlayers; description; isHoliday; bonusRepAmount; minPlayers"
    
    DataExport.B = "{"
    
    LuaUtils:loop(9000, function(index)
        local dungeonId = index - 1
        local name, typeID, subtypeID, minLevel, maxLevel, recLevel, minRecLevel, maxRecLevel, expansionLevel, groupID, textureFilename, difficulty, maxPlayers, description, isHoliday, bonusRepAmount, minPlayers = GetLFGDungeonInfo(dungeonId)
       
        if name then
            DataExport.A = DataExport.A ..
            string.format ("\n%s;%s;%s;%s;%s;%s;%s;%s;%s;%s;%s;%s;%s;%s;%s;%s;%s;%s"
            , dungeonId, name, typeID, subtypeID, minLevel, maxLevel, recLevel, minRecLevel, maxRecLevel, expansionLevel, groupID, textureFilename, difficulty, maxPlayers, description, tostring(isHoliday), bonusRepAmount, minPlayers or "")
            
            DataExport.B = DataExport.B .. "{\""..name .."\", \"".. dungeonId .. "\"},"
        end
    end)
    DataExport.B = DataExport.B .. "}"
end

--in bytes
function LuaUtils:getVariableSize(variable, step--[[, path]])
    if step == nil then
        step = 0
    end    
    
  --[[  if path == nil then
        path = ""
    end]]

    if variable == nil then
        return 0
    end
    
    if type(variable) == "boolean" then
        return 8
    end
    
    if type (variable) == "number" then
        return 32
    end    
    
    if type (variable) == "string" then
        return string.len(variable) * 16
    end      
    
    if type (variable) == "function" then
        return 32
    end  
    
    if type (variable) == "userdata" then
        return 32 -- pointer
    end      

    if type (variable) == "table" then
        local tableSize = 32 -- pointer
        for pos, val in pairs(variable) do
        
           -- path = path .. "." .. pos
            if step > 18 then
              --  print("max step: ", --[[path,]] step)
                return 0
            end        
        
            tableSize = tableSize + LuaUtils:getVariableSize(pos, step + 1--[[, path]])
            tableSize = tableSize + LuaUtils:getVariableSize(val, step + 1--[[, path]])
        end
        
        return tableSize
    end 

    print("Unknown type:", type(variable))
    return 0
end

--in KB
function LuaUtils:getVariableSizeInMB(variable--[[, path]])
    local inBytes = LuaUtils:getVariableSize(variable, nil--[[, path]])
    local inKb = inBytes / 1000
    local inKB = inKb / 8
    local inMB = inKB / 1000
    return inMB
end

--print global variables
--/run LuaUtils:printVariableSizeInMB()
function LuaUtils:printVariableSizeInMB(root)
    local variablesInfo = {}
    for pos, val in pairs(root) do
        local size = LuaUtils:getVariableSizeInMB(val, pos)
        local name = pos
        variablesInfo[#variablesInfo + 1] = {name=name, size=size}
    end
    table.sort(variablesInfo, function(a,b)  
        return a.size < b.size  
    end)
    
    local total = 0
    LuaUtils:foreach(variablesInfo, function(value)
        total = total + value.size
      --  print(value.name, " " , value.size, "MB")
    end)
    print("TOTAL", " " , total, "MB")
end
