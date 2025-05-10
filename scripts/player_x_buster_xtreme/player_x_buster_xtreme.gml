function player_x_buster_xtreme(lvl = -1, t = 0) {
	charge_level = -1;
	if (shots_count >= 3) exit;
	shoot_limit = 16;
	shoot_type = shoot_types.normal;
	shoot_animation = "";

	switch(lvl)
	{
		// Normal shot
		case 0:
			player_shoot_projectile(obj_player_x_shot_xtreme_1);
		break;
		// Semi-Charged shot
		case 1:
			player_shoot_projectile(obj_player_x_shot_xtreme_2);
		break;
		// Fully-Charged shot
		case 2:
			player_shoot_projectile(obj_player_x_shot_xtreme_3);
		break;
		// Super-Charged shot
		case 3:
			player_shoot_projectile(obj_player_x_shot_xtreme_3);
			//player_super_shoot_animation();
		break;
	}


}
