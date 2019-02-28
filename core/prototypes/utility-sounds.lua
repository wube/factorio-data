local function add_utility_sound(name, filename)
  data.raw["utility-sounds"]["default"][name] =
  {
    {
      filename = filename
    }
  }
end

data:extend(
{
  {
    type = "utility-sounds",
    name = "default",
    axe_mining_ore =
    {
      variations =
      {
        {
          filename = "__core__/sound/axe-mining-ore-1.ogg",
          volume = 0.75
        },
        {
          filename = "__core__/sound/axe-mining-ore-2.ogg",
          volume = 0.75
        },
        {
          filename = "__core__/sound/axe-mining-ore-3.ogg",
          volume = 0.75
        },
        {
          filename = "__core__/sound/axe-mining-ore-4.ogg",
          volume = 0.75
        },
        {
          filename = "__core__/sound/axe-mining-ore-5.ogg",
          volume = 0.75
        }
      }
    },
    mining_wood =
    {
      variations =
      {
        {
          filename = "__core__/sound/mining-wood-1.ogg",
          volume = 0.75
        },
        {
          filename = "__core__/sound/mining-wood-2.ogg",
          volume = 0.75
        }
      }
    },
    axe_fighting =
    {
      variations =
      {
        {
          filename = "__core__/sound/axe-meat-1.ogg"
        },
        {
          filename = "__core__/sound/axe-meat-2.ogg"
        },
        {
          filename = "__core__/sound/axe-meat-3.ogg"
        }
      }
    },
    metal_walking_sound =
    {
      variations =
      {
        {
          filename = "__core__/sound/walking/metal-01.ogg",
          volume = 0.5
        },
        {
          filename = "__core__/sound/walking/metal-02.ogg",
          volume = 0.4
        }
      }
    },
    default_manual_repair =
    {
      variations =
      {
        {
          filename = "__core__/sound/manual-repair-advanced-1.ogg"
        },
        {
          filename = "__core__/sound/manual-repair-advanced-2.ogg"
        }
      }
    }
  }
})

add_utility_sound("gui_click", "__core__/sound/gui-click.ogg")
add_utility_sound("list_box_click", "__core__/sound/list-box-click.ogg")
add_utility_sound("build_small", "__core__/sound/build-small.ogg")
add_utility_sound("build_medium", "__core__/sound/build-medium.ogg")
add_utility_sound("build_big", "__core__/sound/build-large.ogg")
add_utility_sound("cannot_build", "__core__/sound/cannot-build.ogg")
add_utility_sound("deconstruct_small", "__core__/sound/deconstruct-small.ogg")
add_utility_sound("deconstruct_medium", "__core__/sound/deconstruct-medium.ogg")
add_utility_sound("deconstruct_big", "__core__/sound/deconstruct-large.ogg")
add_utility_sound("alert_destroyed", "__core__/sound/alert-destroyed.ogg")
add_utility_sound("console_message", "__core__/sound/console-message.ogg")
add_utility_sound("scenario_message", "__core__/sound/scenario-message.ogg")
add_utility_sound("new_objective", "__core__/sound/new-objective.ogg")
add_utility_sound("game_lost", "__core__/sound/game-lost.ogg")
add_utility_sound("game_won", "__core__/sound/game-won.ogg")
add_utility_sound("research_completed", "__core__/sound/research-completed.ogg")
add_utility_sound("crafting_finished", "__core__/sound/crafting-finished.ogg")
add_utility_sound("inventory_move", "__core__/sound/inventory-move.ogg")
add_utility_sound("armor_insert", "__core__/sound/armor-insert.ogg")
add_utility_sound("armor_remove", "__core__/sound/armor-remove.ogg")
add_utility_sound("achievement_unlocked", "__core__/sound/achievement-unlocked.ogg")
add_utility_sound("wire_connect_pole", "__core__/sound/wire-connect-pole.ogg")
add_utility_sound("wire_disconnect", "__core__/sound/wire-disconnect.ogg")
add_utility_sound("wire_pickup", "__core__/sound/wire-pickup.ogg")
add_utility_sound("tutorial_notice", "__core__/sound/achievement-unlocked.ogg")
