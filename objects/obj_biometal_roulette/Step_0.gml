scr_keys_update();

if(key_p_left){
	if(index > array_length(availible_biometals) - 2){
		index = 0;
	} else {
		index++;
	}
	shift = 3;
	dir = -1;
	spr4 = spr3;
}

if(key_p_right){
	if(index < 1){
		index = array_length(availible_biometals) - 1;
	} else {
		index--;
	}
	shift = 3;
	dir = 1;
	spr4 = spr2;
}

if((key_p_up) && can_select){
	if(index == 1){
		sound_play(snd_player_x_shot_2);
	} else {
		var mp = instance_nearest(x,y,obj_player_parent);
		mp.biometal_transform = true;
		//mp.biometal_index = index;
		mp.biometal_selected = index;
		show_debug_message(index);
		instance_destroy();
	}
}

if(!can_select){
	can_select = true;
}