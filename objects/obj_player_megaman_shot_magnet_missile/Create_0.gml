event_inherited();
sound = snd_megaman_shot_2;

abs_hspeed = 0;
atk = 2;

// Start
animation_add("S",
[
	0, 0
], 0);
// Loop
animation_add("L", [0,0,1,1,2,0,3,2,4,0,5,3],0, 6);
// Destroy
animation_add("D", 
[
	0, 4,
	2, 5,
	6, 4,
	9, 4
]);
// Blocked
animation_add("B",
[
	0, 6,
	2, 7,
	4, 6,
	6, 7,
	8, 8,
	10, 9,
	13, 9
]);

animation_play("S");

h_speed = 0;
nyooming = false;
execute_step_in_first_frame = true;