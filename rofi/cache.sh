#!/bin/bash

WALLPAPER="$1"
CACHE_BG="/tmp/rofi_bg.jpg"
magick "$WALLPAPER" -resize 512x288^ -gravity center -extent 512x288 -quality 99 "$CACHE_BG"
