local meld = require("__core__.lualib.meld")

local rail_planner_with_elevated_rails_update =
{
  rails = meld.append({
    "rail-ramp",
    "elevated-straight-rail",
    "elevated-curved-rail-a",
    "elevated-curved-rail-b",
    "elevated-half-diagonal-rail"
  }),
  support = "rail-support"
}

for _, prototype in pairs(data.raw["rail-planner"]) do
  meld(prototype, rail_planner_with_elevated_rails_update)
end

require("__elevated-rails__.prototypes.sloped-trains-updates").apply_all_base()
