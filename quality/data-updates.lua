local recycling = require("prototypes.recycling")

-- Generating the recycle (reverse) recipes
for name, recipe in pairs(data.raw.recipe) do
  recycling.generate_recycling_recipe(recipe)
end

local generate_self_recycling_recipe = function(item)
  if item.auto_recycle == false then return end

  if not data.raw.recipe[item.name .. "-recycling"] then
    if not string.find(item.name, "-barrel") then
      recycling.generate_self_recycling_recipe(item)
    end
  end
end

for type_name in pairs(defines.prototypes.item) do
  if data.raw[type_name] then
    for k, item in pairs(data.raw[type_name]) do
      generate_self_recycling_recipe(item)
    end
  end
end

data.raw.quality.normal.hidden = false
