local Util = require("lazyvim.util")
local support = require("config.support")

local map = Util.safe_keymap_set

map("i", "jk", "<ESC>")

map("i", "<C-z>", "")
map("n", "<C-z>", ":undo<CR>")
map("n", "<C-r>", ":redo<CR>")
map("v", "<C-z>", "")

map("n", "ss", ":split<CR><C-w>w", { silent = true })
map("n", "sv", ":vsplit<CR><C-w>w", { silent = true })

map("n", "<C-a>", "gg<S-v>G")

map("v", "<C-w>", "s<></><ESC>hhi<ENTER><ESC>kpI<TAB><ESC>ki")

map("n", "F", support.diagnostic_goto(true), { desc = "Next Diagnostic", noremap = true, silent = true })
map("n", "E", support.diagnostic_goto(true, "ERROR"), { desc = "Next Diagnostic", noremap = true, silent = true })

map("n", "t", "<cmd>Neotree<CR>", { desc = "Toggle file tree", noremap = true, silent = true })

map("n", "f", "<CMD>Oil<CR>", { desc = "Open parent directory" })
map("n", "<leader>wh", "<cmd>vertical resize +5<cr>")
map("n", "<leader>wl", "<cmd>vertical resize -5<cr>")
map("n", "<leader>wk", "<cmd>horizontal resize +5<cr>")
map("n", "<leader>wj", "<cmd>horizontal resize -5<cr>")
