if game.is_demo() then
  return
end

for index, force in pairs(game.forces) do
  local technologies = force.technologies;

  for i=1,6 do
    if technologies["character-logistic-slots-" .. tostring(i)].researched then
      force.character_logistic_slot_count = force.character_logistic_slot_count + 1
    end
  end

  for i=1,2 do
    if technologies["character-logistic-trash-slots-" .. tostring(i)].researched then
      force.character_trash_slot_count = force.character_trash_slot_count + 1
    end
  end
end
