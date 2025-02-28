function player_exe_animation() {
	
	animation_add("intro",
	[
		0, 1,
		2, 2,
		4, 3,
		6, 4,
		8, 5,
		10, 6,
		12, 7,
		14, 8,
		16, 9,
		18, 10,
		20, 11,
		22, 12,
		24, 13,
		26, 14,
		28, 15,
		30, 16,
		32, 17,
		34, 17
	]);
	
	animation_add("intro2_end",
	[
		0, 17,
		1, 17
	]);

	animation_add("jump",
	[
		0, 0,
		2, 1,
		4, 2
	], 5);

	animation_add("fall|jump",
	[
	    0, 2,
	    3, 3,
	    7, 4
	], 7);

	animation_add("land|jump",
	[
		0, 5,
		2, 6,
		3, 6
	]);

	animation_add("walk", 
	[
		0, 0,
		3, 1,
		6, 2,
		9, 3,
		13, 4,
		16, 5,
		20, 6,
		23, 7,
		27, 8,
		31, 1
	], 3, 31);

	animation_add("wall_slide|wall",
	[
		0, 0,
		3, 1,
		6, 2
	], 6);

	animation_add("wall_jump|wall",
	[
		0, 3,
		3, 4
	], 3);
	
	animation_add("crouch",
	[
		0, 0,
		2, 1,
		4, 2,
	], 4);

	animation_add("crouch_end|crouch",
	[
		0, 1,
		1, 0,
		2, 0
	]);
	
	animation_add("tp|intro",
	[
		0, 0
	], 0);

	animation_add("complete", [
		0, 0,
		57, 0
	]);

	animation_add("outro", [
		0, 0,
		3, 1,
		6, 2,
		8, 3
	]);

	animation_add("intro2_end",
	[
		0, 0,
		4, 1,
		29, 1
	]);

	animation_add("idle", 
	[
		0, 0,
		80, 1,
		84, 2,
		92, 1,
		96, 0,
		144, 1,
		148, 2,
		152, 1,
		156, 0,
		160, 1,
		164, 2,
		168, 1
	], 0, 171);

	animation_add("critical|idle",
	[
		0, 5,
		10, 0,
		20, 4,
		30, 0,
		40, 5,
		50, 0,
		60, 4,
		70, 0,
		80, 5,
		90, 0,
		100, 4,
		110, 1,
		112, 2,
		118, 1,
		119, 1
	], 0, 119);

	animation_add("dash",
	[
		0, 0,
		3, 1,
	], 3);

	animation_add("dash_end|dash",
	[
		0, 0
	], 0);

	animation_add("wall_slide|wall",
	[
		0, 0,
		3, 1,
		6, 2
	], 6);

	animation_add("wall_jump|wall",
	[
		0, 3,
		3, 4
	], 3);

	animation_add("dash_up",
	[
		0, 0,
		2, 1,
		5, 2,
		8, 3,
		16, 4,
		18, 5,
		20, 6
	], 20);

	animation_add("dash_up_end|dash_up",
	[
		0, 5,
		2, 4
	], 2);

	animation_add("dolor",
	[
		0, 0,
		3, 1,
		5, 2,
		7, 3,
		9, 4,
		11, 5,
		13, 6,
		15, 7,
		17, 8,
		21, 9,
		22, 1,
		30, 0,
		32, 0
	]);

	animation_add("death|dolor", [
		0, 0
	]);

	animation_add("dolor2",
	[
		0, 0,
		3, 1,
		5, 1,
		7, 2,
		9, 1,
		11, 2,
		13, 1,
		15, 2,
		17, 1,
		21, 2,
		22, 1,
		30, 0,
		32, 0
	]);
	
	animation_add("energy_drain|dolor",
	[
		0, 0,
		8, 1,
		31, 1
	], 0, 31);

	animation_add("shoot",
	[
		0, 0,
		4, 1
	], 4);
	
	animation_add("open_arms|giga",
	[
		0, 0,
		4, 1,
		8, 6
	], 8);

	animation_add("open_arms_air|giga",
	[
		0, 3,
		4, 4,
		8, 6
	], 8);
}
