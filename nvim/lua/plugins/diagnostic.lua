local keymap = vim.keymap

vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	underline = true,
	update_in_insert = true,
	severity_sort = true,
	float = {
		border = "rounded",
		source = true,
	},
})

--------------------------------------------------------------

vim.o.updatetime = 500
vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
	callback = function()
		vim.diagnostic.open_float(nil, { focus = false })
	end,
})

--------------------------------------------------------------

local opts = { silent = true }
opts.desc = "Show line diagnostics"
keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

opts.desc = "Go to next diagnostic"
keymap.set("n", "F", function()
	vim.diagnostic.jump({ count = 1, float = true })
end, opts)

return {}
