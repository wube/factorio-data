require "defines"

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
  -- There can be different stories (sequencies), this specifie which one is active
  result.story_index = 1
  -- Position in the current story
  result.story_position = 1
  -- Utility variables used to ensure that the init of the story item is called just once
  result.init_called_last_on_story_index = 0
  result.init_called_last_on_position = 0
  return result
end

function story_update(story, event, next_level, onwin)
  local branch = story_branches[story.story_index]
  local starting_story_index = story.story_index;
  local starting_story_position = story.story_position;
  if story.story_position > #branch then
    return
  end
  if branch[story.story_position].init ~= nil then
    if story.init_called_last_on_story_index ~= story.story_index or
        story.init_called_last_on_position ~= story.story_position then
      story.init_called_last_on_story_index = story.story_index
      story.init_called_last_on_position = story.story_position
      if branch[story.story_position].init(event, story) then
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
  if branch[story.story_position].update ~= nil then
     branch[story.story_position].update(event, story)
  end
  if story.story_index ~= starting_story_index or story.story_position ~= starting_story_position then
    return
  end
  if (
        branch[story.story_position].condition == nil  and
        event.name == defines.events.on_tick
      ) or
      (
        branch[story.story_position].condition ~= nil and
        branch[story.story_position].condition(event, story)
      ) then
    if story.story_index ~= starting_story_index or story.story_position ~= starting_story_position then
      return
    end
    if branch[story.story_position].action ~= nil then
      branch[story.story_position].action(event, story)
    end
    if story.story_index ~= starting_story_index or story.story_position ~= starting_story_position then
      return
    end
    story.story_position = story.story_position + 1
    story.current_story_started_at = event.tick
    if story.story_position > #branch then
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
  local story_point = story_points_by_name[name];
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
