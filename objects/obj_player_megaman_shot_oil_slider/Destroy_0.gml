if(status == oil.stagnant){
	with(obj_player_parent){
		locked = false;
		rotation = 0;
		player_state_set(states.fall, 0);
	}
}
event_inherited();

