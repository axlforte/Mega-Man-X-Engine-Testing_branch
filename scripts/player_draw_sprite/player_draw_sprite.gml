/// @function player_draw_sprite()
/// @description Draw Player Sprite with the given arguments
/// @param x
/// @param y
/// @param xscale
/// @param yscale
function player_draw_sprite(_x = x, _y = y, xs = xscale, ys = y_dir, index = floor(image_index)) {
	// Swap Palette
	if (charge_blink) {
		glow_in_dark = true;
		if (charge_palette_enabled) {
			if (charge_blink_t mod 4 <= 1) {
				plt_index = charge_palette;
			}
			else {
				plt_index = global.weapon[weapon[0]].palette;
			}
		}
		charge_blink_t++;
	} else {
		charge_blink_t = 0;
		if (charge_palette_enabled)
			plt_index = global.weapon[weapon[0]].palette;
	}
	
	if (!weapon_allow_pallete && charge_palette_enabled) {
		if (plt_index == global.weapon[weapon[0]].palette)
			plt_index = plt_index_default;
	}
	//do the drawing. you dont need the draw effect to be drawn more than once.
	for (var j = 0; j < array_length(armor_current_order) - 1; j++) {
		var i = armor_current_order[j];
		var p = armor_part_parent[i];
		if (/*sprite_exists(pl_sprite[i]) && */pl_sprite[i] != noone) {
			if (light <= 0) {
				plt_source_index = armor_palette_index[p];
				if (plt_index == 0)
					plt_index = plt_index_default;
				var _plt = plt_texture;
				var _plts = plt_texture_sprite;
				palette_shader();
			} else {
				scr_shader_set(shader_palette_light);	
			}
			draw_sprite_ext(pl_sprite[i], index, floor(_x), floor(_y), xs, ys, rotation, c_white, 1);
			if(instance_exists(obj_player_megaman)){
				var _plt = plt_texture;
				var _plts = plt_texture_sprite;
				plt_texture_sprite = plt_megaman_double_gear;
				plt_texture = sprite_get_texture(plt_megaman_double_gear, 0);
				var _arr = [0,1,1,1,1,2,2,2,2,2,1,1,0,0];
				if(power_gear)
					plt_index = array_get(_arr, gear_pulse_animation mod array_length(_arr)) + 2;
				else if(speed_gear)
					plt_index = array_get(_arr, gear_pulse_animation mod array_length(_arr)) + 5;
				else if(current_weapon == WEAPONS.atomic_fire && charge_t > 2 && charge_t < 22 && charge_t mod 2 == 0)
					plt_index = 8;
				else if(current_weapon == WEAPONS.atomic_fire && charge_t > 22 && charge_t < 42 && charge_t mod 2 == 0)
					plt_index = irandom_range(8,9);
				else if(current_weapon == WEAPONS.atomic_fire && charge_t > 42 && charge_t mod 2 == 0)
					plt_index = irandom_range(8,10);
				else
					plt_index = 1;
				palette_shader();
				plt_texture = _plt;
				plt_texture_sprite = _plts;
				draw_sprite_ext(pl_sprite[i], index, floor(_x), floor(_y), xs, ys, rotation, c_white, 1);
			}
			palette_reset();
		}
	}
}

/// @function player_draw_trail_sprite()
/// @param sprite
/// @param index
/// @param x
/// @param y
/// @param xscale
/// @param yscale
function player_draw_trail_sprite(sprite, index = floor(image_index), _x = x, _y = y, xs = xscale, ys = y_dir, alpha = 1, color = c_white) {	
	if (sprite_exists(sprite) && sprite != noone) {
		draw_sprite_ext(sprite, index, floor(_x), floor(_y), xs, ys, 0, color, alpha);
	}
}