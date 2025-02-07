local modOption = "spells_bonusAction"
local debugLog = IsModOptionLogging(modOption)

local ENUM_RAW_Spells_BonusAction_Passives

local function RAW_AddCharacterBonusActionSpellPassives(char)
    for _, passive in pairs(ENUM_RAW_Spells_BonusAction_Passives) do
        RAW_PrintIfDebug("\tAdding passive: " .. passive, debugLog)
        char.Passives = passive .. ";" .. char.Passives
    end
    RAW_PrintIfDebug("\tPassives: " .. char.Passives, debugLog)
end

---------------------------------------- STATS FUNCTION ----------------------------------------

function RAW_Spells_BonusAction()
    RAW_PrintIfDebug("\n====================================================================================================", debugLog)
    RAW_PrintIfDebug(CentralizedString("Option: " .. modOption), debugLog)

    if not IsModOptionEnabled(modOption) then
        RAW_PrintIfDebug(CentralizedString("Disabled!"), debugLog)
        RAW_PrintIfDebug(CentralizedString("Skipping the application of Bonus Action Spell Rules"), debugLog)
        RAW_PrintIfDebug("====================================================================================================\n", debugLog)
        return
    end

    RAW_PrintIfDebug(CentralizedString("Enabled!"), debugLog)
    RAW_PrintIfDebug(CentralizedString("Starting the application of Bonus Action Spell Rules"), debugLog)

    for _, name in pairs(Ext.Stats.GetStats("Character")) do
        local char = Ext.Stats.Get(name)

        -- Temporarily giving the passives just to players
        if RAW_CharIsHero(char) then
            RAW_PrintIfDebug("\nCharacter: " .. name, debugLog)
            RAW_AddCharacterBonusActionSpellPassives(char)
        end
    end

    RAW_PrintIfDebug("\n" .. CentralizedString("Finished the application of Bonus Action Spell Rules"), debugLog)
    RAW_PrintIfDebug("====================================================================================================\n", debugLog)
end

---------------------------------------- MODELS ----------------------------------------

ENUM_RAW_Spells_BonusAction_Passives = {
    "RAW_BonusActionSpells",
    "RAW_NotBonusActionSpells",
}
