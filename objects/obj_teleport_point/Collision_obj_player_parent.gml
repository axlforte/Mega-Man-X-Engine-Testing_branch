with(other){
	if(state == states.safety_teleport){
		player_state_set(states.fall);
		physics_ignore_frame = 0;
		locked = false;
		v_speed = 0;
		mask_index = state_hitbox[state];
	}
}