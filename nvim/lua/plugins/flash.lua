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
