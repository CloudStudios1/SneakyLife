-- 
-- AtlantisRP-Corp
-- Created by Kadir#6400
-- 
AtlantisRPEvent = TriggerServerEvent
getLaboratoireESX = function()
    ESX = nil
    while ESX == nil do
        TriggerEvent("Sneakyesx:getSharedObject", function(niceESX) ESX = niceESX end)
        Wait(500)
    end
    while ESX.GetPlayerData().job == nil do
    Citizen.Wait(10)
    end
    if ESX.IsPlayerLoaded() then
        ESX.PlayerData = ESX.GetPlayerData()
    end
end

function refreshLabList()
    getLaboratoireESX()
    ESX.TriggerServerCallback("sLaboratoire:getLab", function(ok)
        resultLab = ok
        print("[^3sLaboratoire^0]: Refresh all lab")
    end)
end

createdLab = function(type, name, price, pos)
    AtlantisRPEvent("sLaboratoire:createLab", type, name, price, pos)
end

deletedLab = function(type, name, id)
    AtlantisRPEvent("sLaboratoire:deleteLab", type, name, id)
end