if game.is_demo() then
  return
end

for index, force in pairs(game.forces) do
  force.reset_recipes()
end
