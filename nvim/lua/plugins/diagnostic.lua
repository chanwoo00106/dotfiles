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
				text = {
					[vim.diagnostic.severity.ERROR] = " ",
					[vim.diagnostic.severity.WARN] = " ",
					[vim.diagnostic.severity.HINT] = " ",
					[vim.diagnostic.severity.INFO] = "",
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
