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

map("v", '"', 's""<ESC>P')
map("v", "'", "s''<ESC>P")
map("v", "`", "s``<ESC>P")
map("v", "{", "s{}<ESC>P")
map("v", "(", "s()<ESC>P")
map("v", "[", "s[]<ESC>P")
map("v", "<C-w>", "s<></><ESC>hhi<ENTER><ESC>kpI<TAB><ESC>ki")

map("n", "t", function()
  require("neo-tree.command").execute({ toggle = true, dir = Util.root() })
end, {
  desc = "Explorer NeoTree (root dir)",
})

map("n", "F", support.diagnostic_goto(true), { desc = "Next Diagnostic", noremap = true, silent = true })
map("n", "E", support.diagnostic_goto(true, "ERROR"), { desc = "Next Diagnostic", noremap = true, silent = true })
