if game.is_demo() then
  return
end

for k,force in pairs(game.forces) do
  force.rechart()
end
