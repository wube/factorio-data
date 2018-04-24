module(..., package.seeall)
require "defines"

-- The utility for managing state-based campaign levels
Story =
{
}

function Story:new(story)
  obj = {}
  setmetatable(obj, self)
  self.__index = self
  -- indexed table of the story, is created when scenario is started or loaded
  obj.storyhelper = {}
  obj.storytable = {}
  -- Part of the story that needs to be serialised to preserve game state
  obj.context = {}
  -- List of names of currently active update functions
  obj.context.updates = {}
  -- Tick, when the current state started
  obj.context.currentstorystartedat = 0
  -- There can be different stories (sequencies), this specifie which one is active
  obj.context.storyindex = 1
  -- Position in the current story
  obj.context.storyposition = 1
  -- Utility variables used to ensure that the init of the story item is called just once
  obj.context.initcalledlastonstoryindex = 0
  obj.context.initcalledlastonposition = 0
  obj:generatestoryhelper(story)
  return obj
end

function Story:import(context)
  self.context = context
end

function Story:export()
  return self.context
end

function Story:update(event, next_level, onwin)
  local story = self.storytable[self.context.storyindex]
  local startingstoryindex = self.context.storyindex;
  local startingstoryposition = self.context.storyposition;
  if self.context.storyposition > #story then
    return
  end
  if story[self.context.storyposition].init ~= nil then
    if obj.context.initcalledlastonstoryindex ~= self.context.storyindex or
        obj.context.initcalledlastonposition ~= self.context.storyposition then
      obj.context.initcalledlastonstoryindex = self.context.storyindex
      obj.context.initcalledlastonposition = self.context.storyposition
      if story[self.context.storyposition].init(event) then
        return
      end
      if self.context.storyindex ~= startingstoryindex or self.context.storyposition ~= startingstoryposition then
        return
      end
    end
  else
    obj.context.initcalledlastonstoryindex = 0
    obj.context.initcalledlastonposition = 0
  end
  for index, item in pairs(self.context.updates) do
    if self.updatetable[index](event) then
      return
    end
  end
  if self.context.storyindex ~= startingstoryindex or self.context.storyposition ~= startingstoryposition then
    return
  end
  if story[self.context.storyposition].update ~= nil then
     story[self.context.storyposition].update(event)
  end
  if self.context.storyindex ~= startingstoryindex or self.context.storyposition ~= startingstoryposition then
    return
  end
  if (
        story[self.context.storyposition].condition == nil  and
        event.name == defines.events.on_tick
      ) or
      (
        story[self.context.storyposition].condition ~= nil and
        story[self.context.storyposition].condition(event, self)
      ) then
    if self.context.storyindex ~= startingstoryindex or self.context.storyposition ~= startingstoryposition then
      return
    end
    if story[self.context.storyposition].action ~= nil then
      story[self.context.storyposition].action(event, self)
    end
    if self.context.storyindex ~= startingstoryindex or self.context.storyposition ~= startingstoryposition then
      return
    end
    self.context.storyposition = self.context.storyposition + 1
    self.context.currentstorystartedat = event.tick
    if self.context.storyposition > #story then
      if onwin ~= nil then
        onwin()
      end
      if not game.finished then
        game.set_game_state{game_finished=true, player_won=true, next_level=next_level}
      end
    end
  end
end

function Story:generatestoryhelper(story)
  for storyindex, data in pairs(story) do
    if (storyindex ~= "update-functions") then
      self.storytable[storyindex] = data
      for index, item in pairs(data) do
        if item.name ~= nil then
          self.storyhelper[item.name] = {}
          self.storyhelper[item.name].storyindex = storyindex
          self.storyhelper[item.name].position = index
        end
      end
    else
      self.updatetable = data
    end
  end
end

function Story:addupdate(name)
  self.context.updates[name] = true
end

function Story:removeupdate(name)
  self.context.updates[name] = nil
end

function Story:jumpto(name)
  self.context.storyindex = self.storyhelper[name].storyindex
  self.context.storyposition = self.storyhelper[name].position
  if self.context.storyposition ~= 1 then
    local story = self.storytable[self.context.storyindex]
    if story[self.context.storyposition - 1].action ~= nil then
      story[self.context.storyposition - 1].action()
    end
  end
end

function Story:elapsed(event, seconds)
  return event.tick - self.context.currentstorystartedat > seconds * 60
end

function Story:elapsedcheck(seconds)
  return function(event, currentstory) return currentstory:elapsed(event, seconds) end
end
