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

function story_init()
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
        game.set_game_state{game_finished=true, player_won=true, next_level=next_level}
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

function story_show_message_dialog(param)
  if #game.players > 1 then
    game.print(param.text)
  else
    game.show_message_dialog(param)
  end
end



function set_goal(goal_string, update_only)
  for k, player in pairs (game.players) do
    local gui = player.gui.goal
    gui.direction = "vertical"
    if goal_string and goal_string ~= "" then
      player.set_goal_description(goal_string, update_only)
    elseif update_only == false then
      player.set_goal_description("hi")
      player.set_goal_description("")
    else
      player.set_goal_description("")
    end
  end
end

function set_info(info, append)
  for k, player in pairs (game.players) do
    local gui = player.gui.goal
    gui.direction = "vertical"
    local info_flow = gui.goal_info_frame
    if not info then
      if info_flow then
        info_flow.destroy()
      end
    else
      if not info_flow then 
        info_flow = gui.add{type = "flow", name = "goal_info_frame", direction = "vertical"}
      end
      if not append then
        info_flow.clear()
      end
      if info then
        if info.custom_function then
          info.custom_function(info_flow)
        end
        if info.text then
          local label = info_flow.add
          {
            type = "label",
            caption = info.text,
            single_line = false
          }
          label.style.top_padding = 3
          label.style.bottom_padding = 3
          label.style.maximal_width = 384
        end
        if info.picture then
          if type(info.picture) == "string" then
            info_flow.add
            {
              type = "sprite",
              sprite = info.picture
            }
          else
            local element = info_flow.add
            {
              type = "sprite",
              name = info.picture.name,
              tooltip = info.picture.tooltip,
              sprite = info.picture.path
            }
            if info.picture.style then
              for name, value in pairs (info.picture.style) do
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
              local element = flow.add
              {
                type = "sprite",
                sprite = picture.path,
                tooltip = picture.tooltip
              }
              if picture.style then
                for name, value in pairs (picture.style) do
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
end

function export_entities(param)
  if not param then param = {} end
  local surface = param.surface or game.surfaces[1]
  local item = surface.create_entity{name = "item-on-ground", position = {-400,0}, stack = "blueprint", force = "player"}
  local blueprint = item.stack
  local entities
  if param.area then
    entities = surface.find_entities_filtered{area = param.area}
  else
    entities = surface.find_entities()
  end
  local ignore = param.ignore or 
  {
    player = true,
    particle = true,
    projectile = true,
    ["item-request-proxy"] = true,
    explosion = true
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
    return inventory
  end
  local exported = {}
  local count = 1
  for k, entity in pairs (entities) do
    if entity ~= item and not (ignore[entity.type]) then
      local info = {}
      blueprint.create_blueprint{surface = surface, force = "player", area = entity.bounding_box}
      list = blueprint.get_blueprint_entities()
      if list then
        local this = false
        for i, listed in pairs (list) do
          if listed.name == entity.name and listed.direction == entity.direction then
            this = list[i]
            break
          end
        end  
        if this then
          info = this
        end
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
        if entity.recipe then
          info.recipe = entity.recipe.name
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
      exported[count] = info
      count = count + 1
      entity.destroy()
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
  for k, entity in pairs (array) do
    local save_position = {x = entity.position.x, y = entity.position.y}
    entity.position.x = entity.position.x + offset[1]
    entity.position.y = entity.position.y + offset[2]
    entity.force = force
    local created = false
    if bool or (entity.name ~= "locomotive" and entity.name ~= "rail-signal") then
      created = surface.create_entity(entity)
    end
    entity.position = save_position
    if created then
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
        created.recipe = entity.recipe
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
  if not bool then
    for k, entity in pairs (recreate_entities(remaining, param, true)) do
      created_entities[created_count] = entity
      created_count = created_count + 1
    end
  end
  return created_entities
end
