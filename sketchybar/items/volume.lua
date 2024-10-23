local icons  = require("icons")
local volume = Sbar.add("item", {
  position = "right",
})

volume:subscribe("volume_change", function(env)
  local v = tonumber(env.INFO)
  local icon = ""

  if v >= 60 then
    icon = icons.volume.high
  elseif v >= 40 then
    icon = icons.volume.low
  elseif v >= 20 then
    icon = icons.volume.quiet
  else
    icon = icons.volume.off
  end

  volume:set({
    icon = {
      string = icon,
      padding_right = 3,
    },
    label = v .. "%"
  })
end)
