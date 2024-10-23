local icons = require("icons")

local front_app = Sbar.add("item", {
  padding_left = 10,
  position = "left",
  icon = {
    padding_right = 3,
  }
})

front_app:subscribe("front_app_switched", function(env)
  local app_name = string.gsub(env.INFO, "%s+", "_")
  local icon = icons.front_app[app_name]
  front_app:set({ icon = { string = icon and icon or "" }, label = env.INFO })
end)
