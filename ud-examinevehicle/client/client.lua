local sphereZones = {}

RegisterNUICallback('hideFrame', function(_, cb)
    toggleNuiFrame(false)
    cb({})
end)

RegisterCommand('examinevehicle', function()
    toggleNuiFrame(true)
    ExamineVehicleMenu()
end, false)

RegisterNetEvent('ud-examinevehicle:Menu')
AddEventHandler('ud-examinevehicle:Menu', function()
    toggleNuiFrame(true)
    ExamineVehicleMenu()
end)

exports.ox_target:addGlobalVehicle({
    {
        name = 'examine_vehicle',
        icon = 'fas fa-wrench',
        label = 'Examine Vehicle',
        distance = 3.0,
        event = 'ud-examinevehicle:Menu',
        canInteract = function(entity)
            return DoesEntityExist(entity)
        end
    }
})