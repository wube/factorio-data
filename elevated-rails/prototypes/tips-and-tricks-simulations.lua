local simulations = {}

simulations.elevated_rails =
{
  init =
  [[
    require("__core__/lualib/story")
    player = game.simulation.create_test_player{name = "Nico-Sallach"}
    player.teleport{-2, -2}
    game.simulation.camera_player = player
    game.simulation.camera_position = {0, 0}
    game.simulation.camera_zoom = 1
    storage.character = player.character

	  game.surfaces[1].build_checkerboard{{-24, -13}, {22, 13}}

    for y = -13, 12 do
      game.surfaces[1].set_tiles{{name = "grass-4", position = {6, y}}}
      for x = 7, 21 do
        game.surfaces[1].set_tiles{{name = "water", position = {x, y}}}
      end
    end

    for y = -16, 12, 4 do
      game.surfaces[1].create_entity{name = "cliff", position = {5 ,y}, cliff_orientation = "north-to-south"}
    end

    game.surfaces[1].create_entities_from_blueprint_string
    {
      string = "0eNqVlNFqxCAQRf9lnl3oaEyiv1KWkt2VrZCYEN3SEPLvNQmUQufBeRJ15giX46xw619umn1IYFfw9zFEsO8rRP8MXb+fpWVyYMEnN4CA0A37bu58D5sAHx7uGyxuVwEuJJ+8O/uPzfIRXsPNzbngtzOm3Pv8TJcDIWAaY+4aw/5UJl2MgCUvuG3iH0UyKSREMSGKglRMiKYgmglpKEjNhBgK0nCDJZNtuRQyWlNMUfrE6Cziw8/ufl5WBBTfyqmqnFqutcJyarnm0pRTud4j6SxyzUfSWuS6j6S3yLVfkuIi139JmovcDyDpiA0XkyPO8/eY0PbPQBfw5eZ4lMsWq1bpuq4rrZuc5Q/Ot/dt",
      position = {-10,0}
    }

    local story_table =
    {
      {
        {
          name = "start",
          init = function() game.forces.player.chart(game.surfaces[1], {{-22, -13}, {22, 13}}) end,
          condition = story_elapsed_check(1)
        },
        { condition = function() return game.simulation.move_cursor({position = {-16.5, 3}}) end },
        {
          init = function()
            player.cursor_stack.set_stack{name = "rail", count = 50}
            player.insert{name = "rail-ramp", count = 1}
            player.insert{name = "rail-support", count = 1}
          end,
          condition = story_elapsed_check(0.5),
          action = function() game.simulation.activate_rail_planner() end
        },
        {
          condition = function() return game.simulation.move_cursor({position = {1, 3}}) end,
          action = function() game.simulation.control_press{control = "toggle-rail-layer", notify = true} end
        },
        {
          condition = story_elapsed_check(0.5),
          action = function() player.raw_build_from_cursor() end
        },
        { condition = story_elapsed_check(1) },
        { condition = function() return game.simulation.move_cursor({position = {1, 0}}) end },
        {
          condition = function() return game.simulation.move_cursor({position = {14, 0}}) end,
          action = function() player.raw_build_from_cursor() end
        },
        {
          condition = story_elapsed_check(1),
          action = function()
            game.simulation.deactivate_rail_planner()
            player.character.clear_items_inside()
          end
        },
        {
          condition = story_elapsed_check(3),
          action = function()
            local rails = game.surfaces[1].find_entities()
            for _, rail in pairs(rails) do
              if rail.name == "elevated-straight-rail" or rail.name == "rail-ramp" or rail.name == "rail-support" then
                rail.destroy()
              end
            end
            story_jump_to(storage.story, "start")
          end
        }
      }
    }
    tip_story_init(story_table)
  ]]
}

return simulations
