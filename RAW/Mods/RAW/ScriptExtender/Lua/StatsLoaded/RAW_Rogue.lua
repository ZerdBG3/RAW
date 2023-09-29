local ENUM_RAW_RogueResources

---------------------------------------- STATS FUNCTION ----------------------------------------

function RAW_Rogue()
    Ext.Utils.Print("\n====================================================================================================")
    Ext.Utils.Print(CentralizedString("Option: rogue"))

    if not IsModOptionEnabled("rogue") then
        Ext.Utils.Print(CentralizedString("Disabled!"))
        Ext.Utils.Print(CentralizedString("Skipping the Rogue Changes"))
        Ext.Utils.Print("====================================================================================================\n")
        return
    end

    Ext.Utils.Print(CentralizedString("Enabled!"))
    Ext.Utils.Print(CentralizedString("Starting the Rogue Changes"))

    RAW_ApplyStaticData(ENUM_RAW_RogueResources, RAW_PrintTable_Rogue)

    Ext.Utils.Print("\n" .. CentralizedString("Finished the Rogue Changes"))
    Ext.Utils.Print("====================================================================================================\n")
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
