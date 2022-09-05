ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('Sneakyesx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(10)
    end
    if ESX.IsPlayerLoaded() then
        ESX.PlayerData = ESX.GetPlayerData()
    end
end)
local onService = false
AtlantisRPEvent = TriggerServerEvent
PoliceJob = {
    ["police"] = {
        job = "police",
        name = "lspd",
        label = "Los Santos Police Department",
        texture = "police",
        positions = {
            ["garage"] = {
                menuPos = vector3(-1066.5805664062,-848.36584472656,5.0423512458801-0.9),
                vehicle = {
                    Pos = {
                        {pos = vector3(-1061.6448974609,-853.76837158203,4.6233577728271), heading = 216.91},
                        {pos = vector3(-1058.4375,-851.65631103516,4.622594833374), heading = 217.096},
                        {pos = vector3(-1055.5220947266,-848.92816162109,4.6228938102722), heading = 217.106},
                        {pos = vector3(-1052.4029541016,-846.69470214844,4.6222887039185), heading = 216.388},
                        {pos = vector3(-1047.6141357422,-846.67572021484,4.6230092048645), heading = 216.491},
                        {pos = vector3(-1040.0026855469,-855.52081298828,4.6334705352783), heading = 59.35},
                        {pos = vector3(-1042.2658691406,-858.55883789062,4.6425747871399), heading = 59.04},
                        {pos = vector3(-1045.5344238281,-861.45159912109,4.673903465271), heading = 59.490},
                        {pos = vector3(-1048.6085205078,-864.44128417969,4.7620944976807), heading = 58.02},
                        {pos = vector3(-1052.2310791016,-866.92834472656,4.878746509552), heading = 59.22}
                    },
                    Vehicles = {
                        {label = "Vélo", veh = "scorcher", stock = 2},
                        {label = "Ford Victoria", veh = "police", stock = 5},
                        {label = "Ford Mondeo", veh = "17fusionrb", stock = 2},
                        {label = "Ford Explorer", veh = "police3", stock = 2},
                        {label = "Lexus GS 350", veh = "polgs350", stock = 2},
                        {label = "Dodge Charger Poursuit", veh = "sjcop1", stock = 2},
                        {label = "Dodge Charger Supervisor", veh = "demonrb", stock = 1},
                        {label = "Véhicule SWAT", veh = "fbi2", stock = 1},
                        {label = "R.I.O.T", veh = "riot", stock = 1},
                        {label = "Dodge Charger Banaliser", veh = "hellcat", stock = 1},
                        {label = "Moto de Police", veh = "WIP4", stock = 2},
                        {label = "Maserati", veh = "ghispo2", stock = 1},
                    }
                },
                deleteVehicle = vector3(-1070.5460205078,-854.19812011719,4.6241159439087-0.9)
            }, -- Fin garage
            ["garagehelico"] = {
                menuPos = vector3(-1092.5874023438,-839.70532226562,37.700603485107-0.9),
                vehicle = {
                    Pos = {
                        {pos = vector3(-1096.4407958984,-832.31341552734,38.095550537109), heading = 128.161},
                    },
                    Vehicles = {
                        {label = "Hélicoptère", veh = "lspdmav", stock = 2},
                    }
                },
                deleteVehicle = vector3(-1096.4407958984,-832.31341552734,38.095550537109-0.9)
            }, -- Fin garage
            ["armory"] = {
                giletPos = vector3(-1106.9793701172,-824.45825195312,14.282787322998-0.9),
                armoryPos = vector3(-1098.8538818359,-826.12939453125,14.282976150513-0.9),
                weapons = {
                    [1] = {name = "WEAPON_NIGHTSTICK", label = "Matraque", mingrade = 0},
                    [2] = {name = "WEAPON_STUNGUN", label = "Pistolet paralysant", mingrade = 0},
                    [3] = {name = "WEAPON_COMBATPISTOL", label = "Pistolet de combat", mingrade = 1},
                    [4] = {name = "WEAPON_CARBINERIFLE", label = "M4", mingrade = 7},
                    [5] = {name = "WEAPON_PUMPSHOTGUN", label = "Fusil à Pompe", mingrade = 1},
                }
            }, -- Fin armory
            ["clothes"] = {
                menuPos = vector3(-1092.5103759766,-826.31500244141,26.827421188354-0.9),
                clothes = {
                    [0] = {
                        submenu = "clothes",
                        label = "Tenues",
                        clothes = {
                            [1] = {
                                label = "S'équiper de la tenue : ~b~Recruit",
                                grades = {["recruit"] = true},
                                clothes = {
                                    male = {
                                        ['tshirt_1'] = 248,  ['tshirt_2'] = 0,
                                        ['torso_1'] = 417,   ['torso_2'] = 1,
                                        ['decals_1'] = 0,   ['decals_2'] = 0,
                                        ['arms'] = 4,
                                        ['pants_1'] = 146,   ['pants_2'] = 0,
                                        ['shoes_1'] = 25,   ['shoes_2'] = 0,
                                        ['chain_1'] = 173,    ['chain_2'] = 0,
                                        ['bags_1'] = 0,     ['bags_2'] = 0,
                                        ['bproof_1'] = 60,  ['bproof_2'] = 0,
                                    },
                                    female = {
                                        ['tshirt_1'] = 245,  ['tshirt_2'] = 0,
                                        ['torso_1'] = 419,   ['torso_2'] = 1,
                                        ['decals_1'] = 0,   ['decals_2'] = 0,
                                        ['arms'] = 1,
                                        ['pants_1'] = 150,   ['pants_2'] = 0,
                                        ['shoes_1'] = 25,   ['shoes_2'] = 0,
                                        ['chain_1'] = 183,    ['chain_2'] = 0,
                                        ['bags_1'] = 0,     ['bags_2'] = 0,
                                        ['bproof_1'] = 60,  ['bproof_2'] = 0,
                                    }
                                },
                                
                            },
            
                            [2] = {
                                label = "S'équiper de la tenue : ~b~Officier I",
                                grades = {["officer"] = true},
                                clothes = {
                                    male = {
                                        ['tshirt_1'] = 248,  ['tshirt_2'] = 0,
                                        ['torso_1'] = 417,   ['torso_2'] = 1,
                                        ['decals_1'] = 0,   ['decals_2'] = 0,
                                        ['arms'] = 4,
                                        ['pants_1'] = 146,   ['pants_2'] = 0,
                                        ['shoes_1'] = 25,   ['shoes_2'] = 0,
                                        ['chain_1'] = 173,    ['chain_2'] = 0,
                                        ['bags_1'] = 103,     ['bags_2'] = 0,
                                        ['bproof_1'] = 60,  ['bproof_2'] = 0,
                                    },
                                    female = {
                                        ['tshirt_1'] = 245,  ['tshirt_2'] = 0,
                                        ['torso_1'] = 419,   ['torso_2'] = 1,
                                        ['decals_1'] = 0,   ['decals_2'] = 0,
                                        ['arms'] = 1,
                                        ['pants_1'] = 150,   ['pants_2'] = 0,
                                        ['shoes_1'] = 25,   ['shoes_2'] = 0,
                                        ['chain_1'] = 183,    ['chain_2'] = 0,
                                        ['bags_1'] = 102,     ['bags_2'] = 0,
                                        ['bproof_1'] = 60,  ['bproof_2'] = 0,
                                    }
                                },
                                
                            },
            
                            [3] = {
                                label = "S'équiper de la tenue : ~b~Officier II",
                                grades = {["officerii"] = true},
                                clothes = {
                                    male = {
                                        ['tshirt_1'] = 248,  ['tshirt_2'] = 0,
                                        ['torso_1'] = 417,   ['torso_2'] = 1,
                                        ['decals_1'] = 0,   ['decals_2'] = 0,
                                        ['arms'] = 4,
                                        ['pants_1'] = 146,   ['pants_2'] = 0,
                                        ['shoes_1'] = 25,   ['shoes_2'] = 0,
                                        ['chain_1'] = 173,    ['chain_2'] = 0,
                                        ['bags_1'] = 103,     ['bags_2'] = 0,
                                        ['bproof_1'] = 60,  ['bproof_2'] = 0,
                                    },
                                    female = {
                                        ['tshirt_1'] = 245,  ['tshirt_2'] = 0,
                                        ['torso_1'] = 419,   ['torso_2'] = 1,
                                        ['decals_1'] = 0,   ['decals_2'] = 0,
                                        ['arms'] = 1,
                                        ['pants_1'] = 150,   ['pants_2'] = 0,
                                        ['shoes_1'] = 25,   ['shoes_2'] = 0,
                                        ['chain_1'] = 183,    ['chain_2'] = 0,
                                        ['bags_1'] = 102,     ['bags_2'] = 0,
                                        ['bproof_1'] = 60,  ['bproof_2'] = 0,
                                    }
                                },
                                
                            },
            
                            [4] = {
                                label = "S'équiper de la tenue : ~b~Officier III",
                                grades = {["officeriii"] = true},
                                clothes = {
                                    male = {
                                        ['tshirt_1'] = 248,  ['tshirt_2'] = 0,
                                        ['torso_1'] = 417,   ['torso_2'] = 1,
                                        ['decals_1'] = 130,   ['decals_2'] = 0,
                                        ['arms'] = 4,
                                        ['pants_1'] = 146,   ['pants_2'] = 0,
                                        ['shoes_1'] = 25,   ['shoes_2'] = 0,
                                        ['chain_1'] = 173,    ['chain_2'] = 0,
                                        ['bags_1'] = 103,     ['bags_2'] = 0,
                                        ['bproof_1'] = 60,  ['bproof_2'] = 0,
                                    },
                                    female = {
                                        ['tshirt_1'] = 245,  ['tshirt_2'] = 0,
                                        ['torso_1'] = 419,   ['torso_2'] = 1,
                                        ['decals_1'] = 137,   ['decals_2'] = 0,
                                        ['arms'] = 1,
                                        ['pants_1'] = 150,   ['pants_2'] = 0,
                                        ['shoes_1'] = 25,   ['shoes_2'] = 0,
                                        ['chain_1'] = 183,    ['chain_2'] = 0,
                                        ['bags_1'] = 102,     ['bags_2'] = 0,
                                        ['bproof_1'] = 60,  ['bproof_2'] = 0,
                                    }
                                },
                                
                            },
            
                            [5] = {
                                label = "S'équiper de la tenue : ~b~SLO",
                                grades = {["slo"] = true},
                                clothes = {
                                    male = {
                                        ['tshirt_1'] = 248,  ['tshirt_2'] = 0,
                                        ['torso_1'] = 417,   ['torso_2'] = 1,
                                        ['decals_1'] = 130,   ['decals_2'] = 1,
                                        ['arms'] = 4,
                                        ['pants_1'] = 146,   ['pants_2'] = 0,
                                        ['shoes_1'] = 25,   ['shoes_2'] = 0,
                                        ['chain_1'] = 173,    ['chain_2'] = 0,
                                        ['bags_1'] = 103,     ['bags_2'] = 0,
                                        ['bproof_1'] = 60,  ['bproof_2'] = 0,
                                    },
                                    female = {
                                        ['tshirt_1'] = 245,  ['tshirt_2'] = 0,
                                        ['torso_1'] = 419,   ['torso_2'] = 1,
                                        ['decals_1'] = 137,   ['decals_2'] = 1,
                                        ['arms'] = 1,
                                        ['pants_1'] = 150,   ['pants_2'] = 0,
                                        ['shoes_1'] = 25,   ['shoes_2'] = 0,
                                        ['chain_1'] = 183,    ['chain_2'] = 0,
                                        ['bags_1'] = 102,     ['bags_2'] = 0,
                                        ['bproof_1'] = 60,  ['bproof_2'] = 0,
                                    }
                                },
                                
                            },
            
                            [6] = {
                                label = "S'équiper de la tenue : ~b~Sergent I",
                                grades = {["sergeant"] = true},
                                clothes = {
                                    male = {
                                        ['tshirt_1'] = 248,  ['tshirt_2'] = 0,
                                        ['torso_1'] = 417,   ['torso_2'] = 1,
                                        ['decals_1'] = 130,   ['decals_2'] = 2,
                                        ['arms'] = 4,
                                        ['pants_1'] = 146,   ['pants_2'] = 0,
                                        ['shoes_1'] = 25,   ['shoes_2'] = 0,
                                        ['chain_1'] = 173,    ['chain_2'] = 0,
                                        ['bags_1'] = 103,     ['bags_2'] = 1,
                                        ['bproof_1'] = 60,  ['bproof_2'] = 0,
                                    },
                                    female = {
                                        ['tshirt_1'] = 245,  ['tshirt_2'] = 0,
                                        ['torso_1'] = 419,   ['torso_2'] = 1,
                                        ['decals_1'] = 137,   ['decals_2'] = 2,
                                        ['arms'] = 1,
                                        ['pants_1'] = 150,   ['pants_2'] = 0,
                                        ['shoes_1'] = 25,   ['shoes_2'] = 0,
                                        ['chain_1'] = 183,    ['chain_2'] = 0,
                                        ['bags_1'] = 102,     ['bags_2'] = 1,
                                        ['bproof_1'] = 60,  ['bproof_2'] = 0,
                                    }
                                },
                                
                            },
            
                            [7] = {
                                label = "S'équiper de la tenue : ~b~Sergent II",
                                grades = {["sergeantii"] = true},
                                clothes = {
                                    male = {
                                        ['tshirt_1'] = 248,  ['tshirt_2'] = 0,
                                        ['torso_1'] = 417,   ['torso_2'] = 1,
                                        ['decals_1'] = 130,   ['decals_2'] = 3,
                                        ['arms'] = 4,
                                        ['pants_1'] = 146,   ['pants_2'] = 0,
                                        ['shoes_1'] = 25,   ['shoes_2'] = 0,
                                        ['chain_1'] = 173,    ['chain_2'] = 0,
                                        ['bags_1'] = 103,     ['bags_2'] = 1,
                                        ['bproof_1'] = 60,  ['bproof_2'] = 0,
                                    },
                                    female = {
                                        ['tshirt_1'] = 245,  ['tshirt_2'] = 0,
                                        ['torso_1'] = 419,   ['torso_2'] = 1,
                                        ['decals_1'] = 137,   ['decals_2'] = 3,
                                        ['arms'] = 1,
                                        ['pants_1'] = 150,   ['pants_2'] = 0,
                                        ['shoes_1'] = 25,   ['shoes_2'] = 0,
                                        ['chain_1'] = 183,    ['chain_2'] = 0,
                                        ['bags_1'] = 102,     ['bags_2'] = 1,
                                        ['bproof_1'] = 60,  ['bproof_2'] = 0,
                                    }
                                },
                                
                            },
            
                            [8] = {
                                label = "S'équiper de la tenue : ~b~Lieutenant",
                                grades = {["lieutenant"] = true},
                                clothes = {
                                    male = {
                                        ['tshirt_1'] = 248,  ['tshirt_2'] = 0,
                                        ['torso_1'] = 417,   ['torso_2'] = 1,
                                        ['decals_1'] = 135,   ['decals_2'] = 0,
                                        ['arms'] = 4,
                                        ['pants_1'] = 146,   ['pants_2'] = 0,
                                        ['shoes_1'] = 25,   ['shoes_2'] = 0,
                                        ['chain_1'] = 173,    ['chain_2'] = 0,
                                        ['bags_1'] = 103,     ['bags_2'] = 2,
                                        ['bproof_1'] = 60,  ['bproof_2'] = 0,
                                    },
                                    female = {
                                        ['tshirt_1'] = 245,  ['tshirt_2'] = 0,
                                        ['torso_1'] = 419,   ['torso_2'] = 1,
                                        ['decals_1'] = 142,   ['decals_2'] = 0,
                                        ['arms'] = 1,
                                        ['pants_1'] = 150,   ['pants_2'] = 0,
                                        ['shoes_1'] = 25,   ['shoes_2'] = 0,
                                        ['chain_1'] = 183,    ['chain_2'] = 0,
                                        ['bags_1'] = 102,     ['bags_2'] = 2,
                                        ['bproof_1'] = 60,  ['bproof_2'] = 0,
                                    }
                                },
                                
                            },
            
                            [9] = {
                                label = "S'équiper de la tenue : ~b~Capitaine",
                                grades = {["chef"] = true},
                                clothes = {
                                    male = {
                                        ['tshirt_1'] = 248,  ['tshirt_2'] = 0,
                                        ['torso_1'] = 417,   ['torso_2'] = 1,
                                        ['decals_1'] = 135,   ['decals_2'] = 1,
                                        ['arms'] = 4,
                                        ['pants_1'] = 146,   ['pants_2'] = 0,
                                        ['shoes_1'] = 25,   ['shoes_2'] = 0,
                                        ['chain_1'] = 173,    ['chain_2'] = 0,
                                        ['bags_1'] = 103,     ['bags_2'] = 3,
                                        ['bproof_1'] = 113,  ['bproof_2'] = 0,
                                    },
                                    female = {
                                        ['tshirt_1'] = 245,  ['tshirt_2'] = 0,
                                        ['torso_1'] = 419,   ['torso_2'] = 1,
                                        ['decals_1'] = 142,   ['decals_2'] = 1,
                                        ['arms'] = 1,
                                        ['pants_1'] = 150,   ['pants_2'] = 0,
                                        ['shoes_1'] = 25,   ['shoes_2'] = 0,
                                        ['chain_1'] = 183,    ['chain_2'] = 0,
                                        ['bags_1'] = 102,     ['bags_2'] = 3,
                                        ['bproof_1'] = 60,  ['bproof_2'] = 0,
                                    }
                                },
                                
                            },
            
                            [10] = {
                                label = "S'équiper de la tenue : ~b~Commandant",
                                grades = {["boss"] = true},
                                clothes = {
                                    male = {
                                        ['tshirt_1'] = 248,  ['tshirt_2'] = 0,
                                        ['torso_1'] = 417,   ['torso_2'] = 1,
                                        ['decals_1'] = 135,   ['decals_2'] = 2,
                                        ['arms'] = 4,
                                        ['pants_1'] = 146,   ['pants_2'] = 0,
                                        ['shoes_1'] = 25,   ['shoes_2'] = 0,
                                        ['chain_1'] = 173,    ['chain_2'] = 0,
                                        ['bags_1'] = 103,     ['bags_2'] = 5,
                                        ['bproof_1'] = 60,  ['bproof_2'] = 0,
                                    },
                                    female = {
                                        ['tshirt_1'] = 245,  ['tshirt_2'] = 0,
                                        ['torso_1'] = 419,   ['torso_2'] = 1,
                                        ['decals_1'] = 142,   ['decals_2'] = 2,
                                        ['arms'] = 1,
                                        ['pants_1'] = 150,   ['pants_2'] = 0,
                                        ['shoes_1'] = 25,   ['shoes_2'] = 0,
                                        ['chain_1'] = 183,    ['chain_2'] = 0,
                                        ['bags_1'] = 102,     ['bags_2'] = 5,
                                        ['bproof_1'] = 60,  ['bproof_2'] = 0,
                                    }
                                },
                                
                            },
            
                            [11] = {
                                label = "S'équiper de la tenue : ~b~Deputy Chief",
                                grades = {["boss"] = true},
                                clothes = {
                                    male = {
                                        ['tshirt_1'] = 248,  ['tshirt_2'] = 0,
                                        ['torso_1'] = 417,   ['torso_2'] = 1,
                                        ['decals_1'] = 135,   ['decals_2'] = 3,
                                        ['arms'] = 4,
                                        ['pants_1'] = 146,   ['pants_2'] = 0,
                                        ['shoes_1'] = 25,   ['shoes_2'] = 0,
                                        ['chain_1'] = 173,    ['chain_2'] = 0,
                                        ['bags_1'] = 103,     ['bags_2'] = 6,
                                        ['bproof_1'] = 60,  ['bproof_2'] = 0,
                                    },
                                    female = {
                                        ['tshirt_1'] = 245,  ['tshirt_2'] = 0,
                                        ['torso_1'] = 419,   ['torso_2'] = 1,
                                        ['decals_1'] = 142,   ['decals_2'] = 3,
                                        ['arms'] = 1,
                                        ['pants_1'] = 150,   ['pants_2'] = 0,
                                        ['shoes_1'] = 25,   ['shoes_2'] = 0,
                                        ['chain_1'] = 183,    ['chain_2'] = 0,
                                        ['bags_1'] = 102,     ['bags_2'] = 6,
                                        ['bproof_1'] = 60,  ['bproof_2'] = 0,
                                    }
                                },
                                
                            },
            
                            [12] = {
                                label = "S'équiper de la tenue : ~b~Assistant Chief",
                                grades = {["boss"] = true},
                                clothes = {
                                    male = {
                                        ['tshirt_1'] = 248,  ['tshirt_2'] = 0,
                                        ['torso_1'] = 417,   ['torso_2'] = 1,
                                        ['decals_1'] = 135,   ['decals_2'] = 4,
                                        ['arms'] = 4,
                                        ['pants_1'] = 146,   ['pants_2'] = 0,
                                        ['shoes_1'] = 25,   ['shoes_2'] = 0,
                                        ['chain_1'] = 173,    ['chain_2'] = 0,
                                        ['bags_1'] = 103,     ['bags_2'] = 7,
                                        ['bproof_1'] = 60,  ['bproof_2'] = 0,
                                    },
                                    female = {
                                        ['tshirt_1'] = 245,  ['tshirt_2'] = 0,
                                        ['torso_1'] = 419,   ['torso_2'] = 1,
                                        ['decals_1'] = 142,   ['decals_2'] = 4,
                                        ['arms'] = 1,
                                        ['pants_1'] = 150,   ['pants_2'] = 0,
                                        ['shoes_1'] = 25,   ['shoes_2'] = 0,
                                        ['chain_1'] = 183,    ['chain_2'] = 0,
                                        ['bags_1'] = 102,     ['bags_2'] = 7,
                                        ['bproof_1'] = 60,  ['bproof_2'] = 0,
                                    }
                                },
                                
                            },
            
                            [13] = {
                                label = "S'équiper de la tenue : ~b~Chief",
                                grades = {["boss"] = true},
                                clothes = {
                                    male = {
                                        ['tshirt_1'] = 248,  ['tshirt_2'] = 0,
                                        ['torso_1'] = 417,   ['torso_2'] = 1,
                                        ['decals_1'] = 135,   ['decals_2'] = 5,
                                        ['arms'] = 4,
                                        ['pants_1'] = 146,   ['pants_2'] = 0,
                                        ['shoes_1'] = 25,   ['shoes_2'] = 0,
                                        ['chain_1'] = 173,    ['chain_2'] = 0,
                                        ['bags_1'] = 103,     ['bags_2'] = 8,
                                        ['bproof_1'] = 60,  ['bproof_2'] = 0,
                                    },
                                    female = {
                                        ['tshirt_1'] = 245,  ['tshirt_2'] = 0,
                                        ['torso_1'] = 419,   ['torso_2'] = 1,
                                        ['decals_1'] = 142,   ['decals_2'] = 5,
                                        ['arms'] = 1,
                                        ['pants_1'] = 150,   ['pants_2'] = 0,
                                        ['shoes_1'] = 25,   ['shoes_2'] = 0,
                                        ['chain_1'] = 183,    ['chain_2'] = 0,
                                        ['bags_1'] = 102,     ['bags_2'] = 8,
                                        ['bproof_1'] = 60,  ['bproof_2'] = 0,
                                    }
                                },
                                
                            }
                        }
                    },
                    [1] = {
                        submenu = "badges",
                        label = "Badges",
                        clothes = {}
                    },
                    [2] = {
                        submenu = "kevlars",
                        label = "Kevlars",
                        clothes = {}
                    },
                    [3] = {
                        submenu = "accessoires",
                        label = "Accessoires",
                        clothes = {}
                    }
                }
            },
        },
        PPA = {
            grades = {
                ["slo"] = true, 
                ["sergeant"] = true,
                ["sergeantii"] = true,
                ["lieutenant"] = true,
                ["chef"] = true,
                ["boss"] = true,
            }
        },
        Annonce = {
            grades = {
                ["sergeant"] = true,
                ["sergeantii"] = true,
                ["lieutenant"] = true,
                ["chef"] = true,
                ["boss"] = true,
            }
        },
    },
    ["lssd"] = {
        job = "lssd",
        name = "lssd",
        label = "Los Santos Sheriff's Department",
        texture = "lssd",
        positions = {
            ["garage"] = {
                menuPos = vector3(383.35647583008,-1612.5997314453,29.292039871216-0.9),
                vehicle = {
                    Pos = {
                        {pos = vector3(388.85430908203,-1612.9981689453,29.145986557007), heading = 230.715},
                        {pos = vector3(390.87435913086,-1610.5004882812,29.146202087402), heading = 231.001},
                        {pos = vector3(392.98614501953,-1608.1574707031,29.147230148315), heading = 231.39}
                    },
                    Vehicles = {
                        {label = "Moto Sheriff", veh = "sheriffthrust", stock = 2},
                        {label = "Declasse Ranger", veh = "sheriff2", stock = 2},
                        {label = "Alamo", veh = "sheriffalamo", stock = 2},
                        {label = "Coquette Sheriff", veh = "sheriffcq4", stock = 2},
                        {label = "Bravado Buffalo", veh = "LSSDbuff10", stock = 2},
                        {label = "Stanier Sheriff", veh = "lssdstanier", stock = 2},
                        {label = "Stanier Sheriff Slicktop", veh = "lssdstanierslick", stock = 2},
                        {label = "Stanier Banalisé", veh = "sheriffoss", stock = 2},
                        {label = "Landroamer", veh = "sheriffroamer", stock = 2},
                        {label = "Rumpo Sheriff", veh = "sheriffrumpo", stock = 2},
                        {label = "Vapid Scout", veh = "sheriffscoutnew", stock = 2},
                        {label = "Vapid Scout Banalisé", veh = "umkscout", stock = 1},
                        {label = "Vapid Riata", veh = "riatasr", stock = 2},
                        {label = "Oracle Banalisé", veh = "unmarkora", stock = 1},
                        {label = "Felon Banalisé", veh = "policefelon", stock = 1},
                        {label = "Vapid Cruiser Banalisé", veh = "police3umk", stock = 1},
                        {label = "Stalker Sheriff", veh = "sheriffstalker", stock = 2},
                        {label = "Sheriff Tarv", veh = "poltarv", stock = 2},
                        {label = "Stalker Unmarked", veh = "swatstalker", stock = 2},
                        {label = "Granger Unmarked", veh = "umkgranger", stock = 2},
                        {label = "Police Riot Antiémeute", veh = "riot2", stock = 1},
                        {label = "Centre d'opération mobile", veh = "mocpacker", stock = 1},
                    }
                },
                deleteVehicle = vector3(394.00115966797,-1616.5860595703,29.147302627563-0.9)
            },
            ["garagehelico"] = {
                menuPos = vector3(379.17807006836,-1600.2893066406,36.948654174805-0.9),
                vehicle = {
                    Pos = {
                        {pos = vector3(363.07998657227,-1597.8780517578,37.338535308838), heading = 141.911},
                    },
                    Vehicles = {
                        {label = "Hélicoptère", veh = "lssdmav", stock = 2},
                    }
                },
                deleteVehicle = vector3(363.07998657227,-1597.8781738281,37.337451934814-0.9)
            }, -- Fin garage
            ["armory"] = {
                giletPos = vector3(364.06692504883,-1607.3763427734,29.292055130005-0.9),
                armoryPos = vector3(367.24313354492,-1606.7841796875,29.292055130005-0.9),
                weapons = {
                    [1] = {name = "WEAPON_NIGHTSTICK", label = "Matraque", mingrade = 0},
                    [2] = {name = "WEAPON_STUNGUN", label = "Pistolet paralysant", mingrade = 0},
                    [3] = {name = "WEAPON_COMBATPISTOL", label = "Pistolet de combat", mingrade = 0},
                    [4] = {name = "WEAPON_SMG", label = "MP5", mingrade = 3},
                    [5] = {name = "WEAPON_PUMPSHOTGUN", label = "Fusil à Pompe", mingrade = 4},
                    [6] = {name = "WEAPON_SPECIALCARBINE", label = "G36", mingrade = 5},
                    [7] = {name = "WEAPON_CARBINERIFLE", label = "M4A1", mingrade = 5},
                }
            }, -- Fin armory
            ["clothes"] = {
                menuPos = vector3(367.80804443359,-1602.3194580078,29.292055130005-0.9),
                clothes = {
                    [0] = {
                        submenu = "clothes",
                        label = "Tenues",
                        clothes = {
                            [0] = {
                                label = "Tenue Deputy I",
                                grades = {["deputy1"] = true},
                                clothes = {
                                    ["male"] = {
                                        ['tshirt_1'] = 198,  ['tshirt_2'] = 1,
                                        ['torso_1'] = 451,   ['torso_2'] = 2,
                                        ['decals_1'] = 0,   ['decals_2'] = 0,
                                        ['arms'] = 6,
                                        ['pants_1'] = 146,   ['pants_2'] = 0,
                                        ['shoes_1'] = 54,   ['shoes_2'] = 0,
                                        ['helmet_1'] = -1,  ['helmet_2'] = 0,
                                        ['chain_1'] = 168,    ['chain_2'] = 0,
                                        ['ears_1'] = -1,     ['ears_2'] = 0,
                                        ['mask_1'] = 196,     ['mask_2'] = 0,
                                        ['bags_1'] = 108,     ['bags_2'] = 0,
                                        ['bproof_1'] = 61,     ['bproof_2'] = 0
                                    },
                                    ["female"] = {
                                        ['tshirt_1'] = 233,  ['tshirt_2'] = 1,
                                        ['torso_1'] = 454,   ['torso_2'] = 2,
                                        ['decals_1'] = 0,   ['decals_2'] = 0,
                                        ['arms'] = 3,
                                        ['pants_1'] = 160,   ['pants_2'] = 1,
                                        ['shoes_1'] = 52,   ['shoes_2'] = 0,
                                        ['helmet_1'] = -1,  ['helmet_2'] = 0,
                                        ['chain_1'] = 137,    ['chain_2'] = 0,
                                        ['ears_1'] = -1,     ['ears_2'] = 0,
                                        ['mask_1'] = 196,     ['mask_2'] = 0,
                                        ['bags_1'] = 106,     ['bags_2'] = 0,
                                        ['bproof_1'] = 61,     ['bproof_2'] = 0
                                    },
                                },
                            },
                            [1] = {
                                label = "MC Patrol",
                                grades = {["deputy2"] = true, ["deputy3"] = true, ["deputy_senior"] = true, ["sergeant"] = true, ["lieutenant"] = true, ["boss"] = true},
                                clothes = {
                                    ["male"] = {
                                        ['tshirt_1'] = 198,  ['tshirt_2'] = 1,
                                        ['torso_1'] = 415,   ['torso_2'] = 2,
                                        ['decals_1'] = 0,   ['decals_2'] = 0,
                                        ['arms'] = 11,
                                        ['pants_1'] = 146,   ['pants_2'] = 0,
                                        ['shoes_1'] = 54,   ['shoes_2'] = 0,
                                        ['helmet_1'] = -1,  ['helmet_2'] = 0,
                                        ['chain_1'] = 168,    ['chain_2'] = 0,
                                        ['ears_1'] = -1,     ['ears_2'] = 0,
                                        ['mask_1'] = 196,     ['mask_2'] = 0,
                                        ['bags_1'] = 108,     ['bags_2'] = 0,
                                        ['bproof_1'] = 61,     ['bproof_2'] = 0
                                    },
                                    ["female"] = {
                                        ['tshirt_1'] = 233,  ['tshirt_2'] = 1,
                                        ['torso_1'] = 426,   ['torso_2'] = 2,
                                        ['decals_1'] = 0,   ['decals_2'] = 0,
                                        ['arms'] = 9,
                                        ['pants_1'] = 160,   ['pants_2'] = 1,
                                        ['shoes_1'] = 52,   ['shoes_2'] = 0,
                                        ['helmet_1'] = -1,  ['helmet_2'] = 0,
                                        ['chain_1'] = 137,    ['chain_2'] = 0,
                                        ['ears_1'] = -1,     ['ears_2'] = 0,
                                        ['mask_1'] = 196,     ['mask_2'] = 0,
                                        ['bags_1'] = 106,     ['bags_2'] = 0,
                                        ['bproof_1'] = 61,     ['bproof_2'] = 0
                                    },
                                },
                            },
                            [2] = {
                                label = "ML Patrol",
                                grades = {["deputy2"] = true, ["deputy3"] = true, ["deputy_senior"] = true, ["sergeant"] = true, ["lieutenant"] = true, ["boss"] = true},
                                clothes = {
                                    ["male"] = {
                                        ['tshirt_1'] = 198,  ['tshirt_2'] = 1,
                                        ['torso_1'] = 427,   ['torso_2'] = 2,
                                        ['decals_1'] = 0,   ['decals_2'] = 0,
                                        ['arms'] = 1,
                                        ['pants_1'] = 146,   ['pants_2'] = 0,
                                        ['shoes_1'] = 54,   ['shoes_2'] = 0,
                                        ['helmet_1'] = -1,  ['helmet_2'] = 0,
                                        ['chain_1'] = 168,    ['chain_2'] = 0,
                                        ['ears_1'] = -1,     ['ears_2'] = 0,
                                        ['mask_1'] = 196,     ['mask_2'] = 0,
                                        ['bags_1'] = 108,     ['bags_2'] = 0,
                                        ['bproof_1'] = 61,     ['bproof_2'] = 0
                                    },
                                    ["female"] = {
                                        ['tshirt_1'] = 233,  ['tshirt_2'] = 1,
                                        ['torso_1'] = 429,   ['torso_2'] = 2,
                                        ['decals_1'] = 0,   ['decals_2'] = 0,
                                        ['arms'] = 3,
                                        ['pants_1'] = 160,   ['pants_2'] = 1,
                                        ['shoes_1'] = 52,   ['shoes_2'] = 0,
                                        ['helmet_1'] = -1,  ['helmet_2'] = 0,
                                        ['chain_1'] = 137,    ['chain_2'] = 0,
                                        ['ears_1'] = -1,     ['ears_2'] = 0,
                                        ['mask_1'] = 196,     ['mask_2'] = 0,
                                        ['bags_1'] = 106,     ['bags_2'] = 0,
                                        ['bproof_1'] = 61,     ['bproof_2'] = 0
                                    },
                                },
                            },
                            [3] = {
                                label = "ML Cravate",
                                grades = {["lieutenant"] = true, ["boss"] = true},
                                clothes = {
                                    ["male"] = {
                                        ['tshirt_1'] = 198,  ['tshirt_2'] = 1,
                                        ['torso_1'] = 451,   ['torso_2'] = 2,
                                        ['decals_1'] = 0,   ['decals_2'] = 0,
                                        ['arms'] = 1,
                                        ['pants_1'] = 146,   ['pants_2'] = 0,
                                        ['shoes_1'] = 54,   ['shoes_2'] = 0,
                                        ['helmet_1'] = -1,  ['helmet_2'] = 0,
                                        ['chain_1'] = 168,    ['chain_2'] = 0,
                                        ['ears_1'] = -1,     ['ears_2'] = 0,
                                        ['mask_1'] = 0,     ['mask_2'] = 0,
                                        ['bags_1'] = 108,     ['bags_2'] = 0,
                                        ['bproof_1'] = 61,     ['bproof_2'] = 0
                                    },
                                    ["female"] = {
                                        ['tshirt_1'] = 233,  ['tshirt_2'] = 1,
                                        ['torso_1'] = 454,   ['torso_2'] = 2,
                                        ['decals_1'] = 0,   ['decals_2'] = 0,
                                        ['arms'] = 3,
                                        ['pants_1'] = 160,   ['pants_2'] = 1,
                                        ['shoes_1'] = 52,   ['shoes_2'] = 0,
                                        ['helmet_1'] = -1,  ['helmet_2'] = 0,
                                        ['chain_1'] = 137,    ['chain_2'] = 0,
                                        ['ears_1'] = -1,     ['ears_2'] = 0,
                                        ['mask_1'] = 0,     ['mask_2'] = 0,
                                        ['bags_1'] = 106,     ['bags_2'] = 0,
                                        ['bproof_1'] = 61,     ['bproof_2'] = 0
                                    },
                                },
                            },
                            [4] = {
                                label = "ML Cérémonie",
                                grades = {["deputy2"] = true, ["deputy3"] = true, ["deputy_senior"] = true, ["sergeant"] = true, ["lieutenant"] = true, ["boss"] = true},
                                clothes = {
                                    ["male"] = {
                                        ['tshirt_1'] = 198,  ['tshirt_2'] = 1,
                                        ['torso_1'] = 451,   ['torso_2'] = 2,
                                        ['decals_1'] = 0,   ['decals_2'] = 0,
                                        ['arms'] = 82,
                                        ['pants_1'] = 146,   ['pants_2'] = 0,
                                        ['shoes_1'] = 54,   ['shoes_2'] = 0,
                                        ['helmet_1'] = -1,  ['helmet_2'] = 0,
                                        ['chain_1'] = 168,    ['chain_2'] = 0,
                                        ['ears_1'] = -1,     ['ears_2'] = 0,
                                        ['mask_1'] = 0,     ['mask_2'] = 0,
                                        ['bags_1'] = 108,     ['bags_2'] = 0,
                                        ['bproof_1'] = 61,     ['bproof_2'] = 0
                                    },
                                    ["female"] = {
                                        ['tshirt_1'] = 233,  ['tshirt_2'] = 1,
                                        ['torso_1'] = 454,   ['torso_2'] = 2,
                                        ['decals_1'] = 0,   ['decals_2'] = 0,
                                        ['arms'] = 88,
                                        ['pants_1'] = 160,   ['pants_2'] = 1,
                                        ['shoes_1'] = 52,   ['shoes_2'] = 0,
                                        ['helmet_1'] = -1,  ['helmet_2'] = 0,
                                        ['chain_1'] = 137,    ['chain_2'] = 0,
                                        ['ears_1'] = -1,     ['ears_2'] = 0,
                                        ['mask_1'] = 0,     ['mask_2'] = 0,
                                        ['bags_1'] = 106,     ['bags_2'] = 0,
                                        ['bproof_1'] = 61,     ['bproof_2'] = 0
                                    },
                                },
                            },
                            [5] = {
                                label = "ML Chaude",
                                grades = {["deputy2"] = true, ["deputy3"] = true, ["deputy_senior"] = true, ["sergeant"] = true, ["lieutenant"] = true, ["boss"] = true},
                                clothes = {
                                    ["male"] = {
                                        ['tshirt_1'] = 198,  ['tshirt_2'] = 1,
                                        ['torso_1'] = 442,   ['torso_2'] = 2,
                                        ['decals_1'] = 0,   ['decals_2'] = 0,
                                        ['arms'] = 1,
                                        ['pants_1'] = 146,   ['pants_2'] = 0,
                                        ['shoes_1'] = 54,   ['shoes_2'] = 0,
                                        ['helmet_1'] = -1,  ['helmet_2'] = 0,
                                        ['chain_1'] = 168,    ['chain_2'] = 0,
                                        ['ears_1'] = -1,     ['ears_2'] = 0,
                                        ['mask_1'] = 196,     ['mask_2'] = 0,
                                        ['bags_1'] = 108,     ['bags_2'] = 0,
                                        ['bproof_1'] = 61,     ['bproof_2'] = 0
                                    },
                                    ["female"] = {
                                        ['tshirt_1'] = 233,  ['tshirt_2'] = 1,
                                        ['torso_1'] = 443,   ['torso_2'] = 2,
                                        ['decals_1'] = 0,   ['decals_2'] = 0,
                                        ['arms'] = 3,
                                        ['pants_1'] = 160,   ['pants_2'] = 1,
                                        ['shoes_1'] = 52,   ['shoes_2'] = 0,
                                        ['helmet_1'] = -1,  ['helmet_2'] = 0,
                                        ['chain_1'] = 137,    ['chain_2'] = 0,
                                        ['ears_1'] = -1,     ['ears_2'] = 0,
                                        ['mask_1'] = 196,     ['mask_2'] = 0,
                                        ['bags_1'] = 106,     ['bags_2'] = 0,
                                        ['bproof_1'] = 61,     ['bproof_2'] = 0
                                    },
                                },
                            },
                            [6] = {
                                label = "Veste",
                                grades = {["deputy2"] = true, ["deputy3"] = true, ["deputy_senior"] = true, ["sergeant"] = true, ["lieutenant"] = true, ["boss"] = true},
                                clothes = {
                                    ["male"] = {
                                        ['tshirt_1'] = 198,  ['tshirt_2'] = 1,
                                        ['torso_1'] = 393,   ['torso_2'] = 0,
                                        ['decals_1'] = 0,   ['decals_2'] = 0,
                                        ['arms'] = 1,
                                        ['pants_1'] = 146,   ['pants_2'] = 0,
                                        ['shoes_1'] = 54,   ['shoes_2'] = 0,
                                        ['helmet_1'] = -1,  ['helmet_2'] = 0,
                                        ['chain_1'] = 168,    ['chain_2'] = 0,
                                        ['ears_1'] = -1,     ['ears_2'] = 0,
                                        ['mask_1'] = 196,     ['mask_2'] = 0,
                                        ['bags_1'] = 0,     ['bags_2'] = 0,
                                        ['bproof_1'] = 101,     ['bproof_2'] = 1
                                    },
                                    ["female"] = {
                                        ['tshirt_1'] = 233,  ['tshirt_2'] = 1,
                                        ['torso_1'] = 455,   ['torso_2'] = 0,
                                        ['decals_1'] = 0,   ['decals_2'] = 0,
                                        ['arms'] = 3,
                                        ['pants_1'] = 160,   ['pants_2'] = 1,
                                        ['shoes_1'] = 52,   ['shoes_2'] = 0,
                                        ['helmet_1'] = -1,  ['helmet_2'] = 0,
                                        ['chain_1'] = 137,    ['chain_2'] = 0,
                                        ['ears_1'] = -1,     ['ears_2'] = 0,
                                        ['mask_1'] = 196,     ['mask_2'] = 0,
                                        ['bags_1'] = 0,     ['bags_2'] = 0,
                                        ['bproof_1'] = 101,     ['bproof_2'] = 1
                                    },
                                },
                            },
                            [7] = {
                                label = "Manteau",
                                grades = {["deputy2"] = true, ["deputy3"] = true, ["deputy_senior"] = true, ["sergeant"] = true, ["lieutenant"] = true, ["boss"] = true},
                                clothes = {
                                    ["male"] = {
                                        ['tshirt_1'] = 198,  ['tshirt_2'] = 1,
                                        ['torso_1'] = 445,   ['torso_2'] = 1,
                                        ['decals_1'] = 0,   ['decals_2'] = 0,
                                        ['arms'] = 1,
                                        ['pants_1'] = 146,   ['pants_2'] = 0,
                                        ['shoes_1'] = 54,   ['shoes_2'] = 0,
                                        ['helmet_1'] = -1,  ['helmet_2'] = 0,
                                        ['chain_1'] = 168,    ['chain_2'] = 0,
                                        ['ears_1'] = -1,     ['ears_2'] = 0,
                                        ['mask_1'] = 0,     ['mask_2'] = 0,
                                        ['bags_1'] = 0,     ['bags_2'] = 0,
                                        ['bproof_1'] = 61,     ['bproof_2'] = 0
                                    },
                                    ["female"] = {
                                        ['tshirt_1'] = 233,  ['tshirt_2'] = 1,
                                        ['torso_1'] = 445,   ['torso_2'] = 2,
                                        ['decals_1'] = 0,   ['decals_2'] = 0,
                                        ['arms'] = 3,
                                        ['pants_1'] = 160,   ['pants_2'] = 1,
                                        ['shoes_1'] = 52,   ['shoes_2'] = 0,
                                        ['helmet_1'] = -1,  ['helmet_2'] = 0,
                                        ['chain_1'] = 137,    ['chain_2'] = 0,
                                        ['ears_1'] = -1,     ['ears_2'] = 0,
                                        ['mask_1'] = 0,     ['mask_2'] = 0,
                                        ['bags_1'] = 0,     ['bags_2'] = 0,
                                        ['bproof_1'] = 61,     ['bproof_2'] = 0
                                    },
                                },
                            },
                            [8] = {
                                label = "Manteau de pluie",
                                grades = {["deputy2"] = true, ["deputy3"] = true, ["deputy_senior"] = true, ["sergeant"] = true, ["lieutenant"] = true, ["boss"] = true},
                                clothes = {
                                    ["male"] = {
                                        ['tshirt_1'] = 198,  ['tshirt_2'] = 1,
                                        ['torso_1'] = 397,   ['torso_2'] = 1,
                                        ['decals_1'] = 0,   ['decals_2'] = 0,
                                        ['arms'] = 1,
                                        ['pants_1'] = 146,   ['pants_2'] = 0,
                                        ['shoes_1'] = 54,   ['shoes_2'] = 0,
                                        ['helmet_1'] = -1,  ['helmet_2'] = 0,
                                        ['chain_1'] = 168,    ['chain_2'] = 0,
                                        ['ears_1'] = -1,     ['ears_2'] = 0,
                                        ['mask_1'] = 196,     ['mask_2'] = 0,
                                        ['bags_1'] = 108,     ['bags_2'] = 0,
                                        ['bproof_1'] = 98,     ['bproof_2'] = 1
                                    },
                                    ["female"] = {
                                        ['tshirt_1'] = 233,  ['tshirt_2'] = 1,
                                        ['torso_1'] = 408,   ['torso_2'] = 1,
                                        ['decals_1'] = 0,   ['decals_2'] = 0,
                                        ['arms'] = 3,
                                        ['pants_1'] = 160,   ['pants_2'] = 1,
                                        ['shoes_1'] = 52,   ['shoes_2'] = 0,
                                        ['helmet_1'] = -1,  ['helmet_2'] = 0,
                                        ['chain_1'] = 137,    ['chain_2'] = 0,
                                        ['ears_1'] = -1,     ['ears_2'] = 0,
                                        ['mask_1'] = 196,     ['mask_2'] = 0,
                                        ['bags_1'] = 106,     ['bags_2'] = 0,
                                        ['bproof_1'] = 97,     ['bproof_2'] = 1
                                    },
                                },
                            },
                            [9] = {
                                label = "Formateur/Recruteur",
                                grades = {["deputy2"] = true, ["deputy3"] = true, ["deputy_senior"] = true, ["sergeant"] = true, ["lieutenant"] = true, ["boss"] = true},
                                clothes = {
                                    ["male"] = {
                                        ['tshirt_1'] = 198,  ['tshirt_2'] = 1,
                                        ['torso_1'] = 408,   ['torso_2'] = 0,
                                        ['decals_1'] = 0,   ['decals_2'] = 0,
                                        ['arms'] = 0,
                                        ['pants_1'] = 153,   ['pants_2'] = 3,
                                        ['shoes_1'] = 54,   ['shoes_2'] = 0,
                                        ['helmet_1'] = -1,  ['helmet_2'] = 0,
                                        ['chain_1'] = 168,    ['chain_2'] = 0,
                                        ['ears_1'] = -1,     ['ears_2'] = 0,
                                        ['mask_1'] = 0,     ['mask_2'] = 0,
                                        ['bags_1'] = 0,     ['bags_2'] = 0,
                                        ['bproof_1'] = 0,     ['bproof_2'] = 0
                                    },
                                    ["female"] = {
                                        ['tshirt_1'] = 233,  ['tshirt_2'] = 1,
                                        ['torso_1'] = 420,   ['torso_2'] = 2,
                                        ['decals_1'] = 0,   ['decals_2'] = 0,
                                        ['arms'] = 14,
                                        ['pants_1'] = 157,   ['pants_2'] = 4,
                                        ['shoes_1'] = 52,   ['shoes_2'] = 0,
                                        ['helmet_1'] = -1,  ['helmet_2'] = 0,
                                        ['chain_1'] = 137,    ['chain_2'] = 0,
                                        ['ears_1'] = -1,     ['ears_2'] = 0,
                                        ['mask_1'] = 0,     ['mask_2'] = 0,
                                        ['bags_1'] = 0,     ['bags_2'] = 0,
                                        ['bproof_1'] = 0,     ['bproof_2'] = 1
                                    },
                                },
                            },
                            [10] = {
                                label = "MC K-9",
                                grades = {["deputy2"] = true, ["deputy3"] = true, ["deputy_senior"] = true, ["sergeant"] = true, ["lieutenant"] = true, ["boss"] = true},
                                clothes = {
                                    ["male"] = {
                                        ['tshirt_1'] = 198,  ['tshirt_2'] = 1,
                                        ['torso_1'] = 415,   ['torso_2'] = 2,
                                        ['decals_1'] = 0,   ['decals_2'] = 0,
                                        ['arms'] = 11,
                                        ['pants_1'] = 153,   ['pants_2'] = 0,
                                        ['shoes_1'] = 54,   ['shoes_2'] = 0,
                                        ['helmet_1'] = 135,  ['helmet_2'] = 22,
                                        ['chain_1'] = 159,    ['chain_2'] = 0,
                                        ['ears_1'] = -1,     ['ears_2'] = 0,
                                        ['mask_1'] = 196,     ['mask_2'] = 0,
                                        ['bags_1'] = 108,     ['bags_2'] = 0,
                                        ['bproof_1'] = 61,     ['bproof_2'] = 0
                                    },
                                    ["female"] = {
                                        ['tshirt_1'] = 233,  ['tshirt_2'] = 1,
                                        ['torso_1'] = 426,   ['torso_2'] = 2,
                                        ['decals_1'] = 0,   ['decals_2'] = 0,
                                        ['arms'] = 9,
                                        ['pants_1'] = 157,   ['pants_2'] = 0,
                                        ['shoes_1'] = 52,   ['shoes_2'] = 0,
                                        ['helmet_1'] = 134,  ['helmet_2'] = 22,
                                        ['chain_1'] = 139,    ['chain_2'] = 0,
                                        ['ears_1'] = -1,     ['ears_2'] = 0,
                                        ['mask_1'] = 196,     ['mask_2'] = 0,
                                        ['bags_1'] = 106,     ['bags_2'] = 0,
                                        ['bproof_1'] = 61,     ['bproof_2'] = 0
                                    },
                                },
                            },
                            [11] = {
                                label = "ML K-9",
                                grades = {["deputy2"] = true, ["deputy3"] = true, ["deputy_senior"] = true, ["sergeant"] = true, ["lieutenant"] = true, ["boss"] = true},
                                clothes = {
                                    ["male"] = {
                                        ['tshirt_1'] = 198,  ['tshirt_2'] = 1,
                                        ['torso_1'] = 427,   ['torso_2'] = 2,
                                        ['decals_1'] = 0,   ['decals_2'] = 0,
                                        ['arms'] = 1,
                                        ['pants_1'] = 153,   ['pants_2'] = 0,
                                        ['shoes_1'] = 54,   ['shoes_2'] = 0,
                                        ['helmet_1'] = 135,  ['helmet_2'] = 22,
                                        ['chain_1'] = 159,    ['chain_2'] = 0,
                                        ['ears_1'] = -1,     ['ears_2'] = 0,
                                        ['mask_1'] = 196,     ['mask_2'] = 0,
                                        ['bags_1'] = 108,     ['bags_2'] = 0,
                                        ['bproof_1'] = 61,     ['bproof_2'] = 0
                                    },
                                    ["female"] = {
                                        ['tshirt_1'] = 233,  ['tshirt_2'] = 1,
                                        ['torso_1'] = 429,   ['torso_2'] = 2,
                                        ['decals_1'] = 0,   ['decals_2'] = 0,
                                        ['arms'] = 3,
                                        ['pants_1'] = 157,   ['pants_2'] = 0,
                                        ['shoes_1'] = 52,   ['shoes_2'] = 0,
                                        ['helmet_1'] = 134,  ['helmet_2'] = 22,
                                        ['chain_1'] = 139,    ['chain_2'] = 0,
                                        ['ears_1'] = -1,     ['ears_2'] = 0,
                                        ['mask_1'] = 196,     ['mask_2'] = 0,
                                        ['bags_1'] = 106,     ['bags_2'] = 0,
                                        ['bproof_1'] = 61,     ['bproof_2'] = 0
                                    },
                                },
                            },
                            [12] = {
                                label = "ML Moto",
                                grades = {["deputy2"] = true, ["deputy3"] = true, ["deputy_senior"] = true, ["sergeant"] = true, ["lieutenant"] = true, ["boss"] = true},
                                clothes = {
                                    ["male"] = {
                                        ['tshirt_1'] = 198,  ['tshirt_2'] = 1,
                                        ['torso_1'] = 442,   ['torso_2'] = 2,
                                        ['decals_1'] = 0,   ['decals_2'] = 0,
                                        ['arms'] = 20,
                                        ['pants_1'] = 140,   ['pants_2'] = 2,
                                        ['shoes_1'] = 33,   ['shoes_2'] = 0,
                                        ['helmet_1'] = 17,  ['helmet_2'] = 2,
                                        ['chain_1'] = 168,    ['chain_2'] = 0,
                                        ['ears_1'] = -1,     ['ears_2'] = 0,
                                        ['mask_1'] = 196,     ['mask_2'] = 0,
                                        ['bags_1'] = 108,     ['bags_2'] = 0,
                                        ['bproof_1'] = 96,     ['bproof_2'] = 0
                                    },
                                    ["female"] = {
                                        ['tshirt_1'] = 233,  ['tshirt_2'] = 1,
                                        ['torso_1'] = 443,   ['torso_2'] = 2,
                                        ['decals_1'] = 0,   ['decals_2'] = 0,
                                        ['arms'] = 23,
                                        ['pants_1'] = 147,   ['pants_2'] = 2,
                                        ['shoes_1'] = 40,   ['shoes_2'] = 0,
                                        ['helmet_1'] = 17,  ['helmet_2'] = 2,
                                        ['chain_1'] = 137,    ['chain_2'] = 0,
                                        ['ears_1'] = -1,     ['ears_2'] = 0,
                                        ['mask_1'] = 196,     ['mask_2'] = 0,
                                        ['bags_1'] = 106,     ['bags_2'] = 0,
                                        ['bproof_1'] = 68,     ['bproof_2'] = 0
                                    },
                                },
                            },
                            [13] = {
                                label = "Hélicoptère",
                                grades = {["deputy2"] = true, ["deputy3"] = true, ["deputy_senior"] = true, ["sergeant"] = true, ["lieutenant"] = true, ["boss"] = true},
                                clothes = {
                                    ["male"] = {
                                        ['tshirt_1'] = 233,  ['tshirt_2'] = 0,
                                        ['torso_1'] = 453,   ['torso_2'] = 1,
                                        ['decals_1'] = 0,   ['decals_2'] = 0,
                                        ['arms'] = 17,
                                        ['pants_1'] = 141,   ['pants_2'] = 1,
                                        ['shoes_1'] = 54,   ['shoes_2'] = 0,
                                        ['helmet_1'] = 79,  ['helmet_2'] = 3,
                                        ['chain_1'] = 168,    ['chain_2'] = 0,
                                        ['ears_1'] = -1,     ['ears_2'] = 0,
                                        ['mask_1'] = 200,     ['mask_2'] = 0,
                                        ['bags_1'] = 140,     ['bags_2'] = 0,
                                        ['bproof_1'] = 0,     ['bproof_2'] = 0
                                    },
                                    ["female"] = {
                                        ['tshirt_1'] = 241,  ['tshirt_2'] = 0,
                                        ['torso_1'] = 460,   ['torso_2'] = 1,
                                        ['decals_1'] = 0,   ['decals_2'] = 0,
                                        ['arms'] = 18,
                                        ['pants_1'] = 148,   ['pants_2'] = 1,
                                        ['shoes_1'] = 52,   ['shoes_2'] = 0,
                                        ['helmet_1'] = 78,  ['helmet_2'] = 3,
                                        ['chain_1'] = 137,    ['chain_2'] = 0,
                                        ['ears_1'] = -1,     ['ears_2'] = 0,
                                        ['mask_1'] = 199,     ['mask_2'] = 0,
                                        ['bags_1'] = 136,     ['bags_2'] = 0,
                                        ['bproof_1'] = 0,     ['bproof_2'] = 1
                                    },
                                },
                            },
                            [14] = {
                                label = "Sport",
                                grades = {["deputy2"] = true, ["deputy3"] = true, ["deputy_senior"] = true, ["sergeant"] = true, ["lieutenant"] = true, ["boss"] = true},
                                clothes = {
                                    ["male"] = {
                                        ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
                                        ['torso_1'] = 408,   ['torso_2'] = 0,
                                        ['decals_1'] = 0,   ['decals_2'] = 0,
                                        ['arms'] = 0,
                                        ['pants_1'] = 12,   ['pants_2'] = 0,
                                        ['shoes_1'] = 2,   ['shoes_2'] = 0,
                                        ['helmet_1'] = -1,  ['helmet_2'] = 3,
                                        ['chain_1'] = 0,    ['chain_2'] = 0,
                                        ['ears_1'] = -1,     ['ears_2'] = 0,
                                        ['mask_1'] = 0,     ['mask_2'] = 0,
                                        ['bags_1'] = 0,     ['bags_2'] = 0,
                                        ['bproof_1'] = 0,     ['bproof_2'] = 0
                                    },
                                    ["female"] = {
                                        ['tshirt_1'] = 14,  ['tshirt_2'] = 0,
                                        ['torso_1'] = 420,   ['torso_2'] = 1,
                                        ['decals_1'] = 0,   ['decals_2'] = 0,
                                        ['arms'] = 14,
                                        ['pants_1'] = 14,   ['pants_2'] = 9,
                                        ['shoes_1'] = 10,   ['shoes_2'] = 0,
                                        ['helmet_1'] = -1,  ['helmet_2'] = 3,
                                        ['chain_1'] = 0,    ['chain_2'] = 0,
                                        ['ears_1'] = -1,     ['ears_2'] = 0,
                                        ['mask_1'] = 0,     ['mask_2'] = 0,
                                        ['bags_1'] = 0,     ['bags_2'] = 0,
                                        ['bproof_1'] = 0,     ['bproof_2'] = 0
                                    },
                                },
                            },
                            [15] = {
                                label = "Vélo",
                                grades = {["deputy2"] = true, ["deputy3"] = true, ["deputy_senior"] = true, ["sergeant"] = true, ["lieutenant"] = true, ["boss"] = true},
                                clothes = {
                                    ["male"] = {
                                        ['tshirt_1'] = 198,  ['tshirt_2'] = 1,
                                        ['torso_1'] = 408,   ['torso_2'] = 2,
                                        ['decals_1'] = 0,   ['decals_2'] = 0,
                                        ['arms'] = 52,
                                        ['pants_1'] = 12,   ['pants_2'] = 0,
                                        ['shoes_1'] = 2,   ['shoes_2'] = 0,
                                        ['helmet_1'] = 49,  ['helmet_2'] = 0,
                                        ['chain_1'] = 168,    ['chain_2'] = 0,
                                        ['ears_1'] = -1,     ['ears_2'] = 0,
                                        ['mask_1'] = 0,     ['mask_2'] = 0,
                                        ['bags_1'] = 0,     ['bags_2'] = 0,
                                        ['bproof_1'] = 0,     ['bproof_2'] = 0
                                    },
                                    ["female"] = {
                                        ['tshirt_1'] = 233,  ['tshirt_2'] = 1,
                                        ['torso_1'] = 420,   ['torso_2'] = 2,
                                        ['decals_1'] = 0,   ['decals_2'] = 0,
                                        ['arms'] = 70,
                                        ['pants_1'] = 14,   ['pants_2'] = 9,
                                        ['shoes_1'] = 10,   ['shoes_2'] = 0,
                                        ['helmet_1'] = 47,  ['helmet_2'] = 0,
                                        ['chain_1'] = 137,    ['chain_2'] = 0,
                                        ['ears_1'] = -1,     ['ears_2'] = 0,
                                        ['mask_1'] = 0,     ['mask_2'] = 0,
                                        ['bags_1'] = 0,     ['bags_2'] = 0,
                                        ['bproof_1'] = 0,     ['bproof_2'] = 0
                                    },
                                },
                            },
                            [16] = {
                                label = "Inter légère",
                                grades = {["deputy2"] = true, ["deputy3"] = true, ["deputy_senior"] = true, ["sergeant"] = true, ["lieutenant"] = true, ["boss"] = true},
                                clothes = {
                                    ["male"] = {
                                        ['tshirt_1'] = 198,  ['tshirt_2'] = 1,
                                        ['torso_1'] = 427,   ['torso_2'] = 2,
                                        ['decals_1'] = 0,   ['decals_2'] = 0,
                                        ['arms'] = 172,
                                        ['pants_1'] = 153,   ['pants_2'] = 0,
                                        ['shoes_1'] = 25,   ['shoes_2'] = 0,
                                        ['helmet_1'] = 125,  ['helmet_2'] = 0,
                                        ['chain_1'] = 159,    ['chain_2'] = 0,
                                        ['ears_1'] = -1,     ['ears_2'] = 0,
                                        ['mask_1'] = 0,     ['mask_2'] = 0,
                                        ['bags_1'] = 0,     ['bags_2'] = 0,
                                        ['bproof_1'] = 68,     ['bproof_2'] = 1
                                    },
                                    ["female"] = {
                                        ['tshirt_1'] = 223,  ['tshirt_2'] = 1,
                                        ['torso_1'] = 429,   ['torso_2'] = 2,
                                        ['decals_1'] = 0,   ['decals_2'] = 0,
                                        ['arms'] = 18,
                                        ['pants_1'] = 157,   ['pants_2'] = 0,
                                        ['shoes_1'] = 25,   ['shoes_2'] = 0,
                                        ['helmet_1'] = 124,  ['helmet_2'] = 0,
                                        ['chain_1'] = 126,    ['chain_2'] = 0,
                                        ['ears_1'] = -1,     ['ears_2'] = 0,
                                        ['mask_1'] = 0,     ['mask_2'] = 0,
                                        ['bags_1'] = 0,     ['bags_2'] = 0,
                                        ['bproof_1'] = 81,     ['bproof_2'] = 1
                                    },
                                },
                            },
                            [17] = {
                                label = "Inter lourde",
                                grades = {["deputy2"] = true, ["deputy3"] = true, ["deputy_senior"] = true, ["sergeant"] = true, ["lieutenant"] = true, ["boss"] = true},
                                clothes = {
                                    ["male"] = {
                                        ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
                                        ['torso_1'] = 450,   ['torso_2'] = 1,
                                        ['decals_1'] = 0,   ['decals_2'] = 0,
                                        ['arms'] = 96,
                                        ['pants_1'] = 138,   ['pants_2'] = 1,
                                        ['shoes_1'] = 25,   ['shoes_2'] = 0,
                                        ['helmet_1'] = 75,  ['helmet_2'] = 1,
                                        ['chain_1'] = 154,    ['chain_2'] = 0,
                                        ['ears_1'] = -1,     ['ears_2'] = 0,
                                        ['mask_1'] = 0,     ['mask_2'] = 0,
                                        ['bags_1'] = 0,     ['bags_2'] = 0,
                                        ['bproof_1'] = 100,     ['bproof_2'] = 0
                                    },
                                    ["female"] = {
                                        ['tshirt_1'] = 14,  ['tshirt_2'] = 0,
                                        ['torso_1'] = 463,   ['torso_2'] = 1,
                                        ['decals_1'] = 0,   ['decals_2'] = 0,
                                        ['arms'] = 18,
                                        ['pants_1'] = 145,   ['pants_2'] = 1,
                                        ['shoes_1'] = 25,   ['shoes_2'] = 0,
                                        ['helmet_1'] = 74,  ['helmet_2'] = 1,
                                        ['chain_1'] = 121,    ['chain_2'] = 0,
                                        ['ears_1'] = -1,     ['ears_2'] = 0,
                                        ['mask_1'] = 0,     ['mask_2'] = 0,
                                        ['bags_1'] = 0,     ['bags_2'] = 0,
                                        ['bproof_1'] = 99,     ['bproof_2'] = 0
                                    },
                                },
                            },
                            [18] = {
                                label = "Detective",
                                grades = {["deputy2"] = true, ["deputy3"] = true, ["deputy_senior"] = true, ["sergeant"] = true, ["lieutenant"] = true, ["boss"] = true},		
                                clothes = {
                                    ["male"] = {
                                        ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
                                        ['torso_1'] = 446,   ['torso_2'] = 12,
                                        ['decals_1'] = 0,   ['decals_2'] = 0,
                                        ['arms'] = 4 ,
                                        ['pants_1'] = 10,   ['pants_2'] = 0,
                                        ['shoes_1'] = 10,   ['shoes_2'] = 0,
                                        ['helmet_1'] = -1,  ['helmet_2'] = 0,
                                        ['chain_1'] = 168,    ['chain_2'] = 0,
                                        ['ears_1'] = -1,     ['ears_2'] = 0,
                                        ['mask_1'] = 0,     ['mask_2'] = 0,
                                        ['bags_1'] = 0,     ['bags_2'] = 0,
                                        ['bproof_1'] = 87,     ['bproof_2'] = 1
                                    },
                                    ["female"] = {
                                        ['tshirt_1'] = 14,  ['tshirt_2'] = 1,
                                        ['torso_1'] = 447,   ['torso_2'] = 12,
                                        ['decals_1'] = 0,   ['decals_2'] = 0,
                                        ['arms'] = 3,
                                        ['pants_1'] = 133,   ['pants_2'] = 0,
                                        ['shoes_1'] = 29,   ['shoes_2'] = 0,
                                        ['helmet_1'] = -1,  ['helmet_2'] = 0,
                                        ['chain_1'] = 133,    ['chain_2'] = 0,
                                        ['ears_1'] = -1,     ['ears_2'] = 0,
                                        ['mask_1'] = 0,     ['mask_2'] = 0,
                                        ['bags_1'] = 0,     ['bags_2'] = 0,
                                        ['bproof_1'] = 89,     ['bproof_2'] = 1
                                    },
                                },
                            }, 
                        }, 
                    },   
                    [1] = {
                        submenu = "badges",
                        label = "Badges",
                        clothes = {
                            [0] = {
                                label = "Insigne MC - Dept. III",
                                grades = {["deputy3"] = true},
                                clothes = {
                                    ["male"] = {
                                        ['decals_1'] = 127,     ['decals_2'] = 0
                                    },
                                    ["female"] = {
                                        ['decals_1'] = 135,     ['decals_2'] = 0
                                    },
                                },
                            },
                            [1] = {
                                label = "Insigne MC - Dept. Senior",
                                grades = {["deputy_senior"] = true},
                                clothes = {
                                    ["male"] = {
                                        ['decals_1'] = 125,     ['decals_2'] = 0
                                    },
                                    ["female"] = {
                                        ['decals_1'] = 133,     ['decals_2'] = 0
                                    },
                                },
                            },
                            [2] = {
                                label = "Insigne MC - Sergeant",
                                grades = {["sergeant"] = true},
                                clothes = {
                                    ["male"] = {
                                        ['decals_1'] = 132,     ['decals_2'] = 0
                                    },
                                    ["female"] = {
                                        ['decals_1'] = 139,     ['decals_2'] = 0
                                    },
                                },
                            },
                            [3] = {
                                label = "Insigne ML - Dept. III",
                                grades = {["deputy3"] = true},
                                clothes = {
                                    ["male"] = {
                                        ['decals_1'] = 126,     ['decals_2'] = 0
                                    },
                                    ["female"] = {
                                        ['decals_1'] = 134,     ['decals_2'] = 0
                                    },
                                },
                            },
                            [4] = {
                                label = "Insigne ML - Dept. Senior",
                                grades = {["deputy_senior"] = true},
                                clothes = {
                                    ["male"] = {
                                        ['decals_1'] = 126,     ['decals_2'] = 2
                                    },
                                    ["female"] = {
                                        ['decals_1'] = 135,     ['decals_2'] = 0
                                    },
                                },
                            },
                            [5] = {
                                label = "Insigne ML - Sergeant",
                                grades = {["sergeant"] = true},
                                clothes = {
                                    ["male"] = {
                                        ['decals_1'] = 126,     ['decals_2'] = 3
                                    },
                                    ["female"] = {
                                        ['decals_1'] = 136,     ['decals_2'] = 0
                                    },
                                },
                            },
                            [6] = {
                                label = "Insigne CO - Lieutenant",
                                grades = {["lieutenant"] = true},
                                clothes = {
                                    ["male"] = {
                                        ['decals_1'] = 138,     ['decals_2'] = 6
                                    },
                                    ["female"] = {
                                        ['decals_1'] = 145,     ['decals_2'] = 6
                                    },
                                },
                            },
                            [7] = {
                                label = "Insigne CO - Captain",
                                grades = {["boss"] = true},
                                clothes = {
                                    ["male"] = {
                                        ['decals_1'] = 138,     ['decals_2'] = 7
                                    },
                                    ["female"] = {
                                        ['decals_1'] = 145,     ['decals_2'] = 7
                                    },
                                },
                            },
                            [8] = {
                                label = "Insigne CO - Commander",
                                grades = {["commander"] = true},
                                clothes = {
                                    ["male"] = {
                                        ['decals_1'] = 138,     ['decals_2'] = 8
                                    },
                                    ["female"] = {
                                        ['decals_1'] = 145,     ['decals_2'] = 8
                                    },
                                },
                            },
                            [9] = {
                                label = "Insigne CF - Lieutenant",
                                grades = {["lieutenant"] = true},
                                clothes = {
                                    ["male"] = {
                                        ['decals_1'] = 122,     ['decals_2'] = 6
                                    },
                                    ["female"] = {
                                        ['decals_1'] = 130,     ['decals_2'] = 6
                                    },
                                },
                            },
                            [10] = {
                                label = "Insigne CF - Captain",
                                grades = {["boss"] = true},
                                clothes = {
                                    ["male"] = {
                                        ['decals_1'] = 122,     ['decals_2'] = 7
                                    },
                                    ["female"] = {
                                        ['decals_1'] = 130,     ['decals_2'] = 7
                                    },
                                },
                            },
                            [11] = {
                                label = "Insigne CF - Commander",
                                grades = {["commander"] = true},
                                clothes = {
                                    ["male"] = {
                                        ['decals_1'] = 122,     ['decals_2'] = 8
                                    },
                                    ["female"] = {
                                        ['decals_1'] = 130,     ['decals_2'] = 8
                                    },
                                },
                            },
                        }
                    },
                    [2] = {
                        submenu = "kevlars",
                        label = "Kevlars",
                        clothes = {
                        }
                    },
                    [3] = {
                        submenu = "accessoires",
                        label = "Accessoires",
                        clothes = {
                        }
                    },
                }              
            },
        },
        PPA = {
            grades = {
                ["lieutenant"] = true,
                ["boss"] = true           
            }
        },
        Annonce = {
            grades = {
                ["lieutenant"] = true,
                ["boss"] = true       
            }
        },
    },
    ["fbi"] = {
        job = "fbi",
        name = "fbi",
        label = "Federal Bureau of Investigation",
        texture = "fbi",
        positions = {
            ["garage"] = {
                menuPos = vector3(60.847507476807,-752.77294921875,44.22029876709-0.9),
                vehicle = {
                    Pos = {
                        {pos = vector3(56.280109405518,-748.54840087891,43.737403869629), heading = 341.169},
                    },
                    Vehicles = {
                        {label = "Buffalo banalisée", veh = "fbi", stock = 2},
                        {label = "Granger banalisée", veh = "fbi2", stock = 2},
                    }
                },
                deleteVehicle = vector3(56.280620574951,-748.54876708984,43.740009307861-0.9)
            },
            ["armory"] = {
                giletPos = vector3(151.94502258301,-736.34613037109,242.15202331543-0.9),
                armoryPos = vector3(147.31370544434,-738.10192871094,242.15187072754-0.9),
                weapons = {
                    [0] = {name = "WEAPON_FLASHLIGHT", label = "Lampe torche", mingrade = 0},
                    [1] = {name = "WEAPON_NIGHTSTICK", label = "Matraque", mingrade = 0},
                    [2] = {name = "WEAPON_STUNGUN", label = "Pistolet paralysant", mingrade = 0},
                    [3] = {name = "WEAPON_COMBATPISTOL", label = "Pistolet de combat", mingrade = 0},
                    [4] = {name = "WEAPON_COMBATPDW", label = "Adp de combat", mingrade = 1},
                    [5] = {name = "WEAPON_PUMPSHOTGUN", label = "Fusil à Pompe", mingrade = 1},
                    [6] = {name = "WEAPON_CARBINERIFLE", label = "Carabine d'Assault", mingrade = 4},
                }
            }, -- Fin armory
            ["clothes"] = {
                menuPos = vector3(143.7738494873,-762.89636230469,242.15211486816-0.9),
                clothes = {
                    [0] = {
                        submenu = "clothes",
                        label = "Tenues",
                        clothes = {
                        }, 
                    },   
                    [1] = {
                        submenu = "badges",
                        label = "Badges",
                        clothes = {
                        }
                    },
                    [2] = {
                        submenu = "kevlars",
                        label = "Kevlars",
                        clothes = {
                        }
                    },
                    [3] = {
                        submenu = "accessoires",
                        label = "Accessoires",
                        clothes = {
                        }
                    },
                }            
            },
        },
        PPA = {
            grades = {
                ["agent"] = true,
                ["boss"] = true           
            }
        }, -- Fin PPA
    },
}

local function applySkinSpecific(vest,menu)
	TriggerEvent('Sneakyskinchanger:getSkin', function(skin)

		local uniformObject
		if skin.sex == 0 then
            uniformObject = vest.clothes["male"]
		else
            uniformObject = vest.clothes["female"]
		end

		if uniformObject then
			TriggerEvent('Sneakyskinchanger:loadClothes', skin, uniformObject)
		end

	end)
    if menu == "kevlars" then
        SetPedArmour(PlayerPedId(),200)
    end
end

local Keys = {
	['ESC'] = 322, ['F1'] = 288, ['F2'] = 289, ['F3'] = 170, ['F5'] = 166, ['F6'] = 167, ['F7'] = 168, ['F8'] = 169, ['F9'] = 56, ['F10'] = 57,
	['~'] = 243, ['1'] = 157, ['2'] = 158, ['3'] = 160, ['4'] = 164, ['5'] = 165, ['6'] = 159, ['7'] = 161, ['8'] = 162, ['9'] = 163, ['-'] = 84, ['='] = 83, ['BACKSPACE'] = 177,
	['TAB'] = 37, ['Q'] = 44, ['W'] = 32, ['E'] = 38, ['R'] = 45, ['T'] = 245, ['Y'] = 246, ['U'] = 303, ['P'] = 199, ['['] = 39, [']'] = 40, ['ENTER'] = 18,
	['CAPS'] = 137, ['A'] = 34, ['S'] = 8, ['D'] = 9, ['F'] = 23, ['G'] = 47, ['H'] = 74, ['K'] = 311, ['L'] = 182,
	['LEFTSHIFT'] = 21, ['Z'] = 20, ['X'] = 73, ['C'] = 26, ['V'] = 0, ['B'] = 29, ['N'] = 249, ['M'] = 244, [','] = 82, ['.'] = 81,
	['LEFTCTRL'] = 36, ['LEFTALT'] = 19, ['SPACE'] = 22, ['RIGHTCTRL'] = 70,
	['HOME'] = 213, ['PAGEUP'] = 10, ['PAGEDOWN'] = 11, ['DELETE'] = 178,
	['LEFT'] = 174, ['RIGHT'] = 175, ['TOP'] = 27, ['DOWN'] = 173,
	['NENTER'] = 201, ['N4'] = 108, ['N5'] = 60, ['N6'] = 107, ['N+'] = 96, ['N-'] = 97, ['N7'] = 117, ['N8'] = 61, ['N9'] = 118
}

local IsHandcuffed, handcuffTimer, isDead, blips, dragStatus = false, {}, false, {}, {}
dragStatus.isDragged = false
bloquertouchejojo = false
local count = 0
local AlreadyShoot = false

local function refresh()
    Citizen.CreateThread(function()
        ESX.PlayerData = ESX.GetPlayerData()	
    end)
end

local function CoolDown()
    Citizen.CreateThread(function()
        Citizen.Wait(30*1000)
        AlreadyShoot = false
    end)
end

local function DidShoot()
    local chance = 95
    if chance >= 95 then
        if not AlreadyShoot then
            local Player = PlayerPedId()
            if GetSelectedPedWeapon(Player) ~= 126349499 and GetSelectedPedWeapon(Player) ~= -1466123874 and GetSelectedPedWeapon(Player) ~= 600439132 and GetSelectedPedWeapon(Player) ~= 101631238 and GetSelectedPedWeapon(Player) ~= -1813897027 and GetSelectedPedWeapon(Player) ~= 741814745 and GetSelectedPedWeapon(Player) ~= -1420407917 and GetSelectedPedWeapon(Player) ~= 615608432 and GetSelectedPedWeapon(Player) ~= 1233104067 and GetSelectedPedWeapon(Player) ~= -37975472 and GetSelectedPedWeapon(Player) ~= -72657034 and GetSelectedPedWeapon(Player) ~= -1169823560 and GetSelectedPedWeapon(Player) ~= 911657153 and GetSelectedPedWeapon(Player) ~= 1198879012 and GetSelectedPedWeapon(Player) ~= -1569615261 and GetSelectedPedWeapon(Player) ~= -1716189206 and GetSelectedPedWeapon(Player) ~= 1737195953 and GetSelectedPedWeapon(Player) ~= 1317494643 and GetSelectedPedWeapon(Player) ~= -1786099057 and GetSelectedPedWeapon(Player) ~= -2067956739 and GetSelectedPedWeapon(Player) ~= 1141786504 and GetSelectedPedWeapon(Player) ~= -102323637 and GetSelectedPedWeapon(Player) ~= -1834847097 and GetSelectedPedWeapon(Player) ~= -102973651 and GetSelectedPedWeapon(Player) ~= -656458692 and GetSelectedPedWeapon(Player) ~= -581044007 and GetSelectedPedWeapon(Player) ~= -1951375401 and GetSelectedPedWeapon(Player) ~= -538741184 and GetSelectedPedWeapon(Player) ~= -1810795771 and GetSelectedPedWeapon(Player) ~= 419712736 and GetSelectedPedWeapon(Player) ~= -853065399 then
                AlreadyShoot = true
                TriggerServerEvent("sCall:SendCallMsg", "Shot fire", GetEntityCoords(PlayerPedId()), "police", false)
                TriggerServerEvent("sCall:SendCallMsg", "Shot fire", GetEntityCoords(PlayerPedId()), "lssd", false)
                TriggerServerEvent("sCall:SendCallMsg", "Shot fire", GetEntityCoords(PlayerPedId()), "fbi", false)
                CoolDown()
            end
        end
    end
end

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('Sneakyesx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end

    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(10)
    end

    if ESX.IsPlayerLoaded() then
        ESX.PlayerData = ESX.GetPlayerData()
    end
	
    while true do
        local Player = PlayerPedId()
        if IsPedShooting(Player) then
            Citizen.Wait(1)
            if PoliceJob[ESX.PlayerData.job.name] == nil then
                DidShoot()
            end
        else
            Citizen.Wait(100)
        end
    end 
end)

AddEventHandler('playerSpawned', function()
	isDead = false
	TriggerEvent('sPolice:unrestrain')

	if not hasAlreadyJoined then
		AtlantisRPEvent('sPolice:spawned')
	end

	hasAlreadyJoined = true
end)

AddEventHandler('Sneakyesx:onPlayerDeath', function(data)
	isDead = true
end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		TriggerEvent('sPolice:unrestrain')
	end
end)

RegisterNetEvent('renfortpolice:setBlip')
AddEventHandler('renfortpolice:setBlip', function(job, coords, raison)
	if raison == 'petit' then
		PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
		PlaySoundFrontend(-1, "OOB_Start", "GTAO_FM_Events_Soundset", 1)
		ESX.ShowAdvancedNotification(job..' INFORMATIONS', '~b~Demande de renfort', 'Demande de renfort demandé.\nRéponse: ~g~CODE-2\n~w~Importance : ~g~Légère.', 'CHAR_CALL911', 8)
		Wait(1000)
		PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
		color = 2
	elseif raison == 'importante' then
		PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
		PlaySoundFrontend(-1, "OOB_Start", "GTAO_FM_Events_Soundset", 1)
		ESX.ShowAdvancedNotification(job..' INFORMATIONS', '~b~Demande de renfort', 'Demande de renfort demandé.\nRéponse: ~g~CODE-3\n~w~Importance : ~o~Importante.', 'CHAR_CALL911', 8)
		Wait(1000)
		PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
		color = 47
	elseif raison == 'omgad' then
		PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
		PlaySoundFrontend(-1, "OOB_Start", "GTAO_FM_Events_Soundset", 1)
		PlaySoundFrontend(-1, "FocusIn", "HintCamSounds", 1)
		ESX.ShowAdvancedNotification(job..' INFORMATIONS', '~b~Demande de renfort', 'Demande de renfort demandé.\nRéponse: ~g~CODE-99\n~w~Importance : ~r~URGENTE !\nDANGER IMPORTANT', 'CHAR_CALL911', 8)
		Wait(1000)
		PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
		PlaySoundFrontend(-1, "FocusOut", "HintCamSounds", 1)
		color = 1
	end
	blipId = AddBlipForCoord(coords)
	SetBlipSprite(blipId, 161)
	SetBlipScale(blipId, 0.5)
	SetBlipColour(blipId, color)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString('Demande renfort')
	EndTextCommandSetBlipName(blipId)
	table.insert(blips, blipId)
	Wait(3 * 60000)
	for i, blipId in pairs(blips) do 
		RemoveBlip(blipId)
	end
end)

RegisterNetEvent('SneakyLife:ClientMessage')
AddEventHandler('SneakyLife:ClientMessage', function(job,msg)
    if job == "police" then
        label = "~b~Los Santos Police Department~s~"
    else
        label = "~b~Los Santos Sheriff's Department~s~"
    end
    ESX.ShowAdvancedNotification('Annonce', label, msg, 'CHAR_CALL911', 1)
end)

local function openGiletArmory(job)
    local mainMenu = RageUI.CreateMenu("", "Armurerie", nil, nil, "root_cause", job.texture)
    local gilet1Menu = RageUI.CreateSubMenu(mainMenu,"", "~b~Gilet par balle~s~")
    local gilet2Menu = RageUI.CreateSubMenu(mainMenu,"", "~b~Gilet par balle~s~")
    RageUI.Visible(mainMenu, not RageUI.Visible(mainMenu))
    while mainMenu do
        Wait(0)
        RageUI.IsVisible(mainMenu, true, false, false, function()
            ESX.ShowHelpNotification("Merci de prendre un seul gilet\nqui correspond à votre ~b~grade")
            RageUI.Button("Enlever votre gilet", nil, {RightLabel = "→"}, true, function(h,a,s)
                if s then
                    SetPedComponentVariation(GetPlayerPed(-1), 9, 0,0, 2)
                    SetPedArmour(PlayerPedId(), 0)
                end
            end)
            RageUI.Button("Gilet par balle :", nil, {RightLabel = "→"}, true, function(h,a,s)
            end,gilet1Menu)
            RageUI.Button("Variante gilet par balle :", nil, {RightLabel = "→"}, true, function(h,a,s)
            end,gilet2Menu)
        end)
        RageUI.IsVisible(gilet1Menu, true, false, false, function()
            for m = 1, 104 do
                RageUI.Button("Gilet n°"..m, nil, { RightLabel = "~g~→ Mettre" }, true, function(h,a,s)
                    if a then
                        gilet1 = m
                        gilet2 = 0
                        SetPedComponentVariation(GetPlayerPed(-1), 9, gilet1,gilet2, 2)
                        SetPedArmour(PlayerPedId(), 100)
                    end
                    if s then
                        SetPedComponentVariation(GetPlayerPed(-1), 9, gilet1,gilet2, 2)
                        --SetPedArmour(PlayerPedId(), 100)
                        RageUI.GoBack()
                    end
                end)
            end
        end)
        RageUI.IsVisible(gilet2Menu, true, false, false, function()
            local giletcolor = {}
            for i = 0 , GetNumberOfPedTextureVariations(GetPlayerPed(-1),2, gilet1) , 1 do
                giletcolor[i] = i
                RageUI.Button("Variante du gilet n°"..i, nil, { RightLabel = "~g~→ Mettre" }, true, function(h,a,s)
                    if a then
                        gilet2 = i
                        SetPedComponentVariation(GetPlayerPed(-1), 9, gilet1, gilet2, 2)
                    end
                    if s then
                        SetPedComponentVariation(GetPlayerPed(-1), 9, gilet1,gilet2, 2)
                        SetPedArmour(PlayerPedId(), 100)
                    end
                end)
            end
        end)
        if not RageUI.Visible(mainMenu) and not RageUI.Visible(gilet1Menu) and not RageUI.Visible(gilet2Menu) then
            mainMenu = RMenu:DeleteType('menu', true)
        end
    end
end

function KeyboardInputAnnounce(TextEntry, ExampleText, MaxStringLength)

	AddTextEntry('FMMC_KEY_TIP1', TextEntry .. ':')
	DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", ExampleText, "", "", "", MaxStringLength)
	blockinput = true

	while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
		Citizen.Wait(0)
	end

	if UpdateOnscreenKeyboard() ~= 2 then
		local result = GetOnscreenKeyboardResult()
		Citizen.Wait(500)
		blockinput = false
		return result
	else
		Citizen.Wait(500)
		blockinput = false
		return nil
	end
end


function openF6PoliceJob(job)
    local vehicleInfos = {}
    local function OpeninfosVehicle(vehicleData)
        ESX.TriggerServerCallback('sPolice:getVehicleInfos', function(retrivedInfo)
            table.insert(vehicleInfos, {plaque = retrivedInfo.plate, owner = retrivedInfo.owner})
        end, vehicleData.plate)
    end
    
    local IdentityCard = {}
    function PlayerIdentityCard()
        local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
        IdentityCard = {}
        ESX.TriggerServerCallback('sPolice:getPlayerInformation', function(data)
            table.insert(IdentityCard, {firstname = data.firstname,lastname = data.lastname,birthday = data.birthday, sex = data.sex, number = data.number, travail = data.travail, licenses = data.licenses })
        end, GetPlayerServerId(closestPlayer))
    end    

    local mainMenu = RageUI.CreateMenu("", "Menu d'intéractions",nil,nil,"root_cause",job.texture)
    local actionsMenu = RageUI.CreateSubMenu(mainMenu,"", "Menu d'intéractions")
    local amendes = RageUI.CreateSubMenu(mainMenu,"", "Menu d'intéractions")
    local licenses = RageUI.CreateSubMenu(mainMenu,"", "Menu d'intéractions")
    local facture = RageUI.CreateSubMenu(mainMenu,"", "Menu d'intéractions")
    local inventoryPlayer = RageUI.CreateSubMenu(mainMenu,"", "Menu d'intéractions")
    local papiersPlayer = RageUI.CreateSubMenu(mainMenu,"", "Menu d'intéractions")
    local actionsVehicle = RageUI.CreateSubMenu(mainMenu,"", "Menu d'intéractions")
    local infosVehicle = RageUI.CreateSubMenu(mainMenu,"", "Menu d'intéractions")
    local actionsCode = RageUI.CreateSubMenu(mainMenu,"", "Menu d'intéractions")

    infosVehicle.Closed = function()
        vehicleInfos = {}
    end
    mainMenu.EnableMouse = false

    RageUI.Visible(mainMenu, not RageUI.Visible(mainMenu))

    while mainMenu do
        Wait(0)
        RageUI.IsVisible(mainMenu, true, true, true, function()
            if job.Annonce.grades[ESX.PlayerData.job.grade_name] ~= nil then
                RageUI.Button("Annonce", nil, { RightLabel = "→" },true, function(h,a,s)
                    if s then
                        local msg = KeyboardInputAdmin("Annonce", "", 250)
                
                        msg = tostring(msg)
                        if msg ~= nil and msg ~= '' and msg ~= 'nil' then
                            TriggerServerEvent("SneakyLife:Message", job, msg)
                        else
                            ESX.ShowNotification("~r~Merci d'écrire le message correctement.")
                        end
                    end
                end)
            end
            RageUI.Button("Gestion citoyen", nil, { RightLabel = "→" },true, function(h,a,s)
            end,actionsMenu)
            RageUI.Button("Gestion véhicule", nil, { RightLabel = "→" },true, function(h,a,s)
            end,actionsVehicle)
            RageUI.Button("Gestion code", nil, { RightLabel = "→" },true, function(h,a,s)
            end,actionsCode)
            RageUI.Button("Gestion des appels", nil, { RightLabel = "→" },true, function(h,a,s)
                if s then
                    RageUI.CloseAll()
                    TriggerEvent("sCall:OpenCallMenu")
                end
            end)
        end)
        RageUI.IsVisible(actionsCode, true, true, true, function()
            RageUI.Button("Petite demande", nil, {RightLabel = "~g~→ Code 2"}, not CodeCooldown,function(h,a,s)
                if s then
                    local coords  = GetEntityCoords(PlayerPedId())
                    local raison = 'petit'
                    AtlantisRPEvent('sPolice:renfortPolice', coords, raison)
                    ExecuteCommand("me effectue un code 2...")
                    CodeCooldown = true
                    Citizen.SetTimeout(7000, function()
                        CodeCooldown = false
                    end)
                end
            end)
            RageUI.Button("Importante demande", nil, {RightLabel = "~o~→ Code 3"}, not CodeCooldown,function(h,a,s)
                if s then
                    local coords  = GetEntityCoords(PlayerPedId())
                    local raison = 'importante'
                    AtlantisRPEvent('sPolice:renfortPolice', coords, raison)
                    ExecuteCommand("me effectue un code 3...")
                    CodeCooldown = true
                    Citizen.SetTimeout(7000, function()
                        CodeCooldown = false
                    end)
                end
            end)
            RageUI.Button("Grosse demande", nil, {RightLabel = "~r~→ Code 99"}, not CodeCooldown,function(h,a,s)
                if s then
                    local coords  = GetEntityCoords(PlayerPedId())
                    local raison = 'omgad'
                    AtlantisRPEvent('sPolice:renfortPolice', coords, raison)
                    ExecuteCommand("me effectue un code 99...")
                    CodeCooldown = true
                    Citizen.SetTimeout(7000, function()
                        CodeCooldown = false
                    end)
                end
            end)
        end)
        RageUI.IsVisible(actionsVehicle, true, true, true, function()
            local coords  = GetEntityCoords(playerPed)
            local vehicle   = ESX.Game.GetVehicleInDirection()
            RageUI.Button("Infos véhicule", nil, {RightLabel = "→"}, true,function(h,a,s)
                if s then
                    local vehicleData = ESX.Game.GetVehicleProperties(vehicle)
                    if vehicleData ~= nil then

                        OpeninfosVehicle(vehicleData)
                    end
                end
            end, infosVehicle)
            RageUI.Button("Fourrière", nil, { RightLabel = "→" },true, function(h,a,s)
                if s then
                    local veh = ESX.Game.GetVehicleInDirection()
                    if not impound then
                            impound = true
                            impoundtask = ESX.SetTimeout(10000,function()
                                ClearPedTasks(PlayerPedId())
                                local ServerID = GetPlayerServerId(NetworkGetEntityOwner(veh))
                                AtlantisRPEvent("SneakyLife:Delete", VehToNet(veh), ServerID)
                                ESX.ShowHelpNotification("Mise en fourrière ~g~réussi~s~.")
                                impound = false
                            end)
                            ESX.ShowHelpNotification("Vous êtes en train de mettre en fourrière le ~b~véhicule~s~.")
                            TaskStartScenarioInPlace(PlayerPedId(), 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
                    end
                    Citizen.CreateThread(function()
                        while impound do
                            Citizen.Wait(1000)
                            local coords = GetEntityCoords(PlayerPedId())
                            veh = GetClosestVehicle(coords.x, coords.y, coords.z, 3.0, 0, 71)
                            if not DoesEntityExist(veh) and impound then
                                ESX.ShowHelpNotification("Mise en fourrière annulée.")
                                ESX.ClearTimeout(impoundtask)
                                ClearPedTasks(PlayerPedId())
                                impound = false
                                break
                            end
                        end
                    end)
                end
            end)
        end)
        RageUI.IsVisible(infosVehicle, true, true, true, function()
            RageUI.Separator("↓ Informations ↓")
            for i=1, #vehicleInfos do
                local vehicule = vehicleInfos[i]
                print(vehicule.owner)
                if vehicule.owner == nil then
                    RageUI.Button("~c~Propriétaire inconnu", nil, {}, true, function(h,a,s)
                        if s then
                        end
                    end)
                else
                    RageUI.Button("Propriétaire ~c~"..vehicule.owner, nil, {}, true, function(h,a,s)
                        if s then
                        end
                    end)
                end
            end
            local veh = ESX.Game.GetClosestVehicle(GetEntityCoords(PlayerPedId()))
            local plate = GetVehicleNumberPlateText(veh)
            RageUI.Button("Plaque ~c~"..plate, nil, {}, true,function(h,a,s)
            end)
            vievehicule = GetVehicleEngineHealth(veh)
            local vievehicule = math.floor(vievehicule)/10
            local label = "~s~/100"
            RageUI.Button("État du véhicule : ~g~"..vievehicule.. label , nil, {LeftBadge = nil,RightBadge = nil,RightLabel = ""}, true, function()
            end)
        end)
        RageUI.IsVisible(actionsMenu, true, true, true, function()
            closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
            RageUI.Button("Menotter", nil, {RightLabel = "→"}, closestPlayer ~= -1 and closestDistance <= 3.0,function(h,a,s)
                if s then
                    jojolocal = true
                    local target, distance = ESX.Game.GetClosestPlayer()
                    playerheading = GetEntityHeading(GetPlayerPed(-1))
                    playerlocation = GetEntityForwardVector(PlayerPedId())
                    playerCoords = GetEntityCoords(GetPlayerPed(-1))
                    local target_id = GetPlayerServerId(target)
                    if distance <= 2.0 then
                        AtlantisRPEvent('sPolice:requestarrest', target_id, playerheading, playerCoords, playerlocation)
                        Wait(5000)
                        AtlantisRPEvent('sPolice:handcuff', GetPlayerServerId(closestPlayer))
                    else
                        ESX.ShowNotification('Not Close Enough')
                    end
                end
            end)
            RageUI.Button("Démenotter", nil, {RightLabel = "→"}, closestPlayer ~= -1 and closestDistance <= 3.0,function(h,a,s)
                if s then
                    local target, distance = ESX.Game.GetClosestPlayer()
                    playerheading = GetEntityHeading(GetPlayerPed(-1))
                    playerlocation = GetEntityForwardVector(PlayerPedId())
                    playerCoords = GetEntityCoords(GetPlayerPed(-1))
                    local target_id = GetPlayerServerId(target)
                    AtlantisRPEvent('sPolice:requestrelease', target_id, playerheading, playerCoords, playerlocation)
                    Wait(5000)
                    AtlantisRPEvent('sPolice:handcuff2', GetPlayerServerId(closestPlayer))
                    IsHandcuffed = false
                end
            end)
            RageUI.Button("Escorter", nil, {RightLabel = "→"}, closestPlayer ~= -1 and closestDistance <= 3.0,function(h,a,s)
                if s then
                    AtlantisRPEvent('sPolice:drag', GetPlayerServerId(closestPlayer))
                end
            end)
            RageUI.Button("Mettre dans le véhicule", nil, {RightLabel = "→"}, closestPlayer ~= -1 and closestDistance <= 3.0,function(h,a,s)
                if s then
                    AtlantisRPEvent('sPolice:putInVehicle', GetPlayerServerId(closestPlayer))
                end
            end)
            RageUI.Button("Sortir du véhicule", nil, {RightLabel = "→"}, closestPlayer ~= -1 and closestDistance <= 3.0,function(h,a,s)
                if s then
                    AtlantisRPEvent('sPolice:OutVehicle', GetPlayerServerId(closestPlayer))
                end
            end)
            RageUI.Button("Fouiller", nil, {RightLabel = "→"}, closestPlayer ~= -1 and closestDistance <= 3.0,function(h,a,s)
                if s then
                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                    if closestPlayer ~= -1 and closestDistance <= 3.0 then
                        TriggerServerEvent("sPolice:OpenPlayerInventory",GetPlayerServerId(closestPlayer))
                        ExecuteCommand("me fouille un individu...")
                    else
                        ESX.ShowNotification("~b~Police~s~\nPersonne à proximité")
                    end
                end
            end, inventoryPlayer)

            RageUI.Button("Consulter les amendes impayées", nil, {RightLabel = "→"}, closestPlayer ~= -1 and closestDistance <= 3.0,function(h,a,s)
                if s then
                    ESX.TriggerServerCallback("sPolice:getBilling", function(result)
                        amendesTarget = result
                    end, GetPlayerServerId(closestPlayer))
                end
            end, amendes)

            RageUI.Button("Papiers de l'individu", nil, {RightLabel = "→"}, closestPlayer ~= -1 and closestDistance <= 3.0,function(h,a,s)
                if s then
                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                    if closestPlayer ~= -1 and closestDistance <= 3.0 then
                        PlayerIdentityCard()
                    else
                        ESX.ShowNotification("~b~Police~s~\nPersonne à proximité")
                    end
                end
            end, papiersPlayer)

            if job.PPA.grades[ESX.PlayerData.job.grade_name] ~= nil then
                RageUI.Button("Attribuer le permis port d'armes", nil, {RightLabel = "→"}, closestPlayer ~= -1 and closestDistance <= 3.0,function(h,a,s)
                    if s then
                        local player, distance = ESX.Game.GetClosestPlayer()  
                        if distance <= 2.0 then
                            ESX.TriggerServerCallback('Sneakyesx_license:checkLicense', function(hasWeaponLicense)
                                if not hasWeaponLicense then
                                    AtlantisRPEvent("sPolice:addLicense", GetPlayerServerId(player), "weapon")
                                else
                                    ESX.ShowNotification("~r~La personne possède déjà le permis port d'armes !")
                                end
                            end, GetPlayerServerId(player), 'weapon')
                        else
                            ESX.ShowNotification('~r~Erreur~s~- Aucun joueur à proximité')
                        end
                    end
                end)
            end
            RageUI.Button("Attribuer une facture", nil, {RightLabel = "→"}, true,function(h,a,s)
                if s then
                    TriggerEvent("sBill:CreateBill","society_"..ESX.PlayerData.job.name)
                    RageUI.CloseAll()
                end
            end)
        end)
        RageUI.IsVisible(amendes, true, true, true, function()
            if amendesTarget == nil then
                RageUI.Separator("")
                RageUI.Separator("~c~Chargement ...")
                RageUI.Separator("")
            else
                if #amendesTarget == 0 then
                    RageUI.Separator("")
                    RageUI.Separator("~c~Aucune amendes impayées !")
                    RageUI.Separator("")
                else
                    RageUI.Separator("↓ ~c~Liste des amendes impayées~s~ ↓")
                    for k,v in pairs(amendesTarget) do
                        RageUI.Button("Amende - "..v.label, "Prix: "..v.amount.."~g~$~s~", {}, true, function(h, a, s)
                        end)
                    end
                end
            end
        end)
        RageUI.IsVisible(papiersPlayer, true, true, true, function()
            closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
            for k,v in pairs(IdentityCard) do
                RageUI.Button("Prénom : ~b~"..v.firstname,nil,{RightLabel = ""},closestPlayer ~= -1 and closestDistance <= 3.0,function(_, _, s)
                end)
                RageUI.Button("Nom : ~b~"..v.lastname,nil,{RightLabel = ""},closestPlayer ~= -1 and closestDistance <= 3.0,function(_, _, s)
                end)
                RageUI.Button("Date de naissance : ~b~"..v.birthday,nil,{RightLabel = ""},closestPlayer ~= -1 and closestDistance <= 3.0,function(_, _, s)
                end)
                RageUI.Button("Numéro de téléphone : ~b~"..v.number,nil,{RightLabel = ""},closestPlayer ~= -1 and closestDistance <= 3.0,function(_, _, s)
                end)
                RageUI.Button("Profession : ~b~"..v.travail,nil,{RightLabel = ""},closestPlayer ~= -1 and closestDistance <= 3.0,function(_, _, s)
                end)
                RageUI.Button("License(s)", nil,{RightLabel = "→"},closestPlayer ~= -1 and closestDistance <= 3.0,function(_, _, s)
                    if s then
                        beforeInfo = v
                        ESX.TriggerServerCallback("sPolice:getLicenses", function(result)
                            resultLicenses = result
                        end, GetPlayerServerId(closestPlayer))
                    end
                end, licenses)
            end
        end)
        RageUI.IsVisible(licenses, true, true, true, function()
            if resultLicenses == nil then
                RageUI.Separator("")
                RageUI.Separator("~b~Chargement ...")
                RageUI.Separator("")
            else
                if #resultLicenses == 0 then
                    RageUI.Separator("")
                    RageUI.Separator("~b~Aucune license(s) !")
                    RageUI.Separator("")
                else
                    RageUI.Separator("↓ ~b~License(s)~s~ ↓")
                    for k,v in pairs(resultLicenses) do
                        RageUI.Button(v.label, nil, {RightLabel = "~b~Enlever~s~ →"}, closestPlayer ~= -1 and closestDistance <= 3.0, function(h, a, s)
                            if s then
                                AtlantisRPEvent("Sneakyesx_license:removeLicense", GetPlayerServerId(closestPlayer), v.type)
                                ESX.ShowNotification("Vous avez enlevé la license ~c~"..v.label.."~s~ à ~b~"..beforeInfo.firstname.."~s~ !")
                                Citizen.SetTimeout(250, function()
                                    ESX.TriggerServerCallback("sPolice:getLicenses", function(result)
                                        resultLicenses = result
                                    end, GetPlayerServerId(closestPlayer))
                                end)
                            end
                        end)
                    end
                end
            end
        end)
        RageUI.IsVisible(inventoryPlayer, true, true, true, function()
            closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
            for k,v in pairs(FouillerJoueurArgent) do
                RageUI.Button("Argent liquide "..v.amount.."~g~$~s~",nil,{RightLabel = "~g~Confisquer →"},closestPlayer ~= -1 and closestDistance <= 3.0,function(_, _, s)
                    if s then
                        local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                        if closestPlayer ~= -1 and closestDistance <= 3.0 then
                            local id = GetPlayerServerId(closestPlayer)
                            AtlantisRPEvent('sPolice:confiscatePlayerItem', id, 'item_account', 'cash', v.amount)
                            ESX.SetTimeout(100, function()
                                SearchPlayerInventory()
                            end)
                        else
                            ESX.ShowNotification("~b~Police~s~\nPersonne à proximité")
                            RageUI.GoBack()
                        end
                    end
                end)
                RageUI.Button("Source d'argent inconnue "..v.amount.."~g~$~s~",nil,{RightLabel = "~g~Confisquer →"},closestPlayer ~= -1 and closestDistance <= 3.0,function(_, _, s)
                    if s then
                        local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                        if closestPlayer ~= -1 and closestDistance <= 3.0 then
                            local id = GetPlayerServerId(closestPlayer)
                            AtlantisRPEvent('sPolice:confiscatePlayerItem', id, 'item_account', 'dirtycash', v.amount)
                            ESX.SetTimeout(100, function()
                                SearchPlayerInventory()
                            end)
                        else
                            ESX.ShowNotification("~b~Police~s~\nPersonne à proximité")
                            RageUI.GoBack()
                        end
                    end
                end)
            end
            for k,v in pairs(FouillerJoueurObjet) do
                RageUI.Button(v.label.." ~c~("..v.count..")",nil,{RightLabel = "~g~Confisquer →"},closestPlayer ~= -1 and closestDistance <= 3.0,function(_, _, s)
                    if s then
                        local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                        if closestPlayer ~= -1 and closestDistance <= 3.0 then
                            local id = GetPlayerServerId(closestPlayer)
                            AtlantisRPEvent('sPolice:confiscatePlayerItem', id, 'item_standard', v.name, v.count)
                            ESX.SetTimeout(100, function()
                                SearchPlayerInventory()
                            end)
                        else
                            ESX.ShowNotification("~b~Police~s~\nPersonne à proximité")
                            RageUI.GoBack()
                        end
                    end
                end)
            end
            for k,v in pairs(FouillerJoueurArmes) do
                RageUI.Button(v.label, nil,{RightLabel = "~g~Confisquer →"},closestPlayer ~= -1 and closestDistance <= 3.0,function(_, _, s)
                    if s then
                        local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                        if closestPlayer ~= -1 and closestDistance <= 3.0 then
                            local id = GetPlayerServerId(closestPlayer)
                            AtlantisRPEvent('sPolice:confiscatePlayerItem', id, 'item_weapon', v.name, v.ammo)
                            ESX.SetTimeout(100, function()
                                SearchPlayerInventory()
                            end)
                        else
                            ESX.ShowNotification("~b~Police~s~\nPersonne à proximité")
                            RageUI.GoBack()
                        end
                    end
                end)
            end
        end)

        if not RageUI.Visible(mainMenu) and not RageUI.Visible(actionsMenu) and not RageUI.Visible(licenses) and not RageUI.Visible(facture) and not RageUI.Visible(inventoryPlayer) and not RageUI.Visible(amendes) and not RageUI.Visible(papiersPlayer) and not RageUI.Visible(actionsVehicle) and not RageUI.Visible(infosVehicle) and not RageUI.Visible(actionsCode) then
            mainMenu = RMenu:DeleteType('menu', true)
        end
    end
end

local function DeleteVehiclePolice(job)
	local pPed = GetPlayerPed(-1)
	if IsPedInAnyVehicle(pPed, false) then
        local vehGarage = job.positions["garage"].vehicle.Vehicles
		local pVeh = GetVehiclePedIsIn(pPed, false)
		local model = GetEntityModel(pVeh)
		Citizen.CreateThread(function()
			ShowLoadingMessage("Rangement du véhicule ...", 1, 2500)
		end)
        local vehicle = GetVehiclePedIsIn(PlayerPedId(),  false)
        local plate = GetVehicleNumberPlateText(vehicle)
        AtlantisRPEvent('Sneakyesx_vehiclelock:deletekeyjobs', 'no', plate)
		TaskLeaveAnyVehicle(pPed, 1, 1)
		Wait(2500)
		while IsPedInAnyVehicle(pPed, false) do
			TaskLeaveAnyVehicle(pPed, 1, 1)
			ShowLoadingMessage("Rangement du véhicule ...", 1, 300)
			Wait(200)
		end
        TriggerEvent('persistent-vehicles/forget-vehicle', pVeh)
	    DeleteEntity(pVeh)
		for k,v in pairs(vehGarage) do
			if GetHashKey(v.veh) == model then
				vehGarage[k].stock = vehGarage[k].stock + 1
			end
		end
	else
		ESX.ShowNotification("Vous devez être dans un véhicule.")
	end
end

local function DeleteVehiclePoliceHelico(job)
	local pPed = GetPlayerPed(-1)
	if IsPedInAnyVehicle(pPed, false) then
        local vehGarage = job.positions["garagehelico"].vehicle.Vehicles
		local pVeh = GetVehiclePedIsIn(pPed, false)
		local model = GetEntityModel(pVeh)
		Citizen.CreateThread(function()
			ShowLoadingMessage("Rangement du véhicule ...", 1, 2500)
		end)
        local vehicle = GetVehiclePedIsIn(PlayerPedId(),  false)
        local plate = GetVehicleNumberPlateText(vehicle)
        AtlantisRPEvent('Sneakyesx_vehiclelock:deletekeyjobs', 'no', plate)
		TaskLeaveAnyVehicle(pPed, 1, 1)
		Wait(2500)
		while IsPedInAnyVehicle(pPed, false) do
			TaskLeaveAnyVehicle(pPed, 1, 1)
			ShowLoadingMessage("Rangement du véhicule ...", 1, 300)
			Wait(200)
		end
        TriggerEvent('persistent-vehicles/forget-vehicle', pVeh)
	    DeleteEntity(pVeh)
		for k,v in pairs(vehGarage) do
			if GetHashKey(v.veh) == model then
				vehGarage[k].stock = vehGarage[k].stock + 1
			end
		end
	else
		ESX.ShowNotification("Vous devez être dans un véhicule.")
	end
end

local function openGarage(job)
    local mainMenu = RageUI.CreateMenu("", "Garage", nil, nil, "root_cause", job.texture)
    RageUI.Visible(mainMenu, not RageUI.Visible(mainMenu))
    local vehPos = job.positions["garage"].vehicle.Pos
    local vehGarage = job.positions["garage"].vehicle.Vehicles
    while mainMenu do
        Wait(0)
        RageUI.IsVisible(mainMenu, true, false, false, function()
            RageUI.Separator("~b~↓~s~ Véhicule de service ~b~↓~s~")
            for k,v in pairs(vehGarage) do
                RageUI.Button(v.label, nil, {RightLabel = "Stock: [~b~"..v.stock.."~s~]"}, v.stock > 0, function(h,a,s)
                    if s then
                        local pos = FoundClearSpawnPoint(vehPos)
                        if pos ~= false then
                            LoadModel(v.veh)
                            if v.veh == "mocpacker" then
                                if job == "police" then
                                    pos.pos = vector3(-1066.8427734375,-868.47503662109,5.0357375144958)
                                elseif job == "lssd" then
                                    pos.pos = vector3(392.17407226562,-1621.6016845703,29.397064208984)
                                end
                            end
                            local veh = CreateVehicle(GetHashKey(v.veh), pos.pos, pos.heading, true, false)
                            SetEntityAsMissionEntity(veh, 1, 1)
                            SetVehicleDirtLevel(veh, 0.0)
                            ShowLoadingMessage("Véhicule de service sortie.", 2, 2000)
                            AtlantisRPEvent('Sneakyesx_vehiclelock:givekey', 'no', GetVehicleNumberPlateText(veh))
                            TriggerEvent('persistent-vehicles/register-vehicle', veh)
                            vehGarage[k].stock = vehGarage[k].stock - 1
                            Wait(350)
                        else
                            ESX.ShowNotification("Aucun point de sortie disponible")
                        end
                    end
                end)
            end
        end)
        if not RageUI.Visible(mainMenu) then
            mainMenu = RMenu:DeleteType('menu', true)
        end
    end
end

local function openGarageHelico(job)
    local mainMenu = RageUI.CreateMenu("", "Garage", nil, nil, "root_cause", job.texture)
    RageUI.Visible(mainMenu, not RageUI.Visible(mainMenu))
    local vehPos = job.positions["garagehelico"].vehicle.Pos
    local vehGarage = job.positions["garagehelico"].vehicle.Vehicles
    while mainMenu do
        Wait(0)
        RageUI.IsVisible(mainMenu, true, false, false, function()
            RageUI.Separator("~b~↓~s~ Véhicule de service ~b~↓~s~")
            for k,v in pairs(vehGarage) do
                RageUI.Button(v.label, nil, {RightLabel = "Stock: [~b~"..v.stock.."~s~]"}, v.stock > 0, function(h,a,s)
                    if s then
                        local pos = FoundClearSpawnPoint(vehPos)
                        if pos ~= false then
                            LoadModel(v.veh)
                            local veh = CreateVehicle(GetHashKey(v.veh), pos.pos, pos.heading, true, false)
                            SetVehicleLivery(veh,2)
                            SetEntityAsMissionEntity(veh, 1, 1)
                            SetVehicleDirtLevel(veh, 0.0)
                            ShowLoadingMessage("Véhicule de service sortie.", 2, 2000)
                            AtlantisRPEvent('Sneakyesx_vehiclelock:givekey', 'no', GetVehicleNumberPlateText(veh))
                            TriggerEvent('persistent-vehicles/register-vehicle', veh)
                            vehGarage[k].stock = vehGarage[k].stock - 1
                            Wait(350)
                        else
                            ESX.ShowNotification("Aucun point de sortie disponible")
                        end
                    end
                end)
            end
        end)
        if not RageUI.Visible(mainMenu) then
            mainMenu = RMenu:DeleteType('menu', true)
        end
    end
end

local function openArmory(job)
    local mainMenu = RageUI.CreateMenu("", "Armurerie", nil, nil, "root_cause", job.texture)
    RageUI.Visible(mainMenu, not RageUI.Visible(mainMenu))
    local weapons = job.positions["armory"].weapons
    while mainMenu do
        Wait(0)
        RageUI.IsVisible(mainMenu, true, false, false, function()
            ESX.ShowHelpNotification("Chaque arme empruntée doit être rendu des\n~r~sanctions~s~ seront prises si des armes sont perdues")
            RageUI.Button("Déposer ses armes de services", nil, {RightLabel = "~g~Déposer →"}, true, function(h,a,s)
                if s then
                    exports.inventaire:ResetWeaponSlots()
                    if HasPedGotWeapon(PlayerPedId(), "WEAPON_FLASHLIGHT", false) or HasPedGotWeapon(PlayerPedId(),"WEAPON_NIGHTSTICK",false) or HasPedGotWeapon(PlayerPedId(),"WEAPON_STUNGUN",false) or HasPedGotWeapon(PlayerPedId(),"WEAPON_COMBATPISTOL",false) or HasPedGotWeapon(PlayerPedId(),"WEAPON_PUMPSHOTGUN",false) or HasPedGotWeapon(PlayerPedId(),"WEAPON_CARBINERIFLE",false) then
                        SetCurrentPedWeapon(PlayerPedId(), "WEAPON_UNARMED", true)
                        AtlantisRPEvent("sPolice:removeWeapons")
                    else
                        ESX.ShowNotification("~b~Armurerie~s~\nVous n'avez pas d'arme à déposer")
                    end
                end
            end)
            for k,v in pairs(weapons) do
                RageUI.Button("Prendre un(e) "..v.label, nil, {RightLabel = "~g~Prendre →"}, ESX.PlayerData.job.grade >= v.mingrade, function(h, a, s)
                    if s then
                        if HasPedGotWeapon(PlayerPedId(),v.name,false) then
                            ESX.ShowNotification("~b~Armurerie~s~\nVous avez déjà pris un(e) "..v.label)
                        else
                            AtlantisRPEvent("sPolice:addWeapon", v.name)
                        end
                    end
                end)
            end
            RageUI.Button("Prendre une herse ", nil, {RightLabel = "~g~Prendre →"}, true, function(h, a, s)
                if s then
                    AtlantisRPEvent("sPolice:addHerse")
                end
            end)
        end)
        if not RageUI.Visible(mainMenu) then
            mainMenu = RMenu:DeleteType('menu', true)
        end
    end
end

local function openClothes(type, job)
    local mainMenu = RageUI.CreateMenu("", "~b~Vestiaire", nil, nil, "root_cause", job.texture)
    RageUI.Visible(mainMenu, not RageUI.Visible(mainMenu))
    local clothes = job.positions["clothes"].clothes
    local subMenus = {}

    if type == "police" then
        for k,v in pairs(clothes) do
            subMenus[v.submenu] = RageUI.CreateSubMenu(mainMenu, "", "~b~Vestiaire~s~ : "..v.label, nil, nil, "root_cause", job.texture)
        end
    end

    while mainMenu do
        Wait(0)
        RageUI.IsVisible(mainMenu, true, false, false, function()
            if type == "police" then
                for k,v in pairs(clothes) do
                    RageUI.Button(v.label, nil, {RightLabel = "→"}, true, function(h, a, s)
                    end, subMenus[v.submenu])
                end
            end
        end)
        
        for k,v in pairs(clothes) do
            RageUI.IsVisible(subMenus[v.submenu], true, false, false, function()
                if v.submenu == "clothes" then
                    RageUI.Button("Tenue civil", nil, {}, true, function(h, a, s)
                        if s then
                            ESX.TriggerServerCallback('Sneakyesx_skin:getPlayerSkin', function(skin)
                                TriggerEvent('Sneakyskinchanger:loadSkin', skin)
                                onService = false
                            end)
                        end
                    end)
                elseif v.submenu == "badges" then
                    RageUI.Button("Enlever votre badges", nil, {}, true, function(h,a,s)
                        if s then
                            SetPedComponentVariation(GetPlayerPed(-1), 5, 0,0, 2)
                        end
                    end)
                elseif v.submenu == "kevlars" then
                    RageUI.Button("Enlever votre gilet", nil, {}, true, function(h,a,s)
                        if s then
                            SetPedComponentVariation(GetPlayerPed(-1), 9, 0,0, 2)
                            SetPedArmour(PlayerPedId(), 0)
                        end
                    end)
                end

                local lastSubmenu = v.submenu
                for k,v in pairs(v.clothes) do
                    if v.grades[ESX.PlayerData.job.grade_name] ~= nil then
                        RageUI.Button(v.label, nil, {}, v.grades[ESX.PlayerData.job.grade_name] ~= nil, function(h, a, s)
                            if s then
                                onService = true
                                applySkinSpecific(v,lastSubmenu)
                            end
                        end)
                    end
                end
            end)
        end

        if not RageUI.Visible(mainMenu) and not RageUI.Visible(subMenus["clothes"]) and not RageUI.Visible(subMenus["badges"]) and not RageUI.Visible(subMenus["kevlars"]) and not RageUI.Visible(subMenus["accessoires"]) then
            mainMenu = RMenu:DeleteType('menu', true)
        end
    end
end

Citizen.CreateThread(function()

    while ESX == nil do
        TriggerEvent('Sneakyesx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end

    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(10)
    end

    if ESX.IsPlayerLoaded() then
        ESX.PlayerData = ESX.GetPlayerData()
    end

    while true do
        local nofps = false
        local myCoords = GetEntityCoords(PlayerPedId())

        for k,v in pairs(PoliceJob) do

            if ESX.PlayerData.job.name == v.job then

                -- Garage
                if #(myCoords-v.positions["garage"].menuPos) < 1.5 then
                    nofps = true
                    ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour ouvrir le ~b~garage~s~.")
                    if IsControlJustReleased(0, 38) then
                        if onService then
                            openGarage(v)
                        else
                            ESX.ShowNotification("Vous n'êtes pas en ~r~service~s~.")
                        end
                    end
                elseif #(myCoords-v.positions["garage"].deleteVehicle) < 3.5 then
                    nofps = true
                    ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour ranger le véhicule de service")
                    if IsControlJustPressed(0, 51) then
                        if onService then
                            DeleteVehiclePolice(v)
                        else
                            ESX.ShowNotification("Vous n'êtes pas en ~r~service~s~.")
                        end
                    end
                end

                if #(myCoords-v.positions["garagehelico"].menuPos) < 1.5 then
                    nofps = true
                    ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour prendre un ~b~hélico~s~.")
                    if IsControlJustReleased(0, 38) then
                        if onService then
                            openGarageHelico(v)
                        else
                            ESX.ShowNotification("Vous n'êtes pas en ~r~service~s~.")
                        end
                    end
                elseif #(myCoords-v.positions["garagehelico"].deleteVehicle) < 3.5 then
                    nofps = true
                    ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour ranger ~b~l'hélicoptère~s~.")
                    if IsControlJustPressed(0, 51) then
                        if onService then
                            DeleteVehiclePoliceHelico(v)
                        else
                            ESX.ShowNotification("Vous n'êtes pas en ~r~service~s~.")
                        end
                    end
                end

                if #(myCoords-v.positions["armory"].giletPos) < 1.5 then
                    nofps = true
                    ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour accéder au ~b~gilet par balle~s~.")
                    if IsControlJustReleased(0, 38) then
                        openGiletArmory(v)
                    end
                end

                -- Armory
                if #(myCoords-v.positions["armory"].armoryPos) < 1.5 then
                    nofps = true
                    ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour ouvrir l'~b~armurerie~s~.")
                    if IsControlJustReleased(0, 38) then
                        if onService then
                            openArmory(v)
                        else
                            ESX.ShowNotification("Vous n'êtes pas en ~r~service~s~.")
                        end
                    end
                end

                -- Clothes
                if #(myCoords-v.positions["clothes"].menuPos) < 1.5 then
                    nofps = true
                    ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour ouvrir le ~b~vestiaire~s~.")
                    if IsControlJustReleased(0, 38) then
                        openClothes("police", v)
                    end
                end

            end
        end

        if nofps then
            Wait(1)
        else
            Wait(850)
        end
    end

end)


RegisterNetEvent('sPolice:handcuff')
AddEventHandler('sPolice:handcuff', function()
	IsHandcuffed    = true
    bloquertouchejojo = true
	local playerPed = PlayerPedId()
    Citizen.CreateThread(function()
        while true do
            if bloquertouchejojo then
                Wait(0)
                DisableControlAction(0, 2, true)
                DisableControlAction(0, 6, true)
                DisableControlAction(0, 288, true)
                DisableControlAction(0, 318, true)
                DisableControlAction(0, 168, true)
                DisableControlAction(0, 327, true)
                DisableControlAction(0, 166, true)
                DisableControlAction(0, 289, true)
                DisableControlAction(0, 305, true)
                DisableControlAction(0, 331, true)
                DisableControlAction(0, 330, true)
                DisableControlAction(0, 329, true)
                DisableControlAction(0, 132, true)
                DisableControlAction(0, 246, true)
                DisableControlAction(0, 36, true)
                DisableControlAction(0, 18, true)
                DisableControlAction(0, 106, true)
                DisableControlAction(0, 122, true)
                DisableControlAction(0, 135, true)
                DisableControlAction(0, 19, true) -- INPUT_CHARACTER_WHEEL
                DisableControlAction(0, 21, true) -- INPUT_SPRINT
                DisableControlAction(0, 22, true) -- INPUT_JUMP
                DisableControlAction(0, 23, true) -- INPUT_ENTER
                DisableControlAction(0, 24, true) -- INPUT_ATTACK
                DisableControlAction(0, 25, true) -- INPUT_AIM
                DisableControlAction(0, 26, true) -- INPUT_LOOK_BEHIND
                DisableControlAction(0, 38, true) -- INPUT KEY
                DisableControlAction(0, 44, true) -- INPUT_COVER
                DisableControlAction(0, 45, true) -- INPUT_RELOAD
                DisableControlAction(0, 50, true) -- INPUT_ACCURATE_AIM
                DisableControlAction(0, 51, true) -- CONTEXT KEY
                DisableControlAction(0, 58, true) -- INPUT_THROW_GRENADE
                DisableControlAction(0, 59, true) -- INPUT_VEH_MOVE_LR
                DisableControlAction(0, 60, true) -- INPUT_VEH_MOVE_UD
                DisableControlAction(0, 61, true) -- INPUT_VEH_MOVE_UP_ONLY
                DisableControlAction(0, 62, true) -- INPUT_VEH_MOVE_DOWN_ONLY
                DisableControlAction(0, 63, true) -- INPUT_VEH_MOVE_LEFT_ONLY
                DisableControlAction(0, 64, true) -- INPUT_VEH_MOVE_RIGHT_ONLY
                DisableControlAction(0, 65, true) -- INPUT_VEH_SPECIAL
                DisableControlAction(0, 66, true) -- INPUT_VEH_GUN_LR
                DisableControlAction(0, 67, true) -- INPUT_VEH_GUN_UD
                DisableControlAction(0, 68, true) -- INPUT_VEH_AIM
                DisableControlAction(0, 69, true) -- INPUT_VEH_ATTACK
                DisableControlAction(0, 70, true) -- INPUT_VEH_ATTACK2
                DisableControlAction(0, 71, true) -- INPUT_VEH_ACCELERATE
                DisableControlAction(0, 72, true) -- INPUT_VEH_BRAKE
                DisableControlAction(0, 73, true) -- INPUT_VEH_DUCK
                DisableControlAction(0, 74, true) -- INPUT_VEH_HEADLIGHT
                DisableControlAction(0, 75, true) -- INPUT_VEH_EXIT
                DisableControlAction(0, 76, true) -- INPUT_VEH_HANDBRAKE
                DisableControlAction(0, 86, true) -- INPUT_VEH_HORN
                DisableControlAction(0, 92, true) -- INPUT_VEH_PASSENGER_ATTACK
                DisableControlAction(0, 114, true) -- INPUT_VEH_FLY_ATTACK
                DisableControlAction(0, 140, true) -- INPUT_MELEE_ATTACK_LIGHT
                DisableControlAction(0, 141, true) -- INPUT_MELEE_ATTACK_HEAVY
                DisableControlAction(0, 142, true) -- INPUT_MELEE_ATTACK_ALTERNATE
                DisableControlAction(0, 143, true) -- INPUT_MELEE_BLOCK
                DisableControlAction(0, 144, true) -- PARACHUTE DEPLOY
                DisableControlAction(0, 145, true) -- PARACHUTE DETACH
                DisableControlAction(0, 156, true) -- INPUT_MAP
                DisableControlAction(0, 157, true) -- INPUT_SELECT_WEAPON_UNARMED
                DisableControlAction(0, 158, true) -- INPUT_SELECT_WEAPON_MELEE
                DisableControlAction(0, 159, true) -- INPUT_SELECT_WEAPON_HANDGUN
                DisableControlAction(0, 160, true) -- INPUT_SELECT_WEAPON_SHOTGUN
                DisableControlAction(0, 161, true) -- INPUT_SELECT_WEAPON_SMG
                DisableControlAction(0, 162, true) -- INPUT_SELECT_WEAPON_AUTO_RIFLE
                DisableControlAction(0, 163, true) -- INPUT_SELECT_WEAPON_SNIPER
                DisableControlAction(0, 164, true) -- INPUT_SELECT_WEAPON_HEAVY
                DisableControlAction(0, 165, true) -- INPUT_SELECT_WEAPON_SPECIAL
                DisableControlAction(0, 183, true) -- GCPHONE
                DisableControlAction(0, 243, true) -- INPUT_ENTER_CHEAT_CODE
                DisableControlAction(0, 244, true) -- PERSONAL MENU
                DisableControlAction(0, 257, true) -- INPUT_ATTACK2
                DisableControlAction(0, 261, true) -- INPUT_PREV_WEAPON
                DisableControlAction(0, 262, true) -- INPUT_NEXT_WEAPON
                DisableControlAction(0, 263, true) -- INPUT_MELEE_ATTACK1
                DisableControlAction(0, 264, true) -- INPUT_MELEE_ATTACK2
                DisableControlAction(0, Keys['K'], true)
                DisableControlAction(0, Keys['L'], true)
                DisableControlAction(0, Keys['B'], true)
                DisableControlAction(0, Keys['U'], true)
                DisableControlAction(0, Keys['X'], true)
                DisableControlAction(0, Keys['F1'], true)
                DisableControlAction(0, Keys['F2'], true)
                DisableControlAction(0, Keys['F5'], true)
                DisableControlAction(0, Keys['F6'], true)
                DisableControlAction(0, Keys['F7'], true)
                DisableControlAction(0, Keys['F9'], true)
                DisableControlAction(0, Keys['F10'], true)
            else
                Wait(100)
            end
        end
    end)
	Citizen.CreateThread(function()
		if IsHandcuffed then

			RequestAnimDict('mp_arresting')
			while not HasAnimDictLoaded('mp_arresting') do
				Citizen.Wait(100)
			end

			TaskPlayAnim(playerPed, 'mp_arresting', 'idle', 8.0, -8, -1, 49, 0, 0, 0, 0)

			SetEnableHandcuffs(playerPed, true)
			DisablePlayerFiring(playerPed, true)
			SetCurrentPedWeapon(playerPed, GetHashKey('WEAPON_UNARMED'), true) -- unarm player
			SetPedCanPlayGestureAnims(playerPed, false)
		end
	end)

end)

RegisterNetEvent('sPolice:handcuff2')
AddEventHandler('sPolice:handcuff2', function()
    IsHandcuffed = false
	IsMenotter = true
	local playerPed = PlayerPedId()
	Citizen.CreateThread(function()
		if IsMenotter then
			SetEnableHandcuffs(playerPed, false)
			DisablePlayerFiring(playerPed, false)
			SetCurrentPedWeapon(playerPed, GetHashKey('WEAPON_UNARMED'), false) -- unarm player
			SetPedCanPlayGestureAnims(playerPed, true)
		end
	end)

end)

RegisterNetEvent('sPolice:unrestrain')
AddEventHandler('sPolice:unrestrain', function()
	if IsHandcuffed then
		local playerPed = PlayerPedId()
		IsHandcuffed = false

		ClearPedSecondaryTask(playerPed)
		SetEnableHandcuffs(playerPed, false)
		DisablePlayerFiring(playerPed, false)
		SetPedCanPlayGestureAnims(playerPed, true)
		FreezeEntityPosition(playerPed, false)
		DisplayRadar(true)
	end
end)

RegisterNetEvent('sPolice:drag')
AddEventHandler('sPolice:drag', function(copId)
	if not IsHandcuffed then
		return
	end

	dragStatus.isDragged = not dragStatus.isDragged
	dragStatus.CopId = copId
end)

Citizen.CreateThread(function()
	local playerPed
	local targetPed

	while true do
		Citizen.Wait(0)

		if IsHandcuffed then
			time = 0
			playerPed = PlayerPedId()

			if dragStatus.isDragged then
				targetPed = GetPlayerPed(GetPlayerFromServerId(dragStatus.CopId))
                
				if not IsPedSittingInAnyVehicle(targetPed) then
					AttachEntityToEntity(playerPed, targetPed, 11816, 0.54, 0.54, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
				else
					dragStatus.isDragged = false
					DetachEntity(playerPed, true, false)
				end

				if IsPedDeadOrDying(targetPed, true) then
					dragStatus.isDragged = false
					DetachEntity(playerPed, true, false)
				end

			else
				DetachEntity(playerPed, true, false)
			end
		else
			Citizen.Wait(500)
		end
	end
end)

RegisterNetEvent('sPolice:putInVehicle')
AddEventHandler('sPolice:putInVehicle', function()
	local playerPed = PlayerPedId()
	local coords = GetEntityCoords(playerPed)

	if not IsHandcuffed then
		return
	end

	if IsAnyVehicleNearPoint(coords, 5.0) then
		local vehicle = GetClosestVehicle(coords, 5.0, 0, 71)

		if DoesEntityExist(vehicle) then
			local maxSeats, freeSeat = GetVehicleMaxNumberOfPassengers(vehicle)

			for i=maxSeats - 1, 0, -1 do
				if IsVehicleSeatFree(vehicle, i) then
					freeSeat = i
					break
				end
			end

			if freeSeat then
				TaskWarpPedIntoVehicle(playerPed, vehicle, freeSeat)
				dragStatus.isDragged = false
			end
		end
	end
end)

RegisterNetEvent('sPolice:OutVehicle')
AddEventHandler('sPolice:OutVehicle', function()
	local playerPed = PlayerPedId()

	if not IsPedSittingInAnyVehicle(playerPed) then
		return
	end

	local vehicle = GetVehiclePedIsIn(playerPed, false)
	TaskLeaveVehicle(playerPed, vehicle, 16)
end)

-- Handcuff
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local playerPed = PlayerPedId()

		if IsHandcuffed then

			if IsEntityPlayingAnim(playerPed, 'mp_arresting', 'idle', 3) ~= 1 then
				ESX.Streaming.RequestAnimDict('mp_arresting', function()
					TaskPlayAnim(playerPed, 'mp_arresting', 'idle', 8.0, -8, -1, 49, 0.0, false, false, false)
				end)
			end
		else
			Citizen.Wait(500)
		end
	end
end)



-- Nouvelle menotte 

function loadanimdict(dictname)
	if not HasAnimDictLoaded(dictname) then
		RequestAnimDict(dictname) 
		while not HasAnimDictLoaded(dictname) do 
			Citizen.Wait(1)
		end
		RemoveAnimDict(dictname)
	end
end


RegisterNetEvent('sPolice:getarrested')
AddEventHandler('sPolice:getarrested', function(playerheading, playercoords, playerlocation)
	playerPed = GetPlayerPed(-1)
	SetCurrentPedWeapon(playerPed, GetHashKey('WEAPON_UNARMED'), true) -- unarm player
	local x, y, z   = table.unpack(playercoords + playerlocation * 1.0)
	SetEntityCoords(GetPlayerPed(-1), x, y, z)
	SetEntityHeading(GetPlayerPed(-1), playerheading)
	Citizen.Wait(250)
	loadanimdict('mp_arrest_paired')
	TaskPlayAnim(GetPlayerPed(-1), 'mp_arrest_paired', 'crook_p2_back_right', 8.0, -8, 3750 , 2, 0, 0, 0, 0)
	Citizen.Wait(3760)
	IsHandcuffed = true
	loadanimdict('mp_arresting')
	TaskPlayAnim(GetPlayerPed(-1), 'mp_arresting', 'idle', 8.0, -8, -1, 49, 0.0, false, false, false)
end)

RegisterNetEvent('sPolice:doarrested')
AddEventHandler('sPolice:doarrested', function()
	Citizen.Wait(250)
	loadanimdict('mp_arrest_paired')
	TaskPlayAnim(GetPlayerPed(-1), 'mp_arrest_paired', 'cop_p2_back_right', 8.0, -8,3750, 2, 0, 0, 0, 0)
	Citizen.Wait(3000)

end) 

RegisterNetEvent('sPolice:douncuffing')
AddEventHandler('sPolice:douncuffing', function()
	Citizen.Wait(250)
	loadanimdict('mp_arresting')
	TaskPlayAnim(GetPlayerPed(-1), 'mp_arresting', 'a_uncuff', 8.0, -8,-1, 2, 0, 0, 0, 0)
	Citizen.Wait(5500)
	ClearPedTasks(GetPlayerPed(-1))
end)

RegisterNetEvent('sPolice:getuncuffed')
AddEventHandler('sPolice:getuncuffed', function(playerheading, playercoords, playerlocation)
	local x, y, z   = table.unpack(playercoords + playerlocation * 1.0)
	z = z - 1.0
	SetEntityCoords(GetPlayerPed(-1), x, y, z)
	SetEntityHeading(GetPlayerPed(-1), playerheading)
	Citizen.Wait(250)
	loadanimdict('mp_arresting')
	TaskPlayAnim(GetPlayerPed(-1), 'mp_arresting', 'b_uncuff', 8.0, -8,-1, 2, 0, 0, 0, 0)
	Citizen.Wait(5500)
	IsHandcuffed = false
    bloquertouchejojo = false
	ClearPedTasks(GetPlayerPed(-1))
end)

function CheckServiceLspdLssd()
    return onService
end
