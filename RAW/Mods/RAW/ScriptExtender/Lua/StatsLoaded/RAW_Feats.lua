local modOption = "feats"
local debugLog = IsModOptionLogging(modOption)

local ENUM_RAW_Feats

---------------------------------------- STATS FUNCTION ----------------------------------------

function RAW_Feats()
    RAW_PrintIfDebug("\n====================================================================================================", debugLog)
    RAW_PrintIfDebug(CentralizedString("Option: " .. modOption), debugLog)

    if not IsModOptionEnabled(modOption) then
        RAW_PrintIfDebug(CentralizedString("Disabled!"), debugLog)
        RAW_PrintIfDebug(CentralizedString("Skipping the Feats changes"), debugLog)
        RAW_PrintIfDebug("====================================================================================================\n", debugLog)
        return
    end

    RAW_PrintIfDebug(CentralizedString("Enabled!"), debugLog)
    RAW_PrintIfDebug(CentralizedString("Starting the Feats changes"), debugLog)

    RAW_ApplyStaticData(ENUM_RAW_Feats, debugLog)

    RAW_PrintIfDebug("\n" .. CentralizedString("Finished the Feats changes"), debugLog)
    RAW_PrintIfDebug("====================================================================================================\n", debugLog)
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
