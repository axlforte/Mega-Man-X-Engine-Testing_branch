if(!other.is_on_floor() && (other.key_up || other.key_down) && other.state != states.ladder){
	obj_player_parent.state = states.ladder;
	obj_player_parent.x = x + 16;
	obj_player_parent.top_of_ladder = y;
	//obj_player_parent.xscale = obj_player_parent.xscale * -1;
	obj_player_parent.state_timer = -1;
}