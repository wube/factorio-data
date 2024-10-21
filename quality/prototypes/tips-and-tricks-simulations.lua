local simulations = {}

simulations.quality_probabilities =
{
  init_update_count = 120,
  init =
  [[
    player = game.simulation.create_test_player{name = "Quality Manager"}
    player.teleport({-7.5, 0})
    game.simulation.camera_player = player
    game.simulation.camera_position = {0, 0.5}
    game.simulation.camera_alt_info = true
    game.simulation.camera_player_cursor_position = player.position
    game.simulation.hide_cursor = true
    player.character.direction = defines.direction.south

    game.surfaces[1].create_entities_from_blueprint_string
    {
      string = "0eNp9UV9vgyAQ/y73jE2tYjq+ymIM6sVeBocD7WYM331Y13QvLuHl+P09WKE1M46eeAK1AnWOA6j3FQINrM12x9oiKNAhoG0N8ZBZ3d2IMSsgCiDu8RtUHmsByBNNhLvDY1ganm2LPhHEv04CRheS2PGWuRmeLycpYAFVnGTK8djRuMnJO84G1D77uiEaeELN56xNSkwUdt7qDaEJ7d6G+j+7/DIz6/rZPPfYqYnJDfE9tXd+2aWvqRQQJt19gDpHcYDkh8jlECliHdOp9xqp4etXBNzRh8e7XK55eS1kVVWllG8yxh9sPJXs",
      position = {-8, 2}
    }

    show_probabilities = function()

      local quality_prototypes = prototypes.quality
      local quality_levels = {}
      local current_quality = prototypes.quality["normal"];
      while true do
         table.insert(quality_levels, current_quality);
         current_quality = current_quality.next;
         if current_quality == nil then
           break
         end
      end

      local frame = game.players[1].gui.screen.add{type = "frame", caption = {"tips-and-tricks-simulation.quality-calculation"}, direction = "vertical"}
      frame.auto_center = true
      local inner = frame.add{type = "frame", style = "inside_shallow_frame_with_padding", direction = "vertical"}
      local quality_table = inner.add{type = "table", column_count = table_size(quality_levels), style = "bordered_table"}
      quality_table.add{type = "label", caption = {"tips-and-tricks-simulation.input"}, style = "bold_label"}

      for k, quality in pairs (quality_levels) do
        if quality.name ~= "normal" then
          quality_table.add{type = "label", caption = {"tips-and-tricks-simulation.chance", "[item=iron-gear-wheel,quality=" .. quality.name .. "]"}, style = "bold_label"}
        end
      end

      local module_chance = prototypes.item["quality-module-3"].module_effects["quality"] * 4;
      local row_header = string.rep("[item=quality-module-3]", 4)
      for k, quality in pairs (quality_levels) do
        if quality.name ~= "legendary" then
          quality_table.add{type = "label", caption = row_header.. " [item=iron-plate,quality="..quality.name.."]"}
          local cumulative_chance = module_chance;
          for j, quality in pairs(quality_levels) do
	          if quality.name ~= "normal" then
                if k >= j then
                  quality_table.add{type = "label", caption = ""}
                else
                  quality_table.add{type = "label", caption = string.format("%.2f%%", cumulative_chance * 100)}
		            end
            end
            if k <= j then
              cumulative_chance = cumulative_chance * quality.next_probability
            end
          end
        end
      end
    end

    show_probabilities()
  ]]
}


simulations.quality =
{
  init =
  [[
    player = game.simulation.create_test_player{name = "Quality Manager"}
    player.character.teleport{0, 2.5}
    game.simulation.camera_player = player
    game.simulation.camera_position = {0.5, 0.5}
    game.simulation.camera_alt_info = true
    game.simulation.camera_player_cursor_position = player.position

    game.forces.player.unlock_quality("uncommon")
    game.forces.player.unlock_quality("rare")

    step_1 = function()
      player.cursor_stack.set_stack({name = "small-electric-pole", count = 1, quality = "normal"})
      script.on_nth_tick(1, function()
        if game.simulation.move_cursor({position = {-7.5, 0.5}, speed = 0.1}) then
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
      player.cursor_stack.set_stack({name = "small-electric-pole", count = 1, quality = "uncommon"})
      script.on_nth_tick(1, function()
        if game.simulation.move_cursor({position = {-1.5, 0.5}, speed = 0.1}) then
          step_5()
        end
      end)
    end

    step_5 = function()
      local count = 30
      script.on_nth_tick(1, function()
        count = count - 1
        if count > 0 then return end
        player.build_from_cursor{position = game.simulation.camera_player_cursor_position}
        player.clear_cursor()
        step_6()
      end)
    end

    step_6 = function()
      local count = 30
      script.on_nth_tick(1, function()
        count = count - 1
        if count > 0 then return end
        if game.simulation.move_cursor({position = player.position}) then
          step_7()
        end
      end)
    end

    step_7 = function()
      player.cursor_stack.set_stack({name = "small-electric-pole", count = 1, quality = "rare"})
      script.on_nth_tick(1, function()
        if game.simulation.move_cursor({position = {6.5, 0.5}, speed = 0.1}) then
        end
      end)
    end

    reset = function()
      local count = 30
      script.on_nth_tick(1, function()
        if count > 0 then count = count - 1 return end
        if game.simulation.move_cursor({position = player.position}) then
          start()
        end
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

simulations.quality_modules =
{
  init_update_count = 360,
  init =
  [[
    game.simulation.camera_position = {0, 0.5}
    game.simulation.camera_alt_info = true
    game.forces.player.unlock_quality("uncommon")
    game.forces.player.unlock_quality("rare")

    local technology = "inserter-capacity-bonus-2"
    local technologies = prototypes.technology
    for name, prerequisite in pairs (technologies[technology].prerequisites) do
      game.forces.player.technologies[name].researched = true
    end
    game.forces.player.technologies[technology].researched = true

    game.surfaces[1].create_entities_from_blueprint_string
    {
      string = "0eNrtWtuSmzoQ/Bc9QwoJxMVV+ZItlwtjeVcVEBwBm+Oz5X+PZHzLGtszk7ydzUtiJHePhrTpafuDretRdVabgS0+mK5a07PFywfr9aspa39t2HWKLZgeVMMCZsrGv9qW/RAOtjR919ohXKt6YPuAabNR/7IF3wdPEcq+V8261uY1bMrqTRsVxlcQYr8MmDKDHrSaKjq82K3M2KyVdRxnJG222rilsHpT/eAYurZ3b2uN53ZQYRx9kwHbsUX2TR4Ypv2rXg2D4+/9Pqua9l2tRrdWD8qqzcqX65a2Zd2rgE2Xp0pOvLY1YVeXg3KcVTv6FvIoCljTbg4nHMJalYeKzn1Z7n1rPh1F/N7Wui037vLtOURxdYqNtqqaVpPg1OJ2HLrR34kbjvjhrZvhSn/r2TXbDHqCRc8w6BKLnmDQUyy6xKBnWHSBQc+x6DEGvcCiRxh0HmHhOQqeI+F5joIXWPgCBY/VK0fplWMFy1GC5VjFcpRiOVayHCVZjtUsR2mWY0XLUaLlWNVylGoFVrUcpVqBVS1KtAIrWpRmBVazKMkKrGRRihUS6EHkMwuizR0HIlKEY/sDwzbYUc26rE+y1qZXdpg3WqfPC/e/axbqIuFGbfTYhKp2nbC6Cru2Vo8evPnhRP+MZe0A3ftHU7VN4zbO0RTwisXjiuMIDHV+UN2D4nCo9AmUwPbx/KDA9DGO4RXHTypO4FDREyiJPbyknD19PHE9cM/+AI7HaVx353nnVZU2/PmmVM1OS6tLJaa1TelXjlp0w5LeeOBjCcedoZuQxvo08E1b3U6z0ubd1d/a3fTWyyvX9n4oqx9sEflDzq7wuyvi7krsJ7LlXN8ydN/4V9/cQo7t29l3/7/7VqD7Jr/65rZE6L6Jr765LRzbt+KrbW7LxbGcn9bKKPu6c1bA+YBtWc09uZNj59y51uN2q+yq1/+pQ1x4+jNHRg7tvI0BpHbk2A6ITw7ugPjk6A6IT5gY/KfLnNtLcmoQCKy1oEaBMHwZ4WeRe72QnBosAmsV1GQRiB9To0UgfkLNFoH4Ej8M3r2XKTWoBNaaUZNKIH6On2bv9qKgxp6wWtOImnsC8Tk1+ATiC2ryCcQnzPn37mWaUGNUYK2SmqMC8VN8UHG3FxkxlAWWmhNTWSB8QYxlb+HzuS/4Iiq8AH1/+EmTfeec8vx9vHzw3WSzU0Z65bhvTfuMW6/apitt6cyxu/rdm/Lp++VVZ3Vrp8212s6mvZlABcozzXieKGcxPlE+Ev2dSDlLCD9C8B/6f68CifvtwJH8qs/+i8ynjU7Jg8IM3xxBRp50gAQ5eVQAEhTkWQdGkEdkgw8k4OQJBUhAt+VAgpg8VwAJ6MYcSCDJkwWQICXbaSBBRp4HgAQ52QQDCeguHkZQRGQbDCSg+3gggSCbVyBBTHbfQIKE6jmB+JJqmYH4KfHXAFD8jOpq5/CXAfvpLvjk90XkgQxiEchl8OL/CmLp/r2cAl9Hd/k9asDele0PGCLnSR7LNE0TKbNiv/8F6SYNUA==",
      position = {0, 1}
    }
  ]]
}

simulations.quality_of_ingredients =
{
  init =
  [[
    require("__core__/lualib/story")
    player = game.simulation.create_test_player{name = "big k"}
    player.teleport({5, -1.5})
    game.simulation.camera_player = player
    game.simulation.camera_position = {0, 0.5}
    game.simulation.camera_alt_info = true
	  game.simulation.camera_player_cursor_position = player.position
    player.character.direction = defines.direction.south
    game.forces.player.unlock_quality("uncommon")
    game.forces.player.recipes["electronic-circuit"].enabled = true
    game.surfaces[1].create_entities_from_blueprint_string
    {
      string = "0eNrVmWtvmzAUhv+LP0OFr0D+ShVFhDitJTAMTLesyn+fIU2TLU53fLZKW74F4+dcfHnfKK9k20y6H4x1ZPVKTN3ZkaweX8lonmzVzM9s1WqyIm6o7Nh3g0u3unHkmBBjd/obWdFjEni9Gkfdbhtjn9K2qp+N1Sm/msSO64Ro64wz+hRw+XLY2Knd6sFTkzPJ2L2xfiitn/XoSEL6bvTTOjtH86iUsweZkANZqQe5RDi9vxm1cz7+OL836LZ70ZvJjzVOD3q3MU63fmhfNaNOyOnxKZNz3KGzad9UTvuYdTfNHaJZlpC22y0VurTR1ZLReyfWx7kZv5TC3ktpumrnnwRKoFcF7Myg69OoSIg79PPUbnL9NLf9Bs+TO0t0G4YVb53KbwIFwCICXP60BFfgIgCWCDAoYxUBVjHgPAKcx4CLCLCMAZcRYBEDplkEmUWRaQSZR5FZBDmLIsecPhpFjjh+NOqU0Mv52/v7KzV21IML3kv07oVBWYh8OYDB+z8Q4PoYhog5PFcRl+vl6I1O6+auvFD+mxRLhFSV/6hUZYhair9aS931vR7Suto2V9UwVDUUrLwlRnkZXNkLFJ8jhLKEKDDDaHsR3v9MIvYMpZ+5ab5MVeOpfmCydde2PoE/3EkKvNJvlcUudY5wcTSDXPesQKz1UkUIVmJgoDx5hnBvQDRF+DcgmiEcHBDNER4OiBYIqwVES4Q/BKIVwmwB0TnCIQLRRbzduiUHPQwvER4RlrXI0FZuCRBC0ngvB2yEYLFm7m6Sl0OnGx9zMHWqrR6eDj5fn+y+qnVoT7xBfa7bab/Xw2Y03/Xiws6fUDCBkU72ed7xI+FEGUoh4cLJMMIpFEY4OegI5Bitg6FRmswg1k6UGK0DZS1RCg1DU4yMwtAMI6MwNMfIKAwtMDIKQ0uMjMLQCiOjMHSOkFEOUg9ZYGQUlnWJl1EeViiVIWQU1ghFo2X0XpJXgjxtR1ctswOg890fhHAYhH3EQEms+K9+naoIkRUYkVUKI1dzqPlvnq8+2NyPR78pZOIXVa7907lrnnf5+ykhL75vC4kVVBRcKqWElKWn/AA7vrPb",
      position = {0, 0}
    }
    assembler1 = game.surfaces[1].find_entities_filtered{name = "assembling-machine-3"}[1]
    assembler2 = game.surfaces[1].find_entities_filtered{name = "assembling-machine-3"}[2]
    assembler3 = game.surfaces[1].find_entities_filtered{name = "assembling-machine-3"}[3]
    first_simulation = true

    local story_table =
    {
      {
        {
          name = "start",
          condition = story_elapsed_check(1)
        },
        {
          condition = function() return game.simulation.move_cursor({position = assembler1.position}) end
        },
        {
          condition = story_elapsed_check(0.5),
          action = function() player.opened = assembler1 end
        },
        {
          condition = story_elapsed_check(0.25),
          action = function()
            if first_simulation == false then story_jump_to(storage.story, "setElectronicCircuit") end
          end
        },
        {
          condition = function()
            local target = game.simulation.get_widget_position({type = "item-group-tab", data = "intermediate-products"})
            return game.simulation.move_cursor({position = target, speed = 0.15})
          end,
          action = function() first_simulation = false end
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
          name = "setElectronicCircuit",
          condition = function()
            local target = game.simulation.get_widget_position({type = "recipe-slot", data = "electronic-circuit"})
            return game.simulation.move_cursor({position = target, speed = 0.15})
          end
        },
        {
          condition = story_elapsed_check(0.25),
          action = function() game.simulation.mouse_click() end
        },
        {
          condition = story_elapsed_check(0.5),
          action = function()
            game.simulation.control_press{control = "confirm-gui", notify = false}
          end
        },
        {
          condition = story_elapsed_check(0,5),
          action = function() player.opened = nil end
        },
        { condition = story_elapsed_check(1) },
        {
          condition = function() return game.simulation.move_cursor({position = assembler2.position}) end
        },
        {
          condition = story_elapsed_check(0.5),
          action = function() player.opened = assembler2 end
        },
        { condition = story_elapsed_check(0.25) },
        {
          condition = function()
            local target = game.simulation.get_widget_position({type = "recipe-slot", data = "electronic-circuit"})
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
            local target = game.simulation.get_widget_position({type = "text-button-localised-substring", data = "gui.any"})
            return game.simulation.move_cursor({position = target, speed = 0.15})
          end
        },
        {
          condition = story_elapsed_check(1),
          action = function() game.simulation.mouse_click() end
        },
        {
          condition = story_elapsed_check(0.5),
          action = function()
            game.simulation.control_press{control = "confirm-gui", notify = false}
          end
        },
        {
          condition = story_elapsed_check(0,5),
          action = function() player.opened = nil end
        },
        { condition = story_elapsed_check(1) },
        { condition = function() return game.simulation.move_cursor({position = assembler3.position}) end },
        {
          condition = story_elapsed_check(0.5),
          action = function() player.opened = assembler3 end
        },
        { condition = story_elapsed_check(0.25) },
        {
          condition = function()
            local target = game.simulation.get_widget_position({type = "recipe-slot", data = "electronic-circuit"})
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
            local target = game.simulation.get_widget_position({type = "text-button-localised-substring", data = "quality-name.uncommon"})
            return game.simulation.move_cursor({position = target, speed = 0.15})
          end
        },
        {
          condition = story_elapsed_check(1),
          action = function() game.simulation.mouse_click() end
        },
        {
          condition = story_elapsed_check(0.5),
          action = function()
            game.simulation.control_press{control = "confirm-gui", notify = false}
          end
        },
        {
          condition = story_elapsed_check(0,5),
          action = function() player.opened = nil end
        },
        { condition = function() return game.simulation.move_cursor({position = player.position}) end },
        {
          condition = story_elapsed_check(10),
          action = function()
            position1 = assembler1.position
            assembler1.destroy()
            assembler1 = game.surfaces[1].create_entity{name = "assembling-machine-3", position = position1, force = player.force, create_build_effect_smoke = false}
            position2 = assembler2.position
            assembler2.destroy()
            assembler2 = game.surfaces[1].create_entity{name = "assembling-machine-3", position = position2, force = player.force, create_build_effect_smoke = false}
            position3 = assembler3.position
            assembler3.destroy()
            assembler3 = game.surfaces[1].create_entity{name = "assembling-machine-3", position = position3, force = player.force, create_build_effect_smoke = false}
            story_jump_to(storage.story, "start")
          end
        }
      }
    }
    tip_story_init(story_table)
  ]]
}

simulations.quality_factoriopedia =
{
  init =
  [[
    require("__core__/lualib/story")
    player = game.simulation.create_test_player{name = "Quality Manager"}
    player.teleport({-7.5, 0})
    game.simulation.gui_tooltip_interval = 0.5
    game.simulation.camera_player = player
    game.simulation.camera_position = {0, 0.5}
    game.simulation.camera_alt_info = true
    game.simulation.camera_player_cursor_position = player.position
    player.character.direction = defines.direction.south

    assembler = game.surfaces[1].create_entity{name = "assembling-machine-3", position = {-8, 2}, force = player.force, create_build_effect_smoke = false}

    local story_table =
    {
      {
        {
          name = "start",
          condition = function() return game.simulation.move_cursor({position = assembler.position, speed = 0.1}) end
        },
        {
          condition = story_elapsed_check(0.5),
          action = function() game.simulation.control_press{control = "open-factoriopedia", notify = true} end
        },
        {
          condition = function()
            local target = game.simulation.get_widget_position({type = "label", data = "1.25"})
            return game.simulation.move_cursor({position = target, speed = 0.15})
          end
        },
        { condition = story_elapsed_check(5) },
        {
          condition = function() return game.simulation.move_cursor({position = player.position, speed = 0.1}) end
        },
        {
          condition = story_elapsed_check(2),
          action = function()
            game.simulation.control_press{control = "toggle-menu", notify = false}
            story_jump_to(storage.story, "start")
          end
        }
      }
    }
    tip_story_init(story_table)
  ]]
}

return simulations
