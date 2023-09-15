local ENUM_RAW_WeaponSpells_Spells, ENUM_RAW_WeaponSpells_Passives

local function RAW_RemoveBoostsOnEquipMainHand(weapon)
    local mainHandBoosts = weapon.BoostsOnEquipMainHand
    if mainHandBoosts ~= nil and mainHandBoosts ~= "" then
        local newBoosts = mainHandBoosts
        local hadReplacement = false
        for _, spell in pairs(ENUM_RAW_WeaponSpells_Spells) do
            local pattern = "UnlockSpell%(" .. spell .. "%)"
            local new, count = string.gsub(newBoosts, pattern, "")
            if count > 0 then
                RAW_PrintIfDebug("\t- BoostsOnEquipMainHand Removed " .. spell, RAW_PrintTable_WeaponSpells)
                hadReplacement = true
                newBoosts = new
            end
        end
        if hadReplacement then
            newBoosts = RAW_RemoveRepeatedSemicolon(newBoosts)
            weapon.BoostsOnEquipMainHand = newBoosts
        end
    end
end

local function RAW_RemoveMainHandPassives(weapon)
    local mainHandPassives = weapon.PassivesMainHand
    if mainHandPassives ~= nil and mainHandPassives ~= "" then
        local newPassives = mainHandPassives
        local hadReplacement = false
        for _, passive in pairs(ENUM_RAW_WeaponSpells_Passives) do
            local new, count = string.gsub(newPassives, passive, "")
            if count > 0 then
                RAW_PrintIfDebug("\t- PassivesMainHand Removed " .. passive, RAW_PrintTable_WeaponSpells)
                hadReplacement = true
                newPassives = new
            end
        end
        if hadReplacement then
            newPassives = RAW_RemoveRepeatedSemicolon(newPassives)
            weapon.PassivesMainHand = newPassives
        end
    end
end

local function RAW_RemovePassivesOnEquip(weapon)
    local passivesOnEquip = weapon.PassivesOnEquip
    if passivesOnEquip ~= nil and passivesOnEquip ~= "" then
        local newPassives = passivesOnEquip
        local hadReplacement = false
        for _, passive in pairs(ENUM_RAW_WeaponSpells_Passives) do
            local new, count = string.gsub(newPassives, passive, "")
            if count > 0 then
                RAW_PrintIfDebug("\t- PassivesOnEquip Removed " .. passive, RAW_PrintTable_WeaponSpells)
                hadReplacement = true
                newPassives = new
            end
        end
        if hadReplacement then
            newPassives = RAW_RemoveRepeatedSemicolon(newPassives)
            weapon.PassivesOnEquip = newPassives
        end
    end
end

---------------------------------------- STATS FUNCTION ----------------------------------------

function RAW_WeaponSpells()
    Ext.Utils.Print("\n======================================================================")
    Ext.Utils.Print(CentralizedString("Option: weaponSpells"))

    if not IsModOptionEnabled("weaponSpells") then
        Ext.Utils.Print(CentralizedString("Disabled!"))
        Ext.Utils.Print(CentralizedString("Skipping the removal of Weapon Spells"))
        Ext.Utils.Print("======================================================================\n")
        return
    end

    Ext.Utils.Print(CentralizedString("Enabled!"))
    Ext.Utils.Print(CentralizedString("Starting the removal of Weapon Spells"))

    for _, name in pairs(Ext.Stats.GetStats("Weapon")) do
        local weapon = Ext.Stats.Get(name)
        RAW_PrintIfDebug("\nWeapon: " .. name, RAW_PrintTable_WeaponSpells)

        RAW_RemoveBoostsOnEquipMainHand(weapon)
        RAW_RemoveMainHandPassives(weapon)
        RAW_RemovePassivesOnEquip(weapon)
    end

    Ext.Utils.Print("\n" .. CentralizedString("Finished the removal of Weapon Spells"))
    Ext.Utils.Print("======================================================================\n")
end

---------------------------------------- MODELS ----------------------------------------

ENUM_RAW_WeaponSpells_Spells = {
    "Projectile_HamstringShot",
    "Projectile_Headcrack",
    "Projectile_MobileShooting",
    "Projectile_PiercingShot",
    "Rush_SpringAttack",
    "Shout_FullSwing",
    "Shout_Steady",
    "Shout_SteadyRanged",
    "Shout_SteadyRangedCrossbow",
    "Target_ConcussiveSmash",
    "Target_CripplingStrike",
    "Target_DisarmingStrike",
    "Target_HeartStopper",
    "Target_HinderingSmash",
    "Target_OpeningAttack",
    "Target_PiercingThrust",
    "Target_PommelStrike",
    "Target_PostureBreaker",
    "Target_Slash_New",
    "Target_Topple",
    "Zone_Cleave"
}

ENUM_RAW_WeaponSpells_Passives = {
    "Overwhelm",
}
