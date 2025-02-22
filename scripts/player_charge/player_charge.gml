function player_charge() {
	glow_in_dark = false;
	if (charge && !auto_charge) {
		// Play Audio
		if (charge_level > 0 && !audio_is_playing(charge_sound)) {
			audio_play(charge_sound);
		}
		charge_level = 0;
		// Get correct Charge Level/Sprite/Palette 
		for (var i = 0; i < array_length(charge_limits); i++) {
			if (charge_t >= charge_limits[i]) {
				if (i >= charge_level && i <= charge_level_max && (weapon[0] == noone || i <= G.weapon[weapon[0]].max_level)) {
					charge_level = i;
					if(current_weapon != WEAPONS.atomic_fire){
						charge_sprite = charge_sprites[i];
						charge_palette = charge_palettes[i];
					}
				}
			}
		}
		if (weapon[0] != noone && global.weapon[0].max_level == 0) {
			charge_t = 0;
			audio_stop(charge_sound);
		}
		/*
		if (charge_level > 0 && (charge_t > charge_limits[1]))
		{
			charge_i = (charge_i + 1) mod 22;
		}
		else
		{
			charge_i = 0;	
		}
		charge_image_number = 22;
		*/
		player_charge_image_index_update();
		if (!global.paused && !locked)
			charge_t += charge_speed;
	} else if (auto_charge) {
		player_charge_image_index_update();	
		charge_palette = auto_charge_palette;
		charge_sprite = auto_charge_sprite;
		charge_blink = true;
		if (weapon[0] != noone && !player_weapon_can_spend(weapon[0], charge_level)) {
			charge_sprite = noone;
			charge_blink = false;
		}
	} else {
		charge_i = 0;
		audio_stop(charge_sound);
	}
	// Activate Charge Blinking
	if (charge_level > 0) {
		charge_blink = (charge_t == 0 || (charge_t > charge_limits[1] + 4));
	} else if (!auto_charge) {
		charge_blink = false;	
	}
	

}
