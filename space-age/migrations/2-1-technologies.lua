-- This is to migrate the technology unlocks:
-- solar system edge was split from promethium science

local function is_technology_researched_safe(technology)
  return technology and technology.researched
end

local function set_researched_safe(technology)
  if technology then
    technology.researched = true
  end
end

local migrate_force = function(force)
  local technologies = force.technologies

  if is_technology_researched_safe(technologies["promethium-science-pack"]) then
    set_researched_safe(technologies["stellar-discovery-solar-system-edge"])
  end
end

for k, force in pairs(game.forces) do
  migrate_force(force)
end
