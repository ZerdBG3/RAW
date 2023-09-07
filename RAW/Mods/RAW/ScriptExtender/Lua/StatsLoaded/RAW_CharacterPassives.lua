local function RAW_AddCharacterDefaultPassives(char)
    for _, passive in pairs(ENUM_RAW_CharacterDefaultPassives) do
        RAW_PrintIfDebug("\tAdding passive: " .. passive, RAW_PrintTable_CharacterPassives)
        char.Passives = passive .. ";" .. char.Passives
    end
    RAW_PrintIfDebug("\tPassives: " .. char.Passives, RAW_PrintTable_CharacterPassives)
end

---------------------------------------- STATS FUNCTION ----------------------------------------

function RAW_CharacterPassives()
    Ext.Utils.Print("\n======================================================================")
    Ext.Utils.Print(CentralizedString("Starting the addition of Character Passives"))

    for _, name in pairs(Ext.Stats.GetStats("Character")) do
        local char = Ext.Stats.Get(name)
        RAW_PrintIfDebug("\nCharacter: " .. name, RAW_PrintTable_CharacterPassives)

        RAW_AddCharacterDefaultPassives(char)
    end

    Ext.Utils.Print("\n" .. CentralizedString("Finished the addition of Character Passives"))
    Ext.Utils.Print("======================================================================\n")
end
