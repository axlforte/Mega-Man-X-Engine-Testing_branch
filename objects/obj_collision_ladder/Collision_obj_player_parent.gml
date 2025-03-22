var _grounded = false;
with(other){
	_grounded = is_on_floor();
}

if(_grounded && (other.key_up || other.key_down) && other.state != states.ladder){
	obj_player_parent.state = states.ladder;
	obj_player_parent.x = x + 16;
	obj_player_parent.top_of_ladder = y;
	obj_player_parent.state_timer = -1;
}