WeaponBlackList = {
    ["WEAPON_MUSKET"] = true,
    ["WEAPON_NIGHTSTICK"] = true,
    ["WEAPON_STUNGUN"] = true,
    ["WEAPON_COMBATPISTOL"] = true,
    ["WEAPON_PUMPSHOTGUN"] = true,
    ["WEAPON_CARBINERIFLE"] = true
}
AtlantisRPEvent = TriggerServerEvent
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if NetworkIsSessionStarted() then
			AtlantisRPEvent('sHardcap:playerActivated')
			return
		end
	end
end)