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

local function load_optional(module_path)
    local ok, err = pcall(require, module_path)
    if not ok then
        if not string.find(err, "module '" .. module_path .. "' not found") then
            print("[Hyprland Config Error] Failed to load " .. module_path .. ": " .. err)
        end
    end
end

require("modules.envs")
require("modules.autostarts")
require("modules.looks")
require("modules.layerrules")
require("modules.windowrules")
require("modules.inputs")
require("modules.binds")

load_optional("modules.gitignored")
