function player_check_drive_slam() {
	if (key_special && !is_on_floor() && state != states.drive_slam)
	{
		player_state_set(states.drive_slam, 0);
		animation = "";
		animation_play("slam");
		dash_air_count++;
		
		
	}
	
	if(weapon_slot_handler.get_energy(WEAPONS.x_buster) > 14){
		G.weapon[WEAPONS.x_buster].set_color(current_time);
	} else if(weapon_slot_handler.get_energy(WEAPONS.x_buster) > 8){
		G.weapon[WEAPONS.x_buster].set_color(8);
	} else {
		G.weapon[WEAPONS.x_buster].set_color(7);
	}


}
