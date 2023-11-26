local ENUM_RAW_Feats

---------------------------------------- STATS FUNCTION ----------------------------------------

function RAW_Feats()
    RAW_PrintIfDebug("\n====================================================================================================", RAW_PrintTable_Feats)
    RAW_PrintIfDebug(CentralizedString("Option: feats"), RAW_PrintTable_Feats)

    if not IsModOptionEnabled("feats") then
        RAW_PrintIfDebug(CentralizedString("Disabled!"), RAW_PrintTable_Feats)
        RAW_PrintIfDebug(CentralizedString("Skipping the Feats changes"), RAW_PrintTable_Feats)
        RAW_PrintIfDebug("====================================================================================================\n", RAW_PrintTable_Feats)
        return
    end

    RAW_PrintIfDebug(CentralizedString("Enabled!"), RAW_PrintTable_Feats)
    RAW_PrintIfDebug(CentralizedString("Starting the Feats changes"), RAW_PrintTable_Feats)

    RAW_ApplyStaticData(ENUM_RAW_Feats, RAW_PrintTable_Feats)

    RAW_PrintIfDebug("\n" .. CentralizedString("Finished the Feats changes"), RAW_PrintTable_Feats)
    RAW_PrintIfDebug("====================================================================================================\n", RAW_PrintTable_Feats)
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
