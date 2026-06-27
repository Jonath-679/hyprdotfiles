#!/bin/bash

awww clear 000000
sleep 0.5

WALLPAPER=$(grep '^wallpaper =' ~/.config/waypaper/config.ini | cut -d '=' -f 2 | xargs)
WALLPAPER="${WALLPAPER/#\~/$HOME}"

echo "Ruta detectada en Waypaper: '$WALLPAPER'"

if [ -f "$WALLPAPER" ]; then
    echo "¡Archivo encontrado! Aplicando animación..."
    awww img "$WALLPAPER" \
        --transition-type center \
        --transition-fps 60 \
        --transition-duration 1.5 \
        --transition-step 60
else
    echo "Error: Bash sigue sin encontrar la imagen en esa ruta exacta."
fi
