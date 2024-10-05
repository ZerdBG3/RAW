function RAW_HasAnyStatus(list, entity)
    for _, status in ipairs(list) do
        if HasActiveStatus(entity, status) == 1 then
            return true
        end
    end

    return false
end

local function RAW_RegisterOnApplyAndOnTurnSpellEvents()
    PersistentVars = {}

    PersistentVars["RAW_OnTurnSpellDamageManager"] = {
        cloudOfDaggers = {
            statusId = "RAW_CLOUD_OF_DAGGERS_DAMAGE_RECEIVED",
            targets = {}
        },
        guardianOfFaith = {
            statusId = "RAW_GUARDIAN_OF_FAITH_ATTACKED",
            targets = {}
        },
        moonbeam = {
            statusId = "RAW_MOONBEAM_DAMAGE_RECEIVED",
            targets = {}
        },
        spiritGuardians = {
            statusId = "SPIRIT_GUARDIANS_DAMAGE_RECEIVED",
            targets = {}
        }
    }

    local RAW_SpiritGuardiansAuras = {
        "SPIRIT_GUARDIANS_NECROTIC",
        "SPIRIT_GUARDIANS_NECROTIC_4",
        "SPIRIT_GUARDIANS_NECROTIC_5",
        "SPIRIT_GUARDIANS_NECROTIC_6",
        "SPIRIT_GUARDIANS_RADIANT",
        "SPIRIT_GUARDIANS_RADIANT_4",
        "SPIRIT_GUARDIANS_RADIANT_5",
        "SPIRIT_GUARDIANS_RADIANT_6",
        "LOW_CAZADORSPALACE_DEADGIRL_STATUS"
    }

    Ext.Osiris.RegisterListener("StatusApplied", 4, "after", function(object, status, causee, storyActionID)
        for _, spell in pairs(PersistentVars["RAW_OnTurnSpellDamageManager"]) do
            if status == spell.statusId then
                local combatGuid = Osi.CombatGetGuidFor(object)

                if spell.targets[combatGuid] == nil then
                    spell.targets[combatGuid] = { combatId = combatGuid }
                end

                table.insert(spell.targets[combatGuid], object)
            end
        end
    end)

    Ext.Osiris.RegisterListener("StatusRemoved", 4, "after", function(object, status, causee, storyActionID)
        if status == "RAW_CURRENT_TURN" then
            local combatGuid = Osi.CombatGetGuidFor(object)
            for _, spell in pairs(PersistentVars["RAW_OnTurnSpellDamageManager"]) do
                if spell.targets ~= nil then
                    for _, combat in pairs(spell.targets) do
                        if combatGuid == combat.combatId then
                            for i, character in ipairs(combat) do
                                if character ~= nil and character ~= object then
                                    Osi.RemoveStatus(character, spell.statusId)
                                    table.remove(spell.targets[combatGuid], i)
                                elseif character == object and spell.targets[combatGuid][i] ~= nil then
                                    table.remove(spell.targets[combatGuid], i)
                                end
                            end
                        end
                    end
                end
            end
        end
    end)

    Ext.Osiris.RegisterListener("ForceMoveStarted", 3, "before", function(source, target, storyActionID)
        if Osi.HasActiveStatus(target, "RAW_SPIRIT_GUARDIANS_TECHNICAL") == 1 and not RAW_HasAnyStatus(RAW_SpiritGuardiansAuras, target) then
            Osi.RemoveStatus(target, "RAW_SPIRIT_GUARDIANS_TECHNICAL", source)
        end

        if not RAW_HasAnyStatus(RAW_SpiritGuardiansAuras, target) then
            Osi.ApplyStatus(target, "RAW_SPIRIT_GUARDIANS_FORCED", 0, 0, source)
        end
    end)

    Ext.Osiris.RegisterListener("CombatEnded", 1, "after", function(combatGuid)
        for _, spell in pairs(PersistentVars["RAW_OnTurnSpellDamageManager"]) do
            if spell.targets[combatGuid] ~= nil then spell.targets[combatGuid] = nil end
        end
    end)
end

function RAW_Spells_OnApplyAndOnTurn()
    RAW_PrintIfDebug("\n====================================================================================================", RAW_PrintTable_Spells_OnApplyAndOnTurn)
    RAW_PrintIfDebug(CentralizedString("Option: spells_onApplyAndOnTurn"), RAW_PrintTable_Spells_OnApplyAndOnTurn)

    if not IsModOptionEnabled("spells_onApplyAndOnTurn") then
        RAW_PrintIfDebug(CentralizedString("Disabled!"), RAW_PrintTable_Spells_OnApplyAndOnTurn)
        RAW_PrintIfDebug("====================================================================================================\n", RAW_PrintTable_Spells_OnApplyAndOnTurn)
        return
    end

    RAW_PrintIfDebug(CentralizedString("Enabled!"), RAW_PrintTable_Spells_OnApplyAndOnTurn)

    RAW_RegisterOnApplyAndOnTurnSpellEvents()

    RAW_PrintIfDebug("\n" .. CentralizedString("Finished registering OnTurn Spell Damage events"), RAW_PrintTable_Spells_OnApplyAndOnTurn)
    RAW_PrintIfDebug("====================================================================================================\n", RAW_PrintTable_Spells_OnApplyAndOnTurn)
end