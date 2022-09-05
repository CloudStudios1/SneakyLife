AtlantisRPEvent = TriggerServerEvent

RegisterNetEvent('Sneakyesx_addons_gcphone:call')
AddEventHandler('Sneakyesx_addons_gcphone:call', function(data)
	if data.message == nil then
		DisplayOnscreenKeyboard(1, 'FMMC_MPM_NA', '', '', '', '', '', 200)
 
		while UpdateOnscreenKeyboard() == 0 do
			DisableAllControlActions(0)
			Citizen.Wait(0)
		end

		if GetOnscreenKeyboardResult() then
			data.message = GetOnscreenKeyboardResult()
		end
	end

	if data.message ~= nil and data.message ~= '' then
		local coords = GetEntityCoords(PlayerPedId(), false)

		AtlantisRPEvent('Sneakyesx_addons_gcphone:startCall', data.number, data.message, {
			x = coords.x,
			y = coords.y,
			z = coords.z
		})
	end
end)

local LastSkin, PlayerLoaded, cam, isCameraActive

local open = false

local indexface2 = {}
local comp = {}
local isCameraActive = false
local FirstSpawn, zoomOffset, camOffset, heading = true, 0.0, 0.0, 90.0

function RefreshData()
    TriggerEvent("Sneakyskinchanger:getData", function(comp_, max)
        open = true
        comp = comp_
        for k,v in pairs(comp) do
            if v.value ~= 0 then
                indexface2[v.name] = v.value
            else
                indexface2[v.name] = 1
            end
            for i,value in pairs(max) do
                if i == v.name then
                    comp[k].max = value
                    comp[k].table = {}
                    for i = 0, value do
                        table.insert(comp[k].table, i)
                    end
                    break
                end
            end
        end
    end)
end

function ResetSkin()
    ESX.TriggerServerCallback('Sneakyesx_skin:getPlayerSkin', function(skin, jobSkin)
        local isMale = skin.sex == 0
        TriggerEvent('Sneakyskinchanger:loadDefaultModel', isMale, function()
            ESX.TriggerServerCallback('Sneakyesx_skin:getPlayerSkin', function(skin)
                TriggerEvent('Sneakyskinchanger:loadSkin', skin)
            end)
        end)
    end)
end

function SkinChanger()
    local face = RageUI.CreateMenu("", "Faite votre personnage", 0, 0,"root_cause","sneakylife")
    RageUI.Visible(face, not RageUI.Visible(face))
    zoomOffset = comp[1].zoomOffset
    camOffset = comp[1].camOffset
	FreezeEntityPosition(PlayerPedId(), true)
    while face do
        Citizen.Wait(0)
        RageUI.IsVisible(face, function()
            for k,v in pairs(comp) do
                if v.table[1] ~= nil then
                    RageUI.List(v.label, v.table, indexface2[v.name], nil, {}, true, {
                        onListChange = function(indexface, Items)
                            indexface2[v.name] = indexface;
                            TriggerEvent("Sneakyskinchanger:change", v.name, indexface - 1)
                            if v.componentId ~= nil then
                                SetPedComponentVariation(PlayerPedId(), v.componentId, indexface - 1, 0, 2)
                            end
                        end,
                        onSelected = function(indexface, Items)
							openValidate()
                        end,
                        onActive = function()
                            zoomOffset = comp[k].zoomOffset
                            camOffset = comp[k].camOffset
                        end,
                    })
                end
            end
        end, function()
    end)
        if not RageUI.Visible(face) then
			FreezeEntityPosition(PlayerPedId(), false)
            ResetSkin()
            face = RMenu:DeleteType('face', true)
        end
    end
end

function openValidate()
    local face = RageUI.CreateMenu("", "Faite votre personnage", 0, 0,"root_cause","sneakylife")
    RageUI.Visible(face, not RageUI.Visible(face))
    while face do
        Citizen.Wait(0)
        RageUI.IsVisible(face, function()
			RageUI.Button('Continuer de modifier mon personnage', nil, {}, true, {
				onSelected = function() 
					RefreshData()
					SkinChanger()
				end
			});
			RageUI.Button('~g~Validé le personnage', nil, {}, true, {
				onSelected = function() 
					TriggerEvent('Sneakyskinchanger:getSkin', function(skin)
						TriggerServerEvent('Sneakyesx_skin:save', skin)
						TriggerEvent('Sneakyskinchanger:loadSkin', skin)
					end)
					RageUI.CloseAll()
					ESX.ShowNotification('Bienvenue sur le Serveur ~n~Bon jeu à vous !')
				end
			});
        end, function()
    end)
        if not RageUI.Visible(face) then
			FreezeEntityPosition(PlayerPedId(), false)
            ResetSkin()
            face = RMenu:DeleteType('face', true)
        end
    end
end

AddEventHandler('playerSpawned', function()
	Citizen.CreateThread(function()
		while not PlayerLoaded do
			Citizen.Wait(100)
		end
		if FirstSpawn then
			ESX.TriggerServerCallback('Sneakyesx_skin:getPlayerSkin', function(skin, jobSkin)
				if skin == nil then
					TriggerEvent('Sneakyskinchanger:loadSkin', {sex = 0})
					Wait(2000)
					TriggerEvent("OpenCreatorMenu")
				else
					TriggerEvent('Sneakyskinchanger:loadSkin', skin)
                    ResetSkin()
				end
			end)
			FirstSpawn = false
		end
	end)
end)

RegisterNetEvent('Sneakyesx:playerLoaded')
AddEventHandler('Sneakyesx:playerLoaded', function(xPlayer)
	PlayerLoaded = true
end)

AddEventHandler('Sneakyesx_skin:getLastSkin', function(cb)
	cb(LastSkin)
end)

AddEventHandler('Sneakyesx_skin:setLastSkin', function(skin)
	LastSkin = skin
end)

RegisterNetEvent('ewen:openSkinMenu')
AddEventHandler('ewen:openSkinMenu', function()
    RefreshData()
    SkinChanger()
end)