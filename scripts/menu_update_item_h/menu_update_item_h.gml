function menu_update_item_h() {
	if(selected_item == 0 && hinput_p < 0){
		selected_item = array_length(items) - 1;
	} else if(selected_item == array_length(items) - 1 && hinput_p > 0){
		selected_item = 0;
	} else {
		selected_item = clamp(selected_item + hinput_p, 0, array_length(items) - 1)
	}
	

}
