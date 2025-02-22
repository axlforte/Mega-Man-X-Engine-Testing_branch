event_inherited();

destroy_if_hit = true;
atk = 10;
// Destroy Animation
animation_add("D",
[
	0, 1,
	2, 2,
	4, 3,
	5, 3
]);

// Blocked Animation
animation_add("B",
[
	0, 6,
	5, 7,
	10, 8,
	15, 9,
	20, 8,
	25, 7,
	30, 6
], 0, 30);

animation_play("B");
sound = snd_megaman_shot_1;
abs_hspeed = 4;
dash_enabled = true;
execute_step_in_first_frame = true;
physics_ignore_frame = 1;
blocked_reflect = true;
destroy_reset_speed = false;