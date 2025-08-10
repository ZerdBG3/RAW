local modOption = "monk"
local debugLog = IsModOptionLogging(modOption)

local ENUM_RAW_MonkResources

---------------------------------------- STATS FUNCTION ----------------------------------------

function RAW_Monk()
    RAW_PrintIfDebug("\n====================================================================================================", debugLog)
    RAW_PrintIfDebug(CentralizedString("Option: " .. modOption), debugLog)

    if not IsModOptionEnabled(modOption) then
        RAW_PrintIfDebug(CentralizedString("Disabled!"), debugLog)
        RAW_PrintIfDebug(CentralizedString("Skipping the Monk Changes"), debugLog)
        RAW_PrintIfDebug("====================================================================================================\n", debugLog)
        return
    end

    RAW_PrintIfDebug(CentralizedString("Enabled!"), debugLog)
    RAW_PrintIfDebug(CentralizedString("Starting the Monk Changes"), debugLog)

    RAW_ApplyStaticData(ENUM_RAW_MonkResources, debugLog)

    RAW_PrintIfDebug("\n" .. CentralizedString("Finished the Monk Changes"), debugLog)
    RAW_PrintIfDebug("====================================================================================================\n", debugLog)
end

---------------------------------------- MODELS ----------------------------------------

ENUM_RAW_MonkResources = {
    ["Progression"] = {
        -- Monk Level 1
        ["c091d27e-009b-4841-8bde-5e63e5ca8f4e"] = {
            ["Boosts"] = {
                ["Type"] = "remove",
                ["Value"] = "ActionResource(KiPoint,2,0)"
            },
            ["PassivesAdded"] = {
                ["Type"] = "remove",
                ["Value"] = "FlurryOfBlowsUnlock",
            },
        },
        -- Monk Multiclass Level 1
        ["297e0cb5-9743-4ae8-b053-b3850f0fa134"] = {
            ["Boosts"] = {
                ["Type"] = "remove",
                ["Value"] = "ActionResource(KiPoint,2,0)"
            },
            ["PassivesAdded"] = {
                ["Type"] = "remove",
                ["Value"] = "FlurryOfBlowsUnlock",
            },
        },
        -- Monk Level 2
        ["c17915f1-df2b-4cce-876f-68faf153f373"] = {
            ["Boosts"] = {
                ["Type"] = "overwrite",
                ["Value"] = "ActionResource(KiPoint,2,0)"
            },
            ["PassivesAdded"] = {
                ["Type"] = "add",
                ["Value"] = "FlurryOfBlowsUnlock",
            },
        },
        -- Monk Level 5
        ["7b354b75-537f-464e-a28d-cafa72323ab9"] = {
            ["PassivesAdded"] = {
                ["Type"] = "add",
                ["Value"] = "RAW_StunningStrike_Unlock",
            },
        },
    },
}
