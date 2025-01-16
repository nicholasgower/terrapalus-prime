-- prototypes/recipe/recipes.lua
data:extend({
    {
        type = "recipe",
        name = "inhibitor-lamp",
        enabled = true,
        ingredients = {
            {type = "item", name = "small-lamp", amount = 1},
            {type = "item", name = "electronic-circuit", amount = 2},
            {type = "item", name = "copper-cable", amount = 5},
            {type = "item", name = "palusium-crystal", amount = 100},
            {type = "item", name = "palusium-plate", amount = 50}
        },
        results = {
            {type = "item", name = "inhibitor-lamp", amount = 1}
        }
    },
    {
        type = "recipe",
        name = "palusium-processing",
        category = "smelting",  
        enabled = false,
        ingredients = {
            {type = "item", name = "palusium-ore", amount = 50}
        },
        results = {
            {type = "item", name = "palusium-plate", amount = 1}
        }
        
    },
    {
        type = "recipe",
        name = "palusium-crushing",
        category = "smelting",  
        enabled = false,
        ingredients = {
            {type = "item", name = "palusium-plate", amount = 25}
        },
        results = {
            {type = "item", name = "palusium-powder", amount = 1}
        }
        
    },
    {
        type = "recipe",
        name = "palusium-refining",
        category = "crafting-with-fluid",  
        enabled = false,
        energy_required = 25,
        ingredients = {
            {type = "fluid", name = "water", amount = 25},
            {type = "item", name = "palusium-powder", amount = 25}
        },
        results = {
            {type = "item", name = "palusium-crystal", amount = 1}
        }
        
    },
    {
        type = "recipe",
        name = "palusium-liquefaction",
        category = "chemistry",
        subgroup = "fluid-recipes",
        order = "c[oil-products]",
        energy_required = 25,
        enabled = false,
        ingredients =
        {
            {type = "fluid", name = "water", amount = 25},
            {type = "fluid", name = "heavy-oil", amount = 25},
            {type = "item", name = "palusium-powder", amount = 10},
          },
        results = {{type = "fluid", name = "ultravium", amount = 50}},
        allow_productivity = true
      },

--     {
--         type = "recipe",
--         name = "uv-stabilizer",
--         enabled = false,
--         ingredients = {
--             {type = "item", name = "iron-plate", amount = 10},
--             {type = "item", name = "electronic-circuit", amount = 5},
--             {type = "item", name = "palusium-plate", amount = 5}
--         },
--         results = {
--             {type = "item", name = "uv-stabilizer", amount = 1}
--     }
-- }
    
})
