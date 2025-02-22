/// @description Step
event_inherited();

scr_keys_update();

if (destroy) {
	h_speed = 0;
}
else {
	var t = timer++;
	
	if(t > angle_dist_max){
		x = __view_get(e__VW.XView, 0) + 160;
		y = __view_get(e__VW.YView, 0) + 120;
	}
	
	if(t > angle_dist_max * 2){
		instance_destroy();
	}
}