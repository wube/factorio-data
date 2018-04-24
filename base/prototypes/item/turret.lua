data:extend(
{
  {
    type = "item",
    name = "laser-turret",
    icon = "__base__/graphics/icons/laser-turret.png",
    flags = {"goes-to-quickbar"},
    subgroup = "defensive-structure",
    order = "b[turret]-b[laser-turret]",
    place_result = "laser-turret",
    stack_size = 50
  },
  {
    type = "item",
    name = "flamethrower-turret",
    icon = "__base__/graphics/icons/flamethrower-turret.png",
    flags = {"goes-to-quickbar"},
    subgroup = "defensive-structure",
    order = "b[turret]-c[flamethrower-turret]",
    place_result = "flamethrower-turret",
    stack_size = 50
  },
}
)
