local control_name = "enemy-base"

local function enemy_autoplace(params)
  return
  {
    control = params.control or control_name,
    order = params.order or "b[enemy]-misc",
    force = "enemy",
    probability_expression = params.probability_expression,
    richness_expression = 1
  }
end

local function enemy_spawner_autoplace(probability_expression)
  return enemy_autoplace{
    probability_expression = probability_expression,
    order = "b[enemy]-a[spawner]"
  }
end

local function enemy_worm_autoplace(probability_expression)
  return enemy_autoplace{
    probability_expression = "(" .. probability_expression .. ") * (1 - no_enemies_mode)",
    order = "b[enemy]-b[worm]",
  }
end

return
{
  control_name = control_name,
  enemy_autoplace = enemy_autoplace,
  enemy_spawner_autoplace = enemy_spawner_autoplace,
  enemy_worm_autoplace = enemy_worm_autoplace
}
