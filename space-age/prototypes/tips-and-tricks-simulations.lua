local simulations = {}

simulations.orbital_logistics =
{
  init =
  [[
    require("__core__/lualib/story")
    player = game.simulation.create_test_player{name = "Spaceman"}
    player.teleport({-1.5, 2})
    game.simulation.camera_player = player
    game.simulation.camera_position = {0, 0.5}
    game.simulation.camera_player_cursor_position = player.position
    game.forces.player.worker_robots_speed_modifier = 2
    game.forces.player.worker_robots_storage_bonus = 9

    local technologies = prototypes.technology
    technology_list =
    {
      "planet-discovery-vulcanus","physical-projectile-damage-1","physical-projectile-damage-2","physical-projectile-damage-3",
      "physical-projectile-damage-4","physical-projectile-damage-5","physical-projectile-damage-6","physical-projectile-damage-7",
      "logistic-robotics","worker-robots-storage-1","worker-robots-storage-2","worker-robots-storage-3","space-platform-thruster"
    }
    for k, name in ipairs (technology_list) do
      game.forces.player.technologies[name].researched = true
    end

    game.forces.player.recipes["carbonic-asteroid-crushing"].enabled = true
    game.forces.player.recipes["metallic-asteroid-crushing"].enabled = true
    game.forces.player.recipes["oxide-asteroid-crushing"].enabled = true

    game.forces.player.bulk_inserter_capacity_bonus = 12

    game.planets.vulcanus.create_surface()

    for x = -11, 10, 1 do
      for y = -5, 6 do
        game.surfaces[2].set_tiles{{position = {x, y}, name = "volcanic-ash-dark"}}
      end
    end

    for k, position in pairs ({{-8, 3}, {-7, 3},
                               {-10, 4}, {-9, 4}, {-8, 4}, {-7, 4}, {-6, 4},
                               {-10, 5}, {-9, 5}, {-8, 5}, {-7, 5},
                               {-11, 6}, {-10, 6}, {-9, 6}, {-8, 6}}) do
      game.surfaces[2].set_tiles{{position = position, name = "lava"}}
    end

    for k, position in pairs ({{-8, 2}, {-7, 2},
                               {-9, 3}, {-6, 3},
                               {-11, 4}, {-5, 4},
                               {-11, 5}, {-6, 5},
                               {-12, 6}, {-7, 6}}) do
      game.surfaces[2].set_tiles{{position = position, name = "volcanic-cracks-hot"}}
    end

    for k, position in pairs ({{-9, 2}, {0, 2}, {1, 2},
                               {-11, 3}, {-10, 3}, {-1, 3}, {0, 3}, {1, 3},
                               {-2, 4}, {-1, 4}, {0, 4}, {1, 4}, {2, 4}, {3, 4},
                               {-5, 5}, {-4, 5}, {-3, 5}, {-2, 5}, {-1, 5}, {0, 5}, {1, 5}, {2, 5}, {3, 5},
                               {-6, 6}, {-5, 6}, {-4, 6}, {-3, 6}, {-2, 6}, {-1, 6}, {0, 6}, {1, 6}, {2, 6}}) do
      game.surfaces[2].set_tiles{{position = position, name = "volcanic-smooth-stone"}}
    end

    for k, position in pairs ({{-11, 0}, {-10, 0}, {-9, 0}, {-8, 0}, {-7, 0},
                               {-11, 1}, {-10, 1}, {-9, 1}, {-8, 1}, {-7, 1}, {-6, 1}, {-5, 1},
                               {-11, 2}, {-10, 2}, {-6, 2}, {-5, 2}, {-4, 2}, {-1, 2},
                               {-5, 3}, {-4, 3}, {-3, 3}, {-2, 3},
                               {-4, 4}, {-3, 4}, {4, 4}, {5, 4}, {6, 4}, {7, 4}, {8, 4}, {9, 4}, {10, 4},
                               {4, 5}, {5, 5}, {6, 5}, {7, 5}, {8, 5}, {9, 5}, {10, 5},
                               {7, 6}, {10, 6}}) do
      game.surfaces[2].set_tiles{{position = position, name = "volcanic-soil-dark"}}
    end

    for k, position in pairs ({{-11, -5}, {-10, -5}, {-9, -5}, {-8, -5}, {-1, 5}, {0, -5}, {1, -5}, {2, -5}, {3, -5}, {4, -5}, {5, -5}, {6, -5}, {7, -5}, {8, -5}, {9, -5}, {10, -5},
                               {-11, -4}, {-10, -4}, {-9, -4}, {-8, -4}, {-1, -4}, {0, -4}, {1, -4}, {2, -4}, {3, -4}, {4, -4}, {5, -4}, {6, -4}, {7, -4}, {8, -4}, {9, -4}, {10, -4},
                               {-11, -3}, {-10, -3}, {-9, -3}, {-8, -3}, {-7, -3}, {-6, -3}, {0, -3}, {1, -3}, {2, -3}, {3, -3}, {4, -3}, {5, -3}, {6, -3}, {7, -3}, {8, -3}, {9, -3}, {10, -3},
                               {-9, -2}, {-8, -2}, {-7, -2}, {-5, -2}, {1, -2}, {2, -2}, {3, -2}, {4, -2}, {5, -2}, {6, -2}, {7, -2}, {8, -2}, {9, -2},
                               {2, -1}, {3, -1}, {4, -1}, {5, -1}, {6, -1}, {7, -1}, {8, -1},
                               {5, 0}, {6, 0}, {7, 0},
                               {5, 1}, {6, 1}}) do
      game.surfaces[2].set_tiles{{position = position, name = "volcanic-ash-cracks"}}
    end

    local create_list = {}
    table.insert(create_list, { name = "v-red-pita", position = {-3, 0}, amount = 1})
    for k, position in pairs ({{-10, -3}, {-8, -3}, {4, -3},
                               {8, 1}}) do
      table.insert(create_list, { name = "v-brown-carpet-grass", position = position, amount = 1})
    end
    for k, position in pairs ({{-10, 2},
                               {-8, 3}, {-7, 3}, {5, 3}, {7, 3},
                               {3, 4}, {6, 4},
                               {1, 5}}) do
      table.insert(create_list, { name = "tiny-rock-cluster", position = position, amount = 1})
    end
    game.surfaces[2].create_decoratives{decoratives = create_list}

    game.surfaces[2].freeze_daytime = true

    game.surfaces[2].set_chunk_generated_status({0, 0}, defines.chunk_generated_status.tiles)
    game.surfaces[2].set_chunk_generated_status({-1, -1}, defines.chunk_generated_status.tiles)
    game.surfaces[2].set_chunk_generated_status({0, -1}, defines.chunk_generated_status.tiles)
    game.surfaces[2].set_chunk_generated_status({-1, 0}, defines.chunk_generated_status.tiles)

    game.surfaces[1].create_entities_from_blueprint_string
    {
      string = "0eNrNWu2SoyoQfRd+45Yg+JFXmUqlTELmUmvUC5jd3Km8+200idmNToCZH05NJQbwnD4tdrfgB9pWnWiVrA1afSC5a2qNVm8fSMv3uqxsW10eBVqhrSihE10wkvVe/EYrcsETw1Sz+ylMpGXVPIyllzVGojbSSDHg9z/Om7o7boUCMHwD0MeyqiJRiZ1Rche1TSUQRm2j4VzgBybAy39wjM6A+4NfrBl/oVE/NMI/h0v84Cj9HI7hv3z6hHCzhwEA+NCI4+A0uX/wtG6F2EfHZt9VIkrQOBDG1RtZn4C2UefhxPEXeFqbcvcTrWJr22QPuawv8P9sOn9per5U09OXphOyVNuz17azpdqev7Y9W6rtxUvb6WLnDIndjc8WZ7xnPqDJg5IpvDEjyPoga+iLdv8IbZ6holvwLQanXIdvtDBG1u+9biWOzUlsOuirjFBiv7m65FBWWmA0NA++vNK2kBiF1oAQdYAHvLums0mXxHChwLt2UGmiSpS9Vfcku57UM6Yk8btVABwZVda6bZSJtqKa0kX/0LWXCjzad7MpAvZEUDXlHrqegdkMLEbm3FqEpjNtZ9AUDffXQbx0pP4EsRdB5k3gh5974/s5qPDG95pINPbGT7zwiTc+88Kn3vjcC9//Tk698Jk3fuaFP97BfVCPZK2FMlOBIp/DJXQKOPUP2ST+1ph9fZY5dKIa4zUNCNc0C9BCvlVL1fyK9qLWllob1e1Mp8QXVeXhSeiq7tXkKr7AELswJLFvnpvAdUh0CfHmIUE8NDyhul2TJPkCg9s1YeE525GBf4HBzUtpcNp2lJCFE7gpyIMLG0cFRTiBkwIWB5c2bgoYCSdwU0CDiydHBUk4gZsCFlyeOSrg4QRuCtLgAtBRQRZO4KYgDy4xHRUU4QROCngcXMS6KeAknMBNAfUuk58tn6yTeeKPTNyQmfsK0q3yXtBS9RgYHvcknrPiPaDRXgL4RLYPZ7Wlsle/nw79eWW1UeLfDqr3zbU+ju1ZQ8u98v4Ym1Rz3Gy7w6Fvh9JbfLuj2Kyj2IOj5nrobE8y69zUY2oki5saDxH3tq4oaqHez3DzwOU7lLuJNcYoHeRYMcPl3Gj5n+hX8G5/U2Rj9NXdFkzrIWer/snlS144YZBPINL44XbYNjawTWTGzwDGENmWWsuTiFrVnCQ8w8w9y95DJJ9elU1p4Cqv3e2YBEw8pmW6uB0q5ueO6F7IFDPu4B7uKBbnjtR5n5QuLvukmfNO6QKNz933ShdofeG+W7o867PYfb90gdaH7tvZODQVwjLPFHFf/qMzL19kni9zsFd4nkF7vHHmALknYP4H4BqjX1DX2/nwRjDHFPM1foNPnPRH8IkJ6Q/tF06HAVClcAxlxv0YkpE9tt04G8bbJpwN420TBlP7437MAG+/cDacm7HbmPUw9+ycvr9thNEJCuJeB80JyxOepinjaUYvl/8BL7oZTg==",
      position = {-1, 0}
    }

    silo = game.surfaces[1].find_entities_filtered{name = "rocket-silo"}[1]
    roboport = game.surfaces[1].find_entities_filtered{name = "roboport"}[1]
    provider_chest = game.surfaces[1].find_entities_filtered{name = "passive-provider-chest"}[1]

    local story_table =
    {
      {
        {
          name = "start",
          init = function()
            storage.platform = player.force.create_space_platform({name="platform", planet="nauvis", starter_pack="space-platform-starter-pack"})
            storage.hub = storage.platform.apply_starter_pack()
            space_surface = storage.platform.surface
            space_surface.create_entities_from_blueprint_string
            {
              string = "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",
              position = {0, -2}
            }
            tank1 = space_surface.find_entities_filtered{name = "storage-tank"}[1]
            tank2 = space_surface.find_entities_filtered{name = "storage-tank"}[2]
            tank3 = space_surface.find_entities_filtered{name = "storage-tank"}[3]
            tank4 = space_surface.find_entities_filtered{name = "storage-tank"}[4]
            tank1.insert_fluid{name = "thruster-fuel", amount = 25000}
            tank2.insert_fluid{name = "thruster-fuel", amount = 25000}
            tank3.insert_fluid{name = "thruster-oxidizer", amount = 25000}
            tank4.insert_fluid{name = "thruster-oxidizer", amount = 25000}

            assembler = space_surface.find_entities_filtered{name = "assembling-machine-3"}[1]
            assembler.insert({name = "firearm-magazine", count = 200})

            turrets = space_surface.find_entities_filtered{name = "gun-turret"}
            for k, turret in pairs (turrets) do
              turret.insert({name = "firearm-magazine", count = 200})
            end

            furnaces = space_surface.find_entities_filtered{name = "electric-furnace"}
            for k, furnace in pairs (furnaces) do
              furnace.insert({name = "iron-ore", count = 100})
            end

            collectors = space_surface.find_entities_filtered{name = "asteroid-collector"}
            for k, collector in pairs (collectors) do
              collector.insert({name = "metallic-asteroid-chunk", count = 20})
              collector.insert({name = "carbonic-asteroid-chunk", count = 20})
              collector.insert({name = "oxide-asteroid-chunk", count = 20})
            end
          end,
          condition = story_elapsed_check(3),
          action = function()
            game.simulation.camera_zoom = 0.5
            player.set_controller{type = defines.controllers.remote, surface = space_surface}
            local silo_position = silo.position
            silo.destroy()
            silo = game.surfaces[1].create_entity{name = "rocket-silo", position = silo_position, force = "player", create_build_effect_smoke = false}
            silo.rocket_parts = 100
          end
        },
        { condition = story_elapsed_check(1) },
        {
          condition = function() return game.simulation.move_cursor({position = storage.hub.position, speed = 0.2}) end,
          action = function() player.opened = storage.hub end
        },
        { condition = story_elapsed_check(0.25) },
        {
          condition = function()
            local target = game.simulation.get_widget_position({type = "logistics-button-space", data = "0", data2 = "1"})
            return game.simulation.move_cursor({position = target, speed = 0.3})
          end
        },
        {
          condition = story_elapsed_check(0.25),
          action = function() game.simulation.mouse_click() end
        },
        {
          condition = function()
            local target = game.simulation.get_widget_position({type = "signal-id-base", data = "transport-belt"})
            return game.simulation.move_cursor({position = target, speed = 0.3})
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
          condition = story_elapsed_check(1),
          action = function() player.opened = nil end
        },
        {
          condition = story_elapsed_check(1),
          action = function()
            game.simulation.camera_zoom = 2
            player.set_controller{type = defines.controllers.remote, surface = game.surfaces[1]}
          end
        },
        { condition = story_elapsed_check(1) },
        {
          condition = function() return game.simulation.move_cursor({position = silo.position, speed = 0.2}) end,
          action = function() player.opened = silo end
        },
        { condition = story_elapsed_check(0.25) },
        {
          condition = function()
            local target = game.simulation.get_widget_position({type = "check-box", data = "gui.controlled-by-transitional-requests"})
            return game.simulation.move_cursor({position = target, speed = 0.15})
          end
        },
        {
          condition = story_elapsed_check(0.25),
          action = function() game.simulation.mouse_click() end
        },
        {
          condition = story_elapsed_check(1),
          action = function() player.opened = nil end
        },
        {
          condition = story_elapsed_check(1),
          action = function()
            roboport.insert({name = "logistic-robot", count = 5})
            provider_chest.insert({name = "transport-belt", count = 100})
          end
        },
        {
          condition = story_elapsed_check(11),
          action = function() game.speed = 2 end
        },
        {
          condition = story_elapsed_check(12),
          action = function()
            game.speed = 1
            game.simulation.camera_zoom = 0.5
            player.set_controller{type = defines.controllers.remote, surface = space_surface}
          end
        },
        { condition = story_elapsed_check(1) },
        {
          condition = function() return game.simulation.move_cursor({position = storage.hub.position, speed = 0.2}) end,
          action = function() player.opened = storage.hub end
        },
        { condition = story_elapsed_check(0.25) },
        {
          condition = function()
            local target = game.simulation.get_widget_position({type = "text-button-localised-substring", data = "gui-train.add-station"})
            return game.simulation.move_cursor({position = target, speed = 0.3})
          end
        },
        {
          condition = story_elapsed_check(0.25),
          action = function()
            game.simulation.mouse_click()
          end
        },
        { condition = story_elapsed_check(0.25) },
        {
          condition = function()
            local target = game.simulation.get_widget_position({type = "text-button-substring", data = "[planet=vulcanus]"})
            return game.simulation.move_cursor({position = target, speed = 0.3})
          end
        },
        {
          condition = story_elapsed_check(0.25),
          action = function() game.simulation.mouse_click() end
        },
        { condition = story_elapsed_check(0.5) },
        {
          condition = function()
            local target = game.simulation.get_widget_position({type = "train-schedule-action-button"})
            return game.simulation.move_cursor({position = target, speed = 0.3})
          end
        },
        {
          condition = story_elapsed_check(0.25),
          action = function() game.simulation.mouse_click() end
        },
        {
          condition = story_elapsed_check(0.25),
          action = function() player.opened = nil end
        },
        {
          condition = story_elapsed_check(4),
          action = function() game.speed = 10 end
        },
        {
          condition = story_elapsed_check(70),
          action = function() game.speed = 1 end
        },
        {
          condition = story_elapsed_check(1),
          action = function()
            pad = game.surfaces[2].create_entity{name = "cargo-landing-pad", position = {0, 1}, force = "player", create_build_effect_smoke = false}
            game.simulation.camera_zoom = 2
            player.set_controller{type = defines.controllers.remote, surface = game.surfaces[2]}
          end
        },
        { condition = story_elapsed_check(1) },
        {
          condition = function() return game.simulation.move_cursor({position = pad.position, speed = 0.2}) end,
          action = function() player.opened = pad end
        },
        { condition = story_elapsed_check(0.25) },
        {
          condition = function()
            local target = game.simulation.get_widget_position({type = "logistics-button", data = "0"})
            return game.simulation.move_cursor({position = target, speed = 0.3})
          end
        },
        {
          condition = story_elapsed_check(0.25),
          action = function() game.simulation.mouse_click() end
        },
        {
          condition = function()
            local target = game.simulation.get_widget_position({type = "signal-id-base", data = "transport-belt"})
            return game.simulation.move_cursor({position = target, speed = 0.3})
          end
        },
        {
          condition = story_elapsed_check(0.25),
          action = function() game.simulation.mouse_click() end
        },
        {
          condition = story_elapsed_check(0.5),
          action = function() game.simulation.control_press{control = "confirm-gui", notify = false} end
        },
        {
          condition = story_elapsed_check(2),
          action = function() player.opened = nil end
        },
        {
          action = function() game.speed = 10 end
        },
        {
          condition = story_elapsed_check(8),
          action = function() game.speed = 1 end
        },
        {
          condition = story_elapsed_check(12),
          action = function()
            game.simulation.camera_zoom = 2
            player.set_controller{type = defines.controllers.remote, surface = game.surfaces[1]}
          end
        },
        {
          init = function()
            storage.platform.destroy()
            pad.destroy()
            local silo_position = silo.position
            silo.destroy()
            silo = game.surfaces[1].create_entity{name = "rocket-silo", position = silo_position, force = "player", create_build_effect_smoke = false}
            roboport.clear_items_inside()
          end,
          action = function() story_jump_to(storage.story, "start") end
        }
      }
    }
    tip_story_init(story_table)
  ]]
}

simulations.heating_mechanics =
{
  init_update_count = 120,
  planet = "aquilo",
  mute_wind_sounds = false,
  init =
  [[
    game.simulation.camera_position = {0, 0.5}
    game.forces.player.recipes["ammonia-rocket-fuel"].enabled = true

    for x = -15, 14, 1 do
      for y = -8, 10 do
        game.surfaces[1].set_tiles{{position = {x, y}, name = "ammoniacal-ocean"}}
      end
    end

    for x = -15, 14, 1 do
      for y = -8, 10 do
        game.surfaces[1].set_tiles{{position = {x, y}, name = "ice-platform"}}
      end
    end

    game.surfaces[1].create_entities_from_blueprint_string
    {
      string = "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",
      position = {2, 0}
    }

    reset_items = function()
      local heating_towers = game.surfaces[1].find_entities_filtered{name = "heating-tower"}
      storage.heating_tower = heating_towers[1]
      storage.heating_tower.insert({name = "rocket-fuel", count = 4})
    end

    start = function()
      storage.wait = 180
      script.on_nth_tick(1, function()
        storage.wait = storage.wait - 1
        if storage.wait == 0 then
          reset_items()
        end
      end)
    end

    start()
  ]]
}

simulations.space_platform =
{
  mute_wind_sounds = false,
  init =
  [[
    require("__core__/lualib/story")
    player = game.simulation.create_test_player{name = "Spaceman"}
    storage.character = player.character
    storage.platform = player.force.create_space_platform({name="platform", planet="nauvis", starter_pack="space-platform-starter-pack"})
    storage.platform.apply_starter_pack()
    player.teleport({0, 0}, game.surfaces[2])
    game.simulation.camera_zoom = 1
    game.simulation.camera_player = player
    game.simulation.camera_player_cursor_position = player.position
    game.simulation.camera_position = {0, 0}
    hub = game.surfaces[2].find_entity("space-platform-hub", {0, 0})

    local story_table =
    {
      {
        {
          name = "start",
          init = function()
            player.cursor_stack.set_stack{name = "space-platform-foundation"}
            storage.character.cursor_ghost = {name = "space-platform-foundation"}
          end,
          condition = function() return game.simulation.move_cursor({position = {-6, 4}}) end,
          action = function() game.simulation.control_down{control = "build-ghost", notify = false} end
        },
        { condition = function() return game.simulation.move_cursor({position = {-10, 4}, speed = 0.1}) end },
        { condition = function() return game.simulation.move_cursor({position = {-10, -6}, speed = 0.2}) end },
        { condition = function() return game.simulation.move_cursor({position = {-8, -6}, speed = 0.3}) end },
        { condition = function() return game.simulation.move_cursor({position = {-8, 2}, speed = 0.3}) end },
        { condition = function() return game.simulation.move_cursor({position = {-6, 2}, speed = 0.3}) end },
        { condition = function() return game.simulation.move_cursor({position = {-6, -6}, speed = 0.3}) end },
        { condition = function() return game.simulation.move_cursor({position = {10, -6}, speed = 0.4}) end },
        { condition = function() return game.simulation.move_cursor({position = {10, 4}, speed = 0.4}) end },
        { condition = function() return game.simulation.move_cursor({position = {6, 4}, speed = 0.4}) end },
        { condition = function() return game.simulation.move_cursor({position = {6, -4}, speed = 0.4}) end },
        { condition = function() return game.simulation.move_cursor({position = {8, -4}, speed = 0.4}) end },
        {
          condition = function() return game.simulation.move_cursor({position = {8, 2}, speed = 0.4}) end,
          action = function() game.simulation.control_up{control = "build-ghost"} end
        },
        {
          init = function()
            player.clear_cursor()
            player.cursor_stack.clear()
          end,
          condition = function() return game.simulation.move_cursor({position = {0, 5}}) end
        },
        {
          init = function()
            player.cursor_stack.set_stack{name = "asteroid-collector"}
            storage.character.cursor_ghost = {name = "asteroid-collector"}
            game.simulation.camera_player_cursor_direction = defines.direction.west
          end,
          condition = function() return game.simulation.move_cursor({position = {-11, 3}}) end,
          action = function() game.simulation.control_press{control = "build-ghost", notify = false} end
        },
        {
          condition = function() return game.simulation.move_cursor({position = {-11, -6}}) end,
          action = function() game.simulation.control_press{control = "build-ghost", notify = false} end
        },
        {
          init = function()
            player.clear_cursor()
            player.cursor_stack.clear()
          end,
          condition = function() return game.simulation.move_cursor({position = {0, 5}}) end
        },
        {
          init = function()
            player.cursor_stack.set_stack{name = "crusher"}
            storage.character.cursor_ghost = {name = "crusher"}
            game.simulation.camera_player_cursor_direction = defines.direction.east
          end,
          condition = function() return game.simulation.move_cursor({position = {8, 1}}) end
        },
        {
          init = function() game.simulation.control_down{control = "build-ghost", notify = false} end,
          condition = function() return game.simulation.move_cursor({position = {8, -3}}) end,
          action = function() game.simulation.control_up{control = "build-ghost"} end
        },
        {
          init = function()
            player.clear_cursor()
            player.cursor_stack.clear()
          end,
          condition = function() return game.simulation.move_cursor({position = {0, 5}}) end
        },
        {
          condition = story_elapsed_check(1),
          action = function() hub.insert({name = "space-platform-foundation", count = 50}) end
        },
        {
          condition = story_elapsed_check(3),
          action = function() hub.insert({name = "space-platform-foundation", count = 50}) end
        },
        {
          condition = story_elapsed_check(3),
          action = function() hub.insert({name = "space-platform-foundation", count = 50}) end
        },
        {
          condition = story_elapsed_check(3),
          action = function() hub.insert({name = "space-platform-foundation", count = 50}) end
        },
        {
          condition = story_elapsed_check(3),
          action = function() hub.insert({name = "asteroid-collector", count = 2}) end
        },
        {
          condition = story_elapsed_check(2),
          action = function() hub.insert({name = "crusher", count = 3}) end
        },
        {
          condition = story_elapsed_check(5),
          action = function()
            for k, entity in pairs (game.surfaces[2].find_entities_filtered{name = "crusher"}) do
              entity.order_deconstruction("player")
            end
            for k, entity in pairs (game.surfaces[2].find_entities_filtered{name = "asteroid-collector"}) do
              entity.order_deconstruction("player")
            end
          end
        },
        {
          condition = story_elapsed_check(1),
          action = function()
            for k, v in pairs (game.surfaces[2].find_tiles_filtered{position = {-15, 0}, radius = 10}) do
              v.order_deconstruction("player")
            end
            for k, v in pairs (game.surfaces[2].find_tiles_filtered{position = {15, 0}, radius = 10}) do
              v.order_deconstruction("player")
            end
            for k, v in pairs (game.surfaces[2].find_tiles_filtered{position = {0, -17}, radius = 12}) do
              v.order_deconstruction("player")
            end
            for k, v in pairs (game.surfaces[2].find_tiles_filtered{position = {-6, -6}, radius = 1}) do
              v.order_deconstruction("player")
            end
            for k, v in pairs (game.surfaces[2].find_tiles_filtered{position = {6, -6}, radius = 1}) do
              v.order_deconstruction("player")
            end
          end
        },
        {
          condition = story_elapsed_check(2),
          action = function()
            hub.clear_items_inside()
            story_jump_to(storage.story, "start")
          end
        }
      }
    }
    tip_story_init(story_table)
  ]]
}

simulations.removing_trash_in_space =
{
  init_update_count = 120,
  mute_wind_sounds = false,
  init =
  [[
    player = game.simulation.create_test_player{name = "Spaceman"}
    storage.platform = player.force.create_space_platform({name="platform", planet="nauvis", starter_pack="space-platform-starter-pack"})
    storage.hub = storage.platform.apply_starter_pack()
    player.teleport({0, 0}, game.surfaces[2])
    game.simulation.camera_player = player
    game.simulation.camera_position = {28, 4}
    game.simulation.hide_cursor = true
    game.surfaces[2].create_entities_from_blueprint_string
    {
      string = "0eNql2+FO2zAUhuF78e8E+Rw7ofRWJlSF1mXR0qRKXDSGeu9z2oohYKjm3T9ofeKk3tOjo48X89Adwn5s+2iWL6ZdD/1klj9ezNQ+9k03/y4+74NZmjaGnSlM3+zmn7bNFMs4Nv20H8ZYPoQummNh2n4TfpulHO8LE/rYxjacy51+eF71h91DGNMbXguFLqzj2K7L0Ifx8blMGwnjtlmHdK39MKUKQz/vIlWtC/NslqVL19m0Y1p2eskX5uGw3YZxNbV/UkWxr/+OxYcL6+uF237b9umlcv0zTPHj1aS+qc4XlJvqdGvn96+mEGPbP07z+8awG57C6pBe69K+w2Y1P6b00rbpplCY86/Pj+By3V2ITdelG05PMIxDu0kbOPS/0gbWw2H+FNKz2Q2b+a1NLLvQnDb378EeP7kr9+aupjCmul/dj03380kR/+WH+7He7aWePT2et5/IJ8WrzOJ1TvE6s/hdTvHbzOKLnOKLvOIqOcXvMovbnOJiM6u7rOqSWV2zqmtm9epSXd5XX3xW3X2zur2qeuZ/U/VZT6b65t71qr3X36zurqp+e4WCWv+vpOj8pRXb7vKN9W6hP9s5L7pcZNqnb6ly3zVxO4y7cpv03jSnFfPm3i2v2PKaLb9lyxds+R1bPkuD1gtcr3C9g+vh0RN49gQePoGnT+DxE3j+FJ4/hedP4flTeP4Unj+F50/h+bts3zO5PZPbM7k9k9szuT2U20O5PZTbQ7k9lNtDuT2U20O5PZTbQ7k9lNtDuT2U20O5PZTbQ7k9lNszuR2T2zG5HZPbMbkdk9tBuR2U20G5HZTbQbkdlNtBuR2U20G5HZTbQbkdlNtBuR2U20G5HZTbQbkdk1uZ3MrkVia3MrmVya1QboVyK5RbodwK5VYot0K5FcqtUG6FciuUW6HcCuVWKLdCuRXKrVBuZXILk1uY3MLkFia3MLkFyi1QboFyC5RboNwC5RYot0C5BcotUG6BcguUW6DcAuUWKLdAuQXKLUhui+C2yG2L2LZIbYvQtsxsy8i2TGzLwLbMa8u4tkxry7C2zGrLqLZMasugtsxpy5i2TGnLkLbMaIuIZr01a61ZZ80aa9ZXw7YadtWwqYY9NWypYUcNG2rYT8N2GnbTsJmGvTRspWEnDRtp2EfDNpp10WxwzebWbGzNptZsaA1n1nBkDSfWcGAN59VwXA2n1XBYDWfVcFQNJ9VwUA3n1HBMDafUcEgNZ9RsRM1SISwUwjIhLBLCEiEwEALzIDAOAtMgMAwCsyAwCgKTIDAIAnMgMAYCUyAwBAIzIDACAhMgMADC8h8scs0S1yxwzfLWLG4N09YwbA2z1jBqDZPWMGgNc9YwZg1T1jBkDTPWMGINE9YwYA3z1TBeDdPV1y2/L85/wL988/f+hXkK43QqqAvxC1fVde2rSqrj8S8okpjA",
      position = {15, 0}
    }
  ]]
}

simulations.space_science =
{
  init_update_count = 120,
  mute_wind_sounds = false,
  init =
  [[
    player = game.simulation.create_test_player{name = "Spaceman"}
    storage.platform = player.force.create_space_platform({name="platform", planet="nauvis", starter_pack="space-platform-starter-pack"})
    storage.hub = storage.platform.apply_starter_pack()
    player.teleport({0, 0}, game.surfaces[2])
    game.forces.player.recipes["space-science-pack"].enabled = true
    game.forces.player.recipes["carbonic-asteroid-crushing"].enabled = true
    game.forces.player.recipes["oxide-asteroid-crushing"].enabled = true
    game.forces.player.recipes["metallic-asteroid-crushing"].enabled = true
    game.simulation.camera_player = player
    game.simulation.camera_position = {-16, -6}
    game.simulation.camera_zoom = 1.1
    game.simulation.camera_alt_info = true
    game.simulation.hide_cursor = true
    game.surfaces[2].create_entities_from_blueprint_string
    {
      string = "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",
      position = {0, 0}
    }
  ]]
}

simulations.asteroid_defense =
{
  mute_wind_sounds = false,
  init =
  [[
    require("__core__/lualib/story")

    player = game.simulation.create_test_player{name = "Spaceman"}
    storage.platform = player.force.create_space_platform({name="platform", planet="nauvis", starter_pack="space-platform-starter-pack"})
    storage.platform.apply_starter_pack()
    player.teleport({0, 0}, game.surfaces[2])
    game.simulation.camera_zoom = 1
    game.simulation.camera_player = player
    game.simulation.camera_position = {32, -7}
    game.simulation.hide_cursor = true
    game.forces.player.recipes["metallic-asteroid-crushing"].enabled = true
    game.forces.player.recipes["oxide-asteroid-crushing"].enabled = true
    game.forces.player.recipes["carbonic-asteroid-crushing"].enabled = true
    surface = game.surfaces[2]

    surface.create_entities_from_blueprint_string
    {
      string = "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",
      position = {11, 0}
    }

    local story_table =
    {
      {
        {
          name = "start",
          condition = story_elapsed_check(3),
          action = function() surface.create_entity{name="small-oxide-asteroid", position = {18, -22}, velocity = {-0.02, 0.07}} end
        },
        {
          condition = story_elapsed_check(0.5),
          action = function() surface.create_entity{name="small-carbonic-asteroid", position = {42, -22}, velocity = {0.02, 0.08}} end
        },
        {
          condition = story_elapsed_check(2.5),
          action = function() surface.create_entity{name="small-metallic-asteroid", position = {15, -22}, velocity = {0.01, 0.09}} end
        },
        {
          condition = story_elapsed_check(0.5),
          action = function() surface.create_entity{name="small-oxide-asteroid", position = {41, -22}, velocity = {-0.02, 0.07}} end
        },
        {
          condition = story_elapsed_check(1),
          action = function() surface.create_entity{name="small-carbonic-asteroid", position = {35, -22}, velocity = {-0.03, 0.09}} end
        },
        {
          condition = story_elapsed_check(3),
          action = function() surface.create_entity{name="small-carbonic-asteroid", position = {22, -22}, velocity = {0.01, 0.07}} end
        },
        {
          condition = story_elapsed_check(0.5),
          action = function() surface.create_entity{name="small-oxide-asteroid", position = {41, -22}, velocity = {-0.01, 0.03}} end
        },
        {
          condition = story_elapsed_check(2,5),
          action = function() surface.create_entity{name="small-metallic-asteroid", position = {22, -22}, velocity = {0, 0.09}} end
        },
        {
          condition = story_elapsed_check(2),
          action = function() surface.create_entity{name="small-oxide-asteroid", position = {16, -22}, velocity = {0.02, 0.08}} end
        },
        {
          condition = story_elapsed_check(1),
          action = function()
             surface.create_entity{name="small-metallic-asteroid", position = {30, -22}, velocity = {-0.04, 0.07}}
            story_jump_to(storage.story, "start")
          end
        }
      }
    }
    tip_story_init(story_table)
  ]]
}

simulations.spoilables =
{
  init =
  [[
    require("__core__/lualib/story")
    player = game.simulation.create_test_player{name = "Quality Manager"}
    player.teleport({-9, 0})
    game.simulation.gui_tooltip_interval = 0.5
    game.simulation.camera_player = player
    game.simulation.camera_position = {0, 0.5}
    game.simulation.camera_player_cursor_position = player.position
    player.character.direction = defines.direction.south

    player.insert("raw-fish")
    player.clear_inventory_highlights()
    player.opened = player

    local story_table =
    {
      {
        {
          name = "start",
          condition = function()
            local target = game.simulation.get_slot_position{inventory_index = defines.inventory.character_main, slot_index = 0}
            return game.simulation.move_cursor({position = target})
          end
        },
        {
          condition = story_elapsed_check(10),
          action = function() story_jump_to(storage.story, "start") end
        }
      }
    }
    tip_story_init(story_table)
  ]]
}

simulations.spoilables_research =
{
  init_update_count = 360,
  init =
  [[
    game.simulation.camera_position = {0, 0.5}
    game.simulation.camera_alt_info = true
    game.surfaces[1].create_entities_from_blueprint_string
    {
      string = "0eNrVmtmO2zgQRf+Fz3IgbloayJcEgSHLtIcYidKQVJJOw/8eym67l5BpVsEPmbw0IsmnWEXe4tXyRHbDomarjScPT0T3k3Hk4csTcfpoumE9ZrpRkQdy6JzfeNsZN0/Wb3Zq8ORUEG326gd5oKevBVHGa6/VBXD+z+PWLONO2XBB8QY0TN0+HC7IPLnwm8mskQJnw3hBHsPf8pMM9L22qr+cpqwg/nFeCdPi52WN/lsUdouizUGbcGrT/6OcjwWin+TrUNcfbJ3yXpujWy+0apy+qe0Szg1eWbXfaq/GcOrQDU4V5HL4kvBz4G7x09itkTau18r0ajN3/b9hBP20rFVmZVmQcdqfLw6VUN15fC+FPEUS48Wf5iGSXfucHX1fxyZCF1B6k6JTFsFLKL4G4SsovgLh6xte/Zitcm7j5kF7H1++8srOIDcgsngmlxnkFqY2ihIbLWFRcJKmFKHp+0p6mI7aed3fU9AU06roXdMK4Ubdd8Nd00I3KpbTqKjA4nkWXqIUyTIUSSuYWBhOLDViVbG7rqrZTvulv/f+RxvsxMusiW+xeJGDZyUWX73HixieYvfvPDzD7t95eI7dv/Pw4JYhQXiwuREgPNjcMBC+huI5CA9WLQXhwaotIXgOVS0FqZZDVUtBquXvVKuNUza+kd3AQbfRmw+oQilIoRyqUArqL1zmF0J+UAioGilI7ByqRgpqVRyqRgrqJRyqRgrqJQKsRpDYBViNoFYloHsoqJUIqEBBnURA9QlSv4BuoCDxi1zbnWLeTLc2Cc8tAJ777YqHWW5vFxVrSqIBxL9qornnALKfNrSvYsdvbZJVliXWhDZ5z6go1oVm8hnWJ2byOdbmZvIF1ilm8iXW6GbyK6wVzeTX2S7j5kLbmBCC9qzVe7V1Ptw2b53+qc5PE3+PiDbXbdzdyBcdD93uTz4xAajKjwDyAwDFOpQmZzOoAJaYp+ZIAKao4th8UgUSWBOUVyCJNUF5+AppgvLoNdIE5dEbpAnKo7dIE5RFr0uQCWoQJqimcBN0Tw9SM2wzXJdwlMjRxDJBFNhukCRKNDGVNXqbXNFRYo0m8gQRfR+bHGOLJibG2JTorEWCSNFEmSC+aMYtu7CXnX8de9zyPLAoBL3FJRPFyySVqESXrkoQ8TJJPFpqanTWqTHiZZIaYwt4u3Tt8hTb5uNfVxyt7pfBLzb53hLxdqkt8807e5vXO/f+esjXmEXO4P9buiEMKVxlJjt2wzmfce5s56cwQvKZrF/YLE5tbyEuRco2oy2+gTTx9dAy9ApLEXm+Q6fJiRB/9zyIfBXd7Pv/QkWv3p4PYS5CjI0yyh4fwzyGIRy6XkXfmlzeQq/fteyWw0HZa/HK279YtAq0ewX8OnHfwypZS/ElbH6yCAz5NRxd6xU4L5/CFSTMpjtTZMVaKZhoS8Hbqj2dfgFBSfAE",
      position = {0, 0}
    }
    local technology = "rocket-fuel-productivity"
    local technologies = prototypes.technology

    for name, prerequisite in pairs (technologies[technology].prerequisites) do
      game.forces.player.technologies[name].researched = true
    end

    chest_1 = game.surfaces[1].find_entity("infinity-chest", {-6.5, 8.5})
    chest_2 = game.surfaces[1].find_entity("infinity-chest", {6.5, 8.5})

     step_1 = function()
      local wait = 70
      script.on_nth_tick(1, function()
        wait = wait - 1
        if wait == 0 then
          step_2()
        end
      end)
    end

    step_2 = function()
      script.on_nth_tick(1, function()
        if chest_1 then
          chest_1.insert({name = "agricultural-science-pack", count = 1})
        end
        if chest_2 then
          chest_2.insert({name = "agricultural-science-pack", count = 1, spoil_percent = 0.95})
        end
        step_1()
      end)
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

    step_1()
  ]]
}

simulations.spoilables_result =
{
  init_update_count = 200,
  planet = "gleba",
  init =
  [[
    game.simulation.camera_position = {0, 1.5}
    game.simulation.camera_alt_info = true
    game.forces.player.recipes["biochamber"].enabled = true
    game.forces.player.recipes["jellynut-processing"].enabled = true

    game.surfaces[1].create_entities_from_blueprint_string
    {
      string = "0eNrNmmGT2iAQhv8Ln2MnQCDBv9LpOFHxSicSC6RTe+N/L9Getj3s7e7dzfS+nejzLhsW3kUf2XqY7CE4n9jykbnN6CNbfnxk0T34fphf8/3esiXb9TEtUuh9PIwhLdZ2SOxUMee39jtb8tOnilmfXHL2Ajj/c1z5ab+2Ib+hegI5v3M+Dy02n21MrGKHMeaPjX4Wy6hF035QFTuyZWs+qLPE5QOraFNy/iHObwx2P36zqymPDckGu125ZPd5KIXJVuzy6iWSX7p+SsHlqGKW3IzTPOEc1H7czoN9Wgy2P4dzm9HpVD2bh7jOw34/BBvjYhj7bR4pzEP/PoutC3ZzGW4qlo6HmTFO6TDNeXymI6t/Jb4g1jwlrftbrivgGzLeQPAKkSV5h8sFIE0asazq1yyrXT9EW1oQLSIC/i4RdPBkS/OKJWmQa0a2qCXJazIftCY5R+RJv2ZRcgFfE7L5jzc7Tt6FuvrZCivx0duQxPEVli9wfI3lP+0AHQct2RbLr3H8jhx/DeIbcvwgvkBvGeYun4uSAMcKdEgBQd30oAKS/IgF6BE05EcM4yty/BLE1+T4YfyWHH8D4nfk+GF8Q45fQfiyJscP43Ny/BrEF+T4YXx6/bYgPr1+YXwF90Lq6h6oXqhkYqSG+z4lf9cv+z7n77Vs2FJX/M/5vrSXS2ytqxopgC52gxNo0NXeIQXQ5d4iBdD1rpEC6IJXSAFy7w8VUGRXDxTQZFsPFKAf2rDbF/qhDePTD21YghT91DaQxkpxsrGH8QXZ18P4kmzrYXxsDUuN42NLWDY4PraCpcLxsQUsBY6PLWApcXz0XRuuvjS6ceY4PuKuTZh74Jctl0bctIn2Pdyl/qvSnY82pDs33b8CMHPrXmI1YNZ1P7rLulXw2o2bz/355X8FdWnHc/bdOedf7DAc/ZQWhzBu8gPMGWJPw6uvUz9ktfmicQz7fig+Gw2L4DaVN4+gJfQeRr3l6ujQvYdRlN5DG2rvUdIrfc1RU3sPqACn9h5QAUHtPaACktp7QAUaau8BFVDU3gMqoKm9B1SgpfYeUIGO2ntABQzhQGnKh0BHvh9/HmzpmO/I1+NAviAciPdyQbbkwFjJlhzIJ1tyIJ9syYF8siUH8smWHMgnW3IY35AtOZCPt+QF8MtOxFAs+ZuaLnOrdDvkyIPbLKy34eGYN5BM2PUbe/+HKLzO2WM3eznYB+u3fTjmj6yn3c6GVXQ/7PzG618piNt2EKd1TP1ZqnTz8oLq/MOqecKzjb7+VKti32yIZ4zSwqhGNKZupNHmdPoJ/KJxTg==",
      position = {0, 0}
    }
    chest_1 = game.surfaces[1].find_entities_filtered{name = "infinity-chest"}[3]
    chest_2 = game.surfaces[1].find_entities_filtered{name = "infinity-chest"}[5]
    step_1 = function()
      local wait = 10
      script.on_nth_tick(1, function()
        wait = wait - 1
        if wait == 0 then
          step_2()
        end
      end)
    end
    step_2 = function()
      script.on_nth_tick(1, function()
        if chest_1 then
          chest_1.insert({name = "jellynut", count = 1})
        end
        if chest_2 then
          chest_2.insert({name = "jellynut", count = 1, spoil_percent = 0.8})
        end
        step_1()
      end)
    end
    step_1()
  ]]
}

simulations.fulgora_briefing =
{
  init_update_count = 200,
  planet = "fulgora",
  mute_wind_sounds = false,
  init =
  [[
    require("__core__/lualib/story")
    game.simulation.camera_position = {0, 1.5}

    for x = -11, 10, 1 do
      for y = -4, 6 do
        game.surfaces[1].set_tiles{{position = {x, y}, name = "fulgoran-sand"}}
      end
    end

    for x = -11, 10, 1 do
      for y = 1, 6 do
        game.surfaces[1].set_tiles{{position = {x, y}, name = "fulgoran-dunes"}}
      end
    end

    for x = 2, 10, 1 do
      for y = -4, 0 do
        game.surfaces[1].set_tiles{{position = {x, y}, name = "fulgoran-walls"}}
      end
    end

    for x = 0, 10, 1 do
      for y = 0, 6 do
        game.surfaces[1].set_tiles{{position = {x, y}, name = "fulgoran-conduit"}}
      end
    end

    for x = 2, 10, 1 do
      for y = -4, 0 do
        game.surfaces[1].set_tiles{{position = {x, y}, name = "fulgoran-machinery"}}
      end
    end

    for x = -11, -8, 1 do
      for y = -4, 6 do
        game.surfaces[1].set_tiles{{position = {x, y}, name = "oil-ocean-deep"}}
      end
    end

    for k, position in pairs ({{-8, -4}, {-7, -4},
                               {-7, -3}, {-6, -3},
                               {-7, -2}, {-6, -2},
                               {-8, -1}, {-7, -1},
                               {-8, 0}, {-7, 0},
                               {-9, 1}, {-8, 1},
                               {-9, 2}, {-8, 2}, {-7, 2},
                               {-9, 3}, {-8, 3}, {-7, 3},
                               {-10, 4}, {-9, 4}, {-8, 4}, {-7, 4},
                               {-10, 5}, {-9, 5}, {-8, 5}, {-7, 5},
                               {-10, 6}, {-9, 6}, {-8, 6}}) do
      game.surfaces[1].set_tiles{{position = position, name = "oil-ocean-shallow"}}
    end

    game.surfaces[1].create_entity{name="fulgoran-ruin-stonehenge", position = {3, -1}}
    game.surfaces[1].create_entity{name="fulgoran-ruin-stonehenge", position = {8, 2}}
    game.surfaces[1].create_entity{name="fulgoran-ruin-stonehenge", position = {4, 4}}

    for x = 5.5, 10.5, 1 do
      for y = -4, 4, 1 do
        game.surfaces[1].create_entity{name = "scrap", amount = 10, position = {x, y}}
      end
    end

    game.surfaces[1].create_entity{name = "scrap", amount = 10, position = {3, 6}}
    game.surfaces[1].create_entity{name = "scrap", amount = 10, position = {5, 5}}
    game.surfaces[1].create_entity{name = "cliff-fulgora", position = {-1 ,-6}, cliff_orientation = "north-to-south"}
    game.surfaces[1].create_entity{name = "cliff-fulgora", position = {-1 ,-1}, cliff_orientation = "north-to-east"}

    local story_table =
    {
      {
        {
          name = "start",
          condition = story_elapsed_check(2),
          action = function() game.surfaces[1].execute_lightning{name = "lightning", position = {-7, 2}} end
        },
        {
          condition = story_elapsed_check(1.5),
          action = function() game.surfaces[1].execute_lightning{name = "lightning", position = {-2, -4}} end
        },
        {
          condition = story_elapsed_check(3),
          action = function() game.surfaces[1].execute_lightning{name = "lightning", position = {8, 5}} end
        },
        {
          condition = story_elapsed_check(1),
          action = function() game.surfaces[1].execute_lightning{name = "lightning", position = {-3, 2}} end
        },
        {
          condition = story_elapsed_check(2),
          action = function() game.surfaces[1].execute_lightning{name = "lightning", position = {-6, -1}} end
        },
        {
          condition = story_elapsed_check(1),
          action = function() game.surfaces[1].execute_lightning{name = "lightning", position = {6, 4}} end
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

simulations.lightning_mechanics =
{
  planet = "fulgora",
  mute_wind_sounds = false,
  init =
  [[
    require("__core__/lualib/story")
    game.simulation.camera_position = {0, 1.5}
    game.forces.player.recipes["lightning-rod"].enabled = true

    for x = -11, 10, 1 do
      for y = -4, 6 do
        game.surfaces[1].set_tiles{{position = {x, y}, name = "fulgoran-sand"}}
      end
    end

    for x = -11, 10, 1 do
      for y = 1, 6 do
        game.surfaces[1].set_tiles{{position = {x, y}, name = "fulgoran-dunes"}}
      end
    end

    for x = 2, 10, 1 do
      for y = -4, 0 do
        game.surfaces[1].set_tiles{{position = {x, y}, name = "fulgoran-walls"}}
      end
    end

    for x = 0, 10, 1 do
      for y = 0, 6 do
        game.surfaces[1].set_tiles{{position = {x, y}, name = "fulgoran-conduit"}}
      end
    end

    for x = 2, 10, 1 do
      for y = -4, 0 do
        game.surfaces[1].set_tiles{{position = {x, y}, name = "fulgoran-machinery"}}
      end
    end

    game.surfaces[1].create_entity{name="lightning-rod", position = {-7, 3}}
    game.surfaces[1].create_entity{name="medium-electric-pole", position = {-4, 0}}
    game.surfaces[1].create_entity{name="medium-electric-pole", position = {2, 0}}
    game.surfaces[1].create_entity{name="accumulator", position = {-1, 3}}
    game.surfaces[1].create_entity{name="radar", position = {5, 2}}

    local story_table =
    {
      {
        {
          name = "start",
          condition = story_elapsed_check(1),
          action = function() game.surfaces[1].execute_lightning{name = "lightning", position = {-7, 3}} end
        },
        {
          condition = story_elapsed_check(4),
          action = function()
            accumulator2 = game.surfaces[1].create_entity{name="accumulator", position = {-3, 3}}
            accumulator3 = game.surfaces[1].create_entity{name="accumulator", position = {1, 3}}
          end
        },
        {
          condition = story_elapsed_check(1),
          action = function() game.surfaces[1].execute_lightning{name = "lightning", position = {-7, 3}} end
        },
        {
          condition = story_elapsed_check(8),
          action = function()
            accumulator2.destroy()
            accumulator3.destroy()
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

simulations.gleba_briefing =
{
  planet = "gleba",
  mute_wind_sounds = false,
  init =
  [[
    game.simulation.camera_position = {0, 1.5}

    for x = -12, 12, 1 do
      for y = -6, 6 do
        game.surfaces[1].set_tiles{{position = {x, y}, name = "wetland-jellynut"}}
      end
    end

    for k, position in pairs ({{-12, -6}, {-11, -6}, {-10, -6}, {-9, -6}, {-8, -6}, {-7, -6}, {-6, -6}, {-5, -6}, {-4, -6}, {-3, -6},
                               {-2, -6}, {-1, -6}, {0, -6}, {1, -6}, {2, -6}, {3, -6}, {-12, -5}, {-11, -5}, {-10, -5}, {-9, -5},
                               {-8, -5}, {-7, -5}, {-6, -5}, {-5, -5}, {-4, -5}, {-3, -5}, {-2, -5}, {-1, -5}, {0, -5}, {1, -5}, {2, -5},
                               {-12, -4}, {-11, -4}, {-10, -4}, {-9, -4}, {-8, -4}, {-7, -4}, {-6, -4}, {-5, -4}, {-4, -4}, {-3, -4},
                               {-2, -4}, {-1, -4}, {0, -4}, {1, -4}, {2, -4}, {-12, -3}, {-11, -3}, {-10, -3}, {-9, -3}, {-8, -3},
                               {-7, -3}, {-6, -3}, {-5, -3}, {-4, -3}, {-3, -3}, {-2, -3}, {-1, -3}, {0, -3}, {1, -3}, {-12, -2}, {-11, -2},
                               {-10, -2}, {-9, -2}, {-8, -2}, {-7, -2}, {-6, -2}, {-5, -2}, {-4, -2}, {-3, -2}, {-2, -2}, {-1, -2},
                               {0, -2}, {-12, -1}, {-11, -1}, {-8, -1}, {-7, -1}, {-6, -1}, {-5, -1}, {-4, -1}, {-3, -1}, {-2, -1},
                               {-1, -1}, {0, -1}, {-12, 0}, {-11, 0}, {-8, 0}, {-7, 0}, {-6, 0}, {-5, 0}, {-4, 0}, {-3, 0}, {-2, 0},
                               {-1, 0}, {-12, 1}, {-11, 1}, {-10, 1}, {-9, 1}, {-8, 1}, {-7, 1}, {-6, 1}, {-5, 1}, {-4, 1}, {-12, 2},
                               {-9, 2}, {-8, 2}, {-7, 2}, {-6, 2}, {-5, 2}, {-4, 2}, {-12, 3}, {-9, 3}, {-8, 3}, {-7, 3}, {-6, 3},
                               {-5, 3}, {-4, 3}, {-3, 3}, {-2, 3}, {-12, 4}, {-11, 4}, {-10, 4}, {-9, 4}, {-8, 4}, {-7, 4}, {-6, 4},
                               {-5, 4}, {-4, 4}, {-12, 5}, {-11, 5}, {-10, 5}, {-9, 5}, {-8, 5}, {-12, 6}, {-11, 6}}) do
      game.surfaces[1].set_tiles{{position = position, name = "midland-yellow-crust"}}
    end

    for k, position in pairs ({{1, -2}, {-10, -1}, {-9, -1}, {-10, 0}, {-9, 0}, {0, 0}, {-3, 1}, {-2, 1}, {-1, 1}, {-11, 2}, {-10, 2},
                               {-3, 2}, {-2, 2}, {-1, 2}, {-11, 3}, {-10, 3}}) do
      game.surfaces[1].set_tiles{{position = position, name = "midland-yellow-crust-2"}}
    end

    for k, position in pairs ({{1, -1}, {1, 0}, {0, 1}, {1, 1}, {2, 1}, {0, 2}, {1, 2}, {2, 2}, {-1, 3}, {0, 3}, {1, 3}}) do
      game.surfaces[1].set_tiles{{position = position, name = "lowland-red-vein-2"}}
    end

    game.surfaces[1].set_tiles{{position = {-7, 5}, name = "lowland-red-vein-dead"}}
    game.surfaces[1].set_tiles{{position = {-10, 6}, name = "lowland-red-vein-dead"}}


    local create_list = {}

    for k, position in pairs ({{-14, -8}, {-13, -8}, {-12, -6}, {-10, -7}, {-8, -7}, {-11, -3}, {-11, 0}}) do
      table.insert(create_list, { name = "dark-mud-decal", position = position, amount = 1})
    end

    for k, position in pairs ({{-7, -9}, {0, -9}, {-1, -8}, {-12, -7}, {-6, -6}}) do
      table.insert(create_list, { name = "light-mud-decal", position = position, amount = 1})
    end

    for k, position in pairs ({{-10, -6}, {3, -7}, {7, -6}, {6, -4}, {7, -4}, {9, -5}, {6, 0}, {2, 1}, {-13, 5}}) do
      table.insert(create_list, { name = "pale-lettuce-lichen-cups-1x1", position = position, amount = 1})
    end

    for k, position in pairs ({{-1, -6}, {-9, -4}, {-2, -5}, {-2, -4}, {5, -4}, {1, -3}, {9, 0}, {-4, 2}, {-3, 2}, {5, 2}, {9, 1}, {12, 1}}) do
      table.insert(create_list, { name = "pale-lettuce-lichen-cups-1x1", position = position, amount = 2})
    end

    for k, position in pairs ({{-12, -8}, {-13, -6}, {-11, -7}, {-8, -6}, {-6, -6}, {-11, -5}, {-9, -4}, {0, -5}, {4, -4}, {7, -4},
                               {-9, -2}, {1, -2}, {2, -2}, {2, 0}, {2, 2}, {-4, 4}, {-12, 6}, {-4, 5}}) do
      table.insert(create_list, { name = "pale-lettuce-lichen-cups-3x3", position = position, amount = 1})
    end

    table.insert(create_list, { name = "pale-lettuce-lichen-cups-3x3", position = {-12, -1}, amount = 2 })

    for k, position in pairs ({{-10, 0}, {2, 3}, {1, 4}}) do
      table.insert(create_list, { name = "pale-lettuce-lichen-cups-6x6", position = position, amount = 1})
    end

    table.insert(create_list, { name = "cream-nerve-roots-veins-dense", position = {3, -9}, amount = 1 })

    table.insert(create_list, { name = "cream-nerve-roots-veins-sparse", position = {-12, 6}, amount = 1 })

    for k, position in pairs ({{-11, -6}, {-8, -6}, {-12, -4}, {-11, -5}, {-10, -5}, {-11, -4}, {-10, -4}, {-6, -5}, {-12, -2},
                               {-10, -3}, {-10, -2}, {-8, -3}, {-9, -2}, {-7, -3}, {-10, -1}}) do
      table.insert(create_list, { name = "knobbly-roots-orange", position = position, amount = 1})
    end

    table.insert(create_list, { name = "knobbly-roots-orange", position = {-10, -6}, amount = 2 })

    table.insert(create_list, { name = "brambles", position = {0, -6}, amount = 1 })
    table.insert(create_list, { name = "brambles", position = {0, -5}, amount = 1 })

    table.insert(create_list, { name = "blood-grape", position = {2, -7}, amount = 1 })

    table.insert(create_list, { name = "matches-small", position = {-5, -5}, amount = 1 })

    for k, position in pairs ({{6, -5}, {9, -4}, {10, -4}, {8, 2}, {10, 1}, {9, 2}, {9, 4}, {11, -6}, {11, -5}, {12, -4}, {11, -3}, {11, 5}}) do
      table.insert(create_list, { name = "coral-water", position = position, amount = 1})
    end

    for k, position in pairs ({{7, -7}, {10, -6}, {6, -4}, {8, -5}, {9, -5}, {9, 0}, {10, 2}, {8, 3}, {10, 3}, {13, -4}, {12, 1}, {12, 3}, {12, 4}}) do
      table.insert(create_list, { name = "coral-water", position = position, amount = 2})
    end

    for k, position in pairs ({{-5, -3}, {-4, -2}, {-5, -1}, {-4, -1}, {-1, -1}, {-11, 1}, {-11, 3}}) do
      table.insert(create_list, { name = "pink-lichen-decal", position = position, amount = 1})
    end

    for k, position in pairs ({{1, 1}, {2, 1}, {2, 2}, {-1, 3}}) do
      table.insert(create_list, { name = "split-gill-1x1", position = position, amount = 1})
    end

    table.insert(create_list, { name = "yellow-lettuce-lichen-cups-1x1", position = {5, -3}, amount = 1 })

    for k, position in pairs ({{-11, -6}, {-10, -6}, {-8, -5}, {-2, -4}}) do
      table.insert(create_list, { name = "yellow-lettuce-lichen-cups-3x3", position = position, amount = 1})
    end

    table.insert(create_list, { name = "yellow-lettuce-lichen-cups-3x3", position = {-11, -2}, amount = 2 })

    for k, position in pairs ({{-10, -6}, {-11, -4}, {-9, -4}, {-3, -4}, {-2, -4}, {1, -3}, {-4, 2}, {-3, 2}, {-12, 4}, {-11, 3},
                               {-10, 4}, {-8, 3}, {-11, 6}, {-7, 5}}) do
      table.insert(create_list, { name = "yellow-lettuce-lichen-1x1", position = position, amount = 1})
    end

    for k, position in pairs ({{-7, -6}, {-5, -7}, {-4, -7}, {-13, -5}, {-12, -5}, {-5, -5}, {-8, -3}, {-3, -3}, {-3, -2}, {0, -2},
                               {-5, -1}, {-11, 1}, {-5, 2}, {-6, 3}}) do
      table.insert(create_list, { name = "yellow-lettuce-lichen-3x3", position = position, amount = 1})
    end

    game.surfaces[1].create_decoratives{decoratives = create_list}

    game.surfaces[1].create_entity{name = "boompuff", position = {-6.9375, -6.375}}
    game.surfaces[1].create_entity{name = "boompuff", position = {-9.375, -0.5}}
    game.surfaces[1].create_entity{name = "water-cane", position = {1.4375, 4.1875}}
    game.surfaces[1].create_entity{name = "water-cane", position = {3.125, 4.4375}}
    game.surfaces[1].create_entity{name = "water-cane", position = {1.1875, 6.1875}}
    game.surfaces[1].create_entity{name = "water-cane", position = {2.125, 6.4375}}
    game.surfaces[1].create_entity{name = "water-cane", position = {3.1875, 6.75}}
    game.surfaces[1].create_entity{name = "water-cane", position = {4.75, 6}}
    game.surfaces[1].create_entity{name = "water-cane", position = {5.4375, 6.125}}
    game.surfaces[1].create_entity{name = "water-cane", position = {7.5625, 6.375}}

    game.surfaces[1].create_entity{name = "small-strafer-pentapod", position = {6, 0}}
  ]]
}

simulations.agriculture =
{
  init_update_count = 200,
  planet = "gleba",
  mute_wind_sounds = false,
  init =
  [[
    require("__core__/lualib/story")
    game.simulation.camera_position = {0, 1.5}

    for x = -11, 2, 1 do
      for y = -4, 6 do
        game.surfaces[1].set_tiles{{position = {x, y}, name = "wetland-yumako"}}
      end
    end

    for x = 3, 10, 1 do
      for y = -4, 6 do
        game.surfaces[1].set_tiles{{position = {x, y}, name = "lowland-olive-blubber"}}
      end
    end

    for k, position in pairs ({{-2, -4}, {-1, -4}, {0, -4}, {1, -4}, {2, -4},
                               {-1, -3}, {0, -3}, {1, -3}, {2, -3},
                               {-1, -2}, {0, -2}, {1, -2}, {2, -2},
                               {-1, -1}, {0, -1}, {1, -1}, {2, -1},
                               {-2, 0}, {-1, 0}, {0, 0}, {1, 0}, {2, 0},
                               {-2, 1}, {-1, 1}, {0, 1}, {1, 1}, {2, 1},
                               {-2, 2}, {-1, 2}, {0, 2}, {1, 2}, {2, 2},
                               {-3, 3}, {-2, 3}, {-1, 3}, {0, 3}, {1, 3}, {2, 3},
                               {-3, 4}, {-2, 4},
                               {-4, 5}, {-3, 5}
                               }) do
      game.surfaces[1].set_tiles{{position = position, name = "lowland-olive-blubber"}}
    end

    game.surfaces[1].create_entities_from_blueprint_string
    {
      string = "0eNqtmuFu4joQhd/Fv8MK22OT9FVWFQpgeq0NCUqc3eVWvPt1YAGppL0en+0vmuTMsZ3vTJ2Ud7FpRnfsfRvEy7vw264dxMv3dzH4t7ZupmNtfXDiRezrISxCX7fDsevDYuOaIM6F8O3O/RYv8vxaCNcGH7y7Frj8clq342Hj+nhBcSvk271v46nF9h83BFGIYzdEWddOZlMpvfpmCnGKn4z8Zi4eV8V6cCH49m2Yruzdofvp1mM81wTXu93aB3eIp/Z1M7hCXA9fx/LH+TQe6h/dYnBuF2233ThNWi4Lceh20/k6LBpXX8b0mNb5XDxNRt0nM4R6+2Ph28H10e3ryag4mZliuvhqib+sqC/Ls/O9216vKGfq072+a+J1vd8uXOv6t1Mcdhzzvt66GRda3kYdHTbjfu/69eD/ddOC3X9m3MxjacZNXJ1LzZny6l5+pojNXxKTsiSr/PqUUr/Mr79KqV/l17cp9adM5BpUHw1ozkDmG5RJM1Bcg4o5A3ZsS6YBMQ1IMg0M12DJNODGmDTTgJtjUkwDbpDJMA24SSbiGShukomZZMVNMlmmATfJxEyy4iaZmElW3CQbZpIVN8mGmWT1SLL7fezdMCyart7NbniM/rRyIcLpeN0CHsdp9/hstErfJpqPUeBtE0M/utm9XcnY3N1JsMv5zZ2q0qs9GriVH9dOqrmd4zK7wT47zN13LbMbbKKBym6wiQY6u8EmGlB2g000MNkNNtHAZjfYRINVdoNNNCizG2yiQZXdYNMMaMlvsDOV/7/BksxpsFb+xQZLj8zXb/FpdGzC2NfNInS/5pvsA7dPnqBJ8x46rT1Pryt+xZWb3g98N4UpYg3zGg8G3/x5gfE0Dnt7xDzf7Zq63cV5N5el/lRgUwUrruDmsOI6JAtKpmD6g3d9THsI6j74vd/6eJNvr2A6/4nfEpNLTK4wucbkhMnNszyNnpJLT8mlp+TSU2H0VBg9FUZPhdFTYfRUGD0Vl56KS0/FpSdvRjeW7BJiKVcuMbnC5BqTEyY3z/IkltIFK6bgDoPEYJAYDBKDQWIwSAwGicEguTBILgySC4PCYFAYDAqDQWEwKAwGhcGguDAoLgyKC4PGYNAYDBqDQWMwaAwGjcGguTBoLgypAsJuB2G3444iYSgShiJhKBKGImEoEoZiptxi8hUmLzE5Rh1h1BFGHWHUEUbdPbAGC6zBAmuwwBossAYLrMECa7DAGiywBguswQJrsMAaLLAGC6zBAmuwwFossBYLrMUCa7HAWiywFgusxQJrscBaLLAWC6zFAmuxwFossAny10JM//yJVzy+VVqIn64fLgVVKanUxlpLxpI6n/8DNjfWKA==",
      position = {3, -1}
    }

    local story_table =
    {
      {
        {
          name = "start",
          action = function() game.speed = 1; game.forces.player.bulk_inserter_capacity_bonus = 12 end
        },
        {
          condition = story_elapsed_check(17),
          action = function() game.speed = 10 end
        },
        {
          condition = story_elapsed_check(290),
          action = function() game.speed = 1 end
        },
        {
          name = "continue",
          action = function() game.speed = 1 end
        },
        {
          action = function() story_jump_to(storage.story, "continue") end
        }
      }
    }
    tip_story_init(story_table)
  ]]
}

simulations.vulcanus_briefing =
{
  init_update_count = 200,
  planet = "vulcanus",
  mute_wind_sounds = false,
  init =
  [[
    game.simulation.camera_position = {0, 1.5}

    for x = -11, 10, 1 do
      for y = -4, 6 do
        game.surfaces[1].set_tiles{{position = {x, y}, name = "volcanic-ash-dark"}}
      end
    end

    for k, position in pairs ({{-8, 3}, {-7, 3},
                               {-10, 4}, {-9, 4}, {-8, 4}, {-7, 4}, {-6, 4},
                               {-10, 5}, {-9, 5}, {-8, 5}, {-7, 5},
                               {-11, 6}, {-10, 6}, {-9, 6}, {-8, 6}}) do
      game.surfaces[1].set_tiles{{position = position, name = "lava"}}
    end

    for k, position in pairs ({{-8, 2}, {-7, 2},
                               {-9, 3}, {-6, 3},
                               {-11, 4}, {-5, 4},
                               {-11, 5}, {-6, 5},
                               {-12, 6}, {-7, 6}}) do
      game.surfaces[1].set_tiles{{position = position, name = "volcanic-cracks-hot"}}
    end

    for k, position in pairs ({{-9, 2}, {0, 2}, {1, 2},
                               {-11, 3}, {-10, 3}, {-1, 3}, {0, 3}, {1, 3},
                               {-2, 4}, {-1, 4}, {0, 4}, {1, 4}, {2, 4}, {3, 4},
                               {-5, 5}, {-4, 5}, {-3, 5}, {-2, 5}, {-1, 5}, {0, 5}, {1, 5}, {2, 5}, {3, 5},
                               {-6, 6}, {-5, 6}, {-4, 6}, {-3, 6}, {-2, 6}, {-1, 6}, {0, 6}, {1, 6}, {2, 6}}) do
      game.surfaces[1].set_tiles{{position = position, name = "volcanic-smooth-stone"}}
    end

    for k, position in pairs ({{3, 6}, {4, 6}, {5, 6}, {6, 6}, {8, 6}, {9, 6}}) do
      game.surfaces[1].set_tiles{{position = position, name = "lava-hot"}}
    end

    for k, position in pairs ({{-11, 0}, {-10, 0}, {-9, 0}, {-8, 0}, {-7, 0},
                               {-11, 1}, {-10, 1}, {-9, 1}, {-8, 1}, {-7, 1}, {-6, 1}, {-5, 1},
                               {-11, 2}, {-10, 2}, {-6, 2}, {-5, 2}, {-4, 2}, {-1, 2},
                               {-5, 3}, {-4, 3}, {-3, 3}, {-2, 3},
                               {-4, 4}, {-3, 4}, {4, 4}, {5, 4}, {6, 4}, {7, 4}, {8, 4}, {9, 4}, {10, 4},
                               {4, 5}, {5, 5}, {6, 5}, {7, 5}, {8, 5}, {9, 5}, {10, 5},
                               {7, 6}, {10, 6}}) do
      game.surfaces[1].set_tiles{{position = position, name = "volcanic-soil-dark"}}
    end

    for k, position in pairs ({{-11, -4}, {-10, -4}, {-9, -4}, {-8, -4}, {-1, -4}, {0, -4}, {1, -4}, {2, -4}, {3, -4}, {4, -4}, {5, -4}, {6, -4}, {7, -4}, {8, -4}, {9, -4}, {10, -4},
                               {-11, -3}, {-10, -3}, {-9, -3}, {-8, -3}, {-7, -3}, {-6, -3}, {0, -3}, {1, -3}, {2, -3}, {3, -3}, {4, -3}, {5, -3}, {6, -3}, {7, -3}, {8, -3}, {9, -3}, {10, -3},
                               {-9, -2}, {-8, -2}, {-7, -2}, {-5, -2}, {1, -2}, {2, -2}, {3, -2}, {4, -2}, {5, -2}, {6, -2}, {7, -2}, {8, -2}, {9, -2},
                               {2, -1}, {3, -1}, {4, -1}, {5, -1}, {6, -1}, {7, -1}, {8, -1},
                               {5, 0}, {6, 0}, {7, 0},
                               {5, 1}, {6, 1}}) do
      game.surfaces[1].set_tiles{{position = position, name = "volcanic-ash-cracks"}}
    end

    game.surfaces[1].create_entity{name = "vulcanus-chimney", position = {4.5, -0.5}}
    game.surfaces[1].create_entity{name = "ashland-lichen-tree", position = {8.5, -3.5}}
    game.surfaces[1].create_entity{name = "ashland-lichen-tree", position = {6.5, -2.5}}
    game.surfaces[1].create_entity{name = "ashland-lichen-tree", position = {8.5, 0.5}}
    game.surfaces[1].create_entity{name = "ashland-lichen-tree", position = {5.5, 1.5}}
    game.surfaces[1].create_entity{name = "ashland-lichen-tree-flaming", position = {9.5, 1.5}}

    local create_list = {}
    table.insert(create_list, { name = "v-red-pita", position = {-3, 0}, amount = 1})
    for k, position in pairs ({{-10, -3}, {-8, -3}, {4, -3},
                               {8, 1}}) do
      table.insert(create_list, { name = "v-brown-carpet-grass", position = position, amount = 1})
    end
    for k, position in pairs ({{-10, 2},
                               {-8, 3}, {-7, 3}, {5, 3}, {7, 3},
                               {3, 4}, {6, 4},
                               {1, 5}}) do
      table.insert(create_list, { name = "tiny-rock-cluster", position = position, amount = 1})
    end
    game.surfaces[1].create_decoratives{decoratives = create_list}

  ]]
}

simulations.lava_processing =
{
  init_update_count = 100,
  planet = "vulcanus",
  mute_wind_sounds = false,
  init =
  [[
    game.simulation.camera_position = {0, 1.5}
    game.forces.player.technologies["foundry"].researched = true

    for x = -11, 10, 1 do
      for y = -4, 6 do
        game.surfaces[1].set_tiles{{position = {x, y}, name = "volcanic-ash-dark"}}
      end
    end

    for k, position in pairs ({{-8, 2}, {-7, 2},
                               {-9, 3}, {-6, 3},
                               {-11, 4}, {-5, 4},
                               {-11, 5}, {-6, 5},
                               {-12, 6}, {-7, 6}}) do
      game.surfaces[1].set_tiles{{position = position, name = "volcanic-cracks-hot"}}
    end

    for k, position in pairs ({{-9, 2}, {0, 2}, {1, 2},
                               {-11, 3}, {-10, 3}, {-1, 3}, {0, 3}, {1, 3},
                               {-2, 4}, {-1, 4}, {0, 4}, {1, 4}, {2, 4}, {3, 4},
                               {-5, 5}, {-4, 5}, {-3, 5}, {-2, 5}, {-1, 5}, {0, 5}, {1, 5}, {2, 5}, {3, 5},
                               {-6, 6}, {-5, 6}, {-4, 6}, {-3, 6}, {-2, 6}, {-1, 6}, {0, 6}, {1, 6}, {2, 6}}) do
      game.surfaces[1].set_tiles{{position = position, name = "volcanic-smooth-stone"}}
    end

    for k, position in pairs ({{-11, 0}, {-10, 0}, {-9, 0}, {-8, 0}, {-7, 0},
                               {-11, 1}, {-10, 1}, {-9, 1}, {-8, 1}, {-7, 1}, {-6, 1}, {-5, 1},
                               {-11, 2}, {-10, 2}, {-6, 2}, {-5, 2}, {-4, 2}, {-1, 2},
                               {-5, 3}, {-4, 3}, {-3, 3}, {-2, 3},
                               {-4, 4}, {-3, 4}, {4, 4}, {5, 4}, {6, 4}, {7, 4}, {8, 4}, {9, 4}, {10, 4},
                               {4, 5}, {5, 5}, {6, 5}, {7, 5}, {8, 5}, {9, 5}, {10, 5},
                               {7, 6}, {10, 6}}) do
      game.surfaces[1].set_tiles{{position = position, name = "volcanic-soil-dark"}}
    end

    for k, position in pairs ({{-11, -4}, {-10, -4}, {-9, -4}, {-8, -4}, {-1, -4}, {0, -4}, {1, -4}, {2, -4}, {3, -4}, {4, -4}, {5, -4}, {6, -4}, {7, -4}, {8, -4}, {9, -4}, {10, -4},
                               {-11, -3}, {-10, -3}, {-9, -3}, {-8, -3}, {-7, -3}, {-6, -3}, {0, -3}, {1, -3}, {2, -3}, {3, -3}, {4, -3}, {5, -3}, {6, -3}, {7, -3}, {8, -3}, {9, -3}, {10, -3},
                               {-9, -2}, {-8, -2}, {-7, -2}, {-5, -2}, {1, -2}, {2, -2}, {3, -2}, {4, -2}, {5, -2}, {6, -2}, {7, -2}, {8, -2}, {9, -2},
                               {2, -1}, {3, -1}, {4, -1}, {5, -1}, {6, -1}, {7, -1}, {8, -1},
                               {5, 0}, {6, 0}, {7, 0},
                               {5, 1}, {6, 1}}) do
      game.surfaces[1].set_tiles{{position = position, name = "volcanic-ash-cracks"}}
    end

    for x = -11, -7, 1 do
      for y = 5, 7 do
        game.surfaces[1].set_tiles{{position = {x, y}, name = "lava"}}
      end
    end

    game.surfaces[1].create_entities_from_blueprint_string
    {
      string = "0eNqlmNuS4iAQht+F62QqCZCDrzJlWTGSGWoTyAKZHXfKd18SV3RXlMN4pYF8f3dD0y1fYD/MZBKUKbD5ArTjTILN6xeQ9I21w/KMtSMBG9DzmR3EEZwSQNmBfIJNfkps81qpUiVaJicuVLong7p5pzhtE0CYooqSs9D647hj87gnQkOTC4iynjI9lHbvRCqQgIlL/Rpni5hGpQ16wQk4gk2ZveBV4vzCThKlKHuTy0RBRv5BdrMeGxQR5LCjiox6qG8HSRJwfnw25a9w1w6dnqQVO+2zjgvOEjDywzLWqnQg7WqOicL2tATiPz8K4wcZSKcE7VLCiHg7pjrURPRtRywu1dXZIR1acKBCv7gO1gnYz31PxE7S35qZZ+ZjkYZGWs57qdqVYdHCFy0LA13N/5wEkTIdeHvQI8+WobizWh2nhcFnNc3LNrjTwcmzffNMDK5rfitnwZfReOSDr6Lx2AdfG/xEJ+t2aW55FkLjJNQOQp45EaULkTsRlQtROBHIhYBOBHYhkBNRuBDYiYAuROlEZC5E5UTkLkQdvfdLn72fN9H8yodfZNH82oufR/MbL/41I/bz8ENXFUmEsh/Q8CE5L2zoa6Zcir4Fmv0bDo2k61k/cl1QWUoFZ2kv+JgO7UcLLhN2P+d20GJ6IuNi1J2DzQDkYUDVPF6PG3M6HXzdC6z2BFrhTNXmku1Vbk+SwpmqTe5CVN7rbM7yh6w6qDOoMiuk8TfI5RzMvFlmuR+yrgnH+16+c0HSaR6np+tW+KQaLAJT2ZTlyqtJgTCa72c/CuXXD/nWAwPiaAG/AIW2caafuOfbHQht5EzP4ysQWi1NO+MrEFouTbPjKYBC66VphXwFQgumaZR8BYLTOAsUCM7jPFAARXvgdVAgHO3AHR/Z+KF5XDVhBxHyL5amf6mQl+l19Bnt9VcPNdF8r3+qOIs+ov34eTTfKz648L+QuKKrRxcSlD26j4ABOs03dJD/PdfVnzrinkuJmdj6JYwDLGi+b8E2Ab90iJabtleY4EQ3o3irHy6Tlnw115AJ+CBCrupFnaMa4rKCZam/nU5/AEALu0I=",
      position = {-1, 1}
    }

    game.forces.player.bulk_inserter_capacity_bonus = 12

  ]]
}

simulations.aquilo_briefing =
{
  planet = "aquilo",
  mute_wind_sounds = false,
  init =
  [[
    game.simulation.camera_position = {0, 1.5}

    for x = -12, 12, 1 do
      for y = -6, 6 do
        game.surfaces[1].set_tiles{{position = {x, y}, name = "ice-smooth"}}
      end
    end

    for k, position in pairs ({{-1, -6}, {0, -6}, {1, -6}, {2, -6}, {-2, -5}, {-1, -5}, {0, -5}, {1, -5}, {2, -5}, {-5, -4}, {-4, -4},
                               {-3, -4}, {-2, -4}, {0, -4}, {1, -4}, {-6, -3}, {-5, -3}, {-12, -2}, {-11, -2}, {-10, -2}, {-6, -2},
                               {-12, -1}, {-11, -1}, {-10, -1}, {-9, -1}, {-8, -1}, {-7, -1}, {-6, -1}, {-12, 0}, {-11, 0}, {-10, 0},
                               {-9, 0}, {-8, 0}, {-7, 0}, {-12, 1}, {-11, 1}, {-10, 1}, {-9, 1}, {-8, 1}, {-7, 1}, {-6, 1}, {-12, 2},
                               {-11, 2}, {-10, 2}, {-9, 2}, {-8, 2}, {-7, 2}, {-6, 2}, {-12, 3}, {-11, 3}, {-10, 3}, {-9, 3}, {-8, 3},
                               {-7, 3}, {-6, 3}, {-12, 4}, {-11, 4}, {-10, 4}, {-9, 4}, {-8, 4}, {-7, 4}, {-6, 4}, {-12, 5}, {-11, 5},
                               {-10, 5}, {-9, 5}, {-8, 5}, {-7, 5}, {-6, 5}, {-10, 6}, {-9, 6}, {-8, 6}, {-7, 6}, {-6, 6}}) do
      game.surfaces[1].set_tiles{{position = position, name = "ice-rough"}}
    end

    for k, position in pairs ({{-8, -6}, {-7, -6}, {-6, -6}, {-5, -6}, {-4, -6}, {-3, -6}, {-2, -6}, {-7, -5}, {-6, -5}, {-5, -5},
                               {-4, -5}, {-3, -5}, {-12, -4}, {-7, -4}, {-6, -4}, {-12, -3}, {-11, -3}, {-10, -3}, {-9, -3}, {-8, -3},
                               {-7, -3}, {-9, -2}, {-8, -2}, {-7, -2}}) do
      game.surfaces[1].set_tiles{{position = position, name = "brash-ice"}}
    end

    for k, position in pairs ({{-1, -4}, {2, -4}, {-3, -3}, {-2, -3}, {-1, -3}, {0, -3}, {1, -3}, {2, -3}, {-5, -2}, {-4, -2}, {-3, -2},
                               {-2, -2}, {-1, -2}, {-5, -1}, {-4, -1}, {-3, -1}, {-6, 0}, {-5, 0}, {-12, 6}, {-11, 6}}) do
      game.surfaces[1].set_tiles{{position = position, name = "snow-crests"}}
    end

    for k, position in pairs ({{-12, -6}, {-11, -6}, {-10, -6}, {-9, -6}, {-12, -5}, {-11, -5}, {-10, -5}, {-9, -5}, {-8, -5},
                               {-11, -4}, {-10, -4}, {-9, -4}, {-8, -4}}) do
      game.surfaces[1].set_tiles{{position = position, name = "ammoniacal-ocean-2"}}
    end

    game.surfaces[1].set_tiles{{position = {-4, -3}, name = "snow-lumpy"}}
    game.surfaces[1].set_tiles{{position = {-4, 0}, name = "snow-lumpy"}}

    local create_list = {}

    for k, position in pairs ({{1, -6}, {9, -4}, {0, -2}, {-4, 0}, {-3, -1}, {10, -1}, {-6, 2}, {-4, 1}, {10, 2}, {-7, 4}, {-8, 5}, {-6, 5}}) do
      table.insert(create_list, { name = "lithium-iceberg-tiny", position = position, amount = 1})
    end

    for k, position in pairs ({{3, -6}, {4, -6}, {5, -6}, {6, -6}, {3, -5}, {4, -5}, {3, -4}, {4, -4}, {5, -5}, {6, -5}, {7, -5},
                              {-4, -3}, {-4, -2}, {-3, -2}, {1, -2}, {2, -2}, {4, -3}, {8, -3}, {7, -2}, {9, -3}, {-11, -1}, {-10, -1},
                              {-11, 0}, {-9, 0}, {-8, 0}, {-5, -1}, {-1, 0}, {0, 0}, {1, -1}, {7, -1}, {-8, 1}, {-7, 2}, {-4, 2},
                              {-3, 2}, {-1, 1}, {0, 1}, {-1, 2}, {0, 2}, {4, 2}, {6, 1}, {9, 2}, {-13, 3}, {-13, 4}, {-11, 4}, {-10, 4},
                              {-9, 3}, {-8, 3}, {-7, 3}, {-5, 3}, {-4, 3}, {-5, 4}, {-4, 4}, {-3, 3}, {-1, 3}, {0, 3}, {-1, 4}, {0, 4},
                              {1, 3}, {1, 4}, {2, 4}, {3, 3}, {4, 3}, {3, 4}, {5, 3}, {6, 4}, {7, 4}, {8, 4}, {9, 3}, {10, 3}, {9, 4},
                              {11, 4}, {-5, 5}, {-4, 6}, {3, 5}, {4, 5}, {4, 6}, {5, 5}, {6, 5}, {6, 6}, {7, 5}, {7, 6}, {8, 6}, {10, 6}}) do
      table.insert(create_list, { name = "lithium-iceberg-small", position = position, amount = 1})
    end

    for k, position in pairs ({{4, -7}, {5, -4}, {6, -4}, {7, -4}, {4, -2}, {5, -3}, {6, -3}, {5, -2}, {6, -2}, {7, -3}, {-10, 0},
                               {2, -1}, {1, 0}, {2, 0}, {3, -1}, {4, -1}, {3, 0}, {4, 0}, {5, -1}, {5, 0}, {-12, 1}, {-12, 2}, {-11, 1},
                               {-10, 1}, {-11, 2}, {-10, 2}, {-9, 2}, {1, 1}, {2, 1}, {2, 2}, {3, 1}, {4, 1}, {3, 2}, {-12, 3}, {-11, 3},
                               {-10, 3}, {-3, 4}, {-2, 4}, {2, 3}, {-3, 5}, {-2, 5}, {-1, 5}, {0, 5}, {-1, 6}, {0, 6}, {1, 5}, {2, 5},
                               {1, 6}, {2, 6}, {3, 6}, {2, 7}, {3, 7}}) do
      table.insert(create_list, { name = "lithium-iceberg-medium", position = position, amount = 1})
    end

    for k, position in pairs ({{6, -9}, {9, -8}, {9, -7}, {9, -2}, {11, -3}, {12, -3}, {6, 1}, {7, 1}, {14, -1}, {-11, 4}, {-7, 3},
                               {5, 4}, {-11, 5}, {-7, 6}, {7, 5}, {-9, 7}, {-7, 7}, {0, 8}, {6, 7}}) do
      table.insert(create_list, { name = "aqulio-snowy-decal", position = position, amount = 1})
    end

    for k, position in pairs ({{9, -8}, {9, -7}, {10, -6}, {12, -3}, {-5, 2}, {7, 1}, {-7, 3}, {10, 4}, {-8, 6}, {-6, 5}, {-7, 6},
                               {-5, 6}, {7, 5}, {8, 5}, {-9, 7}, {-7, 7}, {6, 7}}) do
      table.insert(create_list, { name = "snow-drift-decal", position = position, amount = 1})
    end

    game.surfaces[1].create_decoratives{decoratives = create_list}

    game.surfaces[1].create_entity{name = "lithium-iceberg-huge", position = {3.875, -6.25}}
    game.surfaces[1].create_entity{name = "lithium-iceberg-huge", position = {6.125, -3.5625}}
    game.surfaces[1].create_entity{name = "lithium-iceberg-big", position = {-3.8125, -1.5}}
    game.surfaces[1].create_entity{name = "lithium-iceberg-big", position = {2.375, -1.9375}}
    game.surfaces[1].create_entity{name = "lithium-iceberg-big", position = {-8.75, 0.6875}}
    game.surfaces[1].create_entity{name = "lithium-iceberg-big", position = {1.8125, 0.3125}}
    game.surfaces[1].create_entity{name = "lithium-iceberg-huge", position = {5.3125, 0.3125}}
    game.surfaces[1].create_entity{name = "lithium-iceberg-huge", position = {-9.25, 2.8125}}
    game.surfaces[1].create_entity{name = "lithium-iceberg-big", position = {-2.875, 2.0625}}
    game.surfaces[1].create_entity{name = "lithium-iceberg-huge", position = {0.3125, 2.6875}}
    game.surfaces[1].create_entity{name = "lithium-iceberg-big", position = {3.9375, 2.375}}
    game.surfaces[1].create_entity{name = "lithium-iceberg-big", position = {-4.625, 4.5}}
    game.surfaces[1].create_entity{name = "lithium-iceberg-big", position = {3.6875, 4.75}}
    game.surfaces[1].create_entity{name = "lithium-iceberg-huge", position = {7.125, 4.625}}
    game.surfaces[1].create_entity{name = "lithium-iceberg-huge", position = {-1.75, 6.5625}}

    game.surfaces[1].create_entity{name = "lithium-brine", amount = 10, position = {-8, -2}}
  ]]
}

return simulations
