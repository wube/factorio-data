for k, force in pairs (game.forces) do
  force.reset_technology_effects()
  force.rechart()
end
