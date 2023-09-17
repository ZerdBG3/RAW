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
    Ext.Utils.Print("\n======================================================================")
    Ext.Utils.Print(CentralizedString("Option: spells_duration"))

    if not IsModOptionEnabled("spells_duration") then
        Ext.Utils.Print(CentralizedString("Disabled!"))
        Ext.Utils.Print(CentralizedString("Skipping the application of Status Removal on Short Rest"))
        Ext.Utils.Print("======================================================================\n")
        return
    end

    Ext.Utils.Print(CentralizedString("Enabled!"))
    Ext.Utils.Print(CentralizedString("Starting the application of Status Removal on Short Rest"))

    for _, name in pairs(Ext.Stats.GetStats("Character")) do
        local char = Ext.Stats.Get(name)

        if RAW_CharIsHero(char) then
            RAW_PrintIfDebug("\nCharacter: " .. name, RAW_PrintTable_Spells_Duration)
            RAW_AddCharacterStatusRemovalPassives(char)
        end
    end

    Ext.Utils.Print("\n" .. CentralizedString("Finished the application of Status Removal on Short Rest"))
    Ext.Utils.Print("======================================================================\n")
end

---------------------------------------- MODELS ----------------------------------------

ENUM_RAW_Spells_Duration_Passives = {
    "RAW_RemoveStatusesOnShortRest",
}
