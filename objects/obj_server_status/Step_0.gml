scr_keys_update();
if(key_p_right){
	room_id++;
	if(room_id > array_length(room_array) - 1){
		room_id = 0;
	}
}

if(key_p_left){
	room_id--;
	if(room_id < 0){
		room_id = array_length(room_array) - 1;
	}
}

if(key_p_jump){
	if(!is_undefined(global.server)){
		global.server.change_room(room_array[room_id]);
		current_room = room_id;
	}
}