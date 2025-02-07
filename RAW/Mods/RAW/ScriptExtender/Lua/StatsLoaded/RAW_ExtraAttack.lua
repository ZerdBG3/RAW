local modOption = "extraAttack"
local debugLog = IsModOptionLogging(modOption)

local ENUM_RAW_LoadingPropertyPassive, ENUM_RAW_CrossbowExpert

local function RAW_AddLoadingPropertyPassive(name)
    local char = Ext.Stats.Get(name)
    if not RAW_CharIsHero(char) then
        return
    end

    RAW_PrintIfDebug("\nCharacter: " .. char.Name, debugLog)
    RAW_PrintIfDebug("\tAdding passive: " .. ENUM_RAW_LoadingPropertyPassive, debugLog)
    char.Passives = ENUM_RAW_LoadingPropertyPassive .. ";" .. char.Passives
    RAW_PrintIfDebug("\tPassives: " .. char.Passives, debugLog)
end

---------------------------------------- STATS FUNCTION ----------------------------------------

function RAW_ExtraAttack()
    RAW_PrintIfDebug("\n====================================================================================================", debugLog)
    RAW_PrintIfDebug(CentralizedString("Option: " .. modOption), debugLog)

    if not IsModOptionEnabled(modOption) then
        RAW_PrintIfDebug(CentralizedString("Disabled!"), debugLog)
        RAW_PrintIfDebug(CentralizedString("Skipping the Extra Attack changes"), debugLog)
        RAW_PrintIfDebug("====================================================================================================\n", debugLog)
        return
    end

    RAW_PrintIfDebug(CentralizedString("Enabled!"), debugLog)
    RAW_PrintIfDebug(CentralizedString("Starting the Extra Attack changes"), debugLog)

    for _, name in pairs(Ext.Stats.GetStats("Character")) do
        RAW_AddLoadingPropertyPassive(name)
    end

    RAW_ApplyStaticData(ENUM_RAW_CrossbowExpert, debugLog)

    RAW_PrintIfDebug("\n" .. CentralizedString("Finished the Extra Attack changes"), debugLog)
    RAW_PrintIfDebug("====================================================================================================\n", debugLog)
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
