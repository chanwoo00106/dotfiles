return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",

		-- Js
		"mxsdev/nvim-dap-vscode-js",
		{
			"microsoft/vscode-js-debug",
			version = "1.x",
			build = "npm i && npm run compile vsDebugServerBundle && mv dist out",
		},
	},
	config = function()
		local dap = require("dap")

		dap.adapters.language = function(cb, config)
			if config.request == "attach" then
				cb({ type = "server", port = 9222 })
			else
				if config.request == "launch" then
					cb({ type = "executable", command = "path/to/executable" })
				end
			end
		end

		require("plugins/debugging/ui").setup(dap)
		require("plugins/debugging/javascript").setup()
		require("plugins/debugging/keymaps").setup(dap)
		require("plugins/debugging/icons").setup()
	end,
}
