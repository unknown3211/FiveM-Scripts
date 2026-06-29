function toggleNuiFrame(shouldShow)
    SetNuiFocus(shouldShow, shouldShow)
    SendReactMessage('setVisible', shouldShow)
end

function ExamineVehicleMenu()
    local player = PlayerPedId()
    local coords = GetEntityCoords(player)
    local vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 5.0, 0, 71)

    if vehicle and vehicle ~= 0 then
        local plate = GetVehicleNumberPlateText(vehicle)
        local engineHealth = GetVehicleEngineHealth(vehicle)
        local vehTemp = GetVehicleEngineTemperature(vehicle)
        local bodyHealth = GetVehicleBodyHealth(vehicle)
        local tankHealth = GetVehiclePetrolTankHealth(vehicle)
        local model = GetEntityModel(vehicle)
        local displayName = GetDisplayNameFromVehicleModel(model)
        local fuel = GetVehicleFuelLevel(vehicle)

        if displayName == "CARNOTFOUND" then
            displayName = "Unknown Vehicle"
        end

        SendNUIMessage({
            action = "ShowData",
            data = {
                plate = plate,
                fuel = fuel,
                engineHealth = engineHealth,
                vehTemp = vehTemp,
                bodyHealth = bodyHealth,
                tankHealth = tankHealth,
                displayName = displayName
            } 
        })
    else
        print("No vehicle found !")
    end
end