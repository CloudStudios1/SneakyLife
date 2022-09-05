ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('Sneakyesx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

local orgaTable = {label = "Information", submitLabel = "Valider les Informations", placeHolders = {
	{label = "Nom de L'organisation"},
	{label = "Devise"},
	{label = "Nom du rang chef"},
    {label = "Nom du rang nouveau"},
}}


local crewTable = {label = "Information", submitLabel = "Valider les Informations", placeHolders = {
	{label = "Nom du crew"},
	{label = "Devise"},
	{label = "Nom du rang chef"},
    {label = "Nom du rang nouveau"},
}}
--[[
    Create or open the crew system for the players
]]
RegisterCommand('crew', function()
    ESX.TriggerServerCallback('p_getOCmenu', function(cb, result, extraOC)
        if ( not cb ) then 
            local result =  NeoInput(crewTable)
  
            if ( result ~= nil ) then 
                local type = "crew"
                local referens =  { label = result["0"], currency = result["1"], leader = result["2"], junior = result["3"] } 

                TriggerServerEvent('p_insertnewOCmenu', { type = type, referens = referens})
            end
        else
            if extraOC == nil then 
                result.referens = json.decode(result.referens)
                showOCmenu(result)
            else
                result.referens = json.decode(result.referens)
                showOCmenu(result, extraOC)
            end  
        end
    end, "crew")
end, false)


--[[
    Create only for staff or
    Players can open there orga menu
]]
RegisterCommand('orga', function()
    ESX.TriggerServerCallback('p_getOCmenu', function(cb, result, extraOC)
        if ( not cb ) then 
            local result =  NeoInput(orgaTable)

            if ( result ~= nil ) then 
                local type = "organisation"
                local referens =  { label = result["0"], currency = result["1"], leader = result["2"], junior = result["3"] } 


                TriggerServerEvent('p_insertnewOCmenu', { type = type, referens = referens})
            end
        else
            if extraOC == nil then 
                result.referens = json.decode(result.referens)
                showOCmenu(result)
            else
                result.referens = json.decode(result.referens)
                showOCmenu(result, extraOC)
            end
        end
    end, "organisation")
end, false)