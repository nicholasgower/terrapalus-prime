data:extend(
{
  {
      type = "technology",
      name = "planet-discovery-terrapalus",
      icons = util.technology_icon_constant_planet("__terrapalus-prime__/graphics/technology/terrapalus.png"),
      icon_size = 256,
      essential = true,
      effects =
      {
        {
          type = "unlock-space-location",
          space_location = "terrapalus",
          use_icon_overlay_constant = true
        }
      },
      prerequisites = {"planet-discovery-gleba"},
      unit =
      {
        count = 500,
        ingredients =
        {
          {"automation-science-pack", 1},
          {"logistic-science-pack", 1},
          {"chemical-science-pack", 1},
          {"space-science-pack", 1}
        },
        time = 60
      }
    },
    {
      type = "technology",
      name = "palusium-processing",
      icon = "__terrapalus-prime__/graphics/technology/palusium-processing.png",
      icon_size = 256,
      prerequisites = {"planet-discovery-terrapalus"},
      effects = {
          {
              type = "unlock-recipe",
              recipe = "palusium-processing"
          }
      },
      unit = {
          count = 150,
          ingredients = {
              {"automation-science-pack", 1},
              {"space-science-pack", 1},
              {"chemical-science-pack", 1},
              {"military-science-pack", 1}
          },
          time = 30
      },
      order = "e-p-b-c"
  },
  {
    type = "technology",
    name = "palusium-crushing",
    icon = "__terrapalus-prime__/graphics/technology/palusium-crushing.png",
    icon_size = 256,
    prerequisites = {"planet-discovery-terrapalus"},
    effects = {
        {
            type = "unlock-recipe",
            recipe = "palusium-crushing"
        }
    },
    unit = {
        count = 150,
        ingredients = {
            {"automation-science-pack", 1},
            {"space-science-pack", 1},
            {"chemical-science-pack", 1},
            {"military-science-pack", 1}
        },
        time = 30
    },
    order = "e-p-b-c"
},
{
  type = "technology",
  name = "palusium-liquefaction",
  icon = "__terrapalus-prime__/graphics/technology/palusium-liquefaction.png",  -- Placeholder icon
  icon_size = 256,
  prerequisites = {"palusium-crushing"},
  effects = {
      {
          type = "unlock-recipe",
          recipe = "palusium-liquefaction"
      }
  },
  unit = {
      count = 150,
      ingredients = {
          {"automation-science-pack", 1},
          {"space-science-pack", 1},
          {"chemical-science-pack", 1},
          {"military-science-pack", 1}
      },
      time = 30
  },
  order = "e-p-b-c"
},
{
  type = "technology",
  name = "palusium-refining",
  icon = "__terrapalus-prime__/graphics/technology/palusium-refining.png",  -- Placeholder icon
  icon_size = 256,
  prerequisites = {"palusium-crushing"},
  effects = {
      {
          type = "unlock-recipe",
          recipe = "palusium-refining"
      }
  },
  unit = {
      count = 150,
      ingredients = {
          {"automation-science-pack", 1},
          {"space-science-pack", 1},
          {"chemical-science-pack", 1},
          {"military-science-pack", 1}
      },
      time = 30
  },
  order = "e-p-b-c"
},
{
  type = "technology",
  name = "inhibitor-lamp",
  icon = "__terrapalus-prime__/graphics/technology/inhibitor-lamp.png",
  icon_size = 256,
  prerequisites = {"palusium-refining","palusium-processing"},
  effects = {
      {
          type = "unlock-recipe",
          recipe = "inhibitor-lamp"
      }
  },
  unit = {
      count = 150,
      ingredients = {
          {"automation-science-pack", 1},
          {"space-science-pack", 1},
          {"chemical-science-pack", 1},
          {"military-science-pack", 1}
      },
      time = 30
  },
  order = "e-p-b-c"
},
{
    type = "technology",
    name = "uv-turret",
    icon_size = 256,
    icon_mipmaps = 4,
    icon = "__base__/graphics/technology/laser-turret.png", -- need to create a custom icon
    effects = {
      {
        type = "unlock-recipe",
        recipe = "uv-turret"
      }
    },
    prerequisites = {
      "laser-turret",
      "inhibitor-lamp",
      "chemical-science-pack",

    },
    unit = {
      count = 150,
      ingredients = {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"military-science-pack", 1},
        {"chemical-science-pack", 1}
      },
      time = 30
    },
    order = "a-j-b"
  },
-- {
--   type = "technology",
--   name = "uv-stabilizer",
--   icon = "__base__/graphics/technology/nuclear-power.png",  -- Placeholder icon
--   icon_size = 256,
--   prerequisites = {"palusium-processing"},
--   effects = {
--       {
--           type = "unlock-recipe",
--           recipe = "uv-stabilizer"
--       }
--   },
--   unit = {
--       count = 150,
--       ingredients = {
--           {"automation-science-pack", 1},
--           {"space-science-pack", 1},
--           {"chemical-science-pack", 1},
--           {"military-science-pack", 1}
--       },
--       time = 30
--   },
--   order = "e-p-b-c"
-- }

})