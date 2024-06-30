local wezterm = require("wezterm")

local module = {}

function module.apply_to_config(config)
	config.font = wezterm.font("FiraCode Nerd Font")
	config.color_scheme = "Catppuccin Macchiato"
	config.window_background_opacity = 0.9
	config.font_size = 14
	config.window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	}

	-- window size
	config.initial_rows = 24
	config.initial_cols = 100
end

-- return our module table
return module
