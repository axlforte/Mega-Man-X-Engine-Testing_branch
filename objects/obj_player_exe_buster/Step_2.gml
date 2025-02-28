if(instance_exists(obj_player_parent)){
	with(obj_player_parent){
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
			other.x = x + (p[0] * dir + h_speed);
			other.y = y +  (p[1] * y_dir + v_speed);
			other.x = floor(other.x);
			other.y = floor(other.y);
			other.image_xscale = dir;
		}
		if(shoot_t <= 0)
			instance_destroy(other);
	}
} else {
	instance_destroy();
}