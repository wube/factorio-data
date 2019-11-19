require ("util")
require ("prototypes.entity.demo-rail-pictures")
require ("prototypes.entity.demo-pipecovers")
require ("prototypes.entity.demo-transport-belt-pictures")
require ("prototypes.entity.transport-belt-pictures")
require ("circuit-connector-sprites")
require ("prototypes.entity.assemblerpipes")
require ("prototypes.entity.demo-character-animations")
require ("prototypes.entity.laser-sounds")
require ("prototypes.entity.demo-gunshot-sounds")
require ("prototypes.entity.combinator-pictures")

logistic_chest_opened_duration = 7

rail_pictures = function()
  return rail_pictures_internal({
                                 {"metals", "metals", mipmap = true},
                                 {"backplates", "backplates", mipmap = true},
                                 {"ties", "ties", variations = 3},
                                 {"stone_path", "stone-path", variations = 3},
                                 {"stone_path_background", "stone-path-background", variations = 3},
                                 {"segment_visualisation_middle", "segment-visualisation-middle"},
                                 {"segment_visualisation_ending_front", "segment-visualisation-ending-1"},
                                 {"segment_visualisation_ending_back", "segment-visualisation-ending-2"},
                                 {"segment_visualisation_continuing_front", "segment-visualisation-continuing-1"},
                                 {"segment_visualisation_continuing_back", "segment-visualisation-continuing-2"}
                                })
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
      "__base__/graphics/entity/diesel-locomotive/hr-train-wheels-8.png"
    },
    line_length = 4,
    lines_per_file = 8,
    --shift = {0.015625, -0.453125}, original shifting from spritesheeter (likely needs doubling or halving)
    scale = 0.5
  }
}

function accumulator_picture(tint, repeat_count)
  return
  {
    layers =
    {
      {
        filename = "__base__/graphics/entity/accumulator/accumulator.png",
        priority = "high",
        width = 66,
        height = 94,
        repeat_count = repeat_count,
        shift = util.by_pixel(0, -10),
        tint = tint,
        animation_speed = 0.5,
        hr_version =
        {
          filename = "__base__/graphics/entity/accumulator/hr-accumulator.png",
          priority = "high",
          width = 130,
          height = 189,
          repeat_count = repeat_count,
          shift = util.by_pixel(0, -11),
          tint = tint,
          animation_speed = 0.5,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/accumulator/accumulator-shadow.png",
        priority = "high",
        width = 120,
        height = 54,
        repeat_count = repeat_count,
        shift = util.by_pixel(28, 6),
        draw_as_shadow = true,
        hr_version =
        {
          filename = "__base__/graphics/entity/accumulator/hr-accumulator-shadow.png",
          priority = "high",
          width = 234,
          height = 106,
          repeat_count = repeat_count,
          shift = util.by_pixel(29, 6),
          draw_as_shadow = true,
          scale = 0.5
        }
      }
    }
  }
end

function accumulator_charge()
  return
  {
    layers =
    {
      accumulator_picture({ r=1, g=1, b=1, a=1 } , 24),
      {
        filename = "__base__/graphics/entity/accumulator/accumulator-charge.png",
        priority = "high",
        width = 90,
        height = 100,
        line_length = 6,
        frame_count = 24,
        blend_mode = "additive",
        shift = util.by_pixel(0, -22),
        hr_version =
        {
          filename = "__base__/graphics/entity/accumulator/hr-accumulator-charge.png",
          priority = "high",
          width = 178,
          height = 206,
          line_length = 6,
          frame_count = 24,
          blend_mode = "additive",
          shift = util.by_pixel(0, -22),
          scale = 0.5
        }
      }
    }
  }
end

function accumulator_discharge()
  return
  {
    layers =
    {
      accumulator_picture({ r=1, g=1, b=1, a=1 } , 24),
      {
        filename = "__base__/graphics/entity/accumulator/accumulator-discharge.png",
        priority = "high",
        width = 88,
        height = 104,
        line_length = 6,
        frame_count = 24,
        blend_mode = "additive",
        shift = util.by_pixel(-2, -22),
        hr_version =
        {
          filename = "__base__/graphics/entity/accumulator/hr-accumulator-discharge.png",
          priority = "high",
          width = 170,
          height = 210,
          line_length = 6,
          frame_count = 24,
          blend_mode = "additive",
          shift = util.by_pixel(-1, -23),
          scale = 0.5
        }
      }
    }
  }
end

function drive_over_tie()
  return
  {
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
      }
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
    local start_frame = (anim.frame_count or 1) * idx
    local x = 0
    local y = 0
    if anim.line_length then
      y = anim.height * math.floor(start_frame / (anim.line_length or 1))
    else
      x = idx * anim.width
    end
    return
    {
      filename = anim.filename,
      priority = anim.priority or "high",
      x = x,
      y = y,
      width = anim.width,
      height = anim.height,
      frame_count = anim.frame_count or 1,
      line_length = anim.line_length,
      repeat_count = anim.repeat_count,
      shift = anim.shift,
      draw_as_shadow = anim.draw_as_shadow,
      force_hr_shadow = anim.force_hr_shadow,
      apply_runtime_tint = anim.apply_runtime_tint,
      scale = anim.scale or 1,
      tint = anim.tint
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

heat_glow_tint = {r=1.0, g=0.85, b=0.75}

function make_heat_pipe_pictures(path, name_prefix, data)
  local all_pictures = {}
  for key, t in pairs(data) do
    if t.empty then
      all_pictures[key] = { priority = "extra-high", filename = "__core__/graphics/empty.png", width = 1, height = 1 }
    else
      local tile_pictures = {}
      for i = 1, (t.variations or 1) do
        local sprite =
        {
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
            shift = t.shift
          }
        }
        table.insert(tile_pictures, sprite)
      end
      all_pictures[key] = tile_pictures
    end
  end
  return all_pictures
end

-- add heavy armor to the character animations
for _, animation in ipairs(data.raw["character"]["character"]["animations"]) do
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
    name = "fast-underground-belt",
    icon = "__base__/graphics/icons/fast-underground-belt.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.1, result = "fast-underground-belt"},
    max_health = 160,
    corpse = "fast-underground-belt-remnants",
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
    underground_remove_belts_sprite =
    {
      filename = "__core__/graphics/arrows/underground-lines-remove.png",
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
    belt_animation_set = fast_belt_animation_set,
    fast_replaceable_group = "transport-belt",
    next_upgrade = "express-underground-belt",
    speed = 0.0625,
    structure =
    {
      direction_in =
      {
        sheet =
        {
          filename = "__base__/graphics/entity/fast-underground-belt/fast-underground-belt-structure.png",
          priority = "extra-high",
          width = 96,
          height = 96,
          y = 96,
          hr_version =
          {
            filename = "__base__/graphics/entity/fast-underground-belt/hr-fast-underground-belt-structure.png",
            priority = "extra-high",
            width = 192,
            height = 192,
            y = 192,
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
          width = 96,
          height = 96,
          hr_version =
          {
            filename = "__base__/graphics/entity/fast-underground-belt/hr-fast-underground-belt-structure.png",
            priority = "extra-high",
            width = 192,
            height =192,
            scale = 0.5
          }
        }
      },
      direction_in_side_loading =
      {
        sheet =
        {
          filename = "__base__/graphics/entity/fast-underground-belt/fast-underground-belt-structure.png",
          priority = "extra-high",
          width = 96,
          height = 96,
          y = 96*3,
          hr_version =
          {
            filename = "__base__/graphics/entity/fast-underground-belt/hr-fast-underground-belt-structure.png",
            priority = "extra-high",
            width = 192,
            height = 192,
            y = 192*3,
            scale = 0.5
          }
        }
      },
      direction_out_side_loading =
      {
        sheet =
        {
          filename = "__base__/graphics/entity/fast-underground-belt/fast-underground-belt-structure.png",
          priority = "extra-high",
          width = 96,
          height = 96,
          y = 96*2,
          hr_version =
          {
            filename = "__base__/graphics/entity/fast-underground-belt/hr-fast-underground-belt-structure.png",
            priority = "extra-high",
            width = 192,
            height = 192,
            y = 192*2,
            scale = 0.5
          }
        }
      },
      back_patch =
      {
        sheet =
        {
          filename = "__base__/graphics/entity/fast-underground-belt/fast-underground-belt-structure-back-patch.png",
          priority = "extra-high",
          width = 96,
          height = 96,
          hr_version =
          {
            filename = "__base__/graphics/entity/fast-underground-belt/hr-fast-underground-belt-structure-back-patch.png",
            priority = "extra-high",
            width = 192,
            height = 192,
            scale = 0.5
          }
        }
      },
      front_patch =
      {
        sheet =
        {
          filename = "__base__/graphics/entity/fast-underground-belt/fast-underground-belt-structure-front-patch.png",
          priority = "extra-high",
          width = 96,
          height = 96,
          hr_version =
          {
            filename = "__base__/graphics/entity/fast-underground-belt/hr-fast-underground-belt-structure-front-patch.png",
            priority = "extra-high",
            width = 192,
            height = 192,
            scale = 0.5
          }
        }
      }
    }
  },
  {
    type = "underground-belt",
    name = "express-underground-belt",
    icon = "__base__/graphics/icons/express-underground-belt.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.1, result = "express-underground-belt"},
    max_health = 170,
    corpse = "express-underground-belt-remnants",
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
    underground_remove_belts_sprite =
    {
      filename = "__core__/graphics/arrows/underground-lines-remove.png",
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
    belt_animation_set = express_belt_animation_set,
    fast_replaceable_group = "transport-belt",
    speed = 0.09375,
    structure =
    {
      direction_in =
      {
        sheet =
        {
          filename = "__base__/graphics/entity/express-underground-belt/express-underground-belt-structure.png",
          priority = "extra-high",
          width = 96,
          height = 96,
          y = 96,
          hr_version =
          {
            filename = "__base__/graphics/entity/express-underground-belt/hr-express-underground-belt-structure.png",
            priority = "extra-high",
            width = 192,
            height = 192,
            y = 192,
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
          width = 96,
          height = 96,
          hr_version =
          {
            filename = "__base__/graphics/entity/express-underground-belt/hr-express-underground-belt-structure.png",
            priority = "extra-high",
            width = 192,
            height =192,
            scale = 0.5
          }
        }
      },
      direction_in_side_loading =
      {
        sheet =
        {
          filename = "__base__/graphics/entity/express-underground-belt/express-underground-belt-structure.png",
          priority = "extra-high",
          width = 96,
          height = 96,
          y = 96*3,
          hr_version =
          {
            filename = "__base__/graphics/entity/express-underground-belt/hr-express-underground-belt-structure.png",
            priority = "extra-high",
            width = 192,
            height = 192,
            y = 192*3,
            scale = 0.5
          }
        }
      },
      direction_out_side_loading =
      {
        sheet =
        {
          filename = "__base__/graphics/entity/express-underground-belt/express-underground-belt-structure.png",
          priority = "extra-high",
          width = 96,
          height = 96,
          y = 96*2,
          hr_version =
          {
            filename = "__base__/graphics/entity/express-underground-belt/hr-express-underground-belt-structure.png",
            priority = "extra-high",
            width = 192,
            height = 192,
            y = 192*2,
            scale = 0.5
          }
        }
      },
      back_patch =
      {
        sheet =
        {
          filename = "__base__/graphics/entity/express-underground-belt/express-underground-belt-structure-back-patch.png",
          priority = "extra-high",
          width = 96,
          height = 96,
          hr_version =
          {
            filename = "__base__/graphics/entity/express-underground-belt/hr-express-underground-belt-structure-back-patch.png",
            priority = "extra-high",
            width = 192,
            height = 192,
            scale = 0.5
          }
        }
      },
      front_patch =
      {
        sheet =
        {
          filename = "__base__/graphics/entity/express-underground-belt/express-underground-belt-structure-front-patch.png",
          priority = "extra-high",
          width = 96,
          height = 96,
          hr_version =
          {
            filename = "__base__/graphics/entity/express-underground-belt/hr-express-underground-belt-structure-front-patch.png",
            priority = "extra-high",
            width = 192,
            height = 192,
            scale = 0.5
          }
        }
      }
    }
  },
  {
    type = "loader",
    name = "fast-loader",
    icon = "__base__/graphics/icons/fast-loader.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation", "fast-replaceable-no-build-while-moving"},
    minable = {mining_time = 0.1, result = "fast-loader"},
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
    belt_animation_set = fast_belt_animation_set,
    fast_replaceable_group = "loader",
    speed = 0.0625,
    structure_render_layer = "lower-object",
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
    }
  },
  {
    type = "loader",
    name = "express-loader",
    icon = "__base__/graphics/icons/express-loader.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation", "fast-replaceable-no-build-while-moving"},
    minable = {mining_time = 0.1, result = "express-loader"},
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
    belt_animation_set = express_belt_animation_set,
    fast_replaceable_group = "loader",
    speed = 0.09375,
    structure_render_layer = "lower-object",
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
    }
  },
  {
    type = "splitter",
    name = "fast-splitter",
    icon = "__base__/graphics/icons/fast-splitter.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.1, result = "fast-splitter"},
    max_health = 180,
    corpse = "fast-splitter-remnants",
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
    belt_animation_set = fast_belt_animation_set,
    fast_replaceable_group = "transport-belt",
    next_upgrade = "express-splitter",
    speed = 0.0625,
    structure =
    {
      north =
      {
        filename = "__base__/graphics/entity/fast-splitter/fast-splitter-north.png",
        frame_count = 32,
        line_length = 8,
        priority = "extra-high",
        width = 82,
        height = 36,
        shift = util.by_pixel(6, 0),
        hr_version =
        {
          filename = "__base__/graphics/entity/fast-splitter/hr-fast-splitter-north.png",
          frame_count = 32,
          line_length = 8,
          priority = "extra-high",
          width = 160,
          height = 70,
          shift = util.by_pixel(7, 0),
          scale = 0.5
        }
      },
      east =
      {
        filename = "__base__/graphics/entity/fast-splitter/fast-splitter-east.png",
        frame_count = 32,
        line_length = 8,
        priority = "extra-high",
        width = 46,
        height = 80,
        shift = util.by_pixel(4, -6),
        hr_version =
        {
          filename = "__base__/graphics/entity/fast-splitter/hr-fast-splitter-east.png",
          frame_count = 32,
          line_length = 8,
          priority = "extra-high",
          width = 90,
          height = 160,
          shift = util.by_pixel(4, -6),
          scale = 0.5
        }
      },
      south =
      {
        filename = "__base__/graphics/entity/fast-splitter/fast-splitter-south.png",
        frame_count = 32,
        line_length = 8,
        priority = "extra-high",
        width = 82,
        height = 32,
        shift = util.by_pixel(4, 0),
        hr_version =
        {
          filename = "__base__/graphics/entity/fast-splitter/hr-fast-splitter-south.png",
          frame_count = 32,
          line_length = 8,
          priority = "extra-high",
          width = 164,
          height = 64,
          shift = util.by_pixel(4, 0),
          scale = 0.5
        }
      },
      west =
      {
        filename = "__base__/graphics/entity/fast-splitter/fast-splitter-west.png",
        frame_count = 32,
        line_length = 8,
        priority = "extra-high",
        width = 46,
        height = 76,
        shift = util.by_pixel(6, -4),
        hr_version =
        {
          filename = "__base__/graphics/entity/fast-splitter/hr-fast-splitter-west.png",
          frame_count = 32,
          line_length = 8,
          priority = "extra-high",
          width = 90,
          height = 150,
          shift = util.by_pixel(6, -4),
          scale = 0.5
        }
      }
    }
  },
  {
    type = "splitter",
    name = "express-splitter",
    icon = "__base__/graphics/icons/express-splitter.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.1, result = "express-splitter"},
    max_health = 190,
    corpse = "express-splitter-remnants",
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
    belt_animation_set = express_belt_animation_set,
    fast_replaceable_group = "transport-belt",
    speed = 0.09375,
    structure =
    {
      north =
      {
        filename = "__base__/graphics/entity/express-splitter/express-splitter-north.png",
        frame_count = 32,
        line_length = 8,
        priority = "extra-high",
        width = 82,
        height = 36,
        shift = util.by_pixel(6, 0),
        hr_version =
        {
          filename = "__base__/graphics/entity/express-splitter/hr-express-splitter-north.png",
          frame_count = 32,
          line_length = 8,
          priority = "extra-high",
          width = 160,
          height = 70,
          shift = util.by_pixel(7, 0),
          scale = 0.5
        }
      },
      east =
      {
        filename = "__base__/graphics/entity/express-splitter/express-splitter-east.png",
        frame_count = 32,
        line_length = 8,
        priority = "extra-high",
        width = 46,
        height = 80,
        shift = util.by_pixel(4, -6),
        hr_version =
        {
          filename = "__base__/graphics/entity/express-splitter/hr-express-splitter-east.png",
          frame_count = 32,
          line_length = 8,
          priority = "extra-high",
          width = 90,
          height = 160,
          shift = util.by_pixel(4, -6),
          scale = 0.5
        }
      },
      south =
      {
        filename = "__base__/graphics/entity/express-splitter/express-splitter-south.png",
        frame_count = 32,
        line_length = 8,
        priority = "extra-high",
        width = 82,
        height = 32,
        shift = util.by_pixel(4, 0),
        hr_version =
        {
          filename = "__base__/graphics/entity/express-splitter/hr-express-splitter-south.png",
          frame_count = 32,
          line_length = 8,
          priority = "extra-high",
          width = 164,
          height = 64,
          shift = util.by_pixel(4, 0),
          scale = 0.5
        }
      },
      west =
      {
        filename = "__base__/graphics/entity/express-splitter/express-splitter-west.png",
        frame_count = 32,
        line_length = 8,
        priority = "extra-high",
        width = 46,
        height = 76,
        shift = util.by_pixel(6, -4),
        hr_version =
        {
          filename = "__base__/graphics/entity/express-splitter/hr-express-splitter-west.png",
          frame_count = 32,
          line_length = 8,
          priority = "extra-high",
          width = 94,
          height = 150,
          shift = util.by_pixel(5, -4),
          scale = 0.5
        }
      }
    }
  },
  {
    type = "transport-belt",
    name = "fast-transport-belt",
    icon = "__base__/graphics/icons/fast-transport-belt.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.1, result = "fast-transport-belt"},
    max_health = 160,
    corpse = "fast-transport-belt-remnants",
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
        filename = "__base__/sound/transport-belt.ogg",
        volume = 0.4
      },
      persistent = true
    },
    animation_speed_coefficient = 32,
    belt_animation_set = fast_belt_animation_set,
    fast_replaceable_group = "transport-belt",
    next_upgrade = "express-transport-belt",
    speed = 0.0625,
    connector_frame_sprites = transport_belt_connector_frame_sprites,
    circuit_wire_connection_points = circuit_connector_definitions["belt"].points,
    circuit_connector_sprites = circuit_connector_definitions["belt"].sprites,
    circuit_wire_max_distance = transport_belt_circuit_wire_max_distance
  },
  {
    type = "transport-belt",
    name = "express-transport-belt",
    icon = "__base__/graphics/icons/express-transport-belt.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.1, result = "express-transport-belt"},
    max_health = 170,
    corpse = "express-transport-belt-remnants",
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
        filename = "__base__/sound/transport-belt.ogg",
        volume = 0.4
      },
      persistent = true
    },
    animation_speed_coefficient = 32,
    belt_animation_set = express_belt_animation_set,
    fast_replaceable_group = "transport-belt",
    speed = 0.09375,
    connector_frame_sprites = transport_belt_connector_frame_sprites,
    circuit_wire_connection_points = circuit_connector_definitions["belt"].points,
    circuit_connector_sprites = circuit_connector_definitions["belt"].sprites,
    circuit_wire_max_distance = transport_belt_circuit_wire_max_distance
  },
  {
    type = "assembling-machine",
    name = "assembling-machine-3",
    icon = "__base__/graphics/icons/assembling-machine-3.png",
    icon_size = 32,
    flags = {"placeable-neutral","placeable-player", "player-creation"},
    minable = {mining_time = 0.2, result = "assembling-machine-3"},
    max_health = 400,
    dying_explosion = "medium-explosion",
    corpse = "medium-remnants",
    alert_icon_shift = util.by_pixel(-3, -12),
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
      sound =
      {
        {
          filename = "__base__/sound/assembling-machine-t3-1.ogg",
          volume = 0.8
        },
        {
          filename = "__base__/sound/assembling-machine-t3-2.ogg",
          volume = 0.8
        }
      },
      idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.6 },
      apparent_volume = 1.5
    },
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    drawing_box = {{-1.5, -1.7}, {1.5, 1.5}},
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
          hr_version =
          {
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
          hr_version =
          {
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
        }
      }
    },

    crafting_categories = {"basic-crafting", "crafting", "advanced-crafting", "crafting-with-fluid"},
    crafting_speed = 1.25,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = 2
    },
    energy_usage = "375kW",
    module_specification =
    {
      module_slots = 4
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution"}
  },
  {
    type = "car",
    name = "tank",
    icon = "__base__/graphics/icons/tank.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation", "placeable-off-grid", "not-flammable"},
    minable = {mining_time = 0.5, result = "tank"},
    mined_sound = {filename = "__core__/sound/deconstruct-medium.ogg"},
    max_health = 2000,
    corpse = "tank-remnants",
    dying_explosion = "medium-explosion",
    alert_icon_shift = util.by_pixel(-4, -13),
    immune_to_tree_impacts = true,
    immune_to_rock_impacts = true,
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
        decrease = 0,
        percent = 70
      }
    },
    collision_box = {{-0.9, -1.3}, {0.9, 1.3}},
    selection_box = {{-0.9, -1.3}, {0.9, 1.3}},
    drawing_box = {{-1.8, -1.8}, {1.8, 1.5}},
    effectivity = 0.9,
    braking_power = "400kW",
    burner =
    {
      fuel_category = "chemical",
      effectivity = 1,
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
          height = 200
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
          width = 135,
          height = 106,
          frame_count = 2,
          direction_count = 64,
          shift = util.by_pixel(-4.5, -10),
          animation_speed = 8,
          max_advance = 1,
          stripes =
          {
            {
             filename = "__base__/graphics/entity/tank/tank-base-1.png",
             width_in_frames = 2,
             height_in_frames = 16
            },
            {
             filename = "__base__/graphics/entity/tank/tank-base-2.png",
             width_in_frames = 2,
             height_in_frames = 16
            },
            {
             filename = "__base__/graphics/entity/tank/tank-base-3.png",
             width_in_frames = 2,
             height_in_frames = 16
            },
            {
             filename = "__base__/graphics/entity/tank/tank-base-4.png",
             width_in_frames = 2,
             height_in_frames = 16
            }
          },
          hr_version =
          {
            priority = "low",
            width = 269,
            height = 212,
            frame_count = 2,
            direction_count = 64,
            shift = util.by_pixel(-4.75, -10),
            animation_speed = 8,
            max_advance = 1,
            stripes =
            {
              {
               filename = "__base__/graphics/entity/tank/hr-tank-base-1.png",
               width_in_frames = 2,
               height_in_frames = 16
              },
              {
               filename = "__base__/graphics/entity/tank/hr-tank-base-2.png",
               width_in_frames = 2,
               height_in_frames = 16
              },
              {
               filename = "__base__/graphics/entity/tank/hr-tank-base-3.png",
               width_in_frames = 2,
               height_in_frames = 16
              },
              {
               filename = "__base__/graphics/entity/tank/hr-tank-base-4.png",
               width_in_frames = 2,
               height_in_frames = 16
              }
            },
            scale = 0.5
          }
        },
        {
          priority = "low",
          width = 104,
          height = 84,
          frame_count = 2,
          apply_runtime_tint = true,
          direction_count = 64,
          shift = util.by_pixel(-5, -21),
          max_advance = 1,
          line_length = 2,
          stripes = util.multiplystripes(2,
          {
            {
              filename = "__base__/graphics/entity/tank/tank-base-mask-1.png",
              width_in_frames = 1,
              height_in_frames = 22
            },
            {
              filename = "__base__/graphics/entity/tank/tank-base-mask-2.png",
              width_in_frames = 1,
              height_in_frames = 22
            },
            {
              filename = "__base__/graphics/entity/tank/tank-base-mask-3.png",
              width_in_frames = 1,
              height_in_frames = 20
            }
          }),
          hr_version =
          {
            priority = "low",
            width = 207,
            height = 166,
            frame_count = 2,
            apply_runtime_tint = true,
            direction_count = 64,
            shift = util.by_pixel(-4.75, -21),
            max_advance = 1,
            line_length = 2,
            stripes = util.multiplystripes(2,
            {
              {
                filename = "__base__/graphics/entity/tank/hr-tank-base-mask-1.png",
                width_in_frames = 1,
                height_in_frames = 22
              },
              {
                filename = "__base__/graphics/entity/tank/hr-tank-base-mask-2.png",
                width_in_frames = 1,
                height_in_frames = 22
              },
              {
                filename = "__base__/graphics/entity/tank/hr-tank-base-mask-3.png",
                width_in_frames = 1,
                height_in_frames = 20
              }
            }),
            scale = 0.5
          }
        },
        {
          priority = "low",
          width = 151,
          height = 98,
          frame_count = 2,
          draw_as_shadow = true,
          direction_count = 64,
          shift = util.by_pixel(17.5, 7),
          max_advance = 1,
          stripes = util.multiplystripes(2,
          {
           {
            filename = "__base__/graphics/entity/tank/tank-base-shadow-1.png",
            width_in_frames = 1,
            height_in_frames = 16
           },
           {
            filename = "__base__/graphics/entity/tank/tank-base-shadow-2.png",
            width_in_frames = 1,
            height_in_frames = 16
           },
           {
            filename = "__base__/graphics/entity/tank/tank-base-shadow-3.png",
            width_in_frames = 1,
            height_in_frames = 16
           },
           {
            filename = "__base__/graphics/entity/tank/tank-base-shadow-4.png",
            width_in_frames = 1,
            height_in_frames = 16
           }
          }),
          hr_version =
          {
            priority = "low",
            width = 301,
            height = 194,
            frame_count = 2,
            draw_as_shadow = true,
            direction_count = 64,
            shift = util.by_pixel(17.75, 7),
            max_advance = 1,
            stripes = util.multiplystripes(2,
            {
             {
              filename = "__base__/graphics/entity/tank/hr-tank-base-shadow-1.png",
              width_in_frames = 1,
              height_in_frames = 16
             },
             {
              filename = "__base__/graphics/entity/tank/hr-tank-base-shadow-2.png",
              width_in_frames = 1,
              height_in_frames = 16
             },
             {
              filename = "__base__/graphics/entity/tank/hr-tank-base-shadow-3.png",
              width_in_frames = 1,
              height_in_frames = 16
             },
             {
              filename = "__base__/graphics/entity/tank/hr-tank-base-shadow-4.png",
              width_in_frames = 1,
              height_in_frames = 16
             }
            }),
            scale = 0.5
          }
        }
      }
    },
    turret_animation =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/tank/tank-turret.png",
          priority = "low",
          line_length = 8,
          width = 90,
          height = 67,
          frame_count = 1,
          direction_count = 64,
          shift = util.by_pixel(-5, -34.5),
          animation_speed = 8,
          hr_version =
          {
            filename = "__base__/graphics/entity/tank/hr-tank-turret.png",
            priority = "low",
            line_length = 8,
            width = 179,
            height = 132,
            frame_count = 1,
            direction_count = 64,
            shift = util.by_pixel(-4.75, -34.5),
            animation_speed = 8,
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/tank/tank-turret-mask.png",
          priority = "low",
          line_length = 8,
          width = 36,
          height = 33,
          frame_count = 1,
          apply_runtime_tint = true,
          direction_count = 64,
          shift = util.by_pixel(-5, -35.5),
          hr_version =
          {
            filename = "__base__/graphics/entity/tank/hr-tank-turret-mask.png",
            priority = "low",
            line_length = 8,
            width = 72,
            height = 66,
            frame_count = 1,
            apply_runtime_tint = true,
            direction_count = 64,
            shift = util.by_pixel(-5, -35.5),
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/tank/tank-turret-shadow.png",
          priority = "low",
          line_length = 8,
          width = 97,
          height = 67,
          frame_count = 1,
          draw_as_shadow = true,
          direction_count = 64,
          shift = util.by_pixel(51.5, 6.5),
          hr_version =
          {
            filename = "__base__/graphics/entity/tank/hr-tank-turret-shadow.png",
            priority = "low",
            line_length = 8,
            width = 193,
            height = 134,
            frame_count = 1,
            draw_as_shadow = true,
            direction_count = 64,
            shift = util.by_pixel(51.25, 6.5),
            scale = 0.5
          }
        }
      }
    },
    turret_rotation_speed = 0.35 / 60,
    turret_return_timeout = 300,
    sound_no_fuel =
    {
      {
        filename = "__base__/sound/fight/tank-no-fuel-1.ogg",
        volume = 0.6
      }
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
      match_speed_to_activity = true
    },
    open_sound = { filename = "__base__/sound/car-door-open.ogg", volume=0.7 },
    close_sound = { filename = "__base__/sound/car-door-close.ogg", volume = 0.7 },
    rotation_speed = 0.0035,
    tank_driving = true,
    weight = 20000,
    inventory_size = 80,
    guns = { "tank-cannon", "tank-machine-gun", "tank-flamethrower" }
  },
  {
    type = "container",
    name = "steel-chest",
    icon = "__base__/graphics/icons/steel-chest.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.2, result = "steel-chest"},
    max_health = 350,
    corpse = "steel-chest-remnants",
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
      layers =
      {
        {
          filename = "__base__/graphics/entity/steel-chest/steel-chest.png",
          priority = "extra-high",
          width = 32,
          height = 40,
          shift = util.by_pixel(0, -0.5),
          hr_version =
          {
            filename = "__base__/graphics/entity/steel-chest/hr-steel-chest.png",
            priority = "extra-high",
            width = 64,
            height = 80,
            shift = util.by_pixel(-0.25, -0.5),
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/steel-chest/steel-chest-shadow.png",
          priority = "extra-high",
          width = 56,
          height = 22,
          shift = util.by_pixel(12, 7.5),
          draw_as_shadow = true,
          hr_version =
          {
            filename = "__base__/graphics/entity/steel-chest/hr-steel-chest-shadow.png",
            priority = "extra-high",
            width = 110,
            height = 46,
            shift = util.by_pixel(12.25, 8),
            draw_as_shadow = true,
            scale = 0.5
          }
        }
      }
    },
    circuit_wire_connection_point = circuit_connector_definitions["chest"].points,
    circuit_connector_sprites = circuit_connector_definitions["chest"].sprites,
    circuit_wire_max_distance = default_circuit_wire_max_distance
  },
  {
    type = "inserter",
    name = "stack-inserter",
    icon = "__base__/graphics/icons/stack-inserter.png",
    icon_size = 32,
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    stack = true,
    minable = { mining_time = 0.1, result = "stack-inserter" },
    max_health = 160,
    corpse = "stack-inserter-remnants",
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
    energy_per_movement = "20KJ",
    energy_per_rotation = "20KJ",
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
      hr_version =
      {
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
      hr_version =
      {
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
      hr_version =
      {
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
      hr_version =
      {
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
      hr_version =
      {
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
      hr_version =
      {
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
        hr_version =
        {
          filename = "__base__/graphics/entity/stack-inserter/hr-stack-inserter-platform.png",
          priority = "extra-high",
          width = 105,
          height = 79,
          shift = util.by_pixel(1.5, 7.5-1),
          scale = 0.5
        }
      }
    },
    circuit_wire_connection_points = circuit_connector_definitions["inserter"].points,
    circuit_connector_sprites = circuit_connector_definitions["inserter"].sprites,
    circuit_wire_max_distance = inserter_circuit_wire_max_distance,
    default_stack_control_input_signal = inserter_default_stack_control_input_signal
  },

  {
    type = "inserter",
    name = "stack-filter-inserter",
    icon = "__base__/graphics/icons/stack-filter-inserter.png",
    icon_size = 32,
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    stack = true,
    filter_count = 1,
    minable = { mining_time = 0.1, result = "stack-filter-inserter" },
    max_health = 160,
    corpse = "stack-filter-inserter-remnants",
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
    energy_per_movement = "20KJ",
    energy_per_rotation = "20KJ",
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
      hr_version =
      {
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
      hr_version =
      {
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
      hr_version =
      {
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
      hr_version =
      {
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
      hr_version =
      {
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
      hr_version =
      {
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
        hr_version =
        {
          filename = "__base__/graphics/entity/stack-filter-inserter/hr-stack-filter-inserter-platform.png",
          priority = "extra-high",
          width = 105,
          height = 79,
          shift = util.by_pixel(1.5, 7.5-1),
          scale = 0.5
        }
      }
    },
    circuit_wire_connection_points = circuit_connector_definitions["inserter"].points,
    circuit_connector_sprites = circuit_connector_definitions["inserter"].sprites,
    circuit_wire_max_distance = inserter_circuit_wire_max_distance,
    default_stack_control_input_signal = inserter_default_stack_control_input_signal
  },

  {
    type = "inserter",
    name = "filter-inserter",
    icon = "__base__/graphics/icons/filter-inserter.png",
    icon_size = 32,
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 0.1, result = "filter-inserter"},
    max_health = 150,
    corpse = "filter-inserter-remnants",
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
    energy_per_movement = "8KJ",
    energy_per_rotation = "8KJ",
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
      hr_version =
      {
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
      hr_version =
      {
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
      hr_version =
      {
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
      hr_version =
      {
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
      hr_version =
      {
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
      hr_version =
      {
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
        hr_version =
        {
          filename = "__base__/graphics/entity/filter-inserter/hr-filter-inserter-platform.png",
          priority = "extra-high",
          width = 105,
          height = 79,
          shift = util.by_pixel(1.5, 7.5-1),
          scale = 0.5
        }
      }
    },

    circuit_wire_connection_points = circuit_connector_definitions["inserter"].points,
    circuit_connector_sprites = circuit_connector_definitions["inserter"].sprites,
    circuit_wire_max_distance = inserter_circuit_wire_max_distance,
    default_stack_control_input_signal = inserter_default_stack_control_input_signal
  },
  {
    type = "solar-panel",
    name = "solar-panel",
    icon = "__base__/graphics/icons/solar-panel.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.1, result = "solar-panel"},
    max_health = 200,
    corpse = "solar-panel-remnants",
    collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    energy_source =
    {
      type = "electric",
      usage_priority = "solar"
    },
    picture =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/solar-panel/solar-panel.png",
          priority = "high",
          width = 116,
          height = 112,
          shift = util.by_pixel(-3, 3),
          hr_version =
          {
            filename = "__base__/graphics/entity/solar-panel/hr-solar-panel.png",
            priority = "high",
            width = 230,
            height = 224,
            shift = util.by_pixel(-3, 3.5),
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/solar-panel/solar-panel-shadow.png",
          priority = "high",
          width = 112,
          height = 90,
          shift = util.by_pixel(10, 6),
          draw_as_shadow = true,
          hr_version =
          {
            filename = "__base__/graphics/entity/solar-panel/hr-solar-panel-shadow.png",
            priority = "high",
            width = 220,
            height = 180,
            shift = util.by_pixel(9.5, 6),
            draw_as_shadow = true,
            scale = 0.5
          }
        }
      }
    },
    overlay =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/solar-panel/solar-panel-shadow-overlay.png",
          priority = "high",
          width = 108,
          height = 90,
          shift = util.by_pixel(11, 6),
          hr_version =
          {
            filename = "__base__/graphics/entity/solar-panel/hr-solar-panel-shadow-overlay.png",
            priority = "high",
            width = 214,
            height = 180,
            shift = util.by_pixel(10.5, 6),
            scale = 0.5
          }
        }
      }
    },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    production = "60kW"
  },
  {
    type = "locomotive",
    name = "locomotive",
    icon = "__base__/graphics/icons/diesel-locomotive.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation", "placeable-off-grid"},
    minable = {mining_time = 0.5, result = "locomotive"},
    mined_sound = {filename = "__core__/sound/deconstruct-medium.ogg"},
    max_health = 1000,
    corpse = "locomotive-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-0.6, -2.6}, {0.6, 2.6}},
    selection_box = {{-1, -3}, {1, 3}},
    drawing_box = {{-1, -4}, {1, 3}},
    alert_icon_shift = util.by_pixel(0, -24),
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
        decrease = 3,
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
          starting_vertical_speed_deviation = 0.1
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
          slice = 4,
          priority = "very-low",
          width = 238,
          height = 230,
          direction_count = 256,
          allow_low_quality_rotation = true,
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
            slice = 4,
            width = 474,
            height = 458,
            direction_count = 256,
            allow_low_quality_rotation = true,
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
          slice = 4,
          width = 236,
          height = 228,
          direction_count = 256,
          allow_low_quality_rotation = true,
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
              slice = 4,
              width = 472,
              height = 456,
              direction_count = 256,
              allow_low_quality_rotation = true,
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
          slice = 4,
          flags = { "shadow" },
          width = 253,
          height = 212,
          direction_count = 256,
          draw_as_shadow = true,
          allow_low_quality_rotation = true,
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
    minimap_representation =
    {
      filename = "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-minimap-representation.png",
      flags = {"icon"},
      size = {20, 40},
      scale = 0.5
    },
    selected_minimap_representation =
    {
      filename = "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-selected-minimap-representation.png",
      flags = {"icon"},
      size = {20, 40},
      scale = 0.5
    },
    wheels = standard_train_wheels,
    stop_trigger =
    {
      -- left side
      {
        type = "create-trivial-smoke",
        repeat_count = 125,
        smoke_name = "smoke-train-stop",
        initial_height = 0,
        -- smoke goes to the left
        speed = {-0.03, 0},
        speed_multiplier = 0.75,
        speed_multiplier_deviation = 1.1,
        offset_deviation = {{-0.75, -2.7}, {-0.3, 2.7}}
      },
      -- right side
      {
        type = "create-trivial-smoke",
        repeat_count = 125,
        smoke_name = "smoke-train-stop",
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
          }
        }
      }
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
      match_speed_to_activity = true
    },
    open_sound = { filename = "__base__/sound/car-door-open.ogg", volume=0.7 },
    close_sound = { filename = "__base__/sound/car-door-close.ogg", volume = 0.7 },
    sound_minimum_speed = 0.5;
  },
  {
    type = "cargo-wagon",
    name = "cargo-wagon",
    icon = "__base__/graphics/icons/cargo-wagon.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation", "placeable-off-grid"},
    inventory_size = 40,
    minable = {mining_time = 0.5, result = "cargo-wagon"},
    mined_sound = {filename = "__core__/sound/deconstruct-medium.ogg"},
    max_health = 600,
    corpse = "cargo-wagon-remnants",
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
        decrease = 3,
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
          slice = 4,
          width = 222,
          height = 205,
          back_equals_front = true,
          direction_count = 128,
          allow_low_quality_rotation = true,
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
            slice = 4,
            width = 442,
            height = 407,
            back_equals_front = true,
            direction_count = 128,
            allow_low_quality_rotation = true,
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
          slice = 4,
          width = 196,
          height = 174,
          direction_count = 128,
          allow_low_quality_rotation = true,
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
            slice = 4,
            width = 406,
            height = 371,
            direction_count = 128,
            allow_low_quality_rotation = true,
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
          slice = 4,
          width = 246,
          height = 201,
          back_equals_front = true,
          draw_as_shadow = true,
          direction_count = 128,
          allow_low_quality_rotation = true,
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
            slice = 4,
            width = 490,
            height = 401,
            back_equals_front = true,
            draw_as_shadow = true,
            direction_count = 128,
            allow_low_quality_rotation = true,
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
    minimap_representation =
    {
      filename = "__base__/graphics/entity/cargo-wagon/cargo-wagon-minimap-representation.png",
      flags = {"icon"},
      size = {20, 40},
      scale = 0.5
    },
    selected_minimap_representation =
    {
      filename = "__base__/graphics/entity/cargo-wagon/cargo-wagon-selected-minimap-representation.png",
      flags = {"icon"},
      size = {20, 40},
      scale = 0.5
    },
    wheels = standard_train_wheels,
    drive_over_tie_trigger = drive_over_tie(),
    tie_distance = 50,
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/train-wheels.ogg",
        volume = 0.6
      },
      match_volume_to_activity = true
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
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation", "placeable-off-grid"},
    minable = {mining_time = 0.5, result = "fluid-wagon"},
    mined_sound = {filename = "__core__/sound/deconstruct-medium.ogg"},
    max_health = 600,
    capacity = 25000,
    corpse = "fluid-wagon-remnants",
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
        decrease = 3,
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
          slice = 4,
          width = 208,
          height = 210,
          back_equals_front = true,
          direction_count = 128,
          allow_low_quality_rotation = true,
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
            slice = 4,
            width = 416,
            height = 419,
            back_equals_front = true,
            direction_count = 128,
            allow_low_quality_rotation = true,
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
          slice = 4,
          width = 251,
          height = 188,
          back_equals_front = true,
          draw_as_shadow = true,
          direction_count = 128,
          allow_low_quality_rotation = true,
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
            slice = 4,
            width = 501,
            height = 375,
            back_equals_front = true,
            draw_as_shadow = true,
            direction_count = 128,
            allow_low_quality_rotation = true,
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
    minimap_representation =
    {
      filename = "__base__/graphics/entity/fluid-wagon/fluid-wagon-minimap-representation.png",
      flags = {"icon"},
      size = {20, 40},
      scale = 0.5
    },
    selected_minimap_representation =
    {
      filename = "__base__/graphics/entity/fluid-wagon/fluid-wagon-selected-minimap-representation.png",
      flags = {"icon"},
      size = {20, 40},
      scale = 0.5
    },
    wheels = standard_train_wheels,
    drive_over_tie_trigger = drive_over_tie(),
    tie_distance = 50,
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/train-wheels.ogg",
        volume = 0.6
      },
      match_volume_to_activity = true
    },
    crash_trigger = crash_trigger(),
    sound_minimum_speed = 0.5;
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 }
  },
  {
    type = "artillery-wagon",
    name = "artillery-wagon",
    icon = "__base__/graphics/icons/artillery-wagon.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation", "placeable-off-grid"},
    inventory_size = 1,
    ammo_stack_limit = 100,
    minable = {mining_time = 0.5, result = "artillery-wagon"},
    mined_sound = {filename = "__core__/sound/deconstruct-medium.ogg"},
    max_health = 600,
    corpse = "artillery-wagon-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-0.6, -2.4}, {0.6, 2.4}},
    selection_box = {{-1, -2.703125}, {1, 3.296875}},
    vertical_selection_shift = -0.796875,
    weight = 4000,
    max_speed = 1.5,
    braking_force = 3,
    friction_force = 0.50,
    air_resistance = 0.015,
    connection_distance = 3,
    joint_distance = 4,
    energy_per_hit_point = 2,
    gun = "artillery-wagon-cannon",
    turret_rotation_speed = 0.001,
    turn_after_shooting_cooldown = 60,
    cannon_parking_frame_count = 8,
    cannon_parking_speed = 0.25,
    manual_range_modifier = 2.5,
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
        percent = 50
      },
      {
        type = "explosion",
        decrease = 15,
        percent = 30
      },
      {
        type = "acid",
        decrease = 3,
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
          width = 238,
          height = 206,
          direction_count = 256,
          allow_low_quality_rotation = true,
          line_length = 4,
          lines_per_file = 4,
          shift = util.by_pixel(0, -27),
          slice = 4,
          filenames =
          {
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-base-1.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-base-2.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-base-3.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-base-4.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-base-5.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-base-6.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-base-7.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-base-8.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-base-9.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-base-10.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-base-11.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-base-12.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-base-13.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-base-14.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-base-15.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-base-16.png"
          },
          hr_version =
          {
            priority = "very-low",
            width = 476,
            height = 410,
            direction_count = 256,
            allow_low_quality_rotation = true,
            line_length = 4,
            lines_per_file = 4,
            shift = util.by_pixel(0.5, -27.5),
            scale = 0.5,
            slice = 4,
            filenames =
            {
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-base-1.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-base-2.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-base-3.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-base-4.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-base-5.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-base-6.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-base-7.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-base-8.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-base-9.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-base-10.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-base-11.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-base-12.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-base-13.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-base-14.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-base-15.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-base-16.png"
            }
          }
        },
        {
          priority = "very-low",
          slice = 4,
          width = 300,
          height = 240,
          direction_count = 256,
          allow_low_quality_rotation = true,
          line_length = 4,
          lines_per_file = 4,
          shift = util.by_pixel(37, 6),
          draw_as_shadow = true,
          filenames =
          {
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-base-shadow-1.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-base-shadow-2.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-base-shadow-3.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-base-shadow-4.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-base-shadow-5.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-base-shadow-6.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-base-shadow-7.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-base-shadow-8.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-base-shadow-9.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-base-shadow-10.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-base-shadow-11.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-base-shadow-12.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-base-shadow-13.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-base-shadow-14.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-base-shadow-15.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-base-shadow-16.png"
          },
          hr_version =
          {
            priority = "very-low",
            slice = 4,
            width = 598,
            height = 480,
            direction_count = 256,
            allow_low_quality_rotation = true,
            line_length = 4,
            lines_per_file = 4,
            shift = util.by_pixel(36.5, 6.5),--v
            scale = 0.5,
            draw_as_shadow = true,
            filenames =
            {
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-base-shadow-1.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-base-shadow-2.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-base-shadow-3.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-base-shadow-4.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-base-shadow-5.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-base-shadow-6.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-base-shadow-7.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-base-shadow-8.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-base-shadow-9.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-base-shadow-10.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-base-shadow-11.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-base-shadow-12.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-base-shadow-13.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-base-shadow-14.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-base-shadow-15.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-base-shadow-16.png"
            }
          }
        }
      }
    },
    cannon_barrel_pictures =
    {
      layers =
      {
        {
          priority = "very-low",
          width = 266,
          height = 192,
          direction_count = 256,
          line_length = 4,
          lines_per_file = 4,
          shift = util.by_pixel(0, -56),
          filenames =
          {
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-1.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-2.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-3.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-4.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-5.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-6.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-7.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-8.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-9.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-10.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-11.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-12.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-13.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-14.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-15.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-16.png"
          },
          hr_version =
          {
            priority = "very-low",
            width = 530,
            height = 384,
            direction_count = 256,
            line_length = 4,
            lines_per_file = 4,
            shift = util.by_pixel(0, -56),
            scale = 0.5,
            filenames =
            {
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-1.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-2.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-3.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-4.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-5.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-6.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-7.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-8.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-9.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-10.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-11.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-12.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-13.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-14.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-15.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-16.png"
            }
          }
        },
        {
          priority = "very-low",
          width = 454,
          height = 314,
          direction_count = 256,
          line_length = 4,
          lines_per_file = 4,
          shift = util.by_pixel(-3+58, 8+46),
          draw_as_shadow = true,
          filenames =
          {
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-shadow-1.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-shadow-2.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-shadow-3.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-shadow-4.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-shadow-5.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-shadow-6.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-shadow-7.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-shadow-8.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-shadow-9.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-shadow-10.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-shadow-11.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-shadow-12.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-shadow-13.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-shadow-14.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-shadow-15.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-shadow-16.png"
          },
          hr_version =
          {
            priority = "very-low",
            width = 906,
            height = 626,
            direction_count = 256,
            line_length = 4,
            lines_per_file = 4,
            shift = util.by_pixel(-3.5+58, 7.5+46),
            scale = 0.5,
            draw_as_shadow = true,
            filenames =
            {
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-shadow-1.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-shadow-2.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-shadow-3.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-shadow-4.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-shadow-5.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-shadow-6.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-shadow-7.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-shadow-8.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-shadow-9.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-shadow-10.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-shadow-11.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-shadow-12.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-shadow-13.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-shadow-14.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-shadow-15.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-shadow-16.png"
            }
          }
        }
      }
    },
    cannon_base_pictures =
    {
      layers =
      {
        {
          priority = "very-low",
          width = 180,
          height = 136,
          direction_count = 256,
          line_length = 4,
          lines_per_file = 4,
          shift = util.by_pixel(0, -40),
          filenames =
          {
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-1.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-2.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-3.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-4.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-5.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-6.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-7.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-8.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-9.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-10.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-11.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-12.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-13.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-14.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-15.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-16.png"
          },
          hr_version =
          {
            priority = "very-low",
            width = 358,
            height = 270,
            direction_count = 256,
            line_length = 4,
            lines_per_file = 4,
            shift = util.by_pixel(0, -40.5),
            scale = 0.5,
            filenames =
            {
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-1.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-2.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-3.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-4.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-5.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-6.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-7.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-8.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-9.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-10.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-11.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-12.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-13.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-14.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-15.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-16.png"
            }
          }
        },
        {
          priority = "very-low",
          width = 238,
          height = 170,
          direction_count = 256,
          line_length = 4,
          lines_per_file = 4,
          shift = util.by_pixel(54+58, -1+46),
          draw_as_shadow = true,
          filenames =
          {
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-shadow-1.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-shadow-2.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-shadow-3.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-shadow-4.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-shadow-5.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-shadow-6.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-shadow-7.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-shadow-8.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-shadow-9.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-shadow-10.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-shadow-11.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-shadow-12.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-shadow-13.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-shadow-14.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-shadow-15.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-shadow-16.png"
          },
          hr_version =
          {
            priority = "very-low",
            width = 476,
            height = 340,
            direction_count = 256,
            line_length = 4,
            lines_per_file = 4,
            shift = util.by_pixel(54.5+58, -1+46),
            scale = 0.5,
            draw_as_shadow = true,
            filenames =
            {
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-shadow-1.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-shadow-2.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-shadow-3.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-shadow-4.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-shadow-5.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-shadow-6.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-shadow-7.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-shadow-8.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-shadow-9.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-shadow-10.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-shadow-11.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-shadow-12.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-shadow-13.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-shadow-14.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-shadow-15.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-shadow-16.png"
            }
          }
        }
      }
    },
    cannon_base_shiftings =
    {
      util.by_pixel(0.0, 19.5),
      util.by_pixel(-1.5, 19.0),
      util.by_pixel(-3.5, 19.0),
      util.by_pixel(-5.5, 18.5),
      util.by_pixel(-7.5, 18.5),
      util.by_pixel(-9.0, 18.0),
      util.by_pixel(-11.0, 17.5),
      util.by_pixel(-13.0, 17.5),
      util.by_pixel(-15.0, 17.0),
      util.by_pixel(-16.5, 16.5),
      util.by_pixel(-18.5, 16.0),
      util.by_pixel(-20.5, 15.5),
      util.by_pixel(-22.0, 15.0),
      util.by_pixel(-24.0, 14.5),
      util.by_pixel(-25.5, 14.0),
      util.by_pixel(-27.5, 13.0),
      util.by_pixel(-29.0, 12.5),
      util.by_pixel(-30.5, 12.0),
      util.by_pixel(-32.0, 11.0),
      util.by_pixel(-34.0, 10.5),
      util.by_pixel(-35.5, 9.5),
      util.by_pixel(-37.0, 9.0),
      util.by_pixel(-38.5, 8.0),
      util.by_pixel(-40.0, 7.5),
      util.by_pixel(-41.5, 6.5),
      util.by_pixel(-42.5, 5.5),
      util.by_pixel(-44.0, 4.5),
      util.by_pixel(-45.5, 4.0),
      util.by_pixel(-46.5, 3.0),
      util.by_pixel(-48.0, 2.0),
      util.by_pixel(-49.0, 1.0),
      util.by_pixel(-50.5, 0.0),
      util.by_pixel(-51.5, -0.5),
      util.by_pixel(-52.5, -1.5),
      util.by_pixel(-53.5, -2.5),
      util.by_pixel(-54.5, -3.5),
      util.by_pixel(-55.5, -5.0),
      util.by_pixel(-56.5, -6.0),
      util.by_pixel(-57.5, -7.0),
      util.by_pixel(-58.0, -8.0),
      util.by_pixel(-59.0, -9.0),
      util.by_pixel(-60.0, -10.5),
      util.by_pixel(-60.5, -11.5),
      util.by_pixel(-61.0, -12.5),
      util.by_pixel(-62.0, -13.5),
      util.by_pixel(-62.5, -15.0),
      util.by_pixel(-63.0, -16.0),
      util.by_pixel(-63.5, -17.0),
      util.by_pixel(-64.0, -18.5),
      util.by_pixel(-64.5, -19.5),
      util.by_pixel(-65.0, -21.0),
      util.by_pixel(-65.0, -22.0),
      util.by_pixel(-65.5, -23.0),
      util.by_pixel(-65.5, -24.5),
      util.by_pixel(-66.0, -25.5),
      util.by_pixel(-66.0, -26.5),
      util.by_pixel(-66.0, -28.0),
      util.by_pixel(-66.5, -29.0),
      util.by_pixel(-66.5, -30.0),
      util.by_pixel(-66.5, -31.5),
      util.by_pixel(-66.5, -32.5),
      util.by_pixel(-66.0, -34.0),
      util.by_pixel(-66.0, -35.0),
      util.by_pixel(-66.0, -36.0),
      util.by_pixel(-65.5, -37.0),
      util.by_pixel(-66.0, -38.5),
      util.by_pixel(-66.0, -39.5),
      util.by_pixel(-66.5, -40.5),
      util.by_pixel(-66.5, -42.0),
      util.by_pixel(-66.5, -43.0),
      util.by_pixel(-66.5, -44.0),
      util.by_pixel(-66.5, -45.5),
      util.by_pixel(-66.5, -46.5),
      util.by_pixel(-66.5, -48.0),
      util.by_pixel(-66.0, -49.0),
      util.by_pixel(-66.0, -50.0),
      util.by_pixel(-65.5, -51.5),
      util.by_pixel(-65.5, -52.5),
      util.by_pixel(-65.0, -53.5),
      util.by_pixel(-64.5, -55.0),
      util.by_pixel(-64.5, -56.0),
      util.by_pixel(-64.0, -57.5),
      util.by_pixel(-63.5, -58.5),
      util.by_pixel(-63.0, -59.5),
      util.by_pixel(-62.5, -61.0),
      util.by_pixel(-61.5, -62.0),
      util.by_pixel(-61.0, -63.0),
      util.by_pixel(-60.5, -64.0),
      util.by_pixel(-59.5, -65.5),
      util.by_pixel(-59.0, -66.5),
      util.by_pixel(-58.0, -67.5),
      util.by_pixel(-57.0, -68.5),
      util.by_pixel(-56.0, -70.0),
      util.by_pixel(-55.0, -71.0),
      util.by_pixel(-54.0, -72.0),
      util.by_pixel(-53.0, -73.0),
      util.by_pixel(-52.0, -74.0),
      util.by_pixel(-51.0, -75.0),
      util.by_pixel(-50.0, -76.0),
      util.by_pixel(-48.5, -77.0),
      util.by_pixel(-47.5, -78.0),
      util.by_pixel(-46.0, -79.0),
      util.by_pixel(-45.0, -80.0),
      util.by_pixel(-43.5, -81.0),
      util.by_pixel(-42.0, -81.5),
      util.by_pixel(-40.5, -82.5),
      util.by_pixel(-39.5, -83.5),
      util.by_pixel(-38.0, -84.0),
      util.by_pixel(-36.5, -85.0),
      util.by_pixel(-34.5, -85.5),
      util.by_pixel(-33.0, -86.5),
      util.by_pixel(-31.5, -87.0),
      util.by_pixel(-30.0, -88.0),
      util.by_pixel(-28.5, -88.5),
      util.by_pixel(-26.5, -89.0),
      util.by_pixel(-25.0, -90.0),
      util.by_pixel(-23.0, -90.5),
      util.by_pixel(-21.5, -91.0),
      util.by_pixel(-19.5, -91.5),
      util.by_pixel(-17.5, -92.0),
      util.by_pixel(-16.0, -92.5),
      util.by_pixel(-14.0, -93.0),
      util.by_pixel(-12.0, -93.0),
      util.by_pixel(-10.5, -93.5),
      util.by_pixel(-8.5, -94.0),
      util.by_pixel(-6.5, -94.0),
      util.by_pixel(-4.5, -94.5),
      util.by_pixel(-2.5, -94.5),
      util.by_pixel(-0.5, -95.0),
      util.by_pixel(1.0, -95.0),
      util.by_pixel(3.0, -94.5),
      util.by_pixel(5.0, -94.5),
      util.by_pixel(7.0, -94.0),
      util.by_pixel(8.5, -94.0),
      util.by_pixel(10.5, -93.5),
      util.by_pixel(12.5, -93.0),
      util.by_pixel(14.5, -92.5),
      util.by_pixel(16.5, -92.5),
      util.by_pixel(18.0, -92.0),
      util.by_pixel(20.0, -91.5),
      util.by_pixel(21.5, -91.0),
      util.by_pixel(23.5, -90.5),
      util.by_pixel(25.0, -89.5),
      util.by_pixel(27.0, -89.0),
      util.by_pixel(28.5, -88.5),
      util.by_pixel(30.5, -88.0),
      util.by_pixel(32.0, -87.0),
      util.by_pixel(33.5, -86.5),
      util.by_pixel(35.0, -85.5),
      util.by_pixel(36.5, -85.0),
      util.by_pixel(38.0, -84.0),
      util.by_pixel(39.5, -83.5),
      util.by_pixel(41.0, -82.5),
      util.by_pixel(42.5, -81.5),
      util.by_pixel(44.0, -80.5),
      util.by_pixel(45.0, -80.0),
      util.by_pixel(46.5, -79.0),
      util.by_pixel(47.5, -78.0),
      util.by_pixel(49.0, -77.0),
      util.by_pixel(50.0, -76.0),
      util.by_pixel(51.5, -75.0),
      util.by_pixel(52.5, -74.0),
      util.by_pixel(53.5, -73.0),
      util.by_pixel(54.5, -72.0),
      util.by_pixel(55.5, -71.0),
      util.by_pixel(56.5, -70.0),
      util.by_pixel(57.5, -68.5),
      util.by_pixel(58.5, -67.5),
      util.by_pixel(59.0, -66.5),
      util.by_pixel(60.0, -65.5),
      util.by_pixel(60.5, -64.0),
      util.by_pixel(61.5, -63.0),
      util.by_pixel(62.0, -62.0),
      util.by_pixel(62.5, -61.0),
      util.by_pixel(63.0, -59.5),
      util.by_pixel(63.5, -58.5),
      util.by_pixel(64.0, -57.5),
      util.by_pixel(64.5, -56.0),
      util.by_pixel(65.0, -55.0),
      util.by_pixel(65.5, -53.5),
      util.by_pixel(65.5, -52.5),
      util.by_pixel(66.0, -51.5),
      util.by_pixel(66.5, -50.0),
      util.by_pixel(66.5, -49.0),
      util.by_pixel(66.5, -48.0),
      util.by_pixel(66.5, -46.5),
      util.by_pixel(67.0, -45.5),
      util.by_pixel(67.0, -44.0),
      util.by_pixel(67.0, -43.0),
      util.by_pixel(66.5, -42.0),
      util.by_pixel(66.5, -40.5),
      util.by_pixel(66.5, -39.5),
      util.by_pixel(66.5, -38.5),
      util.by_pixel(66.5, -37.5),
      util.by_pixel(66.5, -36.0),
      util.by_pixel(67.0, -35.0),
      util.by_pixel(67.0, -34.0),
      util.by_pixel(67.0, -32.5),
      util.by_pixel(67.0, -31.5),
      util.by_pixel(67.0, -30.5),
      util.by_pixel(67.0, -29.0),
      util.by_pixel(67.0, -28.0),
      util.by_pixel(67.0, -26.5),
      util.by_pixel(66.5, -25.5),
      util.by_pixel(66.5, -24.5),
      util.by_pixel(66.0, -23.0),
      util.by_pixel(66.0, -22.0),
      util.by_pixel(65.5, -20.5),
      util.by_pixel(65.0, -19.5),
      util.by_pixel(65.0, -18.5),
      util.by_pixel(64.5, -17.0),
      util.by_pixel(64.0, -16.0),
      util.by_pixel(63.0, -15.0),
      util.by_pixel(62.5, -13.5),
      util.by_pixel(62.0, -12.5),
      util.by_pixel(61.5, -11.5),
      util.by_pixel(60.5, -10.0),
      util.by_pixel(60.0, -9.0),
      util.by_pixel(59.0, -8.0),
      util.by_pixel(58.0, -7.0),
      util.by_pixel(57.5, -6.0),
      util.by_pixel(56.5, -4.5),
      util.by_pixel(55.5, -3.5),
      util.by_pixel(54.5, -2.5),
      util.by_pixel(53.5, -1.5),
      util.by_pixel(52.0, -0.5),
      util.by_pixel(51.0, 0.0),
      util.by_pixel(50.0, 1.0),
      util.by_pixel(48.5, 2.0),
      util.by_pixel(47.5, 3.0),
      util.by_pixel(46.0, 4.0),
      util.by_pixel(45.0, 5.0),
      util.by_pixel(43.5, 5.5),
      util.by_pixel(42.0, 6.5),
      util.by_pixel(40.5, 7.5),
      util.by_pixel(39.0, 8.0),
      util.by_pixel(37.5, 9.0),
      util.by_pixel(36.0, 10.0),
      util.by_pixel(34.5, 10.5),
      util.by_pixel(33.0, 11.5),
      util.by_pixel(31.5, 12.0),
      util.by_pixel(29.5, 12.5),
      util.by_pixel(28.0, 13.5),
      util.by_pixel(26.5, 14.0),
      util.by_pixel(24.5, 14.5),
      util.by_pixel(23.0, 15.0),
      util.by_pixel(21.0, 15.5),
      util.by_pixel(19.0, 16.0),
      util.by_pixel(17.5, 16.5),
      util.by_pixel(15.5, 17.0),
      util.by_pixel(13.5, 17.5),
      util.by_pixel(11.5, 18.0),
      util.by_pixel(10.0, 18.0),
      util.by_pixel(8.0, 18.5),
      util.by_pixel(6.0, 19.0),
      util.by_pixel(4.0, 19.0)
    },
    cannon_barrel_recoil_shiftings =
    {
      {x =-0.000, y =0.040, z =-0.000},
      {x =-0.789, y =0.037, z =-0.351},
      {x =-1.578, y =0.035, z =-0.702},
      {x =-2.367, y =0.033, z =-1.054},
      {x =-3.155, y =0.031, z =-1.405},
      {x =-3.944, y =0.028, z =-1.756},
      {x =-3.931, y =0.028, z =-1.750},
      {x =-3.901, y =0.028, z =-1.737},
      {x =-3.854, y =0.029, z =-1.716},
      {x =-3.790, y =0.029, z =-1.688},
      {x =-3.711, y =0.029, z =-1.652},
      {x =-3.617, y =0.029, z =-1.610},
      {x =-3.508, y =0.030, z =-1.562},
      {x =-3.385, y =0.030, z =-1.507},
      {x =-3.249, y =0.030, z =-1.447},
      {x =-3.102, y =0.031, z =-1.381},
      {x =-2.944, y =0.031, z =-1.311},
      {x =-2.776, y =0.032, z =-1.236},
      {x =-2.599, y =0.032, z =-1.157},
      {x =-2.416, y =0.033, z =-1.076},
      {x =-2.226, y =0.033, z =-0.991},
      {x =-2.032, y =0.034, z =-0.905},
      {x =-1.835, y =0.034, z =-0.817},
      {x =-1.635, y =0.035, z =-0.728},
      {x =-1.436, y =0.035, z =-0.639},
      {x =-1.238, y =0.036, z =-0.551},
      {x =-1.042, y =0.037, z =-0.464},
      {x =-0.851, y =0.037, z =-0.379},
      {x =-0.665, y =0.038, z =-0.296},
      {x =-0.485, y =0.038, z =-0.216},
      {x =-0.314, y =0.039, z =-0.140},
      {x =-0.152, y =0.039, z =-0.068}
    },
    cannon_barrel_light_direction = {0.5976251, 0.0242053, -0.8014102},
    cannon_barrel_recoil_shiftings_load_correction_matrix =
    {
      { 0,    0.25,   0 },
      {-0.25,    0,   0 },
      { 0,       0,   0.25 }
    },
    minimap_representation =
    {
      filename = "__base__/graphics/entity/artillery-wagon/artillery-wagon-minimap-representation.png",
      flags = {"icon"},
      size = {20, 40},
      scale = 0.5
    },
    selected_minimap_representation =
    {
      filename = "__base__/graphics/entity/artillery-wagon/artillery-wagon-selected-minimap-representation.png",
      flags = {"icon"},
      size = {20, 40},
      scale = 0.5
    },
    wheels = standard_train_wheels,
    drive_over_tie_trigger = drive_over_tie(),
    tie_distance = 50,
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/train-wheels.ogg",
        volume = 0.6
      },
      match_volume_to_activity = true
    },
    crash_trigger = crash_trigger(),
    open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
    close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
    sound_minimum_speed = 0.5;
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 }
  },

  {
    type = "player-port",
    name = "player-port",
    icon = "__base__/graphics/icons/player-port.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    subgroup = "other",
    minable = {mining_time = 0.5, result = "player-port"},
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
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation", "building-direction-8-way"},
    minable = {mining_time = 0.2, result = "rail"},
    max_health = 100,
    corpse = "straight-rail-remnants",
    resistances =
    {
      {
        type = "fire",
        percent = 100
      },
      {
        type = "acid",
        percent = 80
      }
    },
    -- collision box is hardcoded for rails as they need to be different for different orientations (diagonal or straight) and to
    -- avoid unexpected changes in the way rail blocks are merged
    selection_box = {{-0.7, -0.8}, {0.7, 0.8}},
    pictures = rail_pictures()
  },
  {
    type = "curved-rail",
    name = "curved-rail",
    icon = "__base__/graphics/icons/curved-rail.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation", "building-direction-8-way"},
    minable = {mining_time = 0.2, result = "rail", count = 4},
    max_health = 200,
    corpse = "curved-rail-remnants",
    resistances =
    {
      {
        type = "fire",
        percent = 100
      },
      {
        type = "acid",
        percent = 80
      },
    },
    -- collision box is hardcoded for rails as to avoid unexpected changes in the way rail blocks are merged
    selection_box = {{-1.7, -0.8}, {1.7, 0.8}},
    pictures = rail_pictures(),
    placeable_by = {item = "rail", count = 4}
  },
  {
    type = "land-mine",
    name = "land-mine",
    icon = "__base__/graphics/icons/land-mine.png",
    icon_size = 32,
    flags =
    {
      "placeable-player",
      "placeable-enemy",
      "player-creation",
      "placeable-off-grid",
      "not-on-map"
    },
    minable = {mining_time = 0.5, result = "land-mine"},
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
    picture_set_enemy =
    {
      filename = "__base__/graphics/entity/land-mine/land-mine-set-enemy.png",
      priority = "medium",
      width = 32,
      height = 32
    },
    trigger_radius = 2.5,
    ammo_category = "landmine",
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
              radius = 6,
              force = "enemy",
              action_delivery =
              {
                type = "instant",
                target_effects =
                {
                  {
                    type = "damage",
                    damage = { amount = 250, type = "explosion"}
                  },
                  {
                    type = "create-sticker",
                    sticker = "stun-sticker"
                  }
                }
              }
            }
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
    }
  },
  {
    type = "train-stop",
    name = "train-stop",
    icon = "__base__/graphics/icons/train-stop.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation", "filter-directions"},
    minable = {mining_time = 0.2, result = "train-stop"},
    max_health = 250,
    corpse = "train-stop-remnants",
    collision_box = {{-0.5, -0.5}, {0.5, 0.5}},
    selection_box = {{-0.9, -0.9}, {0.9, 0.9}},
    drawing_boxes =
    {
      north = {{-3,-2.5}, {0.8, 1.25}},
      east = {{-1.75, -4.25},{1.625, 0.5}},
      south = {{-0.8125, -3.625},{2.75, 0.4375}},
      west = {{-1.75, -1.6875},{2.0625, 2.75}}
    },
    tile_width = 2,
    tile_height = 2,
    animation_ticks_per_frame = 20,
    rail_overlay_animations = make_4way_animation_from_spritesheet(
    {
      filename = "__base__/graphics/entity/train-stop/train-stop-ground.png",
      width = 194,
      height = 189,
      direction_count = 4,
      shift = util.by_pixel(0, -0.5),
        hr_version =
        {
          filename = "__base__/graphics/entity/train-stop/hr-train-stop-ground.png",
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
        width = 71,
        height = 146,
        direction_count = 4,
        shift = util.by_pixel(-0.5, -27),
          hr_version =
          {
            filename = "__base__/graphics/entity/train-stop/hr-train-stop-bottom.png",
            width = 140,
            height = 291,
            direction_count = 4,
            shift = util.by_pixel(-0.5, -26.75),
            scale = 0.5
          }
      },
      {
        filename = "__base__/graphics/entity/train-stop/train-stop-shadow.png",
        width = 361,
        height = 304,
        direction_count = 4,
        shift = util.by_pixel(-7.5, 18),
        draw_as_shadow = true,
          hr_version =
          {
            filename = "__base__/graphics/entity/train-stop/hr-train-stop-shadow.png",
            width = 720,
            height = 607,
            direction_count = 4,
            shift = util.by_pixel(-7.5, 17.75),
            draw_as_shadow = true,
            scale = 0.5
          }
      }
    }}),

    top_animations = make_4way_animation_from_spritesheet({ layers =
    {
      {
        filename = "__base__/graphics/entity/train-stop/train-stop-top.png",
        width = 156,
        height = 153,
        direction_count = 4,
        shift = util.by_pixel(0, -50.5),
          hr_version =
          {
            filename = "__base__/graphics/entity/train-stop/hr-train-stop-top.png",
            width = 311,
            height = 305,
            direction_count = 4,
            shift = util.by_pixel(0, -50.75),
            scale = 0.5
          }
      },
      {
        filename = "__base__/graphics/entity/train-stop/train-stop-top-mask.png",
        width = 154,
        height = 148,
        direction_count = 4,
        apply_runtime_tint = true,
        shift = util.by_pixel(0, -49),
          hr_version =
          {
            filename = "__base__/graphics/entity/train-stop/hr-train-stop-top-mask.png",
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
          hr_version =
          {
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
          hr_version =
          {
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
          hr_version =
          {
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
          hr_version =
          {
            filename = "__base__/graphics/entity/train-stop/hr-train-stop-west-light-1.png",
            width = 6,
            height = 16,
            frame_count = 1,
            shift = util.by_pixel(-30.5, -112),
            scale = 0.5
            }
        }
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
          hr_version =
          {
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
          hr_version =
          {
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
          hr_version =
          {
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
          hr_version =
          {
            filename = "__base__/graphics/entity/train-stop/hr-train-stop-west-red-light-1.png",
            width = 6,
            height = 16,
            frame_count = 1,
            shift = util.by_pixel(-30.5, -112),
            scale = 0.5
            }
        }
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
          hr_version =
          {
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
          hr_version =
          {
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
          hr_version =
          {
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
          hr_version =
          {
            filename = "__base__/graphics/entity/train-stop/hr-train-stop-west-light-2.png",
            width = 7,
            height = 15,
            frame_count = 1,
            shift = util.by_pixel(-30.75, -102.75),
            scale = 0.5
            }
        }
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
          hr_version =
          {
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
          hr_version =
          {
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
          hr_version =
          {
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
          hr_version =
          {
            filename = "__base__/graphics/entity/train-stop/hr-train-stop-west-red-light-2.png",
            width = 7,
            height = 15,
            frame_count = 1,
            shift = util.by_pixel(-30.75, -102.75),
            scale = 0.5
            }
        }
      }
    },

    color={r=0.95,  g=0, b=0, a=0.5},

    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      sound = { filename = "__base__/sound/train-stop.ogg", volume = 0.8 }
    },

    circuit_wire_connection_points = circuit_connector_definitions["train-station"].points,
    circuit_connector_sprites = circuit_connector_definitions["train-station"].sprites,
    circuit_wire_max_distance = default_circuit_wire_max_distance,

    default_train_stopped_signal = {type = "virtual", name = "signal-T"}
  },
  {
    type = "rail-signal",
    name = "rail-signal",
    icon = "__base__/graphics/icons/rail-signal.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation", "building-direction-8-way", "filter-directions", "fast-replaceable-no-build-while-moving"},
    fast_replaceable_group = "rail-signal",
    minable = {mining_time = 0.1, result = "rail-signal"},
    max_health = 100,
    corpse = "rail-signal-remnants",
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
      hr_version =
      {
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
      hr_version =
      {
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

    circuit_wire_connection_points = circuit_connector_definitions["rail-signal"].points,
    circuit_connector_sprites = circuit_connector_definitions["rail-signal"].sprites,
    circuit_wire_max_distance = default_circuit_wire_max_distance,

    default_red_output_signal = {type = "virtual", name = "signal-red"},
    default_orange_output_signal = {type = "virtual", name = "signal-yellow"},
    default_green_output_signal = {type = "virtual", name = "signal-green"}
  },
  {
    type = "rail-chain-signal",
    name = "rail-chain-signal",
    icon = "__base__/graphics/icons/rail-chain-signal.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation", "building-direction-8-way", "filter-directions", "fast-replaceable-no-build-while-moving"},
    fast_replaceable_group = "rail-signal",
    minable = {mining_time = 0.1, result = "rail-chain-signal"},
    max_health = 100,
    corpse = "rail-chain-signal-remnants",
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
      hr_version =
      {
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
      hr_version =
      {
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

    circuit_wire_connection_points = circuit_connector_definitions["rail-chain-signal"].points,
    circuit_connector_sprites = circuit_connector_definitions["rail-chain-signal"].sprites,
    circuit_wire_max_distance = default_circuit_wire_max_distance,

    default_red_output_signal = {type = "virtual", name = "signal-red"},
    default_orange_output_signal = {type = "virtual", name = "signal-yellow"},
    default_green_output_signal = {type = "virtual", name = "signal-green"},
    default_blue_output_signal = {type = "virtual", name = "signal-blue"}
  },
  {
    type = "logistic-robot",
    name = "logistic-robot",
    icon = "__base__/graphics/icons/logistic-robot.png",
    icon_size = 32,
    flags = {"placeable-player", "player-creation", "placeable-off-grid", "not-on-map"},
    minable = {mining_time = 0.1, result = "logistic-robot"},
    resistances = { { type = "fire", percent = 85 } },
    max_health = 100,
    collision_box = {{0, 0}, {0, 0}},
    selection_box = {{-0.5, -1.5}, {0.5, -0.5}},
    max_payload_size = 1,
    speed = 0.05,
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
      y = 42,
      hr_version =
      {
        filename = "__base__/graphics/entity/logistic-robot/hr-logistic-robot.png",
        priority = "high",
        line_length = 16,
        width = 80,
        height = 84,
        frame_count = 1,
        shift = util.by_pixel(0, -3),
        direction_count = 16,
        y = 84,
        scale = 0.5
      }
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
      direction_count = 16,
      hr_version =
      {
        filename = "__base__/graphics/entity/logistic-robot/hr-logistic-robot.png",
        priority = "high",
        line_length = 16,
        width = 80,
        height = 84,
        frame_count = 1,
        shift = util.by_pixel(0, -3),
        direction_count = 16,
        scale = 0.5
      }
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
      y = 126,
      hr_version =
      {
        filename = "__base__/graphics/entity/logistic-robot/hr-logistic-robot.png",
        priority = "high",
        line_length = 16,
        width = 80,
        height = 84,
        frame_count = 1,
        shift = util.by_pixel(0, -3),
        direction_count = 16,
        y = 252,
        scale = 0.5
      }
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
      y = 84,
      hr_version =
      {
        filename = "__base__/graphics/entity/logistic-robot/hr-logistic-robot.png",
        priority = "high",
        line_length = 16,
        width = 80,
        height = 84,
        frame_count = 1,
        shift = util.by_pixel(0, -3),
        direction_count = 16,
        y = 168,
        scale = 0.5
      }
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
      y = 23,
      hr_version =
      {
        filename = "__base__/graphics/entity/logistic-robot/hr-logistic-robot-shadow.png",
        priority = "high",
        line_length = 16,
        width = 115,
        height = 57,
        frame_count = 1,
        shift = util.by_pixel(31.75, 19.75),
        direction_count = 16,
        y = 57,
        scale = 0.5
      }
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
      direction_count = 16,
      hr_version =
      {
        filename = "__base__/graphics/entity/logistic-robot/hr-logistic-robot-shadow.png",
        priority = "high",
        line_length = 16,
        width = 115,
        height = 57,
        frame_count = 1,
        shift = util.by_pixel(31.75, 19.75),
        direction_count = 16,
        scale = 0.5
      }
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
      y = 23,
      hr_version =
      {
        filename = "__base__/graphics/entity/logistic-robot/hr-logistic-robot-shadow.png",
        priority = "high",
        line_length = 16,
        width = 115,
        height = 57,
        frame_count = 1,
        shift = util.by_pixel(31.75, 19.75),
        direction_count = 16,
        y = 171,
        scale = 0.5
      }
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
      direction_count = 16,
      hr_version =
      {
        filename = "__base__/graphics/entity/logistic-robot/hr-logistic-robot-shadow.png",
        priority = "high",
        line_length = 16,
        width = 115,
        height = 57,
        frame_count = 1,
        shift = util.by_pixel(31.75, 19.75),
        direction_count = 16,
        y = 114,
        scale = 0.5
      }
    },
    working_sound = flying_robot_sounds(),
    cargo_centered = {0.0, 0.2}
  },
  {
    type = "logistic-container",
    name = "logistic-chest-passive-provider",
    icon = "__base__/graphics/icons/logistic-chest-passive-provider.png",
    icon_size = 32,
    flags = {"placeable-player", "player-creation"},
    minable = {mining_time = 0.1, result = "logistic-chest-passive-provider"},
    max_health = 350,
    corpse = "passive-provider-chest-remnants",
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
    opened_duration = logistic_chest_opened_duration,
    animation =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/logistic-chest/logistic-chest-passive-provider.png",
          priority = "extra-high",
          width = 34,
          height = 38,
          frame_count = 7,
          shift = util.by_pixel(0, -2),
          hr_version =
          {
            filename = "__base__/graphics/entity/logistic-chest/hr-logistic-chest-passive-provider.png",
            priority = "extra-high",
            width = 66,
            height = 74,
            frame_count = 7,
            shift = util.by_pixel(0, -2),
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/logistic-chest/logistic-chest-shadow.png",
          priority = "extra-high",
          width = 48,
          height = 24,
          repeat_count = 7,
          shift = util.by_pixel(8.5, 5.5),
          draw_as_shadow = true,
          hr_version =
          {
            filename = "__base__/graphics/entity/logistic-chest/hr-logistic-chest-shadow.png",
            priority = "extra-high",
            width = 96,
            height = 44,
            repeat_count = 7,
            shift = util.by_pixel(8.5, 5),
            draw_as_shadow = true,
            scale = 0.5
          }
        }
      }
    },
    circuit_wire_connection_point = circuit_connector_definitions["chest"].points,
    circuit_connector_sprites = circuit_connector_definitions["chest"].sprites,
    circuit_wire_max_distance = default_circuit_wire_max_distance
  },
  {
    type = "logistic-container",
    name = "logistic-chest-active-provider",
    icon = "__base__/graphics/icons/logistic-chest-active-provider.png",
    icon_size = 32,
    flags = {"placeable-player", "player-creation"},
    minable = {mining_time = 0.1, result = "logistic-chest-active-provider"},
    max_health = 350,
    corpse = "active-provider-chest-remnants",
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
    opened_duration = logistic_chest_opened_duration,
    animation =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/logistic-chest/logistic-chest-active-provider.png",
          priority = "extra-high",
          width = 34,
          height = 38,
          frame_count = 7,
          shift = util.by_pixel(0, -2),
          hr_version =
          {
            filename = "__base__/graphics/entity/logistic-chest/hr-logistic-chest-active-provider.png",
            priority = "extra-high",
            width = 66,
            height = 74,
            frame_count = 7,
            shift = util.by_pixel(0, -2),
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/logistic-chest/logistic-chest-shadow.png",
          priority = "extra-high",
          width = 48,
          height = 24,
          repeat_count = 7,
          shift = util.by_pixel(8.5, 5.5),
          draw_as_shadow = true,
          hr_version =
          {
            filename = "__base__/graphics/entity/logistic-chest/hr-logistic-chest-shadow.png",
            priority = "extra-high",
            width = 96,
            height = 44,
            repeat_count = 7,
            shift = util.by_pixel(8.5, 5),
            draw_as_shadow = true,
            scale = 0.5
          }
        }
      }
    },
    circuit_wire_connection_point = circuit_connector_definitions["chest"].points,
    circuit_connector_sprites = circuit_connector_definitions["chest"].sprites,
    circuit_wire_max_distance = default_circuit_wire_max_distance
  },
  {
    type = "logistic-container",
    name = "logistic-chest-storage",
    icon = "__base__/graphics/icons/logistic-chest-storage.png",
    icon_size = 32,
    flags = {"placeable-player", "player-creation"},
    minable = {mining_time = 0.1, result = "logistic-chest-storage"},
    max_health = 350,
    logistic_slots_count = 1,
    corpse = "storage-chest-remnants",
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
    opened_duration = logistic_chest_opened_duration,
    animation =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/logistic-chest/logistic-chest-storage.png",
          priority = "extra-high",
          width = 34,
          height = 38,
          frame_count = 7,
          shift = util.by_pixel(0, -2),
          hr_version =
          {
            filename = "__base__/graphics/entity/logistic-chest/hr-logistic-chest-storage.png",
            priority = "extra-high",
            width = 66,
            height = 74,
            frame_count = 7,
            shift = util.by_pixel(0, -2),
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/logistic-chest/logistic-chest-shadow.png",
          priority = "extra-high",
          width = 48,
          height = 24,
          repeat_count = 7,
          shift = util.by_pixel(8.5, 5.5),
          draw_as_shadow = true,
          hr_version =
          {
            filename = "__base__/graphics/entity/logistic-chest/hr-logistic-chest-shadow.png",
            priority = "extra-high",
            width = 96,
            height = 44,
            repeat_count = 7,
            shift = util.by_pixel(8.5, 5),
            draw_as_shadow = true,
            scale = 0.5
          }
        }
      }
    },
    circuit_wire_connection_point = circuit_connector_definitions["chest"].points,
    circuit_connector_sprites = circuit_connector_definitions["chest"].sprites,
    circuit_wire_max_distance = default_circuit_wire_max_distance
  },
  {
    type = "logistic-container",
    name = "logistic-chest-buffer",
    icon = "__base__/graphics/icons/logistic-chest-buffer.png",
    icon_size = 32,
    flags = {"placeable-player", "player-creation"},
    minable = {mining_time = 0.1, result = "logistic-chest-buffer"},
    max_health = 350,
    corpse = "buffer-chest-remnants",
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
    logistic_mode = "buffer",
    logistic_slots_count = 12,
    open_sound = { filename = "__base__/sound/metallic-chest-open.ogg", volume=0.65 },
    close_sound = { filename = "__base__/sound/metallic-chest-close.ogg", volume = 0.7 },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    opened_duration = logistic_chest_opened_duration,
    animation =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/logistic-chest/logistic-chest-buffer.png",
          priority = "extra-high",
          width = 34,
          height = 38,
          frame_count = 7,
          shift = util.by_pixel(0, -2),
          hr_version =
          {
            filename = "__base__/graphics/entity/logistic-chest/hr-logistic-chest-buffer.png",
            priority = "extra-high",
            width = 66,
            height = 72,
            frame_count = 7,
            shift = util.by_pixel(0, -2),
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/logistic-chest/logistic-chest-shadow.png",
          priority = "extra-high",
          width = 48,
          height = 24,
          repeat_count = 7,
          shift = util.by_pixel(8.5, 5.5),
          draw_as_shadow = true,
          hr_version =
          {
            filename = "__base__/graphics/entity/logistic-chest/hr-logistic-chest-shadow.png",
            priority = "extra-high",
            width = 96,
            height = 44,
            repeat_count = 7,
            shift = util.by_pixel(8.5, 5),
            draw_as_shadow = true,
            scale = 0.5
          }
        }
      }
    },
    circuit_wire_connection_point = circuit_connector_definitions["chest"].points,
    circuit_connector_sprites = circuit_connector_definitions["chest"].sprites,
    circuit_wire_max_distance = default_circuit_wire_max_distance
  },
  {
    type = "logistic-container",
    name = "logistic-chest-requester",
    icon = "__base__/graphics/icons/logistic-chest-requester.png",
    icon_size = 32,
    flags = {"placeable-player", "player-creation"},
    minable = {mining_time = 0.1, result = "logistic-chest-requester"},
    max_health = 350,
    corpse = "requester-chest-remnants",
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
    logistic_slots_count = 12,
    open_sound = { filename = "__base__/sound/metallic-chest-open.ogg", volume=0.65 },
    close_sound = { filename = "__base__/sound/metallic-chest-close.ogg", volume = 0.7 },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    opened_duration = logistic_chest_opened_duration,
    animation =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/logistic-chest/logistic-chest-requester.png",
          priority = "extra-high",
          width = 34,
          height = 38,
          frame_count = 7,
          shift = util.by_pixel(0, -2),
          hr_version =
          {
            filename = "__base__/graphics/entity/logistic-chest/hr-logistic-chest-requester.png",
            priority = "extra-high",
            width = 66,
            height = 74,
            frame_count = 7,
            shift = util.by_pixel(0, -2),
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/logistic-chest/logistic-chest-shadow.png",
          priority = "extra-high",
          width = 48,
          height = 24,
          repeat_count = 7,
          shift = util.by_pixel(8.5, 5.5),
          draw_as_shadow = true,
          hr_version =
          {
            filename = "__base__/graphics/entity/logistic-chest/hr-logistic-chest-shadow.png",
            priority = "extra-high",
            width = 96,
            height = 44,
            repeat_count = 7,
            shift = util.by_pixel(8.5, 5),
            draw_as_shadow = true,
            scale = 0.5
          }
        }
      }
    },
    circuit_wire_connection_point = circuit_connector_definitions["chest"].points,
    circuit_connector_sprites = circuit_connector_definitions["chest"].sprites,
    circuit_wire_max_distance = default_circuit_wire_max_distance
  },
  {
    type = "rocket-silo",
    name = "rocket-silo",
    icon = "__base__/graphics/icons/rocket-silo.png",
    icon_size = 32,
    flags = {"placeable-player", "player-creation"},
    crafting_categories = {"rocket-building"},
    rocket_parts_required = 100,
    crafting_speed = 1,
    rocket_result_inventory_size = 1,
    module_specification =
    {
      module_slots = 4,
      module_info_icon_shift = {0, 3.3}
    },
    fixed_recipe = "rocket-part",
    show_recipe_icon = false,
    allowed_effects = {"consumption", "speed", "productivity", "pollution"},
    minable = {mining_time = 1, result = "rocket-silo"},
    max_health = 5000,
    dying_explosion = "medium-explosion",
    corpse = "rocket-silo-generic-remnants",
    collision_box = {{-4.40, -4.40}, {4.40, 4.40}},
    selection_box = {{-4.5, -4.5}, {4.5, 4.5}},
    hole_clipping_box = { {-2.75, -1.15}, {2.75, 2.25} },
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

    --base_light =
    --{
    --  {
    --    type = "oriented",
    --    picture =
    --    {
    --      filename = "__core__/graphics/light-cone.png",
    --      priority = "extra-high",
    --      flags = { "light" },
    --      scale = 2,
    --      width = 200,
    --      height = 200
    --    },
    --    shift = {0.25, 1.25},
    --    size = 1,
    --    intensity = 1,
    --    rotation_shift = 0.6,
    --    color = {r = 0.7, g = 0.9, b = 1.0}
    --  },
    --  {
    --    type = "oriented",
    --    picture =
    --    {
    --      filename = "__core__/graphics/light-cone.png",
    --      priority = "extra-high",
    --      flags = { "light" },
    --      scale = 2,
    --      width = 200,
    --      height = 200
    --    },
    --    shift = {-0.25, 1},
    --    size = 1,
    --    intensity = 1,
    --    rotation_shift = 0.5,
    --    color = {r = 0.7, g = 0.9, b = 1.0}
    --  }
    --},
    base_engine_light =
    {
      intensity = 1,
      size = 25,
      shift = {0, 1.5}
    },

    shadow_sprite =
    {
      filename = "__base__/graphics/entity/rocket-silo/00-rocket-silo-shadow.png",
      priority = "medium",
      width = 304,
      height = 290,
      draw_as_shadow = true,
      slice = 2,
      shift = util.by_pixel(8, 2),
      hr_version =
      {
        filename = "__base__/graphics/entity/rocket-silo/hr-00-rocket-silo-shadow.png",
        priority = "medium",
        width = 612,
        height = 578,
        draw_as_shadow = true,
        slice = 2,
        shift = util.by_pixel(7, 2),
        scale = 0.5
      },
    },
    --satellite_shadow_animation =
    --{
    --  filename = "__base__/graphics/entity/rocket-silo/00-shadow/00-satellite-shadow.png",
    --  priority = "medium",
    --  width = 44,
    --  height = 22,
    --  frame_count = 12,
    --  line_length = 4,
    --  animation_speed = 0.25,
    --  draw_as_shadow = true,
    --  shift = {7.875, -2.1875},
    --  hr_version =
    --  {
    --    filename = "__base__/graphics/entity/rocket-silo/00-shadow/hr-00-satellite-shadow.png",
    --    priority = "medium",
    --    width = 44,
    --    height = 22,
    --    frame_count = 12,
    --    line_length = 4,
    --    animation_speed = 0.25,
    --    draw_as_shadow = true,
    --    shift = {7.875, -2.1875},
    --    scale = 0.5
    --  }
    --},

    hole_sprite =
    {
      filename = "__base__/graphics/entity/rocket-silo/01-rocket-silo-hole.png",
      width = 202,
      height = 136,
      shift = util.by_pixel(-6, 16),
      hr_version =
      {
        filename = "__base__/graphics/entity/rocket-silo/hr-01-rocket-silo-hole.png",
        width = 400,
        height = 270,
        shift = util.by_pixel(-5, 16),
        scale = 0.5
      }
    },
    hole_light_sprite =
    {
      filename = "__base__/graphics/entity/rocket-silo/01-rocket-silo-hole-light.png",
      width = 202,
      height = 136,
      shift = util.by_pixel(-6, 16),
      tint = {1,1,1,0},
      hr_version =
      {
        filename = "__base__/graphics/entity/rocket-silo/hr-01-rocket-silo-hole-light.png",
        width = 400,
        height = 270,
        shift = util.by_pixel(-5, 16),
        tint = {1,1,1,0},
        scale = 0.5
      }
    },

    rocket_shadow_overlay_sprite =
    {
      filename = "__base__/graphics/entity/rocket-silo/03-rocket-over-shadow-over-rocket.png",
      width = 212,
      height = 142,
      shift = util.by_pixel(-2, 22),
      hr_version = {
        filename = "__base__/graphics/entity/rocket-silo/hr-03-rocket-over-shadow-over-rocket.png",
        width = 426,
        height = 288,
        shift = util.by_pixel(-2, 21),
        scale = 0.5
      }
    },
    rocket_glow_overlay_sprite =
    {
      filename = "__base__/graphics/entity/rocket-silo/03-rocket-over-glow.png",
      blend_mode = "additive",
      width = 218,
      height = 222,
      shift = util.by_pixel(-4, 36),
      hr_version =
      {
        filename = "__base__/graphics/entity/rocket-silo/hr-03-rocket-over-glow.png",
        blend_mode = "additive",
        width = 434,
        height = 446,
        shift = util.by_pixel(-3, 36),
        scale = 0.5
      }
    },


    door_back_sprite =
    {
      filename = "__base__/graphics/entity/rocket-silo/04-door-back.png",
      width = 158,
      height = 144,
      shift = util.by_pixel(36, 12),
      hr_version = {
        filename = "__base__/graphics/entity/rocket-silo/hr-04-door-back.png",
        width = 312,
        height = 286,
        shift = util.by_pixel(37, 12),
        scale = 0.5
      }
    },
    door_back_open_offset = {1.8, -1.8 * 0.43299225},
    door_front_sprite =
    {
      filename = "__base__/graphics/entity/rocket-silo/05-door-front.png",
      width = 166,
      height = 152,
      shift = util.by_pixel(-28, 32),
      hr_version =
      {
        filename = "__base__/graphics/entity/rocket-silo/hr-05-door-front.png",
        width = 332,
        height = 300,
        shift = util.by_pixel(-28, 33),
        scale = 0.5
      }
    },
    door_front_open_offset = {-1.8, 1.8 * 0.43299225},

    base_day_sprite =
    {
      filename = "__base__/graphics/entity/rocket-silo/06-rocket-silo.png",
      width = 300,
      height = 300,
      shift = util.by_pixel(2, -2),
      hr_version =
      {
        filename = "__base__/graphics/entity/rocket-silo/hr-06-rocket-silo.png",
        width = 608,
        height = 596,
        shift = util.by_pixel(3, -1),
        scale = 0.5
      }
    },
    --base_night_sprite =
    --{
    --  filename = "__base__/graphics/entity/rocket-silo/06-silo-base/06-silo-base-night.png",
    --  width = 352,
    --  height = 384,
    --  shift = {0, 0},
    --  hr_version = {
    --    filename = "__base__/graphics/entity/rocket-silo/06-silo-base/hr-06-silo-base-night.png",
    --    width = 352,
    --    height = 384,
    --    shift = {0, 0},
    --    scale = 0.5
    --  }
    --},


    red_lights_back_sprites =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/rocket-silo/07-red-lights-back/red-light.png",
          width = 32,
          height = 32,
          shift = {1.34375, 0.28125-1.375},
          hr_version =
          {
            filename = "__base__/graphics/entity/rocket-silo/07-red-lights-back/hr-red-light.png",
            width = 32,
            height = 32,
            shift = {1.34375, 0.28125-1.375},
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/rocket-silo/07-red-lights-back/red-light.png",
          width = 32,
          height = 32,
          shift = {2.3125, 0.9375-1.375},
          hr_version =
          {
            filename = "__base__/graphics/entity/rocket-silo/07-red-lights-back/hr-red-light.png",
            width = 32,
            height = 32,
            shift = {2.3125, 0.9375-1.375},
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/rocket-silo/07-red-lights-back/red-light.png",
          width = 32,
          height = 32,
          shift = {2.65625, 1.90625-1.375},
          hr_version =
          {
            filename = "__base__/graphics/entity/rocket-silo/07-red-lights-back/hr-red-light.png",
            width = 32,
            height = 32,
            shift = {2.65625, 1.90625-1.375},
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/rocket-silo/07-red-lights-back/red-light.png",
          width = 32,
          height = 32,
          shift = {-2.65625, 1.90625-1.375},
          hr_version =
          {
            filename = "__base__/graphics/entity/rocket-silo/07-red-lights-back/hr-red-light.png",
            width = 32,
            height = 32,
            shift = {-2.65625, 1.90625-1.375},
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/rocket-silo/07-red-lights-back/red-light.png",
          width = 32,
          height = 32,
          shift = {-2.3125, 0.9375-1.375},
          hr_version =
          {
            filename = "__base__/graphics/entity/rocket-silo/07-red-lights-back/hr-red-light.png",
            width = 32,
            height = 32,
            shift = {-2.3125, 0.9375-1.375},
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/rocket-silo/07-red-lights-back/red-light.png",
          width = 32,
          height = 32,
          shift = {-1.34375, 0.28125-1.375},
          hr_version =
          {
            filename = "__base__/graphics/entity/rocket-silo/07-red-lights-back/hr-red-light.png",
            width = 32,
            height = 32,
            shift = {-1.34375, 0.28125-1.375},
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/rocket-silo/07-red-lights-back/red-light.png",
          width = 32,
          height = 32,
          shift = {0, 0-1.375},
          hr_version =
          {
            filename = "__base__/graphics/entity/rocket-silo/07-red-lights-back/hr-red-light.png",
            width = 32,
            height = 32,
            shift = {0, 0-1.375},
            scale = 0.5
          }
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
          shift = {2.3125, 2.8125-1.375},
          hr_version =
          {
            filename = "__base__/graphics/entity/rocket-silo/07-red-lights-back/hr-red-light.png",
            width = 32,
            height = 32,
            shift = {2.3125, 2.8125-1.375},
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/rocket-silo/07-red-lights-back/red-light.png",
          width = 32,
          height = 32,
          shift = {1.34375, 3.40625-1.375},
          hr_version =
          {
            filename = "__base__/graphics/entity/rocket-silo/07-red-lights-back/hr-red-light.png",
            width = 32,
            height = 32,
            shift = {1.34375, 3.40625-1.375},
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/rocket-silo/07-red-lights-back/red-light.png",
          width = 32,
          height = 32,
          shift = {0, 3.75-1.375},
          hr_version =
          {
            filename = "__base__/graphics/entity/rocket-silo/07-red-lights-back/hr-red-light.png",
            width = 32,
            height = 32,
            shift = {0, 3.75-1.375},
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/rocket-silo/07-red-lights-back/red-light.png",
          width = 32,
          height = 32,
          shift = {-1.34375, 3.40625-1.375},
          hr_version =
          {
            filename = "__base__/graphics/entity/rocket-silo/07-red-lights-back/hr-red-light.png",
            width = 32,
            height = 32,
            shift = {0, 3.75-1.375},
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/rocket-silo/07-red-lights-back/red-light.png",
          width = 32,
          height = 32,
          shift = {-2.3125, 2.8125-1.375},
          hr_version = {
            filename = "__base__/graphics/entity/rocket-silo/07-red-lights-back/hr-red-light.png",
            width = 32,
            height = 32,
            shift = {-2.3125, 2.8125-1.375},
            scale = 0.5
          }
        }
      }
    },
    satellite_animation =
    {
      filename = "__base__/graphics/entity/rocket-silo/15-rocket-silo-turbine.png",
      priority = "medium",
      width = 28,
      height = 46,
      frame_count = 32,
      line_length = 8,
      animation_speed = 0.4,
      shift = util.by_pixel(-100, 110),
      hr_version = {
        filename = "__base__/graphics/entity/rocket-silo/hr-15-rocket-silo-turbine.png",
        priority = "medium",
        width = 54,
        height = 88,
        frame_count = 32,
        line_length = 8,
        animation_speed = 0.4,
        shift = util.by_pixel(-100, 111),
        scale = 0.5
      }
    },

    arm_01_back_animation =
    {
      filename = "__base__/graphics/entity/rocket-silo/08-rocket-silo-arms-back.png",
      priority = "medium",
      width = 66,
      height = 76,
      frame_count = 32,
      line_length = 32,
      animation_speed = 0.3,
      shift = util.by_pixel(-54, -84),
      hr_version =
      {
        filename = "__base__/graphics/entity/rocket-silo/hr-08-rocket-silo-arms-back.png",
        priority = "medium",
        width = 128,
        height = 150,
        frame_count = 32,
        line_length = 32,
        animation_speed = 0.3,
        shift = util.by_pixel(-53, -84),
        scale = 0.5
      }
    },

    arm_02_right_animation =
    {
      filename = "__base__/graphics/entity/rocket-silo/08-rocket-silo-arms-right.png",
      priority = "medium",
      width = 94,
      height = 94,
      frame_count = 32,
      line_length = 32,
      animation_speed = 0.3,
      shift = util.by_pixel(100, -38),
      hr_version =
      {
        filename = "__base__/graphics/entity/rocket-silo/hr-08-rocket-silo-arms-right.png",
        priority = "medium",
        width = 182,
        height = 188,
        frame_count = 32,
        line_length = 32,
        animation_speed = 0.3,
        shift = util.by_pixel(101, -38),
        scale = 0.5
      }
    },

    arm_03_front_animation =
    {
      filename = "__base__/graphics/entity/rocket-silo/13-rocket-silo-arms-front.png",
      priority = "medium",
      width = 66,
      height = 114,
      frame_count = 32,
      line_length = 32,
      animation_speed = 0.3,
      shift = util.by_pixel(-52, 16),
      hr_version =
      {
        filename = "__base__/graphics/entity/rocket-silo/hr-13-rocket-silo-arms-front.png",
        priority = "medium",
        width = 126,
        height = 228,
        frame_count = 32,
        line_length = 32,
        animation_speed = 0.3,
        shift = util.by_pixel(-51, 16),
        scale = 0.5
      }
    },

    base_front_sprite =
    {
      filename = "__base__/graphics/entity/rocket-silo/14-rocket-silo-front.png",
      width = 292,
      height = 132,
      shift = util.by_pixel(-2, 78),
      hr_version =
      {
        filename = "__base__/graphics/entity/rocket-silo/hr-14-rocket-silo-front.png",
        width = 580,
        height = 262,
        shift = util.by_pixel(-1, 78),
        scale = 0.5
      }
    },
    silo_fade_out_start_distance = 8,
    silo_fade_out_end_distance = 15,

    alarm_sound =
    {
      filename = "__base__/sound/silo-alarm.ogg",
      volume = 1.0
    },
    clamps_on_sound =
    {
      filename = "__base__/sound/silo-clamps-on.ogg",
      volume = 1.0
    },
    clamps_off_sound =
    {
      filename = "__base__/sound/silo-clamps-off.ogg",
      volume = 1.0
    },
    doors_sound =
    {
      filename = "__base__/sound/silo-doors.ogg",
      volume = 1.0
    },
    raise_rocket_sound =
    {
      filename = "__base__/sound/silo-raise-rocket.ogg",
      volume = 1.0
    },
    flying_sound =
    {
      filename = "__base__/sound/silo-rocket.ogg",
      volume = 1.0
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

    glow_light =
    {
      intensity = 1,
      size = 30,
      shift = {0, 1.5},
      color = {r = 1.0, g = 1.0, b = 1.0}
    },

    rocket_sprite = util.add_shift_offset(util.by_pixel(0, 32*3.5), --util.mul_shift(rocket_rise_offset, -1),
    {
      filename = "__base__/graphics/entity/rocket-silo/02-rocket.png",
      width = 154,
      height = 300,
      shift = util.by_pixel(-4, -28),
      hr_version = {
        filename = "__base__/graphics/entity/rocket-silo/hr-02-rocket.png",
        width = 310,
        height = 596,
        shift = util.by_pixel(-5, -27),
        scale = 0.5
      }
    }),

    rocket_shadow_sprite = util.add_shift_offset(util.by_pixel(-146, -120),
    {
      filename = "__base__/graphics/entity/rocket-silo/09-rocket-shadow.png",
      priority = "medium",
      width = 336,
      height = 110,
      draw_as_shadow = true,
      shift = util.by_pixel(146, 120),
      hr_version = {
        filename = "__base__/graphics/entity/rocket-silo/hr-09-rocket-shadow.png",
        priority = "medium",
        width = 672,
        height = 216,
        draw_as_shadow = true,
        shift = util.by_pixel(146, 121),
        scale = 0.5
      }
    }),

    rocket_glare_overlay_sprite = util.add_shift_offset(util.by_pixel(0, 112+112),
    {
      filename = "__base__/graphics/entity/rocket-silo/03-rocket-over-glare.png",
      blend_mode = "additive",
      width = 481,
      height = 481,
      shift = util.by_pixel(-2, -2),
      flags = { "linear-magnification", "linear-minification" },
      --hr_version =
      --{
      --  filename = "__base__/graphics/entity/rocket-silo/hr-03-rocket-over-glare.png",
      --  blend_mode = "additive",
      --  width = 954,
      --  height = 954,
      --  shift = util.by_pixel(0, 0),
      --  scale = 0.5
      --}
    }),
    rocket_smoke_top1_animation = util.add_shift_offset(util.by_pixel(0-66, -112+28+232+32),
    {
      filename = "__base__/graphics/entity/rocket-silo/12-rocket-smoke.png",
      priority = "medium",
      tint = { r = 0.8, g = 0.8, b = 1, a = 0.8 },
      --tint = { r = 1, g = 0, b = 0, a = 0.8 },
      width = 41,
      height = 145,
      frame_count = 24,
      line_length = 8,
      animation_speed = 0.5,
      scale = 1.5*1.3,
      shift = util.by_pixel(-2, -2),
      hr_version = {
        filename = "__base__/graphics/entity/rocket-silo/hr-12-rocket-smoke.png",
        priority = "medium",
        tint = { r = 0.8, g = 0.8, b = 1, a = 0.8 },
        --tint = { r = 1, g = 0, b = 0, a = 0.8 },
        width = 80,
        height = 286,
        frame_count = 24,
        line_length = 8,
        animation_speed = 0.5,
        scale = 1.5/2*1.3,
        shift = util.by_pixel(-1, -3),
      }
    }),
    rocket_smoke_top2_animation = util.add_shift_offset(util.by_pixel(0+17, -112+28+265+32),
    {
      filename = "__base__/graphics/entity/rocket-silo/12-rocket-smoke.png",
      priority = "medium",
      tint = { r = 0.8, g = 0.8, b = 1, a = 0.8 },
      --tint = { r = 0, g = 1, b = 0, a = 0.8 },
      width = 41,
      height = 145,
      frame_count = 24,
      line_length = 8,
      animation_speed = 0.5,
      scale = 1.5*1.3,
      shift = util.by_pixel(-2, -2),
      hr_version = {
        filename = "__base__/graphics/entity/rocket-silo/hr-12-rocket-smoke.png",
        priority = "medium",
        tint = { r = 0.8, g = 0.8, b = 1, a = 0.8 },
        --tint = { r = 0, g = 1, b = 0, a = 0.8 },
        width = 80,
        height = 286,
        frame_count = 24,
        line_length = 8,
        animation_speed = 0.5,
        scale = 1.5/2*1.3,
        shift = util.by_pixel(-1, -3),
      }
    }),
    rocket_smoke_top3_animation = util.add_shift_offset(util.by_pixel(0+48, -112+28+252+32),
    {
      filename = "__base__/graphics/entity/rocket-silo/12-rocket-smoke.png",
      priority = "medium",
      tint = { r = 0.8, g = 0.8, b = 1, a = 0.8 },
      --tint = { r = 0, g = 0, b = 1, a = 0.8 },
      width = 41,
      height = 145,
      frame_count = 24,
      line_length = 8,
      animation_speed = 0.5,
      scale = 1.5*1.3,
      shift = util.by_pixel(-2, -2),
      hr_version = {
        filename = "__base__/graphics/entity/rocket-silo/hr-12-rocket-smoke.png",
        priority = "medium",
        tint = { r = 0.8, g = 0.8, b = 1, a = 0.8 },
        --tint = { r = 0, g = 0, b = 1, a = 0.8 },
        width = 80,
        height = 286,
        frame_count = 24,
        line_length = 8,
        animation_speed = 0.5,
        scale = 1.5/2*1.3,
        shift = util.by_pixel(-1, -3),
      }
    }),

    rocket_smoke_bottom1_animation = util.add_shift_offset(util.by_pixel(0-69, -112+28+205+32),
    {
      filename = "__base__/graphics/entity/rocket-silo/12-rocket-smoke.png",
      priority = "medium",
      tint = { r = 0.8, g = 0.8, b = 1, a = 0.7 },
      --tint = { r = 1, g = 1, b = 0, a = 0.8 },
      width = 41,
      height = 145,
      frame_count = 24,
      line_length = 8,
      animation_speed = 0.5,
      scale = 1.5*1.3,
      shift = util.by_pixel(-2, -2),
      hr_version = {
        filename = "__base__/graphics/entity/rocket-silo/hr-12-rocket-smoke.png",
        priority = "medium",
        tint = { r = 0.8, g = 0.8, b = 1, a = 0.7 },
        --tint = { r = 1, g = 1, b = 0, a = 0.8 },
        width = 80,
        height = 286,
        frame_count = 24,
        line_length = 8,
        animation_speed = 0.5,
        scale = 1.5/2*1.3,
        shift = util.by_pixel(-1, -3),
      }
    }),
    rocket_smoke_bottom2_animation = util.add_shift_offset(util.by_pixel(0+62, -112+28+207+32),
    {
      filename = "__base__/graphics/entity/rocket-silo/12-rocket-smoke.png",
      priority = "medium",
      tint = { r = 0.8, g = 0.8, b = 1, a = 0.7 },
      --tint = { r = 0, g = 1, b = 1, a = 0.8 },
      width = 41,
      height = 145,
      frame_count = 24,
      line_length = 8,
      animation_speed = 0.5,
      scale = 1.5*1.3,
      shift = util.by_pixel(-2, -2),
      hr_version = {
        filename = "__base__/graphics/entity/rocket-silo/hr-12-rocket-smoke.png",
        priority = "medium",
        tint = { r = 0.8, g = 0.8, b = 1, a = 0.7 },
        --tint = { r = 0, g = 1, b = 1, a = 0.8 },
        width = 80,
        height = 286,
        frame_count = 24,
        line_length = 8,
        animation_speed = 0.5,
        scale = 1.5/2*1.3,
        shift = util.by_pixel(-1, -3),
      }
    }),
    rocket_flame_animation = util.add_shift_offset(util.by_pixel(-1, 280-16),
    {
      filename = "__base__/graphics/entity/rocket-silo/10-jet-flame.png",
      priority = "medium",
      blend_mode = "additive",
      width = 87,
      height = 128,
      frame_count = 8,
      line_length = 8,
      animation_speed = 0.5,
      scale = 1.13,
      shift = util.by_pixel(-0.5, -2),
      hr_version = {
        filename = "__base__/graphics/entity/rocket-silo/hr-10-jet-flame.png",
        priority = "medium",
        blend_mode = "additive",
        width = 172,
        height = 256,
        frame_count = 8,
        line_length = 8,
        animation_speed = 0.5,
        scale = 1.13/2,
        shift = util.by_pixel(-1, -2),
      }
    }),
    rocket_flame_left_animation = util.add_shift_offset(util.by_pixel(-32-28+3, 280-68+1),
    {
      filename = "__base__/graphics/entity/rocket-silo/10-jet-flame.png",
      priority = "medium",
      blend_mode = "additive",
      width = 87,
      height = 128,
      frame_count = 8,
      line_length = 8,
      animation_speed = 0.5,
      scale = 0.345*1.15,
      shift = util.by_pixel(-0.5, -2),
      hr_version = {
        filename = "__base__/graphics/entity/rocket-silo/hr-10-jet-flame.png",
        priority = "medium",
        blend_mode = "additive",
        width = 172,
        height = 256,
        frame_count = 8,
        line_length = 8,
        animation_speed = 0.5,
        scale = 0.345/2*1.15,
        shift = util.by_pixel(-1, -2),
      }
    }),
    rocket_flame_left_rotation = 0.0611,

    rocket_flame_right_animation = util.add_shift_offset(util.by_pixel(32+16, 280-50),
    {
      filename = "__base__/graphics/entity/rocket-silo/10-jet-flame.png",
      priority = "medium",
      blend_mode = "additive",
      width = 87,
      height = 128,
      frame_count = 8,
      line_length = 8,
      animation_speed = 0.5,
      scale = 0.368*1.15,
      shift = util.by_pixel(-0.5, -2),
      hr_version = {
        filename = "__base__/graphics/entity/rocket-silo/hr-10-jet-flame.png",
        priority = "medium",
        blend_mode = "additive",
        width = 172,
        height = 256,
        frame_count = 8,
        line_length = 8,
        animation_speed = 0.5,
        scale = 0.368/2*1.15,
        shift = util.by_pixel(-1, -2),
      }
    }),
    rocket_flame_right_rotation = 0.952,

    rocket_initial_offset = {0, 1.5},
    rocket_rise_offset = {0, -3.5},
    rocket_launch_offset = {0, -256},
    rocket_render_layer_switch_distance = 7.5,
    full_render_layer_switch_distance = 9,
    effects_fade_in_start_distance = 4.5,
    effects_fade_in_end_distance = 7.5,
    shadow_fade_out_start_ratio = 0.25,
    shadow_fade_out_end_ratio = 0.75,
    rocket_visible_distance_from_center = 2.75,
  },
  {
    type = "rocket-silo-rocket-shadow",
    name = "rocket-silo-rocket-shadow",
    flags = {"not-on-map"},
    collision_mask = {"not-colliding-with-itself"},
    collision_box = {{0, 0}, {10, 3.5}},
    selection_box = {{0, 0}, {0, 0}}
  },
  {
    type = "roboport",
    name = "roboport",
    icon = "__base__/graphics/icons/roboport.png",
    icon_size = 32,
    flags = {"placeable-player", "player-creation"},
    minable = {mining_time = 0.1, result = "roboport"},
    max_health = 500,
    corpse = "roboport-remnants",
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
      {-1.5, -0.5}, {1.5, -0.5}, {1.5, 1.5}, {-1.5, 1.5}
    },
    base =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/roboport/roboport-base.png",
          width = 143,
          height = 135,
          shift = {0.5, 0.25},
          hr_version =
          {
            filename = "__base__/graphics/entity/roboport/hr-roboport-base.png",
            width = 228,
            height = 277,
            shift = util.by_pixel(2, 7.75),
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/roboport/roboport-shadow.png",
          width = 147,
          height = 101,
          draw_as_shadow = true,
          shift = util.by_pixel(28.5, 19.25),
          hr_version =
          {
            filename = "__base__/graphics/entity/roboport/hr-roboport-shadow.png",
            width = 294,
            height = 201,
            draw_as_shadow = true,
            force_hr_shadow = true,
            shift = util.by_pixel(28.5, 19.25),
            scale = 0.5
          }
        }
      }
    },
    base_patch =
    {
      filename = "__base__/graphics/entity/roboport/roboport-base-patch.png",
      priority = "medium",
      width = 69,
      height = 50,
      frame_count = 1,
      shift = {0.03125, 0.203125},
      hr_version =
      {
        filename = "__base__/graphics/entity/roboport/hr-roboport-base-patch.png",
        priority = "medium",
        width = 138,
        height = 100,
        frame_count = 1,
        shift = util.by_pixel(1.5, 5),
        scale = 0.5
      }
    },
    base_animation =
    {
      filename = "__base__/graphics/entity/roboport/roboport-base-animation.png",
      priority = "medium",
      width = 42,
      height = 31,
      frame_count = 8,
      animation_speed = 0.5,
      shift = {-0.5315, -1.9375},
      hr_version =
      {
        filename = "__base__/graphics/entity/roboport/hr-roboport-base-animation.png",
        priority = "medium",
        width = 83,
        height = 59,
        frame_count = 8,
        animation_speed = 0.5,
        shift = util.by_pixel(-17.75, -61.25),
        scale = 0.5
      }
    },
    door_animation_up =
    {
      filename = "__base__/graphics/entity/roboport/roboport-door-up.png",
      priority = "medium",
      width = 52,
      height = 20,
      frame_count = 16,
      shift = {0.015625, -0.890625},
      hr_version =
      {
        filename = "__base__/graphics/entity/roboport/hr-roboport-door-up.png",
        priority = "medium",
        width = 97,
        height = 38,
        frame_count = 16,
        shift = util.by_pixel(-0.25, -29.5),
        scale = 0.5
      }
    },
    door_animation_down =
    {
      filename = "__base__/graphics/entity/roboport/roboport-door-down.png",
      priority = "medium",
      width = 52,
      height = 22,
      frame_count = 16,
      shift = {0.015625, -0.234375},
      hr_version =
      {
        filename = "__base__/graphics/entity/roboport/hr-roboport-door-down.png",
        priority = "medium",
        width = 97,
        height = 41,
        frame_count = 16,
        shift = util.by_pixel(-0.25,-9.75),
        scale = 0.5
      }
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
        sound = { filename = "__base__/sound/roboport-door.ogg", volume = 1.0 }
      }
    },
    close_door_trigger_effect =
    {
      {
        type = "play-sound",
        sound = { filename = "__base__/sound/roboport-door.ogg", volume = 0.75 }
      }
    },

    circuit_wire_connection_point = circuit_connector_definitions["roboport"].points,
    circuit_connector_sprites = circuit_connector_definitions["roboport"].sprites,
    circuit_wire_max_distance = default_circuit_wire_max_distance,

    default_available_logistic_output_signal = {type = "virtual", name = "signal-X"},
    default_total_logistic_output_signal = {type = "virtual", name = "signal-Y"},
    default_available_construction_output_signal = {type = "virtual", name = "signal-Z"},
    default_total_construction_output_signal = {type = "virtual", name = "signal-T"}
  },

  {
    type = "storage-tank",
    name = "storage-tank",
    icon = "__base__/graphics/icons/storage-tank.png",
    icon_size = 32,
    flags = {"placeable-player", "player-creation"},
    minable = {mining_time = 0.5, result = "storage-tank"},
    max_health = 500,
    corpse = "storage-tank-remnants",
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
        { position = {-2, -1} }
      }
    },
    two_direction_only = true,
    window_bounding_box = {{-0.125, 0.6875}, {0.1875, 1.1875}},
    pictures =
    {
      picture =
      {
        sheets =
        {
          {
            filename = "__base__/graphics/entity/storage-tank/storage-tank.png",
            priority = "extra-high",
            frames = 2,
            width = 110,
            height = 108,
            shift = util.by_pixel(0, 4),
            hr_version =
            {
              filename = "__base__/graphics/entity/storage-tank/hr-storage-tank.png",
              priority = "extra-high",
              frames = 2,
              width = 219,
              height = 215,
              shift = util.by_pixel(-0.25, 3.75),
              scale = 0.5
            }
          },
          {
            filename = "__base__/graphics/entity/storage-tank/storage-tank-shadow.png",
            priority = "extra-high",
            frames = 2,
            width = 146,
            height = 77,
            shift = util.by_pixel(30, 22.5),
            draw_as_shadow = true,
            hr_version =
            {
              filename = "__base__/graphics/entity/storage-tank/hr-storage-tank-shadow.png",
              priority = "extra-high",
              frames = 2,
              width = 291,
              height = 153,
              shift = util.by_pixel(29.75, 22.25),
              scale = 0.5,
              draw_as_shadow = true
            }
          }
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
        height = 24,
        hr_version =
        {
          filename = "__base__/graphics/entity/storage-tank/hr-window-background.png",
          priority = "extra-high",
          width = 34,
          height = 48,
          scale = 0.5
        }
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
          direction_count = 1,
          scale = 0.5
        }
      }
    },
    flow_length_in_ticks = 360,
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      sound =
      {
          filename = "__base__/sound/storage-tank.ogg",
          volume = 0.8
      },
      match_volume_to_activity = true,
      apparent_volume = 1.5,
      max_sounds_per_type = 3
    },

    circuit_wire_connection_points = circuit_connector_definitions["storage-tank"].points,
    circuit_connector_sprites = circuit_connector_definitions["storage-tank"].sprites,
    circuit_wire_max_distance = default_circuit_wire_max_distance
  },

  {
    type = "pump",
    name = "pump",
    icon = "__base__/graphics/icons/pump.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.2, result = "pump"},
    max_health = 180,
    fast_replaceable_group = "pipe",
    corpse = "pump-remnants",
    collision_box = {{-0.29, -0.9}, {0.29, 0.9}},
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
        { position = {0, 1.5}, type="input" }
      }
    },
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input"
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
        hr_version =
        {
          filename = "__base__/graphics/entity/pump/hr-pump-north.png",
          width = 103,
          height = 164,
          scale = 0.5,
          line_length =8,
          frame_count =32,
          animation_speed = 0.5,
          shift = util.by_pixel(8, 3.5) -- {0.515625, 0.21875}
        }
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
        hr_version =
        {
          filename = "__base__/graphics/entity/pump/hr-pump-east.png",
          width = 130,
          height = 109,
          scale = 0.5,
          line_length =8,
          frame_count =32,
          animation_speed = 0.5,
          shift = util.by_pixel(-0.5, 1.75) --{-0.03125, 0.109375}
        }
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
        hr_version =
        {
          filename = "__base__/graphics/entity/pump/hr-pump-south.png",
          width = 114,
          height = 160,
          scale = 0.5,
          line_length =8,
          frame_count =32,
          animation_speed = 0.5,
          shift = util.by_pixel(12.5, -8) -- {0.75, -0.5}
        }
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
        hr_version =
        {
          filename = "__base__/graphics/entity/pump/hr-pump-west.png",
          width = 131,
          height = 111,
          scale = 0.5,
          line_length =8,
          frame_count =32,
          animation_speed = 0.5,
          shift = util.by_pixel(-0.25, 1.25) -- {-0.015625, 0.078125}
        }
      }
    },

    fluid_wagon_connector_frame_count = 35,
    fluid_wagon_connector_alignment_tolerance = 2.0 / 32.0,

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
        hr_version =
        {
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
        hr_version =
        {
          filename = "__base__/graphics/entity/pump/hr-pump-east-liquid.png",
          width = 35,
          height = 46,
          scale = 0.5,
          line_length =8,
          frame_count =32,
          shift = util.by_pixel(6.250, -8.500)
        }
      },

      south =
      {
        filename = "__base__/graphics/entity/pump/pump-south-liquid.png",
        width = 26,
        height = 55,
        line_length =8,
        frame_count =32,
        shift = util.by_pixel(3.500, 6.500),
        hr_version =
        {
          filename = "__base__/graphics/entity/pump/hr-pump-south-liquid.png",
          width = 38,
          height = 45,
          scale = 0.5,
          line_length =8,
          frame_count =32,
          shift = util.by_pixel(0.500, -9.250)
        }
      },
      west =
      {
        filename = "__base__/graphics/entity/pump/pump-west-liquid.png",
        width = 18,
        height = 24,
        line_length =8,
        frame_count =32,
        shift = util.by_pixel(-6.000, -9.000),
        hr_version =
        {
          filename = "__base__/graphics/entity/pump/hr-pump-west-liquid.png",
          width = 35,
          height = 47,
          scale = 0.5,
          line_length =8,
          frame_count =32,
          shift = util.by_pixel(-6.500, -9.500)
        }
      }
    },

    glass_pictures =
    {
      north =
      {
        filename = "__base__/graphics/entity/pump/pump-north-glass.png",
        width = 32,
        height = 64,
        hr_version =
        {
          filename = "__base__/graphics/entity/pump/hr-pump-north-glass.png",
          width = 64,
          height = 128,
          scale = 0.5
        }
      },
      east =
      {
        filename = "__base__/graphics/entity/pump/pump-east-glass.png",
        width = 32,
        height = 32,
        shift = util.by_pixel(0.000, -16.000),
        hr_version =
        {
          filename = "__base__/graphics/entity/pump/hr-pump-east-glass.png",
          width = 128,
          height = 192,
          scale = 0.5
        }
      },
      south =
      {
        filename = "__base__/graphics/entity/pump/pump-south-glass.png",
        width = 32,
        height = 64,
        hr_version =
        {
          filename = "__base__/graphics/entity/pump/hr-pump-south-glass.png",
          width = 64,
          height = 128,
          scale = 0.5
        }
      },
      west =
      {
        filename = "__base__/graphics/entity/pump/pump-west-glass.png",
        width = 32,
        height = 96,
        shift = util.by_pixel(0.000, 15.000),
        hr_version =
        {
          filename = "__base__/graphics/entity/pump/hr-pump-west-glass.png",
          width = 192,
          height = 192,
          scale = 0.5,
          shift = util.by_pixel(-16.000, 0.000)
        }
      }
    },

    circuit_wire_connection_points = circuit_connector_definitions["pump"].points,
    circuit_connector_sprites = circuit_connector_definitions["pump"].sprites,
    circuit_wire_max_distance = default_circuit_wire_max_distance
  },

  {
    type = "explosion",
    name = "laser-bubble",
    flags = {"not-on-map"},
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
    rotate = true,
    beam = true,
    animations =
    {
      {
        filename = "__base__/graphics/entity/blue-beam/blue-beam.png",
        priority = "extra-high",
        width = 187,
        height = 1,
        frame_count = 6
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
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    allow_access_to_all_forces = true,
    order = "d-a-a",
    subgroup = "other",
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
    name = "substation",
    icon = "__base__/graphics/icons/substation.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.1, result = "substation"},
    max_health = 200,
    corpse = "substation-remnants",
    track_coverage_during_build_by_moving = true,
    resistances =
    {
      {
        type = "fire",
        percent = 90
      }
    },
    collision_box = {{-0.7, -0.7}, {0.7, 0.7}},
    selection_box = {{-1, -1}, {1, 1}},
    drawing_box = {{-1, -3}, {1, 1}},
    maximum_wire_distance = 18,
    supply_area_distance = 9,
    pictures =
    {
      layers =
      {

        {
          filename = "__base__/graphics/entity/substation/substation.png",
          priority = "high",
          width = 70,
          height = 136,
          direction_count = 4,
          shift = util.by_pixel(0, 1-32),
          hr_version =
          {
            filename = "__base__/graphics/entity/substation/hr-substation.png",
            priority = "high",
            width = 138,
            height = 270,
            direction_count = 4,
            shift = util.by_pixel(0, 1-32),
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/substation/substation-shadow.png",
          priority = "high",
          width = 186,
          height = 52,
          direction_count = 4,
          shift = util.by_pixel(62, 42-32),
          draw_as_shadow = true,
          hr_version =
          {
            filename = "__base__/graphics/entity/substation/hr-substation-shadow.png",
            priority = "high",
            width = 370,
            height = 104,
            direction_count = 4,
            shift = util.by_pixel(62, 42-32),
            draw_as_shadow = true,
            scale = 0.5
          }
        }
      }
    },

    --active_picture =
    --{
    --  filename = "__base__/graphics/entity/substation/substation-light.png",
    --  priority = "high",
    --  width = 46,
    --  height = 78,
    --  --direction_count = 4,
    --  shift = util.by_pixel(0, 16-32),
    --  blend_mode = "additive",
    --  hr_version =
    --  {
    --    filename = "__base__/graphics/entity/substation/hr-substation-light.png",
    --    priority = "high",
    --    width = 92,
    --    height = 156,
    --    --direction_count = 4,
    --    shift = util.by_pixel(0.5, 16.5-32),
    --    blend_mode = "additive",
    --    scale = 0.5
    --  }
    --},
    --light = {intensity = 0.75, size = 3, color = {r = 1.0, g = 1.0, b = 1.0}},

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
          copper = util.by_pixel(136, 8),
          green = util.by_pixel(124, 8),
          red = util.by_pixel(151, 9)
        },
        wire =
        {
          copper = util.by_pixel(0, -86),
          green = util.by_pixel(-21, -82),
          red = util.by_pixel(22, -81)
        }
      },
      {
        shadow =
        {
          copper = util.by_pixel(133, 9),
          green = util.by_pixel(144, 21),
          red = util.by_pixel(110, -3)
        },
        wire =
        {
          copper = util.by_pixel(0, -85),
          green = util.by_pixel(15, -70),
          red = util.by_pixel(-15, -92)
        }
      },
      {
        shadow =
        {
          copper = util.by_pixel(133, 9),
          green = util.by_pixel(127, 26),
          red = util.by_pixel(127, -8)
        },
        wire =
        {
          copper = util.by_pixel(0, -85),
          green = util.by_pixel(0, -66),
          red = util.by_pixel(0, -97)
        }
      },
      {
        shadow =
        {
          copper = util.by_pixel(133, 9),
          green = util.by_pixel(111, 20),
          red = util.by_pixel(144, -3)
        },
        wire =
        {
          copper = util.by_pixel(0, -86),
          green = util.by_pixel(-15, -71),
          red = util.by_pixel(15, -92)
        }
      }
    },
    radius_visualisation_picture =
    {
      filename = "__base__/graphics/entity/small-electric-pole/electric-pole-radius-visualization.png",
      width = 12,
      height = 12,
      priority = "extra-high-no-scale"
    }
  },
  {
    type = "accumulator",
    name = "accumulator",
    icon = "__base__/graphics/icons/accumulator.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.1, result = "accumulator"},
    max_health = 150,
    corpse = "accumulator-remnants",
    collision_box = {{-0.9, -0.9}, {0.9, 0.9}},
    selection_box = {{-1, -1}, {1, 1}},
    drawing_box = {{-1, -1.5}, {1, 1}},
    energy_source =
    {
      type = "electric",
      buffer_capacity = "5MJ",
      usage_priority = "tertiary",
      input_flow_limit = "300kW",
      output_flow_limit = "300kW"
    },
    picture = accumulator_picture(),
    charge_animation = accumulator_charge(),

    charge_cooldown = 30,
    charge_light = {intensity = 0.3, size = 7, color = {r = 1.0, g = 1.0, b = 1.0}},
    discharge_animation = accumulator_discharge(),
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
      idle_sound =
      {
        filename = "__base__/sound/accumulator-idle.ogg",
        volume = 0.4
      },
      max_sounds_per_type = 5
    },

    circuit_wire_connection_point = circuit_connector_definitions["accumulator"].points,
    circuit_connector_sprites = circuit_connector_definitions["accumulator"].sprites,
    circuit_wire_max_distance = default_circuit_wire_max_distance,

    default_output_signal = {type = "virtual", name = "signal-A"}
  },
  {
    type = "beacon",
    name = "beacon",
    icon = "__base__/graphics/icons/beacon.png",
    icon_size = 32,
    flags = {"placeable-player", "player-creation"},
    minable = {mining_time = 0.2, result = "beacon"},
    max_health = 200,
    corpse = "medium-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    drawing_box = {{-1.5, -2.2}, {1.5, 1.3}},
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
      priority = "extra-high-no-scale",
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
      scale = 3
    },
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
            radius = 11,
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
    icon_size = 32,
    flags = {"placeable-player", "player-creation", "placeable-off-grid", "not-on-map", "not-repairable"},
    resistances = { { type = "fire", percent = 95 } },
    order="e-a-b",
    subgroup="capsule",
    max_health = 90,
    alert_when_damaged = false,
    collision_box = {{0, 0}, {0, 0}},
    selection_box = {{-0.9, -1.5}, {0.9, -0.5}},
    time_to_live = 60 * 45,
    speed = 0,
    resistances =
    {
      {
        type = "acid",
        decrease = 0,
        percent = 85
      },
    },
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
      ammo_category = "combat-robot-laser",
      cooldown = 20,
      damage_modifier = 1,
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
            type = "beam",
            beam = "laser-beam",
            max_length = 15,
            duration = 20,
            --starting_speed = 0.3
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
          shift = {0, -0.078125},
          hr_version =
          {
            filename = "__base__/graphics/entity/distractor-robot/hr-distractor-robot.png",
            priority = "high",
            line_length = 16,
            width = 72,
            height = 62,
            frame_count = 1,
            direction_count = 16,
            shift = util.by_pixel(0, -2.5),
            scale = 0.5
          }
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
          hr_version =
          {
            filename = "__base__/graphics/entity/distractor-robot/hr-distractor-robot-mask.png",
            priority = "high",
            line_length = 16,
            width = 42,
            height = 37,
            frame_count = 1,
            direction_count = 16,
            shift = util.by_pixel(0, -6.25),
            apply_runtime_tint = true,
            scale = 0.5
          }
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
      shift = {0.9375, 0.609375},
      hr_version =
      {
        filename = "__base__/graphics/entity/distractor-robot/hr-distractor-robot-shadow.png",
        priority = "high",
        line_length = 16,
        width = 96,
        height = 59,
        frame_count = 1,
        direction_count = 16,
        shift = util.by_pixel(32.5, 19.25),
        scale = 0.5
      }
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
          y = 33,
          hr_version =
          {
            filename = "__base__/graphics/entity/distractor-robot/hr-distractor-robot.png",
            priority = "high",
            line_length = 16,
            width = 72,
            height = 62,
            frame_count = 1,
            direction_count = 16,
            shift = util.by_pixel(0, -2.5),
            y = 62,
            scale = 0.5
          }
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
          y = 21,
          hr_version =
          {
            filename = "__base__/graphics/entity/distractor-robot/hr-distractor-robot-mask.png",
            priority = "high",
            line_length = 16,
            width = 42,
            height = 37,
            frame_count = 1,
            direction_count = 16,
            shift = util.by_pixel(0, -6.25),
            apply_runtime_tint = true,
            y = 37,
            scale = 0.5
          }
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
      shift = {0.9375, 0.609375},
      hr_version =
      {
        filename = "__base__/graphics/entity/distractor-robot/hr-distractor-robot-shadow.png",
        priority = "high",
        line_length = 16,
        width = 96,
        height = 59,
        frame_count = 1,
        direction_count = 16,
        shift = util.by_pixel(32.5, 19.25),
        scale = 0.5
      }
    }
  },
  {
    type = "combat-robot",
    name = "defender",
    icon = "__base__/graphics/icons/defender.png",
    icon_size = 32,
    flags = {"placeable-player", "player-creation", "placeable-off-grid", "not-on-map", "not-repairable"},
    resistances = { { type = "fire", percent = 95 } },
    subgroup="capsule",
    order="e-a-a",
    max_health = 60,
    alert_when_damaged = false,
    collision_box = {{0, 0}, {0, 0}},
    selection_box = {{-0.5, -1.5}, {0.5, -0.5}},
    time_to_live = 60 * 45,
    follows_player = true,
    friction = 0.01,
    range_from_player = 6.0,
    speed = 0.01,
    resistances =
    {
      {
        type = "acid",
        decrease = 0,
        percent = 80
      },
    },
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
                damage = { amount = 8 , type = "physical"}
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
          shift = {0, 0.015625},
          hr_version =
          {
            filename = "__base__/graphics/entity/defender-robot/hr-defender-robot.png",
            priority = "high",
            line_length = 16,
            width = 56,
            height = 59,
            frame_count = 1,
            direction_count = 16,
            shift = util.by_pixel(0, 0.25),
            scale = 0.5
          }
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
          hr_version =
          {
            filename = "__base__/graphics/entity/defender-robot/hr-defender-robot-mask.png",
            priority = "high",
            line_length = 16,
            width = 28,
            height = 21,
            frame_count = 1,
            direction_count = 16,
            shift = util.by_pixel(0, -4.75),
            apply_runtime_tint = true,
            scale = 0.5
          }
        }
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
      shift = {0.859375, 0.609375},
      hr_version =
      {
        filename = "__base__/graphics/entity/defender-robot/hr-defender-robot-shadow.png",
        priority = "high",
        line_length = 16,
        width = 88,
        height = 50,
        frame_count = 1,
        direction_count = 16,
        shift = util.by_pixel(25.5, 19),
        scale = 0.5
      }
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
          y = 33,
          hr_version =
          {
            filename = "__base__/graphics/entity/defender-robot/hr-defender-robot.png",
            priority = "high",
            line_length = 16,
            width = 56,
            height = 59,
            frame_count = 1,
            direction_count = 16,
            shift = util.by_pixel(0, 0.25),
            y = 59,
            scale = 0.5
          }
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
          y = 16,
          hr_version =
          {
            filename = "__base__/graphics/entity/defender-robot/hr-defender-robot-mask.png",
            priority = "high",
            line_length = 16,
            width = 28,
            height = 21,
            frame_count = 1,
            direction_count = 16,
            shift = util.by_pixel(0, -4.75),
            apply_runtime_tint = true,
            y = 21,
            scale = 0.5
          }
        }
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
      shift = {0.859375, 0.609375},
      hr_version =
      {
        filename = "__base__/graphics/entity/defender-robot/hr-defender-robot-shadow.png",
        priority = "high",
        line_length = 16,
        width = 88,
        height = 50,
        frame_count = 1,
        direction_count = 16,
        shift = util.by_pixel(25.5, 19),
        scale = 0.5
      }
    }
  },

  {
    type = "combat-robot",
    name = "destroyer",
    icon = "__base__/graphics/icons/destroyer.png",
    icon_size = 32,
    flags = {"placeable-player", "player-creation", "placeable-off-grid", "not-on-map", "not-repairable"},
    resistances = { { type = "fire", percent = 95 } },
    subgroup="capsule",
    order="e-a-c",
    max_health = 60,
    alert_when_damaged = false,
    collision_box = {{0, 0}, {0, 0}},
    selection_box = {{-0.5, -1.5}, {0.5, -0.5}},
    time_to_live = 60 * 60 * 2,
    speed = 0.01,
    follows_player = true,
    friction = 0.01,
    range_from_player = 6.0,
    resistances =
    {
      {
        type = "acid",
        decrease = 0,
        percent = 90
      },
    },
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
            source_offset = {0.15, -0.5}
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
          hr_version =
          {
            filename = "__base__/graphics/entity/destroyer-robot/hr-destroyer-robot.png",
            priority = "high",
            line_length = 32,
            width = 88,
            height = 77,
            y = 77,
            frame_count = 1,
            direction_count = 32,
            shift = util.by_pixel(2.5, -17.25),
            scale = 0.5
          }
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
          apply_runtime_tint = true,
          hr_version =
          {
            filename = "__base__/graphics/entity/destroyer-robot/hr-destroyer-robot-mask.png",
            priority = "high",
            line_length = 32,
            width = 52,
            height = 42,
            y = 42,
            frame_count = 1,
            direction_count = 32,
            shift = util.by_pixel(2.5, -23),
            apply_runtime_tint = true,
            scale = 0.5
          }
        }
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
      shift = {0.78125, 0},
      hr_version =
      {
        filename = "__base__/graphics/entity/destroyer-robot/hr-destroyer-robot-shadow.png",
        priority = "high",
        line_length = 32,
        width = 108,
        height = 66,
        frame_count = 1,
        direction_count = 32,
        shift = util.by_pixel(23.5, 1),
        scale = 0.5
      }
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
          shift = {0.078125, -0.546875},
          hr_version =
          {
            filename = "__base__/graphics/entity/destroyer-robot/hr-destroyer-robot.png",
            priority = "high",
            line_length = 32,
            width = 88,
            height = 77,
            frame_count = 1,
            direction_count = 32,
            shift = util.by_pixel(2.5, -17.25),
            scale = 0.5
          }
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
          apply_runtime_tint = true,
          hr_version =
          {
            filename = "__base__/graphics/entity/destroyer-robot/hr-destroyer-robot-mask.png",
            priority = "high",
            line_length = 32,
            width = 52,
            height = 42,
            frame_count = 1,
            direction_count = 32,
            shift = util.by_pixel(2.5, -23),
            apply_runtime_tint = true,
            scale = 0.5
          }
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
      shift = {0.78125, 0},
      hr_version =
      {
        filename = "__base__/graphics/entity/destroyer-robot/hr-destroyer-robot-shadow.png",
        priority = "high",
        line_length = 32,
        width = 108,
        height = 66,
        frame_count = 1,
        direction_count = 32,
        shift = util.by_pixel(23.5, 1),
        scale = 0.5
      }
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
    icon_size = 32,
    flags = {"placeable-neutral","player-creation"},
    minable = {mining_time = 0.2, result = "oil-refinery"},
    max_health = 350,
    dying_explosion = "medium-explosion",
    corpse = "oil-refinery-remnants",
    collision_box = {{-2.4, -2.4}, {2.4, 2.4}},
    selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
    drawing_box = {{-2.5, -2.8}, {2.5, 2.5}},
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
      emissions_per_minute = 6
    },
    energy_usage = "420kW",


    animation = make_4way_animation_from_spritesheet({ layers =
    {
      {
        filename = "__base__/graphics/entity/oil-refinery/oil-refinery.png",
        width = 337,
        height = 255,
        frame_count = 1,
        shift = {2.515625, 0.484375},
        hr_version =
        {
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
        hr_version =
        {
          filename = "__base__/graphics/entity/oil-refinery/hr-oil-refinery-shadow.png",
          width = 674,
          height = 426,
          frame_count = 1,
          shift = util.by_pixel(82.5, 26.5),
          draw_as_shadow = true,
          force_hr_shadow = true,
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
          hr_version =
          {
            filename = "__base__/graphics/entity/oil-refinery/hr-oil-refinery-fire.png",
            line_length = 10,
            width = 40,
            height = 81,
            frame_count = 60,
            animation_speed = 0.75,
            scale = 0.5,
            shift = util.by_pixel(0, -14.25)
          }
        },
        light = {intensity = 0.4, size = 6, color = {r = 1.0, g = 1.0, b = 1.0}}
      }
    },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      sound = { filename = "__base__/sound/oil-refinery.ogg" },
      idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.6 },
      apparent_volume = 2.5
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
    }
  },

  {
    type = "assembling-machine",
    name = "chemical-plant",
    icon = "__base__/graphics/icons/chemical-plant.png",
    icon_size = 32,
    flags = {"placeable-neutral","placeable-player", "player-creation"},
    minable = {mining_time = 0.1, result = "chemical-plant"},
    max_health = 300,
    corpse = "chemical-plant-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    drawing_box = {{-1.5, -1.9}, {1.5, 1.5}},
    module_specification =
    {
      module_slots = 3
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution"},

    animation = make_4way_animation_from_spritesheet({ layers =
    {
      {
        filename = "__base__/graphics/entity/chemical-plant/chemical-plant.png",
        width = 108,
        height = 148,
        frame_count = 24,
        line_length = 12,
        shift = util.by_pixel(1, -9),
        hr_version =
        {
          filename = "__base__/graphics/entity/chemical-plant/hr-chemical-plant.png",
          width = 220,
          height = 292,
          frame_count = 24,
          line_length = 12,
          shift = util.by_pixel(0.5, -9),
          scale = 0.5
          }
      },
      {
        filename = "__base__/graphics/entity/chemical-plant/chemical-plant-shadow.png",
        width = 154,
        height = 112,
        repeat_count = 24,
        frame_count = 1,
        shift = util.by_pixel(28, 6),
        draw_as_shadow = true,
        hr_version =
        {
          filename = "__base__/graphics/entity/chemical-plant/hr-chemical-plant-shadow.png",
          width = 312,
          height = 222,
          repeat_count = 24,
          frame_count = 1,
          shift = util.by_pixel(27, 6),
          draw_as_shadow = true,
          scale = 0.5
          }
      }
    }}),
    working_visualisations =
    {
      {
        apply_recipe_tint = "primary",
        north_animation =
        {
          filename = "__base__/graphics/entity/chemical-plant/chemical-plant-liquid-north.png",
          frame_count = 24,
          line_length = 6,
          width = 32,
          height = 24,
          shift = util.by_pixel(24, 14),
          hr_version =
          {
            filename = "__base__/graphics/entity/chemical-plant/hr-chemical-plant-liquid-north.png",
            frame_count = 24,
            line_length = 6,
            width = 66,
            height = 44,
            shift = util.by_pixel(23, 15),
            scale = 0.5
          }
        },
        east_animation =
        {
          filename = "__base__/graphics/entity/chemical-plant/chemical-plant-liquid-east.png",
          frame_count = 24,
          line_length = 6,
          width = 36,
          height = 18,
          shift = util.by_pixel(0, 22),
          hr_version =
          {
            filename = "__base__/graphics/entity/chemical-plant/hr-chemical-plant-liquid-east.png",
            frame_count = 24,
            line_length = 6,
            width = 70,
            height = 36,
            shift = util.by_pixel(0, 22),
            scale = 0.5
          }
        },
        south_animation =
        {
          filename = "__base__/graphics/entity/chemical-plant/chemical-plant-liquid-south.png",
          frame_count = 24,
          line_length = 6,
          width = 34,
          height = 24,
          shift = util.by_pixel(0, 16),
          hr_version =
          {
            filename = "__base__/graphics/entity/chemical-plant/hr-chemical-plant-liquid-south.png",
            frame_count = 24,
            line_length = 6,
            width = 66,
            height = 42,
            shift = util.by_pixel(0, 17),
            scale = 0.5
          }
        },
        west_animation =
        {
          filename = "__base__/graphics/entity/chemical-plant/chemical-plant-liquid-west.png",
          frame_count = 24,
          line_length = 6,
          width = 38,
          height = 20,
          shift = util.by_pixel(-10, 12),
          hr_version =
          {
            filename = "__base__/graphics/entity/chemical-plant/hr-chemical-plant-liquid-west.png",
            frame_count = 24,
            line_length = 6,
            width = 74,
            height = 36,
            shift = util.by_pixel(-10, 13),
            scale = 0.5
          }
        }
      },
      {
        apply_recipe_tint = "secondary",
        north_animation =
        {
          filename = "__base__/graphics/entity/chemical-plant/chemical-plant-foam-north.png",
          frame_count = 24,
          line_length = 6,
          width = 32,
          height = 22,
          shift = util.by_pixel(24, 14),
          hr_version =
          {
            filename = "__base__/graphics/entity/chemical-plant/hr-chemical-plant-foam-north.png",
            frame_count = 24,
            line_length = 6,
            width = 62,
            height = 42,
            shift = util.by_pixel(24, 15),
            scale = 0.5
          }
        },
        east_animation =
        {
          filename = "__base__/graphics/entity/chemical-plant/chemical-plant-foam-east.png",
          frame_count = 24,
          line_length = 6,
          width = 34,
          height = 18,
          shift = util.by_pixel(0, 22),
          hr_version =
          {
            filename = "__base__/graphics/entity/chemical-plant/hr-chemical-plant-foam-east.png",
            frame_count = 24,
            line_length = 6,
            width = 68,
            height = 36,
            shift = util.by_pixel(0, 22),
            scale = 0.5
          }
        },
        south_animation =
        {
          filename = "__base__/graphics/entity/chemical-plant/chemical-plant-foam-south.png",
          frame_count = 24,
          line_length = 6,
          width = 32,
          height = 18,
          shift = util.by_pixel(0, 18),
          hr_version =
          {
            filename = "__base__/graphics/entity/chemical-plant/hr-chemical-plant-foam-south.png",
            frame_count = 24,
            line_length = 6,
            width = 60,
            height = 40,
            shift = util.by_pixel(1, 17),
            scale = 0.5
          }
        },
        west_animation =
        {
          filename = "__base__/graphics/entity/chemical-plant/chemical-plant-foam-west.png",
          frame_count = 24,
          line_length = 6,
          width = 36,
          height = 16,
          shift = util.by_pixel(-10, 14),
          hr_version =
          {
            filename = "__base__/graphics/entity/chemical-plant/hr-chemical-plant-foam-west.png",
            frame_count = 24,
            line_length = 6,
            width = 68,
            height = 28,
            shift = util.by_pixel(-9, 15),
            scale = 0.5
          }
        }
      },
      {
        apply_recipe_tint = "tertiary",
        fadeout = true,
        constant_speed = true,
        north_position = util.by_pixel_hr(-30, -161),
        east_position = util.by_pixel_hr(29, -150),
        south_position = util.by_pixel_hr(12, -134),
        west_position = util.by_pixel_hr(-32, -130),
        render_layer = "wires",
        animation =
        {
          filename = "__base__/graphics/entity/chemical-plant/chemical-plant-smoke-outer.png",
          frame_count = 47,
          line_length = 16,
          width = 46,
          height = 94,
          animation_speed = 0.5,
          shift = util.by_pixel(-2, -40),
          hr_version =
          {
            filename = "__base__/graphics/entity/chemical-plant/hr-chemical-plant-smoke-outer.png",
            frame_count = 47,
            line_length = 16,
            width = 90,
            height = 188,
            animation_speed = 0.5,
            shift = util.by_pixel(-2, -40),
            scale = 0.5
          }
        }
      },
      {
        apply_recipe_tint = "quaternary",
        fadeout = true,
        constant_speed = true,
        north_position = util.by_pixel_hr(-30, -161),
        east_position = util.by_pixel_hr(29, -150),
        south_position = util.by_pixel_hr(12, -134),
        west_position = util.by_pixel_hr(-32, -130),
        render_layer = "wires",
        animation =
        {
          filename = "__base__/graphics/entity/chemical-plant/chemical-plant-smoke-inner.png",
          frame_count = 47,
          line_length = 16,
          width = 20,
          height = 42,
          animation_speed = 0.5,
          shift = util.by_pixel(0, -14),
          hr_version =
          {
            filename = "__base__/graphics/entity/chemical-plant/hr-chemical-plant-smoke-inner.png",
            frame_count = 47,
            line_length = 16,
            width = 40,
            height = 84,
            animation_speed = 0.5,
            shift = util.by_pixel(0, -14),
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
      apparent_volume = 1.5
    },
    crafting_speed = 1,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = 4
    },
    energy_usage = "210kW",
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

  generate_arithmetic_combinator
  {
    type = "arithmetic-combinator",
    name = "arithmetic-combinator",
    icon = "__base__/graphics/icons/arithmetic-combinator.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.1, result = "arithmetic-combinator"},
    max_health = 150,
    corpse = "arithmetic-combinator-remnants",
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
        volume = 0.45
      },
      max_sounds_per_type = 2,
      match_speed_to_activity = true
    },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },

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

    input_connection_bounding_box = {{-0.5, 0}, {0.5, 1}},
    output_connection_bounding_box = {{-0.5, -1}, {0.5, 0}},

    circuit_wire_max_distance = 9
  },

  generate_decider_combinator
  {
    type = "decider-combinator",
    name = "decider-combinator",
    icon = "__base__/graphics/icons/decider-combinator.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.1, result = "decider-combinator"},
    max_health = 150,
    corpse = "decider-combinator-remnants",
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
        volume = 0.45
      },
      max_sounds_per_type = 2,
      match_speed_to_activity = true
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
          green = {0.25, 0.34375}
        }
      },
      {
        shadow =
        {
          red = {-0.265625, -0.171875},
          green = {-0.296875, 0.296875}
        },
        wire =
        {
          red = {-0.75, -0.5},
          green = {-0.75, -0.0625}
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
          green = {1.29688, -0.140625}
        },
        wire =
        {
          red = {0.75, -0.0625},
          green = {0.75, -0.53125}
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
          green = {0.28125, -0.78125}
        }
      },
      {
        shadow =
        {
          red = {1.17188, -0.109375},
          green = {1.17188, 0.296875}
        },
        wire =
        {
          red = {0.65625, -0.4375},
          green = {0.65625, -0.03125}
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
          green = {-0.140625, -0.078125}
        },
        wire =
        {
          red = {-0.6875, -0.03125},
          green = {-0.6875, -0.4375}
        }
      }
    },
    circuit_wire_max_distance = 9
  },

  generate_constant_combinator
  {
    type = "constant-combinator",
    name = "constant-combinator",
    icon = "__base__/graphics/icons/constant-combinator.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.1, result = "constant-combinator"},
    max_health = 120,
    corpse = "constant-combinator-remnants",

    collision_box = {{-0.35, -0.35}, {0.35, 0.35}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},

    item_slot_count = 18,

    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },

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

    circuit_wire_max_distance = 9
  },
  {
    type = "power-switch",
    name = "power-switch",
    icon = "__base__/graphics/icons/power-switch.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.2, result = "power-switch"},
    max_health = 200,
    corpse = "medium-small-remnants",

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
      shift = {0.453125, 0.1875}
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
      shift = {0.15625, 0.046875}
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
      shift = {0.046875, -0.0625}
    },
    led_on =
    {
      filename = "__base__/graphics/entity/power-switch/power-switch-led.png",
      x = 6,
      width = 6,
      height = 9,
      shift = {0.71875, 0.140625}
    },
    led_off =
    {
      filename = "__base__/graphics/entity/power-switch/power-switch-led.png",
      width = 6,
      height = 9,
      shift = {0.71875, 0.140625}
    },
    circuit_wire_connection_point =
    {
      shadow =
      {
        red = {-0.328125, 1.01563},
        green = {-0.328125, 1.01563}
      },
      wire =
      {
        red = {-0.609375, 0.828125},
        green = {-0.609375, 0.828125}
      }
    },
    left_wire_connection_point =
    {
      shadow =
      {
        copper = {0.296875, -0.171875}
      },
      wire =
      {
        copper = {-0.765625, -0.890625}
      }
    },
    right_wire_connection_point =
    {
      shadow =
      {
        copper = {2.14063, 0.015625}
      },
      wire =
      {
        copper = {0.859375, -0.890625}
      }
    },

    wire_max_distance = 10
  },
  {
    type = "programmable-speaker",
    name = "programmable-speaker",
    icon = "__base__/graphics/icons/programmable-speaker.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.1, result = "programmable-speaker"},
    max_health = 150,
    corpse = "programmable-speaker-remnants",
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
          hr_version =
          {
            filename = "__base__/graphics/entity/programmable-speaker/hr-programmable-speaker.png",
            priority = "extra-high",
            width = 59,
            height = 178,
            shift = util.by_pixel(-2.25, -39.5),
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/programmable-speaker/programmable-speaker-shadow.png",
          priority = "extra-high",
          width = 119,
          height = 25,
          shift = util.by_pixel(52.5, -2.5),
          draw_as_shadow = true,
          hr_version =
          {
            filename = "__base__/graphics/entity/programmable-speaker/hr-programmable-speaker-shadow.png",
            priority = "extra-high",
            width = 237,
            height = 50,
            shift = util.by_pixel(52.75, -3),
            draw_as_shadow = true,
            scale = 0.5
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
         { name="siren",  sound = { filename = "__base__/sound/programmable-speaker/siren.ogg", preload = false }}
        }
      },
      {
        name = "miscellaneous",
        notes =
        {
          { name = "achievement-unlocked",  sound = { filename = "__core__/sound/achievement-unlocked.ogg" }},
          { name = "alert-destroyed",  sound = { filename = "__core__/sound/alert-destroyed.ogg" }},
          { name = "armor-insert",  sound = { filename = "__core__/sound/armor-insert.ogg" }},
          { name = "armor-remove",  sound = { filename = "__core__/sound/armor-remove.ogg" }},
          { name = "cannot-build",  sound = { filename = "__core__/sound/cannot-build.ogg" }},
          { name = "console-message",  sound = { filename = "__core__/sound/console-message.ogg" }},
          { name = "crafting-finished",  sound = { filename = "__core__/sound/crafting-finished.ogg" }},
          { name = "game-lost",  sound = { filename = "__core__/sound/game-lost.ogg" }},
          { name = "game-won",  sound = { filename = "__core__/sound/game-won.ogg" }},
          { name = "gui-click",  sound = { filename = "__core__/sound/gui-click.ogg" }},
          { name = "gui-click-2",  sound = { filename = "__core__/sound/list-box-click.ogg" }},
          { name = "inventory-move",  sound = { filename = "__core__/sound/inventory-move.ogg" }},
          { name = "new-objective",  sound = { filename = "__core__/sound/new-objective.ogg" }},
          { name = "research-completed",  sound = { filename = "__core__/sound/research-completed.ogg" }},
          { name = "scenario-message",  sound = { filename = "__core__/sound/scenario-message.ogg" }}
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
          { name = "triangle",  sound = { filename = "__base__/sound/programmable-speaker/kit-17.ogg" }}
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
          { name = "E7",  sound = { filename = "__base__/sound/programmable-speaker/piano1-48.ogg" }}
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
          { name = "E5",  sound = { filename = "__base__/sound/programmable-speaker/bass-36.ogg" }}
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
          { name = "E5",  sound = { filename = "__base__/sound/programmable-speaker/lead-36.ogg" }}
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
          { name = "E5",  sound = { filename = "__base__/sound/programmable-speaker/saw-36.ogg" }}
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
          { name = "E5",  sound = { filename = "__base__/sound/programmable-speaker/square-36.ogg" }}
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
          { name = "E8",  sound = { filename = "__base__/sound/programmable-speaker/celesta-36.ogg" }}
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
          { name = "E8",  sound = { filename = "__base__/sound/programmable-speaker/vibraphone-36.ogg" }}
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
          { name = "E7",  sound = { filename = "__base__/sound/programmable-speaker/plucked-36.ogg" }}
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
          { name = "E6",  sound = { filename = "__base__/sound/programmable-speaker/steel-drum-36.ogg" }}
        }
      },

    },

    circuit_wire_connection_point = circuit_connector_definitions["programmable-speaker"].points,
    circuit_connector_sprites = circuit_connector_definitions["programmable-speaker"].sprites,
    circuit_wire_max_distance = default_circuit_wire_max_distance
  },
  {
    type = "electric-energy-interface",
    name = "electric-energy-interface",
    icons = { {icon = "__base__/graphics/icons/accumulator.png", tint = {r=1, g=0.8, b=1, a=1}} },
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.1, result = "electric-energy-interface"},
    max_health = 150,
    corpse = "medium-remnants",
    subgroup = "other",
    collision_box = {{-0.9, -0.9}, {0.9, 0.9}},
    selection_box = {{-1, -1}, {1, 1}},
    drawing_box = {{-1, -1.5}, {1, 1}},
    gui_mode = "all",
    allow_copy_paste = true,
    energy_source =
    {
      type = "electric",
      buffer_capacity = "10GJ",
      usage_priority = "tertiary"
    },

    energy_production = "500GW",
    energy_usage = "0kW",
    -- also 'pictures' for 4-way sprite is available, or 'animation' resp. 'animations'
    picture = accumulator_picture( {r=1, g=0.8, b=1, a=1} ),
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
    type = "electric-energy-interface",
    name = "hidden-electric-energy-interface",
    icon = "__base__/graphics/icons/solar-panel.png",
    icon_size = 32,
    localised_name = {"item-name.solar-panel"},
    flags = {},
    max_health = 150,
    collision_box = {{0, 0}, {0, 0}},
    selection_box = {{-0, -0}, {0, 0}},
    selectable_in_game = false,
    energy_source =
    {
      type = "electric",
      buffer_capacity = "10GJ",
      usage_priority = "tertiary",
      input_flow_limit = "0kW",
      output_flow_limit = "500GW"
    },
    energy_production = "500GW",
    energy_usage = "0kW",
    picture =
    {
      filename = "__core__/graphics/empty.png",
      priority = "extra-high",
      width = 1,
      height = 1
    },
    order = "h-e-e-i"
  },
  {
    type = "reactor",
    name = "nuclear-reactor",
    icon  = "__base__/graphics/icons/nuclear-reactor.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.5, result = "nuclear-reactor"},
    max_health = 500,
    corpse = "nuclear-reactor-remnants",
    consumption = "40MW",
    neighbour_bonus = 1,
    energy_source =
    {
      type = "burner",
      fuel_category = "nuclear",
      effectivity = 1,
      fuel_inventory_size = 1,
      burnt_inventory_size = 1
    },
    collision_box = {{-2.2, -2.2}, {2.2, 2.2}},
    selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
    --the collision box of a reactor is increased by this on the sides where it connects to another reactor:
    --neighbour_collision_increase = 0.25,
    lower_layer_picture =
    {
      filename = "__base__/graphics/entity/nuclear-reactor/reactor-pipes.png",
      width = 156,
      height = 156,
      shift = util.by_pixel(-2, -4),
      hr_version =
      {
        filename = "__base__/graphics/entity/nuclear-reactor/hr-reactor-pipes.png",
        width = 320,
        height = 316,
        scale = 0.5,
        shift = util.by_pixel(-1, -5),
      }
    },
    heat_lower_layer_picture =
    {
      filename = "__base__/graphics/entity/nuclear-reactor/reactor-pipes-heated.png",
      width = 156,
      height = 156,
      shift = util.by_pixel(-3, -4),
      hr_version =
      {
        filename = "__base__/graphics/entity/nuclear-reactor/hr-reactor-pipes-heated.png",
        width = 320,
        height = 316,
        scale = 0.5,
        shift = util.by_pixel(-0.5, -4.5),
      }
    },

    picture =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/nuclear-reactor/reactor.png",
          width = 154,
          height = 158,
          shift = util.by_pixel(-6, -6),
          hr_version =
          {
            filename = "__base__/graphics/entity/nuclear-reactor/hr-reactor.png",
            width = 302,
            height = 318,
            scale = 0.5,
            shift = util.by_pixel(-5, -7),
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
            draw_as_shadow = true
          }
        }
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
        blend_mode = "additive"
      }
    },

    light = {intensity = 0.6, size = 9.9, shift = {0.0, 0.0}, color = {r = 0.0, g = 1.0, b = 0.0}},
    -- use_fuel_glow_color = false, -- should use glow color from fuel item prototype as light color and tint for working_light_picture
    -- default_fuel_glow_color = { 0, 1, 0, 1 } -- color used as working_light_picture tint for fuels that don't have glow color defined

    heat_buffer =
    {
      max_temperature = 1000,
      specific_heat = "10MJ",
      max_transfer = "10GW",
      minimum_glow_temperature = 350,
      glow_alpha_modifier = 0.6,
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
      },

      heat_picture =
      {
        filename = "__base__/graphics/entity/nuclear-reactor/reactor-heated.png",
        width = 108,
        height = 128,
        shift = util.by_pixel(1, -7),
        hr_version =
        {
          filename = "__base__/graphics/entity/nuclear-reactor/hr-reactor-heated.png",
          width = 216,
          height = 256,
          scale = 0.5,
          shift = util.by_pixel(3, -6.5),
        }
      },
      heat_glow =
      {
        filename = "__base__/graphics/entity/nuclear-reactor/reactor-heat-glow.png",
        priority = "extra-high",
        width = 188,
        height = 190,
        tint = heat_glow_tint,
        shift = util.by_pixel(-2, -4)
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

    heat_connection_patches_connected =
    {
      sheet =
      {
        filename = "__base__/graphics/entity/nuclear-reactor/reactor-connect-patches-heated.png",
        width = 32,
        height = 32,
        variation_count = 12,
        hr_version =
        {
          filename = "__base__/graphics/entity/nuclear-reactor/hr-reactor-connect-patches-heated.png",
          width = 64,
          height = 64,
          variation_count = 12,
          scale = 0.5
        }
      }
    },

    heat_connection_patches_disconnected =
    {
      sheet =
      {
        filename = "__base__/graphics/entity/nuclear-reactor/reactor-connect-patches-heated.png",
        width = 32,
        height = 32,
        variation_count = 12,
        y = 32,
        hr_version =
        {
          filename = "__base__/graphics/entity/nuclear-reactor/hr-reactor-connect-patches-heated.png",
          width = 64,
          height = 64,
          variation_count = 12,
          y = 64,
          scale = 0.5
        }
      }
    },

    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65},

    meltdown_action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
              repeat_count = 100,
              type = "create-trivial-smoke",
              smoke_name = "nuclear-smoke",
              offset_deviation = {{-1, -1}, {1, 1}},
              starting_frame = 3,
              starting_frame_deviation = 5,
              starting_frame_speed = 0,
              starting_frame_speed_deviation = 5,
              speed_from_center = 0.5
          },
          {
            type = "create-entity",
            entity_name = "explosion"
          },
          {
            type = "damage",
            damage = {amount = 400, type = "explosion"}
          },
          {
            type = "create-entity",
            entity_name = "small-scorchmark",
            check_buildability = true
          },
          {
            type = "nested-result",
            action =
            {
              type = "area",
              target_entities = false,
              trigger_from_target = true,
              repeat_count = 2000,
              radius = 35,
              action_delivery =
              {
                type = "projectile",
                projectile = "atomic-bomb-wave",
                starting_speed = 0.5
              }
            }
          }
        }
      }
    }
  },
  {
    type = "assembling-machine",
    name = "centrifuge",
    icon = "__base__/graphics/icons/centrifuge.png",
    icon_size = 32,
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 0.1, result = "centrifuge"},
    max_health = 350,
    corpse = "centrifuge-remnants",
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
    drawing_box = {{-1.5, -2.2}, {1.5, 1.5}},

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
            shift = util.by_pixel(-0.25, -26.5)
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
            shift = util.by_pixel(16.75, -10)
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
            shift = util.by_pixel(23, 6.5)
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
            shift = util.by_pixel(63.25, 15.25)
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
            shift = util.by_pixel(-26.25, 3.5)
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
            shift = util.by_pixel(8.5, 23.5)
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
            shift = util.by_pixel(0, -27.25)
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
            shift = util.by_pixel(16.75, 0.5)
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
            shift = util.by_pixel(-23.5, -1.75)
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
        }
      },
      idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.6 },
      apparent_volume = 1.5
    },
    crafting_speed = 1,
    crafting_categories = {"centrifuging"},
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = 4
    },
    energy_usage = "350kW",
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
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.1, result = "heat-exchanger"},
    max_health = 200,
    corpse = "heat-exchanger-remnants",
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
      production_type = "input-output",
      filter = "water"
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
      production_type = "output",
      filter = "steam"
    },
    energy_consumption = "10MW",
    energy_source =
    {
      type = "heat",
      max_temperature = 1000,
      specific_heat = "1MJ",
      max_transfer = "2GW",
      min_working_temperature = 500,
      minimum_glow_temperature = 350,
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
          width = 32,
          height = 32,
          direction_count = 4,
          hr_version =
          {
            filename = "__base__/graphics/entity/heat-exchanger/hr-heatex-endings.png",
            width = 64,
            height = 64,
            direction_count = 4,
            scale = 0.5
          }
        }),
      heat_pipe_covers =
        make_4way_animation_from_spritesheet(
        {
          filename = "__base__/graphics/entity/heat-exchanger/heatex-endings-heated.png",
          width = 32,
          height = 32,
          direction_count = 4,
          hr_version =
          {
            filename = "__base__/graphics/entity/heat-exchanger/hr-heatex-endings-heated.png",
            width = 64,
            height = 64,
            direction_count = 4,
            scale = 0.5
          }
        }),
      heat_picture =
      {
        north =
        {
          filename = "__base__/graphics/entity/heat-exchanger/heatex-N-heated.png",
          priority = "extra-high",
          width = 24,
          height = 48,
          shift = util.by_pixel(-1, 8),
          hr_version =
          {
            filename = "__base__/graphics/entity/heat-exchanger/hr-heatex-N-heated.png",
            priority = "extra-high",
            width = 44,
            height = 96,
            shift = util.by_pixel(-0.5, 8.5),
            scale = 0.5
          }
        },
        east =
        {
          filename = "__base__/graphics/entity/heat-exchanger/heatex-E-heated.png",
          priority = "extra-high",
          width = 40,
          height = 40,
          shift = util.by_pixel(-21, -13),
          hr_version =
          {
            filename = "__base__/graphics/entity/heat-exchanger/hr-heatex-E-heated.png",
            priority = "extra-high",
            width = 80,
            height = 80,
            shift = util.by_pixel(-21, -13),
            scale = 0.5
          }
        },
        south =
        {
          filename = "__base__/graphics/entity/heat-exchanger/heatex-S-heated.png",
          priority = "extra-high",
          width = 16,
          height = 20,
          shift = util.by_pixel(-1, -30),
          hr_version =
          {
            filename = "__base__/graphics/entity/heat-exchanger/hr-heatex-S-heated.png",
            priority = "extra-high",
            width = 28,
            height = 40,
            shift = util.by_pixel(-1, -30),
            scale = 0.5
          }
        },
        west =
        {
          filename = "__base__/graphics/entity/heat-exchanger/heatex-W-heated.png",
          priority = "extra-high",
          width = 32,
          height = 40,
          shift = util.by_pixel(23, -13),
          hr_version =
          {
            filename = "__base__/graphics/entity/heat-exchanger/hr-heatex-W-heated.png",
            priority = "extra-high",
            width = 64,
            height = 76,
            shift = util.by_pixel(23, -13),
            scale = 0.5
          }
        },
      },
      heat_glow =
      {
        north =
        {
          filename = "__base__/graphics/entity/heat-exchanger/heatex-N-glow.png",
          priority = "extra-high",
          width = 38,
          height = 70,
          tint = heat_glow_tint,
          shift = util.by_pixel(0, 8)
        },
        east =
        {
          filename = "__base__/graphics/entity/heat-exchanger/heatex-E-glow.png",
          priority = "extra-high",
          width = 60,
          height = 62,
          shift = util.by_pixel(-22, -12)
        },
        south =
        {
          filename = "__base__/graphics/entity/heat-exchanger/heatex-S-glow.png",
          priority = "extra-high",
          width = 38,
          height = 40,
          tint = heat_glow_tint,
          shift = util.by_pixel(0, -36)
        },
        west =
        {
          filename = "__base__/graphics/entity/heat-exchanger/heatex-W-glow.png",
          priority = "extra-high",
          width = 60,
          height = 64,
          shift = util.by_pixel(20, -12)
        },
      }
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
            hr_version =
        {
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
            hr_version =
        {
              filename = "__base__/graphics/entity/boiler/hr-boiler-N-shadow.png",
              priority = "extra-high",
              width = 274,
              height = 164,
              scale = 0.5,
              shift = util.by_pixel(20.5, 9),
              draw_as_shadow = true
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
            hr_version =
        {
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
            hr_version =
        {
              filename = "__base__/graphics/entity/boiler/hr-boiler-E-shadow.png",
              priority = "extra-high",
              width = 184,
              height = 194,
              scale = 0.5,
              shift = util.by_pixel(30, 9.5),
              draw_as_shadow = true
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
            hr_version =
        {
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
            hr_version =
        {
              filename = "__base__/graphics/entity/boiler/hr-boiler-S-shadow.png",
              priority = "extra-high",
              width = 311,
              height = 131,
              scale = 0.5,
              shift = util.by_pixel(29.75, 15.75),
              draw_as_shadow = true
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
            hr_version =
        {
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
            hr_version =
        {
              filename = "__base__/graphics/entity/boiler/hr-boiler-W-shadow.png",
              priority = "extra-high",
              width = 206,
              height = 218,
              scale = 0.5,
              shift = util.by_pixel(19.5, 6.5),
              draw_as_shadow = true
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
    icon_size = 32,
    flags = {"placeable-neutral","player-creation"},
    minable = {mining_time = 0.3, result = "steam-turbine"},
    max_health = 300,
    corpse = "steam-turbine-remnants",
    dying_explosion = "medium-explosion",
    alert_icon_shift = util.by_pixel(0, -12),
    effectivity = 1,
    fluid_usage_per_tick = 1,
    maximum_temperature = 500,
    burns_fluid = false,
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
        { type = "input-output", position = {0, -3} }
      },
      production_type = "input-output",
      filter = "steam",
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
          hr_version =
          {
            filename = "__base__/graphics/entity/steam-turbine/hr-steam-turbine-H.png",
            width = 320,
            height = 245,
            frame_count = 8,
            line_length = 4,
            shift = util.by_pixel(0, -2.75),
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/steam-turbine/steam-turbine-H-shadow.png",
          width = 217,
          height = 74,
          repeat_count = 8,
          frame_count = 1,
          line_length = 1,
          draw_as_shadow = true,
          shift = util.by_pixel(28.75, 18),
          hr_version =
          {
            filename = "__base__/graphics/entity/steam-turbine/hr-steam-turbine-H-shadow.png",
            width = 435,
            height = 150,
            repeat_count = 8,
            frame_count = 1,
            line_length = 1,
            draw_as_shadow = true,
            shift = util.by_pixel(28.5, 18),
            scale = 0.5
          }
        }
      }
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
          hr_version =
          {
            filename = "__base__/graphics/entity/steam-turbine/hr-steam-turbine-V.png",
            width = 217,
            height = 347,
            frame_count = 8,
            line_length = 4,
            shift = util.by_pixel(4.75, 6.75),
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/steam-turbine/steam-turbine-V-shadow.png",
          width = 151,
          height = 131,
          repeat_count = 8,
          frame_count = 1,
          line_length = 1,
          draw_as_shadow = true,
          shift = util.by_pixel(39.5, 24.5),
          hr_version =
          {
            filename = "__base__/graphics/entity/steam-turbine/hr-steam-turbine-V-shadow.png",
            width = 302,
            height = 260,
            repeat_count = 8,
            frame_count = 1,
            line_length = 1,
            draw_as_shadow = true,
            shift = util.by_pixel(39.5, 24.5),
            scale = 0.5
          }
        }
      }
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
      match_speed_to_activity = true
    },
    min_perceived_performance = 0.25,
    performance_to_sound_speedup = 0.5
  },
  {
    type = "heat-pipe",
    name = "heat-pipe",
    icon = "__base__/graphics/icons/heat-pipe.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.1, result = "heat-pipe"},
    max_health = 200,
    corpse = "heat-pipe-remnants",
    random_corpse_variation = true,
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
    heat_buffer =
    {
      max_temperature = 1000,
      specific_heat = "1MJ",
      max_transfer = "1GW",
      minimum_glow_temperature = 350,
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
      },
      heat_glow =
      {
        filename = "__base__/graphics/entity/heat-pipe/heated-glow.png",
        priority = "extra-high",
        width = 55,
        height = 55,
        tint = heat_glow_tint
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
        ending_left = {}
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
        ending_left = {}
      })
  },
  {
    type = "simple-entity-with-force",
    name = "simple-entity-with-force",
    render_layer = "object",
    icon = "__base__/graphics/icons/steel-chest.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    order = "s-e-w-f",
    minable = {mining_time = 0.1, result = "simple-entity-with-force"},
    max_health = 100,
    corpse = "small-remnants",
    collision_box = {{-0.35, -0.35}, {0.35, 0.35}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    picture =
    {
      filename = "__base__/graphics/entity/steel-chest/steel-chest.png",
      priority = "extra-high",
      width = 32,
      height = 40,
      shift = util.by_pixel(-11, 4.5),
    }
  },
  {
    type = "simple-entity-with-owner",
    name = "simple-entity-with-owner",
    render_layer = "object",
    icon = "__base__/graphics/icons/wooden-chest.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    order = "s-e-w-o",
    minable = {mining_time = 0.1, result = "simple-entity-with-owner"},
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
          width = 34,
          height = 38,
          shift = util.by_pixel(0, -0.5),
        },
        {
          filename = "__base__/graphics/entity/iron-chest/iron-chest.png",
          priority = "extra-high",
          width = 10,
          height = 33,
          x = 18,
          shift = util.by_pixel(0, -0.5),
          apply_runtime_tint = true
        }
      }
    }
--[[  or instead of picture it is possible to define animations with variations
   random_animation_offset = false,
   animations =
   {
     {
       width = 152,
       height = 120,
       line_length = 5,
       frame_count = 60,
       animation_speed = 0.25,
       filename = "__base__/graphics/entity/smoke/smoke.png"
     },
     {
       width = 152,
       height = 120,
       line_length = 5,
       frame_count = 60,
       animation_speed = 0.875,
       filename = "__base__/graphics/entity/smoke/smoke.png"
     }
   }
]]--
  },
  {
    type = "flame-thrower-explosion",
    name = "dummy-flame-thrower-explosion",
    flags = {"not-on-map"},
    -- It needs some animation
    animations =
    {
      {
        filename = "__base__/graphics/entity/blue-beam/blue-beam.png",
        priority = "extra-high",
        width = 187,
        height = 1,
        frame_count = 6
      }
    },
    light = {intensity = 0.2, size = 20},
    slow_down_factor = 1,
    smoke = "smoke-fast",
    smoke_count = 1,
    smoke_slow_down_factor = 0.95,
    damage = {amount = 0.25, type = "fire"}
  },
  {
    type = "arrow",
    name = "fake-selection-box-2x2",
    flags = {"placeable-off-grid", "not-on-map"},
    circle_picture =
    {
      filename = "__core__/graphics/arrows/fake-selection-box-2x2.png",
      priority = "low",
      width = 128,
      height = 128,
      scale = 0.5
    },
    arrow_picture =
    {
      filename = "__core__/graphics/empty.png",
      priority = "low",
      width = 1,
      height = 1
    }
  },
  {
    type = "artillery-flare",
    name = "artillery-flare",
    icon = "__base__/graphics/icons/artillery-targeting-remote.png",
    icon_size = 32,
    flags = {"placeable-off-grid", "not-on-map"},
    map_color = {r=1, g=0.5, b=0},
    life_time = 60 * 60,
    initial_height = 0,
    initial_vertical_speed = 0,
    initial_frame_speed = 1,
    shots_per_flare = 1,
    early_death_ticks = 3 * 60,
    pictures =
    {
      {
        filename = "__core__/graphics/shoot-cursor-red.png",
        priority = "low",
        width = 258,
        height = 183,
        frame_count = 1,
        scale = 1,
        flags = {"icon"}
      },
      --{
      --  filename = "__base__/graphics/entity/sparks/sparks-02.png",
      --  width = 36,
      --  height = 32,
      --  frame_count = 19,
      --  line_length = 19,
      --  shift = {0.03125, 0.125},
      --  tint = { r = 1.0, g = 0.9, b = 0.0, a = 1.0 },
      --  animation_speed = 0.3,
      --}
    }
  },
  {
    type = "explosion",
    name = "big-artillery-explosion",
    flags = {"not-on-map"},
    animations =
    {
      {
        filename = "__base__/graphics/entity/bigass-explosion/hr-bigass-explosion-36f.png",
        flags = { "compressed" },
        animation_speed = 0.5,
        width = 324,
        height = 416,
        frame_count = 36,
        shift = util.by_pixel(0, -48),
        stripes =
        {
          {
            filename = "__base__/graphics/entity/bigass-explosion/hr-bigass-explosion-36f-1.png",
            width_in_frames = 6,
            height_in_frames = 3
          },
          {
            filename = "__base__/graphics/entity/bigass-explosion/hr-bigass-explosion-36f-2.png",
            width_in_frames = 6,
            height_in_frames = 3
          }
        }
      }
    },
    light = {intensity = 1, size = 50, color = {r=1.0, g=1.0, b=1.0}},
    sound =
    {
      aggregation =
      {
        max_count = 2,
        remove = true
      },
      variations =
      {
        {
          filename = "__base__/sound/fight/large-explosion-1.ogg",
          volume = 1.0
        },
        {
          filename = "__base__/sound/fight/large-explosion-2.ogg",
          volume = 1.0
        }
      }
    },
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
            repeat_count = 5,
            entity_name = "explosion-remnants-particle",
            initial_height = 0.5,
            speed_from_center = 0.08,
            speed_from_center_deviation = 0.15,
            initial_vertical_speed = 0.08,
            initial_vertical_speed_deviation = 0.15,
            offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}}
          }
        }
      }
    }
  },
  {
    type = "explosion",
    name = "artillery-cannon-muzzle-flash",
    flags = {"not-on-map"},
    animations =
    {
      {
        filename = "__base__/graphics/entity/artillery-cannon-muzzle-flash/muzzle-flash.png",
        line_length = 7,
        width = 138,
        height = 192,
        frame_count = 21,
        shift = util.by_pixel(1, -82),
        animation_speed = 0.75,
        hr_version =
        {
          filename = "__base__/graphics/entity/artillery-cannon-muzzle-flash/hr-muzzle-flash.png",
          line_length = 7,
          width = 276,
          height = 382,
          frame_count = 21,
          scale = 0.5,
          shift = util.by_pixel(1, -82),
          animation_speed = 0.75
        }
      }
    },
    rotate = true,
    height = 0,
    correct_rotation = true,
    light = {intensity = 1, size = 10, color = {r=1.0, g=1.0, b=1.0}},
    smoke = "smoke-fast",
    smoke_count = 1,
    smoke_slow_down_factor = 1
  },

  {
    type = "trivial-smoke",
    name = "artillery-smoke",
    animation =
    {
      filename = "__base__/graphics/entity/smoke-fast/smoke-fast.png",
      priority = "high",
      width = 50,
      height = 50,
      animation_speed = 1 / 6,
      frame_count = 16,
      scale = 0.5
    },
    render_layer = "building-smoke",
    affected_by_wind = false,
    movement_slow_down_factor = 0.96,
    duration = 60 * 1.75,
    fade_away_duration = 20,
    show_when_smoke_off = true
  }
}
)

local uranium_cannon_shell_explosion = util.table.deepcopy(data.raw["explosion"]["big-explosion"])
uranium_cannon_shell_explosion.name = "uranium-cannon-shell-explosion"
uranium_cannon_shell_explosion.animations[1].tint = {r = 0.4, g = 1, b = 0.4}
data:extend({uranium_cannon_shell_explosion})

local uranium_cannon_explosion = util.table.deepcopy(data.raw["explosion"]["explosion"])
uranium_cannon_explosion.name = "uranium-cannon-explosion"
for k, v in pairs(uranium_cannon_explosion.animations) do
  v.tint = {r = 0.4, g = 1, b = 0.4}
end
data:extend({uranium_cannon_explosion})

local red_chest = util.table.deepcopy(data.raw["container"]["steel-chest"])
red_chest.minable = nil
red_chest.name = "red-chest"
red_chest.picture = util.table.deepcopy(data.raw["logistic-container"]["logistic-chest-passive-provider"].animation)
red_chest.order = "r-e-d"
data:extend({red_chest})

local blue_chest = util.table.deepcopy(data.raw["container"]["steel-chest"])
blue_chest.minable = nil
blue_chest.name = "blue-chest"
blue_chest.picture = util.table.deepcopy(data.raw["logistic-container"]["logistic-chest-requester"].animation)
blue_chest.order = "b-l-u-e"
data:extend({blue_chest})

local full_resistances =
{
  {
    type = "fire",
    percent = 100
  },
  {
    type = "impact",
    percent = 100
  },
  {
    type = "physical",
    percent = 100
  },
  {
    type = "explosion",
    percent = 100
  }
}

local infinity_chest = util.table.deepcopy(data.raw["logistic-container"]["logistic-chest-storage"])
infinity_chest.type = "infinity-container"
infinity_chest.name = "infinity-chest"
infinity_chest.order = "infinity-chest"
infinity_chest.icon = "__base__/graphics/icons/infinity-chest.png"
infinity_chest.gui_mode = "admins" -- all, none, admins
infinity_chest.erase_contents_when_mined = true
infinity_chest.animation = nil
infinity_chest.picture =
{
  layers =
  {
    {
      filename = "__base__/graphics/entity/infinity-chest/infinity-chest.png",
      priority = "extra-high",
      width = 34,
      height = 42,
      shift = util.by_pixel(0, -3),
      hr_version =
      {
        filename = "__base__/graphics/entity/infinity-chest/hr-infinity-chest.png",
        priority = "extra-high",
        width = 68,
        height = 84,
        shift = util.by_pixel(0, -3),
        scale = 0.5,
      }
    },
    {
      filename = "__base__/graphics/entity/infinity-chest/infinity-chest-shadow.png",
      priority = "extra-high",
      width = 58,
      height = 24,
      shift = util.by_pixel(12, 6),
      draw_as_shadow = true,
      hr_version =
      {
        filename = "__base__/graphics/entity/infinity-chest/hr-infinity-chest-shadow.png",
        priority = "extra-high",
        width = 116,
        height = 48,
        shift = util.by_pixel(12, 6),
        draw_as_shadow = true,
        scale = 0.5,
      }
    }
  }
}
infinity_chest.logistic_mode = nil
infinity_chest.logistic_slots_count = 12
infinity_chest.minable = {mining_time = 0.1, result = "infinity-chest"}
infinity_chest.resistances = full_resistances
data:extend({infinity_chest})

local infinity_pipe = util.table.deepcopy(data.raw["pipe"]["pipe"])
infinity_pipe.type = "infinity-pipe"
infinity_pipe.name = "infinity-pipe"
infinity_pipe.icon = nil
infinity_pipe.icons =
{{
  icon = "__base__/graphics/icons/pipe.png",
  tint = {r = 0.5, g = 0.5, b = 1}
}}
infinity_pipe.gui_mode = "admins" -- all, none, admins
infinity_pipe.minable = {mining_time = 0.1, result = "infinity-pipe"}
infinity_pipe.resistances = full_resistances
for name, picture in pairs(infinity_pipe.pictures) do
  if name ~= "high_temperature_flow" and name ~= "middle_temperature_flow" and name ~= "low_temperature_flow" and name ~= "gas_flow" then
    picture.tint = {r = 0.5, g = 0.5, b = 1}
    if picture.hr_version then
      picture.hr_version.tint = {r = 0.5, g = 0.5, b = 1}
    end
  end
end
data:extend({infinity_pipe})

data:extend(
{
  {
    type = "heat-interface",
    name = "heat-interface",
    icon = "__base__/graphics/entity/heat-interface/heat-interface.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.1, result = "heat-interface"},
    max_health = 150,
    corpse = "small-remnants",
    subgroup = "other",
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    gui_mode = "admins", -- all, none, admins
    resistances = full_resistances,
    heat_buffer =
    {
      max_temperature = 1000,
      specific_heat = "10MJ",
      max_transfer = "10GW",
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
    picture =
    {
      filename = "__base__/graphics/entity/heat-interface/heat-interface.png",
      height = 32,
      width = 32,
      flags = {"no-crop"}
    }
  }
}
)
