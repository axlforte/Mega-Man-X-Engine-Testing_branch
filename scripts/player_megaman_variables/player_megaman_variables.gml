function player_megaman_variables() {
	player_weapon_set(0, weapons.mega_buster);
	player_weapon_select(weapons.mega_buster);
	// Weapon Test
	player_weapon_set(1, weapons.dive_missile);
	player_weapon_set(2, weapons.ring_boomerang);
	player_weapon_set(3, weapons.pharoah_shot);
	player_weapon_set(4, weapons.dust_crusher);
	player_weapon_set(5, weapons.skull_barrier);
	player_weapon_set(6, weapons.flash_stopper);
	player_weapon_set(7, weapons.rain_flush);
	player_weapon_set(8, weapons.drill_bomb);
	/*the real weapon lineup
	player_weapon_set(1, weapons.rolling_cutter);
	player_weapon_set(2, weapons.fire_storm);
	player_weapon_set(3, weapons.hyper_bomb);
	player_weapon_set(4, weapons.ice_slasher);
	player_weapon_set(5, weapons.super_arm);
	player_weapon_set(6, weapons.thunder_beam);
	player_weapon_set(7, weapons.magnet_beam);
	player_weapon_set(8, weapons.metal_blade);
	player_weapon_set(9, weapons.atomic_fire);
	player_weapon_set(10, weapons.air_shooter);
	player_weapon_set(11, weapons.crash_bomb);
	player_weapon_set(12, weapons.leaf_shield);
	player_weapon_set(13, weapons.time_stopper);
	player_weapon_set(14, weapons.bubble_lead);
	player_weapon_set(15, weapons.quick_boomerang);
	player_weapon_set(16, weapons.shadow_blade);
	player_weapon_set(17, weapons.spark_shot);
	player_weapon_set(18, weapons.needle_shot);
	player_weapon_set(19, weapons.search_snake);
	player_weapon_set(20, weapons.gemini_laser);
	player_weapon_set(21, weapons.hard_knuckle);
	player_weapon_set(22, weapons.top_spin);
	player_weapon_set(23, weapons.magnet_missile);
	*/
	player_weapon_set(255, weapons.speed_gear);
	player_weapon_set(256, weapons.power_gear);
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
	for (var i = 0; i < array_length(weapon_max_level); i++) {
		if (i != weapons.mega_buster && i != weapons.atomic_fire) {
			weapon_max_level[i] = 0;	
		}
	}
	trail_mode = 1;
	player_trail_set(8, 2);
	// Energy Drain
	energy_drain_y = 17;
	energy_drain_x = 0;
}