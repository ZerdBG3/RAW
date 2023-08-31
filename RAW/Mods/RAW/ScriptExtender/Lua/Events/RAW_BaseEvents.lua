local RAW_EventsPath = "Events/"

Ext.Require(RAW_EventsPath .. "RAW_WeaponSpells_Model.lua")
Ext.Require(RAW_EventsPath .. "RAW_WeaponSpells.lua")

Ext.Require(RAW_EventsPath .. "RAW_WeaponThrown_Model.lua")
Ext.Require(RAW_EventsPath .. "RAW_WeaponThrown.lua")

local function RAW_StatsLoaded()
    Ext.Utils.Print("\n===================================================================")
    Ext.Utils.Print("           [RAW:BootstrapShared.lua] StatsLoaded Start")
    Ext.Utils.Print("===================================================================\n")

    RAW_WeaponSpells()
    RAW_WeaponThrown()

    Ext.Utils.Print("\n===================================================================")
    Ext.Utils.Print("           [RAW:BootstrapShared.lua] StatsLoaded Ended")
    Ext.Utils.Print("===================================================================\n")
end

Ext.Events.StatsLoaded:Subscribe(RAW_StatsLoaded)
