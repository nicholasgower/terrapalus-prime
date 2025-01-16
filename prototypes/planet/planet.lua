local planet_map_gen = require("prototypes/planet/planet-terrapalus-map-gen")
local effects = require("__terrapalus-prime__/prototypes/planet/surface-render-parameter-effects")
local asteroid_util = require("__space-age__/prototypes/planet/asteroid-spawn-definitions")
local planet_catalogue_gleba = require("__space-age__/prototypes/planet/procession-catalogue-gleba")
-- local temperature = settings.startup["surface-temperature"].value
local pressure = settings.startup["surface-pressure"].value
-- local gravity = settings.startup["surface-gravity"].value

-- https://lua-api.factorio.com/latest/classes/LuaSurface.html#global_effect

--  ClassLuaSpaceLocationPrototype
-- https://lua-api.factorio.com/latest/classes/LuaSpaceLocationPrototype.html

data:extend(
{
    {
        type = "planet",
        name = "terrapalus",
        icon = "__terrapalus-prime__/graphics/icons/terrapalus.png",
        starmap_icon = "__terrapalus-prime__/graphics/icons/starmap-planet-terrapalus.png",
        starmap_icon_size = 512,
        gravity_pull = 0,
        distance = 22,
        orientation = 0.172,
        magnitude = 0.4,
        order = "c[terra-palus]",
        subgroup = "planets",
        map_gen_settings = planet_map_gen.terrapalus(),
        pollutant_type = "pollution",
        solar_power_in_space = 20,
        draw_orbit = false,
        auto_save_on_first_trip = true,
        platform_procession_set = {
            arrival = {"planet-to-platform-b"},
            departure = {"platform-to-planet-a"}
        },
        planet_procession_set = {
            arrival = {"platform-to-planet-b"},
            departure = {"planet-to-platform-a"}
        },
        procession_graphic_catalogue = planet_catalogue_gleba, -- Reuse Gleba's procession graphics
        
        surface_properties = {
            ["day-night-cycle"] = 8 * minute,
            ["magnetic-field"] = 40,
            ["solar-power"] = 20,
            pressure = pressure,
            gravity = 25
        },
        surface_render_parameters = {
            fog = effects.terrapalus_fog_effect_properties(),
            -- clouds = effects.terrapalus_clouds_effect_properties(),
            -- Using Gleba's cloudscape but with different colors
            -- clouds_color1 = {200, 70, 255, 1.0},
            -- clouds_color2 = {25, 0, 255, 1.0}
        },
        asteroid_spawn_influence = 1,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.nauvis_gleba, 0.9),
        persistent_ambient_sounds =
        {
          base_ambience =
          {
            {sound = {filename = "__space-age__/sound/wind/base-wind-gleba-night.ogg", volume = 0.8, advanced_volume_control = {darkness_threshold = 0.85}}},
            {sound = {filename = "__space-age__/sound/wind/base-wind-gleba-day.ogg", volume = 0.8, advanced_volume_control = {darkness_threshold = -0.7}}}
          },
          wind = {filename = "__space-age__/sound/wind/wind-gleba.ogg", volume = 0.8},
          crossfade =
          {
            order = {"wind", "base_ambience"},
            curve_type = "cosine",
            from = {control = 0.35, volume_percentage = 0.2},
            to = {control = 2, volume_percentage = 100.0}
          },
          semi_persistent =
          {
            {
              sound = {variations = sound_variations("__space-age__/sound/world/semi-persistent/wind-gust", 6, 0.4)},
              delay_mean_seconds = 10,
              delay_variance_seconds = 5
            },
            {
              sound =
                {
                  filename = "__space-age__/sound/world/weather/rain.ogg", volume = 0.25,
                  advanced_volume_control = {fades = {fade_in = {curve_type = "cosine", from = {control = 0.2, volume_percentage = 0.6}, to = {1.2, 100.0 }}}}
                }
            },
            {
              sound =
                {
                  variations = sound_variations("__space-age__/sound/world/semi-persistent/night-birds", 14, 0.4),
                  advanced_volume_control =
                  {
                    fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 0.0}, to = {1.5, 100.0}}},
                    darkness_threshold = 0.85
                  }
                },
                delay_mean_seconds = 10,
                delay_variance_seconds = 5
            }
          }
        },
        player_effects =
        { -- TODO: replace with shader & find a way to have rain appear and disappear with weather system.
          type = "cluster",
          cluster_count = 10,
          distance = 8,
          distance_deviation = 8,
          action_delivery =
          {
            type = "instant",
            source_effects =
            {
              type = "create-trivial-smoke",
              smoke_name = "gleba-raindrops",
              speed = {-0.05, 0.5},
              initial_height = 1,
              speed_multiplier = 2,
              speed_multiplier_deviation = 0.05,
              starting_frame = 2,
              starting_frame_deviation = 2,
              offset_deviation = {{-96, -56}, {96, 40}},
              speed_from_center = 0.01,
              speed_from_center_deviation = 0.02
            }
          }
        },
    },
    -- Connection to Gleba
    {
        type = "space-connection",
        name = "gleba-terrapalus",
        subgroup = "planet-connections",
        from = "gleba",
        to = "terrapalus",
        order = "b",
        length = 3600,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.nauvis_gleba)
    }
})