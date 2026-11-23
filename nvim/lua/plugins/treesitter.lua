local parsers = {
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
	"markdown_inline",
	"python",
	"vim",
	"vimdoc",
	"gitignore",
	"yaml",
	"prisma",
	"rust",
}

return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		-- Keep the parser install path explicit so it is easy to inspect/change.
		require("nvim-treesitter").setup({
			install_dir = vim.fn.stdpath("data") .. "/site",
		})

		-- Register MDX as Markdown so it uses the Markdown parser and queries.
		vim.filetype.add({ extension = { mdx = "mdx" } })
		vim.treesitter.language.register("markdown", "mdx")

		local function start_treesitter(buf)
			if not vim.api.nvim_buf_is_loaded(buf) then
				return
			end

			local filetype = vim.bo[buf].filetype
			local lang = vim.treesitter.language.get_lang(filetype)
			if not lang then
				return
			end

			local ok, available = pcall(vim.treesitter.language.add, lang)
			if not ok or not available then
				return
			end

			local started, err = pcall(vim.treesitter.start, buf, lang)
			if not started then
				vim.notify(("Tree-sitter highlight failed for %s: %s"):format(filetype, err), vim.log.levels.WARN)
				return
			end

			vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
		end

		local group = vim.api.nvim_create_augroup("TreesitterStart", { clear = true })
		vim.api.nvim_create_autocmd("FileType", {
			group = group,
			callback = function(ev)
				start_treesitter(ev.buf)
			end,
		})

		-- `ensure_installed` was removed on the main branch. Install only the
		-- configured parsers that are missing, then enable them in open buffers.
		local installed = require("nvim-treesitter").get_installed("parsers")
		local installed_lookup = {}
		for _, lang in ipairs(installed) do
			installed_lookup[lang] = true
		end

		local missing = vim.tbl_filter(function(lang)
			return not installed_lookup[lang]
		end, parsers)
		if #missing > 0 then
			require("nvim-treesitter").install(missing):await(function(err)
				if err then
					vim.schedule(function()
						vim.notify("Tree-sitter parser installation failed: " .. tostring(err), vim.log.levels.ERROR)
					end)
					return
				end

				vim.schedule(function()
					for _, buf in ipairs(vim.api.nvim_list_bufs()) do
						start_treesitter(buf)
					end
				end)
			end)
		end

		-- Also handle files whose FileType event ran before this plugin loaded.
		for _, buf in ipairs(vim.api.nvim_list_bufs()) do
			start_treesitter(buf)
		end
	end,
}
