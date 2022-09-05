ESX = nil

TriggerEvent('Sneakyesx:getSharedObject', function(obj) ESX = obj end) 

local rankLabels = {
    ["permissions"] = false,
    ['recruit'] = false,
    ['createRank'] = false,
    ["member"] = false
}

RegisterServerEvent('p_insertnewOCmenu')
AddEventHandler('p_insertnewOCmenu', function(self)
    if source == -1 then 
        CancelEvent() 
    end   

    local xPlayer = ESX.GetPlayerFromId(source)

    MySQL.Async.execute('INSERT INTO ocmenus (type, owner, referens, ranks, members) VALUES (@type, @owner, @referens, @ranks, @members)', {
        ["@type"] = self.type,
        ["@owner"] = xPlayer.identifier,
        ["@ranks"] = json.encode({}),
        ["@members"] = json.encode({}),
        ["referens"] = json.encode(self.referens)
    }, function(r)
        MySQL.Async.fetchAll('SELECT id FROM ocmenus WHERE owner = @owner AND type = @type', {
            ['@owner'] = xPlayer.identifier,
            ["@type"] = self.type
        }, function (result)
             
            TriggerEvent('p_insertOCrank', result[1].id, self.referens.junior, rankLabels)
        end)
    end)
end)




RegisterServerEvent('p_leaveOC')
AddEventHandler('p_leaveOC', function(id, owner)
    if source == -1 then 
        CancelEvent() 
    end   

    local xPlayer = ESX.GetPlayerFromId(source)
    local ocOwner = ESX.GetPlayerFromIdentifier(owner)

    MySQL.Async.fetchAll('SELECT * FROM ocmenus WHERE owner = @owner AND id = @id', {
		['@owner'] = xPlayer.identifier,
        ["@id"] = id
	}, function (result)
		if ( result[1] ) then  
            TriggerClientEvent('Sneakyesx:showNotification', xPlayer.source, "Vous venez de d'effacer <C>~r~L'infrastructure~s~</C>.")

            TriggerEvent('p_getOCtable', id, "members", function(mem)
                for k, v in pairs(mem) do 
                    local member = ESX.GetPlayerFromIdentifier(v.identifier)
                    if ( member.source ~= nil and member ) then 
                        riggerClientEvent('Sneakyesx:showNotification', member, "Votre <C>~r~infrastructure~s~</C> a etter effacer.")
                    end 
                end
            end)

            MySQL.Async.execute('DELETE FROM ocmenus WHERE id=@id', {
                ['@id'] = id
            })
        else
            TriggerEvent('p_getOCtable', id, "members", function(result)
                for k, v in pairs(result) do 
                    if v.identifier == xPlayer.identifier then 
                        table.remove(result, k)
                    end 
                end 
                
                MySQL.Async.execute('UPDATE ocmenus SET members = @members WHERE id = @id',
                {
                    ['@id'] = id,  
                    ['@members'] = json.encode(result)
                })
            end)

            if ( ocOwner.source ~= nil and ocOwner ) then 
                TriggerClientEvent('Sneakyesx:showNotification', ocOwner.source, "<C>~r~"..GetPlayerName(xPlayer.source).."~s~</C> vient de quiiter votre ~b~infrastructure~s~.")
            end 

            TriggerClientEvent('Sneakyesx:showNotification', xPlayer.source, "Vous venez de quitter <C>~r~L'infrastructure~s~</C>.")
        end 
	end)
end)



RegisterServerEvent('p_recruitOC')
AddEventHandler('p_recruitOC', function(id, target, default) 
    if source == -1 then 
        CancelEvent() 
    end   
    
    local xTarget = ESX.GetPlayerFromId(target)
    local xPlayer = ESX.GetPlayerFromId(source)

    
    MySQL.Async.fetchAll('SELECT * FROM ocmenus WHERE owner = @owner ', {
        ['@owner'] = xTarget.identifier
    }, function (result)
        if ( result[1] ) then 
            TriggerClientEvent('Sneakyesx:showNotification', xPlayer.source, "Cette personne ne peux pas être <C>~r~recruter~s~</C>.")
        else
            MySQL.Async.fetchAll('SELECT * FROM ocmenus', {

            }, function (result2)
                local member = false
                if ( result2[1] ) then 
                    local checkMembers = json.decode(result2[1].members)
                    for k, v in pairs(checkMembers) do 
                        if v.identifier == xPlayer.identifier then 
                            member = true
                            
                            TriggerClientEvent('Sneakyesx:showNotification', xPlayer.source, "Cette personne ne peux pas être <C>~r~recruter~s~</C>.")
                        end 
                    end 
                end
                
                if ( not member ) then 
                    TriggerEvent('p_getOCtable', id, "members", function(result)
                        table.insert(result, {name = GetPlayerName(xTarget.source), rank = default, identifier = xTarget.identifier})
                        
                        MySQL.Async.execute('UPDATE ocmenus SET members = @members WHERE id = @id',
                        {
                            ['@id'] = id,  
                            ['@members'] = json.encode(result)
                        })
                    end)
                    TriggerClientEvent('Sneakyesx:showNotification', xPlayer.source, "Vous venez de recruter <C>~b~"..GetPlayerName(xTarget.source).."</C>")
                    TriggerClientEvent('Sneakyesx:showNotification', xTarget.source, "Vous êtes recruter de la part de <C>~b~"..GetPlayerName(xPlayer.source).."~s~</C>.")
                end 
            end)
        end
    end)
end)



RegisterServerEvent('p_insertOCrank')
AddEventHandler('p_insertOCrank', function(id, rank, perms)
    if source == -1 then 
        CancelEvent() 
    end   

    TriggerEvent('p_getOCtable', id, "ranks", function(result)
        table.insert(result, {name = rank, permissions = perms})
        MySQL.Async.execute('UPDATE ocmenus SET ranks = @rank WHERE id = @id',
        {
            ['@id'] = id,
            ['@rank'] = json.encode(result)
        })
    end)
end)



RegisterServerEvent('p_changeOCrankperms')
AddEventHandler('p_changeOCrankperms', function(id, ranks)
    if source == -1 then 
        CancelEvent() 
    end   

    MySQL.Async.execute('UPDATE ocmenus SET ranks = @rank WHERE id = @id',
    {
        ['@id'] = id,
        ['@rank'] = json.encode(ranks)
    })
end)


RegisterServerEvent('p_changeOCrank')
AddEventHandler('p_changeOCrank', function(id, member)
    if source == -1 then 
        CancelEvent() 
    end   

    MySQL.Async.execute('UPDATE ocmenus SET members = @members WHERE id = @id',
    {
        ['@id'] = id,
        ['@members'] = json.encode(member)
    })
end)

