scr_keys_update();
if(key_p_shoot){
	changing_number = !changing_number;
	if(!changing_number){
		keyboard_string = string_copy(keyboard_string,1,string_length(keyboard_string) - 1)
		ip_string = keyboard_string;
	} else {
		keyboard_string = "";
	}
}

if(key_p_jump){
	server = !server;
}

if(key_p_start){
	var _ip = ip_string;
	if(server){
		global.server = new GameServer(1997);
		instance_create_depth(320, 240, 0, obj_server_status);
		room_speed = 240;
		display_reset(0,false);
		instance_destroy();
	} else {
		global.client = new GameClient(_ip, 1997);
		instance_create_depth(0, 0, 0, obj_client_status);
		instance_create_depth(0, 0, 0, obj_lobby);
		instance_destroy();
		room_goto(rm_test_stage);
	}
	global.is_server = server;
	global.is_online = true;
}

if(key_p_left && !changing_number){
	num--;
	if(num < 0)
		num = 3;
}
if(key_p_right && !changing_number){
	num++;
	if(num > 3)
		num = 0;
}