ESX = nil

Citizen.CreateThread(function()
  while ESX == nil do
      TriggerEvent('Sneakyesx:getSharedObject', function(obj) ESX = obj end)
      Wait(10)
  end
end)

Citizen.CreateThread(function()
  while true do
    if IsPauseMenuActive() and not IsPaused then
	  IsPaused = true
    SendNUIMessage({action = "toggle", show = false})
    elseif not IsPauseMenuActive() and IsPaused then
    IsPaused = false
    SendNUIMessage({action = "toggle", show = true})
    end
    Citizen.Wait(150)
  end
end)

Citizen.CreateThread(function()
  while true do
    if exports.inventaire:GetStateInventory() and not IsInventory then
      IsInventory = true
    SendNUIMessage({action = "toggle", show = false})
    elseif not exports.inventaire:GetStateInventory() and IsInventory then
      IsInventory = false
    SendNUIMessage({action = "toggle", show = true})
    end
    Citizen.Wait(150)
  end
end)

AddEventHandler('Sneakyesx_newui:updateBasics', function(status)
  SendNUIMessage({action = "updateStatus", status = status})
end)

function CreateStatus(name, default, color, tickCallback)
local self = {}

self.val = default
self.name = name
self.default = default
self.color = color
self.tickCallback = tickCallback

self.onTick = function()
  self.tickCallback(self)
end

self.set = function(val)
  self.val = val
end

self.add = function(val)
  if self.val + val > 1000000 then
    self.val = 1000000
  else
    self.val = self.val + val
  end
end

self.remove = function(val)
  if self.val - val < 0 then
    self.val = 0
  else
    self.val = self.val - val
  end
end

self.reset = function()
  self.set(self.default)
end

self.getPercent = function()
  return (self.val / 1000000) * 100
end

return self
end

local IsAnimated = false
local IsAlreadyDrunk = false
local DrunkLevel = -1
local IsAlreadyDrug = false

function DrunkEffect(level, start)
Citizen.CreateThread(function()
  local playerPed = PlayerPedId()

  if start then
    DoScreenFadeOut(800)
    Citizen.Wait(1000)
  end

  if level == 0 then
    ESX.Streaming.RequestAnimSet("move_m@drunk@slightlydrunk")

    SetPedMovementClipset(playerPed, "move_m@drunk@slightlydrunk", true)
    RemoveAnimSet("move_m@drunk@slightlydrunk")
  elseif level == 1 then
    ESX.Streaming.RequestAnimSet("move_m@drunk@moderatedrunk")

    SetPedMovementClipset(playerPed, "move_m@drunk@moderatedrunk", true)
    RemoveAnimSet("move_m@drunk@moderatedrunk")
  elseif level == 2 then
    ESX.Streaming.RequestAnimSet("move_m@drunk@verydrunk")

    SetPedMovementClipset(playerPed, "move_m@drunk@verydrunk", true)
    RemoveAnimSet("move_m@drunk@verydrunk")
  end

  SetTimecycleModifier("spectator5")
  SetPedMotionBlur(playerPed, true)
  SetPedIsDrunk(playerPed, true)

  if start then
    DoScreenFadeIn(800)
  end
end)
end

function OverdoseEffect()
Citizen.CreateThread(function()
  local playerPed = PlayerPedId()

  SetEntityHealth(playerPed, 0)
  ClearTimecycleModifier()
  ResetScenarioTypesEnabled()
  ResetPedMovementClipset(playerPed, 0.0)
  SetPedIsDrug(playerPed, false)
  SetPedMotionBlur(playerPed, false)
end)
end

function StopEffect()
Citizen.CreateThread(function()
  local playerPed = PlayerPedId()

  DoScreenFadeOut(800)
  Citizen.Wait(1000)

  ClearTimecycleModifier()
  ResetScenarioTypesEnabled()
  ResetPedMovementClipset(playerPed, 0.0)
  SetPedIsDrunk(playerPed, false)
  SetPedMotionBlur(playerPed, false)

  DoScreenFadeIn(800)
end)
end

RegisterNetEvent('Sneakyesx_status:resetStatus')
AddEventHandler('Sneakyesx_status:resetStatus', function()
for i = 1, #Status, 1 do
  Status[i].reset()
end
end)

RegisterNetEvent('Sneakyesx_status:healPlayer')
AddEventHandler('Sneakyesx_status:healPlayer', function()
TriggerEvent('Sneakyesx_status:set', 'hunger', 1000000)
TriggerEvent('Sneakyesx_status:set', 'thirst', 1000000)

local playerPed = PlayerPedId()
SetEntityHealth(playerPed, GetEntityMaxHealth(playerPed))
end)

RegisterNetEvent('Sneakyesx_status:removeTest')
AddEventHandler('Sneakyesx_status:removeTest', function()
TriggerEvent('Sneakyesx_status:set', 'hunger', 0)
TriggerEvent('Sneakyesx_status:set', 'thirst', 0)

local playerPed = PlayerPedId()
SetEntityHealth(playerPed, GetEntityMaxHealth(playerPed))
end)

Status = {}
function GetStatus(name, cb)
for i = 1, #Status, 1 do
  if Status[i].name == name then
    cb(Status[i])
    return
  end
end
end

function GetStatusData(minimal)
local status = {}

for i = 1, #Status, 1 do
  if minimal then
    table.insert(status, {
      name = Status[i].name,
      val = Status[i].val,
      percent = (Status[i].val / 1000000) * 100
    })
  else
    table.insert(status, {
      name = Status[i].name,
      val = Status[i].val,
      color = Status[i].color,
      max = Status[i].max,
      percent = (Status[i].val / 1000000) * 100
    })
  end
end

return status
end

function RegisterStatus(name, default, color, tickCallback)
local status = CreateStatus(name, default, color, tickCallback)
table.insert(Status, status)
end

RegisterNetEvent('Sneakyesx_status:load')
AddEventHandler('Sneakyesx_status:load', function(status)
  for i = 1, #Status, 1 do
    for j = 1, #status, 1 do
      if Status[i].name == status[j].name then
        Status[i].set(status[j].val)
    end
  end
end

Citizen.CreateThread(function()
  while true do
    for i = 1, #Status, 1 do
      Status[i].onTick()
    end

    TriggerEvent('Sneakyesx_newui:updateBasics', GetStatusData(true))
    Citizen.Wait(1000)
  end
end)
end)

RegisterNetEvent('Sneakyesx_status:set')
AddEventHandler('Sneakyesx_status:set', function(name, val)
for i = 1, #Status, 1 do
  if Status[i].name == name then
    Status[i].set(val)
    break
  end
end

TriggerServerEvent('Sneakyesx_status:update', GetStatusData(true))
TriggerEvent('Sneakyesx_newui:updateBasics', GetStatusData(true))
end)

RegisterNetEvent('Sneakyesx_status:add')
AddEventHandler('Sneakyesx_status:add', function(name, val)
for i = 1, #Status, 1 do
  if Status[i].name == name then
    Status[i].add(val)
    break
  end
end

TriggerServerEvent('Sneakyesx_status:update', GetStatusData(true))
TriggerEvent('Sneakyesx_newui:updateBasics', GetStatusData(true))
end)

AddEventHandler('Sneakyesx_status:remove', function(name, val)
  for i = 1, #Status, 1 do
    if Status[i].name == name then
      Status[i].remove(val)
      break
    end
  end
  TriggerServerEvent('Sneakyesx_status:update', GetStatusData(true))
  TriggerEvent('Sneakyesx_newui:updateBasics', GetStatusData(true))
end)

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(30000)
    TriggerServerEvent('Sneakyesx_status:update', GetStatusData(true))
  end
end)

Citizen.CreateThread(function()
RegisterStatus('hunger', 1000000, '#b51515', function(status)
  status.remove(50)
end)

RegisterStatus('thirst', 1000000, '#0172ba', function(status)
  status.remove(50)
end)

RegisterStatus('drunk', 0, '#8F15A5', function(status)
  status.remove(1500)
end)

RegisterStatus('drug', 0, '#9ec617', function(status)
  status.remove(1500)
end)

while true do
  Citizen.Wait(1000)
  local playerPed = PlayerPedId()
  local prevHealth = GetEntityHealth(playerPed)
  local health = prevHealth

  if health > 0 then
    GetStatus('hunger', function(status)
      if status.val <= 0 then
        health = health - 1
      end
    end)

    GetStatus('thirst', function(status)
      if status.val <= 0 then
        health = health - 1
      end
    end)

    GetStatus('drunk', function(status)
      if status.val > 0 then
        local start = true

        if IsAlreadyDrunk then
          start = false
        end

        local level = 0

        if status.val <= 250000 then
          level = 0
        elseif status.val <= 500000 then
          level = 1
        else
          level = 2
        end

        if level ~= DrunkLevel then
          DrunkEffect(level, start)
        end

        IsAlreadyDrunk = true
        DrunkLevel = level
      else
        if IsAlreadyDrunk then
          StopEffect()
        end

        IsAlreadyDrunk = false
        DrunkLevel = -1
      end
    end)

    GetStatus('drug', function(status)
      if status.val > 0 then
        if status.val >= 1000000 then
          OverdoseEffect()
        end

        IsAlreadyDrug = true
      else
        if IsAlreadyDrug then
          StopEffect()
        end

        IsAlreadyDrug = false
      end
    end)

    if health ~= prevHealth then
      if not exports.mCore:GetStatutComa() then
        SetEntityHealth(playerPed,  health)
      end
    end
  else
    if IsAlreadyDrunk or IsAlreadyDrug then
      StopEffect()
    end

    IsAlreadyDrunk = false
    IsAlreadyDrug = false
    DrunkLevel = -1
  end
end
end)
RegisterNetEvent("SneakyLife:addStatus")
AddEventHandler("SneakyLife:addStatus", function(r, g, b, type)
local pPed = PlayerPedId()
if not exports["mCore"]:ProgressBarExists() then
  exports["mCore"]:ProgressBar("Action en cours", r, g, b, 200, 3000)
end
if not isAnimated then
  isAnimated = true
  if type == "drink" then
    Citizen.CreateThread(function()
      local x,y,z = table.unpack(GetEntityCoords(pPed))
      prop = CreateObject(GetHashKey("prop_ld_flow_bottle"), x, y, z+0.2,  true,  true, true)			
      AttachEntityToEntity(prop, pPed, GetPedBoneIndex(pPed, 18905), 0.12, 0.028, 0.001, 10.0, 175.0, 0.0, true, true, false, true, 1, true)
      RequestAnimDict('mp_player_intdrink')  
      while not HasAnimDictLoaded('mp_player_intdrink') do
        Wait(0)
      end
      TaskPlayAnim(pPed, 'mp_player_intdrink', 'loop_bottle', 1.0, -1.0, 2000, 0, 1, true, true, true)
      Wait(3000)
      IsAnimated = false
      ClearPedSecondaryTask(pPed)
      DeleteObject(prop)
    end)
  else
    Citizen.CreateThread(function()
      local x,y,z = table.unpack(GetEntityCoords(pPed))
      prop = CreateObject(GetHashKey("prop_cs_burger_01"), x, y, z+0.2,  true,  true, true)
      AttachEntityToEntity(prop, pPed, GetPedBoneIndex(pPed, 18905), 0.12, 0.028, 0.001, 10.0, 175.0, 0.0, true, true, false, true, 1, true)
      RequestAnimDict('mp_player_inteat@burger')
      while not HasAnimDictLoaded('mp_player_inteat@burger') do
        Wait(0)
      end
      TaskPlayAnim(pPed, 'mp_player_inteat@burger', 'mp_player_int_eat_burger_fp', 8.0, -8, -1, 49, 0, 0, 0, 0)
      Wait(3000)
      IsAnimated = false
      ClearPedSecondaryTask(pPed)
      DeleteObject(prop)
    end)
  end
  Wait(2000)
  ClearPedSecondaryTask(pPed)
end
end)

RegisterNetEvent('Sneakyesx_status:onDrinkAlcohol')
AddEventHandler('Sneakyesx_status:onDrinkAlcohol', function()
if not IsAnimated then
  IsAnimated = true

  Citizen.CreateThread(function()
    local playerPed = PlayerPedId()
    TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_DRINKING", 0, true)
    Citizen.Wait(10000)
    IsAnimated = false
    ClearPedTasksImmediately(playerPed)
  end)
end
end)

RegisterNetEvent('Sneakyesx_status:onWeed')
AddEventHandler('Sneakyesx_status:onWeed', function()
if not IsAnimated then
  IsAnimated = true

  Citizen.CreateThread(function()
    local playerPed = PlayerPedId()

    ESX.Streaming.RequestAnimSet("move_m@hipster@a")

    TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_SMOKING_POT", 0, true)
    Citizen.Wait(3000)
    IsAnimated = false
    ClearPedTasksImmediately(playerPed)
    SetTimecycleModifier("spectator5")
    SetPedMotionBlur(playerPed, true)
    SetPedMovementClipset(playerPed, "move_m@hipster@a", true)
    RemoveAnimSet("move_m@hipster@a")
    SetPedIsDrunk(playerPed, true)
  end)
end
end)

RegisterNetEvent('Sneakyesx_status:onMeth')
AddEventHandler('Sneakyesx_status:onMeth', function()
  if not IsAnimated then
    IsAnimated = true

    Citizen.CreateThread(function()
      local playerPed = PlayerPedId()

      ESX.Streaming.RequestAnimSet("move_injured_generic")

      TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_SMOKING_POT", 0, true)
      Citizen.Wait(3000)
      IsAnimated = false
      ClearPedTasksImmediately(playerPed)
      SetTimecycleModifier("spectator5")
      SetPedMotionBlur(playerPed, true)
      SetPedMovementClipset(playerPed, "move_injured_generic", true)
      RemoveAnimSet("move_injured_generic")
      SetPedIsDrunk(playerPed, true)
    end)
  end
end)

RegisterNetEvent('Sneakyesx_status:onCoke')
AddEventHandler('Sneakyesx_status:onCoke', function()
  if not IsAnimated then
    IsAnimated = true

    Citizen.CreateThread(function()
      local playerPed = PlayerPedId()

      ESX.Streaming.RequestAnimSet("move_m@hurry_butch@a")

      TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_SMOKING_POT", 0, true)
      Citizen.Wait(3000)
      IsAnimated = false
      ClearPedTasksImmediately(playerPed)
      SetTimecycleModifier("spectator5")
      SetPedMotionBlur(playerPed, true)
      SetPedMovementClipset(playerPed, "move_m@hurry_butch@a", true)
      RemoveAnimSet("move_m@hurry_butch@a")
      SetPedIsDrunk(playerPed, true)
    end)
  end
end)