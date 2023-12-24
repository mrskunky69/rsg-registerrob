Config = {}


----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
-------------CHANGE ALERT IN policeAlert() TO YOUR LIKING-------------------------------------------
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

Config.Cash = true           
                            --use either cash or markedbills if u want cash then set true vice versa

Config.MinCash = 500 --if Config.Cash = true
Config.MaxCash = 2000


Config.Models = {
    'p_register03x',
    'p_register01x',
	'p_register04x',
	'p_register05x',
	'p_register06x',
	'p_register07x',
	'p_register08x'
}

Config.ModelHashes = {
    -1043434543,        
    -2134937768,
	-305837470,
	-1250929611,
	1462638198,
	-30251080,
	-1509673351

}

RegisterCommand("scheme1", function(source, args, rawCommand)
    TriggerEvent('RSG:scheme1')
end)
    
RegisterNetEvent('RSG:scheme1')
AddEventHandler('RSG:scheme1', function()
    Citizen.InvokeNative(0xB31A277C1AC7B7FF, PlayerPedId(), 0, 0, 589481092, 1, 1, 0, 0)
end)
