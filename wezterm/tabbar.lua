local module = {}

function module.apply_to_config(config)
	config.enable_tab_bar = false
	config.window_decorations = "NONE"
end

return module
