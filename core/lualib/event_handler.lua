
local libraries = {}

local register_events = function()

  local all_events = {}
  local on_nth_tick = {}

  for lib_name, lib in pairs (libraries) do

    if lib.events then
      for k, handler in pairs (lib.events) do
        all_events[k] = all_events[k] or {}
        all_events[k][lib_name] = handler
      end
    end

    if lib.on_nth_tick then
      for n, handler in pairs (lib.on_nth_tick) do
        on_nth_tick[n] = on_nth_tick[n] or {}
        on_nth_tick[n][lib_name] = handler
      end
    end

    if lib.add_remote_interface then
      lib.add_remote_interface()
    end

    if lib.add_commands then
      lib.add_commands()
    end

  end

  for event, handlers in pairs (all_events) do
    local action = function(event)
      for k, handler in pairs (handlers) do
        handler(event)
      end
    end
    script.on_event(event, action)
  end

  for n, handlers in pairs (on_nth_tick) do
    local action = function(event)
      for k, handler in pairs (handlers) do
        handler(event)
      end
    end
    script.on_nth_tick(n, action)
  end

end

script.on_init(function()
  for k, lib in pairs (libraries) do
    if lib.on_init then
      lib.on_init()
    end
  end
  register_events()
end)

script.on_load(function()
  for k, lib in pairs (libraries) do
    if lib.on_load then
      lib.on_load()
    end
  end
  register_events()
end)

script.on_configuration_changed(function(data)
  for k, lib in pairs (libraries) do
    if lib.on_configuration_changed then
      lib.on_configuration_changed(data)
    end
  end
end)

local handler = {}

handler.add_lib = function(lib)
  for k, current in pairs (libraries) do
    if current == lib then
      error("Trying to register same lib twice")
    end
  end
  table.insert(libraries, lib)
end

handler.add_libraries = function(libs)
  for k, lib in pairs (libs) do
    handler.add_lib(lib)
  end
end

return handler