local RSGCore = exports['rsg-core']:GetCoreObject()




RegisterNetEvent('rsg-till-rob', function()
    local ped = PlayerPedId()
    RSGCore.Functions.TriggerCallback('RSGCore:HasItem', function(hasItem)
        if hasItem then
            local time = math.random(7,10)
            local circles = math.random(2,4)
            local success = exports['rsg-lock']:StartLockPickCircle(circles, time, success)
            if success then
                RSGCore.Functions.Progressbar('rob_Till', 'Robbing Register', 15000, false, true, { -- Name | Label | Time | useWhileDead | canCancel
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
				TriggerEvent('RSG:scheme1'),
				Wait(3000),
				TriggerEvent('RSG:scheme1')
            }, {
                
            }, {}, {}, function() 
                TriggerServerEvent('rsg-till-rob-payout')
                ClearPedTasks(ped)
                TriggerServerEvent("rsg-till-rob:Server:RemoveItem", "lockpick", 1)
                TriggerEvent("inventory:client:ItemBox", RSGCore.Shared.Items["lockpick"], "remove")
                policeAlert()
                delPmeter()

                if Config.Cash then
                    TriggerServerEvent("InteractSound_SV:PlayOnSource", "coins", 90.0)
                end

            end, function() 
                ClearPedTasks(ped)
            end)
        else
            RSGCore.Functions.Notify('Lockpick Bent Out Of Shape', 'error', 7500)
            TriggerServerEvent("rsg-till-rob:Server:RemoveItem", "lockpick", 1)
            TriggerEvent("inventory:client:ItemBox", RSGCore.Shared.Items["lockpick"], "remove")
            policeAlert()
        end
        else
            RSGCore.Functions.Notify('You Need A lockpick', 'error', 7500)
        end
    end, 'lockpick')
end)

function policeAlert()
    TriggerServerEvent("police:server:policeAlert", 'Store Register Robbery') --configure to your liking this is jus default
    
end

function delPmeter()
    local ply = PlayerPedId()
    local plyCoords = GetEntityCoords(ply, 0)
    for k, v in pairs(Config.ModelHashes) do
        local closestPark = GetClosestObjectOfType(plyCoords.x, plyCoords.y, plyCoords.z, 1.5, v, false, 0, 0)
        SetEntityAsMissionEntity(closestPark, true, true)
        DeleteEntity(closestPark)
    end    
end


CreateThread(function()
    exports['rsg-target']:AddTargetModel(Config.Models, {
        options = {
            { 
                type = "client",
                event = "rsg-till-rob",
                icon = "fas fa-screwdriver",
                label = "Rob Till",
            },
        },
        distance = 1.5 
    })
end)


