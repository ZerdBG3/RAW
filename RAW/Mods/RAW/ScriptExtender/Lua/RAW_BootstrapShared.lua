-- Lib
Ext.Require("RAW_Lib.lua")

-- Config
Ext.Require("RAW_Config.lua")

-- ModuleLoadStarted Event
local RAW_ModuleLoadStarted = "ModuleLoad/"

Ext.Require(RAW_ModuleLoadStarted .. "RAW_OptionalFiles.lua")

local function RAW_ModuleLoadStarted()
    Ext.Utils.Print("\n======================================================================")
    Ext.Utils.Print(CentralizedString("[RAW:BootstrapShared.lua] ModuleLoadStarted Start"))
    Ext.Utils.Print("======================================================================\n")

    -- RAW_OptionalFiles()

    Ext.Utils.Print("\n======================================================================")
    Ext.Utils.Print(CentralizedString("[RAW:BootstrapShared.lua] ModuleLoadStarted Ended"))
    Ext.Utils.Print("======================================================================\n")
end

Ext.Events.ModuleLoadStarted:Subscribe(RAW_ModuleLoadStarted)

-- StatsLoaded Event
local RAW_StatsLoadedPath = "StatsLoaded/"

Ext.Require(RAW_StatsLoadedPath .. "RAW_CharacterPassives_Model.lua")
Ext.Require(RAW_StatsLoadedPath .. "RAW_CharacterPassives.lua")

Ext.Require(RAW_StatsLoadedPath .. "RAW_Spells_BonusAction_Model.lua")
Ext.Require(RAW_StatsLoadedPath .. "RAW_Spells_BonusAction.lua")

Ext.Require(RAW_StatsLoadedPath .. "RAW_WeaponSpells_Model.lua")
Ext.Require(RAW_StatsLoadedPath .. "RAW_WeaponSpells.lua")

Ext.Require(RAW_StatsLoadedPath .. "RAW_WeaponThrown_Model.lua")
Ext.Require(RAW_StatsLoadedPath .. "RAW_WeaponThrown.lua")

local function RAW_StatsLoaded()
    Ext.Utils.Print("\n======================================================================")
    Ext.Utils.Print(CentralizedString("[RAW:BootstrapShared.lua] StatsLoaded Start"))
    Ext.Utils.Print("======================================================================\n")

    RAW_CharacterPassives()
    RAW_Spells_BonusAction()
    RAW_WeaponSpells()
    RAW_WeaponThrown()

    Ext.Utils.Print("\n======================================================================")
    Ext.Utils.Print(CentralizedString("[RAW:BootstrapShared.lua] StatsLoaded Ended"))
    Ext.Utils.Print("======================================================================\n")
end

Ext.Events.StatsLoaded:Subscribe(RAW_StatsLoaded)
