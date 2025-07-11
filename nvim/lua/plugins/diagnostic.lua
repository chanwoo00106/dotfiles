return {
	"rachartier/tiny-inline-diagnostic.nvim",
	event = "VeryLazy",
	priority = 1000,
	keys = {
		{ "<leader>dd", vim.diagnostic.open_float, desc = "Show line diagnostics" },
		{
			"F",
			function()
				vim.diagnostic.jump({ count = 1, float = true })
			end,
			desc = "Go to next diagnostic",
		},
	},
	config = function()
		require("tiny-inline-diagnostic").setup({
			options = {
				multilines = {
					enabled = true,
					always_show = true,
				},
			},
		})

		vim.diagnostic.config({
			-- virtual_text = true,
			signs = true,
			underline = true,
			update_in_insert = true,
			severity_sort = true,
			float = {
				border = "rounded",
				source = true,
			},
		})
	end,
}
