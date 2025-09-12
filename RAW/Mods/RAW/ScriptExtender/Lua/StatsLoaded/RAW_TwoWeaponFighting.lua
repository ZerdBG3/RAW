local modOption = "twoWeaponFighting"
local debugLog = IsModOptionLogging(modOption)

local ENUM_RAW_OffHandPassive

local function RAW_AddOffhandPassive(name)
    local char = Ext.Stats.Get(name)

    RAW_PrintIfDebug("\nCharacter: " .. char.Name, debugLog)
    RAW_PrintIfDebug("\tAdding passive: " .. ENUM_RAW_OffHandPassive, debugLog)
    char.Passives = ENUM_RAW_OffHandPassive .. ";" .. char.Passives
    RAW_PrintIfDebug("\tPassives: " .. char.Passives, debugLog)
end

---------------------------------------- STATS FUNCTION ----------------------------------------

function RAW_TwoWeaponFighting()
    RAW_PrintIfDebug("\n====================================================================================================", debugLog)
    RAW_PrintIfDebug(CentralizedString("Option: " .. modOption), debugLog)

    if not IsModOptionEnabled(modOption) then
        RAW_PrintIfDebug(CentralizedString("Disabled!"), debugLog)
        RAW_PrintIfDebug(CentralizedString("Skipping the Two Weapon Fighting changes"), debugLog)
        RAW_PrintIfDebug("====================================================================================================\n", debugLog)
        return
    end

    RAW_PrintIfDebug(CentralizedString("Enabled!"), debugLog)
    RAW_PrintIfDebug(CentralizedString("Starting the Two Weapon Fighting changes"), debugLog)

    for _, name in pairs(Ext.Stats.GetStats("Character")) do
        RAW_AddOffhandPassive(name)
    end

    RAW_PrintIfDebug("\n" .. CentralizedString("Finished the Two Weapon Fighting changes"), debugLog)
    RAW_PrintIfDebug("====================================================================================================\n", debugLog)
end

---------------------------------------- MODELS ----------------------------------------

ENUM_RAW_OffHandPassive = "RAW_OffHand_Enabler"
