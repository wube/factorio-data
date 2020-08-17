
data:extend(
{
  {
    type = "recipe",
    name = "poison-capsule",
    enabled = false,
    energy_required = 8,
    ingredients =
    {
      {"steel-plate", 3},
      {"electronic-circuit", 3},
      {"coal", 10}
    },
    result = "poison-capsule"
  },
  {
    type = "recipe",
    name = "slowdown-capsule",
    enabled = false,
    energy_required = 8,
    ingredients =
    {
      {"steel-plate", 2},
      {"electronic-circuit", 2},
      {"coal", 5}
    },
    result = "slowdown-capsule"
  },
  {
    type = "recipe",
    name = "cluster-grenade",
    enabled = false,
    energy_required = 8,
    ingredients =
    {
      {"grenade", 7},
      {"explosives", 5},
      {"steel-plate", 5}
    },
    result = "cluster-grenade"
  },
  {
    type = "recipe",
    name = "defender-capsule",
    enabled = false,
    energy_required = 8,
    ingredients =
    {
      {"piercing-rounds-magazine", 3},
      {"electronic-circuit", 3},
      {"iron-gear-wheel", 3}
    },
    result = "defender-capsule"
  },
  {
    type = "recipe",
    name = "distractor-capsule",
    enabled = false,
    energy_required = 15,
    ingredients =
    {
      {"defender-capsule", 4},
      {"advanced-circuit", 3}
    },
    result = "distractor-capsule"
  },
  {
    type = "recipe",
    name = "destroyer-capsule",
    enabled = false,
    energy_required = 15,
    ingredients =
    {
      {"distractor-capsule", 4},
      {"speed-module", 1}
    },
    result = "destroyer-capsule"
  },
  {
    type = "recipe",
    name = "cliff-explosives",
    enabled = false,
    energy_required = 8,
    ingredients =
    {
      {"explosives", 10},
      {"grenade", 1},
      {"empty-barrel", 1}
    },
    result = "cliff-explosives"
  }
})
