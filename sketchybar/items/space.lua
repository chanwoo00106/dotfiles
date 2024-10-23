local colors = require("colors")

local function space_selection(env)
  local color = env.SELECTED == "true" and colors.blue or colors.bg2

  Sbar.set(env.NAME, {
    icon = { color = color },
  })
end

for i = 1, 10, 1 do
  local space = Sbar.add("space", "space." .. i, {
    space = i,
    icon = {
      string = i,
      padding_right = 10,
      padding_left = 10,
    },
    background = {
      height = 20,
      corner_radius = 100,
    }
  })

  space:subscribe("space_change", space_selection)
  space:subscribe("mouse.clicked", function()
    -- TODO: 추가 예정
  end)

  space:subscribe("mouse.entered", function(env)
    if env.SELECTED == "true" then return end

    Sbar.set(env.NAME, {
      background = { color = colors.grey },
      icon = { color = colors.white }
    })
  end)

  space:subscribe("mouse.exited", function(env)
    if env.SELECTED == "true" then return end

    Sbar.set(env.NAME, {
      background = { color = colors.transparent },
      icon = { color = colors.bg2 }
    })
  end)
end
