
data:extend(
{
  {
    type = "fluid",
    name = "water",
    default_temperature = 15,
    max_temperature = 100,
    heat_capacity = "0.2KJ",
    base_color = {r=0, g=0.34, b=0.6},
    flow_color = {r=0.7, g=0.7, b=0.7},
    icon = "__base__/graphics/icons/fluid/water.png",
    icon_size = 64, icon_mipmaps = 4,
    order = "a[fluid]-a[water]"
  },
  {
    type = "fluid",
    name = "steam",
    default_temperature = 15,
    max_temperature = 1000,
    heat_capacity = "0.2KJ",
    icon = "__base__/graphics/icons/fluid/steam.png",
    icon_size = 64, icon_mipmaps = 4,
    base_color = {r=0.5, g=0.5, b=0.5},
    flow_color = {r=1.0, g=1.0, b=1.0},
    order = "a[fluid]-b[steam]",
    gas_temperature = 15,
    auto_barrel = false
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
    icon_size = 64, icon_mipmaps = 4,
    order = "a[fluid]-f[sulfuric-acid]"
  }
})
