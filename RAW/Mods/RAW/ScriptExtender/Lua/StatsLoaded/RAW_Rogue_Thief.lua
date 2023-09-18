local ENUM_RAW_RogueThiefResources

---------------------------------------- STATS FUNCTION ----------------------------------------

function RAW_Rogue_Thief()
    Ext.Utils.Print("\n====================================================================================================")
    Ext.Utils.Print(CentralizedString("Option: rogue_thief"))

    if not IsModOptionEnabled("rogue_thief") then
        Ext.Utils.Print(CentralizedString("Disabled!"))
        Ext.Utils.Print(CentralizedString("Skipping the Rogue (Thief) Changes"))
        Ext.Utils.Print("====================================================================================================\n")
        return
    end

    Ext.Utils.Print(CentralizedString("Enabled!"))
    Ext.Utils.Print(CentralizedString("Starting the Rogue (Thief) Changes"))

    RAW_ApplyStaticData(ENUM_RAW_RogueThiefResources, RAW_PrintTable_Rogue_Thief)

    Ext.Utils.Print("\n" .. CentralizedString("Finished the Rogue (Thief) Changes"))
    Ext.Utils.Print("====================================================================================================\n")
end

---------------------------------------- MODELS ----------------------------------------

ENUM_RAW_RogueThiefResources = {
    ["Progression"] = {
        ["3f95146b-90bc-4064-b3e0-4e1e751cd08d"] = {
            ["AddSpells"] = {
                ["Type"] = "add",
                ["Value"] = {
                    {
                        ["Ability"] = "None",
                        ["CooldownType"] = "Default",
                        ["PrepareType"] = "Unknown",
                        ["SpellUUID"] = "de819b48-ba8a-4e9b-a3bb-554863b8fe66",
                        ["field_10"] = " ",
                        ["field_30"] = "d136c5d9-0ff0-43da-acce-a74a07f8d6bf",
                        ["field_48"] = "00000000-0000-0000-0000-000000000000",
                    },
                },
            },
        },
    },
}
