if game.is_demo() then
  return
end

for index, force in pairs(game.forces) do
  local technologies = force.technologies;
  local recipes = force.recipes;

  if technologies["circuit-network"].researched then
    recipes["power-switch"].enabled = true
  end
end
