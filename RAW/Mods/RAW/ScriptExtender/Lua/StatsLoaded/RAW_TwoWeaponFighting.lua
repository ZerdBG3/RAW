local ENUM_RAW_OffHandPassive

local function RAW_AddOffhandPassive(name)
    local char = Ext.Stats.Get(name)
    if not RAW_CharIsHero(char) then
        return
    end

    RAW_PrintIfDebug("\nCharacter: " .. char.Name, RAW_PrintTable_TwoWeaponFighting)
    RAW_PrintIfDebug("\tAdding passive: " .. ENUM_RAW_OffHandPassive, RAW_PrintTable_TwoWeaponFighting)
    char.Passives = ENUM_RAW_OffHandPassive .. ";" .. char.Passives
    RAW_PrintIfDebug("\tPassives: " .. char.Passives, RAW_PrintTable_TwoWeaponFighting)
end

---------------------------------------- STATS FUNCTION ----------------------------------------

function RAW_TwoWeaponFighting()
    RAW_PrintIfDebug("\n====================================================================================================", RAW_PrintTable_TwoWeaponFighting)
    RAW_PrintIfDebug(CentralizedString("Option: twoWeaponFighting"), RAW_PrintTable_TwoWeaponFighting)

    if not IsModOptionEnabled("twoWeaponFighting") then
        RAW_PrintIfDebug(CentralizedString("Disabled!"), RAW_PrintTable_TwoWeaponFighting)
        RAW_PrintIfDebug(CentralizedString("Skipping the Two Weapon Fighting changes"), RAW_PrintTable_TwoWeaponFighting)
        RAW_PrintIfDebug("====================================================================================================\n", RAW_PrintTable_TwoWeaponFighting)
        return
    end

    RAW_PrintIfDebug(CentralizedString("Enabled!"), RAW_PrintTable_TwoWeaponFighting)
    RAW_PrintIfDebug(CentralizedString("Starting the Two Weapon Fighting changes"), RAW_PrintTable_TwoWeaponFighting)

    for _, name in pairs(Ext.Stats.GetStats("Character")) do
        RAW_AddOffhandPassive(name)
    end

    RAW_PrintIfDebug("\n" .. CentralizedString("Finished the Two Weapon Fighting changes"), RAW_PrintTable_TwoWeaponFighting)
    RAW_PrintIfDebug("====================================================================================================\n", RAW_PrintTable_TwoWeaponFighting)
end

---------------------------------------- MODELS ----------------------------------------

ENUM_RAW_OffHandPassive = "RAW_OffHand_Enabler"
