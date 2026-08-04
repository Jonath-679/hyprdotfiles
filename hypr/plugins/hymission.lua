--- ~/.config/hypr/plugins/hymission.lua | https://github.com/gfhdhytghd/hymission

--- Binds
hl.bind("SUPER + TAB", hl.plugin.hymission.toggle)

--- Config
hl.config({
    plugin = {
        hymission = {
            -- Layout: common geometry and sizing
            outer_padding_top = 32, --92
            outer_padding_right = 32,
            outer_padding_bottom = 32,
            outer_padding_left = 32,
            row_spacing = 32,
            column_spacing = 32,
            min_window_length = 120,
            min_preview_short_edge = 32,
            small_window_boost = 1.00, --1.35
            max_preview_scale = 0.95,
            workspace_overview_max_preview_scale = 0.95,
            min_slot_scale = 0.10,
            one_workspace_per_row = 1, --0

            -- Layout: engine selection and per-engine settings
            layout_engine = "grid",
            layout_engine_forceall = "",
            layout_engine_all = "",
            layout_engine_onlycurrentworkspace = "",
            layout_scale_weight = 1.0,
            layout_space_weight = 0.10,
            natural_scale_flex = 0.00, --0.22

            -- Behavior: workspace scope and transitions
            multi_workspace_sort_recent_first = 0, --1
            only_active_workspace = 0,
            only_active_monitor = 0,
            show_special = 0, --1
            workspace_change_keeps_overview = 1,

            -- Behavior: hover and selection
            expand_selected_window = 1,
            hover_expand_scale = 1.06, --1.18
            overview_focus_follows_mouse = 1,
            show_focus_indicator = 0,

            -- Animation: hover relayout
            hover_relayout_animation = "",
            hover_relayout_duration = 140,
            hover_relayout_curve = "ease_out_cubic",

            -- Behavior: toggle switch and gestures
            toggle_switch_mode = 1, --0
            switch_toggle_auto_next = 0, --1
            switch_release_key = "Super_L",
            gesture_invert_vertical = 0,

            -- Niri mode
            niri_mode = 0,
            niri_scroll_pixels_per_delta = 1.0,
            niri_workspace_scale = 1.0,
            niri_scrolling_preview_gap = 0,

            -- Workspace strip and bar
            workspace_strip_anchor = "left",
            workspace_strip_empty_mode = "existing",
            workspace_strip_thickness = 160,
            workspace_strip_gap = 24,
            hide_bar_when_strip = 1,
            hide_hyprbars_during_overview = 0,
            bar_single_mission_control = 0,
            hide_bar_animation = 1,
            hide_bar_animation_blur = 1,
            hide_bar_animation_move_multiplier = 0.8,
            hide_bar_animation_scale_divisor = 1.1,
            hide_bar_animation_alpha_end = 0,

            -- Label picking and window controls
            pick_labels_enabled = 0,
            pick_labels_mode = "sequential",
            pick_labels_direct_activate = 0,
            window_decoration_enabled = 1,
            close_button_enabled = 0,
            close_button_size = 18,
            close_button_inset = 0,

            -- Appearance and color customization
            backdrop_blur = 0,
            backdrop_color = "rgba(000000AB)", --rgba(00000000)
            focus_hover_color = "rgba(f2f7ff8c)",
            focus_selected_color = "rgba(3dc7fff2)",
            focus_hover_thickness = 2,
            focus_selected_thickness = 4,
            workspace_strip_inactive_tint_color = "rgba(00000000)",

            -- Debug
            debug_logs = 0,
            debug_surface_logs = 0,
        },
    }
})

