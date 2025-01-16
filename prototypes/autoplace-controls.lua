-- prototypes/autoplace-controls.lua

data:extend({
    {
        type = "autoplace-control",
        name = "palusium-ore",
        localised_name = {"", "[entity=palusium-ore] ", {"entity-name.palusium-ore"}},
        richness = true,
        order = "a-f",   -- Positioning order in map generation settings
        category = "resource"
    }
})
