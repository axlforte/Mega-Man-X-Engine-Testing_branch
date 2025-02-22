/// @description Step
event_inherited();

scr_keys_update();

if (destroy) {
	h_speed = 0;
}
else {
	var t = timer++;
	
	if(key_p_shoot && angle_dist == angle_dist_max){
		detached = true;
		dir = owner.dir;
	}
	
	//angle += angle_rotation_speed + sqrt(clamp(angle_dist_max - angle_dist, 0, 256));
	angle += angle_rotation_speed + (angle_dist_max - angle_dist);// i want fast spinnythat
	if(detached){
		x += dir * 3;
	} else {
		x = global.player_x;
		y = global.player_y;
	}
	//x += sin(angle / 180 * pi) * angle_dist;
	//y += cos(angle / 180 * pi) * angle_dist;
	if(angle_dist < angle_dist_max){
		angle_dist += 2;//0.75
	} else {
		angle_dist = angle_dist_max;
		//angle += angle_rotation_speed
		if(!power_gear_made_projectiles && is_power_geared){
			power_gear_made_projectiles = true;
			instance_create_depth(__view_get(e__VW.XView, 0) + 80,__view_get(e__VW.YView, 0) + 4,depth, obj_player_megaman_shot_leaf_shield_power_gear);
			instance_create_depth(__view_get(e__VW.XView, 0) + 140,__view_get(e__VW.YView, 0) + 4,depth, obj_player_megaman_shot_leaf_shield_power_gear);
			instance_create_depth(__view_get(e__VW.XView, 0) + 200,__view_get(e__VW.YView, 0) + 4,depth, obj_player_megaman_shot_leaf_shield_power_gear);
			instance_create_depth(__view_get(e__VW.XView, 0) + 260,__view_get(e__VW.YView, 0) + 4,depth, obj_player_megaman_shot_leaf_shield_power_gear);
		}
	}
}