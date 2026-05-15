local colors = require("colors-hyprland")

hl.config({
    general = {
        gaps_in = 5,
        gaps_out = 5,
        border_size = 2,
        col = {
            active_border = { colors = { colors.color11, colors.color13, colors.color12 }, angle = 45 },
            inactive_border = colors.background,
        },
        resize_on_border = false,
        allow_tearing = false,
        layout = "dwindle",
    },
    decoration = {
        rounding = 12,
        rounding_power = 3,
        dim_inactive = true,
        dim_strength = 0.1,
        dim_special = 0,

        blur = {
            enabled = true,
            xray = false,
            special = false,
            new_optimizations = true,
            size = 4,
            passes = 3,
            brightness = 1,
            noise = 0.01,
            contrast = 1,
            popups = true,
            popups_ignorealpha = 0.6,
        },

        shadow = {
            enabled = true,
            range = 20,
            -- offset = vec2(0, 4),
            render_power = 4,
            color = 0x00000040,
        },
    },
    animations = {
        enabled = true,
    },
    dwindle = {
        preserve_split = true,
        force_split = 2
    },
    master = {
        new_on_top = true,
        new_status = "inherit",
        mfact = 0.5,
    },
    misc = {
        vrr                     = 2,
        force_default_wallpaper = -1,    -- Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo   = false, -- If true disables the random hyprland logo / anime girl background. :(
    },
    binds = {
        workspace_back_and_forth = false,
        movefocus_cycles_fullscreen = true,
    },
    group = {
        col = {
            border_active = { colors = { colors.color11, colors.color13, colors.color1, colors.color2 }, angle = 45 },
            border_inactive = colors.background,
            border_locked_active = { colors = { colors.color11, colors.color13, colors.color1, colors.color2 }, angle = 45 },
            border_locked_inactive = colors.background,
        },
        groupbar = {
            font_size = 10,
            height = 16,
            stacked = false,
            gradients = true,
            gradient_rounding = 12,
            indicator_height = 0,
            gradient_round_only_edges = true,
            keep_upper_gap = false,
            text_color = colors.foreground,
            col = {
                active = colors.color11,
                locked_active = colors.color2,
                inactive = "rgb(262626)",
                locked_inactive = "rgb(262626)",
            }
        }
    }

})

hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("md3_standard", { type = "bezier", points = { { 0.2, 0 }, { 0, 1 } } })
hl.curve("md3_decel", { type = "bezier", points = { { 0.05, 1.15 }, { 0.1, 1 } } })
hl.curve("md3_accel", { type = "bezier", points = { { 0.3, 0 }, { 0.8, 0.15 } } })
hl.curve("overshot", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.1 } } })
hl.curve("crazyshot", { type = "bezier", points = { { 0.1, 1.5 }, { 0.76, 0.92 } } })
hl.curve("hyprnostretch", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.0 } } })
hl.curve("menu_decel", { type = "bezier", points = { { 0.1, 1 }, { 0, 1 } } })
hl.curve("menu_decel2", { type = "bezier", points = { { 0.1, 1.2 }, { 0, 1 } } })
hl.curve("menu_accel", { type = "bezier", points = { { 0.38, 0.04 }, { 1, 0.07 } } })
hl.curve("easeInOutCirc", { type = "bezier", points = { { 0.85, 0 }, { 0.15, 1 } } })
hl.curve("easeOutCirc", { type = "bezier", points = { { 0, 0.55 }, { 0.45, 1 } } })
hl.curve("easeOutExpo", { type = "bezier", points = { { 0.16, 1 }, { 0.3, 1 } } })
hl.curve("softAcDecel", { type = "bezier", points = { { 0.26, 0.26 }, { 0.15, 1 } } })
hl.curve("md2", { type = "bezier", points = { { 0.4, 0 }, { 0.2, 1 } } })

hl.animation({ leaf = "windows", enabled = true, speed = 5, bezier = "menu_decel2", style = "gnomed" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 5, bezier = "menu_decel2", style = "gnomed" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 3, bezier = "md3_accel", style = "gnomed" })
hl.animation({ leaf = "border", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "fade", enabled = true, speed = 3, bezier = "easeOutExpo"})
hl.animation({ leaf = "layersIn", enabled = true, speed = 3, bezier = "menu_decel2", style = "slide" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.6, bezier = "menu_accel" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 2, bezier = "menu_decel" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 4.5, bezier = "menu_accel" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 5, bezier = "md3_decel", style = "slide" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 5, bezier = "md3_decel", style = "slidevert" })
