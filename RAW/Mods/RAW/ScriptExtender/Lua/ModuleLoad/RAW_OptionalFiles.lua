local function overrideFiles(list)
    for _, override in pairs(list) do
        RAW_PrintIfDebug("Overriding path from: " .. override.from .. " to: " .. override.to, RAW_PrintTable_ModOptions)
        Ext.IO.AddPathOverride(override.from, override.to)
        RAW_PrintIfDebug("Registered PathOverride: " .. Ext.IO.GetPathOverride(override.from), RAW_PrintTable_ModOptions)
    end
end

function RAW_OptionalFiles()
    for _, attributes in pairs(ModOptions) do
        local files = attributes.files
        if attributes.enabled and files.enabled ~= nil then
            overrideFiles(files.enabled)
        end
        if not attributes.enabled and files.disabled ~= nil then
            overrideFiles(files.disabled)
        end
    end
end
