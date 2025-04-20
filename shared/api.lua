----
-- [[ roundValue function ]]
-- use tonumber(roundValue(valueHere, 2))
----
function roundValue(number, decimals)
    local power = 10 ^ decimals
    return math.floor(number * power) / power
end

function infinityPrint(tbl, indent)
    if not indent then indent = 0 end
    for k, v in pairs(tbl) do
        formatting = string.rep("  ", indent) .. k .. ": "
        if type(v) == "table" then
        print(formatting)
        infinityPrint(v, indent+1)
        return formatting
        else
        print(formatting .. v)
        return formatting
        end
    end
    return formatting
end

function getSex()
    if not IsPedMale(PlayerPedId()) then
        sex = "female"
    else
        sex = "male"
    end
    return sex
end