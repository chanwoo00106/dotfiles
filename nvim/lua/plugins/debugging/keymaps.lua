local M = {}

function M.setup(dap)
	vim.keymap.set("n", "<leader>dc", function()
		dap.continue()
	end)
	vim.keymap.set("n", "<leader>dn", function()
		dap.step_over()
	end)
	vim.keymap.set("n", "<leader>di", function()
		dap.step_into()
	end)
	vim.keymap.set("n", "<leader>de", function()
		dap.step_out()
	end)
	vim.keymap.set("n", "<leader>dt", function()
		dap.toggle_breakpoint()
	end)
end

return M
