function player_check_custom_screen() {
	if (key_p_wp1 || key_p_wp2) && weapon_slot_handler.locate_energy(WEAPONS.hub_buster) >= 28 {
		global.paused = true;
		global.pause_type = pause_types.custom_screen;
		instance_create_depth(x,y,-10000, obj_player_exe_custom_menu);
		weapon_slot_handler.set_energy(WEAPONS.hub_buster,0);
	}
}
