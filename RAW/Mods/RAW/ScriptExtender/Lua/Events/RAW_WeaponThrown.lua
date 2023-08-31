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
    Ext.Utils.Print("\n===================================================================")
    Ext.Utils.Print("           Starting the addition of Weapon Throw Spells")
    Ext.Utils.Print("===================================================================\n")

    for _, name in pairs(Ext.Stats.GetStats("Weapon")) do
        local weapon = Ext.Stats.Get(name)
        RAW_PrintIfDebug("\nWeapon: " .. name, RAW_PrintTable_WeaponThrown)

        RAW_AddThrownSpells(weapon)
    end

    Ext.Utils.Print("\n===================================================================")
    Ext.Utils.Print("           Finished the addition of Weapon Throw Spells")
    Ext.Utils.Print("===================================================================\n")
end
