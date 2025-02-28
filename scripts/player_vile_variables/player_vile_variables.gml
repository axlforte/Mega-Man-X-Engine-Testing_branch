function player_vile_variables() {
	state_unlocked[states.dash] = false;
	weapon_hold_mode = true;
	walk_speed_default = 2.25;
	player_weapon_set(0, WEAPONS.vile_vulcan);
	player_weapon_select(WEAPONS.vile_vulcan);
	//weapon_fill_rate = 0.1;

	// Outro
	teleport_outro_reset_weapon = false;
}
