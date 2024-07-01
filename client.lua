local inventory = {}

RegisterNetEvent('inventory:showInventory')
AddEventHandler('inventory:showInventory', function(inventoryData)
    inventory = inventoryData
    openInventoryMenu()
end)

function openInventoryMenu()
    local mainMenu = RageUI.CreateMenu("Inventar", "Dein Inventar")
    
    RageUI.Visible(mainMenu, not RageUI.Visible(mainMenu))
    
    while mainMenu do
        Citizen.Wait(0)
        RageUI.IsVisible(mainMenu, true, true, true, function()
            for i=1, #inventory, 1 do
                if inventory[i].count > 0 then
                    RageUI.Button(inventory[i].label .. " x" .. inventory[i].count, nil, {}, true, {
                        onSelected = function()
                            -- Hier kannst du Aktionen hinzufügen, wenn ein Item ausgewählt wird
                        end
                    })
                end
            end
        end, function() end)
        
        if not RageUI.Visible(mainMenu) then
            mainMenu = RMenu:DeleteType('mainMenu', true)
        end
    end
end

RegisterCommand('showinventory', function()
    TriggerServerEvent('inventory:getInventory')
end, false)
