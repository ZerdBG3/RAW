local ENUM_RAW_WalkPassive

local function RAW_AddDefaultActionsPassives(name)
    local char = Ext.Stats.Get(name)
    if not RAW_CharIsHero(char) then
        return
    end

    RAW_PrintIfDebug("\nCharacter: " .. char.Name, RAW_PrintTable_DefaultActions)
    RAW_PrintIfDebug("\tAdding passive: " .. ENUM_RAW_WalkPassive, RAW_PrintTable_DefaultActions)
    char.Passives = ENUM_RAW_WalkPassive .. ";" .. char.Passives
    RAW_PrintIfDebug("\tPassives: " .. char.Passives, RAW_PrintTable_DefaultActions)
end

---------------------------------------- STATS FUNCTION ----------------------------------------

function RAW_DefaultActions()
    RAW_PrintIfDebug("\n====================================================================================================", RAW_PrintTable_DefaultActions)
    RAW_PrintIfDebug(CentralizedString("Option: defaultActions"), RAW_PrintTable_DefaultActions)

    if not IsModOptionEnabled("defaultActions") then
        RAW_PrintIfDebug(CentralizedString("Disabled!"), RAW_PrintTable_DefaultActions)
        RAW_PrintIfDebug(CentralizedString("Skipping the Default Actions changes"), RAW_PrintTable_DefaultActions)
        RAW_PrintIfDebug("====================================================================================================\n", RAW_PrintTable_DefaultActions)
        return
    end

    RAW_PrintIfDebug(CentralizedString("Enabled!"), RAW_PrintTable_DefaultActions)
    RAW_PrintIfDebug(CentralizedString("Starting the Default Actions changes"), RAW_PrintTable_DefaultActions)

    for _, name in pairs(Ext.Stats.GetStats("Character")) do
        RAW_AddDefaultActionsPassives(name)
    end

    RAW_PrintIfDebug("\n" .. CentralizedString("Finished the Default Actions changes"), RAW_PrintTable_DefaultActions)
    RAW_PrintIfDebug("====================================================================================================\n", RAW_PrintTable_DefaultActions)
end

---------------------------------------- MODELS ----------------------------------------

ENUM_RAW_WalkPassive = "RAW_Walk"
