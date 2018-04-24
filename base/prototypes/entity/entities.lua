require ("util")
require ("prototypes.entity.demo-rail-pictures")
require ("prototypes.entity.demo-pipecovers")
require ("prototypes.entity.demo-transport-belt-pictures")
require ("prototypes.entity.transport-belt-pictures")
require ("prototypes.entity.demo-circuit-connector-sprites")
require ("prototypes.entity.assemblerpipes")
require ("prototypes.entity.demo-player-animations")
require ("prototypes.entity.laser-sounds")
require ("prototypes.entity.demo-gunshot-sounds")

rail_pictures = function()
  return rail_pictures_internal({{"metals", "metals", mipmap = true},
                                 {"backplates", "backplates", mipmap = true},
                                 {"ties", "ties", variations = 3},
                                 {"stone_path", "stone-path", variations = 3},
                                 {"stone_path_background", "stone-path-background", variations = 3}})
end

standard_train_wheels =
{
  priority = "very-low",
  width = 115,
  height = 115,
  direction_count = 256,
  filenames =
  {
    "__base__/graphics/entity/diesel-locomotive/train-wheels-01.png",
    "__base__/graphics/entity/diesel-locomotive/train-wheels-02.png"
  },
  line_length = 8,
  lines_per_file = 16,
  hr_version =
    {
    priority = "very-low",
    width = 229,
    height = 227,
    direction_count = 256,
    filenames =
    {
      "__base__/graphics/entity/diesel-locomotive/hr-train-wheels-1.png",
      "__base__/graphics/entity/diesel-locomotive/hr-train-wheels-2.png",
      "__base__/graphics/entity/diesel-locomotive/hr-train-wheels-3.png",
      "__base__/graphics/entity/diesel-locomotive/hr-train-wheels-4.png",
      "__base__/graphics/entity/diesel-locomotive/hr-train-wheels-5.png",
      "__base__/graphics/entity/diesel-locomotive/hr-train-wheels-6.png",
      "__base__/graphics/entity/diesel-locomotive/hr-train-wheels-7.png",
      "__base__/graphics/entity/diesel-locomotive/hr-train-wheels-8.png",
    },
    line_length = 4,
    lines_per_file = 8,
    --shift = {0.015625, -0.453125}, original shifting from spritesheeter (likely needs doubling or halving)
    scale = 0.5
    }
}

function drive_over_tie()
  return {
    type = "play-sound",
    sound =
    {
      {
        filename = "__base__/sound/train-tie-1.ogg",
        volume = 0.6
      },
      {
        filename = "__base__/sound/train-tie-2.ogg",
        volume = 0.6
      },
      {
        filename = "__base__/sound/train-tie-3.ogg",
        volume = 0.6
      },
      {
        filename = "__base__/sound/train-tie-4.ogg",
        volume = 0.6
      },
    }
  }
end

function flying_robot_sounds()
  return
  {
    sound =
    {
      { filename = "__base__/sound/flying-robot-1.ogg", volume = 0.6 },
      { filename = "__base__/sound/flying-robot-2.ogg", volume = 0.6 },
      { filename = "__base__/sound/flying-robot-3.ogg", volume = 0.6 },
      { filename = "__base__/sound/flying-robot-4.ogg", volume = 0.6 },
      { filename = "__base__/sound/flying-robot-5.ogg", volume = 0.6 }
    },
    max_sounds_per_type = 3,
    audible_distance_modifier = 0.5,
    probability = 1 / (3 * 60) -- average pause between the sound is 3 seconds
  }
end

function crash_trigger()
  return {
    type = "play-sound",
    sound =
    {
      {
        filename = "__base__/sound/car-crash.ogg",
        volume = 0.4
      },
    }
  }
end

function rolling_stock_back_light()
  return
  {
    {
      minimum_darkness = 0.3,
      color = { r = 1, g = 0.1, b = 0.05, a = 0 },
      shift = {-0.6, 3.5},
      size = 2,
      intensity = 0.6,
      add_perspective = true
    },
    {
      minimum_darkness = 0.3,
      color = { r = 1, g = 0.1, b = 0.05, a = 0 },
      shift = {0.6, 3.5},
      size = 2,
      intensity = 0.6,
      add_perspective = true
    }
  }
end

function rolling_stock_stand_by_light()
  return
  {
    {
      minimum_darkness = 0.3,
      color = { r = 0.05, g = 0.2, b = 1, a = 0 },
      shift = {-0.6, -3.5},
      size = 2,
      intensity = 0.5,
      add_perspective = true
    },
    {
      minimum_darkness = 0.3,
      color = { r = 0.05, g = 0.2, b = 1, a = 0 },
      shift = {0.6, -3.5},
      size = 2,
      intensity = 0.5,
      add_perspective = true
    }
  }
end

function make_4way_animation_from_spritesheet(animation)
  local function make_animation_layer(idx, anim)
    return {
      filename = anim.filename,
      priority = anim.priority or "high",
      x = idx * anim.width,
      width = anim.width,
      height = anim.height,
      frame_count = anim.frame_count or 1,
      line_length = anim.line_length,
      shift = anim.shift,
      draw_as_shadow = anim.draw_as_shadow,
      apply_runtime_tint = anim.apply_runtime_tint,
      scale = anim.scale or 1
    }
  end

  local function make_animation_layer_with_hr_version(idx, anim)
    local anim_parameters = make_animation_layer(idx, anim)
    if anim.hr_version and anim.hr_version.filename then
      anim_parameters.hr_version = make_animation_layer(idx, anim.hr_version)
    end
    return anim_parameters
  end

  local function make_animation(idx)
    if animation.layers then
      local tab = { layers = {} }
      for k,v in ipairs(animation.layers) do
        table.insert(tab.layers, make_animation_layer_with_hr_version(idx, v))
      end
      return tab
    else
      return make_animation_layer_with_hr_version(idx, animation)
    end
  end

  return
  {
    north = make_animation(0),
    east = make_animation(1),
    south = make_animation(2),
    west = make_animation(3)
  }
end

function make_heat_pipe_pictures(path, name_prefix, data)
  local all_pictures = {}
  for key, t in pairs(data) do
    if t.empty then
      all_pictures[key] = { priority = "extra-high", filename = "__core__/graphics/empty.png", width = 1, height = 1 }
    else
      local tile_pictures = {}
      for i = 1, (t.variations or 1) do
        local sprite = {
          priority = "extra-high",
          filename = path .. name_prefix .. "-" .. (t.name or string.gsub(key, "_", "-")) .. (t.ommit_number and ".png" or ("-" .. tostring(i) .. ".png")),
          width = (t.width or 32),
          height = (t.height or 32),
          shift = t.shift,
          hr_version =
          {
            priority = "extra-high",
            filename = path .. "hr-" .. name_prefix .. "-" .. (t.name or string.gsub(key, "_", "-")) .. (t.ommit_number and ".png" or ("-" .. tostring(i) .. ".png")),
            width = (t.width or 32) * 2,
            height = (t.height or 32) * 2,
            scale = 0.5,
            shift = t.shift,
          }
        }
        table.insert(tile_pictures, sprite)
      end
      all_pictures[key] = tile_pictures
    end
  end
  return all_pictures
end

-- add heavy armor to the player animations
for _, animation in ipairs(data.raw["player"]["player"]["animations"]) do
  if animation.armors then
    for _, armor in ipairs(animation.armors) do
      if armor == "light-armor" then
        animation.armors[#animation.armors + 1] = "heavy-armor"
        break
      end
    end
  end
end

data:extend(
{
  {
    type = "underground-belt",
    name = "underground-belt",
    icon = "__base__/graphics/icons/underground-belt.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "underground-belt"},
    max_health = 150,
    corpse = "small-remnants",
    max_distance = 5,
    underground_sprite =
    {
      filename = "__core__/graphics/arrows/underground-lines.png",
      priority = "high",
      width = 64,
      height = 64,
      x = 64,
      scale = 0.5
    },
    resistances =
    {
      {
        type = "fire",
        percent = 60
      },
      {
        type = "impact",
        percent = 30
      }
    },
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    animation_speed_coefficient = 32,
    belt_horizontal = basic_belt_horizontal,
    belt_vertical = basic_belt_vertical,
    ending_top = basic_belt_ending_top,
    ending_bottom = basic_belt_ending_bottom,
    ending_side = basic_belt_ending_side,
    starting_top = basic_belt_starting_top,
    starting_bottom = basic_belt_starting_bottom,
    starting_side = basic_belt_starting_side,
    fast_replaceable_group = "underground-belt",
    speed = 0.03125,
    structure =
    {
      direction_in =
      {
        sheet =
        {
          filename = "__base__/graphics/entity/underground-belt/underground-belt-structure.png",
          priority = "extra-high",
          shift = {0.25, 0},
          width = 57,
          height = 43,
          y = 43,
          hr_version =
          {
            filename = "__base__/graphics/entity/underground-belt/hr-underground-belt-structure.png",
            priority = "extra-high",
            shift = {0.15625, 0.0703125},
            width = 106,
            height = 85,
            y = 85,
            scale = 0.5
          }
        }
      },
      direction_out =
      {
        sheet =
        {
          filename = "__base__/graphics/entity/underground-belt/underground-belt-structure.png",
          priority = "extra-high",
          shift = {0.25, 0},
          width = 57,
          height = 43,
          hr_version =
          {
            filename = "__base__/graphics/entity/underground-belt/hr-underground-belt-structure.png",
            priority = "extra-high",
            shift = {0.15625, 0.0703125},
            width = 106,
            height = 85,
            scale = 0.5
          }

        }

      }
    },
    ending_patch = ending_patch_prototype
  },
  {
    type = "underground-belt",
    name = "fast-underground-belt",
    icon = "__base__/graphics/icons/fast-underground-belt.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "fast-underground-belt"},
    max_health = 160,
    corpse = "small-remnants",
    max_distance = 7,
    underground_sprite =
    {
      filename = "__core__/graphics/arrows/underground-lines.png",
      priority = "high",
      width = 64,
      height = 64,
      x = 64,
      scale = 0.5
    },
    resistances =
    {
      {
        type = "fire",
        percent = 60
      },
      {
        type = "impact",
        percent = 30
      }
    },
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    animation_speed_coefficient = 32,
    belt_horizontal = fast_belt_horizontal, -- specified in transport-belt-pictures.lua
    belt_vertical = fast_belt_vertical,
    ending_top = fast_belt_ending_top,
    ending_bottom = fast_belt_ending_bottom,
    ending_side = fast_belt_ending_side,
    starting_top = fast_belt_starting_top,
    starting_bottom = fast_belt_starting_bottom,
    starting_side = fast_belt_starting_side,
    fast_replaceable_group = "underground-belt",
    speed = 0.0625,
    structure =
    {
      direction_in =
      {
        sheet =
        {
          filename = "__base__/graphics/entity/fast-underground-belt/fast-underground-belt-structure.png",
          priority = "extra-high",
          shift = {0.26, 0},
          width = 57,
          height = 43,
          y = 43,
          hr_version =
          {
            filename = "__base__/graphics/entity/fast-underground-belt/hr-fast-underground-belt-structure.png",
            priority = "extra-high",
            shift = {0.15625, 0.0703125},
            width = 106,
            height = 85,
            y = 85,
            scale = 0.5
          }
        }
      },
      direction_out =
      {
        sheet =
        {
          filename = "__base__/graphics/entity/fast-underground-belt/fast-underground-belt-structure.png",
          priority = "extra-high",
          shift = {0.26, 0},
          width = 57,
          height = 43,
          hr_version =
          {
            filename = "__base__/graphics/entity/fast-underground-belt/hr-fast-underground-belt-structure.png",
            priority = "extra-high",
            shift = {0.15625, 0.0703125},
            width = 106,
            height = 85,
            scale = 0.5
          }
        }
      }
    },
    ending_patch = ending_patch_prototype
  },
  {
    type = "underground-belt",
    name = "express-underground-belt",
    icon = "__base__/graphics/icons/express-underground-belt.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "express-underground-belt"},
    max_health = 170,
    corpse = "small-remnants",
    max_distance = 9,
    underground_sprite =
    {
      filename = "__core__/graphics/arrows/underground-lines.png",
      priority = "high",
      width = 64,
      height = 64,
      x = 64,
      scale = 0.5
    },
    resistances =
    {
      {
        type = "fire",
        percent = 60
      },
      {
        type = "impact",
        percent = 30
      }
    },
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    animation_speed_coefficient = 32,
    belt_horizontal = express_belt_horizontal, -- specified in transport-belt-pictures.lua
    belt_vertical = express_belt_vertical,
    ending_top = express_belt_ending_top,
    ending_bottom = express_belt_ending_bottom,
    ending_side = express_belt_ending_side,
    starting_top = express_belt_starting_top,
    starting_bottom = express_belt_starting_bottom,
    starting_side = express_belt_starting_side,
    fast_replaceable_group = "underground-belt",
    speed = 0.09375,
    structure =
    {
      direction_in =
      {
        sheet =
        {
          filename = "__base__/graphics/entity/express-underground-belt/express-underground-belt-structure.png",
          priority = "extra-high",
          shift = {0.26, 0},
          width = 57,
          height = 43,
          y = 43,
          hr_version =
          {
            filename = "__base__/graphics/entity/express-underground-belt/hr-express-underground-belt-structure.png",
            priority = "extra-high",
            shift = {0.15625, 0.0703125},
            width = 106,
            height = 85,
            y = 85,
            scale = 0.5
          }
        }
      },
      direction_out =
      {
        sheet =
        {
          filename = "__base__/graphics/entity/express-underground-belt/express-underground-belt-structure.png",
          priority = "extra-high",
          shift = {0.26, 0},
          width = 57,
          height = 43,
          hr_version =
          {
            filename = "__base__/graphics/entity/express-underground-belt/hr-express-underground-belt-structure.png",
            priority = "extra-high",
            shift = {0.15625, 0.0703125},
            width = 106,
            height = 85,
            scale = 0.5
          }
        }
      }
    },
    ending_patch = ending_patch_prototype
  },
  {
    type = "loader",
    name = "loader",
    icon = "__base__/graphics/icons/loader.png",
    flags = {"placeable-neutral", "player-creation", "fast-replaceable-no-build-while-moving"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "loader"},
    max_health = 170,
    filter_count = 5,
    corpse = "small-remnants",
    resistances =
    {
      {
        type = "fire",
        percent = 60
      }
    },
    collision_box = {{-0.4, -0.9}, {0.4, 0.9}},
    selection_box = {{-0.5, -1}, {0.5, 1}},
    animation_speed_coefficient = 32,
    belt_horizontal = basic_belt_horizontal,
    belt_vertical = basic_belt_vertical,
    ending_top = basic_belt_ending_top,
    ending_bottom = basic_belt_ending_bottom,
    ending_side = basic_belt_ending_side,
    starting_top = basic_belt_starting_top,
    starting_bottom = basic_belt_starting_bottom,
    starting_side = basic_belt_starting_side,
    fast_replaceable_group = "loader",
    speed = 0.03125,
    structure =
    {
      direction_in =
      {
        sheet =
        {
          filename = "__base__/graphics/entity/loader/loader-structure.png",
          priority = "extra-high",
          width = 64,
          height = 64
        }
      },
      direction_out =
      {
        sheet =
        {
          filename = "__base__/graphics/entity/loader/loader-structure.png",
          priority = "extra-high",
          width = 64,
          height = 64,
          y = 64
        }
      }
    },
    ending_patch = ending_patch_prototype
  },
  {
    type = "loader",
    name = "fast-loader",
    icon = "__base__/graphics/icons/loader.png",
    flags = {"placeable-neutral", "player-creation", "fast-replaceable-no-build-while-moving"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "fast-loader"},
    max_health = 170,
    filter_count = 5,
    corpse = "small-remnants",
    resistances =
    {
      {
        type = "fire",
        percent = 60
      }
    },
    collision_box = {{-0.4, -0.9}, {0.4, 0.9}},
    selection_box = {{-0.5, -1}, {0.5, 1}},
    animation_speed_coefficient = 32,
    belt_horizontal = fast_belt_horizontal,
    belt_vertical = fast_belt_vertical,
    ending_top = fast_belt_ending_top,
    ending_bottom = fast_belt_ending_bottom,
    ending_side = fast_belt_ending_side,
    starting_top = fast_belt_starting_top,
    starting_bottom = fast_belt_starting_bottom,
    starting_side = fast_belt_starting_side,
    fast_replaceable_group = "loader",
    speed = 0.0625,
    structure =
    {
      direction_in =
      {
        sheet =
        {
          filename = "__base__/graphics/entity/loader/loader-structure.png",
          priority = "extra-high",
          width = 64,
          height = 64
        }
      },
      direction_out =
      {
        sheet =
        {
          filename = "__base__/graphics/entity/loader/loader-structure.png",
          priority = "extra-high",
          width = 64,
          height = 64,
          y = 64
        }
      }
    },
    ending_patch = ending_patch_prototype
  },
  {
    type = "loader",
    name = "express-loader",
    icon = "__base__/graphics/icons/loader.png",
    flags = {"placeable-neutral", "player-creation", "fast-replaceable-no-build-while-moving"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "express-loader"},
    max_health = 170,
    filter_count = 5,
    corpse = "small-remnants",
    resistances =
    {
      {
        type = "fire",
        percent = 60
      }
    },
    collision_box = {{-0.4, -0.9}, {0.4, 0.9}},
    selection_box = {{-0.5, -1}, {0.5, 1}},
    animation_speed_coefficient = 32,
    belt_horizontal = express_belt_horizontal,
    belt_vertical = express_belt_vertical,
    ending_top = express_belt_ending_top,
    ending_bottom = express_belt_ending_bottom,
    ending_side = express_belt_ending_side,
    starting_top = express_belt_starting_top,
    starting_bottom = express_belt_starting_bottom,
    starting_side = express_belt_starting_side,
    fast_replaceable_group = "loader",
    speed = 0.09375,
    structure =
    {
      direction_in =
      {
        sheet =
        {
          filename = "__base__/graphics/entity/loader/loader-structure.png",
          priority = "extra-high",
          width = 64,
          height = 64
        }
      },
      direction_out =
      {
        sheet =
        {
          filename = "__base__/graphics/entity/loader/loader-structure.png",
          priority = "extra-high",
          width = 64,
          height = 64,
          y = 64
        }
      }
    },
    ending_patch = ending_patch_prototype
  },
  {
    type = "splitter",
    name = "splitter",
    icon = "__base__/graphics/icons/splitter.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "splitter"},
    max_health = 170,
    corpse = "medium-remnants",
    resistances =
    {
      {
        type = "fire",
        percent = 60
      }
    },
    collision_box = {{-0.9, -0.4}, {0.9, 0.4}},
    selection_box = {{-0.9, -0.5}, {0.9, 0.5}},
    animation_speed_coefficient = 32,
    structure_animation_speed_coefficient = 0.7,
    structure_animation_movement_cooldown = 10,
    belt_horizontal = basic_belt_horizontal,
    belt_vertical = basic_belt_vertical,
    ending_top = basic_belt_ending_top,
    ending_bottom = basic_belt_ending_bottom,
    ending_side = basic_belt_ending_side,
    starting_top = basic_belt_starting_top,
    starting_bottom = basic_belt_starting_bottom,
    starting_side = basic_belt_starting_side,
    ending_patch = ending_patch_prototype,
    fast_replaceable_group = "splitter",
    speed = 0.03125,
    structure =
    {
      north =
      {
        filename = "__base__/graphics/entity/splitter/splitter-north.png",
        frame_count = 32,
        line_length = 16,
        priority = "extra-high",
        width = 83,
        height = 36,
        shift = {0.265625, 0},
        hr_version =
        {
          filename = "__base__/graphics/entity/splitter/hr-splitter-north.png",
          frame_count = 32,
          line_length = 8,
          priority = "extra-high",
          width = 164,
          height = 70,
          shift = {0.25, 0.046875},
          scale = 0.5
        }
      },
      east =
      {
        filename = "__base__/graphics/entity/splitter/splitter-east.png",
        frame_count = 32,
        line_length = 16,
        priority = "extra-high",
        width = 51,
        height = 80,
        shift = {0.109375, -0.03125},
        hr_version =
        {
          filename = "__base__/graphics/entity/splitter/hr-splitter-east.png",
          frame_count = 32,
          line_length = 8,
          priority = "extra-high",
          width = 93,
          height = 157,
          shift = {0.148438, -0.179688},
          scale = 0.5
        }
      },
      south =
      {
        filename = "__base__/graphics/entity/splitter/splitter-south.png",
        frame_count = 32,
        line_length = 16,
        priority = "extra-high",
        width = 85,
        height = 35,
        shift = {0.140625, -0.015625},
        hr_version =
        {
          filename = "__base__/graphics/entity/splitter/hr-splitter-south.png",
          frame_count = 32,
          line_length = 8,
          priority = "extra-high",
          width = 168,
          height = 67,
          shift = {0.140625, 0.0234375},
          scale = 0.5
        }
      },
      west =
      {
        filename = "__base__/graphics/entity/splitter/splitter-west.png",
        frame_count = 32,
        line_length = 16,
        priority = "extra-high",
        width = 51,
        height = 78,
        shift = {0.296875, -0.03125},
        hr_version =
        {
          filename = "__base__/graphics/entity/splitter/hr-splitter-west.png",
          frame_count = 32,
          line_length = 8,
          priority = "extra-high",
          width = 94,
          height = 154,
          shift = {0.203125, -0.109375},
          scale = 0.5
        }
      },
    },
    ending_patch = ending_patch_prototype
  },
  {
    type = "splitter",
    name = "fast-splitter",
    icon = "__base__/graphics/icons/fast-splitter.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "fast-splitter"},
    max_health = 180,
    corpse = "medium-remnants",
    resistances =
    {
      {
        type = "fire",
        percent = 60
      }
    },
    collision_box = {{-0.9, -0.4}, {0.9, 0.4}},
    selection_box = {{-0.9, -0.5}, {0.9, 0.5}},
    animation_speed_coefficient = 32,
    structure_animation_speed_coefficient = 1.2,
    structure_animation_movement_cooldown = 10,
    belt_horizontal = fast_belt_horizontal, -- specified in transport-belt-pictures.lua
    belt_vertical = fast_belt_vertical,
    ending_top = fast_belt_ending_top,
    ending_bottom = fast_belt_ending_bottom,
    ending_side = fast_belt_ending_side,
    starting_top = fast_belt_starting_top,
    starting_bottom = fast_belt_starting_bottom,
    starting_side = fast_belt_starting_side,
    fast_replaceable_group = "splitter",
    speed = 0.0625,
    structure =
    {
      north =
      {
        filename = "__base__/graphics/entity/fast-splitter/fast-splitter-north.png",
        frame_count = 32,
        line_length = 16,
        priority = "extra-high",
        width = 83,
        height = 36,
        shift = {0.265625, 0},
        hr_version =
        {
          filename = "__base__/graphics/entity/fast-splitter/hr-fast-splitter-north.png",
          frame_count = 32,
          line_length = 8,
          priority = "extra-high",
          width = 164,
          height = 70,
          shift = {0.25, 0.046875},
          scale = 0.5
        }
      },
      east =
      {
        filename = "__base__/graphics/entity/fast-splitter/fast-splitter-east.png",
        frame_count = 32,
        line_length = 16,
        priority = "extra-high",
        width = 51,
        height = 80,
        shift = {0.109375, -0.03125},
        hr_version =
        {
          filename = "__base__/graphics/entity/fast-splitter/hr-fast-splitter-east.png",
          frame_count = 32,
          line_length = 8,
          priority = "extra-high",
          width = 93,
          height = 157,
          shift = {0.148438, -0.179688},
          scale = 0.5
        }
      },
      south =
      {
        filename = "__base__/graphics/entity/fast-splitter/fast-splitter-south.png",
        frame_count = 32,
        line_length = 16,
        priority = "extra-high",
        width = 85,
        height = 35,
        shift = {0.140625, -0.015625},
        hr_version =
        {
          filename = "__base__/graphics/entity/fast-splitter/hr-fast-splitter-south.png",
          frame_count = 32,
          line_length = 8,
          priority = "extra-high",
          width = 168,
          height = 67,
          shift = {0.140625, 0.0234375},
          scale = 0.5
        }
      },
      west =
      {
        filename = "__base__/graphics/entity/fast-splitter/fast-splitter-west.png",
        frame_count = 32,
        line_length = 16,
        priority = "extra-high",
        width = 51,
        height = 78,
        shift = {0.296875, -0.03125},
        hr_version =
        {
          filename = "__base__/graphics/entity/fast-splitter/hr-fast-splitter-west.png",
          frame_count = 32,
          line_length = 8,
          priority = "extra-high",
          width = 94,
          height = 154,
          shift = {0.203125, -0.109375},
          scale = 0.5
        }
      },
    },
    ending_patch = ending_patch_prototype
  },
  {
    type = "splitter",
    name = "express-splitter",
    icon = "__base__/graphics/icons/express-splitter.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "express-splitter"},
    max_health = 190,
    corpse = "medium-remnants",
    resistances =
    {
      {
        type = "fire",
        percent = 60
      }
    },
    collision_box = {{-0.9, -0.4}, {0.9, 0.4}},
    selection_box = {{-0.9, -0.5}, {0.9, 0.5}},
    animation_speed_coefficient = 32,
    structure_animation_speed_coefficient = 1.2,
    structure_animation_movement_cooldown = 10,
    belt_horizontal = express_belt_horizontal, -- specified in transport-belt-pictures.lua
    belt_vertical = express_belt_vertical,
    ending_top = express_belt_ending_top,
    ending_bottom = express_belt_ending_bottom,
    ending_side = express_belt_ending_side,
    starting_top = express_belt_starting_top,
    starting_bottom = express_belt_starting_bottom,
    starting_side = express_belt_starting_side,
    ending_patch = ending_patch_prototype,
    fast_replaceable_group = "splitter",
    speed = 0.09375,
    structure =
    {
      north =
      {
        filename = "__base__/graphics/entity/express-splitter/express-splitter-north.png",
        frame_count = 32,
        line_length = 16,
        priority = "extra-high",
        width = 83,
        height = 36,
        shift = {0.21875, 0},
        hr_version =
        {
          filename = "__base__/graphics/entity/express-splitter/hr-express-splitter-north.png",
          frame_count = 32,
          line_length = 8,
          priority = "extra-high",
          width = 164,
          height = 70,
          shift = {0.265625, 0},
          scale = 0.5
        }
      },
      east =
      {
        filename = "__base__/graphics/entity/express-splitter/express-splitter-east.png",
        frame_count = 32,
        line_length = 16,
        priority = "extra-high",
        width = 51,
        height = 80,
        shift = {0.109375, -0.03125},
        hr_version =
        {
          filename = "__base__/graphics/entity/express-splitter/hr-express-splitter-east.png",
          frame_count = 32,
          line_length = 8,
          priority = "extra-high",
          width = 93,
          height = 157,
          shift = {0.148438, -0.179688},
          scale = 0.5
        }
      },
      south =
      {
        filename = "__base__/graphics/entity/express-splitter/express-splitter-south.png",
        frame_count = 32,
        line_length = 16,
        priority = "extra-high",
        width = 85,
        height = 35,
        shift = {0.140625, -0.015625},
        hr_version =
        {
          filename = "__base__/graphics/entity/express-splitter/hr-express-splitter-south.png",
          frame_count = 32,
          line_length = 8,
          priority = "extra-high",
          width = 168,
          height = 67,
          shift = {0.140625, 0.0234375},
          scale = 0.5
        }
      },
      west =
      {
        filename = "__base__/graphics/entity/express-splitter/express-splitter-west.png",
        frame_count = 32,
        line_length = 16,
        priority = "extra-high",
        width = 51,
        height = 78,
        shift = {0.296875, -0.03125},
        hr_version =
        {
          filename = "__base__/graphics/entity/express-splitter/hr-express-splitter-west.png",
          frame_count = 32,
          line_length = 8,
          priority = "extra-high",
          width = 94,
          height = 154,
          shift = {0.203125, -0.109375},
          scale = 0.5
        }
      },
    }
  },
  {
    type = "transport-belt",
    name = "fast-transport-belt",
    icon = "__base__/graphics/icons/fast-transport-belt.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.3, result = "fast-transport-belt"},
    max_health = 160,
    corpse = "small-remnants",
    resistances =
    {
      {
        type = "fire",
        percent = 50
      }
    },
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/fast-transport-belt.ogg",
        volume = 0.4
      },
      max_sounds_per_type = 3
    },
    animation_speed_coefficient = 32,
    animations =
    {
      filename = "__base__/graphics/entity/fast-transport-belt/fast-transport-belt.png",
      priority = "extra-high",
      width = 40,
      height = 40,
      frame_count = 32,
      direction_count = 12,
      hr_version =
      {
        filename = "__base__/graphics/entity/fast-transport-belt/hr-fast-transport-belt.png",
        priority = "extra-high",
        width = 80,
        height = 80,
        frame_count = 32,
        line_length = 16,
        direction_count = 12,
        scale = 0.5
      }
    },
    belt_horizontal = fast_belt_horizontal, -- specified in transport-belt-pictures.lua
    belt_vertical = fast_belt_vertical,
    ending_top = fast_belt_ending_top,
    ending_bottom = fast_belt_ending_bottom,
    ending_side = fast_belt_ending_side,
    starting_top = fast_belt_starting_top,
    starting_bottom = fast_belt_starting_bottom,
    starting_side = fast_belt_starting_side,
    ending_patch = ending_patch_prototype,
    fast_replaceable_group = "transport-belt",
    speed = 0.0625,
    connector_frame_sprites = transport_belt_connector_frame_sprites,
    circuit_connector_sprites = transport_belt_circuit_connector_sprites,
    circuit_wire_connection_point = transport_belt_circuit_wire_connection_point,
    circuit_wire_max_distance = transport_belt_circuit_wire_max_distance
  },
  {
    type = "transport-belt",
    name = "express-transport-belt",
    icon = "__base__/graphics/icons/express-transport-belt.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.3, result = "express-transport-belt"},
    max_health = 170,
    corpse = "small-remnants",
    resistances =
    {
      {
        type = "fire",
        percent = 50
      }
    },
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/express-transport-belt.ogg",
        volume = 0.4
      },
      max_sounds_per_type = 3
    },
    animation_speed_coefficient = 32,
    animations =
    {
      filename = "__base__/graphics/entity/express-transport-belt/express-transport-belt.png",
      priority = "extra-high",
      width = 40,
      height = 40,
      frame_count = 32,
      direction_count = 12,
      hr_version =
      {
        filename = "__base__/graphics/entity/express-transport-belt/hr-express-transport-belt.png",
        priority = "extra-high",
        width = 80,
        height = 80,
        frame_count = 32,
        line_length = 16,
        direction_count = 12,
        scale = 0.5
      }
    },
    belt_horizontal = express_belt_horizontal, -- specified in transport-belt-pictures.lua
    belt_vertical = express_belt_vertical,
    ending_top = express_belt_ending_top,
    ending_bottom = express_belt_ending_bottom,
    ending_side = express_belt_ending_side,
    starting_top = express_belt_starting_top,
    starting_bottom = express_belt_starting_bottom,
    starting_side = express_belt_starting_side,
    ending_patch = ending_patch_prototype,
    ending_patch = ending_patch_prototype,
    fast_replaceable_group = "transport-belt",
    speed = 0.09375,
    connector_frame_sprites = transport_belt_connector_frame_sprites,
    circuit_connector_sprites = transport_belt_circuit_connector_sprites,
    circuit_wire_connection_point = transport_belt_circuit_wire_connection_point,
    circuit_wire_max_distance = transport_belt_circuit_wire_max_distance
  },
  {
    type = "assembling-machine",
    name = "assembling-machine-2",
    icon = "__base__/graphics/icons/assembling-machine-2.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "assembling-machine-2"},
    max_health = 350,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    resistances =
    {
      {
        type = "fire",
        percent = 70
      }
    },
    fluid_boxes =
    {
      {
        production_type = "input",
        pipe_picture = assembler2pipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = -1,
        pipe_connections = {{ type="input", position = {0, -2} }},
        secondary_draw_orders = { north = -1 }
      },
      {
        production_type = "output",
        pipe_picture = assembler2pipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = 1,
        pipe_connections = {{ type="output", position = {0, 2} }},
        secondary_draw_orders = { north = -1 }
      },
      off_when_no_fluid_recipe = true
    },
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    fast_replaceable_group = "assembling-machine",
    animation =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/assembling-machine-2/assembling-machine-2.png",
          priority = "high",
          width = 108,
          height = 110,
          frame_count = 32,
          line_length = 8,
          shift = util.by_pixel(0, 4),
          hr_version = {
            filename = "__base__/graphics/entity/assembling-machine-2/hr-assembling-machine-2.png",
            priority = "high",
            width = 214,
            height = 218,
            frame_count = 32,
            line_length = 8,
            shift = util.by_pixel(0, 4),
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/assembling-machine-2/assembling-machine-2-shadow.png",
          priority = "high",
          width = 98,
          height = 82,
          frame_count = 32,
          line_length = 8,
          draw_as_shadow = true,
          shift = util.by_pixel(12, 5),
          hr_version = {
            filename = "__base__/graphics/entity/assembling-machine-2/hr-assembling-machine-2-shadow.png",
            priority = "high",
            width = 196,
            height = 163,
            frame_count = 32,
            line_length = 8,
            draw_as_shadow = true,
            shift = util.by_pixel(12, 4.75),
            scale = 0.5
          }
        },
      },
    },
    open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
    close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      sound = {
        {
          filename = "__base__/sound/assembling-machine-t2-1.ogg",
          volume = 0.8
        },
        {
          filename = "__base__/sound/assembling-machine-t2-2.ogg",
          volume = 0.8
        },
      },
      idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.6 },
      apparent_volume = 1.5,
    },
    crafting_categories = {"crafting", "advanced-crafting", "crafting-with-fluid"},
    crafting_speed = 0.75,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions = 0.04 / 2.5
    },
    energy_usage = "150kW",
    ingredient_count = 4,
    module_specification =
    {
      module_slots = 2
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution"}
  },
  {
    type = "assembling-machine",
    name = "assembling-machine-3",
    icon = "__base__/graphics/icons/assembling-machine-3.png",
    flags = {"placeable-neutral","placeable-player", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "assembling-machine-3"},
    max_health = 400,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    resistances =
    {
      {
        type = "fire",
        percent = 70
      }
    },
    fluid_boxes =
    {
      {
        production_type = "input",
        pipe_picture = assembler3pipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = -1,
        pipe_connections = {{ type="input", position = {0, -2} }},
        secondary_draw_orders = { north = -1 }
      },
      {
        production_type = "output",
        pipe_picture = assembler3pipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = 1,
        pipe_connections = {{ type="output", position = {0, 2} }},
        secondary_draw_orders = { north = -1 }
      },
      off_when_no_fluid_recipe = true
    },
    open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
    close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      sound = {
        {
          filename = "__base__/sound/assembling-machine-t3-1.ogg",
          volume = 0.8
        },
        {
          filename = "__base__/sound/assembling-machine-t3-2.ogg",
          volume = 0.8
        },
      },
      idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.6 },
      apparent_volume = 1.5,
    },
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    fast_replaceable_group = "assembling-machine",
    animation =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/assembling-machine-3/assembling-machine-3.png",
          priority = "high",
          width = 108,
          height = 119,
          frame_count = 32,
          line_length = 8,
          shift = util.by_pixel(0, -0.5),
          hr_version = {
            filename = "__base__/graphics/entity/assembling-machine-3/hr-assembling-machine-3.png",
            priority = "high",
            width = 214,
            height = 237,
            frame_count = 32,
            line_length = 8,
            shift = util.by_pixel(0, -0.75),
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/assembling-machine-3/assembling-machine-3-shadow.png",
          priority = "high",
          width = 130,
          height = 82,
          frame_count = 32,
          line_length = 8,
          draw_as_shadow = true,
          shift = util.by_pixel(28, 4),
          hr_version = {
            filename = "__base__/graphics/entity/assembling-machine-3/hr-assembling-machine-3-shadow.png",
            priority = "high",
            width = 260,
            height = 162,
            frame_count = 32,
            line_length = 8,
            draw_as_shadow = true,
            shift = util.by_pixel(28, 4),
            scale = 0.5
          }
        },
      },
    },

    crafting_categories = {"crafting", "advanced-crafting", "crafting-with-fluid"},
    crafting_speed = 1.25,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions = 0.03 / 3.5
    },
    energy_usage = "210kW",
    ingredient_count = 6,
    module_specification =
    {
      module_slots = 4
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution"}
  },
  {
    type = "car",
    name = "car",
    icon = "__base__/graphics/icons/car.png",
    flags = {"pushable", "placeable-neutral", "player-creation", "placeable-off-grid"},
    minable = {mining_time = 1, result = "car"},
    mined_sound = {filename = "__core__/sound/deconstruct-medium.ogg"},
    max_health = 450,
    corpse = "medium-remnants",
    dying_explosion = "medium-explosion",
    energy_per_hit_point = 1,
    crash_trigger = crash_trigger(),
    resistances =
    {
      {
        type = "fire",
        percent = 50
      },
      {
        type = "impact",
        percent = 30,
        decrease = 50
      }
    },
    collision_box = {{-0.7, -1}, {0.7, 1}},
    selection_box = {{-0.7, -1}, {0.7, 1}},
    effectivity = 0.5,
    braking_power = "200kW",

    burner =
    {
      fuel_category = "chemical",
      effectivity = 0.6,
      fuel_inventory_size = 1,
      smoke =
      {
        {
          name = "car-smoke",
          deviation = {0.25, 0.25},
          frequency = 200,
          position = {0, 1.5},
          starting_frame = 0,
          starting_frame_deviation = 60
        }
      }
    },
    consumption = "150kW",
    friction = 2e-3,
    light =
    {
      {
        type = "oriented",
        minimum_darkness = 0.3,
        picture =
        {
          filename = "__core__/graphics/light-cone.png",
          priority = "extra-high",
          flags = { "light" },
          scale = 2,
          width = 200,
          height = 200
        },
        shift = {-0.6, -14},
        size = 2,
        intensity = 0.6,
        color = {r = 0.92, g = 0.77, b = 0.3}
      },
      {
        type = "oriented",
        minimum_darkness = 0.3,
        picture =
        {
          filename = "__core__/graphics/light-cone.png",
          priority = "extra-high",
          flags = { "light" },
          scale = 2,
          width = 200,
          height = 200
        },
        shift = {0.6, -14},
        size = 2,
        intensity = 0.6,
        color = {r = 0.92, g = 0.77, b = 0.3}
      }
    },
    render_layer = "object",
    animation =
    {
      layers =
      {
        {
          priority = "low",
          width = 102,
          height = 86,
          frame_count = 2,
          direction_count = 64,
          shift = {0, -0.1875},
          animation_speed = 8,
          max_advance = 0.2,
          stripes =
          {
            {
             filename = "__base__/graphics/entity/car/car-1.png",
             width_in_frames = 2,
             height_in_frames = 22,
            },
            {
             filename = "__base__/graphics/entity/car/car-2.png",
             width_in_frames = 2,
             height_in_frames = 22,
            },
            {
             filename = "__base__/graphics/entity/car/car-3.png",
             width_in_frames = 2,
             height_in_frames = 20,
            },
          },
          hr_version =
          {
            priority = "low",
            width = 202,
            height = 172,
            frame_count = 2,
            scale = 0.5,
            direction_count = 64,
            shift = {0, -0.359375},
            animation_speed = 8,
            max_advance = 0.2,
            stripes =
            {
              {
                filename = "__base__/graphics/entity/car/hr-car-1.png",
                width_in_frames = 2,
                height_in_frames = 11
              },
              {
                filename = "__base__/graphics/entity/car/hr-car-2.png",
                width_in_frames = 2,
                height_in_frames = 11
              },
              {
                filename = "__base__/graphics/entity/car/hr-car-3.png",
                width_in_frames = 2,
                height_in_frames = 11
              },
              {
                filename = "__base__/graphics/entity/car/hr-car-4.png",
                width_in_frames = 2,
                height_in_frames = 11
              },
              {
                filename = "__base__/graphics/entity/car/hr-car-5.png",
                width_in_frames = 2,
                height_in_frames = 11
              },
              {
                filename = "__base__/graphics/entity/car/hr-car-6.png",
                width_in_frames = 2,
                height_in_frames = 9
              }
            }
          }
        },
        {
          priority = "low",
          width = 100,
          height = 75,
          frame_count = 2,
          apply_runtime_tint = true,
          direction_count = 64,
          max_advance = 0.2,
          line_length = 2,
          shift = {0, -0.171875},
          stripes = util.multiplystripes(2,
          {
            {
              filename = "__base__/graphics/entity/car/car-mask-1.png",
              width_in_frames = 1,
              height_in_frames = 22,
            },
            {
              filename = "__base__/graphics/entity/car/car-mask-2.png",
              width_in_frames = 1,
              height_in_frames = 22,
            },
            {
              filename = "__base__/graphics/entity/car/car-mask-3.png",
              width_in_frames = 1,
              height_in_frames = 20,
            },
          }),
          hr_version =
          {
            priority = "low",
            width = 199,
            height = 147,
            frame_count = 2,
            apply_runtime_tint = true,
            scale = 0.5,
            axially_symmetrical = false,
            direction_count = 64,
            max_advance = 0.2,
            shift = {0, -0.34375},
            line_length = 1,
            stripes = util.multiplystripes(2,
            {
              {
                filename = "__base__/graphics/entity/car/hr-car-mask-1.png",
                width_in_frames = 1,
                height_in_frames = 13
              },
              {
                filename = "__base__/graphics/entity/car/hr-car-mask-2.png",
                width_in_frames = 1,
                height_in_frames = 13
              },
              {
                filename = "__base__/graphics/entity/car/hr-car-mask-3.png",
                width_in_frames = 1,
                height_in_frames = 13
              },
              {
                filename = "__base__/graphics/entity/car/hr-car-mask-4.png",
                width_in_frames = 1,
                height_in_frames = 13
              },
              {
                filename = "__base__/graphics/entity/car/hr-car-mask-5.png",
                width_in_frames = 1,
                height_in_frames = 12
              }
            })
          }
        },
        {
          priority = "low",
          width = 114,
          height = 76,
          frame_count = 2,
          draw_as_shadow = true,
          direction_count = 64,
          shift = {0.28125, 0.25},
          max_advance = 0.2,
          stripes = util.multiplystripes(2,
          {
           {
            filename = "__base__/graphics/entity/car/car-shadow-1.png",
            width_in_frames = 1,
            height_in_frames = 22,
           },
           {
            filename = "__base__/graphics/entity/car/car-shadow-2.png",
            width_in_frames = 1,
            height_in_frames = 22,
           },
           {
            filename = "__base__/graphics/entity/car/car-shadow-3.png",
            width_in_frames = 1,
            height_in_frames = 20,
           }
          })
        }
      }
    },
    turret_animation =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/car/car-turret.png",
          priority = "low",
          line_length = 8,
          width = 36,
          height = 29,
          frame_count = 1,
          direction_count = 64,
          shift = {0.03125, -0.890625},
          animation_speed = 8,
          hr_version =
          {
            priority = "low",
            width = 71,
            height = 57,
            frame_count = 1,
            axially_symmetrical = false,
            direction_count = 64,
            shift = {0, -1.05},
            animation_speed = 8,
            scale = 0.5,
            stripes =
            {
              {
                filename = "__base__/graphics/entity/car/hr-car-turret-1.png",
                width_in_frames = 1,
                height_in_frames = 32
              },
              {
                filename = "__base__/graphics/entity/car/hr-car-turret-2.png",
                width_in_frames = 1,
                height_in_frames = 32
              }
            }
          }
        },
        {
          filename = "__base__/graphics/entity/car/car-turret-shadow.png",
          priority = "low",
          line_length = 8,
          width = 46,
          height = 31,
          frame_count = 1,
          draw_as_shadow = true,
          direction_count = 64,
          shift = {0.875, 0.359375}
        }
      }
    },
    turret_rotation_speed = 0.35 / 60,
    sound_no_fuel =
    {
      {
        filename = "__base__/sound/fight/car-no-fuel-1.ogg",
        volume = 0.6
      }
    },
    stop_trigger_speed = 0.2,
    stop_trigger =
    {
      {
        type = "play-sound",
        sound =
        {
          {
            filename = "__base__/sound/car-breaks.ogg",
            volume = 0.6
          }
        }
      }
    },
    sound_minimum_speed = 0.2;
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/car-engine.ogg",
        volume = 0.6
      },
      activate_sound =
      {
        filename = "__base__/sound/car-engine-start.ogg",
        volume = 0.6
      },
      deactivate_sound =
      {
        filename = "__base__/sound/car-engine-stop.ogg",
        volume = 0.6
      },
      match_speed_to_activity = true,
    },
    open_sound = { filename = "__base__/sound/car-door-open.ogg", volume=0.7 },
    close_sound = { filename = "__base__/sound/car-door-close.ogg", volume = 0.7 },
    rotation_speed = 0.015,
    weight = 700,
    guns = { "vehicle-machine-gun" },
    inventory_size = 80
  },
  {
    type = "car",
    name = "tank",
    icon = "__base__/graphics/icons/tank.png",
    flags = {"pushable", "placeable-neutral", "player-creation", "placeable-off-grid"},
    minable = {mining_time = 1, result = "tank"},
    mined_sound = {filename = "__core__/sound/deconstruct-medium.ogg"},
    max_health = 2000,
    corpse = "medium-remnants",
    dying_explosion = "medium-explosion",
    energy_per_hit_point = 0.5,
    resistances =
    {
      {
        type = "fire",
        decrease = 15,
        percent = 60
      },
      {
        type = "physical",
        decrease = 15,
        percent = 60
      },
      {
        type = "impact",
        decrease = 50,
        percent = 80
      },
      {
        type = "explosion",
        decrease = 15,
        percent = 70
      },
      {
        type = "acid",
        decrease = 15,
        percent = 50
      }
    },
    collision_box = {{-0.9, -1.3}, {0.9, 1.3}},
    selection_box = {{-0.9, -1.3}, {0.9, 1.3}},
    effectivity = 0.6,
    braking_power = "400kW",
    burner =
    {
      fuel_category = "chemical",
      effectivity = 0.75,
      fuel_inventory_size = 2,
      smoke =
      {
        {
          name = "tank-smoke",
          deviation = {0.25, 0.25},
          frequency = 50,
          position = {0, 1.5},
          starting_frame = 0,
          starting_frame_deviation = 60
        }
      }
    },
    consumption = "600kW",
    terrain_friction_modifier = 0.2,
    friction = 0.002,
    light =
    {
      {
        type = "oriented",
        minimum_darkness = 0.3,
        picture =
        {
          filename = "__core__/graphics/light-cone.png",
          priority = "extra-high",
          flags = { "light" },
          scale = 2,
          width = 200,
          height = 200,
        },
        shift = {-0.6, -14},
        size = 2,
        intensity = 0.6,
        color = {r = 0.9, g = 1.0, b = 1.0}
      },
      {
        type = "oriented",
        minimum_darkness = 0.3,
        picture =
        {
          filename = "__core__/graphics/light-cone.png",
          priority = "extra-high",
          flags = { "light" },
          scale = 2,
          width = 200,
          height = 200
        },
        shift = {0.6, -14},
        size = 2,
        intensity = 0.6,
        color = {r = 0.9, g = 1.0, b = 1.0}
      }
    },
    animation =
    {
      layers =
      {
        {
          priority = "low",
          width = 139,
          height = 110,
          frame_count = 2,
          direction_count = 64,
          shift = {-0.140625, -0.28125},
          animation_speed = 8,
          max_advance = 1,
          stripes =
          {
            {
             filename = "__base__/graphics/entity/tank/base-1.png",
             width_in_frames = 2,
             height_in_frames = 16,
            },
            {
             filename = "__base__/graphics/entity/tank/base-2.png",
             width_in_frames = 2,
             height_in_frames = 16,
            },
            {
             filename = "__base__/graphics/entity/tank/base-3.png",
             width_in_frames = 2,
             height_in_frames = 16,
            },
            {
             filename = "__base__/graphics/entity/tank/base-4.png",
             width_in_frames = 2,
             height_in_frames = 16,
            }
          }
        },
        {
          priority = "low",
          width = 109,
          height = 88,
          frame_count = 2,
          apply_runtime_tint = true,
          direction_count = 64,
          shift = {-0.140625, -0.65625},
          max_advance = 1,
          line_length = 2,
          stripes = util.multiplystripes(2,
          {
            {
              filename = "__base__/graphics/entity/tank/base-mask-1.png",
              width_in_frames = 1,
              height_in_frames = 22,
            },
            {
              filename = "__base__/graphics/entity/tank/base-mask-2.png",
              width_in_frames = 1,
              height_in_frames = 22,
            },
            {
              filename = "__base__/graphics/entity/tank/base-mask-3.png",
              width_in_frames = 1,
              height_in_frames = 20,
            },
          })
        },
        {
          priority = "low",
          width = 154,
          height = 99,
          frame_count = 2,
          draw_as_shadow = true,
          direction_count = 64,
          shift = {0.59375, 0.328125},
          max_advance = 1,
          stripes = util.multiplystripes(2,
          {
           {
            filename = "__base__/graphics/entity/tank/base-shadow-1.png",
            width_in_frames = 1,
            height_in_frames = 16,
           },
           {
            filename = "__base__/graphics/entity/tank/base-shadow-2.png",
            width_in_frames = 1,
            height_in_frames = 16,
           },
           {
            filename = "__base__/graphics/entity/tank/base-shadow-3.png",
            width_in_frames = 1,
            height_in_frames = 16,
           },
           {
            filename = "__base__/graphics/entity/tank/base-shadow-4.png",
            width_in_frames = 1,
            height_in_frames = 16,
           }
          })
        }
      }
    },
    turret_animation =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/tank/turret.png",
          priority = "low",
          line_length = 8,
          width = 92,
          height = 69,
          frame_count = 1,
          direction_count = 64,
          shift = {-0.15625, -1.07812},
          animation_speed = 8,
        },
        {
          filename = "__base__/graphics/entity/tank/turret-mask.png",
          priority = "low",
          line_length = 8,
          width = 38,
          height = 29,
          frame_count = 1,
          apply_runtime_tint = true,
          direction_count = 64,
          shift = {-0.15625, -1.23438},
        },
        {
          filename = "__base__/graphics/entity/tank/turret-shadow.png",
          priority = "low",
          line_length = 8,
          width = 95,
          height = 67,
          frame_count = 1,
          draw_as_shadow = true,
          direction_count = 64,
          shift = {1.70312, 0.640625},
        }
      }
    },
    turret_rotation_speed = 0.35 / 60,
    turret_return_timeout = 300,
    stop_trigger_speed = 0.2,
    sound_no_fuel =
    {
      {
        filename = "__base__/sound/fight/tank-no-fuel-1.ogg",
        volume = 0.6
      },
    },
    stop_trigger =
    {
      {
        type = "play-sound",
        sound =
        {
          {
            filename = "__base__/sound/car-breaks.ogg",
            volume = 0.6
          },
        }
      },
    },
    sound_minimum_speed = 0.15;
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/fight/tank-engine.ogg",
        volume = 0.6
      },
      activate_sound =
      {
        filename = "__base__/sound/fight/tank-engine-start.ogg",
        volume = 0.6
      },
      deactivate_sound =
      {
        filename = "__base__/sound/fight/tank-engine-stop.ogg",
        volume = 0.6
      },
      match_speed_to_activity = true,
    },
    open_sound = { filename = "__base__/sound/car-door-open.ogg", volume=0.7 },
    close_sound = { filename = "__base__/sound/car-door-close.ogg", volume = 0.7 },
    rotation_speed = 0.0035,
    tank_driving = true,
    weight = 20000,
    inventory_size = 80,
    guns = { "tank-cannon", "tank-machine-gun", "tank-flamethrower" },
  },
  {
    type = "container",
    name = "iron-chest",
    icon = "__base__/graphics/icons/iron-chest.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 1, result = "iron-chest"},
    max_health = 200,
    corpse = "small-remnants",
    open_sound = { filename = "__base__/sound/metallic-chest-open.ogg", volume=0.65 },
    close_sound = { filename = "__base__/sound/metallic-chest-close.ogg", volume = 0.7 },
    resistances =
    {
      {
        type = "fire",
        percent = 80
      },
      {
        type = "impact",
        percent = 30
      }
    },
    collision_box = {{-0.35, -0.35}, {0.35, 0.35}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    fast_replaceable_group = "container",
    inventory_size = 32,
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    picture =
    {
      filename = "__base__/graphics/entity/iron-chest/iron-chest.png",
      priority = "extra-high",
      width = 48,
      height = 34,
      shift = {0.1875, 0}
    },
    circuit_wire_connection_point =
    {
      shadow =
      {
        red = {0.734375, 0.453125},
        green = {0.609375, 0.515625},
      },
      wire =
      {
        red = {0.40625, 0.21875},
        green = {0.40625, 0.375},
      }
    },
    circuit_connector_sprites = get_circuit_connector_sprites({0.1875, 0.15625}, nil, 18),
    circuit_wire_max_distance = 9
  },
  {
    type = "container",
    name = "steel-chest",
    icon = "__base__/graphics/icons/steel-chest.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 1, result = "steel-chest"},
    max_health = 350,
    corpse = "small-remnants",
    open_sound = { filename = "__base__/sound/metallic-chest-open.ogg", volume=0.65 },
    close_sound = { filename = "__base__/sound/metallic-chest-close.ogg", volume = 0.7 },
    resistances =
    {
      {
        type = "fire",
        percent = 90
      },
      {
        type = "impact",
        percent = 60
      }
    },
    collision_box = {{-0.35, -0.35}, {0.35, 0.35}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    fast_replaceable_group = "container",
    inventory_size = 48,
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    picture =
    {
      filename = "__base__/graphics/entity/steel-chest/steel-chest.png",
      priority = "extra-high",
      width = 48,
      height = 34,
      shift = {0.1875, 0}
    },
    circuit_wire_connection_point =
    {
      shadow =
      {
        red = {0.734375, 0.453125},
        green = {0.609375, 0.515625},
      },
      wire =
      {
        red = {0.40625, 0.21875},
        green = {0.40625, 0.375},
      }
    },
    circuit_connector_sprites = get_circuit_connector_sprites({0.1875, 0.15625}, nil, 18),
    circuit_wire_max_distance = 9
  },
  {
    type = "inserter",
    name = "long-handed-inserter",
    icon = "__base__/graphics/icons/long-handed-inserter.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "long-handed-inserter"},
    max_health = 160,
    corpse = "small-remnants",
    allow_custom_vectors = false,
    resistances =
    {
      {
        type = "fire",
        percent = 90
      }
    },
    collision_box = {{-0.15, -0.15}, {0.15, 0.15}},
    selection_box = {{-0.4, -0.35}, {0.4, 0.45}},
    pickup_position = {0, -2},
    insert_position = {0, 2.2},
    energy_per_movement = 5000,
    energy_per_rotation = 5000,
    rotation_speed = 0.02,
    extension_speed = 0.0457,
    hand_size = 1.5,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      drain = "0.4kW"
    },
    fast_replaceable_group = "long-handed-inserter",
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      match_progress_to_activity = true,
      sound =
      {
        {
          filename = "__base__/sound/inserter-long-handed-1.ogg",
          volume = 0.75
        },
        {
          filename = "__base__/sound/inserter-long-handed-2.ogg",
          volume = 0.75
        },
        {
          filename = "__base__/sound/inserter-long-handed-3.ogg",
          volume = 0.75
        },
        {
          filename = "__base__/sound/inserter-long-handed-4.ogg",
          volume = 0.75
        },
        {
          filename = "__base__/sound/inserter-long-handed-5.ogg",
          volume = 0.75
        }
      }
    },
    hand_base_picture =
    {
      filename = "__base__/graphics/entity/long-handed-inserter/long-handed-inserter-hand-base.png",
      priority = "extra-high",
      width = 8,
      height = 34,
      hr_version = {
        filename = "__base__/graphics/entity/long-handed-inserter/hr-long-handed-inserter-hand-base.png",
        priority = "extra-high",
        width = 32,
        height = 136,
        scale = 0.25
      }
    },
    hand_closed_picture =
    {
      filename = "__base__/graphics/entity/long-handed-inserter/long-handed-inserter-hand-closed.png",
      priority = "extra-high",
      width = 18,
      height = 41,
      hr_version = {
        filename = "__base__/graphics/entity/long-handed-inserter/hr-long-handed-inserter-hand-closed.png",
        priority = "extra-high",
        width = 72,
        height = 164,
        scale = 0.25
      }
    },
    hand_open_picture =
    {
      filename = "__base__/graphics/entity/long-handed-inserter/long-handed-inserter-hand-open.png",
      priority = "extra-high",
      width = 18,
      height = 41,
      hr_version = {
        filename = "__base__/graphics/entity/long-handed-inserter/hr-long-handed-inserter-hand-open.png",
        priority = "extra-high",
        width = 72,
        height = 164,
        scale = 0.25
      }
    },
    hand_base_shadow =
    {
      filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-base-shadow.png",
      priority = "extra-high",
      width = 8,
      height = 33,
      hr_version = {
        filename = "__base__/graphics/entity/burner-inserter/hr-burner-inserter-hand-base-shadow.png",
        priority = "extra-high",
        width = 32,
        height = 132,
        scale = 0.25
      }
    },
    hand_closed_shadow =
    {
      filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-closed-shadow.png",
      priority = "extra-high",
      width = 18,
      height = 41,
      hr_version = {
        filename = "__base__/graphics/entity/burner-inserter/hr-burner-inserter-hand-closed-shadow.png",
        priority = "extra-high",
        width = 72,
        height = 164,
        scale = 0.25
      }
    },
    hand_open_shadow =
    {
      filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-open-shadow.png",
      priority = "extra-high",
      width = 18,
      height = 41,
      hr_version = {
        filename = "__base__/graphics/entity/burner-inserter/hr-burner-inserter-hand-open-shadow.png",
        priority = "extra-high",
        width = 72,
        height = 164,
        scale = 0.25
      }
    },
    platform_picture =
    {
      sheet =
      {
        filename = "__base__/graphics/entity/long-handed-inserter/long-handed-inserter-platform.png",
        priority = "extra-high",
        width = 46,
        height = 46,
        shift = {0.09375, 0},
        hr_version = {
          filename = "__base__/graphics/entity/long-handed-inserter/hr-long-handed-inserter-platform.png",
          priority = "extra-high",
          width = 105,
          height = 79,
          shift = util.by_pixel(1.5, 7.5-1),
          scale = 0.5
        }
      }
    },
    circuit_wire_connection_point = inserter_circuit_wire_connection_point,
    circuit_connector_sprites = inserter_circuit_connector_sprites,
    circuit_wire_max_distance = inserter_circuit_wire_max_distance,
    default_stack_control_input_signal = inserter_default_stack_control_input_signal
  },
  {
    type = "inserter",
    name = "fast-inserter",
    icon = "__base__/graphics/icons/fast-inserter.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    allow_custom_vectors = false,
    minable =
    {
      hardness = 0.2,
      mining_time = 0.5,
      result = "fast-inserter"
    },
    max_health = 150,
    corpse = "small-remnants",
    resistances =
    {
      {
        type = "fire",
        percent = 90
      }
    },
    collision_box = {{-0.15, -0.15}, {0.15, 0.15}},
    selection_box = {{-0.4, -0.35}, {0.4, 0.45}},
    pickup_position = {0, -1},
    insert_position = {0, 1.2},
    energy_per_movement = 7000,
    energy_per_rotation = 7000,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      drain = "0.5kW"
    },
    extension_speed = 0.07,
    rotation_speed = 0.04,
    fast_replaceable_group = "inserter",
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      match_progress_to_activity = true,
      sound =
      {
        {
          filename = "__base__/sound/inserter-fast-1.ogg",
          volume = 0.75
        },
        {
          filename = "__base__/sound/inserter-fast-2.ogg",
          volume = 0.75
        },
        {
          filename = "__base__/sound/inserter-fast-3.ogg",
          volume = 0.75
        },
        {
          filename = "__base__/sound/inserter-fast-4.ogg",
          volume = 0.75
        },
        {
          filename = "__base__/sound/inserter-fast-5.ogg",
          volume = 0.75
        }
      }
    },
    hand_base_picture =
    {
      filename = "__base__/graphics/entity/fast-inserter/fast-inserter-hand-base.png",
      priority = "extra-high",
      width = 8,
      height = 34,
      hr_version = {
        filename = "__base__/graphics/entity/fast-inserter/hr-fast-inserter-hand-base.png",
        priority = "extra-high",
        width = 32,
        height = 136,
        scale = 0.25
      }
    },
    hand_closed_picture =
    {
      filename = "__base__/graphics/entity/fast-inserter/fast-inserter-hand-closed.png",
      priority = "extra-high",
      width = 18,
      height = 41,
      hr_version = {
        filename = "__base__/graphics/entity/fast-inserter/hr-fast-inserter-hand-closed.png",
        priority = "extra-high",
        width = 72,
        height = 164,
        scale = 0.25
      }
    },
    hand_open_picture =
    {
      filename = "__base__/graphics/entity/fast-inserter/fast-inserter-hand-open.png",
      priority = "extra-high",
      width = 18,
      height = 41,
      hr_version = {
        filename = "__base__/graphics/entity/fast-inserter/hr-fast-inserter-hand-open.png",
        priority = "extra-high",
        width = 72,
        height = 164,
        scale = 0.25
      }
    },
    hand_base_shadow =
    {
      filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-base-shadow.png",
      priority = "extra-high",
      width = 8,
      height = 33,
      hr_version = {
        filename = "__base__/graphics/entity/burner-inserter/hr-burner-inserter-hand-base-shadow.png",
        priority = "extra-high",
        width = 32,
        height = 132,
        scale = 0.25
      }
    },
    hand_closed_shadow =
    {
      filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-closed-shadow.png",
      priority = "extra-high",
      width = 18,
      height = 41,
      hr_version = {
        filename = "__base__/graphics/entity/burner-inserter/hr-burner-inserter-hand-closed-shadow.png",
        priority = "extra-high",
        width = 72,
        height = 164,
        scale = 0.25
      }
    },
    hand_open_shadow =
    {
      filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-open-shadow.png",
      priority = "extra-high",
      width = 18,
      height = 41,
      hr_version = {
        filename = "__base__/graphics/entity/burner-inserter/hr-burner-inserter-hand-open-shadow.png",
        priority = "extra-high",
        width = 72,
        height = 164,
        scale = 0.25
      }
    },
    platform_picture =
    {
      sheet =
      {
        filename = "__base__/graphics/entity/fast-inserter/fast-inserter-platform.png",
        priority = "extra-high",
        width = 46,
        height = 46,
        shift = {0.09375, 0},
        hr_version = {
          filename = "__base__/graphics/entity/fast-inserter/hr-fast-inserter-platform.png",
          priority = "extra-high",
          width = 105,
          height = 79,
          shift = util.by_pixel(1.5, 7.5-1),
          scale = 0.5
        }
      }
    },
    circuit_wire_connection_point = inserter_circuit_wire_connection_point,
    circuit_connector_sprites = inserter_circuit_connector_sprites,
    circuit_wire_max_distance = inserter_circuit_wire_max_distance,
    default_stack_control_input_signal = inserter_default_stack_control_input_signal
  },

  {
    type = "inserter",
    name = "stack-inserter",
    icon = "__base__/graphics/icons/stack-inserter.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    stack = true,
    allow_custom_vectors = false,
    minable =
    {
      hardness = 0.2,
      mining_time = 0.5,
      result = "stack-inserter"
    },
    max_health = 160,
    corpse = "small-remnants",
    resistances =
    {
      {
        type = "fire",
        percent = 90
      }
    },
    collision_box = {{-0.15, -0.15}, {0.15, 0.15}},
    selection_box = {{-0.4, -0.35}, {0.4, 0.45}},
    pickup_position = {0, -1},
    insert_position = {0, 1.2},
    energy_per_movement = 20000,
    energy_per_rotation = 20000,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      drain = "1kW"
    },
    extension_speed = 0.07,
    rotation_speed = 0.04,
    fast_replaceable_group = "inserter",
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      match_progress_to_activity = true,
      sound =
      {
        {
          filename = "__base__/sound/inserter-fast-1.ogg",
          volume = 0.75
        },
        {
          filename = "__base__/sound/inserter-fast-2.ogg",
          volume = 0.75
        },
        {
          filename = "__base__/sound/inserter-fast-3.ogg",
          volume = 0.75
        },
        {
          filename = "__base__/sound/inserter-fast-4.ogg",
          volume = 0.75
        },
        {
          filename = "__base__/sound/inserter-fast-5.ogg",
          volume = 0.75
        }
      }
    },
    hand_base_picture =
    {
      filename = "__base__/graphics/entity/stack-inserter/stack-inserter-hand-base.png",
      priority = "extra-high",
      width = 8,
      height = 34,
      hr_version = {
        filename = "__base__/graphics/entity/stack-inserter/hr-stack-inserter-hand-base.png",
        priority = "extra-high",
        width = 32,
        height = 136,
        scale = 0.25
      }
    },
    hand_closed_picture =
    {
      filename = "__base__/graphics/entity/stack-inserter/stack-inserter-hand-closed.png",
      priority = "extra-high",
      width = 24,
      height = 41,
      hr_version = {
        filename = "__base__/graphics/entity/stack-inserter/hr-stack-inserter-hand-closed.png",
        priority = "extra-high",
        width = 100,
        height = 164,
        scale = 0.25
      }
    },
    hand_open_picture =
    {
      filename = "__base__/graphics/entity/stack-inserter/stack-inserter-hand-open.png",
      priority = "extra-high",
      width = 32,
      height = 41,
      hr_version = {
        filename = "__base__/graphics/entity/stack-inserter/hr-stack-inserter-hand-open.png",
        priority = "extra-high",
        width = 130,
        height = 164,
        scale = 0.25
      }
    },
    hand_base_shadow =
    {
      filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-base-shadow.png",
      priority = "extra-high",
      width = 8,
      height = 33,
      hr_version = {
        filename = "__base__/graphics/entity/burner-inserter/hr-burner-inserter-hand-base-shadow.png",
        priority = "extra-high",
        width = 32,
        height = 132,
        scale = 0.25
      }
    },
    hand_closed_shadow =
    {
      filename = "__base__/graphics/entity/stack-inserter/stack-inserter-hand-closed-shadow.png",
      priority = "extra-high",
      width = 24,
      height = 41,
      hr_version = {
        filename = "__base__/graphics/entity/stack-inserter/hr-stack-inserter-hand-closed-shadow.png",
        priority = "extra-high",
        width = 100,
        height = 164,
        scale = 0.25
      }
    },
    hand_open_shadow =
    {
      filename = "__base__/graphics/entity/stack-inserter/stack-inserter-hand-open-shadow.png",
      priority = "extra-high",
      width = 32,
      height = 41,
      hr_version = {
        filename = "__base__/graphics/entity/stack-inserter/hr-stack-inserter-hand-open-shadow.png",
        priority = "extra-high",
        width = 130,
        height = 164,
        scale = 0.25
      }
    },
    platform_picture =
    {
      sheet =
      {
        filename = "__base__/graphics/entity/stack-inserter/stack-inserter-platform.png",
        priority = "extra-high",
        width = 46,
        height = 46,
        shift = {0.09375, 0},
        hr_version = {
          filename = "__base__/graphics/entity/stack-inserter/hr-stack-inserter-platform.png",
          priority = "extra-high",
          width = 105,
          height = 79,
          shift = util.by_pixel(1.5, 7.5-1),
          scale = 0.5
        }
      }
    },
    circuit_wire_connection_point = inserter_circuit_wire_connection_point,
    circuit_connector_sprites = inserter_circuit_connector_sprites,
    circuit_wire_max_distance = inserter_circuit_wire_max_distance,
    default_stack_control_input_signal = inserter_default_stack_control_input_signal
  },

  {
    type = "inserter",
    name = "stack-filter-inserter",
    icon = "__base__/graphics/icons/stack-filter-inserter.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    stack = true,
    allow_custom_vectors = false,
    filter_count = 1,
    minable =
    {
      hardness = 0.2,
      mining_time = 0.5,
      result = "stack-filter-inserter"
    },
    max_health = 160,
    corpse = "small-remnants",
    resistances =
    {
      {
        type = "fire",
        percent = 90
      }
    },
    collision_box = {{-0.15, -0.15}, {0.15, 0.15}},
    selection_box = {{-0.4, -0.35}, {0.4, 0.45}},
    pickup_position = {0, -1},
    insert_position = {0, 1.2},
    energy_per_movement = 20000,
    energy_per_rotation = 20000,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      drain = "1kW"
    },
    extension_speed = 0.07,
    rotation_speed = 0.04,
    fast_replaceable_group = "inserter",
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      match_progress_to_activity = true,
      sound =
      {
        {
          filename = "__base__/sound/inserter-fast-1.ogg",
          volume = 0.75
        },
        {
          filename = "__base__/sound/inserter-fast-2.ogg",
          volume = 0.75
        },
        {
          filename = "__base__/sound/inserter-fast-3.ogg",
          volume = 0.75
        },
        {
          filename = "__base__/sound/inserter-fast-4.ogg",
          volume = 0.75
        },
        {
          filename = "__base__/sound/inserter-fast-5.ogg",
          volume = 0.75
        }
      }
    },
    hand_base_picture =
    {
      filename = "__base__/graphics/entity/stack-filter-inserter/stack-filter-inserter-hand-base.png",
      priority = "extra-high",
      width = 8,
      height = 34,
      hr_version = {
        filename = "__base__/graphics/entity/stack-filter-inserter/hr-stack-filter-inserter-hand-base.png",
        priority = "extra-high",
        width = 32,
        height = 136,
        scale = 0.25      
      }
    },
    hand_closed_picture =
    {
      filename = "__base__/graphics/entity/stack-filter-inserter/stack-filter-inserter-hand-closed.png",
      priority = "extra-high",
      width = 24,
      height = 41,
      hr_version = {
        filename = "__base__/graphics/entity/stack-filter-inserter/hr-stack-filter-inserter-hand-closed.png",
        priority = "extra-high",
        width = 100,
        height = 164,
        scale = 0.25      
      }
    },
    hand_open_picture =
    {
      filename = "__base__/graphics/entity/stack-filter-inserter/stack-filter-inserter-hand-open.png",
      priority = "extra-high",
      width = 32,
      height = 41,
      hr_version = {
        filename = "__base__/graphics/entity/stack-filter-inserter/hr-stack-filter-inserter-hand-open.png",
        priority = "extra-high",
        width = 130,
        height = 164,
        scale = 0.25
      }
    },
    hand_base_shadow =
    {
      filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-base-shadow.png",
      priority = "extra-high",
      width = 8,
      height = 33,
      hr_version = {
        filename = "__base__/graphics/entity/burner-inserter/hr-burner-inserter-hand-base-shadow.png",
        priority = "extra-high",
        width = 32,
        height = 132,
        scale = 0.25
      }
    },
    hand_closed_shadow =
    {
      filename = "__base__/graphics/entity/stack-inserter/stack-inserter-hand-closed-shadow.png",
      priority = "extra-high",
      width = 24,
      height = 41,
      hr_version = {
        filename = "__base__/graphics/entity/stack-inserter/hr-stack-inserter-hand-closed-shadow.png",
        priority = "extra-high",
        width = 100,
        height = 164,
        scale = 0.25
      }
    },
    hand_open_shadow =
    {
      filename = "__base__/graphics/entity/stack-inserter/stack-inserter-hand-open-shadow.png",
      priority = "extra-high",
      width = 32,
      height = 41,
      hr_version = {
        filename = "__base__/graphics/entity/stack-inserter/hr-stack-inserter-hand-open-shadow.png",
        priority = "extra-high",
        width = 130,
        height = 164,
        scale = 0.25
      }
    },
    platform_picture =
    {
      sheet =
      {
        filename = "__base__/graphics/entity/stack-filter-inserter/stack-filter-inserter-platform.png",
        priority = "extra-high",
        width = 46,
        height = 46,
        shift = {0.09375, 0},
        hr_version = {
          filename = "__base__/graphics/entity/stack-filter-inserter/hr-stack-filter-inserter-platform.png",
          priority = "extra-high",
          width = 105,
          height = 79,
          shift = util.by_pixel(1.5, 7.5-1),
          scale = 0.5
        }
      }
    },
    circuit_wire_connection_point = inserter_circuit_wire_connection_point,
    circuit_connector_sprites = inserter_circuit_connector_sprites,
    circuit_wire_max_distance = inserter_circuit_wire_max_distance,
    default_stack_control_input_signal = inserter_default_stack_control_input_signal
  },

  {
    type = "inserter",
    name = "filter-inserter",
    icon = "__base__/graphics/icons/filter-inserter.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "filter-inserter"},
    max_health = 150,
    allow_custom_vectors = false,
    corpse = "small-remnants",
    resistances =
    {
      {
        type = "fire",
        percent = 90
      }
    },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      match_progress_to_activity = true,
      sound =
      {
        {
          filename = "__base__/sound/inserter-fast-1.ogg",
          volume = 0.75
        },
        {
          filename = "__base__/sound/inserter-fast-2.ogg",
          volume = 0.75
        },
        {
          filename = "__base__/sound/inserter-fast-3.ogg",
          volume = 0.75
        },
        {
          filename = "__base__/sound/inserter-fast-4.ogg",
          volume = 0.75
        },
        {
          filename = "__base__/sound/inserter-fast-5.ogg",
          volume = 0.75
        }
      }
    },
    collision_box = {{-0.15, -0.15}, {0.15, 0.15}},
    selection_box = {{-0.4, -0.35}, {0.4, 0.45}},
    pickup_position = {0, -1},
    insert_position = {0, 1.2},
    energy_per_movement = 8000,
    energy_per_rotation = 8000,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      drain = "0.5kW"
    },
    extension_speed = 0.07,
    rotation_speed = 0.04,
    fast_replaceable_group = "inserter",
    filter_count = 5,
    hand_base_picture =
    {
      filename = "__base__/graphics/entity/filter-inserter/filter-inserter-hand-base.png",
      priority = "extra-high",
      width = 8,
      height = 34,
      hr_version = {
        filename = "__base__/graphics/entity/filter-inserter/hr-filter-inserter-hand-base.png",
        priority = "extra-high",
        width = 32,
        height = 136,
        scale = 0.25
      }
    },
    hand_closed_picture =
    {
      filename = "__base__/graphics/entity/filter-inserter/filter-inserter-hand-closed.png",
      priority = "extra-high",
      width = 18,
      height = 41,
      hr_version = {
        filename = "__base__/graphics/entity/filter-inserter/hr-filter-inserter-hand-closed.png",
        priority = "extra-high",
        width = 72,
        height = 164,
        scale = 0.25
      }
    },
    hand_open_picture =
    {
      filename = "__base__/graphics/entity/filter-inserter/filter-inserter-hand-open.png",
      priority = "extra-high",
      width = 18,
      height = 41,
      hr_version = {
        filename = "__base__/graphics/entity/filter-inserter/hr-filter-inserter-hand-open.png",
        priority = "extra-high",
        width = 72,
        height = 164,
        scale = 0.25
      }
    },
    hand_base_shadow =
    {
      filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-base-shadow.png",
      priority = "extra-high",
      width = 8,
      height = 33,
      hr_version = {
        filename = "__base__/graphics/entity/burner-inserter/hr-burner-inserter-hand-base-shadow.png",
        priority = "extra-high",
        width = 32,
        height = 132,
        scale = 0.25
      }
    },
    hand_closed_shadow =
    {
      filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-closed-shadow.png",
      priority = "extra-high",
      width = 18,
      height = 41,
      hr_version = {
        filename = "__base__/graphics/entity/burner-inserter/hr-burner-inserter-hand-closed-shadow.png",
        priority = "extra-high",
        width = 72,
        height = 164,
        scale = 0.25
      }
    },
    hand_open_shadow =
    {
      filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-open-shadow.png",
      priority = "extra-high",
      width = 18,
      height = 41,
      hr_version = {
        filename = "__base__/graphics/entity/burner-inserter/hr-burner-inserter-hand-open-shadow.png",
        priority = "extra-high",
        width = 72,
        height = 164,
        scale = 0.25
      }
    },
    platform_picture =
    {
      sheet=
      {
        filename = "__base__/graphics/entity/filter-inserter/filter-inserter-platform.png",
        priority = "extra-high",
        width = 46,
        height = 46,
        shift = {0.09375, 0},
        hr_version = {
          filename = "__base__/graphics/entity/filter-inserter/hr-filter-inserter-platform.png",
          priority = "extra-high",
          width = 105,
          height = 79,
          shift = util.by_pixel(1.5, 7.5-1),
          scale = 0.5
        }
      }
    },

    circuit_wire_connection_point = inserter_circuit_wire_connection_point,
    circuit_connector_sprites = inserter_circuit_connector_sprites,
    circuit_wire_max_distance = inserter_circuit_wire_max_distance,
    default_stack_control_input_signal = inserter_default_stack_control_input_signal
  },
  {
    type = "solar-panel",
    name = "solar-panel",
    icon = "__base__/graphics/icons/solar-panel.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "solar-panel"},
    max_health = 200,
    corpse = "big-remnants",
    collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    energy_source =
    {
      type = "electric",
      usage_priority = "solar"
    },
    picture =
    {
      filename = "__base__/graphics/entity/solar-panel/solar-panel.png",
      priority = "high",
      width = 104,
      height = 96
    },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    production = "60kW"  
  },
  {
    type = "locomotive",
    name = "locomotive",
    icon = "__base__/graphics/icons/diesel-locomotive.png",
    flags = {"placeable-neutral", "player-creation", "placeable-off-grid", "not-on-map"},
    minable = {mining_time = 1, result = "locomotive"},
    mined_sound = {filename = "__core__/sound/deconstruct-medium.ogg"},
    max_health = 1000,
    corpse = "medium-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-0.6, -2.6}, {0.6, 2.6}},
    selection_box = {{-1, -3}, {1, 3}},
    drawing_box = {{-1, -4}, {1, 3}},
    weight = 2000,
    max_speed = 1.2,
    max_power = "600kW",
    reversing_power_modifier = 0.6,
    braking_force = 10,
    friction_force = 0.50,
    vertical_selection_shift = -0.5,
    air_resistance = 0.0075, -- this is a percentage of current speed that will be subtracted
    connection_distance = 3,
    joint_distance = 4,
    energy_per_hit_point = 5,
    resistances =
    {
      {
        type = "fire",
        decrease = 15,
        percent = 50
      },
      {
        type = "physical",
        decrease = 15,
        percent = 30
      },
      {
        type = "impact",
        decrease = 50,
        percent = 60
      },
      {
        type = "explosion",
        decrease = 15,
        percent = 30
      },
      {
        type = "acid",
        decrease = 10,
        percent = 20
      }
    },
    burner =
    {
      fuel_category = "chemical",
      effectivity = 1,
      fuel_inventory_size = 3,
      smoke =
      {
        {
          name = "train-smoke",
          deviation = {0.3, 0.3},
          frequency = 100,
          position = {0, 0},
          starting_frame = 0,
          starting_frame_deviation = 60,
          height = 2,
          height_deviation = 0.5,
          starting_vertical_speed = 0.2,
          starting_vertical_speed_deviation = 0.1,
        }
      }
    },
    front_light =
    {
      {
        type = "oriented",
        minimum_darkness = 0.3,
        picture =
        {
          filename = "__core__/graphics/light-cone.png",
          priority = "extra-high",
          flags = { "light" },
          scale = 2,
          width = 200,
          height = 200
        },
        shift = {-0.6, -16},
        size = 2,
        intensity = 0.6,
        color = {r = 1.0, g = 0.9, b = 0.9}
      },
      {
        type = "oriented",
        minimum_darkness = 0.3,
        picture =
        {
          filename = "__core__/graphics/light-cone.png",
          priority = "extra-high",
          flags = { "light" },
          scale = 2,
          width = 200,
          height = 200
        },
        shift = {0.6, -16},
        size = 2,
        intensity = 0.6,
        color = {r = 1.0, g = 0.9, b = 0.9}
      }
    },
    back_light = rolling_stock_back_light(),
    stand_by_light = rolling_stock_stand_by_light(),
    color = {r = 0.92, g = 0.07, b = 0, a = 0.5},
    pictures =
    {
      layers =
      {
        {
          priority = "very-low",
          width = 238,
          height = 230,
          direction_count = 256,
          filenames =
          {
            "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-01.png",
            "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-02.png",
            "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-03.png",
            "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-04.png",
            "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-05.png",
            "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-06.png",
            "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-07.png",
            "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-08.png"
          },
          line_length = 4,
          lines_per_file = 8,
          shift = {0.0, -0.5},
          hr_version =
            {
            priority = "very-low",
            width = 474,
            height = 458,
            direction_count = 256,
            filenames =
            {
              "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-1.png",
              "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-2.png",
              "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-3.png",
              "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-4.png",
              "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-5.png",
              "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-6.png",
              "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-7.png",
              "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-8.png",
              "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-9.png",
              "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-10.png",
              "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-11.png",
              "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-12.png",
              "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-13.png",
              "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-14.png",
              "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-15.png",
              "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-16.png"
            },
            line_length = 4,
            lines_per_file = 4,
            shift = {0.0, -0.5},
            scale = 0.5
            }
        },
        {
          priority = "very-low",
          flags = { "mask" },
          width = 236,
          height = 228,
          direction_count = 256,
          filenames =
          {
            "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-mask-01.png",
            "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-mask-02.png",
            "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-mask-03.png",
            "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-mask-04.png",
            "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-mask-05.png",
            "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-mask-06.png",
            "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-mask-07.png",
            "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-mask-08.png"
          },
          line_length = 4,
          lines_per_file = 8,
          shift = {0.0, -0.5},
          apply_runtime_tint = true,
          hr_version =
            {
              priority = "very-low",
              flags = { "mask" },
              width = 472,
              height = 456,
              direction_count = 256,
              filenames =
              {
                "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-mask-1.png",
                "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-mask-2.png",
                "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-mask-3.png",
                "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-mask-4.png",
                "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-mask-5.png",
                "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-mask-6.png",
                "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-mask-7.png",
                "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-mask-8.png",
                "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-mask-9.png",
                "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-mask-10.png",
                "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-mask-11.png",
                "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-mask-12.png",
                "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-mask-13.png",
                "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-mask-14.png",
                "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-mask-15.png",
                "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-mask-16.png"
              },
              line_length = 4,
              lines_per_file = 4,
              shift = {0.0, -0.5},
              apply_runtime_tint = true,
              scale = 0.5
            }
        },
        {
          priority = "very-low",
          flags = { "shadow" },
          width = 253,
          height = 212,
          direction_count = 256,
          draw_as_shadow = true,
          filenames =
          {
            "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-shadow-01.png",
            "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-shadow-02.png",
            "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-shadow-03.png",
            "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-shadow-04.png",
            "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-shadow-05.png",
            "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-shadow-06.png",
            "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-shadow-07.png",
            "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-shadow-08.png"
          },
          line_length = 4,
          lines_per_file = 8,
          shift = {1, 0.3}
        }
      }
    },
    wheels = standard_train_wheels,
    rail_category = "regular",
    stop_trigger =
    {
      -- left side
      {
        type = "create-smoke",
        repeat_count = 125,
        entity_name = "smoke-train-stop",
        initial_height = 0,
        -- smoke goes to the left
        speed = {-0.03, 0},
        speed_multiplier = 0.75,
        speed_multiplier_deviation = 1.1,
        offset_deviation = {{-0.75, -2.7}, {-0.3, 2.7}}
      },
      -- right side
      {
        type = "create-smoke",
        repeat_count = 125,
        entity_name = "smoke-train-stop",
        initial_height = 0,
        -- smoke goes to the right
        speed = {0.03, 0},
        speed_multiplier = 0.75,
        speed_multiplier_deviation = 1.1,
        offset_deviation = {{0.3, -2.7}, {0.75, 2.7}}
      },
      {
        type = "play-sound",
        sound =
        {
          {
            filename = "__base__/sound/train-breaks.ogg",
            volume = 0.6
          },
        }
      },
    },
    drive_over_tie_trigger = drive_over_tie(),
    tie_distance = 50,
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/train-engine.ogg",
        volume = 0.4
      },
      match_speed_to_activity = true,
    },
    open_sound = { filename = "__base__/sound/car-door-open.ogg", volume=0.7 },
    close_sound = { filename = "__base__/sound/car-door-close.ogg", volume = 0.7 },
    sound_minimum_speed = 0.5;
  },
  {
    type = "cargo-wagon",
    name = "cargo-wagon",
    icon = "__base__/graphics/icons/cargo-wagon.png",
    flags = {"placeable-neutral", "player-creation", "placeable-off-grid", "not-on-map"},
    inventory_size = 40,
    minable = {mining_time = 1, result = "cargo-wagon"},
    mined_sound = {filename = "__core__/sound/deconstruct-medium.ogg"},
    max_health = 600,
    corpse = "medium-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-0.6, -2.4}, {0.6, 2.4}},
    selection_box = {{-1, -2.703125}, {1, 3.296875}},
    vertical_selection_shift = -0.796875,
    weight = 1000,
    max_speed = 1.5,
    braking_force = 3,
    friction_force = 0.50,
    air_resistance = 0.01,
    connection_distance = 3,
    joint_distance = 4,
    energy_per_hit_point = 5,
    resistances =
    {
      {
        type = "fire",
        decrease = 15,
        percent = 50
      },
      {
        type = "physical",
        decrease = 15,
        percent = 30
      },
      {
        type = "impact",
        decrease = 50,
        percent = 60
      },
      {
        type = "explosion",
        decrease = 15,
        percent = 30
      },
      {
        type = "acid",
        decrease = 10,
        percent = 20
      }
    },
    back_light = rolling_stock_back_light(),
    stand_by_light = rolling_stock_stand_by_light(),
    color = {r = 0.43, g = 0.23, b = 0, a = 0.5},
    pictures =
    {
      layers =
      {
        {
          priority = "very-low",
          width = 222,
          height = 205,
          back_equals_front = true,
          direction_count = 128,
          filenames =
          {
            "__base__/graphics/entity/cargo-wagon/cargo-wagon-1.png",
            "__base__/graphics/entity/cargo-wagon/cargo-wagon-2.png",
            "__base__/graphics/entity/cargo-wagon/cargo-wagon-3.png",
            "__base__/graphics/entity/cargo-wagon/cargo-wagon-4.png"
          },
          line_length = 4,
          lines_per_file = 8,
          shift = {0, -0.796875},
          hr_version =
          {
            priority = "very-low",
            width = 442,
            height = 407,
            back_equals_front = true,
            direction_count = 128,
            filenames =
            {
              "__base__/graphics/entity/cargo-wagon/hr-cargo-wagon-1.png",
              "__base__/graphics/entity/cargo-wagon/hr-cargo-wagon-2.png",
              "__base__/graphics/entity/cargo-wagon/hr-cargo-wagon-3.png",
              "__base__/graphics/entity/cargo-wagon/hr-cargo-wagon-4.png"
            },
            line_length = 4,
            lines_per_file = 8,
            shift = util.by_pixel(0, -25.25),
            scale = 0.5
          }
        },
        {
          flags = { "mask" },
          priority = "very-low",
          width = 196,
          height = 174,
          direction_count = 128,
          back_equals_front = true,
          apply_runtime_tint = true,
          shift = {0, -1.125},
          filenames =
          {
            "__base__/graphics/entity/cargo-wagon/cargo-wagon-mask-1.png",
            "__base__/graphics/entity/cargo-wagon/cargo-wagon-mask-2.png",
            "__base__/graphics/entity/cargo-wagon/cargo-wagon-mask-3.png"
          },
          line_length = 4,
          lines_per_file = 11,
          hr_version =
          {
            flags = { "mask" },
            priority = "very-low",
            width = 406,
            height = 371,
            direction_count = 128,
            back_equals_front = true,
            apply_runtime_tint = true,
            shift = util.by_pixel(-0.5, -30.25),
            filenames =
            {
              "__base__/graphics/entity/cargo-wagon/hr-cargo-wagon-mask-1.png",
              "__base__/graphics/entity/cargo-wagon/hr-cargo-wagon-mask-2.png",
              "__base__/graphics/entity/cargo-wagon/hr-cargo-wagon-mask-3.png"
            },
            line_length = 4,
            lines_per_file = 11,
            scale = 0.5
          }
        },
        {
          flags = { "shadow" },
          priority = "very-low",
          width = 246,
          height = 201,
          back_equals_front = true,
          draw_as_shadow = true,
          direction_count = 128,
          filenames =
          {
            "__base__/graphics/entity/cargo-wagon/cargo-wagon-shadow-1.png",
            "__base__/graphics/entity/cargo-wagon/cargo-wagon-shadow-2.png",
            "__base__/graphics/entity/cargo-wagon/cargo-wagon-shadow-3.png",
            "__base__/graphics/entity/cargo-wagon/cargo-wagon-shadow-4.png"
          },
          line_length = 4,
          lines_per_file = 8,
          shift = {0.8, -0.078125},
          hr_version =
          {
            flags = { "shadow" },
            priority = "very-low",
            width = 490,
            height = 401,
            back_equals_front = true,
            draw_as_shadow = true,
            direction_count = 128,
            filenames =
            {
              "__base__/graphics/entity/cargo-wagon/hr-cargo-wagon-shadow-1.png",
              "__base__/graphics/entity/cargo-wagon/hr-cargo-wagon-shadow-2.png",
              "__base__/graphics/entity/cargo-wagon/hr-cargo-wagon-shadow-3.png",
              "__base__/graphics/entity/cargo-wagon/hr-cargo-wagon-shadow-4.png"
            },
            line_length = 4,
            lines_per_file = 8,
            shift = util.by_pixel(32, -2.25),
            scale = 0.5
          }
        }
      }
    },
    horizontal_doors =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/cargo-wagon/cargo-wagon-door-horizontal-end.png",
          line_length = 1,
          width = 220,
          height = 33,
          frame_count = 8,
          shift = {0, -0.921875},
          hr_version =
          {
            filename = "__base__/graphics/entity/cargo-wagon/hr-cargo-wagon-door-horizontal-end.png",
            line_length = 1,
            width = 438,
            height = 63,
            frame_count = 8,
            shift = util.by_pixel(0, -29.25),
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/cargo-wagon/cargo-wagon-door-horizontal-side.png",
          line_length = 1,
          width = 186,
          height = 38,
          frame_count = 8,
          shift = {0, -0.78125},
          hr_version =
          {
            filename = "__base__/graphics/entity/cargo-wagon/hr-cargo-wagon-door-horizontal-side.png",
            line_length = 1,
            width = 368,
            height = 76,
            frame_count = 8,
            shift = util.by_pixel(0, -24.5),
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/cargo-wagon/cargo-wagon-door-horizontal-side-mask.png",
          width = 182,
          height = 35,
          line_length = 1,
          frame_count = 8,
          shift = {0, -0.828125},
          apply_runtime_tint = true,
          hr_version =
          {
            filename = "__base__/graphics/entity/cargo-wagon/hr-cargo-wagon-door-horizontal-side-mask.png",
            width = 320,
            height = 69,
            line_length = 1,
            frame_count = 8,
            shift = util.by_pixel(0, -26.25),
            apply_runtime_tint = true,
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/cargo-wagon/cargo-wagon-door-horizontal-top.png",
          line_length = 1,
          width = 184,
          height = 28,
          frame_count = 8,
          shift = {0.015625, -1.125},
          hr_version =
          {
            filename = "__base__/graphics/entity/cargo-wagon/hr-cargo-wagon-door-horizontal-top.png",
            line_length = 1,
            width = 369,
            height = 54,
            frame_count = 8,
            shift = util.by_pixel(0.75, -35.5),
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/cargo-wagon/cargo-wagon-door-horizontal-top-mask.png",
          width = 185,
          height = 23,
          frame_count = 8,
          line_length = 1,
          shift = {0.015625, -1.17188},
          apply_runtime_tint = true,
          hr_version =
          {
            filename = "__base__/graphics/entity/cargo-wagon/hr-cargo-wagon-door-horizontal-top-mask.png",
            width = 369,
            height = 45,
            frame_count = 8,
            line_length = 1,
            shift = util.by_pixel(0.75, -37.75),
            apply_runtime_tint = true,
            scale = 0.5
          }
        }
      }
    },
    vertical_doors =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/cargo-wagon/cargo-wagon-door-vertical-end.png",
          line_length = 8,
          width = 30,
          height = 23,
          frame_count = 8,
          shift = util.by_pixel(0, 62.5),
          hr_version =
          {
            filename = "__base__/graphics/entity/cargo-wagon/hr-cargo-wagon-door-vertical-end.png",
            line_length = 8,
            width = 58,
            height = 44,
            frame_count = 8,
            shift = util.by_pixel(0, 62.5),-- 241),--62.5+178.5),
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/cargo-wagon/cargo-wagon-door-vertical-side.png",
          line_length = 8,
          width = 67,
          height = 169,
          frame_count = 8,
          shift = {0.015625, -1.01563},
          hr_version =
          {
            filename = "__base__/graphics/entity/cargo-wagon/hr-cargo-wagon-door-vertical-side.png",
            line_length = 8,
            width = 127,
            height = 337,
            frame_count = 8,
            shift = util.by_pixel(0.25, -32.75),
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/cargo-wagon/cargo-wagon-door-vertical-side-mask.png",
          line_length = 8,
          width = 56,
          height = 163,
          frame_count = 8,
          shift = {0, -1.10938},
          apply_runtime_tint = true,
          hr_version =
          {
            filename = "__base__/graphics/entity/cargo-wagon/hr-cargo-wagon-door-vertical-side-mask.png",
            line_length = 8,
            width = 112,
            height = 326,
            frame_count = 8,
            shift = util.by_pixel(0, -35.5),
            apply_runtime_tint = true,
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/cargo-wagon/cargo-wagon-door-vertical-top.png",
          line_length = 8,
          width = 32,
          height = 168,
          frame_count = 8,
          shift = {0, -1.125},
          hr_version =
          {
            filename = "__base__/graphics/entity/cargo-wagon/hr-cargo-wagon-door-vertical-top.png",
            line_length = 8,
            width = 64,
            height = 337,
            frame_count = 8,
            shift = util.by_pixel(0, -35.75),
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/cargo-wagon/cargo-wagon-door-vertical-top-mask.png",
          line_length = 8,
          width = 32,
          height = 166,
          frame_count = 8,
          shift = {0, -1.15625},
          apply_runtime_tint = true,
          hr_version =
          {
            filename = "__base__/graphics/entity/cargo-wagon/hr-cargo-wagon-door-vertical-top-mask.png",
            line_length = 8,
            width = 64,
            height = 332,
            frame_count = 8,
            shift = util.by_pixel(0, -37),
            apply_runtime_tint = true,
            scale = 0.5
          }
        }
      }
    },
    wheels = standard_train_wheels,
    rail_category = "regular",
    drive_over_tie_trigger = drive_over_tie(),
    tie_distance = 50,
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/train-wheels.ogg",
        volume = 0.6
      },
      match_volume_to_activity = true,
    },
    crash_trigger = crash_trigger(),
    open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
    close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
    sound_minimum_speed = 0.5;
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 }
  },
  {
    type = "fluid-wagon",
    name = "fluid-wagon",
    icon = "__base__/graphics/icons/fluid-wagon.png",
    flags = {"placeable-neutral", "player-creation", "placeable-off-grid", "not-on-map"},
    minable = {mining_time = 1, result = "fluid-wagon"},
    mined_sound = {filename = "__core__/sound/deconstruct-medium.ogg"},
    max_health = 600,
    total_capacity = 25000 * 3,
    corpse = "medium-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-0.6, -2.4}, {0.6, 2.4}},
    selection_box = {{-1, -2.703125}, {1, 3.296875}},
    gui_front_tank =
    {
      filename = "__base__/graphics/entity/fluid-wagon/gui/front-tank.png",
      width = 64,
      height = 64,
      flags = {"icon"}
    },
    gui_center_tank =
    {
      filename = "__base__/graphics/entity/fluid-wagon/gui/center-tank.png",
      width = 64,
      height = 64,
      flags = {"icon"}
    },
    gui_back_tank =
    {
      filename = "__base__/graphics/entity/fluid-wagon/gui/back-tank.png",
      width = 64,
      height = 64,
      flags = {"icon"}
    },
    gui_connect_front_center_tank =
    {
      filename = "__base__/graphics/entity/fluid-wagon/gui/connector-front-center.png",
      width = 64,
      height = 64,
      flags = {"icon"}
    },
    gui_connect_center_back_tank =
    {
      filename = "__base__/graphics/entity/fluid-wagon/gui/connector-center-back.png",
      width = 64,
      height = 64,
      flags = {"icon"}
    },
    gui_front_center_tank_indiciation =
    {
      filename = "__base__/graphics/entity/fluid-wagon/gui/1.png",
      width = 32,
      height = 32,
      flags = {"icon"}
    },
    gui_center_back_tank_indiciation =
    {
      filename = "__base__/graphics/entity/fluid-wagon/gui/2.png",
      width = 32,
      height = 32,
      flags = {"icon"}
    },
    vertical_selection_shift = -0.796875,
    weight = 3000,
    max_speed = 1.5,
    braking_force = 3,
    friction_force = 0.50,
    air_resistance = 0.01,
    connection_distance = 3,
    joint_distance = 4,
    energy_per_hit_point = 6,
    resistances =
    {
      {
        type = "fire",
        decrease = 15,
        percent = 50
      },
      {
        type = "physical",
        decrease = 15,
        percent = 30
      },
      {
        type = "impact",
        decrease = 50,
        percent = 60
      },
      {
        type = "explosion",
        decrease = 15,
        percent = 30
      },
      {
        type = "acid",
        decrease = 10,
        percent = 20
      }
    },
    back_light = rolling_stock_back_light(),
    stand_by_light = rolling_stock_stand_by_light(),
    color = {r = 0.43, g = 0.23, b = 0, a = 0.5},
    pictures =
    {
      layers =
      {
        {
          priority = "very-low",
          width = 208,
          height = 210,
          back_equals_front = true,
          direction_count = 128,
          filenames =
          {
            "__base__/graphics/entity/fluid-wagon/fluid-wagon-1.png",
            "__base__/graphics/entity/fluid-wagon/fluid-wagon-2.png",
            "__base__/graphics/entity/fluid-wagon/fluid-wagon-3.png",
            "__base__/graphics/entity/fluid-wagon/fluid-wagon-4.png"
          },
          line_length = 4,
          lines_per_file = 8,
          shift = {0 + 0.013, -1 + 0.077},
          hr_version =
          {
            priority = "very-low",
            width = 416,
            height = 419,
            back_equals_front = true,
            direction_count = 128,
            filenames =
            {
              "__base__/graphics/entity/fluid-wagon/hr-fluid-wagon-1.png",
              "__base__/graphics/entity/fluid-wagon/hr-fluid-wagon-2.png",
              "__base__/graphics/entity/fluid-wagon/hr-fluid-wagon-3.png",
              "__base__/graphics/entity/fluid-wagon/hr-fluid-wagon-4.png",
              "__base__/graphics/entity/fluid-wagon/hr-fluid-wagon-5.png",
              "__base__/graphics/entity/fluid-wagon/hr-fluid-wagon-6.png",
              "__base__/graphics/entity/fluid-wagon/hr-fluid-wagon-7.png",
              "__base__/graphics/entity/fluid-wagon/hr-fluid-wagon-8.png"
            },
            line_length = 4,
            lines_per_file = 4,
            shift = {0 + 0.013, -1 + 0.077},
            scale = 0.5
          }
        },
        {
          flags = { "shadow" },
          priority = "very-low",
          width = 251,
          height = 188,
          back_equals_front = true,
          draw_as_shadow = true,
          direction_count = 128,
          filenames =
          {
            "__base__/graphics/entity/fluid-wagon/fluid-wagon-shadow-1.png",
            "__base__/graphics/entity/fluid-wagon/fluid-wagon-shadow-2.png",
            "__base__/graphics/entity/fluid-wagon/fluid-wagon-shadow-3.png",
            "__base__/graphics/entity/fluid-wagon/fluid-wagon-shadow-4.png"
          },
          line_length = 4,
          lines_per_file = 8,
          shift = {0.875 + 0.013, 0.3125 + 0.077},
          hr_version =
          {
            flags = { "shadow" },
            priority = "very-low",
            width = 501,
            height = 375,
            back_equals_front = true,
            draw_as_shadow = true,
            direction_count = 128,
            filenames =
            {
              "__base__/graphics/entity/fluid-wagon/hr-fluid-wagon-shadow-1.png",
              "__base__/graphics/entity/fluid-wagon/hr-fluid-wagon-shadow-2.png",
              "__base__/graphics/entity/fluid-wagon/hr-fluid-wagon-shadow-3.png",
              "__base__/graphics/entity/fluid-wagon/hr-fluid-wagon-shadow-4.png",
              "__base__/graphics/entity/fluid-wagon/hr-fluid-wagon-shadow-5.png",
              "__base__/graphics/entity/fluid-wagon/hr-fluid-wagon-shadow-6.png",
              "__base__/graphics/entity/fluid-wagon/hr-fluid-wagon-shadow-7.png"
            },
            line_length = 4,
            lines_per_file = 5,
            shift = {0.875 + 0.013, 0.3125 + 0.077},
            scale = 0.5
          }
        }
      }
    },
    wheels = standard_train_wheels,
    rail_category = "regular",
    drive_over_tie_trigger = drive_over_tie(),
    tie_distance = 50,
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/train-wheels.ogg",
        volume = 0.6
      },
      match_volume_to_activity = true,
    },
    crash_trigger = crash_trigger(),
    sound_minimum_speed = 0.5;
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 }
  },

  {
    type = "gate",
    name = "gate",
    icon = "__base__/graphics/icons/gate.png",
    flags = {"placeable-neutral","placeable-player", "player-creation"},
    fast_replaceable_group = "wall",
    minable = {hardness = 0.2, mining_time = 0.5, result = "gate"},
    max_health = 350,
    corpse = "small-remnants",
    collision_box = {{-0.29, -0.29}, {0.29, 0.29}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    opening_speed = 0.0666666,
    activation_distance = 3,
    timeout_to_close = 5,
    resistances =
    {
      {
        type = "physical",
        decrease = 3,
        percent = 20
      },
      {
        type = "impact",
        decrease = 45,
        percent = 60
      },
      {
        type = "explosion",
        decrease = 10,
        percent = 30
      },
      {
        type = "fire",
        percent = 100
      },
      {
        type = "laser",
        percent = 70
      }
    },
    vertical_animation =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/gate/gate-vertical.png",
          line_length = 8,
          width = 21,
          height = 60,
          frame_count = 16,
          shift = {0.015625, -0.40625}
        },
        {
          filename = "__base__/graphics/entity/gate/gate-vertical-shadow.png",
          line_length = 8,
          width = 41,
          height = 50,
          frame_count = 16,
          shift = {0.328125, 0.3},
          draw_as_shadow = true
        }
      }
    },
    horizontal_animation =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/gate/gate-horizontal.png",
          line_length = 8,
          width = 32,
          height = 36,
          frame_count = 16,
          shift = {0, -0.21875}
        },
        {
          filename = "__base__/graphics/entity/gate/gate-horizontal-shadow.png",
          line_length = 8,
          width = 62,
          height = 28,
          frame_count = 16,
          shift = {0.4375, 0.46875},
          draw_as_shadow = true
        }
      }
    },
    vertical_base =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/gate/gate-base-vertical.png",
          width = 32,
          height = 32
        },
        {
          filename = "__base__/graphics/entity/gate/gate-base-vertical-mask.png",
          width = 32,
          height = 32,
          apply_runtime_tint = true
        }
      }
    },
    horizontal_rail_animation_left =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/gate/gate-rail-horizontal-left.png",
          line_length = 8,
          width = 32,
          height = 47,
          frame_count = 16,
          shift = {0, -0.140625 + 0.125}
        },
        {
          filename = "__base__/graphics/entity/gate/gate-rail-horizontal-shadow-left.png",
          line_length = 8,
          width = 73,
          height = 27,
          frame_count = 16,
          shift = {0.078125, 0.171875 + 0.125},
          draw_as_shadow = true
        }
      }
    },
    horizontal_rail_animation_right =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/gate/gate-rail-horizontal-right.png",
          line_length = 8,
          width = 32,
          height = 43,
          frame_count = 16,
          shift = {0, -0.203125 + 0.125}
        },
        {
          filename = "__base__/graphics/entity/gate/gate-rail-horizontal-shadow-right.png",
          line_length = 8,
          width = 73,
          height = 28,
          frame_count = 16,
          shift = {0.60938, 0.2875 + 0.125},
          draw_as_shadow = true
        }
      }
    },
    vertical_rail_animation_left =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/gate/gate-rail-vertical-left.png",
          line_length = 8,
          width = 22,
          height = 54,
          frame_count = 16,
          shift = {0, -0.46875}
        },
        {
          filename = "__base__/graphics/entity/gate/gate-rail-vertical-shadow-left.png",
          line_length = 8,
          width = 47,
          height = 48,
          frame_count = 16,
          shift = {0.27, -0.16125 + 0.5},
          draw_as_shadow = true
        }
      }
    },
    vertical_rail_animation_right =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/gate/gate-rail-vertical-right.png",
          line_length = 8,
          width = 22,
          height = 55,
          frame_count = 16,
          shift = {0, -0.453125}
        },
        {
          filename = "__base__/graphics/entity/gate/gate-rail-vertical-shadow-right.png",
          line_length = 8,
          width = 47,
          height = 47,
          frame_count = 16,
          shift = {0.27, 0.803125 - 0.5},
          draw_as_shadow = true
        }
      }
    },
    vertical_rail_base =
    {
      filename = "__base__/graphics/entity/gate/gate-rail-base-vertical.png",
      line_length = 8,
      width = 64,
      height = 64,
      frame_count = 16,
      shift = {0, 0},
    },
    horizontal_rail_base =
    {
      filename = "__base__/graphics/entity/gate/gate-rail-base-horizontal.png",
      line_length = 8,
      width = 64,
      height = 45,
      frame_count = 16,
      shift = {0, -0.015625 + 0.125},
    },
    vertical_rail_base_mask =
    {
      filename = "__base__/graphics/entity/gate/gate-rail-base-mask-vertical.png",
      width = 63,
      height = 39,
      shift = {0.015625, -0.015625},
      apply_runtime_tint = true
    },
    horizontal_rail_base_mask =
    {
      filename = "__base__/graphics/entity/gate/gate-rail-base-mask-horizontal.png",
      width = 53,
      height = 45,
      shift = {0.015625, -0.015625 + 0.125},
      apply_runtime_tint = true
    },
    horizontal_base =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/gate/gate-base-horizontal.png",
          width = 32,
          height = 23,
          shift = {0, 0.125}
        },
        {
          filename = "__base__/graphics/entity/gate/gate-base-horizontal-mask.png",
          width = 32,
          height = 23,
          apply_runtime_tint = true,
          shift = {0, 0.125}
        }
      }
    },
    wall_patch =
    {
      north =
      {
        layers =
        {
          {
            filename = "__base__/graphics/entity/gate/wall-patch-north.png",
            width = 22,
            height = 35,
            shift = {0, -0.62 + 1}
          },
          {
            filename = "__base__/graphics/entity/gate/wall-patch-north-shadow.png",
            width = 46,
            height = 31,
            shift = {0.3, 0.20 + 1},
            draw_as_shadow = true
          }
        }
      },
      east =
      {
        layers =
        {
          {
            filename = "__base__/graphics/entity/gate/wall-patch-east.png",
            width = 11,
            height = 40,
            shift = {0.328125 - 1, -0.109375}
          },
          {
            filename = "__base__/graphics/entity/gate/wall-patch-east-shadow.png",
            width = 38,
            height = 32,
            shift = {0.8125 - 1, 0.46875},
            draw_as_shadow = true
          }
        }
      },
      south =
      {
        layers =
        {
          {
            filename = "__base__/graphics/entity/gate/wall-patch-south.png",
            width = 22,
            height = 40,
            shift = {0, -0.125}
          },
          {
            filename = "__base__/graphics/entity/gate/wall-patch-south-shadow.png",
            width = 48,
            height = 25,
            shift = {0.3, 0.95},
            draw_as_shadow = true
          }
        }
      },
      west =
      {
        layers =
        {
          {
            filename = "__base__/graphics/entity/gate/wall-patch-west.png",
            width = 11,
            height = 40,
            shift = {-0.328125 + 1, -0.109375}
          },
          {
            filename = "__base__/graphics/entity/gate/wall-patch-west-shadow.png",
            width = 46,
            height = 32,
            shift = {0.1875 + 1, 0.46875},
            draw_as_shadow = true
          }
        }
      }
    },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    open_sound =
    {
      variations = { filename = "__base__/sound/gate1.ogg", volume = 0.5 },
      aggregation =
      {
        max_count = 1,
        remove = true
      }
    },
    close_sound =
    {
      variations = { filename = "__base__/sound/gate1.ogg", volume = 0.5 },
      aggregation =
      {
        max_count = 1,
        remove = true
      }
    }
  },

  {
    type = "player-port",
    name = "player-port",
    icon = "__base__/graphics/icons/player-port.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 1, result = "player-port"},
    max_health = 50,
    collision_box = {{-0.9, -0.9}, {0.9, 0.9}},
    selection_box = {{-1, -1}, {1, 1}},
    animation =
    {
      filename = "__base__/graphics/entity/player-port/player-port-animation.png",
      width = 64,
      height = 64,
      frame_count = 2
    }
  },
  {
    type = "straight-rail",
    name = "straight-rail",
    icon = "__base__/graphics/icons/rail.png",
    flags = {"placeable-neutral", "player-creation", "building-direction-8-way"},
    minable = {mining_time = 0.5, result = "rail"},
    max_health = 100,
    corpse = "straight-rail-remnants",
    resistances =
    {
      {
        type = "fire",
        percent = 100
      }
    },
    collision_box = {{-0.7, -0.8}, {0.7, 0.8}},
    selection_box = {{-0.7, -0.8}, {0.7, 0.8}},
    rail_category = "regular",
    pictures = rail_pictures(),
  },
  {
    type = "curved-rail",
    name = "curved-rail",
    icon = "__base__/graphics/icons/curved-rail.png",
    flags = {"placeable-neutral", "player-creation", "building-direction-8-way"},
    minable = {mining_time = 0.5, result = "rail", count = 4},
    max_health = 200,
    corpse = "curved-rail-remnants",
    resistances =
    {
      {
        type = "fire",
        percent = 100
      }
    },
    collision_box = {{-0.75, -0.55}, {0.75, 1.6}},
    secondary_collision_box = {{-0.65, -2.43}, {0.65, 2.43}},
    selection_box = {{-1.7, -0.8}, {1.7, 0.8}},
    rail_category = "regular",
    pictures = rail_pictures(),
    placeable_by = { item="rail", count = 4}
  },
  {
    type = "land-mine",
    name = "land-mine",
    icon = "__base__/graphics/icons/land-mine.png",
    flags =
    {
      "placeable-player",
      "placeable-enemy",
      "player-creation",
      "placeable-off-grid",
      "not-on-map"
    },
    minable = {mining_time = 1, result = "land-mine"},
    mined_sound = { filename = "__core__/sound/deconstruct-small.ogg" },
    max_health = 15,
    corpse = "small-remnants",
    collision_box = {{-0.4,-0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    dying_explosion = "explosion-hit",
    picture_safe =
    {
      filename = "__base__/graphics/entity/land-mine/land-mine.png",
      priority = "medium",
      width = 32,
      height = 32
    },
    picture_set =
    {
      filename = "__base__/graphics/entity/land-mine/land-mine-set.png",
      priority = "medium",
      width = 32,
      height = 32
    },
    trigger_radius = 2.5,
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        source_effects =
        {
          {
            type = "nested-result",
            affects_target = true,
            action =
            {
              type = "area",
              perimeter = 6,
              force = "enemy",
              action_delivery =
              {
                type = "instant",
                target_effects =
                {
                  {
                    type = "damage",
                    damage = { amount = 300, type = "explosion"}
                  },
                  {
                    type = "create-sticker",
                    sticker = "stun-sticker"
                  }
                }
              }
            },
          },
          {
            type = "create-entity",
            entity_name = "explosion"
          },
          {
            type = "damage",
            damage = { amount = 1000, type = "explosion"}
          }
        }
      }
    },
  },
  {
    type = "train-stop",
    name = "train-stop",
    icon = "__base__/graphics/icons/train-stop.png",
    flags = {"placeable-neutral", "player-creation", "filter-directions"},
    minable = {mining_time = 1, result = "train-stop"},
    max_health = 250,
    corpse = "medium-remnants",
    collision_box = {{-0.5, -0.5}, {0.5, 0.5}},
    selection_box = {{-0.9, -0.9}, {0.9, 0.9}},
    drawing_boxes =
    {
      north = {{-3,-2.5}, {0.8, 1.25}},
      east = {{-1.75, -4.25},{1.625, 0.5}},
      south = {{-0.8125, -3.625},{2.75, 0.4375}},
      west = {{-1.75, -1.6875},{2.0625, 2.75}},
    },
    tile_width = 2,
    tile_height = 2,
    animation_ticks_per_frame = 20,
    rail_overlay_animations = make_4way_animation_from_spritesheet(
    {
      filename = "__base__/graphics/entity/train-stop/train-stop-ground.png",
      line_length = 4,
      width = 194,
      height = 189,
      direction_count = 4,
      shift = util.by_pixel(0, -0.5),
        hr_version = {
          filename = "__base__/graphics/entity/train-stop/hr-train-stop-ground.png",
          line_length = 4,
          width = 386,
          height = 377,
          direction_count = 4,
          shift = util.by_pixel(0, -0.75),
          scale = 0.5
      }
    }),

    animations = make_4way_animation_from_spritesheet({ layers =
    {
      {
        filename = "__base__/graphics/entity/train-stop/train-stop-bottom.png",
        line_length = 4,
        width = 71,
        height = 146,
        direction_count = 4,
        shift = util.by_pixel(-0.5, -27),
          hr_version = {
            filename = "__base__/graphics/entity/train-stop/hr-train-stop-bottom.png",
            line_length = 4,
            width = 140,
            height = 291,
            direction_count = 4,
            shift = util.by_pixel(-0.5, -26.75),
            scale = 0.5
          }
      },
      {
        filename = "__base__/graphics/entity/train-stop/train-stop-shadow.png",
        line_length = 4,
        width = 361,
        height = 304,
        direction_count = 4,
        shift = util.by_pixel(-7.5, 18),
        draw_as_shadow = true,
          hr_version = {
            filename = "__base__/graphics/entity/train-stop/hr-train-stop-shadow.png",
            line_length = 4,
            width = 720,
            height = 607,
            direction_count = 4,
            shift = util.by_pixel(-7.5, 17.75),
            draw_as_shadow = true,
            scale = 0.5
          }
      },
    }}),

    top_animations = make_4way_animation_from_spritesheet({ layers =
    {
      {
        filename = "__base__/graphics/entity/train-stop/train-stop-top.png",
        line_length = 4,
        width = 156,
        height = 153,
        direction_count = 4,
        shift = util.by_pixel(0, -50.5),
          hr_version = {
            filename = "__base__/graphics/entity/train-stop/hr-train-stop-top.png",
            line_length = 4,
            width = 311,
            height = 305,
            direction_count = 4,
            shift = util.by_pixel(0, -50.75),
            scale = 0.5
          }
      },
      {
        filename = "__base__/graphics/entity/train-stop/train-stop-top-mask.png",
        line_length = 4,
        width = 154,
        height = 148,
        direction_count = 4,
        apply_runtime_tint = true,
        shift = util.by_pixel(0, -49),
          hr_version = {
            filename = "__base__/graphics/entity/train-stop/hr-train-stop-top-mask.png",
            line_length = 4,
            width = 306,
            height = 295,
            direction_count = 4,
            apply_runtime_tint = true,
            shift = util.by_pixel(-0.25, -48.75),
            scale = 0.5
          }
      }
    }}),

    light1 =
    {
      light = {intensity = 0.5, size = 3, color = {r = 1.0, g = 1.0, b = 1.0}},
      picture =
      {
        north =
        {
          filename = "__base__/graphics/entity/train-stop/train-stop-north-light-1.png",
          width = 9,
          height = 5,
          frame_count = 1,
          shift = util.by_pixel(-70.5, -44.5),
          hr_version = {
            filename = "__base__/graphics/entity/train-stop/hr-train-stop-north-light-1.png",
            width = 17,
            height = 9,
            frame_count = 1,
            shift = util.by_pixel(-70.75, -44.25),
            scale = 0.5
            }
        },
        west =
        {
          filename = "__base__/graphics/entity/train-stop/train-stop-east-light-1.png",
          width = 3,
          height = 9,
          frame_count = 1,
          shift = util.by_pixel(34.5, 19.5),
          hr_version = {
            filename = "__base__/graphics/entity/train-stop/hr-train-stop-east-light-1.png",
            width = 6,
            height = 16,
            frame_count = 1,
            shift = util.by_pixel(34.5, 19.5),
            scale = 0.5
            }
        },
        south =
        {
          filename = "__base__/graphics/entity/train-stop/train-stop-south-light-1.png",
          width = 8,
          height = 2,
          frame_count = 1,
          shift = util.by_pixel(70, -95),
          hr_version = {
            filename = "__base__/graphics/entity/train-stop/hr-train-stop-south-light-1.png",
            width = 16,
            height = 4,
            frame_count = 1,
            shift = util.by_pixel(70, -95),
            scale = 0.5
            }
        },
        east =
        {
          filename = "__base__/graphics/entity/train-stop/train-stop-west-light-1.png",
          width = 3,
          height = 8,
          frame_count = 1,
          shift = util.by_pixel(-30.5, -112),
          hr_version = {
            filename = "__base__/graphics/entity/train-stop/hr-train-stop-west-light-1.png",
            width = 6,
            height = 16,
            frame_count = 1,
            shift = util.by_pixel(-30.5, -112),
            scale = 0.5
            }
        },
      },
      red_picture =
      {
        north =
        {
          filename = "__base__/graphics/entity/train-stop/train-stop-north-red-light-1.png",
          width = 9,
          height = 5,
          frame_count = 1,
          shift = util.by_pixel(-70.5, -44.5),
          hr_version = {
            filename = "__base__/graphics/entity/train-stop/hr-train-stop-north-red-light-1.png",
            width = 17,
            height = 9,
            frame_count = 1,
            shift = util.by_pixel(-70.75, -44.25),
            scale = 0.5
            }
        },
        west =
        {
          filename = "__base__/graphics/entity/train-stop/train-stop-east-red-light-1.png",
          width = 3,
          height = 9,
          frame_count = 1,
          shift = util.by_pixel(34.5, 19.5),
          hr_version = {
            filename = "__base__/graphics/entity/train-stop/hr-train-stop-east-red-light-1.png",
            width = 6,
            height = 16,
            frame_count = 1,
            shift = util.by_pixel(34.5, 19.5),
            scale = 0.5
            }
        },
        south =
        {
          filename = "__base__/graphics/entity/train-stop/train-stop-south-red-light-1.png",
          width = 8,
          height = 2,
          frame_count = 1,
          shift = util.by_pixel(70, -95),
          hr_version = {
            filename = "__base__/graphics/entity/train-stop/hr-train-stop-south-red-light-1.png",
            width = 16,
            height = 4,
            frame_count = 1,
            shift = util.by_pixel(70, -95),
            scale = 0.5
            }
        },
        east =
        {
          filename = "__base__/graphics/entity/train-stop/train-stop-west-red-light-1.png",
          width = 3,
          height = 8,
          frame_count = 1,
          shift = util.by_pixel(-30.5, -112),
          hr_version = {
            filename = "__base__/graphics/entity/train-stop/hr-train-stop-west-red-light-1.png",
            width = 6,
            height = 16,
            frame_count = 1,
            shift = util.by_pixel(-30.5, -112),
            scale = 0.5
            }
        },
      }
    },

    light2 =
    {
      light = {intensity = 0.5, size = 3, color = {r = 1.0, g = 1.0, b = 1.0}},
      picture =
      {
        north =
        {
          filename = "__base__/graphics/entity/train-stop/train-stop-north-light-2.png",
          width = 9,
          height = 5,
          frame_count = 1,
          shift = util.by_pixel(-57.5, -43.5),
          hr_version = {
            filename = "__base__/graphics/entity/train-stop/hr-train-stop-north-light-2.png",
            width = 16,
            height = 9,
            frame_count = 1,
            shift = util.by_pixel(-57.5, -43.75),
            scale = 0.5
            }
        },
        west =
        {
          filename = "__base__/graphics/entity/train-stop/train-stop-east-light-2.png",
          width = 3,
          height = 8,
          frame_count = 1,
          shift = util.by_pixel(34.5, 10),
          hr_version = {
            filename = "__base__/graphics/entity/train-stop/hr-train-stop-east-light-2.png",
            width = 6,
            height = 16,
            frame_count = 1,
            shift = util.by_pixel(34.5, 10),
            scale = 0.5
            }
        },
        south =
        {
          filename = "__base__/graphics/entity/train-stop/train-stop-south-light-2.png",
          width = 8,
          height = 3,
          frame_count = 1,
          shift = util.by_pixel(57, -94.5),
          hr_version = {
            filename = "__base__/graphics/entity/train-stop/hr-train-stop-south-light-2.png",
            width = 16,
            height = 5,
            frame_count = 1,
            shift = util.by_pixel(57, -94.75),
            scale = 0.5
            }
        },
        east =
        {
          filename = "__base__/graphics/entity/train-stop/train-stop-west-light-2.png",
          width = 4,
          height = 8,
          frame_count = 1,
          shift = util.by_pixel(-31, -103),
          hr_version = {
            filename = "__base__/graphics/entity/train-stop/hr-train-stop-west-light-2.png",
            width = 7,
            height = 15,
            frame_count = 1,
            shift = util.by_pixel(-30.75, -102.75),
            scale = 0.5
            }
        },
      },
      red_picture =
      {
        north =
        {
          filename = "__base__/graphics/entity/train-stop/train-stop-north-red-light-2.png",
          width = 9,
          height = 5,
          frame_count = 1,
          shift = util.by_pixel(-57.5, -43.5),
          hr_version = {
            filename = "__base__/graphics/entity/train-stop/hr-train-stop-north-red-light-2.png",
            width = 16,
            height = 9,
            frame_count = 1,
            shift = util.by_pixel(-57.5, -43.75),
            scale = 0.5
            }
        },
        west =
        {
          filename = "__base__/graphics/entity/train-stop/train-stop-east-red-light-2.png",
          width = 3,
          height = 8,
          frame_count = 1,
          shift = util.by_pixel(34.5, 10),
          hr_version = {
            filename = "__base__/graphics/entity/train-stop/hr-train-stop-east-red-light-2.png",
            width = 6,
            height = 16,
            frame_count = 1,
            shift = util.by_pixel(34.5, 10),
            scale = 0.5
            }
        },
        south =
        {
          filename = "__base__/graphics/entity/train-stop/train-stop-south-red-light-2.png",
          width = 8,
          height = 3,
          frame_count = 1,
          shift = util.by_pixel(57, -94.5),
          hr_version = {
            filename = "__base__/graphics/entity/train-stop/hr-train-stop-south-red-light-2.png",
            width = 16,
            height = 5,
            frame_count = 1,
            shift = util.by_pixel(57, -94.75),
            scale = 0.5
            }
        },
        east =
        {
          filename = "__base__/graphics/entity/train-stop/train-stop-west-red-light-2.png",
          width = 4,
          height = 8,
          frame_count = 1,
          shift = util.by_pixel(-31, -103),
          hr_version = {
            filename = "__base__/graphics/entity/train-stop/hr-train-stop-west-red-light-2.png",
            width = 7,
            height = 15,
            frame_count = 1,
            shift = util.by_pixel(-30.75, -102.75),
            scale = 0.5
            }
        },
      }
    },

    color={r=0.95,  g=0, b=0, a=0.5},

    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      sound = { filename = "__base__/sound/train-stop.ogg", volume = 0.8 }
    },
    circuit_wire_connection_points =
    {
      {
        shadow =
        {
          red = {-0.375, 1.21875},
          green = {-0.53125, 1.21875}
        },
        wire =
        {
          red = {-0.5, 1.09375},
          green = {-0.65625, 1.09375}
        }
      },
      {
        shadow =
        {
          red = {-0.875, -0.71875},
          green = {-0.875, -0.84375},
        },
        wire =
        {
          red = {-1.0625, -0.84375},
          green = {-1.0625, -0.96875},
        }
      },
      {
        shadow =
        {
          red = {0.78125, 0.46875},
          green = {0.59375, 0.46875},
        },
        wire =
        {
          red = {0.65625, 0.34375},
          green = {0.5, 0.34375},
        }
      },
      {
        shadow =
        {
          red = {-0.0625, 1.28125},
          green = {-0.0625, 1.15625},
        },
        wire =
        {
          red = {-0.25, 1.15625},
          green = {-0.25, 1.03125},
        }
      },
    },
    circuit_connector_sprites =
    {
      get_circuit_connector_sprites({0.5625-1, 1.03125}, {0.5625-1, 1.03125}, 0), --N
      get_circuit_connector_sprites({-0.78125, 0.28125-1}, {-0.78125, 0.28125-1}, 6), --E
      get_circuit_connector_sprites({-0.28125+1, 0.28125}, {-0.28125+1, 0.28125}, 0), --S
      get_circuit_connector_sprites({0.03125, 0.28125+1}, {0.03125, 0.28125+1}, 6), --W
    },
    circuit_wire_max_distance = 9,
    default_train_stopped_signal = {type = "virtual", name = "signal-T"}
  },
  {
    type = "rail-signal",
    name = "rail-signal",
    icon = "__base__/graphics/icons/rail-signal.png",
    flags = {"placeable-neutral", "player-creation", "building-direction-8-way", "filter-directions", "fast-replaceable-no-build-while-moving"},
    fast_replaceable_group = "rail-signal",
    minable = {mining_time = 0.5, result = "rail-signal"},
    max_health = 100,
    corpse = "small-remnants",
    collision_box = {{-0.2, -0.2}, {0.2, 0.2}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    animation =
    {
      filename = "__base__/graphics/entity/rail-signal/rail-signal.png",
      priority = "high",
      width = 96,
      height = 96,
      frame_count = 3,
      direction_count = 8,
      hr_version = {
        filename = "__base__/graphics/entity/rail-signal/hr-rail-signal.png",
        priority = "high",
        width = 192,
        height = 192,
        frame_count = 3,
        direction_count = 8,
        scale = 0.5
      }
    },
    rail_piece =
    {
      filename = "__base__/graphics/entity/rail-signal/rail-signal-metal.png",
      line_length = 10,
      width = 96,
      height = 96,
      frame_count = 10,
      axially_symmetrical = false,
      hr_version = {
        filename = "__base__/graphics/entity/rail-signal/hr-rail-signal-metal.png",
        line_length = 10,
        width = 192,
        height = 192,
        frame_count = 10,
        axially_symmetrical = false,
        scale = 0.5
      }
    },
    green_light = {intensity = 0.2, size = 4, color={g=1}},
    orange_light = {intensity = 0.2, size = 4, color={r=1, g=0.5}},
    red_light = {intensity = 0.2, size = 4, color={r=1}},
    circuit_wire_connection_points =
    {
      {
        shadow =
        {
          red = {0.609375, -0.359375},
          green = {0.765625, -0.359375},
        },
        wire =
        {
          red = {0.5, -0.46875},
          green = {0.65625, -0.46875},
        }
      },
      {
        shadow =
        {
          red = {0.8125, -0.03125},
          green = {0.9375, 0.0625},
        },
        wire =
        {
          red = {0.65625, -0.125},
          green = {0.75, -0.0625},
        }
      },
      {
        shadow =
        {
          red = {0.734375, 0.453125},
          green = {0.734375, 0.578125},
        },
        wire =
        {
          red = {0.5625, 0.34375},
          green = {0.5625, 0.5},
        }
      },
      {
        shadow =
        {
          red = {0.234375, 0.484375},
          green = {0.109375, 0.578125},
        },
        wire =
        {
          red = {0.09375, 0.34375},
          green = {-0.03125, 0.4375},
        }
      },
      {
        shadow =
        {
          red = {-0.421875, 0.484375},
          green = {-0.578125, 0.484375},
        },
        wire =
        {
          red = {-0.5625, 0.34375},
          green = {-0.71875, 0.34375},
        }
      },
      {
        shadow =
        {
          red = {-0.796875, 0.140625},
          green = {-0.921875, 0.046875},
        },
        wire =
        {
          red = {-1, 0.0625},
          green = {-1.125, -0.03125},
        }
      },
      {
        shadow =
        {
          red = {-0.578125, -0.453125},
          green = {-0.578125, -0.578125},
        },
        wire =
        {
          red = {-0.71875, -0.53125},
          green = {-0.71875, -0.65625},
        }
      },
      {
        shadow =
        {
          red = {-0.046875, -0.484375},
          green = {0.078125, -0.578125},
        },
        wire =
        {
          red = {-0.125, -0.625},
          green = {0, -0.71875},
        }
      }
    },
    circuit_connector_sprites =
    {
      get_circuit_connector_sprites({0.46875, -0.15625}, {0.46875, -0.15625}, 4),
      get_circuit_connector_sprites({0.46875, 0.09375}, {0.46875, 0.09375}, 3),
      get_circuit_connector_sprites({0.34375, 0.4375}, {0.34375, 0.4375}, 2),
      get_circuit_connector_sprites({-0.03125, 0.34375}, {-0.03125, 0.34375}, 1),
      get_circuit_connector_sprites({-0.5, 0.28125}, {-0.5, 0.28125}, 0),
      get_circuit_connector_sprites({-0.78125, 0.0625}, {-0.78125, 0.0625}, 7),
      get_circuit_connector_sprites({-0.4375, -0.40625}, {-0.4375, -0.40625}, 6),
      get_circuit_connector_sprites({0.03125, -0.375}, {0.03125, -0.375}, 5),
    },
    circuit_wire_max_distance = 9,
    default_red_output_signal = {type = "virtual", name = "signal-red"},
    default_orange_output_signal = {type = "virtual", name = "signal-yellow"},
    default_green_output_signal = {type = "virtual", name = "signal-green"}
  },
  {
    type = "rail-chain-signal",
    name = "rail-chain-signal",
    icon = "__base__/graphics/icons/rail-chain-signal.png",
    flags = {"placeable-neutral", "player-creation", "building-direction-8-way", "filter-directions", "fast-replaceable-no-build-while-moving"},
    fast_replaceable_group = "rail-signal",
    minable = {mining_time = 0.5, result = "rail-chain-signal"},
    max_health = 100,
    corpse = "small-remnants",
    collision_box = {{-0.2, -0.2}, {0.2, 0.2}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    animation =
    {
      filename = "__base__/graphics/entity/rail-chain-signal/rail-chain-signal.png",
      priority = "high",
      line_length = 5,
      width = 160,
      height = 160,
      frame_count = 5,
      axially_symmetrical = false,
      direction_count = 8,
      hr_version = {
        filename = "__base__/graphics/entity/rail-chain-signal/hr-rail-chain-signal.png",
        priority = "high",
        line_length = 5,
        width = 320,
        height = 320,
        frame_count = 5,
        axially_symmetrical = false,
        direction_count = 8,
        scale = 0.5
      }
    },
    rail_piece =
    {
      filename = "__base__/graphics/entity/rail-chain-signal/rail-chain-signal-metal.png",
      line_length = 10,
      width = 192,
      height = 192,
      frame_count = 10,
      axially_symmetrical = false,
      hr_version = {
        filename = "__base__/graphics/entity/rail-chain-signal/hr-rail-chain-signal-metal.png",
        line_length = 10,
        width = 384,
        height = 384,
        frame_count = 10,
        axially_symmetrical = false,
        scale = 0.5
      }
    },
    selection_box_offsets =
    {
      {0, 0},
      {0, 0},
      {0, 0},
      {0, 0},
      {0, 0},
      {0, 0},
      {0, 0},
      {0, 0}
    },
    green_light = {intensity = 0.3, size = 4, color={r=0.592157, g=1, b=0.117647}},
    orange_light = {intensity = 0.3, size = 4, color={r=0.815686, g=0.670588, b=0.431373}},
    red_light = {intensity = 0.3, size = 4, color={r=0.784314, g=0.431373, b=0.431373}},
    blue_light = {intensity = 0.3, size = 4, color={r=0.431373, g=0.694118, b=0.623529}},
  },
  {
    type = "lab",
    name = "lab",
    icon = "__base__/graphics/icons/lab.png",
    flags = {"placeable-player", "player-creation"},
    minable = {mining_time = 1, result = "lab"},
    max_health = 150,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    light = {intensity = 0.75, size = 8, color = {r = 1.0, g = 1.0, b = 1.0}},
    on_animation =
    {
      filename = "__base__/graphics/entity/lab/lab.png",
      width = 113,
      height = 91,
      frame_count = 33,
      line_length = 11,
      animation_speed = 1 / 3,
      shift = {0.2, 0.15}
    },
    off_animation =
    {
      filename = "__base__/graphics/entity/lab/lab.png",
      width = 113,
      height = 91,
      frame_count = 1,
      shift = {0.2, 0.15}
    },
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/lab.ogg",
        volume = 0.7
      },
      apparent_volume = 1
    },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input"
    },
    energy_usage = "60kW",
    researching_speed = 1,
    inputs =
    {
      "science-pack-1",
      "science-pack-2",
      "science-pack-3",
      "military-science-pack",
      "production-science-pack",
      "high-tech-science-pack",
      "space-science-pack"
    },
    module_specification =
    {
      module_slots = 2,
      max_entity_info_module_icons_per_row = 3,
      max_entity_info_module_icon_rows = 1,
      module_info_icon_shift = {0, 0.9}
    }
  },

  {
    type = "logistic-robot",
    name = "logistic-robot",
    icon = "__base__/graphics/icons/logistic-robot.png",
    flags = {"placeable-player", "player-creation", "placeable-off-grid", "not-on-map"},
    minable = {hardness = 0.1, mining_time = 0.1, result = "logistic-robot"},
    resistances = { { type = "fire", percent = 85 } },
    max_health = 100,
    collision_box = {{0, 0}, {0, 0}},
    selection_box = {{-0.5, -1.5}, {0.5, -0.5}},
    max_payload_size = 1,
    speed = 0.05,
    transfer_distance = 0.5,
    max_energy = "1.5MJ",
    energy_per_tick = "0.05kJ",
    speed_multiplier_when_out_of_energy = 0.2,
    energy_per_move = "5kJ",
    min_to_charge = 0.2,
    max_to_charge = 0.95,
    idle =
    {
      filename = "__base__/graphics/entity/logistic-robot/logistic-robot.png",
      priority = "high",
      line_length = 16,
      width = 41,
      height = 42,
      frame_count = 1,
      shift = {0.015625, -0.09375},
      direction_count = 16,
      y = 42
    },
    idle_with_cargo =
    {
      filename = "__base__/graphics/entity/logistic-robot/logistic-robot.png",
      priority = "high",
      line_length = 16,
      width = 41,
      height = 42,
      frame_count = 1,
      shift = {0.015625, -0.09375},
      direction_count = 16
    },
    in_motion =
    {
      filename = "__base__/graphics/entity/logistic-robot/logistic-robot.png",
      priority = "high",
      line_length = 16,
      width = 41,
      height = 42,
      frame_count = 1,
      shift = {0.015625, -0.09375},
      direction_count = 16,
      y = 126
    },
    in_motion_with_cargo =
    {
      filename = "__base__/graphics/entity/logistic-robot/logistic-robot.png",
      priority = "high",
      line_length = 16,
      width = 41,
      height = 42,
      frame_count = 1,
      shift = {0.015625, -0.09375},
      direction_count = 16,
      y = 84
    },
    shadow_idle =
    {
      filename = "__base__/graphics/entity/logistic-robot/logistic-robot-shadow.png",
      priority = "high",
      line_length = 16,
      width = 59,
      height = 23,
      frame_count = 1,
      shift = {0.96875, 0.609375},
      direction_count = 16,
      y = 23
    },
    shadow_idle_with_cargo =
    {
      filename = "__base__/graphics/entity/logistic-robot/logistic-robot-shadow.png",
      priority = "high",
      line_length = 16,
      width = 59,
      height = 23,
      frame_count = 1,
      shift = {0.96875, 0.609375},
      direction_count = 16
    },
    shadow_in_motion =
    {
      filename = "__base__/graphics/entity/logistic-robot/logistic-robot-shadow.png",
      priority = "high",
      line_length = 16,
      width = 59,
      height = 23,
      frame_count = 1,
      shift = {0.96875, 0.609375},
      direction_count = 16,
      y = 23
    },
    shadow_in_motion_with_cargo =
    {
      filename = "__base__/graphics/entity/logistic-robot/logistic-robot-shadow.png",
      priority = "high",
      line_length = 16,
      width = 59,
      height = 23,
      frame_count = 1,
      shift = {0.96875, 0.609375},
      direction_count = 16
    },
    working_sound = flying_robot_sounds(),
    cargo_centered = {0.0, 0.2},
  },

  {
    type = "construction-robot",
    name = "construction-robot",
    icon = "__base__/graphics/icons/construction-robot.png",
    flags = {"placeable-player", "player-creation", "placeable-off-grid", "not-on-map"},
    minable = {hardness = 0.1, mining_time = 0.1, result = "construction-robot"},
    resistances = { { type = "fire", percent = 85 } },
    max_health = 100,
    collision_box = {{0, 0}, {0, 0}},
    selection_box = {{-0.5, -1.5}, {0.5, -0.5}},
    max_payload_size = 1,
    speed = 0.06,
    transfer_distance = 0.5,
    max_energy = "1.5MJ",
    energy_per_tick = "0.05kJ",
    speed_multiplier_when_out_of_energy = 0.2,
    energy_per_move = "5kJ",
    min_to_charge = 0.2,
    max_to_charge = 0.95,
    working_light = {intensity = 0.8, size = 3, color = {r = 0.8, g = 0.8, b = 0.8}},
    idle =
    {
      filename = "__base__/graphics/entity/construction-robot/construction-robot.png",
      priority = "high",
      line_length = 16,
      width = 32,
      height = 36,
      frame_count = 1,
      shift = {0, -0.15625},
      direction_count = 16
    },
    in_motion =
    {
      filename = "__base__/graphics/entity/construction-robot/construction-robot.png",
      priority = "high",
      line_length = 16,
      width = 32,
      height = 36,
      frame_count = 1,
      shift = {0, -0.15625},
      direction_count = 16,
      y = 36
    },
    shadow_idle =
    {
      filename = "__base__/graphics/entity/construction-robot/construction-robot-shadow.png",
      priority = "high",
      line_length = 16,
      width = 50,
      height = 24,
      frame_count = 1,
      shift = {1.09375, 0.59375},
      direction_count = 16
    },
    shadow_in_motion =
    {
      filename = "__base__/graphics/entity/construction-robot/construction-robot-shadow.png",
      priority = "high",
      line_length = 16,
      width = 50,
      height = 24,
      frame_count = 1,
      shift = {1.09375, 0.59375},
      direction_count = 16
    },
    working =
    {
      filename = "__base__/graphics/entity/construction-robot/construction-robot-working.png",
      priority = "high",
      line_length = 2,
      width = 28,
      height = 36,
      frame_count = 2,
      shift = {0, -0.15625},
      direction_count = 16,
      animation_speed = 0.3,
    },
    shadow_working =
    {
      stripes = util.multiplystripes(2,
      {
        {
          filename = "__base__/graphics/entity/construction-robot/construction-robot-shadow.png",
          width_in_frames = 16,
          height_in_frames = 1,
        }
      }),
      priority = "high",
      width = 50,
      height = 24,
      frame_count = 2,
      shift = {1.09375, 0.59375},
      direction_count = 16
    },
    smoke =
    {
      filename = "__base__/graphics/entity/smoke-construction/smoke-01.png",
      width = 39,
      height = 32,
      frame_count = 19,
      line_length = 19,
      shift = {0.078125, -0.15625},
      animation_speed = 0.3,
    },
    sparks =
    {
      {
        filename = "__base__/graphics/entity/sparks/sparks-01.png",
        width = 39,
        height = 34,
        frame_count = 19,
        line_length = 19,
        shift = {-0.109375, 0.3125},
        tint = { r = 1.0, g = 0.9, b = 0.0, a = 1.0 },
        animation_speed = 0.3,
      },
      {
        filename = "__base__/graphics/entity/sparks/sparks-02.png",
        width = 36,
        height = 32,
        frame_count = 19,
        line_length = 19,
        shift = {0.03125, 0.125},
        tint = { r = 1.0, g = 0.9, b = 0.0, a = 1.0 },
        animation_speed = 0.3,
      },
      {
        filename = "__base__/graphics/entity/sparks/sparks-03.png",
        width = 42,
        height = 29,
        frame_count = 19,
        line_length = 19,
        shift = {-0.0625, 0.203125},
        tint = { r = 1.0, g = 0.9, b = 0.0, a = 1.0 },
        animation_speed = 0.3,
      },
      {
        filename = "__base__/graphics/entity/sparks/sparks-04.png",
        width = 40,
        height = 35,
        frame_count = 19,
        line_length = 19,
        shift = {-0.0625, 0.234375},
        tint = { r = 1.0, g = 0.9, b = 0.0, a = 1.0 },
        animation_speed = 0.3,
      },
      {
        filename = "__base__/graphics/entity/sparks/sparks-05.png",
        width = 39,
        height = 29,
        frame_count = 19,
        line_length = 19,
        shift = {-0.109375, 0.171875},
        tint = { r = 1.0, g = 0.9, b = 0.0, a = 1.0 },
        animation_speed = 0.3,
      },
      {
        filename = "__base__/graphics/entity/sparks/sparks-06.png",
        width = 44,
        height = 36,
        frame_count = 19,
        line_length = 19,
        shift = {0.03125, 0.3125},
        tint = { r = 1.0, g = 0.9, b = 0.0, a = 1.0 },
        animation_speed = 0.3,
      },
    },
    working_sound = flying_robot_sounds(),
    cargo_centered = {0.0, 0.2},
    construction_vector = {0.30, 0.22},
  },
  {
    type = "logistic-container",
    name = "logistic-chest-passive-provider",
    icon = "__base__/graphics/icons/logistic-chest-passive-provider.png",
    flags = {"placeable-player", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "logistic-chest-passive-provider"},
    max_health = 350,
    corpse = "small-remnants",
    collision_box = {{-0.35, -0.35}, {0.35, 0.35}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    resistances =
    {
      {
        type = "fire",
        percent = 90
      },
      {
        type = "impact",
        percent = 60
      }
    },
    fast_replaceable_group = "container",
    inventory_size = 48,
    logistic_mode = "passive-provider",
    open_sound = { filename = "__base__/sound/metallic-chest-open.ogg", volume=0.65 },
    close_sound = { filename = "__base__/sound/metallic-chest-close.ogg", volume = 0.7 },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    picture =
    {
      filename = "__base__/graphics/entity/logistic-chest/logistic-chest-passive-provider.png",
      priority = "extra-high",
      width = 38,
      height = 32,
      shift = {0.09375, 0}
    },
    circuit_wire_connection_point =
    {
      shadow =
      {
        red = {0.734375, 0.453125},
        green = {0.609375, 0.515625},
      },
      wire =
      {
        red = {0.40625, 0.21875},
        green = {0.40625, 0.375},
      }
    },
    circuit_wire_max_distance = 9,
    circuit_connector_sprites = get_circuit_connector_sprites({0.1875, 0.15625}, nil, 18),
  },
  {
    type = "logistic-container",
    name = "logistic-chest-active-provider",
    icon = "__base__/graphics/icons/logistic-chest-active-provider.png",
    flags = {"placeable-player", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "logistic-chest-active-provider"},
    max_health = 350,
    corpse = "small-remnants",
    collision_box = {{-0.35, -0.35}, {0.35, 0.35}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    resistances =
    {
      {
        type = "fire",
        percent = 90
      },
      {
        type = "impact",
        percent = 60
      }
    },
    fast_replaceable_group = "container",
    inventory_size = 48,
    logistic_mode = "active-provider",
    open_sound = { filename = "__base__/sound/metallic-chest-open.ogg", volume=0.65 },
    close_sound = { filename = "__base__/sound/metallic-chest-close.ogg", volume = 0.7 },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    picture =
    {
      filename = "__base__/graphics/entity/logistic-chest/logistic-chest-active-provider.png",
      priority = "extra-high",
      width = 38,
      height = 32,
      shift = {0.09375, 0}
    },
    circuit_wire_connection_point =
    {
      shadow =
      {
        red = {0.734375, 0.453125},
        green = {0.609375, 0.515625},
      },
      wire =
      {
        red = {0.40625, 0.21875},
        green = {0.40625, 0.375},
      }
    },
    circuit_wire_max_distance = 9,
    circuit_connector_sprites = get_circuit_connector_sprites({0.1875, 0.15625}, nil, 18),
  },
  {
    type = "logistic-container",
    name = "logistic-chest-storage",
    icon = "__base__/graphics/icons/logistic-chest-storage.png",
    flags = {"placeable-player", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "logistic-chest-storage"},
    max_health = 350,
    corpse = "small-remnants",
    collision_box = {{-0.35, -0.35}, {0.35, 0.35}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    resistances =
    {
      {
        type = "fire",
        percent = 90
      },
      {
        type = "impact",
        percent = 60
      }
    },
    fast_replaceable_group = "container",
    inventory_size = 48,
    logistic_mode = "storage",
    open_sound = { filename = "__base__/sound/metallic-chest-open.ogg", volume=0.65 },
    close_sound = { filename = "__base__/sound/metallic-chest-close.ogg", volume = 0.7 },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    picture =
    {
      filename = "__base__/graphics/entity/logistic-chest/logistic-chest-storage.png",
      priority = "extra-high",
      width = 38,
      height = 32,
      shift = {0.09375, 0}
    },
    circuit_wire_connection_point =
    {
      shadow =
      {
        red = {0.734375, 0.453125},
        green = {0.609375, 0.515625},
      },
      wire =
      {
        red = {0.40625, 0.21875},
        green = {0.40625, 0.375},
      }
    },
    circuit_wire_max_distance = 9,
    circuit_connector_sprites = get_circuit_connector_sprites({0.1875, 0.15625}, nil, 18),
  },
  {
    type = "logistic-container",
    name = "logistic-chest-requester",
    icon = "__base__/graphics/icons/logistic-chest-requester.png",
    flags = {"placeable-player", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "logistic-chest-requester"},
    max_health = 350,
    corpse = "small-remnants",
    collision_box = {{-0.35, -0.35}, {0.35, 0.35}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    resistances =
    {
      {
        type = "fire",
        percent = 90
      },
      {
        type = "impact",
        percent = 60
      }
    },
    fast_replaceable_group = "container",
    inventory_size = 48,
    logistic_mode = "requester",
    open_sound = { filename = "__base__/sound/metallic-chest-open.ogg", volume=0.65 },
    close_sound = { filename = "__base__/sound/metallic-chest-close.ogg", volume = 0.7 },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    picture =
    {
      filename = "__base__/graphics/entity/logistic-chest/logistic-chest-requester.png",
      priority = "extra-high",
      width = 38,
      height = 32,
      shift = {0.09375, 0}
    },
    circuit_wire_connection_point =
    {
      shadow =
      {
        red = {0.734375, 0.453125},
        green = {0.609375, 0.515625},
      },
      wire =
      {
        red = {0.40625, 0.21875},
        green = {0.40625, 0.375},
      }
    },
    circuit_wire_max_distance = 9,
    circuit_connector_sprites = get_circuit_connector_sprites({0.1875, 0.15625}, nil, 18),
  },
  {
    type = "rocket-silo",
    name = "rocket-silo",
    icon = "__base__/graphics/icons/rocket-silo.png",
    flags = {"placeable-player", "player-creation"},
    crafting_categories = {"rocket-building"},
    ingredient_count = 3,
    rocket_parts_required = 100,
    crafting_speed = 1,
    rocket_result_inventory_size = 1,
    module_specification =
    {
      module_slots = 4,
      module_info_icon_shift = {0, 4.3}
    },
    fixed_recipe = "rocket-part",
    allowed_effects = {"consumption", "speed", "productivity", "pollution"},
    minable = {hardness = 0.2, mining_time = 5, result = "rocket-silo"},
    max_health = 5000,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-4.2, -4.7}, {4.2, 4.7}},
    selection_box = {{-4.5, -5}, {4.5, 5}},
    resistances =
    {
      {
        type = "fire",
        percent = 60
      },
      {
        type = "impact",
        percent = 60
      }
    },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    energy_source =
    {
      type = "electric",
      usage_priority = "primary-input"
    },
    energy_usage = "250kW", --energy usage used when crafting the rocket
    idle_energy_usage = "10KW",
    lamp_energy_usage = "10KW",
    active_energy_usage = "3990KW",
    rocket_entity = "rocket-silo-rocket",

    times_to_blink = 3,
    light_blinking_speed = 1 / (3 * 60),
    door_opening_speed = 1 / (4.25 * 60),

    base_light =
    {
      {
        type = "oriented",
        picture =
        {
          filename = "__core__/graphics/light-cone.png",
          priority = "extra-high",
          flags = { "light" },
          scale = 2,
          width = 200,
          height = 200
        },
        shift = {0.25, 1.25},
        size = 1,
        intensity = 1,
        rotation_shift = 0.6,
        color = {r = 0.7, g = 0.9, b = 1.0}
      },
      {
        type = "oriented",
        picture =
        {
          filename = "__core__/graphics/light-cone.png",
          priority = "extra-high",
          flags = { "light" },
          scale = 2,
          width = 200,
          height = 200
        },
        shift = {-0.25, 1},
        size = 1,
        intensity = 1,
        rotation_shift = 0.5,
        color = {r = 0.7, g = 0.9, b = 1.0}
      }
    },
    base_engine_light =
    {
      intensity = 1,
      size = 25,
      shift = {0, 1.5}
    },

    shadow_sprite =
    {
      filename = "__base__/graphics/entity/rocket-silo/00-shadow/00-silo-shadow.png",
      priority = "medium",
      width = 447,
      height = 351,
      draw_as_shadow = true,
      shift = {1.5, 0.5}
    },
    satellite_shadow_animation =
    {
      filename = "__base__/graphics/entity/rocket-silo/00-shadow/00-satellite-shadow.png",
      priority = "medium",
      width = 44,
      height = 22,
      frame_count = 12,
      line_length = 4,
      animation_speed = 0.25,
      draw_as_shadow = true,
      shift = {7.875, -2.1875}
    },

    hole_sprite =
    {
      filename = "__base__/graphics/entity/rocket-silo/01-hole/01-hole.png",
      width = 224,
      height = 128,
      shift = {0, 2}
    },
    hole_light_sprite =
    {
      filename = "__base__/graphics/entity/rocket-silo/01-hole/01-hole-light.png",
      width = 224,
      height = 128,
      shift = {0, 2}
    },

    rocket_shadow_overlay_sprite =
    {
      filename = "__base__/graphics/entity/rocket-silo/03-12-rocket-over/03-rocket-over-shadow-over-rocket.png",
      width = 224,
      height = 128,
      shift = {0, 2}
    },
    rocket_glow_overlay_sprite =
    {
      filename = "__base__/graphics/entity/rocket-silo/03-12-rocket-over/03-rocket-over-glow.png",
      blend_mode = "additive",
      width = 224,
      height = 128,
      shift = {0, 2}
    },


    door_back_sprite =
    {
      filename = "__base__/graphics/entity/rocket-silo/04-05-doors/04-door-back.png",
      width = 192,
      height = 108,
      shift = {0, 1.53125}
    },
    door_back_open_offset = {1.75, -1.75},
    door_front_sprite =
    {
      filename = "__base__/graphics/entity/rocket-silo/04-05-doors/05-door-front.png",
      width = 192,
      height = 112,
      shift = {0, 2.0625}
    },
    door_front_open_offset = {-1.75, 1.75},

    base_day_sprite =
    {
      filename = "__base__/graphics/entity/rocket-silo/06-silo-base/06-silo-base-day.png",
      width = 352,
      height = 384,
      shift = {0, 0}
    },
    base_night_sprite =
    {
      filename = "__base__/graphics/entity/rocket-silo/06-silo-base/06-silo-base-night.png",
      width = 352,
      height = 384,
      shift = {0, 0}
    },


    red_lights_back_sprites =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/rocket-silo/07-red-lights-back/red-light.png",
          width = 32,
          height = 32,
          shift = {1.34375, 0.28125}
        },
        {
          filename = "__base__/graphics/entity/rocket-silo/07-red-lights-back/red-light.png",
          width = 32,
          height = 32,
          shift = {2.3125, 0.9375}
        },
        {
          filename = "__base__/graphics/entity/rocket-silo/07-red-lights-back/red-light.png",
          width = 32,
          height = 32,
          shift = {2.65625, 1.90625}
        },
        {
          filename = "__base__/graphics/entity/rocket-silo/07-red-lights-back/red-light.png",
          width = 32,
          height = 32,
          shift = {-2.65625, 1.90625}
        },
        {
          filename = "__base__/graphics/entity/rocket-silo/07-red-lights-back/red-light.png",
          width = 32,
          height = 32,
          shift = {-2.3125, 0.9375}
        },
        {
          filename = "__base__/graphics/entity/rocket-silo/07-red-lights-back/red-light.png",
          width = 32,
          height = 32,
          shift = {-1.34375, 0.28125}
        },
        {
          filename = "__base__/graphics/entity/rocket-silo/07-red-lights-back/red-light.png",
          width = 32,
          height = 32,
          shift = {0, 0}
        }
      }
    },

    red_lights_front_sprites =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/rocket-silo/07-red-lights-back/red-light.png",
          width = 32,
          height = 32,
          shift = {2.3125, 2.8125}
        },
        {
          filename = "__base__/graphics/entity/rocket-silo/07-red-lights-back/red-light.png",
          width = 32,
          height = 32,
          shift = {1.34375, 3.40625}
        },
        {
          filename = "__base__/graphics/entity/rocket-silo/07-red-lights-back/red-light.png",
          width = 32,
          height = 32,
          shift = {0, 3.75}
        },
        {
          filename = "__base__/graphics/entity/rocket-silo/07-red-lights-back/red-light.png",
          width = 32,
          height = 32,
          shift = {-1.34375, 3.40625}
        },
        {
          filename = "__base__/graphics/entity/rocket-silo/07-red-lights-back/red-light.png",
          width = 32,
          height = 32,
          shift = {-2.3125, 2.8125}
        }
      }
    },
    satellite_animation =
    {
      filename = "__base__/graphics/entity/rocket-silo/08-arms-back-satellite-animation/satellite.png",
      priority = "medium",
      width = 27,
      height = 28,
      frame_count = 12,
      line_length = 4,
      animation_speed = 0.25,
      shift = {3.3125, -4.82813}
    },

    arm_01_back_animation =
    {
      filename = "__base__/graphics/entity/rocket-silo/08-arms-back-satellite-animation/arm-01-back.png",
      priority = "medium",
      width = 54,
      height = 50,
      frame_count = 12,
      line_length = 4,
      animation_speed = 0.2,
      shift = {-1.34375, -0.875}
    },

    arm_02_right_animation =
    {
      filename = "__base__/graphics/entity/rocket-silo/08-arms-back-satellite-animation/arm-02-right.png",
      priority = "medium",
      width = 81,
      height = 43,
      frame_count = 12,
      line_length = 4,
      animation_speed = 0.2,
      shift = {2.71875, 0.96875}
    },

    arm_03_front_animation =
    {
      filename = "__base__/graphics/entity/rocket-silo/13-arm-front-red-lights-front/arm-03-front.png",
      priority = "medium",
      width = 54,
      height = 70,
      frame_count = 12,
      line_length = 4,
      animation_speed = 0.2,
      shift = {-1.34375, 2.4375}
    },

    base_front_sprite =
    {
      filename = "__base__/graphics/entity/rocket-silo/14-silo-front/14-silo-front.png",
      width = 352,
      height = 96,
      shift = {0, 3.5}
    },
    silo_fade_out_start_distance = 8,
    silo_fade_out_end_distance = 15,

    alarm_trigger =
    {
      {
        type = "play-sound",
        sound =
        {
          {
            filename = "__base__/sound/silo-alarm.ogg",
            volume = 1.5
          }
        }
      }
    },
    clamps_on_trigger =
    {
      {
        type = "play-sound",
        sound =
        {
          {
            filename = "__base__/sound/silo-clamps-on.ogg",
            volume = 1.5
          }
        }
      }
    },
    clamps_off_trigger =
    {
      {
        type = "play-sound",
        sound =
        {
          {
            filename = "__base__/sound/silo-clamps-off.ogg",
            volume = 1.5
          }
        }
      }
    },
    doors_trigger =
    {
      {
        type = "play-sound",
        sound =
        {
          {
            filename = "__base__/sound/silo-doors.ogg",
            volume = 1.5
          }
        }
      }
    },
    raise_rocket_trigger =
    {
      {
        type = "play-sound",
        sound =
        {
          {
            filename = "__base__/sound/silo-raise-rocket.ogg",
            volume = 1.5
          }
        }
      }
    }
  },
  {
    type = "rocket-silo-rocket",
    name = "rocket-silo-rocket",
    flags = {"not-on-map"},
    collision_mask = {"not-colliding-with-itself"},
    collision_box = {{-2, -7}, {2, 4}},
    selection_box = {{0, 0}, {0, 0}},
    dying_explosion = "massive-explosion",
    shadow_slave_entity = "rocket-silo-rocket-shadow",
    inventory_size = 1,
    rising_speed = 1 / (7 * 60),
    engine_starting_speed = 1 / (5.5 * 60),
    flying_speed = 1 / (2000 * 60),
    flying_acceleration = 0.01,
    result_items =
    {
      {"space-science-pack", 1000, "satellite"}
    },

    glow_light =
    {
      intensity = 1,
      size = 30,
      shift = {0, 1.5},
      color = {r = 1.0, g = 1.0, b = 1.0}
    },

    rocket_sprite =
    {
      filename = "__base__/graphics/entity/rocket-silo/02-11-rocket/02-rocket.png",
      width = 192,
      height = 288,
      shift = {0, 5.5}
    },

    rocket_shadow_sprite =
    {
      filename = "__base__/graphics/entity/rocket-silo/09-rocket-shadow/09-rocket-shadow.png",
      priority = "medium",
      width = 384,
      height = 128,
      draw_as_shadow = true,
      shift = {-2.5, 2}
    },

    rocket_glare_overlay_sprite =
    {
      filename = "__base__/graphics/entity/rocket-silo/03-12-rocket-over/03-rocket-over-glare.png",
      blend_mode = "additive",
      width = 509,
      height = 509,
      shift = {0, 9}
    },
    rocket_smoke_top1_animation =
    {
      filename = "__base__/graphics/entity/rocket-silo/03-12-rocket-over/rocket-top-smoke.png",
      priority = "medium",
      tint = { r = 0.8, g = 0.8, b = 1, a = 0.8 },
      width = 47,
      height = 149,
      frame_count = 24,
      line_length = 8,
      animation_speed = 0.5,
      scale = 1.5,
      shift = {-1.59375, 7.34375}
    },
    rocket_smoke_top2_animation =
    {
      filename = "__base__/graphics/entity/rocket-silo/03-12-rocket-over/rocket-top-smoke.png",
      priority = "medium",
      tint = { r = 0.8, g = 0.8, b = 1, a = 0.8 },
      width = 47,
      height = 149,
      frame_count = 24,
      line_length = 8,
      animation_speed = 0.5,
      scale = 1.5,
      shift = {0.46875, 8.28125}
    },
    rocket_smoke_top3_animation =
    {
      filename = "__base__/graphics/entity/rocket-silo/03-12-rocket-over/rocket-top-smoke.png",
      priority = "medium",
      tint = { r = 0.8, g = 0.8, b = 1, a = 0.8 },
      width = 47,
      height = 149,
      frame_count = 24,
      line_length = 8,
      animation_speed = 0.5,
      scale = 1.5,
      shift = {1.28125, 7.90625},
    },

    rocket_smoke_bottom1_animation =
    {
      filename = "__base__/graphics/entity/rocket-silo/03-12-rocket-over/rocket-top-smoke.png",
      priority = "medium",
      tint = { r = 0.8, g = 0.8, b = 1, a = 0.7 },
      width = 47,
      height = 149,
      frame_count = 24,
      line_length = 8,
      animation_speed = 0.5,
      scale = 1.5,
      shift = {-1.65625, 6.71875}
    },
    rocket_smoke_bottom2_animation =
    {
      filename = "__base__/graphics/entity/rocket-silo/03-12-rocket-over/rocket-top-smoke.png",
      priority = "medium",
      tint = { r = 0.8, g = 0.8, b = 1, a = 0.7 },
      width = 47,
      height = 149,
      frame_count = 24,
      line_length = 8,
      animation_speed = 0.5,
      scale = 1.5,
      shift = {1.65625, 6.71875}
    },
    rocket_flame_animation =
    {
      filename = "__base__/graphics/entity/rocket-silo/10-rocket-under/jet-flame.png",
      priority = "medium",
      blend_mode = "additive",
      width = 88,
      height = 132,
      frame_count = 8,
      line_length = 8,
      animation_speed = 0.5,
      scale = 0.93,
      shift = {0.04, 10}
    },
    rocket_flame_left_animation =
    {
      filename = "__base__/graphics/entity/rocket-silo/10-rocket-under/jet-flame.png",
      priority = "medium",
      blend_mode = "additive",
      width = 88,
      height = 132,
      frame_count = 8,
      line_length = 8,
      animation_speed = 0.5,
      scale = 0.345,
      shift = {-1.275, 8.6}
    },
    rocket_flame_left_rotation = 0.0611,

    rocket_flame_right_animation =
    {
      filename = "__base__/graphics/entity/rocket-silo/10-rocket-under/jet-flame.png",
      priority = "medium",
      blend_mode = "additive",
      width = 88,
      height = 132,
      frame_count = 8,
      line_length = 8,
      animation_speed = 0.5,
      scale = 0.368,
      shift = {1.25, 8.875}
    },
    rocket_flame_right_rotation = 0.952,


    rocket_rise_offset = {0, -3.5},
    rocket_launch_offset = {0, -256},
    rocket_render_layer_switch_distance = 6.5,
    full_render_layer_switch_distance = 8,
    effects_fade_in_start_distance = 4.5,
    effects_fade_in_end_distance = 8,
    shadow_fade_out_start_ratio = 0.25,
    shadow_fade_out_end_ratio = 0.75,
    rocket_visible_distance_from_center = 3.75,

    flying_trigger =
    {
      {
        type = "play-sound",
        sound =
        {
          {
            filename = "__base__/sound/silo-rocket.ogg",
            volume = 1.8
          },
        }
      },
    }
  },
  {
    type = "rocket-silo-rocket-shadow",
    name = "rocket-silo-rocket-shadow",
    flags = {"not-on-map"},
    collision_mask = {"not-colliding-with-itself"},
    collision_box = {{0, 0}, {10, 3.5}},
    selection_box = {{0, 0}, {0, 0}},
  },
  {
    type = "roboport",
    name = "roboport",
    icon = "__base__/graphics/icons/roboport.png",
    flags = {"placeable-player", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "roboport"},
    max_health = 500,
    corpse = "big-remnants",
    collision_box = {{-1.7, -1.7}, {1.7, 1.7}},
    selection_box = {{-2, -2}, {2, 2}},
    resistances =
    {
      {
        type = "fire",
        percent = 60
      },
      {
        type = "impact",
        percent = 30
      }
    },
    dying_explosion = "medium-explosion",
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      input_flow_limit = "5MW",
      buffer_capacity = "100MJ"
    },
    recharge_minimum = "40MJ",
    energy_usage = "50kW",
    -- per one charge slot
    charging_energy = "1000kW",
    logistics_radius = 25,
    construction_radius = 55,
    charge_approach_distance = 5,
    robot_slots_count = 7,
    material_slots_count = 7,
    stationing_offset = {0, 0},
    charging_offsets =
    {
      {-1.5, -0.5}, {1.5, -0.5}, {1.5, 1.5}, {-1.5, 1.5},
    },
    base =
    {
      filename = "__base__/graphics/entity/roboport/roboport-base.png",
      width = 143,
      height = 135,
      shift = {0.5, 0.25}
    },
    base_patch =
    {
      filename = "__base__/graphics/entity/roboport/roboport-base-patch.png",
      priority = "medium",
      width = 69,
      height = 50,
      frame_count = 1,
      shift = {0.03125, 0.203125}
    },
    base_animation =
    {
      filename = "__base__/graphics/entity/roboport/roboport-base-animation.png",
      priority = "medium",
      width = 42,
      height = 31,
      frame_count = 8,
      animation_speed = 0.5,
      shift = {-0.5315, -1.9375}
    },
    door_animation_up =
    {
      filename = "__base__/graphics/entity/roboport/roboport-door-up.png",
      priority = "medium",
      width = 52,
      height = 20,
      frame_count = 16,
      shift = {0.015625, -0.890625}
    },
    door_animation_down =
    {
      filename = "__base__/graphics/entity/roboport/roboport-door-down.png",
      priority = "medium",
      width = 52,
      height = 22,
      frame_count = 16,
      shift = {0.015625, -0.234375}
    },
    recharging_animation =
    {
      filename = "__base__/graphics/entity/roboport/roboport-recharging.png",
      priority = "high",
      width = 37,
      height = 35,
      frame_count = 16,
      scale = 1.5,
      animation_speed = 0.5
    },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      sound = { filename = "__base__/sound/roboport-working.ogg", volume = 0.6 },
      max_sounds_per_type = 3,
      audible_distance_modifier = 0.5,
      probability = 1 / (5 * 60) -- average pause between the sound is 5 seconds
    },
    recharging_light = {intensity = 0.4, size = 5, color = {r = 1.0, g = 1.0, b = 1.0}},
    request_to_open_door_timeout = 15,
    spawn_and_station_height = -0.1,

    draw_logistic_radius_visualization = true,
    draw_construction_radius_visualization = true,

    open_door_trigger_effect =
    {
      {
        type = "play-sound",
        sound = { filename = "__base__/sound/roboport-door.ogg", volume = 1.2 }
      },
    },
    close_door_trigger_effect =
    {
      {
        type = "play-sound",
        sound = { filename = "__base__/sound/roboport-door.ogg", volume = 0.75 }
      },
    },
    circuit_wire_connection_point =
    {
      shadow =
      {
        red = {1.17188, 1.98438},
        green = {1.04688, 2.04688}
      },
      wire =
      {
        red = {0.78125, 1.375},
        green = {0.78125, 1.53125}
      }
    },
    circuit_connector_sprites = get_circuit_connector_sprites({0.59375, 1.3125}, nil, 18),
    circuit_wire_max_distance = 9,
    default_available_logistic_output_signal = {type = "virtual", name = "signal-X"},
    default_total_logistic_output_signal = {type = "virtual", name = "signal-Y"},
    default_available_construction_output_signal = {type = "virtual", name = "signal-Z"},
    default_total_construction_output_signal = {type = "virtual", name = "signal-T"},
  },

  {
    type = "storage-tank",
    name = "storage-tank",
    icon = "__base__/graphics/icons/storage-tank.png",
    flags = {"placeable-player", "player-creation"},
    minable = {mining_time = 1.5, result = "storage-tank"},
    max_health = 500,
    corpse = "medium-remnants",
    collision_box = {{-1.3, -1.3}, {1.3, 1.3}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    fluid_box =
    {
      base_area = 250,
      pipe_covers = pipecoverspictures(),
      pipe_connections =
      {
        { position = {-1, -2} },
        { position = {2, 1} },
        { position = {1, 2} },
        { position = {-2, -1} },
      },
    },
    two_direction_only = true,
    window_bounding_box = {{-0.125, 0.6875}, {0.1875, 1.1875}},
    pictures =
    {
      picture =
      {
        sheet =
        {
          filename = "__base__/graphics/entity/storage-tank/storage-tank.png",
          priority = "extra-high",
          frames = 2,
          width = 140,
          height = 115,
          shift = {0.6875, 0.109375}
        }
      },
      fluid_background =
      {
        filename = "__base__/graphics/entity/storage-tank/fluid-background.png",
        priority = "extra-high",
        width = 32,
        height = 15
      },
      window_background =
      {
        filename = "__base__/graphics/entity/storage-tank/window-background.png",
        priority = "extra-high",
        width = 17,
        height = 24
      },
      flow_sprite =
      {
        filename = "__base__/graphics/entity/pipe/fluid-flow-low-temperature.png",
        priority = "extra-high",
        width = 160,
        height = 20
      },
      gas_flow =
      {
        filename = "__base__/graphics/entity/pipe/steam.png",
        priority = "extra-high",
        line_length = 10,
        width = 24,
        height = 15,
        frame_count = 60,
        axially_symmetrical = false,
        direction_count = 1,
        animation_speed = 0.25,
        hr_version =
        {
          filename = "__base__/graphics/entity/pipe/hr-steam.png",
          priority = "extra-high",
          line_length = 10,
          width = 48,
          height = 30,
          frame_count = 60,
          axially_symmetrical = false,
          animation_speed = 0.25,
          direction_count = 1
        }
      }
    },
    flow_length_in_ticks = 360,
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      sound = {
          filename = "__base__/sound/storage-tank.ogg",
          volume = 0.8
      },
      apparent_volume = 1.5,
      max_sounds_per_type = 3
    },
    circuit_wire_connection_points =
    {
      {
        shadow =
        {
          red = {2.35938, 0.890625},
          green = {2.29688, 0.953125},
        },
        wire =
        {
          red = {-0.40625, -0.375},
          green = {-0.53125, -0.46875},
        }
      },
      {
        shadow =
        {
          red = {2.35938, 0.890625},
          green = {2.29688, 0.953125},
        },
        wire =
        {
          red = {0.46875, -0.53125},
          green = {0.375, -0.4375},
        }
      },
      {
        shadow =
        {
          red = {2.35938, 0.890625},
          green = {2.29688, 0.953125},
        },
        wire =
        {
          red = {-0.40625, -0.375},
          green = {-0.53125, -0.46875},
        }
      },
      {
        shadow =
        {
          red = {2.35938, 0.890625},
          green = {2.29688, 0.953125},
        },
        wire =
        {
          red = {0.46875, -0.53125},
          green = {0.375, -0.4375},
        }
      },
    },
    circuit_connector_sprites =
    {
      get_circuit_connector_sprites({-0.1875, -0.375}, nil, 7),
      get_circuit_connector_sprites({0.375, -0.53125}, nil, 1),
      get_circuit_connector_sprites({-0.1875, -0.375}, nil, 7),
      get_circuit_connector_sprites({0.375, -0.53125}, nil, 1),
    },
    circuit_wire_max_distance = 9
  },

  {
    type = "pump",
    name = "pump",
    icon = "__base__/graphics/icons/pump.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 1, result = "pump"},
    max_health = 180,
    fast_replaceable_group = "pipe",
    corpse = "small-remnants",
    collision_box = {{-0.29, -0.79}, {0.29, 0.79}},
    selection_box = {{-0.5, -1}, {0.5, 1}},
    resistances =
    {
      {
        type = "fire",
        percent = 80
      },
      {
        type = "impact",
        percent = 30
      }
    },
    fluid_box =
    {
      base_area = 1,
      height = 2,
      pipe_covers = pipecoverspictures(),
      pipe_connections =
      {
        { position = {0, -1.5}, type="output" },
        { position = {0, 1.5}, type="input" },
      },
    },
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions = 0.01 / 2.5
    },
    energy_usage = "30kW",
    pumping_speed = 200,
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },

    animations =
    {
      north =
      {
        filename = "__base__/graphics/entity/pump/pump-north.png",
        width = 53,
        height = 79,
        line_length =8,
        frame_count =32,
        animation_speed = 0.5,
        shift = util.by_pixel(8.000, 7.500),
        hr_version = {
          filename = "__base__/graphics/entity/pump/hr-pump-north.png",
          width = 103,
          height = 164,
          scale = 0.5,
          line_length =8,
          frame_count =32,
          animation_speed = 0.5,
          shift = util.by_pixel(8, 3.5) -- {0.515625, 0.21875}
        },
      },
      east =
      {
        filename = "__base__/graphics/entity/pump/pump-east.png",
        width = 66,
        height = 60,
        line_length =8,
        frame_count =32,
        animation_speed = 0.5,
        shift = util.by_pixel(0, 4),
        hr_version = {
          filename = "__base__/graphics/entity/pump/hr-pump-east.png",
          width = 130,
          height = 109,
          scale = 0.5,
          line_length =8,
          frame_count =32,
          animation_speed = 0.5,
          shift = util.by_pixel(-0.5, 1.75) --{-0.03125, 0.109375}
        },
      },

      south =
      {
        filename = "__base__/graphics/entity/pump/pump-south.png",
        width = 62,
        height = 87,
        line_length =8,
        frame_count =32,
        animation_speed = 0.5,
        shift = util.by_pixel(13.5, 0.5),
        hr_version = {
          filename = "__base__/graphics/entity/pump/hr-pump-south.png",
          width = 114,
          height = 160,
          scale = 0.5,
          line_length =8,
          frame_count =32,
          animation_speed = 0.5,
          shift = util.by_pixel(12.5, -8) -- {0.75, -0.5}
        },
      },
      west =
      {
        filename = "__base__/graphics/entity/pump/pump-west.png",
        width = 69,
        height = 51,
        line_length =8,
        frame_count =32,
        animation_speed = 0.5,
        shift = util.by_pixel(0.5, -0.5),
        hr_version = {
          filename = "__base__/graphics/entity/pump/hr-pump-west.png",
          width = 131,
          height = 111,
          scale = 0.5,
          line_length =8,
          frame_count =32,
          animation_speed = 0.5,
          shift = util.by_pixel(-0.25, 1.25) -- {-0.015625, 0.078125}
        },
      },
    },

    fluid_wagon_connector_frame_count = 35,

    fluid_wagon_connector_graphics = require("prototypes.entity.pump-connector"),

    fluid_animation =
    {
      north =
      {
        filename = "__base__/graphics/entity/pump/pump-north-liquid.png",
        apply_runtime_tint = true,
        width = 20,
        height = 13,
        line_length =8,
        frame_count =32,
        shift = util.by_pixel(-0.500, -14.500),
        hr_version = {
          filename = "__base__/graphics/entity/pump/hr-pump-north-liquid.png",
          apply_runtime_tint = true,
          width = 38,
          height = 22,
          scale = 0.5,
          line_length =8,
          frame_count =32,
          shift = util.by_pixel(-0.250, -16.750)
        }
      },

      east =
      {
        filename = "__base__/graphics/entity/pump/pump-east-liquid.png",
        width = 18,
        height = 24,
        line_length =8,
        frame_count =32,
        shift = util.by_pixel(6.000, -8.000),
        hr_version = {
          filename = "__base__/graphics/entity/pump/hr-pump-east-liquid.png",
          width = 35,
          height = 46,
          scale = 0.5,
          line_length =8,
          frame_count =32,
          shift = util.by_pixel(6.250, -8.500)
        },
      },

      south =
      {
        filename = "__base__/graphics/entity/pump/pump-south-liquid.png",
        width = 26,
        height = 55,
        line_length =8,
        frame_count =32,
        shift = util.by_pixel(3.500, 6.500),
        hr_version = {
          filename = "__base__/graphics/entity/pump/hr-pump-south-liquid.png",
          width = 38,
          height = 45,
          scale = 0.5,
          line_length =8,
          frame_count =32,
          shift = util.by_pixel(0.500, -9.250)
        },
      },
      west =
      {
        filename = "__base__/graphics/entity/pump/pump-west-liquid.png",
        width = 18,
        height = 24,
        line_length =8,
        frame_count =32,
        shift = util.by_pixel(-6.000, -9.000),
        hr_version = {
          filename = "__base__/graphics/entity/pump/hr-pump-west-liquid.png",
          width = 35,
          height = 47,
          scale = 0.5,
          line_length =8,
          frame_count =32,
          shift = util.by_pixel(-6.500, -9.500)
        },
      }
    },

    glass_pictures =
    {
      north = {
        filename = "__base__/graphics/entity/pump/pump-north-glass.png",
        width = 32,
        height = 64,
        hr_version = {
          filename = "__base__/graphics/entity/pump/hr-pump-north-glass.png",
          width = 64,
          height = 128,
          scale = 0.5,
        },
      },
      east = {
        filename = "__base__/graphics/entity/pump/pump-east-glass.png",
        width = 32,
        height = 32,
        shift = util.by_pixel(0.000, -16.000),
        hr_version = {
          filename = "__base__/graphics/entity/pump/hr-pump-east-glass.png",
          width = 128,
          height = 192,
          scale = 0.5,
        },
      },
      south = {
        filename = "__base__/graphics/entity/pump/pump-south-glass.png",
        width = 32,
        height = 64,
        hr_version = {
          filename = "__base__/graphics/entity/pump/hr-pump-south-glass.png",
          width = 64,
          height = 128,
          scale = 0.5,
        },
      },
      west = {
        filename = "__base__/graphics/entity/pump/pump-west-glass.png",
        width = 32,
        height = 96,
        shift = util.by_pixel(0.000, 15.000),
        hr_version = {
          filename = "__base__/graphics/entity/pump/hr-pump-west-glass.png",
          width = 192,
          height = 192,
          scale = 0.5,
          shift = util.by_pixel(-16.000, 0.000)
        },
      }
    },

    circuit_wire_connection_points =
    {
      {
        shadow =
        {
          red = {0.171875, 0.140625},
          green = {0.171875, 0.265625},
        },
        wire =
        {
          red = {-0.53125, -0.15625},
          green = {-0.53125, 0},
        }
      },
      {
        shadow =
        {
          red = {0.890625, 0.703125},
          green = {0.75, 0.75},
        },
        wire =
        {
          red = {0.34375, 0.28125},
          green = {0.34375, 0.4375},
        }
      },
      {
        shadow =
        {
          red = {0.15625, 0.0625},
          green = {0.09375, 0.125},
        },
        wire =
        {
          red = {-0.53125, -0.09375},
          green = {-0.53125, 0.03125},
        }
      },
      {
        shadow =
        {
          red = {0.796875, 0.703125},
          green = {0.625, 0.75},
        },
        wire =
        {
          red = {0.40625, 0.28125},
          green = {0.40625, 0.4375},
        }
      }
    },
    circuit_connector_sprites =
    {
      get_circuit_connector_sprites({-0.40625, -0.3125}, nil, 24),
      get_circuit_connector_sprites({0.125, 0.21875}, {0.34375, 0.40625}, 18),
      get_circuit_connector_sprites({-0.40625, -0.25}, nil, 24),
      get_circuit_connector_sprites({0.203125, 0.203125}, {0.25, 0.40625}, 18),
    },
    circuit_wire_max_distance = 9

  },

  {
    type = "explosion",
    name = "laser-bubble",
    flags = {"not-on-map"},
    animation_speed = 1,
    animations =
    {
      {
        filename = "__base__/graphics/entity/laser-bubble/laser-bubble.png",
        priority = "extra-high",
        width = 8,
        height = 8,
        frame_count = 5
      }
    },
    light = {intensity = 1, size = 10, color = {r = 1.0, g = 1.0, b = 1.0}},
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1
  },
  {
    type = "explosion",
    name = "railgun-beam",
    flags = {"not-on-map"},
    animation_speed = 3,
    rotate = true,
    beam = true,
    animations =
    {
      {
        filename = "__base__/graphics/entity/blue-beam/blue-beam.png",
        priority = "extra-high",
        width = 187,
        height = 1,
        frame_count = 6,
      }
    },
    light = {intensity = 1, size = 10, color = {r = 1.0, g = 1.0, b = 1.0}},
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1
  },
  {
    type = "market",
    name = "market",
    icon = "__base__/graphics/icons/market.png",
    flags = {"placeable-neutral", "player-creation"},
    subgroup="production-machine",
    order="d-a-a",
    max_health = 150,
    corpse = "big-remnants",
    collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    picture =
    {
      filename = "__base__/graphics/entity/market/market.png",
      width = 156,
      height = 127,
      shift = {0.95, 0.2}
    }
  },
  {
    type = "electric-pole",
    name = "big-electric-pole",
    icon = "__base__/graphics/icons/big-electric-pole.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "big-electric-pole"},
    max_health = 150,
    corpse = "medium-remnants",
    resistances =
    {
      {
        type = "fire",
        percent = 100
      }
    },
    collision_box = {{-0.65, -0.65}, {0.65, 0.65}},
    selection_box = {{-1, -1}, {1, 1}},
    drawing_box = {{-1, -3}, {1, 0.5}},
    maximum_wire_distance = 30,
    supply_area_distance = 2,
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    pictures =
    {
      filename = "__base__/graphics/entity/big-electric-pole/big-electric-pole.png",
      priority = "high",
      width = 168,
      height = 165,
      direction_count = 4,
      shift = {1.6, -1.1}
    },
    connection_points =
    {
      {
        shadow =
        {
          copper = {2.7, 0},
          green = {1.8, 0},
          red = {3.6, 0}
        },
        wire =
        {
          copper = {0, -3.125},
          green = {-0.59375, -3.125},
          red = {0.625, -3.125}
        }
      },
      {
        shadow =
        {
          copper = {3.1, 0.2},
          green = {2.3, -0.3},
          red = {3.8, 0.6}
        },
        wire =
        {
          copper = {-0.0625, -3.125},
          green = {-0.5, -3.4375},
          red = {0.34375, -2.8125}
        }
      },
      {
        shadow =
        {
          copper = {2.9, 0.06},
          green = {3.0, -0.6},
          red = {3.0, 0.8}
        },
        wire =
        {
          copper = {-0.09375, -3.09375},
          green = {-0.09375, -3.53125},
          red = {-0.09375, -2.65625}
        }
      },
      {
        shadow =
        {
          copper = {3.1, 0.2},
          green = {3.8, -0.3},
          red = {2.35, 0.6}
        },
        wire =
        {
          copper = {-0.0625, -3.1875},
          green = {0.375, -3.5},
          red = {-0.46875, -2.90625}
        }
      }
    },
    radius_visualisation_picture =
    {
      filename = "__base__/graphics/entity/small-electric-pole/electric-pole-radius-visualization.png",
      width = 12,
      height = 12,
      priority = "extra-high-no-scale"
    },
  },
  {
    type = "electric-pole",
    name = "medium-electric-pole",
    icon = "__base__/graphics/icons/medium-electric-pole.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "medium-electric-pole"},
    max_health = 100,
    corpse = "small-remnants",
    track_coverage_during_build_by_moving = true,
    resistances =
    {
      {
        type = "fire",
        percent = 100
      }
    },
    collision_box = {{-0.15, -0.15}, {0.15, 0.15}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    drawing_box = {{-0.5, -2.8}, {0.5, 0.5}},
    maximum_wire_distance = 9,
    supply_area_distance = 3.5,
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    pictures =
    {
      filename = "__base__/graphics/entity/medium-electric-pole/medium-electric-pole.png",
      priority = "high",
      width = 136,
      height = 122,
      direction_count = 4,
      shift = {1.4, -1.0}
    },
    connection_points =
    {
      {
        shadow =
        {
          copper = {2.55, 0.4},
          green = {2.0, 0.4},
          red = {3.05, 0.4}
        },
        wire =
        {
          copper = {-0.03125, -2.46875},
          green = {-0.34375, -2.46875},
          red = {0.25, -2.46875}
        }
      },
      {
        shadow =
        {
          copper = {2.9, 0.1},
          green = {2.6, -0.15},
          red = {3.25, 0.35}
        },
        wire =
        {
          copper = {0.0625, -2.65625},
          green = {-0.15625, -2.84375},
          red = {0.28125, -2.5}
        }
      },
      {
        shadow =
        {
          copper = {1.5, -0.2},
          green = {1.5, -0.55},
          red = {1.5, 0.1}
        },
        wire =
        {
          copper = {-0.4375, -2.28125},
          green = {-0.4375, -2.5625},
          red = {-0.4375, -2.0625}
        }
      },
      {
        shadow =
        {
          copper = {2.88, 0.2},
          green = {3.2, -0.1},
          red = {2.45, 0.4}
        },
        wire =
        {
          copper = {-0.0625, -2.5625},
          green = {0.15625, -2.75},
          red = {-0.28125, -2.4375}
        }
      }
    },
    radius_visualisation_picture =
    {
      filename = "__base__/graphics/entity/small-electric-pole/electric-pole-radius-visualization.png",
      width = 12,
      height = 12,
      priority = "extra-high-no-scale"
    },
  },
  {
    type = "electric-pole",
    name = "substation",
    icon = "__base__/graphics/icons/substation.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "substation"},
    max_health = 200,
    corpse = "medium-remnants",
    track_coverage_during_build_by_moving = true,
    resistances =
    {
      {
        type = "fire",
        percent = 90
      }
    },
    collision_box = {{-0.9, -0.9}, {0.9, 0.9}},
    selection_box = {{-1, -1}, {1, 1}},
    drawing_box = {{-1, -3}, {1, 1}},
    maximum_wire_distance = 18,
    supply_area_distance = 9,
    pictures =
    {
      filename = "__base__/graphics/entity/substation/substation.png",
      priority = "high",
      width = 132,
      height = 144,
      direction_count = 4,
      shift = {0.9, -1}
    },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      sound = { filename = "__base__/sound/substation.ogg" },
      apparent_volume = 1.5,
      audible_distance_modifier = 0.5,
      probability = 1 / (3 * 60) -- average pause between the sound is 3 seconds
    },
    connection_points =
    {
      {
        shadow =
        {
          copper = {1.9, -0.6},
          green = {1.3, -0.6},
          red = {2.65, -0.6}
        },
        wire =
        {
          copper = {-0.25, -2.71875},
          green = {-0.84375, -2.71875},
          red = {0.34375, -2.71875}
        }
      },
      {
        shadow =
        {
          copper = {1.9, -0.6},
          green = {1.2, -0.8},
          red = {2.5, -0.35}
        },
        wire =
        {
          copper = {-0.21875, -2.71875},
          green = {-0.65625, -3.03125},
          red = {0.1875, -2.4375}
        }
      },
      {
        shadow =
        {
          copper = {1.9, -0.6},
          green = {1.9, -0.9},
          red = {1.9, -0.3}
        },
        wire =
        {
          copper = {-0.21875, -2.71875},
          green = {-0.21875, -3.15625},
          red = {-0.21875, -2.34375}
        }
      },
      {
        shadow =
        {
          copper = {1.8, -0.7},
          green = {1.3, -0.6},
          red = {2.4, -1.15}
        },
        wire =
        {
          copper = {-0.21875, -2.75},
          green = {-0.65625, -2.4375},
          red = {0.1875, -3.03125}
        }
      }
    },
    radius_visualisation_picture =
    {
      filename = "__base__/graphics/entity/small-electric-pole/electric-pole-radius-visualization.png",
      width = 12,
      height = 12,
      priority = "extra-high-no-scale"
    },
  },
  {
    type = "accumulator",
    name = "accumulator",
    icon = "__base__/graphics/icons/accumulator.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "accumulator"},
    max_health = 150,
    corpse = "medium-remnants",
    collision_box = {{-0.9, -0.9}, {0.9, 0.9}},
    selection_box = {{-1, -1}, {1, 1}},
    energy_source =
    {
      type = "electric",
      buffer_capacity = "5MJ",
      usage_priority = "terciary",
      input_flow_limit = "300kW",
      output_flow_limit = "300kW"
    },
    picture =
    {
      filename = "__base__/graphics/entity/accumulator/accumulator.png",
      priority = "extra-high",
      width = 124,
      height = 103,
      shift = {0.6875, -0.203125}
    },
    charge_animation =
    {
      filename = "__base__/graphics/entity/accumulator/accumulator-charge-animation.png",
      width = 138,
      height = 135,
      line_length = 8,
      frame_count = 24,
      shift = {0.46875, -0.640625},
      animation_speed = 0.5
    },
    charge_cooldown = 30,
    charge_light = {intensity = 0.3, size = 7, color = {r = 1.0, g = 1.0, b = 1.0}},
    discharge_animation =
    {
      filename = "__base__/graphics/entity/accumulator/accumulator-discharge-animation.png",
      width = 147,
      height = 128,
      line_length = 8,
      frame_count = 24,
      shift = {0.390625, -0.53125},
      animation_speed = 0.5
    },
    discharge_cooldown = 60,
    discharge_light = {intensity = 0.7, size = 7, color = {r = 1.0, g = 1.0, b = 1.0}},
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/accumulator-working.ogg",
        volume = 1
      },
      idle_sound = {
        filename = "__base__/sound/accumulator-idle.ogg",
        volume = 0.4
      },
      max_sounds_per_type = 5
    },
    circuit_wire_connection_point =
    {
      shadow =
      {
        red = {0.984375, 1.10938},
        green = {0.890625, 1.10938}
      },
      wire =
      {
        red = {0.6875, 0.59375},
        green = {0.6875, 0.71875}
      }
    },
    circuit_connector_sprites = get_circuit_connector_sprites({0.46875, 0.5}, {0.46875, 0.8125}, 26),
    circuit_wire_max_distance = 9,
    default_output_signal = {type = "virtual", name = "signal-A"}
  },
  {
    type = "furnace",
    name = "steel-furnace",
    icon = "__base__/graphics/icons/steel-furnace.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 1, result = "steel-furnace"},
    max_health = 300,
    corpse = "medium-remnants",
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      sound = { filename = "__base__/sound/furnace.ogg" }
    },
    resistances =
    {
      {
        type = "fire",
        percent = 100
      }
    },
    collision_box = {{-0.7, -0.7}, {0.7, 0.7}},
    selection_box = {{-0.8, -1}, {0.8, 1}},
    crafting_categories = {"smelting"},
    result_inventory_size = 1,
    energy_usage = "180kW",
    crafting_speed = 2,
    source_inventory_size = 1,
    energy_source =
    {
      type = "burner",
      fuel_category = "chemical",
      effectivity = 1,
      emissions = 0.02,
      fuel_inventory_size = 1,
      smoke =
      {
        {
          name = "smoke",
          frequency = 10,
          position = {0.7, -1.2},
          starting_vertical_speed = 0.08,
          starting_frame_deviation = 60
        }
      }
    },
    animation =
    {
      layers = {
        {
          filename = "__base__/graphics/entity/steel-furnace/steel-furnace.png",
          priority = "high",
          width = 85,
          height = 87,
          frame_count = 1,
          shift = util.by_pixel(-1.5, 1.5),
          hr_version = {
            filename = "__base__/graphics/entity/steel-furnace/hr-steel-furnace.png",
            priority = "high",
            width = 171,
            height = 174,
            frame_count = 1,
            shift = util.by_pixel(-1.25, 2),
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/steel-furnace/steel-furnace-shadow.png",
          priority = "high",
          width = 139,
          height = 43,
          frame_count = 1,
          draw_as_shadow = true,
          shift = util.by_pixel(39.5, 11.5),
          hr_version = {
            filename = "__base__/graphics/entity/steel-furnace/hr-steel-furnace-shadow.png",
            priority = "high",
            width = 277,
            height = 85,
            frame_count = 1,
            draw_as_shadow = true,
            shift = util.by_pixel(39.25, 11.25),
            scale = 0.5
          }
        },
      },
    },
    working_visualisations =
    {
      {
        north_position = {0.0, 0.0},
        east_position = {0.0, 0.0},
        south_position = {0.0, 0.0},
        west_position = {0.0, 0.0},
        animation =
        {
          filename = "__base__/graphics/entity/steel-furnace/steel-furnace-fire.png",
          priority = "high",
          line_length = 8,
          width = 29,
          height = 40,
          frame_count = 48,
          axially_symmetrical = false,
          direction_count = 1,
          shift = util.by_pixel(-0.5, 6),
          hr_version = {
            filename = "__base__/graphics/entity/steel-furnace/hr-steel-furnace-fire.png",
            priority = "high",
            line_length = 8,
            width = 57,
            height = 81,
            frame_count = 48,
            axially_symmetrical = false,
            direction_count = 1,
            shift = util.by_pixel(-0.75, 5.75),
            scale = 0.5
          }
        },
        light = {intensity = 1, size = 1, color = {r = 1.0, g = 1.0, b = 1.0}}
      },
      {
        north_position = {0.0, 0.0},
        east_position = {0.0, 0.0},
        south_position = {0.0, 0.0},
        west_position = {0.0, 0.0},
        effect = "flicker", -- changes alpha based on energy source light intensity
        animation =
        {
          filename = "__base__/graphics/entity/steel-furnace/steel-furnace-glow.png",
          priority = "high",
          width = 60,
          height = 43,
          frame_count = 1,
          shift = {0.03125, 0.640625},
          blend_mode = "additive"
        }
      },
      {
        north_position = {0.0, 0.0},
        east_position = {0.0, 0.0},
        south_position = {0.0, 0.0},
        west_position = {0.0, 0.0},
        effect = "flicker", -- changes alpha based on energy source light intensity
        animation =
        {
          filename = "__base__/graphics/entity/steel-furnace/steel-furnace-working.png",
          priority = "high",
          line_length = 8,
          width = 64,
          height = 75,
          frame_count = 1,
          axially_symmetrical = false,
          direction_count = 1,
          shift = util.by_pixel(0, -4.5),
          blend_mode = "additive",
          hr_version = {
            filename = "__base__/graphics/entity/steel-furnace/hr-steel-furnace-working.png",
            priority = "high",
            line_length = 8,
            width = 130,
            height = 149,
            frame_count = 1,
            axially_symmetrical = false,
            direction_count = 1,
            shift = util.by_pixel(0, -4.25),
            blend_mode = "additive",
            scale = 0.5
          }
        }
      },
    },
    fast_replaceable_group = "furnace"
  },
  {
    type = "furnace",
    name = "electric-furnace",
    icon = "__base__/graphics/icons/electric-furnace.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 1, result = "electric-furnace"},
    max_health = 350,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    light = {intensity = 1, size = 10},
    resistances =
    {
      {
        type = "fire",
        percent = 80
      }
    },
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    module_specification =
    {
      module_slots = 2,
      module_info_icon_shift = {0, 0.8}
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution"},
    crafting_categories = {"smelting"},
    result_inventory_size = 1,
    crafting_speed = 2,
    energy_usage = "180kW",
    source_inventory_size = 1,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions = 0.005
    },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/electric-furnace.ogg",
        volume = 0.7
      },
      apparent_volume = 1.5
    },
    animation =
    {
      layers = {
      {
        filename = "__base__/graphics/entity/electric-furnace/electric-furnace-base.png",
        priority = "high",
        width = 129,
        height = 100,
        frame_count = 1,
        shift = {0.421875, 0},
        hr_version = {
          filename = "__base__/graphics/entity/electric-furnace/hr-electric-furnace.png",
          priority = "high",
          width = 239,
          height = 219,
          frame_count = 1,
          shift = util.by_pixel(0.75, 5.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/electric-furnace/electric-furnace-shadow.png",
        priority = "high",
        width = 129,
        height = 100,
        frame_count = 1,
        shift = {0.421875, 0},
        draw_as_shadow = true,
        hr_version = {
          filename = "__base__/graphics/entity/electric-furnace/hr-electric-furnace-shadow.png",
          priority = "high",
          width = 227,
          height = 171,
          frame_count = 1,
          draw_as_shadow = true,
          shift = util.by_pixel(11.25, 7.75),
          scale = 0.5
        }
      }
      }
    },
    working_visualisations =
    {
      {
        animation =
        {
          filename = "__base__/graphics/entity/electric-furnace/electric-furnace-heater.png",
          priority = "high",
          width = 25,
          height = 15,
          frame_count = 12,
          animation_speed = 0.5,
          shift = {0.015625, 0.890625},
          hr_version = {
            filename = "__base__/graphics/entity/electric-furnace/hr-electric-furnace-heater.png",
            priority = "high",
            width = 60,
            height = 56,
            frame_count = 12,
            animation_speed = 0.5,
            shift = util.by_pixel(1.75, 32.75),
            scale = 0.5
          }
        },
        light = {intensity = 0.4, size = 6, shift = {0.0, 1.0}, color = {r = 1.0, g = 1.0, b = 1.0}}
      },
      {
        animation =
        {
          filename = "__base__/graphics/entity/electric-furnace/electric-furnace-propeller-1.png",
          priority = "high",
          width = 19,
          height = 13,
          frame_count = 4,
          animation_speed = 0.5,
          shift = {-0.671875, -0.640625},
          hr_version = {
            filename = "__base__/graphics/entity/electric-furnace/hr-electric-furnace-propeller-1.png",
            priority = "high",
            width = 37,
            height = 25,
            frame_count = 4,
            animation_speed = 0.5,
            shift = util.by_pixel(-20.5, -18.5),
            scale = 0.5
          }
        }
      },
      {
        animation =
        {
          filename = "__base__/graphics/entity/electric-furnace/electric-furnace-propeller-2.png",
          priority = "high",
          width = 12,
          height = 9,
          frame_count = 4,
          animation_speed = 0.5,
          shift = {0.0625, -1.234375},
          hr_version = {
            filename = "__base__/graphics/entity/electric-furnace/hr-electric-furnace-propeller-2.png",
            priority = "high",
            width = 23,
            height = 15,
            frame_count = 4,
            animation_speed = 0.5,
            shift = util.by_pixel(3.5, -38),
            scale = 0.5
          }
        }
      }
    },
    fast_replaceable_group = "furnace"
  },
  {
    type = "beacon",
    name = "beacon",
    icon = "__base__/graphics/icons/beacon.png",
    flags = {"placeable-player", "player-creation"},
    minable = {mining_time = 1, result = "beacon"},
    max_health = 200,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    allowed_effects = {"consumption", "speed", "pollution"},
    base_picture =
    {
      filename = "__base__/graphics/entity/beacon/beacon-base.png",
      width = 116,
      height = 93,
      shift = { 0.34375, 0.046875}
    },
    animation =
    {
      filename = "__base__/graphics/entity/beacon/beacon-antenna.png",
      width = 54,
      height = 50,
      line_length = 8,
      frame_count = 32,
      shift = { -0.03125, -1.71875},
      animation_speed = 0.5
    },
    animation_shadow =
    {
      filename = "__base__/graphics/entity/beacon/beacon-antenna-shadow.png",
      width = 63,
      height = 49,
      line_length = 8,
      frame_count = 32,
      shift = { 3.140625, 0.484375},
      animation_speed = 0.5
    },
    radius_visualisation_picture =
    {
      filename = "__base__/graphics/entity/beacon/beacon-radius-visualization.png",
      width = 10,
      height = 10
    },
    supply_area_distance = 3,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input"
    },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    energy_usage = "480kW",
    distribution_effectivity = 0.5,
    module_specification =
    {
      module_slots = 2,
      module_info_icon_shift = {0, 0.5},
      module_info_multi_row_initial_height_modifier = -0.3
    }
  },
  {
    type = "smoke-with-trigger",
    name = "poison-cloud",
    flags = {"not-on-map"},
    show_when_smoke_off = true,
    animation =
    {
      filename = "__base__/graphics/entity/cloud/cloud-45-frames.png",
      flags = { "compressed" },
      priority = "low",
      width = 256,
      height = 256,
      frame_count = 45,
      animation_speed = 0.5,
      line_length = 7,
      scale = 3,
    },
    slow_down_factor = 0,
    affected_by_wind = false,
    cyclic = true,
    duration = 60 * 20,
    fade_away_duration = 2 * 60,
    spread_duration = 10,
    color = { r = 0.2, g = 0.9, b = 0.2 },
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          type = "nested-result",
          action =
          {
            type = "area",
            perimeter = 11,
            entity_flags = {"breaths-air"},
            action_delivery =
            {
              type = "instant",
              target_effects =
              {
                type = "damage",
                damage = { amount = 8, type = "poison"}
              }
            }
          }
        }
      }
    },
    action_cooldown = 30
  },
  {
    type = "combat-robot",
    name = "distractor",
    icon = "__base__/graphics/icons/distractor.png",
    flags = {"placeable-player", "player-creation", "placeable-off-grid", "not-on-map", "not-repairable"},
    resistances = { { type = "fire", percent = 95 } },
    order="e-a-b",
    subgroup="capsule",
    max_health = 90,
    alert_when_damaged = false,
    collision_box = {{0, 0}, {0, 0}},
    selection_box = {{-0.9, -1.5}, {0.9, -0.5}},
    distance_per_frame = 0.13,
    time_to_live = 60 * 45,
    speed = 0,
    destroy_action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        source_effects =
        {
            type = "create-entity",
            entity_name = "explosion"
        }
      }
    },
    attack_parameters =
    {
      type = "projectile",
      ammo_category = "combat-robot-laser",
      cooldown = 20,
      damage_modifier = 1.5,
      projectile_center = {0, 0},
      projectile_creation_distance = 0.6,
      range = 15,
      sound = make_laser_sounds(),
      ammo_type =
      {
        category = "combat-robot-laser",
        action =
        {
          type = "direct",
          action_delivery =
          {
            type = "projectile",
            projectile = "laser",
            starting_speed = 0.3
          }
        }
      }
    },
    idle =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/distractor-robot/distractor-robot.png",
          priority = "high",
          line_length = 16,
          width = 38,
          height = 33,
          frame_count = 1,
          direction_count = 16,
          shift = {0, -0.078125}
        },
        {
          filename = "__base__/graphics/entity/distractor-robot/distractor-robot-mask.png",
          priority = "high",
          line_length = 16,
          width = 24,
          height = 21,
          frame_count = 1,
          direction_count = 16,
          shift = {0, -0.203125},
          apply_runtime_tint = true
        }
      }
    },
    shadow_idle =
    {
      filename = "__base__/graphics/entity/distractor-robot/distractor-robot-shadow.png",
      priority = "high",
      line_length = 16,
      width = 40,
      height = 25,
      frame_count = 1,
      direction_count = 16,
      shift = {0.9375, 0.609375}
    },
    in_motion =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/distractor-robot/distractor-robot.png",
          priority = "high",
          line_length = 16,
          width = 38,
          height = 33,
          frame_count = 1,
          direction_count = 16,
          shift = {0, -0.078125},
          y = 33
        },
        {
          filename = "__base__/graphics/entity/distractor-robot/distractor-robot-mask.png",
          priority = "high",
          line_length = 16,
          width = 24,
          height = 21,
          frame_count = 1,
          direction_count = 16,
          shift = {0, -0.203125},
          apply_runtime_tint = true,
          y = 21
        }
      }
    },
    shadow_in_motion =
    {
      filename = "__base__/graphics/entity/distractor-robot/distractor-robot-shadow.png",
      priority = "high",
      line_length = 16,
      width = 40,
      height = 25,
      frame_count = 1,
      direction_count = 16,
      shift = {0.9375, 0.609375}
    }
  },
  {
    type = "combat-robot",
    name = "defender",
    icon = "__base__/graphics/icons/defender.png",
    flags = {"placeable-player", "player-creation", "placeable-off-grid", "not-on-map", "not-repairable"},
    resistances = { { type = "fire", percent = 95 } },
    subgroup="capsule",
    order="e-a-a",
    max_health = 60,
    alert_when_damaged = false,
    collision_box = {{0, 0}, {0, 0}},
    selection_box = {{-0.5, -1.5}, {0.5, -0.5}},
    distance_per_frame = 0.13,
    time_to_live = 60 * 45,
    follows_player = true,
    friction = 0.01,
    range_from_player = 6.0,
    speed = 0.01,
    destroy_action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        source_effects =
        {
            type = "create-entity",
            entity_name = "explosion"
        }
      }
    },
    attack_parameters =
    {
      type = "projectile",
      ammo_category = "bullet",
      cooldown = 20,
      projectile_center = {0, 1},
      projectile_creation_distance = 0.6,
      range = 15,
      sound = make_light_gunshot_sounds(),
      ammo_type =
      {
        category = "bullet",
        action =
        {
          type = "direct",
          action_delivery =
          {
            type = "instant",
            source_effects =
            {
              type = "create-explosion",
              entity_name = "explosion-gunshot-small"
            },
            target_effects =
            {
              {
                type = "create-entity",
                entity_name = "explosion-hit"
              },
              {
                type = "damage",
                damage = { amount = 5 , type = "physical"}
              }
            }
          }
        }
      }
    },
    idle =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/defender-robot/defender-robot.png",
          priority = "high",
          line_length = 16,
          width = 32,
          height = 33,
          frame_count = 1,
          direction_count = 16,
          shift = {0, 0.015625}
        },
        {
          filename = "__base__/graphics/entity/defender-robot/defender-robot-mask.png",
          priority = "high",
          line_length = 16,
          width = 18,
          height = 16,
          frame_count = 1,
          direction_count = 16,
          shift = {0, -0.125},
          apply_runtime_tint = true
        },
      }
    },
    shadow_idle =
    {
      filename = "__base__/graphics/entity/defender-robot/defender-robot-shadow.png",
      priority = "high",
      line_length = 16,
      width = 43,
      height = 23,
      frame_count = 1,
      direction_count = 16,
      shift = {0.859375, 0.609375}
    },
    in_motion =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/defender-robot/defender-robot.png",
          priority = "high",
          line_length = 16,
          width = 32,
          height = 33,
          frame_count = 1,
          direction_count = 16,
          shift = {0, 0.015625},
          y = 33
        },
        {
          filename = "__base__/graphics/entity/defender-robot/defender-robot-mask.png",
          priority = "high",
          line_length = 16,
          width = 18,
          height = 16,
          frame_count = 1,
          direction_count = 16,
          shift = {0, -0.125},
          apply_runtime_tint = true,
          y = 16
        },
      }
    },
    shadow_in_motion =
    {
      filename = "__base__/graphics/entity/defender-robot/defender-robot-shadow.png",
      priority = "high",
      line_length = 16,
      width = 43,
      height = 23,
      frame_count = 1,
      direction_count = 16,
      shift = {0.859375, 0.609375}
    }
  },

  {
    type = "combat-robot",
    name = "destroyer",
    icon = "__base__/graphics/icons/destroyer.png",
    flags = {"placeable-player", "player-creation", "placeable-off-grid", "not-on-map", "not-repairable"},
    resistances = { { type = "fire", percent = 95 } },
    subgroup="capsule",
    order="e-a-c",
    max_health = 60,
    alert_when_damaged = false,
    collision_box = {{0, 0}, {0, 0}},
    selection_box = {{-0.5, -1.5}, {0.5, -0.5}},
    distance_per_frame = 0.13,
    time_to_live = 60 * 60 * 2,
    speed = 0.01,
    follows_player = true,
    friction = 0.01,
    range_from_player = 6.0,
    destroy_action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        source_effects =
        {
            type = "create-entity",
            entity_name = "explosion"
        }
      }
    },
    attack_parameters =
    {
      type = "beam",
      ammo_category = "combat-robot-beam",
      cooldown = 20,
      range = 15,
      ammo_type =
      {
        category = "combat-robot-beam",
        action =
        {
          type = "direct",
          action_delivery =
          {
            type = "beam",
            beam = "electric-beam",
            max_length = 15,
            duration = 20,
            source_offset = {0.15, -0.5},
          }
        }
      }
    },
    idle =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/destroyer-robot/destroyer-robot.png",
          priority = "high",
          line_length = 32,
          width = 45,
          height = 39,
          y = 39,
          frame_count = 1,
          direction_count = 32,
          shift = {0.078125, -0.546875},
        },
        {
          filename = "__base__/graphics/entity/destroyer-robot/destroyer-robot-mask.png",
          priority = "high",
          line_length = 32,
          width = 27,
          height = 21,
          y = 21,
          frame_count = 1,
          direction_count = 32,
          shift = {0.078125, -0.734375},
          apply_runtime_tint = true
        },
      }
    },
    shadow_idle =
    {
      filename = "__base__/graphics/entity/destroyer-robot/destroyer-robot-shadow.png",
      priority = "high",
      line_length = 32,
      width = 48,
      height = 32,
      frame_count = 1,
      direction_count = 32,
      shift = {0.78125, 0}
    },
    in_motion =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/destroyer-robot/destroyer-robot.png",
          priority = "high",
          line_length = 32,
          width = 45,
          height = 39,
          frame_count = 1,
          direction_count = 32,
          shift = {0.078125, -0.546875}
        },
        {
          filename = "__base__/graphics/entity/destroyer-robot/destroyer-robot-mask.png",
          priority = "high",
          line_length = 32,
          width = 27,
          height = 21,
          frame_count = 1,
          direction_count = 32,
          shift = {0.078125, -0.734375},
          apply_runtime_tint = true
        }
      }
    },
    shadow_in_motion =
    {
      filename = "__base__/graphics/entity/destroyer-robot/destroyer-robot-shadow.png",
      priority = "high",
      line_length = 32,
      width = 48,
      height = 32,
      frame_count = 1,
      direction_count = 32,
      shift = {0.78125, 0}
    }
  },
  {
    type = "sticker",
    name = "slowdown-sticker",
    --icon = "__base__/graphics/icons/slowdown-sticker.png",
    flags = {},
    animation =
    {
      filename = "__base__/graphics/entity/slowdown-sticker/slowdown-sticker.png",
      priority = "extra-high",
      width = 11,
      height = 11,
      frame_count = 13,
      animation_speed = 0.4
    },
    duration_in_ticks = 30 * 60,
    target_movement_modifier = 0.5
  },
  {
    type = "sticker",
    name = "stun-sticker",
    flags = {"not-on-map"},
    duration_in_ticks = 3*60,
    target_movement_modifier = 0
  },

  {
    type = "assembling-machine",
    name = "oil-refinery",
    icon = "__base__/graphics/icons/oil-refinery.png",
    flags = {"placeable-neutral","player-creation"},
    minable = {mining_time = 1, result = "oil-refinery"},
    max_health = 350,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-2.4, -2.4}, {2.4, 2.4}},
    selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
    module_specification =
    {
      module_slots = 3
    },
    scale_entity_info_icon = true,
    allowed_effects = {"consumption", "speed", "productivity", "pollution"},
    crafting_categories = {"oil-processing"},
    crafting_speed = 1,
    has_backer_name = true,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions = 0.03 / 3.5
    },
    energy_usage = "420kW",
    ingredient_count = 4,


    animation = make_4way_animation_from_spritesheet({ layers =
    {
      {
        filename = "__base__/graphics/entity/oil-refinery/oil-refinery.png",
        width = 337,
        height = 255,
        frame_count = 1,
        shift = {2.515625, 0.484375},
        hr_version = {
          filename = "__base__/graphics/entity/oil-refinery/hr-oil-refinery.png",
          width = 386,
          height = 430,
          frame_count = 1,
          shift = util.by_pixel(0, -7.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/oil-refinery/oil-refinery-shadow.png",
        width = 337,
        height = 213,
        frame_count = 1,
        shift = util.by_pixel(82.5, 26.5),
        draw_as_shadow = true,
        hr_version = {
          filename = "__base__/graphics/entity/oil-refinery/hr-oil-refinery-shadow.png",
          width = 674,
          height = 426,
          frame_count = 1,
          shift = util.by_pixel(82.5, 26.5),
          draw_as_shadow = true,
          scale = 0.5
        }
      }
    }}),






    working_visualisations =
    {
      {
        north_position = util.by_pixel(34, -65),
        east_position = util.by_pixel(-52, -61),
        south_position = util.by_pixel(-59, -82),
        west_position = util.by_pixel(57, -58),
        animation =
        {
          filename = "__base__/graphics/entity/oil-refinery/oil-refinery-fire.png",
          line_length = 10,
          width = 20,
          height = 40,
          frame_count = 60,
          animation_speed = 0.75,
          shift = util.by_pixel(0, -14),
          hr_version = {
            filename = "__base__/graphics/entity/oil-refinery/hr-oil-refinery-fire.png",
            line_length = 10,
            width = 40,
            height = 81,
            frame_count = 60,
            animation_speed = 0.75,
            scale = 0.5,
            shift = util.by_pixel(0, -14.25),
          },
        },
        light = {intensity = 0.4, size = 6, color = {r = 1.0, g = 1.0, b = 1.0}}
      }
    },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      sound = { filename = "__base__/sound/oil-refinery.ogg" },
      idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.6 },
      apparent_volume = 2.5,
    },
    fluid_boxes =
    {
      {
        production_type = "input",
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = -1,
        pipe_connections = {{ type="input", position = {-1, 3} }}
      },
      {
        production_type = "input",
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = -1,
        pipe_connections = {{ type="input", position = {1, 3} }}
      },
      {
        production_type = "output",
        pipe_covers = pipecoverspictures(),
        base_level = 1,
        pipe_connections = {{ position = {-2, -3} }}
      },
      {
        production_type = "output",
        pipe_covers = pipecoverspictures(),
        base_level = 1,
        pipe_connections = {{ position = {0, -3} }}
      },
      {
        production_type = "output",
        pipe_covers = pipecoverspictures(),
        base_level = 1,
        pipe_connections = {{ position = {2, -3} }}
      }
    },
    pipe_covers = pipecoverspictures()
  },

  {
    type = "assembling-machine",
    name = "chemical-plant",
    icon = "__base__/graphics/icons/chemical-plant.png",
    flags = {"placeable-neutral","placeable-player", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "chemical-plant"},
    max_health = 300,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    module_specification =
    {
      module_slots = 3
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution"},

    animation = make_4way_animation_from_spritesheet({ layers =
    {
      {
        filename = "__base__/graphics/entity/chemical-plant/chemical-plant.png",
        width = 122,
        height = 134,
        frame_count = 1,
        shift = util.by_pixel(-5, -4.5),
        hr_version = {
          filename = "__base__/graphics/entity/chemical-plant/hr-chemical-plant.png",
          width = 244,
          height = 268,
          frame_count = 1,
          shift = util.by_pixel(-5, -4.5),
          scale = 0.5
          }
      },
      {
        filename = "__base__/graphics/entity/chemical-plant/chemical-plant-shadow.png",
        width = 175,
        height = 110,
        frame_count = 1,
        shift = util.by_pixel(31.5, 11),
        draw_as_shadow = true,
        hr_version = {
          filename = "__base__/graphics/entity/chemical-plant/hr-chemical-plant-shadow.png",
          width = 350,
          height = 219,
          frame_count = 1,
          shift = util.by_pixel(31.5, 10.75),
          draw_as_shadow = true,
          scale = 0.5
          }
      },
    }}),
    working_visualisations =
    {
      {
        north_position = util.by_pixel(30, -24),
        west_position = util.by_pixel(1, -49.5),
        south_position = util.by_pixel(-30, -48),
        east_position = util.by_pixel(-11, -1),
        apply_recipe_tint = "primary",
        animation =
        {
          filename = "__base__/graphics/entity/chemical-plant/boiling-green-patch.png",
          frame_count = 32,
          width = 15,
          height = 10,
          animation_speed = 0.5,
          hr_version = {
            filename = "__base__/graphics/entity/chemical-plant/hr-boiling-green-patch.png",
            frame_count = 32,
            width = 30,
            height = 20,
            animation_speed = 0.5,
            scale = 0.5
          }
        }
      },

      {
        north_position = util.by_pixel(30, -24),
        west_position = util.by_pixel(1, -49.5),
        south_position = util.by_pixel(-30, -48),
        east_position = util.by_pixel(-11, -1),
        apply_recipe_tint = "secondary",
        animation =
        {
          filename = "__base__/graphics/entity/chemical-plant/boiling-green-patch-mask.png",
          frame_count = 32,
          width = 15,
          height = 10,
          animation_speed = 0.5,
          hr_version = {
            filename = "__base__/graphics/entity/chemical-plant/hr-boiling-green-patch-mask.png",
            frame_count = 32,
            width = 30,
            height = 20,
            animation_speed = 0.5,
            scale = 0.5
          }
        }
      },


      {
        apply_recipe_tint = "tertiary",
        north_position = {0, 0},
        west_position = {0, 0},
        south_position = {0, 0},
        east_position = {0, 0},
        north_animation =
        {
          filename = "__base__/graphics/entity/chemical-plant/boiling-window-green-patch.png",
          frame_count = 1,
          width = 87,
          height = 60,
          shift = util.by_pixel(0, -5),
          hr_version = {
            filename = "__base__/graphics/entity/chemical-plant/hr-boiling-window-green-patch.png",
            x = 0,
            frame_count = 1,
            width = 174,
            height = 119,
            shift = util.by_pixel(0, -5.25),
            scale = 0.5
          }
        },
        east_animation =
        {
          filename = "__base__/graphics/entity/chemical-plant/boiling-window-green-patch.png",
          x = 87,
          frame_count = 1,
          width = 87,
          height = 60,
          shift = util.by_pixel(0, -5),
          hr_version = {
            filename = "__base__/graphics/entity/chemical-plant/hr-boiling-window-green-patch.png",
            x = 174,
            frame_count = 1,
            width = 174,
            height = 119,
            shift = util.by_pixel(0, -5.25),
            scale = 0.5
          }
        },
        south_animation =
        {
          filename = "__base__/graphics/entity/chemical-plant/boiling-window-green-patch.png",
          x = 174,
          frame_count = 1,
          width = 87,
          height = 60,
          shift = util.by_pixel(0, -5),
          hr_version = {
            filename = "__base__/graphics/entity/chemical-plant/hr-boiling-window-green-patch.png",
            x = 348,
            frame_count = 1,
            width = 174,
            height = 119,
            shift = util.by_pixel(0, -5.25),
            scale = 0.5
          }
        }
      }
    },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      sound =
      {
        {
          filename = "__base__/sound/chemical-plant.ogg",
          volume = 0.8
        }
      },
      idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.6 },
      apparent_volume = 1.5,
    },
    crafting_speed = 1.25,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions = 0.03 / 3.5
    },
    energy_usage = "210kW",
    ingredient_count = 4,
    crafting_categories = {"chemistry"},
    fluid_boxes =
    {
      {
        production_type = "input",
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = -1,
        pipe_connections = {{ type="input", position = {-1, -2} }}
      },
      {
        production_type = "input",
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = -1,
        pipe_connections = {{ type="input", position = {1, -2} }}
      },
      {
        production_type = "output",
        pipe_covers = pipecoverspictures(),
        base_level = 1,
        pipe_connections = {{ position = {-1, 2} }}
      },
      {
        production_type = "output",
        pipe_covers = pipecoverspictures(),
        base_level = 1,
        pipe_connections = {{ position = {1, 2} }}
      }
    }
  },
  {
    type = "arithmetic-combinator",
    name = "arithmetic-combinator",
    icon = "__base__/graphics/icons/arithmetic-combinator.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "arithmetic-combinator"},
    max_health = 150,
    corpse = "small-remnants",
    collision_box = {{-0.35, -0.65}, {0.35, 0.65}},
    selection_box = {{-0.5, -1}, {0.5, 1}},

    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input"
    },
    active_energy_usage = "1KW",

    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/combinator.ogg",
        volume = 0.35,
      },
      max_sounds_per_type = 2,
      match_speed_to_activity = true,
    },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },

    sprites =
    {
      north =
      {
        filename = "__base__/graphics/entity/combinator/combinator-entities.png",
        x = 158,
        width = 79,
        height = 63,
        frame_count = 1,
        shift = {0.140625, 0.140625},
      },
      east =
      {
        filename = "__base__/graphics/entity/combinator/combinator-entities.png",
        width = 79,
        height = 63,
        frame_count = 1,
        shift = {0.140625, 0.140625},
      },
      south =
      {
        filename = "__base__/graphics/entity/combinator/combinator-entities.png",
        x = 237,
        width = 79,
        height = 63,
        frame_count = 1,
        shift = {0.140625, 0.140625},
      },
      west =
      {
        filename = "__base__/graphics/entity/combinator/combinator-entities.png",
        x = 79,
        width = 79,
        height = 63,
        frame_count = 1,
        shift = {0.140625, 0.140625},
      }
    },

    activity_led_sprites =
    {
      north =
      {
        filename = "__base__/graphics/entity/combinator/activity-leds/combinator-led-arithmetic-north.png",
        width = 11,
        height = 11,
        frame_count = 1,
        shift = {0.234375, -0.484375},
      },
      east =
      {
        filename = "__base__/graphics/entity/combinator/activity-leds/combinator-led-arithmetic-east.png",
        width = 10,
        height = 10,
        frame_count = 1,
        shift = {0.5, 0},
      },
      south =
      {
        filename = "__base__/graphics/entity/combinator/activity-leds/combinator-led-arithmetic-south.png",
        width = 13,
        height = 11,
        frame_count = 1,
        shift = {-0.265625, 0.140625},
      },
      west =
      {
        filename = "__base__/graphics/entity/combinator/activity-leds/combinator-led-arithmetic-west.png",
        width = 13,
        height = 11,
        frame_count = 1,
        shift = {-0.453125, -0.359375},
      }
    },

    activity_led_light =
    {
      intensity = 0.8,
      size = 1,
      color = {r = 1.0, g = 1.0, b = 1.0}
    },

    activity_led_light_offsets =
    {
      {0.234375, -0.484375},
      {0.5, 0},
      {-0.265625, 0.140625},
      {-0.453125, -0.359375}
    },

    screen_light =
    {
      intensity = 0.3,
      size = 0.6,
      color = {r = 1.0, g = 1.0, b = 1.0}
    },

    screen_light_offsets =
    {
      {0.015625, -0.234375},
      {0.015625, -0.296875},
      {0.015625, -0.234375},
      {0.015625, -0.296875}
    },

    plus_symbol_sprites =
    {
      north =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 15,
        width = 15,
        height = 11,
        frame_count = 1,
        shift = {0.015625, -0.234375},
        hr_version = {
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 30,
          width = 30,
          height = 22,
          frame_count = 1,
          shift = {0.015625, -0.234375},
          scale = 0.5
        }
      },
      east =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 15,
        width = 15,
        height = 11,
        frame_count = 1,
        shift = {0.015625, -0.296875},
        hr_version = {
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 30,
          width = 30,
          height = 22,
          frame_count = 1,
          shift = {0.015625, -0.296875},
          scale = 0.5
        }
      },
      south =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 15,
        width = 15,
        height = 11,
        frame_count = 1,
        shift = {0.015625, -0.234375},
        hr_version = {
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 30,
          width = 30,
          height = 22,
          frame_count = 1,
          shift = {0.015625, -0.234375},
          scale = 0.5
        }
      },
      west =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 15,
        width = 15,
        height = 11,
        frame_count = 1,
        shift = {0.015625, -0.296875},
        hr_version = {
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 30,
          width = 30,
          height = 22,
          frame_count = 1,
          shift = {0.015625, -0.296875},
          scale = 0.5
        }
      }
    },
    minus_symbol_sprites =
    {
      north =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 30,
        width = 15,
        height = 11,
        frame_count = 1,
        shift = {0.015625, -0.234375},
        hr_version = {
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 60,
          width = 30,
          height = 22,
          frame_count = 1,
          shift = {0.015625, -0.234375},
          scale = 0.5
        }
      },
      east =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 30,
        width = 15,
        height = 11,
        frame_count = 1,
        shift = {0.015625, -0.296875},
        hr_version = {
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 60,
          width = 30,
          height = 22,
          frame_count = 1,
          shift = {0.015625, -0.296875},
          scale = 0.5
        }
      },
      south =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 30,
        width = 15,
        height = 11,
        frame_count = 1,
        shift = {0.015625, -0.234375},
        hr_version = {
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 60,
          width = 30,
          height = 22,
          frame_count = 1,
          shift = {0.015625, -0.234375},
          scale = 0.5
        }
      },
      west =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 30,
        width = 15,
        height = 11,
        frame_count = 1,
        shift = {0.015625, -0.296875},
        hr_version = {
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 60,
          width = 30,
          height = 22,
          frame_count = 1,
          shift = {0.015625, -0.296875},
          scale = 0.5
        }
      }
    },
    multiply_symbol_sprites =
    {
      north =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 45,
        width = 15,
        height = 11,
        frame_count = 1,
        shift = {0.015625, -0.234375},
        hr_version = {
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 90,
          width = 30,
          height = 22,
          frame_count = 1,
          shift = {0.015625, -0.234375},
          scale = 0.5
        }
      },
      east =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 45,
        width = 15,
        height = 11,
        frame_count = 1,
        shift = {0.015625, -0.296875},
        hr_version = {
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 90,
          width = 30,
          height = 22,
          frame_count = 1,
          shift = {0.015625, -0.296875},
          scale = 0.5
        }
      },
      south =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 45,
        width = 15,
        height = 11,
        frame_count = 1,
        shift = {0.015625, -0.234375},
        hr_version = {
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 90,
          width = 30,
          height = 22,
          frame_count = 1,
          shift = {0.015625, -0.234375},
          scale = 0.5
        }
      },
      west =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 45,
        width = 15,
        height = 11,
        frame_count = 1,
        shift = {0.015625, -0.296875},
        hr_version = {
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 90,
          width = 30,
          height = 22,
          frame_count = 1,
          shift = {0.015625, -0.296875},
          scale = 0.5
        }
      }
    },
    divide_symbol_sprites =
    {
      north =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 60,
        width = 15,
        height = 11,
        frame_count = 1,
        shift = {0.015625, -0.234375},
        hr_version = {
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 120,
          width = 30,
          height = 22,
          frame_count = 1,
          shift = {0.015625, -0.234375},
          scale = 0.5
        }
      },
      east =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 60,
        width = 15,
        height = 11,
        frame_count = 1,
        shift = {0.015625, -0.296875},
        hr_version = {
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 120,
          width = 30,
          height = 22,
          frame_count = 1,
          shift = {0.015625, -0.296875},
          scale = 0.5
        }
      },
      south =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 60,
        width = 15,
        height = 11,
        frame_count = 1,
        shift = {0.015625, -0.234375},
        hr_version = {
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 120,
          width = 30,
          height = 22,
          frame_count = 1,
          shift = {0.015625, -0.234375},
          scale = 0.5
        }
      },
      west =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 60,
        width = 15,
        height = 11,
        frame_count = 1,
        shift = {0.015625, -0.296875},
        hr_version = {
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 120,
          width = 30,
          height = 22,
          frame_count = 1,
          shift = {0.015625, -0.296875},
          scale = 0.5
        }
      }
    },
    modulo_symbol_sprites =
    {
      north =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 75,
        width = 15,
        height = 11,
        frame_count = 1,
        shift = {0.015625, -0.234375},
        hr_version = {
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 150,
          width = 30,
          height = 22,
          frame_count = 1,
          shift = {0.015625, -0.234375},
          scale = 0.5
        }
      },
      east =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 75,
        width = 15,
        height = 11,
        frame_count = 1,
        shift = {0.015625, -0.296875},
        hr_version = {
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 150,
          width = 30,
          height = 22,
          frame_count = 1,
          shift = {0.015625, -0.296875},
          scale = 0.5
        }
      },
      south =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 75,
        width = 15,
        height = 11,
        frame_count = 1,
        shift = {0.015625, -0.234375},
        hr_version = {
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 150,
          width = 30,
          height = 22,
          frame_count = 1,
          shift = {0.015625, -0.234375},
          scale = 0.5
        }
      },
      west =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 75,
        width = 15,
        height = 11,
        frame_count = 1,
        shift = {0.015625, -0.296875},
        hr_version = {
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 150,
          width = 30,
          height = 22,
          frame_count = 1,
          shift = {0.015625, -0.296875},
          scale = 0.5
        }
      }
    },
    power_symbol_sprites =
    {
      north =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 0,
        y = 11,
        width = 15,
        height = 11,
        frame_count = 1,
        shift = {0.015625, -0.234375},
        hr_version = {
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 0,
          y = 22,
          width = 30,
          height = 22,
          frame_count = 1,
          shift = {0.015625, -0.234375},
          scale = 0.5
        }
      },
      east =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 0,
        y = 11,
        width = 15,
        height = 11,
        frame_count = 1,
        shift = {0.015625, -0.296875},
        hr_version = {
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 0,
          y = 22,
          width = 30,
          height = 22,
          frame_count = 1,
          shift = {0.015625, -0.296875},
          scale = 0.5
        }
      },
      south =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 0,
        y = 11,
        width = 15,
        height = 11,
        frame_count = 1,
        shift = {0.015625, -0.234375},
        hr_version = {
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 0,
          y = 22,
          width = 30,
          height = 22,
          frame_count = 1,
          shift = {0.015625, -0.234375},
          scale = 0.5
        }
      },
      west =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 0,
        y = 11,
        width = 15,
        height = 11,
        frame_count = 1,
        shift = {0.015625, -0.296875},
        hr_version = {
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 0,
          y = 22,
          width = 30,
          height = 22,
          frame_count = 1,
          shift = {0.015625, -0.296875},
          scale = 0.5
        }
      }
    },
    left_shift_symbol_sprites =
    {
      north =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 15,
        y = 11,
        width = 15,
        height = 11,
        frame_count = 1,
        shift = {0.015625, -0.234375},
        hr_version = {
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 30,
          y = 22,
          width = 30,
          height = 22,
          frame_count = 1,
          shift = {0.015625, -0.234375},
          scale = 0.5
        }
      },
      east =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 15,
        y = 11,
        width = 15,
        height = 11,
        frame_count = 1,
        shift = {0.015625, -0.296875},
        hr_version = {
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 30,
          y = 22,
          width = 30,
          height = 22,
          frame_count = 1,
          shift = {0.015625, -0.296875},
          scale = 0.5
        }
      },
      south =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 15,
        y = 11,
        width = 15,
        height = 11,
        frame_count = 1,
        shift = {0.015625, -0.234375},
        hr_version = {
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 30,
          y = 22,
          width = 30,
          height = 22,
          frame_count = 1,
          shift = {0.015625, -0.234375},
          scale = 0.5
        }
      },
      west =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 15,
        y = 11,
        width = 15,
        height = 11,
        frame_count = 1,
        shift = {0.015625, -0.296875},
        hr_version = {
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 30,
          y = 22,
          width = 30,
          height = 22,
          frame_count = 1,
          shift = {0.015625, -0.296875},
          scale = 0.5
        }
      }
    },
    right_shift_symbol_sprites =
    {
      north =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 30,
        y = 11,
        width = 15,
        height = 11,
        frame_count = 1,
        shift = {0.015625, -0.234375},
        hr_version = {
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 60,
          y = 22,
          width = 30,
          height = 22,
          frame_count = 1,
          shift = {0.015625, -0.234375},
          scale = 0.5
        }
      },
      east =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 30,
        y = 11,
        width = 15,
        height = 11,
        frame_count = 1,
        shift = {0.015625, -0.296875},
        hr_version = {
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 60,
          y = 22,
          width = 30,
          height = 22,
          frame_count = 1,
          shift = {0.015625, -0.296875},
          scale = 0.5
        }
      },
      south =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 30,
        y = 11,
        width = 15,
        height = 11,
        frame_count = 1,
        shift = {0.015625, -0.234375},
        hr_version = {
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 60,
          y = 22,
          width = 30,
          height = 22,
          frame_count = 1,
          shift = {0.015625, -0.234375},
          scale = 0.5
        }
      },
      west =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 30,
        y = 11,
        width = 15,
        height = 11,
        frame_count = 1,
        shift = {0.015625, -0.296875},
        hr_version = {
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 60,
          y = 22,
          width = 30,
          height = 22,
          frame_count = 1,
          shift = {0.015625, -0.296875},
          scale = 0.5
        }
      }
    },
    and_symbol_sprites =
    {
      north =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 45,
        y = 11,
        width = 15,
        height = 11,
        frame_count = 1,
        shift = {0.015625, -0.234375},
        hr_version = {
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 90,
          y = 22,
          width = 30,
          height = 22,
          frame_count = 1,
          shift = {0.015625, -0.234375},
          scale = 0.5
        }
      },
      east =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 45,
        y = 11,
        width = 15,
        height = 11,
        frame_count = 1,
        shift = {0.015625, -0.296875},
        hr_version = {
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 90,
          y = 22,
          width = 30,
          height = 22,
          frame_count = 1,
          shift = {0.015625, -0.296875},
          scale = 0.5
        }
      },
      south =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 45,
        y = 11,
        width = 15,
        height = 11,
        frame_count = 1,
        shift = {0.015625, -0.234375},
        hr_version = {
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 90,
          y = 22,
          width = 30,
          height = 22,
          frame_count = 1,
          shift = {0.015625, -0.234375},
          scale = 0.5
        }
      },
      west =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 45,
        y = 11,
        width = 15,
        height = 11,
        frame_count = 1,
        shift = {0.015625, -0.296875},
        hr_version = {
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 90,
          y = 22,
          width = 30,
          height = 22,
          frame_count = 1,
          shift = {0.015625, -0.296875},
          scale = 0.5
        }
      }
    },
    or_symbol_sprites =
    {
      north =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 60,
        y = 11,
        width = 15,
        height = 11,
        frame_count = 1,
        shift = {0.015625, -0.234375},
        hr_version = {
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 120,
          y = 22,
          width = 30,
          height = 22,
          frame_count = 1,
          shift = {0.015625, -0.234375},
          scale = 0.5
        }
      },
      east =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 60,
        y = 11,
        width = 15,
        height = 11,
        frame_count = 1,
        shift = {0.015625, -0.296875},
        hr_version = {
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 120,
          y = 22,
          width = 30,
          height = 22,
          frame_count = 1,
          shift = {0.015625, -0.296875},
          scale = 0.5
        }
      },
      south =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 60,
        y = 11,
        width = 15,
        height = 11,
        frame_count = 1,
        shift = {0.015625, -0.234375},
        hr_version = {
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 120,
          y = 22,
          width = 30,
          height = 22,
          frame_count = 1,
          shift = {0.015625, -0.234375},
          scale = 0.5
        }
      },
      west =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 60,
        y = 11,
        width = 15,
        height = 11,
        frame_count = 1,
        shift = {0.015625, -0.296875},
        hr_version = {
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 120,
          y = 22,
          width = 30,
          height = 22,
          frame_count = 1,
          shift = {0.015625, -0.296875},
          scale = 0.5
        }
      }
    },
    xor_symbol_sprites =
    {
      north =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 75,
        y = 11,
        width = 15,
        height = 11,
        frame_count = 1,
        shift = {0.015625, -0.234375},
        hr_version = {
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 150,
          y = 22,
          width = 30,
          height = 22,
          frame_count = 1,
          shift = {0.015625, -0.234375},
          scale = 0.5
        }
      },
      east =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 75,
        y = 11,
        width = 15,
        height = 11,
        frame_count = 1,
        shift = {0.015625, -0.296875},
        hr_version = {
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 150,
          y = 22,
          width = 30,
          height = 22,
          frame_count = 1,
          shift = {0.015625, -0.296875},
          scale = 0.5
        }
      },
      south =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 75,
        y = 11,
        width = 15,
        height = 11,
        frame_count = 1,
        shift = {0.015625, -0.234375},
        hr_version = {
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 150,
          y = 22,
          width = 30,
          height = 22,
          frame_count = 1,
          shift = {0.015625, -0.234375},
          scale = 0.5
        }
      },
      west =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 75,
        y = 11,
        width = 15,
        height = 11,
        frame_count = 1,
        shift = {0.015625, -0.296875},
        hr_version = {
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 150,
          y = 22,
          width = 30,
          height = 22,
          frame_count = 1,
          shift = {0.015625, -0.296875},
          scale = 0.5
        }
      }
    },

    input_connection_bounding_box = {{-0.5, 0}, {0.5, 1}},
    output_connection_bounding_box = {{-0.5, -1}, {0.5, 0}},
    input_connection_points =
    {
      {
        shadow =
        {
          red = {0.171875, 0.703125},
          green = {0.765625, 0.703125}
        },
        wire =
        {
          red = {-0.28125, 0.34375},
          green = {0.28125, 0.34375},
        }
      },
      {
        shadow =
        {
          red = {-0.328125, -0.078125},
          green = {-0.328125, 0.328125},
        },
        wire =
        {
          red = {-0.78125, -0.4375},
          green = {-0.78125, -0.03125},
        }
      },
      {
        shadow =
        {
          red = {0.734375, -0.453125},
          green = {0.171875, -0.453125}
        },
        wire =
        {
          red = {0.25, -0.78125},
          green = {-0.3125, -0.78125}
        }
      },
      {
        shadow =
        {
          red = {1.20313, 0.359375},
          green = {1.20313, -0.046875},
        },
        wire =
        {
          red = {0.78125, 0},
          green = {0.78125, -0.4375},
        }
      }
    },

    output_connection_points =
    {
      {
        shadow =
        {
          red = {0.140625, -0.453125},
          green = {0.734375, -0.453125},
        },
        wire =
        {
          red = {-0.3125, -0.78125},
          green = {0.28125, -0.78125}
        }
      },
      {
        shadow =
        {
          red = {1.17188, -0.078125},
          green = {1.17188, 0.328125},
        },
        wire =
        {
          red = {0.6875, -0.375},
          green = {0.6875, 0.0625},
        }
      },
      {
        shadow =
        {
          red = {0.703125, 0.671875},
          green = {0.109375, 0.671875},
        },
        wire =
        {
          red = {0.28125, 0.375},
          green = {-0.3125, 0.375},
        }
      },
      {
        shadow =
        {
          red = {-0.265625, 0.328125},
          green = {-0.265625, -0.078125},
        },
        wire =
        {
          red = {-0.71875, 0.03125},
          green = {-0.71875, -0.34375},
        }
      }
    },
    circuit_wire_max_distance = 9
  },
  {
    type = "decider-combinator",
    name = "decider-combinator",
    icon = "__base__/graphics/icons/decider-combinator.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "decider-combinator"},
    max_health = 150,
    corpse = "small-remnants",
    collision_box = {{-0.35, -0.65}, {0.35, 0.65}},
    selection_box = {{-0.5, -1}, {0.5, 1}},

    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input"
    },
    active_energy_usage = "1KW",

    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/combinator.ogg",
        volume = 0.35,
      },
      max_sounds_per_type = 2,
      match_speed_to_activity = true,
    },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },

    sprites =
    {
      north =
      {
        filename = "__base__/graphics/entity/combinator/combinator-entities.png",
        x = 158,
        y = 63,
        width = 79,
        height = 63,
        frame_count = 1,
        shift = {0.140625, 0.140625},
      },
      east =
      {
        filename = "__base__/graphics/entity/combinator/combinator-entities.png",
        y = 63,
        width = 79,
        height = 63,
        frame_count = 1,
        shift = {0.140625, 0.140625},
      },
      south =
      {
        filename = "__base__/graphics/entity/combinator/combinator-entities.png",
        x = 237,
        y = 63,
        width = 79,
        height = 63,
        frame_count = 1,
        shift = {0.140625, 0.140625},
      },
      west =
      {
        filename = "__base__/graphics/entity/combinator/combinator-entities.png",
        x = 79,
        y = 63,
        width = 79,
        height = 63,
        frame_count = 1,
        shift = {0.140625, 0.140625},
      }
    },

    activity_led_sprites =
    {
      north =
      {
        filename = "__base__/graphics/entity/combinator/activity-leds/combinator-led-decider-north.png",
        width = 11,
        height = 12,
        frame_count = 1,
        shift = {0.265625, -0.53125},
      },
      east =
      {
        filename = "__base__/graphics/entity/combinator/activity-leds/combinator-led-decider-east.png",
        width = 11,
        height = 11,
        frame_count = 1,
        shift = {0.515625, -0.078125},
      },
      south =
      {
        filename = "__base__/graphics/entity/combinator/activity-leds/combinator-led-decider-south.png",
        width = 12,
        height = 12,
        frame_count = 1,
        shift = {-0.25, 0.03125},
      },
      west =
      {
        filename = "__base__/graphics/entity/combinator/activity-leds/combinator-led-decider-west.png",
        width = 12,
        height = 12,
        frame_count = 1,
        shift = {-0.46875, -0.5},
      }
    },

    activity_led_light =
    {
      intensity = 0.8,
      size = 1,
      color = {r = 1.0, g = 1.0, b = 1.0}
    },

    activity_led_light_offsets =
    {
      {0.265625, -0.53125},
      {0.515625, -0.078125},
      {-0.25, 0.03125},
      {-0.46875, -0.5}
    },

    screen_light =
    {
      intensity = 0.3,
      size = 0.6,
      color = {r = 1.0, g = 1.0, b = 1.0}
    },

    screen_light_offsets =
    {
      {0.015625, -0.265625},
      {0.015625, -0.359375},
      {0.015625, -0.265625},
      {0.015625, -0.359375}
    },

    equal_symbol_sprites =
    {
      north =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 30,
        y = 22,
        width = 15,
        height = 11,
        frame_count = 1,
        shift = {0.015625, -0.265625},
        hr_version = {
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 60,
          y = 44,
          width = 30,
          height = 22,
          frame_count = 1,
          shift = {0.015625, -0.265625},
          scale = 0.5
        }
      },
      east =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 30,
        y = 22,
        width = 15,
        height = 11,
        frame_count = 1,
        shift = {0.015625, -0.359375},
        hr_version = {
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 60,
          y = 44,
          width = 30,
          height = 22,
          frame_count = 1,
          shift = {0.015625, -0.359375},
          scale = 0.5
        }
      },
      south =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 30,
        y = 22,
        width = 15,
        height = 11,
        frame_count = 1,
        shift = {0.015625, -0.265625},
        hr_version = {
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 60,
          y = 44,
          width = 30,
          height = 22,
          frame_count = 1,
          shift = {0.015625, -0.265625},
          scale = 0.5
        }
      },
      west =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 30,
        y = 22,
        width = 15,
        height = 11,
        frame_count = 1,
        shift = {0.015625, -0.359375},
        hr_version = {
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 60,
          y = 44,
          width = 30,
          height = 22,
          frame_count = 1,
          shift = {0.015625, -0.359375},
          scale = 0.5
        }
      }
    },
    greater_symbol_sprites =
    {
      north =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 0,
        y = 22,
        width = 15,
        height = 11,
        frame_count = 1,
        shift = {0.015625, -0.265625},
        hr_version = {
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 0,
          y = 44,
          width = 30,
          height = 22,
          frame_count = 1,
          shift = {0.015625, -0.265625},
          scale = 0.5
        }
      },
      east =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 0,
        y = 22,
        width = 15,
        height = 11,
        frame_count = 1,
        shift = {0.015625, -0.359375},
        hr_version = {
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 0,
          y = 44,
          width = 30,
          height = 22,
          frame_count = 1,
          shift = {0.015625, -0.359375},
          scale = 0.5
        }
      },
      south =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 0,
        y = 22,
        width = 15,
        height = 11,
        frame_count = 1,
        shift = {0.015625, -0.265625},
        hr_version = {
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 0,
          y = 44,
          width = 30,
          height = 22,
          frame_count = 1,
          shift = {0.015625, -0.265625},
          scale = 0.5
        }
      },
      west =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 0,
        y = 22,
        width = 15,
        height = 11,
        frame_count = 1,
        shift = {0.015625, -0.359375},
        hr_version = {
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 0,
          y = 44,
          width = 30,
          height = 22,
          frame_count = 1,
          shift = {0.015625, -0.359375},
          scale = 0.5
        }
      }
    },
    less_symbol_sprites =
    {
      north =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 15,
        y = 22,
        width = 15,
        height = 11,
        frame_count = 1,
        shift = {0.015625, -0.265625},
        hr_version = {
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 30,
          y = 44,
          width = 30,
          height = 22,
          frame_count = 1,
          shift = {0.015625, -0.265625},
          scale = 0.5
        }
      },
      east =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 15,
        y = 22,
        width = 15,
        height = 11,
        frame_count = 1,
        shift = {0.015625, -0.359375},
        hr_version = {
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 30,
          y = 44,
          width = 30,
          height = 22,
          frame_count = 1,
          shift = {0.015625, -0.359375},
          scale = 0.5
        }
      },
      south =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 15,
        y = 22,
        width = 15,
        height = 11,
        frame_count = 1,
        shift = {0.015625, -0.265625},
        hr_version = {
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 30,
          y = 44,
          width = 30,
          height = 22,
          frame_count = 1,
          shift = {0.015625, -0.265625},
          scale = 0.5
        }
      },
      west =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 15,
        y = 22,
        width = 15,
        height = 11,
        frame_count = 1,
        shift = {0.015625, -0.359375},
        hr_version = {
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 30,
          y = 44,
          width = 30,
          height = 22,
          frame_count = 1,
          shift = {0.015625, -0.359375},
          scale = 0.5
        }
      }
    },
    not_equal_symbol_sprites =
    {
      north =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 45,
        y = 22,
        width = 15,
        height = 11,
        frame_count = 1,
        shift = {0.015625, -0.265625},
        hr_version = {
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 90,
          y = 44,
          width = 30,
          height = 22,
          frame_count = 1,
          shift = {0.015625, -0.265625},
          scale = 0.5
        }
      },
      east =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 45,
        y = 22,
        width = 15,
        height = 11,
        frame_count = 1,
        shift = {0.015625, -0.359375},
        hr_version = {
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 90,
          y = 44,
          width = 30,
          height = 22,
          frame_count = 1,
          shift = {0.015625, -0.359375},
          scale = 0.5
        }
      },
      south =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 45,
        y = 22,
        width = 15,
        height = 11,
        frame_count = 1,
        shift = {0.015625, -0.265625},
        hr_version = {
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 90,
          y = 44,
          width = 30,
          height = 22,
          frame_count = 1,
          shift = {0.015625, -0.265625},
          scale = 0.5
        }
      },
      west =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 45,
        y = 22,
        width = 15,
        height = 11,
        frame_count = 1,
        shift = {0.015625, -0.359375},
        hr_version = {
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 90,
          y = 44,
          width = 30,
          height = 22,
          frame_count = 1,
          shift = {0.015625, -0.359375},
          scale = 0.5
        }
      }
    },
    greater_or_equal_symbol_sprites =
    {
      north =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 75,
        y = 22,
        width = 15,
        height = 11,
        frame_count = 1,
        shift = {0.015625, -0.265625},
        hr_version = {
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 150,
          y = 44,
          width = 30,
          height = 22,
          frame_count = 1,
          shift = {0.015625, -0.265625},
          scale = 0.5
        }
      },
      east =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 75,
        y = 22,
        width = 15,
        height = 11,
        frame_count = 1,
        shift = {0.015625, -0.359375},
        hr_version = {
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 150,
          y = 44,
          width = 30,
          height = 22,
          frame_count = 1,
          shift = {0.015625, -0.359375},
          scale = 0.5
        }
      },
      south =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 75,
        y = 22,
        width = 15,
        height = 11,
        frame_count = 1,
        shift = {0.015625, -0.265625},
        hr_version = {
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 150,
          y = 44,
          width = 30,
          height = 22,
          frame_count = 1,
          shift = {0.015625, -0.265625},
          scale = 0.5
        }
      },
      west =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 75,
        y = 22,
        width = 15,
        height = 11,
        frame_count = 1,
        shift = {0.015625, -0.359375},
        hr_version = {
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 150,
          y = 44,
          width = 30,
          height = 22,
          frame_count = 1,
          shift = {0.015625, -0.359375},
          scale = 0.5
        }
      }
    },
    less_or_equal_symbol_sprites =
    {
      north =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 60,
        y = 22,
        width = 15,
        height = 11,
        frame_count = 1,
        shift = {0.015625, -0.265625},
        hr_version = {
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 120,
          y = 44,
          width = 30,
          height = 22,
          frame_count = 1,
          shift = {0.015625, -0.265625},
          scale = 0.5
        }
      },
      east =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 60,
        y = 22,
        width = 15,
        height = 11,
        frame_count = 1,
        shift = {0.015625, -0.359375},
        hr_version = {
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 120,
          y = 44,
          width = 30,
          height = 22,
          frame_count = 1,
          shift = {0.015625, -0.359375},
          scale = 0.5
        }
      },
      south =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 60,
        y = 22,
        width = 15,
        height = 11,
        frame_count = 1,
        shift = {0.015625, -0.265625},
        hr_version = {
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 120,
          y = 44,
          width = 30,
          height = 22,
          frame_count = 1,
          shift = {0.015625, -0.265625},
          scale = 0.5
        }
      },
      west =
      {
        filename = "__base__/graphics/entity/combinator/combinator-displays.png",
        x = 60,
        y = 22,
        width = 15,
        height = 11,
        frame_count = 1,
        shift = {0.015625, -0.359375},
        hr_version = {
          filename = "__base__/graphics/entity/combinator/hr-combinator-displays.png",
          x = 120,
          y = 44,
          width = 30,
          height = 22,
          frame_count = 1,
          shift = {0.015625, -0.359375},
          scale = 0.5
        }
      }
    },

    input_connection_bounding_box = {{-0.5, 0}, {0.5, 1}},
    output_connection_bounding_box = {{-0.5, -1}, {0.5, 0}},

    input_connection_points =
    {
      {
        shadow =
        {
          red = {0.328125, 0.703125},
          green = {0.859375, 0.703125}
        },
        wire =
        {
          red = {-0.28125, 0.34375},
          green = {0.25, 0.34375},
        }
      },
      {
        shadow =
        {
          red = {-0.265625, -0.171875},
          green = {-0.296875, 0.296875},
        },
        wire =
        {
          red = {-0.75, -0.5},
          green = {-0.75, -0.0625},
        }
      },
      {
        shadow =
        {
          red = {0.828125, -0.359375},
          green = {0.234375, -0.359375}
        },
        wire =
        {
          red = {0.25, -0.71875},
          green = {-0.28125, -0.71875}
        }
      },
      {
        shadow =
        {
          red = {1.29688, 0.328125},
          green = {1.29688, -0.140625},
        },
        wire =
        {
          red = {0.75, -0.0625},
          green = {0.75, -0.53125},
        }
      }
    },

    output_connection_points =
    {
      {
        shadow =
        {
          red = {0.234375, -0.453125},
          green = {0.828125, -0.453125}
        },
        wire =
        {
          red = {-0.3125, -0.78125},
          green = {0.28125, -0.78125},
        }
      },
      {
        shadow =
        {
          red = {1.17188, -0.109375},
          green = {1.17188, 0.296875},
        },
        wire =
        {
          red = {0.65625, -0.4375},
          green = {0.65625, -0.03125},
        }
      },
      {
        shadow =
        {
          red = {0.828125, 0.765625},
          green = {0.234375, 0.765625}
        },
        wire =
        {
          red = {0.28125, 0.40625},
          green = {-0.3125, 0.40625}
        }
      },
      {
        shadow =
        {
          red = {-0.140625, 0.328125},
          green = {-0.140625, -0.078125},
        },
        wire =
        {
          red = {-0.6875, -0.03125},
          green = {-0.6875, -0.4375},
        }
      }
    },
    circuit_wire_max_distance = 9
  },
  {
    type = "constant-combinator",
    name = "constant-combinator",
    icon = "__base__/graphics/icons/constant-combinator.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "constant-combinator"},
    max_health = 120,
    corpse = "small-remnants",

    collision_box = {{-0.35, -0.35}, {0.35, 0.35}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},

    item_slot_count = 18,

    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    sprites =
    {
      north =
      {
        filename = "__base__/graphics/entity/combinator/combinator-entities.png",
        x = 158,
        y = 126,
        width = 79,
        height = 63,
        frame_count = 1,
        shift = {0.140625, 0.140625},
      },
      east =
      {
        filename = "__base__/graphics/entity/combinator/combinator-entities.png",
        y = 126,
        width = 79,
        height = 63,
        frame_count = 1,
        shift = {0.140625, 0.140625},
      },
      south =
      {
        filename = "__base__/graphics/entity/combinator/combinator-entities.png",
        x = 237,
        y = 126,
        width = 79,
        height = 63,
        frame_count = 1,
        shift = {0.140625, 0.140625},
      },
      west =
      {
        filename = "__base__/graphics/entity/combinator/combinator-entities.png",
        x = 79,
        y = 126,
        width = 79,
        height = 63,
        frame_count = 1,
        shift = {0.140625, 0.140625},
      }
    },

    activity_led_sprites =
    {
      north =
      {
        filename = "__base__/graphics/entity/combinator/activity-leds/combinator-led-constant-north.png",
        width = 11,
        height = 10,
        frame_count = 1,
        shift = {0.296875, -0.40625},
      },
      east =
      {
        filename = "__base__/graphics/entity/combinator/activity-leds/combinator-led-constant-east.png",
        width = 14,
        height = 12,
        frame_count = 1,
        shift = {0.25, -0.03125},
      },
      south =
      {
        filename = "__base__/graphics/entity/combinator/activity-leds/combinator-led-constant-south.png",
        width = 11,
        height = 11,
        frame_count = 1,
        shift = {-0.296875, -0.078125},
      },
      west =
      {
        filename = "__base__/graphics/entity/combinator/activity-leds/combinator-led-constant-west.png",
        width = 12,
        height = 12,
        frame_count = 1,
        shift = {-0.21875, -0.46875},
      }
    },

    activity_led_light =
    {
      intensity = 0.8,
      size = 1,
      color = {r = 1.0, g = 1.0, b = 1.0}
    },

    activity_led_light_offsets =
    {
      {0.296875, -0.40625},
      {0.25, -0.03125},
      {-0.296875, -0.078125},
      {-0.21875, -0.46875}
    },

    circuit_wire_connection_points =
    {
      {
        shadow =
        {
          red = {0.15625, -0.28125},
          green = {0.65625, -0.25}
        },
        wire =
        {
          red = {-0.28125, -0.5625},
          green = {0.21875, -0.5625},
        }
      },
      {
        shadow =
        {
          red = {0.75, -0.15625},
          green = {0.75, 0.25},
        },
        wire =
        {
          red = {0.46875, -0.5},
          green = {0.46875, -0.09375},
        }
      },
      {
        shadow =
        {
          red = {0.75, 0.5625},
          green = {0.21875, 0.5625}
        },
        wire =
        {
          red = {0.28125, 0.15625},
          green = {-0.21875, 0.15625}
        }
      },
      {
        shadow =
        {
          red = {-0.03125, 0.28125},
          green = {-0.03125, -0.125},
        },
        wire =
        {
          red = {-0.46875, 0},
          green = {-0.46875, -0.40625},
        }
      }
    },

    circuit_wire_max_distance = 9
  },
  {
    type = "power-switch",
    name = "power-switch",
    icon = "__base__/graphics/icons/power-switch.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 1, result = "power-switch"},
    max_health = 200,
    corpse = "medium-remnants",

    collision_box = {{-0.7, -0.7}, {0.7, 0.7}},
    selection_box = {{-1, -1}, {1, 1}},

    power_on_animation =
    {
      filename = "__base__/graphics/entity/power-switch/power-switch.png",
      animation_speed = 0.2,
      line_length = 2,
      width = 117,
      height = 74,
      frame_count = 6,
      axially_symmetrical = false,
      direction_count = 1,
      shift = {0.453125, 0.1875},
    },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    overlay_start_delay = 3, --power on animation overlay is only 2 frames we play at the end
    overlay_start =
    {
      filename = "__base__/graphics/entity/power-switch/power-switch-electricity-start.png",
      blend_mode = "additive",
      animation_speed = 0.2,
      line_length = 2,
      width = 38,
      height = 49,
      frame_count = 2,
      axially_symmetrical = false,
      direction_count = 1,
      shift = {0.15625, 0.046875},
    },
    overlay_loop =
    {
      filename = "__base__/graphics/entity/power-switch/power-switch-electricity-loop.png",
      blend_mode = "additive",
      animation_speed = 0.25,
      line_length = 4,
      width = 53,
      height = 56,
      frame_count = 16,
      axially_symmetrical = false,
      direction_count = 1,
      shift = {0.046875, -0.0625},
    },
    led_on =
    {
      filename = "__base__/graphics/entity/power-switch/power-switch-led.png",
      x = 6,
      width = 6,
      height = 9,
      frame_count = 1,
      shift = {0.71875, 0.140625},
    },
    led_off =
    {
      filename = "__base__/graphics/entity/power-switch/power-switch-led.png",
      width = 6,
      height = 9,
      frame_count = 1,
      shift = {0.71875, 0.140625},
    },
    circuit_wire_connection_point =
    {
      shadow =
      {
        red = {-0.328125, 1.01563},
        green = {-0.328125, 1.01563},
      },
      wire =
      {
        red = {-0.609375, 0.828125},
        green = {-0.609375, 0.828125},
      }
    },
    left_wire_connection_point =
    {
      shadow =
      {
        copper = {0.296875, -0.171875},
      },
      wire =
      {
        copper = {-0.765625, -0.890625},
      }
    },
    right_wire_connection_point =
    {
      shadow =
      {
        copper = {2.14063, 0.015625},
      },
      wire =
      {
        copper = {0.859375, -0.890625},
      }
    },

    wire_max_distance = 10
  },
    {
    type = "programmable-speaker",
    name = "programmable-speaker",
    icon = "__base__/graphics/icons/programmable-speaker.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "programmable-speaker"},
    max_health = 150,
    corpse = "small-remnants",
    collision_box = {{-0.3, -0.3}, {0.3, 0.3}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    drawing_box = {{-0.5, -2.5}, {0.5, 0.3}},
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input"
    },
    energy_usage_per_tick = "2KW",

    sprite =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/programmable-speaker/programmable-speaker.png",
          priority = "extra-high",
          width = 30,
          height = 89,
          shift = util.by_pixel(-2, -39.5),
          hr_version = {
            filename = "__base__/graphics/entity/programmable-speaker/hr-programmable-speaker.png",
            priority = "extra-high",
            width = 59,
            height = 178,
            shift = util.by_pixel(-2.25, -39.5),
            scale = 0.5,
          }
        },
        {
          filename = "__base__/graphics/entity/programmable-speaker/programmable-speaker-shadow.png",
          priority = "extra-high",
          width = 119,
          height = 25,
          shift = util.by_pixel(52.5, -2.5),
          draw_as_shadow = true,
          hr_version = {
            filename = "__base__/graphics/entity/programmable-speaker/hr-programmable-speaker-shadow.png",
            priority = "extra-high",
            width = 237,
            height = 50,
            shift = util.by_pixel(52.75, -3),
            draw_as_shadow = true,
            scale = 0.5,
          }
        }
      }
    },

    audible_distance_modifier = 2, --multiplies the default 40 tiles of audible distance by this number
    maximum_polyphony = 10, --maximum number of samples that can play at the same time

    instruments =
    {
      {
        name = "alarms",
        notes =
        {
         { name="alarm-1",  sound = { filename = "__base__/sound/programmable-speaker/alarm-1.ogg" }},
         { name="alarm-2",  sound = { filename = "__base__/sound/programmable-speaker/alarm-2.ogg" }},
         { name="buzzer-1",  sound = { filename = "__base__/sound/programmable-speaker/buzzer-1.ogg" }},
         { name="buzzer-2",  sound = { filename = "__base__/sound/programmable-speaker/buzzer-2.ogg" }},
         { name="buzzer-3",  sound = { filename = "__base__/sound/programmable-speaker/buzzer-3.ogg" }},
         { name="ring",  sound = { filename = "__base__/sound/programmable-speaker/ring.ogg", preload = false }},
         { name="siren",  sound = { filename = "__base__/sound/programmable-speaker/siren.ogg", preload = false }},         
        }
      },
      {
        name = "miscellaneous",
        notes =
        {
          { name = "achievement-unlocked",  sound = { filename = "__core__/sound/achievement-unlocked.ogg" }},
          { name = "alert-construction",  sound = { filename = "__core__/sound/alert-construction.ogg" }},
          { name = "alert-damage",  sound = { filename = "__core__/sound/alert-damage.ogg" }},
          { name = "armor-insert",  sound = { filename = "__core__/sound/armor-insert.ogg" }},
          { name = "armor-remove",  sound = { filename = "__core__/sound/armor-remove.ogg" }},
          { name = "cannot-build",  sound = { filename = "__core__/sound/cannot-build.ogg" }},
          { name = "console-message",  sound = { filename = "__core__/sound/console-message.ogg" }},
          { name = "crafting-finished",  sound = { filename = "__core__/sound/crafting-finished.ogg" }},
          { name = "game-lost",  sound = { filename = "__core__/sound/game-lost.ogg" }},
          { name = "game-won",  sound = { filename = "__core__/sound/game-won.ogg" }},
          { name = "gui-click",  sound = { filename = "__core__/sound/gui-click.ogg" }},
          { name = "gui-click-2",  sound = { filename = "__core__/sound/listbox-click.ogg" }},
          { name = "inventory-move",  sound = { filename = "__core__/sound/inventory-move.ogg" }},
          { name = "new-objective",  sound = { filename = "__core__/sound/new-objective.ogg" }},
          { name = "research-completed",  sound = { filename = "__core__/sound/research-completed.ogg" }},
          { name = "scenario-message",  sound = { filename = "__core__/sound/scenario-message.ogg" }},
        }
      },
      {
        name = "drum-kit",
        notes =
        {
          { name = "kick-1",  sound = { filename = "__base__/sound/programmable-speaker/kit-01.ogg" }},
          { name = "kick-2",  sound = { filename = "__base__/sound/programmable-speaker/kit-02.ogg" }},
          { name = "snare-1", sound = { filename = "__base__/sound/programmable-speaker/kit-03.ogg" }},
          { name = "snare-2", sound = { filename = "__base__/sound/programmable-speaker/kit-04.ogg" }},
          { name = "snare-3", sound = { filename = "__base__/sound/programmable-speaker/kit-05.ogg" }},
          { name = "hat-1",   sound = { filename = "__base__/sound/programmable-speaker/kit-06.ogg" }},
          { name = "hat-2",   sound = { filename = "__base__/sound/programmable-speaker/kit-07.ogg" }},
          { name = "fx",  sound = { filename = "__base__/sound/programmable-speaker/kit-08.ogg" }},
          { name = "high-q",  sound = { filename = "__base__/sound/programmable-speaker/kit-09.ogg" }},
          { name = "perc-1",  sound = { filename = "__base__/sound/programmable-speaker/kit-10.ogg" }},
          { name = "perc-2",  sound = { filename = "__base__/sound/programmable-speaker/kit-11.ogg" }},
          { name = "crash",  sound = { filename = "__base__/sound/programmable-speaker/kit-12.ogg" }},
          { name = "reverse-cymbal",  sound = { filename = "__base__/sound/programmable-speaker/kit-13.ogg" }},
          { name = "clap",  sound = { filename = "__base__/sound/programmable-speaker/kit-14.ogg" }},
          { name = "shaker",  sound = { filename = "__base__/sound/programmable-speaker/kit-15.ogg" }},
          { name = "cowbell",  sound = { filename = "__base__/sound/programmable-speaker/kit-16.ogg" }},
          { name = "triangle",  sound = { filename = "__base__/sound/programmable-speaker/kit-17.ogg" }},
        }
      },
      {
        name = "piano",
        notes =
        {
          { name = "F3",  sound = { filename = "__base__/sound/programmable-speaker/piano1-01.ogg" }},
          { name = "F#3", sound = { filename = "__base__/sound/programmable-speaker/piano1-02.ogg" }},
          { name = "G3",  sound = { filename = "__base__/sound/programmable-speaker/piano1-03.ogg" }},
          { name = "G#3", sound = { filename = "__base__/sound/programmable-speaker/piano1-04.ogg" }},
          { name = "A3",  sound = { filename = "__base__/sound/programmable-speaker/piano1-05.ogg" }},
          { name = "A#3", sound = { filename = "__base__/sound/programmable-speaker/piano1-06.ogg" }},
          { name = "B3",  sound = { filename = "__base__/sound/programmable-speaker/piano1-07.ogg" }},
          { name = "C4",  sound = { filename = "__base__/sound/programmable-speaker/piano1-08.ogg" }},
          { name = "C#4", sound = { filename = "__base__/sound/programmable-speaker/piano1-09.ogg" }},
          { name = "D4",  sound = { filename = "__base__/sound/programmable-speaker/piano1-10.ogg" }},
          { name = "D#4", sound = { filename = "__base__/sound/programmable-speaker/piano1-11.ogg" }},
          { name = "E4",  sound = { filename = "__base__/sound/programmable-speaker/piano1-12.ogg" }},
          { name = "F4",  sound = { filename = "__base__/sound/programmable-speaker/piano1-13.ogg" }},
          { name = "F#4", sound = { filename = "__base__/sound/programmable-speaker/piano1-14.ogg" }},
          { name = "G4",  sound = { filename = "__base__/sound/programmable-speaker/piano1-15.ogg" }},
          { name = "G#4", sound = { filename = "__base__/sound/programmable-speaker/piano1-16.ogg" }},
          { name = "A4",  sound = { filename = "__base__/sound/programmable-speaker/piano1-17.ogg" }},
          { name = "A#4", sound = { filename = "__base__/sound/programmable-speaker/piano1-18.ogg" }},
          { name = "B4",  sound = { filename = "__base__/sound/programmable-speaker/piano1-19.ogg" }},
          { name = "C5",  sound = { filename = "__base__/sound/programmable-speaker/piano1-20.ogg" }},
          { name = "C#5", sound = { filename = "__base__/sound/programmable-speaker/piano1-21.ogg" }},
          { name = "D5",  sound = { filename = "__base__/sound/programmable-speaker/piano1-22.ogg" }},
          { name = "D#5", sound = { filename = "__base__/sound/programmable-speaker/piano1-23.ogg" }},
          { name = "E5",  sound = { filename = "__base__/sound/programmable-speaker/piano1-24.ogg" }},
          { name = "F5",  sound = { filename = "__base__/sound/programmable-speaker/piano1-25.ogg" }},
          { name = "F#5", sound = { filename = "__base__/sound/programmable-speaker/piano1-26.ogg" }},
          { name = "G5",  sound = { filename = "__base__/sound/programmable-speaker/piano1-27.ogg" }},
          { name = "G#5", sound = { filename = "__base__/sound/programmable-speaker/piano1-28.ogg" }},
          { name = "A5",  sound = { filename = "__base__/sound/programmable-speaker/piano1-29.ogg" }},
          { name = "A#5", sound = { filename = "__base__/sound/programmable-speaker/piano1-30.ogg" }},
          { name = "B5",  sound = { filename = "__base__/sound/programmable-speaker/piano1-31.ogg" }},
          { name = "C6",  sound = { filename = "__base__/sound/programmable-speaker/piano1-32.ogg" }},
          { name = "C#6", sound = { filename = "__base__/sound/programmable-speaker/piano1-33.ogg" }},
          { name = "D6",  sound = { filename = "__base__/sound/programmable-speaker/piano1-34.ogg" }},
          { name = "D#6", sound = { filename = "__base__/sound/programmable-speaker/piano1-35.ogg" }},
          { name = "E6",  sound = { filename = "__base__/sound/programmable-speaker/piano1-36.ogg" }},
          { name = "F6",  sound = { filename = "__base__/sound/programmable-speaker/piano1-37.ogg" }},
          { name = "F#6", sound = { filename = "__base__/sound/programmable-speaker/piano1-38.ogg" }},
          { name = "G6",  sound = { filename = "__base__/sound/programmable-speaker/piano1-39.ogg" }},
          { name = "G#6", sound = { filename = "__base__/sound/programmable-speaker/piano1-40.ogg" }},
          { name = "A6",  sound = { filename = "__base__/sound/programmable-speaker/piano1-41.ogg" }},
          { name = "A#6", sound = { filename = "__base__/sound/programmable-speaker/piano1-42.ogg" }},
          { name = "B6",  sound = { filename = "__base__/sound/programmable-speaker/piano1-43.ogg" }},
          { name = "C7",  sound = { filename = "__base__/sound/programmable-speaker/piano1-44.ogg" }},
          { name = "C#7", sound = { filename = "__base__/sound/programmable-speaker/piano1-45.ogg" }},
          { name = "D7",  sound = { filename = "__base__/sound/programmable-speaker/piano1-46.ogg" }},
          { name = "D#7", sound = { filename = "__base__/sound/programmable-speaker/piano1-47.ogg" }},
          { name = "E7",  sound = { filename = "__base__/sound/programmable-speaker/piano1-48.ogg" }},
        }
      },
      {
        name = "bass",
        notes =
        {
          { name = "F2",  sound = { filename = "__base__/sound/programmable-speaker/bass-01.ogg" }},
          { name = "F#2", sound = { filename = "__base__/sound/programmable-speaker/bass-02.ogg" }},
          { name = "G2",  sound = { filename = "__base__/sound/programmable-speaker/bass-03.ogg" }},
          { name = "G#2", sound = { filename = "__base__/sound/programmable-speaker/bass-04.ogg" }},
          { name = "A2",  sound = { filename = "__base__/sound/programmable-speaker/bass-05.ogg" }},
          { name = "A#2", sound = { filename = "__base__/sound/programmable-speaker/bass-06.ogg" }},
          { name = "B2",  sound = { filename = "__base__/sound/programmable-speaker/bass-07.ogg" }},
          { name = "C3",  sound = { filename = "__base__/sound/programmable-speaker/bass-08.ogg" }},
          { name = "C#3", sound = { filename = "__base__/sound/programmable-speaker/bass-09.ogg" }},
          { name = "D3",  sound = { filename = "__base__/sound/programmable-speaker/bass-10.ogg" }},
          { name = "D#3", sound = { filename = "__base__/sound/programmable-speaker/bass-11.ogg" }},
          { name = "E3",  sound = { filename = "__base__/sound/programmable-speaker/bass-12.ogg" }},
          { name = "F3",  sound = { filename = "__base__/sound/programmable-speaker/bass-13.ogg" }},
          { name = "F#3", sound = { filename = "__base__/sound/programmable-speaker/bass-14.ogg" }},
          { name = "G3",  sound = { filename = "__base__/sound/programmable-speaker/bass-15.ogg" }},
          { name = "G#3", sound = { filename = "__base__/sound/programmable-speaker/bass-16.ogg" }},
          { name = "A3",  sound = { filename = "__base__/sound/programmable-speaker/bass-17.ogg" }},
          { name = "A#3", sound = { filename = "__base__/sound/programmable-speaker/bass-18.ogg" }},
          { name = "B3",  sound = { filename = "__base__/sound/programmable-speaker/bass-19.ogg" }},
          { name = "C4",  sound = { filename = "__base__/sound/programmable-speaker/bass-20.ogg" }},
          { name = "C#4", sound = { filename = "__base__/sound/programmable-speaker/bass-21.ogg" }},
          { name = "D4",  sound = { filename = "__base__/sound/programmable-speaker/bass-22.ogg" }},
          { name = "D#4", sound = { filename = "__base__/sound/programmable-speaker/bass-23.ogg" }},
          { name = "E4",  sound = { filename = "__base__/sound/programmable-speaker/bass-24.ogg" }},
          { name = "F4",  sound = { filename = "__base__/sound/programmable-speaker/bass-25.ogg" }},
          { name = "F#4", sound = { filename = "__base__/sound/programmable-speaker/bass-26.ogg" }},
          { name = "G4",  sound = { filename = "__base__/sound/programmable-speaker/bass-27.ogg" }},
          { name = "G#4", sound = { filename = "__base__/sound/programmable-speaker/bass-28.ogg" }},
          { name = "A4",  sound = { filename = "__base__/sound/programmable-speaker/bass-29.ogg" }},
          { name = "A#4", sound = { filename = "__base__/sound/programmable-speaker/bass-30.ogg" }},
          { name = "B4",  sound = { filename = "__base__/sound/programmable-speaker/bass-31.ogg" }},
          { name = "C5",  sound = { filename = "__base__/sound/programmable-speaker/bass-32.ogg" }},
          { name = "C#5", sound = { filename = "__base__/sound/programmable-speaker/bass-33.ogg" }},
          { name = "D5",  sound = { filename = "__base__/sound/programmable-speaker/bass-34.ogg" }},
          { name = "D#5", sound = { filename = "__base__/sound/programmable-speaker/bass-35.ogg" }},
          { name = "E5",  sound = { filename = "__base__/sound/programmable-speaker/bass-36.ogg" }},
        }
      },
      {
        name = "lead",
        notes =
        {
          { name = "F2",  sound = { filename = "__base__/sound/programmable-speaker/lead-01.ogg" }},
          { name = "F#2", sound = { filename = "__base__/sound/programmable-speaker/lead-02.ogg" }},
          { name = "G2",  sound = { filename = "__base__/sound/programmable-speaker/lead-03.ogg" }},
          { name = "G#2", sound = { filename = "__base__/sound/programmable-speaker/lead-04.ogg" }},
          { name = "A2",  sound = { filename = "__base__/sound/programmable-speaker/lead-05.ogg" }},
          { name = "A#2", sound = { filename = "__base__/sound/programmable-speaker/lead-06.ogg" }},
          { name = "B2",  sound = { filename = "__base__/sound/programmable-speaker/lead-07.ogg" }},
          { name = "C3",  sound = { filename = "__base__/sound/programmable-speaker/lead-08.ogg" }},
          { name = "C#3", sound = { filename = "__base__/sound/programmable-speaker/lead-09.ogg" }},
          { name = "D3",  sound = { filename = "__base__/sound/programmable-speaker/lead-10.ogg" }},
          { name = "D#3", sound = { filename = "__base__/sound/programmable-speaker/lead-11.ogg" }},
          { name = "E3",  sound = { filename = "__base__/sound/programmable-speaker/lead-12.ogg" }},
          { name = "F3",  sound = { filename = "__base__/sound/programmable-speaker/lead-13.ogg" }},
          { name = "F#3", sound = { filename = "__base__/sound/programmable-speaker/lead-14.ogg" }},
          { name = "G3",  sound = { filename = "__base__/sound/programmable-speaker/lead-15.ogg" }},
          { name = "G#3", sound = { filename = "__base__/sound/programmable-speaker/lead-16.ogg" }},
          { name = "A3",  sound = { filename = "__base__/sound/programmable-speaker/lead-17.ogg" }},
          { name = "A#3", sound = { filename = "__base__/sound/programmable-speaker/lead-18.ogg" }},
          { name = "B3",  sound = { filename = "__base__/sound/programmable-speaker/lead-19.ogg" }},
          { name = "C4",  sound = { filename = "__base__/sound/programmable-speaker/lead-20.ogg" }},
          { name = "C#4", sound = { filename = "__base__/sound/programmable-speaker/lead-21.ogg" }},
          { name = "D4",  sound = { filename = "__base__/sound/programmable-speaker/lead-22.ogg" }},
          { name = "D#4", sound = { filename = "__base__/sound/programmable-speaker/lead-23.ogg" }},
          { name = "E4",  sound = { filename = "__base__/sound/programmable-speaker/lead-24.ogg" }},
          { name = "F4",  sound = { filename = "__base__/sound/programmable-speaker/lead-25.ogg" }},
          { name = "F#4", sound = { filename = "__base__/sound/programmable-speaker/lead-26.ogg" }},
          { name = "G4",  sound = { filename = "__base__/sound/programmable-speaker/lead-27.ogg" }},
          { name = "G#4", sound = { filename = "__base__/sound/programmable-speaker/lead-28.ogg" }},
          { name = "A4",  sound = { filename = "__base__/sound/programmable-speaker/lead-29.ogg" }},
          { name = "A#4", sound = { filename = "__base__/sound/programmable-speaker/lead-30.ogg" }},
          { name = "B4",  sound = { filename = "__base__/sound/programmable-speaker/lead-31.ogg" }},
          { name = "C5",  sound = { filename = "__base__/sound/programmable-speaker/lead-32.ogg" }},
          { name = "C#5", sound = { filename = "__base__/sound/programmable-speaker/lead-33.ogg" }},
          { name = "D5",  sound = { filename = "__base__/sound/programmable-speaker/lead-34.ogg" }},
          { name = "D#5", sound = { filename = "__base__/sound/programmable-speaker/lead-35.ogg" }},
          { name = "E5",  sound = { filename = "__base__/sound/programmable-speaker/lead-36.ogg" }},
        }
      },
      {
        name = "saw",
        notes =
        {
          { name = "F2",  sound = { filename = "__base__/sound/programmable-speaker/saw-01.ogg" }},
          { name = "F#2", sound = { filename = "__base__/sound/programmable-speaker/saw-02.ogg" }},
          { name = "G2",  sound = { filename = "__base__/sound/programmable-speaker/saw-03.ogg" }},
          { name = "G#2", sound = { filename = "__base__/sound/programmable-speaker/saw-04.ogg" }},
          { name = "A2",  sound = { filename = "__base__/sound/programmable-speaker/saw-05.ogg" }},
          { name = "A#2", sound = { filename = "__base__/sound/programmable-speaker/saw-06.ogg" }},
          { name = "B2",  sound = { filename = "__base__/sound/programmable-speaker/saw-07.ogg" }},
          { name = "C3",  sound = { filename = "__base__/sound/programmable-speaker/saw-08.ogg" }},
          { name = "C#3", sound = { filename = "__base__/sound/programmable-speaker/saw-09.ogg" }},
          { name = "D3",  sound = { filename = "__base__/sound/programmable-speaker/saw-10.ogg" }},
          { name = "D#3", sound = { filename = "__base__/sound/programmable-speaker/saw-11.ogg" }},
          { name = "E3",  sound = { filename = "__base__/sound/programmable-speaker/saw-12.ogg" }},
          { name = "F3",  sound = { filename = "__base__/sound/programmable-speaker/saw-13.ogg" }},
          { name = "F#3", sound = { filename = "__base__/sound/programmable-speaker/saw-14.ogg" }},
          { name = "G3",  sound = { filename = "__base__/sound/programmable-speaker/saw-15.ogg" }},
          { name = "G#3", sound = { filename = "__base__/sound/programmable-speaker/saw-16.ogg" }},
          { name = "A3",  sound = { filename = "__base__/sound/programmable-speaker/saw-17.ogg" }},
          { name = "A#3", sound = { filename = "__base__/sound/programmable-speaker/saw-18.ogg" }},
          { name = "B3",  sound = { filename = "__base__/sound/programmable-speaker/saw-19.ogg" }},
          { name = "C4",  sound = { filename = "__base__/sound/programmable-speaker/saw-20.ogg" }},
          { name = "C#4", sound = { filename = "__base__/sound/programmable-speaker/saw-21.ogg" }},
          { name = "D4",  sound = { filename = "__base__/sound/programmable-speaker/saw-22.ogg" }},
          { name = "D#4", sound = { filename = "__base__/sound/programmable-speaker/saw-23.ogg" }},
          { name = "E4",  sound = { filename = "__base__/sound/programmable-speaker/saw-24.ogg" }},
          { name = "F4",  sound = { filename = "__base__/sound/programmable-speaker/saw-25.ogg" }},
          { name = "F#4", sound = { filename = "__base__/sound/programmable-speaker/saw-26.ogg" }},
          { name = "G4",  sound = { filename = "__base__/sound/programmable-speaker/saw-27.ogg" }},
          { name = "G#4", sound = { filename = "__base__/sound/programmable-speaker/saw-28.ogg" }},
          { name = "A4",  sound = { filename = "__base__/sound/programmable-speaker/saw-29.ogg" }},
          { name = "A#4", sound = { filename = "__base__/sound/programmable-speaker/saw-30.ogg" }},
          { name = "B4",  sound = { filename = "__base__/sound/programmable-speaker/saw-31.ogg" }},
          { name = "C5",  sound = { filename = "__base__/sound/programmable-speaker/saw-32.ogg" }},
          { name = "C#5", sound = { filename = "__base__/sound/programmable-speaker/saw-33.ogg" }},
          { name = "D5",  sound = { filename = "__base__/sound/programmable-speaker/saw-34.ogg" }},
          { name = "D#5", sound = { filename = "__base__/sound/programmable-speaker/saw-35.ogg" }},
          { name = "E5",  sound = { filename = "__base__/sound/programmable-speaker/saw-36.ogg" }},
        }
      },
      {
        name = "square",
        notes =
        {
          { name = "F2",  sound = { filename = "__base__/sound/programmable-speaker/square-01.ogg" }},
          { name = "F#2", sound = { filename = "__base__/sound/programmable-speaker/square-02.ogg" }},
          { name = "G2",  sound = { filename = "__base__/sound/programmable-speaker/square-03.ogg" }},
          { name = "G#2", sound = { filename = "__base__/sound/programmable-speaker/square-04.ogg" }},
          { name = "A2",  sound = { filename = "__base__/sound/programmable-speaker/square-05.ogg" }},
          { name = "A#2", sound = { filename = "__base__/sound/programmable-speaker/square-06.ogg" }},
          { name = "B2",  sound = { filename = "__base__/sound/programmable-speaker/square-07.ogg" }},
          { name = "C3",  sound = { filename = "__base__/sound/programmable-speaker/square-08.ogg" }},
          { name = "C#3", sound = { filename = "__base__/sound/programmable-speaker/square-09.ogg" }},
          { name = "D3",  sound = { filename = "__base__/sound/programmable-speaker/square-10.ogg" }},
          { name = "D#3", sound = { filename = "__base__/sound/programmable-speaker/square-11.ogg" }},
          { name = "E3",  sound = { filename = "__base__/sound/programmable-speaker/square-12.ogg" }},
          { name = "F3",  sound = { filename = "__base__/sound/programmable-speaker/square-13.ogg" }},
          { name = "F#3", sound = { filename = "__base__/sound/programmable-speaker/square-14.ogg" }},
          { name = "G3",  sound = { filename = "__base__/sound/programmable-speaker/square-15.ogg" }},
          { name = "G#3", sound = { filename = "__base__/sound/programmable-speaker/square-16.ogg" }},
          { name = "A3",  sound = { filename = "__base__/sound/programmable-speaker/square-17.ogg" }},
          { name = "A#3", sound = { filename = "__base__/sound/programmable-speaker/square-18.ogg" }},
          { name = "B3",  sound = { filename = "__base__/sound/programmable-speaker/square-19.ogg" }},
          { name = "C4",  sound = { filename = "__base__/sound/programmable-speaker/square-20.ogg" }},
          { name = "C#4", sound = { filename = "__base__/sound/programmable-speaker/square-21.ogg" }},
          { name = "D4",  sound = { filename = "__base__/sound/programmable-speaker/square-22.ogg" }},
          { name = "D#4", sound = { filename = "__base__/sound/programmable-speaker/square-23.ogg" }},
          { name = "E4",  sound = { filename = "__base__/sound/programmable-speaker/square-24.ogg" }},
          { name = "F4",  sound = { filename = "__base__/sound/programmable-speaker/square-25.ogg" }},
          { name = "F#4", sound = { filename = "__base__/sound/programmable-speaker/square-26.ogg" }},
          { name = "G4",  sound = { filename = "__base__/sound/programmable-speaker/square-27.ogg" }},
          { name = "G#4", sound = { filename = "__base__/sound/programmable-speaker/square-28.ogg" }},
          { name = "A4",  sound = { filename = "__base__/sound/programmable-speaker/square-29.ogg" }},
          { name = "A#4", sound = { filename = "__base__/sound/programmable-speaker/square-30.ogg" }},
          { name = "B4",  sound = { filename = "__base__/sound/programmable-speaker/square-31.ogg" }},
          { name = "C5",  sound = { filename = "__base__/sound/programmable-speaker/square-32.ogg" }},
          { name = "C#5", sound = { filename = "__base__/sound/programmable-speaker/square-33.ogg" }},
          { name = "D5",  sound = { filename = "__base__/sound/programmable-speaker/square-34.ogg" }},
          { name = "D#5", sound = { filename = "__base__/sound/programmable-speaker/square-35.ogg" }},
          { name = "E5",  sound = { filename = "__base__/sound/programmable-speaker/square-36.ogg" }},
        }
      },
      {
        name = "celesta",
        notes =
        {
          { name = "F5",  sound = { filename = "__base__/sound/programmable-speaker/celesta-01.ogg" }},
          { name = "F#5", sound = { filename = "__base__/sound/programmable-speaker/celesta-02.ogg" }},
          { name = "G5",  sound = { filename = "__base__/sound/programmable-speaker/celesta-03.ogg" }},
          { name = "G#5", sound = { filename = "__base__/sound/programmable-speaker/celesta-04.ogg" }},
          { name = "A5",  sound = { filename = "__base__/sound/programmable-speaker/celesta-05.ogg" }},
          { name = "A#5", sound = { filename = "__base__/sound/programmable-speaker/celesta-06.ogg" }},
          { name = "B5",  sound = { filename = "__base__/sound/programmable-speaker/celesta-07.ogg" }},
          { name = "C6",  sound = { filename = "__base__/sound/programmable-speaker/celesta-08.ogg" }},
          { name = "C#6", sound = { filename = "__base__/sound/programmable-speaker/celesta-09.ogg" }},
          { name = "D6",  sound = { filename = "__base__/sound/programmable-speaker/celesta-10.ogg" }},
          { name = "D#6", sound = { filename = "__base__/sound/programmable-speaker/celesta-11.ogg" }},
          { name = "E6",  sound = { filename = "__base__/sound/programmable-speaker/celesta-12.ogg" }},
          { name = "F6",  sound = { filename = "__base__/sound/programmable-speaker/celesta-13.ogg" }},
          { name = "F#6", sound = { filename = "__base__/sound/programmable-speaker/celesta-14.ogg" }},
          { name = "G6",  sound = { filename = "__base__/sound/programmable-speaker/celesta-15.ogg" }},
          { name = "G#6", sound = { filename = "__base__/sound/programmable-speaker/celesta-16.ogg" }},
          { name = "A6",  sound = { filename = "__base__/sound/programmable-speaker/celesta-17.ogg" }},
          { name = "A#6", sound = { filename = "__base__/sound/programmable-speaker/celesta-18.ogg" }},
          { name = "B6",  sound = { filename = "__base__/sound/programmable-speaker/celesta-19.ogg" }},
          { name = "C7",  sound = { filename = "__base__/sound/programmable-speaker/celesta-20.ogg" }},
          { name = "C#7", sound = { filename = "__base__/sound/programmable-speaker/celesta-21.ogg" }},
          { name = "D7",  sound = { filename = "__base__/sound/programmable-speaker/celesta-22.ogg" }},
          { name = "D#7", sound = { filename = "__base__/sound/programmable-speaker/celesta-23.ogg" }},
          { name = "E7",  sound = { filename = "__base__/sound/programmable-speaker/celesta-24.ogg" }},
          { name = "F7",  sound = { filename = "__base__/sound/programmable-speaker/celesta-25.ogg" }},
          { name = "F#7", sound = { filename = "__base__/sound/programmable-speaker/celesta-26.ogg" }},
          { name = "G7",  sound = { filename = "__base__/sound/programmable-speaker/celesta-27.ogg" }},
          { name = "G#7", sound = { filename = "__base__/sound/programmable-speaker/celesta-28.ogg" }},
          { name = "A7",  sound = { filename = "__base__/sound/programmable-speaker/celesta-29.ogg" }},
          { name = "A#7", sound = { filename = "__base__/sound/programmable-speaker/celesta-30.ogg" }},
          { name = "B7",  sound = { filename = "__base__/sound/programmable-speaker/celesta-31.ogg" }},
          { name = "C8",  sound = { filename = "__base__/sound/programmable-speaker/celesta-32.ogg" }},
          { name = "C#8", sound = { filename = "__base__/sound/programmable-speaker/celesta-33.ogg" }},
          { name = "D8",  sound = { filename = "__base__/sound/programmable-speaker/celesta-34.ogg" }},
          { name = "D#8", sound = { filename = "__base__/sound/programmable-speaker/celesta-35.ogg" }},
          { name = "E8",  sound = { filename = "__base__/sound/programmable-speaker/celesta-36.ogg" }},
        }
      },
      {
        name = "vibraphone",
        notes =
        {
          { name = "F5",  sound = { filename = "__base__/sound/programmable-speaker/vibraphone-01.ogg" }},
          { name = "F#5", sound = { filename = "__base__/sound/programmable-speaker/vibraphone-02.ogg" }},
          { name = "G5",  sound = { filename = "__base__/sound/programmable-speaker/vibraphone-03.ogg" }},
          { name = "G#5", sound = { filename = "__base__/sound/programmable-speaker/vibraphone-04.ogg" }},
          { name = "A5",  sound = { filename = "__base__/sound/programmable-speaker/vibraphone-05.ogg" }},
          { name = "A#5", sound = { filename = "__base__/sound/programmable-speaker/vibraphone-06.ogg" }},
          { name = "B5",  sound = { filename = "__base__/sound/programmable-speaker/vibraphone-07.ogg" }},
          { name = "C6",  sound = { filename = "__base__/sound/programmable-speaker/vibraphone-08.ogg" }},
          { name = "C#6", sound = { filename = "__base__/sound/programmable-speaker/vibraphone-09.ogg" }},
          { name = "D6",  sound = { filename = "__base__/sound/programmable-speaker/vibraphone-10.ogg" }},
          { name = "D#6", sound = { filename = "__base__/sound/programmable-speaker/vibraphone-11.ogg" }},
          { name = "E6",  sound = { filename = "__base__/sound/programmable-speaker/vibraphone-12.ogg" }},
          { name = "F6",  sound = { filename = "__base__/sound/programmable-speaker/vibraphone-13.ogg" }},
          { name = "F#6", sound = { filename = "__base__/sound/programmable-speaker/vibraphone-14.ogg" }},
          { name = "G6",  sound = { filename = "__base__/sound/programmable-speaker/vibraphone-15.ogg" }},
          { name = "G#6", sound = { filename = "__base__/sound/programmable-speaker/vibraphone-16.ogg" }},
          { name = "A6",  sound = { filename = "__base__/sound/programmable-speaker/vibraphone-17.ogg" }},
          { name = "A#6", sound = { filename = "__base__/sound/programmable-speaker/vibraphone-18.ogg" }},
          { name = "B6",  sound = { filename = "__base__/sound/programmable-speaker/vibraphone-19.ogg" }},
          { name = "C7",  sound = { filename = "__base__/sound/programmable-speaker/vibraphone-20.ogg" }},
          { name = "C#7", sound = { filename = "__base__/sound/programmable-speaker/vibraphone-21.ogg" }},
          { name = "D7",  sound = { filename = "__base__/sound/programmable-speaker/vibraphone-22.ogg" }},
          { name = "D#7", sound = { filename = "__base__/sound/programmable-speaker/vibraphone-23.ogg" }},
          { name = "E7",  sound = { filename = "__base__/sound/programmable-speaker/vibraphone-24.ogg" }},
          { name = "F7",  sound = { filename = "__base__/sound/programmable-speaker/vibraphone-25.ogg" }},
          { name = "F#7", sound = { filename = "__base__/sound/programmable-speaker/vibraphone-26.ogg" }},
          { name = "G7",  sound = { filename = "__base__/sound/programmable-speaker/vibraphone-27.ogg" }},
          { name = "G#7", sound = { filename = "__base__/sound/programmable-speaker/vibraphone-28.ogg" }},
          { name = "A7",  sound = { filename = "__base__/sound/programmable-speaker/vibraphone-29.ogg" }},
          { name = "A#7", sound = { filename = "__base__/sound/programmable-speaker/vibraphone-30.ogg" }},
          { name = "B7",  sound = { filename = "__base__/sound/programmable-speaker/vibraphone-31.ogg" }},
          { name = "C8",  sound = { filename = "__base__/sound/programmable-speaker/vibraphone-32.ogg" }},
          { name = "C#8", sound = { filename = "__base__/sound/programmable-speaker/vibraphone-33.ogg" }},
          { name = "D8",  sound = { filename = "__base__/sound/programmable-speaker/vibraphone-34.ogg" }},
          { name = "D#8", sound = { filename = "__base__/sound/programmable-speaker/vibraphone-35.ogg" }},
          { name = "E8",  sound = { filename = "__base__/sound/programmable-speaker/vibraphone-36.ogg" }},
        }
      },
      {
        name = "plucked",
        notes =
        {
          { name = "F4",  sound = { filename = "__base__/sound/programmable-speaker/plucked-01.ogg" }},
          { name = "F#4", sound = { filename = "__base__/sound/programmable-speaker/plucked-02.ogg" }},
          { name = "G4",  sound = { filename = "__base__/sound/programmable-speaker/plucked-03.ogg" }},
          { name = "G#4", sound = { filename = "__base__/sound/programmable-speaker/plucked-04.ogg" }},
          { name = "A4",  sound = { filename = "__base__/sound/programmable-speaker/plucked-05.ogg" }},
          { name = "A#4", sound = { filename = "__base__/sound/programmable-speaker/plucked-06.ogg" }},
          { name = "B4",  sound = { filename = "__base__/sound/programmable-speaker/plucked-07.ogg" }},
          { name = "C5",  sound = { filename = "__base__/sound/programmable-speaker/plucked-08.ogg" }},
          { name = "C#5", sound = { filename = "__base__/sound/programmable-speaker/plucked-09.ogg" }},
          { name = "D5",  sound = { filename = "__base__/sound/programmable-speaker/plucked-10.ogg" }},
          { name = "D#5", sound = { filename = "__base__/sound/programmable-speaker/plucked-11.ogg" }},
          { name = "E5",  sound = { filename = "__base__/sound/programmable-speaker/plucked-12.ogg" }},
          { name = "F5",  sound = { filename = "__base__/sound/programmable-speaker/plucked-13.ogg" }},
          { name = "F#5", sound = { filename = "__base__/sound/programmable-speaker/plucked-14.ogg" }},
          { name = "G5",  sound = { filename = "__base__/sound/programmable-speaker/plucked-15.ogg" }},
          { name = "G#5", sound = { filename = "__base__/sound/programmable-speaker/plucked-16.ogg" }},
          { name = "A5",  sound = { filename = "__base__/sound/programmable-speaker/plucked-17.ogg" }},
          { name = "A#5", sound = { filename = "__base__/sound/programmable-speaker/plucked-18.ogg" }},
          { name = "B5",  sound = { filename = "__base__/sound/programmable-speaker/plucked-19.ogg" }},
          { name = "C6",  sound = { filename = "__base__/sound/programmable-speaker/plucked-20.ogg" }},
          { name = "C#6", sound = { filename = "__base__/sound/programmable-speaker/plucked-21.ogg" }},
          { name = "D6",  sound = { filename = "__base__/sound/programmable-speaker/plucked-22.ogg" }},
          { name = "D#6", sound = { filename = "__base__/sound/programmable-speaker/plucked-23.ogg" }},
          { name = "E6",  sound = { filename = "__base__/sound/programmable-speaker/plucked-24.ogg" }},
          { name = "F6",  sound = { filename = "__base__/sound/programmable-speaker/plucked-25.ogg" }},
          { name = "F#6", sound = { filename = "__base__/sound/programmable-speaker/plucked-26.ogg" }},
          { name = "G6",  sound = { filename = "__base__/sound/programmable-speaker/plucked-27.ogg" }},
          { name = "G#6", sound = { filename = "__base__/sound/programmable-speaker/plucked-28.ogg" }},
          { name = "A6",  sound = { filename = "__base__/sound/programmable-speaker/plucked-29.ogg" }},
          { name = "A#6", sound = { filename = "__base__/sound/programmable-speaker/plucked-30.ogg" }},
          { name = "B6",  sound = { filename = "__base__/sound/programmable-speaker/plucked-31.ogg" }},
          { name = "C7",  sound = { filename = "__base__/sound/programmable-speaker/plucked-32.ogg" }},
          { name = "C#7", sound = { filename = "__base__/sound/programmable-speaker/plucked-33.ogg" }},
          { name = "D7",  sound = { filename = "__base__/sound/programmable-speaker/plucked-34.ogg" }},
          { name = "D#7", sound = { filename = "__base__/sound/programmable-speaker/plucked-35.ogg" }},
          { name = "E7",  sound = { filename = "__base__/sound/programmable-speaker/plucked-36.ogg" }},
        }
      },
      {
        name = "steel-drum",
        notes =
        {
          { name = "F3",  sound = { filename = "__base__/sound/programmable-speaker/steel-drum-01.ogg" }},
          { name = "F#3", sound = { filename = "__base__/sound/programmable-speaker/steel-drum-02.ogg" }},
          { name = "G3",  sound = { filename = "__base__/sound/programmable-speaker/steel-drum-03.ogg" }},
          { name = "G#3", sound = { filename = "__base__/sound/programmable-speaker/steel-drum-04.ogg" }},
          { name = "A3",  sound = { filename = "__base__/sound/programmable-speaker/steel-drum-05.ogg" }},
          { name = "A#3", sound = { filename = "__base__/sound/programmable-speaker/steel-drum-06.ogg" }},
          { name = "B3",  sound = { filename = "__base__/sound/programmable-speaker/steel-drum-07.ogg" }},
          { name = "C4",  sound = { filename = "__base__/sound/programmable-speaker/steel-drum-08.ogg" }},
          { name = "C#4", sound = { filename = "__base__/sound/programmable-speaker/steel-drum-09.ogg" }},
          { name = "D4",  sound = { filename = "__base__/sound/programmable-speaker/steel-drum-10.ogg" }},
          { name = "D#4", sound = { filename = "__base__/sound/programmable-speaker/steel-drum-11.ogg" }},
          { name = "E4",  sound = { filename = "__base__/sound/programmable-speaker/steel-drum-12.ogg" }},
          { name = "F4",  sound = { filename = "__base__/sound/programmable-speaker/steel-drum-13.ogg" }},
          { name = "F#4", sound = { filename = "__base__/sound/programmable-speaker/steel-drum-14.ogg" }},
          { name = "G4",  sound = { filename = "__base__/sound/programmable-speaker/steel-drum-15.ogg" }},
          { name = "G#4", sound = { filename = "__base__/sound/programmable-speaker/steel-drum-16.ogg" }},
          { name = "A4",  sound = { filename = "__base__/sound/programmable-speaker/steel-drum-17.ogg" }},
          { name = "A#4", sound = { filename = "__base__/sound/programmable-speaker/steel-drum-18.ogg" }},
          { name = "B4",  sound = { filename = "__base__/sound/programmable-speaker/steel-drum-19.ogg" }},
          { name = "C5",  sound = { filename = "__base__/sound/programmable-speaker/steel-drum-20.ogg" }},
          { name = "C#5", sound = { filename = "__base__/sound/programmable-speaker/steel-drum-21.ogg" }},
          { name = "D5",  sound = { filename = "__base__/sound/programmable-speaker/steel-drum-22.ogg" }},
          { name = "D#5", sound = { filename = "__base__/sound/programmable-speaker/steel-drum-23.ogg" }},
          { name = "E5",  sound = { filename = "__base__/sound/programmable-speaker/steel-drum-24.ogg" }},
          { name = "F5",  sound = { filename = "__base__/sound/programmable-speaker/steel-drum-25.ogg" }},
          { name = "F#5", sound = { filename = "__base__/sound/programmable-speaker/steel-drum-26.ogg" }},
          { name = "G5",  sound = { filename = "__base__/sound/programmable-speaker/steel-drum-27.ogg" }},
          { name = "G#5", sound = { filename = "__base__/sound/programmable-speaker/steel-drum-28.ogg" }},
          { name = "A5",  sound = { filename = "__base__/sound/programmable-speaker/steel-drum-29.ogg" }},
          { name = "A#5", sound = { filename = "__base__/sound/programmable-speaker/steel-drum-30.ogg" }},
          { name = "B5",  sound = { filename = "__base__/sound/programmable-speaker/steel-drum-31.ogg" }},
          { name = "C6",  sound = { filename = "__base__/sound/programmable-speaker/steel-drum-32.ogg" }},
          { name = "C#6", sound = { filename = "__base__/sound/programmable-speaker/steel-drum-33.ogg" }},
          { name = "D6",  sound = { filename = "__base__/sound/programmable-speaker/steel-drum-34.ogg" }},
          { name = "D#6", sound = { filename = "__base__/sound/programmable-speaker/steel-drum-35.ogg" }},
          { name = "E6",  sound = { filename = "__base__/sound/programmable-speaker/steel-drum-36.ogg" }},
        }
      },

    },

    circuit_wire_connection_point =
    {
      shadow =
      {
        red = {-0.1875, 0.40625},
        green = {-0.34375, 0.40625}
      },
      wire =
      {
        red = {-0.1875, 0.40625},
        green = {-0.34375, 0.40625}
      }
    },
    circuit_connector_sprites = get_circuit_connector_sprites({-0.125, 0.34375}, nil, 0),
    circuit_wire_max_distance = 9,
  },
  {
    type = "electric-energy-interface",
    name = "electric-energy-interface",
    icon = "__base__/graphics/icons/accumulator.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "electric-energy-interface"},
    max_health = 150,
    corpse = "medium-remnants",
    collision_box = {{-0.9, -0.9}, {0.9, 0.9}},
    selection_box = {{-1, -1}, {1, 1}},
    enable_gui = true,
    allow_copy_paste = true,
    energy_source =
    {
      type = "electric",
      buffer_capacity = "10GJ",
      usage_priority = "terciary",
      input_flow_limit = "0kW",
      output_flow_limit = "500GW"
    },

    energy_production = "500GW",
    energy_usage = "0kW",
    -- also 'pictures' for 4-way sprite is available, or 'animation' resp. 'animations'
    picture =
    {
      filename = "__base__/graphics/entity/accumulator/accumulator.png",
      priority = "extra-high",
      width = 124,
      height = 103,
      shift = {0.6875, -0.203125},
      tint = {r=1, g=0.8, b=1, a=1}
    },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65},
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/accumulator-working.ogg",
        volume = 1
      },
      idle_sound =
      {
        filename = "__base__/sound/accumulator-idle.ogg",
        volume = 0.4
      },
      max_sounds_per_type = 5
    }
  },
  {
    type = "reactor",
    name = "nuclear-reactor",
    icon  = "__base__/graphics/icons/nuclear-reactor.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 1.5, result = "nuclear-reactor"},
    max_health = 500,
    corpse = "big-remnants",
    consumption = "40MW",
    burner =
    {
      fuel_category = "nuclear",
      effectivity = 1,
      fuel_inventory_size = 1,
      burnt_inventory_size = 1
    },
    collision_box = {{-2.2, -2.2}, {2.2, 2.2}},
    selection_box = {{-2.5, -2.5}, {2.5, 2.5}},

    lower_layer_picture = {
      filename = "__base__/graphics/entity/nuclear-reactor/reactor-pipes.png",
      width = 160,
      height = 160,
      shift = { -0.03125, -0.1875 },
      hr_version =
      {
        filename = "__base__/graphics/entity/nuclear-reactor/hr-reactor-pipes.png",
        width = 320,
        height = 320,
        scale = 0.5,
        shift = { -0.03125, -0.1875 },
      }
    },

    picture =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/nuclear-reactor/reactor.png",
          width = 160,
          height = 160,
          shift = { -0.03125, -0.1875 },
          hr_version =
          {
            filename = "__base__/graphics/entity/nuclear-reactor/hr-reactor.png",
            width = 320,
            height = 320,
            scale = 0.5,
            shift = { -0.03125, -0.1875 },
          }
        },
        {
          filename = "__base__/graphics/entity/nuclear-reactor/reactor-shadow.png",
          width = 263,
          height = 162,
          shift = { 1.625 , 0 },
          draw_as_shadow = true,
          hr_version =
          {
            filename = "__base__/graphics/entity/nuclear-reactor/hr-reactor-shadow.png",
            width = 525,
            height = 323,
            scale = 0.5,
            shift = { 1.625, 0 },
            draw_as_shadow = true,
          }
        },
      }
    },

    working_light_picture =
    {
      filename = "__base__/graphics/entity/nuclear-reactor/reactor-lights-color.png",
      width = 160,
      height = 160,
      shift = { -0.03125, -0.1875 },
      blend_mode = "additive",
      hr_version =
      {
        filename = "__base__/graphics/entity/nuclear-reactor/hr-reactor-lights-color.png",
        width = 320,
        height = 320,
        scale = 0.5,
        shift = { -0.03125, -0.1875 },
        blend_mode = "additive",
      }
    },

    light = {intensity = 0.6, size = 9.9, shift = {0.0, 0.0}, color = {r = 0.0, g = 1.0, b = 0.0}},

    heat_buffer =
    {
      max_temperature = 1000,
      specific_heat = "10MJ",
      max_transfer = "10GW",
      connections =
      {
        {
          position = {-2, -2},
          direction = defines.direction.north
        },
        {
          position = {0, -2},
          direction = defines.direction.north
        },
        {
          position = {2, -2},
          direction = defines.direction.north
        },
        {
          position = {2, -2},
          direction = defines.direction.east
        },
        {
          position = {2, 0},
          direction = defines.direction.east
        },
        {
          position = {2, 2},
          direction = defines.direction.east
        },
        {
          position = {2, 2},
          direction = defines.direction.south
        },
        {
          position = {0, 2},
          direction = defines.direction.south
        },
        {
          position = {-2, 2},
          direction = defines.direction.south
        },
        {
          position = {-2, 2},
          direction = defines.direction.west
        },
        {
          position = {-2, 0},
          direction = defines.direction.west
        },
        {
          position = {-2, -2},
          direction = defines.direction.west
        }
      }
    },

    connection_patches_connected =
    {
      sheet =
      {
        filename = "__base__/graphics/entity/nuclear-reactor/reactor-connect-patches.png",
        width = 32,
        height = 32,
        variation_count = 12,
        hr_version =
        {
          filename = "__base__/graphics/entity/nuclear-reactor/hr-reactor-connect-patches.png",
          width = 64,
          height = 64,
          variation_count = 12,
          scale = 0.5
        }
      }
    },

    connection_patches_disconnected =
    {
      sheet =
      {
        filename = "__base__/graphics/entity/nuclear-reactor/reactor-connect-patches.png",
        width = 32,
        height = 32,
        variation_count = 12,
        y = 32,
        hr_version =
        {
          filename = "__base__/graphics/entity/nuclear-reactor/hr-reactor-connect-patches.png",
          width = 64,
          height = 64,
          variation_count = 12,
          y = 64,
          scale = 0.5
        }
      }
    },

    connection_patches =
    {
      north =
      {
        filename = "__base__/graphics/entity/nuclear-reactor/connection-patch-north.png",
        width = 160,
        height = 15,
        shift = util.by_pixel(0, -72.5)
      },
      east =
      {
        filename = "__base__/graphics/entity/nuclear-reactor/connection-patch-east.png",
        width = 15,
        height = 160,
        shift = util.by_pixel(72.5, 0)
      },
      south =
      {
        filename = "__base__/graphics/entity/nuclear-reactor/connection-patch-south.png",
        width = 160,
        height = 15,
        shift = util.by_pixel(0, 72.5)
      },
      west =
      {
        filename = "__base__/graphics/entity/nuclear-reactor/connection-patch-west.png",
        width = 15,
        height = 160,
        shift = util.by_pixel(-72.5, 0)
      }
    },

    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65},
  },
  {
    type = "assembling-machine",
    name = "centrifuge",
    icon = "__base__/graphics/icons/centrifuge.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "centrifuge"},
    max_health = 350,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    resistances =
    {
      {
        type = "fire",
        percent = 70
      }
    },
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    drawing_box = {{-1.5, -2}, {1.5, 1.5}},

    always_draw_idle_animation = true,
    idle_animation =
    {
      layers =
      {
        -- Centrifuge A
        {
          filename = "__base__/graphics/entity/centrifuge/centrifuge-C.png",
          priority = "high",
          line_length = 8,
          width = 119,
          height = 107,
          frame_count = 64,
          shift = util.by_pixel(-0.5, -26.5),
          hr_version =
          {
            filename = "__base__/graphics/entity/centrifuge/hr-centrifuge-C.png",
            priority = "high",
            scale = 0.5,
            line_length = 8,
            width = 237,
            height = 214,
            frame_count = 64,
            shift = util.by_pixel(-0.25, -26.5),
          }
        },
        {
          filename = "__base__/graphics/entity/centrifuge/centrifuge-C-shadow.png",
          draw_as_shadow = true,
          priority = "high",
          line_length = 8,
          width = 132,
          height = 74,
          frame_count = 64,
          shift = util.by_pixel(20, -10),
          hr_version =
          {
            filename = "__base__/graphics/entity/centrifuge/hr-centrifuge-C-shadow.png",
            draw_as_shadow = true,
            priority = "high",
            scale = 0.5,
            line_length = 8,
            width = 279,
            height = 152,
            frame_count = 64,
            shift = util.by_pixel(16.75, -10),
          }
        },
        -- Centrifuge B
        {
          filename = "__base__/graphics/entity/centrifuge/centrifuge-B.png",
          priority = "high",
          line_length = 8,
          width = 78,
          height = 117,
          frame_count = 64,
          shift = util.by_pixel(23, 6.5),
          hr_version =
          {
            filename = "__base__/graphics/entity/centrifuge/hr-centrifuge-B.png",
            priority = "high",
            scale = 0.5,
            line_length = 8,
            width = 156,
            height = 234,
            frame_count = 64,
            shift = util.by_pixel(23, 6.5),
          }
        },
        {
          filename = "__base__/graphics/entity/centrifuge/centrifuge-B-shadow.png",
          draw_as_shadow = true,
          priority = "high",
          line_length = 8,
          width = 124,
          height = 74,
          frame_count = 64,
          shift = util.by_pixel(63, 16),
          hr_version =
          {
            filename = "__base__/graphics/entity/centrifuge/hr-centrifuge-B-shadow.png",
            draw_as_shadow = true,
            priority = "high",
            scale = 0.5,
            line_length = 8,
            width = 251,
            height = 149,
            frame_count = 64,
            shift = util.by_pixel(63.25, 15.25),
          }
        },
        -- Centrifuge A
        {
          filename = "__base__/graphics/entity/centrifuge/centrifuge-A.png",
          priority = "high",
          line_length = 8,
          width = 70,
          height = 123,
          frame_count = 64,
          shift = util.by_pixel(-26, 3.5),
          hr_version =
          {
            filename = "__base__/graphics/entity/centrifuge/hr-centrifuge-A.png",
            priority = "high",
            scale = 0.5,
            line_length = 8,
            width = 139,
            height = 246,
            frame_count = 64,
            shift = util.by_pixel(-26.25, 3.5),
          }
        },
        {
          filename = "__base__/graphics/entity/centrifuge/centrifuge-A-shadow.png",
          priority = "high",
          draw_as_shadow = true,
          line_length = 8,
          width = 108,
          height = 54,
          frame_count = 64,
          shift = util.by_pixel(6, 27),
          hr_version =
          {
            filename = "__base__/graphics/entity/centrifuge/hr-centrifuge-A-shadow.png",
            priority = "high",
            draw_as_shadow = true,
            scale = 0.5,
            line_length = 8,
            width = 230,
            height = 124,
            frame_count = 64,
            shift = util.by_pixel(8.5, 23.5),
          }
        }
      }
    },

    animation =
    {
      layers =
      {
        -- Centrifuge C
        {
          filename = "__base__/graphics/entity/centrifuge/centrifuge-C-light.png",
          priority = "high",
          blend_mode = "additive", -- centrifuge
          line_length = 8,
          width = 96,
          height = 104,
          frame_count = 64,
          shift = util.by_pixel(0, -27),

          hr_version =
          {
            filename = "__base__/graphics/entity/centrifuge/hr-centrifuge-C-light.png",
            priority = "high",
            scale = 0.5,
            blend_mode = "additive", -- centrifuge
            line_length = 8,
            width = 190,
            height = 207,
            frame_count = 64,
            shift = util.by_pixel(0, -27.25),
          }
        },
        -- Centrifuge B
        {
          filename = "__base__/graphics/entity/centrifuge/centrifuge-B-light.png",
          priority = "high",
          blend_mode = "additive", -- centrifuge
          line_length = 8,
          width = 65,
          height = 103,
          frame_count = 64,
          shift = util.by_pixel(16.5, 0.5),
          hr_version =
          {
            filename = "__base__/graphics/entity/centrifuge/hr-centrifuge-B-light.png",
            priority = "high",
            scale = 0.5,
            blend_mode = "additive", -- centrifuge
            line_length = 8,
            width = 131,
            height = 206,
            frame_count = 64,
            shift = util.by_pixel(16.75, 0.5),
          }
        },
        -- Centrifuge A
        {
          filename = "__base__/graphics/entity/centrifuge/centrifuge-A-light.png",
          priority = "high",
          blend_mode = "additive", -- centrifuge
          line_length = 8,
          width = 55,
          height = 98,
          frame_count = 64,
          shift = util.by_pixel(-23.5, -2),
          hr_version =
          {
            filename = "__base__/graphics/entity/centrifuge/hr-centrifuge-A-light.png",
            priority = "high",
            scale = 0.5,
            blend_mode = "additive", -- centrifuge
            line_length = 8,
            width = 108,
            height = 197,
            frame_count = 64,
            shift = util.by_pixel(-23.5, -1.75),
          }
        }
      }
    },

    working_visualisations =
    {
      {
        effect = "uranium-glow", -- changes alpha based on energy source light intensity
        light = {intensity = 0.6, size = 9.9, shift = {0.0, 0.0}, color = {r = 0.0, g = 1.0, b = 0.0}}
      }
    },

    working_visualisations_disabled =
    {
      {
        north_position = {0.0, 0.0},
        east_position = {0.0, 0.0},
        south_position = {0.0, 0.0},
        west_position = {0.0, 0.0},
        animation =
        {
          filename = "__base__/graphics/entity/centrifuge/centrifuge-C-light.png",
          priority = "high",
          blend_mode = "additive", -- centrifuge
          line_length = 8,
          width = 96,
          height = 104,
          frame_count = 64,
          shift = util.by_pixel(0, -27),

          hr_version =
          {
            filename = "__base__/graphics/entity/centrifuge/hr-centrifuge-C-light.png",
            priority = "high",
            scale = 0.5,
            blend_mode = "additive", -- centrifuge
            line_length = 8,
            width = 190,
            height = 207,
            frame_count = 64,
            shift = util.by_pixel(0, -27.25),
          }
        },
        --light = {intensity = 1, size = 1, color = {r = 1.0, g = 1.0, b = 1.0}}
      },
      {
        north_position = {0.0, 0.0},
        east_position = {0.0, 0.0},
        south_position = {0.0, 0.0},
        west_position = {0.0, 0.0},
        animation =
        {
          filename = "__base__/graphics/entity/centrifuge/centrifuge-B-light.png",
          priority = "high",
          blend_mode = "additive", -- centrifuge
          line_length = 8,
          width = 65,
          height = 103,
          frame_count = 64,
          shift = util.by_pixel(16.5, 0.5),
          hr_version =
          {
            filename = "__base__/graphics/entity/centrifuge/hr-centrifuge-B-light.png",
            priority = "high",
            scale = 0.5,
            blend_mode = "additive", -- centrifuge
            line_length = 8,
            width = 131,
            height = 206,
            frame_count = 64,
            shift = util.by_pixel(16.75, 0.5),
          }
        }
      },
      {
        north_position = {0.0, 0.0},
        east_position = {0.0, 0.0},
        south_position = {0.0, 0.0},
        west_position = {0.0, 0.0},
        animation =
        {
          filename = "__base__/graphics/entity/centrifuge/centrifuge-A-light.png",
          priority = "high",
          blend_mode = "additive", -- centrifuge
          line_length = 8,
          width = 55,
          height = 98,
          frame_count = 64,
          shift = util.by_pixel(-23.5, -2),
          hr_version =
          {
            filename = "__base__/graphics/entity/centrifuge/hr-centrifuge-A-light.png",
            priority = "high",
            scale = 0.5,
            blend_mode = "additive", -- centrifuge
            line_length = 8,
            width = 108,
            height = 197,
            frame_count = 64,
            shift = util.by_pixel(-23.5, -1.75),
          }
        }
      }
    },

    open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
    close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      sound =
      {
        {
          filename = "__base__/sound/assembling-machine-t2-1.ogg",
          volume = 0.8
        },
        {
          filename = "__base__/sound/assembling-machine-t2-2.ogg",
          volume = 0.8
        },
      },
      idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.6 },
      apparent_volume = 1.5,
    },
    crafting_speed = 0.75,
    crafting_categories = {"centrifuging"},
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions = 0.04 / 2.5
    },
    energy_usage = "350kW",
    ingredient_count = 2,
    module_specification =
    {
      module_slots = 2
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution"}
  },
  {
    type = "boiler",
    name = "heat-exchanger",
    icon = "__base__/graphics/icons/heat-boiler.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "heat-exchanger"},
    max_health = 200,
    corpse = "small-remnants",
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    mode = "output-to-separate-pipe",
    resistances =
    {
      {
        type = "fire",
        percent = 90
      },
      {
        type = "explosion",
        percent = 30
      },
      {
        type = "impact",
        percent = 30
      }
    },
    collision_box = {{-1.29, -0.79}, {1.29, 0.79}},
    selection_box = {{-1.5, -1}, {1.5, 1}},
    target_temperature = 500,
    fluid_box =
    {
      base_area = 1,
      height = 2,
      base_level = -1,
      pipe_covers = pipecoverspictures(),
      pipe_connections =
      {
        {type = "input-output", position = {-2, 0.5}},
        {type = "input-output", position = {2, 0.5}}
      },
      production_type = "input-output"
    },
    output_fluid_box =
    {
      base_area = 1,
      height = 2,
      base_level = 1,
      pipe_covers = pipecoverspictures(),
      pipe_connections =
      {
        {type = "output", position = {0, -1.5}}
      },
      production_type = "output"
    },
    fluid_input =
    {
      name = "water",
      amount = 0.0
    },
    fluid_output =
    {
      name = "steam",
      amount = 0.0
    },
    energy_consumption = "10MW",
    energy_source =
    {
      type = "heat",
      max_temperature = 1000,
      specific_heat = "1MJ",
      max_transfer = "2GW",
      connections =
      {
        {
          position = {0, 0.5},
          direction = defines.direction.south
        }
      },
      pipe_covers =

        make_4way_animation_from_spritesheet(
        {
          filename = "__base__/graphics/entity/heat-exchanger/heatex-endings.png",
          line_length = 4,
          width = 32,
          height = 32,
          direction_count = 4,
          hr_version = {
            filename = "__base__/graphics/entity/heat-exchanger/hr-heatex-endings.png",
            line_length = 4,
            width = 64,
            height = 64,
            direction_count = 4,
            scale = 0.5
          }
        })

    },
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/boiler.ogg",
        volume = 0.8
      },
      max_sounds_per_type = 3
    },

    structure =
    {
      north =
      {
        layers =
        {
          {
            filename = "__base__/graphics/entity/heat-exchanger/heatex-N-idle.png",
            priority = "extra-high",
            width = 131,
            height = 108,
            shift = util.by_pixel(-0.5, 4),
            hr_version = {
              filename = "__base__/graphics/entity/heat-exchanger/hr-heatex-N-idle.png",
              priority = "extra-high",
              width = 269,
              height = 221,
              shift = util.by_pixel(-1.25, 5.25),
              scale = 0.5
            }
          },
          {
            filename = "__base__/graphics/entity/boiler/boiler-N-shadow.png",
            priority = "extra-high",
            width = 137,
            height = 82,
            shift = util.by_pixel(20.5, 9),
            draw_as_shadow = true,
            hr_version = {
              filename = "__base__/graphics/entity/boiler/hr-boiler-N-shadow.png",
              priority = "extra-high",
              width = 274,
              height = 164,
              scale = 0.5,
              shift = util.by_pixel(20.5, 9),
              draw_as_shadow = true,
            }
          }
        }
      },
      east =
      {
        layers =
        {
          {
            filename = "__base__/graphics/entity/heat-exchanger/heatex-E-idle.png",
            priority = "extra-high",
            width = 102,
            height = 147,
            shift = util.by_pixel(-2, -0.5),
            hr_version = {
              filename = "__base__/graphics/entity/heat-exchanger/hr-heatex-E-idle.png",
              priority = "extra-high",
              width = 211,
              height = 301,
              shift = util.by_pixel(-1.75, 1.25),
              scale = 0.5
            }
          },
          {
            filename = "__base__/graphics/entity/boiler/boiler-E-shadow.png",
            priority = "extra-high",
            width = 92,
            height = 97,
            shift = util.by_pixel(30, 9.5),
            draw_as_shadow = true,
            hr_version = {
              filename = "__base__/graphics/entity/boiler/hr-boiler-E-shadow.png",
              priority = "extra-high",
              width = 184,
              height = 194,
              scale = 0.5,
              shift = util.by_pixel(30, 9.5),
              draw_as_shadow = true,
            }
          }
        }
      },
      south =
      {
        layers =
        {
          {
            filename = "__base__/graphics/entity/heat-exchanger/heatex-S-idle.png",
            priority = "extra-high",
            width = 128,
            height = 100,
            shift = util.by_pixel(3, 10),
            hr_version = {
              filename = "__base__/graphics/entity/heat-exchanger/hr-heatex-S-idle.png",
              priority = "extra-high",
              width = 260,
              height = 201,
              shift = util.by_pixel(4, 10.75),
              scale = 0.5
            }
          },
          {
            filename = "__base__/graphics/entity/boiler/boiler-S-shadow.png",
            priority = "extra-high",
            width = 156,
            height = 66,
            shift = util.by_pixel(30, 16),
            draw_as_shadow = true,
            hr_version = {
              filename = "__base__/graphics/entity/boiler/hr-boiler-S-shadow.png",
              priority = "extra-high",
              width = 311,
              height = 131,
              scale = 0.5,
              shift = util.by_pixel(29.75, 15.75),
              draw_as_shadow = true,
            }
          }
        }
      },
      west =
      {
        layers =
        {
          {
            filename = "__base__/graphics/entity/heat-exchanger/heatex-W-idle.png",
            priority = "extra-high",
            width = 96,
            height = 132,
            shift = util.by_pixel(1, 5),
            hr_version = {
              filename = "__base__/graphics/entity/heat-exchanger/hr-heatex-W-idle.png",
              priority = "extra-high",
              width = 196,
              height = 273,
              shift = util.by_pixel(1.5, 7.75),
              scale = 0.5
            }
          },
          {
            filename = "__base__/graphics/entity/boiler/boiler-W-shadow.png",
            priority = "extra-high",
            width = 103,
            height = 109,
            shift = util.by_pixel(19.5, 6.5),
            draw_as_shadow = true,
            hr_version = {
              filename = "__base__/graphics/entity/boiler/hr-boiler-W-shadow.png",
              priority = "extra-high",
              width = 206,
              height = 218,
              scale = 0.5,
              shift = util.by_pixel(19.5, 6.5),
              draw_as_shadow = true,
            }
          }
        }
      }
    },
    fire = {},
    fire_glow = {},
    burning_cooldown = 20
  },
  {
    type = "generator",
    name = "steam-turbine",
    icon = "__base__/graphics/icons/steam-turbine.png",
    flags = {"placeable-neutral","player-creation"},
    minable = {mining_time = 1, result = "steam-turbine"},
    max_health = 300,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    effectivity = 1,
    fluid_usage_per_tick = 1,
    maximum_temperature = 500,
    resistances =
    {
      {
        type = "fire",
        percent = 70
      }
    },
    fast_replaceable_group = "steam-engine",
    collision_box = {{-1.35, -2.35}, {1.35, 2.35}},
    selection_box = {{-1.5, -2.5}, {1.5, 2.5}},
    fluid_box =
    {
      base_area = 1,
      height = 2,
      base_level = -1,
      pipe_covers = pipecoverspictures(),
      pipe_connections =
      {
        { type = "input-output", position = {0, 3} },
        { type = "input-output", position = {0, -3} },
      },
      production_type = "input-output"
    },
    fluid_input =
    {
      name = "steam",
      amount = 0.0,
      minimum_temperature = 100.0
    },
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-output"
    },
    horizontal_animation =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/steam-turbine/steam-turbine-H.png",
          width = 160,
          height = 123,
          frame_count = 8,
          line_length = 4,
          shift = util.by_pixel(0, -2.5),
          hr_version = {
            filename = "__base__/graphics/entity/steam-turbine/hr-steam-turbine-H.png",
            width = 320,
            height = 245,
            frame_count = 8,
            line_length = 4,
            shift = util.by_pixel(0, -2.75),
            scale = 0.5
          },
        },
        {
          filename = "__base__/graphics/entity/steam-turbine/steam-turbine-H-shadow.png",
          width = 217,
          height = 74,
          frame_count = 8,
          line_length = 4,
          draw_as_shadow = true,
          shift = util.by_pixel(28.75, 18),
          hr_version = {
            filename = "__base__/graphics/entity/steam-turbine/hr-steam-turbine-H-shadow.png",
            width = 435,
            height = 150,
            frame_count = 8,
            line_length = 4,
            draw_as_shadow = true,
            shift = util.by_pixel(28.5, 18),
            scale = 0.5
          },
        },
      },
    },
    vertical_animation =
    {
     layers =
     {
        {
          filename = "__base__/graphics/entity/steam-turbine/steam-turbine-V.png",
          width = 108,
          height = 173,
          frame_count = 8,
          line_length = 4,
          shift = util.by_pixel(5, 6.5),
          hr_version = {
            filename = "__base__/graphics/entity/steam-turbine/hr-steam-turbine-V.png",
            width = 217,
            height = 347,
            frame_count = 8,
            line_length = 4,
            shift = util.by_pixel(4.75, 6.75),
            scale = 0.5
          },
        },
        {
          filename = "__base__/graphics/entity/steam-turbine/steam-turbine-V-shadow.png",
          width = 151,
          height = 131,
          frame_count = 8,
          line_length = 4,
          draw_as_shadow = true,
          shift = util.by_pixel(39.5, 24.5),
          hr_version = {
            filename = "__base__/graphics/entity/steam-turbine/hr-steam-turbine-V-shadow.png",
            width = 302,
            height = 260,
            frame_count = 8,
            line_length = 4,
            draw_as_shadow = true,
            shift = util.by_pixel(39.5, 24.5),
            scale = 0.5
          },
        },
      },
    },
    smoke =
    {
      {
        name = "turbine-smoke",
        north_position = {0.0, -1.0},
        east_position = {0.75, -0.75},
        frequency = 10 / 32,
        starting_vertical_speed = 0.08,
        slow_down_factor = 1,
        starting_frame_deviation = 60
      }
    },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/steam-engine-90bpm.ogg",
        volume = 0.6
      },
      match_speed_to_activity = true,
    },
    min_perceived_performance = 0.25,
    performance_to_sound_speedup = 0.5
  },
  {
    type = "heat-pipe",
    name = "heat-pipe",
    icon = "__base__/graphics/icons/heat-pipe.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "heat-pipe"},
    max_health = 200,
    corpse = "small-remnants",
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    resistances =
    {
      {
        type = "fire",
        percent = 90
      },
      {
        type = "explosion",
        percent = 30
      },
      {
        type = "impact",
        percent = 30
      }
    },
    collision_box = {{-0.3, -0.3}, {0.3, 0.3}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    minimum_glow_temperature = 350,
    glow_alpha_modifier = 0.6,
    heat_buffer =
    {
      max_temperature = 1000,
      specific_heat = "1MJ",
      max_transfer = "1GW",
      connections =
      {
        {
          position = {0, 0},
          direction = defines.direction.north
        },
        {
          position = {0, 0},
          direction = defines.direction.east
        },
        {
          position = {0, 0},
          direction = defines.direction.south
        },
        {
          position = {0, 0},
          direction = defines.direction.west
        }
      }
    },

    connection_sprites = make_heat_pipe_pictures("__base__/graphics/entity/heat-pipe/", "heat-pipe",
      {
        single = { name = "straight-vertical-single", ommit_number = true },
        straight_vertical = { variations = 6 },
        straight_horizontal = { variations = 6 },
        corner_right_up = { name = "corner-up-right", variations = 6 },
        corner_left_up = { name = "corner-up-left", variations = 6 },
        corner_right_down = { name = "corner-down-right", variations = 6 },
        corner_left_down = { name = "corner-down-left", variations = 6 },
        t_up = {},
        t_down = {},
        t_right = {},
        t_left = {},
        cross = { name = "t" },
        ending_up = {},
        ending_down = {},
        ending_right = {},
        ending_left = {},
      }),

    heat_glow_sprites = make_heat_pipe_pictures("__base__/graphics/entity/heat-pipe/", "heated",
      {
        single = { empty = true },
        straight_vertical = { variations = 6 },
        straight_horizontal = { variations = 6 },
        corner_right_up = { name = "corner-up-right", variations = 6 },
        corner_left_up = { name = "corner-up-left", variations = 6 },
        corner_right_down = { name = "corner-down-right", variations = 6 },
        corner_left_down = { name = "corner-down-left", variations = 6 },
        t_up = {},
        t_down = {},
        t_right = {},
        t_left = {},
        cross = { name = "t" },
        ending_up = {},
        ending_down = {},
        ending_right = {},
        ending_left = {},
      }),

    heat_glow_light = {
      --minimum_darkness = 0.3,
      color = { r = 1, g = 155/255, b = 0.05, a = 0 },
      --shift = {-0.6, 3.5},
      size = 2.5,
      intensity = 0.1,
      --add_perspective = true
    },
  },
  {
    type = "simple-entity-with-force",
    name = "simple-entity-with-force",
    render_layer = "object",
    icon = "__base__/graphics/icons/steel-chest.png",
    flags = {"placeable-neutral", "player-creation"},
    order = "s-e-w-f",
    minable = {mining_time = 1, result = "simple-entity-with-force"},
    max_health = 100,
    corpse = "small-remnants",
    collision_box = {{-0.35, -0.35}, {0.35, 0.35}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    picture =
    {
      filename = "__base__/graphics/entity/steel-chest/steel-chest.png",
      priority = "extra-high",
      width = 46,
      height = 33,
      shift = {0.25, 0.015625}
    }
  },
  {
    type = "simple-entity-with-owner",
    name = "simple-entity-with-owner",
    render_layer = "object",
    icon = "__base__/graphics/icons/wooden-chest.png",
    flags = {"placeable-neutral", "player-creation"},
    order = "s-e-w-o",
    minable = {mining_time = 1, result = "simple-entity-with-owner"},
    max_health = 100,
    corpse = "small-remnants",
    collision_box = {{-0.35, -0.35}, {0.35, 0.35}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    picture =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/iron-chest/iron-chest.png",
          priority = "extra-high",
          width = 46,
          height = 33,
          shift = {0.25, 0.015625},
        },
        {
          filename = "__base__/graphics/entity/iron-chest/iron-chest.png",
          priority = "extra-high",
          width = 10,
          height = 33,
          x = 18,
          shift = {0.25, 0.015625},
          apply_runtime_tint = true
        }
      }
    }
  },
  {
    type = "flame-thrower-explosion",
    name = "dummy-flame-thrower-explosion",
    flags = {"not-on-map"},
    animation_speed = 1,
    -- It needs some animation
    animations =
    {
      {
        filename = "__base__/graphics/entity/blue-beam/blue-beam.png",
        priority = "extra-high",
        width = 187,
        height = 1,
        frame_count = 6,
      }
    },
    light = {intensity = 0.2, size = 20},
    slow_down_factor = 1,
    smoke = "smoke-fast",
    smoke_count = 1,
    smoke_slow_down_factor = 0.95,
    damage = {amount = 0.25, type = "fire"}
  }
}
)

local uranium_cannon_shell_explosion = util.table.deepcopy(data.raw["explosion"]["big-explosion"])
uranium_cannon_shell_explosion.name = "uranium-cannon-shell-explosion"
uranium_cannon_shell_explosion.animations[1].tint = {r = 0.4, g = 1, b = 0.4}
data:extend({uranium_cannon_shell_explosion})

local uranium_cannon_explosion = util.table.deepcopy(data.raw["explosion"]["explosion"])
uranium_cannon_explosion.name = "uranium-cannon-explosion"
for k,v in pairs(uranium_cannon_explosion.animations) do
  v.tint = {r = 0.4, g = 1, b = 0.4}
end
data:extend({uranium_cannon_explosion})
