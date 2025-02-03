function player_state_super_arm_grab() {
	var t = state_timer++;

	if(t > 6)
		animation_play("throw", 0);
	else
		animation_play("throw");

	if(t == 5){
		if(instance_place(x + 16 * dir, y, par_destructibleobject)){
			instance_place(x + 16 * dir, y, par_destructibleobject).status = blockie.grabbed;
			audio_play(snd_player_land);
		} else {
			with(par_destructibleobject){
				if(status == blockie.grabbed){
					status = blockie.thrown;
					v_speed = -3;
					dir = other.dir;
				}
			}
			player_state_set(states.idle);
		}
	}
	
	if(t > 10 && key_p_shoot){
		with(par_destructibleobject){
			if(status == blockie.grabbed){
				status = blockie.thrown;
				dir = other.dir;
			}
		}
		animation_play("throw");
		rotation = 1;
	}
	
	if(rotation > 0){
		if(rotation < 9){
			rotation++
		} else {
			rotation = 0;
			player_state_set(states.idle);
		}
	}
}
