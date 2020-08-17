data:extend(
{
  {
    type = "recipe",
    name = "laser-turret",
    enabled = false,
    energy_required = 20,
    ingredients =
    {
      {"steel-plate", 20},
      {"electronic-circuit", 20},
      {"battery", 12}
    },
    result = "laser-turret"
  },
  {
    type = "recipe",
    name = "flamethrower-turret",
    enabled = false,
    energy_required = 20,
    ingredients =
    {
      {"steel-plate", 30},
      {"iron-gear-wheel", 15},
      {"pipe", 10},
      {"engine-unit", 5}
    },
    result = "flamethrower-turret"
  },
  {
    type = "recipe",
    name = "artillery-turret",
    enabled = false,
    energy_required = 40,
    ingredients =
    {
      {"steel-plate", 60},
      {"concrete", 60},
      {"iron-gear-wheel", 40},
      {"advanced-circuit", 20}
    },
    result = "artillery-turret"
  },
  {
    type = "recipe",
    name = "artillery-targeting-remote",
    enabled = false,
    ingredients =
    {
      {"processing-unit", 1},
      {"radar", 1}
    },
    result = "artillery-targeting-remote"
  }
}
)
