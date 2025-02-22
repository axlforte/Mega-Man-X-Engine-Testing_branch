// Pause if this pickup has a pause effect
if (pickup_pause) {
	pause_set(true, pause_types.pickup);	
}
// Waiting time
if (wait_timer > 0) {
	wait_timer--;
	exit;
}

var t = timer++;

// Start
if (t == 0 && pickup_type == pickup_types.wp) {
	// Find weapon to fill
	/*with (target) {
		// If this weapon is full, find other weapon to fill
		if (weapon[0] == noone || 
		weapon_slot_handler.get_energy(weapon[0]) >= global.weapon[weapon[0]].energy_max || 
		global.weapon[weapon[0]].damage_refill != 0) {
			for (var i = 1; i < array_length( weapon_slot_handler.weapons); i++) {
				var wp = weapon_slot_handler.raw_weapon(i);
				if (wp >= 0 && weapon_slot_handler.get_energy(wp) < global.weapon[wp].energy_max && 
				global.weapon[wp].damage_refill == 0) {
					other.weapon_id = weapon_slot_handler.raw_weapon(i);
					other.weapon_fill_other = true;
					other.instant_fill = true;
				}
			}
		} else {
			log(weapon[0])
			other.weapon_id = weapon[0];
		}
	}*/
}

// If the target is dead, ignore this
if (target.hp <= 0 && !target.intro) {
	pause_set(false);
	instance_destroy();
	exit;
}

// Bar Light Shader
if (bar_light) {
	target.bar.light = t mod 2;	
}

if (t >= min_limit && (t mod time_per_unit == 0)) {
	// Check Pickup Item Type
	switch (pickup_type) {
		case pickup_types.heart:
			// Increase health and max health
			target.max_hp++;
			target.hp++;
			global.player_max_health = target.max_hp;
			audio_play(fill_sound);
			break;
		case pickup_types.hp:
			var hp_add = 1;
			if (instant_fill) {
				hp_add = amount;
				amount = 0;
			}
			// Increase health if it's not full
			if (target.hp < target.max_hp) {
				target.hp = min(target.max_hp, target.hp + hp_add);
				audio_play(fill_sound);
			} else {
				amount = 0;
			}
			break;
		case pickup_types.lifeup:
			global.player_lives++;
			break;
		case pickup_types.wp:
			var wp_add = 1; 
			if (weapon_id == -1) {
				amount = 0;
				break;
			}
			// If it's filling a different weapon, it's using the instant fill
			if (instant_fill) {
				wp_add = amount;
				amount = 0;
				audio_play(snd_item_weapon);
			} else {
				audio_play(fill_sound);
			}
			target.weapon_slot_handler.set_energy(weapon_id, min(global.weapon[weapon_id].energy_max, 
			target.weapon_slot_handler.get_energy(weapon_id) + wp_add));
			if (target.weapon_slot_handler.get_energy(weapon_id) >= global.weapon[weapon_id].energy_max) {
				amount = 0;
			}
			break;
	}
	amount--;
	
}
// Amount is over, unpause and destroy this instance
if (amount <= 0) {
	pause_set(false);
	instance_destroy();
}