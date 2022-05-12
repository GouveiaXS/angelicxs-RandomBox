Config = {}

Config.UseESX = true						-- Use ESX Framework
Config.UseQBCore = false					-- Use QBCore Framework (Ignored if Config.UseESX = true)

Config.UseCustomNotify = false				-- Use a custom notification script, must complete event below.

-- Only complete this event if Config.UseCustomNotify is true; mythic_notification provided as an example
RegisterNetEvent('angelicxs-randombox:CustomNotify')
AddEventHandler('angelicxs-randombox:CustomNotify', function(message, type)
    --exports.mythic_notify:SendAlert(type, message, 4000)
end)

Config.Tier1Name = 'tier1giftbox'					-- Name of T1 Gift Box
Config.Tier2Name = 'tier2giftbox'					-- Name of T2 Gift Box
Config.Tier3Name = 'tier3giftbox'					-- Name of T3 Gift Box
Config.Tier4Name = 'tier4giftbox'					-- Name of T4 Gift Box
Config.Tier5Name = 'tier5giftbox'					-- Name of T5 Gift Box

-- Model info: https://docs.fivem.net/docs/game-references/ped-models/
-- Blip info: https://docs.fivem.net/docs/game-references/blips/
-- In Game Prefrence
Config.PurchaseBox = true							-- Allow players to buy gift boxes in game
Config.PurchaseBoxLocation = {212.62, -925.91, 30.69, 96.04}	-- Location where players can buy boxes if Config.PurchaseBox = true
Config.InstantOpen = false							-- If true will not give box item and instead immediately reward player.
Config.NPC = 's_f_m_shop_high'						-- Model of NPC
Config.NPCScenario = 'WORLD_HUMAN_STAND_IMPATIENT' 	-- Scenario NPC is doing

-- Blip Config
Config.BoxBlip = false 								-- Enable Blip for location
Config.BoxBlipIcon = 304 							-- Starting blip icon (if Config.BoxBlip = true)
Config.BoxBlipColour = 61 							-- Colour of blip icon (if Config.BoxBlip = true)
Config.BoxBlipText = 'Mystery Box Seller' 			-- Blip text on map (if Config.BoxBlip = true)

-- Pricing
Config.AllowTier1 = true							-- Allow purchase of a Tier 1 box
Config.Tier1Price = 100000							-- How much for a Tier 1 box
Config.AllowTier2 = true							-- Allow purchase of a Tier 2 box
Config.Tier2Price = 250000							-- How much for a Tier 2 box
Config.AllowTier3 = true							-- Allow purchase of a Tier 3 box
Config.Tier3Price = 500000							-- How much for a Tier 3 box
Config.AllowTier4 = true							-- Allow purchase of a Tier 4 box
Config.Tier4Price = 1000000							-- How much for a Tier 4 box
Config.AllowTier5 = true							-- Allow purchase of a Tier 5 box
Config.Tier5Price = 2000000							-- How much for a Tier 5 box

--General loot per box
Config.AllowGeneralLoot = true						-- Allow boxes to pull from Config.GeneralLoot to provide more items per box
Config.Tier1Amount = 1								-- if Config.AllowGeneralLoot = true how many items from Config.GeneralLoot are added to a Tier 1 box
Config.Tier2Amount = 2								-- if Config.AllowGeneralLoot = true how many items from Config.GeneralLoot are added to a Tier 2 box
Config.Tier3Amount = 2								-- if Config.AllowGeneralLoot = true how many items from Config.GeneralLoot are added to a Tier 3 box
Config.Tier4Amount = 3								-- if Config.AllowGeneralLoot = true how many items from Config.GeneralLoot are added to a Tier 4 box
Config.Tier5Amount = 3								-- if Config.AllowGeneralLoot = true how many items from Config.GeneralLoot are added to a Tier 5 box

-- Visual Preference
Config.UseThirdEye = true 							-- Enables using a third eye [REQUIRED]
Config.ThirdEyeName = 'qb-target' 					-- Name of third eye aplication
Config.ThirdEyeIcon = 'fas fa-clipboard-list' 		--Icon beside options (fas awesome)

-- Rewards Configuration (must have at least 1 item in each tier 100% chance)
Config.Tier1List = {
	{name = 'sandwich', amount = 3, chance = 100},
	{name = 'water_bottle', amount = 2, chance = 75},
	{name = 'sandwich', amount = 2, chance = 50},
	{name = 'water_bottle', amount = 1, chance = 25},

}
Config.Tier2List = {
	{name = 'sandwich', amount = 3, chance = 100},
	{name = 'water_bottle', amount = 1, chance = 50},

}
Config.Tier3List = {
	{name = 'sandwich', amount = 3, chance = 100},
	{name = 'water_bottle', amount = 1, chance = 50},

}
Config.Tier4List = {
	{name = 'sandwich', amount = 3, chance = 100},
	{name = 'water_bottle', amount = 1, chance = 50},

}
Config.Tier5List = {
	{name = 'sandwich', amount = 3, chance = 100},
	{name = 'water_bottle', amount = 1, chance = 50},

}
Config.GeneralLoot = {
	{name = 'sandwich', amount = 5},
	{name = 'water_bottle', amount = 10},

}


-- Language Configuration
Config.LangType = {
	['error'] = 'error',
	['success'] = 'success',
	['info'] = 'primary'
}

Config.Lang = {
	['receive'] = 'You recieved ',
	['nofunds'] = 'You do not have enough cash to purchase a box!',
	['purchase'] = 'You have purchased a mystery box!',
	['used'] = 'You are opening a mystery box!',
}