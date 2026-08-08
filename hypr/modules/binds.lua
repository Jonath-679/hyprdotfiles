--- ~/.config/hypr/modules/binds.lua

local mainMod = "SUPER"
local terminal = "kitty"

--- General
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + Escape", hl.dsp.exec_cmd("wlogout --buttons-per-row 5"))
hl.bind(mainMod .. " + Space", hl.dsp.exec_cmd("hyprctl dispatch \"hl.dsp.window.resize({x=1280, y=720})\"; hyprctl dispatch \"hl.dispatch(hl.dsp.window.center())\"", {float=true}))
hl.bind(mainMod .. " + Space", hl.dsp.window.float({action="toggle"}))
hl.bind(mainMod .. " + SHIFT + M", hl.dsp.window.fullscreen({mode="fullscreen"}))
hl.bind(mainMod .. " + M", hl.dsp.window.fullscreen({mode="maximized"}))
--hl.bind(mainMod .. " + TAB", hl.dsp.window.cycle_next())
hl.bind(mainMod .. " + SUPER_L", hl.dsp.exec_cmd("pkill rofi || $HOME/.config/rofi/launcher.sh"), {release=true})

--- Groups
hl.bind(mainMod .. " + G", hl.dsp.group.toggle())
hl.bind(mainMod .. " + tab", hl.dsp.group.next())

--- Focus window
hl.bind(mainMod .. " + H", hl.dsp.exec_cmd("~/.config/hypr/scripts/focus_wrap.sh l"))
hl.bind(mainMod .. " + J", hl.dsp.focus({direction="d"}))
hl.bind(mainMod .. " + K", hl.dsp.focus({direction="u"}))
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("~/.config/hypr/scripts/focus_wrap.sh r"))

--- Move window
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.exec_cmd("~/.config/hypr/scripts/move_wrap.sh l"))
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.move({direction="d"}))
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.move({direction="u"}))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.exec_cmd("~/.config/hypr/scripts/move_wrap.sh r"))

--- Move window to monitor
hl.bind(mainMod .. " + CTRL + H", hl.dsp.window.move({monitor="l"}))
hl.bind(mainMod .. " + CTRL + L", hl.dsp.window.move({monitor="r"}))

--- Change to workspace [1-10] 
for i = 1, 10 do
    local key = i % 10
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({workspace=i}))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({workspace=i}))
end

--- Change to workspace | MouseScroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({workspace="e+1"}))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({workspace="e-1"}))
hl.bind(mainMod .. " + SHIFT + mouse_down", hl.dsp.window.move({workspace="r+1"}))
hl.bind(mainMod .. " + SHIFT + mouse_up", hl.dsp.window.move({workspace = "r-1"}))

--- Special workspace
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({workspace="special:magic"}))

--- Resize Window
hl.bind(mainMod .. " + ALT + H", hl.dsp.window.resize({x=-50, y=0, relative=true}))
hl.bind(mainMod .. " + ALT + J", hl.dsp.window.resize({x=0, y=50, relative=true}))
hl.bind(mainMod .. " + ALT + K", hl.dsp.window.resize({x=0, y=-50, relative=true}))
hl.bind(mainMod .. " + ALT + L", hl.dsp.window.resize({x=50, y=0, relative=true}))

--- Move/Resize Window | MouseScroll
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), {mouse=true})
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), {mouse=true})
hl.bind("mouse:274", hl.dsp.window.drag(), {mouse=true})

--- XF86
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+ --limit 1"), {locked=true, repeating=true})
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), {locked=true, repeating=true})
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), {locked=true})
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"), {locked=true})
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), {locked=true})
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), {locked=true})
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"), {locked=true})
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl set 5%+"), {locked=true, repeating=true})
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 5%-"), {locked=true, repeating=true})

--- Hyprshot (with rofi selector)
hl.bind("Print", hl.dsp.exec_cmd(os.getenv("HOME") .. "/.config/hypr/scripts/screenshot-menu.sh"))

--- Script: monitor-menu.sh
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd("~/.config/hypr/scripts/monitor-menu.sh"))

--- Extra
hl.bind(mainMod .. " + T", hl.dsp.layout("togglesplit")) -- dwindle only

