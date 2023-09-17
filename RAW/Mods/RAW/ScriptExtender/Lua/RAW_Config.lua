local userOptionsPath = "ModOptions.json"
local userOptions = {}

local currentMod = Ext.Mod.GetMod(ModuleUUID).Info
local modOptionsPath = "Mods/" .. currentMod.Directory .. "/ScriptExtender/ModOptions.json"
-- local modOptionsPath = "Mods/RAW/ScriptExtender/ModOptions.json"
ModOptions = {}

local function RAW_LoadUserOptions()
    RAW_PrintIfDebug(CentralizedString("Searching for User ModOptions.json"), RAW_PrintTable_ModOptions)
    local optionsFile = Ext.IO.LoadFile(userOptionsPath)
    if optionsFile == nil or optionsFile == "" then
        RAW_PrintIfDebug(CentralizedString("User ModOptions.json not found"), RAW_PrintTable_ModOptions)
        return
    end

    local options = Ext.Json.Parse(optionsFile)
    if options[ModuleUUID] ~= nil then
        RAW_PrintIfDebug(CentralizedString("Found User ModOptions for: " .. ModuleUUID), RAW_PrintTable_ModOptions)
        userOptions = options[ModuleUUID]
    else
        RAW_PrintIfDebug(CentralizedString("Not found User ModOptions for: " .. ModuleUUID), RAW_PrintTable_ModOptions)
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

local function RAW_ValidateModOptions(forceDependencies)
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
        RAW_PrintIfDebug(CentralizedString("Missing option dependencies: " .. RAW_Set_Concat(missingDependencies, ",")), RAW_PrintTable_ModOptions, RAW_PrintTypeWarning)
        if forceDependencies then
            for dep in pairs(missingDependencies) do
                ModOptions[dep].enabled = true
                parseEnabledOption(dep, ModOptions[dep], enabledOptions, dependencies, conflicts)
            end
            RAW_PrintIfDebug(CentralizedString("Missing dependencies were automatically enabled!"), RAW_PrintTable_ModOptions, RAW_PrintTypeWarning)
            -- Ext.Utils.ShowErrorAndExitGame("Zerd's RAW\nYour Mod Options had the following missing dependencies, which were " ..
            -- "automatically enabled to avoid unexpected behaviors:\n" .. RAW_Set_Concat(missingDependencies, ","))
        end
    end

    local conflictsDetected = {}
    for con in pairs(conflicts) do
        if enabledOptions[con] then
            RAW_Set_Add(conflictsDetected, con)
        end
    end
    if next(conflictsDetected) ~= nil then
        ok = false
        RAW_PrintIfDebug("\n======================================================================", RAW_PrintTable_ModOptions, RAW_PrintTypeError)
        RAW_PrintIfDebug(CentralizedString("Conflicting options: " .. RAW_Set_Concat(conflictsDetected, ",")), RAW_PrintTable_ModOptions, RAW_PrintTypeError)
        RAW_PrintIfDebug("======================================================================\n", RAW_PrintTable_ModOptions, RAW_PrintTypeError)
        -- Ext.Utils.ShowErrorAndExitGame("Zerd's RAW\nYour Mod Options had conflicting options:\n" .. RAW_Set_Concat(conflictsDetected, ","))
    end

    if ok then
        RAW_PrintIfDebug(CentralizedString("---- Mod Validation OK ----"), RAW_PrintTable_ModOptions)
    end
end

function RAW_LoadModOptions()
    RAW_PrintIfDebug("\n======================================================================", RAW_PrintTable_ModOptions)
    RAW_PrintIfDebug(CentralizedString("[RAW:Config.lua] Mod Options") .. "\n", RAW_PrintTable_ModOptions)

    RAW_LoadUserOptions()

    RAW_PrintIfDebug(CentralizedString("Searching for ModOptions.json at: " .. modOptionsPath), RAW_PrintTable_ModOptions)
    local optionsFile = Ext.IO.LoadFile(modOptionsPath, "data")
    if optionsFile == nil or optionsFile == "" then
        RAW_PrintIfDebug(CentralizedString("ModOptions.json not found"), RAW_PrintTable_ModOptions, RAW_PrintTypeWarning)
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
                RAW_PrintIfDebug(CentralizedString("Non-existing dependency on ModOptions: " .. dep), RAW_PrintTable_ModOptions, RAW_PrintTypeWarning)
            end
        end
        attributes.dependencies = filteredDependencies

        local filteredConflicts = {}
        for _, con in pairs(attributes.conflicts) do
            if ModOptions[con] ~= nil then
                table.insert(filteredConflicts, con)
            else
                RAW_PrintIfDebug(CentralizedString("Non-existing conflict on ModOptions: " .. con), RAW_PrintTable_ModOptions, RAW_PrintTypeWarning)
            end
        end
        attributes.conflicts = filteredConflicts
    end

    RAW_ValidateModOptions(true)

    RAW_PrintIfDebug("======================================================================\n", RAW_PrintTable_ModOptions)
end

function IsModOptionEnabled(modOption)
    return ModOptions[modOption] ~= nil and ModOptions[modOption].enabled
end
