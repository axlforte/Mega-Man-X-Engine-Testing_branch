function player_check_speed_gear() {
	var wp = WEAPONS.speed_gear;
	if (!speed_gear && weapon_slot_handler.get_energy(wp) == global.weapon[wp].energy_max) {
		speed_gear_enabled = true;
	}
	if (speed_gear) {
		if (global.tile_shader_multiplier > 0.6) {
			global.tile_shader_multiplier -= 0.05;
		} else {
			global.tile_shader_multiplier = 0.6;	
		}
		weapon_refill_enabled[wp] = false;
		speed_gear_enabled = player_weapon_spend(wp);
		gear_pulse_animation++;
		if (!speed_gear_enabled || key_p_special) {
			player_disable_speed_gear();
		}
	}
	else if (key_p_special && !speed_gear && speed_gear_enabled) {
		speed_gear = true;
		if(instance_exists(obj_player_megaman_shot_time_stopper))
			global.game_world_speed = 0;
		else if(instance_exists(obj_player_megaman_shot_time_slow))
			global.game_world_speed = 0;
		else
			global.game_world_speed = speed_gear_speed;
		//local_game_speed = 0.8;
		trail_sprites_enabled = true;
		trail_sprites_remove = false;
		weapon_refill_enabled[wp] = false;
		audio_play(snd_megaman_speed_gear_start);
		var effect = player_effect_create(normal_gear_effect);
		effect.sprite_index = speed_gear_sprite;
		room_image_speed_set(speed_gear_speed);
	}
}
function player_disable_speed_gear() {
	if (speed_gear) {
		audio_play(snd_megaman_speed_gear_end);
		room_image_speed_set(1);
		speed_gear = false;
		if(instance_exists(obj_player_megaman_shot_time_slow))
			global.game_world_speed = 0.25;
		else if(instance_exists(obj_player_megaman_shot_time_stopper))
			global.game_world_speed = 0;
		else 
			 global.game_world_speed = 1;
		//local_game_speed = 1;
		gear_pulse_animation = 0;
		trail_sprites_enabled = false;
		trail_sprites_remove = true;
		weapon_slot_handler.set_refill(WEAPONS.speed_gear)
	}
}