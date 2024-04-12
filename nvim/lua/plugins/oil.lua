return {
  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      view_options = {
        show_hidden = true,
      },
      keymaps = {
        ["<C-h>"] = "<Cmd>wincmd h<CR>",
        ["H"] = "actions.select_split",
      },
    },
    config = function(_, opts)
      require("oil").setup(opts)
    end,
  },
}
