scr_keys_reset();
chips = instance_nearest(x,y,obj_player_parent).avail_chips;
letters = [];
names = [];
max_cust = instance_nearest(x,y,obj_player_parent).cust_max;
possible_chips = instance_nearest(x,y,obj_player_parent).chip_library;
chip_count = (array_length(possible_chips) > max_cust ? max_cust : array_length(possible_chips));
random_set_seed(current_time)
for(var q = array_length(chips); q < chip_count; q++){
	var _rand = random_range(0, array_length(possible_chips) - 1)
	chips[q] = possible_chips[_rand];
	array_delete(possible_chips, _rand, 1);
}

chip_avail = array_create(array_length(chips),true);
prev_chip_avail = [chip_avail];

index = 0;
selected_chips = [];
reticle_frame = 0;
on_add = false;
palette_init();

if(array_length(chips) == 0){
	pause_set(false,pause_types.none);
	instance_destroy(); 
}