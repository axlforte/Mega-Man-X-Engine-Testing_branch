function player_exe_variables() {
	enum chip_types {
		none,
		armor,
		heal,
		saber,
		invis,
		gauge_speed
	}
	
	player_weapon_set(0, WEAPONS.hub_buster);
	player_weapon_select(WEAPONS.hub_buster);
	
	player_special_weapons_add(states.custom_screen);
	player_special_weapons_add(states.custom_chips);
	can_use_chip = true;

	// Charge
	charge_unlocked = true;

	// Mobile buttons
	mobile_buttons_set_sprite(spr_x_mobile_buttons);
	mobile_weapon_swap_set_sprites(spr_mobile_weapon1, spr_mobile_weapon2);
	glow_circle_subtract = [
		{alpha: 0.2, radius: 42 },
		{alpha: 1, radius: 30 }
	];
	trail_color = c_blue;
	intro_end_animation = "";
	player_chip_information();
}

function player_chip_information(){
	// limits 30
	/*Canon
Bomb
Sword
Shockwave
Quake
Dash
Ratton
Ring Zap
Drain
Mett Guard
vulcan
airshot
Invis
Long gauge
Short gauge*/
	chip_library = [];
	chip_library[0]  = new Chip("cannon",  "a",3,chip_types.none,obj_player_x_shot_x3_3,1,0);
	chip_library[1]  = new Chip("cannon",  "a",3,chip_types.none,obj_player_x_shot_x3_3,1,0);
	chip_library[2]  = new Chip("sword",   "s",3,chip_types.saber,obj_player_x_shot_x3_3,4,6);
	chip_library[3]  = new Chip("sword",   "s",3,chip_types.saber,obj_player_x_shot_x3_3,4,6);
	chip_library[4]  = new Chip("Shokwave","s",3,chip_types.none,obj_player_x_shot_x2_3,5,5);
	chip_library[5]  = new Chip("Shokwave","s",3,chip_types.none,obj_player_x_shot_x2_3,5,5);
	chip_library[6]  = new Chip("Quake",   "q",3,chip_types.none,obj_player_x_shot_x1_3,6);
	chip_library[7]  = new Chip("Dash",    "d",3,chip_types.none,obj_player_x_shot_x3_super2,23,4);
	chip_library[8]  = new Chip("Dash",    "d",3,chip_types.none,obj_player_x_shot_x3_super2,23,4);
	chip_library[9]  = new Chip("hiboomer","b",3,chip_types.none,obj_player_megaman_shot_rolling_cutter,8,16);
	chip_library[10] = new Chip("hiboomer","b",3,chip_types.none,obj_player_megaman_shot_rolling_cutter,8,16);
	chip_library[11] = new Chip("ring zap","e",3,chip_types.none,obj_player_megaman_shot_thunder_wave_horizontal,9,3);
	chip_library[12] = new Chip("metguard","s",3,chip_types.none,obj_player_megaman_shot_skull_barrier,7,7);
	chip_library[13] = new Chip("metguard","s",3,chip_types.none,obj_player_megaman_shot_skull_barrier,7,7);
	chip_library[14] = new Chip("heal1",   "l",3,chip_types.heal,1,22,9);
	chip_library[15] = new Chip("vulcan",  "a",3,chip_types.none,obj_player_megaman_shot_needle_cannon,3,2);
	chip_library[16] = new Chip("vulcan",  "a",3,chip_types.none,obj_player_megaman_shot_needle_cannon,3,2);
	chip_library[17] = new Chip("airshot", "*",3,chip_types.none,obj_player_megaman_shot_air_shooter,2,1);
	chip_library[18] = new Chip("airshot", "*",3,chip_types.none,obj_player_megaman_shot_air_shooter,2,1);
	chip_library[19] = new Chip("invis",   "*",3,chip_types.invis,30,11,11);
	chip_library[20] = new Chip("invis",   "*",3,chip_types.invis,30,11,11);
	chip_library[21] = new Chip("fstgauge","*",3,chip_types.gauge_speed,3,13,10);
	chip_library[22] = new Chip("fstgauge","*",3,chip_types.gauge_speed,3,13,10);
	chip_library[23] = new Chip("slowgage","*",3,chip_types.gauge_speed,7,12,10);
	chip_library[24] = new Chip("maxgauge","m",3,chip_types.gauge_speed,0.2,14,10);
	chip_library[25] = new Chip("ligtarms","x",3,chip_types.armor,"x1",17,13);
	chip_library[26] = new Chip("gigaarms","x",3,chip_types.armor,"x2",17,14);
	chip_library[27] = new Chip("maxarms" ,"x",3,chip_types.armor,"x3",17,15);
	chip_library[28] = new Chip("varibles","x",3,chip_types.none,obj_player_x_saber_wave,16,13);
	chip_library[29] = new Chip("rouges",  "s",3,chip_types.none,obj_player_x_shot_ult_super,16,15);
	
	chip_selection = [];
	avail_chips = [];
	cust_max = 10;
	
	global.weapon[WEAPONS.hub_buster].refill_rate = ((28/60) / 5);
}

function Chip() constructor
{
    name =       (argument_count > 0 ? argument[0] : "New Chip");//lim 8 characters for authenticity
	code =       (argument_count > 1 ? argument[1] : "a");//a - z, and *
	damage =     (argument_count > 2 ? argument[2] : 4);//visual information for cust screen
	type =       (argument_count > 3 ? argument[3] : chip_types.none);//elec,fire,etc. for cust info
	projectile = (argument_count > 4 ? argument[4] : obj_player_x_shot_1);
	image =      (argument_count > 5 ? argument[5] : 0);//image in cust screen
	preview =    (argument_count > 6 ? argument[6] : 0);//image in cust screen
}