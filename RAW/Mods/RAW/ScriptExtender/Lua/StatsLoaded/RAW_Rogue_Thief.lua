local ENUM_RAW_RogueThiefResources

---------------------------------------- STATS FUNCTION ----------------------------------------

function RAW_Rogue_Thief()
    RAW_PrintIfDebug("\n====================================================================================================", RAW_PrintTable_Rogue_Thief)
    RAW_PrintIfDebug(CentralizedString("Option: rogue_thief"), RAW_PrintTable_Rogue_Thief)

    if not IsModOptionEnabled("rogue_thief") then
        RAW_PrintIfDebug(CentralizedString("Disabled!"), RAW_PrintTable_Rogue_Thief)
        RAW_PrintIfDebug(CentralizedString("Skipping the Rogue (Thief) Changes"), RAW_PrintTable_Rogue_Thief)
        RAW_PrintIfDebug("====================================================================================================\n", RAW_PrintTable_Rogue_Thief)
        return
    end

    RAW_PrintIfDebug(CentralizedString("Enabled!"), RAW_PrintTable_Rogue_Thief)
    RAW_PrintIfDebug(CentralizedString("Starting the Rogue (Thief) Changes"), RAW_PrintTable_Rogue_Thief)

    RAW_ApplyStaticData(ENUM_RAW_RogueThiefResources, RAW_PrintTable_Rogue_Thief)

    RAW_PrintIfDebug("\n" .. CentralizedString("Finished the Rogue (Thief) Changes"), RAW_PrintTable_Rogue_Thief)
    RAW_PrintIfDebug("====================================================================================================\n", RAW_PrintTable_Rogue_Thief)
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
