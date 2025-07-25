return {
	"yetone/avante.nvim",
	event = "VeryLazy",
	build = function()
		if vim.fn.has("win32") == 1 then
			return "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
		else
			return "make"
		end
	end,
	version = false,
	opts = {
		provider = "gemini",
		providers = {
			gemini = {
				endpoint = "https://generativelanguage.googleapis.com/v1beta/models",
				model = "gemini-2.5-flash",
				timeout = 30000,
				temperature = 0,
				max_tokens = 8192,
			},
		},
		system_prompt = "You are a helpful AI assistant. Always respond in Korean. Please try to avoid using `pnpm dev`.",
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"stevearc/dressing.nvim",
		{
			"MeanderingProgrammer/render-markdown.nvim",
			opts = {
				file_types = { "markdown", "Avante" },
			},
			ft = { "markdown", "Avante" },
		},
	},
}
