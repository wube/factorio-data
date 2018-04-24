game.reloadscript()
game.player.force.resetrecipes()
game.player.force.resettechnologies()

if game.isdemo() then
  return
end

local forcelist = game.forces
for index, item in pairs(forcelist) do
  local technologies = item.technologies
  local recipes = item.recipes
  if technologies["logistics-2"].researched then
    recipes["fast-splitter"].enable()
  end
  if technologies["logistics-3"].researched then
    recipes["express-splitter"].enable()
  end
  if technologies["steel-processing"].researched then
    recipes["steel-axe"].enable()
    recipes["steel-chest"].enable()
  end
end
