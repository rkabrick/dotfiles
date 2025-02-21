-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = "tokyonight_moon"

config.font = wezterm.font("VictorMono Nerd Font Propo")

--config
-- Window Decorations / Tab Bar (Remove extra garbage)
-- Need "RESIZE" to allow yabai to tile this
config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = true

config.adjust_window_size_when_changing_font_size = false

-- config.window_background_opacity = 0.95 -- personal recommended value
-- The filled in variant of the < symbol
--local SOLID_LEFT_ARROW = wezterm.nerdfonts.pl_right_hard_divider
--k

-- The filled in variant of the > symbol
--local SOLID_RIGHT_ARROW = wezterm.nerdfonts.pl_left_hard_divider

-- KEYBINDINGS
local act = wezterm.action

config.keys = {

	-- Choose tabs
	{
		key = "t",
		mods = "CMD|SHIFT",
		action = act.ShowTabNavigator,
	},
}

config.mouse_bindings = {
	{
		event = { Down = { streak = 3, button = "Left" } },
		action = wezterm.action.SelectTextAtMouseCursor("SemanticZone"),
		mods = "NONE",
	},
	-- Ctrl-click will open the link under the mouse cursor
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "CMD",
		action = wezterm.action.OpenLinkAtMouseCursor,
	},
}

-- and finally, return the configuration to wezterm
return config
