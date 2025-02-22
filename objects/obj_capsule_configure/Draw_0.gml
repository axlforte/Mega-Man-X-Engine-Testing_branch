draw_rectangle(x,y,x + 64,y + 32,false);

draw_sprite(
asset_get_index("spr_x_idle_" + armor + array_get(["","_helm","_body","_arms","_legs"],part)),
0,x + 16,y + 16);
draw_sprite(
asset_get_index("spr_x_idle_" + capusle.armor + array_get(["","_helm","_body","_arms","_legs"],capusle.part)),
0,x + 48,y + 16);

/*
var _cx = __view_get(e__VW.XView,0);
var _cy = __view_get(e__VW.YView,0);
draw_string(_cx - x,_cy - y,armor);
draw_string(_cx - x,_cy - y,array_get(["","HEAD","BODY","ARM","LEG"],part));*/