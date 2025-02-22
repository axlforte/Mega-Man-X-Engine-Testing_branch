/// @description Step
event_inherited();

if (destroy) {
	h_speed = 0;
}
else {
	var t = timer++;
	if(is_on_floor(8)){
		move_down(12);
		y--;
		v_speed = 0;
		grav = 0;
		abs_hspeed = 3;
		h_speed = 3 * dir;
	} else {
		grav = 0.2;
	}
	if(!can_move_x(4)){
		instance_destroy();
	}
}