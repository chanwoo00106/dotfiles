local Util = require("lazyvim.util")

local map = Util.safe_keymap_set

map("i", "jk", "<ESC>")

map("n", "<C-z>", ":undo<CR>")
map("n", "<C-r>", ":redo<CR>")

map("n", "ss", ":split<CR><C-w>w", { silent = true })
map("n", "sv", ":vsplit<CR><C-w>w", { silent = true })

map("n", "<C-a>", "gg<S-v>G")

map("v", '"', 's""<ESC>P')
map("v", "'", "s''<ESC>P")
map("v", "`", "s``<ESC>P")
map("v", "{", "s{}<ESC>P")
map("v", "(", "s()<ESC>P")
map("v", "[", "s[]<ESC>P")
map("v", "<C-w>", "s<></><ESC>hhi<ENTER><ESC>kpI<TAB><ESC>ki")
