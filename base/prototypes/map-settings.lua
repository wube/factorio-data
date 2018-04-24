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
      -- constant modifier a percentage of 1 - the pollution eaten by a chunks tiles
      ageing=1,
      -- anything bigger than this is visualised as this value
      expected_max_per_chunk=7000,
      -- anything lower than this (but > 0) is visualised as this value
      min_to_show_per_chunk=700,
      min_pollution_to_damage_trees = 3500,
      pollution_with_max_forest_damage = 10000,
      pollution_per_tree_damage = 2000,
      pollution_restored_per_tree_damage = 500,
      max_pollution_to_restore_trees = 1000
    },

    enemy_evolution=
    {
      enabled=true,
      -- percentual increase in the evolve factor for every second (60 ticks)
      time_factor = 0.000004,
      -- percentual increase in the evolve factor for every destroyed spawner
      destroy_factor = 0.002,
      -- percentual increase in the evolve factor for 1000 PU
      pollution_factor = 0.000015
    },

    enemy_expansion=
    {
      enabled = true,
      -- Distance in chunks from the furthest base around.
      -- This prevents expansions from reaching too far into the
      -- player's territory
      max_expansion_distance = 7,

      friendly_base_influence_radius = 2,
      enemy_building_influence_radius = 2,

      -- A candidate chunk's score is given as follows:
      --   player = 0
      --   for neighbour in all chunks within enemy_building_influence_radius from chunk:
      --     player += number of player buildings on neighbour
      --             * building_coefficient
      --             * neighbouring_chunk_coefficient^distance(chunk, neighbour)
      --
      --   base = 0
      --   for neighbour in all chunk within friendly_base_influence_radius from chunk:
      --     base += num of enemy bases on neighbour
      --           * other_base_coefficient
      --           * neighbouring_base_chunk_coefficient^distance(chunk, neighbour)
      --
      --   score(chunk) = 1 / (1 + player + base)
      --
      -- The iteration is over a square region centered around the chunk for which the calculation is done,
      -- and includes the central chunk as well. distance is the Manhattan distance, and ^ signifies exponentiation.
      building_coefficient = 0.1,
      other_base_coefficient = 2.0,
      neighbouring_chunk_coefficient = 0.5,
      neighbouring_base_chunk_coefficient = 0.4;

      -- A chunk has to have at most this much percent unbuildable tiles for it to be considered a candidate.
      -- This is to avoid chunks full of water to be marked as candidates.
      max_colliding_tiles_coefficient = 0.9,

      -- Size of the group that goes to build new base (in game this is multiplied by the
      -- evolution factor).
      settler_group_min_size = 5,
      settler_group_max_size = 20,

      -- Ticks to expand to a single
      -- position for a base is used.
      --
      -- cooldown is calculated as follows:
      --   cooldown = lerp(max_expansion_cooldown, min_expansion_cooldown, -e^2 + 2 * e),
      -- where lerp is the linear interpolation function, and e is the current evolution factor.
      min_expansion_cooldown = 4 * 3600,
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
      min_group_radius = 5.0,
      -- when a member falls behind the group he can speedup up till this much of his regular speed
      max_member_speedup_when_behind = 1.4,
      -- When a member gets ahead of its group, it will slow down to at most this factor of its speed
      max_member_slowdown_when_ahead = 0.6,
      -- When members of a group are behind, the entire group will slow down to at most this factor of its max speed
      max_group_slowdown_factor = 0.3,
      -- If a member falls behind more than this times the group radius, the group will slow down to max_group_slowdown_factor
      max_group_member_fallback_factor = 3,
      -- If a member falls behind more than this time the group radius, it will be removed from the group.
      member_disown_distance = 10,
      tick_tolerance_when_member_arrives = 60,

      -- Maximum number of automatically created unit groups gathering for attack at any time.
      max_gathering_unit_groups = 30,

      -- Maximum size of an attack unit group. This only affects automatically-created unit groups; manual groups
      -- created through the API are unaffected.
      max_unit_group_size = 200
    },

    steering=
    {
      default=
      {
        -- not including the radius of the unit
        radius = 1.2,
        separation_force = 0.005,
        separation_factor = 1.2,
        force_unit_fuzzy_goto_behavior = false
      },
      moving=
      {
        radius = 3,
        separation_force = 0.01,
        separation_factor = 3,
        -- used only for special "to look good" purposes (like in trailer)
        force_unit_fuzzy_goto_behavior = false
      }
    },

    path_finder=
    {
      -- defines whether we prefer forward (>1) or backward (<-1) or symmetrical (1) search
      fwd2bwd_ratio = 5,
      -- when comparing nodes in open which one to check next
      -- heuristic value is multiplied by this ratio
      -- the higher the number the more is the search directed directly towards the goal
      goal_pressure_ratio = 2,
      -- when this is exhausted no more requests are allowed
      -- at the moment the first path to exhaust this will be finished (even if it is hundreds of steps)
      max_steps_worked_per_tick = 100,

      -- path cache setings
      use_path_cache = true,
      -- number of elements in the cache
      short_cache_size = 5,
      long_cache_size = 25,
      -- minimal distance to goal for path to be searched in short path cache
      short_cache_min_cacheable_distance = 10,
      -- minimal number of algorithm steps for path to be inserted into the short path cache
      short_cache_min_algo_steps_to_cache = 50,
      -- minimal distance to goal for path to be searched in long path cache
      long_cache_min_cacheable_distance = 30,
      -- when searching for connection to path cache path, search at most for this number of steps times the initial estimate
      cache_max_connect_to_cache_steps_multiplier = 100,
      -- when looking for path from cache make sure it doesn't start too far from requested start in relative distance terms
      cache_accept_path_start_distance_ratio = 0.2,
      -- when looking for path from cache make sure it doesn't end too far from requested end
      -- this is typically higher than accept value for the start because the end target can be moving
      cache_accept_path_end_distance_ratio = 0.15,
      -- Same as cache_accept_path_start_distance_ratio, but used for negative cache queries
      negative_cache_accept_path_start_distance_ratio = 0.3,
      -- Same as cache_accept_path_end_distance_ratio, but used for negative cache queries
      negative_cache_accept_path_end_distance_ratio = 0.3,
      -- when assigning rating to the best path this * start distances is considered
      cache_path_start_distance_rating_multiplier = 10,
      -- when assigning rating to the best path this * end distances is considered
      -- this is typically higher than value for the start to achieve better path end quality
      cache_path_end_distance_rating_multiplier = 20,

      -- somewhere along the path is stuck enemy we need to avoid
      -- this is mainly to handle situations when units have arrived and are attacking the target
      -- then units further in the back will use this and run around the target
      stale_enemy_with_same_destination_collision_penalty = 30,
      -- if there is a moving unit further than this we don't really care
      ignore_moving_enemy_collision_distance = 5,
      -- enemy is not moving/or is too close and has different destination
      enemy_with_different_destination_collision_penalty = 30,
      -- simplification for now - collision with everything else is this
      general_entity_collision_penalty = 10,
      -- collision penalty for successors of positions that require destroy to reach
      general_entity_subsequent_collision_penalty = 3,
      -- uptil this amount any client will be served by the path finder (no estimate on the path length)
      max_clients_to_accept_any_new_request = 10,
      -- from max_clients_to_accept_any_new_request till this one only those that have a short estimate will be served
      max_clients_to_accept_short_new_request = 100,
      -- this is the "threshold" to decide what is short and what is not
      direct_distance_to_consider_short_request = 100,
      -- if a short request takes more than this many steps, it will be rescheduled as a long request
      short_request_max_steps = 1000,
      -- How many steps will be allocated to short requests each tick, as a ratio of all available steps per tick
      short_request_ratio = 0.5,
      -- absolute minimum of steps that will be performed for every path find request no matter what
      min_steps_to_check_path_find_termination = 2000,
      -- if the amount of steps is higher than this times estimate of start to goal then path finding is terminated
      start_to_goal_cost_multiplier_to_terminate_path_find = 500.0
    },

    -- If a behavior fails this many times, the enemy (or enemy group)
    -- is destroyed.
    -- This solves biters stuck within their own base.
    max_failed_behavior_count = 3,

    -- These can't be changed through game.map_settings - you must use game.difficulty_settings
    difficulty_settings =
    {
       recipe_difficulty = defines.difficulty_settings.recipe_difficulty.normal,
       technology_difficulty = defines.difficulty_settings.technology_difficulty.normal,
       technology_price_multiplier = 1
    }
  }
})
