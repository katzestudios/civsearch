RegisterServerEvent('inventory:getInventory')
AddEventHandler('inventory:getInventory', function(playerId)
    local xPlayer = ESX.GetPlayerFromId(playerId)
    if xPlayer then

        local inventory = xPlayer.getInventory()
        TriggerClientEvent('inventory:showInventory', source, inventory)
        local data = {title = 'Achtung!', description = 'Du wirst durchsucht!', type = 'warning'}
        TriggerClientEvent('ox_lib:notify', playerId, data)
    end
end)
