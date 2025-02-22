function player_state_safety_teleoport() {
	var t = state_timer++;

	if(t == 0){
		locked = true;
		physics_ignore_frame = 2;
	}
	animation_play("tp",0);
	if(instance_exists(obj_teleport_point)){
		var _t = instance_nearest(x,y,obj_teleport_point);
		move_to_point(_t.x, _t.y, 10);
		physics_ignore_frame++;
	} else {
		player_state_set(states.fall);
	}

}
