local autoplace_utils = require("autoplace_utils")

local hit_effects = require ("prototypes.entity.demo-hit-effects")

local sounds = require ("prototypes.entity.demo-sounds")

local decorative_trigger_effects = require("prototypes.decorative.decorative-trigger-effects")

local base_decorative_sprite_priority = "extra-high"

local function add_dim_to_peak(peak, dim_name, values)
  if values[1] and values[2] then
    peak[dim_name.."_optimal"] = values[1]
    peak[dim_name.."_range"] = values[2]
    peak[dim_name.."_max_range"] = values[3] or values[2]*1.5
  end
end

local function tog_autoplace(stuff)
  local ret =
  {
    order = "a[doodad]-z[other]",
    peaks = {}
  }

  for k, v in pairs(stuff) do
    if k == 'dims' then
      local peak = { influence = 1 }
      for dim_name, values in pairs(stuff.dims) do
        add_dim_to_peak(peak, dim_name, values)
      end
      ret.peaks[#ret.peaks + 1] = peak
    elseif k == 'peak' then
      ret.peaks[#ret.peaks + 1] = v
    elseif k == 'peaks' then
      for _, peak in ipairs(v) do
        ret.peaks[#ret.peaks + 1] = peak
      end
    elseif k == 'static_influence' then
      ret.peaks[#ret.peaks + 1] = { influence = v }
    else
      ret[k] = v
    end
  end

  return ret
end

local function autoplace_settings(noise_layer, max_probability, rectangles, more)
  local ret =
  {
    order = "a[doodad]-z[other]",
    max_probability = max_probability,
    peaks = {}
  }

  if noise_layer ~= nil then
    ret["sharpness"] = 0.3
    ret.peaks[#ret.peaks + 1] =
    {
      influence = 0.4,
      noise_layer = noise_layer,
      noise_persistence = 0.9,
      noise_octaves_difference = -2
    }
    ret.peaks[#ret.peaks + 1] =
    {
      influence = -0.3
    }
  end

  if rectangles == nil then
    ret.peaks[#ret.peaks + 1] =
    {
      influence = 0.5
    }
  else
    autoplace_utils.peaks(rectangles, ret.peaks, 0.5)
  end

  if more ~= nil then
    for k,v in pairs(more) do ret[k] = v end
  end

  return ret
end

local function rock_autoplace_settings(multiplier, order_suffix, rectangle)
  local peak =
  {
    noise_layer = "rocks",
    noise_octaves_difference = -2,
    noise_persistence = 0.9
  }

  if rectangle ~= nil then
    local aux_center = (rectangle[2][1] + rectangle[1][1]) / 2
    local aux_range = math.abs(rectangle[2][1] - rectangle[1][1]) / 2
    local water_center = (rectangle[2][2] + rectangle[1][2]) / 2
    local water_range = math.abs(rectangle[2][2] - rectangle[1][2]) / 2

    peak["aux_optimal"] = aux_center
    peak["aux_range"] = aux_range
    peak["aux_max_range"] = water_range + 0.05

    peak["water_optimal"] = water_center
    peak["water_range"] = water_range
    peak["water_max_range"] = water_range + 0.05
  end

  return
  {
    order = "a[doodad]-a[rock]-" .. order_suffix,
    coverage = multiplier * 0.01,
    sharpness = 0.7,
    max_probability = multiplier * 0.7,
    peaks = { peak }
  }
end

function shroom_decal(name, tint)
  return
  {
    name = name,
    type = "optimized-decorative",
    order = "b[decorative]-j[bush]-a[mini]-a[green]",
    collision_mask = {"water-tile", "colliding-with-tiles-only"},
    collision_box = {{-3.5, -1.8}, {3.5, 1.8}},
    pictures =
    {
      {
        filename = "__base__/graphics/decorative/shroom-decal/shroom-decal-00.png",
        priority = base_decorative_sprite_priority,
        width = 166,
        height = 88,
        shift = util.by_pixel(-12, -10),
        tint = tint,
        hr_version =
        {
          filename = "__base__/graphics/decorative/shroom-decal/hr-shroom-decal-00.png",
          priority = base_decorative_sprite_priority,
          width = 334,
          height = 206,
          shift = util.by_pixel(-13, -1),
          tint = tint,
          scale = 0.5,
        }
      },
      {
        filename = "__base__/graphics/decorative/shroom-decal/shroom-decal-01.png",
        priority = base_decorative_sprite_priority,
        width = 128,
        height = 94,
        shift = util.by_pixel(12, 6),
        tint = tint,
        hr_version =
        {
          filename = "__base__/graphics/decorative/shroom-decal/hr-shroom-decal-01.png",
          priority = base_decorative_sprite_priority,
          width = 256,
          height = 182,
          shift = util.by_pixel(12, 7),
          tint = tint,
          scale = 0.5,
        }
      },
      {
        filename = "__base__/graphics/decorative/shroom-decal/shroom-decal-02.png",
        priority = base_decorative_sprite_priority,
        width = 204,
        height = 96,
        shift = util.by_pixel(-8, -2),
        tint = tint,
        hr_version =
        {
          filename = "__base__/graphics/decorative/shroom-decal/hr-shroom-decal-02.png",
          priority = base_decorative_sprite_priority,
          width = 406,
          height = 194,
          shift = util.by_pixel(-8, -3),
          tint = tint,
          scale = 0.5,
        }
      },
      {
        filename = "__base__/graphics/decorative/shroom-decal/shroom-decal-03.png",
        priority = base_decorative_sprite_priority,
        width = 216,
        height = 96,
        shift = util.by_pixel(6, 8),
        tint = tint,
        hr_version =
        {
          filename = "__base__/graphics/decorative/shroom-decal/hr-shroom-decal-03.png",
          priority = base_decorative_sprite_priority,
          width = 432,
          height = 220,
          shift = util.by_pixel(6, 1),
          tint = tint,
          scale = 0.5,
        }
      },
      {
        filename = "__base__/graphics/decorative/shroom-decal/shroom-decal-04.png",
        priority = base_decorative_sprite_priority,
        width = 184,
        height = 102,
        shift = util.by_pixel(-12, 8),
        tint = tint,
        hr_version =
        {
          filename = "__base__/graphics/decorative/shroom-decal/hr-shroom-decal-04.png",
          priority = base_decorative_sprite_priority,
          width = 368,
          height = 206,
          shift = util.by_pixel(-12, 7),
          tint = tint,
          scale = 0.5,
        }
      },
      {
        filename = "__base__/graphics/decorative/shroom-decal/shroom-decal-05.png",
        priority = base_decorative_sprite_priority,
        width = 170,
        height = 102,
        shift = util.by_pixel(24, 2),
        tint = tint,
        hr_version =
        {
          filename = "__base__/graphics/decorative/shroom-decal/hr-shroom-decal-05.png",
          priority = base_decorative_sprite_priority,
          width = 340,
          height = 200,
          shift = util.by_pixel(24, 3),
          tint = tint,
          scale = 0.5,
        }
      },
      {
        filename = "__base__/graphics/decorative/shroom-decal/shroom-decal-06.png",
        priority = base_decorative_sprite_priority,
        width = 162,
        height = 108,
        shift = util.by_pixel(24, 2),
        tint = tint,
        hr_version =
        {
          filename = "__base__/graphics/decorative/shroom-decal/hr-shroom-decal-06.png",
          priority = base_decorative_sprite_priority,
          width = 326,
          height = 214,
          shift = util.by_pixel(23, 2),
          tint = tint,
          scale = 0.5,
        }
      },
      {
        filename = "__base__/graphics/decorative/shroom-decal/shroom-decal-07.png",
        priority = base_decorative_sprite_priority,
        width = 168,
        height = 98,
        shift = util.by_pixel(20, 8),
        tint = tint,
        hr_version =
        {
          filename = "__base__/graphics/decorative/shroom-decal/hr-shroom-decal-07.png",
          priority = base_decorative_sprite_priority,
          width = 336,
          height = 190,
          shift = util.by_pixel(20, 9),
          tint = tint,
          scale = 0.5,
        }
      },
      {
        filename = "__base__/graphics/decorative/shroom-decal/shroom-decal-08.png",
        priority = base_decorative_sprite_priority,
        width = 192,
        height = 104,
        shift = util.by_pixel(-12, 0),
        tint = tint,
        hr_version =
        {
          filename = "__base__/graphics/decorative/shroom-decal/hr-shroom-decal-08.png",
          priority = base_decorative_sprite_priority,
          width = 386,
          height = 206,
          shift = util.by_pixel(-12, 1),
          tint = tint,
          scale = 0.5,
        }
      },
      {
        filename = "__base__/graphics/decorative/shroom-decal/shroom-decal-09.png",
        priority = base_decorative_sprite_priority,
        width = 138,
        height = 78,
        shift = util.by_pixel(8, -12),
        tint = tint,
        hr_version =
        {
          filename = "__base__/graphics/decorative/shroom-decal/hr-shroom-decal-09.png",
          priority = base_decorative_sprite_priority,
          width = 278,
          height = 150,
          shift = util.by_pixel(8, -11),
          tint = tint,
          scale = 0.5,
        }
      },
      {
        filename = "__base__/graphics/decorative/shroom-decal/shroom-decal-10.png",
        priority = base_decorative_sprite_priority,
        width = 182,
        height = 100,
        shift = util.by_pixel(2, -2),
        tint = tint,
        hr_version =
        {
          filename = "__base__/graphics/decorative/shroom-decal/hr-shroom-decal-10.png",
          priority = base_decorative_sprite_priority,
          width = 364,
          height = 204,
          shift = util.by_pixel(2, -3),
          tint = tint,
          scale = 0.5,
        }
      },
      {
        filename = "__base__/graphics/decorative/shroom-decal/shroom-decal-11.png",
        priority = base_decorative_sprite_priority,
        width = 192,
        height = 104,
        shift = util.by_pixel(22, 4),
        tint = tint,
        hr_version =
        {
          filename = "__base__/graphics/decorative/shroom-decal/hr-shroom-decal-11.png",
          priority = base_decorative_sprite_priority,
          width = 378,
          height = 206,
          shift = util.by_pixel(23, 5),
          tint = tint,
          scale = 0.5,
        }
      },
      {
        filename = "__base__/graphics/decorative/shroom-decal/shroom-decal-12.png",
        priority = base_decorative_sprite_priority,
        width = 160,
        height = 108,
        shift = util.by_pixel(-4, 4),
        tint = tint,
        hr_version =
        {
          filename = "__base__/graphics/decorative/shroom-decal/hr-shroom-decal-12.png",
          priority = base_decorative_sprite_priority,
          width = 320,
          height = 220,
          shift = util.by_pixel(-4, 3),
          tint = tint,
          scale = 0.5,
        }
      },
      {
        filename = "__base__/graphics/decorative/shroom-decal/shroom-decal-13.png",
        priority = base_decorative_sprite_priority,
        width = 158,
        height = 82,
        shift = util.by_pixel(32, 10),
        tint = tint,
        hr_version =
        {
          filename = "__base__/graphics/decorative/shroom-decal/hr-shroom-decal-13.png",
          priority = base_decorative_sprite_priority,
          width = 318,
          height = 160,
          shift = util.by_pixel(31, 11),
          tint = tint,
          scale = 0.5,
        }
      },
      {
        filename = "__base__/graphics/decorative/shroom-decal/shroom-decal-14.png",
        priority = base_decorative_sprite_priority,
        width = 186,
        height = 104,
        shift = util.by_pixel(24, 6),
        tint = tint,
        hr_version =
        {
          filename = "__base__/graphics/decorative/shroom-decal/hr-shroom-decal-14.png",
          priority = base_decorative_sprite_priority,
          width = 368,
          height = 206,
          shift = util.by_pixel(25, 6),
          tint = tint,
          scale = 0.5,
        }
      },
      {
        filename = "__base__/graphics/decorative/shroom-decal/shroom-decal-15.png",
        priority = base_decorative_sprite_priority,
        width = 208,
        height = 112,
        shift = util.by_pixel(-6, 0),
        tint = tint,
        hr_version =
        {
          filename = "__base__/graphics/decorative/shroom-decal/hr-shroom-decal-15.png",
          priority = base_decorative_sprite_priority,
          width = 410,
          height = 222,
          shift = util.by_pixel(-5, 0),
          tint = tint,
          scale = 0.5,
        }
      }
    }
  }
end

function lichen(name, tint)
  return
  {
    name = name,
    type = "optimized-decorative",
    order = "b[decorative]-j[bush]-a[mini]-a[green]",
    trigger_effect = decorative_trigger_effects.lichen(),
    collision_mask = {"water-tile", "colliding-with-tiles-only"},
    collision_box = {{-2.1, -1.7}, {2.1, 1.7}},
    pictures =
    {
      {
        filename = "__base__/graphics/decorative/lichen-decal/lichen-decal-00.png",
        priority = base_decorative_sprite_priority,
        width = 180,
        height = 118,
        shift = util.by_pixel(-4, -6),
        tint = tint,
        hr_version =
        {
          filename = "__base__/graphics/decorative/lichen-decal/hr-lichen-decal-00.png",
          priority = base_decorative_sprite_priority,
          width = 356,
          height = 248,
          shift = util.by_pixel(-3, -7),
          tint = tint,
          scale = 0.5,
        }
      },
      {
        filename = "__base__/graphics/decorative/lichen-decal/lichen-decal-01.png",
        priority = base_decorative_sprite_priority,
        width = 168,
        height = 128,
        shift = util.by_pixel(4, 0),
        tint = tint,
        hr_version =
        {
          filename = "__base__/graphics/decorative/lichen-decal/hr-lichen-decal-01.png",
          priority = base_decorative_sprite_priority,
          width = 334,
          height = 260,
          shift = util.by_pixel(4, -1),
          tint = tint,
          scale = 0.5,
        }
      },
      {
        filename = "__base__/graphics/decorative/lichen-decal/lichen-decal-02.png",
        priority = base_decorative_sprite_priority,
        width = 202,
        height = 128,
        shift = util.by_pixel(4, 4),
        tint = tint,
        hr_version =
        {
          filename = "__base__/graphics/decorative/lichen-decal/hr-lichen-decal-02.png",
          priority = base_decorative_sprite_priority,
          width = 418,
          height = 262,
          shift = util.by_pixel(4, 3),
          tint = tint,
          scale = 0.5,
        }
      },
      {
        filename = "__base__/graphics/decorative/lichen-decal/lichen-decal-03.png",
        priority = base_decorative_sprite_priority,
        width = 178,
        height = 116,
        shift = util.by_pixel(2, 2),
        tint = tint,
        hr_version =
        {
          filename = "__base__/graphics/decorative/lichen-decal/hr-lichen-decal-03.png",
          priority = base_decorative_sprite_priority,
          width = 364,
          height = 226,
          shift = util.by_pixel(0, 3),
          tint = tint,
          scale = 0.5,
        }
      },
      {
        filename = "__base__/graphics/decorative/lichen-decal/lichen-decal-04.png",
        priority = base_decorative_sprite_priority,
        width = 188,
        height = 154,
        shift = util.by_pixel(-2, 0),
        tint = tint,
        hr_version =
        {
          filename = "__base__/graphics/decorative/lichen-decal/hr-lichen-decal-04.png",
          priority = base_decorative_sprite_priority,
          width = 382,
          height = 304,
          shift = util.by_pixel(1, 1),
          tint = tint,
          scale = 0.5,
        }
      },
      {
        filename = "__base__/graphics/decorative/lichen-decal/lichen-decal-05.png",
        priority = base_decorative_sprite_priority,
        width = 150,
        height = 114,
        shift = util.by_pixel(-8, 0),
        tint = tint,
        hr_version =
        {
          filename = "__base__/graphics/decorative/lichen-decal/hr-lichen-decal-05.png",
          priority = base_decorative_sprite_priority,
          width = 300,
          height = 224,
          shift = util.by_pixel(-8, 1),
          tint = tint,
          scale = 0.5,
        }
      },
      {
        filename = "__base__/graphics/decorative/lichen-decal/lichen-decal-06.png",
        priority = base_decorative_sprite_priority,
        width = 160,
        height = 102,
        shift = util.by_pixel(-10, 0),
        tint = tint,
        hr_version =
        {
          filename = "__base__/graphics/decorative/lichen-decal/hr-lichen-decal-06.png",
          priority = base_decorative_sprite_priority,
          width = 314,
          height = 224,
          shift = util.by_pixel(-9, 2),
          tint = tint,
          scale = 0.5,
        }
      },
      {
        filename = "__base__/graphics/decorative/lichen-decal/lichen-decal-07.png",
        priority = base_decorative_sprite_priority,
        width = 160,
        height = 128,
        shift = util.by_pixel(-2, -4),
        tint = tint,
        hr_version =
        {
          filename = "__base__/graphics/decorative/lichen-decal/hr-lichen-decal-07.png",
          priority = base_decorative_sprite_priority,
          width = 318,
          height = 266,
          shift = util.by_pixel(-2, -7),
          tint = tint,
          scale = 0.5,
        }
      },
      {
        filename = "__base__/graphics/decorative/lichen-decal/lichen-decal-08.png",
        priority = base_decorative_sprite_priority,
        width = 162,
        height = 98,
        shift = util.by_pixel(2, 0),
        tint = tint,
        hr_version =
        {
          filename = "__base__/graphics/decorative/lichen-decal/hr-lichen-decal-08.png",
          priority = base_decorative_sprite_priority,
          width = 326,
          height = 200,
          shift = util.by_pixel(1, -1),
          tint = tint,
          scale = 0.5,
        }
      },
      {
        filename = "__base__/graphics/decorative/lichen-decal/lichen-decal-09.png",
        priority = base_decorative_sprite_priority,
        width = 146,
        height = 94,
        shift = util.by_pixel(-18, 6),
        tint = tint,
        hr_version =
        {
          filename = "__base__/graphics/decorative/lichen-decal/hr-lichen-decal-09.png",
          priority = base_decorative_sprite_priority,
          width = 304,
          height = 182,
          shift = util.by_pixel(-18, 7),
          tint = tint,
          scale = 0.5,
        }
      },
      {
        filename = "__base__/graphics/decorative/lichen-decal/lichen-decal-10.png",
        priority = base_decorative_sprite_priority,
        width = 118,
        height = 88,
        shift = util.by_pixel(-2, -14),
        tint = tint,
        hr_version =
        {
          filename = "__base__/graphics/decorative/lichen-decal/hr-lichen-decal-10.png",
          priority = base_decorative_sprite_priority,
          width = 238,
          height = 172,
          shift = util.by_pixel(-3, -13),
          tint = tint,
          scale = 0.5,
        }
      },
      {
        filename = "__base__/graphics/decorative/lichen-decal/lichen-decal-11.png",
        priority = base_decorative_sprite_priority,
        width = 154,
        height = 130,
        shift = util.by_pixel(8, -4),
        tint = tint,
        hr_version =
        {
          filename = "__base__/graphics/decorative/lichen-decal/hr-lichen-decal-11.png",
          priority = base_decorative_sprite_priority,
          width = 332,
          height = 258,
          shift = util.by_pixel(6, -4),
          tint = tint,
          scale = 0.5,
        }
      },
      {
        filename = "__base__/graphics/decorative/lichen-decal/lichen-decal-12.png",
        priority = base_decorative_sprite_priority,
        width = 130,
        height = 110,
        shift = util.by_pixel(2, -10),
        tint = tint,
        hr_version =
        {
          filename = "__base__/graphics/decorative/lichen-decal/hr-lichen-decal-12.png",
          priority = base_decorative_sprite_priority,
          width = 256,
          height = 218,
          shift = util.by_pixel(3, -9),
          tint = tint,
          scale = 0.5,
        }
      },
      {
        filename = "__base__/graphics/decorative/lichen-decal/lichen-decal-13.png",
        priority = base_decorative_sprite_priority,
        width = 184,
        height = 104,
        shift = util.by_pixel(0, -8),
        tint = tint,
        hr_version =
        {
          filename = "__base__/graphics/decorative/lichen-decal/hr-lichen-decal-13.png",
          priority = base_decorative_sprite_priority,
          width = 372,
          height = 216,
          shift = util.by_pixel(-1, -6),
          tint = tint,
          scale = 0.5,
        }
      },
      {
        filename = "__base__/graphics/decorative/lichen-decal/lichen-decal-14.png",
        priority = base_decorative_sprite_priority,
        width = 68,
        height = 68,
        shift = util.by_pixel(-2, 4),
        tint = tint,
        hr_version =
        {
          filename = "__base__/graphics/decorative/lichen-decal/hr-lichen-decal-14.png",
          priority = base_decorative_sprite_priority,
          width = 134,
          height = 140,
          shift = util.by_pixel(-2, 3),
          tint = tint,
          scale = 0.5,
        }
      },
      {
        filename = "__base__/graphics/decorative/lichen-decal/lichen-decal-15.png",
        priority = base_decorative_sprite_priority,
        width = 90,
        height = 66,
        shift = util.by_pixel(10, 6),
        tint = tint,
        hr_version =
        {
          filename = "__base__/graphics/decorative/lichen-decal/hr-lichen-decal-15.png",
          priority = base_decorative_sprite_priority,
          width = 174,
          height = 134,
          shift = util.by_pixel(11, 5),
          tint = tint,
          scale = 0.5,
        }
      }
    }
  }
end

local function decal_autoplace_settgins(noise_layer, rectangle)
  local peak = {}

  if rectangle ~= nil then
    local aux_center = (rectangle[2][1] + rectangle[1][1]) / 2
    local aux_range = math.abs(rectangle[2][1] - rectangle[1][1]) / 2
    local water_center = (rectangle[2][2] + rectangle[1][2]) / 2
    local water_range = math.abs(rectangle[2][2] - rectangle[1][2]) / 2

    peak["aux_optimal"] = aux_center
    peak["aux_range"] = aux_range
    peak["aux_max_range"] = water_range + 0.05

    peak["water_optimal"] = water_center
    peak["water_range"] = water_range
    peak["water_max_range"] = water_range + 0.05
  end

  return
  {
    order = "a[doodad]-b[decal]",
    sharpness = 0.3,
    max_probability = 0.01,
    peaks =
    {
      peak,
      {
        influence = 0.2,
        noise_layer = noise_layer,
        noise_octaves_difference = -2,
        noise_persistence = 0.9
      }
    }
  }
end
local grass_peaks =
{
  {{30, 0.9}, {10, 0.4}, 0.6},
  {{20, 0.2}, {15, 0.1}, 0.6}
}

data:extend{
  {
    type = "noise-layer",
    name = "pita"
  },
  {
    type = "noise-layer",
    name = "pita-mini"
  },
  {
    type = "noise-layer",
    name = "fluff"
  },
  {
    type = "noise-layer",
    name = "garballo"
  },
  {
    type = "noise-layer",
    name = "grass1"
  },
  {
    type = "noise-layer",
    name = "grass2"
  },
  {
    name = "rocks",
    type = "noise-layer"
  },
  {
    name = "red-desert-decal",
    type = "noise-layer"
  },
  {
    name = "sand-decal",
    type = "noise-layer"
  },
  {
    name = "sand-dune-decal",
    type = "noise-layer"
  },
  {
    type = "noise-layer",
    name = "brown-fluff"
  },
  {
    type = "noise-layer",
    name = "green-fluff"
  }
}

data:extend{
  {
    name = "brown-asterisk",
    type = "optimized-decorative",
    order = "b[decorative]-b[asterisk]-a[brown]",
    collision_box = {{-0.7, -0.7}, {0.7, 0.7}},
    render_layer = "decorative",
    walking_sound = sounds.plant,
    trigger_effect = decorative_trigger_effects.brown_asterisk(),
    -- autoplace = autoplace_settings("brown-fluff", 1, {{{35, 0.5}, {-15, 0.1}}}),
    autoplace = tog_autoplace
    {
      dims =
      {
        temperature = {10, 25},
        water = {0.3, 0.2}
      },
      peak =
      {
        influence = 0.5,
        noise_layer = "brown-fluff",
        noise_octaves_difference = -2,
        noise_persistence = 0.9
      },
      static_influence = -1
    },
    pictures =
    {
      --bAst
      {
        filename = "__base__/graphics/decorative/brown-asterisk/brown-asterisk-00.png",
        priority = base_decorative_sprite_priority,
        width = 59,
        height = 37,
        shift = util.by_pixel(9.5, -6.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/brown-asterisk/hr-brown-asterisk-00.png",
          priority = base_decorative_sprite_priority,
          width = 119,
          height = 74,
          shift = util.by_pixel(9.75, -6.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/brown-asterisk/brown-asterisk-01.png",
        priority = base_decorative_sprite_priority,
        width = 56,
        height = 47,
        shift = util.by_pixel(6, -8.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/brown-asterisk/hr-brown-asterisk-01.png",
          priority = base_decorative_sprite_priority,
          width = 113,
          height = 94,
          shift = util.by_pixel(5.75, -8.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/brown-asterisk/brown-asterisk-02.png",
        priority = base_decorative_sprite_priority,
        width = 47,
        height = 34,
        shift = util.by_pixel(4.5, -3),
        hr_version =
        {
          filename = "__base__/graphics/decorative/brown-asterisk/hr-brown-asterisk-02.png",
          priority = base_decorative_sprite_priority,
          width = 94,
          height = 69,
          shift = util.by_pixel(4.5, -2.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/brown-asterisk/brown-asterisk-03.png",
        priority = base_decorative_sprite_priority,
        width = 53,
        height = 41,
        shift = util.by_pixel(9.5, -8.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/brown-asterisk/hr-brown-asterisk-03.png",
          priority = base_decorative_sprite_priority,
          width = 106,
          height = 81,
          shift = util.by_pixel(9.5, -8.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/brown-asterisk/brown-asterisk-04.png",
        priority = base_decorative_sprite_priority,
        width = 48,
        height = 39,
        shift = util.by_pixel(4, -8.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/brown-asterisk/hr-brown-asterisk-04.png",
          priority = base_decorative_sprite_priority,
          width = 94,
          height = 77,
          shift = util.by_pixel(4, -8.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/brown-asterisk/brown-asterisk-05.png",
        priority = base_decorative_sprite_priority,
        width = 38,
        height = 32,
        shift = util.by_pixel(1, -6),
        hr_version =
        {
          filename = "__base__/graphics/decorative/brown-asterisk/hr-brown-asterisk-05.png",
          priority = base_decorative_sprite_priority,
          width = 77,
          height = 63,
          shift = util.by_pixel(1.25, -5.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/brown-asterisk/brown-asterisk-06.png",
        priority = base_decorative_sprite_priority,
        width = 56,
        height = 32,
        shift = util.by_pixel(9, -1),
        hr_version =
        {
          filename = "__base__/graphics/decorative/brown-asterisk/hr-brown-asterisk-06.png",
          priority = base_decorative_sprite_priority,
          width = 112,
          height = 64,
          shift = util.by_pixel(9.5, -1.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/brown-asterisk/brown-asterisk-07.png",
        priority = base_decorative_sprite_priority,
        width = 49,
        height = 47,
        shift = util.by_pixel(8.5, -7.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/brown-asterisk/hr-brown-asterisk-07.png",
          priority = base_decorative_sprite_priority,
          width = 97,
          height = 94,
          shift = util.by_pixel(8.25, -8),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/brown-asterisk/brown-asterisk-08.png",
        priority = base_decorative_sprite_priority,
        width = 53,
        height = 29,
        shift = util.by_pixel(4.5, -3.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/brown-asterisk/hr-brown-asterisk-08.png",
          priority = base_decorative_sprite_priority,
          width = 107,
          height = 57,
          shift = util.by_pixel(4.25, -3.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/brown-asterisk/brown-asterisk-09.png",
        priority = base_decorative_sprite_priority,
        width = 57,
        height = 46,
        shift = util.by_pixel(10.5, -3),
        hr_version =
        {
          filename = "__base__/graphics/decorative/brown-asterisk/hr-brown-asterisk-09.png",
          priority = base_decorative_sprite_priority,
          width = 115,
          height = 90,
          shift = util.by_pixel(10.75, -3),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/brown-asterisk/brown-asterisk-10.png",
        priority = base_decorative_sprite_priority,
        width = 56,
        height = 30,
        shift = util.by_pixel(-4, 2),
        hr_version =
        {
          filename = "__base__/graphics/decorative/brown-asterisk/hr-brown-asterisk-10.png",
          priority = base_decorative_sprite_priority,
          width = 110,
          height = 59,
          shift = util.by_pixel(-4, 2.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/brown-asterisk/brown-asterisk-11.png",
        priority = base_decorative_sprite_priority,
        width = 43,
        height = 38,
        shift = util.by_pixel(11.5, -2),
        hr_version =
        {
          filename = "__base__/graphics/decorative/brown-asterisk/hr-brown-asterisk-11.png",
          priority = base_decorative_sprite_priority,
          width = 85,
          height = 74,
          shift = util.by_pixel(11.75, -2),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/brown-asterisk/brown-asterisk-12.png",
        priority = base_decorative_sprite_priority,
        width = 48,
        height = 31,
        shift = util.by_pixel(8, -9.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/brown-asterisk/hr-brown-asterisk-12.png",
          priority = base_decorative_sprite_priority,
          width = 95,
          height = 62,
          shift = util.by_pixel(8.25, -9.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/brown-asterisk/brown-asterisk-13.png",
        priority = base_decorative_sprite_priority,
        width = 38,
        height = 40,
        shift = util.by_pixel(7, -4),
        hr_version =
        {
          filename = "__base__/graphics/decorative/brown-asterisk/hr-brown-asterisk-13.png",
          priority = base_decorative_sprite_priority,
          width = 77,
          height = 80,
          shift = util.by_pixel(6.75, -4),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/brown-asterisk/brown-asterisk-14.png",
        priority = base_decorative_sprite_priority,
        width = 43,
        height = 25,
        shift = util.by_pixel(5.5, -5.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/brown-asterisk/hr-brown-asterisk-14.png",
          priority = base_decorative_sprite_priority,
          width = 87,
          height = 49,
          shift = util.by_pixel(5.25, -5.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/brown-asterisk/brown-asterisk-15.png",
        priority = base_decorative_sprite_priority,
        width = 39,
        height = 30,
        shift = util.by_pixel(3.5, -4),
        hr_version =
        {
          filename = "__base__/graphics/decorative/brown-asterisk/hr-brown-asterisk-15.png",
          priority = base_decorative_sprite_priority,
          width = 77,
          height = 61,
          shift = util.by_pixel(3.25, -4.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/brown-asterisk/brown-asterisk-16.png",
        priority = base_decorative_sprite_priority,
        width = 54,
        height = 33,
        shift = util.by_pixel(7, -6.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/brown-asterisk/hr-brown-asterisk-16.png",
          priority = base_decorative_sprite_priority,
          width = 107,
          height = 66,
          shift = util.by_pixel(7.25, -7),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/brown-asterisk/brown-asterisk-17.png",
        priority = base_decorative_sprite_priority,
        width = 43,
        height = 30,
        shift = util.by_pixel(4.5, -3),
        hr_version =
        {
          filename = "__base__/graphics/decorative/brown-asterisk/hr-brown-asterisk-17.png",
          priority = base_decorative_sprite_priority,
          width = 85,
          height = 60,
          shift = util.by_pixel(4.75, -3.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/brown-asterisk/brown-asterisk-18.png",
        priority = base_decorative_sprite_priority,
        width = 43,
        height = 29,
        shift = util.by_pixel(7.5, -4.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/brown-asterisk/hr-brown-asterisk-18.png",
          priority = base_decorative_sprite_priority,
          width = 85,
          height = 59,
          shift = util.by_pixel(7.25, -4.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/brown-asterisk/brown-asterisk-19.png",
        priority = base_decorative_sprite_priority,
        width = 33,
        height = 26,
        shift = util.by_pixel(4.5, -5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/brown-asterisk/hr-brown-asterisk-19.png",
          priority = base_decorative_sprite_priority,
          width = 65,
          height = 52,
          shift = util.by_pixel(4.75, -5),
          scale = 0.5
        }
      }
    }
  },
  {
    name = "green-asterisk",
    type = "optimized-decorative",
    order = "b[decorative]-b[asterisk-mini]-b[green]",
    collision_box = {{-0.7, -0.7}, {0.7, 0.7}},
    render_layer = "decorative",
    walking_sound = sounds.plant,
    trigger_effect = decorative_trigger_effects.green_asterisk(),
    -- autoplace = autoplace_settings(nil, 0.05, {{{35, 1}, {0, 0.7}}}),
    autoplace = tog_autoplace
    {
      dims =
      {
        temperature = {17.5, 17.5},
        water = {0.85, 0.15}
      },
      peak =
      {
        influence = 0.5,
        noise_layer = "green-fluff",
        noise_octaves_difference = -2,
        noise_persistence = 0.9
      },
      static_influence = -1
    },
    pictures =
    {
      --gAst
      {
        filename = "__base__/graphics/decorative/green-asterisk/green-asterisk-00.png",
        priority = base_decorative_sprite_priority,
        width = 60,
        height = 40,
        shift = util.by_pixel(5, -4),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-asterisk/hr-green-asterisk-00.png",
          priority = base_decorative_sprite_priority,
          width = 120,
          height = 80,
          shift = util.by_pixel(5, -4),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-asterisk/green-asterisk-01.png",
        priority = base_decorative_sprite_priority,
        width = 65,
        height = 47,
        shift = util.by_pixel(0.5, -5.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-asterisk/hr-green-asterisk-01.png",
          priority = base_decorative_sprite_priority,
          width = 130,
          height = 95,
          shift = util.by_pixel(1, -5.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-asterisk/green-asterisk-02.png",
        priority = base_decorative_sprite_priority,
        width = 61,
        height = 38,
        shift = util.by_pixel(-0.5, 1),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-asterisk/hr-green-asterisk-02.png",
          priority = base_decorative_sprite_priority,
          width = 122,
          height = 76,
          shift = util.by_pixel(0, 1),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-asterisk/green-asterisk-03.png",
        priority = base_decorative_sprite_priority,
        width = 60,
        height = 38,
        shift = util.by_pixel(6, -1),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-asterisk/hr-green-asterisk-03.png",
          priority = base_decorative_sprite_priority,
          width = 121,
          height = 75,
          shift = util.by_pixel(5.75, -0.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-asterisk/green-asterisk-04.png",
        priority = base_decorative_sprite_priority,
        width = 42,
        height = 38,
        shift = util.by_pixel(4, -3),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-asterisk/hr-green-asterisk-04.png",
          priority = base_decorative_sprite_priority,
          width = 85,
          height = 77,
          shift = util.by_pixel(3.75, -3.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-asterisk/green-asterisk-05.png",
        priority = base_decorative_sprite_priority,
        width = 67,
        height = 39,
        shift = util.by_pixel(-0.5, -1.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-asterisk/hr-green-asterisk-05.png",
          priority = base_decorative_sprite_priority,
          width = 132,
          height = 77,
          shift = util.by_pixel(-0.5, -1.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-asterisk/green-asterisk-06.png",
        priority = base_decorative_sprite_priority,
        width = 42,
        height = 46,
        shift = util.by_pixel(3, -4),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-asterisk/hr-green-asterisk-06.png",
          priority = base_decorative_sprite_priority,
          width = 84,
          height = 92,
          shift = util.by_pixel(3, -4),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-asterisk/green-asterisk-07.png",
        priority = base_decorative_sprite_priority,
        width = 60,
        height = 40,
        shift = util.by_pixel(6, -3),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-asterisk/hr-green-asterisk-07.png",
          priority = base_decorative_sprite_priority,
          width = 118,
          height = 79,
          shift = util.by_pixel(6, -2.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-asterisk/green-asterisk-08.png",
        priority = base_decorative_sprite_priority,
        width = 51,
        height = 39,
        shift = util.by_pixel(3.5, 0.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-asterisk/hr-green-asterisk-08.png",
          priority = base_decorative_sprite_priority,
          width = 104,
          height = 78,
          shift = util.by_pixel(3.5, 0.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-asterisk/green-asterisk-09.png",
        priority = base_decorative_sprite_priority,
        width = 44,
        height = 30,
        shift = util.by_pixel(-1, -3),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-asterisk/hr-green-asterisk-09.png",
          priority = base_decorative_sprite_priority,
          width = 88,
          height = 61,
          shift = util.by_pixel(-1, -2.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-asterisk/green-asterisk-10.png",
        priority = base_decorative_sprite_priority,
        width = 44,
        height = 31,
        shift = util.by_pixel(3, -9.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-asterisk/hr-green-asterisk-10.png",
          priority = base_decorative_sprite_priority,
          width = 89,
          height = 63,
          shift = util.by_pixel(2.75, -9.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-asterisk/green-asterisk-11.png",
        priority = base_decorative_sprite_priority,
        width = 45,
        height = 28,
        shift = util.by_pixel(13.5, -1),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-asterisk/hr-green-asterisk-11.png",
          priority = base_decorative_sprite_priority,
          width = 91,
          height = 58,
          shift = util.by_pixel(13.75, -1),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-asterisk/green-asterisk-12.png",
        priority = base_decorative_sprite_priority,
        width = 45,
        height = 32,
        shift = util.by_pixel(-7.5, 2),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-asterisk/hr-green-asterisk-12.png",
          priority = base_decorative_sprite_priority,
          width = 90,
          height = 64,
          shift = util.by_pixel(-7.5, 2),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-asterisk/green-asterisk-13.png",
        priority = base_decorative_sprite_priority,
        width = 44,
        height = 36,
        shift = util.by_pixel(4, -5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-asterisk/hr-green-asterisk-13.png",
          priority = base_decorative_sprite_priority,
          width = 89,
          height = 73,
          shift = util.by_pixel(4.25, -4.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-asterisk/green-asterisk-14.png",
        priority = base_decorative_sprite_priority,
        width = 38,
        height = 28,
        shift = util.by_pixel(1, -3),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-asterisk/hr-green-asterisk-14.png",
          priority = base_decorative_sprite_priority,
          width = 78,
          height = 56,
          shift = util.by_pixel(1, -3),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-asterisk/green-asterisk-15.png",
        priority = base_decorative_sprite_priority,
        width = 43,
        height = 25,
        shift = util.by_pixel(3.5, -0.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-asterisk/hr-green-asterisk-15.png",
          priority = base_decorative_sprite_priority,
          width = 85,
          height = 51,
          shift = util.by_pixel(3.25, -0.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-asterisk/green-asterisk-16.png",
        priority = base_decorative_sprite_priority,
        width = 46,
        height = 36,
        shift = util.by_pixel(8, -2),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-asterisk/hr-green-asterisk-16.png",
          priority = base_decorative_sprite_priority,
          width = 92,
          height = 71,
          shift = util.by_pixel(8, -1.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-asterisk/green-asterisk-17.png",
        priority = base_decorative_sprite_priority,
        width = 46,
        height = 33,
        shift = util.by_pixel(3, -0.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-asterisk/hr-green-asterisk-17.png",
          priority = base_decorative_sprite_priority,
          width = 90,
          height = 65,
          shift = util.by_pixel(3, -0.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-asterisk/green-asterisk-18.png",
        priority = base_decorative_sprite_priority,
        width = 58,
        height = 34,
        shift = util.by_pixel(4, -5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-asterisk/hr-green-asterisk-18.png",
          priority = base_decorative_sprite_priority,
          width = 117,
          height = 69,
          shift = util.by_pixel(4.25, -4.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-asterisk/green-asterisk-19.png",
        priority = base_decorative_sprite_priority,
        width = 41,
        height = 32,
        shift = util.by_pixel(0.5, -2),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-asterisk/hr-green-asterisk-19.png",
          priority = base_decorative_sprite_priority,
          width = 82,
          height = 64,
          shift = util.by_pixel(0.5, -2),
          scale = 0.5
        }
      }
    }
  },
  {
    name = "green-asterisk-mini",
    type = "optimized-decorative",
    order = "b[decorative]-b[asterisk-mini]-c[green]",
    collision_box = {{-0.7, -0.7}, {0.7, 0.7}},
    render_layer = "decorative",
    trigger_effect = decorative_trigger_effects.green_asterisk_mini(),
    -- autoplace = autoplace_settings(nil, 0.05, {{{35, 0.7}, {-5, 0.4}}}),
    autoplace = tog_autoplace
    {
      dims =
      {
        temperature = {17.5, 17.5},
        water = {0.55, 0.15}
      },
      peak =
      {
        influence = 0.5,
        noise_layer = "green-fluff",
        noise_octaves_difference = -2,
        noise_persistence = 0.7
      },
      static_influence = -1
    },
    pictures =
    {
      --miniAstG
      {
        filename = "__base__/graphics/decorative/green-asterisk-mini/green-asterisk-mini-00.png",
        priority = base_decorative_sprite_priority,
        width = 21,
        height = 20,
        shift = util.by_pixel(8.5, 1),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-asterisk-mini/hr-green-asterisk-mini-00.png",
          priority = base_decorative_sprite_priority,
          width = 42,
          height = 41,
          shift = util.by_pixel(8.5, 1.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-asterisk-mini/green-asterisk-mini-01.png",
        priority = base_decorative_sprite_priority,
        width = 15,
        height = 20,
        shift = util.by_pixel(3.5, -1),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-asterisk-mini/hr-green-asterisk-mini-01.png",
          priority = base_decorative_sprite_priority,
          width = 31,
          height = 40,
          shift = util.by_pixel(3.25, -1),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-asterisk-mini/green-asterisk-mini-02.png",
        priority = base_decorative_sprite_priority,
        width = 24,
        height = 20,
        shift = util.by_pixel(-1, 2),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-asterisk-mini/hr-green-asterisk-mini-02.png",
          priority = base_decorative_sprite_priority,
          width = 49,
          height = 39,
          shift = util.by_pixel(-1.25, 2.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-asterisk-mini/green-asterisk-mini-03.png",
        priority = base_decorative_sprite_priority,
        width = 27,
        height = 16,
        shift = util.by_pixel(-1.5, 0),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-asterisk-mini/hr-green-asterisk-mini-03.png",
          priority = base_decorative_sprite_priority,
          width = 54,
          height = 32,
          shift = util.by_pixel(-1.5, 0),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-asterisk-mini/green-asterisk-mini-04.png",
        priority = base_decorative_sprite_priority,
        width = 20,
        height = 21,
        shift = util.by_pixel(-7, -2.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-asterisk-mini/hr-green-asterisk-mini-04.png",
          priority = base_decorative_sprite_priority,
          width = 41,
          height = 43,
          shift = util.by_pixel(-6.75, -1.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-asterisk-mini/green-asterisk-mini-05.png",
        priority = base_decorative_sprite_priority,
        width = 20,
        height = 20,
        shift = util.by_pixel(-4, -2),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-asterisk-mini/hr-green-asterisk-mini-05.png",
          priority = base_decorative_sprite_priority,
          width = 39,
          height = 39,
          shift = util.by_pixel(-4.25, -1.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-asterisk-mini/green-asterisk-mini-06.png",
        priority = base_decorative_sprite_priority,
        width = 15,
        height = 9,
        shift = util.by_pixel(-0.5, 0.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-asterisk-mini/hr-green-asterisk-mini-06.png",
          priority = base_decorative_sprite_priority,
          width = 31,
          height = 19,
          shift = util.by_pixel(-0.25, 0.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-asterisk-mini/green-asterisk-mini-07.png",
        priority = base_decorative_sprite_priority,
        width = 14,
        height = 10,
        shift = util.by_pixel(0, 0),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-asterisk-mini/hr-green-asterisk-mini-07.png",
          priority = base_decorative_sprite_priority,
          width = 27,
          height = 20,
          shift = util.by_pixel(0.25, 0.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-asterisk-mini/green-asterisk-mini-08.png",
        priority = base_decorative_sprite_priority,
        width = 17,
        height = 10,
        shift = util.by_pixel(-1.5, 0),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-asterisk-mini/hr-green-asterisk-mini-08.png",
          priority = base_decorative_sprite_priority,
          width = 32,
          height = 20,
          shift = util.by_pixel(-1.5, 0.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-asterisk-mini/green-asterisk-mini-09.png",
        priority = base_decorative_sprite_priority,
        width = 13,
        height = 13,
        shift = util.by_pixel(0.5, -1.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-asterisk-mini/hr-green-asterisk-mini-09.png",
          priority = base_decorative_sprite_priority,
          width = 26,
          height = 27,
          shift = util.by_pixel(1, -1.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-asterisk-mini/green-asterisk-mini-10.png",
        priority = base_decorative_sprite_priority,
        width = 18,
        height = 12,
        shift = util.by_pixel(0, 1),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-asterisk-mini/hr-green-asterisk-mini-10.png",
          priority = base_decorative_sprite_priority,
          width = 37,
          height = 23,
          shift = util.by_pixel(-0.25, 0.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-asterisk-mini/green-asterisk-mini-11.png",
        priority = base_decorative_sprite_priority,
        width = 23,
        height = 16,
        shift = util.by_pixel(-3.5, -3),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-asterisk-mini/hr-green-asterisk-mini-11.png",
          priority = base_decorative_sprite_priority,
          width = 46,
          height = 33,
          shift = util.by_pixel(-3.5, -2.75),
          scale = 0.5
        }
      }
    }
  },
  {
    -- it's actually green
    name = "brown-asterisk-mini",
    type = "optimized-decorative",
    order = "b[decorative]-b[asterisk-mini]-c[brown]",
    collision_box = {{-0.7, -0.7}, {0.7, 0.7}},
    render_layer = "decorative",
    trigger_effect = decorative_trigger_effects.brown_asterisk_mini(),
    -- autoplace = autoplace_settings(nil, 0.05, {{{35, 0.7}, {-5, 0.4}}}),
    autoplace = tog_autoplace
    {
      dims =
      {
        temperature = {15, 20},
        water = {0.55, 0.15}
      },
      peak =
      {
        influence = 0.5,
        noise_layer = "brown-fluff",
        noise_octaves_difference = -2,
        noise_persistence = 0.7
      },
      static_influence = -0.5,
      sharpness = 0.5
    },
    pictures =
    {
      --miniAstB
      {
        filename = "__base__/graphics/decorative/brown-asterisk-mini/brown-asterisk-mini-00.png",
        priority = base_decorative_sprite_priority,
        width = 19,
        height = 17,
        shift = util.by_pixel(6.5, 0.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/brown-asterisk-mini/hr-brown-asterisk-mini-00.png",
          priority = base_decorative_sprite_priority,
          width = 39,
          height = 35,
          shift = util.by_pixel(6.25, 0.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/brown-asterisk-mini/brown-asterisk-mini-01.png",
        priority = base_decorative_sprite_priority,
        width = 12,
        height = 12,
        shift = util.by_pixel(3, -1),
        hr_version =
        {
          filename = "__base__/graphics/decorative/brown-asterisk-mini/hr-brown-asterisk-mini-01.png",
          priority = base_decorative_sprite_priority,
          width = 24,
          height = 24,
          shift = util.by_pixel(3, -1),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/brown-asterisk-mini/brown-asterisk-mini-02.png",
        priority = base_decorative_sprite_priority,
        width = 19,
        height = 23,
        shift = util.by_pixel(-0.5, -0.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/brown-asterisk-mini/hr-brown-asterisk-mini-02.png",
          priority = base_decorative_sprite_priority,
          width = 39,
          height = 46,
          shift = util.by_pixel(-0.25, 0),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/brown-asterisk-mini/brown-asterisk-mini-03.png",
        priority = base_decorative_sprite_priority,
        width = 22,
        height = 13,
        shift = util.by_pixel(-1, -4.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/brown-asterisk-mini/hr-brown-asterisk-mini-03.png",
          priority = base_decorative_sprite_priority,
          width = 44,
          height = 25,
          shift = util.by_pixel(-1.5, -4.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/brown-asterisk-mini/brown-asterisk-mini-04.png",
        priority = base_decorative_sprite_priority,
        width = 15,
        height = 15,
        shift = util.by_pixel(-3.5, -1.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/brown-asterisk-mini/hr-brown-asterisk-mini-04.png",
          priority = base_decorative_sprite_priority,
          width = 31,
          height = 30,
          shift = util.by_pixel(-3.75, -1),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/brown-asterisk-mini/brown-asterisk-mini-05.png",
        priority = base_decorative_sprite_priority,
        width = 32,
        height = 22,
        shift = util.by_pixel(-3, 1),
        hr_version =
        {
          filename = "__base__/graphics/decorative/brown-asterisk-mini/hr-brown-asterisk-mini-05.png",
          priority = base_decorative_sprite_priority,
          width = 63,
          height = 43,
          shift = util.by_pixel(-2.75, 0.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/brown-asterisk-mini/brown-asterisk-mini-06.png",
        priority = base_decorative_sprite_priority,
        width = 28,
        height = 15,
        shift = util.by_pixel(-3, -5.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/brown-asterisk-mini/hr-brown-asterisk-mini-06.png",
          priority = base_decorative_sprite_priority,
          width = 55,
          height = 28,
          shift = util.by_pixel(-3.25, -5.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/brown-asterisk-mini/brown-asterisk-mini-07.png",
        priority = base_decorative_sprite_priority,
        width = 27,
        height = 20,
        shift = util.by_pixel(0.5, 0),
        hr_version =
        {
          filename = "__base__/graphics/decorative/brown-asterisk-mini/hr-brown-asterisk-mini-07.png",
          priority = base_decorative_sprite_priority,
          width = 53,
          height = 40,
          shift = util.by_pixel(0.25, 0.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/brown-asterisk-mini/brown-asterisk-mini-08.png",
        priority = base_decorative_sprite_priority,
        width = 17,
        height = 11,
        shift = util.by_pixel(-0.5, -0.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/brown-asterisk-mini/hr-brown-asterisk-mini-08.png",
          priority = base_decorative_sprite_priority,
          width = 32,
          height = 21,
          shift = util.by_pixel(-0.5, -0.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/brown-asterisk-mini/brown-asterisk-mini-09.png",
        priority = base_decorative_sprite_priority,
        width = 12,
        height = 13,
        shift = util.by_pixel(0, -0.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/brown-asterisk-mini/hr-brown-asterisk-mini-09.png",
          priority = base_decorative_sprite_priority,
          width = 25,
          height = 24,
          shift = util.by_pixel(-0.25, -0.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/brown-asterisk-mini/brown-asterisk-mini-10.png",
        priority = base_decorative_sprite_priority,
        width = 19,
        height = 12,
        shift = util.by_pixel(0.5, 1),
        hr_version =
        {
          filename = "__base__/graphics/decorative/brown-asterisk-mini/hr-brown-asterisk-mini-10.png",
          priority = base_decorative_sprite_priority,
          width = 39,
          height = 24,
          shift = util.by_pixel(0.75, 0.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/brown-asterisk-mini/brown-asterisk-mini-11.png",
        priority = base_decorative_sprite_priority,
        width = 20,
        height = 8,
        shift = util.by_pixel(1, 2),
        hr_version =
        {
          filename = "__base__/graphics/decorative/brown-asterisk-mini/hr-brown-asterisk-mini-11.png",
          priority = base_decorative_sprite_priority,
          width = 38,
          height = 16,
          shift = util.by_pixel(1, 2),
          scale = 0.5
        }
      }
    }
  },
  {
    name = "red-asterisk",
    type = "optimized-decorative",
    order = "b[decorative]-b[asterisk]-c[red]",
    collision_box = {{-0.7, -0.7}, {0.7, 0.7}},
    render_layer = "decorative",
    walking_sound = sounds.plant,
    trigger_effect = decorative_trigger_effects.red_asterisk(),
    -- autoplace = autoplace_settings(nil, 0.05, {{{35, 0.7}, {-5, 0.4}}}),
    autoplace = tog_autoplace
    {
      dims =
      {
        temperature = {15, 20},
        water = {0.55, 0.15}
      },
      peak =
      {
        influence = 0.5,
        noise_layer = "brown-fluff",
        noise_octaves_difference = -2,
        noise_persistence = 0.9
      },
      static_influence = -1,
      sharpness = 0.5
    },
    pictures =
    {
      --rAst
      {
        filename = "__base__/graphics/decorative/red-asterisk/red-asterisk-00.png",
        priority = base_decorative_sprite_priority,
        width = 56,
        height = 41,
        shift = util.by_pixel(10, -6.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/red-asterisk/hr-red-asterisk-00.png",
          priority = base_decorative_sprite_priority,
          width = 111,
          height = 82,
          shift = util.by_pixel(9.75, -6),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/red-asterisk/red-asterisk-01.png",
        priority = base_decorative_sprite_priority,
        width = 42,
        height = 35,
        shift = util.by_pixel(7, -1.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/red-asterisk/hr-red-asterisk-01.png",
          priority = base_decorative_sprite_priority,
          width = 85,
          height = 71,
          shift = util.by_pixel(7.25, -1.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/red-asterisk/red-asterisk-02.png",
        priority = base_decorative_sprite_priority,
        width = 63,
        height = 38,
        shift = util.by_pixel(3.5, -1),
        hr_version =
        {
          filename = "__base__/graphics/decorative/red-asterisk/hr-red-asterisk-02.png",
          priority = base_decorative_sprite_priority,
          width = 126,
          height = 75,
          shift = util.by_pixel(3.5, -0.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/red-asterisk/red-asterisk-03.png",
        priority = base_decorative_sprite_priority,
        width = 57,
        height = 37,
        shift = util.by_pixel(1.5, -4.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/red-asterisk/hr-red-asterisk-03.png",
          priority = base_decorative_sprite_priority,
          width = 114,
          height = 73,
          shift = util.by_pixel(1.5, -4.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/red-asterisk/red-asterisk-04.png",
        priority = base_decorative_sprite_priority,
        width = 65,
        height = 45,
        shift = util.by_pixel(6.5, -3.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/red-asterisk/hr-red-asterisk-04.png",
          priority = base_decorative_sprite_priority,
          width = 130,
          height = 90,
          shift = util.by_pixel(6.5, -3),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/red-asterisk/red-asterisk-05.png",
        priority = base_decorative_sprite_priority,
        width = 51,
        height = 38,
        shift = util.by_pixel(3.5, -2),
        hr_version =
        {
          filename = "__base__/graphics/decorative/red-asterisk/hr-red-asterisk-05.png",
          priority = base_decorative_sprite_priority,
          width = 104,
          height = 75,
          shift = util.by_pixel(3.5, -1.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/red-asterisk/red-asterisk-06.png",
        priority = base_decorative_sprite_priority,
        width = 33,
        height = 38,
        shift = util.by_pixel(5.5, -2),
        hr_version =
        {
          filename = "__base__/graphics/decorative/red-asterisk/hr-red-asterisk-06.png",
          priority = base_decorative_sprite_priority,
          width = 64,
          height = 77,
          shift = util.by_pixel(5.5, -1.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/red-asterisk/red-asterisk-07.png",
        priority = base_decorative_sprite_priority,
        width = 51,
        height = 23,
        shift = util.by_pixel(2.5, 0.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/red-asterisk/hr-red-asterisk-07.png",
          priority = base_decorative_sprite_priority,
          width = 101,
          height = 45,
          shift = util.by_pixel(2.25, 0.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/red-asterisk/red-asterisk-08.png",
        priority = base_decorative_sprite_priority,
        width = 29,
        height = 28,
        shift = util.by_pixel(-1.5, -2),
        hr_version =
        {
          filename = "__base__/graphics/decorative/red-asterisk/hr-red-asterisk-08.png",
          priority = base_decorative_sprite_priority,
          width = 60,
          height = 57,
          shift = util.by_pixel(-1.5, -1.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/red-asterisk/red-asterisk-09.png",
        priority = base_decorative_sprite_priority,
        width = 54,
        height = 32,
        shift = util.by_pixel(8, -8),
        hr_version =
        {
          filename = "__base__/graphics/decorative/red-asterisk/hr-red-asterisk-09.png",
          priority = base_decorative_sprite_priority,
          width = 107,
          height = 63,
          shift = util.by_pixel(8.25, -8.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/red-asterisk/red-asterisk-10.png",
        priority = base_decorative_sprite_priority,
        width = 31,
        height = 30,
        shift = util.by_pixel(11.5, -1),
        hr_version =
        {
          filename = "__base__/graphics/decorative/red-asterisk/hr-red-asterisk-10.png",
          priority = base_decorative_sprite_priority,
          width = 63,
          height = 59,
          shift = util.by_pixel(11.75, -1.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/red-asterisk/red-asterisk-11.png",
        priority = base_decorative_sprite_priority,
        width = 39,
        height = 23,
        shift = util.by_pixel(1.5, 5.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/red-asterisk/hr-red-asterisk-11.png",
          priority = base_decorative_sprite_priority,
          width = 78,
          height = 47,
          shift = util.by_pixel(1.5, 5.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/red-asterisk/red-asterisk-12.png",
        priority = base_decorative_sprite_priority,
        width = 36,
        height = 43,
        shift = util.by_pixel(-9, -3.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/red-asterisk/hr-red-asterisk-12.png",
          priority = base_decorative_sprite_priority,
          width = 72,
          height = 86,
          shift = util.by_pixel(-8.5, -3),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/red-asterisk/red-asterisk-13.png",
        priority = base_decorative_sprite_priority,
        width = 48,
        height = 25,
        shift = util.by_pixel(3, -3.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/red-asterisk/hr-red-asterisk-13.png",
          priority = base_decorative_sprite_priority,
          width = 95,
          height = 51,
          shift = util.by_pixel(2.75, -3.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/red-asterisk/red-asterisk-14.png",
        priority = base_decorative_sprite_priority,
        width = 28,
        height = 27,
        shift = util.by_pixel(5, -3.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/red-asterisk/hr-red-asterisk-14.png",
          priority = base_decorative_sprite_priority,
          width = 55,
          height = 54,
          shift = util.by_pixel(5.25, -3.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/red-asterisk/red-asterisk-15.png",
        priority = base_decorative_sprite_priority,
        width = 35,
        height = 36,
        shift = util.by_pixel(7.5, -2),
        hr_version =
        {
          filename = "__base__/graphics/decorative/red-asterisk/hr-red-asterisk-15.png",
          priority = base_decorative_sprite_priority,
          width = 70,
          height = 72,
          shift = util.by_pixel(7.5, -2),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/red-asterisk/red-asterisk-16.png",
        priority = base_decorative_sprite_priority,
        width = 42,
        height = 33,
        shift = util.by_pixel(4, -2.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/red-asterisk/hr-red-asterisk-16.png",
          priority = base_decorative_sprite_priority,
          width = 84,
          height = 65,
          shift = util.by_pixel(4, -2.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/red-asterisk/red-asterisk-17.png",
        priority = base_decorative_sprite_priority,
        width = 27,
        height = 27,
        shift = util.by_pixel(3.5, -0.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/red-asterisk/hr-red-asterisk-17.png",
          priority = base_decorative_sprite_priority,
          width = 53,
          height = 52,
          shift = util.by_pixel(3.75, -0.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/red-asterisk/red-asterisk-18.png",
        priority = base_decorative_sprite_priority,
        width = 35,
        height = 23,
        shift = util.by_pixel(0.5, -0.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/red-asterisk/hr-red-asterisk-18.png",
          priority = base_decorative_sprite_priority,
          width = 68,
          height = 45,
          shift = util.by_pixel(0.5, -0.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/red-asterisk/red-asterisk-19.png",
        priority = base_decorative_sprite_priority,
        width = 44,
        height = 32,
        shift = util.by_pixel(9, -3),
        hr_version =
        {
          filename = "__base__/graphics/decorative/red-asterisk/hr-red-asterisk-19.png",
          priority = base_decorative_sprite_priority,
          width = 88,
          height = 63,
          shift = util.by_pixel(9, -3.25),
          scale = 0.5
        }
      }
    }
  },
  {
    name = "green-pita",
    type = "optimized-decorative",
    order = "b[decorative]-c[pita]-a[green]",
    collision_box = {{-0.7, -0.7}, {0.7, 0.7}},
    render_layer = "object",
    walking_sound = sounds.plant,
    trigger_effect = decorative_trigger_effects.green_pita(),
    autoplace =
    {
      order = "a[doodad]-e[pita]",
      sharpness = 0.3,
      -- coverage = 0.2, -- Coverage makes everything confusing
      max_probability = 0.5,
      random_probability_penalty = 0.2,
      peaks =
      {
        {
          influence = -0.5
        },
        {
          noise_layer = "fluff",
          noise_octaves_difference = -2,
          noise_persistence = 0.7
        },
        {
          aux_optimal = 1,
          aux_range = 0.2,
          aux_max_range = .3,
          water_optimal = 0.3,
          water_range = 0.1,
          water_max_range = 0.2
        }
      }
    },
    pictures =
    {
      --gpita
      {
        filename = "__base__/graphics/decorative/green-pita/green-pita-00.png",
        priority = base_decorative_sprite_priority,
        width = 77,
        height = 53,
        shift = util.by_pixel(11.5, -5.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-pita/hr-green-pita-00.png",
          priority = base_decorative_sprite_priority,
          width = 153,
          height = 104,
          shift = util.by_pixel(11.25, -5.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-pita/green-pita-01.png",
        priority = base_decorative_sprite_priority,
        width = 73,
        height = 53,
        shift = util.by_pixel(11.5, -9.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-pita/hr-green-pita-01.png",
          priority = base_decorative_sprite_priority,
          width = 146,
          height = 104,
          shift = util.by_pixel(11.5, -9.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-pita/green-pita-02.png",
        priority = base_decorative_sprite_priority,
        width = 59,
        height = 41,
        shift = util.by_pixel(9.5, -6.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-pita/hr-green-pita-02.png",
          priority = base_decorative_sprite_priority,
          width = 120,
          height = 83,
          shift = util.by_pixel(9.5, -6.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-pita/green-pita-03.png",
        priority = base_decorative_sprite_priority,
        width = 60,
        height = 42,
        shift = util.by_pixel(10, -6),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-pita/hr-green-pita-03.png",
          priority = base_decorative_sprite_priority,
          width = 121,
          height = 84,
          shift = util.by_pixel(10.25, -6),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-pita/green-pita-04.png",
        priority = base_decorative_sprite_priority,
        width = 73,
        height = 47,
        shift = util.by_pixel(12.5, -9.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-pita/hr-green-pita-04.png",
          priority = base_decorative_sprite_priority,
          width = 144,
          height = 95,
          shift = util.by_pixel(12.5, -9.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-pita/green-pita-05.png",
        priority = base_decorative_sprite_priority,
        width = 70,
        height = 46,
        shift = util.by_pixel(9, -7),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-pita/hr-green-pita-05.png",
          priority = base_decorative_sprite_priority,
          width = 140,
          height = 92,
          shift = util.by_pixel(8.5, -7.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-pita/green-pita-06.png",
        priority = base_decorative_sprite_priority,
        width = 78,
        height = 60,
        shift = util.by_pixel(7, -7),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-pita/hr-green-pita-06.png",
          priority = base_decorative_sprite_priority,
          width = 156,
          height = 120,
          shift = util.by_pixel(7, -7),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-pita/green-pita-07.png",
        priority = base_decorative_sprite_priority,
        width = 78,
        height = 62,
        shift = util.by_pixel(10, -5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-pita/hr-green-pita-07.png",
          priority = base_decorative_sprite_priority,
          width = 155,
          height = 123,
          shift = util.by_pixel(10.25, -5.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-pita/green-pita-08.png",
        priority = base_decorative_sprite_priority,
        width = 81,
        height = 59,
        shift = util.by_pixel(11.5, -6.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-pita/hr-green-pita-08.png",
          priority = base_decorative_sprite_priority,
          width = 162,
          height = 116,
          shift = util.by_pixel(11.5, -6.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-pita/green-pita-09.png",
        priority = base_decorative_sprite_priority,
        width = 62,
        height = 39,
        shift = util.by_pixel(6, -4.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-pita/hr-green-pita-09.png",
          priority = base_decorative_sprite_priority,
          width = 123,
          height = 78,
          shift = util.by_pixel(6.25, -4.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-pita/green-pita-10.png",
        priority = base_decorative_sprite_priority,
        width = 50,
        height = 35,
        shift = util.by_pixel(4, -3.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-pita/hr-green-pita-10.png",
          priority = base_decorative_sprite_priority,
          width = 99,
          height = 70,
          shift = util.by_pixel(4.25, -4),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-pita/green-pita-11.png",
        priority = base_decorative_sprite_priority,
        width = 49,
        height = 33,
        shift = util.by_pixel(6.5, -2.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-pita/hr-green-pita-11.png",
          priority = base_decorative_sprite_priority,
          width = 98,
          height = 64,
          shift = util.by_pixel(6.5, -2.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-pita/green-pita-12.png",
        priority = base_decorative_sprite_priority,
        width = 49,
        height = 39,
        shift = util.by_pixel(6.5, -5.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-pita/hr-green-pita-12.png",
          priority = base_decorative_sprite_priority,
          width = 99,
          height = 77,
          shift = util.by_pixel(6.25, -5.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-pita/green-pita-13.png",
        priority = base_decorative_sprite_priority,
        width = 55,
        height = 36,
        shift = util.by_pixel(8.5, -4),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-pita/hr-green-pita-13.png",
          priority = base_decorative_sprite_priority,
          width = 109,
          height = 71,
          shift = util.by_pixel(8.25, -4.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-pita/green-pita-14.png",
        priority = base_decorative_sprite_priority,
        width = 50,
        height = 34,
        shift = util.by_pixel(7, -5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-pita/hr-green-pita-14.png",
          priority = base_decorative_sprite_priority,
          width = 100,
          height = 68,
          shift = util.by_pixel(6.5, -5),
          scale = 0.5
        }
      }
    }
  },

  {
    name = "red-pita",
    type = "optimized-decorative",
    order = "b[decorative]-c[pita]-a[red]",
    collision_box = {{-0.7, -0.7}, {0.7, 0.7}},
    render_layer = "object",
    walking_sound = sounds.plant,
    trigger_effect = decorative_trigger_effects.red_pita(),
    autoplace =
    {
      order = "a[doodad]-e[pita]",
      sharpness = 0.3,
      -- coverage = 0.2,
      max_probability = 0.5,
      random_probability_penalty = 0.2,
      peaks =
      {
        {
          influence = -0.5
        },
        {
          noise_layer = "fluff",
          noise_octaves_difference = -2,
          noise_persistence = 0.7
        },
        {
          aux_optimal = 1,
          aux_range = 0.2,
          aux_max_range = .3,
          water_optimal = 0.2,
          water_range = 0.1,
          water_max_range = 0.2
        }
      }
    },
    pictures =
    {
      --rpita
      {
        filename = "__base__/graphics/decorative/red-pita/red-pita-00.png",
        priority = base_decorative_sprite_priority,
        width = 76,
        height = 49,
        shift = util.by_pixel(10, -7.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/red-pita/hr-red-pita-00.png",
          priority = base_decorative_sprite_priority,
          width = 152,
          height = 98,
          shift = util.by_pixel(10.5, -7.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/red-pita/red-pita-01.png",
        priority = base_decorative_sprite_priority,
        width = 72,
        height = 55,
        shift = util.by_pixel(13, -6.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/red-pita/hr-red-pita-01.png",
          priority = base_decorative_sprite_priority,
          width = 146,
          height = 109,
          shift = util.by_pixel(13, -6.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/red-pita/red-pita-02.png",
        priority = base_decorative_sprite_priority,
        width = 60,
        height = 41,
        shift = util.by_pixel(11, -7.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/red-pita/hr-red-pita-02.png",
          priority = base_decorative_sprite_priority,
          width = 119,
          height = 82,
          shift = util.by_pixel(10.75, -7.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/red-pita/red-pita-03.png",
        priority = base_decorative_sprite_priority,
        width = 59,
        height = 42,
        shift = util.by_pixel(9.5, -5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/red-pita/hr-red-pita-03.png",
          priority = base_decorative_sprite_priority,
          width = 118,
          height = 84,
          shift = util.by_pixel(9.5, -5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/red-pita/red-pita-04.png",
        priority = base_decorative_sprite_priority,
        width = 74,
        height = 49,
        shift = util.by_pixel(14, -7.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/red-pita/hr-red-pita-04.png",
          priority = base_decorative_sprite_priority,
          width = 149,
          height = 99,
          shift = util.by_pixel(13.75, -7.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/red-pita/red-pita-05.png",
        priority = base_decorative_sprite_priority,
        width = 72,
        height = 47,
        shift = util.by_pixel(13, -8.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/red-pita/hr-red-pita-05.png",
          priority = base_decorative_sprite_priority,
          width = 142,
          height = 93,
          shift = util.by_pixel(13, -8.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/red-pita/red-pita-06.png",
        priority = base_decorative_sprite_priority,
        width = 89,
        height = 53,
        shift = util.by_pixel(8.5, -5.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/red-pita/hr-red-pita-06.png",
          priority = base_decorative_sprite_priority,
          width = 177,
          height = 106,
          shift = util.by_pixel(8.25, -5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/red-pita/red-pita-07.png",
        priority = base_decorative_sprite_priority,
        width = 84,
        height = 60,
        shift = util.by_pixel(10, -7),
        hr_version =
        {
          filename = "__base__/graphics/decorative/red-pita/hr-red-pita-07.png",
          priority = base_decorative_sprite_priority,
          width = 167,
          height = 120,
          shift = util.by_pixel(10.25, -6.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/red-pita/red-pita-08.png",
        priority = base_decorative_sprite_priority,
        width = 84,
        height = 64,
        shift = util.by_pixel(10, -6),
        hr_version =
        {
          filename = "__base__/graphics/decorative/red-pita/hr-red-pita-08.png",
          priority = base_decorative_sprite_priority,
          width = 168,
          height = 128,
          shift = util.by_pixel(10.5, -6),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/red-pita/red-pita-09.png",
        priority = base_decorative_sprite_priority,
        width = 60,
        height = 42,
        shift = util.by_pixel(4, -7),
        hr_version =
        {
          filename = "__base__/graphics/decorative/red-pita/hr-red-pita-09.png",
          priority = base_decorative_sprite_priority,
          width = 119,
          height = 85,
          shift = util.by_pixel(4.25, -7.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/red-pita/red-pita-10.png",
        priority = base_decorative_sprite_priority,
        width = 55,
        height = 34,
        shift = util.by_pixel(7.5, -3),
        hr_version =
        {
          filename = "__base__/graphics/decorative/red-pita/hr-red-pita-10.png",
          priority = base_decorative_sprite_priority,
          width = 109,
          height = 69,
          shift = util.by_pixel(7.25, -3.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/red-pita/red-pita-11.png",
        priority = base_decorative_sprite_priority,
        width = 47,
        height = 35,
        shift = util.by_pixel(5.5, -4.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/red-pita/hr-red-pita-11.png",
          priority = base_decorative_sprite_priority,
          width = 93,
          height = 70,
          shift = util.by_pixel(5.75, -4.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/red-pita/red-pita-12.png",
        priority = base_decorative_sprite_priority,
        width = 54,
        height = 38,
        shift = util.by_pixel(8, -5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/red-pita/hr-red-pita-12.png",
          priority = base_decorative_sprite_priority,
          width = 107,
          height = 74,
          shift = util.by_pixel(7.75, -5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/red-pita/red-pita-13.png",
        priority = base_decorative_sprite_priority,
        width = 57,
        height = 35,
        shift = util.by_pixel(11.5, -4.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/red-pita/hr-red-pita-13.png",
          priority = base_decorative_sprite_priority,
          width = 114,
          height = 70,
          shift = util.by_pixel(12, -4.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/red-pita/red-pita-14.png",
        priority = base_decorative_sprite_priority,
        width = 45,
        height = 36,
        shift = util.by_pixel(3.5, -7),
        hr_version =
        {
          filename = "__base__/graphics/decorative/red-pita/hr-red-pita-14.png",
          priority = base_decorative_sprite_priority,
          width = 89,
          height = 71,
          shift = util.by_pixel(3.75, -7.25),
          scale = 0.5
        }
      }
    }
  },

  {
    name = "green-croton",
    type = "optimized-decorative",
    order = "b[decorative]-d[croton]-a[green]",
    collision_box = {{-0.7, -0.7}, {0.7, 0.7}},
    render_layer = "decorative",
    walking_sound = sounds.plant,
    trigger_effect = decorative_trigger_effects.green_croton(),
    autoplace =
    {
      order = "a[doodad]-e[pita]",
      sharpness = 0.3,
      -- coverage = 0.2,
      max_probability = 0.5,
      random_probability_penalty = 0.2,
      peaks =
      {
        {
          influence = -0.25
        },
        {
          noise_layer = "fluff",
          noise_octaves_difference = -2,
          noise_persistence = 0.7
        },
        {
          aux_optimal = 1,
          aux_range = 0.2,
          aux_max_range = .3,
          water_optimal = 0.2,
          water_range = 0.1,
          water_max_range = 0.2
        }
      }
    },
    pictures =
    {
      --crotonG
      {
        filename = "__base__/graphics/decorative/green-croton/green-croton-00.png",
        priority = base_decorative_sprite_priority,
        width = 39,
        height = 28,
        shift = util.by_pixel(4.5, -3),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-croton/hr-green-croton-00.png",
          priority = base_decorative_sprite_priority,
          width = 77,
          height = 54,
          shift = util.by_pixel(4.25, -3),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-croton/green-croton-01.png",
        priority = base_decorative_sprite_priority,
        width = 39,
        height = 25,
        shift = util.by_pixel(5.5, -3.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-croton/hr-green-croton-01.png",
          priority = base_decorative_sprite_priority,
          width = 78,
          height = 52,
          shift = util.by_pixel(6, -3.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-croton/green-croton-02.png",
        priority = base_decorative_sprite_priority,
        width = 36,
        height = 27,
        shift = util.by_pixel(7, -4.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-croton/hr-green-croton-02.png",
          priority = base_decorative_sprite_priority,
          width = 71,
          height = 54,
          shift = util.by_pixel(6.75, -4.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-croton/green-croton-03.png",
        priority = base_decorative_sprite_priority,
        width = 35,
        height = 28,
        shift = util.by_pixel(3.5, -4),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-croton/hr-green-croton-03.png",
          priority = base_decorative_sprite_priority,
          width = 70,
          height = 56,
          shift = util.by_pixel(4, -4),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-croton/green-croton-04.png",
        priority = base_decorative_sprite_priority,
        width = 37,
        height = 27,
        shift = util.by_pixel(5.5, -5.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-croton/hr-green-croton-04.png",
          priority = base_decorative_sprite_priority,
          width = 74,
          height = 54,
          shift = util.by_pixel(5.5, -5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-croton/green-croton-05.png",
        priority = base_decorative_sprite_priority,
        width = 35,
        height = 26,
        shift = util.by_pixel(7.5, -5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-croton/hr-green-croton-05.png",
          priority = base_decorative_sprite_priority,
          width = 71,
          height = 53,
          shift = util.by_pixel(7.75, -4.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-croton/green-croton-06.png",
        priority = base_decorative_sprite_priority,
        width = 35,
        height = 24,
        shift = util.by_pixel(4.5, -4),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-croton/hr-green-croton-06.png",
          priority = base_decorative_sprite_priority,
          width = 71,
          height = 49,
          shift = util.by_pixel(4.25, -3.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-croton/green-croton-07.png",
        priority = base_decorative_sprite_priority,
        width = 33,
        height = 21,
        shift = util.by_pixel(4.5, -2.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-croton/hr-green-croton-07.png",
          priority = base_decorative_sprite_priority,
          width = 65,
          height = 42,
          shift = util.by_pixel(4.75, -2.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-croton/green-croton-08.png",
        priority = base_decorative_sprite_priority,
        width = 36,
        height = 27,
        shift = util.by_pixel(6, -3.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-croton/hr-green-croton-08.png",
          priority = base_decorative_sprite_priority,
          width = 70,
          height = 56,
          shift = util.by_pixel(6, -3.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-croton/green-croton-09.png",
        priority = base_decorative_sprite_priority,
        width = 33,
        height = 24,
        shift = util.by_pixel(4.5, -4),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-croton/hr-green-croton-09.png",
          priority = base_decorative_sprite_priority,
          width = 65,
          height = 48,
          shift = util.by_pixel(4.25, -3.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-croton/green-croton-10.png",
        priority = base_decorative_sprite_priority,
        width = 27,
        height = 21,
        shift = util.by_pixel(4.5, -3.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-croton/hr-green-croton-10.png",
          priority = base_decorative_sprite_priority,
          width = 53,
          height = 42,
          shift = util.by_pixel(4.25, -3.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-croton/green-croton-11.png",
        priority = base_decorative_sprite_priority,
        width = 25,
        height = 16,
        shift = util.by_pixel(3.5, -2),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-croton/hr-green-croton-11.png",
          priority = base_decorative_sprite_priority,
          width = 49,
          height = 33,
          shift = util.by_pixel(3.75, -2.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-croton/green-croton-12.png",
        priority = base_decorative_sprite_priority,
        width = 30,
        height = 24,
        shift = util.by_pixel(7, -4),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-croton/hr-green-croton-12.png",
          priority = base_decorative_sprite_priority,
          width = 59,
          height = 48,
          shift = util.by_pixel(6.75, -4.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-croton/green-croton-13.png",
        priority = base_decorative_sprite_priority,
        width = 25,
        height = 18,
        shift = util.by_pixel(4.5, -3),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-croton/hr-green-croton-13.png",
          priority = base_decorative_sprite_priority,
          width = 49,
          height = 35,
          shift = util.by_pixel(4.75, -3.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-croton/green-croton-14.png",
        priority = base_decorative_sprite_priority,
        width = 30,
        height = 21,
        shift = util.by_pixel(4, -4.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-croton/hr-green-croton-14.png",
          priority = base_decorative_sprite_priority,
          width = 59,
          height = 41,
          shift = util.by_pixel(3.75, -4.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-croton/green-croton-15.png",
        priority = base_decorative_sprite_priority,
        width = 25,
        height = 18,
        shift = util.by_pixel(4.5, -3),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-croton/hr-green-croton-15.png",
          priority = base_decorative_sprite_priority,
          width = 50,
          height = 35,
          shift = util.by_pixel(4.5, -2.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-croton/green-croton-16.png",
        priority = base_decorative_sprite_priority,
        width = 32,
        height = 21,
        shift = util.by_pixel(5, -2.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-croton/hr-green-croton-16.png",
          priority = base_decorative_sprite_priority,
          width = 64,
          height = 42,
          shift = util.by_pixel(5, -2.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-croton/green-croton-17.png",
        priority = base_decorative_sprite_priority,
        width = 21,
        height = 16,
        shift = util.by_pixel(3.5, -2),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-croton/hr-green-croton-17.png",
          priority = base_decorative_sprite_priority,
          width = 43,
          height = 31,
          shift = util.by_pixel(3.75, -2.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-croton/green-croton-18.png",
        priority = base_decorative_sprite_priority,
        width = 21,
        height = 16,
        shift = util.by_pixel(5.5, -4),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-croton/hr-green-croton-18.png",
          priority = base_decorative_sprite_priority,
          width = 43,
          height = 32,
          shift = util.by_pixel(5.25, -3.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-croton/green-croton-19.png",
        priority = base_decorative_sprite_priority,
        width = 18,
        height = 14,
        shift = util.by_pixel(3, -2),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-croton/hr-green-croton-19.png",
          priority = base_decorative_sprite_priority,
          width = 36,
          height = 30,
          shift = util.by_pixel(3, -2),
          scale = 0.5
        }
      }
    }
  },

  {
    name = "red-croton",
    type = "optimized-decorative",
    order = "b[decorative]-d[croton]-a[red]",
    collision_box = {{-0.7, -0.7}, {0.7, 0.7}},
    render_layer = "decorative",
    walking_sound = sounds.plant,
    trigger_effect = decorative_trigger_effects.red_croton(),
    autoplace =
    {
      order = "a[doodad]-e[pita]",
      sharpness = 0.3,
      coverage = 0.2,
      max_probability = 0.5,
      random_probability_penalty = 0.2,
      peaks =
      {
        {
          noise_layer = "fluff",
          noise_octaves_difference = -2,
          noise_persistence = 0.7
        },
        {
          aux_optimal = 1,
          aux_range = 0.2,
          aux_max_range = .3,
          water_optimal = 0.2,
          water_range = 0.1,
          water_max_range = 0.2
        }
      }
    },
    pictures =
    {
      --crotonR
      {
        filename = "__base__/graphics/decorative/red-croton/red-croton-00.png",
        priority = base_decorative_sprite_priority,
        width = 38,
        height = 28,
        shift = util.by_pixel(7, -5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/red-croton/hr-red-croton-00.png",
          priority = base_decorative_sprite_priority,
          width = 76,
          height = 55,
          shift = util.by_pixel(7, -5.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/red-croton/red-croton-01.png",
        priority = base_decorative_sprite_priority,
        width = 38,
        height = 28,
        shift = util.by_pixel(7, -5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/red-croton/hr-red-croton-01.png",
          priority = base_decorative_sprite_priority,
          width = 76,
          height = 57,
          shift = util.by_pixel(7, -5.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/red-croton/red-croton-02.png",
        priority = base_decorative_sprite_priority,
        width = 41,
        height = 27,
        shift = util.by_pixel(7.5, -5.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/red-croton/hr-red-croton-02.png",
          priority = base_decorative_sprite_priority,
          width = 81,
          height = 55,
          shift = util.by_pixel(7.75, -5.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/red-croton/red-croton-03.png",
        priority = base_decorative_sprite_priority,
        width = 37,
        height = 29,
        shift = util.by_pixel(7.5, -6.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/red-croton/hr-red-croton-03.png",
          priority = base_decorative_sprite_priority,
          width = 75,
          height = 59,
          shift = util.by_pixel(7.75, -6.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/red-croton/red-croton-04.png",
        priority = base_decorative_sprite_priority,
        width = 35,
        height = 28,
        shift = util.by_pixel(5.5, -5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/red-croton/hr-red-croton-04.png",
          priority = base_decorative_sprite_priority,
          width = 69,
          height = 56,
          shift = util.by_pixel(5.75, -5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/red-croton/red-croton-05.png",
        priority = base_decorative_sprite_priority,
        width = 33,
        height = 25,
        shift = util.by_pixel(5.5, -4.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/red-croton/hr-red-croton-05.png",
          priority = base_decorative_sprite_priority,
          width = 66,
          height = 49,
          shift = util.by_pixel(6, -4.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/red-croton/red-croton-06.png",
        priority = base_decorative_sprite_priority,
        width = 40,
        height = 27,
        shift = util.by_pixel(7, -4.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/red-croton/hr-red-croton-06.png",
          priority = base_decorative_sprite_priority,
          width = 80,
          height = 54,
          shift = util.by_pixel(7, -5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/red-croton/red-croton-07.png",
        priority = base_decorative_sprite_priority,
        width = 28,
        height = 25,
        shift = util.by_pixel(6, -5.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/red-croton/hr-red-croton-07.png",
          priority = base_decorative_sprite_priority,
          width = 55,
          height = 48,
          shift = util.by_pixel(6.25, -5.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/red-croton/red-croton-08.png",
        priority = base_decorative_sprite_priority,
        width = 41,
        height = 28,
        shift = util.by_pixel(9.5, -6),
        hr_version =
        {
          filename = "__base__/graphics/decorative/red-croton/hr-red-croton-08.png",
          priority = base_decorative_sprite_priority,
          width = 82,
          height = 57,
          shift = util.by_pixel(10, -6.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/red-croton/red-croton-09.png",
        priority = base_decorative_sprite_priority,
        width = 39,
        height = 28,
        shift = util.by_pixel(8.5, -6),
        hr_version =
        {
          filename = "__base__/graphics/decorative/red-croton/hr-red-croton-09.png",
          priority = base_decorative_sprite_priority,
          width = 77,
          height = 55,
          shift = util.by_pixel(8.25, -6.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/red-croton/red-croton-10.png",
        priority = base_decorative_sprite_priority,
        width = 38,
        height = 25,
        shift = util.by_pixel(9, -6.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/red-croton/hr-red-croton-10.png",
          priority = base_decorative_sprite_priority,
          width = 77,
          height = 52,
          shift = util.by_pixel(8.75, -6.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/red-croton/red-croton-11.png",
        priority = base_decorative_sprite_priority,
        width = 30,
        height = 21,
        shift = util.by_pixel(8, -4.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/red-croton/hr-red-croton-11.png",
          priority = base_decorative_sprite_priority,
          width = 60,
          height = 41,
          shift = util.by_pixel(7.5, -4.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/red-croton/red-croton-12.png",
        priority = base_decorative_sprite_priority,
        width = 32,
        height = 27,
        shift = util.by_pixel(7, -5.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/red-croton/hr-red-croton-12.png",
          priority = base_decorative_sprite_priority,
          width = 63,
          height = 53,
          shift = util.by_pixel(6.75, -5.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/red-croton/red-croton-13.png",
        priority = base_decorative_sprite_priority,
        width = 29,
        height = 18,
        shift = util.by_pixel(6.5, -4),
        hr_version =
        {
          filename = "__base__/graphics/decorative/red-croton/hr-red-croton-13.png",
          priority = base_decorative_sprite_priority,
          width = 57,
          height = 37,
          shift = util.by_pixel(6.25, -4.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/red-croton/red-croton-14.png",
        priority = base_decorative_sprite_priority,
        width = 35,
        height = 26,
        shift = util.by_pixel(6.5, -5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/red-croton/hr-red-croton-14.png",
          priority = base_decorative_sprite_priority,
          width = 70,
          height = 50,
          shift = util.by_pixel(6.5, -5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/red-croton/red-croton-15.png",
        priority = base_decorative_sprite_priority,
        width = 28,
        height = 19,
        shift = util.by_pixel(6, -4.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/red-croton/hr-red-croton-15.png",
          priority = base_decorative_sprite_priority,
          width = 56,
          height = 38,
          shift = util.by_pixel(5.5, -4),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/red-croton/red-croton-16.png",
        priority = base_decorative_sprite_priority,
        width = 40,
        height = 24,
        shift = util.by_pixel(9, -5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/red-croton/hr-red-croton-16.png",
          priority = base_decorative_sprite_priority,
          width = 80,
          height = 48,
          shift = util.by_pixel(9, -4.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/red-croton/red-croton-17.png",
        priority = base_decorative_sprite_priority,
        width = 27,
        height = 22,
        shift = util.by_pixel(5.5, -5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/red-croton/hr-red-croton-17.png",
          priority = base_decorative_sprite_priority,
          width = 55,
          height = 43,
          shift = util.by_pixel(5.75, -4.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/red-croton/red-croton-18.png",
        priority = base_decorative_sprite_priority,
        width = 28,
        height = 19,
        shift = util.by_pixel(6, -3.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/red-croton/hr-red-croton-18.png",
          priority = base_decorative_sprite_priority,
          width = 56,
          height = 38,
          shift = util.by_pixel(6, -3.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/red-croton/red-croton-19.png",
        priority = base_decorative_sprite_priority,
        width = 22,
        height = 17,
        shift = util.by_pixel(4, -3.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/red-croton/hr-red-croton-19.png",
          priority = base_decorative_sprite_priority,
          width = 43,
          height = 33,
          shift = util.by_pixel(4.25, -3.75),
          scale = 0.5
        }
      }
    }
  },

  {
    name = "green-pita-mini",
    type = "optimized-decorative",
    order = "b[decorative]-d[pita-mini]-a[green]",
    collision_box = {{-0.7, -0.7}, {0.7, 0.7}},
    render_layer = "decorative",
    walking_sound = sounds.plant,
    trigger_effect = decorative_trigger_effects.green_pita_mini(),
    autoplace =
    {
      order = "a[doodad]-e[pita]",
      sharpness = 0.3,
      coverage = 0.2,
      max_probability = 0.5,
      random_probability_penalty = 0.2,
      peaks =
      {
        {
          noise_layer = "fluff",
          noise_octaves_difference = -2,
          noise_persistence = 0.7
        },
        {
          aux_optimal = 1,
          aux_range = 0.2,
          aux_max_range = .3,
          water_optimal = 0.2,
          water_range = 0.1,
          water_max_range = 0.2
        }
      }
    },
    pictures =
    {
      --pitaMini
      {
        filename = "__base__/graphics/decorative/green-pita-mini/green-pita-mini-00.png",
        priority = base_decorative_sprite_priority,
        width = 42,
        height = 26,
        shift = util.by_pixel(4, -2),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-pita-mini/hr-green-pita-mini-00.png",
          priority = base_decorative_sprite_priority,
          width = 83,
          height = 52,
          shift = util.by_pixel(4.25, -2),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-pita-mini/green-pita-mini-01.png",
        priority = base_decorative_sprite_priority,
        width = 37,
        height = 28,
        shift = util.by_pixel(4.5, -4),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-pita-mini/hr-green-pita-mini-01.png",
          priority = base_decorative_sprite_priority,
          width = 75,
          height = 57,
          shift = util.by_pixel(4.75, -3.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-pita-mini/green-pita-mini-02.png",
        priority = base_decorative_sprite_priority,
        width = 44,
        height = 29,
        shift = util.by_pixel(5, -3.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-pita-mini/hr-green-pita-mini-02.png",
          priority = base_decorative_sprite_priority,
          width = 87,
          height = 57,
          shift = util.by_pixel(4.75, -3.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-pita-mini/green-pita-mini-03.png",
        priority = base_decorative_sprite_priority,
        width = 48,
        height = 31,
        shift = util.by_pixel(6, -3.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-pita-mini/hr-green-pita-mini-03.png",
          priority = base_decorative_sprite_priority,
          width = 96,
          height = 62,
          shift = util.by_pixel(6, -3.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-pita-mini/green-pita-mini-04.png",
        priority = base_decorative_sprite_priority,
        width = 44,
        height = 35,
        shift = util.by_pixel(4, -4.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-pita-mini/hr-green-pita-mini-04.png",
          priority = base_decorative_sprite_priority,
          width = 87,
          height = 68,
          shift = util.by_pixel(3.75, -4.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-pita-mini/green-pita-mini-05.png",
        priority = base_decorative_sprite_priority,
        width = 46,
        height = 33,
        shift = util.by_pixel(5, -3.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-pita-mini/hr-green-pita-mini-05.png",
          priority = base_decorative_sprite_priority,
          width = 92,
          height = 65,
          shift = util.by_pixel(5.5, -3.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-pita-mini/green-pita-mini-06.png",
        priority = base_decorative_sprite_priority,
        width = 31,
        height = 22,
        shift = util.by_pixel(3.5, -1),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-pita-mini/hr-green-pita-mini-06.png",
          priority = base_decorative_sprite_priority,
          width = 64,
          height = 45,
          shift = util.by_pixel(3.5, -0.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-pita-mini/green-pita-mini-07.png",
        priority = base_decorative_sprite_priority,
        width = 36,
        height = 20,
        shift = util.by_pixel(4, -4),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-pita-mini/hr-green-pita-mini-07.png",
          priority = base_decorative_sprite_priority,
          width = 73,
          height = 39,
          shift = util.by_pixel(3.75, -3.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-pita-mini/green-pita-mini-08.png",
        priority = base_decorative_sprite_priority,
        width = 33,
        height = 23,
        shift = util.by_pixel(5.5, -3.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-pita-mini/hr-green-pita-mini-08.png",
          priority = base_decorative_sprite_priority,
          width = 66,
          height = 46,
          shift = util.by_pixel(5.5, -3.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-pita-mini/green-pita-mini-09.png",
        priority = base_decorative_sprite_priority,
        width = 49,
        height = 37,
        shift = util.by_pixel(5.5, -3.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-pita-mini/hr-green-pita-mini-09.png",
          priority = base_decorative_sprite_priority,
          width = 97,
          height = 72,
          shift = util.by_pixel(5.75, -3.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-pita-mini/green-pita-mini-10.png",
        priority = base_decorative_sprite_priority,
        width = 51,
        height = 35,
        shift = util.by_pixel(4.5, -4.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-pita-mini/hr-green-pita-mini-10.png",
          priority = base_decorative_sprite_priority,
          width = 101,
          height = 71,
          shift = util.by_pixel(4.75, -4.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-pita-mini/green-pita-mini-11.png",
        priority = base_decorative_sprite_priority,
        width = 49,
        height = 36,
        shift = util.by_pixel(5.5, -4),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-pita-mini/hr-green-pita-mini-11.png",
          priority = base_decorative_sprite_priority,
          width = 98,
          height = 71,
          shift = util.by_pixel(5.5, -3.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-pita-mini/green-pita-mini-12.png",
        priority = base_decorative_sprite_priority,
        width = 45,
        height = 31,
        shift = util.by_pixel(6.5, -3.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-pita-mini/hr-green-pita-mini-12.png",
          priority = base_decorative_sprite_priority,
          width = 90,
          height = 63,
          shift = util.by_pixel(6.5, -3.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-pita-mini/green-pita-mini-13.png",
        priority = base_decorative_sprite_priority,
        width = 42,
        height = 31,
        shift = util.by_pixel(4, -4.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-pita-mini/hr-green-pita-mini-13.png",
          priority = base_decorative_sprite_priority,
          width = 84,
          height = 64,
          shift = util.by_pixel(4.5, -4.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-pita-mini/green-pita-mini-14.png",
        priority = base_decorative_sprite_priority,
        width = 39,
        height = 29,
        shift = util.by_pixel(2.5, -2.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-pita-mini/hr-green-pita-mini-14.png",
          priority = base_decorative_sprite_priority,
          width = 79,
          height = 58,
          shift = util.by_pixel(2.75, -3),
          scale = 0.5
        }
      }
    }
  },

  {
    name = "brown-fluff",
    type = "optimized-decorative",
    order = "b[decorative]-g[fluff]-a[normal]-a[brown]",
    collision_box = {{-0.5, -0.5}, {0.5, 0.5}},
    walking_sound = sounds.big_bush,
    trigger_effect = decorative_trigger_effects.brown_fluff(),
    autoplace =
    {
      order = "a[doodad]-e[garballo]",
      sharpness = 1,
      max_probability = 1,
      random_probability_penalty = 0.4,
      coverage = 0.01,
      peaks = autoplace_utils.peaks({{{35, 1}, {25, 0.3}}},
      {
        {
          influence = 0.5,
          noise_layer = "garballo",
          noise_octaves_difference = -2,
          noise_persistence = 0.7
        }
      })
    },
    pictures =
    {
      --fluff
      {
        filename = "__base__/graphics/decorative/brown-fluff/brown-fluff-00.png",
        priority = base_decorative_sprite_priority,
        width = 28,
        height = 19,
        frame_count = 1,
        shift = util.by_pixel(3, -1.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/brown-fluff/hr-brown-fluff-00.png",
          priority = base_decorative_sprite_priority,
          width = 56,
          height = 39,
          frame_count = 1,
          shift = util.by_pixel(3, -1.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/brown-fluff/brown-fluff-01.png",
        priority = base_decorative_sprite_priority,
        width = 29,
        height = 25,
        frame_count = 1,
        shift = util.by_pixel(2.5, 0.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/brown-fluff/hr-brown-fluff-01.png",
          priority = base_decorative_sprite_priority,
          width = 59,
          height = 50,
          frame_count = 1,
          shift = util.by_pixel(2.75, 0),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/brown-fluff/brown-fluff-02.png",
        priority = base_decorative_sprite_priority,
        width = 32,
        height = 21,
        frame_count = 1,
        shift = util.by_pixel(0, -1.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/brown-fluff/hr-brown-fluff-02.png",
          priority = base_decorative_sprite_priority,
          width = 65,
          height = 41,
          frame_count = 1,
          shift = util.by_pixel(-0.25, -1.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/brown-fluff/brown-fluff-03.png",
        priority = base_decorative_sprite_priority,
        width = 31,
        height = 24,
        frame_count = 1,
        shift = util.by_pixel(2.5, -2),
        hr_version =
        {
          filename = "__base__/graphics/decorative/brown-fluff/hr-brown-fluff-03.png",
          priority = base_decorative_sprite_priority,
          width = 63,
          height = 47,
          frame_count = 1,
          shift = util.by_pixel(2.25, -1.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/brown-fluff/brown-fluff-04.png",
        priority = base_decorative_sprite_priority,
        width = 36,
        height = 21,
        frame_count = 1,
        shift = util.by_pixel(3, -2.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/brown-fluff/hr-brown-fluff-04.png",
          priority = base_decorative_sprite_priority,
          width = 70,
          height = 43,
          frame_count = 1,
          shift = util.by_pixel(3, -2.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/brown-fluff/brown-fluff-05.png",
        priority = base_decorative_sprite_priority,
        width = 28,
        height = 23,
        frame_count = 1,
        shift = util.by_pixel(2, -1.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/brown-fluff/hr-brown-fluff-05.png",
          priority = base_decorative_sprite_priority,
          width = 57,
          height = 47,
          frame_count = 1,
          shift = util.by_pixel(2.25, -1.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/brown-fluff/brown-fluff-06.png",
        priority = base_decorative_sprite_priority,
        width = 31,
        height = 23,
        frame_count = 1,
        shift = util.by_pixel(2.5, -2.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/brown-fluff/hr-brown-fluff-06.png",
          priority = base_decorative_sprite_priority,
          width = 62,
          height = 47,
          frame_count = 1,
          shift = util.by_pixel(2.5, -2.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/brown-fluff/brown-fluff-07.png",
        priority = base_decorative_sprite_priority,
        width = 40,
        height = 23,
        frame_count = 1,
        shift = util.by_pixel(0, -3.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/brown-fluff/hr-brown-fluff-07.png",
          priority = base_decorative_sprite_priority,
          width = 81,
          height = 45,
          frame_count = 1,
          shift = util.by_pixel(-0.25, -3.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/brown-fluff/brown-fluff-08.png",
        priority = base_decorative_sprite_priority,
        width = 29,
        height = 24,
        frame_count = 1,
        shift = util.by_pixel(3.5, 0),
        hr_version =
        {
          filename = "__base__/graphics/decorative/brown-fluff/hr-brown-fluff-08.png",
          priority = base_decorative_sprite_priority,
          width = 58,
          height = 49,
          frame_count = 1,
          shift = util.by_pixel(3.5, 0.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/brown-fluff/brown-fluff-09.png",
        priority = base_decorative_sprite_priority,
        width = 36,
        height = 24,
        frame_count = 1,
        shift = util.by_pixel(0, 0),
        hr_version =
        {
          filename = "__base__/graphics/decorative/brown-fluff/hr-brown-fluff-09.png",
          priority = base_decorative_sprite_priority,
          width = 71,
          height = 48,
          frame_count = 1,
          shift = util.by_pixel(-0.25, 0.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/brown-fluff/brown-fluff-10.png",
        priority = base_decorative_sprite_priority,
        width = 33,
        height = 28,
        frame_count = 1,
        shift = util.by_pixel(0.5, -1),
        hr_version =
        {
          filename = "__base__/graphics/decorative/brown-fluff/hr-brown-fluff-10.png",
          priority = base_decorative_sprite_priority,
          width = 67,
          height = 57,
          frame_count = 1,
          shift = util.by_pixel(0.75, -1.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/brown-fluff/brown-fluff-11.png",
        priority = base_decorative_sprite_priority,
        width = 29,
        height = 19,
        frame_count = 1,
        shift = util.by_pixel(2.5, -1.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/brown-fluff/hr-brown-fluff-11.png",
          priority = base_decorative_sprite_priority,
          width = 59,
          height = 39,
          frame_count = 1,
          shift = util.by_pixel(2.25, -1.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/brown-fluff/brown-fluff-12.png",
        priority = base_decorative_sprite_priority,
        width = 34,
        height = 25,
        frame_count = 1,
        shift = util.by_pixel(3, 0.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/brown-fluff/hr-brown-fluff-12.png",
          priority = base_decorative_sprite_priority,
          width = 66,
          height = 51,
          frame_count = 1,
          shift = util.by_pixel(3, 0.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/brown-fluff/brown-fluff-13.png",
        priority = base_decorative_sprite_priority,
        width = 26,
        height = 20,
        frame_count = 1,
        shift = util.by_pixel(2, 0),
        hr_version =
        {
          filename = "__base__/graphics/decorative/brown-fluff/hr-brown-fluff-13.png",
          priority = base_decorative_sprite_priority,
          width = 53,
          height = 40,
          frame_count = 1,
          shift = util.by_pixel(1.75, 0),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/brown-fluff/brown-fluff-14.png",
        priority = base_decorative_sprite_priority,
        width = 28,
        height = 16,
        frame_count = 1,
        shift = util.by_pixel(0, -2),
        hr_version =
        {
          filename = "__base__/graphics/decorative/brown-fluff/hr-brown-fluff-14.png",
          priority = base_decorative_sprite_priority,
          width = 56,
          height = 32,
          frame_count = 1,
          shift = util.by_pixel(0, -2),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/brown-fluff/brown-fluff-15.png",
        priority = base_decorative_sprite_priority,
        width = 26,
        height = 19,
        frame_count = 1,
        shift = util.by_pixel(2, -1.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/brown-fluff/hr-brown-fluff-15.png",
          priority = base_decorative_sprite_priority,
          width = 52,
          height = 39,
          frame_count = 1,
          shift = util.by_pixel(2, -1.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/brown-fluff/brown-fluff-16.png",
        priority = base_decorative_sprite_priority,
        width = 28,
        height = 19,
        frame_count = 1,
        shift = util.by_pixel(3, -1.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/brown-fluff/hr-brown-fluff-16.png",
          priority = base_decorative_sprite_priority,
          width = 56,
          height = 39,
          frame_count = 1,
          shift = util.by_pixel(3, -1.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/brown-fluff/brown-fluff-17.png",
        priority = base_decorative_sprite_priority,
        width = 28,
        height = 19,
        frame_count = 1,
        shift = util.by_pixel(3, -2.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/brown-fluff/hr-brown-fluff-17.png",
          priority = base_decorative_sprite_priority,
          width = 56,
          height = 39,
          frame_count = 1,
          shift = util.by_pixel(3, -2.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/brown-fluff/brown-fluff-18.png",
        priority = base_decorative_sprite_priority,
        width = 28,
        height = 19,
        frame_count = 1,
        shift = util.by_pixel(3, -2.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/brown-fluff/hr-brown-fluff-18.png",
          priority = base_decorative_sprite_priority,
          width = 56,
          height = 39,
          frame_count = 1,
          shift = util.by_pixel(3, -2.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/brown-fluff/brown-fluff-19.png",
        priority = base_decorative_sprite_priority,
        width = 28,
        height = 19,
        frame_count = 1,
        shift = util.by_pixel(3, -2.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/brown-fluff/hr-brown-fluff-19.png",
          priority = base_decorative_sprite_priority,
          width = 56,
          height = 39,
          frame_count = 1,
          shift = util.by_pixel(3, -2.25),
          scale = 0.5
        }
      }
    }
  },
  {
    name = "brown-fluff-dry",
    type = "optimized-decorative",
    order = "b[decorative]-g[fluff]-b[dry]-a[brown]",
    collision_box = {{-0.5, -0.5}, {0.5, 0.5}},
    walking_sound = sounds.big_bush,
    trigger_effect = decorative_trigger_effects.brown_fluff_dry(),
    autoplace =
    {
      order = "a[doodad]-e[garballo]",
      sharpness = 1,
      max_probability = 1,
      random_probability_penalty = 0.4,
      -- coverage = 0.01,
      peaks = autoplace_utils.peaks({{{35, 2/8}, {25, 1/8}}},
      {
        {
          influence = -0.5
        },
        {
          influence = 0.75,
          noise_layer = "garballo",
          noise_octaves_difference = -2,
          noise_persistence = 0.7
        }
      })
    },
    pictures =
    {
      --dryFluff
      {
        filename = "__base__/graphics/decorative/brown-fluff-dry/brown-fluff-dry-00.png",
        priority = base_decorative_sprite_priority,
        width = 34,
        height = 22,
        frame_count = 1,
        shift = util.by_pixel(3, -2),
        hr_version =
        {
          filename = "__base__/graphics/decorative/brown-fluff-dry/hr-brown-fluff-dry-00.png",
          priority = base_decorative_sprite_priority,
          width = 67,
          height = 44,
          frame_count = 1,
          shift = util.by_pixel(3.25, -2),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/brown-fluff-dry/brown-fluff-dry-01.png",
        priority = base_decorative_sprite_priority,
        width = 38,
        height = 29,
        frame_count = 1,
        shift = util.by_pixel(3, -1.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/brown-fluff-dry/hr-brown-fluff-dry-01.png",
          priority = base_decorative_sprite_priority,
          width = 76,
          height = 58,
          frame_count = 1,
          shift = util.by_pixel(3, -1),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/brown-fluff-dry/brown-fluff-dry-02.png",
        priority = base_decorative_sprite_priority,
        width = 37,
        height = 22,
        frame_count = 1,
        shift = util.by_pixel(1.5, -2),
        hr_version =
        {
          filename = "__base__/graphics/decorative/brown-fluff-dry/hr-brown-fluff-dry-02.png",
          priority = base_decorative_sprite_priority,
          width = 75,
          height = 44,
          frame_count = 1,
          shift = util.by_pixel(1.75, -1.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/brown-fluff-dry/brown-fluff-dry-03.png",
        priority = base_decorative_sprite_priority,
        width = 33,
        height = 27,
        frame_count = 1,
        shift = util.by_pixel(2.5, -1.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/brown-fluff-dry/hr-brown-fluff-dry-03.png",
          priority = base_decorative_sprite_priority,
          width = 65,
          height = 54,
          frame_count = 1,
          shift = util.by_pixel(2.25, -1.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/brown-fluff-dry/brown-fluff-dry-04.png",
        priority = base_decorative_sprite_priority,
        width = 44,
        height = 27,
        frame_count = 1,
        shift = util.by_pixel(4, -3.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/brown-fluff-dry/hr-brown-fluff-dry-04.png",
          priority = base_decorative_sprite_priority,
          width = 88,
          height = 55,
          frame_count = 1,
          shift = util.by_pixel(4, -3.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/brown-fluff-dry/brown-fluff-dry-05.png",
        priority = base_decorative_sprite_priority,
        width = 31,
        height = 24,
        frame_count = 1,
        shift = util.by_pixel(2.5, -1),
        hr_version =
        {
          filename = "__base__/graphics/decorative/brown-fluff-dry/hr-brown-fluff-dry-05.png",
          priority = base_decorative_sprite_priority,
          width = 63,
          height = 49,
          frame_count = 1,
          shift = util.by_pixel(2.25, -0.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/brown-fluff-dry/brown-fluff-dry-06.png",
        priority = base_decorative_sprite_priority,
        width = 37,
        height = 25,
        frame_count = 1,
        shift = util.by_pixel(3.5, -2.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/brown-fluff-dry/hr-brown-fluff-dry-06.png",
          priority = base_decorative_sprite_priority,
          width = 74,
          height = 50,
          frame_count = 1,
          shift = util.by_pixel(3.5, -2.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/brown-fluff-dry/brown-fluff-dry-07.png",
        priority = base_decorative_sprite_priority,
        width = 45,
        height = 27,
        frame_count = 1,
        shift = util.by_pixel(-1.5, -3.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/brown-fluff-dry/hr-brown-fluff-dry-07.png",
          priority = base_decorative_sprite_priority,
          width = 89,
          height = 53,
          frame_count = 1,
          shift = util.by_pixel(-1.75, -3.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/brown-fluff-dry/brown-fluff-dry-08.png",
        priority = base_decorative_sprite_priority,
        width = 35,
        height = 29,
        frame_count = 1,
        shift = util.by_pixel(1.5, -1.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/brown-fluff-dry/hr-brown-fluff-dry-08.png",
          priority = base_decorative_sprite_priority,
          width = 70,
          height = 58,
          frame_count = 1,
          shift = util.by_pixel(1.5, -1.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/brown-fluff-dry/brown-fluff-dry-09.png",
        priority = base_decorative_sprite_priority,
        width = 42,
        height = 27,
        frame_count = 1,
        shift = util.by_pixel(1, -0.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/brown-fluff-dry/hr-brown-fluff-dry-09.png",
          priority = base_decorative_sprite_priority,
          width = 83,
          height = 53,
          frame_count = 1,
          shift = util.by_pixel(1.25, -0.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/brown-fluff-dry/brown-fluff-dry-10.png",
        priority = base_decorative_sprite_priority,
        width = 38,
        height = 30,
        frame_count = 1,
        shift = util.by_pixel(3, -2),
        hr_version =
        {
          filename = "__base__/graphics/decorative/brown-fluff-dry/hr-brown-fluff-dry-10.png",
          priority = base_decorative_sprite_priority,
          width = 76,
          height = 61,
          frame_count = 1,
          shift = util.by_pixel(2.5, -2.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/brown-fluff-dry/brown-fluff-dry-11.png",
        priority = base_decorative_sprite_priority,
        width = 35,
        height = 25,
        frame_count = 1,
        shift = util.by_pixel(1.5, -1.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/brown-fluff-dry/hr-brown-fluff-dry-11.png",
          priority = base_decorative_sprite_priority,
          width = 71,
          height = 50,
          frame_count = 1,
          shift = util.by_pixel(1.75, -2),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/brown-fluff-dry/brown-fluff-dry-12.png",
        priority = base_decorative_sprite_priority,
        width = 40,
        height = 29,
        frame_count = 1,
        shift = util.by_pixel(4, -0.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/brown-fluff-dry/hr-brown-fluff-dry-12.png",
          priority = base_decorative_sprite_priority,
          width = 79,
          height = 57,
          frame_count = 1,
          shift = util.by_pixel(3.75, -0.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/brown-fluff-dry/brown-fluff-dry-13.png",
        priority = base_decorative_sprite_priority,
        width = 30,
        height = 25,
        frame_count = 1,
        shift = util.by_pixel(1, -1.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/brown-fluff-dry/hr-brown-fluff-dry-13.png",
          priority = base_decorative_sprite_priority,
          width = 60,
          height = 50,
          frame_count = 1,
          shift = util.by_pixel(0.5, -1.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/brown-fluff-dry/brown-fluff-dry-14.png",
        priority = base_decorative_sprite_priority,
        width = 33,
        height = 19,
        frame_count = 1,
        shift = util.by_pixel(0.5, -2.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/brown-fluff-dry/hr-brown-fluff-dry-14.png",
          priority = base_decorative_sprite_priority,
          width = 65,
          height = 38,
          frame_count = 1,
          shift = util.by_pixel(0.75, -2.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/brown-fluff-dry/brown-fluff-dry-15.png",
        priority = base_decorative_sprite_priority,
        width = 33,
        height = 26,
        frame_count = 1,
        shift = util.by_pixel(1.5, -1),
        hr_version =
        {
          filename = "__base__/graphics/decorative/brown-fluff-dry/hr-brown-fluff-dry-15.png",
          priority = base_decorative_sprite_priority,
          width = 65,
          height = 51,
          frame_count = 1,
          shift = util.by_pixel(1.25, -1.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/brown-fluff-dry/brown-fluff-dry-16.png",
        priority = base_decorative_sprite_priority,
        width = 26,
        height = 20,
        frame_count = 1,
        shift = util.by_pixel(1, -1),
        hr_version =
        {
          filename = "__base__/graphics/decorative/brown-fluff-dry/hr-brown-fluff-dry-16.png",
          priority = base_decorative_sprite_priority,
          width = 51,
          height = 39,
          frame_count = 1,
          shift = util.by_pixel(1.25, -1.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/brown-fluff-dry/brown-fluff-dry-17.png",
        priority = base_decorative_sprite_priority,
        width = 24,
        height = 19,
        frame_count = 1,
        shift = util.by_pixel(2, -0.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/brown-fluff-dry/hr-brown-fluff-dry-17.png",
          priority = base_decorative_sprite_priority,
          width = 49,
          height = 38,
          frame_count = 1,
          shift = util.by_pixel(1.75, -1),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/brown-fluff-dry/brown-fluff-dry-18.png",
        priority = base_decorative_sprite_priority,
        width = 26,
        height = 17,
        frame_count = 1,
        shift = util.by_pixel(1, -1.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/brown-fluff-dry/hr-brown-fluff-dry-18.png",
          priority = base_decorative_sprite_priority,
          width = 53,
          height = 35,
          frame_count = 1,
          shift = util.by_pixel(1.25, -1.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/brown-fluff-dry/brown-fluff-dry-19.png",
        priority = base_decorative_sprite_priority,
        width = 23,
        height = 17,
        frame_count = 1,
        shift = util.by_pixel(0.5, -1.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/brown-fluff-dry/hr-brown-fluff-dry-19.png",
          priority = base_decorative_sprite_priority,
          width = 46,
          height = 33,
          frame_count = 1,
          shift = util.by_pixel(1, -1.25),
          scale = 0.5
        }
      }
    }
  },
  {
    name = "garballo",
    type = "optimized-decorative",
    order = "b[decorative]-i[garballo]-a[normal]",
    collision_box = {{-0.5, -0.5}, {0.5, 0.5}},
    render_layer = "object",
    walking_sound = sounds.plant,
    trigger_effect = decorative_trigger_effects.garballo(),
    autoplace =
    {
      order = "a[doodad]-e[garballo]",
      sharpness = 1,
      max_probability = 1,
      random_probability_penalty = 0.4,
      coverage = 0.01,
      peaks = autoplace_utils.peaks({{{30, 0.5}, {20, 0.3}}},
      {
        {
          influence = 0.5,
          noise_layer = "garballo",
          noise_octaves_difference = -2,
          noise_persistence = 0.7
        }
      })
    },
    pictures =
    {
      --garballo
      {
        filename = "__base__/graphics/decorative/garballo/garballo-00.png",
        priority = base_decorative_sprite_priority,
        width = 30,
        height = 23,
        shift = util.by_pixel(10, -6.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/garballo/hr-garballo-00.png",
          priority = base_decorative_sprite_priority,
          width = 59,
          height = 45,
          shift = util.by_pixel(10.25, -6.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/garballo/garballo-01.png",
        priority = base_decorative_sprite_priority,
        width = 27,
        height = 24,
        shift = util.by_pixel(-1.5, -8),
        hr_version =
        {
          filename = "__base__/graphics/decorative/garballo/hr-garballo-01.png",
          priority = base_decorative_sprite_priority,
          width = 55,
          height = 49,
          shift = util.by_pixel(-1.25, -8.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/garballo/garballo-02.png",
        priority = base_decorative_sprite_priority,
        width = 26,
        height = 24,
        shift = util.by_pixel(7, -4),
        hr_version =
        {
          filename = "__base__/graphics/decorative/garballo/hr-garballo-02.png",
          priority = base_decorative_sprite_priority,
          width = 54,
          height = 48,
          shift = util.by_pixel(7, -4),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/garballo/garballo-03.png",
        priority = base_decorative_sprite_priority,
        width = 38,
        height = 24,
        shift = util.by_pixel(3, -6),
        hr_version =
        {
          filename = "__base__/graphics/decorative/garballo/hr-garballo-03.png",
          priority = base_decorative_sprite_priority,
          width = 76,
          height = 49,
          shift = util.by_pixel(2.5, -5.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/garballo/garballo-04.png",
        priority = base_decorative_sprite_priority,
        width = 32,
        height = 24,
        shift = util.by_pixel(3, -4),
        hr_version =
        {
          filename = "__base__/graphics/decorative/garballo/hr-garballo-04.png",
          priority = base_decorative_sprite_priority,
          width = 64,
          height = 47,
          shift = util.by_pixel(3, -4.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/garballo/garballo-05.png",
        priority = base_decorative_sprite_priority,
        width = 30,
        height = 26,
        shift = util.by_pixel(0, -4),
        hr_version =
        {
          filename = "__base__/graphics/decorative/garballo/hr-garballo-05.png",
          priority = base_decorative_sprite_priority,
          width = 61,
          height = 52,
          shift = util.by_pixel(0.25, -4),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/garballo/garballo-06.png",
        priority = base_decorative_sprite_priority,
        width = 31,
        height = 31,
        shift = util.by_pixel(2.5, -9.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/garballo/hr-garballo-06.png",
          priority = base_decorative_sprite_priority,
          width = 60,
          height = 63,
          shift = util.by_pixel(2.5, -9.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/garballo/garballo-07.png",
        priority = base_decorative_sprite_priority,
        width = 34,
        height = 27,
        shift = util.by_pixel(11, -6.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/garballo/hr-garballo-07.png",
          priority = base_decorative_sprite_priority,
          width = 69,
          height = 54,
          shift = util.by_pixel(10.75, -6.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/garballo/garballo-08.png",
        priority = base_decorative_sprite_priority,
        width = 31,
        height = 30,
        shift = util.by_pixel(1.5, -10),
        hr_version =
        {
          filename = "__base__/graphics/decorative/garballo/hr-garballo-08.png",
          priority = base_decorative_sprite_priority,
          width = 61,
          height = 60,
          shift = util.by_pixel(1.75, -10),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/garballo/garballo-09.png",
        priority = base_decorative_sprite_priority,
        width = 32,
        height = 28,
        shift = util.by_pixel(3, -6),
        hr_version =
        {
          filename = "__base__/graphics/decorative/garballo/hr-garballo-09.png",
          priority = base_decorative_sprite_priority,
          width = 64,
          height = 57,
          shift = util.by_pixel(3, -5.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/garballo/garballo-10.png",
        priority = base_decorative_sprite_priority,
        width = 43,
        height = 33,
        shift = util.by_pixel(6.5, -6.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/garballo/hr-garballo-10.png",
          priority = base_decorative_sprite_priority,
          width = 87,
          height = 65,
          shift = util.by_pixel(6.25, -6.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/garballo/garballo-11.png",
        priority = base_decorative_sprite_priority,
        width = 43,
        height = 29,
        shift = util.by_pixel(4.5, -2.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/garballo/hr-garballo-11.png",
          priority = base_decorative_sprite_priority,
          width = 85,
          height = 58,
          shift = util.by_pixel(4.75, -3),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/garballo/garballo-12.png",
        priority = base_decorative_sprite_priority,
        width = 34,
        height = 33,
        shift = util.by_pixel(2, -4.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/garballo/hr-garballo-12.png",
          priority = base_decorative_sprite_priority,
          width = 69,
          height = 65,
          shift = util.by_pixel(1.75, -4.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/garballo/garballo-13.png",
        priority = base_decorative_sprite_priority,
        width = 25,
        height = 22,
        shift = util.by_pixel(8.5, -4),
        hr_version =
        {
          filename = "__base__/graphics/decorative/garballo/hr-garballo-13.png",
          priority = base_decorative_sprite_priority,
          width = 49,
          height = 45,
          shift = util.by_pixel(8.75, -3.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/garballo/garballo-14.png",
        priority = base_decorative_sprite_priority,
        width = 24,
        height = 24,
        shift = util.by_pixel(0, -6),
        hr_version =
        {
          filename = "__base__/graphics/decorative/garballo/hr-garballo-14.png",
          priority = base_decorative_sprite_priority,
          width = 48,
          height = 48,
          shift = util.by_pixel(0, -6),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/garballo/garballo-15.png",
        priority = base_decorative_sprite_priority,
        width = 36,
        height = 26,
        shift = util.by_pixel(10, -8),
        hr_version =
        {
          filename = "__base__/graphics/decorative/garballo/hr-garballo-15.png",
          priority = base_decorative_sprite_priority,
          width = 72,
          height = 54,
          shift = util.by_pixel(10, -8),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/garballo/garballo-16.png",
        priority = base_decorative_sprite_priority,
        width = 39,
        height = 28,
        shift = util.by_pixel(0.5, -5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/garballo/hr-garballo-16.png",
          priority = base_decorative_sprite_priority,
          width = 79,
          height = 56,
          shift = util.by_pixel(0.25, -5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/garballo/garballo-17.png",
        priority = base_decorative_sprite_priority,
        width = 35,
        height = 30,
        shift = util.by_pixel(9.5, -10),
        hr_version =
        {
          filename = "__base__/graphics/decorative/garballo/hr-garballo-17.png",
          priority = base_decorative_sprite_priority,
          width = 69,
          height = 58,
          shift = util.by_pixel(9.75, -10),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/garballo/garballo-18.png",
        priority = base_decorative_sprite_priority,
        width = 19,
        height = 17,
        shift = util.by_pixel(1.5, -3.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/garballo/hr-garballo-18.png",
          priority = base_decorative_sprite_priority,
          width = 39,
          height = 33,
          shift = util.by_pixel(1.25, -3.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/garballo/garballo-19.png",
        priority = base_decorative_sprite_priority,
        width = 16,
        height = 18,
        shift = util.by_pixel(1, -4),
        hr_version =
        {
          filename = "__base__/graphics/decorative/garballo/hr-garballo-19.png",
          priority = base_decorative_sprite_priority,
          width = 33,
          height = 35,
          shift = util.by_pixel(1.25, -4.25),
          scale = 0.5
        }
      }
    }
  },
  {
    name = "garballo-mini-dry",
    type = "optimized-decorative",
    order = "b[decorative]-i[garballo]-a[mini-dry]",
    collision_box = {{-0.5, -0.5}, {0.5, 0.5}},
    render_layer = "object",
    trigger_effect = decorative_trigger_effects.garballo_mini_dry(),
    autoplace =
    {
      order = "a[doodad]-e[garballo]",
      sharpness = 1,
      max_probability = 1,
      random_probability_penalty = 0.4,
      coverage = 0.01,
      peaks = autoplace_utils.peaks({{{30, 0.4}, {20, 0.25}}},
      {
        {
          influence = 0.5,
          noise_layer = "garballo",
          noise_octaves_difference = -2,
          noise_persistence = 0.7
        }
      })
    },
    pictures =
    {
      --garballodry
      {
        filename = "__base__/graphics/decorative/garballo-mini-dry/garballo-mini-dry-00.png",
        priority = base_decorative_sprite_priority,
        width = 28,
        height = 20,
        shift = util.by_pixel(11, -5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/garballo-mini-dry/hr-garballo-mini-dry-00.png",
          priority = base_decorative_sprite_priority,
          width = 57,
          height = 38,
          shift = util.by_pixel(10.75, -5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/garballo-mini-dry/garballo-mini-dry-01.png",
        priority = base_decorative_sprite_priority,
        width = 21,
        height = 19,
        shift = util.by_pixel(1.5, -5.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/garballo-mini-dry/hr-garballo-mini-dry-01.png",
          priority = base_decorative_sprite_priority,
          width = 43,
          height = 39,
          shift = util.by_pixel(1.75, -5.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/garballo-mini-dry/garballo-mini-dry-02.png",
        priority = base_decorative_sprite_priority,
        width = 29,
        height = 22,
        shift = util.by_pixel(5.5, -3),
        hr_version =
        {
          filename = "__base__/graphics/decorative/garballo-mini-dry/hr-garballo-mini-dry-02.png",
          priority = base_decorative_sprite_priority,
          width = 59,
          height = 45,
          shift = util.by_pixel(5.75, -3.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/garballo-mini-dry/garballo-mini-dry-03.png",
        priority = base_decorative_sprite_priority,
        width = 34,
        height = 22,
        shift = util.by_pixel(5, -5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/garballo-mini-dry/hr-garballo-mini-dry-03.png",
          priority = base_decorative_sprite_priority,
          width = 68,
          height = 44,
          shift = util.by_pixel(4.5, -4.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/garballo-mini-dry/garballo-mini-dry-04.png",
        priority = base_decorative_sprite_priority,
        width = 28,
        height = 20,
        shift = util.by_pixel(5, -2),
        hr_version =
        {
          filename = "__base__/graphics/decorative/garballo-mini-dry/hr-garballo-mini-dry-04.png",
          priority = base_decorative_sprite_priority,
          width = 55,
          height = 38,
          shift = util.by_pixel(5.25, -2),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/garballo-mini-dry/garballo-mini-dry-05.png",
        priority = base_decorative_sprite_priority,
        width = 25,
        height = 26,
        shift = util.by_pixel(2.5, -4),
        hr_version =
        {
          filename = "__base__/graphics/decorative/garballo-mini-dry/hr-garballo-mini-dry-05.png",
          priority = base_decorative_sprite_priority,
          width = 51,
          height = 51,
          shift = util.by_pixel(2.75, -3.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/garballo-mini-dry/garballo-mini-dry-06.png",
        priority = base_decorative_sprite_priority,
        width = 28,
        height = 20,
        shift = util.by_pixel(4, -4),
        hr_version =
        {
          filename = "__base__/graphics/decorative/garballo-mini-dry/hr-garballo-mini-dry-06.png",
          priority = base_decorative_sprite_priority,
          width = 56,
          height = 41,
          shift = util.by_pixel(3.5, -4.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/garballo-mini-dry/garballo-mini-dry-07.png",
        priority = base_decorative_sprite_priority,
        width = 40,
        height = 23,
        shift = util.by_pixel(8, -4.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/garballo-mini-dry/hr-garballo-mini-dry-07.png",
          priority = base_decorative_sprite_priority,
          width = 81,
          height = 45,
          shift = util.by_pixel(7.75, -4.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/garballo-mini-dry/garballo-mini-dry-08.png",
        priority = base_decorative_sprite_priority,
        width = 29,
        height = 22,
        shift = util.by_pixel(2.5, -6),
        hr_version =
        {
          filename = "__base__/graphics/decorative/garballo-mini-dry/hr-garballo-mini-dry-08.png",
          priority = base_decorative_sprite_priority,
          width = 59,
          height = 45,
          shift = util.by_pixel(2.25, -6.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/garballo-mini-dry/garballo-mini-dry-09.png",
        priority = base_decorative_sprite_priority,
        width = 34,
        height = 25,
        shift = util.by_pixel(2, -4.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/garballo-mini-dry/hr-garballo-mini-dry-09.png",
          priority = base_decorative_sprite_priority,
          width = 69,
          height = 50,
          shift = util.by_pixel(1.75, -4),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/garballo-mini-dry/garballo-mini-dry-10.png",
        priority = base_decorative_sprite_priority,
        width = 43,
        height = 27,
        shift = util.by_pixel(6.5, -3.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/garballo-mini-dry/hr-garballo-mini-dry-10.png",
          priority = base_decorative_sprite_priority,
          width = 85,
          height = 53,
          shift = util.by_pixel(6.75, -3.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/garballo-mini-dry/garballo-mini-dry-11.png",
        priority = base_decorative_sprite_priority,
        width = 37,
        height = 28,
        shift = util.by_pixel(7.5, -2),
        hr_version =
        {
          filename = "__base__/graphics/decorative/garballo-mini-dry/hr-garballo-mini-dry-11.png",
          priority = base_decorative_sprite_priority,
          width = 74,
          height = 56,
          shift = util.by_pixel(7.5, -2.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/garballo-mini-dry/garballo-mini-dry-12.png",
        priority = base_decorative_sprite_priority,
        width = 31,
        height = 28,
        shift = util.by_pixel(3.5, -2),
        hr_version =
        {
          filename = "__base__/graphics/decorative/garballo-mini-dry/hr-garballo-mini-dry-12.png",
          priority = base_decorative_sprite_priority,
          width = 63,
          height = 56,
          shift = util.by_pixel(3.25, -2),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/garballo-mini-dry/garballo-mini-dry-13.png",
        priority = base_decorative_sprite_priority,
        width = 27,
        height = 26,
        shift = util.by_pixel(7.5, -6),
        hr_version =
        {
          filename = "__base__/graphics/decorative/garballo-mini-dry/hr-garballo-mini-dry-13.png",
          priority = base_decorative_sprite_priority,
          width = 55,
          height = 53,
          shift = util.by_pixel(7.25, -5.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/garballo-mini-dry/garballo-mini-dry-14.png",
        priority = base_decorative_sprite_priority,
        width = 23,
        height = 22,
        shift = util.by_pixel(0.5, -5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/garballo-mini-dry/hr-garballo-mini-dry-14.png",
          priority = base_decorative_sprite_priority,
          width = 47,
          height = 43,
          shift = util.by_pixel(0.25, -4.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/garballo-mini-dry/garballo-mini-dry-15.png",
        priority = base_decorative_sprite_priority,
        width = 38,
        height = 14,
        shift = util.by_pixel(9, -2),
        hr_version =
        {
          filename = "__base__/graphics/decorative/garballo-mini-dry/hr-garballo-mini-dry-15.png",
          priority = base_decorative_sprite_priority,
          width = 75,
          height = 30,
          shift = util.by_pixel(9.25, -2),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/garballo-mini-dry/garballo-mini-dry-16.png",
        priority = base_decorative_sprite_priority,
        width = 32,
        height = 22,
        shift = util.by_pixel(4, -2),
        hr_version =
        {
          filename = "__base__/graphics/decorative/garballo-mini-dry/hr-garballo-mini-dry-16.png",
          priority = base_decorative_sprite_priority,
          width = 64,
          height = 44,
          shift = util.by_pixel(4, -2),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/garballo-mini-dry/garballo-mini-dry-17.png",
        priority = base_decorative_sprite_priority,
        width = 36,
        height = 17,
        shift = util.by_pixel(9, -3.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/garballo-mini-dry/hr-garballo-mini-dry-17.png",
          priority = base_decorative_sprite_priority,
          width = 72,
          height = 33,
          shift = util.by_pixel(9, -3.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/garballo-mini-dry/garballo-mini-dry-18.png",
        priority = base_decorative_sprite_priority,
        width = 19,
        height = 15,
        shift = util.by_pixel(1.5, -2.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/garballo-mini-dry/hr-garballo-mini-dry-18.png",
          priority = base_decorative_sprite_priority,
          width = 38,
          height = 30,
          shift = util.by_pixel(1.5, -3),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/garballo-mini-dry/garballo-mini-dry-19.png",
        priority = base_decorative_sprite_priority,
        width = 15,
        height = 14,
        shift = util.by_pixel(1.5, -2),
        hr_version =
        {
          filename = "__base__/graphics/decorative/garballo-mini-dry/hr-garballo-mini-dry-19.png",
          priority = base_decorative_sprite_priority,
          width = 31,
          height = 26,
          shift = util.by_pixel(1.75, -2),
          scale = 0.5
        }
      }
    }
  },
  lichen("lichen-decal", {r = 221 / 255, g = 219 / 255, b = 81 / 255}),
  {
    name = "worms-decal",
    type = "optimized-decorative",
    order = "b[decorative]-j[bush]-a[mini]-a[green]",
    collision_box = {{-3.1, -2.5}, {3.1, 2.5}},
    pictures =
    {
      {
        filename = "__base__/graphics/decorative/worms-decal/worms-decal-00.png",
        priority = base_decorative_sprite_priority,
        width = 212,
        height = 104,
        shift = util.by_pixel(-10, -12),
        hr_version =
        {
          filename = "__base__/graphics/decorative/worms-decal/hr-worms-decal-00.png",
          priority = base_decorative_sprite_priority,
          width = 426,
          height = 206,
          shift = util.by_pixel(-11, -12),
          scale = 0.5,
        }
      },
      {
        filename = "__base__/graphics/decorative/worms-decal/worms-decal-01.png",
        priority = base_decorative_sprite_priority,
        width = 200,
        height = 110,
        shift = util.by_pixel(-6, -16),
        hr_version =
        {
          filename = "__base__/graphics/decorative/worms-decal/hr-worms-decal-01.png",
          priority = base_decorative_sprite_priority,
          width = 400,
          height = 216,
          shift = util.by_pixel(-6, -15),
          scale = 0.5,
        }
      },
      {
        filename = "__base__/graphics/decorative/worms-decal/worms-decal-02.png",
        priority = base_decorative_sprite_priority,
        width = 202,
        height = 110,
        shift = util.by_pixel(2, 0),
        hr_version =
        {
          filename = "__base__/graphics/decorative/worms-decal/hr-worms-decal-02.png",
          priority = base_decorative_sprite_priority,
          width = 436,
          height = 232,
          shift = util.by_pixel(10, 5),
          scale = 0.5,
        }
      },
      {
        filename = "__base__/graphics/decorative/worms-decal/worms-decal-03.png",
        priority = base_decorative_sprite_priority,
        width = 220,
        height = 96,
        shift = util.by_pixel(2, 0),
        hr_version =
        {
          filename = "__base__/graphics/decorative/worms-decal/hr-worms-decal-03.png",
          priority = base_decorative_sprite_priority,
          width = 472,
          height = 236,
          shift = util.by_pixel(10, -11),
          scale = 0.5,
        }
      },
      {
        filename = "__base__/graphics/decorative/worms-decal/worms-decal-04.png",
        priority = base_decorative_sprite_priority,
        width = 194,
        height = 122,
        shift = util.by_pixel(8, 0),
        hr_version =
        {
          filename = "__base__/graphics/decorative/worms-decal/hr-worms-decal-04.png",
          priority = base_decorative_sprite_priority,
          width = 392,
          height = 244,
          shift = util.by_pixel(7, 0),
          scale = 0.5,
        }
      },
      {
        filename = "__base__/graphics/decorative/worms-decal/worms-decal-05.png",
        priority = base_decorative_sprite_priority,
        width = 190,
        height = 80,
        shift = util.by_pixel(0, 14),
        hr_version =
        {
          filename = "__base__/graphics/decorative/worms-decal/hr-worms-decal-05.png",
          priority = base_decorative_sprite_priority,
          width = 378,
          height = 158,
          shift = util.by_pixel(0, 14),
          scale = 0.5,
        }
      },
      {
        filename = "__base__/graphics/decorative/worms-decal/worms-decal-06.png",
        priority = base_decorative_sprite_priority,
        width = 190,
        height = 114,
        shift = util.by_pixel(18, -2),
        hr_version =
        {
          filename = "__base__/graphics/decorative/worms-decal/hr-worms-decal-06.png",
          priority = base_decorative_sprite_priority,
          width = 444,
          height = 226,
          shift = util.by_pixel(2, -2),
          scale = 0.5,
        }
      },
      {
        filename = "__base__/graphics/decorative/worms-decal/worms-decal-07.png",
        priority = base_decorative_sprite_priority,
        width = 188,
        height = 90,
        shift = util.by_pixel(14, -4),
        hr_version =
        {
          filename = "__base__/graphics/decorative/worms-decal/hr-worms-decal-07.png",
          priority = base_decorative_sprite_priority,
          width = 376,
          height = 178,
          shift = util.by_pixel(14, -4),
          scale = 0.5,
        }
      },
      {
        filename = "__base__/graphics/decorative/worms-decal/worms-decal-08.png",
        priority = base_decorative_sprite_priority,
        width = 198,
        height = 96,
        shift = util.by_pixel(18, -10),
        hr_version =
        {
          filename = "__base__/graphics/decorative/worms-decal/hr-worms-decal-08.png",
          priority = base_decorative_sprite_priority,
          width = 398,
          height = 190,
          shift = util.by_pixel(17, -10),
          scale = 0.5,
        }
      },
      {
        filename = "__base__/graphics/decorative/worms-decal/worms-decal-09.png",
        priority = base_decorative_sprite_priority,
        width = 210,
        height = 102,
        shift = util.by_pixel(2, -10),
        hr_version =
        {
          filename = "__base__/graphics/decorative/worms-decal/hr-worms-decal-09.png",
          priority = base_decorative_sprite_priority,
          width = 414,
          height = 206,
          shift = util.by_pixel(3, -11),
          scale = 0.5,
        }
      },
      {
        filename = "__base__/graphics/decorative/worms-decal/worms-decal-10.png",
        priority = base_decorative_sprite_priority,
        width = 210,
        height = 116,
        shift = util.by_pixel(-2, -2),
        hr_version =
        {
          filename = "__base__/graphics/decorative/worms-decal/hr-worms-decal-10.png",
          priority = base_decorative_sprite_priority,
          width = 416,
          height = 226,
          shift = util.by_pixel(-1, -1),
          scale = 0.5,
        }
      },
      {
        filename = "__base__/graphics/decorative/worms-decal/worms-decal-11.png",
        priority = base_decorative_sprite_priority,
        width = 184,
        height = 118,
        shift = util.by_pixel(-4, -6),
        hr_version =
        {
          filename = "__base__/graphics/decorative/worms-decal/hr-worms-decal-11.png",
          priority = base_decorative_sprite_priority,
          width = 368,
          height = 232,
          shift = util.by_pixel(-4, -5),
          scale = 0.5,
        }
      },
      {
        filename = "__base__/graphics/decorative/worms-decal/worms-decal-12.png",
        priority = base_decorative_sprite_priority,
        width = 208,
        height = 108,
        shift = util.by_pixel(14, -2),
        hr_version =
        {
          filename = "__base__/graphics/decorative/worms-decal/hr-worms-decal-12.png",
          priority = base_decorative_sprite_priority,
          width = 416,
          height = 214,
          shift = util.by_pixel(14, -2),
          scale = 0.5,
        }
      },
      {
        filename = "__base__/graphics/decorative/worms-decal/worms-decal-13.png",
        priority = base_decorative_sprite_priority,
        width = 186,
        height = 104,
        shift = util.by_pixel(14, -2),
        hr_version =
        {
          filename = "__base__/graphics/decorative/worms-decal/hr-worms-decal-13.png",
          priority = base_decorative_sprite_priority,
          width = 368,
          height = 208,
          shift = util.by_pixel(15, -2),
          scale = 0.5,
        }
      },
      {
        filename = "__base__/graphics/decorative/worms-decal/worms-decal-14.png",
        priority = base_decorative_sprite_priority,
        width = 122,
        height = 60,
        shift = util.by_pixel(30, 4),
        hr_version =
        {
          filename = "__base__/graphics/decorative/worms-decal/hr-worms-decal-14.png",
          priority = base_decorative_sprite_priority,
          width = 246,
          height = 122,
          shift = util.by_pixel(29, 3),
          scale = 0.5,
        }
      },
      {
        filename = "__base__/graphics/decorative/worms-decal/worms-decal-15.png",
        priority = base_decorative_sprite_priority,
        width = 202,
        height = 100,
        shift = util.by_pixel(-4, -8),
        hr_version =
        {
          filename = "__base__/graphics/decorative/worms-decal/hr-worms-decal-15.png",
          priority = base_decorative_sprite_priority,
          width = 404,
          height = 198,
          shift = util.by_pixel(-4, -8),
          scale = 0.5,
        }
      }
    }
  },
  shroom_decal("shroom-decal", {r = 225 / 255, g = 171 / 255, b = 141 / 255}),
  {
    name = "green-bush-mini",
    type = "optimized-decorative",
    order = "b[decorative]-j[bush]-a[mini]-a[green]",
    collision_box = {{-0.5, -0.5}, {0.5, 0.5}},
    walking_sound = sounds.plant,
    trigger_effect = decorative_trigger_effects.green_bush_mini(),
    autoplace =
    {
      order = "a[doodad]-e[garballo]",
      sharpness = 1,
      max_probability = 1,
      random_probability_penalty = 0.4,
      coverage = 0.01,
      peaks = autoplace_utils.peaks({{{35, 1}, {20, 0.4}}},
      {
        {
          influence = 0.5,
          noise_layer = "garballo",
          noise_octaves_difference = -2,
          noise_persistence = 0.7
        }
      })
    },
    pictures =
    {
      --gBushMini
      {
        filename = "__base__/graphics/decorative/green-bush-mini/green-bush-mini-00.png",
        priority = base_decorative_sprite_priority,
        width = 31,
        height = 22,
        shift = util.by_pixel(2.5, 1),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-bush-mini/hr-green-bush-mini-00.png",
          priority = base_decorative_sprite_priority,
          width = 62,
          height = 45,
          shift = util.by_pixel(3.5, 1.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-bush-mini/green-bush-mini-01.png",
        priority = base_decorative_sprite_priority,
        width = 37,
        height = 23,
        shift = util.by_pixel(3.5, -1.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-bush-mini/hr-green-bush-mini-01.png",
          priority = base_decorative_sprite_priority,
          width = 73,
          height = 46,
          shift = util.by_pixel(4.25, -1),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-bush-mini/green-bush-mini-02.png",
        priority = base_decorative_sprite_priority,
        width = 29,
        height = 18,
        shift = util.by_pixel(2.5, -2),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-bush-mini/hr-green-bush-mini-02.png",
          priority = base_decorative_sprite_priority,
          width = 58,
          height = 38,
          shift = util.by_pixel(3, -1.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-bush-mini/green-bush-mini-03.png",
        priority = base_decorative_sprite_priority,
        width = 31,
        height = 25,
        shift = util.by_pixel(-0.5, 0.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-bush-mini/hr-green-bush-mini-03.png",
          priority = base_decorative_sprite_priority,
          width = 61,
          height = 51,
          shift = util.by_pixel(0.25, 1.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-bush-mini/green-bush-mini-04.png",
        priority = base_decorative_sprite_priority,
        width = 28,
        height = 22,
        shift = util.by_pixel(2, -3),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-bush-mini/hr-green-bush-mini-04.png",
          priority = base_decorative_sprite_priority,
          width = 55,
          height = 44,
          shift = util.by_pixel(2.75, -3),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-bush-mini/green-bush-mini-05.png",
        priority = base_decorative_sprite_priority,
        width = 29,
        height = 21,
        shift = util.by_pixel(-1.5, -2.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-bush-mini/hr-green-bush-mini-05.png",
          priority = base_decorative_sprite_priority,
          width = 57,
          height = 42,
          shift = util.by_pixel(-0.75, -1.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-bush-mini/green-bush-mini-06.png",
        priority = base_decorative_sprite_priority,
        width = 32,
        height = 21,
        shift = util.by_pixel(4, -2.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-bush-mini/hr-green-bush-mini-06.png",
          priority = base_decorative_sprite_priority,
          width = 64,
          height = 43,
          shift = util.by_pixel(4.5, -1.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-bush-mini/green-bush-mini-07.png",
        priority = base_decorative_sprite_priority,
        width = 32,
        height = 24,
        shift = util.by_pixel(1, -4),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-bush-mini/hr-green-bush-mini-07.png",
          priority = base_decorative_sprite_priority,
          width = 64,
          height = 49,
          shift = util.by_pixel(1.5, -3.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-bush-mini/green-bush-mini-08.png",
        priority = base_decorative_sprite_priority,
        width = 27,
        height = 18,
        shift = util.by_pixel(-1.5, -1),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-bush-mini/hr-green-bush-mini-08.png",
          priority = base_decorative_sprite_priority,
          width = 53,
          height = 36,
          shift = util.by_pixel(-0.75, -0.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-bush-mini/green-bush-mini-09.png",
        priority = base_decorative_sprite_priority,
        width = 24,
        height = 16,
        shift = util.by_pixel(3, -3),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-bush-mini/hr-green-bush-mini-09.png",
          priority = base_decorative_sprite_priority,
          width = 47,
          height = 33,
          shift = util.by_pixel(3.75, -2.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-bush-mini/green-bush-mini-10.png",
        priority = base_decorative_sprite_priority,
        width = 19,
        height = 16,
        shift = util.by_pixel(-0.5, -3),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-bush-mini/hr-green-bush-mini-10.png",
          priority = base_decorative_sprite_priority,
          width = 39,
          height = 31,
          shift = util.by_pixel(0.25, -2.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-bush-mini/green-bush-mini-11.png",
        priority = base_decorative_sprite_priority,
        width = 21,
        height = 13,
        shift = util.by_pixel(0.5, -0.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-bush-mini/hr-green-bush-mini-11.png",
          priority = base_decorative_sprite_priority,
          width = 41,
          height = 25,
          shift = util.by_pixel(0.75, -0.25),
          scale = 0.5
        }
      }
    }
  },
  {
    name = "green-hairy-grass",
    type = "optimized-decorative",
    order = "b[decorative]-a[grass]-a[hairy]",
    collision_box = {{-1, -1}, {1, 1}},
    grows_through_rail_path = true,
    walking_sound = sounds.hairy_grass,
    trigger_effect = decorative_trigger_effects.green_hairy_grass(),
    autoplace =
    {
      order = "a[doodad]-f[grass]-b",
      sharpness = 0.2,
      max_probability = 0.1, -- was 0.01
      coverage = 0.0, -- was 0.1
      peaks = autoplace_utils.peaks(grass_peaks,
      {
        {
          influence = 0.3,
          noise_layer = "grass2",
          noise_octaves_difference = -2.8,
          noise_persistence = 0.7
        }
      })
    },
    pictures =
    {
      --hairyGreen
      {
        filename = "__base__/graphics/decorative/green-hairy-grass/green-hairy-grass-13.png",
        priority = base_decorative_sprite_priority,
        width = 40,
        height = 26,
        shift = util.by_pixel(4, -4),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-hairy-grass/hr-green-hairy-grass-13.png",
          priority = base_decorative_sprite_priority,
          width = 79,
          height = 52,
          shift = util.by_pixel(4.25, -4),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-hairy-grass/green-hairy-grass-14.png",
        priority = base_decorative_sprite_priority,
        width = 40,
        height = 21,
        shift = util.by_pixel(6, -3.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-hairy-grass/hr-green-hairy-grass-14.png",
          priority = base_decorative_sprite_priority,
          width = 80,
          height = 41,
          shift = util.by_pixel(6.5, -3.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-hairy-grass/green-hairy-grass-15.png",
        priority = base_decorative_sprite_priority,
        width = 37,
        height = 34,
        shift = util.by_pixel(3.5, -4),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-hairy-grass/hr-green-hairy-grass-15.png",
          priority = base_decorative_sprite_priority,
          width = 72,
          height = 68,
          shift = util.by_pixel(3.5, -4.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-hairy-grass/green-hairy-grass-16.png",
        priority = base_decorative_sprite_priority,
        width = 36,
        height = 19,
        shift = util.by_pixel(2, -3.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-hairy-grass/hr-green-hairy-grass-16.png",
          priority = base_decorative_sprite_priority,
          width = 73,
          height = 39,
          shift = util.by_pixel(1.75, -3.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-hairy-grass/green-hairy-grass-17.png",
        priority = base_decorative_sprite_priority,
        width = 29,
        height = 23,
        shift = util.by_pixel(4.5, -3.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-hairy-grass/hr-green-hairy-grass-17.png",
          priority = base_decorative_sprite_priority,
          width = 59,
          height = 47,
          shift = util.by_pixel(4.25, -3.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-hairy-grass/green-hairy-grass-18.png",
        priority = base_decorative_sprite_priority,
        width = 24,
        height = 14,
        shift = util.by_pixel(6, -4),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-hairy-grass/hr-green-hairy-grass-18.png",
          priority = base_decorative_sprite_priority,
          width = 49,
          height = 29,
          shift = util.by_pixel(5.75, -3.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-hairy-grass/green-hairy-grass-19.png",
        priority = base_decorative_sprite_priority,
        width = 45,
        height = 24,
        shift = util.by_pixel(6.5, -2),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-hairy-grass/hr-green-hairy-grass-19.png",
          priority = base_decorative_sprite_priority,
          width = 91,
          height = 48,
          shift = util.by_pixel(6.75, -2),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-hairy-grass/green-hairy-grass-06.png",
        priority = base_decorative_sprite_priority,
        width = 51,
        height = 45,
        shift = util.by_pixel(8.5, -3.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-hairy-grass/hr-green-hairy-grass-06.png",
          priority = base_decorative_sprite_priority,
          width = 102,
          height = 90,
          shift = util.by_pixel(9, -3.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-hairy-grass/green-hairy-grass-07.png",
        priority = base_decorative_sprite_priority,
        width = 60,
        height = 33,
        shift = util.by_pixel(9, -3.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-hairy-grass/hr-green-hairy-grass-07.png",
          priority = base_decorative_sprite_priority,
          width = 122,
          height = 67,
          shift = util.by_pixel(9, -3.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-hairy-grass/green-hairy-grass-08.png",
        priority = base_decorative_sprite_priority,
        width = 51,
        height = 31,
        shift = util.by_pixel(0.5, -4.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-hairy-grass/hr-green-hairy-grass-08.png",
          priority = base_decorative_sprite_priority,
          width = 101,
          height = 63,
          shift = util.by_pixel(0.75, -4.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-hairy-grass/green-hairy-grass-09.png",
        priority = base_decorative_sprite_priority,
        width = 41,
        height = 39,
        shift = util.by_pixel(6.5, -6.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-hairy-grass/hr-green-hairy-grass-09.png",
          priority = base_decorative_sprite_priority,
          width = 82,
          height = 77,
          shift = util.by_pixel(6.5, -6.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-hairy-grass/green-hairy-grass-10.png",
        priority = base_decorative_sprite_priority,
        width = 55,
        height = 38,
        shift = util.by_pixel(5.5, -5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-hairy-grass/hr-green-hairy-grass-10.png",
          priority = base_decorative_sprite_priority,
          width = 109,
          height = 76,
          shift = util.by_pixel(5.75, -4.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-hairy-grass/green-hairy-grass-11.png",
        priority = base_decorative_sprite_priority,
        width = 41,
        height = 27,
        shift = util.by_pixel(4.5, -5.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-hairy-grass/hr-green-hairy-grass-11.png",
          priority = base_decorative_sprite_priority,
          width = 84,
          height = 52,
          shift = util.by_pixel(4.5, -5.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-hairy-grass/green-hairy-grass-12.png",
        priority = base_decorative_sprite_priority,
        width = 33,
        height = 30,
        shift = util.by_pixel(6.5, -6),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-hairy-grass/hr-green-hairy-grass-12.png",
          priority = base_decorative_sprite_priority,
          width = 66,
          height = 60,
          shift = util.by_pixel(7, -6),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-hairy-grass/green-hairy-grass-00.png",
        priority = base_decorative_sprite_priority,
        width = 73,
        height = 60,
        shift = util.by_pixel(8.5, -4),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-hairy-grass/hr-green-hairy-grass-00.png",
          priority = base_decorative_sprite_priority,
          width = 147,
          height = 118,
          shift = util.by_pixel(8.75, -4),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-hairy-grass/green-hairy-grass-01.png",
        priority = base_decorative_sprite_priority,
        width = 77,
        height = 46,
        shift = util.by_pixel(9.5, -4),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-hairy-grass/hr-green-hairy-grass-01.png",
          priority = base_decorative_sprite_priority,
          width = 153,
          height = 91,
          shift = util.by_pixel(9.75, -3.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-hairy-grass/green-hairy-grass-02.png",
        priority = base_decorative_sprite_priority,
        width = 79,
        height = 48,
        shift = util.by_pixel(5.5, -1),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-hairy-grass/hr-green-hairy-grass-02.png",
          priority = base_decorative_sprite_priority,
          width = 158,
          height = 96,
          shift = util.by_pixel(5, -1),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-hairy-grass/green-hairy-grass-03.png",
        priority = base_decorative_sprite_priority,
        width = 86,
        height = 72,
        shift = util.by_pixel(3, -2),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-hairy-grass/hr-green-hairy-grass-03.png",
          priority = base_decorative_sprite_priority,
          width = 172,
          height = 144,
          shift = util.by_pixel(3, -2),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-hairy-grass/green-hairy-grass-04.png",
        priority = base_decorative_sprite_priority,
        width = 81,
        height = 36,
        shift = util.by_pixel(4.5, -3),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-hairy-grass/hr-green-hairy-grass-04.png",
          priority = base_decorative_sprite_priority,
          width = 161,
          height = 73,
          shift = util.by_pixel(4.75, -3.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-hairy-grass/green-hairy-grass-05.png",
        priority = base_decorative_sprite_priority,
        width = 60,
        height = 36,
        shift = util.by_pixel(4, -4),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-hairy-grass/hr-green-hairy-grass-05.png",
          priority = base_decorative_sprite_priority,
          width = 119,
          height = 72,
          shift = util.by_pixel(3.75, -4),
          scale = 0.5
        }
      },

    }
  },
  {
    name = "muddy-stump",
    type = "optimized-decorative",
    order = "b[decorative]-a[stump]-a[muddy]",
    collision_mask = {"water-tile"},
    collision_box = {{-0.5, -0.5}, {0.5, 0.5}},
    render_layer = "object",
    pictures =
    {
      {
        filename = "__base__/graphics/decorative/muddy-stump/muddy-stump-00.png",
        priority = base_decorative_sprite_priority,
        width = 52,
        height = 44,
        shift = util.by_pixel(2, -2),
        hr_version =
        {
          filename = "__base__/graphics/decorative/muddy-stump/hr-muddy-stump-00.png",
          priority = base_decorative_sprite_priority,
          width = 106,
          height = 90,
          shift = util.by_pixel(1, -3),
          scale = 0.5,
        }
      },
      {
        filename = "__base__/graphics/decorative/muddy-stump/muddy-stump-01.png",
        priority = base_decorative_sprite_priority,
        width = 60,
        height = 42,
        shift = util.by_pixel(2, 0),
        hr_version =
        {
          filename = "__base__/graphics/decorative/muddy-stump/hr-muddy-stump-01.png",
          priority = base_decorative_sprite_priority,
          width = 114,
          height = 84,
          shift = util.by_pixel(3, 0),
          scale = 0.5,
        }
      },
      {
        filename = "__base__/graphics/decorative/muddy-stump/muddy-stump-02.png",
        priority = base_decorative_sprite_priority,
        width = 58,
        height = 48,
        shift = util.by_pixel(2, -2),
        hr_version =
        {
          filename = "__base__/graphics/decorative/muddy-stump/hr-muddy-stump-02.png",
          priority = base_decorative_sprite_priority,
          width = 120,
          height = 92,
          shift = util.by_pixel(1, -1),
          scale = 0.5,
        }
      },
      {
        filename = "__base__/graphics/decorative/muddy-stump/muddy-stump-03.png",
        priority = base_decorative_sprite_priority,
        width = 52,
        height = 38,
        shift = util.by_pixel(0, 0),
        hr_version =
        {
          filename = "__base__/graphics/decorative/muddy-stump/hr-muddy-stump-03.png",
          priority = base_decorative_sprite_priority,
          width = 104,
          height = 74,
          shift = util.by_pixel(0, 0),
          scale = 0.5,
        }
      },
      {
        filename = "__base__/graphics/decorative/muddy-stump/muddy-stump-04.png",
        priority = base_decorative_sprite_priority,
        width = 46,
        height = 36,
        shift = util.by_pixel(0, -2),
        hr_version =
        {
          filename = "__base__/graphics/decorative/muddy-stump/hr-muddy-stump-04.png",
          priority = base_decorative_sprite_priority,
          width = 92,
          height = 68,
          shift = util.by_pixel(0, -1),
          scale = 0.5,
        }
      },
      {
        filename = "__base__/graphics/decorative/muddy-stump/muddy-stump-05.png",
        priority = base_decorative_sprite_priority,
        width = 48,
        height = 40,
        shift = util.by_pixel(4, 0),
        hr_version =
        {
          filename = "__base__/graphics/decorative/muddy-stump/hr-muddy-stump-05.png",
          priority = base_decorative_sprite_priority,
          width = 92,
          height = 80,
          shift = util.by_pixel(5, 0),
          scale = 0.5,
        }
      },
      {
        filename = "__base__/graphics/decorative/muddy-stump/muddy-stump-06.png",
        priority = base_decorative_sprite_priority,
        width = 56,
        height = 36,
        shift = util.by_pixel(4, -2),
        hr_version =
        {
          filename = "__base__/graphics/decorative/muddy-stump/hr-muddy-stump-06.png",
          priority = base_decorative_sprite_priority,
          width = 112,
          height = 72,
          shift = util.by_pixel(4, -2),
          scale = 0.5,
        }
      },
      {
        filename = "__base__/graphics/decorative/muddy-stump/muddy-stump-07.png",
        priority = base_decorative_sprite_priority,
        width = 44,
        height = 42,
        shift = util.by_pixel(4, -2),
        hr_version =
        {
          filename = "__base__/graphics/decorative/muddy-stump/hr-muddy-stump-07.png",
          priority = base_decorative_sprite_priority,
          width = 88,
          height = 84,
          shift = util.by_pixel(4, -2),
          scale = 0.5,
        }
      },
      {
        filename = "__base__/graphics/decorative/muddy-stump/muddy-stump-08.png",
        priority = base_decorative_sprite_priority,
        width = 46,
        height = 32,
        shift = util.by_pixel(-4, 0),
        hr_version =
        {
          filename = "__base__/graphics/decorative/muddy-stump/hr-muddy-stump-08.png",
          priority = base_decorative_sprite_priority,
          width = 92,
          height = 60,
          shift = util.by_pixel(-4, 1),
          scale = 0.5,
        }
      },
      {
        filename = "__base__/graphics/decorative/muddy-stump/muddy-stump-09.png",
        priority = base_decorative_sprite_priority,
        width = 48,
        height = 36,
        shift = util.by_pixel(4, -2),
        hr_version =
        {
          filename = "__base__/graphics/decorative/muddy-stump/hr-muddy-stump-09.png",
          priority = base_decorative_sprite_priority,
          width = 96,
          height = 72,
          shift = util.by_pixel(4, -2),
          scale = 0.5,
        }
      },
    }
  },
  {
    name = "green-carpet-grass",
    type = "optimized-decorative",
    order = "b[decorative]-a[grass]-b[carpet]",
    collision_box = {{-2, -2}, {2, 2}},
    grows_through_rail_path = true,
    walking_sound = sounds.carpet_grass,
    trigger_effect = decorative_trigger_effects.green_carpet_grass(),
    autoplace =
    {
      order = "a[doodad]-f[grass]-c",
      sharpness = 0.7,
      max_probability = 0.5, -- was 0.01
      -- coverage = 0, -- doesn't actually prevent coverage
      peaks = autoplace_utils.peaks(grass_peaks,
      {
        {
          -- since coverage = 0 isn't low enough (!), need to substract some more
          influence = -0.5
        },
        {
          influence = 0.5,
          noise_layer = "grass1",
          noise_octaves_difference = -2.8,
          noise_persistence = 0.7
        }
      })
    },
    pictures =
    {
      --greenCarpet
      {
        filename = "__base__/graphics/decorative/green-carpet-grass/green-carpet-grass-08.png",
        priority = base_decorative_sprite_priority,
        width = 126,
        height = 121,
        shift = util.by_pixel(-4, 12.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-carpet-grass/hr-green-carpet-grass-08.png",
          priority = base_decorative_sprite_priority,
          width = 252,
          height = 241,
          shift = util.by_pixel(-4, 12.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-carpet-grass/green-carpet-grass-09.png",
        priority = base_decorative_sprite_priority,
        width = 130,
        height = 68,
        shift = util.by_pixel(0, 9),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-carpet-grass/hr-green-carpet-grass-09.png",
          priority = base_decorative_sprite_priority,
          width = 260,
          height = 135,
          shift = util.by_pixel(0, 9.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-carpet-grass/green-carpet-grass-10.png",
        priority = base_decorative_sprite_priority,
        width = 136,
        height = 145,
        shift = util.by_pixel(5, -7.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-carpet-grass/hr-green-carpet-grass-10.png",
          priority = base_decorative_sprite_priority,
          width = 272,
          height = 290,
          shift = util.by_pixel(5, -7.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-carpet-grass/green-carpet-grass-11.png",
        priority = base_decorative_sprite_priority,
        width = 134,
        height = 127,
        shift = util.by_pixel(1, -1.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-carpet-grass/hr-green-carpet-grass-11.png",
          priority = base_decorative_sprite_priority,
          width = 267,
          height = 253,
          shift = util.by_pixel(0.75, -1.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-carpet-grass/green-carpet-grass-03.png",
        priority = base_decorative_sprite_priority,
        width = 142,
        height = 108,
        shift = util.by_pixel(2, -15),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-carpet-grass/hr-green-carpet-grass-03.png",
          priority = base_decorative_sprite_priority,
          width = 282,
          height = 220,
          shift = util.by_pixel(2, -15.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-carpet-grass/green-carpet-grass-04.png",
        priority = base_decorative_sprite_priority,
        width = 129,
        height = 73,
        shift = util.by_pixel(3.5, -7.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-carpet-grass/hr-green-carpet-grass-04.png",
          priority = base_decorative_sprite_priority,
          width = 264,
          height = 146,
          shift = util.by_pixel(2, -7.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-carpet-grass/green-carpet-grass-05.png",
        priority = base_decorative_sprite_priority,
        width = 118,
        height = 131,
        shift = util.by_pixel(4, 1.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-carpet-grass/hr-green-carpet-grass-05.png",
          priority = base_decorative_sprite_priority,
          width = 235,
          height = 262,
          shift = util.by_pixel(4.25, 2),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-carpet-grass/green-carpet-grass-06.png",
        priority = base_decorative_sprite_priority,
        width = 126,
        height = 129,
        shift = util.by_pixel(2, -6.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-carpet-grass/hr-green-carpet-grass-06.png",
          priority = base_decorative_sprite_priority,
          width = 260,
          height = 257,
          shift = util.by_pixel(-0.5, -6.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-carpet-grass/green-carpet-grass-07.png",
        priority = base_decorative_sprite_priority,
        width = 122,
        height = 126,
        shift = util.by_pixel(6, 2),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-carpet-grass/hr-green-carpet-grass-07.png",
          priority = base_decorative_sprite_priority,
          width = 244,
          height = 255,
          shift = util.by_pixel(5.5, 2.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-carpet-grass/green-carpet-grass-00.png",
        priority = base_decorative_sprite_priority,
        width = 144,
        height = 146,
        shift = util.by_pixel(2, -3),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-carpet-grass/hr-green-carpet-grass-00.png",
          priority = base_decorative_sprite_priority,
          width = 289,
          height = 292,
          shift = util.by_pixel(1.75, -3),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-carpet-grass/green-carpet-grass-01.png",
        priority = base_decorative_sprite_priority,
        width = 137,
        height = 132,
        shift = util.by_pixel(0.5, -1),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-carpet-grass/hr-green-carpet-grass-01.png",
          priority = base_decorative_sprite_priority,
          width = 273,
          height = 264,
          shift = util.by_pixel(0.25, -0.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-carpet-grass/green-carpet-grass-02.png",
        priority = base_decorative_sprite_priority,
        width = 123,
        height = 93,
        shift = util.by_pixel(-4.5, 14.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-carpet-grass/hr-green-carpet-grass-02.png",
          priority = base_decorative_sprite_priority,
          width = 246,
          height = 185,
          shift = util.by_pixel(-4.5, 14.25),
          scale = 0.5
        }
      }
    }
  },

  {
    name = "white-desert-bush",
    type = "optimized-decorative",
    order = "b[decorative]-g[red-desert-bush]",
    collision_box = {{-0.5, -0.5}, {0.5, 0.5}},
    walking_sound = sounds.big_bush,
    trigger_effect = decorative_trigger_effects.white_desert_bush(),
    autoplace =
    {
      order = "a[doodad]-d[fluff]",
      sharpness = 1,
      placement_density = 1,
      coverage = 0.2,
      max_probability = 0.4,
      peaks =
      {
        {
          noise_layer = "fluff",
          noise_octaves_difference = -2,
          noise_persistence = 0.7
        },
        {
          aux_optimal = 1,
          aux_range = 0.6,
          aux_max_range = 1,
          water_optimal = 0,
          water_range = 0.2,
          water_max_range = 0.3
        }
      }
    },
    pictures =
    {
      --wdbush
      {
        filename = "__base__/graphics/decorative/white-desert-bush/white-desert-bush-00.png",
        priority = base_decorative_sprite_priority,
        width = 31,
        height = 21,
        shift = util.by_pixel(5.5, -3.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/white-desert-bush/hr-white-desert-bush-00.png",
          priority = base_decorative_sprite_priority,
          width = 62,
          height = 40,
          shift = util.by_pixel(5.5, -3.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/white-desert-bush/white-desert-bush-01.png",
        priority = base_decorative_sprite_priority,
        width = 29,
        height = 25,
        shift = util.by_pixel(5.5, -3.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/white-desert-bush/hr-white-desert-bush-01.png",
          priority = base_decorative_sprite_priority,
          width = 57,
          height = 49,
          shift = util.by_pixel(5.75, -3.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/white-desert-bush/white-desert-bush-02.png",
        priority = base_decorative_sprite_priority,
        width = 31,
        height = 19,
        shift = util.by_pixel(4.5, -2.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/white-desert-bush/hr-white-desert-bush-02.png",
          priority = base_decorative_sprite_priority,
          width = 63,
          height = 39,
          shift = util.by_pixel(4.25, -2.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/white-desert-bush/white-desert-bush-03.png",
        priority = base_decorative_sprite_priority,
        width = 35,
        height = 23,
        shift = util.by_pixel(4.5, -3.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/white-desert-bush/hr-white-desert-bush-03.png",
          priority = base_decorative_sprite_priority,
          width = 71,
          height = 46,
          shift = util.by_pixel(4.75, -3.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/white-desert-bush/white-desert-bush-04.png",
        priority = base_decorative_sprite_priority,
        width = 34,
        height = 22,
        shift = util.by_pixel(4, -4),
        hr_version =
        {
          filename = "__base__/graphics/decorative/white-desert-bush/hr-white-desert-bush-04.png",
          priority = base_decorative_sprite_priority,
          width = 68,
          height = 45,
          shift = util.by_pixel(4, -4.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/white-desert-bush/white-desert-bush-05.png",
        priority = base_decorative_sprite_priority,
        width = 27,
        height = 21,
        shift = util.by_pixel(4.5, -2.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/white-desert-bush/hr-white-desert-bush-05.png",
          priority = base_decorative_sprite_priority,
          width = 52,
          height = 42,
          shift = util.by_pixel(4.5, -2.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/white-desert-bush/white-desert-bush-06.png",
        priority = base_decorative_sprite_priority,
        width = 41,
        height = 27,
        shift = util.by_pixel(5.5, -4.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/white-desert-bush/hr-white-desert-bush-06.png",
          priority = base_decorative_sprite_priority,
          width = 83,
          height = 54,
          shift = util.by_pixel(5.75, -4.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/white-desert-bush/white-desert-bush-07.png",
        priority = base_decorative_sprite_priority,
        width = 40,
        height = 31,
        shift = util.by_pixel(7, -3.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/white-desert-bush/hr-white-desert-bush-07.png",
          priority = base_decorative_sprite_priority,
          width = 78,
          height = 62,
          shift = util.by_pixel(7, -3),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/white-desert-bush/white-desert-bush-08.png",
        priority = base_decorative_sprite_priority,
        width = 45,
        height = 31,
        shift = util.by_pixel(6.5, -2.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/white-desert-bush/hr-white-desert-bush-08.png",
          priority = base_decorative_sprite_priority,
          width = 91,
          height = 60,
          shift = util.by_pixel(6.25, -2.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/white-desert-bush/white-desert-bush-09.png",
        priority = base_decorative_sprite_priority,
        width = 39,
        height = 24,
        shift = util.by_pixel(2.5, -5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/white-desert-bush/hr-white-desert-bush-09.png",
          priority = base_decorative_sprite_priority,
          width = 78,
          height = 49,
          shift = util.by_pixel(3, -4.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/white-desert-bush/white-desert-bush-10.png",
        priority = base_decorative_sprite_priority,
        width = 36,
        height = 30,
        shift = util.by_pixel(6, -2),
        hr_version =
        {
          filename = "__base__/graphics/decorative/white-desert-bush/hr-white-desert-bush-10.png",
          priority = base_decorative_sprite_priority,
          width = 72,
          height = 59,
          shift = util.by_pixel(6, -1.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/white-desert-bush/white-desert-bush-11.png",
        priority = base_decorative_sprite_priority,
        width = 46,
        height = 26,
        shift = util.by_pixel(4, -2),
        hr_version =
        {
          filename = "__base__/graphics/decorative/white-desert-bush/hr-white-desert-bush-11.png",
          priority = base_decorative_sprite_priority,
          width = 93,
          height = 51,
          shift = util.by_pixel(4.25, -2.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/white-desert-bush/white-desert-bush-12.png",
        priority = base_decorative_sprite_priority,
        width = 29,
        height = 24,
        shift = util.by_pixel(4.5, -6),
        hr_version =
        {
          filename = "__base__/graphics/decorative/white-desert-bush/hr-white-desert-bush-12.png",
          priority = base_decorative_sprite_priority,
          width = 58,
          height = 47,
          shift = util.by_pixel(4, -6.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/white-desert-bush/white-desert-bush-13.png",
        priority = base_decorative_sprite_priority,
        width = 34,
        height = 27,
        shift = util.by_pixel(9, -4.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/white-desert-bush/hr-white-desert-bush-13.png",
          priority = base_decorative_sprite_priority,
          width = 69,
          height = 54,
          shift = util.by_pixel(9.25, -4),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/white-desert-bush/white-desert-bush-14.png",
        priority = base_decorative_sprite_priority,
        width = 34,
        height = 21,
        shift = util.by_pixel(5, -3.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/white-desert-bush/hr-white-desert-bush-14.png",
          priority = base_decorative_sprite_priority,
          width = 69,
          height = 43,
          shift = util.by_pixel(5.25, -3.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/white-desert-bush/white-desert-bush-15.png",
        priority = base_decorative_sprite_priority,
        width = 28,
        height = 19,
        shift = util.by_pixel(9, -3.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/white-desert-bush/hr-white-desert-bush-15.png",
          priority = base_decorative_sprite_priority,
          width = 55,
          height = 38,
          shift = util.by_pixel(8.75, -3.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/white-desert-bush/white-desert-bush-16.png",
        priority = base_decorative_sprite_priority,
        width = 24,
        height = 19,
        shift = util.by_pixel(0, -2.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/white-desert-bush/hr-white-desert-bush-16.png",
          priority = base_decorative_sprite_priority,
          width = 48,
          height = 38,
          shift = util.by_pixel(-0.5, -2),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/white-desert-bush/white-desert-bush-17.png",
        priority = base_decorative_sprite_priority,
        width = 22,
        height = 17,
        shift = util.by_pixel(2, -5.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/white-desert-bush/hr-white-desert-bush-17.png",
          priority = base_decorative_sprite_priority,
          width = 43,
          height = 33,
          shift = util.by_pixel(2.25, -5.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/white-desert-bush/white-desert-bush-18.png",
        priority = base_decorative_sprite_priority,
        width = 23,
        height = 17,
        shift = util.by_pixel(3.5, -1.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/white-desert-bush/hr-white-desert-bush-18.png",
          priority = base_decorative_sprite_priority,
          width = 46,
          height = 35,
          shift = util.by_pixel(3.5, -1.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/white-desert-bush/white-desert-bush-19.png",
        priority = base_decorative_sprite_priority,
        width = 23,
        height = 13,
        shift = util.by_pixel(3.5, -2.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/white-desert-bush/hr-white-desert-bush-19.png",
          priority = base_decorative_sprite_priority,
          width = 45,
          height = 27,
          shift = util.by_pixel(3.75, -2.75),
          scale = 0.5
        }
      }
    }
  },

  {
    name = "green-desert-bush",
    type = "optimized-decorative",
    order = "b[decorative]-g[red-desert-bush]",
    collision_box = {{-0.5, -0.5}, {0.5, 0.5}},
    walking_sound = sounds.small_bush,
    trigger_effect = decorative_trigger_effects.green_desert_bush(),
    autoplace =
    {
      order = "a[doodad]-d[fluff]",
      sharpness = 1,
      placement_density = 1,
      coverage = 0.2,
      max_probability = 0.4,
      peaks =
      {
        {
          noise_layer = "fluff",
          noise_octaves_difference = -2,
          noise_persistence = 0.7
        },
        {
          aux_optimal = 1,
          aux_range = 0.6,
          aux_max_range = 1,
          water_optimal = 0,
          water_range = 0.2,
          water_max_range = 0.3
        }
      }
    },
    pictures =
    {
      --gdbush
      {
        filename = "__base__/graphics/decorative/green-desert-bush/green-desert-bush-00.png",
        priority = base_decorative_sprite_priority,
        width = 38,
        height = 24,
        shift = util.by_pixel(10, -5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-desert-bush/hr-green-desert-bush-00.png",
          priority = base_decorative_sprite_priority,
          width = 77,
          height = 48,
          shift = util.by_pixel(9.75, -4.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-desert-bush/green-desert-bush-01.png",
        priority = base_decorative_sprite_priority,
        width = 31,
        height = 24,
        shift = util.by_pixel(4.5, -3),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-desert-bush/hr-green-desert-bush-01.png",
          priority = base_decorative_sprite_priority,
          width = 63,
          height = 48,
          shift = util.by_pixel(4.75, -3.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-desert-bush/green-desert-bush-02.png",
        priority = base_decorative_sprite_priority,
        width = 33,
        height = 26,
        shift = util.by_pixel(6.5, -7),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-desert-bush/hr-green-desert-bush-02.png",
          priority = base_decorative_sprite_priority,
          width = 67,
          height = 53,
          shift = util.by_pixel(6.25, -7.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-desert-bush/green-desert-bush-03.png",
        priority = base_decorative_sprite_priority,
        width = 32,
        height = 24,
        shift = util.by_pixel(3, -3),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-desert-bush/hr-green-desert-bush-03.png",
          priority = base_decorative_sprite_priority,
          width = 65,
          height = 49,
          shift = util.by_pixel(3.25, -2.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-desert-bush/green-desert-bush-04.png",
        priority = base_decorative_sprite_priority,
        width = 33,
        height = 26,
        shift = util.by_pixel(4.5, -7),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-desert-bush/hr-green-desert-bush-04.png",
          priority = base_decorative_sprite_priority,
          width = 65,
          height = 51,
          shift = util.by_pixel(4.75, -7.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-desert-bush/green-desert-bush-05.png",
        priority = base_decorative_sprite_priority,
        width = 38,
        height = 24,
        shift = util.by_pixel(11, -5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-desert-bush/hr-green-desert-bush-05.png",
          priority = base_decorative_sprite_priority,
          width = 76,
          height = 49,
          shift = util.by_pixel(11, -4.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-desert-bush/green-desert-bush-06.png",
        priority = base_decorative_sprite_priority,
        width = 38,
        height = 25,
        shift = util.by_pixel(8, -4.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-desert-bush/hr-green-desert-bush-06.png",
          priority = base_decorative_sprite_priority,
          width = 75,
          height = 50,
          shift = util.by_pixel(8.25, -4.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-desert-bush/green-desert-bush-07.png",
        priority = base_decorative_sprite_priority,
        width = 38,
        height = 23,
        shift = util.by_pixel(5, -3.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-desert-bush/hr-green-desert-bush-07.png",
          priority = base_decorative_sprite_priority,
          width = 76,
          height = 46,
          shift = util.by_pixel(5, -3.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-desert-bush/green-desert-bush-08.png",
        priority = base_decorative_sprite_priority,
        width = 29,
        height = 22,
        shift = util.by_pixel(4.5, -7),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-desert-bush/hr-green-desert-bush-08.png",
          priority = base_decorative_sprite_priority,
          width = 57,
          height = 44,
          shift = util.by_pixel(4.25, -7),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-desert-bush/green-desert-bush-09.png",
        priority = base_decorative_sprite_priority,
        width = 27,
        height = 18,
        shift = util.by_pixel(7.5, -1),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-desert-bush/hr-green-desert-bush-09.png",
          priority = base_decorative_sprite_priority,
          width = 55,
          height = 36,
          shift = util.by_pixel(7.75, -1),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-desert-bush/green-desert-bush-10.png",
        priority = base_decorative_sprite_priority,
        width = 26,
        height = 19,
        shift = util.by_pixel(2, -4.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-desert-bush/hr-green-desert-bush-10.png",
          priority = base_decorative_sprite_priority,
          width = 52,
          height = 37,
          shift = util.by_pixel(2.5, -4.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-desert-bush/green-desert-bush-11.png",
        priority = base_decorative_sprite_priority,
        width = 28,
        height = 20,
        shift = util.by_pixel(9, -6),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-desert-bush/hr-green-desert-bush-11.png",
          priority = base_decorative_sprite_priority,
          width = 57,
          height = 39,
          shift = util.by_pixel(8.75, -5.75),
          scale = 0.5
        }
      }
    }
  },

  {
    name = "red-desert-bush",
    type = "optimized-decorative",
    order = "b[decorative]-g[red-desert-bush]",
    collision_box = {{-0.5, -0.5}, {0.5, 0.5}},
    walking_sound = sounds.small_bush,
    trigger_effect = decorative_trigger_effects.red_desert_bush(),
    autoplace =
    {
      order = "a[doodad]-d[fluff]",
      sharpness = 1,
      placement_density = 1,
      coverage = 0.2,
      max_probability = 0.4,
      peaks =
      {
        {
          noise_layer = "fluff",
          noise_octaves_difference = -2,
          noise_persistence = 0.7
        },
        {
          aux_optimal = 1,
          aux_range = 0.6,
          aux_max_range = 1,
          water_optimal = 0,
          water_range = 0.2,
          water_max_range = 0.3
        }
      }
    },
    pictures =
    {
      --rdbush
      {
        filename = "__base__/graphics/decorative/red-desert-bush/red-desert-bush-00.png",
        priority = base_decorative_sprite_priority,
        width = 41,
        height = 30,
        shift = util.by_pixel(5.5, -4),
        hr_version =
        {
          filename = "__base__/graphics/decorative/red-desert-bush/hr-red-desert-bush-00.png",
          priority = base_decorative_sprite_priority,
          width = 82,
          height = 60,
          shift = util.by_pixel(5.5, -4),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/red-desert-bush/red-desert-bush-01.png",
        priority = base_decorative_sprite_priority,
        width = 42,
        height = 27,
        shift = util.by_pixel(6, -6.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/red-desert-bush/hr-red-desert-bush-01.png",
          priority = base_decorative_sprite_priority,
          width = 84,
          height = 55,
          shift = util.by_pixel(6.5, -6.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/red-desert-bush/red-desert-bush-02.png",
        priority = base_decorative_sprite_priority,
        width = 41,
        height = 28,
        shift = util.by_pixel(10.5, -6),
        hr_version =
        {
          filename = "__base__/graphics/decorative/red-desert-bush/hr-red-desert-bush-02.png",
          priority = base_decorative_sprite_priority,
          width = 83,
          height = 55,
          shift = util.by_pixel(10.25, -6.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/red-desert-bush/red-desert-bush-03.png",
        priority = base_decorative_sprite_priority,
        width = 39,
        height = 27,
        shift = util.by_pixel(5.5, -6.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/red-desert-bush/hr-red-desert-bush-03.png",
          priority = base_decorative_sprite_priority,
          width = 78,
          height = 53,
          shift = util.by_pixel(5.5, -6.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/red-desert-bush/red-desert-bush-04.png",
        priority = base_decorative_sprite_priority,
        width = 32,
        height = 23,
        shift = util.by_pixel(7, -3.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/red-desert-bush/hr-red-desert-bush-04.png",
          priority = base_decorative_sprite_priority,
          width = 63,
          height = 48,
          shift = util.by_pixel(7.25, -3.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/red-desert-bush/red-desert-bush-05.png",
        priority = base_decorative_sprite_priority,
        width = 31,
        height = 19,
        shift = util.by_pixel(4.5, -5.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/red-desert-bush/hr-red-desert-bush-05.png",
          priority = base_decorative_sprite_priority,
          width = 63,
          height = 38,
          shift = util.by_pixel(4.25, -5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/red-desert-bush/red-desert-bush-06.png",
        priority = base_decorative_sprite_priority,
        width = 28,
        height = 21,
        shift = util.by_pixel(5, -5.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/red-desert-bush/hr-red-desert-bush-06.png",
          priority = base_decorative_sprite_priority,
          width = 57,
          height = 42,
          shift = util.by_pixel(5.25, -5.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/red-desert-bush/red-desert-bush-07.png",
        priority = base_decorative_sprite_priority,
        width = 28,
        height = 18,
        shift = util.by_pixel(7, -3),
        hr_version =
        {
          filename = "__base__/graphics/decorative/red-desert-bush/hr-red-desert-bush-07.png",
          priority = base_decorative_sprite_priority,
          width = 55,
          height = 36,
          shift = util.by_pixel(7.25, -3),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/red-desert-bush/red-desert-bush-08.png",
        priority = base_decorative_sprite_priority,
        width = 27,
        height = 17,
        shift = util.by_pixel(4.5, -2.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/red-desert-bush/hr-red-desert-bush-08.png",
          priority = base_decorative_sprite_priority,
          width = 54,
          height = 34,
          shift = util.by_pixel(5, -3),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/red-desert-bush/red-desert-bush-09.png",
        priority = base_decorative_sprite_priority,
        width = 35,
        height = 25,
        shift = util.by_pixel(2.5, -2.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/red-desert-bush/hr-red-desert-bush-09.png",
          priority = base_decorative_sprite_priority,
          width = 70,
          height = 50,
          shift = util.by_pixel(3, -3),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/red-desert-bush/red-desert-bush-10.png",
        priority = base_decorative_sprite_priority,
        width = 29,
        height = 21,
        shift = util.by_pixel(3.5, -3.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/red-desert-bush/hr-red-desert-bush-10.png",
          priority = base_decorative_sprite_priority,
          width = 58,
          height = 41,
          shift = util.by_pixel(3.5, -3.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/red-desert-bush/red-desert-bush-11.png",
        priority = base_decorative_sprite_priority,
        width = 26,
        height = 21,
        shift = util.by_pixel(4, -1.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/red-desert-bush/hr-red-desert-bush-11.png",
          priority = base_decorative_sprite_priority,
          width = 51,
          height = 41,
          shift = util.by_pixel(4.25, -1.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/red-desert-bush/red-desert-bush-12.png",
        priority = base_decorative_sprite_priority,
        width = 34,
        height = 22,
        shift = util.by_pixel(1, -3),
        hr_version =
        {
          filename = "__base__/graphics/decorative/red-desert-bush/hr-red-desert-bush-12.png",
          priority = base_decorative_sprite_priority,
          width = 67,
          height = 45,
          shift = util.by_pixel(1.25, -2.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/red-desert-bush/red-desert-bush-13.png",
        priority = base_decorative_sprite_priority,
        width = 24,
        height = 16,
        shift = util.by_pixel(4, -5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/red-desert-bush/hr-red-desert-bush-13.png",
          priority = base_decorative_sprite_priority,
          width = 49,
          height = 32,
          shift = util.by_pixel(4.25, -4.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/red-desert-bush/red-desert-bush-14.png",
        priority = base_decorative_sprite_priority,
        width = 22,
        height = 18,
        shift = util.by_pixel(6, -3),
        hr_version =
        {
          filename = "__base__/graphics/decorative/red-desert-bush/hr-red-desert-bush-14.png",
          priority = base_decorative_sprite_priority,
          width = 43,
          height = 35,
          shift = util.by_pixel(6.25, -3.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/red-desert-bush/red-desert-bush-15.png",
        priority = base_decorative_sprite_priority,
        width = 26,
        height = 18,
        shift = util.by_pixel(4, -3),
        hr_version =
        {
          filename = "__base__/graphics/decorative/red-desert-bush/hr-red-desert-bush-15.png",
          priority = base_decorative_sprite_priority,
          width = 52,
          height = 36,
          shift = util.by_pixel(4, -3),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/red-desert-bush/red-desert-bush-16.png",
        priority = base_decorative_sprite_priority,
        width = 19,
        height = 13,
        shift = util.by_pixel(3.5, -2.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/red-desert-bush/hr-red-desert-bush-16.png",
          priority = base_decorative_sprite_priority,
          width = 38,
          height = 28,
          shift = util.by_pixel(3.5, -2.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/red-desert-bush/red-desert-bush-17.png",
        priority = base_decorative_sprite_priority,
        width = 19,
        height = 14,
        shift = util.by_pixel(3.5, -3),
        hr_version =
        {
          filename = "__base__/graphics/decorative/red-desert-bush/hr-red-desert-bush-17.png",
          priority = base_decorative_sprite_priority,
          width = 38,
          height = 28,
          shift = util.by_pixel(3.5, -3),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/red-desert-bush/red-desert-bush-18.png",
        priority = base_decorative_sprite_priority,
        width = 42,
        height = 28,
        shift = util.by_pixel(5, -6),
        hr_version =
        {
          filename = "__base__/graphics/decorative/red-desert-bush/hr-red-desert-bush-18.png",
          priority = base_decorative_sprite_priority,
          width = 86,
          height = 58,
          shift = util.by_pixel(5, -6),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/red-desert-bush/red-desert-bush-19.png",
        priority = base_decorative_sprite_priority,
        width = 47,
        height = 30,
        shift = util.by_pixel(10.5, -6),
        hr_version =
        {
          filename = "__base__/graphics/decorative/red-desert-bush/hr-red-desert-bush-19.png",
          priority = base_decorative_sprite_priority,
          width = 93,
          height = 59,
          shift = util.by_pixel(10.75, -6.25),
          scale = 0.5
        }
      }
    }
  },

  {
    name = "green-small-grass",
    type = "optimized-decorative",
    order = "b[decorative]-a[grass]-c[small]",
    collision_box = {{-1.5, -1.5}, {1.5, 1.5}},
    grows_through_rail_path = true,
    walking_sound = sounds.carpet_grass,
    trigger_effect = decorative_trigger_effects.green_small_grass(),
    autoplace =
    {
      order = "a[doodad]-f[grass]-d",
      sharpness = 0.2,
      max_probability = 0.02,
      coverage = 0.3,
      peaks = autoplace_utils.peaks(grass_peaks,
      {
        {
          influence = 0.35,
          noise_layer = "grass1",
          noise_octaves_difference = -2.8,
          noise_persistence = 0.7
        }
      })
    },
    pictures =
    {
      --greenSmall
      {
        filename = "__base__/graphics/decorative/green-small-grass/green-small-grass-00.png",
        priority = base_decorative_sprite_priority,
        width = 60,
        height = 42,
        shift = util.by_pixel(6, -6),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-small-grass/hr-green-small-grass-00.png",
          priority = base_decorative_sprite_priority,
          width = 122,
          height = 84,
          shift = util.by_pixel(6, -6),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-small-grass/green-small-grass-01.png",
        priority = base_decorative_sprite_priority,
        width = 51,
        height = 33,
        shift = util.by_pixel(1.5, 0.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-small-grass/hr-green-small-grass-01.png",
          priority = base_decorative_sprite_priority,
          width = 101,
          height = 65,
          shift = util.by_pixel(1.25, 0.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-small-grass/green-small-grass-02.png",
        priority = base_decorative_sprite_priority,
        width = 43,
        height = 37,
        shift = util.by_pixel(2.5, -2.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-small-grass/hr-green-small-grass-02.png",
          priority = base_decorative_sprite_priority,
          width = 86,
          height = 74,
          shift = util.by_pixel(3, -2.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-small-grass/green-small-grass-03.png",
        priority = base_decorative_sprite_priority,
        width = 54,
        height = 38,
        shift = util.by_pixel(-3, -4),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-small-grass/hr-green-small-grass-03.png",
          priority = base_decorative_sprite_priority,
          width = 106,
          height = 74,
          shift = util.by_pixel(-3, -4),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-small-grass/green-small-grass-04.png",
        priority = base_decorative_sprite_priority,
        width = 50,
        height = 34,
        shift = util.by_pixel(-2, -2),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-small-grass/hr-green-small-grass-04.png",
          priority = base_decorative_sprite_priority,
          width = 100,
          height = 67,
          shift = util.by_pixel(-2.5, -2.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-small-grass/green-small-grass-05.png",
        priority = base_decorative_sprite_priority,
        width = 58,
        height = 33,
        shift = util.by_pixel(-2, -3.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-small-grass/hr-green-small-grass-05.png",
          priority = base_decorative_sprite_priority,
          width = 116,
          height = 65,
          shift = util.by_pixel(-2, -3.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-small-grass/green-small-grass-06.png",
        priority = base_decorative_sprite_priority,
        width = 41,
        height = 35,
        shift = util.by_pixel(2.5, -2.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-small-grass/hr-green-small-grass-06.png",
          priority = base_decorative_sprite_priority,
          width = 81,
          height = 70,
          shift = util.by_pixel(2.75, -3),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-small-grass/green-small-grass-07.png",
        priority = base_decorative_sprite_priority,
        width = 48,
        height = 27,
        shift = util.by_pixel(-3, -1.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-small-grass/hr-green-small-grass-07.png",
          priority = base_decorative_sprite_priority,
          width = 95,
          height = 54,
          shift = util.by_pixel(-3.25, -1.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-small-grass/green-small-grass-08.png",
        priority = base_decorative_sprite_priority,
        width = 45,
        height = 28,
        shift = util.by_pixel(-2.5, -2),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-small-grass/hr-green-small-grass-08.png",
          priority = base_decorative_sprite_priority,
          width = 91,
          height = 56,
          shift = util.by_pixel(-2.75, -2.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-small-grass/green-small-grass-09.png",
        priority = base_decorative_sprite_priority,
        width = 39,
        height = 27,
        shift = util.by_pixel(0.5, -1.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-small-grass/hr-green-small-grass-09.png",
          priority = base_decorative_sprite_priority,
          width = 77,
          height = 54,
          shift = util.by_pixel(0.25, -1.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-small-grass/green-small-grass-10.png",
        priority = base_decorative_sprite_priority,
        width = 23,
        height = 17,
        shift = util.by_pixel(6.5, -1.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-small-grass/hr-green-small-grass-10.png",
          priority = base_decorative_sprite_priority,
          width = 46,
          height = 33,
          shift = util.by_pixel(6, -1.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/green-small-grass/green-small-grass-11.png",
        priority = base_decorative_sprite_priority,
        width = 20,
        height = 13,
        shift = util.by_pixel(3, -0.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/green-small-grass/hr-green-small-grass-11.png",
          priority = base_decorative_sprite_priority,
          width = 39,
          height = 26,
          shift = util.by_pixel(3.25, 0),
          scale = 0.5
        }
      }
    }
  },

  {
    name = "brown-carpet-grass",
    type = "optimized-decorative",
    order = "b[decorative]-a[grass]-b[carpet]",
    collision_box = {{-2, -2}, {2, 2}},
    grows_through_rail_path = true,
    walking_sound = sounds.carpet_grass,
    trigger_effect = decorative_trigger_effects.brown_carpet_grass(),
    autoplace =
    {
      order = "a[doodad]-f[grass]-c",
      sharpness = 0.7,
      max_probability = 0.25,
      coverage = 0.2,
      peaks =
      {
        {
          influence = 0.5
        },
        {
          influence = 0.6,
          temperature_optimal = 20,
          temperature_range = 10,
          temperature_max_range = 15,
          water_optimal = 0.65,
          water_range = 0.25,
          water_max_range = 0.5
        },
        {
          influence = 0.3,
          noise_layer = "grass2",
          noise_octaves_difference = -2.8,
          noise_persistence = 0.7,
          min_influence = 0
        }
      }
    },
    pictures =
    {
      --brownCarpet
      {
        filename = "__base__/graphics/decorative/brown-carpet-grass/brown-carpet-grass-06.png",
        priority = base_decorative_sprite_priority,
        width = 120,
        height = 111,
        shift = util.by_pixel(-1, -3.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/brown-carpet-grass/hr-brown-carpet-grass-06.png",
          priority = base_decorative_sprite_priority,
          width = 239,
          height = 220,
          shift = util.by_pixel(-1.25, -3.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/brown-carpet-grass/brown-carpet-grass-07.png",
        priority = base_decorative_sprite_priority,
        width = 121,
        height = 138,
        shift = util.by_pixel(6.5, -7),
        hr_version =
        {
          filename = "__base__/graphics/decorative/brown-carpet-grass/hr-brown-carpet-grass-07.png",
          priority = base_decorative_sprite_priority,
          width = 241,
          height = 274,
          shift = util.by_pixel(6.25, -7),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/brown-carpet-grass/brown-carpet-grass-08.png",
        priority = base_decorative_sprite_priority,
        width = 133,
        height = 131,
        shift = util.by_pixel(3.5, 0.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/brown-carpet-grass/hr-brown-carpet-grass-08.png",
          priority = base_decorative_sprite_priority,
          width = 266,
          height = 261,
          shift = util.by_pixel(3.5, 0.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/brown-carpet-grass/brown-carpet-grass-09.png",
        priority = base_decorative_sprite_priority,
        width = 133,
        height = 114,
        shift = util.by_pixel(10.5, -12),
        hr_version =
        {
          filename = "__base__/graphics/decorative/brown-carpet-grass/hr-brown-carpet-grass-09.png",
          priority = base_decorative_sprite_priority,
          width = 265,
          height = 228,
          shift = util.by_pixel(10.25, -11.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/brown-carpet-grass/brown-carpet-grass-10.png",
        priority = base_decorative_sprite_priority,
        width = 144,
        height = 146,
        shift = util.by_pixel(4, 3),
        hr_version =
        {
          filename = "__base__/graphics/decorative/brown-carpet-grass/hr-brown-carpet-grass-10.png",
          priority = base_decorative_sprite_priority,
          width = 288,
          height = 293,
          shift = util.by_pixel(4, 3.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/brown-carpet-grass/brown-carpet-grass-11.png",
        priority = base_decorative_sprite_priority,
        width = 135,
        height = 133,
        shift = util.by_pixel(4.5, -4.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/brown-carpet-grass/hr-brown-carpet-grass-11.png",
          priority = base_decorative_sprite_priority,
          width = 269,
          height = 265,
          shift = util.by_pixel(4.25, -4.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/brown-carpet-grass/brown-carpet-grass-00.png",
        priority = base_decorative_sprite_priority,
        width = 105,
        height = 97,
        shift = util.by_pixel(2.5, 8.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/brown-carpet-grass/hr-brown-carpet-grass-00.png",
          priority = base_decorative_sprite_priority,
          width = 211,
          height = 195,
          shift = util.by_pixel(2.25, 8.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/brown-carpet-grass/brown-carpet-grass-01.png",
        priority = base_decorative_sprite_priority,
        width = 124,
        height = 129,
        shift = util.by_pixel(0, -2.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/brown-carpet-grass/hr-brown-carpet-grass-01.png",
          priority = base_decorative_sprite_priority,
          width = 248,
          height = 259,
          shift = util.by_pixel(0, -2.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/brown-carpet-grass/brown-carpet-grass-02.png",
        priority = base_decorative_sprite_priority,
        width = 129,
        height = 131,
        shift = util.by_pixel(1.5, -2.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/brown-carpet-grass/hr-brown-carpet-grass-02.png",
          priority = base_decorative_sprite_priority,
          width = 258,
          height = 263,
          shift = util.by_pixel(1.5, -2.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/brown-carpet-grass/brown-carpet-grass-03.png",
        priority = base_decorative_sprite_priority,
        width = 141,
        height = 63,
        shift = util.by_pixel(4.5, -2.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/brown-carpet-grass/hr-brown-carpet-grass-03.png",
          priority = base_decorative_sprite_priority,
          width = 283,
          height = 126,
          shift = util.by_pixel(5.25, -2.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/brown-carpet-grass/brown-carpet-grass-04.png",
        priority = base_decorative_sprite_priority,
        width = 76,
        height = 133,
        shift = util.by_pixel(0, -7.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/brown-carpet-grass/hr-brown-carpet-grass-04.png",
          priority = base_decorative_sprite_priority,
          width = 152,
          height = 265,
          shift = util.by_pixel(0, -7.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/brown-carpet-grass/brown-carpet-grass-05.png",
        priority = base_decorative_sprite_priority,
        width = 123,
        height = 108,
        shift = util.by_pixel(3.5, -1),
        hr_version =
        {
          filename = "__base__/graphics/decorative/brown-carpet-grass/hr-brown-carpet-grass-05.png",
          priority = base_decorative_sprite_priority,
          width = 247,
          height = 216,
          shift = util.by_pixel(3.25, -1),
          scale = 0.5
        }
      }
    }
  },
  {
    name = "brown-hairy-grass",
    type = "optimized-decorative",
    order = "b[decorative]-a[grass]-a[hairy]",
    collision_box = {{-1, -1}, {1, 1}},
    grows_through_rail_path = true,
    render_layer = "decorative",
    walking_sound = sounds.hairy_grass,
    trigger_effect = decorative_trigger_effects.brown_hairy_grass(),
    autoplace =
    {
      order = "a[doodad]-f[grass]-b",
      sharpness = 0.5,
      max_probability = 1,
      -- coverage = 0.25,
      peaks =
      {
        {
          influence = -0.5
        },
        {
          influence = 0.6,
          noise_layer = "grass2",
          noise_octaves_difference = -2.8,
          noise_persistence = 0.7
        }
      }
    },
    pictures =
    {
      --hairyBrown
      {
        filename = "__base__/graphics/decorative/brown-hairy-grass/brown-hairy-grass-00.png",
        priority = base_decorative_sprite_priority,
        width = 76,
        height = 65,
        shift = util.by_pixel(3, -5.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/brown-hairy-grass/hr-brown-hairy-grass-00.png",
          priority = base_decorative_sprite_priority,
          width = 151,
          height = 129,
          shift = util.by_pixel(3.25, -5.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/brown-hairy-grass/brown-hairy-grass-01.png",
        priority = base_decorative_sprite_priority,
        width = 84,
        height = 61,
        shift = util.by_pixel(5, -1.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/brown-hairy-grass/hr-brown-hairy-grass-01.png",
          priority = base_decorative_sprite_priority,
          width = 167,
          height = 122,
          shift = util.by_pixel(4.75, -2),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/brown-hairy-grass/brown-hairy-grass-02.png",
        priority = base_decorative_sprite_priority,
        width = 53,
        height = 48,
        shift = util.by_pixel(5.5, -1),
        hr_version =
        {
          filename = "__base__/graphics/decorative/brown-hairy-grass/hr-brown-hairy-grass-02.png",
          priority = base_decorative_sprite_priority,
          width = 107,
          height = 95,
          shift = util.by_pixel(5.75, -0.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/brown-hairy-grass/brown-hairy-grass-03.png",
        priority = base_decorative_sprite_priority,
        width = 60,
        height = 37,
        shift = util.by_pixel(5, -1.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/brown-hairy-grass/hr-brown-hairy-grass-03.png",
          priority = base_decorative_sprite_priority,
          width = 121,
          height = 74,
          shift = util.by_pixel(4.75, -1),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/brown-hairy-grass/brown-hairy-grass-04.png",
        priority = base_decorative_sprite_priority,
        width = 48,
        height = 51,
        shift = util.by_pixel(4, -2.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/brown-hairy-grass/hr-brown-hairy-grass-04.png",
          priority = base_decorative_sprite_priority,
          width = 98,
          height = 102,
          shift = util.by_pixel(4, -3),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/brown-hairy-grass/brown-hairy-grass-05.png",
        priority = base_decorative_sprite_priority,
        width = 41,
        height = 33,
        shift = util.by_pixel(4.5, -2.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/brown-hairy-grass/hr-brown-hairy-grass-05.png",
          priority = base_decorative_sprite_priority,
          width = 83,
          height = 67,
          shift = util.by_pixel(4.75, -2.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/brown-hairy-grass/brown-hairy-grass-06.png",
        priority = base_decorative_sprite_priority,
        width = 51,
        height = 34,
        shift = util.by_pixel(2.5, -4),
        hr_version =
        {
          filename = "__base__/graphics/decorative/brown-hairy-grass/hr-brown-hairy-grass-06.png",
          priority = base_decorative_sprite_priority,
          width = 103,
          height = 70,
          shift = util.by_pixel(2.25, -4),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/brown-hairy-grass/brown-hairy-grass-07.png",
        priority = base_decorative_sprite_priority,
        width = 44,
        height = 30,
        shift = util.by_pixel(4, -2),
        hr_version =
        {
          filename = "__base__/graphics/decorative/brown-hairy-grass/hr-brown-hairy-grass-07.png",
          priority = base_decorative_sprite_priority,
          width = 89,
          height = 59,
          shift = util.by_pixel(4.25, -1.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/brown-hairy-grass/brown-hairy-grass-08.png",
        priority = base_decorative_sprite_priority,
        width = 48,
        height = 51,
        shift = util.by_pixel(-2, 1.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/brown-hairy-grass/hr-brown-hairy-grass-08.png",
          priority = base_decorative_sprite_priority,
          width = 97,
          height = 102,
          shift = util.by_pixel(-2.25, 1.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/brown-hairy-grass/brown-hairy-grass-09.png",
        priority = base_decorative_sprite_priority,
        width = 64,
        height = 38,
        shift = util.by_pixel(14, -4),
        hr_version =
        {
          filename = "__base__/graphics/decorative/brown-hairy-grass/hr-brown-hairy-grass-09.png",
          priority = base_decorative_sprite_priority,
          width = 128,
          height = 77,
          shift = util.by_pixel(14, -4.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/brown-hairy-grass/brown-hairy-grass-10.png",
        priority = base_decorative_sprite_priority,
        width = 71,
        height = 37,
        shift = util.by_pixel(-4.5, -6.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/brown-hairy-grass/hr-brown-hairy-grass-10.png",
          priority = base_decorative_sprite_priority,
          width = 141,
          height = 74,
          shift = util.by_pixel(-4.25, -7),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/brown-hairy-grass/brown-hairy-grass-11.png",
        priority = base_decorative_sprite_priority,
        width = 28,
        height = 43,
        shift = util.by_pixel(1, 3.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/brown-hairy-grass/hr-brown-hairy-grass-11.png",
          priority = base_decorative_sprite_priority,
          width = 55,
          height = 87,
          shift = util.by_pixel(1.25, 3.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/brown-hairy-grass/brown-hairy-grass-12.png",
        priority = base_decorative_sprite_priority,
        width = 53,
        height = 27,
        shift = util.by_pixel(0.5, -4.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/brown-hairy-grass/hr-brown-hairy-grass-12.png",
          priority = base_decorative_sprite_priority,
          width = 107,
          height = 53,
          shift = util.by_pixel(0.75, -4.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/brown-hairy-grass/brown-hairy-grass-13.png",
        priority = base_decorative_sprite_priority,
        width = 32,
        height = 24,
        shift = util.by_pixel(1, -3),
        hr_version =
        {
          filename = "__base__/graphics/decorative/brown-hairy-grass/hr-brown-hairy-grass-13.png",
          priority = base_decorative_sprite_priority,
          width = 64,
          height = 48,
          shift = util.by_pixel(1, -3),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/brown-hairy-grass/brown-hairy-grass-14.png",
        priority = base_decorative_sprite_priority,
        width = 36,
        height = 24,
        shift = util.by_pixel(5, -3),
        hr_version =
        {
          filename = "__base__/graphics/decorative/brown-hairy-grass/hr-brown-hairy-grass-14.png",
          priority = base_decorative_sprite_priority,
          width = 71,
          height = 47,
          shift = util.by_pixel(5.25, -3.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/brown-hairy-grass/brown-hairy-grass-15.png",
        priority = base_decorative_sprite_priority,
        width = 33,
        height = 25,
        shift = util.by_pixel(1.5, -0.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/brown-hairy-grass/hr-brown-hairy-grass-15.png",
          priority = base_decorative_sprite_priority,
          width = 66,
          height = 50,
          shift = util.by_pixel(1.5, -0.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/brown-hairy-grass/brown-hairy-grass-16.png",
        priority = base_decorative_sprite_priority,
        width = 31,
        height = 25,
        shift = util.by_pixel(3.5, -3.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/brown-hairy-grass/hr-brown-hairy-grass-16.png",
          priority = base_decorative_sprite_priority,
          width = 61,
          height = 48,
          shift = util.by_pixel(3.75, -3.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/brown-hairy-grass/brown-hairy-grass-17.png",
        priority = base_decorative_sprite_priority,
        width = 14,
        height = 19,
        shift = util.by_pixel(-2, -3.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/brown-hairy-grass/hr-brown-hairy-grass-17.png",
          priority = base_decorative_sprite_priority,
          width = 28,
          height = 37,
          shift = util.by_pixel(-1.5, -3.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/brown-hairy-grass/brown-hairy-grass-18.png",
        priority = base_decorative_sprite_priority,
        width = 22,
        height = 14,
        shift = util.by_pixel(6, -3),
        hr_version =
        {
          filename = "__base__/graphics/decorative/brown-hairy-grass/hr-brown-hairy-grass-18.png",
          priority = base_decorative_sprite_priority,
          width = 43,
          height = 29,
          shift = util.by_pixel(5.75, -3.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/brown-hairy-grass/brown-hairy-grass-19.png",
        priority = base_decorative_sprite_priority,
        width = 21,
        height = 17,
        shift = util.by_pixel(1.5, 0.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/brown-hairy-grass/hr-brown-hairy-grass-19.png",
          priority = base_decorative_sprite_priority,
          width = 43,
          height = 34,
          shift = util.by_pixel(1.75, 0),
          scale = 0.5
        }
      }
    }
  },

  {
    name = "rock-huge",
    type = "simple-entity",
    flags = {"placeable-neutral", "placeable-off-grid", "not-on-map"},
    icon = "__base__/graphics/icons/rock-huge.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "grass",
    order = "b[decorative]-l[rock]-a[huge]",
    collision_box = {{-1.5, -1.1}, {1.5, 1.1}},
    selection_box = {{-1.7, -1.3}, {1.7, 1.3}},
    damaged_trigger_effect = hit_effects.rock(),
    dying_trigger_effect = decorative_trigger_effects.huge_rock(),
    minable =
    {
      mining_particle = "stone-particle",
      mining_time = 3,
      results = {{name = "stone", amount_min = 24, amount_max = 50}, {name = "coal", amount_min = 24, amount_max = 50}},
      --count = 200
    },
    loot =
    {
      {item = "stone", probability = 1, count_min = 25, count_max = 50}
    },
    count_as_rock_for_filtered_deconstruction = true,
    mined_sound = { filename = "__base__/sound/deconstruct-bricks.ogg" },
    vehicle_impact_sound = sounds.car_stone_impact,
    render_layer = "object",
    max_health = 2000,
    resistances =
    {
      {
        type = "fire",
        percent = 100
      }
    },
    autoplace = rock_autoplace_settings(0.125, "a[huge]", {{0, 0.65}, {1, 1}}),
    pictures =
    {
      {
        filename = "__base__/graphics/decorative/rock-huge/rock-huge-05.png",
        width = 101,
        height = 90,
        shift = {0.25, 0.0625},
        hr_version =
        {
          filename = "__base__/graphics/decorative/rock-huge/hr-rock-huge-05.png",
          width = 201,
          height = 179,
          scale = 0.5,
          shift = {0.25, 0.0625}
        }
      },
      {
        filename = "__base__/graphics/decorative/rock-huge/rock-huge-06.png",
        width = 117,
        height = 86,
        shift = {0.4375, 0.046875},
        hr_version =
        {
          filename = "__base__/graphics/decorative/rock-huge/hr-rock-huge-06.png",
          width = 233,
          height = 171,
          scale = 0.5,
          shift = {0.429688, 0.046875}
        }
      },
      {
        filename = "__base__/graphics/decorative/rock-huge/rock-huge-07.png",
        width = 120,
        height = 96,
        shift = {0.390625, 0.03125},
        hr_version =
        {
          filename = "__base__/graphics/decorative/rock-huge/hr-rock-huge-07.png",
          width = 240,
          height = 192,
          scale = 0.5,
          shift = {0.398438, 0.03125}
        }
      },
      {
        filename = "__base__/graphics/decorative/rock-huge/rock-huge-08.png",
        width = 110,
        height = 88,
        shift = {0.140625, 0.125},
        hr_version =
        {
          filename = "__base__/graphics/decorative/rock-huge/hr-rock-huge-08.png",
          width = 219,
          height = 175,
          scale = 0.5,
          shift = {0.148438, 0.132812}
        }
      },
      {
        filename = "__base__/graphics/decorative/rock-huge/rock-huge-09.png",
        width = 120,
        height = 104,
        shift = {0.3125, 0.0625},
        hr_version =
        {
          filename = "__base__/graphics/decorative/rock-huge/hr-rock-huge-09.png",
          width = 240,
          height = 208,
          scale = 0.5,
          shift = {0.3125, 0.0625}
        }
      },
      {
        filename = "__base__/graphics/decorative/rock-huge/rock-huge-10.png",
        width = 122,
        height = 95,
        shift = {0.1875, 0.046875},
        hr_version =
        {
          filename = "__base__/graphics/decorative/rock-huge/hr-rock-huge-10.png",
          width = 243,
          height = 190,
          scale = 0.5,
          shift = {0.1875, 0.046875}
        }
      },
      {
        filename = "__base__/graphics/decorative/rock-huge/rock-huge-11.png",
        width = 125,
        height = 93,
        shift = {0.390625, 0.0625},
        hr_version =
        {
          filename = "__base__/graphics/decorative/rock-huge/hr-rock-huge-11.png",
          width = 249,
          height = 185,
          scale = 0.5,
          shift = {0.398438, 0.0546875}
        }
      },
      {
        filename = "__base__/graphics/decorative/rock-huge/rock-huge-12.png",
        width = 137,
        height = 82,
        shift = {0.34375, 0.03125},
        hr_version =
        {
          filename = "__base__/graphics/decorative/rock-huge/hr-rock-huge-12.png",
          width = 273,
          height = 163,
          scale = 0.5,
          shift = {0.34375, 0.0390625}
        }
      },
      {
        filename = "__base__/graphics/decorative/rock-huge/rock-huge-13.png",
        width = 138,
        height = 88,
        shift = {0.265625, 0.03125},
        hr_version =
        {
          filename = "__base__/graphics/decorative/rock-huge/hr-rock-huge-13.png",
          width = 275,
          height = 175,
          scale = 0.5,
          shift = {0.273438, 0.0234375}
        }
      },
      {
        filename = "__base__/graphics/decorative/rock-huge/rock-huge-14.png",
        width = 121,
        height = 108,
        shift = {0.203125, 0.046875},
        hr_version =
        {
          filename = "__base__/graphics/decorative/rock-huge/hr-rock-huge-14.png",
          width = 241,
          height = 215,
          scale = 0.5,
          shift = {0.195312, 0.0390625}
        }
      },
      {
        filename = "__base__/graphics/decorative/rock-huge/rock-huge-15.png",
        width = 159,
        height = 91,
        shift = {0.515625, 0.03125},
        hr_version =
        {
          filename = "__base__/graphics/decorative/rock-huge/hr-rock-huge-15.png",
          width = 318,
          height = 181,
          scale = 0.5,
          shift = {0.523438, 0.03125}
        }
      },
      {
        filename = "__base__/graphics/decorative/rock-huge/rock-huge-16.png",
        width = 109,
        height = 112,
        shift = {0.046875, 0.015625},
        hr_version =
        {
          filename = "__base__/graphics/decorative/rock-huge/hr-rock-huge-16.png",
          width = 217,
          height = 224,
          scale = 0.5,
          shift = {0.0546875, 0.0234375}
        }
      },
      {
        filename = "__base__/graphics/decorative/rock-huge/rock-huge-17.png",
        width = 166,
        height = 114,
        shift = {0.234375, 0.046875},
        hr_version =
        {
          filename = "__base__/graphics/decorative/rock-huge/hr-rock-huge-17.png",
          width = 332,
          height = 228,
          scale = 0.5,
          shift = {0.226562, 0.046875}
        }
      },
      {
        filename = "__base__/graphics/decorative/rock-huge/rock-huge-18.png",
        width = 145,
        height = 122,
        shift = {0.203125, 0.03125},
        hr_version =
        {
          filename = "__base__/graphics/decorative/rock-huge/hr-rock-huge-18.png",
          width = 290,
          height = 243,
          scale = 0.5,
          shift = {0.195312, 0.0390625}
        }
      },
      {
        filename = "__base__/graphics/decorative/rock-huge/rock-huge-19.png",
        width = 175,
        height = 113,
        shift = {0.609375, 0.015625},
        hr_version =
        {
          filename = "__base__/graphics/decorative/rock-huge/hr-rock-huge-19.png",
          width = 349,
          height = 225,
          scale = 0.5,
          shift = {0.609375, 0.0234375}
        }
      },
      {
        filename = "__base__/graphics/decorative/rock-huge/rock-huge-20.png",
        width = 144,
        height = 125,
        shift = {0.140625, 0.03125},
        hr_version =
        {
          filename = "__base__/graphics/decorative/rock-huge/hr-rock-huge-20.png",
          width = 287,
          height = 250,
          scale = 0.5,
          shift = {0.132812, 0.03125}
        }
      }
    }
  },
  {
    name = "rock-big",
    type = "simple-entity",
    flags = {"placeable-neutral", "placeable-off-grid", "not-on-map"},
    icon = "__base__/graphics/icons/rock-big.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "grass",
    order = "b[decorative]-l[rock]-b[big]",
    collision_box = {{-1.0, -0.9}, {1.0, 1.0}},
    selection_box = {{-1.2, -1.2}, {1.2, 1.2}},
    damaged_trigger_effect = hit_effects.rock(),
    dying_trigger_effect = decorative_trigger_effects.big_rock(),
    minable =
    {
      mining_particle = "stone-particle",
      mining_time = 2,
      result = "stone",
      count = 20
    },
    loot =
    {
      {item = "stone", probability = 1, count_min = 9, count_max = 25}
    },
    count_as_rock_for_filtered_deconstruction = true,
    mined_sound = { filename = "__base__/sound/deconstruct-bricks.ogg" },
    vehicle_impact_sound = sounds.car_stone_impact,
    render_layer = "object",
    max_health = 500,
    resistances =
    {
      {
        type = "fire",
        percent = 100
      }
    },
    autoplace = rock_autoplace_settings(0.25, "b[big]", {{0, 0.65}, {1, 1}}),
    pictures =
    {
      {
        filename = "__base__/graphics/decorative/rock-big/rock-big-01.png",
        width = 94,
        height = 64,
        shift = {-0.046875, 0.171875},
        hr_version =
        {
          filename = "__base__/graphics/decorative/rock-big/hr-rock-big-01.png",
          width = 188,
          height = 127,
          scale = 0.5,
          shift = {-0.046875, 0.171875}
        }
      },
      {
        filename = "__base__/graphics/decorative/rock-big/rock-big-02.png",
        width = 98,
        height = 68,
        shift = {0.4375, 0.125},
        hr_version =
        {
          filename = "__base__/graphics/decorative/rock-big/hr-rock-big-02.png",
          width = 195,
          height = 135,
          scale = 0.5,
          shift = {0.445312, 0.125}
        }
      },
      {
        filename = "__base__/graphics/decorative/rock-big/rock-big-03.png",
        width = 103,
        height = 66,
        shift = {0.484375, 0.0625},
        hr_version =
        {
          filename = "__base__/graphics/decorative/rock-big/hr-rock-big-03.png",
          width = 205,
          height = 132,
          scale = 0.5,
          shift = {0.484375, 0.0546875}
        }
      },
      {
        filename = "__base__/graphics/decorative/rock-big/rock-big-04.png",
        width = 72,
        height = 71,
        shift = {0.21875, 0.046875},
        hr_version =
        {
          filename = "__base__/graphics/decorative/rock-big/hr-rock-big-04.png",
          width = 144,
          height = 142,
          scale = 0.5,
          shift = {0.210938, 0.0390625}
        }
      },
      {
        filename = "__base__/graphics/decorative/rock-big/rock-big-05.png",
        width = 65,
        height = 54,
        shift = {0.015625, 0.21875},
        hr_version =
        {
          filename = "__base__/graphics/decorative/rock-big/hr-rock-big-05.png",
          width = 130,
          height = 107,
          scale = 0.5,
          shift = {0.0234375, 0.226562}
        }
      },
      {
        filename = "__base__/graphics/decorative/rock-big/rock-big-06.png",
        width = 83,
        height = 55,
        shift = {0.15625, 0.234375},
        hr_version =
        {
          filename = "__base__/graphics/decorative/rock-big/hr-rock-big-06.png",
          width = 165,
          height = 109,
          scale = 0.5,
          shift = {0.15625, 0.226562}
        }
      },
      {
        filename = "__base__/graphics/decorative/rock-big/rock-big-07.png",
        width = 75,
        height = 67,
        shift = {0.265625, 0.15625},
        hr_version =
        {
          filename = "__base__/graphics/decorative/rock-big/hr-rock-big-07.png",
          width = 150,
          height = 133,
          scale = 0.5,
          shift = {0.257812, 0.148438}
        }
      },
      {
        filename = "__base__/graphics/decorative/rock-big/rock-big-08.png",
        width = 78,
        height = 56,
        shift = {0.09375, 0.171875},
        hr_version =
        {
          filename = "__base__/graphics/decorative/rock-big/hr-rock-big-08.png",
          width = 156,
          height = 111,
          scale = 0.5,
          shift = {0.0859375, 0.179688}
        }
      },
      {
        filename = "__base__/graphics/decorative/rock-big/rock-big-09.png",
        width = 94,
        height = 60,
        shift = {0.078125, 0.09375},
        hr_version =
        {
          filename = "__base__/graphics/decorative/rock-big/hr-rock-big-09.png",
          width = 187,
          height = 120,
          scale = 0.5,
          shift = {0.078125, 0.0859375}
        }
      },
      {
        filename = "__base__/graphics/decorative/rock-big/rock-big-10.png",
        width = 113,
        height = 64,
        shift = {-0.15625, 0.078125},
        hr_version =
        {
          filename = "__base__/graphics/decorative/rock-big/hr-rock-big-10.png",
          width = 225,
          height = 128,
          scale = 0.5,
          shift = {-0.15625, 0.0703125}
        }
      },
      {
        filename = "__base__/graphics/decorative/rock-big/rock-big-11.png",
        width = 92,
        height = 72,
        shift = {0.203125, 0.265625},
        hr_version =
        {
          filename = "__base__/graphics/decorative/rock-big/hr-rock-big-11.png",
          width = 183,
          height = 144,
          scale = 0.5,
          shift = {0.195312, 0.257812}
        }
      },
      {
        filename = "__base__/graphics/decorative/rock-big/rock-big-12.png",
        width = 79,
        height = 69,
        shift = {0.046875, 0.15625},
        hr_version =
        {
          filename = "__base__/graphics/decorative/rock-big/hr-rock-big-12.png",
          width = 158,
          height = 138,
          scale = 0.5,
          shift = {0.0390625, 0.15625}
        }
      },
      {
        filename = "__base__/graphics/decorative/rock-big/rock-big-13.png",
        width = 94,
        height = 75,
        shift = {0.21875, 0.21875},
        hr_version =
        {
          filename = "__base__/graphics/decorative/rock-big/hr-rock-big-13.png",
          width = 188,
          height = 150,
          scale = 0.5,
          shift = {0.226562, 0.21875}
        }
      },
      {
        filename = "__base__/graphics/decorative/rock-big/rock-big-14.png",
        width = 93,
        height = 80,
        shift = {0.125, 0.0625},
        hr_version =
        {
          filename = "__base__/graphics/decorative/rock-big/hr-rock-big-14.png",
          width = 186,
          height = 160,
          scale = 0.5,
          shift = {0.132812, 0.0625}
        }
      },
      {
        filename = "__base__/graphics/decorative/rock-big/rock-big-15.png",
        width = 91,
        height = 87,
        shift = {0.3125, -0.09375},
        hr_version =
        {
          filename = "__base__/graphics/decorative/rock-big/hr-rock-big-15.png",
          width = 181,
          height = 174,
          scale = 0.5,
          shift = {0.304688, -0.09375}
        }
      },
      {
        filename = "__base__/graphics/decorative/rock-big/rock-big-16.png",
        width = 106,
        height = 75,
        shift = {0.34375, 0.125},
        hr_version =
        {
          filename = "__base__/graphics/decorative/rock-big/hr-rock-big-16.png",
          width = 212,
          height = 150,
          scale = 0.5,
          shift = {0.335938, 0.117188}
        }
      },
      {
        filename = "__base__/graphics/decorative/rock-big/rock-big-17.png",
        width = 78,
        height = 59,
        shift = {0.25, 0.03125},
        hr_version =
        {
          filename = "__base__/graphics/decorative/rock-big/hr-rock-big-17.png",
          width = 155,
          height = 117,
          scale = 0.5,
          shift = {0.25, 0.0390625}
        }
      },
      {
        filename = "__base__/graphics/decorative/rock-big/rock-big-18.png",
        width = 71,
        height = 64,
        shift = {0.3125, 0.046875},
        hr_version =
        {
          filename = "__base__/graphics/decorative/rock-big/hr-rock-big-18.png",
          width = 141,
          height = 128,
          scale = 0.5,
          shift = {0.304688, 0.0390625}
        }
      },
      {
        filename = "__base__/graphics/decorative/rock-big/rock-big-19.png",
        width = 88,
        height = 57,
        shift = {0.390625, 0.03125},
        hr_version =
        {
          filename = "__base__/graphics/decorative/rock-big/hr-rock-big-19.png",
          width = 176,
          height = 114,
          scale = 0.5,
          shift = {0.390625, 0.0234375}
        }
      },
      {
        filename = "__base__/graphics/decorative/rock-big/rock-big-20.png",
        width = 60,
        height = 63,
        shift = {0.140625, 0.03125},
        hr_version =
        {
          filename = "__base__/graphics/decorative/rock-big/hr-rock-big-20.png",
          width = 120,
          height = 125,
          scale = 0.5,
          shift = {0.148438, 0.03125}
        }
      }
    }
  },
  {
    name = "rock-medium",
    type = "optimized-decorative",
    order = "b[decorative]-l[rock]-c[medium]",
    collision_box = {{-1.1, -1.1}, {1.1, 1.1}},
    render_layer = "decorative",
    autoplace = rock_autoplace_settings(0.5, "c[medium]", {{0, 0.3}, {1, 1}}),
    trigger_effect = decorative_trigger_effects.medium_rock(),
    pictures =
    {
      {
        filename = "__base__/graphics/decorative/rock-medium/rock-medium-01.png",
        priority = base_decorative_sprite_priority,
        width = 45,
        height = 32,
        shift = {0.078125, 0.109375},
        hr_version =
        {
          filename = "__base__/graphics/decorative/rock-medium/hr-rock-medium-01.png",
          priority = base_decorative_sprite_priority,
          width = 89,
          height = 63,
          scale = 0.5,
          shift = {0.078125, 0.109375}
        }
      },
      {
        filename = "__base__/graphics/decorative/rock-medium/rock-medium-02.png",
        priority = base_decorative_sprite_priority,
        width = 39,
        height = 33,
        shift = {0.015625, 0.125},
        hr_version =
        {
          filename = "__base__/graphics/decorative/rock-medium/hr-rock-medium-02.png",
          priority = base_decorative_sprite_priority,
          width = 77,
          height = 66,
          scale = 0.5,
          shift = {0.015625, 0.132812}
        }
      },
      {
        filename = "__base__/graphics/decorative/rock-medium/rock-medium-03.png",
        priority = base_decorative_sprite_priority,
        width = 46,
        height = 32,
        shift = {0.140625, 0.171875},
        hr_version =
        {
          filename = "__base__/graphics/decorative/rock-medium/hr-rock-medium-03.png",
          priority = base_decorative_sprite_priority,
          width = 92,
          height = 63,
          scale = 0.5,
          shift = {0.148438, 0.179688}
        }
      },
      {
        filename = "__base__/graphics/decorative/rock-medium/rock-medium-04.png",
        priority = base_decorative_sprite_priority,
        width = 46,
        height = 30,
        shift = {0, 0.1875},
        hr_version =
        {
          filename = "__base__/graphics/decorative/rock-medium/hr-rock-medium-04.png",
          priority = base_decorative_sprite_priority,
          width = 91,
          height = 59,
          scale = 0.5,
          shift = {-0.0078125, 0.1875}
        }
      },
      {
        filename = "__base__/graphics/decorative/rock-medium/rock-medium-05.png",
        priority = base_decorative_sprite_priority,
        width = 52,
        height = 36,
        shift = {0.203125, 0.171875},
        hr_version =
        {
          filename = "__base__/graphics/decorative/rock-medium/hr-rock-medium-05.png",
          priority = base_decorative_sprite_priority,
          width = 104,
          height = 72,
          scale = 0.5,
          shift = {0.203125, 0.179688}
        }
      },
      {
        filename = "__base__/graphics/decorative/rock-medium/rock-medium-06.png",
        priority = base_decorative_sprite_priority,
        width = 42,
        height = 41,
        shift = {0.015625, 0.21875},
        hr_version =
        {
          filename = "__base__/graphics/decorative/rock-medium/hr-rock-medium-06.png",
          priority = base_decorative_sprite_priority,
          width = 83,
          height = 82,
          scale = 0.5,
          shift = {0.015625, 0.21875}
        }
      },
      {
        filename = "__base__/graphics/decorative/rock-medium/rock-medium-07.png",
        priority = base_decorative_sprite_priority,
        width = 56,
        height = 33,
        shift = {0.0625, 0.3125},
        hr_version =
        {
          filename = "__base__/graphics/decorative/rock-medium/hr-rock-medium-07.png",
          priority = base_decorative_sprite_priority,
          width = 111,
          height = 65,
          scale = 0.5,
          shift = {0.0625, 0.3125}
        }
      },
      {
        filename = "__base__/graphics/decorative/rock-medium/rock-medium-08.png",
        priority = base_decorative_sprite_priority,
        width = 40,
        height = 41,
        shift = {0.109375, 0.140625},
        hr_version =
        {
          filename = "__base__/graphics/decorative/rock-medium/hr-rock-medium-08.png",
          priority = base_decorative_sprite_priority,
          width = 79,
          height = 81,
          scale = 0.5,
          shift = {0.109375, 0.148438}
        }
      },
      {
        filename = "__base__/graphics/decorative/rock-medium/rock-medium-09.png",
        priority = base_decorative_sprite_priority,
        width = 49,
        height = 28,
        shift = {0.015625, 0.140625},
        hr_version =
        {
          filename = "__base__/graphics/decorative/rock-medium/hr-rock-medium-09.png",
          priority = base_decorative_sprite_priority,
          width = 98,
          height = 56,
          scale = 0.5,
          shift = {0.015625, 0.140625}
        }
      },
      {
        filename = "__base__/graphics/decorative/rock-medium/rock-medium-10.png",
        priority = base_decorative_sprite_priority,
        width = 46,
        height = 34,
        shift = {0, 0.140625},
        hr_version =
        {
          filename = "__base__/graphics/decorative/rock-medium/hr-rock-medium-10.png",
          priority = base_decorative_sprite_priority,
          width = 91,
          height = 68,
          scale = 0.5,
          shift = {0, 0.132812}
        }
      },
      {
        filename = "__base__/graphics/decorative/rock-medium/rock-medium-11.png",
        priority = base_decorative_sprite_priority,
        width = 53,
        height = 36,
        shift = {-0.03125, 0.125},
        hr_version =
        {
          filename = "__base__/graphics/decorative/rock-medium/hr-rock-medium-11.png",
          priority = base_decorative_sprite_priority,
          width = 105,
          height = 71,
          scale = 0.5,
          shift = {-0.0234375, 0.125}
        }
      },
      {
        filename = "__base__/graphics/decorative/rock-medium/rock-medium-12.png",
        priority = base_decorative_sprite_priority,
        width = 39,
        height = 40,
        shift = {0.078125, -0.015625},
        hr_version =
        {
          filename = "__base__/graphics/decorative/rock-medium/hr-rock-medium-12.png",
          priority = base_decorative_sprite_priority,
          width = 78,
          height = 80,
          scale = 0.5,
          shift = {0.078125, -0.015625}
        }
      }
    }
  },
  {
    name = "rock-small",
    type = "optimized-decorative",
    order = "b[decorative]-l[rock]-d[small]",
    collision_box = {{-0.8, -0.8}, {0.8, 0.8}},
    render_layer = "decorative",
    walking_sound = sounds.pebble,
    autoplace = rock_autoplace_settings(1, "d[small]", {{0, 0.3}, {1, 1}}),
    trigger_effect = decorative_trigger_effects.small_rock(),
    pictures =
    {
      {
        filename = "__base__/graphics/decorative/rock-small/rock-small-01.png",
        priority = base_decorative_sprite_priority,
        width = 26,
        height = 19,
        shift = {0.0625, 0.125},
        hr_version =
        {
          filename = "__base__/graphics/decorative/rock-small/hr-rock-small-01.png",
          priority = base_decorative_sprite_priority,
          width = 51,
          height = 37,
          scale = 0.5,
          shift = {0.0546875, 0.117188}
        }
      },
      {
        filename = "__base__/graphics/decorative/rock-small/rock-small-02.png",
        priority = base_decorative_sprite_priority,
        width = 26,
        height = 18,
        shift = {0.046875, 0.078125},
        hr_version =
        {
          filename = "__base__/graphics/decorative/rock-small/hr-rock-small-02.png",
          priority = base_decorative_sprite_priority,
          width = 52,
          height = 35,
          scale = 0.5,
          shift = {0.0390625, 0.078125}
        }
      },
      {
        filename = "__base__/graphics/decorative/rock-small/rock-small-03.png",
        priority = base_decorative_sprite_priority,
        width = 23,
        height = 21,
        shift = {-0.015625, 0.140625},
        hr_version =
        {
          filename = "__base__/graphics/decorative/rock-small/hr-rock-small-03.png",
          priority = base_decorative_sprite_priority,
          width = 46,
          height = 42,
          scale = 0.5,
          shift = {-0.0078125, 0.148438}
        }
      },
      {
        filename = "__base__/graphics/decorative/rock-small/rock-small-04.png",
        priority = base_decorative_sprite_priority,
        width = 27,
        height = 17,
        shift = {0.015625, 0.15625},
        hr_version =
        {
          filename = "__base__/graphics/decorative/rock-small/hr-rock-small-04.png",
          priority = base_decorative_sprite_priority,
          width = 53,
          height = 33,
          scale = 0.5,
          shift = {0.0234375, 0.15625}
        }
      },
      {
        filename = "__base__/graphics/decorative/rock-small/rock-small-05.png",
        priority = base_decorative_sprite_priority,
        width = 24,
        height = 23,
        shift = {0.046875, 0.140625},
        hr_version =
        {
          filename = "__base__/graphics/decorative/rock-small/hr-rock-small-05.png",
          priority = base_decorative_sprite_priority,
          width = 47,
          height = 46,
          scale = 0.5,
          shift = {0.0390625, 0.140625}
        }
      },
      {
        filename = "__base__/graphics/decorative/rock-small/rock-small-06.png",
        priority = base_decorative_sprite_priority,
        width = 31,
        height = 21,
        shift = {-0.03125, 0.09375},
        hr_version =
        {
          filename = "__base__/graphics/decorative/rock-small/hr-rock-small-06.png",
          priority = base_decorative_sprite_priority,
          width = 62,
          height = 41,
          scale = 0.5,
          shift = {-0.03125, 0.09375}
        }
      },
      {
        filename = "__base__/graphics/decorative/rock-small/rock-small-07.png",
        priority = base_decorative_sprite_priority,
        width = 32,
        height = 18,
        shift = {-0.015625, 0.078125},
        hr_version =
        {
          filename = "__base__/graphics/decorative/rock-small/hr-rock-small-07.png",
          priority = base_decorative_sprite_priority,
          width = 64,
          height = 36,
          scale = 0.5,
          shift = {-0.015625, 0.0703125}
        }
      },
      {
        filename = "__base__/graphics/decorative/rock-small/rock-small-08.png",
        priority = base_decorative_sprite_priority,
        width = 33,
        height = 16,
        shift = {-0.71875, -0.171875},
        hr_version =
        {
          filename = "__base__/graphics/decorative/rock-small/hr-rock-small-08.png",
          priority = base_decorative_sprite_priority,
          width = 65,
          height = 31,
          scale = 0.5,
          shift = {-0.71875, -0.164062}
        }
      },
      {
        filename = "__base__/graphics/decorative/rock-small/rock-small-09.png",
        priority = base_decorative_sprite_priority,
        width = 23,
        height = 17,
        shift = {-0.09375, 0.109375},
        hr_version =
        {
          filename = "__base__/graphics/decorative/rock-small/hr-rock-small-09.png",
          priority = base_decorative_sprite_priority,
          width = 46,
          height = 34,
          scale = 0.5,
          shift = {-0.0859375, 0.101562}
        }
      },
      {
        filename = "__base__/graphics/decorative/rock-small/rock-small-10.png",
        priority = base_decorative_sprite_priority,
        width = 24,
        height = 17,
        shift = {0, 0.125},
        hr_version =
        {
          filename = "__base__/graphics/decorative/rock-small/hr-rock-small-10.png",
          priority = base_decorative_sprite_priority,
          width = 48,
          height = 34,
          scale = 0.5,
          shift = {0.0078125, 0.125}
        }
      },
      {
        filename = "__base__/graphics/decorative/rock-small/rock-small-11.png",
        priority = base_decorative_sprite_priority,
        width = 26,
        height = 17,
        shift = {-0.09375, 0.078125},
        hr_version =
        {
          filename = "__base__/graphics/decorative/rock-small/hr-rock-small-11.png",
          priority = base_decorative_sprite_priority,
          width = 51,
          height = 33,
          scale = 0.5,
          shift = {-0.0859375, 0.078125}
        }
      },
      {
        filename = "__base__/graphics/decorative/rock-small/rock-small-12.png",
        priority = base_decorative_sprite_priority,
        width = 24,
        height = 20,
        shift = {0.078125, 0.109375},
        hr_version =
        {
          filename = "__base__/graphics/decorative/rock-small/hr-rock-small-12.png",
          priority = base_decorative_sprite_priority,
          width = 47,
          height = 39,
          scale = 0.5,
          shift = {0.078125, 0.117188}
        }
      },
      {
        filename = "__base__/graphics/decorative/rock-small/rock-small-13.png",
        priority = base_decorative_sprite_priority,
        width = 22,
        height = 17,
        shift = {0, 0.09375},
        hr_version =
        {
          filename = "__base__/graphics/decorative/rock-small/hr-rock-small-13.png",
          priority = base_decorative_sprite_priority,
          width = 43,
          height = 33,
          scale = 0.5,
          shift = {0, 0.09375}
        }
      },
      {
        filename = "__base__/graphics/decorative/rock-small/rock-small-14.png",
        priority = base_decorative_sprite_priority,
        width = 22,
        height = 15,
        shift = {0.046875, 0.140625},
        hr_version =
        {
          filename = "__base__/graphics/decorative/rock-small/hr-rock-small-14.png",
          priority = base_decorative_sprite_priority,
          width = 43,
          height = 30,
          scale = 0.5,
          shift = {0.046875, 0.140625}
        }
      },
      {
        filename = "__base__/graphics/decorative/rock-small/rock-small-15.png",
        priority = base_decorative_sprite_priority,
        width = 21,
        height = 19,
        shift = {0, 0.140625},
        hr_version =
        {
          filename = "__base__/graphics/decorative/rock-small/hr-rock-small-15.png",
          priority = base_decorative_sprite_priority,
          width = 41,
          height = 37,
          scale = 0.5,
          shift = {0, 0.140625}
        }
      },
      {
        filename = "__base__/graphics/decorative/rock-small/rock-small-16.png",
        priority = base_decorative_sprite_priority,
        width = 23,
        height = 17,
        shift = {0.015625, 0.125},
        hr_version =
        {
          filename = "__base__/graphics/decorative/rock-small/hr-rock-small-16.png",
          priority = base_decorative_sprite_priority,
          width = 46,
          height = 33,
          scale = 0.5,
          shift = {0.0234375, 0.125}
        }
      }
    }
  },
  {
    name = "rock-tiny",
    type = "optimized-decorative",
    order = "b[decorative]-l[rock]-e[tiny]",
    collision_box = {{-0.1, -0.1}, {0.1, 0.1}},
    render_layer = "decorative",
    walking_sound = sounds.pebble,
    autoplace = rock_autoplace_settings(1.1, "e[tiny]", {{0, 0.3}, {1, 1}}),
    trigger_effect = decorative_trigger_effects.tiny_rock(),
    pictures =
    {
      {
        filename = "__base__/graphics/decorative/rock-tiny/rock-tiny-01.png",
        priority = base_decorative_sprite_priority,
        width = 15,
        height = 11,
        shift = {0.03125, 0.015625},
        hr_version =
        {
          filename = "__base__/graphics/decorative/rock-tiny/hr-rock-tiny-01.png",
          priority = base_decorative_sprite_priority,
          width = 29,
          height = 21,
          scale = 0.5,
          shift = {0.0390625, 0.0234375}
        }
      },
      {
        filename = "__base__/graphics/decorative/rock-tiny/rock-tiny-02.png",
        priority = base_decorative_sprite_priority,
        width = 15,
        height = 10,
        shift = {0, 0.03125},
        hr_version =
        {
          filename = "__base__/graphics/decorative/rock-tiny/hr-rock-tiny-02.png",
          priority = base_decorative_sprite_priority,
          width = 30,
          height = 19,
          scale = 0.5,
          shift = {0.0078125, 0.0234375}
        }
      },
      {
        filename = "__base__/graphics/decorative/rock-tiny/rock-tiny-03.png",
        priority = base_decorative_sprite_priority,
        width = 15,
        height = 12,
        shift = {0.015625, 0.015625},
        hr_version =
        {
          filename = "__base__/graphics/decorative/rock-tiny/hr-rock-tiny-03.png",
          priority = base_decorative_sprite_priority,
          width = 29,
          height = 24,
          scale = 0.5,
          shift = {0.0234375, 0.0234375}
        }
      },
      {
        filename = "__base__/graphics/decorative/rock-tiny/rock-tiny-04.png",
        priority = base_decorative_sprite_priority,
        width = 16,
        height = 10,
        shift = {0.03125, 0.015625},
        hr_version =
        {
          filename = "__base__/graphics/decorative/rock-tiny/hr-rock-tiny-04.png",
          priority = base_decorative_sprite_priority,
          width = 32,
          height = 20,
          scale = 0.5,
          shift = {0.03125, 0.015625}
        }
      },
      {
        filename = "__base__/graphics/decorative/rock-tiny/rock-tiny-05.png",
        priority = base_decorative_sprite_priority,
        width = 15,
        height = 13,
        shift = {0, -0.015625},
        hr_version =
        {
          filename = "__base__/graphics/decorative/rock-tiny/hr-rock-tiny-05.png",
          priority = base_decorative_sprite_priority,
          width = 29,
          height = 25,
          scale = 0.5,
          shift = {0, -0.0078125}
        }
      },
      {
        filename = "__base__/graphics/decorative/rock-tiny/rock-tiny-06.png",
        priority = base_decorative_sprite_priority,
        width = 18,
        height = 12,
        shift = {0, -0.03125},
        hr_version =
        {
          filename = "__base__/graphics/decorative/rock-tiny/hr-rock-tiny-06.png",
          priority = base_decorative_sprite_priority,
          width = 36,
          height = 24,
          scale = 0.5,
          shift = {0, -0.0234375}
        }
      },
      {
        filename = "__base__/graphics/decorative/rock-tiny/rock-tiny-07.png",
        priority = base_decorative_sprite_priority,
        width = 39,
        height = 17,
        shift = {-0.34375, -0.140625},
        hr_version =
        {
          filename = "__base__/graphics/decorative/rock-tiny/hr-rock-tiny-07.png",
          priority = base_decorative_sprite_priority,
          width = 78,
          height = 34,
          scale = 0.5,
          shift = {-0.34375, -0.132812}
        }
      },
      {
        filename = "__base__/graphics/decorative/rock-tiny/rock-tiny-08.png",
        priority = base_decorative_sprite_priority,
        width = 18,
        height = 10,
        shift = {-0.03125, 0},
        hr_version =
        {
          filename = "__base__/graphics/decorative/rock-tiny/hr-rock-tiny-08.png",
          priority = base_decorative_sprite_priority,
          width = 35,
          height = 19,
          scale = 0.5,
          shift = {-0.03125, 0}
        }
      },
      {
        filename = "__base__/graphics/decorative/rock-tiny/rock-tiny-09.png",
        priority = base_decorative_sprite_priority,
        width = 14,
        height = 10,
        shift = {0.015625, 0.015625},
        hr_version =
        {
          filename = "__base__/graphics/decorative/rock-tiny/hr-rock-tiny-09.png",
          priority = base_decorative_sprite_priority,
          width = 28,
          height = 20,
          scale = 0.5,
          shift = {0.0234375, 0.015625}
        }
      },
      {
        filename = "__base__/graphics/decorative/rock-tiny/rock-tiny-10.png",
        priority = base_decorative_sprite_priority,
        width = 15,
        height = 10,
        shift = {0.015625, -0.03125},
        hr_version =
        {
          filename = "__base__/graphics/decorative/rock-tiny/hr-rock-tiny-10.png",
          priority = base_decorative_sprite_priority,
          width = 29,
          height = 20,
          scale = 0.5,
          shift = {0.0078125, -0.0234375}
        }
      },
      {
        filename = "__base__/graphics/decorative/rock-tiny/rock-tiny-11.png",
        priority = base_decorative_sprite_priority,
        width = 15,
        height = 10,
        shift = {0.046875, 0},
        hr_version =
        {
          filename = "__base__/graphics/decorative/rock-tiny/hr-rock-tiny-11.png",
          priority = base_decorative_sprite_priority,
          width = 29,
          height = 20,
          scale = 0.5,
          shift = {0.046875, 0.0078125}
        }
      },
      {
        filename = "__base__/graphics/decorative/rock-tiny/rock-tiny-12.png",
        priority = base_decorative_sprite_priority,
        width = 15,
        height = 11,
        shift = {0.015625, 0},
        hr_version =
        {
          filename = "__base__/graphics/decorative/rock-tiny/hr-rock-tiny-12.png",
          priority = base_decorative_sprite_priority,
          width = 29,
          height = 22,
          scale = 0.5,
          shift = {0.015625, 0}
        }
      },
      {
        filename = "__base__/graphics/decorative/rock-tiny/rock-tiny-13.png",
        priority = base_decorative_sprite_priority,
        width = 14,
        height = 10,
        shift = {0.03125, 0.015625},
        hr_version =
        {
          filename = "__base__/graphics/decorative/rock-tiny/hr-rock-tiny-13.png",
          priority = base_decorative_sprite_priority,
          width = 27,
          height = 19,
          scale = 0.5,
          shift = {0.03125, 0.015625}
        }
      },
      {
        filename = "__base__/graphics/decorative/rock-tiny/rock-tiny-14.png",
        priority = base_decorative_sprite_priority,
        width = 14,
        height = 10,
        shift = {0.015625, 0.015625},
        hr_version =
        {
          filename = "__base__/graphics/decorative/rock-tiny/hr-rock-tiny-14.png",
          priority = base_decorative_sprite_priority,
          width = 27,
          height = 19,
          scale = 0.5,
          shift = {0.0078125, 0.0078125}
        }
      },
      {
        filename = "__base__/graphics/decorative/rock-tiny/rock-tiny-15.png",
        priority = base_decorative_sprite_priority,
        width = 13,
        height = 11,
        shift = {0, 0.015625},
        hr_version =
        {
          filename = "__base__/graphics/decorative/rock-tiny/hr-rock-tiny-15.png",
          priority = base_decorative_sprite_priority,
          width = 26,
          height = 22,
          scale = 0.5,
          shift = {0.0078125, 0.015625}
        }
      },
      {
        filename = "__base__/graphics/decorative/rock-tiny/rock-tiny-16.png",
        priority = base_decorative_sprite_priority,
        width = 14,
        height = 10,
        shift = {0.03125, 0},
        hr_version =
        {
          filename = "__base__/graphics/decorative/rock-tiny/hr-rock-tiny-16.png",
          priority = base_decorative_sprite_priority,
          width = 27,
          height = 20,
          scale = 0.5,
          shift = {0.03125, 0.0078125}
        }
      }
    }
  },

  {
    name = "sand-rock-big",
    type = "simple-entity",
    flags = {"placeable-neutral", "placeable-off-grid", "not-on-map"},
    icon = "__base__/graphics/icons/sand-rock-big.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "grass",
    order = "b[decorative]-l[rock]-a[big]",
    collision_box = {{-0.75, -0.75}, {0.75, 0.75}},
    selection_box = {{-1.0, -1.0}, {1.0, 0.75}},
    damaged_trigger_effect = hit_effects.rock(),
    render_layer = "object",
    max_health = 500,
    autoplace = rock_autoplace_settings(0.25, "b[big]", {{0, 0}, {0.4, 0.2}}),
    dying_trigger_effect = decorative_trigger_effects.big_rock(),
    minable =
    {
      mining_particle = "stone-particle",
      mining_time = 2,
      results = {{name = "stone", amount_min = 19, amount_max = 25}}
    },
    loot =
    {
      {item = "stone", probability = 1, count_min = 10, count_max = 15}
    },
    resistances =
    {
      {
        type = "fire",
        percent = 100
      }
    },
    count_as_rock_for_filtered_deconstruction = true,
    mined_sound = { filename = "__base__/sound/deconstruct-bricks.ogg" },
    vehicle_impact_sound = sounds.car_stone_impact,
    pictures =
    {
      {
        filename = "__base__/graphics/decorative/sand-rock/sand-rock-big-01.png",
        width = 105,
        height = 69,
        shift = {0.296875, -0.4},
        hr_version =
        {
          filename = "__base__/graphics/decorative/sand-rock/hr-sand-rock-big-01.png",
          width = 209,
          height = 138,
          shift = {0.304688, -0.4},
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/sand-rock/sand-rock-big-02.png",
        width = 82,
        height = 65,
        shift = {0.0, 0.046875},
        hr_version =
        {
          filename = "__base__/graphics/decorative/sand-rock/hr-sand-rock-big-02.png",
          width = 165,
          height = 129,
          shift = {0.0, 0.0390625},
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/sand-rock/sand-rock-big-03.png",
        width = 76,
        height = 69,
        shift = {0.14375, 0.0},
        hr_version =
        {
          filename = "__base__/graphics/decorative/sand-rock/hr-sand-rock-big-03.png",
          width = 151,
          height = 139,
          shift = {0.151562, 0.0},
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/sand-rock/sand-rock-big-04.png",
        width = 108,
        height = 55,
        shift = {0.398438, 0.0},
        hr_version =
        {
          filename = "__base__/graphics/decorative/sand-rock/hr-sand-rock-big-04.png",
          width = 216,
          height = 110,
          shift = {0.390625, 0.0},
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/sand-rock/sand-rock-big-05.png",
        width = 77,
        height = 74,
        shift = {0.328125, 0.0625},
        hr_version =
        {
          filename = "__base__/graphics/decorative/sand-rock/hr-sand-rock-big-05.png",
          width = 154,
          height = 147,
          shift = {0.328125, 0.0703125},
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/sand-rock/sand-rock-big-06.png",
        width = 77,
        height = 66,
        shift = {0.16875, -0.1},
        hr_version =
        {
          filename = "__base__/graphics/decorative/sand-rock/hr-sand-rock-big-06.png",
          width = 154,
          height = 132,
          shift = {0.16875, -0.1},
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/sand-rock/sand-rock-big-07.png",
        width = 96,
        height = 65,
        shift = {0.3, -0.2},
        hr_version =
        {
          filename = "__base__/graphics/decorative/sand-rock/hr-sand-rock-big-07.png",
          width = 193,
          height = 130,
          shift = {0.3, -0.2},
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/sand-rock/sand-rock-big-08.png",
        width = 68,
        height = 59,
        shift = {0.0, 0.0},
        hr_version =
        {
          filename = "__base__/graphics/decorative/sand-rock/hr-sand-rock-big-08.png",
          width = 136,
          height = 117,
          shift = {0.0, 0.0},
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/sand-rock/sand-rock-big-09.png",
        width = 78,
        height = 58,
        shift = {0.2, 0.0},
        hr_version =
        {
          filename = "__base__/graphics/decorative/sand-rock/hr-sand-rock-big-09.png",
          width = 157,
          height = 115,
          shift = {0.1, 0.0},
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/sand-rock/sand-rock-big-10.png",
        width = 99,
        height = 77,
        shift = {0.325, -0.1},
        hr_version =
        {
          filename = "__base__/graphics/decorative/sand-rock/hr-sand-rock-big-10.png",
          width = 198,
          height = 153,
          shift = {0.325, -0.1},
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/sand-rock/sand-rock-big-11.png",
        width = 95,
        height = 58,
        shift = {0.453125, 0.0},
        hr_version =
        {
          filename = "__base__/graphics/decorative/sand-rock/hr-sand-rock-big-11.png",
          width = 190,
          height = 115,
          shift = {0.453125, 0.0},
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/sand-rock/sand-rock-big-12.png",
        width = 115,
        height = 63,
        shift = {0.546875, -0.015625},
        hr_version =
        {
          filename = "__base__/graphics/decorative/sand-rock/hr-sand-rock-big-12.png",
          width = 229,
          height = 126,
          shift = {0.539062, -0.015625},
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/sand-rock/sand-rock-big-13.png",
        width = 75,
        height = 63,
        shift = {0.0625, 0.171875},
        hr_version =
        {
          filename = "__base__/graphics/decorative/sand-rock/hr-sand-rock-big-13.png",
          width = 151,
          height = 125,
          shift = {0.0703125, 0.179688},
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/sand-rock/sand-rock-big-14.png",
        width = 69,
        height = 59,
        shift = {0.153125, 0.0},
        hr_version =
        {
          filename = "__base__/graphics/decorative/sand-rock/hr-sand-rock-big-14.png",
          width = 137,
          height = 117,
          shift = {0.160938, 0.0},
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/sand-rock/sand-rock-big-15.png",
        width = 100,
        height = 71,
        shift = {0.234375, -0.203125},
        hr_version =
        {
          filename = "__base__/graphics/decorative/sand-rock/hr-sand-rock-big-15.png",
          width = 201,
          height = 141,
          shift = {0.242188, -0.195312},
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/sand-rock/sand-rock-big-16.png",
        width = 104,
        height = 77,
        shift = {0.359375, -0.1},
        hr_version =
        {
          filename = "__base__/graphics/decorative/sand-rock/hr-sand-rock-big-16.png",
          width = 209,
          height = 154,
          shift = {0.351562, -0.1},
          scale = 0.5
        }
      }
    }
  },
  {
    name = "sand-rock-medium",
    type = "optimized-decorative",
    order = "d[remnants]-d[ship-wreck-grass]-b[small]",
    collision_box = {{-1.5, -0.5}, {1.5, 0.5}},
    render_layer = "floor",
    autoplace = rock_autoplace_settings(0.4, "c[medium]", {{0, 0}, {0.4, 0.2}}),
    trigger_effect = decorative_trigger_effects.medium_rock(),
    pictures =
    {
      {
        filename = "__base__/graphics/decorative/sand-rock/sand-rock-medium-01.png",
        priority = base_decorative_sprite_priority,
        width = 67,
        height = 41,
        shift = {0.328125, 0.515625},
        hr_version =
        {
          filename = "__base__/graphics/decorative/sand-rock/hr-sand-rock-medium-01.png",
          priority = base_decorative_sprite_priority,
          width = 134,
          height = 82,
          shift = {0.328125, 0.515625},
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/sand-rock/sand-rock-medium-02.png",
        priority = base_decorative_sprite_priority,
        width = 55,
        height = 40,
        shift = {0.15625, 0.5625},
        hr_version =
        {
          filename = "__base__/graphics/decorative/sand-rock/hr-sand-rock-medium-02.png",
          priority = base_decorative_sprite_priority,
          width = 110,
          height = 79,
          shift = {0.15625, 0.570312},
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/sand-rock/sand-rock-medium-03.png",
        priority = base_decorative_sprite_priority,
        width = 45,
        height = 30,
        shift = {0.34375, 0.484375},
        hr_version =
        {
          filename = "__base__/graphics/decorative/sand-rock/hr-sand-rock-medium-03.png",
          priority = base_decorative_sprite_priority,
          width = 90,
          height = 60,
          shift = {0.34375, 0.484375},
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/sand-rock/sand-rock-medium-04.png",
        priority = base_decorative_sprite_priority,
        width = 55,
        height = 45,
        shift = {0.296875, 0.484375},
        hr_version =
        {
          filename = "__base__/graphics/decorative/sand-rock/hr-sand-rock-medium-04.png",
          priority = base_decorative_sprite_priority,
          width = 110,
          height = 89,
          shift = {0.296875, 0.476562},
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/sand-rock/sand-rock-medium-05.png",
        priority = base_decorative_sprite_priority,
        width = 53,
        height = 38,
        shift = {0.359375, 0.25},
        hr_version =
        {
          filename = "__base__/graphics/decorative/sand-rock/hr-sand-rock-medium-05.png",
          priority = base_decorative_sprite_priority,
          width = 106,
          height = 76,
          shift = {0.359375, 0.25},
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/sand-rock/sand-rock-medium-06.png",
        priority = base_decorative_sprite_priority,
        width = 50,
        height = 46,
        shift = {0.4375, 0.296875},
        hr_version =
        {
          filename = "__base__/graphics/decorative/sand-rock/hr-sand-rock-medium-06.png",
          priority = base_decorative_sprite_priority,
          width = 100,
          height = 92,
          shift = {0.4375, 0.296875},
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/sand-rock/sand-rock-medium-07.png",
        priority = base_decorative_sprite_priority,
        width = 41,
        height = 41,
        shift = {0.59375, 0.40625},
        hr_version =
        {
          filename = "__base__/graphics/decorative/sand-rock/hr-sand-rock-medium-07.png",
          priority = base_decorative_sprite_priority,
          width = 82,
          height = 83,
          shift = {0.59375, 0.398438},
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/sand-rock/sand-rock-medium-08.png",
        priority = base_decorative_sprite_priority,
        width = 62,
        height = 46,
        shift = {0.59375, 0.328125},
        hr_version =
        {
          filename = "__base__/graphics/decorative/sand-rock/hr-sand-rock-medium-08.png",
          priority = base_decorative_sprite_priority,
          width = 123,
          height = 92,
          shift = {0.601562, 0.328125},
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/sand-rock/sand-rock-medium-09.png",
        priority = base_decorative_sprite_priority,
        width = 73,
        height = 38,
        shift = {0.5625, 0.3125},
        hr_version =
        {
          filename = "__base__/graphics/decorative/sand-rock/hr-sand-rock-medium-09.png",
          priority = base_decorative_sprite_priority,
          width = 146,
          height = 76,
          shift = {0.5625, 0.3125},
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/sand-rock/sand-rock-medium-10.png",
        priority = base_decorative_sprite_priority,
        width = 56,
        height = 39,
        shift = {0.46875, 0.453125},
        hr_version =
        {
          filename = "__base__/graphics/decorative/sand-rock/hr-sand-rock-medium-10.png",
          priority = base_decorative_sprite_priority,
          width = 112,
          height = 77,
          shift = {0.46875, 0.460938},
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/sand-rock/sand-rock-medium-11.png",
        priority = base_decorative_sprite_priority,
        width = 46,
        height = 30,
        shift = {0.4375, 0.515625},
        hr_version =
        {
          filename = "__base__/graphics/decorative/sand-rock/hr-sand-rock-medium-11.png",
          priority = base_decorative_sprite_priority,
          width = 91,
          height = 61,
          shift = {0.445312, 0.507812},
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/sand-rock/sand-rock-medium-12.png",
        priority = base_decorative_sprite_priority,
        width = 53,
        height = 42,
        shift = {0.390625, 0.453125},
        hr_version =
        {
          filename = "__base__/graphics/decorative/sand-rock/hr-sand-rock-medium-12.png",
          priority = base_decorative_sprite_priority,
          width = 105,
          height = 84,
          shift = {0.398438, 0.453125},
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/sand-rock/sand-rock-medium-13.png",
        priority = base_decorative_sprite_priority,
        width = 46,
        height = 36,
        shift = {0.375, 0.640625},
        hr_version =
        {
          filename = "__base__/graphics/decorative/sand-rock/hr-sand-rock-medium-13.png",
          priority = base_decorative_sprite_priority,
          width = 94,
          height = 73,
          shift = {0.375, 0.632812},
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/sand-rock/sand-rock-medium-14.png",
        priority = base_decorative_sprite_priority,
        width = 61,
        height = 45,
        shift = {0.359375, 0.578125},
        hr_version =
        {
          filename = "__base__/graphics/decorative/sand-rock/hr-sand-rock-medium-14.png",
          priority = base_decorative_sprite_priority,
          width = 122,
          height = 89,
          shift = {0.359375, 0.570312},
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/sand-rock/sand-rock-medium-15.png",
        priority = base_decorative_sprite_priority,
        width = 49,
        height = 33,
        shift = {0.1875, 0.765625},
        hr_version =
        {
          filename = "__base__/graphics/decorative/sand-rock/hr-sand-rock-medium-15.png",
          priority = base_decorative_sprite_priority,
          width = 98,
          height = 65,
          shift = {0.1875, 0.773438},
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/sand-rock/sand-rock-medium-16.png",
        priority = base_decorative_sprite_priority,
        width = 72,
        height = 38,
        shift = {0.109375, 0.71875},
        hr_version =
        {
          filename = "__base__/graphics/decorative/sand-rock/hr-sand-rock-medium-16.png",
          priority = base_decorative_sprite_priority,
          width = 144,
          height = 76,
          shift = {0.109375, 0.71875},
          scale = 0.5
        }
      }
    }
  },

  {
    name = "sand-rock-small",
    type = "optimized-decorative",
    order = "d[remnants]-d[ship-wreck-grass]-b[small]",
    collision_box = {{-1.5, -0.5}, {1.5, 0.5}},
    render_layer = "floor",
    autoplace = rock_autoplace_settings(1.1, "d[small]", {{0, 0}, {0.4, 0.2}}),
    walking_sound = sounds.pebble,
    trigger_effect = decorative_trigger_effects.small_rock(),
    pictures =
    {
      {
        filename = "__base__/graphics/decorative/sand-rock/sand-rock-small-01.png",
        priority = base_decorative_sprite_priority,
        width = 28,
        height = 23,
        shift = {0.40625, 0.484375},
        hr_version =
        {
          filename = "__base__/graphics/decorative/sand-rock/hr-sand-rock-small-01.png",
          priority = base_decorative_sprite_priority,
          width = 56,
          height = 45,
          shift = {0.40625, 0.476562},
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/sand-rock/sand-rock-small-02.png",
        priority = base_decorative_sprite_priority,
        width = 27,
        height = 22,
        shift = {0.296875, 0.484375},
        hr_version =
        {
          filename = "__base__/graphics/decorative/sand-rock/hr-sand-rock-small-02.png",
          priority = base_decorative_sprite_priority,
          width = 54,
          height = 45,
          shift = {0.296875, 0.476562},
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/sand-rock/sand-rock-small-03.png",
        priority = base_decorative_sprite_priority,
        width = 22,
        height = 20,
        shift = {0.328125, 0.53125},
        hr_version =
        {
          filename = "__base__/graphics/decorative/sand-rock/hr-sand-rock-small-03.png",
          priority = base_decorative_sprite_priority,
          width = 44,
          height = 40,
          shift = {0.328125, 0.53125},
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/sand-rock/sand-rock-small-04.png",
        priority = base_decorative_sprite_priority,
        width = 30,
        height = 22,
        shift = {0.265625, 0.59375},
        hr_version =
        {
          filename = "__base__/graphics/decorative/sand-rock/hr-sand-rock-small-04.png",
          priority = base_decorative_sprite_priority,
          width = 60,
          height = 43,
          shift = {0.265625, 0.601562},
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/sand-rock/sand-rock-small-05.png",
        priority = base_decorative_sprite_priority,
        width = 26,
        height = 24,
        shift = {0.296875, 0.46875},
        hr_version =
        {
          filename = "__base__/graphics/decorative/sand-rock/hr-sand-rock-small-05.png",
          priority = base_decorative_sprite_priority,
          width = 52,
          height = 48,
          shift = {0.296875, 0.46875},
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/sand-rock/sand-rock-small-06.png",
        priority = base_decorative_sprite_priority,
        width = 29,
        height = 20,
        shift = {0.546875, 0.53125},
        hr_version =
        {
          filename = "__base__/graphics/decorative/sand-rock/hr-sand-rock-small-06.png",
          priority = base_decorative_sprite_priority,
          width = 57,
          height = 39,
          shift = {0.554688, 0.523438},
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/sand-rock/sand-rock-small-07.png",
        priority = base_decorative_sprite_priority,
        width = 36,
        height = 21,
        shift = {0.578125, 0.546875},
        hr_version =
        {
          filename = "__base__/graphics/decorative/sand-rock/hr-sand-rock-small-07.png",
          priority = base_decorative_sprite_priority,
          width = 73,
          height = 41,
          shift = {0.570312, 0.539062},
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/sand-rock/sand-rock-small-08.png",
        priority = base_decorative_sprite_priority,
        width = 25,
        height = 23,
        shift = {0.640625, 0.390625},
        hr_version =
        {
          filename = "__base__/graphics/decorative/sand-rock/hr-sand-rock-small-08.png",
          priority = base_decorative_sprite_priority,
          width = 50,
          height = 46,
          shift = {0.640625, 0.390625},
          scale = 0.5
        }
       },
       {
        filename = "__base__/graphics/decorative/sand-rock/sand-rock-small-09.png",
        priority = base_decorative_sprite_priority,
        width = 26,
        height = 22,
        shift = {0.671875, 0.34375},
        hr_version =
        {
          filename = "__base__/graphics/decorative/sand-rock/hr-sand-rock-small-09.png",
          priority = base_decorative_sprite_priority,
          width = 52,
          height = 43,
          shift = {0.671875, 0.335938},
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/sand-rock/sand-rock-small-10.png",
        priority = base_decorative_sprite_priority,
        width = 32,
        height = 20,
        shift = {0.625, 0.40625},
        hr_version =
        {
          filename = "__base__/graphics/decorative/sand-rock/hr-sand-rock-small-10.png",
          priority = base_decorative_sprite_priority,
          width = 63,
          height = 39,
          shift = {0.632812, 0.398438},
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/sand-rock/sand-rock-small-11.png",
        priority = base_decorative_sprite_priority,
        width = 29,
        height = 21,
        shift = {0.453125, 0.609375},
        hr_version =
        {
          filename = "__base__/graphics/decorative/sand-rock/hr-sand-rock-small-11.png",
          priority = base_decorative_sprite_priority,
          width = 57,
          height = 41,
          shift = {0.460938, 0.617188},
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/sand-rock/sand-rock-small-12.png",
        priority = base_decorative_sprite_priority,
        width = 34,
        height = 26,
        shift = {0.46875, 0.5625},
        hr_version =
        {
          filename = "__base__/graphics/decorative/sand-rock/hr-sand-rock-small-12.png",
          priority = base_decorative_sprite_priority,
          width = 67,
          height = 51,
          shift = {0.460938, 0.570312},
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/sand-rock/sand-rock-small-13.png",
        priority = base_decorative_sprite_priority,
        width = 35,
        height = 19,
        shift = {0.484375, 0.796875},
        hr_version =
        {
          filename = "__base__/graphics/decorative/sand-rock/hr-sand-rock-small-13.png",
          priority = base_decorative_sprite_priority,
          width = 70,
          height = 37,
          shift = {0.484375, 0.789062},
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/sand-rock/sand-rock-small-14.png",
        priority = base_decorative_sprite_priority,
        width = 32,
        height = 24,
        shift = {0.1875, 0.90625},
        hr_version =
        {
          filename = "__base__/graphics/decorative/sand-rock/hr-sand-rock-small-14.png",
          priority = base_decorative_sprite_priority,
          width = 63,
          height = 48,
          shift = {0.179688, 0.90625},
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/sand-rock/sand-rock-small-15.png",
        priority = base_decorative_sprite_priority,
        width = 28,
        height = 24,
        shift = {0.140625, 0.78125},
        hr_version =
        {
          filename = "__base__/graphics/decorative/sand-rock/hr-sand-rock-small-15.png",
          priority = base_decorative_sprite_priority,
          width = 56,
          height = 48,
          shift = {0.140625, 0.78125},
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/sand-rock/sand-rock-small-16.png",
        priority = base_decorative_sprite_priority,
        width = 37,
        height = 23,
        shift = {-0.03125, 0.78125},
        hr_version =
        {
          filename = "__base__/graphics/decorative/sand-rock/hr-sand-rock-small-16.png",
          priority = base_decorative_sprite_priority,
          width = 74,
          height = 46,
          shift = {-0.03125, 0.78125},
          scale = 0.5
        }
      }
    }
  },
--[[
  {
    name = "concrete-hole-decal",
    type = "optimized-decorative",
    order = "b[decorative]-b[red-desert-decal]",
    collision_box = {{-4, -4}, {4, 4}},
    collision_mask = {"doodad-layer", "water-tile", "not-colliding-with-itself"},
    render_layer = "decals",
    tile_layer = 65, -- over concrete
    --autoplace = decal_autoplace_settgins("red-desert-decal", {{0.6, 0.2}, {1, 0.85}}),
    pictures =
    {
      --addchole
      {
        filename = "__base__/graphics/decorative/concrete-hole-decal/concrete-hole-decal-00.png",
        width = 174,
        height = 134,
        shift = util.by_pixel(5, -2),
        hr_version =
        {
          filename = "__base__/graphics/decorative/concrete-hole-decal/hr-concrete-hole-decal-00.png",
          width = 351,
          height = 267,
          shift = util.by_pixel(4.25, -1.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/concrete-hole-decal/concrete-hole-decal-01.png",
        width = 151,
        height = 130,
        shift = util.by_pixel(2.5, -3),
        hr_version =
        {
          filename = "__base__/graphics/decorative/concrete-hole-decal/hr-concrete-hole-decal-01.png",
          width = 305,
          height = 262,
          shift = util.by_pixel(2.25, -3),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/concrete-hole-decal/concrete-hole-decal-02.png",
        width = 163,
        height = 135,
        shift = util.by_pixel(-8.5, -0.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/concrete-hole-decal/hr-concrete-hole-decal-02.png",
          width = 327,
          height = 270,
          shift = util.by_pixel(-8.25, -0.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/concrete-hole-decal/concrete-hole-decal-03.png",
        width = 127,
        height = 135,
        shift = util.by_pixel(10.5, -1.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/concrete-hole-decal/hr-concrete-hole-decal-03.png",
          width = 258,
          height = 268,
          shift = util.by_pixel(10, -1.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/concrete-hole-decal/concrete-hole-decal-04.png",
        width = 114,
        height = 100,
        shift = util.by_pixel(9, 3),
        hr_version =
        {
          filename = "__base__/graphics/decorative/concrete-hole-decal/hr-concrete-hole-decal-04.png",
          width = 231,
          height = 201,
          shift = util.by_pixel(8.75, 3.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/concrete-hole-decal/concrete-hole-decal-05.png",
        width = 146,
        height = 116,
        shift = util.by_pixel(12, 6),
        hr_version =
        {
          filename = "__base__/graphics/decorative/concrete-hole-decal/hr-concrete-hole-decal-05.png",
          width = 295,
          height = 234,
          shift = util.by_pixel(12.25, 6.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/concrete-hole-decal/concrete-hole-decal-06.png",
        width = 133,
        height = 85,
        shift = util.by_pixel(-6.5, 0.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/concrete-hole-decal/hr-concrete-hole-decal-06.png",
          width = 271,
          height = 172,
          shift = util.by_pixel(-5.75, 0.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/concrete-hole-decal/concrete-hole-decal-07.png",
        width = 139,
        height = 118,
        shift = util.by_pixel(-1.5, 6),
        hr_version =
        {
          filename = "__base__/graphics/decorative/concrete-hole-decal/hr-concrete-hole-decal-07.png",
          width = 282,
          height = 266,
          shift = util.by_pixel(-1.5, -1.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/concrete-hole-decal/concrete-hole-decal-08.png",
        width = 188,
        height = 114,
        shift = util.by_pixel(0, -7),
        hr_version =
        {
          filename = "__base__/graphics/decorative/concrete-hole-decal/hr-concrete-hole-decal-08.png",
          width = 377,
          height = 231,
          shift = util.by_pixel(-0.25, -7.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/concrete-hole-decal/concrete-hole-decal-09.png",
        width = 170,
        height = 100,
        shift = util.by_pixel(9, 6),
        hr_version =
        {
          filename = "__base__/graphics/decorative/concrete-hole-decal/hr-concrete-hole-decal-09.png",
          width = 376,
          height = 202,
          shift = util.by_pixel(0, 6),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/concrete-hole-decal/concrete-hole-decal-10.png",
        width = 184,
        height = 116,
        shift = util.by_pixel(-1, 3),
        hr_version =
        {
          filename = "__base__/graphics/decorative/concrete-hole-decal/hr-concrete-hole-decal-10.png",
          width = 372,
          height = 234,
          shift = util.by_pixel(-1, 3.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/concrete-hole-decal/concrete-hole-decal-11.png",
        width = 171,
        height = 111,
        shift = util.by_pixel(-1.5, 1.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/concrete-hole-decal/hr-concrete-hole-decal-11.png",
          width = 344,
          height = 224,
          shift = util.by_pixel(-1.5, 1.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/concrete-hole-decal/concrete-hole-decal-12.png",
        width = 138,
        height = 94,
        shift = util.by_pixel(-10, 4),
        hr_version =
        {
          filename = "__base__/graphics/decorative/concrete-hole-decal/hr-concrete-hole-decal-12.png",
          width = 290,
          height = 189,
          shift = util.by_pixel(-8, 4.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/concrete-hole-decal/concrete-hole-decal-13.png",
        width = 159,
        height = 109,
        shift = util.by_pixel(-4.5, -3.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/concrete-hole-decal/hr-concrete-hole-decal-13.png",
          width = 326,
          height = 228,
          shift = util.by_pixel(-3, -2),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/concrete-hole-decal/concrete-hole-decal-14.png",
        width = 153,
        height = 111,
        shift = util.by_pixel(-13.5, 4.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/concrete-hole-decal/hr-concrete-hole-decal-14.png",
          width = 312,
          height = 225,
          shift = util.by_pixel(-13.5, 4.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/concrete-hole-decal/concrete-hole-decal-15.png",
        width = 178,
        height = 92,
        shift = util.by_pixel(-5, 4),
        hr_version =
        {
          filename = "__base__/graphics/decorative/concrete-hole-decal/hr-concrete-hole-decal-15.png",
          width = 359,
          height = 186,
          shift = util.by_pixel(-4.25, 4.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/concrete-hole-decal/concrete-hole-decal-16.png",
        width = 142,
        height = 117,
        shift = util.by_pixel(11, 6.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/concrete-hole-decal/hr-concrete-hole-decal-16.png",
          width = 287,
          height = 266,
          shift = util.by_pixel(10.75, -1.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/concrete-hole-decal/concrete-hole-decal-17.png",
        width = 188,
        height = 133,
        shift = util.by_pixel(0, -1.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/concrete-hole-decal/hr-concrete-hole-decal-17.png",
          width = 377,
          height = 267,
          shift = util.by_pixel(0.25, -1.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/concrete-hole-decal/concrete-hole-decal-18.png",
        width = 186,
        height = 135,
        shift = util.by_pixel(1, -1.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/concrete-hole-decal/hr-concrete-hole-decal-18.png",
          width = 375,
          height = 269,
          shift = util.by_pixel(0.25, -1.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/concrete-hole-decal/concrete-hole-decal-19.png",
        width = 171,
        height = 134,
        shift = util.by_pixel(-0.5, -1),
        hr_version =
        {
          filename = "__base__/graphics/decorative/concrete-hole-decal/hr-concrete-hole-decal-19.png",
          width = 346,
          height = 270,
          shift = util.by_pixel(-0.5, -1),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/concrete-hole-decal/concrete-hole-decal-20.png",
        width = 129,
        height = 99,
        shift = util.by_pixel(-3.5, 0.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/concrete-hole-decal/hr-concrete-hole-decal-20.png",
          width = 261,
          height = 198,
          shift = util.by_pixel(-3.25, 0.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/concrete-hole-decal/concrete-hole-decal-21.png",
        width = 134,
        height = 101,
        shift = util.by_pixel(3, -8.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/concrete-hole-decal/hr-concrete-hole-decal-21.png",
          width = 270,
          height = 205,
          shift = util.by_pixel(2.5, -8.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/concrete-hole-decal/concrete-hole-decal-22.png",
        width = 131,
        height = 105,
        shift = util.by_pixel(-11.5, 5.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/concrete-hole-decal/hr-concrete-hole-decal-22.png",
          width = 266,
          height = 212,
          shift = util.by_pixel(-11.5, 5.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/concrete-hole-decal/concrete-hole-decal-23.png",
        width = 145,
        height = 80,
        shift = util.by_pixel(13.5, -10),
        hr_version =
        {
          filename = "__base__/graphics/decorative/concrete-hole-decal/hr-concrete-hole-decal-23.png",
          width = 292,
          height = 164,
          shift = util.by_pixel(13.5, -10.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/concrete-hole-decal/concrete-hole-decal-24.png",
        width = 188,
        height = 115,
        shift = util.by_pixel(0, 2.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/concrete-hole-decal/hr-concrete-hole-decal-24.png",
          width = 377,
          height = 232,
          shift = util.by_pixel(-0.25, 2.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/concrete-hole-decal/concrete-hole-decal-25.png",
        width = 188,
        height = 100,
        shift = util.by_pixel(0, -3),
        hr_version =
        {
          filename = "__base__/graphics/decorative/concrete-hole-decal/hr-concrete-hole-decal-25.png",
          width = 376,
          height = 204,
          shift = util.by_pixel(0, -3),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/concrete-hole-decal/concrete-hole-decal-26.png",
        width = 186,
        height = 107,
        shift = util.by_pixel(-1, -12.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/concrete-hole-decal/hr-concrete-hole-decal-26.png",
          width = 376,
          height = 214,
          shift = util.by_pixel(0, -13),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/concrete-hole-decal/concrete-hole-decal-27.png",
        width = 188,
        height = 103,
        shift = util.by_pixel(0, -5.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/concrete-hole-decal/hr-concrete-hole-decal-27.png",
          width = 378,
          height = 209,
          shift = util.by_pixel(0, -4.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/concrete-hole-decal/concrete-hole-decal-28.png",
        width = 188,
        height = 95,
        shift = util.by_pixel(0, 3.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/concrete-hole-decal/hr-concrete-hole-decal-28.png",
          width = 378,
          height = 198,
          shift = util.by_pixel(0, 5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/concrete-hole-decal/concrete-hole-decal-29.png",
        width = 176,
        height = 108,
        shift = util.by_pixel(6, 0),
        hr_version =
        {
          filename = "__base__/graphics/decorative/concrete-hole-decal/hr-concrete-hole-decal-29.png",
          width = 352,
          height = 218,
          shift = util.by_pixel(6, 0),
          scale = 0.5
        }
      }
    }
  },
]]--
  {
    name = "red-desert-decal",
    type = "optimized-decorative",
    order = "b[decorative]-b[red-desert-decal]",
    collision_box = {{-4.40625, -5.6875}, {4.375, 5.625}},
    collision_mask = {"doodad-layer", "water-tile", "not-colliding-with-itself"},
    render_layer = "decals",
    tile_layer = 59, -- just under stone-path
    autoplace = decal_autoplace_settgins("red-desert-decal", {{0.6, 0.2}, {1, 0.85}}),
    pictures =
    {
      --redDecal
      {
        filename = "__base__/graphics/decorative/red-desert-decal/red-desert-decal-00.png",
        width = 284,
        height = 282,
        hr_version =
        {
          filename = "__base__/graphics/decorative/red-desert-decal/hr-red-desert-decal-00.png",
          width = 567,
          height = 565,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/red-desert-decal/red-desert-decal-01.png",
        width = 277,
        height = 377,
        dice_y = 2,
        hr_version =
        {
          filename = "__base__/graphics/decorative/red-desert-decal/hr-red-desert-decal-01.png",
          width = 553,
          height = 753,
          dice_y = 2,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/red-desert-decal/red-desert-decal-02.png",
        width = 283,
        height = 235,
        hr_version =
        {
          filename = "__base__/graphics/decorative/red-desert-decal/hr-red-desert-decal-02.png",
          width = 567,
          height = 471,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/red-desert-decal/red-desert-decal-03.png",
        width = 284,
        height = 213,
        hr_version =
        {
          filename = "__base__/graphics/decorative/red-desert-decal/hr-red-desert-decal-03.png",
          width = 567,
          height = 425,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/red-desert-decal/red-desert-decal-04.png",
        width = 279,
        height = 282,
        hr_version =
        {
          filename = "__base__/graphics/decorative/red-desert-decal/hr-red-desert-decal-04.png",
          width = 557,
          height = 565,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/red-desert-decal/red-desert-decal-05.png",
        width = 277,
        height = 281,
        hr_version =
        {
          filename = "__base__/graphics/decorative/red-desert-decal/hr-red-desert-decal-05.png",
          width = 555,
          height = 563,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/red-desert-decal/red-desert-decal-06.png",
        width = 284,
        height = 283,
        hr_version =
        {
          filename = "__base__/graphics/decorative/red-desert-decal/hr-red-desert-decal-06.png",
          width = 567,
          height = 565,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/red-desert-decal/red-desert-decal-07.png",
        width = 284,
        height = 283,
        hr_version =
        {
          filename = "__base__/graphics/decorative/red-desert-decal/hr-red-desert-decal-07.png",
          width = 567,
          height = 565,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/red-desert-decal/red-desert-decal-08.png",
        width = 284,
        height = 283,
        hr_version =
        {
          filename = "__base__/graphics/decorative/red-desert-decal/hr-red-desert-decal-08.png",
          width = 567,
          height = 565,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/red-desert-decal/red-desert-decal-09.png",
        width = 284,
        height = 283,
        hr_version =
        {
          filename = "__base__/graphics/decorative/red-desert-decal/hr-red-desert-decal-09.png",
          width = 567,
          height = 565,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/red-desert-decal/red-desert-decal-10.png",
        width = 284,
        height = 282,
        hr_version =
        {
          filename = "__base__/graphics/decorative/red-desert-decal/hr-red-desert-decal-10.png",
          width = 567,
          height = 564,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/red-desert-decal/red-desert-decal-11.png",
        width = 186,
        height = 204,
        hr_version =
        {
          filename = "__base__/graphics/decorative/red-desert-decal/hr-red-desert-decal-11.png",
          width = 371,
          height = 409,
          scale = 0.5
        }
      }
    }
  },
  {
    name = "dark-mud-decal",
    type = "optimized-decorative",
    order = "b[decorative]-b[red-desert-decal]",
    collision_box = {{-4.625, -3.25}, {4.6875, 3.125}},
    collision_mask = {"water-tile", "colliding-with-tiles-only"},
    render_layer = "decals",
    tile_layer = 59, -- under stone-path
    autoplace = decal_autoplace_settgins("red-desert-decal", {{0.6, 0.2}, {1, 0.85}}),
    pictures =
    {
      --decalDark
      {
        filename = "__base__/graphics/decorative/dark-mud-decal/dark-mud-decal-00.png",
        width = 305,
        height = 217,
        shift = util.by_pixel(-0.5, 0.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/dark-mud-decal/hr-dark-mud-decal-00.png",
          width = 612,
          height = 434,
          shift = util.by_pixel(0, 1),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/dark-mud-decal/dark-mud-decal-01.png",
        width = 307,
        height = 219,
        shift = util.by_pixel(-0.5, -0.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/dark-mud-decal/hr-dark-mud-decal-01.png",
          width = 613,
          height = 438,
          shift = util.by_pixel(-0.25, 0),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/dark-mud-decal/dark-mud-decal-02.png",
        width = 307,
        height = 219,
        shift = util.by_pixel(-0.5, -0.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/dark-mud-decal/hr-dark-mud-decal-02.png",
          width = 612,
          height = 438,
          shift = util.by_pixel(0, 0),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/dark-mud-decal/dark-mud-decal-03.png",
        width = 305,
        height = 217,
        shift = util.by_pixel(-0.5, 0.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/dark-mud-decal/hr-dark-mud-decal-03.png",
          width = 612,
          height = 434,
          shift = util.by_pixel(0, 1),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/dark-mud-decal/dark-mud-decal-04.png",
        width = 305,
        height = 219,
        shift = util.by_pixel(-0.5, -0.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/dark-mud-decal/hr-dark-mud-decal-04.png",
          width = 612,
          height = 438,
          shift = util.by_pixel(0, 0),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/dark-mud-decal/dark-mud-decal-05.png",
        width = 306,
        height = 217,
        shift = util.by_pixel(-1, 0.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/dark-mud-decal/hr-dark-mud-decal-05.png",
          width = 612,
          height = 434,
          shift = util.by_pixel(0, 1),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/dark-mud-decal/dark-mud-decal-06.png",
        width = 307,
        height = 217,
        shift = util.by_pixel(-0.5, 0.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/dark-mud-decal/hr-dark-mud-decal-06.png",
          width = 613,
          height = 434,
          shift = util.by_pixel(-0.25, 1),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/dark-mud-decal/dark-mud-decal-07.png",
        width = 306,
        height = 218,
        shift = util.by_pixel(0, 1),
        hr_version =
        {
          filename = "__base__/graphics/decorative/dark-mud-decal/hr-dark-mud-decal-07.png",
          width = 612,
          height = 435,
          shift = util.by_pixel(0, 1.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/dark-mud-decal/dark-mud-decal-08.png",
        width = 305,
        height = 218,
        shift = util.by_pixel(-0.5, 0),
        hr_version =
        {
          filename = "__base__/graphics/decorative/dark-mud-decal/hr-dark-mud-decal-08.png",
          width = 612,
          height = 436,
          shift = util.by_pixel(0, 0.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/dark-mud-decal/dark-mud-decal-09.png",
        width = 306,
        height = 218,
        shift = util.by_pixel(-1, 0),
        hr_version =
        {
          filename = "__base__/graphics/decorative/dark-mud-decal/hr-dark-mud-decal-09.png",
          width = 612,
          height = 437,
          shift = util.by_pixel(0, 0.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/dark-mud-decal/dark-mud-decal-10.png",
        width = 305,
        height = 217,
        shift = util.by_pixel(-0.5, 0.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/dark-mud-decal/hr-dark-mud-decal-10.png",
          width = 612,
          height = 434,
          shift = util.by_pixel(0, 1),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/dark-mud-decal/dark-mud-decal-11.png",
        width = 306,
        height = 217,
        shift = util.by_pixel(0, 0.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/dark-mud-decal/hr-dark-mud-decal-11.png",
          width = 612,
          height = 434,
          shift = util.by_pixel(0, 1),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/dark-mud-decal/dark-mud-decal-12.png",
        width = 306,
        height = 219,
        shift = util.by_pixel(0, -0.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/dark-mud-decal/hr-dark-mud-decal-12.png",
          width = 612,
          height = 439,
          shift = util.by_pixel(0, 0.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/dark-mud-decal/dark-mud-decal-13.png",
        width = 307,
        height = 217,
        shift = util.by_pixel(-0.5, 0.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/dark-mud-decal/hr-dark-mud-decal-13.png",
          width = 612,
          height = 435,
          shift = util.by_pixel(0, 1.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/dark-mud-decal/dark-mud-decal-14.png",
        width = 306,
        height = 217,
        shift = util.by_pixel(0, 0.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/dark-mud-decal/hr-dark-mud-decal-14.png",
          width = 612,
          height = 434,
          shift = util.by_pixel(0, 1),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/dark-mud-decal/dark-mud-decal-15.png",
        width = 305,
        height = 217,
        shift = util.by_pixel(-0.5, 0.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/dark-mud-decal/hr-dark-mud-decal-15.png",
          width = 612,
          height = 435,
          shift = util.by_pixel(0, 0.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/dark-mud-decal/dark-mud-decal-16.png",
        width = 305,
        height = 218,
        shift = util.by_pixel(-0.5, 0),
        hr_version =
        {
          filename = "__base__/graphics/decorative/dark-mud-decal/hr-dark-mud-decal-16.png",
          width = 612,
          height = 437,
          shift = util.by_pixel(0, 0.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/dark-mud-decal/dark-mud-decal-17.png",
        width = 307,
        height = 217,
        shift = util.by_pixel(-0.5, 0.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/dark-mud-decal/hr-dark-mud-decal-17.png",
          width = 612,
          height = 435,
          shift = util.by_pixel(0, 0.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/dark-mud-decal/dark-mud-decal-18.png",
        width = 305,
        height = 217,
        shift = util.by_pixel(-0.5, 0.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/dark-mud-decal/hr-dark-mud-decal-18.png",
          width = 612,
          height = 434,
          shift = util.by_pixel(0, 1),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/dark-mud-decal/dark-mud-decal-19.png",
        width = 307,
        height = 217,
        shift = util.by_pixel(-0.5, 0.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/dark-mud-decal/hr-dark-mud-decal-19.png",
          width = 612,
          height = 435,
          shift = util.by_pixel(0, 0.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/dark-mud-decal/dark-mud-decal-20.png",
        width = 305,
        height = 219,
        shift = util.by_pixel(-0.5, -0.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/dark-mud-decal/hr-dark-mud-decal-20.png",
          width = 612,
          height = 438,
          shift = util.by_pixel(0, 0),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/dark-mud-decal/dark-mud-decal-21.png",
        width = 307,
        height = 217,
        shift = util.by_pixel(-0.5, 0.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/dark-mud-decal/hr-dark-mud-decal-21.png",
          width = 612,
          height = 434,
          shift = util.by_pixel(0, 1),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/dark-mud-decal/dark-mud-decal-22.png",
        width = 305,
        height = 218,
        shift = util.by_pixel(-0.5, 1),
        hr_version =
        {
          filename = "__base__/graphics/decorative/dark-mud-decal/hr-dark-mud-decal-22.png",
          width = 612,
          height = 435,
          shift = util.by_pixel(0, 1.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/dark-mud-decal/dark-mud-decal-23.png",
        width = 306,
        height = 217,
        shift = util.by_pixel(0, 0.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/dark-mud-decal/hr-dark-mud-decal-23.png",
          width = 612,
          height = 434,
          shift = util.by_pixel(0, 1),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/dark-mud-decal/dark-mud-decal-24.png",
        width = 305,
        height = 217,
        shift = util.by_pixel(-0.5, 0.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/dark-mud-decal/hr-dark-mud-decal-24.png",
          width = 612,
          height = 434,
          shift = util.by_pixel(0, 1),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/dark-mud-decal/dark-mud-decal-25.png",
        width = 305,
        height = 217,
        shift = util.by_pixel(-0.5, 0.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/dark-mud-decal/hr-dark-mud-decal-25.png",
          width = 612,
          height = 434,
          shift = util.by_pixel(0, 1),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/dark-mud-decal/dark-mud-decal-26.png",
        width = 305,
        height = 218,
        shift = util.by_pixel(-0.5, 0),
        hr_version =
        {
          filename = "__base__/graphics/decorative/dark-mud-decal/hr-dark-mud-decal-26.png",
          width = 612,
          height = 435,
          shift = util.by_pixel(0, 0.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/dark-mud-decal/dark-mud-decal-27.png",
        width = 306,
        height = 217,
        shift = util.by_pixel(-1, 0.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/dark-mud-decal/hr-dark-mud-decal-27.png",
          width = 612,
          height = 435,
          shift = util.by_pixel(0, 1.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/dark-mud-decal/dark-mud-decal-28.png",
        width = 305,
        height = 218,
        shift = util.by_pixel(-0.5, 0),
        hr_version =
        {
          filename = "__base__/graphics/decorative/dark-mud-decal/hr-dark-mud-decal-28.png",
          width = 612,
          height = 436,
          shift = util.by_pixel(0, 0.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/dark-mud-decal/dark-mud-decal-29.png",
        width = 307,
        height = 218,
        shift = util.by_pixel(-0.5, 0),
        hr_version =
        {
          filename = "__base__/graphics/decorative/dark-mud-decal/hr-dark-mud-decal-29.png",
          width = 612,
          height = 436,
          shift = util.by_pixel(0, 0.5),
          scale = 0.5
        }
      }
    }
  },
  {
    name = "puberty-decal",
    type = "optimized-decorative",
    order = "b[decorative]-b[red-desert-decal]",
    collision_box = {{-3.75, -2.5625}, {3.75, 2.5625}},
    collision_mask = {"doodad-layer", "water-tile", "not-colliding-with-itself"},
    render_layer = "decals",
    tile_layer = 59, -- under stone-path
    autoplace = decal_autoplace_settgins("red-desert-decal", {{0.6, 0.2}, {1, 0.85}}),
    pictures =
    {
      --pubertyDecal
      {
        filename = "__base__/graphics/decorative/puberty-decal/puberty-decal-00.png",
        width = 236,
        height = 169,
        shift = util.by_pixel(0, -0.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/puberty-decal/hr-puberty-decal-00.png",
          width = 474,
          height = 337,
          shift = util.by_pixel(0, -0.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/puberty-decal/puberty-decal-01.png",
        width = 236,
        height = 132,
        shift = util.by_pixel(0, -3),
        hr_version =
        {
          filename = "__base__/graphics/decorative/puberty-decal/hr-puberty-decal-01.png",
          width = 473,
          height = 265,
          shift = util.by_pixel(0.25, -2.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/puberty-decal/puberty-decal-02.png",
        width = 236,
        height = 134,
        shift = util.by_pixel(0, -4),
        hr_version =
        {
          filename = "__base__/graphics/decorative/puberty-decal/hr-puberty-decal-02.png",
          width = 473,
          height = 267,
          shift = util.by_pixel(0.25, -3.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/puberty-decal/puberty-decal-03.png",
        width = 215,
        height = 121,
        shift = util.by_pixel(1.5, 1.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/puberty-decal/hr-puberty-decal-03.png",
          width = 432,
          height = 243,
          shift = util.by_pixel(1.5, 1.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/puberty-decal/puberty-decal-04.png",
        width = 236,
        height = 153,
        shift = util.by_pixel(0, -0.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/puberty-decal/hr-puberty-decal-04.png",
          width = 472,
          height = 305,
          shift = util.by_pixel(0, -0.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/puberty-decal/puberty-decal-05.png",
        width = 188,
        height = 112,
        shift = util.by_pixel(0, 0),
        hr_version =
        {
          filename = "__base__/graphics/decorative/puberty-decal/hr-puberty-decal-05.png",
          width = 375,
          height = 224,
          shift = util.by_pixel(-0.25, 0),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/puberty-decal/puberty-decal-06.png",
        width = 148,
        height = 168,
        shift = util.by_pixel(-1, -1),
        hr_version =
        {
          filename = "__base__/graphics/decorative/puberty-decal/hr-puberty-decal-06.png",
          width = 296,
          height = 335,
          shift = util.by_pixel(-1, -0.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/puberty-decal/puberty-decal-07.png",
        width = 200,
        height = 109,
        shift = util.by_pixel(-9, 7.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/puberty-decal/hr-puberty-decal-07.png",
          width = 400,
          height = 220,
          shift = util.by_pixel(-9, 7.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/puberty-decal/puberty-decal-08.png",
        width = 133,
        height = 169,
        shift = util.by_pixel(2.5, -0.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/puberty-decal/hr-puberty-decal-08.png",
          width = 268,
          height = 337,
          shift = util.by_pixel(2.5, -0.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/puberty-decal/puberty-decal-09.png",
        width = 214,
        height = 79,
        shift = util.by_pixel(6, 7.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/puberty-decal/hr-puberty-decal-09.png",
          width = 426,
          height = 156,
          shift = util.by_pixel(6, 7.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/puberty-decal/puberty-decal-10.png",
        width = 213,
        height = 133,
        shift = util.by_pixel(3.5, 6.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/puberty-decal/hr-puberty-decal-10.png",
          width = 426,
          height = 267,
          shift = util.by_pixel(3, 6.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/puberty-decal/puberty-decal-11.png",
        width = 236,
        height = 164,
        shift = util.by_pixel(0, 1),
        hr_version =
        {
          filename = "__base__/graphics/decorative/puberty-decal/hr-puberty-decal-11.png",
          width = 472,
          height = 329,
          shift = util.by_pixel(0, 0.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/puberty-decal/puberty-decal-12.png",
        width = 236,
        height = 169,
        shift = util.by_pixel(0, -0.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/puberty-decal/hr-puberty-decal-12.png",
          width = 472,
          height = 337,
          shift = util.by_pixel(0, -0.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/puberty-decal/puberty-decal-13.png",
        width = 191,
        height = 138,
        shift = util.by_pixel(21.5, -11),
        hr_version =
        {
          filename = "__base__/graphics/decorative/puberty-decal/hr-puberty-decal-13.png",
          width = 381,
          height = 276,
          shift = util.by_pixel(21.75, -10.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/puberty-decal/puberty-decal-14.png",
        width = 236,
        height = 168,
        shift = util.by_pixel(0, 0),
        hr_version =
        {
          filename = "__base__/graphics/decorative/puberty-decal/hr-puberty-decal-14.png",
          width = 472,
          height = 338,
          shift = util.by_pixel(0, 0),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/puberty-decal/puberty-decal-15.png",
        width = 236,
        height = 167,
        shift = util.by_pixel(0, -0.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/puberty-decal/hr-puberty-decal-15.png",
          width = 473,
          height = 336,
          shift = util.by_pixel(-0.25, -0.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/puberty-decal/puberty-decal-16.png",
        width = 163,
        height = 107,
        shift = util.by_pixel(0.5, -0.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/puberty-decal/hr-puberty-decal-16.png",
          width = 327,
          height = 215,
          shift = util.by_pixel(0.25, -0.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/puberty-decal/puberty-decal-17.png",
        width = 148,
        height = 106,
        shift = util.by_pixel(-3, 10),
        hr_version =
        {
          filename = "__base__/graphics/decorative/puberty-decal/hr-puberty-decal-17.png",
          width = 298,
          height = 212,
          shift = util.by_pixel(-3, 10),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/puberty-decal/puberty-decal-18.png",
        width = 142,
        height = 99,
        shift = util.by_pixel(-14, 7.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/puberty-decal/hr-puberty-decal-18.png",
          width = 286,
          height = 199,
          shift = util.by_pixel(-14, 7.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/puberty-decal/puberty-decal-19.png",
        width = 103,
        height = 78,
        shift = util.by_pixel(4.5, 0),
        hr_version =
        {
          filename = "__base__/graphics/decorative/puberty-decal/hr-puberty-decal-19.png",
          width = 206,
          height = 157,
          shift = util.by_pixel(5, 0.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/puberty-decal/puberty-decal-20.png",
        width = 152,
        height = 96,
        shift = util.by_pixel(9, 2),
        hr_version =
        {
          filename = "__base__/graphics/decorative/puberty-decal/hr-puberty-decal-20.png",
          width = 305,
          height = 190,
          shift = util.by_pixel(8.75, 2),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/puberty-decal/puberty-decal-21.png",
        width = 160,
        height = 105,
        shift = util.by_pixel(-5, -2.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/puberty-decal/hr-puberty-decal-21.png",
          width = 321,
          height = 209,
          shift = util.by_pixel(-5.25, -2.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/puberty-decal/puberty-decal-22.png",
        width = 148,
        height = 91,
        shift = util.by_pixel(-11, 4.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/puberty-decal/hr-puberty-decal-22.png",
          width = 297,
          height = 182,
          shift = util.by_pixel(-11.25, 5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/puberty-decal/puberty-decal-23.png",
        width = 134,
        height = 98,
        shift = util.by_pixel(-4, 2),
        hr_version =
        {
          filename = "__base__/graphics/decorative/puberty-decal/hr-puberty-decal-23.png",
          width = 268,
          height = 196,
          shift = util.by_pixel(-4, 2.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/puberty-decal/puberty-decal-24.png",
        width = 158,
        height = 114,
        shift = util.by_pixel(-3, 2),
        hr_version =
        {
          filename = "__base__/graphics/decorative/puberty-decal/hr-puberty-decal-24.png",
          width = 320,
          height = 229,
          shift = util.by_pixel(-2.5, 1.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/puberty-decal/puberty-decal-25.png",
        width = 236,
        height = 74,
        shift = util.by_pixel(0, -1),
        hr_version =
        {
          filename = "__base__/graphics/decorative/puberty-decal/hr-puberty-decal-25.png",
          width = 472,
          height = 149,
          shift = util.by_pixel(0, -1.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/puberty-decal/puberty-decal-26.png",
        width = 89,
        height = 105,
        shift = util.by_pixel(1.5, -5.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/puberty-decal/hr-puberty-decal-26.png",
          width = 180,
          height = 211,
          shift = util.by_pixel(1, -5.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/puberty-decal/puberty-decal-27.png",
        width = 162,
        height = 76,
        shift = util.by_pixel(0, -1),
        hr_version =
        {
          filename = "__base__/graphics/decorative/puberty-decal/hr-puberty-decal-27.png",
          width = 325,
          height = 153,
          shift = util.by_pixel(0.25, -0.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/puberty-decal/puberty-decal-28.png",
        width = 162,
        height = 66,
        shift = util.by_pixel(0, 4),
        hr_version =
        {
          filename = "__base__/graphics/decorative/puberty-decal/hr-puberty-decal-28.png",
          width = 326,
          height = 132,
          shift = util.by_pixel(0, 4.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/puberty-decal/puberty-decal-29.png",
        width = 155,
        height = 91,
        shift = util.by_pixel(13.5, -21.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/puberty-decal/hr-puberty-decal-29.png",
          width = 311,
          height = 183,
          shift = util.by_pixel(13.25, -21.75),
          scale = 0.5
        }
      }
    }
  },
  {
    name = "light-mud-decal",
    type = "optimized-decorative",
    order = "b[decorative]-b[red-desert-decal]",
    collision_box = {{-3.375, -2.3125}, {3.25, 2.3125}},
    collision_mask = {"water-tile", "colliding-with-tiles-only"},
    render_layer = "decals",
    tile_layer = 59, -- under stone-path
    autoplace = decal_autoplace_settgins("red-desert-decal", {{0.6, 0.2}, {1, 0.85}}),
    pictures =
    {
      --lightDecal
      {
        filename = "__base__/graphics/decorative/light-mud-decal/light-mud-decal-00.png",
        width = 199,
        height = 149,
        shift = util.by_pixel(4.5, -2.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/light-mud-decal/hr-light-mud-decal-00.png",
          width = 400,
          height = 299,
          shift = util.by_pixel(4.5, -2.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/light-mud-decal/light-mud-decal-01.png",
        width = 210,
        height = 160,
        shift = util.by_pixel(-1, 2),
        hr_version =
        {
          filename = "__base__/graphics/decorative/light-mud-decal/hr-light-mud-decal-01.png",
          width = 419,
          height = 320,
          shift = util.by_pixel(-0.75, 2),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/light-mud-decal/light-mud-decal-02.png",
        width = 208,
        height = 142,
        shift = util.by_pixel(-1, 2),
        hr_version =
        {
          filename = "__base__/graphics/decorative/light-mud-decal/hr-light-mud-decal-02.png",
          width = 417,
          height = 287,
          shift = util.by_pixel(-1.25, 1.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/light-mud-decal/light-mud-decal-03.png",
        width = 211,
        height = 149,
        shift = util.by_pixel(-0.5, 5.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/light-mud-decal/hr-light-mud-decal-03.png",
          width = 421,
          height = 298,
          shift = util.by_pixel(-0.25, 5.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/light-mud-decal/light-mud-decal-04.png",
        width = 198,
        height = 151,
        shift = util.by_pixel(6, 3.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/light-mud-decal/hr-light-mud-decal-04.png",
          width = 396,
          height = 302,
          shift = util.by_pixel(6, 4),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/light-mud-decal/light-mud-decal-05.png",
        width = 205,
        height = 147,
        shift = util.by_pixel(-2.5, 7.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/light-mud-decal/hr-light-mud-decal-05.png",
          width = 408,
          height = 295,
          shift = util.by_pixel(-2.5, 7.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/light-mud-decal/light-mud-decal-06.png",
        width = 208,
        height = 158,
        shift = util.by_pixel(-1, 3),
        hr_version =
        {
          filename = "__base__/graphics/decorative/light-mud-decal/hr-light-mud-decal-06.png",
          width = 417,
          height = 317,
          shift = util.by_pixel(-1.25, 3.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/light-mud-decal/light-mud-decal-07.png",
        width = 209,
        height = 155,
        shift = util.by_pixel(0.5, 2.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/light-mud-decal/hr-light-mud-decal-07.png",
          width = 419,
          height = 312,
          shift = util.by_pixel(0.75, 2.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/light-mud-decal/light-mud-decal-08.png",
        width = 206,
        height = 158,
        shift = util.by_pixel(-2, 2),
        hr_version =
        {
          filename = "__base__/graphics/decorative/light-mud-decal/hr-light-mud-decal-08.png",
          width = 413,
          height = 317,
          shift = util.by_pixel(-2.25, 2.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/light-mud-decal/light-mud-decal-09.png",
        width = 201,
        height = 155,
        shift = util.by_pixel(0.5, 1.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/light-mud-decal/hr-light-mud-decal-09.png",
          width = 403,
          height = 310,
          shift = util.by_pixel(0.25, 1.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/light-mud-decal/light-mud-decal-10.png",
        width = 206,
        height = 153,
        shift = util.by_pixel(-1, 1.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/light-mud-decal/hr-light-mud-decal-10.png",
          width = 411,
          height = 307,
          shift = util.by_pixel(-0.75, 1.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/light-mud-decal/light-mud-decal-11.png",
        width = 210,
        height = 147,
        shift = util.by_pixel(0, -0.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/light-mud-decal/hr-light-mud-decal-11.png",
          width = 421,
          height = 295,
          shift = util.by_pixel(-0.25, -0.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/light-mud-decal/light-mud-decal-12.png",
        width = 210,
        height = 140,
        shift = util.by_pixel(-1, -7),
        hr_version =
        {
          filename = "__base__/graphics/decorative/light-mud-decal/hr-light-mud-decal-12.png",
          width = 420,
          height = 280,
          shift = util.by_pixel(-0.5, -7),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/light-mud-decal/light-mud-decal-13.png",
        width = 201,
        height = 156,
        shift = util.by_pixel(0.5, 3),
        hr_version =
        {
          filename = "__base__/graphics/decorative/light-mud-decal/hr-light-mud-decal-13.png",
          width = 403,
          height = 311,
          shift = util.by_pixel(0.75, 3.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/light-mud-decal/light-mud-decal-14.png",
        width = 209,
        height = 152,
        shift = util.by_pixel(0.5, 2),
        hr_version =
        {
          filename = "__base__/graphics/decorative/light-mud-decal/hr-light-mud-decal-14.png",
          width = 418,
          height = 304,
          shift = util.by_pixel(0, 2),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/light-mud-decal/light-mud-decal-15.png",
        width = 199,
        height = 142,
        shift = util.by_pixel(-3.5, 6),
        hr_version =
        {
          filename = "__base__/graphics/decorative/light-mud-decal/hr-light-mud-decal-15.png",
          width = 398,
          height = 284,
          shift = util.by_pixel(-3.5, 6.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/light-mud-decal/light-mud-decal-16.png",
        width = 204,
        height = 154,
        shift = util.by_pixel(4, -1),
        hr_version =
        {
          filename = "__base__/graphics/decorative/light-mud-decal/hr-light-mud-decal-16.png",
          width = 406,
          height = 313,
          shift = util.by_pixel(4, 0.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/light-mud-decal/light-mud-decal-17.png",
        width = 210,
        height = 147,
        shift = util.by_pixel(1, 4.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/light-mud-decal/hr-light-mud-decal-17.png",
          width = 420,
          height = 294,
          shift = util.by_pixel(0.5, 4.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/light-mud-decal/light-mud-decal-18.png",
        width = 189,
        height = 145,
        shift = util.by_pixel(0.5, 5.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/light-mud-decal/hr-light-mud-decal-18.png",
          width = 379,
          height = 289,
          shift = util.by_pixel(0.25, 5.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/light-mud-decal/light-mud-decal-19.png",
        width = 201,
        height = 155,
        shift = util.by_pixel(-5.5, 1.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/light-mud-decal/hr-light-mud-decal-19.png",
          width = 401,
          height = 311,
          shift = util.by_pixel(-5.25, 1.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/light-mud-decal/light-mud-decal-20.png",
        width = 209,
        height = 158,
        shift = util.by_pixel(0.5, 1),
        hr_version =
        {
          filename = "__base__/graphics/decorative/light-mud-decal/hr-light-mud-decal-20.png",
          width = 418,
          height = 315,
          shift = util.by_pixel(0.5, 1.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/light-mud-decal/light-mud-decal-21.png",
        width = 208,
        height = 157,
        shift = util.by_pixel(1, 3.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/light-mud-decal/hr-light-mud-decal-21.png",
          width = 418,
          height = 314,
          shift = util.by_pixel(1, 3),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/light-mud-decal/light-mud-decal-22.png",
        width = 211,
        height = 135,
        shift = util.by_pixel(-0.5, 0.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/light-mud-decal/hr-light-mud-decal-22.png",
          width = 421,
          height = 270,
          shift = util.by_pixel(-0.25, 1),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/light-mud-decal/light-mud-decal-23.png",
        width = 202,
        height = 145,
        shift = util.by_pixel(2, -2.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/light-mud-decal/hr-light-mud-decal-23.png",
          width = 403,
          height = 290,
          shift = util.by_pixel(2.25, -2.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/light-mud-decal/light-mud-decal-24.png",
        width = 209,
        height = 158,
        shift = util.by_pixel(-0.5, 2),
        hr_version =
        {
          filename = "__base__/graphics/decorative/light-mud-decal/hr-light-mud-decal-24.png",
          width = 418,
          height = 315,
          shift = util.by_pixel(-0.5, 2.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/light-mud-decal/light-mud-decal-25.png",
        width = 207,
        height = 155,
        shift = util.by_pixel(-2.5, 4.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/light-mud-decal/hr-light-mud-decal-25.png",
          width = 414,
          height = 310,
          shift = util.by_pixel(-2, 4),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/light-mud-decal/light-mud-decal-26.png",
        width = 201,
        height = 154,
        shift = util.by_pixel(-3.5, 5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/light-mud-decal/hr-light-mud-decal-26.png",
          width = 403,
          height = 306,
          shift = util.by_pixel(-3.75, 5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/light-mud-decal/light-mud-decal-27.png",
        width = 208,
        height = 151,
        shift = util.by_pixel(1, 0.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/light-mud-decal/hr-light-mud-decal-27.png",
          width = 416,
          height = 303,
          shift = util.by_pixel(1, 0.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/light-mud-decal/light-mud-decal-28.png",
        width = 211,
        height = 155,
        shift = util.by_pixel(-0.5, 2.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/light-mud-decal/hr-light-mud-decal-28.png",
          width = 422,
          height = 311,
          shift = util.by_pixel(0, 2.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/light-mud-decal/light-mud-decal-29.png",
        width = 203,
        height = 146,
        shift = util.by_pixel(-3.5, 2),
        hr_version =
        {
          filename = "__base__/graphics/decorative/light-mud-decal/hr-light-mud-decal-29.png",
          width = 406,
          height = 292,
          shift = util.by_pixel(-3.5, 2),
          scale = 0.5
        }
      }
    }
  },
  {
    name = "sand-decal",
    type = "optimized-decorative",
    order = "b[decorative]-b[red-desert-decal]",
    collision_box = {{-7.21875, -5.9375}, {7.3125, 5.71875}},
    collision_mask = {"water-tile", "colliding-with-tiles-only"},
    render_layer = "decals",
    tile_layer = 59, -- despite the name, this is not sand exclusive decal; draw under stone path and concrete
    autoplace = decal_autoplace_settgins("sand-decal", {{0, 0.3}, {1, 1}}),
    pictures =
    {
      {
        filename = "__base__/graphics/decorative/sand-decal/sand-decal-01.png",
        width = 488,
        height = 332,
        hr_version =
        {
          filename = "__base__/graphics/decorative/sand-decal/hr-sand-decal-01.png",
          width = 975,
          height = 664,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/sand-decal/sand-decal-02.png",
        width = 314,
        height = 239,
        hr_version =
        {
          filename = "__base__/graphics/decorative/sand-decal/hr-sand-decal-02.png",
          width = 628,
          height = 477,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/sand-decal/sand-decal-03.png",
        width = 260,
        height = 166,
        hr_version =
        {
          filename = "__base__/graphics/decorative/sand-decal/hr-sand-decal-03.png",
          width = 519,
          height = 331,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/sand-decal/sand-decal-04.png",
        width = 435,
        height = 391,
        dice_y = 2,
        hr_version =
        {
          filename = "__base__/graphics/decorative/sand-decal/hr-sand-decal-04.png",
          width = 870,
          height = 781,
          dice_y = 2,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/sand-decal/sand-decal-05.png",
        width = 115,
        height = 81,
        hr_version =
        {
          filename = "__base__/graphics/decorative/sand-decal/hr-sand-decal-05.png",
          width = 230,
          height = 161,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/sand-decal/sand-decal-06.png",
        width = 70,
        height = 55,
        hr_version =
        {
          filename = "__base__/graphics/decorative/sand-decal/hr-sand-decal-06.png",
          width = 140,
          height = 110,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/sand-decal/sand-decal-07.png",
        width = 143,
        height = 122,
        hr_version =
        {
          filename = "__base__/graphics/decorative/sand-decal/hr-sand-decal-07.png",
          width = 285,
          height = 243,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/sand-decal/sand-decal-08.png",
        width = 78,
        height = 43,
        hr_version =
        {
          filename = "__base__/graphics/decorative/sand-decal/hr-sand-decal-08.png",
          width = 156,
          height = 85,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/sand-decal/sand-decal-09.png",
        width = 106,
        height = 76,
        hr_version =
        {
          filename = "__base__/graphics/decorative/sand-decal/hr-sand-decal-09.png",
          width = 212,
          height = 152,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/sand-decal/sand-decal-10.png",
        width = 117,
        height = 99,
        hr_version =
        {
          filename = "__base__/graphics/decorative/sand-decal/hr-sand-decal-10.png",
          width = 233,
          height = 197,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/sand-decal/sand-decal-11.png",
        width = 162,
        height = 207,
        hr_version =
        {
          filename = "__base__/graphics/decorative/sand-decal/hr-sand-decal-11.png",
          width = 324,
          height = 413,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/sand-decal/sand-decal-12.png",
        width = 252,
        height = 244,
        hr_version =
        {
          filename = "__base__/graphics/decorative/sand-decal/hr-sand-decal-12.png",
          width = 504,
          height = 488,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/sand-decal/sand-decal-13.png",
        width = 165,
        height = 153,
        hr_version =
        {
          filename = "__base__/graphics/decorative/sand-decal/hr-sand-decal-13.png",
          width = 329,
          height = 305,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/sand-decal/sand-decal-14.png",
        width = 406,
        height = 362,
        hr_version =
        {
          filename = "__base__/graphics/decorative/sand-decal/hr-sand-decal-14.png",
          width = 811,
          height = 724,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/sand-decal/sand-decal-15.png",
        width = 133,
        height = 131,
        hr_version =
        {
          filename = "__base__/graphics/decorative/sand-decal/hr-sand-decal-15.png",
          width = 266,
          height = 262,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/sand-decal/sand-decal-16.png",
        width = 461,
        height = 356,
        hr_version =
        {
          filename = "__base__/graphics/decorative/sand-decal/hr-sand-decal-16.png",
          width = 921,
          height = 712,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/sand-decal/sand-decal-17.png",
        width = 361,
        height = 198,
        hr_version =
        {
          filename = "__base__/graphics/decorative/sand-decal/hr-sand-decal-17.png",
          width = 722,
          height = 395,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/sand-decal/sand-decal-18.png",
        width = 94,
        height = 145,
        hr_version =
        {
          filename = "__base__/graphics/decorative/sand-decal/hr-sand-decal-18.png",
          width = 187,
          height = 289,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/sand-decal/sand-decal-19.png",
        width = 500,
        height = 187,
        hr_version =
        {
          filename = "__base__/graphics/decorative/sand-decal/hr-sand-decal-19.png",
          width = 999,
          height = 374,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/sand-decal/sand-decal-20.png",
        width = 392,
        height = 200,
        hr_version =
        {
          filename = "__base__/graphics/decorative/sand-decal/hr-sand-decal-20.png",
          width = 783,
          height = 399,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/sand-decal/sand-decal-21.png",
        width = 334,
        height = 203,
        hr_version =
        {
          filename = "__base__/graphics/decorative/sand-decal/hr-sand-decal-21.png",
          width = 668,
          height = 406,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/sand-decal/sand-decal-22.png",
        width = 219,
        height = 159,
        hr_version =
        {
          filename = "__base__/graphics/decorative/sand-decal/hr-sand-decal-22.png",
          width = 437,
          height = 318,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/sand-decal/sand-decal-23.png",
        width = 197,
        height = 123,
        hr_version =
        {
          filename = "__base__/graphics/decorative/sand-decal/hr-sand-decal-23.png",
          width = 394,
          height = 246,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/sand-decal/sand-decal-24.png",
        width = 181,
        height = 146,
        hr_version =
        {
          filename = "__base__/graphics/decorative/sand-decal/hr-sand-decal-24.png",
          width = 361,
          height = 291,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/sand-decal/sand-decal-25.png",
        width = 645,
        height = 641,
        dice_y = 4,
        hr_version =
        {
          filename = "__base__/graphics/decorative/sand-decal/hr-sand-decal-25.png",
          width = 1290,
          height = 1281,
          dice_y = 4,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/sand-decal/sand-decal-26.png",
        width = 157,
        height = 87,
        hr_version =
        {
          filename = "__base__/graphics/decorative/sand-decal/hr-sand-decal-26.png",
          width = 314,
          height = 174,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/sand-decal/sand-decal-27.png",
        width = 174,
        height = 132,
        hr_version =
        {
          filename = "__base__/graphics/decorative/sand-decal/hr-sand-decal-27.png",
          width = 348,
          height = 264,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/sand-decal/sand-decal-28.png",
        width = 244,
        height = 179,
        hr_version =
        {
          filename = "__base__/graphics/decorative/sand-decal/hr-sand-decal-28.png",
          width = 488,
          height = 357,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/sand-decal/sand-decal-29.png",
        width = 297,
        height = 317,
        hr_version =
        {
          filename = "__base__/graphics/decorative/sand-decal/hr-sand-decal-29.png",
          width = 594,
          height = 634,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/sand-decal/sand-decal-30.png",
        width = 98,
        height = 108,
        hr_version =
        {
          filename = "__base__/graphics/decorative/sand-decal/hr-sand-decal-30.png",
          width = 195,
          height = 215,
          scale = 0.5
        }
      }
    }
  },
  {
    name = "sand-dune-decal",
    type = "optimized-decorative",
    order = "b[decorative]-b[red-desert-decal]",
    collision_box = {{-1.78125, -1.34375}, {1.78125, 1.34375}},
    collision_mask = {"doodad-layer", "water-tile", "not-colliding-with-itself"},
    render_layer = "decals",
    tile_layer = 59,
    autoplace =
    {
      order = "a[doodad]-b[decal]",
      sharpness = 0.3,
      max_probability = 0.04,
      peaks =
      {
        peak,
        {
          influence = 0.5
        },
        {
          influence = 1,
          noise_layer = "sand-dune-decal",
          noise_octaves_difference = -3,
          noise_persistence = 0.7
        }
      },
      tile_restriction = { "sand-1" }
    },
    pictures =
    {
      --brownCarpet
      {
        filename = "__base__/graphics/decorative/brown-carpet-grass/brown-carpet-grass-06.png",
        priority = base_decorative_sprite_priority,
        width = 120,
        height = 111,
        shift = util.by_pixel(-1, -3.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/brown-carpet-grass/hr-brown-carpet-grass-06.png",
          priority = base_decorative_sprite_priority,
          width = 239,
          height = 220,
          shift = util.by_pixel(-1.25, -3.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/brown-carpet-grass/brown-carpet-grass-07.png",
        priority = base_decorative_sprite_priority,
        width = 121,
        height = 138,
        shift = util.by_pixel(6.5, -7),
        hr_version =
        {
          filename = "__base__/graphics/decorative/brown-carpet-grass/hr-brown-carpet-grass-07.png",
          priority = base_decorative_sprite_priority,
          width = 241,
          height = 274,
          shift = util.by_pixel(6.25, -7),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/brown-carpet-grass/brown-carpet-grass-08.png",
        priority = base_decorative_sprite_priority,
        width = 133,
        height = 131,
        shift = util.by_pixel(3.5, 0.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/brown-carpet-grass/hr-brown-carpet-grass-08.png",
          priority = base_decorative_sprite_priority,
          width = 266,
          height = 261,
          shift = util.by_pixel(3.5, 0.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/brown-carpet-grass/brown-carpet-grass-09.png",
        priority = base_decorative_sprite_priority,
        width = 133,
        height = 114,
        shift = util.by_pixel(10.5, -12),
        hr_version =
        {
          filename = "__base__/graphics/decorative/brown-carpet-grass/hr-brown-carpet-grass-09.png",
          priority = base_decorative_sprite_priority,
          width = 265,
          height = 228,
          shift = util.by_pixel(10.25, -11.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/brown-carpet-grass/brown-carpet-grass-10.png",
        priority = base_decorative_sprite_priority,
        width = 144,
        height = 146,
        shift = util.by_pixel(4, 3),
        hr_version =
        {
          filename = "__base__/graphics/decorative/brown-carpet-grass/hr-brown-carpet-grass-10.png",
          priority = base_decorative_sprite_priority,
          width = 288,
          height = 293,
          shift = util.by_pixel(4, 3.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/brown-carpet-grass/brown-carpet-grass-11.png",
        priority = base_decorative_sprite_priority,
        width = 135,
        height = 133,
        shift = util.by_pixel(4.5, -4.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/brown-carpet-grass/hr-brown-carpet-grass-11.png",
          priority = base_decorative_sprite_priority,
          width = 269,
          height = 265,
          shift = util.by_pixel(4.25, -4.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/brown-carpet-grass/brown-carpet-grass-00.png",
        priority = base_decorative_sprite_priority,
        width = 105,
        height = 97,
        shift = util.by_pixel(2.5, 8.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/brown-carpet-grass/hr-brown-carpet-grass-00.png",
          priority = base_decorative_sprite_priority,
          width = 211,
          height = 195,
          shift = util.by_pixel(2.25, 8.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/brown-carpet-grass/brown-carpet-grass-01.png",
        priority = base_decorative_sprite_priority,
        width = 124,
        height = 129,
        shift = util.by_pixel(0, -2.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/brown-carpet-grass/hr-brown-carpet-grass-01.png",
          priority = base_decorative_sprite_priority,
          width = 248,
          height = 259,
          shift = util.by_pixel(0, -2.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/brown-carpet-grass/brown-carpet-grass-02.png",
        priority = base_decorative_sprite_priority,
        width = 129,
        height = 131,
        shift = util.by_pixel(1.5, -2.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/brown-carpet-grass/hr-brown-carpet-grass-02.png",
          priority = base_decorative_sprite_priority,
          width = 258,
          height = 263,
          shift = util.by_pixel(1.5, -2.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/brown-carpet-grass/brown-carpet-grass-03.png",
        priority = base_decorative_sprite_priority,
        width = 141,
        height = 63,
        shift = util.by_pixel(4.5, -2.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/brown-carpet-grass/hr-brown-carpet-grass-03.png",
          priority = base_decorative_sprite_priority,
          width = 283,
          height = 126,
          shift = util.by_pixel(5.25, -2.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/brown-carpet-grass/brown-carpet-grass-04.png",
        priority = base_decorative_sprite_priority,
        width = 76,
        height = 133,
        shift = util.by_pixel(0, -7.5),
        hr_version =
        {
          filename = "__base__/graphics/decorative/brown-carpet-grass/hr-brown-carpet-grass-04.png",
          priority = base_decorative_sprite_priority,
          width = 152,
          height = 265,
          shift = util.by_pixel(0, -7.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/decorative/brown-carpet-grass/brown-carpet-grass-05.png",
        priority = base_decorative_sprite_priority,
        width = 123,
        height = 108,
        shift = util.by_pixel(3.5, -1),
        hr_version =
        {
          filename = "__base__/graphics/decorative/brown-carpet-grass/hr-brown-carpet-grass-05.png",
          priority = base_decorative_sprite_priority,
          width = 247,
          height = 216,
          shift = util.by_pixel(3.25, -1),
          scale = 0.5
        }
      }
    }
  },
  {
    name = "enemy-decal",
    type = "optimized-decorative",
    order = "b[decorative]-b[enemy-decal]",
    collision_box = {{-6, -4}, {6, 4}},
    collision_mask = {"water-tile", "colliding-with-tiles-only"},
    render_layer = "decals",
    tile_layer = 58,
    decal_overdraw_priority = 500,
    pictures =
    {
      {
        filename = "__base__/graphics/decorative/enemy-decal/enemy-decal-00.png",
        width = 508,
        height = 364,
        shift = util.by_pixel(0, 0),
        hr_version =
        {
          filename = "__base__/graphics/decorative/enemy-decal/hr-enemy-decal-00.png",
          width = 1016,
          height = 726,
          shift = util.by_pixel(0, 0),
          scale = 0.5,
        }
      },
      {
        filename = "__base__/graphics/decorative/enemy-decal/enemy-decal-01.png",
        width = 494,
        height = 316,
        shift = util.by_pixel(-8, 24),
        hr_version =
        {
          filename = "__base__/graphics/decorative/enemy-decal/hr-enemy-decal-01.png",
          width = 998,
          height = 722,
          shift = util.by_pixel(-4, 1),
          scale = 0.5,
        }
      },
      {
        filename = "__base__/graphics/decorative/enemy-decal/enemy-decal-02.png",
        width = 508,
        height = 360,
        shift = util.by_pixel(0, 0),
        hr_version =
        {
          filename = "__base__/graphics/decorative/enemy-decal/hr-enemy-decal-02.png",
          width = 1014,
          height = 718,
          shift = util.by_pixel(0, 0),
          scale = 0.5,
        }
      },
      {
        filename = "__base__/graphics/decorative/enemy-decal/enemy-decal-03.png",
        width = 508,
        height = 360,
        shift = util.by_pixel(0, -2),
        hr_version =
        {
          filename = "__base__/graphics/decorative/enemy-decal/hr-enemy-decal-03.png",
          width = 1010,
          height = 718,
          shift = util.by_pixel(1, 0),
          scale = 0.5,
        }
      },
      {
        filename = "__base__/graphics/decorative/enemy-decal/enemy-decal-04.png",
        width = 422,
        height = 362,
        shift = util.by_pixel(4, 0),
        hr_version =
        {
          filename = "__base__/graphics/decorative/enemy-decal/hr-enemy-decal-04.png",
          width = 862,
          height = 722,
          shift = util.by_pixel(4, 0),
          scale = 0.5,
        }
      },
      {
        filename = "__base__/graphics/decorative/enemy-decal/enemy-decal-05.png",
        width = 456,
        height = 292,
        shift = util.by_pixel(16, -2),
        hr_version =
        {
          filename = "__base__/graphics/decorative/enemy-decal/hr-enemy-decal-05.png",
          width = 920,
          height = 578,
          shift = util.by_pixel(14, -1),
          scale = 0.5,
        }
      },
      {
        filename = "__base__/graphics/decorative/enemy-decal/enemy-decal-06.png",
        width = 482,
        height = 322,
        shift = util.by_pixel(4, 14),
        hr_version =
        {
          filename = "__base__/graphics/decorative/enemy-decal/hr-enemy-decal-06.png",
          width = 968,
          height = 708,
          shift = util.by_pixel(3, -2),
          scale = 0.5,
        }
      },
      {
        filename = "__base__/graphics/decorative/enemy-decal/enemy-decal-07.png",
        width = 508,
        height = 360,
        shift = util.by_pixel(0, 0),
        hr_version =
        {
          filename = "__base__/graphics/decorative/enemy-decal/hr-enemy-decal-07.png",
          width = 1016,
          height = 722,
          shift = util.by_pixel(0, -1),
          scale = 0.5,
        }
      },
    }
  },
  {
    name = "enemy-decal-transparent",
    type = "optimized-decorative",
    order = "b[decorative]-b[enemy-decal]",
    collision_box = {{-6, -4}, {6, 4}},
    collision_mask = {"water-tile", "colliding-with-tiles-only"},
    render_layer = "decals",
    tile_layer = 57,
    decal_overdraw_priority = 100,
    pictures =
    {
      {
        filename = "__base__/graphics/decorative/enemy-decal/enemy-decal-t-00.png",
        width = 508,
        height = 360,
        shift = util.by_pixel(0, -2),
        hr_version =
        {
          filename = "__base__/graphics/decorative/enemy-decal/hr-enemy-decal-t-00.png",
          width = 1016,
          height = 720,
          shift = util.by_pixel(0, -2),
          scale = 0.5,
        }
      },
      {
        filename = "__base__/graphics/decorative/enemy-decal/enemy-decal-t-01.png",
        width = 470,
        height = 288,
        shift = util.by_pixel(-4, 22),
        hr_version =
        {
          filename = "__base__/graphics/decorative/enemy-decal/hr-enemy-decal-t-01.png",
          width = 936,
          height = 570,
          shift = util.by_pixel(-3, 23),
          scale = 0.5,
        }
      },
      {
        filename = "__base__/graphics/decorative/enemy-decal/enemy-decal-t-02.png",
        width = 422,
        height = 272,
        shift = util.by_pixel(-42, 22),
        hr_version =
        {
          filename = "__base__/graphics/decorative/enemy-decal/hr-enemy-decal-t-02.png",
          width = 848,
          height = 540,
          shift = util.by_pixel(-43, 23),
          scale = 0.5,
        }
      },
      {
        filename = "__base__/graphics/decorative/enemy-decal/enemy-decal-t-03.png",
        width = 484,
        height = 344,
        shift = util.by_pixel(4, -6),
        hr_version =
        {
          filename = "__base__/graphics/decorative/enemy-decal/hr-enemy-decal-t-03.png",
          width = 968,
          height = 690,
          shift = util.by_pixel(4, -7),
          scale = 0.5,
        }
      },
      {
        filename = "__base__/graphics/decorative/enemy-decal/enemy-decal-t-04.png",
        width = 402,
        height = 360,
        shift = util.by_pixel(6, -2),
        hr_version =
        {
          filename = "__base__/graphics/decorative/enemy-decal/hr-enemy-decal-t-04.png",
          width = 800,
          height = 720,
          shift = util.by_pixel(7, -2),
          scale = 0.5,
        }
      },
      {
        filename = "__base__/graphics/decorative/enemy-decal/enemy-decal-t-05.png",
        width = 426,
        height = 250,
        shift = util.by_pixel(16, 2),
        hr_version =
        {
          filename = "__base__/graphics/decorative/enemy-decal/hr-enemy-decal-t-05.png",
          width = 846,
          height = 496,
          shift = util.by_pixel(17, 3),
          scale = 0.5,
        }
      },
      {
        filename = "__base__/graphics/decorative/enemy-decal/enemy-decal-t-06.png",
        width = 458,
        height = 300,
        shift = util.by_pixel(6, 10),
        hr_version =
        {
          filename = "__base__/graphics/decorative/enemy-decal/hr-enemy-decal-t-06.png",
          width = 916,
          height = 602,
          shift = util.by_pixel(6, 9),
          scale = 0.5,
        }
      },
      {
        filename = "__base__/graphics/decorative/enemy-decal/enemy-decal-t-07.png",
        width = 504,
        height = 358,
        shift = util.by_pixel(2, -4),
        hr_version =
        {
          filename = "__base__/graphics/decorative/enemy-decal/hr-enemy-decal-t-07.png",
          width = 1004,
          height = 710,
          shift = util.by_pixel(3, -3),
          scale = 0.5,
        }
      },
    }
  },

  {
    name = "big-ship-wreck-grass",
    type = "optimized-decorative",
    order = "d[remnants]-d[ship-wreck-grass]-a[big]",
    collision_box = {{-2.5, -1.5}, {2.5, 1.5}},
    grows_through_rail_path = true,
    walking_sound = sounds.mud,
    trigger_effect = decorative_trigger_effects.big_ship_wreck_grass(),
    pictures =
    {
      {
        filename = "__base__/graphics/entity/ship-wreck/big-ship-wreck-grass.png",
        priority = base_decorative_sprite_priority,
        width = 206,
        height = 112
      }
    },
    render_layer = "floor"
  },
  {
    name = "small-ship-wreck-grass",
    type = "optimized-decorative",
    order = "d[remnants]-d[ship-wreck-grass]-b[small]",
    collision_box = {{-1.5, -0.5}, {1.5, 0.5}},
    grows_through_rail_path = true,
    walking_sound = sounds.mud,
    render_layer = "floor",
    trigger_effect = decorative_trigger_effects.small_ship_wreck_grass(),
    pictures =
    {
      {
        filename = "__base__/graphics/entity/ship-wreck/small-ship-wreck-grass-1.png",
        priority = base_decorative_sprite_priority,
        width = 129,
        height = 45
      },
      {
        filename = "__base__/graphics/entity/ship-wreck/small-ship-wreck-grass-2.png",
        priority = base_decorative_sprite_priority,
        width = 121,
        height = 34
      },
      {
        filename = "__base__/graphics/entity/ship-wreck/small-ship-wreck-grass-3.png",
        priority = base_decorative_sprite_priority,
        width = 115,
        height = 37
      }
    }
  },
  {
    name = "nuclear-ground-patch",
    type = "optimized-decorative",
    localised_name = { "decorative-name.concrete-hole-decal" }, -- FIXME: add locale when hard-freeze for 1.0 release ends
    order = "b[decorative]-b[red-desert-decal]",
    collision_box = {{-4.625, -3.25}, {4.6875, 3.125}},
    collision_mask = {"water-tile", "colliding-with-tiles-only"},
    render_layer = "decals",
    tile_layer = 59, -- above terrain tiles, bellow stone path
    pictures =
    {
      {
        filename = "__base__/graphics/decorative/nuclear-ground-patch/nuclear-ground-patch-00.png",
        priority = base_decorative_sprite_priority,
        width = 194,
        height = 144,
        shift = util.by_pixel(4, -8),
        hr_version =
        {
          filename = "__base__/graphics/decorative/nuclear-ground-patch/hr-nuclear-ground-patch-00.png",
          priority = base_decorative_sprite_priority,
          width = 388,
          height = 284,
          shift = util.by_pixel(4, -7),
          scale = 0.5,
        }
      },
      {
        filename = "__base__/graphics/decorative/nuclear-ground-patch/nuclear-ground-patch-01.png",
        priority = base_decorative_sprite_priority,
        width = 186,
        height = 132,
        shift = util.by_pixel(4, 8),
        hr_version =
        {
          filename = "__base__/graphics/decorative/nuclear-ground-patch/hr-nuclear-ground-patch-01.png",
          priority = base_decorative_sprite_priority,
          width = 372,
          height = 262,
          shift = util.by_pixel(4, 8),
          scale = 0.5,
        }
      },
      {
        filename = "__base__/graphics/decorative/nuclear-ground-patch/nuclear-ground-patch-02.png",
        priority = base_decorative_sprite_priority,
        width = 190,
        height = 126,
        shift = util.by_pixel(4, 2),
        hr_version =
        {
          filename = "__base__/graphics/decorative/nuclear-ground-patch/hr-nuclear-ground-patch-02.png",
          priority = base_decorative_sprite_priority,
          width = 374,
          height = 254,
          shift = util.by_pixel(5, 1),
          scale = 0.5,
        }
      },
      {
        filename = "__base__/graphics/decorative/nuclear-ground-patch/nuclear-ground-patch-03.png",
        priority = base_decorative_sprite_priority,
        width = 182,
        height = 128,
        shift = util.by_pixel(4, -4),
        hr_version =
        {
          filename = "__base__/graphics/decorative/nuclear-ground-patch/hr-nuclear-ground-patch-03.png",
          priority = base_decorative_sprite_priority,
          width = 364,
          height = 252,
          shift = util.by_pixel(4, -3),
          scale = 0.5,
        }
      },
      {
        filename = "__base__/graphics/decorative/nuclear-ground-patch/nuclear-ground-patch-04.png",
        priority = base_decorative_sprite_priority,
        width = 164,
        height = 130,
        shift = util.by_pixel(12, -2),
        hr_version =
        {
          filename = "__base__/graphics/decorative/nuclear-ground-patch/hr-nuclear-ground-patch-04.png",
          priority = base_decorative_sprite_priority,
          width = 328,
          height = 256,
          shift = util.by_pixel(12, -1),
          scale = 0.5,
        }
      },
      {
        filename = "__base__/graphics/decorative/nuclear-ground-patch/nuclear-ground-patch-05.png",
        priority = base_decorative_sprite_priority,
        width = 188,
        height = 130,
        shift = util.by_pixel(2, 8),
        hr_version =
        {
          filename = "__base__/graphics/decorative/nuclear-ground-patch/hr-nuclear-ground-patch-05.png",
          priority = base_decorative_sprite_priority,
          width = 374,
          height = 260,
          shift = util.by_pixel(2, 8),
          scale = 0.5,
        }
      }
    }
  },
}

--[[
-- FOR DEBUGGING PURPOSES

for k, v in pairs(data.raw["optimized-decorative"]) do
  data:extend
  {
    {
      type = "explosion",
      name = v.name .. "-explosion",
      icon = "__core__/graphics/icons/category/decorative-editor.png",
      icon_size = 128, icon_mipmaps = 0,
      flags = {"not-on-map"},
      subgroup = "decorative-explosions",
      order = "a-s-a",
      height = 0,
      animations = util.empty_sprite(),--explosion_animations.small_explosion(),
      light = { intensity = 1, size = 20 },
      smoke = "smoke-fast",
      smoke_count = 2,
      smoke_slow_down_factor = 1,
      sound = nil, --explosion_sounds.small(0.75),
      created_effect = { type = "direct", action_delivery = { type = "instant", target_effects = v.trigger_effect } }
    }
  }
end
--]]
