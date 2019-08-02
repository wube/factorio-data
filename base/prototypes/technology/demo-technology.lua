data:extend(
{
  {
    type = "technology",
    name = "basic-mining",
    icon_size = 128,
    icon = "__base__/graphics/technology/demo/basic-mining.png",
    enabled = false,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "burner-mining-drill"
      },
      {
        type = "unlock-recipe",
        recipe = "wooden-chest"
      },
      {
        type = "unlock-recipe",
        recipe = "automation-science-pack"
      },
      {
        type = "unlock-recipe",
        recipe = "iron-gear-wheel"
      },
      {
        type = "unlock-recipe",
        recipe = "stone-furnace"
      },
      {
        type = "unlock-recipe",
        recipe = "iron-plate"
      },
      {
        type = "unlock-recipe",
        recipe = "stone-brick"
      },
      {
        type = "unlock-recipe",
        recipe = "copper-plate"
      },
      {
        type = "unlock-recipe",
        recipe = "small-electric-pole"
      },
    },
    unit =
    {
      count = 8,
      ingredients = {{"automation-science-pack", 1}},
      time = 1
    },
    order = "c-a"
  },
  {
    type = "technology",
    name = "basic-electronics",
    icon_size = 128,
    icon = "__base__/graphics/technology/demo/basic-electronics.png",
    enabled = false,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "electronic-circuit"
      },
      {
        type = "unlock-recipe",
        recipe = "copper-cable"
      },
      {
        type = "unlock-recipe",
        recipe = "assembling-machine-1"
      }
    },
    unit =
    {
      count = 10,
      ingredients = {{"automation-science-pack", 1}},
      time = 6
    },
    prerequisites = {'basic-mining'},
    order = "c-a"
  },
  {
    type = "technology",
    name = "basic-mapping",
    icon_size = 128,
    icon = "__base__/graphics/technology/demo/basic-mapping.png",
    enabled = false,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "radar"
      },
    },
    unit =
    {
      count = 20,
      ingredients = {{"automation-science-pack", 1}},
      time = 2
    },
    prerequisites = {'basic-electronics'},
    order = "c-a"
  },
  {
    type = "technology",
    name = "electric-inserter",
    icon_size = 128,
    icon = "__base__/graphics/technology/demo/electric-inserter.png",
    enabled = false,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "inserter"
      },
    },
    unit =
    {
      count = 10,
      ingredients = {{"automation-science-pack", 1}},
      time = 5
    },
    prerequisites = {'basic-electronics'},
    order = "c-a"
  },
  {
    type = "technology",
    name = "basic-logistics",
    icon_size = 128,
    icon = "__base__/graphics/technology/demo/basic-logistics.png",
    enabled = false,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "transport-belt"
      },
      {
        type = "unlock-recipe",
        recipe = "burner-inserter"
      },
    },
  unit =
    {
      count = 20,
      ingredients = {{"automation-science-pack", 1}},
      time = 5
    },
    prerequisites = {'basic-mining'},
    order = "c-a"
  },
  {
    type = "technology",
    name = "analyse-ship",
    icon_size = 128,
    icon = "__base__/graphics/technology/demo/analyse-ship.png",
    enabled = false,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "pipe-to-ground"
      },
      {
        type = "unlock-recipe",
        recipe = "pipe"
      },
      {
        type = "unlock-recipe",
        recipe = "offshore-pump"
      },
      {
        type = "unlock-recipe",
        recipe = "steam-engine"
      },
      {
        type = "unlock-recipe",
        recipe = "boiler"
      },
      {
        type = "unlock-recipe",
        recipe = "lab"
      },
    },
    unit =
    {
      count = 30,
      ingredients = {{"automation-science-pack", 1}},
      time = 2
    },
    prerequisites = {'basic-mapping'},
    order = "c-a"
  },
  {
    type = "technology",
    name = "basic-optics",
    icon_size = 128,
    icon = "__base__/graphics/technology/demo/basic-optics.png",
    enabled = false,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "small-lamp"
      }
    },
    unit =
    {
      count = 15,
      ingredients = {{"automation-science-pack", 1}},
      time = 30
    },
    prerequisites = {'improved-equipment'},
    order = "a-h-a"
  },
  {
    type = "technology",
    name = "basic-military",
    icon_size = 128,
    icon = "__base__/graphics/technology/demo/basic-military.png",
    enabled = false,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "light-armor"
      },
      {
        type = "unlock-recipe",
        recipe = "pistol"
      },
      {
        type = "unlock-recipe",
        recipe = "firearm-magazine"
      }
    },
    unit =
    {
      count = 40,
      ingredients = {{"automation-science-pack", 1}},
      time = 12
    },
    prerequisites = {'improved-equipment'},
    order = "c-a"
  },
  {
    type = "technology",
    name = "electric-mining",
    icon_size = 128,
    icon = "__base__/graphics/technology/demo/electric-mining.png",
    enabled = false,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "electric-mining-drill"
      },
    },
    unit =
    {
      count = 15,
      ingredients = {{"automation-science-pack", 1}},
      time = 30
    },
    prerequisites = {'analyse-ship'},
    order = "c-a"
  },
  {
    type = "technology",
    name = "active-defense",
    icon_size = 128,
    icon = "__base__/graphics/technology/demo/active-defense.png",
    enabled = false,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "gun-turret"
      },
    },
    unit =
    {
      count = 80,
      ingredients = {{"automation-science-pack", 1}},
      time = 15
    },
    prerequisites = {'basic-military'},
    order = "c-a"
  },
  {
    type = "technology",
    name = "repair-tech",
    icon_size = 128,
    icon = "__base__/graphics/technology/demo/repair-tech.png",
    enabled = false,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "repair-pack"
      },
    },
    unit =
    {
      count = 15,
      ingredients = {{"automation-science-pack", 1}},
      time = 30
    },
    prerequisites = {'basic-military'},
    order = "c-a"
  },
  {
    type = "technology",
    name = "passive-defense",
    icon_size = 128,
    icon = "__base__/graphics/technology/demo/passive-defense.png",
    enabled = false,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "stone-wall"
      },
    },
    unit =
    {
      count = 15,
      ingredients = {{"automation-science-pack", 1}},
      time = 30
    },
    prerequisites = {'active-defense'},
    order = "c-a"
  },
  {
    type = "technology",
    name = "improved-equipment",
    icon_size = 128,
    icon = "__base__/graphics/technology/demo/improved-equipment.png",
    enabled = false,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "electronic-circuit"
      },
      {
        type = "unlock-recipe",
        recipe = "copper-cable"
      },
      {
        type = "unlock-recipe",
        recipe = "automation-science-pack"
      },
      {
        type = "unlock-recipe",
        recipe = "iron-gear-wheel"
      },
    },
    unit =
    {
      count = 50,
      ingredients = {{"automation-science-pack", 1}},
      time = 12
    },
    prerequisites = {'analyse-ship'},
    order = "c-a"
  },
  {
    type = "technology",
    name = "demo-science-pack",
    icon_size = 128,
    icon = "__base__/graphics/technology/demo/demo-science-pack.png",
    enabled = false,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "logistic-science-pack"
      },
    },
    unit =
    {
      count = 100,
      ingredients = {{"automation-science-pack", 1}},
      time = 36
    },
    prerequisites = {'improved-equipment'},
    order = "c-a"
  },
  {
    type = "technology",
    name = "demo-steel-processing",
    icon_size = 128,
    icon = "__base__/graphics/technology/demo/demo-steel-processing.png",
    enabled = false,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "steel-plate"
      },
    },
    unit =
    {
      count = 30,
      ingredients = {
        {"automation-science-pack", 1},
      },
      time = 30
    },
    prerequisites = {'improved-equipment'},
    order = "c-a"
  },
  {
    type = "technology",
    name = "demo-automation-upgrade",
    icon_size = 128,
    icon = "__base__/graphics/technology/demo/demo-automation-upgrade.png",
    enabled = false,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "assembling-machine-2"
      },
    },
    unit =
    {
      count = 30,
      ingredients = {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1}
      },
      time = 30
    },
    prerequisites = {'demo-steel-processing','demo-science-pack'},
    order = "c-a"
  },
  {
    type = "technology",
    name = "demo-steel-poles",
    icon_size = 128,
    icon = "__base__/graphics/technology/demo/demo-steel-poles.png",
    enabled = false,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "medium-electric-pole"
      },
      {
        type = "unlock-recipe",
        recipe = "big-electric-pole"
      },
      {
        type = "unlock-recipe",
        recipe = "iron-stick"
      },
    },
    unit =
    {
      count = 30,
      ingredients = {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1}
      },
      time = 30
    },
    prerequisites = {'demo-steel-processing'},
    order = "c-a"
  },
  {
    type = "technology",
    name = "demo-military-equipment",
    icon_size = 128,
    icon = "__base__/graphics/technology/demo/demo-military-equipment.png",
    enabled = false,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "submachine-gun"
      },
      {
        type = "unlock-recipe",
        recipe = "shotgun"
      },
      {
        type = "unlock-recipe",
        recipe = "shotgun-shell"
      },
    },
    unit =
    {
      count = 60,
      ingredients = {
        {"automation-science-pack", 1},
      },
      time = 30
    },
    prerequisites = {'basic-military'},
    order = "c-a"
  },
  {
    type = "technology",
    name = "demo-munitions-upgrade",
    icon_size = 128,
    icon = "__base__/graphics/technology/demo/demo-munitions-upgrade.png",
    enabled = false,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "piercing-rounds-magazine"
      },
      {
        type = "unlock-recipe",
        recipe = "grenade"
      },
    },
    unit =
    {
      count = 60,
      ingredients = {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1}
      },
      time = 30
    },
    prerequisites = {'demo-military-equipment','demo-steel-processing','demo-science-pack'},
    order = "c-a"
  },
  {
    type = "technology",
    name = "demo-steel-furnace",
    icon_size = 128,
    icon = "__base__/graphics/technology/demo/demo-steel-furnace.png",
    enabled = false,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "steel-furnace"
      },
    },
    unit =
    {
      count = 60,
      ingredients = {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1}
      },
      time = 30
    },
    prerequisites = {'demo-steel-processing','demo-science-pack'},
    order = "c-a"
  },
  {
    type = "technology",
    name = "demo-logistics",
    icon_size = 128,
    icon = "__base__/graphics/technology/demo/demo-underground-belt.png",
    enabled = false,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "underground-belt"
      },
      {
        type = "unlock-recipe",
        recipe = "splitter"
      },
      {
        type = "unlock-recipe",
        recipe = "long-handed-inserter"
      },
    },
    unit =
    {
      count = 25,
      ingredients = {{"automation-science-pack", 1}},
      time = 30
    },
    prerequisites = {'improved-equipment'},
    order = "c-a"
  },
  {
    type = "technology",
    name = "demo-gates",
    icon_size = 128,
    icon = "__base__/graphics/technology/demo/demo-gates.png",
    enabled = false,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "gate"
      },
    },
    unit =
    {
      count = 25,
      ingredients = {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1}
      },
      time = 30
    },
    prerequisites = {'passive-defense','demo-steel-processing','demo-science-pack'},
    order = "c-a"
  },
  {
    type = "technology",
    name = "demo-productivity-1",
    icon_size = 128,
    icon = "__base__/graphics/technology/demo/demo-productivity.png",
    enabled = false,
    effects =
    {
      {
        type = "mining-drill-productivity-bonus",
        modifier = 0.1
      }
    },
    prerequisites = {"demo-automation-upgrade"},
    unit =
    {
      count_formula = "100*L",
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1}
      },
      time = 15
    },
    upgrade = true,
    max_level = "infinite",
    order = "c-k-f-e"
  },
  {
    type = "technology",
    name = "demo-shooting-speed-1",
    enabled = false,
    icon_size = 128,
    icon = "__base__/graphics/technology/demo/demo-shooting-speed.png",
    effects =
    {
      {
        type = "gun-speed",
        ammo_category = "bullet",
        modifier = 0.1
      },
    },
    prerequisites = {"active-defense"},
    unit =
    {
      count_formula = "150*L",
      ingredients =
      {
        {"automation-science-pack", 1}
      },
      time = 30
    },
    upgrade = true,
    max_level = 3,
    order = "e-j-a"
  },
  {
    type = "technology",
    name = "demo-shooting-speed-4",
    enabled = false,
    icon_size = 128,
    icon = "__base__/graphics/technology/demo/demo-shooting-speed.png",
    effects =
    {
      {
        type = "gun-speed",
        ammo_category = "bullet",
        modifier = 0.1
      },
    },
    prerequisites = {"demo-shooting-speed-1"},
    unit =
    {
      count_formula = "150*L",
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
      },
      time = 30
    },
    upgrade = true,
    max_level = "infinite",
    order = "e-j-a"
  },
})

