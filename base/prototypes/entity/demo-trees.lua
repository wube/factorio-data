local util = require('util')
local merge = util.merge
local sounds = require("prototypes.entity.demo-sounds")

local tree_emissions_per_second = -0.001
local dead_tree_emissions_per_second = -0.0001

local starting_area_clearing_radius = 128
local starting_area_clearing_border_width = 64

local starting_area_clearing_peak =
{
  influence = -0.25,
  richness_influence = 0,
  distance_optimal = 0,
  distance_range = starting_area_clearing_radius - starting_area_clearing_border_width,
  distance_max_range = starting_area_clearing_radius + starting_area_clearing_border_width,
  distance_top_property_limit = starting_area_clearing_radius, -- must be halfway between range and max_range so that influence never becomes positive!
}

local leaf_sound = sounds.tree_leaves

local leaf_sound_trigger =
{
  {
    type = "play-sound",
    sound = leaf_sound,
    damage_type_filters = "fire"
  }
}

local axe_hitting_wood_trigger =
{
  {
    type = "play-sound",
    sound = data.raw["utility-sounds"].default.mining_wood
  }
}

local next_tree_noise_layer_number = 1

local function tree_autoplace2(options)
  temperature_optimal = options.temperature_optimal
  temperature_range = options.temperature_range
  water_optimal = options.water_optimal
  water_range = options.water_range
  static_influence = options.static_influence or 0 -- Added to influence
  tree_noise_influence = options.tree_noise_influence or 1 -- Multiplied by noise
  richness_base = options.richness_base or 0
  richness_multiplier = options.richness_multiplier or 1

  static_influence = static_influence - 0.75 -- Less trees everywhere!
  tree_noise_influence = tree_noise_influence * 0.5 -- Less noise everywhere!

  local tree_noise_layer_name = "trees-"..next_tree_noise_layer_number
  if tree_noise_influence ~= 0 then
    data:extend{
      {
        type = "noise-layer",
        name = tree_noise_layer_name
      }
    }
    next_tree_noise_layer_number = next_tree_noise_layer_number + 1
  end

  return
  {
    control = "trees",
    order = "a[tree]-b[forest]",
    max_probability = 0.45,
    random_probability_penalty = 1e-3,
    sharpness = 0.4,
    richness_base = richness_base,
    richness_multiplier = richness_multiplier,
    peaks =
    {
      {
        -- increase richness everywhere to reduce
        -- large groups of unhealthy trees
        influence = 0,
        richness_influence = 0.75
      },
      {
        influence = static_influence,
        richness_influence = -static_influence
      },
      {
        -- Give each tree type its own noise layer to add some randomness
        -- to the boundaries between types of forests.
        -- This results in more forest coverage overall so has to be countered
        -- with more negative static influence.
        influence = tree_noise_influence * 3/4,
        richness_influence = -tree_noise_influence,
        noise_layer = tree_noise_layer_name,
        noise_persistence = 0.8,
        noise_octaves_difference = -0.5
      },
      {
        influence = tree_noise_influence,
        richness_influence = -tree_noise_influence,
        noise_layer = "trees",
        noise_persistence = 0.6,
        noise_octaves_difference = -0.5
      },
      {
        influence = 1,
        richness_influence = 0,
        temperature_optimal = temperature_optimal,
        temperature_range = temperature_range,
        temperature_max_range = temperature_range * 1.5,
        water_optimal = water_optimal,
        water_range = water_range,
        water_max_range = water_range * 1.5
      },
      starting_area_clearing_peak
    }
  }
end

-- static_influence is added
-- tree_noise_influence is multiplied by tree noise, the result of which is added
local function tree_autoplace( temperature_optimal, temperature_range, water_optimal, water_range, static_influence, tree_noise_influence )
  return tree_autoplace2
  {
    temperature_optimal = temperature_optimal,
    temperature_range = temperature_range,
    water_optimal = water_optimal,
    water_range = water_range,
    static_influence = static_influence,
    tree_noise_influence = tree_noise_influence,
  }
end

local function dead_trees_autoplace(relative_probability)
  return
  {
    control = "trees",
    max_probability = 1e-2 * relative_probability,
    sharpness = 0.6,
    order = "a[tree]-b[forest]",
    random_probability_penalty = 1e-2 * relative_probability,
    peaks =
    {
      {
        influence = -0.8,
        richness_influence = 0
      },
      {
        influence = 1,
        richness_influence = 0,
        noise_layer = "trees",
        noise_persistence = 0.5,
        noise_octaves_difference = -1.5
      },
      {
        influence = 1,
        richness_influence = 0,
        temperature_optimal = 15,
        temperature_range = 20,
        temperature_max_range = 30,
        water_optimal = 0.15,
        water_range = 0.15,
        water_max_range = 0.2
      },
      starting_area_clearing_peak
    }
  }
end

local tree_types =
{
  { -- tree-01
    { -- a
      trunk =
      {
        width = 73,
        height = 171,
        shift = util.by_pixel(0, -70),
        hr_version =
        {
          width = 140,
          height = 340,
          shift = util.by_pixel(2, -69),
          scale = 0.5
        }
      },
      stump =
      {
        width = 39,
        height = 35,
        shift = util.by_pixel(-2, -2),
        hr_version =
        {
          width = 76,
          height = 68,
          shift = util.by_pixel(-1, -1),
          scale = 0.5
        }
      },
      shadow =
      {
        width = 163,
        height = 67,
        shift = util.by_pixel(60, -2),
        hr_version =
        {
          width = 324,
          height = 134,
          shift = util.by_pixel(61, -2),
          scale = 0.5
        }
      },
      leaves =
      {
        width = 93,
        height = 151,
        shift = util.by_pixel(-2, -74),
        hr_version =
        {
          width = 184,
          height = 306,
          shift = util.by_pixel(-1, -74),
          scale = 0.5,
        }
      },
      normal =
      {
        width = 94,
        height = 146,
        shift = util.by_pixel(0, -76),
        hr_version =
        {
	    width = 184,
	    height = 290,
	    shift = util.by_pixel(-0.5, -76),
          scale = 0.5
        }
      },
    },
    { -- b
      trunk =
      {
        width = 65,
        height = 165,
        shift = util.by_pixel(4, -68),
        hr_version =
        {
          width = 132,
          height = 326,
          shift = util.by_pixel(4, -66),
          scale = 0.5
        }
      },
      stump =
      {
        width = 39,
        height = 33,
        shift = util.by_pixel(-2, -2),
        hr_version =
        {
          width = 72,
          height = 66,
          shift = util.by_pixel(0, -1),
          scale = 0.5
        }
      },
      shadow =
      {
        width = 159,
        height = 67,
        shift = util.by_pixel(62, -2),
        hr_version =
        {
          width = 312,
          height = 126,
          shift = util.by_pixel(64, 0),
          scale = 0.5
        }
      },
      leaves =
      {
        width = 91,
        height = 157,
        shift = util.by_pixel(0, -72),
        hr_version =
        {
          width = 182,
          height = 316,
          shift = util.by_pixel(1, -72),
          scale = 0.5
        }
      },
	  normal =
      {
        width = 90,
        height = 150,
        shift = util.by_pixel(2, -75),
        hr_version =
        {
	      width = 180,
	      height = 300,
	      shift = util.by_pixel(2, -75),
          scale = 0.5
        }
      },
    },
    { -- c
      trunk =
      {
        width = 71,
        height = 167,
        shift = util.by_pixel(-6, -70),
        hr_version =
        {
          width = 136,
          height = 330,
          shift = util.by_pixel(-4, -68),
          scale = 0.5
        }
      },
      stump =
      {
        width = 39,
        height = 33,
        shift = util.by_pixel(-2, -2),
        hr_version =
        {
          width = 74,
          height = 62,
          shift = util.by_pixel(0, -1),
          scale = 0.5
        }
      },
      shadow =
      {
        width = 155,
        height = 65,
        shift = util.by_pixel(58, 0),
        hr_version =
        {
          width = 306,
          height = 132,
          shift = util.by_pixel(59, 0),
          scale = 0.5
        }
      },
      leaves =
      {
        width = 93,
        height = 157,
        shift = util.by_pixel(-2, -74),
        hr_version =
        {
          width = 180,
          height = 308,
          shift = util.by_pixel(0, -72),
          scale = 0.5
        }
      },
	  normal =
      {
        width = 92,
        height = 154,
        shift = util.by_pixel(1, -70),
        hr_version =
        {
	      width = 182,
	      height = 306,
	      shift = util.by_pixel(0.5, -70),
          scale = 0.5
        }
      },
    },
    { -- d
      trunk =
      {
        width = 57,
        height = 163,
        shift = util.by_pixel(0, -68),
        hr_version =
        {
          width = 108,
          height = 324,
          shift = util.by_pixel(2, -67),
          scale = 0.5
        }
      },
      stump =
      {
        width = 41,
        height = 35,
        shift = util.by_pixel(0, -4),
        hr_version =
        {
          width = 82,
          height = 68,
          shift = util.by_pixel(0, -3),
          scale = 0.5
        }
      },
      shadow =
      {
        width = 145,
        height = 67,
        shift = util.by_pixel(58, -4),
        hr_version =
        {
          width = 288,
          height = 130,
          shift = util.by_pixel(59, -3),
          scale = 0.5
        }
      },
      leaves =
      {
        width = 95,
        height = 153,
        shift = util.by_pixel(0, -72),
        hr_version =
        {
          width = 188,
          height = 310,
          shift = util.by_pixel(1, -72),
          scale = 0.5
        }
      },
	  normal =
      {
        width = 94,
        height = 144,
        shift = util.by_pixel(2, -75),
        hr_version =
        {
	      width = 188,
	      height = 286,
	      shift = util.by_pixel(2, -75.5),
          scale = 0.5
        }
      },
    },
    { -- e
      trunk =
      {
        width = 69,
        height = 165,
        shift = util.by_pixel(2, -68),
        hr_version =
        {
          width = 138,
          height = 324,
          shift = util.by_pixel(2, -66),
          scale = 0.5
        }
      },
      stump =
      {
        width = 39,
        height = 33,
        shift = util.by_pixel(0, -2),
        hr_version =
        {
          width = 78,
          height = 62,
          shift = util.by_pixel(0, -1),
          scale = 0.5
        }
      },
      shadow =
      {
        width = 159,
        height = 69,
        shift = util.by_pixel(66, 0),
        hr_version =
        {
          width = 314,
          height = 136,
          shift = util.by_pixel(67, 1),
          scale = 0.5
        }
      },
      leaves =
      {
        width = 97,
        height = 143,
        shift = util.by_pixel(2, -68),
        hr_version =
        {
          width = 190,
          height = 300,
          shift = util.by_pixel(3, -71),
          scale = 0.5
        }
      },
	  normal =
      {
        width = 96,
        height = 140,
        shift = util.by_pixel(4, -68),
        hr_version =
        {
	      width = 190,
	      height = 280,
	      shift = util.by_pixel(4, -68),
          scale = 0.5
        }
      },
    },
    { -- f
      trunk =
      {
        width = 63,
        height = 165,
        shift = util.by_pixel(-6, -66),
        hr_version =
        {
          width = 118,
          height = 326,
          shift = util.by_pixel(-4, -65),
          scale = 0.5
        }
      },
      stump =
      {
        width = 41,
        height = 37,
        shift = util.by_pixel(-2, -2),
        hr_version =
        {
          width = 76,
          height = 70,
          shift = util.by_pixel(0, -1),
          scale = 0.5
        }
      },
      shadow =
      {
        width = 151,
        height = 71,
        shift = util.by_pixel(56, 0),
        hr_version =
        {
          width = 304,
          height = 140,
          shift = util.by_pixel(56, 1),
          scale = 0.5
        }
      },
      leaves =
      {
        width = 97,
        height = 153,
        shift = util.by_pixel(-4, -68),
        hr_version =
        {
          width = 190,
          height = 304,
          shift = util.by_pixel(-3, -67),
          scale = 0.5
        }
      },
	  normal =
      {
        width = 96,
        height = 140,
        shift = util.by_pixel(-2, -71),
        hr_version =
        {
	      width = 190,
	      height = 278,
	      shift = util.by_pixel(-2, -71),
          scale = 0.5
        }
      },
    },
    { -- g
      trunk =
      {
        width = 71,
        height = 147,
        shift = util.by_pixel(-2, -60),
        hr_version =
        {
          width = 142,
          height = 294,
          shift = util.by_pixel(-2, -59),
          scale = 0.5
        }
      },
      stump =
      {
        width = 37,
        height = 33,
        shift = util.by_pixel(-2, -2),
        hr_version =
        {
          width = 72,
          height = 62,
          shift = util.by_pixel(-1, -1),
          scale = 0.5
        }
      },
      shadow =
      {
        width = 127,
        height = 69,
        shift = util.by_pixel(40, -4),
        hr_version =
        {
          width = 252,
          height = 130,
          shift = util.by_pixel(41, -2),
          scale = 0.5
        }
      },
      leaves =
      {
        width = 93,
        height = 139,
        shift = util.by_pixel(-4, -62),
        hr_version =
        {
          width = 184,
          height = 274,
          shift = util.by_pixel(-3, -61),
          scale = 0.5
        }
      },
	  normal =
      {
        width = 94,
        height = 124,
        shift = util.by_pixel(-2, -62),
        hr_version =
        {
          width = 186,
          height = 248,
          shift = util.by_pixel(-2.5, -62),
          scale = 0.5
        }
      },
    },
    { -- h
      trunk =
      {
        width = 57,
        height = 151,
        shift = util.by_pixel(4, -62),
        hr_version =
        {
          width = 116,
          height = 296,
          shift = util.by_pixel(4, -60),
          scale = 0.5
        }
      },
      stump =
      {
        width = 37,
        height = 35,
        shift = util.by_pixel(-2, -4),
        hr_version =
        {
          width = 70,
          height = 64,
          shift = util.by_pixel(-1, -2),
          scale = 0.5
        }
      },
      shadow =
      {
        width = 135,
        height = 67,
        shift = util.by_pixel(54, -4),
        hr_version =
        {
          width = 266,
          height = 130,
          shift = util.by_pixel(55, -3),
          scale = 0.5
        }
      },
      leaves =
      {
        width = 91,
        height = 141,
        shift = util.by_pixel(0, -64),
        hr_version =
        {
          width = 180,
          height = 282,
          shift = util.by_pixel(1, -63),
          scale = 0.5
        }
      },
	  normal =
      {
        width = 92,
        height = 122,
        shift = util.by_pixel(2, -61),
        hr_version =
        {
          width = 180,
          height = 244,
          shift = util.by_pixel(1.5, -61),
          scale = 0.5
        }
      },
    },
    { -- i
      trunk =
      {
        width = 63,
        height = 123,
        shift = util.by_pixel(-2, -50),
        hr_version =
        {
          width = 120,
          height = 244,
          shift = util.by_pixel(0, -49),
          scale = 0.5
        }
      },
      stump =
      {
        width = 41,
        height = 35,
        shift = util.by_pixel(2, -6),
        hr_version =
        {
          width = 82,
          height = 68,
          shift = util.by_pixel(2, -5),
          scale = 0.5
        }
      },
      shadow =
      {
        width = 113,
        height = 61,
        shift = util.by_pixel(50, 2),
        hr_version =
        {
          width = 228,
          height = 118,
          shift = util.by_pixel(50, 3),
          scale = 0.5
        }
      },
      leaves =
      {
        width = 79,
        height = 115,
        shift = util.by_pixel(-4, -52),
        hr_version =
        {
          width = 152,
          height = 234,
          shift = util.by_pixel(-2, -52),
          scale = 0.5
        }
      },
	  normal =
      {
        width = 78,
        height = 100,
        shift = util.by_pixel(-1, -56),
        hr_version =
        {
          width = 152,
          height = 196,
          shift = util.by_pixel(-1.5, -56.5),
          scale = 0.5
        }
      },
    },
    { -- j
      trunk =
      {
        width = 55,
        height = 127,
        shift = util.by_pixel(0, -52),
        hr_version =
        {
          width = 110,
          height = 250,
          shift = util.by_pixel(0, -50),
          scale = 0.5
        }
      },
      stump =
      {
        width = 39,
        height = 39,
        shift = util.by_pixel(2, -8),
        hr_version =
        {
          width = 74,
          height = 74,
          shift = util.by_pixel(3, -6),
          scale = 0.5
        }
      },
      shadow =
      {
        width = 109,
        height = 53,
        shift = util.by_pixel(48, -4),
        hr_version =
        {
          width = 212,
          height = 104,
          shift = util.by_pixel(50, -3),
          scale = 0.5
        }
      },
      leaves =
      {
        width = 67,
        height = 115,
        shift = util.by_pixel(0, -52),
        hr_version =
        {
          width = 134,
          height = 228,
          shift = util.by_pixel(0, -51),
          scale = 0.5
        }
      },
	  normal =
      {
        width = 68,
        height = 98,
        shift = util.by_pixel(2, -58),
        hr_version =
        {
		  width = 134,
		  height = 194,
		  shift = util.by_pixel(1.5, -58.5),
          scale = 0.5
        }
      },
    },
    { -- k
      trunk =
      {
        width = 129,
        height = 111,
        shift = util.by_pixel(10, -14),
        hr_version =
        {
          width = 258,
          height = 224,
          shift = util.by_pixel(10, -13),
          scale = 0.5
        }
      },
      stump =
      {
        width = 45,
        height = 39,
        shift = util.by_pixel(-10, 4),
        hr_version =
        {
          width = 86,
          height = 78,
          shift = util.by_pixel(-9, 4),
          scale = 0.5
        }
      },
      shadow =
      {
        width = 129,
        height = 107,
        shift = util.by_pixel(12, -14),
        hr_version =
        {
          width = 256,
          height = 212,
          shift = util.by_pixel(13, -13),
          scale = 0.5
        }
      },
      leaves =
      {
        width = 123,
        height = 95,
        shift = util.by_pixel(10, -16),
        hr_version =
        {
          width = 250,
          height = 206,
          shift = util.by_pixel(10, -12),
          scale = 0.5
        }
      },
	  normal =
      {
        width = 94,
        height = 76,
        shift = util.by_pixel(26, -26),
        hr_version =
        {
		  width = 186,
		  height = 150,
		  shift = util.by_pixel(26, -26),
          scale = 0.5
        }
      },
    },
    { -- l
      trunk =
      {
        width = 309,
        height = 59,
        shift = util.by_pixel(32, 6),
        hr_version =
        {
          width = 620,
          height = 116,
          shift = util.by_pixel(32, 7),
          scale = 0.5
        }
      },
      stump =
      {
        width = 197,
        height = 101,
        shift = util.by_pixel(88, 30),
        hr_version =
        {
          width = 396,
          height = 202,
          shift = util.by_pixel(88, 31),
          scale = 0.5
        }
      },
      shadow =
      {
        width = 185,
        height = 49,
        shift = util.by_pixel(-30, 4),
        hr_version =
        {
          width = 366,
          height = 94,
          shift = util.by_pixel(-29, 5),
          scale = 0.5
        }
      },
      leaves =
      {
        width = 171,
        height = 57,
        shift = util.by_pixel(-34, 0),
        hr_version =
        {
          width = 354,
          height = 114,
          shift = util.by_pixel(-31, 0),
          scale = 0.5
        }
      },
	  normal =
      {
        width = 122,
        height = 56,
        shift = util.by_pixel(-52, 1),
        hr_version =
        {
          width = 240,
          height = 112,
          shift = util.by_pixel(-52.5, 1),
          scale = 0.5
        }
      },
    }
  },
  { -- tree-02
    { -- a
      trunk =
      {
        width = 82,
        height = 162,
        shift = util.by_pixel(0, -66),
        hr_version =
        {
          width = 162,
          height = 324,
          shift = util.by_pixel(1, -65),
          scale = 0.5
        }
      },
      stump =
      {
        width = 44,
        height = 34,
        shift = util.by_pixel(2, -2),
        hr_version =
        {
          width = 88,
          height = 70,
          shift = util.by_pixel(2, -2),
          scale = 0.5
        }
      },
      shadow =
      {
        width = 196,
        height = 64,
        shift = util.by_pixel(90, -2),
        hr_version =
        {
          width = 384,
          height = 130,
          shift = util.by_pixel(92, -2),
          scale = 0.5
        }
      },
      leaves =
      {
        width = 96,
        height = 154,
        shift = util.by_pixel(-2, -74),
        hr_version =
        {
          width = 184,
          height = 310,
          shift = util.by_pixel(0, -74),
          scale = 0.5
        }
      },
	  normal =
      {
        width = 94,
        height = 146,
        shift = util.by_pixel(1, -78),
        hr_version =
        {
		  width = 186,
		  height = 292,
		  shift = util.by_pixel(0.5, -78),
          scale = 0.5
        }
      },
    },
    { -- b
      trunk =
      {
        width = 76,
        height = 142,
        shift = util.by_pixel(-4, -60),
        hr_version =
        {
          width = 150,
          height = 286,
          shift = util.by_pixel(-3, -59),
          scale = 0.5
        }
      },
      stump =
      {
        width = 38,
        height = 30,
        shift = util.by_pixel(2, -4),
        hr_version =
        {
          width = 78,
          height = 60,
          shift = util.by_pixel(2, -3),
          scale = 0.5
        }
      },
      shadow =
      {
        width = 186,
        height = 68,
        shift = util.by_pixel(86, 0),
        hr_version =
        {
          width = 372,
          height = 134,
          shift = util.by_pixel(86, 1),
          scale = 0.5
        }
      },
      leaves =
      {
        width = 92,
        height = 136,
        shift = util.by_pixel(-2, -62),
        hr_version =
        {
          width = 184,
          height = 274,
          shift = util.by_pixel(-2, -62),
          scale = 0.5
        }
      },
	  normal =
      {
        width = 92,
        height = 132,
        shift = util.by_pixel(-1, -64),
        hr_version =
        {
		  width = 184,
		  height = 262,
		  shift = util.by_pixel(-1, -64),
          scale = 0.5
        }
      },
    },
    { -- c
      trunk =
      {
        width = 72,
        height = 140,
        shift = util.by_pixel(-4, -58),
        hr_version =
        {
          width = 144,
          height = 280,
          shift = util.by_pixel(-4, -57),
          scale = 0.5
        }
      },
      stump =
      {
        width = 38,
        height = 32,
        shift = util.by_pixel(2, -4),
        hr_version =
        {
          width = 78,
          height = 60,
          shift = util.by_pixel(2, -2),
          scale = 0.5
        }
      },
      shadow =
      {
        width = 176,
        height = 64,
        shift = util.by_pixel(76, -2),
        hr_version =
        {
          width = 352,
          height = 128,
          shift = util.by_pixel(77, -2),
          scale = 0.5
        }
      },
      leaves =
      {
        width = 90,
        height = 130,
        shift = util.by_pixel(-2, -62),
        hr_version =
        {
          width = 178,
          height = 264,
          shift = util.by_pixel(-1, -62),
          scale = 0.5
        }
      },
	  normal =
      {
        width = 90,
        height = 124,
        shift = util.by_pixel(0, -66),
        hr_version =
        {
		  width = 178,
		  height = 244,
		  shift = util.by_pixel(0, -66.5),
          scale = 0.5
        }
      },
    },
    { -- d
      trunk =
      {
        width = 72,
        height = 168,
        shift = util.by_pixel(6, -70),
        hr_version =
        {
          width = 142,
          height = 336,
          shift = util.by_pixel(7, -70),
          scale = 0.5
        }
      },
      stump =
      {
        width = 52,
        height = 40,
        shift = util.by_pixel(6, -6),
        hr_version =
        {
          width = 102,
          height = 80,
          shift = util.by_pixel(7, -6),
          scale = 0.5
        }
      },
      shadow =
      {
        width = 200,
        height = 66,
        shift = util.by_pixel(94, -4),
        hr_version =
        {
          width = 402,
          height = 134,
          shift = util.by_pixel(94, -4),
          scale = 0.5
        }
      },
      leaves =
      {
        width = 90,
        height = 166,
        shift = util.by_pixel(6, -76),
        hr_version =
        {
          width = 180,
          height = 330,
          shift = util.by_pixel(6, -75),
          scale = 0.5
        }
      },
	  normal =
      {
        width = 90,
        height = 152,
        shift = util.by_pixel(7, -82),
        hr_version =
        {
		  width = 180,
		  height = 302,
		  shift = util.by_pixel(7, -82),
          scale = 0.5
        }
      },
    },
    { -- e
      trunk =
      {
        width = 86,
        height = 144,
        shift = util.by_pixel(2, -58),
        hr_version =
        {
          width = 168,
          height = 286,
          shift = util.by_pixel(3, -57),
          scale = 0.5
        }
      },
      stump =
      {
        width = 50,
        height = 40,
        shift = util.by_pixel(8, -6),
        hr_version =
        {
          width = 100,
          height = 78,
          shift = util.by_pixel(8, -5),
          scale = 0.5
        }
      },
      shadow =
      {
        width = 204,
        height = 70,
        shift = util.by_pixel(96, 6),
        hr_version =
        {
          width = 410,
          height = 144,
          shift = util.by_pixel(96, 6),
          scale = 0.5
        }
      },
      leaves =
      {
        width = 98,
        height = 140,
        shift = util.by_pixel(0, -64),
        hr_version =
        {
          width = 194,
          height = 276,
          shift = util.by_pixel(1, -63),
          scale = 0.5
        }
      },
	  normal =
      {
        width = 98,
        height = 138,
        shift = util.by_pixel(2, -64),
        hr_version =
        {
		  width = 194,
		  height = 272,
		  shift = util.by_pixel(2, -64.5),
          scale = 0.5
        }
      },
    },
    { -- f
      trunk =
      {
        width = 74,
        height = 156,
        shift = util.by_pixel(-12, -64),
        hr_version =
        {
          width = 144,
          height = 310,
          shift = util.by_pixel(-10, -63),
          scale = 0.5
        }
      },
      stump =
      {
        width = 48,
        height = 40,
        shift = util.by_pixel(6, -6),
        hr_version =
        {
          width = 96,
          height = 78,
          shift = util.by_pixel(6, -5),
          scale = 0.5
        }
      },
      shadow =
      {
        width = 170,
        height = 64,
        shift = util.by_pixel(76, 0),
        hr_version =
        {
          width = 344,
          height = 130,
          shift = util.by_pixel(75, 0),
          scale = 0.5
        }
      },
      leaves =
      {
        width = 92,
        height = 150,
        shift = util.by_pixel(-10, -68),
        hr_version =
        {
          width = 184,
          height = 302,
          shift = util.by_pixel(-10, -68),
          scale = 0.5
        }
      },
	  normal =
      {
        width = 92,
        height = 148,
        shift = util.by_pixel(-9, -69),
        hr_version =
        {
		  width = 184,
		  height = 292,
		  shift = util.by_pixel(-9, -69.5),
          scale = 0.5
        }
      },
    },
    { -- g
      trunk =
      {
        width = 86,
        height = 140,
        shift = util.by_pixel(4, -56),
        hr_version =
        {
          width = 168,
          height = 282,
          shift = util.by_pixel(6, -56),
          scale = 0.5
        }
      },
      stump =
      {
        width = 38,
        height = 32,
        shift = util.by_pixel(0, -2),
        hr_version =
        {
          width = 78,
          height = 66,
          shift = util.by_pixel(0, -2),
          scale = 0.5
        }
      },
      shadow =
      {
        width = 188,
        height = 64,
        shift = util.by_pixel(86, -6),
        hr_version =
        {
          width = 384,
          height = 122,
          shift = util.by_pixel(84, -4),
          scale = 0.5
        }
      },
      leaves =
      {
        width = 100,
        height = 136,
        shift = util.by_pixel(4, -68),
        hr_version =
        {
          width = 198,
          height = 270,
          shift = util.by_pixel(5, -67),
          scale = 0.5
        }
      },
	  normal =
      {
        width = 98,
        height = 120,
        shift = util.by_pixel(6, -74),
        hr_version =
        {
		  width = 196,
		  height = 238,
		  shift = util.by_pixel(6, -74.5),
          scale = 0.5
        }
      },
    },
    { -- h
      trunk =
      {
        width = 92,
        height = 124,
        shift = util.by_pixel(-10, -48),
        hr_version =
        {
          width = 182,
          height = 244,
          shift = util.by_pixel(-8, -47),
          scale = 0.5
        }
      },
      stump =
      {
        width = 38,
        height = 32,
        shift = util.by_pixel(2, -2),
        hr_version =
        {
          width = 80,
          height = 66,
          shift = util.by_pixel(1, -2),
          scale = 0.5
        }
      },
      shadow =
      {
        width = 154,
        height = 60,
        shift = util.by_pixel(68, 4),
        hr_version =
        {
          width = 306,
          height = 118,
          shift = util.by_pixel(69, 5),
          scale = 0.5
        }
      },
      leaves =
      {
        width = 96,
        height = 116,
        shift = util.by_pixel(-8, -58),
        hr_version =
        {
          width = 192,
          height = 234,
          shift = util.by_pixel(-7, -58),
          scale = 0.5
        }
      },
	  normal =
      {
        width = 96,
        height = 112,
        shift = util.by_pixel(-6, -60),
        hr_version =
        {
		  width = 190,
		  height = 220,
		  shift = util.by_pixel(-6, -60.5),
          scale = 0.5
        }
      },
    },
    { -- i
      trunk =
      {
        width = 62,
        height = 102,
        shift = util.by_pixel(4, -38),
        hr_version =
        {
          width = 126,
          height = 206,
          shift = util.by_pixel(4, -38),
          scale = 0.5
        }
      },
      stump =
      {
        width = 44,
        height = 38,
        shift = util.by_pixel(6, -6),
        hr_version =
        {
          width = 88,
          height = 74,
          shift = util.by_pixel(7, -5),
          scale = 0.5
        }
      },
      shadow =
      {
        width = 132,
        height = 54,
        shift = util.by_pixel(60, 0),
        hr_version =
        {
          width = 262,
          height = 110,
          shift = util.by_pixel(61, 0),
          scale = 0.5
        }
      },
      leaves =
      {
        width = 78,
        height = 96,
        shift = util.by_pixel(2, -48),
        hr_version =
        {
          width = 152,
          height = 194,
          shift = util.by_pixel(4, -48),
          scale = 0.5
        }
      },
	  normal =
      {
        width = 76,
        height = 98,
        shift = util.by_pixel(5, -47),
        hr_version =
        {
		  width = 152,
		  height = 194,
		  shift = util.by_pixel(5, -47),
          scale = 0.5
        }
      },
    },
    { -- j
      trunk =
      {
        width = 64,
        height = 96,
        shift = util.by_pixel(-8, -36),
        hr_version =
        {
          width = 128,
          height = 194,
          shift = util.by_pixel(-8, -36),
          scale = 0.5
        }
      },
      stump =
      {
        width = 40,
        height = 32,
        shift = util.by_pixel(6, -4),
        hr_version =
        {
          width = 84,
          height = 66,
          shift = util.by_pixel(5, -4),
          scale = 0.5
        }
      },
      shadow =
      {
        width = 124,
        height = 56,
        shift = util.by_pixel(54, -2),
        hr_version =
        {
          width = 248,
          height = 108,
          shift = util.by_pixel(55, -1),
          scale = 0.5
        }
      },
      leaves =
      {
        width = 78,
        height = 100,
        shift = util.by_pixel(-8, -48),
        hr_version =
        {
          width = 152,
          height = 198,
          shift = util.by_pixel(-7, -47),
          scale = 0.5
        }
      },
	  normal =
      {
        width = 78,
        height = 100,
        shift = util.by_pixel(-6, -47),
        hr_version =
        {
		  width = 152,
		  height = 200,
		  shift = util.by_pixel(-6.5, -46.5),
          scale = 0.5
        }
      },
    },
    { -- k
      trunk =
      {
        width = 120,
        height = 124,
        shift = util.by_pixel(4, -20),
        hr_version =
        {
          width = 234,
          height = 244,
          shift = util.by_pixel(6, -19),
          scale = 0.5
        }
      },
      stump =
      {
        width = 70,
        height = 66,
        shift = util.by_pixel(0, 4),
        hr_version =
        {
          width = 138,
          height = 130,
          shift = util.by_pixel(1, 5),
          scale = 0.5
        }
      },
      shadow =
      {
        width = 124,
        height = 132,
        shift = util.by_pixel(12, -20),
        hr_version =
        {
          width = 248,
          height = 262,
          shift = util.by_pixel(12, -19),
          scale = 0.5
        }
      },
      leaves =
      {
        width = 106,
        height = 132,
        shift = util.by_pixel(14, -32),
        hr_version =
        {
          width = 216,
          height = 264,
          shift = util.by_pixel(13, -30),
          scale = 0.5
        }
      },
	  normal =
      {
        width = 108,
        height = 108,
        shift = util.by_pixel(14, -41),
        hr_version =
        {
		  width = 214,
		  height = 212,
		  shift = util.by_pixel(14, -41.5),
          scale = 0.5
        }
      },
    },
    { -- l
      trunk =
      {
        width = 202,
        height = 62,
        shift = util.by_pixel(-8, -8),
        hr_version =
        {
          width = 410,
          height = 122,
          shift = util.by_pixel(-9, -7),
          scale = 0.5
        }
      },
      stump =
      {
        width = 94,
        height = 48,
        shift = util.by_pixel(28, -12),
        hr_version =
        {
          width = 188,
          height = 100,
          shift = util.by_pixel(28, -12),
          scale = 0.5
        }
      },
      shadow =
      {
        width = 208,
        height = 70,
        shift = util.by_pixel(-2, 0),
        hr_version =
        {
          width = 418,
          height = 138,
          shift = util.by_pixel(-2, 1),
          scale = 0.5
        }
      },
      leaves =
      {
        width = 202,
        height = 80,
        shift = util.by_pixel(-12, -8),
        hr_version =
        {
          width = 404,
          height = 156,
          shift = util.by_pixel(-11, -6),
          scale = 0.5
        }
      },
	  normal =
      {
        width = 154,
        height = 80,
        shift = util.by_pixel(-35, -5),
        hr_version =
        {
		  width = 308,
		  height = 156,
		  shift = util.by_pixel(-35, -5.5),
          scale = 0.5
        }
      },
    }
  },
  { -- tree-03
    { -- a
      trunk = {
        width = 135,
        height = 157,
        shift = util.by_pixel(-6, -56),
        hr_version = {
          width = 264,
          height = 312,
          shift = util.by_pixel(-5, -56),
          scale = 0.5
        },
      },
      stump = {
        width = 53,
        height = 41,
        shift = util.by_pixel(0, 2),
        hr_version = {
          width = 100,
          height = 80,
          shift = util.by_pixel(1, 2),
          scale = 0.5
        },
      },
      shadow = {
        width = 153,
        height = 101,
        shift = util.by_pixel(60, -14),
        hr_version = {
          width = 300,
          height = 202,
          shift = util.by_pixel(61, -14),
          scale = 0.5
        },
      },
      leaves = {
        width = 141,
        height = 153,
        shift = util.by_pixel(-8, -74),
        hr_version = {
          width = 282,
          height = 304,
          shift = util.by_pixel(-8, -74),
          scale = 0.5
        },
      },
	  normal = {
        width = 142,
        height = 136,
        shift = util.by_pixel(-8, -82),
        hr_version = {
          width = 284,
          height = 270,
          shift = util.by_pixel(-8, -82),
          scale = 0.5
        },
      },
    },
    { -- b
      trunk = {
        width = 127,
        height = 157,
        shift = util.by_pixel(20, -58),
        hr_version = {
          width = 252,
          height = 314,
          shift = util.by_pixel(20, -58),
          scale = 0.5
        },
      },
      stump = {
        width = 53,
        height = 43,
        shift = util.by_pixel(-4, 0),
        hr_version = {
          width = 106,
          height = 84,
          shift = util.by_pixel(-4, 0),
          scale = 0.5
        },
      },
      shadow = {
        width = 203,
        height = 117,
        shift = util.by_pixel(86, -12),
        hr_version = {
          width = 406,
          height = 230,
          shift = util.by_pixel(86, -11),
          scale = 0.5
        },
      },
      leaves = {
        width = 171,
        height = 137,
        shift = util.by_pixel(22, -80),
        hr_version = {
          width = 342,
          height = 272,
          shift = util.by_pixel(22, -80),
          scale = 0.5
        },
      },
	  normal = {
        width = 174,
        height = 138,
        shift = util.by_pixel(23, -80),
        hr_version = {
          width = 344,
          height = 276,
          shift = util.by_pixel(22.5, -79.5),
          scale = 0.5
        },
      },
    },
    { -- c
      trunk = {
        width = 135,
        height = 125,
        shift = util.by_pixel(-10, -44),
        hr_version = {
          width = 268,
          height = 246,
          shift = util.by_pixel(-9, -43),
          scale = 0.5
        },
      },
      stump = {
        width = 51,
        height = 41,
        shift = util.by_pixel(2, -2),
        hr_version = {
          width = 98,
          height = 78,
          shift = util.by_pixel(3, -1),
          scale = 0.5
        },
      },
      shadow = {
        width = 323,
        height = 97,
        shift = util.by_pixel(-26, 8),
        hr_version = {
          width = 646,
          height = 188,
          shift = util.by_pixel(-26, 9),
          scale = 0.5
        },
      },
      leaves = {
        width = 161,
        height = 117,
        shift = util.by_pixel(-10, -48),
        hr_version = {
          width = 314,
          height = 232,
          shift = util.by_pixel(-8, -48),
          scale = 0.5
        },
      },
	  normal = {
        width = 160,
        height = 118,
        shift = util.by_pixel(-8, -47),
        hr_version = {
          width = 318,
          height = 234,
          shift = util.by_pixel(-8, -47.5),
          scale = 0.5
        },
      },
    },
    { -- d
      trunk = {
        width = 73,
        height = 145,
        shift = util.by_pixel(6, -52),
        hr_version = {
          width = 142,
          height = 286,
          shift = util.by_pixel(7, -51),
          scale = 0.5
        },
      },
      stump = {
        width = 51,
        height = 41,
        shift = util.by_pixel(-6, 0),
        hr_version = {
          width = 96,
          height = 78,
          shift = util.by_pixel(-5, 1),
          scale = 0.5
        },
      },
      shadow = {
        width = 159,
        height = 79,
        shift = util.by_pixel(66, 0),
        hr_version = {
          width = 318,
          height = 156,
          shift = util.by_pixel(66, 0),
          scale = 0.5
        },
      },
      leaves = {
        width = 103,
        height = 129,
        shift = util.by_pixel(8, -68),
        hr_version = {
          width = 202,
          height = 254,
          shift = util.by_pixel(9, -67),
          scale = 0.5
        },
      },
	  normal = {
        width = 102,
        height = 116,
        shift = util.by_pixel(10, -72),
        hr_version = {
          width = 202,
          height = 230,
          shift = util.by_pixel(9.5, -72.5),
          scale = 0.5
        },
      },
    },
    { -- e
      trunk = {
        width = 89,
        height = 127,
        shift = util.by_pixel(6, -48),
        hr_version = {
          width = 174,
          height = 250,
          shift = util.by_pixel(7, -47),
          scale = 0.5
        },
      },
      stump = {
        width = 51,
        height = 39,
        shift = util.by_pixel(-4, -4),
        hr_version = {
          width = 98,
          height = 74,
          shift = util.by_pixel(-3, -3),
          scale = 0.5
        },
      },
      shadow = {
        width = 167,
        height = 69,
        shift = util.by_pixel(70, 0),
        hr_version = {
          width = 330,
          height = 132,
          shift = util.by_pixel(71, 1),
          scale = 0.5
        },
      },
      leaves = {
        width = 117,
        height = 105,
        shift = util.by_pixel(8, -62),
        hr_version = {
          width = 234,
          height = 208,
          shift = util.by_pixel(8, -61),
          scale = 0.5
        },
      },
	  normal = {
        width = 120,
        height = 100,
        shift = util.by_pixel(9, -64),
        hr_version = {
          width = 238,
          height = 198,
          shift = util.by_pixel(8.5, -64),
          scale = 0.5
        },
      },
    },
    { -- f
      trunk = {
        width = 79,
        height = 133,
        shift = util.by_pixel(-12, -50),
        hr_version = {
          width = 158,
          height = 262,
          shift = util.by_pixel(-12, -49),
          scale = 0.5
        },
      },
      stump = {
        width = 47,
        height = 33,
        shift = util.by_pixel(4, 0),
        hr_version = {
          width = 90,
          height = 66,
          shift = util.by_pixel(5, 0),
          scale = 0.5
        },
      },
      shadow = {
        width = 113,
        height = 73,
        shift = util.by_pixel(48, -4),
        hr_version = {
          width = 224,
          height = 142,
          shift = util.by_pixel(48, -3),
          scale = 0.5
        },
      },
      leaves = {
        width = 109,
        height = 119,
        shift = util.by_pixel(-14, -58),
        hr_version = {
          width = 214,
          height = 232,
          shift = util.by_pixel(-13, -57),
          scale = 0.5
        },
      },
	  normal = {
        width = 108,
        height = 102,
        shift = util.by_pixel(-12, -63),
        hr_version = {
          width = 216,
          height = 202,
          shift = util.by_pixel(-12, -63.5),
          scale = 0.5
        },
      },
    },
    { -- g
      trunk = {
        width = 73,
        height = 123,
        shift = util.by_pixel(-10, -42),
        hr_version = {
          width = 140,
          height = 240,
          shift = util.by_pixel(-9, -41),
          scale = 0.5
        },
      },
      stump = {
        width = 45,
        height = 39,
        shift = util.by_pixel(0, 0),
        hr_version = {
          width = 88,
          height = 76,
          shift = util.by_pixel(0, 0),
          scale = 0.5
        },
      },
      shadow = {
        width = 107,
        height = 71,
        shift = util.by_pixel(44, -6),
        hr_version = {
          width = 212,
          height = 136,
          shift = util.by_pixel(44, -5),
          scale = 0.5
        },
      },
      leaves = {
        width = 95,
        height = 117,
        shift = util.by_pixel(0, -58),
        hr_version = {
          width = 188,
          height = 230,
          shift = util.by_pixel(1, -57),
          scale = 0.5
        },
      },
	  normal = {
        width = 94,
        height = 96,
        shift = util.by_pixel(2, -66),
        hr_version = {
          width = 186,
          height = 188,
          shift = util.by_pixel(1.5, -66.5),
          scale = 0.5
        },
      },
    },
    { -- h
      trunk = {
        width = 87,
        height = 115,
        shift = util.by_pixel(2, -38),
        hr_version = {
          width = 174,
          height = 224,
          shift = util.by_pixel(2, -37),
          scale = 0.5
        },
      },
      stump = {
        width = 45,
        height = 41,
        shift = util.by_pixel(-2, -2),
        hr_version = {
          width = 88,
          height = 74,
          shift = util.by_pixel(-2, 0),
          scale = 0.5
        },
      },
      shadow = {
        width = 131,
        height = 69,
        shift = util.by_pixel(54, -2),
        hr_version = {
          width = 258,
          height = 132,
          shift = util.by_pixel(55, -1),
          scale = 0.5
        },
      },
      leaves = {
        width = 93,
        height = 103,
        shift = util.by_pixel(6, -44),
        hr_version = {
          width = 182,
          height = 200,
          shift = util.by_pixel(7, -43),
          scale = 0.5
        },
      },
	  normal = {
        width = 94,
        height = 78,
        shift = util.by_pixel(8, -54),
        hr_version = {
          width = 186,
          height = 154,
          shift = util.by_pixel(7.5, -54),
          scale = 0.5
        },
      },
    },
    { -- i
      trunk = {
        width = 99,
        height = 101,
        shift = util.by_pixel(2, -34),
        hr_version = {
          width = 196,
          height = 202,
          shift = util.by_pixel(2, -34),
          scale = 0.5
        },
      },
      stump = {
        width = 49,
        height = 43,
        shift = util.by_pixel(0, -4),
        hr_version = {
          width = 92,
          height = 80,
          shift = util.by_pixel(1, -3),
          scale = 0.5
        },
      },
      shadow = {
        width = 109,
        height = 61,
        shift = util.by_pixel(48, 4),
        hr_version = {
          width = 218,
          height = 120,
          shift = util.by_pixel(48, 4),
          scale = 0.5
        },
      },
      leaves = {
        width = 99,
        height = 91,
        shift = util.by_pixel(-2, -42),
        hr_version = {
          width = 198,
          height = 178,
          shift = util.by_pixel(-1, -41),
          scale = 0.5
        },
      },
	  normal = {
        width = 96,
        height = 68,
        shift = util.by_pixel(-3, -51),
        hr_version = {
          width = 190,
          height = 136,
          shift = util.by_pixel(-3.5, -50.5),
          scale = 0.5
        },
      },
    },
    { -- j
      trunk = {
        width = 51,
        height = 95,
        shift = util.by_pixel(6, -34),
        hr_version = {
          width = 100,
          height = 188,
          shift = util.by_pixel(6, -34),
          scale = 0.5
        },
      },
      stump = {
        width = 29,
        height = 27,
        shift = util.by_pixel(-2, 0),
        hr_version = {
          width = 58,
          height = 52,
          shift = util.by_pixel(-2, 0),
          scale = 0.5
        },
      },
      shadow = {
        width = 89,
        height = 55,
        shift = util.by_pixel(38, -2),
        hr_version = {
          width = 178,
          height = 110,
          shift = util.by_pixel(39, -2),
          scale = 0.5
        },
      },
      leaves = {
        width = 57,
        height = 85,
        shift = util.by_pixel(6, -44),
        hr_version = {
          width = 112,
          height = 166,
          shift = util.by_pixel(6, -43),
          scale = 0.5
        },
      },
	  normal = {
        width = 58,
        height = 68,
        shift = util.by_pixel(7, -51),
        hr_version = {
          width = 114,
          height = 136,
          shift = util.by_pixel(6.5, -50.5),
          scale = 0.5
        },
      },
    },
    { -- k
      trunk = {
        width = 47,
        height = 69,
        shift = util.by_pixel(8, -24),
        hr_version = {
          width = 92,
          height = 134,
          shift = util.by_pixel(8, -23),
          scale = 0.5
        },
      },
      stump = {
        width = 27,
        height = 25,
        shift = util.by_pixel(-2, -2),
        hr_version = {
          width = 52,
          height = 46,
          shift = util.by_pixel(-2, -1),
          scale = 0.5
        },
      },
      shadow = {
        width = 85,
        height = 35,
        shift = util.by_pixel(38, 2),
        hr_version = {
          width = 170,
          height = 66,
          shift = util.by_pixel(38, 3),
          scale = 0.5
        },
      },
      leaves = {
        width = 69,
        height = 63,
        shift = util.by_pixel(4, -32),
        hr_version = {
          width = 140,
          height = 126,
          shift = util.by_pixel(4, -32),
          scale = 0.5
        },
      },
	  normal = {
        width = 72,
        height = 54,
        shift = util.by_pixel(5, -36),
        hr_version = {
          width = 140,
          height = 104,
          shift = util.by_pixel(4.5, -36.5),
          scale = 0.5
        },
      },
    },
    { -- l
      trunk = {
        width = 59,
        height = 85,
        shift = util.by_pixel(-10, -30),
        hr_version = {
          width = 112,
          height = 166,
          shift = util.by_pixel(-9, -29),
          scale = 0.5
        },
      },
      stump = {
        width = 33,
        height = 25,
        shift = util.by_pixel(2, 0),
        hr_version = {
          width = 62,
          height = 50,
          shift = util.by_pixel(3, 0),
          scale = 0.5
        },
      },
      shadow = {
        width = 73,
        height = 47,
        shift = util.by_pixel(30, -6),
        hr_version = {
          width = 142,
          height = 90,
          shift = util.by_pixel(31, -5),
          scale = 0.5
        },
      },
      leaves = {
        width = 79,
        height = 71,
        shift = util.by_pixel(-14, -42),
        hr_version = {
          width = 154,
          height = 142,
          shift = util.by_pixel(-13, -42),
          scale = 0.5
        },
      },
	  normal = {
        width = 78,
        height = 62,
        shift = util.by_pixel(-12, -46),
        hr_version = {
          width = 154,
          height = 122,
          shift = util.by_pixel(-12.5, -46),
          scale = 0.5
        },
      },
    },
  },
  { -- tree-04
    { -- a
      trunk =
      {
        width = 86,
        height = 160,
        shift = util.by_pixel(-4, -60),
        hr_version =
        {
          width = 174,
          height = 316,
          shift = util.by_pixel(-4, -58),
          scale = 0.5
        }
      },
      stump =
      {
        width = 56,
        height = 50,
        shift = util.by_pixel(2, -4),
        hr_version =
        {
          width = 112,
          height = 94,
          shift = util.by_pixel(3, -2),
          scale = 0.5
        }
      },
      shadow =
      {
        width = 160,
        height = 66,
        shift = util.by_pixel(64, -6),
        hr_version =
        {
          width = 318,
          height = 130,
          shift = util.by_pixel(65, -5),
          scale = 0.5
        }
      },
      leaves =
      {
        width = 108,
        height = 154,
        shift = util.by_pixel(-4, -68),
        hr_version =
        {
          width = 216,
          height = 314,
          shift = util.by_pixel(-3, -67),
          scale = 0.5
        }
      },
	  normal =
      {
        width = 110,
        height = 124,
        shift = util.by_pixel(-2, -82),
        hr_version =
        {
          width = 218,
          height = 248,
          shift = util.by_pixel(-2.5, -82),
          scale = 0.5
        }
      },
    },
    { -- b
      trunk =
      {
        width = 72,
        height = 166,
        shift = util.by_pixel(4, -60),
        hr_version =
        {
          width = 142,
          height = 334,
          shift = util.by_pixel(5, -60),
          scale = 0.5
        }
      },
      stump =
      {
        width = 60,
        height = 46,
        shift = util.by_pixel(-2, 0),
        hr_version =
        {
          width = 118,
          height = 94,
          shift = util.by_pixel(-1, 0),
          scale = 0.5
        }
      },
      shadow =
      {
        width = 154,
        height = 78,
        shift = util.by_pixel(68, -4),
        hr_version =
        {
          width = 308,
          height = 154,
          shift = util.by_pixel(68, -3),
          scale = 0.5
        }
      },
      leaves =
      {
        width = 92,
        height = 146,
        shift = util.by_pixel(4, -74),
        hr_version =
        {
          width = 184,
          height = 302,
          shift = util.by_pixel(4, -72),
          scale = 0.5
        }
      },
	  normal =
      {
        width = 94,
        height = 124,
        shift = util.by_pixel(5, -84),
        hr_version =
        {
          width = 186,
          height = 246,
          shift = util.by_pixel(5, -84.5),
          scale = 0.5
        }
      },
    },
    { -- c
      trunk =
      {
        width = 88,
        height = 162,
        shift = util.by_pixel(4, -60),
        hr_version =
        {
          width = 176,
          height = 328,
          shift = util.by_pixel(4, -60),
          scale = 0.5
        }
      },
      stump =
      {
        width = 56,
        height = 44,
        shift = util.by_pixel(-4, 0),
        hr_version =
        {
          width = 108,
          height = 88,
          shift = util.by_pixel(-3, 0),
          scale = 0.5
        }
      },
      shadow =
      {
        width = 158,
        height = 70,
        shift = util.by_pixel(66, 0),
        hr_version =
        {
          width = 312,
          height = 134,
          shift = util.by_pixel(67, 2),
          scale = 0.5
        }
      },
      leaves =
      {
        width = 104,
        height = 164,
        shift = util.by_pixel(2, -66),
        hr_version =
        {
          width = 208,
          height = 324,
          shift = util.by_pixel(2, -64),
          scale = 0.5
        }
      },
	  normal =
      {
        width = 106,
        height = 134,
        shift = util.by_pixel(3, -77),
        hr_version =
        {
          width = 208,
          height = 268,
          shift = util.by_pixel(2.5, -77),
          scale = 0.5
        }
      },
    },
    { -- d
      trunk =
      {
        width = 108,
        height = 132,
        shift = util.by_pixel(2, -48),
        hr_version =
        {
          width = 216,
          height = 266,
          shift = util.by_pixel(2, -48),
          scale = 0.5
        }
      },
      stump =
      {
        width = 48,
        height = 40,
        shift = util.by_pixel(0, -2),
        hr_version =
        {
          width = 96,
          height = 82,
          shift = util.by_pixel(1, -2),
          scale = 0.5
        }
      },
      shadow =
      {
        width = 158,
        height = 78,
        shift = util.by_pixel(70, 0),
        hr_version =
        {
          width = 320,
          height = 158,
          shift = util.by_pixel(69, 0),
          scale = 0.5
        }
      },
      leaves =
      {
        width = 114,
        height = 148,
        shift = util.by_pixel(-6, -66),
        hr_version =
        {
          width = 230,
          height = 290,
          shift = util.by_pixel(-6, -64),
          scale = 0.5
        }
      },
	  normal =
      {
        width = 116,
        height = 126,
        shift = util.by_pixel(-5, -74),
        hr_version =
        {
          width = 230,
          height = 250,
          shift = util.by_pixel(-5, -74),
          scale = 0.5
        }
      },
    },
    { -- e
      trunk =
      {
        width = 80,
        height = 164,
        shift = util.by_pixel(-10, -64),
        hr_version =
        {
          width = 158,
          height = 324,
          shift = util.by_pixel(-9, -62),
          scale = 0.5
        }
      },
      stump =
      {
        width = 52,
        height = 42,
        shift = util.by_pixel(0, -2),
        hr_version =
        {
          width = 102,
          height = 84,
          shift = util.by_pixel(1, -2),
          scale = 0.5
        }
      },
      shadow =
      {
        width = 138,
        height = 88,
        shift = util.by_pixel(60, -4),
        hr_version =
        {
          width = 274,
          height = 170,
          shift = util.by_pixel(61, -2),
          scale = 0.5
        }
      },
      leaves =
      {
        width = 110,
        height = 138,
        shift = util.by_pixel(-4, -84),
        hr_version =
        {
          width = 222,
          height = 280,
          shift = util.by_pixel(-4, -84),
          scale = 0.5
        }
      },
	  normal =
      {
        width = 112,
        height = 130,
        shift = util.by_pixel(-3, -88),
        hr_version =
        {
          width = 222,
          height = 256,
          shift = util.by_pixel(-3, -88.5),
          scale = 0.5
        }
      },
    },
    { -- f
      trunk =
      {
        width = 96,
        height = 164,
        shift = util.by_pixel(4, -62),
        hr_version =
        {
          width = 194,
          height = 332,
          shift = util.by_pixel(4, -62),
          scale = 0.5
        }
      },
      stump =
      {
        width = 48,
        height = 40,
        shift = util.by_pixel(-2, 0),
        hr_version =
        {
          width = 100,
          height = 84,
          shift = util.by_pixel(-2, 0),
          scale = 0.5
        }
      },
      shadow =
      {
        width = 168,
        height = 78,
        shift = util.by_pixel(70, -4),
        hr_version =
        {
          width = 332,
          height = 156,
          shift = util.by_pixel(72, -4),
          scale = 0.5
        }
      },
      leaves =
      {
        width = 112,
        height = 134,
        shift = util.by_pixel(10, -82),
        hr_version =
        {
          width = 224,
          height = 272,
          shift = util.by_pixel(11, -82),
          scale = 0.5
        }
      },
	  normal =
      {
        width = 112,
        height = 122,
        shift = util.by_pixel(13, -87),
        hr_version =
        {
          width = 222,
          height = 244,
          shift = util.by_pixel(12.5, -87),
          scale = 0.5
        }
      },
    },
    { -- g
      trunk =
      {
        width = 92,
        height = 142,
        shift = util.by_pixel(-14, -54),
        hr_version =
        {
          width = 178,
          height = 282,
          shift = util.by_pixel(-12, -53),
          scale = 0.5
        }
      },
      stump =
      {
        width = 46,
        height = 42,
        shift = util.by_pixel(0, -4),
        hr_version =
        {
          width = 94,
          height = 86,
          shift = util.by_pixel(0, -4),
          scale = 0.5
        }
      },
      shadow =
      {
        width = 148,
        height = 72,
        shift = util.by_pixel(56, -8),
        hr_version =
        {
          width = 296,
          height = 144,
          shift = util.by_pixel(56, -7),
          scale = 0.5
        }
      },
      leaves =
      {
        width = 112,
        height = 130,
        shift = util.by_pixel(-12, -76),
        hr_version =
        {
          width = 222,
          height = 258,
          shift = util.by_pixel(-11, -75),
          scale = 0.5
        }
      },
	  normal =
      {
        width = 112,
        height = 110,
        shift = util.by_pixel(-10, -84),
        hr_version =
        {
          width = 222,
          height = 220,
          shift = util.by_pixel(-10.5, -83.5),
          scale = 0.5
        }
      },
    },
    { -- h
      trunk =
      {
        width = 64,
        height = 144,
        shift = util.by_pixel(-2, -54),
        hr_version =
        {
          width = 128,
          height = 284,
          shift = util.by_pixel(-2, -53),
          scale = 0.5
        }
      },
      stump =
      {
        width = 48,
        height = 46,
        shift = util.by_pixel(2, -6),
        hr_version =
        {
          width = 96,
          height = 92,
          shift = util.by_pixel(2, -5),
          scale = 0.5
        }
      },
      shadow =
      {
        width = 148,
        height = 74,
        shift = util.by_pixel(66, -8),
        hr_version =
        {
          width = 292,
          height = 152,
          shift = util.by_pixel(67, -8),
          scale = 0.5
        }
      },
      leaves =
      {
        width = 100,
        height = 142,
        shift = util.by_pixel(8, -60),
        hr_version =
        {
          width = 202,
          height = 280,
          shift = util.by_pixel(8, -57),
          scale = 0.5
        }
      },
	  normal =
      {
        width = 102,
        height = 102,
        shift = util.by_pixel(8, -76),
        hr_version =
        {
          width = 204,
          height = 202,
          shift = util.by_pixel(8.5, -76),
          scale = 0.5
        }
      },
    },
    { -- i
      trunk =
      {
        width = 48,
        height = 122,
        shift = util.by_pixel(6, -46),
        hr_version =
        {
          width = 92,
          height = 246,
          shift = util.by_pixel(7, -46),
          scale = 0.5
        }
      },
      stump =
      {
        width = 42,
        height = 34,
        shift = util.by_pixel(2, -2),
        hr_version =
        {
          width = 82,
          height = 68,
          shift = util.by_pixel(3, -2),
          scale = 0.5
        }
      },
      shadow =
      {
        width = 124,
        height = 66,
        shift = util.by_pixel(56, 6),
        hr_version =
        {
          width = 244,
          height = 128,
          shift = util.by_pixel(57, 7),
          scale = 0.5
        }
      },
      leaves =
      {
        width = 70,
        height = 122,
        shift = util.by_pixel(6, -52),
        hr_version =
        {
          width = 140,
          height = 240,
          shift = util.by_pixel(6, -50),
          scale = 0.5
        }
      },
	  normal =
      {
        width = 70,
        height = 104,
        shift = util.by_pixel(7, -57),
        hr_version =
        {
          width = 138,
          height = 206,
          shift = util.by_pixel(7, -57),
          scale = 0.5
        }
      },
    },
    { -- j
      trunk =
      {
        width = 48,
        height = 120,
        shift = util.by_pixel(-8, -48),
        hr_version =
        {
          width = 98,
          height = 238,
          shift = util.by_pixel(-8, -47),
          scale = 0.5
        }
      },
      stump =
      {
        width = 40,
        height = 32,
        shift = util.by_pixel(-4, -4),
        hr_version =
        {
          width = 78,
          height = 66,
          shift = util.by_pixel(-3, -4),
          scale = 0.5
        }
      },
      shadow =
      {
        width = 116,
        height = 64,
        shift = util.by_pixel(46, -8),
        hr_version =
        {
          width = 228,
          height = 122,
          shift = util.by_pixel(47, -6),
          scale = 0.5
        }
      },
      leaves =
      {
        width = 70,
        height = 128,
        shift = util.by_pixel(-8, -56),
        hr_version =
        {
          width = 140,
          height = 254,
          shift = util.by_pixel(-8, -55),
          scale = 0.5
        }
      },
	  normal =
      {
        width = 70,
        height = 106,
        shift = util.by_pixel(-7, -65),
        hr_version =
        {
          width = 140,
          height = 210,
          shift = util.by_pixel(-7, -65),
          scale = 0.5
        }
      },
    },
    { -- k
      trunk =
      {
        width = 204,
        height = 80,
        shift = util.by_pixel(-16, -12),
        hr_version =
        {
          width = 406,
          height = 158,
          shift = util.by_pixel(-15, -11),
          scale = 0.5
        }
      },
      stump =
      {
        width = 50,
        height = 56,
        shift = util.by_pixel(18, -4),
        hr_version =
        {
          width = 104,
          height = 108,
          shift = util.by_pixel(18, -2),
          scale = 0.5
        }
      },
      shadow =
      {
        width = 208,
        height = 62,
        shift = util.by_pixel(-8, -8),
        hr_version =
        {
          width = 410,
          height = 124,
          shift = util.by_pixel(-6, -8),
          scale = 0.5
        }
      },
      leaves =
      {
        width = 208,
        height = 80,
        shift = util.by_pixel(-20, -22),
        hr_version =
        {
          width = 414,
          height = 164,
          shift = util.by_pixel(-19, -19),
          scale = 0.5
        }
      },
	  normal =
      {
        width = 134,
        height = 72,
        shift = util.by_pixel(-55, -22),
        hr_version =
        {
          width = 266,
          height = 144,
          shift = util.by_pixel(-55, -22),
          scale = 0.5
        }
      },
    },
    { -- l
      trunk =
      {
        width = 156,
        height = 126,
        shift = util.by_pixel(4, -4),
        hr_version =
        {
          width = 312,
          height = 250,
          shift = util.by_pixel(4, -3),
          scale = 0.5
        }
      },
      stump =
      {
        width = 56,
        height = 48,
        shift = util.by_pixel(-12, -16),
        hr_version =
        {
          width = 108,
          height = 92,
          shift = util.by_pixel(-10, -15),
          scale = 0.5
        }
      },
      shadow =
      {
        width = 180,
        height = 126,
        shift = util.by_pixel(26, 6),
        hr_version =
        {
          width = 366,
          height = 250,
          shift = util.by_pixel(25, 7),
          scale = 0.5
        }
      },
      leaves =
      {
        width = 156,
        height = 118,
        shift = util.by_pixel(10, 2),
        hr_version =
        {
          width = 314,
          height = 240,
          shift = util.by_pixel(10, 1),
          scale = 0.5
        }
      },
	  normal =
      {
        width = 110,
        height = 94,
        shift = util.by_pixel(35, 15),
        hr_version =
        {
          width = 218,
          height = 186,
          shift = util.by_pixel(35, 15),
          scale = 0.5
        }
      },
    }
  },
  { -- tree-05
    { -- a
      trunk = {
        width = 74,
        height = 120,
        shift = util.by_pixel(12, -44),
        hr_version = {
          width = 144,
          height = 242,
          shift = util.by_pixel(13, -45),
          scale = 0.5
        },
      },
      stump = {
        width = 46,
        height = 32,
        shift = util.by_pixel(-2, 0),
        hr_version = {
          width = 88,
          height = 64,
          shift = util.by_pixel(-1, 0),
          scale = 0.5
        },
      },
      shadow = {
        width = 160,
        height = 76,
        shift = util.by_pixel(62, -8),
        hr_version = {
          width = 322,
          height = 150,
          shift = util.by_pixel(62, -8),
          scale = 0.5
        },
      },
      leaves = {
        width = 116,
        height = 130,
        shift = util.by_pixel(6, -60),
        hr_version = {
          width = 234,
          height = 258,
          shift = util.by_pixel(5, -60),
          scale = 0.5
        },
      },
	  normal = {
        width = 118,
        height = 108,
        shift = util.by_pixel(6, -71),
        hr_version = {
          width = 234,
          height = 216,
          shift = util.by_pixel(6, -71),
          scale = 0.5
        },
      },
    },
    { -- b
      trunk = {
        width = 60,
        height = 114,
        shift = util.by_pixel(0, -40),
        hr_version = {
          width = 114,
          height = 226,
          shift = util.by_pixel(1, -40),
          scale = 0.5
        },
      },
      stump = {
        width = 38,
        height = 34,
        shift = util.by_pixel(0, 0),
        hr_version = {
          width = 78,
          height = 68,
          shift = util.by_pixel(-1, 0),
          scale = 0.5
        },
      },
      shadow = {
        width = 146,
        height = 82,
        shift = util.by_pixel(58, 2),
        hr_version = {
          width = 290,
          height = 166,
          shift = util.by_pixel(58, 1),
          scale = 0.5
        },
      },
      leaves = {
        width = 112,
        height = 122,
        shift = util.by_pixel(6, -60),
        hr_version = {
          width = 222,
          height = 242,
          shift = util.by_pixel(6, -60),
          scale = 0.5
        },
      },
	  normal = {
        width = 112,
        height = 106,
        shift = util.by_pixel(6, -68),
        hr_version = {
          width = 222,
          height = 212,
          shift = util.by_pixel(6, -67.5),
          scale = 0.5
        },
      },
    },
    { -- c
      trunk = {
        width = 60,
        height = 138,
        shift = util.by_pixel(-10, -54),
        hr_version = {
          width = 122,
          height = 276,
          shift = util.by_pixel(-10, -54),
          scale = 0.5
        },
      },
      stump = {
        width = 40,
        height = 34,
        shift = util.by_pixel(0, -2),
        hr_version = {
          width = 84,
          height = 64,
          shift = util.by_pixel(-1, -1),
          scale = 0.5
        },
      },
      shadow = {
        width = 136,
        height = 84,
        shift = util.by_pixel(52, 2),
        hr_version = {
          width = 272,
          height = 162,
          shift = util.by_pixel(52, 3),
          scale = 0.5
        },
      },
      leaves = {
        width = 112,
        height = 148,
        shift = util.by_pixel(-2, -66),
        hr_version = {
          width = 224,
          height = 290,
          shift = util.by_pixel(-2, -65),
          scale = 0.5
        },
      },
	  normal = {
        width = 112,
        height = 128,
        shift = util.by_pixel(-2, -74),
        hr_version = {
          width = 224,
          height = 256,
          shift = util.by_pixel(-2, -74),
          scale = 0.5
        },
      },
    },
    { -- d
      trunk = {
        width = 60,
        height = 122,
        shift = util.by_pixel(4, -44),
        hr_version = {
          width = 120,
          height = 244,
          shift = util.by_pixel(4, -44),
          scale = 0.5
        },
      },
      stump = {
        width = 42,
        height = 36,
        shift = util.by_pixel(0, 0),
        hr_version = {
          width = 78,
          height = 70,
          shift = util.by_pixel(1, 0),
          scale = 0.5
        },
      },
      shadow = {
        width = 140,
        height = 84,
        shift = util.by_pixel(54, -2),
        hr_version = {
          width = 278,
          height = 168,
          shift = util.by_pixel(54, -2),
          scale = 0.5
        },
      },
      leaves = {
        width = 100,
        height = 124,
        shift = util.by_pixel(6, -60),
        hr_version = {
          width = 202,
          height = 244,
          shift = util.by_pixel(5, -59),
          scale = 0.5
        },
      },
	  normal = {
        width = 100,
        height = 104,
        shift = util.by_pixel(6, -67),
        hr_version = {
          width = 200,
          height = 208,
          shift = util.by_pixel(6, -67),
          scale = 0.5
        },
      },
    },
    { -- e
      trunk = {
        width = 54,
        height = 118,
        shift = util.by_pixel(0, -44),
        hr_version = {
          width = 106,
          height = 232,
          shift = util.by_pixel(0, -43),
          scale = 0.5
        },
      },
      stump = {
        width = 40,
        height = 34,
        shift = util.by_pixel(0, -2),
        hr_version = {
          width = 80,
          height = 64,
          shift = util.by_pixel(0, -1),
          scale = 0.5
        },
      },
      shadow = {
        width = 136,
        height = 72,
        shift = util.by_pixel(52, 2),
        hr_version = {
          width = 268,
          height = 144,
          shift = util.by_pixel(53, 2),
          scale = 0.5
        },
      },
      leaves = {
        width = 118,
        height = 126,
        shift = util.by_pixel(-2, -58),
        hr_version = {
          width = 236,
          height = 250,
          shift = util.by_pixel(-2, -57),
          scale = 0.5
        },
      },
	  normal = {
        width = 118,
        height = 104,
        shift = util.by_pixel(-2, -66),
        hr_version = {
          width = 236,
          height = 206,
          shift = util.by_pixel(-2, -66.5),
          scale = 0.5
        },
      },
    },
    { -- f
      trunk = {
        width = 58,
        height = 120,
        shift = util.by_pixel(-10, -44),
        hr_version = {
          width = 112,
          height = 236,
          shift = util.by_pixel(-9, -43),
          scale = 0.5
        },
      },
      stump = {
        width = 38,
        height = 36,
        shift = util.by_pixel(0, -2),
        hr_version = {
          width = 80,
          height = 68,
          shift = util.by_pixel(-1, -1),
          scale = 0.5
        },
      },
      shadow = {
        width = 136,
        height = 86,
        shift = util.by_pixel(52, -2),
        hr_version = {
          width = 272,
          height = 168,
          shift = util.by_pixel(52, -1),
          scale = 0.5
        },
      },
      leaves = {
        width = 98,
        height = 126,
        shift = util.by_pixel(-4, -54),
        hr_version = {
          width = 194,
          height = 252,
          shift = util.by_pixel(-4, -54),
          scale = 0.5
        },
      },
	  normal = {
        width = 98,
        height = 106,
        shift = util.by_pixel(-3, -64),
        hr_version = {
          width = 194,
          height = 212,
          shift = util.by_pixel(-3.5, -64),
          scale = 0.5
        },
      },
    },
    { -- g
      trunk = {
        width = 44,
        height = 108,
        shift = util.by_pixel(0, -40),
        hr_version = {
          width = 86,
          height = 214,
          shift = util.by_pixel(0, -40),
          scale = 0.5
        },
      },
      stump = {
        width = 32,
        height = 40,
        shift = util.by_pixel(0, -6),
        hr_version = {
          width = 64,
          height = 74,
          shift = util.by_pixel(0, -5),
          scale = 0.5
        },
      },
      shadow = {
        width = 120,
        height = 84,
        shift = util.by_pixel(42, -6),
        hr_version = {
          width = 238,
          height = 164,
          shift = util.by_pixel(42, -5),
          scale = 0.5
        },
      },
      leaves = {
        width = 90,
        height = 112,
        shift = util.by_pixel(0, -52),
        hr_version = {
          width = 178,
          height = 220,
          shift = util.by_pixel(0, -51),
          scale = 0.5
        },
      },
	  normal = {
        width = 88,
        height = 108,
        shift = util.by_pixel(1, -51),
        hr_version = {
          width = 176,
          height = 216,
          shift = util.by_pixel(1, -51),
          scale = 0.5
        },
      },
    },
    { -- h
      trunk = {
        width = 74,
        height = 108,
        shift = util.by_pixel(6, -40),
        hr_version = {
          width = 144,
          height = 212,
          shift = util.by_pixel(7, -39),
          scale = 0.5
        },
      },
      stump = {
        width = 36,
        height = 36,
        shift = util.by_pixel(0, -4),
        hr_version = {
          width = 72,
          height = 76,
          shift = util.by_pixel(0, -5),
          scale = 0.5
        },
      },
      shadow = {
        width = 134,
        height = 62,
        shift = util.by_pixel(50, 0),
        hr_version = {
          width = 270,
          height = 122,
          shift = util.by_pixel(49, 0),
          scale = 0.5
        },
      },
      leaves = {
        width = 114,
        height = 100,
        shift = util.by_pixel(6, -48),
        hr_version = {
          width = 228,
          height = 196,
          shift = util.by_pixel(6, -47),
          scale = 0.5
        },
      },
	  normal = {
        width = 114,
        height = 88,
        shift = util.by_pixel(6, -51),
        hr_version = {
          width = 228,
          height = 174,
          shift = util.by_pixel(6.5, -51),
          scale = 0.5
        },
      },
    },
    { -- i
      trunk = {
        width = 34,
        height = 92,
        shift = util.by_pixel(-2, -34),
        hr_version = {
          width = 70,
          height = 184,
          shift = util.by_pixel(-3, -34),
          scale = 0.5
        },
      },
      stump = {
        width = 30,
        height = 32,
        shift = util.by_pixel(0, -4),
        hr_version = {
          width = 58,
          height = 60,
          shift = util.by_pixel(0, -3),
          scale = 0.5
        },
      },
      shadow = {
        width = 108,
        height = 62,
        shift = util.by_pixel(40, -4),
        hr_version = {
          width = 214,
          height = 118,
          shift = util.by_pixel(40, -3),
          scale = 0.5
        },
      },
      leaves = {
        width = 84,
        height = 102,
        shift = util.by_pixel(-6, -46),
        hr_version = {
          width = 166,
          height = 200,
          shift = util.by_pixel(-5, -45),
          scale = 0.5
        },
      },
	  normal = {
        width = 84,
        height = 84,
        shift = util.by_pixel(-5, -53),
        hr_version = {
          width = 166,
          height = 166,
          shift = util.by_pixel(-5, -53.5),
          scale = 0.5
        },
      },
    },
    { -- j
      trunk = {
        width = 36,
        height = 84,
        shift = util.by_pixel(2, -30),
        hr_version = {
          width = 66,
          height = 162,
          shift = util.by_pixel(3, -29),
          scale = 0.5
        },
      },
      stump = {
        width = 30,
        height = 32,
        shift = util.by_pixel(0, -4),
        hr_version = {
          width = 56,
          height = 62,
          shift = util.by_pixel(1, -4),
          scale = 0.5
        },
      },
      shadow = {
        width = 98,
        height = 66,
        shift = util.by_pixel(40, 0),
        hr_version = {
          width = 192,
          height = 126,
          shift = util.by_pixel(41, 1),
          scale = 0.5
        },
      },
      leaves = {
        width = 74,
        height = 94,
        shift = util.by_pixel(0, -42),
        hr_version = {
          width = 142,
          height = 184,
          shift = util.by_pixel(1, -41),
          scale = 0.5
        },
      },
	  normal = {
        width = 72,
        height = 82,
        shift = util.by_pixel(1, -45),
        hr_version = {
          width = 144,
          height = 164,
          shift = util.by_pixel(1.5, -45),
          scale = 0.5
        },
      },
    },
    { -- k
      trunk = {
        width = 140,
        height = 90,
        shift = util.by_pixel(-18, 8),
        hr_version = {
          width = 274,
          height = 176,
          shift = util.by_pixel(-17, 9),
          scale = 0.5
        },
      },
      stump = {
        width = 56,
        height = 46,
        shift = util.by_pixel(24, -14),
        hr_version = {
          width = 110,
          height = 88,
          shift = util.by_pixel(24, -13),
          scale = 0.5
        },
      },
      shadow = {
        width = 140,
        height = 80,
        shift = util.by_pixel(-14, 12),
        hr_version = {
          width = 276,
          height = 160,
          shift = util.by_pixel(-13, 12),
          scale = 0.5
        },
      },
      leaves = {
        width = 120,
        height = 84,
        shift = util.by_pixel(-30, 6),
        hr_version = {
          width = 234,
          height = 162,
          shift = util.by_pixel(-29, 7),
          scale = 0.5
        },
      },
	  normal = {
        width = 86,
        height = 76,
        shift = util.by_pixel(-45, 9),
        hr_version = {
          width = 170,
          height = 152,
          shift = util.by_pixel(-45, 9.5),
          scale = 0.5
        },
      },
    },
    { -- l
      trunk = {
        width = 124,
        height = 94,
        shift = util.by_pixel(16, -22),
        hr_version = {
          width = 252,
          height = 186,
          shift = util.by_pixel(15, -22),
          scale = 0.5
        },
      },
      stump = {
        width = 54,
        height = 34,
        shift = util.by_pixel(-22, 8),
        hr_version = {
          width = 104,
          height = 70,
          shift = util.by_pixel(-21, 7),
          scale = 0.5
        },
      },
      shadow = {
        width = 128,
        height = 94,
        shift = util.by_pixel(22, -18),
        hr_version = {
          width = 258,
          height = 186,
          shift = util.by_pixel(21, -18),
          scale = 0.5
        },
      },
      leaves = {
        width = 124,
        height = 82,
        shift = util.by_pixel(16, -30),
        hr_version = {
          width = 252,
          height = 164,
          shift = util.by_pixel(15, -30),
          scale = 0.5
        },
      },
	  normal = {
        width = 80,
        height = 74,
        shift = util.by_pixel(35, -34),
        hr_version = {
          width = 158,
          height = 146,
          shift = util.by_pixel(34.5, -34.5),
          scale = 0.5
        },
      },
    },
  },
  { -- tree-06
    { -- a
      trunk = {
        width = 72,
        height = 134,
        shift = util.by_pixel(6, -40),
        hr_version = {
          width = 140,
          height = 268,
          shift = util.by_pixel(7, -40),
          scale = 0.5
        },
      },
      stump = {
        width = 60,
        height = 62,
        shift = util.by_pixel(0, -4),
        hr_version = {
          width = 118,
          height = 120,
          shift = util.by_pixel(0, -3),
          scale = 0.5
        },
      },
      shadow = {
        width = 170,
        height = 76,
        shift = util.by_pixel(64, 0),
        hr_version = {
          width = 338,
          height = 148,
          shift = util.by_pixel(64, 1),
          scale = 0.5
        },
      },
      leaves = {
        width = 68,
        height = 98,
        shift = util.by_pixel(10, -50),
        hr_version = {
          width = 132,
          height = 196,
          shift = util.by_pixel(11, -50),
          scale = 0.5
        },
      },
    },
    { -- b
      trunk = {
        width = 84,
        height = 124,
        shift = util.by_pixel(8, -26),
        hr_version = {
          width = 168,
          height = 248,
          shift = util.by_pixel(8, -26),
          scale = 0.5
        },
      },
      stump = {
        width = 62,
        height = 68,
        shift = util.by_pixel(0, 2),
        hr_version = {
          width = 124,
          height = 132,
          shift = util.by_pixel(0, 3),
          scale = 0.5
        },
      },
      shadow = {
        width = 174,
        height = 58,
        shift = util.by_pixel(68, 12),
        hr_version = {
          width = 352,
          height = 116,
          shift = util.by_pixel(67, 12),
          scale = 0.5
        },
      },
      leaves = {
        width = 84,
        height = 94,
        shift = util.by_pixel(10, -40),
        hr_version = {
          width = 172,
          height = 186,
          shift = util.by_pixel(9, -40),
          scale = 0.5
        },
      },
    },
    { -- c
      trunk = {
        width = 100,
        height = 106,
        shift = util.by_pixel(0, -16),
        hr_version = {
          width = 198,
          height = 208,
          shift = util.by_pixel(0, -15),
          scale = 0.5
        },
      },
      stump = {
        width = 62,
        height = 58,
        shift = util.by_pixel(-4, 8),
        hr_version = {
          width = 122,
          height = 116,
          shift = util.by_pixel(-3, 8),
          scale = 0.5
        },
      },
      shadow = {
        width = 174,
        height = 50,
        shift = util.by_pixel(66, 16),
        hr_version = {
          width = 352,
          height = 98,
          shift = util.by_pixel(65, 16),
          scale = 0.5
        },
      },
      leaves = {
        width = 92,
        height = 80,
        shift = util.by_pixel(2, -28),
        hr_version = {
          width = 178,
          height = 162,
          shift = util.by_pixel(3, -29),
          scale = 0.5
        },
      },
    },
    { -- d
      trunk = {
        width = 74,
        height = 124,
        shift = util.by_pixel(-16, -22),
        hr_version = {
          width = 148,
          height = 244,
          shift = util.by_pixel(-16, -21),
          scale = 0.5
        },
      },
      stump = {
        width = 60,
        height = 64,
        shift = util.by_pixel(-6, 8),
        hr_version = {
          width = 120,
          height = 128,
          shift = util.by_pixel(-6, 8),
          scale = 0.5
        },
      },
      shadow = {
        width = 152,
        height = 68,
        shift = util.by_pixel(44, 14),
        hr_version = {
          width = 308,
          height = 130,
          shift = util.by_pixel(43, 15),
          scale = 0.5
        },
      },
      leaves = {
        width = 74,
        height = 92,
        shift = util.by_pixel(-14, -40),
        hr_version = {
          width = 150,
          height = 180,
          shift = util.by_pixel(-15, -39),
          scale = 0.5
        },
      },
    },
    { -- e
      trunk = {
        width = 76,
        height = 134,
        shift = util.by_pixel(-14, -32),
        hr_version = {
          width = 154,
          height = 270,
          shift = util.by_pixel(-15, -33),
          scale = 0.5
        },
      },
      stump = {
        width = 64,
        height = 54,
        shift = util.by_pixel(-8, 8),
        hr_version = {
          width = 126,
          height = 106,
          shift = util.by_pixel(-8, 8),
          scale = 0.5
        },
      },
      shadow = {
        width = 124,
        height = 76,
        shift = util.by_pixel(26, 6),
        hr_version = {
          width = 248,
          height = 146,
          shift = util.by_pixel(26, 7),
          scale = 0.5
        },
      },
      leaves = {
        width = 68,
        height = 114,
        shift = util.by_pixel(-18, -48),
        hr_version = {
          width = 136,
          height = 226,
          shift = util.by_pixel(-18, -48),
          scale = 0.5
        },
      },
    },
    { -- f
      trunk = {
        width = 90,
        height = 136,
        shift = util.by_pixel(-16, -38),
        hr_version = {
          width = 184,
          height = 268,
          shift = util.by_pixel(-17, -37),
          scale = 0.5
        },
      },
      stump = {
        width = 62,
        height = 60,
        shift = util.by_pixel(-10, 0),
        hr_version = {
          width = 122,
          height = 120,
          shift = util.by_pixel(-10, 0),
          scale = 0.5
        },
      },
      shadow = {
        width = 162,
        height = 54,
        shift = util.by_pixel(42, -4),
        hr_version = {
          width = 326,
          height = 110,
          shift = util.by_pixel(42, -5),
          scale = 0.5
        },
      },
      leaves = {
        width = 88,
        height = 114,
        shift = util.by_pixel(-18, -48),
        hr_version = {
          width = 180,
          height = 230,
          shift = util.by_pixel(-19, -49),
          scale = 0.5
        },
      },
    },
    { -- g
      trunk = {
        width = 100,
        height = 132,
        shift = util.by_pixel(-10, -36),
        hr_version = {
          width = 194,
          height = 266,
          shift = util.by_pixel(-9, -36),
          scale = 0.5
        },
      },
      stump = {
        width = 64,
        height = 64,
        shift = util.by_pixel(-8, -2),
        hr_version = {
          width = 122,
          height = 126,
          shift = util.by_pixel(-7, -1),
          scale = 0.5
        },
      },
      shadow = {
        width = 180,
        height = 52,
        shift = util.by_pixel(54, -8),
        hr_version = {
          width = 354,
          height = 100,
          shift = util.by_pixel(55, -7),
          scale = 0.5
        },
      },
      leaves = {
        width = 92,
        height = 116,
        shift = util.by_pixel(-10, -48),
        hr_version = {
          width = 178,
          height = 228,
          shift = util.by_pixel(-9, -47),
          scale = 0.5
        },
      },
    },
    { -- h
      trunk = {
        width = 86,
        height = 130,
        shift = util.by_pixel(4, -36),
        hr_version = {
          width = 166,
          height = 258,
          shift = util.by_pixel(5, -36),
          scale = 0.5
        },
      },
      stump = {
        width = 66,
        height = 58,
        shift = util.by_pixel(-6, 0),
        hr_version = {
          width = 128,
          height = 114,
          shift = util.by_pixel(-5, 0),
          scale = 0.5
        },
      },
      shadow = {
        width = 160,
        height = 76,
        shift = util.by_pixel(56, -8),
        hr_version = {
          width = 320,
          height = 146,
          shift = util.by_pixel(56, -7),
          scale = 0.5
        },
      },
      leaves = {
        width = 74,
        height = 96,
        shift = util.by_pixel(12, -46),
        hr_version = {
          width = 144,
          height = 190,
          shift = util.by_pixel(13, -46),
          scale = 0.5
        },
      },
    },
    { -- i
      trunk = {
        width = 74,
        height = 118,
        shift = util.by_pixel(-14, -20),
        hr_version = {
          width = 152,
          height = 238,
          shift = util.by_pixel(-14, -21),
          scale = 0.5
        },
      },
      stump = {
        width = 70,
        height = 66,
        shift = util.by_pixel(-12, 6),
        hr_version = {
          width = 144,
          height = 126,
          shift = util.by_pixel(-12, 7),
          scale = 0.5
        },
      },
      shadow = {
        width = 116,
        height = 76,
        shift = util.by_pixel(18, 12),
        hr_version = {
          width = 228,
          height = 148,
          shift = util.by_pixel(19, 13),
          scale = 0.5
        },
      },
      leaves = {
        width = 64,
        height = 92,
        shift = util.by_pixel(-18, -36),
        hr_version = {
          width = 132,
          height = 186,
          shift = util.by_pixel(-19, -37),
          scale = 0.5
        },
      },
    },
    { -- j
      trunk = {
        width = 72,
        height = 116,
        shift = util.by_pixel(-12, -22),
        hr_version = {
          width = 142,
          height = 232,
          shift = util.by_pixel(-12, -22),
          scale = 0.5
        },
      },
      stump = {
        width = 68,
        height = 60,
        shift = util.by_pixel(-10, 6),
        hr_version = {
          width = 134,
          height = 116,
          shift = util.by_pixel(-10, 7),
          scale = 0.5
        },
      },
      shadow = {
        width = 128,
        height = 76,
        shift = util.by_pixel(26, 8),
        hr_version = {
          width = 256,
          height = 148,
          shift = util.by_pixel(26, 9),
          scale = 0.5
        },
      },
      leaves = {
        width = 66,
        height = 92,
        shift = util.by_pixel(-14, -38),
        hr_version = {
          width = 134,
          height = 182,
          shift = util.by_pixel(-15, -38),
          scale = 0.5
        },
      },
    },
  },
  { -- tree-07
    { -- a
      trunk =
      {
        width = 86,
        height = 160,
        shift = util.by_pixel(-2, -60),
        hr_version =
        {
          width = 174,
          height = 320,
          shift = util.by_pixel(-2, -60),
          scale = 0.5
        }
      },
      stump =
      {
        width = 44,
        height = 46,
        shift = util.by_pixel(0, -4),
        hr_version =
        {
          width = 88,
          height = 88,
          shift = util.by_pixel(0, -2),
          scale = 0.5
        }
      },
      shadow =
      {
        width = 174,
        height = 98,
        shift = util.by_pixel(64, -12),
        hr_version =
        {
          width = 350,
          height = 190,
          shift = util.by_pixel(64, -10),
          scale = 0.5
        }
      },
      leaves =
      {
        width = 122,
        height = 166,
        shift = util.by_pixel(2, -70),
        hr_version =
        {
          width = 244,
          height = 336,
          shift = util.by_pixel(2, -67),
          scale = 0.5
        }
      },
	  normal =
      {
        width = 124,
        height = 146,
        shift = util.by_pixel(3, -78),
        hr_version =
        {
          width = 246,
          height = 290,
          shift = util.by_pixel(2.5, -78.5),
          scale = 0.5
        }
      },
    },
    { -- b
      trunk =
      {
        width = 88,
        height = 152,
        shift = util.by_pixel(10, -58),
        hr_version =
        {
          width = 178,
          height = 306,
          shift = util.by_pixel(10, -58),
          scale = 0.5
        }
      },
      stump =
      {
        width = 50,
        height = 44,
        shift = util.by_pixel(0, -4),
        hr_version =
        {
          width = 100,
          height = 86,
          shift = util.by_pixel(0, -3),
          scale = 0.5
        }
      },
      shadow =
      {
        width = 184,
        height = 90,
        shift = util.by_pixel(70, -4),
        hr_version =
        {
          width = 368,
          height = 178,
          shift = util.by_pixel(71, -3),
          scale = 0.5
        }
      },
      leaves =
      {
        width = 142,
        height = 148,
        shift = util.by_pixel(8, -62),
        hr_version =
        {
          width = 280,
          height = 296,
          shift = util.by_pixel(9, -62),
          scale = 0.5
        }
      },
	  normal =
      {
        width = 142,
        height = 126,
        shift = util.by_pixel(10, -72),
        hr_version =
        {
          width = 282,
          height = 250,
          shift = util.by_pixel(9.5, -72),
          scale = 0.5
        }
      },
    },
    { -- c
      trunk =
      {
        width = 90,
        height = 152,
        shift = util.by_pixel(-10, -58),
        hr_version =
        {
          width = 180,
          height = 300,
          shift = util.by_pixel(-10, -57),
          scale = 0.5
        }
      },
      stump =
      {
        width = 48,
        height = 44,
        shift = util.by_pixel(0, -4),
        hr_version =
        {
          width = 98,
          height = 82,
          shift = util.by_pixel(1, -2),
          scale = 0.5
        }
      },
      shadow =
      {
        width = 144,
        height = 86,
        shift = util.by_pixel(46, -2),
        hr_version =
        {
          width = 284,
          height = 174,
          shift = util.by_pixel(47, -2),
          scale = 0.5
        }
      },
      leaves =
      {
        width = 136,
        height = 162,
        shift = util.by_pixel(-16, -68),
        hr_version =
        {
          width = 270,
          height = 324,
          shift = util.by_pixel(-15, -68),
          scale = 0.5
        }
      },
	  normal =
      {
        width = 136,
        height = 152,
        shift = util.by_pixel(-14, -71),
        hr_version =
        {
          width = 270,
          height = 304,
          shift = util.by_pixel(-14, -71),
          scale = 0.5
        }
      },
    },
    { -- d
      trunk =
      {
        width = 86,
        height = 134,
        shift = util.by_pixel(-2, -50),
        hr_version =
        {
          width = 172,
          height = 268,
          shift = util.by_pixel(-2, -49),
          scale = 0.5
        }
      },
      stump =
      {
        width = 42,
        height = 38,
        shift = util.by_pixel(0, -2),
        hr_version =
        {
          width = 84,
          height = 76,
          shift = util.by_pixel(0, -1),
          scale = 0.5
        }
      },
      shadow =
      {
        width = 148,
        height = 88,
        shift = util.by_pixel(66, 0),
        hr_version =
        {
          width = 290,
          height = 172,
          shift = util.by_pixel(68, 1),
          scale = 0.5
        }
      },
      leaves =
      {
        width = 114,
        height = 142,
        shift = util.by_pixel(0, -68),
        hr_version =
        {
          width = 230,
          height = 290,
          shift = util.by_pixel(0, -66),
          scale = 0.5
        }
      },
	  normal =
      {
        width = 116,
        height = 124,
        shift = util.by_pixel(1, -77),
        hr_version =
        {
          width = 232,
          height = 248,
          shift = util.by_pixel(1, -76.5),
          scale = 0.5
        }
      },
    },
    { -- e
      trunk =
      {
        width = 102,
        height = 144,
        shift = util.by_pixel(0, -54),
        hr_version =
        {
          width = 204,
          height = 286,
          shift = util.by_pixel(0, -53),
          scale = 0.5
        }
      },
      stump =
      {
        width = 44,
        height = 40,
        shift = util.by_pixel(0, -2),
        hr_version =
        {
          width = 88,
          height = 78,
          shift = util.by_pixel(1, -1),
          scale = 0.5
        }
      },
      shadow =
      {
        width = 160,
        height = 84,
        shift = util.by_pixel(68, -2),
        hr_version =
        {
          width = 318,
          height = 166,
          shift = util.by_pixel(69, -1),
          scale = 0.5
        }
      },
      leaves =
      {
        width = 122,
        height = 146,
        shift = util.by_pixel(2, -64),
        hr_version =
        {
          width = 244,
          height = 292,
          shift = util.by_pixel(3, -63),
          scale = 0.5
        }
      },
	  normal =
      {
        width = 122,
        height = 120,
        shift = util.by_pixel(4, -75),
        hr_version =
        {
          width = 242,
          height = 238,
          shift = util.by_pixel(4, -75.5),
          scale = 0.5
        }
      },
    },
    { -- f
      trunk =
      {
        width = 100,
        height = 140,
        shift = util.by_pixel(-4, -54),
        hr_version =
        {
          width = 196,
          height = 280,
          shift = util.by_pixel(-3, -53),
          scale = 0.5
        }
      },
      stump =
      {
        width = 40,
        height = 36,
        shift = util.by_pixel(0, -2),
        hr_version =
        {
          width = 82,
          height = 76,
          shift = util.by_pixel(0, -2),
          scale = 0.5
        }
      },
      shadow =
      {
        width = 136,
        height = 96,
        shift = util.by_pixel(56, -6),
        hr_version =
        {
          width = 270,
          height = 188,
          shift = util.by_pixel(57, -5),
          scale = 0.5
        }
      },
      leaves =
      {
        width = 128,
        height = 140,
        shift = util.by_pixel(-6, -74),
        hr_version =
        {
          width = 256,
          height = 282,
          shift = util.by_pixel(-5, -74),
          scale = 0.5
        }
      },
	  normal =
      {
        width = 128,
        height = 132,
        shift = util.by_pixel(-4, -77),
        hr_version =
        {
          width = 254,
          height = 264,
          shift = util.by_pixel(-4, -77),
          scale = 0.5
        }
      },
    },
    { -- g
      trunk =
      {
        width = 90,
        height = 110,
        shift = util.by_pixel(8, -40),
        hr_version =
        {
          width = 180,
          height = 218,
          shift = util.by_pixel(8, -39),
          scale = 0.5
        }
      },
      stump =
      {
        width = 42,
        height = 34,
        shift = util.by_pixel(0, -2),
        hr_version =
        {
          width = 86,
          height = 72,
          shift = util.by_pixel(0, -2),
          scale = 0.5
        }
      },
      shadow =
      {
        width = 136,
        height = 76,
        shift = util.by_pixel(58, -2),
        hr_version =
        {
          width = 266,
          height = 154,
          shift = util.by_pixel(60, -2),
          scale = 0.5
        }
      },
      leaves =
      {
        width = 110,
        height = 128,
        shift = util.by_pixel(10, -54),
        hr_version =
        {
          width = 222,
          height = 258,
          shift = util.by_pixel(10, -54),
          scale = 0.5
        }
      },
	  normal =
      {
        width = 112,
        height = 112,
        shift = util.by_pixel(11, -61),
        hr_version =
        {
          width = 222,
          height = 222,
          shift = util.by_pixel(10.5, -61),
          scale = 0.5
        }
      },
    },
    { -- h
      trunk =
      {
        width = 86,
        height = 126,
        shift = util.by_pixel(-12, -44),
        hr_version =
        {
          width = 166,
          height = 246,
          shift = util.by_pixel(-10, -42),
          scale = 0.5
        }
      },
      stump =
      {
        width = 40,
        height = 40,
        shift = util.by_pixel(0, -2),
        hr_version =
        {
          width = 84,
          height = 76,
          shift = util.by_pixel(0, 0),
          scale = 0.5
        }
      },
      shadow =
      {
        width = 146,
        height = 74,
        shift = util.by_pixel(46, 0),
        hr_version =
        {
          width = 288,
          height = 146,
          shift = util.by_pixel(47, 1),
          scale = 0.5
        }
      },
      leaves =
      {
        width = 114,
        height = 116,
        shift = util.by_pixel(-10, -56),
        hr_version =
        {
          width = 228,
          height = 242,
          shift = util.by_pixel(-10, -53),
          scale = 0.5
        }
      },
	  normal =
      {
        width = 114,
        height = 110,
        shift = util.by_pixel(-9, -57),
        hr_version =
        {
          width = 226,
          height = 218,
          shift = util.by_pixel(-9, -57.5),
          scale = 0.5
        }
      },
    },
    { -- i
      trunk =
      {
        width = 72,
        height = 102,
        shift = util.by_pixel(0, -36),
        hr_version =
        {
          width = 142,
          height = 204,
          shift = util.by_pixel(1, -35),
          scale = 0.5
        }
      },
      stump =
      {
        width = 40,
        height = 38,
        shift = util.by_pixel(2, -4),
        hr_version =
        {
          width = 80,
          height = 72,
          shift = util.by_pixel(2, -2),
          scale = 0.5
        }
      },
      shadow =
      {
        width = 114,
        height = 72,
        shift = util.by_pixel(46, -2),
        hr_version =
        {
          width = 222,
          height = 140,
          shift = util.by_pixel(48, -1),
          scale = 0.5
        }
      },
      leaves =
      {
        width = 92,
        height = 110,
        shift = util.by_pixel(-2, -56),
        hr_version =
        {
          width = 182,
          height = 218,
          shift = util.by_pixel(-1, -54),
          scale = 0.5
        }
      },
	  normal =
      {
        width = 92,
        height = 104,
        shift = util.by_pixel(-1, -56),
        hr_version =
        {
          width = 184,
          height = 206,
          shift = util.by_pixel(-0.5, -56.5),
          scale = 0.5
        }
      },
    },
    { -- j
      trunk =
      {
        width = 76,
        height = 98,
        shift = util.by_pixel(-2, -34),
        hr_version =
        {
          width = 154,
          height = 198,
          shift = util.by_pixel(-2, -34),
          scale = 0.5
        }
      },
      stump =
      {
        width = 40,
        height = 40,
        shift = util.by_pixel(0, -6),
        hr_version =
        {
          width = 80,
          height = 80,
          shift = util.by_pixel(1, -5),
          scale = 0.5
        }
      },
      shadow =
      {
        width = 130,
        height = 62,
        shift = util.by_pixel(52, 0),
        hr_version =
        {
          width = 258,
          height = 126,
          shift = util.by_pixel(53, 0),
          scale = 0.5
        }
      },
      leaves =
      {
        width = 100,
        height = 98,
        shift = util.by_pixel(2, -44),
        hr_version =
        {
          width = 200,
          height = 200,
          shift = util.by_pixel(2, -44),
          scale = 0.5
        }
      },
	  normal =
      {
        width = 102,
        height = 86,
        shift = util.by_pixel(2, -50),
        hr_version =
        {
          width = 202,
          height = 170,
          shift = util.by_pixel(2, -50.5),
          scale = 0.5
        }
      },
    },
    { -- k
      trunk =
      {
        width = 114,
        height = 136,
        shift = util.by_pixel(2, -22),
        hr_version =
        {
          width = 226,
          height = 274,
          shift = util.by_pixel(3, -22),
          scale = 0.5
        }
      },
      stump =
      {
        width = 62,
        height = 48,
        shift = util.by_pixel(-10, 10),
        hr_version =
        {
          width = 120,
          height = 96,
          shift = util.by_pixel(-9, 11),
          scale = 0.5
        }
      },
      shadow =
      {
        width = 132,
        height = 114,
        shift = util.by_pixel(20, -14),
        hr_version =
        {
          width = 264,
          height = 230,
          shift = util.by_pixel(20, -14),
          scale = 0.5
        }
      },
      leaves =
      {
        width = 100,
        height = 100,
        shift = util.by_pixel(16, -44),
        hr_version =
        {
          width = 204,
          height = 198,
          shift = util.by_pixel(15, -43),
          scale = 0.5
        }
      },
	  normal =
      {
        width = 102,
        height = 92,
        shift = util.by_pixel(16, -47),
        hr_version =
        {
          width = 204,
          height = 184,
          shift = util.by_pixel(16, -46.5),
          scale = 0.5
        }
      },
    },
    { -- l
      trunk =
      {
        width = 160,
        height = 62,
        shift = util.by_pixel(-28, 4),
        hr_version =
        {
          width = 314,
          height = 124,
          shift = util.by_pixel(-26, 4),
          scale = 0.5
        }
      },
      stump =
      {
        width = 54,
        height = 46,
        shift = util.by_pixel(2, -2),
        hr_version =
        {
          width = 104,
          height = 94,
          shift = util.by_pixel(3, -2),
          scale = 0.5
        }
      },
      shadow =
      {
        width = 176,
        height = 80,
        shift = util.by_pixel(-24, 14),
        hr_version =
        {
          width = 354,
          height = 156,
          shift = util.by_pixel(-24, 15),
          scale = 0.5
        }
      },
      leaves =
      {
        width = 164,
        height = 72,
        shift = util.by_pixel(-32, 2),
        hr_version =
        {
          width = 328,
          height = 144,
          shift = util.by_pixel(-31, 3),
          scale = 0.5
        }
      },
	  normal =
      {
        width = 122,
        height = 74,
        shift = util.by_pixel(-51, 4),
        hr_version =
        {
          width = 242,
          height = 146,
          shift = util.by_pixel(-51, 3.5),
          scale = 0.5
        }
      },
    }
  },
  { -- tree-08
    { -- a
      trunk =
      {
        width = 106,
        height = 142,
        shift = util.by_pixel(-6, -58),
        hr_version =
        {
          width = 210,
          height = 286,
          shift = util.by_pixel(-5, -58),
          scale = 0.5
        }
      },
      stump =
      {
        width = 40,
        height = 34,
        shift = util.by_pixel(2, -4),
        hr_version =
        {
          width = 76,
          height = 70,
          shift = util.by_pixel(3, -4),
          scale = 0.5
        }
      },
      shadow =
      {
        width = 156,
        height = 110,
        shift = util.by_pixel(70, 2),
        hr_version =
        {
          width = 310,
          height = 222,
          shift = util.by_pixel(71, 2),
          scale = 0.5
        }
      },
      leaves =
      {
        width = 130,
        height = 142,
        shift = util.by_pixel(-6, -78),
        hr_version =
        {
          width = 262,
          height = 282,
          shift = util.by_pixel(-6, -77),
          scale = 0.5
        }
      },
	  normal =
      {
        width = 130,
        height = 112,
        shift = util.by_pixel(-5, -91),
        hr_version =
        {
          width = 260,
          height = 222,
          shift = util.by_pixel(-5, -91),
          scale = 0.5
        }
      },
    },
    { -- b
      trunk =
      {
        width = 120,
        height = 138,
        shift = util.by_pixel(-4, -56),
        hr_version =
        {
          width = 238,
          height = 276,
          shift = util.by_pixel(-3, -55),
          scale = 0.5
        }
      },
      stump =
      {
        width = 40,
        height = 36,
        shift = util.by_pixel(0, -4),
        hr_version =
        {
          width = 76,
          height = 68,
          shift = util.by_pixel(1, -3),
          scale = 0.5
        }
      },
      shadow =
      {
        width = 162,
        height = 90,
        shift = util.by_pixel(76, -6),
        hr_version =
        {
          width = 322,
          height = 178,
          shift = util.by_pixel(77, -5),
          scale = 0.5
        }
      },
      leaves =
      {
        width = 162,
        height = 154,
        shift = util.by_pixel(-4, -72),
        hr_version =
        {
          width = 322,
          height = 306,
          shift = util.by_pixel(-3, -70),
          scale = 0.5
        }
      },
	  normal =
      {
        width = 162,
        height = 104,
        shift = util.by_pixel(-2, -95),
        hr_version =
        {
          width = 322,
          height = 206,
          shift = util.by_pixel(-2, -95),
          scale = 0.5
        }
      },
    },
    { -- c
      trunk =
      {
        width = 106,
        height = 152,
        shift = util.by_pixel(2, -64),
        hr_version =
        {
          width = 210,
          height = 300,
          shift = util.by_pixel(3, -63),
          scale = 0.5
        }
      },
      stump =
      {
        width = 38,
        height = 36,
        shift = util.by_pixel(0, -6),
        hr_version =
        {
          width = 72,
          height = 66,
          shift = util.by_pixel(1, -4),
          scale = 0.5
        }
      },
      shadow =
      {
        width = 166,
        height = 114,
        shift = util.by_pixel(70, -2),
        hr_version =
        {
          width = 326,
          height = 228,
          shift = util.by_pixel(72, -2),
          scale = 0.5
        }
      },
      leaves =
      {
        width = 126,
        height = 146,
        shift = util.by_pixel(6, -84),
        hr_version =
        {
          width = 252,
          height = 294,
          shift = util.by_pixel(6, -83),
          scale = 0.5
        }
      },
	  normal =
      {
        width = 128,
        height = 130,
        shift = util.by_pixel(7, -90),
        hr_version =
        {
          width = 254,
          height = 260,
          shift = util.by_pixel(6.5, -90),
          scale = 0.5
        }
      },
    },
    { -- d
      trunk =
      {
        width = 84,
        height = 114,
        shift = util.by_pixel(0, -46),
        hr_version =
        {
          width = 166,
          height = 228,
          shift = util.by_pixel(1, -45),
          scale = 0.5
        }
      },
      stump =
      {
        width = 36,
        height = 36,
        shift = util.by_pixel(4, -6),
        hr_version =
        {
          width = 74,
          height = 68,
          shift = util.by_pixel(4, -5),
          scale = 0.5
        }
      },
      shadow =
      {
        width = 138,
        height = 86,
        shift = util.by_pixel(70, 6),
        hr_version =
        {
          width = 274,
          height = 170,
          shift = util.by_pixel(71, 7),
          scale = 0.5
        }
      },
      leaves =
      {
        width = 110,
        height = 110,
        shift = util.by_pixel(-2, -74),
        hr_version =
        {
          width = 214,
          height = 220,
          shift = util.by_pixel(0, -73),
          scale = 0.5
        }
      },
	  normal =
      {
        width = 108,
        height = 92,
        shift = util.by_pixel(0, -82),
        hr_version =
        {
          width = 216,
          height = 182,
          shift = util.by_pixel(0.5, -82),
          scale = 0.5
        }
      },
    },
    { -- e
      trunk =
      {
        width = 86,
        height = 122,
        shift = util.by_pixel(-8, -50),
        hr_version =
        {
          width = 172,
          height = 242,
          shift = util.by_pixel(-7, -49),
          scale = 0.5
        }
      },
      stump =
      {
        width = 40,
        height = 30,
        shift = util.by_pixel(2, -4),
        hr_version =
        {
          width = 76,
          height = 62,
          shift = util.by_pixel(3, -4),
          scale = 0.5
        }
      },
      shadow =
      {
        width = 150,
        height = 76,
        shift = util.by_pixel(64, 4),
        hr_version =
        {
          width = 296,
          height = 150,
          shift = util.by_pixel(65, 5),
          scale = 0.5
        }
      },
      leaves =
      {
        width = 118,
        height = 106,
        shift = util.by_pixel(0, -72),
        hr_version =
        {
          width = 228,
          height = 210,
          shift = util.by_pixel(2, -71),
          scale = 0.5
        }
      },
	  normal =
      {
        width = 116,
        height = 84,
        shift = util.by_pixel(3, -79),
        hr_version =
        {
          width = 228,
          height = 166,
          shift = util.by_pixel(2.5, -79.5),
          scale = 0.5
        }
      },
    },
    { -- f
      trunk =
      {
        width = 84,
        height = 138,
        shift = util.by_pixel(-4, -56),
        hr_version =
        {
          width = 166,
          height = 272,
          shift = util.by_pixel(-3, -55),
          scale = 0.5
        }
      },
      stump =
      {
        width = 36,
        height = 34,
        shift = util.by_pixel(-2, -4),
        hr_version =
        {
          width = 70,
          height = 64,
          shift = util.by_pixel(-1, -3),
          scale = 0.5
        }
      },
      shadow =
      {
        width = 138,
        height = 86,
        shift = util.by_pixel(62, -8),
        hr_version =
        {
          width = 274,
          height = 170,
          shift = util.by_pixel(63, -7),
          scale = 0.5
        }
      },
      leaves =
      {
        width = 108,
        height = 148,
        shift = util.by_pixel(-2, -68),
        hr_version =
        {
          width = 218,
          height = 294,
          shift = util.by_pixel(-2, -67),
          scale = 0.5
        }
      },
	  normal =
      {
        width = 108,
        height = 102,
        shift = util.by_pixel(-1, -90),
        hr_version =
        {
          width = 216,
          height = 200,
          shift = util.by_pixel(-1, -90.5),
          scale = 0.5
        }
      },
    },
    { -- g
      trunk =
      {
        width = 72,
        height = 112,
        shift = util.by_pixel(14, -44),
        hr_version =
        {
          width = 146,
          height = 222,
          shift = util.by_pixel(14, -43),
          scale = 0.5
        }
      },
      stump =
      {
        width = 34,
        height = 28,
        shift = util.by_pixel(2, -2),
        hr_version =
        {
          width = 68,
          height = 56,
          shift = util.by_pixel(3, -2),
          scale = 0.5
        }
      },
      shadow =
      {
        width = 136,
        height = 72,
        shift = util.by_pixel(64, -10),
        hr_version =
        {
          width = 272,
          height = 138,
          shift = util.by_pixel(64, -8),
          scale = 0.5
        }
      },
      leaves =
      {
        width = 94,
        height = 96,
        shift = util.by_pixel(12, -72),
        hr_version =
        {
          width = 190,
          height = 192,
          shift = util.by_pixel(12, -71),
          scale = 0.5
        }
      },
	  normal =
      {
        width = 96,
        height = 82,
        shift = util.by_pixel(12, -77),
        hr_version =
        {
          width = 192,
          height = 164,
          shift = util.by_pixel(12.5, -77),
          scale = 0.5
        }
      },
    },
    { -- h
      trunk =
      {
        width = 80,
        height = 94,
        shift = util.by_pixel(-10, -34),
        hr_version =
        {
          width = 160,
          height = 190,
          shift = util.by_pixel(-10, -34),
          scale = 0.5
        }
      },
      stump =
      {
        width = 32,
        height = 30,
        shift = util.by_pixel(-2, -2),
        hr_version =
        {
          width = 62,
          height = 58,
          shift = util.by_pixel(-1, -1),
          scale = 0.5
        }
      },
      shadow =
      {
        width = 114,
        height = 66,
        shift = util.by_pixel(52, 6),
        hr_version =
        {
          width = 224,
          height = 128,
          shift = util.by_pixel(53, 7),
          scale = 0.5
        }
      },
      leaves =
      {
        width = 110,
        height = 86,
        shift = util.by_pixel(-10, -54),
        hr_version =
        {
          width = 218,
          height = 174,
          shift = util.by_pixel(-9, -54),
          scale = 0.5
        }
      },
	  normal =
      {
        width = 110,
        height = 78,
        shift = util.by_pixel(-8, -58),
        hr_version =
        {
          width = 218,
          height = 152,
          shift = util.by_pixel(-8.5, -58.5),
          scale = 0.5
        }
      },
    },
    { -- i
      trunk =
      {
        width = 38,
        height = 90,
        shift = util.by_pixel(-2, -34),
        hr_version =
        {
          width = 78,
          height = 176,
          shift = util.by_pixel(-2, -33),
          scale = 0.5
        }
      },
      stump =
      {
        width = 34,
        height = 34,
        shift = util.by_pixel(2, -6),
        hr_version =
        {
          width = 68,
          height = 62,
          shift = util.by_pixel(2, -4),
          scale = 0.5
        }
      },
      shadow =
      {
        width = 94,
        height = 52,
        shift = util.by_pixel(44, -6),
        hr_version =
        {
          width = 186,
          height = 102,
          shift = util.by_pixel(45, -5),
          scale = 0.5
        }
      },
      leaves =
      {
        width = 66,
        height = 84,
        shift = util.by_pixel(2, -60),
        hr_version =
        {
          width = 130,
          height = 168,
          shift = util.by_pixel(3, -60),
          scale = 0.5
        }
      },
	  normal =
      {
        width = 64,
        height = 78,
        shift = util.by_pixel(4, -62),
        hr_version =
        {
          width = 128,
          height = 154,
          shift = util.by_pixel(4, -62.5),
          scale = 0.5
        }
      },
    },
    { -- j
      trunk =
      {
        width = 46,
        height = 90,
        shift = util.by_pixel(2, -34),
        hr_version =
        {
          width = 88,
          height = 180,
          shift = util.by_pixel(3, -33),
          scale = 0.5
        }
      },
      stump =
      {
        width = 34,
        height = 32,
        shift = util.by_pixel(2, -4),
        hr_version =
        {
          width = 64,
          height = 64,
          shift = util.by_pixel(3, -4),
          scale = 0.5
        }
      },
      shadow =
      {
        width = 104,
        height = 50,
        shift = util.by_pixel(46, -2),
        hr_version =
        {
          width = 208,
          height = 100,
          shift = util.by_pixel(46, -2),
          scale = 0.5
        }
      },
      leaves =
      {
        width = 82,
        height = 78,
        shift = util.by_pixel(2, -56),
        hr_version =
        {
          width = 162,
          height = 160,
          shift = util.by_pixel(3, -56),
          scale = 0.5
        }
      },
	  normal =
      {
        width = 82,
        height = 74,
        shift = util.by_pixel(4, -59),
        hr_version =
        {
          width = 162,
          height = 148,
          shift = util.by_pixel(4, -58.5),
          scale = 0.5
        }
      },
    },
    { -- k
      trunk =
      {
        width = 150,
        height = 108,
        shift = util.by_pixel(-22, -24),
        hr_version =
        {
          width = 300,
          height = 218,
          shift = util.by_pixel(-22, -24),
          scale = 0.5
        }
      },
      stump =
      {
        width = 54,
        height = 38,
        shift = util.by_pixel(12, 0),
        hr_version =
        {
          width = 110,
          height = 78,
          shift = util.by_pixel(12, 0),
          scale = 0.5
        }
      },
      shadow =
      {
        width = 160,
        height = 90,
        shift = util.by_pixel(-18, -16),
        hr_version =
        {
          width = 320,
          height = 180,
          shift = util.by_pixel(-18, -16),
          scale = 0.5
        }
      },
      leaves =
      {
        width = 150,
        height = 120,
        shift = util.by_pixel(-38, -36),
        hr_version =
        {
          width = 308,
          height = 240,
          shift = util.by_pixel(-34, -35),
          scale = 0.5
        }
      },
	  normal =
      {
        width = 92,
        height = 94,
        shift = util.by_pixel(-66, -47),
        hr_version =
        {
          width = 180,
          height = 188,
          shift = util.by_pixel(-66.5, -46.5),
          scale = 0.5
        }
      },
    },
    { -- l
      trunk =
      {
        width = 138,
        height = 102,
        shift = util.by_pixel(24, 10),
        hr_version =
        {
          width = 274,
          height = 204,
          shift = util.by_pixel(25, 10),
          scale = 0.5
        }
      },
      stump =
      {
        width = 52,
        height = 46,
        shift = util.by_pixel(-2, -2),
        hr_version =
        {
          width = 102,
          height = 92,
          shift = util.by_pixel(-1, -1),
          scale = 0.5
        }
      },
      shadow =
      {
        width = 162,
        height = 108,
        shift = util.by_pixel(42, 24),
        hr_version =
        {
          width = 324,
          height = 216,
          shift = util.by_pixel(42, 24),
          scale = 0.5
        }
      },
      leaves =
      {
        width = 122,
        height = 98,
        shift = util.by_pixel(48, 8),
        hr_version =
        {
          width = 246,
          height = 198,
          shift = util.by_pixel(48, 9),
          scale = 0.5
        }
      },
	  normal =
      {
        width = 100,
        height = 54,
        shift = util.by_pixel(60, 28),
        hr_version =
        {
          width = 200,
          height = 108,
          shift = util.by_pixel(60, 28),
          scale = 0.5
        }
      },
    }
  },
  { -- tree-09
    { -- a
      trunk =
      {
        width = 154,
        height = 194,
        shift = util.by_pixel(0, -68),
        hr_version =
        {
          width = 308,
          height = 392,
          shift = util.by_pixel(0, -68),
          scale = 0.5
        }
      },
      stump =
      {
        width = 90,
        height = 62,
        shift = util.by_pixel(-4, -2),
        hr_version =
        {
          width = 182,
          height = 124,
          shift = util.by_pixel(-4, -1),
          scale = 0.5
        }
      },
      shadow =
      {
        width = 232,
        height = 106,
        shift = util.by_pixel(84, 0),
        hr_version =
        {
          width = 458,
          height = 214,
          shift = util.by_pixel(86, 0),
          scale = 0.5
        }
      },
      leaves =
      {
        width = 174,
        height = 196,
        shift = util.by_pixel(0, -80),
        hr_version =
        {
          width = 350,
          height = 390,
          shift = util.by_pixel(0, -78),
          scale = 0.5
        }
      },
	  normal =
      {
        width = 176,
        height = 148,
        shift = util.by_pixel(1, -102),
        hr_version =
        {
          width = 350,
          height = 294,
          shift = util.by_pixel(1, -102),
          scale = 0.5
        }
      },
    },
    { -- b
      trunk =
      {
        width = 146,
        height = 196,
        shift = util.by_pixel(8, -70),
        hr_version =
        {
          width = 294,
          height = 390,
          shift = util.by_pixel(8, -69),
          scale = 0.5
        }
      },
      stump =
      {
        width = 90,
        height = 64,
        shift = util.by_pixel(4, -4),
        hr_version =
        {
          width = 178,
          height = 124,
          shift = util.by_pixel(5, -2),
          scale = 0.5
        }
      },
      shadow =
      {
        width = 186,
        height = 114,
        shift = util.by_pixel(82, 6),
        hr_version =
        {
          width = 374,
          height = 226,
          shift = util.by_pixel(82, 7),
          scale = 0.5
        }
      },
      leaves =
      {
        width = 168,
        height = 182,
        shift = util.by_pixel(6, -88),
        hr_version =
        {
          width = 334,
          height = 368,
          shift = util.by_pixel(7, -88),
          scale = 0.5
        }
      },
	  normal =
      {
        width = 168,
        height = 154,
        shift = util.by_pixel(8, -102),
        hr_version =
        {
          width = 336,
          height = 306,
          shift = util.by_pixel(8, -102),
          scale = 0.5
        }
      },
    },
    { -- c
      trunk =
      {
        width = 130,
        height = 196,
        shift = util.by_pixel(-4, -66),
        hr_version =
        {
          width = 258,
          height = 392,
          shift = util.by_pixel(-3, -65),
          scale = 0.5
        }
      },
      stump =
      {
        width = 72,
        height = 64,
        shift = util.by_pixel(-4, 0),
        hr_version =
        {
          width = 144,
          height = 128,
          shift = util.by_pixel(-3, 1),
          scale = 0.5
        }
      },
      shadow =
      {
        width = 184,
        height = 110,
        shift = util.by_pixel(72, -4),
        hr_version =
        {
          width = 364,
          height = 222,
          shift = util.by_pixel(73, -4),
          scale = 0.5
        }
      },
      leaves =
      {
        width = 134,
        height = 202,
        shift = util.by_pixel(2, -78),
        hr_version =
        {
          width = 266,
          height = 408,
          shift = util.by_pixel(3, -78),
          scale = 0.5
        }
      },
	  normal =
      {
        width = 134,
        height = 180,
        shift = util.by_pixel(3, -89),
        hr_version =
        {
          width = 268,
          height = 356,
          shift = util.by_pixel(3.5, -89.5),
          scale = 0.5
        }
      },
    },
    { -- d
      trunk =
      {
        width = 132,
        height = 172,
        shift = util.by_pixel(4, -56),
        hr_version =
        {
          width = 264,
          height = 348,
          shift = util.by_pixel(4, -56),
          scale = 0.5
        }
      },
      stump =
      {
        width = 74,
        height = 68,
        shift = util.by_pixel(0, -4),
        hr_version =
        {
          width = 146,
          height = 140,
          shift = util.by_pixel(1, -4),
          scale = 0.5
        }
      },
      shadow =
      {
        width = 172,
        height = 118,
        shift = util.by_pixel(80, -2),
        hr_version =
        {
          width = 344,
          height = 232,
          shift = util.by_pixel(80, -1),
          scale = 0.5
        }
      },
      leaves =
      {
        width = 144,
        height = 152,
        shift = util.by_pixel(-2, -76),
        hr_version =
        {
          width = 284,
          height = 308,
          shift = util.by_pixel(-1, -76),
          scale = 0.5
        }
      },
	  normal =
      {
        width = 142,
        height = 128,
        shift = util.by_pixel(0, -88),
        hr_version =
        {
          width = 282,
          height = 256,
          shift = util.by_pixel(0, -87.5),
          scale = 0.5
        }
      },
    },
    { -- e
      trunk =
      {
        width = 126,
        height = 138,
        shift = util.by_pixel(10, -46),
        hr_version =
        {
          width = 252,
          height = 272,
          shift = util.by_pixel(10, -44),
          scale = 0.5
        }
      },
      stump =
      {
        width = 64,
        height = 50,
        shift = util.by_pixel(-2, -2),
        hr_version =
        {
          width = 126,
          height = 100,
          shift = util.by_pixel(-1, -1),
          scale = 0.5
        }
      },
      shadow =
      {
        width = 154,
        height = 96,
        shift = util.by_pixel(72, 12),
        hr_version =
        {
          width = 306,
          height = 190,
          shift = util.by_pixel(73, 13),
          scale = 0.5
        }
      },
      leaves =
      {
        width = 138,
        height = 130,
        shift = util.by_pixel(12, -56),
        hr_version =
        {
          width = 280,
          height = 264,
          shift = util.by_pixel(12, -56),
          scale = 0.5
        }
      },
	  normal =
      {
        width = 140,
        height = 112,
        shift = util.by_pixel(13, -65),
        hr_version =
        {
          width = 278,
          height = 224,
          shift = util.by_pixel(13, -65),
          scale = 0.5
        }
      },
    },
    { -- f
      trunk =
      {
        width = 124,
        height = 144,
        shift = util.by_pixel(-20, -48),
        hr_version =
        {
          width = 246,
          height = 286,
          shift = util.by_pixel(-19, -47),
          scale = 0.5
        }
      },
      stump =
      {
        width = 68,
        height = 48,
        shift = util.by_pixel(2, 0),
        hr_version =
        {
          width = 132,
          height = 98,
          shift = util.by_pixel(4, 0),
          scale = 0.5
        }
      },
      shadow =
      {
        width = 142,
        height = 96,
        shift = util.by_pixel(54, 6),
        hr_version =
        {
          width = 282,
          height = 184,
          shift = util.by_pixel(55, 8),
          scale = 0.5
        }
      },
      leaves =
      {
        width = 128,
        height = 146,
        shift = util.by_pixel(-10, -60),
        hr_version =
        {
          width = 260,
          height = 288,
          shift = util.by_pixel(-11, -58),
          scale = 0.5
        }
      },
	  normal =
      {
        width = 130,
        height = 128,
        shift = util.by_pixel(-9, -66),
        hr_version =
        {
          width = 258,
          height = 254,
          shift = util.by_pixel(-9.5, -66.5),
          scale = 0.5
        }
      },
    },
    { -- g
      trunk =
      {
        width = 122,
        height = 156,
        shift = util.by_pixel(-12, -52),
        hr_version =
        {
          width = 240,
          height = 312,
          shift = util.by_pixel(-11, -52),
          scale = 0.5
        }
      },
      stump =
      {
        width = 60,
        height = 50,
        shift = util.by_pixel(0, 0),
        hr_version =
        {
          width = 126,
          height = 104,
          shift = util.by_pixel(0, 0),
          scale = 0.5
        }
      },
      shadow =
      {
        width = 156,
        height = 90,
        shift = util.by_pixel(54, -14),
        hr_version =
        {
          width = 310,
          height = 182,
          shift = util.by_pixel(55, -14),
          scale = 0.5
        }
      },
      leaves =
      {
        width = 134,
        height = 148,
        shift = util.by_pixel(-14, -68),
        hr_version =
        {
          width = 266,
          height = 296,
          shift = util.by_pixel(-13, -67),
          scale = 0.5
        }
      },
	  normal =
      {
        width = 134,
        height = 110,
        shift = util.by_pixel(-12, -85),
        hr_version =
        {
          width = 266,
          height = 218,
          shift = util.by_pixel(-12.5, -85.5),
          scale = 0.5
        }
      },
    },
    { -- h
      trunk =
      {
        width = 128,
        height = 156,
        shift = util.by_pixel(18, -52),
        hr_version =
        {
          width = 256,
          height = 312,
          shift = util.by_pixel(18, -52),
          scale = 0.5
        }
      },
      stump =
      {
        width = 60,
        height = 50,
        shift = util.by_pixel(0, 0),
        hr_version =
        {
          width = 122,
          height = 102,
          shift = util.by_pixel(0, 1),
          scale = 0.5
        }
      },
      shadow =
      {
        width = 150,
        height = 96,
        shift = util.by_pixel(74, -10),
        hr_version =
        {
          width = 296,
          height = 192,
          shift = util.by_pixel(75, -10),
          scale = 0.5
        }
      },
      leaves =
      {
        width = 122,
        height = 148,
        shift = util.by_pixel(18, -66),
        hr_version =
        {
          width = 250,
          height = 292,
          shift = util.by_pixel(18, -64),
          scale = 0.5
        }
      },
	  normal =
      {
        width = 120,
        height = 110,
        shift = util.by_pixel(17, -83),
        hr_version =
        {
          width = 238,
          height = 216,
          shift = util.by_pixel(17, -83.5),
          scale = 0.5
        }
      },
    }
  }
}

function tree_01_reflection(variation)
  return
  {
    pictures =
    {
      filename = "__base__/graphics/entity/tree/01/tree-01-reflection.png",
      priority = "extra-high",
      width = 28,
      height = 40,
      shift = util.by_pixel(0, 70),
      y = 40 * variation,
      variation_count = 4,
      scale = 5,
    },
    rotate = false,
    orientation_to_variation = false
  }
end

function tree_02_reflection(variation)
  return
  {
    pictures =
    {
      filename = "__base__/graphics/entity/tree/02/tree-02-reflection.png",
      priority = "extra-high",
      width = 28,
      height = 40,
      shift = util.by_pixel(5, 75),
      y = 40 * variation,
      variation_count = 4,
      scale = 5,
    },
    rotate = false,
    orientation_to_variation = false
  }
end

function tree_03_reflection(variation)
  return
  {
    pictures =
    {
      filename = "__base__/graphics/entity/tree/03/tree-03-reflection.png",
      priority = "extra-high",
      width = 44,
      height = 40,
      shift = util.by_pixel(10, 65),
      y = 40 * variation,
      variation_count = 4,
      scale = 5,
    },
    rotate = false,
    orientation_to_variation = false
  }
end

function tree_04_reflection(variation)
  return
  {
    pictures =
    {
      filename = "__base__/graphics/entity/tree/04/tree-04-reflection.png",
      priority = "extra-high",
      width = 32,
      height = 40,
      shift = util.by_pixel(5, 65),
      y = 40 * variation,
      variation_count = 4,
      scale = 5,
    },
    rotate = false,
    orientation_to_variation = false
  }
end

function tree_05_reflection(variation)
  return
  {
    pictures =
    {
      filename = "__base__/graphics/entity/tree/05/tree-05-reflection.png",
      priority = "extra-high",
      width = 32,
      height = 36,
      shift = util.by_pixel(5, 60),
      y = 36 * variation,
      variation_count = 4,
      scale = 5,
    },
    rotate = false,
    orientation_to_variation = false
  }
end

function tree_06_reflection(variation)
  return
  {
    pictures =
    {
      filename = "__base__/graphics/entity/tree/06/tree-06-reflection.png",
      priority = "extra-high",
      width = 28,
      height = 32,
      shift = util.by_pixel(-5, 35),
      x = 28 * variation,
      variation_count = 1,
      scale = 5,
    },
    rotate = false,
    orientation_to_variation = false
  }
end

function tree_07_reflection(variation)
  return
  {
    pictures =
    {
      filename = "__base__/graphics/entity/tree/07/tree-07-reflection.png",
      priority = "extra-high",
      width = 40,
      height = 40,
      shift = util.by_pixel(0, 65),
      y = 40 * variation,
      variation_count = 4,
      scale = 5,
    },
    rotate = false,
    orientation_to_variation = false
  }
end

function tree_08_reflection(variation)
  return
  {
    pictures =
    {
      filename = "__base__/graphics/entity/tree/08/tree-08-reflection.png",
      priority = "extra-high",
      width = 36,
      height = 40,
      shift = util.by_pixel(0, 75),
      y = 40 * variation,
      variation_count = 4,
      scale = 5,
    },
    rotate = false,
    orientation_to_variation = false
  }
end

function tree_09_reflection(variation)
  return
  {
    pictures =
    {
      filename = "__base__/graphics/entity/tree/09/tree-09-reflection.png",
      priority = "extra-high",
      width = 44,
      height = 48,
      shift = util.by_pixel(5, 75),
      y = 48 * variation,
      variation_count = 4,
      scale = 5,
    },
    rotate = false,
    orientation_to_variation = false
  }
end

local tree_data = {}

local function define_trees(data)
  for _, v in ipairs(data) do
    tree_data[#tree_data + 1] = v
  end
end

define_trees{
  {
    -- olive green trees.  seem to like desert edges
    type = 1,
    variation_weights = { 1, 1, 1, 1, 1, 1, 1, 1, 0.3, 0.3, 0.05, 0.05},
    enabled = true,
    drawing_box = {{-0.9, -3.9}, {0.9, 0.6}},
    autoplace = tree_autoplace(30, 5, 0.75, 0.25),
    colors =
    {
      -- olive green, yellowish
      {r = 156, g = 255, b = 224},
      {r = 118, g = 243, b = 152},
      {r = 116, g = 215, b = 227},
      {r = 221, g = 209, b =  80},
      {r = 131, g = 242, b =  90},
      {r =  83, g = 185, b = 138},
      {r =  71, g = 224, b =  74},
      {r = 230, g = 242, b =  41}
    },
    get_water_reflection = tree_01_reflection
  },
  {
    -- lightish green trees
    -- changed these around so they no longer appear in the middle of deserts
    type = 2,
    variation_weights = { 1, 1, 1, 1, 1, 1, 1, 1, 0.3, 0.3, 0.05, 0.05},
    enabled = true,
    drawing_box = {{-0.9, -4}, {0.9, 0.6}},
    autoplace = tree_autoplace(17, 7, 0.65, 0.1, -0.25),
    colors =
    {
      {r = 191, g = 255, b = 111},
      {r = 209, g = 200, b = 152},
      {r = 252, g = 255, b = 133},
      {r = 230, g = 178, b =  94},
      {r = 190, g = 215, b = 132},
      {r = 204, g = 175, b = 110},
      {r = 240, g = 255, b = 120},
      {r = 194, g = 208, b =  87},
      {r = 222, g = 255, b = 169},
      {r = 150, g = 201, b = 111}
    },
    get_water_reflection = tree_02_reflection
  },

  {
    type = 3,
    enabled = true,
    drawing_box = {{-0.9, -3.7}, {0.9, 0.6}},
    -- autoplace = tree_autoplace(25, 5, 0.8, 0.2, 0.1, 1.1),
    autoplace = tree_autoplace2
    {
      temperature_optimal = 25,
      temperature_range = 7,
      water_optimal = 0.8,
      water_range = 0.2,
      static_influence = 0.1,
      tree_noise_influence = 1.1,
      richness_base = 0,
      richness_multiplier = 2,
    },
    colors =
    {
      --green
      {r = 230, g = 253, b =  66},
      {r = 255, g = 223, b =  87},
      {r = 170, g = 187, b =  65},
      {r = 216, g =  70, b =  70},
      {r = 179, g = 238, b =  95},
      {r = 255, g = 234, b =  82},
      {r = 238, g = 171, b =  71},
      {r = 219, g = 173, b =  91},
      {r = 231, g = 214, b = 129},
    },
    get_water_reflection = tree_03_reflection
  },
  {
    -- dark bluish green trees
    -- these like muddy and grassy areas
    -- might want to reduce tree noise influence a little bit still
    type = 4,
    variation_weights = { 1, 1, 1, 1, 1, 1, 1, 1, 0.3, 0.3, 0.05, 0.05},
    enabled = true,
    drawing_box = {{-0.9, -3.9}, {0.9, 0.6}},
    autoplace = tree_autoplace(12, 7, 0.6, 0.2, -0.5),
    colors =
    {
      {r = 213, g = 255, b = 156},
      {r = 196, g = 255, b = 116},
      {r = 212, g = 255, b = 150},
      {r = 213, g = 255, b = 159},
      {r = 146, g = 211, b = 235},
      {r =  93, g = 222, b = 227},
      {r = 186, g = 255, b = 167},
      {r = 146, g = 226, b = 123},
      {r =  56, g = 188, b = 125},
      {r = 172, g = 227, b = 177},
      {r = 183, g = 255, b = 200},
      {r = 169, g = 141, b = 207},
    },
    get_water_reflection = tree_04_reflection
  },
  {
    -- bright green tree
    -- likes moisture
    -- might want to reduce static influence more when adding other trees back in
    type = 5,
    variation_weights = { 1, 1, 1, 1, 1, 1, 1, 1, 0.3, 0.3, 0.05, 0.05},
    enabled = true,
    drawing_box = {{-0.9, -3.5}, {0.9, 0.6}},
    autoplace = tree_autoplace(12, 7, 0.8, 0.2, -5/8),
    colors =
    {
      {r = 186, g = 227, b =  93},
      {r = 211, g = 241, b = 139},
      {r = 195, g = 228, b = 114},
      {r = 200, g = 242, b =  94},
      {r = 161, g = 222, b =  75},
      {r = 182, g = 216, b =  67},
      {r = 188, g = 209, b = 112},
      {r = 190, g = 231, b =  54},
      {r = 178, g = 179, b =  79},
      {r = 173, g = 173, b =  82},
      {r = 172, g = 173, b =  81},
      {r = 167, g = 168, b =  96},
      {r = 253, g = 255, b = 115},
    },
    get_water_reflection = tree_05_reflection
  },
  {
    type = 9,
    enabled = true,
    drawing_box = {{-0.9, -4}, {0.9, 0.6}},
    autoplace = merge{
      tree_autoplace(30, 5, 0.45, 0.05, 0.21),
      { max_probability = 0.5 * 0.5 }
    },
    colors =
    {
      {r = 231, g = 120, b =   0},
      {r = 255, g = 127, b = 100},
      {r = 221, g =  76, b =  76},
      {r = 255, g = 180, b =  71},
      {r = 255, g = 120, b =  89},
      {r = 255, g =  96, b =  60},
      {r = 255, g =  93, b =  93},
    },
    get_water_reflection = tree_09_reflection
  }
}

-- desert edge trees?
define_trees{
  -- multicolored pastel trees
  -- small clumps in the desert
  {
    type = 2,
    variation_weights = { 1, 1, 1, 1, 1, 1, 1, 1, 0.3, 0.3, 0.05, 0.05},
    enabled = true,
    identifier = "red",
    drawing_box = {{-0.9, -3.9}, {0.9, 0.6}},
    autoplace = merge{
      tree_autoplace(17, 7, 0.45, 0.05, -0.25),
      sharpness = 0.2
    },
    colors =
    {
      {r = 227, g = 143, b =  88},
      {r = 226, g = 196, b =  94},
      {r = 255, g = 176, b = 130},
      {r = 221, g = 189, b = 103},
      {r = 255, g = 183, b = 183},
      {r = 255, g = 149, b =  65},
      {r = 236, g = 159, b =  72},
      {r = 255, g = 127, b =  62},
      {r = 209, g = 113, b =  81},
      {r = 207, g = 118, b =  60},
      {r = 255, g = 152, b =  98},
      {r = 255, g = 135, b = 135},
      {r = 202, g = 107, b =  80},
      {r = 212, g = 128, b =  90},
      {r = 255, g = 101, b = 101},
      {r = 255, g = 117, b = 117},
    },
    get_water_reflection = tree_02_reflection
  },

  {
    type = 7,
    variation_weights = { 1, 1, 1, 1, 1, 1, 1, 1, 0.3, 0.3, 0.05, 0.05},
    enabled = true,
    drawing_box = {{-0.9, -3.5}, {0.9, 0.6}},
    autoplace = merge{
      tree_autoplace(25, 10, 0.20, 0.05, -3/8, 1/2),
      {
        sharpness = 0.2,
        max_probability = 0.2
      }
    },
    colors =
    {
      -- yellow/brownish-almost-green
      {r = 203, g = 140, b = 51},
      {r = 208, g = 155, b = 79},
      {r = 189, g = 175, b = 53},
      {r = 217, g = 206, b = 109},
      {r = 246, g = 231, b = 108},
      {r = 215, g = 206, b = 126},
      {r = 202, g = 171, b = 95},
      {r = 227, g = 182, b = 76},
      {r = 206, g = 157, b = 40},
      {r = 230, g = 173, b = 37},
      {r = 247, g = 223, b = 88},
      {r = 205, g = 186, b = 81}
    },
    get_water_reflection = tree_07_reflection
  }
}

define_trees{
  -- brown desert trees
  -- let's try to avoid placing these in large clumps
  {
    type = 6,
    enabled = true,
    drawing_box = {{-0.9, -3.5}, {0.9, 0.6}},
    autoplace = merge{
      tree_autoplace(22, 13, 0.10, 0.05, -3/8, 1/2),
      {
        sharpness = 0.2,
        max_probability = 0.2
      }
    },
    colors =
    {
      {r = 216, g = 238, b = 142},
      {r = 206, g = 230, b = 126},
      {r = 203, g = 222, b = 140},
      {r = 211, g = 219, b = 111},
      {r = 238, g = 236, b = 113},
      {r = 245, g = 240, b = 117},
      {r = 208, g = 238, b = 118}
    },
    get_water_reflection = tree_06_reflection
  },
  {
    -- more brown desert trees
    type = 6,
    enabled = true,
    identifier = "brown",
    drawing_box = {{-0.9, -3.5}, {0.9, 0.6}},
    autoplace = merge{
      tree_autoplace(22, 13, 0.10, 0.05, -3/8, 1/2),
      {
        sharpness = 0.2,
        max_probability = 0.2
      }
    },
    colors =
    {
      -- brownish-orange-light
      {r = 215, g = 170, b = 107},
      {r = 241, g = 176, b = 85},
      {r = 227, g = 138, b = 60},
      {r = 251, g = 158, b = 76},
      {r = 207, g = 145, b = 58},
      {r = 249, g = 177, b = 92},
      {r = 253, g = 155, b = 0}
    },
    get_water_reflection = tree_06_reflection
  }
}

define_trees{
  {
    type = 9,
    enabled = true,
    identifier = "brown",
    drawing_box = {{-0.9, -4}, {0.9, 0.6}},
    autoplace = merge{
      tree_autoplace(25, 10, 0.20, 0.05, -1/2, 1+1/4),
      { max_probability = 0.35 * 0.5 }
    },
    colors =
    {
      {r = 255, g = 186, b =   0},
      {r = 255, g =  96, b =  45},
      {r = 255, g = 204, b =  64},
      {r = 255, g = 212, b =  98},
      {r = 255, g = 193, b =  72},
      {r = 255, g = 103, b =  66},
      {r = 255, g = 151, b =   0},
    },
    get_water_reflection = tree_09_reflection
  },
  {
    type = 9,
    enabled = true,
    identifier = "red",
    drawing_box = {{-0.9, -3.5}, {0.9, 0.6}},
    autoplace = merge{
      tree_autoplace(15, 10, 0.20, 0.05, -1/2, 1+1/4),
      { max_probability = 0.17 }
    },
    colors =
    {
      {r = 231, g = 120, b =   0},
      {r = 255, g = 127, b = 100},
      {r = 221, g =  76, b =  76},
      {r = 255, g = 180, b =  71},
      {r = 255, g = 120, b =  89},
      {r = 255, g =  96, b =  60},
      {r = 255, g =  93, b =  93},
    },
    get_water_reflection = tree_09_reflection
  },

  -- Desert trees
  {
    type = 8,
    variation_weights = { 1, 1, 1, 1, 1, 1, 1, 1, 0.3, 0.3, 0.05, 0.05},
    enabled = true,
    drawing_box = {{-0.9, -3.5}, {0.9, 0.6}},
    autoplace = merge{
      tree_autoplace(20, 5, 0.10, 0.10, -1),
      {
        sharpness = 0.4,
        max_probability = 0.35
      }
    },
    colors =
    {
      {r = 231, g = 255, b =  83},
      {r = 209, g = 255, b =  58},
      {r = 165, g = 159, b =   4},
      {r = 194, g = 231, b =  73},
      {r = 245, g = 242, b =  44},
      {r = 248, g = 242, b = 102},
      {r = 208, g = 238, b = 118},
    },
    get_water_reflection = tree_08_reflection
  },
  {
    type = 8,
    variation_weights = { 1, 1, 1, 1, 1, 1, 1, 1, 0.3, 0.3, 0.05, 0.05},
    enabled = true,
    identifier = "brown",
    drawing_box = {{-0.9, -4}, {0.9, 0.6}},
    autoplace = merge{
      tree_autoplace(20, 5, 0.10, 0.10, -0.999), --this makes much more brown trees
      {
        sharpness = 0.4,
        max_probability = 0.35
      }
    },
    colors =
    {
      {r = 255, g = 162, b =  62},
      {r = 255, g = 232, b = 145},
      {r = 255, g = 226, b =  74},
      {r = 255, g = 142, b =  68},
    },
    get_water_reflection = tree_08_reflection
  },
  -- Even more desert tree
  {
    type = 8,
    variation_weights = { 1, 1, 1, 1, 1, 1, 1, 1, 0.3, 0.3, 0.05, 0.05},
    enabled = true,
    identifier = "red",
    drawing_box = {{-0.9, -3}, {0.9, 0.6}},
    autoplace = tree_autoplace(-5, 5, 0.05, 0.05, -5),
    colors =
    {
      {r = 224, g = 109, b =  82},
      {r = 228, g = 107, b = 107},
      {r = 226, g = 136, b = 107},
      {r = 222, g = 125, b = 114}
    },
    get_water_reflection = tree_08_reflection
  }
}

local function index_to_letter(index, starting_at)
  return string.char(string.byte(starting_at or "a", 1) - 1 + index)
end

---- Generate trees from tree_data

local tree_flags = {"placeable-neutral", "placeable-off-grid", "breaths-air"}
local tree_corpse_flags = {"placeable-neutral", "placeable-off-grid", "not-on-map"}

for i, tree_data in ipairs(tree_data) do if tree_data.enabled then
  local type_number = string.format("%02d", tree_data.type)
  local type_name = "tree-" .. type_number
  local name = type_name
  local localised_name = {"entity-name.tree"}
  if tree_data.identifier then
    name = name .. "-" .. tree_data.identifier
    localised_name = {"entity-name.tree-"..tree_data.identifier}
  end
  local order = index_to_letter(i) .. "[" .. name .. "]"

  local tree_variations = {}
  for variation_index, variation in ipairs(tree_types[tree_data.type]) do
    local variation_letter = index_to_letter(variation_index)
    local variation_path = type_number .. "/" .. type_name .. "-" .. variation_letter
    local hr_variation_path = type_number .. "/hr-" .. type_name .. "-" .. variation_letter

    local newTree =
    {
      trunk =
      {
        filename = "__base__/graphics/entity/tree/" .. variation_path .. "-trunk.png",
        flags = { "mipmap" },
        width = variation.trunk.width,
        height =  variation.trunk.height,
        frame_count = variation.shadow and 1 or 4,
        shift = variation.trunk.shift,
        hr_version = util.table.deepcopy(variation.trunk.hr_version)
      },
      leaves =
      {
        filename = "__base__/graphics/entity/tree/" .. variation_path .. "-leaves.png",
        flags = { "mipmap" },
        width = variation.leaves.width,
        height = variation.leaves.height,
        frame_count = 3,
        shift = variation.leaves.shift,
        hr_version = util.table.deepcopy(variation.leaves.hr_version)
      },
      leaf_generation =
      {
        type = "create-particle",
        particle_name = "leaf-particle",
        offset_deviation = {{-0.5, -0.5}, {0.5, 0.5}},
        initial_height = 2,
        initial_height_deviation = 1,
        initial_vertical_speed = 0.01,
        initial_height_deviation = 0.05,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0.01
      },
      branch_generation =
      {
        type = "create-particle",
        particle_name = "branch-particle",
        offset_deviation = {{-0.5, -0.5}, {0.5, 0.5}},
        initial_height = 2,
        initial_height_deviation = 2,
        initial_vertical_speed = 0.01,
        -- initial_vertical_speed_deviation = 0.05,
        speed_from_center = 0.03,
        speed_from_center_deviation = 0.01,
        frame_speed = 0.4,
        repeat_count = 15
      }
    }
    if variation.normal then
      newTree.normal =
      {
        filename = "__base__/graphics/entity/tree/" .. variation_path .. "-normal.png",
        width = variation.normal.width,
        height = variation.normal.height,
        frame_count = 3,
        shift = variation.normal.shift,
        hr_version = util.table.deepcopy(variation.normal.hr_version)
      }
      newTree.normal.hr_version.filename = "__base__/graphics/entity/tree/" .. hr_variation_path .. "-normal.png"
      newTree.normal.hr_version.frame_count = newTree.normal.frame_count
    end
    if newTree.trunk.hr_version then
      newTree.trunk.hr_version.filename = "__base__/graphics/entity/tree/" .. hr_variation_path .. "-trunk.png"
      newTree.trunk.hr_version.frame_count = newTree.trunk.frame_count
      newTree.trunk.hr_version.flags = { "mipmap" }
    end
    if newTree.leaves.hr_version then
      newTree.leaves.hr_version.filename = "__base__/graphics/entity/tree/" .. hr_variation_path .. "-leaves.png"
      newTree.leaves.hr_version.frame_count = newTree.leaves.frame_count
      newTree.leaves.hr_version.flags = { "mipmap" }
    end

    if variation.shadow then
      newTree.shadow =
      {
        filename = "__base__/graphics/entity/tree/" .. variation_path .. "-shadow.png",
        flags = { "mipmap", "shadow" },
        width = variation.shadow.width,
        height = variation.shadow.height,
        frame_count = 4,
        shift = variation.shadow.shift,
        draw_as_shadow = true,
		disable_shadow_distortion_beginning_at_frame = 2,
        hr_version = util.table.deepcopy(variation.shadow.hr_version)
      }
      if newTree.shadow.hr_version then
        newTree.shadow.hr_version.filename = "__base__/graphics/entity/tree/" .. hr_variation_path .. "-shadow.png"
        newTree.shadow.hr_version.frame_count = newTree.shadow.frame_count
        newTree.shadow.hr_version.draw_as_shadow = true
        newTree.shadow.hr_version.flags = { "mipmap", "shadow" }
		newTree.shadow.hr_version.disable_shadow_distortion_beginning_at_frame = 2
      end
    end

    if tree_data.get_water_reflection then
      newTree.water_reflection = tree_data.get_water_reflection(variation_index - 1)
    end

    tree_variations[#tree_variations + 1] = newTree
  end

  data:extend(
  {
    {
      type = "tree",
      name = name,
      localised_name = localised_name,
      icon = "__base__/graphics/icons/" .. name .. ".png",
      icon_size = 64, icon_mipmaps = 4,
      flags = tree_flags,
      minable =
      {
        mining_particle = "wooden-particle",
        mining_time = 0.55,
        result = "wood",
        count = 4,
        mining_trigger =
        {
          {
            type = "direct",
            action_delivery =
            {
              {
                type = "instant",
                target_effects = leaf_sound_trigger
              }
            }
          }
        }
      },
      corpse = type_name .. "-stump",
      damaged_trigger_effect = leaf_sound_trigger,
      mined_sound = leaf_sound,
      remains_when_mined = type_name .. "-stump",
      emissions_per_second = tree_emissions_per_second,
      max_health = 50,
      collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
      selection_box = {{-0.9, -2.2}, {0.9, 0.6}},
      drawing_box = tree_data.drawing_box,
      subgroup = "trees",
      order = "a[tree]-a[regular]-" .. order,
      vehicle_impact_sound = sounds.tree_impact,
      autoplace = tree_data.autoplace,
      variations = tree_variations,
      variation_weights = tree_data.variation_weights,
      colors = tree_data.colors,
      darkness_of_burnt_tree = 0.5,
      -- water_reflection = tree_data.water_reflection
    }
  })
end end

---- Generate stumps (corpses)

for i, type_data in ipairs(tree_types) do
  local type_number = string.format("%02d", i)
  local type_name = "tree-" .. type_number
  local order = index_to_letter(i) .. "[" .. type_name .. "]"

  local stump_variations = {}
  for variation_index, variation in ipairs(type_data) do
    local variation_letter = index_to_letter(variation_index)
    local variation_path = type_number .. "/" .. type_name .. "-" .. variation_letter
    local hr_variation_path = type_number .. "/hr-" .. type_name .. "-" .. variation_letter
    if variation.stump then
      local newStump =
      {
        filename = "__base__/graphics/entity/tree/" .. variation_path .. "-stump.png",
        width = variation.stump.width,
        height = variation.stump.height,
        frame_count = 1,
        direction_count = 1,
        shift = variation.stump.shift,
        hr_version = util.table.deepcopy(variation.stump.hr_version)
      }
      if newStump.hr_version then
        newStump.hr_version.filename = "__base__/graphics/entity/tree/" .. hr_variation_path .. "-stump.png"
        newStump.hr_version.frame_count = 1
        newStump.hr_version.direction_count = newStump.direction_count
        --newStump.hr_version.flags = { "mipmap" }
      end
      stump_variations[#stump_variations + 1] = newStump
    else
      local newStump =
      {
        filename = "__base__/graphics/entity/tree/" .. variation_path .. "-trunk.png",
        width = variation.trunk.width,
        height = variation.trunk.height,
        x = variation.trunk.width * 4,
        frame_count = 1,
        direction_count = 1,
        shift = variation.trunk.shift,
        hr_version = util.table.deepcopy(variation.trunk.hr_version)
      }
      if newStump.hr_version then
        newStump.hr_version.filename = "__base__/graphics/entity/tree/" .. hr_variation_path .. "-trunk.png"
        newStump.hr_version.x = variation.trunk.hr_version.width * 4
        newStump.hr_version.frame_count = 1
        newStump.hr_version.direction_count = newStump.direction_count
        --newStump.hr_version.flags = { "mipmap" }
      end
      stump_variations[#stump_variations + 1] = newStump
    end
  end

  data:extend(
  {
    {
      type = "corpse",
      name = type_name .. "-stump",
      localised_name = {"entity-name.tree-stump"},
      icon = "__base__/graphics/icons/" .. type_name .. "-stump.png",
      icon_size = 64, icon_mipmaps = 4,
      flags = tree_corpse_flags,
      collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
      selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
      tile_width = 1,
      tile_height = 1,
      selectable_in_game = false,
      time_before_removed = 60 * 60 * 15, -- 15 minutes
      final_render_layer = "remnants",
      subgroup = "remnants",
      order="d[remnants]-b[tree]-" .. order,
      animation = stump_variations
    }
  })
end

data:extend(
{
  {
    type = "noise-layer",
    name = "trees"
  },
  {
    type = "tree",
    name = "dry-tree",
    icon = "__base__/graphics/icons/dry-tree.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = tree_flags,
    minable =
    {
      count = 4,
      mining_particle = "wooden-particle",
      mining_time = 0.5,
      result = "wood"
    },
    emissions_per_second = dead_tree_emissions_per_second,
    max_health = 20,
    collision_box = {{-0.4, -0.8}, {0.4, 0.2}},
    selection_box = {{-0.6, -1.5}, {0.6, 0.3}},
    drawing_box = {{-0.6, -1.8}, {0.6, 0.3}},
    subgroup = "trees",
    order = "a[tree]-c[dry-tree]",
    vehicle_impact_sound = sounds.tree_impact,
    autoplace = dead_trees_autoplace(0.5),
    pictures =
    {
      --dry-tree
      {
        filename = "__base__/graphics/entity/tree/dry-tree/dry-tree-00.png",
        width = 54,
        height = 49,
        shift = util.by_pixel(15, -15.5),
        hr_version =
        {
          filename = "__base__/graphics/entity/tree/dry-tree/hr-dry-tree-00.png",
          width = 184,
          height = 122,
          shift = util.by_pixel(13, -15),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/tree/dry-tree/dry-tree-01.png",
        width = 52,
        height = 53,
        shift = util.by_pixel(14, -18.5),
        hr_version =
        {
          filename = "__base__/graphics/entity/tree/dry-tree/hr-dry-tree-01.png",
          width = 142,
          height = 122,
          shift = util.by_pixel(23.5, -15),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/tree/dry-tree/dry-tree-02.png",
        width = 63,
        height = 52,
        shift = util.by_pixel(20.5, -16),
        hr_version =
        {
          filename = "__base__/graphics/entity/tree/dry-tree/hr-dry-tree-02.png",
          width = 140,
          height = 115,
          shift = util.by_pixel(24, -13.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/tree/dry-tree/dry-tree-03.png",
        width = 58,
        height = 47,
        shift = util.by_pixel(12, -11.5),
        hr_version =
        {
          filename = "__base__/graphics/entity/tree/dry-tree/hr-dry-tree-03.png",
          width = 151,
          height = 101,
          shift = util.by_pixel(21.25, -9.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/tree/dry-tree/dry-tree-04.png",
        width = 49,
        height = 50,
        shift = util.by_pixel(9.5, -14),
        hr_version =
        {
          filename = "__base__/graphics/entity/tree/dry-tree/hr-dry-tree-04.png",
          width = 149,
          height = 109,
          shift = util.by_pixel(21.75, -11.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/tree/dry-tree/dry-tree-05.png",
        width = 56,
        height = 52,
        shift = util.by_pixel(14, -16),
        hr_version =
        {
          filename = "__base__/graphics/entity/tree/dry-tree/hr-dry-tree-05.png",
          width = 146,
          height = 116,
          shift = util.by_pixel(22.5, -13.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/tree/dry-tree/dry-tree-06.png",
        width = 59,
        height = 60,
        shift = util.by_pixel(17.5, -22),
        hr_version =
        {
          filename = "__base__/graphics/entity/tree/dry-tree/hr-dry-tree-06.png",
          width = 141,
          height = 135,
          shift = util.by_pixel(23.75, -18.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/tree/dry-tree/dry-tree-07.png",
        width = 63,
        height = 47,
        shift = util.by_pixel(7.5, -14.5),
        hr_version =
        {
          filename = "__base__/graphics/entity/tree/dry-tree/hr-dry-tree-07.png",
          width = 166,
          height = 107,
          shift = util.by_pixel(17.5, -11.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/tree/dry-tree/dry-tree-08.png",
        width = 54,
        height = 53,
        shift = util.by_pixel(17, -10.5),
        hr_version =
        {
          filename = "__base__/graphics/entity/tree/dry-tree/hr-dry-tree-08.png",
          width = 138,
          height = 106,
          shift = util.by_pixel(24.5, -10),
          scale = 0.5
        }
      }
    }
  },
  ----------------------------------------------------------------------------------------DEAD-TREE-DESERT
  {
    type = "tree",
    name = "dead-tree-desert",
    icon = "__base__/graphics/icons/dead-tree.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = tree_flags,
    minable =
    {
      mining_particle = "wooden-particle",
      mining_time = 0.5,
      result = "wood",
      count = 2
    },
    emissions_per_second = dead_tree_emissions_per_second,
    max_health = 20,
    collision_box = {{-0.6, -0.6}, {0.6, 0.6}},
    selection_box = {{-0.8, -0.8}, {0.8, 0.8}},
    drawing_box = {{-0.9, -3}, {0.9, 0.6}},
    subgroup = "trees",
    order = "a[tree]-b[dead-tree]",
    vehicle_impact_sound = sounds.tree_impact,
    autoplace = dead_trees_autoplace(0.5),
    pictures =
    {
      --dead-desert
      {
        filename = "__base__/graphics/entity/tree/dead-tree-desert/dead-tree-desert-00.png",
        width = 199,
        height = 126,
        shift = util.by_pixel(66.5, -32),
        hr_version =
        {
          filename = "__base__/graphics/entity/tree/dead-tree-desert/hr-dead-tree-desert-00.png",
          width = 398,
          height = 250,
          shift = util.by_pixel(66.5, -32),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/tree/dead-tree-desert/dead-tree-desert-01.png",
        width = 200,
        height = 125,
        shift = util.by_pixel(64, -36.5),
        hr_version =
        {
          filename = "__base__/graphics/entity/tree/dead-tree-desert/hr-dead-tree-desert-01.png",
          width = 399,
          height = 249,
          shift = util.by_pixel(64.25, -36.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/tree/dead-tree-desert/dead-tree-desert-02.png",
        width = 198,
        height = 126,
        shift = util.by_pixel(29, -43),
        hr_version =
        {
          filename = "__base__/graphics/entity/tree/dead-tree-desert/hr-dead-tree-desert-02.png",
          width = 398,
          height = 250,
          shift = util.by_pixel(29.5, -43),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/tree/dead-tree-desert/dead-tree-desert-03.png",
        width = 199,
        height = 125,
        shift = util.by_pixel(25.5, -30.5),
        hr_version =
        {
          filename = "__base__/graphics/entity/tree/dead-tree-desert/hr-dead-tree-desert-03.png",
          width = 399,
          height = 249,
          shift = util.by_pixel(25.75, -30.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/tree/dead-tree-desert/dead-tree-desert-04.png",
        width = 199,
        height = 125,
        shift = util.by_pixel(38.5, -22.5),
        hr_version =
        {
          filename = "__base__/graphics/entity/tree/dead-tree-desert/hr-dead-tree-desert-04.png",
          width = 398,
          height = 249,
          shift = util.by_pixel(38.5, -22.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/tree/dead-tree-desert/dead-tree-desert-05.png",
        width = 199,
        height = 126,
        shift = util.by_pixel(64.5, -23),
        hr_version =
        {
          filename = "__base__/graphics/entity/tree/dead-tree-desert/hr-dead-tree-desert-05.png",
          width = 398,
          height = 250,
          shift = util.by_pixel(64.5, -23),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/tree/dead-tree-desert/dead-tree-desert-06.png",
        width = 199,
        height = 125,
        shift = util.by_pixel(28.5, -14.5),
        hr_version =
        {
          filename = "__base__/graphics/entity/tree/dead-tree-desert/hr-dead-tree-desert-06.png",
          width = 398,
          height = 249,
          shift = util.by_pixel(28.5, -14.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/tree/dead-tree-desert/dead-tree-desert-07.png",
        width = 199,
        height = 125,
        shift = util.by_pixel(50.5, -40.5),
        hr_version =
        {
          filename = "__base__/graphics/entity/tree/dead-tree-desert/hr-dead-tree-desert-07.png",
          width = 398,
          height = 249,
          shift = util.by_pixel(50.5, -40.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/tree/dead-tree-desert/dead-tree-desert-08.png",
        width = 200,
        height = 125,
        shift = util.by_pixel(18, -43.5),
        hr_version =
        {
          filename = "__base__/graphics/entity/tree/dead-tree-desert/hr-dead-tree-desert-08.png",
          width = 398,
          height = 249,
          shift = util.by_pixel(18, -43.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/tree/dead-tree-desert/dead-tree-desert-09.png",
        width = 199,
        height = 125,
        shift = util.by_pixel(40.5, -16.5),
        hr_version =
        {
          filename = "__base__/graphics/entity/tree/dead-tree-desert/hr-dead-tree-desert-09.png",
          width = 399,
          height = 249,
          shift = util.by_pixel(41.25, -16.75),
          scale = 0.5
        }
      }
    }
  },
  --------------------------------------------------------------------------------------------------------
  {
    type = "tree",
    name = "dead-grey-trunk",
    icon = "__base__/graphics/icons/dead-grey-trunk.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = tree_flags,
    minable =
    {
      mining_particle = "wooden-particle",
      mining_time = 0.5,
      result = "wood",
      count = 2
    },
    emissions_per_second = dead_tree_emissions_per_second,
    max_health = 20,
    collision_box = {{-0.6, -0.6}, {0.6, 0.6}},
    selection_box = {{-0.8, -0.8}, {0.8, 0.8}},
    subgroup = "trees",
    order = "a[tree]-b[dead-tree]",
    vehicle_impact_sound = sounds.tree_impact,
    autoplace = dead_trees_autoplace(1),
    pictures =
    {
      --dead-grey-trunk
      {
        filename = "__base__/graphics/entity/tree/dead-grey-trunk/dead-grey-trunk-00.png",
        width = 109,
        height = 88,
        shift = util.by_pixel(29.5, -25),
        hr_version =
        {
          filename = "__base__/graphics/entity/tree/dead-grey-trunk/hr-dead-grey-trunk-00.png",
          width = 217,
          height = 178,
          shift = util.by_pixel(29.75, -25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/tree/dead-grey-trunk/dead-grey-trunk-01.png",
        width = 102,
        height = 91,
        shift = util.by_pixel(27, -24.5),
        hr_version =
        {
          filename = "__base__/graphics/entity/tree/dead-grey-trunk/hr-dead-grey-trunk-01.png",
          width = 205,
          height = 185,
          shift = util.by_pixel(26.75, -24.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/tree/dead-grey-trunk/dead-grey-trunk-02.png",
        width = 111,
        height = 89,
        shift = util.by_pixel(29.5, -24.5),
        hr_version =
        {
          filename = "__base__/graphics/entity/tree/dead-grey-trunk/hr-dead-grey-trunk-02.png",
          width = 221,
          height = 179,
          shift = util.by_pixel(29.25, -24.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/tree/dead-grey-trunk/dead-grey-trunk-03.png",
        width = 106,
        height = 83,
        shift = util.by_pixel(29, -20.5),
        hr_version =
        {
          filename = "__base__/graphics/entity/tree/dead-grey-trunk/hr-dead-grey-trunk-03.png",
          width = 210,
          height = 167,
          shift = util.by_pixel(29, -19.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/tree/dead-grey-trunk/dead-grey-trunk-04.png",
        width = 128,
        height = 93,
        shift = util.by_pixel(33, -20.5),
        hr_version =
        {
          filename = "__base__/graphics/entity/tree/dead-grey-trunk/hr-dead-grey-trunk-04.png",
          width = 257,
          height = 185,
          shift = util.by_pixel(32.75, -20.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/tree/dead-grey-trunk/dead-grey-trunk-05.png",
        width = 114,
        height = 83,
        shift = util.by_pixel(16, -3.5),
        hr_version =
        {
          filename = "__base__/graphics/entity/tree/dead-grey-trunk/hr-dead-grey-trunk-05.png",
          width = 226,
          height = 166,
          shift = util.by_pixel(16, -3.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/tree/dead-grey-trunk/dead-grey-trunk-06.png",
        width = 113,
        height = 58,
        shift = util.by_pixel(3.5, 1),
        hr_version =
        {
          filename = "__base__/graphics/entity/tree/dead-grey-trunk/hr-dead-grey-trunk-06.png",
          width = 226,
          height = 117,
          shift = util.by_pixel(3, 1.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/tree/dead-grey-trunk/dead-grey-trunk-07.png",
        width = 108,
        height = 83,
        shift = util.by_pixel(3, -1.5),
        hr_version =
        {
          filename = "__base__/graphics/entity/tree/dead-grey-trunk/hr-dead-grey-trunk-07.png",
          width = 215,
          height = 165,
          shift = util.by_pixel(2.75, -1.25),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/tree/dead-grey-trunk/dead-grey-trunk-08.png",
        width = 104,
        height = 88,
        shift = util.by_pixel(7, -11),
        hr_version =
        {
          filename = "__base__/graphics/entity/tree/dead-grey-trunk/hr-dead-grey-trunk-08.png",
          width = 207,
          height = 176,
          shift = util.by_pixel(7.25, -11),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/tree/dead-grey-trunk/dead-grey-trunk-09.png",
        width = 116,
        height = 60,
        shift = util.by_pixel(-5, -3),
        hr_version =
        {
          filename = "__base__/graphics/entity/tree/dead-grey-trunk/hr-dead-grey-trunk-09.png",
          width = 231,
          height = 120,
          shift = util.by_pixel(-4.75, -3),
          scale = 0.5
        }
      }
    }
  },

  {
    type = "tree",
    name = "dead-dry-hairy-tree",
    icon = "__base__/graphics/icons/dead-dry-hairy-tree.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = tree_flags,
    minable =
    {
      mining_particle = "wooden-particle",
      mining_time = 0.5,
      result = "wood",
      count = 2
    },
    emissions_per_second = dead_tree_emissions_per_second,
    max_health = 20,
    collision_box = {{-0.6, -0.6}, {0.6, 0.6}},
    selection_box = {{-0.8, -0.8}, {0.8, 0.8}},
    subgroup = "trees",
    order = "a[tree]-b[dead-tree]",
    vehicle_impact_sound = sounds.tree_impact,
    autoplace = dead_trees_autoplace(0.5),
    pictures =
    {
      --dead-dry-hairy
      {
        filename = "__base__/graphics/entity/tree/dead-dry-hairy-tree/dead-dry-hairy-tree-00.png",
        width = 195,
        height = 95,
        shift = util.by_pixel(-20, 2),
        hr_version =
        {
          filename = "__base__/graphics/entity/tree/dead-dry-hairy-tree/hr-dead-dry-hairy-tree-00.png",
          width = 388,
          height = 189,
          shift = util.by_pixel(-20, 2),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/tree/dead-dry-hairy-tree/dead-dry-hairy-tree-01.png",
        width = 186,
        height = 151,
        shift = util.by_pixel(-15, -19.75),
        hr_version =
        {
          filename = "__base__/graphics/entity/tree/dead-dry-hairy-tree/hr-dead-dry-hairy-tree-01.png",
          width = 371,
          height = 301,
          shift = util.by_pixel(-15, -19.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/tree/dead-dry-hairy-tree/dead-dry-hairy-tree-02.png",
        width = 163,
        height = 125,
        shift = util.by_pixel(-8.5, -14.5),
        hr_version =
        {
          filename = "__base__/graphics/entity/tree/dead-dry-hairy-tree/hr-dead-dry-hairy-tree-02.png",
          width = 324,
          height = 252,
          shift = util.by_pixel(-8.5, -14.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/tree/dead-dry-hairy-tree/dead-dry-hairy-tree-03.png",
        width = 179,
        height = 155,
        shift = util.by_pixel(42, -15),
        hr_version =
        {
          filename = "__base__/graphics/entity/tree/dead-dry-hairy-tree/hr-dead-dry-hairy-tree-03.png",
          width = 358,
          height = 310,
          shift = util.by_pixel(42, -15),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/tree/dead-dry-hairy-tree/dead-dry-hairy-tree-04.png",
        width = 193,
        height = 158,
        shift = util.by_pixel(40, -15),
        hr_version =
        {
          filename = "__base__/graphics/entity/tree/dead-dry-hairy-tree/hr-dead-dry-hairy-tree-04.png",
          width = 386,
          height = 316,
          shift = util.by_pixel(40, -15),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/tree/dead-dry-hairy-tree/dead-dry-hairy-tree-05.png",
        width = 212,
        height = 143,
        shift = util.by_pixel(35, -18),
        hr_version =
        {
          filename = "__base__/graphics/entity/tree/dead-dry-hairy-tree/hr-dead-dry-hairy-tree-05.png",
          width = 425,
          height = 285,
          shift = util.by_pixel(35, -18),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/tree/dead-dry-hairy-tree/dead-dry-hairy-tree-06.png",
        width = 212,
        height = 147,
        shift = util.by_pixel(42, -24.5),
        hr_version =
        {
          filename = "__base__/graphics/entity/tree/dead-dry-hairy-tree/hr-dead-dry-hairy-tree-06.png",
          width = 424,
          height = 294,
          shift = util.by_pixel(42, -24.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/tree/dead-dry-hairy-tree/dead-dry-hairy-tree-07.png",
        width = 193,
        height = 111,
        shift = util.by_pixel(25, -19.5),
        hr_version =
        {
          filename = "__base__/graphics/entity/tree/dead-dry-hairy-tree/hr-dead-dry-hairy-tree-07.png",
          width = 385,
          height = 224,
          shift = util.by_pixel(25, -19.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/tree/dead-dry-hairy-tree/dead-dry-hairy-tree-08.png",
        width = 171,
        height = 83,
        shift = util.by_pixel(20, 10),
        hr_version =
        {
          filename = "__base__/graphics/entity/tree/dead-dry-hairy-tree/hr-dead-dry-hairy-tree-08.png",
          width = 341,
          height = 166,
          shift = util.by_pixel(20, 10),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/tree/dead-dry-hairy-tree/dead-dry-hairy-tree-09.png",
        width = 154,
        height = 137,
        shift = util.by_pixel(28.75, 13),
        hr_version =
        {
          filename = "__base__/graphics/entity/tree/dead-dry-hairy-tree/hr-dead-dry-hairy-tree-09.png",
          width = 309,
          height = 274,
          shift = util.by_pixel(28.75, 13),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/tree/dead-dry-hairy-tree/dead-dry-hairy-tree-10.png",
        width = 159,
        height = 123,
        shift = util.by_pixel(-7, 11),
        hr_version =
        {
          filename = "__base__/graphics/entity/tree/dead-dry-hairy-tree/hr-dead-dry-hairy-tree-10.png",
          width = 317,
          height = 246,
          shift = util.by_pixel(-7, 11),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/tree/dead-dry-hairy-tree/dead-dry-hairy-tree-11.png",
        width = 167,
        height = 120,
        shift = util.by_pixel(-9, 10),
        hr_version =
        {
          filename = "__base__/graphics/entity/tree/dead-dry-hairy-tree/hr-dead-dry-hairy-tree-11.png",
          width = 335,
          height = 238,
          shift = util.by_pixel(-9, 10),
          scale = 0.5
        }
      }
    }
  },
  {
    type = "tree",
    name = "dry-hairy-tree",
    icon = "__base__/graphics/icons/dry-hairy-tree.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = tree_flags,
    minable =
    {
      mining_particle = "wooden-particle",
      mining_time = 0.5,
      result = "wood",
      count = 2
    },
    emissions_per_second = dead_tree_emissions_per_second,
    max_health = 20,
    collision_box = {{-0.6, -0.6}, {0.6, 0.6}},
    selection_box = {{-0.8, -0.8}, {0.8, 0.8}},
    drawing_box = {{-0.9, -3.5}, {0.9, 0.6}},
    subgroup = "trees",
    order = "a[tree]-b[dead-tree]",
    vehicle_impact_sound = sounds.tree_impact,
    autoplace = dead_trees_autoplace(0.5),
    pictures =
    {
      --dry-hairy-tree
      {
        filename = "__base__/graphics/entity/tree/dry-hairy-tree/dry-hairy-tree-00.png",
        width = 222,
        height = 178,
        shift = util.by_pixel(45.5, -28.75),
        hr_version =
        {
          filename = "__base__/graphics/entity/tree/dry-hairy-tree/hr-dry-hairy-tree-00.png",
          width = 444,
          height = 357,
          shift = util.by_pixel(45.5, -28.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/tree/dry-hairy-tree/dry-hairy-tree-01.png",
        width = 253,
        height = 147,
        shift = util.by_pixel(45, -42.75),
        hr_version =
        {
          filename = "__base__/graphics/entity/tree/dry-hairy-tree/hr-dry-hairy-tree-01.png",
          width = 506,
          height = 293,
          shift = util.by_pixel(45, -42.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/tree/dry-hairy-tree/dry-hairy-tree-02.png",
        width = 247,
        height = 155,
        shift = util.by_pixel(56.25, -31.75),
        hr_version =
        {
          filename = "__base__/graphics/entity/tree/dry-hairy-tree/hr-dry-hairy-tree-02.png",
          width = 493,
          height = 309,
          shift = util.by_pixel(56.25, -31.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/tree/dry-hairy-tree/dry-hairy-tree-03.png",
        width = 242,
        height = 152,
        shift = util.by_pixel(68.5, -41.75),
        hr_version =
        {
          filename = "__base__/graphics/entity/tree/dry-hairy-tree/hr-dry-hairy-tree-03.png",
          width = 484,
          height = 303,
          shift = util.by_pixel(68.5, -41.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/tree/dry-hairy-tree/dry-hairy-tree-04.png",
        width = 229,
        height = 143,
        shift = util.by_pixel(62.75, -32.75),
        hr_version =
        {
          filename = "__base__/graphics/entity/tree/dry-hairy-tree/hr-dry-hairy-tree-04.png",
          width = 457,
          height = 287,
          shift = util.by_pixel(62.75, -32.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/tree/dry-hairy-tree/dry-hairy-tree-05.png",
        width = 229,
        height = 195,
        shift = util.by_pixel(22.25, -33.5),
        hr_version =
        {
          filename = "__base__/graphics/entity/tree/dry-hairy-tree/hr-dry-hairy-tree-05.png",
          width = 459,
          height = 390,
          shift = util.by_pixel(22.25, -33.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/tree/dry-hairy-tree/dry-hairy-tree-06.png",
        width = 215,
        height = 136,
        shift = util.by_pixel(46, -19),
        hr_version =
        {
          filename = "__base__/graphics/entity/tree/dry-hairy-tree/hr-dry-hairy-tree-06.png",
          width = 432,
          height = 272,
          shift = util.by_pixel(46, -19),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/tree/dry-hairy-tree/dry-hairy-tree-07.png",
        width = 184,
        height = 154,
        shift = util.by_pixel(28, -27.5),
        hr_version =
        {
          filename = "__base__/graphics/entity/tree/dry-hairy-tree/hr-dry-hairy-tree-07.png",
          width = 368,
          height = 308,
          shift = util.by_pixel(28, -27.5),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/tree/dry-hairy-tree/dry-hairy-tree-08.png",
        width = 215,
        height = 136,
        shift = util.by_pixel(46.75, -52.5),
        hr_version =
        {
          filename = "__base__/graphics/entity/tree/dry-hairy-tree/hr-dry-hairy-tree-08.png",
          width = 429,
          height = 272,
          shift = util.by_pixel(46.75, -52.5),
          scale = 0.5
        }
      }
    }
  }
})
