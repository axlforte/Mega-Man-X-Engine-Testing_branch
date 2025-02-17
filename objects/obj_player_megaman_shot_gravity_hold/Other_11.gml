/// @description Step
event_inherited();

scr_keys_update();

if (destroy) {
	h_speed = 0;
}
else {
	var t = timer++;
	
	if(t > 15){
		x = __view_get(e__VW.XView, 0) + 160;
		y = __view_get(e__VW.YView, 0) + 120;
	}
	
	if(t > 40){
		instance_destroy();
	}
}