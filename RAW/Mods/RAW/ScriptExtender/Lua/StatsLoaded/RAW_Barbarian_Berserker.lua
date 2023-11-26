local ENUM_RAW_BarbarianBerserkerResources

---------------------------------------- STATS FUNCTION ----------------------------------------

function RAW_Barbarian_Berserker()
    RAW_PrintIfDebug("\n====================================================================================================", RAW_PrintTable_Barbarian_Berserker)
    RAW_PrintIfDebug(CentralizedString("Option: barbarian_berserker"), RAW_PrintTable_Barbarian_Berserker)

    if not IsModOptionEnabled("barbarian_berserker") then
        RAW_PrintIfDebug(CentralizedString("Disabled!"), RAW_PrintTable_Barbarian_Berserker)
        RAW_PrintIfDebug(CentralizedString("Skipping the Barbarian (Berserker) Changes"), RAW_PrintTable_Barbarian_Berserker)
        RAW_PrintIfDebug("====================================================================================================\n", RAW_PrintTable_Barbarian_Berserker)
        return
    end

    RAW_PrintIfDebug(CentralizedString("Enabled!"), RAW_PrintTable_Barbarian_Berserker)
    RAW_PrintIfDebug(CentralizedString("Starting the Barbarian (Berserker) Changes"), RAW_PrintTable_Barbarian_Berserker)

    RAW_ApplyStaticData(ENUM_RAW_BarbarianBerserkerResources, RAW_PrintTable_Barbarian_Berserker)

    RAW_PrintIfDebug("\n" .. CentralizedString("Finished the Barbarian (Berserker) Changes"), RAW_PrintTable_Barbarian_Berserker)
    RAW_PrintIfDebug("====================================================================================================\n", RAW_PrintTable_Barbarian_Berserker)
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
