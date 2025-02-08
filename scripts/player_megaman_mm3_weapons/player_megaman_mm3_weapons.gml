function player_megaman_shadow_blade(lvl = -1, t = 0) {
	if(state == states.dolor)
		return;
	if(state == states.walk || state == states.dash)
		player_state_set(states.idle);
	charge_level = -1;
	shoot_direction_index = player_get_aim_direction();
	shoot_animation = "throw";
	shoot_limit = 5;
	player_shoot_pistol_animation();
	player_shoot_projectile(obj_player_megaman_shot_shadow_blade, true);
	shot_id = 0;
}

function player_megaman_gemini_laser(lvl = -1, t = 0) {
	charge_level = -1;
	player_shoot_projectile(obj_player_megaman_shot_gemini_laser);
	shot_id = 0;
}

function player_megaman_needle_cannon(lvl = -1, t = 0) {
	charge_level = -1;
	player_shoot_projectile(obj_player_megaman_shot_needle_cannon_parent);
	shot_id = 0;
	shoot_limit = 0;
}

function player_megaman_magnet_missile(lvl = -1, t = 0) {
	charge_level = -1;
	player_shoot_projectile(obj_player_megaman_shot_magnet_missile);
	shot_id = 0;
}

function player_megaman_top_spin(lvl = -1, t = 0) {
	if(is_on_floor() || state == states.top_spin)
		return;
	weapon_energy[current_weapon] -= player_weapon_get_cost(current_weapon, 0);
	charge_level = -1;
	player_state_set(states.top_spin);
	state_timer = -1;
	shot_id = 0;
}

function player_megaman_hard_knuckle(lvl = -1, t = 0) {
	charge_level = -1;
	player_shoot_projectile(obj_player_megaman_shot_hard_knuckle);
	shot_id = 0;
}

function player_megaman_spark_shot(lvl = -1, t = 0) {
	charge_level = -1;
	player_shoot_projectile(obj_player_megaman_shot_spark_shot);
	shot_id = 0;
}

function player_megaman_search_snake(lvl = -1, t = 0) {
	charge_level = -1;
	player_shoot_projectile(obj_player_megaman_shot_search_snake);
	shot_id = 0;
}