function player_check_jump() {
	if (key_p_jump) {
		var can_jump = player_can_jump();
		if (can_jump) {
			if (state == states.dash){
				walk_speed = dash_speed;
				if(perfect_dash_jump){
					dash_speed_increase++;
					dash_speed_increase = clamp(dash_speed_increase,0, dash_speed_increase_max);
					walk_speed *= dash_speed_increase * dash_speed_increase_increment + 1;
					
					var wp_change = 2;
					
					if(dash_end)
						wp_change = 3;
					
					var wp = WEAPONS.x_buster;
					var energy = weapon_slot_handler.locate_energy(wp), energy_max = global.weapon[wp].energy_max;
					weapon_slot_handler.set_energy(wp, clamp(energy + wp_change, 0, energy_max));
				}
			}
			state_set(states.jump, 1, [0]);
			animation_play("jump");
			voice_play();
			v_speed = -jump_strength;
			mask_index = state_hitbox[states.idle];
			if (state_unlocked[states.high_jump] && key_up) {
				v_speed = -high_jump_strength;
				grav = 0;
				substates[0] = 1; // High Jump
				dash_air_count++;
			}
		    audio_play(jump_sound);
		}
		
		if (can_jump == 2)
			dash_air_count++;
		if (can_jump == 3){
			dash_air_count++;
			v_speed = -4;
			var wp = WEAPONS.x_buster;
			var energy = weapon_slot_handler.locate_energy(wp), energy_max = global.weapon[wp].energy_max;
			weapon_slot_handler.set_energy(wp, clamp(energy - drive_double_jump_cost, 0, energy_max));
		}
	}


}
