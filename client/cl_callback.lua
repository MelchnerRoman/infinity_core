----
-- [[ RegisterClientCallback(name, cb) ]]
-- @param name string - Name of the callback
-- @param cb function - Callback function (cb, ...)
----

-- Table to store registered callbacks
local ClientCallbacks = {}

-- Unique identifier for each callback
local CallbackCounter = 0

-- Configuration
local DefaultTimeout = Config.CallbackTimeout or 10000 -- ms
local DebugMode = Config.Debug or false

-- Utility function for debugging
local function DebugPrint(...)
    if DebugMode then
        print('^3[INFINITY CALLBACK]^7', ...)
    end
end

-- Function to generate a unique ID
local function GenerateCallbackId()
    CallbackCounter = CallbackCounter + 1
    return "cb_" .. GetGameTimer() .. "_" .. CallbackCounter
end

--[[
    RegisterClientCallback
    Registers a client callback that can be called by the server
    @param name string - Name of the callback
    @param cb function - Callback function
]]
function RegisterClientCallback(name, cb)
    ClientCallbacks[name] = cb
    DebugPrint("Client callback registered: " .. name)
end

--[[
    TriggerServerCallback
    Triggers a callback on the server and waits for the response asynchronously
    @param name string - Name of the callback
    @param cb function - Callback function to handle the response
    @param ... any - Arguments to pass to the server callback
    @param timeout number|boolean - Timeout in ms or false to disable
]]
function TriggerServerCallback(name, cb, ...)
    local callbackId = GenerateCallbackId()
    local args = {...}
    local timeout = DefaultTimeout
    
    DebugPrint("TriggerServerCallback arguments: " .. tostring(#args))
    for i, arg in ipairs(args) do
        DebugPrint("Arg " .. i .. ": " .. tostring(arg) .. " (" .. type(arg) .. ")")
    end
    
    if #args > 0 and (type(args[#args]) == "number" or args[#args] == false) then
        timeout = args[#args]
        table.remove(args, #args)
    end
    
    local eventName = 'infinity_core:serverCallbackResponse:' .. callbackId
    RegisterNetEvent(eventName)
    
    local hasBeenCalled = false
    
    local eventHandler = AddEventHandler(eventName, function(...)
        if hasBeenCalled then return end
        hasBeenCalled = true
        cb(...)
    end)
    
    TriggerServerEvent('infinity_core:triggerServerCallback', name, callbackId, table.unpack(args))
    
    if timeout and timeout > 0 then
        Citizen.SetTimeout(timeout, function()
            if eventHandler then
                RemoveEventHandler(eventHandler)
                DebugPrint("Timeout for server callback: " .. name)
                cb(nil, "TIMEOUT")
            end
        end)
    end
end

--[[
    TriggerSyncServerCallback
    Triggers a callback on the server and waits for the response synchronously
    WARNING: This method blocks the thread until a response is received
    @param name string - Name of the callback
    @param ... any - Arguments to pass to the server callback
    @param timeout number|boolean - Timeout in ms or false to disable
    @return any - Callback result
]]
function TriggerSyncServerCallback(name, ...)
    local p = promise.new()
    
    TriggerServerCallback(name, function(...)
        p:resolve({...})
    end, ...)
    
    local result = Citizen.Await(p)
    return table.unpack(result)
end

--[[
    TriggerAwaitServerCallback
    Triggers a callback on the server and waits for the response using await
    Must be used within a Citizen thread
    @param name string - Name of the callback
    @param ... any - Arguments to pass to the server callback
    @param timeout number|boolean - Timeout in ms or false to disable
    @return any - Callback result
]]
function TriggerAwaitServerCallback(name, ...)
    local p = promise.new()
    
    TriggerServerCallback(name, function(...)
        p:resolve({...})
    end, ...)
    
    local result = Citizen.Await(p)
    return table.unpack(result)
end

--[[
    Event to receive callback calls from the server
]]
RegisterNetEvent('infinity_core:triggerClientCallback')
AddEventHandler('infinity_core:triggerClientCallback', function(name, callbackId, ...)
    if ClientCallbacks[name] then
        ClientCallbacks[name](function(...)
            TriggerServerEvent('infinity_core:clientCallbackResponse:' .. callbackId, ...)
        end, ...)
    else
        DebugPrint("Client callback not found: " .. name)
        TriggerServerEvent('infinity_core:clientCallbackResponse:' .. callbackId, nil, "CALLBACK_NOT_FOUND")
    end
end)

-- Export functions
exports('RegisterClientCallback', RegisterClientCallback)
exports('TriggerServerCallback', TriggerServerCallback)
exports('TriggerSyncServerCallback', TriggerSyncServerCallback)
exports('TriggerAwaitServerCallback', TriggerAwaitServerCallback)