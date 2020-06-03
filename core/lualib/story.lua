require("mod-gui")

function story_init_helpers(story)
  story_points_by_name = {}
  story_branches = {}
  for story_index, data in pairs(story) do
    if (story_index ~= "update-functions") then
      story_branches[story_index] = data
      for index, item in pairs(data) do
        if item.name ~= nil then
          story_points_by_name[item.name] = {}
          story_points_by_name[item.name].story_index = story_index
          story_points_by_name[item.name].position = index
        end
      end
    else
      story_update_table = data
    end
  end
end

function story_init(player)
  local result = {}
  -- List of names of currently active update functions
  result.updates = {}
  -- Tick, when the current state started
  result.current_story_started_at = 0
  -- There can be different stories (sequencies), this specifies which one is active
  result.story_index = 1
  -- Position in the current story
  result.story_position = 1
  -- Utility variables used to ensure that the init of the story item is called just once
  result.init_called_last_on_story_index = 0
  result.init_called_last_on_position = 0
  return result
end

function story_update(story, event, next_level, onwin)
  if event.name == defines.events.on_entity_renamed then return end
  if event.created_entity then
    global.last_built_position = event.created_entity.position
  end
  on_gui_click(event)
  local branches = story_branches[story.story_index]
  local starting_story_index = story.story_index
  local starting_story_position = story.story_position
  local branch = branches[story.story_position]
  if story.story_position > #branches then
    return
  end
  if branch.init ~= nil then
    if story.init_called_last_on_story_index ~= story.story_index or
        story.init_called_last_on_position ~= story.story_position then
      story.init_called_last_on_story_index = story.story_index
      story.init_called_last_on_position = story.story_position
      if branch.init(event, story) then
        return
      end
      if story.story_index ~= starting_story_index or story.story_position ~= starting_story_position then
        return
      end
    end
  else
    story.init_called_last_on_story_index = 0
    story.init_called_last_on_position = 0
  end
  for index, item in pairs(story.updates) do
    if story_update_table[index](event, story) then
      return
    end
  end
  if story.story_index ~= starting_story_index or story.story_position ~= starting_story_position then
    return
  end
  if branch.update ~= nil then
    branch.update(event, story)
  end
  if branch.idle ~= nil then
    local count = (event.tick - story.current_story_started_at)/60
    if branch.idle[count] then
      branch.idle[count](event, story)
    end
  end
  if story.story_index ~= starting_story_index or story.story_position ~= starting_story_position then
    return
  end
  if (
        branch.condition == nil  and
        event.name == defines.events.on_tick
      ) or
      (
        branch.condition ~= nil and
        branch.condition(event, story)
      ) then
    if story.story_index ~= starting_story_index or story.story_position ~= starting_story_position then
      return
    end
    if branch.action ~= nil then
      branch.action(event, story)
    end
    if story.story_index ~= starting_story_index or story.story_position ~= starting_story_position then
      return
    end
    story.story_position = story.story_position + 1
    story.current_story_started_at = event.tick
    if story.story_position > #branches then
      if onwin ~= nil then
        onwin()
      end
      if not game.finished then
        if next_level then
          game.set_game_state{game_finished=true, player_won=true, next_level=next_level}
        else
          game.set_game_state{game_finished=true, player_won=true}
        end
      end
    end
  end
end

function story_add_update(story, name)
  story.updates[name] = true
end

function story_remove_update(story, name)
  story.updates[name] = nil
end

function story_jump_to(story, name)
  local story_point = story_points_by_name[name]
  story.story_index = story_point.story_index
  story.story_position = story_point.position
  if story.story_position ~= 1 then
    local test = story.story_index + 1
    local branch = story_branches[story.story_index]
    if branch[story.story_position - 1].action ~= nil then
      branch[story.story_position - 1].action()
    end
  end
end

function story_elapsed(story, event, seconds)
  return event.tick - story.current_story_started_at > seconds * 60
end

function story_elapsed_check(seconds)
  return function(event, current_story) return story_elapsed(current_story, event, seconds) end
end

function story_show_message_dialog(param, player)
  if game.is_multiplayer() then
    if player then
      player.print(param.text)
    else
      game.print(param.text)
    end
  else
    game.show_message_dialog(param)
  end
end

function set_goal(goal_string, update_only)
  global.goal_string = goal_string
  for k, player in pairs (game.players) do
    player_set_goal(player, goal_string, update_only)
  end
end

function player_set_goal(player, goal_string, update_only)
  local gui = player.gui.goal
  if goal_string and goal_string ~= "" then
    player.set_goal_description(goal_string, update_only)
  elseif update_only == false then
    player.set_goal_description("hi")
    player.set_goal_description("")
  else
    player.set_goal_description("")
  end
end

function on_player_joined(player)
  if global.goal_string then
    player_set_goal(player, global.goal_string)
  end
  if global.set_info then
    for k, info in pairs (global.set_info) do
      player_set_info(info)
    end
  end
end

function flash_goal()
  for k, player in pairs (game.players) do
    local goal_string = player.get_goal_description()
      player.set_goal_description("hi")
      player.set_goal_description(goal_string)
  end
end

function set_info(info)
  if not global.set_info then
    global.set_info = {}
  end
  if not info then
    global.set_info = nil
    for k, player in pairs (game.players) do
      player_set_info(player, info)
    end
    return
  end
  local append = info.append
  if not append then
    global.set_info = {}
  end
  table.insert(global.set_info, info)
  for k, player in pairs (game.players) do
    player_set_info(player, info)
  end
end

function player_set_info(player, info)
  local gui = player.gui.goal
  local info_flow = gui.goal_info_frame
  if not info then
    if info_flow then
      info_flow.destroy()
    end
  else
    if not info_flow then
      info_flow = gui.add{type = "flow", name = "goal_info_frame", direction = "vertical"}
      info_flow.style.vertical_spacing = 8
      info_flow.style.top_padding = 8
    end
    if not info.append then
      info_flow.clear()
    end
    if info then
      if info.custom_function then
        info.custom_function(info_flow)
      end
      if info.text or info[1] then
        local label = info_flow.add
        {
          type = "label",
          caption = info.text or info,
          style = "goal_label"
        }
        label.style.single_line = false
      end
      if info.picture then
        local flow = info_flow.add{type = "flow"}
        if type(info.picture) == "string" then
          flow.add{type = "frame", style = "deep_frame_in_shallow_frame"}.add
          {
            type = "sprite",
            sprite = info.picture
          }
        else
          local element = flow.add{type = "frame", style = "deep_frame_in_shallow_frame"}.add
          {
            type = "sprite",
            name = info.picture.name,
            tooltip = info.picture.tooltip,
            sprite = info.picture.path
          }
          if info.picture.lua_style then
            for name, value in pairs (info.picture.lua_style) do
              element.style[name] = value
            end
          end
        end
      end
      if info.pictures then
        local flow = info_flow.add{type = "flow"}
        for k, picture in pairs (info.pictures) do
          if type(picture) == "string" then
            flow.add
            {
              type = "sprite",
              sprite = picture
            }
          else
            if picture.split then
              flow = info_flow.add{type = "flow"}
            end
            local element = flow.add{type = "frame", style = "deep_frame_in_shallow_frame"}.add
            {
              type = "sprite",
              sprite = picture.path,
              tooltip = picture.tooltip
            }
            if picture.lua_style then
              for name, value in pairs (picture.lua_style) do
                element.style[name] = value
              end
            end
          end
        end
      end
      if info.camera then
        local camera = info_flow.add
        {
          type = "camera",
          name = info.camera.name,
          tooltip = info.camera.tooltip,
          position = info.camera.position,
          surface_index = info.camera.surface_index,
          zoom = info.camera.zoom
        }
        camera.style.minimal_width = info.camera.minimal_width or 32
        camera.style.minimal_height = info.camera.minimal_height or 32
      end
    end
  end
end

function export_entities(param)
  if not param then param = {} end
  local surface = param.surface or game.surfaces[1]
  local item = surface.create_entity{name = "item-on-ground", position = {-400,0}, stack = "blueprint", force = "player"}
  local blueprint = item.stack
  local entities = param.entities
  if not entities then
    if param.area then
      entities = surface.find_entities_filtered{area = param.area}
    else
      entities = surface.find_entities()
    end
  end
  local ignore = param.ignore or
  {
    player = true,
    particle = true,
    projectile = true,
    ["item-request-proxy"] = true,
    explosion = true,
    ["highlight-box"] = true
  }
  local get_inventory = function(entity)
    if not entity.valid then return nil end
    local inventory = {}
    for k = 1,10 do
      local inv = entity.get_inventory(k)
      if inv then
        inventory[k] = inv.get_contents()
      end
    end
    if #inventory > 0 then
      return inventory
    else
      return nil
    end
  end
  local exported = {}
  local index_map = {}
  local count = 1
  for k, entity in pairs (entities) do
    if entity.valid then
      if entity ~= item and not (ignore[entity.type]) then
        local info = {}
        blueprint.create_blueprint{surface = surface, force = "player", area = entity.bounding_box}
        list = blueprint.get_blueprint_entities()
        if list then
          local this = false
          for i, listed in pairs (list) do
            if listed.name == entity.name and entity.type ~= "curved-rail" and entity.type ~= "straight-rail" then
              this = list[i]
              break
            end
          end
          if this then
            info = this
          end
        end
        if entity.direction and entity.direction ~= 0 then
          info.direction = entity.direction
        end
        info.index = count
        local unit_number = entity.unit_number
        if unit_number then
          index_map[unit_number] = count
        end
        info.name = entity.name
        if entity.type == "resource" then
          info.amount = entity.amount
        elseif entity.type == "entity-ghost" then
          info.inner_name = entity.ghost_name
        elseif entity.type == "item-entity" then
          info.stack = {name = entity.stack.name, count = entity.stack.count}
        elseif entity.type == "transport-belt" or entity.type == "underground-belt" then
          info.line_contents = {}
          for k = 1, 2 do
            local line = entity.get_transport_line(k)
            info.line_contents[k] = line.get_contents()
            line.clear()
          end
        elseif entity.type == "splitter" then
          info.line_contents = {}
          for k = 1, 8 do
            local line = entity.get_transport_line(k)
            info.line_contents[k] = line.get_contents()
            line.clear()
          end
        elseif entity.type == "locomotive" then
          info.schedule = entity.train.schedule
          info.speed = entity.train.speed
          info.manual_mode = entity.train.manual_mode
          info.direction = math.floor(0.5+entity.orientation*8)%8
        elseif entity.name == "flying-text" then
          info.text = ""
        elseif entity.type == "assembling-machine" then
          if entity.get_recipe() then
            info.recipe = entity.get_recipe().name
          end
        end
        if entity.type == "underground-belt" then
          info.type = entity.belt_to_ground_type
        end
        info.color = entity.color
        info.force = entity.force.name
        info.position = entity.position
        info.inventory = get_inventory(entity)
        info.backer_name = entity.backer_name
        info.minable = entity.minable
        info.rotatable = entity.rotatable
        info.operable = entity.operable
        info.destructible = entity.destructible
        info.entity_number = nil
        exported[count] = info
        count = count + 1
      end
    end
  end
  for k, entity in pairs (entities) do
    if entity.valid and entity.circuit_connected_entities and entity.unit_number then
      local entity_index = index_map[entity.unit_number]
      if entity_index then
        local connection_definitions = {}
        for j, definition in pairs (entity.circuit_connection_definitions) do
          local unit_number = definition.target_entity.unit_number
          if unit_number then
            local index = index_map[unit_number]
            if index then
              connection_definitions[index] = {
                wire = definition.wire,
                source_circuit_id = definition.source_circuit_id,
                target_circuit_id = definition.target_circuit_id
              }
            end
          end
        end
        if #connection_definitions > 0 then
          exported[entity_index].circuit_connection_definitions = connection_definitions
        end
      end
    end
  end
  for k, entity in pairs (entities) do
    if entity.valid then
      if entity ~= item and not (ignore[entity.type]) then
        entity.destroy()
      end
    end
  end
  if item.valid then
    item.destroy()
  end
  return exported
end

function recreate_entities(array, param, bool)
  if not param then param = {} end
  local offset = param.offset or {0,0}
  local surface = param.surface or game.surfaces[1]
  local force = param.force or "player"
  local created_entities = {}
  local created_count = 1
  local remaining = {}
  local remaining_count = 1
  local index_map = {}
  local filter = param.filter
  local filter_map = {}
  if filter then
    for k, name in pairs (filter) do
      filter_map[name] = true
    end
  end
  for k, entity in pairs (array) do
    if not filter or filter_map[entity.name] then
      local save_position = {x = entity.position.x, y = entity.position.y}
      entity.position.x = entity.position.x + (offset[1] or offset.x)
      entity.position.y = entity.position.y + (offset[2] or offset.y)
      entity.force = force
      entity.expires = entity.expires or false
      if not param.check_can_place or surface.can_place_entity(entity) then
        if not entity.index then entity.index = -1 end
        local created = false
        if bool or (entity.name ~= "locomotive" and entity.name ~= "rail-signal") then
          created = surface.create_entity(entity)
          index_map[entity.index] = created
        end
        entity.position = save_position
        if created then
          index_map[entity.index] = created
          if entity.filters then
            for k, filter in pairs (entity.filters) do
              created.set_filter(filter.index, filter.name)
            end
          end
          if entity.amount then
            created.amount = entity.amount
          end
          if entity.inventory then
            for index, contents in pairs (entity.inventory) do
              local inventory = created.get_inventory(index)
              if inventory then
                for name, count in pairs (contents) do
                  created.insert({name = name, count = count})
                end
              end
            end
          end
          if entity.line_contents then
            for k, contents in pairs (entity.line_contents) do
              local line = created.get_transport_line(k)
              for name, count in pairs (contents) do
                for i = 0, count-1 do
                  line.insert_at((0.1+i)/count, {name = name, count = 1})
                end
              end
            end
          end
          if entity.backer_name then
            created.backer_name = entity.backer_name
          end
          if entity.color then
            created.color = entity.color
          end
          if entity.recipe then
            created.set_recipe(entity.recipe)
          end
          created.minable = entity.minable
          created.rotatable = entity.rotatable
          created.operable = entity.operable
          created.destructible = entity.destructible
          if entity.schedule then
            created.train.schedule = entity.schedule
            created.train.speed = entity.speed
            created.train.manual_mode = entity.manual_mode
          end
          created_entities[created_count] = created
          created_count = created_count + 1
        else
          remaining[remaining_count] = entity
          remaining_count = remaining_count + 1
        end
      end
    end
  end
  if not bool then
    for k, entity in pairs (recreate_entities(remaining, param, true)) do
      created_entities[created_count] = entity
      created_count = created_count + 1
    end
  end
  for k, entity in pairs (array) do
    local created = index_map[entity.index]
    if created and created.valid then
      if entity.circuit_connection_definitions then
        for index, definition in pairs (entity.circuit_connection_definitions) do
          entity_to_connect = index_map[index]
          if entity_to_connect.valid then
            created.connect_neighbour({wire = definition.wire, target_entity = entity_to_connect, source_circuit_id = definition.source_circuit_id, target_circuit_id = definition.target_circuit_id})
          end
        end
      end
    end
  end
  return created_entities
end

function limit_camera(origin, distance)
  for k, player in pairs (game.players) do
    local position = player.position
    local new_position = {}
    new_position.x = math.min (position.x, origin[1] + distance)
    new_position.x = math.max (new_position.x, origin[1] - distance)
    new_position.y = math.min (position.y, origin[2] + distance)
    new_position.y = math.max (new_position.y, origin[2] - distance)
    if (new_position.x ~= position.x) or (new_position.y ~= position.y) then
      player.teleport(new_position)
    end
  end
end

function find_gui_recursive(gui, name)
  for k, child in pairs (gui.children) do
    if child.name == name then
      return child
    end
    local result = find_gui_recursive(child, name)
    if result then
      return result
    end
  end
  return false
end

function add_button(gui)
  local button = gui.add{type = "button", name = "story_continue_button", caption = {"continue"}}
  global.continue = false
  return button
end

function on_gui_click(event)
  if event.name ~= defines.events.on_gui_click then return end
  local element = event.element
  if not element.valid then return end
  local name = element.name
  local player = game.players[event.player_index]
  if name == "story_continue_button" then
    if not element.enabled then return end
    global.continue = true
    set_continue_button_style(function (button)
      if button.valid then
        button.enabled = false
      end
    end)
    element.enabled = false
    return
  end
  if name == "message_log_close_button" then
    element.parent.visible = not element.parent.visible
    return
  end
  if name == "toggle_message_log_button" then
    local gui = player.gui.center
    if gui.message_log_frame then
      gui.message_log_frame.visible = not gui.message_log_frame.visible
    end
    element.sprite = "message_log_icon"
    return
  end
  if name == "toggle_objective_button" then
    local gui = player.gui.goal
    if gui then
      gui.visible = not gui.visible
    end
    return
  end
  if story_gui_click then
    story_gui_click(event)
  end
end

function set_continue_button_style(func)
  for k, player in pairs (game.players) do
    local button = find_gui_recursive(player.gui, "story_continue_button")
    if button then
      func(button)
    end
  end
end

--Should only be used in mini-tutorials for convenience
function player(i)
  if not i then i = 1 end
  return game.players[i]
end

--Use carefully, it might not be what you want
function surface(i)
  if not i then i = 1 end
  return game.surfaces[i]
end

function deconstruct_on_tick(entities, seconds)
  local tick = game.tick
  if entities then
    seconds = seconds or 1
    local duration = seconds*60

    --Shuffle the table
    local rand = math.random
    local size = #entities
    for k, entity in pairs (entities) do
      local index = rand(size)
      entities[k], entities[index] = entities[index], entities[k]
    end

    local new_table = {}
    for k = 1, duration do
      new_table[tick+k] = {}
    end

    local insert = table.insert
    for k, entity in pairs (entities) do
      local tick_to_deconstruct = 1 + tick + (k % duration)
      insert(new_table[tick_to_deconstruct], entity)
    end
    global.entities_to_deconstruct_on_tick = new_table
    global.entities_to_deconstruct_on_tick.end_tick = tick + duration
    return
  end

  if tick > global.entities_to_deconstruct_on_tick.end_tick then
    global.entities_to_deconstruct_on_tick = nil
    return true
  end

  local entities = global.entities_to_deconstruct_on_tick[tick]

  if entities then
    for k, entity in pairs (entities) do
      if entity.valid then
        --surface().create_entity{name = "explosion", position = entity.position}
        entity.destroy()
      end
    end
    global.entities_to_deconstruct_on_tick[tick] = nil
  end

end

function recreate_entities_on_tick(entities, param, seconds)
  local tick = game.tick
  if entities then
    local duration
    if seconds then
      duration = seconds*60
    else
      duration = #entities
    end
    local new_table = {}
    for k = 1, duration do
      new_table[k+tick] = {}
    end
    local insert = table.insert
    for k, entity in pairs (entities) do
      local tick_to_build = 1 + tick + ((k-1) % duration)
      insert(new_table[tick_to_build], entity)
    end
    new_table.param = param
    new_table.end_tick = tick + duration
    global.entities_to_build_on_tick = new_table
    return
  end
  if tick > global.entities_to_build_on_tick.end_tick then
    global.entities_to_build_on_tick = nil
    return true
  end

  local entities = global.entities_to_build_on_tick[tick]

  if entities then
    recreate_entities(entities, global.entities_to_build_on_tick.param)
    global.entities_to_build_on_tick[tick] = nil
  end

end

function flying_congrats(position)
  if not position then position = player().position end
  if not position.x then position.x = position[1] end
  if not position.y then position.y = position[2] end
  surface().create_entity{name = "tutorial-flying-text", text = {"tutorial-gui.objective-complete"}, position = {position.x, position.y - 1.5}, color = {r = 0.1, g = 1, b = 0.1}}
end
