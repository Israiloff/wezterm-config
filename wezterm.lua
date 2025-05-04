local wezterm = require 'wezterm'
local config = {}

-- Appearance
config.font = wezterm.font 'RobotoMono Nerd Font'
config.font_size = 15
config.line_height = 1.1

config.window_background_opacity = 0.60
config.macos_window_background_blur = 25

config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = "RESIZE"

config.window_padding = {
    left = 20,
    right = 20,
    top = 20,
    bottom = 20,
}

local mux = wezterm.mux

wezterm.on("gui-startup", function(cmd)
  -- Pick the active screen to maximize into, there are also other options, see the docs.
  local active = wezterm.gui.screens().active

  -- Set the window coords on spawn.
  local tab, pane, window = mux.spawn_window(cmd or {
  height = active.height,
  })

  -- You probably don't need both, but you can also set the positions after spawn.
  window:gui_window():set_position(active.x, active.y)
  window:gui_window():set_inner_size(active.width, active.height)
end)

config.background = {
  {
    source = {
      File = 'Users/israiloff/.config/wezterm/images/bg_1.png',
    },
    width = '100%',
    height = '100%',
    repeat_x = 'NoRepeat',
    repeat_y = 'NoRepeat',
    hsb = dimmer,
    opacity = 0.9
  }
}

return config
