local UD = exports['ud-base']:FetchModules()
local loaded = false

RegisterNetEvent('ud-interface:client:CloseCharUI')
AddEventHandler('ud-interface:client:CloseCharUI', function()
    SendNUIMessage({action = "hide"})
end)

local function toggleNuiFrame(shouldShow)
  SetNuiFocus(false, false)
  SendReactMessage('setVisible', true)
end

Citizen.CreateThread(function()
  while true do
    Wait(100)
    toggleNuiFrame(true)
  end
end)

RegisterNUICallback('hideFrame', function(_, cb)
  toggleNuiFrame(false)
  cb({})
end)

-- Notify --

function Notify(type, text, duration)
  SendNUIMessage({
      type = 'showNotification',
      notificationType = type,
      text = text,
      duration = duration
  })
end

exports('Notify', Notify)

RegisterNetEvent('ud-interface:Notify')
AddEventHandler('ud-interface:Notify', function(type, text, duration)
  Notify(type, text, duration)
end)

-- Progressbar --

function Progressbar(color, duration, callback)
  if callback then
    SendNUIMessage({
        type = 'showProgressbar',
        color = color,
        duration = duration
    })
    callback(true)
  else
    callback(false)
  end
end

exports('Progressbar', Progressbar)

-- Status HUD --

function StatusHudShow(title, content)
  if title and content then
      SendNUIMessage({
          action = "openstatushud",
          title = title,
          content = content
      })
  end
end

function StatusHudClose()
  SendNUIMessage({
      action = "closestatushud",
  })
end

exports("StatusHudShow", StatusHudShow)
exports("StatusHudClose", StatusHudClose)