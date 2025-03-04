scr_keys_update();
if(!on_add){
	var _gi = index;
	if(key_p_right){
		if(_gi == 4){
			on_add = true;
		}
		_gi++;
	} else if(key_p_left){
		_gi--;
		if(_gi == -1){
			on_add = true;
		}
	} else if(key_p_down){
		_gi+=5;
	} else if(key_p_up){
		_gi-=5;
	}

	index = (_gi + array_length(chips)) mod array_length(chips);

	if(key_p_shoot && chip_avail[index] && array_length(selected_chips) < 5){
		array_push(selected_chips,chips[index]);
		
		chip_avail[index] = false;
		array_push(letters,chips[index].code);
		array_push(names,chips[index].name);
		for(var e = 0; e < array_length(letters); e++){
			for(var q = 0; q < chip_count; q++){
				if(chips[q].code != letters[e] && chips[q].name != names[e] && chips[q].code != "*" && letters[e] != "*"){
					chip_avail[q] = false;
				}
			}
		}
	}
	if(key_p_shoot2 && array_length(selected_chips) > 0){
		chip_avail = array_create(array_length(chips),true);
		array_pop(letters);
		array_pop(selected_chips);
		
		for(var e = 0; e < array_length(letters); e++){
			for(var q = 0; q < chip_count; q++){
				if((chips[q].name != names[e] && chips[q].code != letters[e] && chips[q].code != "*" && letters[e] != "*")
				|| chips[q] == selected_chips[e]){
					chip_avail[q] = false;
				}
			}
		}
	}
} else {
	if(key_p_left){
		on_add = false;
		index = min(4,array_length(chips));
	}
	
	if(key_p_right){
		on_add = false;
		index = 0;
	}
	
	if(key_p_shoot){
		for(var e = 0; e < array_length(selected_chips); e++){
			for(var h = 0; h < array_length(chips); h++){
				if(chips[h] == selected_chips[e])
					array_delete(chips,h,1);
			}
		}
		
		for(var e = 0; e < array_length(chips); e++){
			for(var h = 0; h < array_length(possible_chips); h++){
				if(chips[e] == possible_chips[h])
					array_delete(possible_chips,h,1);
			}
		}
		
		with(obj_player_parent){
			chip_selection = other.selected_chips;
			avail_chips = other.chips;
			chip_library = other.possible_chips;
		}
		pause_set(false,pause_types.none);
		instance_destroy();
	}
}