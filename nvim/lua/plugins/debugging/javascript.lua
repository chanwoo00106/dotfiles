local M = {}

function M.setup()
	require("dap-vscode-js").setup({
		debugger_path = vim.fn.stdpath("data") .. "/lazy/vscode-js-debug",
		adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" },
	})

	local js_based_languages = { "typescript", "javascript", "typescriptreact" }

	for _, language in ipairs(js_based_languages) do
		require("dap").configurations[language] = {
			{
				type = "pwa-node",
				request = "launch",
				name = "Launch file",
				program = "${file}",
				cwd = "${workspaceFolder}",
			},
			{
				type = "pwa-node",
				request = "attach",
				name = "Attach",
				processId = require("dap.utils").pick_process,
				cwd = "${workspaceFolder}",
			},
			{
				type = "pwa-chrome",
				request = "launch",
				name = 'Start Chrome with "localhost"',
				url = "http://localhost:3000",
				webRoot = "${workspaceFolder}",
				userDataDir = "${workspaceFolder}/.vscode/vscode-chrome-debug-userdatadir",
			},
		}
	end
end

return M
