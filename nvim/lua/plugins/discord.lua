return {
	{
		"vyfor/cord.nvim",
		build = ":Cord update",
		event = "VeryLazy",
		opts = {
			usercmds = true,
			timer = {
				enable = true,
				interval = 1500,
				reset_on_idle = false,
				reset_on_change = false,
			},
			editor = {
				image = nil,
				client = "neovim",
				tooltip = "The best text editor in the world",
			},
			display = {
				show_time = true,
				show_repository = true,
				show_cursor_position = true,
				swap_fields = true,
				workspace_blacklist = {},
			},
			lsp = {
				show_problem_count = false,
				severity = 1,
				scope = "workspace",
			},
			idle = {
				show_idle = true,
				timeout = 300000,
				disable_on_focus = true,
				text = "Idle",
				tooltip = "💤",
			},
			text = {
				viewing = "Viewing codes", -- Text to display when viewing a readonly file
				editing = "Editing codes",
				file_browser = "Browsing files", -- Text to display when browsing files (Empty string to disable)
				plugin_manager = "Managing plugins", -- Text to display when managing plugins (Empty string to disable)
				workspace = "In secret project",
			},
			buttons = {
				{
					label = "View dotfiles",
					url = "https://github.com/chanwoo00106/dotfiles",
				},
			},
		},
	},
}
