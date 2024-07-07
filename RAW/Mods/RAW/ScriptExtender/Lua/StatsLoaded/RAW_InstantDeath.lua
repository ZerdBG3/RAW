local function RAW_AddInstantDeathPassive(name)
    local char = Ext.Stats.Get(name)
    if RAW_CharIsHero(char) then
        RAW_PrintIfDebug("\nCharacter: " .. char.Name, RAW_PrintTable_InstantDeath)
        RAW_PrintIfDebug("\tAdding passive: RAW_InstantDeath", RAW_PrintTable_InstantDeath)
        char.Passives = "RAW_InstantDeath;" .. char.Passives
        RAW_PrintIfDebug("\tPassives: " .. char.Passives, RAW_PrintTable_InstantDeath)
    end
end

---------------------------------------- STATS FUNCTION ----------------------------------------

function RAW_InstantDeath()
    RAW_PrintIfDebug("\n====================================================================================================", RAW_PrintTable_InstantDeath)
    RAW_PrintIfDebug(CentralizedString("Option: instantDeath"), RAW_PrintTable_InstantDeath)

    if not IsModOptionEnabled("instantDeath") then
        RAW_PrintIfDebug(CentralizedString("Disabled!"), RAW_PrintTable_InstantDeath)
        RAW_PrintIfDebug(CentralizedString("Skipping the Instant Death Rules"), RAW_PrintTable_InstantDeath)
        RAW_PrintIfDebug("====================================================================================================\n", RAW_PrintTable_InstantDeath)
        return
    end

    RAW_PrintIfDebug(CentralizedString("Enabled!"), RAW_PrintTable_InstantDeath)
    RAW_PrintIfDebug(CentralizedString("Starting the addition of Instant Death Passives"), RAW_PrintTable_InstantDeath)

    for _, name in pairs(Ext.Stats.GetStats("Character")) do
        RAW_AddInstantDeathPassive(name)
    end

    RAW_PrintIfDebug("\n" .. CentralizedString("Finished the addition of Instant Death Passives"), RAW_PrintTable_InstantDeath)
    RAW_PrintIfDebug("====================================================================================================\n", RAW_PrintTable_InstantDeath)
end
