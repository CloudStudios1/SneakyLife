IsVip = false

function GetVIP()
    return IsVip
end

RegisterNetEvent('Mowgli:updateVIP')
AddEventHandler('Mowgli:updateVIP',function(vip)
    IsVip = vip
end)