local userOptionsPath = "ModOptions.json"
local userOptions = {}

-- local currentMod = Ext.Mod.GetMod(ModuleUUID).Info
-- local modOptionsPath = "Mods/" .. currentMod.Directory .. "/ScriptExtender/ModOptions.json"
local modOptionsPath = "Mods/RAW/ScriptExtender/ModOptions.json"
ModOptions = {}

function RAW_LoadUserOptions()
    Ext.Utils.Print("Searching for User ModOptions.json")
    local optionsFile = Ext.IO.LoadFile(userOptionsPath)
    if optionsFile == nil or optionsFile == "" then
        Ext.Utils.Print("User ModOptions.json not found")
        return
    end

    local options = Ext.Json.Parse(optionsFile)
    if options[ModuleUUID] ~= nil then
        Ext.Utils.Print("Found User ModOptions for: " .. ModuleUUID)
        userOptions = options[ModuleUUID]
    else
        Ext.Utils.Print("Not found User ModOptions for: " .. ModuleUUID)
    end
end

function RAW_LoadModOptions()
    RAW_LoadUserOptions()

    Ext.Utils.Print("Searching for ModOptions.json at: " .. modOptionsPath)
    local optionsFile = Ext.IO.LoadFile(modOptionsPath, "data")
    if optionsFile == nil or optionsFile == "" then
        Ext.Utils.PrintWarning("ModOptions.json not found")
        return
    end

    ModOptions = Ext.Json.Parse(optionsFile)
    for optionName, attributes in pairs(ModOptions) do
        local userOption = userOptions[optionName]
        local enabled = attributes.enabled
        local value = attributes.value
        if userOption ~= nil  then
            if userOption.enabled ~= nil then
                enabled = userOption.enabled
            end
            if userOption.value ~= nil then
                value = userOption.value
            end

            enabled  = userOption.enabled or enabled
            value = userOption.value or value
        end
        attributes.enabled = enabled
        attributes.value = value

        local filteredDependencies = {}
        for _, dep in pairs(attributes.dependencies) do
            if ModOptions[dep] ~= nil then
                table.insert(filteredDependencies, dep)
            else
                Ext.Utils.PrintWarning("Non-existing dependency on ModOptions: ", dep)
            end
        end
        attributes.dependencies = filteredDependencies

        local filteredConflicts = {}
        for _, con in pairs(attributes.conflicts) do
            if ModOptions[con] ~= nil then
                table.insert(filteredConflicts, con)
            else
                Ext.Utils.PrintWarning("Non-existing conflict on ModOptions: ", con)
            end
        end
        attributes.conflicts = filteredConflicts
    end
end

local function parseEnabledOption(optionName, attributes, enabledOptions, dependencies, conflicts)
    RAW_Set_Add(enabledOptions, optionName)

    for _, dep in pairs(attributes.dependencies) do
        RAW_Set_Add(dependencies, dep)
    end

    for _, con in pairs(attributes.conflicts) do
        RAW_Set_Add(conflicts, con)
    end
end

local function checkMissingDependencies(enabledOptions, dependencies, missingDependencies)
    for dep in pairs(dependencies) do
        if (enabledOptions[dep] == nil or not enabledOptions[dep]) and not missingDependencies[dep] then
            RAW_Set_Add(missingDependencies, dep)
            if next(ModOptions[dep].dependencies) ~= nil then
                checkMissingDependencies(enabledOptions, RAW_Set(ModOptions[dep].dependencies), missingDependencies)
            end
        end
    end
end

function RAW_ValidateModOptions(forceDependencies)
    forceDependencies = forceDependencies or false
    local enabledOptions = {}
    local dependencies = {}
    local conflicts = {}
    for optionName, attributes in pairs(ModOptions) do
        if attributes.enabled then
            parseEnabledOption(optionName, attributes, enabledOptions, dependencies, conflicts)
        end
    end

    local ok = true
    local missingDependencies = {}
    checkMissingDependencies(enabledOptions, dependencies, missingDependencies)
    if next(missingDependencies) ~= nil then
        ok = false
        Ext.Utils.PrintWarning("\n======================================================================")
        Ext.Utils.PrintWarning(CentralizedString("Missing option dependency: " .. RAW_Set_Concat(missingDependencies, ",")))
        if forceDependencies then
            for dep in pairs(missingDependencies) do
                ModOptions[dep].enabled = true
                parseEnabledOption(dep, ModOptions[dep], enabledOptions, dependencies, conflicts)
            end
            Ext.Utils.PrintWarning(CentralizedString("Missing dependencies were automatically enabled!"))
        end
        Ext.Utils.PrintWarning("======================================================================\n")
    end

    local conflictsDetected = {}
    for con in pairs(conflicts) do
        if enabledOptions[con] then
            RAW_Set_Add(conflictsDetected, con)
        end
    end
    if next(conflictsDetected) ~= nil then
        ok = false
        Ext.Utils.PrintWarning("\n======================================================================")
        Ext.Utils.PrintWarning(CentralizedString("Conflicting options: " .. RAW_Set_Concat(conflictsDetected, ",")))
        Ext.Utils.PrintWarning("======================================================================\n")
    end

    if ok then
        Ext.Utils.Print("Mod Validation OK")
    end
end

RAW_LoadModOptions()
RAW_ValidateModOptions(true)
