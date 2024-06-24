local icons = require("config.icons")

local M = {}

function M.setup()
	for name, sign in pairs(icons.dap) do
		sign = type(sign) == "table" and sign or { sign }
		vim.fn.sign_define(
			"Dap" .. name,
			{ text = sign[1], texthl = sign[2] or "DiagnosticInfo", linehl = sign[3], numhl = sign[3] }
		)
	end
end

return M
