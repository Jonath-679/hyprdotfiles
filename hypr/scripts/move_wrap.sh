#!/usr/bin/env bash

# Recibe la dirección como argumento (l para izquierda, r para derecha)
DIR=$1

# 1. Obtenemos el estado actual de la ventana activa
OLD_INFO=$(hyprctl activewindow -j)
OLD_POS=$(echo "$OLD_INFO" | jq -r '.at')
OLD_WS=$(echo "$OLD_INFO" | jq -r '.workspace.id')

# 2. Intentamos mover la ventana en la dirección solicitada
hyprctl dispatch movewindow "$DIR"

# 3. Pausa súper rápida para que Hyprland actualice el entorno visual
sleep 0.01

# 4. Revisamos el estado de la ventana de nuevo
NEW_INFO=$(hyprctl activewindow -j)
NEW_POS=$(echo "$NEW_INFO" | jq -r '.at')
NEW_WS=$(echo "$NEW_INFO" | jq -r '.workspace.id')

# 5. Lógica: Si su posición X/Y y su Workspace no cambiaron, entonces topó con el borde
if [[ "$OLD_POS" == "$NEW_POS" ]] && [[ "$OLD_WS" == "$NEW_WS" ]]; then
    if [[ "$DIR" == "l" ]]; then
        # Mover al workspace anterior
        hyprctl dispatch movetoworkspace -1
    elif [[ "$DIR" == "r" ]]; then
        # Mover al workspace siguiente
        hyprctl dispatch movetoworkspace +1
    fi
fi

