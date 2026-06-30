#!/bin/bash

output_DIR="$HOME/Screenshots"
mkdir -p "$output_DIR"

opciones="✂️ Zona seleccionada\n🪟 Ventana activa\n🖥️ Pantalla completa"

seleccion=$(echo -e "$opciones" | rofi -dmenu \
    -p "  Captura" \
    -theme-str '
        @import "~/.config/rofi/colors.rasi"

        window {
			width: 324px;
			height: 216px;
			border-radius: 10px;
			background-color: @surface;
			border: 3px solid;
			border-color: @elevated;
		}

		mainbox {
			orientation: horizontal;
			children: [ listbox ];
		}

		listbox {
			orientation: vertical;
			children: [ listview ];
			background-color: @surface;
			padding: 10px;
		}

		listview {
			margin: 0px 0px 0px 0px;
			columns: 1;
			lines: 3;
			spacing: 10px;
			require-input: false;
			scrollbar: false;
			border: 0px;
		}

		element {
			background-color: @elevated;
			padding: 15px;
			border-radius: 10px;
		}

        element normal.normal {
            background-color: @elevated;
            text-color: @primary;
        }
        
    		element alternate.normal {
            background-color: @elevated;
            text-color: @primary;
        }

		element selected.normal {
			background-color: @elevated;
			text-color: @primary;
			border: 1px solid;
			border-color: @primary;
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

