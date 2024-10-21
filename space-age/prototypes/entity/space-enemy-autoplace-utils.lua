local base_enemy_autoplace = require ("__base__.prototypes.entity.enemy-autoplace-utils")

local function gleba_spawner_autoplace(probability_expression, order)
  return base_enemy_autoplace.enemy_autoplace{
    control = "gleba_enemy_base",
    probability_expression = probability_expression,
    order = order or "b[enemy]-c[spawner]",
  }
end

return
{
  gleba_spawner_autoplace = gleba_spawner_autoplace,
}
