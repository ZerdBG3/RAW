local ENUM_RAW_EquipActionPassive, ENUM_RAW_DualWielderFeat

local function RAW_AddFreeWeaponEquipPassive(name)
    local char = Ext.Stats.Get(name)
    if not RAW_CharIsHero(char) then
        return
    end

    RAW_PrintIfDebug("\nCharacter: " .. char.Name, RAW_PrintTable_FreeWeaponEquip)
    RAW_PrintIfDebug("\tAdding passive: " .. ENUM_RAW_EquipActionPassive, RAW_PrintTable_FreeWeaponEquip)
    char.Passives = ENUM_RAW_EquipActionPassive .. ";" .. char.Passives
    RAW_PrintIfDebug("\tPassives: " .. char.Passives, RAW_PrintTable_FreeWeaponEquip)
end

---------------------------------------- STATS FUNCTION ----------------------------------------

function RAW_EquipAction()
    RAW_PrintIfDebug("\n====================================================================================================", RAW_PrintTable_FreeWeaponEquip)
    RAW_PrintIfDebug(CentralizedString("Option: freeWeaponEquip"), RAW_PrintTable_FreeWeaponEquip)

    if not IsModOptionEnabled("freeWeaponEquip") then
        RAW_PrintIfDebug(CentralizedString("Disabled!"), RAW_PrintTable_FreeWeaponEquip)
        RAW_PrintIfDebug(CentralizedString("Skipping the Free Weapon Equip changes"), RAW_PrintTable_FreeWeaponEquip)
        RAW_PrintIfDebug("====================================================================================================\n", RAW_PrintTable_FreeWeaponEquip)
        return
    end

    RAW_PrintIfDebug(CentralizedString("Enabled!"), RAW_PrintTable_FreeWeaponEquip)
    RAW_PrintIfDebug(CentralizedString("Starting the Free Weapon Equip changes"), RAW_PrintTable_FreeWeaponEquip)

    for _, name in pairs(Ext.Stats.GetStats("Character")) do
        RAW_AddFreeWeaponEquipPassive(name)
    end

    RAW_ApplyStaticData(ENUM_RAW_DualWielderFeat, RAW_PrintTable_FreeWeaponEquip)

    RAW_PrintIfDebug("\n" .. CentralizedString("Finished the Free Weapon Equip changes"), RAW_PrintTable_FreeWeaponEquip)
    RAW_PrintIfDebug("====================================================================================================\n", RAW_PrintTable_FreeWeaponEquip)
end

---------------------------------------- MODELS ----------------------------------------

ENUM_RAW_EquipActionPassive = "RAW_UnlockEquipWeaponPoint"

ENUM_RAW_DualWielderFeat = {
    ["Feat"] = {
        ["f692f7b5-ffd5-4942-91a1-a71ebb2f5e7c"] = {
            ["PassivesAdded"] = {
                ["Type"] = "add",
                ["Value"] = "RAW_DualWielder_FreeEquip",
            },
        },
    },
    ["FeatDescription"] = {
        ["95777965-bb2b-4ad5-8cc8-3c0c407c4bc4"] = {
            ["Description"] = {
                ["Type"] = "overwrite",
                ["Value"] = {
                    ["Handle"] = {
                        ["Handle"] = "h4671f1fag7c08g4921ga35bg07713c95c4d9",
                        ["Version"] = 1,
                    },
                },
            },
        },
    },
}
