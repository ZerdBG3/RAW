local modOption = "defaultActions"
local debugLog = IsModOptionLogging(modOption)

local ENUM_RAW_WalkPassive

local function RAW_AddDefaultActionsPassives(name)
    local char = Ext.Stats.Get(name)
    if not RAW_CharIsHero(char) then
        return
    end

    RAW_PrintIfDebug("\nCharacter: " .. char.Name, debugLog)
    RAW_PrintIfDebug("\tAdding passive: " .. ENUM_RAW_WalkPassive, debugLog)
    char.Passives = ENUM_RAW_WalkPassive .. ";" .. char.Passives
    RAW_PrintIfDebug("\tPassives: " .. char.Passives, debugLog)
end

---------------------------------------- STATS FUNCTION ----------------------------------------

function RAW_DefaultActions()
    RAW_PrintIfDebug("\n====================================================================================================", debugLog)
    RAW_PrintIfDebug(CentralizedString("Option: " .. modOption), debugLog)

    if not IsModOptionEnabled(modOption) then
        RAW_PrintIfDebug(CentralizedString("Disabled!"), debugLog)
        RAW_PrintIfDebug(CentralizedString("Skipping the Default Actions changes"), debugLog)
        RAW_PrintIfDebug("====================================================================================================\n", debugLog)
        return
    end

    RAW_PrintIfDebug(CentralizedString("Enabled!"), debugLog)
    RAW_PrintIfDebug(CentralizedString("Starting the Default Actions changes"), debugLog)

    for _, name in pairs(Ext.Stats.GetStats("Character")) do
        RAW_AddDefaultActionsPassives(name)
    end

    RAW_PrintIfDebug("\n" .. CentralizedString("Finished the Default Actions changes"), debugLog)
    RAW_PrintIfDebug("====================================================================================================\n", debugLog)
end

---------------------------------------- MODELS ----------------------------------------

ENUM_RAW_WalkPassive = "RAW_Walk"
