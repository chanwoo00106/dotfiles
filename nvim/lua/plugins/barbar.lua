return {
  { "akinsho/bufferline.nvim", enabled = false },
  {
    "romgrk/barbar.nvim",
    dependencies = {
      "lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
      "nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
    },
    init = function()
      vim.g.barbar_auto_setup = false
    end,
    opts = {
      -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
      -- animation = true,
      -- insert_at_start = true,
      -- …etc.
    },
    keys = {
      {
        "L",
        "<CMD>BufferNext<CR>",
        { desc = "Move next buffer", noremap = true, silent = true },
      },
      {
        "H",
        "<CMD>BufferPrevious<CR>",
        { desc = "Move previous buffer", noremap = true, silent = true },
      },
      {
        "<leader>bo",
        "<CMD>BufferCloseAllButCurrent<CR>",
        { desc = "Remove all buffer", noremap = true, silent = true },
      },
      {
        "<leader>bh",
        "<CMD>BufferMovePrevious<CR>",
        { desc = "Re-order to previous", noremap = true, silent = true },
      },
      {
        "<leader>bl",
        "<CMD>BufferMoveNext<CR>",
        { desc = "Re-order to next", noremap = true, silent = true },
      },
      {
        "<leader>bd",
        "<CMD>BufferClose<CR>",
        { desc = "Remove current buffer", noremap = true, silent = true },
      },
    },
    version = "^1.0.0", -- optional: only update when a new 1.x version is released
  },
}
