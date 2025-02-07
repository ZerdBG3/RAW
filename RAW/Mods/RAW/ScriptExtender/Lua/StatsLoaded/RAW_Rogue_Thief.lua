local modOption = "rogue_thief"
local debugLog = IsModOptionLogging(modOption)

local ENUM_RAW_RogueThiefResources

---------------------------------------- STATS FUNCTION ----------------------------------------

function RAW_Rogue_Thief()
    RAW_PrintIfDebug("\n====================================================================================================", debugLog)
    RAW_PrintIfDebug(CentralizedString("Option: " .. modOption), debugLog)

    if not IsModOptionEnabled(modOption) then
        RAW_PrintIfDebug(CentralizedString("Disabled!"), debugLog)
        RAW_PrintIfDebug(CentralizedString("Skipping the Rogue (Thief) Changes"), debugLog)
        RAW_PrintIfDebug("====================================================================================================\n", debugLog)
        return
    end

    RAW_PrintIfDebug(CentralizedString("Enabled!"), debugLog)
    RAW_PrintIfDebug(CentralizedString("Starting the Rogue (Thief) Changes"), debugLog)

    RAW_ApplyStaticData(ENUM_RAW_RogueThiefResources, debugLog)

    RAW_PrintIfDebug("\n" .. CentralizedString("Finished the Rogue (Thief) Changes"), debugLog)
    RAW_PrintIfDebug("====================================================================================================\n", debugLog)
end

---------------------------------------- MODELS ----------------------------------------

ENUM_RAW_RogueThiefResources = {
    ["Progression"] = {
        -- Thief Level 3
        ["3f95146b-90bc-4064-b3e0-4e1e751cd08d"] = {
            ["AddSpells"] = {
                ["Type"] = "add",
                ["Value"] = {
                    {
                        ["Ability"] = "None",
                        ["ActionResource"] = "d136c5d9-0ff0-43da-acce-a74a07f8d6bf",
                        ["ClassUUID"] = "00000000-0000-0000-0000-000000000000",
                        ["CooldownType"] = "Default",
                        ["PrepareType"] = "Unknown",
                        ["SelectorId"] = " ",
                        ["SpellUUID"] = "de819b48-ba8a-4e9b-a3bb-554863b8fe66",
                    },
                },
            },
            ["PassivesRemoved"] = {
                ["Type"] = "add",
                ["Value"] = "RAW_CunningAction",
            },
        },
    },
}
