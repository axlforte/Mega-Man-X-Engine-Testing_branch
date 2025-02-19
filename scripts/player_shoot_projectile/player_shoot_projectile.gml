function player_shoot_projectile(_object, _affect_direction = false) {
	if(global.is_online){
		var _x = x;
		var _y = y;
		if (ds_map_exists(weapon_offset, animation_sprite_name)) {
				var l = weapon_offset[? animation_sprite_name];
				var p = [0, 0];
				var index = animation_i;
				if (ds_list_size(l) == 1)
					index = 0;
				p = l[| index];
				if (array_length(weapon_dir_offsets) > 0 && index < array_length(weapon_dir_offsets)) {
					var arr = weapon_dir_offsets[index];
					p[0] += arr[0];
					p[1] += arr[1];
				}
				_x += (p[0] * dir + h_speed);
				_y += (p[1] * y_dir + v_speed);
		}
		var _shot = [_object, _x, _y, dir, global.player_server_id];
		global.client.pingProjectile(_shot);
	}
	
	
	var inst = instance_create_depth(x, y, depth - 10, _object);
	inst.image_xscale = dir;
	inst.h_speed = inst.abs_hspeed * dir;
	inst.dir = dir;
	inst.owner = instance_nearest(x,y,obj_player_parent);
	inst.dir_angle = shot_angle;
	inst.dash = inst.dash_enabled && dash_shot_count < dash_shot_limit && (state == states.dash || walk_speed == dash_speed);
	if (inst.dash)
		dash_shot_count++;	
	inst.is_main = true;
	shoot_update_position = true;

	if (_affect_direction) {
		inst.shot_direction_index = shoot_direction_index;
		switch(shoot_direction_index) {
			case 0:
			case 1:
			case 2:
				inst.image_index = shoot_direction_index; break;
			case 3:
				inst.image_index = 1;
				inst.image_yscale = -1; break;
			case 4:
				inst.image_index = 2;
				inst.image_yscale = -1; break;	
		}
		inst.image_index_start = inst.image_index;
		inst.shot_angle = player_get_aim_angle();
		inst.image_index = (inst.image_number / 3) * inst.image_index_start;
	}
	player_add_projectile(inst);
	shots_count++;
	if (previous_charge_level > 0) {
		charged_shots_count++;
		inst.charged_shot = true;
	}
	shoot = true;
	return inst;


}
