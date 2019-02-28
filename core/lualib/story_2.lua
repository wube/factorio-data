-- This module is designed for scripting the flow of a story or campaign.
-- It works by defining a flow as a series of nodes, where each node performs certain actions when it is started,
-- active, and completed. Each node has a "next" node, and a condition for completion.
-- When the node considers itself complete, the system moves to the next node.
--
-- Example control.lua for a simple demo:
--
--   local story = require("story_2")
--
--   local story_table = {
--     {
--       name = "start",
--
--       init = function(event, story)
--         game.print("A")
--       end,
--
--       condition = function(event, story)
--         if event.tick < 60 then
--           return false
--         end
--
--         return game.players[1].get_item_count("stone") > 0
--       end
--     },
--     {
--       name = "end",
--
--       init = function(event, story)
--         game.print("B")
--       end,
--
--       condition = function(event, story)
--         return game.players[1].get_item_count("wood") > 0
--       end,
--
--       action = function()
--         game.print("C")
--       end
--     }
--   }
--
--   script.on_load(function()
--     story.on_load("example", story_table)
--   end)
--
--   script.on_event(defines.events, function(event)
--     if event.name == defines.events.on_game_created_from_scenario then
--       story.init("example", story_table)
--     end
--
--     story.update_all(event)
--   end)
--
-- All attributes of a node are optional, except for the name attribute, which must be unique.
-- By default, the system will move from one node to the next linearly.
-- If you wish to override this behaviour, you can set a "next" attribute on the node to the name of the node you want
-- to jump to. Alternatively, you can use the jump_to_node function defined below.
-- You can have multiple independent stories running at the same time, provided you use different names when you init/
-- on_load them.
-- There are also some convenience functions for timing/misc provided, see the bottom of this file for details.


local story = {}

local story_data = {}
local story_tables = {}

local validate_story_table = function(name, story_table)
  local node_names_set = {}

  local previous_node_name

  for _, node in pairs(story_table) do
    if not node.name then
      local message = "Story table node with no name found in story table " .. name
      if previous_node_name then
        message = message .. ', preceding node: ' .. previous_node_name
      end

      error(message)
    end

    if node_names_set[node.name] ~= nil then
      error("Duplicate node" .. node.name .. "found in story table " .. name)
    end
    node_names_set[node.name] = true

    -- assert we have only valid keys
    for key, _ in pairs(node) do
      local found = false
      for _, value in pairs({'name', 'init', 'update', 'condition', 'action', 'next'}) do
        if key == value then
          found = true
          break
        end
      end
      if not found then
        error("Invalid key " .. key .. "found on node " .. node.name .." in story table " .. name)
      end
    end

    previous_node_name = node.name
  end
end

-- This should be called once, when the game is first started.
-- A convenient place for this is from an event handler for on_game_created_from_scenario.
story.init = function(name, story_table)
  story_data = global.story_data or story_data
  global.story_data = story_data

  assert(story_table)
  assert(name)
  assert(story_tables[name] == nil)
  validate_story_table(name, story_table)

  -- most fields are optional, so make sure they're set up with sensible defaults
  for i = 1, #story_table, 1 do
    local node = story_table[i]

    node.init = node.init or function() end
    node.update = node.update or function() end
    node.condition = node.condition or function() return true end
    node.action = node.action or function() end

    -- final node will still have next set to nil. Otherwise default to the next entry in the table
    if not node.next then
      local next = story_table[i+1]
      if next then
        node.next = next.name
      end
    end
  end

  -- create a lookup by name table
  local story_table_by_name = {}
  for _, node in pairs(story_table) do
    story_table_by_name[node.name] = node
  end

  story_tables[name] = {
    story_table = story_table,
    story_table_by_name = story_table_by_name
  }

  local this_story_data = story_data[name]

  if not this_story_data then
    this_story_data = {
      first_run = true,
      current_node_name = story_tables[name].story_table[1].name,
      current_node_started_tick = game.ticks_played,
      debug = false
    }

    story_data[name] = this_story_data
  end
end

-- You should call this function from script.on_load
story.on_load = function(name, story_table)
  -- on_load only needs to restore the local story_tables variable. Sometime on_load can end up getting called
  -- when the scenario is created, but in this case the whole setup is already handled by the initial call to init.
  -- So, the check below basically translates to: "Have we run init already in this session".
  if global.story_data and global.story_data[name] and not story_tables[name] then
    story.init(name, story_table)
  end
end

local get_current_node = function(this_story_table, this_story_data)
  return this_story_table.story_table_by_name[this_story_data.current_node_name]
end

-- Update only one story. If you are only using one story, or just want to update them all, you can use update_all()
story.update = function(story_table_name, event)
  local this_story_data = story_data[story_table_name]
  local this_story_table = story_tables[story_table_name]

  local current_node = get_current_node(this_story_table, this_story_data)

  if current_node then
    if this_story_data.first_run then
      current_node.init()
      this_story_data.first_run = false
    end

    current_node.update(event, story_table_name)
    current_node = get_current_node(this_story_table, this_story_data) -- update could change the current node

    if current_node.condition(event, story_table_name) then
      current_node.action(event, story_table_name)

      -- If the action didn't change the current node explicitly, then advance to the normal next node
      if current_node == get_current_node(this_story_table, this_story_data) and current_node.next then
        story.jump_to_node(story_table_name, current_node.next)
      end
    end
  end
end

-- Update all registered stories.
story.update_all = function(event)
  for story_table_name, this_story_table in pairs(story_tables) do
    story.update(story_table_name, event)
  end
end

story.jump_to_node = function(story_table_name, node_name)
  local this_story_table = story_tables[story_table_name]
  local this_story_data = story_data[story_table_name]
  local current_node = get_current_node(this_story_table, this_story_data)

  if this_story_data.debug then
    local message = "Story table " .. story_table_name .. " jumped from " ..
      this_story_data.current_node_name .. " to " .. node_name

    game.print(message)
    print(message)
  end

  this_story_data.current_node_name = node_name
  this_story_data.current_node_started_tick = game.ticks_played
  current_node = get_current_node(this_story_table, this_story_data)

  if not current_node then
    error("Story table " .. story_table_name .. " jumped to invalid node " .. node_name)
  end

  if current_node then
    current_node.init()
  end
end

-- Returns true if "seconds" seconds have passed since the current node was started
story.check_seconds_passed = function(story_table_name, seconds)
  local this_story_data = story_data[story_table_name]
  return this_story_data.current_node_started_tick + (seconds*60) < game.ticks_played
end

-- Returns true if "minutes" minutes have passed since the current node was started
story.check_minutes_passed = function(story_table_name, minutes)
  return story.check_seconds_passed(story_table_name, minutes * 60)
end

-- Returns the number of seconds elapsed since the current node was started
story.get_seconds_passed_since_current_node_started = function(story_table_name)
  local this_story_data = story_data[story_table_name]
  return this_story_data.current_node_started_tick / 60
end

story.get_current_node_name = function(story_table_name)
  local this_story_data = story_data[story_table_name]
  return this_story_data.current_node_name
end

-- When enabled, will game.print all story table transitions
story.set_debug = function(story_table_name, enabled)
  local this_story_data = story_data[story_table_name]
  this_story_data.debug = enabled
end

return story