---
-- [[ LAST POS FUNCT ]]
---
RegisterNetEvent('infinity_core:spawnPlayer')
AddEventHandler('infinity_core:spawnPlayer', function(posX, posY, posZ, h)
    local playerPed = GetPlayerPed(-1)
    StartPlayerTeleport(playerPed, posX, posY, posZ, h, false, true, true)
end)

---
-- [[ GET TOWN POSITION PLAYER ]]
---
function GetTownPlayer()
    local playerPed     = PlayerPedId()
    local coords        = GetEntityCoords(playerPed)
    local GetTown       = Citizen.InvokeNative(0x43AD8FC02B429D33, coords, 1)
    if GetTown == GetHashKey("Annesburg") then
        return "Annesburg"
    elseif GetTown == GetHashKey("Annesburg") then
        return "Annesburg"
    elseif GetTown == GetHashKey("Armadillo") then
        return "Armadillo"
    elseif GetTown == GetHashKey("Blackwater") then
        return "Blackwater"
    elseif GetTown == GetHashKey("BeechersHope") then
        return "BeechersHope"
    elseif GetTown == GetHashKey("Braithwaite") then
        return "Braithwaite"
    elseif GetTown == GetHashKey("valentine") then
        return "Valentine"
    elseif GetTown == GetHashKey("cornwall") then
        return "Cornwall"
    elseif GetTown == GetHashKey("Emerald") then
        return "Emerald"
    elseif GetTown == GetHashKey("lagras") then
        return "lagras"
    elseif GetTown == GetHashKey("Manzanita") then
        return "Manzanita"
    elseif GetTown == GetHashKey("Rhodes") then
        return "Rhodes"
    elseif GetTown == GetHashKey("Siska") then
        return "Siska"
    elseif GetTown == GetHashKey("StDenis") then
        return "Saint Denis"
    elseif GetTown == GetHashKey("Strawberry") then
        return "Strawberry"
    elseif GetTown == GetHashKey("wapiti") then
        return "Wapiti"
    elseif GetTown == GetHashKey("Tumbleweed") then
        return "Tumbleweed"
    elseif GetTown == GetHashKey("VANHORN") then
        return "Vanhorn"
    elseif GetTown == GetHashKey("Wallace") then
        return "Wallace"
    else
        return ""
    end
end