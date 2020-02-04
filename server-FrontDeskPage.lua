local CooldownActive = false

-- Broadcast to all players
RegisterServerEvent('RNG_FrontDeskPage:SendPage')
AddEventHandler('RNG_FrontDeskPage:SendPage', function(location)
    if not CooldownActive then
        if Config.UseMythicNotify then
            TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = _U('successfulPage')})
        else 
            TriggerClientEvent('esx:showNotification', source, _U('successfulPage'))
        end
        TriggerClientEvent('RNG_FrontDeskPage:Page', -1, location)
        if Config.CoolDown ~= 0 then
            CooldownTimer()
        end
    else
        if Config.UseMythicNotify then
            TriggerClientEvent('mythic_notify:client:SendAlert', source,{ type = 'error', text = _U('recentPage')})
        else 
            TriggerClientEvent('esx:showNotification', source, _U('recentPage'))
        end
    end
end)

function CooldownTimer()
    timeLeft = Config.CoolDown
    CooldownActive = true
	
	while true do
		Citizen.Wait(60000)
		timeLeft = timeLeft - 1

        if timeLeft <= 0 then
            CooldownActive = false
			break
		end
	end
end