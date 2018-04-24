if game.is_demo() then
  return
end

for index, force in pairs(game.forces) do
  local technologies = force.technologies;
  local recipes = force.recipes;
  
  if technologies["flame-thrower"].researched then
    recipes["flame-thrower"].enabled = true
    recipes["flame-thrower-ammo"].enabled = true
    recipes["flamethrower-turret"].enabled = true
  end
  if technologies["steel-processing"].enabled then
    recipes["steel-chest"].enabled = true
  end
end
