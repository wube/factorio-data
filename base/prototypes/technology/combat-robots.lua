function createfollowerupgrade(level, pack1, pack2, pack3, alienpack, count, addition)
  local result =
  {
    type = "technology",
    name = "follower-robot-count-1",
    icon = "__base__/graphics/technology/follower-robots.png",
    effects =
    {
      {
        type = "maximum-following-robots-count",
        modifier = addition
      }
    },
    prerequisites = {"combat-robotics"},
    unit =
    {
      ingredients = {},
      time = 30
    },
    upgrade = true,
    order = "e-p-b-c"
  }
  result.name = "follower-robot-count-" .. level
  if level == 1 then
    result.prerequisites = {"combat-robotics"}
  else
    result.prerequisites = {"follower-robot-count-" .. (level - 1)}
    if level == 8 then
      result.prerequisites[#result.prerequisites + 1] = "combat-robotics-3"
    end
  end
  result.unit.count = count
  if pack1 ~= 0 then
    table.insert(result.unit.ingredients, {"science-pack-1", pack1})
  end
  if pack2 ~= 0 then
    table.insert(result.unit.ingredients, {"science-pack-2", pack2})
  end
  if pack3 ~= 0 then
    table.insert(result.unit.ingredients, {"science-pack-3", pack3})
  end
  if alienpack ~= 0 then
    table.insert(result.unit.ingredients, {"alien-science-pack", alienpack})
  end
  return result
end

 for i=1,2 do
 data:extend(
{
  createfollowerupgrade(i, 1, 1, 0, 0, i * 50, 1)
})
end
 for i=3,5 do
 data:extend(
{
  createfollowerupgrade(i, 1, 1, 1, 0, i * 50, 2)
})
end

for i=6,10 do
 data:extend(
{
  createfollowerupgrade(i, 1, 1, 1, 1, 20*5 + (i - 5) * 20 * 5, 5)
})
end

for i=11,20 do
 data:extend(
{
  createfollowerupgrade(i, 1, 1, 1, 1, 20 * 5 + 5 * 20 * 5 + (i - 10) * 20 * 10, 10)
})
end

data:extend(
{
  {
    type = "technology",
    name = "combat-robotics",
    icon = "__base__/graphics/technology/combat-robotics.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "defender-capsule"
      }
    },
    prerequisites = {"military-2"},
    unit =
    {
      count = 150,
      ingredients = {
        {"science-pack-1", 1},
        {"science-pack-2", 1}
      },
      time = 30
    },
    order = "e-p-a"
  },
  {
    type = "technology",
    name = "combat-robotics-2",
    icon = "__base__/graphics/technology/combat-robotics.png",
    effects = {
      {
        type = "unlock-recipe",
        recipe = "distractor-capsule"
      }
    },
    prerequisites = {"combat-robotics", "military-3"},
    unit = {
      count = 200,
      ingredients = {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1}
      },
      time = 30
    },
    order = "e-p-b-a"
  },
  {
    type = "technology",
    name = "combat-robotics-3",
    icon = "__base__/graphics/technology/combat-robotics.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "destroyer-capsule"
      }
    },
    prerequisites = {"combat-robotics-2", "speed-module"},
    unit =
    {
      count = 300,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
        {"alien-science-pack", 1}
      },
      time = 30
    },
    order = "e-p-b-b"
  },
  {
    type = "technology",
    name = "combat-robot-damage-1",
    icon = "__base__/graphics/technology/combat-robot-damage.png",
    effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "combat-robot-laser",
        modifier = "0.1"
      },
      {
        type = "ammo-damage",
        ammo_category = "combat-robot-beam",
        modifier = "0.1"
      }
    },
    prerequisites = {"combat-robotics"},
    unit =
    {
      count = 100,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1}
      },
      time = 30
    },
    upgrade = true,
    order = "e-p-c"
  },
  {
    type = "technology",
    name = "combat-robot-damage-2",
    icon = "__base__/graphics/technology/combat-robot-damage.png",
    effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "combat-robot-laser",
        modifier = "0.15"
      },
      {
        type = "ammo-damage",
        ammo_category = "combat-robot-beam",
        modifier = "0.15"
      }
    },
    prerequisites = {"combat-robot-damage-1"},
    unit =
    {
      count = 200,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1}
      },
      time = 30
    },
    upgrade = true,
    order = "e-p-d"
  },
  {
    type = "technology",
    name = "combat-robot-damage-3",
    icon = "__base__/graphics/technology/combat-robot-damage.png",
    effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "combat-robot-laser",
        modifier = "0.2"
      },
      {
        type = "ammo-damage",
        ammo_category = "combat-robot-beam",
        modifier = "0.2"
      }
    },
    prerequisites = {"combat-robot-damage-2"},
    unit =
    {
      count = 100,
      ingredients =
      {
        {"science-pack-1", 2},
        {"science-pack-2", 2},
        {"science-pack-3", 1}
      },
      time = 30
    },
    upgrade = true,
    order = "e-p-e"
  },
  {
    type = "technology",
    name = "combat-robot-damage-4",
    icon = "__base__/graphics/technology/combat-robot-damage.png",
    effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "combat-robot-laser",
        modifier = "0.25"
      },
      {
        type = "ammo-damage",
        ammo_category = "combat-robot-beam",
        modifier = "0.25"
      }
    },
    prerequisites = {"combat-robot-damage-3"},
    unit =
    {
      count = 100,
      ingredients =
      {
        {"science-pack-1", 2},
        {"science-pack-2", 2},
        {"science-pack-3", 1},
        {"alien-science-pack", 1},
      },
      time = 30
    },
    upgrade = true,
    order = "e-p-f"
  },
  {
    type = "technology",
    name = "combat-robot-damage-5",
    icon = "__base__/graphics/technology/combat-robot-damage.png",
    effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "combat-robot-laser",
        modifier = "0.3"
      },
      {
        type = "ammo-damage",
        ammo_category = "combat-robot-beam",
        modifier = "0.3"
      }
    },
    prerequisites = {"combat-robot-damage-4"},
    unit =
    {
      count = 200,
      ingredients =
      {
        {"science-pack-1", 2},
        {"science-pack-2", 2},
        {"science-pack-3", 1},
        {"alien-science-pack", 1},
      },
      time = 30
    },
    upgrade = true,
    order = "e-p-g"
  }
})
