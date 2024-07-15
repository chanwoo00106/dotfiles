return {
	"folke/which-key.nvim",
	dependencies = "echasnovski/mini.icons",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	opts = {
		defaults = {
			mode = { "n", "v" },
			{ "<leader>b", group = "buffer" },
			{ "<leader>c", group = "code" },
			{ "<leader>g", group = "git, lsp" },
			{ "<leader>r", group = "rename" },
			{ "<leader>s", group = "buffer, telescope, window" },
			{ "<leader>t", group = "test" },
			{ "<leader>w", group = "window size" },
		},
	},

	config = function(_, opts)
		local whichkey = require("which-key")

		whichkey.setup(opts)
	end,
}
