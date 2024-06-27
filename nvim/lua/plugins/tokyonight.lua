return {
	"folke/tokyonight.nvim",
	lazy = false,
	enabled = false,
	priority = 1000,
	opts = {
		style = "moon",
	},
	init = function()
		vim.cmd([[colorscheme tokyonight]])
	end,
}
