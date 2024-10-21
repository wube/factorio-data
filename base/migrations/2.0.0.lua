-- This is to migrate the technology unlocks, the new trigger unlocks and new prerequisites

local function is_any_successor_researched(technology)
  if technology then
    for k, technology in pairs(technology.successors) do
      if technology.researched then
        return true
      end
    end
  end
  return false
end

local function set_researched_safe(technology)
  if technology then
    technology.researched = true
  end
end

local migrate_force = function(force)
  local technologies = force.technologies

  -- trigger technologies; these are critical, so we want to migrate them
  if is_any_successor_researched(technologies["automation-science-pack"]) then
    set_researched_safe(technologies["automation-science-pack"])
    set_researched_safe(technologies["electronics"])
    set_researched_safe(technologies["steam-power"])
  end
  if is_any_successor_researched(technologies["uranium-mining"]) then
    set_researched_safe(technologies["uranium-mining"])
  end
  if is_any_successor_researched(technologies["oil-gathering"]) then
    set_researched_safe(technologies["oil-gathering"])
  end
end

for k, force in pairs(game.forces) do
  migrate_force(force)
end
