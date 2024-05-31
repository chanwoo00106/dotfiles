return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
      servers = {
        cssls = {},
        tailwindcss = {
          root_dir = function(...)
            return require("lspconfig.util").root_pattern(".git")(...)
          end,
        },
        tsserver = {
          root_dir = function(...)
            return require("lspconfig.util").root_pattern(".git")(...)
          end,
          single_file_support = false,
        },
        html = {},
        yamlls = {},
        lua_ls = {
          single_file_support = true,
        },
        jsonls = {
          single_file_support = true,
        },
        prismals = {},
        dockerls = {},
        eslint = {
          settings = {
            workingDirectories = { mode = "auto" },
            experimental = {
              useFlatConfig = false,
            },
          },
        },
      },
    },
  },
}
