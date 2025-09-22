local util = require('util')
local merge = util.merge
local sounds = require("prototypes.entity.sounds")
local simulations = require("__base__.prototypes.factoriopedia-simulations")

local tree_emissions = { pollution = -0.001 }
local dead_tree_emissions = { pollution = -0.0001 }

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

local tree_types =
{
  { -- tree-01
    { -- a
      trunk =
      {
        width = 140,
        height = 340,
        shift = util.by_pixel(2, -69),
        scale = 0.5
      },
      stump =
      {
        width = 76,
        height = 68,
        shift = util.by_pixel(-1, -1),
        scale = 0.5
      },
      shadow =
      {
        width = 324,
        height = 134,
        shift = util.by_pixel(61, -2),
        scale = 0.5
      },
      leaves =
      {
        width = 184,
        height = 306,
        shift = util.by_pixel(-1, -74),
        scale = 0.5
      },
      normal =
      {
        width = 184,
        height = 290,
        shift = util.by_pixel(-0.5, -76),
        scale = 0.5
      }
    },
    { -- b
      trunk =
      {
        width = 132,
        height = 326,
        shift = util.by_pixel(4, -66),
        scale = 0.5
      },
      stump =
      {
        width = 72,
        height = 66,
        shift = util.by_pixel(0, -1),
        scale = 0.5
      },
      shadow =
      {
        width = 312,
        height = 126,
        shift = util.by_pixel(64, 0),
        scale = 0.5
      },
      leaves =
      {
        width = 182,
        height = 316,
        shift = util.by_pixel(1, -72),
        scale = 0.5
      },
      normal =
      {
        width = 180,
        height = 300,
        shift = util.by_pixel(2, -75),
        scale = 0.5
      }
    },
    { -- c
      trunk =
      {
        width = 136,
        height = 330,
        shift = util.by_pixel(-4, -68),
        scale = 0.5
      },
      stump =
      {
        width = 74,
        height = 62,
        shift = util.by_pixel(0, -1),
        scale = 0.5
      },
      shadow =
      {
        width = 306,
        height = 132,
        shift = util.by_pixel(59, 0),
        scale = 0.5
      },
      leaves =
      {
        width = 180,
        height = 308,
        shift = util.by_pixel(0, -72),
        scale = 0.5
      },
      normal =
      {
        width = 182,
        height = 306,
        shift = util.by_pixel(0.5, -70),
        scale = 0.5
      }
    },
    { -- d
      trunk =
      {
        width = 108,
        height = 324,
        shift = util.by_pixel(2, -67),
        scale = 0.5
      },
      stump =
      {
        width = 82,
        height = 68,
        shift = util.by_pixel(0, -3),
        scale = 0.5
      },
      shadow =
      {
        width = 288,
        height = 130,
        shift = util.by_pixel(59, -3),
        scale = 0.5
      },
      leaves =
      {
        width = 188,
        height = 310,
        shift = util.by_pixel(1, -72),
        scale = 0.5
      },
      normal =
      {
        width = 188,
        height = 286,
        shift = util.by_pixel(2, -75.5),
        scale = 0.5
      }
    },
    { -- e
      trunk =
      {
        width = 138,
        height = 324,
        shift = util.by_pixel(2, -66),
        scale = 0.5
      },
      stump =
      {
        width = 78,
        height = 62,
        shift = util.by_pixel(0, -1),
        scale = 0.5
      },
      shadow =
      {
        width = 314,
        height = 136,
        shift = util.by_pixel(67, 1),
        scale = 0.5
      },
      leaves =
      {
        width = 190,
        height = 300,
        shift = util.by_pixel(3, -71),
        scale = 0.5
      },
      normal =
      {
        width = 190,
        height = 280,
        shift = util.by_pixel(4, -68),
        scale = 0.5
      }
    },
    { -- f
      trunk =
      {
        width = 118,
        height = 326,
        shift = util.by_pixel(-4, -65),
        scale = 0.5
      },
      stump =
      {
        width = 76,
        height = 70,
        shift = util.by_pixel(0, -1),
        scale = 0.5
      },
      shadow =
      {
        width = 304,
        height = 140,
        shift = util.by_pixel(56, 1),
        scale = 0.5
      },
      leaves =
      {
        width = 190,
        height = 304,
        shift = util.by_pixel(-3, -67),
        scale = 0.5
      },
      normal =
      {
        width = 190,
        height = 278,
        shift = util.by_pixel(-2, -71),
        scale = 0.5
      }
    },
    { -- g
      trunk =
      {
        width = 142,
        height = 294,
        shift = util.by_pixel(-2, -59),
        scale = 0.5
      },
      stump =
      {
        width = 72,
        height = 62,
        shift = util.by_pixel(-1, -1),
        scale = 0.5
      },
      shadow =
      {
        width = 252,
        height = 130,
        shift = util.by_pixel(41, -2),
        scale = 0.5
      },
      leaves =
      {
        width = 184,
        height = 274,
        shift = util.by_pixel(-3, -61),
        scale = 0.5
      },
      normal =
      {
        width = 186,
        height = 248,
        shift = util.by_pixel(-2.5, -62),
        scale = 0.5
      }
    },
    { -- h
      trunk =
      {
        width = 116,
        height = 296,
        shift = util.by_pixel(4, -60),
        scale = 0.5
      },
      stump =
      {
        width = 70,
        height = 64,
        shift = util.by_pixel(-1, -2),
        scale = 0.5
      },
      shadow =
      {
        width = 266,
        height = 130,
        shift = util.by_pixel(55, -3),
        scale = 0.5
      },
      leaves =
      {
        width = 180,
        height = 282,
        shift = util.by_pixel(1, -63),
        scale = 0.5
      },
      normal =
      {
        width = 180,
        height = 244,
        shift = util.by_pixel(1.5, -61),
        scale = 0.5
      }
    },
    { -- i
      trunk =
      {
        width = 120,
        height = 244,
        shift = util.by_pixel(0, -49),
        scale = 0.5
      },
      stump =
      {
        width = 82,
        height = 68,
        shift = util.by_pixel(2, -5),
        scale = 0.5
      },
      shadow =
      {
        width = 228,
        height = 118,
        shift = util.by_pixel(50, 3),
        scale = 0.5
      },
      leaves =
      {
        width = 152,
        height = 234,
        shift = util.by_pixel(-2, -52),
        scale = 0.5
      },
      normal =
      {
        width = 152,
        height = 196,
        shift = util.by_pixel(-1.5, -56.5),
        scale = 0.5
      }
    },
    { -- j
      trunk =
      {
        width = 110,
        height = 250,
        shift = util.by_pixel(0, -50),
        scale = 0.5
      },
      stump =
      {
        width = 74,
        height = 74,
        shift = util.by_pixel(3, -6),
        scale = 0.5
      },
      shadow =
      {
        width = 212,
        height = 104,
        shift = util.by_pixel(50, -3),
        scale = 0.5
      },
      leaves =
      {
        width = 134,
        height = 228,
        shift = util.by_pixel(0, -51),
        scale = 0.5
      },
      normal =
      {
        width = 134,
        height = 194,
        shift = util.by_pixel(1.5, -58.5),
        scale = 0.5
      }
    },
    { -- k
      trunk =
      {
        width = 258,
        height = 224,
        shift = util.by_pixel(10, -13),
        scale = 0.5
      },
      stump =
      {
        width = 86,
        height = 78,
        shift = util.by_pixel(-9, 4),
        scale = 0.5
      },
      shadow =
      {
        width = 256,
        height = 212,
        shift = util.by_pixel(13, -13),
        scale = 0.5
      },
      leaves =
      {
        width = 250,
        height = 206,
        shift = util.by_pixel(10, -12),
        scale = 0.5
      },
      normal =
      {
        width = 186,
        height = 150,
        shift = util.by_pixel(26, -26),
        scale = 0.5
      }
    },
    { -- l
      trunk =
      {
        width = 620,
        height = 116,
        shift = util.by_pixel(32, 7),
        scale = 0.5
      },
      stump =
      {
        width = 396,
        height = 202,
        shift = util.by_pixel(88, 31),
        scale = 0.5
      },
      shadow =
      {
        width = 366,
        height = 94,
        shift = util.by_pixel(-29, 5),
        scale = 0.5
      },
      leaves =
      {
        width = 354,
        height = 114,
        shift = util.by_pixel(-31, 0),
        scale = 0.5
      },
      normal =
      {
        width = 240,
        height = 112,
        shift = util.by_pixel(-52.5, 1),
        scale = 0.5
      }
    }
  },
  { -- tree-02
    { -- a
      trunk =
      {
        width = 162,
        height = 324,
        shift = util.by_pixel(1, -65),
        scale = 0.5
      },
      stump =
      {
        width = 88,
        height = 70,
        shift = util.by_pixel(2, -2),
        scale = 0.5
      },
      shadow =
      {
        width = 384,
        height = 130,
        shift = util.by_pixel(92, -2),
        scale = 0.5
      },
      leaves =
      {
        width = 184,
        height = 310,
        shift = util.by_pixel(0, -74),
        scale = 0.5
      },
      normal =
      {
        width = 186,
        height = 292,
        shift = util.by_pixel(0.5, -78),
        scale = 0.5
      }
    },
    { -- b
      trunk =
      {
        width = 150,
        height = 286,
        shift = util.by_pixel(-3, -59),
        scale = 0.5
      },
      stump =
      {
        width = 78,
        height = 60,
        shift = util.by_pixel(2, -3),
        scale = 0.5
      },
      shadow =
      {
        width = 372,
        height = 134,
        shift = util.by_pixel(86, 1),
        scale = 0.5
      },
      leaves =
      {
        width = 184,
        height = 274,
        shift = util.by_pixel(-2, -62),
        scale = 0.5
      },
      normal =
      {
        width = 184,
        height = 262,
        shift = util.by_pixel(-1, -64),
        scale = 0.5
      }
    },
    { -- c
      trunk =
      {
        width = 144,
        height = 280,
        shift = util.by_pixel(-4, -57),
        scale = 0.5
      },
      stump =
      {
        width = 78,
        height = 60,
        shift = util.by_pixel(2, -2),
        scale = 0.5
      },
      shadow =
      {
        width = 352,
        height = 128,
        shift = util.by_pixel(77, -2),
        scale = 0.5
      },
      leaves =
      {
        width = 178,
        height = 264,
        shift = util.by_pixel(-1, -62),
        scale = 0.5
      },
      normal =
      {
        width = 178,
        height = 244,
        shift = util.by_pixel(0, -66.5),
        scale = 0.5
      }
    },
    { -- d
      trunk =
      {
        width = 142,
        height = 336,
        shift = util.by_pixel(7, -70),
        scale = 0.5
      },
      stump =
      {
        width = 102,
        height = 80,
        shift = util.by_pixel(7, -6),
        scale = 0.5
      },
      shadow =
      {
        width = 402,
        height = 134,
        shift = util.by_pixel(94, -4),
        scale = 0.5
      },
      leaves =
      {
        width = 180,
        height = 330,
        shift = util.by_pixel(6, -75),
        scale = 0.5
      },
      normal =
      {
        width = 180,
        height = 302,
        shift = util.by_pixel(7, -82),
        scale = 0.5
      }
    },
    { -- e
      trunk =
      {
        width = 168,
        height = 286,
        shift = util.by_pixel(3, -57),
        scale = 0.5
      },
      stump =
      {
        width = 100,
        height = 78,
        shift = util.by_pixel(8, -5),
        scale = 0.5
      },
      shadow =
      {
        width = 410,
        height = 144,
        shift = util.by_pixel(96, 6),
        scale = 0.5
      },
      leaves =
      {
        width = 194,
        height = 276,
        shift = util.by_pixel(1, -63),
        scale = 0.5
      },
      normal =
      {
        width = 194,
        height = 272,
        shift = util.by_pixel(2, -64.5),
        scale = 0.5
      }
    },
    { -- f
      trunk =
      {
        width = 144,
        height = 310,
        shift = util.by_pixel(-10, -63),
        scale = 0.5
      },
      stump =
      {
        width = 96,
        height = 78,
        shift = util.by_pixel(6, -5),
        scale = 0.5
      },
      shadow =
      {
        width = 344,
        height = 130,
        shift = util.by_pixel(75, 0),
        scale = 0.5
      },
      leaves =
      {
        width = 184,
        height = 302,
        shift = util.by_pixel(-10, -68),
        scale = 0.5
      },
      normal =
      {
        width = 184,
        height = 292,
        shift = util.by_pixel(-9, -69.5),
        scale = 0.5
      }
    },
    { -- g
      trunk =
      {
        width = 168,
        height = 282,
        shift = util.by_pixel(6, -56),
        scale = 0.5
      },
      stump =
      {
        width = 78,
        height = 66,
        shift = util.by_pixel(0, -2),
        scale = 0.5
      },
      shadow =
      {
        width = 384,
        height = 122,
        shift = util.by_pixel(84, -4),
        scale = 0.5
      },
      leaves =
      {
        width = 198,
        height = 270,
        shift = util.by_pixel(5, -67),
        scale = 0.5
      },
      normal =
      {
        width = 196,
        height = 238,
        shift = util.by_pixel(6, -74.5),
        scale = 0.5
      }
    },
    { -- h
      trunk =
      {
        width = 182,
        height = 244,
        shift = util.by_pixel(-8, -47),
        scale = 0.5
      },
      stump =
      {
        width = 80,
        height = 66,
        shift = util.by_pixel(1, -2),
        scale = 0.5
      },
      shadow =
      {
        width = 306,
        height = 118,
        shift = util.by_pixel(69, 5),
        scale = 0.5
      },
      leaves =
      {
        width = 192,
        height = 234,
        shift = util.by_pixel(-7, -58),
        scale = 0.5
      },
      normal =
      {
        width = 190,
        height = 220,
        shift = util.by_pixel(-6, -60.5),
        scale = 0.5
      }
    },
    { -- i
      trunk =
      {
        width = 126,
        height = 206,
        shift = util.by_pixel(4, -38),
        scale = 0.5
      },
      stump =
      {
        width = 88,
        height = 74,
        shift = util.by_pixel(7, -5),
        scale = 0.5
      },
      shadow =
      {
        width = 262,
        height = 110,
        shift = util.by_pixel(61, 0),
        scale = 0.5
      },
      leaves =
      {
        width = 152,
        height = 194,
        shift = util.by_pixel(4, -48),
        scale = 0.5
      },
      normal =
      {
        width = 152,
        height = 194,
        shift = util.by_pixel(5, -47),
        scale = 0.5
      }
    },
    { -- j
      trunk =
      {
        width = 128,
        height = 194,
        shift = util.by_pixel(-8, -36),
        scale = 0.5
      },
      stump =
      {
        width = 84,
        height = 66,
        shift = util.by_pixel(5, -4),
        scale = 0.5
      },
      shadow =
      {
        width = 248,
        height = 108,
        shift = util.by_pixel(55, -1),
        scale = 0.5
      },
      leaves =
      {
        width = 152,
        height = 198,
        shift = util.by_pixel(-7, -47),
        scale = 0.5
      },
      normal =
      {
        width = 152,
        height = 200,
        shift = util.by_pixel(-6.5, -46.5),
        scale = 0.5
      }
    },
    { -- k
      trunk =
      {
        width = 234,
        height = 244,
        shift = util.by_pixel(6, -19),
        scale = 0.5
      },
      stump =
      {
        width = 138,
        height = 130,
        shift = util.by_pixel(1, 5),
        scale = 0.5
      },
      shadow =
      {
        width = 248,
        height = 262,
        shift = util.by_pixel(12, -19),
        scale = 0.5
      },
      leaves =
      {
        width = 216,
        height = 264,
        shift = util.by_pixel(13, -30),
        scale = 0.5
      },
      normal =
      {
        width = 214,
        height = 212,
        shift = util.by_pixel(14, -41.5),
        scale = 0.5
      }
    },
    { -- l
      trunk =
      {
        width = 410,
        height = 122,
        shift = util.by_pixel(-9, -7),
        scale = 0.5
      },
      stump =
      {
        width = 188,
        height = 100,
        shift = util.by_pixel(28, -12),
        scale = 0.5
      },
      shadow =
      {
        width = 418,
        height = 138,
        shift = util.by_pixel(-2, 1),
        scale = 0.5
      },
      leaves =
      {
        width = 404,
        height = 156,
        shift = util.by_pixel(-11, -6),
        scale = 0.5
      },
      normal =
      {
        width = 308,
        height = 156,
        shift = util.by_pixel(-35, -5.5),
        scale = 0.5
      }
    }
  },
  { -- tree-03
    { -- a
      trunk =
      {
        width = 264,
        height = 312,
        shift = util.by_pixel(-5, -56),
        scale = 0.5
      },
      stump =
      {
        width = 100,
        height = 80,
        shift = util.by_pixel(1, 2),
        scale = 0.5
      },
      shadow =
      {
        width = 300,
        height = 202,
        shift = util.by_pixel(61, -14),
        scale = 0.5
      },
      leaves =
      {
        width = 282,
        height = 304,
        shift = util.by_pixel(-8, -74),
        scale = 0.5
      },
      normal =
      {
        width = 284,
        height = 270,
        shift = util.by_pixel(-8, -82),
        scale = 0.5
      }
    },
    { -- b
      trunk =
      {
        width = 252,
        height = 314,
        shift = util.by_pixel(20, -58),
        scale = 0.5
      },
      stump =
      {
        width = 106,
        height = 84,
        shift = util.by_pixel(-4, 0),
        scale = 0.5
      },
      shadow =
      {
        width = 406,
        height = 230,
        shift = util.by_pixel(86, -11),
        scale = 0.5
      },
      leaves =
      {
        width = 342,
        height = 272,
        shift = util.by_pixel(22, -80),
        scale = 0.5
      },
      normal =
      {
        width = 344,
        height = 276,
        shift = util.by_pixel(22.5, -79.5),
        scale = 0.5
      }
    },
    { -- c
      trunk =
      {
        width = 268,
        height = 246,
        shift = util.by_pixel(-9, -43),
        scale = 0.5
      },
      stump =
      {
        width = 98,
        height = 78,
        shift = util.by_pixel(3, -1),
        scale = 0.5
      },
      shadow =
      {
        width = 646,
        height = 188,
        shift = util.by_pixel(-26, 9),
        scale = 0.5
      },
      leaves =
      {
        width = 314,
        height = 232,
        shift = util.by_pixel(-8, -48),
        scale = 0.5
      },
      normal =
      {
        width = 318,
        height = 234,
        shift = util.by_pixel(-8, -47.5),
        scale = 0.5
      }
    },
    { -- d
      trunk =
      {
        width = 142,
        height = 286,
        shift = util.by_pixel(7, -51),
        scale = 0.5
      },
      stump =
      {
        width = 96,
        height = 78,
        shift = util.by_pixel(-5, 1),
        scale = 0.5
      },
      shadow =
      {
        width = 318,
        height = 156,
        shift = util.by_pixel(66, 0),
        scale = 0.5
      },
      leaves =
      {
        width = 202,
        height = 254,
        shift = util.by_pixel(9, -67),
        scale = 0.5
      },
      normal =
      {
        width = 202,
        height = 230,
        shift = util.by_pixel(9.5, -72.5),
        scale = 0.5
      }
    },
    { -- e
      trunk =
      {
        width = 174,
        height = 250,
        shift = util.by_pixel(7, -47),
        scale = 0.5
      },
      stump =
      {
        width = 98,
        height = 74,
        shift = util.by_pixel(-3, -3),
        scale = 0.5
      },
      shadow =
      {
        width = 330,
        height = 132,
        shift = util.by_pixel(71, 1),
        scale = 0.5
      },
      leaves =
      {
        width = 234,
        height = 208,
        shift = util.by_pixel(8, -61),
        scale = 0.5
      },
      normal =
      {
        width = 238,
        height = 198,
        shift = util.by_pixel(8.5, -64),
        scale = 0.5
      }
    },
    { -- f
      trunk =
      {
        width = 158,
        height = 262,
        shift = util.by_pixel(-12, -49),
        scale = 0.5
      },
      stump =
      {
        width = 90,
        height = 66,
        shift = util.by_pixel(5, 0),
        scale = 0.5
      },
      shadow =
      {
        width = 224,
        height = 142,
        shift = util.by_pixel(48, -3),
        scale = 0.5
      },
      leaves =
      {
        width = 214,
        height = 232,
        shift = util.by_pixel(-13, -57),
        scale = 0.5
      },
      normal =
      {
        width = 216,
        height = 202,
        shift = util.by_pixel(-12, -63.5),
        scale = 0.5
      }
    },
    { -- g
      trunk =
      {
        width = 140,
        height = 240,
        shift = util.by_pixel(-9, -41),
        scale = 0.5
      },
      stump =
      {
        width = 88,
        height = 76,
        shift = util.by_pixel(0, 0),
        scale = 0.5
      },
      shadow =
      {
        width = 212,
        height = 136,
        shift = util.by_pixel(44, -5),
        scale = 0.5
      },
      leaves =
      {
        width = 188,
        height = 230,
        shift = util.by_pixel(1, -57),
        scale = 0.5
      },
      normal =
      {
        width = 186,
        height = 188,
        shift = util.by_pixel(1.5, -66.5),
        scale = 0.5
      }
    },
    { -- h
      trunk =
      {
        width = 174,
        height = 224,
        shift = util.by_pixel(2, -37),
        scale = 0.5
      },
      stump =
      {
        width = 88,
        height = 74,
        shift = util.by_pixel(-2, 0),
        scale = 0.5
      },
      shadow =
      {
        width = 258,
        height = 132,
        shift = util.by_pixel(55, -1),
        scale = 0.5
      },
      leaves =
      {
        width = 182,
        height = 200,
        shift = util.by_pixel(7, -43),
        scale = 0.5
      },
      normal =
      {
        width = 186,
        height = 154,
        shift = util.by_pixel(7.5, -54),
        scale = 0.5
      }
    },
    { -- i
      trunk =
      {
        width = 196,
        height = 202,
        shift = util.by_pixel(2, -34),
        scale = 0.5
      },
      stump =
      {
        width = 92,
        height = 80,
        shift = util.by_pixel(1, -3),
        scale = 0.5
      },
      shadow =
      {
        width = 218,
        height = 120,
        shift = util.by_pixel(48, 4),
        scale = 0.5
      },
      leaves =
      {
        width = 198,
        height = 178,
        shift = util.by_pixel(-1, -41),
        scale = 0.5
      },
      normal =
      {
        width = 190,
        height = 136,
        shift = util.by_pixel(-3.5, -50.5),
        scale = 0.5
      }
    },
    { -- j
      trunk =
      {
        width = 100,
        height = 188,
        shift = util.by_pixel(6, -34),
        scale = 0.5
      },
      stump =
      {
        width = 58,
        height = 52,
        shift = util.by_pixel(-2, 0),
        scale = 0.5
      },
      shadow =
      {
        width = 178,
        height = 110,
        shift = util.by_pixel(39, -2),
        scale = 0.5
      },
      leaves =
      {
        width = 112,
        height = 166,
        shift = util.by_pixel(6, -43),
        scale = 0.5
      },
      normal =
      {
        width = 114,
        height = 136,
        shift = util.by_pixel(6.5, -50.5),
        scale = 0.5
      }
    },
    { -- k
      trunk =
      {
        width = 92,
        height = 134,
        shift = util.by_pixel(8, -23),
        scale = 0.5
      },
      stump =
      {
        width = 52,
        height = 46,
        shift = util.by_pixel(-2, -1),
        scale = 0.5
      },
      shadow =
      {
        width = 170,
        height = 66,
        shift = util.by_pixel(38, 3),
        scale = 0.5
      },
      leaves =
      {
        width = 140,
        height = 126,
        shift = util.by_pixel(4, -32),
        scale = 0.5
      },
      normal =
      {
        width = 140,
        height = 104,
        shift = util.by_pixel(4.5, -36.5),
        scale = 0.5
      }
    },
    { -- l
      trunk =
      {
        width = 112,
        height = 166,
        shift = util.by_pixel(-9, -29),
        scale = 0.5
      },
      stump =
      {
        width = 62,
        height = 50,
        shift = util.by_pixel(3, 0),
        scale = 0.5
      },
      shadow =
      {
        width = 142,
        height = 90,
        shift = util.by_pixel(31, -5),
        scale = 0.5
      },
      leaves =
      {
        width = 154,
        height = 142,
        shift = util.by_pixel(-13, -42),
        scale = 0.5
      },
      normal =
      {
        width = 154,
        height = 122,
        shift = util.by_pixel(-12.5, -46),
        scale = 0.5
      }
    }
  },
  { -- tree-04
    { -- a
      trunk =
      {
        width = 174,
        height = 316,
        shift = util.by_pixel(-4, -58),
        scale = 0.5
      },
      stump =
      {
        width = 112,
        height = 94,
        shift = util.by_pixel(3, -2),
        scale = 0.5
      },
      shadow =
      {
        width = 318,
        height = 130,
        shift = util.by_pixel(65, -5),
        scale = 0.5
      },
      leaves =
      {
        width = 216,
        height = 314,
        shift = util.by_pixel(-3, -67),
        scale = 0.5
      },
      normal =
      {
        width = 218,
        height = 248,
        shift = util.by_pixel(-2.5, -82),
        scale = 0.5
      }
    },
    { -- b
      trunk =
      {
        width = 142,
        height = 334,
        shift = util.by_pixel(5, -60),
        scale = 0.5
      },
      stump =
      {
        width = 118,
        height = 94,
        shift = util.by_pixel(-1, 0),
        scale = 0.5
      },
      shadow =
      {
        width = 308,
        height = 154,
        shift = util.by_pixel(68, -3),
        scale = 0.5
      },
      leaves =
      {
        width = 184,
        height = 302,
        shift = util.by_pixel(4, -72),
        scale = 0.5
      },
      normal =
      {
        width = 186,
        height = 246,
        shift = util.by_pixel(5, -84.5),
        scale = 0.5
      }
    },
    { -- c
      trunk =
      {
        width = 176,
        height = 328,
        shift = util.by_pixel(4, -60),
        scale = 0.5
      },
      stump =
      {
        width = 108,
        height = 88,
        shift = util.by_pixel(-3, 0),
        scale = 0.5
      },
      shadow =
      {
        width = 312,
        height = 134,
        shift = util.by_pixel(67, 2),
        scale = 0.5
      },
      leaves =
      {
        width = 208,
        height = 324,
        shift = util.by_pixel(2, -64),
        scale = 0.5
      },
      normal =
      {
        width = 208,
        height = 268,
        shift = util.by_pixel(2.5, -77),
        scale = 0.5
      }
    },
    { -- d
      trunk =
      {
        width = 216,
        height = 266,
        shift = util.by_pixel(2, -48),
        scale = 0.5
      },
      stump =
      {
        width = 96,
        height = 82,
        shift = util.by_pixel(1, -2),
        scale = 0.5
      },
      shadow =
      {
        width = 320,
        height = 158,
        shift = util.by_pixel(69, 0),
        scale = 0.5
      },
      leaves =
      {
        width = 230,
        height = 290,
        shift = util.by_pixel(-6, -64),
        scale = 0.5
      },
      normal =
      {
        width = 230,
        height = 250,
        shift = util.by_pixel(-5, -74),
        scale = 0.5
      }
    },
    { -- e
      trunk =
      {
        width = 158,
        height = 324,
        shift = util.by_pixel(-9, -62),
        scale = 0.5
      },
      stump =
      {
        width = 102,
        height = 84,
        shift = util.by_pixel(1, -2),
        scale = 0.5
      },
      shadow =
      {
        width = 274,
        height = 170,
        shift = util.by_pixel(61, -2),
        scale = 0.5
      },
      leaves =
      {
        width = 222,
        height = 280,
        shift = util.by_pixel(-4, -84),
        scale = 0.5
      },
      normal =
      {
        width = 222,
        height = 256,
        shift = util.by_pixel(-3, -88.5),
        scale = 0.5
      }
    },
    { -- f
      trunk =
      {
        width = 194,
        height = 332,
        shift = util.by_pixel(4, -62),
        scale = 0.5
      },
      stump =
      {
        width = 100,
        height = 84,
        shift = util.by_pixel(-2, 0),
        scale = 0.5
      },
      shadow =
      {
        width = 332,
        height = 156,
        shift = util.by_pixel(72, -4),
        scale = 0.5
      },
      leaves =
      {
        width = 224,
        height = 272,
        shift = util.by_pixel(11, -82),
        scale = 0.5
      },
      normal =
      {
        width = 222,
        height = 244,
        shift = util.by_pixel(12.5, -87),
        scale = 0.5
      }
    },
    { -- g
      trunk =
      {
        width = 178,
        height = 282,
        shift = util.by_pixel(-12, -53),
        scale = 0.5
      },
      stump =
      {
        width = 94,
        height = 86,
        shift = util.by_pixel(0, -4),
        scale = 0.5
      },
      shadow =
      {
        width = 296,
        height = 144,
        shift = util.by_pixel(56, -7),
        scale = 0.5
      },
      leaves =
      {
        width = 222,
        height = 258,
        shift = util.by_pixel(-11, -75),
        scale = 0.5
      },
      normal =
      {
        width = 222,
        height = 220,
        shift = util.by_pixel(-10.5, -83.5),
        scale = 0.5
      }
    },
    { -- h
      trunk =
      {
        width = 128,
        height = 284,
        shift = util.by_pixel(-2, -53),
        scale = 0.5
      },
      stump =
      {
        width = 96,
        height = 92,
        shift = util.by_pixel(2, -5),
        scale = 0.5
      },
      shadow =
      {
        width = 292,
        height = 152,
        shift = util.by_pixel(67, -8),
        scale = 0.5
      },
      leaves =
      {
        width = 202,
        height = 280,
        shift = util.by_pixel(8, -57),
        scale = 0.5
      },
      normal =
      {
        width = 204,
        height = 202,
        shift = util.by_pixel(8.5, -76),
        scale = 0.5
      }
    },
    { -- i
      trunk =
      {
        width = 92,
        height = 246,
        shift = util.by_pixel(7, -46),
        scale = 0.5
      },
      stump =
      {
        width = 82,
        height = 68,
        shift = util.by_pixel(3, -2),
        scale = 0.5
      },
      shadow =
      {
        width = 244,
        height = 128,
        shift = util.by_pixel(57, 7),
        scale = 0.5
      },
      leaves =
      {
        width = 140,
        height = 240,
        shift = util.by_pixel(6, -50),
        scale = 0.5
      },
      normal =
      {
        width = 138,
        height = 206,
        shift = util.by_pixel(7, -57),
        scale = 0.5
      }
    },
    { -- j
      trunk =
      {
        width = 98,
        height = 238,
        shift = util.by_pixel(-8, -47),
        scale = 0.5
      },
      stump =
      {
        width = 78,
        height = 66,
        shift = util.by_pixel(-3, -4),
        scale = 0.5
      },
      shadow =
      {
        width = 228,
        height = 122,
        shift = util.by_pixel(47, -6),
        scale = 0.5
      },
      leaves =
      {
        width = 140,
        height = 254,
        shift = util.by_pixel(-8, -55),
        scale = 0.5
      },
      normal =
      {
        width = 140,
        height = 210,
        shift = util.by_pixel(-7, -65),
        scale = 0.5
      }
    },
    { -- k
      trunk =
      {
        width = 406,
        height = 158,
        shift = util.by_pixel(-15, -11),
        scale = 0.5
      },
      stump =
      {
        width = 104,
        height = 108,
        shift = util.by_pixel(18, -2),
        scale = 0.5
      },
      shadow =
      {
        width = 410,
        height = 124,
        shift = util.by_pixel(-6, -8),
        scale = 0.5
      },
      leaves =
      {
        width = 414,
        height = 164,
        shift = util.by_pixel(-19, -19),
        scale = 0.5
      },
      normal =
      {
        width = 266,
        height = 144,
        shift = util.by_pixel(-55, -22),
        scale = 0.5
      }
    },
    { -- l
      trunk =
      {
        width = 312,
        height = 250,
        shift = util.by_pixel(4, -3),
        scale = 0.5
      },
      stump =
      {
        width = 108,
        height = 92,
        shift = util.by_pixel(-10, -15),
        scale = 0.5
      },
      shadow =
      {
        width = 366,
        height = 250,
        shift = util.by_pixel(25, 7),
        scale = 0.5
      },
      leaves =
      {
        width = 314,
        height = 240,
        shift = util.by_pixel(10, 1),
        scale = 0.5
      },
      normal =
      {
        width = 218,
        height = 186,
        shift = util.by_pixel(35, 15),
        scale = 0.5
      }
    }
  },
  { -- tree-05
    { -- a
      trunk =
      {
        width = 144,
        height = 242,
        shift = util.by_pixel(13, -45),
        scale = 0.5
      },
      stump =
      {
        width = 88,
        height = 64,
        shift = util.by_pixel(-1, 0),
        scale = 0.5
      },
      shadow =
      {
        width = 322,
        height = 150,
        shift = util.by_pixel(62, -8),
        scale = 0.5
      },
      leaves =
      {
        width = 234,
        height = 258,
        shift = util.by_pixel(5, -60),
        scale = 0.5
      },
      normal =
      {
        width = 234,
        height = 216,
        shift = util.by_pixel(6, -71),
        scale = 0.5
      }
    },
    { -- b
      trunk =
      {
        width = 114,
        height = 226,
        shift = util.by_pixel(1, -40),
        scale = 0.5
      },
      stump =
      {
        width = 78,
        height = 68,
        shift = util.by_pixel(-1, 0),
        scale = 0.5
      },
      shadow =
      {
        width = 290,
        height = 166,
        shift = util.by_pixel(58, 1),
        scale = 0.5
      },
      leaves =
      {
        width = 222,
        height = 242,
        shift = util.by_pixel(6, -60),
        scale = 0.5
      },
      normal =
      {
        width = 222,
        height = 212,
        shift = util.by_pixel(6, -67.5),
        scale = 0.5
      }
    },
    { -- c
      trunk =
      {
        width = 122,
        height = 276,
        shift = util.by_pixel(-10, -54),
        scale = 0.5
      },
      stump =
      {
        width = 84,
        height = 64,
        shift = util.by_pixel(-1, -1),
        scale = 0.5
      },
      shadow =
      {
        width = 272,
        height = 162,
        shift = util.by_pixel(52, 3),
        scale = 0.5
      },
      leaves =
      {
        width = 224,
        height = 290,
        shift = util.by_pixel(-2, -65),
        scale = 0.5
      },
      normal =
      {
        width = 224,
        height = 256,
        shift = util.by_pixel(-2, -74),
        scale = 0.5
      }
    },
    { -- d
      trunk =
      {
        width = 120,
        height = 244,
        shift = util.by_pixel(4, -44),
        scale = 0.5
      },
      stump =
      {
        width = 78,
        height = 70,
        shift = util.by_pixel(1, 0),
        scale = 0.5
      },
      shadow =
      {
        width = 278,
        height = 168,
        shift = util.by_pixel(54, -2),
        scale = 0.5
      },
      leaves =
      {
        width = 202,
        height = 244,
        shift = util.by_pixel(5, -59),
        scale = 0.5
      },
      normal =
      {
        width = 200,
        height = 208,
        shift = util.by_pixel(6, -67),
        scale = 0.5
      }
    },
    { -- e
      trunk =
      {
        width = 106,
        height = 232,
        shift = util.by_pixel(0, -43),
        scale = 0.5
      },
      stump =
      {
        width = 80,
        height = 64,
        shift = util.by_pixel(0, -1),
        scale = 0.5
      },
      shadow =
      {
        width = 268,
        height = 144,
        shift = util.by_pixel(53, 2),
        scale = 0.5
      },
      leaves =
      {
        width = 236,
        height = 250,
        shift = util.by_pixel(-2, -57),
        scale = 0.5
      },
      normal =
      {
        width = 236,
        height = 206,
        shift = util.by_pixel(-2, -66.5),
        scale = 0.5
      }
    },
    { -- f
      trunk =
      {
        width = 112,
        height = 236,
        shift = util.by_pixel(-9, -43),
        scale = 0.5
      },
      stump =
      {
        width = 80,
        height = 68,
        shift = util.by_pixel(-1, -1),
        scale = 0.5
      },
      shadow =
      {
        width = 272,
        height = 168,
        shift = util.by_pixel(52, -1),
        scale = 0.5
      },
      leaves =
      {
        width = 194,
        height = 252,
        shift = util.by_pixel(-4, -54),
        scale = 0.5
      },
      normal =
      {
        width = 194,
        height = 212,
        shift = util.by_pixel(-3.5, -64),
        scale = 0.5
      }
    },
    { -- g
      trunk =
      {
        width = 86,
        height = 214,
        shift = util.by_pixel(0, -40),
        scale = 0.5
      },
      stump =
      {
        width = 64,
        height = 74,
        shift = util.by_pixel(0, -5),
        scale = 0.5
      },
      shadow =
      {
        width = 238,
        height = 164,
        shift = util.by_pixel(42, -5),
        scale = 0.5
      },
      leaves =
      {
        width = 178,
        height = 220,
        shift = util.by_pixel(0, -51),
        scale = 0.5
      },
      normal =
      {
        width = 176,
        height = 216,
        shift = util.by_pixel(1, -51),
        scale = 0.5
      }
    },
    { -- h
      trunk =
      {
        width = 144,
        height = 212,
        shift = util.by_pixel(7, -39),
        scale = 0.5
      },
      stump =
      {
        width = 72,
        height = 76,
        shift = util.by_pixel(0, -5),
        scale = 0.5
      },
      shadow =
      {
        width = 270,
        height = 122,
        shift = util.by_pixel(49, 0),
        scale = 0.5
      },
      leaves =
      {
        width = 228,
        height = 196,
        shift = util.by_pixel(6, -47),
        scale = 0.5
      },
      normal =
      {
        width = 228,
        height = 174,
        shift = util.by_pixel(6.5, -51),
        scale = 0.5
      }
    },
    { -- i
      trunk =
      {
        width = 70,
        height = 184,
        shift = util.by_pixel(-3, -34),
        scale = 0.5
      },
      stump =
      {
        width = 58,
        height = 60,
        shift = util.by_pixel(0, -3),
        scale = 0.5
      },
      shadow =
      {
        width = 214,
        height = 118,
        shift = util.by_pixel(40, -3),
        scale = 0.5
      },
      leaves =
      {
        width = 166,
        height = 200,
        shift = util.by_pixel(-5, -45),
        scale = 0.5
      },
      normal =
      {
        width = 166,
        height = 166,
        shift = util.by_pixel(-5, -53.5),
        scale = 0.5
      }
    },
    { -- j
      trunk =
      {
        width = 66,
        height = 162,
        shift = util.by_pixel(3, -29),
        scale = 0.5
      },
      stump =
      {
        width = 56,
        height = 62,
        shift = util.by_pixel(1, -4),
        scale = 0.5
      },
      shadow =
      {
        width = 192,
        height = 126,
        shift = util.by_pixel(41, 1),
        scale = 0.5
      },
      leaves =
      {
        width = 142,
        height = 184,
        shift = util.by_pixel(1, -41),
        scale = 0.5
      },
      normal =
      {
        width = 144,
        height = 164,
        shift = util.by_pixel(1.5, -45),
        scale = 0.5
      }
    },
    { -- k
      trunk =
      {
        width = 274,
        height = 176,
        shift = util.by_pixel(-17, 9),
        scale = 0.5
      },
      stump =
      {
        width = 110,
        height = 88,
        shift = util.by_pixel(24, -13),
        scale = 0.5
      },
      shadow =
      {
        width = 276,
        height = 160,
        shift = util.by_pixel(-13, 12),
        scale = 0.5
      },
      leaves =
      {
        width = 234,
        height = 162,
        shift = util.by_pixel(-29, 7),
        scale = 0.5
      },
      normal =
      {
        width = 170,
        height = 152,
        shift = util.by_pixel(-45, 9.5),
        scale = 0.5
      }
    },
    { -- l
      trunk =
      {
        width = 252,
        height = 186,
        shift = util.by_pixel(15, -22),
        scale = 0.5
      },
      stump =
      {
        width = 104,
        height = 70,
        shift = util.by_pixel(-21, 7),
        scale = 0.5
      },
      shadow =
      {
        width = 258,
        height = 186,
        shift = util.by_pixel(21, -18),
        scale = 0.5
      },
      leaves =
      {
        width = 252,
        height = 164,
        shift = util.by_pixel(15, -30),
        scale = 0.5
      },
      normal =
      {
        width = 158,
        height = 146,
        shift = util.by_pixel(34.5, -34.5),
        scale = 0.5
      }
    }
  },
  { -- tree-06
    { -- a
      trunk =
      {
        width = 140,
        height = 268,
        shift = util.by_pixel(7, -40),
        scale = 0.5
      },
      stump =
      {
        width = 118,
        height = 120,
        shift = util.by_pixel(0, -3),
        scale = 0.5
      },
      shadow =
      {
        width = 338,
        height = 148,
        shift = util.by_pixel(64, 1),
        scale = 0.5
      },
      leaves =
      {
        width = 132,
        height = 196,
        shift = util.by_pixel(11, -50),
        scale = 0.5
      }
    },
    { -- b
      trunk =
      {
        width = 168,
        height = 248,
        shift = util.by_pixel(8, -26),
        scale = 0.5
      },
      stump =
      {
        width = 124,
        height = 132,
        shift = util.by_pixel(0, 3),
        scale = 0.5
      },
      shadow =
      {
        width = 352,
        height = 116,
        shift = util.by_pixel(67, 12),
        scale = 0.5
      },
      leaves =
      {
        width = 172,
        height = 186,
        shift = util.by_pixel(9, -40),
        scale = 0.5
      }
    },
    { -- c
      trunk =
      {
        width = 198,
        height = 208,
        shift = util.by_pixel(0, -15),
        scale = 0.5
      },
      stump =
      {
        width = 122,
        height = 116,
        shift = util.by_pixel(-3, 8),
        scale = 0.5
      },
      shadow =
      {
        width = 352,
        height = 98,
        shift = util.by_pixel(65, 16),
        scale = 0.5
      },
      leaves =
      {
        width = 178,
        height = 162,
        shift = util.by_pixel(3, -29),
        scale = 0.5
      }
    },
    { -- d
      trunk =
      {
        width = 148,
        height = 244,
        shift = util.by_pixel(-16, -21),
        scale = 0.5
      },
      stump =
      {
        width = 120,
        height = 128,
        shift = util.by_pixel(-6, 8),
        scale = 0.5
      },
      shadow =
      {
        width = 308,
        height = 130,
        shift = util.by_pixel(43, 15),
        scale = 0.5
      },
      leaves =
      {
        width = 150,
        height = 180,
        shift = util.by_pixel(-15, -39),
        scale = 0.5
      }
    },
    { -- e
      trunk =
      {
        width = 154,
        height = 270,
        shift = util.by_pixel(-15, -33),
        scale = 0.5
      },
      stump =
      {
        width = 126,
        height = 106,
        shift = util.by_pixel(-8, 8),
        scale = 0.5
      },
      shadow =
      {
        width = 248,
        height = 146,
        shift = util.by_pixel(26, 7),
        scale = 0.5
      },
      leaves =
      {
        width = 136,
        height = 226,
        shift = util.by_pixel(-18, -48),
        scale = 0.5
      }
    },
    { -- f
      trunk =
      {
        width = 184,
        height = 268,
        shift = util.by_pixel(-17, -37),
        scale = 0.5
      },
      stump =
      {
        width = 122,
        height = 120,
        shift = util.by_pixel(-10, 0),
        scale = 0.5
      },
      shadow =
      {
        width = 326,
        height = 110,
        shift = util.by_pixel(42, -5),
        scale = 0.5
      },
      leaves =
      {
        width = 180,
        height = 230,
        shift = util.by_pixel(-19, -49),
        scale = 0.5
      }
    },
    { -- g
      trunk =
      {
        width = 194,
        height = 266,
        shift = util.by_pixel(-9, -36),
        scale = 0.5
      },
      stump =
      {
        width = 122,
        height = 126,
        shift = util.by_pixel(-7, -1),
        scale = 0.5
      },
      shadow =
      {
        width = 354,
        height = 100,
        shift = util.by_pixel(55, -7),
        scale = 0.5
      },
      leaves =
      {
        width = 178,
        height = 228,
        shift = util.by_pixel(-9, -47),
        scale = 0.5
      }
    },
    { -- h
      trunk =
      {
        width = 166,
        height = 258,
        shift = util.by_pixel(5, -36),
        scale = 0.5
      },
      stump =
      {
        width = 128,
        height = 114,
        shift = util.by_pixel(-5, 0),
        scale = 0.5
      },
      shadow =
      {
        width = 320,
        height = 146,
        shift = util.by_pixel(56, -7),
        scale = 0.5
      },
      leaves =
      {
        width = 144,
        height = 190,
        shift = util.by_pixel(13, -46),
        scale = 0.5
      }
    },
    { -- i
      trunk =
      {
        width = 152,
        height = 238,
        shift = util.by_pixel(-14, -21),
        scale = 0.5
      },
      stump =
      {
        width = 144,
        height = 126,
        shift = util.by_pixel(-12, 7),
        scale = 0.5
      },
      shadow =
      {
        width = 228,
        height = 148,
        shift = util.by_pixel(19, 13),
        scale = 0.5
      },
      leaves =
      {
        width = 132,
        height = 186,
        shift = util.by_pixel(-19, -37),
        scale = 0.5
      }
    },
    { -- j
      trunk =
      {
        width = 142,
        height = 232,
        shift = util.by_pixel(-12, -22),
        scale = 0.5
      },
      stump =
      {
        width = 134,
        height = 116,
        shift = util.by_pixel(-10, 7),
        scale = 0.5
      },
      shadow =
      {
        width = 256,
        height = 148,
        shift = util.by_pixel(26, 9),
        scale = 0.5
      },
      leaves =
      {
        width = 134,
        height = 182,
        shift = util.by_pixel(-15, -38),
        scale = 0.5
      }
    }
  },
  { -- tree-07
    { -- a
      trunk =
      {
        width = 174,
        height = 320,
        shift = util.by_pixel(-2, -60),
        scale = 0.5
      },
      stump =
      {
        width = 88,
        height = 88,
        shift = util.by_pixel(0, -2),
        scale = 0.5
      },
      shadow =
      {
        width = 350,
        height = 190,
        shift = util.by_pixel(64, -10),
        scale = 0.5
      },
      leaves =
      {
        width = 244,
        height = 336,
        shift = util.by_pixel(2, -67),
        scale = 0.5
      },
      normal =
      {
        width = 246,
        height = 290,
        shift = util.by_pixel(2.5, -78.5),
        scale = 0.5
      }
    },
    { -- b
      trunk =
      {
        width = 178,
        height = 306,
        shift = util.by_pixel(10, -58),
        scale = 0.5
      },
      stump =
      {
        width = 100,
        height = 86,
        shift = util.by_pixel(0, -3),
        scale = 0.5
      },
      shadow =
      {
        width = 368,
        height = 178,
        shift = util.by_pixel(71, -3),
        scale = 0.5
      },
      leaves =
      {
        width = 280,
        height = 296,
        shift = util.by_pixel(9, -62),
        scale = 0.5
      },
      normal =
      {
        width = 282,
        height = 250,
        shift = util.by_pixel(9.5, -72),
        scale = 0.5
      }
    },
    { -- c
      trunk =
      {
        width = 180,
        height = 300,
        shift = util.by_pixel(-10, -57),
        scale = 0.5
      },
      stump =
      {
        width = 98,
        height = 82,
        shift = util.by_pixel(1, -2),
        scale = 0.5
      },
      shadow =
      {
        width = 284,
        height = 174,
        shift = util.by_pixel(47, -2),
        scale = 0.5
      },
      leaves =
      {
        width = 270,
        height = 324,
        shift = util.by_pixel(-15, -68),
        scale = 0.5
      },
      normal =
      {
        width = 270,
        height = 304,
        shift = util.by_pixel(-14, -71),
        scale = 0.5
      }
    },
    { -- d
      trunk =
      {
        width = 172,
        height = 268,
        shift = util.by_pixel(-2, -49),
        scale = 0.5
      },
      stump =
      {
        width = 84,
        height = 76,
        shift = util.by_pixel(0, -1),
        scale = 0.5
      },
      shadow =
      {
        width = 290,
        height = 172,
        shift = util.by_pixel(68, 1),
        scale = 0.5
      },
      leaves =
      {
        width = 230,
        height = 290,
        shift = util.by_pixel(0, -66),
        scale = 0.5
      },
      normal =
      {
        width = 232,
        height = 248,
        shift = util.by_pixel(1, -76.5),
        scale = 0.5
      }
    },
    { -- e
      trunk =
      {
        width = 204,
        height = 286,
        shift = util.by_pixel(0, -53),
        scale = 0.5
      },
      stump =
      {
        width = 88,
        height = 78,
        shift = util.by_pixel(1, -1),
        scale = 0.5
      },
      shadow =
      {
        width = 318,
        height = 166,
        shift = util.by_pixel(69, -1),
        scale = 0.5
      },
      leaves =
      {
        width = 244,
        height = 292,
        shift = util.by_pixel(3, -63),
        scale = 0.5
      },
      normal =
      {
        width = 242,
        height = 238,
        shift = util.by_pixel(4, -75.5),
        scale = 0.5
      }
    },
    { -- f
      trunk =
      {
        width = 196,
        height = 280,
        shift = util.by_pixel(-3, -53),
        scale = 0.5
      },
      stump =
      {
        width = 82,
        height = 76,
        shift = util.by_pixel(0, -2),
        scale = 0.5
      },
      shadow =
      {
        width = 270,
        height = 188,
        shift = util.by_pixel(57, -5),
        scale = 0.5
      },
      leaves =
      {
        width = 256,
        height = 282,
        shift = util.by_pixel(-5, -74),
        scale = 0.5
      },
      normal =
      {
        width = 254,
        height = 264,
        shift = util.by_pixel(-4, -77),
        scale = 0.5
      }
    },
    { -- g
      trunk =
      {
        width = 180,
        height = 218,
        shift = util.by_pixel(8, -39),
        scale = 0.5
      },
      stump =
      {
        width = 86,
        height = 72,
        shift = util.by_pixel(0, -2),
        scale = 0.5
      },
      shadow =
      {
        width = 266,
        height = 154,
        shift = util.by_pixel(60, -2),
        scale = 0.5
      },
      leaves =
      {
        width = 222,
        height = 258,
        shift = util.by_pixel(10, -54),
        scale = 0.5
      },
      normal =
      {
        width = 222,
        height = 222,
        shift = util.by_pixel(10.5, -61),
        scale = 0.5
      }
    },
    { -- h
      trunk =
      {
        width = 166,
        height = 246,
        shift = util.by_pixel(-10, -42),
        scale = 0.5
      },
      stump =
      {
        width = 84,
        height = 76,
        shift = util.by_pixel(0, 0),
        scale = 0.5
      },
      shadow =
      {
        width = 288,
        height = 146,
        shift = util.by_pixel(47, 1),
        scale = 0.5
      },
      leaves =
      {
        width = 228,
        height = 242,
        shift = util.by_pixel(-10, -53),
        scale = 0.5
      },
      normal =
      {
        width = 226,
        height = 218,
        shift = util.by_pixel(-9, -57.5),
        scale = 0.5
      }
    },
    { -- i
      trunk =
      {
        width = 142,
        height = 204,
        shift = util.by_pixel(1, -35),
        scale = 0.5
      },
      stump =
      {
        width = 80,
        height = 72,
        shift = util.by_pixel(2, -2),
        scale = 0.5
      },
      shadow =
      {
        width = 222,
        height = 140,
        shift = util.by_pixel(48, -1),
        scale = 0.5
      },
      leaves =
      {
        width = 182,
        height = 218,
        shift = util.by_pixel(-1, -54),
        scale = 0.5
      },
      normal =
      {
        width = 184,
        height = 206,
        shift = util.by_pixel(-0.5, -56.5),
        scale = 0.5
      }
    },
    { -- j
      trunk =
      {
        width = 154,
        height = 198,
        shift = util.by_pixel(-2, -34),
        scale = 0.5
      },
      stump =
      {
        width = 80,
        height = 80,
        shift = util.by_pixel(1, -5),
        scale = 0.5
      },
      shadow =
      {
        width = 258,
        height = 126,
        shift = util.by_pixel(53, 0),
        scale = 0.5
      },
      leaves =
      {
        width = 200,
        height = 200,
        shift = util.by_pixel(2, -44),
        scale = 0.5
      },
      normal =
      {
        width = 202,
        height = 170,
        shift = util.by_pixel(2, -50.5),
        scale = 0.5
      }
    },
    { -- k
      trunk =
      {
        width = 226,
        height = 274,
        shift = util.by_pixel(3, -22),
        scale = 0.5
      },
      stump =
      {
        width = 120,
        height = 96,
        shift = util.by_pixel(-9, 11),
        scale = 0.5
      },
      shadow =
      {
        width = 264,
        height = 230,
        shift = util.by_pixel(20, -14),
        scale = 0.5
      },
      leaves =
      {
        width = 204,
        height = 198,
        shift = util.by_pixel(15, -43),
        scale = 0.5
      },
      normal =
      {
        width = 204,
        height = 184,
        shift = util.by_pixel(16, -46.5),
        scale = 0.5
      }
    },
    { -- l
      trunk =
      {
        width = 314,
        height = 124,
        shift = util.by_pixel(-26, 4),
        scale = 0.5
      },
      stump =
      {
        width = 104,
        height = 94,
        shift = util.by_pixel(3, -2),
        scale = 0.5
      },
      shadow =
      {
        width = 354,
        height = 156,
        shift = util.by_pixel(-24, 15),
        scale = 0.5
      },
      leaves =
      {
        width = 328,
        height = 144,
        shift = util.by_pixel(-31, 3),
        scale = 0.5
      },
      normal =
      {
        width = 242,
        height = 146,
        shift = util.by_pixel(-51, 3.5),
        scale = 0.5
      }
    }
  },
  { -- tree-08
    { -- a
      trunk =
      {
        width = 210,
        height = 286,
        shift = util.by_pixel(-5, -58),
        scale = 0.5
      },
      stump =
      {
        width = 76,
        height = 70,
        shift = util.by_pixel(3, -4),
        scale = 0.5
      },
      shadow =
      {
        width = 310,
        height = 222,
        shift = util.by_pixel(71, 2),
        scale = 0.5
      },
      leaves =
      {
        width = 262,
        height = 282,
        shift = util.by_pixel(-6, -77),
        scale = 0.5
      },
      normal =
      {
        width = 260,
        height = 222,
        shift = util.by_pixel(-5, -91),
        scale = 0.5
      }
    },
    { -- b
      trunk =
      {
        width = 238,
        height = 276,
        shift = util.by_pixel(-3, -55),
        scale = 0.5
      },
      stump =
      {
        width = 76,
        height = 68,
        shift = util.by_pixel(1, -3),
        scale = 0.5
      },
      shadow =
      {
        width = 322,
        height = 178,
        shift = util.by_pixel(77, -5),
        scale = 0.5
      },
      leaves =
      {
        width = 322,
        height = 306,
        shift = util.by_pixel(-3, -70),
        scale = 0.5
      },
      normal =
      {
        width = 322,
        height = 206,
        shift = util.by_pixel(-2, -95),
        scale = 0.5
      }
    },
    { -- c
      trunk =
      {
        width = 210,
        height = 300,
        shift = util.by_pixel(3, -63),
        scale = 0.5
      },
      stump =
      {
        width = 72,
        height = 66,
        shift = util.by_pixel(1, -4),
        scale = 0.5
      },
      shadow =
      {
        width = 326,
        height = 228,
        shift = util.by_pixel(72, -2),
        scale = 0.5
      },
      leaves =
      {
        width = 252,
        height = 294,
        shift = util.by_pixel(6, -83),
        scale = 0.5
      },
      normal =
      {
        width = 254,
        height = 260,
        shift = util.by_pixel(6.5, -90),
        scale = 0.5
      }
    },
    { -- d
      trunk =
      {
        width = 166,
        height = 228,
        shift = util.by_pixel(1, -45),
        scale = 0.5
      },
      stump =
      {
        width = 74,
        height = 68,
        shift = util.by_pixel(4, -5),
        scale = 0.5
      },
      shadow =
      {
        width = 274,
        height = 170,
        shift = util.by_pixel(71, 7),
        scale = 0.5
      },
      leaves =
      {
        width = 214,
        height = 220,
        shift = util.by_pixel(0, -73),
        scale = 0.5
      },
      normal =
      {
        width = 216,
        height = 182,
        shift = util.by_pixel(0.5, -82),
        scale = 0.5
      }
    },
    { -- e
      trunk =
      {
        width = 172,
        height = 242,
        shift = util.by_pixel(-7, -49),
        scale = 0.5
      },
      stump =
      {
        width = 76,
        height = 62,
        shift = util.by_pixel(3, -4),
        scale = 0.5
      },
      shadow =
      {
        width = 296,
        height = 150,
        shift = util.by_pixel(65, 5),
        scale = 0.5
      },
      leaves =
      {
        width = 228,
        height = 210,
        shift = util.by_pixel(2, -71),
        scale = 0.5
      },
      normal =
      {
        width = 228,
        height = 166,
        shift = util.by_pixel(2.5, -79.5),
        scale = 0.5
      }
    },
    { -- f
      trunk =
      {
        width = 166,
        height = 272,
        shift = util.by_pixel(-3, -55),
        scale = 0.5
      },
      stump =
      {
        width = 70,
        height = 64,
        shift = util.by_pixel(-1, -3),
        scale = 0.5
      },
      shadow =
      {
        width = 274,
        height = 170,
        shift = util.by_pixel(63, -7),
        scale = 0.5
      },
      leaves =
      {
        width = 218,
        height = 294,
        shift = util.by_pixel(-2, -67),
        scale = 0.5
      },
      normal =
      {
        width = 216,
        height = 200,
        shift = util.by_pixel(-1, -90.5),
        scale = 0.5
      }
    },
    { -- g
      trunk =
      {
        width = 146,
        height = 222,
        shift = util.by_pixel(14, -43),
        scale = 0.5
      },
      stump =
      {
        width = 68,
        height = 56,
        shift = util.by_pixel(3, -2),
        scale = 0.5
      },
      shadow =
      {
        width = 272,
        height = 138,
        shift = util.by_pixel(64, -8),
        scale = 0.5
      },
      leaves =
      {
        width = 190,
        height = 192,
        shift = util.by_pixel(12, -71),
        scale = 0.5
      },
      normal =
      {
        width = 192,
        height = 164,
        shift = util.by_pixel(12.5, -77),
        scale = 0.5
      }
    },
    { -- h
      trunk =
      {
        width = 160,
        height = 190,
        shift = util.by_pixel(-10, -34),
        scale = 0.5
      },
      stump =
      {
        width = 62,
        height = 58,
        shift = util.by_pixel(-1, -1),
        scale = 0.5
      },
      shadow =
      {
        width = 224,
        height = 128,
        shift = util.by_pixel(53, 7),
        scale = 0.5
      },
      leaves =
      {
        width = 218,
        height = 174,
        shift = util.by_pixel(-9, -54),
        scale = 0.5
      },
      normal =
      {
        width = 218,
        height = 152,
        shift = util.by_pixel(-8.5, -58.5),
        scale = 0.5
      }
    },
    { -- i
      trunk =
      {
        width = 78,
        height = 176,
        shift = util.by_pixel(-2, -33),
        scale = 0.5
      },
      stump =
      {
        width = 68,
        height = 62,
        shift = util.by_pixel(2, -4),
        scale = 0.5
      },
      shadow =
      {
        width = 186,
        height = 102,
        shift = util.by_pixel(45, -5),
        scale = 0.5
      },
      leaves =
      {
        width = 130,
        height = 168,
        shift = util.by_pixel(3, -60),
        scale = 0.5
      },
      normal =
      {
        width = 128,
        height = 154,
        shift = util.by_pixel(4, -62.5),
        scale = 0.5
      }
    },
    { -- j
      trunk =
      {
        width = 88,
        height = 180,
        shift = util.by_pixel(3, -33),
        scale = 0.5
      },
      stump =
      {
        width = 64,
        height = 64,
        shift = util.by_pixel(3, -4),
        scale = 0.5
      },
      shadow =
      {
        width = 208,
        height = 100,
        shift = util.by_pixel(46, -2),
        scale = 0.5
      },
      leaves =
      {
        width = 162,
        height = 160,
        shift = util.by_pixel(3, -56),
        scale = 0.5
      },
      normal =
      {
        width = 162,
        height = 148,
        shift = util.by_pixel(4, -58.5),
        scale = 0.5
      }
    },
    { -- k
      trunk =
      {
        width = 300,
        height = 218,
        shift = util.by_pixel(-22, -24),
        scale = 0.5
      },
      stump =
      {
        width = 110,
        height = 78,
        shift = util.by_pixel(12, 0),
        scale = 0.5
      },
      shadow =
      {
        width = 320,
        height = 180,
        shift = util.by_pixel(-18, -16),
        scale = 0.5
      },
      leaves =
      {
        width = 308,
        height = 240,
        shift = util.by_pixel(-34, -35),
        scale = 0.5
      },
      normal =
      {
        width = 180,
        height = 188,
        shift = util.by_pixel(-66.5, -46.5),
        scale = 0.5
      }
    },
    { -- l
      trunk =
      {
        width = 274,
        height = 204,
        shift = util.by_pixel(25, 10),
        scale = 0.5
      },
      stump =
      {
        width = 102,
        height = 92,
        shift = util.by_pixel(-1, -1),
        scale = 0.5
      },
      shadow =
      {
        width = 324,
        height = 216,
        shift = util.by_pixel(42, 24),
        scale = 0.5
      },
      leaves =
      {
        width = 246,
        height = 198,
        shift = util.by_pixel(48, 9),
        scale = 0.5
      },
      normal =
      {
        width = 200,
        height = 108,
        shift = util.by_pixel(60, 28),
        scale = 0.5
      }
    }
  },
  { -- tree-09
    { -- a
      trunk =
      {
        width = 308,
        height = 392,
        shift = util.by_pixel(0, -68),
        scale = 0.5
      },
      stump =
      {
        width = 182,
        height = 124,
        shift = util.by_pixel(-4, -1),
        scale = 0.5
      },
      shadow =
      {
        width = 458,
        height = 214,
        shift = util.by_pixel(86, 0),
        scale = 0.5
      },
      leaves =
      {
        width = 350,
        height = 390,
        shift = util.by_pixel(0, -78),
        scale = 0.5
      },
      normal =
      {
        width = 350,
        height = 294,
        shift = util.by_pixel(1, -102),
        scale = 0.5
      }
    },
    { -- b
      trunk =
      {
        width = 294,
        height = 390,
        shift = util.by_pixel(8, -69),
        scale = 0.5
      },
      stump =
      {
        width = 178,
        height = 124,
        shift = util.by_pixel(5, -2),
        scale = 0.5
      },
      shadow =
      {
        width = 374,
        height = 226,
        shift = util.by_pixel(82, 7),
        scale = 0.5
      },
      leaves =
      {
        width = 334,
        height = 368,
        shift = util.by_pixel(7, -88),
        scale = 0.5
      },
      normal =
      {
        width = 336,
        height = 306,
        shift = util.by_pixel(8, -102),
        scale = 0.5
      }
    },
    { -- c
      trunk =
      {
        width = 258,
        height = 392,
        shift = util.by_pixel(-3, -65),
        scale = 0.5
      },
      stump =
      {
        width = 144,
        height = 128,
        shift = util.by_pixel(-3, 1),
        scale = 0.5
      },
      shadow =
      {
        width = 364,
        height = 222,
        shift = util.by_pixel(73, -4),
        scale = 0.5
      },
      leaves =
      {
        width = 266,
        height = 408,
        shift = util.by_pixel(3, -78),
        scale = 0.5
      },
      normal =
      {
        width = 268,
        height = 356,
        shift = util.by_pixel(3.5, -89.5),
        scale = 0.5
      }
    },
    { -- d
      trunk =
      {
        width = 264,
        height = 348,
        shift = util.by_pixel(4, -56),
        scale = 0.5
      },
      stump =
      {
        width = 146,
        height = 140,
        shift = util.by_pixel(1, -4),
        scale = 0.5
      },
      shadow =
      {
        width = 344,
        height = 232,
        shift = util.by_pixel(80, -1),
        scale = 0.5
      },
      leaves =
      {
        width = 284,
        height = 308,
        shift = util.by_pixel(-1, -76),
        scale = 0.5
      },
      normal =
      {
        width = 282,
        height = 256,
        shift = util.by_pixel(0, -87.5),
        scale = 0.5
      }
    },
    { -- e
      trunk =
      {
        width = 252,
        height = 272,
        shift = util.by_pixel(10, -44),
        scale = 0.5
      },
      stump =
      {
        width = 126,
        height = 100,
        shift = util.by_pixel(-1, -1),
        scale = 0.5
      },
      shadow =
      {
        width = 306,
        height = 190,
        shift = util.by_pixel(73, 13),
        scale = 0.5
      },
      leaves =
      {
        width = 280,
        height = 264,
        shift = util.by_pixel(12, -56),
        scale = 0.5
      },
      normal =
      {
        width = 278,
        height = 224,
        shift = util.by_pixel(13, -65),
        scale = 0.5
      }
    },
    { -- f
      trunk =
      {
        width = 246,
        height = 286,
        shift = util.by_pixel(-19, -47),
        scale = 0.5
      },
      stump =
      {
        width = 132,
        height = 98,
        shift = util.by_pixel(4, 0),
        scale = 0.5
      },
      shadow =
      {
        width = 282,
        height = 184,
        shift = util.by_pixel(55, 8),
        scale = 0.5
      },
      leaves =
      {
        width = 260,
        height = 288,
        shift = util.by_pixel(-11, -58),
        scale = 0.5
      },
      normal =
      {
        width = 258,
        height = 254,
        shift = util.by_pixel(-9.5, -66.5),
        scale = 0.5
      }
    },
    { -- g
      trunk =
      {
        width = 240,
        height = 312,
        shift = util.by_pixel(-11, -52),
        scale = 0.5
      },
      stump =
      {
        width = 126,
        height = 104,
        shift = util.by_pixel(0, 0),
        scale = 0.5
      },
      shadow =
      {
        width = 310,
        height = 182,
        shift = util.by_pixel(55, -14),
        scale = 0.5
      },
      leaves =
      {
        width = 266,
        height = 296,
        shift = util.by_pixel(-13, -67),
        scale = 0.5
      },
      normal =
      {
        width = 266,
        height = 218,
        shift = util.by_pixel(-12.5, -85.5),
        scale = 0.5
      }
    },
    { -- h
      trunk =
      {
        width = 256,
        height = 312,
        shift = util.by_pixel(18, -52),
        scale = 0.5
      },
      stump =
      {
        width = 122,
        height = 102,
        shift = util.by_pixel(0, 1),
        scale = 0.5
      },
      shadow =
      {
        width = 296,
        height = 192,
        shift = util.by_pixel(75, -10),
        scale = 0.5
      },
      leaves =
      {
        width = 250,
        height = 292,
        shift = util.by_pixel(18, -64),
        scale = 0.5
      },
      normal =
      {
        width = 238,
        height = 216,
        shift = util.by_pixel(17, -83.5),
        scale = 0.5
      }
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
      scale = 5
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
      scale = 5
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
      scale = 5
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
      scale = 5
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
      scale = 5
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
      scale = 5
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
      scale = 5
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
      scale = 5
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
      scale = 5
    },
    rotate = false,
    orientation_to_variation = false
  }
end
data:extend
{
  {
    type = "noise-expression",
    name = "tree_01",
    expression = "min(0.45, trees_forest_path_cutout_faded,\z
                      min(0,\z
                          asymmetric_ramps{input=temperature, from_bottom=0, from_top=10, to_top=14, to_bottom=15},\z
                          asymmetric_ramps{input=moisture, from_bottom=0.6, from_top=0.7, to_top=1, to_bottom=2})\z
                      + min(0, distance/20 - 3)\z
                      - 0.5 + 0.2 * control:trees:size\z
                      + tree_small_noise * 0.1\z
                      + multioctave_noise{x = x,\z
                                          y = y,\z
                                          persistence = 0.65,\z
                                          seed0 = map_seed,\z
                                          seed1 = 'tree-01',\z
                                          octaves = 3,\z
                                          input_scale = 1/25 * control:trees:frequency,\z
                                          output_scale = 0.8})"
  },
  {
    type = "noise-expression",
    name = "tree_02",
    expression = "min(0.4, trees_forest_path_cutout_faded,\z
                      min(0,\z
                          asymmetric_ramps{input=temperature, from_bottom=0, from_top=10, to_top=14, to_bottom=15},\z
                          asymmetric_ramps{input=moisture, from_bottom=0.4, from_top=0.5, to_top=0.7, to_bottom=0.8})\z
                      + min(0, distance/20 - 3)\z
                      - 0.5 + 0.2 * control:trees:size\z
                      + tree_small_noise * 0.1\z
                      + multioctave_noise{x = x,\z
                                          y = y,\z
                                          persistence = 0.65,\z
                                          seed0 = map_seed,\z
                                          seed1 = 'tree-02',\z
                                          octaves = 3,\z
                                          input_scale = 1/25 * control:trees:frequency,\z
                                          output_scale = 0.75})"
  },
  {
    type = "noise-expression",
    name = "tree_02_red",
    expression = "min(0.3, trees_forest_path_cutout_faded,\z
                      min(0,\z
                          asymmetric_ramps{input=temperature, from_bottom=0, from_top=10, to_top=14, to_bottom=15},\z
                          asymmetric_ramps{input=moisture, from_bottom=0.2, from_top=0.3, to_top=0.5, to_bottom=0.6})\z
                      + min(0, distance/20 - 3)\z
                      - 0.5 + 0.2 * control:trees:size\z
                      + tree_small_noise * 0.1\z
                      + multioctave_noise{x = x,\z
                                          y = y,\z
                                          persistence = 0.65,\z
                                          seed0 = map_seed,\z
                                          seed1 = 'tree-02-red',\z
                                          octaves = 3,\z
                                          input_scale = 1/25 * control:trees:frequency,\z
                                          output_scale = 0.7})"
  },
  {
    type = "noise-expression",
    name = "tree_03",
    expression = "min(0.4, trees_forest_path_cutout_faded,\z
                      min(0,\z
                            asymmetric_ramps{input=temperature, from_bottom=15, from_top=16, to_top=35, to_bottom=45},\z
                            asymmetric_ramps{input=moisture, from_bottom=0.4, from_top=0.5, to_top=0.7, to_bottom=0.8})\z
                        + min(0, distance/20 - 3)\z
                        - 0.5 + 0.2 * control:trees:size\z
                        + tree_small_noise * 0.1\z
                        + multioctave_noise{x = x,\z
                                            y = y,\z
                                            persistence = 0.65,\z
                                            seed0 = map_seed,\z
                                            seed1 = 'tree-03',\z
                                            octaves = 3,\z
                                            input_scale = 1/35 * control:trees:frequency,\z
                                            output_scale = 0.75})"
  },
  {
    type = "noise-expression",
    name = "tree_04",
    expression = "min(0.45, trees_forest_path_cutout_faded,\z
                      min(0,\z
                          asymmetric_ramps{input=temperature, from_bottom=13, from_top=14, to_top=16, to_bottom=17},\z
                          asymmetric_ramps{input=moisture, from_bottom=0.7, from_top=0.9, to_top=1, to_bottom=2})\z
                      + min(0, distance/20 - 3)\z
                      - 0.5 + 0.2 * control:trees:size\z
                      + tree_small_noise * 0.1\z
                      + multioctave_noise{x = x,\z
                                          y = y,\z
                                          persistence = 0.65,\z
                                          seed0 = map_seed,\z
                                          seed1 = 'tree-04',\z
                                          octaves = 3,\z
                                          input_scale = 1/30 * control:trees:frequency,\z
                                          output_scale = 0.8})"
  },
  {
    type = "noise-expression",
    name = "tree_05",
    expression = "min(0.45, trees_forest_path_cutout_faded,\z
                      min(0,\z
                          asymmetric_ramps{input=temperature, from_bottom=15, from_top=16, to_top=35, to_bottom=45},\z
                          asymmetric_ramps{input=moisture, from_bottom=0.6, from_top=0.7, to_top=1, to_bottom=2})\z
                      + min(0, distance/20 - 3)\z
                      - 0.45 + 0.2 * control:trees:size\z
                      + tree_small_noise * 0.1\z
                      + multioctave_noise{x = x,\z
                                          y = y,\z
                                          persistence = 0.65,\z
                                          seed0 = map_seed,\z
                                          seed1 = 'tree-05',\z
                                          octaves = 3,\z
                                          input_scale = 1/40 * control:trees:frequency,\z
                                          output_scale = 0.8})"
  },
  {
    type = "noise-expression",
    name = "tree_06",
    expression = "min(0.2, trees_forest_path_cutout_faded,\z
                      min(0,\z
                          asymmetric_ramps{input=temperature, from_bottom=0, from_top=10, to_top=14, to_bottom=15},\z
                          asymmetric_ramps{input=moisture, from_bottom=0.1, from_top=0.2, to_top=0.3, to_bottom=0.4})\z
                      + min(0, distance/20 - 3)\z
                      - 0.5 + 0.2 * control:trees:size\z
                      + tree_small_noise * 0.1\z
                      + multioctave_noise{x = x,\z
                                          y = y,\z
                                          persistence = 0.65,\z
                                          seed0 = map_seed,\z
                                          seed1 = 'tree-06',\z
                                          octaves = 3,\z
                                          input_scale = 1/22 * control:trees:frequency,\z
                                          output_scale = 0.6})"
  },
  {
    type = "noise-expression",
    name = "tree_06_brown",
    expression = "min(0.1, trees_forest_path_cutout_faded,\z
                      min(0,\z
                          asymmetric_ramps{input=temperature, from_bottom=0, from_top=10, to_top=14, to_bottom=15},\z
                          asymmetric_ramps{input=moisture, from_bottom=0, from_top=0.1, to_top=0.2, to_bottom=0.3})\z
                      + min(0, distance/20 - 3)\z
                      - 0.5 + 0.2 * control:trees:size\z
                      + tree_small_noise * 0.1\z
                      + multioctave_noise{x = x,\z
                                          y = y,\z
                                          persistence = 0.65,\z
                                          seed0 = map_seed,\z
                                          seed1 = 'tree-06-brown',\z
                                          octaves = 3,\z
                                          input_scale = 1/22 * control:trees:frequency,\z
                                          output_scale = 0.5})"
  },
  {
    type = "noise-expression",
    name = "tree_07",
    expression = "min(0.4, trees_forest_path_cutout_faded,\z
                      min(0,\z
                          asymmetric_ramps{input=temperature, from_bottom=13, from_top=14, to_top=16, to_bottom=17},\z
                          asymmetric_ramps{input=moisture, from_bottom=0.5, from_top=0.6, to_top=0.9, to_bottom=1})\z
                      + min(0, distance/20 - 3)\z
                      - 0.45 + 0.2 * control:trees:size\z
                      + tree_small_noise * 0.1\z
                      + multioctave_noise{x = x,\z
                                          y = y,\z
                                          persistence = 0.65,\z
                                          seed0 = map_seed,\z
                                          seed1 = 'tree-07',\z
                                          octaves = 3,\z
                                          input_scale = 1/40 * control:trees:frequency,\z
                                          output_scale = 0.75})"
  },
  {
    type = "noise-expression",
    name = "tree_08",
    expression = "min(0.3, trees_forest_path_cutout_faded,\z
                      min(0,\z
                          asymmetric_ramps{input=temperature, from_bottom=13, from_top=14, to_top=16, to_bottom=17},\z
                          asymmetric_ramps{input=moisture, from_bottom=0.3, from_top=0.4, to_top=0.6, to_bottom=0.7})\z
                      + min(0, distance/20 - 3)\z
                      - 0.5 + 0.2 * control:trees:size\z
                      + tree_small_noise * 0.1\z
                      + multioctave_noise{x = x,\z
                                          y = y,\z
                                          persistence = 0.65,\z
                                          seed0 = map_seed,\z
                                          seed1 = 'tree-08',\z
                                          octaves = 3,\z
                                          input_scale = 1/30 * control:trees:frequency,\z
                                          output_scale = 0.7})"
  },
  {
    type = "noise-expression",
    name = "tree_08_brown",
    expression = "min(0.2, trees_forest_path_cutout_faded,\z
                      min(0,\z
                          asymmetric_ramps{input=temperature, from_bottom=13, from_top=14, to_top=16, to_bottom=17},\z
                          asymmetric_ramps{input=moisture, from_bottom=0.2, from_top=0.3, to_top=0.4, to_bottom=0.5})\z
                      + min(0, distance/20 - 3)\z
                      - 0.5 + 0.2 * control:trees:size\z
                      + tree_small_noise * 0.1\z
                      + multioctave_noise{x = x,\z
                                          y = y,\z
                                          persistence = 0.65,\z
                                          seed0 = map_seed,\z
                                          seed1 = 'tree-08-brown',\z
                                          octaves = 3,\z
                                          input_scale = 1/30 * control:trees:frequency,\z
                                          output_scale = 0.6})"
  },
  {
    type = "noise-expression",
    name = "tree_08_red",
    expression = "min(0.1, trees_forest_path_cutout_faded,\z
                      min(0,\z
                          asymmetric_ramps{input=temperature, from_bottom=13, from_top=14, to_top=16, to_bottom=17},\z
                          asymmetric_ramps{input=moisture, from_bottom=0.1, from_top=0.2, to_top=0.3, to_bottom=0.4})\z
                      + min(0, distance/20 - 3)\z
                      - 0.5 + 0.2 * control:trees:size\z
                      + tree_small_noise * 0.1\z
                      + multioctave_noise{x = x,\z
                                          y = y,\z
                                          persistence = 0.65,\z
                                          seed0 = map_seed,\z
                                          seed1 = 'tree-08-red',\z
                                          octaves = 3,\z
                                          input_scale = 1/30 * control:trees:frequency,\z
                                          output_scale = 0.5})"
  },
  {
    type = "noise-expression",
    name = "tree_09",
    expression = "min(0.3, trees_forest_path_cutout_faded,\z
                      min(0,\z
                          asymmetric_ramps{input=temperature, from_bottom=15, from_top=16, to_top=35, to_bottom=45},\z
                          asymmetric_ramps{input=moisture, from_bottom=0.2, from_top=0.3, to_top=0.5, to_bottom=0.6})\z
                      + min(0, distance/20 - 3)\z
                      - 0.5 + 0.2 * control:trees:size\z
                      + tree_small_noise * 0.1\z
                      + multioctave_noise{x = x,\z
                                          y = y,\z
                                          persistence = 0.65,\z
                                          seed0 = map_seed,\z
                                          seed1 = 'tree-09',\z
                                          octaves = 3,\z
                                          input_scale = 1/25 * control:trees:frequency,\z
                                          output_scale = 0.7})"
  },
  {
    type = "noise-expression",
    name = "tree_09_brown",
    expression = "min(0.2, trees_forest_path_cutout_faded,\z
                      min(0,\z
                          asymmetric_ramps{input=temperature, from_bottom=15, from_top=16, to_top=35, to_bottom=45},\z
                          asymmetric_ramps{input=moisture, from_bottom=0.1, from_top=0.2, to_top=0.3, to_bottom=0.4})\z
                      + min(0, distance/20 - 3)\z
                      - 0.5 + 0.2 * control:trees:size\z
                      + tree_small_noise * 0.1\z
                      + multioctave_noise{x = x,\z
                                          y = y,\z
                                          persistence = 0.65,\z
                                          seed0 = map_seed,\z
                                          seed1 = 'tree-09-brown',\z
                                          octaves = 3,\z
                                          input_scale = 1/25 * control:trees:frequency,\z
                                          output_scale = 0.6})"
  },
  {
    type = "noise-expression",
    name = "tree_09_red",
    expression = "min(0.1, trees_forest_path_cutout_faded,\z
                      min(0,\z
                          asymmetric_ramps{input=temperature, from_bottom=15, from_top=16, to_top=35, to_bottom=45},\z
                          asymmetric_ramps{input=moisture, from_bottom=0, from_top=0.1, to_top=0.2, to_bottom=0.3})\z
                      + min(0, distance/20 - 3)\z
                      - 0.5 + 0.2 * control:trees:size\z
                      + tree_small_noise * 0.1\z
                      + multioctave_noise{x = x,\z
                                          y = y,\z
                                          persistence = 0.65,\z
                                          seed0 = map_seed,\z
                                          seed1 = 'tree-09-red',\z
                                          octaves = 3,\z
                                          input_scale = 1/25 * control:trees:frequency,\z
                                          output_scale = 0.5})"
  },
  {
    type = "noise-expression",
    name = "tree_dry_hairy",
    expression = "0.2 * max(tree_05, tree_06, tree_06_brown) * clamp(1 - tree_small_noise, 0, 2)"
  },
  {
    type = "noise-expression",
    name = "tree_dead_dry_hairy",
    expression = "0.2 * max(tree_05, tree_06, tree_06_brown, tree_09, tree_09_brown, tree_09_red) * clamp(1 - tree_small_noise, 0, 2)"
  },
  {
    type = "noise-expression",
    name = "tree_dead_grey_trunk",
    expression = "max(0.2 * max(tree_dead_desert, tree_02, tree_02_red, tree_03, tree_04) * clamp(1 - tree_small_noise, 0, 2), tree_dead_desert)"
  },
  {
    type = "noise-expression",
    name = "tree_dry", -- stumpy
    expression = "0.2 * max(tree_01,  tree_09, tree_09_brown, tree_09_red) * clamp(1 - tree_small_noise, 0, 2)"
  },
  {
    type = "noise-expression",
    name = "tree_dead_desert",
    expression = "0.2 * max(tree_08, tree_08_brown, tree_08_red, tree_08_extended, desert) * clamp(1 - tree_small_noise, 0, 2)",
    local_expressions = {
      tree_08_extended = "min(0.1, trees_forest_path_cutout_faded,\z
                              min(0,\z
                                  asymmetric_ramps{input=temperature, from_bottom=13, from_top=14, to_top=16, to_bottom=17},\z
                                  asymmetric_ramps{input=moisture, from_bottom=0.05, from_top=0.15, to_top=0.3, to_bottom=0.4})\z
                              + (min(0, distance/20 - 3) - 0.5 + 0.2 * control:trees:size)\z
                              + tree_noise)",
      desert = "min(0.1,\z
                    trees_forest_path_cutout_faded,\z
                    min(0, asymmetric_ramps{input=moisture, from_bottom=-0.2, from_top=-0.1, to_top=0.1, to_bottom=0.2})\z
                    + (min(0, distance/20 - 3) - 0.5 + 0.2 * control:trees:size)\z
                    + min(tree_noise, desert_noise + 0.2))",
      tree_noise = "multioctave_noise{x = x,\z
                                      y = y,\z
                                      persistence = 0.65,\z
                                      seed0 = map_seed,\z
                                      seed1 = 'tree-08-red',\z
                                      octaves = 3,\z
                                      input_scale = 1/30 * control:trees:frequency,\z
                                      output_scale = 0.5}",
      desert_noise = "multioctave_noise{x = x,\z
                                        y = y,\z
                                        persistence = 0.65,\z
                                        seed0 = map_seed,\z
                                        seed1 = 'tree-08-desert',\z
                                        octaves = 3,\z
                                        input_scale = 1/50 * control:trees:frequency,\z
                                        output_scale = 0.7}"
    }
  }
}
local tree_autoplace = {
  ['tree-01'] = {
    control = "trees",
    order = "a[tree]-b[forest]-a[wet]-c[cold]",
    probability_expression = "tree_01",
    richness_expression = "clamp(random_penalty_at(6, 1), 0, 1)"
  },
  ['tree-02'] = {
    control = "trees",
    order = "a[tree]-b[forest]-b[moist]-b[cold]",
    probability_expression = "tree_02",
    richness_expression = "clamp(random_penalty_at(6, 1), 0, 1)"
  },
  ['tree-02-red'] = {
    control = "trees",
    order = "a[tree]-b[forest]-c[medium]-b[cold]",
    probability_expression = "tree_02_red",
    richness_expression = "clamp(random_penalty_at(6, 1), 0, 1)"
  },
  ['tree-03'] = {
    control = "trees",
    order = "a[tree]-b[forest]-b[moist]-c[hot]",
    probability_expression = "tree_03",
    richness_expression = "clamp(random_penalty_at(6, 1), 0, 1)"
  },
  ['tree-04'] = {
    control = "trees",
    order = "a[tree]-b[forest]-a[wet]-b[medium]",
    probability_expression = "tree_04",
    richness_expression = "clamp(random_penalty_at(6, 1), 0, 1)"
  },
  ['tree-05'] = {
    control = "trees",
    order = "a[tree]-b[forest]-a[wet]-a[hot]",
    probability_expression = "tree_05",
    richness_expression = "clamp(random_penalty_at(6, 1), 0, 1)"
  },
  ['tree-06'] = {
    control = "trees",
    order = "a[tree]-b[forest]-d[dry]-c[cold]",
    probability_expression = "tree_06",
    richness_expression = "clamp(random_penalty_at(6, 1), 0, 1)"
  },
  ['tree-06-brown'] = {
    control = "trees",
    order = "a[tree]-b[forest]-e[verydry]-c[cold]",
    probability_expression = "tree_06_brown",
    richness_expression = "clamp(random_penalty_at(6, 1), 0, 1)"
  },
  ['tree-07'] = {
    control = "trees",
    order = "a[tree]-b[forest]-b[moist]-a[medium]",
    probability_expression = "tree_07",
    richness_expression = "clamp(random_penalty_at(6, 1), 0, 1)"
  },
  ['tree-08'] = {
    control = "trees",
    order = "a[tree]-b[forest]-c[medium]-a[medium]",
    probability_expression = "tree_08",
    richness_expression = "clamp(random_penalty_at(6, 1), 0, 1)"
  },
  ['tree-08-brown'] = {
    control = "trees",
    order = "a[tree]-b[forest]-d[dry]-b[medium]",
    probability_expression = "tree_08_brown",
    richness_expression = "clamp(random_penalty_at(6, 1), 0, 1)"
  },
  ['tree-08-red'] = {
    control = "trees",
    order = "a[tree]-b[forest]-e[verydry]-b[medium]",
    probability_expression = "tree_08_red",
    richness_expression = "clamp(random_penalty_at(6, 1), 0, 1)"
  },
  ['tree-09'] = {
    control = "trees",
    order = "a[tree]-b[forest]-c[medium]-c[hot]",
    probability_expression = "tree_09",
    richness_expression = "clamp(random_penalty_at(6, 1), 0, 1)"
  },
  ['tree-09-brown'] = {
    control = "trees",
    order = "a[tree]-b[forest]-d[dry]-a[hot]",
    probability_expression = "tree_09_brown",
    richness_expression = "clamp(random_penalty_at(6, 1), 0, 1)"
  },
  ['tree-09-red'] = {
    control = "trees",
    order = "a[tree]-b[forest]-e[verydry]-a[hot]",
    probability_expression = "tree_09_red",
    richness_expression = "clamp(random_penalty_at(6, 1), 0, 1)"
  },
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
    variation_weights = { 1, 1, 1, 1, 1, 1, 1, 1, 0.3, 0.3, 0.05, 0.05},
    enabled = true,
    autoplace = tree_autoplace['tree-01'], --tree_autoplace(30, 5, 0.75, 0.25),
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
    autoplace = tree_autoplace['tree-02'], --tree_autoplace(17, 7, 0.65, 0.1, -0.25),
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
    type = 2,
    variation_weights = { 1, 1, 1, 1, 1, 1, 1, 1, 0.3, 0.3, 0.05, 0.05},
    enabled = true,
    identifier = "red",
    autoplace = tree_autoplace['tree-02-red'], --[[merge{
      tree_autoplace(17, 7, 0.45, 0.05, -0.25),
      sharpness = 0.2
    },]]
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
      {r = 255, g = 117, b = 117}
    },
    get_water_reflection = tree_02_reflection
  },

  {
    type = 3,
    enabled = true,
    -- autoplace = tree_autoplace(25, 5, 0.8, 0.2, 0.1, 1.1),
    autoplace = tree_autoplace['tree-03'], --[[tree_autoplace2
    {
      temperature_optimal = 25,
      temperature_range = 7,
      water_optimal = 0.8,
      water_range = 0.2,
      static_influence = 0.1,
      tree_noise_influence = 1.1,
      richness_base = 0,
      richness_multiplier = 2
    },]]
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
      {r = 231, g = 214, b = 129}
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
    autoplace = tree_autoplace['tree-04'], --tree_autoplace(12, 7, 0.6, 0.2, -0.5),
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
      {r = 169, g = 141, b = 207}
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
    autoplace = tree_autoplace['tree-05'], --tree_autoplace(12, 7, 0.8, 0.2, -5/8),
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
      {r = 253, g = 255, b = 115}
    },
    get_water_reflection = tree_05_reflection
  },
  {
    type = 6,
    enabled = true,
    autoplace = tree_autoplace['tree-06'], --[[merge{
      tree_autoplace(22, 13, 0.10, 0.05, -3/8, 1/2),
      {
        sharpness = 0.2,
        max_probability = 0.2
      }
    },]]
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
    autoplace = tree_autoplace['tree-06-brown'], --[[merge{
      tree_autoplace(22, 13, 0.10, 0.05, -3/8, 1/2),
      {
        sharpness = 0.2,
        max_probability = 0.2
      }
    },]]
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
  },

  {
    type = 7,
    variation_weights = { 1, 1, 1, 1, 1, 1, 1, 1, 0.3, 0.3, 0.05, 0.05},
    enabled = true,
    autoplace = tree_autoplace['tree-07'], --[[merge{
      tree_autoplace(25, 10, 0.20, 0.05, -3/8, 1/2),
      {
        sharpness = 0.2,
        max_probability = 0.2
      }
    },]]
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
  },

  {
    type = 8,
    variation_weights = { 1, 1, 1, 1, 1, 1, 1, 1, 0.3, 0.3, 0.05, 0.05},
    enabled = true,
    autoplace = tree_autoplace['tree-08'], --[[merge{
      tree_autoplace(20, 5, 0.10, 0.10, -1),
      {
        sharpness = 0.4,
        max_probability = 0.35
      }
    },]]
    colors =
    {
      {r = 231, g = 255, b =  83},
      {r = 209, g = 255, b =  58},
      {r = 165, g = 159, b =   4},
      {r = 194, g = 231, b =  73},
      {r = 245, g = 242, b =  44},
      {r = 248, g = 242, b = 102},
      {r = 208, g = 238, b = 118}
    },
    get_water_reflection = tree_08_reflection
  },
  {
    type = 8,
    variation_weights = { 1, 1, 1, 1, 1, 1, 1, 1, 0.3, 0.3, 0.05, 0.05},
    enabled = true,
    identifier = "brown",
    autoplace = tree_autoplace['tree-08-brown'], --[[merge{
      tree_autoplace(20, 5, 0.10, 0.10, -0.999), --this makes much more brown trees
      {
        sharpness = 0.4,
        max_probability = 0.35
      }
    },]]
    colors =
    {
      {r = 255, g = 162, b =  62},
      {r = 255, g = 192, b = 145},
      {r = 255, g = 186, b =  74},
      {r = 255, g = 142, b =  68},
      {r = 255, g = 205, b =  62},
      {r = 255, g = 205, b =  68},
      {r = 255, g = 142, b =  24},
      {r = 255, g =  97, b =  0},
    },
    get_water_reflection = tree_08_reflection
  },
  {
    type = 8,
    variation_weights = { 1, 1, 1, 1, 1, 1, 1, 1, 0.3, 0.3, 0.05, 0.05},
    enabled = true,
    identifier = "red",
    autoplace = tree_autoplace['tree-08-red'], --tree_autoplace(-5, 5, 0.05, 0.05, -5),
    colors =
    {
      {r = 224, g = 109, b =  82},
      {r = 228, g = 107, b = 107},
      {r = 226, g = 136, b = 107},
      {r = 222, g = 125, b = 114}
    },
    get_water_reflection = tree_08_reflection
  },

  {
    type = 9,
    enabled = true,
    drawing_box_vertical_extension = 3,
    autoplace = tree_autoplace['tree-09'], --[[merge{
      tree_autoplace(30, 5, 0.45, 0.05, 0.21),
      { max_probability = 0.5 * 0.5 }
    },]]
    colors =
    {
      {r = 255, g = 186, b =   0},
      {r = 255, g =  96, b =  45},
      {r = 255, g = 204, b =  64},
      {r = 255, g = 212, b =  98},
      {r = 255, g = 193, b =  72},
      {r = 255, g = 103, b =  66},
      {r = 255, g = 151, b =   0}
    },
    get_water_reflection = tree_09_reflection
  },
  {
    type = 9,
    enabled = true,
    identifier = "brown",
    autoplace = tree_autoplace['tree-09-brown'], --[[merge{
      tree_autoplace(25, 10, 0.20, 0.05, -1/2, 1+1/4),
      { max_probability = 0.35 * 0.5 }
    },]]
    colors =
    {
      {r = 231, g = 140, b =   0},
      {r = 255, g = 147, b = 100},
      {r = 221, g =  96, b =  76},
      {r = 255, g = 160, b =  71},
      {r = 255, g = 140, b =  89},
      {r = 255, g = 116, b =  60},
      {r = 255, g = 113, b =  93}
    },
    get_water_reflection = tree_09_reflection
  },
  {
    type = 9,
    enabled = true,
    identifier = "red",
    autoplace = tree_autoplace['tree-09-red'], --[[merge{
      tree_autoplace(15, 10, 0.20, 0.05, -1/2, 1+1/4),
      { max_probability = 0.17 }
    },]]
    colors =
    {
      {r = 231, g = 100, b =   0},
      {r = 255, g = 117, b = 110},
      {r = 221, g =  76, b =  76},
      {r = 255, g = 131, b = 131},
      {r = 255, g = 100, b =  89},
      {r = 255, g =  96, b =  70},
      {r = 255, g =  93, b =  93}
    },
    get_water_reflection = tree_09_reflection
  },

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
  if tree_data.autoplace == nil then error(name .. " missing autoplace") end
  local order = index_to_letter(i) .. "[" .. name .. "]"

  local tree_variations = {}
  for variation_index, variation in ipairs(tree_types[tree_data.type]) do
    local variation_letter = index_to_letter(variation_index)
    local variation_path = type_number .. "/" .. type_name .. "-" .. variation_letter

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
        scale = variation.trunk.scale
      },
      leaves =
      {
        filename = "__base__/graphics/entity/tree/" .. variation_path .. "-leaves.png",
        flags = { "mipmap" },
        width = variation.leaves.width,
        height = variation.leaves.height,
        frame_count = 3,
        shift = variation.leaves.shift,
        scale = variation.leaves.scale
      },
      leaf_generation =
      {
        type = "create-particle",
        particle_name = "leaf-particle",
        offset_deviation = {{-0.5, -0.5}, {0.5, 0.5}},
        initial_height = 2,
        initial_vertical_speed = 0.01,
        initial_height_deviation = 0.05,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0.01,
        only_when_visible = true
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
        repeat_count = 15,
        only_when_visible = true
      },
      leaves_when_damaged = 200,
      leaves_when_destroyed = 35,
      leaves_when_mined_manually = 40,
      leaves_when_mined_automatically = 19,
      branches_when_damaged = 0,
      branches_when_destroyed = 16,
      branches_when_mined_manually = 15,
      branches_when_mined_automatically = 8
    }
    if variation.normal then
      newTree.normal =
      {
        filename = "__base__/graphics/entity/tree/" .. variation_path .. "-normal.png",
        width = variation.normal.width,
        height = variation.normal.height,
        frame_count = 3,
        scale = variation.normal.scale,
        shift = variation.normal.shift
      }
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
        scale = variation.shadow.scale,
        draw_as_shadow = true,
        disable_shadow_distortion_beginning_at_frame = 2
      }
    end

    if tree_data.get_water_reflection then
      newTree.water_reflection = tree_data.get_water_reflection(variation_index - 1)
    end

    tree_variations[#tree_variations + 1] = newTree
  end
  local factoriopedia_alternative = nil
  local factoriopedia_simulation = nil
  if name ~= "tree-01" then
    deconstruction_alternative = "tree-01"
    factoriopedia_alternative = "tree-01"
    ambient_sounds_group = "tree-01"
    ambient_sounds = nil
  else
    ambient_sounds_group = nil
    ambient_sounds = { sounds.tree_ambient, sounds.tree_ambient_night, sounds.tree_insects_night, sounds.tree_ambient_leaves }
    factoriopedia_simulation = simulations.factoriopedia_tree
  end

  if name == "tree-06" or name == "tree-06-brown" then
    ambient_sounds_group = nil
  end

  data:extend(
  {
    {
      type = "tree",
      name = name,
      localised_name = localised_name,
      deconstruction_alternative = deconstruction_alternative,
      factoriopedia_alternative = factoriopedia_alternative,
      factoriopedia_simulation = factoriopedia_simulation,
      icon = "__base__/graphics/icons/" .. name .. ".png",
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
      mined_sound = sounds.tree_mined,
      remains_when_mined = type_name .. "-stump",
      emissions_per_second = tree_emissions,
      max_health = 50,
      map_generator_bounding_box = {{-0.8, -0.8}, {0.8, 0.8}},
      collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
      selection_box = {{-0.9, -2.2}, {0.9, 0.6}},
      drawing_box_vertical_extension = tree_data.drawing_box_vertical_extension or 1.8,
      subgroup = "trees",
      order = "a[tree]-a[nauvis]-a[regular]-" .. order,
      impact_category = "tree",
      autoplace = tree_data.autoplace,
      variations = tree_variations,
      variation_weights = tree_data.variation_weights,
      colors = tree_data.colors,
      darkness_of_burnt_tree = 0.5,
      -- water_reflection = tree_data.water_reflection
      ambient_sounds_group = ambient_sounds_group,
      ambient_sounds = ambient_sounds
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
    if variation.stump then
      local newStump =
      {
        filename = "__base__/graphics/entity/tree/" .. variation_path .. "-stump.png",
        width = variation.stump.width,
        height = variation.stump.height,
        direction_count = 1,
        shift = variation.stump.shift,
        scale = variation.stump.scale
      }
      stump_variations[#stump_variations + 1] = newStump
    else
      local newStump =
      {
        filename = "__base__/graphics/entity/tree/" .. variation_path .. "-trunk.png",
        width = variation.trunk.width,
        height = variation.trunk.height,
        x = variation.trunk.width * 4,
        direction_count = 1,
        shift = variation.trunk.shift,
        scale = variation.trunk.scale
      }
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
      flags = tree_corpse_flags,
      hidden_in_factoriopedia = true,
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
    type = "tree",
    name = "dry-tree",
    icon = "__base__/graphics/icons/dry-tree.png",
    flags = tree_flags,
    minable =
    {
      count = 4,
      mining_particle = "wooden-particle",
      mining_time = 0.5,
      result = "wood"
    },
    deconstruction_alternative = "tree-01",
    factoriopedia_alternative = "tree-01",
    emissions_per_second = dead_tree_emissions,
    max_health = 20,
    collision_box = {{-0.4, -0.8}, {0.4, 0.2}},
    selection_box = {{-0.6, -1.5}, {0.6, 0.3}},
    drawing_box_vertical_extension = 0.3,
    subgroup = "trees",
    order = "a[tree]-a[nauvis]-c[dry-tree]",
    impact_category = "tree",
    autoplace = {
      control = "trees",
      order = "a[tree]-d[dead]-e[dry-tree]",
      probability_expression = "tree_dry",
      richness_expression = "clamp(random_penalty_at(6, 1), 0, 1)"
    },
    pictures =
    {
      --dry-tree
      {
        filename = "__base__/graphics/entity/tree/dry-tree/dry-tree-00.png",
        width = 184,
        height = 122,
        shift = util.by_pixel(13, -15),
        scale = 0.5
      },
      {
        filename = "__base__/graphics/entity/tree/dry-tree/dry-tree-01.png",
        width = 142,
        height = 122,
        shift = util.by_pixel(23.5, -15),
        scale = 0.5
      },
      {
        filename = "__base__/graphics/entity/tree/dry-tree/dry-tree-02.png",
        width = 140,
        height = 115,
        shift = util.by_pixel(24, -13.25),
        scale = 0.5
      },
      {
        filename = "__base__/graphics/entity/tree/dry-tree/dry-tree-03.png",
        width = 151,
        height = 101,
        shift = util.by_pixel(21.25, -9.75),
        scale = 0.5
      },
      {
        filename = "__base__/graphics/entity/tree/dry-tree/dry-tree-04.png",
        width = 149,
        height = 109,
        shift = util.by_pixel(21.75, -11.75),
        scale = 0.5
      },
      {
        filename = "__base__/graphics/entity/tree/dry-tree/dry-tree-05.png",
        width = 146,
        height = 116,
        shift = util.by_pixel(22.5, -13.5),
        scale = 0.5
      },
      {
        filename = "__base__/graphics/entity/tree/dry-tree/dry-tree-06.png",
        width = 141,
        height = 135,
        shift = util.by_pixel(23.75, -18.25),
        scale = 0.5
      },
      {
        filename = "__base__/graphics/entity/tree/dry-tree/dry-tree-07.png",
        width = 166,
        height = 107,
        shift = util.by_pixel(17.5, -11.25),
        scale = 0.5
      },
      {
        filename = "__base__/graphics/entity/tree/dry-tree/dry-tree-08.png",
        width = 138,
        height = 106,
        shift = util.by_pixel(24.5, -10),
        scale = 0.5
      }
    }
  },
  ----------------------------------------------------------------------------------------DEAD-TREE-DESERT
  {
    type = "tree",
    name = "dead-tree-desert",
    icon = "__base__/graphics/icons/dead-tree.png",
    flags = tree_flags,
    minable =
    {
      mining_particle = "wooden-particle",
      mining_time = 0.5,
      result = "wood",
      count = 2
    },
    deconstruction_alternative = "tree-01",
    emissions_per_second = dead_tree_emissions,
    max_health = 20,
    collision_box = {{-0.6, -0.6}, {0.6, 0.6}},
    selection_box = {{-0.8, -0.8}, {0.8, 0.8}},
    drawing_box_vertical_extension = 2.2,
    subgroup = "trees",
    order = "a[tree]-a[nauvis]-b[dead-tree]",
    impact_category = "tree",
    autoplace = {
      control = "trees",
      order = "a[tree]-d[dead]-a[desert]",
      probability_expression = "tree_dead_desert",
      richness_expression = "clamp(random_penalty_at(6, 1), 0, 1)"
    },
    factoriopedia_simulation = simulations.factoriopedia_dead_tree,
    pictures =
    {
      --dead-desert
      {
        filename = "__base__/graphics/entity/tree/dead-tree-desert/dead-tree-desert-00.png",
        width = 398,
        height = 250,
        shift = util.by_pixel(66.5, -32),
        scale = 0.5
      },
      {
        filename = "__base__/graphics/entity/tree/dead-tree-desert/dead-tree-desert-01.png",
        width = 399,
        height = 249,
        shift = util.by_pixel(64.25, -36.75),
        scale = 0.5
      },
      {
        filename = "__base__/graphics/entity/tree/dead-tree-desert/dead-tree-desert-02.png",
        width = 398,
        height = 250,
        shift = util.by_pixel(29.5, -43),
        scale = 0.5
      },
      {
        filename = "__base__/graphics/entity/tree/dead-tree-desert/dead-tree-desert-03.png",
        width = 399,
        height = 249,
        shift = util.by_pixel(25.75, -30.75),
        scale = 0.5
      },
      {
        filename = "__base__/graphics/entity/tree/dead-tree-desert/dead-tree-desert-04.png",
        width = 398,
        height = 249,
        shift = util.by_pixel(38.5, -22.25),
        scale = 0.5
      },
      {
        filename = "__base__/graphics/entity/tree/dead-tree-desert/dead-tree-desert-05.png",
        width = 398,
        height = 250,
        shift = util.by_pixel(64.5, -23),
        scale = 0.5
      },
      {
        filename = "__base__/graphics/entity/tree/dead-tree-desert/dead-tree-desert-06.png",
        width = 398,
        height = 249,
        shift = util.by_pixel(28.5, -14.75),
        scale = 0.5
      },
      {
        filename = "__base__/graphics/entity/tree/dead-tree-desert/dead-tree-desert-07.png",
        width = 398,
        height = 249,
        shift = util.by_pixel(50.5, -40.75),
        scale = 0.5
      },
      {
        filename = "__base__/graphics/entity/tree/dead-tree-desert/dead-tree-desert-08.png",
        width = 398,
        height = 249,
        shift = util.by_pixel(18, -43.75),
        scale = 0.5
      },
      {
        filename = "__base__/graphics/entity/tree/dead-tree-desert/dead-tree-desert-09.png",
        width = 399,
        height = 249,
        shift = util.by_pixel(41.25, -16.75),
        scale = 0.5
      }
    }
  },
  --------------------------------------------------------------------------------------------------------
  {
    type = "tree",
    name = "dead-grey-trunk",
    icon = "__base__/graphics/icons/dead-grey-trunk.png",
    flags = tree_flags,
    minable =
    {
      mining_particle = "wooden-particle",
      mining_time = 0.5,
      result = "wood",
      count = 2
    },
    deconstruction_alternative = "tree-01",
    factoriopedia_alternative = "dry-tree",
    emissions_per_second = dead_tree_emissions,
    max_health = 20,
    collision_box = {{-0.6, -0.6}, {0.6, 0.6}},
    selection_box = {{-0.8, -0.8}, {0.8, 0.8}},
    drawing_box_vertical_extension = 0.4,
    subgroup = "trees",
    order = "a[tree]-a[nauvis]-b[dead-tree]",
    impact_category = "tree",
    autoplace = {
      control = "trees",
      order = "a[tree]-d[dead]-d[grey]",
      probability_expression = "tree_dead_grey_trunk",
      richness_expression = "clamp(random_penalty_at(6, 1), 0, 1)"
    },
    pictures =
    {
      --dead-grey-trunk
      {
        filename = "__base__/graphics/entity/tree/dead-grey-trunk/dead-grey-trunk-00.png",
        width = 217,
        height = 178,
        shift = util.by_pixel(29.75, -25),
        scale = 0.5
      },
      {
        filename = "__base__/graphics/entity/tree/dead-grey-trunk/dead-grey-trunk-01.png",
        width = 205,
        height = 185,
        shift = util.by_pixel(26.75, -24.25),
        scale = 0.5
      },
      {
        filename = "__base__/graphics/entity/tree/dead-grey-trunk/dead-grey-trunk-02.png",
        width = 221,
        height = 179,
        shift = util.by_pixel(29.25, -24.25),
        scale = 0.5
      },
      {
        filename = "__base__/graphics/entity/tree/dead-grey-trunk/dead-grey-trunk-03.png",
        width = 210,
        height = 167,
        shift = util.by_pixel(29, -19.75),
        scale = 0.5
      },
      {
        filename = "__base__/graphics/entity/tree/dead-grey-trunk/dead-grey-trunk-04.png",
        width = 257,
        height = 185,
        shift = util.by_pixel(32.75, -20.75),
        scale = 0.5
      },
      {
        filename = "__base__/graphics/entity/tree/dead-grey-trunk/dead-grey-trunk-05.png",
        width = 226,
        height = 166,
        shift = util.by_pixel(16, -3.5),
        scale = 0.5
      },
      {
        filename = "__base__/graphics/entity/tree/dead-grey-trunk/dead-grey-trunk-06.png",
        width = 226,
        height = 117,
        shift = util.by_pixel(3, 1.25),
        scale = 0.5
      },
      {
        filename = "__base__/graphics/entity/tree/dead-grey-trunk/dead-grey-trunk-07.png",
        width = 215,
        height = 165,
        shift = util.by_pixel(2.75, -1.25),
        scale = 0.5
      },
      {
        filename = "__base__/graphics/entity/tree/dead-grey-trunk/dead-grey-trunk-08.png",
        width = 207,
        height = 176,
        shift = util.by_pixel(7.25, -11),
        scale = 0.5
      },
      {
        filename = "__base__/graphics/entity/tree/dead-grey-trunk/dead-grey-trunk-09.png",
        width = 231,
        height = 120,
        shift = util.by_pixel(-4.75, -3),
        scale = 0.5
      }
    }
  },

  {
    type = "tree",
    name = "dead-dry-hairy-tree",
    icon = "__base__/graphics/icons/dead-dry-hairy-tree.png",
    flags = tree_flags,
    minable =
    {
      mining_particle = "wooden-particle",
      mining_time = 0.5,
      result = "wood",
      count = 2
    },
    deconstruction_alternative = "tree-01",
    factoriopedia_alternative = "dry-tree",
    emissions_per_second = dead_tree_emissions,
    max_health = 20,
    collision_box = {{-0.6, -0.6}, {0.6, 0.6}},
    selection_box = {{-0.8, -0.8}, {0.8, 0.8}},
    subgroup = "trees",
    order = "a[tree]-a[nauvis]-b[dead-tree]",
    impact_category = "tree",
    autoplace = {
      control = "trees",
      order = "a[tree]-d[dead]-c[dead-hairy]",
      probability_expression = "tree_dead_dry_hairy",
      richness_expression = "clamp(random_penalty_at(6, 1), 0, 1)"
    },
    pictures =
    {
      --dead-dry-hairy
      {
        filename = "__base__/graphics/entity/tree/dead-dry-hairy-tree/dead-dry-hairy-tree-00.png",
        width = 388,
        height = 189,
        shift = util.by_pixel(-20, 2),
        scale = 0.5
      },
      {
        filename = "__base__/graphics/entity/tree/dead-dry-hairy-tree/dead-dry-hairy-tree-01.png",
        width = 371,
        height = 301,
        shift = util.by_pixel(-15, -19.75),
        scale = 0.5
      },
      {
        filename = "__base__/graphics/entity/tree/dead-dry-hairy-tree/dead-dry-hairy-tree-02.png",
        width = 324,
        height = 252,
        shift = util.by_pixel(-8.5, -14.5),
        scale = 0.5
      },
      {
        filename = "__base__/graphics/entity/tree/dead-dry-hairy-tree/dead-dry-hairy-tree-03.png",
        width = 358,
        height = 310,
        shift = util.by_pixel(42, -15),
        scale = 0.5
      },
      {
        filename = "__base__/graphics/entity/tree/dead-dry-hairy-tree/dead-dry-hairy-tree-04.png",
        width = 386,
        height = 316,
        shift = util.by_pixel(40, -15),
        scale = 0.5
      },
      {
        filename = "__base__/graphics/entity/tree/dead-dry-hairy-tree/dead-dry-hairy-tree-05.png",
        width = 425,
        height = 285,
        shift = util.by_pixel(35, -18),
        scale = 0.5
      },
      {
        filename = "__base__/graphics/entity/tree/dead-dry-hairy-tree/dead-dry-hairy-tree-06.png",
        width = 424,
        height = 294,
        shift = util.by_pixel(42, -24.5),
        scale = 0.5
      },
      {
        filename = "__base__/graphics/entity/tree/dead-dry-hairy-tree/dead-dry-hairy-tree-07.png",
        width = 385,
        height = 224,
        shift = util.by_pixel(25, -19.5),
        scale = 0.5
      },
      {
        filename = "__base__/graphics/entity/tree/dead-dry-hairy-tree/dead-dry-hairy-tree-08.png",
        width = 341,
        height = 166,
        shift = util.by_pixel(20, 10),
        scale = 0.5
      },
      {
        filename = "__base__/graphics/entity/tree/dead-dry-hairy-tree/dead-dry-hairy-tree-09.png",
        width = 309,
        height = 274,
        shift = util.by_pixel(28.75, 13),
        scale = 0.5
      },
      {
        filename = "__base__/graphics/entity/tree/dead-dry-hairy-tree/dead-dry-hairy-tree-10.png",
        width = 317,
        height = 246,
        shift = util.by_pixel(-7, 11),
        scale = 0.5
      },
      {
        filename = "__base__/graphics/entity/tree/dead-dry-hairy-tree/dead-dry-hairy-tree-11.png",
        width = 335,
        height = 238,
        shift = util.by_pixel(-9, 10),
        scale = 0.5
      }
    }
  },
  {
    type = "tree",
    name = "dry-hairy-tree",
    icon = "__base__/graphics/icons/dry-hairy-tree.png",
    flags = tree_flags,
    minable =
    {
      mining_particle = "wooden-particle",
      mining_time = 0.5,
      result = "wood",
      count = 2
    },
    deconstruction_alternative = "tree-01",
    factoriopedia_alternative = "dry-tree",
    emissions_per_second = dead_tree_emissions,
    max_health = 20,
    collision_box = {{-0.6, -0.6}, {0.6, 0.6}},
    selection_box = {{-0.8, -0.8}, {0.8, 0.8}},
    drawing_box_vertical_extension = 2.7,
    subgroup = "trees",
    order = "a[tree]-a[nauvis]-b[dead-tree]",
    impact_category = "tree",
    autoplace = {
      control = "trees",
      order = "a[tree]-d[dead]-c[hairy]",
      probability_expression = "tree_dry_hairy",
      richness_expression = "clamp(random_penalty_at(6, 1), 0, 1)"
    },
    pictures =
    {
      --dry-hairy-tree
      {
        filename = "__base__/graphics/entity/tree/dry-hairy-tree/dry-hairy-tree-00.png",
        width = 444,
        height = 357,
        shift = util.by_pixel(45.5, -28.75),
        scale = 0.5
      },
      {
        filename = "__base__/graphics/entity/tree/dry-hairy-tree/dry-hairy-tree-01.png",
        width = 506,
        height = 293,
        shift = util.by_pixel(45, -42.75),
        scale = 0.5
      },
      {
        filename = "__base__/graphics/entity/tree/dry-hairy-tree/dry-hairy-tree-02.png",
        width = 493,
        height = 309,
        shift = util.by_pixel(56.25, -31.75),
        scale = 0.5
      },
      {
        filename = "__base__/graphics/entity/tree/dry-hairy-tree/dry-hairy-tree-03.png",
        width = 484,
        height = 303,
        shift = util.by_pixel(68.5, -41.75),
        scale = 0.5
      },
      {
        filename = "__base__/graphics/entity/tree/dry-hairy-tree/dry-hairy-tree-04.png",
        width = 457,
        height = 287,
        shift = util.by_pixel(62.75, -32.75),
        scale = 0.5
      },
      {
        filename = "__base__/graphics/entity/tree/dry-hairy-tree/dry-hairy-tree-05.png",
        width = 459,
        height = 390,
        shift = util.by_pixel(22.25, -33.5),
        scale = 0.5
      },
      {
        filename = "__base__/graphics/entity/tree/dry-hairy-tree/dry-hairy-tree-06.png",
        width = 432,
        height = 272,
        shift = util.by_pixel(46, -19),
        scale = 0.5
      },
      {
        filename = "__base__/graphics/entity/tree/dry-hairy-tree/dry-hairy-tree-07.png",
        width = 368,
        height = 308,
        shift = util.by_pixel(28, -27.5),
        scale = 0.5
      },
      {
        filename = "__base__/graphics/entity/tree/dry-hairy-tree/dry-hairy-tree-08.png",
        width = 429,
        height = 272,
        shift = util.by_pixel(46.75, -52.5),
        scale = 0.5
      }
    }
  }
})
