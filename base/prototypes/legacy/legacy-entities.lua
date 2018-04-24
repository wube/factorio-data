data:extend(
{
  {
    type = "rocket-defense",
    name = "rocket-defense-dummy",
    --icon = "__base__/graphics/icons/rocket-defense.png",
    --flags = {"placeable-player", "player-creation"},
    --minable = {hardness = 0.2, mining_time = 0.5, result = "rocket-defense"},
    max_health = 5000,
    --corpse = "big-remnants",
    collision_box = {{-2.4, -2.4}, {2.4, 2.4}},
    -- avoid running some internal tests over this entity
    selection_box = {{0, 0}, {0, 0}},
    energy_source =
    {
      type = "electric",
      buffer_capacity = "100MJ",
      usage_priority = "primary-input"
    }
  }
}
)
