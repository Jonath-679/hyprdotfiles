--- ~/.config/hypr/modules/autostart.lua

hl.on("hyprland.start", function()
    --- System
	hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
    hl.exec_cmd("/usr/lib/hyprpolkitagent/hyprpolkitagent")
	
	--- Wallpaper effect at startup + rofi backgroundi
    hl.exec_cmd("awww-daemon --no-cache")
    hl.exec_cmd(os.getenv("HOME") .. "/.config/hypr/scripts/awww-boot.sh")
    hl.exec_cmd("bash -c 'WALLPAPER=$(sed -n \"s/^wallpaper = //p\" ~/.config/waypaper/config.ini | sed \"s|~|$HOME|\"); ~/.config/rofi/cache.sh \"$WALLPAPER\"'") -- background rofi
	
    --- Apps 
	hl.exec_cmd("kitty" .. " --class pocket-terminal")
    hl.exec_cmd("sleep 3.5 && wayle panel start")
    hl.exec_cmd("sleep 4.5 && megasync")
    hl.exec_cmd("hypridle")

end)

