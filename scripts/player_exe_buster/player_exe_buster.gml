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
			player_shoot_projectile(obj_player_x_shot_1);
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
