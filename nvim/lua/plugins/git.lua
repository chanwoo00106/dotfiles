return {
  {
    "sindrets/diffview.nvim",
    keys = {
      { "<leader>go", ":DiffviewOpen<CR>", desc = "git Diffview open" },
      { "<leader>gc", ":DiffviewClose<CR>", desc = "git Diffview close" },
    },
  },
  { "akinsho/git-conflict.nvim", version = "*", config = true },
  { "tpope/vim-fugitive" },
}
