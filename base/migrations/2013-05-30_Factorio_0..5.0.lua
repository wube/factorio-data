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
    recipes["fast-splitter"].enabled = true
  end
  if technologies["logistics-3"].researched then
    recipes["express-splitter"].enabled = true
  end
  if technologies["steel-processing"].researched then
    recipes["steel-axe"].enabled = true
    recipes["steel-chest"].enabled = true
  end
end
