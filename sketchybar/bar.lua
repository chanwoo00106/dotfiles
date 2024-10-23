local colors = require("colors")

-- Equivalent to the --bar domain
Sbar.bar({
  height = 30,
  color = colors.bar.bg,
  border_color = colors.bar.border,
  shadow = true,
  sticky = true,
  padding_right = 10,
  padding_left = 10,
  blur_radius = 20,
  topmost = "window",
  margin = 5,
  y_offset = 5,
  corner_radius = 100,
})
