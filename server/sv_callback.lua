----
-- [[ RegisterServerCallback(name, cb) ]]
-- @param name string - Name of the callback
-- @param cb function - Callback function
----

local ServerCallbacks = {}
local CallbackCounter = 0

-- Configuration
local DefaultTimeout = Config.CallbackTimeout or 10000 -- ms
local DebugMode = Config.Debug or false

local function DebugPrint(...)
    if DebugMode then
        print('^3[INFINITY CALLBACK]^7', ...)
    end
end

-- Function to generate a unique callback ID
local function GenerateCallbackId()
    CallbackCounter = CallbackCounter + 1
    return "cb_" .. os.time() .. "_" .. CallbackCounter
end

----
-- [[ RegisterServerCallback(name, cb) ]]
----
--[[
    RegisterServerCallback
    Registers a server callback that can be called by the client
    @param name string - Name of the callback
    @param cb function - Callback function
]]
function RegisterServerCallback(name, cb)
    ServerCallbacks[name] = cb
    DebugPrint("Server callback registered: " .. name)
end

----
-- [[ TriggerClientCallback(playerId, name, cb, ...) ]]
----
--[[
    TriggerClientCallback
    Triggers a callback on the specified client and waits for the response asynchronously
    @param playerId number - Player ID
    @param name string - Name of the callback
    @param cb function - Execute callback and send response to server
    @param ... any - Arguments to pass to the client callback
    @param timeout number|boolean - Timeout in ms or false to disable
]]
function TriggerClientCallback(playerId, name, cb, ...)
    local callbackId = GenerateCallbackId()
    local args = {...}
    local timeout = DefaultTimeout
    local errorCb = nil
    
    if type(args[#args]) == 'function' then
        errorCb = args[#args]
        table.remove(args, #args)
    end
    if type(args[#args]) == 'number' then
        timeout = args[#args]
        table.remove(args, #args)
    end
    
    local eventName = 'infinity_core:clientCallbackResponse:' .. callbackId
    RegisterNetEvent(eventName)
    
    local hasBeenCalled = false
    local eventHandler = AddEventHandler(eventName, function(...)
        if hasBeenCalled then return end
        hasBeenCalled = true
        cb(...)
    end)

    TriggerClientEvent('infinity_core:triggerClientCallback', playerId, name, callbackId, table.unpack(args))
    
    if timeout and timeout > 0 then
        Citizen.SetTimeout(timeout, function()
            if not hasBeenCalled then
                hasBeenCalled = true
                DebugPrint("Timeout for client callback: " .. name)
                
                if errorCb then
                    errorCb()
                else
                    cb(nil, "TIMEOUT")
                end
            end
        end)
    end
end

----
-- [[ TriggerSyncClientCallback(playerId, name, ...) ]]
----
--[[
    TriggerSyncClientCallback
    Triggers a callback on the specified client and waits for the response synchronously
    WARNING: This method blocks the thread until a response is received
    @param playerId number - Player ID
    @param name string - Name of the callback
    @param ... any - Arguments to pass to the client callback
    @param timeout number|boolean - Timeout in ms or false to disable
    @return any - Callback result
]]
function TriggerSyncClientCallback(playerId, name, ...)
    local p = promise.new()
    
    TriggerClientCallback(playerId, name, function(...)
        p:resolve({...})
    end, ...)
    
    local result = Citizen.Await(p)
    return table.unpack(result)
end

----
-- [[ TriggerAwaitClientCallback(playerId, name, ...) ]]
----
--[[
    TriggerAwaitClientCallback
    Triggers a callback on the specified client and waits for the response using await
    Must be used within a Citizen thread
    @param playerId number - Player ID
    @param name string - Name of the callback
    @param ... any - Arguments to pass to the client callback
    @param timeout number|boolean - Timeout in ms or false to disable
    @return any - Callback result
]]
function TriggerAwaitClientCallback(playerId, name, ...)
    local p = promise.new()

    TriggerClientCallback(playerId, name, function(...)
        p:resolve({...})
    end, ...)
    
    local result = Citizen.Await(p)
    return table.unpack(result)
end

----
-- [[ RegisterNetEvent('infinity_core:triggerServerCallback') ]]
----
--[[
    Event to receive callback calls from the client
]]
RegisterNetEvent('infinity_core:triggerServerCallback')
AddEventHandler('infinity_core:triggerServerCallback', function(name, callbackId, ...)
    local _source = source
    if ServerCallbacks[name] then
        ServerCallbacks[name](_source, function(...)
            TriggerClientEvent('infinity_core:serverCallbackResponse:' .. callbackId, _source, ...)
        end, ...)
    else
        DebugPrint("Server callback not found: " .. name)
        TriggerClientEvent('infinity_core:serverCallbackResponse:' .. callbackId, _source, nil, "CALLBACK_NOT_FOUND")
    end
end)

-- Export functions
exports('RegisterServerCallback', RegisterServerCallback)
exports('TriggerClientCallback', TriggerClientCallback)
exports('TriggerSyncClientCallback', TriggerSyncClientCallback)
exports('TriggerAwaitClientCallback', TriggerAwaitClientCallback)