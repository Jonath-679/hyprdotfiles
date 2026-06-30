#!/bin/bash

WALLPAPER="$1"
CACHE_BG="/tmp/rofi_bg.jpg"
magick "$WALLPAPER" -resize 768x432^ -gravity center -extent 768x432 -quality 90 "$CACHE_BG"
