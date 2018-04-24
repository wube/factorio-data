
module(..., package.seeall)

-- List of common constants used across user scripts.
-- WARNING:
-- There is a nasty coupling with values in the code (changing constant in the code
-- would require changing this definition as well). However I don't see a reason
-- for changing those values in the code in the first place, therefore for now this
-- defines list is in the lua (could be moved to C++ backend later).
inventory =
{
  fuel = 1,
  chest = 1,
  furnacesource = 1,
  furnaceresult = 2,
  playerquickbar = 1,
  playermain = 2,
  playerguns = 3,
  playertools = 6,
  playerammo = 4,
  playerarmor = 5,
  assemblingmachineinput = 2,
  assemblingmachineoutput = 3,
  assemblingmachinemodules = 4,
  labinput = 2,
  labmodules = 3,
  miningdrillmodules = 2
}

direction =
{
  north = 0,
  northeast = 1,
  east = 2,
  southeast = 3,
  south = 4,
  southwest = 5,
  west = 6,
  northwest = 7
}

riding =
{
  acceleration =
  {
    nothing = 0,
    accelerating = 1,
    braking = 2,
    reversing = 3
  },

  direction =
  {
    left = 0,
    straight = 1,
    right = 2
  }
}

command =
{
  attack = 1,
  gotolocation = 2,
  compound=3,
  group = 4,
  attackarea = 5,
  wander = 6,
  buildbase = 7,
}

distraction =
{
  -- perform command even if someone is attacking unit
  none = 0,
  -- attacks closer entities with force without distraction
  byenemy = 1,
  -- attacks closer entities with force and
  -- entities "built" by player (belts, inserters, chests)
  byanything = 3,
  -- attacks when attacked
  bydamage = 4,
}

compoundcommandtype =
{
  -- stop on first command returning failure
  logicaland = 0,
  -- stop on first command returning success
  logicalor = 1,
  -- perform all the commands and return lasts result
  returnlast = 2
}

difficulty =
{
  easy = 0,
  normal = 1,
  hard = 2
}

events =
{
  ontick = 0,
  onguiclick = 1,
  onentitydied = 2,
  onpickedupitem = 3,
  onbuiltentity = 4,
  onsectorscanned = 5,
  onplayermineditem = 6,
  onputitem = 7,
  onshiplandingstart = 8,
  onpreplayermineditem = 9,
  onchunkgenerated = 10,
  onplayercrafteditem = 11,
  onrobotbuiltentity = 12,
  onrobotpremined = 13,
  onrobotmined = 14,
  onresearchstarted = 15,
  onresearchfinished = 16,
  onplayerrotatedentity = 17,
  onmarkedfordeconstruction = 18,
  oncanceleddeconstruction = 19,
  ontriggercreatedentity = 20,
  ontrainchangedstate = 21,
  onplayercreated = 22
}

controllers =
{
  ghost = 0,
  character = 1,
  god = 2

}

groupstate =
{
  gathering = 0,
  moving = 1,
  attacking = 2
}

circuitconnector = 
{
  red = 0,
  green = 1,
  logistic = 2
}

trainstate =
{
  -- normal state - following the path
  onthepath = 0,
  -- had path and lost it - must stop
  pathlost = 1,
  -- doesn't have anywhere to go
  noschedule = 2,
  -- has no path and is stopped
  nopath = 3,
  -- braking before the railSignal
  arrivesignal = 4,
  waitsignal = 5,
  -- braking before the station
  arrivestation = 6,
  waitstation = 7,
  -- switched to the manual control and has to stop
  manualcontrolstop = 8,
  -- can move if user explicitly sits in and rides the train
  manualcontrol = 9,
  -- train was switched to auto control but it is moving and needs to be stopped
  stopforautocontrol = 10
}

signalstate =
{
  -- green
  open = 0,
  -- red
  closed = 1,
  -- orange
  reserved = 2
}

recipe =
{
  materialtype =
  {
    item = 0,
    fluid = 1
  }
}
