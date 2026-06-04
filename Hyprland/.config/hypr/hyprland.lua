hl.monitor({
    output = "",
    mode = "preferred",
    position = "auto",
    scale = "1",
})

hl.monitor({
    output = "",
    mode = "preferred",
    position = "auto",
    scale = 1,
    mirror = "eDP-2"
})

require("modules.envs")
require("modules.autostarts")
require("modules.looks")
require("modules.layerrules")
require("modules.windowrules")
require("modules.inputs")
require("modules.binds")
