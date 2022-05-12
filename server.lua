ESX = nil
QBcore = nil

if Config.UseESX then
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
elseif Config.UseQBCore then
    QBCore = exports['qb-core']:GetCoreObject()
end

--- Open Boxes

RegisterServerEvent('angelicxs-randombox:server:OpenBox')
AddEventHandler('angelicxs-randombox:server:OpenBox', function(source, tier)
    local src = source
    math.randomseed(os.time())
    local item = randomizer(tier)
    CreateThread(function()
        if Config.AllowGeneralLoot then
            local times = 0
            while times ~= amount do
                generalloot(src)
                times = times + 1
                if times == amount then
                    break
                end
                Wait(10)
            end
        end
    end)
    if Config.UseESX then
        local xPlayer = ESX.GetPlayerFromId(src)
		xPlayer.addInventoryItem(item.name, item.amount)
    elseif Config.UseQBCore then
        local Player = QBCore.Functions.GetPlayer(src)
        Player.Functions.AddItem(item.name, item.amount)
    end
    TriggerClientEvent('angelicxs-randombox:Notify',src, Config.Lang['receive']..item.amount..' '..item.name, Config.LangType['success'])
end)

function randomizer(tier,adjustment)
    if adjustment == nil then
        adjustment = 0
    end
    local List = tier
    local Number = 0
    math.random()
    math.random()
    math.random()
    math.random()
    local luck = (math.random(1,100) + adjustment)
    if luck >= 100 then
        luck = 100
    end
    local Selection = math.random(1, #List)
    for i = 1, #List do
        local reward = List[i]
        Number = Number + 1
        if Number == Selection then
            if reward.chance >= luck then
                Number = 0
                return reward
            else
                return randomizer(tier, luck)
            end
        end
    end
end

function generalloot(src)
    local List = Config.GeneralLoot
    local Number = 0
    math.random()
    math.random()
    math.random()
    math.random()
    local Selection = math.random(1, #List)
    for i = 1, #List do
        local reward = List[i]
        Number = Number + 1
        if Number == Selection then
            Number = 0
            if Config.UseESX then
                local xPlayer = ESX.GetPlayerFromId(src)
                xPlayer.addInventoryItem(reward.name, reward.amount)
            elseif Config.UseQBCore then
                local Player = QBCore.Functions.GetPlayer(src)
                Player.Functions.AddItem(reward.name, reward.amount)
            end
            TriggerClientEvent('angelicxs-randombox:Notify',src, Config.Lang['receive']..reward.amount..' '..reward.name, Config.LangType['success'])
            break
        end
    end
end

-- amount check
RegisterServerEvent('angelicxs-randombox:server:GetMoney')
AddEventHandler('angelicxs-randombox:server:GetMoney', function(tier)
    local level = 0
    local box = 0
    local amount = 0
    local src = source
    if tier == Config.Tier1Price then
        level = Config.Tier1List
        box = Config.Tier1Name
        amount = Config.Tier1Amount
    elseif tier == Config.Tier2Price then
        level = Config.Tier2List
        box = Config.Tier2Name
        amount = Config.Tier2Amount
    elseif tier == Config.Tier3Price then
        level = Config.Tier3List
        box = Config.Tier3Name
        amount = Config.Tier3Amount
    elseif tier == Config.Tier4Price then
        level = Config.Tier4List
        box = Config.Tier4Name
        amount = Config.Tier4Amount
    elseif tier == Config.Tier5Price then
        level = Config.Tier5List
        box = Config.Tier5Name
        amount = Config.Tier5Amount
    end
    if Config.UseESX then
        local xPlayer = ESX.GetPlayerFromId(src)
        if xPlayer.getMoney() >= tier then
            xPlayer.removeMoney(tier)
            if Config.InstantOpen then
                TriggerEvent('angelicxs-randombox:server:OpenBox',src, level, amount)
            else
                xPlayer.addInventoryItem(box, 1)
            end
            TriggerClientEvent('angelicxs-randombox:Notify', src, Config.Lang['purchase'], Config.LangType['success'])
        else
            TriggerClientEvent('angelicxs-randombox:Notify', src, Config.Lang['nofunds'], Config.LangType['error'])
        end
    elseif Config.UseQBCore then
        local player = QBCore.Functions.GetPlayer(src)
        local cash = player.PlayerData.money['cash']
        if cash >= tier then
            player.Functions.RemoveMoney('cash', tier, "Gift-Box-Purchase")
            if Config.InstantOpen then
                TriggerEvent('angelicxs-randombox:server:OpenBox',src, level, amount)
            else
                player.Functions.AddItem(box, 1)
            end
            TriggerClientEvent('angelicxs-randombox:Notify', src, Config.Lang['purchase'], Config.LangType['success'])
        else
            TriggerClientEvent('angelicxs-randombox:Notify', src, Config.Lang['nofunds'], Config.LangType['error'])
        end
    end
end)

if Config.UseESX then
	ESX.RegisterUsableItem(Config.Tier1Name, function(source)
		local xPlayer = ESX.GetPlayerFromId(source)
		xPlayer.removeInventoryItem(Config.Tier1Name, 1)
        TriggerEvent('angelicxs-randombox:server:OpenBox',source, Config.Tier1List, Config.Tier1Amount)
        TriggerClientEvent('angelicxs-randombox:Notify',source, Config.Lang['used'], Config.LangType['success'])
	end)
    ESX.RegisterUsableItem(Config.Tier2Name, function(source)
		local xPlayer = ESX.GetPlayerFromId(source)
		xPlayer.removeInventoryItem(Config.Tier2Name, 1)
        TriggerEvent('angelicxs-randombox:server:OpenBox',source, Config.Tier2List, Config.Tier2Amount)
        TriggerClientEvent('angelicxs-randombox:Notify',source, Config.Lang['used'], Config.LangType['success'])
	end)
    ESX.RegisterUsableItem(Config.Tier3Name, function(source)
		local xPlayer = ESX.GetPlayerFromId(source)
		xPlayer.removeInventoryItem(Config.Tier3Name, 1)
        TriggerEvent('angelicxs-randombox:server:OpenBox',source, Config.Tier3List, Config.Tier3Amount)
        TriggerClientEvent('angelicxs-randombox:Notify',source, Config.Lang['used'], Config.LangType['success'])
	end)
    ESX.RegisterUsableItem(Config.Tier4Name, function(source)
		local xPlayer = ESX.GetPlayerFromId(source)
		xPlayer.removeInventoryItem(Config.Tier4Name, 1)
        TriggerEvent('angelicxs-randombox:server:OpenBox',source, Config.Tier4List, Config.Tier4Amount)
        TriggerClientEvent('angelicxs-randombox:Notify',source, Config.Lang['used'], Config.LangType['success'])
	end)
    ESX.RegisterUsableItem(Config.Tier5Name, function(source)
		local xPlayer = ESX.GetPlayerFromId(source)
		xPlayer.removeInventoryItem(Config.Tier5Name, 1)
        TriggerEvent('angelicxs-randombox:server:OpenBox',source, Config.Tier5List, Config.Tier5Amount)
        TriggerClientEvent('angelicxs-randombox:Notify',source, Config.Lang['used'], Config.LangType['success'])
	end)
elseif Config.UseQBCore then
    QBCore.Functions.CreateUseableItem(Config.Tier1Name, function(source, item)
        local Player = QBCore.Functions.GetPlayer(source)
        Player.Functions.RemoveItem("Config.Tier1Name", 1,item.slot)
        TriggerEvent('angelicxs-randombox:server:OpenBox',source, Config.Tier1List, Config.Tier1Amount)
        TriggerClientEvent('angelicxs-randombox:Notify',source, Config.Lang['used'], Config.LangType['success'])
    end)
    QBCore.Functions.CreateUseableItem(Config.Tier2Name, function(source, item)
        local Player = QBCore.Functions.GetPlayer(source)
        Player.Functions.RemoveItem("Config.Tier2Name", 1,item.slot)
        TriggerEvent('angelicxs-randombox:server:OpenBox',source, Config.Tier2List, Config.Tier2Amount)
        TriggerClientEvent('angelicxs-randombox:Notify',source, Config.Lang['used'], Config.LangType['success'])
    end)
    QBCore.Functions.CreateUseableItem(Config.Tier3Name, function(source, item)
        local Player = QBCore.Functions.GetPlayer(source)
        Player.Functions.RemoveItem("Config.Tier3Name", 1,item.slot)
        TriggerEvent('angelicxs-randombox:server:OpenBox',source, Config.Tier3List, Config.Tier3Amount)
        TriggerClientEvent('angelicxs-randombox:Notify',source, Config.Lang['used'], Config.LangType['success'])
    end)
    QBCore.Functions.CreateUseableItem(Config.Tier4Name, function(source, item)
        local Player = QBCore.Functions.GetPlayer(source)
        Player.Functions.RemoveItem("Config.Tier4Name", 1,item.slot)
        TriggerEvent('angelicxs-randombox:server:OpenBox',source, Config.Tier4List, Config.Tier4Amount)
        TriggerClientEvent('angelicxs-randombox:Notify',source, Config.Lang['used'], Config.LangType['success'])
    end)
    QBCore.Functions.CreateUseableItem(Config.Tier5Name, function(source, item)
        local Player = QBCore.Functions.GetPlayer(source)
        Player.Functions.RemoveItem("Config.Tier5Name", 1,item.slot)
        TriggerEvent('angelicxs-randombox:server:OpenBox',source, Config.Tier5List, Config.Tier5Amount)
        TriggerClientEvent('angelicxs-randombox:Notify',source, Config.Lang['used'], Config.LangType['success'])
    end) 
end