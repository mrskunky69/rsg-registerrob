local RSGCore = exports['rsg-core']:GetCoreObject()


RegisterNetEvent('rsg-till-rob-payout', function()
    if Config.Cash then
        local amount = math.random(Config.MinCash,Config.MaxCash)
        local src = source
        local Player = RSGCore.Functions.GetPlayer(src)
        Player.Functions.AddMoney('cash', amount)
        TriggerClientEvent('RSGCore:Notify', src, 'You got $ '..amount..'!', 'success') 
    end
     
end)

RegisterNetEvent('rsg-till-rob:Server:RemoveItem', function(item, amount)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem(item, amount)
end)
