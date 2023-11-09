local ENUM_RAW_CharacterDefaultPassives

local function RAW_AddCharacterDefaultPassives(char)
    for target, passives in pairs(ENUM_RAW_CharacterDefaultPassives) do
        if target == "all" or (target == "hero" and RAW_CharIsHero(char)) then
            for _, passive in pairs(passives) do
                RAW_PrintIfDebug("\tAdding passive: " .. passive, RAW_PrintTable_CharacterPassives)
                char.Passives = passive .. ";" .. char.Passives
            end
        end
    end
    RAW_PrintIfDebug("\tPassives: " .. char.Passives, RAW_PrintTable_CharacterPassives)
end

---------------------------------------- STATS FUNCTION ----------------------------------------

function RAW_CharacterPassives()
    Ext.Utils.Print("\n====================================================================================================")
    Ext.Utils.Print(CentralizedString("Starting the addition of Character Passives"))

    for _, name in pairs(Ext.Stats.GetStats("Character")) do
        local char = Ext.Stats.Get(name)
        RAW_PrintIfDebug("\nCharacter: " .. name, RAW_PrintTable_CharacterPassives)

        RAW_AddCharacterDefaultPassives(char)
    end

    Ext.Utils.Print("\n" .. CentralizedString("Finished the addition of Character Passives"))
    Ext.Utils.Print("====================================================================================================\n")
end

---------------------------------------- MODELS ----------------------------------------

ENUM_RAW_CharacterDefaultPassives = {
    ["all"] = {
        "RAW_OnTurnTracker",
    },
    ["hero"] = {
        "RAW_Walk",
    },
}
