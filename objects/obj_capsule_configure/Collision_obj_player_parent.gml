if(other.key_p_down){
	part = clamp(part + 1,1,4);
} else if(other.key_p_up){
	part = clamp(part - 1,1,4);
} else if(other.key_p_left){
	a_index = clamp(a_index - 1, 0, array_length(armor_array) - 1);
	armor = armor_array[a_index];
} else if(other.key_p_right){
	a_index = clamp(a_index + 1, 0, array_length(armor_array) - 1);
	armor = armor_array[a_index];
} else if(other.key_p_shoot){
	if(!is_undefined(capusle)){
		capusle.state = 0;
		capusle.armor = armor;
		capusle.part = part;
	}
}