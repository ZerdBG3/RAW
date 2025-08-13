local modOption = "shortRest"
local debugLog = IsModOptionLogging(modOption)

local userClassesHitDiceFileName = "shortRest/Classes_HitDice.json"

local RAW_DefaultHitDice = "8"
local RAW_HitDiceStatusBase = "RAW_HIT_DICE_"
local RAW_HitDiceUsedHelper = "RAW_HIT_DICE_HELPER_"
local RAW_HitDiceRemainingStatusSuffix = "_LEFT_"

local ENUM_RAW_ShortRestClassesHitDice
local ENUM_RAW_HitDiceValues = {"12", "10", "8", "6"}
local RAW_ShortRestCharacterHitDice = {}

local function RAW_ResetShortRestCharacterTable(char)
    RAW_PrintIfDebug("\tResetting RAW_ShortRestCharacterHitDice for " .. char, debugLog)
    RAW_ShortRestCharacterHitDice[char] = {}
    for _, hitDice in pairs(ENUM_RAW_HitDiceValues) do
        RAW_ShortRestCharacterHitDice[char][hitDice] = 0
    end
end

local function RAW_StartShortRestUsedHitDiceVar(entity, clear)
    local usedHitDice = entity.Vars.RAW_ShortRestUsedHitDiceVar
    if usedHitDice == nil then
        RAW_PrintIfDebug("\tInitializing RAW_ShortRestUsedHitDiceVar for " .. entity.Uuid.EntityUuid, debugLog)
        usedHitDice = {}
    end
    for _, hitDice in pairs(ENUM_RAW_HitDiceValues) do
        if clear or usedHitDice[hitDice] == nil then
            usedHitDice[hitDice] = 0
        end
    end
    entity.Vars.RAW_ShortRestUsedHitDiceVar = usedHitDice
end

local function RAW_CalculateCharacterHitDice(char, entity)
    RAW_ResetShortRestCharacterTable(char)
    local classes = entity.Classes["Classes"]

    for _, class in pairs(classes) do
        local classLevel = class.Level
        local hitDice = ENUM_RAW_ShortRestClassesHitDice[class.ClassUUID]
        if hitDice ~= nil then
            RAW_ShortRestCharacterHitDice[char][hitDice] = RAW_ShortRestCharacterHitDice[char][hitDice] + classLevel
        else
            RAW_ShortRestCharacterHitDice[char][RAW_DefaultHitDice] = RAW_ShortRestCharacterHitDice[char][RAW_DefaultHitDice] + classLevel
        end
    end
    RAW_PrintIfDebug("\tCharacter " .. char .. " total hitDice:", debugLog)
    RAW_PrintIfDebug(RAW_ShortRestCharacterHitDice[char], debugLog)
end

local function RAW_GiveRegainHPSpells(char)
    for hitDice, amount in pairs (RAW_ShortRestCharacterHitDice[char]) do
        if amount > 0 then
            Osi.ApplyStatus(char, RAW_HitDiceStatusBase .. hitDice, -1)
        end
    end
end

local function RAW_ApplyRemainingHitDiceStatuses(char, entity)
    for _, hitDice in pairs(ENUM_RAW_HitDiceValues) do
        for remaining=0,20 do
            local remainingStatus = RAW_HitDiceStatusBase .. hitDice .. RAW_HitDiceRemainingStatusSuffix .. tostring(remaining)
            if RAW_Bool(Osi.HasActiveStatus(char, remainingStatus)) then
                Osi.RemoveStatus(char, remainingStatus)
            end
        end
    end

    for hitDice, used in pairs(entity.Vars.RAW_ShortRestUsedHitDiceVar) do
        local total = RAW_ShortRestCharacterHitDice[char][hitDice]
        if total > 0 then
            local remainingUses = total - used
            if remainingUses < 0 then
                remainingUses = 0
            end
            local remainingStatus = RAW_HitDiceStatusBase .. hitDice .. RAW_HitDiceRemainingStatusSuffix .. tostring(remainingUses)
            Osi.ApplyStatus(char, remainingStatus, -1)
            RAW_PrintIfDebug("\tCharacter " .. char .. " got " .. remainingStatus, debugLog)
        end
    end
end

local function RAW_UseHitDice(entity, hitDice)
    entity.Vars.RAW_ShortRestUsedHitDiceVar[hitDice] = entity.Vars.RAW_ShortRestUsedHitDiceVar[hitDice] + 1
    entity.Vars.RAW_ShortRestUsedHitDiceVar = entity.Vars.RAW_ShortRestUsedHitDiceVar
    RAW_PrintIfDebug("\tCharacter " .. entity.Uuid.EntityUuid .. " used hitDice:", debugLog)
    RAW_PrintIfDebug(entity.Vars.RAW_ShortRestUsedHitDiceVar, debugLog)
end

local function RAW_LongRestRestoreHitDice(char, entity)
    local toRestore = 0
    for _, amount in pairs(RAW_ShortRestCharacterHitDice[char]) do
        toRestore = toRestore + amount
    end
    toRestore = math.ceil(toRestore/2)
    RAW_PrintIfDebug("\tCharacter " .. char .. " can restore " .. toRestore .. " hit dice", debugLog)

    local usedHitDice = entity.Vars.RAW_ShortRestUsedHitDiceVar
    for _, hitDie in pairs(ENUM_RAW_HitDiceValues) do
        if usedHitDice[hitDie] > 0 then
            local restored = math.min(toRestore, usedHitDice[hitDie])
            usedHitDice[hitDie] = usedHitDice[hitDie] - restored
            toRestore = toRestore - restored
            RAW_PrintIfDebug("\tCharacter " .. char .. " restored " .. tostring(restored) .. " d" .. hitDie, debugLog)
        end
        if toRestore == 0 then
            RAW_PrintIfDebug("\tCharacter " .. char .. " restored maximum amount of hit dice", debugLog)
            break
        end
    end
    entity.Vars.RAW_ShortRestUsedHitDiceVar = usedHitDice
end

local function RAW_RegisterShortRestEvents()
    Ext.Vars.RegisterUserVariable("RAW_ShortRestUsedHitDiceVar", {
        Server = true,
        Persistent = true,
    })

    Ext.Osiris.RegisterListener("StatusApplied", 4, "before",
        function(char, status, causee, applyStoryActionID)
            if status ~= "RAW_SHORT_REST" then
                return
            end

            local entity = Ext.Entity.Get(char)
            RAW_PrintIfDebug("Character " .. char .. " started Short Rest", debugLog)
            RAW_CalculateCharacterHitDice(char, entity)
            RAW_StartShortRestUsedHitDiceVar(entity, false)
            RAW_GiveRegainHPSpells(char)
            RAW_ApplyRemainingHitDiceStatuses(char, entity)
        end
    )

    Ext.Osiris.RegisterListener("StatusApplied", 4, "after",
        function(char, status, causee, applyStoryActionID)
            local hitDice = string.match(status, RAW_HitDiceUsedHelper .. "(%d+)")
            if hitDice == nil then
                return
            end

            local entity = Ext.Entity.Get(char)
            RAW_PrintIfDebug("Character " .. char .. " used a Hit Die d" .. hitDice, debugLog)
            RAW_CalculateCharacterHitDice(char, entity)
            RAW_StartShortRestUsedHitDiceVar(entity, false)
            RAW_UseHitDice(entity, hitDice)
            RAW_ApplyRemainingHitDiceStatuses(char, entity)
        end
    )

    Ext.Osiris.RegisterListener("UserCharacterLongRested", 2, "after",
        function(char, isFullRest)
            if not RAW_Bool(isFullRest) then
                RAW_PrintIfDebug("Character " .. char .. " took a Partial Rest - no Hit Dice Recovery", debugLog)
                return
            end

            local entity = Ext.Entity.Get(char)
            RAW_PrintIfDebug("Character " .. char .. " took a Long Rest", debugLog)
            RAW_CalculateCharacterHitDice(char, entity)
            RAW_StartShortRestUsedHitDiceVar(entity, false)
            RAW_LongRestRestoreHitDice(char, entity)
        end
    )

    Ext.Osiris.RegisterListener("RespecCompleted", 1, "after",
        function(char)
            local entity = Ext.Entity.Get(char)
            RAW_PrintIfDebug("Character " .. char .. " respecced", debugLog)
            RAW_StartShortRestUsedHitDiceVar(entity, true)
        end
    )

end


function RAW_ShortRestServer()
    RAW_PrintIfDebug("\n====================================================================================================", debugLog)
    RAW_PrintIfDebug(CentralizedString("Option: " .. modOption), debugLog)

    if not IsModOptionEnabled(modOption) then
        RAW_PrintIfDebug(CentralizedString("Disabled!"), debugLog)
        RAW_PrintIfDebug("====================================================================================================\n", debugLog)
        return
    end

    RAW_PrintIfDebug(CentralizedString("Enabled!"), debugLog)

    local RAW_UserShortRestHitDice = RAW_LoadCustomizableOptions(userClassesHitDiceFileName, "{}")
    if RAW_UserShortRestHitDice ~= nil then
        for class, hitDie in pairs(RAW_UserShortRestHitDice) do
            ENUM_RAW_ShortRestClassesHitDice[class] = hitDie
        end
        _D(ENUM_RAW_ShortRestClassesHitDice)
    end

    RAW_RegisterShortRestEvents()

    RAW_PrintIfDebug("\n" .. CentralizedString("Finished registering the Short Rest listeners"), debugLog)
    RAW_PrintIfDebug("====================================================================================================\n", debugLog)
end

---------------------------------------- MODELS ----------------------------------------

ENUM_RAW_ShortRestClassesHitDice = {
    ["d8cadb42-0ff9-4049-afaf-e5d78d06a399"] = "12", -- Barbarian
    ["92cd50b6-eb1b-4824-8adb-853e90c34c90"] = "8", -- Bard
    ["114e7aee-d1d4-4371-8d90-8a2080592faf"] = "8", -- Cleric
    ["457d0a6e-9da8-4f95-a225-18382f0e94b5"] = "8", -- Druid
    ["721dfac3-92d4-41f5-b773-b7072a86232f"] = "10", -- Fighter
    ["c4598bdb-fc07-40dd-a62c-90cc138bd76f"] = "8", -- Monk
    ["ff4d9497-023c-434a-bd14-82fc367e991c"] = "10", -- Paladin
    ["36be18ba-23db-4dff-bfa6-ae105ce43144"] = "10", -- Ranger
    ["e8b1eab0-ef11-40a2-8a0b-cee8d062bf2a"] = "8", -- Rogue
    ["784001e2-c96d-4153-beb6-2adbef5abc92"] = "6", -- Sorcerer
    ["b4225a4b-4bbe-4d97-9e3c-4719dbd1487c"] = "8", -- Warlock
    ["a865965f-501b-46e9-9eaa-7748e8c04d09"] = "6", -- Wizard
}
