if game.is_demo() then
  return
end

for index, force in pairs(game.forces) do
  local technologies = force.technologies;
  local recipes = force.recipes;

  if technologies["inserter-capacity-bonus-4"].researched then
    if force.inserter_stack_size_bonus <= 4 then
      force.inserter_stack_size_bonus = 1
    end
    force.stack_inserter_capacity_bonus = 5
  elseif technologies["inserter-capacity-bonus-3"].researched then
    if force.inserter_stack_size_bonus <= 3 then
      force.inserter_stack_size_bonus = 1
    end
    force.stack_inserter_capacity_bonus = 4
  elseif technologies["inserter-capacity-bonus-2"].researched then
    if force.inserter_stack_size_bonus <= 2 then
      force.inserter_stack_size_bonus = 1
    end
    force.stack_inserter_capacity_bonus = 3
  elseif technologies["inserter-capacity-bonus-1"].researched then
    if force.inserter_stack_size_bonus <= 1 then
      force.inserter_stack_size_bonus = 0
    end
    force.stack_inserter_capacity_bonus = 2
  end

  recipes["stack-inserter"].reload()
end
