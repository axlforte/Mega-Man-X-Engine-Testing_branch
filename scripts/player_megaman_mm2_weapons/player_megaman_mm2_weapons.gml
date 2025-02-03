function player_megaman_metal_blade(lvl = -1, t = 0) {
	if(state == states.dolor)
		return;
	if(state == states.walk || state == states.dash)
		player_state_set(states.idle);
	charge_level = -1;
	shoot_direction_index = player_get_aim_direction();
	shoot_animation = "throw";
	shoot_limit = 5;
	player_shoot_pistol_animation();
	player_shoot_projectile(obj_player_megaman_shot_metal_blade, true);
	shot_id = 0;
}

function player_megaman_quick_boomerang(lvl = -1, t = 0) {
	charge_level = -1;
	player_shoot_projectile(obj_player_megaman_shot_quick_boomerang);
	shot_id = 0;
}

function player_megaman_leaf_shield(lvl = -1, t = 0) {
	charge_level = -1;
	player_shoot_projectile(obj_player_megaman_shot_leaf_shield);
	shot_id = 0;
}

function player_megaman_time_stopper(lvl = -1, t = 0) {
	if(instance_exists(obj_player_megaman_shot_time_stopper))
		return;
	charge_level = -1;
	player_shoot_screen_cleaner(obj_player_megaman_shot_time_stopper);
	shot_id = 0;
}

function player_megaman_atomic_fire(lvl = -1, t = 0) {
	charge_level = -1;
	shoot_limit = 16;
	shoot_type = shoot_types.normal;
	shoot_animation = "";

	switch(lvl)	{
		// Normal shot
		case 0:
			if(power_gear)
				player_shoot_projectile(obj_player_megaman_shot_atomic_fire_3);
			else
				player_shoot_projectile(obj_player_megaman_shot_atomic_fire);
		break;
		// Semi-Charged shot
		case 1:
			if(power_gear)
				player_shoot_projectile(obj_player_megaman_shot_atomic_fire_4);
			else
				player_shoot_projectile(obj_player_megaman_shot_atomic_fire_2);
		break;
		// Fully-Charged shot
		case 2:
			if(power_gear)
				player_shoot_projectile(obj_player_megaman_shot_atomic_fire_5);
			else
				player_shoot_projectile(obj_player_megaman_shot_atomic_fire_3);
		break;
	}
}

function player_megaman_bubble_lead(lvl = -1, t = 0) {
	charge_level = -1;
	player_shoot_projectile(obj_player_megaman_shot_bubble_lead);
	shot_id = 0;
}

function player_megaman_air_shooter(lvl = -1, t = 0) {
	charge_level = -1;
	player_shoot_projectile(obj_player_megaman_shot_air_shooter);
	shot_id = 0;
}

function player_megaman_crash_bomb(lvl = -1, t = 0) {
	charge_level = -1;
	player_shoot_projectile(obj_player_megaman_shot_crash_bomb);
	if(power_gear){
		player_shoot_projectile(obj_player_megaman_shot_crash_bomb_diagonal);
		player_shoot_projectile(obj_player_megaman_shot_crash_bomb_diagonal);
		player_shoot_projectile(obj_player_megaman_shot_crash_bomb_diagonal);
		player_shoot_projectile(obj_player_megaman_shot_crash_bomb_down);
	}
	shot_id = 0;
}

function player_megaman_item_1(lvl = -1, t = 0) {
	charge_level = -1;
	player_shoot_projectile(obj_player_megaman_shot_lightning_bolt);
	shot_id = 0;
}

function player_megaman_item_2(lvl = -1, t = 0) {
	charge_level = -1;
	player_shoot_projectile(obj_player_megaman_shot_lightning_bolt);
	shot_id = 0;
}

function player_megaman_item_3(lvl = -1, t = 0) {
	charge_level = -1;
	player_shoot_projectile(obj_player_megaman_shot_lightning_bolt);
	shot_id = 0;
}
