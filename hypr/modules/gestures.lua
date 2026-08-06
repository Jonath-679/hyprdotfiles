--- ~/.config/hypr/modules/gestures.lua

hl.config({gestures={workspace_swipe_distance=300, workspace_swipe_invert=false}})

hl.gesture({fingers=4, direction="horizontal", action="workspace"})
hl.gesture({fingers=4, direction="vertical", action="workspace"})

