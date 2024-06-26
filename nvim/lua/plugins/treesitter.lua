return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPost", "BufWritePost", "BufNewFile", "VeryLazy" },
	build = ":TSUpdate",
	opts = {
		highlight = {
			enable = true,
		},
		indent = { enable = true },
		auto_install = true,
		sync_install = true,
		ignore_install = {},
		ensure_installed = {
			"bash",
			"cpp",
			"css",
			"dockerfile",
			"go",
			"graphql",
			"html",
			"javascript",
			"typescript",
			"tsx",
			"json",
			"lua",
			"markdown",
			"python",
			"markdown_inline",
			"vim",
			"vimdoc",
			"gitignore",
			"yaml",
			"prisma",
			"rust",
		},
	},
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)

		vim.filetype.add({
			extension = {
				mdx = "mdx",
			},
		})
		vim.treesitter.language.register("markdown", "mdx")
	end,
}
