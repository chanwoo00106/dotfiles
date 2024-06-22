return {
	"akinsho/bufferline.nvim",
	event = "VeryLazy",
	version = "*",
	dependencies = { "nvim-tree/nvim-web-devicons", "famiu/bufdelete.nvim" },
	keys = {
		{ "H", "<cmd>BufferLineCyclePrev<cr>" },
		{ "L", "<cmd>BufferLineCycleNext<cr>" },
		{
			"<leader>bd",
			function()
				vim.api.nvim_command("bp|sp|bn|bd")
			end,
		},
		{ "<leader>bo", "<cmd>BufferLineCloseOthers<cr>" },
		{ "<leader>bh", "<cmd>BufferLineMovePrev<cr>", desc = "Move buffer prev" },
		{ "<leader>bl", "<cmd>BufferLineMoveNext<cr>", desc = "Move buffer next" },
	},
	opts = {
		options = {
			mode = "buffers",
			offsets = {
				{
					filetype = "neo-tree",
					text = "Neo-tree",
					highlight = "Directory",
					text_align = "left",
				},
			},
			diagnostics = "nvim_lsp",
			always_show_bufferline = true,
			show_tab_indicators = true,
		},
	},
	config = function(_, opts)
		require("bufferline").setup(opts)
		vim.api.nvim_create_autocmd({ "BufAdd", "BufDelete" }, {
			callback = function()
				vim.schedule(function()
					pcall(nvim_bufferline)
				end)
			end,
		})
	end,
}
