function create_fluid_parameter(number)
  data:extend(
  {
    {
      type = "fluid",
      name = "parameter-" .. number,
      subgroup = "parameters",
      localised_name = {"parameter-x", tostring(number)},
      parameter = true,
      auto_barrel = false,
      default_temperature = 25,
      base_color = {1, 1, 0},
      flow_color = {1, 1, 0},
      icon = "__base__/graphics/icons/parameter/parameter-" .. number .. ".png",
      order = "a"
    }
  })
end

for n = 0, 9 do
  create_fluid_parameter(n)
end

data:extend(
{
  {
    type = "fluid",
    name = "water",
    subgroup = "fluid",
    default_temperature = 15,
    max_temperature = 100,
    heat_capacity = "2kJ",
    base_color = {0, 0.34, 0.6},
    flow_color = {0.7, 0.7, 0.7},
    icon = "__base__/graphics/icons/fluid/water.png",
    order = "a[fluid]-a[water]-a[water]"
  },
  {
    type = "fluid",
    name = "steam",
    subgroup = "fluid",
    default_temperature = 15,
    max_temperature = 5000,
    heat_capacity = "0.2kJ",
    icon = "__base__/graphics/icons/fluid/steam.png",
    base_color = {0.5, 0.5, 0.5},
    flow_color = {1.0, 1.0, 1.0},
    order = "a[fluid]-a[water]-b[steam]",
    gas_temperature = 15,
    auto_barrel = false
  },
  {
    type = "fluid",
    name = "sulfuric-acid",
    subgroup = "fluid",
    default_temperature = 25,
    base_color = {0.75, 0.65, 0.1},
    flow_color = {0.7, 1, 0.1},
    icon = "__base__/graphics/icons/fluid/sulfuric-acid.png",
    order = "a[fluid]-b[oil]-f[sulfuric-acid]"
  },
  {
    type = "fluid",
    name = "crude-oil",
    subgroup = "fluid",
    default_temperature = 25,
    base_color = {0, 0, 0},
    flow_color = {0.5, 0.5, 0.5},
    icon = "__base__/graphics/icons/fluid/crude-oil.png",
    order = "a[fluid]-b[oil]-a[crude-oil]"
  },

  {
    type = "fluid",
    name = "heavy-oil",
    subgroup = "fluid",
    default_temperature = 25,
    base_color = {0.5, 0.13, 0},
    flow_color = {0.85, 0.6, 0.3},
    icon = "__base__/graphics/icons/fluid/heavy-oil.png",
    order = "a[fluid]-b[oil]-d[heavy-oil]"
  },

  {
    type = "fluid",
    name = "light-oil",
    subgroup = "fluid",
    default_temperature = 25,
    base_color = {0.57, 0.33, 0},
    flow_color = {1, 0.73, 0.07},
    icon = "__base__/graphics/icons/fluid/light-oil.png",
    order = "a[fluid]-b[oil]-c[light-oil]"
  },

  {
    type = "fluid",
    name = "petroleum-gas",
    subgroup = "fluid",
    default_temperature = 25,
    base_color = {0.3, 0.1, 0.3},
    flow_color = {0.8, 0.8, 0.8},
    icon = "__base__/graphics/icons/fluid/petroleum-gas.png",
    order = "a[fluid]-b[oil]-b[petroleum-gas]"
  },

  {
    type = "fluid",
    name = "lubricant",
    subgroup = "fluid",
    default_temperature = 25,
    base_color = {0.15, 0.32, 0.03},
    flow_color = {0.43, 0.75, 0.31},
    icon = "__base__/graphics/icons/fluid/lubricant.png",
    order = "a[fluid]-b[oil]-e[lubricant]"
  }
})
