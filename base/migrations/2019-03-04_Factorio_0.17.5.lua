for _, force in pairs(game.forces) do
  local level = math.floor(force.mining_drill_productivity_bonus * 10)
  for i=1, math.min(level, 4) do
    if force.technologies["mining-productivity-" .. i] then
      force.technologies["mining-productivity-" .. i].researched = true
    end
  end
  if level > 4 and force.technologies["mining-productivity-4"] then
    force.technologies["mining-productivity-4"].level = level + 1
  end
  force.reset_technology_effects()
end
