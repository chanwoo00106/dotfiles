local function project_js_formatter(bufnr)
	local filename = vim.api.nvim_buf_get_name(bufnr)
	local dir = vim.fs.dirname(filename)
	local biome_config = vim.fs.find({ "biome.json", "biome.jsonc", ".biome.json", ".biome.jsonc" }, {
		path = dir,
		upward = true,
	})[1]
	local prettier_config = vim.fs.find({
		".prettierrc",
		".prettierrc.json",
		".prettierrc.yml",
		".prettierrc.yaml",
		".prettierrc.json5",
		".prettierrc.js",
		".prettierrc.cjs",
		".prettierrc.mjs",
		"prettier.config.js",
		"prettier.config.cjs",
		"prettier.config.mjs",
	}, {
		path = dir,
		upward = true,
	})[1]

	-- Explicit formatter config nearest to the source file wins.
	if biome_config and (not prettier_config or #biome_config >= #prettier_config) then
		return { "biome" }
	elseif prettier_config then
		return { "prettierd" }
	end

	-- With no formatter config, follow the project's declared tool if possible.
	local package_json = vim.fs.find("package.json", { path = dir, upward = true })[1]
	if package_json then
		local ok, package = pcall(function()
			local file = io.open(package_json, "r")
			if not file then
				return nil
			end
			local contents = file:read("*a")
			file:close()
			return vim.json.decode(contents)
		end)
		if ok and package then
			if package.prettier then
				return { "prettierd" }
			end
			local deps = vim.tbl_extend("force", package.dependencies or {}, package.devDependencies or {})
			if deps["@biomejs/biome"] or deps.biome then
				return { "biome" }
			elseif deps.prettier or deps.prettierd then
				return { "prettierd" }
			end
		end
	end

	-- Last resort for projects that rely on a formatter installed outside npm.
	local conform = require("conform")
	if conform.get_formatter_info("biome", bufnr).available then
		return { "biome" }
	elseif conform.get_formatter_info("prettierd", bufnr).available then
		return { "prettierd" }
	end
	return {}
end

return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			javascript = project_js_formatter,
			typescript = project_js_formatter,
			javascriptreact = project_js_formatter,
			typescriptreact = project_js_formatter,
			css = { "prettierd" },
			json = { "prettierd" },
			html = { "prettierd" },
			python = { "isort" },
		},
		format_on_save = function(bufnr)
			local filetype = vim.bo[bufnr].filetype
			local is_js =
				vim.tbl_contains({ "javascript", "typescript", "javascriptreact", "typescriptreact" }, filetype)
			return {
				-- Keep ts_ls from overriding project formatter rules.
				lsp_fallback = not is_js,
				timeout_ms = 500,
			}
		end,
		notify_on_error = true,
	},
}
