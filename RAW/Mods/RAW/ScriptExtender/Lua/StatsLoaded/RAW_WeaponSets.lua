local ENUM_RAW_WeaponSetsPassive = "RAW_WeaponSets_UnlockSpells"

local function RAW_AddWeaponSetsPassive(name)
    local char = Ext.Stats.Get(name)
    if not RAW_CharIsHero(char) then
        return
    end

    RAW_PrintIfDebug("\nCharacter: " .. name, RAW_PrintTable_WeaponSets)
    RAW_PrintIfDebug("\tAdding passive: " .. ENUM_RAW_WeaponSetsPassive, RAW_PrintTable_WeaponSets)
    char.Passives = ENUM_RAW_WeaponSetsPassive .. ";" .. char.Passives
    RAW_PrintIfDebug("\tPassives: " .. char.Passives, RAW_PrintTable_WeaponSets)
end

---------------------------------------- STATS FUNCTION ----------------------------------------

function RAW_WeaponSets_Passive()
    RAW_PrintIfDebug("\n====================================================================================================", RAW_PrintTable_WeaponSets)
    RAW_PrintIfDebug(CentralizedString("Option: weaponSets"), RAW_PrintTable_WeaponSets)

    if not IsModOptionEnabled("weaponSets") then
        RAW_PrintIfDebug(CentralizedString("Disabled!"), RAW_PrintTable_WeaponSets)
        RAW_PrintIfDebug(CentralizedString("Skipping the addition of default weapon attacks"), RAW_PrintTable_WeaponSets)
        RAW_PrintIfDebug("====================================================================================================\n", RAW_PrintTable_WeaponSets)
        return
    end

    RAW_PrintIfDebug(CentralizedString("Enabled!"), RAW_PrintTable_WeaponSets)
    RAW_PrintIfDebug(CentralizedString("Starting the addition of default weapon attacks"), RAW_PrintTable_WeaponSets)

    for _, name in pairs(Ext.Stats.GetStats("Character")) do
        RAW_AddWeaponSetsPassive(name)
    end

    RAW_PrintIfDebug("\n" .. CentralizedString("Finished the addition of default weapon attacks"), RAW_PrintTable_WeaponSets)
    RAW_PrintIfDebug("====================================================================================================\n", RAW_PrintTable_WeaponSets)
end
