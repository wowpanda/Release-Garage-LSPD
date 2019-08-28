----------------------------------------------------
---- Create by Deverino [ Native UI reloaded ] -----                                              --------         -------
---- Liste des vehicules pour la lspd (pas le job)                                                          -----
----------------------------------------------------                                                       _______
_menuPool = NativeUI.CreatePool()
mainMenu = NativeUI.CreateMenu("~w~Los santos police","~r~Police ~w~Departement")
_menuPool:Add(mainMenu)

ESX = nil
local PlayerData = {}

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
	PlayerData.job = job
end)


function AddCarMenu(menu)
                ------ Menu
            local carsubmenu = _menuPool:AddSubMenu(menu,"~b~Garage de la lspd","~o~Orion")
    
                ------ Car Items
            carsubmenu.Item:SetLeftBadge(BadgeStyle.Car)
            local police = NativeUI.CreateItem("Police Cruiser","~r~Liste des vehicules")
            carsubmenu.SubMenu:AddItem(police)
            local police2 = NativeUI.CreateItem("Buffalo de police","~r~Liste des vehicules")
            carsubmenu.SubMenu:AddItem(police2)
            local police3 = NativeUI.CreateItem("Interceptor","~r~Liste des vehicules")
            carsubmenu.SubMenu:AddItem(police3)
            local police4 = NativeUI.CreateItem("Police cruiser Unmarked","~r~Liste des vehicules")
            carsubmenu.SubMenu:AddItem(police4)
            local fbi = NativeUI.CreateItem("Buffalo Unmarked","~r~Liste des vehicules")
            carsubmenu.SubMenu:AddItem(fbi)
            local fbi2 = NativeUI.CreateItem("SUV Unmarked","~r~Liste des vehicules")
            carsubmenu.SubMenu:AddItem(fbi2)
            local sheriff = NativeUI.CreateItem("Oracle police","~r~Liste des vehicules")
            carsubmenu.SubMenu:AddItem(sheriff)
            local sheriff2 = NativeUI.CreateItem("SUV Sheriff","~r~Liste des vehicules")
            carsubmenu.SubMenu:AddItem(sheriff2)
            local policeb = NativeUI.CreateItem("Moto de police","~r~Liste des vehicules")
            carsubmenu.SubMenu:AddItem(policeb)
            local policet = NativeUI.CreateItem("Fourgon de transport","~r~Liste des vehicules")
            carsubmenu.SubMenu:AddItem(policet)
            local riot = NativeUI.CreateItem("Blinder LSPD","~r~Liste des vehicules")
            carsubmenu.SubMenu:AddItem(riot)
            local riot2 = NativeUI.CreateItem("Fourgon antiémeute","~r~Liste des vehicules")
            carsubmenu.SubMenu:AddItem(riot2)
            local sultan = NativeUI.CreateItem("~r~Vehicule de formation","~r~Liste des vehicules")
            carsubmenu.SubMenu:AddItem(sultan)
   
          
                ----- spawn
            carsubmenu.SubMenu.OnItemSelect   = function(menu, item)
            if item == police then
                ESX.ShowNotification('Vous avez sorti un vehicule de police')
                Citizen.Wait(1)
                spawnCar("police")
            elseif item == police2 then
                ESX.ShowNotification('Vous avez sorti un vehicule de police')
                Citizen.Wait(1)
                spawnCar("police2")
            elseif item == police3 then
                ESX.ShowNotification('Vous avez sorti un vehicule de police')
                Citizen.Wait(1)
                spawnCar("police3")
            elseif item == police4 then
                ESX.ShowNotification('Vous avez sorti un vehicule de police')
                Citizen.Wait(1)
                spawnCar("police4")
            elseif item == fbi then
                ESX.ShowNotification('Vous avez sorti un vehicule de police')
                Citizen.Wait(1)
                spawnCar("fbi")
            elseif item == fbi2 then
                ESX.ShowNotification('Vous avez sorti un vehicule de police')
                Citizen.Wait(1)
                spawnCar("fbi2")
            elseif item == sheriff then
                ESX.ShowNotification('Vous avez sorti un vehicule de police')
                Citizen.Wait(1)
                spawnCar("sheriff")
            elseif item == sheriff2 then
                ESX.ShowNotification('Vous avez sorti un vehicule de police')
                Citizen.Wait(1)
                spawnCar("sheriff2")
            elseif item == policeb then
                ESX.ShowNotification('Vous avez sorti un vehicule de police')
                Citizen.Wait(1)
                spawnCar("policeb")
            elseif item == policet then
                ESX.ShowNotification('Vous avez sorti un vehicule de police')
                Citizen.Wait(1)
                spawnCar("policet")
            elseif item == riot then
                ESX.ShowNotification('Vous avez sorti un vehicule de police')
                Citizen.Wait(1)
                spawnCar("riot")
            elseif item == riot2 then
                ESX.ShowNotification('Vous avez sorti un vehicule de police')
                Citizen.Wait(1)
                spawnCar("riot2")
            elseif item == sultan then
                ESX.ShowNotification('Vous avez sorti un vehicule de ~b~formation')
                Citizen.Wait(1)
                spawnCar("sultan")
            end
        end
    end




AddCarMenu(mainMenu)
_menuPool:RefreshIndex()


function notify(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(true, true)
end



Citizen.CreateThread(function()
    local playerPed = PlayerPedId()
    while true do
        Wait(0)
        _menuPool:ProcessMenus()

            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            if IsEntityAtCoord(PlayerPedId(), 459.21, -1008.07, 28.26, 1.5, 1.5, 1.5, 0, 1, 0) then 

                    if PlayerData.job ~= nil and PlayerData.job.name == 'police' then    
                        ESX.ShowHelpNotification("Appuyez sur ~INPUT_TALK~ pour accéder au Garage~s~")
                        if IsControlJustPressed(1,51) then
                            mainMenu:Visible(not mainMenu:Visible())
                        end
                    end
                end    
            end
        end)



spawnCar = function(car)
    local car = GetHashKey(car)

    RequestModel(car)
    while not HasModelLoaded(car) do
        RequestModel(car)
        Citizen.Wait(0)
    end

    local vehicle = CreateVehicle(car, 452.84, -1019.61, 28.24, 90.89, true, false)
    SetEntityAsMissionEntity(vehicle, true, true)
    SetVehicleNumberPlateText(vehicle, "LSPD911")
end








