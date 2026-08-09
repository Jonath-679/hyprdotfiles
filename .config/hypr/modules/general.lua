--- ~/.config/hypr/modules/general.lua 

hl.config({
	--- General
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
	
	--- Decoration
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
	
	--- Input
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
	
	--- Group
    group = {
		groupbar = {enabled=false}
	},
		
	--- Misc
    misc = {
        disable_hyprland_logo = true,
        disable_splash_rendering = true,
        force_default_wallpaper = 0,
        font_family = "Noto Sans",
		disable_watchdog_warning = true
    },
	
	--- Layouts
    dwindle = {preserve_split=true},
    master = {new_status="master"},
    xwayland = {force_zero_scaling=true},
	
	--- Extra
    binds = {window_direction_monitor_fallback=false}
})

