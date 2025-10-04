local instances = {}

RegisterNetEvent('ud-apartments:RequestStorage')
AddEventHandler('ud-apartments:RequestStorage', function(playerId)
    local src = source
    local stashId = 'aptstash_' .. playerId

    local storage = {
        id = stashId,
        label = Config.StashLabel,
        slots = Config.StrageSlots,
        weight = Config.StorageWeight,
        owner = playerId
    }

    exports.ox_inventory:RegisterStash(storage.id, storage.label, storage.slots, storage.weight, storage.owner)
    TriggerClientEvent('ud-apartments:OpenStorageClient', src, stashId)
end)
RegisterNetEvent("ud-apartments:server:EnterApartment")
AddEventHandler("ud-apartments:server:EnterApartment", function()
    local src = source
    if not instances[src] then
        instances[src] = {id = src}
    end
    SetPlayerRoutingBucket(src, instances[src].id)
    TriggerClientEvent("ud-apartments:EnterApartment", src, instances[src].id)
end)

RegisterNetEvent("ud-apartments:server:ExitApartment")
AddEventHandler("ud-apartments:server:ExitApartment", function()
    local src = source
    SetPlayerRoutingBucket(src, 0)
    instances[src] = nil
    TriggerClientEvent("ud-apartments:ExitApartment", src)
end)

RegisterNetEvent("ud-apartments:server:InvitePlayer")
AddEventHandler("ud-apartments:server:InvitePlayer", function(targetPlayerId)
    local src = source
    if instances[src] then
        if not instances[src].invitedPlayers then
            instances[src].invitedPlayers = {}
        end
        table.insert(instances[src].invitedPlayers, targetPlayerId)
        TriggerClientEvent("ud-apartments:NotifyInvite", targetPlayerId, src)
    end
end)

RegisterNetEvent("ud-apartments:server:AcceptInvite")
AddEventHandler("ud-apartments:server:AcceptInvite", function(invitingPlayerId)
    local src = source
    if instances[invitingPlayerId] and table.contains(instances[invitingPlayerId].invitedPlayers, src) then
        SetPlayerRoutingBucket(src, instances[invitingPlayerId].id)
        TriggerClientEvent("ud-apartments:JoinApartment", src, instances[invitingPlayerId].id)
    else
        TriggerClientEvent("ud-interface:Notify", src, 'error', 'No valid invite found!')
    end
end)