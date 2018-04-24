data:extend(
{
  {
    type="map-settings",
    name="map-settings",
    pollution=
    {
      enabled=true,
      -- these are values for 60 ticks (1 simulated second)
      --
      -- amount that is diffused to neighboring chunk
      -- (possibly repeated for other directions as well)
      diffusion_ratio=0.02,
      -- this much PUs must be on the chunk to start diffusing
      min_to_diffuse=15,
      -- constant amount of PUs that are eaten by the chunk
      ageing=0.6,
      -- minimum PUs to generate a new chunk
      min_to_activate_chunk=2,
      -- anything bigger than this is visualised as this value
      expected_max_per_chunk=7000,
      -- anything lower than this (but > 0) is visualised as this value
      min_to_show_per_chunk=700,
    },
    enemy_evolution=
    {
      -- percentual increase in the evolve factor for every second (60 ticks)
      time_factor = 0.000025,
      -- percentual increase in the evolve factor for every destroyed spawner
      destroy_factor = 0.015,
      -- percentual increase in the evolve factor for 1000 PU
      pollution_factor = 0.0001
    },
    enemy_expansion=
    {
      -- Distance in chunks from the nearest base when expanding
      min_base_spacing = 3,
      -- Distance in chunks from the furthest base around.
      -- This prevents expansions from reaching too far into the
      -- player's territory
      max_expansion_distance = 5,

      -- Size of the group that goes to build new base
      settler_group_min_size = 10,
      settler_group_max_size = 20,

      -- How many ticks on average does it take, before a single vialble
      -- position for a base is used. If there are more possible positions,
      -- expansion is faster.
      expansion_cooldown = 8000000,
    },
    steering=
    {
      default=
      {
        -- not including the radius of the unit
        radius = 1.2,
        separation_force = 0.005,
        separation_factor = 1.2
      },
      moving=
      {
        radius = 3,
        separation_force = 0.01,
        separation_factor = 3
      }
    },
    path_finder=
    {
      -- a lot of things
    },
  }
})
