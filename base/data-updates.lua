local item_sounds = require("__base__.prototypes.item_sounds")

local function get_item(name)
  for typeName in pairs(defines.prototypes.item) do
    local items = data.raw[typeName]
    if items and items[name] then
      return items[name]
    end
  end
  return
end

-- This auto-generates barrel items and fill/empty recipes for every fluid defined that doesn't have "auto_barrel = false".

-- The technology the barrel unlocks will be added to
local technology_name = "fluid-handling"
-- The base empty barrel item
local empty_barrel_name = "barrel"

-- Item icon masks
local barrel_side_mask = "__base__/graphics/icons/fluid/barreling/barrel-side-mask.png"
local barrel_hoop_top_mask = "__base__/graphics/icons/fluid/barreling/barrel-hoop-top-mask.png"

-- Recipe icon masks
local barrel_empty_icon = "__base__/graphics/icons/fluid/barreling/barrel-empty.png"
local barrel_empty_side_mask = "__base__/graphics/icons/fluid/barreling/barrel-empty-side-mask.png"
local barrel_empty_top_mask = "__base__/graphics/icons/fluid/barreling/barrel-empty-top-mask.png"
local barrel_fill_icon = "__base__/graphics/icons/fluid/barreling/barrel-fill.png"
local barrel_fill_side_mask = "__base__/graphics/icons/fluid/barreling/barrel-fill-side-mask.png"
local barrel_fill_top_mask = "__base__/graphics/icons/fluid/barreling/barrel-fill-top-mask.png"

-- Alpha used for barrel masks
local side_alpha = 0.75
local top_hoop_alpha = 0.75
-- Fluid required per barrel recipe
local fluid_per_barrel = 50
-- Crafting energy per barrel fill recipe
local energy_per_fill = 0.2
-- Crafting energy per barrel empty recipe
local energy_per_empty = 0.2

local function get_technology(name)
  local technologies = data.raw["technology"]
  if technologies then
    return technologies[name]
  end
  return nil
end

local function get_recipes_for_barrel(name)
  local recipes = data.raw["recipe"]
  if recipes then
    return recipes[name], recipes["empty-" .. name]
  end
  return nil
end

local function generate_barrel_icons(fluid, base_icon, side_mask, top_mask)
  return
  {
    {
      icon = base_icon.icon or base_icon,
      icon_size = base_icon.icon_size or defines.default_icon_size,
    },
    {
      icon = side_mask,
      icon_size = defines.default_icon_size, -- these need to be explicit, because of "global" icon_size might be different
      tint = util.get_color_with_alpha(fluid.base_color, side_alpha, true)
    },
    {
      icon = top_mask,
      icon_size = defines.default_icon_size, -- these need to be explicit, because of "global" icon_size might be different
      tint = util.get_color_with_alpha(fluid.flow_color, top_hoop_alpha, true)
    }
  }
end

-- Generates a barrel item with the provided name and fluid definition using the provided empty barrel stack size
local function create_barrel_item(name, fluid, empty_barrel_item)

  local result =
  {
    type = "item",
    name = name,
    localised_name = {"item-name.filled-barrel", fluid.localised_name or {"fluid-name." .. fluid.name}},
    icons = generate_barrel_icons(fluid, empty_barrel_item, barrel_side_mask, barrel_hoop_top_mask),
    icon_size = empty_barrel_item.icon_size or defines.default_icon_size,
    subgroup = "barrel",
    order = fluid.order,
    weight = 10*kg,
    inventory_move_sound = item_sounds.metal_barrel_inventory_move,
    pick_sound = item_sounds.metal_barrel_inventory_pickup,
    drop_sound = item_sounds.metal_barrel_inventory_move,
    stack_size = empty_barrel_item.stack_size,
    factoriopedia_alternative = "barrel"
  }

  if name == "fluoroketone-cold-barrel" then
    result.default_import_location = "aquilo"
  end

  data:extend({result})
  return result
end

local function get_or_create_barrel_item(name, fluid, empty_barrel_item)
  local existing_item = get_item(name)
  if existing_item then
    return existing_item
  end

  return create_barrel_item(name, fluid, empty_barrel_item)
end

local function generate_barrel_recipe_icons(fluid, base_icon, side_mask, top_mask, fluid_icon_shift)
  local icons = generate_barrel_icons(fluid, base_icon, side_mask, top_mask)
  if fluid.icon then
    table.insert(icons,
    {
      icon = fluid.icon,
      icon_size = (fluid.icon_size or defines.default_icon_size),
      scale = 16.0 / (fluid.icon_size or defines.default_icon_size), -- scale = 0.5 * 32 / icon_size simplified
      shift = fluid_icon_shift
    }
    )
  elseif fluid.icons then
    icons = util.combine_icons(icons, fluid.icons, {scale = 0.5, shift = fluid_icon_shift}, fluid.icon_size)
  end

  return icons
end

-- Creates a recipe to fill the provided barrel item with the provided fluid
local function create_fill_barrel_recipe(item, fluid)
  local recipe_name = item.name
  local recipe =
  {
    type = "recipe",
    name = recipe_name,
    localised_name = {"recipe-name.fill-barrel", fluid.localised_name or {"fluid-name." .. fluid.name}},
    category = "crafting-with-fluid",
    energy_required = energy_per_fill,
    subgroup = "fill-barrel",
    order = fluid.order,
    enabled = false,
    icons = generate_barrel_recipe_icons(fluid, barrel_fill_icon, barrel_fill_side_mask, barrel_fill_top_mask, {-8, -8}),
    ingredients =
    {
      {type = "fluid", name = fluid.name, amount = fluid_per_barrel, ignored_by_stats = fluid_per_barrel},
      {type = "item", name = empty_barrel_name, amount = 1, ignored_by_stats = 1}
    },
    results =
    {
      {type = "item", name = item.name, amount = 1, ignored_by_stats = 1}
    },
    allow_quality = false,
    allow_decomposition = false,
    hide_from_player_crafting = true,
    factoriopedia_alternative = "barrel",
    hide_from_signal_gui = false
  }

  data:extend({recipe})
  return recipe
end

-- Creates a recipe to empty the provided full barrel item producing the provided fluid
local function create_empty_barrel_recipe(item, fluid)
  local recipe_name = "empty-" .. item.name
  local recipe =
  {
    type = "recipe",
    name = recipe_name,
    localised_name = {"recipe-name.empty-filled-barrel", fluid.localised_name or {"fluid-name." .. fluid.name}},
    category = "crafting-with-fluid",
    energy_required = energy_per_empty,
    subgroup = "empty-barrel",
    order = fluid.order,
    enabled = false,
    icons = generate_barrel_recipe_icons(fluid, barrel_empty_icon, barrel_empty_side_mask, barrel_empty_top_mask, {7, 8}),
    ingredients =
    {
      {type = "item", name = item.name, amount = 1, ignored_by_stats = 1}
    },
    results =
    {
      {type = "fluid", name = fluid.name, amount = fluid_per_barrel, ignored_by_stats = fluid_per_barrel},
      {type = "item", name = empty_barrel_name, amount = 1, ignored_by_stats = 1}
    },
    allow_quality = false,
    allow_decomposition = false,
    hide_from_player_crafting = true,
    factoriopedia_alternative = "barrel",
    hide_from_signal_gui = false
  }

  data:extend({recipe})
  return recipe
end

local function get_or_create_barrel_recipes(item, fluid)
  local fill_recipe, empty_recipe = get_recipes_for_barrel(item.name)

  if not fill_recipe then
    fill_recipe = create_fill_barrel_recipe(item, fluid)
  end
  if not empty_recipe then
    empty_recipe = create_empty_barrel_recipe(item, fluid)
  end

  return fill_recipe, empty_recipe
end

-- Adds the provided barrel recipe and fill/empty recipes to the technology as recipe unlocks if they don't already exist
local function add_barrel_to_technology(fill_recipe, empty_recipe, technology)
  local unlock_key = "unlock-recipe"
  local effects = technology.effects

  if not effects then
    technology.effects = {}
    effects = technology.effects
  end

  local add_fill_recipe = true
  local add_empty_recipe = true

  for k,v in pairs(effects) do
    if k == unlock_key then
      local recipe = v.recipe
      if recipe == fill_recipe.name then
        add_fill_recipe = false
      elseif recipe == empty_recipe.name then
        add_empty_recipe = false
      end
    end
  end

  if add_fill_recipe then
    table.insert(effects, {type = unlock_key, recipe = fill_recipe.name})
  end
  if add_empty_recipe then
    table.insert(effects, {type = unlock_key, recipe = empty_recipe.name})
  end
end

local function log_barrel_error(string)
  log("Auto barrel generation is disabled: " .. string .. ".")
end

local function can_process_fluids(fluids, technology, empty_barrel_item)

  if not fluids then
    log_barrel_error("there are no fluids")
    return
  end

  if not technology then
    log_barrel_error("the " .. technology_name .. " technology doesn't exist")
    return
  end

  if not empty_barrel_item then
    log_barrel_error("the " .. empty_barrel_name .. " item doesn't exist")
    return
  end

  if not empty_barrel_item.icon then
    log_barrel_error("the " .. empty_barrel_name .. " item singular-icon definition doesn't exist")
    return
  end

  return true
end

local function process_fluid(fluid, technology, empty_barrel_item)

  -- Allow fluids to opt-out
  if fluid.auto_barrel == false then return end

  if not (fluid.icon or fluid.icons) then
    log("Can't make barrel recipe for "..fluid.name..", it doesn't have any icon or icons.")
    return
  end

  local barrel_name = fluid.name .. "-barrel"

  -- check if a barrel already exists for this fluid if not - create one
  local barrel_item = get_or_create_barrel_item(barrel_name, fluid, empty_barrel_item)

  -- check if the barrel has a recipe if not - create one
  local barrel_fill_recipe, barrel_empty_recipe = get_or_create_barrel_recipes(barrel_item, fluid)

  -- check if the barrel recipe exists in the unlock list of the technology if not - add it
  add_barrel_to_technology(barrel_fill_recipe, barrel_empty_recipe, technology)

end

local function process_fluids(fluids, technology, empty_barrel_item)

  if not can_process_fluids(fluids, technology, empty_barrel_item) then return end

  for name, fluid in pairs(fluids) do
    process_fluid(fluid, technology, empty_barrel_item)
  end

end

process_fluids(data.raw["fluid"], get_technology(technology_name), get_item(empty_barrel_name))
