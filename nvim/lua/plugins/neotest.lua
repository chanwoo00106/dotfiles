return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "marilari88/neotest-vitest",
    "nvim-neotest/neotest-jest",
  },
  keys = {
    {
      "<leader>tr",
      function()
        require("neotest").run.run()
      end,
      desc = "run current test",
    },
    {
      "<leader>tf",
      function()
        require("neotest").run.run(vim.fn.expand("%"))
      end,
      desc = "run current file",
    },
    {
      "<leader>tt",
      function()
        require("neotest").summary.toggle()
      end,
      desc = "toggle test summary sidebar",
    },
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-vitest")({
          filter_dir = function(name)
            return name ~= "node_modules"
          end,
        }),
        require("neotest-jest"),
      },
    })
  end,
}
