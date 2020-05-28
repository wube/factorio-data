for k, force in pairs(game.forces) do
  local techs = force.technologies
  local tech3 = techs["mining-productivity-3"]
  local tech4 = techs["mining-productivity-4"]

  if tech3 and tech3.researched == false and tech4 then
    tech4.researched = false
  end
end
