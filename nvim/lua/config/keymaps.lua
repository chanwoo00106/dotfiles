local map = vim.keymap.set

map("v", ">", ">gv", { noremap = true, silent = true })
map("v", "<", "<gv", { noremap = true, silent = true })

map("n", "<Esc>", ":noh<CR><Esc>", { noremap = true, silent = true })

map("n", "<leader>l", ":Lazy<cr>", { desc = "lazy" })

map("i", "jk", "<ESC>")

map("i", "<C-z>", "")
map("n", "<C-z>", ":undo<CR>")
map("n", "<C-r>", ":redo<CR>")
map("v", "<C-z>", "")

map("n", "ss", ":split<CR><C-w>w", { silent = true })
map("n", "sv", ":vsplit<CR><C-w>w", { silent = true })

map("n", "<C-a>", "gg<S-v>G")

map("v", "<C-w>", "s<></><ESC>hhi<ENTER><ESC>kpI<TAB><ESC>ki")

map("n", "<leader>wh", "<cmd>vertical resize +5<cr>")
map("n", "<leader>wl", "<cmd>vertical resize -5<cr>")
map("n", "<leader>wk", "<cmd>horizontal resize +5<cr>")
map("n", "<leader>wj", "<cmd>horizontal resize -5<cr>")
