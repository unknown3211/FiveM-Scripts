Citizen.CreateThread(function()
    for _, info in pairs(Config.Blips) do
        info.blip = AddBlipForCoord(info.x, info.y, info.z)
        SetBlipSprite(info.blip, info.id)
        SetBlipDisplay(info.blip, 4)
        SetBlipScale(info.blip, 0.55)
        SetBlipColour(info.blip, info.colour)
        SetBlipAsShortRange(info.blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(info.title)
        EndTextCommandSetBlipName(info.blip)
    end
    for _, zone in pairs(Config.Zones) do
        exports.ox_target:addSphereZone({
            coords = zone.coords,
            radius = 0.3,
            debug = drawZones,
            options = {
                {
                    name = zone.name,
                    event = zone.event,
                    icon = 'fa-solid fa-circle',
                    label = zone.label
                }
            }
        })
    end
end)

function TeleportPlayer(player, coords, heading)
    if not player or not coords or not heading then
        print("Failed To Teleport Player Due To Invalid Args")
        return
    end
    SetEntityCoords(player, coords.x, coords.y, coords.z, false, false, false, true)
    SetEntityHeading(player, heading)
end