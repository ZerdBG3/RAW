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

-- Adds an element to a Set
function RAW_Set_Add(set, elem)
    if not set[elem] then
        set[elem] = true
    end
end

-- Concatenates the elements of set to a string, using sep as a separator
function RAW_Set_Concat(set, sep)
    local str = ""
    for elem in pairs(set) do
        local prefix = ""
        if str ~= "" then
            prefix = sep
        end
        str = str .. prefix .. tostring(elem)
    end
    return str
end

function CentralizedString(text, width)
    width = width or 70
    local spaces = (width - string.len(text))//2
    return string.rep(" ", spaces) .. text
end

function IsModOptionEnabled(modOption)
    return modOption == "base" or (ModOptions[modOption] ~= nil and ModOptions[modOption].enabled)
end

-- Checks if the stat has the parent in its using tree
function StatHasParent(stat, parentName)
    if stat.Name == parentName then
        return true
    end
    if stat.Using ~= nil and stat.Using ~= "" then
        return StatHasParent(Ext.Stats.Get(stat.Using), parentName)
    end
    return false
end

-- Print only if the value is set (not commented) on the table
RAW_PrintTable_ModOptions = 0
RAW_PrintTable_CharacterPassives = 1
RAW_PrintTable_Spells_BonusAction = 2
RAW_PrintTable_WeaponSpells = 3
RAW_PrintTable_WeaponThrown = 4

local ENUM_RAW_PrintTable = RAW_Set {
    RAW_PrintTable_ModOptions,
    -- RAW_PrintTable_CharacterPassives,
    -- RAW_PrintTable_Spells_BonusAction,
    -- RAW_PrintTable_WeaponSpells,
    -- RAW_PrintTable_WeaponThrown,
}

function RAW_PrintIfDebug(text, debug)
    if ENUM_RAW_PrintTable[debug] then
        if type(text) == "string" then
            Ext.Utils.Print(text)
        else
            _D(text)
        end
    end
end
