require ("bonus-gui-ordering")

data:extend(
{
  {
    type = "ammo-category",
    name = "bullet",
    icon = "__base__/graphics/icons/ammo-category/bullet.png",
    subgroup = "ammo-category"
  },
  {
    type = "ammo-category",
    name = "rocket",
    icon = "__base__/graphics/icons/ammo-category/rocket.png",
    subgroup = "ammo-category"
  },
  {
    type = "ammo-category",
    name = "laser",
    icon = "__base__/graphics/icons/ammo-category/laser.png",
    subgroup = "ammo-category"
  },
  {
    type = "ammo-category",
    name = "electric",
    icon = "__base__/graphics/icons/ammo-category/electric.png",
    subgroup = "ammo-category"
  },
  {
    type = "ammo-category",
    name = "flamethrower",
    icon = "__base__/graphics/icons/ammo-category/flamethrower.png",
    subgroup = "ammo-category"
  },
  {
    type = "ammo-category",
    name = "shotgun-shell",
    icon = "__base__/graphics/icons/ammo-category/shotgun-shell.png",
    subgroup = "ammo-category"
  },
  {
    type = "ammo-category",
    name = "capsule",
    icon = "__base__/graphics/icons/ammo-category/capsule.png",
    subgroup = "ammo-category",
    hidden = true
  },
  {
    type = "ammo-category",
    name = "grenade",
    icon = "__base__/graphics/icons/ammo-category/grenade.png",
    subgroup = "ammo-category"
  },
  {
    type = "ammo-category",
    name = "melee",
    hidden = true
  },
  {
    type = "ammo-category",
    name = "biological",
    hidden = true
  },
  {
    type = "ammo-category",
    name = "cannon-shell",
    icon = "__base__/graphics/icons/ammo-category/cannon-shell.png",
    subgroup = "ammo-category"
  },
  {
    type = "ammo-category",
    name = "artillery-shell",
    icon = "__base__/graphics/icons/ammo-category/artillery-shell.png",
    subgroup = "ammo-category"
  },
  {
    type = "ammo-category",
    name = "beam",
    icon = "__base__/graphics/icons/ammo-category/beam.png",
    subgroup = "ammo-category"
  },
  {
    type = "ammo-category",
    name = "landmine",
    icon = "__base__/graphics/icons/ammo-category/land-mine.png",
    subgroup = "ammo-category"
  }
}
)

for k,v in pairs(data.raw["ammo-category"]) do
  if not v.bonus_gui_order then
    v.bonus_gui_order = bonus_gui_ordering[k]
  end
end
