local ENUM_RAW_SpellsAgainstInvisibleTargets

local function RAW_IsSpellBlockedByInvisibility(spell)
    if ENUM_RAW_SpellsAgainstInvisibleTargets[spell.Name] then
        return true
    end

    if spell.RootSpellID ~= nil and spell.RootSpellID ~= "" then
        local rootSpell = Ext.Stats.Get(spell.RootSpellID)
        if rootSpell ~= nil and rootSpell.Name ~= spell.Name then
            return RAW_IsSpellBlockedByInvisibility(rootSpell)
        end
    end

    if spell.SpellContainerID ~= nil and spell.SpellContainerID ~= "" then
        local spellContainer = Ext.Stats.Get(spell.SpellContainerID)
        if spellContainer ~= nil and spellContainer.Name ~= spell.Name then
            if not string.find(spellContainer.ContainerSpells, spell.Name) then
                return false
            end
            return RAW_IsSpellBlockedByInvisibility(spellContainer)
        end
    end

    return false
end

local function RAW_AddInvisibilityConditionToSpell(name)
    local spell = Ext.Stats.Get(name)
    if spell == nil then
        return
    end

    if not RAW_IsSpellBlockedByInvisibility(spell) then
        return
    end

    RAW_PrintIfDebug("\nAdding TargetConditions to " .. spell.Name, RAW_PrintTable_Invisible)

    local targetConditionsPrefix = ""
    if spell.TargetConditions ~= nil and spell.TargetConditions ~= "" then
        targetConditionsPrefix = "(" .. spell.TargetConditions .. ") and "
    end

    spell.TargetConditions = targetConditionsPrefix ..
        "(RAW_SpellAgainstInvisibleTarget())"
    RAW_PrintIfDebug("\tTargetConditions: " .. spell.TargetConditions, RAW_PrintTable_Invisible)
end

---------------------------------------- STATS FUNCTION ----------------------------------------

function RAW_InvisibilityStats()
    RAW_PrintIfDebug("\n====================================================================================================", RAW_PrintTable_Invisible)
    RAW_PrintIfDebug(CentralizedString("Option: invisibility"), RAW_PrintTable_Invisible)

    if not IsModOptionEnabled("invisibility") then
        RAW_PrintIfDebug(CentralizedString("Disabled!"), RAW_PrintTable_Invisible)
        RAW_PrintIfDebug(CentralizedString("Skipping the Spells against Invisible characters setup"), RAW_PrintTable_Invisible)
        RAW_PrintIfDebug("====================================================================================================\n", RAW_PrintTable_Invisible)
        return
    end

    RAW_PrintIfDebug(CentralizedString("Enabled!"), RAW_PrintTable_Invisible)
    RAW_PrintIfDebug(CentralizedString("Starting the Spells against Invisible characters setup"), RAW_PrintTable_Invisible)

    for _, name in pairs(Ext.Stats.GetStats("SpellData")) do
        RAW_AddInvisibilityConditionToSpell(name)
    end

    RAW_PrintIfDebug("\n" .. CentralizedString("Finished the Spells against Invisible characters setup"), RAW_PrintTable_Invisible)
    RAW_PrintIfDebug("====================================================================================================\n", RAW_PrintTable_Invisible)
end

---------------------------------------- MODELS ----------------------------------------

-- Source: https://homebrewery.naturalcrit.com/share/Hk7zwD4Gxr
-- Didn't include those that requires seeing a point in space or in the ground
ENUM_RAW_SpellsAgainstInvisibleTargets = RAW_Set {
    -- Vanilla spells
    "Projectile_AcidSplash",
    "Target_AnimalFriendship",
    "Target_Bane",
    "Target_Banishment",
    "Target_Blight",
    "Target_Blindness",
    "Projectile_ChainLightning",
    "Target_CharmPerson",
    "Projectile_ChromaticOrb",
    "Target_Command_Container",
    "Target_CompelledDuel",
    "Target_Counterspell", -- Check if it works
    "Target_CrownOfMadness",
    "Projectile_Disintegrate",
    "Target_DominateBeast",
    "Target_DominatePerson",
    "Target_EnlargeReduce",
    "Target_Enthrall",
    "Target_Eyebite",
    "Target_Eyebite_Asleep_Free",
    "Target_Eyebite_Panicked_Free",
    "Target_Eyebite_Sickened_Free",
    "Target_FleshToStone",
    "Target_Harm",
    "Target_Haste",
    "Target_Heal",
    "Target_HealingWord",
    "Target_HeatMetal",
    "Target_HellishRebuke", -- Check if it works
    "Target_Hex",
    "Target_Hex_Reapply",
    "Target_HoldMonster",
    "Target_HoldPerson",
    "Target_HuntersMark",
    "Target_HuntersMark_Reapply",
    "Target_Knock",
    "Projectile_MagicMissile",
    "Shout_HealingWord_Mass",
    "Target_IrresistibleDance",
    "Target_PhantasmalForce",
    "Target_PhantasmalKiller",
    "Projectile_PoisonSpray",
    "Target_Polymorph",
    "Target_PowerWordKill", -- Also on 5eSpells
    "Shout_PrayerOfHealing",
    "Target_SacredFlame",
    "Target_Seeming",
    "Target_HideousLaughter",
    "Throw_Telekinesis",
    "Target_ViciousMockery",

    -- 5eSpells
    -- Xanathar spells
    "Target_Catnap",
    "Target_CauseFear",
    "Target_CharmMonster",
    "Target_Frostbite",
    "Target_Infestation",
    "Target_LifeTransference",
    "Target_MaximiliansEarthenGrasp",
    "Target_MindSpike",
    "Projectile_NegativeEnergyFlood",
    "Target_PowerWordStun",
    "Target_SteelWindStrike",
    "Target_TollTheDead",
    "Shout_WordOfRadiance",

    -- Tasha's spells
    "Target_IntellectFortress",
    "Target_LightningLure",
    "Target_MindSliver",
    "Target_TashasMindWhip",
}
