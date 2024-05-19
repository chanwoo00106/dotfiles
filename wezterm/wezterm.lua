local helpers = require("helpers")
local tabbar = require("tabbar")

local config = {}

helpers.apply_to_config(config)
tabbar.apply_to_config(config)

return config
