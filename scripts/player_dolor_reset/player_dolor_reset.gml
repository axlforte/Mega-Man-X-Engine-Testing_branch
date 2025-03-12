function player_dolor_reset() {
	// Shoot
	shoot = false;
	shoot_t = 0;
	shoot_animation = "";
	shoot_limit = 15;
	shoot_next_animation = "";
	shoot_at_time = 0;
	shoot_projectile = noone;
	shoot_next_wait = false;
	shoot_wait = false;
	shoot_cancel_on_wall = false;
	shoot_type = shoot_types.normal;
	using_special_weapon = false;
	charge_enabled = true;
	y_dir = 1;

	if(perfect_dash_jump){
		dash_speed_increase = 0;
					
		var wp = WEAPONS.x_buster;
		var energy = weapon_slot_handler.locate_energy(wp), energy_max = global.weapon[wp].energy_max;
		weapon_slot_handler.set_energy(wp, clamp(energy - 3, 0, energy_max));
	}
}
