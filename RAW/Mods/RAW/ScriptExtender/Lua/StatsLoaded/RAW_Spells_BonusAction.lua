local ENUM_RAW_Spells_BonusAction_Passives

local function RAW_AddCharacterBonusActionSpellPassives(char)
    for _, passive in pairs(ENUM_RAW_Spells_BonusAction_Passives) do
        RAW_PrintIfDebug("\tAdding passive: " .. passive, RAW_PrintTable_Spells_BonusAction)
        char.Passives = passive .. ";" .. char.Passives
    end
    RAW_PrintIfDebug("\tPassives: " .. char.Passives, RAW_PrintTable_Spells_BonusAction)
end

---------------------------------------- STATS FUNCTION ----------------------------------------

function RAW_Spells_BonusAction()
    RAW_PrintIfDebug("\n====================================================================================================", RAW_PrintTable_Spells_BonusAction)
    RAW_PrintIfDebug(CentralizedString("Option: spells_bonusAction"), RAW_PrintTable_Spells_BonusAction)

    if not IsModOptionEnabled("spells_bonusAction") then
        RAW_PrintIfDebug(CentralizedString("Disabled!"), RAW_PrintTable_Spells_BonusAction)
        RAW_PrintIfDebug(CentralizedString("Skipping the application of Bonus Action Spell Rules"), RAW_PrintTable_Spells_BonusAction)
        RAW_PrintIfDebug("====================================================================================================\n", RAW_PrintTable_Spells_BonusAction)
        return
    end

    RAW_PrintIfDebug(CentralizedString("Enabled!"), RAW_PrintTable_Spells_BonusAction)
    RAW_PrintIfDebug(CentralizedString("Starting the application of Bonus Action Spell Rules"), RAW_PrintTable_Spells_BonusAction)

    for _, name in pairs(Ext.Stats.GetStats("Character")) do
        local char = Ext.Stats.Get(name)

        -- Temporarily giving the passives just to players
        if RAW_CharIsHero(char) then
            RAW_PrintIfDebug("\nCharacter: " .. name, RAW_PrintTable_Spells_BonusAction)
            RAW_AddCharacterBonusActionSpellPassives(char)
        end
    end

    RAW_PrintIfDebug("\n" .. CentralizedString("Finished the application of Bonus Action Spell Rules"), RAW_PrintTable_Spells_BonusAction)
    RAW_PrintIfDebug("====================================================================================================\n", RAW_PrintTable_Spells_BonusAction)
end

---------------------------------------- MODELS ----------------------------------------

ENUM_RAW_Spells_BonusAction_Passives = {
    "RAW_BonusActionSpells",
    "RAW_NotBonusActionSpells",
}
