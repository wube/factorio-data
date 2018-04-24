-- The lua interface changed in many ways, and new version of scripts needs to be loaded.
game.reloadscript()

if game.isdemo() then
  return
end

local forcelist = game.forces
for index, item in pairs(forcelist) do
  local recipes = item.recipes
  recipes["wall"].enable()
  recipes["wall"].reload()
end
