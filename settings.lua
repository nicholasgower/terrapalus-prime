data:extend({
    -- Startup settings
    {
        type = "double-setting",
        name = "inhibitor-freeze-duration",
        setting_type = "startup",
        default_value = 120,
        minimum_value = 1,
        maximum_value = 10000,
        order = "a"
    },
    {
        type = "double-setting",
        name = "inhibitor-thaw-duration",
        setting_type = "startup",
        default_value = 120,
        minimum_value = 1,
        maximum_value = 10000,
        order = "b"
    },
    {
        type = "double-setting",
        name = "inhibitor-radius",
        setting_type = "startup",
        default_value = 18,
        minimum_value = 1,
        maximum_value = 100,
        order = "c"
    },
    -- Surface properties
    -- {
    --     type = "double-setting",
    --     name = "surface-temperature",
    --     setting_type = "startup",
    --     default_value = 10,  -- Default temperature
    --     minimum_value = -5, 
    --     maximum_value = 25,
    --     order = "d"
    -- },
    {
        type = "double-setting",
        name = "surface-pressure",
        setting_type = "startup",
        default_value = 2000,  -- Default atmospheric pressure
        minimum_value = 1000,
        maximum_value = 4000,
        order = "e"
    },
    -- {
    --     type = "double-setting",
    --     name = "surface-gravity",
    --     setting_type = "startup",
    --     default_value = 25,  -- Default gravity
    --     minimum_value = 0.1,
    --     maximum_value = 30,
    --     order = "f"
    -- },
    -- Day/Night Cycle Settings
    {
        type = "bool-setting",
        name = "freeze-daytime",
        setting_type = "startup",
        default_value = true,
        order = "g"
    },
    {
        type = "double-setting",
        name = "daytime-value",
        setting_type = "startup",
        default_value = 0.5,
        minimum_value = 0,
        maximum_value = 1,
        order = "h"
    }
})
