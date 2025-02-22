function player_bass_variables() {
	player_weapon_set(0, weapons.bass_buster);
	player_weapon_select(weapons.bass_buster);
	// Weapon Test

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
		if (i != weapons.mega_buster) {
			weapon_max_level[i] = 0;	
		}
	}
	trail_mode = 1;
	player_trail_set(8, 2);
	// Energy Drain
	energy_drain_y = 17;
	energy_drain_x = 0;
}