return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    { "<leader><leader>", "<cmd>Telescope find_files<cr>",           desc = "find files" },
    { "<leader>sg",       "<cmd>Telescope live_grep<cr>",            desc = "live grep" },
    { "<leader>sb",       "<cmd>Telescope buffers<cr>",              desc = "buffers" },
    { "<leader>cr",       "<cmd>Telescope lsp_references<cr>",       desc = "Show LSP references" },

    { "gd",               "<cmd>Telescope lsp_definitions<cr>",      desc = "show lsp definitions" },
    { "gr",               "<cmd>Telescope lsp_references<cr>",       desc = "show lsp references" },
    { "<leader>gi",       "<cmd>Telescope lsp_implementations<cr>",  desc = "show lsp implementations" },
    { "<leader>gt",       "<cmd>Telescope lsp_type_definitions<cr>", desc = "show lsp type definitions" },
    { "<leader>D",        "<cmd>Telescope diagnostics bufnr=0<CR>",  desc = "Show buffer diagnostics" },
  },
}
