scr_keys_update();
if(key_p_shoot){
	changing_number = !changing_number;
	//other.locked = changing_number;
	if(!changing_number){
		keyboard_string = string_copy(keyboard_string,1,string_length(keyboard_string) - 1)
		ip_string = keyboard_string;
	} else {
		keyboard_string = "";
	}
	visible = true;
}

if (clipboard_has_text() && keyboard_check(vk_control) && keyboard_check_pressed(ord("V")))
{
    keyboard_string += clipboard_get_text();
}

if(changing_number){
	visible = !visible;
}

if(key_p_jump){
	server = !server;
}
if(key_p_dash){
	friendly_fire = !friendly_fire;
}

if(key_p_start && !changing_number){
	var _ip = ip_string;
	var _c = global.character_selected;
	var _i = global.character_selected_index;
	global_player_info();
	settings_load();
	settings_apply();
	global.is_server = server;
	global.character_selected = _c;
	global.character_selected_index = _i;
	with(obj_player_parent){
		//instance_destroy();
		y -= 32;
	}
	//instance_create_depth(x,y,depth, obj_player_default);
	if(server){
		global.server = new GameServer(1997);
		instance_create_depth(320, 240, 0, obj_server_status);
		global.client = new GameClient("127.0.0.1", 1997);
		instance_create_depth(0, 0, 0, obj_client_status);
	} else {
		global.client = new GameClient(_ip, 1997);
		instance_create_depth(0, 0, 0, obj_client_status);
	}
	global.pvp = friendly_fire;
	room_restart();
	instance_destroy();
}