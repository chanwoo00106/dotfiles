local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("v", "J", ":m '>+1<CR>gv=gv", opts)
map("v", "K", ":m '<-2<CR>gv=gv", opts)

map("v", ">", ">gv", opts)
map("v", "<", "<gv", opts)

map("n", "<Esc>", ":noh<CR><Esc>", opts)

map("n", "<leader>l", ":Lazy<cr>", opts)

map("i", "jk", "<ESC>")
map("i", "Jk", "<ESC>")

map("i", "<C-z>", "")
map("n", "<C-z>", ":undo<CR>", opts)
map("n", "<C-r>", ":redo<CR>", opts)
map("v", "<C-z>", "")

map("n", "<leader>ss", ":split<CR><C-w>w", opts)
map("n", "<leader>sv", ":vsplit<CR><C-w>w", opts)

map("n", "<C-a>", "gg<S-v>G", opts)

map("v", "<C-w>", "s<></><ESC>hhi<ENTER><ESC>kpI<TAB><ESC>ki", opts)

map("n", "<leader>wh", "<cmd>vertical resize +5<cr>", opts)
map("n", "<leader>wl", "<cmd>vertical resize -5<cr>", opts)
map("n", "<leader>wk", "<cmd>horizontal resize +5<cr>", opts)
map("n", "<leader>wj", "<cmd>horizontal resize -5<cr>", opts)

-- debug keymaps
map("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>",
  { desc = "Add breakpoint at line", noremap = true, silent = true })
map("n", "<leader>dr", "<cmd> DapContinue <CR>",
  { desc = "Start or continue the debugger", noremap = true, silent = true })

-- toggle term
map('t', '<esc>', [[<C-\><C-n>]], opts)
map('t', 'jk', [[<C-\><C-n>]], opts)
map('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
map('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
map('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
map('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
map('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
