function player_check_megamerge() {
	if (state_unlocked[states.biometal_select] && state_enabled[states.biometal_select] && key_up) {
		player_state_set(states.biometal_select, 0);
	}


}
