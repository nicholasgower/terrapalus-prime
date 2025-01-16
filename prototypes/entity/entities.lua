local hit_effects = require("__base__.prototypes.entity.hit-effects")
local math3d = require "math3d"
data:extend({
    {
      type = "lamp",
      name = "inhibitor-lamp",
      icon = "__base__/graphics/icons/small-lamp.png",
      flags = {"placeable-neutral", "player-creation"},
      fast_replaceable_group = "lamp",
      minable = {mining_time = 0.1, result = "inhibitor-lamp"},
      max_health = 150,
      always_on = true,
      corpse = "lamp-remnants",
      dying_explosion = "lamp-explosion",
      -- radius_visualisation_picture =
      -- {
      --   filename = "__terrapalus__/graphics/entity/inhibitor-lamp/inhibitor-lamp-radius-visualization.png",
      --   width = 25,
      --   height = 25,
      --   priority = "extra-high-no-scale"
      -- },
      radius_visualisation_specification = {
        distance = 18,
        sprite = {
            filename = "__terrapalus__/graphics/entity/inhibitor-lamp/inhibitor-lamp-radius-visualization.png",
            width = 12,            -- Replace with the actual width of your sprite image
            height = 12,           -- Replace with the actual height of your sprite image
            scale = 1,             -- Adjust if you want to scale the sprite up or down
            priority = "extra-high", -- Optional: determines render priority (e.g., "extra-high", "high", "low")
            -- tint = {r = 1, g = 0.5, b = 0.5, a = 0.7}, -- Optional: adjust for color tint and transparency
            -- flags = {"gui-icon"}, -- Optional: sprite flag(s), if needed, such as "icon", "group=icon", etc.
            -- shift = {0, 0},        -- Optional: adjust for any x, y shift from the entity center in tiles
            -- draw_as_light = false, -- Optional: only one of draw_as_light, draw_as_glow, or draw_as_shadow can be true
        },
        offset = {0, 0},
        draw_in_cursor = true,
        draw_on_selection = true,
    },
      -- radius_minimap_visualisation_color = {0.358, 0.092, 0.750, 0.275},
      collision_box = {{-0.15, -0.15}, {0.15, 0.15}},
      selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
      damaged_trigger_effect = hit_effects.entity(),
      impact_category = "glass",
      open_sound = {filename = "__base__/sound/open-close/electric-small-open.ogg", volume = 0.7},
      close_sound = {filename = "__base__/sound/open-close/electric-small-close.ogg", volume = 0.7},

      -- Energy usage
      energy_source = {
        type = "electric",
        usage_priority = "lamp"
      },
      energy_usage_per_tick = "1.5MW",

      -- Light properties
      darkness_for_all_lamps_on = 0.5,
      darkness_for_all_lamps_off = 0.3,
      -- Light Definition
      -- https://lua-api.factorio.com/latest/types/LightDefinition.html
      
      light = {intensity = 1.5, size = 50, color = {1, 1, 0.75}},
      light_when_colored = {intensity = 1.5, size = 50, color={r=0.9, g=0.9, b=1.0, a=1.0}},
      glow_size = 10,
      glow_color_intensity = 3,
      glow_render_mode = "additive",

      -- Images
      picture_off = {
        layers = {
          {
            filename = "__terrapalus__/graphics/entity/inhibitor-lamp/lamp.png",
            priority = "high",
            width = 83,
            height = 70,
            shift = util.by_pixel(0.25, 3),
            scale = 0.5,
            tint = {0.9, 0.9, 1}
          },
          {
            filename = "__terrapalus__/graphics/entity/inhibitor-lamp/lamp-shadow.png",
            priority = "high",
            width = 76,
            height = 47,
            shift = util.by_pixel(4, 4.75),
            draw_as_shadow = true,
            scale = 0.5
          }
        }
      },
      picture_on = {
        filename = "__terrapalus__/graphics/entity/inhibitor-lamp/lamp-light.png",
        priority = "high",
        width = 90,
        height = 78,
        shift = util.by_pixel(0, -7),
        scale = 0.5,
        tint = {0.8, 0.8, 1}
      },
      signal_to_color_mapping =
      {
        {type = "virtual", name = "signal-red",    color = {1, 0, 0}},
        {type = "virtual", name = "signal-green",  color = {0, 1, 0}},
        {type = "virtual", name = "signal-blue",   color = {0, 0, 1}},
        {type = "virtual", name = "signal-yellow", color = {1, 1, 0}},
        {type = "virtual", name = "signal-pink",   color = {1, 0, 1}},
        {type = "virtual", name = "signal-cyan",   color = {0, 1, 1}},
        {type = "virtual", name = "signal-white",  color = {1, 1, 1}}
      },
      default_red_signal = { type = "virtual", name = "signal-red" },
      default_green_signal = { type = "virtual", name = "signal-green" },
      default_blue_signal = { type = "virtual", name = "signal-blue" },
      default_rgb_signal = { type = "virtual", name = "signal-white" },
      
      -- Circuit properties
      circuit_wire_connection_point = circuit_connector_definitions["lamp"].points,
      circuit_connector_sprites = circuit_connector_definitions["lamp"].sprites,
      circuit_wire_max_distance = default_circuit_wire_max_distance,
  },
    {
    type = "sticker",
    name = "frozen-sticker",
    flags = {"not-on-map"},
    duration_in_ticks = 600,  -- Duration for the frozen effect
    target_movement_modifier_from = 1.0,    
    target_movement_modifier_to = 0.0,       
    vehicle_speed_modifier_from = 1.0,      
    vehicle_speed_modifier_to = 0.0         
  },
  {
    type = "sticker",
    name = "thawing-sticker",
    flags = {"not-on-map"},
    duration_in_ticks = 240,                 -- Duration for the thaw effect
    target_movement_modifier_from = 0.0,     -- Start with a very low speed (10% of normal speed)
    target_movement_modifier_to = 1.0,       -- End at normal speed (100%)
    vehicle_speed_modifier_from = 0.0,       -- Start vehicles with low speed (10% of normal speed)
    vehicle_speed_modifier_to = 1.0          -- End vehicles at normal speed (100%)
  },
  {
    type = "sticker",
    name = "uv-turret-burn-sticker",
    flags = {"not-on-map"},
    hidden = true,
    animation =
    {
      filename = "__terrapalus__/graphics/entity/uv-burn/smoke.png",
      width = 152,
      height = 120,
      line_length = 5,
      frame_count = 60,
      shift = {-0.53125, -0.4375},
      priority = "high",
      animation_speed = 0.75,
      flags = { "smoke" },
      shift = math3d.vector2.mul({-0.078125, -1.8125}, 0.1),
      draw_as_glow = true
    },

    duration_in_ticks = 480,
    damage_interval = 0,
    -- target_movement_modifier = -0.0,
    -- vehicle_speed_modifier = -0.0,
    -- damage_per_tick = { amount = 10 * 100 / 60, type = "fire" },
    -- spread_fire_entity = "fire-flame-on-tree",
    -- fire_spread_cooldown = 30,
    -- fire_spread_radius = 0.75
  }

})

