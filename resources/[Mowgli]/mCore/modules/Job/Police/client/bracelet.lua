Blips = {}

TimeForActualize = 5000 -- Temps d'actualisation
DeleteBlips = 4000 -- Temps ou blips se supprime

Blips = { -- https://docs.fivem.net/docs/game-references/blips/
    Sprite = 148, -- Type de blips
    Scale = 1.5, -- Grosseur du blips
    Colour = 13, -- Couleur du blips
}

RegisterNetEvent('xBracelet:blips')
AddEventHandler('xBracelet:blips', function(pPos, name)
    local blipId = AddBlipForCoord(pPos.x, pPos.y, pPos.z)
    SetBlipSprite(blipId, Blips.Sprite)
    SetBlipScale(blipId, Blips.Scale)
    SetBlipColour(blipId, Blips.Colour)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(("Bracelet de: %s"):format(name))
    EndTextCommandSetBlipName(blipId)
    Wait(DeleteBlips)
    RemoveBlip(blipId)
end)

Citizen.CreateThread(function()
    while true do
        TriggerServerEvent('xBracelet:check', GetEntityCoords(PlayerPedId()), GetPlayerName(PlayerId()))
        Citizen.Wait(TimeForActualize)
    end
end)