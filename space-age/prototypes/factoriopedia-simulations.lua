require("__base__/prototypes/factoriopedia-util");
local simulations = {}

-----------////////////////////////////////////////////////////////////// LOGISTICS

simulations.factoriopedia_turbo_underground_belt =
{
  init =
  [[
    game.simulation.camera_position = {0, 0.5}
    game.simulation.camera_zoom = 1.8
    game.surfaces[1].create_entities_from_blueprint_string
    {
      string = "0eNqVkM8KgzAMxt8l5yr4p8X1VcYYVoMENJXajon47mv1sMMOslPIl+T7JdnAjAFnR+xBb0Cd5QX0fYOFBm7HpHE7IWjwwRmbBe7RDc7GmBkcPewCKGpv0MX+EIDsyROeHkeyPjlMBl1sEBdeAma7xHHLiRstszqXAlbQVS4jqCeH3VmuBfh1Tl7Ec0hr/ODKv3HqmmaDP3DxVPI4ReX7PwEvdMsxUDZF3VRSKVVLJW/7/gFK3nh4",
      position = {0, 0}
    }
  ]]
}

-----------////////////////////////////////////////////////////////////// SPACE

simulations.factoriopedia_asteroid_collector =
{
  hide_factoriopedia_gradient = true,
  init =
  [[
    game.simulation.camera_position = {0, 0}

    for x = -8, 8, 1 do
      for y = -3, 3 do
        game.surfaces[1].set_tiles{{position = {x, y}, name = "empty-space"}}
      end
    end
    game.surfaces[1].create_entities_from_blueprint_string
    {
      string = "0eNqlkkEKgzAQRe8y62ShNdF6ldJFqmMZiElIYmmR3L3RCt10Uch25v8HD/4KN72g82Qi9CvQYE2A/rJCoLtRersZNSP0oEJEb2nkg9Uah2g9JAZkRnxCX6Urg0gaP2VnA0WyZqvnL29ODF45JXLjwAWnBuROqzhZP/PJLmZUeyexH4C6FFCVAg4FWaogSxVkqUJbqtCWKvwHyJOiiHMOfTfK4IE+7Mi6q5ruJKSUjZDinNIbTSvvCQ==",
      position = {-1, -1}
    }
    game.surfaces[1].create_entity{name = "asteroid-collector", position = {0, -1}, direction = defines.direction.east}
  ]]
}

local make_asteroid_simulation = function(name, wait)
  return
  [[
    require("__core__/lualib/story")
    game.simulation.camera_position = {0, 0}

    for x = -8, 8, 1 do
      for y = -3, 3 do
        game.surfaces[1].set_tiles{{position = {x, y}, name = "empty-space"}}
      end
    end

    for x = -1, 0, 1 do
      for y = -1, 0 do
        game.surfaces[1].set_chunk_generated_status({x, y}, defines.chunk_generated_status.entities)
      end
    end

    local story_table =
    {
      {
        {
          name = "start",
          action = function() game.surfaces[1].create_entity{name="]]..name..[[", position = {0, 0}, velocity = {0, 0.011}} end
        },
        {
          condition = story_elapsed_check(]]..wait..[[),
          action = function() story_jump_to(storage.story, "start") end
        }
      }
    }
    tip_story_init(story_table)
  ]]
end

simulations.factoriopedia_small_metallic_asteroid = { hide_factoriopedia_gradient = true, init = make_asteroid_simulation("small-metallic-asteroid", "7") }
simulations.factoriopedia_medium_metallic_asteroid = { hide_factoriopedia_gradient = true, init = make_asteroid_simulation("medium-metallic-asteroid", "9") }
simulations.factoriopedia_big_metallic_asteroid = { hide_factoriopedia_gradient = true, init = make_asteroid_simulation("big-metallic-asteroid", "11") }
simulations.factoriopedia_huge_metallic_asteroid = { hide_factoriopedia_gradient = true, init = make_asteroid_simulation("huge-metallic-asteroid", "18") }
simulations.factoriopedia_small_carbonic_asteroid = { hide_factoriopedia_gradient = true, init = make_asteroid_simulation("small-carbonic-asteroid", "7") }
simulations.factoriopedia_medium_carbonic_asteroid = { hide_factoriopedia_gradient = true, init = make_asteroid_simulation("medium-carbonic-asteroid", "9") }
simulations.factoriopedia_big_carbonic_asteroid = { hide_factoriopedia_gradient = true, init = make_asteroid_simulation("big-carbonic-asteroid", "11") }
simulations.factoriopedia_huge_carbonic_asteroid = { hide_factoriopedia_gradient = true, init = make_asteroid_simulation("huge-carbonic-asteroid", "18") }
simulations.factoriopedia_small_oxide_asteroid = { hide_factoriopedia_gradient = true, init = make_asteroid_simulation("small-oxide-asteroid", "7") }
simulations.factoriopedia_medium_oxide_asteroid = { hide_factoriopedia_gradient = true, init = make_asteroid_simulation("medium-oxide-asteroid", "9") }
simulations.factoriopedia_big_oxide_asteroid = { hide_factoriopedia_gradient = true, init = make_asteroid_simulation("big-oxide-asteroid", "11") }
simulations.factoriopedia_huge_oxide_asteroid = { hide_factoriopedia_gradient = true, init = make_asteroid_simulation("huge-oxide-asteroid", "18") }
simulations.factoriopedia_small_promethium_asteroid = { hide_factoriopedia_gradient = true, init = make_asteroid_simulation("small-promethium-asteroid", "7") }
simulations.factoriopedia_medium_promethium_asteroid = { hide_factoriopedia_gradient = true, init = make_asteroid_simulation("medium-promethium-asteroid", "9") }
simulations.factoriopedia_big_promethium_asteroid = { hide_factoriopedia_gradient = true, init = make_asteroid_simulation("big-promethium-asteroid", "11") }
simulations.factoriopedia_huge_promethium_asteroid = { hide_factoriopedia_gradient = true, init = make_asteroid_simulation("huge-promethium-asteroid", "18") }

-----------////////////////////////////////////////////////////////////// PRODUCTION

local make_collector_simulation = function(name, zoom, X, Y)
  return
  [[
    require("__core__/lualib/story")
    game.simulation.camera_zoom = ]]..zoom..[[
    game.simulation.camera_position = {]]..X..[[, ]]..Y..[[}
    game.surfaces[1].create_entity{name = "]]..name..[[", position = {0, 0}}
    local story_table =
    {
      {
        {
          name = "start",
          action = function() game.surfaces[1].execute_lightning{name = "lightning", position = {0, 2}} end
        },
        {
          condition = story_elapsed_check(1),
          action = function() story_jump_to(storage.story, "start") end
        }
      }
    }
    tip_story_init(story_table)
  ]]
end

simulations.factoriopedia_lightning_rod = { planet = "fulgora", init = make_collector_simulation("lightning-rod", "1.4", "0.5", "-1.5") }
simulations.factoriopedia_lightning_collector = { planet = "fulgora", init = make_collector_simulation("lightning-collector", "1.2", "0", "-2") }


-----------////////////////////////////////////////////////////////////// INTERMEDIATE PRODUCTS

simulations.factoriopedia_calcite = { init = make_resource("calcite") }
simulations.factoriopedia_tungsten_ore = { init = make_resource("tungsten-ore") }
simulations.factoriopedia_scrap = { init = make_resource("scrap") }


-----------////////////////////////////////////////////////////////////// COMBAT

simulations.factoriopedia_mech_armor =
{
  init =
  [[
    game.simulation.camera_zoom = 3.5
    game.simulation.camera_position = {0.5, -0.4}
    local character = game.surfaces[1].create_entity{name = "character", position = {0.5, 0.5}, force = "player", direction = defines.direction.south}
    character.insert{name = "mech-armor"}
  ]]
}

-----------////////////////////////////////////////////////////////////// ENEMIES

local make_enemy = function(name, zoom)
  return
    [[
    game.simulation.camera_zoom = ]]..zoom..[[
    game.simulation.camera_position = {0, 0}
    game.surfaces[1].build_checkerboard{{-40, -40}, {40, 40}}

    enemy = game.surfaces[1].create_entity{name = "]]..name..[[", position = {0, 0}}

    step_0 = function()
      if enemy.valid then
          game.simulation.camera_position = {enemy.position.x, enemy.position.y - 0.5}
      end

      script.on_nth_tick(1, function()
          step_0()
      end)
    end

    step_0()
  ]]
end

simulations.factoriopedia_gleba_enemy_small_stomper = { init = make_enemy("small-stomper-pentapod", 1.2) }
simulations.factoriopedia_gleba_enemy_medium_stomper = { init = make_enemy("medium-stomper-pentapod", 1.0) }
simulations.factoriopedia_gleba_enemy_big_stomper = { init = make_enemy("big-stomper-pentapod", 0.8) }
simulations.factoriopedia_gleba_enemy_small_strafer = { init = make_enemy("small-strafer-pentapod", 1.2) }
simulations.factoriopedia_gleba_enemy_medium_strafer = { init = make_enemy("medium-strafer-pentapod", 1.0) }
simulations.factoriopedia_gleba_enemy_big_strafer = { init = make_enemy("big-strafer-pentapod", 0.8) }
simulations.factoriopedia_gleba_enemy_small_wriggler = { init = make_enemy("small-wriggler-pentapod", 1.8) }
simulations.factoriopedia_gleba_enemy_medium_wriggler = { init = make_enemy("medium-wriggler-pentapod", 1.8) }
simulations.factoriopedia_gleba_enemy_big_wriggler = { init = make_enemy("big-wriggler-pentapod", 1.8) }
simulations.factoriopedia_gleba_enemy_small_wriggler_premature = { init = make_enemy("small-wriggler-pentapod-premature", 1.8) }
simulations.factoriopedia_gleba_enemy_medium_wriggler_premature = { init = make_enemy("medium-wriggler-pentapod-premature", 1.8) }
simulations.factoriopedia_gleba_enemy_big_wriggler_premature = { init = make_enemy("big-wriggler-pentapod-premature", 1.8) }

local make_worm_enemy = function(name, zoom)
  return
    [[
    game.simulation.camera_zoom = ]]..zoom..[[
    game.simulation.camera_position = {0, 0}
    game.surfaces[1].build_checkerboard{{-180, -180}, {180, 180}}

    for x = -5, 4, 1 do
      for y = -5, 4 do
        game.surfaces[1].set_chunk_generated_status({x, y}, defines.chunk_generated_status.entities)
      end
    end

    enemy = game.surfaces[1].create_entity{name = "]]..name..[[", position = {0, 0}}

    step_0 = function()
      if enemy.valid then
          game.simulation.camera_position = {enemy.position.x, enemy.position.y - 0.5}
      end

      script.on_nth_tick(1, function()
          step_0()
      end)
    end

    step_0()
  ]]
end

simulations.factoriopedia_vulcanus_enemy_small_demolisher = { init = make_worm_enemy("small-demolisher", 1.0) }
simulations.factoriopedia_vulcanus_enemy_medium_demolisher = { init = make_worm_enemy("medium-demolisher", 1.0) }
simulations.factoriopedia_vulcanus_enemy_big_demolisher = { init = make_worm_enemy("big-demolisher", 1.0) }

-----------////////////////////////////////////////////////////////////// ENVIRONMENT

simulations.factoriopedia_cliff_fulgora =
{
  planet = "fulgora",
  hide_factoriopedia_gradient = true,
  init =
  [[
    game.simulation.camera_position = {0, 2.5}
    for x = -8, 8, 1 do
      for y = -3, 4 do
        game.surfaces[1].set_tiles{{position = {x, y}, name = "fulgoran-sand"}}
      end
    end
    for x = -8, 8, 1 do
      for y = 3, 4 do
        game.surfaces[1].set_tiles{{position = {x, y}, name = "oil-ocean-deep"}}
      end
    end
    for x = -8, 8, 4 do
      game.surfaces[1].create_entity{name = "cliff-fulgora", position = {x, 0}, cliff_orientation = "west-to-east"}
    end
  ]]
}

simulations.factoriopedia_cliff_gleba =
{
  planet = "gleba",
  hide_factoriopedia_gradient = true,
  init =
  [[
    game.simulation.camera_position = {0, 2.5}
    for x = -8, 8, 1 do
      for y = -3, 4 do
        game.surfaces[1].set_tiles{{position = {x, y}, name = "highland-dark-rock"}}
      end
    end
    for x = -8, 8, 1 do
      for y = 3, 4 do
        game.surfaces[1].set_tiles{{position = {x, y}, name = "lowland-red-vein"}}
      end
    end
    for x = -8, 8, 4 do
      game.surfaces[1].create_entity{name = "cliff-gleba", position = {x, 0}, cliff_orientation = "west-to-east"}
    end
  ]]
}

simulations.factoriopedia_cliff_vulcanus =
{
  planet = "vulcanus",
  hide_factoriopedia_gradient = true,
  init =
  [[
    game.simulation.camera_position = {0, 2.5}
    for x = -8, 8, 1 do
      for y = -3, 4 do
        game.surfaces[1].set_tiles{{position = {x, y}, name = "volcanic-soil-dark"}}
      end
    end
    for x = -8, 8, 4 do
      game.surfaces[1].create_entity{name = "cliff-vulcanus", position = {x, 0}, cliff_orientation = "west-to-east"}
    end
  ]]
}

simulations.factoriopedia_crater_cliff =
{
  planet = "vulcanus",
  hide_factoriopedia_gradient = true,
  init =
  [[
    game.simulation.camera_zoom = 0.5
    game.simulation.camera_position = {-0.5, 1.5}
    for x = -28, 24, 1 do
      for y = -10, 14 do
        game.surfaces[1].set_tiles{{position = {x, y}, name = "volcanic-ash-dark"}}
      end
    end

    game.surfaces[1].create_entity{name = "crater-cliff", position = {-0.5, -3.324}, cliff_orientation = "west-to-east"}
    game.surfaces[1].create_entity{name = "crater-cliff", position = {-5.44922, -1.875}, cliff_orientation = "south-to-east"}
    game.surfaces[1].create_entity{name = "crater-cliff", position = {4.4492, -1.875}, cliff_orientation = "west-to-south"}
    game.surfaces[1].create_entity{name = "crater-cliff", position = {-7.5, 1.625}, cliff_orientation = "south-to-north"}
    game.surfaces[1].create_entity{name = "crater-cliff", position = {6.5, 1.625}, cliff_orientation = "north-to-south"}
    game.surfaces[1].create_entity{name = "crater-cliff", position = {-5.44922, 5.121}, cliff_orientation = "east-to-north"}
    game.surfaces[1].create_entity{name = "crater-cliff", position = {4.4492, 5.121}, cliff_orientation = "north-to-west"}
  ]]
}

simulations.factoriopedia_ashland_lichen_tree =
{
  planet = "vulcanus",
  hide_factoriopedia_gradient = true,
  init =
  [[
    game.simulation.camera_zoom = 1.4
    game.simulation.camera_position = {-0.5, 0}
    for x = -10, 9, 1 do
      for y = -4, 4 do
        game.surfaces[1].set_tiles{{position = {x, y}, name = "volcanic-soil-dark"}}
      end
    end

    game.surfaces[1].create_entity{name = "ashland-lichen-tree", position = {x=-2.54, y=-0.76}}
    game.surfaces[1].create_entity{name = "ashland-lichen-tree", position = {x=2.87, y=-0.37}}
    game.surfaces[1].create_entity{name = "ashland-lichen-tree", position = {x=-3.68, y=1.83}}
    game.surfaces[1].create_entity{name = "ashland-lichen-tree", position = {x=-0.10, y=0.67}}
    game.surfaces[1].create_entity{name = "ashland-lichen-tree", position = {x=4.80, y=1.69}}
  ]]
}

simulations.factoriopedia_ashland_lichen_tree_flaming =
{
  planet = "vulcanus",
  hide_factoriopedia_gradient = true,
  init =
  [[
    game.simulation.camera_zoom = 1.4
    game.simulation.camera_position = {-0.5, 0}
    for x = -10, 9, 1 do
      for y = -4, 4 do
        game.surfaces[1].set_tiles{{position = {x, y}, name = "volcanic-soil-dark"}}
      end
    end

    game.surfaces[1].create_entity{name = "ashland-lichen-tree-flaming", position = {x=-2.54, y=-0.76}}
    game.surfaces[1].create_entity{name = "ashland-lichen-tree-flaming", position = {x=2.87, y=-0.37}}
    game.surfaces[1].create_entity{name = "ashland-lichen-tree-flaming", position = {x=-3.68, y=1.83}}
    game.surfaces[1].create_entity{name = "ashland-lichen-tree-flaming", position = {x=-0.10, y=0.67}}
    game.surfaces[1].create_entity{name = "ashland-lichen-tree-flaming", position = {x=4.80, y=1.69}}
  ]]
}

simulations.factoriopedia_yumako_tree =
{
  planet = "gleba",
  hide_factoriopedia_gradient = true,
  init =
  [[
    game.simulation.camera_zoom = 1.4
    game.simulation.camera_position = {-0.5, 0}
    for x = -10, 9, 1 do
      for y = -4, 4 do
        game.surfaces[1].set_tiles{{position = {x, y}, name = "natural-yumako-soil"}}
      end
    end

    game.surfaces[1].create_entity{name = "yumako-tree", position = {x=-2.54, y=-0.76}, tick_grown = 1}
    game.surfaces[1].create_entity{name = "yumako-tree", position = {x=2.87, y=-0.37}, tick_grown = 8000}
    game.surfaces[1].create_entity{name = "yumako-tree", position = {x=-4.68, y=1.83}, tick_grown = 1000}
    game.surfaces[1].create_entity{name = "yumako-tree", position = {x=-0.10, y=0.67}, tick_grown = 10000}
    game.surfaces[1].create_entity{name = "yumako-tree", position = {x=4.80, y=1.69}, tick_grown = 1}
  ]]
}

simulations.factoriopedia_jellystem =
{
  planet = "gleba",
  hide_factoriopedia_gradient = true,
  init =
  [[
    game.simulation.camera_zoom = 1.4
    game.simulation.camera_position = {-0.5, 0}
    for x = -10, 9, 1 do
      for y = -4, 4 do
        game.surfaces[1].set_tiles{{position = {x, y}, name = "natural-jellynut-soil"}}
      end
    end

    game.surfaces[1].create_entity{name = "jellystem", position = {x=-2.54, y=-0.76}, tick_grown = 1}
    game.surfaces[1].create_entity{name = "jellystem", position = {x=2.87, y=-0.37}, tick_grown = 8000}
    game.surfaces[1].create_entity{name = "jellystem", position = {x=-4.68, y=1.83}, tick_grown = 1000}
    game.surfaces[1].create_entity{name = "jellystem", position = {x=-0.10, y=0.67}, tick_grown = 10000}
    game.surfaces[1].create_entity{name = "jellystem", position = {x=4.80, y=1.69}, tick_grown = 1}
  ]]
}

simulations.factoriopedia_cuttlepop =
{
  planet = "gleba",
  hide_factoriopedia_gradient = true,
  init =
  [[
    game.simulation.camera_zoom = 1.4
    game.simulation.camera_position = {-0.5, 0}
    for x = -10, 9, 1 do
      for y = -4, 4 do
        game.surfaces[1].set_tiles{{position = {x, y}, name = "wetland-dead-skin"}}
      end
    end

    game.surfaces[1].create_entity{name = "cuttlepop", position = {x=-2.54, y=-0.76}, tick_grown = 1}
    game.surfaces[1].create_entity{name = "cuttlepop", position = {x=2.87, y=-0.37}, tick_grown = 8000}
    game.surfaces[1].create_entity{name = "cuttlepop", position = {x=-4.68, y=1.83}, tick_grown = 1000}
    game.surfaces[1].create_entity{name = "cuttlepop", position = {x=-0.10, y=0.67}, tick_grown = 10000}
    game.surfaces[1].create_entity{name = "cuttlepop", position = {x=4.80, y=1.69}, tick_grown = 1}
  ]]
}

simulations.factoriopedia_sunnycomb =
{
  planet = "gleba",
  hide_factoriopedia_gradient = true,
  init =
  [[
    game.simulation.camera_zoom = 1.4
    game.simulation.camera_position = {-0.5, 0}
    for x = -10, 9, 1 do
      for y = -4, 4 do
        game.surfaces[1].set_tiles{{position = {x, y}, name = "highland-dark-rock"}}
      end
    end

    game.surfaces[1].create_entity{name = "sunnycomb", position = {x= 6.859375, y=-1.75}}
    game.surfaces[1].create_entity{name = "sunnycomb", position = {x= -0.765625, y=0.625}}
    game.surfaces[1].create_entity{name = "sunnycomb", position = {x= 3.859375, y=-0.0625}}
    game.surfaces[1].create_entity{name = "sunnycomb", position = {x= -6.078125, y=1.4375}}
    game.surfaces[1].create_entity{name = "sunnycomb", position = {x= -3.265625, y=3}}
    game.surfaces[1].create_entity{name = "sunnycomb", position = {x= -1.515625, y=2.6875}}
    game.surfaces[1].create_entity{name = "sunnycomb", position = {x= 0.671875, y=1.3125}}
    game.surfaces[1].create_entity{name = "sunnycomb", position = {x= 1.484375, y=2.4375}}
    game.surfaces[1].create_entity{name = "sunnycomb", position = {x= 6.109375, y=1.1875}}
    game.surfaces[1].create_entity{name = "sunnycomb", position = {x= 3.296875, y=3.375}}
  ]]
}

simulations.factoriopedia_boompuff =
{
  planet = "gleba",
  hide_factoriopedia_gradient = true,
  init =
  [[
    game.simulation.camera_zoom = 1.4
    game.simulation.camera_position = {-0.5, 0}
    for x = -10, 9, 1 do
      for y = -4, 4 do
        game.surfaces[1].set_tiles{{position = {x, y}, name = "midland-yellow-crust"}}
      end
    end

    game.surfaces[1].create_entity{name = "boompuff", position = {x= -5.93359375, y=-1.578125}}
    game.surfaces[1].create_entity{name = "boompuff", position = {x= -4.24609375, y=-1.828125}}
    game.surfaces[1].create_entity{name = "boompuff", position = {x= 0.62890625, y=-1.078125}}
    game.surfaces[1].create_entity{name = "boompuff", position = {x= 4.75390625, y=-1.390625}}
    game.surfaces[1].create_entity{name = "boompuff", position = {x= -6.05859375, y=0.484375}}
    game.surfaces[1].create_entity{name = "boompuff", position = {x= -3.68359375, y=-0.140625}}
    game.surfaces[1].create_entity{name = "boompuff", position = {x= -2.87109375, y=0.046875}}
    game.surfaces[1].create_entity{name = "boompuff", position = {x= -0.49609375, y=-0.515625}}
    game.surfaces[1].create_entity{name = "boompuff", position = {x= 1.25390625, y=1.109375}}
    game.surfaces[1].create_entity{name = "boompuff", position = {x= 3.87890625, y=-0.703125}}
    game.surfaces[1].create_entity{name = "boompuff", position = {x= 5.94140625, y=-0.765625}}
    game.surfaces[1].create_entity{name = "boompuff", position = {x= 6.87890625, y=0.640625}}
    game.surfaces[1].create_entity{name = "boompuff", position = {x= -7.99609375, y=3.109375}}
    game.surfaces[1].create_entity{name = "boompuff", position = {x= -4.55859375, y=1.421875}}
    game.surfaces[1].create_entity{name = "boompuff", position = {x= -3.18359375, y=1.234375}}
    game.surfaces[1].create_entity{name = "boompuff", position = {x= -2.12109375, y=2.421875}}
    game.surfaces[1].create_entity{name = "boompuff", position = {x= -1.24609375, y=2.609375}}
  ]]
}

simulations.factoriopedia_stingfrond =
{
  planet = "gleba",
  hide_factoriopedia_gradient = true,
  init =
  [[
    game.simulation.camera_zoom = 1.4
    game.simulation.camera_position = {-0.5, 0}
    for x = -10, 9, 1 do
      for y = -4, 4 do
        game.surfaces[1].set_tiles{{position = {x, y}, name = "midland-turquoise-bark"}}
      end
    end

    game.surfaces[1].create_entity{name = "stingfrond", position = {x= 7.9375, y=-4.8515625}}
    game.surfaces[1].create_entity{name = "stingfrond", position = {x= -5.6875, y=-4.5390625}}
    game.surfaces[1].create_entity{name = "stingfrond", position = {x= -6.125, y=0.7109375}}
    game.surfaces[1].create_entity{name = "stingfrond", position = {x= -4.9375, y=0.8359375}}
    game.surfaces[1].create_entity{name = "stingfrond", position = {x= 3, y=0.8359375}}
    game.surfaces[1].create_entity{name = "stingfrond", position = {x= 5.6875, y=0.9609375}}
    game.surfaces[1].create_entity{name = "stingfrond", position = {x= -3.5625, y=1.7109375}}
    game.surfaces[1].create_entity{name = "stingfrond", position = {x= -0.8125, y=2.8359375}}
    game.surfaces[1].create_entity{name = "stingfrond", position = {x= 2.375, y=2.8359375}}
    game.surfaces[1].create_entity{name = "stingfrond", position = {x= 4.6875, y=1.5859375}}
  ]]
}

simulations.factoriopedia_lickmaw =
{
  planet = "gleba",
  hide_factoriopedia_gradient = true,
  init =
  [[
    game.simulation.camera_zoom = 1.4
    game.simulation.camera_position = {-0.5, 0}
    for x = -10, 9, 1 do
      for y = -4, 4 do
        game.surfaces[1].set_tiles{{position = {x, y}, name = "lowland-red-vein"}}
      end
    end

    game.surfaces[1].create_entity{name = "lickmaw", position = {x= -7.984375, y=0.7109375}}
    game.surfaces[1].create_entity{name = "lickmaw", position = {x= -3.484375, y=0.6484375}}
    game.surfaces[1].create_entity{name = "lickmaw", position = {x= -0.609375, y=1.3984375}}
    game.surfaces[1].create_entity{name = "lickmaw", position = {x= 1.828125, y=2.2734375}}
    game.surfaces[1].create_entity{name = "lickmaw", position = {x= 6.640625, y=0.7734375}}
    game.surfaces[1].create_entity{name = "lickmaw", position = {x= 6.390625, y=2.4609375}}
    game.surfaces[1].create_entity{name = "lickmaw", position = {x= 5.078125, y=1.9609375}}
  ]]
}

simulations.factoriopedia_teflilly =
{
  planet = "gleba",
  hide_factoriopedia_gradient = true,
  init =
  [[
    game.simulation.camera_zoom = 1.4
    game.simulation.camera_position = {-0.5, 0}
    for x = -10, 9, 1 do
      for y = -4, 4 do
        game.surfaces[1].set_tiles{{position = {x, y}, name = "lowland-cream-cauliflower"}}
      end
    end

    game.surfaces[1].create_entity{name = "teflilly", position = {x= -5.34375, y=2.7890625}}
    game.surfaces[1].create_entity{name = "teflilly", position = {x= -3.78125, y=-1.7265625}}
    game.surfaces[1].create_entity{name = "teflilly", position = {x= -2.03125, y=-1.2265625}}
    game.surfaces[1].create_entity{name = "teflilly", position = {x= -0.96875, y=-1.9140625}}
    game.surfaces[1].create_entity{name = "teflilly", position = {x= 3.71875, y=-1.6640625}}
    game.surfaces[1].create_entity{name = "teflilly", position = {x= 5.90625, y=2.6640625}}
    game.surfaces[1].create_entity{name = "teflilly", position = {x= -5.28125, y=0.3359375}}
    game.surfaces[1].create_entity{name = "teflilly", position = {x= -0.03125, y=1.0859375}}
    game.surfaces[1].create_entity{name = "teflilly", position = {x= 1.03125, y=1.0859375}}
    game.surfaces[1].create_entity{name = "teflilly", position = {x= 3.28125, y=0.6484375}}
    game.surfaces[1].create_entity{name = "teflilly", position = {x= -5.90625, y=2.6484375}}
    game.surfaces[1].create_entity{name = "teflilly", position = {x= -4.15625, y=2.1484375}}
    game.surfaces[1].create_entity{name = "teflilly", position = {x= -2.03125, y=2.1484375}}
    game.surfaces[1].create_entity{name = "teflilly", position = {x= -1.15625, y=3.6484375}}
  ]]
}

simulations.factoriopedia_hairyclubnub =
{
  planet = "gleba",
  hide_factoriopedia_gradient = true,
  init =
  [[
    game.simulation.camera_zoom = 1.4
    game.simulation.camera_position = {-0.5, 0}
    for x = -10, 9, 1 do
      for y = -4, 4 do
        game.surfaces[1].set_tiles{{position = {x, y}, name = "wetland-green-slime"}}
      end
    end

    game.surfaces[1].create_entity{name = "hairyclubnub", position = {x= -0.90234375, y=1.85546875}}
    game.surfaces[1].create_entity{name = "hairyclubnub", position = {x= -0.90234375, y=2.04296875}}
    game.surfaces[1].create_entity{name = "hairyclubnub", position = {x= -4.65234375, y=0.26953125}}
    game.surfaces[1].create_entity{name = "hairyclubnub", position = {x= -1.83984375, y=-1.16796875}}
    game.surfaces[1].create_entity{name = "hairyclubnub", position = {x= -6.52734375, y=0.39453125}}
    game.surfaces[1].create_entity{name = "hairyclubnub", position = {x= 2.53515625, y=2.70703125}}
    game.surfaces[1].create_entity{name = "hairyclubnub", position = {x= 4.34765625, y=1.33203125}}
  ]]
}

simulations.factoriopedia_funneltrunk =
{
  planet = "gleba",
  hide_factoriopedia_gradient = true,
  init =
  [[
    game.simulation.camera_zoom = 1.4
    game.simulation.camera_position = {-0.5, 0}
    for x = -10, 9, 1 do
      for y = -4, 4 do
        game.surfaces[1].set_tiles{{position = {x, y}, name = "lowland-olive-blubber"}}
      end
    end

    game.surfaces[1].create_entity{name = "funneltrunk", position = {x= -5.68359375, y=1.86328125}}
    game.surfaces[1].create_entity{name = "funneltrunk", position = {x= -3.18359375, y=0.98828125}}
    game.surfaces[1].create_entity{name = "funneltrunk", position = {x= -1.80859375, y=1.67578125}}
    game.surfaces[1].create_entity{name = "funneltrunk", position = {x= -0.68359375, y=0.61328125}}
    game.surfaces[1].create_entity{name = "funneltrunk", position = {x= 1.06640625, y=1.05078125}}
    game.surfaces[1].create_entity{name = "funneltrunk", position = {x= 2.37890625, y=0.05078125}}
    game.surfaces[1].create_entity{name = "funneltrunk", position = {x= 2.44140625, y=1.05078125}}
    game.surfaces[1].create_entity{name = "funneltrunk", position = {x= 5.12890625, y=1.17578125}}
    game.surfaces[1].create_entity{name = "funneltrunk", position = {x= -4.74609375, y=2.11328125}}
  ]]
}

simulations.factoriopedia_slipstack =
{
  planet = "gleba",
  hide_factoriopedia_gradient = true,
  init =
  [[
    game.simulation.camera_zoom = 1.4
    game.simulation.camera_position = {-0.5, 0}
    for x = -10, 9, 1 do
      for y = -4, 4 do
        game.surfaces[1].set_tiles{{position = {x, y}, name = "wetland-red-tentacle"}}
      end
    end

    game.surfaces[1].create_entity{name = "slipstack", position = {x= 5.23828125, y=2.12890625}}
    game.surfaces[1].create_entity{name = "slipstack", position = {x= 3.17578125, y=-0.31640625}}
    game.surfaces[1].create_entity{name = "slipstack", position = {x= -3.69921875, y=0.55859375}}
    game.surfaces[1].create_entity{name = "slipstack", position = {x= -6.19921875, y=2.30859375}}
    game.surfaces[1].create_entity{name = "slipstack", position = {x= -2.88671875, y=1.37109375}}
    game.surfaces[1].create_entity{name = "slipstack", position = {x= 1.61328125, y=1.87109375}}
    game.surfaces[1].create_entity{name = "slipstack", position = {x= -1.19921875, y=3.18359375}}
  ]]
}

simulations.factoriopedia_fulgoran_ruin_attractor = { planet = "fulgora", init = make_collector_simulation("fulgoran-ruin-attractor", "1.2", "0.5", "-2") }

simulations.factoriopedia_lightning =
{
  planet = "fulgora",
  init =
  [[
    require("__core__/lualib/story")
    game.simulation.camera_position = {0, 0}
    local story_table =
    {
      {
        {
          name = "start",
          action = function() game.surfaces[1].execute_lightning{name = "lightning", position = {0, 2}} end
        },
        {
          condition = story_elapsed_check(1),
          action = function() story_jump_to(storage.story, "start") end
        }
      }
    }
    tip_story_init(story_table)
  ]]
}

return simulations
