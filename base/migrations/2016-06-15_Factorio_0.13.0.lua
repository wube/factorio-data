if game.is_demo() then
  return
end

for index, force in pairs(game.forces) do
  force.recipes["express-underground-belt"].reload()
end