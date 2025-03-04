function player_check_custom_chips() {
	if key_p_shoot2 && array_length(chip_selection) > 0 && state != states.capsule{
		if(chip_selection[0].type = chip_types.none){
			player_shoot_projectile(chip_selection[0].projectile);
			instance_create_depth(x,y,depth - 1,obj_player_exe_buster);
		} else if(chip_selection[0].type = chip_types.saber){
			player_shoot_projectile(chip_selection[0].projectile);
			instance_create_depth(x,y,depth - 1,obj_player_exe_buster);
		} else if(chip_selection[0].type = chip_types.heal){
			hp += chip_selection[0].projectile;
		} else if(chip_selection[0].type = chip_types.gauge_speed){
			global.weapon[WEAPONS.hub_buster].refill_rate = ((28/60) / chip_selection[0].projectile);
		} else if(chip_selection[0].type = chip_types.invis){
			player_activate_immunity(immunity_types.dolor);
		} else if(chip_selection[0].type = chip_types.armor){
			G.player_character_armor[pl_char.exe][3] = chip_selection[0].projectile;
			script_try(armor_script);
		} else {
			player_shoot_projectile(obj_player_x_shot_1);
			instance_create_depth(x,y,depth - 1,obj_player_exe_buster);
		}
		array_delete(chip_selection,0,1)
	}
}
