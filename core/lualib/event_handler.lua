
local libraries = {}

local setup_ran = false

local register_remote_interfaces = function()
  --Sometimes, in special cases, on_init and on_load can be run at the same time. Only register events once in this case.
  if setup_ran then return end
  setup_ran = true

  for lib_name, lib in pairs (libraries) do
    if lib.add_remote_interface then
      lib.add_remote_interface()
    end

    if lib.add_commands then
      lib.add_commands()
    end
  end
end

local event_name = function(eventid)
  for name,id in pairs(defines.events) do
    if id == eventid then
      return name
    end
  end
  return tostring(eventid)
end

local check_handler = function(id, handler, oldhandler)
  if oldhandler then
    local oldinfo = debug.getinfo(oldhandler, "S")
    local newinfo = debug.getinfo(handler, "S")
    log(string.format("duplicate handlers within module for event %s: first defined at %s:%d, replaced by redefinition at %s:%d", 
      event_name(id), oldinfo.short_src, oldinfo.linedefined, newinfo.short_src, newinfo.linedefined))
  end
end

local register_events = function()
  local all_events = {}
  local on_nth_tick = {}

  for lib_name, lib in pairs (libraries) do

    if lib.events then
      for k, handler in pairs (lib.events) do
        -- if different modules refer to the same event different ways 
        -- (string, defines, CustomEvent/CustomInput protos), unify them to ids for registration...
        local id = script.get_event_id(k)
        all_events[id] = all_events[id] or {}

        -- if a *single* module refers to the same event different ways, error...
        local oldhandler = all_events[id][lib_name]
        check_handler(id, handler, oldhandler)
        all_events[id][lib_name] = handler
      end
    end

    if lib.on_nth_tick then
      for n, handler in pairs (lib.on_nth_tick) do
        on_nth_tick[n] = on_nth_tick[n] or {}
        on_nth_tick[n][lib_name] = handler
      end
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
  register_remote_interfaces()
  register_events()
  for k, lib in pairs (libraries) do
    if lib.on_init then
      lib.on_init()
    end
  end
end)

script.on_load(function()
  register_remote_interfaces()
  register_events()
  for k, lib in pairs (libraries) do
    if lib.on_load then
      lib.on_load()
    end
  end
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