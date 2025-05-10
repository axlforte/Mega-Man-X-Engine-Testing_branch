function menu_set_state() {
	state_next = argument[0];

	if (state_next < array_length(page_items))
	{
		items_next = page_items[state_next];
	}

	wait_t = (argument_count > 1 ? argument[1] : 0);
	input_timer = (argument_count > 2 ? argument[2] : 15);
	var _color = (argument_count > 3 ? argument[3] : c_black);
	if (wait_t == 0)
	{
		var tran = transition_create(transition_types.fade_out_and_fade_in);
		tran.transition_limit = input_timer;
		tran.wait_timer = 0;
		tran.color = _color;
		timer += tran.wait_timer;
	}
	timer += floor(input_timer / 2);


}
