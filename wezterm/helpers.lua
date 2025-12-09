local wezterm = require("wezterm")

local module = {}

function module.apply_to_config(config)
	config.color_scheme = "Catppuccin Macchiato"
	config.window_background_opacity = 0.9
	config.window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	}

	-- font
	config.font_size = 14
	config.font = wezterm.font_with_fallback({
		"FiraCode Nerd Font",
		{ family = "Pretendard Variable", weight = "Bold" },
	})
	-- 한글 폰트가 그나마 나아졌네요

	-- window size
	config.initial_rows = 24
	config.initial_cols = 100
end

return module
