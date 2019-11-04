data:extend(
{
  {
    type = "shortcut",
    name = "undo",
    order = "b[blueprints]-a[undo]",
    action = "undo",
    localised_name = {"shortcut.undo"},
    associated_control_input = "undo",
    technology_to_unlock = "construction-robotics",
    icon =
    {
      filename = "__base__/graphics/icons/shortcut-toolbar/mip/undo-x32.png",
      priority = "extra-high-no-scale",
      size = 32,
      scale = 0.5,
      mipmap_count = 2,
      flags = {"gui-icon"}
    },
    small_icon =
    {
      filename = "__base__/graphics/icons/shortcut-toolbar/mip/undo-x24.png",
      priority = "extra-high-no-scale",
      size = 24,
      scale = 0.5,
      mipmap_count = 2,
      flags = {"gui-icon"}
    },
    disabled_icon =
    {
      filename = "__base__/graphics/icons/shortcut-toolbar/mip/undo-x32-white.png",
      priority = "extra-high-no-scale",
      size = 32,
      scale = 0.5,
      mipmap_count = 2,
      flags = {"gui-icon"}
    },
    disabled_small_icon =
    {
      filename = "__base__/graphics/icons/shortcut-toolbar/mip/undo-x24-white.png",
      priority = "extra-high-no-scale",
      size = 24,
      scale = 0.5,
      mipmap_count = 2,
      flags = {"gui-icon"}
    },
  },
  {
    type = "shortcut",
    name = "copy",
    order = "b[blueprints]-b[copy]",
    action = "copy",
    localised_name = {"shortcut.copy"},
    associated_control_input = "copy",
    technology_to_unlock = "construction-robotics",
    icon =
    {
      filename = "__base__/graphics/icons/shortcut-toolbar/mip/copy-x32.png",
      priority = "extra-high-no-scale",
      size = 32,
      scale = 0.5,
      mipmap_count = 2,
      flags = {"gui-icon"}
    },
    small_icon =
    {
      filename = "__base__/graphics/icons/shortcut-toolbar/mip/copy-x24.png",
      priority = "extra-high-no-scale",
      size = 24,
      scale = 0.5,
      mipmap_count = 2,
      flags = {"gui-icon"}
    },
    disabled_small_icon =
    {
      filename = "__base__/graphics/icons/shortcut-toolbar/mip/copy-x24-white.png",
      priority = "extra-high-no-scale",
      size = 24,
      scale = 0.5,
      mipmap_count = 2,
      flags = {"gui-icon"}
    }
  },
  {
    type = "shortcut",
    name = "cut",
    order = "b[blueprints]-c[cut]",
    action = "cut",
    localised_name = {"shortcut.cut"},
    associated_control_input = "cut",
    technology_to_unlock = "construction-robotics",
    icon =
    {
      filename = "__base__/graphics/icons/shortcut-toolbar/mip/cut-x32.png",
      priority = "extra-high-no-scale",
      size = 32,
      scale = 0.5,
      mipmap_count = 0.5,
      flags = {"gui-icon"}
    },
    small_icon =
    {
      filename = "__base__/graphics/icons/shortcut-toolbar/mip/cut-x24.png",
      priority = "extra-high-no-scale",
      size = 24,
      scale = 0.5,
      mipmap_count = 2,
      flags = {"gui-icon"}
    },
    disabled_small_icon =
    {
      filename = "__base__/graphics/icons/shortcut-toolbar/mip/cut-x24-white.png",
      priority = "extra-high-no-scale",
      size = 24,
      scale = 0.5,
      mipmap_count = 2,
      flags = {"gui-icon"}
    },
  },
  {
    type = "shortcut",
    name = "paste",
    order = "b[blueprints]-c[paste]",
    action = "paste",
    localised_name = {"shortcut.paste"},
    associated_control_input = "paste",
    technology_to_unlock = "construction-robotics",
    icon =
    {
      filename = "__base__/graphics/icons/shortcut-toolbar/mip/paste-x32.png",
      priority = "extra-high-no-scale",
      size = 32,
      scale = 0.5,
      mipmap_count = 2,
      flags = {"gui-icon"}
    },
    small_icon =
    {
      filename = "__base__/graphics/icons/shortcut-toolbar/mip/paste-x24.png",
      priority = "extra-high-no-scale",
      size = 24,
      scale = 0.5,
      mipmap_count = 2,
      flags = {"gui-icon"}
    },
    disabled_small_icon =
    {
      filename = "__base__/graphics/icons/shortcut-toolbar/mip/paste-x24-white.png",
      priority = "extra-high-no-scale",
      size = 24,
      scale = 0.5,
      mipmap_count = 2,
      flags = {"gui-icon"}
    },
  },
  {
    type = "shortcut",
    name = "import-string",
    order = "b[blueprints]-d[import]",
    action = "import-string",
    localised_name = {"shortcut.import-string"},
    technology_to_unlock = "construction-robotics",
    icon =
    {
      filename = "__base__/graphics/icons/shortcut-toolbar/mip/import-string-x32.png",
      priority = "extra-high-no-scale",
      size = 32,
      scale = 0.5,
      mipmap_count = 2,
      flags = {"gui-icon"}
    },
    small_icon =
    {
      filename = "__base__/graphics/icons/shortcut-toolbar/mip/import-string-x24.png",
      priority = "extra-high-no-scale",
      size = 24,
      scale = 0.5,
      mipmap_count = 2,
      flags = {"gui-icon"}
    },
    disabled_small_icon =
    {
      filename = "__base__/graphics/icons/shortcut-toolbar/mip/import-string-x24-white.png",
      priority = "extra-high-no-scale",
      size = 24,
      scale = 0.5,
      mipmap_count = 2,
      flags = {"gui-icon"}
    },
  },
  {
    type = "shortcut",
    name = "give-blueprint",
    order = "b[blueprints]-e[blueprint]",
    action = "create-blueprint-item",
    localised_name = {"shortcut.make-blueprint"},
    associated_control_input = "give-blueprint",
    technology_to_unlock = "construction-robotics",
    item_to_create = "blueprint",
    style = "blue",
    icon =
    {
      filename = "__base__/graphics/icons/shortcut-toolbar/mip/new-blueprint-x32-white.png",
      priority = "extra-high-no-scale",
      size = 32,
      scale = 0.5,
      mipmap_count = 2,
      flags = {"gui-icon"}
    },
    small_icon =
    {
      filename = "__base__/graphics/icons/shortcut-toolbar/mip/new-blueprint-x24.png",
      priority = "extra-high-no-scale",
      size = 24,
      scale = 0.5,
      mipmap_count = 2,
      flags = {"gui-icon"}
    },
    disabled_small_icon =
    {
      filename = "__base__/graphics/icons/shortcut-toolbar/mip/new-blueprint-x24-white.png",
      priority = "extra-high-no-scale",
      size = 24,
      scale = 0.5,
      mipmap_count = 2,
      flags = {"gui-icon"}
    },
  },
  {
    type = "shortcut",
    name = "give-blueprint-book",
    order = "b[blueprints]-f[book]",
    action = "create-blueprint-item",
    localised_name = {"shortcut.make-blueprint-book"},
    associated_control_input = "give-blueprint-book",
    technology_to_unlock = "construction-robotics",
    item_to_create = "blueprint-book",
    style = "blue",
    icon =
    {
      filename = "__base__/graphics/icons/shortcut-toolbar/mip/new-blueprint-book-x32-white.png",
      priority = "extra-high-no-scale",
      size = 32,
      scale = 0.5,
      mipmap_count = 2,
      flags = {"gui-icon"}
    },
    small_icon =
    {
      filename = "__base__/graphics/icons/shortcut-toolbar/mip/new-blueprint-book-x24.png",
      priority = "extra-high-no-scale",
      size = 24,
      scale = 0.5,
      mipmap_count = 2,
      flags = {"gui-icon"}
    },
    disabled_small_icon =
    {
      filename = "__base__/graphics/icons/shortcut-toolbar/mip/new-blueprint-book-x24-white.png",
      priority = "extra-high-no-scale",
      size = 24,
      scale = 0.5,
      mipmap_count = 2,
      flags = {"gui-icon"}
    },
  },
  {
    type = "shortcut",
    name = "give-deconstruction-planner",
    order = "b[blueprints]-g[deconstruction-planner]",
    action = "create-blueprint-item",
    localised_name = {"shortcut.make-deconstruction-planner"},
    associated_control_input = "give-deconstruction-planner",
    technology_to_unlock = "construction-robotics",
    item_to_create = "deconstruction-planner",
    style = "red",
    icon =
    {
      filename = "__base__/graphics/icons/shortcut-toolbar/mip/new-deconstruction-planner-x32-white.png",
      priority = "extra-high-no-scale",
      size = 32,
      scale = 0.5,
      mipmap_count = 2,
      flags = {"gui-icon"}
    },
    small_icon =
    {
      filename = "__base__/graphics/icons/shortcut-toolbar/mip/new-deconstruction-planner-x24.png",
      priority = "extra-high-no-scale",
      size = 24,
      scale = 0.5,
      mipmap_count = 2,
      flags = {"gui-icon"}
    },
    disabled_small_icon =
    {
      filename = "__base__/graphics/icons/shortcut-toolbar/mip/new-deconstruction-planner-x24-white.png",
      priority = "extra-high-no-scale",
      size = 24,
      scale = 0.5,
      mipmap_count = 2,
      flags = {"gui-icon"}
    },
  },
  {
    type = "shortcut",
    name = "give-upgrade-planner",
    order = "b[blueprints]-h[upgrade-planner]",
    action = "create-blueprint-item",
    localised_name = {"shortcut.make-upgrade-planner"},
    associated_control_input = "give-upgrade-planner",
    technology_to_unlock = "construction-robotics",
    item_to_create = "upgrade-planner",
    style = "green",
    icon =
    {
      filename = "__base__/graphics/icons/shortcut-toolbar/mip/new-upgrade-planner-x32-white.png",
      priority = "extra-high-no-scale",
      size = 32,
      scale = 0.5,
      mipmap_count = 2,
      flags = {"gui-icon"}
    },
    small_icon =
    {
      filename = "__base__/graphics/icons/shortcut-toolbar/mip/new-upgrade-planner-x24.png",
      priority = "extra-high-no-scale",
      size = 24,
      scale = 0.5,
      mipmap_count = 2,
      flags = {"gui-icon"}
    },
    disabled_small_icon =
    {
      filename = "__base__/graphics/icons/shortcut-toolbar/mip/new-upgrade-planner-x24-white.png",
      priority = "extra-high-no-scale",
      size = 24,
      scale = 0.5,
      mipmap_count = 2,
      flags = {"gui-icon"}
    },
  },
  {
    type = "shortcut",
    name = "toggle-personal-roboport",
    order = "c[toggles]-a[roboport]",
    action = "toggle-personal-roboport",
    localised_name = {"shortcut.toggle-personal-roboport"},
    associated_control_input = "toggle-personal-roboport",
    technology_to_unlock = "personal-roboport-equipment",
    icon =
    {
      filename = "__base__/graphics/icons/shortcut-toolbar/mip/toggle-personal-roboport-x32.png",
      priority = "extra-high-no-scale",
      size = 32,
      scale = 0.5,
      mipmap_count = 2,
      flags = {"gui-icon"}
    },
    small_icon =
    {
      filename = "__base__/graphics/icons/shortcut-toolbar/mip/toggle-personal-roboport-x24.png",
      priority = "extra-high-no-scale",
      size = 24,
      scale = 0.5,
      mipmap_count = 2,
      flags = {"gui-icon"}
    },
    disabled_icon =
    {
      filename = "__base__/graphics/icons/shortcut-toolbar/mip/toggle-personal-roboport-x32-white.png",
      priority = "extra-high-no-scale",
      size = 32,
      scale = 0.5,
      mipmap_count = 2,
      flags = {"gui-icon"}
    },
    disabled_small_icon =
    {
      filename = "__base__/graphics/icons/shortcut-toolbar/mip/toggle-personal-roboport-x24-white.png",
      priority = "extra-high-no-scale",
      size = 24,
      scale = 0.5,
      mipmap_count = 2,
      flags = {"gui-icon"}
    },
  },
  {
    type = "shortcut",
    name = "toggle-equipment-movement-bonus",
    order = "c[toggles]-b[exoskeleton]",
    action = "toggle-equipment-movement-bonus",
    localised_name = {"shortcut.toggle-equipment-movement-bonus"},
    associated_control_input = "toggle-equipment-movement-bonus",
    technology_to_unlock = "exoskeleton-equipment",
    icon =
    {
      filename = "__base__/graphics/icons/shortcut-toolbar/mip/toggle-exoskeleton-x32.png",
      priority = "extra-high-no-scale",
      size = 32,
      scale = 0.5,
      mipmap_count = 2,
      flags = {"gui-icon"}
    },
    small_icon =
    {
      filename = "__base__/graphics/icons/shortcut-toolbar/mip/toggle-exoskeleton-x24.png",
      priority = "extra-high-no-scale",
      size = 24,
      scale = 0.5,
      mipmap_count = 2,
      flags = {"gui-icon"}
    },
    disabled_icon =
    {
      filename = "__base__/graphics/icons/shortcut-toolbar/mip/toggle-exoskeleton-x32-white.png",
      priority = "extra-high-no-scale",
      size = 32,
      scale = 0.5,
      mipmap_count = 2,
      flags = {"gui-icon"}
    },
    disabled_small_icon =
    {
      filename = "__base__/graphics/icons/shortcut-toolbar/mip/toggle-exoskeleton-x24-white.png",
      priority = "extra-high-no-scale",
      size = 24,
      scale = 0.5,
      mipmap_count = 2,
      flags = {"gui-icon"}
    },
  },

  -- Custom shortcut can be defined as follows:
  -- {
  --   type = "shortcut",
  --   name = "shortcut-name",
  --   action = "lua",
  --   toggleable = true, -- whether or not the shortcut button is a toggle button or not
  --   order, localised_name, technology_to_unlock, icon, small_icon, disabled_icon, disabled_small_icon as above
  -- }
})
