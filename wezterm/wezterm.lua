local helpers = require("helpers")
local tabbar = require("tabbar")

local config = {}

config.set_environment_variables = {
  TERMINFO_DIRS = "/home/user/.nix-profile/share/terminfo",
  WSLENV = "TERMINFO_DIRS",
}

helpers.apply_to_config(config)
tabbar.apply_to_config(config)

return config
