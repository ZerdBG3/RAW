local ENUM_RAW_RogueResources

---------------------------------------- STATS FUNCTION ----------------------------------------

function RAW_Rogue()
    Ext.Utils.Print("\n======================================================================")
    Ext.Utils.Print(CentralizedString("Option: rogue"))

    if not IsModOptionEnabled("rogue") then
        Ext.Utils.Print(CentralizedString("Disabled!"))
        Ext.Utils.Print(CentralizedString("Skipping the Rogue Changes"))
        Ext.Utils.Print("======================================================================\n")
        return
    end

    Ext.Utils.Print(CentralizedString("Enabled!"))
    Ext.Utils.Print(CentralizedString("Starting the Rogue Changes"))

    RAW_ApplyStaticData(ENUM_RAW_RogueResources, RAW_PrintTable_Rogue)

    Ext.Utils.Print("\n" .. CentralizedString("Finished the Rogue Changes"))
    Ext.Utils.Print("======================================================================\n")
end

---------------------------------------- MODELS ----------------------------------------

ENUM_RAW_RogueResources = {
    ["Progression"] = {
        ["35863719-e935-4757-a9f3-eb38a8cd8cb7"] = {
            ["PassivesAdded"] = {
                ["Type"] = "add",
                ["Value"] = "RAW_CunningAction",
            },
            -- ["AddSpells"] = {
            --     ["Type"] = "overwrite",
            --     ["Value"] = {
            --         {
            --             ["Ability"] = "None",
            --             ["CooldownType"] = "Default",
            --             ["PrepareType"] = "Unknown",
            --             ["SpellUUID"] = "fd443792-81a4-4e1c-adbd-efb7ef871651",
            --             ["field_10"] = " ",
            --             ["field_30"] = "d136c5d9-0ff0-43da-acce-a74a07f8d6bf",
            --             ["field_48"] = "00000000-0000-0000-0000-000000000000",
            --         },
            --     },
            -- },
        },
    },
    -- ["SpellList"] = {
    --     ["2dc120ff-903b-494b-8dc8-38721098ce38"] = {
    --         ["Spells"] = {
    --             ["Type"] = "overwrite",
    --             ["Value"] = {
    --                 ["0"] = "RAW_Shout_CunningAction",
    --             },
    --         },
    --     },
    -- },
}
