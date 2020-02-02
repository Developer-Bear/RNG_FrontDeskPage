local CooldownActive = false

-- Broadcast to all players
RegisterServerEvent('RNG_FrontDeskPage:SendPage')
AddEventHandler('RNG_FrontDeskPage:SendPage', function(location)
    if not CooldownActive then
        if Config.UseMythicNotify then
            TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = 'You paged for assistance!'})
        else 
            TriggerClientEvent('esx:showNotification', source, 'You paged for assistance!')
        end
        TriggerClientEvent('RNG_FrontDeskPage:Page', -1, location)
        if Config.CoolDown ~= 0 then
            CooldownTimer()
        end
    else
        if Config.UseMythicNotify then
            TriggerClientEvent('mythic_notify:client:SendAlert', source,{ type = 'error', text = 'The department was recently paged. Please be patient!'})
        else 
            TriggerClientEvent('esx:showNotification', source, 'The department was recently paged. Please be patient!')
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