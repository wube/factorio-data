require ("bonus-gui-ordering")

data:extend(
{
  {
    type = "ammo-category",
    name = "bullet"
  },
  {
    type = "ammo-category",
    name = "rocket"
  },
  {
    type = "ammo-category",
    name = "combat-robot-laser"
  },
  {
    type = "ammo-category",
    name = "laser-turret"
  },
  {
    type = "ammo-category",
    name = "electric"
  },
  {
    type = "ammo-category",
    name = "flamethrower"
  },
  {
    type = "ammo-category",
    name = "shotgun-shell"
  },
  {
    type = "ammo-category",
    name = "railgun"
  },
  {
    type = "ammo-category",
    name = "capsule"
  },
  {
    type = "ammo-category",
    name = "grenade"
  },
  {
    type = "ammo-category",
    name = "melee"
  },
  {
    type = "ammo-category",
    name = "biological"
  },
  {
    type = "ammo-category",
    name = "cannon-shell"
  },
  {
    type = "ammo-category",
    name = "artillery-shell"
  },
  {
    type = "ammo-category",
    name = "combat-robot-beam"
  },
  {
    type = "ammo-category",
    name = "landmine"
  }
}
)

for k,v in pairs(data.raw["ammo-category"]) do
  if not v.bonus_gui_order then
    v.bonus_gui_order = bonus_gui_ordering[k]
  end
end
