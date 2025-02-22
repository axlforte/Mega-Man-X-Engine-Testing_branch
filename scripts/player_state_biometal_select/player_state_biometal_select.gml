function player_state_biometal_select() {
	var t = state_timer++;
	shoot_enabled = false;
	immortal = true;
	
	grav = 0;
	v_speed = 0;
	h_speed = 0;
	
	if(t == 0){
		animation_play("biometal_select");
		instance_create_depth(x,y,-600,obj_biometal_roulette);
	}
	
	if(biometal_transform && biometal_index == 0){
		animation_play("biometal_transform_in");
		sound_play(snd_player_x_nova_strike);
		biometal_index = t + 16;
	}
	
	if(biometal_transform && biometal_index < t) {
		if(biometal_selected == 0){
			G.player_character_armor[pl_char.vent][5] = vent_armor.none;
			armor = global.player_character_armor[pl_char.vent];
		biometal_index = t + 12;
		} else if(biometal_selected == 1){
			G.player_character_armor[pl_char.vent][5] = vent_armor.x;
			armor = global.player_character_armor[pl_char.vent];
		biometal_index = t + 26;
		} else {
			G.player_character_armor[pl_char.vent][5] = vent_armor.zx;
			armor = global.player_character_armor[pl_char.vent];	
		biometal_index = t + 26;
		}
		
		armor_check = 1;
		animation_play("biometal_transform_out");
		biometal_transform = false;
	}
	
	if(biometal_index != 0 && biometal_index < t){
		biometal_index = 0;
		if(is_on_floor()){
			state_set(states.idle);
		} else {
			state_set(states.fall);
		}
		immortal = false;
		shoot_enabled = true;
	}
}
