ESX = nil

TriggerEvent('Sneakyesx:getSharedObject', function(obj) ESX = obj end) 

ESX.RegisterServerCallback('p_getOCmenu', function (source, cb, type)
    local xPlayer = ESX.GetPlayerFromId(source)
	MySQL.Async.fetchAll('SELECT * FROM ocmenus WHERE owner = @owner AND type = @type', {
		['@owner'] = xPlayer.identifier,
		['@type'] = type
	}, function (result)
			if ( result[1] ) then 
				cb(true, result[1])
			else
				MySQL.Async.fetchAll('SELECT * FROM ocmenus WHERE type = @type', {
					['@type'] = type
				}, function (result2)
					local member = false
					if ( result2[1] ) then 
						local checkMembers = json.decode(result2[1].members)
						for k, v in pairs(checkMembers) do 
							if v.identifier == xPlayer.identifier then 
								member = true
								cb(true, result2[1], k)
							end 
						end 
					end
					
					if ( not member ) then 
						cb(false)
					end 

				end)
			
			end 
	end)
end)

RegisterServerEvent('p_getOCtable')
AddEventHandler('p_getOCtable', function(id, wich, f)
	if source == -1 then 
        CancelEvent() 
    end   

    MySQL.Async.fetchAll('SELECT '..wich..' FROM ocmenus WHERE id = @id', {
		['@id'] = id
	}, function (result)
		if ( json.encode(result) ~= "[]" ) then 
			f(json.decode(result[1][wich]))
		else
			f({})
		end
	end)
end)