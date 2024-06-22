return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		"windwp/nvim-ts-autotag",
	},
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	opts = {
		highlight = {
			enable = true,
		},
		indent = { enable = true },
		autotag = {
			enable = true,
		},
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
