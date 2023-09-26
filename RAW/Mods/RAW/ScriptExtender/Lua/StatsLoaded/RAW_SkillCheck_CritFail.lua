local ENUM_RAW_SkillCheck_CritFail_Passives

local function RAW_AddCharacterSkillCheckPassives(char)
    for _, passive in pairs(ENUM_RAW_SkillCheck_CritFail_Passives) do
        if string.find(char.Passives, passive) then
            RAW_PrintIfDebug("\tSkipping - already has passive: " .. passive, RAW_PrintTable_SkillCheck_CritFail)
        else
            RAW_PrintIfDebug("\tAdding passive: " .. passive, RAW_PrintTable_SkillCheck_CritFail)
            char.Passives = passive .. ";" .. char.Passives
        end
    end
    RAW_PrintIfDebug("\tPassives: " .. char.Passives, RAW_PrintTable_SkillCheck_CritFail)
end

---------------------------------------- STATS FUNCTION ----------------------------------------

function RAW_SkillCheck_CritFail()
    Ext.Utils.Print("\n====================================================================================================")
    Ext.Utils.Print(CentralizedString("Option: skillCheck_critFail"))

    if not IsModOptionEnabled("skillCheck_critFail") then
        Ext.Utils.Print(CentralizedString("Disabled!"))
        Ext.Utils.Print(CentralizedString("Skipping the disabling of Critical Fails on Skill Checks"))
        Ext.Utils.Print("====================================================================================================\n")
        return
    end

    Ext.Utils.Print(CentralizedString("Enabled!"))
    Ext.Utils.Print(CentralizedString("Starting the disabling of Critical Fails on Skill Checks"))

    for _, name in pairs(Ext.Stats.GetStats("Character")) do
        local char = Ext.Stats.Get(name)

        if RAW_CharIsHero(char) then
            RAW_PrintIfDebug("\nCharacter: " .. name, RAW_PrintTable_SkillCheck_CritFail)
            RAW_AddCharacterSkillCheckPassives(char)
        end
    end

    Ext.Utils.Print("\n" .. CentralizedString("Finished the disabling of Critical Fails on Skill Checks"))
    Ext.Utils.Print("====================================================================================================\n")
end

---------------------------------------- MODELS ----------------------------------------

ENUM_RAW_SkillCheck_CritFail_Passives = {
    "RAW_DisableSkillCheckCritFail",
}
