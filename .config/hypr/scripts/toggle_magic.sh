#!/bin/bash

current_workspace=$(hyprctl activewindow -j | jq -r '.workspace.name')

if [ "$current_workspace" = "special:magic" ]; then
    hyprctl dispatch "hl.dsp.window.move({workspace=\"+0\"})" 
    else
    hyprctl dispatch "hl.dsp.window.move({workspace=\"special:magic\"})"
fi

