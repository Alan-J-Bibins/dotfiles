local mainMod = "SUPER"
local terminal = "kitty"
local fileManager = "thunar"
local browser = "firefox"
local altBrowser = "zen-browser"
local appRunner = "rofi -show drun"
local emoji = "rofimoji -a copy"

function CloseSpecialWorkspace()
    local current = hl.get_active_special_workspace()
    if current then
        hl.dispatch(hl.dsp.workspace.toggle_special(current.config_name))
    end
end

hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind("CTRL + SHIFT + ALT + M",
    hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + SHIFT + Return", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + ALT + Return", hl.dsp.exec_cmd(altBrowser))
hl.bind(mainMod .. " + Space", hl.dsp.exec_cmd(appRunner))
hl.bind(mainMod .. " + CTRL + Space", hl.dsp.exec_cmd(emoji))

hl.bind(mainMod .. " + W", hl.dsp.exec_cmd("waypaper"))
hl.bind(mainMod .. " + CTRL + W", hl.dsp.exec_cmd(("waypaper --random")))
hl.bind(mainMod .. " + CTRL + L", hl.dsp.exec_cmd(("sleep 0.5; hyprlock")))

hl.bind(mainMod .. " + Y", hl.dsp.layout("togglesplit"))

hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))

hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.move({ direction = "down" }))

for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key, function()
        CloseSpecialWorkspace()
        local target_ws = hl.get_workspace(i)
        hl.dispatch(hl.dsp.focus({ workspace = i }))

        if target_ws and target_ws.last_window then
            hl.dispatch(hl.dsp.focus({ window = target_ws.last_window }))
        end
    end)

    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

hl.bind("ALT + grave", hl.dsp.exec_cmd("rofi -show window"))

hl.bind(mainMod .. " + grave", function()
    CloseSpecialWorkspace()
    hl.dsp.exec_cmd("qs ipc -c overview call overview toggle")
end)

hl.bind(mainMod .. " + ALT + T", hl.dsp.group.toggle())
hl.bind(mainMod .. " + ALT + L", hl.dsp.group.lock_active())

hl.bind(mainMod .. " + M", hl.dsp.workspace.toggle_special("m"))
hl.bind(mainMod .. " + SHIFT+ M", hl.dsp.window.move({ workspace = "special:m" }))
hl.bind(mainMod .. " + U", hl.dsp.workspace.toggle_special("u"))
hl.bind(mainMod .. " + SHIFT+ U", hl.dsp.window.move({ workspace = "special:u" }))
hl.bind(mainMod .. " + I", hl.dsp.workspace.toggle_special("i"))
hl.bind(mainMod .. " + SHIFT+ I", hl.dsp.window.move({ workspace = "special:i" }))
hl.bind(mainMod .. " + O", hl.dsp.workspace.toggle_special("o"))
hl.bind(mainMod .. " + SHIFT+ O", hl.dsp.window.move({ workspace = "special:o" }))
hl.bind(mainMod .. " + P", hl.dsp.workspace.toggle_special("p"))
hl.bind(mainMod .. " + SHIFT+ P", hl.dsp.window.move({ workspace = "special:p" }))

hl.bind("XF86PowerOff", hl.dsp.exec_cmd("hyprlock"))

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag())
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize())

hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("swayosd-client --brightness raise"))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("swayosd-client --brightness lower"))
hl.bind("Home", hl.dsp.exec_cmd("swayosd-client --brightness raise"))
hl.bind("End", hl.dsp.exec_cmd("swayosd-client --brightness lower"))


hl.bind("XF86AudioMute", hl.dsp.exec_cmd("swayosd-client --output-volume mute-toggle"))
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("swayosd-client --output-volume raise"))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("swayosd-client --output-volume lower"))
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"))

hl.bind(mainMod .. " + CTRL + Right", hl.dsp.exec_cmd("playerctl next"))
hl.bind(mainMod .. " + CTRL + Left", hl.dsp.exec_cmd("playerctl previous"))

-- TODO: Toggle blur bind for mainMod + F1

hl.bind(mainMod .. " + ALT + W", hl.dsp.exec_cmd("waybar"))
hl.bind(mainMod .. " + SHIFT + W", hl.dsp.exec_cmd("killall -SIGUSR2 waybar"))

hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))

hl.bind("Print",
    hl.dsp.exec_cmd(
        "grim  - | satty --filename - --output-filename ~/Pictures/Screenshots/screenshot-$(date '+%Y%m%d-%H:%M:%S').png --copy-command 'wl-copy'"))
hl.bind(mainMod .. " + Print", hl.dsp.exec_cmd("quickshell -c hyprquickshot -n"))

hl.bind(mainMod .. " + SHIFT + C", hl.dsp.exec_cmd("hyprpicker -a"))
hl.bind(mainMod .. " + ALT + C", hl.dsp.exec_cmd("hyprpicker -a -f rgb"))

hl.bind(mainMod .. " + SHIFT + V",
    hl.dsp.exec_cmd("cliphist list | rofi -dmenu -no-show-icons false | cliphist decode | wl-copy"))

hl.bind(mainMod .. " + N", hl.dsp.exec_cmd("swaync-client -t -sw"))
