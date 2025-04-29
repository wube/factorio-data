local simulations = {}

simulations.spidertron_control =
{
  init =
  [[
    require("__core__/lualib/story")
    player = game.simulation.create_test_player{name = "big k"}
    player.teleport({0, 2.5})
    game.simulation.camera_player = player
    game.simulation.camera_zoom = 1
    game.surfaces[1].build_checkerboard{{-22, -11}, {22, 11}}
    game.simulation.camera_player_cursor_position = player.position

    spider = game.surfaces[1].create_entity{name = "spidertron", position = {-8, 1.5}, force = "player"}

    local story_table =
    {
      {
        {
          name = "start",
          condition = story_elapsed_check(1),
        },
        {
          condition = function() return game.simulation.move_cursor({position = {player.position.x, player.position.y - 2.5}}) end,
          action = function() game.simulation.control_press{control = "give-spidertron-remote", notify = true} end
        },
        {
          condition = story_elapsed_check(1),
          action = function()
            if player.input_method ~= defines.input_method.game_controller then
              story_jump_to(storage.story, "add-spidertron-mouse-branch")
            end
          end
        },
        -- controller branch
        {
          condition = function() return game.simulation.move_cursor({position = {spider.position.x - 1.5, spider.position.y - 3}}) end,
          action = function() game.simulation.control_press{control = "select-for-blueprint", notify = true} end
        },
        {
          condition = function() return game.simulation.move_cursor({position = {spider.position.x + 1.5, spider.position.y}}) end,
          action = function() game.simulation.control_press{control = "select-for-blueprint", notify = true} end
        },
        {
          action = function() story_jump_to(storage.story, "add-spidertron-join-branch") end
        },
        -- mouse branch
        { action = function() end },
        {
          name = "add-spidertron-mouse-branch",
          condition = function() return game.simulation.move_cursor({position = {spider.position.x, spider.position.y - 1.5}}) end,
          action = function() game.simulation.control_press{control = "select-for-blueprint", notify = true} end
        },
        -- branch join
        { action = function() end },
        {
          name = "add-spidertron-join-branch",
          condition = story_elapsed_check(1)
        },
        {
          condition = function() return game.simulation.move_cursor({position = {8, 1.5}}) end,
          action = function() game.simulation.control_press{control = "use-item", notify = true} end
        },
        { condition = story_elapsed_check(2) },
        {
          condition = function() return game.simulation.move_cursor({position = {8, -5.5}, speed = 0.35}) end,
          action = function() game.simulation.control_press{control = "alternative-use-item", notify = true} end
        },
        {
          condition = function() return game.simulation.move_cursor({position = {-8, -5.5}, speed = 0.35}) end,
          action = function() game.simulation.control_press{control = "alternative-use-item", notify = true} end
        },
        {
          condition = function() return game.simulation.move_cursor({position = {-8, 1.5}, speed = 0.35}) end,
          action = function() game.simulation.control_press{control = "alternative-use-item", notify = true} end
        },
        {
          condition = story_elapsed_check(3.2),
          action = function()
            if player.input_method ~= defines.input_method.game_controller then
              story_jump_to(storage.story, "remove-spidertron-mouse-branch")
            end
          end
        },
        -- controller branch
        {
          condition = function() return game.simulation.move_cursor({position = {spider.position.x - 1.5, spider.position.y - 3}}) end,
          action = function() game.simulation.control_press{control = "deselect", notify = true} end
        },
        {
          condition = function() return game.simulation.move_cursor({position = {spider.position.x + 1.5, spider.position.y}}) end,
          action = function() game.simulation.control_press{control = "select-for-blueprint", notify = true} end
        },
        {
          action = function() story_jump_to(storage.story, "remove-spidertron-join-branch") end
        },
        -- mouse branch
        { action = function() end },
        {
          name = "remove-spidertron-mouse-branch",
          condition = function() return game.simulation.move_cursor({position = {spider.position.x, spider.position.y - 1.5}}) end,
          action = function() game.simulation.control_press{control = "deselect", notify = true} end
        },
        -- branch join
        { action = function() end },
        {
          name = "remove-spidertron-join-branch",
          condition = story_elapsed_check(1)
        },
        { condition = function() return game.simulation.move_cursor({position = player.position}) end },
        {
          condition = story_elapsed_check(3),
          action = function()
            player.clear_cursor()
            story_jump_to(storage.story, "start")
          end
        }
      }
    }
    tip_story_init(story_table)
  ]]
}

simulations.limit_chest =
{
  init =
  [[
    require("__core__/lualib/story")
    player = game.simulation.create_test_player{name = "big k"}
    player.teleport({-8.5, -1})
    game.simulation.camera_player = player
    game.simulation.camera_position = {0, 0.5}
    game.simulation.camera_alt_info = true
	  game.simulation.camera_player_cursor_position = player.position
	  storage.character = player.character
    player.character.direction = defines.direction.south

    game.surfaces[1].create_entities_from_blueprint_string
    {
      string = "0eNqdldtuozAQht/F16bCnEJ4lSpCHIbUkrGRbbqbRrx7xyFyu42jhXLHzPD9P/aMfSWtmGHSXFpSXQnvlDSker0Sw8+yES4mmxFIRaxupJmUtlELwpKFEi57+EsqttBAOQjorOZdBBL0+RKhAOih6eDbl8lyogSk5ZbDqnp7udRyHlvQiKb/x1EyKYMEJZ06Ug+UXEgVFajTzsMAujb8Axks9o9z/EMq8VIj9HweI684KRFQOb7kq07+ki8BXvpLXhzGZR5nLICIujcw9pHC4juGhTG5x3A5cImpZ6T8DkoRRH11bcBaLs/GVWkY1TvUM+YE7gb0NbcwYmpohAFK1vC6sXfVrtEo1anZtRvu7qh6F25sJKC52fBNdQr5L+iTdnzsgn/891zj6t+yWQB7+LYsBjS6fgQWz4AsCRDLzUaPe4weN2PLPVgWb+Yy9gxchsBsOzje5TjZ7zjf5DjdD842gbP94GITePtQe/DxF1Nt9QyhmWRfQylU04dmx+uWP36HEnuZVufTjJcK3gd/MO3OjNeE5jSl+QljzgEWfV1VlLzjyXJjJCXLyjQvDmkcF85Li6vbvdW+gC3LJ/CGSNU=",
      position = {-11, 0},
    }

    chest = game.surfaces[1].find_entity("steel-chest", {-8.5, 0.5})
    assert(chest)

    local story_table =
    {
      {
        {
          name = "start",
          condition = function() return game.simulation.move_cursor({position = chest.position}) end
        },
        {
          condition = story_elapsed_check(1),
          action = function() player.opened = chest end
        },
        { condition = story_elapsed_check(1) },
        {
          condition = function()
            local target = game.simulation.get_widget_position({type = "inventory-limit-slot-button"})
            return game.simulation.move_cursor({position = target})
          end
        },
        {
          condition = story_elapsed_check(0.25),
          action = function() game.simulation.mouse_click() end
        },
        {
          condition = function()
            local target = game.simulation.get_slot_position{inventory = "entity", inventory_index = defines.inventory.character_main, slot_index = 4}
            return game.simulation.move_cursor({position = target})
          end
        },
        {
          condition = story_elapsed_check(0.25),
          action = function() game.simulation.mouse_click() end
        },
        {
          condition = function() return game.simulation.move_cursor({position = player.position}) end
        },
        {
          condition = story_elapsed_check(0.25),
          action = function()
            inserter = game.surfaces[1].create_entity{name = "inserter", position = {chest.position.x, chest.position.y + 1}, direction = defines.direction.south, force = player.force, create_build_effect_smoke = false}
          end
        },
        {
          condition = story_elapsed_check(7),
          action = function() player.opened = nil end
        },
        {
          condition = story_elapsed_check(1),
          action = function()
            inserter.destroy()
            chest.destroy()
            chest = game.surfaces[1].create_entity{name = "steel-chest", position = {-8.5, 0.5}, force = player.force, create_build_effect_smoke = false}
            story_jump_to(storage.story, "start")
          end
        }
      }
    }
    tip_story_init(story_table)
  ]]
}

simulations.bulk_crafting =
{
  game_view_settings = { default_show_value = false, show_controller_gui = true, show_crafting_queue = true },
  init =
  [[
    require("__core__/lualib/story")
    player = game.simulation.create_test_player{name = "big k"}
    player.teleport({0, 4.5})
    game.simulation.camera_player = player
    game.simulation.camera_position = {0, 0.5}
    game.simulation.camera_player_cursor_position = player.position

    player.insert{name = "iron-plate", count = 100}
    player.insert{name = "iron-plate", count = 100}
    player.insert{name = "iron-gear-wheel", count = 100}
    player.insert{name = "iron-gear-wheel", count = 100}
    player.clear_inventory_highlights()
    player.opened = player

    local story_table =
    {
      {
        {
          name = "start",
          condition = function()
            local target = game.simulation.get_widget_position({type = "recipe-slot", data = "transport-belt"})
            return game.simulation.move_cursor({position = target})
          end
        },
        { condition = story_elapsed_check(1) },
        {
          init = function() game.simulation.control_down{control = "craft-5", notify = true} end,
          condition = story_elapsed_check(0.25)
        },
        {
          init = function() game.simulation.control_up{control = "craft-5"} end,
          condition = function() return game.simulation.move_cursor({position = player.position}) end
        },
        { condition = story_elapsed_check(3) },

        {
          condition = function()
            local target = game.simulation.get_widget_position({type = "recipe-slot", data = "burner-inserter"})
            return game.simulation.move_cursor({position = target})
          end,
          action = function() player.clear_inventory_highlights() end
        },
        { condition = story_elapsed_check(1) },
        {
          init = function() game.simulation.control_down{control = "craft-5", notify = true} end,
          condition = story_elapsed_check(0.25)
        },
        {
          init = function() game.simulation.control_up{control = "craft-5"} end,
          condition = function() return game.simulation.move_cursor({position = player.position}) end
        },
        { condition = story_elapsed_check(3) },

        {
          condition = function()
            local target = game.simulation.get_widget_position({type = "recipe-slot", data = "iron-chest"})
            return game.simulation.move_cursor({position = target})
          end,
          action = function() player.clear_inventory_highlights() end
        },
        { condition = story_elapsed_check(1) },
        {
          init = function() game.simulation.control_down{control = "craft-all", notify = true} end,
          condition = story_elapsed_check(0.25)
        },
        {
          init = function() game.simulation.control_up{control = "craft-all"} end,
          condition = function() return game.simulation.move_cursor({position = player.position}) end
        },

        {
          condition = story_elapsed_check(15),
          action = function()
            player.clear_items_inside()
            player.insert{name = "iron-plate", count = 100}
            player.insert{name = "iron-plate", count = 100}
            player.insert{name = "iron-gear-wheel", count = 100}
            player.insert{name = "iron-gear-wheel", count = 100}
            player.clear_inventory_highlights()
          end
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

simulations.e_confirm =
{
  init =
  [[
    require("__core__/lualib/story")
    player = game.simulation.create_test_player{name = "big k"}
    player.teleport({-8.5, -1.5})
    game.simulation.camera_player = player
    game.simulation.camera_position = {0, 0.5}
    game.simulation.camera_player_cursor_position = player.position
    player.character.direction = defines.direction.south
    game.surfaces[1].create_entities_from_blueprint_string
    {
      string = "0eNptkd2KwyAQhd9lrk2pSQzBV1mWEt1JV0g0609pGnz3NbZkF6o3cgbPd5jjBmIKuFilPfANlDTaAf/YwKmrHqZ95tcFgYPyOAMBPcy7skaYxVgPkYDSX3gHTuMnAdReeYVPRhbrRYdZoE0P3t0EFuOSweg9KUGquiOwAq9jJG+A+gC4IJwfsq+AaDKiKSGaA4ETSm+VrFCjva5VagDtOEgsEemLSECEcUR7ceqRIPR8nEJW+7cv/gR0iV/J73SXEtiJ5Qx6PrG4N5n75v++h8ANrcueuqdt37Cu61rG+tTVLwHtlQY=",
      position = {-7, -5},
    }

    game.forces.player.technologies["logistic-system"].research_recursive()
    game.forces.player.technologies["logistics"].researched = true -- for splitters to be selectable

    chest = game.surfaces[1].find_entities_filtered{name = "requester-chest"}[1]
    button = ""
    slot_data = ""

    local story_table =
    {
      {
        {
          name = "start",
          init = function()
            button = "0"
            slot_data = "transport-belt"
          end,
          condition = function() return game.simulation.move_cursor({position = chest.position, speed = 0.75}) end
        },
        {
          condition = story_elapsed_check(0.25),
          action = function() player.opened = chest end
        },
        { condition = story_elapsed_check(0.25) },
        {
          name = "continue",
          condition = function()
            local target = game.simulation.get_widget_position({type = "logistics-button", data = button})
            return game.simulation.move_cursor({position = target, speed = 0.45})
          end
        },
        {
          condition = story_elapsed_check(0.25),
          action = function() game.simulation.mouse_click() end
        },
        {
          condition = function()
            local target = game.simulation.get_widget_position({type = "signal-id-base", data = slot_data})
            return game.simulation.move_cursor({position = target, speed = 0.45})
          end
        },
        {
          condition = story_elapsed_check(0.35),
          action = function() game.simulation.mouse_click() end
        },
        {
          condition = story_elapsed_check(0.75),
          action = function()
            game.simulation.control_press{control = "confirm-gui", notify = true}
          end
        },
        {
          condition = story_elapsed_check(0.25),
          action = function()
            if button == "5" then button = "6" end
            if button == "4" then
              button = "5"
              slot_data = "storage-chest"
            end
            if button == "3" then
              button = "4"
              slot_data = "small-electric-pole"
            end
            if button == "2" then
              button = "3"
              slot_data = "inserter"
            end
            if button == "1" then
              button = "2"
              slot_data = "splitter"
            end
            if button == "0" then
              button = "1"
              slot_data = "underground-belt"
            end
            if button < "6" then story_jump_to(storage.story, "continue") end
          end
        },
        {
          condition = function() return game.simulation.move_cursor({position = player.position, speed = 0.5}) end,
          action = function() player.opened = nil end
        },
        {
          condition = story_elapsed_check(0.5),
          action = function()
            local position = chest.position
            chest.destroy()
            chest = game.surfaces[1].create_entity{name = "requester-chest", position = position, force = player.force, create_build_effect_smoke = false}
            story_jump_to(storage.story, "start")
          end
        }
      }
    }
    tip_story_init(story_table)
  ]]
}

simulations.electric_network =
{
  init =
  [[
    require("__core__/lualib/story")
    player = game.simulation.create_test_player{name = "big k"}
	  player.teleport({-9, 5.5})
    game.simulation.camera_player = player
    game.simulation.camera_position = {0, 0.5}
    game.simulation.camera_player_cursor_position = player.position
    game.surfaces[1].create_entities_from_blueprint_string
    {
      string = "0eNqtmNFyoyAUht+Fa+wIgjF5lU4mQ5R0mUV0ELub7eTdF0yj7Ra3ObS5MYp+58Dhx19e0FGPsrfKOLR7QaruzIB2jy9oUE9G6HDNnXuJdkg52SKMjGjDmbPCDH1nXXaU2qELRso08jfakcseI2mcckpeSdPJ+WDG9iitv2FmDJ0WNuuFkdqD+27wz3QmhPScjPIHjtEZ7coHfrngDxy6cFqhdSa1rJ1VddZ3WsZ4xStvE+cVM0/U9diOWrjOxjjkSokx2MxQ5qSMb8rqH3JwEUyRv6az9eng+f7DIJ1T5mkI91nZds/yMPo27aSVzSEUwTedhB4kRtfL11G+5d48C1PLJquVrUcVItfdGIpL8xyjtmumu1ympZjyWsoW6xB/06FBWh8tNiLbd11plPWVmNqJL5LvgbWqkYfBifrnYVB/ZAj3MVa5NrkiEau1iCwC3gDAGwi4AoBLCHgLAHMImOQAMgORCYBcgMgUQKYgcgEgExCZAcg5iMzvJ5MtiAwQIAEJkAAUSEAKJAAJEpAECUCDBKQUCtAgAambAjRIQEqhAA0SkLopQIMEpBQK0CABqZsCNAgSCgVIEKRtClAgSCYUIECQsumiP92JJmo81nB49qymH4M5/Wj2coBT+4JRc3aUUbNJgO61uE3QMFOjRJrgPSfYt/Wp+LxioapL3H+c4qdFY1DLf5vKYeGIpswTrGEs+Ri7THCH97IXOZ+8jc/+Z875Z2NQJZjNe/Pc3vX9wN6m+I5aAb4fWIq3vbMjLMXd3sumKewiXk1WpMDoCoylwPgKjKfA2ApsEde8CEgj7dPZa8HPspOoo6tocaVufFmO4+kk7W0+5fMvFm2TvFqvbF6wKmUwVnYu2DYFtpIZB7wZF9j3bmJch7czfoC/aRuD3LUOzd2pvrIOcZo6W+jKEs0L6IuPvyPuMfrl+xLG+JFijv2LlO/xozchHPu5Hf6HA/aZh//hgH1MvvcPTtt+uze7hBj5gRimYLQirCp4WZaM84pcLn8BFfCgsA==",
      position = {-2, 4},
    }
    pole = game.surfaces[1].find_entity("small-electric-pole", {-9.5, 1.5})
    local story_table =
    {
      {
        {
          name = "start",
          condition = function() return game.simulation.move_cursor({position = pole.position, speed = 0.1}) end
        },
        {
          condition = story_elapsed_check(0.25),
          action = function() player.opened = pole end
        },
        {
          condition = function() return game.simulation.move_cursor({position = player.position, speed = 0.1}) end
        },
        {
          condition = story_elapsed_check(60),
          action = function()
            player.opened = nil
            story_jump_to(storage.story, "start")
          end
        }
      }
    }
    tip_story_init(story_table)
  ]]
}

simulations.stack_transfers =
{
  init =
  [[
    require("__core__/lualib/story")
    player = game.simulation.create_test_player{name = "big k"}
    player.teleport({-1.5, 4.5})
    game.simulation.camera_player = player
    game.simulation.camera_position = {0, 0.5}
    game.simulation.camera_alt_info = true

    local chest = game.surfaces[1].create_entity{name = "wooden-chest", position = {1.5, 4.5}, force = player.force}
    player.insert{name = "iron-plate", count = 300}
    player.insert{name = "copper-plate", count = 300}
    player.insert{name = "iron-gear-wheel", count = 57}
    player.insert{name = "electronic-circuit", count = 224}
    player.clear_inventory_highlights()
    player.opened = chest

    local story_table =
    {
      {
        {
          name = "start",
          condition = function()
            local target = game.simulation.get_slot_position{inventory_index = defines.inventory.character_main, slot_index = 2}
            return game.simulation.move_cursor({position = target})
          end
        },
        { condition = story_elapsed_check(1) },
        {
          init = function() game.simulation.control_down{control = "stack-transfer", notify = true} end,
          condition = story_elapsed_check(0.25)
        },
        {
          init = function() game.simulation.control_up{control = "stack-transfer"} end,
          condition = story_elapsed_check(2.5)
        },
        {
          condition = function()
            local target = game.simulation.get_slot_position{inventory_index = defines.inventory.character_main, slot_index = 1}
            return game.simulation.move_cursor({position = target})
          end
        },
        { condition = story_elapsed_check(0.25) },
        {
          init = function() game.simulation.control_down{control = "stack-transfer", notify = true} end,
          condition = story_elapsed_check(0.25)
        },
        {
          init = function() game.simulation.control_up{control = "stack-transfer"} end,
          condition = story_elapsed_check(2.5)
        },
        {
          condition = function()
            local target = game.simulation.get_slot_position{inventory_index = defines.inventory.character_main, slot_index = 1}
            return game.simulation.move_cursor({position = target})
          end
        },
        { condition = story_elapsed_check(0.25) },
        {
          init = function() game.simulation.control_down{control = "inventory-transfer", notify = true} end,
          condition = story_elapsed_check(0.25)
        },
        {
          init = function() game.simulation.control_up{control = "inventory-transfer"} end,
          condition = story_elapsed_check(2.5)
        },
        {
          condition = function()
            local target = game.simulation.get_slot_position{inventory_index = defines.inventory.character_main, slot_index = 15}
            return game.simulation.move_cursor({position = target})
          end
        },
        { condition = story_elapsed_check(0.25) },
        {
          init = function() game.simulation.control_down{control = "inventory-transfer", notify = true} end,
          condition = story_elapsed_check(0.25)
        },
        {
          init = function() game.simulation.control_up{control = "inventory-transfer"} end,
          condition = story_elapsed_check(2.5)
        },
        {
          condition = function()
            local target = game.simulation.get_slot_position{inventory = "entity", inventory_index = defines.inventory.character_main, slot_index = 15}
            return game.simulation.move_cursor({position = target})
          end
        },
        { condition = story_elapsed_check(0.25) },
        {
          init = function() game.simulation.control_down{control = "inventory-transfer", notify = true} end,
          condition = story_elapsed_check(0.25)
        },
        {
          init = function() game.simulation.control_up{control = "inventory-transfer"} end,
          condition = story_elapsed_check(3)
        },
        {
          init = function()
            player.clear_inventory_highlights()
            story_jump_to(storage.story, "start")
          end
        }
      }
    }
    tip_story_init(story_table)
  ]]
}

simulations.clear_cursor =
{
  init =
  [[
    require("__core__/lualib/story")
    player = game.simulation.create_test_player{name = "big k"}
    player.teleport({0, 4.5})
    game.simulation.camera_player = player
    game.simulation.camera_position = {0, 0.5}
    game.simulation.camera_player_cursor_position = player.position

    player.insert{name = "iron-plate", count = 300}
    player.clear_inventory_highlights()
    player.opened = player

    local story_table =
    {
      {
        {
          name = "start",
          condition = function()
            local target = game.simulation.get_slot_position{inventory_index = defines.inventory.character_main, slot_index = 2}
            return game.simulation.move_cursor({position = target})
          end
        },
        {
          condition = story_elapsed_check(0.25),
          action = function() game.simulation.control_press{control = "pick-item", notify = false} end
        },
        { condition = story_elapsed_check(0.25) },
        { condition = function() return game.simulation.move_cursor({position = {player.position.x - 2, player.position.y - 0.5}}) end },
        {
          condition = story_elapsed_check(0.25),
          action = function() game.simulation.control_press{control = "clear-cursor", notify = true} end
        },
        {
          condition = story_elapsed_check(2),
          action = function() story_jump_to(storage.story, "start") end
        }
      }
    }
    tip_story_init(story_table)
  ]]
}

simulations.entity_transfers =
{
  init =
  [[
    require("__core__/lualib/story")
    player = game.simulation.create_test_player{name = "big k"}
    player.teleport({0, 2.5})
    game.simulation.camera_player = player
    game.simulation.camera_position = {0, 0.5}
    game.simulation.camera_alt_info = true
    game.simulation.camera_player_cursor_position = player.position

    game.surfaces[1].create_entity{name = "coal", position = {-5.5, -1.5}, amount = 123456}
    game.surfaces[1].create_entity{name = "coal", position = {-4.5, -1.5}, amount = 654321}
    game.surfaces[1].create_entity{name = "iron-ore", position = {-5.5, 1.5}, amount = 314159}

    game.surfaces[1].create_entities_from_blueprint_string
    {
      string = "0eNqV0ttuwyAMANB/8TOpFHJh5VemacrF6ywlJgKyLYr495GiTdWWtesTMsgHG7xCO8w4WWIPegXqDDvQjys4OnEzbHt+mRA0kMcRBHAzblE7W0abjcTEp6y3NAwQBBD3+AE6D+Km4LxhzF6i03R4kSvDkwBkT54wlXIOlmeexxZtxK8WIWAyLuYa3m6OXlYLWOISa4KeLHbpTG4l/pDlnXK5K9c7cvFH27/M4ovcQcr/ItUVpLqzx2TJ249Xf8PvxvTIWfeKzu+IxSGZ+aEK21+fx0JfzKGAN7QuXfSQl+ooVV4rdVRFCJ9StORn",
      position = {-1,0},
    }
    chest = game.surfaces[1].find_entities_filtered{name = "wooden-chest"}[1]
    drills = game.surfaces[1].find_entities_filtered{type = "mining-drill"}
    furnaces = game.surfaces[1].find_entities_filtered{type = "furnace"}
    resting_position = {0, -1}

    fast_entity_transfer = function()
      game.simulation.control_press{control = "fast-entity-transfer", notify = true}
    end

    local story_table =
    {
      {
        {
          name = "start",
          init = function()
            for k, drill in pairs (drills) do
              drill.clear_items_inside()
              drill.insert({name = "coal", count = 41})
            end
            for k, furnace in pairs (furnaces) do
              furnace.crafting_progress = 0
              furnace.clear_items_inside()
              furnace.get_output_inventory().insert({name = "iron-plate", count = 40})
            end
            chest.clear_items_inside()
            chest.insert({name = "iron-ore", count = 80})
            player.clear_items_inside()
          end,
          condition = function() return game.simulation.move_cursor({position = drills[1].position}) end
        },
        {
          condition = story_elapsed_check(0.5),
          action = function() fast_entity_transfer() end
        },
        { condition = story_elapsed_check(1) },
        {
          condition = function() return game.simulation.move_cursor({position = drills[2].position, speed = 0.075}) end,
          action = function() fast_entity_transfer() end
        },
        { condition = story_elapsed_check(1) },
        { condition = function() return game.simulation.move_cursor({position = resting_position}) end },
        {
          condition = story_elapsed_check(0.5),
          action = function()
            local stack = player.get_main_inventory().find_item_stack("coal")
            stack.swap_stack(player.cursor_stack)
          end
        },
        { condition = function() return game.simulation.move_cursor({position = furnaces[1].position, speed = 0.1}) end },
        {
          condition = story_elapsed_check(0.5),
          action = function() fast_entity_transfer() end
        },
        { condition = story_elapsed_check(1) },
        {
          condition = function() return game.simulation.move_cursor({position = furnaces[2].position, speed = 0.1}) end,
          action = function() fast_entity_transfer() end
        },
        { condition = story_elapsed_check(1) },
        { condition = function() return game.simulation.move_cursor({position = chest.position}) end },
        {
          condition = story_elapsed_check(0.5),
          action = function() fast_entity_transfer() end
        },
        { condition = story_elapsed_check(1) },
        { condition = function() return game.simulation.move_cursor({position = resting_position}) end },
        {
          condition = story_elapsed_check(0.5),
          action = function()
            local stack = player.get_main_inventory().find_item_stack("iron-ore")
            stack.swap_stack(player.cursor_stack)
          end
        },
        { condition = function() return game.simulation.move_cursor({position = furnaces[1].position, speed = 0.1}) end },
        {
          condition = story_elapsed_check(0.5),
          action = function() fast_entity_transfer() end
        },
        { condition = story_elapsed_check(1) },
        {
          condition = function() return game.simulation.move_cursor({position = furnaces[2].position, speed = 0.1}) end,
          action = function() fast_entity_transfer() end
        },
        { condition = story_elapsed_check(1) },
        { condition = function() return game.simulation.move_cursor({position = resting_position}) end },
        { condition = story_elapsed_check(0.5) },
        { condition = function() return game.simulation.move_cursor({position = furnaces[1].position, speed = 0.1}) end },
        {
          condition = story_elapsed_check(0.5),
          action = function() fast_entity_transfer() end
        },
        { condition = story_elapsed_check(1) },
        {
          condition = function() return game.simulation.move_cursor({position = furnaces[2].position, speed = 0.1}) end,
          action = function() fast_entity_transfer() end
        },
        { condition = story_elapsed_check(1) },
        { condition = function() return game.simulation.move_cursor({position = player.position}) end },
        {
          condition = story_elapsed_check(2),
          action = function() story_jump_to(storage.story, "start") end
        }
      }
    }
    tip_story_init(story_table)
  ]]
}

simulations.z_drop =
{
  init =
  [[
    require("__core__/lualib/story")
    player = game.simulation.create_test_player{name = "big k"}
    player.teleport({0, 1.5})
    game.simulation.camera_player = player
    game.simulation.camera_position = {0, 0.5}
    game.simulation.camera_alt_info = true
    game.simulation.camera_player_cursor_position = player.position

    game.surfaces[1].create_entities_from_blueprint_string
    {
      string = "0eNqV1NtugzAMANB/8XOoyiWU8ivVhLi4XSRwUBKqVRX/voSql62wkcfEybEfbF+hagfslSAD+RVELUlDfriCFicqW3dnLj1CDsJgBwyo7NxJG0kYHAdFZY0wMhDU4Bfk4cj+/WtUSbqXygQVtublczR+MEAywgi8VTEdLgUNXYXK6ksGg15q+02Sy2qpIEw2nMEF8mzDbYZGKKxv8cSV+AuOPODIB4494NgHTjzgrQ/MPeDQB07Xw5mPu1vv7n3cbL2b+rj79e7Oxw23D7iVZWOv3sEljj0mlfrBjeS7/pw9QUdBNhbUn6jnyv7ZyPfnhUZjBJ20e6awk2csBhtrDSpsCrcjbMioAce5/M8RFUrSYu7o3uxuTmeheGGJzfT3XZp1kvVO/JfD1zvhw7GLclqq+cv+ZnBGpaf3URYmWczTNE043+3H8RtUuPE+",
      position = {5, 0},
    }
    item_count = 0

    local story_table =
    {
      {
        {
          name = "start",
          init = function() item_count = 50 end,
          condition = story_elapsed_check(0.5),
          action = function() player.cursor_stack.set_stack({name = "iron-ore", count = 50}) end,
        },
        { condition = function() return game.simulation.move_cursor({position = {-3.5, -2.5}}) end },
        {
          name = "drop_ground",
          condition = story_elapsed_check(0.15),
          action = function()
            game.simulation.control_press{control = "drop-cursor", notify = false}
            item_count = item_count - 1
          end
        },
        { action = function() if item_count > 35 then story_jump_to(storage.story, "drop_ground") end end },
        { condition = function() return game.simulation.move_cursor({position = {-3.5, 2.5}}) end },
        {
          name = "drop_chest",
          condition = story_elapsed_check(0.15),
          action = function()
            game.simulation.control_press{control = "drop-cursor", notify = false}
            item_count = item_count - 1
          end
        },
        { action = function() if item_count > 25 then story_jump_to(storage.story, "drop_chest") end end },
        { condition = function() return game.simulation.move_cursor({position = {2.5, -1.5}}) end },
        {
          name = "drop_belt",
          condition = story_elapsed_check(0.15),
          action = function()
            game.simulation.control_press{control = "drop-cursor", notify = false}
            item_count = item_count - 1
          end
        },
        { action = function() if item_count > 15 then story_jump_to(storage.story, "drop_belt") end end },
        { condition = function() return game.simulation.move_cursor({position = {2.0, 2.0}}) end },
        {
          action = function()
            player.selected.insert("coal")
            game.simulation.control_press{control = "drop-cursor", notify = false}
          end
        },
        { condition = function() return game.simulation.move_cursor({position = {4.0, 2.0}}) end },
        {
          action = function()
            player.selected.insert("coal")
            game.simulation.control_press{control = "drop-cursor", notify = false}
          end
        },
        { condition = function() return game.simulation.move_cursor({position = {6.0, 2.0}}) end },
        {
          action = function()
            player.selected.insert("coal")
            game.simulation.control_press{control = "drop-cursor", notify = false}
          end
        },
        { condition = function() return game.simulation.move_cursor({position = player.position}) end },
        {
          condition = story_elapsed_check(0.5),
          action = function()
            player.clear_cursor()
            for k, v in pairs (game.surfaces[1].find_entities()) do
              if v.type == "item-entity" then
                v.destroy()
              else
                v.clear_items_inside()
              end
            end
          end
        },
        {
          condition = story_elapsed_check(0.5),
          action = function() story_jump_to(storage.story, "start") end
        }
      }
    }
    tip_story_init(story_table)
  ]]
}

simulations.show_info =
{
  init =
  [[
    game.simulation.camera_position = {0, 0.5}
    local width = 0

    function box_width(box)
      return box.right_bottom.x - box.left_top.x
    end

    function box_height(box)
      return box.right_bottom.y - box.left_top.y
    end

    local entity_prototypes = prototypes.entity

    local assembler_box = entity_prototypes["assembling-machine-1"].selection_box
    local mining_drill_box = entity_prototypes["burner-mining-drill"].selection_box
    local wooden_chest_box = entity_prototypes["wooden-chest"].selection_box
    local lab_box = entity_prototypes["lab"].selection_box
    local first_row_width = box_width(assembler_box) + 1 + box_width(mining_drill_box) + 1 + box_width(wooden_chest_box) + 1 + box_width(lab_box)
    local first_row_height = math.max(box_height(assembler_box), box_height(mining_drill_box), box_height(wooden_chest_box), box_height(lab_box))

    local steam_engine_box = entity_prototypes["steam-engine"].selection_box
    local boiler_box = entity_prototypes["boiler"].selection_box
    local second_row_width = box_height(steam_engine_box) + 1 + box_width(boiler_box) + 1 + 2 -- two 2 is for the pipes formation
    local second_row_height = math.max(box_width(steam_engine_box), box_height(boiler_box), 2) -- two 2 is for the pipes formation

    local height = first_row_height + 1 + second_row_height
    local y = (-height) / 2 + first_row_height / 2
    local x = (-first_row_width) / 2

    local assembler = game.surfaces[1].create_entity{name = "assembling-machine-1", position = {x - assembler_box.left_top.x, y}, force = "player"}
    assembler.set_recipe("iron-gear-wheel")
    x = x + box_width(assembler_box) + 1

    game.surfaces[1].create_entity{name = "burner-mining-drill", position = {x - mining_drill_box.left_top.x, y}, direction = defines.direction.east, force = "player"}
    x = x + box_width(mining_drill_box) + 1

    local chest = game.surfaces[1].create_entity{name = "wooden-chest", position = {x - wooden_chest_box.left_top.x, y}, force = "player"}
    chest.get_output_inventory().insert{name = "iron-plate", count = 1}
    chest.get_output_inventory().insert{name = "iron-gear-wheel", count = 1}
    chest.get_output_inventory().insert{name = "electronic-circuit", count = 1}
    x = x + box_width(wooden_chest_box) + 1

    local lab = game.surfaces[1].create_entity{name = "lab", position = {x - lab_box.left_top.x, y}, force = "player"}
    lab.get_output_inventory().insert{name = "automation-science-pack", count=1}

    y = y + (first_row_height + second_row_height) / 2 + 1
    x = (-second_row_width) / 2

    game.surfaces[1].create_entity{name = "steam-engine", position = {x - steam_engine_box.left_top.y, y}, force = "player", direction = defines.direction.east}
    x = x + box_height(steam_engine_box) + 1 --box height as it is rotated

    game.surfaces[1].create_entity{name = "boiler", position = {x - boiler_box.left_top.x, y}, force = "player"}
    x = x + box_width(boiler_box) + 1

    local pipe = game.surfaces[1].create_entity{name = "pipe", position = {x + 0.5, y}, force = "player"}
    pipe.insert_fluid{name = "water", amount = 100}
    game.surfaces[1].create_entity{name = "pipe-to-ground", position = {x + 0.5, y - 1}, force = "player", direction = defines.direction.south}
    game.surfaces[1].create_entity{name = "pipe-to-ground", position = {x + 1.5, y}, force = "player", direction = defines.direction.west}
  ]],
  update =
  [[
    game.simulation.camera_alt_info = (game.tick % 120) < 60
  ]]
}

simulations.pipette =
{
  game_view_settings = { default_show_value = false, show_controller_gui = true, show_quickbar = true, update_entity_selection = true },
  init =
  [[
    require("__core__/lualib/story")
    game.simulation.active_quickbars = 1
    player = game.simulation.create_test_player{name = "big K"}
    player.character.teleport{0, 4}
    game.simulation.camera_player = player
    game.simulation.camera_position = {0, 0.5}
    game.simulation.camera_player_cursor_position = player.position
    player.set_quick_bar_slot(1,'burner-inserter')

    game.surfaces[1].create_entities_from_blueprint_string
    {
      string = "0eNqV1FFqhDAQBuC7zHNcTDQac5WlFHWnJaBRklgq4t0bXdoui9LOYzTz+Tsks0DTTTg6YwPoBUw7WA/6uoA377butmdhHhE0mIA9MLB1v62Cq60fBxeSBrsAKwNjb/gJmq/sz2IfBovJ2+Rs3eJDrVhfGKANJhi8p9gX86ud+gZdxE8IBuPgY9Vgt29GKREpgxl0tW5xnhTxb4WrcyU768VBmPIid4jzi4y/ezMO2/uG/EDOCXJBkiVBliS5IMg5SS4JckaSFUEWJLn6kZt4ttAlxnp0Ib46OqnfdPpMqwOap4TUnJSacwKd0mhB6AhXtI4QbiKvaLEJV/E39QEd59o+AvXDuGXwgc7vG4TiucpkURS5lGUcN19DUdJu",
      position = {-6,0},
    }

    local story_table =
    {
      {
        {
          name = "start",
          init = function()
            player.insert("transport-belt")
            player.insert("stone-furnace")
            player.insert("burner-inserter")
          end,
          condition = story_elapsed_check(1)
        },
        { condition = function() return game.simulation.move_cursor({position = {-1, -1}}) end },
        {
          condition = story_elapsed_check(0.25),
          action = function() game.simulation.control_press{control = "pipette", notify = true} end
        },
        { condition = story_elapsed_check(0.25) },
        { condition = function() return game.simulation.move_cursor({position = {1, -1}}) end},
        {
          init = function() game.simulation.control_down{control = "build", notify = false} end,
          condition = function() return game.simulation.move_cursor({position = {3, -1}}) end,
          action = function() game.simulation.control_up{control = "build"} end
        },
        {
          condition = story_elapsed_check(0.25),
          action = function() player.clear_cursor() end
        },
        { condition = story_elapsed_check(0.25),
          action = function()
            if player.input_method ~= defines.input_method.game_controller then
              story_jump_to(storage.story, "inserter-mouse-branch")
            end
          end
        },
        -- controller branch
        {
          action = function() player.opened = player end
        },
        { condition = story_elapsed_check(0.25) },
        {
          condition = function()
            local target = game.simulation.get_widget_position({type = "recipe-slot", data = "burner-inserter"})
            return game.simulation.move_cursor({position = target})
          end
        },
        { condition = story_elapsed_check(0.25),
          action = function()
            story_jump_to(storage.story, "inserter-pipette")
          end
        },
        -- mouse branch
        { action = function() end }, --called by story_jump_to(storage.story, "inserter-mouse-branch")
        {
          name = "inserter-mouse-branch",
          condition = function()
            local target = game.simulation.get_widget_position({type = "quickbar-slot", data = "burner-inserter"})
            return game.simulation.move_cursor({position = target})
          end
        },
        { condition = story_elapsed_check(0.25) },
        -- branch join
        {
          name = "inserter-pipette",
          action = function()
            game.simulation.control_press{control = "pipette", notify = true}
            game.simulation.camera_player_cursor_direction = defines.direction.south
          end
        },
        {
          condition = story_elapsed_check(0.25),
          action = function() player.opened = nil end
        },
        { condition = story_elapsed_check(0.25) },
        {
          condition = function() return game.simulation.move_cursor({position = {0.5, 0.5}}) end,
          action = function() game.simulation.control_press{control = "build", notify = false} end
        },
        { condition = story_elapsed_check(0.25) },
        {
          condition = function() return game.simulation.move_cursor({position = {2.5, 0.5}}) end,
          action = function() game.simulation.control_press{control = "build", notify = false} end
        },
        {
          condition = story_elapsed_check(0.25),
          action = function() player.clear_cursor() end
        },
        { condition = story_elapsed_check(0.25) },
        {
          condition = story_elapsed_check(0.25),
          action = function() player.opened = player end
        },
        { condition = story_elapsed_check(0.25) },
        {
          condition = function()
            local target = game.simulation.get_widget_position({type = "recipe-slot", data = "transport-belt"})
            return game.simulation.move_cursor({position = target})
          end
        },
        {
          condition = story_elapsed_check(0.25),
          action =
            function() game.simulation.control_press{control = "pipette", notify = true}
            game.simulation.camera_player_cursor_direction = defines.direction.east
          end
        },
        {
          condition = story_elapsed_check(0.25),
          action = function() player.opened = nil end
        },
        { condition = story_elapsed_check(0.25) },
        { condition = function() return game.simulation.move_cursor({position = {-0.5, 1.5}}) end},
        {
          init = function() game.simulation.control_down{control = "build", notify = false} end,
          condition = function() return game.simulation.move_cursor({position = {2.5, 1.5}}) end,
          action = function() game.simulation.control_up{control = "build"} end
        },
        {
          condition = story_elapsed_check(0.25),
          action = function() player.clear_cursor() end
        },
        { condition = story_elapsed_check(0.25) },
        { condition = function() return game.simulation.move_cursor({position = player.position}) end },
        {
          condition = story_elapsed_check(1),
          action = function()
            for k, v in pairs (game.surfaces[1].find_entities_filtered{area = {{0, -2}, {3,  2}}}) do
              v.destroy()
            end
            local belt = game.surfaces[1].find_entity("transport-belt", {-0.5, 1.5})
            belt.destroy()
            player.character.clear_items_inside()
            story_jump_to(storage.story, "start")
          end
        }
      }
    }
    tip_story_init(story_table)
  ]]
}

simulations.inserters =
{
  init_update_count = 350,
  init =
  [[
    game.simulation.camera_position = {0, 0.5}

    game.surfaces[1].create_entities_from_blueprint_string
    {
      string = "0eNqll+2OoyAUhu+F3zgREKu9laZprD12SSwYxJntNt77gk5td0a3nl3/GEWe88HhvHIjx7qDxirtyPZGVGl0S7a7G2nVWRd1eOeuDZAtUQ4uhBJdXMKTs4VuG2NddITakZ4SpU/wk2xZT19Obp3REFWd1UUJT3N5v6cEtFNOwejF8HA96O5yBOvhEwJqKJ1VZQQa7Pkaef/BVgFHSWNaTzA62PfUiPtp10Cn5KSsnzeMZZQcu6oCe2jVL49k8XSFEL5Y5g/nL0VdR5P9xtRzNln+Jkerb7Kf4YmlTH5HCfaJ2njUHyEkM+AEAY4xYDmBO79a9myNvy+heb6IplNN6KYLlfPNUoqylLy2ZDq3YGqzPlucY7KVIcACA84RYFThsBhBRlUOY+vJLEeROYKcociPDap0C9Z3lznmZonJ+Bz0sTlrU5xmkdOmzPsV9cvkv/albL4vsXShS8+g0hE0i9k8pa9S2o9F5Q9o/9qGWDxk8T7h0IJzSp/b8KGFi3mHQ+fHar8WcDoESfFDVVG3QMn4ehSNu2FrdGRscL30HcTrm/QlfjGnMFi4qIZi8GcSrv1sJI+d/GH8XL0Yx1RgQxxzqHw1Kn2B4jGqPD8z+6o+OVu/+PkIFrPecZx3Yp13CM18JFCs2e08wW4jeecv6DuXCGcTnLMpAi1xaIQeMo5DIxSRCRwaoYksRqEFQhQZw6EZ5jcnX2a//qESHGMqWWFqWZGEWKFx/xFKsl5YvqwHTlec7aAP55EP71/QlR2nknq9lXu6Czfqm4bc+w+Gs8326RxFybuXosERnrEkEzJN00TKTd73vwFllmBS",
      position = {0, -3},
    }

    local furnaces = game.surfaces[1].find_entities_filtered{name = "stone-furnace"}
    storage.furnace_1 = furnaces[2]
    storage.furnace_2 = furnaces[1]
    local chests = game.surfaces[1].find_entities_filtered{name = "wooden-chest"}
    storage.chest_1 = chests[1]
    storage.chest_2 = chests[2]
    script.on_nth_tick(600, function()
      storage.furnace_1.clear_items_inside()
      storage.furnace_1.insert("coal")
      storage.furnace_2.insert("coal")
      storage.furnace_2.insert("iron-ore")
      storage.chest_1.insert("iron-gear-wheel")
      storage.chest_2.clear_items_inside()
    end)
  ]]
}

simulations.long_inserters =
{
  init_update_count = 350,
  init =
  [[
    game.simulation.camera_position = {0, 0.5}

    game.surfaces[1].create_entities_from_blueprint_string
    {
      string = "0eNqll9GOqjAQht+l12VjC0XxVYwxCKPbBFtSyno8hnc/g3rQXcsus3phAi3f/DPTmbZntq1aqJ02ni3PTBfWNGy5OrNG701e9e/8qQa2ZNrDgXFm8kP/5F1umto6H22h8qzjTJsS/rCl6NacgfHaa7iSLg+njWkPW3A4YWA0h7yqIqig8E4XUW0rQAO1bfBba3rTyIvE4k1xdmLL+E11HX/iyYE3kMCA258i9AncLi+C1PTClCh82+524DaN/osQMRt+AVvxYEubnTY4FBXv0PiAgXh2k52hbD7M3zTgvTb7pp/n4GA/YNPiWIVSodz0QcahXV41wNn19TWKN7uFrWtwUV3lvnersG2fOFTN2cGW/YzcRxXkF033lIQCl/w2EYtwItTAO1qUYkZDI7KH0ARA6QCqrNlH7zm6UWI2G3AYjhBw/inWpXboyWVcyAB/Plmo+l7o4kFoXgalDctAiM/K8NtbYdnW121fQk/87J4hbw1ER0zTd4kRIqxTzCaC0p9AYqwBBDwX/2Hya1aSEFoS0DMa+l62LS4lt3dYNeUYXGbj8CFn2oykTCQkW8kEW+PrQ6jpMZOSFrOUgI5p6DkBTVxECwKauIjIxTi2X82oIDkCIhSjyEjOSvnrFvxsINiDZUxtSWPhTKigsXAq6n6ofpJGqCGR0BJEqKG7zmloQg0JWlORGQFNayrxjICmVX5MqTNav4olZbd4aWOKSZvga/tSnEw4GL3gipp+DP+SD9ox3LsWuv4+c0R9/TF8JbjiCVdrvsJ/ji1DrXH4cjVaPtykOPvAc/tFhlyIZBGrNE0TpeZZ1/0D1DZdaw==",
      position = {0,-3},
    }

    local chests = game.surfaces[1].find_entities_filtered{name = "wooden-chest"}
    storage.chest_1 = chests[1]
    storage.chest_2 = chests[2]
    script.on_nth_tick(600, function()
      storage.chest_1.insert("iron-gear-wheel")
      storage.chest_2.clear_items_inside()
    end)
  ]]
}

simulations.steam_power =
{
  init_update_count = 100,
  init =
  [[
    game.simulation.camera_position = {0, 0.5}

    for x = -8, -7, 1 do
      for y = -3, -1 do
        game.surfaces[1].set_tiles{{position = {x, y}, name = "water"}}
      end
    end

    game.surfaces[1].create_entities_from_blueprint_string
    {
      string = "0eNqV1O9ugyAQAPB3uc/YFBT/vUrTLLa9diQIBLSbMb770DbOGVa3j4fcjzv07OEkWzRWqAbKHsRZKwfloQcnbqqS41rTGYQSRIM1EFBVPUauwaqOUN2EQhgICHXBTyjpQDZTbXWp7CKHDUcCqBrRCHycPQXdm2rrE1qPrlIJGO38bq3GM7wQxTtOoIMy2/FhrGAFsBnQ16t71xYj09YmADH2lHIvEbgIi+fHc8oCcDzDRvhOAx5deAEg2QT2rwG+BdDiCRRhIP0z8EsF2fc3UVdSRij9lVlxjoyWQY++Lij/p5e85oqZO2kh0QY7nICxsJ/vPAl4dL95YdmzogkMEXSTSLcIFp7EABUvqVV7fvA+fDxO3SEjnOSEH/3aNK/l4s9A4I7WTUksp0ke8zRNE86zYhi+AJb1W1w=",
      position = {4, -1}
    }
    local boiler = game.surfaces[1].find_entities_filtered{name = "boiler"}[1]
    boiler.insert("solid-fuel")
    script.on_nth_tick(100, function() boiler.insert("solid-fuel") end)
  ]]
}

simulations.insertion_limits =
{
  init_update_count = 150,
  init =
  [[
    game.simulation.camera_position = {0, 0.5}

    game.surfaces[1].create_entities_from_blueprint_string
    {
      string = "0eNrFmd1yqyAUhd+Fa+0IiDF5lU4nYyJJmfFvENvT08m7H0h7NO1BZeXiNDfx92Nt2Qu2+E4O1SA7rRpDdu9EHdumJ7vHd9Krc1NU7ph56yTZEWVkTSLSFLXbM7po+q7VJj7IypBLRFRTyl9kRy/R6s2HVlVS39zELk8RkY1RRsmP5q87b/tmqA/2yh0d7+1UJ2PTxmfdDk1pmV3b29vaxrVmUTGjDyIib2THH8TFifmGYiNKNSfV2FOxYy6RmCVF4+X7XhqjmnPvrvtE9UYWLsBO6qNtrzjbg0lEbNT2SGEGbfephdVt6S4vTFy3vX1sHn08PFSaL4eaBoc6kv5rqAIIVSyHmoWHKn4i1A0QKlsONQ8Plf1EqNtRn6zk0Wh1jGUj9fkttoOM1Kfi6NPK6VXp1uoslbb3Xc/ZDD4Mp5PU+179dhKS8edpmSZ3DBP59dnctJn7yPQOV4aR2R0mCCPzO3IujDwNLDZvZBUfn6VNBk+n8k8sTfy5TKchoJalGup4zJmurbx58lcppTPIaSio2uYcPxd2jilt7vVS2/Tzpt6tyi/RU+ZrATAzT0B2PjfFelJ4O8v29tr2HjQNQbME7UaWrXQjQ6Z8PvsgUh+awWqTNbWT105Fb5aybRx4Ah9t+r1sWkImXnEiWNw4dgWKy9bFTUi/uA3aGTRd64w8PF6BxbsNiFcsxsuTcHEMEsdpgDi2LA6ZjMCRjXO0o/OVfubh9W36VetSJfRafPbGTSVEFyuhShZztTxQ4QpoDOMZPHGuPc0NPG+OSDaDRCaz/Ba2Hv9dk1kQOk3uQc+9glEAtsF0MgCdYWgOoAWGTgF0iqEFgOYYOgPQDENvADTF0Ij/EgwN+I9i/hOA/yg2agjAjRRzowDcSDE3CsCNFLOMANxIMaMLwI0Us4wA3EgxowvAjRSzjADcSDGjC8CNmGMywIyYzTPAi5hfMsCKmMkzflMjFaW3KprlReNieNMNbsn8X7ynoJ1dWvkq3FvRalm3L3I/2HOVLeFkuXfr8PaU0YP0rqICnp2qvzTo0QGendZ4wtCAZ6e1njA04NlpqScMfVcF69DuY8mrhbsvJY/2VURELInEU/To/iLGPraZ2958bNu/yL5/uW33F9m3B/FkKdfPMrubT0AReZG6v7bMcprmXGRZlgqx2V4ufwCmSngp",
      position = {-2, -2}
    }
    storage.chest = game.surfaces[1].find_entities_filtered{name = "steel-chest"}[1]
    script.on_nth_tick(2000, function() storage.chest.insert("coal") for k, v in pairs (game.surfaces[1].find_entities_filtered{name = "boiler"}) do v.clear_items_inside() end end)
  ]]
}

simulations.low_power =
{
  init =
  [[
    require("__core__/lualib/story")
    player = game.simulation.create_test_player{name = "big k"}
	  player.teleport({-9, 5.5})
    game.simulation.camera_player = player
    game.simulation.camera_position = {0, 0.5}
    game.simulation.camera_player_cursor_position = player.position

    game.forces.player.recipes["iron-stick"].enabled = true
    for x = -5.5, -3.5, 1 do
      for y = 0.5, 2.5, 1 do
        game.surfaces[1].create_entity{name = "iron-ore", amount = 500, position = {x, y}}
      end
    end
    game.surfaces[1].create_entities_from_blueprint_string
    {
      string = "0eNqdltGSoyAQRf+FZ5kKKGr8lampFNHOhFpEC3BmUyn/fSGzMW5CouyjoKcv3X1bzmgvB+i1UBZVZyTqThlUvZ+REZ+KS79mTz2gCgkLLUqQ4q1/Mp3kGvdcgURjgoRq4DeqyJgsfgkSaqtFjVuhhPrEjRZyzqDjR4JAWWEF/Ei5PJx2amj3oF2QCWU1V6bvtMV7kNaF6DvjPuuUD+5QmNA3lqATqoo35iI0QrvYl/3MK70D0wjwJgacRoBJDDhbDy5juGw9dxvDzddzixhusZ6bx3DLiSs73riVR94zWjJ1v+oHiwLw7QQX6uC8YE+4PoIJiU7/EX19fWfAWmch41/T0HZfsBvcnrSgodl527ktqwcYA+HJJmjmx+D02pKuhYIg8ujtw6AVryHU4PkCjc5y7sbDkbux0GChDGgbrMBk8u19EcoQP12YRC8S4M253DTk5krTcinxFKfvZDAlVw/5qRLMSYQfb7B1YiMsSco4dDFr8OfVK+aHXy5fGaG3mOsNwbarFLKF8tBNhCb2NIeh41IS20vpktibvw7c2JfGyq4seq+V0BA6/Z880FW/5punuDHQ7qU3bMvro1CA6aup8DeAw4ufeaw7hY0V9S/kbxrfLrC/Zrw727LE5Zt9uNXLlaWa3Y0S9AXaXPi0JFmZsjzPM8aK7Tj+AesVBKk=",
      position = {4,0}
    }
    pole = game.surfaces[1].find_entities_filtered{name = "small-electric-pole"}[1]
    local story_table =
    {
      {
        {
          name = "start",
          condition = story_elapsed_check(5)
        },
        {
          condition = function() return game.simulation.move_cursor({position = pole.position, speed = 0.1}) end
        },
        {
          condition = story_elapsed_check(0.25),
          action = function() player.opened = pole end
        },
        {
          condition = function() return game.simulation.move_cursor({position = player.position, speed = 0.1}) end
        },
        {
          condition = story_elapsed_check(5),
          action = function()
            player.opened = nil
            story_jump_to(storage.story, "start")
          end
        }
      }
    }
    tip_story_init(story_table)
  ]]
}

simulations.electric_pole_connections =
{
  init =
  [[
    player = game.simulation.create_test_player{name = "big K"}
    player.character.teleport{-2, 2.5}
    game.simulation.camera_position = {0, 0.5}
    game.simulation.camera_player = player
    game.simulation.camera_player_cursor_position = player.position

    game.surfaces[1].create_entity{name = "small-electric-pole", position = {-6.5, 0.5}, force = "player"}
    local right_pole = game.surfaces[1].create_entity{name = "small-electric-pole", position = {7.5, 0.5}, force = "player"}

    step_1 = function()
      player.cursor_stack.set_stack({name = "small-electric-pole", count = 50})
      script.on_nth_tick(1, function()
        if game.simulation.move_cursor({position = {0.5, 0.5}, speed = 0.1}) then
          step_2()
        end
      end)
    end

    step_2 = function()
      local count = 30
      script.on_nth_tick(1, function()
        count = count - 1
        if count > 0 then return end
        player.build_from_cursor{position = game.simulation.camera_player_cursor_position}
        player.clear_cursor()
        step_3()
      end)
    end

    step_3 = function()
      local count = 30
      script.on_nth_tick(1, function()
        count = count - 1
        if count > 0 then return end
        if game.simulation.move_cursor({position = player.position}) then
          step_4()
        end
      end)
    end

    step_4 = function()
      local count = 30
      player.cursor_stack.set_stack{name = "copper-wire", count = 100}
      script.on_nth_tick(1, function()
        count = count - 1
        if count > 0 then return end
        if game.simulation.move_cursor({position = {0.5, 0.5}}) then
          player.drag_wire{position = {0.5, 0.5}}
          step_5()
        end
      end)
    end

    step_5 = function()
      script.on_nth_tick(1, function()
        if game.simulation.move_cursor({position = right_pole.position, speed = 0.15}) then
          player.drag_wire{position = right_pole.position}
          step_6()
        end
      end)
    end

    step_6 = function()
      local count = 30
      script.on_nth_tick(1, function()
        count = count - 1
        if count > 0 then return end
        if game.simulation.move_cursor({position = {4, 1}}) then
          step_7()
        end
      end)
    end

    step_7 = function()
      local count = 30
      script.on_nth_tick(1, function()
        count = count - 1
        if count > 0 then return end
        if game.simulation.move_cursor({position = {0.5, 0.5}}) then
          player.drag_wire{position = {0.5, 0.5}}
          step_8()
        end
      end)
    end

    step_8 = function()
      script.on_nth_tick(1, function()
        if game.simulation.move_cursor({position = right_pole.position, speed = 0.15}) then
          player.drag_wire{position = right_pole.position}
          step_9()
        end
      end)
    end

    step_9 = function()
      local count = 30
      player.clear_cursor()
      script.on_nth_tick(1, function()
        count = count - 1
        if count > 0 then return end
        if game.simulation.move_cursor({position = player.position}) then
          reset()
        end
      end)
    end

    reset = function()

      local count = 30
      player.clear_cursor()
      script.on_nth_tick(1, function()
        count = count - 1
        if count > 0 then return end
        player.clear_cursor()
        local pole = game.surfaces[1].find_entity("small-electric-pole", {0.5, 0.5})
        pole.destroy()
        start()
      end)
    end

    start = function()
      local count = 30
      script.on_nth_tick(1, function()
        count = count - 1
        if count > 0 then return end
        step_1()
      end)
    end

    start()
  ]]
}

simulations.power_switch_connections =
{
  init =
  [[
    player = game.simulation.create_test_player{name = "big K"}
    player.character.teleport{0, 3.5}
    game.simulation.camera_position = {0, 0.5}
    game.simulation.camera_player = player
    game.simulation.camera_player_cursor_position = player.position

    game.surfaces[1].create_entities_from_blueprint_string
    {
      string = "0eNqVk+FugyAUhd/l/sZGFKX6KkuzqL1pSRAM4JwxvHvRLlmzsXb+45Kc7x4u5y7QyhEHI5SDegHRaWWhflvAiotq5Hrn5gGhBuGwBwKq6ddq0BOaxE7CdVfwBIQ64yfU1JOXUuu0wmRqpHwQZv5EAJUTTuDdwFbM72rsWzSBHNOT4MMGiVZrt4BJaH4oCMzhVB0Kv7r5wcn+xXmJyb8xfSAkKLFzRnTJoCXGfNEvYBp4QYvicm31aNa3slOkAdvZgP3Nz2P8Iv6Vv8DpRqWxGZT7LD5xyGMO+T78swmXMf5xZ6JoGo9CtS9Rd0xI+7YV9cP+EfhAYzdJdqSMVxmnJecVZ97fAJfMMhY=",
      position = {0,0}
    }

    step_4 = function()
      local count = 30
      player.cursor_stack.set_stack{name = "copper-wire", count = 100}
      script.on_nth_tick(1, function()
        count = count - 1
        if count > 0 then return end
        if game.simulation.move_cursor({position = {-4.5, 0.5}}) then
          player.drag_wire{position = {-4.5, 0.5}}
          step_5()
        end
      end)
    end

    step_5 = function()
      script.on_nth_tick(1, function()
        if game.simulation.move_cursor({position = {-0.5, 0.5}, speed = 0.15}) then
          player.drag_wire{position = {-0.5, 0.5}}
          step_6()
        end
      end)
    end

    step_6 = function()
      local count = 30
      script.on_nth_tick(1, function()
        count = count - 1
        if count > 0 then return end
        if game.simulation.move_cursor({position = {0.5, 0.5}}) then
          player.drag_wire{position = {0.5, 0.5}}
          step_7()
        end
      end)
    end

    step_7 = function()
      local count = 30
      script.on_nth_tick(1, function()
        count = count - 1
        if count > 0 then return end
        if game.simulation.move_cursor({position = {4.5, 0.5}}) then
          player.drag_wire{position = {4.5, 0.5}}
          step_9()
        end
      end)
    end

    step_9 = function()
      local count = 30
      player.clear_cursor()
      script.on_nth_tick(1, function()
        count = count - 1
        if count > 0 then return end
        if game.simulation.move_cursor({position = player.position}) then
          reset()
        end
      end)
    end

    reset = function()

      local count = 30
      player.clear_cursor()
      script.on_nth_tick(1, function()
        count = count - 1
        if count > 0 then return end
        player.clear_cursor()
        local switch = game.surfaces[1].find_entity("power-switch", {0, 1})
        switch.get_wire_connector(defines.wire_connector_id.power_switch_left_copper).disconnect_all()
        switch.get_wire_connector(defines.wire_connector_id.power_switch_right_copper).disconnect_all()
        start()
      end)
    end

    start = function()
      local count = 30
      script.on_nth_tick(1, function()
        count = count - 1
        if count > 0 then return end
        step_4()
      end)
    end

    start()
  ]]
}

simulations.splitters =
{
  init_update_count = 800,
  init =
  [[
    require("__core__/lualib/story")
    player = game.simulation.create_test_player{name = "big k"}
    player.teleport({0, 0.5})
    game.simulation.camera_player = player
    game.simulation.camera_position = {0, 0.5}
    game.simulation.camera_alt_info = true
    game.simulation.camera_player_cursor_position = player.position

    local technology = "electronics"
    local technologies = prototypes.technology
    for name, prerequisite in pairs (technologies[technology].prerequisites) do
      game.forces.player.technologies[name].researched = true
    end
    game.forces.player.technologies[technology].researched = true

    game.surfaces[1].create_entities_from_blueprint_string
    {
      string = "0eNqtme2OqjAQQN+lv2FDv6D4KpuNQey6TRAIlL13s/Hdb9Go11jWmXF/KnjambbT0/rNNs1k+8G1nq2+mau7dmSr1282ul1bNfN3/qu3bMWct3uWsLbaz5/8ULVj3w0+3djGs0PCXLu1f9mKH94SZlvvvLMn0vHD17qd9hs7hBcuDNe+uzY8SusPO/rA7rsx/Kxr51YDKpXyRSfsi63yF31s4fT+erTeu3Y3zu8Ndt992vUUnjXeDna7njsaHvlhsgk7fXvqyLnZoWvTna2G9M+HtU1ot+6mOXyeZQnbd9v5pcqnja2OvboGdjgkd+GIpZREwsluwtm6wdan5yYClhdw01Xb8E0EKOI4lZwHrZt8P83Dc4dXhH4Xdw1FwPoCnkLiht0QkrtdQotyEX2JwbULIeSoltTjlpazVcCzJSQmWwYBFhhwiQBzDJhnCDJq5nAOJ/MSRUasUm5QZIkgFygyYoXyHEXWCLJCkXMEGbVOOGIFctRC4YglyHHzGbEGOWoNigxT+p6psYJjWnqqxgoB2PHogUi4d9yOBV47op6gCN5jftN7bBPSFdzH1Wnthnpy/qo+gqQ+muAQc0gxVg7WHfNwct2Gfw4i+SERIcBIn641Z+wb5320V1yfIwOsW0OovAZii6IkkEuQh2aIiXvOxVwo0TP3vWrG+NStu763Q1pXm8Y+OWnldR68h/fTxzP3vJvMJfrxEEvMgUDcpuvRSECOBGoBCKnAknIoOKYlBqNUh0i/Y+icdMb4KSmL+4YsSKcM4gAYwjkDmLOScNKAoVVGOGsA0Zxw2ACiBeG0cV8DYgtVSQoaVAOUItR5YEI0QbGBaMq5AIguCPoORBuCvwPRJUXgSQVMZxSDp9UvzaEKTwtF4B2eZCJLEq8lxYXEr7rQ8fqybypvn7y51IpiKiK+22sNdxNBmlr5rbf9YOTyMvYCcF1ZUDRFgm5CDQUtINuALmkGJCnXrBnNgCRlmHNOMSDQcOSCYkAwtKQYEAytKAYEQ2uKpsDQOQUtQGjYqdxc+gtAGsIlLjARJeEWF4YuENp9uaQAojnFMmFoQbFMGFpSLBOGVhTLhKE1xTJh6JxkmZRNoihIlknaIwoDtkxSKCXBMiXZMt+S01/rq//+iU/YZ7C+YzvCcGWkzvNcaV2Uh8M/6JlhIQ==",
      position = {-2, 0}
    }

    splitter1 = game.surfaces[1].find_entities_filtered{name = "splitter"}[1]
    splitter2 = game.surfaces[1].find_entities_filtered{name = "splitter"}[2]
    first_simulation = true
    saved_position = player.position

    local story_table =
    {
      {
        {
          name = "start",
          condition = story_elapsed_check(13),
        },
        { condition = function() return game.simulation.move_cursor({position = player.position}) end },
        {
          name = "continue",
          condition = story_elapsed_check(3),
        },
        { condition = function() return game.simulation.move_cursor({position = splitter1.position}) end },
        {
          condition = story_elapsed_check(0.25),
          action = function() player.opened = splitter1 end
        },
        { condition = story_elapsed_check(0.25) },
        {
          condition = function()
            local target = game.simulation.get_widget_position({type = "check-box", data = "gui-splitter.input-priority"})
            return game.simulation.move_cursor({position = target, speed = 0.15})
          end
        },
        {
          condition = story_elapsed_check(0.25),
          action = function() game.simulation.mouse_click() end
        },
        {
          condition = story_elapsed_check(0.5),
          action = function() player.opened = nil end
        },
        { condition = function() return game.simulation.move_cursor({position = player.position}) end },
        { condition = function() return game.simulation.move_cursor({position = splitter2.position}) end },
        {
          condition = story_elapsed_check(0.25),
          action = function() player.opened = splitter2 end
        },
        { condition = story_elapsed_check(0.25) },
        {
          condition = function()
            saved_position = game.simulation.get_widget_position({type = "choose-button"})
            return game.simulation.move_cursor({position = saved_position, speed = 0.15})
          end
        },
        {
          condition = story_elapsed_check(0.25),
          action = function()
            game.simulation.mouse_click()
            if first_simulation == false then story_jump_to(storage.story, "setElectronicCircuit") end
          end
        },

        { condition = function() return game.simulation.move_cursor({position = {saved_position.x, saved_position.y - 1}}) end },

        {
          condition = function()
            local target = game.simulation.get_widget_position({type = "item-group-tab", data = "intermediate-products"})
            return game.simulation.move_cursor({position = target, speed = 0.15})
          end
        },
        {
          condition = story_elapsed_check(0.25),
          action = function() game.simulation.mouse_down() end
        },
        {
          condition = story_elapsed_check(0.25),
          action = function() game.simulation.mouse_up() end
        },
        { condition = story_elapsed_check(0.25) },
        {
          name = "setElectronicCircuit",
          condition = function()
            local target = game.simulation.get_widget_position({type = "simple-item-slot", data = "electronic-circuit"})
            return game.simulation.move_cursor({position = target, speed = 0.15})
          end
        },
        {
          condition = story_elapsed_check(0.25),
          action = function() game.simulation.mouse_click() end
        },
        {
          condition = story_elapsed_check(0.75),
          action = function()
            game.simulation.control_press{control = "confirm-gui", notify = false}
          end
        },
        {
          condition = story_elapsed_check(0.5),
          action = function() player.opened = nil end
        },

        { condition = function() return game.simulation.move_cursor({position = player.position}) end },
        {
          condition = story_elapsed_check(3),
          action = function()
            splitter1.splitter_filter = nil
            splitter1.splitter_input_priority = "none"
            splitter2.splitter_filter = nil
            splitter2.splitter_output_priority = "none"
          end
        },
        {
          condition = story_elapsed_check(0.25),
          action = function()
            player.clear_cursor()
            first_simulation = false
            story_jump_to(storage.story, "continue")
          end
        }
      }
    }
    tip_story_init(story_table)

  ]]
}

simulations.belt_lanes =
{
  init_update_count = 850,
  init =
  [[
    game.simulation.camera_position = {0, 0.5}

    game.surfaces[1].create_entities_from_blueprint_string
    {
      string = "0eNqtWNGS4iAQ/BeeyVYgIUZ/xbKsGEePqggpQvbOs/z3m8Rd9VaiwK4vmkB6eprpCXgim6aH1khlyeJEZK1VRxbLE+nkXlXNcM8eWyALIi0cCCWqOgxX1lSqa7WxyQYaS86USLWFP2TBzitKQFlpJVyQxovjWvWHDRiccMWQaicVDiX1L+gsYre6w8e0GqIiVML5m6DkiL/SNzGGuDyw7sBaqfbdMNHAQb/DusexxoKB7XpgikO7qumAksvtC5XPwEarRBvAkLXuh8xFSslBb4fByiYNVCOfW0rnM31IhF8TaXS1xTtPEmDIfisN1JfRkn6qqnvb9oN+D/DZFb5HGmZvkOn2ovaTQHwUyhlKqolI+dSqPokze4jjABZRKRTTKUyrVfjnwIJymEWIU/oAlxHAcx/geYAUsztgBxRLI7DKCax743dgrNMxrJjSkHEX6M2EndUKkl1vVFWDC/kjUye3zItbFsYtj6hJr9JhIgLZq3bYzUfQ4EQj6wQUWveY4BsCzM6tbf4h7VfbbvrdDsy6k39hKKbrxxU5xmgs/ZpU7oKOsRpjE2UcYC/OgnjyALfxNAyaBVTMPAz6zoJtI+2Ed8orqAdkFtF2xgV7WeA8j4FOvaBFUIN75OvsIvzmyO5QNU1y9WWrG3efu2ftQpwFNTtfnmVET/Jcs3kMtNeaZWmguvMX4mYsEDB7BcijNlHD8p19dplZTG/kE1yjzMW9FkqEvuixSl04RYic7IucYfvqbBZTt35ylHFVUd5XxTTxeZxIZczOPU8jDoSc/eiBsNZ41P3WYTBnAadBnvpYM+f+wrBvCWNND86kstdJsf+SemaQFSW/cXgQfolvNUGx+YoVXQ5fFPumWOGM8V+Gxd2fEpS842KNiLxkeZmJoihyIWa4kf8Hg2RzNQ==",
      position = {4, 0}
    }
  ]]
}

simulations.move_between_labs =
{
  init_update_count = 800,
  init =
  [[
    game.simulation.camera_position = {0, 0.5}

    game.surfaces[1].create_entities_from_blueprint_string
    {
      string = "0eNq1VtuOmzAQ/Rc/mwibSyC/Eq0iByapVTDINtumEf/eMXRJqnWWi9o8EIPtc87M2DNzJ+eqg1ZLZcnhTmTRKEMOxzsx8qpE5b7ZWwvkQKSFmlCiRO3eKnEmPSVSlfCTHFj/RgkoK62Ecfvwcjuprj6DxgXTRqkuUuFUUHwDYxGwbQxua5SjQqiAp7uEkhvu2SUDw7j+ZMBaqa7GrdNQN+9w6nCusqChPDl1OHURlQFKxs+jkg/BzVUaK4vAFBJUAUEriu9IXzSdM52HISV1U7qlwgYViEHcw76+p5+s4g93NKLELx5rnm0ppYZinI3ph1+bzradJR74aIK3WijTNtoGZ6i8Tot2L4gyD3C8QDf3wzG+QHiyItrhf4m26GxTC0f0L+OdTnZ1uE5fNWKVsyHhn0IyuVCqFx7cb2Lav2Z6HaxsojK1qKoAKtyt8aK0TQUetoj9YcuQzYOXr8Tj+6/xWLjhGmRLrgFjG5DzRch8rRPCGSdEKwFZNAMYrwRMZ/CStRbP4D3u2oQECm/CLcBSBfoiCh9qPMboU649d5cL6JORv8CdqOnnY95vSbuL8i7LtkCHi6Dzp5xrQNsXWf0lKOO+Ahf+VfC/St+hP46cLdHFspW6+Iwuls7pihbpilfqiud08TldyZYjwpccEb6tfLlMsrp+8W0FjGVbKhjPVvQbU1Xe0nBY3YE3avmCjmpiDmfcib30D5x2Dc0xownNafJGj/ikWFfc0P1RLAnDOHLjeBzHbpzgGCGGfv3w1N5T8o5d0kDJMxZnUZKmaZwk+7zvfwObKeep",
      position = {0, 1}
    }

    local science_1 = "automation-science-pack"
    local science_2 = "logistic-science-pack"
    local technology = "railway"
    local items = prototypes.item
    local technologies = prototypes.technology
    if not (technologies[technology] and items[science_1] and items[science_2]) then
      technology = nil
      for k, tech in pairs (technologies) do
        local units = tech.research_unit_ingredients
        if #units == 2 then
          technology = tech.name
          science_1 = units[1].name
          science_2 = units[2].name
          break
        end
      end
    end

    if not technology then return end

    chest_1 = game.surfaces[1].find_entity("infinity-chest", {-9.5, -6.5})
    if chest_1 then
      chest_1.set_infinity_container_filter(1, {name = science_1, count = 100, index = 1})
    end

    chest_2 = game.surfaces[1].find_entity("infinity-chest", {-3.5, -6.5})
    if chest_2 then
      chest_2.set_infinity_container_filter(1, {name = science_2, count = 100, index = 1})
    end

    for name, prerequisite in pairs (technologies[technology].prerequisites) do
      game.forces.player.technologies[name].researched = true
    end

    game.forces.player.laboratory_speed_modifier = 3
    game.forces.player.add_research(technology)
    script.on_event(defines.events.on_research_finished,
    function(event)
      if not event.by_script then
        event.research.researched = false
        event.research.force.add_research(event.research.name)
        event.research.force.research_progress = 0
      end
    end)
  ]]
}

simulations.drag_building =
{
  init =
  [[
    require("__core__/lualib/story")
    storage.player = game.simulation.create_test_player{name = "kovarex"}
    storage.character = storage.player.character
    storage.character.teleport{0, 0.5}
    game.simulation.camera_player = storage.player
    game.simulation.camera_player_cursor_position = {0, 0}

    update_camera = function()
      game.simulation.camera_position = {storage.player.position.x, storage.player.position.y - 2}
    end

    build_from_cursor = function()
      if storage.player.can_build_from_cursor{position = game.simulation.camera_player_cursor_position} then
        storage.player.build_from_cursor{position = game.simulation.camera_player_cursor_position, direction = defines.direction.west}
      end
    end

    local story_table =
    {
      {
        {
          name = "start",
          init = function() storage.character.teleport{0, 0.5} end,
          action = function() update_camera() end
        },
        { condition = story_elapsed_check(0.5) },
        {
          condition = function() return game.simulation.move_cursor({position = {storage.character.position.x - 2.5, storage.character.position.y - 4}}) end,
          action = function() storage.character.cursor_stack.set_stack{name = "stone-furnace", count = 12} end
        },
        {
          condition = function() return game.simulation.move_cursor({position = {storage.character.position.x + 2.5, storage.character.position.y - 4}}) end,
          update = function() build_from_cursor() end,
          action = function() storage.character.walking_state = {walking = true, direction = defines.direction.east} end
        },
        {
          condition = function() return storage.player.cursor_stack.count == 0 end,
          update = function()
            game.simulation.camera_player_cursor_position = {storage.character.position.x + 2.5, storage.character.position.y -4}
            build_from_cursor()
            if game.tick % 60 == 0 then
              game.surfaces[1].build_checkerboard({{storage.character.position.x + 10, storage.character.position.y - 10},
                                                   {storage.character.position.x + 25, storage.character.position.y + 10}})
            end
            update_camera()
          end,
          action = function() storage.character.walking_state = {walking = false} end
        },
        {
          condition = function() return game.simulation.move_cursor({position = {storage.player.position.x + 3.5, storage.player.position.y - 1}}) end,
          action = function()
            storage.character.cursor_stack.set_stack{name = "transport-belt", count = 24}
            game.simulation.camera_player_cursor_direction = defines.direction.west
          end
        },
        {
          condition = function() return game.simulation.move_cursor({position = {storage.player.position.x - 4, storage.player.position.y - 1}}) end,
          update = function() build_from_cursor() end,
          action = function() storage.character.walking_state = {walking = true, direction = defines.direction.west} end
        },
        {
          condition = function() return storage.player.cursor_stack.count == 0 end,
          update = function()
            game.simulation.camera_player_cursor_position = {storage.character.position.x - 4, storage.character.position.y - 1}
            build_from_cursor()
            update_camera()
          end,
          action = function() storage.character.walking_state = {walking = false} end
        },
        {
          condition = story_elapsed_check(2),
          action = function()
            for k, v in pairs (storage.player.surface.find_entities_filtered{name = "stone-furnace"}) do
              v.destroy()
            end
            for k, v in pairs (storage.player.surface.find_entities_filtered{name = "transport-belt"}) do
              v.destroy()
            end
          end
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

simulations.drag_building_poles =
{
  init =
  [[
    require("__core__/lualib/story")
    storage.player = game.simulation.create_test_player{name = "kovarex"}
    storage.character = storage.player.character
    game.simulation.camera_player = storage.player

    update_camera = function()
      game.simulation.camera_position = {storage.player.position.x, storage.player.position.y - 1.5}
    end

    local story_table =
    {
      {
        {
          name = "start",
          init = function()
            storage.character.teleport{0, 0}
            game.simulation.camera_player_cursor_position = {0, 0}
          end,
          action = function() update_camera() end
        },
        { condition = story_elapsed_check(0.5) },
        {
          condition = function() return game.simulation.move_cursor({position = {storage.character.position.x + 2, storage.character.position.y - 3}}) end,
          action = function()
            storage.character.cursor_stack.set_stack{name = "small-electric-pole", count = 50}
            storage.character.walking_state = {walking = true, direction = defines.direction.east}
          end
        },
        {
          condition = function() return storage.player.cursor_stack.count == 0 end,
          update = function()
            local build_offset = { x = 2, y = -3 }
            local pole_x = math.floor(storage.character.position.x) + build_offset.x
            local pole_y = storage.character.position.y + build_offset.y
            game.simulation.camera_player_cursor_position = {storage.character.position.x + build_offset.x, pole_y}
            if storage.last_pole_x == nil or pole_x - storage.last_pole_x == 7 then
              storage.player.build_from_cursor{position = {pole_x, pole_y}}
              storage.last_pole_x = pole_x
            end
            if game.tick % 60 == 0 then
              game.surfaces[1].build_checkerboard({{storage.character.position.x + 10, storage.character.position.y - 10},
                                                   {storage.character.position.x + 25, storage.character.position.y + 10}})
            end
            update_camera()
          end,
          action = function() storage.character.walking_state = {walking = false} end
        },
        {
          condition = story_elapsed_check(2),
          action = function()
            for k, v in pairs (storage.player.surface.find_entities_filtered{name = "small-electric-pole"}) do
              v.destroy()
            end
          end
        },
        {
          condition = story_elapsed_check(1),
          action = function()
            story_jump_to(storage.story, "start")
            storage.last_pole_x = nil
          end
        }
      }
    }
    tip_story_init(story_table)
  ]]
}

simulations.pole_dragging_coverage =
{
  init =
  [[
    require("__core__/lualib/story")
    storage.player = game.simulation.create_test_player{name = "Cable Guy"}
    storage.character = storage.player.character
    game.simulation.camera_player = storage.player
    game.simulation.camera_player_cursor_position = {0, 0}
    game.surfaces[1].build_checkerboard({{10, -10}, {320, 10}})
    game.surfaces[1].create_entities_from_blueprint_string
    {
      string = "0eNqVlN1uhCAQhd9lrnGzgLCur7LZNGonWxJEg9jUGN69aC/apPjD5RDOdyYnMzNDrUfsrTIOyhlU05kByscMg3qZSi9vbuoRSlAOWyBgqnaphk5XNusrgxo8AWXe8QtK6p8E0DjlFP5g1mJ6M2Nbow0fogACfTcETWcWv8DJmLgIAlMQ8IvwnvwDsbMgdgDiJ0H0fgDKz4LkAUicBfEDkEwOW8ZBt19QW2mdocbGWdVkfadxN/QFGMSoXh91N9plJopnxKFIdKBix+FG6DVmck8OdiMPek1st9jLg1Aa65bS1Ex2TOKBUJY8IfeNRHjyPm6R8uSF3CKJ5I3cIsnkyVlJ4RiuV7P8c2QJfKIdVg0raF5wIaXMBefM+290Ncet",
      position = {-13,0},
    }
    local lights_count = 0
    while lights_count < 8 do
      game.surfaces[1].create_entities_from_blueprint_string
      {
        string = "0eNqV1M1OhDAQwPF3mXPdMPQD6KtszKarjWnSFkJBJYR3t6wHD5o4c2wz87v9Z4d7XP00h7yA3SG8jLmAve5Qwlt28fzLLnmwUJKL8Sm6NMEhIORX/wkWj2cBPi9hCf577/HYbnlNdz/XAfHHvoBpLHVlzKd/MoO8aAEbWKkvuvIufrit3M6BZV79IX7BLRHWXFgSYcWFFRHuuLAmwoYLGyI8cOGOCPdcuCfBbYNceCDCDRfGhiizC0Ekyi1bbokyOz6URJldHyqizM4PNVFm94eGKP/TSb3RYfGpMj/HXsC7n8sDaXtUvdSmk8agMsfxBYnu+5k=",
        position = {28 + lights_count * 36, 1},
      }
      lights_count = lights_count + 1
      end

    update_camera = function()
      game.simulation.camera_position = {storage.player.position.x, storage.player.position.y - 2.5}
    end

    local story_table =
    {
      {
        {
          name = "start",
          init = function()
            storage.character.teleport{0, 4}
            game.simulation.camera_player_cursor_position = {0, 0}
          end,
          action = function() update_camera() end
        },
        { condition = story_elapsed_check(0.5) },
        {
          condition = function() return game.simulation.move_cursor({position = {storage.character.position.x + 2, storage.character.position.y - 4}}) end,
          action = function()
            storage.character.cursor_stack.set_stack{name = "small-electric-pole", count = 48}
            storage.character.walking_state = {walking = true, direction = defines.direction.east}
          end
        },
        {
          condition = function() return storage.player.cursor_stack.count == 0 end,
          update = function()
            local build_offset = { x = 2, y = -4 }
            local pole_x = math.floor(storage.character.position.x) + build_offset.x
            local pole_y = storage.character.position.y + build_offset.y
            if storage.last_pole_x == nil then
              storage.last_pole_x = pole_x - 3
              storage.pole_count = 0
            end
            game.simulation.camera_player_cursor_position = {storage.character.position.x + build_offset.x, pole_y}

            if (storage.pole_count == 0
                or storage.pole_count == 1
                or storage.pole_count == 2) and pole_x - storage.last_pole_x  == 7 then
              storage.player.build_from_cursor{position = {pole_x, pole_y}}
              storage.last_pole_x = storage.last_pole_x + 7
              storage.pole_count =  storage.pole_count + 1
            end
            if (storage.pole_count == 3
                or storage.pole_count == 4
                or storage.pole_count == 5) and pole_x - storage.last_pole_x  == 5 then
              storage.player.build_from_cursor{position = {pole_x, pole_y}}
              storage.last_pole_x = storage.last_pole_x + 5
              if storage.pole_count == 5 then
                storage.pole_count = 0
              else
                storage.pole_count = storage.pole_count + 1
              end
            end

            update_camera()
          end,
          action = function() storage.character.walking_state = {walking = false} end
        },
        {
          condition = story_elapsed_check(2),
          action = function()
            for k, v in pairs (storage.player.surface.find_entities_filtered{name = "small-electric-pole"}) do
              if v.position.x > 0 then
                v.destroy()
              end
            end
          end
        },
        {
          condition = story_elapsed_check(1),
          action = function()
            story_jump_to(storage.story, "start")
            storage.last_pole_x = nil
          end
        }
      }
    }
    tip_story_init(story_table)
  ]]
}

simulations.drag_building_underground =
{
  init =
  [[
    require("__core__/lualib/story")
    storage.player = game.simulation.create_test_player{name = "kovarex"}
    storage.character = storage.player.character
    game.simulation.camera_player = storage.player
    game.simulation.camera_player_cursor_direction = defines.direction.east
    cursor_position = {0, 0}

    update_camera = function()
      game.simulation.camera_position = {storage.player.position.x, storage.player.position.y - 1.5}
    end

    direction = defines.direction.east
    last_distance = 1
    last_x = 0

    local story_table =
    {
      {
        {
          name = "start",
          init = function()
            storage.character.teleport{0, 0}
            game.simulation.camera_player_cursor_position = {0, 0}
          end,
          action = function() update_camera() end
        },
        { condition = story_elapsed_check(0.5) },
        {
          condition = function() return game.simulation.move_cursor({position = {storage.character.position.x + 2, storage.character.position.y - 3}}) end,
          action = function()
            storage.player.cursor_stack.set_stack{name = "underground-belt", count = 50}
            storage.character.walking_state = {walking = true, direction = defines.direction.east}
          end
        },
        {
          condition = function() return storage.player.cursor_stack.count == 0 end,
          update = function()
            local build_offset = {3, -3.5}
            game.simulation.camera_player_cursor_position = {storage.character.position.x + build_offset[1], storage.character.position.y + build_offset[2]}

            cursor_position = {storage.player.position.x + build_offset[1], storage.player.position.y + build_offset[2]}
            if (cursor_position[1] - last_x) > last_distance then
              if storage.player.can_build_from_cursor{position = cursor_position, direction = direction} then
                storage.player.build_from_cursor{position = cursor_position, direction = direction}
              end
              if last_distance == 1 then
                direction = defines.direction.west
                last_distance = 5
              else
                direction = defines.direction.east
                last_distance = 1
              end
                game.simulation.camera_player_cursor_direction = direction
              last_x = math.floor(cursor_position[1])
            end

            if game.tick % 60 == 0 then
              game.surfaces[1].build_checkerboard({{storage.character.position.x + 10, storage.character.position.y - 10},
                                                   {storage.character.position.x + 25, storage.character.position.y + 10}})
            end
            update_camera()
          end,
          action = function() storage.character.walking_state = {walking = false} end
        },
        {
          condition = story_elapsed_check(2),
          action = function()
            for k, v in pairs (storage.player.surface.find_entities_filtered{name = "underground-belt"}) do
              v.destroy()
            end
          end
        },
        {
          condition = story_elapsed_check(1),
          action = function()
            story_jump_to(storage.story, "start")
            direction = defines.direction.east
            last_distance = 1
            last_x = 0
          end
        }
      }
    }
    tip_story_init(story_table)
  ]]
}

simulations.smart_belt_building =
{
  init =
  [[
    require("__core__/lualib/story")
    player = game.simulation.create_test_player{name = "big k"}
    player.teleport({0, 2.5})
    game.simulation.camera_player = player
    game.simulation.camera_position = {0, 0.5}
    game.simulation.camera_player_cursor_position = player.position

    local story_table =
    {
      {
        {
          name = "start",
          init = function()
            player.cursor_stack.set_stack{name = "transport-belt", count = 50}
            game.simulation.camera_player_cursor_direction = defines.direction.east
          end,
          condition = function() return game.simulation.move_cursor({position = {-3.5, -1.5}}) end
        },
        { condition = story_elapsed_check(0.5) },
        {
          init = function() game.simulation.control_down{control = "build", notify = false} end,
          condition = function() return game.simulation.move_cursor({position = {3.5, 0.5}}) end
        },
        {
          condition = story_elapsed_check(0.5),
          action = function()
            game.simulation.camera_player_cursor_direction = defines.direction.south
            game.simulation.control_down{control = "rotate", notify = true}
          end
        },
        {
          condition = function() return game.simulation.move_cursor({position = {3.5, 2.5}}) end,
          action = function()
            game.simulation.control_up{control = "build"}
            game.simulation.control_up{control = "rotate"}
          end
        },
        {
          condition = story_elapsed_check(0.5),
          action = function()
            game.simulation.control_down{control = "clear-cursor", notify = false}
            player.character.clear_items_inside()
          end
        },
        { condition = function() return game.simulation.move_cursor({position = player.position}) end },
        {
          condition = story_elapsed_check(1),
          action = function()
            for k, v in pairs (player.surface.find_entities_filtered{name = "transport-belt"}) do
              v.destroy()
            end
          end
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

simulations.fast_obstacle_traversing =
{
  init =
  [[
    player = game.simulation.create_test_player{name = "Arnold J. Rimmer"}
    player.teleport({0, 2.5})
    game.simulation.camera_player = player
    game.simulation.camera_position = {0, 0.5}
    game.simulation.camera_alt_info = true
    game.simulation.camera_player_cursor_position = player.position
    game.simulation.smart_belt_building = true
    player.surface.create_entity{name="stone-furnace", position = {0, -1}}
    item_name = "transport-belt"
    direction = defines.direction.east

    step_1 = function()
      player.cursor_stack.set_stack{name = item_name, count = 50}
      player.insert{name = "underground-belt", count = 2}
      game.simulation.camera_player_cursor_direction = direction
      script.on_nth_tick(1, function()
        if game.simulation.move_cursor{position = {-4.5, -1.5}} then
          step_2()
        end
      end)
    end

    step_2 = function()
      local count = 30
      script.on_nth_tick(1, function()
        if count > 0 then count = count - 1 return end
        step_3()
      end)
    end

    step_3 = function()
      local target = {4.5, -1.5}
      script.on_nth_tick(1, function()
        local finished = game.simulation.move_cursor{position = target}
        if last_x == nil or last_x ~= math.floor(game.simulation.camera_player_cursor_position.x) then
          player.raw_build_from_cursor{created_by_moving = true}
        end
        last_x = math.floor(game.simulation.camera_player_cursor_position.x)
        if finished then
          step_4()
        end
      end)
    end

    step_4 = function()
      local target = player.position
      script.on_nth_tick(1, function()
        local finished = game.simulation.move_cursor{position = target}
        if finished then
          reset()
        end
      end)
    end

    reset = function()
      local count = 60
      script.on_nth_tick(1, function()
        if count > 0 then count = count - 1 return end
        for k, v in pairs (player.surface.find_entities_filtered{name = "transport-belt"}) do
          v.destroy()
        end
        for k, v in pairs (player.surface.find_entities_filtered{name = "underground-belt"}) do
          v.destroy()
        end
        start()
      end)
    end

    start = function()
      local count = 60
      script.on_nth_tick(1, function()
        if count > 0 then count = count - 1 return end
        step_1()
      end)
    end

    start()
  ]]
}

simulations.trains =
{
  init_update_count = 300,
  init =
  [[
    game.simulation.camera_zoom = 1
    game.surfaces[1].build_checkerboard{{-72, -50}, {72, 50}}
    game.surfaces[1].create_entities_from_blueprint_string
    {
      string = "0eNrFnetSIzkPhu8lvyFlWz5yK1tbVGAyTOoLCRXC7E5Nzb1/7k76EJCC3g6wv2ZId55ItuSDbNm/Z3frl+XTbrXZz25+z1b3283z7Oav37Pn1cNmsW4+2ywel7Ob2W6xWs/+XM1Wm2/Lf2c39s/fV7PlZr/ar5aHb7R//LrdvDzeLXf1havum/cvu5/Lb9cN4Hoxu5o9bZ/rt7abBt6QrL+a/ar/llTx31a75f3hqXV/rt5gnR6beWxkqKSlOuMAYb0eG/XCBpZ6xxSBKUdqUQgbe+yPxfr79bfV4mFbTaClA2zPoJNaYkc8lSuHrKaWBJRDuRqb/PX9j8Vqc310B6bi0jwc4XkeXuGJwVujFdtZqy8Ma6Hqw9gONI1DiThj3zcNS6DcApuV24Ny2yObFHIDXhh4LGd8dvDC530lPvzYi9LGI9YpsIAHpl5aDgQ4HQFqF63a7thbvFGbMwAH+Fo4p7ZDvavwurNCOq2QpauaoOkoSW9JXZH692vKeX1NRR7LFoLanZwjvhRYLOBO7oiNikJI+kLIPJaVVu1cvW8VhbBFTS16Khn1QMx0wmYFVj9sdKXHciD9QLFYQD79SNGms/J5vcHbvlo4EOA56SwI8JVjjVrLggDvSGdBGZeIbb7p1ZhOGs3Vzu84mqugN6M5boBvYHO1r/otaziuha33NTdzWKcsh+LkckgcmPAqZ2vKq6dMvd6KTssHnd4jtcNrtdnyjGppEyBtUkqbQWknuFNgK0nrTsZjEgajA7e4EZhDWdwieZDSZ2oz/a5M+s6jG+RUe+FAXitTelemoJepnJVJ3X30nptYjrr36H2K50ywdh5UsFmkG8R619WjwdjlrKRxgs3zIKcGufMS6fuF3rp4kIetix3kxABbF8+ZMFjiQYO5r7f328ftfvVzea7C8pysa9rS5WZxt17errcPq+f96v759p8fq/r34/bnavMwu/m+WD8vr2bb3ar+4uKAqtZ2v336dXu/XW93t99328fbRvjN7fN++3T8Cidjxu2KV3ZwpcVuv1qvl7tf1/80Jn/OsvI82Zymqtz0O28DkgY3cFajZHED50FOZQeddTszN4XSJ9pB80p92vzurv3GQ1OYlA2VOrOnUuogMVtjQg6NIFezu8NzT5YSOcohUqgPSoohNtP7RfPclwMg1H+sjxQdGR+b2uXKhFCnd+w8Inld2aa+bL/cxRLcLgmqRpWqfaNUBy2fa0acjAluOwVlM9gzh572bs+cwF6/hHOSZgO3oALIwg2XAHJwwyWAcCdlZ37Zwx7AcwJuXTwo4nXGgxJeZzwo43XGgwpcZ2wDXQxcZzzH4nXGg0ZRv8XuYSsOLvoaC5e09c3karX5WT/Z7ipt87Jec0LhwRFBOz9h+FQ1/PDhUwm4RfMa6bqrwZzD13dXJeFexyubdcbZ+1y6cIynME28IWCnZ3Uc2IO+r19W30TdUq/bBX7HSmDhtkhQxeGNkUAifXS4IylWn9r1Om10OPVclhTwpknQNeJNgkCa4G8CKcPWXXhQgW2LB402f+iG5/nr2ztrJ/TGgroONy+BRLh5CSSPm5dACqh5keVBETUvCYTPrCRShpsuMu8H+K0tcNP1mssumFmHz7AE1R0+xZJI+BxLIsGTLOK37zh4liWB8GmWRIrgmJ3c54/ZrcMXsSX98oRRe9Xxw0ft1hXcsnmdxrs/ztZZb9fuko5MWWeEB2Ml/Rw2VCf/6UN1S3gbEHjlsHBo1e1Cd5s0CiE4IiqpG/X+N7RVF000WTEm9M2CQvo9mF3EkxSL75aKfm+nwOX7Zj+hb+ZV9xP6ZoE0oW8WSLhf8tMVj/fNAmhC3yyQ8BioRMKDoBIJj4JKJDj6QfxMIMBxUAmET70kktM3EqUnnTozv++d9K2E5cE812ML4VT+k24p4BETqYa0sc++oi8cEuKLvvNiU/TJxGZFt7qwszGVZrX2uBrcLOTGHOszF3Lwvv6du6XgKQu+NkxoJYTSzVhkuZbuhQPUaeZU8MaMVzgatDHz/FwzwoFUCYQHUiWSPpBKvicpGjP9tqJ2/MaBea6+B6aCcPXbjrxFuPrBqSeEq9+E5wPCLXouUm/6fUHt4EHP1ffrAam3pHexgNSbfudN2yHquXp/C1C96f0tQPWm97cI1Zve3yJUb3p/i1C96f0tIvWm3xfTuryeq/e3hNSbftdM60J6rt7fElJv+k01rUnquXp/S1C96f0tQ/Wm97cM1Zt+mSRHhFvgWYYwdCr4TleJhEdXJZKDh6p8mFa/s6YfqgogPyFG6N1HxwgLHriRFIrKFB3qM2mqOpq8YjvaD9NOca7bKc4ZR3qdTX9VlTuWwqz5KvsjWSl/9rD8BU4y8sQnzziDRzb5CnOj7SvaNCNZKjx9Q5KK4EQjWSp84V2SCl5494JIEc0L9F6Tx+YMnMQkSZjRXECthAVvangRrYGzAZUyWqttxGJPfpNn6FmyA9uwNy3LuBG72+7328cZ+0OEt2NKFTze9AgViO/mlEgRd3GBlGAXTzwow54ogCY4DE9yBo9mqY7G0u9cGaJZSWFq+n0sQzRLxSU8mqXiejyapeIGPJql4kY8mqXiJjyapeJmPJql4hY8mqXhksGjWSquxaNZKq7Do1kqLuHRLBXX49EsFTfg0SwVN+LRLBU34dEsFTfj0SwVt+DRLA1Xv99jiGapuBaPZqm4Do9mqbiER7NUXI9Hs1TcgEezFOdVugm7SISh04RdJBIJ30UikQqUue3LPHz5nn4X8NVhdpnZjXaoaDYPVm1T/upkahccPOgXtCUsX8OX+Zdm5c/tMR/fGlv7lJBjbUmiN23CfbtFwx73aMQ2XT/FnErOLrc7A9uMfWdSm7NfUkzRx5RLCCYdXsB3cLjg8WmSUPYB3sHkNee7uhDhHUy+aI4wxLeMS6pnvJkTSPj+EoGE7y8JlgfB+0skEL6/RCLhGboSycM1J5ECXHMSCT6ZKfBx1whHNSUQfjaTRCrwXuhAmgM+DbwXWpBwtPVDl94SaO4/O1XCJTwzT9KPdJm/g73TPF+kICvFBL8T9JngdwIJ9zu+T0243wmgCX4nkPAFaoGU8QVqiYQvUEskMP0nxAvH9AqPxc9ZCfx8JWPpP1W3S0bwU3fGugzn/0j6Rl0DNZh8/OB1fZfx3B9JGfwoNomEJwMKJGSLSTlPsrCN84PVAk8AJRDhNSeQPJxRHbLmdO8AZ1SHzEuIh2kkXfEwjUTCwzQSCU72ifyh1AZO9pFAeLKPREKPPYrm88eYZPBZlaSfB8eYVb8PH2OSwdfJJX0ikhJeep2auM7HqoSftSKpBB5uFOnTh0xkcJfnj4+3uMsLIAuORWoxfexYhCweNZGUwY83iopD6snixxtFzaH6ZPHcPUl1/LQjiTTBAwUSfNpRDDwIPu1IAOnPZBlMTSDhJ1tLJHxvpETCz7aWSPDh1jHxIHjOJIHw460lUpp2RquEy9OOZY2Kw9jJFSwFOaZLR1EfnZDr27Uel0qgUOcuIRVr7OH45ak5uUT4Hmeh8shiGc+1fPNXF7Bris8H54KvUyvyxTprDgdcP7SXWh4WzYKpZehNLKWEnI11sb48cc2MaEKbJJQwYVnPtYQvGlNOi+0Q4VvBJYXhreCRv/yI4DPYJBAe65FIeKxHIuGxHoHk8ViPRLLaCcPcVF86LGn/apdmLpo5VN+srkrJVk+vLuqsLfa4YK6YUng4dSnx8yUPpy5JIHzBXSKFaRedSLg47W6TpDidnTy+1i6Jia+1SyR8rV0gae9BGvJSktNkVFCwaDqJFozPKhM/jQkEp5NoZfRw4ldLZln4VFLSN8KJX7JUCU7XklkZvYkteU0lFPTKNBU24lNNYTA24RIlieTg675e68rHMSLBd3YpwRP6En5cFgN842JKgiXGCF+ymCJPSvC1iklxIDdNuCBJKreCXgGbisI99NtZujtgdVgL3yeZsqqtTg6+HvW1xLyJJ4KvS1WCPXwhbjaakgiw9WejEjjCzqATOMFX5CoFzuhF2ZkUh0ARcLhJd0l0Vlw+TsilP5nnsq1NtvBd2Vlxoz2Ndr2oBuyms4qgKQz9sYEm8FzW2oATTrprzrPXyAvsPk68vLwVZ2D3MSEFkeC77pUCZ/jG9+w1ZozdsNUm4HJSs7ZcwIs1e5tT5LMQcl1RVyJRw3VgiQhC8yUCrMZ7Xmi2Gkf7WnQl3VVj0ZSI3gslLt/mvz4f5f5HewqANH6x/fgll9fjF3ZhvSR980G84Lzc+rOf+05QVyCoN1q91N4YfdsEcfXXpHc2XTTnQnrj9ODMg3mufubWDTWUAns9OEoC/90carG9/9/t/XazOXz8PLv56/fh08NdtXeL5n+lbQq6j6vpfN9tN/vmhrLR580Y/vh6Hn/su4+tMePPY/+5HX/etIpHfHtXxOGdmMav+NEruX+ljF8Z6HRCz/1XB3ktjfVrL7fq3hmEp7Gu7c0+3Tujn4rjdxrpOzGDZ8uyFb9/pwedlGt7+0L/Tq9uOfktGkrtpPTbIyW44m/Pye+ojTbHl05/ehDbupPfG2StKpw8yHzB23GlUf/tNj2jf6lNrjw+yONyavMQuwf+5AEN2OKHl8bStkkZx5fInHATjZ6cgPNQoiOxyOSTl4ZfDPbkwVC6rYjHb9vxS+0+vu7H3aB5On1pKLd2RbV7iU5eiqOXTp8MBtaqdBTEn/yGtaOXxiU3Euu04EainJZbuybZPThBeTsuxNr4rPbLx+Y4nfXL8mm3qj9+Nfu53D0fxh7Z+kwhxuhDTO7Pn/8Dt1Lg/A==",
      position = {0,0}
    }
    local records =
    {
      {
        station = "top",
        wait_conditions = {}
      },
      {
        station = "bottom",
        wait_conditions = {}
      }
    }
    for k, v in pairs (game.surfaces[1].find_entities_filtered{name = "locomotive"}) do
      local train = v.train
      train.schedule =
      {
        records = records,
        current = math.random(#records)
      }
      train.manual_mode = false
      v.insert("solid-fuel")
    end
    script.on_nth_tick(300, function()
      for k, v in pairs (game.surfaces[1].find_entities_filtered{name = "locomotive"}) do
        v.insert("solid-fuel")
      end
    end)
  ]]
}

simulations.rail_building =
{
  init =
  [[
    storage.player = game.simulation.create_test_player{name = "kovarex"}
    storage.character = storage.player.character
    game.simulation.camera_player = storage.player
    game.simulation.camera_zoom = 1
    game.surfaces[1].build_checkerboard{{-22, -13}, {22, 13}}

    step_1 = function()
      game.surfaces[1].create_entity{name="straight-rail", position = {-9, 7}, direction = defines.direction.east}
      storage.character.cursor_stack.set_stack{name = "rail", count = 50}
      script.on_nth_tick(1, function()
        if game.simulation.move_cursor{position = {-8.5, 7}} then
          game.forces.player.chart(game.surfaces[1], {{-16, -9}, {16, 9}})
          step_2()
        end
      end)
    end

    step_2 = function()
      storage.wait = 60
      script.on_nth_tick(1, function()
        storage.wait = storage.wait - 1
        if storage.wait == 0 then
          step_3()
        end
      end)
    end

    step_3 = function()
      game.simulation.activate_rail_planner()
      script.on_nth_tick(1, function()
        if game.simulation.move_cursor{position = {-0.5, 7}} then
          step_4()
        end
      end)
    end

    step_4 = function()
      storage.player.raw_build_from_cursor()
      script.on_nth_tick(1, function()
        if game.simulation.move_cursor{position = {9, -7}} then
          step_5()
        end
      end)
    end

    step_5 = function()
      storage.player.raw_build_from_cursor()
      storage.wait = 60
      script.on_nth_tick(1, function()
        storage.wait = storage.wait - 1
        if storage.wait == 0 then
          step_6()
        end
      end)
    end

    step_6 = function()
      game.simulation.deactivate_rail_planner()
      storage.wait = 60
      script.on_nth_tick(1, function()
        storage.wait = storage.wait - 1
        if storage.wait == 0 then
          step_7()
        end
      end)
    end

    step_7 = function()
      local rails = game.surfaces[1].find_entities()
      for _, rail in pairs(rails) do
        if rail.name == "straight-rail" or rail.name == "curved-rail-a" or rail.name == "curved-rail-b" then
          rail.destroy()
        end
      end
      step_1()
    end

    step_1()
  ]]
}

simulations.train_stop =
{
  init =
  [[
    game.surfaces[1].create_entities_from_blueprint_string
    {
      string = "0eNqdle1ugjAUhu/l/C4L5XNyK8tCAA+sWWlJW5Y5w72v1c0ZBaTzj8Hi877ns0eo+YiDYsJAcQTWSKGheDmCZp2ouPvNHAaEApjBHgiIqndPbaVNYFQl9CCVCWrkBiYCTOzxEwo6kYcE5NgYxZoABaruEFgHqNqqwStONL0SQGGYYXi2dXo4lGLsa1RWaAOOwCC1JUjhvFhqQFMCB0cnsGfK/u90lhCox7ZFVWr2ZZE0vHxcODfK0UVZ9xXnwUV/kHxWM346q4ZPqdUVyLq3Wo7KhRW/zgjEngLZMj8iNJmTSFbLeS+R/EjQk8RV6qIZeOoJT33g2V9yTNW822prVLbgK6ZdXmZI+XZSuk569gw4Wgo4m4HvPOHxEjyZgdPQkx76WKd0e4rD9RTTyNMo9TIabzdKHxhN/KY39FwO9Ga6RrsvVaek/X7UEfFdR5DLghbD6Nb4vVz2z/aLNrVf/u9g8uVg5GiWormZVC6r/WyRf1V2/gn7m1cmWibsWdC8oV4d1XPxf98vNRrDRKfdewp7+YHlaM+4bUjcl+4ytUdGjTi5W/J0uRZXtzmBD1T6vEGfaZLvopxmeb7Lsmn6BoqXoPE=",
      position = {-8, 5}
    }

    game.simulation.camera_position = {0, 0.5}
    local surface = game.surfaces[1]
    for x = -31, 31, 2 do
      surface.create_entity{name = "straight-rail", position = {x, -1}, direction = defines.direction.east}
    end

    storage.train_stop = surface.create_entity{name = "train-stop", position = {7, 1}, direction = defines.direction.east, force = "player"}
    storage.end_rail = surface.find_entity("straight-rail", {31, -1})
    game.forces.player.bulk_inserter_capacity_bonus = 7

    script.on_nth_tick(1000, function()
      if storage.locomotive and storage.locomotive.valid then
        storage.locomotive.destroy()
      end
      if storage.wagon and storage.wagon.valid then
        storage.wagon.destroy()
      end
      storage.locomotive = game.surfaces[1].create_entity{name = "locomotive", position = {-20, 1}, orientation = 0.25, force = "player"}
      storage.wagon = game.surfaces[1].create_entity{name = "cargo-wagon", position = {-26, 1}, orientation = 0.25, force = "player"}
      storage.locomotive.train.schedule =
      {
        current = 1,
        records =
        {
          {
            station = storage.train_stop.backer_name,
            wait_conditions =
            {
              {
                type = "inactivity",
                compare_type = "and",
                ticks = 100
              }
            }
          },
          {
            rail = storage.end_rail,
            wait_conditions =
            {
              {
                type = "time",
                compare_type = "and",
                ticks = 350
              }
            }
          }
        }
      }
      storage.locomotive.train.manual_mode = false
      storage.locomotive.insert("coal")
      storage.wagon.insert({name = "iron-ore", count = 300})
    end)
  ]]
}

simulations.logistic_network =
{
  init_update_count = 60,
  init = [[
    game.surfaces[1].create_entities_from_blueprint_string
    {
      string = "0eNqN0+9ugyAQAPB3uc/YzD9Y9VWapkF7OhILDNDNGd99qAldom3kG4T7cQfHCGXbodJcWChG4JUUBorLCIY3grXzmh0UQgHc4gMICPaYZ1qWUkltYSLAxR1/oAinKwEUlluOq7FMhpvoHiVqt8FHGys1azCoPtFYhyppXJQU83FOCkJ6ogQGKPITnSaykSIvKWYM7zFQWvb8jvo1Gb8nY0+yyh4Tw/disr2sLRJFCxF+7An0KeBX57I4Ut+c1h6Weqzs6vpIXa+k8/Mdu9JYtgRvnThelWTPyLyBLVZW8ypAgboZAteJqGtW4R4ZriR1XbdWcTP8F+f782PnsPxYwhH1CbtO/uZ6aePLmVCSE3p1a8sfKP59GQI9arMYURYmWUzTNE0ozaJp+gOOqReq",
      position = {-6, 2}
    }
    game.simulation.camera_position = {0, 0.5}

    for k, position in pairs ({{-2, -1.5}, {-1.5, -0.5}, {-1, -1.5}}) do
      game.surfaces[1].create_entity{name = "logistic-robot", position = position}
    end

    for k, position in pairs ({{-2, 2.5}, {-1.5, 3.5}, {-1, 2.5}}) do
      game.surfaces[1].create_entity{name = "construction-robot", position = position}
    end

    local character = game.surfaces[1].create_entity{name = "character", position = {1.5, 2}, direction = defines.direction.south, force = "player"}
    character.direction = defines.direction.south
  ]]
}

simulations.personal_logistics =
{
  init_update_count = 600,
  init = [[
    game.surfaces[1].create_entities_from_blueprint_string
    {
      string = "0eNqtlm2PoyAQx78Lr3UjVFy3X2XTNGjHLokFA9i7XuN330G7trnincud73j6zX+GGYcrqdoeOiOVI9srkbVWlmzfr8TKoxKtn3OXDsiWSAcnkhAlTn5kdKU7bRwZEiLVAX6SLR2Svx5zRijrz6UVtI+H2bBLCCgnnYRJwDi47FV/qsAgfWZI1UiFS2n9AdYhu9MWj2nlrSIqZfSFJ+SC0Bc+Wpj27y04J9XR+n0GTvoM+x7XWgcGDnsvFJca0VpIyDQ9KbnZtQ6gTbtWOECjte59yGiWJeSkD36DcGkLYpQ0h2Q3+Kj85gtbisezL7S8+bIZfTlIA/W0XgbAmxncanHAmUBwsofQPODy5OvGdO+63t/NEz6P0M3W6OYR4HwNuIgA8zXg1whwsQZczuAGUymVyoJxwZucua/IDZDeZlInrJVnSDujzxLTYrFyZmQZRtLs+QcQSDE2MmgWRNB/kEXZgi72/ajRVRVF7yVl+8o6MW59xm42EzQPyrsXDrRozcg6BQXmeEGlKLMRNYSYdGJ6mVXfNGD2Vv6C8afz9YWs8XWSGf+T5JjKoXzhemKqheYLsDIGtlAj9C0GVoRhLIvoUZ76H5vUlF9aYYbV0tS9dPdexaJ6FV3dU26ufLOpsJhuOJryT4YfaMwH4B0LlSeY+nyHs+OjY/vwtEnIGQM1klhJ83LDi6LIOS/ZMHwC34/0HA==",
      position = {-9,0}
    }

    local roboport = game.surfaces[1].find_entities_filtered{name = "roboport"}[1]
    roboport.insert({name = "logistic-robot", count = 10})
    game.simulation.camera_alt_info = true
    game.simulation.camera_position = {0, 0.5}

    game.forces.player.worker_robots_speed_modifier = 2
    game.forces.player.character_logistic_requests = true

    local character = game.surfaces[1].create_entity{name = "character", position = {1.5, 1.25}, force = "player"}
    character.character_running_speed_modifier = -0.5
    character.direction = defines.direction.south
    character.get_logistic_point(defines.logistic_member_index.character_requester).get_section(1).set_slot(2, {value = "steel-plate", min = 1000, max = 1000})
    character.get_logistic_point(defines.logistic_member_index.character_requester).get_section(1).set_slot(2, {value = "electronic-circuit", min = 1000, max = 1000})

    script.on_nth_tick(600, function()
      character.clear_items_inside()
    end)

    script.on_nth_tick(1, function()
      character.walking_state = {walking = true, direction = ((game.tick / 25) % 8) * 2}
    end)

  ]]
}

simulations.requester_chest =
{
  init_update_count = 600,
  init = [[
    game.surfaces[1].create_entities_from_blueprint_string
    {
      string = "0eNrNmNFyoyAUht+Fa+0IiDGZ2SfpdDLGnHSZUbSI2WY7efcFTUzSYAs0F5u7oHzncOD/cc4H2lQ9tJILhVYfiJeN6NDq+QN1/FUUlRlThxbQCnEFNYqQKGrzT8lCdG0jVbyBSqFjhLjYwjta4WP07WTZbBoz92oaOb5ECITiisOYwPDnsBZ9vQGpudNsLnZc6Edx+Rs6palt0+lpjTDxNCom+IlF6KChT2yIML6/7kApLl47856EutnDutfPKgUStmuTon60K6oOIjQOj5mc4nYKoIrbqlCgg5ZNb0qGkyRCdbM1LxQqrqAYUpqK8XI09fi0FjJXxvu14Py0FjqsZcsllOPz3AKmE7hqiq0esRQnuSrNFS6NznvV9Krtzd7c4dOAvIlL3iwAnLqAswAwcwEvAsCZCzifwDt9lGIuOpDKupMTd6G5FtLyojd467VUQM5KBtMrVnSesJ5UoCU9Jj0q4ny8b3VyGbUq5q0vKp2fHheNrLU9GBHVbSEL1eh00a+LqvQ5rov39fmfVpFVRzhxLxa5WeDVJmBiI2OP/U3m0KmN7CN+7EWm7uTcC+yh+6UX2EP3mRfYQ/cLL/Die4edw00Gy8WMv+Lc/ZK7FazfHadkD1Y9XSyjLbqO7yFuZbPn26+c43yUcrsLkeT+2rfcSmRg4MSKwCFOZmT5H1pZNMEvRgCVzkg2gpdxyWXZc+UXI7uJkc3ZJSH+dnmq4nd+SWiAX96zbZIjaYBhOqKZv2M6kjN/y3QkL/w905Gc+5umI3np6poW3ve2SRN/2zwFeoxvUuz/0YbdPujJDxzZiNiaLg3yU/pIP/2p5Tl+IdI0wPKok+VRFmJ51EUvNAuxPDf0IsDy3Mh5gOW5kZcBludETpMAy3MjY2fLowGWl5IAy6MPtLz04iFdv+lUMUS0BKdj7NQKST/5gXYDECBfD1qoOo1dUYKNiUemWc2m3+1Arjv+F4ZmzPlni8bcUib4q5RDOgqY2Y04Deki4HQGlofAshnYMgQ204hgSUDvzlAf2Lyz3jen24OE9PAYdu61nZbi2WxjIV3CIZRppf7RwUwBnrVQWaSPPnvRo0MbdnXV8o3QXhdqIJEcpzllWZaljOXkePwHW+hE4Q==",
      position = {-2,0}
    }

    local roboport = game.surfaces[1].find_entities_filtered{name = "roboport"}[1]
    roboport.insert({name = "logistic-robot", count = 10})
    game.simulation.camera_alt_info = true
    game.simulation.camera_position = {0, 0.5}

    game.forces.player.worker_robots_speed_modifier = 1

  ]]
}

simulations.active_provider_chest =
{
  init_update_count = 600,
  init = [[
    game.surfaces[1].create_entities_from_blueprint_string
    {
      string = "0eNqVlNFuqzAMht/F12EqtFDWV6kmFMB0kUKCnNCdnop3Pw7stJOgHe0ddvz5t2v7CqXusSNlPByuoCprHByOV3DqZKQONiNbhAOQLW1nycMgQJka/8AhHj4EoPHKK5yixo9LYfq2ROIH4n+0Mo0y7IqqT3QeBHTWcZg1IQOjsrdUwIUjkrd0TDA9Lxx6r8zJhWeErT1j0bNPeySsC+WxZVcjtUMBk3kS8p22lESoOV1l+1BhvBHQ2jq4pI80ylHLvZxhELMiklsR2sqaLY/F71h6rQiryZkL8JcuRNred31o3Yy+vdE9SeNCh6MS9bMWpWOLfuZZ4O5e52ZruOnr3P0abvY6930Nd/86N1/DzcVsMWbE7chL4qWpev+xGg7JP5urZMOKFhhhmr8hkqWeMerInhXP6G9rlsQPiPeNdd6SPOEjUljU56j73ri+dF6OwTNOlE+UZcZ2FWPzDHFfBNT8h5KqIjRIp0vENw+pkRUuqMomZMaDUPZNg1Q49RdDy2+/cPy+eEjCwTlytalguekHW8NZCsfndlkFnPkwjfgkj3f5Ns2yfbzJGTL8A2GDzz0=",
      position = {-6, -2}
    }

    local roboport = game.surfaces[1].find_entities_filtered{name = "roboport"}[1]
    roboport.insert({name = "logistic-robot", count = 10})
    storage_chest = game.surfaces[1].find_entities_filtered{name = "storage-chest"}[1]
    game.simulation.camera_alt_info = false
    game.simulation.camera_position = {0, 0.5}

    game.forces.player.worker_robots_speed_modifier = 1

    script.on_nth_tick(1, function() storage_chest.clear_items_inside() end)

  ]]
}

simulations.buffer_chest =
{
  init = [[
    game.surfaces[1].create_entities_from_blueprint_string
    {
      string = "0eNqlk9tugzAMht/F12HiFIqQ9iRVVQVqukiQpEnoxirefQZatgk0TRu5QLHsz7/t+AZl06GxUnkobiArrRwU+xs4eVaiGW2+NwgFSI8tMFCiHW9Wl9po62FgINUJ36CIhgMDVF56iTNjuvRH1bUlWnJYoo1wTl4xMFZf5QltUL2g80Q32lG4VmNeQgZR/sQZ9FDQfxjYChmvBa0hcTwhonCLkCyEsqvrn6Twu5QoJC0MLF468jzWsvFo3ejmsBoj5uIfXWGweHyz3rNKq1VgGuGRcl460ZA4MittW2o/g0q3RljhNWmF58nQjbOKwnCs5s777EOljaEq/kg80NloUvqPyUXx9uj4wnRd6byYgtecJJkp6RYjWxjYUO+trAJUaM99QO8ZbS0q3EJGM3Kc4jz0o5PvOHXg8W0k2/1OcMwXwbQPr9JOy7DnjLMd4weyTZtUfFk8Bld6HxMjzqM0T3iWZSnneTwMH+efMFE=",
      position = {-8, 2}
    }

    game.simulation.camera_position = {0, 0.5}
    local roboport = game.surfaces[1].find_entities_filtered{name = "roboport"}[1]
    roboport.insert({name = "logistic-robot", count = 2})
    buffer_chest = game.surfaces[1].find_entities_filtered{name = "buffer-chest"}[1]
    provider_chest_1 = game.surfaces[1].find_entities_filtered{name = "passive-provider-chest"}[1]
    provider_chest_2 = game.surfaces[1].find_entities_filtered{name = "passive-provider-chest"}[2]
    game.simulation.camera_alt_info = false

    game.forces.player.worker_robots_speed_modifier = 1
    game.forces.player.character_logistic_requests = true

    step_1 = function()
      character = game.surfaces[1].create_entity
      {
        name = "character",
        position = {5.5, -10},
        force = "player"
      }
      character.walking_state = {walking = true, direction = defines.direction.south}
      script.on_nth_tick(1, function()
        if character.position.y >= 0.5 then
          character.walking_state = {walking = false}
          step_2()
        end
      end)
    end

    step_2 = function()
      buffer_chest.insert({name = "iron-plate", count = 100})
      buffer_chest.insert({name = "copper-plate", count = 100})
      provider_chest_1.insert({name = "iron-plate", count = 100})
      provider_chest_2.insert({name = "copper-plate", count = 100})
      character.get_logistic_point(defines.logistic_member_index.character_requester).get_section(1).set_slot(1, {value = "iron-plate", min = 2, max = 1000})
      character.get_logistic_point(defines.logistic_member_index.character_requester).get_section(1).set_slot(2, {value = "copper-plate", min = 2, max = 1000})
      script.on_nth_tick(1, function()
        if character.get_main_inventory().get_item_count("iron-plate") < 2 then return end
        if character.get_main_inventory().get_item_count("copper-plate") < 2 then return end
        step_3()
      end)
    end

    step_3 = function()
      local count = 30
      script.on_nth_tick(1, function()
        count = count - 1
        if count > 0 then return end
        character.walking_state = {walking = true, direction = defines.direction.south}
        step_4()
      end)
    end

    step_4 = function()
      script.on_nth_tick(1, function()
        if game.surfaces[1].count_entities_filtered{name = "logistic-robot"} > 0 then return end
        reset()
      end)
    end

    reset = function()
      if character and character.valid then character.destroy() end
      buffer_chest.clear_items_inside()
      provider_chest_1.clear_items_inside()
      provider_chest_2.clear_items_inside()
      start()
    end

    start = function()
      count = 60
      script.on_nth_tick(1, function()
        count = count -1
        if count > 0 then return end
        step_1()
      end)
    end

    start()

  ]]
}

simulations.construction_robots =
{
  init =
  [[
    game.surfaces[1].create_entities_from_blueprint_string
    {
      string = "0eNqN0dFuhSAMANB/6TPeTBBj+JWbmxt11ZEomILbnOHfB7q4JfoweKKhp027QjPMOJE2HtQKurXGgbqv4HRv6iHF/DIhKNAeR2Bg6jG9yDZ2suQhMNDmFT9B5eHBAI3XXuNubI/laeaxQYofztkMJutigjWpUkQyzhks8e9LCOwk8ENw3lLdY9a+obti8uomf6CbvKLELzU3ztdb8tkRYleKK6M4DByw9aTbDA1Sv2RxnEhd3eIVme+kjKNr5q5Dejr9hanV41wUk/9rmMuj4biOD03bLu6CyXQfMbYtUv3ZO4N3JLcZvMqLSsiyLAspKx7CN2VVsKk=",
      position = {-9, 2}
    }

    local roboport = game.surfaces[1].find_entities_filtered{name = "roboport"}[1]
    roboport.insert("construction-robot")

    local chest = game.surfaces[1].find_entities_filtered{name = "storage-chest"}[1]
    chest.insert("stone-wall")
    chest.insert("gun-turret")
    game.simulation.camera_alt_info = true
    game.simulation.camera_position = {0, 0.5}
    game.forces.player.worker_robots_speed_modifier = 1

    script.on_nth_tick(360, function()
      if not storage.ghosts_built then
        local bp_string = "0eNqV1NtqhDAQBuB3meu4mHjImldZSnHbYQnoKCa2Fcm711gKS5uguYww3/wOk6xw72YcJ00W1Ar6bSAD6raC0Q9qO//NLiOCAm2xBwbU9v5k7ECYfbZdB46Bpnf8AsUdOyx8zJTZeZrQPhUK98IAyWqr8af9flheae7vOG1yqDGDcTBbyUC+m2cuFYMFVMYvlfNZ/ijilFIcKEXoX/4ru5GHgPJUjPIgRnVKqX6VPKzUaUoki0wYiQgB16QYkRRNEhIZCM+TVq2IKDxp1WKKSNqUmFIkzSWmlEmK8Mp2qffLr54eGQYfOJm9QFx5KRsheS1lU9fOfQPQI3ms"
        local stack = game.create_inventory(1)[1]
        stack.import_stack(bp_string)
        local ghosts = stack.build_blueprint
        {
          surface = game.surfaces[1],
          force = game.forces.player,
          position = {4, 1},
          build_mode = defines.build_mode.forced,
          direction = defines.direction.north,
          skip_fog_of_war = false
        }
      else
        for k, entity in pairs (game.surfaces[1].find_entities_filtered{type = {"ammo-turret", "wall"}}) do
          entity.order_deconstruction("player")
        end
      end
      storage.ghosts_built = not storage.ghosts_built
    end)
  ]]
}

simulations.fluid_wagon_connection =
{
  init_update_count = 300,
  init =
  [[
    player = game.simulation.create_test_player{name = "kovarex"}
    player.teleport({0, 2})
    game.simulation.camera_player = player
    game.simulation.camera_position = {1, 0.5}
    game.simulation.camera_player_cursor_position = player.position
    game.simulation.camera_player_cursor_direction = defines.direction.south
    game.surfaces[1].build_checkerboard{{-30, -17}, {30, 37}}

    game.surfaces[1].create_entities_from_blueprint_string
    {
      string = "0eNrFmd1uqzgQgF9l5Wuo+LH5ycVe7ktUFSLgpNYBjIxpN1vl3XcMBNLUOR3nSOf0psW1P8+MZ4bx8EH2zch7JTpNdh9EVLIbyO75gwzi2JWNGevKlpMdUaVoyNkjoqv5v2QXnl88wjsttODziunhVHRju+cKJniXldWo3njtG4BfEo/0coBVsjNwIMWZR04wP86BXgvFq/mfYXT2vlCjlTpoAB5f9cT9SqWhnUot0BgNjfFQioYyPJSt0EMzitp/L48w9SsyvULyrtw3vGjkUQxaVEPx/irguZVvojuS3aFsBu4RqQTsVc6Q4Clllt0TtEopXqUUDc3x0AwLZQ5ukqOhDm4SBiu1kZVspRZv3IKkv3qiEfhOJftTUclGquKgZFsYNbpi0LJfVtkEDNFqOzhyiA5k5uBLITqSmYMzhehQThy8KWTYBJlQOzWxURMrdW9Ju4uT0hCRdsMtSief8SefuXtWt0xQYLh4IuFtr0/EtkmGlT3J7ftYLbKFbctrMbY+b2C+EpXfy8YSajR5WhyZxk/sbHsJbTHbi577WvpHJceutsCyFRbdgYVYraOL1uyz1tb3ZISlpvFKtXFirJdGy9mzACHdFlETbik2vjJX67Hw6UbrzMZlD581C+4cT/LAWU+w76Xdgkp0B9HB/3yzh+3Vd2OHy/xi4FpD0h+uCrX3UgMdGFxV5gVwhEFwWA1xx1WpR8Xn5NPK2kwvtd/KQROr8hn29NNVcysnxxuRrapGGCPGAdqIGzn+nUaMr1+gUgHK12X3w1Y13VfdWrZGuChK409cG8k9yiniaLYoX8OQd1wdTz5cN7g6lJWt0omudtiPhwNXxSD+M/YO1h/bbszZV290CK3YxDU9sxxhmvTxRJXdOcPMNePfCmrXP8fGl0l6Mzh5LEmFP42vhpd3AoyiU4Dx/z8jYogWkf4pESPXyjGJb/zHeg2OcUmKhqveMSb5UYqqSOk9WaPrkvQgmsZWkdItpwzj/jL/7s0UNrFBriqIse1/Gjjx96mDpt/hIidc9h2OOuFy3HGzzO24WeB6N7iV1kp1blIlDOHzzLlLlWBM4NymQlGd+1QoKkN1NUxorMgH+1SPdTWYcy8LpbZzMwtFde5moag5rpfI4l8/I1svMXDtpmGUSpybVSiqc7MKRXVuVqGozs0qFNW5WfWV+gJv3OqV12OzfDDYMoN5DgOPsas5hgerpaqXDxKf39YeFD9CQ9h39bT9PAmAfal4oU/9VPBMN8zlYfJyWDB2mpiksSw0+xyEGnSxffK4XkG8z9XWeVoL0pgvJtOVxFu2LeF2B9P+hvLqxdjwtuWFElmqTeKlU/ZiTGfuy5DPyD9Gpr/mp/NkUy2rHwbazaa+WAtGp+8F+9L8Mdf2y6jpOc/D7GqUrZPNxWAbBueDtGq0Zcxs+A6HajZ5DnOPeRHz4NSezS8PbjXmb/PLo2YcZgsoRkHs7SuTR964Gia7sCTKaZ4zGqRJkkLx9D/NxbaO",
      position = {0, 12}
    }

    for k, v in pairs (game.surfaces[1].find_entities_filtered{name = "locomotive"}) do
      v.train.manual_mode = false
      v.insert("coal")
    end

    step_1 = function()
      local count = 30
      player.cursor_stack.set_stack({name = "pump", count = 1})
      script.on_nth_tick(1, function()
        if count > 0 then count = count - 1 return end
        if game.simulation.move_cursor({position = {-1.25, 0.75}}) then
          step_2()
        end
      end)
    end

    step_2 = function()
      local count = 30
      script.on_nth_tick(1, function()
        if count > 0 then count = count - 1 return end
        player.build_from_cursor({position = game.simulation.camera_player_cursor_position, direction = defines.direction.south})
        player.clear_cursor()
        step_3()
      end)
    end

    step_3 = function()
      local count = 30
      script.on_nth_tick(1, function()
        if count > 0 then count = count - 1 return end
        if game.simulation.move_cursor({position = player.position}) then
          step_4()
        end
      end)
    end

    step_4 = function()
      local count = 150
      script.on_nth_tick(1, function()
        count = count - 1
        if count > 0 then return end
        local wagon = game.surfaces[1].find_entity("fluid-wagon", {-3, -1})
        wagon.clear_fluid_inside()
        reset()
      end)
    end

    reset = function()
      local count = 200
      script.on_nth_tick(1, function()
        count = count - 1
        if count > 0 then return end
          game.surfaces[1].find_entities_filtered{name = "pump"}[1].destroy()
          start()
      end)
    end

    start = function()
      local count = 60
      script.on_nth_tick(1, function()
        local wagon = game.surfaces[1].find_entity("fluid-wagon", {-3, -1})
        if not wagon then return end
        if wagon.train.speed ~= 0 then return end
        count = count - 1
        if count > 0 then return end
        for k, v in pairs (game.surfaces[1].find_entities_filtered{name = "locomotive"}) do
          v.insert("coal")
        end
        step_1()
      end)
    end

    start()

  ]]
}

simulations.gate_over_rail =
{
  init_update_count = 0,
  init =
  [[
    player = game.simulation.create_test_player{name = "kovarex"}
    player.teleport({0, 4.5})
    game.simulation.camera_player = player
    game.simulation.camera_position = {0, 0.5}
    game.simulation.camera_player_cursor_position = player.position
    game.surfaces[1].build_checkerboard{{-20, -60}, {20, 48}}

    game.surfaces[1].create_entities_from_blueprint_string
    {
      string = "0eNqlme2SojoQhu+F3wyVzjfeyqktC5V1qEWwAJ2dmvLeNwiLrtNOuueUf0STh5fkTadDfySb+lQeu6oZktVHUm3bpk9W/30kfbVvinr8bXg/lskqqYbykKRJUxzGq66o6uSSJlWzK38nK7j8SJOyGaqhKqf+14v3dXM6bMouNFh6bk/dudy9jICXIgCPbR96tc14q0CSINPkPVn5PNB3VVdupz9BXtJPVEmnWpRqEahCoRsEKtwVmgNBqiZTJaBUTKqhS1UT1PwLxZRaulLzF4pgHHluxPTAIERcnCdTpVuoCCdfOP0QEPvX4Ur6Sp3COCDIoEUQDrqtkJHTvPRDe8Qo+UJJwy2L6b/QrNknGFbyHxSdTlD8B8VBmq/IoaCb++t22x7aoTqXX8mxmdAyt96Ni6Bsik1drut2X/VDte3Xb69VuD605yqM5OpnUfdlmrRdFe46D7LARFj+sOBP4/jDkqMgz1eEg/hrBAADSf4aeQICviJ0scm7jaPo9u3LW7EPfb/QozKhcmHld60z7pTncN12Adec6hpTxV9iTx5Pk2IJ5HMsgYddwf8TWSo8skjDnww0IEj+EnoC4m854B+eHMN6qllsFlICoWDeFwHyLAf3fyJOJgxYIXOljDFeg9Yml9IbMHa8CcFTOXvDfBwTwOKeEtzUA6SKj7UCbvLxCYvLJS94mWlhF7bJTO6s+f66zwJDayUCQhrnrHVSWSU90KZP0UOCsLNmS0hx6XuwlDgWS84UIx+dQ49Etx5Fz0HhBorrowcImAOE0qg+ehoKbgHF9dF33EUfmkxo+o676MNBwFeEzqiWfEU4SLEVaTSZ0Jqt6AnI8BWh27a2fEU46D6XbJsyRLsaDRkymwOd1hm6pWpPJKkoKSeSdIxkBJFkoiQgklyUJIkkGyUpIimPkjSR5KOkbzgcB1maJIjayRAtDlGLG6LFIW4nosUhanHLj9/4gFuiwyHqJkt0OETdZIkOlxAlER0uRZRkiKSoMS3R4jJqTEu0uIwa0xItLuPG5GcoGk0s3DccjoP4GYpGEwvHz1CegPgZikETC8fPUJ6ADDvvNZpwqnKWnQY/crFDoHPsY4TJKXI9+1TxyEXl5uwzmpWEN92CfUZ7xGJHPw/sg7slFA28ZB/cLRphvGK/xHGUuoFmvwdxaOHAG74+gue95eujLFHv2NPtCJ73nj3djrJEfc4tvoF/fP+jsXKP4JbfPnFRLLusCd5Q5LILm5+4eqzI9tvXcneq55LsrUoyXoO5azDSQte2283V38+vfx9qTWnyVlTDets2u6ueqV+4wbHoyvVcM2670G7+PlSHsTozVNtf/bjbCnH5ET5XmUO7/TWimkn9Xw3h16nMsynGb1JOOtrpIk1+du1Ytr5r4e9b+KXF2Hhqoe4Z6sYIPYOQa417dVcST5Nz2fVTVPGgvTLWWm1MMPPlDwN7EjE=",
      position = {0,-8}
    }

    locomotive = game.surfaces[1].find_entities_filtered{name = "locomotive"}[1]

    step_1 = function()
      locomotive.insert("coal")
      locomotive.train.manual_mode = false
      locomotive.train.go_to_station(1)
      player.cursor_stack.set_stack({name = "gate", count = 10})
      game.simulation.camera_player_cursor_direction = defines.direction.east
      script.on_nth_tick(1, function()
        if game.simulation.move_cursor{position = {-3.5, 0.5}} then
          step_2()
        end
      end)
    end

    step_2 = function()
      local count = 30
      script.on_nth_tick(1, function()
        if count > 0 then count = count - 1 return end
        player.build_from_cursor{position = game.simulation.camera_player_cursor_position, direction = defines.direction.east}
        step_3()
      end)
    end

    step_3 = function()
      local count = 0
      script.on_nth_tick(1, function()
        if count > 0 then count = count - 1 return end
        if game.simulation.move_cursor{position = {-2.5, 0.5}} then
          step_4()
        end
      end)
    end

    step_4 = function()
      local count = 0
      script.on_nth_tick(1, function()
        if count > 0 then count = count - 1 return end
        player.build_from_cursor{position = game.simulation.camera_player_cursor_position, direction = defines.direction.east}
        step_5()
      end)
    end

    step_5 = function()
      local count = 30
      script.on_nth_tick(1, function()
        if count > 0 then count = count - 1 return end
        if game.simulation.move_cursor{position = {2.5, 0.5}} then
          step_6()
        end
      end)
    end

    step_6 = function()
      local count = 30
      script.on_nth_tick(1, function()
        if count > 0 then count = count - 1 return end
        player.build_from_cursor{position = game.simulation.camera_player_cursor_position, direction = defines.direction.east}
        step_7()
      end)
    end

    step_7 = function()
      local count = 0
      script.on_nth_tick(1, function()
        if count > 0 then count = count - 1 return end
        if game.simulation.move_cursor{position = {3.5, 0.5}} then
          step_8()
        end
      end)
    end

    step_8 = function()
      local count = 0
      script.on_nth_tick(1, function()
        if count > 0 then count = count - 1 return end
        player.build_from_cursor{position = game.simulation.camera_player_cursor_position, direction = defines.direction.east}
        step_9()
      end)
    end

    step_9 = function()
      local count = 30
      script.on_nth_tick(1, function()
        if count > 0 then count = count - 1 return end
        if game.simulation.move_cursor{position = player.position} then
          reset()
        end
      end)
    end

    reset = function()
      player.clear_cursor()
      player.clear_items_inside()
      local count = 30
      script.on_nth_tick(1, function()
        if locomotive.speed ~= 0 then return end
        if count > 0 then count = count - 1 return end
        for k, gate in pairs (game.surfaces[1].find_entities_filtered{name = "gate"}) do
          gate.destroy()
        end
        start()
      end)
    end

    start = function()
      local count = 30
      script.on_nth_tick(1, function()
        if count > 0 then count = count - 1 return end
        step_1()
      end)
    end

    start()
    ]]
  }

simulations.rail_signals =
{
  init_update_count = 0,
  init =
  [[
    game.simulation.camera_position = {2, 0}
    game.simulation.camera_zoom = 1
    game.surfaces[1].build_checkerboard{{-65, -38}, {41, 13}}
    game.surfaces[1].create_entities_from_blueprint_string
    {
      string = "0eNq9m9tuqzoQht+F6zTy+ZBXWaoqkrBStAlUQNtdLeXdt0kJTeh05Z/dw12IzIfHM4Pnt82fbF09Fg9tWffZ6k9Wbpq6y1a//mRduavzavivf3koslVW9sU+W2R1vh+u2rysssMiK+tt8W+2kofbRVbUfdmXxev9x4uXu/pxvy7a1ODizpuRvsgemi7d09TDgxInxqVdZC+pvfJLm/jbsi02rw3MYfEOqyZsn7j1Tdc3D++pUsgT9BIp0/1dn79eZH25+SfPiKdorPNSKV7vzcTdPLZPxfbmiM+JYXEjNs77T1DtRO2GQdnd90cuNdg0leqqQ6FvYw1QPU7VODVM1KrZNPumL58KCmmWTtkzbFHn66q4q5pd2aVY6O6e78t0vW+eynqXrX7nVVcssqYt0/PGmBFLb4keRNwui9slBY71DKzEsYyIkW+5ucnbXXPznO9S2/dQKb/GD8PL6Cn91bSJVD9WFdUpDdsqGXEsDY5lBLK0OJYTR3gyS04cedTh4QcdHnBbOcGNZ7hixJHCM1wx4kjhGa4YcaQUjmXEkcJzVDFcpvAc1RyX4TmqOS7Dc1RzXObRkkPqQGMdhQ0kdk3UHOPQaglUMiqiWGk0zaV6qwVYzxl7que0nNdzJJhd5WqN1ImaWeZqfa3MXZNlLr/OBftv0AHnguHkC2M0a3NJpcJOO7guVyPVAtGs4Wo3WhpLDgE8wUXPoEauiECoRrBVBISVbBkBYRWqI86YX6chjGaLCMgqwxYRENayRQSEdbCI+KwTFFRPGs8WEJCdgS0gIGxkCwgEawVbQEBYCQuIn3G2VWzxANmp2eIBwhq2eICwli0eIKxjiwcI69niAcIGtniAsJEtHhCsE2zxAGHxeVYzXObwLNMMlzk8ywzDZQ5etJXG0FhKOjg8y4yjS1kS61AFFU6B4K8XyM7DVE9TyQLZ4UlmTjOAA8aAoSIj3V0K6/EkG+bLIzYA2Lcku8+r3zfbcpgE8+ojXTO+Foy87javYLdxqHie2VEuGQGMg4G9ZsfQNfpAgSwmPv0kys2weUORYF0YxheKccD44UsydswmE8juBVBl2zBZGucqO1DgyLXbiuvUINh2WzV7iwiKK7lRboExCIodjtYjvdXcV6md7wGSW2D4LCXUB1wqWIPFuY7mUske2CsuTiKj4LkbrHMsSQXzLE5p5t6tHkpJgSPr1T8JTAeseUYBxy8LK/G0kPgQR8WeU5y4/qqNGo5eeQoIDcRZNGydOOeSWMvWiRAWXVNR6gz6jTI7erZwhewMbOEKYSNbuCJYKQTqlvgzbjmuwTK1NGapYotpjKvZahrjGracxrgWW2DW7vMOJ5/v2Hoes8uzBT3GDWxFj3HxjDacuJF4hWschyvZytOp67OjPDux83cBIc1U2dh3lY0m0RovPyY0MPNKiW4tSj/12SyR7Tp5dvrmr7uuUwzPV48uNl2bD84WyrPTOFc2RwXbAo+vfPgPjCC5AQ5sdQpAD3kzwqXJUggdxXSOyLllVDL4T+wIOOFCylnjXEIb6aML4Bmj/3FsZz4e9Ak6/rkdjMs/uINxNbeE8d9cwjAO/Vz06aqlll/CQFzHL2EgrueXMBA3MEsY/7UljIr8EgaxSwt+CQNxJV4SKA5XMeeqeGWuIg8ISfiE0NlcFYi56jY9bnNfbB+r8WuBt+AZrsMi1cZnbQZqur1pt+O3CbNpdZE952V/t2nq7bEXr60S8SFvi7vx+4WmTe3G3325H6J0OAnVDefBxOF2MHf+KcAnuW7A3h6Xai/tS65NmQMbuP4mA9dfZWCy5Ph1yOrsY5JF9lS03WuxGaQJ2jrnjDVRHQ7/Adc/fLA=",
      position = {-10,-16}
    }

    for k, v in pairs (game.surfaces[1].find_entities_filtered{name = "locomotive"}) do
      v.train.manual_mode = false
    end

    script.on_nth_tick(300, function()
      for k, v in pairs (game.surfaces[1].find_entities_filtered{name = "locomotive"}) do
        v.insert("coal")
      end
    end)
  ]]
}

simulations.train_stops_same_name =
{
  init_update_count = 0,
  init =
  [[
    game.simulation.camera_position = {0, 0}
    game.simulation.camera_zoom = 1
    game.surfaces[1].build_checkerboard{{-40, -16}, {24, 44}}

    game.surfaces[1].create_entities_from_blueprint_string
    {
      string = "0eNqtmltvozoQgP8LzxT5Orb7tudvHFURJWyLlkAEtHuqKv/9GBJyKZNmJrvalzUNH56bZ2zPZ/Jcv5XbrmqG5PEzqYq26ZPHfz+Tvnpp8np81uSbMnlMuryqk12aVM26/C95lLunNCmboRqqcv/GNPhYNW+b57KLP0jnN4u37r1cP4yAhzxJk23bx7faZoRHkvZp8hF/71ykr6uuLPZ/lGqXLqjqSO2HCHx5HSbukmokTjUIVJOhmg41ZKilQy0Z6uhQIEMDHeqoUMswlCdDGYYKZCjDUFKQqQxLSXJQWcCpgFHJQWUZDiDJUQUMD5CGqgEQDA1YMtUwqIBSn5ElcHbXQFgC5Sm0Jt5hpV5GK2Szw/rMUsD+Ely85lVzFW8NFx+o6jg6RLitZCXIVMugSjI1MKiKZjmtZtV6uVCtwMCnWKvbot20Q/VeLrnKZw6C1VLNeJ0FM413YzLPn+tyVbcvVT9URb/6/VrF8aZ9r5qX5PFnXvdlmrRdFT+e76kiEx6EcFJorXTQYEAZobTRLn6haLcfq6Kt2271s2s3q3EVaFb90G4PNEwSQ1W8CrMMlwpCqwbLdZJIxTjAdYsrHEflOP0tx9McCo6x6s3CoSwGDkSwZ4K1oIGd4oLJqVEdEq73tx1HEyNWnfQQvk7XY1xawAJkl/Hqs0N03RuvxllrhA7BWqmDBCEtqDtjVdNz8UnlGMeSlOFE5gyIMK0tB21ocNL/iTZCXLKki9TgnFNKQnzi7128NFAV4uS3CnFkjv2WQ66X55gIEuWcVoNJDQ+TGq6uyBGSxg8etJz8k2C7I0FCzsvxhDyPqfMP/IjvbfLmLa/3VupXdbWphnGPinxYksvSb3ViFE2A8NcFINfVs5NdEcCQBJgT0F8UgLyJdfZbAYDt3WgSNY7tETjHsw2DcwJbPyjHCrZ+LMqRxFrAzjkwjCkbIym2pnGOJs4o3JyRYdsM51hiWaNvzgjY1sc5jm19h3I8twIKjlIB2cD2BXR+INgWxDmSrXeco9h6DyhHs/WDc/gejnP4qzbOAdpWdS+UEjIzcH+Fd18dB9zYidNEZfVMG17jBKYNr3CcYNrwGkey9YNmKKfY+sE5mq0fnGNoG5FZOSr7o73YnbsMZ9lWxKUFthXRTOMcM0NEDiVDOH704PPjRw/K8fzowTncekoJwGsFr5h10HWSZtYv10mGeQ6jhL/tC94yjxoWVPTc1HM37EQsd/9OxHpa6gyZ8vORkZIq86CnB/euU0EIECaA1kKBVFqY+49IfGCe7yqpb7tH4F4CLKiowgP3FoCIVczTXyJWM28XlFwcrWK3FsEwr7GU/HqTj167ErdM+rh4ycXGAuUCjXu8v6JyHfP6aqEGlOrZnkuhBrbjku60BbOnQ8lA8AQpJLOrY8HFsYrZ10HEamZnBxFrmL0dRCztcN2ETHp3Pt+7UsW9aUEKbhMKUXpuGwoRy21EIWK5rSg0LLsXhYjlNqMQsdxuFCKW245CxHL7UYhYbkMKgn1Kk754Lddv9aFB7xT/41jpNOZrbVOANG58Y3EZ14qzd0Z+pLXd+tAQ+OVC5/L0/3deDTHom/U0t/0b8WvbvCtXw8d2FKTt4u8O/6+aPM7zPco8PquKX/14iSV2T/HfNPGhLX6NvGYvzzyF+HTsdth/fxroi4E9GwCcDZw5G3h/NohSj1+shnITJ3bqhkyT97Lr9zfDXhqvLQAYC07tdv8DDz5wYg==",
      position = {-12, 14}
    }

    for k, v in pairs (game.surfaces[1].find_entities_filtered{name = "locomotive"}) do
      v.train.manual_mode = false
      local bok = v.train.id % 3
      if bok == 1 then
        v.color = {0.5, 0, 1, 0.5}
      elseif bok == 2 then
        v.color = {1, 1, 0, 0.5}
      end
    end

    script.on_nth_tick(300, function()
      for k, v in pairs (game.surfaces[1].find_entities_filtered{name = "locomotive"}) do
        v.insert("coal")
      end
    end)
  ]]
}

simulations.rail_signals_advanced =
{
  init_update_count = 1000,
  init =
  [[
    game.simulation.camera_position = {-1, -1}
    game.simulation.camera_zoom = 1
    game.surfaces[1].build_checkerboard({{-62, -44}, {60, 54}})
    game.surfaces[1].create_entities_from_blueprint_string
    {
      string = "0eNq1nN1y2kgQhd9F15ia/5n23e5rbKVcGBNHtRi5ADubSuXdVwIJZGjF58TJnZHFp57p7un5OeJ7db9+WT1v682+uv1e1ctms6tu//le7erHzWLdXdt/e15Vt1W9Xz1Vs2qzeOo+bRf1uvoxq+rNw+q/6tb++DSrVpt9va9Xx+8fPny727w83a+27Q2nby4X28fm5uvisdm0uOdm136n/bN9UMvJbp5CiN66OKu+Vbcuzp0NJfgcf3QPWNyvV3fr5rHe7evl7u7rl7r9/NS81pvH6vbzYr1bzapmW7cPXxypZu68a5E52pSy5OSzeBmeUG9e21ubbfukzct6/WN2Zbc72/2yfV093HQNv1lolvcGt3Y+1NvV8vg/6xSoP0F3+5b3+GV/wCrQqEKDwgwwM8PMCDpN5smNLP01N0HuSHArBW5lRpnFwswCMz3MFJiJR401J+i6WTZPzb5+XSnE9Fs8rBlg4VbhcWsdDMXDxMJZK3icWDhtBQ8UG2EoESlw6gnhKDj3hHAUnHzWEJ4StBJYE1Rq0sqLUan319TU92oG6ouzb+r0TV/Lr6PfzPsASHOkbjmHcYXlerQXrBG1G9S+DXDfHnPL27dQ1dSIdUGKfRd4c9UFRuMmuAvsyVqNk9EwTcfY9wlodIFj38aBqnHgEjYYJxrGG2xeYm2Yi5NU+mmUL3MjH5hJhnbeGIt44yUb75PYYBI2b/FwmTv1oN50R/ZgUKPEe9acCU5gzfEqBk0q1ydVcJdJVTRsolupm5fZVkYVc86ijrK52e2b58nBKHQN3A3BV/1VaURBE6FvXvxYAkChHgzd62p3Bcv2elYxjjZH53hopjzYIvMPdLT2eDrT1PEjRLo3dE4izYnq+BEya84Ep7DmqIkeBPLxyRb3wXTSltx09uhNiWz2RDUJI509ExyPjVSDMekj6YOMUpHNp6iOCvGici2/HAb2ifrVTt36Aha7ibHGo0vWhF1syYpqmkd44lfKgHl/uh+FXElfUrX1WTLkShqCWnIlDUEduZKGoJ5cSUPQwK6kISpegwzhKjxzDOGrjFUEk+dl2LM+cH/fDlkitjOIeBGcigdMJqoXHjCZWDzhAZP50qaOkdn/Aud96/DUs7jXMzH9I7yOp54jvI7PDR3h9YIltAt/IpcznnUOj5WCZ53DY6XgWefwWCl41nk8Vgqegx6PlYLnoCe8heegJ7yF56AnvIXnYCC8hVe0QHgLz62Ae0sMvPUZ9CmwtjUt7OosqcteceS+WbLIvpnA2/H96WWywKxfAnbUGObnjdWObeY+2w+ts21OMRlTioizthQfQ2j/KlkbogXciywyPxmInHFI4laKlsRnzOzzEvQQCxqpsPOZieAU1CKyJ60x0EbqUOwuozO8u696WM1AtvvC2u7gc56oJ1dSsZ4dUNRdo8PRJen8CVBkDYo6Bz4X6xUfKb5/nnVYKEFJfsrCAJ3iWcMnz0S7BY+T/DMQqPAYvJDnv3HT2lq6zmW9EfRabQpE54noHD5PJkBsnmSrcxIsVDuGSzZAnlgwT/IwDGZogmEtnSZTzcZVGVGGdquKIcP6QR/3nCV1eFMcB9W4ftBrIeOi9rda1By9UTFlGx78UX4KitSpQA7zP3kkYB17qJX1IddlNgYmOHyWTICEdpgO8nSW6MPwSA7xs6I0dE/6jSUJV1AMT59oAp9NEyA+myZAdCnRS5JP5KqyG/2BQd/TaTFhX2GLkmD2Ce1R3UBCATF4dAJk0fFx7rwJJ6FTO209r3B/UetUbIySfHCmpCxWjjhoHA1sihW9uI8kF+CathM06qjR5sPqcbH8dgO6eMq0yLp4CpRIvV5xQCgHNtWKXqADLfy7NE9fJgW6IE0YiMslhobq8YHLJU4GTYAcKTotGfBn9Gwz9RIRA6syvTRP92fk02HCQLT2pCHjr2qPuj8S6YTQR+QI1p52/T5poLrSinxG6BYmVlEul5u3uvof3BHLg+5ZrlaCOpetFaKPo8kz26tZSCsDOeUQA005RlKIn63yZMJT7v1FX0qstP7yKXqHZDZcp/xWyBfsxEPhKuQrdpdY/W0VttpgVMtTVY4jX47DrPPk63EYNZAvyGHUSL4ih1ET+YoaRs3kO2oYtZDSOowqpLYOouKyBSG8hcsWhPAWLlsQwluEbMEQ7ir0Yscwbovsi3AYNtEVRR8GC3oSGvNQrMPEqrEUclNdElD0C71nfYnVJ+FiyKOyNqgAc8UyM6vTiVkLh2bm4tiDriuzJ7qDVTFYE5GphQR0CVBOXRGhWSYqPbDesWRwWWVDYsmZPc++6madyyrPrcmQ91jt+RU3qK/xsupzEMvqz0Esq0AHsawGHcTSKnSQS+vQQS6tRAe5mRWCg9zCSsFBrrBicIxrDSsHB7n0O7og17FSbpDrWTE3yA2snBvkRlbQDXITK6oGuZmVVYPcwgqrQa6w0mqMi0sjBnE1yLWsvBrkOlZgDXI9K7EGuYEVWYPcyMqsQW5ihdYgN7NSa4X7aVbtll9WDy/r/nfIzvqC7nNbO9q2BplZa0a3dtwW0mwf+h8/u9CHvtll/XRYK77lpjzLZdYuDdrUArmz6uui3t8tm83DoW3HO1ro82K7uut/dK3Ztvf1f+/rp04jsa+X/+66V55Na4liW/f4fbP8tyNvjh0zPLy9evglts/bpvu5t3j8+uFqPF3tyuv94nDn6P/nq+NvdXqQ/mtextfldL076jt+0ZvRHV3E9Tw/vny+e8zrlg4Db3x7yqMPuYw+SBgbP2qTG9t/KAhDu0c3hTdN928+dTl4ZrW9ffhhvNvR7+jNqtfVdnc86yltrPqYUgoxdqf8/wODueNj",
      position = {-6, 4}
    }

    for k, v in pairs (game.surfaces[1].find_entities_filtered{name = "locomotive"}) do
      v.train.manual_mode = false
    end

    script.on_nth_tick(1000, function()
      for k, v in pairs (game.surfaces[1].find_entities_filtered{name = "locomotive"}) do
        v.insert("coal")
      end
    end)
    ]]
  }

simulations.copy_entity_settings =
{
  init =
  [[
    require("__core__/lualib/story")
    player = game.simulation.create_test_player{name = "big k"}
    player.teleport({0, 3.5})
    game.simulation.camera_player = player
    game.simulation.camera_position = {0, 0.5}
    game.simulation.camera_alt_info = true
    game.simulation.camera_player_cursor_position = player.position

    game.surfaces[1].create_entities_from_blueprint_string
    {
      string = "0eNqVlOFugyAQx9/lPkNTVKzzVZqmQXe1JIgG7DrX+O47aWa6zLgAyXEQ+P0vueMeUJkb9k7bAcoH6LqzHsrjA7xurDLz2TD2CCXoAVtgYFU775T32FZG24a3qr5qizyBiYG27/gJpZhODNAOetD45IXNeLa3tkJHFxaSb5UxHA3Wg9M17zuDJNN3nt52dg6AeDxNdpLBCGWxk9PE/vCSSF5y2Oalsbz9Ni+L5Il0mycjefk2Lo8Nbxt3WHALCC26ZuRUZ+guql7PcWCKPdVRdbtc0J29/sL5ZBkrYsV2Ua7k6id6QUkjLYe1fpa46yxvUDl+vyIaWBF7ixUTxavYClHso5HyP6SIRia/kPR579qFn3sUTLKEyRM7kmVp8MiyLHhk50nevObk0dvQKsqXzsLgA50PekkhsiKVeZ5nUhbpNH0DtYlyfg==",
      position = {0, 0}
    }

    local story_table =
    {
      {
        {
          name = "start",
          condition = story_elapsed_check(1)
        },
        {
          condition = function() return game.simulation.move_cursor({position = {-4.5, 0.5}}) end,
          action = function()
            copy_source = player.selected
            game.simulation.control_down{control = "copy-entity-settings", notify = true}
          end
        },
        {
          init = function() game.simulation.control_up{control = "copy-entity-settings"} end,
          condition = story_elapsed_check(0.5)
        },
        { condition = function() return game.simulation.move_cursor({position = {-1.5, 0.5}}) end },
        {
          init = function() game.simulation.control_down{control = "paste-entity-settings", notify = true} end,
          condition = function() return game.simulation.move_cursor({position = {4.5, 0.5}}) end,
          action = function() game.simulation.control_up{control = "paste-entity-settings"} end
        },
        { condition = story_elapsed_check(0.5) },
        { condition = function() return game.simulation.move_cursor({position = player.position}) end },
        {
          condition = story_elapsed_check(1),
          action = function()
            for k, v in pairs (game.surfaces[1].find_entities_filtered{name = "assembling-machine-2"}) do
              if v ~= copy_source then
                v.set_recipe(nil)
              end
            end
            copy_source = nil
            story_jump_to(storage.story, "start")
          end
        }
      }
    }
    tip_story_init(story_table)
  ]]
}

simulations.copy_paste_trains =
{
  init =
  [[
    require("__core__/lualib/story")
    player = game.simulation.create_test_player{name = "big k"}
    player.teleport({1, 2.5})
    game.simulation.camera_player = player
    game.simulation.camera_position = {1, 0.5}
    game.simulation.camera_alt_info = true
    game.simulation.camera_player_cursor_position = player.position

    game.surfaces[1].create_entities_from_blueprint_string
    {
      string = "0eNrFld9u2yAUxt/lXJOJ/wY/QF+imiLHZS4ahtTQbFHkdy8kbTZptAq52Y0tOJzf+fyBDyfYuVezX6xP0J/AjsFH6B9PEO3kB1fm0nFvoAebzAwI/DCX0TJYBysC65/Mb+jJ+h2B8ckmay7558Fx61/nnVnygmtmTDl3ek6bMwLBPsScFXwplUkbzhAccwIV64r+4dCbOUx8xWHteroah7frqXJEux5d48h2PVVO16yHkRpHNeupc/SV48IY5pDswXwlhq7lPA47Z7YuTDYmO8btr2ebx3M4WD9B/2Nw0SAIi821hgsFf8sqxuDCUoj5gRFMZVpjoRRlQglBMBVMY0nz0l2JqU5xRlinOy1wx7mk6j08lDDXCjNNicgvwiWTlGEuVVc9lwS3G8+qIHKbY1fb73esVr39P/3kM/78qIXjNzGFfc2MD0pWA092MeMlms9f/JAKD4P7WTz4rxvM2ze4DhK3OcO6G5w5viSCMYFanfaW8ongO3pKtVeSO5pKHaTbFVW7JcXtijIo35nnW7X/6xJGcDBLPCdQRbhiQkrJBdd0Xd8AXHltUg==",
      position = {0, -1}
    }
    locomotive1 = game.surfaces[1].find_entities_filtered{name = "locomotive"}[1]
    locomotive2 = game.surfaces[1].find_entities_filtered{name = "locomotive"}[2]
    trainstop = game.surfaces[1].find_entities_filtered{name = "train-stop"}[2]

    local story_table =
    {
      {
        {
          name = "start",
          condition = story_elapsed_check(1)
        },
        {
          condition = function() return game.simulation.move_cursor({position = locomotive1.position}) end,
          action = function() game.simulation.control_down{control = "copy-entity-settings", notify = true} end
        },
        {
          init = function() game.simulation.control_up{control = "copy-entity-settings"} end,
          condition = story_elapsed_check(0.5)
        },
        { condition = function() return game.simulation.move_cursor({position = locomotive2.position}) end },
        {
          condition = story_elapsed_check(0.5),
          action = function() game.simulation.control_down{control = "paste-entity-settings", notify = true} end
        },
        {
          init = function() game.simulation.control_up{control = "paste-entity-settings"} end,
          condition = story_elapsed_check(0.5)
        },
        { condition = function() return game.simulation.move_cursor({position = trainstop.position}) end },
        {
          condition = story_elapsed_check(0.5),
          action = function() game.simulation.control_down{control = "paste-entity-settings", notify = true} end
        },
        {
          init = function() game.simulation.control_up{control = "paste-entity-settings"} end,
          condition = story_elapsed_check(0.5)
        },
        { condition = function() return game.simulation.move_cursor({position = player.position}) end },
        {
          condition = story_elapsed_check(3),
          action = function()
            locomotive2.color = nil
            trainstop.color = nil
            story_jump_to(storage.story, "start")
          end
        }
      }
    }
    tip_story_init(story_table)
  ]]
}

simulations.copy_paste_filters =
{
  init_update_count = 750,
  init =
  [[
    require("__core__/lualib/story")
    player = game.simulation.create_test_player{name = "big k"}
    player.teleport({0, 1.5})
    game.simulation.camera_player = player
    game.simulation.camera_position = {0, 0.5}
    game.simulation.camera_alt_info = true
    game.simulation.camera_player_cursor_position = player.position

    game.surfaces[1].create_entities_from_blueprint_string
    {
      string = "0eNrVWdtuozAQ/Rc/Q+UxNpf8yiqKKHFTS8RExnQ3ivLva8ImqVpQx5PtQx8B+8yZ4ZzBmZzYczvogzPWs9WJmaazPVv9OrHe7Gzdjvf88aDZihmv9yxhtt6PV97Vtj90zqfPuvXsnDBjt/oPW8E5+XJz29Vb7d5tEud1wrT1xhs9hb9cHDd22D+HlSu47TX2xdjwKG1ede8D5qHrw7bOjtECVCrkk0rYMYA+qUuEaf2m194bu+vHdU7vuze9GcKz1munt5uRYHj0Ure9Tth0e2Jyjes6m+507dLfr1q3IXDTDWPRgPOE7bvtuKj2aavrC61bOdbnsSIf8hEfazGTR/Yui61xupmeyuRa1G7wh2Gs/Sf4bOk9zYSBf+XKPgYqZ4AlAVhggBWiIHweDgSiIjleQFB+i4B0GwgHEZkmbYxrBuPvGhIUDRURKeU/wBPl1xIARfdEhZcuZDGeAE5ARpkCItoe8J+hWkC0vnEN2elAaX4S9Too3U+hkBVBQjjOOQEZx7kgVCNHIZcE5AKFTGkCKM6C0gRQnAVEVOOKXKGQRQSyWEIGMQdNMSES+u7C/tAa7+cPC3CBLD/V4drlxoXLPS5smjrMJhyNOxfij/1Kv8x2HBHhXsGXkpVzyDHuraKQI9x7OxDhVBXhXlBRyDHulVGiyjhGVJAtiGoOEQgNAUk2wrcgYlSRRdgWeMy7yyK+nQBRnBWhP44hEKRzCjRHQVP8h4QuKdC4glQEb+OgJadAowoigaBqJGtBgcaxvntxCCdqt3Ph1L39Wn7ZzCfvOoWxC2dmKSlCR/2GkSomjbseSWnkFOXj0iii0lAPpUH5giLTqKLS4I+koTjFG7hpEdC8USynsfyDUgmagmnBMprOaMEkTQ20YJgR3+1NVfFyyxGDhfIB/AIzn3oAHzP/4g/gVxEz9NuYihOmSd4Nem70k3PKEPa/MogZqKlvYSAoIz06g3Uy/feyevc/T8LetOsvgUQJssxUnudSqaI6n/8CLgGRnw==",
      position = {-1, 1}
    }
    splitter1 = game.surfaces[1].find_entities_filtered{name = "splitter"}[1]
    splitter2 = game.surfaces[1].find_entities_filtered{name = "splitter"}[2]

    local story_table =
    {
      {
        {
          name = "start",
          condition = story_elapsed_check(14)
        },
        {
          name = "continue",
          condition = function() return game.simulation.move_cursor({position = splitter1.position}) end,
          action = function() game.simulation.control_down{control = "copy-entity-settings", notify = true} end
        },
        {
          init = function() game.simulation.control_up{control = "copy-entity-settings"} end,
          condition = story_elapsed_check(0.5)
        },
        { condition = function() return game.simulation.move_cursor({position = splitter2.position}) end },
        {
          condition = story_elapsed_check(0.5),
          action = function() game.simulation.control_down{control = "paste-entity-settings", notify = true} end
        },
        {
          init = function() game.simulation.control_up{control = "paste-entity-settings"} end,
          condition = story_elapsed_check(0.5)
        },
        { condition = function() return game.simulation.move_cursor({position = player.position}) end },
        {
          condition = story_elapsed_check(2),
          action = function()
            splitter2.splitter_filter = nil
            splitter2.splitter_output_priority = "none"
          end
        },
        {
          condition = story_elapsed_check(2),
          action = function() story_jump_to(storage.story, "continue") end
        }
      }
    }
    tip_story_init(story_table)
  ]]
}

simulations.copy_paste_requester_chest =
{
  init =
  [[
    require("__core__/lualib/story")
    player = game.simulation.create_test_player{name = "big k"}
    player.teleport({0, 3.5})
    game.simulation.camera_player = player
    game.simulation.camera_position = {0, 0.5}
    game.simulation.camera_alt_info = true
    game.simulation.camera_player_cursor_position = player.position
    game.forces.player.worker_robots_speed_modifier = 1
    game.forces.player.worker_robots_storage_bonus = 8
    game.forces.player.recipes["energy-shield-equipment"].enabled = true

    game.surfaces[1].create_entities_from_blueprint_string
    {
      string = "0eNqVlH1vgyAQxr/L/Q1NwZdav0rTNGqvlkTAgW5zjd994KZbNuaiJggk/O557jgfUDY9tkaoDvIHiEorC/npAVbUqmj8Xje0CDmIDiUQUIX0K6NL3WrTwUhAqCu+Qs5G8u+xwlqUZSNUTWVR3YVCyr8h+HgmgKoTncAPGdNiuKhelmhcjIUk8Sp6SbHBqjOioq1u0MVptXWHtfIKHJBG0S4hMECe7ZLRC/wB5FuBPF0HRluB7LAOjNeTFwDOlo8OSMBgJaZKoEJTD9TeBTZXik+9aKWLBYGYyVYT2bqHdHNS1nmH3/cwUCk+Idg+RMgWgu20KWqk1R1tCMNmb4yFxRwX1OLqM9WuqdDciirkMJ7FESj72w3NxYo39DvLE4jF9l/OXQWdYjR/K58vAuNeuWutF2GmvjoxkhBOkjM5uZFE08yN/nUz/03dzJ2Y2jf/9pMg8IzGTlF4xuIsStI0jZPkcBzHd7ecZO4=",
      position = {0, 0}
    }

    roboport = game.surfaces[1].find_entities_filtered{name = "roboport"}[1]
    roboport.insert({name = "logistic-robot", count = 5})
    assembler = game.surfaces[1].find_entities_filtered{name = "assembling-machine-2"}[1]
    storage_chest = game.surfaces[1].find_entities_filtered{name = "storage-chest"}[1]
    requester_chest = game.surfaces[1].find_entities_filtered{name = "requester-chest"}[1]

    local story_table =
    {
      {
        {
          name = "start",
          init = function()
            storage_chest.clear_items_inside()
            storage_chest.insert("steel-plate")
            storage_chest.insert("advanced-circuit")
          end,
          condition = story_elapsed_check(1)
        },
        {
          condition = function() return game.simulation.move_cursor({position = assembler.position}) end,
          action = function() game.simulation.control_down{control = "copy-entity-settings", notify = true} end
        },
        {
          init = function() game.simulation.control_up{control = "copy-entity-settings"} end,
          condition = story_elapsed_check(0.5)
        },
        { condition = function() return game.simulation.move_cursor({position = requester_chest.position}) end },
        {
          condition = story_elapsed_check(0.5),
          action = function() game.simulation.control_down{control = "paste-entity-settings", notify = true} end
        },
        {
          init = function() game.simulation.control_up{control = "paste-entity-settings"} end,
          condition = story_elapsed_check(0.5)
        },
        { condition = function() return game.simulation.move_cursor({position = player.position}) end },
        {
          condition = story_elapsed_check(5),
          action = function()
            requester_chest.clear_items_inside()
            requester_chest.get_logistic_point(defines.logistic_member_index.logistic_container).get_section(1).clear_slot(1)
            requester_chest.get_logistic_point(defines.logistic_member_index.logistic_container).get_section(1).clear_slot(2)
            story_jump_to(storage.story, "start")
          end
        }
      }
    }
    tip_story_init(story_table)
  ]]
}

simulations.copy_paste_spidertron =
{
  init =
  [[
    require("__core__/lualib/story")
    player = game.simulation.create_test_player{name = "big k"}
    player.teleport({0, 2.5})
    game.simulation.camera_player = player
    game.simulation.camera_position = {0, 0.5}
    game.simulation.camera_alt_info = true
    game.simulation.camera_player_cursor_position = player.position

    source_spider = game.surfaces[1].create_entity{name = "spidertron", position = {-4, 1.5}, force = "player"}
    source_spider.color = {1, 0, 0, 0.5}
    paste_spider = game.surfaces[1].create_entity{name = "spidertron", position = {4, 1.5}, force = "player"}

    local story_table =
    {
      {
        {
          name = "start",
          condition = story_elapsed_check(1)
        },
        {
          condition = function() return game.simulation.move_cursor({position = {source_spider.position.x, source_spider.position.y - 1.5}}) end,
          action = function() game.simulation.control_down{control = "copy-entity-settings", notify = true} end
        },
        {
          init = function() game.simulation.control_up{control = "copy-entity-settings"} end,
          condition = story_elapsed_check(0.5)
        },
        { condition = function() return game.simulation.move_cursor({position = {paste_spider.position.x, paste_spider.position.y - 1.5}}) end },
        {
          condition = story_elapsed_check(0.5),
          action = function() game.simulation.control_down{control = "paste-entity-settings", notify = true} end
        },
        {
          init = function() game.simulation.control_up{control = "paste-entity-settings"} end,
          condition = story_elapsed_check(0.5)
        },
        { condition = function() return game.simulation.move_cursor({position = player.position}) end },
        {
          condition = story_elapsed_check(2),
          action = function()
            paste_spider.color = {1, 0.5, 0, 0.5}
            story_jump_to(storage.story, "start")
          end
        }
      }
    }
    tip_story_init(story_table)
  ]]
}

simulations.ghost_building =
{
  init =
  [[
    require("__core__/lualib/story")
    player = game.simulation.create_test_player{name = "big k"}
    player.teleport({0, 2})
    game.simulation.camera_player = player
    game.simulation.camera_position = {0, 0.5}
    game.simulation.camera_alt_info = true
    game.simulation.camera_player_cursor_position = player.position

    local story_table =
    {
      {
        {
          name = "start",
          condition = story_elapsed_check(1)
        },
        {
          init = function() player.cursor_stack.set_stack{name = "stone-furnace"} end,
          condition = function() return game.simulation.move_cursor({position = {-5, -1}}) end,
          action = function() player.character.cursor_ghost = {name = "stone-furnace"} end
        },
        {
          init = function() game.simulation.control_down{control = "build-ghost", notify = true} end,
          condition = story_elapsed_check(0.5)
        },
        { condition = function() return game.simulation.move_cursor({position = {5, -1}, speed = 0.1}) end },
        {
          condition = story_elapsed_check(0.5),
          action = function() game.simulation.control_up{control = "build-ghost"} end
        },
        {
          condition = story_elapsed_check(0.5),
          action = function()
            player.clear_cursor()
            player.cursor_stack.clear()
          end
        },
        { condition = function() return game.simulation.move_cursor({position = player.position}) end },
        {
          condition = story_elapsed_check(2),
          action = function()
            for k, v in pairs (game.surfaces[1].find_entities_filtered{type = "entity-ghost"}) do
              v.destroy()
            end
            story_jump_to(storage.story, "start")
          end
        }
      }
    }
    tip_story_init(story_table)
  ]]
}

simulations.ghost_rail_building =
{
  init =
  [[
    require("__core__/lualib/story")

    player = game.simulation.create_test_player{name = "kovarex"}
    player.teleport{-10, 3.5}
    game.simulation.camera_player = player
    game.simulation.camera_position = {0, 0}
    game.simulation.camera_zoom = 1
	  game.surfaces[1].build_checkerboard{{-26, -13}, {26, 13}}
    game.surfaces[1].create_entities_from_blueprint_string
    {
      string = "0eNqVmt1O20AUhN9lrx3ksz+2N69SoSqARS0FByWmLUJ59wYiIaQyPjNXKEA+TpZv7dlM3sLd/mV8Pk7zErZvYbo/zKew/fEWTtPjvNu/f295fR7DNkzL+BSaMO+e3h+dlsM8bv7s9vtwbsI0P4x/w9bOt00Y52VapvFK+Xjw+nN+ebobj5df+O75TXg+nC5POczvf+2C2cTupjTh9fL7N+V8bv7DRBLTr2MSiSnrmExi8jqmkJi0julITFzH9CTG1jEDiWnXMZXDWF3HWEtyBodDemyOgEaKbM5+MNJkcxQ0UmVzdoSRLpsjoZEym7MnjLTZHA2N1NmcXWGkz46GkdTZ2RWRtNm7KJMyO3siki47KkdSZcfkSJrsCBjZq7KDYT12MKTGzm6InMUOJXESOy8pcQ4765s4hZ1/duIMdgROnMCOv4nz19naidPXi1ucvc5FL3HyOte8xLnr3RAyKa9jb+bs9W6XmdPXu1tmzl8vTGROYC9LZM5gLyJlTmEvseVeu1dGgBk0TAKYqt3kAKa0Gga8qGLaEiNM1DDoRSVtiTPAZA1TAKZoS4ym6TQMmqbXlhhNM2gYNE3VlrgDB99Ww/QAY9oSo2mihkHTJG2J0TRZw6BpirbEA8B0GqYCTK8tMZpm0DBomqotMZimbzUMmKZXz3Qt4ESRg95OSuJxDM2jHuvQPEWMA2geNVageb66fNxNj7+WzeXLt2fEeiWlcxMepuN4f/1h/o468NSep1aeWmjq0PLUxFONpxpPVXcFiDqDmFEMZJ1B3RVoHjGlwHnUXYHmEXMKnEeM2wYCzyAmFQOJp4qBG81TxawC5xEjN5xHTCtwHjF0G4g9VcwrBnJPFWM3nEdMLHAeMXjDecTMguaxVkwtNiCQeIa0ikCi0rFFINHpCLsnMYPHiEBidokJgcTLdMwIJF6nY0EgUezYIZBodkRmm2h2RGab+u4IMpstDT9L9ITUZmvDzx4dk9QOHJOKWMpjktqEY1IvVvOYpPbhmFTFgh6SolqKY5KJNT0mqcU4JiWxqsekLJbsmFTEmh2TOrFox6RerNoxaRDLdkyqYt0OSWTJuHEVJ3vGjWt4Eo+QGJS02h2Dsla8Y5B4isQgsTXHoF5r8TFIbM4xqGpNPgRlrT7HHJPKfMzRKnTMSVKhjzlajY45RSr1MUer0jGnl4p9zNHqdMypUrkPOUVs1DHItIYfg8RWHYOS1vJjkNisY1DRmn4MEk+SGNRrbf8VdNtcP528/fJh5ib8Ho+nj6fE4aJ5Kl3X5VL6ej7/A7VeULA=",
      position = {0, 0}
    }
    start_rail = game.surfaces[1].find_entities_filtered{name = "straight-rail"}[5]

    local story_table =
    {
      {
        {
          name = "start",
          init = function()
            player.cursor_stack.set_stack{name = "rail", count = 50}
            game.forces.player.chart(game.surfaces[1], {{-16, -9}, {16, 9}})
          end,
          condition = function()
            return game.simulation.move_cursor({position = {start_rail.position.x + 0.5, start_rail.position.y}})
          end
        },
        {
          condition = story_elapsed_check(0.25),
          action = function() game.simulation.activate_rail_planner({ghost_mode = true, build_mode = defines.build_mode.forced}) end
        },
        {
          condition = function()
            return game.simulation.move_cursor({position = {start_rail.position.x + 31, start_rail.position.y}})
          end
        },
        {
          condition = function()
            return game.simulation.move_cursor({position = {start_rail.position.x + 31, start_rail.position.y + 8}, speed = 0.1})
          end,
          action = function() player.raw_build_from_cursor{ghost_mode = true} end
        },
        {
          condition = story_elapsed_check(0.25),
          action = function()
            game.simulation.deactivate_rail_planner()
            player.clear_cursor()
          end
        },
        {
          condition = function() return game.simulation.move_cursor({position = player.position}) end
        },
        {
          condition = story_elapsed_check(0.25),
          action = function()
            for k, ghost in pairs(game.surfaces[1].find_entities_filtered{name = "entity-ghost"}) do
              ghost.destroy()
            end
            story_jump_to(storage.story, "start")
          end
        }
      }
    }
    tip_story_init(story_table)
  ]]
}

simulations.copy_paste =
{
  init =
  [[
    require("__core__/lualib/story")
    player = game.simulation.create_test_player{name = "kovarex"}
    player.teleport{-1.5, 5.5}
    game.simulation.camera_player = player
    game.simulation.camera_position = {0, 0.5}
    game.simulation.camera_player_cursor_position = player.position
    game.surfaces[1].create_entities_from_blueprint_string
    {
      string = "0eNqdk90KgzAMhd8l11Xwt9pXGWP4E0ZBo7R1TKTvvqo3gznQ3iUl/c7hkCxQdxOOSpIBsYBsBtIgbgto+aSqW9/MPCIIkAZ7YEBVv3ZGVaTHQZmgxs6AZSCpxTeIyN4ZIBlpJO6krZkfNPU1Kjfwj8FgHLT7NtCq6lBBWoQZg9lVZRlmTqOVCpt9IrbsBx17oV1lD2DJBVh+zWd6Ac2voTOvCPIz6NwLzY/T5V4RnPJZePnMVp9udbc1F19XweCFSu9qRZTyMuZRznlZJNZ+ADm2DbE=",
      position = {-4, 0}
    }

    local story_table =
    {
      {
        {
          name = "start",
          init = function() game.simulation.camera_player_cursor_direction = defines.direction.north end,
          condition = story_elapsed_check(0.25)
        },
        {
          condition = function() return game.simulation.move_cursor({position = {player.position.x, player.position.y - 2}}) end,
          action = function() game.simulation.control_press{control = "copy", notify = player.input_method ~= defines.input_method.game_controller} end
        },
        {
          condition = function() return game.simulation.move_cursor({position = {-4.75, -1.75}}) end,
          action = function()
            if player.input_method ~= defines.input_method.game_controller then
              game.simulation.control_down{control = "select-for-blueprint", notify = false}
            else
              game.simulation.control_press{control = "select-for-blueprint", notify = false}
            end
          end
        },
        {
          condition = function() return game.simulation.move_cursor({position = {-2.25, 0.75}}) end,
          action = function()
            if player.input_method ~= defines.input_method.game_controller then
              game.simulation.control_up{control = "select-for-blueprint", notify = false}
            else
              game.simulation.control_press{control = "select-for-blueprint", notify = false}
            end
          end
        },
        {
          condition = function() return game.simulation.move_cursor({position = {0.5, -0.5}}) end,
          action = function() player.raw_build_from_cursor() end
        },
        {
          condition = story_elapsed_check(0.25),
          action = function() player.clear_cursor() end
        },
        {
          condition = story_elapsed_check(0.25),
          action = function() game.simulation.control_press{control = "copy", notify = player.input_method ~= defines.input_method.game_controller} end
        },
        {
          condition = function() return game.simulation.move_cursor({position = {-4.75, 1.25}}) end,
          action = function()
            if player.input_method ~= defines.input_method.game_controller then
              game.simulation.control_down{control = "select-for-blueprint", notify = false}
            else
              game.simulation.control_press{control = "select-for-blueprint", notify = false}
            end
          end
        },
        {
          condition = function() return game.simulation.move_cursor({position = {-3.25, 2.75}}) end,
          action = function()
            if player.input_method ~= defines.input_method.game_controller then
              game.simulation.control_up{control = "select-for-blueprint", notify = false}
            else
              game.simulation.control_press{control = "select-for-blueprint", notify = false}
            end
          end
        },
        {
          condition = function() return game.simulation.move_cursor({position = {1, 0}}) end,
          action = function() player.raw_build_from_cursor() end
        },
        { condition = story_elapsed_check(0.25) },
        { condition = function() return game.simulation.move_cursor({position = {4.5, -0.5}}) end },
        {
          condition = story_elapsed_check(0.25),
          action = function() game.simulation.control_press{control = "cycle-clipboard-backwards", notify = true} end
        },
        {
          condition = story_elapsed_check(0.5),
          action = function() game.simulation.control_press{control = "flip-horizontal", notify = false} end
        },
        {
          condition = story_elapsed_check(0.5),
          action = function() player.build_from_cursor({position = {4.5, -0.5}, direction = defines.direction.east}) end
        },
        { condition = function() return game.simulation.move_cursor({position = {4, 0}}) end },
        {
          condition = story_elapsed_check(0.25),
          action = function() game.simulation.control_press{control = "cycle-clipboard-forwards", notify = true} end
        },
        {
          condition = story_elapsed_check(0.5),
          action = function() game.simulation.control_press{control = "flip-horizontal", notify = false} end
        },
        {
          condition = story_elapsed_check(1),
          action = function() player.build_from_cursor({position = {4, 0}, direction = defines.direction.east}) end
        },
        {
          condition = story_elapsed_check(0.5),
          action = function() player.clear_cursor() end
        },
        { condition = function() return game.simulation.move_cursor({position = player.position}) end },
        {
          condition = story_elapsed_check(2),
          action = function()
            for k, v in pairs (game.surfaces[1].find_entities_filtered{area = {{-1, -2}, {6,  10}}}) do
              v.destroy()
            end
          end
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

simulations.entity_flip =
{
  init =
  [[
    require("__core__/lualib/story")
    player = game.simulation.create_test_player{name = "kovarex"}
    player.teleport{0, 3.5}
    game.simulation.camera_player = player
    game.simulation.camera_position = {0, 0.5}
    game.simulation.camera_alt_info = true
    game.forces.player.technologies["oil-processing"].researched = true

    game.surfaces[1].create_entities_from_blueprint_string
    {
      string = "0eNqVkdFuhCAQRf9lnnGzrGKNv7LZGKSjmUTBAm5rjf/ekaamSX0pLzADnDtzZ4V2mHHyZCPUK5BxNkB9XyFQb/Ww5+IyIdRAEUcQYPW4R46GzGNHFv0CmwCyr/gBtdweAtBGioTfnBQsjZ3HFj0/OAhhbkPUkZxl6uQCpSPrMSaTLwIW3ottE38Yt4OBA5royWTIdfRLxl2g77TBE+TtmpA5F9vOXYe+CfTJEHk91olWft7xCV5eVBKoLoolPBpKtrU6cH3758k7gyGQ7eHnvnmb9cBy/M46P7LfJyUU/7Ks2vYRvJNP/t+lUKIQ6sG5NMD617wFPNGHhLhVsqhyVZZloVTFrn8BKpywJg==",
      position = {-3, -7}
    }
    refinery1 = game.surfaces[1].find_entities_filtered{name = "oil-refinery"}[1]
    refinery2 = nil

    local story_table =
    {
      {
        {
          name = "start",
          condition = story_elapsed_check(0.5)
        },
        {
          condition = function() return game.simulation.move_cursor({position = refinery1.position}) end,
          action = function() player.update_selected_entity(game.simulation.camera_player_cursor_position) end
        },
        {
          condition = story_elapsed_check(0.5),
          action = function() game.simulation.control_press{control = "flip-horizontal", notify = true} end
        },
        {
          condition = story_elapsed_check(0.5),
          action = function() game.simulation.control_press{control = "flip-horizontal", notify = true} end
        },
        {
          condition = story_elapsed_check(1),
          action = function() player.cursor_stack.set_stack{name = "oil-refinery", count = 1} end
        },
        {
          condition = function() return game.simulation.move_cursor({position = {refinery1.position.x + 9, refinery1.position.y}}) end,
          action = function() player.update_selected_entity(game.simulation.camera_player_cursor_position) end
        },
        {
          condition = story_elapsed_check(0.5),
          action = function() game.simulation.control_press{control = "flip-vertical", notify = true} end
        },
        {
          condition = story_elapsed_check(0.5),
          action = function() game.simulation.control_press{control = "flip-vertical", notify = true} end
        },
        {
          condition = story_elapsed_check(0.5),
          action = function()
            player.build_from_cursor{position = game.simulation.camera_player_cursor_position}
            player.clear_cursor()
          end
        },
        {
          condition = story_elapsed_check(1.0),
          action = function()
            refinery2 = game.surfaces[1].find_entities_filtered{name = "oil-refinery"}[2]
            refinery2.set_recipe("basic-oil-processing")
            player.update_selected_entity(game.simulation.camera_player_cursor_position)
          end
        },
        {
          condition = story_elapsed_check(0.75),
          action = function() game.simulation.control_press{control = "flip-vertical", notify = true} end
        },
        { condition = story_elapsed_check(0.5) },
        { condition = function() return game.simulation.move_cursor({position = player.position}) end },
        {
          condition = story_elapsed_check(2),
          action = function()
            refinery2.destroy()
            story_jump_to(storage.story, "start")
          end
        }
      }
    }
    tip_story_init(story_table)
  ]]
}

simulations.fast_replace =
{
  init =
  [[
    local surface = game.surfaces[1]
    game.forces.player.recipes["copper-cable"].enabled = true
    surface.create_entities_from_blueprint_string
    {
      string = "0eNqVlPFugyAQxt/l/oamqFjrqzRNg+y0JIoG7Lq28d132swtqZ0Bk/Mgfr/vDAcPKOoLds7YHvIHGN1aD/nhAd5UVtXjmlUNQg7Ke2yK2tiKN0qfjUUuYGBg7Ad+QS6GIwO0vekNPgnT5Hayl6ZARx+wH5JvVF1zrFH3zmjetTUCg671pG3taEm8KNpIBjfIudzIYWAvvCiQt1vhxWG8OFnhJWG8RKzwZCAvW+GlYTwZr/B2M28moUVX3Tj1FrpS6aVdiZ/MhBqpuJQlupM3d4KI7TwWvDL2b1e+btZcfLxc/D4UmP4FMnCoTTfKS+NQuYa0lbqTGBbMxDbUbf/GzbjW8ooM+fWMWC+aiUCzJHpjptuuQ8e1Kqg/xtN+pX8dj/pBMMkiJo/sQJHFU0aRJVNGcXwoG98pZaQ1PTbE/L18GHyi81MZUSaSLJZpuhPbXbYfhm+/XX96",
      position = {0, 0}
    }

    game.simulation.camera_position = {0, 0.5}
    player = game.simulation.create_test_player{name = "big k"}
    player.teleport({0, 3.5})
    game.simulation.camera_player = player
    game.simulation.camera_player_cursor_position = player.position
    game.simulation.camera_alt_info = true
    item_name = "assembling-machine-1"

    step_1 = function()
      player.cursor_stack.set_stack{name = item_name, count = 50}
      script.on_nth_tick(1, function()
        if game.simulation.move_cursor{position = {-4.5, 0.5}} then
          step_2()
        end
      end)
    end

    step_2 = function()
      local count = 30
      script.on_nth_tick(1, function()
        if count > 0 then count = count - 1 return end
        local finished = game.simulation.move_cursor{position = {4.5, 0.5}}
        player.build_from_cursor{position = game.simulation.camera_player_cursor_position}
        if finished then
          step_3()
        end
      end)
    end

    step_3 = function()
      local count = 30
      script.on_nth_tick(1, function()
        if count > 0 then count = count - 1 return end
        player.clear_cursor()
        player.clear_items_inside()
        local finished = game.simulation.move_cursor{position = player.position}
        if finished then
          start()
        end
      end)
    end

    start = function()
      local count = 60
      script.on_nth_tick(1, function()
      if count > 0 then count = count - 1 return end
        if item_name == "assembling-machine-1" then
          item_name = "assembling-machine-2"
        elseif item_name == "assembling-machine-2" then
          item_name = "assembling-machine-3"
        else
          item_name = "assembling-machine-1"
        end
        step_1()
      end)
    end

    start()

  ]]
}

simulations.fast_replace_belt_splitter =
{
  init =
  [[

    game.surfaces[1].create_entities_from_blueprint_string
    {
      string = "0eNqV1e1qgzAUBuB7Ob9j8fiV6q2UUbQ9jIBGSdJtIt57Y2Vj0JWd889ofIwfr+8CXX+jyRkboFnAXEbroTkt4M27bfttX5gnggZMoAEU2HbYRsG11k+jC0lHfYBVgbFX+oIG1zcFZIMJhnbpMZjP9jZ05OKEH8OH0VLy2fZ9dKfRx1NGu10xMgnmh1LBHLfqQ7mu6snJWM6/TP7qlp6XVH1TaaQUXI2jy348+wMu+LAWwSUfLkRwxYdLEaz5cCaCj3w4F8E1H05FMKZ8GWUysmUhnLFh4bPgZ0/29pCfPdn3hvzsyRKC/OzJMo387Mn+QsjPnuy/ibWwIDB9URCprCF2J7bXo+maX8Wo4IOc31d8xELXmcZK61rH+XcbjFt7",
      position = {0, 0}
    }

    game.simulation.camera_position = {0, 0.5}
    player = game.simulation.create_test_player{name = "big k"}
    player.teleport({0, 2.5})
    game.simulation.camera_player = player
    game.simulation.camera_player_cursor_position = player.position
    game.simulation.camera_alt_info = true
    item_name = "transport-belt"
    direction = defines.direction.east

    step_1 = function()
      player.cursor_stack.set_stack{name = item_name, count = 50}
      game.simulation.camera_player_cursor_direction = direction
      script.on_nth_tick(1, function()
        if game.simulation.move_cursor{position = {1.5, -0.49}} then
          step_2()
        end
      end)
    end

    step_2 = function()
      local count = 30
      script.on_nth_tick(1, function()
        if count > 0 then count = count - 1 return end
        player.build_from_cursor{position = game.simulation.camera_player_cursor_position, direction = direction}
        step_3()
      end)
    end

    step_3 = function()
      local count = 30
      script.on_nth_tick(1, function()
        if count > 0 then count = count - 1 return end
        player.clear_cursor()
        player.clear_items_inside()
        local finished = game.simulation.move_cursor{position = player.position}
        if finished then
          start()
        end
      end)
    end

    start = function()
      local count = 60
      script.on_nth_tick(1, function()
        if count > 0 then count = count - 1 return end
        item_name = item_name == "transport-belt" and "splitter" or "transport-belt"
        step_1()
      end)
    end

    start()

  ]]
}

simulations.fast_replace_direction =
{
  init =
  [[

    game.surfaces[1].create_entities_from_blueprint_string
    {
      string = "0eNqV1e1qgzAUBuB7Ob9j8fiV6q2UUbQ9jIBGSdJtIt57Y2Vj0JWd889ofIwfr+8CXX+jyRkboFnAXEbroTkt4M27bfttX5gnggZMoAEU2HbYRsG11k+jC0lHfYBVgbFX+oIG1zcFZIMJhnbpMZjP9jZ05OKEH8OH0VLy2fZ9dKfRx1NGu10xMgnmh1LBHLfqQ7mu6snJWM6/TP7qlp6XVH1TaaQUXI2jy348+wMu+LAWwSUfLkRwxYdLEaz5cCaCj3w4F8E1H05FMKZ8GWUysmUhnLFh4bPgZ0/29pCfPdn3hvzsyRKC/OzJMo387Mn+QsjPnuy/ibWwIDB9URCprCF2J7bXo+maX8Wo4IOc31d8xELXmcZK61rH+XcbjFt7",
      position = {0, 0}
    }

    game.simulation.camera_position = {0, 0.5}
    player = game.simulation.create_test_player{name = "big k"}
    player.teleport({0, 2.5})
    game.simulation.camera_player = player
    game.simulation.camera_player_cursor_position = player.position
    game.simulation.camera_alt_info = true
    item_name = "transport-belt"
    direction = defines.direction.east
    start_position = {-7.75, -0.5}
    end_position = {7.75, -0.5}

    step_1 = function()
      player.cursor_stack.set_stack{name = item_name, count = 50}
      game.simulation.camera_player_cursor_direction = direction
      script.on_nth_tick(1, function()
        if game.simulation.move_cursor{position = start_position} then
          step_2()
        end
      end)
    end

    step_2 = function()
      local count = 30
      script.on_nth_tick(1, function()
        if count > 0 then count = count - 1 return end
        local finished = game.simulation.move_cursor{position = end_position}
        player.build_from_cursor{position = game.simulation.camera_player_cursor_position, direction = direction}
        if finished then
          step_3()
        end
      end)
    end

    step_3 = function()
      local count = 30
      script.on_nth_tick(1, function()
        if count > 0 then count = count - 1 return end
        player.clear_cursor()
        player.clear_items_inside()
        local finished = game.simulation.move_cursor{position = player.position}
        if finished then
          start()
        end
      end)
    end

    start = function()
      local count = 60
      script.on_nth_tick(1, function()
        if count > 0 then count = count - 1 return end
        start_position, end_position = end_position, start_position
        direction = direction == defines.direction.east and defines.direction.west or defines.direction.east
        step_1()
      end)
    end

    start()

  ]]
}

simulations.fast_replace_belt_underground =
{
  init =
  [[

    game.surfaces[1].create_entities_from_blueprint_string
    {
      string = "0eNqV1e1qgzAUBuB7Ob9j8fiV6q2UUbQ9jIBGSdJtIt57Y2Vj0JWd889ofIwfr+8CXX+jyRkboFnAXEbroTkt4M27bfttX5gnggZMoAEU2HbYRsG11k+jC0lHfYBVgbFX+oIG1zcFZIMJhnbpMZjP9jZ05OKEH8OH0VLy2fZ9dKfRx1NGu10xMgnmh1LBHLfqQ7mu6snJWM6/TP7qlp6XVH1TaaQUXI2jy348+wMu+LAWwSUfLkRwxYdLEaz5cCaCj3w4F8E1H05FMKZ8GWUysmUhnLFh4bPgZ0/29pCfPdn3hvzsyRKC/OzJMo387Mn+QsjPnuy/ibWwIDB9URCprCF2J7bXo+maX8Wo4IOc31d8xELXmcZK61rH+XcbjFt7",
      position = {0, 0}
    }

    game.simulation.camera_position = {0, 0.5}
    player = game.simulation.create_test_player{name = "big k"}
    player.teleport({0, 2.5})
    game.simulation.camera_player = player
    game.simulation.camera_player_cursor_position = player.position
    game.simulation.camera_alt_info = true
    item_name = "transport-belt"
    direction = defines.direction.east
    start_position = {-2.75, -0.5}
    end_position = {2.75, -0.5}

    step_1 = function()
      player.cursor_stack.set_stack{name = item_name, count = 50}
      game.simulation.camera_player_cursor_direction = direction
      script.on_nth_tick(1, function()
        if game.simulation.move_cursor{position = start_position} then
          step_2()
        end
      end)
    end

    step_2 = function()
      local count = 30
      bippity = nil
      boppity = nil
      script.on_nth_tick(1, function()
        if count > 0 then count = count - 1 return end
        local finished = game.simulation.move_cursor{position = end_position}
        if item_name == "underground-belt" then

          if not bippity then
            player.build_from_cursor{position = game.simulation.camera_player_cursor_position, direction = defines.direction.east}
            game.simulation.camera_player_cursor_direction  = defines.direction.west
            bippity = true
          end

          if not boppity then
            if game.simulation.camera_player_cursor_position.x > 2.51 then
              player.build_from_cursor{position = game.simulation.camera_player_cursor_position, direction = defines.direction.west}
              boppity = true
            end
          end

        else
          player.build_from_cursor{position = game.simulation.camera_player_cursor_position, direction = direction}
        end
        if finished then
          game.simulation.camera_player_cursor_direction  = defines.direction.east
          step_3()
        end
      end)
    end

    step_3 = function()
      local count = 30
      script.on_nth_tick(1, function()
        if count > 0 then count = count - 1 return end
        player.clear_cursor()
        player.clear_items_inside()
        local finished = game.simulation.move_cursor{position = player.position}
        if finished then
          start()
        end
      end)
    end

    start = function()
      local count = 60
      script.on_nth_tick(1, function()
        if count > 0 then count = count - 1 return end
        item_name = item_name == "transport-belt" and "underground-belt" or "transport-belt"
        step_1()
      end)
    end

    start()

  ]]
}

simulations.rotating_assemblers =
{
  init =
  [[
    require("__core__/lualib/story")
    player = game.simulation.create_test_player{name = "big k"}
    player.teleport({0, 2.5})
    game.simulation.camera_player = player
    game.simulation.camera_position = {0, 0.5}
    game.simulation.camera_alt_info = true
    game.simulation.camera_player_cursor_position = player.position
    game.forces.player.technologies["electric-engine"].researched = true

    game.surfaces[1].create_entities_from_blueprint_string
    {
      string = "0eNqtkt1ugzAMhd/F16EqP2Etr1JVKDDDLIFhSdjGEO8+wzY0rWhSpeXOjvOdcyJPUDQD9pbYQzYBlR07yC4TOKrZNEvPjz1CBuSxBQVs2qUyzmFbNMR10JryiRiDCGYFxI/4Blk4XxUge/KEn7y1GHMe2gKtDGwkbLD0lsoAGW09BuIEbWVKFLG+c0LoeLEh1CA6Khghi0WoGKoKbe7oXSDhcTuzutGKNi03FM6blXgLDx++4DuI+O/ge04PesWdD1rcWiyp/5W2Xt4OTB6+7/PnwTQiK3Pc2Va+f8dKclea814afW+aMP6fNLIUr2TXjbhESqtE6av01tXKfmyighe0bjUQncLkFOs0TROtT8k8fwCdouQj",
      position = {0, -4}
    }
    assembler = game.surfaces[1].find_entities_filtered{name = "assembling-machine-2"}[2]
    global_rotate_count = 1
    rotate_count = 0

    local story_table =
    {
      {
        {
          name = "start",
          init = function() rotate_count = global_rotate_count end,
          condition = story_elapsed_check(0.5)
        },
        {
          condition = function() return game.simulation.move_cursor({position = assembler.position}) end,
          action = function() player.update_selected_entity(game.simulation.camera_player_cursor_position) end
        },
        {
          name = "rotate",
          condition = story_elapsed_check(0.5),
          action = function()
            game.simulation.control_press{control = "rotate", notify = true}
            rotate_count = rotate_count - 1
          end
        },
        { action = function() if rotate_count > 0 then story_jump_to(storage.story, "rotate") end end },
        { action = function() global_rotate_count = (global_rotate_count % 3) + 1 end },
        {
          condition = function() return game.simulation.move_cursor({position = player.position}) end,
          action = function() story_jump_to(storage.story, "start") end
        }
      }
    }
    tip_story_init(story_table)
  ]]
}

simulations.burner_inserter_refueling =
{
  init =
  [[
    game.simulation.camera_position = {0, 0.5}

    game.surfaces[1].create_entities_from_blueprint_string
    {
      string = "0eNqV1duOgyAQANB/mWfcFBVvv7LZGK2zXRILBrC7TeO/L7TpXdPOmwhzBgScA7T9iIORykF1ALnWykL1eQArN6rpwzu3HxAqkA63wEA129ByplF20MZFLfYOJgZSdfgHFZ/Yy+BeNx2am6B4+mKAykkn8ZT+2NjXaty2fmTFL7G/WneoovUPWufFQVsfpFXI5aEoWX0IBnsf4R+mMJcHKX6cxbMRl1eBQScNrk/dKTuvR49uGMOyn/xk6RPN5Mlu53qfaUZOCXJOkgVBFiQ5I8gpSc4vcjsahSaSyqJx8xuaLNI8nrELis1pdkmweUmz+YqC50ScU3BBxGMKTtxOnlBw4n5ywrXkK9IR54R7WdBkwr0saXL+vkz7/fHifZn2++Pl65ogXpYEqRYqQny9lVJ9S+X7lsvX/cTP42uLzkm1sWGcwa3eYT36vt6fYezqUF19lzMjTqGSHqttdVPZGezQ2GOeuOBpkYgsy1Ih8nKa/gEgIZvA",
      position = {0, 0}
    }

    script.on_nth_tick(2400, function()
      local chest = game.surfaces[1].find_entities_filtered{name = "wooden-chest"}[1]
      chest.insert({name = "coal", count = 20})
      for k, burner in pairs (game.surfaces[1].find_entities_filtered{name = "burner-inserter"}) do
        burner.clear_items_inside()
        burner.energy = 400000
      end
    end)

  ]]
}

simulations.circuit_network =
{
  init =
  [[
    require("__core__/lualib/story")
    player = game.simulation.create_test_player{name = "cable-guy"}
    player.teleport({0.5, -7})
    game.simulation.camera_player = player
    game.simulation.camera_position = {0, 0.5}
    game.simulation.camera_alt_info = true
    storage.resting_position = {0.5, 4}
    game.simulation.camera_player_cursor_position = storage.resting_position
    storage.character = player.character
    storage.character.character_running_speed_modifier = -0.5

    local technology = "inserter-capacity-bonus-2"
    local technologies = prototypes.technology
    for name, prerequisite in pairs (technologies[technology].prerequisites) do
      game.forces.player.technologies[name].researched = true
    end
    game.forces.player.technologies[technology].researched = true

    game.surfaces[1].create_entities_from_blueprint_string
    {
      string = "0eNqd1++OojAQAPB36eeyoS1F4FXMhiCOXnOlkLbcnWt49y3cLeqKypwfCFj49V+mkzmTne6hs8p4UpyJqlvjSLE9E6eOptLjf/7UASmI8tAQSkzVjE/eVsZ1rfXRDrQnAyXK7OEPKdjwTgkYr7yCv9L0cCpN3+zAhhdmwzWV1hFoqL1VddS1GkIHXevCt60Zuw5eJPibpOREivxNDgO98/jszRIYsMdTFOYE9lDVy+pkZmHge2XDd1NbQsmuPxzAlk59BJLF82+hZ3GZiQfQUf0DnF/qiz2fQTI7yjiwYdBLSHyF3Ayaham0v8BatYfS+ar++TX6hb7kox2875Hnj3rMFuAUua1cPl+UDdJj+XMvw3riuZcjFjL7R7H4+0omCzKL/2OPVtIMQW9wNEfQKY4WCFri6ARBJzgaE2oCR6cImuPoDYJmODpD0DGOztccoexxHKLOUI4IUIYLUM5W5hR2E51LEv924Omq6Zag5BUkVkLyFZSshMQrCBFZbD5q+Kr1R0TWZQvW0YjIumzKOhoRWZdtWkcj8hzjKFpgwkjgaESeYzGORuQ5xnA0Is9lOBmR5nKcjIhFXCgKRCjiIlFcIlG31X4xVzz06FwPma4fC597PrtKRgdlQtvj0uB24F/vlw68V+boxvcsNCE1lX1o0yGxwb4cS7HQ5G0Pw1hu/Q7jG2utLaOSplS+02240s10F640C3fhvamEK64qPkpCznPTeHjGkkzINE0TKTf5MHwCYxiRcw==",
      position = {-1, 0}
    }
    lamp1 = game.surfaces[1].find_entity("small-lamp", {1.5, 0.5})
    lamp2 = game.surfaces[1].find_entity("small-lamp", {2.5, 0.5})
    lamp3 = game.surfaces[1].find_entity("small-lamp", {3.5, 0.5})
    chest1 = game.surfaces[1].find_entity("steel-chest", {-14.5, -0.5})
    chest2 = game.surfaces[1].find_entity("steel-chest", {-0.5, 0.5})
    inserter = nil

    first_simulation = true

    local story_table =
    {
      {
        {
          name = "start",
          init = function() storage.character.walking_state = {walking = true, direction = defines.direction.south} end
        },
        {
          condition = function() return storage.character.position.y > -0.5 end,
          action = function() storage.character.walking_state = {walking = false} end
        },

        -- SETUP LAMP1

        {
          init = function() player.cursor_stack.set_stack{name = "red-wire", count = 1} end,
          condition = function() return game.simulation.move_cursor({position = chest2.position, speed = 0.1}) end,
          action = function() player.drag_wire{position = chest2.position} end
        },
        {
          condition = function() return game.simulation.move_cursor({position = lamp1.position, speed = 0.1}) end,
          action = function() player.drag_wire{position = lamp1.position} end
        },
        {
          condition = function() return game.simulation.move_cursor({position = {lamp1.position.x, lamp1.position.y + 1}, speed = 0.1}) end,
          action = function() player.cursor_stack.clear() end
        },
        { condition = function() return game.simulation.move_cursor({position = lamp1.position, speed = 0.1}) end },
        {
          condition = story_elapsed_check(0.25),
          action = function() player.opened = lamp1 end
        },
        {
          condition = function()
            local target = game.simulation.get_widget_position({type = "check-box", data = "gui-control-behavior-modes.enable-disable"})
            return game.simulation.move_cursor({position = target, speed = 0.15})
          end
        },
        {
          condition = story_elapsed_check(0.25),
          action = function() game.simulation.mouse_click() end
        },
        {
          condition = function()
            local target = game.simulation.get_widget_position({type = "signal-id"})
            return game.simulation.move_cursor({position = target, speed = 0.1})
          end
        },
        {
          condition = story_elapsed_check(0.25),
          action = function()
            game.simulation.mouse_click()
            if first_simulation == false then story_jump_to(storage.story, "setIronPlate") end
          end
        },
        {
          condition = function()
            local target = game.simulation.get_widget_position({type = "item-group-tab", data = "intermediate-products"})
            return game.simulation.move_cursor({position = target, speed = 0.15})
          end
        },
        {
          condition = story_elapsed_check(0.25),
          action = function() game.simulation.mouse_down() end
        },
        {
          condition = story_elapsed_check(0.25),
          action = function() game.simulation.mouse_up() end
        },
        {
          name = "setIronPlate",
          condition = function()
            local target = game.simulation.get_widget_position({type = "simple-slot", data = "iron-plate"})
            return game.simulation.move_cursor({position = target, speed = 0.15})
          end
        },
        {
          condition = story_elapsed_check(0.25),
          action = function() game.simulation.mouse_click() end
        },
        {
          condition = function()
            local target = game.simulation.get_widget_position({type = "drop-down"})
            return game.simulation.move_cursor({position = target, speed = 0.1})
          end
        },
        {
          init = function() chest1.insert({name = "iron-plate", count = 1}) end,
          condition = story_elapsed_check(0.25),
          action = function() game.simulation.mouse_click() end
        },
        {
          condition = function()
            local target = game.simulation.get_widget_position({type = "text-button", data = ">"})
            return game.simulation.move_cursor({position = target, speed = 0.1})
          end
        },
        {
          condition = story_elapsed_check(0.25),
          action = function() game.simulation.mouse_click() end
        },
        {
          condition = function() return game.simulation.move_cursor({position = storage.resting_position, speed = 0.2}) end,
          action = function() player.opened = nil end
        },
        { condition = story_elapsed_check(6) },

        -- SETUP LAMP2 & LAMP3

        {
          init = function() player.cursor_stack.set_stack{name = "red-wire", count = 1} end,
          condition = function() return game.simulation.move_cursor({position = lamp1.position, speed = 0.1}) end,
          action = function() player.drag_wire{position = lamp1.position} end
        },
        {
          condition = function() return game.simulation.move_cursor({position = lamp2.position, speed = 0.1}) end,
          action = function() player.drag_wire{position = lamp2.position} end
        },
        {
          condition = function() return game.simulation.move_cursor({position = lamp3.position, speed = 0.1}) end,
          action = function() player.drag_wire{position = lamp3.position} end
        },
        {
          condition = function() return game.simulation.move_cursor({position = {lamp2.position.x, lamp2.position.y + 1}, speed = 0.1}) end,
          action = function() player.cursor_stack.clear() end
        },
        { condition = function() return game.simulation.move_cursor({position = lamp2.position, speed = 0.1}) end },
        {
          condition = story_elapsed_check(0.25),
          action = function() player.opened = lamp2 end
        },
        {
          condition = function()
            local target = game.simulation.get_widget_position({type = "check-box", data = "gui-control-behavior-modes.enable-disable"})
            return game.simulation.move_cursor({position = target, speed = 0.15})
          end
        },
        {
          condition = story_elapsed_check(0.25),
          action = function() game.simulation.mouse_click() end
        },
        {
          condition = function()
            local target = game.simulation.get_widget_position({type = "signal-id"})
            return game.simulation.move_cursor({position = target, speed = 0.15})
          end
        },
        {
          condition = story_elapsed_check(0.25),
          action = function() game.simulation.mouse_click() end
        },
        {
          condition = function()
            local target = game.simulation.get_widget_position({type = "simple-slot", data = "iron-plate"})
            return game.simulation.move_cursor({position = target, speed = 0.15})
          end
        },
        {
          condition = story_elapsed_check(0.25),
          action = function() game.simulation.mouse_click() end
        },
        {
          condition = function()
            local target = game.simulation.get_widget_position({type = "drop-down"})
            return game.simulation.move_cursor({position = target, speed = 0.15})
          end
        },
        {
          condition = story_elapsed_check(0.25),
          action = function() game.simulation.mouse_click() end
        },
        {
          condition = function()
            local target = game.simulation.get_widget_position({type = "text-button", data = ">"})
            return game.simulation.move_cursor({position = target, speed = 0.15})
          end
        },
        {
          condition = story_elapsed_check(0.25),
          action = function() game.simulation.mouse_click() end
        },
        {
          condition = function()
            local target = game.simulation.get_widget_position({type = "signal-or-number"})
            return game.simulation.move_cursor({position = target, speed = 0.1})
          end
        },
        {
          condition = story_elapsed_check(0.25),
          action = function() game.simulation.mouse_click() end
        },
        {
          condition = function()
            local target = game.simulation.get_widget_position({type = "textfield", data = "0"})
            return game.simulation.move_cursor({position = target, speed = 0.1})
          end
        },
        {
          condition = story_elapsed_check(0.25),
          action = function()
            game.simulation.mouse_click()
            game.simulation.write({text = "1"})
          end
        },
        { condition = story_elapsed_check(0.25) },
        {
          condition = function()
            local target = game.simulation.get_widget_position({type = "text-button-localised-substring", data = "gui.set-constant"})
            return game.simulation.move_cursor({position = target, speed = 0.15})
          end
        },
        {
          condition = story_elapsed_check(0.25),
          action = function() game.simulation.mouse_click() end
        },
        {
          condition = function() return game.simulation.move_cursor({position = storage.resting_position, speed = 0.2}) end,
          action = function() player.opened = nil end
        },
        { condition = function() return game.simulation.move_cursor({position = lamp3.position, speed = 0.15}) end },
        {
          condition = story_elapsed_check(0.25),
          action = function() player.opened = lamp3 end
        },
        {
          condition = function()
            local target = game.simulation.get_widget_position({type = "check-box", data = "gui-control-behavior-modes.enable-disable"})
            return game.simulation.move_cursor({position = target, speed = 0.15})
          end
        },
        {
          condition = story_elapsed_check(0.25),
          action = function() game.simulation.mouse_click() end
        },
        {
          condition = function()
            local target = game.simulation.get_widget_position({type = "signal-id"})
            return game.simulation.move_cursor({position = target, speed = 0.15})
          end
        },
        {
          condition = story_elapsed_check(0.25),
          action = function() game.simulation.mouse_click() end
        },
        {
          condition = function()
            local target = game.simulation.get_widget_position({type = "simple-slot", data = "iron-plate"})
            return game.simulation.move_cursor({position = target, speed = 0.15})
          end
        },
        {
          condition = story_elapsed_check(0.25),
          action = function() game.simulation.mouse_click() end
        },
        {
          condition = function()
            local target = game.simulation.get_widget_position({type = "drop-down"})
            return game.simulation.move_cursor({position = target, speed = 0.15})
          end
        },
        {
          condition = story_elapsed_check(0.25),
          action = function() game.simulation.mouse_click() end
        },
        {
          condition = function()
            local target = game.simulation.get_widget_position({type = "text-button", data = ">"})
            return game.simulation.move_cursor({position = target, speed = 0.15})
          end
        },
        {
          condition = story_elapsed_check(0.25),
          action = function() game.simulation.mouse_click() end
        },
        {
          condition = function()
            local target = game.simulation.get_widget_position({type = "signal-or-number"})
            return game.simulation.move_cursor({position = target, speed = 0.15})
          end
        },
        {
          condition = story_elapsed_check(0.25),
          action = function() game.simulation.mouse_click() end
        },
        {
          condition = function()
            local target = game.simulation.get_widget_position({type = "textfield", data = "0"})
            return game.simulation.move_cursor({position = target, speed = 0.15})
          end
        },
        {
          condition = story_elapsed_check(0.25),
          action = function()
            game.simulation.mouse_click()
            game.simulation.write({text = "2"})
          end
        },
        { condition = story_elapsed_check(0.25) },
        {
          init = function() chest1.insert({name = "iron-plate", count = 2}) end,
          condition = function()
            local target = game.simulation.get_widget_position({type = "text-button-localised-substring", data = "gui.set-constant"})
            return game.simulation.move_cursor({position = target, speed = 0.15})
          end
        },
        {
          condition = story_elapsed_check(0.25),
          action = function() game.simulation.mouse_click() end
        },
        { condition = story_elapsed_check(0.25) },
        {
          condition = function() return game.simulation.move_cursor({position = storage.resting_position, speed = 0.2}) end,
          action = function() player.opened = nil end
        },
        { condition = story_elapsed_check(7) },

        -- SETUP INSERTER

        {
          init = function()
            player.cursor_stack.set_stack{name = "bulk-inserter", count = 1}
            action = function() game.simulation.camera_player_cursor_direction = defines.direction.west end
          end,
          condition = function() return game.simulation.move_cursor({position = {chest2.position.x, chest2.position.y + 1}, speed = 0.1}) end,
          action = function()
            player.build_from_cursor{position = game.simulation.camera_player_cursor_position, direction = defines.direction.west}
          end
        },
        {
          condition = story_elapsed_check(1),
          action = function() inserter = game.surfaces[1].find_entity("bulk-inserter", {chest2.position.x, chest2.position.y + 1}) end
        },
        { condition = function() return game.simulation.move_cursor({position = {inserter.position.x + 1, inserter.position.y}, speed = 0.1}) end },
        {
          init = function() player.cursor_stack.set_stack{name = "red-wire", count = 1} end,
          condition = function() return game.simulation.move_cursor({position = chest2.position, speed = 0.1}) end,
          action = function() player.drag_wire{position = chest2.position} end
        },
        {
          condition = function() return game.simulation.move_cursor({position = inserter.position, speed = 0.1}) end,
          action = function() player.drag_wire{position = inserter.position} end
        },
        {
          condition = function() return game.simulation.move_cursor({position = {inserter.position.x + 1, inserter.position.y}, speed = 0.1}) end,
          action = function() player.cursor_stack.clear() end
        },
        { condition = function() return game.simulation.move_cursor({position = inserter.position, speed = 0.1}) end },
        {
          condition = story_elapsed_check(0.25),
          action = function() player.opened = inserter end
        },
        {
          condition = function()
            local target = game.simulation.get_widget_position({type = "check-box", data = "gui-control-behavior-modes.enable-disable"})
            return game.simulation.move_cursor({position = target, speed = 0.15})
          end
        },
        {
          condition = story_elapsed_check(0.25),
          action = function() game.simulation.mouse_click() end
        },
        {
          condition = function()
            local target = game.simulation.get_widget_position({type = "signal-id"})
            return game.simulation.move_cursor({position = target, speed = 0.15})
          end
        },
        {
          condition = story_elapsed_check(0.25),
          action = function() game.simulation.mouse_click() end
        },
        {
          condition = function()
            local target = game.simulation.get_widget_position({type = "simple-slot", data = "iron-plate"})
            return game.simulation.move_cursor({position = target, speed = 0.15})
          end
        },
        {
          condition = story_elapsed_check(0.25),
          action = function() game.simulation.mouse_click() end
        },
        {
          condition = function()
            local target = game.simulation.get_widget_position({type = "drop-down"})
            return game.simulation.move_cursor({position = target, speed = 0.15})
          end
        },
        {
          condition = story_elapsed_check(0.25),
          action = function() game.simulation.mouse_click() end
        },
        {
          condition = function()
            local target = game.simulation.get_widget_position({type = "text-button", data = ">"})
            return game.simulation.move_cursor({position = target, speed = 0.15})
          end
        },
        {
          condition = story_elapsed_check(0.25),
          action = function() game.simulation.mouse_click() end
        },
        {
          condition = function()
            local target = game.simulation.get_widget_position({type = "signal-or-number"})
            return game.simulation.move_cursor({position = target, speed = 0.15})
          end
        },
        {
          condition = story_elapsed_check(0.25),
          action = function() game.simulation.mouse_click() end
        },
        {
          condition = function()
            local target = game.simulation.get_widget_position({type = "textfield", data = "0"})
            return game.simulation.move_cursor({position = target, speed = 0.15})
          end
        },
        {
          condition = story_elapsed_check(0.25),
          action = function()
            game.simulation.mouse_click()
            game.simulation.write({text = "3"})
          end
        },
        { condition = story_elapsed_check(0.25) },
        {
          condition = function()
            local target = game.simulation.get_widget_position({type = "text-button-localised-substring", data = "gui.set-constant"})
            return game.simulation.move_cursor({position = target, speed = 0.15})
          end
        },
        {
          init = function() chest1.insert({name = "iron-plate", count = 7}) end,
          condition = story_elapsed_check(0.25),
          action = function() game.simulation.mouse_click() end
        },
        { condition = story_elapsed_check(0.25) },
        {
          condition = function() return game.simulation.move_cursor({position = storage.resting_position, speed = 0.2}) end,
          action = function() player.opened = nil end
        },
        { condition = story_elapsed_check(0.25) },
        { condition = function() return game.simulation.move_cursor({position = inserter.position, speed = 0.2}) end },
        {
          condition = story_elapsed_check(0.25),
          action = function() inserter.rotate({by_player = player}) end
        },
        { condition = function() return game.simulation.move_cursor({position = storage.resting_position, speed = 0.2}) end },

        -- RESET EVERYTHING

        {
          condition = story_elapsed_check(17),
          action = function()
            player.opened = nil
            storage.character.walking_state = {walking = true, direction = defines.direction.north}
          end
        },
        {
          condition = function() return storage.character.position.y < -7 end,
          action = function() storage.character.walking_state = {walking = false} end
        },
        {
          condition = function() return game.simulation.move_cursor({position = storage.resting_position, speed = 0.2}) end,
          action = function()
            lamp1.destroy()
            lamp1 = game.surfaces[1].create_entity{name = "small-lamp", position = {1.5, 0.5}, force = player.force, create_build_effect_smoke = false}
            lamp2.destroy()
            lamp2 = game.surfaces[1].create_entity{name = "small-lamp", position = {2.5, 0.5}, force = player.force, create_build_effect_smoke = false}
            lamp3.destroy()
            lamp3 = game.surfaces[1].create_entity{name = "small-lamp", position = {3.5, 0.5}, force = player.force, create_build_effect_smoke = false}
            inserter.destroy()
            chest2.clear_items_inside()
            first_simulation = false
            story_jump_to(storage.story, "start")
          end
        }
      }
    }
    tip_story_init(story_table)
  ]]
}

simulations.shoot_targeting =
{
  init =
  [[
    player = game.simulation.create_test_player{name = "big k"}
    player.teleport({-4, 0.5})
    game.simulation.camera_player = player
    game.simulation.camera_position = {0, 0.5}
    game.simulation.camera_player_cursor_position = player.position
    player.character.direction = defines.direction.east

    step_1 = function()
      biter = game.surfaces[1].create_entity{name = "medium-biter", position = {12 + (math.random() * 2), -4 + (math.random() * 4)}}
      biter.speed = 0.05
      biter.commandable.set_command
      {
        type = defines.command.attack,
        target = player.character
      }

      tree = game.surfaces[1].create_entity{name = "tree-02", position = {4, 2.5}}

      local count = 60
      script.on_nth_tick(1, function()
        if count > 0 then count = count - 1 return end
        step_2()
      end)
    end

    step_2 = function()
      local rand_x = -1.5
      local rand_y = -1
      local position = {0.5 * ((biter.position.x + rand_x) + player.position.x), 0.5 * ((biter.position.y + rand_y) + player.position.y)}
      player.clear_items_inside()
      player.insert("pistol")
      player.insert("piercing-rounds-magazine")
      player.force.set_ammo_damage_modifier("bullet", 0.5)

      script.on_nth_tick(1, function()
        if not biter.valid then
          step_3()
          return
        end
        if game.simulation.move_cursor({position = position}) then
          player.shooting_state = {state  = defines.shooting.shooting_enemies, position = position}
        end
      end)

    end

    step_3 = function()
      local count = 60
      script.on_nth_tick(1, function()
        if count > 0 then count = count - 1 return end

        if game.simulation.move_cursor({position = tree.position}) then
          step_4()
        end
      end)
    end

    step_4 = function()
      local count = 30
      script.on_nth_tick(1, function()
        if count > 0 then count = count - 1 return end
        if not tree.valid then
          step_5()
        end
        player.shooting_state = {state  = defines.shooting.shooting_selected, position = game.simulation.camera_player_cursor_position}
      end)
    end

    step_5 = function()
      local count = 30
      script.on_nth_tick(1, function()
        if count > 0 then count = count - 1 return end
        if game.simulation.move_cursor({position = player.position}) then
          reset()
        end
      end)
    end

    reset = function()

      local count = 30
      script.on_nth_tick(1, function()
        if count > 0 then count = count - 1 return end
        start()
      end)
    end

    start = function()
      local count = 30
      script.on_nth_tick(1, function()
        if count > 0 then count = count - 1 return end
        step_1()
      end)
    end

    start()

  ]]
}

return simulations
