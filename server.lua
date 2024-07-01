RegisterServerEvent('inventory:getInventory')
AddEventHandler('inventory:getInventory', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer then
        local inventory = xPlayer.getInventory()
        TriggerClientEvent('inventory:showInventory', source, inventory)
    end
end)
