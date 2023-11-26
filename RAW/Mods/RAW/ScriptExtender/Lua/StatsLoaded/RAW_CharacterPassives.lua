local ENUM_RAW_CharacterDefaultPassives

local function RAW_AddCharacterDefaultPassives(name)
    local char = Ext.Stats.Get(name)
    RAW_PrintIfDebug("\nCharacter: " .. char.Name, RAW_PrintTable_CharacterPassives)
    RAW_PrintIfDebug("\tAdding passive: " .. ENUM_RAW_CharacterDefaultPassives, RAW_PrintTable_CharacterPassives)
    char.Passives = ENUM_RAW_CharacterDefaultPassives .. ";" .. char.Passives
    RAW_PrintIfDebug("\tPassives: " .. char.Passives, RAW_PrintTable_CharacterPassives)
end

---------------------------------------- STATS FUNCTION ----------------------------------------

function RAW_CharacterPassives()
    RAW_PrintIfDebug("\n====================================================================================================", RAW_PrintTable_CharacterPassives)
    RAW_PrintIfDebug(CentralizedString("Starting the addition of Character Passives"), RAW_PrintTable_CharacterPassives)

    for _, name in pairs(Ext.Stats.GetStats("Character")) do
        RAW_AddCharacterDefaultPassives(name)
    end

    RAW_PrintIfDebug("\n" .. CentralizedString("Finished the addition of Character Passives"), RAW_PrintTable_CharacterPassives)
    RAW_PrintIfDebug("====================================================================================================\n", RAW_PrintTable_CharacterPassives)
end

---------------------------------------- MODELS ----------------------------------------

ENUM_RAW_CharacterDefaultPassives = "RAW_OnTurnTracker"
