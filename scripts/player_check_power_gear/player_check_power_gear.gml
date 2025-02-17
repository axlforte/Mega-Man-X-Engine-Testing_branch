function player_check_power_gear() {
	var wp = WEAPONS.speed_gear;
	if (!power_gear && weapon_slot_handler.get_energy(wp) == global.weapon[wp].energy_max) {
		power_gear_enabled = true;
	}
	if (power_gear) {
		if (global.tile_shader_multiplier > 0.6) {
			global.tile_shader_multiplier -= 0.05;
		} else {
			global.tile_shader_multiplier = 0.6;	
		}
		weapon_refill_enabled[wp] = false;
		power_gear_enabled = player_weapon_spend(wp);
		gear_pulse_animation++;
		if (!power_gear_enabled || key_p_special2) {
			player_disable_power_gear();
		}
	}
	else if (key_p_special2 && !power_gear && power_gear_enabled) {
		power_gear = true;
		//trail_sprites_enabled = true;
		//trail_sprites_remove = false;
		//power gear doesnt have a trail like speed gear
		weapon_refill_enabled[wp] = false;
		audio_play(snd_megaman_speed_gear_start);
		var effect = player_effect_create(normal_gear_effect);
		effect.sprite_index = power_gear_sprite;
	}
}
function player_disable_power_gear() {
	if (power_gear) {
		audio_play(snd_megaman_speed_gear_end);
		power_gear = false;
		gear_pulse_animation = 0;
		trail_sprites_enabled = false;
		trail_sprites_remove = true;
		weapon_slot_handler.set_refill(WEAPONS.power_gear)
	}
}