----------------------------------------------------------------------------------------------
-- Initialize ESX Data --
----------------------------------------------------------------------------------------------
ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

-- Draw 3D text when player is close enough and listen for keypress
Citizen.CreateThread(function ()
	while true do
		Citizen.Wait(0)
		local coords = GetEntityCoords(PlayerPedId())
		for k,v in pairs(Config.Locations) do
            if GetDistanceBetweenCoords(coords, v.Coords.x, v.Coords.y, v.Coords.z, true) < Config.TextDrawDistance then
                local location = v
                DrawText3D(v.Coords.x, v.Coords.y, v.Coords.z - 1.0, 'Press ~g~L~s~ to page staff')
                if IsControlJustReleased(1, 182) then
                    TriggerServerEvent('RNG_FrontDeskPage:SendPage', location)
                end
			end
		end
	end
end)

RegisterNetEvent('RNG_FrontDeskPage:Page')
AddEventHandler('RNG_FrontDeskPage:Page', function(location)
    for k,v in pairs(location.JobsToPage) do
        if PlayerData.job and PlayerData.job.name == v then
            TriggerEvent("chatMessage", "Dispatch: ", {255, 0, 0}, "Help requested at ^5" .. location.DisplayName .. "^7 front desk")
            PlaySoundFrontend(-1, Config.SoundDirectory, Config.SoundName, 0,0,1)
        end
    end
end)

function DrawText3D(x,y,z, text)
	local onScreen, _x, _y = World3dToScreen2d(x, y, z)
	local p = GetGameplayCamCoords()
	local distance = GetDistanceBetweenCoords(p.x, p.y, p.z, x, y, z, 1)
	local scale = (1 / distance) * 2
	local fov = (1 / GetGameplayCamFov()) * 100
	local scale = scale * fov
	if onScreen then
		  SetTextScale(0.35, 0.35)
		  SetTextFont(4)
		  SetTextProportional(1)
		  SetTextColour(255, 255, 255, 215)
		  SetTextEntry("STRING")
		  SetTextCentre(1)
		  AddTextComponentString(text)
		  DrawText(_x,_y)
		  local factor = (string.len(text)) / 370
		  DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 68)
	  end
end
