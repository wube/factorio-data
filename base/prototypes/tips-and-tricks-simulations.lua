local simulations = {}

simulations.introduction =
{
  init =
  [[
    local scenes =
    {
      {
        string = "0eNq1mGtzoyAUhv8Ln6UjeIv5KzuZDJqThFkFB7G72U7++6K2btrY9EBn881LnnPhfRF4IVUzQGeksmT7QmStVU+2P15IL09KNOM9e+mAbIm00JKIKNGOV9YI1XfaWFpBY8k1IlId4DfZsmv05Z9F30NbNVKdaCvqs1RA+Q2CX3cRAWWllTAnM11c9mpoKzAuxkKCBmprZE1BgTldqCsDzFHU4IJ1uncErcY0RmpELmRLNy7OQRr3t+lRGpFqOB7B7Hv5xxFZvPzGQj4E5ktgqY5SuUe0PkNv76PR7CmbAxZP2VTa/P6+B2td4f34noFWP8N+cM8alzcc9mOf3KOjaHqIyHx7bsFr3Fp3HRhai6oZa6z1MA4cj+OItPowNdfSBsSU0zIku+tKMQm+mPT/FCONVrRrhL0phYWUki6lNFoc3J0HJeR3AnjVqB5sN4xSvsNnX+Ozb+DzBd/CQQ4tXVTd6WZFyR9GQ4E8nSs9TL3lfLcSofjMtw8KSSf4bSkr4A0enHqBy4CMEwyYxQFkjiKzgGbgcuYBZFzOyeNJ+Z7P3vhs4ju67BYvn0AY+usM0KzpnKUBrWeoMrIAcowi5wGtx+VcBJBxOf9z5dHNnu6j2IOxq9NW8ik4XwOX/mCGAfP4kQzZysf8FR+/F6GBTkhDO1H/XBMgZ9j8Y6++cB46g8f3M3geJfHaHM4TtF78JM4DbIkDB7gSZR0eYEpcxgGevMuYr4H9LYkzThk6f/P3zpkFq5WTbC1NPcjVlUoSewqdxu/aj1iqJN4eRTUq4d7uQUkx8XclSolJim3DpwJfbUPmL3COEXiS+3sdBy68ncNRndh4DxxqrZaU3lzUSi2NvbkZisu8uagFfIrfK7+NWx66uVzdEia+BsoxckxT73blqHZlIWcabApQfudII/Xdfb6NVunKGg9qpqOd7c0xUkSe3T5/7uCGpUXJC5YXRZnn1+tfFqwNlw==",
        postiion = {0,0}
      },
      {
        string = "0eNqtmO1yojAUhu8lv0OHfADqrex0HMSjzQwEJgnddTve+wbdoq2he5KufxSCT87H+5LAG9m1IwxGaUc2b0Q1vbZk8+ONWHXUdTudc6cByIYoBx2hRNfddORMre3QG5ftoHXkTInSe/hFNuz8TAlop5yCK+lycNrqsduB8RfMDKUPSvuhrHkB6zx76K3/W6+nWT0qq54KSk7+x+qpuMxwvX5rwTmlj3a6zkDXv8J29GOtAwP77RSoHzrUrQVKrqevkfydt+l9YtR/jVPSRU5J1++ngdplLdSXUG7ZnM/0IQc+59DBXo1dBi00zqgmG/oWApnwj5loUMeXXT9e4uLyOTCFmKdo+3rvz3xRnsoj98r4EC6jkr73rB/dME7decDLGT+HDhrM8ZR5JYA51E0oDRmcr6RkNx4OYLZW/fZIls+fwMzFkoa+SLC4VO1uSh4Al3hwuQiWAXCVAJYY8OrfPV6Ks0T0eI13mvhYkP/lNOt6Dd+zGssTqs8x1WcsgSxQZJ5AzlFkkUBmKLK8U4sF48JyXGSWIebN69YBtNlhNPrLOwsLSqDEhMYXCxkMLcLULK5FN1fX1kK3a72Bsq5uXpSGjD3yPwXu4WqYzZP9rNs2ZG62jlcCSgg8wXCownAWozBUFzmPFFhQX1zE6AulfC5Tdwh5YINAxSq0ReARS2m+VNbQSsrLeHPgwAmum+odQq0QTcujxIR3VBFjKJFHc1F+Ehg/yZgKiIR1C7XUChFjfY6KVUZaX4RUJIoY6wtUYAnm4WGNiwS7iAXUKvKGxD8049MDC5XBG5KIdxBqPyXjHYSSpWTRXNQDg+TRXNTzghToHf37hr5K2M87M0JIQ1JG3HAqzHogi+hCVahCldHcEsXFG7KKijfVnetHd057hWd6fV2zuXu7Q8mrfzq7tmLFZLXmFSural2W5/MfdP7oUQ==",
        postiion = {0,0}
      },
      {
        string = "0eNrNm99O4zwQxd8l1+kq/m/zKiuECg1spJJUSbpahPrum1CadiFpz5nv5rsDQn8Zj2fGc2z3PXvc7stdW9V9dveeVU9N3WV3P9+zrnqp19vxb/3brszusqovX7M8q9ev4299u667XdP2q8dy22eHPKvqTfknu1OH/OaHn9ddv1ok6MN9npV1X/VVebTl45e3h3r/+li2wyuugvJs13TDZ5t6fP/AW8UfLs/ehh9U8cMN79lUbfl0/Ac9WvsFr//Fd7tt1ffDg+/gdAbfxhrSas9ZbUl84PCOxLtlvJ3B+wlf1c9VPTxaPf0quzmyMid0+iCfPvDQlX1f1S/d+I9t+dr8Lh/2w7PtMHfl5mGMwOHR83rblXl2/PMxuj5f/NTsdmW7atpyeOlTsx8TwhV59tpsxsfrfrUt1x8WTZF+f5gZSpiGsm3Wm9m4UfpyAJeez08J0+z73X7Mim/8CIfn6PrPF92e4CRNqojMryqk+IREp2JLQlq0fhavpcn1De/n8EaKT5Dv2dJgObyDA5KKGC+tOJjVgcSbRfzslEYSrzl8kuJH38+teQVRgCdY+F8WYK2QCnwag/8SK0AF1lpazALUf4g7BY9EvrZSfIDwTlrMMOd4aTHzSGLpABczyzglSosZNqVJioesN4W02oT5amOUFOgXgFpazT0SdMbgPZc5ci3kWHEqOgjvluTaFTJmuHhxxgwPuOGOM5zonj+bdANx2Qw8L0Aa4Vs2Bc8qCbLffsnI/bDCti/tsAhvbr/h+wimRbSqF9ZQi6vssbnHHWUEMY+5yArImM1OEO6YzV5AxmwmUtRy5IiTl0NwbnG35yQF4ns5QT3QI7oCHoWi3OMUDC4WwbM7PJrwDuKcxdx3eI5yE+zY9VSdt6kg37O9rbKL/Fn7vdh+aJfNBfEqhdkfxasUxk//YZUqllep5TT29LpbLI5oLuk82wkrRUWs55dZbL/WSDfcMLyV4jGvSBpjzHAvIGM2S3pijBwFZOjQwCdBkwCRQyEgQxkZzhl5JVnOdQsgaoR4qrTASVIgelzNDZ7ocQtuwpyADIVvIFJOcd4IwMQVxLxFvifEnJt4MOSBWBA94Zdpu32QhWSaJhItar6vhPwbBQ2rmt+piniGcbU24gnGldqI55fnwPiKFjjwOc/KP7u27LorfU/C8zfiaRYpg1Mh1RVQU5KUFA8V4KSlqgVzjpGKigLRFMlKO3zM906Khwp08lL9gFkfpHgscqKwzcdmNgnpkOdVQbSgkSPjWzzT6RlI1rw8AcmCfdcCI1tenoBkwb4r6A2PtPxTlUWIgdm7NIvW3t6dU0Xk5QXolsRv7WJTeXG/6NoWB+FwpXjBAtqqeTJUTpUytA4ATbYCHfCPDFgOt4v7Q7fZ6nZgLwsOpZC0NEyQ4C2s5hweCW2kEWCidQdmqS5oMFYstKIFDWixpsGgxYYWNKDFlpZgINjRFoOu4EUjCA60BgNdga96XJ+oedWIgS+u5Zxk7tJ9t8+7DIWkHbi4rHNbTZ/VCzIADV86/KLpuCuHfbsvD7MGGKkwho5qFX2/Z+IbLAKcVBqDfC89LwT5YnkJ8qNUfIP8JLUfOpFXVnz6CPKl1+Yx91gtxIPWG16Ag4Zbngza7HhpD9osOHkEyYEng96IvDdAcmIEuAGIxIWeabMA8y9xo2ciY16grvRMiltLugTiTs+KW4Sc5bcjzPzhi7q4wHPtKHZywyzD8/Idaxdc4MkG+rqIi/wZ6aIPk0Cva5Fe9/wlOswfnr9Et+QOr2nUUmR5/pgRCyxvaTDoR0fvf8yA7/Pj94PvLr6LnGe/y7Y7hkoclqCkg/IhJO8Ph789UtQy",
        postiion = {-6,-7}
      }
    }

    local validate = function(entities)
      for k, v in pairs (entities) do
        if not v.valid then entities[k] = nil end
      end
    end

    global.stack = game.create_inventory(1)[1]
    global.last_index = -1
    local stamp_scene = function()
      local index = math.random(#scenes)
      if index == global.last_index then
        for k, scene in pairs (scenes) do
          if k ~= index then
            index = k
            break
          end
        end
      end
      global.last_index = index
      local scene = scenes[index]
      global.stack.import_stack(scene.string)
      global.build_entities = global.stack.get_blueprint_entities()
    end

    local distance = function(p_1, p_2)
      return (((p_1.x - p_2.x) ^ 2) + ((p_1.y - p_2.y) ^ 2)) ^ 0.5
    end

    local get_closest = function(entities, position)
      local index, closest
      local max_distance = math.huge
      for k, entity in pairs (entities) do
        local entity_distance = distance(position, entity.position)
        if entity_distance < max_distance then
          max_distance = entity_distance
          index = k
          closest = entity
        end
      end
      return index, closest
    end

    script.on_nth_tick(2, function()
      if global.destroy_entities then
        validate(global.destroy_entities)
        if not next(global.destroy_entities) then
          global.destroy_entities = nil
          stamp_scene()
          return
        end
        local entity = game.surfaces[1].get_closest({-10, -10}, global.destroy_entities)
        if entity then entity.destroy() end
      end

      if global.build_entities then
        if not next(global.build_entities) then
          global.build_entities = nil
          return
        end
        local index, closest = get_closest(global.build_entities, {x = -10, y = -10})
        game.surfaces[1].create_entity(closest)
        global.build_entities[index] = nil
      end

    end)

    script.on_nth_tick(1500, function()
      global.destroy_entities = game.surfaces[1].find_entities()
    end)
  ]]
}

simulations.entity_transfers =
{
  init =
  [[

    player = game.create_test_player{name = "big k"}
    player.teleport({0, 2.5})
    game.camera_player = player
    game.camera_player_cursor_position = player.position
    game.camera_alt_info = true

    game.surfaces[1].create_entity{name = "coal", position = {-5.5, -1.5}, amount = 123456}
    game.surfaces[1].create_entity{name = "coal", position = {-4.5, -1.5}, amount = 654321}
    game.surfaces[1].create_entity{name = "iron-ore", position = {-5.5, 1.5}, amount = 314159}

    game.surfaces[1].create_entities_from_blueprint_string
    {
      string = "0eNqV0ttuwyAMANB/8TOpFHJh5VemacrF6ywlJgKyLYr495GiTdWWtesTMsgHG7xCO8w4WWIPegXqDDvQjys4OnEzbHt+mRA0kMcRBHAzblE7W0abjcTEp6y3NAwQBBD3+AE6D+Km4LxhzF6i03R4kSvDkwBkT54wlXIOlmeexxZtxK8WIWAyLuYa3m6OXlYLWOISa4KeLHbpTG4l/pDlnXK5K9c7cvFH27/M4ovcQcr/ItUVpLqzx2TJ249Xf8PvxvTIWfeKzu+IxSGZ+aEK21+fx0JfzKGAN7QuXfSQl+ooVV4rdVRFCJ9StORn",
      position = {-1,0},
    }

    reset_items = function()
      for k, burnieboy in pairs (game.surfaces[1].find_entities_filtered{type = "mining-drill"}) do
        burnieboy.clear_items_inside()
        burnieboy.insert({name = "coal", count = 41})
      end

      local wood = game.surfaces[1].find_entity("wooden-chest", {-3.5, 1.5})
      wood.clear_items_inside()
      wood.insert({name = "iron-ore", count = 80})

      for k, furnaceboy in pairs (game.surfaces[1].find_entities_filtered{type = "furnace"}) do
        furnaceboy.crafting_progress = 0
        furnaceboy.clear_items_inside()
        furnaceboy.get_output_inventory().insert({name = "iron-plate", count = 40})
      end

      player.clear_items_inside()

    end

    fake_transfer_to = function(entity)
      local stack = player.cursor_stack
      if not (stack.valid and stack.valid_for_read) then return end
      local name, count = stack.name, stack.count
      local inserted = entity.insert{name = name, count = count}
      if inserted == 0 then return end

      player.remove_item{name = name, count = inserted}
      player.surface.create_entity
      {
        name = "flying-text",
        position = {entity.position.x, entity.position.y - 0.5},
        text =
        {
          "",
          "-",
          inserted,
          " ",
          game.item_prototypes[name].localised_name,
          " (",
          player.get_item_count(name),
          ")"
        }
      }
      player.play_sound{path = "utility/inventory_move"}
    end


    fake_transfer_from = function(entity)
      local contents = entity.get_output_inventory().get_contents()
      local transferred = {}
      for name, count in pairs (contents) do
        local inserted = player.insert{name = name, count = count}
        if inserted > 0 then
          entity.remove_item{name = name, count = inserted}
          transferred[name] = inserted
        end
      end

      if not next(transferred) then return end

      local caption = {""}
      for name, count in pairs (transferred) do
        table.insert(caption, "+")
        table.insert(caption, count)
        table.insert(caption, " ")
        table.insert(caption, game.item_prototypes[name].localised_name)
        table.insert(caption, " (")
        table.insert(caption, player.get_item_count(name))
        table.insert(caption, ")\n")
      end

      player.surface.create_entity
      {
        name = "flying-text",
        position = {entity.position.x, entity.position.y - 0.5},
        text = caption
      }
      player.play_sound{path = "utility/inventory_move"}
    end

    step_1 = function()
      script.on_nth_tick(1, function()
        local finished = game.move_cursor({position = {-6, -1}})
        if finished then
          step_2()
        end
      end)
    end

    step_2 = function()
      local count = 30
      local selected = nil
      script.on_nth_tick(1, function()
        count = count - 1
        if count > 0 then return end
        local finished = game.move_cursor({position = {-4, -1}})
        if player.selected and player.selected ~= selected then
          selected = player.selected
          fake_transfer_from(player.selected)
        end
        if finished then
          step_3()
        end
      end)
    end

    step_3 = function()
      local count = 30
      script.on_nth_tick(1, function()
        count = count - 1
        if count > 0 then return end

        local finished = game.move_cursor({position = {0, -1}})

        if finished then
          step_4()
        end
      end)
    end

    step_4 = function()
      local stack = player.get_main_inventory().find_item_stack("coal")
      stack.swap_stack(player.cursor_stack)
      local count = 30
      local selected = nil
      script.on_nth_tick(1, function()
        count = count - 1
        if count > 0 then return end
        local finished = game.move_cursor({position = {5, -1}})
        if player.selected and player.selected ~= selected then
          selected = player.selected
          fake_transfer_to(player.selected)
        end
        if finished then
          step_5()
        end
      end)
    end

    step_5 = function()
      local count = 30
      script.on_nth_tick(1, function()
        count = count - 1
        if count > 0 then return end
        local finished = game.move_cursor({position = {-3.5, 1.5}})
        if finished then
          step_6()
        end
      end)
    end

    step_6 = function()
      local count = 30
      player.clear_cursor()
      script.on_nth_tick(1, function()
        count = count - 1
        if count > 0 then return end
        fake_transfer_from(player.selected)
        step_7()
      end)
    end

    step_7 = function()
      local count = 30
      script.on_nth_tick(1, function()
        count = count - 1
        if count > 0 then return end

        local finished = game.move_cursor({position = {0, -1}})

        if finished then
          step_8()
        end

      end)
    end

    step_8 = function()
      local stack = player.get_main_inventory().find_item_stack("iron-ore")
      stack.swap_stack(player.cursor_stack)
      local count = 30
      local selected = nil
      script.on_nth_tick(1, function()
        count = count - 1
        if count > 0 then return end
        local finished = game.move_cursor({position = {5, -1}})
        if player.selected and player.selected ~= selected then
          selected = player.selected
          fake_transfer_to(player.selected)
        end
        if finished then
          step_9()
        end
      end)
    end

    step_9 = function()
      player.clear_cursor()
      local count = 30
      script.on_nth_tick(1, function()
        count = count - 1
        if count > 0 then return end
        local finished = game.move_cursor({position = {0, -1}})

        if finished then
          step_10()
        end
      end)

    end

    step_10 = function()
      local count = 30
      local selected = nil
      script.on_nth_tick(1, function()
        count = count - 1
        if count > 0 then return end
        local finished = game.move_cursor({position = {5, -1}})
        if player.selected and player.selected ~= selected then
          selected = player.selected
          fake_transfer_from(player.selected)
        end
        if finished then
          reset()
        end
      end)
    end

    reset = function()
      local count = 30
      script.on_nth_tick(1, function()
        count = count - 1
        if count > 0 then return end
        local finished = game.move_cursor({position = player.position})
        if finished then
          start()
        end
      end)
    end

    start = function()
      local count = 60
      script.on_nth_tick(1, function()
        count = count - 1
        if count > 0 then return end
        reset_items()
        step_1()
      end)

    end

    reset_items()
    start()

  ]]
}


simulations.z_drop =
{
  init =
  [[

    player = game.create_test_player{name = "big k"}
    player.teleport({0, 1.5})
    game.camera_player = player
    game.camera_player_cursor_position = player.position
    game.camera_alt_info = true

    game.surfaces[1].create_entities_from_blueprint_string
    {
      string = "0eNqV1O9ugyAQAPB34TM2Bf9VX2VZjNVrR6KHAezWNL77oKZdV7XFb8LBj1O5u5B900OnBBqSX4ioJGqSf1yIFkcsGzdnzh2QnAgDLaEEy9aNtJEIwaFXWFZABkoE1vBDcjbQt3uNKlF3UplgD4152MyHT0oAjTACxiyug3OBfbsHZfWn87/LprFuJ7XdItGdaJmAhZuYkrN9yjbx4DJ6criX85YJl15pQvGbxKxESS0UVGOYz7iRtxuucmNvN1rlJt5uvMpNvd1klbvzdtNVbnZ3G1nWdmbiZUsavZcKdr2riend3951gQeBNhZUX6Bnsmbb/2nf1hcajBF41G6dglaeoOhtrDGgoC5cldqQUT3M3XbGFqp/etuvh/NZhPsi0Qsk9EWSF8hflQklcelbBrcS4/M9gMUre5L7ObNQsq4pjY5tmNfmmj/0cUpOoPR4r3YsSjOesiRNszQahl8Gf/Lk",
      position = {0,0},
    }

    reset_items = function()

    end

    fake_drop_to = function(entity)
      local stack = player.cursor_stack
      if not (stack.valid and stack.valid_for_read) then return end
      local name, count = stack.name, 1
      local inserted = entity.insert{name = name, count = count}
      if inserted == 0 then return end

      player.remove_item{name = name, count = inserted}
      player.surface.create_entity
      {
        name = "flying-text",
        position = {entity.position.x, entity.position.y - 0.5},
        text =
        {
          "",
          "-",
          inserted,
          " ",
          game.item_prototypes[name].localised_name,
          " (",
          player.get_item_count(name),
          ")"
        }
      }
      player.play_sound{path = "utility/inventory_move"}
    end

    fake_drop_at_cursor = function()
      local stack = player.cursor_stack
      if not (stack and stack.valid_for_read) then return end

      local drop_stack = {name = stack.name, count = 1}
      game.surfaces[1].spill_item_stack(game.camera_player_cursor_position, drop_stack)
      player.remove_item(drop_stack)
      player.play_sound{path = "utility/drop_item"}

    end

    step_1 = function()
      player.cursor_stack.set_stack({name = "iron-ore", count = 50})
      script.on_nth_tick(1, function()
        if game.move_cursor({position = {-3.5, -2.5}}) then
          step_2()
        end
      end)
    end

    step_2 = function()
      local repeat_time = 10
      local count = repeat_time
      local repeat_count = 15
      script.on_nth_tick(1, function()
        count = count - 1
        if count > 0 then return end
        count = repeat_time
        repeat_count = repeat_count - 1
        if repeat_count < 0 then
          step_3()
          return
        end
        fake_drop_at_cursor()
      end)
    end

    step_3 = function()
      script.on_nth_tick(1, function()
        local finished = game.move_cursor({position = {-3.5, 2.5}})
        if finished then
          step_4()
        end
      end)
    end

    step_4 = function()
      local repeat_time = 10
      local count = repeat_time
      local repeat_count = 10
      script.on_nth_tick(1, function()
        count = count - 1
        if count > 0 then return end
        count = repeat_time
        repeat_count = repeat_count - 1
        if repeat_count < 0 then
          step_6()
          return
        end
        fake_drop_to(player.selected)
      end)
    end

    step_6 = function()
      script.on_nth_tick(1, function()
        local finished = game.move_cursor({position = {2.5, -1.5}})
        if finished then
          step_7()
        end
      end)
    end

    step_7 = function()
      local repeat_time = 10
      local count = repeat_time
      local repeat_count = 10
      script.on_nth_tick(1, function()
        count = count - 1
        if count > 0 then return end
        count = repeat_time
        repeat_count = repeat_count - 1
        if repeat_count < 0 then
          step_8()
          return
        end
        fake_drop_at_cursor()
      end)
    end

    step_8 = function()
      script.on_nth_tick(1, function()
        local finished = game.move_cursor({position = {2.0, 2.0}})
        if finished then
          step_9()
        end
      end)
    end

    step_9 = function()
      local last_selected
      script.on_nth_tick(1, function()
        local finished = game.move_cursor({position = {6.0, 2.0}})
        if player.selected and player.selected ~= last_selected then
          last_selected = player.selected
          player.selected.insert("coal")
          fake_drop_to(player.selected)
        end
        if finished then
          step_10()
        end
      end)
    end

    step_10 = function()
      script.on_nth_tick(1, function()
        local finished = game.move_cursor({position = player.position})
        if finished then
          reset()
        end
      end)
    end

    reset = function()
      local count = 30
      script.on_nth_tick(1, function()
        count = count - 1
        if count > 0 then return end
        player.clear_cursor()
        for k, v in pairs (game.surfaces[1].find_entities()) do
          if v.type == "item-entity" then
            v.destroy()
          else
            v.clear_items_inside()
          end
        end
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

simulations.show_info =
{
  init =
  [[
    local assembler = game.surfaces[1].create_entity{name = "assembling-machine-1", position = {-4.5, -1.5}, force = "player"}
    assembler.set_recipe("iron-gear-wheel")

    game.surfaces[1].create_entity{name = "burner-mining-drill", position = {-1, -2}, force = "player"}

    local chest = game.surfaces[1].create_entity{name = "wooden-chest", position = {1.5, -1.5}, force = "player"}
    chest.get_output_inventory().insert{name = "iron-plate", count = 1}
    chest.get_output_inventory().insert{name = "iron-gear-wheel", count = 1}
    chest.get_output_inventory().insert{name = "electronic-circuit", count = 1}

    local lab = game.surfaces[1].create_entity{name = "lab", position = {4.5, -1.5}, force = "player"}
    lab.get_output_inventory().insert{name = "automation-science-pack", count=1}

    local pipe = game.surfaces[1].create_entity{name = "pipe", position = {4.5, 2.5}, force = "player"}
    pipe.insert_fluid{name = "water", amount = 100}
    game.surfaces[1].create_entity{name = "pipe-to-ground", position = {4.5, 1.5}, force = "player", direction = defines.direction.south}
    game.surfaces[1].create_entity{name = "pipe-to-ground", position = {5.5, 2.5}, force = "player", direction = defines.direction.west}

    game.surfaces[1].create_entity{name = "boiler", position = {1.5, 2}, force = "player"}
    game.surfaces[1].create_entity{name = "steam-engine", position = {-4, 2}, force = "player", direction = defines.direction.east}
  ]],
  update =
  [[
    game.camera_alt_info = (game.tick % 120) < 60
  ]]
}

simulations.pipette =
{
  init =
  [[
    player = game.create_test_player{name = "big K"}
    player.character.teleport{0, 3}
    game.camera_player = player
    game.camera_player_cursor_position = player.position
    pipette_delay = 40
    clear_delay = 60

    game.surfaces[1].create_entities_from_blueprint_string
    {
      string = "0eNqV1F1uhCAQAOC7zDNuFvxBvcqmadSdNiQ6GsCmxnj3ojbNZqstPBHA+RgnMDPU7YiDVmShnEE1PRkobzMY9U5Vu67ZaUAoQVnsgAFV3TqzuiIz9NpGNbYWFgaK7vgJJV/Yv8HG9oTR26ipavAhViwvDJCssgr3LLbJ9EpjV6N2+AnBYOiNi+ppPdNJUcxgcgNf1nSeFOGt8D+U+KwWv5nikm4Qv6TuZ+9KY7NviwM38XfzEDf1d2WIm/m7WYgr/d00xM393STELX7c2t0n1JEig9q6rYPb+Q1fn+HkAOZX/4xFSMac+8NxECwCasGDahHw6vh5yq7NbB2pfOh+DD5Qm/2DnCeyEJJnUhbSvf4v/R2wkg==",
      position = {-5,0},
    }

    step_1 = function()
      target_position = {-1, -1}
      script.on_nth_tick(1, function()
        if game.move_cursor({position = target_position}) then
          step_2()
        end
      end)
    end

    step_2 = function()
      local count = pipette_delay
      script.on_nth_tick(1, function()
        count = count - 1
        if count == math.floor(pipette_delay / 2) then
          player.pipette_entity(player.selected)
        end

        if count <= 0 then
          step_3()
        end
      end)
    end

    step_3 = function()
      target_position = {3, -1}
      script.on_nth_tick(1, function()
        finished = game.move_cursor({position = target_position})
        player.build_from_cursor{position = game.camera_player_cursor_position}
        if finished then
          step_4()
        end
      end)
    end

    step_4 = function()
      local count = clear_delay
      target_position = {-1.5, 0.5}
      script.on_nth_tick(1, function()
        count = count - 1
        if count == math.floor(clear_delay / 2) then
          player.clear_cursor()
        end
        if count > math.floor(clear_delay / 3) then return end

        finished = game.move_cursor({position = target_position})
        if finished then
          step_5()
        end
      end)

    end

    step_5 = function()
      local count = pipette_delay
      script.on_nth_tick(1, function()
        count = count - 1
        if count == math.floor(pipette_delay / 2) then
          player.pipette_entity(player.selected)
          game.camera_player_cursor_direction = player.selected.direction
        end

        if count <= 0 then
          step_6()
        end
      end)
    end

    step_6 = function()
      target_position = {0.5, 0.5}
      script.on_nth_tick(1, function()
        finished = game.move_cursor({position = target_position})
        if finished then
          player.build_from_cursor{position = game.camera_player_cursor_position, direction = 4}
          step_7()
        end
      end)
    end

    step_7 = function()
      target_position = {2.5, 0.5}
      script.on_nth_tick(1, function()

        finished = game.move_cursor({position = target_position})
        if finished then
          player.build_from_cursor{position = game.camera_player_cursor_position, direction = 4}
          step_8()
        end
      end)
    end

    step_8 = function()
      local count = clear_delay
      target_position = {-1.5, 1.5}
      script.on_nth_tick(1, function()
        count = count - 1
        if count == math.floor(clear_delay / 2) then
          player.clear_cursor()
        end

        if count > math.floor(clear_delay / 3) then return end

        finished = game.move_cursor({position = target_position})
        if finished then
          step_9()
        end
      end)

    end

    step_9 = function()
      local count = pipette_delay
      script.on_nth_tick(1, function()
        count = count - 1
        if count == math.floor(pipette_delay / 2) then
          player.pipette_entity(player.selected)
          game.camera_player_cursor_direction = player.selected.direction
        end

        if count <= 0 then
          step_10()
        end
      end)
    end

    step_10 = function()
      target_position = {2.5, 1.5}
      script.on_nth_tick(1, function()
        finished = game.move_cursor({position = target_position})
        player.build_from_cursor{position = game.camera_player_cursor_position, direction = 2}
        if finished then
          step_11()
        end
      end)
    end

    step_11 = function()
      local count = clear_delay
      target_position = player.position
      script.on_nth_tick(1, function()
        count = count - 1
        if count == math.floor(clear_delay / 2) then
          player.clear_cursor()
        end

        if count > math.floor(clear_delay / 3) then return end

        finished = game.move_cursor({position = target_position})
        if finished then
          reset()
        end
      end)

    end

    reset = function()
      local count = 60
      script.on_nth_tick(1, function()
        count = count - 1
        if count >= 0 then return end

        for k, v in pairs (game.surfaces[1].find_entities_filtered{area = {{0, -2}, {3,  2}}}) do
          v.destroy()
        end

        local belt = game.surfaces[1].find_entity("transport-belt", {-0.5, 1.5})
        belt.destroy()

        start()

      end)
    end

    start = function()
      local count = 60
      script.on_nth_tick(1, function()
        count = count - 1
        if count >= 0 then return end

        player.character.clear_items_inside()
        player.insert("transport-belt")
        player.insert("stone-furnace")
        player.insert("burner-inserter")

        step_1()

      end)
    end

    start()

  ]]
}

simulations.transport_belt =
{
  init =
  [[
    game.surfaces[1].create_entities_from_blueprint_string
    {
      string = "0eNq1muuOokoQx9+Fz7Lp+8VX2WwMajuHBIFAs9k5E9/9tLgqu0NpFceZL3OB+XVVdf/rAn5k22oIbVfWMVt/ZOWuqfts/f0j68u3uqjOf4vvbcjWWRnDMVtldXE8/xa7ou7bpov5NlQxO62yst6HX9man36sslDHMpbhQhp/ed/Uw3EbunTDjVHWh7JOl/LdP6GPid02ffq3pj6vmlC5/qZX2Xv6wX7T4wqX+zd9iLGs3/rzfV04Nj/DZkjXqhi6sN+cDU2XYjeE02n1aX1xWz/8arvQ93nVFPt05cH6Jq1+DUPdDmd/P3El3i/+FX4pvF+c4pdG+yW+wi2DdktQvLI37JDObffWNen75Sw/OAdqdOw3uxkiAHeQTB5sxRk9g/JolHhC4oxwQG9myRduJeeEI8qm6+/LLuwul83zveUCH3/3p6PThebIEk+2NLLCkw2NrPFkTSMbPFnRyBZPljSyowj/xhY44fO7XPu2KmOcP9t35lx9YguyhwRYHM9iYBzFHBmvMSIYLzFOAyt6KoXCquko8beNag6MV5QEwXPHXljEwbxpVCCA+BqnaZbiK54hgSVeV5YGxovM08ACsWmOsGkS36PeOwCxoAM4FFUfVtnlz5cp4Lpu19R5WxUxpDV3KffGc2eStubY7M/Xi5hXoRgtug8UcxqUdzkf0v15Wfehm40QZ2DU5/KE1AsqMUeRzQIym09B0i6o6jgr3aLWmE0rJDwk+QUtA8psxRa0DDgyX9Qy4AKiCL2qoJktF/QRfP60qQW1k2MKnlpQSRkKbOj1iWOSsrJ0MKBh5egVCdogT08tAEozTA9rRgTgmOb05ARZI+iyhqySdBRklaKrFnW6tKbkGg6iEbOKNvTZACU9belgVLLQjjxzMFTQPSHo7HnMwWRvMNK6bepzww0nZ09UQIwgc1Gn20jyeIPj4uWoSFxNzvVA7jGGPNXgdsqSSwiOSy9NQKo0njDEIM68ZeRpC+Wx5fTZiL10NNo1bRu6lwxHVpCHI4bpKe1dwP2w7WMx3voZKkekmDVN0R/OouY2q+lg4PmONfTHvDgbLb1NAx4TWkfvsSCUp6OAyDlGr/0SU/vdgieZqEduTpBrBxBGJ8kkKIqTd3lVMr4rd3moU2PynpScZHwodmEuLY1M9akt2Q6HQ+g2fflvGPPJ9WtuZYKIrulVYU6+M5ipwo9ADUTF0gUOvAtzjq5DnJsePzwBbnpGVyP08pDwwu0qmr8l87yr9YLc1aFi6SXmmfXDUNL7QiiSBF3cSqpFeWnoijOAkZaOsgDKYRuIm9QsJtt6T9ewgd5nLxAKyOJofzXFX84E/q07mxj5snfuTGI9UzTH6NoCg79EXA6CmUnAwU30E8pTiXJm8Zvo/iC/eDZouslkoBcMBpy5Ja1Fbkef/InUTHDm6Z/1cq9/3fT/ozb57MyjuSdXv8M0y8APmOpLYnHZ76ZOO74ru91QRtKU+WN1+QjgevKJwVX2My1yEY7jynphubHWO3k6/Qf2REee",
      position = {2, 2},
    }
  ]],
  init_update_count = 720
}

simulations.inserters =
{
  init_update_count = 350,
  init =
  [[
    game.surfaces[1].create_entities_from_blueprint_string
    {
      string = "0eNqdlumOmzAQgN/Fv6HCBgLkVVYrxDGklsBGttk2jXj3DmRzbGOKvfzhMP7m8FwXUvcTjIoLQ44XwhspNDm+XYjmJ1H1yzdzHoEcCTcwkICIaljejKqEHqUyYQ29IXNAuGjhNznSOdjdDD00RvEmBAHqdA5ROKiuauCJw+b3gIAw3HC4arS+nEsxDTUoFHTH6anWpjJcChQxSs3XRxSOmJAF5Iy3bF70+gfBHDR6IUY3YEBarnDbupQEpJ66DlSp+R8k0uh+WQTHW3581Z+yH+lVIj58lcks5MSDTL3I6Z084Qmpk5J432RH2+zgHhRinJbQeRF18BGVOkiSk9kQlbn7K/FyV+4Ojr3AhTvYL3Ro5BE7fuRHrnKhQWFuWZjbIXOwMR/Jq40UEHaTEtaEpZ9UWwWgj0zsKm3CXlatVblHsmCB2w8rmjxZ3HGBa2HzE/R/8zBa7b79X2owhouTXv5TMMgPKCdc69F70JZLRcWlruo1BOT6+Vonb3KVFKFUi0MazB8s7yke8CDbZbFCU6Fa1bnX7Xerg1Kfo4ucTu6R3r8kqiO2PfOEtYEyR1C0w8ldQ+mzm8RWSuHjqdjFU8w9I+kW15aPjDpzIy8uc+bGXlz3fsm8uIlHo0k3yfsNjaXOBiReBvh0ymLfgO2CxjK3Qknp952UO9dM+vWY/UqmURNYp8HCZ6LMbYg4+v5Emb84bHOgxMl4HaiPT8N7QD6wAVy35jTJCpbRQ5YVh8M8/wWWbOjY",
      position = {0, 0},
    }

    local furnaces = game.surfaces[1].find_entities_filtered{name = "stone-furnace"}
    global.furnace_1 = furnaces[2]
    global.furnace_2 = furnaces[1]
    local chests = game.surfaces[1].find_entities_filtered{name = "wooden-chest"}
    global.chest_1 = chests[1]
    global.chest_2 = chests[2]
    script.on_nth_tick(600, function()
      global.furnace_1.clear_items_inside()
      global.furnace_1.insert("coal")
      global.furnace_2.insert("coal")
      global.furnace_2.insert("iron-ore")
      global.chest_1.insert("iron-gear-wheel")
      global.chest_2.clear_items_inside()
    end)
  ]]
}

simulations.long_inserters =
{
  init_update_count = 350,
  init =
  [[
    game.surfaces[1].create_entities_from_blueprint_string
    {
      string = "0eNqlVutyoyAUfhd+646QqNFX6XQcoseUGQIOYLvZTN59j9raNNEGWn+pyHc5Fzxnspc9dEYoR8ozEbVWlpRPZ2LFQXE5vHOnDkhJhIMjiYjix+HJGa5sp42L9yAduUREqAb+kpJeooebQULtjKhjUGAOpxjJwbS8hiscdnmOCCgnnIBJ0fhwqlR/3INBohnO9nvruBNaIUWnrRhvkRxhkoicSBlnl0HWDQLzEHQHyD4AI7Lv2xZMZcU/xKDJfC1QbWYqoVqhcCmuX8C6e/yYJn/SiQNvxnhMGyoLzgl1sMOHBo76Faoe1yRKhaYaIoxLLZcWIjK9nuL2TlzrrgMTd5K7wVat+yHlKDsiR90MX3AXS+CjqDmZz0uB285u3jRuVate2LWVBaB0BpJaHeIXjrQNRt+CQfkLgDexaYTBxI3r2QJ85qmTPpCZzzgthieWmjeL6ubU0a/aMF7vfaB71/VDu9xx7D7L2WkF8RuXconig2FZaeGFknwPQpO1Nv/GMrtNCFtCpgHINAj5s5l7LCJzMFjfzRp2sQo9Z0qolUTRjb+HbZCFbYiF9LGF9WKjqb8HFuQh8wfeBAHnYf2xWSnt3U9PHOZz4NAiTCVbVsmSoDZe8cr8my2o1RgLUrfm0b+NggqFbb1xgyqbpQHdmf7ifGH+LRR0vLA8wEDxm9OF7fz+l8Pf4KdBKrwHKvo1zWHjlDM9XIZJdBxgy6thOSKvOGBNend0mxcsp1meFxmOmv8BO++5HA==",
      position = {0,-2},
    }

    local chests = game.surfaces[1].find_entities_filtered{name = "wooden-chest"}
    global.chest_1 = chests[1]
    global.chest_2 = chests[2]
    script.on_nth_tick(600, function()
      global.chest_1.insert("iron-gear-wheel")
      global.chest_2.clear_items_inside()
    end)
  ]]
}

simulations.boiler =
{
  init_update_count = 100,
  init =
  [[


    for x = -8, -7, 1 do
      for y = -3, -1 do
        game.surfaces[1].set_tiles{{position = {x, y}, name = "water"}}
      end
    end

    game.surfaces[1].create_entities_from_blueprint_string
    {
      string = "0eNqVlN1ugzAMhd/F11ARfguvMk0VUMMiQYiSsI5VvPsCtJSKVOm4SuzkyzkW9hWKpkcuKFOQXYGWHZOQfVxB0prlzRRTA0fIgCpswQGWt9NOKsxbF1lNGcLoAGVn/IGMjJ8OIFNUUVw482Y4sb4tUOgDG0LH0L3kTaOpvJP6Ssem9zTGJcEhcmDQq/QQjaOz4/hvcayYYMVgg6UStNSeUNSDqwuCospLNKjzF2asfZ+p0PfmXDgdvKA4cdGd+1vQuwd7mdf6HeI9PgeKvqp0TtLf55RBafgw3BdS5TN+J827KzMQopXQVZX86gS6vG+5wV90rxrRVXvyGBu48crllJvKFW5xBkBiAwQWwNEG8C2A9G2AZwYQbyUUHW106NVfsyupb8IRmyDvJuiFIeKbO3UHCjYcu6zAIsumKvxn95NX5Y7+1/4LR4+meYhlm5nnwDcKuTg+kjBJ/YTESZIm4Tj+AWXcon0=",
      position = {0,0}
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
    game.surfaces[1].create_entities_from_blueprint_string
    {
      string = "0eNrFmd2yojAMx9+l13CGlhbEV9nZcVCipzNQmFLOrnvGd9+C5/ixWyTxRu8U+CVN+k9C/WTbeoDOauPY+pPpXWt6tv7xyXp9MGU9/uaOHbA10w4aFjFTNuM3Z0vTd6118RZqx04R06aC32zNT9Hiw9tW12BvHhKnnxED47TTcDY/fTluzNBs/Z1rfnkWatg5q3cxGLCHY+wdB7svd+DxXdt7QmtGw56aROzI1jFPvKFKW//cdE1GbDvs92A3vf7jkTy5fEbf/7EsLpa12WvjL8Wd7gLWYvmmzgZXb2pa2vn2TQ/OaXPox/u+UL2DcoxHB3bn7ZUHmLz1QfK/lG6wo1ue1rTVeHvp4qbtfZQD/qVo//hL/JMX//ph27ty8mguVasQQWFX+JoFZlj3XrM/8ot7o1exa+ODbQdTPdrAuXcwgFrhUXwBVaBRSySeoFFL6+NPVZmYizNV3JcZQSozXDyRJzFtpNvSFiKnT6QNR5b0LOLAip5THPgq1gYqPTTxJdFdWweTq74N8JlNcxWYVy3U8e4dvBQfkZIZ0lVfdWsO8Xvpm2Plt14P1u++EDK9Rd6tPgsZKObadwDNZ9GhwIoE34aSe/KjOvir/Fr4TR3kD+tgDeVMIRQcr4OCFFdB0G42SxYhcvrvzPSgGvDgquUygT8mqEXCAiBbBCysAd/DMlri8B2toOWtQM8sL1JDmpCLzXf9mimEKX+iunBMNFPxBBlVttKUQE5IPks8eUUCKzy4IIEzPDgjgXM8OCeBV3iwIoGv8t17AT1ShaRsN5ngHZYUhyVBe4IEJkgvJYFTdIhJipYE3ZEELQm6I1U3mWEjQQsEXnU0d/Gio8UXP5ySNprCa46kDMWxaSOVCIUXHKmkKXynI1UehdcbqbYrvNxIzUjhuxypeyq83EjtXt2+FJZVsCzwGVx0OX013TCe0f5PD8ypM++v/F4dwTnVQtN+wGbw12ovBag247mvv+TsAMGzM0JD5N/7MsXELaNMo4pEpkyjgkSmTKMpiSyfmKBFeM7P1BOs0cvxjH/6H2B9859DxD7A9mfHV1zmhch5ludFlp9OfwHsVwl5",
      position = {-2,-3}
    }
    global.chest = game.surfaces[1].find_entities_filtered{name = "steel-chest"}[1]
    script.on_nth_tick(2000, function() global.chest.insert("coal") for k, v in pairs (game.surfaces[1].find_entities_filtered{name = "boiler"}) do v.clear_items_inside() end end)
  ]]
}

simulations.low_power =
{
  init_update_count = 300,
  init =
  [[
    for x = -5.5, -3.5, 1 do
      for y = 0.5, 2.5, 1 do
        game.surfaces[1].create_entity{name = "iron-ore", amount = 500, position = {x, y}}
      end
    end
    game.surfaces[1].create_entities_from_blueprint_string
    {
      string = "0eNqVlu9ugyAUxd+Fz7IU5p/qqyxLg3rbkiEYwGVN47sPambdiit+U9HfPR7vuXhFtRig11xaVF0Rb5Q0qHq7IsNPkgl/zV56QBXiFjqUIMk6f2aUYBr3TIJAY4K4bOELVWRMnj4JAhqreYM7Lrk84VZzsWTQ8T1BIC23HCYpt5PLQQ5dDdoVCYpIUK+Me0ZJX9lxcPqSJejiDshLNnphfzj0UdJx0JI18AjbPWG9ziyrmTS90hbXIOwjKfshUUdKUMu1q31bpgFuGs1NN3GzaG6xiZtHc/NN3GLmCsVad+WBR3ZruGTuQ9kPFgXo+2jV+02qy5nL5dF1u73g5gwmwCXkN/jn/oMBa11KjL9PQ6c+4TC4NWFBQ3vwyXJLVg8Q6krvyWybi9qZuYi1mEsD2oZMnJto9/f10hCePAn1eiZJjH3knlDTMSHwXKVXIhBS792NPqmXwE/nWg3aTxFSvocqxOd2hsdJjw8u3i3AIVS26KK1DzdD4j5cfEwx2fTaRTR4lRsUvI/wgCwsCDHKbd30+k8z0VAz0XvamDHQ1cInoWPNmUvAdD1tU+SdAXwaU1pJbCxvPkKzipLNFkfNKnoP25EZ+8+QoGvY3O/ct82+WvxVJOgTtJnq7klalLQgeVGUeTGO34UiyZk=",
      position = {3,0}
    }
  ]]
}

simulations.electric_pole_connections =
{
  init =
  [[
    player = game.create_test_player{name = "big K"}
    player.character.teleport{-2, 2.5}
    game.camera_player = player
    game.camera_player_cursor_position = player.position

    game.surfaces[1].create_entity{name = "small-electric-pole", position = {-6.5, 0.5}, force = "player"}
    local right_pole = game.surfaces[1].create_entity{name = "small-electric-pole", position = {7.5, 0.5}, force = "player"}

    step_1 = function()
      player.cursor_stack.set_stack({name = "small-electric-pole", count = 50})
      script.on_nth_tick(1, function()
        if game.move_cursor({position = {0.5, 0.5}, speed = 0.1}) then
          step_2()
        end
      end)
    end

    step_2 = function()
      local count = 30
      script.on_nth_tick(1, function()
        count = count - 1
        if count > 0 then return end
        player.build_from_cursor{position = game.camera_player_cursor_position}
        player.clear_cursor()
        step_3()
      end)
    end

    step_3 = function()
      local count = 30
      script.on_nth_tick(1, function()
        count = count - 1
        if count > 0 then return end
        if game.move_cursor({position = player.position}) then
          step_4()
        end
      end)
    end

    step_4 = function()
      local count = 30
      player.cursor_stack.set_stack{name = "copper-cable", count = 100}
      script.on_nth_tick(1, function()
        count = count - 1
        if count > 0 then return end
        if game.move_cursor({position = {0.5, 0.5}}) then
          player.drag_wire{position = {0.5, 0.5}}
          step_5()
        end
      end)
    end

    step_5 = function()
      script.on_nth_tick(1, function()
        if game.move_cursor({position = right_pole.position, speed = 0.15}) then
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
        if game.move_cursor({position = {4, 1}}) then
          step_7()
        end
      end)
    end

    step_7 = function()
      local count = 30
      script.on_nth_tick(1, function()
        count = count - 1
        if count > 0 then return end
        if game.move_cursor({position = {0.5, 0.5}}) then
          player.drag_wire{position = {0.5, 0.5}}
          step_8()
        end
      end)
    end

    step_8 = function()
      script.on_nth_tick(1, function()
        if game.move_cursor({position = right_pole.position, speed = 0.15}) then
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
        if game.move_cursor({position = player.position}) then
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
    player = game.create_test_player{name = "big K"}
    player.character.teleport{0, 3.5}
    game.camera_player = player
    game.camera_player_cursor_position = player.position

    game.surfaces[1].create_entities_from_blueprint_string
    {
      string = "0eNqVk+FugyAUhd/l/sZGFKX6KkuzqL1pSRAM4JwxvHvRLlmzsXb+45Kc7x4u5y7QyhEHI5SDegHRaWWhflvAiotq5Hrn5gGhBuGwBwKq6ddq0BOaxE7CdVfwBIQ64yfU1JOXUuu0wmRqpHwQZv5EAJUTTuDdwFbM72rsWzSBHNOT4MMGiVZrt4BJaH4oCMzhVB0Kv7r5wcn+xXmJyb8xfSAkKLFzRnTJoCXGfNEvYBp4QYvicm31aNa3slOkAdvZgP3Nz2P8Iv6Vv8DpRqWxGZT7LD5xyGMO+T78swmXMf5xZ6JoGo9CtS9Rd0xI+7YV9cP+EfhAYzdJdqSMVxmnJecVZ97fAJfMMhY=",
      position = {0,0}
    }

    step_4 = function()
      local count = 30
      player.cursor_stack.set_stack{name = "copper-cable", count = 100}
      script.on_nth_tick(1, function()
        count = count - 1
        if count > 0 then return end
        if game.move_cursor({position = {-4.5, 0.5}}) then
          player.drag_wire{position = {-4.5, 0.5}}
          step_5()
        end
      end)
    end

    step_5 = function()
      script.on_nth_tick(1, function()
        if game.move_cursor({position = {-0.5, 0.5}, speed = 0.15}) then
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
        if game.move_cursor({position = {0.5, 0.5}}) then
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
        if game.move_cursor({position = {4.5, 0.5}}) then
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
        if game.move_cursor({position = player.position}) then
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
        local pole = game.surfaces[1].find_entity("power-switch", {0, 1})
        pole.disconnect_neighbour()
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
    game.surfaces[1].create_entities_from_blueprint_string
    {
      string = "0eNqtmdtuozAQht/F11CBsbGdV1lVESFuaokAMqa7VZV3X5NsSNuQ7swkl+HwzYEZz2/ng22a0fbetYGtPpiru3Zgq18fbHC7tmqma+G9t2zFXLB7lrC22k+/gq/aoe98SDe2CeyQMNdu7R+2yg/PCbNtcMHZE+n4433djvuN9fGBmeHaF9fGW2n9aocQ2X03xNe6drIaUWmunmTC3uM7/EkeTZxeWA82BNfuhulBb/fdm12P8V4TrLfb9eRpvBX8aBN2unry5GzXd226s5VPf79a20TDdTdO8edZlrB9t50eqkLa2Oro1iWywyG5iofP8bzEx9Omq7bx8kIw5edQts7b+nQ7Av6luBtDP07JvDJS3Er8gh1xTlpxZWmBLL66j8BfBSIW8HLGjzGLfudjprc32cVt1+ckufZGjkqUqQxg6vb3UPDvYVCfQ8PBGgU2cLBCgfMMTi5x5BxOxhV9zuFkiSNfOnXoGxfC4lrAz0wBIAq4rwXOVwknZzhyiVivcGR45yHB8M5D5sIg1iV+zwLIM4Qlddf6xy+teWvgmTsC4WCN8H0dx0uExZleUESKeKRIsU1MWBQqrk5r5+vRhYtO4SSdIpBCRfy3ML46fjaf/BBCdG3BM0nWIJOPS0TK+iMheoYrAlmAyBpRc7OoKAk191I1w3LR1V3fW5/W1aax95abgZab/hwJVhdn2NKZJYiCLN5FTuaXkI9efNs9/KAZ8lmIaIDfpA2DWu6mQlBgJSi/xP1BSZgqBXGDQCtMyg4BljLKFgFGNgQlryBlLjLC7gPks8gJPoNaU3CCOob5XBBmCIws8OoYBpZ4dQwDlxR1TGl/oSjqmNT8QkPVMSkQQ1DH5QPVscwoSkU/VKkcz/D6pgr2zuM7mSN1iqZUhORkHaGXh7IkTXgD6UlJmvcadBxInPeG0CeSOO8N6QNT5j3sa1DmPYxMORMEkUvKmSCMTJn3GkTmhNNGmM+gM8FZ3hsAEdGhHOerJJw2wsglQU/ByJQ9OYys8XoKBjZ4PQUCq4yipyjLq8opeoq0uCoO1VOkQAqCnjJkPfWcnP5KXX365zVhb1HfnBzWuVCGq7xUyujicPgLq2m7fQ==",
      position = {-1, 0}
    }
  ]]
}

simulations.splitter_filters =
{
  init_update_count = 800,
  init =
  [[
    game.surfaces[1].create_entities_from_blueprint_string
    {
      string = "0eNrNWttuozAQ/Rc/Q+Url/zKqooocbtIBBCY7lZV/n1N6JZ242Rnxn3oWwLkHM9wZjhj8soe2tkOY9M5tntlTd13E9v9eGVT89RV7XLMvQyW7Vjj7JElrKuOyzc3Vt009KNLH2zr2ClhTXewv9lOnO4TZjvXuMauSOcvL/tuPj7Y0V/wjtF0j03nT6X1Tzs5jz30k/9Z3y2sHioV0tyZhL34j1l+Z84k60/2k3Wu6Z6m5dLRHvtnu5/9udbZ0R72y1r9KTfONmHr0XUtf5nHvkufbDWmv35a23rqup+XDAjOE3bsD8tFlUtbW50XtsV2OiUXEcn3iB795WnbVwd/OBSO/hTMoRltvV7gId7S3M9umJeEXtCozzT/3IEQnXzPXnZBGCDQEQQXEekAgUETiOsRhAgymrb0V2rLtn6FXl9NndbNWM+N2+QlKfLK0fLSFHkVtNyZb527Ep07Q8md4BGloyHKFiKCYYkphPlP45qGtnHuSn74hvb/TiJURKUbSK8SOoJBgxi2bjV7jY1Po9fh4Sq8KG/Av0uo6a4pKMOxZRC2G4LNrz3JQ2QGmbkCA66R4CUGXOHAJceASyS4wIAj1SolBpwjwbdyvtUjeLHBXkhy7fbXevyq1L33of3omf1lrX0MKldqRKC8RAZqMOAZEjzDgOdIcExBc2TNSUxBc2S3kCWq83EV1WcVx7CVRVybVVvJX7UeZR4TjoS7tjLe8IZchFI04yi/70CnNNo2SpI8TISpU5DiUlkEgwzbRpVHWC91BbOg9UYJ8c6qpIErCLjmaK0IilY0cd9EEMrssWqncJ3V/TDYMa2rh9ZGjmZaRkiTg/YzYnZMBOjma8QEtRUBB6wd40Q+DGc8XF86o8EJUJ5z6qQkCI88XVAnJVrdlbRJCZQ5w2mTEgxc0IYZDtrKk7QxDLZyRVs5qGaNpnl82MoN7VEDA89oHh8GntM8Pgy8oHp8SocwJdHjkxpExhEenxJOJkgeX3yhx8/QrzhMScolbZZ4I/sqk3MeJoa2cjZyjsgi3qicYwph0oyBKSB1mtFswuXNDr6codqEwNoBVUO1CbfYbiiXZhNgtyWn2QQguCA9yYHgkvQkB4LTbEKgNYXANWjPc9unNeWFas7ihGxq5oa0ewtME8o2FEjwnLQdCwQvSFYNCE7bFYCBF5xk1YDggmTVgOCSaNVIXbpQNKtGa9KFhls1WjiGYtXeqChW7T5Z/5ez+/A3noQ9e0OzLrkQOi9lLrI8Lwt1Ov0BCV2ymA==",
      position = {-1, -1}
    }
    game.camera_alt_info = true
  ]]
}

simulations.belt_lanes =
{
  init_update_count = 850,
  init =
  [[
    game.surfaces[1].create_entities_from_blueprint_string
    {
      string = "0eNqtl9uOmzAQht/F17ACm1PyKlUVERhSS8RGPqyaRnn3GtgQKuxdm22uAoZv/hnPj+07OvcaBkGZQsc7og1nEh1/3JGkF1b34z11GwAdEVVwRRFi9XW8UqJmcuBCxWfoFXpEiLIWfqNj+vgZIWCKKgozabq4nZi+nkGYBxYGZR1lZihufoFUhj1waV7jbIxqUHH+lkfoZv5Ub/kUYX7+JEEpyi5yfE7Alb/DSZuxXoGA9jQKNUNd3UuI0Hx7VvKMKziLuQATseF6TDxPInTl7ThYq7iHepLzyujxiDZ54CWPntetufOJ/tKob6mAZh7NomdRuVaDHsu3wZMFD715T9AmBgbicovNVIHo6ga2ERNXuLPuOhAnSf8YYposP0vgbAks9VmqemJsIuFnJAshXwjaVFBchClyO/fJJzXKpzm2VokyR5GKXZGwO5J7PkpX628CZe44Fm7lzX0lkPqADzvAiQ84TfzJyVqyjZXuYCUO1suRcuipUlZPph+U5N9EsQ1IVp8qCcIKTJyTUtiQK3cpziDutGBWK38YLLVmmnsII2HCivD+9uuWHcbx6u90h3NcXRjglafITfK2DsJJuEY/cIBvcBAY+4NJEJiEO92rD3AWDvbqXJwH2N/LZLgIcz+27jvKAPP7yaqCLeo3M4dgrtfEkGTPsj+vxl/vu3asSF4LPcEBqjMn+etNESH+O9PKqyTZnnoX63q7xeZfis1WWgMrUewoebFnd0jK8FPN4b8eahpuTmvfOtCQyjuH7BspKKHhMR4SpwPlcXX+jNC7SWpeQao0Kw+4TIuyPBRm0f4LmOvRmQ==",
      position = {-1, 0}
    }
  ]]
}

simulations.underground_belt =
{
  init_update_count = 800,
  init =
  [[
    game.surfaces[1].create_entities_from_blueprint_string
    {
      string = "0eNqtmt1ymzAQhd9F1ziD/pDwq3QyHmyrKVMMHhBpMxm/e8FuHbdBzZ6N72Ign1ar3dVZ0KvYNmM49nUbxfpV1LuuHcT6y6sY6qe2auZr8eUYxFrUMRxEJtrqMP+KfdUOx66Pq21oojhlom734adYy9NjJkIb61iHC+n842XTjodt6KcHrowhdm1Y/aiaZuIeu2H6l66dR5wwK/1gM/Ey/SEf7OmUvcMoEJMvYzQJYz8wxmCUhC32Sqnbr3U73VrtvoUhLkxL/pnXbFB2fX4zhBjr9mmYn+vDoXsOm3G618TQh/1mXsLpVuzHkInL1csS3Ro/jbbrxjkcbJ6JQ7ef71Rx1YTqbMrbOi/NobjOoemq/XRlwXZ1Y/m+7sPucne6/DvUujEexzmo3uFdKgAXhsn/ctHtQAtgTwd7hFvSuSXClTkdXEBgSQc7CPyWseMUQv1TP0XZPoW2SfQ1Suo2ESRSY7UhkY7SYJhEbZCW7lAoZGWBOFR+7NB02kl63kloCvS0w1xDTzuFcFUOuFx/IoSVhHaU1B6pIEoiD5QGJu0+E2bKkJcNKpaKnoJQcVcFPS2g+FVAvkEJp/yH+/NcPblRW5IVjDSfFDCLYi5nKCh1TwMkWf4oToJoxdA/ihIYWuMCiAY2uAKigS2ugGjgAldANLDjKCDFSETtMemiE81RiWFUojvKcQVEcqiRHAXEyjyjYAVEm4KGFRCNa2AFRONahgLihLApIO2SiGDjIEoqgD1DAfHCrIQVEGnZbA4rIBpX4kKFBla4tKKBNVUBcaLWGlwB3VOAWEsWIObf6RWE6RUMgWXuOT/HMMDe0wBPdrDlOLhkCLz3K7n0Yi5nkC2JLHHpSDNZ4dKRBtY4mOYKg7uCBmaIXZorGGKXBnY4mOYKj7uCBi458vw/ZfQ/r7FzzlCWNRT4vcUuSyAHfm8xCYzGWwFSuDnDaQU4e6CznJE4m4ErcGeRIt3hr3Npi4C/zqVxS5hL8oPPYT/QuJLRJLEKiVdwm0fyuNcwl+YZw/AMq+55C3V+ibLnsS40UfW8Y/SPnNrkOY0qpzR5vE8lxV2J96k0roS5pHguFewHGlfjfTXNEQbvq2lgi4NprihwV9DAjvomgFWaS/KnFlZ9KxnfWszdD4ustn29+/52ZETmjDMj539C53LPpl7moEh2iU/9OaiSixQHO5aUNAc7l5S0xmKz8ikOtpmeMY/Z5eDZ+uacWiaep1i8vJLz0rhSOVk4VxbT878AW2S+Hw==",
      position = {-1, 0}
    }
  ]]
}

simulations.move_between_labs =
{
  init_update_count = 800,
  init =
  [[
    game.surfaces[1].create_entities_from_blueprint_string
    {
      string = "0eNq1VduOmzAQ/Rc/wwoTLoFfqSpkzECtgo18WTWN8u8dYJdmG7MhUZcnbM+cmTNzPD6TuncwaiEtKc9EcCUNKb+diRGdZP20Z08jkJIICwMJiGTDtOpZTS4BEbKBX6Skl+8BAWmFFbC4z4tTJd1Qg0aD1VHIVkg8CvkPMBYBR2XQTckpFEKFxUsakBP+ZC/pHGGxrwxYK2RnJjsNg3qFyuFZb0FDU03Z4VHLegMBWbaXTN4TVp0wVvDQcAGSQzgy/hPDc+Um6nEUBWRQzWTKbNgDm5P7y+9yCW5YxSurFs3DXrEGt28pHa8JNUIDX07R/624ytnRWeKJcVhjWM2kGZW2YQ29r3LZx8pdBUo8wMnO5Lcwsx3Jp/vbfviatjNn1cCmQP+z8dnKy7ja2Bnfw4m+MfJB5CsE9FhSjcoECbo7hXgVQbeMwy3i4R3wXxnVrm1BV0b8RkQarZ8n8HEN7JCj7jTWobkrqfRGUmv7hdzofvGEdKM90qXRUxzoNodtCVP6YeZtC3fK3Ocff+4f3XE/fO6e3HFPHu/BvhakjwPTXcDZ1cwwoK1/KG3lmvkg8z2Q9CHI4w7I+CHE4hlNx3evJT7M88tdXj30AXnFMbnMjiNN8iLOaZbnRYYa+gMBb6VK",
      position = {-2, -2}
    }

    game.forces.player.laboratory_speed_modifier = 3
    game.forces.player.technologies["logistic-science-pack"].researched = true
    game.forces.player.add_research("landfill")
    script.on_nth_tick(300, function() game.forces.player.research_progress = 0 end)
  ]]
}

simulations.drag_building =
{
  init =
  [[
    global.player = game.create_test_player{name = "kovarex"}
    global.character = global.player.character
    global.character.teleport{0, 0.5}
    game.camera_player = global.player
    game.camera_player_cursor_position = {0, 0}

    update_camera = function()
      game.camera_position = {global.player.position.x, global.player.position.y - 2}
    end

    step_0 = function()
      target_cursor_position = {global.character.position.x - 2.5, global.character.position.y - 4}
      update_camera()
      script.on_nth_tick(1, function()
        local finished = game.move_cursor{position = target_cursor_position}
        if finished then
          step_1()
        end
      end)
    end

    step_1 = function()
      global.character.cursor_stack.set_stack{name = "stone-furnace", count = 12}
      target_cursor_position = {global.character.position.x + 2.5, global.character.position.y - 4}
      script.on_nth_tick(1, function()

        local finished = game.move_cursor({position = target_cursor_position})

        if global.player.can_build_from_cursor{position = game.camera_player_cursor_position} then
          global.player.build_from_cursor{position = game.camera_player_cursor_position}
        end

        if finished then
          step_2()
        end
      end)
    end

    step_2 = function()
      global.character.walking_state = {walking = true, direction = defines.direction.east}
      local offset = {2.5, -4}
      script.on_nth_tick(1, function()

        game.camera_player_cursor_position = {global.character.position.x + offset[1], global.character.position.y + offset[2]}

        if global.player.can_build_from_cursor{position = game.camera_player_cursor_position} then
          global.player.build_from_cursor{position = game.camera_player_cursor_position}
        end

        if game.tick % 60 == 0 then
          game.surfaces[1].build_checkerboard({{global.character.position.x + 10, global.character.position.y - 10},
          {global.character.position.x + 25, global.character.position.y + 10}})
        end

        update_camera()

        if global.player.cursor_stack.count == 0 then
          step_3()
        end

      end)
    end

    step_3 = function()
      global.character.walking_state = {walking = false}
      local player_position = global.player.position
      target_cursor_position = {player_position.x + 3.5, player_position.y - 1}
      game.camera_player_cursor_direction = defines.direction.west
      script.on_nth_tick(1, function()

        update_camera()

        if game.move_cursor({position = target_cursor_position}) then
          step_4()
        end

      end)
    end

    step_4 = function()
      global.character.cursor_stack.set_stack{name = "transport-belt", count = 24}

      local player_position = global.player.position
      target_cursor_position = {player_position.x - 3.5, player_position.y - 1}

      script.on_nth_tick(1, function()

        local finished = game.move_cursor({position = target_cursor_position})

        if global.player.can_build_from_cursor{position = game.camera_player_cursor_position} then
          global.player.build_from_cursor{position = game.camera_player_cursor_position, direction = defines.direction.west}
        end

        update_camera()

        if finished then
          step_5()
        end

      end)
    end

    step_5 = function()
      global.character.walking_state = {walking = true, direction = defines.direction.west}

      offset = {-3.5, -1}
      script.on_nth_tick(1, function()

        game.camera_player_cursor_position = {global.character.position.x + offset[1], global.character.position.y + offset[2]}

        if global.player.can_build_from_cursor{position = game.camera_player_cursor_position} then
          global.player.build_from_cursor{position = game.camera_player_cursor_position, direction = defines.direction.west}
        end

        update_camera()

        if global.player.cursor_stack.count == 0 then
          finish()
        end

      end)
    end

    finish = function()
      update_camera()
      global.character.walking_state = {walking = false}
      global.character.direction = defines.direction.south
      script.on_nth_tick(1, nil)
    end

    step_0()
  ]]
}

simulations.drag_building_poles =
{
  init =
  [[
    global.player = game.create_test_player{name = "kovarex"}
    global.character = global.player.character
    global.character.cursor_stack.set_stack{name = "small-electric-pole", count=50}
    global.character.walking_state = {walking = true, direction = defines.direction.east}
    game.camera_player = global.player
    global.last_pole_x = -10
  ]],
  update =
  [[
    if global.stop then
      global.character.walking_state = {walking = false, direction = defines.direction.south}
      return
    end
    game.camera_position = {global.character.position.x, global.character.position.y - 1.5}
    local pole_x = global.character.position.x + 2
    game.camera_player_cursor_position = {pole_x, global.character.position.y - 3}
    if pole_x - global.last_pole_x > 6.9 then
      global.player.build_from_cursor{position = {pole_x, global.character.position.y - 3}}
      global.last_pole_x = pole_x
    end
    if game.tick % 60 == 0 then
      game.surfaces[1].build_checkerboard({{global.character.position.x + 10, global.character.position.y - 10},
                                           {global.character.position.x + 25, global.character.position.y + 10}})
     end
     if global.character.cursor_stack.count == 0 then
       global.character.walking_state = {walking = true, direction = defines.direction.south}
       global.stop = true
     end
  ]]
}

simulations.drag_building_underground =
{
  init =
  [[

    player = game.create_test_player{name = "kovarex"}
    game.camera_player = player
    game.camera_player_cursor_direction = defines.direction.east
    cursor_position = {0, 0}

    update_camera = function(event)

      local position = player.position
      game.camera_position = {position.x, position.y - 1.5}
      game.camera_player_cursor_position = cursor_position

      if event.tick % 60 == 0 then
        player.surface.build_checkerboard
        {
          {position.x + 10, position.y - 10},
          {position.x + 25, position.y + 10}
        }
      end
    end
    script.on_event(defines.events.on_tick, update_camera)

    move_cursor = function(speed)
      if not target_cursor_position then return true end

      local speed = speed or 0.1

      local dx = target_cursor_position[1] - cursor_position[1]
      dx = math.max(-speed, math.min(speed, dx))
      local dy = target_cursor_position[2] - cursor_position[2]
      dy = math.max(-speed, math.min(speed, dy))

      cursor_position[1] = cursor_position[1] + dx
      cursor_position[2] = cursor_position[2] + dy

      if cursor_position[1] == target_cursor_position[1] and cursor_position[2] == target_cursor_position[2] then
        target_cursor_position = nil
        return true
      end

    end

    build_offset = {3, -3.5}

    prepare = function()
      player.cursor_stack.set_stack{name = "underground-belt", count = 50}
      target_cursor_position = {player.position.x + build_offset[1], player.position.y + build_offset[2]}
      script.on_nth_tick(1, function()
        if move_cursor(0.2) then
          build_belts()
        end
      end)
    end

    build_belts = function()
      player.character.walking_state = {walking = true, direction = defines.direction.east}
      last_distance = 1
      last_x = 0
      script.on_nth_tick(1, function()
        cursor_position = {player.position.x + build_offset[1], player.position.y + build_offset[2]}

        if (cursor_position[1] - last_x) > last_distance then
          if player.can_build_from_cursor{position = cursor_position, direction = defines.direction.east} then
            player.build_from_cursor{position = cursor_position, direction = defines.direction.east}
          end
          if last_distance == 1 then
            game.camera_player_cursor_direction = defines.direction.east
            last_distance = 5
          else
            game.camera_player_cursor_direction = defines.direction.west
            last_distance = 1
          end
          last_x = math.floor(cursor_position[1])
        end

        if player.cursor_stack.count == 0 then
          finish()
        end

      end)
    end

    finish = function()
      player.character.walking_state = {walking = false}
      player.character.direction = defines.direction.south
      script.on_nth_tick(1, nil)
    end

    prepare()
  ]]
}

simulations.trains =
{
  init_update_count = 300,
  init =
  [[
    game.camera_position = {0, 0}
    game.camera_zoom = 1
    game.surfaces[1].create_entities_from_blueprint_string
    {
      string = "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",
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
    global.player = game.create_test_player{name = "kovarex"}
    global.character = global.player.character
    game.camera_player = global.player
    game.camera_zoom = 1

    step_1 = function()
      game.surfaces[1].create_entity{name="straight-rail", position = {-9, 7}, direction = defines.direction.east}
      global.character.cursor_stack.set_stack{name = "rail", count = 50}
      script.on_nth_tick(1, function()
        if game.move_cursor{position = {-8.5, 7}} then
          step_2()
        end
      end)
    end

    step_2 = function()
      global.wait = 60
      script.on_nth_tick(1, function()
        global.wait = global.wait - 1
        if global.wait == 0 then
          step_3()
        end
      end)
    end

    step_3 = function()
      game.activate_rail_planner()
      script.on_nth_tick(1, function()
        if game.move_cursor{position = {-0.5, 7}} then
          step_4()
        end
      end)
    end

    step_4 = function()
      global.player.raw_build_from_cursor()
      script.on_nth_tick(1, function()
        if game.move_cursor{position = {9, -5}} then
          step_5()
        end
      end)
    end

    step_5 = function()
      global.player.raw_build_from_cursor()
      global.wait = 60
      script.on_nth_tick(1, function()
        global.wait = global.wait - 1
        if global.wait == 0 then
          step_6()
        end
      end)
    end

    step_6 = function()
      game.deactivate_rail_planner()
      global.wait = 60
      script.on_nth_tick(1, function()
        global.wait = global.wait - 1
        if global.wait == 0 then
          step_7()
        end
      end)
    end

    step_7 = function()
      local rails = game.surfaces[1].find_entities()
      for _, rail in pairs(rails) do
        if rail.name == "straight-rail" or rail.name == "curved-rail" then
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

    local surface = game.surfaces[1]
    for x = -31, 31, 2 do
      surface.create_entity{name = "straight-rail", position = {x, -1}, direction = 2}
    end

    global.train_stop = surface.create_entity{name = "train-stop", position = {7, 1}, direction = 2, force = "player"}
    global.end_rail = surface.find_entity("straight-rail", {31, -1})
    game.forces.player.stack_inserter_capacity_bonus = 7


    script.on_nth_tick(1000, function()
      if global.locomotive and global.locomotive.valid then
        global.locomotive.destroy()
      end
      if global.wagon and global.wagon.valid then
        global.wagon.destroy()
      end
      global.locomotive = game.surfaces[1].create_entity{name = "locomotive", position = {-20, 1}, orientation = 0.25, force = "player"}
      global.wagon = game.surfaces[1].create_entity{name = "cargo-wagon", position = {-26, 1}, orientation = 0.25, force = "player"}
      global.locomotive.train.schedule =
      {
        current = 1,
        records =
        {
          {
            station = global.train_stop.backer_name,
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
            rail = global.end_rail,
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
      global.locomotive.train.manual_mode = false
      global.locomotive.insert("coal")
      global.wagon.insert({name = "iron-ore", count = 300})
    end)
  ]]
}

simulations.logistic_network =
{
  init_update_count = 60,
  init = [[
    game.surfaces[1].create_entities_from_blueprint_string
    {
      string = "0eNqF0uFqgzAQB/B3uc9JaWzVNa8yxoj26g40yZIoFcm7N1oYA6v9FC7c/5eD3ARV26N1pAPICag22oP8nMBTo1U734XRIkiggB0w0KqbK2cqY40LEBmQvuIdpIhfDFAHCoRPYynGb913FbrUsE4zsMangNHzSwnhOYMR5DFGtspnf/nWNOQD1bz+QR+4D8apBteaODw5fjzkr8TTlmiV9zQgt84MdE2tK/r0hj5v0aoO+3L+Rs63ZIe/fTr3phWvyWKLrPrbbW/GxUvfviyH/LdLDAZ0fglkH+JcXrJSFGV5KYoYHxGi0Yg=",
      position = {-1,0}
    }

    for k, position in pairs ({{-2, -1.5}, {-1.5, -0.5}, {-1, -1.5}}) do
      game.surfaces[1].create_entity{name = "logistic-robot", position = position}
    end

    for k, position in pairs ({{-2, 2.5}, {-1.5, 3.5}, {-1, 2.5}}) do
      game.surfaces[1].create_entity{name = "construction-robot", position = position}
    end

    local character = game.surfaces[1].create_entity{name = "character", position = {1.5, 2}, direction = 4, force = "player"}
    character.direction = 4
  ]]
}

simulations.personal_logistics =
{
  init_update_count = 600,
  init = [[
    game.surfaces[1].create_entities_from_blueprint_string
    {
      string = "0eNqtld2OozAMhd8l1zBqKD+lr7IaoQCmGwkSlJhqu1XffR3YYashnQU0vWkh6efj48S+s7IdoDdSITvfmay0suz8486svCjRund464GdmUToWMCU6NyT0aXutUH2CJhUNfxiZ/4I/vs3aKFCI6sQFJjLLaSwYBpRwRMnerwHDBRKlDBpGR9uhRq6EgwFmnF2KC0KlFpRiF5bOf6k4IQJaduNvvKH0/UJEa1QtCDOwICVQ9OAKaz8TQx+mD+eUMc5lFSNVLQUVj/Bokdx/JZMIZK3ZPRj2l9YQJTqYt0+A52+QjHQWktKoS6cw7TUiNZCwKbXk28fLiFAG/atQJdUpQdXaxIdsE7XboPAsAUxSppr+e6zLZ5zabWo6c0yh+NzBrU05O64So7/PRF6wH5wB2eBT2Y8GqGsO19hCa3PKv5hVfw5UOwBpzvAyRpwNoMb8o8OjwWDXl9mbkRcD+m0Q+JxjcR8eWeXyAl48Anjh6eiX6RFuivjAQ57Ya28QtgbfZX111lzf9acbzZwVdI8+gbRLyrFj9tLlbxAxdtR8QtUsr3PpN/aZqZOqpWzWppqkPiv20R7ug1P17abdE+34dl289MX5p+2jCTuv2f5/plExC9mEo3TcQqfn2Z9wK5UvsmrE4+zPMp4mmV5Rtr+ANarq/g=",
      position = {-3,0}
    }

    local roboport = game.surfaces[1].find_entities_filtered{name = "roboport"}[1]
    roboport.insert({name = "logistic-robot", count = 10})
    game.camera_alt_info = true

    game.forces.player.worker_robots_speed_modifier = 2
    game.forces.player.character_logistic_requests = true

    local character = game.surfaces[1].create_entity{name = "character", position = {1.5, 1.25}, force = "player"}
    character.character_running_speed_modifier = -0.5
    character.direction = 4
    character.set_personal_logistic_slot(1, {name = "steel-plate", min = 1000, max = 1000})
    character.set_personal_logistic_slot(2, {name = "electronic-circuit", min = 1000, max = 1000})

    script.on_nth_tick(600, function()
      character.clear_items_inside()
    end)

    script.on_nth_tick(1, function()
      character.walking_state = {walking = true, direction = ((game.tick / 45) % 4) * 2}
    end)

  ]]
}

simulations.requester_chest =
{
  init_update_count = 600,
  init = [[
    game.surfaces[1].create_entities_from_blueprint_string
    {
      string = "0eNqtmO2OojAUhu+lv2FCPwD1VjbGIBzdJtgybTHrGu59i8ywOJaxZfQPAu3T0/Px0vaK9nULjeLCoM0V8VIKjTa/rkjzoyjq/pm5NIA2iBs4oQiJ4tTfKbmXjVQGdRHiooI/aIO76Gk3owqh+37xHuppZ9JtIwTCcMNhMOB2c9mJ9rQHZekjQ7d7bQrDpbDcRmp++2tHtJjYNrvYy7rrjfmCICMCaiiN4mUMAtTxEtvZgzoUJTwSR2CE9u3hAGqn+V/LwMn4cwxFx6G4OHBhX8Xlb9DGYTF7S4ch0rf05o+h/U6DMVwcdd9OwUmeYdfad7W1FKpd71b76lDUGiI0PB789uklA1DHTV2YflKlbPsAW6MjdJJV36AwcQ3FzaQxgFuX29g4l1oWlX3yOAc6nUHFlfXu7a31+EcayNY0bR/wB3w6lxyO4N67ajIQc4CzBWDmA84XgKkPeDWCDzYwNis1KON0+MgllusgrScxO3JtbKrf8i9W8N7aqwtKp8wIfbTcTXPrM1GiZ1lmM+nRKJx4Oy69t2WaUi4w9nUcm+VmLi7xNjgPM5h6g7MwMPMGr8LA6VMV6MPr5o0qwMWMCODMWzAxvjc8TDCNasFVMDh//LQ9lt0wcOIErOZKrim05meIGyXPvPq+nLG7nPFP6jl5QTlHY+OvH1Epelu4Kltu/vchMxJAwiUg8UlPEqwAiY8AkHAB8DM3vP79uOHl78f1rv5kQfGTBcWfvLD2Se61tsTDUpA4Ea+o/plvOVkHLwu8Vhs0+YGoUH9RWaITFAfrBPVJZEpCdYL66ASlwTrhZy4L1gk/bhqsE37czFcn6AKdoHm4TtAX6gRdhS/8mbum6ToclbpRLFm0rR3ELA3b1jIcvq/NXrqtfSImC3a3xHd7my3Z3TIaHuhsJtAs5AgEO1epLF1+BmKJ3yTLNhqOejaTA6UInW34Bl+tMMvXJMdZnq+zvOv+AWqFHeQ=",
      position = {2,0}
    }

    local roboport = game.surfaces[1].find_entities_filtered{name = "roboport"}[1]
    roboport.insert({name = "logistic-robot", count = 10})
    game.camera_alt_info = true

    game.forces.player.worker_robots_speed_modifier = 1

  ]]
}

simulations.active_provider_chest =
{
  init_update_count = 600,
  init = [[
    game.surfaces[1].create_entities_from_blueprint_string
    {
      string = "0eNqdlFFugzAMhu/i51AV1paVq0wTCmBYpJCgxFTrKu4+BzpWDVpV44nE9vfbsZMLFLrHzilDkF1AldZ4yN4u4FVjpA57dO4QMlCELQgwsg0rZwvbWUcwCFCmwk/I4uFdABpSpHBijItzbvq2QMcOc7QytTJsisoP9MTUznoOsyboMSqKN3sBZ/45bPajwuSfeyRSpvHBz2FrT5j3bNOEDqs8pMimWmqPAqbtKZOrLrYdixbSOdSsWto+lB1vBbS2Cg6SIo1yTOm3qmEQi1qSuRbfF57kmPyiju21iDXCy0xAjSU5VUZo0DXniHuBrpYlLoHJD1BA0dc1utyrLwwlzN+K1G6W0lZWvPPgwMNxV8pxRqOVQ6/9tz11fej3Ar+f8eSk8WEsogL1w74mm79CK+DDP8Avz4DT5RwvkRNwu9a7138kFj+T2PHminh09LhXW0auQMI8z/1ulCcerfGiRZKlTxh1zp7U4zm4h47voT1ZJ5uVkd3dEvmFGN+R7ObZEXDiazoGJK/xLj0maXxI02O6G4Zv7V2Gtw==",
      position = {-1,-3}
    }

    local roboport = game.surfaces[1].find_entities_filtered{name = "roboport"}[1]
    roboport.insert({name = "logistic-robot", count = 10})
    storage_chest = game.surfaces[1].find_entities_filtered{name = "logistic-chest-storage"}[1]
    game.camera_alt_info = false

    game.forces.player.worker_robots_speed_modifier = 1

    script.on_nth_tick(1, function() storage_chest.clear_items_inside() end)

  ]]
}

simulations.buffer_chest =
{
  init = [[
    game.surfaces[1].create_entities_from_blueprint_string
    {
      string = "0eNqt0lFvhCAMAOD/0me4qPN0x19Zlot61TVRIIBmnuG/DzVnluDexlMh9GubdIG6H1Ebkg7EAtQoaUF8LGCpk1W/vrlZIwgghwMwkNWw3oyqlVbGgWdA8oHfIFL/yQClI0e4G9tlvstxqNGED0e2HWvrKkdKBlErS1sYagUmYTCD4IX3LBKyQ8AeG2eo4SjRdDMP/aNpqwZjMHuBDOqxbdHcLT2DkSbHOSn1Fo8ayfy60clZq/mR36uOrAutNl9oHdeVtTQh10ZN9AhfYza97PAanNnXv+x9vlh8gcm5V/xDr9lKhwXY1kT82ioGExq7ZWTvaV7esjItyvJW5t7/AL9E090=",
      position = {-2, -2}
    }

    local roboport = game.surfaces[1].find_entities_filtered{name = "roboport"}[1]
    roboport.insert({name = "logistic-robot", count = 2})
    buffer_chest = game.surfaces[1].find_entities_filtered{name = "logistic-chest-buffer"}[1]
    buffer_chest.set_request_slot({name = "iron-plate", count = 100}, 1)
    buffer_chest.set_request_slot({name = "copper-plate", count = 100}, 2)
    provider_chest_1 = game.surfaces[1].find_entities_filtered{name = "logistic-chest-passive-provider"}[1]
    provider_chest_2 = game.surfaces[1].find_entities_filtered{name = "logistic-chest-passive-provider"}[2]
    game.camera_alt_info = false

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
      character.set_personal_logistic_slot(1, {name = "iron-plate", min = 2, max = 1000})
      character.set_personal_logistic_slot(2, {name = "copper-plate", min = 2, max = 1000})
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
      string = "0eNptkdFuhCAQRf9lnnEjdld3/ZVNswE6WhIFM4xNXeO/L9LWNFFeCIR7Tu4wg+5GHMg6hnoGa7wLUN9nCLZ1qlvveBoQarCMPQhwql9P5LUfPDEsAqz7wG+o5fIuAB1btvjDSIfp4cZeI8UHWxo7NEzWZOiQ2imLdqRGGYyCwYdI8G5VR2omcwFT3Mto0mPTID2CfUaKzLe1iJ2s2GRh1IFVQu7p1z/4AeJt33YPuCRAfpQ/b/nOtzZw7Gs+MXAW2JNqD8uefnmny7KOMw29/vdHAr6QQkoUV3mubkUly6q6lbHBC9Mil0Q=",
      position = {-6,-3}
    }

    local roboport = game.surfaces[1].find_entities_filtered{name = "roboport"}[1]
    roboport.insert("construction-robot")

    local chest = game.surfaces[1].find_entities_filtered{name = "logistic-chest-storage"}[1]
    chest.insert("stone-wall")
    chest.insert("gun-turret")
    game.camera_alt_info = true
    game.forces.player.worker_robots_speed_modifier = 1

    script.on_nth_tick(360, function()
      if not global.ghosts_built then
        local bp_string = "0eNqV1NtqhDAQBuB3meu4mHjImldZSnHbYQnoKCa2Fcm711gKS5uguYww3/wOk6xw72YcJ00W1Ar6bSAD6raC0Q9qO//NLiOCAm2xBwbU9v5k7ECYfbZdB46Bpnf8AsUdOyx8zJTZeZrQPhUK98IAyWqr8af9flheae7vOG1yqDGDcTBbyUC+m2cuFYMFVMYvlfNZ/ijilFIcKEXoX/4ru5GHgPJUjPIgRnVKqX6VPKzUaUoki0wYiQgB16QYkRRNEhIZCM+TVq2IKDxp1WKKSNqUmFIkzSWmlEmK8Mp2qffLr54eGQYfOJm9QFx5KRsheS1lU9fOfQPQI3ms"
        local stack = game.create_inventory(1)[1]
        stack.import_stack(bp_string)
        local ghosts = stack.build_blueprint
        {
          surface = game.surfaces[1],
          force = game.forces.player,
          position = {4,1},
          force_build = true,
          direction = 0,
          skip_fog_of_war = false
        }
      else
        for k, entity in pairs (game.surfaces[1].find_entities_filtered{type = {"ammo-turret", "wall"}}) do
          entity.order_deconstruction("player")
        end
      end
      global.ghosts_built = not global.ghosts_built
    end)
  ]]
}

simulations.fluid_wagon_connection =
{
  init_update_count = 300,
  init =
  [[
    game.surfaces[1].create_entities_from_blueprint_string
    {
      string = "0eNrFmNtymzAQht9F15BBB05+lY7Hg0EQTUEwQiR1M373CgPGxnK96kWT3BgQH/9K2pO+0LEeeKeE1Gj3hUTeyh7tfnyhXlQyq8d7+tRxtENC8wZ5SGbNeKUyUaOzh4Qs+C+0w+e9h7jUQgs+vX+5OB3k0By5MgOub/a6ldz/zOra0Lq2N6+0cvyOwfiEvYUeOs2/zmfvAURAoNcceuXkg/rghX+x6FERJhdOYGwthOL59CyyENmNMgOr3vUzZjxJw/dMYmGGV2ZZD6Iw1lZm6CORrsRWCQPJpqfBWxxasBFYagiWGoOZFMxMwEwMZqZXZt3mbdNq8cEfgezphBLbhOIAqhQuFGMoEz6hmECZ8IXHFMqE73vMYO5p905qI4bwvTTZTu+hsQ26OtLIlL6JSd0zu7dme0bIvKsQbzp9QrYvgN3KrhrbmAk09iUXZARArl7ViY77uvUr1Q6ysFHn0EyeBPgAuPSLOBvjLt2orDKKMvnTlnBmMYkR83JXEuJuZbQFMxt4dSEhSyHNM3/8goUbzNz4wl1GH3qutZBVPw6bSZ+ZNmxD4CofA1hlbpq5NWnc3Mn0oPi0aZq2GIdn2m/aXiPrfDK44ezZjFoND8GGL9z0vxp+kymH4+KvD+KCycEDK2L1YF6buVAi97nkqjr5pujiqsxyi7lkIXroOJQlV4de/B51B9c/27ccPRszwBKld0WfPxeGFmY8rxAOIEtP3fx8K9WWhSmGSb1XagMR12SBY4A8x5qTBK8zEGVQB1oCB/63yIH/6kA1z554EAV7OPkmgRFUIPsmgbFTLbTdNbZERhPHqmK7vW0VFoUGimSZxxSSdFkAqrHmpgqnm0bttsoqRV3biiy2xo1uaLq/+E76Oq4x8gJGXGD0BYy5wBhsgRzXJwQ1VP7UURFoi8oix3aaANoKFjs2viBo4tj5gqCpY+sLgYYB7DiBui1ViN2aX5BU4tb8gpjUrfkFMZlb8wtiho6HZc/OuMLI7bBs4uxNyMzfeTHU81He6tbjdeqx8GbIdFh4H2I9k/+EPuStLC7fmTAG0mWKH+bzxHbMj/PvchgD8340YdsTO7PmVno//nvTqeXu5pDTQx9c9dPcJ5jFKYlxFMdpzM7nPyOo6Dg=",
      position = {0, 0}
    }

    player = game.create_test_player{name = "kovarex"}
    player.teleport({0, 2})
    game.camera_player = player
    game.camera_player_cursor_position = player.position
    game.camera_player_cursor_direction = defines.direction.south

    for k, v in pairs (game.surfaces[1].find_entities_filtered{name = "locomotive"}) do
      v.train.manual_mode = false
      v.insert("coal")
    end

    step_1 = function()
      local count = 30
      player.cursor_stack.set_stack({name = "pump", count = 1})
      script.on_nth_tick(1, function()
        if count > 0 then count = count - 1 return end
        if game.move_cursor({position = {-1.25, 0.75}}) then
          step_2()
        end
      end)
    end

    step_2 = function()
      local count = 30
      script.on_nth_tick(1, function()
        if count > 0 then count = count - 1 return end
        player.build_from_cursor({position = game.camera_player_cursor_position, direction = 4})
        player.clear_cursor()
        step_3()
      end)
    end

    step_3 = function()
      local count = 30
      script.on_nth_tick(1, function()
        if count > 0 then count = count - 1 return end
        if game.move_cursor({position = player.position}) then
          step_4()
        end
      end)
    end

    step_4 = function()
      local count = 300
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
    game.surfaces[1].create_entities_from_blueprint_string
    {
      string = "0eNqVmd1uozAQhd/F1yTyv01eZVVFlKDUWgIRkHSrKu++JtA0JZN6Rr1oKfjjeJgZH8wne61P1bELzcA2nyyUbdOzzZ9P1od9U9Tj/4aPY8U2LAzVgWWsKQ7jUVeEml0yFppd9Y9txOUlY1UzhCFU0/jrwce2OR1eqy5ecBtZnrpztVtdARk7tn0c0zbjjSJnpTP2Mf7ykb0LXVVOJ+0le0BKHPIJUQFEdSP2Q4Tt34ZnMt0MNT+hDoBqLPQJUwBMg4ym4DNTppkWx7xDAhCHjqAQE0c5iONvnLot20M7hHMFaPli6Di9tgsRUkynOcDMsdp+lzYGYOaMmGbVD+0RgKgbJIs3nHXFq5o9g6iCHjkDypPkacIcRRekQJAmC4I5hi5IgCBLFgRz6MkucxD0ne1l0e3b1Xuxj2OfypHuId3HRnyOx20XL2hOdQ3dhlwAsFzJ6fMGK0kKsiCYI1EVufoqSbnosPpHgQa4QCW9HiRYWJJcD0841EVA8sW0IShxFVgyDcR0yPTmay6EE96ZL/ha5EaJ6/P6me9rY02uuRXeCMOFttprNY5Ll4H01FVeOMQkczIVsc4rjgudWc/Tv4L12ua5HOP4GDcrrI8hdc5op432SuXoyClBtDICYY+UpEIdwsgpmt0UoJlRmuQwBcJkKfwiNjcrsOMp9BL2K8VRxYCNSHmiGJiSU8WALkFzohiYIqhiQIegJVEMTLlfedqmik2ghpT49dQAYnMEMRqHcQmMwWFsAmNxGJPAOBxGJzCe+LzhB5XjxIjfxRiOw/AERqAwKYpEUVJTUrRCAMNrcAmceNQGl7+JvDO49E0UgcFlb6IijUdREu3BUPsv2Dgtsf3CEGr3BSdkic0XhiiiFHChtZomBYYYkqdZuhHItFpLMThLIvT+YB3RBi/dHGQRLdWxL30nZBFtTvOdSyYUT8eJTJd2jE7QXvOWb2QgU5Le8iISgiiiMJ9OH6dpwjzimRhi8iiBgFpSLV73JxNJ7hylFpdECRE9LRuXE1fjnn5fvlW7Uz1v6n9vxo7H/u789M3gcRdlsfOZsfciDNuybXZXARM2Qo9FV23nLw1tF6+b/x7CYdz4HUL5tx8Tl/PLy/iTTd8jNnefLzJ2rrp+CocX2uXSCetcHl+DL/8BnQgcKg==",
      position = {0,-8}
    }

    player = game.create_test_player{name = "kovarex"}
    player.teleport({0, 4.5})
    game.camera_player = player
    game.camera_player_cursor_position = player.position

    locomotive = game.surfaces[1].find_entities_filtered{name = "locomotive"}[1]

    step_1 = function()
      locomotive.insert("coal")
      locomotive.train.manual_mode = false
      locomotive.train.go_to_station(1)
      player.cursor_stack.set_stack({name = "gate", count = 10})
      game.camera_player_cursor_direction = defines.direction.east
      script.on_nth_tick(1, function()
        if game.move_cursor{position = {-3.5, 0.5}} then
          step_2()
        end
      end)
    end

    step_2 = function()
      local count = 30
      script.on_nth_tick(1, function()
        if count > 0 then count = count - 1 return end
        player.build_from_cursor{position = game.camera_player_cursor_position, direction = 2}
        step_3()
      end)
    end

    step_3 = function()
      local count = 0
      script.on_nth_tick(1, function()
        if count > 0 then count = count - 1 return end
        if game.move_cursor{position = {-2.5, 0.5}} then
          step_4()
        end
      end)
    end

    step_4 = function()
      local count = 0
      script.on_nth_tick(1, function()
        if count > 0 then count = count - 1 return end
        player.build_from_cursor{position = game.camera_player_cursor_position, direction = 2}
        step_5()
      end)
    end

    step_5 = function()
      local count = 30
      script.on_nth_tick(1, function()
        if count > 0 then count = count - 1 return end
        if game.move_cursor{position = {2.5, 0.5}} then
          step_6()
        end
      end)
    end

    step_6 = function()
      local count = 30
      script.on_nth_tick(1, function()
        if count > 0 then count = count - 1 return end
        player.build_from_cursor{position = game.camera_player_cursor_position, direction = 2}
        step_7()
      end)
    end

    step_7 = function()
      local count = 0
      script.on_nth_tick(1, function()
        if count > 0 then count = count - 1 return end
        if game.move_cursor{position = {3.5, 0.5}} then
          step_8()
        end
      end)
    end

    step_8 = function()
      local count = 0
      script.on_nth_tick(1, function()
        if count > 0 then count = count - 1 return end
        player.build_from_cursor{position = game.camera_player_cursor_position, direction = 2}
        step_9()
      end)
    end

    step_9 = function()
      local count = 30
      script.on_nth_tick(1, function()
        if count > 0 then count = count - 1 return end
        if game.move_cursor{position = player.position} then
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
    game.camera_position = {0, 0}
    game.camera_zoom = 1
    game.surfaces[1].create_entities_from_blueprint_string
    {
      string = "0eNq1m91O6zoQhd8l1wV5/B9e5QihUiJ2tEtSpYF9EOq7b6dN2hIMXQvOuWur9Mt4MuNZ9jhvxf36udp0ddMXN29FvWqbbXHzz1uxrR+b5Xr4rX/dVMVNUffVU7EomuXT8K1b1utityjq5qH6t7iR3e2iqJq+7uvq8P/9l9e75vnpvurSBe/+eTXSF8Wm3ab/tM1wo8S50vHaLYrX9MmkT+kGD3VXrQ5X6N3iA1cfuX0CN1fbvt3ksGGElu+RflFs++Xhc9HXq9/LInMTAxrvONvtEbt67l6qh6u9Uz9irR+pfmZ8humOzO3gkMdf/adUGanhsqUetNTEvKUmwwywpabELY04NeDUEqc6nCoKxxoCKziWiAHRMFYTD0xOybVuV+1T29cvVY5pz5htVyfMmLfqOrgc2OL2EqEgeIZpJhY8jmViAc8yzcTCKc1Wy+6xvfqzfEzXfoRK+PypDe6pm5f0U9ula5rn9Tp3Kzz3hAg7jeeeENGh8dwTIjq0Rv2tfupvbfAREIGo8WwUIhA1no1McODJyMQGnotMaBAVj6ASWYdTDZx0DBROOWL8Bi52xKMycGoRUWVAFTmUb1SaGUJFTmll3mNDDgvLyMlWDUADJs7lJM7dXJxnfQDn1XEin7lActQSdIGbXKAuQ63iF1caWqAIuboyF1ZX97nVldX08gqzHly2iSW5cCmTT/ySk6vW0VQBQsOT6lpAdW0Dr64F8G3k1TWCLXl1DWCd4tU1ghVWXct31Z7TvLpGRmB4dY1gLa+uEaxj1fX3/e15dY2MIPDqGsFGWl0j1JJW1wDVK1pdI1Sh1TVC1bS6RqiGVdcI1LLqGoE6Vl0jUM+qawQKJxaRAB6XlsyTgtOKmVmCApcXMa9Xszu/cFJ9VnNyiiRolqrLywIqwEk1Vfg5NWurpakBsNWhQvqoeLVPijeHgpNp0ktzA7PDDjTVAcOO5JpKz5aVNgeFs2nSoXNTcw6IiqYCi8oomAP0mKNa5R551PSiX4BQj4bHArEecSloQx6btdahPblxwST28hZF9FheGjWlpfj5QjQXoxHc+kgeOILtHJw1OHIBJRrwbEn3+8QAnTlFN/wgrNAdPwir6Y4fhDV0xw/CWrrjB2HRHJs2JebhldMUpaeX4kD1LwO9PAamxDLSVGBGLOmKFS7PBKLoilVefliihN4fACZvUZrGAvpClAEDVsaAtYhjwX17rbLM/HkCx+orh1hKa8GAhECg93IcEgKR3yJCQqBkBTvQDxH8AMhEBRoXQpz/OK4EAc+enf+4kAWHiFWIAwy48+ZPdn7vFAFxGqTM+iR/0sbRW1kI1dNbWQg10FtZCBU8CSI/foB8Rxo500R3pBEo3ZFGoBrq5MQv/JzFGnYrDrHVsltxCNSxW3EI1NNbcQg10FtxCBVclYnPzb95ZEk3uZETfYre3wPKmkGPEIuZVrsKWeyKQfvPclqfz8E+CzZQ+3yKrPlu7LvmefvJ0WQ5O//xdZdbk8ajTTF3XZZaYjjQ1XWp/H4r7MP0E2zUwYekUpNQd2Z/HTT1G7YeChKkbDmEoFQ1/HYXUQxbDBHjLVkLISZZCiEmUwkFLYSWLISQpWQdhJhkGYSYbBWEoIGZ/cyFyS97ckjOjotgk5/+OPfdplutflUPz+vxzZVTUA3fU4VO2uvsosPbMbOZeVH8Wdb93aptHvb3PZASZ7PsqrvxDZq2S9eNn/v6aYjZ4VDUdtj5VbvbYYDzl1F+yPUDdg9+P6j0wFMafT2o+/9pUPf/0aCS9ftXkm7O3mBaFC9Vtz1EUEwRWOogPoTSx93uL6VzQsw=",
      position = {-12,-16}
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
    game.camera_position = {0, 0}
    game.camera_zoom = 1
    game.surfaces[1].create_entities_from_blueprint_string
    {
      string = "0eNq1mtuO4kgMht8l1+mo7Dpzt/saqxbKQDQdLSQohJ5ptXj3rZAADTiNLc1qLkahky+/XS6Xq5zP7MfmUO26uumzxWdWr9pmny3++cz29c+m3Ay/9R+7KltkdV9tszxryu1w1ZX1JjvmWd2sq9/ZAo6veVY1fd3X1fj86eJj2Ry2P6ou3XB5cnXo3qv1ywmQZ7t2n55pm+FFifOCKs8+0v8msdd1V63GP7pj/oDEC3LfJ9rPt34OCnaE2lsoElDNh2o21PChwIZaNjSymY7N9GymZzP5oxR40UTHkiaAkS2SP+qg+MPOhzInkmGbDux5JFDJnkYCdxqe5YFvOX8K4aQTbqmeorqbJPkyJVJqrhdTxOvCPk934G+5q7eybubpWgYPwgG7cwRQTPak8mwmsufUOZNyoNc5tWlX7bbt6/eKCgJbKG8Qgh9dqwqrLViHg4Pbrk7YcrxfFSqGYKzyqKJKN3iHUUdjNQw3PypA7vLoTm9GhlGaGYZ4CUO4jxRSKnManoVSCMtDgPqG4ZgM8w3D81x0nkrq3j/U9MfACiZXOGWNO4eSKaarx0hKP4PF6JXy1qWAijGo6dbHl0eeRV5ikVYsi0D9LyZp4Jl0yaY8m5A7O+yEtfdYQ2H55SOOSc9Tgamvc2ygpCzftztS3MTI0+sm72Z/ZxTRsohX3ldDv9L/Sg9ty+ZQbpYn0H65qbd1T+cg7WQrAO0Mz5Ie/7D0IFxoaO2RpX3aSvwx8Ya/Stp58QakwRxJDMqCgIZo4XDQFCP0C02xUr8AkBxmoXjOQDBkNorjZQ6eURN4auIzNVE4UrQcq5hpXz/RY0E45jN6UDzomuRo6cIDmrPyWCMMAlqdlQ4ejXFSn9MYz6zLJ5N8YcBHsuSg6EE8onSACbc5NMVJNzYzGN5W5uz2UKCL06bkvkijijGH0oGlVYrLJCBXKCcNepoiDnoaIw56GuPFviFXKReEvqEp4mxOYry0IJnBiCsSJJO5F1f/CJwk7LXM5zPqjNDnMxgr9PkMxgmPJhzDT150huCen0r4IKulEOlqwUfZ0QRDWlCywmpOWgDZiQdHGgqLrFltmrlSm8LE6wEafrf+hBC0hWC9c4hKRfReG02eEQQjPcjFyPCO5WYJLC722OfHzsHJemEan59nBC/piNwTyRZLkDQaWMQoO2O+HyOyb6MkTQGOygjCHM5RidKMzoFydxJwTnr6YREjHWCYXC3DWl6KAChidCrqKUdo/ZgayCQQnbQffEI/k+2lDWEWNUg7wixqFLaEOVBQStgU5lFB2BbmUVHYx+VRtbCRy6MaWd+VB7WyHPsIfc2z/eqtWh8204cc19k6XCPkGHKt8rQ5T5vNtPBH++WR8dORu7Po21PMX2XdL1dtsz6pGd+R3rAru2o5fWrSdum+82cnTZm0vScrh9/q1b/7Yd+qjq/Dv3z8KmXx5SOWPHuvuv1oTADjU90AzvuYcsbxPxgGVWM=",
      position = {-8, 14}
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
    game.camera_position = {-1, -1}
    game.camera_zoom = 1
    game.surfaces[1].build_checkerboard({{-16, -9}, {16, 9}})
    game.surfaces[1].create_entities_from_blueprint_string
    {
      string = "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",
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
      game.surfaces[1].create_entities_from_blueprint_string
      {
        string = "0eNqVkd0OgjAMhd+l15sRRKd7FWPMwAabsEK2+UMI7+6AG4xGw11P037npO0gr27YOOIAugMqavagjx14KtlUQy+0DYIGCmhBABs7KOM92rwiLqU1xZUYZQq9AOILPkEn/UkAcqBAOPFG0Z75ZnN0ceA3SUBT+7hc85AgAmW22gpoY7FebaOPw4KmWK5mWaJx8nFFrGKGD690qVcy9/oC3CwE/uNlC3lvtxguPf5Gz14p4I7OjxvpPsnUIVXJTqmDWvf9C5Gbou0=",
        position = {0, -1}
      }


    player = game.create_test_player{name = "big k"}
    player.teleport({0, 2.5})
    game.camera_player = player
    game.camera_player_cursor_position = player.position
    game.camera_alt_info = true

    update_player_selected = function()
      player.update_selected_entity(game.camera_player_cursor_position)
      local selected = player.selected
      if not selected then
        if fake_source_box then
          fake_source_box.destroy()
          fake_source_box = nil
        end
        return
      end

      if copy_source and copy_source ~= selected then
        if fake_source_box then
          fake_source_box.destroy()
        end
        fake_source_box = game.surfaces[1].create_entity{name = "highlight-box", box_type = "copy", source = copy_source, position = copy_source.position}
      end

    end

    step_1 = function()
      script.on_nth_tick(1, function()
        local finished = game.move_cursor({position = {-4.5, -0.5}})
        update_player_selected()
        if finished then
          step_2()
        end
      end)
    end

    step_2 = function()
      local wait = 30
      copy_source = player.selected
      game.surfaces[1].play_sound{path = "utility/entity_settings_copied"}
      last_selected = player.selected
      script.on_nth_tick(1, function()
        wait = wait - 1
        if wait >= 0 then return end
        local finished = game.move_cursor{position = {4.5, -0.5}}
        update_player_selected()
        local selected = player.selected

        if selected ~= last_selected then
          last_selected = selected
          selected.copy_settings(copy_source, player)
        end

        if finished then
          step_3()
        end
      end)
    end

    step_3 = function()
      local wait = 30
      script.on_nth_tick(1, function()
        wait = wait - 1
        if wait > 0 then return end
        local finished = game.move_cursor({position = player.position})
        update_player_selected()
        if finished then
          reset()
        end
      end)
    end

    reset = function()
      local reset_tick = game.tick + 60
      script.on_nth_tick(1, function()
        if game.tick >= reset_tick then
          for k, v in pairs (game.surfaces[1].find_entities_filtered{name = "assembling-machine-2"}) do
            if v ~= copy_source then
              v.set_recipe(nil)
            end
          end
          copy_source = nil
          start()
        end
      end)
    end

    start = function()
      local start_tick = game.tick + 60
      script.on_nth_tick(1, function()
        if game.tick >= start_tick then
          step_1()
        end
      end)
    end

    start()

  ]]
}

simulations.copy_paste_trains =
{
  init =
    [[
      game.surfaces[1].create_entities_from_blueprint_string
      {
        string = "0eNrFlV1OwzAMx+/i5w7ls0l7AC6BEOq6aER0SWmziWrq3UlaGEh4sDzx0qix/YvzdyyfYdsdTT9YF6A+g229G6F+OMNo967p0l6YegM12GAOUIBrDulvaGwHcwHW7cwb1HR+LMC4YIM1a/zyMz2542FrhuhwiRxDjN0/h82CKKD3Y4zyLh0VSRtewBQXNc/FDwq7lSJ/gfDcVCRGEZmpoBB5gXS+9Qcf7MlczYNEuf1gI6JZjeQuxre+80NyjB9SwD5tV0RqzbjUUlLCJK9IyaLrNtm00oJTripVSaKEKJn+MDfJLCpNeMWojAsVJS8ZJ6LUCk2/zFWSYxR1kwjyqgYIUmcWB82ryr0dxSiUZOaCU3L7B6dk9g8O+eqfxHCbMfgeyWNF8FiwnR1Mu5pi14yfpYP7pntJlf7PJ0xFprDoU6HyJk34n5JMr4ESQgE7o8wrHp6oyrwuLlpmf+GQ3P7CJ0Jme0VInFTLLKu/jb4CTmYYF2emqVAVU7RU8YWxeX4HlPhDmA==",
        position = {0, -1}
      }


    player = game.create_test_player{name = "big k"}
    player.teleport({1, 2.5})
    game.camera_position = {1, 0.5}
    game.camera_player = player
    game.camera_player_cursor_position = player.position
    game.camera_alt_info = true

    update_player_selected = function()
      player.update_selected_entity(game.camera_player_cursor_position)
      local selected = player.selected
      if not selected then
        if fake_source_box then
          fake_source_box.destroy()
          fake_source_box = nil
        end
        return
      end

      if copy_source and copy_source ~= selected then
        if fake_source_box then
          fake_source_box.destroy()
        end
        fake_source_box = game.surfaces[1].create_entity{name = "highlight-box", box_type = "copy", source = copy_source, position = copy_source.position}
      end
    end

    step_1 = function()
      script.on_nth_tick(1, function()
        local finished = game.move_cursor({position = {-3, -1.5}})
        update_player_selected()
        if finished then
          step_2()
        end
      end)
    end

    step_2 = function()
      local wait = 30
      copy_source = player.selected
      game.surfaces[1].play_sound{path = "utility/entity_settings_copied"}
      script.on_nth_tick(1, function()
        wait = wait - 1
        if wait >= 0 then return end
        local finished = game.move_cursor{position = {5, -1.5}}
        local last = last_selected
        update_player_selected()

        if finished then
          local selected = player.selected
          selected.copy_settings(copy_source, player)
          step_3()
        end
      end)
    end

    step_3 = function()
      local wait = 20
      script.on_nth_tick(1, function()
        wait = wait - 1
        if wait > 0 then return end
        local finished = game.move_cursor({position = {3, 3}})
        update_player_selected()
        if finished then
          local selected = player.selected
          selected.copy_settings(copy_source, player)
          step_4()
        end
      end)
    end

    step_4 = function()
      local wait = 30
      script.on_nth_tick(1, function()
        wait = wait - 1
        if wait > 0 then return end
        local finished = game.move_cursor({position = player.position})
        update_player_selected()
        if fake_source_box and not player.selected then
          fake_source_box.destroy()
          fake_source_box = nil
        end
        if finished then
          reset()
        end
      end)
    end

    reset = function()
      local reset_tick = game.tick + 60
      script.on_nth_tick(1, function()
        if game.tick >= reset_tick then
          for k, v in pairs (game.surfaces[1].find_entities_filtered{area = {{1, 0},{5, 3}}}) do
            if v.color then
              v.color = nil
            end
          end
          copy_source = nil
          start()
        end
      end)
    end

    start = function()
      local start_tick = game.tick + 60
      script.on_nth_tick(1, function()
        if game.tick >= start_tick then
          step_1()
        end
      end)
    end

    start()

  ]]
}

simulations.copy_paste_filters =
{
  init_update_count = 750,
  init =
    [[
      game.surfaces[1].create_entities_from_blueprint_string
      {
        string = "0eNrVWdtuozAU/Bc/Q4Uv3PIrqygi4KSWiImM6W4U5d/XhCbNNrCcY9qHvoWA58wczxjLnMm27uTRKG3J6kxU2eiWrH6dSav2uqj7/+zpKMmKKCsPJCC6OPRX1hS6PTbGhltZW3IJiNKV/ENW9BLMDq6bopLmYRC7rAMitVVWyaH89eK00d1h655c0ftYpXdKu1th+Spb6zCPTeuGNbqv5qDC9CUOyMn9SF7ia4Xh+U0rrVV63/bPGXlo3uSmc/dqK42sNj1Bd2tX1K0MyPD3wORW1zQ63MvChL9fpaxd4bLp+qbRKArIoan6hwob1rK40rq3Y33pO/JJD/vci2cdyaOKShlZDnfd0PemNp09dn3vn+D51Dw9lxH/tuuhkBgBFvO8+QRcAuAdw6eZfs80y9rxdVOtyrBUpuyU/Zhp5jPTCVhS9BOMm84agC3wbQb2LUfZNp9lHS9wLY3Ac5z8ENdS6rGCCMhUUOaBHIOQOd49MMoCDwxjHHv0goGQEw9kDkJO8c2AUfYIP4xxDu/FPZ8RBJlFHl1+Qk7GkBH5i3HIH/lrj7WydvQlLgZE+tSF2/IztegMq+TGbSgb48r2K67cja6aDLFJ4ZMS2RgyPK+9NTHIiMBSnJXggUUCw/PKcEbyyCsMOAc4dNKgY7theExjlB04PKUCBwx/SeJWLM7xayGsxwIPDGPsETkY4wQPDGOcoqMMI5yhcWF8c7TZQHxFhMYF8RUfqevcJtbsjdvoVnNm4yOvstvhhJ7Y2AuGNzVoryM4RgJdIkHgXQ6TECMkLFKAfzPCBKQIAYtclKFzABOQAw6R3gEzNOs48klZMt2f/5z60Hkh1F8I88manxA+K2SBDuEROD8Z8ayMBb5KPGLnJyOFnybeCuUexzLWdHLsDCXO8KeZX1o/B9f/jvIJ/lTMv/w6GD4xrB4+ZwTkTZp22GNnVKQ5S2mSpnnKL5e/ZEFBiA==",
        position = {-1, 1}
      }

    player = game.create_test_player{name = "big k"}
    player.teleport({0, 1.5})
    game.camera_player = player
    game.camera_player_cursor_position = player.position
    game.camera_alt_info = true

    update_player_selected = function()
      player.update_selected_entity(game.camera_player_cursor_position)
      local selected = player.selected
      if not selected then
        if fake_source_box then
          fake_source_box.destroy()
          fake_source_box = nil
        end
        return
      end

      if copy_source and copy_source ~= selected then
        if fake_source_box then
          fake_source_box.destroy()
        end
        fake_source_box = game.surfaces[1].create_entity{name = "highlight-box", box_type = "copy", source = copy_source, position = copy_source.position}
      end
    end

    step_1 = function()
      script.on_nth_tick(1, function()
        local finished = game.move_cursor({position = {-4, -1.5}})
        update_player_selected()
        if finished then
          step_2()
        end
      end)
    end

    step_2 = function()
      local wait = 30
      copy_source = player.selected
      game.surfaces[1].play_sound{path = "utility/entity_settings_copied"}
      script.on_nth_tick(1, function()
        wait = wait - 1
        if wait >= 0 then return end
        local finished = game.move_cursor{position = {4, -1.5}}
        local last = last_selected
        update_player_selected()

        if finished then
          local selected = player.selected
          selected.copy_settings(copy_source, player)
          step_3()
        end
      end)
    end

    step_3 = function()
      local wait = 30
      script.on_nth_tick(1, function()
        wait = wait - 1
        if wait > 0 then return end
        local finished = game.move_cursor({position = player.position})
        update_player_selected()
        if fake_source_box and not player.selected then
          fake_source_box.destroy()
          fake_source_box = nil
        end
        if finished then
          reset()
        end
      end)
    end

    reset = function()
      local time = 150
      script.on_nth_tick(1, function()
        time = time - 1
        if time > 0 then return end
        copy_source = nil
        local splitter = game.surfaces[1].find_entity("splitter", {4, -1.5})
        splitter.splitter_filter = nil
        splitter.splitter_output_priority = "none"
        start()
      end)
    end

    start = function(time)

      local time = time or 150
      script.on_nth_tick(1, function()
        time = time - 1
        if time > 0 then return end
        step_1()
      end)
    end

    start(800)

  ]]
}

simulations.copy_paste_requester_chest =
{
  init =
    [[
      game.surfaces[1].create_entities_from_blueprint_string
      {
        string = "0eNqFkt1ugzAMhd/F10kF9IeVV5mmKqSGWoKEJmEaQ3n3GVqhaqVbbqxE9nfOiTxC2fTYOTIBihFIW+OheB/BU21UM72FoUMogAK2IMCodro5W9rOugBRAJkzfkGRRvHvmPIe27IhU8tW6QsZlNkDIosfAtAECoQ3G/NlOJm+LdGxxrMBAZ31PGDNpMoQuRcwQJHEyc+v+exvJ0+s7eYGk8lmzzYdappToUFXD9JfCJuzxGtPXctSsCK5XSQbW5MPpKW+oA/SB+tUjSsB0rsq17UQu1dEx0a4cs/LINk6cr8gsUEdHCPvEXkx0FVKr/hMZmLO/1L2VYXu5OmbEWmynBWlw6Lk+9IHNfNeoI9x2od5g4qHPRXwic7PzdlbusuPWZ4e8vyYb2P8ASSf7zY=",
        position = {-1, 4}
      }

    player = game.create_test_player{name = "big k"}
    player.teleport({0, 3.5})
    game.camera_player = player
    game.camera_player_cursor_position = player.position
    game.camera_alt_info = true
    roboport = game.surfaces[1].find_entity("roboport", {-5, 0})
    roboport.insert({name = "logistic-robot", count = 5})
    game.forces.player.worker_robots_speed_modifier = 1
    game.forces.player.worker_robots_storage_bonus = 8
    storage_chest = game.surfaces[1].find_entity("logistic-chest-storage", {-1.5, 1.5})
    requester_chest = game.surfaces[1].find_entity("logistic-chest-requester", {3.5, 2.5})

    update_player_selected = function()
      player.update_selected_entity(game.camera_player_cursor_position)
      local selected = player.selected
      if not selected then
        if fake_source_box then
          fake_source_box.destroy()
          fake_source_box = nil
        end
        return
      end

      if copy_source and copy_source ~= selected then
        if fake_source_box then
          fake_source_box.destroy()
        end
        fake_source_box = game.surfaces[1].create_entity{name = "highlight-box", box_type = "copy", source = copy_source, position = copy_source.position}
      end
    end

    step_1 = function()
      script.on_nth_tick(1, function()
        local finished = game.move_cursor({position = {3.5, -0.5}})
        update_player_selected()
        if finished then
          step_2()
        end
      end)
    end

    step_2 = function()
      local wait = 30
      copy_source = player.selected
      game.surfaces[1].play_sound{path = "utility/entity_settings_copied"}
      script.on_nth_tick(1, function()
        wait = wait - 1
        if wait >= 0 then return end
        local finished = game.move_cursor{position = {3.5, 2.5}}
        local last = last_selected
        update_player_selected()

        if finished then
          local selected = player.selected
          selected.copy_settings(copy_source, player)
          step_3()
        end
      end)
    end

    step_3 = function()
      local wait = 30
      script.on_nth_tick(1, function()
        wait = wait - 1
        if wait > 0 then return end
        local finished = game.move_cursor({position = player.position})
        update_player_selected()
        if fake_source_box and not player.selected then
          fake_source_box.destroy()
          fake_source_box = nil
        end
        if finished then
          reset()
        end
      end)
    end

    reset = function()
      local time = 60
      script.on_nth_tick(1, function()
        if game.surfaces[1].count_entities_filtered{name = "logistic-robot", limit = 1} > 0 then return end
        time = time - 1
        if time > 0 then return end
        requester_chest.clear_items_inside()
        requester_chest.clear_request_slot(1)
        requester_chest.clear_request_slot(2)
        copy_source = nil
        start()
      end)
    end

    start = function()
      storage_chest.clear_items_inside()
      storage_chest.insert("steel-plate")
      storage_chest.insert("advanced-circuit")

      local start_tick = game.tick + 60
      script.on_nth_tick(1, function()
        if game.tick >= start_tick then
          step_1()
        end
      end)
    end

    start()

  ]]
}

simulations.copy_paste_spidertron =
{
  init =
    [[

    player = game.create_test_player{name = "big k"}
    player.teleport({0, 2.5})
    game.camera_player = player
    game.camera_player_cursor_position = player.position
    game.camera_alt_info = true

    source_spider = game.surfaces[1].create_entity{name = "spidertron", position = {-4, 1.5}, force = "player"}
    source_spider.color = {1, 0, 0, 0.5}

    paste_spider = game.surfaces[1].create_entity{name = "spidertron", position = {4, 1.5}, force = "player"}

    update_player_selected = function()
      player.update_selected_entity(game.camera_player_cursor_position)
      local selected = player.selected
      if not selected then
        if fake_source_box then
          fake_source_box.destroy()
          fake_source_box = nil
        end
        return
      end

      if copy_source and copy_source ~= selected then
        if fake_source_box then
          fake_source_box.destroy()
        end
        fake_source_box = game.surfaces[1].create_entity{name = "highlight-box", box_type = "copy", source = copy_source, position = copy_source.position}
      end
    end

    step_1 = function()
      script.on_nth_tick(1, function()
        local finished = game.move_cursor{position = {source_spider.position.x, source_spider.position.y - 1.5}}
        update_player_selected()
        if finished then
          step_2()
        end
      end)
    end

    step_2 = function()
      local wait = 30
      copy_source = player.selected
      game.surfaces[1].play_sound{path = "utility/entity_settings_copied"}
      script.on_nth_tick(1, function()
        wait = wait - 1
        if wait >= 0 then return end
        local finished = game.move_cursor{position = {paste_spider.position.x, paste_spider.position.y - 1.5}}
        local last = last_selected
        update_player_selected()

        if finished then
          local selected = player.selected
          selected.copy_settings(copy_source, player)
          step_3()
        end
      end)
    end

    step_3 = function()
      local count = 30
      script.on_nth_tick(1, function()
        if count > 0 then count = count - 1 return end
        local finished = game.move_cursor({position = player.position})
        update_player_selected()
        if finished then
          reset()
        end
      end)
    end

    reset = function()
      local count = 60
      script.on_nth_tick(1, function()
        if count > 0 then count = count - 1 return end
        copy_source = nil
        paste_spider.color = {1, 0.5, 0, 0.5}
        start()
      end)
    end

    start = function()
      count = 60
      script.on_nth_tick(1, function()
        if count > 0 then count = count - 1 return end
        step_1()
      end)
    end

    start()

  ]]
}

simulations.ghost_building =
{
  init =
  [[
    player = game.create_test_player{name = "big k"}
    player.teleport({0, 2})
    game.camera_player = player
    game.camera_player_cursor_position = player.position
    game.camera_alt_info = true

    step_1 = function()
      player.cursor_stack.set_stack{name = "stone-furnace"}
      script.on_nth_tick(1, function()
        if game.move_cursor({position = {-5, -1}}) then
          step_2()
        end
      end)
    end

    step_2 = function()
      script.on_nth_tick(1, function()
        local finished = game.move_cursor({position = {5, -1}, speed = 0.1})
        player.build_from_cursor
        {
          position = game.camera_player_cursor_position,
          alt = true
        }
        if finished then step_3() end
      end)
    end

    step_3 = function()
      script.on_nth_tick(1, function()
        if game.move_cursor({position = player.position}) then
          reset()
        end
      end)
    end

    reset = function()
      local reset_tick = game.tick + 60
      player.cursor_stack.clear()
      script.on_nth_tick(1, function()
        if game.tick >= reset_tick then
          for k, v in pairs (game.surfaces[1].find_entities_filtered{type = "entity-ghost"}) do
            v.destroy()
          end
          start()
        end
      end)
    end

    start = function()
      local start_tick = game.tick + 60
      script.on_nth_tick(1, function()
        if game.tick >= start_tick then
          step_1()
        end
      end)
    end

    start()
  ]]
}

simulations.ghost_rail_building =
{
  init =
  [[
    player = game.create_test_player{name = "kovarex"}
    player.teleport{-10, 3.5}
    game.camera_player = player
    game.camera_position = {0, 0}
    game.camera_zoom = 1
    game.surfaces[1].build_checkerboard({{-16, -9}, {16, 9}})
    game.surfaces[1].create_entities_from_blueprint_string
    {
      string = "0eNqVms1u4kAQhN9lziby9PzzKlG0IomVtQQmAmd3EfK7L6wvkZZSd52IE/joSZfb5Slf3ev+a/g8jdPstlc3vh2ns9s+X915/Jh2+/vv5svn4LZunIeD69y0O9yPzvNxGja/d/u9Wzo3Tu/DH7f1y0vnhmke53FYKf8OLj+mr8PrcLq94dHnO/d5PN8+cpzu33bDbHx+Sp273H/qn9KydP+BxAgqGigYQVEDRSMoaaBkBIkGykZQ0EDFCOo1UDWCvAZqNlDVOL63gZoKMipbFbY3KlsVtjcqWxW2NypbFbY3KlsVtjcqWxW2typbBRmVrZ4h3qZstSCxCVutR2y6Vv/TYpO12nqxqVrVothErZ4cYtO0eraKTdL6ddGmaHWeiU3Q6oAVo55VQQeboPVrULApWr8qBpuk9et0sGladw7BJmrdywSbqnWbFmyyNti0whq+BkCVBVUAauTIBwXFnuSAeqLnJj7CCIdBqwpk41E5keSgehLb9gJAmQVlACpk31FBrPVA9TSu8QCTSOMBVpU82XdUjpAcVE9g254AKLKgCECJ7DsqKJMcVE/hGo8wlcOgVTWy76Cc3JMcUE/+rufTbvz4OW9uL487v5LC0rn38TS8rX+UR1SxU5OdGkhFBLDmSHIEcBInCYTJHAatqpCKQOVUkoPqafRWGNjl6VkQ2i7y7M0w4AjJQfUErvEIE8lbaoBJZN9RObS1BhzWWaN6WGON6iF9NdpqJG01qKZyrhpROFONlkR6alQMaalRNayjBnOwsoYazMFKzmWEIccyWhU7lYH/aOxQBv6jkX4aYUg7jVbFumng7htrpoG7b+RMRhhyJKNVsRMZ3Ds3diKDe+dGeumGshbSS1fEYVNEnP6wMSImsTkiJrFBIiYlMgDEpExmkphUyAgQkyqZSmJS40JAnAH2XCyJQZ4LATFIuFgSgwIXAmJQ5GJJDEpcCIhBmYslMYhMEzGI3NLDIG5PD2fSPZVKYo6nUkDMESqVxJxApYCYE6lUEnMSlQJiTqZSScwpVAqIOZVKJTGncSEgfjai52JJDPJcCIhBwsWSGBS4EBCDIhdLYhCZJmIQ6a9X0Eu3Prq2/fakW+d+DafzugNafSxNis+ltBKX5S8wT2da",
      position = {0, 0}
    }

    start_rail = game.surfaces[1].find_entities_filtered{name = "straight-rail"}[2]

    step_1 = function()
      player.cursor_stack.set_stack{name = "rail", count = 50}
      script.on_nth_tick(1, function()
        if game.move_cursor{position = {start_rail.position.x + 0.5, start_rail.position.y}} then
          step_2()
        end
      end)
    end

    step_2 = function()
      local count = 30
      script.on_nth_tick(1, function()
        count = count - 1
        if count > 0 then return end
        game.activate_rail_planner({ghost_mode = true})
        step_3()
      end)
    end

    step_3 = function()
      script.on_nth_tick(1, function()
        if game.move_cursor{position = {start_rail.position.x + 26, start_rail.position.y}} then
          step_4()
        end
      end)
    end

    step_4 = function()
      script.on_nth_tick(1, function()
        if game.move_cursor{position = {start_rail.position.x + 26, start_rail.position.y + 8}, speed = 0.1} then
          player.raw_build_from_cursor{ghost_mode = true}
          step_5()
        end
      end)
    end

    step_5 = function()
      local count = 30
      script.on_nth_tick(1, function()
        count = count - 1
        if count > 0 then return end
        game.deactivate_rail_planner()
        player.clear_cursor()
        reset()
      end)
    end

    reset = function()
      local count = 30
      script.on_nth_tick(1, function()
        count = count - 1
        if count > 0 then return end
        if game.move_cursor{position = player.position} then
          for k, ghost in pairs(game.surfaces[1].find_entities_filtered{name = "entity-ghost"}) do
            ghost.destroy()
          end
          start()
        end
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

simulations.copy_paste =
{
  init =
  [[
    game.surfaces[1].create_entities_from_blueprint_string
    {
      string = "0eNqdk90KgzAMhd8l11Xwt9pXGWP4E0ZBo7R1TKTvvqo3gznQ3iUl/c7hkCxQdxOOSpIBsYBsBtIgbgto+aSqW9/MPCIIkAZ7YEBVv3ZGVaTHQZmgxs6AZSCpxTeIyN4ZIBlpJO6krZkfNPU1Kjfwj8FgHLT7NtCq6lBBWoQZg9lVZRlmTqOVCpt9IrbsBx17oV1lD2DJBVh+zWd6Ac2voTOvCPIz6NwLzY/T5V4RnPJZePnMVp9udbc1F19XweCFSu9qRZTyMuZRznlZJNZ+ADm2DbE=",
      position = {0, 0}
    }

    player = game.create_test_player{name = "kovarex"}
    player.teleport{-10, 3.5}
    game.camera_player = player
    game.camera_position = {0, 0}
    game.camera_zoom = 1
    game.surfaces[1].build_checkerboard({{-16, -9}, {16, 9}})
    player.cursor_stack.set_stack{name = "copy-paste-tool", count = 1}

    reset = function()
      player.cursor_stack.set_stack{name = "copy-paste-tool", count = 1}
      for k, v in pairs (game.surfaces[1].find_entities_filtered{area = {{3, -2}, {10,  10}}}) do
        v.destroy()
      end
      game.camera_player_cursor_direction = defines.direction.north
      step_1()
    end

    step_1 = function()
      script.on_nth_tick(1, function()
        if game.move_cursor{position = {-1, -2}} then
          game.activate_selection()
          step_2()
        end
      end)
    end

    step_2 = function()
      script.on_nth_tick(1, function()
        if game.move_cursor{position = {2, 1}} then
          game.finish_selection()
          step_3()
        end
      end)
    end

    step_3 = function()
      script.on_nth_tick(1, function()
        if game.move_cursor{position = {5, -0.5}} then
          player.raw_build_from_cursor()
          step_4()
        end
      end)
    end

    step_4 = function()
      local count = 30
      script.on_nth_tick(1, function()
        count = count - 1
        if count > 0 then return end
        player.clear_cursor()
        step_5()
      end)
    end

    step_5 = function()
      local count = 30
      script.on_nth_tick(1, function()
        count = count - 1
        if count > 0 then return end
        player.cursor_stack.set_stack{name = "copy-paste-tool", count = 1}
        step_6()
      end)
    end

    step_6 = function()
      script.on_nth_tick(1, function()
        if game.move_cursor{position = {-1, 1}} then
          game.activate_selection()
          step_7()
        end
      end)
    end

    step_7 = function()
      script.on_nth_tick(1, function()
        if game.move_cursor{position = {1, 3}} then
          game.finish_selection()
          step_8()
        end
      end)
    end

    step_8 = function()
      script.on_nth_tick(1, function()
        if game.move_cursor{position = {6, 0}} then
          player.raw_build_from_cursor()
          step_9()
        end
      end)
    end

    step_9 = function()
      local count = 30
      script.on_nth_tick(1, function()
        count = count - 1
        if count > 0 then return end
        step_10()
      end)
    end

    step_10 = function()
       script.on_nth_tick(1, function()
        if game.move_cursor{position = {8.5, -0.5}} then
          step_11()
        end
      end)
    end

    step_11 = function()
      local count = 30
      script.on_nth_tick(1, function()
        count = count - 1
        if count > 0 then return end
        game.scroll_clipboard_backwards()
        game.camera_player_cursor_direction = defines.direction.east
        step_12()
      end)
    end

    step_12 = function()
      local count = 30
      script.on_nth_tick(1, function()
        count = count - 1
        if count > 0 then return end
        game.camera_player_cursor_direction = defines.direction.east
        step_13()
      end)
    end

    step_13 = function()
      local count = 30
      script.on_nth_tick(1, function()
        count = count - 1
        if count > 0 then return end
        player.raw_build_from_cursor()
        step_14()
      end)
    end

    step_14 = function()
       script.on_nth_tick(1, function()
        if game.move_cursor{position = {8, 0}} then
          step_15()
        end
      end)
    end

    step_15 = function()
      local count = 30
      script.on_nth_tick(1, function()
        count = count - 1
        if count > 0 then return end
        game.scroll_clipboard_forwards()
        step_16()
      end)
    end

    step_16 = function()
      local count = 30
      script.on_nth_tick(1, function()
        count = count - 1
        if count > 0 then return end
        player.raw_build_from_cursor()
        step_17()
      end)
    end

    step_17 = function()
      local count = 30
      script.on_nth_tick(1, function()
        count = count - 1
        if count > 0 then return end
        reset()
      end)
    end

    step_1()
  ]]
}

simulations.fast_replace =
{
  init =
  [[

    game.surfaces[1].create_entities_from_blueprint_string
    {
      string = "0eNqVk11ugzAQhO+yz3ZUE4gDV4mqytAtWck/yHaaUsTda4haRQq05c1r7XzjtccD1PqCnScboRqAGmcDVKcBArVW6Wkv9h1CBRTRAAOrzFSpENDUmmzLjWrOZJELGBmQfcUPqMT4zABtpEh4481F/2IvpkafGn5IIbokviqtE71zIUmcnXwThov9rmDQp1W5K8aRPXCyf3H+xOx/H+zxYPk38GkZmG8FinsgA48Nzdf+Rh6VN0nbqs8khgWzYqPZmhd5Z3mb7Pj1jKiXrA4brfIVq8Z1HXreqFovjiQ35kOsvMNxWz5umJTdOe3V3edg8I4+zJLsKHJZZlIcpCxl6v8CsJoP7g==",
      position = {0, 0}
    }

    player = game.create_test_player{name = "big k"}
    player.teleport({0, 2.5})
    game.camera_player = player
    game.camera_player_cursor_position = player.position
    game.camera_alt_info = true
    item_name = "assembling-machine-1"

    step_1 = function()
      player.cursor_stack.set_stack{name = item_name, count = 50}
      script.on_nth_tick(1, function()
        if game.move_cursor{position = {-4.5, -0.5}} then
          step_2()
        end
      end)
    end

    step_2 = function()
      local count = 30
      script.on_nth_tick(1, function()
        if count > 0 then count = count - 1 return end
        local finished = game.move_cursor{position = {4.5, -0.5}}
        player.build_from_cursor{position = game.camera_player_cursor_position}
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
        local finished = game.move_cursor{position = player.position}
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

    player = game.create_test_player{name = "big k"}
    player.teleport({0, 2.5})
    game.camera_player = player
    game.camera_player_cursor_position = player.position
    game.camera_alt_info = true
    item_name = "transport-belt"
    direction = 2

    step_1 = function()
      player.cursor_stack.set_stack{name = item_name, count = 50}
      game.camera_player_cursor_direction = direction
      script.on_nth_tick(1, function()
        if game.move_cursor{position = {1.5, -0.49}} then
          step_2()
        end
      end)
    end

    step_2 = function()
      local count = 30
      script.on_nth_tick(1, function()
        if count > 0 then count = count - 1 return end
        player.build_from_cursor{position = game.camera_player_cursor_position, direction = direction}
        step_3()
      end)
    end

    step_3 = function()
      local count = 30
      script.on_nth_tick(1, function()
        if count > 0 then count = count - 1 return end
        player.clear_cursor()
        player.clear_items_inside()
        local finished = game.move_cursor{position = player.position}
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

    player = game.create_test_player{name = "big k"}
    player.teleport({0, 2.5})
    game.camera_player = player
    game.camera_player_cursor_position = player.position
    game.camera_alt_info = true
    item_name = "transport-belt"
    direction = 2
    start_position = {-7.75, -0.5}
    end_position = {7.75, -0.5}

    step_1 = function()
      player.cursor_stack.set_stack{name = item_name, count = 50}
      game.camera_player_cursor_direction = direction
      script.on_nth_tick(1, function()
        if game.move_cursor{position = start_position} then
          step_2()
        end
      end)
    end

    step_2 = function()
      local count = 30
      script.on_nth_tick(1, function()
        if count > 0 then count = count - 1 return end
        local finished = game.move_cursor{position = end_position}
        player.build_from_cursor{position = game.camera_player_cursor_position, direction = direction}
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
        local finished = game.move_cursor{position = player.position}
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
        direction = direction == 2 and 6 or 2
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

    player = game.create_test_player{name = "big k"}
    player.teleport({0, 2.5})
    game.camera_player = player
    game.camera_player_cursor_position = player.position
    game.camera_alt_info = true
    item_name = "transport-belt"
    direction = 2
    start_position = {-2.75, -0.5}
    end_position = {2.75, -0.5}

    step_1 = function()
      player.cursor_stack.set_stack{name = item_name, count = 50}
      game.camera_player_cursor_direction = direction
      script.on_nth_tick(1, function()
        if game.move_cursor{position = start_position} then
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
        local finished = game.move_cursor{position = end_position}
        if item_name == "underground-belt" then

          if not bippity then
            player.build_from_cursor{position = game.camera_player_cursor_position, direction = direction}
            bippity = true
          end

          if not boppity then
            if game.camera_player_cursor_position.x > 2.51 then
              player.build_from_cursor{position = game.camera_player_cursor_position, direction = direction}
              boppity = true
            end
          end

        else
          player.build_from_cursor{position = game.camera_player_cursor_position, direction = direction}
        end
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
        local finished = game.move_cursor{position = player.position}
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

    player = game.create_test_player{name = "big k"}
    player.teleport({0, 2.5})
    game.camera_player = player
    game.camera_player_cursor_position = player.position
    game.camera_alt_info = true

    local assembler_1 = game.surfaces[1].create_entity{name = "assembling-machine-2", position = {-3.5, -0.5}, force = "player"}
    local assembler_2 = game.surfaces[1].create_entity{name = "assembling-machine-2", position = {3.5, -0.5}, force = "player"}

    assembler_1.set_recipe("electric-engine-unit")
    assembler_2.set_recipe("electric-engine-unit")

    step_1 = function()
      script.on_nth_tick(1, function()
        if game.move_cursor({position = assembler_2.position}) then
          step_2()
        end
      end)
    end

    global_rotate_count = 1
    step_2 = function()
      local count = 30
      local rotate_count = global_rotate_count
      script.on_nth_tick(1, function()
        if count > 0 then count = count - 1 return end
        assembler_2.rotate({by_player = player})
        rotate_count = rotate_count - 1
        if rotate_count > 0 then
          count = 15
          return
        end
        global_rotate_count = (global_rotate_count % 3) + 1
        reset()
      end)
    end

    reset = function()
      local count = 30
      script.on_nth_tick(1, function()
        if count > 0 then count = count - 1 return end
        if game.move_cursor({position = player.position}) then
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

simulations.burner_inserter_refueling =
{
  init =
  [[

    game.surfaces[1].create_entities_from_blueprint_string
    {
      string = "0eNqVldtugzAMht/F11A1lFN5lWlCULwuEjgoh25VxbsvabeuB1CTy2D7sxP82ydoe4Oj5KShOgHfCVJQvZ1A8T01vfumjyNCBVzjABFQM7iTlg2pUUgdt9hrmCLg1OE3VGyKXgb3oulQ3gQl03sESJprjpf058OxJjO01rNi19gvITqkePeJSlviKJQNEuRyWVDM2CqL4AjVepVNrpQHUPJYxAxifQVE0HGJu4vVhv7eRhg9GnfpJ/xm6YGe05Q3hd7nmeGm/twihJv5c/MQbu7PzUK4xZXbGkkoY04KpZ79j+kSOJ8BlwHgJAS8DQCvQ8CuTX3JLAjM/MGbIHDi3RVBTcH8VZcGcf1VFyQ65q+6INGx/OVwez3bOC2MNlZ4Vx002ti/9Dh9cLK2penO7vv4z71WqDWnvXJuEgdxwNpYW29bFrva7R5r0tLg5PbMeRdVN3svggNKdSmwZGmxTQqWF8W23EzTD1RaWCk=",
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

    game.surfaces[1].create_entities_from_blueprint_string
    {
      string = "0eNqlV12TmyAU/S88y07QmK+3/oe+dXYcojeGKYIF3HZnx/9e1ESNQqLty2YJcO7X4dybL3TmFZSKCYNOX4ilUmh0+vGFNMsF5c135rMEdELMQIECJGjRrJQ8y1Iqg+oAMZHBH3QidfDyGnBIjWIpLphgIseZYpyPMML6PUAgDDMMOj/axWciquIMyhrpobSRiuaADRU/rYFSantJisa0BcLxWxygT/sPeYstfsaUtdzuhwGyUYpuqZvzpPmTKwAxNskydDrU73XdxDVxI+zdyKkBh/nwbj6cmXfAReOoBODf1GZlDho9gtoojJI8OcOVfjCpmmMpU2nFTCJLEEnr28moCoJ+QwHNEg1CN+cvlGuo3flQkC3NxnaZ+2TsvgMmnrNrBkJuRV3uNPF5vevNGUWFbuzhM3CH0a23mFsH7v4F22fwOy/87nmRQdAzhyRjuvm8lXNSagVaViptXtOUCN1Gd6yQmQXYrEgrGYXefnH05PnQ56OAjFUF7tNSSg7PeLK503yJQ9HUn9jhYOB+5mR+18Zi/QaWX882TY0WkeO7I7pjH92FaoOZ0KCM3ZiFFT9GNavyoqT7ckw268m8WUJmQtYDzxR3u47GDsG6UpElDYZ1T8+Ift/4RyrvfUkNR7oGwHF6BW2evN9VfA1jn9mhG5SsdD2Qu8GNW0fJoMfyctFXqQCXVVE+6ZKeki2KY+OLY9Bzj/VtH8WSBu1uSMG6xk12r5Ibv0ju/gEAG4lzJSuRPRkC5i/eBTzopF9ENv9fLy/tBiXThW3gr2Q6enBl8VN7FNrjZH2YrMPIIcQHlw6HgwLSNK2KilM7ILqK0nodeeYnWZmyMslsjP1gylSUD5NsdwJ/Q/WKnrn1jZNkkntOXQ/m3hijVToT+YwO8sZlzrSxpW4VDiv4VdnPZwT0jHDhoF2KMo5vefSSJ3o5yKZcaujr4Zpw7ntN26jXtNIJ1aZDgFegw/G8a8PMrzZlNlpHz79xzQUSjxsrE9iOzo6S75+ytb2ZNDdLyJaT9vsa0oazwSrs3qQ2tHMUIVd8u3VJsnSyWt7+WjyNfpMG6AOU7trCgWz3x3BPdvv98WCT+hfBsvYc",
      position = {0, 0}
    }

    for x = -7, -4 do
      for y = 2, 3 do
        game.surfaces[1].set_tiles{{name = "water", position = {x, y}}}
      end
    end

  ]]
}

simulations.shoot_targeting =
{
  init =
  [[

    player = game.create_test_player{name = "big k"}
    player.teleport({-4, 0.5})
    player.character.direction = 2
    game.camera_player = player
    game.camera_player_cursor_position = player.position
    game.camera_alt_info = true

    step_1 = function()
      biter = game.surfaces[1].create_entity{name = "medium-biter", position = {10 + (math.random() * 2), -4 + (math.random() * 4)}}
      biter.speed = 0.05
      biter.set_command
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
        if game.move_cursor({position = position}) then
          player.shooting_state = {state  = defines.shooting.shooting_enemies, position = position}
        end
      end)

    end

    step_3 = function()
      local count = 60
      script.on_nth_tick(1, function()
        if count > 0 then count = count - 1 return end

        if game.move_cursor({position = tree.position}) then
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
        player.shooting_state = {state  = defines.shooting.shooting_selected, position = game.camera_player_cursor_position}
      end)
    end

    step_5 = function()
      local count = 30
      script.on_nth_tick(1, function()
        if count > 0 then count = count - 1 return end
        if game.move_cursor({position = player.position}) then
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
