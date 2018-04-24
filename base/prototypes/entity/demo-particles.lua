function bloodtint()
return {r = 0.6, g = 0.1, b = 0.6}
end

function shadowtint()
return {r = 0, g = 0, b = 0}
end

function bloodparticlescale()
  return 1
end

data:extend(
{
  {
    type = "particle",
    name = "iron-ore-particle",
    flags = {"not-on-map"},
    life_time = 180,
    pictures =
    {
      {
        filename = "__base__/graphics/entity/iron-ore-particle/iron-ore-particle-1.png",
        priority = "extra-high",
        width = 5,
        height = 5,
        frame_count = 1
      },
      {
        filename = "__base__/graphics/entity/iron-ore-particle/iron-ore-particle-2.png",
        priority = "extra-high",
        width = 7,
        height = 5,
        frame_count = 1
      },
      {
        filename = "__base__/graphics/entity/iron-ore-particle/iron-ore-particle-3.png",
        priority = "extra-high",
        width = 6,
        height = 7,
        frame_count = 1
      },
      {
        filename = "__base__/graphics/entity/iron-ore-particle/iron-ore-particle-4.png",
        priority = "extra-high",
        width = 9,
        height = 8,
        frame_count = 1
      }
    },
    shadows =
    {
      {
        filename = "__base__/graphics/entity/iron-ore-particle/iron-ore-particle-shadow-1.png",
        priority = "extra-high",
        width = 5,
        height = 5,
        frame_count = 1
      },
      {
        filename = "__base__/graphics/entity/iron-ore-particle/iron-ore-particle-shadow-2.png",
        priority = "extra-high",
        width = 7,
        height = 5,
        frame_count = 1
      },
      {
        filename = "__base__/graphics/entity/iron-ore-particle/iron-ore-particle-shadow-3.png",
        priority = "extra-high",
        width = 6,
        height = 7,
        frame_count = 1
      },
      {
        filename = "__base__/graphics/entity/iron-ore-particle/iron-ore-particle-shadow-4.png",
        priority = "extra-high",
        width = 9,
        height = 8,
        frame_count = 1
      }
    }
  },
  {
    type = "particle",
    name = "copper-ore-particle",
    flags = {"not-on-map"},
    life_time = 180,
    pictures =
    {
      {
        filename = "__base__/graphics/entity/copper-ore-particle/copper-ore-particle-1.png",
        priority = "extra-high",
        width = 5,
        height = 5,
        frame_count = 1
      },
      {
        filename = "__base__/graphics/entity/copper-ore-particle/copper-ore-particle-2.png",
        priority = "extra-high",
        width = 6,
        height = 4,
        frame_count = 1
      },
      {
        filename = "__base__/graphics/entity/copper-ore-particle/copper-ore-particle-3.png",
        priority = "extra-high",
        width = 7,
        height = 8,
        frame_count = 1
      },
      {
        filename = "__base__/graphics/entity/copper-ore-particle/copper-ore-particle-4.png",
        priority = "extra-high",
        width = 6,
        height = 5,
        frame_count = 1
      }
    },
    shadows =
    {
      {
        filename = "__base__/graphics/entity/copper-ore-particle/copper-ore-particle-shadow-1.png",
        priority = "extra-high",
        width = 5,
        height = 5,
        frame_count = 1
      },
      {
        filename = "__base__/graphics/entity/copper-ore-particle/copper-ore-particle-shadow-2.png",
        priority = "extra-high",
        width = 6,
        height = 4,
        frame_count = 1
      },
      {
        filename = "__base__/graphics/entity/copper-ore-particle/copper-ore-particle-shadow-3.png",
        priority = "extra-high",
        width = 7,
        height = 8,
        frame_count = 1
      },
      {
        filename = "__base__/graphics/entity/copper-ore-particle/copper-ore-particle-shadow-4.png",
        priority = "extra-high",
        width = 6,
        height = 5,
        frame_count = 1
      }
    }
  },
  {
    type = "particle",
    name = "stone-particle",
    flags = {"not-on-map"},
    life_time = 180,
    pictures =
    {
      {
        filename = "__base__/graphics/entity/stone-particle/stone-particle-1.png",
        priority = "extra-high",
        width = 5,
        height = 4,
        frame_count = 1
      },
      {
        filename = "__base__/graphics/entity/stone-particle/stone-particle-2.png",
        priority = "extra-high",
        width = 4,
        height = 4,
        frame_count = 1
      },
      {
        filename = "__base__/graphics/entity/stone-particle/stone-particle-3.png",
        priority = "extra-high",
        width = 5,
        height = 6,
        frame_count = 1
      },
      {
        filename = "__base__/graphics/entity/stone-particle/stone-particle-4.png",
        priority = "extra-high",
        width = 7,
        height = 7,
        frame_count = 1
      }
    },
    shadows =
    {
      {
        filename = "__base__/graphics/entity/stone-particle/stone-particle-shadow-1.png",
        priority = "extra-high",
        width = 5,
        height = 4,
        frame_count = 1
      },
      {
        filename = "__base__/graphics/entity/stone-particle/stone-particle-shadow-2.png",
        priority = "extra-high",
        width = 4,
        height = 4,
        frame_count = 1
      },
      {
        filename = "__base__/graphics/entity/stone-particle/stone-particle-shadow-3.png",
        priority = "extra-high",
        width = 5,
        height = 6,
        frame_count = 1
      },
      {
        filename = "__base__/graphics/entity/stone-particle/stone-particle-shadow-4.png",
        priority = "extra-high",
        width = 7,
        height = 7,
        frame_count = 1
      }
    }
  },
  {
    type = "particle",
    name = "coal-particle",
    flags = {"not-on-map"},
    life_time = 180,
    pictures =
    {
      {
        filename = "__base__/graphics/entity/coal-particle/coal-particle-1.png",
        priority = "extra-high",
        width = 5,
        height = 5,
        frame_count = 1
      },
      {
        filename = "__base__/graphics/entity/coal-particle/coal-particle-2.png",
        priority = "extra-high",
        width = 7,
        height = 6,
        frame_count = 1
      },
      {
        filename = "__base__/graphics/entity/coal-particle/coal-particle-3.png",
        priority = "extra-high",
        width = 3,
        height = 6,
        frame_count = 1
      },
      {
        filename = "__base__/graphics/entity/coal-particle/coal-particle-4.png",
        priority = "extra-high",
        width = 4,
        height = 4,
        frame_count = 1
      }
    },
    shadows =
    {
      {
        filename = "__base__/graphics/entity/coal-particle/coal-particle-shadow-1.png",
        priority = "extra-high",
        width = 5,
        height = 5,
        frame_count = 1
      },
      {
        filename = "__base__/graphics/entity/coal-particle/coal-particle-shadow-2.png",
        priority = "extra-high",
        width = 7,
        height = 6,
        frame_count = 1
      },
      {
        filename = "__base__/graphics/entity/coal-particle/coal-particle-shadow-3.png",
        priority = "extra-high",
        width = 3,
        height = 6,
        frame_count = 1
      },
      {
        filename = "__base__/graphics/entity/coal-particle/coal-particle-shadow-4.png",
        priority = "extra-high",
        width = 6,
        height = 4,
        frame_count = 1
      }
    }
  },
  {
    type = "particle",
    name = "wooden-particle",
    flags = {"not-on-map"},
    life_time = 180,
    pictures =
    {
      {
        filename = "__base__/graphics/entity/wooden-particle/wooden-particle-1.png",
        priority = "extra-high",
        width = 5,
        height = 5,
        frame_count = 1
      },
      {
        filename = "__base__/graphics/entity/wooden-particle/wooden-particle-2.png",
        priority = "extra-high",
        width = 6,
        height = 4,
        frame_count = 1
      },
      {
        filename = "__base__/graphics/entity/wooden-particle/wooden-particle-3.png",
        priority = "extra-high",
        width = 7,
        height = 8,
        frame_count = 1
      },
      {
        filename = "__base__/graphics/entity/wooden-particle/wooden-particle-4.png",
        priority = "extra-high",
        width = 6,
        height = 5,
        frame_count = 1
      }
    },
    shadows =
    {
      {
        filename = "__base__/graphics/entity/wooden-particle/wooden-particle-shadow-1.png",
        priority = "extra-high",
        width = 5,
        height = 5,
        frame_count = 1
      },
      {
        filename = "__base__/graphics/entity/wooden-particle/wooden-particle-shadow-2.png",
        priority = "extra-high",
        width = 6,
        height = 4,
        frame_count = 1
      },
      {
        filename = "__base__/graphics/entity/wooden-particle/wooden-particle-shadow-3.png",
        priority = "extra-high",
        width = 7,
        height = 8,
        frame_count = 1
      },
      {
        filename = "__base__/graphics/entity/wooden-particle/wooden-particle-shadow-4.png",
        priority = "extra-high",
        width = 6,
        height = 5,
        frame_count = 1
      }
    }
  },
  {
    type = "particle",
    name = "shell-particle",
    flags = {"not-on-map"},
    life_time = 600,
    pictures =
    {
      {
        filename = "__base__/graphics/entity/shell-particle/shell-particle-1.png",
        priority = "extra-high",
        width = 6,
        height = 6,
        frame_count = 5
      },
      {
        filename = "__base__/graphics/entity/shell-particle/shell-particle-2.png",
        priority = "extra-high",
        width = 5,
        height = 7,
        frame_count = 5
      }
    },
    shadows = {
      {
        filename = "__base__/graphics/entity/shell-particle/shell-particle-shadow-1.png",
        priority = "extra-high",
        width = 9,
        height = 7,
        frame_count = 5
      },
      {
        filename = "__base__/graphics/entity/shell-particle/shell-particle-shadow-2.png",
        priority = "extra-high",
        width = 7,
        height = 8,
        frame_count = 5
      }
    }
  },
  {
    type = "particle",
    name = "explosion-remnants-particle",
    flags = {"not-on-map"},
    life_time = 60 * 15,
    pictures =
    {
      {
        filename = "__base__/graphics/entity/explosion-particle/explosion-particle-01.png",
        priority = "extra-high",
        width = 22,
        height = 20,
        frame_count = 16,
        animation_speed = 0.25
      },
      {
        filename = "__base__/graphics/entity/explosion-particle/explosion-particle-02.png",
        priority = "extra-high",
        width = 21,
        height = 20,
        frame_count = 12,
        animation_speed = 0.25
      },
      {
        filename = "__base__/graphics/entity/explosion-particle/explosion-particle-03.png",
        priority = "extra-high",
        width = 15,
        height = 15,
        frame_count = 10,
        animation_speed = 0.25
      },
      {
        filename = "__base__/graphics/entity/explosion-particle/explosion-particle-04.png",
        priority = "extra-high",
        width = 28,
        height = 27,
        frame_count = 11,
        animation_speed = 0.25
      },
      {
        filename = "__base__/graphics/entity/explosion-particle/explosion-particle-05.png",
        priority = "extra-high",
        width = 24,
        height = 26,
        frame_count = 8,
        animation_speed = 0.25
      },
      {
        filename = "__base__/graphics/entity/explosion-particle/explosion-particle-15.png",
        priority = "extra-high",
        width = 27,
        height = 28,
        frame_count = 11,
        animation_speed = 0.25
      },
      {
        filename = "__base__/graphics/entity/explosion-particle/explosion-particle-19.png",
        priority = "extra-high",
        width = 12,
        height = 12,
        frame_count = 12,
        animation_speed = 0.25
      }
    },
    shadows =
    {
      {
        filename = "__base__/graphics/entity/explosion-particle/explosion-particle-01-shadow.png",
        priority = "extra-high",
        width = 27,
        height = 18,
        frame_count = 16,
        animation_speed = 0.25
      },
      {
        filename = "__base__/graphics/entity/explosion-particle/explosion-particle-02-shadow.png",
        priority = "extra-high",
        width = 26,
        height = 18,
        frame_count = 12,
        animation_speed = 0.25
      },
      {
        filename = "__base__/graphics/entity/explosion-particle/explosion-particle-03-shadow.png",
        priority = "extra-high",
        width = 18,
        height = 12,
        frame_count = 10,
        animation_speed = 0.25
      },
      {
        filename = "__base__/graphics/entity/explosion-particle/explosion-particle-04-shadow.png",
        priority = "extra-high",
        width = 36,
        height = 23,
        frame_count = 11,
        animation_speed = 0.25
      },
      {
        filename = "__base__/graphics/entity/explosion-particle/explosion-particle-05-shadow.png",
        priority = "extra-high",
        width = 33,
        height = 23,
        frame_count = 8,
        animation_speed = 0.25
      },
      {
        filename = "__base__/graphics/entity/explosion-particle/explosion-particle-15-shadow.png",
        priority = "extra-high",
        width = 34,
        height = 23,
        frame_count = 11,
        animation_speed = 0.25
      },
      {
        filename = "__base__/graphics/entity/explosion-particle/explosion-particle-19-shadow.png",
        priority = "extra-high",
        width = 15,
        height = 10,
        frame_count = 12,
        animation_speed = 0.25
      }
    },
    regular_trigger_effect =
    {
      type = "create-smoke",
      entity_name = "smoke-explosion-particle",
      starting_frame_deviation = 5,
      starting_frame_speed_deviation = 5,
      offset_deviation = {{-0.06, -0.06}, {0.06, 0.06}},
      speed_from_center = 0.007
    },
    regular_trigger_effect_frequency = 1,
    ended_in_water_trigger_effect =
    {
      type = "create-entity",
      entity_name = "water-splash"
    }
  },
  {
    type = "particle",
    name = "blood-particle",
    flags = {"not-on-map"},
    movement_modifier_when_on_ground = 0,
    life_time = 180,
    pictures =
    {
      {
        filename = "__base__/graphics/entity/blood-particle/blood-particle-01.png",
        priority = "extra-high",
        width = 5,
        height = 6,
        frame_count = 6,
        scale = bloodparticlescale(),
        tint = bloodtint()
      },
      {
        filename = "__base__/graphics/entity/blood-particle/blood-particle-02.png",
        priority = "extra-high",
        width = 4,
        height = 3,
        frame_count = 6,
        scale = bloodparticlescale(),
        tint = bloodtint()
      },
      {
        filename = "__base__/graphics/entity/blood-particle/blood-particle-03.png",
        priority = "extra-high",
        width = 4,
        height = 7,
        frame_count = 6,
        scale = bloodparticlescale(),
        tint = bloodtint()
      },
      {
        filename = "__base__/graphics/entity/blood-particle/blood-particle-04.png",
        priority = "extra-high",
        width = 3,
        height = 3,
        frame_count = 6,
        scale = bloodparticlescale(),
        tint = bloodtint()
      },
      {
        filename = "__base__/graphics/entity/blood-particle/blood-particle-05.png",
        priority = "extra-high",
        width = 4,
        height = 5,
        frame_count = 6,
        scale = bloodparticlescale(),
        tint = bloodtint()
      },
      {
        filename = "__base__/graphics/entity/blood-particle/blood-particle-06.png",
        priority = "extra-high",
        width = 7,
        height = 3,
        frame_count = 6,
        scale = bloodparticlescale(),
        tint = bloodtint()
      },
      {
        filename = "__base__/graphics/entity/blood-particle/blood-particle-07.png",
        priority = "extra-high",
        width = 5,
        height = 5,
        frame_count = 6,
        scale = bloodparticlescale(),
        tint = bloodtint()
      },
      {
        filename = "__base__/graphics/entity/blood-particle/blood-particle-08.png",
        priority = "extra-high",
        width = 9,
        height = 10,
        frame_count = 6,
        scale = bloodparticlescale(),
        tint = bloodtint()
      },
      {
        filename = "__base__/graphics/entity/blood-particle/blood-particle-09.png",
        priority = "extra-high",
        width = 7,
        height = 4,
        frame_count = 6,
        scale = bloodparticlescale(),
        tint = bloodtint()
      },
      {
        filename = "__base__/graphics/entity/blood-particle/blood-particle-10.png",
        priority = "extra-high",
        width = 4,
        height = 5,
        frame_count = 6,
        scale = bloodparticlescale(),
        tint = bloodtint()
      },
      {
        filename = "__base__/graphics/entity/blood-particle/blood-particle-11.png",
        priority = "extra-high",
        width = 4,
        height = 5,
        frame_count = 6,
        scale = bloodparticlescale(),
        tint = bloodtint()
      },
      {
        filename = "__base__/graphics/entity/blood-particle/blood-particle-12.png",
        priority = "extra-high",
        width = 4,
        height = 5,
        frame_count = 6,
        scale = bloodparticlescale(),
        tint = bloodtint()
      },
      {
        filename = "__base__/graphics/entity/blood-particle/blood-particle-13.png",
        priority = "extra-high",
        width = 4,
        height = 5,
        frame_count = 6,
        scale = bloodparticlescale(),
        tint = bloodtint()
      }
    },
    shadows =
    {
      {
        filename = "__base__/graphics/entity/blood-particle/blood-particle-01.png",
        priority = "extra-high",
        width = 5,
        height = 6,
        frame_count = 6,
        scale = bloodparticlescale(),
        tint = shadowtint()
      },
      {
        filename = "__base__/graphics/entity/blood-particle/blood-particle-02.png",
        priority = "extra-high",
        width = 4,
        height = 3,
        frame_count = 6,
        scale = bloodparticlescale(),
        tint = shadowtint()
      },
      {
        filename = "__base__/graphics/entity/blood-particle/blood-particle-03.png",
        priority = "extra-high",
        width = 4,
        height = 7,
        frame_count = 6,
        scale = bloodparticlescale(),
        tint = shadowtint()
      },
      {
        filename = "__base__/graphics/entity/blood-particle/blood-particle-04.png",
        priority = "extra-high",
        width = 3,
        height = 3,
        frame_count = 6,
        scale = bloodparticlescale(),
        tint = shadowtint()
      },
      {
        filename = "__base__/graphics/entity/blood-particle/blood-particle-05.png",
        priority = "extra-high",
        width = 4,
        height = 5,
        frame_count = 6,
        scale = bloodparticlescale(),
        tint = shadowtint()
      },
      {
        filename = "__base__/graphics/entity/blood-particle/blood-particle-06.png",
        priority = "extra-high",
        width = 7,
        height = 3,
        frame_count = 6,
        scale = bloodparticlescale(),
        tint = shadowtint()
      },
      {
        filename = "__base__/graphics/entity/blood-particle/blood-particle-07.png",
        priority = "extra-high",
        width = 5,
        height = 5,
        frame_count = 6,
        scale = bloodparticlescale(),
        tint = shadowtint()
      },
      {
        filename = "__base__/graphics/entity/blood-particle/blood-particle-08.png",
        priority = "extra-high",
        width = 9,
        height = 10,
        frame_count = 6,
        scale = bloodparticlescale(),
        tint = shadowtint()
      },
      {
        filename = "__base__/graphics/entity/blood-particle/blood-particle-09.png",
        priority = "extra-high",
        width = 7,
        height = 4,
        frame_count = 6,
        scale = bloodparticlescale(),
        tint = shadowtint()
      },
      {
        filename = "__base__/graphics/entity/blood-particle/blood-particle-10.png",
        priority = "extra-high",
        width = 4,
        height = 5,
        frame_count = 6,
        scale = bloodparticlescale(),
        tint = shadowtint()
      },
      {
        filename = "__base__/graphics/entity/blood-particle/blood-particle-11.png",
        priority = "extra-high",
        width = 4,
        height = 5,
        frame_count = 6,
        scale = bloodparticlescale(),
        tint = shadowtint()
      },
      {
        filename = "__base__/graphics/entity/blood-particle/blood-particle-12.png",
        priority = "extra-high",
        width = 4,
        height = 5,
        frame_count = 6,
        scale = bloodparticlescale(),
        tint = shadowtint()
      },
      {
        filename = "__base__/graphics/entity/blood-particle/blood-particle-13.png",
        priority = "extra-high",
        width = 4,
        height = 5,
        frame_count = 6,
        scale = bloodparticlescale(),
        tint = shadowtint()
      }
    }
  },
  {
    type = "particle-source",
    name = "blood-fountain",
    particle = "blood-particle",
    time_to_live = 10,
    time_to_live_deviation = 5,
    time_before_start = 0,
    time_before_start_deviation = 3,
    height = 0.4,
    height_deviation = 0.1,
    vertical_speed = 0.05,
    vertical_speed_deviation = 0.03,
    horizontal_speed = 0.025,
    horizontal_speed_deviation = 0.025
  },
  {
    type = "particle-source",
    name = "blood-fountain-big",
    particle = "blood-particle",
    time_to_live = 30,
    time_to_live_deviation = 5,
    time_before_start = 0,
    time_before_start_deviation = 10,
    height = 0.4,
    height_deviation = 0.1,
    vertical_speed = 0.15,
    vertical_speed_deviation = 0.05,
    horizontal_speed = 0.04,
    horizontal_speed_deviation = 0.04
  }
}
)
