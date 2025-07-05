return {
  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "f", "<CMD>Oil<CR>", { desc = "Open parent directory" } },
    },
    opts = {
      view_options = {
        show_hidden = true,
      },
      keymaps = {
        ["<C-h>"] = "<Cmd>wincmd h<CR>",
        ["<C-l>"] = "<cmd>TmuxNavigateRight<cr>",
        ["H"] = "actions.select_split",
      },
      win_options = {
        signcolumn = "yes:2",
      },
    },
    config = function(_, opts)
      require("oil").setup(opts)
    end,
  },
  {
    "refractalize/oil-git-status.nvim",
    dependencies = {
      "stevearc/oil.nvim",
    },
    config = false,
  },
}
