function player_megaman_ring_boomerang(lvl = -1, t = 0) {
	charge_level = -1;
	shoot_type = shoot_types.normal;
	shoot_limit = 16;
	shoot_animation = "throw";
	player_shoot_projectile(obj_player_megaman_shot_ring_boomerang);
	shot_id = 0;
}

function player_megaman_pharoah_shot(lvl = -1, t = 0) {
	charge_level = -1;
	shoot_type = shoot_types.normal;
	shoot_limit = 16;
	shoot_animation = "";
	player_shoot_projectile(obj_player_megaman_shot_pharoah_shot);
	shot_id = 0;
}

function player_megaman_dust_crusher(lvl = -1, t = 0) {
	charge_level = -1;
	shoot_type = shoot_types.normal;
	shoot_limit = 16;
	shoot_animation = "";
	player_shoot_projectile(obj_player_megaman_shot_dust_crusher);
	shot_id = 0;
}

function player_megaman_drill_bomb(lvl = -1, t = 0) {
	charge_level = -1;
	shoot_type = shoot_types.normal;
	shoot_limit = 16;
	shoot_animation = "";
	player_shoot_projectile(obj_player_megaman_shot_drill_bomb);
	shot_id = 0;
}

function player_megaman_skull_barrier(lvl = -1, t = 0) {
	charge_level = -1;
	shoot_type = shoot_types.normal;
	shoot_limit = 16;
	shoot_animation = "";
	player_shoot_projectile(obj_player_megaman_shot_skull_barrier);
	shot_id = 0;
}

function player_megaman_rain_flush(lvl = -1, t = 0) {
	charge_level = -1;
	shoot_type = shoot_types.normal;
	shoot_limit = 16;
	shoot_animation = "";
	player_shoot_projectile(obj_player_megaman_shot_rain_flush);
	shot_id = 0;
}

function player_megaman_flash_stopper(lvl = -1, t = 0) {
	if(instance_exists(obj_player_megaman_shot_flash_stopper))
		return;
	charge_level = -1;
	shoot_type = shoot_types.normal;
	shoot_limit = 16;
	shoot_animation = "";
	player_shoot_screen_cleaner(obj_player_megaman_shot_flash_stopper);
	shot_id = 0;
}

function player_megaman_dive_missile(lvl = -1, t = 0) {
	charge_level = -1;
	shoot_type = shoot_types.normal;
	shoot_limit = 16;
	shoot_animation = "";
	player_shoot_projectile(obj_player_megaman_shot_dive_missile);
	shot_id = 0;
}