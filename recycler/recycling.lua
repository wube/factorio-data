local util = require("util")

local function get_prototype(base_type, name)
  for type_name in pairs(defines.prototypes[base_type]) do
    local prototypes = data.raw[type_name]
    if prototypes and prototypes[name] then
      return prototypes[name]
    end
  end
end

local function get_item_localised_name(name)
  local item = get_prototype("item", name)
  if not item then return end
  if item.localised_name then
    return item.localised_name
  end
  local prototype
  local type_name = "item"
  if item.place_result then
    prototype = get_prototype("entity", item.place_result)
    type_name = "entity"
  elseif item.place_as_equipment_result then
    prototype = get_prototype("equipment", item.place_as_equipment_result)
    type_name = "equipment"
  elseif item.place_as_tile then
    -- Tiles with variations don't have a localised name
    local tile_prototype = data.raw.tile[item.place_as_tile.result]
    if tile_prototype and tile_prototype.localised_name then
      prototype = tile_prototype
      type_name = "tile"
    end
  end
  return prototype and prototype.localised_name or {type_name.."-name."..name}
end

function generate_recycling_recipe_icons_from_item(item)
  local icons = {}
  if item.icons == nil then
    icons =
    {
      {
        icon = "__recycler__/graphics/icons/recycling.png"
      },
      {
        icon = item.icon,
        icon_size = item.icon_size,
        scale = (0.5 * defines.constant.default_icon_size / (item.icon_size or defines.constant.default_icon_size)) * 0.8,
      },
      {
        icon = "__recycler__/graphics/icons/recycling-top.png"
      },
    }
  else
    icons =
    {
      {
        icon = "__recycler__/graphics/icons/recycling.png"
      }
    }
    for i = 1, #item.icons do
      local icon = table.deepcopy(item.icons[i]) -- we are gonna change the scale, so must copy the table
      icon.scale = ((icon.scale == nil) and (0.5 * defines.constant.default_icon_size / (icon.icon_size or defines.constant.default_icon_size)) or icon.scale) * 0.8
      icon.shift = util.mul_shift(icon.shift, 0.8)
      icons[#icons + 1] = icon
    end
    icons[#icons + 1] =
    {
      icon = "__recycler__/graphics/icons/recycling-top.png"
    }
  end
  return icons
end

function add_recipe_values(structure, input, result)
  local recipe_to_reverse = input.recycle_to_ingredients_of and data.raw.recipe[input.recycle_to_ingredients_of] or input

  local result_count
  local input_result = nil
  for k,v in pairs(util.normalize_recipe_products(input)) do
    if v.type == "item" then
      if input_result then return end -- more than one result item
      if v.amount_min == v.amount_max then
        input_result = v.name
        result_count = v.amount_min
      end
    end
  end

  if not input_result then return end

  if not result_count then
    error("Recycling recipe "..input.name.." has no result count.")
  end

  local result_item = get_prototype("item", input_result)
  if not result_item then return end
  if not recipe_to_reverse.ingredients then return end

  structure.results = {}
  structure.ingredients = {{type = "item", name = input_result, amount = 1}}

  local multiplier = result_count
  structure.energy_required = (recipe_to_reverse.energy_required or 0.5) / 16

  local result_crafting_tint = {primary = {0.5,0.5,0.5,0.5}, secondary = {0.5,0.5,0.5,0.5}, tertiary = {0.5,0.5,0.5,0.5}, quaternary = {0.5,0.5,0.5,0.5}}

  for k, ingredient in pairs(recipe_to_reverse.ingredients) do
    if type(ingredient) ~= "table" then
      error("Recipe "..recipe_to_reverse.name.." has malformed ingredients: it should only contain tables (one per ingredient) but "..type(ingredient).." was found")
    end

    if ingredient.type == "item" then
      local final_name = ingredient[1] or ingredient.name
      local final_amount = ingredient[2] or ingredient.amount
      local final_probability = 4 * multiplier * (ingredient.result_count or 1)

      local remainder = final_amount % final_probability
      final_amount = math.floor(final_amount / final_probability)
      local final_extra_fraction = remainder / final_probability

      table.insert(structure.results, {type = "item", name = final_name, amount = final_amount, extra_count_fraction = final_extra_fraction})

    elseif ingredient.type == "fluid" then
      local fluid = data.raw.fluid[ingredient.name]
      if not fluid then
        error("Recipe "..recipe_to_reverse.name.." has malformed ingredients: ingredient fluid '"..ingredient.name.."' does not exist")
      end

      local flow_color = fluid.flow_color
      local normalized_flow_color = {(flow_color[1] or flow_color.r or 0), (flow_color[2] or flow_color.g or 0), (flow_color[3] or flow_color.b or 0)}
      if normalized_flow_color[1] > 1 or normalized_flow_color[2] > 1 or normalized_flow_color[3] > 1 then
        normalized_flow_color[1] = normalized_flow_color[1] / 255
        normalized_flow_color[2] = normalized_flow_color[2] / 255
        normalized_flow_color[3] = normalized_flow_color[3] / 255
      end
      result_crafting_tint.tertiary =
      {
        normalized_flow_color[1] + ((1 - normalized_flow_color[1])*0.5),
        normalized_flow_color[2] + ((1 - normalized_flow_color[2])*0.5),
        normalized_flow_color[3] + ((1 - normalized_flow_color[3])*0.5)
      }
      result_crafting_tint.quaternary = fluid.base_color
    end
  end

  structure.hidden = true
  structure.allow_decomposition = false
  structure.unlock_results = false

  result.name = input_result .. "-recycling"
  result.localised_name = {"recipe-name.recycling", get_item_localised_name(input_result)}
  result.icon = nil
  result.icons = generate_recycling_recipe_icons_from_item(result_item)
  result.crafting_machine_tint = result_crafting_tint

  return next(structure.results)
end

local default_can_recycle = function(recipe)
  if recipe.categories ~= nil then
    for _,category in pairs(recipe.categories) do
      if category == "recycling" then
        return
      end
    end
  end

  -- Allow recipes to opt-out
  if recipe.auto_recycle == false then return end

  if string.find(recipe.name, "science") and string.find(recipe.name, "pack") then return end

  return true
end

local get_effects = function()
  if data.raw.technology and data.raw.technology.recycling then
    return data.raw.technology.recycling.effects
  end

  return nil
end

local effects = get_effects()
local add_recipe_unlock = function(recipe)
  if not effects then
    recipe.enabled = true
    return
  end
  table.insert(effects, { type = "unlock-recipe", recipe = recipe.name, hidden = true })
end

local recipes = data.raw.recipe
local generate_recycling_recipe = function(recipe, can_recycle)
  local can_recycle = can_recycle or default_can_recycle
  if not can_recycle(recipe) then return end

  local recipe_subgroup = recipe.subgroup
  if not recipe_subgroup then
    for subtype,_ in pairs(defines.prototypes.item) do
      local subtype = data.raw[subtype]
      if recipe.main_product and subtype then
        local original_recipe = subtype[recipe.main_product]
        if original_recipe then
          recipe_subgroup = original_recipe.subgroup
          break
        end
      end
    end
  end
  local result =
  {
    type = "recipe",
    subgroup = recipe_subgroup,
    categories = {"recycling"},
    enabled = false
  }

  if recipe.result or recipe.results then
    if not add_recipe_values(result, recipe, result) then return end
  end

  if result.name then
    add_recipe_unlock(result)
    recipes[result.name] = result
  end
end

local function generate_self_recycling_recipe(item)
  local icons = generate_recycling_recipe_icons_from_item(item)
  local default_machine_tints = {primary = {0.125,0.125,0.125,0.125}, secondary = {0.125,0.125,0.125,0.125}, tertiary = {0.125,0.125,0.125,0.125}, quaternary = {0.125,0.125,0.125,0.125}}
  local crafting_machine_tint = data.raw.recipe[item.name] and data.raw.recipe[item.name].crafting_machine_tint or default_machine_tints
  local recipe =
  {
    type = "recipe",
    name = item.name .. "-recycling",
    localised_name = {"recipe-name.recycling", get_item_localised_name(item.name)},
    icon = nil,
    icons = icons,
    subgroup = item.subgroup,
    categories = {"recycling"},
    hidden = true,
    enabled = false,
    unlock_results = false,
    ingredients = {{type = "item", name = item.name, amount = 1, ignored_by_stats = 1}},
    results = {{type = "item", name = item.name, amount = 1, independent_probability = 0.25, ignored_by_stats = 1}}, -- Will show as consumed when item is destroyed
    energy_required = (data.raw.recipe[item.name] and data.raw.recipe[item.name].energy_required or 0.5 )/16,
    crafting_machine_tint = crafting_machine_tint
  }
  add_recipe_unlock(recipe)
  data:extend({recipe})
end

local lib = {}

lib.generate_recycling_recipe = generate_recycling_recipe
lib.generate_self_recycling_recipe = generate_self_recycling_recipe

return lib
