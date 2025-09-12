local modOption = "invisibility"
local debugLog = IsModOptionLogging(modOption)

local technicalRemovalTimerName = "RAW_Timer_CheckTechnicalInvisibilityRemoval"
local technicalRemovalTimerDuration = 500

local invisibilitySneakingAttemptIterator = "RAW_InvisibilitySneakingAttemptIterator_"
local invisibilitySneakingAttemptIteratorCompleted = "RAW_Completed_InvisibilitySneakingAttemptIterator_"
local RAW_Invisibility_Sneaking_Attempt = {}

local function RAW_RegisterInvisibilityControlEvent()
    -- ------------------------------------------------------------------------
    -- -------------------- Technical Invisibility Control --------------------
    -- ------------------------------------------------------------------------

    -- Sneaking while invisible gives the invisible character the RAW_INVISIBILITY_SNEAKING_TECHNICAL status
    --   unless they're being seen by SEE_INVISIBILITY
    Ext.Osiris.RegisterListener("StatusApplied", 4, "before",
        function(char, status, causee, applyStoryActionID)
            if status ~= "SNEAKING" or
                not RAW_Bool(Osi.IsCharacter(char)) or
                not RAW_Bool(Osi.HasActiveStatusWithGroup(char, "SG_Invisible")) or
                RAW_Bool(Osi.HasActiveStatus(char, "SEE_INVISIBILITY_REVEAL")) or
                RAW_Bool(Osi.HasActiveStatus(char, "RAW_INVISIBILITY_SNEAKING_TECHNICAL")) then

                return
            end

            RAW_PrintIfDebug("Sneaking successful: applying RAW_INVISIBILITY_SNEAKING_TECHNICAL to " .. char, debugLog)
            Osi.ApplyStatus(char, "RAW_INVISIBILITY_SNEAKING_TECHNICAL", -1)
        end
    )

    -- When SEE_INVISIBILITY_REVEAL, if the character is still invisible and hidden, gives back RAW_INVISIBILITY_SNEAKING_TECHNICAL
    Ext.Osiris.RegisterListener("StatusRemoved", 4, "after",
        function(char, status, causee, applyStoryActionID)
            if status ~= "SEE_INVISIBILITY_REVEAL" or
                not RAW_Bool(Osi.IsCharacter(char)) or
                not RAW_Bool(Osi.HasActiveStatusWithGroup(char, "SG_Invisible")) or
                not RAW_Bool(Osi.HasActiveStatus(char, "SNEAKING")) then

                return
            end

            RAW_PrintIfDebug("No longer revealed: applying RAW_INVISIBILITY_SNEAKING_TECHNICAL to " .. char, debugLog)
            Osi.ApplyStatus(char, "RAW_INVISIBILITY_SNEAKING_TECHNICAL", -1)
        end
    )

    -- Forces SNEAKING back into characters that lost it before RAW_INVISIBILITY_SNEAKING_TECHNICAL was properly applied
    --   or to those that gained it through RAW_INVISIBILITY_SNEAKING_ATTEMPT
    Ext.Osiris.RegisterListener("StatusApplied", 4, "after",
        function(char, status, causee, storyActionID)
            if status ~= "RAW_INVISIBILITY_SNEAKING_TECHNICAL" or
                not RAW_Bool(Osi.IsCharacter(char)) or
                RAW_Bool(Osi.HasActiveStatus(char, "SNEAKING")) then

                return
            end

            RAW_PrintIfDebug("Applying SNEAKING back to " .. char, debugLog)
            Osi.ApplyStatus(char, "SNEAKING", -1)
        end
    )

    -- When either SNEAKING or a SG_Invisible status is removed from a character that has RAW_INVISIBILITY_SNEAKING_TECHNICAL,
    --   launches a timer (needs to make sure it wasn't a wrongful removal of SNEAKING)
    Ext.Osiris.RegisterListener("StatusRemoved", 4, "after",
        function(char, status, causee, applyStoryActionID)
            if (status ~= "SNEAKING" and not RAW_Bool(Osi.IsStatusFromGroup(status, "SG_Invisible"))) or
                not RAW_Bool(Osi.IsCharacter(char)) or
                not RAW_Bool(Osi.HasActiveStatus(char, "RAW_INVISIBILITY_SNEAKING_TECHNICAL")) then

                return
            end

            RAW_PrintIfDebug("StatusRemoved " .. status .. " from " .. char, debugLog)
            RAW_PrintIfDebug("\tLaunching timer for " .. char, debugLog)

            Osi.RealtimeObjectTimerLaunch(char, technicalRemovalTimerName, technicalRemovalTimerDuration)
        end
    )

    -- When the timer above finishes, check if the character doesn't have both SNEAKING and SG_Invisible status,
    --  removing RAW_INVISIBILITY_SNEAKING_TECHNICAL if they don't
    Ext.Osiris.RegisterListener("ObjectTimerFinished", 2, "after",
        function(char, timer)
            if timer ~= technicalRemovalTimerName then
                return
            end

            RAW_PrintIfDebug("ObjectTimerFinished " .. timer .. " for entity " .. char, debugLog)

            if not RAW_Bool(Osi.HasActiveStatus(char, "SNEAKING")) or not RAW_Bool(Osi.HasActiveStatusWithGroup(char, "SG_Invisible")) then
                RAW_PrintIfDebug("\tRemoving  RAW_INVISIBILITY_SNEAKING_TECHNICAL from " .. char, debugLog)
                Osi.RemoveStatus(char, "RAW_INVISIBILITY_SNEAKING_TECHNICAL")
            end
        end
    )

    -- ----------------------------------------------------------------------------
    -- -------------------- Free Sneaking Invisibility Attempt --------------------
    -- ----------------------------------------------------------------------------

    -- When non-players become invisible, an iterator is launched for all nearby characters
    -- Every enemy in the 11m radius (same as default hearing radius) has their perception compared
    -- The enemy with the highest passive perception receives the RAW_INVISIBILITY_SNEAKING_ATTEMPT_CONTEST status
    -- This status forces an active stealth check vs passive perception, granting sneaking if succeeding
    -- If there is no enemy around, the invisible character instantly succeeds their sneaking
    Ext.Osiris.RegisterListener("StatusApplied", 4, "after",
        function(char, status, causee, storyActionID)
            if not RAW_Bool(Osi.IsStatusFromGroup(status, "SG_Invisible")) or
                not RAW_Bool(Osi.IsCharacter(char)) or
                RAW_Bool(Osi.IsPartyMember(char, 0)) or
                RAW_Bool(Osi.HasActiveStatus(char, "SEE_INVISIBILITY_REVEAL")) or
                RAW_Bool(Osi.HasActiveStatus(char, "SNEAKING")) then

                return
            end

            RAW_Invisibility_Sneaking_Attempt[char] = {}
            RAW_PrintIfDebug("Providing free sneaking attempt to " .. char, debugLog)
            -- The iterators always include the source of the iterator on their event names, because this is not fetchable otherwise
            Osi.IterateCharactersAround(
                char,
                11,
                invisibilitySneakingAttemptIterator .. char,
                invisibilitySneakingAttemptIteratorCompleted .. char
            )
        end
    )

    Ext.Osiris.RegisterListener("EntityEvent", 2, "after",
        function(char, event)
            local source = string.match(event, "^" .. invisibilitySneakingAttemptIterator .. "(.+)")
            if source == nil or
                source == char or
                not RAW_Bool(Osi.IsEnemy(source, char)) or
                not RAW_Bool(Osi.IsCharacter(char)) then

                return
            end

            RAW_PrintIfDebug("\tPerceptive enemy in range: " .. char, debugLog)
            table.insert(RAW_Invisibility_Sneaking_Attempt[source], char)
        end
    )

    -- Unintuitively, the entity on the finished event is not the source that launched the iterator, but instead
    --   NULL_00000000-0000-0000-0000-000000000000 as documented here:
    --   https://docs.larian.game/Osiris/API/CharacterLaunchIteratorAroundCharacter
    Ext.Osiris.RegisterListener("EntityEvent", 2, "after",
        function(entity, event)
            local source = string.match(event, "^" .. invisibilitySneakingAttemptIteratorCompleted .. "(.+)")
            if source == nil or
                not RAW_Bool(Osi.IsCharacter(source)) then

                return
            end

            local bestChar = nil
            local maxPerception = 0
            for _, char in pairs(RAW_Invisibility_Sneaking_Attempt[source]) do
                local perception = Osi.CalculatePassiveSkill(char, "Perception")
                if perception > maxPerception then
                    bestChar = char
                    maxPerception = perception
                end
            end

            RAW_Invisibility_Sneaking_Attempt[source] = nil

            if bestChar == nil or maxPerception <= 0 then
                RAW_PrintIfDebug("\tNo enemy in range. Successful sneaking!", debugLog)
                Osi.ApplyStatus(source, "RAW_INVISIBILITY_SNEAKING_TECHNICAL", -1)
                return
            end

            RAW_PrintIfDebug("\tMaximum perception: " .. tostring(maxPerception) .. " by " .. bestChar, debugLog)
            Osi.ApplyStatus(bestChar, "RAW_INVISIBILITY_SNEAKING_ATTEMPT_CONTEST", 0, 1, source)
        end
    )
end

function RAW_InvisibilityServer()
    RAW_PrintIfDebug("\n====================================================================================================", debugLog)
    RAW_PrintIfDebug(CentralizedString("Option: " .. modOption), debugLog)

    if not IsModOptionEnabled(modOption) then
        RAW_PrintIfDebug(CentralizedString("Disabled!"), debugLog)
        RAW_PrintIfDebug("====================================================================================================\n", debugLog)
        return
    end

    RAW_PrintIfDebug(CentralizedString("Enabled!"), debugLog)

    RAW_RegisterInvisibilityControlEvent()

    RAW_PrintIfDebug("\n" .. CentralizedString("Finished registering the Invisibility listeners"), debugLog)
    RAW_PrintIfDebug("====================================================================================================\n", debugLog)
end
