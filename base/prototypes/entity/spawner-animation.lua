

function spawner_idle_animation(variation, tint, captured)
return
  {
    layers =
    {
      util.sprite_load("__base__/graphics/entity/spawner/spawner-idle",
        {
          frame_count = 7,
          scale = 0.5,
          animation_speed = 0.18,
          run_mode = "forward-then-backward",
          y = variation * 376 * 2,
          surface = "nauvis",
          usage = "enemy"
        }
      ),
      util.sprite_load("__base__/graphics/entity/spawner/spawner-idle-mask",
        {
          frame_count = 7,
          scale = 0.5,
          animation_speed = 0.18,
          run_mode = "forward-then-backward",
          tint = tint,
          flags = { "mask" },
          y = variation * 230 * 2,
          surface = "nauvis",
          usage = "enemy"
        }
      ),
      util.sprite_load("__base__/graphics/entity/spawner/spawner-idle-shadow",
        {
          frame_count = 7,
          scale = 0.5,
          animation_speed = 0.18,
          run_mode = "forward-then-backward",
          draw_as_shadow = true,
          y = variation * 358 * 2,
          surface = "nauvis",
          usage = "enemy"
        }
      )
    }
  }
end

function spawner_die_animation(variation, tint)
return
  {
    layers =
    {
      util.sprite_load("__base__/graphics/entity/spawner/spawner-death-v" .. tostring(variation+1),
        {
          frame_count = 18,
          direction_count = 1,
          scale = 0.5,
          flags = {"corpse-decay"},
          surface = "nauvis",
          usage = "enemy"
        }
      ),
      util.sprite_load("__base__/graphics/entity/spawner/spawner-death-mask-v" .. tostring(variation+1),
        {
          frame_count = 18,
          direction_count = 1,
          scale = 0.5,
          tint = tint,
          flags = {"corpse-decay"},
          surface = "nauvis",
          usage = "enemy"

        }
      ),
      util.sprite_load("__base__/graphics/entity/spawner/spawner-death-shadow-v" .. tostring(variation+1),
        {
          draw_as_shadow = true,
          frame_count = 18,
          direction_count = 1,
          scale = 0.5,
          surface = "nauvis",
          usage = "enemy"
        }
      ),
    }
  }
end

function spawner_decay_animation(variation, tint)
  return
    {
      layers =
      {
        util.sprite_load("__base__/graphics/entity/spawner/spawner-decay-v" .. tostring(variation+1),
          {
            frame_count = 24,
            direction_count = 1,
            scale = 0.5,
            flags = {"corpse-decay"},
            surface = "nauvis",
            usage = "corpse-decay"
          }
        ),
        util.sprite_load("__base__/graphics/entity/spawner/spawner-decay-mask-v" .. tostring(variation+1),
          {
            frame_count = 24,
            direction_count = 1,
            scale = 0.5,
            tint = tint,
            flags = {"corpse-decay"},
            surface = "nauvis",
            usage = "corpse-decay"
          }
        ),
        util.sprite_load("__base__/graphics/entity/spawner/spawner-decay-shadow-v" .. tostring(variation+1),
          {
            draw_as_shadow = true,
            frame_count = 24,
            direction_count = 1,
            scale = 0.5,
            surface = "nauvis",
            usage = "corpse-decay"
          }
        ),
      }
    }
  end
