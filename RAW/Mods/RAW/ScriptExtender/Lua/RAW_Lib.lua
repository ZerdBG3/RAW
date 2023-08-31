-- Global variables
local RAW_WeaponSpells_UUID = "f0ea0d62-5e9e-4596-a32f-05bd109d2392"
RAW_IsWeaponSpellsLoaded = Ext.Mod.IsModLoaded(RAW_WeaponSpells_UUID)

-- Data string helpers
function RAW_RemoveRepeatedSemicolon(s)
    s = string.gsub(s, ";;+", ";")
    return string.gsub(s, "^;", "")
end

function RAW_HasValueInList(list, value)
    for _, v in pairs(list) do
        if v == value then
            return true
        end
    end
    return false
end

-- Creates a Set from a list
function RAW_Set(list)
    local set = {}
    for _, l in ipairs(list) do
        set[l] = true
    end
    return set
end

-- Prints a table recursively, identing basend on the value passed
function RAW_TPrint(tbl, indent)
    indent = indent or 0
    for k, v in pairs(tbl) do
        local formatting = string.rep("  ", indent) .. k .. ": "
        if type(v) == "table" then
            Ext.Utils.Print(formatting)
            RAW_TPrint(v, indent+1)
        else
            Ext.Utils.Print(formatting .. tostring(v) .. "   Type (" .. type(v) .. ")")
        end
    end
end

function RAW_PrintAnyVariable(v, indent)
    if type(v) == "string" then
        Ext.Utils.Print(v)
    elseif type(v) == "table" then
        RAW_TPrint(v, indent)
    end
end

-- Print only if the value is set (not commented) on the table
RAW_PrintTable_WeaponSpells = 0
RAW_PrintTable_WeaponThrown = 1

local ENUM_RAW_PrintTable = RAW_Set {
    -- RAW_PrintTable_WeaponSpells,
    -- RAW_PrintTable_WeaponThrown,
}

function RAW_PrintIfDebug(text, type, indent)
    if ENUM_RAW_PrintTable[type] then
        RAW_PrintAnyVariable(text, indent)
    end
end
