local util = require("util")

local main_ship_name = "crash-site-spaceship"

local ship_parts =
{
  {
    name = "crash-site-spaceship-wreck-big-1",
    angle_deviation = 0.1,
    max_distance = 25,
    min_separation = 6,
    fire_count = 1
  },
  {
    name = "crash-site-spaceship-wreck-big-2",
    angle_deviation = 0.1,
    max_distance = 25,
    min_separation = 6,
    explosion_count = 3,
    fire_count = 1
  },
  {
    name = "crash-site-spaceship-wreck-medium",
    variations = 3,
    angle_deviation = 0.05,
    max_distance = 30,
    min_separation = 3,
    explosion_count = 1,
    fire_count = 1
  },
  {
    name = "crash-site-spaceship-wreck-small",
    variations = 6,
    angle_deviation = 0.05,
    min_separation = 3,
    fire_count = 1
  },
  {
    name = "crash-site-fire-smoke",
    angle_deviation = 0.08,
    repeat_count = 0,
    scale_lifetime = true
  }
}


local rotate = function(offset, angle)
  local x = offset[1]
  local y = offset[2]
  local rotated_x = x * math.cos(angle) - y * math.sin(angle)
  local rotated_y = x * math.sin(angle) + y * math.cos(angle)
  return {rotated_x, rotated_y}
end

local entry_angle = 0.70
local random = math.random
local get_offset = function(part)
  local angle = entry_angle + ((random() - 0.5) * part.angle_deviation)
  angle = angle - 0.25
  angle = angle * math.pi * 2
  local distance = 8 + (random() * (part.max_distance or 40))
  local offset = rotate({distance, 0}, angle)
  return offset
end

local get_name = function(part, k)
  if not part.variations then return part.name end
  local variant = k or random(part.variations)
  return part.name.."-"..variant
end

local get_lifetime = function(offset)
  --Generally, close to the ship, last longer.
  local distance = ((offset[1] * offset[1]) + (offset[2] * offset[2])) ^ 0.5

  local time = random(60 * 20, 60 * 30) - math.min(distance * 100, 15 * 60)

  return time

end

local get_random_position = function(box, x_scale, y_scale)
  local x_scale = x_scale or 1
  local y_scale = y_scale or 1
  local x1 = box.left_top.x
  local y1 = box.left_top.y
  local x2 = box.right_bottom.x
  local y2 = box.right_bottom.y
  local x = ((x2 - x1) * x_scale * (random() - 0.5)) + ((x1 + x2) / 2)
  local y = ((y2 - y1) * y_scale * (random() - 0.5)) + ((y1 + y2) / 2)
  return {x, y}
end

local random_from_map = function(map)
  local array = {}
  local i = 1
  for k, v in pairs (map) do
    array[i] = k
    i = i + 1
  end
  local key = array[random(#array)]
  local value = map[key]
  return key, value
end

local insert_items_randomly = function(entities, items)

  local item_prototypes = game.item_prototypes
  for name, count in pairs (items) do
    if not item_prototypes[name] then
      items[name] = nil
    end
  end
  if not next(items) then return end

  for unit_number, entity in pairs (entities) do
    if not entity.valid then
      entities[unit_number] = nil
    end
  end
  if not next(entities) then return end

  local stupid = 1000
  while true do
    local item_name, count = random_from_map(items)
    local unit_number, entity = random_from_map(entities)
    local inserted = entity.insert{name = item_name, count = 1}
    if inserted == count then
      items[item_name] = nil
    else
      items[item_name] = count - inserted
    end

    if not next(items) then break end

    stupid = stupid - 1
    if stupid <= 0 then break end
  end
end

local main_ship_flame_count = 4
local main_ship_explosion_count = 10

local lib = {}

lib.create_crash_site = function(surface, position, ship_items, part_items)

  local main_ship = surface.create_entity
  {
    name = main_ship_name,
    position = position,
    force = "player"
  }
  util.insert_safe(main_ship, ship_items)
  local box = main_ship.bounding_box
  for k, entity in pairs (surface.find_entities_filtered{area = box, force = "neutral", collision_mask = "player-layer"}) do
    if entity.valid then
      if entity.type == "tree" then
        entity.die()
      else
        entity.destroy()
      end
    end
  end

  for k = 1, main_ship_flame_count do
    local position = get_random_position(box, 0.8, 0.5)
    surface.create_entity
    {
      name = "crash-site-fire-flame",
      position = position
    }
    local fire = surface.create_entity
    {
      name = "crash-site-fire-smoke",
      position = position
    }
    fire.time_to_live = random(60 * 15, 60 * 30)
    fire.time_to_next_effect = random(60 * 3)
  end

  for k = 1, main_ship_explosion_count do
    local explosions = surface.create_entity
    {
      name = "crash-site-explosion-smoke",
      position = get_random_position(box, 0.8, 0.5)
    }
    explosions.time_to_live = random(60 * 15, 60 * 30)
    explosions.time_to_next_effect = random(60)
  end

  local wreck_parts = {}

  for k, part in pairs (ship_parts) do
    for k = 1, (part.variations or 1) do
      local name = get_name(part, k)
      for i = 1, part.repeat_count or 1 do

        local part_position
        local count = 0
        local offset
        while true do
          offset = get_offset(part)
          local x = (position[1] or position.x) + offset[1]
          local y = (position[2] or position.y) + offset[2]
          part_position = {x, y}
          if surface.can_place_entity
          {
            name = name,
            position = part_position,
            force = "player",
            build_check_type = defines.build_check_type.ghost_place,
            forced = true
          } then
            if not part.min_separation and surface.count_entities_filtered{position = part_position, radius = part.min_separation, limit = 1, type = "container"} == 0 then
              break
            end
          end
          count = count + 1
          if count > 20 then
            part_position = surface.find_non_colliding_position(name, part_position, 50, 4)
            break
          end
        end

        if part_position then
          local entity = surface.create_entity
          {
            name = name,
            position = part_position,
            force = "neutral"
          }

          if entity.get_output_inventory() and #entity.get_output_inventory() > 0 then
            wreck_parts[entity.unit_number] = entity
          end

          for k, entity in pairs (surface.find_entities_filtered{type = {"tree", "simple-entity"}, position = part_position, radius = 1 + entity.get_radius()}) do
            if entity.type == "tree" then
              entity.die()
            else
              entity.destroy()
            end
          end

          if part.explosion_count then
            for k = 1, part.explosion_count do
              local explosions = surface.create_entity
              {
                name = "crash-site-explosion-smoke",
                position = get_random_position(entity.bounding_box)
              }
              explosions.time_to_live = get_lifetime(offset)
              explosions.time_to_next_effect = random(30)
            end
          end

          if part.fire_count then
            for k = 1, part.fire_count do
              surface.create_entity
              {
                name = "crash-site-fire-flame",
                position = get_random_position(entity.bounding_box)
              }
              local explosions = surface.create_entity
              {
                name = "crash-site-fire-smoke",
                position = get_random_position(entity.bounding_box)
              }
              explosions.time_to_live = get_lifetime(offset)
              explosions.time_to_next_effect = random(30)
            end
          end

          if part.scale_lifetime then
            entity.time_to_live = get_lifetime(offset)
            entity.time_to_next_effect = random(60)
          end

        end

      end
    end
  end

  insert_items_randomly(wreck_parts, part_items)

end

local set_label_size = function(player)

  local label = player.gui.screen.skip_cutscene_label
  if not label then return end

  label.style.horizontal_align = "center"
  local resolution = player.display_resolution
  label.style.width = resolution.width / player.display_scale
  label.location = {0, (resolution.height) - ((20 + 8) * player.display_scale)}

end

lib.create_cutscene = function(player, goal_position)
  local offset = rotate({60, 0}, (entry_angle - 0.25) * math.pi * 2)
  local start_position = {goal_position[1] + offset[1], goal_position[2] + offset[2]}
  player.set_controller
  {
    type = defines.controllers.cutscene,
    waypoints =
    {
      {
        position = goal_position,
        transition_time = 450,
        zoom = 2,
        time_to_wait = 150
      },
      {
        target = player.character,
        transition_time = 150,
        zoom = 1.5,
        time_to_wait = 0
      }
    },
    start_position = start_position,
    start_zoom = 2
  }

  local label = player.gui.screen.add{type = "label", caption = {"skip-cutscene"}, name = "skip_cutscene_label"}
  set_label_size(player)
end

lib.is_crash_site_cutscene = function(event)
  return event.player_index == 1 and event.waypoint_index == 1 and event.tick < 2000
end

lib.on_player_display_refresh = function(event)
  local player = game.get_player(event.player_index)
  set_label_size(player)
end

return lib