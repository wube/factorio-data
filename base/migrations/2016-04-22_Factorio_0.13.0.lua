game.reload_script()

if game.is_demo() then
  return
end

for index, force in pairs(game.forces) do
  local technologies = force.technologies;
  local recipes = force.recipes;

  if technologies["railway"].researched then
    recipes["rail"].enabled = true
  end

  if technologies["concrete"].researched then
    recipes["hazard-concrete"].enabled = true
  end

  if technologies["logistics-2"].researched then
    recipes["stack-inserter"].enabled = true
    recipes["stack-filter-inserter"].enabled = true
  end
  if technologies["construction-robotics"].researched then
    force.ghost_time_to_live = force.ghost_time_to_live + 60 * 60 * 25
  end
end
