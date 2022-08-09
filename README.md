# RandomBox

Check out other free scripts by me on CFX FiveM or my Tebex for paid scripts/support: https://angelicxs.tebex.io/

Free loot box script for FiveM

I have created a free random item box for use in ESX and QBcore servers. Great to use in conjunction with Tebex! There is also an option to enable in game purchases to allow non-paying players an opportunity to try for the loot and provide a resource sink for your economy.

Features:
Config allows for a highly customized experience
Up to five tiers of loot box able to be programmed
Each tier can be individually configured to be publicly accessible
Option to allow each tier to pull a predetermined number of items for a general loot pool for filler (make your loot boxes feel fuller)
Images for each tier box included


For QBCore Users, add this to your shared items.lua

	['tier1giftbox'] 				 = {['name'] = 'tier1giftbox', 					['label'] = 'Tier 1 Gift Box', 			['weight'] = 500, 		['type'] = 'item', 		['image'] = 'tier1giftbox.png', 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Wow! A tier 1 gift box!'},
	['tier2giftbox'] 				 = {['name'] = 'tier2giftbox', 					['label'] = 'Tier 2 Gift Box', 			['weight'] = 500, 		['type'] = 'item', 		['image'] = 'tier2giftbox.png', 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Wow! A tier 2 gift box!'},
	['tier3giftbox'] 				 = {['name'] = 'tier3giftbox', 					['label'] = 'Tier 3 Gift Box', 			['weight'] = 500, 		['type'] = 'item', 		['image'] = 'tier3giftbox.png', 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Wow! A tier 3 gift box!'},
	['tier4giftbox'] 				 = {['name'] = 'tier4giftbox', 					['label'] = 'Tier 4 Gift Box', 			['weight'] = 500, 		['type'] = 'item', 		['image'] = 'tier4giftbox.png', 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Wow! A tier 4 gift box!'},
	['tier5giftbox'] 				 = {['name'] = 'tier5giftbox', 					['label'] = 'Tier 5 Gift Box', 			['weight'] = 500, 		['type'] = 'item', 		['image'] = 'tier5giftbox.png', 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Wow! A tier 5 gift box!'},
