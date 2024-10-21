local default_autoplace_set_name = "default"

local function get_patch_metaset_patch_set_index(patch_metaset, patch_set_name)
  if patch_metaset.patch_set_indexes[patch_set_name] == nil then
    patch_metaset.patch_set_indexes[patch_set_name] = patch_metaset.next_patch_set_index
    patch_metaset.next_patch_set_index = patch_metaset.next_patch_set_index + 1
    data.raw["noise-expression"][patch_metaset.count_expression_name].expression = patch_metaset.next_patch_set_index
  end
  return patch_metaset.patch_set_indexes[patch_set_name]
end

local function new_patch_metaset(params)
  data.raw["noise-expression"][params.count_expression_name] =
  {
    type = "noise-expression",
    name = params.count_expression_name,
    expression = 0
  }

  return
  {
    autoplace_set_name = params.autoplace_set_name or default_autoplace_set_name,
    count_expression_name = params.count_expression_name,
    next_patch_set_index = 0,
    patch_set_indexes = {},
    get_patch_set_index = get_patch_metaset_patch_set_index
  }
end

-- Indicate that a patch set exists and optionally that it also needs a separate starting patch set.
-- Call this to initialize patch sets' indexes in a more deterministic order
-- (see resources.lua for an example) before calling resource_autoplace_settings.
local function initialize_patch_set(patch_set_name, has_starting_area_placement, autoplace_set_name)
  autoplace_set_name = autoplace_set_name or default_autoplace_set_name
  local autoplace_set = get_autoplace_set(autoplace_set_name)
  autoplace_set.regular:get_patch_set_index(patch_set_name)
  if has_starting_area_placement then
    autoplace_set.starting:get_patch_set_index(patch_set_name)
  end
end

-- global
autoplace_sets = autoplace_sets or {}
function get_autoplace_set(autoplace_set_name)
  autoplace_set_name = autoplace_set_name or default_autoplace_set_name
  if not autoplace_sets[autoplace_set_name] then
    autoplace_sets[autoplace_set_name] = {
      regular = new_patch_metaset{ autoplace_set_name = autoplace_set_name, count_expression_name = autoplace_set_name .. "_regular_resource_patch_set_count" },
      starting = new_patch_metaset{ autoplace_set_name = autoplace_set_name, count_expression_name = autoplace_set_name .. "_starting_resource_patch_set_count" }
    }
  end
  return autoplace_sets[autoplace_set_name]
end

--- Creates and returns an AutoplaceSpecification that will generate spot-based ore patches.
-- Required parameters:
-- - name - name for the type, used as the default autoplace control name and patch set name
--   (each of which can be overridden separately)
-- - base_density - amount of stuff, on average, to be placed per tile
-- Optional parameters:
-- - patch_set_name - name of the patch set; patches sets of the same name and seed1 will overlap; default: name
-- - autoplace_control_name - name of the corresponding autoplace control; default: name
-- - random_probability - probability of placement at any given tile within a patch; default: 1
-- - base_spots_per_km2 - number of patches per square kilometer near the starting area
-- - has_starting_area_placement - true|false|nil - yes, no, and there is no special starting area, respectively
-- - seed1 - random seed to use when generating patch positions; default: 100
local function resource_autoplace_settings(params)
  local patch_set_name = params.patch_set_name or params.name
  local autoplace_control_name = params.autoplace_control_name or params.name
  local autoplace_set_name = params.autoplace_set_name or default_autoplace_set_name
  local autoplace_set = get_autoplace_set(autoplace_set_name)
  local all_patches_name = autoplace_set_name .. "-" .. patch_set_name .. "-patches"

  data:extend
  {
    {
      type = "noise-expression",
      name = all_patches_name,
      expression = "resource_autoplace_all_patches{base_density = " .. params.base_density .. ",\z
                                                   base_spots_per_km2 = " .. (params.base_spots_per_km2 or 2.5) .. ",\z
                                                   candidate_spot_count = " .. (params.candidate_spot_count or 21) .. ",\z
                                                   frequency_multiplier = var('control:" .. autoplace_control_name .. ":frequency'),\z
                                                   has_starting_area_placement = " .. (params.has_starting_area_placement == nil and -1 or
                                                                                       params.has_starting_area_placement and 1 or 0) .. ",\z
                                                   random_spot_size_minimum = " .. (params.random_spot_size_minimum or 0.25) .. ",\z
                                                   random_spot_size_maximum = " .. (params.random_spot_size_maximum or 2) .. ",\z
                                                   regular_blob_amplitude_multiplier = " .. ((params.regular_blob_amplitude_multiplier or 1) / 8) .. ",\z
                                                   regular_patch_set_count = ".. autoplace_set.regular.count_expression_name .. ",\z
                                                   regular_patch_set_index = " .. autoplace_set.regular:get_patch_set_index(patch_set_name) .. ",\z
                                                   regular_rq_factor = " .. ((params.regular_rq_factor_multiplier or 1) / 10) .. ",\z
                                                   seed1 = " .. (params.seed1 or 100) .. ",\z
                                                   size_multiplier = var('control:" .. autoplace_control_name .. ":size'),\z
                                                   starting_blob_amplitude_multiplier = " .. ((params.starting_blob_amplitude_multiplier or 1) / 8) .. ",\z
                                                   starting_patch_set_count = ".. autoplace_set.starting.count_expression_name .. ",\z
                                                   starting_patch_set_index = " .. (params.has_starting_area_placement == true and
                                                                                    autoplace_set.starting:get_patch_set_index(patch_set_name) or 0) .. ",\z
                                                   starting_rq_factor = " .. ((params.starting_rq_factor_multiplier or 1) / 7) .. "}"
    }
  }

  local probability_expression = "clamp(var('" .. all_patches_name .. "'), 0, 1)"
  local richness_expression = "var('" .. all_patches_name .. "')"
  if (params.random_probability or 1) < 1 then
    probability_expression = probability_expression .. "* random_penalty{x = x, y = y, source = 1, amplitude = 1 /" .. params.random_probability .. "}"
    richness_expression = richness_expression .. "/" .. params.random_probability
  end
  if (params.additional_richness or 0) > 0 then
    richness_expression = richness_expression .. "+" .. params.additional_richness
  end
  if (params.minimum_richness or 0) > 0 then
    richness_expression = "max(" .. richness_expression .. "," .. params.minimum_richness .. ")"
  end

  local local_expressions = data.raw["noise-function"]["resource_autoplace_all_patches"].local_expressions
  local richness_multiplier_exp = (params.richness_post_multiplier or 1) .. "*var('control:" .. autoplace_control_name .. ":richness')"
  -- max((double_density_distance + size_effective_distance_at(distance)) / (double_density_distance * 2), 1)
  local richness_distance_exp = "max((" .. (local_expressions.double_density_distance -
                                            (params.has_starting_area_placement ~= nil and local_expressions.regular_patch_fade_in_distance or 0)) ..
                                     "+distance)/" .. (local_expressions.double_density_distance * 2) .. ",1)"
  richness_expression = richness_multiplier_exp .. "*(" .. richness_expression .. ")*" .. richness_distance_exp

  if params.create_named_expressions then
    local probability_name = autoplace_set_name .. "-" .. patch_set_name .. "-probability"
    local richness_name = autoplace_set_name .. "-" .. patch_set_name .. "-richness"
    data:extend
    {
      {type = "noise-expression", name = probability_name, expression = probability_expression},
      {type = "noise-expression", name = richness_name, expression = richness_expression}
    }
    probability_expression = data.raw["noise-expression"][probability_name]
    richness_expression = data.raw["noise-expression"][richness_name]
  end

  return
  {
    order = params.order or "d",
    --control = autoplace_control_name, -- doesn't work for planet-specific controls.
    --probability_expression = probability_expression,
    probability_expression = "(var('control:" .. autoplace_control_name .. ":size') > 0) * (" .. probability_expression .. ")",
    richness_expression = "(var('control:" .. autoplace_control_name .. ":size') > 0) * (" .. richness_expression .. ")"
  }
end

return
{
  initialize_patch_set = initialize_patch_set,
  resource_autoplace_settings = resource_autoplace_settings
}
