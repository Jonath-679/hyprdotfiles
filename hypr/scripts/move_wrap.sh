#!/usr/bin/env bash

DIR=$1

OLD_INFO=$(hyprctl activewindow -j)
OLD_POS=$(echo "$OLD_INFO" | jq -r '.at')
OLD_WS=$(echo "$OLD_INFO" | jq -r '.workspace.id')

hyprctl dispatch "hl.dsp.window.move({direction=\"$DIR\"})"
sleep 0.01

NEW_INFO=$(hyprctl activewindow -j)
NEW_POS=$(echo "$NEW_INFO" | jq -r '.at')
NEW_WS=$(echo "$NEW_INFO" | jq -r '.workspace.id')

if [[ "$OLD_POS" == "$NEW_POS" ]] && [[ "$OLD_WS" == "$NEW_WS" ]]; then
    if [[ "$DIR" == "l" ]]; then
        hyprctl dispatch "hl.dsp.window.move({workspace=-1})"
    elif [[ "$DIR" == "r" ]]; then
		hyprctl dispatch "hl.dsp.window.move({workspace=\"+1\"})"
    fi
fi

