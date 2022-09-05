local display = false
local result = {}


--very important cb 
RegisterNUICallback("exit", function(data)
    SetDisplay(false)
end)


RegisterNUICallback("sendInformation", function(data)
	result = data
	SetDisplay(false) 
end)

RegisterNUICallback("main", function(data)
    SetDisplay(false)
end)

function NeoInput(data)    
	SetDisplay(not display, data)
 
	while display and json.encode(result) == "[]" do 
		Citizen.Wait(600)
		if not display and json.encode(result) == "[]" then 
			print('annulated')
			return nil
		end   
		if not display and json.encode(result) ~= "[]" then 
			
			return result
		end 
	end 
end


function SetDisplay(bool, information)
    display = bool
    SetNuiFocus(bool, bool)
    SendNUIMessage({
        type = "ui",
        status = bool,
		data = information
    })
end
