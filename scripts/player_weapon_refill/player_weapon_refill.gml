/// @description Refills all weapons
/// @param is_damage
function player_weapon_refill() {
	for (var i = 0; i < array_length(weapon_slot_handler.weapons); i++) {
		var wp = weapon_slot_handler.weapons[i];
		if (wp >= 0 && global.weapon[wp].refill_enabled) {
			var refill_rate = argument[0] ? global.weapon[wp].damage_refill : global.weapon[wp].fill_rate;
			var energy = weapon_slot_handler.get_energy(i), energy_max = global.weapon[wp].energy_max;
			//weapon_slot_handler.set_energy(wp, clamp(energy + refill_rate, 0, energy_max));
			//log(energy);
			weapon_slot_handler.set_energy(wp,(energy + refill_rate));
			/*if (keyboard_check(ord("9")))
				weapon_energy[wp] = energy_max;*/
			if (energy != energy_max && weapon_slot_handler.get_energy(wp) == energy_max) {
				audio_play(global.weapon[wp].full_sound);
				if (audio_exists(global.weapon[wp].full_sound))
					glow_type = 1;
			}
		}
	}


}
