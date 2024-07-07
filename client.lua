local inventory = {}

RegisterNetEvent('inventory:showInventory')
AddEventHandler('inventory:showInventory', function(inventoryData)
    inventory = inventoryData
    openInventoryMenu()
end)

function openInventoryMenu()
    ESX.UI.Menu.CloseAll()

    local elements = {}

    for i=1, #inventory, 1 do
        if inventory[i].count > 0 then
            table.insert(elements, {
                label = inventory[i].label .. " x" .. inventory[i].count,
                value = inventory[i].name,
                count = inventory[i].count
            })
        end
    end

    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'inventory',
        {
            title = "Inventar",
            align = 'top-left',
            elements = elements
        },
        function(data, menu)
            -- This is where you can add actions when an item is selected
            local item = data.current.value
            local count = data.current.count

            -- Example action: Print item information to the console
            print("Selected item: " .. item .. ", count: " .. count)

            -- You can add more actions here, such as using or dropping the item
        end,
        function(data, menu)
            menu.close()
        end
    )
end


RegisterCommand('showinventory', function(source)
    TriggerServerEvent('inventory:getInventory')
end, false)


-- Open

RegisterCommand('showinv', function()
    lib.showContext('showinv')
  end)
  
  lib.registerContext({
    id = 'showinv',
    title = 'Spieleraktionen',
    options = {    
      {
        title = 'Nächsten Spieler durchsuchen',
        description = 'Den Nächsten Spieler durchsuchen.',
        icon = 'eye',
        event = 'process',
        arrow = true,
        args = {}
  
      }
    }
})

RegisterNetEvent('process')
AddEventHandler('process', function()


local closestPlayer, closestPlayerDistance = ESX.Game.GetClosestPlayer()



if closestPlayer == -1 or closestPlayerDistance > 3.0 then
    ESX.ShowNotification('Niemand in der Nähe')
   else
    if lib.progressBar({
        duration = 3500,
        label = 'Durchsuche. . .',
        useWhileDead = false,
        canCancel = true,
        disable = {
            car = true,
        },
        anim = {},
        prop = {},
    }) then print('success')
    end
    local playerId = GetPlayerServerId(closestPlayer)    
    TriggerServerEvent('inventory:getInventory', playerId)
end

end)

RegisterKeyMapping('showinv', 'Durchsuche den Nächsten Spieler!', 'keyboard', 'F4')
