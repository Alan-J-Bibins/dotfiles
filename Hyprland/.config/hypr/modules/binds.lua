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
        local name = current.config_name:gsub("^special:", "")
        hl.dispatch(hl.dsp.workspace.toggle_special(name))
    end
end

hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal), { submap_universal = true })
hl.bind(mainMod .. " + Q", hl.dsp.window.close(), {submap_universal = true})
hl.bind("CTRL + SHIFT + ALT + M",
    hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"), {submap_universal = true})
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager), {submap_universal = true})
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }), {submap_universal = true})
hl.bind(mainMod .. " + SHIFT + Return", hl.dsp.exec_cmd(browser), {submap_universal = true})
hl.bind(mainMod .. " + ALT + Return", hl.dsp.exec_cmd(altBrowser), {submap_universal = true})
hl.bind(mainMod .. " + Space", hl.dsp.exec_cmd(appRunner), {submap_universal = true})
hl.bind(mainMod .. " + CTRL + Space", hl.dsp.exec_cmd(emoji), {submap_universal = true})

hl.bind(mainMod .. " + W", hl.dsp.exec_cmd("waypaper"), {submap_universal = true})
hl.bind(mainMod .. " + CTRL + W", hl.dsp.exec_cmd(("waypaper --random")), {submap_universal = true})
hl.bind(mainMod .. " + CTRL + L", hl.dsp.exec_cmd(("sleep 0.5; hyprlock")), {submap_universal = true})

hl.bind(mainMod .. " + Y", hl.dsp.layout("togglesplit"), {submap_universal = true})

hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }), {submap_universal = true})
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }), {submap_universal = true})
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }), {submap_universal = true})
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }), {submap_universal = true})

hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.move({ direction = "left", group_aware = true }), {submap_universal = true})
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.move({ direction = "right", group_aware = true }), {submap_universal = true})
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.move({ direction = "up", group_aware = true }), {submap_universal = true})
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.move({ direction = "down", group_aware = true }), {submap_universal = true})

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

hl.bind("ALT + grave", hl.dsp.exec_cmd("rofi -show window"), {submap_universal = true})

hl.bind(mainMod .. " + grave", function()
    CloseSpecialWorkspace()
    hl.dispatch(hl.dsp.exec_cmd("qs ipc -c overview call overview toggle"))
end, {submap_universal = true})

hl.bind(mainMod .. " + ALT + T", hl.dsp.group.toggle(), {submap_universal = true})
hl.bind(mainMod .. " + ALT + L", hl.dsp.group.lock_active(), {submap_universal = true})

hl.bind(mainMod .. " + Tab", function()
    hl.dispatch(hl.dsp.window.cycle_next())
    hl.dispatch(hl.dsp.group.next())
    hl.dispatch(hl.dsp.window.alter_zorder({ mode = "top" }))
end, {submap_universal = true})

hl.bind(mainMod .. " + SHIFT + Tab", function()
    hl.dispatch(hl.dsp.window.cycle_next())
    hl.dispatch(hl.dsp.group.prev())
    hl.dispatch(hl.dsp.window.alter_zorder({ mode = "top" }))
end, {submap_universal = true})

hl.bind(mainMod .. " + M", hl.dsp.workspace.toggle_special("m"), {submap_universal = true})
hl.bind(mainMod .. " + SHIFT+ M", hl.dsp.window.move({ workspace = "special:m" }), {submap_universal = true})
hl.bind(mainMod .. " + U", hl.dsp.workspace.toggle_special("u"), {submap_universal = true})
hl.bind(mainMod .. " + SHIFT+ U", hl.dsp.window.move({ workspace = "special:u" }), {submap_universal = true})
hl.bind(mainMod .. " + I", hl.dsp.workspace.toggle_special("i"), {submap_universal = true})
hl.bind(mainMod .. " + SHIFT+ I", hl.dsp.window.move({ workspace = "special:i" }), {submap_universal = true})
hl.bind(mainMod .. " + O", hl.dsp.workspace.toggle_special("o"), {submap_universal = true})
hl.bind(mainMod .. " + SHIFT+ O", hl.dsp.window.move({ workspace = "special:o" }), {submap_universal = true})
hl.bind(mainMod .. " + P", hl.dsp.workspace.toggle_special("p"), {submap_universal = true})
hl.bind(mainMod .. " + SHIFT+ P", hl.dsp.window.move({ workspace = "special:p" }), {submap_universal = true})

hl.bind("XF86PowerOff", hl.dsp.exec_cmd("hyprlock"), {submap_universal = true})

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), {submap_universal = true})
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), {submap_universal = true})

hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("swayosd-client --brightness raise"), {submap_universal = true})
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("swayosd-client --brightness lower"), {submap_universal = true})
hl.bind("Home", hl.dsp.exec_cmd("swayosd-client --brightness raise"), {submap_universal = true})
hl.bind("End", hl.dsp.exec_cmd("swayosd-client --brightness lower"), {submap_universal = true})


hl.bind("XF86AudioMute", hl.dsp.exec_cmd("swayosd-client --output-volume mute-toggle"), {submap_universal = true})
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("swayosd-client --output-volume raise"), {submap_universal = true})
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("swayosd-client --output-volume lower"), {submap_universal = true})
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), {submap_universal = true})

hl.bind(mainMod .. " + CTRL + Right", hl.dsp.exec_cmd("playerctl next"), {submap_universal = true})
hl.bind(mainMod .. " + CTRL + Left", hl.dsp.exec_cmd("playerctl previous"), {submap_universal = true})

-- TODO: Toggle blur bind for mainMod + F1

hl.bind(mainMod .. " + ALT + W", hl.dsp.exec_cmd("waybar"), {submap_universal = true})
hl.bind(mainMod .. " + SHIFT + W", hl.dsp.exec_cmd("killall -SIGUSR2 waybar"), {submap_universal = true})

hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }), {submap_universal = true})
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.exec_cmd("~/.config/rofi/scripts/fd_navigation.sh"), {submap_universal = true})

hl.bind("Print",
    hl.dsp.exec_cmd(
        "grim  - | satty --filename - --output-filename ~/Pictures/Screenshots/screenshot-$(date '+%Y%m%d-%H:%M:%S').png --copy-command 'wl-copy'"), {submap_universal = true})
hl.bind(mainMod .. " + Print", hl.dsp.exec_cmd("quickshell -c hyprquickshot -n"), {submap_universal = true})

hl.bind(mainMod .. " + SHIFT + C", hl.dsp.exec_cmd("hyprpicker -a"), {submap_universal = true})
hl.bind(mainMod .. " + ALT + C", hl.dsp.exec_cmd("hyprpicker -a -f rgb"), {submap_universal = true})

hl.bind(mainMod .. " + SHIFT + V",
    hl.dsp.exec_cmd("cliphist list | rofi -dmenu -no-show-icons false | cliphist decode | wl-copy"), {submap_universal = true})

hl.bind(mainMod .. " + N", hl.dsp.exec_cmd("swaync-client -t -sw"), {submap_universal = true})
