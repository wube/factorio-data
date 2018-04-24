module(..., package.seeall)
require "defines"


Builder = {}

function Builder:new(definition)
  obj = {}
  setmetatable(obj, self)
  self.__index = self
  obj.actions = {}
  obj.index = 1
  obj.position = definition.position
  obj.last_tick = definition.tick
  return obj
end

function Builder:addbuild(builddata)
  self.actions[#self.actions + 1] = builddata
end

function Builder:update(tick)
  if self.index > #self.actions then return end
  action = self.actions[self.index]
  if tick < action.tick + self.last_tick then return end

  -- perform action
  self.position = action.positionfunction(self.position)
  self.index = self.index + 1
  game.surfaces["nauvis"].create_entity{name=action.name, position=self.position, direction=action.direction}
  self.last_tick = self.last_tick + action.tick
end

function down(position) return {x=position.x, y=position.y + 1} end
function right(position) return {x=position.x + 1, y=position.y} end

builder = Builder:new({position={x=-12, y=30}, tick=game.tick})
for i = 1, 10 do
  builder:addbuild{tick=5, name="basic-transport-belt", positionfunction=right, direction=defines.direction.east}
end
  builder:addbuild{tick=5, name="basic-transport-belt", positionfunction=right, direction=defines.direction.south}
for i = 1, 10 do
  builder:addbuild{tick=5, name="basic-transport-belt", positionfunction=down, direction=defines.direction.south}
end

