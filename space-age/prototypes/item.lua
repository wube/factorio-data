local sounds = require("__base__.prototypes.entity.sounds")
local space_age_sounds = require("__space-age__.prototypes.entity.sounds")
local item_sounds = require("__base__.prototypes.item_sounds")
local space_age_item_sounds = require("__space-age__.prototypes.item_sounds")
local item_tints = require("__base__.prototypes.item-tints")
local item_effects = require("__space-age__.prototypes.item-effects")
local meld = require("meld")
local simulations = require("__space-age__.prototypes.factoriopedia-simulations")

local make_tile_area = function(area, name)
  local result = {}
  local left_top = area[1]
  local right_bottom = area[2]
  for x = left_top[1], right_bottom[1] do
    for y = left_top[2], right_bottom[2] do
      table.insert(result,
      {
        position = {x, y},
        tile = name
      })
    end
  end
  return result
end

data:extend(item_effects.data)
data:extend(
{
  {
    type = "item",
    name = "space-platform-foundation",
    icon = "__space-age__/graphics/icons/space-platform-foundation.png",
    subgroup = "space-platform",
    order = "a[space-platform-foundation]",
    inventory_move_sound = item_sounds.metal_large_inventory_move,
    pick_sound = item_sounds.metal_large_inventory_pickup,
    drop_sound = item_sounds.metal_large_inventory_move,
    stack_size = 100,
    weight = 20*kg,
    place_as_tile =
    {
      result = "space-platform-foundation",
      condition_size = 1,
      condition = {layers={empty_space=true}},
      invert = true,
    }
  },
  {
    type = "tool",
    name = "metallurgic-science-pack",
    localised_description = {"item-description.science-pack"},
    icon = "__space-age__/graphics/icons/metallurgic-science-pack.png",
    subgroup = "science-pack",
    color_hint = { text = "M" },
    order = "h",
    inventory_move_sound = item_sounds.science_inventory_move,
    pick_sound = item_sounds.science_inventory_pickup,
    drop_sound = item_sounds.science_inventory_move,
    stack_size = 200,
    default_import_location = "vulcanus",
    weight = 1*kg,
    durability = 1,
    durability_description_key = "description.science-pack-remaining-amount-key",
    factoriopedia_durability_description_key = "description.factoriopedia-science-pack-remaining-amount-key",
    durability_description_value = "description.science-pack-remaining-amount-value",
    random_tint_color = item_tints.bluish_science
  },
  {
    type = "tool",
    name = "agricultural-science-pack",
    localised_description = {"item-description.science-pack"},
    icon = "__space-age__/graphics/icons/agricultural-science-pack.png",
    subgroup = "science-pack",
    color_hint = { text = "G" },
    order = "i",
    inventory_move_sound = item_sounds.science_inventory_move,
    pick_sound = item_sounds.science_inventory_pickup,
    drop_sound = item_sounds.science_inventory_move,
    stack_size = 200,
    default_import_location = "gleba",
    weight = 1*kg,
    durability = 1,
    durability_description_key = "description.science-pack-remaining-amount-key",
    factoriopedia_durability_description_key = "description.factoriopedia-science-pack-remaining-amount-key",
    durability_description_value = "description.science-pack-remaining-amount-value",
    spoil_ticks = 1 * hour,
    spoil_result = "spoilage",
    random_tint_color = item_tints.bluish_science
  },
  {
    type = "tool",
    name = "electromagnetic-science-pack",
    localised_description = {"item-description.science-pack"},
    icon = "__space-age__/graphics/icons/electromagnetic-science-pack.png",
    subgroup = "science-pack",
    color_hint = { text = "E" },
    order = "j",
    inventory_move_sound = item_sounds.science_inventory_move,
    pick_sound = item_sounds.science_inventory_pickup,
    drop_sound = item_sounds.science_inventory_move,
    stack_size = 200,
    default_import_location = "fulgora",
    weight = 1*kg,
    durability = 1,
    durability_description_key = "description.science-pack-remaining-amount-key",
    factoriopedia_durability_description_key = "description.factoriopedia-science-pack-remaining-amount-key",
    durability_description_value = "description.science-pack-remaining-amount-value",
    random_tint_color = item_tints.bluish_science
  },
  {
    type = "tool",
    name = "cryogenic-science-pack",
    localised_description = {"item-description.science-pack"},
    icon = "__space-age__/graphics/icons/cryogenic-science-pack.png",
    subgroup = "science-pack",
    color_hint = { text = "R" },
    order = "k",
    inventory_move_sound = item_sounds.science_inventory_move,
    pick_sound = item_sounds.science_inventory_pickup,
    drop_sound = item_sounds.science_inventory_move,
    stack_size = 200,
    default_import_location = "aquilo",
    weight = 1*kg,
    durability = 1,
    durability_description_key = "description.science-pack-remaining-amount-key",
    factoriopedia_durability_description_key = "description.factoriopedia-science-pack-remaining-amount-key",
    durability_description_value = "description.science-pack-remaining-amount-value",
    random_tint_color = item_tints.bluish_science
  },
  {
    type = "tool",
    name = "promethium-science-pack",
    --localised_description = {"item-description.science-pack"},
    icon = "__space-age__/graphics/icons/promethium-science-pack.png",
    subgroup = "science-pack",
    color_hint = { text = "I" },
    order = "l",
    inventory_move_sound = item_sounds.science_inventory_move,
    pick_sound = item_sounds.science_inventory_pickup,
    drop_sound = item_sounds.science_inventory_move,
    stack_size = 200,
    default_import_location = "aquilo",
    weight = 1*kg,
    durability = 1,
    durability_description_key = "description.science-pack-remaining-amount-key",
    factoriopedia_durability_description_key = "description.factoriopedia-science-pack-remaining-amount-key",
    durability_description_value = "description.science-pack-remaining-amount-value",
    random_tint_color = item_tints.bluish_science
  },
  {
    type = "item",
    name = "turbo-transport-belt",
    icon = "__space-age__/graphics/icons/turbo-transport-belt.png",
    subgroup = "belt",
    color_hint = { text = "4" },
    order = "a[transport-belt]-d[turbo-transport-belt]",
    inventory_move_sound = item_sounds.transport_belt_inventory_move,
    pick_sound = item_sounds.transport_belt_inventory_pickup,
    drop_sound = item_sounds.transport_belt_inventory_move,
    place_result = "turbo-transport-belt",
    stack_size = 100,
    default_import_location = "vulcanus",
    weight = 20*kg
  },
  {
    type = "item",
    name = "turbo-underground-belt",
    icon = "__space-age__/graphics/icons/turbo-underground-belt.png",
    subgroup = "belt",
    color_hint = { text = "4" },
    order = "b[underground-belt]-d[turbo-underground-belt]",
    inventory_move_sound = item_sounds.mechanical_inventory_move,
    pick_sound = item_sounds.mechanical_inventory_pickup,
    drop_sound = item_sounds.mechanical_inventory_move,
    place_result = "turbo-underground-belt",
    stack_size = 50,
    default_import_location = "vulcanus",
    weight = 40*kg
  },
  {
    type = "item",
    name = "turbo-splitter",
    icon = "__space-age__/graphics/icons/turbo-splitter.png",
    subgroup = "belt",
    color_hint = { text = "4" },
    order = "c[splitter]-d[turbo-splitter]",
    inventory_move_sound = item_sounds.mechanical_inventory_move,
    pick_sound = item_sounds.mechanical_inventory_pickup,
    drop_sound = item_sounds.mechanical_inventory_move,
    place_result = "turbo-splitter",
    stack_size = 50,
    default_import_location = "vulcanus",
    weight = 40*kg
  },
  {
    type = "item",
    name = "turbo-loader",
    icon = "__space-age__/graphics/icons/turbo-loader.png",
    hidden = true,
    subgroup = "belt",
    color_hint = { text = "4" },
    order = "d[loader]-d[turbo-loader]",
    inventory_move_sound = item_sounds.mechanical_inventory_move,
    pick_sound = item_sounds.mechanical_inventory_pickup,
    drop_sound = item_sounds.mechanical_inventory_move,
    place_result = "turbo-loader",
    stack_size = 50
  },
  {
    type = "armor",
    name = "mech-armor",
    icon = "__space-age__/graphics/icons/mech-armor.png",
    resistances =
    {
      {
        type = "physical",
        decrease = 10,
        percent = 50
      },
      {
        type = "acid",
        decrease = 0,
        percent = 70
      },
      {
        type = "explosion",
        decrease = 60,
        percent = 50
      },
      {
        type = "fire",
        decrease = 10,
        percent = 70
      }
    },
    subgroup = "armor",
    order = "f[mech-armor]",
    factoriopedia_simulation = simulations.factoriopedia_mech_armor,
    inventory_move_sound = item_sounds.armor_large_inventory_move,
    pick_sound = item_sounds.armor_large_inventory_pickup,
    drop_sound = item_sounds.armor_large_inventory_move,
    stack_size = 1,
    infinite = true,
    equipment_grid = "huge-equipment-grid",
    inventory_size_bonus = 50,
    --character_health_bonus = 1000, -- not implemented in current version
    provides_flight = true,
    takeoff_sound = {filename = "__space-age__/sound/entity/mech-armor/mech-armor-takeoff.ogg", volume = 0.2, aggregation = {max_count = 2, remove = true, count_already_playing = true}},
    landing_sound = {filename = "__space-age__/sound/entity/mech-armor/mech-armor-land.ogg", volume = 0.3, aggregation = {max_count = 2, remove = true, count_already_playing = true}},
    flight_sound = {sound={filename = "__space-age__/sound/entity/mech-armor/mech-armor-flight.ogg", volume = 0.2}},
    steps_sound = sound_variations("__space-age__/sound/entity/mech-armor/mech-armor-steps-metallic", 5, 0.2),
    moving_sound = sound_variations("__space-age__/sound/entity/mech-armor/mech-armor-moves", 10, 0.4),
    collision_box = {{-0.25, -0.25}, {0.25, 0.25}},
    drawing_box = {{-0.4, -2}, {0.4, 0}},
    open_sound = {filename =  "__base__/sound/armor-open.ogg", volume = 1},
    close_sound = {filename = "__base__/sound/armor-close.ogg", volume = 1},
    weight = 1*tons
  },
  {
    type = "item",
    name = "toolbelt-equipment",
    icon = "__space-age__/graphics/icons/toolbelt-equipment.png",
    place_as_equipment_result = "toolbelt-equipment",
    subgroup = "utility-equipment",
    order = "g[toolbelt]-a[night-vision-equipment]",
    inventory_move_sound = item_sounds.armor_small_inventory_move,
    pick_sound = item_sounds.armor_small_inventory_pickup,
    drop_sound = item_sounds.armor_small_inventory_move,
    stack_size = 20,
    weight = 50 * kg
  },
  {
    type = "item",
    name = "battery-mk3-equipment",
    localised_description = {"item-description.battery-equipment"},
    icon = "__space-age__/graphics/icons/battery-mk3-equipment.png",
    place_as_equipment_result = "battery-mk3-equipment",
    subgroup = "equipment",
    order = "b[battery]-c[battery-equipment-mk3]",
    inventory_move_sound = item_sounds.electric_small_inventory_move,
    pick_sound = item_sounds.electric_small_inventory_pickup,
    drop_sound = item_sounds.electric_small_inventory_move,
    stack_size = 20,
    weight = 200 * kg
  },
  {
    type = "item",
    name = "cargo-bay",
    icon = "__space-age__/graphics/icons/cargo-bay.png",
    icon_size = 64,
    subgroup = "space-platform",
    order = "c[cargo-bay]",
    inventory_move_sound = item_sounds.mechanical_large_inventory_move,
    pick_sound = item_sounds.mechanical_large_inventory_pickup,
    drop_sound = item_sounds.mechanical_large_inventory_move,
    place_result = "cargo-bay",
    stack_size = 10,
    weight = 100 * kg
  },
  {
    type = "space-platform-starter-pack",
    name = "space-platform-starter-pack",
    icon = "__space-age__/graphics/icons/space-platform-hub.png",
    subgroup = "space-rocket",
    order = "b[space-platform-starter-pack]",
    inventory_move_sound = item_sounds.mechanical_large_inventory_move,
    pick_sound = item_sounds.mechanical_large_inventory_pickup,
    drop_sound = item_sounds.mechanical_large_inventory_move,
    stack_size = 1,
    weight = 1*tons,
    surface = "space-platform",
    trigger =
    {
      {
        type = "direct",
        action_delivery =
        {
          type = "instant",
          source_effects =
          {
            {
              type = "create-entity",
              entity_name = "space-platform-hub"
            }
          }
        }
      }
    },
    tiles = make_tile_area({{-5, -5}, {4, 4}}, "space-platform-foundation"),
    initial_items = {{type = "item", name = "space-platform-foundation", amount = 10}},
    create_electric_network = true,
  },
  {
    type = "item",
    name = "metallic-asteroid-chunk",
    icon = "__space-age__/graphics/icons/metallic-asteroid-chunk.png",
    subgroup = "space-material",
    order = "a[metallic]-e[chunk]",
    inventory_move_sound = space_age_item_sounds.rock_inventory_move,
    pick_sound = space_age_item_sounds.rock_inventory_pickup,
    drop_sound = space_age_item_sounds.rock_inventory_move,
    stack_size = 1,
    weight = 100 * kg,
    random_tint_color = item_tints.iron_rust
  },
  {
    type = "item",
    name = "carbonic-asteroid-chunk",
    icon = "__space-age__/graphics/icons/carbonic-asteroid-chunk.png",
    subgroup = "space-material",
    order = "b[carbonic]-e[chunk]",
    inventory_move_sound = space_age_item_sounds.rock_inventory_move,
    pick_sound = space_age_item_sounds.rock_inventory_pickup,
    drop_sound = space_age_item_sounds.rock_inventory_move,
    stack_size = 1,
    weight = 100 * kg,
    random_tint_color = item_tints.yellowing_coal
  },
  {
    type = "item",
    name = "oxide-asteroid-chunk",
    icon = "__space-age__/graphics/icons/oxide-asteroid-chunk.png",
    subgroup = "space-material",
    order = "c[oxide]-e[chunk]",
    inventory_move_sound = item_sounds.sulfur_inventory_move,
    pick_sound = item_sounds.resource_inventory_pickup,
    drop_sound = item_sounds.sulfur_inventory_move,
    stack_size = 1,
    weight = 100 * kg,
    random_tint_color = item_tints.ice_blue
  },
  {
    type = "item",
    name = "promethium-asteroid-chunk",
    icon = "__space-age__/graphics/icons/promethium-asteroid-chunk.png",
    subgroup = "space-material",
    order = "d[promethium]-e[chunk]",
    inventory_move_sound = item_sounds.sulfur_inventory_move,
    pick_sound = item_sounds.resource_inventory_pickup,
    drop_sound = item_sounds.sulfur_inventory_move,
    stack_size = 1,
    weight = 100 * kg,
    random_tint_color = item_tints.ice_blue
  },
  {
    type = "item",
    name = "asteroid-collector",
    icon = "__space-age__/graphics/icons/asteroid-collector.png",
    subgroup = "space-platform",
    order = "d[asteroid-collector]",
    inventory_move_sound = item_sounds.mechanical_inventory_move,
    pick_sound = item_sounds.mechanical_inventory_pickup,
    drop_sound = item_sounds.mechanical_inventory_move,
    place_result = "asteroid-collector",
    stack_size = 10,
    weight = 100*kg,
    random_tint_color = item_tints.iron_rust
  },
  {
    type = "item",
    name = "crusher",
    icon = "__space-age__/graphics/icons/crusher.png",
    subgroup = "space-platform",
    order = "e[crusher]",
    inventory_move_sound = item_sounds.drill_inventory_move,
    pick_sound = item_sounds.drill_inventory_pickup,
    drop_sound = item_sounds.drill_inventory_move,
    place_result = "crusher",
    stack_size = 10,
    weight = 100*kg
  },
  {
    type = "item",
    name = "thruster",
    icon = "__space-age__/graphics/icons/thruster.png",
    subgroup = "space-platform",
    order = "f[thruster]",
    inventory_move_sound = space_age_item_sounds.rocket_inventory_move,
    pick_sound = space_age_item_sounds.rocket_inventory_pickup,
    drop_sound = space_age_item_sounds.rocket_inventory_move,
    place_result = "thruster",
    stack_size = 10,
    weight = 200*kg
  },
  {
    type = "item",
    name = "ice",
    icon = "__space-age__/graphics/icons/ice.png",
    subgroup = "raw-resource",
    order = "j[ice]",
    inventory_move_sound = space_age_item_sounds.ice_inventory_move,
    pick_sound = space_age_item_sounds.ice_inventory_pickup,
    drop_sound = space_age_item_sounds.ice_inventory_move,
    stack_size = 50,
    weight = 1 * kg,
    random_tint_color = item_tints.ice_blue
  },
  {
    type = "item",
    name = "carbon",
    icon = "__space-age__/graphics/icons/carbon.png",
    fuel_value = "2MJ",
    fuel_category = "chemical",
    subgroup = "raw-material",
    order = "b[chemistry]-f[carbon]",
    inventory_move_sound = item_sounds.resource_inventory_move,
    pick_sound = item_sounds.resource_inventory_pickup,
    drop_sound = item_sounds.resource_inventory_move,
    stack_size = 50,
    weight = 1 * kg,
    random_tint_color = item_tints.yellowing_coal
  },
  {
    type = "item",
    name = "calcite",
    icon = "__space-age__/graphics/icons/calcite.png",
    pictures =
    {
      { size = 64, filename = "__space-age__/graphics/icons/calcite.png",   scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__space-age__/graphics/icons/calcite-1.png", scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__space-age__/graphics/icons/calcite-2.png", scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__space-age__/graphics/icons/calcite-3.png", scale = 0.5, mipmap_count = 4 }
    },
    subgroup = "vulcanus-processes",
    order = "a[melting]-a[calcite]",
    inventory_move_sound = item_sounds.resource_inventory_move,
    pick_sound = item_sounds.resource_inventory_pickup,
    drop_sound = item_sounds.resource_inventory_move,
    stack_size = 50,
    default_import_location = "vulcanus",
    weight = 2*kg
  },
  {
    type = "item",
    name = "tungsten-ore",
    icon = "__space-age__/graphics/icons/tungsten-ore.png",
    pictures =
    {
      { size = 64, filename = "__space-age__/graphics/icons/tungsten-ore.png",   scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__space-age__/graphics/icons/tungsten-ore-1.png", scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__space-age__/graphics/icons/tungsten-ore-2.png", scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__space-age__/graphics/icons/tungsten-ore-3.png", scale = 0.5, mipmap_count = 4 }
    },
    subgroup = "vulcanus-processes",
    color_hint = { text = "T" },
    order = "c[tungsten]-a[tungsten-ore]",
    inventory_move_sound = item_sounds.resource_inventory_move,
    pick_sound = item_sounds.resource_inventory_pickup,
    drop_sound = item_sounds.resource_inventory_move,
    stack_size = 50,
    default_import_location = "vulcanus",
    weight = 10*kg
  },
  {
    type = "item",
    name = "tungsten-plate",
    icon = "__space-age__/graphics/icons/tungsten-plate.png",
    subgroup = "vulcanus-processes",
    order = "c[tungsten]-c[tungsten-plate]",
    inventory_move_sound = item_sounds.metal_small_inventory_move,
    pick_sound = item_sounds.metal_small_inventory_pickup,
    drop_sound = item_sounds.metal_small_inventory_move,
    stack_size = 50,
    default_import_location = "vulcanus",
    weight = 4*kg
  },
  {
    type = "item",
    name = "big-mining-drill",
    icon = "__space-age__/graphics/icons/big-mining-drill.png",
    subgroup = "extraction-machine",
    order = "a[items]-c[big-mining-drill]",
    inventory_move_sound = item_sounds.drill_inventory_move,
    pick_sound = item_sounds.drill_inventory_pickup,
    drop_sound = item_sounds.drill_inventory_move,
    place_result = "big-mining-drill",
    stack_size = 20,
    default_import_location = "vulcanus",
    weight = 50 * kg
  },
  {
    type = "item",
    name = "tungsten-carbide",
    icon = "__space-age__/graphics/icons/tungsten-carbide.png",
    subgroup = "vulcanus-processes",
    order = "c[tungsten]-b[tungsten-carbide]",
    inventory_move_sound = item_sounds.brick_inventory_move,
    pick_sound = item_sounds.brick_inventory_pickup,
    drop_sound = item_sounds.brick_inventory_move,
    stack_size = 50,
    default_import_location = "vulcanus",
    weight = 2*kg,
  },
  {
    type = "item",
    name = "foundry",
    icon = "__space-age__/graphics/icons/foundry.png",
    subgroup = "smelting-machine",
    order = "d[foundry]",
    inventory_move_sound = item_sounds.steam_inventory_move,
    pick_sound = item_sounds.steam_inventory_pickup,
    drop_sound = item_sounds.steam_inventory_move,
    place_result = "foundry",
    stack_size = 20,
    default_import_location = "vulcanus",
    weight = 200 * kg
  },
  {
    type = "gun",
    name = "railgun",
    icon = "__space-age__/graphics/icons/railgun.png",
    subgroup = "gun",
    order = "a[basic-clips]-h[railgun]",
    inventory_move_sound = item_sounds.weapon_large_inventory_move,
    pick_sound = item_sounds.weapon_large_inventory_pickup,
    drop_sound = item_sounds.weapon_large_inventory_move,
    attack_parameters =
    {
      type = "projectile",
      ammo_category = "railgun",
      cooldown = 120,
      movement_slow_down_factor = 0.5,
      shell_particle =
      {
        name = "shell-particle",
        direction_deviation = 0.1,
        speed = 0.1,
        speed_deviation = 0.03,
        center = {0, 0.1},
        creation_distance = -0.5,
        starting_frame_speed = 0.4,
        starting_frame_speed_deviation = 0.1
      },
      projectile_creation_distance = 1.125,
      range = 40,
      sound = space_age_sounds.railgun_gunshot
    },
    stack_size = 1
  },
  {
    type = "item",
    name = "railgun-turret",
    icon = "__space-age__/graphics/icons/railgun-turret.png",
    subgroup = "turret",
    order = "b[turret]-g[railgun-turret]-a[turret]",
    inventory_move_sound = item_sounds.turret_inventory_move,
    pick_sound = item_sounds.turret_inventory_pickup,
    drop_sound = item_sounds.turret_inventory_move,
    place_result = "railgun-turret",
    stack_size = 10,
    default_import_location = "aquilo",
    weight = 1*tons,
  },
  {
    type = "ammo",
    name = "railgun-ammo",
    icon = "__space-age__/graphics/icons/railgun-ammo.png",
    ammo_category = "railgun",
    ammo_type =
    {
      target_type = "direction",
      clamp_position = true,
      action =
      {
        type = "line",
        range = 50,
        width = 1,
        range_effects =
        {
          type = "create-explosion",
          entity_name = "railgun-beam"
        },
        action_delivery =
        {
          type = "instant",
          target_effects =
          {
            type = "damage",
            damage = {amount = 10000, type = "physical"}
          },
          source_effects =
          {
            type = "create-explosion",
            entity_name = "explosion-gunshot"
          }
        }
      }
    },
    subgroup = "ammo",
    order = "e[railgun-ammo]-a[basic]",
    inventory_move_sound = item_sounds.ammo_large_inventory_move,
    pick_sound = item_sounds.ammo_large_inventory_pickup,
    drop_sound = item_sounds.ammo_large_inventory_move,
    stack_size = 10,
    weight = 200*kg
  },

  ----------------------- gleba agriculture
  {
    type = "capsule",
    name = "yumako",
    icon = "__space-age__/graphics/icons/yumako.png",
    pictures =
    {
      { size = 64, filename = "__space-age__/graphics/icons/yumako.png",   scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__space-age__/graphics/icons/yumako-1.png", scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__space-age__/graphics/icons/yumako-2.png", scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__space-age__/graphics/icons/yumako-3.png", scale = 0.5, mipmap_count = 4 }
    },
    subgroup = "agriculture-processes",
    order = "b[agriculture]-a[yumako]",
    inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
    pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
    drop_sound = space_age_item_sounds.agriculture_inventory_move,
    fuel_category = "chemical",
    fuel_value = "2MJ",
    stack_size = 50,
    default_import_location = "gleba",
    weight = 1 * kg,
    spoil_ticks = 60 * minute,
    spoil_result = "spoilage",
    capsule_action = item_effects.yumako_regen
  },
  {
    type = "capsule",
    name = "jellynut",
    icon = "__space-age__/graphics/icons/jellynut.png",
    pictures =
    {
      { size = 64, filename = "__space-age__/graphics/icons/jellynut.png", scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__space-age__/graphics/icons/jellynut-1.png", scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__space-age__/graphics/icons/jellynut-2.png", scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__space-age__/graphics/icons/jellynut-3.png", scale = 0.5, mipmap_count = 4 },
    },
    subgroup = "agriculture-processes",
    order = "b[agriculture]-b[jellynut]",
    inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
    pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
    drop_sound = space_age_item_sounds.agriculture_inventory_move,
    stack_size = 50,
    default_import_location = "gleba",
    weight = 1 * kg,
    spoil_ticks = 60 * minute,
    fuel_category = "chemical",
    fuel_value = "10MJ",
    spoil_result = "spoilage",
    capsule_action = item_effects.jellynut_speed
  },
  {
    type = "item",
    name = "copper-bacteria",
    icon = "__space-age__/graphics/icons/copper-bacteria.png",
    pictures =
    {
      { size = 64, filename = "__space-age__/graphics/icons/copper-bacteria.png", scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__space-age__/graphics/icons/copper-bacteria-1.png", scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__space-age__/graphics/icons/copper-bacteria-2.png", scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__space-age__/graphics/icons/copper-bacteria-3.png", scale = 0.5, mipmap_count = 4 },
    },
    subgroup = "agriculture-processes",
    order = "b[agriculture]-d[copper-bacteria]",
    inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
    pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
    drop_sound = space_age_item_sounds.agriculture_inventory_move,
    stack_size = 50,
    default_import_location = "gleba",
    weight = 1 * kg,
    spoil_ticks = 1 * minute,
    spoil_result = "copper-ore"
  },
  {
    type = "item",
    name = "iron-bacteria",
    icon = "__space-age__/graphics/icons/iron-bacteria.png",
    pictures =
    {
      { size = 64, filename = "__space-age__/graphics/icons/iron-bacteria.png", scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__space-age__/graphics/icons/iron-bacteria-1.png", scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__space-age__/graphics/icons/iron-bacteria-2.png", scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__space-age__/graphics/icons/iron-bacteria-3.png", scale = 0.5, mipmap_count = 4 },
    },
    subgroup = "agriculture-processes",
    order = "b[agriculture]-c[iron-bacteria]",
    inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
    pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
    drop_sound = space_age_item_sounds.agriculture_inventory_move,
    stack_size = 50,
    default_import_location = "gleba",
    weight = 1 * kg,
    spoil_ticks = 1 * minute,
    spoil_result = "iron-ore"
  },
  ----------------------- gleba seeds
  {
    type = "item",
    name = "yumako-seed",
    localised_name = {"item-name.yumako-seed"},
    localised_description = {"item-description.yumako-seed"},
    icon = "__space-age__/graphics/icons/yumako-seed.png",
    pictures =
    {
      { size = 64, filename = "__space-age__/graphics/icons/yumako-seed-1.png", scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__space-age__/graphics/icons/yumako-seed-2.png", scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__space-age__/graphics/icons/yumako-seed-3.png", scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__space-age__/graphics/icons/yumako-seed-4.png", scale = 0.5, mipmap_count = 4 },
    },
    subgroup = "agriculture-processes",
    order = "a[seeds]-a[yumako-seed]",
    plant_result = "yumako-tree",
    place_result = "yumako-tree",
    inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
    pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
    drop_sound = space_age_item_sounds.agriculture_inventory_move,
    stack_size = 10,
    default_import_location = "gleba",
    weight = 10 * kg,
    fuel_category = "chemical",
    fuel_value = "4MJ"
  },
  {
    type = "item",
    name = "jellynut-seed",
    localised_name = {"item-name.jellynut-seed"},
    localised_description = {"item-description.jellynut-seed"},
    icon = "__space-age__/graphics/icons/jellynut-seed.png",
    pictures =
    {
      { size = 64, filename = "__space-age__/graphics/icons/jellynut-seed-1.png", scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__space-age__/graphics/icons/jellynut-seed-2.png", scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__space-age__/graphics/icons/jellynut-seed-3.png", scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__space-age__/graphics/icons/jellynut-seed-4.png", scale = 0.5, mipmap_count = 4 },
    },
    subgroup = "agriculture-processes",
    order = "a[seeds]-b[jellynut-seed]",
    plant_result = "jellystem",
    place_result = "jellystem",
    inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
    pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
    drop_sound = space_age_item_sounds.agriculture_inventory_move,
    stack_size = 10,
    default_import_location = "gleba",
    weight = 10 * kg,
    fuel_category = "chemical",
    fuel_value = "4MJ"
  },
  ----------------------- gleba processing
  {
    type = "item",
    name = "nutrients",
    icon = "__space-age__/graphics/icons/nutrients.png",
    subgroup = "agriculture-processes",
    order = "c[nutrients]-b[nutrients]",
    inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
    pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
    drop_sound = space_age_item_sounds.agriculture_inventory_move,
    fuel_category = "nutrients",
    fuel_value = "2MJ",
    stack_size = 100,
    default_import_location = "gleba",
    spoil_ticks = 5 * minute,
    spoil_result = "spoilage",
    weight = 0.5 * kg
  },
  {
    type = "capsule",
    name = "yumako-mash",
    icon = "__space-age__/graphics/icons/yumako-mash.png",
    subgroup = "agriculture-products",
    order = "a[organic-processing]-c[yumako-mash]",
    inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
    pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
    drop_sound = space_age_item_sounds.agriculture_inventory_move,
    fuel_category = "chemical",
    fuel_value = "1MJ",
    stack_size = 100,
    default_import_location = "gleba",
    spoil_ticks = 3 * minute,
    spoil_result = "spoilage",
    weight = 0.5 * kg,
    capsule_action = item_effects.yumako_regen
  },
  {
    type = "capsule",
    name = "jelly",
    icon = "__space-age__/graphics/icons/jelly.png",
    subgroup = "agriculture-products",
    order = "a[organic-processing]-d[jelly]",
    inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
    pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
    drop_sound = space_age_item_sounds.agriculture_inventory_move,
    fuel_category = "chemical",
    fuel_value = "1MJ",
    stack_size = 100,
    default_import_location = "gleba",
    spoil_ticks = 4 * minute,
    spoil_result = "spoilage",
    weight = 0.5 * kg,
    capsule_action = item_effects.jellynut_speed
  },
  {
    type = "capsule",
    name = "bioflux",
    icon = "__space-age__/graphics/icons/bioflux.png",
    subgroup = "agriculture-products",
    order = "a[organic-processing]-b[bioflux]",
    inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
    pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
    drop_sound = space_age_item_sounds.agriculture_inventory_move,
    fuel_category = "food",
    fuel_value = "6MJ",
    stack_size = 100,
    default_import_location = "gleba",
    spoil_ticks = 2 * hour,
    spoil_result = "spoilage",
    weight = 1 * kg,
    capsule_action = item_effects.bioflux_speed_and_regen
  },
  ----------------------- gleba results
  {
    type = "item",
    name = "artificial-yumako-soil",
    icon = "__space-age__/graphics/icons/artificial-yumako-soil.png",
    subgroup = "terrain",
    order = "c[landfill]-b[artificial-yumako-soil]",
    inventory_move_sound = item_sounds.landfill_inventory_move,
    pick_sound = item_sounds.landfill_inventory_pickup,
    drop_sound = item_sounds.landfill_inventory_move,
    stack_size = 100,
    default_import_location = "gleba",
    place_as_tile =
    {
      result = "artificial-yumako-soil",
      condition_size = 1,
      condition = {layers={ground_tile=true}},
      tile_condition = {"wetland-yumako"}
    }
  },
  {
    type = "item",
    name = "overgrowth-yumako-soil",
    icon = "__space-age__/graphics/icons/overgrowth-yumako-soil.png",
    subgroup = "terrain",
    order = "c[landfill]-c[overgrowth-yumako-soil]",
    inventory_move_sound = item_sounds.landfill_inventory_move,
    pick_sound = item_sounds.landfill_inventory_pickup,
    drop_sound = item_sounds.landfill_inventory_move,
    stack_size = 100,
    default_import_location = "gleba",
    place_as_tile =
    {
      result = "overgrowth-yumako-soil",
      condition_size = 1,
      condition = {layers={}},
      tile_condition = {
        "wetland-light-green-slime",
        "wetland-green-slime",
        "wetland-yumako",
        "lowland-olive-blubber",
        "lowland-olive-blubber-2",
        "lowland-olive-blubber-3",
        "lowland-brown-blubber",
        "lowland-pale-green"
      }
    }
  },
  {
    type = "item",
    name = "artificial-jellynut-soil",
    icon = "__space-age__/graphics/icons/artificial-jellynut-soil.png",
    subgroup = "terrain",
    order = "c[landfill]-d[artificial-jellynut-soil]",
    inventory_move_sound = item_sounds.landfill_inventory_move,
    pick_sound = item_sounds.landfill_inventory_pickup,
    drop_sound = item_sounds.landfill_inventory_move,
    stack_size = 100,
    default_import_location = "gleba",
    place_as_tile =
    {
      result = "artificial-jellynut-soil",
      condition_size = 1,
      condition = {layers={ground_tile=true}},
      tile_condition = {"wetland-jellynut"}
    }
  },
  {
    type = "item",
    name = "overgrowth-jellynut-soil",
    icon = "__space-age__/graphics/icons/overgrowth-jellynut-soil.png",
    subgroup = "terrain",
    order = "c[landfill]-e[overgrowth-jellynut-soil]",
    inventory_move_sound = item_sounds.landfill_inventory_move,
    pick_sound = item_sounds.landfill_inventory_pickup,
    drop_sound = item_sounds.landfill_inventory_move,
    stack_size = 100,
    default_import_location = "gleba",
    place_as_tile =
    {
      result = "overgrowth-jellynut-soil",
      condition_size = 1,
      condition = {layers={}},
      tile_condition = {
        "wetland-pink-tentacle",
        "wetland-red-tentacle",
        "wetland-jellynut",
        "lowland-red-vein",
        "lowland-red-vein-2",
        "lowland-red-vein-3",
        "lowland-red-vein-4",
        "lowland-red-vein-dead",
        "lowland-red-infection",
        "lowland-cream-red"
      }
    }
  },
  {
    type = "item",
    name = "agricultural-tower",
    icon = "__space-age__/graphics/icons/agricultural-tower.png",
    subgroup = "agriculture",
    order = "a[agricultural-tower]",
    inventory_move_sound = item_sounds.mechanical_large_inventory_move,
    pick_sound = item_sounds.mechanical_large_inventory_pickup,
    drop_sound = item_sounds.mechanical_large_inventory_move,
    place_result = "agricultural-tower",
    stack_size = 20,
    default_import_location = "gleba"
  },
  {
    type = "item",
    name = "biochamber",
    icon = "__space-age__/graphics/icons/biochamber.png",
    subgroup = "agriculture",
    order = "b[biochamber]",
    inventory_move_sound = item_sounds.fluid_inventory_move,
    pick_sound = item_sounds.fluid_inventory_pickup,
    drop_sound = item_sounds.fluid_inventory_move,
    place_result = "biochamber",
    stack_size = 20,
    default_import_location = "gleba"
  },
  {
    type = "ammo",
    name = "capture-robot-rocket",
    icon = "__space-age__/graphics/icons/capture-bot.png",
    ammo_category = "rocket",
    ammo_type =
    {
      action =
      {
        type = "direct",
        action_delivery =
        {
          type = "projectile",
          projectile = "capture-robot-rocket",
          starting_speed = 0.1
        }
      },
      target_filter = {"biter-spawner", "spitter-spawner"}
    },
    subgroup = "ammo",
    order = "d[rocket-launcher]-d[capture]",
    inventory_move_sound = item_sounds.robotic_inventory_move,
    pick_sound = item_sounds.robotic_inventory_pickup,
    drop_sound = item_sounds.robotic_inventory_move,
    stack_size = 10,
    default_import_location = "gleba",
    weight = 100 * kg,
    shoot_protected = true
  },
  {
    type = "item",
    name = "biolab",
    icon = "__space-age__/graphics/icons/biolab.png",
    subgroup = "production-machine",
    order = "z[z-biolab]",
    inventory_move_sound = item_sounds.mechanical_inventory_move,
    pick_sound = item_sounds.mechanical_inventory_pickup,
    drop_sound = item_sounds.mechanical_inventory_move,
    place_result = "biolab",
    stack_size = 5,
    weight = 1000 * kg
  },
  {
    type = "item",
    name = "captive-biter-spawner",
    icon = "__space-age__/graphics/icons/captive-biter-spawner.png",
    subgroup = "agriculture",
    order = "z[biter-nest]",
    inventory_move_sound = item_sounds.mechanical_inventory_move,
    pick_sound = item_sounds.mechanical_inventory_pickup,
    drop_sound = item_sounds.mechanical_inventory_move,
    place_result = "captive-biter-spawner",
    stack_size = 1,
    spoil_ticks = 30 * minute,
    spoil_to_trigger_result =
    {
      items_per_trigger = 1,
      trigger =
      {
        type = "direct",
        action_delivery =
        {
          type = "instant",
          source_effects =
          {
            {
              type = "create-entity",
              entity_name = "behemoth-biter",
              affects_target = true,
              show_in_tooltip = true,
              as_enemy = true,
              find_non_colliding_position = true,
              offset_deviation = {{-1, -1}, {1, 1}},
              non_colliding_fail_result =
              {
                type = "direct",
                action_delivery =
                {
                  type = "instant",
                  source_effects =
                  {
                    {
                      type = "create-entity",
                      entity_name = "behemoth-biter",
                      affects_target = true,
                      show_in_tooltip = false,
                      as_enemy = true,
                      offset_deviation = {{-1, -1}, {1, 1}},
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  },
  {
    type = "item",
    name = "biter-egg",
    icon = "__space-age__/graphics/icons/biter-egg.png",
    pictures =
    {
      { size = 64, filename = "__space-age__/graphics/icons/biter-egg.png", scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__space-age__/graphics/icons/biter-egg-1.png", scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__space-age__/graphics/icons/biter-egg-2.png", scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__space-age__/graphics/icons/biter-egg-3.png", scale = 0.5, mipmap_count = 4 },
    },
    fuel_category = "chemical",
    fuel_value = "6MJ",
    subgroup = "agriculture-products",
    order = "c[eggs]-a[biter-egg]",
    inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
    pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
    drop_sound = space_age_item_sounds.agriculture_inventory_move,
    stack_size = 100,
    weight = 2 * kg,
    spoil_ticks = 0.5 * hour,
    spoil_to_trigger_result =
    {
      items_per_trigger = 5, -- per 5 items the trigger is run
      trigger =
      {
        type = "direct",
        action_delivery =
        {
          type = "instant",
          source_effects =
          {
            {
              type = "create-entity",
              entity_name = "big-biter",
              affects_target = true,
              show_in_tooltip = true,
              as_enemy = true,
              find_non_colliding_position = true,
              offset_deviation = {{-1, -1}, {1, 1}},
              non_colliding_fail_result =
              {
                type = "direct",
                action_delivery =
                {
                  type = "instant",
                  source_effects =
                  {
                    {
                      type = "create-entity",
                      entity_name = "big-biter",
                      affects_target = true,
                      show_in_tooltip = false,
                      as_enemy = true,
                      offset_deviation = {{-1, -1}, {1, 1}},
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  },
  {
    type = "item",
    name = "pentapod-egg",
    icon = "__space-age__/graphics/icons/pentapod-egg.png",
    pictures =
    {
      { size = 64, filename = "__space-age__/graphics/icons/pentapod-egg.png", scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__space-age__/graphics/icons/pentapod-egg-1.png", scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__space-age__/graphics/icons/pentapod-egg-2.png", scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__space-age__/graphics/icons/pentapod-egg-3.png", scale = 0.5, mipmap_count = 4 },
    },
    fuel_category = "chemical",
    fuel_value = "5MJ",
    subgroup = "agriculture-products",
    order = "c[eggs]-b[pentapod-egg]",
    inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
    pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
    drop_sound = space_age_item_sounds.agriculture_inventory_move,
    stack_size = 20,
    weight = 5 * kg,
    spoil_ticks = 15 * minute,
    spoil_to_trigger_result =
    {
      items_per_trigger = 1,
      trigger =
      {
        type = "direct",
        action_delivery =
        {
          type = "instant",
          source_effects =
          {
            {
              type = "create-entity",
              entity_name = "big-wriggler-pentapod-premature",
              affects_target = true,
              show_in_tooltip = true,
              as_enemy = true,
              find_non_colliding_position = true,
              offset_deviation = {{-5, -5}, {5, 5}},
              non_colliding_fail_result =
              {
                type = "direct",
                action_delivery =
                {
                  type = "instant",
                  source_effects =
                  {
                    {
                      type = "create-entity",
                      entity_name = "big-wriggler-pentapod-premature",
                      affects_target = true,
                      show_in_tooltip = false,
                      as_enemy = true,
                      offset_deviation = {{-1, -1}, {1, 1}},
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  },
  {
    type = "item",
    name = "carbon-fiber",
    icon = "__space-age__/graphics/icons/carbon-fiber.png",
    subgroup = "agriculture-products",
    order = "a[organic-products]-e[carbon-fiber]",
    inventory_move_sound = item_sounds.resource_inventory_move,
    pick_sound = item_sounds.resource_inventory_pickup,
    drop_sound = item_sounds.resource_inventory_move,
    stack_size = 100,
    default_import_location = "gleba",
    weight = 2*kg,
    random_tint_color = item_tints.bluish_concrete
  },
  {
    type = "item",
    name = "stack-inserter",
    icon = "__space-age__/graphics/icons/stack-inserter.png",
    subgroup = "inserter",
    color_hint = { text = "S" },
    order = "h[stack-inserter]",
    inventory_move_sound = item_sounds.wire_inventory_move,
    pick_sound = item_sounds.wire_inventory_pickup,
    drop_sound = item_sounds.wire_inventory_move,
    place_result = "stack-inserter",
    stack_size = 50,
    default_import_location = "gleba",
    weight = 20*kg
  },
  {
    type = "item",
    name = "rocket-turret",
    icon = "__space-age__/graphics/icons/rocket-turret.png",
    subgroup = "turret",
    order = "b[turret]-e[rocket-turret]-a[turret]",
    inventory_move_sound = item_sounds.turret_inventory_move,
    pick_sound = item_sounds.turret_inventory_pickup,
    drop_sound = item_sounds.turret_inventory_move,
    place_result = "rocket-turret",
    stack_size = 10,
    weight = 100*kg
  },
  {
    type = "item",
    name = "holmium-ore",
    icon = "__space-age__/graphics/icons/holmium-ore.png",
    pictures =
    {
      { size = 64, filename = "__space-age__/graphics/icons/holmium-ore.png",   scale = 0.5, mipmap_count = 4 },
    },
    subgroup = "fulgora-processes",
    order = "b[holmium]-a[holmium-ore]",
    inventory_move_sound = item_sounds.resource_inventory_move,
    pick_sound = item_sounds.resource_inventory_pickup,
    drop_sound = item_sounds.resource_inventory_move,
    stack_size = 50,
    default_import_location = "fulgora",
    weight = 2*kg
  },
  {
    type = "item",
    name = "holmium-plate",
    icon = "__space-age__/graphics/icons/holmium-plate.png",
    subgroup = "fulgora-processes",
    order = "b[holmium]-c[holmium-plate]",
    inventory_move_sound = item_sounds.metal_small_inventory_move,
    pick_sound = item_sounds.metal_small_inventory_pickup,
    drop_sound = item_sounds.metal_small_inventory_move,
    stack_size = 100,
    default_import_location = "fulgora",
    weight = 1 * kg
  },
  {
    type = "item",
    name = "lithium",
    icon = "__space-age__/graphics/icons/lithium.png",
    subgroup = "aquilo-processes",
    order = "c[lithium]-a[lithium]",
    inventory_move_sound = item_sounds.resource_inventory_move,
    pick_sound = item_sounds.resource_inventory_pickup,
    drop_sound = item_sounds.resource_inventory_move,
    stack_size = 50,
    default_import_location = "aquilo",
    weight = 4*kg
  },
  {
    type = "item",
    name = "lithium-plate",
    icon = "__space-age__/graphics/icons/lithium-plate.png",
    subgroup = "aquilo-processes",
    order = "c[lithium]-b[lithium-plate]",
    inventory_move_sound = item_sounds.metal_small_inventory_move,
    pick_sound = item_sounds.metal_small_inventory_pickup,
    drop_sound = item_sounds.metal_small_inventory_move,
    stack_size = 100,
    default_import_location = "aquilo",
    weight = 2*kg
  },
  {
    type = "item",
    name = "scrap",
    icon = "__space-age__/graphics/icons/scrap.png",
    pictures =
    {
      { size = 64, filename = "__space-age__/graphics/icons/scrap.png",   scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__space-age__/graphics/icons/scrap-1.png", scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__space-age__/graphics/icons/scrap-2.png", scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__space-age__/graphics/icons/scrap-3.png", scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__space-age__/graphics/icons/scrap-4.png", scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__space-age__/graphics/icons/scrap-5.png", scale = 0.5, mipmap_count = 4 }
    },
    subgroup = "fulgora-processes",
    order = "a[scrap]-a[scrap]",
    inventory_move_sound = item_sounds.resource_inventory_move,
    pick_sound = item_sounds.resource_inventory_pickup,
    drop_sound = item_sounds.resource_inventory_move,
    stack_size = 50,
    default_import_location = "fulgora",
    weight = 2*kg
  },
  {
    type = "item",
    name = "lightning-rod",
    icon = "__space-age__/graphics/icons/lightning-rod.png",
    subgroup = "environmental-protection",
    order = "a[lightning-rod]",
    inventory_move_sound = item_sounds.electric_small_inventory_move,
    pick_sound = item_sounds.electric_small_inventory_pickup,
    drop_sound = item_sounds.electric_small_inventory_move,
    place_result = "lightning-rod",
    stack_size = 50,
    default_import_location = "fulgora",
    random_tint_color = item_tints.iron_rust
  },
  {
    type = "item",
    name = "lightning-collector",
    icon = "__space-age__/graphics/icons/lightning-collector.png",
    subgroup = "environmental-protection",
    order = "b[lightning-collector]",
    inventory_move_sound = item_sounds.electric_large_inventory_move,
    pick_sound = item_sounds.electric_large_inventory_pickup,
    drop_sound = item_sounds.electric_large_inventory_move,
    place_result = "lightning-collector",
    stack_size = 20,
    default_import_location = "fulgora",
    random_tint_color = item_tints.iron_rust
  },
  {
    type = "item",
    name = "heating-tower",
    icon = "__space-age__/graphics/icons/heating-tower.png",
    subgroup = "environmental-protection",
    order = "c[heating-tower]",
    inventory_move_sound = item_sounds.steam_inventory_move,
    pick_sound = item_sounds.steam_inventory_pickup,
    drop_sound = item_sounds.steam_inventory_move,
    place_result = "heating-tower",
    stack_size = 20,
    weight = 100*kg
  },
  {
    type = "item",
    name = "electromagnetic-plant",
    icon = "__space-age__/graphics/icons/electromagnetic-plant.png",
    subgroup = "production-machine",
    order = "g[electromagnetic-plant]",
    inventory_move_sound = item_sounds.electric_large_inventory_move,
    pick_sound = item_sounds.electric_large_inventory_pickup,
    drop_sound = item_sounds.electric_large_inventory_move,
    place_result = "electromagnetic-plant",
    stack_size = 20,
    default_import_location = "fulgora",
    weight = 200 * kg
  },
  {
    type = "item",
    name = "superconductor",
    icon = "__space-age__/graphics/icons/superconductor.png",
    subgroup = "fulgora-processes",
    order = "b[holmium]-d[superconductor]",
    inventory_move_sound = item_sounds.wire_inventory_move,
    pick_sound = item_sounds.wire_inventory_pickup,
    drop_sound = item_sounds.wire_inventory_move,
    stack_size = 200,
    default_import_location = "fulgora",
    ingredient_to_weight_coefficient = 0.6
  },
  {
    type = "item",
    name = "supercapacitor",
    icon = "__space-age__/graphics/icons/supercapacitor.png",
    subgroup = "fulgora-processes",
    order = "b[holmium]-f[supercapacitor]",
    inventory_move_sound = item_sounds.electric_small_inventory_move,
    pick_sound = item_sounds.electric_small_inventory_pickup,
    drop_sound = item_sounds.electric_small_inventory_move,
    default_import_location = "fulgora",
    stack_size = 100,
    weight = 2 * kg
  },
  {
    type = "gun",
    name = "teslagun",
    icon = "__space-age__/graphics/icons/teslagun.png",
    subgroup = "gun",
    order = "a[basic-clips]-h[teslagun]",
    inventory_move_sound = item_sounds.weapon_large_inventory_move,
    pick_sound = item_sounds.weapon_large_inventory_pickup,
    drop_sound = item_sounds.weapon_large_inventory_move,
    attack_parameters =
    {
      type = "beam",
      ammo_category = "tesla",
      cooldown = 60,
      movement_slow_down_factor = 0.25,
      source_offset = {0.1, -0.75},
      source_direction_count = 8,
      range = 24
    },
    default_import_location = "fulgora",
    stack_size = 5
  },
  {
    type = "item",
    name = "tesla-turret",
    icon = "__space-age__/graphics/icons/tesla-turret.png",
    subgroup = "turret",
    order = "b[turret]-f[tesla-turret]-a[turret]",
    inventory_move_sound = item_sounds.turret_inventory_move,
    pick_sound = item_sounds.turret_inventory_pickup,
    drop_sound = item_sounds.turret_inventory_move,
    place_result = "tesla-turret",
    stack_size = 10,
    default_import_location = "fulgora",
    weight = 100*kg
  },
  {
    type = "ammo",
    name = "tesla-ammo",
    icon = "__space-age__/graphics/icons/tesla-ammo.png",
    ammo_category = "tesla",
    ammo_type =
    {
      target_type = "entity",
      action =
      {
        type = "direct",
        action_delivery =
        {
          type = "instant",
          target_effects =
          {
            -- Chain effect must go first in case the beam kills the target
            {
              type = "nested-result",
              action =
              {
                type = "direct",
                action_delivery =
                {
                  type = "chain",
                  chain = "chain-tesla-gun-chain",
                }
              }
            },
            {
              type = "nested-result",
              action =
              {
                type = "direct",
                action_delivery =
                {
                  type = "beam",
                  beam = "chain-tesla-gun-beam-start",
                  max_length = 30,
                  duration = 30,
                  add_to_shooter = false,
                  destroy_with_source_or_target = false
                }
              }
            }
          }
        }
      }
    },
    subgroup = "ammo",
    order = "e[railgun-ammo]-a[basic]",
    inventory_move_sound = item_sounds.ammo_large_inventory_move,
    pick_sound = item_sounds.ammo_large_inventory_pickup,
    drop_sound = item_sounds.ammo_large_inventory_move,
    stack_size = 100,
    default_import_location = "fulgora",
    magazine_size = 10
  },
  {
    type = "item",
    name = "quantum-processor",
    icon = "__space-age__/graphics/icons/quantum-processor.png",
    subgroup = "aquilo-processes",
    order = "c[lithium]-c[quantum-processor]",
    inventory_move_sound = item_sounds.electric_small_inventory_move,
    pick_sound = item_sounds.electric_small_inventory_pickup,
    drop_sound = item_sounds.electric_small_inventory_move,
    stack_size = 100,
    default_import_location = "aquilo",
    weight = 5*kg
  },
  {
    type = "item",
    name = "fusion-reactor-equipment",
    icon = "__space-age__/graphics/icons/fusion-reactor-equipment.png",
    place_as_equipment_result = "fusion-reactor-equipment",
    subgroup = "equipment",
    order = "a[energy-source]-c[fusion-reactor]",
    inventory_move_sound = item_sounds.reactor_inventory_move,
    pick_sound = item_sounds.reactor_inventory_pickup,
    drop_sound = item_sounds.reactor_inventory_move,
    stack_size = 20,
    weight = 1 * tons,
  },
  {
    type = "item",
    name = "fusion-power-cell",
    icon = "__space-age__/graphics/icons/fusion-power-cell.png",
    subgroup = "aquilo-processes",
    order = "c[lithium]-d[fusion-power-cell]",
    inventory_move_sound = item_sounds.reactor_inventory_move,
    pick_sound = item_sounds.reactor_inventory_pickup,
    drop_sound = item_sounds.reactor_inventory_move,
    fuel_value = "40GJ",
    fuel_category = "fusion",
    stack_size = 50,
    default_import_location = "aquilo",
    weight = 20*kg
  },
  {
    type = "item",
    name = "fusion-reactor",
    icon = "__space-age__/graphics/icons/fusion-reactor.png",
    subgroup = "energy",
    order = "g[fusion-energy]-a[reactor]",
    inventory_move_sound = item_sounds.reactor_inventory_move,
    pick_sound = item_sounds.reactor_inventory_pickup,
    drop_sound = item_sounds.reactor_inventory_move,
    place_result = "fusion-reactor",
    weight = 1 * tons,
    stack_size = 1,
    default_import_location = "aquilo"
  },
  {
    type = "item",
    name = "fusion-generator",
    icon = "__space-age__/graphics/icons/fusion-generator.png",
    subgroup = "energy",
    order = "g[fusion-energy]-b[generator]",
    inventory_move_sound = item_sounds.reactor_inventory_move,
    pick_sound = item_sounds.reactor_inventory_pickup,
    drop_sound = item_sounds.reactor_inventory_move,
    place_result = "fusion-generator",
    weight = 200 * kg,
    stack_size = 5,
    default_import_location = "aquilo"
  },
  {
    type = "item",
    name = "cryogenic-plant",
    icon = "__space-age__/graphics/icons/cryogenic-plant.png",
    subgroup = "production-machine",
    order = "h[cryogenic-plant]",
    inventory_move_sound = item_sounds.mechanical_large_inventory_move,
    pick_sound = item_sounds.mechanical_large_inventory_pickup,
    drop_sound = item_sounds.mechanical_large_inventory_move,
    place_result = "cryogenic-plant",
    stack_size = 20,
    default_import_location = "aquilo",
    weight = 200 * kg
  },
  {
    type = "item",
    name = "spoilage",
    icon = "__space-age__/graphics/icons/spoilage.png",
    pictures =
    {
      { size = 64, filename = "__space-age__/graphics/icons/spoilage.png", scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__space-age__/graphics/icons/spoilage-1.png", scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__space-age__/graphics/icons/spoilage-2.png", scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__space-age__/graphics/icons/spoilage-3.png", scale = 0.5, mipmap_count = 4 },
    },
    fuel_value = "250kJ",
    fuel_category = "chemical",
    fuel_acceleration_multiplier = 0.5,
    fuel_top_speed_multiplier = 0.5,
    subgroup = "agriculture-processes",
    order = "c[nutrients]-a[spoilage]",
    inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
    pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
    drop_sound = space_age_item_sounds.agriculture_inventory_move,
    stack_size = 200,
    weight = 0.5 * kg,
    random_tint_color = item_tints.organic_green,
    spoil_level = 1
  },
  {
    type = "item",
    name = "ice-platform",
    icon = "__space-age__/graphics/icons/ice-platform.png",
    subgroup = "terrain",
    order = "c[landfill]-f[ice-platform]",
    inventory_move_sound = space_age_item_sounds.ice_inventory_move,
    pick_sound = space_age_item_sounds.ice_inventory_pickup,
    drop_sound = space_age_item_sounds.ice_inventory_move,
    stack_size = 100,
    default_import_location = "aquilo",
    weight = 10*kg,
    place_as_tile =
    {
      result = "ice-platform",
      condition_size = 1,
      condition = {layers={ground_tile=true}},
      tile_condition = {"ammoniacal-ocean", "ammoniacal-ocean-2", "brash-ice"}
    }
  },
  {
    type = "item",
    name = "foundation",
    icon = "__space-age__/graphics/icons/foundation.png",
    subgroup = "terrain",
    order = "c[landfill]-g[foundation]",
    inventory_move_sound = item_sounds.metal_large_inventory_move,
    pick_sound = item_sounds.metal_large_inventory_pickup,
    drop_sound = item_sounds.metal_large_inventory_move,
    stack_size = 50,
    default_import_location = "aquilo",
    weight = 20*kg,
    place_as_tile =
    {
      result = "foundation",
      condition_size = 1,
      condition = {layers={}},
      tile_condition =
      {
        "water", "deepwater", "water-green", "deepwater-green", -- all water
        "water-mud", "water-shallow", -- all shallows
        "wetland-light-green-slime", "wetland-green-slime", "wetland-light-dead-skin", "wetland-dead-skin", "wetland-pink-tentacle", "wetland-red-tentacle", "wetland-yumako", "wetland-jellynut",
        "oil-ocean-shallow", "oil-ocean-deep", -- all oil ocean
        "lava", "lava-hot", -- all lava
        -- not ammoniacal ocean
      }
    }
  },
  {
    type = "item",
    name = "space-platform-hub",
    icon = "__space-age__/graphics/icons/space-platform-hub.png",
    hidden = true,
    subgroup = "space-related",
    place_result = "space-platform-hub",
    stack_size = 1,
    weight = 1*tons
  },
  {
    type = "item",
    name = "tree-seed",
    localised_name = {"item-name.tree-seed"},
    icon = "__space-age__/graphics/icons/tree-seed.png",
    pictures =
    {
      { size = 64, filename = "__space-age__/graphics/icons/tree-seed-1.png", scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__space-age__/graphics/icons/tree-seed-2.png", scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__space-age__/graphics/icons/tree-seed-3.png", scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__space-age__/graphics/icons/tree-seed-4.png", scale = 0.5, mipmap_count = 4 },
    },
    subgroup = "agriculture-processes",
    order = "a[seeds]-c[tree-seed]",
    plant_result = "tree-plant",
    place_result = "tree-plant",
    inventory_move_sound = item_sounds.wood_inventory_move,
    pick_sound = item_sounds.wood_inventory_pickup,
    drop_sound = item_sounds.wood_inventory_move,
    stack_size = 10,
    weight = 10 * kg,
    fuel_category = "chemical",
    fuel_value = "100kJ"
  },
}
)
