function player_vent_armor() {
	// Default
	palette_texture_set(plt_vent_full);
	plt_index_default = 0;

	special_weapons = ds_list_create();
	//weapons_script[weapons.x_buster] = player_x_buster_x2;
	charge_level_max = 2;

	//armors are as follows:
	//Human - none - 0
	//X - 1
	//ZX - 2
	//PX - 3
	//LX - 4
	//HX - 5
	//FX - 6
	//OX - 7
	//O1X - 8
	
	//the system fucked up so I am gonna have both the name and the id number
	//by eachother until i can get a professional doctor (dark) to take a look
	
	if (BODY != "" || FULL != "") {
		damage_reduction = 0.5;
		state_unlocked[states.dash] = true;
		state_unlocked[states.crouch] = false;
		state_unlocked[states.wall_slide] = true;
		state_unlocked[states.wall_jump] = true
		state_unlocked[states.db_buster] = true;
		dolor_animation = "dolor2";
		shoot_unlocked = true;
	}
	
	if(FULL == "" || FULL == 0){
		state_unlocked[states.dash] = false;
		state_unlocked[states.crouch] = true;
		state_unlocked[states.wall_slide] = false;
		state_unlocked[states.wall_jump] = false;
		state_unlocked[states.db_buster] = false;
		shoot_unlocked = false;
		saber_unlocked = false;
	}

	#region model x
		if (FULL == "x" || FULL == 1) {
			//dash_air_unlocked = true;
			dolor_animation = "dolor";
			weapon[0] = weapons.x_buster;
			weapon[2] = noone;
		}
	#endregion
	#region model zx
		if (FULL == "zx" || FULL == 2) {
			//dash_air_unlocked = true;
			dolor_animation = "dolor";
			saber_unlocked = true;
			weapon[2] = weapons.x_buster;
			weapon[0] = noone;
		}
	#endregion
	#region model px
		if (FULL == "px" || FULL == 3) {
			//dash_air_unlocked = true;
			dolor_animation = "dolor";
		}
	#endregion
	#region model lx
		if (FULL == "lx" || FULL == 4) {
			//dash_air_unlocked = true;
			dolor_animation = "dolor";
		}
	#endregion
	#region model hx
		if (FULL == "hx" || FULL == 5) {
			//dash_air_unlocked = true;
			dolor_animation = "dolor";
		}
	#endregion
	#region model fx
		if (FULL == "fx" || FULL == 6) {
			//dash_air_unlocked = true;
			dolor_animation = "dolor";
		}
	#endregion
	
	show_debug_message(FULL);
}
