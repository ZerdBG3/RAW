local debugLog = false

local ENUM_RAW_CharacterDefaultPassives

local function RAW_AddCharacterDefaultPassives(name)
    local char = Ext.Stats.Get(name)
    RAW_PrintIfDebug("\nCharacter: " .. char.Name, debugLog)
    RAW_PrintIfDebug("\tAdding passive: " .. ENUM_RAW_CharacterDefaultPassives, debugLog)
    char.Passives = ENUM_RAW_CharacterDefaultPassives .. ";" .. char.Passives
    RAW_PrintIfDebug("\tPassives: " .. char.Passives, debugLog)
end

---------------------------------------- STATS FUNCTION ----------------------------------------

function RAW_CharacterPassives()
    RAW_PrintIfDebug("\n====================================================================================================", debugLog)
    RAW_PrintIfDebug(CentralizedString("Starting the addition of Character Passives"), debugLog)

    for _, name in pairs(Ext.Stats.GetStats("Character")) do
        RAW_AddCharacterDefaultPassives(name)
    end

    RAW_PrintIfDebug("\n" .. CentralizedString("Finished the addition of Character Passives"), debugLog)
    RAW_PrintIfDebug("====================================================================================================\n", debugLog)
end

---------------------------------------- MODELS ----------------------------------------

ENUM_RAW_CharacterDefaultPassives = "RAW_OnTurnTracker"
