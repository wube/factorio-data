local explosion_animations = require("__base__.prototypes.entity.explosion-animations")
local item_sounds = require("__base__.prototypes.item_sounds")
local sounds = require("__base__.prototypes.entity.sounds")
require("util")

function make_rotated_animation_variations_from_sheet(variation_count, sheet) --makes remnants work with more than 1 variation
  local result = {}

  local function set_y_offset(variation, i)
    local frame_count = variation.frame_count or 1
    local line_length = variation.line_length or frame_count
    if (line_length < 1) then
      line_length = frame_count
    end

    local height_in_frames = math.floor((frame_count * variation.direction_count + line_length - 1) / line_length)
    -- if (height_in_frames ~= 1) then
    --   log("maybe broken sheet: h=" .. height_in_frames .. ", vc=" .. variation_count .. ", " .. variation.filename)
    -- end
    variation.y = variation.height * (i - 1) * height_in_frames
  end

  for i = 1,variation_count do
    local variation = util.table.deepcopy(sheet)

    if variation.layers then
      for _, layer in pairs(variation.layers) do
        set_y_offset(layer, i)
      end
    else
      set_y_offset(variation, i)
    end

    table.insert(result, variation)
  end
 return result
end

data:extend({
  {
    type = "recipe-category",
    name = "recycling"
  },
  {
    type = "item",
    name = "recycler",
    icon = "__recycler__/graphics/icons/recycler.png",
    subgroup = "smelting-machine",
    order = "d[recycler]",
    inventory_move_sound = item_sounds.metal_large_inventory_move,
    pick_sound = item_sounds.metal_large_inventory_pickup,
    drop_sound = item_sounds.metal_large_inventory_move,
    place_result = "recycler",
    stack_size = 20,
    weight = 100 * kg,
  },
  {
    type = "recipe",
    name = "recycler",
    ingredients =
    {
      {type = "item", name = "processing-unit", amount = 6},
      {type = "item", name = "steel-plate", amount = 20},
      {type = "item", name = "iron-gear-wheel", amount = 40},
      {type = "item", name = "concrete", amount = 20}
    },
    results = {{type="item", name="recycler", amount=1}},
    energy_required = 3,
    enabled = false
  },
  {
    type = "technology",
    name = "recycling",
    icon = "__recycler__/graphics/technology/recycling.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "recycler"
      },
    },
    prerequisites = {"production-science-pack", "processing-unit", "concrete"},
    unit =
    {
      count = 5000,
      ingredients =
      {
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
        { "chemical-science-pack", 1 },
        { "production-science-pack", 1 }
      },
      time = 15
    }
  },
  {
    type = "furnace",
    name = "recycler",
    icon = "__recycler__/graphics/icons/recycler.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    fast_transfer_modules_into_module_slots_only = true,
    minable = {mining_time = 0.2, result = "recycler"},
    circuit_wire_max_distance = furnace_circuit_wire_max_distance,
    circuit_connector = circuit_connector_definitions["recycler"],
    circuit_connector_flipped = circuit_connector_definitions["recycler-flipped"],
    max_health = 300,
    fast_replaceable_group = "recycler",
    vector_to_place_result = {-0.35, -2.3},
    dying_explosion = "recycler-explosion",
    corpse = "recycler-remnants",
    impact_category = "metal",
    working_sound =
    {
      sound = {filename = "__recycler__/sound/recycler/recycler-loop.ogg", volume = 0.7},
      sound_accents =
      {
        {sound = {variations = sound_variations("__recycler__/sound/recycler/recycler-jaw-move", 5, 0.45), audible_distance_modifier = 0.2}, frame = 14},
        {sound = {variations = sound_variations("__recycler__/sound/recycler/recycler-vox", 5, 0.2), audible_distance_modifier = 0.3}, frame = 20},
        {sound = {variations = sound_variations("__recycler__/sound/recycler/recycler-mechanic", 3, 0.3), audible_distance_modifier = 0.3}, frame = 45},
        {sound = {variations = sound_variations("__recycler__/sound/recycler/recycler-jaw-move", 5, 0.45), audible_distance_modifier = 0.2}, frame = 60},
        {sound = {variations = sound_variations("__recycler__/sound/recycler/recycler-trash", 5, 0.6), audible_distance_modifier = 0.3}, frame = 61},
        {sound = {variations = sound_variations("__recycler__/sound/recycler/recycler-jaw-shut", 6, 0.3), audible_distance_modifier = 0.6}, frame = 63},
      },
      max_sounds_per_prototype = 2,
      fade_in_ticks = 4,
      fade_out_ticks = 20
    },
    open_sound = sounds.metal_large_open,
    close_sound = sounds.metal_large_close,
    resistances =
    {
      {
        type = "fire",
        percent = 80
      }
    },
    collision_box = {{-0.7, -1.7}, {0.7, 1.7}},
    selection_box = {{-0.9, -1.85}, {0.9, 1.85}},
    crafting_categories = {"recycling"},
    result_inventory_size = 12,
    energy_usage = "180kW",
    crafting_speed = 0.5,
    source_inventory_size = 1,
    custom_input_slot_tooltip_key = "recycler-input-slot-tooltip",
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = { pollution = 2 }
    },
    module_slots = 4,
    icon_draw_specification = {shift = {0, -0.55}},
    icons_positioning =
    {
      {inventory_index = defines.inventory.crafter_modules, shift = {0, 0.2}}
    },
    allowed_effects = {"consumption", "speed", "pollution", "quality"},
    perceived_performance = {maximum = 4},
    use_mirroring = true,
    graphics_set          = require("__recycler__.recycler-pictures").graphics_set,
    graphics_set_flipped  = require("__recycler__.recycler-pictures").graphics_set_flipped,
    cant_insert_at_source_message_key = "inventory-restriction.cant-be-recycled",
    water_reflection =
    {
      pictures =
      {
        filename = "__recycler__/graphics/entity/recycler/recycler-reflection.png",
        priority = "extra-high",
        width = 48,
        height = 48,
        variation_count = 2,
        repeat_count = 2,
        scale = 5
      },
      rotate = false,
      orientation_to_variation = true
    }
  },
  {
    type = "explosion",
    name = "recycler-explosion",
    icon = "__recycler__/graphics/icons/recycler.png",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "smelting-machine-explosions",
    order = "e[recycler]",
    height = 0,
    animations = explosion_animations.medium_explosion(),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.medium_explosion,
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 17,
            particle_name = "assembling-machine-3-metal-particle-big",
            offset_deviation = { { -0.6875, -0.6875 }, { 0.6875, 0.6875 } },
            initial_height = 0.1,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.08,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 21,
            particle_name = "assembling-machine-3-metal-particle-medium",
            offset_deviation = { { -0.8789, -0.8945 }, { 0.8789, 0.8945 } },
            initial_height = 0.2,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.098,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 26,
            particle_name = "assembling-machine-3-metal-particle-small",
            offset_deviation = { { -0.8945, -0.3906 }, { 0.8945, 0.3906 } },
            initial_height = 0.1,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.075,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 7,
            particle_name = "cable-and-electronics-particle-small-medium",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.3,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.092,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 25,
            particle_name = "assembling-machine-mechanical-component-particle-medium",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.4,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.069,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          }
        }
      }
    }
  },
  {
    type = "corpse",
    name = "recycler-remnants",
    localised_name = {"remnant-name", {"entity-name.recycler"}},
    icon = "__recycler__/graphics/icons/recycler.png",
    flags = {"placeable-neutral", "not-on-map"},
    hidden_in_factoriopedia = true,
    subgroup = "smelting-machine-remnants",
    order = "e[recycler]",
    selection_box = {{-1, -2}, {1, 2}},
    tile_width = 2,
    tile_height = 4,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation = make_rotated_animation_variations_from_sheet (2,
    {
      filename = "__recycler__/graphics/entity/recycler/recycler-remnants.png",
      line_length = 4,
      width = 384,
      height = 384,
      direction_count = 4,
      shift = util.by_pixel(0, 0),
      scale = 0.5
    })
  },
})

table.insert(data.raw["utility-constants"].default.factoriopedia_recycling_recipe_categories, "recycling")
