return {
  {
    "vyfor/cord.nvim",
    build = './build || .\\build',
    event = 'VeryLazy',
    opts = {
      usercmds = true,
      timer = {
        enable = true,
        interval = 1500,
        reset_on_idle = false,
        reset_on_change = false,
      },
      editor = {
        image = nil,
        client = "neovim",
        tooltip = "The Superior Text Editor",
      },
      display = {
        show_time = true,
        show_repository = true,
        show_cursor_position = true,
        swap_fields = true,
        workspace_blacklist = {},
      },
      lsp = {
        show_problem_count = false,
        severity = 1,
        scope = "workspace",
      },
      idle = {
        show_idle = true,
        timeout = 300000,
        disable_on_focus = true,
        text = "Idle",
        tooltip = "💤",
      },
      text = {
        viewing = "Viewing {}",                    -- Text to display when viewing a readonly file
        editing = "Editing code",
        file_browser = "Browsing files in {}",     -- Text to display when browsing files (Empty string to disable)
        plugin_manager = "Managing plugins in {}", -- Text to display when managing plugins (Empty string to disable)
        workspace = "In Secret Project",
      },
      buttons = {
        {
          label = "View repository",
          url = "https://github.com/chanwoo00106/dotfiles",
        },
        {
          label = "View plugin",
          url = "https://github.com/vyfor/cord.nvim",
        },
      },
    },
  },
}
