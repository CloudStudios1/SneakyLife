local isLoadoutLoaded, isPaused, isPlayerSpawned, isDead, pickups = false, false, false, false, {}
AtlantisRPEvent = TriggerServerEvent

RegisterNetEvent('Sneakyesx:playerLoaded')
AddEventHandler('Sneakyesx:playerLoaded', function(xPlayer)
	ESX.PlayerLoaded = true
	ESX.PlayerData = xPlayer
end)

RegisterNetEvent('Sneakyesx:setMaxWeight')
AddEventHandler('Sneakyesx:setMaxWeight', function(newMaxWeight)
	ESX.PlayerData.maxWeight = newMaxWeight
end)

AddEventHandler('playerSpawned', function(spawn, isFirstSpawn)
	while not ESX.PlayerLoaded do
		Citizen.Wait(10)
	end

	TriggerEvent('Sneakyesx:restoreLoadout')

	if isFirstSpawn then
		AtlantisRPEvent('Sneakyesx:positionSaveReady')
	end

	isLoadoutLoaded, isPlayerSpawned, isDead = true, true, false
	SetCanAttackFriendly(PlayerPedId(), true, true)
	NetworkSetFriendlyFireOption(true)
end)

AddEventHandler('Sneakyesx:onPlayerDeath', function() isDead = true end)
AddEventHandler('Sneakyskinchanger:loadDefaultModel', function() isLoadoutLoaded = false end)

AddEventHandler('Sneakyskinchanger:modelLoaded', function()
	while not ESX.PlayerLoaded do
		Citizen.Wait(1)
	end

	TriggerEvent('Sneakyesx:restoreLoadout')
end)

AddEventHandler('Sneakyesx:restoreLoadout', function()
	local playerPed = PlayerPedId()
	local ammoTypes = {}

	RemoveAllPedWeapons(playerPed, true)

	for i = 1, #ESX.PlayerData.loadout, 1 do
		local weaponName = ESX.PlayerData.loadout[i].name
		local weaponHash = GetHashKey(weaponName)

		GiveWeaponToPed(playerPed, weaponHash, 0, false, false)
		local ammoType = GetPedAmmoTypeFromWeapon(playerPed, weaponHash)

		for j = 1, #ESX.PlayerData.loadout[i].components, 1 do
			local weaponComponent = ESX.PlayerData.loadout[i].components[j]
			local componentHash = ESX.GetWeaponComponent(weaponName, weaponComponent).hash
			GiveWeaponComponentToPed(playerPed, weaponHash, componentHash)
		end

		if not ammoTypes[ammoType] then
			AddAmmoToPed(playerPed, weaponHash, ESX.PlayerData.loadout[i].ammo)
			ammoTypes[ammoType] = true
		end
	end

	isLoadoutLoaded = true
end)

RegisterNetEvent('Sneakyesx:setAccountMoney')
AddEventHandler('Sneakyesx:setAccountMoney', function(account)
	for i = 1, #ESX.PlayerData.accounts, 1 do
		if ESX.PlayerData.accounts[i].name == account.name then
			ESX.PlayerData.accounts[i] = account
			break
		end
	end
end)

RegisterNetEvent('Sneakyesx:addInventoryItem')
AddEventHandler('Sneakyesx:addInventoryItem', function(item)
	table.insert(ESX.PlayerData.inventory, item)
end)

RegisterNetEvent('Sneakyesx:removeInventoryItem')
AddEventHandler('Sneakyesx:removeInventoryItem', function(item, identifier)
	for i = 1, #ESX.PlayerData.inventory, 1 do
		if ESX.PlayerData.inventory[i].name == item.name and (not identifier or (item.unique and ESX.PlayerData.inventory[i].extra.identifier and ESX.PlayerData.inventory[i].extra.identifier == identifier)) then
			table.remove(ESX.PlayerData.inventory, i)
			break
		end
	end
end)

RegisterNetEvent('Sneakyesx:updateItemCount')
AddEventHandler('Sneakyesx:updateItemCount', function(add, itemName, count)
	for i = 1, #ESX.PlayerData.inventory, 1 do
		if ESX.PlayerData.inventory[i].name == itemName then
			ESX.PlayerData.inventory[i].count = count
			break
		end
	end
end)

RegisterNetEvent('Sneakyesx:setJob')
AddEventHandler('Sneakyesx:setJob', function(job)
	ESX.PlayerData.job = job
end)

RegisterNetEvent('Sneakyesx:setJob2')
AddEventHandler('Sneakyesx:setJob2', function(job2)
	ESX.PlayerData.job2 = job2
end)

RegisterNetEvent('Sneakyesx:setGroup')
AddEventHandler('Sneakyesx:setGroup', function(group, lastGroup)
	ESX.PlayerData.group = group
end)

RegisterNetEvent('Sneakyesx:addWeapon')
AddEventHandler('Sneakyesx:addWeapon', function(weaponName, weaponAmmo)
	local found = false

	for i = 1, #ESX.PlayerData.loadout, 1 do
		if ESX.PlayerData.loadout[i].name == weaponName then
			found = true
			break
		end
	end

	if not found then
		local playerPed = PlayerPedId()
		local weaponHash = GetHashKey(weaponName)
		local weaponLabel = ESX.GetWeaponLabel(weaponName)

		table.insert(ESX.PlayerData.loadout, {
			name = weaponName,
			ammo = weaponAmmo,
			label = weaponLabel,
			components = {}
		})

		GiveWeaponToPed(playerPed, weaponHash, weaponAmmo, false, false)
	end
end)

RegisterNetEvent('Sneakyesx:addWeaponComponent')
AddEventHandler('Sneakyesx:addWeaponComponent', function(weaponName, weaponComponent)
	for i = 1, #ESX.PlayerData.loadout, 1 do
		if ESX.PlayerData.loadout[i].name == weaponName then
			local component = ESX.GetWeaponComponent(weaponName, weaponComponent)

			if component then
				local found = false

				for j = 1, #ESX.PlayerData.loadout[i].components, 1 do
					if ESX.PlayerData.loadout[i].components[j] == weaponComponent then
						found = true
						break
					end
				end

				if not found then
					local playerPed = PlayerPedId()
					local weaponHash = GetHashKey(weaponName)
					table.insert(ESX.PlayerData.loadout[i].components, weaponComponent)
					GiveWeaponComponentToPed(playerPed, weaponHash, component.hash)
				end
			end
		end
	end
end)

RegisterNetEvent('Sneakyesx:setWeaponAmmo')
AddEventHandler('Sneakyesx:setWeaponAmmo', function(weaponName, weaponAmmo)
	for i = 1, #ESX.PlayerData.loadout, 1 do
		if ESX.PlayerData.loadout[i].name == weaponName then
			local playerPed = PlayerPedId()
			local weaponHash = GetHashKey(weaponName)

			ESX.PlayerData.loadout[i].ammo = weaponAmmo
			SetPedAmmo(playerPed, weaponHash, weaponAmmo)
			break
		end
	end
end)

RegisterNetEvent('Sneakyesx:removeWeapon')
AddEventHandler('Sneakyesx:removeWeapon', function(weaponName, ammo)
	for i = 1, #ESX.PlayerData.loadout, 1 do
		if ESX.PlayerData.loadout[i].name == weaponName then
			local playerPed = PlayerPedId()
			local weaponHash = GetHashKey(weaponName)
			local weaponLabel = ESX.GetWeaponLabel(weaponName)
			table.remove(ESX.PlayerData.loadout, i)
			RemoveWeaponFromPed(playerPed, weaponHash)

			if ammo then
				local pedAmmo = GetAmmoInPedWeapon(playerPed, weaponHash)
				local finalAmmo = math.floor(pedAmmo - ammo)
				SetPedAmmo(playerPed, weaponHash, finalAmmo)
			else
				SetPedAmmo(playerPed, weaponHash, 0)
			end

			break
		end
	end
end)

RegisterNetEvent('Sneakyesx:removeWeaponComponent')
AddEventHandler('Sneakyesx:removeWeaponComponent', function(weaponName, weaponComponent)
	for i = 1, #ESX.PlayerData.loadout, 1 do
		if ESX.PlayerData.loadout[i].name == weaponName then
			local component = ESX.GetWeaponComponent(weaponName, weaponComponent)

			if component then
				for j = 1, #ESX.PlayerData.loadout[i].components, 1 do
					if ESX.PlayerData.loadout[i].components[j] == weaponComponent then
						local playerPed = PlayerPedId()
						local weaponHash = GetHashKey(weaponName)
						table.insert(ESX.PlayerData.loadout[i].components, j)
						RemoveWeaponComponentFromPed(playerPed, weaponHash, component.hash)
						break
					end
				end
			end
		end
	end
end)

-- Commands
RegisterNetEvent('Sneakyesx:teleport')
AddEventHandler('Sneakyesx:teleport', function(coords)
	ESX.Game.Teleport(PlayerPedId(), coords)
end)

RegisterNetEvent('Sneakyesx:spawnVehicle')
AddEventHandler('Sneakyesx:spawnVehicle', function(model)
	model = (type(model) == 'number' and model or GetHashKey(model))

	if IsModelInCdimage(model) then
		local playerPed = PlayerPedId()
		local plyCoords = GetEntityCoords(playerPed)
		local plyHeading = GetEntityHeading(playerPed)
		ESX.Game.SpawnVehicle(model, plyCoords, plyHeading, function(vehicle)
			TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
			TriggerEvent('persistent-vehicles/register-vehicle', vehicle)
		end)
	else
		TriggerEvent('chat:addMessage', { args = { '^1SYSTEM', 'Invalid vehicle model.' } })
	end
end)

RegisterNetEvent('Sneakyesx:createPickup')
AddEventHandler('Sneakyesx:createPickup', function(pickupId, label, coords, type, name, components)
	local pickupObject

	ESX.Game.SpawnLocalObject('prop_cs_package_01', coords, function(obj)
		pickupObject = obj
	end)

	while not pickupObject do
		Citizen.Wait(10)
	end

	SetEntityAsMissionEntity(pickupObject, false, false)
	PlaceObjectOnGroundProperly(pickupObject)
	FreezeEntityPosition(pickupObject, true)

	pickups[pickupId] = {
		id = pickupId,
		obj = pickupObject,
		label = label,
		inRange = false,
		coords = coords
	}
end)

RegisterNetEvent('Sneakyesx:createMissingPickups')
AddEventHandler('Sneakyesx:createMissingPickups', function(missingPickups)
	for pickupId, pickup in pairs(missingPickups) do
		local pickupObject = nil

		ESX.Game.SpawnLocalObject('prop_cs_package_01', pickup.coords, function(obj)
			pickupObject = obj
		end)

		while pickupObject == nil do
			Citizen.Wait(10)
		end

		SetEntityAsMissionEntity(pickupObject, false, false)
		PlaceObjectOnGroundProperly(pickupObject)
		FreezeEntityPosition(pickupObject, true)

		pickups[pickupId] = {
			id = pickupId,
			obj = pickupObject,
			label = pickup.label,
			inRange = false,
			coords = pickup.coords
		}
	end
end)

RegisterNetEvent('Sneakyesx:removePickup')
AddEventHandler('Sneakyesx:removePickup', function(id)
	ESX.Game.DeleteObject(pickups[id].obj)
	pickups[id] = nil
end)

RegisterNetEvent('Sneakyesx:deleteVehicle')
AddEventHandler('Sneakyesx:deleteVehicle', function(radius)
	local playerPed = PlayerPedId()

	if radius and tonumber(radius) then
		radius = tonumber(radius) + 0.01
		local vehicles = ESX.Game.GetVehiclesInArea(GetEntityCoords(playerPed, false), radius)

		for i = 1, #vehicles, 1 do
			local attempt = 0

			while not NetworkHasControlOfEntity(vehicles[i]) and attempt < 100 and DoesEntityExist(vehicles[i]) do
				Citizen.Wait(100)
				NetworkRequestControlOfEntity(vehicles[i])
				attempt = attempt + 1
			end

			if DoesEntityExist(vehicles[i]) and NetworkHasControlOfEntity(vehicles[i]) then
				TriggerEvent('persistent-vehicles/forget-vehicle', vehicles[i])
				ESX.Game.DeleteVehicle(vehicles[i])
			end
		end
	else
		local vehicle, attempt = ESX.Game.GetVehicleInDirection(), 0

		if IsPedInAnyVehicle(playerPed, true) then
			vehicle = GetVehiclePedIsIn(playerPed, false)
		end

		while not NetworkHasControlOfEntity(vehicle) and attempt < 100 and DoesEntityExist(vehicle) do
			Citizen.Wait(100)
			NetworkRequestControlOfEntity(vehicle)
			attempt = attempt + 1
		end

		if DoesEntityExist(vehicle) and NetworkHasControlOfEntity(vehicle) then
			TriggerEvent('persistent-vehicles/forget-vehicle', vehicle)
			ESX.Game.DeleteVehicle(vehicle)
		end
	end
end)

-- Last position
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		local playerPed = PlayerPedId()

		if ESX.PlayerLoaded and isPlayerSpawned then
			if not IsEntityDead(playerPed) then
				ESX.PlayerData.lastPosition = GetEntityCoords(playerPed, false)
			end
		end

		if IsEntityDead(playerPed) and isPlayerSpawned then
			isPlayerSpawned = false
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		while not ESX.PlayerLoaded do
			Citizen.Wait(10)
		end

		local playerPed = PlayerPedId()
	
		if playerPed and playerPed ~= -1 then
			--while GetResourceState('spawnmanager') ~= 'started' do
				Citizen.Wait(10)
			--end

			TriggerEvent('spawnmanager:spawnPlayer', {model = `mp_m_freemode_01`, coords = ESX.PlayerData.lastPosition, heading = 0.0})
			return
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if NetworkIsSessionStarted() then
			AtlantisRPEvent('Sneakyesx:firstJoinProper')
			return
		end
	end
end)