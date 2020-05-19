data:extend(
{
  {
    type = "recipe",
    name = "wooden-chest",
    ingredients = {{"wood", 2}},
    result = "wooden-chest"
  },
  {
    type = "recipe",
    name = "iron-stick",
    ingredients = {{"iron-plate", 1}},
    result = "iron-stick",
    result_count = 2
  },
  {
    type = "recipe",
    name = "stone-furnace",
    ingredients = {{"stone", 5}},
    result = "stone-furnace"
  },
  {
    type = "recipe",
    name = "boiler",
    ingredients = {{"stone-furnace", 1}, {"pipe", 4}},
    result = "boiler"
  },
  {
    type = "recipe",
    name = "steam-engine",
    normal =
    {
      ingredients =
      {
        {"iron-gear-wheel", 8},
        {"pipe", 5},
        {"iron-plate", 10}
      },
      result = "steam-engine"
    },
    expensive =
    {
      ingredients =
      {
        {"iron-gear-wheel", 10},
        {"pipe", 5},
        {"iron-plate", 50}
      },
      result = "steam-engine"
    }
  },
  {
    type = "recipe",
    name = "iron-gear-wheel",
    normal =
    {
      ingredients = {{"iron-plate", 2}},
      result = "iron-gear-wheel"
    },
    expensive =
    {
      ingredients = {{"iron-plate", 4}},
      result = "iron-gear-wheel"
    }
  },
  {
    type = "recipe",
    name = "electronic-circuit",
    normal =
    {
      ingredients =
      {
        {"iron-plate", 1},
        {"copper-cable", 3}
      },
      result = "electronic-circuit"
    },
    expensive =
    {
      ingredients =
      {
        {"iron-plate", 2},
        {"copper-cable", 8}
      },
      result = "electronic-circuit"
    }
  },
  {
    type = "recipe",
    name = "transport-belt",
    ingredients =
    {
      {"iron-plate", 1},
      {"iron-gear-wheel", 1}
    },
    result = "transport-belt",
    result_count = 2
  },
  {
    type = "recipe",
    name = "electric-mining-drill",
    normal =
    {
      energy_required = 2,
      ingredients =
      {
        {"electronic-circuit", 3},
        {"iron-gear-wheel", 5},
        {"iron-plate", 10}
      },
      result = "electric-mining-drill"
    },
    expensive =
    {
      energy_required = 2,
      ingredients =
      {
        {"electronic-circuit", 5},
        {"iron-gear-wheel", 10},
        {"iron-plate", 20}
      },
      result = "electric-mining-drill"
    }
  },
  {
    type = "recipe",
    name = "burner-mining-drill",
    normal =
    {
      energy_required = 2,
      ingredients =
      {
        {"iron-gear-wheel", 3},
        {"stone-furnace", 1},
        {"iron-plate", 3}
      },
      result = "burner-mining-drill"
    },
    expensive =
    {
      energy_required = 4,
      ingredients =
      {
        {"iron-gear-wheel", 6},
        {"stone-furnace", 2},
        {"iron-plate", 6}
      },
      result = "burner-mining-drill"
    }
  },
  {
    type = "recipe",
    name = "inserter",
    ingredients =
    {
      {"electronic-circuit", 1},
      {"iron-gear-wheel", 1},
      {"iron-plate", 1}
    },
    result = "inserter"
  },
  {
    type = "recipe",
    name = "fast-inserter",
    enabled = false,
    ingredients =
    {
      {"electronic-circuit", 2},
      {"iron-plate", 2},
      {"inserter", 1}
    },
    result = "fast-inserter"
  },
  {
    type = "recipe",
    name = "filter-inserter",
    enabled = false,
    ingredients =
    {
      {"fast-inserter", 1},
      {"electronic-circuit", 4}
    },
    result = "filter-inserter"
  },
  {
    type = "recipe",
    name = "long-handed-inserter",
    enabled = false,
    ingredients =
    {
      {"iron-gear-wheel", 1},
      {"iron-plate", 1},
      {"inserter", 1}
    },
    result = "long-handed-inserter"
  },
  {
    type = "recipe",
    name = "burner-inserter",
    ingredients =
    {
      {"iron-plate", 1},
      {"iron-gear-wheel", 1}
    },
    result = "burner-inserter"
  },
  {
    type = "recipe",
    name = "pipe",
    normal =
    {
      ingredients = {{"iron-plate", 1}},
      result = "pipe"
    },
    expensive =
    {
      ingredients = {{"iron-plate", 2}},
      result = "pipe"
    }
  },
  {
    type = "recipe",
    name = "offshore-pump",
    ingredients =
    {
      {"electronic-circuit", 2},
      {"pipe", 1},
      {"iron-gear-wheel", 1}
    },
    result = "offshore-pump"
  },
  {
    type = "recipe",
    name = "copper-cable",
    ingredients = {{"copper-plate", 1}},
    result = "copper-cable",
    result_count = 2
  },
  {
    type = "recipe",
    name = "small-electric-pole",
    ingredients =
    {
      {"wood", 1},
      {"copper-cable", 2}
    },
    result = "small-electric-pole",
    result_count = 2
  },
  {
    type = "recipe",
    name = "pistol",
    energy_required = 5,
    ingredients =
    {
      {"copper-plate", 5},
      {"iron-plate", 5}
    },
    result = "pistol"
  },
  {
    type = "recipe",
    name = "submachine-gun",
    normal =
    {
      enabled = false,
      energy_required = 10,
      ingredients =
      {
        {"iron-gear-wheel", 10},
        {"copper-plate", 5},
        {"iron-plate", 10}
      },
      result = "submachine-gun"
    },
    expensive =
    {
      enabled = false,
      energy_required = 10,
      ingredients =
      {
        {"iron-gear-wheel", 15},
        {"copper-plate", 20},
        {"iron-plate", 30}
      },
      result = "submachine-gun"
    }
  },
  {
    type = "recipe",
    name = "firearm-magazine",
    energy_required = 1,
    ingredients = {{"iron-plate", 4}},
    result = "firearm-magazine",
    result_count = 1
  },
  {
    type = "recipe",
    name = "light-armor",
    enabled = true,
    energy_required = 3,
    ingredients = {{"iron-plate", 40}},
    result = "light-armor"
  },
  {
    type = "recipe",
    name = "radar",
    ingredients =
    {
      {"electronic-circuit", 5},
      {"iron-gear-wheel", 5},
      {"iron-plate", 10}
    },
    result = "radar"
  },
  {
    type = "recipe",
    name = "small-lamp",
    enabled = false,
    ingredients =
    {
      {"electronic-circuit", 1},
      {"copper-cable", 3},
      {"iron-plate", 1}
    },
    result = "small-lamp"
  },
  {
    type = "recipe",
    name = "pipe-to-ground",
    ingredients =
    {
      {"pipe", 10},
      {"iron-plate", 5}
    },
    result_count = 2,
    result = "pipe-to-ground"
  },
  {
    type = "recipe",
    name = "assembling-machine-1",
    enabled = false,
    ingredients =
    {
      {"electronic-circuit", 3},
      {"iron-gear-wheel", 5},
      {"iron-plate", 9}
    },
    result = "assembling-machine-1"
  },
  {
    type = "recipe",
    name = "repair-pack",
    ingredients =
    {
      {"electronic-circuit", 2},
      {"iron-gear-wheel", 2}
    },
    result = "repair-pack"
  },
  {
    type = "recipe",
    name = "automation-science-pack",
    energy_required = 5,
    ingredients =
    {
      {"copper-plate", 1},
      {"iron-gear-wheel", 1}
    },
    result = "automation-science-pack"
  },
  {
    type = "recipe",
    name = "logistic-science-pack",
    enabled = false,
    energy_required = 6,
    ingredients =
    {
      {"inserter", 1},
      {"transport-belt", 1}
    },
    result = "logistic-science-pack"
  },
  {
    type = "recipe",
    name = "lab",
    energy_required = 2,
    ingredients =
    {
      {"electronic-circuit", 10},
      {"iron-gear-wheel", 10},
      {"transport-belt", 4}
    },
    result = "lab"
  },
  {
    type = "recipe",
    name = "stone-wall",
    enabled = false,
    ingredients = {{"stone-brick", 5}},
    result = "stone-wall"
  },
  {
    type = "recipe",
    name = "assembling-machine-2",
    normal =
    {
      enabled = false,
      ingredients =
      {
        {"steel-plate", 2},
        {"electronic-circuit", 3},
        {"iron-gear-wheel", 5},
        {"assembling-machine-1", 1}
      },
      result = "assembling-machine-2"
    },
    expensive =
    {
      enabled = false,
      ingredients =
      {
        {"steel-plate", 5},
        {"electronic-circuit", 5},
        {"iron-gear-wheel", 10},
        {"assembling-machine-1", 1}
      },
      result = "assembling-machine-2"
    }
  },
  {
    type = "recipe",
    name = "splitter",
    enabled = false,
    energy_required = 1,
    ingredients =
    {
      {"electronic-circuit", 5},
      {"iron-plate", 5},
      {"transport-belt", 4}
    },
    result = "splitter"
  },
  {
    type = "recipe",
    name = "underground-belt",
    enabled = false,
    energy_required = 1,
    ingredients =
    {
      {"iron-plate", 10},
      {"transport-belt", 5}
    },
    result_count = 2,
    result = "underground-belt"
  },
  {
    type = "recipe",
    name = "loader",
    enabled = false,
    energy_required = 1,
    ingredients =
    {
      {"inserter", 5},
      {"electronic-circuit", 5},
      {"iron-gear-wheel", 5},
      {"iron-plate", 5},
      {"transport-belt", 5}
    },
    result = "loader"
  },
  {
    type = "recipe",
    name = "car",
    enabled = false,
    energy_required = 2,
    ingredients =
    {
      {"engine-unit", 8},
      {"iron-plate", 20},
      {"steel-plate", 5}
    },
    result = "car"
  },
  {
    type = "recipe",
    name = "engine-unit",
    energy_required = 10,
    category = "advanced-crafting",
    ingredients =
    {
      {"steel-plate", 1},
      {"iron-gear-wheel", 1},
      {"pipe", 2}
    },
    result = "engine-unit",
    enabled = false
  },
  {
    type = "recipe",
    name = "iron-chest",
    enabled = true,
    ingredients = {{"iron-plate", 8}},
    result = "iron-chest"
  },
  {
    type = "recipe",
    name = "big-electric-pole",
    enabled = false,
    ingredients =
    {
      {"iron-stick", 8},
      {"steel-plate", 5},
      {"copper-plate", 5}
    },
    result = "big-electric-pole"
  },
  {
    type = "recipe",
    name = "medium-electric-pole",
    enabled = false,
    ingredients =
    {
      {"iron-stick", 4},
      {"steel-plate", 2},
      {"copper-plate", 2}
    },
    result = "medium-electric-pole"
  },
  {
    type = "recipe",
    name = "shotgun",
    enabled = false,
    energy_required = 10,
    ingredients =
    {
      {"iron-plate", 15},
      {"iron-gear-wheel", 5},
      {"copper-plate", 10},
      {"wood", 5}
    },
    result = "shotgun"
  },
  {
    type = "recipe",
    name = "shotgun-shell",
    enabled = false,
    energy_required = 3,
    ingredients =
    {
      {"copper-plate", 2},
      {"iron-plate", 2}
    },
    result = "shotgun-shell"
  },
  {
    type = "recipe",
    name = "piercing-rounds-magazine",
    enabled = false,
    energy_required = 3,
    ingredients =
    {
      {"firearm-magazine", 1},
      {"steel-plate", 1},
      {"copper-plate", 5}
    },
    result = "piercing-rounds-magazine"
  },
  {
    type = "recipe",
    name = "grenade",
    enabled = false,
    energy_required = 8,
    ingredients =
    {
      {"iron-plate", 5},
      {"coal", 10}
    },
    result = "grenade"
  },
  {
    type = "recipe",
    name = "steel-furnace",
    ingredients = {{"steel-plate", 6}, {"stone-brick", 10}},
    result = "steel-furnace",
    energy_required = 3,
    enabled = false
  },
  {
    type = "recipe",
    name = "gate",
    enabled = false,
    ingredients = {{"stone-wall", 1}, {"steel-plate", 2}, {"electronic-circuit", 2}},
    result = "gate"
  },
  {
    type = "recipe",
    name = "heavy-armor",
    enabled = false,
    energy_required = 8,
    ingredients = {{ "copper-plate", 100}, {"steel-plate", 50}},
    result = "heavy-armor"
  },
  {
    type = "recipe",
    name = "steel-chest",
    enabled = false,
    ingredients = {{"steel-plate", 8}},
    result = "steel-chest"
  },
  {
    type = "recipe",
    name = "fast-underground-belt",
    energy_required = 2,
    enabled = false,
    ingredients =
    {
      {"iron-gear-wheel", 40},
      {"underground-belt", 2}
    },
    result_count = 2,
    result = "fast-underground-belt"
  },
  {
    type = "recipe",
    name = "fast-splitter",
    enabled = false,
    energy_required = 2,
    ingredients =
    {
      {"splitter", 1},
      {"iron-gear-wheel", 10},
      {"electronic-circuit", 10}
    },
    result = "fast-splitter"
  },
  {
    type = "recipe",
    name = "engine-unit",
    energy_required = 10,
    category = "advanced-crafting",
    ingredients =
    {
      {"steel-plate", 1},
      {"iron-gear-wheel", 1},
      {"pipe", 2}
    },
    result = "engine-unit",
    enabled = false
  },
  {
    type = "recipe",
    name = "concrete",
    energy_required = 10,
    enabled = false,
    category = "crafting-with-fluid",
    ingredients =
    {
      {"stone-brick", 5},
      {"iron-ore", 1},
      {type="fluid", name="water", amount=100}
    },
    result= "concrete",
    result_count = 10
  },
  {
    type = "recipe",
    name = "hazard-concrete",
    energy_required = 0.25,
    enabled = false,
    category = "crafting",
    ingredients =
    {
      {"concrete", 10}
    },
    result= "hazard-concrete",
    result_count = 10
  },
  {
    type = "recipe",
    name = "refined-concrete",
    energy_required = 15,
    enabled = false,
    category = "crafting-with-fluid",
    ingredients =
    {
      {"concrete", 20},
      {"iron-stick", 8},
      {"steel-plate", 1},
      {type="fluid", name="water", amount=100}
    },
    result= "refined-concrete",
    result_count = 10
  },
  {
    type = "recipe",
    name = "refined-hazard-concrete",
    energy_required = 0.25,
    enabled = false,
    category = "crafting",
    ingredients =
    {
      {"refined-concrete", 10}
    },
    result= "refined-hazard-concrete",
    result_count = 10
  },
  {
    type = "recipe",
    name = "landfill",
    energy_required = 0.5,
    enabled = false,
    category = "crafting",
    ingredients =
    {
      {"stone", 20}
    },
    result= "landfill",
    result_count = 1
  },
  {
    type = "recipe",
    name = "fast-transport-belt",
    enabled = false,
    ingredients =
    {
      {"iron-gear-wheel", 5},
      {"transport-belt", 1}
    },
    result = "fast-transport-belt"
  },
  {
    type = "recipe",
    name = "solar-panel",
    energy_required = 10,
    enabled = false,
    ingredients =
    {
      {"steel-plate", 5},
      {"electronic-circuit", 15},
      {"copper-plate", 5}
    },
    result = "solar-panel"
  },
  {
    type = "recipe",
    name = "rail",
    enabled = false,
    ingredients =
    {
      {"stone", 1},
      {"iron-stick", 1},
      {"steel-plate", 1}
    },
    result = "rail",
    result_count = 2
  },
  {
    type = "recipe",
    name = "locomotive",
    energy_required = 4,
    enabled = false,
    ingredients =
    {
      {"engine-unit", 20},
      {"electronic-circuit", 10},
      {"steel-plate", 30}
    },
    result = "locomotive"
  },
  {
    type = "recipe",
    name = "cargo-wagon",
    energy_required = 1,
    enabled = false,
    ingredients =
    {
      {"iron-gear-wheel", 10},
      {"iron-plate", 20},
      {"steel-plate", 20}
    },
    result = "cargo-wagon"
  },
  {
    type = "recipe",
    name = "rail-signal",
    enabled = false,
    ingredients =
    {
      {"electronic-circuit", 1},
      {"iron-plate", 5}
    },
    result = "rail-signal"
  },
  {
    type = "recipe",
    name = "rail-chain-signal",
    enabled = false,
    ingredients =
    {
      {"electronic-circuit", 1},
      {"iron-plate", 5}
    },
    result = "rail-chain-signal"
  },
  {
    type = "recipe",
    name = "train-stop",
    enabled = false,
    ingredients =
    {
      {"electronic-circuit", 5},
      {"iron-plate", 6},
      {"iron-stick", 6},
      {"steel-plate", 3}
    },
    result = "train-stop"
  },
}
)
