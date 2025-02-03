function player_state_oil_slide() {
	var t = state_timer++;

	animation_play("oil_slide");

	grav = 0;
	v_speed = 0;
	
	if(is_on_floor(12) || instance_place(x, y + 32, obj_water)){
		rotation = 0;
	} else {
		rotation = 30 * dir;
	}
	
	if (!instance_exists(obj_player_megaman_shot_oil_slider)) {
		grav = gravity_default;
		rotation = 0;
		player_state_set(states.fall, 0);
	}


}
