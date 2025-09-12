local modOption = "skillCheck_critFail"
local debugLog = IsModOptionLogging(modOption)

local ENUM_RAW_SkillCheck_CritFail_Passives

local function RAW_AddCharacterSkillCheckPassives(char)
    for _, passive in pairs(ENUM_RAW_SkillCheck_CritFail_Passives) do
        if string.find(char.Passives, passive) then
            RAW_PrintIfDebug("\tSkipping - already has passive: " .. passive, debugLog)
        else
            RAW_PrintIfDebug("\tAdding passive: " .. passive, debugLog)
            char.Passives = passive .. ";" .. char.Passives
        end
    end
    RAW_PrintIfDebug("\tPassives: " .. char.Passives, debugLog)
end

---------------------------------------- STATS FUNCTION ----------------------------------------

function RAW_SkillCheck_CritFail()
    RAW_PrintIfDebug("\n====================================================================================================", debugLog)
    RAW_PrintIfDebug(CentralizedString("Option: " .. modOption), debugLog)

    if not IsModOptionEnabled(modOption) then
        RAW_PrintIfDebug(CentralizedString("Disabled!"), debugLog)
        RAW_PrintIfDebug(CentralizedString("Skipping the disabling of Critical Fails on Skill Checks"), debugLog)
        RAW_PrintIfDebug("====================================================================================================\n", debugLog)
        return
    end

    RAW_PrintIfDebug(CentralizedString("Enabled!"), debugLog)
    RAW_PrintIfDebug(CentralizedString("Starting the disabling of Critical Fails on Skill Checks"), debugLog)

    for _, name in pairs(Ext.Stats.GetStats("Character")) do
        local char = Ext.Stats.Get(name)

        if RAW_CharIsHero(char) then
            RAW_PrintIfDebug("\nCharacter: " .. name, debugLog)
            RAW_AddCharacterSkillCheckPassives(char)
        end
    end

    RAW_PrintIfDebug("\n" .. CentralizedString("Finished the disabling of Critical Fails on Skill Checks"), debugLog)
    RAW_PrintIfDebug("====================================================================================================\n", debugLog)
end

---------------------------------------- MODELS ----------------------------------------

ENUM_RAW_SkillCheck_CritFail_Passives = {
    "RAW_DisableSkillCheckCritFail",
}
