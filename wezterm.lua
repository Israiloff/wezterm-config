local wezterm = require("wezterm")
local mux = wezterm.mux
local config = wezterm.config_builder()

config.font = wezterm.font("RobotoMono Nerd Font")
config.font_size = 15
config.line_height = 1.1

config.foreground_text_hsb = {
	hue = 1.0,
	saturation = 1.0,
	brightness = 1.2,
}

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

local dimmer = { brightness = 0.2, saturation = 1.0 }

config.background = {
	{
		source = {
			File = wezterm.home_dir .. "/.config/wezterm/images/bg_1.png",
		},
		width = "100%",
		height = "100%",
		repeat_x = "NoRepeat",
		repeat_y = "NoRepeat",
		hsb = dimmer,
		opacity = 0.8,
	},
}

wezterm.on("gui-startup", function(cmd)
	local active = wezterm.gui.screens().active
	local _, _, window = mux.spawn_window(cmd or {})
	window:gui_window():set_position(active.x, active.y)
	window:gui_window():set_inner_size(active.width, active.height)
end)

return config
