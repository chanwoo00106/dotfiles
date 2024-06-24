local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("v", ">", ">gv", opts)
map("v", "<", "<gv", opts)

map("n", "<Esc>", ":noh<CR><Esc>", opts)

map("n", "<leader>l", ":Lazy<cr>", opts)

map("i", "jk", "<ESC>")

map("i", "<C-z>", "")
map("n", "<C-z>", ":undo<CR>", opts)
map("n", "<C-r>", ":redo<CR>", opts)
map("v", "<C-z>", "")

map("n", "ss", ":split<CR><C-w>w", opts)
map("n", "sv", ":vsplit<CR><C-w>w", opts)

map("n", "<C-a>", "gg<S-v>G", opts)

map("v", "<C-w>", "s<></><ESC>hhi<ENTER><ESC>kpI<TAB><ESC>ki", opts)

map("n", "<leader>wh", "<cmd>vertical resize +5<cr>", opts)
map("n", "<leader>wl", "<cmd>vertical resize -5<cr>", opts)
map("n", "<leader>wk", "<cmd>horizontal resize +5<cr>", opts)
map("n", "<leader>wj", "<cmd>horizontal resize -5<cr>", opts)
