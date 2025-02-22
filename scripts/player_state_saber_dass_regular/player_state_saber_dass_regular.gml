function player_state_saber_dass_regular() {
	var t = state_timer++;
	var st = state;

	// Attacking
	if (substates[0] == 0) {
		// State Properties
		saber_atk_current = saber_atk;
	
		// First Frame
		if (t == 0) {
			animation = "";
			audio_play(saber_atk_sound);
		}
	
		if (t <= 5)
			move_x(dir * dash_speed); 
		else if(t <= 10)
			move_x(dir * dash_speed * 0.9); 
		else if(t <= 15)
			move_x(dir * dash_speed * 0.8); 
		else if(t <= 20)
			move_x(dir * dash_speed * 0.65); 
		else if(t <= 25)
			move_x(dir * dash_speed * 0.45); 
		else if(t <= 30)
			move_x(dir * dash_speed * 0.2); 
	
		if (t < 1)
			animation_play(saber_atk_animation, t);

		if (animation_end || !is_on_floor())
			substates[0] = 1; // End

		var cancel_attack = (state != st);

		if (cancel_attack || substates[0] == 1) {
			state_timer = 0;
			if (!cancel_attack)
				animation_play(saber_atk_animation + "_end");
			if(!is_on_floor())	
				state = states.saber_jump;
			saber_atk_next = false;
		}
	} else {
		saber_atk_current = noone;
		if (animation_end || animation != saber_atk_animation + "_end") {
			player_check_fall();
			player_check_idle();
			if(!is_on_floor())	
				state = states.saber_jump;
		}
		// Action Scripts
		player_check_walk();
		player_check_dash();
		player_check_jump();
	}
	// Air
	if (!is_on_floor())
		player_check_move();

	if (state != st) {
		saber_state = noone;
		saber_atk = noone;
		saber_atk_current = noone;	
	}


}
