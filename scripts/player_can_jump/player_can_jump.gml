function player_can_jump() {
	var can_jump_air = (double_jump_unlocked
			&& dash_air_count < dash_air_limit
			&& !is_on_floor()
			&& (jumpable_wall_dir() == 0)
			&& !is_on_ceil());
	var can_jump_drive = false;
	if(perfect_dash_jump){//i use this for mostly just drive armor. kind of a bad habit but idc
		can_jump_drive = (weapon_slot_handler.get_energy(WEAPONS.x_buster) >= drive_double_jump_cost
			&& dash_air_count < dash_air_limit
			&& !is_on_floor()
			&& (jumpable_wall_dir() == 0)
			&& !is_on_ceil());
	}
	
	
	if (is_on_floor())
		return 1;
	if (can_jump_air)
		return 2;
	if (can_jump_drive)
		return 3;
	return 0;


}
