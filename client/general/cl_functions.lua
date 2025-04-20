-----
-- [ PLAYER_ARROUND ]
-----
function PlayerArround()
    local players, closestDistance, closestPlayer = GetActivePlayers(), -1, -1
    local playerPed = PlayerPedId()
    local playerId  = PlayerId()
    local coords, usePlayerPed = coords, false
    if coords then
        coords       = vector3(coords.x, coords.y, coords.z)
    else
        usePlayerPed = true
        coords       = GetEntityCoords(playerPed)
    end
    for i=1, #players, 1 do
        local tgt = GetPlayerPed(players[i])
        if not usePlayerPed or (usePlayerPed and players[i] ~= playerId) then
            local targetCoords  = GetEntityCoords(tgt)
            local distance      = #(coords - targetCoords)
            if closestDistance == -1 or closestDistance > distance then
                closestPlayer   = players[i]
                closestDistance = distance
            end
        end
    end
    return closestPlayer, closestDistance
end

-----
-- [ DRAW TXT + TXT 3D ]
-----
function DrawTxt(str, x, y, w, h, enableShadow, col1, col2, col3, a, centre)
    local str = CreateVarString(10, "LITERAL_STRING", str)
    SetTextScale(0.2, 0.4)
    SetTextColor(math.floor(col1), math.floor(col2), math.floor(col3), math.floor(a))
    SetTextCentre(centre)
    if enableShadow then SetTextDropshadow(1, 0, 0, 0, 255) end
    DisplayText(str, x, y)
end
function CreateVarString(p0, p1, variadic)
    return Citizen.InvokeNative(0xFA925AC00EB830B9, p0, p1, variadic, Citizen.ResultAsLong())
end

-----
-- [ FUNCT RANDOMINT ]
-----
function RandomInt(max)
    MakeRandomInt = math.random(1, tonumber(max))
    return MakeRandomInt
end