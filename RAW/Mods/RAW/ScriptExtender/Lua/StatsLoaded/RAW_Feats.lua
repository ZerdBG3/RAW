local ENUM_RAW_Feats

---------------------------------------- STATS FUNCTION ----------------------------------------

function RAW_Feats()
    Ext.Utils.Print("\n====================================================================================================")
    Ext.Utils.Print(CentralizedString("Option: feats"))

    if not IsModOptionEnabled("feats") then
        Ext.Utils.Print(CentralizedString("Disabled!"))
        Ext.Utils.Print(CentralizedString("Skipping the Feats changes"))
        Ext.Utils.Print("====================================================================================================\n")
        return
    end

    Ext.Utils.Print(CentralizedString("Enabled!"))
    Ext.Utils.Print(CentralizedString("Starting the Feats changes"))

    RAW_ApplyStaticData(ENUM_RAW_Feats, RAW_PrintTable_Feats)

    Ext.Utils.Print("\n" .. CentralizedString("Finished the Feats changes"))
    Ext.Utils.Print("====================================================================================================\n")
end

---------------------------------------- MODELS ----------------------------------------

ENUM_RAW_Feats = {
    ["Feat"] = {
        ["3fe71254-d1b2-44c7-886c-927552fe5f2e"] = {
            ["PassivesAdded"] = {
                ["Type"] = "add",
                ["Value"] = "RAW_ShieldMaster_Shove",
            },
        },
    },
}
