local modOption = "spells_duration"
local debugLog = IsModOptionLogging(modOption)

local ENUM_RAW_Spells_Duration_Passives

local function RAW_AddCharacterStatusRemovalPassives(char)
    for _, passive in pairs(ENUM_RAW_Spells_Duration_Passives) do
        RAW_PrintIfDebug("\tAdding passive: " .. passive, debugLog)
        char.Passives = passive .. ";" .. char.Passives
    end
    RAW_PrintIfDebug("\tPassives: " .. char.Passives, debugLog)
end

---------------------------------------- STATS FUNCTION ----------------------------------------

function RAW_Spells_Duration()
    RAW_PrintIfDebug("\n====================================================================================================", debugLog)
    RAW_PrintIfDebug(CentralizedString("Option: " .. modOption), debugLog)

    if not IsModOptionEnabled(modOption) then
        RAW_PrintIfDebug(CentralizedString("Disabled!"), debugLog)
        RAW_PrintIfDebug(CentralizedString("Skipping the application of Status Removal on Short Rest"), debugLog)
        RAW_PrintIfDebug("====================================================================================================\n", debugLog)
        return
    end

    RAW_PrintIfDebug(CentralizedString("Enabled!"), debugLog)
    RAW_PrintIfDebug(CentralizedString("Starting the application of Status Removal on Short Rest"), debugLog)

    for _, name in pairs(Ext.Stats.GetStats("Character")) do
        local char = Ext.Stats.Get(name)

        if RAW_CharIsHero(char) then
            RAW_PrintIfDebug("\nCharacter: " .. name, debugLog)
            RAW_AddCharacterStatusRemovalPassives(char)
        end
    end

    RAW_PrintIfDebug("\n" .. CentralizedString("Finished the application of Status Removal on Short Rest"), debugLog)
    RAW_PrintIfDebug("====================================================================================================\n", debugLog)
end

---------------------------------------- MODELS ----------------------------------------

ENUM_RAW_Spells_Duration_Passives = {
    "RAW_RemoveStatusesOnShortRest",
}
