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
    Ext.Utils.Print("\n====================================================================================================")
    Ext.Utils.Print(CentralizedString("Option: twoWeaponFighting"))

    if not IsModOptionEnabled("twoWeaponFighting") then
        Ext.Utils.Print(CentralizedString("Disabled!"))
        Ext.Utils.Print(CentralizedString("Skipping the Two Weapon Fighting changes"))
        Ext.Utils.Print("====================================================================================================\n")
        return
    end

    Ext.Utils.Print(CentralizedString("Enabled!"))
    Ext.Utils.Print(CentralizedString("Starting the Two Weapon Fighting changes"))

    for _, name in pairs(Ext.Stats.GetStats("Character")) do
        RAW_AddOffhandPassive(name)
    end

    Ext.Utils.Print("\n" .. CentralizedString("Finished the Two Weapon Fighting changes"))
    Ext.Utils.Print("====================================================================================================\n")
end

---------------------------------------- MODELS ----------------------------------------

ENUM_RAW_OffHandPassive = "RAW_OffHand_Enabler"
