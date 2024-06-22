local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

package.loaded["lazyvim.config.options"] = true

require("config.globals")
require("config.options")
require("config.keymaps")

require("lazy").setup("plugins", {
	install = {
		colorscheme = { "tokyonight" },
	},
})
