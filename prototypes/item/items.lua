local item_sounds = require("__base__.prototypes.item_sounds")

-- prototypes/item/items.lua
data:extend({
    {
        type = "item",
        name = "inhibitor-lamp",
        icon = "__terrapalus__/graphics/icons/inhibitor-lamp.png",
        icon_size = 64,
        icon_mipmaps = 4,
        subgroup = "circuit-network",
        order = "a[light]-b[small-lamp]",
        inventory_move_sound = item_sounds.electric_small_inventory_move,
        pick_sound = item_sounds.electric_small_inventory_pickup,
        drop_sound = item_sounds.electric_small_inventory_move,
        place_result = "inhibitor-lamp",
        stack_size = 50,
        is_military_target = true
    },
    {
        type = "item",
        name = "palusium-ore",
        icon = "__terrapalus__/graphics/icons/palusium-ore.png", 
        icon_size = 64,
        subgroup = "raw-resource",
        order = "b[palusium-ore]",
        stack_size = 50,
        fuel_category = "chemical",
        fuel_value = "25kJ",
        inventory_move_sound = item_sounds.resource_inventory_move,
        pick_sound = item_sounds.resource_inventory_pickup,
        drop_sound = item_sounds.resource_inventory_move,
    },
    {
        type = "item",
        name = "palusium-plate",
        icon = "__terrapalus__/graphics/icons/palusium-plate.png",  
        icon_size = 64,
        subgroup = "intermediate-product",
        order = "d[palusium-plate]",
        stack_size = 100
    },
    {
        type = "item",
        name = "palusium-powder",
        icon = "__terrapalus__/graphics/icons/palusium-powder.png", 
        icon_size = 64,
        subgroup = "intermediate-product",
        order = "d[palusium-powder]",
        stack_size = 25
    },
    {
        type = "item",
        name = "palusium-crystal",
        icon = "__terrapalus__/graphics/icons/palusium-crystal.png", 
        icon_size = 64,
        subgroup = "intermediate-product",
        order = "d[palusium-powder]",
        stack_size = 25
    },
    {
        type = "item",
        name = "uv-turret",
        icon = "__base__/graphics/icons/laser-turret.png",
        subgroup = "turret",
        order = "b[turret]-b[laser-turret]",
        inventory_move_sound = item_sounds.turret_inventory_move,
        pick_sound = item_sounds.turret_inventory_pickup,
        drop_sound = item_sounds.turret_inventory_move,
        place_result = "uv-turret",
        stack_size = 50,
        weight = 40*kg
      },

    -- {
    --     type = "item",
    --     name = "uv-stabilizer",
    --     icon = "__terrapalus__/graphics/entity/uv-stabilizer/quantum-stabilizer-hr-animation-1.png", -- Set an image as the item icon
    --     icon_size = 64,
    --     subgroup = "production-machine",
    --     order = "b[uv-stabilizer]",
    --     place_result = "uv-stabilizer",
    --     stack_size = 10
    -- }
})
