
data:extend(
{
  {
    type = "fluid",
    name = "crude-oil",
    default_temperature = 25,
    heat_capacity = "0.1KJ",
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
    heat_capacity = "0.1KJ",
    base_color = {r=0.5, g=0.04, b=0},
    flow_color = {r=0.85, g=0.6, b=0.3},
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
    heat_capacity = "0.1KJ",
    base_color = {r=0.57, g=0.33, b=0},
	flow_color = {r=1, g=0.73, b=0.07},
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
    heat_capacity = "0.1KJ",
    base_color = {r=0.3, g=0.1, b=0.3},
    flow_color = {r=0.8, g=0.8, b=0.8},
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
    heat_capacity = "0.1KJ",
    base_color = {r=0.15, g=0.32, b=0.03},
    flow_color = {r=0.43, g=0.75, b=0.31},
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
    heat_capacity = "0.1KJ",
    base_color = {r=0.75, g=0.65, b=0.1},
    flow_color = {r=0.7, g=1, b=0.1},
    max_temperature = 100,
    icon = "__base__/graphics/icons/fluid/sulfuric-acid.png",
    pressure_to_speed_ratio = 0.4,
    flow_to_energy_ratio = 0.59,
    order = "a[fluid]-f[sulfuric-acid]"
  }
})

