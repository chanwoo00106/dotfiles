return {
  { "mg979/vim-visual-multi" },
  {
    "akinsho/toggleterm.nvim",
    keys = {
      { "<C-t>", "<cmd>ToggleTerm<CR>", desc = "toggle terminal" },
    },
    config = function()
      local toggleterm = require("toggleterm")

      toggleterm.setup({
        size = 10,
        open_mapping = "<c-t>",
        hide_numbers = true,
        shade_filetypes = {},
        shade_terminals = true,
        terminal_mappingsj = true,
        shading_factor = 2,
        start_in_insert = true,
        insert_mappings = true,
        persist_size = true,
        direction = "horizontal",
        close_on_exit = true,
        auto_scroll = true,
        shell = vim.o.shell,
      })

      function _G.set_terminal_keymaps()
        local opts = { buffer = 0 }
        vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
        vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
        vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
        vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
        vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
        vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
        vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
      end

      -- if you only want these mappings for toggle term use term://*toggleterm#* instead
      vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
    end,
  },
}
