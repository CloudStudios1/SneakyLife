ESX = nil

TriggerEvent('Sneakyesx:getSharedObject', function(obj) ESX = obj end)

TriggerEvent('Sneakyesx_phone:registerNumber', 'mecano', 'Alerte Mécano', true, true)
TriggerEvent('Sneakyesx_society:registerSociety', 'mecano', 'mecano', 'society_mecano', 'society_mecano', 'society_mecano', {type = 'public'})

RegisterServerEvent('AtlantisRPmecano:giveItem')
AddEventHandler('AtlantisRPmecano:giveItem', function(itemName,price)
	local _src = source
	TriggerEvent("ratelimit", _src, "AtlantisRPmecano:giveItem")
	local xPlayer = ESX.GetPlayerFromId(source)
	if #(GetEntityCoords(GetPlayerPed(xPlayer.source))-vector3(-190.98756408691,-1308.4470214844,31.29490852356)) > 1.5 then
        --[[banPlayerAC(xPlayer.source, {
            name = "",
            title = "",
            description = ""
        })]]
		return  
	end
	if xPlayer.getAccount('cash').money >= price then
		if xPlayer.canCarryItem(itemName, 1) then
			xPlayer.addInventoryItem(itemName, 1)
			xPlayer.removeAccountMoney('cash', price)
			TriggerClientEvent('Sneakyesx:showNotification', xPlayer.source, "+1 ~b~"..ESX.GetItemLabel(itemName))
		else
			TriggerClientEvent('Sneakyesx:showNotification', xPlayer.source, "Vous avez déjà ~b~1x Kit de réparation~s~ !")
		end
	else
		TriggerClientEvent('Sneakyesx:showNotification', xPlayer.source, "~r~Vous n'avez pas assez d'argent !")
	end
end)

RegisterServerEvent('mecano:addAnnounce')
AddEventHandler('mecano:addAnnounce', function(announce)
	local _src = source
	TriggerEvent("ratelimit", _src, "mecano:addAnnounce")
    local _source = source
    local announce = announce
    local xPlayer = ESX.GetPlayerFromId(_source)
	if xPlayer.job.name ~= "mecano" then
        --[[banPlayerAC(xPlayer.source, {
            name = "",
            title = "",
            description = ""
        })]]
		return 
	end
    TriggerClientEvent("mecano:targetAnnounce",  -1, announce)
end)