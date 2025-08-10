local modOption = "shortRest"
local debugLog = IsModOptionLogging(modOption)

local ENUM_RAW_ShortRestLocalizationHandles = {
    ["h5f8707edgc150g4445gaefeg8fe0236fca03"] = "h8ff2772fg1e8ag4927gb7b2ga85b3601cb31",
    ["h5c980d92gdc9bg4a6dg998bg74dca19575e1"] = "h6e813ec6g8ba4g4fabgaa61g1fe89999fec5",
}

local function RAW_UpdateShortRestLocalizationStrings()
    for original, replacement in pairs(ENUM_RAW_ShortRestLocalizationHandles) do
        local newText = Ext.Loca.GetTranslatedString(replacement)
        Ext.Loca.UpdateTranslatedString(original, newText)
    end
end

function RAW_ShortRestLocalization()
    RAW_PrintIfDebug("\n====================================================================================================", debugLog)
    RAW_PrintIfDebug(CentralizedString("Option: " .. modOption), debugLog)

    if not IsModOptionEnabled(modOption) then
        RAW_PrintIfDebug(CentralizedString("Disabled!"), debugLog)
        RAW_PrintIfDebug("====================================================================================================\n", debugLog)
        return
    end

    RAW_PrintIfDebug(CentralizedString("Enabled!"), debugLog)

    RAW_UpdateShortRestLocalizationStrings()

    RAW_PrintIfDebug("\n" .. CentralizedString("Finished updating Short Rest translation strings"), debugLog)
    RAW_PrintIfDebug("====================================================================================================\n", debugLog)
end

