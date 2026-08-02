--- ~/.config/hypr/modules/monitors.lua

--- Monitors
local monitorLaptop = "eDP-1"
local monitorAcer = "desc:Acer Technologies KB242Y G0 95380BD865W01"
local monitorAny = "HDMI-A-1" -- this includes monitorAcer

--- Config
hl.monitor({output=monitorLaptop, mode="1920x1080@60", position="0x0", scale="1.0"})
hl.monitor({output=monitorAcer, mode="1920x1080@75", position="auto-right", scale="1.0"})
hl.monitor({output="", mode="preferred", position="auto", scale="1.0"})

--- Assign to workspaces
hl.workspace_rule({workspace="1", monitor=monitorLaptop})
hl.workspace_rule({workspace="2", monitor=monitorLaptop})
hl.workspace_rule({workspace="3", monitor=monitorLaptop})
hl.workspace_rule({workspace="4", monitor=monitorLaptop})
hl.workspace_rule({workspace="5", monitor=monitorLaptop})
hl.workspace_rule({workspace="6", monitor=monitorAny})
hl.workspace_rule({workspace="7", monitor=monitorAny})
hl.workspace_rule({workspace="8", monitor=monitorAny})
hl.workspace_rule({workspace="9", monitor=monitorAny})
hl.workspace_rule({workspace="10", monitor=monitorAny})

