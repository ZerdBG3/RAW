local modOption = "instantDeath"
local debugLog = IsModOptionLogging(modOption)

local function RAW_AddInstantDeathPassive(name)
    local char = Ext.Stats.Get(name)
    if RAW_CharIsHero(char) then
        RAW_PrintIfDebug("\nCharacter: " .. char.Name, debugLog)
        RAW_PrintIfDebug("\tAdding passive: RAW_InstantDeath", debugLog)
        char.Passives = "RAW_InstantDeath;" .. char.Passives
        RAW_PrintIfDebug("\tPassives: " .. char.Passives, debugLog)
    end
end

---------------------------------------- STATS FUNCTION ----------------------------------------

function RAW_InstantDeath()
    RAW_PrintIfDebug("\n====================================================================================================", debugLog)
    RAW_PrintIfDebug(CentralizedString("Option: " .. modOption), debugLog)

    if not IsModOptionEnabled(modOption) then
        RAW_PrintIfDebug(CentralizedString("Disabled!"), debugLog)
        RAW_PrintIfDebug(CentralizedString("Skipping the Instant Death Rules"), debugLog)
        RAW_PrintIfDebug("====================================================================================================\n", debugLog)
        return
    end

    RAW_PrintIfDebug(CentralizedString("Enabled!"), debugLog)
    RAW_PrintIfDebug(CentralizedString("Starting the addition of Instant Death Passives"), debugLog)

    for _, name in pairs(Ext.Stats.GetStats("Character")) do
        RAW_AddInstantDeathPassive(name)
    end

    RAW_PrintIfDebug("\n" .. CentralizedString("Finished the addition of Instant Death Passives"), debugLog)
    RAW_PrintIfDebug("====================================================================================================\n", debugLog)
end
