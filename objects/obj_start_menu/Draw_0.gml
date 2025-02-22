draw_set_offset(0, 0);

switch(state) {
	#region Main
	case menu_states.main:
		//draw_sprite(spr_start_menu, 0, 0, 0);
		animation2_draw();
		for (var i = 0; i < items_length; i++) {
			var item = items[i];
			var _x = 128, _y = 140 + 24*i;
			draw_string(_x, _y, item[0], (selected_item == i ? colors.orange : colors.blue));
			if (selected_item == i) draw_string(_x - 16, _y, "▶", colors.orange);
		}
		draw_string(252, 224, "v" + GM_version);
		if (!global.support_shaders)
			draw_string(4, 224, "NO SHADER SUPPORT");
	break;
	#endregion
	#region Game Mode/Difficulty Mode
	case menu_states.game_mode:
	case menu_states.difficulty_mode:
		draw_string_center(160, 8, titles[state], colors.gray);
		for (var i = 0; i < items_length; i++) {
			var item = items[i];
			var _x = 112, _y = 92 + 24*i;
			draw_string(_x, _y, item[0], (selected_item == i ? colors.orange : colors.blue));
			if (selected_item == i) draw_string(_x - 16, _y, "▶", colors.orange);
		}
		break;
	#endregion
	#region weapon select
	case menu_states.weapon_select:
		draw_set_color(c_white);
		draw_rectangle(8,0,144,240,false);
		var _plt = 32;
		for(var i = 0; i < 11; i++){
			var _p = selected_item - 5 + i;
			
			if(i == 6)
			_plt = 64;
				
			if(_p < G.weapon_chunk[weapon_player_selected][0])
				_p += G.weapon_chunk[weapon_player_selected][1] - G.weapon_chunk[weapon_player_selected][0];
			else if(_p > G.weapon_chunk[weapon_player_selected][1])
				_p -= G.weapon_chunk[weapon_player_selected][1] - G.weapon_chunk[weapon_player_selected][0];
			draw_sprite(weapon_icons, _p, 9, 
			i * 26 - 18 + (weapon_lerp * (weapon_lerp_distance / weapon_lerp_time)) * weapon_lerp_direction);
			draw_string(23, i * 26 - 18 + (weapon_lerp * (weapon_lerp_distance / weapon_lerp_time)) * weapon_lerp_direction,
			string_upper(G.weapon[_p].name), colors.blue);
		}
		palette_shader();
		plt_index = _plt;
		draw_sprite(spr_megaman_idle, 0, 164, 143);
		palette_reset();
		//lines
		draw_rectangle(236, 0, 238, 160,false);
		draw_rectangle(144, 160, 320, 162,false);
		//the buttons
		draw_string(240, 2, "SAVE", colors.orange);
		draw_string(288, 2, "ALL", colors.orange);
		break;
	#endregion
	#region Player Select
	case menu_states.player_select:
		var item = items[selected_item];
		draw_sprite(spr_player_select_backgrounds, background_index, 0, 0);
		if(selected_item == 0){
			draw_sprite_ext(spr_mugshot_default,array_length(items) - 1,7,160,1,1,0,c_white,1);
		} else {
			draw_sprite_ext(spr_mugshot_default,selected_item - 1,7,160,1,1,0,c_white,1);
		}
		
		if(selected_item == array_length(items) - 1){
			draw_sprite_ext(spr_mugshot_default,0,267,160,1,1,0,c_white,1);
		} else {
			draw_sprite_ext(spr_mugshot_default,selected_item + 1,267,160,1,1,0,c_white,1);
		}
		menu_draw_player(0, 0, selected_item, armor_index,0,0,[0, 0, 0, 0, 0, 0],1,1,c_white);
		draw_string_center(270, 13, item);
		draw_sprite(spr_box_cover,0,-3,150);
		draw_sprite(spr_box_cover,0,257,150);
		menu_draw_buttons();
		break;
	#endregion
	#region Armor Select
	case menu_states.armor_select:
		menu_draw_player(0, 0, G.character_selected_index[0], tmp_armor_index,1,1);
		for (var i = 0; i <= pl_btn.confirm; i++) {
			if (item_show[i]) {
				var pos = item_pos[i];
				draw_sprite(item_sprite[i], item_image_index[i], pos[0], pos[1]);	
			}
		}
		if (substates[0] == 1) {
			var pos = item_scroll_pos[selected_item];
			var text = item_string[selected_item];
			draw_sprite(sprite_scroll, 0, pos[0], pos[1]);
			var xx = floor((pos[0] + sprite_get_width(sprite_scroll) / 2)) - 2;
			draw_string_center(xx, pos[1] + 1, text);
			menu_draw_buttons();
		}
		break;
	#endregion
	#region Options
	case menu_states.option:
		draw_string_center(160, 8, titles[state], colors.gray);
		for (var i = 0; i < items_length; i++) {
			var item = items[i];
			var _x = 64, _y = 64 + 24*i;
			draw_string(_x, _y, item[0], (selected_item == i ? colors.pink : colors.dark_blue));
			if (selected_item == i) draw_string(_x - 16, _y, "▶", colors.pink);
			if (array_length(item) > 2) {// Back
				var subitem = item[2];
				var txt = "";
				var index = global.settings[i];
				/*if (i == 0 && G.mobile) {
					index -= 3;
				}*/
				if (index < array_length(subitem)) {
					txt = subitem[index];
				}
				draw_string_center(_x + 176, _y, txt, colors.orange);
				menu_item_draw_arrows(_x + 176, _y, index, subitem, colors.orange);
				
			}
		}
	break;
	#endregion
	#region Key Config
	case menu_states.key_config:
		draw_string_center(160, 8, titles[state], colors.gray);
		for (var i = 1; i < items_length; i++) {
			var item = items[i];
			var _x = 64, _y = 32 + 10*i;
			// BACK
			if (i == items_length - 1) _x = 144;
			var item_name = item[0];
			// Gamepad
			var _color = (selected_item == i ? colors.pink : colors.dark_blue);
			var show_subitem = array_length(item) > 2;
			var sub_text = "";
			if (i >= 1 && i <= 4 && global.settings[1] == 1) {
				sub_text = " ";
				switch(i) {
					case 1: item_name = "GAMEPAD INDEX "; sub_text = global.gamepad_list_index break;
					case 2: item_name = global.gp_name; _color = colors.orange; break;
					case 3: item_name = "MOVEMENT"; sub_text = gamepad_movement_mode_text[global.gp_movement]; break;
					case 4: item_name = "----------------"; break;
				}
			}
			draw_string(_x, _y, item_name, _color);
			if (selected_item == i) {
				draw_string(_x - 16, _y, "▶", colors.pink);
			}
			if (show_subitem) {
				
				var subitems = item[2];
				var txt = "";
				if (sub_text == "")
					txt = ((global.settings[1] == input_types.keyboard) ? subitems[0] : subitems[1])
				else
					txt = sub_text;
				if (selected_item == i && substates[0] == 1) {
					txt = " ";
					if (item_blink_t < 15) txt = "-";
				}
				draw_string(_x + 144, _y, txt, colors.orange);
			}
		}
		menu_draw_buttons();
		break;
	#endregion
	#region Stage Select
	case menu_states.stage_select:
		for (var i = 0; i < 10; i++) {
			var pos = stage_select_positions[i];
			var _boss = global.boss_slot[i];
			
			if (_boss != noone) {
				var info = global.boss_info[_boss];
				draw_sprite(info[1], 0, pos[0], pos[1]);
			}
		}
		draw_sprite(spr_stage_select, 0, 0, 0);
		if (selected_item < 10) {
			var pos = stage_select_positions[selected_item];
			var _boss = global.boss_slot[selected_item];
			animation2_pos[0] = pos;
			if (_boss != noone) {
				var info = global.boss_info[_boss];
				if (sprite_exists(info[2])) {
					draw_sprite(info[2], 0, 176, 85);
				}
			}
		}
		animation2_draw();
		break;
	#endregion
	#region Boss Intro
	case menu_states.boss_intro:
		if (sprite_exists(boss_intro_sprite))
			draw_sprite(boss_intro_sprite, boss_intro_index, 0, 0);
		if (boss_name_show) {
			text_set_font(text_fonts.big);
			draw_string_center(160, 196, boss_name);
			text_set_font(text_fonts.normal);
		}
		//if (global.mobile) {
			draw_string(16, 220, loading_text);
		//}
		break;	
	#endregion
	#region Audio Settings
	case menu_states.audio_settings:
		draw_string_center(160, 8, titles[state], colors.gray);
		for (var i = 0; i < items_length; i++) {
			var item = items[i];
			var _x = 64, _y = 64 + 24*i;
			draw_string(_x, _y, item[0], (selected_item == i ? colors.pink : colors.dark_blue));
			if (selected_item == i)
				draw_string(_x - 16, _y, "▶", colors.pink);
			var value = "";
			switch (i) {
				case 0: value = G.voice_language; break;	
			}
			draw_string_center(_x + 176, _y, value, colors.orange);
		}
		break;
	#endregion
	#region Volume Settings
	case menu_states.volume:
		draw_string_center(160, 8, titles[state], colors.gray);
		draw_string(176,64,string_hash_to_newline(string(global.sfx_volume)),colors.dark_blue);
		draw_string(176,88,string_hash_to_newline(string(global.bgm_volume)),colors.dark_blue);
		for (var i = 0; i < items_length; i++) {
			var item = items[i];
			var _x = 64, _y = 64 + 24*i;
			draw_string(_x, _y, item[0], (selected_item == i ? colors.pink : colors.dark_blue));
			if (selected_item == i)
				draw_string(_x - 16, _y, "▶", colors.pink);
		}
		
		break;
	#endregion
	#region Voice Language
	case menu_states.voice_language:
		draw_string_center(160, 8, titles[state], colors.gray);
		for (var i = 0; i < items_length; i++) {
			var item = items[i];
			var _x = 112, _y = 68 + 24*i;
			draw_string(_x, _y, item[0], (selected_item == i ? colors.orange : colors.blue));
			if (selected_item == i) draw_string(_x - 16, _y, "▶", colors.orange);
		}
		break;
	#endregion
	#region Weapon Get
	case menu_states.weapon_get:
	
		var p = weapon_get_props.player;
		draw_sprite(spr_weapon_get_background, background_index, 0, 0);
		var index = global.character_selected_index[0];
		if (p.visible) {
			menu_draw_player(p.x, p.y, index, global.player_character_armor_index[index], p.palette_sprite, p.palette_index, p.palette_array);
		}	
		break;
	#endregion
}