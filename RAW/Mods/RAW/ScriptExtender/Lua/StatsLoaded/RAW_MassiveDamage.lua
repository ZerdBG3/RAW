local function RAW_AddMassiveDamagePassive(name)
    local char = Ext.Stats.Get(name)
    if RAW_CharIsHero(char) then
        RAW_PrintIfDebug("\nCharacter: " .. char.Name, RAW_PrintTable_MassiveDamage)
        RAW_PrintIfDebug("\tAdding passive: RAW_MassiveDamage", RAW_PrintTable_MassiveDamage)
        char.Passives = "RAW_MassiveDamage;" .. char.Passives
        RAW_PrintIfDebug("\tPassives: " .. char.Passives, RAW_PrintTable_MassiveDamage)
    end
end

---------------------------------------- STATS FUNCTION ----------------------------------------

function RAW_MassiveDamage()
    RAW_PrintIfDebug("\n====================================================================================================", RAW_PrintTable_MassiveDamage)
    RAW_PrintIfDebug(CentralizedString("Option: massiveDamage"), RAW_PrintTable_MassiveDamage)

    if not IsModOptionEnabled("massiveDamage") then
        RAW_PrintIfDebug(CentralizedString("Disabled!"), RAW_PrintTable_MassiveDamage)
        RAW_PrintIfDebug(CentralizedString("Skipping the Massive Damage Rules"), RAW_PrintTable_MassiveDamage)
        RAW_PrintIfDebug("====================================================================================================\n", RAW_PrintTable_MassiveDamage)
        return
    end

    RAW_PrintIfDebug(CentralizedString("Enabled!"), RAW_PrintTable_MassiveDamage)
    RAW_PrintIfDebug(CentralizedString("Starting the addition of Massive Damage Passives"), RAW_PrintTable_MassiveDamage)

    for _, name in pairs(Ext.Stats.GetStats("Character")) do
        RAW_AddMassiveDamagePassive(name)
    end

    RAW_PrintIfDebug("\n" .. CentralizedString("Finished the addition of Massive Damage Passives"), RAW_PrintTable_MassiveDamage)
    RAW_PrintIfDebug("====================================================================================================\n", RAW_PrintTable_MassiveDamage)
end
