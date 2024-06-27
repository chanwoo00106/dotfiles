return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	opts = {
		defaults = {
			mode = { "n", "v" },
			["<leader>b"] = { name = "buffer" },
			["<leader>c"] = { name = "code" },
			["<leader>g"] = { name = "git, lsp" },
			["<leader>r"] = { name = "rename" },
			["<leader>s"] = { name = "buffer, telescope, window" },
			["<leader>t"] = { name = "test" },
			["<leader>w"] = { name = "window size" },
		},
	},

	config = function(_, opts)
		local whichkey = require("which-key")

		whichkey.setup(opts)
		whichkey.register(opts.defaults)
	end,
}
