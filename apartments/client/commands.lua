RegisterCommand("invite", function(source, args, rawCommand)
    local targetPlayerId = tonumber(args[1])
    if targetPlayerId then
        TriggerEvent("ud-apartments:InvitePlayer", targetPlayerId)
        exports['ud-interface']:Notify('success', 'Player invited successfully!')
    else
        exports['ud-interface']:Notify('error', 'Invalid player ID!')
    end
end)

RegisterCommand("acceptinvite", function(source, args, rawCommand)
    local invitingPlayerId = tonumber(args[1])
    if invitingPlayerId then
        TriggerServerEvent("ud-apartments:server:AcceptInvite", invitingPlayerId)
    else
        exports['ud-interface']:Notify('error', 'Invalid invite ID!')
    end
end)