function player_megaman_rolling_cutter(lvl = -1, t = 0) {
	charge_level = -1;
	shoot_type = shoot_types.normal;
	shoot_limit = 16;
	shoot_animation = "throw";
	player_shoot_projectile(obj_player_megaman_shot_rolling_cutter);
	shot_id = 0;
}

function player_megaman_fire_storm(lvl = -1, t = 0) {
	charge_level = -1;
	shoot_type = shoot_types.normal;
	shoot_limit = 16;
	shoot_animation = "";
	player_shoot_projectile(obj_player_megaman_shot_fire_storm);
	shot_id = 0;
}

function player_megaman_super_arm(lvl = -1, t = 0) {
	if(grabbing_block){
		with(par_destructibleobject){
			if(status == blockie.grabbed){
				status = blockie.thrown;
				dir = other.dir;
			}
		}
	} else {
		if(instance_place(x + 16 * dir, y, par_destructibleobject)){
			instance_place(x + 16 * dir, y, par_destructibleobject).status = blockie.grabbed;
			audio_play(snd_player_land);
		} else {
			with(par_destructibleobject){
				if(status == blockie.grabbed){
					status = blockie.thrown;
					v_speed = -3;
					dir = other.dir;
				}
			}
			player_state_set(states.idle);
		}
	}
}

function player_megaman_ice_slasher(lvl = -1, t = 0) {
	charge_level = -1;
	shoot_type = shoot_types.normal;
	shoot_limit = 16;
	shoot_animation = "";
	if(power_gear)
		player_shoot_projectile(obj_player_x_shot_storm_tornado);
	else
		player_shoot_projectile(obj_player_megaman_shot_ice_slasher);
	shot_id = 0;
}

function player_megaman_hyper_bomb(lvl = -1, t = 0) {//this one may not be implemented for a bit
	charge_level = -1;
	shoot_type = shoot_types.normal;
	shoot_limit = 16;
	shoot_animation = "throw";
	player_shoot_projectile(obj_player_megaman_shot_hyper_bomb);
	shot_id = 0;
}

function player_megaman_thunder_beam(lvl = -1, t = 0) {
	charge_level = -1;
	shoot_type = shoot_types.normal;
	shoot_limit = 16;
	shoot_animation = "";
	player_shoot_projectile(obj_player_megaman_shot_thunder_wave_horizontal);
	shot_id = 0;
}

function player_megaman_oil_slider(lvl = -1, t = 0) {
	charge_level = -1;
	shoot_type = shoot_types.normal;
	shoot_limit = 16;
	shoot_animation = "";
	player_shoot_projectile(obj_player_megaman_shot_oil_slider);
	shot_id = 0;
}

function player_megaman_time_slow(lvl = -1, t = 0) {
	if(instance_exists(obj_player_megaman_shot_time_slow))
		return;
	charge_level = -1;
	shoot_type = shoot_types.normal;
	shoot_limit = 16;
	shoot_animation = "";
	player_shoot_screen_cleaner(obj_player_megaman_shot_time_slow);
	shot_id = 0;
}

function player_megaman_magnet_beam(lvl = -1, t = 0) {
	charge_level = -1;
	shoot_type = shoot_types.normal;
	shoot_limit = 16;
	shoot_animation = "";
	player_shoot_projectile(obj_player_megaman_shot_magnet_beam_manager);
	shot_id = 0;
}