function player_x_buster_drive() {
	var lvl = weapon_slot_handler.get_energy(WEAPONS.x_buster);
	var t = (argument_count > 1) ? argument[1] : 0;

	charge_level = -1;
	shoot_limit = 16;
	shoot_type = shoot_types.normal;

	var cst = 1;
	
	

	if(lvl < 4 && lvl != 0){
		player_shoot_projectile(obj_player_x_shot_1);
	} else if(lvl > 3 && lvl < 9){
		player_shoot_projectile(obj_player_x_shot_2_drive);
		cst = 2;
	} else if(lvl > 8 && lvl < 15){
		player_shoot_projectile(obj_player_x_shot_3_drive);
		cst = 3;
	}else if(lvl >= 15){
		player_shoot_projectile(obj_player_x_shot_4_drive);
		cst = 6;
	}
	
	var wp = WEAPONS.x_buster;
	var energy = weapon_slot_handler.locate_energy(wp), energy_max = global.weapon[wp].energy_max;
	weapon_slot_handler.set_energy(wp, clamp(energy - cst, 0, energy_max));


}
