-- Boucle pour la vitesse des vhécules
Citizen.CreateThread(function() 
	while true do
		local ped = PlayerPedId()
		local Time = 500
		if IsPedSittingInAnyVehicle(ped) then
			Time = 0
			local veh = GetVehiclePedIsIn(ped, false)
			local vehClass = GetVehicleClass(veh)
			if vehClass == 18 then
				SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(PlayerPedId(), false), 2.0 * 15.0)
			elseif vehClass == 16 then
				SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(ped, false), 2.0 * 500.0)
			end
		end
		Citizen.Wait(Time)
	end
end)