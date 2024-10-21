-- Define default icons for space connections.
for name, prototype in pairs(data.raw["space-connection"]) do
  local from = data.raw["space-location"][prototype.from] or data.raw["planet"][prototype.from]
  local to = data.raw["space-location"][prototype.to] or data.raw["planet"][prototype.to]
  if (not prototype.icon) and (not prototype.icons) and from and from.icon and to and to.icon then
    prototype.icons =
    {
      {icon = "__space-age__/graphics/icons/planet-route.png"},
      {icon = from.icon, icon_size = from.icon_size or 64, scale = 0.333 * (64 / (from.icon_size or 64)), shift = {-6, -6}},
      {icon = to.icon, icon_size = to.icon_size or 64, scale = 0.333 * (64 / (to.icon_size or 64)), shift = {6, 6}}
    }
  end
end
