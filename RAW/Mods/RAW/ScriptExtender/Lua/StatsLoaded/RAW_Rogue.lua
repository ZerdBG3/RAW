local modOption = "rogue"
local debugLog = IsModOptionLogging(modOption)

local ENUM_RAW_RogueResources

---------------------------------------- STATS FUNCTION ----------------------------------------

function RAW_Rogue()
    RAW_PrintIfDebug("\n====================================================================================================", debugLog)
    RAW_PrintIfDebug(CentralizedString("Option: " .. modOption), debugLog)

    if not IsModOptionEnabled(modOption) then
        RAW_PrintIfDebug(CentralizedString("Disabled!"), debugLog)
        RAW_PrintIfDebug(CentralizedString("Skipping the Rogue Changes"), debugLog)
        RAW_PrintIfDebug("====================================================================================================\n", debugLog)
        return
    end

    RAW_PrintIfDebug(CentralizedString("Enabled!"), debugLog)
    RAW_PrintIfDebug(CentralizedString("Starting the Rogue Changes"), debugLog)

    RAW_ApplyStaticData(ENUM_RAW_RogueResources, debugLog)

    RAW_PrintIfDebug("\n" .. CentralizedString("Finished the Rogue Changes"), debugLog)
    RAW_PrintIfDebug("====================================================================================================\n", debugLog)
end

---------------------------------------- MODELS ----------------------------------------

ENUM_RAW_RogueResources = {
    ["Progression"] = {
        -- Rogue Level 2
        ["35863719-e935-4757-a9f3-eb38a8cd8cb7"] = {
            ["PassivesAdded"] = {
                ["Type"] = "add",
                ["Value"] = "RAW_CunningAction",
            },
        },
    },
    ["SpellList"] = {
        -- Cunning Action
        ["2dc120ff-903b-494b-8dc8-38721098ce38"] = {
            ["Spells"] = {
                ["Type"] = "overwrite",
                ["Value"] = {
                    "RAW_Shout_CunningAction",
                },
            },
        },
    },
}
