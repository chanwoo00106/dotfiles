return {
  { "mg979/vim-visual-multi" },
  {
    "s1n7ax/nvim-window-picker",
    name = "window-picker",
    event = "VeryLazy",
    version = "2.*",
    config = function()
      require("window-picker").setup()
    end,
  },
  {
    "dmmulroy/ts-error-translator.nvim",
    config = function()
      vim.lsp.handlers["textDocument/publishDiagnostics"] = function(err, result, ctx, config)
        require("ts-error-translator").translate_diagnostics(err, result, ctx, config)
        vim.lsp.diagnostic.on_publish_diagnostics(err, result, ctx, config)
      end
    end,
  },
  {
    "folke/twilight.nvim",
    keys = {
      { "<leader>et", "<cmd>Twilight<CR>", desc = "toggle twilight" },
    },
  },
}
