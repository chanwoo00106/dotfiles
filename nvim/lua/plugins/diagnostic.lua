return {
	"rachartier/tiny-inline-diagnostic.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
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
				show_all_diags_on_cursorline = true,
				use_icons_from_diagnostic = true,
				multilines = {
					enabled = true,
					always_show = true,
				},
			},
		})

		vim.diagnostic.config({
			signs = {
				active = true,
				text = {
					[vim.diagnostic.severity.ERROR] = " ", -- Example: Error icon
					[vim.diagnostic.severity.WARN] = " ", -- Example: Warning icon
					[vim.diagnostic.severity.HINT] = " ", -- Example: Hint icon
					[vim.diagnostic.severity.INFO] = "", -- Example: Info icon
				},
			},
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
