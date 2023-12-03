ESX = nil
QBcore = nil

local NPC

RegisterNetEvent('angelicxs-randombox:Notify', function(message, type)
	if Config.UseCustomNotify then
        TriggerEvent('angelicxs-randombox:CustomNotify',message, type)
	elseif Config.UseESX then
		ESX.ShowNotification(message)
	elseif Config.UseQBCore then
		QBCore.Functions.Notify(message, type)
	end
end)

CreateThread(function()
    if Config.UseESX then
        ESX = exports["es_extended"]:getSharedObject()

    elseif Config.UseQBCore then
        QBCore = exports['qb-core']:GetCoreObject()
    end
    
    if Config.BoxBlip then
		local blip = AddBlipForCoord(Config.PurchaseBoxLocation[1],Config.PurchaseBoxLocation[2],Config.PurchaseBoxLocation[3])
		SetBlipSprite(blip, Config.BoxBlipIcon)
		SetBlipColour(blip, Config.BoxBlipColour)
		SetBlipScale(blip, 0.7)
		SetBlipAsShortRange(blip, true)
		BeginTextCommandSetBlipName('STRING')
		AddTextComponentString(Config.BoxBlipText)
		EndTextCommandSetBlipName(blip)
	end
end)

-- Starting NPC Spawn
CreateThread(function()
    if Config.PurchaseBox then
        local PedSpawned = false
        while true do
            local Player = PlayerPedId()
            local Pos = GetEntityCoords(Player)
            local Dist = #(Pos - vector3(Config.PurchaseBoxLocation[1],Config.PurchaseBoxLocation[2],Config.PurchaseBoxLocation[3]))
            if Dist <= 50 and not PedSpawned then
                TriggerEvent('angelicxs-randombox:SpawnNPC',Config.PurchaseBoxLocation,Config.NPC,Config.NPCScenario)
                PedSpawned = true
            elseif DoesEntityExist(NPC) and PedSpawned then
                local Dist2 = #(Pos - GetEntityCoords(NPC))
                if Dist2 > 50 then
                    DeleteEntity(NPC)
                    PedSpawned = false
                end
            end
            Wait(2000)
        end
    end
end)

RegisterNetEvent('angelicxs-randombox:SpawnNPC',function(coords,model,scenario)
    local hash = HashGrabber(model)
    NPC = CreatePed(3, hash, coords[1], coords[2], (coords[3]-1), coords[4], false, false)
    FreezeEntityPosition(NPC, true)
    SetEntityInvincible(NPC, true)
    SetBlockingOfNonTemporaryEvents(NPC, true)
    TaskStartScenarioInPlace(NPC,scenario, 0, false)
    SetModelAsNoLongerNeeded(model)
    if Config.UseThirdEye then
        if Config.ThirdEyeName == 'ox_target' then
            local ox_options = {
                {
                    icon = Config.ThirdEyeIcon,
                    label = Config.Lang['buy_a']..'1'..Config.Lang['buy_b']..Config.Tier1Price,
                    canInteract = function(entity)
                        if not Config.AllowTier1 then return false end
                        return true
                    end,
                    onSelect = function(entity)
                        TriggerServerEvent('angelicxs-randombox:server:GetMoney', Config.Tier1Price)
                    end,
                }, {
                    icon = Config.ThirdEyeIcon,
                    label = Config.Lang['buy_a']..'2'..Config.Lang['buy_b']..Config.Tier2Price,
                    canInteract = function(entity)
                        if not Config.AllowTier2 then return false end
                        return true
                    end,
                    onSelect = function(entity)
                        TriggerServerEvent('angelicxs-randombox:server:GetMoney', Config.Tier2Price)
                    end,
                }, {
                    icon = Config.ThirdEyeIcon,
                    label = Config.Lang['buy_a']..'3'..Config.Lang['buy_b']..Config.Tier3Price,
                    canInteract = function(entity)
                        if not Config.AllowTier3 then return false end
                        return true
                    end,
                    onSelect = function(entity)
                        TriggerServerEvent('angelicxs-randombox:server:GetMoney', Config.Tier3Price)
                    end,
                }, {
                    icon = Config.ThirdEyeIcon,
                    label = Config.Lang['buy_a']..'4'..Config.Lang['buy_b']..Config.Tier4Price,
                    canInteract = function(entity)
                        if not Config.AllowTier4 then return false end
                        return true
                    end,
                    onSelect = function(entity)
                        TriggerServerEvent('angelicxs-randombox:server:GetMoney', Config.Tier4Price)
                    end,
                }, {
                    icon = Config.ThirdEyeIcon,
                    label = Config.Lang['buy_a']..'5'..Config.Lang['buy_b']..Config.Tier5Price,
                    canInteract = function(entity)
                        if not Config.AllowTier5 then return false end
                        return true
                    end,
                    onSelect = function(entity)
                        TriggerServerEvent('angelicxs-randombox:server:GetMoney', Config.Tier5Price)
                    end,
                }, 
            }
            exports.ox_target:addLocalEntity(NPC, ox_options)
        else
            exports[Config.ThirdEyeName]:AddEntityZone('GiftNPC', NPC, {
                name="GiftNPC",
                debugPoly=false,
                useZ = true
                }, {
                options = {
                    {
                        icon = Config.ThirdEyeIcon,
                        label = Config.Lang['buy_a']..'1'..Config.Lang['buy_b']..Config.Tier1Price,
                        canInteract = function(entity)
                            if not Config.AllowTier1 then return false end
                            return true
                        end,
                        action = function(entity)
                            TriggerServerEvent('angelicxs-randombox:server:GetMoney', Config.Tier1Price)
                        end,
                    }, {
                        icon = Config.ThirdEyeIcon,
                        label = Config.Lang['buy_a']..'2'..Config.Lang['buy_b']..Config.Tier2Price,
                        canInteract = function(entity)
                            if not Config.AllowTier2 then return false end
                            return true
                        end,
                        action = function(entity)
                            TriggerServerEvent('angelicxs-randombox:server:GetMoney', Config.Tier2Price)
                        end,
                    }, {
                        icon = Config.ThirdEyeIcon,
                        label = Config.Lang['buy_a']..'3'..Config.Lang['buy_b']..Config.Tier3Price,
                        canInteract = function(entity)
                            if not Config.AllowTier3 then return false end
                            return true
                        end,
                        action = function(entity)
                            TriggerServerEvent('angelicxs-randombox:server:GetMoney', Config.Tier3Price)
                        end,
                    }, {
                        icon = Config.ThirdEyeIcon,
                        label = Config.Lang['buy_a']..'4'..Config.Lang['buy_b']..Config.Tier4Price,
                        canInteract = function(entity)
                            if not Config.AllowTier4 then return false end
                            return true
                        end,
                        action = function(entity)
                            TriggerServerEvent('angelicxs-randombox:server:GetMoney', Config.Tier4Price)
                        end,
                    }, {
                        icon = Config.ThirdEyeIcon,
                        label = Config.Lang['buy_a']..'5'..Config.Lang['buy_b']..Config.Tier5Price,
                        canInteract = function(entity)
                            if not Config.AllowTier5 then return false end
                            return true
                        end,
                        action = function(entity)
                            TriggerServerEvent('angelicxs-randombox:server:GetMoney', Config.Tier5Price)
                        end,
                    }, 
                },
                distance = 2
            })        
        end
    end
end)


function HashGrabber(model)
    local hash = GetHashKey(model)
    if not HasModelLoaded(hash) then
        RequestModel(hash)
        Wait(10)
    end
    while not HasModelLoaded(hash) do
      Wait(10)
    end
    return hash
end

AddEventHandler('onResourceStop', function(resource)
    if GetCurrentResourceName() == resource then
        if DoesEntityExist(NPC) then
            DeleteEntity(NPC)
        end
    end
end)
