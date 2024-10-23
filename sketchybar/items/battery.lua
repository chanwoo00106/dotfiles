local icons = require("icons")

local battery = Sbar.add("item", {
  position = "right",
  padding_left = 10,
  icon = {
    font = {
      style = "Regular",
    },
  },
  update_freq = 120,
})

local function battery_update()
  Sbar.exec("pmset -g batt", function(batt_info)
    local icon = ""

    if (string.find(batt_info, 'AC Power')) then
      icon = icons.battery.charging
    end

    local found, _, charge = batt_info:find("(%d+)%%")
    if not found then
      return
    end

    charge = tonumber(charge)

    if charge == 100 then
      icon = icon .. icons.battery._100
    elseif charge >= 90 then
      icon = icon .. icons.battery._90
    elseif charge >= 80 then
      icon = icon .. icons.battery._80
    elseif charge >= 70 then
      icon = icon .. icons.battery._70
    elseif charge >= 60 then
      icon = icon .. icons.battery._60
    elseif charge >= 50 then
      icon = icon .. icons.battery._50
    elseif charge >= 40 then
      icon = icon .. icons.battery._40
    elseif charge >= 30 then
      icon = icon .. icons.battery._30
    elseif charge >= 20 then
      icon = icon .. icons.battery._20
    elseif charge >= 10 then
      icon = icon .. icons.battery._10
    else
      icon = icon .. icons.battery._0
    end

    battery:set({
      icon = {
        string = icon,
        padding_right = 3
      },
      label = charge .. "%"
    })
  end)
end


battery:subscribe({ "routine", "power_source_change", "system_woke" }, battery_update)
