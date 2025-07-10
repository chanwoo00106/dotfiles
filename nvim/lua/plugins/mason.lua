return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
	},
	opts = {
		PATH = "append",
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")

		mason.setup({

			ensure_installed = {
				"clangd",
				"codelldb",
			},
		})
		mason_lspconfig.setup({
			ensure_installed = {
				"ts_ls",
				"lua_ls",
				"html",
				"cssls",
				"tailwindcss",
			},
		})
	end,
}
