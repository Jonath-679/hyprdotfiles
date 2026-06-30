#!/bin/bash

# 1. Leer ruta desde la configuración de Waypaper
WALLPAPER=$(grep -m 1 '^wallpaper =' "$HOME/.config/waypaper/config.ini" | sed 's/^wallpaper = //')
WALLPAPER="${WALLPAPER/#\~/$HOME}"

# Archivos temporales de caché
CACHE_BG="/tmp/rofi_bg.jpg"
CACHE_TXT="/tmp/rofi_last_wp.txt"

# 2. Corregido: Compara si la ruta cambió o si los archivos temporales no existen
if [ ! -f "$CACHE_BG" ] || [ ! -f "$CACHE_TXT" ] || [ "$WALLPAPER" != "$(cat "$CACHE_TXT" 2>/dev/null)" ]; then
    # Crear la imagen optimizada instantánea
    magick "$WALLPAPER" -resize 768x432^ -gravity center -extent 768x432 -quality 85 "$CACHE_BG"
    # Guardar la nueva ruta para la siguiente validación
    echo "$WALLPAPER" > "$CACHE_TXT"
fi

# 3. Lanzar Rofi sin retrasos
rofi -show drun -theme "$HOME/.config/rofi/config.rasi" \
     -theme-str "window { background-image: url(\"$CACHE_BG\", none); }"
