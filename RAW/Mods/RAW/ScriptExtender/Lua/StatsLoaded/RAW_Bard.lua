local modOption = "bard"
local debugLog = IsModOptionLogging(modOption)

local ENUM_RAW_BardResources

---------------------------------------- STATS FUNCTION ----------------------------------------

function RAW_Bard()
    RAW_PrintIfDebug("\n====================================================================================================", debugLog)
    RAW_PrintIfDebug(CentralizedString("Option: " .. modOption), debugLog)

    if not IsModOptionEnabled(modOption) then
        RAW_PrintIfDebug(CentralizedString("Disabled!"), debugLog)
        RAW_PrintIfDebug(CentralizedString("Skipping the Bard Changes"), debugLog)
        RAW_PrintIfDebug("====================================================================================================\n", debugLog)
        return
    end

    RAW_PrintIfDebug(CentralizedString("Enabled!"), debugLog)
    RAW_PrintIfDebug(CentralizedString("Starting the Bard Changes"), debugLog)

    RAW_ApplyStaticData(ENUM_RAW_BardResources, debugLog)

    RAW_PrintIfDebug("\n" .. CentralizedString("Finished the Bard Changes"), debugLog)
    RAW_PrintIfDebug("====================================================================================================\n", debugLog)
end

---------------------------------------- MODELS ----------------------------------------

ENUM_RAW_BardResources = {
    ["Progression"] = {
        -- Bard Level 2
        ["7a2f66b5-7555-49f2-833b-f3d79affc7ca"] = {
            ["AddSpells"] = {
                ["Type"] = "overwrite",
                ["Value"] = {},
            },
            ["PassivesAdded"] = {
                ["Type"] = "add",
                ["Value"] = "RAW_SongOfRest_6",
            },
        },
        -- Bard Level 9
        ["b1f811c8-4831-488a-bd1d-47e9883d2823"] = {
            ["PassivesAdded"] = {
                ["Type"] = "add",
                ["Value"] = "RAW_SongOfRest_8",
            },
            ["PassivesRemoved"] = {
                ["Type"] = "add",
                ["Value"] = "RAW_SongOfRest_6",
            },
        },
    },
}
