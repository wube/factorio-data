
data:extend(
{
  {
    type = "fluid",
    name = "crude-oil",
    default_temperature = 25,
    heat_capacity = "1KJ",
    base_color = {r=0, g=0, b=0},
    flow_color = {r=0.5, g=0.5, b=0.5},
    max_temperature = 100,
    icon = "__base__/graphics/icons/fluid/crude-oil.png",
    pressure_to_speed_ratio = 0.4,
    flow_to_energy_ratio = 0.59,
    order = "a[fluid]-b[crude-oil]"
  },

  {
    type = "fluid",
    name = "heavy-oil",
    default_temperature = 25,
    heat_capacity = "1KJ",
    base_color = {r=0, g=0.7, b=0.7},
    flow_color = {r=0.5, g=0.5, b=0.5},
    max_temperature = 100,
    icon = "__base__/graphics/icons/fluid/heavy-oil.png",
    pressure_to_speed_ratio = 0.4,
    flow_to_energy_ratio = 0.59,
    order = "a[fluid]-c[heavy-oil]"
  },

  {
    type = "fluid",
    name = "light-oil",
    default_temperature = 25,
    heat_capacity = "1KJ",
    base_color = {r=0.3, g=0.3, b=0},
    flow_color = {r=0.9, g=0.9, b=0.9},
    max_temperature = 100,
    icon = "__base__/graphics/icons/fluid/light-oil.png",
    pressure_to_speed_ratio = 0.4,
    flow_to_energy_ratio = 0.59,
    order = "a[fluid]-d[light-oil]"
  },

  {
    type = "fluid",
    name = "petroleum-gas",
    default_temperature = 25,
    heat_capacity = "1KJ",
    base_color = {r=0.4, g=0, b=0.4},
    flow_color = {r=0.5, g=0.5, b=0.5},
    max_temperature = 100,
    icon = "__base__/graphics/icons/fluid/petroleum-gas.png",
    pressure_to_speed_ratio = 0.4,
    flow_to_energy_ratio = 0.59,
    order = "a[fluid]-e[petroleum-gas]"
  },

  {
    type = "fluid",
    name = "lubricant",
    default_temperature = 25,
    heat_capacity = "1KJ",
    base_color = {r=0.4, g=0.6, b=0.4},
    flow_color = {r=0.5, g=0.5, b=0.5},
    max_temperature = 100,
    icon = "__base__/graphics/icons/fluid/lubricant.png",
    pressure_to_speed_ratio = 0.4,
    flow_to_energy_ratio = 0.59,
    order = "e[lubricant]"
  },

  {
    type = "fluid",
    name = "sulfuric-acid",
    default_temperature = 25,
    heat_capacity = "1KJ",
    base_color = {r=0, g=0.7, b=0.2},
    flow_color = {r=0.5, g=0.5, b=0.5},
    max_temperature = 100,
    icon = "__base__/graphics/icons/fluid/sulfuric-acid.png",
    pressure_to_speed_ratio = 0.4,
    flow_to_energy_ratio = 0.59,
    order = "a[fluid]-f[sulfuric-acid]"
  }
})
