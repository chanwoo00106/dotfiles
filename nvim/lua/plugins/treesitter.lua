return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "typescript",
        "javascript",
        "go",
        "rust",
        "css",
        "html",
        "tsx",
        "markdown",
      },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)

      vim.filetype.add({
        extension = {
          mdx = "mdx",
        },
      })
      vim.treesitter.language.register("markdown", "mdx")
    end,
  },
}
