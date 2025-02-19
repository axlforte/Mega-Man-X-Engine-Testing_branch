var _size = 1024;
if(array_length(global.player_xs) < _size)
	_size = array_length(global.player_xs);
if(array_length(global.player_sprites) < _size)
	_size = array_length(global.player_sprites);
if(array_length(global.player_xs) < _size)
	_size = array_length(global.player_xs);
if(array_length(global.player_frames) < _size)
	_size = array_length(global.player_frames);
if(array_length(global.player_ys) < _size)
	_size = array_length(global.player_ys);
if(array_length(global.player_dirs) < _size)
	_size = array_length(global.player_dirs);
if(array_length(global.player_chars) < _size)
	_size = array_length(global.player_chars);

for(var z = 0; z < array_length(global.player_xs); z++){
	if(z != global.player_server_id){
		var _y = 0;
		palette_shader();
		plt_index = global.player_palettes[z];
		palette_texture_set(plt_x_full);
		if(z < array_length(global.player_chars)){
			
			log(string(global.player_palettes[z]) + " is the palette, and " + 
			string(global.player_chars[z]) + " is the player!");
			
			if(global.player_chars[z] == pl_char.x)
				palette_texture_set(plt_x_full);
			if(global.player_chars[z] == pl_char.zero)
				palette_texture_set(plt_zero);
			if(global.player_chars[z] == pl_char.axl)
				palette_texture_set(plt_axl);
			if(global.player_chars[z] == pl_char.megaman)
				palette_texture_set(plt_megaman_full);
		}
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
			draw_string(
				global.player_xs[z] - x,
				global.player_ys[z] - 32 - y,
				global.player_names[z],
				colors.orange,
				false);
	}
}
//ping counter. jitters though
x = __view_get(e__VW.XView, 0);
y = __view_get(e__VW.YView, 0);
//draw_string(0, 0, $"Ping:{global.client.ping}", colors.orange, false);