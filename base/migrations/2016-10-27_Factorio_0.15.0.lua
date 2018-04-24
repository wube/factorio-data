if game.is_demo() then
  return
end

for index, force in pairs(game.forces) do
  local technologies = force.technologies;
  local recipes = force.recipes;
  
  if technologies["military-2"].researched then
    recipes["military-science-pack"].enabled = true
    recipes["piercing-rounds-magazine"].enabled = true
    recipes["grenade"].enabled = true
  end
  if technologies["advanced-material-processing-2"].enabled then
    recipes["electric-furnace"].enabled = true
    recipes["production-science-pack"].enabled = true
  end
  if technologies["advanced-electronics-2"].enabled then
    recipes["processing-unit"].enabled = true
    recipes["high-tech-science-pack"].enabled = true
  end
end 