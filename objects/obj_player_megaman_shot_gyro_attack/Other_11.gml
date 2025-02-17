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
	
	scr_keys_update();
	
	if(key_p_up && !changed_dir){
		changed_dir = true;
		v_speed = -3;
		h_speed = 0;
	} else if(key_p_down && !changed_dir){
		changed_dir = true;
		v_speed = 3;
		h_speed = 0;
	}
}