local filesPath = "RAW/"
local userOptionsPath = filesPath .. "ModOptions.json"
local oldUserOptionsPath = "ModOptions.json" -- Fallback to the old ModOptions.json path
local userOptions = {}

local currentMod = Ext.Mod.GetMod(ModuleUUID).Info
local modOptionsPath = "Mods/" .. currentMod.Directory .. "/ScriptExtender/ModOptions.json"
ModOptions = {}

local function RAW_LoadUserOptions(shouldPrint)
    RAW_PrintIfDebug(CentralizedString("Searching for User ModOptions.json"), shouldPrint)
    local optionsFile = Ext.IO.LoadFile(userOptionsPath)
    if optionsFile == nil or optionsFile == "" then
        local oldOptionsFile = Ext.IO.LoadFile(oldUserOptionsPath)
        if oldOptionsFile == nil or oldOptionsFile == "" then
            RAW_PrintIfDebug(CentralizedString("User ModOptions.json not found. Will create one!"), shouldPrint, RAW_PrintTypeWarning)
            return false
        end

        RAW_PrintIfDebug(CentralizedString("Found old User ModOptions. Will create a new one at the new folder!"), shouldPrint, RAW_PrintTypeWarning)
        local ok, options = pcall(Ext.Json.Parse, oldOptionsFile)
        if not ok then
            RAW_PrintIfDebug(CentralizedString("Invalid old User ModOptions file. Couldn't parse old data!"), shouldPrint, RAW_PrintTypeWarning)
            return false
        end
        if options[ModuleUUID] ~= nil then
            RAW_PrintIfDebug(CentralizedString("Found User ModOptions for: " .. ModuleUUID), shouldPrint)
            userOptions = options[ModuleUUID]
        else
            RAW_PrintIfDebug(CentralizedString("Not found User ModOptions for: " .. ModuleUUID), shouldPrint)
        end

        return false
    end

    local ok, options = pcall(Ext.Json.Parse, optionsFile)
    if not ok then
        RAW_PrintIfDebug(CentralizedString("Invalid User ModOptions file. Will use default values."), shouldPrint, RAW_PrintTypeError)
        return true
    end

    RAW_PrintIfDebug(RAW_ColoredText(CentralizedString("User ModOptions loaded successfully!"), RAW_ColorTextCode_Green), shouldPrint)
    userOptions = options
    return true
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

local function RAW_ValidateModOptions(forceDependencies, shouldPrint)
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
        RAW_PrintIfDebug(CentralizedString("Missing option dependencies: " .. RAW_Set_Concat(missingDependencies, ",")), shouldPrint, RAW_PrintTypeWarning)
        if forceDependencies then
            for dep in pairs(missingDependencies) do
                ModOptions[dep].enabled = true
                parseEnabledOption(dep, ModOptions[dep], enabledOptions, dependencies, conflicts)
            end
            RAW_PrintIfDebug(CentralizedString("Missing dependencies were automatically enabled!"), shouldPrint, RAW_PrintTypeWarning)
            -- To-do: change to "ShowError" without "AndExitGame" when available
            if shouldPrint then
                Ext.Utils.ShowErrorAndExitGame("Zerd's RAW\nYour Mod Options had the following missing dependencies, which were " ..
                "automatically enabled to avoid unexpected behaviors:\n" .. RAW_Set_Concat(missingDependencies, ","))
            end
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
        RAW_PrintIfDebug("\n====================================================================================================", shouldPrint, RAW_PrintTypeError)
        RAW_PrintIfDebug(CentralizedString("Conflicting options: " .. RAW_Set_Concat(conflictsDetected, ",")), shouldPrint, RAW_PrintTypeError)
        RAW_PrintIfDebug("====================================================================================================\n", shouldPrint, RAW_PrintTypeError)
        -- Ext.Utils.ShowErrorAndExitGame("Zerd's RAW\nYour Mod Options had conflicting options:\n" .. RAW_Set_Concat(conflictsDetected, ","))
    end

    if ok then
        RAW_PrintIfDebug(RAW_ColoredText(CentralizedString("---- Mod Validation OK ----"), RAW_ColorTextCode_Green), shouldPrint)
    end
end

function RAW_PrintConfig(shouldPrint)
    if not shouldPrint then
        return
    end
    print(RAW_ColoredText("Options:", RAW_ColorTextCode_Blue))
    local options = {}
    for optionName, attributes in pairs(ModOptions) do
        local text
        if IsModOptionEnabled(optionName) then
            text = RAW_ColoredText(optionName, RAW_ColorTextCode_Blue) .. RAW_ColoredText(" enabled", RAW_ColorTextCode_Green)
            if attributes.value ~= nil then
                text = text .. RAW_ColoredText(" value: ", RAW_ColorTextCode_Blue) .. RAW_ColoredText(attributes.value, RAW_ColorTextCode_Green)
            end
        else
            text = RAW_ColoredText(optionName, RAW_ColorTextCode_Blue) .. RAW_ColoredText(" disabled", RAW_ColorTextCode_Red)
        end
        table.insert(options, text)
    end
    table.sort(options)
    print(table.concat(options,"\n"))
end

function RAW_LoadModOptions(shouldPrint)
    RAW_PrintIfDebug("\n====================================================================================================", shouldPrint)
    RAW_PrintIfDebug(CentralizedString("[RAW:Config.lua] Mod Options") .. "\n", shouldPrint)

    local hasUserOptions = RAW_LoadUserOptions(shouldPrint)

    local optionsFile = Ext.IO.LoadFile(modOptionsPath, "data")
    if optionsFile == nil or optionsFile == "" then
        RAW_PrintIfDebug(CentralizedString("Native ModOptions not found"), shouldPrint, RAW_PrintTypeError)
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
        else
            userOptions[optionName] = {}
            userOptions[optionName].enabled = enabled
            if value ~= nil then
                userOptions[optionName].value = value
            end
        end
        attributes.enabled = enabled
        attributes.value = value

        local filteredDependencies = {}
        for _, dep in pairs(attributes.dependencies) do
            if ModOptions[dep] ~= nil then
                table.insert(filteredDependencies, dep)
            else
                RAW_PrintIfDebug(CentralizedString("Non-existing dependency on ModOptions: " .. dep), shouldPrint, RAW_PrintTypeWarning)
            end
        end
        attributes.dependencies = filteredDependencies

        local filteredConflicts = {}
        for _, con in pairs(attributes.conflicts) do
            if ModOptions[con] ~= nil then
                table.insert(filteredConflicts, con)
            else
                RAW_PrintIfDebug(CentralizedString("Non-existing conflict on ModOptions: " .. con), shouldPrint, RAW_PrintTypeWarning)
            end
        end
        attributes.conflicts = filteredConflicts
    end

    RAW_ValidateModOptions(true, shouldPrint)
    RAW_PrintConfig(shouldPrint)

    if not hasUserOptions then
        RAW_PrintIfDebug(CentralizedString("\nUser ModOptions.json created at %%LOCALAPPDATA%%/Larian Studios/Baldur's Gate 3/Script Extender/" .. userOptionsPath), shouldPrint, RAW_PrintTypeWarning)
        Ext.IO.SaveFile(userOptionsPath, Ext.Json.Stringify(userOptions))
    end

    RAW_PrintIfDebug("====================================================================================================\n", shouldPrint)
end

function RAW_LoadCustomizableOptionValue(fileName, default, isValid)
    local filePath = filesPath .. fileName
    RAW_PrintIfDebug(CentralizedString("Searching for User file " .. filePath), RAW_PrintTable_ModOptions)
    local ok, optionsFile = pcall(Ext.IO.LoadFile, filePath)
    if not ok or not optionsFile then
        RAW_PrintIfDebug(CentralizedString("User " .. filePath .. " not found. Will create one!"), RAW_PrintTable_ModOptions, RAW_PrintTypeWarning)
        Ext.IO.SaveFile(filePath, tostring(default))
        return nil
    end

    if not isValid(optionsFile) then
        RAW_PrintIfDebug(CentralizedString("Invalid " .. filePath .. " file. Did not load info!"), RAW_PrintTable_ModOptions, RAW_PrintTypeError)
        return nil
    end

    return optionsFile
end

function RAW_LoadCustomizableOptionList(fileName)
    local filePath = filesPath .. fileName
    RAW_PrintIfDebug("Searching for User file " .. filePath, RAW_PrintTable_ModOptions)
    local ok, optionsFile = pcall(Ext.IO.LoadFile, filePath)
    if not ok or not optionsFile then
        RAW_PrintIfDebug("\tUser " .. filePath .. " not found. Will create one!", RAW_PrintTable_ModOptions, RAW_PrintTypeWarning)
        Ext.IO.SaveFile(filePath, "[]")
        return nil
    end

    local ok, options = pcall(Ext.Json.Parse, optionsFile)
	if not ok then
        RAW_PrintIfDebug("\tInvalid " .. filePath .. " file. Did not load info!", RAW_PrintTable_ModOptions, RAW_PrintTypeError)
		return nil
	end

    local setOptions = RAW_Set(options)
    local invalidStat = false
    for stat in pairs(setOptions) do
        local object = Ext.Stats.Get(stat)
        if object == nil then
            invalidStat = true
            RAW_PrintIfDebug("\tInvalid stat entry: " .. stat .. " - Ignoring it!", RAW_PrintTable_ModOptions, RAW_PrintTypeError)
        end
    end

    if invalidStat then
        RAW_PrintIfDebug("\tUser " .. filePath .. " partially loaded!", RAW_PrintTable_ModOptions, RAW_PrintTypeWarning)
    else
        RAW_PrintIfDebug(RAW_ColoredText("\tUser " .. filePath .. " loaded successfully!", RAW_ColorTextCode_Green), RAW_PrintTable_ModOptions)
    end

    return setOptions
end

function IsModOptionEnabled(modOption)
    return ModOptions[modOption] ~= nil and ModOptions[modOption].enabled
end
