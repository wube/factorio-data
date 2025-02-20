require("sound-util")
local function add_utility_sound(name, filename, volume, priority, modifiers)
  data.raw["utility-sounds"]["default"][name] =
  {
    filename = filename,
    volume = volume,
    aggregation = {max_count = 3, remove = true},
    priority = priority,
    modifiers = modifiers
  }
end

local function add_utility_sound_with_vibration(name, filename, volume, priority, modifiers, vibration_file, vibration_gain)
  data.raw["utility-sounds"]["default"][name] =
  {
    switch_vibration_data =
    {
      gain = vibration_gain,
      filename = vibration_file
    },
    filename = filename,
    volume = volume,
    aggregation = {max_count = 3, remove = true},
    priority = priority,
    modifiers = modifiers
  }
end

data:extend(
{
  {
    type = "utility-sounds",
    name = "default",
    axe_mining_ore =
    {
      switch_vibration_data =
      {
        filename = "__core__/sound/axe-mining-ore.bnvib"
      },
      game_controller_vibration_data =
      {
        high_frequency_vibration_intensity = 0.8,
        duration = 70
      },
      variations = sound_variations("__core__/sound/axe-mining-ore", 10, 0.4),
      priority = 64
    },
    axe_mining_stone =
    {
      switch_vibration_data =
      {
        filename = "__core__/sound/axe-mining-stone.bnvib"
      },
      variations = sound_variations("__core__/sound/axe-mining-stone", 7, 0.4),
      priority = 64
    },
    mining_wood =
    {
      switch_vibration_data =
      {
        filename = "__core__/sound/mining-wood.bnvib"
      },
      game_controller_vibration_data =
      {
        high_frequency_vibration_intensity = 0.8,
        duration = 70
      },
      variations = sound_variations("__core__/sound/mining-wood", 6, 0.4),
      priority = 64
    },
    axe_fighting =
    {
      switch_vibration_data =
      {
        filename = "__core__/sound/axe-meat.bnvib"
      },
      variations = sound_variations("__core__/sound/axe-meat", 6, 0.7),
      priority = 64
    },
    metal_walking_sound = sound_variations("__core__/sound/walking/transport-belt", 9, 0.6),
    new_objective = { filename = "__core__/sound/new-objective.ogg", volume = 0.9 },
    deconstruct_medium =
    {
      switch_vibration_data =
      {
        filename = "__core__/sound/deconstruct-medium.bnvib",
        gain = 0.25
      },
      filename = "__core__/sound/deconstruct-medium.ogg",
      volume = 0.8,
      priority = 64
    },
    deconstruct_large =
    {
      switch_vibration_data =
      {
        filename = "__core__/sound/deconstruct-large.bnvib",
        gain = 0.25
      },
      filename = "__core__/sound/deconstruct-large.ogg",
      volume = 0.8,
      priority = 64
    },
    deconstruct_huge =
    {
      switch_vibration_data =
      {
        filename = "__core__/sound/deconstruct-large.bnvib",
        gain = 0.25
      },
      filename = "__core__/sound/deconstruct-large.ogg",
      volume = 0.8,
      priority = 64
    },
    build_animated_small =
    {
      variations = sound_variations("__core__/sound/build-animated-small", 3, 0.6),
      aggregation = {max_count = 1, remove = true, count_already_playing = true, priority = "oldest", progress_threshold = 0.3},
    },
    build_animated_medium =
    {
      variations = sound_variations("__core__/sound/build-animated-medium", 3, 0.7),
      aggregation = {max_count = 1, remove = true, count_already_playing = true, priority = "oldest", progress_threshold = 0.3},
    },
    build_animated_large =
    {
      variations = sound_variations("__core__/sound/build-animated-large", 3, 0.8),
      aggregation = {max_count = 1, remove = true, count_already_playing = true, priority = "oldest", progress_threshold = 0.2},
    },
    build_animated_huge =
    {
      variations = sound_variations("__core__/sound/build-animated-huge", 3, 0.9),
      aggregation = {max_count = 1, remove = true, count_already_playing = true, priority = "oldest", progress_threshold = 0.1},
    },
    inventory_click =
    {
      filename = "__core__/sound/gui-inventory-slot-button.ogg",
      volume = 0.6,
      aggregation = {max_count = 1, remove = true},
    },
    inventory_move =
    {
      filename = "__core__/sound/inventory-move.ogg",
      aggregation = {max_count = 1, remove = true}
    },
    achievement_unlocked = {filename = "__core__/sound/achievement-unlocked.ogg", volume = 0.65},
    picked_up_item =
    {
      variations = sound_variations("__core__/sound/picked-up-item", 5, 1),
      priority = 64
    },
    drop_item =
    {
      variations = sound_variations("__core__/sound/drop-item", 5, 1),
      priority = 64
    },
    default_manual_repair =
    {
      variations = sound_variations("__core__/sound/manual-repair-advanced", 2, 1),
      priority = 64
    },
    default_driving_sound =
    {
      sound =
        {
          filename = "__core__/sound/vehicle-surface-default.ogg", volume = 0.6,
          advanced_volume_control = {fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 0.0}, to = {1.5, 100.0}}}}
        },
        fade_ticks = 6
    }
  }
})
add_utility_sound_with_vibration("build_small", "__core__/sound/build-small.ogg", 0.7, 64, {volume_multiplier("main-menu", 0.64), volume_multiplier("tips-and-tricks", 0.8)}, "__core__/sound/build-small.bnvib", 0.2)
add_utility_sound_with_vibration("build_medium", "__core__/sound/build-medium.ogg", 0.7, 64, {volume_multiplier("main-menu", 0.64), volume_multiplier("tips-and-tricks", 0.8)}, "__core__/sound/build-medium.bnvib", 0.25)
add_utility_sound_with_vibration("build_large", "__core__/sound/build-large.ogg", 0.7, 64, {volume_multiplier("main-menu", 0.64), volume_multiplier("tips-and-tricks", 0.8)}, "__core__/sound/build-large.bnvib", 0.3)
add_utility_sound("build_huge", "__core__/sound/build-large.ogg", 0.7, 64, {volume_multiplier("main-menu", 0.64), volume_multiplier("tips-and-tricks", 0.8)})
add_utility_sound("build_blueprint_small", "__core__/sound/build-blueprint-small.ogg", 0.7, 64, volume_multiplier("tips-and-tricks", 0.8))
add_utility_sound("build_blueprint_medium", "__core__/sound/build-blueprint-medium.ogg", 0.7, 64)
add_utility_sound("build_blueprint_large", "__core__/sound/build-blueprint-large.ogg", 0.7, 64)
add_utility_sound("build_blueprint_huge", "__core__/sound/build-blueprint-large.ogg", 0.7, 64)
add_utility_sound("build_ghost_upgrade", "__core__/sound/build-ghost-upgrade.ogg", 0.7, 64)
add_utility_sound("build_ghost_upgrade_cancel", "__core__/sound/build-ghost-upgrade-cancel.ogg", 0.7, 64)
add_utility_sound("gui_click", "__core__/sound/gui-click.ogg")
add_utility_sound("list_box_click", "__core__/sound/list-box-click.ogg")
add_utility_sound("cannot_build", "__core__/sound/cannot-build.ogg")
add_utility_sound_with_vibration("deconstruct_small", "__core__/sound/deconstruct-small.ogg", 1.0, 64, nil, "__core__/sound/deconstruct-small.bnvib", 0.25)
add_utility_sound("deconstruct_robot", "__core__/sound/deconstruct-robot.ogg", 0.25, 64)
add_utility_sound("rotated_small", "__core__/sound/rotate-small.ogg", 1.0, 64)
add_utility_sound("rotated_medium", "__core__/sound/rotate-medium.ogg", 1.0, 64)
add_utility_sound("rotated_large", "__core__/sound/rotate-big.ogg", 1.0, 64)
add_utility_sound("rotated_huge", "__core__/sound/rotate-big.ogg", 1.0, 64)
add_utility_sound("alert_destroyed", "__core__/sound/alert-destroyed.ogg", 0.5)
add_utility_sound("console_message", "__core__/sound/console-message.ogg")
add_utility_sound("scenario_message", "__core__/sound/scenario-message.ogg")
add_utility_sound("game_lost", "__core__/sound/game-lost.ogg", 0.8)
add_utility_sound("game_won", "__core__/sound/game-won.ogg", 0.75)
add_utility_sound("research_completed", "__core__/sound/research-completed.ogg")
add_utility_sound("crafting_finished", "__core__/sound/crafting-finished.ogg")
add_utility_sound("clear_cursor", "__core__/sound/clear-cursor.ogg")
add_utility_sound("armor_insert", "__core__/sound/armor-insert.ogg")
add_utility_sound("armor_remove", "__core__/sound/armor-remove.ogg")
add_utility_sound("wire_connect_pole", "__core__/sound/wire-connect-pole.ogg", 1.0, 64, volume_multiplier("tips-and-tricks", 0.8))
add_utility_sound("wire_disconnect", "__core__/sound/wire-disconnect.ogg", 1.0, 64)
add_utility_sound("wire_pickup", "__core__/sound/wire-pickup.ogg", 1.0, 64, volume_multiplier("tips-and-tricks", 0.8))
add_utility_sound("tutorial_notice", "__core__/sound/achievement-unlocked.ogg")
add_utility_sound("smart_pipette", "__core__/sound/smart-pipette.ogg")
add_utility_sound("switch_gun", "__core__/sound/switch-gun.ogg")
add_utility_sound("paste_activated", "__core__/sound/paste-action.ogg")
add_utility_sound("item_deleted", "__core__/sound/delete-item.ogg")
add_utility_sound("entity_settings_pasted", "__core__/sound/paste-action.ogg")
add_utility_sound("entity_settings_copied", "__core__/sound/copy-entity.ogg")
add_utility_sound("item_spawned", "__core__/sound/spawn-item.ogg")
add_utility_sound("confirm", "__core__/sound/gui-green-confirm.ogg")
add_utility_sound("undo", "__core__/sound/undo.ogg")
add_utility_sound("rail_plan_start", "__core__/sound/rail-plan-start.ogg")
add_utility_sound("default_landing_steps", "__core__/sound/walking/default-land-step.ogg", 1.0)
