local amst_def = table.copy(minetest.registered_nodes["default:stone"])
amst_def.description = "Lava + Water = Stone"
amst_def.groups.not_in_creative_inventory = 1
amst_def.groups.not_blocking_trains = 1 -- as moderators' request on LinuxForks - avoid path blocking
amst_def.on_place = function(itemstack, placer, pointed_thing) -- Replace all LNWs in inventory to normal stone
	itemstack:set_name("default:stone")
	minetest.item_place(itemstack, placer, pointed_thing)
	return itemstack
end
minetest.register_node("lava_n_water:lava_water_aftermath_stone",amst_def)

-- Override lava cooling code -> override the relevant steps
-- Codes from default
default.cool_lava = function(pos, node)
	if node.name == "default:lava_source" then
		minetest.set_node(pos, {name = "default:obsidian"})
	else -- Lava flowing
		minetest.set_node(pos, {name = "lava_n_water:lava_water_aftermath_stone"})
	end
	minetest.sound_play("default_cool_lava",
		{pos = pos, max_hear_distance = 16, gain = 0.25}, true)
end

-- Alias for WorldEdit
minetest.register_alias("lava_n_water", "lava_n_water:lava_water_aftermath_stone")
minetest.register_alias("lavanwater", "lava_n_water:lava_water_aftermath_stone")
minetest.register_alias("lnw", "lava_n_water:lava_water_aftermath_stone")
