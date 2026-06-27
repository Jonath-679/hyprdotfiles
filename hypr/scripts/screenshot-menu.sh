#!/bin/bash

opciones="✂️ Zona seleccionada\n🪟 Ventana activa\n🖥️ Pantalla completa"
output_DIR="$HOME/Screenshots"

seleccion=$(echo -e "$opciones" | rofi -dmenu \
    -p "  | Captura" \
    -theme-str '
        window {
            location: center;
            anchor: center;
            width: 300px;
            height: 240px;
            border-radius: 10px;
            padding: 10px;
        }
        listview {
            lines: 3;
            spacing: 2px;
            scrollbar: false;
            margin: 0px;
        }
        element {
            padding: 6px 0px;
        }
    ')

case "$seleccion" in
    *"Zona seleccionada"*)
        hyprshot -m region -o "$output_DIR"
        ;;
    *"Ventana activa"*)
        hyprshot -m window -o "$output_DIR"
        ;;
    *"Pantalla completa"*)
        hyprshot -m output -o "$output_DIR"
        ;;
esac
