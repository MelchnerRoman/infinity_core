----
-- [[ roundValue function ]]
-- use tonumber(roundValue(valueHere, 2))
----
function roundValue(number, decimals)
    local power = 10 ^ decimals
    return math.floor(number * power) / power
end

function infinityPrint(data, indent)
    if not indent then indent = 0 end
    
    -- Si c'est une chaîne de caractères, simplement l'afficher
    if type(data) == "string" then
        print(data)
        return
    end
    
    -- Si c'est nil, afficher un message
    if data == nil then
        print("nil")
        return
    end
    
    -- Si ce n'est pas une table, convertir en chaîne
    if type(data) ~= "table" then
        print(tostring(data))
        return
    end
    
    -- Traitement de la table
    for k, v in pairs(data) do
        local formatting = string.rep("  ", indent) .. k .. ": "
        if type(v) == "table" then
            print(formatting)
            infinityPrint(v, indent+1)
        else
            print(formatting .. tostring(v))
        end
    end
end

function getSex()
    if not IsPedMale(PlayerPedId()) then
        sex = "female"
    else
        sex = "male"
    end
    return sex
end