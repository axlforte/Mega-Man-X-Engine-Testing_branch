function player_megaman_variables() {
	
	state_hitbox[states.dash] = spr_megaman_crouch_mask;
	state_hitbox[states.crouch] = spr_megaman_crouch_mask;
	
	weapon_slot_handler.add_weapon(WEAPONS.mega_buster);
	player_weapon_select(WEAPONS.mega_buster);
	// Weapon Test
	weapon_slot_handler.add_weapon(WEAPONS.rolling_cutter);
	weapon_slot_handler.add_weapon(WEAPONS.fire_storm);
	weapon_slot_handler.add_weapon(WEAPONS.hyper_bomb);
	weapon_slot_handler.add_weapon(WEAPONS.ice_slasher);
	weapon_slot_handler.add_weapon(WEAPONS.super_arm);
	weapon_slot_handler.add_weapon(WEAPONS.thunder_beam);
	weapon_slot_handler.add_weapon(WEAPONS.magnet_beam);
	
	weapon_slot_handler.add_weapon(WEAPONS.metal_blade);
	weapon_slot_handler.add_weapon(WEAPONS.atomic_fire);
	weapon_slot_handler.add_weapon(WEAPONS.air_shooter);
	weapon_slot_handler.add_weapon(WEAPONS.crash_bomb);
	weapon_slot_handler.add_weapon(WEAPONS.leaf_shield);
	weapon_slot_handler.add_weapon(WEAPONS.time_stopper);
	weapon_slot_handler.add_weapon(WEAPONS.bubble_lead);
	weapon_slot_handler.add_weapon(WEAPONS.quick_boomerang);
	
	weapon_slot_handler.add_weapon(WEAPONS.shadow_blade);
	weapon_slot_handler.add_weapon(WEAPONS.spark_shot);
	weapon_slot_handler.add_weapon(WEAPONS.needle_shot);
	weapon_slot_handler.add_weapon(WEAPONS.search_snake);
	weapon_slot_handler.add_weapon(WEAPONS.gemini_laser);
	weapon_slot_handler.add_weapon(WEAPONS.hard_knuckle);
	weapon_slot_handler.add_weapon(WEAPONS.top_spin);
	weapon_slot_handler.add_weapon(WEAPONS.magnet_missile);
	
	/*weapon_slot_handler.add_weapon(WEAPONS.dive_missile);
	weapon_slot_handler.add_weapon(WEAPONS.ring_boomerang);
	weapon_slot_handler.add_weapon(WEAPONS.pharoah_shot);
	weapon_slot_handler.add_weapon(WEAPONS.dust_crusher);
	weapon_slot_handler.add_weapon(WEAPONS.skull_barrier);
	weapon_slot_handler.add_weapon(WEAPONS.flash_stopper);
	weapon_slot_handler.add_weapon(WEAPONS.rain_flush);
	weapon_slot_handler.add_weapon(WEAPONS.drill_bomb);
	
	weapon_slot_handler.add_weapon(WEAPONS.gravity_hold);
	weapon_slot_handler.add_weapon(WEAPONS.power_stone);
	weapon_slot_handler.add_weapon(WEAPONS.water_wave);
	weapon_slot_handler.add_weapon(WEAPONS.gyro_attack);
	weapon_slot_handler.add_weapon(WEAPONS.crystal_eye);
	weapon_slot_handler.add_weapon(WEAPONS.napalm_bomb);
	weapon_slot_handler.add_weapon(WEAPONS.charge_kick);
	weapon_slot_handler.add_weapon(WEAPONS.star_crash);
	
	weapon_slot_handler.add_weapon(WEAPONS.yamato_spear);
	weapon_slot_handler.add_weapon(WEAPONS.centaur_flash);
	weapon_slot_handler.add_weapon(WEAPONS.plant_barrier);
	weapon_slot_handler.add_weapon(WEAPONS.knight_crusher);
	weapon_slot_handler.add_weapon(WEAPONS.wind_storm);
	weapon_slot_handler.add_weapon(WEAPONS.silver_tomahawk);
	weapon_slot_handler.add_weapon(WEAPONS.flame_blast);
	weapon_slot_handler.add_weapon(WEAPONS.blizzard_attack);
	
	weapon_slot_handler.add_weapon(WEAPONS.snow_drift);*/
	
	weapon_slot_handler.add_weapon(WEAPONS.speed_gear);
	weapon_slot_handler.add_weapon(WEAPONS.power_gear);
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