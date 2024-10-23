local cal = Sbar.add("item", {
  padding_left = 10,
  padding_right = 8,
  icon = {
    padding_right = 0,
    font = {
      style = "Black",
      size = 14.0,
    },
  },
  label = {
    width = 45,
    align = "right",
  },
  position = "right",
  update_freq = 15,
})

local function update()
  local date = os.date("%a. %d %b.")
  local time = os.date("%H:%M")
  cal:set({ icon = { string = date }, label = time })
end

cal:subscribe("routine", update)
cal:subscribe("forced", update)
