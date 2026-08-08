#!/bin/bash

monitorConfigFile="$HOME/.config/hypr/modules/monitors.lua"
opciones="🚀 Modo-extendido\n💻 Solo-laptop\n🪞 Modo-espejo"

seleccion=$(echo -e "$opciones" | rofi -dmenu \
    -p "  Captura" \
    -kb-row-down "Down,j" \
    -kb-row-up "Up,k" \
    -kb-accept-entry "Return,l" \
    -kb-cancel "Escape,h" \
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
			lines: 4;
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
	*"Modo-extendido"*) newMode="Modo-extendido" ;;
	*"Solo-laptop"*) newMode="Solo-laptop" ;;
	*"Modo-espejo"*) newMode="Modo-espejo" ;;
esac

# Update -- local currentMode -- in $monitorConfigFile | if an option was selected
if [ "$seleccion" != "" ]; then
	sed -i "s/^local currentMode = .*/local currentMode = \"$newMode\"/" "$monitorConfigFile"
    
	# Reload background and wayle-shell
	if [ "$newMode" == "Modo-extendido" ]; then
		sleep 2.5
		~/.config/hypr/scripts/awww-boot.sh &
		wayle panel restart &
	fi

fi

