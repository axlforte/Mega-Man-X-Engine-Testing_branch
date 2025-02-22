function player_vent_animation() {
	player_animations();

	animation_add("hover");
	animation_add("fly");

	animation_add("super_shoot",
	[
		0, 0,
		2, 1,
		4, 2,
		12, 3,
		23, 4,
		33, 5,
		36, 6
	], 36);
	
	animation_add("super_shoot_c",
	[
		0, 0,
		4, 1,
		12, 2,
		23, 3,
		33, 4,
		36, 5
	], 36);
	
	animation_add("dash",
	[
		0, 0,
		2, 1,
		5, 2,
	], 6);

	animation_add("dash_end|dash",
	[
		0, 1,
		2, 0
	], 2);
	
	animation_add("walk", 
	[
		0, 0,
		5, 1,
		7, 2,
		10, 3,
		13, 4,
		16, 5,
		19, 6,
		22, 7,
		25, 8,
		28, 9,
		31, 10,
		34, 1
	], 5, 34);
	
	/*animation_add("walk", 
	[
		0, 0,
		5, 1,
		6, 2,
		8, 3,
		11, 4,
		14, 5,
		17, 6,
		19, 7,
		21, 8,
		24, 9,
		27, 10,
		30, 1
	], 5, 30);*/
	
	animation_add("jump",
	[
		0, 6,
		2, 0,
		5, 1,
	], 6);

	animation_add("fall|jump",
	[
	    0, 1,
	    3, 2,
	    7, 3
	], 7);

	animation_add("land|jump",
	[
		0, 4,
		2, 5,
		3, 6
	]);

	animation_add("wall_slide|wall",
	[
		0, 0,
		2, 1,
		5, 2,
		8, 3
	], 9);

	animation_add("wall_jump|wall",
	[
		0, 4,
		3, 5,
		6, 6
	], 6);

	animation_add("crouch",
	[
		0, 0,
		2, 1,
		4, 2
	], 5);

	animation_add("crouch_end|crouch",
	[
		0, 1,
		1, 0
	]);
	
	animation_add("intro2",
	[
	    0, 1,
	    2, 2,
	    4, 3,
	    10, 4,
	    14, 5,
	    16, 6,
	    23, 7,
	    25, 6,
	    27, 8,
	    30, 9
	]);
	
	animation_add("intro2_end",
	[
		0, 0,
		24, 1,
		29, 1
	]);
	
	//zero additions
	animation_add("atk_1",
	[
		0, 0,
		1, 1,
		2, 2,
		3, 3,
		4, 4,
		5, 5,
		6, 6,
		9, 7,
		10,7
	]);

	animation_add("atk_1_end|atk_1",
	[
		0, 8,
		6, 9
	]);

	animation_add("atk_2",
	[
		0, 0,
		2, 1,
		3, 2,
		5, 3,
		7, 4,
		8, 5,
		9, 6,
		11, 7,
		13, 8,
		15, 8
	]);

	animation_add("atk_2_end|atk_2",
	[
		0, 8,
		1, 9,
		6, 9
	]);

	animation_add("atk_3",
	[
		0, 0,
		1, 1,
		2, 2,
		3, 1,
		4, 0,
		5, 3,
		6, 4,
		8, 5,
		9, 6,
		10, 7,
		16, 8,
		18, 9,
		20, 10,
		21, 10
	]);

	animation_add("atk_3_end|atk_3",
	[
		0, 11,
		3, 12,
		6, 12
	]);

	animation_add("atk_jump",
	[
		0, 0,
		1, 1,
		2, 2,
		4, 3,
		6, 4,
		8, 5,
		12, 6,
		14, 7,
		15, 7
	]);

	animation_add("atk_jump_end|atk_jump",
	[
		0, 8,
		1, 8
	]);

	animation_add("atk_land",
	[
		0, 0,
		1, 1,
		2, 2,
		4, 3,
		6, 4,
		8, 5,
		12, 6,
		14, 7,
		15, 7
	]);

	animation_add("atk_land_end|atk_land",
	[
		0, 8,
		1, 8
	]);

	animation_add("atk_wall",
	[
		0, 0,
		1, 1,
		3, 2,
		5, 3,
		7, 4,
		9, 5,
		10, 6
	]);

	animation_add("atk_wall_end|atk_wall",
	[
		0, 7,
		3, 8
	]);
	
	animation_add("atk_dash",
	[
		0, 0,
		1, 1,
		3, 2,
		5, 3,
		7, 4,
		9, 5,
		10, 6
	]);

	animation_add("atk_dash_end|atk_dash",
	[
		0, 7,
		3, 8
	]);

	//x remnants
	animation_add("shoryuken",
	[
		0, 0,
		2, 1,
		4, 2,
		6, 3,
		9, 4,
		11, 4
	], 6, 11);
	
	animation_add("shoryuken_fall|shoryuken",
	[
		0, 5,
		2, 6,
		3, 6
	], 3);
	
	animation_add("shoryuken_end|shoryuken",
	[
		0, 8,
		5, 8
	]);
	// Alt Shoryuken (from X2)
	animation_add("shoryuken2",
	[
		0, 0,
		6, 1,
		8, 2,
		10, 3,
		11, 3
	], 6, 11);
	
	animation_add("shoryuken2_fall|shoryuken2",
	[
		0, 4
	], 0);
	
	animation_add("shoryuken2_end|shoryuken2",
	[
		0, 5,
		5, 5
	]);

	animation_add("hadouken", 
	[
		0, 0,
		6, 1,
		17, 2
	], 17);

	animation_add("hadouken_air", animations_frames[? "hadouken"], 17);

	animation_add("nova_strike",
	[
		0, 0,
		2, 1,
		4, 2,
		8, 3,
		10, 4,
		12, 5,
		13, 6,
		14, 7,
		15, 8
	], 12, 15);

	animation_add("tatsumaki", keyframes_generate(6, 1 / 3));
	animation_add_loop("tatsumaki");

	animation_add("tatsumaki2", animations_frames[? "tatsumaki"]);
	animation_add_loop("tatsumaki2");

	animation_add("ceil",
	[
		0, 0,
		4, 1,
		8, 2,
		12, 3
	], 12);

	animation_add("ceil_shot",
	[
		0, 0,
		8, 1,
		16, 2
	], 16);

	// Saber
	animation_add("atk3",
	[
		0, 0,
		1, 1,
		2, 2,
		3, 3,
		4, 4,
		6, 5,
		7, 6,
		8, 7,
		9, 8,
		11, 9,
		12, 10,
		16, 11,
		19, 11
	]);

	animation_add("atk3_end|atk3",
	[
		0, 12,
		6, 13,
		10, 14,
		14, 15,
		17, 0,
		21, 0
	]);

	animation_add("atk_jump",
	[
		0, 0,
		1, 1,
		2, 2,
		4, 3,
		6, 4,
		8, 5,
		11, 5
	]);

	animation_add("atk_jump_end|atk_jump",
	[
		0, 6,
		2, 7,
		4, 8
	]);

	animation_add("atk_land",
	[
		0, 0,
		1, 1,
		2, 2,
		4, 3,
		6, 4,
		8, 5,
		11, 5
	]);

	animation_add("atk_land_end|atk_land",
	[
		0, 6,
		2, 7,
		4, 8
	]);

	// Giga
	animation_add("giga",
	[
		0, 0,
		4, 1,
		6, 2,
		7, 2
	], 4, 7);

	animation_add("giga_air|giga",
	[
		0, 3,
		4, 4,
		6, 5,
		7, 5
	], 4, 7);

	animation_add("giga_loop|giga",
	[
		0, 6,
		2, 7,
		3, 7
	], 0, 3);

	animation_add("giga_end|giga",
	[
		0, 0,
		2, 0,
	]);


	animation_add("giga_end_air|giga",
	[
		0, 3,
		2, 3
	]);



}
