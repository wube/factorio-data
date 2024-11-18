local hit_effects = require ("__base__.prototypes.entity.hit-effects")
local sounds = require ("__base__.prototypes.entity.sounds")
local decorative_trigger_effects = require("__base__.prototypes.decorative.decorative-trigger-effects")
local simulations = require("__space-age__.prototypes.factoriopedia-simulations")

local function fulgora_ruin(args)
  local ruin = {}
  ruin.name = args.name
  ruin.type = "simple-entity"
  ruin.flags = {"placeable-neutral", "placeable-off-grid"}
  ruin.icon = "__space-age__/graphics/icons/"..args.name..".png"
  ruin.subgroup = "grass"
  ruin.order = "b[decorative]-l[rock]-j[ruin]-" .. (args.order or "a")
  ruin.collision_box = args.collision_box or {{-1,-1}, {1,1}}
  ruin.selection_box = args.selection_box or {{ruin.collision_box[1][1]-0.2, ruin.collision_box[1][2]-0.2}, {ruin.collision_box[2][1]+0.2, ruin.collision_box[2][2]+0.2}}
  ruin.damaged_trigger_effect = hit_effects.rock()
  ruin.dying_trigger_effect = decorative_trigger_effects.huge_rock()
  local collision_area = (ruin.collision_box[2][1] - ruin.collision_box[1][1]) * (ruin.collision_box[2][2] - ruin.collision_box[1][2])

  ruin.minable =
  {
    mining_particle = "stone-particle",
    mining_time = 0.3 * collision_area ^ 0.75,
    results =
    {
      {type = "item", name = "scrap", amount_min = math.ceil(collision_area), amount_max = math.ceil(collision_area * 4)},
      {type = "item", name = "steel-plate", amount_min = math.ceil(collision_area), amount_max = math.ceil(collision_area)},
      {type = "item", name = "iron-gear-wheel", amount_min = math.ceil(collision_area), amount_max = math.ceil(collision_area)},
      {type = "item", name = "iron-stick", amount_min = math.ceil(collision_area*0.5), amount_max = math.ceil(collision_area*0.5)},
      {type = "item", name = "copper-cable", amount_min = math.ceil(collision_area), amount_max = math.ceil(collision_area)},
      {type = "item", name = "stone", amount_min = math.ceil(collision_area), amount_max = math.ceil(collision_area)}
    }
  }
  ruin.map_color = args.map_color or {130, 130, 130}
  ruin.impact_category = "stone"
  ruin.max_health = 3000
  ruin.resistances =
  {
    { type = "fire",  percent = 100 },
    { type = "electric", percent = 100 }
  }
  ruin.autoplace = args.autoplace or {probability_expression = 0}
  local spritesheets = args.pictures or {{path = args.name, frame_count = (args.frame_count or 1)}}
  for _, spritesheet in pairs(spritesheets) do
    spritesheet.path = "__space-age__/graphics/decorative/fulgoran-ruin/"..spritesheet.path
    spritesheet.dice_y = args.dice_y
  end
  ruin.pictures = util.spritesheets_to_pictures(spritesheets)

  return ruin
end

data:extend(
{
  {
    type = "optimized-decorative",
    name = "fulgoran-ruin-tiny",
    order = "a[fulgora]-b[decorative]",
    collision_box = {{-0.45, -0.45}, {0.45, 0.45}},
    collision_mask = {layers={object=true}, colliding_with_tiles_only=true},
    walking_sound = sounds.pebble,
    pictures = util.spritesheets_to_pictures({{path = "__space-age__/graphics/decorative/fulgoran-ruin/fulgoran-ruin-tiny", frame_count = 35,     scale = 0.3}}),
    autoplace = {
      order = "a[ruin]-i[tiny]",
      placement_density = 2,
      -- keep above oil ocean, allow in oil sand
      probability_expression = "0.0005 * fulgora_oil_mask * (fulgora_elevation > -10)\z
                                + (1 - fulgora_oil_mask)\z
                                * (0.005 * (0.1 * fulgora_natural_mask + fulgora_mesa)\z
                                   + (0.04 + 0.01 * fulgora_decorative_machine_density)\z
                                   * (fulgora_artificial_mask + 0.2 * fulgora_mesa * max(0, fulgora_scrap_medium)))"
    }
  },
  fulgora_ruin({
    name = "fulgoran-ruin-small",
    order = "b[decorative]-l[rock]-j[ruin]-b[small]",
    collision_box = {{-0.77, -0.68}, {0.77, 0.68}},
    map_color = {110, 110, 110, 128},
    pictures = {
      {path = "fulgoran-ruin-small", frame_count = 26},
      {path = "fulgoran-ruin-small-tall", frame_count = 7},
    },
    autoplace = {
      order = "a[ruin]-h[small]",
      probability_expression = "0.0005 * (0.1 * fulgora_natural_mask + fulgora_mesa)\z
                                + (0.005 + 0.005 * (fulgora_decorative_machine_density - 0.1))\z
                                * (fulgora_artificial_mask + 0.2 * fulgora_mesa * max(0, fulgora_scrap_medium))"
    }
  }),
  fulgora_ruin({
    name = "fulgoran-ruin-medium",
    order = "b[decorative]-l[rock]-j[ruin]-c[medium]",
    collision_box = {{-1.21, -0.86}, {1.21, 0.86}},
    map_color = {115, 115, 115, 128},
    pictures = {
      {path = "fulgoran-ruin-medium", frame_count = 8},
      {path = "fulgoran-ruin-medium-tall", frame_count = 4},
    },
    autoplace = {
      order = "a[ruin]-g[medium]",
      probability_expression = "0.0001 * (0.1 * fulgora_natural_mask )\z
                                + (0.001 + 0.006 * (fulgora_decorative_machine_density - 0.3))\z
                                * (fulgora_artificial_mask + 0.2 * fulgora_mesa * max(0, fulgora_scrap_medium))"
    }
  }),
  fulgora_ruin({
    name = "fulgoran-ruin-stonehenge",
    order = "b[decorative]-l[rock]-j[ruin]-d[stonehenge]",
    collision_box = {{-1.56, -1.32}, {1.56, 1.32}},
    map_color = {120, 120, 120, 128},
    frame_count = 8,
    autoplace = {
      order = "a[ruin]-f[stonehenge]",
      probability_expression = "0.0005 * fulgora_artificial_mask + 0.004 * (fulgora_decorative_machine_density - 1.5)"
    }
  }),
  fulgora_ruin({
    name = "fulgoran-ruin-big",
    order = "b[decorative]-l[rock]-j[ruin]-e[big]",
    collision_box = {{-1.77, -1.49}, {1.77, 1.49}},
    map_color = {120, 120, 120, 128},
    frame_count = 7,
    autoplace = {
      order = "a[ruin]-e[big]",
      probability_expression = "0.0001 * fulgora_artificial_mask + 0.003 * (fulgora_decorative_machine_density - 2)"
    }
  }),
  fulgora_ruin({
    name = "fulgoran-ruin-huge",
    order = "b[decorative]-l[rock]-j[ruin]-f[huge]",
    collision_box = {{-2.78, -2.33}, {2.78, 2.33}},
    map_color = {125, 125, 125, 128},
    pictures = {
      {path = "fulgoran-ruin-huge", frame_count = 8},
      {path = "fulgoran-ruin-huge-tall", frame_count = 3},
    },
    dice_y = 2,
    autoplace = {
      order = "a[ruin]-d[huge]",
      probability_expression = "0.0001 * fulgora_artificial_mask + 0.002 * (fulgora_decorative_machine_density - 3)"
    }
  }),
  fulgora_ruin({
    name = "fulgoran-ruin-colossal",
    order = "b[decorative]-l[rock]-j[ruin]-f[colossal]",
    frame_count = 3,
    dice_y = 2,
    collision_box = {{-3.47, -2.66}, {3.47, 2.66}},
    map_color = {130, 130, 130, 128},
    autoplace = {
      order = "a[ruin]-c[colossal]",
      probability_expression = "0.0001 * fulgora_artificial_mask + 0.001 * (fulgora_decorative_machine_density - 4)"
    }
  }),
  fulgora_ruin({
    name = "fulgoran-ruin-vault",
    order = "b[decorative]-l[rock]-j[ruin]-g[vault]",
    frame_count = 1,
    dice_y = 2,
    collision_box = {{-6.88, -4}, {6.88, 4}},
    map_color = {255, 255, 255, 128},
    autoplace = {
      order = "a[ruin]-a[vault]",
      probability_expression = "(min(fulgora_spots, (1 - fulgora_starting_vault_cone) / 2) < 0.015) * min(fulgora_vaults_and_starting_vault, 1 - fulgora_starting_mask)"
    }
  }),
  {
    type = "lightning-attractor",
    name = "fulgoran-ruin-attractor",
    efficiency = 0,
    range_elongation = 20.0,
    icon = "__space-age__/graphics/icons/fulgoran-ruin-attractor.png",
    flags = {"placeable-neutral", "player-creation", "not-upgradable"},
    minable =
    {
      mining_time = 0.2,
      results =
      {
        {type = "item", name = "scrap", amount = 8},
        {type = "item", name = "copper-cable", amount = 6},
        {type = "item", name = "steel-plate", amount = 4},
        {type = "item", name = "stone-brick", amount = 2},
      },
      include_in_show_counts = true
    },
    subgroup = "grass",
    order = "b[decorative]-l[rock]-j[ruin]-h[attractor]",
    factoriopedia_simulation = simulations.factoriopedia_fulgoran_ruin_attractor,
    autoplace = {
      order = "a[ruin]-b[attractor]",
      probability_expression = "min(place_every_n(15,15,1,1),\z
                                    0.1 * fulgora_artificial_mask + 0.2 * (fulgora_decorative_machine_density - 1.5))\z
                                + max(0, 10 * (1.5 - distance))",
      force = "player" -- otherwise it would be neutral and players were complaining it cannot be deconstructed as it is entity of different force
    },
    max_health = 100,
    dying_explosion = "medium-electric-pole-explosion",
    resistances =
    {
      {
        type = "fire",
        percent = 90
      },
      {
        type = "electric",
        percent = 100
      }
    },
    collision_box = {{-1.21, -1.21}, {1.21, 1.21}},
    selection_box = {{-1.21, -1.21}, {1.21, 1.21}},
    lightning_strike_offset = {0.5, -4.0},
    damaged_trigger_effect = hit_effects.entity({{-0.2, -2.2},{0.2, 0.2}}),
    drawing_box_vertical_extension = 4,
    open_sound = sounds.electric_network_open,
    close_sound = sounds.electric_network_close,
    stateless_visualisation =
    {
      period = 0,
      animation =
      {
        sheet =
          util.sprite_load("__space-age__/graphics/decorative/fulgoran-ruin/fulgoran-ruin-attractor",
          {
            frame_count = 1,
            shift = {0, 0.5},
            scale = 0.5,
            variation_count = 4,
          })
      },
    },
    chargable_graphics =
    {
      charge_animation = table.deepcopy(data.raw["lightning-attractor"]["lightning-rod"].chargable_graphics.charge_animation),
      charge_animation_is_looped = false,
      charge_cooldown = 30,
      discharge_animation = table.deepcopy(data.raw["lightning-attractor"]["lightning-rod"].chargable_graphics.discharge_animation),
      discharge_cooldown = 60
      --todo: charge light
      --todo: discharge light
    },
    water_reflection =
    {
      pictures =
      {
        filename = "__space-age__/graphics/entity/lightning-rod/lightning-rod.png",
        priority = "extra-high",
        width = 12,
        height = 28,
        shift = util.by_pixel(0, 55),
        variation_count = 1,
        scale = 5
      },
      rotate = false,
      orientation_to_variation = false
    }
  },
  {
    type = "optimized-decorative",
    name = "fulgoran-gravewort",
    order = "a[fulgora]-b[decorative]",
    collision_box = {{-0.5, -0.5}, {0.5, 0.5}},
    collision_mask = {layers={water_tile=true}, colliding_with_tiles_only=true},
    walking_sound = sounds.grass,
    autoplace = {
      probability_expression = "min(0.1, fulgora_natural_mask * max(0, fulgora_scrap_medium + fulgora_rock - fulgora_basis_oil - 2.5))",
    },
    pictures = util.spritesheets_to_pictures({{path = "__space-age__/graphics/decorative/fulgoran-gravewort/fulgoran-gravewort", frame_count = 7}})
  },
  {
    type = "optimized-decorative",
    name = "urchin-cactus",
    order = "a[fulgora]-b[decorative]",
    collision_box = {{-0.5, -0.5}, {0.5, 0.5}},
    collision_mask = {layers={water_tile=true}, colliding_with_tiles_only=true},
    walking_sound = sounds.grass,
    autoplace = {
      placement_density = 2,
      probability_expression = "min(0.1, fulgora_natural_mask * max(0, fulgora_scrap_medium - fulgora_rock - 0.75))",
    },
    pictures = util.spritesheets_to_pictures({{path = "__space-age__/graphics/decorative/urchin-cactus/urchin-cactus", frame_count = 3}})
  },
  {
    type = "simple-entity",
    name = "fulgurite-small",
    flags = {"placeable-neutral", "placeable-off-grid"},
    icon = "__space-age__/graphics/icons/fulgurite-small.png",
    subgroup = "grass",
    order = "b[decorative]-l[rock]-i[fulgurite]",
    collision_box = {{-0.5, -0.5}, {0.5, 0.5}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    drawing_box_vertical_extension = 1,
    damaged_trigger_effect = hit_effects.rock(),
    dying_trigger_effect = decorative_trigger_effects.huge_rock(),
    minable =
    {
      mining_particle = "stone-particle",
      mining_time = 0.5,
      results =
      {
        {type = "item", name = "stone", amount_min = 8, amount_max = 16},
        {type = "item", name = "holmium-ore", amount_min = 3, amount_max = 7}
      }
    },
    map_color = {194, 41, 116, 64},
    count_as_rock_for_filtered_deconstruction = true,
    mined_sound = { filename = "__base__/sound/deconstruct-bricks.ogg" },
    impact_category = "stone",
    render_layer = "object",
    max_health = 70,
    resistances =
    {
      { type = "fire",  percent = 100 },
      { type = "electric", percent = 100 }
    },
    autoplace =
    {
      probability_expression = 0,
    },
    pictures = util.spritesheets_to_pictures({{path = "__space-age__/graphics/decorative/fulgurite/fulgurite-small", frame_count = 8}})
  },
  {
    type = "simple-entity",
    name = "fulgurite",
    flags = {"placeable-neutral", "placeable-off-grid"},
    icon = "__space-age__/graphics/icons/fulgurite.png",
    subgroup = "grass",
    order = "b[decorative]-l[rock]-i[fulgurite]",
    collision_box = {{-1.0, -0.9}, {1.0, 0.9}},
    selection_box = {{-1.2, -1.1}, {1.2, 1.1}},
    drawing_box_vertical_extension = 1,
    damaged_trigger_effect = hit_effects.rock(),
    dying_trigger_effect = decorative_trigger_effects.huge_rock(),
    minable =
    {
      mining_particle = "stone-particle",
      mining_time = 3,
      results =
      {
        {type = "item", name = "stone", amount_min = 8, amount_max = 12},
        {type = "item", name = "holmium-ore", amount_min = 4, amount_max = 8}
      }
    },
    map_color = {194, 41, 116, 64},
    count_as_rock_for_filtered_deconstruction = true,
    mined_sound = { filename = "__base__/sound/deconstruct-bricks.ogg" },
    impact_category = "stone",
    render_layer = "object",
    max_health = 200,
    resistances =
    {
      { type = "fire",  percent = 100 },
      { type = "electric", percent = 100 }
    },
    autoplace =
    {
      probability_expression = "min(0.1, fulgora_natural_mask * max(0, -fulgora_scrap_medium - fulgora_rock - 0.8))",
    },
    created_effect = {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        source_effects =
        {
          {
            type = "create-entity",
            entity_name = "fulgurite-small",
            offsets = {{1.7, 0.5}},
            probability = 0.15
          },
          {
            type = "create-entity",
            entity_name = "fulgurite-small",
            offsets = {{-1.6, -0.2}},
            probability = 0.15
          },
          {
            type = "create-entity",
            entity_name = "fulgurite-small",
            offsets = {{0.3, 1.6}},
            probability = 0.15
          },
          {
            type = "create-entity",
            entity_name = "fulgurite-small",
            offsets = {{0, -1.2}},
            probability = 0.15
          },
          {
            type = "create-entity",
            entity_name = "fulgurite-small",
            offsets = {{1.4, 1.4}},
            probability = 0.15
          },
          {
            type = "create-entity",
            entity_name = "fulgurite-small",
            offsets = {{-1.2, -1.4}},
            probability = 0.15
          },
          {
            type = "create-entity",
            entity_name = "fulgurite-small",
            offsets = {{-0.8, 1.4}},
            probability = 0.15
          },
          {
            type = "create-entity",
            entity_name = "fulgurite-small",
            offsets = {{1.2, -0.9}},
            probability = 0.15
          },
          {
            type = "create-entity",
            entity_name = "fulgurite-small",
            offsets = {{2.4,1.8}},
            probability = 0.15
          },
          {
            type = "create-entity",
            entity_name = "fulgurite-small",
            offsets = {{2.7,-0.5}},
            probability = 0.15
          },
          {
            type = "create-entity",
            entity_name = "fulgurite-small",
            offsets = {{-2.6,1}},
            probability = 0.15
          },
          {
            type = "create-entity",
            entity_name = "fulgurite-small",
            offsets = {{-2.5,-0.7}},
            probability = 0.15
          },
        }
      }
    },
    pictures = util.spritesheets_to_pictures({{path = "__space-age__/graphics/decorative/fulgurite/fulgurite", frame_count = 6}})
  },
}
)

-- local funcgora_rock_tint = { r = 243, g = 203, b = 255} -- close but over saturated highlights
local rocks = {
  ["big-fulgora-rock"] = data.raw["simple-entity"]["big-sand-rock"],
  ["medium-fulgora-rock"] = data.raw["optimized-decorative"]["medium-sand-rock"],
  ["small-fulgora-rock"] = data.raw["optimized-decorative"]["small-sand-rock"],
  ["tiny-fulgora-rock"] = data.raw["optimized-decorative"]["tiny-rock"]
}
local i = 0
for name, original in pairs(rocks) do
  i = i + 1
  local rock = table.deepcopy(original)
  rock.name = name
  if name == "big-fulgora-rock" then
    rock.order = "b[decorative]-l[rock]-j[ruin]-a[" .. name .. "]"
    rock.icon = "__space-age__/graphics/icons/" .. name .. ".png"
  end
  for j, picture in pairs(rock.pictures) do
    picture.filename = "__space-age__/graphics/decorative/fulgora-rock/" .. name .. "-".. string.format("%02d", j) ..".png"
  end
  rock.autoplace = {
    order = "r[rock]-" .. i,
    probability_expression = "(1 - fulgora_oil_mask) * (fulgora_natural_mask + fulgora_mesa)\z
                              * min(" ..(0.1 * i - 0.05)..",\z
                                    0.3 * " .. i .. " - 2.4 + fulgora_rock - 0.5 * fulgora_mix_oil + 0.7 * fulgora_basis_oil)"
  }
  data:extend({rock})
end
