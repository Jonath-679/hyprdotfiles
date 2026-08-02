--- ~/.config/hypr/modules/animations.lua

hl.config({animations={enabled=true}})

hl.curve("openRofi", {type="bezier", points={{0.7, 0.0}, {0.84, 0.0}}})
hl.curve("closeRofi", {type="bezier", points={{0.7, 1.0}, {0.84, 0.0}}})

hl.animation({leaf="layersIn", enabled=true, speed=1.50, bezier="openRofi", style="popin 0%"})
hl.animation({leaf="fadeLayersIn", enabled=true, speed=1.00, bezier="openRofi"})
hl.animation({leaf="layersOut", enabled=true, speed=0.75, bezier="closeRofi", style="popin 0%"})

