
function make_biter_roars(volume)
  return
  {
    {
      filename = "__base__/sound/creatures/biter-roar-1.ogg",
      volume = volume
    },
    {
      filename = "__base__/sound/creatures/biter-roar-2.ogg",
      volume = volume
    },
    {
      filename = "__base__/sound/creatures/biter-roar-3.ogg",
      volume = volume
    },
    {
      filename = "__base__/sound/creatures/biter-roar-4.ogg",
      volume = volume
    },
    {
      filename = "__base__/sound/creatures/biter-roar-5.ogg",
      volume = volume
    },
    {
      filename = "__base__/sound/creatures/biter-roar-6.ogg",
      volume = volume
    }
  }
end

function make_biter_roars_big(volume)
  return
  {
    {
      filename = "__base__/sound/creatures/biter-roar-big-1.ogg",
      volume = volume
    },
    {
      filename = "__base__/sound/creatures/biter-roar-big-2.ogg",
      volume = volume
    },
    {
      filename = "__base__/sound/creatures/biter-roar-big-3.ogg",
      volume = volume
    },
    {
      filename = "__base__/sound/creatures/biter-roar-big-4.ogg",
      volume = volume
    },
    {
      filename = "__base__/sound/creatures/biter-roar-big-5.ogg",
      volume = volume
    }
  }
end

function make_biter_dying_sounds(volume)
  return
  {
    {
      filename = "__base__/sound/creatures/biter-death-1.ogg",
      volume = volume
    },
    {
      filename = "__base__/sound/creatures/biter-death-2.ogg",
      volume = volume
    },
    {
      filename = "__base__/sound/creatures/biter-death-3.ogg",
      volume = volume
    },
    {
      filename = "__base__/sound/creatures/biter-death-4.ogg",
      volume = volume
    },
    {
      filename = "__base__/sound/creatures/biter-death-5.ogg",
      volume = volume
    }
  }
end

function make_biter_dying_sounds_big(volume)
  return
  {
    {
      filename = "__base__/sound/creatures/biter-death-big-1.ogg",
      volume = volume
    },
    {
      filename = "__base__/sound/creatures/biter-death-big-2.ogg",
      volume = volume
    },
    {
      filename = "__base__/sound/creatures/biter-death-big-3.ogg",
      volume = volume
    },
    {
      filename = "__base__/sound/creatures/biter-death-big-4.ogg",
      volume = volume
    },
    {
      filename = "__base__/sound/creatures/biter-death-big-5.ogg",
      volume = volume
    }
  }
end

function make_biter_calls(volume)
  return
  {
    sound =
    {
      {
        filename = "__base__/sound/creatures/biter-call-1.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/biter-call-2.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/biter-call-3.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/biter-call-4.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/biter-call-5.ogg",
        volume = volume
      },
    },
    probability = 1 / (4 * 60), -- average pause between the sound is 4 seconds
    max_sounds_per_type = 2,
    --audible_distance_modifier = 0.9,
  }
end

function make_biter_calls_big(volume)
  return
  {
    sound =
    {
      {
        filename = "__base__/sound/creatures/biter-call-big-1.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/biter-call-big-2.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/biter-call-big-3.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/biter-call-big-4.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/biter-call-big-5.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/biter-call-big-6.ogg",
        volume = volume
      },
    },
    probability = 1 / (4 * 60), -- average pause between the sound is 4 seconds
    max_sounds_per_type = 2,
  }
end

function make_biter_walk_sounds(volume)
  return
  {
    aggregation =
    {
      max_count = 2,
      remove = true
    },
    variations =
    {
      {
        filename = "__base__/sound/creatures/biter-walk-1.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/biter-walk-2.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/biter-walk-3.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/biter-walk-4.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/biter-walk-5.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/biter-walk-6.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/biter-walk-7.ogg",
        volume = volume
      }
    }
  }
end

function make_biter_walk_sounds_big(volume)
  return
  {
    aggregation =
    {
      max_count = 2,
      remove = true
    },
    variations =
    {
      {
        filename = "__base__/sound/creatures/biter-walk-big-1.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/biter-walk-big-2.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/biter-walk-big-3.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/biter-walk-big-4.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/biter-walk-big-5.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/biter-walk-big-6.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/biter-walk-big-7.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/biter-walk-big-8.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/biter-walk-big-9.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/biter-walk-big-10.ogg",
        volume = volume
      },
    }
  }
end

function make_spitter_walk_sounds(volume)
  return
  {
    aggregation =
    {
      max_count = 2,
      remove = true
    },
    variations =
    {
      {
        filename = "__base__/sound/creatures/spitter-walk-1.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/spitter-walk-2.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/spitter-walk-3.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/spitter-walk-4.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/spitter-walk-5.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/spitter-walk-6.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/spitter-walk-7.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/spitter-walk-8.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/spitter-walk-9.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/spitter-walk-10.ogg",
        volume = volume
      }
    }
  }
end

function make_spitter_walk_sounds_big(volume)
  return
  {
    aggregation =
    {
      max_count = 2,
      remove = true
    },
    variations =
    {
      {
        filename = "__base__/sound/creatures/spitter-walk-big-1.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/spitter-walk-big-2.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/spitter-walk-big-3.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/spitter-walk-big-4.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/spitter-walk-big-5.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/spitter-walk-big-6.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/spitter-walk-big-7.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/spitter-walk-big-8.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/spitter-walk-big-9.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/spitter-walk-big-10.ogg",
        volume = volume
      }
    }
  }
end

function make_spitter_calls(volume)
  return
  {
    sound =
    {
      {
        filename = "__base__/sound/creatures/spitter-call-small-1.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/spitter-call-small-2.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/spitter-call-small-3.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/spitter-call-small-4.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/spitter-call-small-5.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/spitter-call-small-6.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/spitter-call-small-7.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/spitter-call-small-8.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/spitter-call-small-9.ogg",
        volume = volume
      }
    },
    probability = 1 / (4 * 60), -- average pause between the sound is 4 seconds
    max_sounds_per_type = 2,
    --audible_distance_modifier = 0.9,
  }
end

function make_spitter_calls_med(volume)
  return
  {
    --aggregation =
    --{
    -- max_count = 1,
    --remove = true
    --},
    --variations =
    sound =
    {
      {
        filename = "__base__/sound/creatures/spitter-call-med-1.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/spitter-call-med-2.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/spitter-call-med-3.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/spitter-call-med-4.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/spitter-call-med-5.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/spitter-call-med-6.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/spitter-call-med-7.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/spitter-call-med-8.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/spitter-call-med-9.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/spitter-call-med-10.ogg",
        volume = volume
      },
    },
    probability = 1 / (8 * 60) -- average pause between the sound is 8 seconds
  }
end

function make_spitter_calls_big(volume)
  return
  {
    sound =
    {
      {
        filename = "__base__/sound/creatures/spitter-call-big-1.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/spitter-call-big-2.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/spitter-call-big-3.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/spitter-call-big-4.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/spitter-call-big-5.ogg",
        volume = volume
      },
    },
    probability = 1 / (4 * 60), -- average pause between the sound is 4 seconds
    max_sounds_per_type = 2,
    --audible_distance_modifier = 0.9,
  }
end

function make_spitter_roars(volume)
  return
  {
    layers =
    {
      [0] =
      {
        {
          filename = "__base__/sound/creatures/Spiters_1_1.ogg",
          volume = volume
        },
        {
          filename = "__base__/sound/creatures/Spiters_2_1.ogg",
          volume = volume
        },
        {
          filename = "__base__/sound/creatures/Spiters_3_1.ogg",
          volume = volume
        },
        {
          filename = "__base__/sound/creatures/Spiters_4_1.ogg",
          volume = volume
        },
        {
          filename = "__base__/sound/creatures/Spiters_5_1.ogg",
          volume = volume
        }
      },
      [1] =
      {
        {
          filename = "__base__/sound/creatures/Spiters_1_2.ogg",
          volume = volume
        },
        {
          filename = "__base__/sound/creatures/Spiters_2_2.ogg",
          volume = volume
        },
        {
          filename = "__base__/sound/creatures/Spiters_3_2.ogg",
          volume = volume
        },
        {
          filename = "__base__/sound/creatures/Spiters_4_2.ogg",
          volume = volume
        },
        {
          filename = "__base__/sound/creatures/Spiters_5_2.ogg",
          volume = volume
        }
      }
    }
  }
end

function make_spitter_dying_sounds(volume)
  return
  {
    {
      filename = "__base__/sound/creatures/spitter-death-1.ogg",
      volume = volume
    },
    {
      filename = "__base__/sound/creatures/spitter-death-2.ogg",
      volume = volume
    },
    {
      filename = "__base__/sound/creatures/spitter-death-3.ogg",
      volume = volume
    },
    {
      filename = "__base__/sound/creatures/spitter-death-4.ogg",
      volume = volume
    },
    {
      filename = "__base__/sound/creatures/spitter-death-5.ogg",
      volume = volume
    }
  }
end

function make_spitter_dying_sounds_big(volume)
  return
  {
    {
      filename = "__base__/sound/creatures/spitter-death-big-1.ogg",
      volume = volume
    },
    {
      filename = "__base__/sound/creatures/spitter-death-big-2.ogg",
      volume = volume
    },
    {
      filename = "__base__/sound/creatures/spitter-death-big-3.ogg",
      volume = volume
    },
    {
      filename = "__base__/sound/creatures/spitter-death-big-4.ogg",
      volume = volume
    },
    {
      filename = "__base__/sound/creatures/spitter-death-big-5.ogg",
      volume = volume
    }
  }
end


function make_worm_roars(volume)
  return
  {
    variations =
    {
      {
        filename = "__base__/sound/creatures/worm-roar-1.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/worm-roar-2.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/worm-roar-3.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/worm-roar-4.ogg",
        volume = volume
      }
    },
    audible_distance_modifier = 2.0
  }
end

function make_worm_roar_alternative(volume)
  return
  {
    variations =
    {
      {
        filename = "__base__/sound/creatures/worm-roar-alt-1.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/worm-roar-alt-2.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/worm-roar-alt-3.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/worm-roar-alt-4.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/worm-roar-alt-5.ogg",
        volume = volume
      }
    },
    audible_distance_modifier = 2.0
  }
end

function make_worm_breath(volume)
  return
  {
    variations =
    {
      {
        filename = "__base__/sound/creatures/worm-breathe-01.ogg",
        volume = 0.5
      },
      {
        filename = "__base__/sound/creatures/worm-breathe-02.ogg",
        volume = 0.5
      },
      {
        filename = "__base__/sound/creatures/worm-breathe-03.ogg",
        volume = 0.5
      },
      {
        filename = "__base__/sound/creatures/worm-breathe-04.ogg",
        volume = 0.5
      },
      {
        filename = "__base__/sound/creatures/worm-breathe-05.ogg",
        volume = 0.5
      },
      {
        filename = "__base__/sound/creatures/worm-breathe-06.ogg",
        volume = 0.5
      },
      {
        filename = "__base__/sound/creatures/worm-breathe-07.ogg",
        volume = 0.5
      },
      {
        filename = "__base__/sound/creatures/worm-breathe-08.ogg",
        volume = 0.5
      }
    },
    audible_distance_modifier = 2.0
  }
end

function make_worm_dying_sounds(volume)
  return
  {
    {
      filename = "__base__/sound/creatures/worm-death-1.ogg",
      volume = volume
    },
    {
      filename = "__base__/sound/creatures/worm-death-2.ogg",
      volume = volume
    },
    {
      filename = "__base__/sound/creatures/worm-death-3.ogg",
      volume = volume
    },
    {
      filename = "__base__/sound/creatures/worm-death-4.ogg",
      volume = volume
    },
    {
      filename = "__base__/sound/creatures/worm-death-5.ogg",
      volume = volume
    },
    {
      filename = "__base__/sound/creatures/worm-death-6.ogg",
      volume = volume
    },
    {
      filename = "__base__/sound/creatures/worm-death-7.ogg",
      volume = volume
    }
  }
end

function make_worm_dying_small_sounds(volume)
  return
  {
    {
      filename = "__base__/sound/creatures/worm-death-small-1.ogg",
      volume = volume
    },
    {
      filename = "__base__/sound/creatures/worm-death-small-2.ogg",
      volume = volume
    },
    {
      filename = "__base__/sound/creatures/worm-death-small-3.ogg",
      volume = volume
    },
    {
      filename = "__base__/sound/creatures/worm-death-small-4.ogg",
      volume = volume
    }
  }
end

function make_worm_fold_sounds(volume)
  return
  {
    {
      filename = "__base__/sound/creatures/worm-folding-1.ogg",
      volume = volume
    },
    {
      filename = "__base__/sound/creatures/worm-folding-2.ogg",
      volume = volume
    },
    {
      filename = "__base__/sound/creatures/worm-folding-3.ogg",
      volume = volume
    }
  }
end

function make_worm_standup_sounds(volume)
  return
  {
    {
      filename = "__base__/sound/creatures/worm-standup-1.ogg",
      volume = volume
    },
    {
      filename = "__base__/sound/creatures/worm-standup-2.ogg",
      volume = volume
    },
    {
      filename = "__base__/sound/creatures/worm-standup-3.ogg",
      volume = volume
    },
    {
      filename = "__base__/sound/creatures/worm-standup-4.ogg",
      volume = volume
    },
    {
      filename = "__base__/sound/creatures/worm-standup-5.ogg",
      volume = volume
    }
  }
end

function make_worm_standup_small_sounds(volume)
  return
  {
    {
      filename = "__base__/sound/creatures/worm-standup-small-1.ogg",
      volume = volume
    },
    {
      filename = "__base__/sound/creatures/worm-standup-small-2.ogg",
      volume = volume
    },
    {
      filename = "__base__/sound/creatures/worm-standup-small-3.ogg",
      volume = volume
    }
  }
end