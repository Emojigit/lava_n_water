function shallowcopy(orig)
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in pairs(orig) do
            copy[orig_key] = orig_value
        end
    else -- number, string, boolean, etc
        copy = orig
    end
    return copy
end

local amst_def = shallowcopy(minetest.registered_nodes["default:stone"])
amst_def.description = "Lava + Water = Stone"
amst_def.groups.not_in_creative_inventory = 1
amst_def.on_place = function(itemstack, placer, pointed_thing)
	itemstack:set_name("default:stone")
	minetest.item_place(itemstack, placer, pointed_thing)
	return itemstack
end
print(type(amst_def))
print(dump(amst_def))
minetest.register_node("lava_n_water:lava_water_aftermath_stone",amst_def)


default.cool_lava = function(pos, node)
	if node.name == "default:lava_source" then
		minetest.set_node(pos, {name = "default:obsidian"})
	else -- Lava flowing
		minetest.set_node(pos, {name = "lava_n_water:lava_water_aftermath_stone"})
	end
	minetest.sound_play("default_cool_lava",
		{pos = pos, max_hear_distance = 16, gain = 0.25}, true)
end

minetest.register_alias("lava_n_water", "lava_n_water:lava_water_aftermath_stone")
minetest.register_alias("lavanwater", "lava_n_water:lava_water_aftermath_stone")
minetest.register_alias("lnw", "lava_n_water:lava_water_aftermath_stone")
