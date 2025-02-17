/// @description Step
event_inherited();

if (destroy) {
	h_speed = 0;
}
else {
	var t = timer++;
	if (t == 0) {
		var inst = instance_create_depth(x, y, depth, obj_player_megaman_shot_2_effect);
		inst.image_xscale = dir;
		inst.owner = owner;
		inst.owner_x = owner.x;
		inst.owner_y = owner.y;
		inst.shot_counted = false;
	}
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