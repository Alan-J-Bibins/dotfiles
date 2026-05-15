hl.layer_rule({
    blur  = true,
    match = { namespace = "notifications" },
})


hl.layer_rule({
    animation = "slide",
    blur      = true,
    match     = { namespace = "wofi" },
})


hl.layer_rule({
    animation = "slide",
    blur = true,
    match = { namespace = "rofi" },
})


hl.layer_rule({
    animation = "slide right",
    blur = true,
    ignore_alpha = 0.5,
    match = { namespace = "swaync-control-center" },
})

hl.layer_rule({
    animation = "slidefade down",
    blur = true,
    ignore_alpha = 0.5,
    match = { namespace = "swaync-notification-window" },
})


hl.layer_rule({
    animation = "popin",
    ignore_alpha = 0.5,
    match = { namespace = "logout_dialog" },
})


hl.layer_rule({
    animation = "slide",
    blur = true,
    ignore_alpha = 0.5,
    match = { namespace = "swayosd" },
})


hl.layer_rule({
    blur = true,
    ignore_alpha = 0.5,
    match = { namespace = "waybar" },
})


hl.layer_rule({
    animation = "slide up",
    match = { namespace = "quickshell:overview" },
})
