for(var z = 0; z < array_length(global.player_xs); z++){
	if(z != global.player_server_id){
		var _y = 0;
		palette_shader();
		if(z < array_length(global.player_palettes))
			plt_index = global.player_palettes[z];
		else
		plt_index = 0;
		palette_texture_set(plt_x_full);
		if(z < array_length(global.player_chars)){
<<<<<<< HEAD
=======
			if(array_length(global.player_palettes) > z)
			log(string(global.player_palettes[z]) + " is the palette, and " + 
			string(global.player_chars[z]) + " is the player!");
>>>>>>> origin/master
			
			if(global.player_chars[z] == pl_char.x)
				palette_texture_set(plt_x_full);
			if(global.player_chars[z] == pl_char.zero)
				palette_texture_set(plt_zero);
			if(global.player_chars[z] == pl_char.axl)
				palette_texture_set(plt_axl);
			if(global.player_chars[z] == pl_char.megaman)
				palette_texture_set(plt_megaman_full);
		}
		if(!is_undefined(global.player_sprites[z]) && global.player_sprites[z] != -4){
<<<<<<< HEAD
			
			if(array_length(global.player_x_vel) > z)
				global.player_xs[z] += global.player_x_vel[z];
				
			if(array_length(global.player_y_vel) > z && array_length(global.player_grav) > z){
				global.player_ys[z] += global.player_y_vel[z];
				global.player_y_vel[z] += global.player_grav[z];
			}
			
=======
>>>>>>> origin/master
			draw_sprite_ext(
				global.player_sprites[z],
				global.player_frames[z],
				global.player_xs[z],
				global.player_ys[z],
				global.player_dirs[z],
				1,0,c_white,1
				);
			palette_reset();
			if(z < array_length(global.player_names))
				draw_string_center(
					global.player_xs[z] - x,
					global.player_ys[z] - 32 - y,
					global.player_names[z],
					colors.orange,
					false);
		}
	}
}

if(instance_exists(obj_player_parent))
	depth = instance_nearest(0,0,obj_player_parent).depth;
	
//ping counter. jitters though
x = __view_get(e__VW.XView, 0);
y = __view_get(e__VW.YView, 0);
//draw_string(0, 0, $"Ping:{global.client.ping}", colors.orange, false);