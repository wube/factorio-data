for k, force in pairs(game.forces) do

  local name = "mining-productivity-"
  local techs = force.technologies

  local level = math.floor(force.mining_drill_productivity_bonus / 0.1)
  for i = 1, 4 do
    local tech = techs[name..i]
    if tech then
      tech.researched = (i <= level)
    end
  end

  local infinite = techs["mining-productivity-4"]
  if infinite and level > 4 then
    infinite.level = level + 1
  end

  force.reset_technology_effects()
end
