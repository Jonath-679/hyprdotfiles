--- ~/.config/hypr/modules/rules.lua

--- General window-rules
local common_apps = {
    "^(org.pulseaudio.pavucontrol)$", "^(xdg-desktop-portal-gtk)$", "^(nwg-look)$",
    "^(qt6ct)$", "^(org.gnome.Loupe)$", "^(xarchiver)$", "^(mpv)$"
}
for _, app in ipairs(common_apps) do
    hl.window_rule({name=app .. "-rule", match={class=app}, float=true, center=true, size="1280 720"})
end

--- Specific window-rules
hl.window_rule({name="waypaper-rule", match={class="^(waypaper)$"}, float=true, center=true, size="432 768"})
hl.window_rule({name="calc-rule", match={class="^(org.gnome.Calculator)$"}, float=true, center=true, size="432 768"})
hl.window_rule({name="thunar-progress", match={class="^(thunar)$", title="^(Progreso de las operaciones de archivo)$"}, float=true, center=true, size="640 360"})
hl.window_rule({name="gd-fs", match={title="^(Geometry Dash)$"}, fullscreen=true})

--- Ignore maximize requests from all apps. You'll probably like this.
local suppressMaximizeRule = hl.window_rule({
    name  = "suppress-maximize-events",
    match = {class=".*"},
    suppress_event = "maximize",
})

--- Fix some dragging issues with XWayland
hl.window_rule({
    name  = "fix-xwayland-drags",
    match = {
        class = "^$",
        title = "^$",
        xwayland = true,
        float = true,
        fullscreen = false,
        pin = false,
    },
    no_focus = true,
})

--- Pocket Terminal
hl.window_rule({
    name = "pocket-terminal",
    match = {class="^(pocket-terminal)$"},
    float = true,
    workspace = "special:magic silent",
    size = "1280 720",
    center = true
})

--- Layer rules
hl.layer_rule({name="no-anim-selection", match={namespace="selection"}, no_anim=true}) -- hyprshot

