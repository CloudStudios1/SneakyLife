ESX = nil
TriggerEvent('Sneakyesx:getSharedObject', function(obj) ESX = obj end)

RegisterCommand("creator", function(source, args)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getGroup() ~= "user" then
        local id = args[1]
        if not id then
            TriggerClientEvent("Sneakyesx:showNotification", source, "~r~Vous n'avez pas saisie un ID !")
        else
            local tPlayer = ESX.GetPlayerFromId(id)
            if tPlayer then
                TriggerClientEvent("OpenCreatorMenu", id) 
            else
                TriggerClientEvent("Sneakyesx:showNotification", source, "~r~L'ID saisie est incorrecte !")
            end
        end
    end
end)

local instances = {}
 
RegisterServerEvent("instancecreator:set")
AddEventHandler("instancecreator:set", function(set)
    local _src = source
	TriggerEvent("ratelimit", _src, "instancecreator:set")
   exports.pmavoice:updateRoutingBucket(source,source)
end)

local instances2 = {}
RegisterServerEvent("instancecreator:reset")
AddEventHandler("instancecreator:reset", function(set)
    local _src = source
	TriggerEvent("ratelimit", _src, "instancecreator:reset")
    local src = source
   exports.pmavoice:updateRoutingBucket(source,set)
end)


RegisterNetEvent('core:CreateIdentity')
AddEventHandler('core:CreateIdentity', function(name, surname, height, birthday)
    local xPlayer = ESX.GetPlayerFromId(source)

    MySQL.Async.execute('UPDATE `users` SET `firstname` = @firstname, `lastname` = @lastname, `birthday` = @birthday, `height` = @height WHERE identifier = @identifier', {
      ['@identifier'] = xPlayer.identifier,
      ['@firstname'] = surname,
      ['@lastname'] = name,
      ['@height'] = height,
      ['@birthday'] = birthday,

    }, function(rowsChanged)
        if callback then
            callback(true)
        end
    end)
end)