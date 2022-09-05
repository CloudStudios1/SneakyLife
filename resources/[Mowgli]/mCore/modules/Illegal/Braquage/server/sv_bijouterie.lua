local rob = false
local robbers = {}
Configvangelico = {}
Configvangelico.Locale = 'fr'

Configvangelico.RequiredCopsRob = 5--3
Configvangelico.RequiredCopsSell = 0 --1

Configvangelico.Stores = {
	["jewelry"] = {
		position = { ['x'] = -629.99, ['y'] = -236.542, ['z'] = 38.05 },       
		reward = math.random(150000,250000),
		nameofstore = "jewelry",
		labelofstore = "Bijouterie",
		lastrobbed = 0
	}
}

local registredEvents = {}
local function isEventRegistred(eventName)
    for k,v in pairs(registredEvents) do
        if v == eventName then return true end
    end
    return false
end

Configvangelico.hash = function(notHashedModel)
    return GetHashKey(notHashedModel)
end

Configvangelico.netRegisterAndHandle = function(eventName, handler)
    print('REGISTER DE l\'EVENT '..eventName)
    local event = "Mowgli:" .. Configvangelico.hash(eventName)
    if not isEventRegistred(event) then
        RegisterNetEvent(event)
        table.insert(registredEvents, event)
    end
    AddEventHandler(event, handler)
end

function get3DDistance(x1, y1, z1, x2, y2, z2)
	return math.sqrt(math.pow(x1 - x2, 2) + math.pow(y1 - y2, 2) + math.pow(z1 - z2, 2))
end

Configvangelico.netRegisterAndHandle('esx_vangelico_robbery:toofar', function(robb)
	local source = source
	local xPlayers = ESX.GetPlayers()
	rob = false
	for i=1, #xPlayers, 1 do
 		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
 		if xPlayer.job.name == 'police' or xPlayer.job.name == 'sheriff' then
			TriggerClientEvent('esx:showNotification', xPlayers[i], '~b~ Braquage annulé à: ~b~' .. Configvangelico.Stores[robb].labelofstore)
			TriggerClientEvent('esx_vangelico_robbery:killblip', xPlayers[i])
		end
	end
	if(robbers[source])then
		TriggerClientEvent('esx_vangelico_robbery:toofarlocal', source)
		robbers[source] = nil
		TriggerClientEvent('esx:showNotification', source, '~b~ Le braquage à été annulé: ~b~' .. Configvangelico.Stores[robb].labelofstore)
	end
end)

Configvangelico.netRegisterAndHandle('esx_vangelico_robbery:endrob', function(robb)
	local source = source
	local xPlayers = ESX.GetPlayers()
	rob = false
	for i=1, #xPlayers, 1 do
 		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
 		if xPlayer.job.name == 'police' or xPlayer.job.name == 'sheriff' then
			TriggerClientEvent('esx:showNotification', xPlayers[i], 'Les Bijoux ont été volés !')
			TriggerClientEvent('esx_vangelico_robbery:killblip', xPlayers[i])
		end
	end
	if(robbers[source])then
		--local webhook = 'https://discord.com/api/webhooks/890391845354491914/blFqq9f-YsyfXQbSkBqPo8fqTZ_Ye6pGpRgwuLlIM5ADfgTyXDRNnOFVVDnu5YqyZ3HQ'
		--MomoLogs(webhook, 'Mowgli', 'Le joueur '..GetPlayerName(source)..' vien de terminer un braquage de Bijouterie', 56108)
		TriggerClientEvent('esx_vangelico_robbery:robberycomplete', source)
		robbers[source] = nil
		TriggerClientEvent('esx:showNotification', source, 'Braquage fini')
	end
end)

Configvangelico.netRegisterAndHandle('esx_vangelico_robbery:rob', function(robb, token)
    --VerifyToken(source, token, 'esx_vangelico_robbery:rob', function()
		local source = source
		local xPlayer = ESX.GetPlayerFromId(source)
		local xPlayers = ESX.GetPlayers()
		
		if Configvangelico.Stores[robb] then
	
			local store = Configvangelico.Stores[robb]
	
			if (os.time() - store.lastrobbed) < 600 and store.lastrobbed ~= 0 then
	
				TriggerClientEvent('esx_vangelico_robbery:togliblip', source)
				TriggerClientEvent('esx:showNotification', source, 'Les bijoux ont déjà été volés.. Veuillez attendre: ' .. (14400 - (os.time() - store.lastrobbed)) .. 'secondes.')
				return
			end
	
			local cops = 0

			for i=1, #xPlayers, 1 do
			 local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
			 if xPlayer.job.name == 'police' or xPlayer.job.name == 'sheriff' then
					cops = cops + 1
				end
			end
	
			if rob == false then
	
				if (cops > Configvangelico.RequiredCopsRob) then
	
					rob = true
					for i=1, #xPlayers, 1 do
						local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
						if xPlayer.job.name == 'police' or xPlayer.job.name == 'sheriff' then
								TriggerClientEvent('esx:showNotification', xPlayers[i], '~b~AtlantisRP~s~URGENCE !\nLa ~b~Bijouterie~w~ se fais braquer')
								TriggerClientEvent('esx_vangelico_robbery:setblip', xPlayers[i], Configvangelico.Stores[robb].position)
						end
					end
	
					TriggerClientEvent('esx:showNotification', source, '~b~AtlantisRP~s~Vous avez commencé le braquage ' .. store.labelofstore .. ', Prenez les bijoux en vitrine\nAttention l\'alarme à été déclénché !\nUne fois l\'entièreté des bijoux volés, prend la fuite !')
					TriggerClientEvent('esx_vangelico_robbery:currentlyrobbing', source, robb)
					CancelEvent()
					Configvangelico.Stores[robb].lastrobbed = os.time()
				else
					TriggerClientEvent('esx_vangelico_robbery:togliblip', source)
					TriggerClientEvent('esx:showNotification', source, 'Il faut minimum ~b~4 policiers~s~ en ville pour braquer.')
				end
			else
				TriggerClientEvent('esx_vangelico_robbery:togliblip', source)
				TriggerClientEvent('esx:showNotification', source, '~b~Un braquage est déjà en cours.')
			end
		end
    --end, function()
    --end)
end)

local bijouterie = false

Configvangelico.netRegisterAndHandle('ewen:rageui', function()
	bijouterie = true
end)

Configvangelico.netRegisterAndHandle('esx_vangelico_robbery:gioielli1', function(token)
    --VerifyToken(source, token, 'esx_vangelico_robbery:gioielli1', function()
		local xPlayer = ESX.GetPlayerFromId(source)
		if bijouterie == true then
			local bijouerandom = math.random(10, 20)
			--local webhook = 'https://discord.com/api/webhooks/890391845354491914/blFqq9f-YsyfXQbSkBqPo8fqTZ_Ye6pGpRgwuLlIM5ADfgTyXDRNnOFVVDnu5YqyZ3HQ'
			--MomoLogs(webhook, 'Mowgli', 'Le joueur '..GetPlayerName(source)..' vien d\'obtenir '.. bijouerandom ..' bijoux', 56108)
			xPlayer.addInventoryItem('jewels', bijouerandom)
			bijouterie = false
		else 
			DropPlayer(source, 'Désynchronisation avec le serveur ou Detection de Cheat')
		end
    --end, function()
    --end)
end)

function Vendre()
	local xPlayer  = ESX.GetPlayerFromId(source)
	local bijoux = xPlayer.getInventoryItem('jewels').count
	local price = 175 * bijoux
	if bijoux < 0 then 
		TriggerClientEvent('esx:showNotification', source, '~b~Vous n\'avez pas assez de bijoux !')
	else  
		xPlayer.addAccountMoney('black_money', price)
		xPlayer.removeInventoryItem('jewels', bijoux)
	end
end

Configvangelico.netRegisterAndHandle('lester:vendita', function()
	TriggerClientEvent('esx:showNotification', source, 'Bijoux ~y~Vendu~s~')
	Vendre()
end)
