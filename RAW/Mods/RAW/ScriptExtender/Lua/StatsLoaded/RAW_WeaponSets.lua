local modOption = "weaponSets"
local debugLog = IsModOptionLogging(modOption)

local ENUM_RAW_WeaponSetsPassive = "RAW_WeaponSets_UnlockSpells"

local function RAW_AddWeaponSetsPassive(name)
    local char = Ext.Stats.Get(name)
    if not RAW_CharIsHero(char) then
        return
    end

    RAW_PrintIfDebug("\nCharacter: " .. name, debugLog)
    RAW_PrintIfDebug("\tAdding passive: " .. ENUM_RAW_WeaponSetsPassive, debugLog)
    char.Passives = ENUM_RAW_WeaponSetsPassive .. ";" .. char.Passives
    RAW_PrintIfDebug("\tPassives: " .. char.Passives, debugLog)
end

---------------------------------------- STATS FUNCTION ----------------------------------------

function RAW_WeaponSets_Passive()
    RAW_PrintIfDebug("\n====================================================================================================", debugLog)
    RAW_PrintIfDebug(CentralizedString("Option: " .. modOption), debugLog)

    if not IsModOptionEnabled(modOption) then
        RAW_PrintIfDebug(CentralizedString("Disabled!"), debugLog)
        RAW_PrintIfDebug(CentralizedString("Skipping the addition of default weapon attacks"), debugLog)
        RAW_PrintIfDebug("====================================================================================================\n", debugLog)
        return
    end

    RAW_PrintIfDebug(CentralizedString("Enabled!"), debugLog)
    RAW_PrintIfDebug(CentralizedString("Starting the addition of default weapon attacks"), debugLog)

    for _, name in pairs(Ext.Stats.GetStats("Character")) do
        RAW_AddWeaponSetsPassive(name)
    end

    RAW_PrintIfDebug("\n" .. CentralizedString("Finished the addition of default weapon attacks"), debugLog)
    RAW_PrintIfDebug("====================================================================================================\n", debugLog)
end
