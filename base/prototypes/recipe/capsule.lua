
data:extend(
{
  {
    type = "recipe",
    name = "poison-capsule",
    enabled = "false",
    energy_required = 15,
    ingredients =
    {
      {"steel-plate", 3},
      {"electronic-circuit", 3},
      {"coal", 10},
    },
    result = "poison-capsule"
  },
  {
    type = "recipe",
    name = "slowdown-capsule",
    enabled = "false",
    energy_required = 15,
    ingredients =
    {
      {"steel-plate", 3},
      {"electronic-circuit", 3},
      {"coal", 10},
    },
    result = "slowdown-capsule"
  },
  {
    type = "recipe",
    name = "basic-grenade",
    enabled = "false",
    energy_required = 15,
    ingredients =
    {
      {"iron-plate", 5},
      {"coal", 10},
    },
    result = "basic-grenade"
  },
  {
    type = "recipe",
    name = "small-combat-robot-capsule",
    enabled = "false",
    energy_required = 15,
    ingredients =
    {
      {"steel-plate", 3},
      {"advanced-circuit", 2},
      {"iron-gear-wheel", 5},
    },
    result = "small-combat-robot-capsule"
  },
  {
    type = "recipe",
    name = "big-combat-robot-capsule",
    enabled = "false",
    energy_required = 30,
    ingredients =
    {
      {"small-combat-robot-capsule", 4},
      {"advanced-circuit", 3},
    },
    result = "big-combat-robot-capsule"
  },
  {
    type = "recipe",
    name = "basic-electric-discharge-defense-remote",
    enabled = "false",
    energy_required = 1,
    ingredients =
    {
      {"electronic-circuit", 1}
    },
    result = "basic-electric-discharge-defense-remote"
  }
})
