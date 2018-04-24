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
      ageing=0.55,
      -- anything bigger than this is visualised as this value
      expected_max_per_chunk=7000,
      -- anything lower than this (but > 0) is visualised as this value
      min_to_show_per_chunk=700,
    },
    enemy_evolution=
    {
      enabled=true,
      -- percentual increase in the evolve factor for every second (60 ticks)
      time_factor = 0.000008,
      -- percentual increase in the evolve factor for every destroyed spawner
      destroy_factor = 0.005,
      -- percentual increase in the evolve factor for 1000 PU
      pollution_factor = 0.00003
    },
    enemy_expansion=
    {
      -- Distance in chunks from the nearest base when expanding
      min_base_spacing = 3,
      -- Distance in chunks from the furthest base around.
      -- This prevents expansions from reaching too far into the
      -- player's territory
      max_expansion_distance = 5,

      -- Minimal distance of expansion point in chunks from player base
      min_player_base_distance = 3,

      -- Size of the group that goes to build new base (in game this is multiplied by the
      -- evolution factor).
      settler_group_min_size = 5,
      settler_group_max_size = 20,

      -- Ticks to expand to a single
      -- position for a base is used.
      --
      -- cooldown is calculated as linear interpolation between min and max
      min_expansion_cooldown = 5 * 3600,
      max_expansion_cooldown = 60 * 3600
    },
    unit_group=
    {
      -- pollution triggered group waiting time is a random time between min and max gathering time
      min_group_gathering_time = 3600,
      max_group_gathering_time = 10 * 3600,
      -- after the gathering is finished the group can still wait for late members,
      -- but it doesn't accept new ones anymore
      max_wait_time_for_late_members = 2 * 3600,
      -- limits for group radius (calculated by number of numbers)
      max_group_radius = 30.0,
      min_group_radius = 5.0
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
