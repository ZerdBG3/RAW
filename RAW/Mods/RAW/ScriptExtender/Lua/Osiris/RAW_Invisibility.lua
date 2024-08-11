local technicalRemovalTimerName = "RAW_Timer_CheckTechnicalInvisibilityRemoval"
local technicalRemovalTimerDuration = 500

local sneakAttemptTimerName = "RAW_Timer_SneakAttempt"
local sneakAttemptTimerDuration = 100

local function RAW_RegisterInvisibilityControlEvent()
    -- ----------------------------------------------------------------------------
    -- --------------------- Technical Invisibility Control -----------------------
    -- ----------------------------------------------------------------------------

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

            RAW_PrintIfDebug("Sneaking successful: applying RAW_INVISIBILITY_SNEAKING_TECHNICAL to " .. char, RAW_PrintTable_Invisible)
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

            RAW_PrintIfDebug("No longer revealed: applying RAW_INVISIBILITY_SNEAKING_TECHNICAL to " .. char, RAW_PrintTable_Invisible)
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

            RAW_PrintIfDebug("Applying SNEAKING back to " .. char, RAW_PrintTable_Invisible)
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

            RAW_PrintIfDebug("StatusRemoved " .. status .. " from " .. char, RAW_PrintTable_Invisible)
            RAW_PrintIfDebug("\tLaunching timer for " .. char, RAW_PrintTable_Invisible)

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

            RAW_PrintIfDebug("ObjectTimerFinished " .. timer .. " for entity " .. char, RAW_PrintTable_Invisible)

            if not RAW_Bool(Osi.HasActiveStatus(char, "SNEAKING")) or not RAW_Bool(Osi.HasActiveStatusWithGroup(char, "SG_Invisible")) then
                RAW_PrintIfDebug("\tRemoving  RAW_INVISIBILITY_SNEAKING_TECHNICAL from " .. char, RAW_PrintTable_Invisible)
                Osi.RemoveStatus(char, "RAW_INVISIBILITY_SNEAKING_TECHNICAL")
            end
        end
    )

    -- --------------------------------------------------------------------------------
    -- --------------------- Free Sneaking Invisibility Attempt -----------------------
    -- --------------------------------------------------------------------------------

    -- Non-players that become invisible receive the RAW_INVISIBILITY_SNEAKING_ATTEMPT status
    -- This will prompt one stealth check against the passive perception of each enemy around
    -- Won't trigger the sneaking attempt if the character is being seen by SEE_INVISIBILITY or is already SNEAKING
    -- A timer is launched to check if there was a stealth failure or not
    Ext.Osiris.RegisterListener("StatusApplied", 4, "after",
        function(char, status, causee, storyActionID)
            if not RAW_Bool(Osi.IsStatusFromGroup(status, "SG_Invisible")) or
                not RAW_Bool(Osi.IsCharacter(char)) or
                RAW_Bool(Osi.IsPlayer(char)) or
                RAW_Bool(Osi.HasActiveStatus(char, "SEE_INVISIBILITY_REVEAL")) or
                RAW_Bool(Osi.HasActiveStatus(char, "SNEAKING")) then

                return
            end

            RAW_PrintIfDebug("Applying free RAW_INVISIBILITY_SNEAKING_ATTEMPT to " .. char, RAW_PrintTable_Invisible)
            Osi.ApplyStatus(char, "RAW_INVISIBILITY_SNEAKING_ATTEMPT", 0)
            Osi.RealtimeObjectTimerLaunch(char, sneakAttemptTimerName, sneakAttemptTimerDuration)
        end
    )

    -- When the timer above finishes, check if the character doesn't have RAW_INVISIBILITY_SNEAKING_ATTEMPT_CONTEST_FAILED
    Ext.Osiris.RegisterListener("ObjectTimerFinished", 2, "after",
        function(char, timer)
            if timer ~= sneakAttemptTimerName then
                return
            end

            RAW_PrintIfDebug("ObjectTimerFinished " .. timer .. " for entity " .. char, RAW_PrintTable_Invisible)

            if RAW_Bool(Osi.HasActiveStatus(char, "RAW_INVISIBILITY_SNEAKING_ATTEMPT_CONTEST_FAILED")) then
                RAW_PrintIfDebug("\tFailed stealth check " .. char, RAW_PrintTable_Invisible)
                Osi.RemoveStatus(char, "RAW_INVISIBILITY_SNEAKING_ATTEMPT_CONTEST_FAILED")
                return
            end

            if not RAW_Bool(Osi.HasActiveStatus(char, "RAW_INVISIBILITY_SNEAKING_TECHNICAL")) and
                not RAW_Bool(Osi.HasActiveStatus(char, "SEE_INVISIBILITY_REVEAL")) and 
                RAW_Bool(Osi.HasActiveStatusWithGroup(char, "SG_Invisible")) then

                RAW_PrintIfDebug("\tSucceeded stealth check " .. char, RAW_PrintTable_Invisible)
                Osi.ApplyStatus(char, "RAW_INVISIBILITY_SNEAKING_TECHNICAL", -1)
            end
        end
    )
end

function RAW_InvisibilityServer()
    RAW_PrintIfDebug("\n====================================================================================================", RAW_PrintTable_Invisible)
    RAW_PrintIfDebug(CentralizedString("Option: invisibility"), RAW_PrintTable_Invisible)

    if not IsModOptionEnabled("invisibility") then
        RAW_PrintIfDebug(CentralizedString("Disabled!"), RAW_PrintTable_Invisible)
        RAW_PrintIfDebug("====================================================================================================\n", RAW_PrintTable_Invisible)
        return
    end

    RAW_PrintIfDebug(CentralizedString("Enabled!"), RAW_PrintTable_Invisible)

    RAW_RegisterInvisibilityControlEvent()

    RAW_PrintIfDebug("\n" .. CentralizedString("Finished registering the Invisibility listeners"), RAW_PrintTable_Invisible)
    RAW_PrintIfDebug("====================================================================================================\n", RAW_PrintTable_Invisible)
end
