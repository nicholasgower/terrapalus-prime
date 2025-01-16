-- prototypes/entity/resources.lua

-- prototypes/entity/resources.lua
-- prototypes/entity/resources.lua

local resource_autoplace = require("resource-autoplace")
local sounds = require("__base__.prototypes.entity.sounds")
resource_autoplace.initialize_patch_set("palusium-ore", false)

data:extend({
  {
    type = "resource",
    name = "palusium-ore",
    icon = "__terrapalus-prime__/graphics/icons/palusium-ore.png",  -- Change to a custom icon if available
    icon_size = 64,
    flags = {"placeable-neutral"},
    order = "x-y-z",  -- Set an order that’s distinct from uranium for inventory sorting
    tree_removal_probability = 0.7,
    tree_removal_max_distance = 32 * 32,
    walking_sound = sounds.ore,
    driving_sound = stone_driving_sound,
    minable = {
      mining_particle = "stone-particle",
      mining_time = 3.0,
      result = "palusium-ore",
    --   fluid_amount = 10,
    --   required_fluid = "sulfuric-acid" 
    },
    collision_box = {{-0.1, -0.1}, {0.1, 0.1}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    autoplace = resource_autoplace.resource_autoplace_settings {
      name = "palusium-ore",
      order = "c",
      base_density = 0.9,
      base_spots_per_km2 = 1.25,
      has_starting_area_placement = false,
      random_spot_size_minimum = 2,
      random_spot_size_maximum = 4,
      regular_rq_factor_multiplier = 1,
      candidate_spot_count = 92, -- To match 0.17.50 placement
    },
    stage_counts = {10000, 6330, 3670, 1930, 870, 270, 100, 50},
    stages = {
      sheet = {
        filename = "__terrapalus-prime__/graphics/entity/palusium-ore/palusium-ore.png",  -- Use custom graphics if available
        priority = "extra-high",
        width = 128,
        height = 128,
        frame_count = 8,
        variation_count = 8,
        scale = 0.5
      }
    },
    stages_effect = {
      sheet = {
        filename = "__terrapalus-prime__/graphics/entity/palusium-ore/palusium-ore-glow.png",  -- Use custom glow graphics if available
        priority = "extra-high",
        width = 128,
        height = 128,
        frame_count = 8,
        variation_count = 8,
        scale = 0.5,
        blend_mode = "additive",
        flags = {"light"}
      }
    },
    effect_animation_period = 4,
    effect_animation_period_deviation = 0.5,
    effect_darkness_multiplier = 4.8,
    min_effect_alpha = 0.5,
    max_effect_alpha = 0.6,
    mining_visualisation_tint = {r = 0.3, g = 0.1, b = 0.8, a = 1.0},  -- Custom tint for mining effects
    map_color = {r = 0.3, g = 0.0, b = 0.8}  -- Custom color for map view
  }
})




















-- local palusium_ore = table.deepcopy(data.raw["resource"]["uranium-ore"])

-- palusium_ore.name = "palusium-ore"
-- palusium_ore.icon = "__terrapalus-prime__/graphics/icons/palusium-ore.png"
-- palusium_ore.icon_size = 64
-- palusium_ore.minable.result = "palusium-ore"

-- -- Adjust other properties as needed
-- palusium_ore.autoplace.richness_base = 1000
-- palusium_ore.autoplace.richness_multiplier = 15000
-- palusium_ore.autoplace.starting_area = true
-- palusium_ore.autoplace.starting_area_amount = 600
-- palusium_ore.stage_counts = {15000, 8000, 4000, 2000, 1000, 500, 250, 100}
-- palusium_ore.map_color = {r = 0.5, g = 0.8, b = 0.5}  -- Distinct color for map view

-- data:extend({palusium_ore})
