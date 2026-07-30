#!/usr/bin/env bash

DIR=$1
OLD_ADDR=$(hyprctl activewindow -j | jq -r '.address')
hyprctl dispatch "hl.dsp.focus({direction=\"$DIR\"})"
sleep 0.01
NEW_ADDR=$(hyprctl activewindow -j | jq -r '.address')

if [[ "$OLD_ADDR" == "$NEW_ADDR" ]]; then
    if [[ "$DIR" == "l" ]]; then
		hyprctl dispatch "hl.dsp.focus({workspace='r-1'})"
    elif [[ "$DIR" == "r" ]]; then
		hyprctl dispatch "hl.dsp.focus({workspace='r+1'})"
    fi
fi
