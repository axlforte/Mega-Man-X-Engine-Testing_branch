function player_megaman_water_wave(lvl = -1, t = 0) {
	charge_level = -1;
	shoot_type = shoot_types.normal;
	shoot_limit = 16;
	shoot_animation = "throw";
	player_shoot_projectile(obj_player_megaman_shot_water_wave);
	shot_id = 0;
}

function player_megaman_charge_kick(lvl = -1, t = 0) {
	charge_level = -1;
	shoot_type = shoot_types.normal;
	shoot_limit = 16;
	shoot_animation = "";
	player_shoot_projectile(obj_player_megaman_shot_charge_kick);
	shot_id = 0;
}

function player_megaman_gyro_attack(lvl = -1, t = 0) {
	charge_level = -1;
	shoot_type = shoot_types.normal;
	shoot_limit = 16;
	shoot_animation = "";
	player_shoot_projectile(obj_player_megaman_shot_gyro_attack);
	shot_id = 0;
}

function player_megaman_crystal_eye(lvl = -1, t = 0) {
	charge_level = -1;
	shoot_type = shoot_types.normal;
	shoot_limit = 16;
	shoot_animation = "";
	player_shoot_projectile(obj_player_megaman_shot_crystal_eye);
	shot_id = 0;
}

function player_megaman_napalm_bomb(lvl = -1, t = 0) {
	charge_level = -1;
	shoot_type = shoot_types.normal;
	shoot_limit = 16;
	shoot_animation = "";
	player_shoot_projectile(obj_player_megaman_shot_napalm_bomb);
	shot_id = 0;
}

function player_megaman_star_crash(lvl = -1, t = 0) {
	charge_level = -1;
	shoot_type = shoot_types.normal;
	shoot_limit = 16;
	shoot_animation = "";
	player_shoot_projectile(obj_player_megaman_shot_star_crash);
	shot_id = 0;
}

function player_megaman_gravity_hold(lvl = -1, t = 0) {
	charge_level = -1;
	shoot_type = shoot_types.normal;
	shoot_limit = 16;
	shoot_animation = "";
	player_shoot_screen_cleaner(obj_player_megaman_shot_gravity_hold);
	shot_id = 0;
}

function player_megaman_power_stone(lvl = -1, t = 0) {
	charge_level = -1;
	shoot_type = shoot_types.normal;
	shoot_limit = 16;
	shoot_animation = "";
	player_shoot_projectile(obj_player_megaman_shot_power_stone);
	shot_id = 0;
}