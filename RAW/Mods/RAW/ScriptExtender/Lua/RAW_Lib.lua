-- Data helpers
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

-- Checks if the stat has the parent in its using tree
function RAW_StatHasParent(stat, parentName)
    if stat.Name == parentName then
        return true
    end
    if stat.Using ~= nil and stat.Using ~= "" then
        return RAW_StatHasParent(Ext.Stats.Get(stat.Using), parentName)
    end
    return false
end

-- Checks if the character stat object is _Hero or inherits it
function RAW_CharIsHero(char)
    return char ~= nil and string.find(char.Passives, "WeaponThrow") and string.find(char.Passives, "CombatStartAttack")
end

-- Static Data helpers
function RAW_ApplyStaticData(defTable, printDebug)
    for defType, defList in pairs(defTable) do
        for guid, changes in pairs (defList) do
            local resource = Ext.Definition.Get(guid, defType)
            RAW_PrintIfDebug("\n" .. defType .. ": " .. guid, printDebug)
            for attribute, replacement in pairs(changes) do
                if replacement.Type == "add" then
                    if type(replacement.Value) == "string" then
                        RAW_PrintIfDebug("\tAdding to " .. attribute .. " - " .. replacement.Value, printDebug)
                        resource[attribute] = replacement.Value .. ";" .. resource[attribute]
                    elseif type(replacement.Value) == "table" then
                        RAW_PrintIfDebug("\tAdding to " .. attribute .. " table", printDebug)
                        for _, value in pairs(replacement.Value) do
                            table.insert(resource[attribute], value)
                        end
                    end
                elseif replacement.Type == "overwrite" then
                    if type(replacement.Value) == "string" then
                        RAW_PrintIfDebug("\tOverwriting " .. attribute .. " - " .. replacement.Value, printDebug)
                    elseif type(replacement.Value) == "table" then
                        RAW_PrintIfDebug("\tOverwriting " .. attribute .. " table", printDebug)
                        RAW_PrintIfDebug(replacement.Value, printDebug)
                    end
                    resource[attribute] = replacement.Value
                end
            end
            RAW_PrintIfDebug(resource, printDebug)
        end
    end
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
    width = width or 100
    local spaces = (width - string.len(text))//2
    return string.rep(" ", spaces) .. text
end

function RAW_IsInteger(v)
    return type(v) == "number" and math.floor(v) == v
end

function RAW_IsIntegerBetween(v, min, max)
    return RAW_IsInteger(v) and v >= min and v <= max
end

-- Converts a string or number to a boolean
function RAW_Bool(v)
    if type(v) == "boolean" then
        return v
    end
    if type(v) == "string" then
        if v == "false" or v == "No" then
            return false
        end
        return true

    elseif type(v) == "number" then
        if v == 0 or v ~= v then
            return false
        end
        return true
    end

    return false
end

-- Print only if the value is set (not commented) on the table
RAW_PrintTable_ModOptions = 0
RAW_PrintTable_Attunement = 1
RAW_PrintTable_CharacterPassives = 2
RAW_PrintTable_Rogue = 3
RAW_PrintTable_Rogue_Thief = 4
RAW_PrintTable_Spells_BonusAction = 5
RAW_PrintTable_Spells_Duration = 6
RAW_PrintTable_WeaponSpells = 7
RAW_PrintTable_WeaponThrown = 8

local ENUM_RAW_PrintTable = RAW_Set {
    RAW_PrintTable_ModOptions,
    -- RAW_PrintTable_Attunement,
    -- RAW_PrintTable_CharacterPassives,
    -- RAW_PrintTable_Rogue,
    -- RAW_PrintTable_Rogue_Thief,
    -- RAW_PrintTable_Spells_BonusAction,
    -- RAW_PrintTable_Spells_Duration,
    -- RAW_PrintTable_WeaponSpells,
    -- RAW_PrintTable_WeaponThrown,
}

RAW_PrintTypeInfo = "info"
RAW_PrintTypeWarning = "warning"
RAW_PrintTypeError = "error"

function RAW_PrintIfDebug(text, debug, level)
    if ENUM_RAW_PrintTable[debug] then
        if type(text) == "string" then
            if level == RAW_PrintTypeError then
                Ext.Utils.PrintError(text)
            elseif level == RAW_PrintTypeWarning then
                Ext.Utils.PrintWarning(text)
            else
                Ext.Utils.Print(text)
            end
        else
            _D(text)
        end
    end
end
