  local orientation_range = 0.20
  local direction_count = 19

  local direction_to_orientation =
  {
      N  = 0/8,
      NE = 1/8,
      E  = 2/8,
      SE = 3/8,
      S  = 4/8,
      SW = 5/8,
      W  = 6/8,
      NW = 7/8
  }

local function railgun_turret_base_direction(inputs)
  return
  {
    layers =
    {
      util.sprite_load("__space-age__/graphics/entity/railgun-turret/railgun-turret-base",
      {
        frame_index = inputs.frame_index,
        scale = 0.5
      }),
      util.sprite_load("__space-age__/graphics/entity/railgun-turret/railgun-turret-base-mask",
      {
        flags = {"mask"},
        apply_runtime_tint = true,
        frame_index = inputs.frame_index,
        scale = 0.5
      }),
      util.sprite_load("__space-age__/graphics/entity/railgun-turret/railgun-turret-base-shadow",
      {
        frame_index = inputs.frame_index,
        draw_as_shadow = true,
        scale = 0.5
      })
    }
  }
end

local function railgun_turret_base()
  return
  {
    north      = railgun_turret_base_direction({frame_index = 0}),
    north_east = railgun_turret_base_direction({frame_index = 1}),
    east       = railgun_turret_base_direction({frame_index = 2}),
    south_east = railgun_turret_base_direction({frame_index = 3}),
    south      = railgun_turret_base_direction({frame_index = 4}),
    south_west = railgun_turret_base_direction({frame_index = 5}),
    west       = railgun_turret_base_direction({frame_index = 6}),
    north_west = railgun_turret_base_direction({frame_index = 7})
  }
end

local function railgun_turret_extension_direction(inputs)
  return
  {
    layers =
    {
      util.sprite_load("__space-age__/graphics/entity/railgun-turret/railgun-turret-rising-"..inputs.direction,
      {
        run_mode = inputs.run_mode or nil,
        line_length = 1,
        frame_count = 1,
        repeat_count = 1,
        direction_count = 1,
        scale = 0.5
      }),
      util.sprite_load("__space-age__/graphics/entity/railgun-turret/railgun-turret-rising-"..inputs.direction.."-mask",
      {
        run_mode = inputs.run_mode or nil,
        flags = {"mask"},
        apply_runtime_tint = true,
        line_length = 1,
        frame_count = 1,
        repeat_count = 1,
        direction_count = 1,
        scale = 0.5
      }),
      util.sprite_load("__space-age__/graphics/entity/railgun-turret/railgun-turret-ammo-"..inputs.direction,
      {
        direction_count = 1,
        line_length = 5,
        frame_count = 1,
        repeat_count = 1,
        scale = 0.5
      }),
      util.sprite_load("__space-age__/graphics/entity/railgun-turret/railgun-turret-shooting-"..inputs.direction.."-EMIT",
      {
        direction_count = 1,
        frame_index = 9,
        apply_special_effect = true,
        draw_as_glow = true,
        blend_mode = "additive",
        scale = 0.5,
        frame_count = 1,
        repeat_count = 1
      }),
      util.sprite_load("__space-age__/graphics/entity/railgun-turret/railgun-turret-rising-"..inputs.direction.."-shadow",
      {
        run_mode = inputs.run_mode or "forward",
        frame_count = 1,
        repeat_count = 1,
        direction_count = 1,
        draw_as_shadow = true,
        scale = 0.5
      }),
    }
  }
end

local function direction_in_table(inputs, direction)
  result_table = inputs
  result_table.direction = direction
  return result_table
end

local function railgun_turret_extension(inputs)
  return
  {
    north      = railgun_turret_extension_direction( direction_in_table(inputs, 'N')),
    north_east = railgun_turret_extension_direction( direction_in_table(inputs, 'NE')),
    east       = railgun_turret_extension_direction( direction_in_table(inputs, 'E')),
    south_east = railgun_turret_extension_direction( direction_in_table(inputs, 'SE')),
    south      = railgun_turret_extension_direction( direction_in_table(inputs, 'S')),
    south_west = railgun_turret_extension_direction( direction_in_table(inputs, 'SW')),
    west       = railgun_turret_extension_direction( direction_in_table(inputs, 'W')),
    north_west = railgun_turret_extension_direction( direction_in_table(inputs, 'NW'))
  }
end

local function railgun_turret_aiming_direction(inputs)
  local middle_orientation = direction_to_orientation[inputs.direction]
  return
  {
    layers =
    {
      util.sprite_load("__space-age__/graphics/entity/railgun-turret/railgun-turret-shooting-"..inputs.direction,
      {
        middle_orientation = middle_orientation,
        orientation_range = orientation_range,
        direction_count = direction_count,
        apply_projection = true,
        scale = 0.5,
        line_length = 1,
        frame_count = 1
      }),
      util.sprite_load("__space-age__/graphics/entity/railgun-turret/railgun-turret-shooting-"..inputs.direction.."-mask",
      {
        middle_orientation = middle_orientation,
        orientation_range = orientation_range,
        direction_count = direction_count,
        flags = {"mask"},
        apply_runtime_tint = true,
        scale = 0.5,
        line_length = 1,
        frame_count = 1
      }),
      util.sprite_load("__space-age__/graphics/entity/railgun-turret/railgun-turret-ammo-"..inputs.direction,
      {
        direction_count = direction_count,
        middle_orientation = middle_orientation,
        orientation_range = orientation_range,
        duplicate_first_direction = true,
        scale = 0.5,
        line_length = 1,
        frame_count = 1
      }),
      util.sprite_load("__space-age__/graphics/entity/railgun-turret/railgun-turret-shooting-"..inputs.direction.."-EMIT",
      {
        direction_count = direction_count,
        middle_orientation = middle_orientation,
        orientation_range = orientation_range,
        apply_special_effect = true,
        draw_as_glow = true,
        blend_mode = "additive",
        scale = 0.5,
        frame_count = 1,
        repeat_count = 1
      }),
      util.sprite_load("__space-age__/graphics/entity/railgun-turret/railgun-turret-shooting-"..inputs.direction.."-shadow",
      {
        middle_orientation = middle_orientation,
        orientation_range = orientation_range,
        direction_count = direction_count,
        draw_as_shadow = true,
        line_length = 1,
        frame_count = 1,
        scale = 0.5,
      }),
    }
  }
end


local function railgun_turret_aiming()
  return
  {
    north      = railgun_turret_aiming_direction({direction = 'N'}),
    north_east = railgun_turret_aiming_direction({direction = 'NE'}),
    east       = railgun_turret_aiming_direction({direction = 'E'}),
    south_east = railgun_turret_aiming_direction({direction = 'SE'}),
    south      = railgun_turret_aiming_direction({direction = 'S'}),
    south_west = railgun_turret_aiming_direction({direction = 'SW'}),
    west       = railgun_turret_aiming_direction({direction = 'W'}),
    north_west = railgun_turret_aiming_direction({direction = 'NW'})
  }
end

local function railgun_turret_shooting_direction(inputs)
  local middle_orientation = direction_to_orientation[inputs.direction]
  return
  {
    layers =
    {
      util.sprite_load("__space-age__/graphics/entity/railgun-turret/railgun-turret-shooting-"..inputs.direction,
      {
        middle_orientation = middle_orientation,
        orientation_range = orientation_range,
        direction_count = direction_count,
        apply_projection = true,
        scale = 0.5,
        line_length = 1,
        frame_count = 1,
        repeat_count = 2
      }),
      util.sprite_load("__space-age__/graphics/entity/railgun-turret/railgun-turret-shooting-"..inputs.direction.."-mask",
      {
        middle_orientation = middle_orientation,
        orientation_range = orientation_range,
        direction_count = direction_count,
        flags = {"mask"},
        apply_runtime_tint = true,
        scale = 0.5,
        line_length = 1,
        frame_count = 1,
        repeat_count = 2
      }),
      util.sprite_load("__space-age__/graphics/entity/railgun-turret/railgun-turret-ammo-"..inputs.direction,
      {
        direction_count = direction_count,
        middle_orientation = middle_orientation,
        orientation_range = orientation_range,
        duplicate_first_direction = true,
        scale = 0.5,
        line_length = 1,
        frame_count = 1,
        repeat_count = 2
      }),
      util.sprite_load("__space-age__/graphics/entity/railgun-turret/railgun-turret-shooting-"..inputs.direction.."-EMIT",
      {
        direction_count = direction_count,
        middle_orientation = middle_orientation,
        orientation_range = orientation_range,
        apply_special_effect = true,
        draw_as_glow = true,
        blend_mode = "additive",
        scale = 0.5,
        frame_count = 1,
        repeat_count = 2
      }),
      util.sprite_load("__space-age__/graphics/entity/railgun-turret/railgun-turret-shooting-"..inputs.direction.."-shadow",
      {
        middle_orientation = middle_orientation,
        orientation_range = orientation_range,
        direction_count = direction_count,
        draw_as_shadow = true,
        line_length = 1,
        frame_count = 1,
        repeat_count = 2,
        scale = 0.5,
      }),
    }
  }
end


local function railgun_turret_shooting()
  return
  {
    north      = railgun_turret_shooting_direction({direction = 'N'}),
    north_east = railgun_turret_shooting_direction({direction = 'NE'}),
    east       = railgun_turret_shooting_direction({direction = 'E'}),
    south_east = railgun_turret_shooting_direction({direction = 'SE'}),
    south      = railgun_turret_shooting_direction({direction = 'S'}),
    south_west = railgun_turret_shooting_direction({direction = 'SW'}),
    west       = railgun_turret_shooting_direction({direction = 'W'}),
    north_west = railgun_turret_shooting_direction({direction = 'NW'})
  }
end

local function railgun_turret_cooldown_direction(inputs)
  local middle_orientation = direction_to_orientation[inputs.direction]
  return
  {
    layers =
    {
      util.sprite_load("__space-age__/graphics/entity/railgun-turret/railgun-turret-shooting-"..inputs.direction,
      {
        middle_orientation = middle_orientation,
        orientation_range = orientation_range,
        direction_count = direction_count,
        apply_projection = true,
        scale = 0.5,
        line_length = 1,
        frame_count = 1,
        repeat_count = 5,
      }),
      util.sprite_load("__space-age__/graphics/entity/railgun-turret/railgun-turret-shooting-"..inputs.direction.."-mask",
      {
        middle_orientation = middle_orientation,
        orientation_range = orientation_range,
        direction_count = direction_count,
        flags = {"mask"},
        apply_runtime_tint = true,
        scale = 0.5,
        line_length = 1,
        frame_count = 1,
        repeat_count = 5,
      }),
      util.sprite_load("__space-age__/graphics/entity/railgun-turret/railgun-turret-ammo-"..inputs.direction,
      {
        direction_count = direction_count,
        middle_orientation = middle_orientation,
        orientation_range = orientation_range,
        duplicate_first_direction = true,
        scale = 0.5,
        line_length = 1,
        frame_count = 1,
        repeat_count = 5,
      }),
      util.sprite_load("__space-age__/graphics/entity/railgun-turret/railgun-turret-ammo-"..inputs.direction,
      {
        direction_count = direction_count,
        middle_orientation = middle_orientation,
        orientation_range = orientation_range,
        duplicate_first_direction = true,
        scale = 0.5,
        line_length = 5,
        frame_count = 5,
        repeat_count = 1
      }),
      util.sprite_load("__space-age__/graphics/entity/railgun-turret/railgun-turret-shooting-"..inputs.direction.."-EMIT",
      {
        direction_count = direction_count,
        middle_orientation = middle_orientation,
        orientation_range = orientation_range,
        apply_special_effect = true,
        draw_as_glow = true,
        blend_mode = "additive",
        scale = 0.5,
        frame_count = 1,
        repeat_count = 5
      }),
      util.sprite_load("__space-age__/graphics/entity/railgun-turret/railgun-turret-shooting-"..inputs.direction.."-shadow",
      {
        middle_orientation = middle_orientation,
        orientation_range = orientation_range,
        direction_count = direction_count,
        draw_as_shadow = true,
        scale = 0.5,
        repeat_count = 5,
      })
    }
  }
end

local function railgun_turret_cooldown()
  return
  {
    north      = railgun_turret_cooldown_direction({direction = 'N'}),
    north_east = railgun_turret_cooldown_direction({direction = 'NE'}),
    east       = railgun_turret_cooldown_direction({direction = 'E'}),
    south_east = railgun_turret_cooldown_direction({direction = 'SE'}),
    south      = railgun_turret_cooldown_direction({direction = 'S'}),
    south_west = railgun_turret_cooldown_direction({direction = 'SW'}),
    west       = railgun_turret_cooldown_direction({direction = 'W'}),
    north_west = railgun_turret_cooldown_direction({direction = 'NW'})
  }
end

local function railgun_turret_warmup_direction(inputs)
  local middle_orientation = direction_to_orientation[inputs.direction]
  return
  {
    layers =
    {
      util.sprite_load("__space-age__/graphics/entity/railgun-turret/railgun-turret-shooting-"..inputs.direction,
      {
        middle_orientation = middle_orientation,
        orientation_range = orientation_range,
        direction_count = direction_count,
        apply_projection = true,
        scale = 0.5,
        line_length = 1,
        frame_count = 1,
        repeat_count = 10,
      }),
      util.sprite_load("__space-age__/graphics/entity/railgun-turret/railgun-turret-shooting-"..inputs.direction.."-mask",
      {
        middle_orientation = middle_orientation,
        orientation_range = orientation_range,
        direction_count = direction_count,
        flags = {"mask"},
        apply_runtime_tint = true,
        scale = 0.5,
        line_length = 1,
        frame_count = 1,
        repeat_count = 10,
      }),
      util.sprite_load("__space-age__/graphics/entity/railgun-turret/railgun-turret-ammo-"..inputs.direction,
      {
        direction_count = direction_count,
        middle_orientation = middle_orientation,
        orientation_range = orientation_range,
        duplicate_first_direction = true,
        scale = 0.5,
        line_length = 1,
        frame_count = 1,
        repeat_count = 10
      }),
      util.sprite_load("__space-age__/graphics/entity/railgun-turret/railgun-turret-shooting-"..inputs.direction.."-EMIT",
      {
        direction_count = direction_count,
        middle_orientation = middle_orientation,
        orientation_range = orientation_range,
        apply_special_effect = true,
        draw_as_glow = true,
        blend_mode = "additive",
        scale = 0.5,
        frame_count = 1,
        repeat_count = 10
      }),
      util.sprite_load("__space-age__/graphics/entity/railgun-turret/railgun-turret-shooting-"..inputs.direction.."-shadow",
      {
        middle_orientation = middle_orientation,
        orientation_range = orientation_range,
        direction_count = direction_count,
        draw_as_shadow = true,
        scale = 0.5,
        repeat_count = 10
      })
    }
  }
end

local function railgun_turret_warmup()
  return
  {
    north      = railgun_turret_warmup_direction({direction = 'N'}),
    north_east = railgun_turret_warmup_direction({direction = 'NE'}),
    east       = railgun_turret_warmup_direction({direction = 'E'}),
    south_east = railgun_turret_warmup_direction({direction = 'SE'}),
    south      = railgun_turret_warmup_direction({direction = 'S'}),
    south_west = railgun_turret_warmup_direction({direction = 'SW'}),
    west       = railgun_turret_warmup_direction({direction = 'W'}),
    north_west = railgun_turret_warmup_direction({direction = 'NW'})
  }
end

local function railgun_turret_resource_indicator_direction(inputs)
  local middle_orientation = direction_to_orientation[inputs.direction]
  return
  {
    layers =
    {
      util.sprite_load("__space-age__/graphics/entity/railgun-turret/railgun-turret-shooting-"..inputs.direction.."-LED",
      {
        direction_count = direction_count,
        middle_orientation = middle_orientation,
        orientation_range = orientation_range,
        duplicate_first_direction = true,
        draw_as_glow = true,
        blend_mode = "additive",
        scale = 0.5,
        line_length = 10,
        frame_count = 10,
        repeat_count = 1
      }),
    }
  }
end

local function railgun_turret_resource_indicator()
  return
  {
    north      = railgun_turret_resource_indicator_direction({direction = 'N'}),
    north_east = railgun_turret_resource_indicator_direction({direction = 'NE'}),
    east       = railgun_turret_resource_indicator_direction({direction = 'E'}),
    south_east = railgun_turret_resource_indicator_direction({direction = 'SE'}),
    south      = railgun_turret_resource_indicator_direction({direction = 'S'}),
    south_west = railgun_turret_resource_indicator_direction({direction = 'SW'}),
    west       = railgun_turret_resource_indicator_direction({direction = 'W'}),
    north_west = railgun_turret_resource_indicator_direction({direction = 'NW'})
  }
end

return
{
  base_picture        = railgun_turret_base(),
  neutral_animation = railgun_turret_extension({}),
  aiming_animation  = railgun_turret_aiming(),
  shooting_animation  = railgun_turret_shooting(),
  cooldown_animation = railgun_turret_cooldown(),
  warmup_animation = railgun_turret_warmup(),
  resource_indicator_animation = railgun_turret_resource_indicator()
}