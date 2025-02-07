local modOption = "cantrips_scaling"
local debugLog = IsModOptionLogging(modOption)

local ENUM_RAW_CantripsScaling

---------------------------------------- STATS FUNCTION ----------------------------------------

function RAW_CantripsScaling()
    RAW_PrintIfDebug("\n====================================================================================================", debugLog)
    RAW_PrintIfDebug(CentralizedString("Option: " .. modOption), debugLog)

    if not IsModOptionEnabled(modOption) then
        RAW_PrintIfDebug(CentralizedString("Disabled!"), debugLog)
        RAW_PrintIfDebug(CentralizedString("Skipping the Cantrips Scaling changes"), debugLog)
        RAW_PrintIfDebug("====================================================================================================\n", debugLog)
        return
    end

    RAW_PrintIfDebug(CentralizedString("Enabled!"), debugLog)
    RAW_PrintIfDebug(CentralizedString("Starting the Cantrips Scaling changes"), debugLog)

    RAW_ApplyStaticData(ENUM_RAW_CantripsScaling, debugLog)

    RAW_PrintIfDebug("\n" .. CentralizedString("Finished the Cantrips Scaling changes"), debugLog)
    RAW_PrintIfDebug("====================================================================================================\n", debugLog)
end

---------------------------------------- MODELS ----------------------------------------

ENUM_RAW_CantripsScaling = {
    ["LevelMap"] = {
        -- D4Cantrip
        ["b183a804-e9c6-4990-8984-c76d3ed67a9f"] = {
            ["LevelMaps"] = {
                ["Type"] = "overwrite",
                ["Value"] = {
                    {
                        ["AmountOfDices"] = 1,
                        ["DiceValue"] = "D4",
                    },
                    {
                        ["AmountOfDices"] = 1,
                        ["DiceValue"] = "D4",
                    },
                    {
                        ["AmountOfDices"] = 1,
                        ["DiceValue"] = "D4",
                    },
                    {
                        ["AmountOfDices"] = 1,
                        ["DiceValue"] = "D4",
                    },
                    {
                        ["AmountOfDices"] = 2,
                        ["DiceValue"] = "D4",
                    },
                    {
                        ["AmountOfDices"] = 2,
                        ["DiceValue"] = "D4",
                    },
                    {
                        ["AmountOfDices"] = 2,
                        ["DiceValue"] = "D4",
                    },
                    {
                        ["AmountOfDices"] = 2,
                        ["DiceValue"] = "D4",
                    },
                    {
                        ["AmountOfDices"] = 2,
                        ["DiceValue"] = "D4",
                    },
                    {
                        ["AmountOfDices"] = 2,
                        ["DiceValue"] = "D4",
                    },
                    {
                        ["AmountOfDices"] = 3,
                        ["DiceValue"] = "D4",
                    },
                    {
                        ["AmountOfDices"] = 3,
                        ["DiceValue"] = "D4",
                    },
                },
            },
        },
        -- D6Cantrip
        ["dc4e3a14-ccc9-4177-8098-bfc3fcb18bc6"] = {
            ["LevelMaps"] = {
                ["Type"] = "overwrite",
                ["Value"] = {
                    ["1"] = {
                        ["AmountOfDices"] = 1,
                        ["DiceValue"] = "D6",
                    },
                    ["2"] = {
                        ["AmountOfDices"] = 1,
                        ["DiceValue"] = "D6",
                    },
                    ["3"] = {
                        ["AmountOfDices"] = 1,
                        ["DiceValue"] = "D6",
                    },
                    ["4"] = {
                        ["AmountOfDices"] = 1,
                        ["DiceValue"] = "D6",
                    },
                    ["5"] = {
                        ["AmountOfDices"] = 2,
                        ["DiceValue"] = "D6",
                    },
                    ["6"] = {
                        ["AmountOfDices"] = 2,
                        ["DiceValue"] = "D6",
                    },
                    ["7"] = {
                        ["AmountOfDices"] = 2,
                        ["DiceValue"] = "D6",
                    },
                    ["8"] = {
                        ["AmountOfDices"] = 2,
                        ["DiceValue"] = "D6",
                    },
                    ["9"] = {
                        ["AmountOfDices"] = 2,
                        ["DiceValue"] = "D6",
                    },
                    ["10"] = {
                        ["AmountOfDices"] = 2,
                        ["DiceValue"] = "D6",
                    },
                    ["11"] = {
                        ["AmountOfDices"] = 3,
                        ["DiceValue"] = "D6",
                    },
                    ["12"] = {
                        ["AmountOfDices"] = 3,
                        ["DiceValue"] = "D6",
                    },
                },
            },
        },
        -- D8Cantrip
        ["86c6a562-3e9b-4362-bfac-46a67069efa9"] = {
            ["LevelMaps"] = {
                ["Type"] = "overwrite",
                ["Value"] = {
                    ["1"] = {
                        ["AmountOfDices"] = 1,
                        ["DiceValue"] = "D8",
                    },
                    ["2"] = {
                        ["AmountOfDices"] = 1,
                        ["DiceValue"] = "D8",
                    },
                    ["3"] = {
                        ["AmountOfDices"] = 1,
                        ["DiceValue"] = "D8",
                    },
                    ["4"] = {
                        ["AmountOfDices"] = 1,
                        ["DiceValue"] = "D8",
                    },
                    ["5"] = {
                        ["AmountOfDices"] = 2,
                        ["DiceValue"] = "D8",
                    },
                    ["6"] = {
                        ["AmountOfDices"] = 2,
                        ["DiceValue"] = "D8",
                    },
                    ["7"] = {
                        ["AmountOfDices"] = 2,
                        ["DiceValue"] = "D8",
                    },
                    ["8"] = {
                        ["AmountOfDices"] = 2,
                        ["DiceValue"] = "D8",
                    },
                    ["9"] = {
                        ["AmountOfDices"] = 2,
                        ["DiceValue"] = "D8",
                    },
                    ["10"] = {
                        ["AmountOfDices"] = 2,
                        ["DiceValue"] = "D8",
                    },
                    ["11"] = {
                        ["AmountOfDices"] = 3,
                        ["DiceValue"] = "D8",
                    },
                    ["12"] = {
                        ["AmountOfDices"] = 3,
                        ["DiceValue"] = "D8",
                    },
                },
            },
        },
        -- D10Cantrip
        ["e18c6db5-f743-45dc-8fd9-786ea75242c8"] = {
            ["LevelMaps"] = {
                ["Type"] = "overwrite",
                ["Value"] = {
                    ["1"] = {
                        ["AmountOfDices"] = 1,
                        ["DiceValue"] = "D10",
                    },
                    ["2"] = {
                        ["AmountOfDices"] = 1,
                        ["DiceValue"] = "D10",
                    },
                    ["3"] = {
                        ["AmountOfDices"] = 1,
                        ["DiceValue"] = "D10",
                    },
                    ["4"] = {
                        ["AmountOfDices"] = 1,
                        ["DiceValue"] = "D10",
                    },
                    ["5"] = {
                        ["AmountOfDices"] = 2,
                        ["DiceValue"] = "D10",
                    },
                    ["6"] = {
                        ["AmountOfDices"] = 2,
                        ["DiceValue"] = "D10",
                    },
                    ["7"] = {
                        ["AmountOfDices"] = 2,
                        ["DiceValue"] = "D10",
                    },
                    ["8"] = {
                        ["AmountOfDices"] = 2,
                        ["DiceValue"] = "D10",
                    },
                    ["9"] = {
                        ["AmountOfDices"] = 2,
                        ["DiceValue"] = "D10",
                    },
                    ["10"] = {
                        ["AmountOfDices"] = 2,
                        ["DiceValue"] = "D10",
                    },
                    ["11"] = {
                        ["AmountOfDices"] = 3,
                        ["DiceValue"] = "D10",
                    },
                    ["12"] = {
                        ["AmountOfDices"] = 3,
                        ["DiceValue"] = "D10",
                    },
                },
            },
        },
        -- D12Cantrip
        ["67432a46-f078-4c62-bade-e5a0f96db334"] = {
            ["LevelMaps"] = {
                ["Type"] = "overwrite",
                ["Value"] = {
                    ["1"] = {
                        ["AmountOfDices"] = 1,
                        ["DiceValue"] = "D12",
                    },
                    ["2"] = {
                        ["AmountOfDices"] = 1,
                        ["DiceValue"] = "D12",
                    },
                    ["3"] = {
                        ["AmountOfDices"] = 1,
                        ["DiceValue"] = "D12",
                    },
                    ["4"] = {
                        ["AmountOfDices"] = 1,
                        ["DiceValue"] = "D12",
                    },
                    ["5"] = {
                        ["AmountOfDices"] = 2,
                        ["DiceValue"] = "D12",
                    },
                    ["6"] = {
                        ["AmountOfDices"] = 2,
                        ["DiceValue"] = "D12",
                    },
                    ["7"] = {
                        ["AmountOfDices"] = 2,
                        ["DiceValue"] = "D12",
                    },
                    ["8"] = {
                        ["AmountOfDices"] = 2,
                        ["DiceValue"] = "D12",
                    },
                    ["9"] = {
                        ["AmountOfDices"] = 2,
                        ["DiceValue"] = "D12",
                    },
                    ["10"] = {
                        ["AmountOfDices"] = 2,
                        ["DiceValue"] = "D12",
                    },
                    ["11"] = {
                        ["AmountOfDices"] = 3,
                        ["DiceValue"] = "D12",
                    },
                    ["12"] = {
                        ["AmountOfDices"] = 3,
                        ["DiceValue"] = "D12",
                    },
                },
            },
        },
        -- EldritchBlast
        ["ecad9e7a-389d-4789-ba69-898cfd34da3c"] = {
            ["LevelMaps"] = {
                ["Type"] = "overwrite",
                ["Value"] = {
                    ["1"] = 1,
                    ["2"] = 1,
                    ["3"] = 1,
                    ["4"] = 1,
                    ["5"] = 2,
                    ["6"] = 2,
                    ["7"] = 2,
                    ["8"] = 2,
                    ["9"] = 2,
                    ["10"] = 2,
                    ["11"] = 3,
                    ["12"] = 3,
                },
            },
        },
        -- MartialArts
        ["b4136c95-a4f9-4fc1-96bc-00310232d27a"] = {
            ["LevelMaps"] = {
                ["Type"] = "overwrite",
                ["Value"] = {
                    ["1"] = {
                        ["AmountOfDices"] = 1,
                        ["DiceValue"] = "D4",
                    },
                    ["2"] = {
                        ["AmountOfDices"] = 1,
                        ["DiceValue"] = "D4",
                    },
                    ["3"] = {
                        ["AmountOfDices"] = 1,
                        ["DiceValue"] = "D4",
                    },
                    ["4"] = {
                        ["AmountOfDices"] = 1,
                        ["DiceValue"] = "D4",
                    },
                    ["5"] = {
                        ["AmountOfDices"] = 1,
                        ["DiceValue"] = "D6",
                    },
                    ["6"] = {
                        ["AmountOfDices"] = 1,
                        ["DiceValue"] = "D6",
                    },
                    ["7"] = {
                        ["AmountOfDices"] = 1,
                        ["DiceValue"] = "D6",
                    },
                    ["8"] = {
                        ["AmountOfDices"] = 1,
                        ["DiceValue"] = "D6",
                    },
                    ["9"] = {
                        ["AmountOfDices"] = 1,
                        ["DiceValue"] = "D6",
                    },
                    ["10"] = {
                        ["AmountOfDices"] = 1,
                        ["DiceValue"] = "D6",
                    },
                    ["11"] = {
                        ["AmountOfDices"] = 1,
                        ["DiceValue"] = "D8",
                    },
                    ["12"] = {
                        ["AmountOfDices"] = 1,
                        ["DiceValue"] = "D8",
                    },
                },
            },
        },
    },
}
