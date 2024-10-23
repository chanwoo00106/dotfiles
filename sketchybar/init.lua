os.execute(
  "[ ! -d $HOME/.local/share/sketchybar_lua/ ] && (git clone https://github.com/FelixKratz/SbarLua.git /tmp/SbarLua && cd /tmp/SbarLua/ && make install && rm -rf /tmp/SbarLua/)")

package.cpath = package.cpath .. ";/Users/" .. os.getenv("USER") .. "/.local/share/sketchybar_lua/?.so"

Sbar = require("sketchybar")

Sbar.begin_config()
require("bar")
require("items")
Sbar.hotload(true)
Sbar.end_config()

Sbar.event_loop()
