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
