return {
  {
    "vhyrro/luarocks.nvim",
    priority = 1000,
    config = true,
  },
  {
    "nvim-neorg/neorg",
    dependencies = { "luarocks.nvim" },
    lazy = false,
    version = "*",
    config = function()
      require("neorg").setup({
        load = {
          ["core.defaults"] = {},
          ["core.concealer"] = {},
          ["core.clipboard.code-blocks"] = {},
          ["core.qol.todo_items"] = {},
          ["core.integrations.treesitter"] = {},
          ["core.integrations.nvim-cmp"] = {},
          ["core.dirman"] = {
            config = {
              workspaces = {
                my_ws = "~/neorg",
                my_other_notes = "~/work/notes",
              },
              index = "index.norg",
            },
          },
        },
      })
    end,
  },
}
