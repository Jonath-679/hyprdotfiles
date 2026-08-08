--- ~/.config/hypr/modules/monitors.lua

--- Monitors
local monitorLaptop = "eDP-1"
local monitorAcer = "desc:Acer Technologies KB242Y G0 95380BD865W01"
local monitorExterno = "HDMI-A-1" -- this includes monitorAcer

--- This variable will be edited by ~/.config/hypr/scripts/monitor-menu.sh
local currentMode = "Modo-extendido"

--- Dynamic configuration logic
if currentMode == "Modo-extendido" then
    hl.monitor({output=monitorLaptop, mode="1920x1080@60", position="0x0", scale=1.0})
    hl.monitor({output=monitorAcer, mode="1920x1080@75", position="auto-right", scale=1.0})
    hl.monitor({output="", mode="preferred", position="auto", scale=1.0}) --generic
    -- monitorLaptop: 1-5 | monitorExterno: 6-10
    for i=1,5 do hl.workspace_rule({workspace=tostring(i), monitor=monitorLaptop}) end
    for i=6,10 do hl.workspace_rule({workspace=tostring(i), monitor=monitorExterno}) end

elseif currentMode == "Modo-espejo" then
    hl.monitor({output=monitorLaptop, mode="1920x1080@60", position="0x0", scale=1.0})
	hl.monitor({output=monitorExterno, mode="preferred", position="auto", scale=1.0, mirror=monitorLaptop})
    -- In mirror mode, monitorExterno has no independent space. ALL go to monitorLaptop.
    for i=1,10 do hl.workspace_rule({workspace=tostring(i), monitor=monitorLaptop}) end

elseif currentMode == "Solo-laptop" then
    hl.monitor({output=monitorLaptop, mode="1920x1080@60", position="0x0", scale=1.0})
    hl.monitor({output=monitorExterno, disabled=true})
    -- Only monitorLaptop is active. ALL go to monitorLaptop.
    for i=1,10 do hl.workspace_rule({workspace=tostring(i), monitor=monitorLaptop}) end

end

