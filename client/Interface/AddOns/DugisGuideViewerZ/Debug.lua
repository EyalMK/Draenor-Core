local DGV = DugisGuideViewer

local function GetOriginalContext()
	UIParentLoadAddOn("Blizzard_DebugTools")
	local orig_DevTools_RunDump = DevTools_RunDump
	local originalContext
	DevTools_RunDump = function(value, context)
		originalContext = context
	end
	DevTools_Dump("")
	DevTools_RunDump = orig_DevTools_RunDump
	return originalContext
end

local function DGV_Dump(value)
    local context = GetOriginalContext()
	local buffer = ""
    context.Write = function(self, msg)
		buffer = buffer.."\n"..msg
	end
 
    DevTools_RunDump(value, context)
	return buffer
end

function DGV:DebugDump(any)
	if not DGV.Debug == 1 then return nil end
	if type(any)=="string" then return any
	elseif any==nil or type(any)=="number" then return tostring(any) end
	return DGV_Dump(any)
end

function DGV:DebugFormat(header, ...)
	if not (DGV.Debug == 1) then return end
	local value = (header and string.format("Debug %s: ", header)) or "Debug: "
	value = string.format("|cff11ff11 %s|r", value)
	for i = 1, select('#', ...), 2 do
		local name = select(i, ...)
		local var = DGV:DebugDump(select(i+1, ...))
		value = string.format("%s %s=%s", value, name, var)
	end
	print(value)
end