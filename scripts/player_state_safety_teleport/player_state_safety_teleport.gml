function player_state_safety_teleoport() {
	var t = state_timer++;

	if(t == 0){
		locked = true;
		physics_ignore_frame = 2;
	}
	animation_play("tp",0);
	if(instance_exists(obj_teleport_point)){
		with(obj_teleport_point){
			if check == other.trip_check {
				other.trip_point = self;
			}
		}
		move_to_point(trip_point.x, trip_point.y, 10);
		physics_ignore_frame++;
	} else {
		player_state_set(states.fall);
	}

}
