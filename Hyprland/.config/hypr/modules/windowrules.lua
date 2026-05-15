hl.window_rule({
    match = {
        class = "(?i)^(kitty)$"
    },
    xray = true
})

hl.window_rule({
    float = true,
    match = {
        title = "^(Waypaper)$"
    },
})

hl.window_rule({
    float = true,
    match = {
        title = "^(Volume Control)$"
    },
})

hl.window_rule({
    float = true,
    match = {
        title = "^(Network Connections)$"
    },
})

hl.window_rule({
    float = true,
    match = {
        title = "^(fastfetch)$"
    },
})

hl.window_rule({
    float = true,
    match = {
        title = "^(Bluetooth Devices)$"
    },
})

hl.window_rule({
    match = {
        initial_class = "^(blender)$"
    },
    fullscreen = false,
    sync_fullscreen = false,
})

hl.window_rule({
    match = {
        initial_class = "^(blender)$",
        float = true
    },
    center = true,
    size = "960 540"
})

hl.window_rule({
    match = {
        initial_class = "^(blender)$",
        initial_title = "^(Preferences)$"
    },
    float = true,
    center = true,
    size = "960 540"
})

hl.window_rule {
    match = {
        title = "^(Choose directory for export file)$"
    },
    float = true,
}

hl.window_rule {
    match = { class = ".*" },
    suppress_event = "maximise",
}

hl.window_rule({
    match = {
        class = "(?i)^(thunar)$"
    },
    opacity = "0.8 0.8"
})

hl.window_rule({
    match = {
        class = "(?i)^(thunar)$",
        title = "(?i)^(Rename.*)$",
    },
    float = true,
})

hl.window_rule({
    match = {
        title = "(?i)^(File Operation Progress)$",
    },
    float = true,
})

hl.window_rule({
    match = {
        class = "(?i)^(vlc)$"
    },
    no_blur = true,
    no_initial_focus = true,
    suppress_event = "activate",

})

hl.window_rule({
    match = {
        class = "(?i)^(resolve)$"
    },
    no_blur = true,
    no_initial_focus = true,
    suppress_event = "activate",
})

hl.window_rule({
    match = {
        class = "(?i)^(jetbrains-studio)$"
    },
    no_blur = true,
    no_initial_focus = true,
    suppress_event = "activate",

})

hl.window_rule({
    match = {
        class = "(?i)^(Ardour.*)$"
    },
    no_initial_focus = true,
    suppress_event = "activate",

})

hl.window_rule({
    match = {
        title = "^(WhatsApp Web)$"
    },
    workspace = "special:c",
    group = "set [always]"
})

hl.window_rule({
    match = {
        class = "^(vesktop)$"
    },
    workspace = "special:c",
    xray = true,
    group = "set [always]"
})

hl.window_rule({
    float = true,
    pin = true,
    no_initial_focus = true,
    size = "(monitor_w*0.35) (monitor_h*0.35)",
    move = "((monitor_w*1)-window_w-5), 0",
    match = {
        title = "^(Picture-in-Picture)$"
    },
})

hl.window_rule({
    match = {
        class = "(?i)^(obsidian)$"
    },
    opacity = "0.8 0.8"
})

hl.window_rule({
    match = {
        class = "(?i)^(vesktop)$"
    },
    opacity = "0.8 0.8",
    xray = 1
})

hl.window_rule({
    match = {
        title = "^(satty)$",
        class = "^(com.gabm.satty)$",
    },
    float = true,
    size = "(monitor_w*0.9) (monitor_h*0.9)",
    move = "((monitor_w - window_w) / 2) ((monitor_h - window_h) / 2)",
})

hl.window_rule({
    match = {
        class = "^(DesktopEditors)$"
    },
    center = true
})

hl.window_rule({
    match = {
        class = "(?i)^(Spotify)$"
    },
    xray = true,
    opacity = "0.8 0.8",
    workspace = "special:m",
})
