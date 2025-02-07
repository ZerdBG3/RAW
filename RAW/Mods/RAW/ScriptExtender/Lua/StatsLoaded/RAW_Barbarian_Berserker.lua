local modOption = "barbarian_berserker"
local debugLog = IsModOptionLogging(modOption)

local ENUM_RAW_BarbarianBerserkerResources

---------------------------------------- STATS FUNCTION ----------------------------------------

function RAW_Barbarian_Berserker()
    RAW_PrintIfDebug("\n====================================================================================================", debugLog)
    RAW_PrintIfDebug(CentralizedString("Option: " .. modOption), debugLog)

    if not IsModOptionEnabled(modOption) then
        RAW_PrintIfDebug(CentralizedString("Disabled!"), debugLog)
        RAW_PrintIfDebug(CentralizedString("Skipping the Barbarian (Berserker) Changes"), debugLog)
        RAW_PrintIfDebug("====================================================================================================\n", debugLog)
        return
    end

    RAW_PrintIfDebug(CentralizedString("Enabled!"), debugLog)
    RAW_PrintIfDebug(CentralizedString("Starting the Barbarian (Berserker) Changes"), debugLog)

    RAW_ApplyStaticData(ENUM_RAW_BarbarianBerserkerResources, debugLog)

    RAW_PrintIfDebug("\n" .. CentralizedString("Finished the Barbarian (Berserker) Changes"), debugLog)
    RAW_PrintIfDebug("====================================================================================================\n", debugLog)
end

---------------------------------------- MODELS ----------------------------------------

ENUM_RAW_BarbarianBerserkerResources = {
    ["SpellList"] = {
        -- Frenzy
        ["17803035-4762-4143-8f2f-1143d47e4f40"] = {
            ["Spells"] = {
                ["Type"] = "overwrite",
                ["Value"] = {
                    "Target_FrenziedStrike",
                },
            },
        },
    },
}
