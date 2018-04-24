if game.isdemo() then
  return
end

for index, force in pairs(game.forces) do
  force.resetrecipes()
end
