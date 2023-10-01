-- Lib
Ext.Require("RAW_Lib.lua")

-- Config
Ext.Require("RAW_Config.lua")
RAW_LoadModOptions()

-- ModuleLoadStarted Event
local RAW_ModuleLoadStarted = "ModuleLoad/"

Ext.Require(RAW_ModuleLoadStarted .. "RAW_OptionalFiles.lua")

local function RAW_ModuleLoadStarted()
    Ext.Utils.Print("\n====================================================================================================")
    Ext.Utils.Print(CentralizedString("[RAW:BootstrapShared.lua] ModuleLoadStarted Start"))
    Ext.Utils.Print("====================================================================================================\n")

    -- RAW_OptionalFiles()

    Ext.Utils.Print("\n====================================================================================================")
    Ext.Utils.Print(CentralizedString("[RAW:BootstrapShared.lua] ModuleLoadStarted Ended"))
    Ext.Utils.Print("====================================================================================================\n")
end

Ext.Events.ModuleLoadStarted:Subscribe(RAW_ModuleLoadStarted)

-- StatsLoaded Event
local RAW_StatsLoadedPath = "StatsLoaded/"

Ext.Require(RAW_StatsLoadedPath .. "RAW_Attunement.lua")
Ext.Require(RAW_StatsLoadedPath .. "RAW_CharacterPassives.lua")
Ext.Require(RAW_StatsLoadedPath .. "RAW_Concentration.lua")
Ext.Require(RAW_StatsLoadedPath .. "RAW_Rogue.lua")
Ext.Require(RAW_StatsLoadedPath .. "RAW_Rogue_Thief.lua")
Ext.Require(RAW_StatsLoadedPath .. "RAW_SkillCheck_CritFail.lua")
Ext.Require(RAW_StatsLoadedPath .. "RAW_Spells_BonusAction.lua")
Ext.Require(RAW_StatsLoadedPath .. "RAW_Spells_Duration.lua")
Ext.Require(RAW_StatsLoadedPath .. "RAW_WeaponSpells.lua")
Ext.Require(RAW_StatsLoadedPath .. "RAW_WeaponThrown.lua")

local function RAW_StatsLoaded()
    Ext.Utils.Print("\n====================================================================================================")
    Ext.Utils.Print(CentralizedString("[RAW:BootstrapShared.lua] StatsLoaded Start"))
    Ext.Utils.Print("====================================================================================================\n")

    RAW_Attunement()
    RAW_CharacterPassives()
    RAW_Concentration()
    RAW_Rogue()
    RAW_Rogue_Thief()
    RAW_SkillCheck_CritFail()
    RAW_Spells_BonusAction()
    RAW_Spells_Duration()
    RAW_WeaponSpells()
    RAW_WeaponThrown()

    Ext.Utils.Print("\n====================================================================================================")
    Ext.Utils.Print(CentralizedString("[RAW:BootstrapShared.lua] StatsLoaded Ended"))
    Ext.Utils.Print("====================================================================================================\n")
end

Ext.Events.StatsLoaded:Subscribe(RAW_StatsLoaded)

-- Osiris Files
local RAW_OsirisFilesPath = "Osiris/"

Ext.Require(RAW_OsirisFilesPath .. "RAW_WeaponSets.lua")

if Ext.IsServer() then
    Ext.Utils.Print("\n====================================================================================================")
    Ext.Utils.Print(CentralizedString("[RAW:BootstrapShared.lua] Osiris Registration Start"))
    Ext.Utils.Print("====================================================================================================\n")

    RAW_WeaponSets()

    Ext.Utils.Print("\n====================================================================================================")
    Ext.Utils.Print(CentralizedString("[RAW:BootstrapShared.lua] Osiris Registration Ended"))
    Ext.Utils.Print("====================================================================================================\n")
end
