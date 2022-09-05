
local OC = {}

local ranksPermissions = {
    ["permissions"] = {label = "Editer les permissions", name = "permissions", checked = false},
    ["recruit"] = {label = "Recruter une perssone", name = "recruit", checked = false},
    ["createRank"] = {label = "Créer un rang", name = "createRank", checked = false},
    ["member"] = {label = "Editer un membre", name = "member", checked = false}, 
}

local rankLabels = {
    ["permissions"] = false,
    ['recruit'] = false,
    ['createRank'] = false,
    ["member"] = false
}



function showOCmenu(ocResult, extraOC)
   
	if OC.Menu then 
        OC.Menu = false 
        RageUI.Visible(RMenu:Get('ocMenu', 'main'), false)
        return
    else
		RMenu.Add("ocMenu", "main", RageUI.CreateMenu("",ocResult.type:upper(),0,0,"root_cause","AtlantisRP"))

        RMenu.Add("ocMenuInformation", "main", RageUI.CreateSubMenu(RMenu:Get("ocMenu", "main"), "", "Main"))
        RMenu.Add("ocMenuGestion", "main", RageUI.CreateSubMenu(RMenu:Get("ocMenu", "main"), "", "Main"))
        RMenu.Add("ocMenuMemberList", "main", RageUI.CreateSubMenu(RMenu:Get("ocMenu", "main"), "", "Main"))
        RMenu.Add("ocChangeMemberRank", "main", RageUI.CreateSubMenu(RMenu:Get("ocMenuMemberList", "main"), "", "Main"))


        RMenu.Add("ocMenuRankList", "main", RageUI.CreateSubMenu(RMenu:Get("ocMenu", "main"), "", "Main"))
        RMenu.Add("ocChangeRankPerms", "main", RageUI.CreateSubMenu(RMenu:Get("ocMenuRankList", "main"), "", "Main"))
        
        
		OC.Menu = true 
        RageUI.Visible(RMenu:Get('ocMenu', 'main'), true)
		Citizen.CreateThread(function() 
			while OC.Menu do
                local ocRanks = json.decode(ocResult.ranks)
                local ocMembers = json.decode(ocResult.members)
                local ocReferens = ocResult.referens
                 
    
					RageUI.IsVisible(RMenu:Get("ocMenu","main"), true, true, true, function()

                        RageUI.Button("Information", nil, { RightLabel = "→→" }, true, function(s, p, q)
                        end, RMenu:Get('ocMenuInformation', 'main'))

                        if ( getOCrankpermission(extraOC or nil, ocRanks, 'recruit', ocMembers) or getOCrankpermission(extraOC or nil, ocRanks, 'createRank', ocMembers) ) then

                            RageUI.Button("Gestion", nil, { RightLabel = "→→" }, true, function(s, p, q) 
                            end, RMenu:Get('ocMenuGestion', 'main'))

                        end
                        if ( getOCrankpermission(extraOC or nil, ocRanks, 'member', ocMembers) ) then
                            RageUI.Button("Liste des membres", nil, { RightLabel = "→→" }, true, function(s, p, q)
                            end, RMenu:Get('ocMenuMemberList', 'main'))
                        end

                        if ( getOCrankpermission(extraOC or nil, ocRanks, 'permissions', ocMembers) ) then
                            RageUI.Button("Total des rangs", nil, { RightLabel = "→→" }, true, function(s, p, q)
                            end, RMenu:Get('ocMenuRankList', 'main'))
                        end
				    end)  

                    RageUI.IsVisible(RMenu:Get("ocMenuInformation","main"), true, true, true, function()
                        RageUI.Button("Nom", nil, { RightLabel =  ocResult.referens.label}, true, function(s, p, q)
                        end)
                        RageUI.Button("Devise", nil, { RightLabel =  ocResult.referens.currency}, true, function(s, p, q)
                        end)
                        RageUI.Button("Total des membres", nil, { RightLabel = #ocMembers}, true, function(s, p, q)
                        end)
               
                        RageUI.Button("Total des rangs", nil, { RightLabel =  #ocRanks}, true, function(s, p, q)
                           
                        end)
                        RageUI.Button("Quitter/Effacer "..ocResult.type:upper(), nil, { RightLabel =  "→→"}, true, function(s, p, q)
                            if ( q ) then 
                                RageUI.CloseAll()
                                TriggerServerEvent('p_leaveOC', ocResult.id, ocResult.owner)
                            end 
                        end)
                    end)

                    RageUI.IsVisible(RMenu:Get("ocMenuGestion","main"), true, true, true, function()
                        if ( getOCrankpermission(extraOC or nil, ocRanks, 'recruit', ocMembers) ) then 
                            RageUI.Button("Recruter quelqu'un", nil, { RightLabel =  "→→" }, true, function(s, p, q)
                                if ( q ) then 
                                    local target, distance = ESX.Game.GetClosestPlayer()
                                    if distance <= 4.0 then  
                                        TriggerServerEvent('p_recruitOC', ocResult.id, GetPlayerServerId(target), ocReferens.junior)
                                    else
                                        ESX.ShowNotification("Personne a <C>~r~proximté~s~</C>.")
                                    end
                                end 
                            end)
                        end
                        if ( getOCrankpermission(extraOC or nil, ocRanks, 'createRank', ocMembers) ) then
                            RageUI.Button("Créer un rang", nil, { RightLabel =  "→→" }, true, function(s, p, q)
                                if ( q ) then

                                    local ocCreateRank = {label = "Créer un rang", submitLabel = "Valider les Informations", placeHolders = {
                                        {label = "Nom du rang"},
                                    }}

                                    local result = NeoInput(ocCreateRank)

                                    if ( result["0"] ) then 
                                        TriggerServerEvent('p_insertOCrank', ocResult.id, result["0"], rankLabels)
                                        ESX.ShowNotification("Vous venez d'ajouter un rang <C>~b~"..result["0"].."~s~</c>")
                                    end
                                    
                                end 
                            end)
                        end
                    end)

                    RageUI.IsVisible(RMenu:Get("ocMenuMemberList","main"), true, true, true, function()
                        for k, v in pairs(ocMembers) do 
                            RageUI.Button(v.name, nil, { RightLabel =  v.rank}, true, function(s, p, q)
                                if ( q ) then 
                                    ocResult.currentSelectedMember = k
                                end 
                            end, RMenu:Get('ocChangeMemberRank', 'main'))
                        end 
                    end) 

                    RageUI.IsVisible(RMenu:Get("ocChangeMemberRank","main"), true, true, true, function()
                        for k, v in pairs(ocRanks) do 
                            RageUI.Button(v.name, nil, { RightLabel =  "→→"}, true, function(s, p, q)
                                if ( q ) then 
                                    ocMembers[ocResult.currentSelectedMember].rank = v.name
                                    Wait(0) 
                                    TriggerServerEvent('p_changeOCrank', ocResult.id, ocMembers)
                                end 
                            end)
                        end
                    end)

                    RageUI.IsVisible(RMenu:Get("ocMenuRankList","main"), true, true, true, function()

                        
                        RageUI.Button(ocReferens.leader, nil, { RightLabel =  "MAIN"}, true, function(s, p, q)
                            
                        end)
 
                        for k, v in pairs(ocRanks) do 
                            RageUI.Button(v.name, nil, { RightLabel =  "→→"}, true, function(s, p, q)
                                if ( q ) then 
                                    OC.currentRankIndex = k
                                    for k, v in pairs(ranksPermissions) do 

                                        for i, p in pairs(ocRanks[OC.currentRankIndex].permissions) do 
                                            if i == k then 
                                                ranksPermissions[k].checked = p 
                                            end
                                        end 
                                    end
                                end 
                            end, RMenu:Get('ocChangeRankPerms', 'main'))
                        end
                    end)

                    RageUI.IsVisible(RMenu:Get("ocChangeRankPerms","main"), true, true, true, function()

                    
                        for k, v in pairs(ranksPermissions) do 
                            RageUI.Checkbox(v.label, nil, v.checked, {},function(Hovered, Active, Selected, Checked)
                                v.checked = Checked
                                if ( Checked ) then 
                                    
                                end 
                            end)
                        end
                       -- RageUI.Separator("Valider les changement")
                        RageUI.Button("Valider", nil, { RightLabel =  "→→"}, true, function(s, p, q)
                            if ( q ) then 
                                for k, v in pairs(ranksPermissions) do 
                                    for i, p in pairs(ocRanks[OC.currentRankIndex].permissions) do 
                                        if i == k then 
                                            print(i, k)
                                            ocRanks[OC.currentRankIndex].permissions[i] = v.checked
                                        end
                                    end 
                                
                                end 
                                TriggerServerEvent('p_changeOCrankperms', ocResult.id, ocRanks)
                            end
                        end)
                    end)
				Wait(0)
			end
		end)
	end
end


