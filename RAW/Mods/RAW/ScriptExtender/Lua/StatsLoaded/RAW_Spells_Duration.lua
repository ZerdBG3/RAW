local ENUM_RAW_Spells_Duration_Passives

local function RAW_AddCharacterStatusRemovalPassives(char)
    for _, passive in pairs(ENUM_RAW_Spells_Duration_Passives) do
        RAW_PrintIfDebug("\tAdding passive: " .. passive, RAW_PrintTable_Spells_Duration)
        char.Passives = passive .. ";" .. char.Passives
    end
    RAW_PrintIfDebug("\tPassives: " .. char.Passives, RAW_PrintTable_Spells_Duration)
end

---------------------------------------- STATS FUNCTION ----------------------------------------

function RAW_Spells_Duration()
    RAW_PrintIfDebug("\n====================================================================================================", RAW_PrintTable_Spells_Duration)
    RAW_PrintIfDebug(CentralizedString("Option: spells_duration"), RAW_PrintTable_Spells_Duration)

    if not IsModOptionEnabled("spells_duration") then
        RAW_PrintIfDebug(CentralizedString("Disabled!"), RAW_PrintTable_Spells_Duration)
        RAW_PrintIfDebug(CentralizedString("Skipping the application of Status Removal on Short Rest"), RAW_PrintTable_Spells_Duration)
        RAW_PrintIfDebug("====================================================================================================\n", RAW_PrintTable_Spells_Duration)
        return
    end

    RAW_PrintIfDebug(CentralizedString("Enabled!"), RAW_PrintTable_Spells_Duration)
    RAW_PrintIfDebug(CentralizedString("Starting the application of Status Removal on Short Rest"), RAW_PrintTable_Spells_Duration)

    for _, name in pairs(Ext.Stats.GetStats("Character")) do
        local char = Ext.Stats.Get(name)

        if RAW_CharIsHero(char) then
            RAW_PrintIfDebug("\nCharacter: " .. name, RAW_PrintTable_Spells_Duration)
            RAW_AddCharacterStatusRemovalPassives(char)
        end
    end

    RAW_PrintIfDebug("\n" .. CentralizedString("Finished the application of Status Removal on Short Rest"), RAW_PrintTable_Spells_Duration)
    RAW_PrintIfDebug("====================================================================================================\n", RAW_PrintTable_Spells_Duration)
end

---------------------------------------- MODELS ----------------------------------------

ENUM_RAW_Spells_Duration_Passives = {
    "RAW_RemoveStatusesOnShortRest",
}
