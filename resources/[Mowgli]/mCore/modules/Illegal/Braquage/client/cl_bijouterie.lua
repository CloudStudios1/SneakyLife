local holdingup = false
local store = ""
local blipRobbery = nil

Configvangelico = {}
Configvangelico.Locale = 'fr'

Configvangelico.Stores = {
	["jewelry"] = {
		position = { ['x'] = -629.99, ['y'] = -236.542, ['z'] = 38.05 },       
		reward = math.random(100000,150000),
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

function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

function drawTxt(x,y ,width,height,scale, text, r,g,b,a, outline)
    SetTextFont(0)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    if(outline)then
	    SetTextOutline()
	end
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end

Configvangelico.netRegisterAndHandle('esx_vangelico_robbery:currentlyrobbing', function(robb)
	holdingup = true
	store = robb
end)

Configvangelico.netRegisterAndHandle('esx_vangelico_robbery:killblip', function()
    RemoveBlip(blipRobbery)
end)

Configvangelico.netRegisterAndHandle('esx_vangelico_robbery:setblip', function(position)
    blipRobbery = AddBlipForCoord(position.x, position.y, position.z)
    SetBlipSprite(blipRobbery , 161)
    SetBlipScale(blipRobbery , 2.0)
    SetBlipColour(blipRobbery, 3)
    PulseBlip(blipRobbery)
end)

Configvangelico.netRegisterAndHandle('esx_vangelico_robbery:toofarlocal', function(robb)
	holdingup = false
	ESX.ShowNotification('Le braquage va être annulé, vous ne gagnerez rien!')
	robbingName = ""
	incircle = false
end)


Configvangelico.netRegisterAndHandle('esx_vangelico_robbery:robberycomplete', function(robb)
	holdingup = false

		TriggerEvent('skinchanger:getSkin', function(skin)
	
		if skin.sex == 0 then

		local clothesSkin = {
		['bags_1'] = 41, ['bags_2'] = 0
		}
		TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)

		else

		local clothesSkin = {
		['bags_1'] = 41, ['bags_2'] = 0
		}
	    TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)

	    end
	    end)
	ESX.ShowNotification('~b~ Braquage terminé.~s~ ~h~ Fuis !')
	store = ""
	incircle = false
end)




incircle = false

hasrobbed = false
hasrobbed2 = false
hasrobbed3 = false
hasrobbed4 = false
hasrobbed5 = false
hasrobbed6 = false
hasrobbed7 = false
hasrobbed8 = false
hasrobbed9 = false
hasrobbed10 = false
hasrobbed11 = false
hasrobbed12 = false
hasrobbed13 = false
hasrobbed14 = false
hasrobbed15 = false
hasrobbed16 = false
hasrobbed17 = false
hasrobbed18 = false
hasrobbed19 = false
hasrobbed20 = false

function loadAnimDict( dict )  
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait( 5 )
    end
end 

Citizen.CreateThread(function()
      
	while true do
		local vangelicorobbery = 500
		local pos = GetEntityCoords(PlayerPedId(), true)

		for k,v in pairs(Configvangelico.Stores)do
			local pos2 = v.position

			if(Vdist(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z) < 15.0)then
				vangelicorobbery = 0
				if not holdingup then
					DrawMarker(1, v.position.x, v.position.y, v.position.z - 1, 0, 0, 0, 0, 0, 0, 2.001, 2.0001, 0.5001, 104, 0, 214, 255, 0, 0, 0, 0)

					if(Vdist(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z) < 1.0)then
						if (incircle == false) then
							DisplayHelpText('Prenez votre arme en main\net\n~r~Tirer pour déclencher la sonnerie')
						end
						incircle = true
						if IsPedShooting(PlayerPedId()) then

							gioielli1 = AddBlipForCoord(-626.5326, -238.3758, 38.05)
							SetBlipSprite(gioielli1,1)
							SetBlipColour(gioielli1,16742399)
							SetBlipScale(gioielli1,0.5)
							BeginTextCommandSetBlipName("STRING")
							AddTextComponentString('Bijoux')
							EndTextCommandSetBlipName(gioielli1)

							gioielli2 = AddBlipForCoord(-625.6032, -237.5273, 38.05)
							SetBlipSprite(gioielli2,1)
							SetBlipColour(gioielli2,16742399)
							SetBlipScale(gioielli2,0.5)
							BeginTextCommandSetBlipName("STRING")
							AddTextComponentString('Bijoux')
							EndTextCommandSetBlipName(gioielli2)

							gioielli3 = AddBlipForCoord(-626.9178, -235.5166, 38.05)
							SetBlipSprite(gioielli3,1)
							SetBlipColour(gioielli3,16742399)
							SetBlipScale(gioielli3,0.5)
							BeginTextCommandSetBlipName("STRING")
							AddTextComponentString('Bijoux')
							EndTextCommandSetBlipName(gioielli3)

							gioielli4 = AddBlipForCoord(-625.6701, -234.6061, 38.05)
							SetBlipSprite(gioielli4,1)
							SetBlipColour(gioielli4,16742399)
							SetBlipScale(gioielli4,0.5)
							BeginTextCommandSetBlipName("STRING")
							AddTextComponentString('Bijoux')
							EndTextCommandSetBlipName(gioielli4)


							gioielli5 = AddBlipForCoord(-626.8935, -233.0814, 38.05)
							SetBlipSprite(gioielli5,1)
							SetBlipColour(gioielli5,16742399)
							SetBlipScale(gioielli5,0.5)
							BeginTextCommandSetBlipName("STRING")
							AddTextComponentString('Bijoux')
							EndTextCommandSetBlipName(gioielli5)

							gioielli6 = AddBlipForCoord(-627.9514, -233.8582, 38.05)
							SetBlipSprite(gioielli6,1)
							SetBlipColour(gioielli6,16742399)
							SetBlipScale(gioielli6,0.5)
							BeginTextCommandSetBlipName("STRING")
							AddTextComponentString('Bijoux')
							EndTextCommandSetBlipName(gioielli6)

							gioielli7 = AddBlipForCoord(-624.5250, -231.0555, 38.05)
							SetBlipSprite(gioielli7,1)
							SetBlipColour(gioielli7,16742399)
							SetBlipScale(gioielli7,0.5)
							BeginTextCommandSetBlipName("STRING")
							AddTextComponentString('Bijoux')
							EndTextCommandSetBlipName(gioielli7)

							gioielli8 = AddBlipForCoord(-623.0003, -233.0833, 38.05)
							SetBlipSprite(gioielli8,1)
							SetBlipColour(gioielli8,16742399)
							SetBlipScale(gioielli8,0.5)
							BeginTextCommandSetBlipName("STRING")
							AddTextComponentString('Bijoux')
							EndTextCommandSetBlipName(gioielli8)

							gioielli9 = AddBlipForCoord(-620.1098, -233.3672, 38.05)
							SetBlipSprite(gioielli9,1)
							SetBlipColour(gioielli9,16742399)
							SetBlipScale(gioielli9,0.5)
							BeginTextCommandSetBlipName("STRING")
							AddTextComponentString('Bijoux')
							EndTextCommandSetBlipName(gioielli9)

							gioielli10 = AddBlipForCoord(-620.2979, -234.4196, 38.05)
							SetBlipSprite(gioielli10,1)
							SetBlipColour(gioielli10,16742399)
							SetBlipScale(gioielli10,0.5)
							BeginTextCommandSetBlipName("STRING")
							AddTextComponentString('Bijoux')
							EndTextCommandSetBlipName(gioielli10)

							gioielli11 = AddBlipForCoord(-619.0646, -233.5629, 38.05)
							SetBlipSprite(gioielli11,1)
							SetBlipColour(gioielli11,16742399)
							SetBlipScale(gioielli11,0.5)
							BeginTextCommandSetBlipName("STRING")
							AddTextComponentString('Bijoux')
							EndTextCommandSetBlipName(gioielli11)

							gioielli12 = AddBlipForCoord(-617.4846, -230.6598, 38.05)
							SetBlipSprite(gioielli12,1)
							SetBlipColour(gioielli12,16742399)
							SetBlipScale(gioielli12,0.5)
							BeginTextCommandSetBlipName("STRING")
							AddTextComponentString('Bijoux')
							EndTextCommandSetBlipName(gioielli12)

							gioielli13 = AddBlipForCoord(-618.3619, -229.4285, 38.05)
							SetBlipSprite(gioielli13,1)
							SetBlipColour(gioielli13,16742399)
							SetBlipScale(gioielli13,0.5)
							BeginTextCommandSetBlipName("STRING")
							AddTextComponentString('Bijoux')
							EndTextCommandSetBlipName(gioielli13)

							gioielli14 = AddBlipForCoord(-619.6064, -230.5518, 38.05)
							SetBlipSprite(gioielli14,1)
							SetBlipColour(gioielli14,16742399)
							SetBlipScale(gioielli14,0.5)
							BeginTextCommandSetBlipName("STRING")
							AddTextComponentString('Bijoux')
							EndTextCommandSetBlipName(gioielli14)

							gioielli15 = AddBlipForCoord(-620.8951, -228.6519, 38.05)
							SetBlipSprite(gioielli15,1)
							SetBlipColour(gioielli15,16742399)
							SetBlipScale(gioielli15,0.5)
							BeginTextCommandSetBlipName("STRING")
							AddTextComponentString('Bijoux')
							EndTextCommandSetBlipName(gioielli15)

							gioielli16 = AddBlipForCoord(-619.7905, -227.5623, 38.05)
							SetBlipSprite(gioielli16,1)
							SetBlipColour(gioielli16,16742399)
							SetBlipScale(gioielli16,0.5)
							BeginTextCommandSetBlipName("STRING")
							AddTextComponentString('Bijoux')
							EndTextCommandSetBlipName(gioielli16)

							gioielli17 = AddBlipForCoord(-620.6110, -226.4467, 38.05)
							SetBlipSprite(gioielli17,1)
							SetBlipColour(gioielli17,16742399)
							SetBlipScale(gioielli17,0.5)
							BeginTextCommandSetBlipName("STRING")
							AddTextComponentString('Bijoux')
							EndTextCommandSetBlipName(gioielli17)

							gioielli18 = AddBlipForCoord(-623.9951, -228.1755, 38.05)
							SetBlipSprite(gioielli18,1)
							SetBlipColour(gioielli18,16742399)
							SetBlipScale(gioielli18,0.5)
							BeginTextCommandSetBlipName("STRING")
							AddTextComponentString('Bijoux')
							EndTextCommandSetBlipName(gioielli18)

							gioielli19 = AddBlipForCoord(-624.8832, -227.8645, 38.05)
							SetBlipSprite(gioielli19,1)
							SetBlipColour(gioielli19,16742399)
							SetBlipScale(gioielli19,0.5)
							BeginTextCommandSetBlipName("STRING")
							AddTextComponentString('Bijoux')
							EndTextCommandSetBlipName(gioielli19)

							gioielli20 = AddBlipForCoord(-623.6746, -227.0025, 38.05)
							SetBlipSprite(gioielli20,1)
							SetBlipColour(gioielli20,16742399)
							SetBlipScale(gioielli20,0.5)
							BeginTextCommandSetBlipName("STRING")
							AddTextComponentString('Bijoux')
							EndTextCommandSetBlipName(gioielli20)	
							
							TriggerServerEvent('esx_vangelico_robbery:rob', k, token)
                        end
					elseif(Vdist(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z) > 1.0)then
						incircle = false
					end
				end
			end
		end

		if holdingup then
							if (GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), -626.5326, -238.3758, 38.05, true) < 0.5 ) then
								if (hasrobbed == false) then
							DisplayHelpText('Appuyez sur ~y~E~s~ pour ~b~récupérer~s~ les bijoux')
							if IsControlJustReleased(1, 51) then
								local player = GetPlayerPed( -1 )
								if not HasNamedPtfxAssetLoaded("scr_jewelheist") then
	                            RequestNamedPtfxAsset("scr_jewelheist")
                                end
                                while not HasNamedPtfxAssetLoaded("scr_jewelheist") do
	                            Citizen.Wait(0)
                                end
                                SetPtfxAssetNextCall("scr_jewelheist")
								StartParticleFxLoopedAtCoord("scr_jewel_cab_smash", -626.5326, -238.3758, 38.05, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
								loadAnimDict( "missheist_jewel" ) 
								TaskPlayAnim( player, "missheist_jewel", "smash_case", 8.0, 1.0, -1, 2, 0, 0, 0, 0 ) 
								DisplayHelpText('Collection de bijoux en cours ...')
								DrawSubtitleTimed(5000, 1)
								Citizen.Wait(5000)
								ClearPedTasksImmediately(PlayerPedId())
								RemoveBlip(gioielli1)
								MowgliClientUtils.toServer('ewen:rageui')
								MowgliClientUtils.toServer('esx_vangelico_robbery:gioielli1', token)
								PlaySound(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
								hasrobbed = true
							end
							end
							end

							if (GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), -625.6032, -237.5273, 38.05, true) < 0.5 ) then
								if (hasrobbed2 == false) then
							DisplayHelpText('Appuyez sur ~y~E~s~ pour ~b~récupérer~s~ les bijoux')
							if IsControlJustReleased(1, 51) then
								local player = GetPlayerPed( -1 )
								if not HasNamedPtfxAssetLoaded("scr_jewelheist") then
	                            RequestNamedPtfxAsset("scr_jewelheist")
                                end
                                while not HasNamedPtfxAssetLoaded("scr_jewelheist") do
	                            Citizen.Wait(0)
                                end
                                SetPtfxAssetNextCall("scr_jewelheist")
								StartParticleFxLoopedAtCoord("scr_jewel_cab_smash", -625.6032, -237.5273, 38.05, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
								loadAnimDict( "missheist_jewel" ) 
								TaskPlayAnim( player, "missheist_jewel", "smash_case", 8.0, 1.0, -1, 2, 0, 0, 0, 0 ) 
								DisplayHelpText('Collection de bijoux en cours ...')
								DrawSubtitleTimed(5000, 1)
								Citizen.Wait(5000)
								ClearPedTasksImmediately(PlayerPedId())
								RemoveBlip(gioielli2)
								MowgliClientUtils.toServer('ewen:rageui')
								MowgliClientUtils.toServer('esx_vangelico_robbery:gioielli1', token)
								PlaySound(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
								hasrobbed2 = true
							end
							end
							end

							if (GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), -626.9178, -235.5166, 38.05, true) < 0.5 ) then
								if (hasrobbed3 == false) then
							DisplayHelpText('Appuyez sur ~y~E~s~ pour ~b~récupérer~s~ les bijoux')
							if IsControlJustReleased(1, 51) then
								local player = GetPlayerPed( -1 )
								if not HasNamedPtfxAssetLoaded("scr_jewelheist") then
	                            RequestNamedPtfxAsset("scr_jewelheist")
                                end
                                while not HasNamedPtfxAssetLoaded("scr_jewelheist") do
	                            Citizen.Wait(0)
                                end
                                SetPtfxAssetNextCall("scr_jewelheist")
								StartParticleFxLoopedAtCoord("scr_jewel_cab_smash", -626.9178, -235.5166, 38.05, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
								loadAnimDict( "missheist_jewel" ) 
								TaskPlayAnim( player, "missheist_jewel", "smash_case", 8.0, 1.0, -1, 2, 0, 0, 0, 0 ) 
								DisplayHelpText('Collection de bijoux en cours ...')
								DrawSubtitleTimed(5000, 1)
								Citizen.Wait(5000)
								ClearPedTasksImmediately(PlayerPedId())
								RemoveBlip(gioielli3)
								MowgliClientUtils.toServer('ewen:rageui')
								MowgliClientUtils.toServer('esx_vangelico_robbery:gioielli1', token)
								PlaySound(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
								hasrobbed3 = true
							end
							end
							end

							if (GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), -625.6701, -234.6061, 38.05, true) < 0.5 ) then
								if (hasrobbed4 == false) then
							DisplayHelpText('Appuyez sur ~y~E~s~ pour ~b~récupérer~s~ les bijoux')
							if IsControlJustReleased(1, 51) then
								local player = GetPlayerPed( -1 )
								if not HasNamedPtfxAssetLoaded("scr_jewelheist") then
	                            RequestNamedPtfxAsset("scr_jewelheist")
                                end
                                while not HasNamedPtfxAssetLoaded("scr_jewelheist") do
	                            Citizen.Wait(0)
                                end
                                SetPtfxAssetNextCall("scr_jewelheist")
								StartParticleFxLoopedAtCoord("scr_jewel_cab_smash", -625.6701, -234.6061, 38.05, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
								loadAnimDict( "missheist_jewel" ) 
								TaskPlayAnim( player, "missheist_jewel", "smash_case", 8.0, 1.0, -1, 2, 0, 0, 0, 0 ) 
								DisplayHelpText('Collection de bijoux en cours ...')
								DrawSubtitleTimed(5000, 1)
								Citizen.Wait(5000)
								ClearPedTasksImmediately(PlayerPedId())
								RemoveBlip(gioielli4)
								MowgliClientUtils.toServer('ewen:rageui')
								MowgliClientUtils.toServer('esx_vangelico_robbery:gioielli1', token)
								PlaySound(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
								hasrobbed4 = true
							end
							end
							end

							if (GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), -626.8935, -233.0814, 38.05, true) < 0.5 ) then
								if (hasrobbed5 == false) then
							DisplayHelpText('Appuyez sur ~y~E~s~ pour ~b~récupérer~s~ les bijoux')
							if IsControlJustReleased(1, 51) then
								local player = GetPlayerPed( -1 )
								if not HasNamedPtfxAssetLoaded("scr_jewelheist") then
	                            RequestNamedPtfxAsset("scr_jewelheist")
                                end
                                while not HasNamedPtfxAssetLoaded("scr_jewelheist") do
	                            Citizen.Wait(0)
                                end
                                SetPtfxAssetNextCall("scr_jewelheist")
								StartParticleFxLoopedAtCoord("scr_jewel_cab_smash", -626.8935, -233.0814, 38.05, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
								loadAnimDict( "missheist_jewel" ) 
								TaskPlayAnim( player, "missheist_jewel", "smash_case", 8.0, 1.0, -1, 2, 0, 0, 0, 0 ) 
								DisplayHelpText('Collection de bijoux en cours ...')
								DrawSubtitleTimed(5000, 1)
								Citizen.Wait(5000)
								ClearPedTasksImmediately(PlayerPedId())
								RemoveBlip(gioielli5)
								MowgliClientUtils.toServer('ewen:rageui')
								MowgliClientUtils.toServer('esx_vangelico_robbery:gioielli1', token)
								PlaySound(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
                                hasrobbed5 = true
							end
							end
							end

							if (GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), -627.9514, -233.8582, 38.05, true) < 0.5 ) then
								if (hasrobbed6 == false) then
							DisplayHelpText('Appuyez sur ~y~E~s~ pour ~b~récupérer~s~ les bijoux')
							if IsControlJustReleased(1, 51) then
								local player = GetPlayerPed( -1 )
								if not HasNamedPtfxAssetLoaded("scr_jewelheist") then
	                            RequestNamedPtfxAsset("scr_jewelheist")
                                end
                                while not HasNamedPtfxAssetLoaded("scr_jewelheist") do
	                            Citizen.Wait(0)
                                end
                                SetPtfxAssetNextCall("scr_jewelheist")
								StartParticleFxLoopedAtCoord("scr_jewel_cab_smash", -627.9514, -233.8582, 38.05, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
								loadAnimDict( "missheist_jewel" ) 
								TaskPlayAnim( player, "missheist_jewel", "smash_case", 8.0, 1.0, -1, 2, 0, 0, 0, 0 ) 
								DisplayHelpText('Collection de bijoux en cours ...')
								DrawSubtitleTimed(5000, 1)
								Citizen.Wait(5000)
								ClearPedTasksImmediately(PlayerPedId())
								RemoveBlip(gioielli6)
								MowgliClientUtils.toServer('ewen:rageui')
								MowgliClientUtils.toServer('esx_vangelico_robbery:gioielli1', token)
								PlaySound(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
                                hasrobbed6 = true
							end
							end
							end

							if (GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), -624.5250, -231.0555, 38.05, true) < 0.5 ) then
								if (hasrobbed7 == false) then
							DisplayHelpText('Appuyez sur ~y~E~s~ pour ~b~récupérer~s~ les bijoux')
							if IsControlJustReleased(1, 51) then
								local player = GetPlayerPed( -1 )
								if not HasNamedPtfxAssetLoaded("scr_jewelheist") then
	                            RequestNamedPtfxAsset("scr_jewelheist")
                                end
                                while not HasNamedPtfxAssetLoaded("scr_jewelheist") do
	                            Citizen.Wait(0)
                                end
                                SetPtfxAssetNextCall("scr_jewelheist")
								StartParticleFxLoopedAtCoord("scr_jewel_cab_smash", -624.5250, -231.0555, 38.05, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
								loadAnimDict( "missheist_jewel" ) 
								TaskPlayAnim( player, "missheist_jewel", "smash_case", 8.0, 1.0, -1, 2, 0, 0, 0, 0 ) 
								DisplayHelpText('Collection de bijoux en cours ...')
								DrawSubtitleTimed(5000, 1)
								Citizen.Wait(5000)
								ClearPedTasksImmediately(PlayerPedId())
								RemoveBlip(gioielli7)
								MowgliClientUtils.toServer('ewen:rageui')
								MowgliClientUtils.toServer('esx_vangelico_robbery:gioielli1', token)
								PlaySound(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
                                hasrobbed7 = true
							end
							end
							end

							if (GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), -623.0003, -233.0833, 38.05, true) < 0.5 ) then
								if (hasrobbed8 == false) then
							DisplayHelpText('Appuyez sur ~y~E~s~ pour ~b~récupérer~s~ les bijoux')
							if IsControlJustReleased(1, 51) then
								local player = GetPlayerPed( -1 )
								if not HasNamedPtfxAssetLoaded("scr_jewelheist") then
	                            RequestNamedPtfxAsset("scr_jewelheist")
                                end
                                while not HasNamedPtfxAssetLoaded("scr_jewelheist") do
	                            Citizen.Wait(0)
                                end
                                SetPtfxAssetNextCall("scr_jewelheist")
								StartParticleFxLoopedAtCoord("scr_jewel_cab_smash", -623.0003, -233.0833, 38.05, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
								loadAnimDict( "missheist_jewel" ) 
								TaskPlayAnim( player, "missheist_jewel", "smash_case", 8.0, 1.0, -1, 2, 0, 0, 0, 0 ) 
								DisplayHelpText('Collection de bijoux en cours ...')
								DrawSubtitleTimed(5000, 1)
								Citizen.Wait(5000)
								ClearPedTasksImmediately(PlayerPedId())
								RemoveBlip(gioielli8)
								MowgliClientUtils.toServer('ewen:rageui')
								MowgliClientUtils.toServer('esx_vangelico_robbery:gioielli1', token)
								PlaySound(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
                                hasrobbed8 = true
							end
							end
							end

							if (GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), -620.1098, -233.3672, 38.05, true) < 0.5 ) then
							if (hasrobbed9 == false) then
							DisplayHelpText('Appuyez sur ~y~E~s~ pour ~b~récupérer~s~ les bijoux')
							if IsControlJustReleased(1, 51) then
								local player = GetPlayerPed( -1 )
								if not HasNamedPtfxAssetLoaded("scr_jewelheist") then
	                            RequestNamedPtfxAsset("scr_jewelheist")
                                end
                                while not HasNamedPtfxAssetLoaded("scr_jewelheist") do
	                            Citizen.Wait(0)
                                end
                                SetPtfxAssetNextCall("scr_jewelheist")
								StartParticleFxLoopedAtCoord("scr_jewel_cab_smash", -620.1098, -233.3672, 38.05, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
								loadAnimDict( "missheist_jewel" ) 
								TaskPlayAnim( player, "missheist_jewel", "smash_case", 8.0, 1.0, -1, 2, 0, 0, 0, 0 ) 
								DisplayHelpText('Collection de bijoux en cours ...')
								DrawSubtitleTimed(5000, 1)
								Citizen.Wait(5000)
								ClearPedTasksImmediately(PlayerPedId())
								RemoveBlip(gioielli9)
								MowgliClientUtils.toServer('ewen:rageui')
								MowgliClientUtils.toServer('esx_vangelico_robbery:gioielli1', token)
								PlaySound(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
                                hasrobbed9 = true
							end
							end
							end

							if (GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), -620.2979, -234.4196, 38.05, true) < 0.5 ) then
							if (hasrobbed10 == false) then
							DisplayHelpText('Appuyez sur ~y~E~s~ pour ~b~récupérer~s~ les bijoux')
							if IsControlJustReleased(1, 51) then
								local player = GetPlayerPed( -1 )
								if not HasNamedPtfxAssetLoaded("scr_jewelheist") then
	                            RequestNamedPtfxAsset("scr_jewelheist")
                                end
                                while not HasNamedPtfxAssetLoaded("scr_jewelheist") do
	                            Citizen.Wait(0)
                                end
                                SetPtfxAssetNextCall("scr_jewelheist")
								StartParticleFxLoopedAtCoord("scr_jewel_cab_smash", -620.2979, -234.4196, 38.05, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
								loadAnimDict( "missheist_jewel" ) 
								TaskPlayAnim( player, "missheist_jewel", "smash_case", 8.0, 1.0, -1, 2, 0, 0, 0, 0 ) 
								DisplayHelpText('Collection de bijoux en cours ...')
								DrawSubtitleTimed(5000, 1)
								Citizen.Wait(5000)
								ClearPedTasksImmediately(PlayerPedId())
								RemoveBlip(gioielli10)
								MowgliClientUtils.toServer('ewen:rageui')
								MowgliClientUtils.toServer('esx_vangelico_robbery:gioielli1', token)
								PlaySound(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
                                hasrobbed10 = true
							end
							end
							end

							if (GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), -619.0646, -233.5629, 38.05, true) < 0.5 ) then
							if (hasrobbed11 == false) then
							DisplayHelpText('Appuyez sur ~y~E~s~ pour ~b~récupérer~s~ les bijoux')
							if IsControlJustReleased(1, 51) then
								local player = GetPlayerPed( -1 )
								if not HasNamedPtfxAssetLoaded("scr_jewelheist") then
	                            RequestNamedPtfxAsset("scr_jewelheist")
                                end
                                while not HasNamedPtfxAssetLoaded("scr_jewelheist") do
	                            Citizen.Wait(0)
                                end
                                SetPtfxAssetNextCall("scr_jewelheist")
								StartParticleFxLoopedAtCoord("scr_jewel_cab_smash", -619.0646, -233.5629, 38.05, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
								loadAnimDict( "missheist_jewel" ) 
								TaskPlayAnim( player, "missheist_jewel", "smash_case", 8.0, 1.0, -1, 2, 0, 0, 0, 0 ) 
								DisplayHelpText('Collection de bijoux en cours ...')
								DrawSubtitleTimed(5000, 1)
								Citizen.Wait(5000)
								ClearPedTasksImmediately(PlayerPedId())
								RemoveBlip(gioielli11)
								MowgliClientUtils.toServer('ewen:rageui')
								MowgliClientUtils.toServer('esx_vangelico_robbery:gioielli1', token)
								PlaySound(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
                                hasrobbed11 = true
							end
							end
							end

							if (GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), -617.4846, -230.6598, 38.05, true) < 0.5 ) then
							if (hasrobbed12 == false) then
							DisplayHelpText('Appuyez sur ~y~E~s~ pour ~b~récupérer~s~ les bijoux')
							if IsControlJustReleased(1, 51) then
								local player = GetPlayerPed( -1 )
								if not HasNamedPtfxAssetLoaded("scr_jewelheist") then
	                            RequestNamedPtfxAsset("scr_jewelheist")
                                end
                                while not HasNamedPtfxAssetLoaded("scr_jewelheist") do
	                            Citizen.Wait(0)
                                end
                                SetPtfxAssetNextCall("scr_jewelheist")
								StartParticleFxLoopedAtCoord("scr_jewel_cab_smash", -617.4846, -230.6598, 38.05, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
								loadAnimDict( "missheist_jewel" ) 
								TaskPlayAnim( player, "missheist_jewel", "smash_case", 8.0, 1.0, -1, 2, 0, 0, 0, 0 ) 
								DisplayHelpText('Collection de bijoux en cours ...')
								DrawSubtitleTimed(5000, 1)
								Citizen.Wait(5000)
								ClearPedTasksImmediately(PlayerPedId())
								RemoveBlip(gioielli12)
								MowgliClientUtils.toServer('ewen:rageui')
								MowgliClientUtils.toServer('esx_vangelico_robbery:gioielli1', token)
								PlaySound(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
                                hasrobbed12 = true
							end
							end
							end

							if (GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), -618.3619, -229.4285, 38.05, true) < 0.5 ) then
							if (hasrobbed13 == false) then
							DisplayHelpText('Appuyez sur ~y~E~s~ pour ~b~récupérer~s~ les bijoux')
							if IsControlJustReleased(1, 51) then
								local player = GetPlayerPed( -1 )
								if not HasNamedPtfxAssetLoaded("scr_jewelheist") then
	                            RequestNamedPtfxAsset("scr_jewelheist")
                                end
                                while not HasNamedPtfxAssetLoaded("scr_jewelheist") do
	                            Citizen.Wait(0)
                                end
                                SetPtfxAssetNextCall("scr_jewelheist")
								StartParticleFxLoopedAtCoord("scr_jewel_cab_smash", -618.3619, -229.4285, 38.05, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
								loadAnimDict( "missheist_jewel" ) 
								TaskPlayAnim( player, "missheist_jewel", "smash_case", 8.0, 1.0, -1, 2, 0, 0, 0, 0 ) 
								DisplayHelpText('Collection de bijoux en cours ...')
								DrawSubtitleTimed(5000, 1)
								Citizen.Wait(5000)
								ClearPedTasksImmediately(PlayerPedId())
								RemoveBlip(gioielli13)
								MowgliClientUtils.toServer('ewen:rageui')
								MowgliClientUtils.toServer('esx_vangelico_robbery:gioielli1', token)
								PlaySound(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
                                hasrobbed13 = true
							end
							end
							end

							if (GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), -619.6064, -230.5518, 38.05, true) < 0.5 ) then
							if (hasrobbed14 == false) then
							DisplayHelpText('Appuyez sur ~y~E~s~ pour ~b~récupérer~s~ les bijoux')
							if IsControlJustReleased(1, 51) then
								local player = GetPlayerPed( -1 )
								if not HasNamedPtfxAssetLoaded("scr_jewelheist") then
	                            RequestNamedPtfxAsset("scr_jewelheist")
                                end
                                while not HasNamedPtfxAssetLoaded("scr_jewelheist") do
	                            Citizen.Wait(0)
                                end
                                SetPtfxAssetNextCall("scr_jewelheist")
								StartParticleFxLoopedAtCoord("scr_jewel_cab_smash", -619.6064, -230.5518, 38.05, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
								loadAnimDict( "missheist_jewel" ) 
								TaskPlayAnim( player, "missheist_jewel", "smash_case", 8.0, 1.0, -1, 2, 0, 0, 0, 0 ) 
								DisplayHelpText('Collection de bijoux en cours ...')
								DrawSubtitleTimed(5000, 1)
								Citizen.Wait(5000)
								ClearPedTasksImmediately(PlayerPedId())
								RemoveBlip(gioielli14)
								MowgliClientUtils.toServer('ewen:rageui')
								MowgliClientUtils.toServer('esx_vangelico_robbery:gioielli1', token)
								PlaySound(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
                                hasrobbed14 = true
							end
							end
							end

							if (GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), -620.8951, -228.6519, 38.05, true) < 0.5 ) then
							if (hasrobbed15 == false) then
							DisplayHelpText('Appuyez sur ~y~E~s~ pour ~b~récupérer~s~ les bijoux')
							if IsControlJustReleased(1, 51) then
								local player = GetPlayerPed( -1 )
								if not HasNamedPtfxAssetLoaded("scr_jewelheist") then
	                            RequestNamedPtfxAsset("scr_jewelheist")
                                end
                                while not HasNamedPtfxAssetLoaded("scr_jewelheist") do
	                            Citizen.Wait(0)
                                end
                                SetPtfxAssetNextCall("scr_jewelheist")
								StartParticleFxLoopedAtCoord("scr_jewel_cab_smash", -620.8951, -228.6519, 38.05, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
								loadAnimDict( "missheist_jewel" ) 
								TaskPlayAnim( player, "missheist_jewel", "smash_case", 8.0, 1.0, -1, 2, 0, 0, 0, 0 ) 
								DisplayHelpText('Collection de bijoux en cours ...')
								DrawSubtitleTimed(5000, 1)
								Citizen.Wait(5000)
								ClearPedTasksImmediately(PlayerPedId())
								RemoveBlip(gioielli15)
								MowgliClientUtils.toServer('ewen:rageui')
								MowgliClientUtils.toServer('esx_vangelico_robbery:gioielli1', token)
								PlaySound(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
                                hasrobbed15 = true
							end
							end
							end

							if (GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), -619.7905, -227.5623, 38.05, true) < 0.5 ) then
							if (hasrobbed16 == false) then
							DisplayHelpText('Appuyez sur ~y~E~s~ pour ~b~récupérer~s~ les bijoux')
							if IsControlJustReleased(1, 51) then
								local player = GetPlayerPed( -1 )
								if not HasNamedPtfxAssetLoaded("scr_jewelheist") then
	                            RequestNamedPtfxAsset("scr_jewelheist")
                                end
                                while not HasNamedPtfxAssetLoaded("scr_jewelheist") do
	                            Citizen.Wait(0)
                                end
                                SetPtfxAssetNextCall("scr_jewelheist")
								StartParticleFxLoopedAtCoord("scr_jewel_cab_smash", -619.7905, -227.5623, 38.05, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
								loadAnimDict( "missheist_jewel" ) 
								TaskPlayAnim( player, "missheist_jewel", "smash_case", 8.0, 1.0, -1, 2, 0, 0, 0, 0 ) 
								DisplayHelpText('Collection de bijoux en cours ...')
								DrawSubtitleTimed(5000, 1)
								Citizen.Wait(5000)
								ClearPedTasksImmediately(PlayerPedId())
								RemoveBlip(gioielli16)
								MowgliClientUtils.toServer('ewen:rageui')
								MowgliClientUtils.toServer('esx_vangelico_robbery:gioielli1', token)
								PlaySound(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
                                hasrobbed16 = true
							end
							end
							end

							if (GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), -620.6110, -226.4467, 38.05, true) < 0.5 ) then
							if (hasrobbed17 == false) then
							DisplayHelpText('Appuyez sur ~y~E~s~ pour ~b~récupérer~s~ les bijoux')
							if IsControlJustReleased(1, 51) then
								local player = GetPlayerPed( -1 )
								if not HasNamedPtfxAssetLoaded("scr_jewelheist") then
	                            RequestNamedPtfxAsset("scr_jewelheist")
                                end
                                while not HasNamedPtfxAssetLoaded("scr_jewelheist") do
	                            Citizen.Wait(0)
                                end
                                SetPtfxAssetNextCall("scr_jewelheist")
								StartParticleFxLoopedAtCoord("scr_jewel_cab_smash", -620.6110, -226.4467, 38.05, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
								loadAnimDict( "missheist_jewel" ) 
								TaskPlayAnim( player, "missheist_jewel", "smash_case", 8.0, 1.0, -1, 2, 0, 0, 0, 0 ) 
								DisplayHelpText('Collection de bijoux en cours ...')
								DrawSubtitleTimed(5000, 1)
								Citizen.Wait(5000)
								ClearPedTasksImmediately(PlayerPedId())
								RemoveBlip(gioielli17)
								MowgliClientUtils.toServer('ewen:rageui')
								MowgliClientUtils.toServer('esx_vangelico_robbery:gioielli1', token)
								PlaySound(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
                                hasrobbed17 = true
							end
							end
							end

							if (GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), -623.9951, -228.1755, 38.05, true) < 0.5 ) then
							if (hasrobbed18 == false) then
							DisplayHelpText('Appuyez sur ~y~E~s~ pour ~b~récupérer~s~ les bijoux')
							if IsControlJustReleased(1, 51) then
								local player = GetPlayerPed( -1 )
								if not HasNamedPtfxAssetLoaded("scr_jewelheist") then
	                            RequestNamedPtfxAsset("scr_jewelheist")
                                end
                                while not HasNamedPtfxAssetLoaded("scr_jewelheist") do
	                            Citizen.Wait(0)
                                end
                                SetPtfxAssetNextCall("scr_jewelheist")
								StartParticleFxLoopedAtCoord("scr_jewel_cab_smash", -623.9951, -228.1755, 38.05, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
								loadAnimDict( "missheist_jewel" ) 
								TaskPlayAnim( player, "missheist_jewel", "smash_case", 8.0, 1.0, -1, 2, 0, 0, 0, 0 ) 
								DisplayHelpText('Collection de bijoux en cours ...')
								DrawSubtitleTimed(5000, 1)
								Citizen.Wait(5000)
								ClearPedTasksImmediately(PlayerPedId())
								RemoveBlip(gioielli18)
								MowgliClientUtils.toServer('ewen:rageui')
								MowgliClientUtils.toServer('esx_vangelico_robbery:gioielli1', token)
								PlaySound(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
                                hasrobbed18 = true
							end
							end
							end

							if (GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), -624.8832, -227.8645, 38.05, true) < 0.5 ) then
							if (hasrobbed19 == false) then
							DisplayHelpText('Appuyez sur ~y~E~s~ pour ~b~récupérer~s~ les bijoux')
							if IsControlJustReleased(1, 51) then
								local player = GetPlayerPed( -1 )
								if not HasNamedPtfxAssetLoaded("scr_jewelheist") then
	                            RequestNamedPtfxAsset("scr_jewelheist")
                                end
                                while not HasNamedPtfxAssetLoaded("scr_jewelheist") do
	                            Citizen.Wait(0)
                                end
                                SetPtfxAssetNextCall("scr_jewelheist")
								StartParticleFxLoopedAtCoord("scr_jewel_cab_smash", -624.8832, -227.8645, 38.05, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
								loadAnimDict( "missheist_jewel" ) 
								TaskPlayAnim( player, "missheist_jewel", "smash_case", 8.0, 1.0, -1, 2, 0, 0, 0, 0 ) 
								DisplayHelpText('Collection de bijoux en cours ...')
								DrawSubtitleTimed(5000, 1)
								Citizen.Wait(5000)
								ClearPedTasksImmediately(PlayerPedId())
								RemoveBlip(gioielli19)
								MowgliClientUtils.toServer('ewen:rageui')
								MowgliClientUtils.toServer('esx_vangelico_robbery:gioielli1', token)
								PlaySound(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
                                hasrobbed19 = true
							end
							end
							end

							if (GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), -623.6746, -227.0025, 38.05, true) < 0.5 ) then
							if (hasrobbed20 == false) then
							DisplayHelpText('Appuyez sur ~y~E~s~ pour ~b~récupérer~s~ les bijoux')
							if IsControlJustReleased(1, 51) then
								local player = GetPlayerPed( -1 )
								if not HasNamedPtfxAssetLoaded("scr_jewelheist") then
	                            RequestNamedPtfxAsset("scr_jewelheist")
                                end
                                while not HasNamedPtfxAssetLoaded("scr_jewelheist") do
	                            Citizen.Wait(0)
                                end
                                SetPtfxAssetNextCall("scr_jewelheist")
								StartParticleFxLoopedAtCoord("scr_jewel_cab_smash", -623.6746, -227.0025, 38.05, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
								loadAnimDict( "missheist_jewel" ) 
								TaskPlayAnim( player, "missheist_jewel", "smash_case", 8.0, 1.0, -1, 2, 0, 0, 0, 0 ) 
								DisplayHelpText('Collection de bijoux en cours ...')
								DrawSubtitleTimed(5000, 1)
								Citizen.Wait(5000)
								ClearPedTasksImmediately(PlayerPedId())
								RemoveBlip(gioielli20)
								MowgliClientUtils.toServer('ewen:rageui')
								MowgliClientUtils.toServer('esx_vangelico_robbery:gioielli1', token)
								PlaySound(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
                                hasrobbed20 = true
							end
							end
							end

							if (hasrobbed == true) and (hasrobbed2 == true) and (hasrobbed3 == true) and (hasrobbed4 == true) and (hasrobbed5 == true) and (hasrobbed6 == true) and (hasrobbed7 == true) and (hasrobbed8 == true) and (hasrobbed9 == true) and (hasrobbed10 == true) and (hasrobbed11 == true) and (hasrobbed12 == true) and (hasrobbed13 == true) and (hasrobbed14 == true) and (hasrobbed15 == true) and (hasrobbed16 == true) and (hasrobbed17 == true) and (hasrobbed18 == true) and (hasrobbed19 == true) and (hasrobbed20 == true) then
							holdingup = false
							
							hasrobbed = false
                            hasrobbed2 = false
                            hasrobbed3 = false
                            hasrobbed4 = false
                            hasrobbed5 = false
                            hasrobbed6 = false
                            hasrobbed7 = false
                            hasrobbed8 = false
                            hasrobbed9 = false
                            hasrobbed10 = false
                            hasrobbed11 = false
                            hasrobbed12 = false
                            hasrobbed13 = false
                            hasrobbed14 = false
                            hasrobbed15 = false
                            hasrobbed16 = false
                            hasrobbed17 = false
                            hasrobbed18 = false
                            hasrobbed19 = false
                            hasrobbed20 = false
							MowgliClientUtils.toServer('esx_vangelico_robbery:endrob', store)
							ESX.ShowNotification('~g~Vous avez volé des bijoux ! Maintenant, apportez des bijoux à ~b~Lester!')
							TriggerEvent('skinchanger:getSkin', function(skin)
	
		                       if skin.sex == 0 then

		                              local clothesSkin = {
		                              ['bags_1'] = 41, ['bags_2'] = 0
		                              }
		                          TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)

		                        else

		                              local clothesSkin = {
		                              ['bags_1'] = 41, ['bags_2'] = 0
		                              }
	                              TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)

	                           end
	                        end)
							end	

			local pos2 = Configvangelico.Stores[store].position

			if (GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), -622.566, -230.183, 38.057, true) > 11.5 ) then
				MowgliClientUtils.toServer('esx_vangelico_robbery:toofar', store)
				holdingup = false
				RemoveBlip(gioielli1)
				RemoveBlip(gioielli2)
				RemoveBlip(gioielli3)
				RemoveBlip(gioielli4)
				RemoveBlip(gioielli5)
				RemoveBlip(gioielli6)
				RemoveBlip(gioielli7)
				RemoveBlip(gioielli8)
				RemoveBlip(gioielli9)
				RemoveBlip(gioielli10)
				RemoveBlip(gioielli11)
				RemoveBlip(gioielli12)
				RemoveBlip(gioielli13)
				RemoveBlip(gioielli14)
				RemoveBlip(gioielli15)
				RemoveBlip(gioielli16)
				RemoveBlip(gioielli17)
				RemoveBlip(gioielli18)
				RemoveBlip(gioielli19)
				RemoveBlip(gioielli20)
				
				hasrobbed = false
                hasrobbed2 = false
                hasrobbed3 = false
                hasrobbed4 = false
                hasrobbed5 = false
                hasrobbed6 = false
                hasrobbed7 = false
                hasrobbed8 = false
                hasrobbed9 = false
                hasrobbed10 = false
                hasrobbed11 = false
                hasrobbed12 = false
                hasrobbed13 = false
                hasrobbed14 = false
                hasrobbed15 = false
                hasrobbed16 = false
                hasrobbed17 = false
                hasrobbed18 = false
                hasrobbed19 = false
                hasrobbed20 = false
			end
		end

		Citizen.Wait(vangelicorobbery)
	end
end)

Configvangelico.netRegisterAndHandle('esx_vangelico_robbery:togliblip', function(robb)
	RemoveBlip(gioielli1)
	RemoveBlip(gioielli2)
	RemoveBlip(gioielli3)
	RemoveBlip(gioielli4)
	RemoveBlip(gioielli5)
	RemoveBlip(gioielli6)
	RemoveBlip(gioielli7)
	RemoveBlip(gioielli8)
	RemoveBlip(gioielli9)
	RemoveBlip(gioielli10)
	RemoveBlip(gioielli11)
	RemoveBlip(gioielli12)
	RemoveBlip(gioielli13)
	RemoveBlip(gioielli14)
	RemoveBlip(gioielli15)
	RemoveBlip(gioielli16)
	RemoveBlip(gioielli17)
	RemoveBlip(gioielli18)
	RemoveBlip(gioielli19)
	RemoveBlip(gioielli20)
end)

function MenuVente()
	local vente = RageUI.CreateMenu("", "Vente Bijoux")

	RageUI.Visible(vente, not RageUI.Visible(vente))

	while vente do
		Citizen.Wait(0)
		RageUI.IsVisible(vente, function()
			RageUI.Button('Vendre Bijoux', nil, {}, true, {onSelected = function() MowgliClientUtils.toServer('lester:vendita') end});
		end)
		if not RageUI.Visible(vente) then
			vente = RMenu:DeleteType('vente', true)
		end
	end
end

Citizen.CreateThread(function()
    while true do
		local open = false	

		if Vdist2(GetEntityCoords(PlayerPedId(), false), vector3(177.339, -1000.165, -98.999)) < 2 then
			open = true
			ESX.ShowHelpNotification('Appuyez sur ~INPUT_CONTEXT~')
			if IsControlJustPressed(1, 51) then
				MenuVente()
			end
		end	

		if open then
			Wait(5)
		else
			Wait(250)
		end
    end
end)