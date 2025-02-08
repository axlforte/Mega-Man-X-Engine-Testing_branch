/// @description Step
event_inherited();

if(!can_move_x(3 * dir)){
	grav = 0;
	h_speed = 0;
	v_speed = -3;
} else if(!is_on_floor(4)){
	h_speed = 0;
	grav = 0.25;
	if(can_move_x(3 * dir) && instance_place(x + 8 * dir, y + 8, obj_block_parent))
		x+=dir;
} else {
	h_speed = 3;
	grav = 0;
	v_speed = 0;
}
h_speed = h_speed * dir;