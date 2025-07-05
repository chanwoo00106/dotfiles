return {
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons", "famiu/bufdelete.nvim" },
    keys = {
      { "H",          "<cmd>BufferLineCyclePrev<cr>" },
      { "L",          "<cmd>BufferLineCycleNext<cr>" },
      { "<leader>bo", "<cmd>BufferLineCloseOthers<cr>" },
      { "<leader>bh", "<cmd>BufferLineMovePrev<cr>",   desc = "Move buffer prev" },
      { "<leader>bl", "<cmd>BufferLineMoveNext<cr>",   desc = "Move buffer next" },
    },
    opts = {
      options = {
        mode = "buffers",
        offsets = {
          {
            filetype = "neo-tree",
            text = "Neo-tree",
            highlight = "Directory",
            text_align = "left",
          },
        },
        diagnostics = "nvim_lsp",
        always_show_bufferline = true,
        show_tab_indicators = true,
      },
    },
    config = function(_, opts)
      require("bufferline").setup(opts)

      vim.api.nvim_create_autocmd("User", {
        pattern = "NeoTreeFileDeleted",
        callback = function(event)
          local deleted_file = event.file
          for _, buf in ipairs(vim.api.nvim_list_bufs()) do
            if vim.api.nvim_buf_get_name(buf) == deleted_file then
              vim.api.nvim_buf_delete(buf, { force = true })
            end
          end
        end,
      })
    end,
  },
  {
    "echasnovski/mini.bufremove",
    config = function()
      vim.keymap.set('n', '<leader>bd', function()
        require('mini.bufremove').delete(0, false)
      end, { desc = "Delete Buffer" })
    end
  }
}
