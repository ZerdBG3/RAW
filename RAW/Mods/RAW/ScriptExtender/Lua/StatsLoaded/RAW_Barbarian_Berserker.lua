local ENUM_RAW_BarbarianBerserkerResources

---------------------------------------- STATS FUNCTION ----------------------------------------

function RAW_Barbarian_Berserker()
    Ext.Utils.Print("\n====================================================================================================")
    Ext.Utils.Print(CentralizedString("Option: barbarian_berserker"))

    if not IsModOptionEnabled("barbarian_berserker") then
        Ext.Utils.Print(CentralizedString("Disabled!"))
        Ext.Utils.Print(CentralizedString("Skipping the Barbarian (Berserker) Changes"))
        Ext.Utils.Print("====================================================================================================\n")
        return
    end

    Ext.Utils.Print(CentralizedString("Enabled!"))
    Ext.Utils.Print(CentralizedString("Starting the Barbarian (Berserker) Changes"))

    RAW_ApplyStaticData(ENUM_RAW_BarbarianBerserkerResources, RAW_PrintTable_Barbarian_Berserker)

    Ext.Utils.Print("\n" .. CentralizedString("Finished the Barbarian (Berserker) Changes"))
    Ext.Utils.Print("====================================================================================================\n")
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
