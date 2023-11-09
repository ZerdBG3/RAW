local ENUM_RAW_LoadingPropertyPassive, ENUM_RAW_CrossbowExpert

local function RAW_AddLoadingPropertyPassive(name)
    local char = Ext.Stats.Get(name)
    if not RAW_CharIsHero(char) then
        return
    end

    RAW_PrintIfDebug("\nCharacter: " .. char.Name, RAW_PrintTable_ExtraAttack)
    RAW_PrintIfDebug("\tAdding passive: " .. ENUM_RAW_LoadingPropertyPassive, RAW_PrintTable_ExtraAttack)
    char.Passives = ENUM_RAW_LoadingPropertyPassive .. ";" .. char.Passives
    RAW_PrintIfDebug("\tPassives: " .. char.Passives, RAW_PrintTable_ExtraAttack)
end

---------------------------------------- STATS FUNCTION ----------------------------------------

function RAW_ExtraAttack()
    Ext.Utils.Print("\n====================================================================================================")
    Ext.Utils.Print(CentralizedString("Option: extraAttack"))

    if not IsModOptionEnabled("extraAttack") then
        Ext.Utils.Print(CentralizedString("Disabled!"))
        Ext.Utils.Print(CentralizedString("Skipping the Extra Attack changes"))
        Ext.Utils.Print("====================================================================================================\n")
        return
    end

    Ext.Utils.Print(CentralizedString("Enabled!"))
    Ext.Utils.Print(CentralizedString("Starting the Extra Attack changes"))

    for _, name in pairs(Ext.Stats.GetStats("Character")) do
        RAW_AddLoadingPropertyPassive(name)
    end

    RAW_ApplyStaticData(ENUM_RAW_CrossbowExpert, RAW_PrintTable_ExtraAttack)

    Ext.Utils.Print("\n" .. CentralizedString("Finished the Extra Attack changes"))
    Ext.Utils.Print("====================================================================================================\n")
end

---------------------------------------- MODELS ----------------------------------------

ENUM_RAW_LoadingPropertyPassive = "RAW_Loading_Block_ExtraAttack"

ENUM_RAW_CrossbowExpert = {
    ["FeatDescription"] = {
        ["0715b482-2377-4288-a2b3-9c818a1836b3"] = {
            ["Description"] = {
                ["Type"] = "overwrite",
                ["Value"] = {
                    ["Handle"] = {
                        ["Handle"] = "h15b473b7gf59dg40f4g9d6bg7015eb159089",
                        ["Version"] = 1,
                    },
                },
            },
        },
    },
}
