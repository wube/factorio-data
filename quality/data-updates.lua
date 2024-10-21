local recycling = require("prototypes.recycling")

-- Generating the recycle (reverse) recipes
for name, recipe in pairs(data.raw.recipe) do
  recycling.generate_recycling_recipe(recipe)
  recipe.auto_recycle = nil
end

for type_name in pairs(defines.prototypes.item) do
  if data.raw[type_name] then
    for k, item in pairs(data.raw[type_name]) do
      if not data.raw.recipe[item.name .. "-recycling"] then
        if not string.find(item.name, "-barrel") then
          recycling.generate_self_recycling_recipe(item)
        end
      end
    end
  end
end

data.raw.quality.normal.hidden = false
