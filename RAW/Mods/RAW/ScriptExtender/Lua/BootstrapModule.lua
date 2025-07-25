-- Lib
Ext.Require("RAW_Lib.lua")

-- Config
Ext.Require("RAW_Config.lua")
RAW_LoadModOptions(true) -- To-do: remove the "true" parameter when the changes to RAW_Config.lua ShowError is made

local function overrideFiles(list)
    for _, override in pairs(list) do
        RAW_PrintIfDebug("Overriding path from: " .. override.from .. " to: " .. override.to, RAW_ShouldPrint_ModOptions)
        Ext.IO.AddPathOverride(override.from, override.to)
    end
end

for _, attributes in pairs(ModOptions) do
    local files = attributes.files
    if attributes.enabled and files.enabled ~= nil then
        overrideFiles(files.enabled)
    end
    if not attributes.enabled and files.disabled ~= nil then
        overrideFiles(files.disabled)
    end
end
