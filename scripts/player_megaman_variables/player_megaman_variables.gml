function player_megaman_variables() {
	player_weapon_set(0, WEAPONS.mega_buster);
	player_weapon_select(WEAPONS.mega_buster);
	// Weapon Test
	player_weapon_set(1, WEAPONS.rolling_cutter);
	player_weapon_set(2, WEAPONS.fire_storm);
	player_weapon_set(3, WEAPONS.hyper_bomb);
	player_weapon_set(4, WEAPONS.ice_slasher);
	player_weapon_set(5, WEAPONS.super_arm);
	player_weapon_set(6, WEAPONS.thunder_beam);
	player_weapon_set(7, WEAPONS.magnet_beam);
	player_weapon_set(8, WEAPONS.metal_blade);
	player_weapon_set(9, WEAPONS.atomic_fire);
	player_weapon_set(10, WEAPONS.air_shooter);
	player_weapon_set(11, WEAPONS.crash_bomb);
	player_weapon_set(12, WEAPONS.leaf_shield);
	player_weapon_set(13, WEAPONS.time_stopper);
	player_weapon_set(14, WEAPONS.bubble_lead);
	player_weapon_set(15, WEAPONS.quick_boomerang);
	player_weapon_set(16, WEAPONS.shadow_blade);
	player_weapon_set(17, WEAPONS.spark_shot);
	player_weapon_set(18, WEAPONS.needle_shot);
	player_weapon_set(19, WEAPONS.search_snake);
	player_weapon_set(20, WEAPONS.gemini_laser);
	player_weapon_set(21, WEAPONS.hard_knuckle);
	player_weapon_set(22, WEAPONS.top_spin);
	player_weapon_set(23, WEAPONS.magnet_missile);
	player_weapon_set(24, WEAPONS.dive_missile);
	player_weapon_set(25, WEAPONS.ring_boomerang);
	player_weapon_set(26, WEAPONS.pharoah_shot);
	player_weapon_set(27, WEAPONS.dust_crusher);
	player_weapon_set(28, WEAPONS.skull_barrier);
	player_weapon_set(29, WEAPONS.flash_stopper);
	player_weapon_set(30, WEAPONS.rain_flush);
	player_weapon_set(31, WEAPONS.drill_bomb);
	player_weapon_set(32, WEAPONS.gravity_hold);
	player_weapon_set(33, WEAPONS.power_stone);
	player_weapon_set(34, WEAPONS.water_wave);
	player_weapon_set(35, WEAPONS.gyro_attack);
	player_weapon_set(36, WEAPONS.crystal_eye);
	player_weapon_set(37, WEAPONS.napalm_bomb);
	player_weapon_set(38, WEAPONS.charge_kick);
	player_weapon_set(39, WEAPONS.star_crash);
	player_weapon_set(100, WEAPONS.arctic_coverage);
	
	player_weapon_set(200, WEAPONS.speed_gear);
	player_weapon_set(201, WEAPONS.power_gear);
	player_special_weapons_add(states.speed_gear);
	player_special_weapons_add(states.power_gear);

	// Charge
	charge_unlocked = true;
	charge_sound = snd_megaman_charge;
	
	// Mobile buttons
	mobile_buttons_set_sprite(spr_megaman_mobile_buttons);
	mobile_weapon_swap_set_sprites(spr_mobile_megaman_weapon1, spr_mobile_megaman_weapon2);
	// Complete
	complete_effect.x = -3;
	complete_effect.y = -9;
	complete_effect_limit = 2;
	outro_complete_animation = "outro_complete";

	glow_enabled = true;
	charge_palettes = [0, 1, 3, 3, 3];
	glow_circle_subtract = [
		{alpha: 0.2, radius: 40 },
		{alpha: 1, radius: 28 }
	];
	
	//disabled for later forte to handle. i aint doin all dat
	
	//for (var i = 0; i < array_length(weapon_max_level); i++) {
		//if (i != WEAPONS.mega_buster && i != WEAPONS.atomic_fire) {
			//weapon_max_level[i] = 0;	
		//}
	//}
	trail_mode = 1;
	player_trail_set(8, 2);
	// Energy Drain
	energy_drain_y = 17;
	energy_drain_x = 0;
}