-- -----------------------------------------------------------
-- ------------------ Data Structures ------------------------
-- -----------------------------------------------------------

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

-- Merges two Sets
function RAW_Set_Union(set, set2)
    for elem in pairs(set2) do
        RAW_Set_Add(set, elem)
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

-- ---------------------------------------------------------
-- ------------------ Text Helpers -------------------------
-- ---------------------------------------------------------

function CentralizedString(text, width)
    width = width or 100
    local spaces = (width - string.len(text))//2
    return string.rep(" ", spaces) .. text
end

RAW_ColorTextCode_Red = "31"
RAW_ColorTextCode_Green = "32"
RAW_ColorTextCode_Yellow = "33"
RAW_ColorTextCode_Magenta = "35"
RAW_ColorTextCode_Blue = "36"
RAW_ColorTextCode_White = "37"

function RAW_ColoredText(text, colorCode)
    return "\27[" .. colorCode .. "m" .. text .. "\27[0m"
end

-- Print only if the value is set (not commented) on the table
RAW_PrintTable_ModOptions = 0
RAW_PrintTable_Attunement = 1
RAW_PrintTable_Barbarian_Berserker = 2
RAW_PrintTable_CantripsScaling = 3
RAW_PrintTable_CharacterPassives = 4
RAW_PrintTable_Concentration = 5
RAW_PrintTable_DefaultActions = 6
RAW_PrintTable_ExtraAttack = 7
RAW_PrintTable_Feats = 8
RAW_PrintTable_FreeWeaponEquip = 9
RAW_PrintTable_InstantDeath = 10
RAW_PrintTable_Invisible = 11
RAW_PrintTable_Rogue = 12
RAW_PrintTable_Rogue_Thief = 13
RAW_PrintTable_SkillCheck_CritFail = 14
RAW_PrintTable_Spells_BonusAction = 15
RAW_PrintTable_Spells_Duration = 16
RAW_PrintTable_TwoWeaponFighting = 17
RAW_PrintTable_WeaponSets = 18
RAW_PrintTable_WeaponSpells = 19

local ENUM_RAW_PrintTable = RAW_Set {
    RAW_PrintTable_ModOptions,
    -- RAW_PrintTable_Attunement,
    -- RAW_PrintTable_Barbarian_Berserker,
    -- RAW_PrintTable_CantripsScaling,
    -- RAW_PrintTable_CharacterPassives,
    -- RAW_PrintTable_Concentration,
    -- RAW_PrintTable_DefaultActions,
    -- RAW_PrintTable_ExtraAttack,
    -- RAW_PrintTable_Feats,
    -- RAW_PrintTable_FreeWeaponEquip,
    -- RAW_PrintTable_InstantDeath,
    -- RAW_PrintTable_Invisible,
    -- RAW_PrintTable_Rogue,
    -- RAW_PrintTable_Rogue_Thief,
    -- RAW_PrintTable_SkillCheck_CritFail,
    -- RAW_PrintTable_Spells_BonusAction,
    -- RAW_PrintTable_Spells_Duration,
    -- RAW_PrintTable_TwoWeaponFighting,
    -- RAW_PrintTable_WeaponSets,
    -- RAW_PrintTable_WeaponSpells,
}

RAW_PrintTypeInfo = "info"
RAW_PrintTypeWarning = "warning"
RAW_PrintTypeError = "error"

function RAW_PrintIfDebug(text, debug, level)
    if (type(debug) == "boolean" and debug) or ENUM_RAW_PrintTable[debug] then
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

-- ----------------------------------------------------------------
-- ---------------- Vanilla Stats Inheritance ---------------------
-- ----------------------------------------------------------------

-- Loads text files from Vanilla folders and registers their original "using" inheritance tree

local RAW_VanillaFoldersToLoad = {
    "Shared",
    "SharedDev",
    "Gustav",
    "GustavDev"
}
local RAW_VanillaFilesToLoad = {
    "Spell_Projectile.txt",
    "Spell_Shout.txt",
    "Spell_Target.txt",
    "Spell_Throw.txt"
}
local RAW_VanillaStatParents = {}

local function RAW_ParseVanillaStatFileParents(path)
    local ok, file = pcall(Ext.IO.LoadFile, path, "data")
    if not ok or not file then
        RAW_PrintIfDebug("Couldn't find file " .. path, RAW_PrintTable_ModOptions, RAW_PrintTypeError)
        return
    end

    local entry = nil
    for line in string.gmatch(file, "([^\r\n]+)\r*\n") do
        local newEntry = string.match(line, "%s*new%s+entry%s+\"([^\"]+)\"")
        if newEntry ~= nil then
            entry = newEntry
            RAW_VanillaStatParents[entry] = ""
        else
            local using = string.match(line, "%s*using%s+\"([^\"]+)\"")
            if using ~= nil then
                if entry ~= nil and using ~= "" and RAW_VanillaStatParents[entry] == "" then
                    RAW_VanillaStatParents[entry] = using
                else
                    RAW_PrintIfDebug("Invalid stat file configuration at " .. path, RAW_PrintTable_ModOptions, RAW_PrintTypeError)
                end
            end
        end
    end
end

function RAW_LoadVanillaStatFileParents()
    for _, folder in pairs(RAW_VanillaFoldersToLoad) do
        for _, file in pairs(RAW_VanillaFilesToLoad) do
            local path = "Public/" .. folder .. "/Stats/Generated/Data/" .. file
            RAW_ParseVanillaStatFileParents(path)
        end
    end
end

-- With the original "using" inheritance from Vanilla, it's possible to check the original parent
--   before any mod change that might use self-inheritance
function RAW_GetOriginalParent(stat)
    local vanillaParent = RAW_VanillaStatParents[stat.Name]
    if vanillaParent ~= nil then
        return vanillaParent
    end

    if stat.Using ~= nil and stat.Using ~= "" then
        return stat.Using
    end

    return ""
end

-- ----------------------------------------------------------
-- -------------------- Data Helpers ------------------------
-- ----------------------------------------------------------

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

-- Checks if the character stat object is _Hero or inherits it
function RAW_CharIsHero(char)
    return char ~= nil and string.find(char.Passives, "WeaponThrow") and string.find(char.Passives, "CombatStartAttack")
end

-- ----------------------------------------------------------
-- ------------- Static Data Helpers ------------------------
-- ----------------------------------------------------------

function RAW_ApplyStaticData(defTable, printDebug)
    for defType, defList in pairs(defTable) do
        for guid, changes in pairs (defList) do
            local resource = Ext.StaticData.Get(guid, defType)
            RAW_PrintIfDebug("\n" .. defType .. ": " .. guid, printDebug)
            for attribute, replacement in pairs(changes) do
                local newValue
                if type(resource[attribute]) == "string" then
                    if replacement.Type == "add" then
                        RAW_PrintIfDebug("\tAdding to " .. attribute .. " - " .. replacement.Value, printDebug)
                        newValue = replacement.Value .. ";" .. resource[attribute]
                    elseif replacement.Type == "overwrite" then
                        RAW_PrintIfDebug("\tOverwriting " .. attribute .. " - " .. replacement.Value, printDebug)
                        newValue = replacement.Value
                    end
                    resource[attribute] = newValue
                elseif type(resource[attribute]) == "userdata"  then
                    if replacement.Type == "add" then
                        RAW_PrintIfDebug("\tAdding to " .. attribute .. " userdata", printDebug)
                        newValue = Ext.Types.Serialize(resource[attribute])
                        for _, value in pairs(replacement.Value) do
                            table.insert(newValue, value)
                        end
                    elseif replacement.Type == "overwrite" then
                        RAW_PrintIfDebug("\tOverwriting " .. attribute .. " userdata", printDebug)
                        newValue = replacement.Value
                    end
                    Ext.Types.Unserialize(resource[attribute], newValue)
                else
                    RAW_PrintIfDebug("StaticData Type not mapped: " .. attribute .. " - " .. type(resource[attribute]), printDebug, RAW_PrintTypeError)
                end
            end
            RAW_PrintIfDebug(resource, printDebug)
        end
    end
end

-- ----------------------------------------------------------
-- ------------------ Type Helpers --------------------------
-- ----------------------------------------------------------

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
