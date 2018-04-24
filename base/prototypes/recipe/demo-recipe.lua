data:extend(
{
  {
    type = "recipe",
    name = "wood",
    ingredients = {{"raw-wood", 1}},
    result = "wood",
    result_count = 2
  },
  {
    type = "recipe",
    name = "wooden-chest",
    ingredients = {{"wood", 4}},
    result = "wooden-chest",
    requester_paste_multiplier = 4
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
    name = "iron-axe",
    ingredients = {{"iron-stick", 2}, {"iron-plate", 3}},
    result = "iron-axe"
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
      result = "electronic-circuit",
      requester_paste_multiplier = 50
    },
    expensive =
    {
      ingredients =
      {
        {"iron-plate", 2},
        {"copper-cable", 10}
      },
      result = "electronic-circuit",
      requester_paste_multiplier = 50
    },
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
    result_count = 2,
    requester_paste_multiplier = 20
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
    result = "inserter",
    requester_paste_multiplier = 15
  },
  {
    type = "recipe",
    name = "burner-inserter",
    ingredients =
    {
      {"iron-plate", 1},
      {"iron-gear-wheel", 1}
    },
    result = "burner-inserter",
    requester_paste_multiplier = 15
  },
  {
    type = "recipe",
    name = "pipe",
    normal =
    {
      ingredients = {{"iron-plate", 1}},
      result = "pipe",
      requester_paste_multiplier = 15
    },
    expensive =
    {
      ingredients = {{"iron-plate", 2}},
      result = "pipe",
      requester_paste_multiplier = 15
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
      {"wood", 2},
      {"copper-cable", 2}
    },
    result = "small-electric-pole",
    result_count = 2,
    requester_paste_multiplier = 4
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
    result = "radar",
    requester_paste_multiplier = 4
  },
  {
    type = "recipe",
    name = "small-lamp",
    enabled = false,
    ingredients =
    {
      {"electronic-circuit", 1},
      {"iron-stick", 3},
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
  }
}
)
