require "story"

--Init the story script
script.on_init(function()
  global.story = story_init()
end)

--Register the update to all events
script.on_event(defines.events, function(event)
  story_update(global.story, event)
end)

--Can also register to specific events, if you want to do multiple things with that event
script.on_event(defines.events.on_tick, function(event)
  story_update(global.story, event)
  --Other things on tick can go here.
end)

story_table =
{
  {
    {
      init = function(event, story)
        game.print("Welcome players")
        set_goal("Enjoy the scenery for 5 seconds")
      end,
      condition = story_elapsed_check(5)
    },
    {
      init = function(event, story)
        game.print("Enough relaxation, time to automate!")
        set_goal("Automate it!")
        set_info{text = "Automating things is a lot of fun, trust me"}
        for k, player in pairs (game.players) do
          player.insert("iron-plate")
        end
      end,
      update = function(event, story)
        if event.name == defines.events.on_player_crafted_item then
          game.players[event.player_index].print({"", "You crafted a ", game.item_prototypes[event.item_stack.name].localised_name})
        end
      end,
      condition = function(event)
        return event.name == defines.events.on_built_entity
      end,
      action = function(event)
        game.print({"", game.players[event.player_index].name, " built a ", event.created_entity.localised_name})
      end
    },
    {
      init = function()
        set_goal("Thats it guys!")
        set_info()
      end,
      condition = story_elapsed_check(5)
    }
  }
}

story_init_helpers(story_table)
