#!/usr/bin/env bash

# Recibe la dirección como argumento (l para izquierda, r para derecha, u arriba, d abajo)
DIR=$1

# 1. Obtenemos el ID único (address) de la ventana actualmente enfocada
OLD_ADDR=$(hyprctl activewindow -j | jq -r '.address')

# 2. Intentamos mover el foco en la dirección solicitada
hyprctl dispatch movefocus "$DIR"

# 3. Pausa mínima para asegurar que Hyprland actualice el estado interno
sleep 0.01

# 4. Revisamos cuál es la ventana activa ahora
NEW_ADDR=$(hyprctl activewindow -j | jq -r '.address')

# 5. Lógica: Si el 'address' no cambió, topamos con el borde de la pantalla
if [[ "$OLD_ADDR" == "$NEW_ADDR" ]]; then
    if [[ "$DIR" == "l" ]]; then
		# Ir al workspace anterior
        hyprctl dispatch workspace -1
    elif [[ "$DIR" == "r" ]]; then
        # Ir al workspace siguiente
        hyprctl dispatch workspace +1
    fi
fi

