-- # # # # # # # # # # # # # # # #
-- #	 HYPRLAND LUA CONFIG	 #
-- # # # # # # # # # # # # # # # # 

--- VARIABLES GLOBALES ---
local monitorLaptop = "eDP-1"
local monitorAcer = "desc:Acer Technologies KB242Y G0 95380BD865W01"
local mainMod = "SUPER"
local terminal = "kitty"


--- MONITORES Y WORKSPACES ---
hl.monitor({output=monitorLaptop, mode="1920x1080@60", position="0x0", scale="1.0"})
hl.monitor({output=monitorAcer, mode="1920x1080@75", position="auto-right", scale="1.0"})
hl.monitor({output="", mode="preferred", position="auto", scale="1.0"})

hl.workspace_rule({workspace="1", monitor=monitorLaptop})
hl.workspace_rule({workspace="2", monitor=monitorLaptop})
hl.workspace_rule({workspace="3", monitor=monitorLaptop})
hl.workspace_rule({workspace="4", monitor=monitorLaptop})
hl.workspace_rule({workspace="5", monitor=monitorLaptop})
hl.workspace_rule({workspace="6", monitor="HDMI-A-1"})
hl.workspace_rule({workspace="7", monitor="HDMI-A-1"})
hl.workspace_rule({workspace="8", monitor="HDMI-A-1"})
hl.workspace_rule({workspace="9", monitor="HDMI-A-1"})
hl.workspace_rule({workspace="10", monitor="HDMI-A-1"})


--- AUTOSTART (EXEC-ONCE) ---
hl.on("hyprland.start", function()
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
    hl.exec_cmd("/usr/lib/hyprpolkitagent/hyprpolkitagent")
    hl.exec_cmd("awww-daemon --no-cache")
    hl.exec_cmd(os.getenv("HOME") .. "/.config/hypr/scripts/awww-boot.sh")
    hl.exec_cmd("bash -c 'WALLPAPER=$(sed -n \"s/^wallpaper = //p\" ~/.config/waypaper/config.ini | sed \"s|~|$HOME|\"); ~/.config/rofi/cache.sh \"$WALLPAPER\"'") -- background rofi
    hl.exec_cmd(terminal .. " --class pocket-terminal")
    hl.exec_cmd("sleep 2.0 && wayle panel start")
    hl.exec_cmd("sleep 3.0 && megasync")
    hl.exec_cmd("hypridle")
end)


--- VARIABLES DE ENTORNO ---
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")


--- CONFIGURACIÓN PRINCIPAL ---
hl.config({
    general = {
        border_size = 2,
        gaps_in = 5,
        gaps_out = 10,
		float_gaps = -1,
        gaps_workspaces = 0,
        ["col.active_border"] = "rgba(a9b1d6FF)",
        ["col.inactive_border"] = "rgba(a9b1d680)",
        layout = "dwindle",
        no_focus_fallback = true,
        resize_on_border = true,
        extend_border_grab_area = 20,
        snap = {
            enabled = true,
            window_gap = 20,
            monitor_gap = 20,
            respect_gaps = true
        }
    },


    decoration = {
        rounding = 10,
        rounding_power = 2.5,
        active_opacity = 0.90,
        inactive_opacity = 0.85,
        fullscreen_opacity = 1.00,
        blur = {
            enabled = true,
            size = 6,
            passes = 3,
            ignore_opacity = true
        }
    },
 

    input = {
        kb_layout = "us",
        kb_variant = "altgr-intl",
        repeat_rate = 25,
        repeat_delay = 250,
        sensitivity = 0.0,
        accel_profile = "flat",
        scroll_method = "2fg",
        natural_scroll = false,
        follow_mouse = 1,
        touchpad = {
            disable_while_typing = true,
            natural_scroll = false,
            scroll_factor = 0.67,
            clickfinger_behavior = true,
            drag_lock = true
        }
    },


    gestures = {
        workspace_swipe_distance = 300,
        workspace_swipe_invert = false,
    },


    group = { groupbar = { enabled = false } },


    misc = {
        disable_hyprland_logo = true,
        disable_splash_rendering = true,
        force_default_wallpaper = 0,
        font_family = "Noto Sans",
		disable_xdg_env_checks = false
    },


    dwindle = { preserve_split = true },
    master = { new_status = "master" },
    xwayland = { force_zero_scaling = true },
    binds = { window_direction_monitor_fallback = false }
})


hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })
hl.gesture({ fingers = 4, direction = "horizontal", action = "workspace" })
hl.gesture({ fingers = 3, direction = "vertical", action = "workspace" })
hl.gesture({ fingers = 4, direction = "vertical", action = "workspace" })


--- ANIMACIONES ---
hl.config({ animations = { enabled = true } })
hl.curve("openRofi", { type = "bezier", points = { {0.7, 0.0}, {0.84, 0.0} } })
hl.curve("closeRofi", { type = "bezier", points = { {0.7, 1.0}, {0.84, 0.0} } })
hl.animation({ leaf = "layersIn", enabled = true, speed = 1.50, bezier = "openRofi", style = "popin 0%" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.00, bezier = "openRofi" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 0.75, bezier = "closeRofi", style = "popin 0%" })


--- WINDOWRULES Y LAYERRULES ---
--- Reglas Generales
local common_apps = {
    "^(org.pulseaudio.pavucontrol)$", "^(xdg-desktop-portal-gtk)$", "^(nwg-look)$",
    "^(qt6ct)$", "^(org.gnome.Loupe)$", "^(xarchiver)$", "^(mpv)$"
}
for _, app in ipairs(common_apps) do
    hl.window_rule({ name = app .. "-rule", match = { class = app }, float = true, center = true, size = "1280 720" })
end
--- Reglas Específicas
hl.window_rule({ name = "waypaper-rule", match = { class = "^(waypaper)$" }, float = true, center = true, size = "432 768" })
hl.window_rule({ name = "calc-rule", match = { class = "^(org.gnome.Calculator)$" }, float = true, center = true, size = "432 768" })
hl.window_rule({ name = "thunar-progress", match = { class = "^(thunar)$", title = "^(Progreso de las operaciones de archivo)$" }, float = true, center = true, size = "640 360" })
hl.window_rule({ name = "gd-fs", match = { title = "^(Geometry Dash)$" }, fullscreen = true })
--- Pocket Terminal
hl.window_rule({
    name = "pocket-terminal",
    match = { class = "^(pocket-terminal)$" },
    float = true,
    workspace = "special:magic silent",
    size = "1280 720",
    center = true
})
--- Layer Rule
hl.layer_rule({ name = "no-anim-selection", match = { namespace = "selection" }, no_anim = true })


--- KEYBINDS ---
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + Escape", hl.dsp.exec_cmd("wlogout --buttons-per-row 5"))
--hl.bind(mainMod .. " + Space", hl.dsp.exec_cmd("hyprctl --batch \"dispatch togglefloating ; dispatch resizeactive exact 1280 720 ; dispatch centerwindow\"")
hl.bind(mainMod .. " + Space", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + SHIFT + M", hl.dsp.window.fullscreen({mode="fullscreen"}))
hl.bind(mainMod .. " + M", hl.dsp.window.fullscreen({mode="maximized"}))
--hl.bind(mainMod .. " + TAB", hl.dsp.window.cycle_next())
hl.bind(mainMod .. " + SUPER_L", hl.dsp.exec_cmd("pkill rofi || $HOME/.config/rofi/launcher.sh"), { release = true })

--- Grupos
hl.bind(mainMod .. " + G", hl.dsp.group.toggle())
hl.bind(mainMod .. " + tab", hl.dsp.group.next())

--- Cambiar de ventana 
hl.bind(mainMod .. " + H", hl.dsp.exec_cmd("~/.config/hypr/scripts/focus_wrap.sh l"))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "d" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "u" }))
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("~/.config/hypr/scripts/focus_wrap.sh r"))

--- Mover ventana
--- hl.bind(mainMod .. " + SHIFT + H", hl.dsp.exec_cmd("~/.config/hypr/scripts/move_wrap.sh l"))
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.move({ direction = "l" }))
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.move({ direction = "d" }))
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.move({ direction = "u" }))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.move({ direction = "r" }))
--- hl.bind(mainMod .. " + SHIFT + L", hl.dsp.exec_cmd("~/.config/hypr/scripts/move_wrap.sh r"))

--- Mover ventana a monitor
hl.bind(mainMod .. " + CTRL + H", hl.dsp.window.move({ monitor = "l" }))
hl.bind(mainMod .. " + CTRL + L", hl.dsp.window.move({ monitor = "r" }))

--- Cambiar/Mover a workspace [1-10] 
for i = 1, 10 do
    local key = i % 10
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

--- Cambiar/Mover a workspace | MouseScroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1"}))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1"}))
hl.bind(mainMod .. " + SHIFT + mouse_down", hl.dsp.window.move({ workspace = "r+1" }))
hl.bind(mainMod .. " + SHIFT + mouse_up", hl.dsp.window.move({ workspace = "r-1" }))

--- Special workspace
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

--- Redimensionar ventanas con teclado
hl.bind(mainMod .. " + ALT + H", hl.dsp.window.resize({x=-50, y=0, relative=true}))
hl.bind(mainMod .. " + ALT + J", hl.dsp.window.resize({x=0, y=50, relative=true}))
hl.bind(mainMod .. " + ALT + K", hl.dsp.window.resize({x=0, y=-50, relative=true}))
hl.bind(mainMod .. " + ALT + L", hl.dsp.window.resize({x=50, y=0, relative=true}))

--- Mover y redimensionar ventanas con mause
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
hl.bind("mouse:274", hl.dsp.window.drag(), { mouse = true })

--- Multimedia/Brillo/Screenshot 
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+ --limit 1"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 5%-"), { locked = true, repeating = true })
hl.bind("Print", hl.dsp.exec_cmd(os.getenv("HOME") .. "/.config/hypr/scripts/screenshot-menu.sh"))


--- Extra (añadido que no estaba en el hyprland.conf) --- 
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + T", hl.dsp.layout("togglesplit"))    -- dwindle only

hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

local suppressMaximizeRule = hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})
--- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

