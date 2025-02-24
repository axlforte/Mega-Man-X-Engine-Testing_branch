with(other){
	if(state == states.safety_teleport){
		player_state_set(states.fall);
		physics_ignore_frame = 0;
		locked = false;
		v_speed = 0;
		mask_index = state_hitbox[state];
	} else {
		trip_check = other.check;
	}
}
if(frim == 8 && other.state != states.idle && other.state != states.crouch){
	frim = 0; audio_play(Checkpoint);}