local ENUM_RAW_WeaponThrown_Spells

local function RAW_AddThrownSpells(weapon)
    local spellsToAdd = {}
    local priority = 0
    for attribute, list in pairs(ENUM_RAW_WeaponThrown_Spells) do
        for key, object in pairs(list) do
            if object["Mandatory"] and not RAW_HasValueInList(weapon[attribute], key) then
                return
            end
            if object["Priority"] > priority and RAW_HasValueInList(weapon[attribute], key) then
                spellsToAdd = object["Spells"]
                priority = object["Priority"]
            end
        end
    end

    for attribute, spells in pairs(spellsToAdd) do
        RAW_PrintIfDebug("\tAdding spells to: " .. attribute, RAW_PrintTable_WeaponThrown)
        local spellsString = ""
        for _, spell in pairs(spells) do
            RAW_PrintIfDebug("\t\tAdding spell: " .. spell, RAW_PrintTable_WeaponThrown)
            spellsString = spellsString .. "UnlockSpell(" .. spell .. ");"
        end
        weapon[attribute] = spellsString .. weapon[attribute]
    end
end

---------------------------------------- STATS FUNCTION ----------------------------------------

function RAW_WeaponThrown()
    RAW_PrintIfDebug(("\n===================================================================================================="), RAW_PrintTable_WeaponThrown)
    RAW_PrintIfDebug((CentralizedString("Option: throw")), RAW_PrintTable_WeaponThrown)

    if not IsModOptionEnabled("throw") then
        RAW_PrintIfDebug((CentralizedString("Disabled!")), RAW_PrintTable_WeaponThrown)
        RAW_PrintIfDebug((CentralizedString("Skipping the addition of Throw Weapon Spells")), RAW_PrintTable_WeaponThrown)
        RAW_PrintIfDebug(("====================================================================================================\n"), RAW_PrintTable_WeaponThrown)
        return
    end

    RAW_PrintIfDebug((CentralizedString("Enabled!")), RAW_PrintTable_WeaponThrown)
    RAW_PrintIfDebug((CentralizedString("Starting the addition of Weapon Throw Spells")), RAW_PrintTable_WeaponThrown)

    for _, name in pairs(Ext.Stats.GetStats("Weapon")) do
        local weapon = Ext.Stats.Get(name)
        RAW_PrintIfDebug("\nWeapon: " .. name, RAW_PrintTable_WeaponThrown)

        RAW_AddThrownSpells(weapon)
    end

    RAW_PrintIfDebug(("\n" .. CentralizedString("Finished the addition of Weapon Throw Spells")), RAW_PrintTable_WeaponThrown)
    RAW_PrintIfDebug(("====================================================================================================\n"), RAW_PrintTable_WeaponThrown)
end

---------------------------------------- MODELS ----------------------------------------

-- Must have all values previously stated inside each attribute
-- Eg.: must have the Thrown Weapon Property to check for Finesse
ENUM_RAW_WeaponThrown_Spells = {
    ["Weapon Properties"] = {
        ["Thrown"] = {
            ["Mandatory"] = true,
            ["Priority"] = 1,
            ["Spells"] = {
                ["BoostsOnEquipMainHand"] = {
                    "RAW_Throw_Weapon",
                    "RAW_Throw_Weapon_OffHand_Transition",
                },
                ["BoostsOnEquipOffHand"] = {
                    "RAW_Throw_Weapon_OffHand",
                },
            },
        },
        ["Finesse"] = {
            ["Mandatory"] = false,
            ["Priority"] = 2,
            ["Spells"] = {
                ["BoostsOnEquipMainHand"] = {
                    "RAW_Throw_Finesse",
                    "RAW_Throw_Finesse_OffHand_Transition",
                },
                ["BoostsOnEquipOffHand"] = {
                    "RAW_Throw_Finesse_OffHand",
                },
            },
        },
    },
    ["Proficiency Group"] = {
        ["Javelins"] = {
            ["Mandatory"] = false,
            ["Priority"] = 3,
            ["Spells"] = {
                ["BoostsOnEquipMainHand"] = {
                    "RAW_Throw_Javelin",
                    "RAW_Throw_Javelin_OffHand_Transition",
                },
                ["BoostsOnEquipOffHand"] = {
                    "RAW_Throw_Javelin_OffHand",
                },
            },
        },
    },
}
