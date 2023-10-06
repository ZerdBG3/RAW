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
    Ext.Utils.Print("\n====================================================================================================")
    Ext.Utils.Print(CentralizedString("Option: weaponSets"))

    if not IsModOptionEnabled("weaponSets") then
        Ext.Utils.Print(CentralizedString("Disabled!"))
        Ext.Utils.Print(CentralizedString("Skipping the addition of default weapon attacks"))
        Ext.Utils.Print("====================================================================================================\n")
        return
    end

    Ext.Utils.Print(CentralizedString("Enabled!"))
    Ext.Utils.Print(CentralizedString("Starting the addition of default weapon attacks"))

    for _, name in pairs(Ext.Stats.GetStats("Character")) do
        RAW_AddWeaponSetsPassive(name)
    end

    Ext.Utils.Print("\n" .. CentralizedString("Finished the addition of default weapon attacks"))
    Ext.Utils.Print("====================================================================================================\n")
end
