function player_exe_armors() {
	// Default
	plt_index_default = 0;
	global.weapon[WEAPONS.hub_buster].code = player_exe_buster;
	charge_level_max = 2;

	if (BODY == "team") {
		walk_speed_default = 2;
		dash_speed = 4;
	}
	
	if (HELM == "wood") {
		plt_index_default = 3;
	}
	if (HELM == "aqua") {
		plt_index_default = 4;
	}
	if (HELM == "elec") {
		plt_index_default = 5;
	}
	if (HELM == "fire") {
		plt_index_default = 6;
	}
	
	if(ARMS == "x1"){
		charge_level_max = 3;
		G.weapon[WEAPONS.hub_buster].set_shot_limit(3);
		global.weapon[WEAPONS.hub_buster].code = player_exe_x_buster_x1;
	}
	if(ARMS == "x2"){
		charge_level_max = 4;
		G.weapon[WEAPONS.hub_buster].set_shot_limit(3);
		global.weapon[WEAPONS.hub_buster].code = player_exe_x_buster_x2;
	}
	if(ARMS == "x3"){
		charge_level_max = 4;
		G.weapon[WEAPONS.hub_buster].set_shot_limit(3);
		global.weapon[WEAPONS.hub_buster].code = player_exe_x_buster_x3;
	}
}
