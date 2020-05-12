local DGV = DugisGuideViewer
local _

function DGV:NoOp()
end
local unpack, ipairs, tremove, assert, tinsert, select, tContains, type, GetTime, tostring = 
	unpack, ipairs, tremove, assert, tinsert, select, tContains, type, GetTime, tostring

local GetCreateTable
local function BindToAutoroutineLifetime(object, disposeFunc)
	local autoroutine = DGV.currentAutoroutine
	if not autoroutine then return object end
	autoroutine.boundObjects[object] = disposeFunc
	return object
end

local function TryReleaseLifetime(object, disposeFunc)
	local autoroutine = DGV.currentAutoroutine
	if not autoroutine then return object end
	if autoroutine.boundObjects then
		local func = autoroutine.boundObjects[object]
		if func==disposeFunc then
			autoroutine.boundObjects[object] = nil
--DGV:DebugFormat("TryReleaseLifetime hit", "object", tostring(object))
			return object
		end
	end
	return object
--DGV:DebugFormat("TryReleaseLifetime miss")
end

local autoroutines
local function IterateAutoroutines(invariant, control)
	if not autoroutines then return end
	if not control then control = 0 end
	control = control +1
	return autoroutines[control] and control, autoroutines[control]
end

local function IsBoundToAutoroutineLifetime(object)
	for _,autoroutine in IterateAutoroutines do
		if autoroutine.boundObjects and autoroutine.boundObjects[object] then
			return autoroutine.boundObjects[object] and true
		end
	end
end

local function DisposeAllBoundObjects(autoroutine)
	for object,disposeFunc in pairs(autoroutine.boundObjects) do
		if type(object)=="table" and object~=autoroutine.boundObjects then
			disposeFunc(object)
		end
	end
end

-- Pooled Table Functions
local function Unpack(self, from, to)
	if self.n then
		return unpack(self, from or 1, to or self.n)
	else
		return unpack(self, from, to)
	end
end

-- function DGV.CountTables()
	-- local count = 0
	-- for _,_ in pairs(DGV.tables) do
		-- count = count+1
	-- end
	-- return count
-- end

-- function DGV.GetTable(index)
	-- local count = 0
	-- for t in pairs(DGV.tables) do
		-- count = count+1
		-- if count==index then
			-- return t
		-- end
	-- end
	-- return count
-- end

local tablePool = {}
-- local tables = {}
DGV.tablePool = tablePool
--DGV.tables = tables
local function Pool(self, from, to)
	-- tables[self] = nil
	tablePool[self] = self
	TryReleaseLifetime(self, Pool)
	return Unpack(self, from, to)
end
DGV.tPool = Pool

local function Insert(self, value, pos)
	local n = self.n
	if not n and value then 
		if pos then return tinsert(self, pos, value) 
		else return tinsert(self, value)  end
	end
	
	local newN = (n and n+1) or #self+1
	if not pos then
		pos = newN
	end
	self.n = newN
	for i=self.n,pos+1,-1 do
		self[i] = self[i-1]
	end
	self[pos] = value
end

local function InsertList(self, ...)
	local inputN = select("#", ...)
	local exisingN = self.n or #self
	local newN = inputN + exisingN
	for i=exisingN+1,newN do
		Insert(self, (select(i-exisingN, ...)), i)
	end
end

local function PrependList(self, ...)
	local inputN = select("#", ...)
	for i=1,inputN do
		Insert(self, (select(i, ...)), i)
	end
end

local InitTable
local function SetList(self, ...)
	wipe(self)
	InitTable(self)
	InsertList(self, ...)
end

local function IPairsIterator(invariant, control)
	control = control + 1
	local n = invariant.n
	if n<control then return end
	return control, invariant[control]
end

local function IPairs(self)
	if not self.n then return ipairs(self) end
	return IPairsIterator, self, 0
end

local function IndexOfFirst(self, item)
	for i,value in IPairs(self) do
		if value==item then
			return i
		end
	end
end

DGV.tIndexOfFirst = IndexOfFirst

local function Remove(self, index)
	local n = self.n
	if not n then
		return tremove(self, index)
	end
	local match = self[index]
	for i=index+1,n do
		self[i-1] = self[i]
	end
	self[n] = nil
	self.n = n-1
	return match
end

local function RemoveFirst(self, item)
	local matchIndex = IndexOfFirst(self, item)
	if matchIndex then
		return Remove(self, matchIndex)
	end
end
DGV.tRemoveFirst = RemoveFirst 

InitTable = function(t)
	t.InsertList = InsertList
	t.PrependList = PrependList
	t.SetList = SetList
	t.Insert = Insert
	t.Pool = Pool
	t.IPairs = IPairs
	t.IndexOfFirst = IndexOfFirst
	t.RemoveFirst = RemoveFirst
	t.Remove = Remove
	t.Unpack = Unpack
	t.BindToAutoroutineLifetime = BindToAutoroutineLifetime
	t.IsBoundToAutoroutineLifetime = IsBoundToAutoroutineLifetime
	t.TryReleaseLifetime = TryReleaseLifetime
	return t
end
DGV.InitTable = InitTable

GetCreateTable = function(...)
	local t = next(tablePool)
	if not t then
		t = {}
	else
		tablePool[t] = nil
	end
	wipe(t)
	--assert(not tContains(tables, t), "GetCreateTable adding existing table again")
	--assert(not tContains(tablePool, t), "GetCreateTable return value cannot exist in table pool")
	--tables[t] = true
	InitTable(t)
	InsertList(t, ...)
	return t
end
DGV.GetCreateTable = GetCreateTable

local THEORETICAL_TIME_LIMIT = 20 --100 seems to work w/o "script too long", but tanks FPS
local function GetTicks()
  return debugprofilestop()
end
DGV.GetTicks = GetTicks

local function TakeNext(invariant)
	if #invariant==0 then return end
	return tremove(invariant, 1)
end

local function DisposeAutoroutine(autoroutine)
--DGV:DebugFormat("DisposeAutoroutine", "key", autoroutine.key,)
	DisposeAllBoundObjects(autoroutine)
	Pool(autoroutine.boundObjects)
	Pool(autoroutine)
end

local function AutoroutinesOnUpdate()
	if autoroutines then
		local startTime = GetTicks()
		
		local i=1
		while true do
            --Preventing from the case when autoroutines isalready nil
            if autoroutines == nil or #autoroutines == 0 then
                break
            end
        
			local autoroutine = autoroutines[i]
--autoroutine.startTime = startTime
			if not autoroutine.interrupt then
				-- local result = GetCreateTable()
				DGV.currentAutoroutine = autoroutine
				-- InsertList(result, coroutine.resume(autoroutine.coroutine, Unpack(autoroutine)))
				local result, message = coroutine.resume(autoroutine.coroutine, Unpack(autoroutine))
				DGV.currentAutoroutine = nil
				local status = coroutine.status(autoroutine.coroutine)
				if status=="dead" then
					tremove(autoroutines, i)
					local onCompletion = autoroutine.onCompletion
					DisposeAutoroutine(autoroutine)
					if not result  then
						if #autoroutines==0 then
							Pool(autoroutines)
							autoroutines = nil
						end
						assert(false, message)
					end
					if onCompletion then
						DGV.QueueInvocation(onCompletion)
					end
				else
					i = i + 1
				end
				-- Pool(result)
			else
				if autoroutine.onInterrupt then
					autoroutine:onInterrupt()
				end
				DisposeAutoroutine(autoroutine)
				tremove(autoroutines, i)
			end
            
            --Preventing from the case when autoroutines isalready nil
            if autoroutines ~= nil then
                if #autoroutines>0 then
                    local now = GetTicks()
                    if (now-startTime)>=THEORETICAL_TIME_LIMIT then
                        return
                    end
                else
                    Pool(autoroutines)
                    autoroutines = nil
                    return
                end
                if i>#autoroutines then
                    i=1
                end
            end
		end
	end
end

local function YieldAutoroutine(...)
--DGV:DebugFormat("YieldAutoroutine", "stack", debugstack(1,24,20))
	if DGV.currentAutoroutine then
		coroutine.yield(...)
	end
end
DGV.YieldAutoroutine = YieldAutoroutine

local function GetRunningAutoroutine(key)
	if autoroutines then
		for _,autoroutine in IPairs(autoroutines) do
			if key==autoroutine.key then
				return autoroutine
			end
		end
	end
end
DGV.GetRunningAutoroutine = GetRunningAutoroutine

local function InterruptAutoroutine(key)
	local running = GetRunningAutoroutine(key)
	if running then
		running.interrupt = true
	end
end
DGV.InterruptAutoroutine = InterruptAutoroutine

local function OnCompletion(autoroutine, func)
	autoroutine.onCompletion = func
	return autoroutine
end

local function OnError(autoroutine, func)
	autoroutine.onError = func
	return autoroutine
end

local function OnInterrupt(autoroutine, func)
	autoroutine.onInterrupt = func
	return autoroutine
end

local autoroutinesQueue = {}

--Adds autoroutine to autoroutine queue.
function QueueAutoroutine(key, func, ...)
    local currentIndex = #autoroutinesQueue + 1
    autoroutinesQueue[currentIndex] = {key=key, func=func, args = {...}}
    
    --Object used to emulate OnCompletion, OnError and OnInterrupt functions
    local autoroutineWrapper = {}
    
    function autoroutineWrapper:OnCompletion(_function)
        autoroutinesQueue[currentIndex].OnCompletion = _function
    end
           
    function autoroutineWrapper:OnError(_function)
        autoroutinesQueue[currentIndex].OnError = _function
    end           
    function autoroutineWrapper:OnInterrupt(_function)
        autoroutinesQueue[currentIndex].OnInterrupt = _function
    end
       
    return autoroutineWrapper
end

local function BeginDefinedAutoroutine(def, ...)
    local key = def.key
    local func = def.func
    
	local autoroutine
	if autoroutines then
		for _,iteratedAutoroutine in IPairs(autoroutines) do
			if key==iteratedAutoroutine.key and not iteratedAutoroutine.interrupt then
				autoroutine = iteratedAutoroutine
				break
			end
		end
	end
    
	if not autoroutine then
		autoroutine = GetCreateTable()
		autoroutine.boundObjects = GetCreateTable()
		autoroutine.coroutine = coroutine.create(func)
		autoroutine.key = key
        
        if def.OnCompletion then
            autoroutine.onCompletion = def.OnCompletion
        end
        
        if def.OnError then
            autoroutine.onError = def.OnError
        end
        if def.OnInterrupt then
            autoroutine.onInterrupt = def.OnInterrupt
        end
        
		InsertList(autoroutine, ...)
		if not autoroutines then
			autoroutines = GetCreateTable(autoroutine)
		else
			Insert(autoroutines, autoroutine)
		end
	end
--DGV:DebugFormat("BeginAutoroutine", "key", key, "GetTicks()-debugTime", GetTicks()-debugTime)
	return autoroutine
end

C_Timer.NewTicker(0.2, function()
    if not autoroutines then
        autoroutines = GetCreateTable()
    end

    if #autoroutines == 0 then
        if #autoroutinesQueue > 0 then
            local def = autoroutinesQueue[1]
            tremove(autoroutinesQueue, 1)
            BeginDefinedAutoroutine(def, unpack(def.args))
        end
    end
end) 
  
--Begines autoroutine immediately
local function BeginAutoroutine(key, func, ...)
  local autoroutine
  if autoroutines then
      for _,iteratedAutoroutine in IPairs(autoroutines) do
          if key==iteratedAutoroutine.key and not iteratedAutoroutine.interrupt then
              autoroutine = iteratedAutoroutine
              break
          end
      end
  end
  if not autoroutine then
      autoroutine = GetCreateTable()
      autoroutine.boundObjects = GetCreateTable()
      autoroutine.coroutine = coroutine.create(func)
      autoroutine.key = key
      autoroutine.OnCompletion = OnCompletion
      autoroutine.OnError = OnError
      autoroutine.OnInterrupt = OnInterrupt
      InsertList(autoroutine, ...)
      if not autoroutines then
          autoroutines = GetCreateTable(autoroutine)
      else
          Insert(autoroutines, autoroutine)
      end
  end
  
  return autoroutine
end
        
DGV.BeginAutoroutine = BeginAutoroutine

local invocations
local function QueueInvocation(func, ...)
	--assert(type(func) == "function", "func must be a function")
	if not invocations then
		invocations = GetCreateTable()
		--DGV.invocations = invocations
	end
	local invoke = GetCreateTable(func, ...)
	--DGV:DebugFormat("QueueInvocation")
	--assert(not IndexOfFirst(invocations, invoke), "Invocation matches previously existing")
	Insert(invocations, invoke)
end
DGV.QueueInvocation = QueueInvocation

local function InvocationsOnUpdate()
	if not invocations then return end
	local now = GetTime()
	for invoke in TakeNext,invocations do
		Insert(invoke, now)
		invoke[1](select(2, Pool(invoke)))
	end
	Pool(invocations)
	invocations = nil
end

local cacheHash = {}
DGV.cacheHash = cacheHash
local function DisposeReaction(reaction)
	if reaction.disposed then return end
	reaction.disposed = true
	
	if reaction.cache then
		Pool(reaction.cache)
		reaction.cache = nil
	end
	if reaction.cacheKey then
		cacheHash[reaction.cacheKey] = nil
	end
--DGV:DebugFormat("DisposeReaction TryReleaseLifetime")
	TryReleaseLifetime(reaction, reaction.Dispose)
end

local function ReactionDoOnce(reaction)
	reaction.doOnce = true
	return reaction
end

local function ReactionDoOutOfCombat(reaction)
	reaction.doOutOfCombat = true
	return reaction
end

local function ReactionReset(reaction)
	reaction.invoked = nil
	return reaction
end

local function ReactionWithPredicate(reaction, predicate, ...)
	reaction.predicate = predicate
	InsertList(reaction, ...)
	return reaction
end

local function ReactionWithAction(reaction, action, ...)
	reaction.action = action
	InsertList(reaction, ...)
	return reaction
end

local function ReactionWithArgs(reaction, ...)
	InsertList(reaction, ...)
	return reaction
end

local function ReactionInvokePassively(reaction)
	reaction.passiveInvoke = true
	return reaction
end

local function ReactionDefer(reaction)
	reaction.defer = true
	return reaction
end

local function ReactionAfterWait(reaction, seconds)
	reaction.wait = seconds
	return reaction
end

local function ReactionDisposeOn(reaction, disposeReaction)
	ReactionInvokePassively(ReactionWithAction(ReactionDoOnce(disposeReaction), reaction.Dispose, reaction))
	return reaction
end

local function StopwatchReset(reaction)
	ReactionReset(reaction)
	reaction.time = GetTime()+reaction.seconds
	return reaction
end

local function CacheReactionUnpackCache(reaction)
	return Unpack(reaction.cache)
end

local function CacheReactionSetCache(reaction, cacheKey,  ...)
	if reaction.cache then 
		--DGV:DebugFormat("CacheReactionSetCache Pooling Extisting Cache")
		reaction.cache:Pool() 
		reaction.cache = nil
	end
	reaction.cacheKey = cacheKey
	cacheHash[cacheKey] = reaction
	reaction.cache = GetCreateTable(...)
	reaction.UnpackCache = CacheReactionUnpackCache
	ReactionDoOnce(reaction)
    
	return reaction
end


local function CacheReactionSetTargetCache(reaction, targetCacheTable, cacheKey,  ...)

	if reaction.cache then 
		--DGV:DebugFormat("CacheReactionSetCache Pooling Extisting Cache")
		reaction.cache:Pool() 
		reaction.cache = nil
	end
	reaction.cacheKey = cacheKey
	cacheHash[cacheKey] = reaction
	reaction.cache = GetCreateTable(...)
	reaction.UnpackCache = CacheReactionUnpackCache
	reaction.UnpackTargetCache = CacheReactionUnpackTargetCache
	ReactionDoOnce(reaction)
    
    targetCacheTable[cacheKey] = {...}
    
	return reaction
end

local args = {}
local function GetArgs(reaction, ...)
	wipe(args)
	InsertList(args, Unpack(reaction))
	InsertList(args, ...)
	--if not reaction.passiveInvoke then
		Insert(args, reaction, 1)
	-- end
	return args
end

local function PassiveInvokeAction(reaction, action,  ...)
	if action then return action(...) end
end

local function DoOnceAction(reaction, action, ...)
	if action then action(reaction, ...) end
	reaction:Dispose()
end

local function DeferAction(reaction, action, ...)
	QueueInvocation(action, reaction, ...)
end

local function WaitAction(reaction, action, ...)
	ReactionDoOnce(DGV.RegisterStopwatchReaction(reaction.wait, nil, action, ...))
end

local function OutOfCombatAction(reaction, action, ...)
	DoOutOfCombat(action, reaction, ...)
end

local function InvokePredicate(reaction, ...)
	if reaction.passiveInvoke then
		return PassiveInvokeAction(reaction, reaction.predicate, ...)
	else
		return reaction.predicate(reaction, ...)
	end
end

local function TryInvokeReaction(event, reaction, ...)
	local now = event=="time" and GetTime()
	local rtime,predicate = reaction.time, reaction.predicate
	if 
		((event~="time" and reaction.event==event) or (now and rtime and rtime<=now)) and
		not reaction.disposed
	then
		local args
		if predicate then
			args = GetArgs(reaction, ...)
		end
		if not predicate or InvokePredicate(Unpack(args)) then
			if not args then
				args = GetArgs(reaction, ...)
			end
			local action = reaction.action
			if reaction.passiveInvoke then
				Insert(args, action, 2)
				action = PassiveInvokeAction
			end
			if reaction.doOnce then
				Insert(args, action, 2)
				action = DoOnceAction
			end
			if action and reaction.defer then
				Insert(args, action, 2)
				action = DeferAction
			elseif action and reaction.wait then
				Insert(args, action, 2)
				action = WaitAction
			end
			if action and reaction.doOutOfCombat then
				Insert(args, action, 2)
				action = DoOutOfCombat
			end
			reaction.invoked = true
			if action then
				action(Unpack(args))
			end
		end
	end
end

local reactions, TryUnsubscribeEvent
local function ClearReaction(reaction)
	if reactions then
		local event = reaction.event
		local reactionOrGroup = reactions[event]
		if reactionOrGroup then
			if reactionOrGroup.isGroup then
				local i=1
				while i<=#reactionOrGroup do
					local groupedReaction = reactionOrGroup[i]
					if groupedReaction.disposed then
						Pool(groupedReaction)
						tremove(reactionOrGroup, i)
						if groupedReaction==reaction then break end
					else
						i = i + 1
					end
				end
				if #reactionOrGroup==0 then
					Pool(reactionOrGroup)
					reactions[event] = nil
					TryUnsubscribeEvent(event)
				end
			else
				if reactionOrGroup.disposed then
					Pool(reactionOrGroup)
					reactions[event] = nil
					TryUnsubscribeEvent(event)
				end
			end	
			if (not next(reactions)) and #reactions==0 then
				Pool(reactions)
				reactions = nil
			end
		end
	end
end

local function FireIntersectionReaction(reaction, ...)
	reaction.parent:TryInvoke(...)
	for _,child in IPairs(reaction.parent.children) do --clear siblings to avoid memory leak
		if child~=reaction then
			ClearReaction(child)
		end
	end
end

local function IntersectionReactionDispose(reaction)
	for _,child in IPairs(reaction.children) do
		child:Dispose()
	end
	Pool(reaction.children)
	DisposeReaction(reaction)
end

local function IntersectionReactionReset(reaction)
	ReactionReset(reaction)
	for _,child in IPairs(reaction.children) do
		child:Reset()
	end
end

local CommonRegisterReaction
local function IntersectionReactionOr(reaction, additionalReaction)
	if not reaction.parent and not reaction.children then
		local originalReaction = reaction
		reaction = CommonRegisterReaction(nil, nil, originalReaction.action, Unpack(originalReaction))
		originalReaction.parent = reaction
		additionalReaction.parent = reaction
		originalReaction.action = FireIntersectionReaction
		reaction.children = GetCreateTable(originalReaction, additionalReaction)
		reaction.Dispose = IntersectionReactionDispose
		reaction.Reset = IntersectionReactionReset
	elseif not reaction.children then
		Insert(reaction.parent.children, additionalReaction)
		additionalReaction.parent = reaction.parent
		reaction = reaction.parent
	else
		Insert(reaction.children, additionalReaction)
		additionalReaction.parent = reaction
	end
	additionalReaction.action = FireIntersectionReaction
	return reaction
end

local function ReactionTryInvoke(reaction, ...)
	if not reaction.disposed then
		TryInvokeReaction(nil, reaction, ...)
	end
	if reaction.disposed then
		local i=1
		while i<=#reactions do
			local noEventReaction = reactions[i]
			if noEventReaction.disposed then
				Pool(noEventReaction)
				tremove(reactions, i)
			else
				i = i + 1
			end
			if noEventReaction==reaction then break end
		end
	end
	return reaction
end

local function TryGetReactionGroup(event)
	local reaction = reactions[event]
	if reaction then
		if not reaction.isGroup then
			local group = GetCreateTable()
			group.isGroup = true
			group.event = event
			Insert(group, reaction)
			reactions[event] = group
			return group
		else
			return reaction
		end
	end
end

CommonRegisterReaction = function(event, predicate, action, ...)
	if not reactions then 
		reactions = GetCreateTable()
		DGV.reactions = reactions
	end
	local reaction = GetCreateTable(...)
	reaction.event = event
	reaction.predicate = predicate
	reaction.action = action
	reaction.Once = ReactionDoOnce
	reaction.OutOfCombat = ReactionDoOutOfCombat
	reaction.Reset = ReactionReset
	reaction.WithPredicate = ReactionWithPredicate
	reaction.WithAction = ReactionWithAction
	reaction.WithArgs = ReactionWithArgs
	reaction.InvokePassively = ReactionInvokePassively
	reaction.Defer = ReactionDefer
	reaction.AfterWait = ReactionAfterWait
	reaction.DisposeOn = ReactionDisposeOn
	reaction.Dispose = DisposeReaction
	reaction.SetCache = CacheReactionSetCache
	reaction.SetTargetCache = CacheReactionSetTargetCache
	reaction.Or = IntersectionReactionOr
	reaction.TryInvoke = ReactionTryInvoke
	if event then
		local group = TryGetReactionGroup(event)
		if group then
			Insert(group, reaction)
		else
			reactions[event] = reaction
		end
	else
		Insert(reactions, reaction)
	end
	return reaction
end

local function RegisterReaction(event, predicate, action, ...)
	if event then
		DGV.eventFrame:RegisterEvent(event)
	end
	return CommonRegisterReaction(event, predicate, action, ...)
end
DGV.RegisterReaction = RegisterReaction

local function TryInvokeReactions(event, ...)
	if reactions then
		local reactionOrGroup = reactions[event]
		if reactionOrGroup then
			if reactionOrGroup.isGroup then
				local i=1
				while i<=#reactionOrGroup do
					local groupedReaction = reactionOrGroup[i]
					if not groupedReaction.disposed then
						TryInvokeReaction(event, groupedReaction, ...)
					end
					if groupedReaction.disposed then
						Pool(groupedReaction)
						tremove(reactionOrGroup, i)
					else
						i = i + 1
					end
				end
				if #reactionOrGroup==0 then
					Pool(reactionOrGroup)
					reactions[event] = nil
					TryUnsubscribeEvent(event)
				end
			else
				if not reactionOrGroup.disposed then
					TryInvokeReaction(event, reactionOrGroup, ...)
				end
				if reactionOrGroup.disposed then
					Pool(reactionOrGroup)
					reactions[event] = nil
					TryUnsubscribeEvent(event)
				end
			end	
			if (not next(reactions)) and #reactions==0 then
				Pool(reactions)
				reactions = nil
			end
		end
	end
end

local functionHookRegistry
local function RegisterFunctionReaction(functionName, predicate, action, ...)
	if not functionHookRegistry then functionHookRegistry = {} end
	if not functionHookRegistry[functionName] then
		hooksecurefunc(functionName, 
			function(...)
				TryInvokeReactions(functionName, ...)
			end)
		functionHookRegistry[functionName] = true
	end
	return CommonRegisterReaction(functionName, predicate, action, ...)
end
DGV.RegisterFunctionReaction = RegisterFunctionReaction

TryUnsubscribeEvent = function(event)
	if not event or event=="time" or functionHookRegistry[event] then return end --not an event reaction
	if DGV.events[event] then return end --traditional DGV event
	DGV.eventFrame:UnregisterEvent(event)
end

local function EvaluatePath(...)
	local parent
	for i=1,select("#", ...) do
		local val = select(i, ...)
		if not parent then
			parent = _G[val]
		else
			parent = parent[val]
		end
	end
	return parent
end

local function GetByGlobalPath(path)
	return EvaluatePath(strsplit(".", path))
end

local function RegisterMemberFunctionReaction(functionParent, functionName, predicate, action, ...)
	local functionParentString = type(functionParent)=="string" and functionParent or functionParent:GetName()
	local key = string.format("%s:%s", functionParentString, functionName)
	
	if not functionHookRegistry then functionHookRegistry = {} end
	if not functionHookRegistry[key] then
		local parentObject = type(functionParent)=="string" and GetByGlobalPath(functionParent) or functionParent
		hooksecurefunc(parentObject, functionName,
			function(...)
				TryInvokeReactions(key, ...)
			end)
		functionHookRegistry[key] = true
	end
	return CommonRegisterReaction(key, predicate, action, ...)
end
DGV.RegisterMemberFunctionReaction = RegisterMemberFunctionReaction

local function RegisterStopwatchReaction(seconds, predicate, action, ...)
	local reaction = CommonRegisterReaction("time", predicate, action, ...)
	reaction.seconds = seconds
	reaction.Reset = StopwatchReset
	reaction:Reset()
	return reaction
end
DGV.RegisterStopwatchReaction = RegisterStopwatchReaction

local function TryGetCacheReaction(cacheKey)
	return cacheHash[cacheKey]
end
DGV.TryGetCacheReaction = TryGetCacheReaction

DGV.eventFrame:HookScript("OnEvent", function(self, event, ...)
	TryInvokeReactions(event, event, ...)
end)
DGV.eventFrame:HookScript("OnUpdate", function(self)
	AutoroutinesOnUpdate()
	InvocationsOnUpdate()
	if reactions and reactions["time"] then
		TryInvokeReactions("time", "time", GetTime())
	end
end)

local function DoOutOfCombat(action, ...)
	if not InCombatLockdown() then
		action(...)
		return true
	else
		RegisterReaction("PLAYER_REGEN_ENABLED", nil, 
		function(reaction, ...) 
			action(...)
		end, 
		...):Once()
	end
end
DGV.DoOutOfCombat = DoOutOfCombat


--example for:    PackStrings("class", "spec", "PVP")   gives:   
--   "class:spec:PVP"
local function PackStrings(...)
	local value
	for i=1,select("#", ...) do
		local ith = tostring((select(i, ...)))
		if not value then value = ith
		else value = value..":"..ith end
	end
	return value
end
DGV.PackStrings = PackStrings

local function ListContains(contains, argSelector, ...)
	if type(argSelector)~="function" then
		if argSelector==contains then return argSelector end
	end
	for i=1,select("#", ...) do
		local arg,selectedArg = select(i, ...)
		if type(argSelector)=="function" then
			selectedArg = argSelector(arg)
		end
		if selectedArg==contains then return arg end
	end
	return false
end
DGV.ListContains = ListContains