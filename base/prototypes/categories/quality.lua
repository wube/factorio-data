data:extend(
{
  {
    type = "quality",
    name = "normal",
    level = 0,
    color = {r = 255 * 0.7, g = 255 * 0.7, b = 255 * 0.7},
    order = "a",
    next_probability = 0.1,
    subgroup = "qualities",
    hidden = true, --hidden in the base game, to not confuse by its existence in the selection gui
    icon = "__base__/graphics/icons/quality-normal.png",
    draw_sprite_by_default = false
  }
}
)
