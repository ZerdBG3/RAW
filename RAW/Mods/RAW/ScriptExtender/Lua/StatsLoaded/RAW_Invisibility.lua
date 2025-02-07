local modOption = "invisibility"
local debugLog = IsModOptionLogging(modOption)

local ENUM_RAW_SpellsAgainstInvisibleTargets, ENUM_RAW_SpellsAgainstInvisibleTargetsIgnore
local RAW_UserSpellsAdded, RAW_UserSpellsRemoved

local userSpellsAddedFileName = "invisibility/Spells_Add.json"
local userSpellsRemovedFileName = "invisibility/Spells_Remove.json"

local invisibleCondition = "RAW_SpellAgainstInvisibleTarget"
local spellConditionVars = "(context.Target, context.Source)"
local interruptConditionVars = "(context.Source, context.Observer)"

local ENUM_RAW_SeekInvisibilitySpellUnlocker = "RAW_Invisibility_UnlockSeekSpell"

local function RAW_IsSpellBlockedByInvisibility(spell, tree)
    if ENUM_RAW_SpellsAgainstInvisibleTargetsIgnore[spell.Name] then
        return nil
    end
    if ENUM_RAW_SpellsAgainstInvisibleTargets[spell.Name] then
        return spell
    end

    RAW_Set_Add(tree, spell.Name)

    if spell.RootSpellID ~= nil and spell.RootSpellID ~= "" then
        local rootSpell = Ext.Stats.Get(spell.RootSpellID)
        if rootSpell ~= nil and rootSpell.Name ~= spell.Name and not tree[rootSpell.Name] then
            return RAW_IsSpellBlockedByInvisibility(rootSpell, tree)
        end
    end

    if spell.SpellContainerID ~= nil and spell.SpellContainerID ~= "" then
        local spellContainer = Ext.Stats.Get(spell.SpellContainerID)
        if spellContainer ~= nil and spellContainer.Name ~= spell.Name and not tree[spellContainer.Name] then
            return RAW_IsSpellBlockedByInvisibility(spellContainer, tree)
        end
    end

    local parent = RAW_GetOriginalParent(spell)
    if parent ~= "" and parent ~= spell.Name then
        local parentSpell = Ext.Stats.Get(parent)
        if parentSpell ~= nil and not tree[parentSpell.Name] then
            return RAW_IsSpellBlockedByInvisibility(parentSpell, tree)
        end
    end

    return nil
end

local function RAW_AddInvisibilityConditionToInterrupt(name)
    local interrupt = Ext.Stats.Get(name)
    if interrupt == nil then
        return
    end

    RAW_PrintIfDebug("\nAdding Conditions to " .. interrupt.Name, debugLog)
    if string.find(interrupt.Conditions, invisibleCondition) then
        RAW_PrintIfDebug("\tInterrupt already has " .. invisibleCondition .. " condition", debugLog, RAW_PrintTypeWarning)
        return
    end

    local conditionsPrefix = ""
    if interrupt.Conditions ~= nil and interrupt.Conditions ~= "" then
        conditionsPrefix = "(" .. interrupt.Conditions .. ") and "
    end

    interrupt.Conditions = conditionsPrefix ..
        "(" .. invisibleCondition .. interruptConditionVars .. ")"
    RAW_PrintIfDebug("\tConditions: " .. interrupt.Conditions, debugLog)
end

local function RAW_AddInvisibilityConditionToSpell(name)
    local spell = Ext.Stats.Get(name)
    if spell == nil then
        return
    end

    local rootSpell = RAW_IsSpellBlockedByInvisibility(spell, {})
    if rootSpell == nil then
        return
    end

    -- Trap spells that inherit usual spells shall not have invisibility condition
    if RAW_HasValueInList(spell.SpellFlags, "IsTrap") then
        return
    end

    -- Spells that are an interrupt shouldn't get the conditions on the spell itself, instead
    --   the condition should be added directly to the interrupt
    if spell.InterruptPrototype ~= nil and spell.InterruptPrototype ~= "" then
        RAW_AddInvisibilityConditionToInterrupt(spell.InterruptPrototype)
        return
    -- If the spell doesn't have an interrupt but its root does, it should skip applying the condition
    elseif rootSpell.InterruptPrototype ~= nil and rootSpell.InterruptPrototype ~= "" then
        return
    end

    local targetConditionData = "TargetConditions"
    if spell.SpellType == "Throw" then
        targetConditionData = "ThrowableTargetConditions"
    end

    RAW_PrintIfDebug("\nAdding " .. targetConditionData .. " to " .. spell.Name, debugLog)
    if string.find(spell[targetConditionData], invisibleCondition) then
        RAW_PrintIfDebug("\tSpell already has " .. invisibleCondition .. " condition", debugLog, RAW_PrintTypeWarning)
        return
    end

    local targetConditionsPrefix = ""
    if spell[targetConditionData] ~= nil and spell[targetConditionData] ~= "" then
        targetConditionsPrefix = "(" .. spell[targetConditionData] .. ") and "
    end

    spell[targetConditionData] = targetConditionsPrefix ..
        "(" .. invisibleCondition .. spellConditionVars .. ")"
    RAW_PrintIfDebug("\t" .. targetConditionData .. ": " .. spell[targetConditionData], debugLog)
end

local function RAW_AddCharacterSeekSpellPassive(name)
    local char = Ext.Stats.Get(name)
    if not RAW_CharIsHero(char) then
        return
    end

    RAW_PrintIfDebug("\nCharacter: " .. name, debugLog)
    RAW_PrintIfDebug("\tAdding passive: " .. ENUM_RAW_SeekInvisibilitySpellUnlocker, debugLog)
    char.Passives = ENUM_RAW_SeekInvisibilitySpellUnlocker .. ";" .. char.Passives
    RAW_PrintIfDebug("\tPassives: " .. char.Passives, debugLog)
end

---------------------------------------- STATS FUNCTION ----------------------------------------

function RAW_InvisibilityStats()
    RAW_PrintIfDebug("\n====================================================================================================", debugLog)
    RAW_PrintIfDebug(CentralizedString("Option: " .. modOption), debugLog)

    if not IsModOptionEnabled(modOption) then
        RAW_PrintIfDebug(CentralizedString("Disabled!"), debugLog)
        RAW_PrintIfDebug(CentralizedString("Skipping the Spells against Invisible characters setup"), debugLog)
        RAW_PrintIfDebug("====================================================================================================\n", debugLog)
        return
    end

    RAW_PrintIfDebug(CentralizedString("Enabled!"), debugLog)
    RAW_PrintIfDebug(CentralizedString("Starting the Spells against Invisible characters setup"), debugLog)

    RAW_UserSpellsAdded = RAW_LoadCustomizableOptionList(userSpellsAddedFileName)
    if RAW_UserSpellsAdded ~= nil then
        RAW_Set_Union(ENUM_RAW_SpellsAgainstInvisibleTargets, RAW_UserSpellsAdded)
    end

    RAW_UserSpellsRemoved = RAW_LoadCustomizableOptionList(userSpellsRemovedFileName)
    if RAW_UserSpellsRemoved ~= nil then
        RAW_Set_Union(ENUM_RAW_SpellsAgainstInvisibleTargetsIgnore, RAW_UserSpellsRemoved)
    end

    for _, name in pairs(Ext.Stats.GetStats("SpellData")) do
        RAW_AddInvisibilityConditionToSpell(name)
    end

    for _, name in pairs(Ext.Stats.GetStats("Character")) do
        RAW_AddCharacterSeekSpellPassive(name)
    end

    RAW_PrintIfDebug("\n" .. CentralizedString("Finished the Spells against Invisible characters setup"), debugLog)
    RAW_PrintIfDebug("====================================================================================================\n", debugLog)
end

---------------------------------------- MODELS ----------------------------------------

-- Source: https://homebrewery.naturalcrit.com/share/Hk7zwD4Gxr
-- Didn't include those that require seeing a point in space or on the ground
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
    "Target_Counterspell",
    "Target_CrownOfMadness",
    "Projectile_Disintegrate",
    "Target_DominateBeast",
    "Target_DominatePerson",
    "Target_EnlargeReduce",
    "Target_Enthrall",
    "Target_Eyebite",
    "Target_FleshToStone",
    "Target_Harm",
    "Target_Haste",
    "Target_Heal",
    "Target_HealingWord",
    "Target_HeatMetal",
    "Shout_HellishRebuke",
    "Target_Hex",
    "Target_HoldMonster",
    "Target_HoldPerson",
    "Target_HuntersMark",
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

ENUM_RAW_SpellsAgainstInvisibleTargetsIgnore = RAW_Set {
    "Projectile_ChainLightning_Explosion", -- Chain Lightning can bounce to invisible enemies
    "Target_HeatMetal_Reapply", -- Heat Metal follow up damage doesn't require sight
    "Target_HAV_DevilishOX_AlternateForm_DireWolf",
    "Target_EPI_PartyTime_GaleGod",
    "Target_HAV_TakingIsobel_TakeMol",
    "Target_Polymorph_Shapechanger",
    "Target_WYR_SentientAmulet_MonkHeal",
}
