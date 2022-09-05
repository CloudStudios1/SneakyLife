personal = {
    pedId = function()
        return PlayerPedId()
    end,

    headingped = function()
        return GetEntityHeading(personal.pedId())
    end
}

Sotek = {
	pointing = false,
	handsUp = false,
	crouched = false
}

function startPointing(plyPed)	
    ESX.Streaming.RequestAnimDict('anim@mp_point', function()
        SetPedConfigFlag(plyPed, 36, 1)
        TaskMoveNetworkByName(plyPed, 'task_mp_pointing', 0.5, 0, 'anim@mp_point', 24)
        RemoveAnimDict('anim@mp_point')
    end)
end
    
function stopPointing()
    local plyPed = personal.pedId()
    RequestTaskMoveNetworkStateTransition(plyPed, 'Stop')
    
    if not IsPedInjured(plyPed) then
        ClearPedSecondaryTask(plyPed)
    end
    
    SetPedConfigFlag(plyPed, 36, 0)
    ClearPedSecondaryTask(plyPed)
    pointing = false
end
    
function crouchandpointing(default)
    Citizen.CreateThread(function()
        while default do
                
            Citizen.Wait(100)
            if Sotek.crouched or Sotek.handsUp or Sotek.pointing then
                if not IsPedOnFoot(PlayerPedId()) then
                    ResetPedMovementClipset(plyPed, 0)
                    stopPointing()
                    Sotek.crouched, Sotek.handsUp, Sotek.pointing = false, false, false
                elseif Sotek.pointing then
                    local ped = PlayerPedId()
                    local camPitch = GetGameplayCamRelativePitch()
        
                    if camPitch < -70.0 then
                        camPitch = -70.0
                    elseif camPitch > 42.0 then
                        camPitch = 42.0
                    end
        
                    camPitch = (camPitch + 70.0) / 112.0
        
                    local camHeading = GetGameplayCamRelativeHeading()
                    local cosCamHeading = Cos(camHeading)
                    local sinCamHeading = Sin(camHeading)
        
                    if camHeading < -180.0 then
                        camHeading = -180.0
                    elseif camHeading > 180.0 then
                        camHeading = 180.0
                    end
        
                    camHeading = (camHeading + 180.0) / 360.0
                    local coords = GetOffsetFromEntityInWorldCoords(ped, (cosCamHeading * -0.2) - (sinCamHeading * (0.4 * camHeading + 0.3)), (sinCamHeading * -0.2) + (cosCamHeading * (0.4 * camHeading + 0.3)), 0.6)
                    local rayHandle, blocked = GetShapeTestResult(StartShapeTestCapsule(coords.x, coords.y, coords.z - 0.2, coords.x, coords.y, coords.z + 0.2, 0.4, 95, ped, 7))
        
                    SetTaskMoveNetworkSignalFloat(ped, 'Pitch', camPitch)
                    SetTaskMoveNetworkSignalFloat(ped, 'Heading', (camHeading * -1.0) + 1.0)
                    SetTaskMoveNetworkSignalBool(ped, 'isBlocked', blocked)
                    SetTaskMoveNetworkSignalBool(ped, 'isFirstPerson', N_0xee778f8c7e1142e2(N_0x19cafa3c87f7c2ff()) == 4)
                end
            end
        end
    end)
end

Keys.Register('B', 'B', 'Pointer du doigt', function()
	local plyPed = personal.pedId()

    if not PlayerIsDead then
        if not exports.inventaire:GetStateInventory() then
            if (DoesEntityExist(plyPed)) and (not IsEntityDead(plyPed)) and (IsPedOnFoot(plyPed)) then
                if Sotek.handsUp then
                    Sotek.handsUp = false
                end

                Sotek.pointing = not Sotek.pointing

                if Sotek.pointing then
                    startPointing(plyPed)
                    crouchandpointing(true)
                else
                    stopPointing(plyPed)
                    crouchandpointing(false)
                end
            end
        end
    end
end)