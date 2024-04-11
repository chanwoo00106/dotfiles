return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = false,
  },
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup({})

      local function open_nvim_tree()
        require("nvim-tree.api").tree.open()
      end
      vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
    end,
  },
}
