local ENUM_RAW_Concentration_RequirementEvents

local function RAW_AddConcentrationRequirement(name)
    local spell = Ext.Stats.Get(name)
    if not RAW_HasValueInList(spell.SpellFlags, "IsConcentration") then
        return
    end

    RAW_PrintIfDebug("\nAdding requirement to " ..spell.Name, RAW_PrintTable_Concentration)

    local requirementConditionsPrefix = ""
    if spell.RequirementConditions ~= nil and spell.RequirementConditions ~= "" then
        requirementConditionsPrefix = "(" .. spell.RequirementConditions .. ") and "
    end

    spell.RequirementConditions = requirementConditionsPrefix ..
        "(RAW_ConcentrationBlocker())"
    RAW_PrintIfDebug("\tRequirementConditions: " .. spell.RequirementConditions, RAW_PrintTable_Concentration)

    local requirementEvents = spell.RequirementEvents
    for _, event in pairs (ENUM_RAW_Concentration_RequirementEvents) do
        if not RAW_HasValueInList(requirementEvents, event) then
            table.insert(requirementEvents, event)
        end
    end
    spell.RequirementEvents = requirementEvents
    RAW_PrintIfDebug("\tRequirementEvents: ", RAW_PrintTable_Concentration)
    RAW_PrintIfDebug(spell.RequirementEvents, RAW_PrintTable_Concentration)
end

local function RAW_AddConcentrationPassive(name)
    local char = Ext.Stats.Get(name)
    if not RAW_CharIsHero(char) then
        return
    end

    RAW_PrintIfDebug("\nCharacter: " .. char.Name, RAW_PrintTable_Concentration)
    local passive = "RAW_Concentration_Block"
    if string.find(char.Passives, passive) then
        RAW_PrintIfDebug("\tSkipping - already has passive: " .. passive, RAW_PrintTable_Concentration)
    else
        RAW_PrintIfDebug("\tAdding passive: " .. passive, RAW_PrintTable_Concentration)
        char.Passives = passive .. ";" .. char.Passives
    end
    RAW_PrintIfDebug("\tPassives: " .. char.Passives, RAW_PrintTable_Concentration)
end

---------------------------------------- STATS FUNCTION ----------------------------------------

function RAW_Concentration()
    Ext.Utils.Print("\n====================================================================================================")
    Ext.Utils.Print(CentralizedString("Option: concentration_block"))

    if not IsModOptionEnabled("concentration_block") then
        Ext.Utils.Print(CentralizedString("Disabled!"))
        Ext.Utils.Print(CentralizedString("Skipping the Concentration Helper"))
        Ext.Utils.Print("====================================================================================================\n")
        return
    end

    Ext.Utils.Print(CentralizedString("Enabled!"))
    Ext.Utils.Print(CentralizedString("Starting the Concentration Helper"))

    for _, name in pairs(Ext.Stats.GetStats("SpellData")) do
        RAW_AddConcentrationRequirement(name)
    end

    for _, name in pairs(Ext.Stats.GetStats("Character")) do
        RAW_AddConcentrationPassive(name)
    end

    Ext.Utils.Print("\n" .. CentralizedString("Finished the Concentration Helper"))
    Ext.Utils.Print("====================================================================================================\n")
end

---------------------------------------- MODELS ----------------------------------------

ENUM_RAW_Concentration_RequirementEvents = {
    "OnStatusApplied",
    "OnStatusRemoved",
    "OnSpellCast",
}
