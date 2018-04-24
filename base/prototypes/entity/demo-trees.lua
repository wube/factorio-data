local inspect = require('inspect')
local util = require('util')
local merge = util.merge

local starting_area_clearing_radius = 128
local starting_area_clearing_border_width = 64

local starting_area_clearing_peak = {
  influence = -0.25,
  richness_influence = 0,
  distance_optimal = 0,
  distance_range = starting_area_clearing_radius - starting_area_clearing_border_width,
  distance_max_range = starting_area_clearing_radius + starting_area_clearing_border_width,
  distance_top_property_limit = starting_area_clearing_radius, -- must be halfway between range and max_range so that influence never becomes positive!
}

local next_tree_noise_layer_number = 1

-- static_influence is added
-- tree_noise_influence is multiplied by tree noise, the result of which is added
local function tree_autoplace( temperature_optimal, temperature_range, water_optimal, water_range, static_influence, tree_noise_influence )
  tree_noise_influence = tree_noise_influence ~= nil and tree_noise_influence or 1
  static_influence = static_influence ~= nil and static_influence or 0

  static_influence = static_influence - 0.75 -- Less trees everywhere!
  tree_noise_influence = tree_noise_influence * 0.5

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

  return {
    control = "trees",
    order = "a[tree]-b[forest]",
    max_probability = 0.45,
    random_probability_penalty = 1e-3;
    sharpness = 0.4,
    richness_base = 0.0,
    richness_multiplier = 1,
    peaks = {
      {
        -- increase richness everywhere to reduce
        -- large groups of unhealthy trees
        influence = 0,
        richness_influence = 0.75
      },
      {
        influence = static_influence,
        richness_influence = -static_influence,
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
        water_max_range = water_range * 1.5,
      },
      starting_area_clearing_peak,
    }
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
    peaks = {
      {
        influence = -0.8,
        richness_influence = 0,
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
        water_max_range = 0.2,
      },
      starting_area_clearing_peak,
    }
  }
end

local tree_types =
{
  { -- tree-01
    --addHere-tree01
    { -- a
      trunk = {
        width = 177,
        height = 150,
        shift = util.by_pixel(29.5, -38),
        hr_version = {
          width = 354,
          height = 298,
          shift = util.by_pixel(30.5, -37.5),
          scale = 0.5
        },
      },
      leaves = {
        width = 102,
        height = 115,
        shift = util.by_pixel(-11, -65.5),
        hr_version = {
          width = 204,
          height = 231,
          shift = util.by_pixel(-10.5, -64.75),
          scale = 0.5
        },
      },
    },
    { -- b
      trunk = {
        width = 179,
        height = 149,
        shift = util.by_pixel(49.5, -40.5),
        hr_version = {
          width = 358,
          height = 298,
          shift = util.by_pixel(50, -40),
          scale = 0.5
        },
      },
      leaves = {
        width = 89,
        height = 107,
        shift = util.by_pixel(3.5, -69.5),
        hr_version = {
          width = 178,
          height = 215,
          shift = util.by_pixel(4, -69.25),
          scale = 0.5
        },
      },
    },
    { -- c
      trunk = {
        width = 156,
        height = 146,
        shift = util.by_pixel(52, -34),
        hr_version = {
          width = 313,
          height = 291,
          shift = util.by_pixel(52.25, -33.75),
          scale = 0.5
        },
      },
      leaves = {
        width = 94,
        height = 104,
        shift = util.by_pixel(6, -64),
        hr_version = {
          width = 190,
          height = 210,
          shift = util.by_pixel(6.5, -63.5),
          scale = 0.5
        },
      },
    },
    { -- d
      trunk = {
        width = 176,
        height = 152,
        shift = util.by_pixel(55, -35),
        hr_version = {
          width = 351,
          height = 302,
          shift = util.by_pixel(55.25, -34.5),
          scale = 0.5
        },
      },
      leaves = {
        width = 102,
        height = 106,
        shift = util.by_pixel(12, -63),
        hr_version = {
          width = 205,
          height = 212,
          shift = util.by_pixel(12.25, -62),
          scale = 0.5
        },
      },
    },
    { -- e
      trunk = {
        width = 174,
        height = 141,
        shift = util.by_pixel(56, -35.5),
        hr_version = {
          width = 346,
          height = 281,
          shift = util.by_pixel(56.5, -34.75),
          scale = 0.5
        },
      },
      leaves = {
        width = 105,
        height = 110,
        shift = util.by_pixel(16.5, -55),
        hr_version = {
          width = 212,
          height = 221,
          shift = util.by_pixel(17, -54.75),
          scale = 0.5
        },
      },
    },
    { -- f
      trunk = {
        width = 176,
        height = 141,
        shift = util.by_pixel(42, -22.5),
        hr_version = {
          width = 350,
          height = 280,
          shift = util.by_pixel(42.5, -22),
          scale = 0.5
        },
      },
      leaves = {
        width = 95,
        height = 101,
        shift = util.by_pixel(0.5, -46.5),
        hr_version = {
          width = 191,
          height = 203,
          shift = util.by_pixel(0.75, -45.75),
          scale = 0.5
        },
      },
    },
    { -- g
      trunk = {
        width = 164,
        height = 150,
        shift = util.by_pixel(20, -24),
        hr_version = {
          width = 328,
          height = 301,
          shift = util.by_pixel(20.5, -23.75),
          scale = 0.5
        },
      },
      leaves = {
        width = 96,
        height = 119,
        shift = util.by_pixel(-18, -50.5),
        hr_version = {
          width = 193,
          height = 239,
          shift = util.by_pixel(-17.75, -49.75),
          scale = 0.5
        },
      },
    },
    { -- h
      trunk = {
        width = 181,
        height = 144,
        shift = util.by_pixel(26.5, -33),
        hr_version = {
          width = 360,
          height = 288,
          shift = util.by_pixel(27, -32.5),
          scale = 0.5
        },
      },
      leaves = {
        width = 108,
        height = 108,
        shift = util.by_pixel(-20, -59),
        hr_version = {
          width = 216,
          height = 216,
          shift = util.by_pixel(-20, -59),
          scale = 0.5
        },
      },
    },
    { -- i
      trunk = {
        width = 165,
        height = 162,
        shift = util.by_pixel(41.5, -22),
        hr_version = {
          width = 329,
          height = 323,
          shift = util.by_pixel(41.75, -21.25),
          scale = 0.5
        },
      },
      leaves = {
        width = 88,
        height = 121,
        shift = util.by_pixel(0, -47.5),
        hr_version = {
          width = 177,
          height = 244,
          shift = util.by_pixel(0.75, -47),
          scale = 0.5
        },
      },
    },
    { -- j
      trunk = {
        width = 132,
        height = 115,
        shift = util.by_pixel(35, -29.5),
        hr_version = {
          width = 264,
          height = 229,
          shift = util.by_pixel(35.5, -29.25),
          scale = 0.5
        },
      },
      leaves = {
        width = 89,
        height = 90,
        shift = util.by_pixel(4.5, -53),
        hr_version = {
          width = 180,
          height = 179,
          shift = util.by_pixel(5, -52.25),
          scale = 0.5
        },
      },
    },
  },
  { -- tree-02
    --addHere-tree02
    { -- a
      trunk = {
        width = 225,
        height = 169,
        shift = util.by_pixel(61.5, -46.5),
        hr_version = {
          width = 448,
          height = 340,
          shift = util.by_pixel(61.5, -47.5),
          scale = 0.5
        },
      },
      leaves = {
        width = 95,
        height = 131,
        shift = util.by_pixel(-4.5, -70.5),
        hr_version = {
          width = 190,
          height = 261,
          shift = util.by_pixel(-4.5, -70.75),
          scale = 0.5
        },
      },
    },
    { -- b
      trunk = {
        width = 279,
        height = 193,
        shift = util.by_pixel(31.5, -43.5),
        hr_version = {
          width = 558,
          height = 385,
          shift = util.by_pixel(32, -43.25),
          scale = 0.5
        },
      },
      leaves = {
        width = 98,
        height = 143,
        shift = util.by_pixel(-6, -70.5),
        hr_version = {
          width = 194,
          height = 285,
          shift = util.by_pixel(-6, -70.25),
          scale = 0.5
        },
      },
    },
    { -- c
      trunk = {
        width = 249,
        height = 188,
        shift = util.by_pixel(69.5, -51),
        hr_version = {
          width = 499,
          height = 377,
          shift = util.by_pixel(69.25, -50.75),
          scale = 0.5
        },
      },
      leaves = {
        width = 106,
        height = 154,
        shift = util.by_pixel(-3, -83),
        hr_version = {
          width = 213,
          height = 309,
          shift = util.by_pixel(-3.25, -83.25),
          scale = 0.5
        },
      },
    },
    { -- d
      trunk = {
        width = 271,
        height = 187,
        shift = util.by_pixel(90.5, -50.5),
        hr_version = {
          width = 541,
          height = 374,
          shift = util.by_pixel(90.25, -51),
          scale = 0.5
        },
      },
      leaves = {
        width = 119,
        height = 154,
        shift = util.by_pixel(13.5, -70),
        hr_version = {
          width = 238,
          height = 309,
          shift = util.by_pixel(14, -70.25),
          scale = 0.5
        },
      },
    },
    { -- e
      trunk = {
        width = 256,
        height = 191,
        shift = util.by_pixel(73, -46.5),
        hr_version = {
          width = 512,
          height = 381,
          shift = util.by_pixel(73.5, -46.25),
          scale = 0.5
        },
      },
      leaves = {
        width = 104,
        height = 144,
        shift = util.by_pixel(-3, -73),
        hr_version = {
          width = 207,
          height = 286,
          shift = util.by_pixel(-2.75, -73),
          scale = 0.5
        },
      },
    },
  },
  { -- tree-03
    --addHere-tree03
    { -- a
      trunk = {
        width = 243,
        height = 156,
        shift = util.by_pixel(72.5, -45),
        hr_version = {
          width = 487,
          height = 312,
          shift = util.by_pixel(72.75, -45),
          scale = 0.5
        },
      },
      leaves = {
        width = 119,
        height = 98,
        shift = util.by_pixel(12.5, -76),
        hr_version = {
          width = 237,
          height = 195,
          shift = util.by_pixel(13.25, -75.75),
          scale = 0.5
        },
      },
    },
    { -- b
      trunk = {
        width = 162,
        height = 124,
        shift = util.by_pixel(50, -39),
        hr_version = {
          width = 324,
          height = 246,
          shift = util.by_pixel(50, -39),
          scale = 0.5
        },
      },
      leaves = {
        width = 78,
        height = 72,
        shift = util.by_pixel(12, -65),
        hr_version = {
          width = 157,
          height = 144,
          shift = util.by_pixel(12.75, -65),
          scale = 0.5
        },
      },
    },
    { -- c
      trunk = {
        width = 193,
        height = 169,
        shift = util.by_pixel(59.5, -51.5),
        hr_version = {
          width = 387,
          height = 337,
          shift = util.by_pixel(59.75, -51.25),
          scale = 0.5
        },
      },
      leaves = {
        width = 94,
        height = 88,
        shift = util.by_pixel(13, -92),
        hr_version = {
          width = 187,
          height = 178,
          shift = util.by_pixel(13.25, -91.5),
          scale = 0.5
        },
      },
    },
    { -- d
      trunk = {
        width = 236,
        height = 169,
        shift = util.by_pixel(65, -53.5),
        hr_version = {
          width = 473,
          height = 337,
          shift = util.by_pixel(64.75, -53.75),
          scale = 0.5
        },
      },
      leaves = {
        width = 100,
        height = 83,
        shift = util.by_pixel(0, -98.5),
        hr_version = {
          width = 204,
          height = 167,
          shift = util.by_pixel(0.5, -97.75),
          scale = 0.5
        },
      },
    },
    { -- e
      trunk = {
        width = 258,
        height = 143,
        shift = util.by_pixel(59, -48.5),
        hr_version = {
          width = 516,
          height = 285,
          shift = util.by_pixel(59, -48.75),
          scale = 0.5
        },
      },
      leaves = {
        width = 117,
        height = 83,
        shift = util.by_pixel(-7.5, -80.5),
        hr_version = {
          width = 235,
          height = 167,
          shift = util.by_pixel(-6.75, -79.75),
          scale = 0.5
        },
      },
    },
    { -- f
      trunk = {
        width = 213,
        height = 158,
        shift = util.by_pixel(48.5, -44),
        hr_version = {
          width = 427,
          height = 315,
          shift = util.by_pixel(48.75, -43.75),
          scale = 0.5
        },
      },
      leaves = {
        width = 93,
        height = 100,
        shift = util.by_pixel(-8.5, -67),
        hr_version = {
          width = 186,
          height = 201,
          shift = util.by_pixel(-8, -66.25),
          scale = 0.5
        },
      },
    },
    { -- g
      trunk = {
        width = 176,
        height = 149,
        shift = util.by_pixel(40, -34.5),
        hr_version = {
          width = 352,
          height = 299,
          shift = util.by_pixel(40, -35.25),
          scale = 0.5
        },
      },
      leaves = {
        width = 76,
        height = 105,
        shift = util.by_pixel(-6, -59.5),
        hr_version = {
          width = 155,
          height = 212,
          shift = util.by_pixel(-5.25, -59),
          scale = 0.5
        },
      },
    },
  },
  { -- tree-04
    --addHere-tree04
    { -- a
      trunk = {
        width = 255,
        height = 170,
        shift = util.by_pixel(78.5, -50),
        hr_version = {
          width = 509,
          height = 340,
          shift = util.by_pixel(78.75, -49.5),
          scale = 0.5
        },
      },
      leaves = {
        width = 98,
        height = 127,
        shift = util.by_pixel(0, -76.5),
        hr_version = {
          width = 197,
          height = 254,
          shift = util.by_pixel(0.25, -75.5),
          scale = 0.5
        },
      },
    },
    { -- b
      trunk = {
        width = 231,
        height = 168,
        shift = util.by_pixel(69.5, -46),
        hr_version = {
          width = 463,
          height = 336,
          shift = util.by_pixel(70.25, -45.5),
          scale = 0.5
        },
      },
      leaves = {
        width = 105,
        height = 140,
        shift = util.by_pixel(3.5, -68),
        hr_version = {
          width = 212,
          height = 280,
          shift = util.by_pixel(4, -67.5),
          scale = 0.5
        },
      },
    },
    { -- c
      trunk = {
        width = 265,
        height = 176,
        shift = util.by_pixel(92.5, -47),
        hr_version = {
          width = 530,
          height = 353,
          shift = util.by_pixel(92.5, -47.25),
          scale = 0.5
        },
      },
      leaves = {
        width = 99,
        height = 125,
        shift = util.by_pixel(1.5, -74.5),
        hr_version = {
          width = 197,
          height = 250,
          shift = util.by_pixel(2.25, -74.5),
          scale = 0.5
        },
      },
    },
    { -- d
      trunk = {
        width = 273,
        height = 173,
        shift = util.by_pixel(88.5, -46.5),
        hr_version = {
          width = 545,
          height = 348,
          shift = util.by_pixel(88.75, -46.5),
          scale = 0.5
        },
      },
      leaves = {
        width = 99,
        height = 125,
        shift = util.by_pixel(-6.5, -75.5),
        hr_version = {
          width = 198,
          height = 248,
          shift = util.by_pixel(-6, -75),
          scale = 0.5
        },
      },
    },
    { -- e
      trunk = {
        width = 246,
        height = 183,
        shift = util.by_pixel(63, -51.5),
        hr_version = {
          width = 492,
          height = 365,
          shift = util.by_pixel(63.5, -50.75),
          scale = 0.5
        },
      },
      leaves = {
        width = 108,
        height = 136,
        shift = util.by_pixel(-8, -77),
        hr_version = {
          width = 217,
          height = 273,
          shift = util.by_pixel(-7.75, -76.25),
          scale = 0.5
        },
      },
    },
    { -- f
      trunk = {
        width = 260,
        height = 190,
        shift = util.by_pixel(86, -51),
        hr_version = {
          width = 520,
          height = 380,
          shift = util.by_pixel(86.5, -51),
          scale = 0.5
        },
      },
      leaves = {
        width = 100,
        height = 122,
        shift = util.by_pixel(4, -87),
        hr_version = {
          width = 200,
          height = 246,
          shift = util.by_pixel(4, -87),
          scale = 0.5
        },
      },
    },
    { -- g
      trunk = {
        width = 260,
        height = 177,
        shift = util.by_pixel(82, -36.5),
        hr_version = {
          width = 522,
          height = 353,
          shift = util.by_pixel(82.5, -36.25),
          scale = 0.5
        },
      },
      leaves = {
        width = 98,
        height = 116,
        shift = util.by_pixel(-1, -70),
        hr_version = {
          width = 199,
          height = 231,
          shift = util.by_pixel(-0.75, -69.75),
          scale = 0.5
        },
      },
    },
    { -- h
      trunk = {
        width = 253,
        height = 169,
        shift = util.by_pixel(76.5, -35.5),
        hr_version = {
          width = 505,
          height = 340,
          shift = util.by_pixel(77.25, -35.5),
          scale = 0.5
        },
      },
      leaves = {
        width = 103,
        height = 122,
        shift = util.by_pixel(-0.5, -62),
        hr_version = {
          width = 206,
          height = 245,
          shift = util.by_pixel(0, -61.25),
          scale = 0.5
        },
      },
    },
  },
  { -- tree-05
    --addHere-tree05
    { -- a
      trunk = {
        width = 210,
        height = 142,
        shift = util.by_pixel(55, -33),
        hr_version = {
          width = 419,
          height = 284,
          shift = util.by_pixel(55.25, -33),
          scale = 0.5
        },
      },
      leaves = {
        width = 116,
        height = 118,
        shift = util.by_pixel(-3, -56),
        hr_version = {
          width = 233,
          height = 236,
          shift = util.by_pixel(-2.75, -56),
          scale = 0.5
        },
      },
    },
    { -- b
      trunk = {
        width = 198,
        height = 129,
        shift = util.by_pixel(59, -29.5),
        hr_version = {
          width = 394,
          height = 259,
          shift = util.by_pixel(59.5, -29.25),
          scale = 0.5
        },
      },
      leaves = {
        width = 104,
        height = 115,
        shift = util.by_pixel(-2, -49.5),
        hr_version = {
          width = 210,
          height = 230,
          shift = util.by_pixel(-1.5, -49.5),
          scale = 0.5
        },
      },
    },
    { -- c
      trunk = {
        width = 187,
        height = 138,
        shift = util.by_pixel(56.5, -33),
        hr_version = {
          width = 375,
          height = 276,
          shift = util.by_pixel(56.75, -33),
          scale = 0.5
        },
      },
      leaves = {
        width = 116,
        height = 135,
        shift = util.by_pixel(7, -51.5),
        hr_version = {
          width = 232,
          height = 270,
          shift = util.by_pixel(7.5, -51),
          scale = 0.5
        },
      },
    },
    { -- d
      trunk = {
        width = 206,
        height = 138,
        shift = util.by_pixel(57, -23),
        hr_version = {
          width = 412,
          height = 275,
          shift = util.by_pixel(57, -22.75),
          scale = 0.5
        },
      },
      leaves = {
        width = 133,
        height = 131,
        shift = util.by_pixel(2.5, -35.5),
        hr_version = {
          width = 264,
          height = 260,
          shift = util.by_pixel(3, -35.5),
          scale = 0.5
        },
      },
    },
    { -- e
      trunk = {
        width = 185,
        height = 129,
        shift = util.by_pixel(40.5, -19.5),
        hr_version = {
          width = 369,
          height = 258,
          shift = util.by_pixel(41.25, -19.5),
          scale = 0.5
        },
      },
      leaves = {
        width = 120,
        height = 109,
        shift = util.by_pixel(-6, -39.5),
        hr_version = {
          width = 240,
          height = 216,
          shift = util.by_pixel(-6, -39.5),
          scale = 0.5
        },
      },
    },
    { -- f
      trunk = {
        width = 188,
        height = 145,
        shift = util.by_pixel(43, -36.5),
        hr_version = {
          width = 375,
          height = 291,
          shift = util.by_pixel(43.75, -36.25),
          scale = 0.5
        },
      },
      leaves = {
        width = 125,
        height = 140,
        shift = util.by_pixel(-0.5, -51),
        hr_version = {
          width = 250,
          height = 281,
          shift = util.by_pixel(0.5, -51.25),
          scale = 0.5
        },
      },
    },
    { -- g
      trunk = {
        width = 182,
        height = 108,
        shift = util.by_pixel(54, -17),
        hr_version = {
          width = 362,
          height = 216,
          shift = util.by_pixel(54.5, -16.5),
          scale = 0.5
        },
      },
      leaves = {
        width = 117,
        height = 100,
        shift = util.by_pixel(1.5, -33),
        hr_version = {
          width = 232,
          height = 201,
          shift = util.by_pixel(2, -33.25),
          scale = 0.5
        },
      },
    },
    { -- h
      trunk = {
        width = 164,
        height = 119,
        shift = util.by_pixel(45, -17.5),
        hr_version = {
          width = 330,
          height = 240,
          shift = util.by_pixel(45.5, -17.5),
          scale = 0.5
        },
      },
      leaves = {
        width = 111,
        height = 112,
        shift = util.by_pixel(7.5, -36),
        hr_version = {
          width = 221,
          height = 224,
          shift = util.by_pixel(7.75, -36),
          scale = 0.5
        },
      },
    },
    { -- i
      trunk = {
        width = 175,
        height = 111,
        shift = util.by_pixel(38.5, -9.5),
        hr_version = {
          width = 352,
          height = 221,
          shift = util.by_pixel(39, -9.25),
          scale = 0.5
        },
      },
      leaves = {
        width = 119,
        height = 110,
        shift = util.by_pixel(-1.5, -27),
        hr_version = {
          width = 238,
          height = 220,
          shift = util.by_pixel(-1, -26.5),
          scale = 0.5
        },
      },
    },
  },
  { -- tree-06
    --addHere-tree06
    { -- a
      trunk = {
        width = 178,
        height = 144,
        shift = util.by_pixel(60, -34),
        hr_version = {
          width = 356,
          height = 289,
          shift = util.by_pixel(59.5, -33.75),
          scale = 0.5
        },
      },
      leaves = {
        width = 66,
        height = 97,
        shift = util.by_pixel(19, -46.5),
        hr_version = {
          width = 133,
          height = 195,
          shift = util.by_pixel(19.25, -46.75),
          scale = 0.5
        },
      },
    },
    { -- b
      trunk = {
        width = 188,
        height = 129,
        shift = util.by_pixel(61, -23.5),
        hr_version = {
          width = 375,
          height = 258,
          shift = util.by_pixel(61.25, -23),
          scale = 0.5
        },
      },
      leaves = {
        width = 85,
        height = 92,
        shift = util.by_pixel(17.5, -37),
        hr_version = {
          width = 170,
          height = 186,
          shift = util.by_pixel(18, -37),
          scale = 0.5
        },
      },
    },
    { -- c
      trunk = {
        width = 202,
        height = 107,
        shift = util.by_pixel(52, -12.5),
        hr_version = {
          width = 403,
          height = 214,
          shift = util.by_pixel(52.25, -12.5),
          scale = 0.5
        },
      },
      leaves = {
        width = 89,
        height = 79,
        shift = util.by_pixel(11.5, -25.5),
        hr_version = {
          width = 178,
          height = 158,
          shift = util.by_pixel(11, -25.5),
          scale = 0.5
        },
      },
    },
    { -- d
      trunk = {
        width = 172,
        height = 130,
        shift = util.by_pixel(34, -17),
        hr_version = {
          width = 343,
          height = 259,
          shift = util.by_pixel(34.25, -16.75),
          scale = 0.5
        },
      },
      leaves = {
        width = 75,
        height = 90,
        shift = util.by_pixel(-6.5, -36),
        hr_version = {
          width = 150,
          height = 178,
          shift = util.by_pixel(-6.5, -36),
          scale = 0.5
        },
      },
    },
    { -- e
      trunk = {
        width = 140,
        height = 144,
        shift = util.by_pixel(18, -28),
        hr_version = {
          width = 280,
          height = 287,
          shift = util.by_pixel(18, -28.25),
          scale = 0.5
        },
      },
      leaves = {
        width = 68,
        height = 112,
        shift = util.by_pixel(-10, -44),
        hr_version = {
          width = 137,
          height = 224,
          shift = util.by_pixel(-10.25, -44.5),
          scale = 0.5
        },
      },
    },
    { -- f
      trunk = {
        width = 186,
        height = 136,
        shift = util.by_pixel(31, -36),
        hr_version = {
          width = 371,
          height = 272,
          shift = util.by_pixel(30.75, -36),
          scale = 0.5
        },
      },
      leaves = {
        width = 89,
        height = 114,
        shift = util.by_pixel(-10.5, -46),
        hr_version = {
          width = 177,
          height = 228,
          shift = util.by_pixel(-10.25, -45.5),
          scale = 0.5
        },
      },
    },
    { -- g
      trunk = {
        width = 202,
        height = 133,
        shift = util.by_pixel(43, -34.5),
        hr_version = {
          width = 402,
          height = 268,
          shift = util.by_pixel(43, -35),
          scale = 0.5
        },
      },
      leaves = {
        width = 89,
        height = 114,
        shift = util.by_pixel(-0.5, -44),
        hr_version = {
          width = 177,
          height = 228,
          shift = util.by_pixel(-0.75, -44),
          scale = 0.5
        },
      },
    },
    { -- h
      trunk = {
        width = 173,
        height = 129,
        shift = util.by_pixel(49.5, -34.5),
        hr_version = {
          width = 347,
          height = 258,
          shift = util.by_pixel(49.25, -34.5),
          scale = 0.5
        },
      },
      leaves = {
        width = 71,
        height = 95,
        shift = util.by_pixel(21.5, -43.5),
        hr_version = {
          width = 143,
          height = 190,
          shift = util.by_pixel(21.25, -43),
          scale = 0.5
        },
      },
    },
    { -- i
      trunk = {
        width = 127,
        height = 129,
        shift = util.by_pixel(12.5, -14.5),
        hr_version = {
          width = 253,
          height = 259,
          shift = util.by_pixel(12.75, -14.75),
          scale = 0.5
        },
      },
      leaves = {
        width = 65,
        height = 93,
        shift = util.by_pixel(-10.5, -33.5),
        hr_version = {
          width = 129,
          height = 185,
          shift = util.by_pixel(-10.25, -33.75),
          scale = 0.5
        },
      },
    },
    { -- j
      trunk = {
        width = 136,
        height = 126,
        shift = util.by_pixel(22, -17),
        hr_version = {
          width = 272,
          height = 253,
          shift = util.by_pixel(22, -16.75),
          scale = 0.5
        },
      },
      leaves = {
        width = 67,
        height = 92,
        shift = util.by_pixel(-6.5, -35),
        hr_version = {
          width = 133,
          height = 182,
          shift = util.by_pixel(-6.25, -35),
          scale = 0.5
        },
      },
    },
  },
  { -- tree-07
    --addHere-tree07
    { -- a
      trunk = {
        width = 181,
        height = 122,
        shift = util.by_pixel(38.5 + 24, -21),
        hr_version = {
          width = 362,
          height = 244,
          shift = util.by_pixel(39 + 24, -20.5),
          scale = 0.5
        },
      },
      leaves = {
        width = 50,
        height = 83,
        shift = util.by_pixel(-26 + 24, -42.5),
        hr_version = {
          width = 101,
          height = 164,
          shift = util.by_pixel(-26.25 + 24, -42),
          scale = 0.5
        },
      },
    },
    { -- b
      trunk = {
        width = 167,
        height = 120,
        shift = util.by_pixel(14.5 + 24, -36),
        hr_version = {
          width = 335,
          height = 239,
          shift = util.by_pixel(14.75 + 24, -35.75),
          scale = 0.5
        },
      },
      leaves = {
        width = 58,
        height = 91,
        shift = util.by_pixel(-41 + 24, -50.5),
        hr_version = {
          width = 116,
          height = 184,
          shift = util.by_pixel(-41 + 24, -50.5),
          scale = 0.5
        },
      },
    },
    { -- c
      trunk = {
        width = 167,
        height = 128,
        shift = util.by_pixel(8.5 + 24, -47),
        hr_version = {
          width = 334,
          height = 256,
          shift = util.by_pixel(9 + 24, -46.5),
          scale = 0.5
        },
      },
      leaves = {
        width = 67,
        height = 110,
        shift = util.by_pixel(-42.5 + 24, -57),
        hr_version = {
          width = 136,
          height = 220,
          shift = util.by_pixel(-42.5 + 24, -56.5),
          scale = 0.5
        },
      },
    },
    { -- d
      trunk = {
        width = 184,
        height = 158,
        shift = util.by_pixel(25 + 24, -48),
        hr_version = {
          width = 368,
          height = 314,
          shift = util.by_pixel(25.5 + 24, -47.5),
          scale = 0.5
        },
      },
      leaves = {
        width = 47,
        height = 126,
        shift = util.by_pixel(-28.5 + 24, -65),
        hr_version = {
          width = 95,
          height = 252,
          shift = util.by_pixel(-28.75 + 24, -64.5),
          scale = 0.5
        },
      },
    },
    { -- e
      trunk = {
        width = 202,
        height = 143,
        shift = util.by_pixel(48 + 24, -55.5),
        hr_version = {
          width = 405,
          height = 286,
          shift = util.by_pixel(48.25 + 24, -54.5),
          scale = 0.5
        },
      },
      leaves = {
        width = 47,
        height = 132,
        shift = util.by_pixel(-16.5 + 24, -62),
        hr_version = {
          width = 93,
          height = 264,
          shift = util.by_pixel(-16.75 + 24, -61),
          scale = 0.5
        },
      },
    },
    { -- f
      trunk = {
        width = 218,
        height = 135,
        shift = util.by_pixel(57 + 24, -49.5),
        hr_version = {
          width = 435,
          height = 270,
          shift = util.by_pixel(56.75 + 24, -49),
          scale = 0.5
        },
      },
      leaves = {
        width = 62,
        height = 119,
        shift = util.by_pixel(-3 + 24, -57.5),
        hr_version = {
          width = 126,
          height = 240,
          shift = util.by_pixel(-3 + 24, -57.5),
          scale = 0.5
        },
      },
    },
    { -- g
      trunk = {
        width = 213,
        height = 121,
        shift = util.by_pixel(55.5 + 24, -36.5),
        hr_version = {
          width = 426,
          height = 240,
          shift = util.by_pixel(55.5 + 24, -36),
          scale = 0.5
        },
      },
      leaves = {
        width = 61,
        height = 100,
        shift = util.by_pixel(-9.5 + 24, -47),
        hr_version = {
          width = 123,
          height = 199,
          shift = util.by_pixel(-9.75 + 24, -46.75),
          scale = 0.5
        },
      },
    },
    { -- h
      trunk = {
        width = 198,
        height = 121,
        shift = util.by_pixel(50 + 24, -21.5),
        hr_version = {
          width = 397,
          height = 243,
          shift = util.by_pixel(50.25 + 24, -21.25),
          scale = 0.5
        },
      },
      leaves = {
        width = 48,
        height = 85,
        shift = util.by_pixel(-20 + 24, -40.5),
        hr_version = {
          width = 94,
          height = 170,
          shift = util.by_pixel(-20 + 24, -40),
          scale = 0.5
        },
      },
    },
    { -- i
      trunk = {
        width = 169,
        height = 120,
        shift = util.by_pixel(19.5 + 24, -34),
        hr_version = {
          width = 337,
          height = 238,
          shift = util.by_pixel(19.25 + 24, -33.5),
          scale = 0.5
        },
      },
      leaves = {
        width = 55,
        height = 87,
        shift = util.by_pixel(-38.5 + 24, -49.5),
        hr_version = {
          width = 109,
          height = 177,
          shift = util.by_pixel(-38.25 + 24, -49.75),
          scale = 0.5
        },
      },
    },
  },
  { -- tree-08
    --addHere-tree08
    { -- a
      trunk = {
        width = 200,
        height = 140,
        shift = util.by_pixel(55, -34),
        hr_version = {
          width = 399,
          height = 279,
          shift = util.by_pixel(55.75, -33.75),
          scale = 0.5
        },
      },
      leaves = {
        width = 94,
        height = 70,
        shift = util.by_pixel(0, -71),
        hr_version = {
          width = 188,
          height = 141,
          shift = util.by_pixel(0.5, -70.75),
          scale = 0.5
        },
      },
    },
    { -- b
      trunk = {
        width = 213,
        height = 139,
        shift = util.by_pixel(57.5, -30.5),
        hr_version = {
          width = 426,
          height = 277,
          shift = util.by_pixel(57.5, -30.25),
          scale = 0.5
        },
      },
      leaves = {
        width = 102,
        height = 70,
        shift = util.by_pixel(2, -69),
        hr_version = {
          width = 205,
          height = 142,
          shift = util.by_pixel(2.25, -68.5),
          scale = 0.5
        },
      },
    },
    { -- c
      trunk = {
        width = 188,
        height = 136,
        shift = util.by_pixel(65, -36),
        hr_version = {
          width = 377,
          height = 271,
          shift = util.by_pixel(65.75, -35.75),
          scale = 0.5
        },
      },
      leaves = {
        width = 76,
        height = 76,
        shift = util.by_pixel(6, -68),
        hr_version = {
          width = 152,
          height = 152,
          shift = util.by_pixel(6.5, -68),
          scale = 0.5
        },
      },
    },
    { -- d
      trunk = {
        width = 212,
        height = 134,
        shift = util.by_pixel(62, -39),
        hr_version = {
          width = 424,
          height = 267,
          shift = util.by_pixel(62.5, -38.75),
          scale = 0.5
        },
      },
      leaves = {
        width = 93,
        height = 81,
        shift = util.by_pixel(-0.5, -69.5),
        hr_version = {
          width = 187,
          height = 162,
          shift = util.by_pixel(0.25, -68.5),
          scale = 0.5
        },
      },
    },
    { -- e
      trunk = {
        width = 208,
        height = 147,
        shift = util.by_pixel(55, -33.5),
        hr_version = {
          width = 416,
          height = 295,
          shift = util.by_pixel(55, -33.25),
          scale = 0.5
        },
      },
      leaves = {
        width = 95,
        height = 83,
        shift = util.by_pixel(-6.5, -70.5),
        hr_version = {
          width = 189,
          height = 166,
          shift = util.by_pixel(-5.75, -70),
          scale = 0.5
        },
      },
    },
  },
  { -- tree-09
    --addHere-tree09
    { -- a
      trunk = {
        width = 243,
        height = 170,
        shift = util.by_pixel(65.5, -37),
        hr_version = {
          width = 487,
          height = 340,
          shift = util.by_pixel(66.25, -36.5),
          scale = 0.5
        },
      },
      leaves = {
        width = 123,
        height = 102,
        shift = util.by_pixel(4.5, -73),
        hr_version = {
          width = 244,
          height = 204,
          shift = util.by_pixel(5, -72.5),
          scale = 0.5
        },
      },
    },
    { -- b
      trunk = {
        width = 208,
        height = 150,
        shift = util.by_pixel(53, -36),
        hr_version = {
          width = 415,
          height = 300,
          shift = util.by_pixel(53.25, -35.5),
          scale = 0.5
        },
      },
      leaves = {
        width = 99,
        height = 86,
        shift = util.by_pixel(-2.5, -69),
        hr_version = {
          width = 197,
          height = 172,
          shift = util.by_pixel(-2.25, -68.5),
          scale = 0.5
        },
      },
    },
    { -- c
      trunk = {
        width = 238,
        height = 167,
        shift = util.by_pixel(56, -37.5),
        hr_version = {
          width = 476,
          height = 333,
          shift = util.by_pixel(56.5, -37.25),
          scale = 0.5
        },
      },
      leaves = {
        width = 113,
        height = 95,
        shift = util.by_pixel(-8.5, -74.5),
        hr_version = {
          width = 225,
          height = 189,
          shift = util.by_pixel(-8.25, -73.75),
          scale = 0.5
        },
      },
    },
    { -- d
      trunk = {
        width = 169,
        height = 116,
        shift = util.by_pixel(45.5, -32),
        hr_version = {
          width = 338,
          height = 233,
          shift = util.by_pixel(46, -31.75),
          scale = 0.5
        },
      },
      leaves = {
        width = 90,
        height = 64,
        shift = util.by_pixel(4, -60),
        hr_version = {
          width = 179,
          height = 126,
          shift = util.by_pixel(4.75, -59.5),
          scale = 0.5
        },
      },
    },
    { -- e
      trunk = {
        width = 202,
        height = 157,
        shift = util.by_pixel(63, -38.5),
        hr_version = {
          width = 403,
          height = 315,
          shift = util.by_pixel(63.25, -38.25),
          scale = 0.5
        },
      },
      leaves = {
        width = 103,
        height = 103,
        shift = util.by_pixel(11.5, -67.5),
        hr_version = {
          width = 205,
          height = 206,
          shift = util.by_pixel(12.25, -67),
          scale = 0.5
        },
      },
    },
  }
}

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
    enabled = true,
    drawing_box = {{-0.9, -3}, {0.9, 0.6}},
    autoplace = tree_autoplace(30, 5, 0.75, 0.25),
    colors =
    {
      -- olive green, yellowish
      {r = 219, g = 200, b = 96},
      {r = 199, g = 184, b = 100},
      {r = 205, g = 191, b = 112},
      {r = 199, g = 175, b = 78},
      {r = 224, g = 206, b = 110},
      {r = 209, g = 185, b = 91},
      {r = 197, g = 201, b = 80},
      {r = 214, g = 202, b = 100}
    }
  },
  {
    -- lightish green trees
    -- changed these around so they no longer appear in the middle of deserts
    type = 2,
    enabled = true,
    drawing_box = {{-0.9, -3.9}, {0.9, 0.6}},
    autoplace = tree_autoplace(17, 7, 0.65, 0.1, -0.25),
    colors =
    {
      -- green
      {r = 81, g = 126, b = 85},
      {r = 81, g = 166, b = 89},
      {r = 101, g = 191, b = 110},
      {r = 147, g = 192, b = 39},
      {r = 162, g = 222, b = 19},
      {r = 201, g = 236, b = 116},
      {r = 179, g = 199, b = 12},
      {r = 181, g = 189, b = 114},
      {r = 179, g = 199, b = 12},
      {r = 200, g = 214, b = 83},
    }
  },

  {
    type = 3,
    enabled = true,
    drawing_box = {{-0.9, -3.7}, {0.9, 0.6}},
    autoplace = tree_autoplace(25, 5, 0.8, 0.1),
    colors =
    {
      --light-v2-green
      {r = 186, g = 191, b = 124},
      {r = 158, g = 191, b = 124},
      {r = 191, g = 178, b = 124},
      {r = 191, g = 171, b = 88},
      {r = 171, g = 171, b = 96},
      {r = 145, g = 151, b = 89},
      -- brown/yel/red
      {r = 197, g = 144, b = 136},
      {r = 235, g = 157, b = 141},
      {r = 212, g = 171, b = 89},
      {r = 176, g = 124, b = 86},
      {r = 209, g = 120, b = 102},
      {r = 209, g = 134, b = 88},
    }
  },
  {
    -- dark bluish green trees
    -- these like muddy and grassy areas
    -- might want to reduce tree noise influence a little bit still
    type = 4,
    enabled = true,
    drawing_box = {{-0.9, -3.9}, {0.9, 0.6}},
    autoplace = tree_autoplace(12, 7, 0.6, 0.2, -0.5),
    colors =
    {
      -- green
      {r = 125, g = 154, b = 84},
      {r = 109, g = 134, b = 73},
      {r = 95, g = 125, b = 51},
      {r = 96, g = 132, b = 46},
      {r = 88, g = 141, b = 71},
      {r = 115, g = 142, b = 106},
      {r = 87, g = 109, b = 81},
      {r = 88, g = 112, b = 81},
      {r = 92, g = 126, b = 82},
      {r = 91, g = 111, b = 85},
      {r = 105, g = 127, b = 99},
      {r = 89, g = 124, b = 78},
    }
  },
  {
    -- bright green tree
    -- likes moisture
    -- might want to reduce static influence more when adding other trees back in
    type = 5,
    enabled = true,
    drawing_box = {{-0.9, -3.5}, {0.9, 0.6}},
    autoplace = tree_autoplace(12, 7, 0.8, 0.2, -5/8),
    colors =
    {
      -- green L-2
      {r = 115, g = 142, b = 51},
      {r = 112, g = 144, b = 34},
      {r = 133, g = 162, b = 64},
      {r = 116, g = 138, b = 62},
      {r = 110, g = 147, b = 58},
      {r = 127, g = 147, b = 58},
      {r = 121, g = 145, b = 39},
      {r = 109, g = 130, b = 38},
      {r = 129, g = 130, b = 38},
      {r = 148, g = 149, b = 46},
      {r = 150, g = 151, b = 56},
      {r = 154, g = 155, b = 69},
      {r = 156, g = 157, b = 65},
    }
  },

  {
    type = 9,
    enabled = true,
    drawing_box = {{-0.9, -3.5}, {0.9, 0.6}},
    autoplace = merge{
      tree_autoplace(30, 5, 0.45, 0.05, 0.21),
      { max_probability = 0.5 * 0.5 },
    },
    colors =
    {
       --DARK-green L-2
      {r = 105, g = 121, b = 92},
      {r = 109, g = 146, b = 80},
      {r = 124, g = 138, b = 57},
      {r = 138, g = 128, b = 62},
      {r = 122, g = 108, b = 51},
      {r = 148, g = 126, b = 67},
    }
  }
}

-- desert edge trees?
define_trees{
  -- multicolored pastel trees
  -- small clumps in the desert
  {
    type = 2,
    enabled = true,
    identifier = "red",
    drawing_box = {{-0.9, -3.9}, {0.9, 0.6}},
    autoplace = merge{
      tree_autoplace(17, 7, 0.45, 0.05, -0.25),
      sharpness = 0.2
    },
    colors =
    {
      --tutti-colori
      --yels
      {r = 239, g = 218, b = 43},
      {r = 232, g = 216, b = 85},
      {r = 242, g = 224, b = 28},
      {r = 217, g = 210, b = 29},
      {r = 252, g = 182, b = 72},
      {r = 196, g = 113, b = 76},
      {r = 213, g = 111, b = 66},
      --reds
      {r = 197, g = 73, b = 73},
      {r = 229, g = 92, b = 78},
      {r = 204, g = 86, b = 83},
      {r = 224, g = 82, b = 63},
      {r = 231, g = 94, b = 75},
      --grins
      {r = 175, g = 227, b = 85},
      {r = 182, g = 219, b = 119},
      {r = 152, g = 192, b = 81},
      {r = 173, g = 211, b = 113}
    }
  },

  {
    type = 7,
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
      {r = 205, g = 186, b = 81},
    }
  },
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
      -- green
      {r = 122, g = 113, b = 52},
      {r = 143, g = 135, b = 78},
      {r = 147, g = 138, b = 78},
      {r = 132, g = 120, b = 39},
      {r = 177, g = 135, b = 55},
      {r = 186, g = 148, b = 74},
      {r = 205, g = 159, b = 70},
      {r = 245, g = 169, b = 79},
      {r = 157, g = 108, b = 56},
      {r = 152, g = 97, b = 56},
      {r = 154, g = 95, b = 75}
    }
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
      {r = 253, g = 155, b = 0},
    }
  }
}

define_trees{
  {
    type = 9,
    enabled = true,
    identifier = "brown",
    drawing_box = {{-0.9, -3}, {0.9, 0.6}},
    autoplace = merge{
      tree_autoplace(25, 10, 0.20, 0.05, -1/2, 1+1/4),
      { max_probability = 0.35 * 0.5 }
    },
    colors =
    {
      -- greenish / brownish/ reddish -light- for desert
      {r = 194, g = 162, b = 76},
      {r = 219, g = 179, b = 70},
      {r = 178, g = 156, b = 95},
      {r = 194, g = 164, b = 84},
      {r = 159, g = 133, b = 62},
      {r = 177, g = 140, b = 87},
      {r = 217, g = 129, b = 99},
    }
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
      --red - for green-grass
      {r = 196, g = 91, b = 91},
      {r = 207, g = 95, b = 95},
      {r = 250, g = 108, b = 108},
      {r = 222, g = 100, b = 100},
      {r = 223, g = 110, b = 84},
      {r = 234, g = 107, b = 78},
      {r = 217, g = 131, b = 111},
    }
  },

  -- Desert trees
  {
    type = 8,
    enabled = true,
    drawing_box = {{-0.9, -3}, {0.9, 0.6}},
    autoplace = merge{
      tree_autoplace(20, 5, 0.10, 0.10, -1),
      {
        sharpness = 0.4,
        max_probability = 0.35,
      }
    },
    colors =
    {
      --green-yellow-for-desert
    {r = 216, g = 234, b = 153},
    {r = 203, g = 229, b = 113},
    {r = 195, g = 228, b = 82},
    {r = 241, g = 247, b = 150},
    {r = 251, g = 249, b = 88},
    {r = 237, g = 232, b = 109},
    {r = 219, g = 251, b = 120},
    -- orange / brownish-light
    {r = 225, g = 197, b = 131},
    {r = 220, g = 189, b = 116},
    {r = 246, g = 189, b = 122},
    {r = 237, g = 153, b = 98},
    --reddish
    {r = 205, g = 89, b = 12},
    {r = 251, g = 120, b = 120},
    {r = 250, g = 115, b = 115},
    {r = 213, g = 116, b = 121},
    }
  },
  {
    type = 8,
    enabled = true,
    identifier = "brown",
    drawing_box = {{-0.9, -3}, {0.9, 0.6}},
    autoplace = merge{
      tree_autoplace(20, 5, 0.10, 0.10, -0.999), --this makes much more brown trees
      {
        sharpness = 0.4,
        max_probability = 0.35,
      }
    },
    colors =
    {
      -- orange / brownish-light
      {r = 225, g = 197, b = 131},
      {r = 220, g = 189, b = 116},
      {r = 246, g = 189, b = 122},
      {r = 237, g = 153, b = 98},
    }
  },
  -- Even more desert tree
  {
    type = 8,
    enabled = true,
    identifier = "red",
    drawing_box = {{-0.9, -3}, {0.9, 0.6}},
    autoplace = tree_autoplace(-5, 5, 0.05, 0.05, -5),
    colors =
    {
      --reddish
      {r = 205, g = 89, b = 12},
      {r = 251, g = 120, b = 120},
      {r = 250, g = 115, b = 115},
      {r = 213, g = 116, b = 121},
    }
  },
}

local function index_to_letter(index, starting_at)
  return string.char(string.byte(starting_at or "a", 1) - 1 + index)
end

for i, tree_data in ipairs(tree_data) do if tree_data.enabled then
  local type_number = string.format("%02d", tree_data.type)
  local type_name = "tree-" .. type_number
  local name = type_name
  if tree_data.identifier then
    name = name .. "-" .. tree_data.identifier
  end
  local order = index_to_letter(i) .. "[" .. name .. "]"

  local tree_variations = {}
  for variation_index, variation in ipairs(tree_types[tree_data.type]) do
    local variation_letter = index_to_letter(variation_index)
    local variation_path = type_number .. "/" .. type_name .. "-" .. variation_letter
    local hr_variation_path = type_number .. "/hr-" .. type_name .. "-" .. variation_letter

    local newTree = {
      trunk =
      {
        filename = "__base__/graphics/entity/tree/" .. variation_path .. "-trunk.png",
        flags = { "mipmap" },
        width = variation.trunk.width,
        height =  variation.trunk.height,
        frame_count = 4,
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
        entity_name = "leaf-particle",
        offset_deviation = {{-0.5, -0.5}, {0.5, 0.5}},
        initial_height = 2,
        initial_height_deviation = 1,
        speed_from_center = 0.01
      },
      branch_generation =
      {
        type = "create-particle",
        entity_name = "branch-particle",
        offset_deviation = {{-0.5, -0.5}, {0.5, 0.5}},
        initial_height = 2,
        initial_height_deviation = 2,
        speed_from_center = 0.01,
        frame_speed = 0.1,
        repeat_count = 15
      }
    }
    if newTree.trunk.hr_version then
      newTree.trunk.hr_version.filename = "__base__/graphics/entity/tree/" .. hr_variation_path .. "-trunk.png"
      newTree.trunk.hr_version.frame_count = 4
      newTree.trunk.hr_version.flags = { "mipmap" }
    end
    if newTree.leaves.hr_version then
      newTree.leaves.hr_version.filename = "__base__/graphics/entity/tree/" .. hr_variation_path .. "-leaves.png"
      newTree.leaves.hr_version.frame_count = 3
      newTree.leaves.hr_version.flags = { "mipmap" }
    end
    tree_variations[#tree_variations + 1] = newTree
  end

  data:extend(
  {
    {
      type = "tree",
      name = name,
      icon = "__base__/graphics/icons/" .. type_name .. ".png",
      icon_size = 32,
      flags = {"placeable-neutral", "placeable-off-grid", "breaths-air"},
      minable =
      {
        mining_particle = "wooden-particle",
        mining_time = 2,
        result = "raw-wood",
        count = 4
      },
      corpse = type_name .. "-stump",
      remains_when_mined = type_name .. "-stump",
      emissions_per_tick = -0.001,
      max_health = 50,
      collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
      selection_box = {{-0.9, -2.2}, {0.9, 0.6}},
      drawing_box = tree_data.drawing_box,
      subgroup = "trees",
      order = "a[tree]-a[regular]-" .. order,
      vehicle_impact_sound =  { filename = "__base__/sound/car-wood-impact.ogg", volume = 1.0 },
      autoplace = tree_data.autoplace,
      variations = tree_variations,
      colors = tree_data.colors,
      darkness_of_burnt_tree = 0.5,
    }
  })
end end

for i, type_data in ipairs(tree_types) do
  local type_number = string.format("%02d", i)
  local type_name = "tree-" .. type_number
  local order = index_to_letter(i) .. "[" .. type_name .. "]"

  local stump_variations = {}
  for variation_index, variation in ipairs(type_data) do
    local variation_letter = index_to_letter(variation_index)
    local variation_path = type_number .. "/" .. type_name .. "-" .. variation_letter
    local hr_variation_path = type_number .. "/hr-" .. type_name .. "-" .. variation_letter
    local newStump = {
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
      newStump.hr_version.flags = { "mipmap" }
    end
    stump_variations[#stump_variations + 1] = newStump
  end

  data:extend(
  {
    {
      type = "corpse",
      name = type_name .. "-stump",
      icon = "__base__/graphics/icons/" .. type_name .. "-stump.png",
      icon_size = 32,
      flags = {"placeable-neutral", "not-on-map"},
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
    icon_size = 32,
    flags = {"placeable-neutral", "placeable-off-grid", "breaths-air"},
    minable =
    {
      count = 4,
      mining_particle = "wooden-particle",
      mining_time = 1,
      result = "raw-wood"
    },
    emissions_per_tick = -0.0001,
    max_health = 20,
    collision_box = {{-0.4, -0.8}, {0.4, 0.2}},
    selection_box = {{-0.6, -1.5}, {0.6, 0.3}},
    drawing_box = {{-0.6, -1.8}, {0.6, 0.3}},
    subgroup = "trees",
    order = "a[tree]-c[dry-tree]",
    vehicle_impact_sound =  { filename = "__base__/sound/car-wood-impact.ogg", volume = 1.0 },
    autoplace = dead_trees_autoplace(0.5),
    pictures =
    {
      --dry-tree
      {
        filename = "__base__/graphics/entity/tree/dry-tree/dry-tree-00.png",
        width = 54,
        height = 49,
        shift = util.by_pixel(15, -15.5),
        hr_version = {
          filename = "__base__/graphics/entity/tree/dry-tree/hr-dry-tree-00.png",
          width = 184,
          height = 122,
          shift = util.by_pixel(13, -15),
          scale = 0.5
        },
      },
      {
        filename = "__base__/graphics/entity/tree/dry-tree/dry-tree-01.png",
        width = 52,
        height = 53,
        shift = util.by_pixel(14, -18.5),
        hr_version = {
          filename = "__base__/graphics/entity/tree/dry-tree/hr-dry-tree-01.png",
          width = 142,
          height = 122,
          shift = util.by_pixel(23.5, -15),
          scale = 0.5
        },
      },
      {
        filename = "__base__/graphics/entity/tree/dry-tree/dry-tree-02.png",
        width = 63,
        height = 52,
        shift = util.by_pixel(20.5, -16),
        hr_version = {
          filename = "__base__/graphics/entity/tree/dry-tree/hr-dry-tree-02.png",
          width = 140,
          height = 115,
          shift = util.by_pixel(24, -13.25),
          scale = 0.5
        },
      },
      {
        filename = "__base__/graphics/entity/tree/dry-tree/dry-tree-03.png",
        width = 58,
        height = 47,
        shift = util.by_pixel(12, -11.5),
        hr_version = {
          filename = "__base__/graphics/entity/tree/dry-tree/hr-dry-tree-03.png",
          width = 151,
          height = 101,
          shift = util.by_pixel(21.25, -9.75),
          scale = 0.5
        },
      },
      {
        filename = "__base__/graphics/entity/tree/dry-tree/dry-tree-04.png",
        width = 49,
        height = 50,
        shift = util.by_pixel(9.5, -14),
        hr_version = {
          filename = "__base__/graphics/entity/tree/dry-tree/hr-dry-tree-04.png",
          width = 149,
          height = 109,
          shift = util.by_pixel(21.75, -11.75),
          scale = 0.5
        },
      },
      {
        filename = "__base__/graphics/entity/tree/dry-tree/dry-tree-05.png",
        width = 56,
        height = 52,
        shift = util.by_pixel(14, -16),
        hr_version = {
          filename = "__base__/graphics/entity/tree/dry-tree/hr-dry-tree-05.png",
          width = 146,
          height = 116,
          shift = util.by_pixel(22.5, -13.5),
          scale = 0.5
        },
      },
      {
        filename = "__base__/graphics/entity/tree/dry-tree/dry-tree-06.png",
        width = 59,
        height = 60,
        shift = util.by_pixel(17.5, -22),
        hr_version = {
          filename = "__base__/graphics/entity/tree/dry-tree/hr-dry-tree-06.png",
          width = 141,
          height = 135,
          shift = util.by_pixel(23.75, -18.25),
          scale = 0.5
        },
      },
      {
        filename = "__base__/graphics/entity/tree/dry-tree/dry-tree-07.png",
        width = 63,
        height = 47,
        shift = util.by_pixel(7.5, -14.5),
        hr_version = {
          filename = "__base__/graphics/entity/tree/dry-tree/hr-dry-tree-07.png",
          width = 166,
          height = 107,
          shift = util.by_pixel(17.5, -11.25),
          scale = 0.5
        },
      },
      {
        filename = "__base__/graphics/entity/tree/dry-tree/dry-tree-08.png",
        width = 54,
        height = 53,
        shift = util.by_pixel(17, -10.5),
        hr_version = {
          filename = "__base__/graphics/entity/tree/dry-tree/hr-dry-tree-08.png",
          width = 138,
          height = 106,
          shift = util.by_pixel(24.5, -10),
          scale = 0.5
        },
      },
    }
  },
  ----------------------------------------------------------------------------------------DEAD-TREE-DESERT
  {
    type = "tree",
    name = "dead-tree-desert",
    icon = "__base__/graphics/icons/dead-tree.png",
    icon_size = 32,
    flags = {"placeable-neutral", "placeable-off-grid", "breaths-air"},
    minable =
    {
      mining_particle = "wooden-particle",
      mining_time = 1,
      result = "raw-wood",
      count = 2
    },
    emissions_per_tick = -0.0001,
    max_health = 20,
    collision_box = {{-0.6, -0.6}, {0.6, 0.6}},
    selection_box = {{-0.8, -0.8}, {0.8, 0.8}},
    subgroup = "trees",
    order = "a[tree]-b[dead-tree]",
    vehicle_impact_sound =  { filename = "__base__/sound/car-wood-impact.ogg", volume = 1.0 },
    autoplace = dead_trees_autoplace(0.5),
    pictures =
    {
      --dead-desert
      {
        filename = "__base__/graphics/entity/tree/dead-tree-desert/dead-tree-desert-00.png",
        width = 199,
        height = 126,
        shift = util.by_pixel(66.5, -32),
        hr_version = {
          filename = "__base__/graphics/entity/tree/dead-tree-desert/hr-dead-tree-desert-00.png",
          width = 398,
          height = 250,
          shift = util.by_pixel(66.5, -32),
          scale = 0.5
        },
      },
      {
        filename = "__base__/graphics/entity/tree/dead-tree-desert/dead-tree-desert-01.png",
        width = 200,
        height = 125,
        shift = util.by_pixel(64, -36.5),
        hr_version = {
          filename = "__base__/graphics/entity/tree/dead-tree-desert/hr-dead-tree-desert-01.png",
          width = 399,
          height = 249,
          shift = util.by_pixel(64.25, -36.75),
          scale = 0.5
        },
      },
      {
        filename = "__base__/graphics/entity/tree/dead-tree-desert/dead-tree-desert-02.png",
        width = 198,
        height = 126,
        shift = util.by_pixel(29, -43),
        hr_version = {
          filename = "__base__/graphics/entity/tree/dead-tree-desert/hr-dead-tree-desert-02.png",
          width = 398,
          height = 250,
          shift = util.by_pixel(29.5, -43),
          scale = 0.5
        },
      },
      {
        filename = "__base__/graphics/entity/tree/dead-tree-desert/dead-tree-desert-03.png",
        width = 199,
        height = 125,
        shift = util.by_pixel(25.5, -30.5),
        hr_version = {
          filename = "__base__/graphics/entity/tree/dead-tree-desert/hr-dead-tree-desert-03.png",
          width = 399,
          height = 249,
          shift = util.by_pixel(25.75, -30.75),
          scale = 0.5
        },
      },
      {
        filename = "__base__/graphics/entity/tree/dead-tree-desert/dead-tree-desert-04.png",
        width = 199,
        height = 125,
        shift = util.by_pixel(38.5, -22.5),
        hr_version = {
          filename = "__base__/graphics/entity/tree/dead-tree-desert/hr-dead-tree-desert-04.png",
          width = 398,
          height = 249,
          shift = util.by_pixel(38.5, -22.25),
          scale = 0.5
        },
      },
      {
        filename = "__base__/graphics/entity/tree/dead-tree-desert/dead-tree-desert-05.png",
        width = 199,
        height = 126,
        shift = util.by_pixel(64.5, -23),
        hr_version = {
          filename = "__base__/graphics/entity/tree/dead-tree-desert/hr-dead-tree-desert-05.png",
          width = 398,
          height = 250,
          shift = util.by_pixel(64.5, -23),
          scale = 0.5
        },
      },
      {
        filename = "__base__/graphics/entity/tree/dead-tree-desert/dead-tree-desert-06.png",
        width = 199,
        height = 125,
        shift = util.by_pixel(28.5, -14.5),
        hr_version = {
          filename = "__base__/graphics/entity/tree/dead-tree-desert/hr-dead-tree-desert-06.png",
          width = 398,
          height = 249,
          shift = util.by_pixel(28.5, -14.75),
          scale = 0.5
        },
      },
      {
        filename = "__base__/graphics/entity/tree/dead-tree-desert/dead-tree-desert-07.png",
        width = 199,
        height = 125,
        shift = util.by_pixel(50.5, -40.5),
        hr_version = {
          filename = "__base__/graphics/entity/tree/dead-tree-desert/hr-dead-tree-desert-07.png",
          width = 398,
          height = 249,
          shift = util.by_pixel(50.5, -40.75),
          scale = 0.5
        },
      },
      {
        filename = "__base__/graphics/entity/tree/dead-tree-desert/dead-tree-desert-08.png",
        width = 200,
        height = 125,
        shift = util.by_pixel(18, -43.5),
        hr_version = {
          filename = "__base__/graphics/entity/tree/dead-tree-desert/hr-dead-tree-desert-08.png",
          width = 398,
          height = 249,
          shift = util.by_pixel(18, -43.75),
          scale = 0.5
        },
      },
      {
        filename = "__base__/graphics/entity/tree/dead-tree-desert/dead-tree-desert-09.png",
        width = 199,
        height = 125,
        shift = util.by_pixel(40.5, -16.5),
        hr_version = {
          filename = "__base__/graphics/entity/tree/dead-tree-desert/hr-dead-tree-desert-09.png",
          width = 399,
          height = 249,
          shift = util.by_pixel(41.25, -16.75),
          scale = 0.5
        },
      },
    }
  },
  --------------------------------------------------------------------------------------------------------
  {
    type = "tree",
    name = "dead-grey-trunk",
    icon = "__base__/graphics/icons/dead-grey-trunk.png",
    icon_size = 32,
    flags = {"placeable-neutral", "placeable-off-grid", "breaths-air"},
    minable =
    {
      mining_particle = "wooden-particle",
      mining_time = 1,
      result = "raw-wood",
      count = 2
    },
    emissions_per_tick = -0.0001,
    max_health = 20,
    collision_box = {{-0.6, -0.6}, {0.6, 0.6}},
    selection_box = {{-0.8, -0.8}, {0.8, 0.8}},
    subgroup = "trees",
    order = "a[tree]-b[dead-tree]",
    vehicle_impact_sound =  { filename = "__base__/sound/car-wood-impact.ogg", volume = 1.0 },
    autoplace = dead_trees_autoplace(1),
    pictures =
    {
      --dead-grey-trunk
      {
        filename = "__base__/graphics/entity/tree/dead-grey-trunk/dead-grey-trunk-00.png",
        width = 109,
        height = 88,
        shift = util.by_pixel(29.5, -25),
        hr_version = {
          filename = "__base__/graphics/entity/tree/dead-grey-trunk/hr-dead-grey-trunk-00.png",
          width = 217,
          height = 178,
          shift = util.by_pixel(29.75, -25),
          scale = 0.5
        },
      },
      {
        filename = "__base__/graphics/entity/tree/dead-grey-trunk/dead-grey-trunk-01.png",
        width = 102,
        height = 91,
        shift = util.by_pixel(27, -24.5),
        hr_version = {
          filename = "__base__/graphics/entity/tree/dead-grey-trunk/hr-dead-grey-trunk-01.png",
          width = 205,
          height = 185,
          shift = util.by_pixel(26.75, -24.25),
          scale = 0.5
        },
      },
      {
        filename = "__base__/graphics/entity/tree/dead-grey-trunk/dead-grey-trunk-02.png",
        width = 111,
        height = 89,
        shift = util.by_pixel(29.5, -24.5),
        hr_version = {
          filename = "__base__/graphics/entity/tree/dead-grey-trunk/hr-dead-grey-trunk-02.png",
          width = 221,
          height = 179,
          shift = util.by_pixel(29.25, -24.25),
          scale = 0.5
        },
      },
      {
        filename = "__base__/graphics/entity/tree/dead-grey-trunk/dead-grey-trunk-03.png",
        width = 106,
        height = 83,
        shift = util.by_pixel(29, -20.5),
        hr_version = {
          filename = "__base__/graphics/entity/tree/dead-grey-trunk/hr-dead-grey-trunk-03.png",
          width = 210,
          height = 167,
          shift = util.by_pixel(29, -19.75),
          scale = 0.5
        },
      },
      {
        filename = "__base__/graphics/entity/tree/dead-grey-trunk/dead-grey-trunk-04.png",
        width = 128,
        height = 93,
        shift = util.by_pixel(33, -20.5),
        hr_version = {
          filename = "__base__/graphics/entity/tree/dead-grey-trunk/hr-dead-grey-trunk-04.png",
          width = 257,
          height = 185,
          shift = util.by_pixel(32.75, -20.75),
          scale = 0.5
        },
      },
      {
        filename = "__base__/graphics/entity/tree/dead-grey-trunk/dead-grey-trunk-05.png",
        width = 114,
        height = 83,
        shift = util.by_pixel(16, -3.5),
        hr_version = {
          filename = "__base__/graphics/entity/tree/dead-grey-trunk/hr-dead-grey-trunk-05.png",
          width = 226,
          height = 166,
          shift = util.by_pixel(16, -3.5),
          scale = 0.5
        },
      },
      {
        filename = "__base__/graphics/entity/tree/dead-grey-trunk/dead-grey-trunk-06.png",
        width = 113,
        height = 58,
        shift = util.by_pixel(3.5, 1),
        hr_version = {
          filename = "__base__/graphics/entity/tree/dead-grey-trunk/hr-dead-grey-trunk-06.png",
          width = 226,
          height = 117,
          shift = util.by_pixel(3, 1.25),
          scale = 0.5
        },
      },
      {
        filename = "__base__/graphics/entity/tree/dead-grey-trunk/dead-grey-trunk-07.png",
        width = 108,
        height = 83,
        shift = util.by_pixel(3, -1.5),
        hr_version = {
          filename = "__base__/graphics/entity/tree/dead-grey-trunk/hr-dead-grey-trunk-07.png",
          width = 215,
          height = 165,
          shift = util.by_pixel(2.75, -1.25),
          scale = 0.5
        },
      },
      {
        filename = "__base__/graphics/entity/tree/dead-grey-trunk/dead-grey-trunk-08.png",
        width = 104,
        height = 88,
        shift = util.by_pixel(7, -11),
        hr_version = {
          filename = "__base__/graphics/entity/tree/dead-grey-trunk/hr-dead-grey-trunk-08.png",
          width = 207,
          height = 176,
          shift = util.by_pixel(7.25, -11),
          scale = 0.5
        },
      },
      {
        filename = "__base__/graphics/entity/tree/dead-grey-trunk/dead-grey-trunk-09.png",
        width = 116,
        height = 60,
        shift = util.by_pixel(-5, -3),
        hr_version = {
          filename = "__base__/graphics/entity/tree/dead-grey-trunk/hr-dead-grey-trunk-09.png",
          width = 231,
          height = 120,
          shift = util.by_pixel(-4.75, -3),
          scale = 0.5
        },
      },
    }
  },

  {
    type = "tree",
    name = "dead-dry-hairy-tree",
    icon = "__base__/graphics/icons/dead-dry-hairy-tree.png",
    icon_size = 32,
    flags = {"placeable-neutral", "placeable-off-grid", "breaths-air"},
    minable =
    {
      mining_particle = "wooden-particle",
      mining_time = 1,
      result = "raw-wood",
      count = 2
    },
    emissions_per_tick = -0.0001,
    max_health = 20,
    collision_box = {{-0.6, -0.6}, {0.6, 0.6}},
    selection_box = {{-0.8, -0.8}, {0.8, 0.8}},
    subgroup = "trees",
    order = "a[tree]-b[dead-tree]",
    vehicle_impact_sound =  { filename = "__base__/sound/car-wood-impact.ogg", volume = 1.0 },
    autoplace = dead_trees_autoplace(0.5),
    pictures =
    {
      --dead-dry-hairy
      {
        filename = "__base__/graphics/entity/tree/dead-dry-hairy-tree/dead-dry-hairy-tree-00.png",
        width = 195,
        height = 95,
        shift = util.by_pixel(11.5, -5.5),
        hr_version = {
          filename = "__base__/graphics/entity/tree/dead-dry-hairy-tree/hr-dead-dry-hairy-tree-00.png",
          width = 388,
          height = 189,
          shift = util.by_pixel(11.5, -5.25),
          scale = 0.5
        },
      },
      {
        filename = "__base__/graphics/entity/tree/dead-dry-hairy-tree/dead-dry-hairy-tree-01.png",
        width = 186,
        height = 151,
        shift = util.by_pixel(7, -9.5),
        hr_version = {
          filename = "__base__/graphics/entity/tree/dead-dry-hairy-tree/hr-dead-dry-hairy-tree-01.png",
          width = 371,
          height = 301,
          shift = util.by_pixel(6.75, -9.75),
          scale = 0.5
        },
      },
      {
        filename = "__base__/graphics/entity/tree/dead-dry-hairy-tree/dead-dry-hairy-tree-02.png",
        width = 163,
        height = 125,
        shift = util.by_pixel(7.5, -9.5),
        hr_version = {
          filename = "__base__/graphics/entity/tree/dead-dry-hairy-tree/hr-dead-dry-hairy-tree-02.png",
          width = 324,
          height = 252,
          shift = util.by_pixel(7.5, -9.5),
          scale = 0.5
        },
      },
      {
        filename = "__base__/graphics/entity/tree/dead-dry-hairy-tree/dead-dry-hairy-tree-03.png",
        width = 179,
        height = 155,
        shift = util.by_pixel(37.5, -10.5),
        hr_version = {
          filename = "__base__/graphics/entity/tree/dead-dry-hairy-tree/hr-dead-dry-hairy-tree-03.png",
          width = 358,
          height = 310,
          shift = util.by_pixel(37.5, -10.5),
          scale = 0.5
        },
      },
      {
        filename = "__base__/graphics/entity/tree/dead-dry-hairy-tree/dead-dry-hairy-tree-04.png",
        width = 193,
        height = 158,
        shift = util.by_pixel(29.5, -9),
        hr_version = {
          filename = "__base__/graphics/entity/tree/dead-dry-hairy-tree/hr-dead-dry-hairy-tree-04.png",
          width = 386,
          height = 316,
          shift = util.by_pixel(29.5, -9),
          scale = 0.5
        },
      },
      {
        filename = "__base__/graphics/entity/tree/dead-dry-hairy-tree/dead-dry-hairy-tree-05.png",
        width = 212,
        height = 143,
        shift = util.by_pixel(18, -13.5),
        hr_version = {
          filename = "__base__/graphics/entity/tree/dead-dry-hairy-tree/hr-dead-dry-hairy-tree-05.png",
          width = 425,
          height = 285,
          shift = util.by_pixel(17.25, -13.25),
          scale = 0.5
        },
      },
      {
        filename = "__base__/graphics/entity/tree/dead-dry-hairy-tree/dead-dry-hairy-tree-06.png",
        width = 212,
        height = 147,
        shift = util.by_pixel(17, -14.5),
        hr_version = {
          filename = "__base__/graphics/entity/tree/dead-dry-hairy-tree/hr-dead-dry-hairy-tree-06.png",
          width = 424,
          height = 294,
          shift = util.by_pixel(17, -14.5),
          scale = 0.5
        },
      },
      {
        filename = "__base__/graphics/entity/tree/dead-dry-hairy-tree/dead-dry-hairy-tree-07.png",
        width = 193,
        height = 111,
        shift = util.by_pixel(9.5, -19.5),
        hr_version = {
          filename = "__base__/graphics/entity/tree/dead-dry-hairy-tree/hr-dead-dry-hairy-tree-07.png",
          width = 385,
          height = 224,
          shift = util.by_pixel(9.25, -19.5),
          scale = 0.5
        },
      },
      {
        filename = "__base__/graphics/entity/tree/dead-dry-hairy-tree/dead-dry-hairy-tree-08.png",
        width = 171,
        height = 83,
        shift = util.by_pixel(-0.5, -0.5),
        hr_version = {
          filename = "__base__/graphics/entity/tree/dead-dry-hairy-tree/hr-dead-dry-hairy-tree-08.png",
          width = 341,
          height = 166,
          shift = util.by_pixel(-0.75, -0.5),
          scale = 0.5
        },
      },
      {
        filename = "__base__/graphics/entity/tree/dead-dry-hairy-tree/dead-dry-hairy-tree-09.png",
        width = 154,
        height = 137,
        shift = util.by_pixel(19, -8.5),
        hr_version = {
          filename = "__base__/graphics/entity/tree/dead-dry-hairy-tree/hr-dead-dry-hairy-tree-09.png",
          width = 309,
          height = 274,
          shift = util.by_pixel(18.75, -8.5),
          scale = 0.5
        },
      },
      {
        filename = "__base__/graphics/entity/tree/dead-dry-hairy-tree/dead-dry-hairy-tree-10.png",
        width = 159,
        height = 123,
        shift = util.by_pixel(7.5, -8.5),
        hr_version = {
          filename = "__base__/graphics/entity/tree/dead-dry-hairy-tree/hr-dead-dry-hairy-tree-10.png",
          width = 317,
          height = 246,
          shift = util.by_pixel(7.25, -8.5),
          scale = 0.5
        },
      },
      {
        filename = "__base__/graphics/entity/tree/dead-dry-hairy-tree/dead-dry-hairy-tree-11.png",
        width = 167,
        height = 120,
        shift = util.by_pixel(9.5, -8),
        hr_version = {
          filename = "__base__/graphics/entity/tree/dead-dry-hairy-tree/hr-dead-dry-hairy-tree-11.png",
          width = 335,
          height = 238,
          shift = util.by_pixel(9.25, -8),
          scale = 0.5
        },
      },
    }
  },
  {
    type = "tree",
    name = "dry-hairy-tree",
    icon = "__base__/graphics/icons/dry-hairy-tree.png",
    icon_size = 32,
    flags = {"placeable-neutral", "placeable-off-grid", "breaths-air"},
    minable =
    {
      mining_particle = "wooden-particle",
      mining_time = 1,
      result = "raw-wood",
      count = 2
    },
    emissions_per_tick = -0.0001,
    max_health = 20,
    collision_box = {{-0.6, -0.6}, {0.6, 0.6}},
    selection_box = {{-0.8, -0.8}, {0.8, 0.8}},
    subgroup = "trees",
    order = "a[tree]-b[dead-tree]",
    vehicle_impact_sound =  { filename = "__base__/sound/car-wood-impact.ogg", volume = 1.0 },
    autoplace = dead_trees_autoplace(0.5),
    pictures =
    {
      --dry-hairy-tree
      {
        filename = "__base__/graphics/entity/tree/dry-hairy-tree/dry-hairy-tree-00.png",
        width = 252,
        height = 160,
        shift = util.by_pixel(40, -42),
        hr_version = {
          filename = "__base__/graphics/entity/tree/dry-hairy-tree/hr-dry-hairy-tree-00.png",
          width = 505,
          height = 318,
          shift = util.by_pixel(40.25, -42),
          scale = 0.5
        },
      },
      {
        filename = "__base__/graphics/entity/tree/dry-hairy-tree/dry-hairy-tree-01.png",
        width = 244,
        height = 160,
        shift = util.by_pixel(54, -32),
        hr_version = {
          filename = "__base__/graphics/entity/tree/dry-hairy-tree/hr-dry-hairy-tree-01.png",
          width = 488,
          height = 319,
          shift = util.by_pixel(54, -31.75),
          scale = 0.5
        },
      },
      {
        filename = "__base__/graphics/entity/tree/dry-hairy-tree/dry-hairy-tree-02.png",
        width = 222,
        height = 179,
        shift = util.by_pixel(45, -29.5),
        hr_version = {
          filename = "__base__/graphics/entity/tree/dry-hairy-tree/hr-dry-hairy-tree-02.png",
          width = 445,
          height = 358,
          shift = util.by_pixel(45.25, -29),
          scale = 0.5
        },
      },
      {
        filename = "__base__/graphics/entity/tree/dry-hairy-tree/dry-hairy-tree-03.png",
        width = 223,
        height = 134,
        shift = util.by_pixel(61.5, -31),
        hr_version = {
          filename = "__base__/graphics/entity/tree/dry-hairy-tree/hr-dry-hairy-tree-03.png",
          width = 461,
          height = 269,
          shift = util.by_pixel(57.75, -30.75),
          scale = 0.5
        },
      },
      {
        filename = "__base__/graphics/entity/tree/dry-hairy-tree/dry-hairy-tree-04.png",
        width = 227,
        height = 197,
        shift = util.by_pixel(22.5, -31.5),
        hr_version = {
          filename = "__base__/graphics/entity/tree/dry-hairy-tree/hr-dry-hairy-tree-04.png",
          width = 453,
          height = 396,
          shift = util.by_pixel(22.75, -31.5),
          scale = 0.5
        },
      },
      {
        filename = "__base__/graphics/entity/tree/dry-hairy-tree/dry-hairy-tree-05.png",
        width = 270,
        height = 161,
        shift = util.by_pixel(52, -43.5),
        hr_version = {
          filename = "__base__/graphics/entity/tree/dry-hairy-tree/hr-dry-hairy-tree-05.png",
          width = 542,
          height = 321,
          shift = util.by_pixel(52, -43.75),
          scale = 0.5
        },
      },
      {
        filename = "__base__/graphics/entity/tree/dry-hairy-tree/dry-hairy-tree-06.png",
        width = 176,
        height = 156,
        shift = util.by_pixel(30, -24),
        hr_version = {
          filename = "__base__/graphics/entity/tree/dry-hairy-tree/hr-dry-hairy-tree-06.png",
          width = 352,
          height = 311,
          shift = util.by_pixel(30, -24.25),
          scale = 0.5
        },
      },
      {
        filename = "__base__/graphics/entity/tree/dry-hairy-tree/dry-hairy-tree-07.png",
        width = 212,
        height = 138,
        shift = util.by_pixel(50, -52),
        hr_version = {
          filename = "__base__/graphics/entity/tree/dry-hairy-tree/hr-dry-hairy-tree-07.png",
          width = 427,
          height = 274,
          shift = util.by_pixel(49.25, -52),
          scale = 0.5
        },
      },
      {
        filename = "__base__/graphics/entity/tree/dry-hairy-tree/dry-hairy-tree-08.png",
        width = 232,
        height = 120,
        shift = util.by_pixel(63, -20),
        hr_version = {
          filename = "__base__/graphics/entity/tree/dry-hairy-tree/hr-dry-hairy-tree-08.png",
          width = 472,
          height = 241,
          shift = util.by_pixel(60.5, -19.75),
          scale = 0.5
        },
      },
    }
  }
})
