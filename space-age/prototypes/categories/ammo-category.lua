require ("bonus-gui-ordering")

data:extend(
{
  {
    type = "ammo-category",
    name = "railgun",
    icon = "__space-age__/graphics/icons/ammo-category/railgun.png",
    subgroup = "ammo-category"
  },
  {
    type = "ammo-category",
    name = "tesla",
    icon = "__space-age__/graphics/icons/ammo-category/tesla.png",
    subgroup = "ammo-category"
  },
  {
    type = "ammo-category",
    name = "seismic",
    hidden =  true
  }
}
)

for k,v in pairs(data.raw["ammo-category"]) do
  if not v.bonus_gui_order then
    v.bonus_gui_order = bonus_gui_ordering[k]
  end
end
