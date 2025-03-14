function player_x_buster_drive() {
	var lvl = weapon_slot_handler.get_energy(WEAPONS.x_buster);
	var t = (argument_count > 1) ? argument[1] : 0;

	charge_level = -1;
	shoot_limit = 16;
	shoot_type = shoot_types.normal;

	var cst = 0;
	
	

	if(lvl < 8 && lvl != 0){
		player_shoot_projectile(obj_player_x_shot_2_drive);
		cst = 2;
	} else if(lvl > 7 && lvl < 15){
		player_shoot_projectile(obj_player_x_shot_3_drive);
		cst = 3;
	}else if(lvl >= 15){
		player_shoot_projectile(obj_player_x_shot_4_drive);
		cst = 6;
	} else {
		player_shoot_projectile(obj_player_x_shot_1);
	}
	
	var wp = WEAPONS.x_buster;
	var energy = weapon_slot_handler.locate_energy(wp), energy_max = global.weapon[wp].energy_max;
	weapon_slot_handler.set_energy(wp, clamp(energy - cst, 0, energy_max));


}
