function player_exe_buster() {
	var lvl = (argument_count > 0) ? argument[0] : -1;
	var t = (argument_count > 1) ? argument[1] : 0;

	charge_level = -1;
	shoot_limit = 16;
	shoot_type = shoot_types.normal;

	switch(lvl)
	{
		// Normal shot
		case 0:
			player_shoot_projectile(obj_player_exe_hitscan_1);
		break;
		// Semi-Charged shot
		case 1:
			player_shoot_projectile(obj_player_exe_hitscan_2);
		break;
		// Fully-Charged shot
		case 2:
			player_shoot_projectile(obj_player_exe_hitscan_3);
		break;
	
	}
	instance_create_depth(x,y,depth - 1,obj_player_exe_buster);

}

function player_exe_x_buster_x1(lvl = -1, t = 0) {
	charge_level = -1;
	if (shots_count >= 3) exit;
	shoot_limit = 16;
	shoot_type = shoot_types.normal;
	shoot_animation = "";

	switch(lvl)
	{
		// Normal shot
		case 0:
			player_shoot_projectile(obj_player_x_shot_1);
		break;
		// Semi-Charged shot
		case 1:
			player_shoot_projectile(obj_player_x_shot_2);
		break;
		// Fully-Charged shot
		case 2:
			player_shoot_projectile(obj_player_x_shot_x1_3);
		break;
		// Super-Charged shot
		case 3:
			player_shoot_projectile(obj_player_x_shot_x1_super);
			//player_super_shoot_animation();
		break;
	}
	var _b = instance_create_depth(x,y,depth - 1,obj_player_exe_buster);
	_b.sprite_index = spr_exe_buster_x1;
}

function player_exe_x_buster_x2() {
	var lvl = (argument_count > 0) ? argument[0] : -1;
	var t = (argument_count > 1) ? argument[1] : 0;

	charge_level = -1;
	shoot_limit = 16;
	shoot_type = shoot_types.normal;

	switch(lvl)
	{
		// Normal shot
		case 0:
			player_shoot_projectile(obj_player_x_shot_1);
		break;
		// Semi-Charged shot
		case 1:
			player_shoot_projectile(obj_player_x_shot_2);
		break;
		// Fully-Charged shot
		case 2:
			player_shoot_projectile(obj_player_x_shot_x2_3);
		break;
		// Super-Charged shot
		case 3:
			charge_level = lvl;
			if (t == 0) {
				player_shoot_projectile(obj_player_x_shot_x2_3);
			} else {
				player_shoot_projectile(obj_player_x_shot_x2_super);	
				player_shoot_sequence_end();
			}
			shot_id++;
			break;
		case 4:
			// Keep this charge level, so the player can shoot at this level again
			charge_level = lvl;
			if (t == 0) {
				player_shoot_projectile(obj_player_x_shot_x2_3);
			} else {
				player_shoot_projectile(obj_player_x_shot_x2_super);	
				player_shoot_sequence_end();
			}
			shot_id++;
		break;
	
	}
	var _b = instance_create_depth(x,y,depth - 1,obj_player_exe_buster);
	_b.sprite_index = spr_exe_buster_x2;
}

function player_exe_x_buster_x3() {
	var lvl = (argument_count > 0) ? argument[0] : -1;
	var t = (argument_count > 1) ? argument[1] : 0;

	charge_level = -1;
	shoot_limit = 16;
	shoot_type = shoot_types.normal;

	switch(lvl) {
		// Normal shot
		case 0:
			player_shoot_projectile(obj_player_x_shot_1);
		break;
		// Semi-Charged shot
		case 1:
			player_shoot_projectile(obj_player_x_shot_2);
		break;
		// Fully-Charged shot
		case 2:
			player_shoot_projectile(obj_player_x_shot_x3_3);
		break;
		// Super-Charged shot
		case 3:
			charge_level = lvl;
			if (t == 0) {
				player_shoot_projectile(obj_player_x_shot_x3_super);
			} else if (t == 1) {
				player_shoot_projectile(obj_player_x_shot_x3_3);	
				player_shoot_sequence_end();
			}
			shot_id++;
			break;
		case 4:
			// Keep this charge level, so the player can shoot at this level again
			charge_level = lvl;
			if (t == 0) {
				player_shoot_projectile(obj_player_x_shot_x3_super);
			} else if (t == 1) {
				player_shoot_projectile(obj_player_x_shot_x3_3);	
				player_shoot_sequence_end();
			}
			shot_id++;
		break;
	
	}
	var _b = instance_create_depth(x,y,depth - 1,obj_player_exe_buster);
	_b.sprite_index = spr_exe_buster_x3;
}