data:extend(
{
  {
    type = "item",
    name = "flamethrower-turret",
    icon = "__base__/graphics/icons/flamethrower-turret.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "defensive-structure",
    order = "b[turret]-c[flamethrower-turret]",
    place_result = "flamethrower-turret",
    stack_size = 50
  },
  {
    type = "item",
    name = "artillery-turret",
    icon = "__base__/graphics/icons/artillery-turret.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "defensive-structure",
    order = "b[turret]-d[artillery-turret]-a[turret]",
    place_result = "artillery-turret",
    stack_size = 10
  },
  {
    type = "capsule",
    name = "artillery-targeting-remote",
    icon = "__base__/graphics/icons/artillery-targeting-remote.png",
    icon_size = 64, icon_mipmaps = 4,
    capsule_action =
    {
      type = "artillery-remote",
      flare = "artillery-flare"
    },
    subgroup = "defensive-structure",
    order = "b[turret]-d[artillery-turret]-b[remote]",
    stack_size = 1
  },
}
)
