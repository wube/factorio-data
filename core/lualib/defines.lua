
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
  furnace_source = 1,
  furnace_result = 2,
  player_main = 1,
  player_quickbar = 2,
  player_guns = 3,
  player_ammo = 4,
  player_armor = 5,
  player_tools = 6,
  player_vehicle = 7,
  player_trash = 8,
  assembling_machine_input = 2,
  assembling_machine_output = 3,
  assembling_machine_modules = 4,
  lab_input = 2,
  lab_modules = 3,
  mining_drill_modules = 2
}

transport_line =
{
  left_line = 1,
  right_line = 2,
  left_underground_line = 3,
  right_underground_line = 4,
  secondary_left_line = 3,
  secondary_right_line = 4,
  left_split_line = 5,
  right_split_line = 6,
  secondary_left_split_line = 7,
  secondary_right_split_line = 8
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

--? Command given to units describing what they should do.
command =
{
  attack = 1,         --? Attack another entity
  go_to_location = 2, --? Go to a specific position
  compound=3,         --? Chain commands together, see $ref(compoundcommandtype).
  group = 4,          --? Do what your group wants you to do.
  attack_area = 5,    --? Go to a place and attack what you see.
  wander = 6,         --? Chill.
  build_base = 7,     --? Go to a position and build a spawner there.
}

distraction =
{
  --? Perform command even if someone attacks the unit.
  none = 0,
  --? Attack closer enemy entities with force.
  by_enemy = 1,
  --? Attack closer enemy entities, including entities "built" by player (belts, inserters, chests).
  by_anything = 3,
  --? Attacks when attacked.
  by_damage = 4,
}

--? How are commands compounded in a compounded compound command commanding compound composts.
compoundcommandtype =
{
  --? Stop on first command returning failure
  logical_and = 0,
  --? Stop on first command returning success
  logical_or = 1,
  --? Perform all the commands and return lasts result
  return_last = 2
}

difficulty =
{
  easy = 0,
  normal = 1,
  hard = 2
}

events =
{
  on_tick = 0,
  on_gui_click = 1,
  on_entity_died = 2,
  on_picked_up_item = 3,
  on_built_entity = 4,
  on_sector_scanned = 5,
  on_player_mined_item = 6,
  on_put_item = 7,
  on_rocket_launched = 8,
  on_preplayer_mined_item = 9,
  on_chunk_generated = 10,
  on_player_crafted_item = 11,
  on_robot_built_entity = 12,
  on_robot_pre_mined = 13,
  on_robot_mined = 14,
  on_research_started = 15,
  on_research_finished = 16,
  on_player_rotated_entity = 17,
  on_marked_for_deconstruction = 18,
  on_canceled_deconstruction = 19,
  on_trigger_created_entity = 20,
  on_train_changed_state = 21,
  on_player_created = 22,
  on_resource_depleted = 23,
  on_player_driving_changed_state = 24,
  on_force_created = 25,
  on_forces_merging = 26
}

controllers =
{
  ghost = 0,      --? Can't interact with the world, can only observe. Used in the multiplayer waiting-to-respawn screen.
  character = 1,  --? The controller controls a character. This is the default controller in freeplay.
  god = 2         --? The controller isn't tied to a character. This is the default controller in sandbox.
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

circuitconnectorid =
{
  electric_pole = 1,
  inserter = 1,
  container = 1,
  lamp = 1,
  combinator_input = 1,
  combinator_output = 2
}

circuitconditionindex =
{
  inserter_circuit = 1,
  inserter_logistic = 1,
  lamp = 1,
  arithmetic_combinator = 1,
  decider_combinator = 1,
  constant_combinator = 1,
  offshore_pump = 1,
  pump = 1
}

trainstate =
{
  --? Normal state -- following the path.
  on_the_path = 0,
  --? Had path and lost it -- must stop.
  path_lost = 1,
  --? Doesn't have anywhere to go.
  no_schedule = 2,
  --? Has no path and is stopped.
  no_path = 3,
  --? Braking before a rail signal.
  arrive_signal = 4,
  --? Waiting at a signal.
  wait_signal = 5,
  --? Braking before a station.
  arrive_station = 6,
  --? Waiting at a station.
  wait_station = 7,
  --? Switched to manual control and has to stop.
  manual_control_stop = 8,
  --? Can move if user explicitly sits in and rides the train.
  manual_control = 9,
  --? Train was switched to auto control but it is moving and needs to be stopped.
  stop_for_auto_control = 10
}

--? State of an ordinary rail signal.
signal_state =
{
  --? Green
  open = 0,
  --? Red
  closed = 1,
  --? Orange
  reserved = 2
}

--? State of a chain signal.
chain_signal_state =
{
  --? Invalid
  none = 0,
  --? Green
  all_open = 1,
  --? Blue
  partially_open = 2,
  --? Red
  none_open = 3
}

rail_direction =
{
  front = 0,
  back = 1
}

rail_connection_direction =
{
  left = 0,
  straight = 1,
  right = 2
}
