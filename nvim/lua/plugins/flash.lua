return {
	"folke/flash.nvim",
	event = "VeryLazy",
	---@type Flash.Config
	opts = {
		labels = "asdfghjklqwertyuiopzxcvbnm",
		modes = {
			char = {
				keys = {},
			},
		},
		label = {
			rainbow = {
				enabled = true,
				shade = 5,
			},
		},
	},
	enabled = true,
	keys = {
		{
			"s",
			mode = { "n", "x", "o" },
			function()
				require("flash").jump()
			end,
			desc = "Flash",
		},
	},
}
