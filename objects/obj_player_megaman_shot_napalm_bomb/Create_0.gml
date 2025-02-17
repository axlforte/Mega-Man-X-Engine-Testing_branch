event_inherited();
sound = snd_megaman_shot_2;
anti_destroy = true;
anti_destroy_limit = 3;

abs_hspeed = 3;
atk = 4;
can_hit = false;
grav = 0.2;
ground_bounces = 4;
fuse_timer = 70;
boom_index = 0;
// Start
animation_add("S",
[
	0, 0
], 0);
// Loop
animation_add("L", keyframes_generate(3, 1/2,, 1));
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

execute_step_in_first_frame = true;