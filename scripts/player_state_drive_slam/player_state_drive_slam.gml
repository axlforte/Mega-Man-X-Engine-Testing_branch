function player_state_drive_slam() {
	var t = state_timer++;

	grav = 0;
	v_speed = 0;
	using_special_weapon = true;

	player_effects_reset();
	
	if (glow_mode == 0) {
		glow_alpha = 0;	
	}
	
	
	
	
	if(substates[0] == 1){
		if(animation_end || (key_left - key_right != 0 && t > 10))
			substates[1] = 1;
		animation_play("slam_end", t);
	} else {
		if (t == 0)
		{
			substates[0] = 0;
			substates[1] = 0;
			audio_play(nova_strike_sound);
			audio_stop(hover_sound);
			player_activate_immunity(immunity_types.normal);
		}
	
		var slam_lim = 4;
	
		if (t >= 0 && t <= slam_lim)
		{
			animation_play("slam", t);
			v_speed = -1.5;
		}
	
		if (t == slam_lim)
		{
			vspeed_max = 128;
		}
		if (t > slam_lim)
		{
			v_speed = 8;
		
		
			if (instance_exists(special_inst))
			{
				special_inst.x = x;
				special_inst.y = y;
			}
		}
		
		if(is_on_floor()){
			substates[0] = 1;
			state_timer = 0;
			t = state_timer;
			if(weapon_slot_handler.get_energy(WEAPONS.x_buster) >= 15){
				weapon_slot_handler.set_energy(WEAPONS.x_buster, 0);
				instance_create_depth(x,y,depth,obj_player_x_shot_giga_drive);
			}
		}
	}

	if (substates[1] == 1)
	{	
		if (state_timer < 20 && state_timer != t + 1)
		{
			audio_stop(nova_strike_sound);	
		}
		vspeed_max = vspeed_max_normal;
		player_counters_reset();
		player_state_set(states.idle, 0);
		animation_play("idle");
		special_inst = instance_try_destroy(special_inst);
	}

	dash_tapped = false;
	player_charge_reset();

	if (state != states.nova_strike)
	{
		charge_enabled = true;
		using_special_weapon = false;
		immunity = false;
	}


}
