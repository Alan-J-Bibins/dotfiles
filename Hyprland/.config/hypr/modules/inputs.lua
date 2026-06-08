function CloseSpecialWorkspace()
    local current = hl.get_active_special_workspace()
    if current then
        local name = current.config_name:gsub("^special:", "")
        hl.dispatch(hl.dsp.workspace.toggle_special(name))
    end
end

hl.config({
    input = {
        kb_layout = "us",
        kb_options = "ctrl:nocaps",
        follow_mouse = 1,
        mouse_refocus = false,
        accel_profile = "flat",
        sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.
        touchpad = {
            natural_scroll = true,
            scroll_factor = 0.2
        },
    },
    cursor = {
        no_warps = true,
        no_hardware_cursors = false
    }

})

hl.gesture({
   fingers = 3,
   direction = "horizontal",
   action = "workspace"
})

hl.gesture({
   fingers = 3,
   direction = "down",
   action = function ()
       CloseSpecialWorkspace()
   end
})
