function player_state_top_spin() {
	var t = state_timer++;
	
	if (t == 0) {
		dash_air_count++;
		h_speed = (key_right - key_left) * walk_speed_default;
		if(walk_speed == dash_speed){
			h_speed = (key_right - key_left) * dash_speed;
		}
		initial_dir = h_speed;
		//locked = true;
		//v_speed += abs(clamp(1 / (v_speed * -1),0,jump_strength));
		instance_create_depth(x,y,depth, obj_player_megaman_top_spin_hitbox);
		animation_play("spin");
	}

	grav = 0.2;
	h_speed = initial_dir;

	key_right = false;
	key_left = false;

	if(is_on_floor() || key_p_jump){
		h_speed = 0;
		grav = gravity_default;
		with(obj_player_megaman_top_spin_hitbox){
			//kill yourself
			instance_destroy();
		}
		v_speed = 0;
		//locked = false;
		player_state_set(states.fall);
	}
}
