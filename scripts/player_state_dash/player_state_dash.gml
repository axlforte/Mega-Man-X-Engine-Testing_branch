function player_state_dash() {
	var t = state_timer++;
	dash_air = (substates[0] == 1);
	dash_up = (substates[1] == 1);
	dash_end = (substates[2] == 1);
	// Dash (Not End)
	if (!dash_end) {
		// Dash (Horizontal)	
		if (!dash_up) {
		    var condition = (t == dash_length + 1);
			if(substates[3])
				condition = false;
    
		    if (t == 0) {
		        // Play Audio
		        audio_play(dash_sound);
				if(dash_is_slide)
					substates[3] = true;
				else 
					substates[3] = false;
				mask_index = state_hitbox[states.dash];
		        if (dash_air) {
		            dash_length = dash_air_length;
		            v_speed = 0;
		        } else {
					dash_length = dash_normal_length;
				}
				
				if(perfect_dash_jump){
					special_inst = instance_try_destroy(special_inst);
				}
		    }
			
			
    
		    if (t >= 0 && t <= dash_length) {
		        // Animation
		        if (is_on_floor() || dash_air)
					animation_play("dash");
        
		        // Gravity
		        if (dash_air) {
					grav = 0;
					v_speed = 0;
				}
				xscale = dir;
		
		    }
		    // Dash Spark
		    if (t == 1) {
		        dash_spark_inst = player_effect_create(dash_spark);
		    }
		    // Dash Movement
		    if (t >= 1 && t <= dash_length) {
		        if (!move_x(dash_speed * dash_dir * (dash_speed_increase * dash_speed_increase_increment + 1)) || (!is_on_floor() && !dash_air))
					condition = true;
        
				// Dash Dust
				if (instance_exists(dash_dust) && dash_dust.script != noone)
					script_execute(dash_dust.script);	
		    }
		    // Dash Spark - Reset Relative Position
		    if (t == 1 || t == 2)
				player_effect_pos_reset(dash_spark_inst);
    
		    var result = key_right - key_left;
			if(substates[3]){
				if(instance_place(x,y - 20, obj_block_parent) && state_timer > 3){
					result = dash_dir;
				}
			}
			
			if (!dash_tapped) {
			    condition |= !key_dash;
			} else {
				condition |= (result != dash_dir);
			}
			condition |= (result != 0 && result != dash_dir);
			
			if(substates[3]){
				if(instance_place(x,y - 20, obj_block_parent) && state_timer > 3){
					if (dash_air) {
						state_timer = dash_air_length - 2;
			        } else {
						state_timer = dash_normal_length - 2;
					}
					if (!can_move_x(dash_speed * dash_dir) || (!is_on_floor() && !dash_air))
						condition = true;
					else 
						condition = false;
				}
			}
    
		    if (condition) {
		        dash_spark_inst = player_effect_destroy(dash_spark_inst);
		
		        if ((key_p_jump) || !is_on_floor()) {
					walk_speed = dash_speed;
			
		            if (is_on_floor()) {
						mask_index = state_hitbox[states.idle];
						state_set(states.idle, 0);
						y_dir = 1;
		            } else {
						if (move != 0) {
							mask_index = state_hitbox[states.idle];
							state_set(states.fall, 8);
							//dash_air_count++;
						} else {
							state_timer = 0;
							substates[2] = 1;
						}
					}

					dash_tapped = false;
		            dash_tap = false;
		        }
        
		        if (!key_p_jump && is_on_floor(3)) {
		            walk_speed = walk_speed_default;
		            v_speed = 0;
					substates[2] = 1;
					state_timer = 0;
		            move_down();
		            player_counters_reset();
		        }
        
		    }
			if(perfect_dash_jump && weapon_slot_handler.get_energy(WEAPONS.x_buster) >= 5){
				if (!instance_exists(special_inst)) {
					special_inst = instance_create_depth(x, y, depth - 1, obj_player_x_aura_drive);
					special_inst.image_xscale = dir;
				}
				special_inst.image_xscale = dir;
				special_inst.x = x + h_speed;
				special_inst.y = y + v_speed;
			}
		}
		// Dash (Vertical)
		else {
			var condition_to_end = (t == dash_length + 1 || (key_p_jump && is_on_floor()));
	
			if (!dash_tapped) {
		        condition_to_end |= !key_dash;
		    } else {
				condition_to_end |= !key_up;
			}
			if (t == 0) {
				dash_length = dash_up_length;
			    v_speed = 0;
				xscale = dir;
				animation = "";
			}
	
			if (t == dash_up_start_time - 3)
				dash_spark_inst = player_effect_create(dash_up_spark);
	
			if (t >= 0 && t <= dash_length) {
				animation_play("dash_up");
				grav = 0;
				v_speed = 0;
			}
	
			if (array_contains([1, 3, 7, 9, 11, 13, 15, 16], t))
				condition_to_end |= !move_contact_block(0, -1);
	
			if (t == dash_up_start_time)
				audio_play(dash_sound);	
	
			if (t >= dash_up_start_time && t <= dash_up_start_time + 1)
				condition_to_end |= !move_contact_block(0, -2);
	
			if (t >= dash_up_start_time + 2 && t <= dash_length)
				condition_to_end |= !move_contact_block(0, -5);
	
			if (condition_to_end) {
				// Dash End
				substates[2] = 1;
				state_timer = 0;
		
				walk_speed = dash_speed;
				player_effect_destroy(dash_spark_inst);
			}
		}
	}
	// Dash End
	else {
		mask_index = state_hitbox[states.idle];
		player_check_move();
		if (is_on_floor())
			walk_speed = walk_speed_default;
	    // Horizontal
		if (!dash_up) {
			if (t <= 6 || is_on_floor(3) || dash_air) animation_play("dash_end");
		}// Vertical
		else {
			animation_play("dash_up_end")
		}
	
		var end_lag = 0;
		if(perfect_dash_jump)
			end_lag = 4;
	
		if ((t >= 7 && animation_end) || (key_left ^^ key_right) && end_lag < t) {   
		    dash_tapped = false;
		    dash_tap = false;
			y_dir = 1;
		
			player_state_set(states.idle, 0);
			animation_play("idle", 0);
			if (!is_on_floor(3)) {
				mask_index = state_hitbox[states.idle];
				animation_play("fall", 8);
				player_state_set(states.fall, 8);
			}
		
			substates[0] = 0;
			substates[1] = 0;
			substates[2] = 0;
		}
	}

	// Action Scripts
	player_check_walk();
	//if (!dash_end)
	player_check_dash();
	player_check_jump();
	player_check_wall_slide();
	player_check_wall_jump();
	player_check_dodge_roll();

	// Changed State
	if (state != states.dash) {
		dash_spark_inst = player_effect_destroy(dash_spark_inst);
		//instance_try_destroy(special_inst);
		dash_tapped = false;
		y_dir = 1;
		if (key_down && crouch_unlocked)
			state_hitbox_current = state_hitbox[states.crouch];
	}
}
